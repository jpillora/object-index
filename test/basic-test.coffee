
{expect} = require "chai"
Store = require "../"

describe "internal > ", ->

  store = null
  x = {a:"foo",  b:"bar",  c: "bazz"}

  beforeEach ->
    store = Store "a","b"
    store.add x

  it "init", ->
    expect(Store).to.be.a('function')
    expect(store).to.be.an.instanceof(Array)
    expect(store).to.be.an('object')
    expect(store.length).to.equal(1)
    expect(store.add).to.be.a('function')
    expect(store.get).to.be.a('function')
    expect(store.getBy).to.be.a('function')

  it "indices", ->
    expect(store.indices).to.deep.equal({ a: { foo: x }, b: { bar: x } })

describe "basic > ", ->

  store = null
  x = {a:"foo",  b:"bar",  c: "bazz"}
  y = {a:"ping", b:"pong", c: "pung"}

  beforeEach ->
    store = Store "a","b"
    store.add x
    store.add y

  it "init", ->
    expect(store.length).to.equal(2)

  describe "get type > ", ->
    it "index operator", ->
      expect(store[0]).to.equal(x)
    it "number", ->
      expect(store.get(0)).to.equal(x)
    it "string from 'a' index", ->
      expect(store.get("foo")).to.equal(x)
    it "string from 'b' index", ->
      expect(store.get("bar")).to.equal(x)
    it "string from non-existant 'c' index", ->
      expect(store.get("bazz")).to.equal(null)

  describe "getBy > ", ->
    it "key from 'a' index", ->
      expect(store.getBy("a","foo")).to.equal(x)
    it "missing from 'a' index", ->
      expect(store.getBy("a","pong")).to.equal(null)
    it "key from 'b' index", ->
      expect(store.getBy("b","pong")).to.equal(y)
    it "key from non-existant 'c' index", ->
      expect(store.getBy("c","pung")).to.equal(null)

  describe "remove type > ", ->
    it "number", ->
      expect(store.get("foo")).to.equal(x)
      expect(store.length).to.equal(2)
      expect(store.remove(0)).to.equal(x)
      expect(store.length).to.equal(1)
      expect(store.get("foo")).to.equal(null)
      expect(store.remove(0)).to.equal(y)
      expect(store.length).to.equal(0)
    it "string", ->
      expect(store.get("foo")).to.equal(x)
      expect(store.remove("foo")).to.equal(x)
      expect(store.get("foo")).to.equal(null)
      expect(store.remove("foo")).to.equal(null)



