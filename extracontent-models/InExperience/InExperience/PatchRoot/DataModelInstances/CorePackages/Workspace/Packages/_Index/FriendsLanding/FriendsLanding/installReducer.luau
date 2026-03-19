local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_RoduxUserPermissions_0 = v1.RoduxUserPermissions;
local l_RoduxAnalytics_0 = v1.RoduxAnalytics;
return function() --[[ Line: 9 ]]
    -- upvalues: l_Rodux_0 (copy), l_RoduxUserPermissions_0 (copy), l_RoduxNetworking_0 (copy), l_RoduxAnalytics_0 (copy)
    return l_Rodux_0.combineReducers({
        DeletedUsers = require(script.DeletedUsers), 
        VerifiedUsers = require(script.VerifiedUsers), 
        InactiveFriends = require(script.InactiveFriends), 
        Users = require(script.Users), 
        Friends = require(script.Friends)(), 
        Presence = require(script.Presence), 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        Analytics = l_RoduxAnalytics_0.installReducer()
    });
end;