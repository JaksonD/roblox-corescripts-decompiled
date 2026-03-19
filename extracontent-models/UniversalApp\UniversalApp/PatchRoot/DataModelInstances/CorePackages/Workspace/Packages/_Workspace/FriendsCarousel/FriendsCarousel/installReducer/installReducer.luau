local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_RoduxUserPermissions_0 = v1.RoduxUserPermissions;
local l_RoduxAnalytics_0 = v1.RoduxAnalytics;
local v6 = require(script.Parent.Users);
local v7 = require(script.Parent.Friends);
local v8 = require(script.Parent.Presence);
local l_ShowContactImporterParams_0 = v1.ShowContactImporterParams;
return function() --[[ Line: 15 ]]
    -- upvalues: l_Rodux_0 (copy), v6 (copy), v7 (copy), v8 (copy), l_RoduxUserPermissions_0 (copy), l_RoduxNetworking_0 (copy), l_ShowContactImporterParams_0 (copy), l_RoduxAnalytics_0 (copy)
    return l_Rodux_0.combineReducers({
        Users = v6, 
        Friends = v7, 
        Presence = v8, 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        ShowContactImporterParams = l_ShowContactImporterParams_0, 
        Analytics = l_RoduxAnalytics_0.installReducer()
    });
end;