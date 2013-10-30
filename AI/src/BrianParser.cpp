#include "BrianParser.h"

BrianParser::BrianParser(GameControl& gameControl, Sensors& sensor)
: gameControl(gameControl), sensor(sensor)
{
	brian = new MrBrian(FUZZYASSOC, FUZZYSHAPES, PRIES, PRIESACTIONS, CANDOES,
			BEHAVIORS, WANTERS, DEFUZZYASSOC, DEFUZZYSHAPES);

	timer = 0;
	randomValue = 0;
	blockedTime = 0;
	priority = 0;
	tanSpeed = 0;
	rotSpeed = 0;
}

void BrianParser::go()
{
	askBrian();
	brianAnswer();
}

int BrianParser::getTanSpeed() 
{
	return tanSpeed;
}

int BrianParser::getRotSpeed()
{
	return rotSpeed;
}

void BrianParser::askBrian() 
{
	const int reliability = 1;

	crisp_data_list* cdl = (brian->getFuzzy())->get_crisp_data_list();
	cdl-> clear();

	if (timer == 70)
	{
		randomValue = rand() % 2;
		timer = 0;
	}
	timer++;

	cdl->add(new crisp_data("DistanceNorthRight", sensor.getIR(NORTHRIGHT), reliability));
	cdl->add(new crisp_data("DistanceNorthLeft", sensor.getIR(NORTHLEFT), reliability));
	cdl->add(new crisp_data("DistanceEast", sensor.getIR(EAST), reliability));
	cdl->add(new crisp_data("DistanceWest", sensor.getIR(WEST), reliability));
	cdl->add(new crisp_data("Random", randomValue, reliability));
	cdl->add(new crisp_data("GhostBlobHeight", sensor.getGhostBlobHeight(), reliability));
	cdl->add(new crisp_data("GhostFound", sensor.isGhostFound() ? 1 : 0, reliability));
	cdl->add(new crisp_data("SuperMode", gameControl.isSuperMode() ? 1 : 0, reliability));
	cdl->add(new crisp_data("RFIDPriority", sensor.getRFIDPriority(), reliability));

	if (sensor.getIR(EAST) > sensor.getIR(WEST))
		cdl->add(new crisp_data("Priority", LEFT, reliability));
	else
		cdl->add(new crisp_data("Priority", RIGHT, reliability));

	cdl->add(new crisp_data("EscapingFromGhost", sensor.isEscapingFromGhost() == true ? 1 : 0, reliability));
	brian->run();
	//brian->debug();
	crisp_data_list::iterator i;
	for(i = cdl->begin(); i != cdl->end(); i++)
		delete (*i).second;
}

void BrianParser::brianAnswer()
{
	tanSpeed = 0;
	rotSpeed = 0;

	command_list* cmd = brian->getFuzzy()->get_command_singleton_list();

	if (cmd == NULL || cmd->empty())
	{
		//cerr << "Received empty command list" << endl;
		return;
	}
	else
	{
		for(command_list::iterator i = cmd->begin(); i != cmd->end(); i++)
		{
			std::string temp = i->first;
			if (temp.compare("TanSpeed") == 0)
			{
				tanSpeed = i->second->get_set_point();
				if (tanSpeed > 0)
					blockedTime = 0;
				else
					blockedTime++;
			}
			else if (temp.compare("RotSpeed") == 0)
			{
				rotSpeed = i->second->get_set_point();
				if (rotSpeed > 10) priority = RIGHT;
				else if (rotSpeed < -10) priority = LEFT;

				if (blockedTime > 50)
					rotSpeed = randomValue > 0 ? 1 : -1;
				if (tanSpeed == 0)
					sensor.updateHorizon(rotSpeed);
			}
			else if (temp.compare("Debug") == 0)
			{
				int debug = i->second->get_set_point();
				//cout << "Debug: " << debug << endl;
			}
		}
	}
	cmd->clear();
}

BrianParser::~BrianParser() 
{
	delete brian;
}
