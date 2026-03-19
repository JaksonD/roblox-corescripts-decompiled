local v0 = require(script.createSignal);
local v1 = require(script.shallowEqual);
local v2 = require(script.getAncestors);
local v3 = require(script.mockableWarn);
local v4 = require(script.waitForEvents);
return {
    createSignal = v0, 
    shallowEqual = v1, 
    getAncestors = v2, 
    mockableWarn = v3, 
    waitForEvents = v4
};