local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 8 ]] --[[ Name: useGetCurrentCategoryNames ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy), l_getUseSelectorDeepEquals_0 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v2.getCurrentCategoryNames(v5);
    end, l_getUseSelectorDeepEquals_0());
end;