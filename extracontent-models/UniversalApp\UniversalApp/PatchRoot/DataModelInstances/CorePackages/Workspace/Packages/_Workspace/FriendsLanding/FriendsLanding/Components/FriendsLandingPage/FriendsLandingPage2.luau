local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local l_UIBlox_0 = v1.UIBlox;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v11 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v11.FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local v14 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local l_useFocusGuiObject_0 = v1.useFocusGuiObject;
local v22 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v23 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local l_RefreshScrollingFrame_0 = v1.SocialLibraries.Components.RefreshScrollingFrame;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local v26 = require(l_script_FirstAncestor_0.EnumScreens);
local v27 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v28 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v29 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v32 = require(l_Parent_0.Display);
local v33 = require(l_script_FirstAncestor_0.Components.FilterByButton);
local v34 = require(l_script_FirstAncestor_0.Components.FriendTile);
local v35 = require(l_script_FirstAncestor_0.Components.EmptyResultsView);
local v36 = require(l_script_FirstAncestor_0.Components.NoFriendsView);
local v37 = require(l_script_FirstAncestor_0.Navigator.isFromConnectionsHub);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useTextSizeOffset_0 = l_UIBlox_0.Core.Style.useTextSizeOffset;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v42 = require(l_Parent_0.UserList);
local l_UserListLayoutAdaptor_0 = v42.UserListLayoutAdaptor;
local l_LayoutMode_0 = v42.Enums.LayoutMode;
local function v45() --[[ Line: 58 ]]

