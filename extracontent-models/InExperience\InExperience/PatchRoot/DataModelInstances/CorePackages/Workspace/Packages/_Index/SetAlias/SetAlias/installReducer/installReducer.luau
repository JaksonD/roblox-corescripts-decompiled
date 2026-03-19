local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_RoduxAliases_0 = v1.RoduxAliases;
return function() --[[ Line: 8 ]]
    -- upvalues: l_Rodux_0 (copy), l_RoduxAliases_0 (copy), l_RoduxNetworking_0 (copy)
    return l_Rodux_0.combineReducers({
        Aliases = l_RoduxAliases_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;