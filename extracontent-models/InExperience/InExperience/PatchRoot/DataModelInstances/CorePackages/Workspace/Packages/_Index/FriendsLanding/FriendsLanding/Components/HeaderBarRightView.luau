local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local v6 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Components.AddFriendsIcon);
local l_memoize_0 = v2.memoize;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local function v19(v18) --[[ Line: 27 ]]
    -- upvalues: l_Roact_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    return l_Roact_0.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/common/search"], 
        layoutOrder = v18.layoutOrder, 
        onActivated = v18.goToSearchFriendsPage
    });
end;
local v20 = {
    SHOW_ADDFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true
    }, 
    SHOW_SEARCHFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true, 
        [v7.AddFriends] = true
    }
};
local v21 = l_Roact_0.PureComponent:extend("HeaderBarRightView");
v21.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil
};
v21.init = function(v22) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v13 (copy), v7 (copy), l_AppPage_0 (copy), l_Sources_0 (copy)
    v22.goToFriendRequestsPage = l_memoize_0(function(_, v24) --[[ Line: 57 ]]
        -- upvalues: v13 (ref), v22 (copy), v7 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 58 ]]
            -- upvalues: v24 (copy), v13 (ref), v22 (ref), v7 (ref), l_AppPage_0 (ref)
            local v25 = v24 == 0 and v13.AddFriendsNoFriends or v13.AddFriends;
            v22.props.analytics:buttonClick(v25);
            v22.props.analytics:navigate(v7.AddFriends);
            return v22.props.navigation.navigate(l_AppPage_0.AddFriendsPage);
        end;
    end);
    v22.goToSearchFriendsPage = l_memoize_0(function() --[[ Line: 68 ]]
        -- upvalues: v22 (copy), l_AppPage_0 (ref), l_Sources_0 (ref)
        return function() --[[ Line: 69 ]]
            -- upvalues: v22 (ref), l_AppPage_0 (ref), l_Sources_0 (ref)
            v22.props.navigation.navigate(l_AppPage_0.UserSearch, {
                shouldShowUserSearchLandingPage = true, 
                entryPoint = l_Sources_0.FriendsLanding
            });
        end;
    end);
end;
v21.render = function(v26) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v7 (copy), l_Roact_0 (copy), v19 (copy), v9 (copy), l_FFlagConnectionManagementChips_0 (copy)
    local l_navigation_0 = v26.props.navigation;
    local v28 = nil;
    local v29 = nil;
    if v26.props.addFriendsPageSearchbarEnabled then
        v20.SHOW_ADDFRIENDS_ICON[v7.SearchFriends] = false;
    end;
    if l_navigation_0 and l_navigation_0.state then
        local l_routeName_0 = l_navigation_0.state.routeName;
        v28 = v20.SHOW_SEARCHFRIENDS_ICON[l_routeName_0];
        v29 = v20.SHOW_ADDFRIENDS_ICON[l_routeName_0];
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 72, 0, 36)
    }, {
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SearchFriendsIcon = v28 and v19({
            goToSearchFriendsPage = v26.goToSearchFriendsPage(), 
            layoutOrder = 1
        }), 
        Padding = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        AddFriendsIcon = v29 and l_Roact_0.createElement(v9, {
            onActivated = v26.goToFriendRequestsPage(v26.props.navigateToLuaAppPages, v26.props.totalFriendCount), 
            layoutOrder = 3, 
            friendRequestCount = v26.props.friendRequestCount, 
            showTooltip = not l_FFlagConnectionManagementChips_0 and v26.props.totalFriendCount == 0
        })
    });
end;
return l_compose_0(v8.connect(function(v31) --[[ Line: 121 ]]
    return {
        analytics = v31
    };
end), v6.connect(function(v32, _) --[[ Line: 126 ]]
    return {
        navigateToLuaAppPages = v32.navigateToLuaAppPages, 
        friendRequestCount = v32.friendRequestCount, 
        totalFriendCount = v32.totalFriendCount, 
        luaAddFriendsPageEnabled = v32.luaAddFriendsPageEnabled, 
        addFriendsPageSearchbarEnabled = v32.addFriendsPageSearchbarEnabled
    };
end))(v21);