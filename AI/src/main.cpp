#include <stdio.h>
#include <stdlib.h>

#include "brian.h"
#include "ros/ros.h"
#include "SpyKee/Motion.h"
#include "Echoes/FixedLed.h"
#include "Echoes/ResetLed.h"
#include "Echoes/BlinkingLed.h"
#include "BrianParser.h"
#include "Sensors.h"
#include "GameControl.h"

int main(int argc, char** argv)
{
	ros::init(argc, argv, "AI");
	ros::NodeHandle ros_node;
	ros::Rate loop_rate(20);

	GameControl gameControl;
	Sensors sensor(gameControl);
	BrianParser parser(gameControl, sensor);
	clock_t startGame = clock();

	ros::Publisher motion = ros_node.advertise<SpyKee::Motion>("spykee_motion", 1000);
	ros::Subscriber sonar_sub = ros_node.subscribe("sonar_data", 1000, &Sensors::sonarCallBack, &sensor);
	ros::Subscriber rfid_sub = ros_node.subscribe("rfid_data", 1000, &Sensors::rfidCallBack, &sensor);
	ros::Subscriber bt_sub = ros_node.subscribe("bt_data", 1000, &Sensors::btCallBack, &sensor);
	ros::Subscriber ir_sub = ros_node.subscribe("ir_data", 1000, &Sensors::irCallBack, &sensor);
	ros::Subscriber video_sub = ros_node.subscribe("vision_results", 1000, &Sensors::videoCallBack, &sensor);

	/*
	ros::ServiceClient redLedClient = ros_node.serviceClient<Echoes::FixedLed>("red_led");
	ros::ServiceClient greenLedClient = ros_node.serviceClient<Echoes::BlinkingLed>("green_led");
	ros::ServiceClient redResetClient = ros_node.serviceClient<Echoes::ResetLed>("reset_led");
	*/

	while(ros::ok())
	{
		parser.go();

		SpyKee::Motion msg;
		msg.tanSpeed = parser.getTanSpeed();
		msg.rotSpeed = parser.getRotSpeed();

		//msg.tanSpeed = 0;
		//msg.rotSpeed = 0;

		/*
		if (gameControl.isSuperMode())
		{
			Echoes::FixedLed service;
			service.request.numOn = 4;
			redLedClient.call(service);
		}
		else
		{
			Echoes::ResetLed service;
			redResetClient.call(service);
		}
		*/

		if (sensor.getContact())
		{
			if (gameControl.isSuperMode())
				cout << "The winner is PacBot" << endl;
			else
				cout << "The winner is GhostBot" << endl;

			exit(EXIT_SUCCESS);
		}
		if (sensor.finishedPacDots())
		{
			cout << "Finished Pac Dots.\nThe winner is PacBot" << endl;
			exit(EXIT_SUCCESS);
		}

		if (100 * (clock() - startGame) / (double) CLOCKS_PER_SEC > 15)
			motion.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}
