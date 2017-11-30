#include "DFLG6DOF.h"

RobotArm robotArm;


void setup() {

/*
  robotArm.baseAngleOffset = -10;
  robotArm.elbowAngleOffset = -13;
  robotArm.wristVerAngleOffset = -7;
  robotArm.wristRotAngleOffset = -3;
  robotArm.gripperAngleOffset = 0;

  robotArm.reverseBaseAngle = true;
  robotArm.reverseWristVerAngle = true;
  robotArm.reverseWristRotAngle = true;
*/

  robotArm.begin();

}

void loop() {

  delay(1000);

  // shoulder up
  robotArm.shoulderAngle = 160;
  robotArm.elbowAngle = 30;
  robotArm.wristVerAngle = 125;
  robotArm.move();

  // turn base and wrist
  robotArm.baseAngle = 145;
  robotArm.wristRotAngle = 180;
  robotArm.move();

  // arm down
  robotArm.shoulderAngle = 70;
  robotArm.move();

  // close gripper
  robotArm.gripperAngle = 70;
  robotArm.move();

  // arm up
  robotArm.shoulderAngle = 160;
  //robotArm.elbowAngle = 10;
  robotArm.move();

  // turn back base and wrist
  robotArm.baseAngle = 35;
  robotArm.wristRotAngle = 90;
  robotArm.move();

  // shoulder down
  robotArm.shoulderAngle = 70;
  robotArm.move();

  // open gripper
  robotArm.gripperAngle = 0;
  robotArm.move();

  // arm up
  robotArm.shoulderAngle = 160;
  robotArm.move();

  // turn back base
  robotArm.baseAngle = 90;
  robotArm.move();

  // arm down
  robotArm.shoulderAngle = 80;
  robotArm.elbowAngle = 5;
  robotArm.wristVerAngle = WRIST_VER_START_ANGLE;
  robotArm.move();

  delay(10000); 

}
