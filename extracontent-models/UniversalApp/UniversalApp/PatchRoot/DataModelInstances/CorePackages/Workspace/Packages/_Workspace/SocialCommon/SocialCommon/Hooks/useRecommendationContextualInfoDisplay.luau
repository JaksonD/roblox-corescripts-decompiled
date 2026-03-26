local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_script_FirstAncestor_0.Utils.getRecommendationContextualInfoDisplay);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v5) --[[ Line: 31 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v3 (copy)
    local v6 = l_useLocalization_0({
        singularMutualConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendTitle" or "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendsTitle" or "Feature.Friends.Label.MutualConnections"; 
            numConnections = v5.mutualFriendsCount
        }, 
        frequents = "Feature.Friends.Label.Frequent", 
        connectionRequests = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendRequest" or "Feature.Friends.Label.ConnectionRequest", 
        contacts = "Feature.Friends.Description.FromContacts"
    });
    return v3({
        recommendation = v5, 
        localized = v6
    });
end;