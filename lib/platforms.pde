
// Platform movement functions
function PlatformMovement(thisPlatform) {

  // move the platform px pixels to the left
  this.left = function(px) {

    if (!isCollide(player, thisPlatform)) {
      thisPlatform.x -= px;
    }
    else if (thisPlatform.playerIsOnPlatform()) {
      thisPlatform.x -= px;
      player.x -= px;
    }
  };

  // move the platform px pixels to the right
  this.right = function(px) {

    if (!isCollide(player, thisPlatform)) {
      thisPlatform.x += px;
    }
    else if (thisPlatform.playerIsOnPlatform()) {
      thisPlatform.x += px;
      player.x += px;
    }
  };

  // move the platform px pixels up
  this.up = function(px) {

    if (!isCollide(player, thisPlatform)) {
      thisPlatform.y -= px;
    }
    else if (thisPlatform.playerIsOnPlatform()) {
      thisPlatform.y -= px;
      player.y -= px;
    }
  };

  // move the platform px pixels down
  this.down = function(px) {

    if (!isCollide(player, thisPlatform)) {
      thisPlatform.y += px;
    }
    else if (thisPlatform.playerIsOnPlatform()) {
      thisPlatform.y += px;
      player.y += px;
    }
  };

  // the current step in the loop and the current coordinates
  this.currentStep = 0;
  this.currentCoords = {left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0};

  // sets up the loop function
  // WARNING: Make sure the steps and directions array move the platform back to its starting point, so that the loop works
  this.setup = function(steps, directions, speed) {

    // check if steps and directions are of the same length
    if (steps.length != directions.length) {
      return;
    }

    // set the current coords to the platform's origin coords
    this.currentCoords.left = thisPlatform.originX;
    this.currentCoords.right = thisPlatform.originX + thisPlatform.width;
    this.currentCoords.top = thisPlatform.originY;
    this.currentCoords.bottom = thisPlatform.originY + thisPlatform.height;

    // variables for the loop
    this.steps = steps;
    this.directions = directions;
    this.speed = speed;

    // for checking if the platform is setup
    this.setupDone = true;
  }

  // platform's movement loop
  // call this (without arguments) in the calculate function before the player's movement and jump, gravity and platform collision
  this.loop = function() {

    // check if platform is setup
    if (!this.setupDone) {
      return;
    }

    // variables for the loop
    directions = this.directions;
    steps = this.steps;
    speed = this.speed;
    currentStep = this.currentStep;
    currentCoords = this.currentCoords;

    // check if the platform is at the designated location
    // check for the platform moving left, right, up and down
    if (directions[currentStep] == "L") {
      if (thisPlatform.left() == currentCoords.left - steps[currentStep] * speed && thisPlatform.right() == currentCoords.right - steps[currentStep] * speed) {
        currentCoords.left -= steps[currentStep] * speed;
        currentCoords.right -= steps[currentStep] * speed;
        currentStep++;
      }
    }

    if (directions[currentStep] == "R") {
      if (thisPlatform.left() == currentCoords.left + steps[currentStep] * speed && thisPlatform.right() == currentCoords.right + steps[currentStep] * speed) {
        currentCoords.left += steps[currentStep] * speed;
        currentCoords.right += steps[currentStep] * speed;
        currentStep++;
      }
    }

    if (directions[currentStep] == "U") {
      if (thisPlatform.top() == currentCoords.top - steps[currentStep] * speed && thisPlatform.bottom() == currentCoords.bottom - steps[currentStep] * speed) {
        currentCoords.top -= steps[currentStep] * speed;
        currentCoords.bottom -= steps[currentStep] * speed;
        currentStep++;
      }
    }

    if (directions[currentStep] == "D") {
      if (thisPlatform.top() == currentCoords.top + steps[currentStep] * speed && thisPlatform.bottom() == currentCoords.bottom + steps[currentStep] * speed) {
        currentCoords.top += steps[currentStep] * speed;
        currentCoords.bottom += steps[currentStep] * speed;
        currentStep++;
      }
    }

    // move the platform left, right, up and down
    if (directions[currentStep] == "L") {
      this.left(speed);
    }

    if (directions[currentStep] == "R") {
      this.right(speed);
    }

    if (directions[currentStep] == "U") {
      this.up(speed);
    }

    if (directions[currentStep] == "D") {
      this.down(speed);
    }

    // reset the current step when it's the last one
    if (currentStep == steps.length) {
      currentStep = 0;
    }

    // update the current step
    this.currentStep = currentStep;
  }
}

// Platforms
function Platform(x, y, width, height) {
  GameObject.call(this, x, y, width, height);

  this.playerIsOnPlatform = function () {
    if ((isCollide(player, this)) && ((this.top() <= player.bottom()) && (player.bottom() <= this.bottom()))) {
      return true;
    }
    else {
      return false;
    }
  }

  // remember to include movePixels in your function calls
  this.movePixels = new PlatformMovement(this);

  this.draw = function () {
    rect(this.x, this.y, this.width, this.height);
  }

}
Platform.prototype = Object.create(GameObject.prototype);

// Calculate platforms
function calculatePlatforms(platforms) {
  for (var i = 0; i < platforms.length; i++) {
    calculatePlatform(platforms[i]);
  }
}

// Draw platforms
function drawPlatforms(platforms) {
  for (var i = 0; i < platforms.length; i++) {
    platforms[i].draw();
  }
}

// loop platforms
function loopPlatforms(platforms) {
  for (var i = 0; i < platforms.length; i++) {
    platforms[i].movePixels.loop();
  }
}

// Platform functions
function calculatePlatform(platform) {
  var headBump = false;
  if (player.jump.jumping) {
    if (isCollide(player, platform)) {
      // If player head touch the platform, stop him from going up
      if ((platform.top() <= player.top()) && (player.top() <= platform.bottom())) {
        player.y = platform.bottom();
        stopJump();
        headBump = true;
      }
    }
  }

  if (isCollide(player, platform)) {
    // If player feet touch the platform
    if ((platform.top() <= player.bottom()) && (player.bottom() <= platform.bottom())) {
      player.setBottomTo(platform.top());
      return
    }

    if (headBump) {
      return;
    }

    // If player bumps from the left
    if (player.midX() < platform.midX()) {
      var startX = player.x
      if (player.x > MARGIN) {
          player.x = player.x - player.playerMovement.moveSpeed;
      }
      return
    } else {
      // If player bumps from the right
      var startX = player.x
      if (player.right() < SCREEN_WIDTH - MARGIN) {
          player.x = player.x + player.playerMovement.moveSpeed;
      }
    }
  }
}
