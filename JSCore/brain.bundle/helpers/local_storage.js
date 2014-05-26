var LocalStorage;

LocalStorage = (function() {
  function LocalStorage() {}

  LocalStorage.prototype.setItem = function(key, value) {
    return console.log("set " + value + " for key " + key);
  };

  LocalStorage.prototype.getItem = function(key) {
    return null;
  };

  return LocalStorage;

})();

module.exports = new LocalStorage();
