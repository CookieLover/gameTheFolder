var LEFT = 37, UP = 38, RIGHT = 39, DOWN = 40, SPACE = 32;
var playerIsOnPlatform = false;

// Player movement
function PlayerMovement(moveSpeed) {
  this.movingLeft = false;
  this.movingRight = false;
  this.movingUp = false;
  this.movingDown = false;
  this.moveSpeed = moveSpeed;
}

// Player jumping
function Jump(jumpSpeed, jumpDura, jumpStepCount) {
  this.jumping = false;
  this.jumpSpeed = jumpSpeed;
  this.jumpDura = jumpDura;
  this.jumpStepCount = jumpStepCount;
}

// Player
function Player(rightImages, leftImages, jumpImage, idleImage, deathImageRight, deathImageLeft, deathImageStick, x, y) {
  this.rightImages = rightImages;
  this.leftImages = leftImages;
  this.jumpImage = jumpImage;
  this.idleImage = idleImage;
  this.deathImageRight = deathImageRight;
  this.deathImageLeft = deathImageLeft;
  this.deathImageStick = deathImageStick;

  GameObject.call(this, x, y - this.rightImages[0].height, this.rightImages[0].width, this.rightImages[0].height);

  this.playerMovement = new PlayerMovement(5);
  this.jump = new Jump(3, 35, 0);
  this.playerImage = this.rightImages[0];
  this.framesLeft = 0;
  this.framesRight = 0;
  this.imageStep = 0;
  this.imageDuration = 2;

  this.carryingFatKing = false;
  this.dead = false;
  this.deathStep = 0;
  this.deathImageChange = [1, 9, 18, 27, 36, 45, 56];
  this.deathDuration = 60;
  this.deathImageTime = 0;
  this.rX = 10;
  this.rY = FLOOR - 175;

  this.fatKingSetup = function (rightImagesKing, leftImagesKing, jumpImageKing, idleImageKing, deathImageKingRight, deathImageKingLeft, deathImageKingStick) {
    this.rightImagesKing = rightImagesKing;
    this.leftImagesKing = leftImagesKing;
    this.jumpImageKing = jumpImageKing;
    this.idleImageKing = idleImageKing;
    this.deathImageKingRight = deathImageKingRight;
    this.deathImageKingLeft = deathImageKingLeft;
    this.deathImageKingStick = deathImageKingStick;
  }

  this.carryFatKing = function () {
    this.carryingFatKing = true;
    this.y = player.bottom() - playerRightKing[0].height;
    this.width = playerRightKing[0].width;
    this.height = playerRightKing[0].height;
    this.playerMovement.moveSpeed = 3;
    this.jump.jumpSpeed = 2;
  }

  this.clearPlayerMovementJump = function () {
    this.playerMovement.movingLeft = false;
    this.playerMovement.movingRight = false;
    this.playerMovement.movingUp = false;
    this.playerMovement.movingDown = false;
    this.jump.jumping = false;
  }

  this.draw = function () {
    for (var i = 0; i < platforms.length; i++) {
      if (isCollide(player, platforms[i])) {
        playerIsOnPlatform = true;
        break;
      } else {
        playerIsOnPlatform = false;
      }
    }

    if (this.jump.jumping) {
      this.playerImage = this.carryingFatKing ? this.jumpImageKing : this.jumpImage;
    }

    if (player.bottom() == FLOOR || playerIsOnPlatform) {
      this.playerImage = this.carryingFatKing ? this.idleImageKing : this.idleImage;
    }

    if (this.playerMovement.movingLeft) {
      this.imageStep += 1;
      if (this.imageStep == this.imageDuration) {
        this.framesLeft += 1;
        this.imageStep = 0;
      }
      if (this.framesLeft < this.leftImages.length) {
        this.playerImage = this.carryingFatKing ? this.leftImagesKing[this.framesLeft] : this.leftImages[this.framesLeft];
      }
    }

    else if (this.playerMovement.movingRight) {
      this.imageStep += 1;
      if (this.imageStep == this.imageDuration) {
        this.framesRight += 1;
        this.imageStep = 0;
      }
      if (this.framesRight < this.rightImages.length) {
        this.playerImage = this.carryingFatKing ? this.rightImagesKing[this.framesRight] : this.rightImages[this.framesRight];
      }
    }

    if (this.framesLeft == this.leftImages.length - 1) {
      this.framesLeft = 0;
    }
    if (this.framesRight == this.rightImages.length - 1) {
      this.framesRight = 0;
    }

    if (this.deathStep > 0 && this.deathStep <= this.deathDuration) {
      if (this.playerMovement.movingRight) {
        if (this.carryingFatKing) {
          if (this.deathStep == this.deathImageChange[this.deathImageTime]) {
            this.playerImage = this.deathImageKingRight[this.deathImageTime];
            this.deathImageTime++;
          }
          else {
            this.playerImage = this.deathImageKingRight[this.deathImageTime];
          }
        }
        else {
          this.playerImage = this.deathImageRight;
        }
      }
      else if (this.playerMovement.movingLeft) {
        if (this.carryingFatKing) {
          if (this.deathStep == this.deathImageChange[this.deathImageTime]) {
            this.playerImage = this.deathImageKingLeft[this.deathImageTime];
            this.deathImageTime++;
          }
          else {
            this.playerImage = this.deathImageKingLeft[this.deathImageTime];
          }
        }
        else {
          this.playerImage = this.deathImageLeft;
        }
      }
      else {
        this.playerImage = this.carryingFatKing ? this.deathImageKingStick : this.deathImageStick;
      }

     if (this.deathImageTime == 7) {
       this.deathImageTime = 0;
     }
      this.deathStep++;
    }

    else if (this.deathStep > this.deathDuration) {
      this.dead = false;
      this.deathStep = 0;
      this.playerImage = this.carryingFatKing ? this.jumpImageKing : this.jumpImage;
      this.clearPlayerMovementJump();
      this.x = this.rX;
      this.y = this.rY;
    }

    if (this.deathStep > 0 && this.deathStep <= this.deathDuration && this.carryingFatKing) {
      image(this.playerImage, this.x, this.y - (this.playerImage.height - this.deathImageKingRight[0].height));
    }
    else {
      image(this.playerImage, this.x, this.y);
    }
  }
}
Player.prototype = Object.create(GameObject.prototype);

