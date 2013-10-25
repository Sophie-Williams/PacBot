/*
 * IRProcesser.cpp
 *
 *  Created on: Jul 8, 2013
 *      Author: mikel
 */

#include "IRProcesser.h"

IRProcesser::IRProcesser(ros::Publisher pub) {
	this->ir_data_pub = pub;
}

void IRProcesser::process(string str)
{
	vector<string> tokens;
	tokenize(str, tokens, ",");
	for(unsigned int i=0; i < tokens.size(); i++)
	{
		const char* t = tokens.at(i).c_str();
		if(t[0] != '\0' && t[1] != '\0')
		{
			int n = atoi(tokens.at(i).c_str() + 2);
			switch(t[0])
			{
			case 'N':
				northRight.update(n);
				break;
			case 'S':
				northLeft.update(n);
				break;
			case 'E':
				east.update(n);
				break;
			case 'W':
				west.update(n);
				break;
			}
		}
	}
	publishLast();
}

void IRProcesser::publishLast()
{
	Echoes::IR msg;
	msg.northRight = (int) northRight.curValue();
	msg.northLeft = (int) northLeft.curValue();
	msg.east = (int) east.curValue();
	msg.west = (int) west.curValue();
	ir_data_pub.publish(msg);
}

