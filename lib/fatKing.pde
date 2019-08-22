// Fat King
function FatKing(pImage, x, y) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }

  // Fat King Collision
  this.calculate = function() {
    if (isCollide(player, this) && !player.carryingFatKing) {
      this.pImage = loadImage("../../assets/platforms/fatKingNotInCage.png");
      player.carryFatKing();
      objects[0].playerCanEnter = true;
    }
  }
}
FatKing.prototype = Object.create(GameObject.prototype);
