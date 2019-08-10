//Spikes
function Spikes(pImage, x, y) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }

  //Spike Collision
  this.calculate = function() {
    if (isCollide(player, this)) {
      if (!player.dead) {
        player.dead = true;
        player.deathStep = 1;
      }
    }
  }
}
Spikes.prototype = Object.create(GameObject.prototype);
