local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createGetUserPremiumMembershipStatus);
return {
    config = function(v2) --[[ Line: 4 ]] --[[ Name: createRequestThunks ]]
        -- upvalues: v1 (copy)
        return {
            GetUserPremiumMembershipStatus = v1(v2)
        };
    end
};