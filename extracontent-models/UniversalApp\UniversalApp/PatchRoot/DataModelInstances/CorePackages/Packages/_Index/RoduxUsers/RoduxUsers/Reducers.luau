local l_Parent_0 = script:FindFirstAncestor("RoduxUsers").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Users.byUserId);
local v3 = require(script.Users.byUsername);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.combineReducers({
        byUserId = v2(v4), 
        byUsername = v3(v4)
    });
end;