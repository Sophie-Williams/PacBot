#include "Sensors.h"
#include <stdio.h>

Sensors::Sensors(GameControl& gameControl) :
		gameControl(gameControl)
{
	for (int i = 0; i < 4; i++)
	{
		sonar[i] = 0;
		ir[i] = 0;
	}
	contact = false;
	ghostFound = false;
	ghostPos = 0;
	ghostDistance = 0;
	ghostBlobWidth = 0;
	ghostBlobHeight = 0;
	horizon = 0;
	timeToEscapeGhost = 0;
	rfidPriority = 0;
	oldRFIDNumber = 0;
	newRFIDNumber = 0;
}

void Sensors::sonarCallBack(const Echoes::Sonar& msg)
{
	sonar[NORTH] = msg.north;
	sonar[SOUTH] = msg.south;
	sonar[EAST] = msg.east;
	sonar[WEST] = msg.west;
}

void Sensors::irCallBack(const Echoes::IR& msg)
{
	ir[NORTHRIGHT] = msg.northRight;
	ir[NORTHLEFT] = msg.northLeft;
	ir[EAST] = msg.east;
	ir[WEST] = msg.west;
}

void Sensors::btCallBack(const PhantomRobot::PhantomMsg& msg)
{
	contact = msg.contact == 1 ? true : false;
}

void Sensors::videoCallBack(const Vision::Results& msg)
{
	ghostFound = msg.ghostFound;
	ghostPos = msg.ghostPos;
	ghostDistance = msg.ghostDistance;
	ghostBlobHeight = msg.ghostBlobHeight;
	ghostBlobWidth = msg.ghostBlobWidth;
	if (ghostFound && ghostBlobHeight > 45)
	{
		startEscapingFromGhost = clock();
		if (ir[EAST] > 1000 && ir[WEST] > 1000)
		{
			timeToEscapeGhost = 5;
		}
		else
		{
			timeToEscapeGhost = 3;
		}
	}
}

bool Sensors::getContact()
{
	return contact;
}

int Sensors::getSonar(int i)
{
	return sonar[i];
}

int Sensors::getIR(int i)
{
	return ir[i];
}

void Sensors::rfidCallBack(const Echoes::Rfid& msg)
{
	rfid = msg.id.c_str();
	cout << rfid << endl;

	if (gameControl.isEaten(rfid))
	{
		std::cout << rfid << " already eaten." << std::endl;
	}
	else
		gameControl.eatPacDot(rfid);

	newRFIDPriority = clock();
	rfidPriority = gameControl.getPriority(rfid);
	if (gameControl.finishedPacDots())
		std::cout << "Finished Pac Dots." << std::endl;

	//Set the horizon
	newRFIDNumber = gameControl.getNumber(rfid);
	this->setHorizon(oldRFIDNumber, newRFIDNumber);
	if (oldRFIDNumber != newRFIDNumber)
		oldRFIDNumber = gameControl.getNumber(rfid);
}

int Sensors::calculateRFIDPriority(int priority)
{
	if (horizon == NORTH)
	{
		if (priority == LEFT)
			return AHEAD;
		else if (priority == RIGHT)
			return BACKWARDS;
		else if (priority == AHEAD)
			return RIGHT;
		else if (priority == BACKWARDS)
			return LEFT;
		else
			return AHEAD;
	}
	else if (horizon == SOUTH)
	{
		if (priority == LEFT)
			return BACKWARDS;
		else if (priority == RIGHT)
			return AHEAD;
		else if (priority == AHEAD)
			return LEFT;
		else if (priority == BACKWARDS)
			return RIGHT;
		else
			return AHEAD;
	}
	else if (horizon == EAST)
	{
		return priority;
	}
	else if (horizon == WEST)
	{
		if (priority == LEFT)
			return RIGHT;
		else if (priority == RIGHT)
			return LEFT;
		else if (priority == AHEAD)
			return BACKWARDS;
		else if (priority == BACKWARDS)
			return AHEAD;
		else
			return AHEAD;
	}
	else
		return AHEAD;
}

void Sensors::setHorizon(int oldNumber, int newNumber)
{
	if (newNumber == oldNumber + 1)
	{
		horizon = EAST;
	}
	else if (newNumber == oldNumber - 1)
	{
		horizon = WEST;
	}
	else if (newNumber == 6 && oldNumber == 2)
	{
		horizon = WEST;
	}
	else if (newNumber == 3 && oldNumber == 1)
	{
		horizon = EAST;
	}
	else if (newNumber == 2 && oldNumber == 6)
	{
		horizon = WEST;
	}
	else if (newNumber == 1 && oldNumber == 3)
	{
		horizon = EAST;
	}
	else if (newNumber == 7 && oldNumber == 11)
	{
		horizon = EAST;
	}
	else if (newNumber == 11 && oldNumber == 7)
	{
		horizon = EAST;
	}
	else if (newNumber == 12 && oldNumber == 10)
	{
		horizon = WEST;
	}
	else if (newNumber == 10 && oldNumber == 12)
	{
		horizon = WEST;
	}
	else if (newNumber == oldNumber + 3 || newNumber == oldNumber + 4)
	{
		horizon = SOUTH;
	}
	else if (newNumber == oldNumber - 3 || newNumber == oldNumber - 4)
	{
		horizon = NORTH;
	}
}

int Sensors::getRFIDPriority()
{
	if (100 * (clock() - newRFIDPriority) / (double) CLOCKS_PER_SEC > 1)
		return 0;
	return this->calculateRFIDPriority(this->rfidPriority);
}

bool Sensors::isGhostFound()
{
	return this->ghostFound;
}

int Sensors::getGhostBlobHeight()
{
	return this->ghostBlobHeight;
}

bool Sensors::isEscapingFromGhost()
{
	double durationOfEscape = 100 * (clock() - startEscapingFromGhost)
			/ (double) CLOCKS_PER_SEC;
	if (durationOfEscape > timeToEscapeGhost)
		return false;
	return true;
}
