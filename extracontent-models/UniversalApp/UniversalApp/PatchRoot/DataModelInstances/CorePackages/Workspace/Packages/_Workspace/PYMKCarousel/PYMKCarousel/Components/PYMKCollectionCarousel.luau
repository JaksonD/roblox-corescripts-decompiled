local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_useStyle_0 = v1.UIBlox.Core.Style.useStyle;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_NetworkingPresence_0 = v1.NetworkingPresence;
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.Responsive);
local v9 = require(l_Parent_0.SocialCommon);
local v10 = require(l_Parent_0.SocialStopwatch);
local l_calculateContextualMaxHeight_0 = v9.Components.CarouselUserTile.calculateContextualMaxHeight;
local v12 = require(l_Parent_0.tutils);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v14 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v14.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v14.useCollectionLayoutParams;
local l_CollectionItemSize_0 = v14.CollectionViewTypes.CollectionItemSize;
local l_useCollectionImpressionsSignal_0 = v14.useCollectionImpressionsSignal;
local v19 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v21 = require(l_Parent_0.InputHandlers);
local l_useThrottledCallback_0 = require(l_Parent_0.RoactUtils).Hooks.useThrottledCallback;
local v23 = require(l_Parent_0.Dash);
local v24 = require(l_Parent_0.Impressions);
local l_ScreenSizeImpressionsTracker_0 = v24.ScreenSizeImpressionsTracker;
local l_FrameBoundsImpressionsTracker_0 = v24.FrameBoundsImpressionsTracker;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v28 = require(l_script_FirstAncestor_0.Analytics);
local l_BtnValues_0 = v28.BtnValues;
local l_EventNames_0 = v28.EventNames;
local l_useUserSeenEvent_0 = v28.useUserSeenEvent;
local v32 = require(l_Parent_0.UserList);
local l_HorizontalUserList_0 = v32.HorizontalUserList.HorizontalUserList;
local l_ContactsContext_0 = v32.ContactsContext;
local v35 = require(l_script_FirstAncestor_0.Components.PYMKCarouselUserTile);
local v36 = require(l_script_FirstAncestor_0.Components.PYMKCarouselButtonTile);
local v37 = require(l_script_FirstAncestor_0.Components.PYMKCarouselFindFriendsTooltip);
local v38 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.usePYMKCarouselItemList);
local v39 = require(l_script_FirstAncestor_0.installReducer.Selectors.getPYMKSortedRecommendationIds);
local v40 = require(l_script_FirstAncestor_0.Components.useCallbackWhenVisible);
local v41 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.usePYMKCarouselUserEntitiesList);
local v42 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.useContactsContext);
local v43 = require(l_script_FirstAncestor_0.Components.PYMKUser);
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresence;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions;
local v50 = 0;
local v51 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SeeAll
};
local v52 = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60);
local function v118(v53) --[[ Line: 99 ]] --[[ Name: PYMKCollectionCarousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), l_useAppPolicy_0 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useSelector_0 (copy), v39 (copy), v12 (copy), v38 (copy), v10 (copy), l_FFlagHomepagePYMKPresence_0 (copy), l_useDispatch_0 (copy), v23 (copy), l_RecommendationContextType_0 (copy), l_NetworkingPresence_0 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_useThrottledCallback_0 (copy), v52 (copy), v40 (copy), v50 (ref), l_BtnValues_0 (copy), l_useStyle_0 (copy), l_calculateContextualMaxHeight_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useUserSeenEvent_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy), v19 (copy), v51 (copy), v8 (copy), v36 (copy), v37 (copy), v35 (copy), v41 (copy), v42 (copy), v43 (copy), l_ContactsContext_0 (copy), l_HorizontalUserList_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_CollectionCarousel_0 (copy)
    local v54 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v53.appCompositionEnabled;
    local v55 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v55 = l_useAppPolicy_0(function(v56) --[[ Line: 104 ]]
            return v56.useGridPageLayout();
        end);
    end;
    local v57, v58 = v7.useState(nil);
    local v59 = v7.useRef(nil);
    local v60, v61 = l_useCollectionImpressionsSignal_0(v53.scrollViewPositionChangedSignal);
    local v64 = l_useSelector_0(function(v62) --[[ Line: 119 ]]
        -- upvalues: v39 (ref)
        local l_LocalUserId_0 = v62.LocalUserId;
        return v39(l_LocalUserId_0)(v62);
    end, v12.shallowEqual);
    local v65 = v64 and #v64 or 0;
    local l_recommendationSessionId_0 = v53.recommendationSessionId;
    local l_fireAnalyticsEvent_0 = v53.fireAnalyticsEvent;
    local v68 = v38({
        recommendationIds = v64, 
        recommendationCount = v65, 
        findFriendsTileEnabled = v53.findFriendsTileEnabled, 
        seeAllTileEnabled = v53.seeAllTileEnabled
    });
    v7.useLayoutEffect(function() --[[ Line: 135 ]]
        -- upvalues: v10 (ref)
        v10.Stopwatch.start(v10.Events.PYMKCarouselLoaded);
        return function() --[[ Line: 137 ]]
            -- upvalues: v10 (ref)
            if v10.Stopwatch.get(v10.Events.PYMKCarouselLoaded) then
                v10.Stopwatch.stop(v10.Events.PYMKCarouselLoaded);
            end;
        end;
    end, {
        l_recommendationSessionId_0
    });
    local v69, v70 = v7.useState(os.clock());
    if l_FFlagHomepagePYMKPresence_0 then
        local v71 = l_useDispatch_0();
        local l_v71_0 = v71 --[[ copy: 15 -> 33 ]];
        local v76 = v7.useCallback(function() --[[ Line: 149 ]]
            -- upvalues: v23 (ref), v64 (copy), l_RecommendationContextType_0 (ref), l_v71_0 (copy), l_NetworkingPresence_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
            local v75 = v23.reduce(v64, function(v73, v74) --[[ Line: 150 ]]
                -- upvalues: l_RecommendationContextType_0 (ref)
                if v74.recommendationContextType ~= l_RecommendationContextType_0.Contacts then
                    table.insert(v73, v74.id);
                end;
                return v73;
            end, {});
            if #v75 > 0 then
                l_v71_0(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v75));
                if l_FFlagHomepagePYMKPresenceAnalytics_0 then
                    l_fireAnalyticsEvent_0(l_EventNames_0.PYMKUserPresenceLoad);
                end;
            end;
        end, {
            v71, 
            v64, 
            if l_FFlagHomepagePYMKPresenceAnalytics_0 then l_fireAnalyticsEvent_0 else nil
        });
        local v77 = l_useThrottledCallback_0(v76, v52);
        v40({
            elementRef = v59, 
            scrollViewPositionChangedSignal = v53.scrollViewPositionChangedSignal, 
            callback = v77
        });
    end;
    v7.useEffect(function() --[[ Line: 176 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v65 (copy), v50 (ref), v53 (copy), v70 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v65, 
            refreshCount = v50, 
            findFriendsTileEnabled = v53.findFriendsTileEnabled
        });
        v50 = v50 + 1;
        v70(os.clock());
    end, {
        l_recommendationSessionId_0, 
        v65
    });
    local v78 = v7.useCallback(function() --[[ Line: 191 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_BtnValues_0 (ref), v53 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselGenericTileClicked, {
            btn = l_BtnValues_0.SeeAll.rawValue()
        });
        v53.goToAddFriendsPage(false);
    end, {
        v53.goToAddFriendsPage, 
        l_fireAnalyticsEvent_0
    });
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local _ = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v79 = l_useStyle_0();
        v80 = v7.useMemo(function() --[[ Line: 205 ]]
            -- upvalues: l_calculateContextualMaxHeight_0 (ref), v79 (ref)
            return l_calculateContextualMaxHeight_0({
                font = v79.Font
            });
        end, {
            v79.Font
        });
        v81 = v7.useCallback(function(v86) --[[ Line: 211 ]]
            -- upvalues: v80 (ref)
            return v86 + v80;
        end, {
            v80
        });
        if l_FFlagLuaAppCompositionSupport_0 then
            local v87, v88 = v7.useState(0);
            v84 = v87;
            v85 = v88;
        end;
        local v89 = {
            sideMargin = if v54 then nil else if v55 then nil else v53.sideMargin
        };
        v83 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v57, true, v89);
    end;
    local v90 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v95 = v7.useCallback(function(v91) --[[ Line: 231 ]]
        -- upvalues: v68 (copy), v90 (copy)
        local v92 = {};
        for _, v94 in v91 do
            table.insert(v92, {
                item = v68[v94]
            });
        end;
        if #v90 > 0 then
            v90[1].onViewableItemsChanged({
                changed = v92
            });
        end;
    end, {
        v90, 
        v68
    });
    local v96 = v7.useMemo(function() --[[ Line: 245 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v21 (ref), v78 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SeeAll] = {
                handler = v21.onRelease(v78)
            }
        };
    end, {
        v78
    });
    local v97 = v19.useEventMap(v51);
    local v98 = v19.useEventHandlerMap(v96, v97);
    v7.useEffect(function() --[[ Line: 257 ]]
        -- upvalues: v98 (copy), v59 (copy)
        if v98 and v59 then
            v98(v59.current);
        end;
        return function() --[[ Line: 261 ]]
            -- upvalues: v98 (ref)
            v98(nil);
        end;
    end, {
        v98, 
        v59, 
        v59 and v59.current
    });
    local v99 = nil;
    local v100 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v99 = v8.usePreferredInput() == v8.Input.Directional;
        local v101 = nil;
        if l_FFlagLuaAppCompositionSupport_0 then
            v101 = v7.useCallback(function(v102) --[[ Line: 273 ]]
                -- upvalues: v85 (ref)
                local l_X_0 = v102.AbsoluteSize.X;
                if l_X_0 > 0 then
                    v85(l_X_0);
                end;
            end, {});
        end;
        do
            local l_v101_0 = v101;
            v100 = v7.useCallback(function(v105, v106, v107, _) --[[ Line: 282 ]]
                -- upvalues: v54 (copy), v84 (ref), v83 (ref), v7 (ref), v36 (ref), v53 (copy), l_fireAnalyticsEvent_0 (copy), v37 (ref), v35 (ref), l_recommendationSessionId_0 (copy), v99 (ref), l_v101_0 (ref)
                local v109 = if v54 then v84 else v83.itemWidth;
                local v110 = nil;
                local v111 = nil;
                if v105.isButtonTile then
                    v110 = v7.createElement(v36, {
                        id = v105.id, 
                        tileWidth = v109, 
                        goToAddFriendsPage = v53.goToAddFriendsPage, 
                        fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                        shouldShowContactImporterBadge = v53.shouldShowContactImporterBadge, 
                        LayoutOrder = v106
                    });
                    v111 = "PYMKCarouselButtonTile";
                elseif v105.isTooltip then
                    v110 = v7.createElement(v37, {
                        LayoutOrder = v106
                    });
                    v111 = "PYMKCarouselFindFriendsTooltip";
                else
                    v110 = v7.createElement(v35, {
                        userId = v105.id, 
                        tileWidth = v109, 
                        contextualInfoLines = 2, 
                        openProfilePeekView = v53.openProfilePeekView, 
                        showToast = v53.showToast, 
                        fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                        absolutePosition = v105.absolutePosition, 
                        recommendationSessionId = l_recommendationSessionId_0, 
                        LayoutOrder = v106, 
                        impressionsTag = "PYMKCollectionCarousel", 
                        hideButtons = v99
                    });
                    v111 = "PYMKCarouselUserTile";
                end;
                if v54 then
                    return v7.createElement("Frame", {
                        Size = v107, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v106, 
                        [v7.Change.AbsoluteSize] = l_v101_0
                    }, {
                        Tile = v110
                    }), v111;
                else
                    return v110, v111;
                end;
            end, {
                v53.goToAddFriendsPage, 
                l_fireAnalyticsEvent_0, 
                v53.shouldShowContactImporterBadge, 
                v53.openProfilePeekView, 
                v53.showToast, 
                l_recommendationSessionId_0, 
                v83.itemWidth, 
                v99, 
                if l_FFlagLuaAppCompositionSupport_0 then v54 else nil, 
                if l_FFlagLuaAppCompositionSupport_0 then v84 else nil, 
                if l_FFlagLuaAppCompositionSupport_0 then l_v101_0 else nil
            });
        end;
    end;
    if l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        local v112 = v41(v68);
        local v113 = v42(v68);
        local v117 = v7.useCallback(function(v114, v115, v116) --[[ Line: 359 ]]
            -- upvalues: v7 (ref), v43 (ref), v53 (copy), l_fireAnalyticsEvent_0 (copy)
            return v7.createElement(v43, {
                createRow = v114, 
                entity = v115, 
                showToast = v53.showToast, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                absolutePosition = v116, 
                recommendationSessionId = v53.recommendationSessionId, 
                openProfilePeekView = v53.openProfilePeekView
            });
        end, {
            v53.showToast, 
            l_fireAnalyticsEvent_0, 
            v53.recommendationSessionId, 
            v53.openProfilePeekView
        });
        if #v68 == 0 then
            return nil;
        else
            return v7.createElement(v7.Fragment, nil, {
                ContactsContextProvider = v7.createElement(l_ContactsContext_0.Provider, {
                    value = v113
                }, {
                    PYMKCarousel = v7.createElement(l_HorizontalUserList_0, {
                        entities = v112, 
                        renderRow = v117, 
                        header = {
                            title = v53.carouselTitle, 
                            onTitleActivated = v78
                        }, 
                        collectionCarouselConfigs = {
                            onViewableItemsChanged = v61, 
                            onChangeCanvasPosition = v61
                        }, 
                        listConfigs = {
                            showSubtitle = false
                        }, 
                        scrollingFrameRef = v59, 
                        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v53.appCompositionEnabled else nil
                    })
                }), 
                ScreenSizeImpressionsTracker = v7.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                    pageContext = v53.pageContext, 
                    parentRef = v59, 
                    impressionsTag = "PYMKCollectionCarousel", 
                    scrollViewPositionChangedSignal = v60, 
                    sendImpressions = v95, 
                    dataUpdatedTimestamp = v69
                })
            });
        end;
    elseif #v68 == 0 then
        return nil;
    else
        return v7.createElement(v7.Fragment, nil, {
            PYMKCarousel = v7.createElement(l_CollectionCarousel_0, {
                title = v53.carouselTitle, 
                onActivateHeader = v78, 
                containerRef = v58, 
                scrollingFrameRef = v59, 
                items = v68, 
                renderItem = v100, 
                getItemHeight = v81, 
                collectionItemSize = if v54 then l_CollectionItemSize_0.Small else nil, 
                numColumns = if v54 then nil else v83.numColumns, 
                fractionalItemAmount = if v54 then nil else v83.fractionalItemAmount, 
                columnGap = if v54 then nil else v83.columnGap, 
                sideMargin = if v54 then nil else v83.sideMargin, 
                maxItemsToShow = v83.maxTilesToShow, 
                onViewableItemsChanged = v61, 
                onChangeCanvasPosition = v61
            }), 
            ScreenSizeImpressionsTracker = v7.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                pageContext = v53.pageContext, 
                parentRef = v59, 
                impressionsTag = "PYMKCollectionCarousel", 
                scrollViewPositionChangedSignal = v60, 
                sendImpressions = v95, 
                dataUpdatedTimestamp = v69
            })
        });
    end;
end;
return v7.memo(v118);