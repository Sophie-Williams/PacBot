/*
 * IRProcesser.h
 *
 *  Created on: Jul 8, 2013
 *      Author: mikel
 */

#ifndef IRPROCESSER_H_
#define IRPROCESSER_H_

#include "Processer.h"
#include "ros/ros.h"
#include "Echoes/IR.h"
#include "MovingAverageFilter.h"

class IRProcesser: public Processer {
	public:
		IRProcesser(ros::Publisher pub);
		void process(std::string str);
	private:
		ros::Publisher ir_data_pub;
		MovingAverageFilter northRight;
		MovingAverageFilter northLeft;
		MovingAverageFilter east;
		MovingAverageFilter west;
		void publishLast();
};

#endif /* IRPROCESSER_H_ */
