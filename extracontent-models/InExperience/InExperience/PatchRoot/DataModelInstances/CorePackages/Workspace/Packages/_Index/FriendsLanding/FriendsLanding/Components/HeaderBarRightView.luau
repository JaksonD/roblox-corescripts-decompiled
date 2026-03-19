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
local function v18(v17) --[[ Line: 25 ]]
    -- upvalues: l_Roact_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    return l_Roact_0.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/common/search"], 
        layoutOrder = v17.layoutOrder, 
        onActivated = v17.goToSearchFriendsPage
    });
end;
local v19 = {
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
local v20 = l_Roact_0.PureComponent:extend("HeaderBarRightView");
v20.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil
};
v20.init = function(v21) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v13 (copy), v7 (copy), l_AppPage_0 (copy), l_Sources_0 (copy)
    v21.goToFriendRequestsPage = l_memoize_0(function(_, v23) --[[ Line: 55 ]]
        -- upvalues: v13 (ref), v21 (copy), v7 (ref), l_AppPage_0 (ref)
        return function() --[[ Line: 56 ]]
            -- upvalues: v23 (copy), v13 (ref), v21 (ref), v7 (ref), l_AppPage_0 (ref)
            local v24 = v23 == 0 and v13.AddFriendsNoFriends or v13.AddFriends;
            v21.props.analytics:buttonClick(v24);
            v21.props.analytics:navigate(v7.AddFriends);
            return v21.props.navigation.navigate(l_AppPage_0.AddFriendsPage);
        end;
    end);
    v21.goToSearchFriendsPage = l_memoize_0(function() --[[ Line: 66 ]]
        -- upvalues: v21 (copy), l_AppPage_0 (ref), l_Sources_0 (ref)
        return function() --[[ Line: 67 ]]
            -- upvalues: v21 (ref), l_AppPage_0 (ref), l_Sources_0 (ref)
            v21.props.navigation.navigate(l_AppPage_0.UserSearch, {
                shouldShowUserSearchLandingPage = true, 
                entryPoint = l_Sources_0.FriendsLanding
            });
        end;
    end);
end;
v20.render = function(v25) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v7 (copy), l_Roact_0 (copy), v18 (copy), v9 (copy)
    local l_navigation_0 = v25.props.navigation;
    local v27 = nil;
    local v28 = nil;
    if v25.props.addFriendsPageSearchbarEnabled then
        v19.SHOW_ADDFRIENDS_ICON[v7.SearchFriends] = false;
    end;
    if l_navigation_0 and l_navigation_0.state then
        local l_routeName_0 = l_navigation_0.state.routeName;
        v27 = v19.SHOW_SEARCHFRIENDS_ICON[l_routeName_0];
        v28 = v19.SHOW_ADDFRIENDS_ICON[l_routeName_0];
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
        SearchFriendsIcon = v27 and v18({
            goToSearchFriendsPage = v25.goToSearchFriendsPage(), 
            layoutOrder = 1
        }), 
        Padding = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        AddFriendsIcon = v28 and l_Roact_0.createElement(v9, {
            onActivated = v25.goToFriendRequestsPage(v25.props.navigateToLuaAppPages, v25.props.totalFriendCount), 
            layoutOrder = 3, 
            friendRequestCount = v25.props.friendRequestCount, 
            showTooltip = v25.props.totalFriendCount == 0
        })
    });
end;
return l_compose_0(v8.connect(function(v30) --[[ Line: 119 ]]
    return {
        analytics = v30
    };
end), v6.connect(function(v31, _) --[[ Line: 124 ]]
    return {
        navigateToLuaAppPages = v31.navigateToLuaAppPages, 
        friendRequestCount = v31.friendRequestCount, 
        totalFriendCount = v31.totalFriendCount, 
        luaAddFriendsPageEnabled = v31.luaAddFriendsPageEnabled, 
        addFriendsPageSearchbarEnabled = v31.addFriendsPageSearchbarEnabled
    };
end))(v20);