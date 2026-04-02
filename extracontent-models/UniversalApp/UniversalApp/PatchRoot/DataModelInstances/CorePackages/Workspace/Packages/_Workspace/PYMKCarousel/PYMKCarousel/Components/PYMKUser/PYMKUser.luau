local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_ImpressionsTagUtility_0 = require(l_Parent_1.Impressions).ImpressionsTagUtility;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v8 = require(l_Parent_0.Components.PYMKUser.usePrimaryCta);
local v9 = require(l_Parent_0.Components.PYMKUser.useContextualInfo);
local v10 = require(l_Parent_0.Components.PYMKUser.useUserPresence);
local v11 = require(l_Parent_0.Components.PYMKUser.useOnActivatedTile);
local v12 = require(l_Parent_0.Flags.FFlagAddImpressionsTagToPYMKTile);
local _ = require(l_Parent_1.UserList);
return function(v14) --[[ Line: 36 ]]
    -- upvalues: v12 (copy), v3 (copy), l_ImpressionsTagUtility_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RoduxFriends_0 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v15 = tostring(v14.entity.id);
    local v16 = nil;
    if v12 then
        v16 = v3.useRef(nil);
        v3.useEffect(function() --[[ Line: 42 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v16 (ref), v14 (copy)
            l_ImpressionsTagUtility_0.AddTag(v16, v14.impressionsTag, v14.absolutePosition);
            return function() --[[ Line: 44 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v16 (ref), v14 (ref)
                l_ImpressionsTagUtility_0.RemoveTag(v16, v14.impressionsTag, v14.absolutePosition);
            end;
        end, {
            v14.impressionsTag, 
            v14.absolutePosition
        });
    end;
    local v18 = l_useSelector_0(function(v17) --[[ Line: 50 ]]
        return (tostring(v17.LocalUserId));
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 53 ]]
        -- upvalues: l_getDeepValue_0 (ref), v15 (copy)
        return l_getDeepValue_0(v19, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v15));
    end);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 59 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v18 (copy), v15 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v21)(v18)[v15] or {};
    end);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 62 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v15 (copy)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v23)({
            userId = v15
        })[v15] or nil;
    end);
    local v25 = v8({
        entityId = v15, 
        showToast = v14.showToast, 
        fireAnalyticsEvent = v14.fireAnalyticsEvent, 
        absolutePosition = v14.absolutePosition, 
        entityType = v14.entity.type
    });
    local v26 = v9({
        recommendation = v22, 
        hasIncomingFriendRequest = v20
    });
    local v27 = {
        subtitle = false, 
        contextualInfo = v22.contextType == nil
    };
    local v28 = v10({
        userId = v15
    });
    local v29 = v11({
        userId = v15, 
        openProfilePeekView = v14.openProfilePeekView, 
        absolutePosition = v14.absolutePosition, 
        recommendation = v22, 
        recommendationSessionId = v14.recommendationSessionId, 
        fireAnalyticsEvent = v14.fireAnalyticsEvent, 
        friendshipStatus = v24, 
        userPresenceType = v28
    });
    if not v12 then
        return v14.createRow({
            primaryCta = v25, 
            secondaryCta = nil, 
            contextualInfo = v26, 
            loadingState = v27, 
            presence = v28, 
            trailingContent = nil, 
            onRowActivated = v29
        });
    else
        local v30 = v14.createRow({
            primaryCta = v25, 
            secondaryCta = nil, 
            contextualInfo = v26, 
            loadingState = v27, 
            presence = v28, 
            trailingContent = nil, 
            onRowActivated = v29
        });
        if v30 then
            return v3.cloneElement(v30, {
                ref = v16
            });
        else
            return nil;
        end;
    end;
end;