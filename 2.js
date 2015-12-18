var tools = require('./tools');

tools.readInput("2.input", function(data){
  //each line contains LxWxH
  var total = 0;
  data.split("\n")
    .forEach(function(element,index){
      var dimensions = element.split("x");
      var length = dimensions[0];
      var width = dimensions[1];
      var height = dimensions[2];
      var firstSurface = length * width;
      var secondSurface = width * height;
      var thirdSurface = height * length;
      var result = (2 * firstSurface) +
        (2 * secondSurface) +
        (2 * thirdSurface) +
        Math.min(firstSurface, secondSurface, thirdSurface);
      total += result;
    });
    console.log(total);
});