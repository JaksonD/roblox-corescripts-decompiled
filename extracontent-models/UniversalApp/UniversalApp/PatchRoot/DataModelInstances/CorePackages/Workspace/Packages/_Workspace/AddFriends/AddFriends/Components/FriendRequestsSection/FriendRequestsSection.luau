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
return function(v40) --[[ Line: 78 ]] --[[ Name: FriendRequestsSection ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), v27 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v28 (copy), v2 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v21 (copy), l_dependencyArray_0 (copy), v10 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useFireUserTileImpressionEvent_0 (copy), l_Namespaces_0 (copy), v24 (copy), v36 (copy), l_useTokens_0 (copy), v23 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy), v22 (copy), v25 (copy), l_CollectionGrid_0 (copy), v7 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_renderAddFriendsTile_0 = v40.renderAddFriendsTile;
    local l_friendRequests_0 = v40.friendRequests;
    local l_handleLoadMoreRequests_0 = v40.handleLoadMoreRequests;
    local l_initialRequestsRows_0 = v40.initialRequestsRows;
    local l_requestsPageSize_0 = v40.requestsPageSize;
    local v46 = l_useDesignTokens_0();
    local v47 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v48 = l_useLocalization_0({
        friendRequestsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Label.FriendRequests" or "Feature.AddFriends.Label.ConnectionRequests", 
        showMoreButtonText = "Feature.Avatar.Action.ShowMore"
    });
    local v50 = l_useSelector_0(function(v49) --[[ Line: 96 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v49, "Friends.requests.receivedCount");
    end);
    local v51, v52 = v27();
    local v53 = l_FFlagAddFriendsUserListEnabled_0 and 1 or v51.numColumns;
    local v54, v55, v56 = v28(l_initialRequestsRows_0, l_requestsPageSize_0, v53, l_handleLoadMoreRequests_0);
    local v60 = v2.useCallback(function(v57, v58) --[[ Line: 106 ]]
        -- upvalues: l_FFlagAddFriendsRenderTileRefactor_0 (ref), v2 (ref), v21 (ref), v52 (copy), v51 (copy), v56 (copy), l_renderAddFriendsTile_0 (copy)
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v59 = tostring(v58) .. " ";
            return v2.createElement(v21, {
                layoutOrder = v58, 
                position = v58, 
                user = v57, 
                size = Vector2.new(v52.itemWidth, v51.getItemHeight(v52.itemWidth)), 
                isFriendRequest = true, 
                selected = v58 == v56, 
                impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
            }), v59;
        else
            return l_renderAddFriendsTile_0(v57, v52.itemWidth, v51.getItemHeight(v52.itemWidth), v58, v56, "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"), tostring(v58) .. " ";
        end;
    end, l_dependencyArray_0(v52, v51, v56));
    local v64 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useCallback(function(v61, v62, v63) --[[ Line: 141 ]]
        -- upvalues: v2 (ref), v21 (ref), v56 (copy)
        return v2.createElement(v21, {
            isFriendRequest = true, 
            user = v62, 
            createRow = v61, 
            position = v63, 
            selected = v63 == v56, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS"
        });
    end, {
        v56
    }) else nil;
    local v65 = v50 > 0;
    local v66 = v65 and (" (%*)"):format(v50) or "";
    local v67 = v55 * v53 < v50;
    local v68 = v46.LuaApps.FriendsLanding.ShowMore.ButtonWidth or 640;
    local v69 = v46.LuaApps.FriendsLanding.ShowMore.ButtonHeight or 50;
    local v70 = v2.useRef(nil);
    local v71 = v2.useRef(v10.Signal.new());
    local v72 = l_useCollectionImpressionsSignal_0(v71.current);
    local v73 = nil;
    local v74 = l_useFireUserTileImpressionEvent_0(l_friendRequests_0, if l_FFlagAddFriendsUserListEnabled_0 then v53 else v52.itemsPerRow, l_Namespaces_0.FriendRequests);
    local v75 = v2.useCallback(function() --[[ Line: 174 ]]
        -- upvalues: v71 (copy)
        v71.current:fire();
    end, l_dependencyArray_0(v71));
    local v76 = v24();
    local v77 = if l_FFlagAddFriendsUserListEnabled_0 then v36() else nil;
    local v78 = if l_FFlagAddFriendsUserListEnabled_0 then l_useTokens_0() else nil;
    local v79 = if l_FFlagAddFriendsUserListEnabled_0 then v78.Typography.LabelLarge.FontSize + v78.Padding.Large else nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v47, 
        LayoutOrder = v40.LayoutOrder, 
        ref = v70, 
        [v2.Change.AbsolutePosition] = v75
    }, if l_FFlagAddFriendsUserListEnabled_0 then {
        IgnoreAllMenu = v2.createElement(v23, {
            open = v76.isMenuOpen, 
            closeMenu = v76.closeMenu, 
            openPositionY = UDim.new(0, v79)
        }), 
        UserListLayoutAdaptor = v2.createElement(l_UserListLayoutAdaptor_0, {
            layoutMode = l_LayoutMode_0.Vertical, 
            entities = l_friendRequests_0, 
            isScrollEnabled = false, 
            initialRowCount = v55, 
            hasMore = v67, 
            onLoadMore = v54, 
            renderRow = v64, 
            header = {
                title = v48.friendRequestsText .. v66, 
                subtitle = v77, 
                trailingIcon = if v65 then v76.menuIcon else nil, 
                onTrailingIconActivated = v76.onIconClick
            }
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v70, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v74, 
            scrollViewPositionChangedSignal = v72
        })
    } else {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        HeaderFrame = v65 and v2.createElement(v22, {
            layoutOrder = 1, 
            title = v48.friendRequestsText .. v66, 
            icon = v76.menuIcon, 
            iconVisible = v65, 
            onIconActivated = v76.onIconClick
        }), 
        IgnoreAllMenu = v2.createElement(v23, {
            open = v76.isMenuOpen, 
            closeMenu = v76.closeMenu
        }), 
        FriendingOSAEducationSubtitle = v2.createElement(v25, {
            layoutOrder = 3
        }), 
        FriendRequestsCollectionGrid = v2.createElement(l_CollectionGrid_0, v7.Dictionary.join(v51, {
            items = l_friendRequests_0, 
            renderItem = v60, 
            maxNumRows = v55, 
            LayoutOrder = 4, 
            onViewableItemsChanged = v73
        })), 
        ShowMoreButtonFrame = v67 and v2.createElement("Frame", {
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
                MaxSize = Vector2.new(v68, 1e999)
            }), 
            ShowMoreButton = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v69), 
                onActivated = v54, 
                text = v48.showMoreButtonText
            })
        }), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v70, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_REQUESTS_TILE_IMPRESSIONS", 
            sendImpressions = v74, 
            scrollViewPositionChangedSignal = v72
        })
    });
end;