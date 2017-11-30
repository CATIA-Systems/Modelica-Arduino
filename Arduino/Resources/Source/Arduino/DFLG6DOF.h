#ifndef DFLG6DOF_H
#define DFLG6DOF_H

#include <Servo.h>

// gripper     0: open, 155: closed
// wristRot    0: right, 90: centered, 180 left
// wristVer    0: straight, 90: down
// elbow       30: down, 110: straight
// shoulder    60: 45 deg forward, 90: straight up, 140: 45 deg backward
// base        0: away from circles, 90: to large circle, 180: between circles


#define BASE_START_ANGLE        90
#define SHOULDER_START_ANGLE    80
#define ELBOW_START_ANGLE        5
#define WRIST_VER_START_ANGLE  140
#define WRIST_ROT_START_ANGLE   90
#define GRIPPER_START_ANGLE      0


int clamp(int value, int vmin, int vmax) {
  if (value < vmin) return vmin;
  if (value > vmax) return vmax;
  return value;  
}


class RobotArm {

public:

    Servo baseServo;
    Servo shoulderServo;
    Servo elbowServo;
    Servo wristVerServo;
    Servo wristRotServo;
    Servo gripperServo;

    int stepDelay = 20;

    // target angles
    int baseAngle     = BASE_START_ANGLE;
    int shoulderAngle = SHOULDER_START_ANGLE;
    int elbowAngle    = ELBOW_START_ANGLE;
    int wristVerAngle = WRIST_VER_START_ANGLE;
    int wristRotAngle = WRIST_ROT_START_ANGLE;
    int gripperAngle  = GRIPPER_START_ANGLE;

    // current angles
    int m_baseAngle;
    int m_shoulderAngle;
    int m_elbowAngle;
    int m_wristVerAngle;
    int m_wristRotAngle;
    int m_gripperAngle;

    // offsets for clibration
    int baseAngleOffset = 0;
    int shoulderAngleOffset = 0;
    int elbowAngleOffset = 0;
    int wristVerAngleOffset = 0;
    int wristRotAngleOffset = 0;
    int gripperAngleOffset = 0;

    // factor
    bool reverseBaseAngle = false;
    bool reverseShoulderAngle = false;
    bool reverseElbowAngle = false;
    bool reverseWristVerAngle = false;
    bool reverseWristRotAngle = false;
    bool reverseGripperAngle = false;

    void begin() {

      // attach the servos
      baseServo.attach(3);
      shoulderServo.attach(5);
      elbowServo.attach(6);
      wristVerServo.attach(9);
      wristRotServo.attach(10);
      gripperServo.attach(11);
    
      m_baseAngle = baseAngle;
      m_shoulderAngle = shoulderAngle;
      m_elbowAngle = elbowAngle;
      m_wristVerAngle = wristVerAngle;
      m_wristRotAngle = wristRotAngle;
      m_gripperAngle = gripperAngle;

      // move to start position      
      baseServo.write(servoValue(m_baseAngle, reverseBaseAngle, baseAngleOffset));
      shoulderServo.write(servoValue(m_shoulderAngle, reverseShoulderAngle, shoulderAngleOffset));
      elbowServo.write(servoValue(m_elbowAngle, reverseElbowAngle, elbowAngleOffset));
      wristVerServo.write(servoValue(m_wristVerAngle, reverseWristVerAngle, wristVerAngleOffset));
      wristRotServo.write(servoValue(m_wristRotAngle, reverseWristRotAngle, wristRotAngleOffset));
      gripperServo.write(servoValue(m_gripperAngle, reverseGripperAngle, gripperAngleOffset));
      
    }

    int servoValue(int value, bool reverse, int offset) {

      if (reverse) {
        return 180 - value + offset;
      } else {
        return value + offset;
      }

    }

    void move() {

/*
    baseAngle     = clamp(baseAngle,      0, 180);
    shoulderAngle = clamp(shoulderAngle, 60, 140);
    elbowAngle    = clamp(elbowAngle,     0, 110);
    wristVerAngle = clamp(wristVerAngle,  0, 130);
    wristRotAngle = clamp(wristRotAngle,  0, 180);
    gripperAngle  = clamp(gripperAngle,   0, 140);
*/

    bool done = false;
  
    while (!done) {

      done = true;

      if (m_baseAngle < baseAngle) {
        m_baseAngle++;
        done = false;
      } else if (m_baseAngle > baseAngle) {
        m_baseAngle--;
        done = false;
      }
      
      if (m_shoulderAngle < shoulderAngle) {
        m_shoulderAngle++;
        done = false;
      } else if (m_shoulderAngle > shoulderAngle) {
        m_shoulderAngle--;
        done = false;
      }

      if (m_elbowAngle < elbowAngle) {
        m_elbowAngle++;
        done = false;
      } else if (m_elbowAngle > elbowAngle) {
        m_elbowAngle--;
        done = false;
      }

      if (m_wristVerAngle < wristVerAngle) {
        m_wristVerAngle++;
        done = false;
      } else if (m_wristVerAngle > wristVerAngle) {
        m_wristVerAngle--;
        done = false;
      }

      if (m_wristRotAngle < wristRotAngle) {
        m_wristRotAngle++;
        done = false;
      } else if (m_wristRotAngle > wristRotAngle) {
        m_wristRotAngle--;
        done = false;
      }

      if (m_gripperAngle < gripperAngle) {
        m_gripperAngle++;
        done = false;
      } else if (m_gripperAngle > gripperAngle) {
        m_gripperAngle--;
        done = false;
      }
      
      baseServo.write(servoValue(m_baseAngle, reverseBaseAngle, baseAngleOffset));
      shoulderServo.write(servoValue(m_shoulderAngle, reverseShoulderAngle, shoulderAngleOffset));
      elbowServo.write(servoValue(m_elbowAngle, reverseElbowAngle, elbowAngleOffset));
      wristVerServo.write(servoValue(m_wristVerAngle, reverseWristVerAngle, wristVerAngleOffset));
      wristRotServo.write(servoValue(m_wristRotAngle, reverseWristRotAngle, wristRotAngleOffset));
      gripperServo.write(servoValue(m_gripperAngle, reverseGripperAngle, gripperAngleOffset));
      
      delay(stepDelay);
    }
    
}
  
};

#endif  /* DFLG6DOF_H */
