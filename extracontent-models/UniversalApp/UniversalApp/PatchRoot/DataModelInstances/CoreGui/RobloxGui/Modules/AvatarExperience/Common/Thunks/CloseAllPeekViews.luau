local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local l_FFlagAXEditorSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters;
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    return v2(v6, {
        l_AvatarScreen_0.ItemDetails, 
        l_AvatarScreen_0.SortAndFilters, 
        v4.GameDetail, 
        v4.ProfilePlatform, 
        if l_FFlagAXEditorSubcategoryFilters_0 then l_AvatarScreen_0.SubcategoryFiltersDropdown else nil
    });
end;