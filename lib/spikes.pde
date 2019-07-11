//Spikes
function Spikes(pImage, x, y) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);
  this.draw = function() {
    image(this.pImage, this.x, this.y);
  }
}

//Spike Collision
function spikeCollision() {
  if (isCollide(player, enemy)) {
    console.log("u ded");
  }
}
