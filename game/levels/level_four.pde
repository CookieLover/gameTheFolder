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
"../../assets/characters/ninja/ninjaR1.png",
"../../assets/characters/newKing.png",
"../../assets/platforms/L4plat1.png",
"../../assets/platforms/L4plat2.png",
"../../assets/platforms/L4plat3.png",
"../../assets/platforms/L4plat4.png",
"../../assets/platforms/L4plat5.png",
"../../assets/platforms/L4plat6.png",
"../../assets/platforms/L4Mplat1.png",
"../../assets/platforms/L4Mplat2.png",
"../../assets/platforms/L4Mplat3.png",
"../../assets/platforms/BigFatKing.png",
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
  bg = loadImage("../../assets/backgrounds/level4_without_plat.png");

// platforms
  platforms.push(new Platform(0, FLOOR, loadImage("../../assets/platforms/L4plat1.png")));
  platforms.push(new Platform(150, 540, loadImage("../../assets/platforms/L4plat2.png")));
  platforms.push(new Platform(274, 488, loadImage("../../assets/platforms/L4plat3.png")));
  platforms.push(new Platform(19, 231, loadImage("../../assets/platforms/L4plat4.png")));
  platforms.push(new Platform(619, 256, loadImage("../../assets/platforms/L4plat5.png")));
  platforms.push(new Platform(702, 438, loadImage("../../assets/platforms/L4plat6.png")));
  platforms.push(new Platform(342, 393, loadImage("../../assets/platforms/L4Mplat1.png")));
  platforms.push(new Platform(267, 298, loadImage("../../assets/platforms/L4Mplat2.png")));
  platforms.push(new Platform(487, 330, loadImage("../../assets/platforms/L4Mplat3.png")));
  platforms[6].movePixels.setup([24, 24, 48, 48, 48, 24, 24], ["D", "L", "U", "R", "D", "L", "U"], 3);
  platforms[7].movePixels.setup([8, 16, 8], ["L", "R", "L"], 6);
  platforms[8].movePixels.setup([88, 176, 88], ["U", "D", "U"], 3);


// objects
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 785, 384, "level_four.html"));
  //objects.push(new FatKing(loadImage("../../assets/platforms/BigFatKing.png"), 100, 100));
  platforms.push(new Platform(0, 176, loadImage("../../assets/platforms/BigFatKing.png")));

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
}

function calculate() {
    loopPlatforms(platforms);
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
