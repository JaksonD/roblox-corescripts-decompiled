local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStore;
return function(v8) --[[ Line: 18 ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v6 (copy), v4 (copy), v5 (copy)
    return function(v9) --[[ Line: 19 ]]
        -- upvalues: l_AvatarScreen_0 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v6 (ref), v4 (ref), v5 (ref), v8 (copy)
        local v10 = nil;
        local v11 = nil;
        local l_EntryPage_0 = v9:getState().AvatarExperience.LayeredClothingSort.EntryPage;
        if l_EntryPage_0 == l_AvatarScreen_0.AvatarEditor then
            v10 = v9:getState().AvatarExperience.AvatarEditor.Categories.category;
            v11 = "avatarEditor";
        elseif l_EntryPage_0 == l_AvatarScreen_0.Catalog or l_EntryPage_0 == l_AvatarScreen_0.CatalogSearch then
            v10 = if l_FFlagAXCatalogCategoriesStore_0 then v6.getCatalogSelectionStore().selectedCategoryId(false) else v9:getState().AvatarExperience.Catalog.Categories.categoryId;
            v11 = v4.AnalyticsContext.AvatarShop;
        else
            return;
        end;
        local v13 = v5.getUserId(v9:getState());
        local l_SelectedAccessory_0 = v9:getState().AvatarExperience.AccessoryAdjustment.SelectedAccessory;
        v8(v11, v13, v10, l_SelectedAccessory_0);
    end;
end;