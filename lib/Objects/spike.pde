// Spike
function Spike(pImage, x, y) {
  this.pImage = pImage;
  GameObject.call(this, x, y - pImage.height, pImage.width, pImage.height);

  this.draw = function () {
    image(this.pImage, this.x, this.y);
  }
}
Spike.prototype = Object.create(GameObject.prototype);
