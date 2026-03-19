local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(script.Parent.configuredUsers);
local v4 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.combineReducers({
        Users = v3(), 
        NetworkStatus = v4.installReducer()
    });
end;