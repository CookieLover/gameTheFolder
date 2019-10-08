//Enemy
function Enemy(rightImages, leftImages, idleImage, x, y, rightBound, leftBound, speed) {
  this.rightImages = rightImages;
  this.leftImages = leftImages;
  this.idleImage = idleImage;
  this.rightBound = rightBound;
  this.leftBound = leftBound;
  this.enemyMovement = new enemyMovement(speed);

  this.enemyImage = this.rightImages[0];
  this.framesLeft = 0;
  this.framesRight = 0;
  this.imageStep = 0;
  this.imageDuration = 3;

  GameObject.call(this, x, y - this.rightImages[0].height, this.rightImages[0].width, this.rightImages[0].height);

  this.draw = function () {
    if (this.enemyMovement.movingLeft) {
      this.imageStep += 1;
      if (this.imageStep == this.imageDuration) {
        this.framesLeft += 1;
        this.imageStep = 0;
      }
      if (this.framesLeft < this.leftImages.length) {
        this.enemyImage = this.leftImages[this.framesLeft];
      }
    }

    if (this.enemyMovement.movingRight) {
      this.imageStep += 1;
      if (this.imageStep == this.imageDuration) {
        this.framesRight += 1;
        this.imageStep = 0;
      }
      if (this.framesRight < this.rightImages.length) {
        this.enemyImage = this.rightImages[this.framesRight];
      }
    }

    if (!this.enemyMovement.movingLeft && !this.enemyMovement.movingRight) {
      this.enemyImage = this.idleImage;
    }

    if (this.framesLeft == this.leftImages.length - 1) {
      this.framesLeft = 0;
    }
    if (this.framesRight == this.rightImages.length - 1) {
      this.framesRight = 0;
    }

    // an offset is subtracted from the y of the enemy when drawing
    // so that images with different heights are drawn at the same bottom level
    image(this.enemyImage, this.x, this.y - (this.enemyImage.height - this.rightImages[0].height));
  }
}
Enemy.prototype = Object.create(GameObject.prototype);

//Enemy movement
function enemyMovement(moveSpeed) {
  this.movingLeft = true;
  this.movingRight = false;
  this.moveSpeed = moveSpeed;
}

//All enemy movement
function calculateEnemyMovement(enemy) {
  if (enemy.enemyMovement.movingLeft) {
    if (enemy.x > enemy.leftBound) {
      enemy.x -= enemy.enemyMovement.moveSpeed;
    }
  }

  if (enemy.enemyMovement.movingRight) {
    if (enemy.x < enemy.rightBound) {
      enemy.x += enemy.enemyMovement.moveSpeed;
    }
  }
}

// calculate enemy AI logic
function calculateEnemyLogic(enemy) {
  if (player.left() < enemy.left()) {
    enemy.enemyMovement.movingLeft = true;
    enemy.enemyMovement.movingRight = false;
  }

  if (player.right() > enemy.right()) {
    enemy.enemyMovement.movingLeft = false;
    enemy.enemyMovement.movingRight = true;
  }

  if (player.left() >= enemy.left() && player.right() <= enemy.right()) {
    enemy.enemyMovement.movingLeft = false;
    enemy.enemyMovement.movingRight = false;
  }
}

//Decides where to stop. Left and right
function calculateEnemyBoundaries(enemy) {
  if (enemy.x <= enemy.leftBound) {
    enemy.enemyMovement.movingLeft = false;
    enemy.enemyMovement.movingRight = true;
  }

  if (enemy.x >= enemy.rightBound) {
    enemy.enemyMovement.movingLeft = true;
    enemy.enemyMovement.movingRight = false;
  }
}

//If player collides with enemy, player dies
function enemyCollision(enemy) {
  if (isCollide(player, enemy)) {
    if (!player.dead) {
      player.dead = true;
      player.deathStep = 1;
    }
  }
}

// function to call all above enemy related functions
function calculateEnemies(enemies) {
  for (var i = 0; i < enemies.length; i++) {
    enemyCollision(enemies[i]);
    calculateEnemyLogic(enemies[i]);
    calculateEnemyMovement(enemies[i]);
  }
}

// function to draw all calculateEnemies
function drawEnemies(enemies) {
  for (var i = 0; i < enemies.length; i++) {
    enemies[i].draw();
  }
}
