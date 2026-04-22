local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v5 = require(l_script_FirstAncestor_0.Components.SocialTabsPage);
local v6 = require(script.Parent.SocialTabsPageRouter);
local v7 = v3.createRobloxSwitchNavigator(v6, {
    resetOnBlur = false, 
    keepVisitedScreensMounted = true, 
    backBehavior = v3.BackBehavior.None
});
local function v14(v8) --[[ Line: 21 ]] --[[ Name: SocialTabsPageNavigatorComponent ]]
    -- upvalues: l_useNavigationProps_0 (copy), v2 (copy), v7 (copy), v5 (copy)
    local l_navigation_0 = v8.navigation;
    local v12 = l_useNavigationProps_0(function(_, v11) --[[ Line: 24 ]]
        return {
            profileId = v11.profileId, 
            title = v11.title, 
            initialTabId = v11.initialTabId, 
            tabConfig = v11.tabConfig, 
            pageWidth = v11.pageWidth
        };
    end);
    local v13 = v2.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v2 (ref), v7 (ref), l_navigation_0 (copy)
        return v2.createElement(v7, {
            navigation = l_navigation_0
        });
    end, {
        l_navigation_0
    });
    return v2.createElement(v5, {
        renderNavigator = v13, 
        tabConfig = v12.tabConfig, 
        profileId = v12.profileId, 
        title = v12.title, 
        initialTabId = v12.initialTabId, 
        pageWidth = v12.pageWidth
    });
end;
local v15 = v2.PureComponent:extend("SocialTabsPageNavigatorClassWrapper");
v15.render = function(v16) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy)
    return v2.createElement(v14, v16.props);
end;
v15.router = v7.router;
return v15;