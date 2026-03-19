local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.RoactRodux);
local v2 = require(script.Parent.ExternalNavigationHandler);
local v3 = require(script.Parent.mapStateToProps);
local v4 = require(script.Parent.mapDispatchToProps);
return v1.connect(v3, v4)(v2);