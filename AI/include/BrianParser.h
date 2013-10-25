#ifndef BrianParser_H
#define BrianParser_H
#include <stdio.h>
#include <cstdio>
#include <ctime>
#include "brian.h"
#include "Sensors.h"
#include "std_msgs/String.h"
#include <cstdlib>

#define FUZZYASSOC (char *) "../config/ctof.txt"
#define FUZZYSHAPES (char *) "../config/shape_ctof.txt"
#define PRIES (char *) "../config/Predicate.ini"
#define PRIESACTIONS (char *) "../config/PredicateActions.ini"
#define CANDOES (char *) "../config/Cando.ini"
#define BEHAVIORS (char *) "../config/behaviour.txt"
#define WANTERS (char *) "../config/Want.ini"
#define DEFUZZYASSOC (char *) "../config/s_ftoc.txt"
#define DEFUZZYSHAPES (char *) "../config/s_shape.txt"
#define NORTHRIGHT 0
#define NORTHLEFT 1
#define NORTH 0
#define SOUTH 1
#define EAST 2
#define WEST 3
#define LEFT -1
#define RIGHT 1
#define AHEAD 0
#define BACKWARDS 5

using namespace std;

class BrianParser
{
	private:
		MrBrian* brian;
		GameControl& gameControl;
		Sensors& sensor;
		int tanSpeed;
		int rotSpeed;
		int timer, randomValue;
		int blockedTime;
		int priority;
		void askBrian();
		void brianAnswer();

	public:
		BrianParser(GameControl& gameControl, Sensors& sensor);
		int getTanSpeed();
		int getRotSpeed();
		void go();
		~BrianParser();
};


#endif
