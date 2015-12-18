var tools = require('./tools');

var floor = 0;
tools.readInput("1.input", function(data){
    data.split('')
    .forEach(function (element, index) {
      if(element == '(')
      {
        floor++;
      }
      else
      {
        floor--;
      }
    });
    console.log("floor is " + floor);
});

