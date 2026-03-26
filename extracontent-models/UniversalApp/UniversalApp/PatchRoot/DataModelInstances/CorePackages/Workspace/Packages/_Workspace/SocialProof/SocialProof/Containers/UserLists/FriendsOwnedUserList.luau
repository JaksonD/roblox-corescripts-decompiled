local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks.useEntityConnectionsPagination);
local l_UserListViewAdaptor_0 = require(l_Parent_0.UserList).Components.UserListViewAdaptor;
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v13 = {
    position = UDim2.fromScale(0.6, 0), 
    size = UDim2.fromScale(0.4, 1), 
    anchorPoint = Vector2.new(0, 0)
};
local v14 = {
    position = UDim2.fromScale(0.5, 0), 
    size = UDim2.new(0, 640, 1, 0), 
    anchorPoint = Vector2.new(0.5, 0)
};
return function(_) --[[ Line: 33 ]] --[[ Name: FriendsOwnedUserList ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigationProps_0 (copy), v3 (copy), v5 (copy), v2 (copy), v14 (copy), v13 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v11 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_UserListViewAdaptor_0 (copy)
    local v16 = l_useDispatch_0();
    local v19 = l_useNavigationProps_0(function(_, v18) --[[ Line: 35 ]]
        return {
            entityId = v18.entityId, 
            entityType = v18.entityType, 
            source = v18.source
        };
    end);
    local v20 = v3({
        entityId = v19.entityId, 
        entityType = v19.entityType, 
        connectionType = v5.ConnectionType.Friend, 
        initialCursor = nil
    });
    local v21 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v19 (copy), v14 (ref), v13 (ref)
        if v19.source == "profile" then
            return v14;
        else
            return v13;
        end;
    end, {
        v19.source
    });
    local v22 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy)
        if v20.hasMore and not v20.isLoading then
            v20.fetchPage();
        end;
    end, {
        v20.hasMore, 
        v20.isLoading, 
        v20.fetchPage
    });
    local v24 = v2.useCallback(function(v23) --[[ Line: 67 ]]
        -- upvalues: v16 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v11 (ref)
        v16(l_NavigateDown_0({
            name = l_AppPage_0.ProfilePlatform, 
            detail = v23, 
            extraProps = {
                profileType = v11.PROFILE_TYPE, 
                source = v11.ITEM_DETAILS_PAGE_SOURCE
            }
        }));
    end, {
        v16
    });
    local v25 = l_useLocalization_0({
        connectionsOwn = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendsOwn" or "Feature.Friends.Label.ConnectionsOwn"; 
            numberOfConnections = v20.totalConnections
        }, 
        singleConnectionOwns = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.FriendOwns" or "Feature.Friends.Label.ConnectionOwns"
    });
    local v26 = if v20.totalConnections == 1 then v25.singleConnectionOwns else v25.connectionsOwn;
    if v20.totalConnections == 0 then
        return nil;
    else
        return v2.createElement(l_UserListViewAdaptor_0, {
            users = v20.userIds, 
            title = v26, 
            totalCount = v20.totalConnections, 
            onLoadMore = v22, 
            onUserSelected = v24, 
            hasMore = v20.hasMore, 
            wideModePeekViewLayout = v21
        });
    end;
end;