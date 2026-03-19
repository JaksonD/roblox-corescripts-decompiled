local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(script.Parent.ExternalNavigationHandler);
local v3 = require(script.Parent.mapStateToProps);
local v4 = require(script.Parent.mapDispatchToProps);
return v1.connect(v3, v4)(v2);