function Door(x, y, width, height) {
  GameObject.call(this, x, y, width, height);
  this.draw = function () {
    rect(this.x, this.y, this.width, this.height);
  }
}
Door.prototype = Object.create(GameObject.prototype);

//If player collides with door, change game state to Win
function doorCollision() {
  if (isCollide(player, door)) {
    currGameState = gameStates.LEVEL_END;
    location.assign("nextLevelTest.html");
  }
}
