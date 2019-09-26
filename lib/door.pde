function Door(pImage, x, y, nextLevel) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.nextLevel = nextLevel;
  this.playerCanEnter = true;

  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }

  //If player collides with door, go to next level or win screen
  this.calculate = function() {
    if (this.playerCanEnter) {
      if (!player.dead) {
        if (isCollide(player, this)) {
          location.assign(this.nextLevel);
        }
      }
    }
  }
}
Door.prototype = Object.create(GameObject.prototype);
