local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createJoinGroup);
local v2 = require(l_networkRequests_0.createCancelJoinGroupRequest);
local v3 = require(l_networkRequests_0.createLeaveGroup);
local v4 = require(l_networkRequests_0.createMakePrimaryGroup);
local v5 = require(l_networkRequests_0.createRemovePrimaryGroup);
return {
    config = function(v6) --[[ Line: 12 ]] --[[ Name: createRequestThunks ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
        return {
            JoinGroup = v1(v6), 
            CancelJoinGroupRequest = v2(v6), 
            LeaveGroup = v3(v6), 
            MakePrimaryGroup = v4(v6), 
            RemovePrimaryGroup = v5(v6)
        };
    end, 
    ["jest.config"] = script["jest.config"]
};