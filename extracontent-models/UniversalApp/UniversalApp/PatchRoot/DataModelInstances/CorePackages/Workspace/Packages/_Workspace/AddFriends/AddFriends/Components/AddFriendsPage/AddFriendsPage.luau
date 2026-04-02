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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v45) --[[ Line: 77 ]] --[[ Name: AddFriendsPage ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useLastInputMode_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), v1 (copy), v11 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v13 (copy), v8 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useDesignTokens_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v20 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), l_Sources_0 (copy), l_getPageMargin_0 (copy), v21 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v17 (copy), v2 (copy), l_RefreshScrollingFrame_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v22 (copy), l_UserSearchBarButton_0 (copy)
    local v46 = l_useScreenSize_0();
    local v47 = l_useNavigation_0();
    local v48 = l_useLastInputMode_0();
    local v49 = v48 == "Focus";
    local v50 = v48 == "Cursor";
    local v51 = l_useUiModeInfo_0();
    local v52 = v51 and v51.uiMode == l_UiMode_0.TenFoot;
    local v53 = not v52 or l_FFlagEnableLeftNavOnConsole_0;
    local v54 = not v52 or l_FFlagEnableLeftNavOnConsole_0;
    if l_FFlagCreateConnectionsHub_0 and v47.state.routeName == l_AppPage_0.CoHubAddConnections then
        v54 = false;
        v53 = false;
    end;
    local v56 = v1.useCallback(function(v55) --[[ Line: 101 ]]
        -- upvalues: v53 (ref), v47 (copy), l_AppPage_0 (ref), v11 (ref), v45 (copy)
        if not v53 then
            v55:cancel();
            v47.navigate(l_AppPage_0.SearchPage, {
                defaultSearchType = v11.SearchTypes.Players
            });
            return;
        else
            v55:cancel();
            v47.navigate(l_AppPage_0.UserSearch, {
                shouldShowUserSearchLandingPage = true
            });
            v45.fireSearchbarPressedEvent();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v47, 
        v45.fireSearchbarPressedEvent, 
        v45.navigateToLuaAppPages, 
        v53
    } else l_dependencyArray_0(v47, v45.fireSearchbarPressedEvent, v45.navigateToLuaAppPages, v53));
    local v57 = v13.onRelease(v56);
    local v58 = v8.useEventHandler(l_FocusNavigationEventNameEnum_0.Search, v57);
    local v59 = l_useDesignTokens_0();
    local l_ScrollAnimationConfig_0 = v59.LuaApps.App.Page.ScrollAnimationConfig;
    local v61, v62 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, 0, v59.Global.Space_600, l_ScrollAnimationConfig_0);
    if not v49 then
        v61 = nil;
    end;
    if not v49 then
        v62 = nil;
    end;
    local l_Size_600_0 = v59.Global.Size_600;
    local v70 = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v1.useCallback(function(v64, v65, v66, v67, v68, v69) --[[ Line: 146 ]]
        -- upvalues: v1 (ref), v20 (ref)
        return v1.createElement(v20, {
            layoutOrder = v67, 
            position = v67, 
            user = v64, 
            size = Vector2.new(v65, v66), 
            isFriendRequest = not v64.isRecommendation, 
            isRecommendation = v64.isRecommendation, 
            selected = v67 == v68, 
            impressionsTag = v69
        });
    end, {});
    local v72 = l_useSelector_0(function(v71) --[[ Line: 164 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v71, "Friends.requests.receivedCount");
    end);
    local v73 = v1.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v47 (copy), l_AppPage_0 (ref), l_Sources_0 (ref), v45 (copy)
        v47.navigate(l_AppPage_0.UserSearch, {
            shouldShowUserSearchLandingPage = true, 
            entryPoint = l_Sources_0.AddFriendsPage
        });
        v45.fireSearchbarPressedEvent();
    end, {
        v47, 
        v45.fireSearchbarPressedEvent
    });
    local v74 = v59.LuaApps.FriendsLanding.AddFriendsPage.PagePaddingTop or 0;
    local l_SafeAreaMargin_0 = v59.LuaApps.App.Page.SafeAreaMargin;
    local v76 = if not (l_SafeAreaMargin_0.X > 0) or l_FFlagEnableLeftNavOnConsole_0 then l_getPageMargin_0(v46.X) else l_SafeAreaMargin_0.X;
    local v77 = v45.friendRecommendations and #v45.friendRecommendations or 0;
    local v78 = v72 > 0;
    local v79 = v77 > 0;
    local v80 = not (v78 or v79);
    local v81 = v1.useMemo(function() --[[ Line: 194 ]]
        -- upvalues: v1 (ref), v21 (ref)
        return v1.createElement(v21, {
            layoutOrder = 4
        });
    end, {});
    local v82 = if v53 then -2 * l_Size_600_0 else -l_Size_600_0;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        v82 = v82 + l_useSignalState_0(v17.GetDisplayStore().getDeviceSafePadding).bottom;
    end;
    local v83 = v2.createFragment({
        pagePadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v74)
        }), 
        page = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v59.LuaApps.App.Page.BackgroundColor, 
            BackgroundTransparency = v59.LuaApps.App.Page.BackgroundTransparency, 
            ref = v58
        }, {
            contentFrame = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                ScrollView = v1.createElement(l_RefreshScrollingFrame_0, {
                    ScrollingElement = l_VerticalScrollViewWithMargin_0, 
                    scrollingElementProps = {
                        size = UDim2.new(1, 0, 1, v82), 
                        useAutomaticCanvasSize = v79 or v78, 
                        canvasSizeY = UDim.new(1, 1), 
                        paddingHorizontal = v76, 
                        Selectable = l_FFlagAddFriendsUserListEnabled_0 and true or false, 
                        onSelectionChanged = v62, 
                        CanvasPosition = v61, 
                        ScrollingEnabled = v50
                    }, 
                    refresh = v45.refreshPage, 
                    usesBuilderIcon = true
                }, {
                    UISizeConstraint = if l_FFlagAddFriendsUserListEnabled_0 then v1.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(640, 1e999)
                    }) else nil, 
                    layout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v59.Global.Space_150)
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
                        navigateToLuaAppPages = v45.navigateToLuaAppPages
                    }), 
                    requestSection = if v78 then v1.createElement(v25, {
                        renderAddFriendsTile = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v70, 
                        initialRequestsRows = v45.initialRequestsRows, 
                        requestsPageSize = v45.requestsPageSize, 
                        handleLoadMoreRequests = v45.handleLoadMoreRequests, 
                        friendRequests = v45.friendRequests, 
                        LayoutOrder = 4
                    }) else nil, 
                    inbetweenUserGridsPadding = if v78 then v1.createElement("Frame", {
                        Size = UDim2.fromOffset(0, v59.Global.Space_200), 
                        LayoutOrder = 5, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }) else nil, 
                    recommendationSection = if v79 then v1.createElement(v26, {
                        renderAddFriendsTile = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v70, 
                        friendRecommendations = v45.friendRecommendations, 
                        LayoutOrder = 6
                    }) else nil, 
                    emptyView = if v80 then v81 else nil, 
                    BottomWhitespace = if not v50 and v78 then v1.createElement("Frame", {
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
        BackgroundColor3 = v59.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v59.LuaApps.App.Page.BackgroundTransparency, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        AddFriendsPageHeader = if v54 then v2.createElement(v22, {
            topBarHeight = l_Size_600_0
        }) else nil, 
        SearchbarButton = if v53 then v1.createElement(l_UserSearchBarButton_0, {
            onActivated = v73
        }) else nil; 
        v83
    });
end;