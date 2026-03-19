local v0 = require(script.createRequestThunks);
local v1 = require(script.Enums);
return {
    ["jest.config"] = script["jest.config"], 
    config = v0, 
    Enums = v1
};