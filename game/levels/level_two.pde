/* @pjs preload=
"../../assets/characters/ninja/ninjaStanding.png",
"../../assets/characters/ninja/ninjaJump.png",
"../../assets/characters/ninja/ninjaDead.png",
"../../assets/characters/ninja/ninjaL5.png",
"../../assets/characters/ninja/ninjaL4.png",
"../../assets/characters/ninja/ninjaL3.png",
"../../assets/characters/ninja/ninjaL2.png",
"../../assets/characters/ninja/ninjaL1.png",
"../../assets/characters/ninja/ninjaR5.png",
"../../assets/characters/ninja/ninjaR4.png",
"../../assets/characters/ninja/ninjaR3.png",
"../../assets/characters/ninja/ninjaR2.png",
"../../assets/characters/ninja/ninjaR1.png",
"../../assets/platforms/L2plat1.png",
"../../assets/platforms/L2plat2.png",
"../../assets/platforms/L2plat3.png",
"../../assets/platforms/L2plat4.png",
"../../assets/platforms/L2plat5.png",
"../../assets/platforms/L2plat6.png",
"../../assets/platforms/L2plat7.png",
"../../assets/platforms/L2plat8.png",
"../../assets/platforms/L2plat9.png",
"../../assets/platforms/L2plat10.png",
"../../assets/platforms/L2plat11.png",
"../../assets/platforms/L2plat12.png",
"../../assets/platforms/L2plat13.png",
"../../assets/platforms/L2plat14.png",
"../../assets/platforms/L2lava.png",
"../../assets/objects/portal.png"; */

var platforms = new Array();
var objects = new Array();
var bg;
var playerRight = [];
var playerLeft = [];
var playerJump;
var player;
var door;

void setup() {

// setup canvas
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  bg = loadImage("../../assets/backgrounds/level2_without_plat.png");
  bgPlat = loadImage("../../assets/backgrounds/level2.png")
  startImage = loadImage("../../assets/screens/Start.png");

// platforms
  platforms.push(new Platform(0, FLOOR, loadImage("../../assets/platforms/L2plat1.png")));
  platforms.push(new Platform(111, 555, loadImage("../../assets/platforms/L2plat2.png")));
  platforms.push(new Platform(194, 522, loadImage("../../assets/platforms/L2plat3.png")));
  platforms.push(new Platform(334, 489, loadImage("../../assets/platforms/L2plat4.png")));
  platforms.push(new Platform(480, 526, loadImage("../../assets/platforms/L2plat5.png")));
  platforms.push(new Platform(578, 484, loadImage("../../assets/platforms/L2plat6.png")));
  platforms.push(new Platform(710, 459, loadImage("../../assets/platforms/L2plat7.png")));
  platforms.push(new Platform(596, 330, loadImage("../../assets/platforms/L2plat8.png")));
  platforms.push(new Platform(440, 300, loadImage("../../assets/platforms/L2plat9.png")));
  platforms.push(new Platform(290, 262, loadImage("../../assets/platforms/L2plat10.png")));
  platforms.push(new Platform(129, 212, loadImage("../../assets/platforms/L2plat11.png")));
  platforms.push(new Platform(332, 135, loadImage("../../assets/platforms/L2plat12.png")));
  platforms.push(new Platform(558, 142, loadImage("../../assets/platforms/L2plat13.png")));
  platforms.push(new Platform(764, 143, loadImage("../../assets/platforms/L2plat14.png")));

// objects
  objects.push(new Spikes(loadImage("../../assets/platforms/L2lava.png"), 138, FLOOR));
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 785, 111, "level_three.html"));

//Player Right Images
  playerRight[0] = loadImage("../../assets/characters/ninja/ninjaR1.png");
  playerRight[1] = loadImage("../../assets/characters/ninja/ninjaR2.png");
  playerRight[2] = loadImage("../../assets/characters/ninja/ninjaR3.png");
  playerRight[3] = loadImage("../../assets/characters/ninja/ninjaR4.png");
  playerRight[4] = loadImage("../../assets/characters/ninja/ninjaR5.png");
//Player Left Images
  playerLeft[0] = loadImage("../../assets/characters/ninja/ninjaL1.png");
  playerLeft[1] = loadImage("../../assets/characters/ninja/ninjaL2.png");
  playerLeft[2] = loadImage("../../assets/characters/ninja/ninjaL3.png");
  playerLeft[3] = loadImage("../../assets/characters/ninja/ninjaL4.png");
  playerLeft[4] = loadImage("../../assets/characters/ninja/ninjaL5.png");
// Player jump
  playerJump = loadImage("../../assets/characters/ninja/ninjaJump.png");
  playerIdle = loadImage("../../assets/characters/ninja/ninjaStanding.png");
  playerDead = loadImage("../../assets/characters/ninja/ninjaDead.png");

  player = new Player(playerRight, playerLeft, playerJump, playerIdle, playerDead, 10, FLOOR);
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  drawObjects(objects);
  player.draw();
  if (gameState == gameStates.START) {
    image(startImage, 200, 200);
  }
}

function calculate() {
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
