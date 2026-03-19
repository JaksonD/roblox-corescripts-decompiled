local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.ProfileRoduxNetworking);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.combineReducers({
        NetworkStatus = v3.installReducer()
    });
end;