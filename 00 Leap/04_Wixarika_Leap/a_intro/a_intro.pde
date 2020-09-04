import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  fullScreen(OPENGL);
  //size(600, 600, OPENGL);
  background(255);
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  
  // === HANDS === 
  for( Hand hand : leap.getHands () ) {
    // BASICS --- (Initialize hand attributes for each hand seen by the leap object)
    int     hand_id           = hand.getId();
    PVector hand_position     = hand.getPosition();
    PVector hand_stabilized   = hand.getStabilizedPosition();
    PVector hand_direction    = hand.getDirection();
    PVector hand_dynamics     = hand.getDynamics();
    float   hand_roll         = hand.getRoll();
    float   hand_pitch        = hand.getPitch();
    float   hand_yaw          = hand.getYaw();
    boolean hand_is_left      = hand.isLeft();
    boolean hand_is_right     = hand.isRight();
    float   hand_grap         = hand.getGrabStrength();
    float   hand_pinch        = hand.getPinchStrength();
    float   hand_time         = hand.getTimeVisible();
    PVector sphere_position   = hand.getSpherePosition();
    float   sphere_radius     = hand.getSphereRadius();
    
    // SPECIFIC FINGER --- (Initialize fingers for each hand seen by the leap object)
    Finger  finger_thumb      = hand.getThumb();
    Finger  finger_index      = hand.getIndexFinger();
    Finger  finger_ring      = hand.getRingFinger();
    Finger  finger_pink      = hand.getPinkyFinger();
    
    // DRAWING --- (Actions to be taken when a hand is being seen)
    //hand.draw();
    
    // === FINGERS ===
    for (Finger finger : hand.getFingers () ) {
      // BASICS
      int     finger_id           = finger.getId();
      PVector finger_position     = finger.getPosition();
      PVector finger_stabilized   = finger.getStabilizedPosition();
      PVector finger_velocity     = finger.getVelocity();
      PVector finger_direction    = finger.getDirection();
      float   finger_time         = finger.getTimeVisible();
      
      // SPECIFIC FINGER
      switch(finger.getType()) {
        case 0: // Thumb
          strokeWeight(1);
          stroke(0);
          fill(130, 0, 0);
          rect(finger_position.x, finger_position.y, 20,20);
            break;
        case 1: // Index
          strokeWeight(5);
          stroke(0);
          fill(130);
          ellipse(finger_position.x, finger_position.y, 10,10);
            break;
        case 2: // Middle
          strokeWeight(5);
          stroke(0);
          fill(130);
          ellipse(finger_position.x, finger_position.y, 10,10);
          break;
        case 3: // Ring 
          strokeWeight(5);
          stroke(0);
          fill(130);
          ellipse(finger_position.x, finger_position.y, 10,10);
          break;
        case 4: // Pinky
          strokeWeight(5);
          stroke(0);
          fill(130);
          ellipse(finger_position.x, finger_position.y, 10,10);
          break;
      }
    }
  }
}
