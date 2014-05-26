var LocalStorage;

LocalStorage = (function() {
  function LocalStorage() {}

  LocalStorage.prototype.setItem = function(key, value) {
    return console.log("set " + value + " for key " + key);
  };

  return LocalStorage;

})();

module.exports = new LocalStorage();
