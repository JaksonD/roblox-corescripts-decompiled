local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactNetworking);
local l_compose_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local v6 = require(script.Parent.UserSearchTileUniversalWrapper);
return l_compose_0(l_RoactServices_0.connect({
    networking = v4
}))(function(v7) --[[ Line: 13 ]] --[[ Name: Container ]]
    -- upvalues: v2 (copy), v6 (copy)
    return v2.createElement(v6, v7);
end);