/*
 * GameControl.h
 *
 *  Created on: Aug 5, 2013
 *      Author: mikel
 */

#ifndef GAMECONTROL_H_
#define GAMECONTROL_H_

#include <iostream>
#include <cstdio>
#include <ctime>
#include "PacDotRep.h"
using namespace std;

class GameControl {
public:
	GameControl();
	void eatPacDot(string rfidCode);
	bool isSuperMode();
	bool isEaten(string rfidCode);
	bool finishedPacDots();
	int getPriority(string rfidCode);
	void loadStrategy();

private:
	bool superMode;
	PacDotRep pacDotRep;
	std::clock_t startSuperMode;
};

#endif /* GAMECONTROL_H_ */
