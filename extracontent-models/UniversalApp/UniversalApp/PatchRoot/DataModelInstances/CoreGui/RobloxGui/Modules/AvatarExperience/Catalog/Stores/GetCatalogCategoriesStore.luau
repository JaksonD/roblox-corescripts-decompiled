local v0 = require(script.createCatalogCategoriesStore);
local v1 = require(script.Parent.GetCategorySelectionStore.createCategorySelectionStore);
local v2 = require(script.useDoesCatalogCategoryExist);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXCatalogCategoriesSDUI_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesSDUI;
local v5 = v0();
local v6 = v1(v5);
local v7 = v1(v5);
return {
    getCatalogCategoriesStore = function() --[[ Line: 17 ]] --[[ Name: getCatalogCategoriesStore ]]
        -- upvalues: v5 (copy)
        return v5;
    end, 
    getCatalogSelectionStore = function() --[[ Line: 20 ]] --[[ Name: getCatalogSelectionStore ]]
        -- upvalues: v6 (copy)
        return v6;
    end, 
    getCatalogSearchSelectionStore = function() --[[ Line: 23 ]] --[[ Name: getCatalogSearchSelectionStore ]]
        -- upvalues: v7 (copy)
        return v7;
    end, 
    useDoesCatalogCategoryExist = if l_FFlagAXCatalogCategoriesSDUI_0 then v2 else nil
};