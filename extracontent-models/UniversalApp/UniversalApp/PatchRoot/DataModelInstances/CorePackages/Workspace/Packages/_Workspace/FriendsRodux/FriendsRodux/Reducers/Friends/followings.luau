local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.followingStatuses);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.combineReducers({
        followingStatuses = v2(v3)
    });
end;