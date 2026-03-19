local v0 = require(script.HoldToPlayLauncher);
local v1 = require(script.useHoldToPlayStateAndCallbacks);
local v2 = require(script.Constants);
local v3 = require(script.HoldDetector);
return {
    Constants = v2, 
    HoldToPlayLauncher = v0, 
    HoldDetector = v3, 
    useHoldToPlayStateAndCallbacks = v1, 
    ["jest.config"] = script["jest.config"]
};