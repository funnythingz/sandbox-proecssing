void setup() {
  fullScreen(P3D);
  frameRate(16);
}

void draw() {
  background(0);
  if (mousePressed) {
    pen(100);
  }
}

void pen(int size) {
    fill(random(255), random(255), random(255));
    ellipse(mouseX, mouseY, size, size);
}