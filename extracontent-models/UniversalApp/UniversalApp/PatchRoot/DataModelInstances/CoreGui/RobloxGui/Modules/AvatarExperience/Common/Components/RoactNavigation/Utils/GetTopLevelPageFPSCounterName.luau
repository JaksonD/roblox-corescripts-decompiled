local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v4 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local l_TopLevelFPS_0 = v4.Counter.TopLevelFPS;
    local v9 = v5.isWithinViewContext(v7, l_AvatarScreen_0.CatalogSearch);
    return ({
        [l_AvatarScreen_0.Catalog] = l_TopLevelFPS_0.Catalog, 
        [l_AvatarScreen_0.CatalogSearch] = l_TopLevelFPS_0.Search, 
        [l_AvatarScreen_0.AvatarEditor] = l_TopLevelFPS_0.Editor, 
        [l_AvatarScreen_0.ItemDetails] = v9 and l_TopLevelFPS_0.SearchItemDetails or l_TopLevelFPS_0.CatalogItemDetails, 
        [l_AvatarScreen_0.SortAndFilters] = v9 and l_TopLevelFPS_0.SearchFilters or l_TopLevelFPS_0.CatalogFilters
    })[v6] or v4.Counter.TopLevelFPS.Unknown;
end;