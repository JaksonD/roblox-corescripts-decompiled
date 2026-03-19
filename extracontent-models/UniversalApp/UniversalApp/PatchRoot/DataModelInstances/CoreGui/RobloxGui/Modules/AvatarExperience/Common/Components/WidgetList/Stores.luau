local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Signals);
local v2 = require(script.createFetchMarketplaceStore);
return {
    getFetchMarketplaceStore = v1.createComputed(v2)
};