local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_React_0 = v2.React;
local v5 = require(l_Parent_0.Common.Constants);
local v6 = require(l_Parent_1.SocialCommon);
local _ = require(l_Parent_1.UserList);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local l_getRecommendationContextualInfoType_0 = v6.Utils.getRecommendationContextualInfoType;
local v10 = require(l_Parent_0.Analytics);
local v11 = require(l_Parent_0.Analytics.getFriendStatus);
local l_EventNames_0 = v10.EventNames;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
return function(v14) --[[ Line: 44 ]] --[[ Name: useOnActivatedTile ]]
    -- upvalues: l_React_0 (copy), v5 (copy), l_getRecommendationContextualInfoType_0 (copy), l_RecommendationContextType_0 (copy), l_EventNames_0 (copy), v11 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_HttpService_0 (copy)
    local v15 = l_React_0.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        if v14.recommendation.mutualFriendsCount then
            return v14.recommendation.mutualFriendsCount;
        elseif v14.recommendation.mutualFriendsList then
            return #v14.recommendation.mutualFriendsList;
        else
            return nil;
        end;
    end, {
        v14.recommendation.mutualFriendsCount, 
        v14.recommendation.mutualFriendsList
    });
    local v16 = l_React_0.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v5 (ref), v15 (copy), l_getRecommendationContextualInfoType_0 (ref), l_RecommendationContextType_0 (ref)
        v14.openProfilePeekView(v14.userId, {
            absolutePosition = v14.absolutePosition, 
            source = v5.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            mutualFriendsCount = v15, 
            recommendationSessionId = v14.recommendationSessionId, 
            recommendationRank = v14.recommendation.rank, 
            recommendationContextType = v14.recommendation.contextType and v14.recommendation.contextType.rawValue() or nil, 
            contextualInfoType = l_getRecommendationContextualInfoType_0(v14.recommendation), 
            contactProps = if v14.recommendation.contextType == l_RecommendationContextType_0.Contacts then {
                contactId = v14.userId, 
                avatarImageUrl = if v14.recommendation.thumbnailEntities then v14.recommendation.thumbnailEntities.avatarImageUrl else nil, 
                contactName = v14.recommendation.entityDisplayName
            } else nil, 
            profileType = v14.recommendation.contextType == l_RecommendationContextType_0.Contacts and "FromContacts" or nil
        });
    end, {
        v14.openProfilePeekView, 
        v14.userId, 
        v14.absolutePosition, 
        v15, 
        v14.recommendationSessionId, 
        v14.recommendation
    });
    return (l_React_0.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v16 (copy), v14 (copy), l_EventNames_0 (ref), v11 (ref), l_RecommendationContextType_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), l_HttpService_0 (ref)
        v16();
        v14.fireAnalyticsEvent(l_EventNames_0.UserPressed, {
            recommendationId = v14.userId, 
            friendStatus = v11(v14.friendshipStatus, v14.recommendation.hasIncomingFriendRequest), 
            recommendationContextType = v14.recommendation.contextType, 
            recommendationRank = v14.recommendation.rank, 
            absolutePosition = v14.absolutePosition, 
            positionInRow = v14.absolutePosition, 
            contactId = if v14.recommendation.contextType == l_RecommendationContextType_0.Contacts then v14.userId else nil, 
            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v14.userPresenceType else nil, 
            interactionUuid = l_HttpService_0:GenerateGUID(false)
        });
    end, {
        v16, 
        v14.fireAnalyticsEvent, 
        v14.userId, 
        v14.friendshipStatus, 
        v14.absolutePosition, 
        v14.userPresenceType, 
        v14.recommendation.hasIncomingFriendRequest, 
        v14.recommendation.contextType, 
        v14.recommendation.rank
    }));
end;