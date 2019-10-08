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
"../../assets/boss/bossL1.png",
"../../assets/boss/bossL2.png",
"../../assets/boss/bossL3.png",
"../../assets/boss/bossL4.png",
"../../assets/boss/bossL5.png",
"../../assets/boss/bossL6.png",
"../../assets/boss/bossL7.png",
"../../assets/boss/bossL8.png",
"../../assets/boss/bossR1.png",
"../../assets/boss/bossR2.png",
"../../assets/boss/bossR3.png",
"../../assets/boss/bossR4.png",
"../../assets/boss/bossR5.png",
"../../assets/boss/bossR6.png",
"../../assets/boss/bossR7.png",
"../../assets/boss/bossR8.png",
"../../assets/boss/bossIdle.png",
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
"../../assets/objects/Key.png",
"../../assets/objects/emptyKey.png",
"../../assets/objects/EndPortalOfGame.png"; */

var platforms = new Array();
var objects = new Array();
var enemies = new Array();
var bg;
var startImage;
var playerRight = [];
var playerLeft = [];
var playerRightKing = [];
var playerLeftKing = [];
var bossRight = [];
var bossLeft = [];
var playerJump;
var playerIdle;
var playerJumpKing;
var playerIdleKing;
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
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideLLong.png"), 0, 471));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideRLong.png"), 778, 481));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideSR.png"), 381, 469));
  objects.push(new Spikes(loadImage("../../assets/objects/spikeSideSL.png"), 414, 469));
  objects.push(new Spikes(loadImage("../../assets/platforms/L5lava.png"), 0, FLOOR));
// y = 320 is the maximum value for the key to be untouchable by player jumping
// y = 321 is the minimum value for the key to be touchable by player jumping
  objects.push(new Key(loadImage("../../assets/objects/Key.png"), 655, 320));
  objects.push(new Door(loadImage("../../assets/objects/EndPortalOfGame.png"), 785, 600, "endScreen.html"));
  objects[6].playerCanEnter = false;

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

// Boss right images
  bossRight[0] = loadImage("../../assets/boss/bossR1.png")
  bossRight[1] = loadImage("../../assets/boss/bossR2.png")
  bossRight[2] = loadImage("../../assets/boss/bossR3.png")
  bossRight[3] = loadImage("../../assets/boss/bossR4.png")
  bossRight[4] = loadImage("../../assets/boss/bossR5.png")
  bossRight[5] = loadImage("../../assets/boss/bossR6.png")
  bossRight[6] = loadImage("../../assets/boss/bossR7.png")
  bossRight[7] = loadImage("../../assets/boss/bossR8.png")

// Boss right images
  bossLeft[0] = loadImage("../../assets/boss/bossL1.png")
  bossLeft[1] = loadImage("../../assets/boss/bossL2.png")
  bossLeft[2] = loadImage("../../assets/boss/bossL3.png")
  bossLeft[3] = loadImage("../../assets/boss/bossL4.png")
  bossLeft[4] = loadImage("../../assets/boss/bossL5.png")
  bossLeft[5] = loadImage("../../assets/boss/bossL6.png")
  bossLeft[6] = loadImage("../../assets/boss/bossL7.png")
  bossLeft[7] = loadImage("../../assets/boss/bossL8.png")

  bossIdle = loadImage("../../assets/boss/bossIdle.png")

// Player jump
  playerJump = loadImage("../../assets/characters/ninja/ninjaJump.png");
  playerIdle = loadImage("../../assets/characters/ninja/ninjaStanding.png");
  playerDeadR = loadImage("../../assets/characters/ninja/ninjaDeadR.png");
  playerDeadL = loadImage("../../assets/characters/ninja/ninjaDeadL.png");
  playerDeadStick = loadImage("../../assets/characters/ninja/ninjaDeadStick.png");

  playerJumpKing = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaWithKingJump.png");
  playerIdleKing = loadImage("../../assets/characters/ninjaCarryingFatKing/ninjaWithKingIdle.png");

  player = new Player(playerRight, playerLeft, playerJump, playerIdle, playerDeadR, playerDeadL, playerDeadStick, 10, 66);
  player.fatKingSetup(playerRightKing, playerLeftKing, playerJumpKing, playerIdleKing, playerDeadKingR, playerDeadKingL, playerDeadStick);
  player.carryFatKing();
  player.rY = 0;

  enemies.push(new Enemy(bossRight, bossLeft, bossIdle, 600, 600, 770, 436, 2));
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  drawObjects(objects);
  drawEnemies(enemies);
  player.draw();
  startCheck(gameState);
}

function calculate() {
    loopPlatforms(platforms);
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculateEnemies(enemies);
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
