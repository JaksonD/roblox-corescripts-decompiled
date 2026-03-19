local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking);
local v4 = require(script.Parent.ProfileShareLinksReducer);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.combineReducers({
        ProfileShareLinks = v4, 
        NetworkingStatus = v3.installReducer()
    });
end;