local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_ItemTileEnums_0 = v2.Tile.ItemTileEnums;
local v8 = require(l_CorePackages_0.Packages.Dash);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v10 = require(l_CorePackages_0.Packages.tutils);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_Modules_0.LuaApp.mutedError);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_FFlagAXCatalogCategoriesStore_0 = v13.FFlagAXCatalogCategoriesStore;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v17 = if l_FFlagAXCatalogCategoriesStore_0 then require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore) else require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesMap);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_selectCurrentAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectCurrentAvatarRoute;
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local v30 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableErrorLoggingForSubcategorySelectionById);
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v13.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v13.FFlagAXHandleTaxonomyIdsDeepLinks;
local v52 = {
    HasAttribution = function(v33) --[[ Line: 60 ]] --[[ Name: HasAttribution ]]
        if not v33 or not v33.creatingUniverseId then
            return false;
        else
            return true;
        end;
    end, 
    GetItemSubType = function(v34, v35) --[[ Line: 67 ]] --[[ Name: GetItemSubType ]]
        -- upvalues: v4 (copy)
        if not v35 then
            return;
        elseif v34 == v4.ItemType.Asset then
            return v35.assetType;
        elseif v34 == v4.ItemType.Bundle then
            return v35.bundleType;
        else
            return nil;
        end;
    end, 
    Round = function(v36) --[[ Line: 80 ]] --[[ Name: Round ]]
        return (math.floor(v36 + 0.5));
    end, 
    bankersRounding = function(v37) --[[ Line: 86 ]] --[[ Name: bankersRounding ]]
        local v38 = math.floor(v37);
        if v37 - v38 == 0.5 then
            if v38 % 2 == 0 then
                return v38;
            else
                return v38 + 1;
            end;
        else
            return (math.round(v37));
        end;
    end, 
    HasPremiumBenefits = function(v39) --[[ Line: 97 ]] --[[ Name: HasPremiumBenefits ]]
        if not v39 then
            return false;
        else
            return v39.premiumPricing ~= nil;
        end;
    end, 
    IsResellable = function(v40) --[[ Line: 105 ]] --[[ Name: IsResellable ]]
        -- upvalues: v5 (copy)
        if not v40 then
            return false;
        else
            local l_numberRobloxHasAvailable_0 = v40.numberRobloxHasAvailable;
            local l_itemRestrictions_0 = v40.itemRestrictions;
            local v43 = l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.Limited];
            local v44 = l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.LimitedUnique];
            local v45 = l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.Collectible];
            return v43 or v45 or v44 and l_numberRobloxHasAvailable_0 and l_numberRobloxHasAvailable_0 == 0;
        end;
    end, 
    isLimitedCollectible = function(v46) --[[ Line: 120 ]] --[[ Name: isLimitedCollectible ]]
        -- upvalues: v5 (copy)
        if not v46 then
            return false;
        else
            return v46.itemRestrictions and v46.itemRestrictions[v5.ItemRestrictions.Collectible] or false;
        end;
    end, 
    hasLimitedQuantity = function(v47) --[[ Line: 129 ]] --[[ Name: hasLimitedQuantity ]]
        -- upvalues: v5 (copy)
        if not v47 then
            return nil;
        else
            local l_itemRestrictions_1 = v47.itemRestrictions;
            local v49 = l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.Limited];
            local v50 = l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.LimitedUnique];
            local v51 = l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.Collectible];
            return v49 or v50 or v51;
        end;
    end
};
v52.isUnlimitedCollectibleAsset = function(v53, v54) --[[ Line: 142 ]] --[[ Name: isUnlimitedCollectibleAsset ]]
    -- upvalues: v52 (copy), v4 (copy)
    if not v53 or not v54 then
        return nil;
    else
        local v55 = not v52.hasLimitedQuantity(v54);
        local v56 = v54.collectibleItemId and v54.collectibleItemId ~= "";
        local v57 = v53 and v53 == v4.ItemType.Asset;
        return v55 and v56 and v57;
    end;
