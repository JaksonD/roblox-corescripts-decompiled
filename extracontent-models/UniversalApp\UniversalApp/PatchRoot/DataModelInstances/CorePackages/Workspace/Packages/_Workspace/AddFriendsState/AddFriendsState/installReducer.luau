local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ContactImporter);
local v3 = require(l_Parent_0.Rodux);
return function() --[[ Line: 7 ]]
    -- upvalues: v3 (copy), l_script_FirstAncestor_0 (copy), v2 (copy)
    return v3.combineReducers({
        NetworkStatus = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking).installReducer(), 
        Games = require(script.Parent.RoduxGames).installReducer(), 
        Friends = require(script.Parent.RoduxFriends).installReducer(), 
        Users = require(script.Parent.RoduxUsers).installReducer(), 
        Analytics = require(script.Parent.RoduxAnalytics).installReducer(), 
        Presence = require(script.Parent.RoduxPresence).installReducer(), 
        ShowContactImporterParams = v2.ShowContactImporterParams, 
        RequestsFromOriginSourceType = require(script.Parent.RequestsFromOriginSourceType), 
        ContactImporterWarning = require(script.Parent.contactImporterWarning), 
        IsUserFollowing = require(script.Parent.IsUserFollowing)
    });
end;