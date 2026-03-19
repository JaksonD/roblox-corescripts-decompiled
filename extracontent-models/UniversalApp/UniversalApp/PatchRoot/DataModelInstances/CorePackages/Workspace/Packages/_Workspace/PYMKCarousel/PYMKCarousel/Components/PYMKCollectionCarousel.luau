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
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v26 = require(l_script_FirstAncestor_0.Analytics);
local l_BtnValues_0 = v26.BtnValues;
local l_EventNames_0 = v26.EventNames;
local l_useUserSeenEvent_0 = v26.useUserSeenEvent;
local v30 = require(l_Parent_0.UserList);
local l_HorizontalUserList_0 = v30.HorizontalUserList.HorizontalUserList;
local l_ContactsContext_0 = v30.ContactsContext;
local v33 = require(l_script_FirstAncestor_0.Components.PYMKCarouselUserTile);
local v34 = require(l_script_FirstAncestor_0.Components.PYMKCarouselButtonTile);
local v35 = require(l_script_FirstAncestor_0.Components.PYMKCarouselFindFriendsTooltip);
local v36 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.usePYMKCarouselItemList);
local v37 = require(l_script_FirstAncestor_0.installReducer.Selectors.getPYMKSortedRecommendationIds);
local v38 = require(l_script_FirstAncestor_0.Components.useCallbackWhenVisible);
local v39 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.usePYMKCarouselUserEntitiesList);
local v40 = require(l_script_FirstAncestor_0.Components.PYMKCarouselComponent.useContactsContext);
local v41 = require(l_script_FirstAncestor_0.Components.PYMKUser);
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresence;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
local l_FFlagHomepagePYMKUseHorizontalUserList_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList;
local v45 = 0;
local v46 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SeeAll
};
local v47 = game:DefineFastInt("HomePagePYMKPresenceFetchThrottleInterval", 60);
local function v102(v48) --[[ Line: 93 ]] --[[ Name: PYMKCollectionCarousel ]]
    -- upvalues: l_FFlagHomepagePYMKUseHorizontalUserList_0 (copy), l_useAppPolicy_0 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useSelector_0 (copy), v37 (copy), v12 (copy), v36 (copy), v10 (copy), l_FFlagHomepagePYMKPresence_0 (copy), l_useDispatch_0 (copy), v23 (copy), l_RecommendationContextType_0 (copy), l_NetworkingPresence_0 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_useThrottledCallback_0 (copy), v47 (copy), v38 (copy), v45 (ref), l_BtnValues_0 (copy), l_useStyle_0 (copy), l_calculateContextualMaxHeight_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useUserSeenEvent_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy), v19 (copy), v46 (copy), v8 (copy), v34 (copy), v35 (copy), v33 (copy), v39 (copy), v40 (copy), v41 (copy), l_ContactsContext_0 (copy), l_HorizontalUserList_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_CollectionCarousel_0 (copy)
    local v49 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v49 = l_useAppPolicy_0(function(v50) --[[ Line: 96 ]]
            return v50.useGridPageLayout();
        end);
    end;
    local v51, v52 = v7.useState(nil);
    local v53 = v7.useRef(nil);
    local v54, v55 = l_useCollectionImpressionsSignal_0(v48.scrollViewPositionChangedSignal);
    local v58 = l_useSelector_0(function(v56) --[[ Line: 111 ]]
        -- upvalues: v37 (ref)
        local l_LocalUserId_0 = v56.LocalUserId;
        return v37(l_LocalUserId_0)(v56);
    end, v12.shallowEqual);
    local v59 = v58 and #v58 or 0;
    local l_recommendationSessionId_0 = v48.recommendationSessionId;
    local l_fireAnalyticsEvent_0 = v48.fireAnalyticsEvent;
    local v62 = v36({
        recommendationIds = v58, 
        recommendationCount = v59, 
        findFriendsTileEnabled = v48.findFriendsTileEnabled, 
        seeAllTileEnabled = v48.seeAllTileEnabled
    });
    v7.useLayoutEffect(function() --[[ Line: 127 ]]
        -- upvalues: v10 (ref)
        v10.Stopwatch.start(v10.Events.PYMKCarouselLoaded);
        return function() --[[ Line: 129 ]]
            -- upvalues: v10 (ref)
            if v10.Stopwatch.get(v10.Events.PYMKCarouselLoaded) then
                v10.Stopwatch.stop(v10.Events.PYMKCarouselLoaded);
            end;
        end;
    end, {
        l_recommendationSessionId_0
    });
    local v63, v64 = v7.useState(os.clock());
    if l_FFlagHomepagePYMKPresence_0 then
        local v65 = l_useDispatch_0();
        local l_v65_0 = v65 --[[ copy: 14 -> 30 ]];
        local v70 = v7.useCallback(function() --[[ Line: 141 ]]
            -- upvalues: v23 (ref), v58 (copy), l_RecommendationContextType_0 (ref), l_v65_0 (copy), l_NetworkingPresence_0 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
            local v69 = v23.reduce(v58, function(v67, v68) --[[ Line: 142 ]]
                -- upvalues: l_RecommendationContextType_0 (ref)
                if v68.recommendationContextType ~= l_RecommendationContextType_0.Contacts then
                    table.insert(v67, v68.id);
                end;
                return v67;
            end, {});
            if #v69 > 0 then
                l_v65_0(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v69));
                if l_FFlagHomepagePYMKPresenceAnalytics_0 then
                    l_fireAnalyticsEvent_0(l_EventNames_0.PYMKUserPresenceLoad);
                end;
            end;
        end, {
            v65, 
            v58, 
            if l_FFlagHomepagePYMKPresenceAnalytics_0 then l_fireAnalyticsEvent_0 else nil
        });
        local v71 = l_useThrottledCallback_0(v70, v47);
        v38({
            elementRef = v53, 
            scrollViewPositionChangedSignal = v48.scrollViewPositionChangedSignal, 
            callback = v71
        });
    end;
    v7.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v59 (copy), v45 (ref), v48 (copy), v64 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
            recommendationCount = v59, 
            refreshCount = v45, 
            findFriendsTileEnabled = v48.findFriendsTileEnabled
        });
        v45 = v45 + 1;
        v64(os.clock());
    end, {
        l_recommendationSessionId_0, 
        v59
    });
    local v72 = v7.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_BtnValues_0 (ref), v48 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.CarouselGenericTileClicked, {
            btn = l_BtnValues_0.SeeAll.rawValue()
        });
        v48.goToAddFriendsPage(false);
    end, {
        v48.goToAddFriendsPage, 
        l_fireAnalyticsEvent_0
    });
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local _ = nil;
    local v77 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v73 = l_useStyle_0();
        v74 = v7.useMemo(function() --[[ Line: 196 ]]
            -- upvalues: l_calculateContextualMaxHeight_0 (ref), v73 (ref)
            return l_calculateContextualMaxHeight_0({
                font = v73.Font
            });
        end, {
            v73.Font
        });
        v75 = v7.useCallback(function(v78) --[[ Line: 202 ]]
            -- upvalues: v74 (ref)
            return v78 + v74;
        end, {
            v74
        });
        local v79 = {
            sideMargin = if v49 then nil else v48.sideMargin
        };
        v77 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v51, true, v79);
    end;
    local v80 = l_useUserSeenEvent_0(l_fireAnalyticsEvent_0);
    local v85 = v7.useCallback(function(v81) --[[ Line: 218 ]]
        -- upvalues: v62 (copy), v80 (copy)
        local v82 = {};
        for _, v84 in v81 do
            table.insert(v82, {
                item = v62[v84]
            });
        end;
        if #v80 > 0 then
            v80[1].onViewableItemsChanged({
                changed = v82
            });
        end;
    end, {
        v80, 
        v62
    });
    local v86 = v7.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v21 (ref), v72 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SeeAll] = {
                handler = v21.onRelease(v72)
            }
        };
    end, {
        v72
    });
    local v87 = v19.useEventMap(v46);
    local v88 = v19.useEventHandlerMap(v86, v87);
    v7.useEffect(function() --[[ Line: 244 ]]
        -- upvalues: v88 (copy), v53 (copy)
        if v88 and v53 then
            v88(v53.current);
        end;
        return function() --[[ Line: 248 ]]
            -- upvalues: v88 (ref)
            v88(nil);
        end;
    end, {
        v88, 
        v53, 
        v53 and v53.current
    });
    local v89 = nil;
    local v90 = nil;
    if not l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        v89 = v8.usePreferredInput() == v8.Input.Directional;
        v90 = v7.useCallback(function(v91, v92, _, _) --[[ Line: 259 ]]
            -- upvalues: v77 (ref), v7 (ref), v34 (ref), v48 (copy), l_fireAnalyticsEvent_0 (copy), v35 (ref), v33 (ref), l_recommendationSessionId_0 (copy), v89 (ref)
            local l_itemWidth_0 = v77.itemWidth;
            if v91.isButtonTile then
                return v7.createElement(v34, {
                    id = v91.id, 
                    tileWidth = l_itemWidth_0, 
                    goToAddFriendsPage = v48.goToAddFriendsPage, 
                    fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                    shouldShowContactImporterBadge = v48.shouldShowContactImporterBadge, 
                    LayoutOrder = v92
                }), "PYMKCarouselButtonTile";
            elseif v91.isTooltip then
                return v7.createElement(v35, {
                    LayoutOrder = v92
                }), "PYMKCarouselFindFriendsTooltip";
            else
                return v7.createElement(v33, {
                    userId = v91.id, 
                    tileWidth = l_itemWidth_0, 
                    contextualInfoLines = 2, 
                    openProfilePeekView = v48.openProfilePeekView, 
                    showToast = v48.showToast, 
                    fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                    absolutePosition = v91.absolutePosition, 
                    recommendationSessionId = l_recommendationSessionId_0, 
                    LayoutOrder = v92, 
                    impressionsTag = "PYMKCollectionCarousel", 
                    hideButtons = v89
                }), "PYMKCarouselUserTile";
            end;
        end, {
            v48.goToAddFriendsPage, 
            l_fireAnalyticsEvent_0, 
            v48.shouldShowContactImporterBadge, 
            v48.openProfilePeekView, 
            v48.showToast, 
            l_recommendationSessionId_0, 
            v77.itemWidth, 
            v89
        });
    end;
    if l_FFlagHomepagePYMKUseHorizontalUserList_0 then
        local v96 = v39(v62);
        local v97 = v40(v62);
        local v101 = v7.useCallback(function(v98, v99, v100) --[[ Line: 316 ]]
            -- upvalues: v7 (ref), v41 (ref), v48 (copy), l_fireAnalyticsEvent_0 (copy)
            return v7.createElement(v41, {
                createRow = v98, 
                entity = v99, 
                showToast = v48.showToast, 
                fireAnalyticsEvent = l_fireAnalyticsEvent_0, 
                absolutePosition = v100, 
                recommendationSessionId = v48.recommendationSessionId, 
                openProfilePeekView = v48.openProfilePeekView
            });
        end, {
            v48.showToast, 
            l_fireAnalyticsEvent_0, 
            v48.recommendationSessionId, 
            v48.openProfilePeekView
        });
        if #v62 == 0 then
            return nil;
        else
            return v7.createElement(v7.Fragment, nil, {
                ContactsContextProvider = v7.createElement(l_ContactsContext_0.Provider, {
                    value = v97
                }, {
                    PYMKCarousel = v7.createElement(l_HorizontalUserList_0, {
                        entities = v96, 
                        renderRow = v101, 
                        header = {
                            title = v48.carouselTitle, 
                            onTitleActivated = v72
                        }, 
                        collectionCarouselConfigs = {
                            onViewableItemsChanged = v55, 
                            onChangeCanvasPosition = v55
                        }, 
                        listConfigs = {
                            showSubtitle = false
                        }, 
                        scrollingFrameRef = v53
                    })
                }), 
                ScreenSizeImpressionsTracker = v7.createElement(l_ScreenSizeImpressionsTracker_0, {
                    pageContext = v48.pageContext, 
                    parentRef = v53, 
                    impressionsTag = "PYMKCollectionCarousel", 
                    scrollViewPositionChangedSignal = v54, 
                    sendImpressions = v85, 
                    dataUpdatedTimestamp = v63
                })
            });
        end;
    elseif #v62 == 0 then
        return nil;
    else
        return v7.createElement(v7.Fragment, nil, {
            PYMKCarousel = v7.createElement(l_CollectionCarousel_0, {
                title = v48.carouselTitle, 
                onActivateHeader = v72, 
                containerRef = v52, 
                scrollingFrameRef = v53, 
                items = v62, 
                renderItem = v90, 
                getItemHeight = v75, 
                numColumns = v77.numColumns, 
                fractionalItemAmount = v77.fractionalItemAmount, 
                columnGap = v77.columnGap, 
                sideMargin = v77.sideMargin, 
                maxItemsToShow = v77.maxTilesToShow, 
                onViewableItemsChanged = v55, 
                onChangeCanvasPosition = v55
            }), 
            ScreenSizeImpressionsTracker = v7.createElement(l_ScreenSizeImpressionsTracker_0, {
                pageContext = v48.pageContext, 
                parentRef = v53, 
                impressionsTag = "PYMKCollectionCarousel", 
                scrollViewPositionChangedSignal = v54, 
                sendImpressions = v85, 
                dataUpdatedTimestamp = v63
            })
        });
    end;
end;
return v7.memo(v102);