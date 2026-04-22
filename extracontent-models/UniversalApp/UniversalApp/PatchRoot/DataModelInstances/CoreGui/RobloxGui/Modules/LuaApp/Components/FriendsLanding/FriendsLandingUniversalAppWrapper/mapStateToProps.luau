local l_CorePackages_0 = game:GetService("CorePackages");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
return function(v4, _) --[[ Line: 6 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_FormFactor_0 (copy)
    local v6 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v4) else v4.Navigation.history[#v4.Navigation.history];
    return {
        currentAppPage = v6[#v6].name, 
        wideMode = v4.FormFactor == l_FormFactor_0.WIDE
    };
end;