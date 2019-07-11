function Door(pImage, x, y, nextLevel) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.nextLevel = nextLevel;

  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }

  //If player collides with door, change game state to Win
  this.calculate = function() {
    if (isCollide(player, this)) {
      currGameState = gameStates.LEVEL_END;
      location.assign(this.nextLevel);
    }
  }
}
Door.prototype = Object.create(GameObject.prototype);
