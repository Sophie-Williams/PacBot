/*
 * main.cpp
 *
 *  Created on: Apr 22, 2013
 *      Author: mikel
 */

#include "BTReader.h"
#include "ros/ros.h"
#include "PhantomRobot/PhantomMsg.h"

int main(int argc, char** argv)
{
	const char* deviceFile = "/dev/ttyS99";
	BTReader btReader(deviceFile);
	// Init ROS
	ros::init(argc, argv, "PhantomRobot");
	ros::NodeHandle ros_node;
	ros::Publisher pub = ros_node.advertise<PhantomRobot::PhantomMsg>("bt_data", 1000);
	while(ros::ok())
	{
		int res = btReader.readData();
		if (res != -1)
		{
			PhantomRobot::PhantomMsg msg;
			msg.contact = btReader.getBuffer() == 1 ? true : false;
			pub.publish(msg);
		}
		ros::spinOnce();
	}
}
