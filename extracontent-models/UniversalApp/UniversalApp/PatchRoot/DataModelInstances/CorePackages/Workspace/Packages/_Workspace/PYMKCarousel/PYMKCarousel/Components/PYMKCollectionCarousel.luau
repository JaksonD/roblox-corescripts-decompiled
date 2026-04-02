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
local v50 = require(l_script_FirstAncestor_0.Flags.FFlagAddImpressionsTagToPYMKTile);
local v51 = 0;
local v52 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SeeAll
};
local v53 = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60);
local function v119(v54) --[[ Line: 100 ]] --[[ Name: PYMKCollectionCarousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), l_useAppPolicy_0 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useSelector_0 (copy), v39 (copy), v12 (copy), v38 (copy), v10 (copy), l_FFlagHomepagePYMKPresence_0 (copy), l_useDispatch_0 (copy), v23 (copy), l_RecommendationContextType_0 (copy), l_NetworkingPresence_0 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_useThrottledCallback_0 (copy), v53 (copy), v40 (copy), v51 (ref), l_BtnValues_0 (copy), l_useStyle_0 (copy), l_calculateContextualMaxHeight_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useUserSeenEvent_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy), v19 (copy), v52 (copy), v8 (copy), v36 (copy), v37 (copy), v35 (copy), v41 (copy), v42 (copy), v43 (copy), v50 (copy), l_ContactsContext_0 (copy), l_HorizontalUserList_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_CollectionCarousel_0 (copy)
    local v55 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v54.appCompositionEnabled;
    local v56 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v56 = l_useAppPolicy_0(function(v57) --[[ Line: 105 ]]
            return v57.useGridPageLayout();
        end);
    end;
    local v58, v59 = v7.useState(nil);
    local v60 = v7.useRef(nil);
    local v61, v62 = l_useCollectionImpressionsSignal_0(v54.scrollViewPositionChangedSignal);
    local v65 = l_useSelector_0(function(v63) --[[ Line: 120 ]]
        -- upvalues: v39 (ref)
        local l_LocalUserId_0 = v63.LocalUserId;
        return v39(l_LocalUserId_0)(v63);
    end, v12.shallowEqual);
    local v66 = v65 and #v65 or 0;
    local l_recommendationSessionId_0 = v54.recommendationSessionId;
    local l_fireAnalyticsEvent_0 = v54.fireAnalyticsEvent;
    local v69 = v38({
        recommendationIds = v65, 
        recommendationCount = v66, 
        findFriendsTileEnabled = v54.findFriendsTileEnabled, 
        seeAllTileEnabled = v54.seeAllTileEnabled
    });
    v7.useLayoutEffect(function() --[[ Line: 136 ]]
        -- upvalues: v10 (ref)
        v10.Stopwatch.start(v10.Events.PYMKCarouselLoaded);
        return function() --[[ Line: 138 ]]
            -- upvalues: v10 (ref)
            if v10.Stopwatch.get(v10.Events.PYMKCarouselLoaded) then
                v10.Stopwatch.stop(v10.Events.PYMKCarouselLoaded);
            end;
        end;
    end, {
        l_recommendationSessionId_0
    });
    local v70, v71 = v7.useState(os.clock());
    if l_FFlagHomepagePYMKPresence_0 then
        local v72 = l_useDispatch_0();
        local l_v72_0 = v72 --[[ copy: 15 -> 33 ]];
        local v77 = v7.useCallback(function() --[[ Line: 150 ]]
            -- upvalues: v23 (ref), v65 (copy), l_RecommendationContextType_0 (ref), l_v72_0 (copy), l_NetworkingPresence_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
            local v76 = v23.reduce(v65, function(v74, v75) --[[ Line: 151 ]]
                -- upvalues: l_RecommendationContextType_0 (ref)
                if v75.recommendationContextType ~= l_RecommendationContextType_0.Contacts then
                    table.insert(v74, v75.id);
                end;
                return v74;
            end, {});
            if #v76 > 0 then
                l_v72_0(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v76));
                if l_FFlagHomepagePYMKPresenceAnalytics_0 then
                    l_fireAnalyticsEvent_0(l_EventNames_0.PYMKUserPresenceLoad);
                end;
            end;
        end, {
            v72, 
            v65, 
            if l_FFlagHomepagePYMKPresenceAnalytics_0 then l_fireAnalyticsEvent_0 else nil
        });
        local v78 = l_useThrottledCallback_0(v77, v53);
        v40({
            elementRef = v60, 
            scrollViewPositionChangedSignal = v54.scrollViewPositionChangedSignal, 
            callback = v78
        });
    end;
    v7.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v66 (copy), v51 (ref), v54 (copy), v71 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v66, 
            refreshCount = v51, 
            findFriendsTileEnabled = v54.findFriendsTileEnabled
        });
        v51 = v51 + 1;
        v71(os.clock());
    end, {
        l_recommendationSessionId_0, 
        v66
    });
    local v79 = v7.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_BtnValues_0 (ref), v54 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselGenericTileClicked, {
            btn = l_BtnValues_0.SeeAll.rawValue()
        });
        v54.goToAddFriendsPage(false);
    end, {
        v54.goToAddFriendsPage, 
        l_fireAnalyticsEvent_0
    });
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local _ = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v80 = l_useStyle_0();
        v81 = v7.useMemo(function() --[[ Line: 206 ]]
            -- upvalues: l_calculateContextualMaxHeight_0 (ref), v80 (ref)
            return l_calculateContextualMaxHeight_0({
                font = v80.Font
            });
        end, {
            v80.Font
        });
        v82 = v7.useCallback(function(v87) --[[ Line: 212 ]]
            -- upvalues: v81 (ref)
            return v87 + v81;
        end, {
            v81
        });
        if l_FFlagLuaAppCompositionSupport_0 then
            local v88, v89 = v7.useState(0);
            v85 = v88;
            v86 = v89;
        end;
        local v90 = {
            sideMargin = if v55 then nil else if v56 then nil else v54.sideMargin
        };
        v84 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v58, true, v90);
    end;
    local v91 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v96 = v7.useCallback(function(v92) --[[ Line: 232 ]]
        -- upvalues: v69 (copy), v91 (copy)
        local v93 = {};
        for _, v95 in v92 do
            table.insert(v93, {
                item = v69[v95]
            });
        end;
        if #v91 > 0 then
            v91[1].onViewableItemsChanged({
                changed = v93
            });
        end;
    end, {
        v91, 
        v69
    });
    local v97 = v7.useMemo(function() --[[ Line: 246 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v21 (ref), v79 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SeeAll] = {
                handler = v21.onRelease(v79)
            }
        };
    end, {
        v79
    });
    local v98 = v19.useEventMap(v52);
    local v99 = v19.useEventHandlerMap(v97, v98);
    v7.useEffect(function() --[[ Line: 258 ]]
        -- upvalues: v99 (copy), v60 (copy)
        if v99 and v60 then
            v99(v60.current);
        end;
        return function() --[[ Line: 262 ]]
            -- upvalues: v99 (ref)
            v99(nil);
        end;
    end, {
        v99, 
        v60, 
        v60 and v60.current
    });
    local v100 = nil;
    local v101 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v100 = v8.usePreferredInput() == v8.Input.Directional;
        local v102 = nil;
        if l_FFlagLuaAppCompositionSupport_0 then
            v102 = v7.useCallback(function(v103) --[[ Line: 274 ]]
                -- upvalues: v86 (ref)
                local l_X_0 = v103.AbsoluteSize.X;
                if l_X_0 > 0 then
                    v86(l_X_0);
                end;
            end, {});
        end;
        do
            local l_v102_0 = v102;
            v101 = v7.useCallback(function(v106, v107, v108, _) --[[ Line: 283 ]]
                -- upvalues: v55 (copy), v85 (ref), v84 (ref), v7 (ref), v36 (ref), v54 (copy), l_fireAnalyticsEvent_0 (copy), v37 (ref), v35 (ref), l_recommendationSessionId_0 (copy), v100 (ref), l_v102_0 (ref)
                local v110 = if v55 then v85 else v84.itemWidth;
                local v111 = nil;
                local v112 = nil;
                if v106.isButtonTile then
                    v111 = v7.createElement(v36, {
                        id = v106.id, 
                        tileWidth = v110, 
                        goToAddFriendsPage = v54.goToAddFriendsPage, 
                        fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                        shouldShowContactImporterBadge = v54.shouldShowContactImporterBadge, 
                        LayoutOrder = v107
                    });
                    v112 = "PYMKCarouselButtonTile";
                elseif v106.isTooltip then
                    v111 = v7.createElement(v37, {
                        LayoutOrder = v107
                    });
                    v112 = "PYMKCarouselFindFriendsTooltip";
                else
                    v111 = v7.createElement(v35, {
                        userId = v106.id, 
                        tileWidth = v110, 
                        contextualInfoLines = 2, 
                        openProfilePeekView = v54.openProfilePeekView, 
                        showToast = v54.showToast, 
                        fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                        absolutePosition = v106.absolutePosition, 
                        recommendationSessionId = l_recommendationSessionId_0, 
                        LayoutOrder = v107, 
                        impressionsTag = "PYMKCollectionCarousel", 
                        hideButtons = v100
                    });
                    v112 = "PYMKCarouselUserTile";
                end;
                if v55 then
                    return v7.createElement("Frame", {
                        Size = v108, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v107, 
                        [v7.Change.AbsoluteSize] = l_v102_0
                    }, {
                        Tile = v111
                    }), v112;
                else
                    return v111, v112;
                end;
            end, {
                v54.goToAddFriendsPage, 
                l_fireAnalyticsEvent_0, 
                v54.shouldShowContactImporterBadge, 
                v54.openProfilePeekView, 
                v54.showToast, 
                l_recommendationSessionId_0, 
                v84.itemWidth, 
                v100, 
                if l_FFlagLuaAppCompositionSupport_0 then v55 else nil, 
                if l_FFlagLuaAppCompositionSupport_0 then v85 else nil, 
                if l_FFlagLuaAppCompositionSupport_0 then l_v102_0 else nil
            });
        end;
    end;
    if l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        local v113 = v41(v69);
        local v114 = v42(v69);
        local v118 = v7.useCallback(function(v115, v116, v117) --[[ Line: 360 ]]
            -- upvalues: v7 (ref), v43 (ref), v54 (copy), l_fireAnalyticsEvent_0 (copy), v50 (ref)
            return v7.createElement(v43, {
                createRow = v115, 
                entity = v116, 
                showToast = v54.showToast, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                absolutePosition = v117, 
                recommendationSessionId = v54.recommendationSessionId, 
                openProfilePeekView = v54.openProfilePeekView, 
                impressionsTag = v50 and "PYMKCollectionCarousel" or nil
            });
        end, {
            v54.showToast, 
            l_fireAnalyticsEvent_0, 
            v54.recommendationSessionId, 
            v54.openProfilePeekView
        });
        if #v69 == 0 then
            return nil;
        else
            return v7.createElement(v7.Fragment, nil, {
                ContactsContextProvider = v7.createElement(l_ContactsContext_0.Provider, {
                    value = v114
                }, {
                    PYMKCarousel = v7.createElement(l_HorizontalUserList_0, {
                        entities = v113, 
                        renderRow = v118, 
                        header = {
                            title = v54.carouselTitle, 
                            onTitleActivated = v79
                        }, 
                        collectionCarouselConfigs = {
                            onViewableItemsChanged = v62, 
                            onChangeCanvasPosition = v62
                        }, 
                        listConfigs = {
                            showSubtitle = false
                        }, 
                        scrollingFrameRef = v60, 
                        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v54.appCompositionEnabled else nil
                    })
                }), 
                ScreenSizeImpressionsTracker = v7.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                    pageContext = v54.pageContext, 
                    parentRef = v60, 
                    impressionsTag = "PYMKCollectionCarousel", 
                    scrollViewPositionChangedSignal = v61, 
                    sendImpressions = v96, 
                    dataUpdatedTimestamp = v70
                })
            });
        end;
    elseif #v69 == 0 then
        return nil;
    else
        return v7.createElement(v7.Fragment, nil, {
            PYMKCarousel = v7.createElement(l_CollectionCarousel_0, {
                title = v54.carouselTitle, 
                onActivateHeader = v79, 
                containerRef = v59, 
                scrollingFrameRef = v60, 
                items = v69, 
                renderItem = v101, 
                getItemHeight = v82, 
                collectionItemSize = if v55 then l_CollectionItemSize_0.Small else nil, 
                numColumns = if v55 then nil else v84.numColumns, 
                fractionalItemAmount = if v55 then nil else v84.fractionalItemAmount, 
                columnGap = if v55 then nil else v84.columnGap, 
                sideMargin = if v55 then nil else v84.sideMargin, 
                maxItemsToShow = v84.maxTilesToShow, 
                onViewableItemsChanged = v62, 
                onChangeCanvasPosition = v62
            }), 
            ScreenSizeImpressionsTracker = v7.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                pageContext = v54.pageContext, 
                parentRef = v60, 
                impressionsTag = "PYMKCollectionCarousel", 
                scrollViewPositionChangedSignal = v61, 
                sendImpressions = v96, 
                dataUpdatedTimestamp = v70
            })
        });
    end;
end;
return v7.memo(v119);