end;
v52.isLimitedBundle = function(v58, v59) --[[ Line: 154 ]] --[[ Name: isLimitedBundle ]]
    -- upvalues: v52 (copy), v4 (copy)
    if not v58 or not v59 then
        return nil;
    else
        local v60 = v52.hasLimitedQuantity(v59);
        local v61 = v59.collectibleItemId and v59.collectibleItemId ~= "";
        local v62 = v58 and v58 == v4.ItemType.Bundle;
        return v60 and v61 and v62;
    end;
end;
v52.isUnlimitedCollectibleBundle = function(v63, v64) --[[ Line: 166 ]] --[[ Name: isUnlimitedCollectibleBundle ]]
    -- upvalues: v52 (copy), v4 (copy)
    if not v63 or not v64 then
        return nil;
    else
        local v65 = not v52.hasLimitedQuantity(v64);
        local v66 = v64.collectibleItemId and v64.collectibleItemId ~= "";
        local v67 = v63 and v63 == v4.ItemType.Bundle;
        return v65 and v66 and v67;
    end;
end;
v52.isOriginalStockSellableInShop = function(v68) --[[ Line: 180 ]] --[[ Name: isOriginalStockSellableInShop ]]
    -- upvalues: v5 (copy)
    if v68 then
        local v69 = v68.saleLocationType or v5.SaleLocationType.Invalid;
        local v70 = true;
        if v69 ~= v5.SaleLocationType.ShopOnly then
            v70 = true;
            if v69 ~= v5.SaleLocationType.ShopAndMyExperiences then
                v70 = true;
                if v69 ~= v5.SaleLocationType.ShopAndAllExperiences then
                    v70 = v69 == v5.SaleLocationType.ShopAndExperiencesById;
                end;
            end;
        end;
        return v70;
    else
        return true;
    end;
end;
v52.isCollectibleSellableInShop = function(v71) --[[ Line: 196 ]] --[[ Name: isCollectibleSellableInShop ]]
    -- upvalues: v52 (copy), v5 (copy)
    if not v71 then
        return true;
    else
        assert(v71, "silence type checker");
        local v72 = v52.isOriginalStockSellableInShop(v71);
        local v73 = (v71.unitsAvailableForConsumption or v71.numberRobloxHasAvailable or 0) > 0;
        local l_hasResellers_0 = v71.hasResellers;
        if v71.resaleRestriction == v5.ResaleRestriction.Disabled and not v73 then
            return false;
        else
            local v75 = v71.experiences and #v71.experiences > 0;
            return v73 and (v72 or v75) or l_hasResellers_0;
        end;
    end;
end;
local function _(v76, v77) --[[ Line: 222 ]] --[[ Name: reachQuantityLimitInternal ]]
    -- upvalues: v10 (copy)
    if not v76 or not v76.quantityLimitPerUser or not v77 then
        return false;
    else
        local v78 = false;
        if v76.quantityLimitPerUser > 0 then
            v78 = v10.fieldCount(v77) >= v76.quantityLimitPerUser;
        end;
        return v78;
    end;
end;
v52.reachQuantityLimit = function(v80, v81) --[[ Line: 230 ]] --[[ Name: reachQuantityLimit ]]
    -- upvalues: v10 (copy)
    if not v80 or not v80.quantityLimitPerUser or not v81 then
        return false;
    else
        local v82 = false;
        if v80.quantityLimitPerUser > 0 then
            v82 = v10.fieldCount(v81) >= v80.quantityLimitPerUser;
        end;
        return v82;
    end;
end;
v52.shouldShowQuantityLimit = function(v83) --[[ Line: 234 ]] --[[ Name: shouldShowQuantityLimit ]]
    return v83 and v83 > 0;
