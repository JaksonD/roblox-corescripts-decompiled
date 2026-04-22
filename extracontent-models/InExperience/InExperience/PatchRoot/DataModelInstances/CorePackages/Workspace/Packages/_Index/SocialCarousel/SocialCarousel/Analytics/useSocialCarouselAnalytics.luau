local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local v6 = require(l_script_FirstAncestor_0.Analytics.initializeSocialCarouselAnalytics);
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_FFlagSocialCarouselEnableUserSeenEvents_0 = require(l_script_FirstAncestor_0.Flags).FFlagSocialCarouselEnableUserSeenEvents;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks;
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
return function() --[[ Line: 22 ]]
    -- upvalues: l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), l_Tile_0 (copy), l_HttpService_0 (copy), l_FFlagSocialCarouselEnableUserSeenEvents_0 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), l_RetrievalStatus_0 (copy)
    local v14 = nil;
    local v15 = nil;
    if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then
        v14 = v5();
        v15 = v3.useMemo(function() --[[ Line: 28 ]]
            -- upvalues: v14 (ref), v6 (ref)
            local l_sortAnalyticsData_0 = v14.sortAnalyticsData;
            return v6({
                infoForAllEvents = {
                    sortIndex = l_sortAnalyticsData_0 and l_sortAnalyticsData_0.sortIndex or nil, 
                    sortId = l_sortAnalyticsData_0 and l_sortAnalyticsData_0.sortId or nil, 
                    appPage = l_sortAnalyticsData_0 and l_sortAnalyticsData_0.appPage or nil, 
                    rowNumber = 1, 
                    feedRowNumber = l_sortAnalyticsData_0 and l_sortAnalyticsData_0.startRow or nil
                }
            });
        end, {
            v14.sortAnalyticsData
        });
    else
        v15 = v6();
        v14 = v5();
    end;
    local v17 = v14.source or "";
    local v20 = v3.useCallback(function(v18, v19) --[[ Line: 53 ]]
        -- upvalues: v15 (ref), v7 (ref), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (ref), l_Tile_0 (ref), v17 (copy), l_HttpService_0 (ref)
        v15.fireAnalyticsEvent(v7.UserPressed, {
            presence = if v18.presence then v18.presence.userPresenceType else "Offline", 
            absolutePosition = v19.absolutePosition, 
            positionInRow = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v19.absolutePosition else nil, 
            friendId = v18.id, 
            friendStatus = if v18.tileType == l_Tile_0.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend, 
            recommendationContextType = v18.contextType, 
            recommendationRank = v18.rank, 
            isRecommendation = v18.contextType and true or false, 
            universeId = if v18.presence then v18.presence.universeId else nil, 
            source = v17, 
            interactionUuid = l_HttpService_0:GenerateGUID(false)
        });
    end, {
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    local v23 = if l_FFlagSocialCarouselEnableUserSeenEvents_0 then v3.useCallback(function(v21, v22) --[[ Line: 79 ]]
        -- upvalues: v15 (ref), v7 (ref), l_Tile_0 (ref), v17 (copy)
        v15.fireAnalyticsEvent(v7.UserSeen, {
            userId = v21.id, 
            presence = if v21.presence then v21.presence.userPresenceType else "Offline", 
            absolutePosition = v22.absolutePosition, 
            friendStatus = if v21.tileType == l_Tile_0.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend, 
            recommendationContextType = v21.contextType, 
            recommendationRank = if v21.contextType then v21.rank else nil, 
            isRecommendation = v21.contextType and true or false, 
            source = v17, 
            universeId = if v21.presence then v21.presence.universeId else nil
        });
    end, {
        v17
    }) else nil;
    local v25 = v3.useCallback(function(v24) --[[ Line: 97 ]]
        -- upvalues: v15 (ref), v7 (ref), v17 (copy)
        v15.fireAnalyticsEvent(v7.TilesSeenCollection, {
            userId = v24.userIds, 
            absolutePosition = v24.absolutePositions, 
            presence = v24.presences, 
            recommendationRank = v24.recommendationRanks, 
            friendStatus = v24.friendStatuses, 
            recommendationContextType = v24.recommendationContextTypes, 
            isRecommendation = v24.isRecommendations, 
            universeId = v24.universeIds, 
            tileCount = v24.tileCount, 
            source = v17, 
            sessionEventCount = v24.sessionEventCount
        });
    end, {
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    local v27 = v3.useCallback(function(v26) --[[ Line: 130 ]]
        -- upvalues: v15 (ref), v7 (ref), v17 (copy)
        v15.fireAnalyticsEvent(v7.StartSquadPressed, {
            absolutePosition = v26, 
            source = v17
        });
    end, {
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    local v29 = if l_FFlagSocialCarouselShareQREnabled_0 then v3.useCallback(function(v28) --[[ Line: 144 ]]
        -- upvalues: v15 (ref), v7 (ref), v17 (copy)
        v15.fireAnalyticsEvent(v7.ShareQRPressed, {
            absolutePosition = v28, 
            source = v17
        });
    end, {
        v17, 
        v15
    }) else nil;
    local v31 = v3.useCallback(function(v30) --[[ Line: 158 ]]
        -- upvalues: v15 (ref), v7 (ref), v14 (ref), v17 (copy), l_HttpService_0 (ref)
        v15.fireAnalyticsEvent(v7.ViewAddFriends, {
            friendCount = v14.friendCount, 
            absolutePosition = v30, 
            positionInRow = v30, 
            recommendationCount = v14.recommendationCount, 
            requestCount = v14.friendRequestCount, 
            source = v17, 
            interactionUuid = l_HttpService_0:GenerateGUID(false)
        });
    end, {
        v14.friendCount, 
        v14.recommendationCount, 
        v14.friendRequestCount, 
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    local v32 = v3.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v15 (ref), v7 (ref), v14 (ref), v17 (copy)
        v15.fireAnalyticsEvent(v7.ViewAllFriends, {
            friendCount = v14.friendCount, 
            recommendationCount = v14.recommendationCount, 
            source = v17
        });
    end, {
        v14.friendCount, 
        v14.recommendationCount, 
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    local v36 = v3.useCallback(function(v33, v34) --[[ Line: 195 ]]
        -- upvalues: v15 (ref), v7 (ref), l_RetrievalStatus_0 (ref), v17 (copy)
        local v35 = (not (v34 and typeof(v34) == "number") or v34 < 0) and 0 or v34;
        v15.fireAnalyticsEvent(v7.FriendsCarouselUILoadingTime, {
            loadingTime = v35, 
            fetch = v33, 
            status = l_RetrievalStatus_0.Done.rawValue(), 
            source = v17
        });
    end, {
        v17, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v15 else nil
    });
    return {
        userPressed = v20, 
        userSeen = if l_FFlagSocialCarouselEnableUserSeenEvents_0 then v23 else nil, 
        tilesSeenCollection = v25, 
        addFriendsPressed = v31, 
        friendsHeaderPressed = v32, 
        reportLoadingEvent = v36, 
        startSquadPressed = v27, 
        shareQRPressed = if l_FFlagSocialCarouselShareQREnabled_0 then v29 else nil
    };
end;