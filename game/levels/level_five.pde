/* @pjs preload=
"../../assets/characters/ninja/ninjaStanding.png",
"../../assets/characters/ninja/ninjaJump.png",
"../../assets/characters/ninja/ninjaDeadR.png",
"../../assets/characters/ninja/ninjaDeadL.png",
"../../assets/characters/ninja/ninjaDeadStick.png",
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
"../../assets/characters/ninja/ninjaR1.png",
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
"../../assets/platforms/L5plat1.png",
"../../assets/platforms/L5plat2.png",
"../../assets/platforms/L5plat3.png",
"../../assets/platforms/L5Mplat1.png",
"../../assets/platforms/L5Mplat2.png",
"../../assets/platforms/L5lava.png",
"../../assets/objects/spikeSideLLong.png",
"../../assets/objects/spikeSideRLong.png",
"../../assets/objects/spikeSideSL.png",
"../../assets/objects/spikeSideSR.png",
"../../assets/objects/endPortalOfGame.png"; */

var platforms = new Array();
var objects = new Array();
var bg;
var startImage;
var playerRight = [];
var playerLeft = [];
var playerJump;
var playerIdle;
var playerDeadR;
var playerDeadL;
var playerDeadStick;
var player;
var door;

void setup() {
console.log("HELLL)o");
// setup canvas
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  RIGHT_MARGIN = 4;
  bg = loadImage("../../assets/backgrounds/level5_without_plat.png");
  startImage = loadImage("../../assets/screens/Start.png");

// platforms
  platforms.push(new Platform(382, FLOOR, loadImage("../../assets/platforms/L5plat1.png")));
  platforms.push(new Platform(403, 469, loadImage("../../assets/platforms/L5plat2.png")));
  platforms.push(new Platform(0, 108, loadImage("../../assets/platforms/L5plat3.png")));
  platforms.push(new Platform(715, 495, loadImage("../../assets/platforms/L5Mplat1.png")));
  platforms.push(new Platform(80, 180, loadImage("../../assets/platforms/L5Mplat2.png")));
  platforms[3].movePixels.setup([100, 100], ["L", "R"], 7);
  platforms[4].movePixels.setup([15, 25, 15, 25], ["R", "D", "L", "U"], 10);


// objects
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideLLong.png"), 0, 471))
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideRLong.png"), 778, 481))
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideSR.png"), 381, 469))
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideSL.png"), 414, 469))
  objects.push(new Spikes(loadImage("../../assets/platforms/L5lava.png"), 0, FLOOR))
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 800, 600, "endScreen.html"));
  objects[5].playerCanEnter = false;

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
  playerDeadR = loadImage("../../assets/characters/ninja/ninjaDeadR.png");
  playerDeadL = loadImage("../../assets/characters/ninja/ninjaDeadL.png");
  playerDeadStick = loadImage("../../assets/characters/ninja/ninjaDeadStick.png");
  player = new Player(playerRight, playerLeft, playerJump, playerIdle, playerDeadR, playerDeadL, playerDeadStick, 10, 66);
  player.rY = 0;
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  drawObjects(objects);
  player.draw();
  startCheck(gameState);
}

function calculate() {
    loopPlatforms(platforms);
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
