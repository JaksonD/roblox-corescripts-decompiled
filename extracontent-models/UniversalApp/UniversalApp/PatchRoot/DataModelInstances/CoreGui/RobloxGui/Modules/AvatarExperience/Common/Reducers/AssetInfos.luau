local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Rodux);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v10 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendAssetResellersList);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResellersList);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetLowestPrice);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetResaleData);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetVersionData);
local v25 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateAssetModerationStatus);
local v29 = require(l_Modules_0.AvatarExperience.Common.Actions.OutfitInformationReceived);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v31 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v32 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
local l_PurchaseItemsSuccess_0 = v8.State.Actions.PurchaseItemsSuccess;
local l_FetchAssetOrBundleInfoBatchedSuccess_0 = v8.State.Actions.FetchAssetOrBundleInfoBatchedSuccess;
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v6.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local l_FFlagAXHydrateAssetFromBundleItems_0 = v7.FFlagAXHydrateAssetFromBundleItems;
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v7.FFlagAXInventoryDurablesExpiredFilter;
return v5.createReducer({}, {
    [v14.name] = function(v41, v42) --[[ Line: 61 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v42.assetId, "string", "assetId must be a string.");
        v3.isType(v42.assetData, "table", "assetData must be a table.");
        local v43 = tostring(v42.assetId);
        local v44 = v41[v43];
        local v45 = v10.fromGetCatalogItemData(v42.assetData, v44);
        return v4.Dictionary.join(v41, {
            [v43] = v45
        });
    end, 
    [v15.name] = function(v46, v47) --[[ Line: 74 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v47.assets, "table", "assets data must be a table.");
        local v48 = {};
        for _, v50 in v47.assets do
            local v51 = tostring(v50.id);
            local v52 = v46[v51];
            v48[v51] = v10.fromBundleItemData(v50, v52);
        end;
        return v4.Dictionary.join(v46, v48);
    end, 
    [v16.name] = function(v53, v54) --[[ Line: 88 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v54.sortResults, "table", "sortResults must be a table.");
        local v55 = {};
        for _, v57 in v54.sortResults do
            local v58 = tostring(v57.id);
            local v59 = v53[v58];
            v55[v58] = v10.fromSortResults(v57, v59);
        end;
        return v4.Dictionary.join(v53, v55);
    end, 
    [v17.name] = l_FFlagAXHydrateAssetFromBundleItems_0 and function(v60, v61) --[[ Line: 107 ]]
        -- upvalues: v25 (copy), v10 (copy), v4 (copy)
        local v62 = {};
        for _, v64 in v61.sortResults do
            if v64.bundledItems then
                for _, v66 in v64.bundledItems do
                    if v66.type == v25.ItemType.Asset then
                        local v67 = tostring(v66.id);
                        local v68 = v60[v67];
                        v62[v67] = v10.fromBundledItems(v66, v68);
                    end;
                end;
            end;
        end;
        return v4.Dictionary.join(v60, v62);
    end or nil, 
    [v11.name] = function(v69, v70) --[[ Line: 126 ]]
        -- upvalues: v3 (copy), v10 (copy), v25 (copy), v4 (copy)
        v3.isType(v70.recommendedItems, "table", "recommendedItems must be a table.");
        local v71 = tostring(v70.assetId);
        local v72 = {};
        local v73 = {};
        for _, v75 in v70.recommendedItems do
            local v76 = tostring(v75.item.assetId);
            local v77 = v69[v76];
            local v78 = v10.fromGetRecommendedItemsData(v75, v70.assetTypeId, v77);
            local l_assetTypeId_0 = v70.assetTypeId;
            v72[v76] = v78;
            table.insert(v73, {
                id = v76, 
                type = v25.ItemType.Asset, 
                subType = l_assetTypeId_0
            });
        end;
        local v80 = v69[v71];
        v72[v71] = v10.fromRecommendedItemSummaries(v73, v80);
        return v4.Dictionary.join(v69, v72);
    end, 
    [v23.name] = function(v81, v82) --[[ Line: 165 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v82.assetResaleData, "table", "assetResaleData must be a table.");
        local v83 = tostring(v82.assetId);
        local v84 = v81[v83];
        local v85 = v10.fromResaleData(v82.assetResaleData, v84);
        return v4.Dictionary.join(v81, {
            [v83] = v85
        });
    end, 
    [v12.name] = function(v86, v87) --[[ Line: 177 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v87.assets, "table", "assets must be a table.");
        local v88 = {};
        for _, v90 in v87.assets do
            local v91 = tostring(v90.assetId);
            local v92 = v86[v91];
            v88[v91] = v10.fromInventoryFetch(v90, v92);
        end;
        return v4.Dictionary.join(v86, v88);
    end, 
    [v13.name] = function(v93, v94) --[[ Line: 195 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v94.assets, "table", "assets must be a table.");
        local v95 = {};
        for _, v97 in v94.assets do
            local v98 = tostring(v97.id);
            local v99 = v93[v98];
            v95[v98] = v10.fromOutfitDetails(v97, v99, v94.outfitModerationStatus);
        end;
        return v4.Dictionary.join(v93, v95);
    end, 
    [v21.name] = function(v100, v101) --[[ Line: 210 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v101.assetId, "string", "assetId must be a sting.");
        v3.isType(v101.userAssetIds, "table", "userAssetIds must be a table.");
        local v102 = tostring(v101.assetId);
        local v103 = v100[v102];
        local v104 = v10.fromGetResellers(v101.userAssetIds, v103);
        return v4.Dictionary.join(v100, {
            [v102] = v104
        });
    end, 
    [v20.name] = function(v105, v106) --[[ Line: 222 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v106.assetId, "string", "assetId must be a sting.");
        v3.isType(v106.userAssetIds, "table", "userAssetIds must be a table.");
        local v107 = tostring(v106.assetId);
        local v108 = if v105[v107] then v105[v107] else v10.mock();
        local l_resellerUserAssetIds_0 = v108.resellerUserAssetIds;
        local v110 = nil;
        v110 = if l_resellerUserAssetIds_0 then v4.List.join(l_resellerUserAssetIds_0, v106.userAssetIds) else v106.userAssetIds;
        local v111 = v10.fromGetResellers(v110, v108);
        return v4.Dictionary.join(v105, {
            [v107] = v4.Dictionary.join(v108, v111)
        });
    end, 
    [v22.name] = function(v112, v113) --[[ Line: 244 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v113.assetId, "string", "assetId must be a sting.");
        v3.isType(v113.priceInRobux, "number", "price must be a number.");
        local l_assetId_0 = v113.assetId;
        local l_priceInRobux_0 = v113.priceInRobux;
        local v116 = v112[l_assetId_0];
        local v117 = v10.fromLowestPrice(l_priceInRobux_0, v116);
        return v4.Dictionary.join(v112, {
            [l_assetId_0] = v117
        });
    end, 
    [v18.name] = function(v118, v119) --[[ Line: 258 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v119.assets, "table", "assets must be a table.");
        v3.isType(v119.assetTypeId, "string", "assetTypeId must be a string.");
        local l_assetTypeId_1 = v119.assetTypeId;
        local v121 = {};
        for _, v123 in v119.assets do
            local v124 = tostring(v123.id);
            local v125 = v118[v124];
            v121[v124] = v10.fromGetRecommendedItemsDataV2(v123, l_assetTypeId_1, v125);
        end;
        return v4.Dictionary.join(v118, v121);
    end, 
    [v19.name] = function(v126, v127) --[[ Line: 279 ]]
        -- upvalues: v3 (copy), v31 (copy), v10 (copy), v4 (copy)
        v3.isType(v127.payload, "table", "payload must be a table.");
        if not v127.payload[v31.ContentType.Asset] then
            return v126;
        else
            local v128 = {};
            for _, v130 in v127.payload[v31.ContentType.Asset] do
                local v131 = tostring(v130.id);
                local v132 = v126[v131];
                local v133 = v10.fromHydrateWidgetInfo(v130, v132);
                v128[v131] = v4.Dictionary.join(v133, v133);
            end;
            return v4.Dictionary.join(v126, v128);
        end;
    end, 
    [v26.name] = function(v134, v135) --[[ Line: 299 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v135.assetId, "string", "assetId must be a string.");
        v3.isType(v135.isOwned, "boolean", "isOwned must be a bool.");
        local v136 = tostring(v135.assetId);
        local v137 = v134[v136];
        local v138 = v10.fromIsOwned(v135.isOwned, v137);
        return v4.Dictionary.join(v134, {
            [v136] = v138
        });
    end, 
    [v27.name] = function(v139, v140) --[[ Line: 309 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local v141 = tostring(v140.assetTypeId);
        local v142 = tostring(v140.assetId);
        local v143 = v10.fromAssetGrant(v142, v141);
        local v144 = v139[v142];
        if v144 and v144.assetType then
            return v139;
        else
            if v144 then
                v143 = v4.Dictionary.join(v144, v143);
            end;
            return v4.Dictionary.join(v139, {
                [v142] = v143
            });
        end;
    end, 
    [v28.name] = function(v145, v146) --[[ Line: 329 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v146.assetId, "string", "assetId must be a string.");
        local v147 = tostring(v146.assetId);
        local v148 = v145[v147];
        local v149 = 1;
        if v148 and v148.updateCounter then
            v149 = v148.updateCounter + 1;
        end;
        local v150 = v10.fromModerationStatusUpdate(v146.moderationStatus, v149, v147, v146.assetName, v146.universeId, v148);
        return v4.Dictionary.join(v145, {
            [v147] = v150
        });
    end, 
    [v37.name] = function(v151, v152) --[[ Line: 349 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local l_assets_0 = v152.avatarData.assets;
        if l_assets_0 == nil then
            return v151;
        else
            local v154 = {};
            for _, v156 in l_assets_0 do
                local v157 = tostring(v156.id);
                local v158 = v10.fromReceivedAvatarData(v156);
                local v159 = v151[v157];
                if not v159 then
                    v154[v157] = v158;
                else
                    v154[v157] = v4.Dictionary.join(v158, v159);
                end;
            end;
            return v4.Dictionary.join(v151, v154);
        end;
    end, 
    [v24.name] = function(v160, v161) --[[ Line: 386 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v161.assetVersionData, "table", "assetVersionData must be a table.");
        local v162 = tostring(v161.assetId);
        local v163 = v160[v162];
        local v164 = v10.fromVersionData(v161.assetVersionData, v163);
        return v4.Dictionary.join(v160, {
            [v162] = v164
        });
    end, 
    [v29.name] = v32.isEnabled() and function(v165, v166) --[[ Line: 399 ]]
        -- upvalues: v10 (copy)
        local v167 = table.clone(v165);
        for _, v169 in v166.outfits do
            local l_assetsToUpdate_0 = v169.assetsToUpdate;
            local l_outfitModerationStatus_0 = v169.outfitModerationStatus;
            if l_assetsToUpdate_0 then
                for _, v173 in l_assetsToUpdate_0 do
                    local v174 = tostring(v173.id);
                    v167[v174] = v10.fromOutfitDetails(v173, v165[v174], l_outfitModerationStatus_0);
                end;
            end;
        end;
        return v167;
    end or nil, 
    [v35.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v175, v176) --[[ Line: 419 ]]
        -- upvalues: v10 (copy)
        local v177 = table.clone(v175);
        local v178 = v176.assetData or {};
        for _, v180 in v178 do
            local v181 = tostring(v180.id);
            local v182 = v175[v181];
            v177[v181] = v10.fromSortResults(v180, v182);
        end;
        return v177;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v183, v184) --[[ Line: 433 ]]
        -- upvalues: v4 (copy)
        v183 = v183 or {};
        local v185 = {};
        for _, v187 in v184.items do
            if v187.itemType == Enum.AvatarItemType.Asset.Name then
                local v188 = tostring(v187.itemId);
                local v189 = v183[v188];
                if v189 then
                    v185[v188] = v4.Dictionary.join(v189, {
                        isOwned = true
                    });
                end;
            end;
        end;
        return v4.Dictionary.join(v183, v185);
    end or nil, 
    [l_FetchAssetOrBundleInfoBatchedSuccess_0.name] = (not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXInventoryDurablesExpiredFilter_0) and function(v190, v191) --[[ Line: 456 ]]
        -- upvalues: v10 (copy), v4 (copy)
        v190 = v190 or {};
        local l_hydratedAssets_0 = v191.hydratedAssets;
        local l_assetsInBundle_0 = v191.assetsInBundle;
        if #l_hydratedAssets_0 > 0 then
            local v194 = {};
            for _, v196 in l_hydratedAssets_0 do
                local v197 = tostring(v196.id);
                local v198 = v190[v197];
                v194[v197] = v10.fromGetCatalogItemData(v196, v198);
            end;
            v190 = v4.Dictionary.join(v190, v194);
        end;
        if #l_assetsInBundle_0 > 0 then
            local v199 = {};
            for _, v201 in l_assetsInBundle_0 do
                local v202 = tostring(v201.id);
                local v203 = v190[v202];
                v199[v202] = v10.fromBundleItemData(v201, v203);
            end;
            v190 = v4.Dictionary.join(v190, v199);
        end;
        return v190;
    end or nil
});