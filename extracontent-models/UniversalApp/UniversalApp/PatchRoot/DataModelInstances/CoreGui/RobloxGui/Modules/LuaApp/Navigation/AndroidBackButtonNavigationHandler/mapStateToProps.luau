local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
return function(v3, _) --[[ Line: 6 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v5 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v3) else v3.Navigation.history;
    return {
        canGoBackInAppRoute = #v5[#v5] > 1
    };
end;