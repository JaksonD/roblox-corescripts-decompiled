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
return v5.createReducer({}, {
    [v14.name] = function(v40, v41) --[[ Line: 60 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v41.assetId, "string", "assetId must be a string.");
        v3.isType(v41.assetData, "table", "assetData must be a table.");
        local v42 = tostring(v41.assetId);
        local v43 = v40[v42];
        local v44 = v10.fromGetCatalogItemData(v41.assetData, v43);
        return v4.Dictionary.join(v40, {
            [v42] = v44
        });
    end, 
    [v15.name] = function(v45, v46) --[[ Line: 73 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v46.assets, "table", "assets data must be a table.");
        local v47 = {};
        for _, v49 in v46.assets do
            local v50 = tostring(v49.id);
            local v51 = v45[v50];
            v47[v50] = v10.fromBundleItemData(v49, v51);
        end;
        return v4.Dictionary.join(v45, v47);
    end, 
    [v16.name] = function(v52, v53) --[[ Line: 87 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v53.sortResults, "table", "sortResults must be a table.");
        local v54 = {};
        for _, v56 in v53.sortResults do
            local v57 = tostring(v56.id);
            local v58 = v52[v57];
            v54[v57] = v10.fromSortResults(v56, v58);
        end;
        return v4.Dictionary.join(v52, v54);
    end, 
    [v17.name] = l_FFlagAXHydrateAssetFromBundleItems_0 and function(v59, v60) --[[ Line: 106 ]]
        -- upvalues: v25 (copy), v10 (copy), v4 (copy)
        local v61 = {};
        for _, v63 in v60.sortResults do
            if v63.bundledItems then
                for _, v65 in v63.bundledItems do
                    if v65.type == v25.ItemType.Asset then
                        local v66 = tostring(v65.id);
                        local v67 = v59[v66];
                        v61[v66] = v10.fromBundledItems(v65, v67);
                    end;
                end;
            end;
        end;
        return v4.Dictionary.join(v59, v61);
    end or nil, 
    [v11.name] = function(v68, v69) --[[ Line: 125 ]]
        -- upvalues: v3 (copy), v10 (copy), v25 (copy), v4 (copy)
        v3.isType(v69.recommendedItems, "table", "recommendedItems must be a table.");
        local v70 = tostring(v69.assetId);
        local v71 = {};
        local v72 = {};
        for _, v74 in v69.recommendedItems do
            local v75 = tostring(v74.item.assetId);
            local v76 = v68[v75];
            local v77 = v10.fromGetRecommendedItemsData(v74, v69.assetTypeId, v76);
            local l_assetTypeId_0 = v69.assetTypeId;
            v71[v75] = v77;
            table.insert(v72, {
                id = v75, 
                type = v25.ItemType.Asset, 
                subType = l_assetTypeId_0
            });
        end;
        local v79 = v68[v70];
        v71[v70] = v10.fromRecommendedItemSummaries(v72, v79);
        return v4.Dictionary.join(v68, v71);
    end, 
    [v23.name] = function(v80, v81) --[[ Line: 164 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v81.assetResaleData, "table", "assetResaleData must be a table.");
        local v82 = tostring(v81.assetId);
        local v83 = v80[v82];
        local v84 = v10.fromResaleData(v81.assetResaleData, v83);
        return v4.Dictionary.join(v80, {
            [v82] = v84
        });
    end, 
    [v12.name] = function(v85, v86) --[[ Line: 176 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v86.assets, "table", "assets must be a table.");
        local v87 = {};
        for _, v89 in v86.assets do
            local v90 = tostring(v89.assetId);
            local v91 = v85[v90];
            v87[v90] = v10.fromInventoryFetch(v89, v91);
        end;
        return v4.Dictionary.join(v85, v87);
    end, 
    [v13.name] = function(v92, v93) --[[ Line: 194 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v93.assets, "table", "assets must be a table.");
        local v94 = {};
        for _, v96 in v93.assets do
            local v97 = tostring(v96.id);
            local v98 = v92[v97];
            v94[v97] = v10.fromOutfitDetails(v96, v98, v93.outfitModerationStatus);
        end;
        return v4.Dictionary.join(v92, v94);
    end, 
    [v21.name] = function(v99, v100) --[[ Line: 209 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v100.assetId, "string", "assetId must be a sting.");
        v3.isType(v100.userAssetIds, "table", "userAssetIds must be a table.");
        local v101 = tostring(v100.assetId);
        local v102 = v99[v101];
        local v103 = v10.fromGetResellers(v100.userAssetIds, v102);
        return v4.Dictionary.join(v99, {
            [v101] = v103
        });
    end, 
    [v20.name] = function(v104, v105) --[[ Line: 221 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v105.assetId, "string", "assetId must be a sting.");
        v3.isType(v105.userAssetIds, "table", "userAssetIds must be a table.");
        local v106 = tostring(v105.assetId);
        local v107 = if v104[v106] then v104[v106] else v10.mock();
        local l_resellerUserAssetIds_0 = v107.resellerUserAssetIds;
        local v109 = nil;
        v109 = if l_resellerUserAssetIds_0 then v4.List.join(l_resellerUserAssetIds_0, v105.userAssetIds) else v105.userAssetIds;
        local v110 = v10.fromGetResellers(v109, v107);
        return v4.Dictionary.join(v104, {
            [v106] = v4.Dictionary.join(v107, v110)
        });
    end, 
    [v22.name] = function(v111, v112) --[[ Line: 243 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v112.assetId, "string", "assetId must be a sting.");
        v3.isType(v112.priceInRobux, "number", "price must be a number.");
        local l_assetId_0 = v112.assetId;
        local l_priceInRobux_0 = v112.priceInRobux;
        local v115 = v111[l_assetId_0];
        local v116 = v10.fromLowestPrice(l_priceInRobux_0, v115);
        return v4.Dictionary.join(v111, {
            [l_assetId_0] = v116
        });
    end, 
    [v18.name] = function(v117, v118) --[[ Line: 257 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v118.assets, "table", "assets must be a table.");
        v3.isType(v118.assetTypeId, "string", "assetTypeId must be a string.");
        local l_assetTypeId_1 = v118.assetTypeId;
        local v120 = {};
        for _, v122 in v118.assets do
            local v123 = tostring(v122.id);
            local v124 = v117[v123];
            v120[v123] = v10.fromGetRecommendedItemsDataV2(v122, l_assetTypeId_1, v124);
        end;
        return v4.Dictionary.join(v117, v120);
    end, 
    [v19.name] = function(v125, v126) --[[ Line: 278 ]]
        -- upvalues: v3 (copy), v31 (copy), v10 (copy), v4 (copy)
        v3.isType(v126.payload, "table", "payload must be a table.");
        if not v126.payload[v31.ContentType.Asset] then
            return v125;
        else
            local v127 = {};
            for _, v129 in v126.payload[v31.ContentType.Asset] do
                local v130 = tostring(v129.id);
                local v131 = v125[v130];
                local v132 = v10.fromHydrateWidgetInfo(v129, v131);
                v127[v130] = v4.Dictionary.join(v132, v132);
            end;
            return v4.Dictionary.join(v125, v127);
        end;
    end, 
    [v26.name] = function(v133, v134) --[[ Line: 298 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v134.assetId, "string", "assetId must be a string.");
        v3.isType(v134.isOwned, "boolean", "isOwned must be a bool.");
        local v135 = tostring(v134.assetId);
        local v136 = v133[v135];
        local v137 = v10.fromIsOwned(v134.isOwned, v136);
        return v4.Dictionary.join(v133, {
            [v135] = v137
        });
    end, 
    [v27.name] = function(v138, v139) --[[ Line: 308 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local v140 = tostring(v139.assetTypeId);
        local v141 = tostring(v139.assetId);
        local v142 = v10.fromAssetGrant(v141, v140);
        local v143 = v138[v141];
        if v143 and v143.assetType then
            return v138;
        else
            if v143 then
                v142 = v4.Dictionary.join(v143, v142);
            end;
            return v4.Dictionary.join(v138, {
                [v141] = v142
            });
        end;
    end, 
    [v28.name] = function(v144, v145) --[[ Line: 328 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v145.assetId, "string", "assetId must be a string.");
        local v146 = tostring(v145.assetId);
        local v147 = v144[v146];
        local v148 = 1;
        if v147 and v147.updateCounter then
            v148 = v147.updateCounter + 1;
        end;
        local v149 = v10.fromModerationStatusUpdate(v145.moderationStatus, v148, v146, v145.assetName, v145.universeId, v147);
        return v4.Dictionary.join(v144, {
            [v146] = v149
        });
    end, 
    [v37.name] = function(v150, v151) --[[ Line: 348 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local l_assets_0 = v151.avatarData.assets;
        if l_assets_0 == nil then
            return v150;
        else
            local v153 = {};
            for _, v155 in l_assets_0 do
                local v156 = tostring(v155.id);
                local v157 = v10.fromReceivedAvatarData(v155);
                local v158 = v150[v156];
                if not v158 then
                    v153[v156] = v157;
                else
                    v153[v156] = v4.Dictionary.join(v157, v158);
                end;
            end;
            return v4.Dictionary.join(v150, v153);
        end;
    end, 
    [v24.name] = function(v159, v160) --[[ Line: 385 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v160.assetVersionData, "table", "assetVersionData must be a table.");
        local v161 = tostring(v160.assetId);
        local v162 = v159[v161];
        local v163 = v10.fromVersionData(v160.assetVersionData, v162);
        return v4.Dictionary.join(v159, {
            [v161] = v163
        });
    end, 
    [v29.name] = v32.isEnabled() and function(v164, v165) --[[ Line: 398 ]]
        -- upvalues: v10 (copy)
        local v166 = table.clone(v164);
        for _, v168 in v165.outfits do
            local l_assetsToUpdate_0 = v168.assetsToUpdate;
            local l_outfitModerationStatus_0 = v168.outfitModerationStatus;
            if l_assetsToUpdate_0 then
                for _, v172 in l_assetsToUpdate_0 do
                    local v173 = tostring(v172.id);
                    v166[v173] = v10.fromOutfitDetails(v172, v164[v173], l_outfitModerationStatus_0);
                end;
            end;
        end;
        return v166;
    end or nil, 
    [v35.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v174, v175) --[[ Line: 418 ]]
        -- upvalues: v10 (copy)
        local v176 = table.clone(v174);
        local v177 = v175.assetData or {};
        for _, v179 in v177 do
            local v180 = tostring(v179.id);
            local v181 = v174[v180];
            v176[v180] = v10.fromSortResults(v179, v181);
        end;
        return v176;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v182, v183) --[[ Line: 432 ]]
        -- upvalues: v4 (copy)
        v182 = v182 or {};
        local v184 = {};
        for _, v186 in v183.items do
            if v186.itemType == Enum.AvatarItemType.Asset.Name then
                local v187 = tostring(v186.itemId);
                local v188 = v182[v187];
                if v188 then
                    v184[v187] = v4.Dictionary.join(v188, {
                        isOwned = true
                    });
                end;
            end;
        end;
        return v4.Dictionary.join(v182, v184);
    end or nil, 
    [l_FetchAssetOrBundleInfoBatchedSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v189, v190) --[[ Line: 454 ]]
        -- upvalues: v10 (copy), v4 (copy)
        v189 = v189 or {};
        local l_hydratedAssets_0 = v190.hydratedAssets;
        local l_assetsInBundle_0 = v190.assetsInBundle;
        if #l_hydratedAssets_0 > 0 then
            local v193 = {};
            for _, v195 in l_hydratedAssets_0 do
                local v196 = tostring(v195.id);
                local v197 = v189[v196];
                v193[v196] = v10.fromGetCatalogItemData(v195, v197);
            end;
            v189 = v4.Dictionary.join(v189, v193);
        end;
        if #l_assetsInBundle_0 > 0 then
            local v198 = {};
            for _, v200 in l_assetsInBundle_0 do
                local v201 = tostring(v200.id);
                local v202 = v189[v201];
                v198[v201] = v10.fromBundleItemData(v200, v202);
            end;
            v189 = v4.Dictionary.join(v189, v198);
        end;
        return v189;
    end or nil
});