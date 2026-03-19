local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
return require(l_CorePackages_0.Packages.React).createContext({
    fireAnalyticsEvent = v1.noop
});