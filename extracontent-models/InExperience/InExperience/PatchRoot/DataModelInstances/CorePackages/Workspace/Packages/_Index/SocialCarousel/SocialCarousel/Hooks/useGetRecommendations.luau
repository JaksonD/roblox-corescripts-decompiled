local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialCommon);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_RecommendationSourceEnum_0 = v2.Enums.RecommendationSourceEnum;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local function v12(v10, v11) --[[ Line: 28 ]]
    return v10.rank < v11.rank;
end;
return function(v13) --[[ Line: 32 ]]
    -- upvalues: l_useSelector_0 (copy), v6 (copy), v7 (copy), l_RecommendationSourceEnum_0 (copy), v3 (copy), v4 (copy), v12 (copy)
    local v15 = l_useSelector_0(function(v14) --[[ Line: 33 ]]
        -- upvalues: v6 (ref), v7 (ref), v13 (copy), l_RecommendationSourceEnum_0 (ref)
        return {
            recommendationsDict = v6(v14, string.format("%s.Friends.recommendations.byUserId.%s", v7.RODUX_KEY, v13 or "")) or {}, 
            friendshipStatus = v6(v14, string.format("%s.Friends.friendshipStatus", v7.RODUX_KEY)) or {}, 
            friendsCarouselRecommendationIds = v6(v14, string.format("%s.Friends.recommendations.bySource.%s", v7.RODUX_KEY, l_RecommendationSourceEnum_0.HomepageFriendsCarousel)) or {}, 
            hasIncomingFriendRequest = v6(v14, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", v7.RODUX_KEY)), 
            users = v6(v14, string.format("%s.Users.byUserId", v7.RODUX_KEY))
        };
    end);
    local v17 = v3.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v4 (ref), v15 (copy)
        return v4.List.filter(v4.Dictionary.keys(v15.recommendationsDict), function(v16) --[[ Line: 58 ]]
            -- upvalues: v15 (ref)
            return v15.friendsCarouselRecommendationIds[v16];
        end);
    end, {
        v15.recommendationsDict, 
        v15.friendsCarouselRecommendationIds
    });
    local v21 = v3.useCallback(function(v18) --[[ Line: 66 ]]
        -- upvalues: v15 (copy), v4 (ref)
        local v19 = v15.recommendationsDict[v18];
        local v20 = v15.friendshipStatus[v18];
        return v4.Dictionary.join(v15.users[v18], v19, {
            isFriendWithUser = if v20 then v20 == Enum.FriendStatus.Friend else false, 
            hasPendingFriendRequest = if v20 then v20 == Enum.FriendStatus.FriendRequestSent else false, 
            canSendFriendRequest = not v20 or v20 == Enum.FriendStatus.NotFriend, 
            hasIncomingFriendRequest = v15.hasIncomingFriendRequest[v18]
        });
    end, {
        v15.recommendationsDict, 
        v15.friendshipStatus, 
        v15.users, 
        v15.hasIncomingFriendRequest
    });
    return (v3.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v4 (ref), v17 (copy), v21 (copy), v12 (ref)
        return v4.List.sort(v4.List.map(v17, v21), v12);
    end, {
        v17, 
        v21
    }));
end;