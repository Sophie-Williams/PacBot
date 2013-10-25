/*
 * BTReader.cpp
 *
 *  Created on: Apr 22, 2013
 *      Author: mikel
 */

#include "BTReader.h"
#include <sstream>
#include <errno.h>
#include <iostream>
#include <stdio.h>

#define TOUT 300 // milliseconds

using namespace std;
BTReader::BTReader(std::string deviceFile) {
	fd = open(deviceFile.c_str(), O_RDONLY | O_NOCTTY);
	pollList[0].fd = fd;
	pollList[0].events = POLLIN;
	buffer = new char[1];
}

BTReader::~BTReader() {
	if (fd >= 0) close(fd);
	if (buffer) delete buffer;
}

int BTReader::readData()
{
	if (fd < 0) return -1;
	int res = 0;
	switch(waitData(TOUT))
	{
		case WAIT_OK:
			res = read(fd, buffer, 1);
			break;
		case WAIT_ERR:
			res = -1;
			break;
		case WAIT_TOUT:
			res = -1;
			break;

	}
	return res;

}

int BTReader::waitData(int msec_tout)
{
	//int fd = pollList[0].fd;
	int retval = poll(pollList, 1, msec_tout);
	if (retval < 0)
	{
		//fprintf(stderr, "poll error on file %d, errno %d", fd, errno);
		return WAIT_ERR;
	}
	else if (retval == 0) return WAIT_TOUT;
	return WAIT_OK;
}

int BTReader::getBuffer()
{
	if (*buffer == '0') return 0;
	return 1;
}
