local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Networking.RoduxNetworking);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.combineReducers({
        NetworkStatus = v3.installReducer()
    });
end;