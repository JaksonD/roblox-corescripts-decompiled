local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v6.Enums.CatalogCategories;
local _ = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.ExternalNavigationRequest);
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v4.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v4.FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagAXDefaultCatalogCategoryId_0 = v4.FFlagAXDefaultCatalogCategoryId;
local v38 = {
    parseSortType = function(v23) --[[ Line: 49 ]]
        -- upvalues: v9 (copy)
        local v24 = tonumber(v23);
        for _, v26 in Enum.CatalogSortType:GetEnumItems() do
            if v26.Name:lower() == tostring(v23):lower() then
                return Enum.CatalogSortType[v26.Name].Name;
            elseif v24 and v26.Value == v24 then
                return Enum.CatalogSortType[v26.Name].Name;
            end;
        end;
        return v9.DefaultFilters.CatalogSort;
    end, 
    parseSortAggregation = function(v27) --[[ Line: 71 ]]
        -- upvalues: v9 (copy)
        local v28 = tonumber(v27);
        for _, v30 in Enum.CatalogSortAggregation:GetEnumItems() do
            local v31 = v30.Name:lower() == tostring(v27):lower();
            local v32 = v28 and v30.Value == v28;
            local v33 = true;
            if v30.Name ~= Enum.CatalogSortAggregation.AllTime.Name then
                v33 = true;
                if v30.Name ~= Enum.CatalogSortAggregation.PastWeek.Name then
                    v33 = v30.Name == Enum.CatalogSortAggregation.PastDay.Name;
                end;
            end;
            if (v31 or v32) and v33 then
                return Enum.CatalogSortAggregation[v30.Name].Name;
            end;
        end;
        return v9.DefaultFilters.CatalogSortAggregation;
    end, 
    parseSalesTypeFilter = function(v34) --[[ Line: 91 ]]
        -- upvalues: v9 (copy)
        local v35 = tonumber(v34);
        for _, v37 in Enum.SalesTypeFilter:GetEnumItems() do
            if v37.Name:lower() == tostring(v34):lower() then
                return Enum.SalesTypeFilter[v37.Name].Name;
            elseif v35 and v37.Value == v35 then
                return Enum.SalesTypeFilter[v37.Name].Name;
            end;
        end;
        return v9.DefaultFilters.SalesTypeFilter;
    end
};
v38.buildCatalogFilterFromDeepLinkParams = function(v39) --[[ Line: 106 ]]
    -- upvalues: v9 (copy), v38 (copy), v12 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
    local v40 = {
        minPrice = v9.DefaultFilters.PriceRange.minPrice, 
        maxPrice = v9.DefaultFilters.PriceRange.maxPrice
    };
    if v39.minPrice ~= nil then
        v40.minPrice = tonumber(v39.minPrice) or v9.DefaultFilters.PriceRange.minPrice;
    end;
    if v39.maxPrice ~= nil then
        v40.maxPrice = tonumber(v39.maxPrice) or v9.DefaultFilters.PriceRange.maxPrice;
    end;
    local v41 = v38.parseSalesTypeFilter(v39.salesTypeFilter);
    local v42 = v39.creatorName or "";
    local l_UnavailableItemFilter_0 = v9.DefaultFilters.UnavailableItemFilter;
    if v39.includeNotForSale then
        l_UnavailableItemFilter_0 = v12.Show;
    end;
    local v44 = v38.parseSortType(v39.sortType);
    local v45 = v38.parseSortAggregation(v39.sortAggregation);
    local v46 = tonumber(v39.category) or 1;
    local v47 = tonumber(v39.subcategory) or 0;
    local v48 = {};
    if v39.topics then
        for v49 in string.gmatch(v39.topics, "([^,]+)") do
            table.insert(v48, v49);
        end;
    end;
    return {
        creatorFilter = v42, 
        priceRange = v40, 
        salesTypeFilter = v41, 
        unavailableItemFilter = l_UnavailableItemFilter_0, 
        sortType = v44, 
        sortAggregation = v45, 
        category = v46, 
        subcategory = v47, 
        taxonomy = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v39.taxonomy else nil, 
        topics = v48, 
        wearTimeFilter = nil
    };
