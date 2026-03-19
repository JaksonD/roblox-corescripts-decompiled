local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(script.Parent.useCatalogItemCardViewModel);
local v6 = require(script.Parent.CatalogItemCard);
local v7 = require(l_CorePackages_0.Packages.tutils);
return (v1.memo(function(v8) --[[ Line: 60 ]]
    -- upvalues: v5 (copy), v1 (copy), v6 (copy)
    local v9 = v5(v8);
    return v1.createElement(v6, v9);
end, v7.deepEqual));