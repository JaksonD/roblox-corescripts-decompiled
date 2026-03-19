local l_Parent_0 = script:FindFirstAncestor("RoduxShareLinks").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Invites);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.combineReducers({
        Invites = v2(v3)
    });
end;