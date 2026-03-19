local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createGetConnectionsByEntityId);
local v2 = require(script.types);
return {
    config = function(v3) --[[ Line: 9 ]] --[[ Name: createRequestThunks ]]
        -- upvalues: v1 (copy)
        return {
            GetConnectionsByEntityId = v1(v3)
        };
    end, 
    Types = v2, 
    ["jest.config"] = script["jest.config"]
};