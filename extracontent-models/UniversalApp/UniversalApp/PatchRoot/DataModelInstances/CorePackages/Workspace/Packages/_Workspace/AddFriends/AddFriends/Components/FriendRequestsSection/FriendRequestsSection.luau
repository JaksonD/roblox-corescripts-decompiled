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
return function(v39) --[[ Line: 77 ]] --[[ Name: FriendRequestsSection ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), v27 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v28 (copy), v2 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v21 (copy), l_dependencyArray_0 (copy), v10 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useFireUserTileImpressionEvent_0 (copy), l_Namespaces_0 (copy), v24 (copy), v36 (copy), l_useTokens_0 (copy), v23 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy), v22 (copy), v25 (copy), l_CollectionGrid_0 (copy), v7 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_renderAddFriendsTile_0 = v39.renderAddFriendsTile;
    local l_friendRequests_0 = v39.friendRequests;
    local l_handleLoadMoreRequests_0 = v39.handleLoadMoreRequests;
    local l_initialRequestsRows_0 = v39.initialRequestsRows;
    local l_requestsPageSize_0 = v39.requestsPageSize;
    local v45 = l_useDesignTokens_0();
    local v46 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v47 = l_useLocalization_0({
        friendRequestsText = "Feature.AddFriends.Label.ConnectionRequests", 
        showMoreButtonText = "Feature.Avatar.Action.ShowMore"
    });
    local v49 = l_useSelector_0(function(v48) --[[ Line: 93 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v48, "Friends.requests.receivedCount");
    end);
    local v50, v51 = v27();
    local v52 = l_FFlagAddFriendsUserListEnabled_0 and 1 or v50.numColumns;
    local v53, v54, v55 = v28(l_initialRequestsRows_0, l_requestsPageSize_0, v52, l_handleLoadMoreRequests_0);
    local v59 = v2.useCallback(function(v56, v57) --[[ Line: 103 ]]
        -- upvalues: l_FFlagAddFriendsRenderTileRefactor_0 (ref), v2 (ref), v21 (ref), v51 (copy), v50 (copy), v55 (copy), l_renderAddFriendsTile_0 (copy)
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v58 = tostring(v57) .. " ";
            return v2.createElement(v21, {
                layoutOrder = v57, 
                position = v57, 
                user = v56, 
                size = Vector2.new(v51.itemWidth, v50.getItemHeight(v51.itemWidth)), 
                isFriendRequest = true, 
                selected = v57 == v55, 
                impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
            }), v58;
        else
            return l_renderAddFriendsTile_0(v56, v51.itemWidth, v50.getItemHeight(v51.itemWidth), v57, v55, "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"), tostring(v57) .. " ";
        end;
    end, l_dependencyArray_0(v51, v50, v55));
    local v63 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useCallback(function(v60, v61, v62) --[[ Line: 138 ]]
        -- upvalues: v2 (ref), v21 (ref), v55 (copy)
        return v2.createElement(v21, {
            isFriendRequest = true, 
            user = v61, 
            createRow = v60, 
            position = v62, 
            selected = v62 == v55, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
        });
    end, {
        v55
    }) else nil;
    local v64 = v49 > 0;
    local v65 = v64 and (" (%*)"):format(v49) or "";
    local v66 = v54 * v52 < v49;
    local v67 = v45.LuaApps.FriendsLanding.ShowMore.ButtonWidth or 640;
    local v68 = v45.LuaApps.FriendsLanding.ShowMore.ButtonHeight or 50;
    local v69 = v2.useRef(nil);
    local v70 = v2.useRef(v10.Signal.new());
    local v71 = l_useCollectionImpressionsSignal_0(v70.current);
    local v72 = nil;
    local v73 = l_useFireUserTileImpressionEvent_0(l_friendRequests_0, if l_FFlagAddFriendsUserListEnabled_0 then v52 else v51.itemsPerRow, l_Namespaces_0.FriendRequests);
    local v74 = v2.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: v70 (copy)
        v70.current:fire();
    end, l_dependencyArray_0(v70));
    local v75 = v24();
    local v76 = if l_FFlagAddFriendsUserListEnabled_0 then v36() else nil;
    local v77 = if l_FFlagAddFriendsUserListEnabled_0 then l_useTokens_0() else nil;
    local v78 = if l_FFlagAddFriendsUserListEnabled_0 then v77.Typography.LabelLarge.FontSize + v77.Padding.Large else nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v46, 
        LayoutOrder = v39.LayoutOrder, 
        ref = v69, 
        [v2.Change.AbsolutePosition] = v74
    }, if l_FFlagAddFriendsUserListEnabled_0 then {
        IgnoreAllMenu = v2.createElement(v23, {
            open = v75.isMenuOpen, 
            closeMenu = v75.closeMenu, 
            openPositionY = UDim.new(0, v78)
        }), 
        UserListLayoutAdaptor = v2.createElement(l_UserListLayoutAdaptor_0, {
            layoutMode = l_LayoutMode_0.Vertical, 
            entities = l_friendRequests_0, 
            isScrollEnabled = false, 
            initialRowCount = v54, 
            hasMore = v66, 
            onLoadMore = v53, 
            renderRow = v63, 
            header = {
                title = v47.friendRequestsText .. v65, 
                subtitle = v76, 
                trailingIcon = if v64 then v75.menuIcon else nil, 
                onTrailingIconActivated = v75.onIconClick
            }
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v69, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v73, 
            scrollViewPositionChangedSignal = v71
        })
    } else {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        HeaderFrame = v64 and v2.createElement(v22, {
            layoutOrder = 1, 
            title = v47.friendRequestsText .. v65, 
            icon = v75.menuIcon, 
            iconVisible = v64, 
            onIconActivated = v75.onIconClick
        }), 
        IgnoreAllMenu = v2.createElement(v23, {
            open = v75.isMenuOpen, 
            closeMenu = v75.closeMenu
        }), 
        FriendingOSAEducationSubtitle = v2.createElement(v25, {
            layoutOrder = 3
        }), 
        FriendRequestsCollectionGrid = v2.createElement(l_CollectionGrid_0, v7.Dictionary.join(v50, {
            items = l_friendRequests_0, 
            renderItem = v59, 
            maxNumRows = v54, 
            LayoutOrder = 4, 
            onViewableItemsChanged = v72
        })), 
        ShowMoreButtonFrame = v66 and v2.createElement("Frame", {
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
                MaxSize = Vector2.new(v67, 1e999)
            }), 
            ShowMoreButton = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v68), 
                onActivated = v53, 
                text = v47.showMoreButtonText
            })
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v69, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v73, 
            scrollViewPositionChangedSignal = v71
        })
    });
end;