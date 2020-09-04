import de.voidplus.leapmotion.*;

LeapMotion leap;

ArrayList<Particle> particles;
int particlesCount;
PImage img;
int imgWidth = 601;
int imgHeight = 426;
int separation = 5;
float radius;

float userLeftFingerX;
float userLeftFingerY;

float displacementForce;

void setup() {
  //size(800, 620, OPENGL);
  fullScreen(OPENGL);
  img = loadImage("girasol.jpg");
  imageMode(CENTER);
  background(#202020);
  
  // Leap setup
  leap = new LeapMotion(this);
  userLeftFingerX = 0.0;
  userLeftFingerY = 0.0;
  
  // Wixarika's dots setup
  particles = new ArrayList<Particle>();
  for (int x = 0; x < imgWidth; x+=separation) {
    for (int y = 0; y < imgHeight; y+=separation) {
      particles.add(new Particle(new PVector(x,y)));
    }
  }
}

void draw() {
  background(#202020);
  
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
        case 1: // Index
          // Draw a circle instantly
          //strokeWeight(5);
          //stroke(0);
          //fill(130);
          //ellipse(finger_position.x, finger_position.y, 10,10);
          
          // Get coordinates to draw a circle later
          if(hand_is_left) {
            userLeftFingerX = finger_position.x;
            userLeftFingerY = finger_position.y;
          }
          
          displacementForce = hand_grap - 0.3;
            break;
      }
    }
  }
  
  
 
  
  // === Wixarikas dots ===
  noStroke();
  for(int i=0; i< particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
  
  
  
  // Use saved coordinates to draw a circle
  noStroke();
  fill(0,255,0);
  ellipse(userLeftFingerX, userLeftFingerY, 5, 5);
}
