local v0 = require(script.ExternalEventConnection);
local v1 = require(script.validatePropsWithForwardRef);
local v2 = require(script.isGamepadInput);
local v3 = require(script.wasLastInputGamepad);
local v4 = require(script.withIsGamepadInput);
local v5 = require(script.Components);
local v6 = require(script.Hooks);
local v7 = require(script.Profiling);
local _ = require(script.types);
local v9 = require(script.TestIdUtils);
local v10 = require(script.TagUtils);
return {
    Components = v5, 
    Hooks = v6, 
    Profiling = v7, 
    ExternalEventConnection = v0, 
    validatePropsWithForwardRef = v1, 
    isGamepadInput = v2, 
    wasLastInputGamepad = v3, 
    withIsGamepadInput = v4, 
    getTestId = v9.getTestId, 
    combineReactTags = v10.combineReactTags, 
    ["jest.config"] = script["jest.config"]
};