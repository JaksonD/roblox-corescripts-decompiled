local _ = require(script.createPageTracker);
local v1 = require(script.Hooks.usePageTracker);
local v2 = require(script.Components.ComponentTracker);
return {
    ["jest.config"] = script["jest.config"], 
    usePageTracker = v1, 
    ComponentTracker = v2
};