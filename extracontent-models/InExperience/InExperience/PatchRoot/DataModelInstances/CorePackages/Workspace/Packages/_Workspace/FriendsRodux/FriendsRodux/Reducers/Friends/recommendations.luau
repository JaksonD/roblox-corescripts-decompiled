local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.byUserId);
local v3 = require(script.bySource);
local v4 = require(script.hasIncomingFriendRequest);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return v1.combineReducers({
        byUserId = v2(v5), 
        bySource = v3(v5), 
        hasIncomingFriendRequest = v4(v5)
    });
end;