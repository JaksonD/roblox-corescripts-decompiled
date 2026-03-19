local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v6.FFlagAXCatalogCategoriesStore;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = {
    categoryId = if v6.FFlagAXDefaultCatalogCategoryId then v10.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue(), 
    subcategoryId = nil
};
return v3.createReducer(v11, {
    [v8.name] = function(v12, v13) --[[ Line: 36 ]]
        -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v5 (copy), v4 (copy)
        if l_FFlagAXCatalogCategoriesStore_0 then
            v5("SetSearchCategoryAndSubcategory is not supported with FFlagAXCatalogCategoriesStore");
            return v12;
        else
            return v4.Dictionary.join(v12, {
                categoryId = v13.category or v12.categoryId, 
                subcategoryId = v13.subcategory
            });
        end;
    end
});