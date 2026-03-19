local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local v7 = require(l_Parent_0.AppCommonLib);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local v10 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v10.CollectionGrid;
local l_useCollectionImpressionsSignal_0 = v10.useCollectionImpressionsSignal;
local l_Parent_1 = script.Parent.Parent;
local v14 = require(l_Parent_1.AddFriendsTile);
local v15 = require(l_Parent_1.AddFriendsSectionHeaderFrame);
local v16 = require(l_Parent_1.SectionsUtils.useUserTileCollectionGridItemMetricsProps);
local v17 = require(l_script_FirstAncestor_0.Analytics);
local l_useFireUserTileImpressionEvent_0 = v17.useFireUserTileImpressionEvent;
local l_Namespaces_0 = v17.Namespaces;
local v20 = require(l_Parent_0.UserList);
local l_UserListLayoutAdaptor_0 = v20.UserListLayoutAdaptor;
local l_ContactsContext_0 = v20.ContactsContext;
local l_EntityType_0 = v20.Enums.EntityType;
local l_LayoutMode_0 = v20.Enums.LayoutMode;
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
return function(v27) --[[ Line: 56 ]] --[[ Name: FriendRecommendationsSection ]]
    -- upvalues: l_useLocalization_0 (copy), v16 (copy), v2 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v14 (copy), l_dependencyArray_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v15 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useFireUserTileImpressionEvent_0 (copy), l_Namespaces_0 (copy), v5 (copy), l_EntityType_0 (copy), l_ContactsContext_0 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_CollectionGrid_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy)
    local l_renderAddFriendsTile_0 = v27.renderAddFriendsTile;
    local l_friendRecommendations_0 = v27.friendRecommendations;
    local v30 = l_useLocalization_0({
        peopleYouMayKnow = "Feature.Friends.Label.PYMK"
    });
    local v31, v32 = v16();
    local v36 = v2.useCallback(function(v33, v34) --[[ Line: 66 ]]
        -- upvalues: l_FFlagAddFriendsRenderTileRefactor_0 (ref), v2 (ref), v14 (ref), v32 (copy), v31 (copy), l_renderAddFriendsTile_0 (copy)
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v35 = tostring(v34) .. " ";
            return v2.createElement(v14, {
                layoutOrder = v34, 
                position = v34, 
                user = v33, 
                size = Vector2.new(v32.itemWidth, v31.getItemHeight(v32.itemWidth)), 
                impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS", 
                isRecommendation = true
            }), v35;
        else
            return l_renderAddFriendsTile_0(v33, v32.itemWidth, v31.getItemHeight(v32.itemWidth), v34, nil, "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS"), tostring(v34) .. " ";
        end;
    end, l_dependencyArray_0(v32.itemWidth, v31.getItemHeight, l_renderAddFriendsTile_0));
    local v40 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useCallback(function(v37, v38, v39) --[[ Line: 100 ]]
        -- upvalues: v2 (ref), v14 (ref)
        return v2.createElement(v14, {
            isRecommendation = true, 
            user = v38, 
            createRow = v37, 
            position = v39, 
            impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS"
        });
    end, {}) else nil;
    local v41 = v2.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v2 (ref), v15 (ref), v30 (copy)
        return v2.createElement(v15, {
            layoutOrder = 1, 
            title = v30.peopleYouMayKnow, 
            iconVisible = false
        });
    end, l_dependencyArray_0(v30.peopleYouMayKnow));
    local v42 = v2.useRef(nil);
    local v43 = v2.useRef(v7.Signal.new());
    local v44 = l_useCollectionImpressionsSignal_0(v43.current);
    local v45 = nil;
    local v46 = l_useFireUserTileImpressionEvent_0(l_friendRecommendations_0, l_FFlagAddFriendsUserListEnabled_0 and 1 or v32.itemsPerRow, l_Namespaces_0.PYMK);
    local v47 = v2.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v43 (copy)
        v43.current:fire();
    end, l_dependencyArray_0(v43));
    local v50 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useMemo(function() --[[ Line: 134 ]]
        -- upvalues: v5 (ref), l_friendRecommendations_0 (copy), l_EntityType_0 (ref)
        return {
            contacts = v5.List.foldLeft(l_friendRecommendations_0, function(v48, v49) --[[ Line: 135 ]]
                -- upvalues: l_EntityType_0 (ref)
                if v49.type == l_EntityType_0.Contact then
                    v48[v49.id] = {
                        name = v49.entityDisplayName or "", 
                        avatarThumbnailUrl = v49.thumbnailEntities and v49.thumbnailEntities.headshotImageUrl or ""
                    };
                end;
                return v48;
            end, {})
        };
    end, {
        l_friendRecommendations_0
    }) else nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v27.LayoutOrder, 
        ref = v42, 
        [v2.Change.AbsolutePosition] = v47
    }, {
        UserListWithContacts = if l_FFlagAddFriendsUserListEnabled_0 then v2.createElement(l_ContactsContext_0.Provider, {
            value = v50
        }, {
            UserListLayoutAdaptor = v2.createElement(l_UserListLayoutAdaptor_0, {
                layoutOrder = v27.LayoutOrder, 
                layoutMode = l_LayoutMode_0.Vertical, 
                header = {
                    title = v30.peopleYouMayKnow
                }, 
                entities = l_friendRecommendations_0, 
                isScrollEnabled = false, 
                renderRow = v40
            })
        }) else nil, 
        FriendRecommendationsCollectionsGrid = if l_FFlagAddFriendsUserListEnabled_0 then nil else v2.createElement(l_CollectionGrid_0, v5.Dictionary.join(v31, {
            items = l_friendRecommendations_0, 
            renderItem = v36, 
            title = v41, 
            onViewableItemsChanged = v45
        })), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v42, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS", 
            sendImpressions = v46, 
            scrollViewPositionChangedSignal = v44
        })
    });
end;