local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_RoduxNetworking_0 = require(l_script_FirstAncestor_0.dependencies).RoduxNetworking;
return function() --[[ Line: 12 ]] --[[ Name: installReducer ]]
    -- upvalues: v1 (copy), l_RoduxNetworking_0 (copy)
    return v1.combineReducers({
        VerifiedUsers = require(script.VerifiedUsers), 
        VerifiedGroups = require(script.VerifiedGroups), 
        NetworkStatus = l_RoduxNetworking_0.installReducer()
    });
end;