end;
v52.GetRbxThumbType = function(v84) --[[ Line: 238 ]] --[[ Name: GetRbxThumbType ]]
    -- upvalues: v4 (copy), l_Constants_0 (copy)
    if v84 == v4.ItemType.Asset then
        return l_Constants_0.RbxthumbTypes.Asset;
    elseif v84 == v4.ItemType.Bundle then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    elseif v84 == v4.ItemType.Look then
        return l_Constants_0.RbxthumbTypes.Look;
    else
        return nil;
    end;
end;
v52.GetSponsoredItemsKey = function(v85, v86) --[[ Line: 250 ]] --[[ Name: GetSponsoredItemsKey ]]
    -- upvalues: v5 (copy)
    return v5.SponsoredItemsDataKey .. "." .. tostring(v85) .. "." .. tostring(v86);
end;
v52.GetItemDetailsKey = function(v87, v88) --[[ Line: 254 ]] --[[ Name: GetItemDetailsKey ]]
    -- upvalues: v5 (copy)
    if not v87 or not v88 then
        return v5.ItemDetailsKey;
    else
        return v5.ItemDetailsKey .. v87 .. v88;
    end;
end;
v52.GetBatchItemDetailsKey = function(v89, v90) --[[ Line: 261 ]] --[[ Name: GetBatchItemDetailsKey ]]
    -- upvalues: v5 (copy)
    if not v89 or not v90 then
        return v5.BatchItemDetailsKey;
    else
        return (v5.BatchItemDetailsKey .. v90) .. table.concat(v89, ",");
    end;
end;
v52.getFetchWidgetInfoFetchKey = function(v91, v92, v93) --[[ Line: 272 ]] --[[ Name: getFetchWidgetInfoFetchKey ]]
    -- upvalues: l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), v5 (copy)
    if l_FFlagAXPassScreenSizeToWidgetApi_0 then
        return v5.FetchWidgetInfoKey .. (v91 or "") .. (v92 or "") .. (v93 or "");
    else
        return v5.FetchWidgetInfoKey .. (v91 or "") .. (v92 or "");
    end;
end;
v52.GetStatus = function(v94) --[[ Line: 283 ]] --[[ Name: GetStatus ]]
    -- upvalues: v5 (copy), l_ItemTileEnums_0 (copy)
    if not v94 then
        return;
    else
        local l_itemStatus_0 = v94.itemStatus;
        if not l_itemStatus_0 then
            return;
        elseif #l_itemStatus_0 == 0 then
            return;
        else
            local v96 = {};
            for _, v98 in l_itemStatus_0 do
                v96[v98] = true;
            end;
            local v99 = nil;
            local v100 = nil;
            if v96[v5.ItemStatus.Sale] then
                return l_ItemTileEnums_0.StatusStyle.Alert, v5.ItemStatusLocale.Sale;
            else
                if v96[v5.ItemStatus.New] then
                    v99 = l_ItemTileEnums_0.StatusStyle.Info;
                    v100 = v5.ItemStatusLocale.New;
                end;
                return v99, v100;
            end;
        end;
    end;
end;
v52.getIsTradable = function(v101) --[[ Line: 319 ]] --[[ Name: getIsTradable ]]
    -- upvalues: v5 (copy)
    local v102 = v101 and v101.itemRestrictions;
    if not v102 then
        return nil;
    elseif v102[v5.ItemRestrictions.Limited] then
        return true;
    elseif v102[v5.ItemRestrictions.LimitedUnique] then
        return true;
    elseif v102[v5.ItemRestrictions.Collectible] then
        return false;
    else
        return nil;
    end;
end;
v52.splitEntries = l_memoize_0(function(v103, v104, v105) --[[ Line: 337 ]]
    -- upvalues: v8 (copy)
    local v106 = math.max(1, 1 + (v104 - 1) * v105);
    return v8.slice(v103, 1, v106 - 1), (v8.slice(v103, v106));
end);
v52.getTopicRequestKey = function(v107, v108, v109) --[[ Line: 354 ]] --[[ Name: getTopicRequestKey ]]
    -- upvalues: v8 (copy)
    local v110 = if v109 then ("[%*]"):format(v109 or "") else "";
    if #v107 > 0 then
        local v111 = table.clone(v107);
        table.sort(v111);
        v110 = v110 .. table.concat(v111, ",");
    end;
    if #v110 > 0 then
        return v110;
    elseif v108 then
        return table.concat(v8.map(v108, function(v112) --[[ Line: 368 ]]
            return tostring(v112.itemType) .. tostring(v112.targetId);
        end));
    else
        return "";
    end;
