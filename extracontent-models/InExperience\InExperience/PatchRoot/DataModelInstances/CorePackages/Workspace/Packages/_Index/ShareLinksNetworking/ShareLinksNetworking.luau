local v0 = require(script.createRequestThunks);
local v1 = require(script.networkingShareLinkTypes);
return {
    ["jest.config"] = script["jest.config"], 
    config = v0, 
    networkingShareLinkTypes = v1
};