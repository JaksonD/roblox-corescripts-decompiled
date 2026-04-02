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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v28) --[[ Line: 58 ]] --[[ Name: FriendRecommendationsSection ]]
    -- upvalues: l_useLocalization_0 (copy), v16 (copy), v2 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v14 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v15 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useFireUserTileImpressionEvent_0 (copy), l_Namespaces_0 (copy), v5 (copy), l_EntityType_0 (copy), l_ContactsContext_0 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy), l_CollectionGrid_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_AppPage_0 (copy)
    local l_renderAddFriendsTile_0 = v28.renderAddFriendsTile;
    local l_friendRecommendations_0 = v28.friendRecommendations;
    local v31 = l_useLocalization_0({
        peopleYouMayKnow = "Feature.Friends.Label.PYMK"
    });
    local v32, v33 = v16();
    local v37 = v2.useCallback(function(v34, v35) --[[ Line: 69 ]]
        -- upvalues: l_FFlagAddFriendsRenderTileRefactor_0 (ref), v2 (ref), v14 (ref), v33 (copy), v32 (copy), l_renderAddFriendsTile_0 (copy)
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v36 = tostring(v35) .. " ";
            return v2.createElement(v14, {
                layoutOrder = v35, 
                position = v35, 
                user = v34, 
                size = Vector2.new(v33.itemWidth, v32.getItemHeight(v33.itemWidth)), 
                impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS", 
                isRecommendation = true
            }), v36;
        else
            return l_renderAddFriendsTile_0(v34, v33.itemWidth, v32.getItemHeight(v33.itemWidth), v35, nil, "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS"), tostring(v35) .. " ";
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.itemWidth, 
        v32.getItemHeight, 
        l_renderAddFriendsTile_0
    } else l_dependencyArray_0(v33.itemWidth, v32.getItemHeight, l_renderAddFriendsTile_0));
    local v41 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useCallback(function(v38, v39, v40) --[[ Line: 111 ]]
        -- upvalues: v2 (ref), v14 (ref)
        return v2.createElement(v14, {
            isRecommendation = true, 
            user = v39, 
            createRow = v38, 
            position = v40, 
            impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS"
        });
    end, {}) else nil;
    local v42 = v2.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v2 (ref), v15 (ref), v31 (copy)
        return v2.createElement(v15, {
            layoutOrder = 1, 
            title = v31.peopleYouMayKnow, 
            iconVisible = false
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31.peopleYouMayKnow
    } else l_dependencyArray_0(v31.peopleYouMayKnow));
    local v43 = v2.useRef(nil);
    local v44 = v2.useRef(v7.Signal.new());
    local v45 = l_useCollectionImpressionsSignal_0(v44.current);
    local v46 = nil;
    local v47 = l_useFireUserTileImpressionEvent_0(l_friendRecommendations_0, l_FFlagAddFriendsUserListEnabled_0 and 1 or v33.itemsPerRow, l_Namespaces_0.PYMK);
    local v48 = v2.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v44 (copy)
        v44.current:fire();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v44
    } else l_dependencyArray_0(v44));
    local v51 = if l_FFlagAddFriendsUserListEnabled_0 then v2.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v5 (ref), l_friendRecommendations_0 (copy), l_EntityType_0 (ref)
        return {
            contacts = v5.List.foldLeft(l_friendRecommendations_0, function(v49, v50) --[[ Line: 156 ]]
                -- upvalues: l_EntityType_0 (ref)
                if v50.type == l_EntityType_0.Contact then
                    v49[v50.id] = {
                        name = v50.entityDisplayName or "", 
                        avatarThumbnailUrl = v50.thumbnailEntities and v50.thumbnailEntities.headshotImageUrl or ""
                    };
                end;
                return v49;
            end, {})
        };
    end, {
        l_friendRecommendations_0
    }) else nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v28.LayoutOrder, 
        ref = v43, 
        [v2.Change.AbsolutePosition] = v48
    }, {
        UserListWithContacts = if l_FFlagAddFriendsUserListEnabled_0 then v2.createElement(l_ContactsContext_0.Provider, {
            value = v51
        }, {
            UserListLayoutAdaptor = v2.createElement(l_UserListLayoutAdaptor_0, {
                layoutOrder = v28.LayoutOrder, 
                layoutMode = l_LayoutMode_0.Vertical, 
                header = {
                    title = v31.peopleYouMayKnow
                }, 
                entities = l_friendRecommendations_0, 
                isScrollEnabled = false, 
                renderRow = v41
            })
        }) else nil, 
        FriendRecommendationsCollectionsGrid = if l_FFlagAddFriendsUserListEnabled_0 then nil else v2.createElement(l_CollectionGrid_0, v5.Dictionary.join(v32, {
            items = l_friendRecommendations_0, 
            renderItem = v37, 
            title = v42, 
            onViewableItemsChanged = v46
        })), 
        ScreenSizeImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v43, 
            pageContext = l_AppPage_0.AddFriendsPage, 
            impressionsTag = "ADDFRIENDSPAGE_RECOMMENDATIONS_TILE_IMPRESSIONS", 
            sendImpressions = v47, 
            scrollViewPositionChangedSignal = v45
        })
    });
end;