local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_FFlagAXCatalogCategoriesStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStore;
return v1.makeActionCreator("CatalogSearch-" .. script.Name, function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), l_mutedError_0 (copy), v2 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        l_mutedError_0("SetSearchCategoryAndSubcategory should not be used with FFlagAXCatalogCategoriesStore");
    end;
    v2.isTypeOrNil(v5, "string", "SetSearchCategoryAndSubCategory thunk expects category");
    v2.isTypeOrNil(v6, "string", "SetSearchCategoryAndSubCategory thunk expects subcategory");
    return {
        category = v5, 
        subcategory = v6
    };
end);