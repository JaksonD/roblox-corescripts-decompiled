local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(script.Parent.RouterAnalyticsReporter);
return v4.connect(function(v6, _) --[[ Line: 21 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        routeHistory = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v6) else v6.Navigation.history
    };
end)(function(v8) --[[ Line: 11 ]] --[[ Name: RouterAnalyticsReporterForRoactNav ]]
    -- upvalues: v3 (copy), v5 (copy)
    local l_routeHistory_0 = v8.routeHistory;
    local v10 = l_routeHistory_0[#l_routeHistory_0];
    local l_name_0 = v10[#v10].name;
    return v3.createElement(v5, {
        currentPage = l_name_0
    });
end);