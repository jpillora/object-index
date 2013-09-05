var ObjectIndex = require("../");

//create indicies for the "a" and "b" keys
var index = ObjectIndex("a", "b");

//dummy data
var x = {a:"foo",  b:"bar",  c: "bazz"};
var y = {a:"ping", b:"pong", c: "pung"};

//insert into index
index.add(x);
index.add(y);

//search all indices by value
console.log("Get 'x': " + (index.get("foo") === x));
console.log("Get 'y': " + (index.get("pong") === y));

//search by a particular index and value
console.log("Get 'x' by 'a': " + (index.getBy("a","foo") === x));
console.log("Get 'y' by 'b': " + (index.getBy("b","pong") === y));

//there is no "c" index !
console.log("Get by 'c': " + (index.get("bazz") === null));

//get nth object
console.log("Get 0th object: " + (index.get(0) === x));

//remove by value
console.log("Remove by value: " + (index.remove("bar") === x));

//get nth object (should be y this time)
console.log("Get 0th object again: " + (index.get(0) === y));

//remove by value again (should be non existant)
console.log("Remove by value again: " + (index.remove("bar") === null));