end;
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagFixScalingOnFriendsLanding);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagFriendsPageAlwaysOpenPPV_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageAlwaysOpenPPV;
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v52) --[[ Line: 91 ]] --[[ Name: FriendsLandingPage ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v22 (copy), v23 (copy), l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v46 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_UiMode_0 (copy), v11 (copy), v14 (copy), v26 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_dependencyArray_0 (copy), v28 (copy), v29 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v34 (copy), v45 (copy), v27 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_GridMetrics_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v32 (copy), v37 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_RefreshScrollingFrame_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v33 (copy), v35 (copy), v36 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_CollectionGrid_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v53 = l_useLocalization_0({
        pageError = "CommonUI.Messages.Response.PageError", 
        successText = "Feature.Friends.Action.FriendRemoved", 
        errorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friends = "CommonUI.Features.Label.Friends", 
        showMore = "Feature.Avatar.Action.ShowMore"
    });
    local v54 = v3.useContext(v22.Context);
    local v55 = v3.useContext(v23.Context);
    local v56 = l_useNavigation_0();
    local l_navigateToLuaAppPages_0 = v54.navigateToLuaAppPages;
    local v58 = l_useDesignTokens_0();
    local v59 = l_useUiModeInfo_0();
    local v60 = if v46 then l_useTokens_0() else nil;
    local v61 = l_useFocusGuiObject_0();
    local v62 = v59.uiMode == l_UiMode_0.TenFoot;
    local v63 = v11.useLastInputMode() == "Cursor";
    local v65 = v14.onRelease(function(v64) --[[ Line: 114 ]]
        -- upvalues: l_navigateToLuaAppPages_0 (copy), v26 (ref)
        v64:cancel();
        l_navigateToLuaAppPages_0[v26.SearchPage]();
    end);
    local v66 = v13.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v65);
    local v67 = if v62 then v58.Global.Space_800 else v58.Global.Space_1000;
    local v68 = l_useTextSizeOffset_0();
    v67 = v67 + v68 * 3;
    v3.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v55 (copy)
        v55:pageMountingTimeReport();
    end, {});
    local v70 = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v3.useCallback(function(v69) --[[ Line: 136 ]]
        -- upvalues: v54 (copy), l_convertUserPresenceTypeToString_0 (ref)
        return function() --[[ Line: 137 ]]
            -- upvalues: v54 (ref), v69 (copy), l_convertUserPresenceTypeToString_0 (ref)
            v54.openPlayerContextualMenu({
                subjectUserId = v69.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v69.lastLocation, 
                    locationPlaceId = v69.placeId, 
                    locationRootPlaceId = v69.rootPlaceId, 
                    locationUniverseId = v69.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v69.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end, l_dependencyArray_0(v54.openPlayerContextualMenu));
    local v76 = v3.useCallback(function(v71, v72, _, _, _) --[[ Line: 154 ]]
        -- upvalues: v55 (copy), v26 (ref), v28 (ref), v54 (copy), v29 (ref)
        return function() --[[ Line: 155 ]]
            -- upvalues: v55 (ref), v26 (ref), v28 (ref), v71 (copy), v72 (copy), v54 (ref), v29 (ref)
            v55:navigate(v26.ViewUserProfile);
            v55:buttonClick(v28.PlayerTile, {
                friendId = v71, 
                position = v72 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            v54.openProfilePeekView(v71, {
                source = v29.FriendsLandingPageSourceName
            });
        end;
    end, l_dependencyArray_0(v55, v54.openProfilePeekView));
    local v79 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v77, v78) --[[ Line: 171 ]]
        -- upvalues: v55 (copy), v26 (ref), v28 (ref), v54 (copy), v29 (ref)
        v55:navigate(v26.ViewUserProfile);
        v55:buttonClick(v28.PlayerTile, {
            friendId = v77, 
            position = v78 - 1, 
            subpage = "peekView", 
            page = "playerProfile"
        });
        v54.openProfilePeekView(v77, {
            source = v29.FriendsLandingPageSourceName
        });
    end, l_dependencyArray_0(v55)) else nil;
    local function v80() --[[ Line: 186 ]]
        -- upvalues: v55 (copy)
        v55:pageLoadingTimeReport();
    end;
    local v81 = v3.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v56 (copy), v26 (ref), v53 (copy)
        return function() --[[ Line: 191 ]]
            -- upvalues: v56 (ref), v26 (ref), v53 (ref)
            v56.navigate(v26.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v53.errorText
                    }
                }
            });
        end;
    end, l_dependencyArray_0(v56, v53));
    local v84 = v3.useCallback(function(v82, v83) --[[ Line: 201 ]]
        -- upvalues: v3 (ref), v34 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v76 (copy), v62 (copy), v70 (copy), v81 (copy), v80 (copy), v52 (copy), v61 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v83
        }, {
            tile = v3.createElement(v34, {
                user = v82, 
                index = v83, 
                openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v76 else if v62 then if v70 == nil then v81 else v70 else v76, 
                isPlayerContextualMenuEnabled = v62, 
                pageLoadingTimeReport = v80, 
                selected = v83 == v52.selectedItemIndex, 
                focusGuiObject = v61
            })
        }), "FriendTile";
    end, l_dependencyArray_0(v52.selectedItemIndex, v62, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v70, v76));
    local v86 = v3.useCallback(function(v85) --[[ Line: 231 ]]
        -- upvalues: v67 (ref)
        return v85 + v67;
    end, l_dependencyArray_0(v67, v68));
    local v87 = v3.useCallback(function() --[[ Line: 235 ]]
        -- upvalues: v55 (copy), v28 (ref), v56 (copy), v26 (ref), v45 (ref), v52 (copy)
        v55:buttonClick(v28.FriendFilterPill);
        v56.navigate(v26.FilterByModal, {
            onFewestInteractionsSelection = v45, 
            friendCount = v52.totalFriendCount
        });
    end, l_dependencyArray_0(v56, v55));
    local v88 = v3.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v55 (copy), v54 (copy), v27 (ref), v53 (copy)
        v55:pageLoaded();
        v54.setFilterKeys(v27.All);
        return v54.refreshPage({
            errorMessage = v53.pageError, 
            onResolve = function() --[[ Line: 249 ]] --[[ Name: onResolve ]]
                -- upvalues: v55 (ref)
                v55:pageLoadedWithArgs();
            end
        });
    end, l_dependencyArray_0(v54.refreshPage, v53, v55, v54.setFilterKeys));
    local v89 = v3.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v55 (copy), v28 (ref), v26 (ref), l_FFlagCreateConnectionsHub_0 (ref), v56 (copy), l_AppPage_0 (ref)
        v55:buttonClick(v28.AddFriendsNoFriendsEmptyView);
        v55:navigate(v26.AddFriends);
        if l_FFlagCreateConnectionsHub_0 then
            v56.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v56.navigate(l_AppPage_0.AddFriendsPage);
            return;
        end;
    end, l_dependencyArray_0(v55, v56));
    local v90 = v52.friends and #v52.friends or 0;
    local v91 = v52.totalFriendCount or 0;
    local v92 = v91 == 0;
    local v93 = false;
    if v90 == 0 then
        v93 = v91 > 0;
    end;
    local v94 = v52.fetchMoreFriends and not v92 and not v93 and (not v54.filter or v54.filter == v27.All);
    local v95 = v3.useCallback(function() --[[ Line: 274 ]]
        -- upvalues: v52 (copy)
        if v52.fetchMoreFriends then
            v52.fetchMoreFriends();
        end;
    end, {
        v52.fetchMoreFriends
    });
    local v96 = v62 and 24 or 12;
    local v97, v98 = v3.useState(100);
    local v99 = nil;
    local v100 = nil;
    if v62 then
        v99 = v58.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
        v100 = v58.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    else
        v99 = {
            minimumItemsPerRow = 2, 
            minimumItemWidth = if v46 then 176 * v60.Config.UI.Scale else 176
        };
        v100 = 12;
    end;
    local v101 = v3.useMemo(function() --[[ Line: 297 ]]
        -- upvalues: l_GridMetrics_0 (ref), v99 (ref)
        return l_GridMetrics_0.makeCustomMetricsGetter(v99);
    end, {
        v99
    });
    local v102 = v3.useMemo(function() --[[ Line: 301 ]]
        -- upvalues: v101 (copy), v97 (copy), v100 (ref)
        return v101(v97, v100);
    end, {
        v101
    });
    local v104 = v3.useCallback(function(v103) --[[ Line: 305 ]]
        -- upvalues: v98 (copy)
        v98(v103.X);
    end, {});
    local v105 = v3.useRef({});
    local l_ScrollAnimationConfig_0 = v58.LuaApps.App.Page.ScrollAnimationConfig;
    local v107, v108 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v58.Global.Space_1000, l_ScrollAnimationConfig_0);
    local v109 = nil;
    v109 = if v62 then (v92 or v93 or v63) and 8 or 1000 else 8;
    local v110 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v32.GetDisplayStore().getDeviceSafePadding) else nil;
    v109 = v109 + if l_FFlagExtendScrollingFramesBySafeInsets_0 then v110.bottom else 0;
    local v111 = l_FFlagCreateConnectionsHub_0 and v37(v56);
    local v115 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v112, v113, v114) --[[ Line: 330 ]]
        -- upvalues: v3 (ref), v34 (ref), v79 (copy), v80 (copy)
        return v3.createElement(v34, {
            user = v113, 
            createRow = v112, 
            index = v114, 
            openPlayerProfileHandle = v79, 
            pageLoadingTimeReport = v80, 
            isPlayerContextualMenuEnabled = nil
        });
    end, {
        v80, 
        v79
    }) else nil;
    return v3.createElement("Frame", {
        [v4.Ref] = v66, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = if v111 then nil else v58.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v111 and 1 or v58.LuaApps.App.Page.BackgroundTransparency
    }, {
        HorizontalPageMargin = v3.createElement(l_HorizontalPageMargin_0, {
            Size = UDim2.fromScale(1, 1), 
            backgroundTransparency = 1
        }, {
            scrollView = v3.createElement(l_RefreshScrollingFrame_0, {
                scrollingElementProps = {
                    Size = UDim2.new(1, 0, 1, -v29.TOP_BAR_HEIGHT + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v110.bottom or 0)), 
                    BackgroundTransparency = 1, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasPosition = v107, 
                    [v4.Event.SelectionChanged] = v108, 
                    Selectable = not l_FFlagEnableLeftNavOnConsole_0 and nil
                }, 
                [v4.Ref] = v105, 
                refresh = v88, 
                usesBuilderIcon = true
            }, {
                UISizeConstraint = if l_FFlagFriendsPageUserListEnabled_0 then v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(640, 1e999)
                }) else nil, 
                layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                pulldownSpacing = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1
                }) or nil, 
                filterByButton = if v62 then nil else v3.createElement(v33, {
                    analytics = v55, 
                    filter = v54.filter, 
                    friendCount = if v54.filter == v27.All then v91 else v90, 
                    isDisabled = v91 == 0, 
                    layoutOrder = 2, 
                    onActivated = v87
                }), 
                NoResultsView = if v93 then v3.createElement(v35, {
                    layoutOrder = 6
                }) else nil, 
                NoFriendsView = if v92 then v3.createElement(v36, {
                    layoutOrder = 6, 
                    pageLoadingTimeReport = v80, 
                    openAddFriendsPage = v89
                }) else nil, 
                UserListLayoutAdaptor = if l_FFlagFriendsPageUserListEnabled_0 then if v93 or v92 then nil else v3.createElement(l_UserListLayoutAdaptor_0, {
                    layoutOrder = 6, 
                    layoutMode = l_LayoutMode_0.Vertical, 
                    header = {
                        title = v53.peopleYouMayKnow
                    }, 
                    entities = v52.friends, 
                    isScrollEnabled = false, 
                    renderRow = v115, 
                    hasMore = v94, 
                    onLoadMore = v95
                }) else nil, 
                FriendsGridView = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v93 or v92 then nil else v3.createElement(l_CollectionGrid_0, {
                    LayoutOrder = 6, 
                    items = v52.friends, 
                    verticalScrollingFrameRef = v105, 
                    renderItem = v84, 
                    getItemHeight = v86, 
                    numColumns = v102.itemsPerRow, 
                    columnGap = v100, 
                    verticalPadding = v96, 
                    onContainerSizeChanged = v104
                }), 
                showMoreFrame = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v94 then v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v29.CTA_BUTTON_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 7
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 2), 
                        PaddingRight = UDim.new(0, 2), 
                        PaddingTop = UDim.new(0, 10)
                    }), 
                    showMoreButton = v3.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        size = UDim2.new(1, 0, 1, 0), 
                        onActivated = v95, 
                        text = v53.showMore
                    })
                }) else nil, 
                additionalPadding = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v109), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8
                })
            })
        })
    });
end;