//Player movement key press
void keyPressed() {
  for (var i = 0; i < platforms.length; i++) {
    if (isCollide(player, platforms[i])) {
      playerIsOnPlatform = true;
      break;
    } else {
      playerIsOnPlatform = false;
    }
  }
  if (!player.dead) {
    switch (keyCode) {
      case LEFT:
          player.playerMovement.movingLeft = true;
          break;

      case RIGHT:
          player.playerMovement.movingRight = true;
          break;

      case SPACE:
          if ((player.bottom() == FLOOR) || playerIsOnPlatform) {
            player.jump.jumping = true;
          }
          break;

      default:
          break;
    }
  }
}

void keyReleased() {
  if (!player.dead) {
    switch (keyCode) {
      case LEFT:
          player.playerMovement.movingLeft = false;
          break;

      case RIGHT:
          player.playerMovement.movingRight = false;
          break;

      default:
          break;
    }
  }
}

void mouseClicked() {
  if (gameState == gameStates.START) {
    gameState = gameStates.PLAYING;
  }
}

//Player stop jumpImages
function stopJump() {
  player.jump.jumping = false;
  player.jump.jumpStepCount = 0;
}

//Player calculate jumpImages
function calculateJump() {
    if (!player.dead) {
      if (player.jump.jumping) {
        player.jump.jumpStepCount += 1;
        if (player.jump.jumpStepCount < player.jump.jumpDura) {
          player.y -= player.jump.jumpSpeed;
        } else {
          stopJump();
        }
      }
    }
}

//All player movement
function calculatePlayerMovement() {
    if (!player.dead) {
      if ((player.playerMovement.movingLeft) && (player.x >= LEFT_MARGIN)) {
        player.x -= player.playerMovement.moveSpeed;
      }

      if ((player.playerMovement.movingRight) && (player.right() < SCREEN_WIDTH - RIGHT_MARGIN)) {
        player.x += player.playerMovement.moveSpeed;
      }
    }
}
