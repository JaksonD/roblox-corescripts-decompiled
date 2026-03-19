local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_createCategoryInventoryStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Stores.createCategoryInventoryStore;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v5 = require(l_Modules_0.AvatarExperience.Photobooth.photoboothCategories);
local l_FFlagAXEditorSubcategoryFilters_0 = v3.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXPhotoboothFunctionality_0 = v3.FFlagAXPhotoboothFunctionality;
local l_FFlagAXPhotoboothIsStandalone_0 = v3.FFlagAXPhotoboothIsStandalone;
return function() --[[ Line: 22 ]] --[[ Name: createInventoryStoresFromCategories ]]
    -- upvalues: v4 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), l_createCategoryInventoryStore_0 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), l_FFlagAXPhotoboothFunctionality_0 (copy), v5 (copy)
    local v9 = {};
    for _, v11 in v4() do
        if v11.Subcategories then
            for _, v13 in v11.Subcategories do
                if not l_FFlagAXPhotoboothIsStandalone_0 or v13.NavigationKey then
                    v9[v13.NavigationKey] = l_createCategoryInventoryStore_0();
                    if l_FFlagAXEditorSubcategoryFilters_0 and v13.SubcategoryFilters then
                        for _, v15 in v13.SubcategoryFilters do
                            v9[v15.NavigationKey] = l_createCategoryInventoryStore_0();
                        end;
                    end;
                end;
            end;
        elseif not l_FFlagAXPhotoboothIsStandalone_0 or v11.NavigationKey then
            v9[v11.NavigationKey] = l_createCategoryInventoryStore_0();
        end;
    end;
    if l_FFlagAXPhotoboothFunctionality_0 then
        for _, v17 in v5 do
            v9[v17.NavigationKey] = l_createCategoryInventoryStore_0();
        end;
    end;
    return v9;
end;