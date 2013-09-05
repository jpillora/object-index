# <name>object-index</end>

<description>Index Objects in Node and the Browser</end> - v<version>0.1.0</end>

## Download

<codeBlock("npm install " + name)>
```
npm install object-index
```
</end>

## Usage

<showFile("example/basic.js")>
``` javascript
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
console.log("Get: " + (index.get("foo") === x));
console.log("Get: " + (index.get("pong") === y));

//search by a particular index and value
console.log("Get by 'a': " + (index.getBy("a","foo") === x));
console.log("Get by 'b': " + (index.getBy("b","pong") === y));

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
```
</end>

<runFile("example/basic.js")>
```
Get: true
Get: true
Get by 'a': true
Get by 'b': true
Get by 'c': true
Get 0th object: true
Remove by value: true
Get 0th object again: true
Remove by value again: true

```
</end>

<license()>
#### MIT License

Copyright &copy; 2013 Jaime Pillora &lt;dev@jpillora.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</end>
