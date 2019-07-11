/* @pjs preload="../../assets/ninja/ninjaStanding.png",
"../../assets/ninja/ninjaJump.png",
"../../assets/ninja/ninjaL5.png",
"../../assets/ninja/ninjaL4.png",
"../../assets/ninja/ninjaL3.png",
"../../assets/ninja/ninjaL2.png",
"../../assets/ninja/ninjaL1.png",
"../../assets/background/1stLevelBackground.png",
"../../assets/ninja/ninjaR5.png",
"../../assets/ninja/ninjaR4.png",
"../../assets/ninja/ninjaR3.png",
"../../assets/ninja/ninjaR2.png",
"../../assets/ninja/ninjaR1.png",
"../../assets/objects/spike.png"; */
var FLOOR;
var platforms = new Array();
PImage bg;

var playerRight = [];
var playerLeft = [];
var playerJump;
var player;
var platform;
var spikes;

void setup() {
//Player Right Images
  playerRight[0] = loadImage("../../assets/ninja/ninjaR1.png");
  playerRight[1] = loadImage("../../assets/ninja/ninjaR2.png");
  playerRight[2] = loadImage("../../assets/ninja/ninjaR3.png");
  playerRight[3] = loadImage("../../assets/ninja/ninjaR4.png");
  playerRight[4] = loadImage("../../assets/ninja/ninjaR5.png");
//Player Left Images
  playerLeft[0] = loadImage("../../assets/ninja/ninjaL1.png");
  playerLeft[1] = loadImage("../../assets/ninja/ninjaL2.png");
  playerLeft[2] = loadImage("../../assets/ninja/ninjaL3.png");
  playerLeft[3] = loadImage("../../assets/ninja/ninjaL4.png");
  playerLeft[4] = loadImage("../../assets/ninja/ninjaL5.png");
// Player jump
  playerJump = loadImage("../../assets/ninja/ninjaJump.png");
  playerIdle = loadImage("../../assets/ninja/ninjaStanding.png");
//spikes

  FLOOR = SCREEN_HEIGHT;
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  player = new Player(playerRight, playerLeft, playerJump, playerIdle, 10, FLOOR);
  platforms.push(new Platform(400, 500, 137, 27));
  bg = loadImage("../../assets/background/1stLevelBackground.png");
  spikes = new Spikes(loadImage("../../assets/objects/spike.png"), 100, FLOOR);

  //console.log(FLOOR);
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  spikes.draw();
  player.draw();
}

function calculate() {
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
}
