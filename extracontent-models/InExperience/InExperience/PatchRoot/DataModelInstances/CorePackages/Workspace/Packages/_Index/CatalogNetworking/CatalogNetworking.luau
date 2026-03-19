local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createGetItemAndBundleDetails);
return {
    config = function(v2) --[[ Line: 8 ]] --[[ Name: createRequestThunks ]]
        -- upvalues: v1 (copy)
        return {
            GetItemAndBundleDetails = v1(v2)
        };
    end, 
    ["jest.config"] = script["jest.config"]
};