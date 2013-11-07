/*
 * PacDotRep.h
 *
 *  Created on: Jul 30, 2013
 *      Author: mikel
 */

#ifndef PACDOTREP_H_
#define PACDOTREP_H_

#include <iostream>
#include <stdlib.h>
#include <map>
#include "PacDot.h"
#include <fstream>
using namespace std;

class PacDotRep {
public:
	PacDotRep();
	std::map<PacDot, bool> getMap();
	PacDot getPacDot(string rfidCode);
	void eatPacDot(string rfidCode);
	bool isEaten(string rfidCode);
	bool finishedPacDots();
	void loadStrategy();
	~PacDotRep();
private:
	std::map<PacDot, bool> pacDotMap;
	void printMap();

};

#endif /* PACDOTREP_H_ */
