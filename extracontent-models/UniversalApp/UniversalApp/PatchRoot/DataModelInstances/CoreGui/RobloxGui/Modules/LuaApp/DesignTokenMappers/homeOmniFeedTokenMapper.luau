local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local v6 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v9 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v9.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v9.FFlagAppIaHomeSubTab;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v13 = game:DefineFastInt("LuaAppSubTabTopPadding", 0);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v15, v16) --[[ Line: 32 ]] --[[ Name: makeHomeOmniFeedTokens ]]
    -- upvalues: l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v13 (copy), l_FFlagAppIaScrollAway_0 (copy), v6 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local l_Space_300_0 = v16.Global.Space_300;
    local l_Space_300_1 = v16.Global.Space_300;
    local l_Space_600_0 = v16.Global.Space_600;
    if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then
        if v13 > 0 then
            l_Space_300_1 = v13;
        end;
    elseif l_FFlagAppIaScrollAway_0 and v6.getScrollAwayEnabled() then
        l_Space_300_1 = v16.Global.Space_100;
    elseif l_FFlagLuaAppMoveProfileIntoTopBar_0 and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar()) then
        l_Space_300_1 = v16.Global.Space_150;
    end;
    local v20 = {
        layoutPadding = 26, 
        topMargin = 0, 
        bottomMargin = 26
    };
    local v21 = {
        dampingRatio = 1, 
        frequency = 3
    };
    if v15.uiMode == l_UiMode_0.TenFoot and not l_FFlagEnableLeftNavOnConsole_0 then
        l_Space_300_0 = v16.Global.Space_400;
        l_Space_300_1 = v16.Global.Space_300 + v16.Global.Space_200;
        l_Space_600_0 = v16.Global.Space_400;
        v20.layoutPadding = l_Space_300_0;
        v20.topMargin = l_Space_300_1;
        v20.bottomMargin = l_Space_600_0;
    end;
    return {
        getLayoutSpacing = function(v22) --[[ Line: 77 ]] --[[ Name: getLayoutSpacing ]]
            -- upvalues: v20 (copy), l_Space_300_0 (ref), l_Space_300_1 (ref), l_Space_600_0 (ref)
            if v22 then
                return v20;
            else
                return {
                    layoutPadding = l_Space_300_0, 
                    topMargin = l_Space_300_1, 
                    bottomMargin = l_Space_600_0
                };
            end;
        end, 
        trailingWhitespace = 1000, 
        animationConfig = v21, 
        scrollBarThickness = 0
    };
end;