local v0 = require(script.Parent.SocialTabLoader);
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_compose_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local v6 = require(script.Parent.mapStateToProps);
local v7 = require(script.Parent.mapDispatchToProps);
return l_compose_0(v3.connect(v6, v7), l_RoactAppPolicy_0.connect(function(v8, _) --[[ Line: 20 ]]
    return {
        showUserAlias = v8.getShowAlias()
    };
end))(function(v10) --[[ Line: 14 ]] --[[ Name: Container ]]
    -- upvalues: v2 (copy), v0 (copy)
    return v2.createElement(v0, v10);
end);