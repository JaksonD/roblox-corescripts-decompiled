local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v10 = require(l_Parent_0.AppCommonLib);
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local v12 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v12.CollectionGrid;
local l_useCollectionImpressionsSignal_0 = v12.useCollectionImpressionsSignal;
local v15 = require(l_Parent_0.UIBlox);
local l_useSelectionCursor_0 = v15.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v15.App.SelectionImage.CursorKind;
local l_Button_0 = v15.App.Button.Button;
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local l_Parent_1 = script.Parent.Parent;
local v21 = require(l_Parent_1.AddFriendsTile);
local v22 = require(l_Parent_1.AddFriendsSectionHeaderFrame);
local v23 = require(l_Parent_1.IgnoreAllFriendsRequestsMenu);
local v24 = require(l_Parent_1.IgnoreAllFriendsRequestsMenu.useControlIgnoreAllMenu);
local v25 = require(l_Parent_1.FriendingOSAEducationSubtitle);
local l_AddFriendsSelector_0 = require(l_Parent_0.AddFriendsState).AddFriendsSelector;
local v27 = require(l_Parent_1.SectionsUtils.useUserTileCollectionGridItemMetricsProps);
local v28 = require(l_Parent_1.SectionsUtils.useShowMore);
local v29 = require(l_script_FirstAncestor_0.Analytics);
local l_useFireUserTileImpressionEvent_0 = v29.useFireUserTileImpressionEvent;
local l_Namespaces_0 = v29.Namespaces;
local v32 = require(l_Parent_0.UserList);
local l_UserListLayoutAdaptor_0 = v32.UserListLayoutAdaptor;
local l_LayoutMode_0 = v32.Enums.LayoutMode;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v36 = require(l_Parent_1.FriendingOSAEducationSubtitle.useFriendingOSAEducationSubtitle);
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v41) --[[ Line: 80 ]] --[[ Name: FriendRequestsSection ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), v27 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v28 (copy), v2 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v21 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v10 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useFireUserTileImpressionEvent_0 (copy), l_Namespaces_0 (copy), v24 (copy), v36 (copy), l_useTokens_0 (copy), v23 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy), v22 (copy), v25 (copy), l_CollectionGrid_0 (copy), v7 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_renderAddFriendsTile_0 = v41.renderAddFriendsTile;
    local l_friendRequests_0 = v41.friendRequests;
    local l_handleLoadMoreRequests_0 = v41.handleLoadMoreRequests;
    local l_initialRequestsRows_0 = v41.initialRequestsRows;
    local l_requestsPageSize_0 = v41.requestsPageSize;
    local v47 = l_useDesignTokens_0();
    local v48 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v49 = l_useLocalization_0({
        friendRequestsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Label.FriendRequests" or "Feature.AddFriends.Label.ConnectionRequests", 
        showMoreButtonText = "Feature.Avatar.Action.ShowMore"
    });
    local v51 = l_useSelector_0(function(v50) --[[ Line: 98 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v50, "Friends.requests.receivedCount");
    end);
    local v52, v53 = v27();
    local v54 = l_FFlagAddFriendsUserListEnabled_0 and 1 or v52.numColumns;
    local v55, v56, v57 = v28(l_initialRequestsRows_0, l_requestsPageSize_0, v54, l_handleLoadMoreRequests_0);
    local v61 = v2.useCallback(function(v58, v59) --[[ Line: 109 ]]
        -- upvalues: l_FFlagAddFriendsRenderTileRefactor_0 (ref), v2 (ref), v21 (ref), v53 (copy), v52 (copy), v57 (copy), l_renderAddFriendsTile_0 (copy)
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v60 = tostring(v59) .. " ";
            return v2.createElement(v21, {
                layoutOrder = v59, 
                position = v59, 
                user = v58, 
                size = Vector2.new(v53.itemWidth, v52.getItemHeight(v53.itemWidth)), 
                isFriendRequest = true, 
                selected = v59 == v57, 
                impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
            }), v60;
        else
            return l_renderAddFriendsTile_0(v58, v53.itemWidth, v52.getItemHeight(v53.itemWidth), v59, v57, "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"), tostring(v59) .. " ";
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v53, 
        v52, 
        v57
    } else l_dependencyArray_0(v53, v52, v57));
    local v65 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useCallback(function(v62, v63, v64) --[[ Line: 148 ]]
        -- upvalues: v2 (ref), v21 (ref), v57 (copy)
        return v2.createElement(v21, {
            isFriendRequest = true, 
            user = v63, 
            createRow = v62, 
            position = v64, 
            selected = v64 == v57, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
        });
    end, {
        v57
    }) else nil;
    local v66 = v51 > 0;
    local v67 = v66 and (" (%*)"):format(v51) or "";
    local v68 = v56 * v54 < v51;
    local v69 = v47.LuaApps.FriendsLanding.ShowMore.ButtonWidth or 640;
    local v70 = v47.LuaApps.FriendsLanding.ShowMore.ButtonHeight or 50;
    local v71 = v2.useRef(nil);
    local v72 = v2.useRef(v10.Signal.new());
    local v73 = l_useCollectionImpressionsSignal_0(v72.current);
    local v74 = nil;
    local v75 = l_useFireUserTileImpressionEvent_0(l_friendRequests_0, if l_FFlagAddFriendsUserListEnabled_0 then v54 else v53.itemsPerRow, l_Namespaces_0.FriendRequests);
    local v76 = v2.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v72 (copy)
        v72.current:fire();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72
    } else l_dependencyArray_0(v72));
    local v77 = v24();
    local v78 = if l_FFlagAddFriendsUserListEnabled_0 then v36() else nil;
    local v79 = if l_FFlagAddFriendsUserListEnabled_0 then l_useTokens_0() else nil;
    local v80 = if l_FFlagAddFriendsUserListEnabled_0 then v79.Typography.LabelLarge.FontSize + v79.Padding.Large else nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v48, 
        LayoutOrder = v41.LayoutOrder, 
        ref = v71, 
        [v2.Change.AbsolutePosition] = v76
    }, if l_FFlagAddFriendsUserListEnabled_0 then {
        IgnoreAllMenu = v2.createElement(v23, {
            open = v77.isMenuOpen, 
            closeMenu = v77.closeMenu, 
            openPositionY = UDim.new(0, v80)
        }), 
        UserListLayoutAdaptor = v2.createElement(l_UserListLayoutAdaptor_0, {
            layoutMode = l_LayoutMode_0.Vertical, 
            entities = l_friendRequests_0, 
            isScrollEnabled = false, 
            initialRowCount = v56, 
            hasMore = v68, 
            onLoadMore = v55, 
            renderRow = v65, 
            header = {
                title = v49.friendRequestsText .. v67, 
                subtitle = v78, 
                trailingIcon = if v66 then v77.menuIcon else nil, 
                onTrailingIconActivated = v77.onIconClick
            }
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v71, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v75, 
            scrollViewPositionChangedSignal = v73
        })
    } else {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        HeaderFrame = v66 and v2.createElement(v22, {
            layoutOrder = 1, 
            title = v49.friendRequestsText .. v67, 
            icon = v77.menuIcon, 
            iconVisible = v66, 
            onIconActivated = v77.onIconClick
        }), 
        IgnoreAllMenu = v2.createElement(v23, {
            open = v77.isMenuOpen, 
            closeMenu = v77.closeMenu
        }), 
        FriendingOSAEducationSubtitle = v2.createElement(v25, {
            layoutOrder = 3
        }), 
        FriendRequestsCollectionGrid = v2.createElement(l_CollectionGrid_0, v7.Dictionary.join(v52, {
            items = l_friendRequests_0, 
            renderItem = v61, 
            maxNumRows = v56, 
            LayoutOrder = 4, 
            onViewableItemsChanged = v74
        })), 
        ShowMoreButtonFrame = v68 and v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 5
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 2), 
                PaddingRight = UDim.new(0, 2), 
                PaddingTop = UDim.new(0, 10)
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v69, 1e999)
            }), 
            ShowMoreButton = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v70), 
                onActivated = v55, 
                text = v49.showMoreButtonText
            })
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v71, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v75, 
            scrollViewPositionChangedSignal = v73
        })
    });
end;