var GRAVITY_STEP = 5;
var SCREEN_WIDTH = 800;
var SCREEN_HEIGHT = 600;
var MARGIN = 10;
var FLOOR;

//Not sure if we need a pause statement. If we don't, then this should be change to true/false.
var gameStates = {
  LEVEL_END: 1,
  LOSS: 2,
  PAUSE: 3,
  START: 4,
  END: 5,
  PLAYING: 6
}

var currGameState = gameStates.START;

//Gravity
function calculateGravity() {
  if (player.jump.jumping) {
    return;
  }

  if (player.bottom() > FLOOR) {
    player.setBottomTo(FLOOR);
  } else if (player.bottom() < FLOOR) {
    player.y += GRAVITY_STEP;
  }
}

//Game objects
function GameObject(x, y, width, height) {
  this.x = x;
  this.y = y;
  this.originX = x;
  this.originY = y;
  this.width = width;
  this.height = height;
}

GameObject.prototype.top = function() {return this.y};
GameObject.prototype.bottom = function() {return this.y + this.height};
GameObject.prototype.left = function() {return this.x};
GameObject.prototype.right = function() {return this.x + this.width};
GameObject.prototype.midY = function() {return this.y + (this.height / 2) };
GameObject.prototype.midX = function() {return this.x + (this.width / 2) };

GameObject.prototype.setBottomTo = function (bottom) {
  this.y = bottom - this.height;
};
GameObject.prototype.setRightTo = function (right) {
  this.x = right - this.width;
};


//Collision
function isCollide(a, b) {
  return (a.left() <= b.right() && a.right() >= b.left()) &&
         (a.top() <= b.bottom() && a.bottom() >= b.top())
}
