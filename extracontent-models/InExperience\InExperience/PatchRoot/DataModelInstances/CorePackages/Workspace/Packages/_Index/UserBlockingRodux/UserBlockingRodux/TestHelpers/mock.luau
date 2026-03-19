local l_Parent_0 = script:FindFirstAncestor("UserBlockingRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v3 = v1.makeActionCreator("BLOCK_USER_BY_ID_SUCCEEDED_ACTION", function(v2) --[[ Line: 6 ]]
    return {
        responseBody = {}, 
        namedIds = {
            users = v2.userId
        }
    };
end);
local v5 = v1.makeActionCreator("UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION", function(v4) --[[ Line: 14 ]]
    return {
        responseBody = {}, 
        namedIds = {
            users = v4.userId
        }
    };
end);
local v7 = v1.makeActionCreator("IS_BLOCKED_BY_ID_SUCCEEDED_ACTION", function(v6) --[[ Line: 22 ]]
    return {
        responseBody = true, 
        namedIds = {
            users = v6.userId
        }
    };
end);
return {
    mockBlockUserById = "BLOCK_USER_BY_ID_SUCCEEDED_ACTION", 
    mockUnblockUserById = "UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION", 
    mockIsBlockedById = "IS_BLOCKED_BY_ID_SUCCEEDED_ACTION", 
    mockBlockUserByIdAction = v3, 
    mockUnblockUserByIdAction = v5, 
    mockIsBlockedByIdAction = v7
};