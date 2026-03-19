local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v4 = require(l_script_FirstAncestor_0.Rodux.Friends);
local v5 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
return function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    return v2.combineReducers({
        Presence = v3, 
        NetworkStatus = v5.installReducer(), 
        Friends = v4
    });
end;