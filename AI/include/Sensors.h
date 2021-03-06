#ifndef SENSORS_H
#define SENSORS_H
#include <stdio.h>
#include <cstdio>
#include <ctime>
#include "Echoes/Sonar.h"
#include "Echoes/IR.h"
#include "Echoes/Rfid.h"
#include "PhantomRobot/PhantomMsg.h"
#include "Vision/Results.h"
#include "std_msgs/String.h"
#include "GameControl.h"

#define NORTHRIGHT 0
#define NORTHLEFT 1
#define NORTH 0
#define SOUTH 1
#define EAST 2
#define WEST 3

using namespace std;

class Sensors
{
	private:
		int sonar[4];
		int ir[4];
		std::string rfid;
		bool contact;
		GameControl gameControl;
		Priority rfidPriority;
		int oldRFIDNumber;
		int newRFIDNumber;
		bool ghostFound;
		int ghostPos;
		int ghostDistance;
		int ghostBlobHeight;
		int ghostBlobWidth;
		int timeToEscapeGhost;
		int horizon;
		clock_t startEscapingFromGhost;
		clock_t newRFIDPriority;
		Priority calculateRFIDPriority(Priority priority);
		void setHorizon(int oldNumber, int newNumber);

	public:
		Sensors(GameControl& gameControl);
		void sonarCallBack(const Echoes::Sonar& msg);
		void rfidCallBack(const Echoes::Rfid& msg);
		void btCallBack(const PhantomRobot::PhantomMsg& msg);
		void irCallBack(const Echoes::IR& msg);
		void videoCallBack(const Vision::Results& msg);
		int getSonar(int i);
		int getIR(int i);
		std::string getRfid();
		bool getContact();
		int getRFIDPriority();
		bool isEscapingFromGhost();
		bool isGhostFound();
		int getGhostBlobHeight();
		bool finishedPacDots();
};

#endif
