//Enemy
function Enemy(pImage, x, y, rightBound, leftBound, speed) {
  this.pImage = pImage;
  this.rightBound = rightBound;
  this.leftBound = leftBound;
  this.enemyMovement = new enemyMovement(speed);

  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);
  this.draw = function () {
    image(this.pImage, this.x, this.y);
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
function calculateEnemyMovement() {
  if (enemy.enemyMovement.movingLeft) {
    enemy.x -= enemy.enemyMovement.moveSpeed;
  }

  if (enemy.enemyMovement.movingRight) {
    enemy.x += enemy.enemyMovement.moveSpeed;
  }
}

//Decides where to stop. Left and right
function calculateEnemyBoundaries() {
  if (enemy.x <= enemy.leftBound) {
    enemy.enemyMovement.movingLeft = false;
    enemy.enemyMovement.movingRight = true;
  }

  if (enemy.x >= enemy.rightBound) {
    enemy.enemyMovement.movingLeft = true;
    enemy.enemyMovement.movingRight = false;
  }
}

//If player collides with enemy, change game state to Loss
function enemyCollision() {
  if (isCollide(player, enemy)) {
    currGameState = gameStates.LOSS;
  }
}
