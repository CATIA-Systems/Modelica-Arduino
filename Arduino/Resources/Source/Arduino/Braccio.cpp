/*
 Braccio.cpp - board library Version 2.0
 
 Based on the original Braccio library by Andrea Martino and Angelo Ferrante,
 modified by Torsten Sommer to work with the SoftArduino.

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include "Braccio.h"

extern Servo base;
extern Servo shoulder;
extern Servo elbow;
extern Servo wrist_rot;
extern Servo wrist_ver;
extern Servo gripper;

extern int step_base = 0;
extern int step_shoulder = 45;
extern int step_elbow = 180;
extern int step_wrist_rot = 180;
extern int step_wrist_ver = 90;
extern int step_gripper = 10;
 

_Braccio Braccio;


unsigned int _Braccio::begin(int soft_start_level) {

	// initialization pin Servo motors
	base.attach(11);
	shoulder.attach(10);
	elbow.attach(9);
	wrist_rot.attach(6);
	wrist_ver.attach(5);
	gripper.attach(3);
	        
	//For each step motor this set up the initial degree
	base.write(0);
	shoulder.write(40);
	elbow.write(180);
	wrist_ver.write(170);
	wrist_rot.write(0);
	gripper.write(73);

	//Previous step motor position
	step_base = 0;
	step_shoulder = 40;
	step_elbow = 180;
	step_wrist_ver = 170;
	step_wrist_rot = 0;
	step_gripper = 73;
	
	return 1;
}


int _Braccio::ServoMovement(int stepDelay, int vBase, int vShoulder, int vElbow,int vWrist_ver, int vWrist_rot, int vgripper) {

	// Check values, to avoid dangerous positions for the Braccio
	if (stepDelay > 30) stepDelay = 30;
	if (stepDelay < 10) stepDelay = 10;
	if (vBase < 0) vBase=0;
	if (vBase > 180) vBase=180;
	if (vShoulder < 15) vShoulder=15;
	if (vShoulder > 165) vShoulder=165;
	if (vElbow < 0) vElbow=0;
	if (vElbow > 180) vElbow=180;
	if (vWrist_ver < 0) vWrist_ver=0;
	if (vWrist_ver > 180) vWrist_ver=180;
	if (vWrist_rot > 180) vWrist_rot=180;
	if (vWrist_rot < 0) vWrist_rot=0;
	if (vgripper < 10) vgripper = 10;
	if (vgripper > 73) vgripper = 73;

	// until the all motors are in the desired position
	while (true) {

		if (vBase != step_base) {
			base.write(vBase > step_base ? ++step_base : --step_base);
		}

		if (vShoulder != step_shoulder) {
			shoulder.write(vShoulder > step_shoulder ? ++step_shoulder : --step_shoulder);
		}

		if (vElbow != step_elbow) {
			elbow.write(vElbow > step_elbow ? ++step_elbow : --step_elbow);
		}

		if (vWrist_ver != step_wrist_ver) {
			wrist_ver.write(vWrist_ver > step_wrist_ver ? ++step_wrist_ver : --step_wrist_ver);
		}

		if (vWrist_rot != step_wrist_rot) {
			wrist_rot.write(vWrist_rot > step_wrist_rot ? ++step_wrist_rot : --step_wrist_rot);
		}

		if (vgripper != step_gripper) {
			gripper.write(vgripper > step_gripper ? ++step_gripper : --step_gripper);
		}

		delay(stepDelay);

		if ((vBase == step_base) && 
			(vShoulder == step_shoulder) &&
			(vElbow == step_elbow) &&
			(vWrist_ver == step_wrist_ver) &&
			(vWrist_rot == step_wrist_rot) &&
			(vgripper == step_gripper)) {
			break;
		}

	}

	return 1;
}
