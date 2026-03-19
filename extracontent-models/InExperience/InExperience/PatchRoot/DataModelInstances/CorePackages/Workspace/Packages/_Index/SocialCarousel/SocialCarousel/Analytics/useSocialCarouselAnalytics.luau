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
return function() --[[ Line: 21 ]]
    -- upvalues: l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), l_Tile_0 (copy), l_HttpService_0 (copy), l_FFlagSocialCarouselEnableUserSeenEvents_0 (copy), l_RetrievalStatus_0 (copy)
    local v13 = nil;
    local v14 = nil;
    if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then
        v13 = v5();
        v14 = v3.useMemo(function() --[[ Line: 27 ]]
            -- upvalues: v13 (ref), v6 (ref)
            local l_sortAnalyticsData_0 = v13.sortAnalyticsData;
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
            v13.sortAnalyticsData
        });
    else
        v14 = v6();
        v13 = v5();
    end;
    local v16 = v13.source or "";
    local v19 = v3.useCallback(function(v17, v18) --[[ Line: 52 ]]
        -- upvalues: v14 (ref), v7 (ref), l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 (ref), l_Tile_0 (ref), v16 (copy), l_HttpService_0 (ref)
        v14.fireAnalyticsEvent(v7.UserPressed, {
            presence = if v17.presence then v17.presence.userPresenceType else "Offline", 
            absolutePosition = v18.absolutePosition, 
            positionInRow = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v18.absolutePosition else nil, 
            friendId = v17.id, 
            friendStatus = if v17.tileType == l_Tile_0.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend, 
            recommendationContextType = v17.contextType, 
            recommendationRank = v17.rank, 
            isRecommendation = v17.contextType and true or false, 
            universeId = if v17.presence then v17.presence.universeId else nil, 
            source = v16, 
            interactionUuid = l_HttpService_0:GenerateGUID(false)
        });
    end, {
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    local v22 = if l_FFlagSocialCarouselEnableUserSeenEvents_0 then v3.useCallback(function(v20, v21) --[[ Line: 78 ]]
        -- upvalues: v14 (ref), v7 (ref), l_Tile_0 (ref), v16 (copy)
        v14.fireAnalyticsEvent(v7.UserSeen, {
            userId = v20.id, 
            presence = if v20.presence then v20.presence.userPresenceType else "Offline", 
            absolutePosition = v21.absolutePosition, 
            friendStatus = if v20.tileType == l_Tile_0.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend, 
            recommendationContextType = v20.contextType, 
            recommendationRank = if v20.contextType then v20.rank else nil, 
            isRecommendation = v20.contextType and true or false, 
            source = v16, 
            universeId = if v20.presence then v20.presence.universeId else nil
        });
    end, {
        v16
    }) else nil;
    local v24 = v3.useCallback(function(v23) --[[ Line: 96 ]]
        -- upvalues: v14 (ref), v7 (ref), v16 (copy)
        v14.fireAnalyticsEvent(v7.TilesSeenCollection, {
            userId = v23.userIds, 
            absolutePosition = v23.absolutePositions, 
            presence = v23.presences, 
            recommendationRank = v23.recommendationRanks, 
            friendStatus = v23.friendStatuses, 
            recommendationContextType = v23.recommendationContextTypes, 
            isRecommendation = v23.isRecommendations, 
            universeId = v23.universeIds, 
            tileCount = v23.tileCount, 
            source = v16, 
            sessionEventCount = v23.sessionEventCount
        });
    end, {
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    local v26 = v3.useCallback(function(v25) --[[ Line: 129 ]]
        -- upvalues: v14 (ref), v7 (ref), v16 (copy)
        v14.fireAnalyticsEvent(v7.StartSquadPressed, {
            absolutePosition = v25, 
            source = v16
        });
    end, {
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    local v28 = v3.useCallback(function(v27) --[[ Line: 142 ]]
        -- upvalues: v14 (ref), v7 (ref), v13 (ref), v16 (copy), l_HttpService_0 (ref)
        v14.fireAnalyticsEvent(v7.ViewAddFriends, {
            friendCount = v13.friendCount, 
            absolutePosition = v27, 
            positionInRow = v27, 
            recommendationCount = v13.recommendationCount, 
            requestCount = v13.friendRequestCount, 
            source = v16, 
            interactionUuid = l_HttpService_0:GenerateGUID(false)
        });
    end, {
        v13.friendCount, 
        v13.recommendationCount, 
        v13.friendRequestCount, 
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    local v29 = v3.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v14 (ref), v7 (ref), v13 (ref), v16 (copy)
        v14.fireAnalyticsEvent(v7.ViewAllFriends, {
            friendCount = v13.friendCount, 
            recommendationCount = v13.recommendationCount, 
            source = v16
        });
    end, {
        v13.friendCount, 
        v13.recommendationCount, 
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    local v33 = v3.useCallback(function(v30, v31) --[[ Line: 179 ]]
        -- upvalues: v14 (ref), v7 (ref), l_RetrievalStatus_0 (ref), v16 (copy)
        local v32 = (not (v31 and typeof(v31) == "number") or v31 < 0) and 0 or v31;
        v14.fireAnalyticsEvent(v7.FriendsCarouselUILoadingTime, {
            loadingTime = v32, 
            fetch = v30, 
            status = l_RetrievalStatus_0.Done.rawValue(), 
            source = v16
        });
    end, {
        v16, 
        if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v14 else nil
    });
    return {
        userPressed = v19, 
        userSeen = if l_FFlagSocialCarouselEnableUserSeenEvents_0 then v22 else nil, 
        tilesSeenCollection = v24, 
        addFriendsPressed = v28, 
        friendsHeaderPressed = v29, 
        reportLoadingEvent = v33, 
        startSquadPressed = v26
    };
end;