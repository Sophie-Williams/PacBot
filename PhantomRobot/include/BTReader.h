/*
 * BTReader.h
 *
 *  Created on: Apr 22, 2013
 *      Author: mikel
 */

#ifndef BTREADER_H_
#define BTREADER_H_
#include <fcntl.h>
#include <unistd.h>
#include <poll.h>
#include <termios.h>
#include <exception>
#include <vector>
#include <string>

class BTReader {
public:
	BTReader(std::string DeviceFile);
	virtual ~BTReader();
	int readData();
	int getBuffer();
private:
	int fd;
	struct pollfd pollList[1];
	char * buffer;
	static const int WAIT_OK = 1;
	static const int WAIT_ERR = -1;
	static const int WAIT_TOUT = 0;
	int waitData(int msec_tout);
};

#endif /* BTREADER_H_ */