end;
local v113 = nil;
local function v123(v114) --[[ Line: 381 ]] --[[ Name: assetTypeHasCatalogPage ]]
    -- upvalues: v17 (copy)
    for _, v116 in (v17()) do
        if v116.Subcategories then
            for _, v118 in v116.Subcategories do
                if v118.Name ~= "Community" and v118.AssetTypeIdStrings then
                    for _, v120 in v118.AssetTypeIdStrings do
                        if v120 == v114 then
                            return true;
                        end;
                    end;
                end;
            end;
        elseif v116.AssetTypeIdStrings then
            for _, v122 in v116.AssetTypeIdStrings do
                if v122 == v114 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v52.doesAssetTypeHaveCatalogPage = function(v124) --[[ Line: 408 ]] --[[ Name: doesAssetTypeHaveCatalogPage ]]
    -- upvalues: v113 (ref), v4 (copy), v123 (copy)
    if not v113 then
        v113 = {};
        for _, v126 in v4.AssetTypeIdStrings do
            if v123(v126) then
                v113[v126] = true;
            end;
        end;
    end;
    return v113[v124] == true;
end;
v52.getRecommendedItemsGridItemTitleHeight = function(v127, v128) --[[ Line: 421 ]] --[[ Name: getRecommendedItemsGridItemTitleHeight ]]
    v128 = v128 or 0;
    return (v127.BaseSize * v127.Header2.RelativeSize + v128) * 2;
end;
v52.findCheapestCollectiblePurchaseInfo = l_memoize_0(function(v129, v130, v131, v132) --[[ Line: 442 ]]
    -- upvalues: v29 (copy), v52 (copy), v10 (copy)
    local v133 = {};
    if not v129 then
        return v133;
    else
        assert(v129, "silence type checker");
        local v134 = v130[v129];
        if not v134 or not v134.unitsAvailableForConsumption or not v134.price then
            return v133;
        else
            local v135 = true;
            if v29() then
                v135 = v52.isOriginalStockSellableInShop(v134);
            end;
            local v136 = false;
            if v134.quantityLimitPerUser and v132 and v132[v129] then
                local v137 = v132[v129];
                v136 = if v134 and v134.quantityLimitPerUser and v137 then v134.quantityLimitPerUser > 0 and v10.fieldCount(v137) >= v134.quantityLimitPerUser else false;
            end;
            if v135 and not v136 and v134.unitsAvailableForConsumption > 0 then
                v133.price = v134.price;
            end;
            local v138 = v131[v129];
            if v138 and #v138.InstanceIdsList > 0 then
                local v139 = v138.InstanceIdsList[1];
                local v140 = v138.Instances[v139];
                if not v135 or v134.unitsAvailableForConsumption == 0 or v140.price < v133.price or v136 then
                    v133.collectibleInstanceId = v140.collectibleInstanceId;
                    v133.price = v140.price;
                    v133.expectedSellerId = v140.seller.sellerId;
                    v133.sellerName = v140.seller.name;
                end;
            end;
            return v133;
        end;
    end;
end);
v52.findCheapestCollectiblePurchaseInfoV2 = function(v141, v142, v143, v144, v145) --[[ Line: 505 ]]
    -- upvalues: v52 (copy)
    local v146 = {};
    if not v141 then
        return v146;
    else
        assert(v141, "silence type checker");
        local v147 = v143[v141];
        if v147 and not v142 then
            v146.price = v147.price;
            return v146;
        else
            return (v52.findCheapestCollectiblePurchaseInfo(v141, v143, v144, v145));
        end;
    end;
