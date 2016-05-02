fs = require('fs');

module.exports = {
  readInput: function(fileName, readFunc){
    return fs.readFile(fileName, 'utf8', function (err,data) {
      if (err) {
        return console.log(err);
      }
      readFunc(data);
      return data;
    });
  }
};
