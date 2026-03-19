local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_React_0 = v1.React;
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local l_getRecommendationContextualInfoDisplay_0 = require(l_Parent_1.SocialCommon).Utils.getRecommendationContextualInfoDisplay;
local _ = require(l_Parent_1.UserList);
return function(v7) --[[ Line: 29 ]] --[[ Name: useContextualInfo ]]
    -- upvalues: l_useLocalization_0 (copy), l_React_0 (copy), l_getRecommendationContextualInfoDisplay_0 (copy)
    local v8 = l_useLocalization_0({
        singularMutualConnection = "Feature.Friends.Label.OneMutual", 
        mutualConnections = {
            "Feature.Friends.Label.MultipleMutuals"; 
            numConnections = v7.recommendation.mutualFriendsCount
        }, 
        frequents = "Feature.Friends.Label.Frequent", 
        connectionRequests = "Feature.Friends.Label.Request", 
        contacts = "Feature.Friends.Description.FromContacts"
    });
    return l_React_0.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v7 (copy), l_getRecommendationContextualInfoDisplay_0 (ref), v8 (copy)
        local v9 = {
            contextType = v7.recommendation.contextType, 
            mutualFriendsList = v7.recommendation.mutualFriendsList, 
            mutualFriendsCount = v7.recommendation.mutualFriendsCount, 
            hasIncomingFriendRequest = v7.hasIncomingFriendRequest
        };
        return l_getRecommendationContextualInfoDisplay_0({
            recommendation = v9, 
            localized = v8
        });
    end, {
        v8, 
        v7.recommendation.contextType, 
        v7.recommendation.mutualFriendsList, 
        v7.recommendation.mutualFriendsCount, 
        v7.hasIncomingFriendRequest
    });
end;