end;
v52.getQueryStringForSearchWidgets = function(v148) --[[ Line: 541 ]] --[[ Name: getQueryStringForSearchWidgets ]]
    if not v148 or not v148.searchKeyword then
        return nil;
    else
        local v149 = {
            v148.searchKeyword
        };
        if v148.sortAndFilters and v148.sortAndFilters.SelectedTopics then
            for _, v151 in v148.sortAndFilters.SelectedTopics do
                table.insert(v149, 1, v151);
            end;
        end;
        return table.concat(v149, " ");
    end;
end;
v52.getCategoryName = function(v152) --[[ Line: 556 ]] --[[ Name: getCategoryName ]]
    -- upvalues: v11 (copy), v17 (copy)
    assert(v11.number(v152), "Expected categoryIndex to be a number");
    local v153 = v17()[v152];
    return v153 and v153.Name;
end;
v52.getCategoryId = function(v154) --[[ Line: 563 ]] --[[ Name: getCategoryId ]]
    -- upvalues: v19 (copy)
    return v19()[v154];
end;
v52.extractCategoryById = function(v155, v156) --[[ Line: 568 ]] --[[ Name: extractCategoryById ]]
    -- upvalues: v11 (copy)
    assert(v11.string(v155), "Expected categoryId to be a string");
    local v157 = nil;
    for _, v159 in v156 do
        if v159.Id == v155 then
            return v159;
        end;
    end;
    return v157;
end;
v52.extractSubcategoryById = function(v160, v161) --[[ Line: 581 ]] --[[ Name: extractSubcategoryById ]]
    -- upvalues: v11 (copy)
    assert(v11.string(v160), "Expected subcategoryId to be a string");
    local v162 = nil;
    for _, v164 in v161 do
        if v164.Id == v160 then
            return v164;
        end;
    end;
    return v162;
end;
v52.findCategoryByCategoryId = function(v165, v166) --[[ Line: 594 ]] --[[ Name: findCategoryByCategoryId ]]
    if not v165 then
        return nil;
    else
        for _, v168 in v166 do
            if v168.CategoryId == v165 then
                return v168;
            end;
        end;
        return nil;
    end;
end;
v52.findSubcategoryBySubcategoryId = function(v169, v170) --[[ Line: 607 ]] --[[ Name: findSubcategoryBySubcategoryId ]]
    if not v169 then
        return nil;
    else
        for _, v172 in v170 do
            if v172.SubcategoryId == v169 then
                return v172;
            end;
        end;
        return nil;
    end;
end;
if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
    v52.findCategoryIdsByTaxonomy = function(v173, v174) --[[ Line: 624 ]] --[[ Name: findCategoryIdsByTaxonomy ]]
        if not v173 then
            return nil, nil;
        else
            for _, v176 in v174 do
                if v176.TaxonomyUuid and string.lower(v176.TaxonomyUuid) == string.lower(v173) then
                    return v176.Id, nil;
                elseif v176.Subcategories then
                    for _, v178 in v176.Subcategories do
                        if v178.TaxonomyUuid and string.lower(v178.TaxonomyUuid) == string.lower(v173) then
                            return v176.Id, v178.Id;
                        end;
                    end;
                end;
            end;
            return nil, nil;
        end;
    end;
end;
v52.getCategoryNameById = function(v179) --[[ Line: 647 ]] --[[ Name: getCategoryNameById ]]
    -- upvalues: v52 (copy)
    local v180 = v52.getCategoryId(v179);
    return v180 and v180.Name;
end;
v52.getSubcategoryId = function(v181, v182) --[[ Line: 652 ]] --[[ Name: getSubcategoryId ]]
    -- upvalues: v11 (copy), v52 (copy)
    assert(v11.tuple(v11.string, v11.string)(v181, v182), "Expected categoryId and subcategoryId to be strings");
    local v183 = nil;
    local v184 = v52.getCategoryId(v181);
    if v184 and v184.SubcategoriesMap then
        v183 = v184.SubcategoriesMap[v182];
    end;
    return v183;
