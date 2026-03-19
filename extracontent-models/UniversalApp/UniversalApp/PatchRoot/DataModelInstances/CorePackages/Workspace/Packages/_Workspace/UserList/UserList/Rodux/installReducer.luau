local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Rodux.Presence);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.combineReducers({
        Presence = v4, 
        NetworkStatus = v3.installReducer()
    });
end;