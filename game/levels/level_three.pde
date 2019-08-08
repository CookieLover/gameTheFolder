/* @pjs preload=
"../../assets/characters/ninja/ninjaStanding.png",
"../../assets/characters/ninja/ninjaJump.png",
"../../assets/characters/ninja/deadNinja.png",
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
"../../assets/platforms/plat1L3.png",
"../../assets/platforms/plat3L3.png",
"../../assets/platforms/plat5L3.png",
"../../assets/platforms/plat6L3.png",
"../../assets/platforms/plat7L3Mov.png",
"../../assets/platforms/plat8L3.png",
"../../assets/platforms/plat9L3.png",
"../../assets/platforms/lavaForLv3.png",
"../../assets/objects/spikeSideR.png",
"../../assets/objects/spikeL3.png",
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
  bg = loadImage("../../assets/backgrounds/level3_without_plat.png");
  bgPlat = loadImage("../../assets/backgrounds/level3.png")
  startImage = loadImage("../../assets/screens/Start.png");

// platforms
  platforms.push(new Platform(0, FLOOR, loadImage("../../assets/platforms/plat1L3.png")));
  platforms.push(new Platform(199, 555, loadImage("../../assets/platforms/plat3L3.png")));
  platforms.push(new Platform(315, 456, loadImage("../../assets/platforms/plat5L3.png")));
  platforms.push(new Platform(329, 600, loadImage("../../assets/platforms/plat6L3.png")));
  platforms.push(new Platform(423, 420, loadImage("../../assets/platforms/plat7L3Mov.png")));
  platforms[4].movePixels.setup([32, 32], ["U", "D"], 3);
  platforms.push(new Platform(488, 219, loadImage("../../assets/platforms/plat8L3.png")));
  platforms.push(new Platform(751, 467, loadImage("../../assets/platforms/plat9L3.png")));

// objects
  objects.push(new Spikes(loadImage("../../assets/platforms/lavaForLv3.png"), 118, FLOOR));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeL3.png"), 343, FLOOR));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideR.png"), 778, 261));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideR.png"), 778, 320));
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 785, 412, "level_four.html"));

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
  playerDead = loadImage("../../assets/characters/ninja/deadNinja.png");

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
    loopPlatforms(platforms);
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