end;
v52.getSubcategoryNameById = function(v185, v186) --[[ Line: 668 ]] --[[ Name: getSubcategoryNameById ]]
    -- upvalues: v52 (copy)
    local v187 = v52.getSubcategoryId(v185, v186);
    return v187 and v187.Name;
end;
v52.getSubcategoryNameByIdWithErrorLogging = function(v188, v189) --[[ Line: 673 ]] --[[ Name: getSubcategoryNameByIdWithErrorLogging ]]
    -- upvalues: v52 (copy), v30 (copy), v12 (copy)
    local v190 = v52.getSubcategoryNameById(v188, v189);
    if v30() and v188 and v189 and not v190 then
        v12("getSubcategoryNameById returned nil for subcategoryId: " .. v189 .. " and categoryId: " .. v188);
    end;
    return v190;
end;
v52.findCategoryIndexById = function(v191, v192) --[[ Line: 691 ]] --[[ Name: findCategoryIndexById ]]
    for v193, v194 in v191 do
        if v194.Id == v192 then
            return v193;
        end;
    end;
    return nil;
end;
v52.getSubcategoryName = function(v195, v196) --[[ Line: 700 ]] --[[ Name: getSubcategoryName ]]
    -- upvalues: v11 (copy), v17 (copy)
    assert(v11.tuple(v11.number, v11.number)(v195, v196), "Expected categoryIndex and subcategoryIndex to be numbers");
    local v197 = nil;
    local v198 = v17()[v195];
    if v198 then
        local v199 = v198.Subcategories and v198.Subcategories[v196];
        v197 = v199 and v199.Name;
    end;
    return v197;
