function drawObjects(objects) {
  for (var i = 0; i < objects.length; i++) {
    objects[i].draw();
  }
}

function calculateObjects(objects) {
  for (var i = 0; i < objects.length; i++) {
    objects[i].calculate();
  }
}
