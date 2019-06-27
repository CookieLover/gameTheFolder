/* @pjs preload=
 "../../../assets/characters/ninja/ninjaStanding.png",
 "../../../assets/characters/ninja/ninjaJump.png",
 "../../../assets/characters/ninja/ninjaL5.png",
 "../../../assets/characters/ninja/ninjaL4.png",
 "../../../assets/characters/ninja/ninjaL3.png",
 "../../../assets/characters/ninja/ninjaL2.png",
 "../../../assets/characters/ninja/ninjaL1.png",
 "../../../assets/characters/ninja/ninjaR5.png",
 "../../../assets/characters/ninja/ninjaR4.png",
 "../../../assets/characters/ninja/ninjaR3.png",
 "../../../assets/characters/ninja/ninjaR2.png",
 "../../../assets/characters/ninja/ninjaR1.png",
 "../../../assets/platforms/plat1.png",
 "../../../assets/platforms/plat2.png",
 "../../../assets/platforms/plat3.png",
 "../../../assets/platforms/plat4.png",
 "../../../assets/platforms/plat5.png";*/
var platforms = new Array();
var bg;
var playerRight = [];
var playerLeft = [];
var playerJump;
var player;

void setup() {

//Player Right Images
  playerRight[0] = loadImage("../../../assets/characters/ninja/ninjaR1.png");
  playerRight[1] = loadImage("../../../assets/characters/ninja/ninjaR2.png");
  playerRight[2] = loadImage("../../../assets/characters/ninja/ninjaR3.png");
  playerRight[3] = loadImage("../../../assets/characters/ninja/ninjaR4.png");
  playerRight[4] = loadImage("../../../assets/characters/ninja/ninjaR5.png");
//Player Left Images
  playerLeft[0] = loadImage("../../../assets/characters/ninja/ninjaL1.png");
  playerLeft[1] = loadImage("../../../assets/characters/ninja/ninjaL2.png");
  playerLeft[2] = loadImage("../../../assets/characters/ninja/ninjaL3.png");
  playerLeft[3] = loadImage("../../../assets/characters/ninja/ninjaL4.png");
  playerLeft[4] = loadImage("../../../assets/characters/ninja/ninjaL5.png");
// Player jump
  playerJump = loadImage("../../../assets/characters/ninja/ninjaJump.png");
  playerIdle = loadImage("../../../assets/characters/ninja/ninjaStanding.png");

  platforms.push(new Platform(646, 298, loadImage("../../../assets/platforms/plat1.png")));
  platforms.push(new Platform(510, 416, loadImage("../../../assets/platforms/plat2.png")));
  platforms.push(new Platform(564, 541, loadImage("../../../assets/platforms/plat3.png")));
  platforms.push(new Platform(0, 539, loadImage("../../../assets/platforms/plat4.png")));
  platforms.push(new Platform(251, 538, loadImage("../../../assets/platforms/plat5.png")));

  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  RIGHT_MARGIN = 105

  player = new Player(playerRight, playerLeft, playerJump, playerIdle, 10, FLOOR - platforms[3].height);
  bg = loadImage("../../../assets/backgrounds/level1_without_plat.png");
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  player.draw();
}

function calculate() {
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
}