end;
v52.getCurrentCategoryNames = function(v200) --[[ Line: 722 ]] --[[ Name: getCurrentCategoryNames ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v18 (copy), v52 (copy)
    if not v200 or not v200.AvatarExperience or not v200.AvatarExperience.Catalog then
        return nil;
    else
        local l_Categories_0 = v200.AvatarExperience.Catalog.Categories;
        local l_SearchCategories_0 = v200.AvatarExperience.Catalog.SearchCategories;
        local v203 = {};
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v204 = v18.getCatalogSelectionStore();
            local v205 = v204.selectedCategoryId(false);
            local v206 = v204.selectedSubcategoryId(false);
            if v205 then
                v203.catalogCategory = v52.getCategoryNameById(v205);
                if v206 then
                    v203.catalogSubcategory = v52.getSubcategoryNameByIdWithErrorLogging(v205, v206);
                else
                    v203.catalogSubcategory = nil;
                end;
            end;
            local v207 = v18.getCatalogSearchSelectionStore();
            local v208 = v207.selectedCategoryId(false);
            local v209 = v207.selectedSubcategoryId(false);
            if v208 then
                v203.catalogSearchCategory = v52.getCategoryNameById(v208);
                if v209 then
                    v203.catalogSearchSubcategory = v52.getSubcategoryNameByIdWithErrorLogging(v208, v209);
                    return v203;
                else
                    v203.catalogSearchSubcategory = nil;
                    return v203;
                end;
            end;
        else
            if l_Categories_0 and l_Categories_0.categoryId then
                v203.catalogCategory = v52.getCategoryNameById(l_Categories_0.categoryId);
                if l_Categories_0.subcategoryId then
                    v203.catalogSubcategory = v52.getSubcategoryNameByIdWithErrorLogging(l_Categories_0.categoryId, l_Categories_0.subcategoryId);
                else
                    v203.catalogSubcategory = nil;
                end;
            end;
            if l_SearchCategories_0 and l_SearchCategories_0.categoryId then
                v203.catalogSearchCategory = v52.getCategoryNameById(l_SearchCategories_0.categoryId);
                if l_SearchCategories_0.subcategoryId then
                    v203.catalogSearchSubcategory = v52.getSubcategoryNameByIdWithErrorLogging(l_SearchCategories_0.categoryId, l_SearchCategories_0.subcategoryId);
                    return v203;
                else
                    v203.catalogSearchSubcategory = nil;
                end;
            end;
        end;
        return v203;
    end;
end;
v52.getContextStringForWidgets = function(v210) --[[ Line: 794 ]] --[[ Name: getContextStringForWidgets ]]
    -- upvalues: v11 (copy)
    assert(v11.array(v11.string)(v210));
    local v211 = table.concat(v210, ":");
    v211 = string.gsub(v211, " ", "-");
    v211 = string.gsub(v211, "%.", "-");
    return (string.lower(v211));
end;
v52.getContextForWidgetsById = function(v212, v213, v214) --[[ Line: 816 ]] --[[ Name: getContextForWidgetsById ]]
    -- upvalues: v11 (copy), v26 (copy), v52 (copy)
    assert(v11.tuple(v11.string, v11.string, v11.optional(v11.string))(v212, v213, v214), "Expected pageName to be a string, categoryId to be a string, and subcategoryId to be a string or nil");
    if not table.find(v26.ContextWidgetsAllowedRoutes, v212) then
        return nil;
    else
        local v215 = v26.AnalyticsContext[v212];
        local v216 = v52.getCategoryNameById(v213);
        if v215 and v216 then
            local v217 = {
                (("%*-tab"):format(v215))
            };
            table.insert(v217, v216);
            if v214 then
                local v218 = v52.getSubcategoryNameByIdWithErrorLogging(v213, v214);
                if v218 then
                    table.insert(v217, v218);
                end;
                if v214 and not v218 then
                    return nil;
                end;
            end;
            return v52.getContextStringForWidgets(v217);
        else
            return nil;
        end;
    end;
end;
v52.getCategoryAndSubcategory = function(v219) --[[ Line: 856 ]] --[[ Name: getCategoryAndSubcategory ]]
    -- upvalues: v52 (copy), l_selectCurrentAvatarRoute_0 (copy), l_AvatarScreen_0 (copy)
    local v220 = v52.getCurrentCategoryNames(v219);
    local v221 = l_selectCurrentAvatarRoute_0(v219);
    local v222 = v221 and v221.name == l_AvatarScreen_0.CatalogSearch;
    local v223 = nil;
    local v224 = nil;
    if v220 then
        if v222 then
            return v220.catalogSearchCategory or v223, v220.catalogSearchSubcategory or v224;
        else
            v223 = v220.catalogCategory or v223;
            v224 = v220.catalogSubcategory or v224;
        end;
    end;
    return v223, v224;
end;
v52.removeItemFootersFromConfigs = function(v225, v226, v227, v228, v229) --[[ Line: 876 ]] --[[ Name: removeItemFootersFromConfigs ]]
    -- upvalues: v10 (copy)
    local function _(v230) --[[ Line: 883 ]] --[[ Name: removeEntriesFromItemFooters ]]
        -- upvalues: v227 (copy), v228 (copy), v229 (copy)
        local function v235(v231) --[[ Line: 884 ]] --[[ Name: removeEntryFromItemFooter ]]
            -- upvalues: v230 (copy)
            local v232 = nil;
            for v233, v234 in v230 do
                if v234.contentType == v231 then
                    v232 = v233;
                end;
                if v232 then
                    table.remove(v230, v232);
                end;
            end;
        end;
        if v227 then
            v235("ItemName");
        end;
        if v228 then
            v235("AgentName");
        end;
        if v229 then
            v235("Price");
        end;
    end;
    local v237 = v10.deepCopy(v225);
    local v238 = v10.deepCopy(v226);
    if v238 and v238.template and v238.template.itemFooters then
        local l_itemFooters_0 = v238.template.itemFooters;
        local l_l_itemFooters_0_0 = l_itemFooters_0 --[[ copy: 8 -> 11 ]];
        local function v245(v241) --[[ Line: 884 ]] --[[ Name: removeEntryFromItemFooter ]]
            -- upvalues: l_l_itemFooters_0_0 (copy)
            local v242 = nil;
            for v243, v244 in l_l_itemFooters_0_0 do
                if v244.contentType == v241 then
                    v242 = v243;
                end;
                if v242 then
                    table.remove(l_l_itemFooters_0_0, v242);
                end;
            end;
        end;
        if v227 then
            v245("ItemName");
        end;
        if v228 then
            v245("AgentName");
        end;
        if v229 then
            v245("Price");
        end;
    end;
    if v237 and v237.defaultItemGroupTemplate and v237.defaultItemGroupTemplate.itemFooters then
        local l_itemFooters_1 = v237.defaultItemGroupTemplate.itemFooters;
        local l_l_itemFooters_1_0 = l_itemFooters_1 --[[ copy: 8 -> 10 ]];
        local function v252(v248) --[[ Line: 884 ]] --[[ Name: removeEntryFromItemFooter ]]
            -- upvalues: l_l_itemFooters_1_0 (copy)
            local v249 = nil;
            for v250, v251 in l_l_itemFooters_1_0 do
                if v251.contentType == v248 then
                    v249 = v250;
                end;
                if v249 then
                    table.remove(l_l_itemFooters_1_0, v249);
                end;
            end;
        end;
        if v227 then
            v252("ItemName");
        end;
        if v228 then
            v252("AgentName");
        end;
        if v229 then
            v252("Price");
        end;
    end;
    if v237 and v237.defaultItemCarouselTemplate and v237.defaultItemCarouselTemplate.itemFooters then
        local l_itemFooters_2 = v237.defaultItemCarouselTemplate.itemFooters;
        local function v258(v254) --[[ Line: 884 ]] --[[ Name: removeEntryFromItemFooter ]]
            -- upvalues: l_itemFooters_2 (copy)
            local v255 = nil;
            for v256, v257 in l_itemFooters_2 do
                if v257.contentType == v254 then
                    v255 = v256;
                end;
                if v255 then
                    table.remove(l_itemFooters_2, v255);
                end;
            end;
        end;
        if v227 then
            v258("ItemName");
        end;
        if v228 then
            v258("AgentName");
        end;
        if v229 then
            v258("Price");
        end;
    end;
    if v237 and v237.customizedDataMap and v237.customizedDataMap.creatorNameTileFooterEnabled and v228 then
        v237.customizedDataMap.creatorNameTileFooterEnabled = false;
    end;
    return v237, v238;
end;
v52.getAvatarsTabAnalyticsInfo = function(v259) --[[ Line: 942 ]] --[[ Name: getAvatarsTabAnalyticsInfo ]]
    -- upvalues: v52 (copy), l_AvatarScreen_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    local v260 = v52.getCurrentCategoryNames(v259);
    local l_name_0 = v259.AvatarExperience.AvatarScene.AvatarRoute.opaque.name;
    local v262 = nil;
    local v263 = nil;
    local v264 = nil;
    local v265 = nil;
    if l_name_0 == l_AvatarScreen_0.CatalogSearch then
        v262 = v259.AvatarExperience.Catalog.AvatarsTabSearchInfo.keyword;
        v265 = v259.AvatarExperience.Catalog.AvatarsTabSearchInfo.searchUuid;
        v263 = v260 and v260.catalogSearchCategory;
        v264 = v260 and v260.catalogSearchSubcategory;
    else
        if not l_FFlagAXCatalogCategoriesStore_0 then
            v265 = v52.getCategoryId(v259.AvatarExperience.Catalog.Categories.categoryId).SearchUuid;
        end;
        v263 = v260 and v260.catalogCategory;
        v264 = v260 and v260.catalogSubcategory;
    end;
    return v262, v263, v264, v265, l_name_0;
end;
return v52;