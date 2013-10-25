/*
 * RoboTower, Hi-CoRG based on ROS
 *
 * Copyright (C) 2012 Politecnico di Milano
 * Copyright (C) 2012 Marcello Pogliani, Davide Tateo
 * Versione 1.0
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 */

#include "ImageAnalyzer.h"

Vision::Results ImageAnalyzer::analyze(cv::Mat& img)
{
	findObjects(img);

	/* draw result on image (debug) */
	BlobInfo* ghost_result = ghost_buffer.lastValidBlob();
	if (ghost_result != NULL && ghost_result->getClass() == GHOST_CLASS)
	{
		cv::rectangle(img, ghost_result->a, ghost_result->b,
				CV_RGB(254,0,0), 2, 8, 0);
	}

	ghostwidth_filter.update(ghost_result != NULL ? ghost_result->getWidth() : 0);
	ghostheight_filter.update(ghost_result != NULL ? ghost_result->getHeight() : 0);
	distanceCalculator.insertGhostData((int)ghostheight_filter.curValue(),
			(int) ghostwidth_filter.curValue());

	return composeMessage();
}

Vision::Results ImageAnalyzer::composeMessage()
{
	Vision::Results msg;

	BlobInfo* ghost = ghost_buffer.lastValidBlob();

	msg.ghostFound = ghost != NULL;
	msg.ghostPos = ghost != NULL ? ghost->getPosition() : 0;

	msg.ghostBlobHeight = (int) ghostheight_filter.curValue();
	msg.ghostBlobWidth = (int) ghostwidth_filter.curValue();

	msg.ghostDistance = distanceCalculator.getGhostDistance();

	return msg;
}

void ImageAnalyzer::findObjects(cv::Mat& img)
{
	/* Point 2D */
	cv::Point pt1, pt2;

	/* Maps needed for BlobAnalysis */
	map < char, map< int,Blob* > >:: iterator BlobsItr1;
	map< int,Blob* > :: iterator BlobsItr2;

	/* initialise classes to store data regarding the found blobs */
	BlobInfo ghost_blob(GHOST_CLASS);

	/* Blob parameters, PixMap object initialisation */
	PixelMap pixmap((unsigned char*)img.data, img.cols, img.rows, cc, 3);

	/* Start blob growing algorithm: parameters from the 2nd to the 5th
	 * identify the region of the image in which blobs are to be searched for
	 * (2nd to 5th params are set to -1 ==> search blobs over the whole image)
	 */
	pixmap.BlobGrowing(1,-1,-1,-1,-1);
	for(BlobsItr1=pixmap.GetBlobs()->begin();BlobsItr1!=pixmap.GetBlobs()->end();BlobsItr1++)
	{
   		for(BlobsItr2 = BlobsItr1->second.begin();BlobsItr2!=BlobsItr1->second.end();BlobsItr2++)
   		{
   			if(BlobsItr2->second->GetValid() && BlobsItr2->second->GetNumPix()>MIN_BLOB_SIZE)
			{
				/* load blob coordinates */
   				/* top left point */
				pt1.x = BlobsItr2->second->GetMinX();
				pt1.y = BlobsItr2->second->GetMaxY();
				/* bottom right point */
				pt2.x = BlobsItr2->second->GetMaxX();
				pt2.y = BlobsItr2->second->GetMinY();

				/* compute width and height to perform some check... */
				int blob_width = pt2.x - pt1.x;
				int blob_heigth = pt1.y - pt2.y;

				/* is the blob shape similar to the expected one? */
				/* save the biggest found blob for each colour class */
				if(BlobsItr1->first == GHOST_CLASS &&
						BlobsItr2->second->GetNumPix() > ghost_blob.getNumPix() &&
						checkShape(blob_width, blob_heigth) )
				{
						ghost_blob.save(BlobsItr2->second->GetNumPix(), pt1, pt2);
				}
			}
   		}
	}

	/* add results to buffer */
	ghost_buffer.addIfPresent(ghost_blob);
}

bool ImageAnalyzer::checkShape(int width, int heigth) {
	// Shape control -> must be rectangular with height > width
	float ratio = ((float) width) / ((float) heigth);
	if (ratio > MIN_BLOB_RATIO && ratio < MAX_BLOB_RATIO)
	{
		return true;
	}
	return false;
}

/*ImageAnalyzer::ImageAnalyzer(KnnColorClassifier* cc, PixelMap* pm, ColorDataset* cd)*/
ImageAnalyzer::ImageAnalyzer(KnnColorClassifier* cc, ColorDataset* cd)
{
	this->cc = cc;
	this->cd = cd;
}
