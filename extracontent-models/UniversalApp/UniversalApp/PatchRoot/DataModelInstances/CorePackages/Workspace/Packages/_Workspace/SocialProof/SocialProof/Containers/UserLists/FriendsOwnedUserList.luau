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
local v12 = {
    position = UDim2.fromScale(0.6, 0), 
    size = UDim2.fromScale(0.4, 1), 
    anchorPoint = Vector2.new(0, 0)
};
local v13 = {
    position = UDim2.fromScale(0.5, 0), 
    size = UDim2.new(0, 640, 1, 0), 
    anchorPoint = Vector2.new(0.5, 0)
};
return function(_) --[[ Line: 32 ]] --[[ Name: FriendsOwnedUserList ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigationProps_0 (copy), v3 (copy), v5 (copy), v2 (copy), v13 (copy), v12 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v11 (copy), l_useLocalization_0 (copy), l_UserListViewAdaptor_0 (copy)
    local v15 = l_useDispatch_0();
    local v18 = l_useNavigationProps_0(function(_, v17) --[[ Line: 34 ]]
        return {
            entityId = v17.entityId, 
            entityType = v17.entityType, 
            source = v17.source
        };
    end);
    local v19 = v3({
        entityId = v18.entityId, 
        entityType = v18.entityType, 
        connectionType = v5.ConnectionType.Friend, 
        initialCursor = nil
    });
    local v20 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v18 (copy), v13 (ref), v12 (ref)
        if v18.source == "profile" then
            return v13;
        else
            return v12;
        end;
    end, {
        v18.source
    });
    local v21 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v19 (copy)
        if v19.hasMore and not v19.isLoading then
            v19.fetchPage();
        end;
    end, {
        v19.hasMore, 
        v19.isLoading, 
        v19.fetchPage
    });
    local v23 = v2.useCallback(function(v22) --[[ Line: 66 ]]
        -- upvalues: v15 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v11 (ref)
        v15(l_NavigateDown_0({
            name = l_AppPage_0.ProfilePlatform, 
            detail = v22, 
            extraProps = {
                profileType = v11.PROFILE_TYPE, 
                source = v11.ITEM_DETAILS_PAGE_SOURCE
            }
        }));
    end, {
        v15
    });
    local v24 = l_useLocalization_0({
        connectionsOwn = {
            "Feature.Friends.Label.ConnectionsOwn"; 
            numberOfConnections = v19.totalConnections
        }, 
        singleConnectionOwns = "Feature.Friends.Label.ConnectionOwns"
    });
    local v25 = if v19.totalConnections == 1 then v24.singleConnectionOwns else v24.connectionsOwn;
    if v19.totalConnections == 0 then
        return nil;
    else
        return v2.createElement(l_UserListViewAdaptor_0, {
            users = v19.userIds, 
            title = v25, 
            totalCount = v19.totalConnections, 
            onLoadMore = v21, 
            onUserSelected = v23, 
            hasMore = v19.hasMore, 
            wideModePeekViewLayout = v20
        });
    end;
end;