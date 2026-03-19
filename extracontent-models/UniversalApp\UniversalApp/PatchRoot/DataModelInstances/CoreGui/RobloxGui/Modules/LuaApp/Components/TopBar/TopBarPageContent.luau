local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withGridConfig_DEPRECATED_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v5 = require(script.Parent.TopBarContentFrame);
local v6 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local function v12(v8, _) --[[ Line: 37 ]] --[[ Name: TopBarPageContentWithProviders ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v6 (copy), v1 (copy), v5 (copy)
    local l_topBarHeight_0 = v8.topBarHeight;
    local v11 = table.clone(v8);
    v11.heightOffset = l_FFlagAppIaScrollAway_0 and v6.getScrollAwayEnabled() and 0 or l_topBarHeight_0;
    v11.topBarHeight = nil;
    return v1.createElement(v5, v11);
end;
return (v2.connect(function(v13, _) --[[ Line: 55 ]] --[[ Name: mapStateToProps ]]
    return {
        topBarHeight = v13.TopBar.topBarHeight
    };
end, nil)(function(v15) --[[ Line: 47 ]] --[[ Name: TopBarPageContent ]]
    -- upvalues: l_withGridConfig_DEPRECATED_0 (copy), l_LayoutConfig_0 (copy), v12 (copy)
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v16) --[[ Line: 50 ]]
        -- upvalues: v12 (ref), v15 (copy)
        return v12(v15, v16);
    end);
end));