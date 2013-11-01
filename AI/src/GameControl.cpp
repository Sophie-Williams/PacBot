/*
 * GameControl.cpp
 *
 *  Created on: Aug 5, 2013
 *      Author: mikel
 */

#include "GameControl.h"

GameControl::GameControl() {
	superMode = false;
}

void GameControl::eatPacDot(string rfidCode)
{
	this->pacDotRep.eatPacDot(rfidCode);
	if ((this->pacDotRep.getPacDot(rfidCode)).isBigDot())
	{
		this->superMode = true;
		this->startSuperMode = std::clock();
	}
}

bool GameControl::isSuperMode()
{
	// Super Mode duration is 5 sec
	if (this->superMode == true)
	{
		double durationOfSuperMode = (std::clock() - this->startSuperMode) / (double)CLOCKS_PER_SEC;
		if (durationOfSuperMode > 5)
		{
			this->superMode = false;
			return false;
		}
		else return true;
	}
	else return false;
}

bool GameControl::isEaten(string rfidCode)
{
	return this->pacDotRep.isEaten(rfidCode);
}

bool GameControl::finishedPacDots()
{
	return this->pacDotRep.finishedPacDots();
}

int GameControl::getPriority(string rfidCode)
{
	PacDot pacDot = this->pacDotRep.getPacDot(rfidCode);
	switch (pacDot.getPriority())
	{
	case LEFT:
		return -1;
		break;
	case RIGHT:
		return 1;
		break;
	case AHEAD:
		return 0;
		break;
	case BACKWARDS:
		return 5;
		break;
	default:
		return 0;
		break;
	}
}

void GameControl::loadStrategy()
{
	this->pacDotRep.loadStrategy();
}

int GameControl::getNumber(string rfidCode)
{
	return (pacDotRep.getPacDot(rfidCode)).getNumber();
}
