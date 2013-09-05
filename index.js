
function Store(keys) {
  if(!keys.length)
    throw "You must provide some keys to index";
  this.length = 0;
  this.list = [];
  this.indices = {};
  for(var i = 0; i < keys.length; i++)
    this.indices[keys[i]] = {};
}

Store.prototype.get = function(key) {
  return this.getBy(null, key);
};
Store.prototype.getBy = function(index, key) {
  switch(typeof key) {
    case "number": return this.list[key];
    case "string":
      if(index)
        return this.indices[index] ? this.indices[index][key] || null : null;
      for(index in this.indices)
        if(key in this.indices[index])
          return this.indices[index][key];
  }
  return null;
};

Store.prototype.add = function(obj) {
  this.length++;
  this.list.push(obj);
  for(var k in this.indices)
    if(k in obj)
      this.indices[k][obj[k]] = obj;
};

Store.prototype.remove = function(obj) {
  
  if(typeof obj !== "object")
    obj = this.get(obj);

  if(obj === null) return null;
  var i = this.list.indexOf(obj);
  if(i === -1) return null;
  this.length--;
  this.list.splice(i, 1);
  for(var k in this.indices)
    if(k in obj)
      delete this.indices[k][obj[k]];
  return obj;
};

module.exports = function() {
  return new Store(arguments);
};