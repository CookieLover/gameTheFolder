/* @pjs preload=
"../../assets/characters/ninja/ninjaStanding.png",
"../../assets/characters/ninja/ninjaJump.png",
"../../assets/characters/ninja/ninjaDeadR.png",
"../../assets/characters/ninja/ninjaDeadL.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead1.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead2.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead3.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead4.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead5.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead6.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaRDead7.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead1.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead2.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead3.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead4.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead5.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead6.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaLDead7.png",
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
"../../assets/characters/ninjaCarryingFatKing/ninjaWithKingJump.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaWithKingIdle.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaL5King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaL4King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaL3King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaL2King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaL1King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaR5King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaR4King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaR3King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaR2King.png",
"../../assets/characters/ninjaCarryingFatKing/ninjaR1King.png",
"../../assets/platforms/L4plat1.png",
"../../assets/platforms/L4plat2.png",
"../../assets/platforms/L4plat3.png",
"../../assets/platforms/L4plat4.png",
"../../assets/platforms/L4plat5.png",
"../../assets/platforms/L4Mplat1.png",
"../../assets/platforms/L4Mplat2.png",
"../../assets/platforms/L4Mplat3.png",
"../../assets/platforms/fatKingInCage.png",
"../../assets/platforms/fatKingNotInCage.png",
"../../assets/objects/spikeLongLong.png",
"../../assets/objects/portal.png"; */

var platforms = new Array();
var objects = new Array();
var bg;
var startImage;
var playerRight = [];
var playerLeft = [];
var playerRightKing = [];
var playerLeftKing = [];
var playerJump;
var playerIdle;
var playerDeadR;
var playerDeadL;
var playerDeadKingR = [];
var playerDeadKingL = [];
var playerDeadStick;
var player;
var door;

void setup() {

// setup canvas
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  RIGHT_MARGIN = 4;
  bg = loadImage("../../assets/backgrounds/level4_without_plat.png");
  startImage = loadImage("../../assets/screens/Start.png");

// platforms
  platforms.push(new Platform(0, FLOOR, loadImage("../../assets/platforms/L4plat1.png")));
  platforms.push(new Platform(274, 488, loadImage("../../assets/platforms/L4plat2.png")));
  platforms.push(new Platform(19, 231, loadImage("../../assets/platforms/L4plat3.png")));
  platforms.push(new Platform(619, 256, loadImage("../../assets/platforms/L4plat4.png")));
  platforms.push(new Platform(702, 438, loadImage("../../assets/platforms/L4plat5.png")));
  platforms.push(new Platform(342, 393, loadImage("../../assets/platforms/L4Mplat1.png")));
  platforms.push(new Platform(267, 298, loadImage("../../assets/platforms/L4Mplat2.png")));
  platforms.push(new Platform(487, 330, loadImage("../../assets/platforms/L4Mplat3.png")));
  platforms.push(new Platform(150, 540, loadImage("../../assets/platforms/L4Mplat3.png")));
  platforms[5].movePixels.setup([24, 24, 48, 48, 48, 24, 24], ["D", "L", "U", "R", "D", "L", "U"], 3);
  platforms[6].movePixels.setup([8, 16, 8], ["L", "R", "L"], 6);
  platforms[7].movePixels.setup([88, 176, 88], ["U", "D", "U"], 3);


// objects
  objects.push(new Spikes(loadImage("../../assets/objects/spikeLongLong.png"), 100, FLOOR))
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 785, 384, "endScreen.html"));
  objects.push(new FatKing(loadImage("../../assets/platforms/fatKingInCage.png"), 0, 176));
  objects[1].playerCanEnter = false;

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

//Player With King Right Images
  playerRightKing[0] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaR1King.png");
  playerRightKing[1] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaR2King.png");
  playerRightKing[2] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaR3King.png");
  playerRightKing[3] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaR4King.png");
  playerRightKing[4] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaR5King.png");

//Player With King Left Images
  playerLeftKing[0] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaL1King.png");
  playerLeftKing[1] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaL2King.png");
  playerLeftKing[2] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaL3King.png");
  playerLeftKing[3] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaL4King.png");
  playerLeftKing[4] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaL5King.png");

//Player With King Right Dead Images
  playerDeadKingR[0] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead1.png");
  playerDeadKingR[1] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead2.png");
  playerDeadKingR[2] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead3.png");
  playerDeadKingR[3] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead4.png");
  playerDeadKingR[4] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead5.png");
  playerDeadKingR[5] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead6.png");
  playerDeadKingR[6] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaRDead7.png");

//Player With King Left Dead Images
  playerDeadKingL[0] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead1.png");
  playerDeadKingL[1] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead2.png");
  playerDeadKingL[2] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead3.png");
  playerDeadKingL[3] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead4.png");
  playerDeadKingL[4] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead5.png");
  playerDeadKingL[5] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead6.png");
  playerDeadKingL[6] = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaLDead7.png");

// Player jump
  playerJump = loadImage("../../assets/characters/ninja/ninjaJump.png");
  playerIdle = loadImage("../../assets/characters/ninja/ninjaStanding.png");
  playerDeadR = loadImage("../../assets/characters/ninja/ninjaDeadR.png");
  playerDeadL = loadImage("../../assets/characters/ninja/ninjaDeadL.png");
  playerDeadStick = loadImage("../../assets/characters/ninja/ninjaDeadStick.png");

  playerJumpKing = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaWithKingJump.png");
  playerIdleKing = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaWithKingIdle.png");

  player = new Player(playerRight, playerLeft, playerJump, playerIdle, playerDeadR, playerDeadL, playerDeadStick, 10, FLOOR);
  player.fatKingSetup(playerRightKing, playerLeftKing, playerJumpKing, playerIdleKing, playerDeadKingR, playerDeadKingL, playerDeadStick);
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