end;
local function _(v50) --[[ Line: 166 ]] --[[ Name: isCatalogScreen ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v51 = true;
    if v50 ~= l_AvatarScreen_0.Catalog then
        v51 = true;
        if v50 ~= l_AvatarScreen_0.CatalogSearch then
            v51 = v50 == l_AvatarScreen_0.ItemDetails;
        end;
    end;
    return v51;
end;
local function _(v53) --[[ Line: 170 ]] --[[ Name: isAvatarEditorScreen ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v54 = true;
    if v53 ~= l_AvatarScreen_0.AvatarEditor then
        v54 = v53 == l_AvatarScreen_0.OutfitDetails;
    end;
    return v54;
end;
v38.catalogDeepLinkExists = function(v56) --[[ Line: 175 ]] --[[ Name: catalogDeepLinkExists ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
    local l_screen_0 = v56.screen;
    local v58 = true;
    if l_screen_0 ~= l_AvatarScreen_0.Catalog then
        v58 = true;
        if l_screen_0 ~= l_AvatarScreen_0.CatalogSearch then
            v58 = l_screen_0 == l_AvatarScreen_0.ItemDetails;
        end;
    end;
    if not v58 then
        return false;
    else
        v58 = v56.params or {};
        l_screen_0 = true;
        if v58.creatorName == nil then
            l_screen_0 = true;
            if v58.minPrice == nil then
                l_screen_0 = true;
                if v58.maxPrice == nil then
                    l_screen_0 = true;
                    if v58.salesTypeFilter == nil then
                        l_screen_0 = true;
                        if v58.includeNotForSale == nil then
                            l_screen_0 = true;
                            if v58.sortType == nil then
                                l_screen_0 = true;
                                if v58.sortAggregation == nil then
                                    l_screen_0 = true;
                                    if v58.category == nil then
                                        l_screen_0 = true;
                                        if v58.subcategory == nil then
                                            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                                                return v58.taxonomy ~= nil;
                                            else
                                                l_screen_0 = false;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return l_screen_0;
    end;
end;
v38.catalogDeepLinkExists_deprecated = function(v59) --[[ Line: 192 ]] --[[ Name: catalogDeepLinkExists_deprecated ]]
    local v60 = true;
    if v59.creatorName == nil then
        v60 = true;
        if v59.minPrice == nil then
            v60 = true;
            if v59.maxPrice == nil then
                v60 = true;
                if v59.salesTypeFilter == nil then
                    v60 = true;
                    if v59.includeNotForSale == nil then
                        v60 = true;
                        if v59.sortType == nil then
                            v60 = true;
                            if v59.sortAggregation == nil then
                                v60 = true;
                                if v59.category == nil then
                                    v60 = v59.subcategory ~= nil;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v60;
end;
v38.avatarEditorDeepLinkExists = function(v61) --[[ Line: 205 ]] --[[ Name: avatarEditorDeepLinkExists ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    if not (v61.params and v61.params.opaquePage == l_AvatarScreen_0.AvatarEditor) then
        local l_screen_1 = v61.screen;
        local v63 = true;
        if l_screen_1 ~= l_AvatarScreen_0.AvatarEditor then
            v63 = l_screen_1 == l_AvatarScreen_0.OutfitDetails;
        end;
        if not v63 then
            return false;
        end;
    end;
    local v64 = v61.params or {};
    local v65 = true;
    if v64.category == nil then
        v65 = v64.subcategory ~= nil;
    end;
    return v65;
end;
v38.newValidEquipDeepLinkExists = function(v66) --[[ Line: 220 ]]
    -- upvalues: v11 (copy)
    if v66.wasItemEquipped or v66.fetchItemFailed then
        return false;
    elseif v66.itemId == nil or v66.itemType == nil then
        return false;
    elseif tonumber(v66.itemId) == nil then
        return false;
    elseif v66.itemType ~= v11.ItemType.Asset:lower() and v66.itemType ~= v11.ItemType.Bundle:lower() then
        return false;
    else
        return true;
    end;
end;
v38.parseItemSubType = function(v67, v68) --[[ Line: 247 ]]
    -- upvalues: v10 (copy)
    return (v10.GetItemSubType(v67, v68));
end;
v38.parseItemIdAndItemType = function(v69) --[[ Line: 253 ]]
    -- upvalues: v11 (copy)
    local l_itemType_0 = v69.itemType;
    if l_itemType_0 and v69.itemType:lower() == v11.ItemType.Asset:lower() then
        l_itemType_0 = v11.ItemType.Asset;
    elseif l_itemType_0 and v69.itemType:lower() == v11.ItemType.Bundle:lower() then
        l_itemType_0 = v11.ItemType.Bundle;
    end;
    return v69.itemId, l_itemType_0;
end;
v38.wasItemFromDeepLinkEquipped = function(v71, v72) --[[ Line: 268 ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    if v71 and v71.wasItemEquipped and v72 and v72.opaque.name ~= l_AvatarScreen_0.Catalog then
        return true;
    else
        return false;
    end;
end;
v38.removeDeepLinkEntries = function(v73) --[[ Line: 284 ]]
    if v73 then
        for v74, v75 in v73 do
            if v75.fromDeepLink then
                table.remove(v73, v74);
                return;
            end;
        end;
    end;
end;
v38.isValidCategorySubtypeForEquippedItem = function(v76, v77) --[[ Line: 300 ]]
    -- upvalues: l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v11 (copy), l_CatalogCategories_0 (copy), v3 (copy)
    local v78 = {};
    local v79 = 0;
    if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
        if v76.Id == if l_FFlagAXDefaultCatalogCategoryId_0 then v11.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue() then
            return true;
        end;
    elseif v76.NavigationKey == l_CatalogCategories_0.Recommended then
        return true;
    end;
    if v76.AssetTypeIdStrings then
        for _, v81 in v76.AssetTypeIdStrings do
            v78 = v3.Dictionary.join(v78, {
                [v81] = v11.ItemType.Asset
            });
        end;
        v79 = v79 + #v76.AssetTypeIdStrings;
    end;
    if v76.BundleTypes then
        for _, v83 in v76.BundleTypes do
            v78 = v3.Dictionary.join(v78, {
                [v83] = v11.ItemType.Bundle
            });
        end;
        v79 = v79 + #v76.BundleTypes;
    end;
    if v79 > 0 then
        return v77.itemSubType and v78[v77.itemSubType] == v77.itemType or false;
    else
        return false;
    end;
end;
v38.addEquippedItemToCatalogEntries = function(v84, v85, v86, v87) --[[ Line: 351 ]]
    -- upvalues: v38 (copy), l_getTryOnItemReducerKey_0 (copy)
    local v88, v89 = v38.parseItemIdAndItemType(v84);
    local v90 = if v88 and v89 then l_getTryOnItemReducerKey_0(v88, v89) else v88;
    local v91 = v85 and v85[v90] ~= nil;
    local v92 = v85 and v85[v90];
    if v91 and v87 and #v87 > 0 and v87[1].id ~= v88 then
        v38.removeDeepLinkEntries(v87);
        if v38.isValidCategorySubtypeForEquippedItem(v86, v92) then
            table.insert(v87, 1, {
                id = v88, 
                type = v89, 
                fromDeepLink = true
            });
            return;
        end;
    elseif not v91 and v87 then
        v38.removeDeepLinkEntries(v87);
    end;
end;
v38.convertCatalogSearchParamsV1ToV2 = function(v93) --[[ Line: 385 ]]
    local v94 = {};
    if not v93 or type(v93) ~= "table" then
        return v94;
    else
        if v93.creatorname then
            v94.creatorName = v93.creatorname;
        end;
        return v94;
    end;
end;
return v38;