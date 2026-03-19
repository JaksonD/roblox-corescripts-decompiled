local l_Parent_0 = script.Parent.Parent.Parent;
local l_Rodux_0 = require(l_Parent_0.dependencies).Rodux;
local _ = require(script.Parent.AnalyticsTypes);
local v3 = require(script.bySessionKey);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_Rodux_0 (copy), v3 (copy)
    return l_Rodux_0.combineReducers({
        bySessionKey = v3(v4)
    });
end;