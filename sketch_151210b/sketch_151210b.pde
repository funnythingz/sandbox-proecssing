ParticleSystem ps;
 
void setup() {
  fullScreen();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
}

void draw() {
  background(0);
 
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
 
  ps.addParticle();
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
 
  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
 
  void addParticle() {
    particles.add(new Particle(origin));
  }
 
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
 
  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1;
 
  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }
 
  void run() {
    update();
    display();
  }
 
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
 
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }
 
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}