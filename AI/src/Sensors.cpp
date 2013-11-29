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
	horizon = EAST;
	timeToEscapeGhost = 0;
	rfidPriority = AHEAD;
	oldRFIDNumber = 0;
	newRFIDNumber = 1;
	newRFIDPriority = clock();
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

	if (!gameControl.isEaten(rfid))
		gameControl.eatPacDot(rfid);

	newRFIDPriority = clock();
	rfidPriority = gameControl.getPriority(rfid);

	//Set the horizon
	newRFIDNumber = gameControl.getNumber(rfid);
	this->setHorizon(oldRFIDNumber, newRFIDNumber);

	//update the old rfid number
	oldRFIDNumber = gameControl.getNumber(rfid);

	cout << "OldRFIDNumber: " << oldRFIDNumber << "\n" <<
			"NewRFIDNumber: " << newRFIDNumber << "\n" <<
			"Horizon: " << horizon << "\n" <<
			"Priority on the card: " << rfidPriority << "\n" <<
			"Priority to be sent: " << this->getRFIDPriority() << endl;
}

Priority Sensors::calculateRFIDPriority(Priority priority)
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
	if (oldNumber == 0)
		horizon = EAST;

	if (oldNumber == 1 && newNumber == 5)
		horizon = SOUTH;
	else if (oldNumber == 1 && newNumber == 2)
		horizon = SOUTH;
	else if (oldNumber == 1 && newNumber == 3)
		horizon = SOUTH;
	else if (oldNumber == 2 && newNumber == 1)
		horizon = EAST;
	else if (oldNumber == 2 && newNumber == 3)
		horizon = EAST;
	else if (oldNumber == 2 && newNumber == 6)
		horizon = EAST;
	else if (oldNumber == 3 && newNumber == 2)
		horizon = WEST;
	else if (oldNumber == 3 && newNumber == 4)
		horizon = EAST;
	else if (oldNumber == 3 && newNumber == 1)
		horizon = NORTH;
	else if (oldNumber == 4 && newNumber == 3)
		horizon = WEST;
	else if (oldNumber == 4 && newNumber == 5)
		horizon = EAST;
	else if (oldNumber == 4 && newNumber == 6)
		horizon = SOUTH;
	else if (oldNumber == 5 && newNumber == 4)
		horizon = WEST;
	else if (oldNumber == 5 && newNumber == 1)
		horizon = WEST;
	else if (oldNumber == 5 && newNumber == 6)
		horizon = WEST;
	else if (oldNumber == 6 && newNumber == 2)
		horizon = NORTH;
	else if (oldNumber == 6 && newNumber == 4)
		horizon = NORTH;
	else if (oldNumber == 6 && newNumber == 5)
		horizon = NORTH;
}

int Sensors::getRFIDPriority()
{
	if (100 * (clock() - newRFIDPriority) / (double) CLOCKS_PER_SEC > 2)
		return 0;
	else if (100 * (clock() - startEscapingFromGhost) / (double) CLOCKS_PER_SEC < 20)
		return 0;
	Priority priorityToReturn = this->calculateRFIDPriority(this->rfidPriority);
	switch (priorityToReturn)
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
	return 0;
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
