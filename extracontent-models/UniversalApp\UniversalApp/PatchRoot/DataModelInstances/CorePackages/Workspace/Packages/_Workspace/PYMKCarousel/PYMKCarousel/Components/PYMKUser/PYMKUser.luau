local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v6 = require(l_Parent_0.Components.PYMKUser.usePrimaryCta);
local v7 = require(l_Parent_0.Components.PYMKUser.useContextualInfo);
local v8 = require(l_Parent_0.Components.PYMKUser.useUserPresence);
local v9 = require(l_Parent_0.Components.PYMKUser.useOnActivatedTile);
local _ = require(l_Parent_1.UserList);
return function(v11) --[[ Line: 30 ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RoduxFriends_0 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v12 = tostring(v11.entity.id);
    local v14 = l_useSelector_0(function(v13) --[[ Line: 33 ]]
        return (tostring(v13.LocalUserId));
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 36 ]]
        -- upvalues: l_getDeepValue_0 (ref), v12 (copy)
        return l_getDeepValue_0(v15, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v12));
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 42 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v14 (copy), v12 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v17)(v14)[v12] or {};
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 45 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v12 (copy)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v19)({
            userId = v12
        })[v12] or nil;
    end);
    local v21 = v6({
        entityId = v12, 
        showToast = v11.showToast, 
        fireAnalyticsEvent = v11.fireAnalyticsEvent, 
        absolutePosition = v11.absolutePosition, 
        entityType = v11.entity.type
    });
    local v22 = v7({
        recommendation = v18, 
        hasIncomingFriendRequest = v16
    });
    local v23 = {
        subtitle = false, 
        contextualInfo = v18.contextType == nil
    };
    local v24 = v8({
        userId = v12
    });
    local v25 = v9({
        userId = v12, 
        openProfilePeekView = v11.openProfilePeekView, 
        absolutePosition = v11.absolutePosition, 
        recommendation = v18, 
        recommendationSessionId = v11.recommendationSessionId, 
        fireAnalyticsEvent = v11.fireAnalyticsEvent, 
        friendshipStatus = v20, 
        userPresenceType = v24
    });
    return v11.createRow({
        primaryCta = v21, 
        secondaryCta = nil, 
        contextualInfo = v22, 
        loadingState = v23, 
        presence = v24, 
        trailingContent = nil, 
        onRowActivated = v25
    });
end;