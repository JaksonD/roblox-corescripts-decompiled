local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(script.Parent.useCatalogItemCardViewModel);
local v7 = require(script.Parent.CatalogItemCard);
local v8 = require(l_CorePackages_0.Packages.tutils);
return (v1.memo(function(v9) --[[ Line: 63 ]]
    -- upvalues: v6 (copy), v1 (copy), v7 (copy)
    local v10 = v6(v9);
    return v1.createElement(v7, v10);
end, v8.deepEqual));