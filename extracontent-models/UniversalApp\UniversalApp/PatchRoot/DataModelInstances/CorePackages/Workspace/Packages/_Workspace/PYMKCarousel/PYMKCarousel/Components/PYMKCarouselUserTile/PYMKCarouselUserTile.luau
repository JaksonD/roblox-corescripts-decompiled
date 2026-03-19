local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_Roact_0 = v2.Roact;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_1.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_HoldDetector_0 = require(l_Parent_1.HoldToPlay).HoldDetector;
local l_useStyle_0 = require(l_Parent_1.UIBlox).Core.Style.useStyle;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_SocialLibraries_0 = v2.SocialLibraries;
local v12 = require(l_Parent_1.SocialCommon);
local l_PresenceType_0 = require(l_Parent_0.installReducer.RoduxPresence).Enums.PresenceType;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v15 = require(script.Parent.PYMKCarouselUserContextualInfo);
local v16 = require(script.Parent.usePYMKCarouselUserButtons);
local v17 = require(l_Parent_0.Analytics);
local v18 = require(l_Parent_0.Analytics.getFriendStatus);
local l_EventNames_0 = v17.EventNames;
local v20 = require(l_Parent_0.Common.Constants);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local v22 = require(l_Parent_1.SocialStopwatch);
local l_ImpressionsTagUtility_0 = require(l_Parent_1.Impressions).ImpressionsTagUtility;
local l_getRecommendationContextualInfoType_0 = v12.Utils.getRecommendationContextualInfoType;
local l_CarouselUserTile_0 = v12.Components.CarouselUserTile.CarouselUserTile;
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresence;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
return function(v28) --[[ Line: 54 ]]
    -- upvalues: l_React_0 (copy), l_ImpressionsTagUtility_0 (copy), v22 (copy), l_EventNames_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RoduxFriends_0 (copy), l_FFlagHomepagePYMKPresence_0 (copy), v16 (copy), l_RecommendationContextType_0 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v15 (copy), v20 (copy), l_getRecommendationContextualInfoType_0 (copy), v18 (copy), l_HttpService_0 (copy), l_PresenceType_0 (copy), l_useStyle_0 (copy), l_Roact_0 (copy), l_CarouselUserTile_0 (copy), l_HoldDetector_0 (copy)
    local v29 = l_React_0.useRef(nil);
    l_React_0.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v29 (copy), v28 (copy)
        l_ImpressionsTagUtility_0.AddTag(v29, v28.impressionsTag, v28.LayoutOrder);
        return function() --[[ Line: 58 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v29 (ref), v28 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v29, v28.impressionsTag, v28.LayoutOrder);
        end;
    end, {
        v29, 
        v28.impressionsTag, 
        v28.LayoutOrder
    });
    l_React_0.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v22 (ref), v28 (copy), l_EventNames_0 (ref)
        local v30 = v22.Stopwatch.stop(v22.Events.PYMKCarouselLoaded);
        if v30 then
            v28.fireAnalyticsEvent(l_EventNames_0.PYMKCarouselLoadingTime, {
                loadingTime = v30.timeElapsed
            });
        end;
    end, {});
    local v32 = l_useSelector_0(function(v31) --[[ Line: 72 ]]
        return (tostring(v31.LocalUserId));
    end);
    local v33 = tostring(v28.userId);
    local v35 = l_useSelector_0(function(v34) --[[ Line: 78 ]]
        -- upvalues: l_getDeepValue_0 (ref), v33 (copy)
        return l_getDeepValue_0(v34, string.format("PYMKCarousel.Users.byUserId.%s", v33));
    end);
    local v37 = l_useSelector_0(function(v36) --[[ Line: 82 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v33 (copy)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v36)({
            v33
        })[v33] or nil;
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 86 ]]
        -- upvalues: l_getDeepValue_0 (ref), v33 (copy)
        return l_getDeepValue_0(v38, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v33));
    end);
    local v41 = l_useSelector_0(function(v40) --[[ Line: 93 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v32 (copy), v33 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v40)(v32)[v33] or {};
    end);
    local v42 = nil;
    if l_FFlagHomepagePYMKPresence_0 then
        local v44 = l_useSelector_0(function(v43) --[[ Line: 99 ]]
            -- upvalues: l_getDeepValue_0 (ref), v33 (copy)
            return l_getDeepValue_0(v43, string.format("PYMKCarousel.Presence.byUserId.%s", v33)) or {};
        end);
        v42 = v44 and v44.userPresenceType or nil;
    end;
    local v45 = v16({
        userId = v33, 
        showToast = v28.showToast, 
        fireAnalyticsEvent = v28.fireAnalyticsEvent, 
        absolutePosition = v28.absolutePosition, 
        contactId = if v41.contextType == l_RecommendationContextType_0.Contacts then v41.entityId else nil, 
        userPresenceType = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v42 else nil
    });
    local v46 = l_React_0.useRef(false);
    l_React_0.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: v46 (copy)
        v46.current = true;
        return function() --[[ Line: 119 ]]
            -- upvalues: v46 (ref)
            v46.current = false;
        end;
    end, {});
    local v47 = l_React_0.useRef(false);
    local v49 = l_React_0.useCallback(function(v48) --[[ Line: 125 ]]
        -- upvalues: v47 (copy)
        v47.current = v48;
    end, {});
    local v50 = l_React_0.useRef(nil);
    local v51 = not v37 or v37 == Enum.FriendStatus.NotFriend;
    local v52 = if v39 then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else if v51 then l_FocusNavigationEventNameEnum_0.HoldToAddFriend else nil;
    local v54 = l_React_0.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: v45 (copy)
        return function() --[[ Line: 137 ]]
            -- upvalues: v45 (ref)
            local v53 = v45();
            if #v53 > 0 and v53[1].onActivated then
                v53[1].onActivated();
            end;
        end;
    end, {
        v45
    });
    local function v55() --[[ Line: 145 ]]
        -- upvalues: v15 (ref), v28 (copy), v41 (copy)
        return v15({
            lineWidth = v28.tileWidth, 
            userId = v28.userId, 
            contextType = v41.contextType
        });
    end;
    local v56 = if v41.mutualFriendsCount then v41.mutualFriendsCount else if v41.mutualFriendsList then #v41.mutualFriendsList else nil;
    local function v57() --[[ Line: 157 ]]
        -- upvalues: v28 (copy), v33 (copy), v20 (ref), v56 (copy), v41 (copy), l_getRecommendationContextualInfoType_0 (ref), l_RecommendationContextType_0 (ref)
        v28.openProfilePeekView(v33, {
            absolutePosition = v28.absolutePosition, 
            source = v20.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            mutualFriendsCount = v56, 
            recommendationSessionId = v28.recommendationSessionId, 
            recommendationRank = v41.rank, 
            recommendationContextType = v41.contextType.rawValue(), 
            contextualInfoType = l_getRecommendationContextualInfoType_0(v41), 
            contactProps = if v41.contextType == l_RecommendationContextType_0.Contacts and v41.entityId then {
                contactId = v41.entityId, 
                avatarImageUrl = if v41.thumbnailEntities then v41.thumbnailEntities.avatarImageUrl else nil, 
                contactName = v41.entityDisplayName
            } else nil, 
            profileType = v41.contextType == l_RecommendationContextType_0.Contacts and "FromContacts" or nil
        });
    end;
    local function v58() --[[ Line: 186 ]]
        -- upvalues: v47 (copy), v46 (copy), v57 (copy), v28 (copy), l_EventNames_0 (ref), v33 (copy), v18 (ref), v37 (copy), v39 (copy), v41 (copy), l_RecommendationContextType_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), v42 (ref), l_HttpService_0 (ref)
        if v47.current or not v46.current then
            return;
        else
            v57();
            v28.fireAnalyticsEvent(l_EventNames_0.UserPressed, {
                recommendationId = v33, 
                friendStatus = v18(v37, v39), 
                recommendationContextType = v41.contextType, 
                recommendationRank = v41.rank, 
                absolutePosition = v28.absolutePosition, 
                positionInRow = v28.absolutePosition, 
                contactId = if v41.contextType == l_RecommendationContextType_0.Contacts then v41.entityId else nil, 
                presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v42 else nil, 
                interactionUuid = l_HttpService_0:GenerateGUID(false)
            });
            return;
        end;
    end;
    local v59 = nil;
    if l_FFlagHomepagePYMKPresence_0 then
        local v60 = l_React_0.useMemo(function() --[[ Line: 209 ]]
            -- upvalues: v41 (copy), l_RecommendationContextType_0 (ref), v35 (copy)
            if v41.contextType == l_RecommendationContextType_0.Contacts then
                return v41.entityDisplayName or "";
            else
                return (v35 or {}).displayName or "";
            end;
        end, {
            v35, 
            v41
        });
        local v62 = l_React_0.useMemo(function() --[[ Line: 215 ]]
            -- upvalues: v42 (ref), l_PresenceType_0 (ref)
            local v61 = true;
            if v42 ~= l_PresenceType_0.Online then
                v61 = true;
                if v42 ~= l_PresenceType_0.InStudio then
                    v61 = v42 == l_PresenceType_0.InGame;
                end;
            end;
            return v61;
        end, {
            v42
        });
        local l_Color_0 = l_useStyle_0().Theme.OnlineStatus.Color;
        v59 = l_React_0.useMemo(function() --[[ Line: 225 ]]
            -- upvalues: l_Color_0 (copy), v62 (copy), v60 (copy)
            local v64 = ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255)));
            if v62 then
                return v64 .. v60;
            else
                return v60;
            end;
        end, {
            v60, 
            v62, 
            l_Color_0
        });
    end;
    return l_Roact_0.createFragment({
        PYMKCarouselUserTile = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, v28.tileWidth, 0, v28.tileWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = v28.LayoutOrder, 
            ref = v29
        }, {
            CarouselUserTile = l_Roact_0.createElement(l_CarouselUserTile_0, {
                headshotImageUrl = if v41.thumbnailEntities then v41.thumbnailEntities.headshotImageUrl else nil, 
                userId = v33, 
                userName = if l_FFlagHomepagePYMKPresence_0 then v59 else if v41.contextType == l_RecommendationContextType_0.Contacts then v41.entityDisplayName or "" else (v35 or {}).displayName or "", 
                tileSize = v28.tileWidth, 
                renderContextualInfo = v55, 
                renderButtons = if not v28.hideButtons then v45 else nil, 
                onActivatedTile = v58, 
                onActivatedContextual = v58, 
                buttonRef = v50
            }), 
            HoldDetector = if v50.current then l_Roact_0.createElement(l_HoldDetector_0, {
                guiObject = v50.current, 
                onHoldDetected = v54, 
                onRegularActivated = v58, 
                setDisabledForHold = v49, 
                keyCode = Enum.KeyCode.ButtonA, 
                focusNavigationEventName = v52
            }) else nil
        })
    });
end;