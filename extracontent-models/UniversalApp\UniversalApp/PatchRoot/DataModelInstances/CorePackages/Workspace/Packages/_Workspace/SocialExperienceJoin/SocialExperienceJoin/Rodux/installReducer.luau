local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Rodux.Games);
local v5 = require(l_script_FirstAncestor_0.Rodux.Presence);
return function() --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.combineReducers({
        NetworkStatus = v3.installReducer(), 
        Games = v4.installReducer(), 
        Presence = v5.installReducer()
    });
end;