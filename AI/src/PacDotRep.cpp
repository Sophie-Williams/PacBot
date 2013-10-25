/*
 * PacDotRep.cpp
 *
 *  Created on: Jul 30, 2013
 *      Author: mikel
 */

#include "PacDotRep.h"

PacDotRep::PacDotRep()
{
	loadStrategy();
}

void PacDotRep::loadStrategy()
{
	pacDotMap.clear();
	ifstream rfidCardsFH;
	string filename;
	int randomValue = rand() % 3;

	switch(randomValue)
	{
	case 0:
		filename = "cards.txt";
		break;
	case 1:
		filename = "cards1.txt";
		break;
	default:
		filename = "cards2.txt";
		break;
	}

	rfidCardsFH.open(filename.c_str());

	string token1;
	string token2;
	string token3;
	unsigned int size;

	rfidCardsFH >> size;
	for (int i = 0; i < size; i++)
	{
		rfidCardsFH >> token1;
		rfidCardsFH >> token2;
		rfidCardsFH >> token3;

		bool isBigDot = token2 == "true" ? true : false;
		Priority priority;
		if (token3 == "RIGHT")
			priority = RIGHT;
		else if (token3 == "LEFT")
			priority = LEFT;
		else if (token3 == "AHEAD")
			priority = AHEAD;
		else priority = BACKWARDS;
		PacDot pacDot(token1, isBigDot, priority);
		pacDotMap.insert(std::pair<PacDot, bool>(pacDot, false));
	}
	rfidCardsFH.close();
}

std::map<PacDot, bool> PacDotRep::getMap()
{
	return this->pacDotMap;
}

PacDot PacDotRep::getPacDot(string rfidCode)
{
	PacDot dot;
	std::map<PacDot, bool>::iterator it;
	for (it = this->pacDotMap.begin(); it != this->pacDotMap.end(); ++it)
	{
		if ((it->first).getRfidCode() == rfidCode)
		{
			dot = it->first;
			break;
		}
	}
	return dot;
}

void PacDotRep::eatPacDot(string rfidCode)
{
	std::map<PacDot, bool>::iterator it;
	for (it = this->pacDotMap.begin(); it != this->pacDotMap.end(); ++it)
	{
		if ((it->first).getRfidCode() == rfidCode)
		{
			it->second = true;
			break;
		}
	}
}

bool PacDotRep::isEaten(string rfidCode)
{
	std::map<PacDot, bool>::iterator it;
	for (it = this->pacDotMap.begin(); it != this->pacDotMap.end(); ++it)
	{
		if ((it->first).getRfidCode() == rfidCode)
			return it->second;
	}
	return false;
}

bool PacDotRep::finishedPacDots()
{
	std::map<PacDot, bool>::iterator it;
	for (it = this->pacDotMap.begin(); it != this->pacDotMap.end(); ++it)
	{
		if (!it->second)
			return false;
	}
	return true;
}

PacDotRep::~PacDotRep()
{
}
