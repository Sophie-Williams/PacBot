/*
 * PacDot.h
 *
 *  Created on: Jul 30, 2013
 *      Author: mikel
 */

#ifndef PACDOT_H_
#define PACDOT_H_

#include <iostream>
#include <string>
using namespace std;
typedef enum { LEFT, RIGHT, AHEAD, BACKWARDS } Priority;

class PacDot {
public:
	PacDot();
	PacDot(string rfidCode, bool bigDot, Priority priority);
	bool isBigDot() const;
	string getRfidCode() const; //Pacdot becomes const when put in the map
	Priority getPriority() const;
	bool operator<(const PacDot & p1) const;
private:
	bool bigDot;
	string rfidCode;
	Priority priority;

};

#endif /* PACDOT_H_ */
