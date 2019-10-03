// Key
function Key(pImage, x, y) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }

  // Fat King Collision
  this.calculate = function() {
    if (isCollide(player, this)) {
      this.pImage = loadImage("../../assets/objects/emptyKey.png");
      objects[6].playerCanEnter = true;
    }
  }
}
Key.prototype = Object.create(GameObject.prototype);
