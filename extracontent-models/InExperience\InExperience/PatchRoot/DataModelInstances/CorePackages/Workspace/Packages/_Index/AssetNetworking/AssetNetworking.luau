local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createGetAssetDetails);
return {
    config = function(v2) --[[ Line: 8 ]] --[[ Name: createRequestThunks ]]
        -- upvalues: v1 (copy)
        return {
            GetAssetDetails = v1(v2)
        };
    end, 
    ["jest.config"] = script["jest.config"]
};