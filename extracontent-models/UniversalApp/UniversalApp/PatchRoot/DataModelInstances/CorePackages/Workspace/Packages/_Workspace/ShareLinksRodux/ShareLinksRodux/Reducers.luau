local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Reducers.Invites);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.combineReducers({
        Invites = v3(v4)
    });
end;