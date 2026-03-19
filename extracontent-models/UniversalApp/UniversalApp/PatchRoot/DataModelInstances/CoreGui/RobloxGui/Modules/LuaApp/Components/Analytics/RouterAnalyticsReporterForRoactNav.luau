local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(script.Parent.RouterAnalyticsReporter);
return v2.connect(function(v4, _) --[[ Line: 18 ]]
    return {
        routeHistory = v4.Navigation.history
    };
end)(function(v6) --[[ Line: 8 ]] --[[ Name: RouterAnalyticsReporterForRoactNav ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_routeHistory_0 = v6.routeHistory;
    local v8 = l_routeHistory_0[#l_routeHistory_0];
    local l_name_0 = v8[#v8].name;
    return v1.createElement(v3, {
        currentPage = l_name_0
    });
end);