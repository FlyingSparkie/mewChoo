/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */
import peasy.PeasyCam;
PShape mewChoo;
Flock flock;
PeasyCam cam;
float dim=1000;

void setup() {
  size(1280, 720,P3D);
  mewChoo = loadShape("newmew1.obj");
  cam = new PeasyCam(this,100);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    flock.addBoid(new Boid(0,0));
  }
}

void draw() {
  background(50);
  //translate(width/2,height/2,-200);
  //rotate(PI/4);
  rectMode(CENTER);
  stroke(255);
  fill(255,100);
  rect(0,0,dim,dim);
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
