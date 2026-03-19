local v0 = require(script.Hooks.useCrossPlaySettings);
local v1 = require(script.Hooks.useInitializeCrossPlaySettings);
local v2 = require(script.Reducers.CrossPlaySettings);
return {
    Hooks = {
        useInitializeCrossPlaySettings = v1, 
        useCrossPlaySettings = v0
    }, 
    Reducers = {
        CrossPlaySettings = v2
    }, 
    ["jest.config"] = script["jest.config"]
};