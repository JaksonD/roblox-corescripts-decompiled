local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
return function(v3) --[[ Line: 5 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    if l_FFlagUseNavigationSelectors_0 then
        return l_Selectors_0.selectCurrentPageName(v3);
    else
        local l_history_0 = v3.Navigation.history;
        local v5 = l_history_0[#l_history_0];
        return v5[#v5].name;
    end;
end;