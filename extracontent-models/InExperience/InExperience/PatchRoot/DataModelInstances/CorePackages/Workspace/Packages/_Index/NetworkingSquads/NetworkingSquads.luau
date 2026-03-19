local v0 = require(script.createRequestThunks);
local v1 = require(script.networkingSquadTypes);
return {
    ["jest.config"] = script["jest.config"], 
    config = v0, 
    networkingSquadTypes = v1
};