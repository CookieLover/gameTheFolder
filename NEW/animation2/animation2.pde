
var screenWidth = 200;
var screenHeight = 200;

PImage man;

void setup() {
  size(screenWidth, screenHeight);
  background(255, 255, 255);
  fill(255, 255, 255);
  noStroke();

  man = loadImage("StickMan.jpg");
}

 var jumpCounts = 0;
void draw() {
	if (jumps) {
		if (jumpCounts < 50) {
		manY -=5;
		}
		if (jumpCounts > 50) {
		manY +=5;
		}
		jumpCounts += 5;
		
		if (jumpCounts > 100) {
			jumpCounts = 0;
			jumps = false;
		}
		
		posChange = true;
	}


 
  if (posChange) {
    rect(manX - 1, manY - 1, 104, 104);
    image(man, manX, manY);
    posChange = false;
  }
}
