local l_Parent_0 = script:FindFirstAncestor("RoduxCall").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.currentCall);
local v3 = require(script.suggestedCallees);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.combineReducers({
        currentCall = v2(), 
        suggestedCallees = v3(v4)
    });
end;