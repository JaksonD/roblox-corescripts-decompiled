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
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
return function(v56) --[[ Line: 97 ]] --[[ Name: FriendsLandingPage ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v22 (copy), v23 (copy), l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v48 (copy), l_useTokens_0 (copy), l_useFocusGuiObject_0 (copy), l_UiMode_0 (copy), v11 (copy), v14 (copy), v26 (copy), v13 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagConnectionManagementChips_0 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_AccessResponseEnum_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_dependencyArray_0 (copy), v28 (copy), v29 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v34 (copy), v47 (copy), v27 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_GridMetrics_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v32 (copy), v37 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_RefreshScrollingFrame_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v33 (copy), v35 (copy), v36 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_CollectionGrid_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v57 = l_useLocalization_0({
        pageError = "CommonUI.Messages.Response.PageError", 
        successText = "Feature.Friends.Action.FriendRemoved", 
        errorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friends = "CommonUI.Features.Label.Friends", 
        showMore = "Feature.Avatar.Action.ShowMore"
    });
    local v58 = v3.useContext(v22.Context);
    local v59 = v3.useContext(v23.Context);
    local v60 = l_useNavigation_0();
    local l_navigateToLuaAppPages_0 = v58.navigateToLuaAppPages;
    local v62 = l_useDesignTokens_0();
    local v63 = l_useUiModeInfo_0();
    local v64 = if v48 then l_useTokens_0() else nil;
    local v65 = l_useFocusGuiObject_0();
    local v66 = v63.uiMode == l_UiMode_0.TenFoot;
    local v67 = v11.useLastInputMode() == "Cursor";
    local v69 = v14.onRelease(function(v68) --[[ Line: 120 ]]
        -- upvalues: l_navigateToLuaAppPages_0 (copy), v26 (ref)
        v68:cancel();
        l_navigateToLuaAppPages_0[v26.SearchPage]();
    end);
    local v70 = v13.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v69);
    local v71 = if v66 then v62.Global.Space_800 else v62.Global.Space_1000;
    local v72 = l_useTextSizeOffset_0();
    v71 = v71 + v72 * 3;
    local v73 = nil;
    local v74 = nil;
    if l_FFlagConnectionManagementChips_0 then
        local v75, v76 = v3.useState(false);
        v73 = v75;
        v74 = v76;
    end;
    v3.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v59 (copy), l_FFlagConnectionManagementChips_0 (ref), l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), v74 (ref), l_AccessResponseEnum_0 (ref)
        v59:pageMountingTimeReport();
        if l_FFlagConnectionManagementChips_0 then
            local v77 = l_AmpApiProvider_0.getFeatureAccess({
                l_FStringCanAccessTrustedContactsAmpFeature_0
            });
            if v77.featureAccessList and v77.featureAccessList[1] then
                v74(v77.featureAccessList[1].access == l_AccessResponseEnum_0.Granted);
            end;
        end;
    end, {});
    local v79 = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v3.useCallback(function(v78) --[[ Line: 153 ]]
        -- upvalues: v58 (copy), l_convertUserPresenceTypeToString_0 (ref)
        return function() --[[ Line: 154 ]]
            -- upvalues: v58 (ref), v78 (copy), l_convertUserPresenceTypeToString_0 (ref)
            v58.openPlayerContextualMenu({
                subjectUserId = v78.id, 
                robloxFriendshipStatus = Enum.FriendStatus.Friend, 
                subjectPresence = {
                    locationString = v78.lastLocation, 
                    locationPlaceId = v78.placeId, 
                    locationRootPlaceId = v78.rootPlaceId, 
                    locationUniverseId = v78.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v78.userPresenceType)
                }, 
                friendshipOriginSourceType = nil
            });
        end;
    end, l_dependencyArray_0(v58.openPlayerContextualMenu));
    local v85 = v3.useCallback(function(v80, v81, _, _, _) --[[ Line: 171 ]]
        -- upvalues: v59 (copy), v26 (ref), v28 (ref), v58 (copy), v29 (ref)
        return function() --[[ Line: 172 ]]
            -- upvalues: v59 (ref), v26 (ref), v28 (ref), v80 (copy), v81 (copy), v58 (ref), v29 (ref)
            v59:navigate(v26.ViewUserProfile);
            v59:buttonClick(v28.PlayerTile, {
                friendId = v80, 
                position = v81 - 1, 
                subpage = "peekView", 
                page = "playerProfile"
            });
            v58.openProfilePeekView(v80, {
                source = v29.FriendsLandingPageSourceName
            });
        end;
    end, l_dependencyArray_0(v59, v58.openProfilePeekView));
    local v88 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v86, v87) --[[ Line: 188 ]]
        -- upvalues: v59 (copy), v26 (ref), v28 (ref), v58 (copy), v29 (ref)
        v59:navigate(v26.ViewUserProfile);
        v59:buttonClick(v28.PlayerTile, {
            friendId = v86, 
            position = v87 - 1, 
            subpage = "peekView", 
            page = "playerProfile"
        });
        v58.openProfilePeekView(v86, {
            source = v29.FriendsLandingPageSourceName
        });
    end, l_dependencyArray_0(v59)) else nil;
    local function v89() --[[ Line: 203 ]]
        -- upvalues: v59 (copy)
        v59:pageLoadingTimeReport();
    end;
    local v90 = v3.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v60 (copy), v26 (ref), v57 (copy)
        return function() --[[ Line: 208 ]]
            -- upvalues: v60 (ref), v26 (ref), v57 (ref)
            v60.navigate(v26.GenericToast, {
                toastProps = {
                    toastContent = {
                        toastTitle = v57.errorText
                    }
                }
            });
        end;
    end, l_dependencyArray_0(v60, v57));
    local v93 = v3.useCallback(function(v91, v92) --[[ Line: 218 ]]
        -- upvalues: v3 (ref), v34 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v85 (copy), v66 (copy), v79 (copy), v90 (copy), v89 (copy), v56 (copy), v65 (copy)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v92
        }, {
            tile = v3.createElement(v34, {
                user = v91, 
                index = v92, 
                openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v85 else if v66 then if v79 == nil then v90 else v79 else v85, 
                isPlayerContextualMenuEnabled = v66, 
                pageLoadingTimeReport = v89, 
                selected = v92 == v56.selectedItemIndex, 
                focusGuiObject = v65
            })
        }), "FriendTile";
    end, l_dependencyArray_0(v56.selectedItemIndex, v66, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v79, v85));
    local v95 = v3.useCallback(function(v94) --[[ Line: 248 ]]
        -- upvalues: v71 (ref)
        return v94 + v71;
    end, l_dependencyArray_0(v71, v72));
    local v96 = v3.useCallback(function() --[[ Line: 252 ]]
        -- upvalues: v59 (copy), v28 (ref), v60 (copy), v26 (ref), v47 (ref), v56 (copy)
        v59:buttonClick(v28.FriendFilterPill);
        v60.navigate(v26.FilterByModal, {
            onFewestInteractionsSelection = v47, 
            friendCount = v56.totalFriendCount
        });
    end, l_dependencyArray_0(v60, v59));
    local v98 = if l_FFlagConnectionManagementChips_0 then v3.useCallback(function(v97) --[[ Line: 261 ]]
        -- upvalues: v59 (copy), v28 (ref), v58 (copy)
        v59:buttonClick(v28.FriendFilterPill);
        v58.setFilterKeys(v97);
    end, l_dependencyArray_0(v59, v58.setFilterKeys)) else nil;
    local v99 = v3.useCallback(function() --[[ Line: 267 ]]
        -- upvalues: v59 (copy), v58 (copy), v27 (ref), v57 (copy)
        v59:pageLoaded();
        v58.setFilterKeys(v27.All);
        return v58.refreshPage({
            errorMessage = v57.pageError, 
            onResolve = function() --[[ Line: 273 ]] --[[ Name: onResolve ]]
                -- upvalues: v59 (ref)
                v59:pageLoadedWithArgs();
            end
        });
    end, l_dependencyArray_0(v58.refreshPage, v57, v59, v58.setFilterKeys));
    local v100 = v3.useCallback(function() --[[ Line: 279 ]]
        -- upvalues: v59 (copy), v28 (ref), v26 (ref), l_FFlagCreateConnectionsHub_0 (ref), v60 (copy), l_AppPage_0 (ref)
        v59:buttonClick(v28.AddFriendsNoFriendsEmptyView);
        v59:navigate(v26.AddFriends);
        if l_FFlagCreateConnectionsHub_0 then
            v60.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v60.navigate(l_AppPage_0.AddFriendsPage);
            return;
        end;
    end, l_dependencyArray_0(v59, v60));
    local v101 = v56.friends and #v56.friends or 0;
    local v102 = v56.totalFriendCount or 0;
    local v103 = v102 == 0;
    local v104 = false;
    if v101 == 0 then
        v104 = v102 > 0;
    end;
    local v105 = v56.fetchMoreFriends and not v103 and not v104 and (not v58.filter or v58.filter == v27.All);
    local v106 = v3.useCallback(function() --[[ Line: 298 ]]
        -- upvalues: v56 (copy)
        if v56.fetchMoreFriends then
            v56.fetchMoreFriends();
        end;
    end, {
        v56.fetchMoreFriends
    });
    local v107 = v66 and 24 or 12;
    local v108, v109 = v3.useState(100);
    local v110 = nil;
    local v111 = nil;
    if v66 then
        v110 = v62.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
        v111 = v62.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    else
        v110 = {
            minimumItemsPerRow = 2, 
            minimumItemWidth = if v48 then 176 * v64.Config.UI.Scale else 176
        };
        v111 = 12;
    end;
    local v112 = v3.useMemo(function() --[[ Line: 321 ]]
        -- upvalues: l_GridMetrics_0 (ref), v110 (ref)
        return l_GridMetrics_0.makeCustomMetricsGetter(v110);
    end, {
        v110
    });
    local v113 = v3.useMemo(function() --[[ Line: 325 ]]
        -- upvalues: v112 (copy), v108 (copy), v111 (ref)
        return v112(v108, v111);
    end, {
        v112
    });
    local v115 = v3.useCallback(function(v114) --[[ Line: 329 ]]
        -- upvalues: v109 (copy)
        v109(v114.X);
    end, {});
    local v116 = v3.useRef({});
    local l_ScrollAnimationConfig_0 = v62.LuaApps.App.Page.ScrollAnimationConfig;
    local v118, v119 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v62.Global.Space_1000, l_ScrollAnimationConfig_0);
    local v120 = nil;
    v120 = if v66 then (v103 or v104 or v67) and 8 or 1000 else 8;
    local v121 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v32.GetDisplayStore().getDeviceSafePadding) else nil;
    v120 = v120 + if l_FFlagExtendScrollingFramesBySafeInsets_0 then v121.bottom else 0;
    local v122 = l_FFlagCreateConnectionsHub_0 and v37(v60);
    local v126 = if l_FFlagFriendsPageUserListEnabled_0 then v3.useCallback(function(v123, v124, v125) --[[ Line: 354 ]]
        -- upvalues: v3 (ref), v34 (ref), v88 (copy), v89 (copy)
        return v3.createElement(v34, {
            user = v124, 
            createRow = v123, 
            index = v125, 
            openPlayerProfileHandle = v88, 
            pageLoadingTimeReport = v89, 
            isPlayerContextualMenuEnabled = nil
        });
    end, {
        v89, 
        v88
    }) else nil;
    return v3.createElement("Frame", {
        [v4.Ref] = v70, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = if v122 then nil else v62.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v122 and 1 or v62.LuaApps.App.Page.BackgroundTransparency
    }, {
        HorizontalPageMargin = v3.createElement(l_HorizontalPageMargin_0, {
            Size = UDim2.fromScale(1, 1), 
            backgroundTransparency = 1
        }, {
            scrollView = v3.createElement(l_RefreshScrollingFrame_0, {
                scrollingElementProps = {
                    Size = UDim2.new(1, 0, 1, -v29.TOP_BAR_HEIGHT + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v121.bottom or 0)), 
                    BackgroundTransparency = 1, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasPosition = v118, 
                    [v4.Event.SelectionChanged] = v119, 
                    Selectable = not l_FFlagEnableLeftNavOnConsole_0 and nil
                }, 
                [v4.Ref] = v116, 
                refresh = v99, 
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
                filterByButton = if v66 then nil else v3.createElement(v33, {
                    analytics = v59, 
                    filter = v58.filter, 
                    friendCount = if v58.filter == v27.All then v102 else v101, 
                    isDisabled = v102 == 0, 
                    layoutOrder = 2, 
                    onActivated = if l_FFlagConnectionManagementChips_0 then v98 else v96, 
                    maxWidth = l_FFlagConnectionManagementChips_0 and 640 or nil, 
                    canAccessTrustedContacts = if l_FFlagConnectionManagementChips_0 then v73 else nil
                }), 
                NoResultsView = if v104 then v3.createElement(v35, {
                    layoutOrder = 6
                }) else nil, 
                NoFriendsView = if v103 then v3.createElement(v36, {
                    layoutOrder = 6, 
                    pageLoadingTimeReport = v89, 
                    openAddFriendsPage = v100
                }) else nil, 
                UserListLayoutAdaptor = if l_FFlagFriendsPageUserListEnabled_0 then if v104 or v103 then nil else v3.createElement(l_UserListLayoutAdaptor_0, {
                    layoutOrder = 6, 
                    layoutMode = l_LayoutMode_0.Vertical, 
                    header = {
                        title = v57.peopleYouMayKnow
                    }, 
                    entities = v56.friends, 
                    isScrollEnabled = false, 
                    renderRow = v126, 
                    hasMore = v105, 
                    onLoadMore = v106
                }) else nil, 
                FriendsGridView = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v104 or v103 then nil else v3.createElement(l_CollectionGrid_0, {
                    LayoutOrder = 6, 
                    items = v56.friends, 
                    verticalScrollingFrameRef = v116, 
                    renderItem = v93, 
                    getItemHeight = v95, 
                    numColumns = v113.itemsPerRow, 
                    columnGap = v111, 
                    verticalPadding = v107, 
                    onContainerSizeChanged = v115
                }), 
                showMoreFrame = if l_FFlagFriendsPageUserListEnabled_0 then nil else if v105 then v3.createElement("Frame", {
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
                        onActivated = v106, 
                        text = v57.showMore
                    })
                }) else nil, 
                additionalPadding = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v120), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8
                })
            })
        })
    });
end;