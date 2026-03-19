local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetBlockedUsers);
local v2 = require(l_networkRequests_0.createBlockUserById);
local v3 = require(l_networkRequests_0.createUnblockUserById);
local v4 = require(l_networkRequests_0.createIsBlockedById);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return {
        GetBlockedUsers = v1(v5), 
        BlockUserById = v2(v5), 
        UnblockUserById = v3(v5), 
        IsBlockedById = v4(v5)
    };
end;