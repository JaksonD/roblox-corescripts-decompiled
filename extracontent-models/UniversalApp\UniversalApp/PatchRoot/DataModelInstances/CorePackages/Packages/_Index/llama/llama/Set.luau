local v0 = require(script.Parent.Dictionary);
return {
    add = require(script.add), 
    has = require(script.has), 
    intersect = require(script.intersect), 
    subtract = require(script.subtract), 
    toList = require(script.toList), 
    union = require(script.union), 
    copy = v0.copy
};