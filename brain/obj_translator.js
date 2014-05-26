var es = require('event-stream');
var gutil = require('gulp-util');
var Buffer = require('buffer').Buffer;
var path = require('path');

function capitaliseFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

var processFunction = function(target) {
  var FN_ARGS = /^function\s*[^\(]*\(\s*([^\)]*)\)/m;
  var text = target.toString();
  var args = text.match(FN_ARGS)[1].split(',');
  return args;
}

function generateMethod(name, params) {
  var prefix = "- (id)" + name + "With";
  var methodInterface = prefix;

  for (var i = 0; i < params.length; i++) {
    var param = params[i].trim();
    if (param == params[0]) {
      methodInterface += capitaliseFirstLetter(param)
    } else {
      methodInterface += " " + param
    }

    methodInterface += ":(NSString*)" + param;
  };

  methodInterface += ";"

  return methodInterface;
}

var generateObjcHeader = function(str, fileName) {
  var prefix = "var module = {'exports':{}}; var exports = module.exports;";
  var m = eval(prefix + str + ";module;");
  var methods = []
  for(k in m.exports) {
    var params = processFunction(m.exports[k].toString())
    methods.push(generateMethod(k, params))
  }

  var fileName = gutil.replaceExtension(fileName, "");
  fileNameParts = fileName.split("_");

  var name = "";
  for(var i = 0; i < fileNameParts.length; i++) {
    name += capitaliseFirstLetter(fileNameParts[i]);
  }

  var methodBodyes = [];
  for(var i = 0; i < methods.length; i++) {
    var m = methods[i];
    methodBodyes.push(m + "\n{\n\n}\n");
  }

  var header = "@interface " + name + " : NSObject\n";

  header += "\n" + methods.join("\n") + "\n\n";

  header += "@end\n";

  var body = "@implementation " + name + "\n";

  body += "\n" + methodBodyes.join("\n") + "\n";

  body += "@end\n";

  return {
    h: header,
    m: body
  };
}

module.exports = function (type) {
  function modifyFile(file) {
    if (file.path.indexOf(".js") == -1) return this.emit('data', file);
    if (file.isNull()) return this.emit('data', file);
    if (file.isStream()) return this.emit('error', new Error("gulp-objc: Streaming not supported"));

    var data;
    var str = file.contents.toString('utf8');
    var dest = gutil.replaceExtension(file.path, "." + type);

    try {
      data = generateObjcHeader(str, file.path.split("/").pop());
    } catch (err) {
      return this.emit('error', new Error(err));
    }

    file.contents = new Buffer(data[type]);
    file.path = dest;
    this.emit('data', file);
  }

  return es.through(modifyFile);
};