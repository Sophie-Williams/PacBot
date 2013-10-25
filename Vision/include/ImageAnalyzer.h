#ifndef IMAGEANALYZER_H_
#define IMAGEANALYZER_H_

#include "Vision/Results.h"

#include "ColorClassifier.h"
#include "ColorDataset.h"
#include "Blob.h"
#include "PixelMap.h"

#include "BlobBuffer.h"
#include "MovingAverageFilter.h"
#include "DistanceCalculator.h"

#define GHOST_CLASS 'R'

#define MIN_BLOB_SIZE 200
#define MIN_BLOB_RATIO 0.17
#define MAX_BLOB_RATIO 1.00

class ImageAnalyzer
{
	private:
		KnnColorClassifier* cc;
		ColorDataset* cd;
		BlobBuffer ghost_buffer;
		MovingAverageFilter ghostwidth_filter;
		MovingAverageFilter ghostheight_filter;
		DistanceCalculator distanceCalculator;
	public:
		ImageAnalyzer(KnnColorClassifier* cc, ColorDataset* cd);
		Vision::Results analyze(cv::Mat& img);
	private:
		void findObjects(cv::Mat& img);
		Vision::Results composeMessage();
		bool checkShape(int width, int height);
};

#endif /* IMAGEANALYZER_H_ */
