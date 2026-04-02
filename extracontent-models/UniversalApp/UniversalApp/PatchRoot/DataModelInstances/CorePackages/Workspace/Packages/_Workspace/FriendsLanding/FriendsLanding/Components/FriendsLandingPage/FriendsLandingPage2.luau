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
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useTextSizeOffset_0 = l_UIBlox_0.Core.Style.useTextSizeOffset;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v44 = require(l_Parent_0.UserList);
local l_UserListLayoutAdaptor_0 = v44.UserListLayoutAdaptor;
local l_LayoutMode_0 = v44.Enums.LayoutMode;
local function v47() --[[ Line: 62 ]]

end;
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagFixScalingOnFriendsLanding);
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagFriendsPageAlwaysOpenPPV_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageAlwaysOpenPPV;
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FStringIsUserInTcEligibleCountryAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v58) --[[ Line: 100 ]] --[[ Name: FriendsLandingPage ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v22 (copy), v23 (copy), l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v48 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_UiMode_0 (copy), v11 (copy), v14 (copy), v26 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagConnectionManagementChips_0 (copy), l_AmpApiProvider_0 (copy), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AccessResponseEnum_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v28 (copy), v29 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v34 (copy), v47 (copy), v27 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_GridMetrics_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v32 (copy), v37 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_RefreshScrollingFrame_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v33 (copy), v35 (copy), v36 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_CollectionGrid_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v59 = l_useLocalization_0({
        pageError = "CommonUI.Messages.Response.PageError", 
        successText = "Feature.Friends.Action.FriendRemoved", 
        errorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friends = "CommonUI.Features.Label.Friends", 
        showMore = "Feature.Avatar.Action.ShowMore"
    });
    local v60 = v3.useContext(v22.Context);
    local v61 = v3.useContext(v23.Context);
    local v62 = l_useNavigation_0();
    local l_navigateToLuaAppPages_0 = v60.navigateToLuaAppPages;
    local v64 = l_useDesignTokens_0();
    local v65 = l_useUiModeInfo_0();
    local v66 = if v48 then l_useTokens_0() else nil;
    local v67 = l_useFocusGuiObject_0();
    local v68 = v65.uiMode == l_UiMode_0.TenFoot;
    local v69 = v11.useLastInputMode() == "Cursor";
    local v71 = v14.onRelease(function(v70) --[[ Line: 123 ]]
        -- upvalues: l_navigateToLuaAppPages_0 (copy), v26 (ref)
        v70:cancel();
        l_navigateToLuaAppPages_0[v26.SearchPage]();
    end);
    local v72 = v13.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v71);
    local v73 = if v68 then v64.Global.Space_800 else v64.Global.Space_1000;
    local v74 = l_useTextSizeOffset_0();
    v73 = v73 + v74 * 3;
    local v75 = nil;
    local v76 = nil;
    if l_FFlagConnectionManagementChips_0 then
        local v77, v78 = v3.useState(false);
        v75 = v77;
        v76 = v78;
    end;
    v3.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v61 (copy), l_FFlagConnectionManagementChips_0 (ref), l_AmpApiProvider_0 (ref), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AccessResponseEnum_0 (ref), v76 (ref)
        v61:pageMountingTimeReport();
        if l_FFlagConnectionManagementChips_0 and l_AmpApiProvider_0.upsellFeatureAccess(l_FStringIsUserInTcEligibleCountryAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AccessResponseEnum_0.Granted then
            v76(true);
        end;
    end, {});
    local v80 = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v3.useCallback(function(v79) --[[ Line: 157 ]]
        -- upvalues: v60 (copy), l_convertUserPresenceTypeToString_0 (ref)
        return function() --[[ Line: 158 ]]
            -- upvalues: v60 (ref), v79 (copy), l_convertUserPresenceTypeToString_0 (ref)
            v60.openPlayerContextualMenu({
                subjectUserId = v79.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v79.lastLocation, 
                    locationPlaceId = v79.placeId, 
                    locationRootPlaceId = v79.rootPlaceId, 
                    locationUniverseId = v79.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v79.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v60.openPlayerContextualMenu
    } else l_dependencyArray_0(v60.openPlayerContextualMenu));
    local v86 = v3.useCallback(function(v81, v82, _, _, _) --[[ Line: 180 ]]
        -- upvalues: v61 (copy), v26 (ref), v28 (ref), v60 (copy), v29 (ref)
        return function() --[[ Line: 181 ]]
            -- upvalues: v61 (ref), v26 (ref), v28 (ref), v81 (copy), v82 (copy), v60 (ref), v29 (ref)
            v61:navigate(v26.ViewUserProfile);
            v61:buttonClick(v28.PlayerTile, {
                friendId = v81, 
                position = v82 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            v60.openProfilePeekView(v81, {
                source = v29.FriendsLandingPageSourceName
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v61, 
        v60.openProfilePeekView
    } else l_dependencyArray_0(v61, v60.openProfilePeekView));
    local v89 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v87, v88) --[[ Line: 201 ]]
        -- upvalues: v61 (copy), v26 (ref), v28 (ref), v60 (copy), v29 (ref)
        v61:navigate(v26.ViewUserProfile);
        v61:buttonClick(v28.PlayerTile, {
            friendId = v87, 
            position = v88 - 1, 
            subpage = "peekView", 
            page = "playerProfile"
        });
        v60.openProfilePeekView(v87, {
            source = v29.FriendsLandingPageSourceName
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v61
    } else l_dependencyArray_0(v61)) else nil;
    local function v90() --[[ Line: 216 ]]
        -- upvalues: v61 (copy)
        v61:pageLoadingTimeReport();
    end;
    local v91 = v3.useCallback(function() --[[ Line: 221 ]]
        -- upvalues: v62 (copy), v26 (ref), v59 (copy)
        return function() --[[ Line: 222 ]]
            -- upvalues: v62 (ref), v26 (ref), v59 (ref)
            v62.navigate(v26.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v59.errorText
                    }
                }
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v62, 
        v59
    } else l_dependencyArray_0(v62, v59));
    local v94 = v3.useCallback(function(v92, v93) --[[ Line: 236 ]]
        -- upvalues: v3 (ref), v34 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v86 (copy), v68 (copy), v80 (copy), v91 (copy), v90 (copy), v58 (copy), v67 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v93
        }, {
            tile = v3.createElement(v34, {
                user = v92, 
                index = v93, 
                openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v86 else if v68 then if v80 == nil then v91 else v80 else v86, 
                isPlayerContextualMenuEnabled = v68, 
                pageLoadingTimeReport = v90, 
                selected = v93 == v58.selectedItemIndex, 
                focusGuiObject = v67
            })
        }), "FriendTile";
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v58.selectedItemIndex, 
        v68, 
        if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v80, 
        v86
    } else l_dependencyArray_0(v58.selectedItemIndex, v68, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v80, v86));
    local v96 = v3.useCallback(function(v95) --[[ Line: 273 ]]
        -- upvalues: v73 (ref)
        return v95 + v73;
    end, l_dependencyArray_0(v73, v74));
    local v97 = v3.useCallback(function() --[[ Line: 277 ]]
        -- upvalues: v61 (copy), v28 (ref), v62 (copy), v26 (ref), v47 (ref), v58 (copy)
        v61:buttonClick(v28.FriendFilterPill);
        v62.navigate(v26.FilterByModal, {
            onFewestInteractionsSelection = v47, 
            friendCount = v58.totalFriendCount
        });
    end, l_dependencyArray_0(v62, v61));
    local v99 = if l_FFlagConnectionManagementChips_0 then v3.useCallback(function(v98) --[[ Line: 286 ]]
        -- upvalues: v61 (copy), v28 (ref), v60 (copy)
        v61:buttonClick(v28.FriendFilterPill);
        v60.setFilterKeys(v98);
    end, l_dependencyArray_0(v61, v60.setFilterKeys)) else nil;
    local v100 = v3.useCallback(function() --[[ Line: 292 ]]
        -- upvalues: v61 (copy), v60 (copy), v27 (ref), v59 (copy)
        v61:pageLoaded();
        v60.setFilterKeys(v27.All);
        return v60.refreshPage({
            errorMessage = v59.pageError, 
            onResolve = function() --[[ Line: 298 ]] --[[ Name: onResolve ]]
                -- upvalues: v61 (ref)
                v61:pageLoadedWithArgs();
            end
        });
    end, l_dependencyArray_0(v60.refreshPage, v59, v61, v60.setFilterKeys));
    local v101 = v3.useCallback(function() --[[ Line: 304 ]]
        -- upvalues: v61 (copy), v28 (ref), v26 (ref), l_FFlagCreateConnectionsHub_0 (ref), v62 (copy), l_AppPage_0 (ref)
        v61:buttonClick(v28.AddFriendsNoFriendsEmptyView);
        v61:navigate(v26.AddFriends);
        if l_FFlagCreateConnectionsHub_0 then
            v62.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v62.navigate(l_AppPage_0.AddFriendsPage);
            return;
        end;
    end, l_dependencyArray_0(v61, v62));
    local v102 = v58.friends and #v58.friends or 0;
    local v103 = v58.totalFriendCount or 0;
    local v104 = v103 == 0;
    local v105 = false;
    if v102 == 0 then
        v105 = v103 > 0;
    end;
    local v106 = v58.fetchMoreFriends and not v104 and not v105 and (not v60.filter or v60.filter == v27.All);
    local v107 = v3.useCallback(function() --[[ Line: 323 ]]
        -- upvalues: v58 (copy)
        if v58.fetchMoreFriends then
            v58.fetchMoreFriends();
        end;
    end, {
        v58.fetchMoreFriends
    });
    local v108 = v68 and 24 or 12;
    local v109, v110 = v3.useState(100);
    local v111 = nil;
    local v112 = nil;
    if v68 then
        v111 = v64.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
        v112 = v64.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    else
        v111 = {
            minimumItemsPerRow = 2, 
            minimumItemWidth = if v48 then 176 * v66.Config.UI.Scale else 176
        };
        v112 = 12;
    end;
    local v113 = v3.useMemo(function() --[[ Line: 346 ]]
        -- upvalues: l_GridMetrics_0 (ref), v111 (ref)
        return l_GridMetrics_0.makeCustomMetricsGetter(v111);
    end, {
        v111
    });
    local v114 = v3.useMemo(function() --[[ Line: 350 ]]
        -- upvalues: v113 (copy), v109 (copy), v112 (ref)
        return v113(v109, v112);
    end, {
        v113
    });
    local v116 = v3.useCallback(function(v115) --[[ Line: 354 ]]
        -- upvalues: v110 (copy)
        v110(v115.X);
    end, {});
    local v117 = v3.useRef({});
    local l_ScrollAnimationConfig_0 = v64.LuaApps.App.Page.ScrollAnimationConfig;
    local v119, v120 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v64.Global.Space_1000, l_ScrollAnimationConfig_0);
    local v121 = nil;
    v121 = if v68 then (v104 or v105 or v69) and 8 or 1000 else 8;
    local v122 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v32.GetDisplayStore().getDeviceSafePadding) else nil;
    v121 = v121 + if l_FFlagExtendScrollingFramesBySafeInsets_0 then v122.bottom else 0;
    local v123 = l_FFlagCreateConnectionsHub_0 and v37(v62);
    local v127 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v124, v125, v126) --[[ Line: 379 ]]
        -- upvalues: v3 (ref), v34 (ref), v89 (copy), v90 (copy)
        return v3.createElement(v34, {
            user = v125, 
            createRow = v124, 
            index = v126, 
            openPlayerProfileHandle = v89, 
            pageLoadingTimeReport = v90, 
            isPlayerContextualMenuEnabled = nil
        });
    end, {
        v90, 
        v89
    }) else nil;
    return v3.createElement("Frame", {
        [v4.Ref] = v72, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = if v123 then nil else v64.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v123 and 1 or v64.LuaApps.App.Page.BackgroundTransparency
    }, {
        HorizontalPageMargin = v3.createElement(l_HorizontalPageMargin_0, {
            Size = UDim2.fromScale(1, 1), 
            backgroundTransparency = 1
        }, {
            scrollView = v3.createElement(l_RefreshScrollingFrame_0, {
                scrollingElementProps = {
                    Size = UDim2.new(1, 0, 1, -v29.TOP_BAR_HEIGHT + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v122.bottom or 0)), 
                    BackgroundTransparency = 1, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasPosition = v119, 
                    [v4.Event.SelectionChanged] = v120, 
                    Selectable = not l_FFlagEnableLeftNavOnConsole_0 and nil
                }, 
                [v4.Ref] = v117, 
                refresh = v100, 
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
                filterByButton = if v68 then nil else v3.createElement(v33, {
                    analytics = v61, 
                    filter = v60.filter, 
                    friendCount = if v60.filter == v27.All then v103 else v102, 
                    isDisabled = v103 == 0, 
                    layoutOrder = 2, 
                    onActivated = if l_FFlagConnectionManagementChips_0 then v99 else v97, 
                    maxWidth = l_FFlagConnectionManagementChips_0 and 640 or nil, 
                    canAccessTrustedContacts = if l_FFlagConnectionManagementChips_0 then v75 else nil
                }), 
                NoResultsView = if v105 then v3.createElement(v35, {
                    layoutOrder = 6
                }) else nil, 
                NoFriendsView = if v104 then v3.createElement(v36, {
                    layoutOrder = 6, 
                    pageLoadingTimeReport = v90, 
                    openAddFriendsPage = v101
                }) else nil, 
                UserListLayoutAdaptor = if l_FFlagFriendsPageUserListEnabled_0 then if v105 or v104 then nil else v3.createElement(l_UserListLayoutAdaptor_0, {
                    layoutOrder = 6, 
                    layoutMode = l_LayoutMode_0.Vertical, 
                    header = {
                        title = v59.peopleYouMayKnow
                    }, 
                    entities = v58.friends, 
                    isScrollEnabled = false, 
                    renderRow = v127, 
                    hasMore = v106, 
                    onLoadMore = v107
                }) else nil, 
                FriendsGridView = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v105 or v104 then nil else v3.createElement(l_CollectionGrid_0, {
                    LayoutOrder = 6, 
                    items = v58.friends, 
                    verticalScrollingFrameRef = v117, 
                    renderItem = v94, 
                    getItemHeight = v96, 
                    numColumns = v114.itemsPerRow, 
                    columnGap = v112, 
                    verticalPadding = v108, 
                    onContainerSizeChanged = v116
                }), 
                showMoreFrame = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v106 then v3.createElement("Frame", {
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
                        onActivated = v107, 
                        text = v59.showMore
                    })
                }) else nil, 
                additionalPadding = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v121), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8
                })
            })
        })
    });
end;