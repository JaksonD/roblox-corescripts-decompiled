local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactUtils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useAnimatedScrollToSelection_0 = require(l_Parent_0.RobloxAppHooks).useAnimatedScrollToSelection;
local v7 = require(l_Parent_0.FocusNavigationUtils);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.UIBlox);
local v11 = require(l_Parent_0.RobloxAppEnums);
local v12 = require(l_Parent_0.SocialLuaAnalytics);
local v13 = require(l_Parent_0.InputHandlers);
local v14 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_UserSearchBarButton_0 = require(l_Parent_0.SocialCommon).Components.UserSearchBar.UserSearchBarButton;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v17 = require(l_Parent_0.Display);
local l_AddFriendsSelector_0 = require(l_Parent_0.AddFriendsState).AddFriendsSelector;
local l_Parent_1 = script.Parent.Parent;
local v20 = require(l_Parent_1.AddFriendsTile);
local v21 = require(l_Parent_1.AddFriendsEmptyState);
local v22 = require(l_Parent_1.AddFriendsPageHeader);
local v23 = require(l_Parent_1.TrustedContactsEducationBanner);
local v24 = require(l_Parent_1.ConnectionChannelsSection);
local v25 = require(l_Parent_1.FriendRequestsSection);
local v26 = require(l_Parent_1.FriendRecommendationsSection);
local l_FocusNavigationEventNameEnum_0 = v7.FocusNavigationEventNameEnum;
local l_useLastInputMode_0 = v7.useLastInputMode;
local l_useScreenSize_0 = v9.useScreenSize;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_AppPage_0 = v11.AppPage;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_Sources_0 = v12.Analytics.Enums.Sources;
local l_RefreshScrollingFrame_0 = v14.SocialLibraries.config({}).Components.RefreshScrollingFrame;
local l_getPageMargin_0 = v10.App.Container.getPageMargin;
local l_VerticalScrollViewWithMargin_0 = v10.App.Container.VerticalScrollViewWithMargin;
local l_useUiModeInfo_0 = v9.useUiModeInfo;
local l_UiMode_0 = v11.UiMode;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
return function(v44) --[[ Line: 75 ]] --[[ Name: AddFriendsPage ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useLastInputMode_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), v1 (copy), v11 (copy), l_dependencyArray_0 (copy), v13 (copy), v8 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useDesignTokens_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v20 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), l_Sources_0 (copy), l_getPageMargin_0 (copy), v21 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v17 (copy), v2 (copy), l_RefreshScrollingFrame_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v22 (copy), l_UserSearchBarButton_0 (copy)
    local v45 = l_useScreenSize_0();
    local v46 = l_useNavigation_0();
    local v47 = l_useLastInputMode_0();
    local v48 = v47 == "Focus";
    local v49 = v47 == "Cursor";
    local v50 = l_useUiModeInfo_0();
    local v51 = v50 and v50.uiMode == l_UiMode_0.TenFoot;
    local v52 = not v51 or l_FFlagEnableLeftNavOnConsole_0;
    local v53 = not v51 or l_FFlagEnableLeftNavOnConsole_0;
    if l_FFlagCreateConnectionsHub_0 and v46.state.routeName == l_AppPage_0.CoHubAddConnections then
        v53 = false;
        v52 = false;
    end;
    local v55 = v1.useCallback(function(v54) --[[ Line: 99 ]]
        -- upvalues: v52 (ref), v46 (copy), l_AppPage_0 (ref), v11 (ref), v44 (copy)
        if not v52 then
            v54:cancel();
            v46.navigate(l_AppPage_0.SearchPage, {
                defaultSearchType = v11.SearchTypes.Players
            });
            return;
        else
            v54:cancel();
            v46.navigate(l_AppPage_0.UserSearch, {
                shouldShowUserSearchLandingPage = true
            });
            v44.fireSearchbarPressedEvent();
            return;
        end;
    end, l_dependencyArray_0(v46, v44.fireSearchbarPressedEvent, v44.navigateToLuaAppPages, v52));
    local v56 = v13.onRelease(v55);
    local v57 = v8.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v56);
    local v58 = l_useDesignTokens_0();
    local l_ScrollAnimationConfig_0 = v58.LuaApps.App.Page.ScrollAnimationConfig;
    local v60, v61 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v58.Global.Space_600, l_ScrollAnimationConfig_0);
    if not v48 then
        v60 = nil;
    end;
    if not v48 then
        v61 = nil;
    end;
    local l_Size_600_0 = v58.Global.Size_600;
    local v69 = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v1.useCallback(function(v63, v64, v65, v66, v67, v68) --[[ Line: 137 ]]
        -- upvalues: v1 (ref), v20 (ref)
        return v1.createElement(v20, {
            layoutOrder = v66, 
            position = v66, 
            user = v63, 
            size = Vector2.new(v64, v65), 
            isFriendRequest = not v63.isRecommendation, 
            isRecommendation = v63.isRecommendation, 
            selected = v66 == v67, 
            impressionsTag = v68
        });
    end, {});
    local v71 = l_useSelector_0(function(v70) --[[ Line: 155 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v70, "Friends.requests.receivedCount");
    end);
    local v72 = v1.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v46 (copy), l_AppPage_0 (ref), l_Sources_0 (ref), v44 (copy)
        v46.navigate(l_AppPage_0.UserSearch, {
            shouldShowUserSearchLandingPage = true, 
            entryPoint = l_Sources_0.AddFriendsPage
        });
        v44.fireSearchbarPressedEvent();
    end, {
        v46, 
        v44.fireSearchbarPressedEvent
    });
    local v73 = v58.LuaApps.FriendsLanding.AddFriendsPage.PagePaddingTop or 0;
    local l_SafeAreaMargin_0 = v58.LuaApps.App.Page.SafeAreaMargin;
    local v75 = if not (l_SafeAreaMargin_0.X > 0) or l_FFlagEnableLeftNavOnConsole_0 then l_getPageMargin_0(v45.X) else l_SafeAreaMargin_0.X;
    local v76 = v44.friendRecommendations and #v44.friendRecommendations or 0;
    local v77 = v71 > 0;
    local v78 = v76 > 0;
    local v79 = not (v77 or v78);
    local v80 = v1.useMemo(function() --[[ Line: 185 ]]
        -- upvalues: v1 (ref), v21 (ref)
        return v1.createElement(v21, {
            layoutOrder = 4
        });
    end, {});
    local v81 = if v52 then -2 * l_Size_600_0 else -l_Size_600_0;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        v81 = v81 + l_useSignalState_0(v17.GetDisplayStore().getDeviceSafePadding).bottom;
    end;
    local v82 = v2.createFragment({
        pagePadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v73)
        }), 
        page = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v58.LuaApps.App.Page.BackgroundColor, 
            BackgroundTransparency = v58.LuaApps.App.Page.BackgroundTransparency, 
            ref = v57
        }, {
            contentFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                ScrollView = v1.createElement(l_RefreshScrollingFrame_0, {
                    ScrollingElement = l_VerticalScrollViewWithMargin_0, 
                    scrollingElementProps = {
                        size = UDim2.new(1, 0, 1, v81), 
                        useAutomaticCanvasSize = v78 or v77, 
                        canvasSizeY = UDim.new(1, 1), 
                        paddingHorizontal = v75, 
                        Selectable = l_FFlagAddFriendsUserListEnabled_0 and true or false, 
                        onSelectionChanged = v61, 
                        CanvasPosition = v60, 
                        ScrollingEnabled = v49
                    }, 
                    refresh = v44.refreshPage, 
                    usesBuilderIcon = true
                }, {
                    UISizeConstraint = if l_FFlagAddFriendsUserListEnabled_0 then v1.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(640, 1e999)
                    }) else nil, 
                    layout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v58.Global.Space_150)
                    }), 
                    UIPadding = v1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8)
                    }), 
                    TrustedContactsEducationBanner = v1.createElement(v23, {
                        maxWidth = 640, 
                        layoutOrder = 1
                    }), 
                    ConnectionChannelsSection = v1.createElement(v24, {
                        layoutOrder = 2, 
                        navigateToLuaAppPages = v44.navigateToLuaAppPages
                    }), 
                    requestSection = if v77 then v1.createElement(v25, {
                        renderAddFriendsTile = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v69, 
                        initialRequestsRows = v44.initialRequestsRows, 
                        requestsPageSize = v44.requestsPageSize, 
                        handleLoadMoreRequests = v44.handleLoadMoreRequests, 
                        friendRequests = v44.friendRequests, 
                        LayoutOrder = 4
                    }) else nil, 
                    inbetweenUserGridsPadding = if v77 then v1.createElement("Frame", {
                        Size = UDim2.fromOffset(0, v58.Global.Space_200), 
                        LayoutOrder = 5, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }) else nil, 
                    recommendationSection = if v78 then v1.createElement(v26, {
                        renderAddFriendsTile = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v69, 
                        friendRecommendations = v44.friendRecommendations, 
                        LayoutOrder = 6
                    }) else nil, 
                    emptyView = if v79 then v80 else nil, 
                    BottomWhitespace = if not v49 and v77 then v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 3000), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1000
                    }) else nil
                })
            })
        })
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v58.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v58.LuaApps.App.Page.BackgroundTransparency, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        AddFriendsPageHeader = if v53 then v2.createElement(v22, {
            topBarHeight = l_Size_600_0
        }) else nil, 
        SearchbarButton = if v52 then v1.createElement(l_UserSearchBarButton_0, {
            onActivated = v72
        }) else nil; 
        v82
    });
end;