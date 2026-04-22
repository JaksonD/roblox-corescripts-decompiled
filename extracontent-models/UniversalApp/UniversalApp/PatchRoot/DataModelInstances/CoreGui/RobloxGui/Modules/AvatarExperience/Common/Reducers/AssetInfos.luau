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
local l_WidgetConstants_0 = v8.WidgetConstants;
local v32 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
local l_PurchaseItemsSuccess_0 = v8.State.Actions.PurchaseItemsSuccess;
local l_FetchAssetOrBundleInfoBatchedSuccess_0 = v8.State.Actions.FetchAssetOrBundleInfoBatchedSuccess;
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v6.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v38 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearReceivedCatalogData);
local l_FFlagAXHydrateAssetFromBundleItems_0 = v7.FFlagAXHydrateAssetFromBundleItems;
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v7.FFlagAXInventoryDurablesExpiredFilter;
local l_FFlagAXSubscriptionRefetchClearCatalogData_0 = v7.FFlagAXSubscriptionRefetchClearCatalogData;
return v5.createReducer({}, {
    [v14.name] = function(v43, v44) --[[ Line: 63 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v44.assetId, "string", "assetId must be a string.");
        v3.isType(v44.assetData, "table", "assetData must be a table.");
        local v45 = tostring(v44.assetId);
        local v46 = v43[v45];
        local v47 = v10.fromGetCatalogItemData(v44.assetData, v46);
        return v4.Dictionary.join(v43, {
            [v45] = v47
        });
    end, 
    [v15.name] = function(v48, v49) --[[ Line: 76 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v49.assets, "table", "assets data must be a table.");
        local v50 = {};
        for _, v52 in v49.assets do
            local v53 = tostring(v52.id);
            local v54 = v48[v53];
            v50[v53] = v10.fromBundleItemData(v52, v54);
        end;
        return v4.Dictionary.join(v48, v50);
    end, 
    [v16.name] = function(v55, v56) --[[ Line: 90 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v56.sortResults, "table", "sortResults must be a table.");
        local v57 = {};
        for _, v59 in v56.sortResults do
            local v60 = tostring(v59.id);
            local v61 = v55[v60];
            v57[v60] = v10.fromSortResults(v59, v61);
        end;
        return v4.Dictionary.join(v55, v57);
    end, 
    [v17.name] = l_FFlagAXHydrateAssetFromBundleItems_0 and function(v62, v63) --[[ Line: 109 ]]
        -- upvalues: v25 (copy), v10 (copy), v4 (copy)
        local v64 = {};
        for _, v66 in v63.sortResults do
            if v66.bundledItems then
                for _, v68 in v66.bundledItems do
                    if v68.type == v25.ItemType.Asset then
                        local v69 = tostring(v68.id);
                        local v70 = v62[v69];
                        v64[v69] = v10.fromBundledItems(v68, v70);
                    end;
                end;
            end;
        end;
        return v4.Dictionary.join(v62, v64);
    end or nil, 
    [v11.name] = function(v71, v72) --[[ Line: 128 ]]
        -- upvalues: v3 (copy), v10 (copy), v25 (copy), v4 (copy)
        v3.isType(v72.recommendedItems, "table", "recommendedItems must be a table.");
        local v73 = tostring(v72.assetId);
        local v74 = {};
        local v75 = {};
        for _, v77 in v72.recommendedItems do
            local v78 = tostring(v77.item.assetId);
            local v79 = v71[v78];
            local v80 = v10.fromGetRecommendedItemsData(v77, v72.assetTypeId, v79);
            local l_assetTypeId_0 = v72.assetTypeId;
            v74[v78] = v80;
            table.insert(v75, {
                id = v78, 
                type = v25.ItemType.Asset, 
                subType = l_assetTypeId_0
            });
        end;
        local v82 = v71[v73];
        v74[v73] = v10.fromRecommendedItemSummaries(v75, v82);
        return v4.Dictionary.join(v71, v74);
    end, 
    [v23.name] = function(v83, v84) --[[ Line: 167 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v84.assetResaleData, "table", "assetResaleData must be a table.");
        local v85 = tostring(v84.assetId);
        local v86 = v83[v85];
        local v87 = v10.fromResaleData(v84.assetResaleData, v86);
        return v4.Dictionary.join(v83, {
            [v85] = v87
        });
    end, 
    [v12.name] = function(v88, v89) --[[ Line: 179 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v89.assets, "table", "assets must be a table.");
        local v90 = {};
        for _, v92 in v89.assets do
            local v93 = tostring(v92.assetId);
            local v94 = v88[v93];
            v90[v93] = v10.fromInventoryFetch(v92, v94);
        end;
        return v4.Dictionary.join(v88, v90);
    end, 
    [v13.name] = function(v95, v96) --[[ Line: 197 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v96.assets, "table", "assets must be a table.");
        local v97 = {};
        for _, v99 in v96.assets do
            local v100 = tostring(v99.id);
            local v101 = v95[v100];
            v97[v100] = v10.fromOutfitDetails(v99, v101, v96.outfitModerationStatus);
        end;
        return v4.Dictionary.join(v95, v97);
    end, 
    [v21.name] = function(v102, v103) --[[ Line: 212 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v103.assetId, "string", "assetId must be a sting.");
        v3.isType(v103.userAssetIds, "table", "userAssetIds must be a table.");
        local v104 = tostring(v103.assetId);
        local v105 = v102[v104];
        local v106 = v10.fromGetResellers(v103.userAssetIds, v105);
        return v4.Dictionary.join(v102, {
            [v104] = v106
        });
    end, 
    [v20.name] = function(v107, v108) --[[ Line: 224 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v108.assetId, "string", "assetId must be a sting.");
        v3.isType(v108.userAssetIds, "table", "userAssetIds must be a table.");
        local v109 = tostring(v108.assetId);
        local v110 = if v107[v109] then v107[v109] else v10.mock();
        local l_resellerUserAssetIds_0 = v110.resellerUserAssetIds;
        local v112 = nil;
        v112 = if l_resellerUserAssetIds_0 then v4.List.join(l_resellerUserAssetIds_0, v108.userAssetIds) else v108.userAssetIds;
        local v113 = v10.fromGetResellers(v112, v110);
        return v4.Dictionary.join(v107, {
            [v109] = v4.Dictionary.join(v110, v113)
        });
    end, 
    [v22.name] = function(v114, v115) --[[ Line: 246 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v115.assetId, "string", "assetId must be a sting.");
        v3.isType(v115.priceInRobux, "number", "price must be a number.");
        local l_assetId_0 = v115.assetId;
        local l_priceInRobux_0 = v115.priceInRobux;
        local v118 = v114[l_assetId_0];
        local v119 = v10.fromLowestPrice(l_priceInRobux_0, v118);
        return v4.Dictionary.join(v114, {
            [l_assetId_0] = v119
        });
    end, 
    [v18.name] = function(v120, v121) --[[ Line: 260 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v121.assets, "table", "assets must be a table.");
        v3.isType(v121.assetTypeId, "string", "assetTypeId must be a string.");
        local l_assetTypeId_1 = v121.assetTypeId;
        local v123 = {};
        for _, v125 in v121.assets do
            local v126 = tostring(v125.id);
            local v127 = v120[v126];
            v123[v126] = v10.fromGetRecommendedItemsDataV2(v125, l_assetTypeId_1, v127);
        end;
        return v4.Dictionary.join(v120, v123);
    end, 
    [v19.name] = function(v128, v129) --[[ Line: 281 ]]
        -- upvalues: v3 (copy), l_WidgetConstants_0 (copy), v10 (copy), v4 (copy)
        v3.isType(v129.payload, "table", "payload must be a table.");
        if not v129.payload[l_WidgetConstants_0.ContentType.Asset] then
            return v128;
        else
            local v130 = {};
            for _, v132 in v129.payload[l_WidgetConstants_0.ContentType.Asset] do
                local v133 = tostring(v132.id);
                local v134 = v128[v133];
                local v135 = v10.fromHydrateWidgetInfo(v132, v134);
                v130[v133] = v4.Dictionary.join(v135, v135);
            end;
            return v4.Dictionary.join(v128, v130);
        end;
    end, 
    [v26.name] = function(v136, v137) --[[ Line: 301 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v137.assetId, "string", "assetId must be a string.");
        v3.isType(v137.isOwned, "boolean", "isOwned must be a bool.");
        local v138 = tostring(v137.assetId);
        local v139 = v136[v138];
        local v140 = v10.fromIsOwned(v137.isOwned, v139);
        return v4.Dictionary.join(v136, {
            [v138] = v140
        });
    end, 
    [v27.name] = function(v141, v142) --[[ Line: 311 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local v143 = tostring(v142.assetTypeId);
        local v144 = tostring(v142.assetId);
        local v145 = v10.fromAssetGrant(v144, v143);
        local v146 = v141[v144];
        if v146 and v146.assetType then
            return v141;
        else
            if v146 then
                v145 = v4.Dictionary.join(v146, v145);
            end;
            return v4.Dictionary.join(v141, {
                [v144] = v145
            });
        end;
    end, 
    [v28.name] = function(v147, v148) --[[ Line: 331 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v148.assetId, "string", "assetId must be a string.");
        local v149 = tostring(v148.assetId);
        local v150 = v147[v149];
        local v151 = 1;
        if v150 and v150.updateCounter then
            v151 = v150.updateCounter + 1;
        end;
        local v152 = v10.fromModerationStatusUpdate(v148.moderationStatus, v151, v149, v148.assetName, v148.universeId, v150);
        return v4.Dictionary.join(v147, {
            [v149] = v152
        });
    end, 
    [v37.name] = function(v153, v154) --[[ Line: 351 ]]
        -- upvalues: v10 (copy), v4 (copy)
        local l_assets_0 = v154.avatarData.assets;
        if l_assets_0 == nil then
            return v153;
        else
            local v156 = {};
            for _, v158 in l_assets_0 do
                local v159 = tostring(v158.id);
                local v160 = v10.fromReceivedAvatarData(v158);
                local v161 = v153[v159];
                if not v161 then
                    v156[v159] = v160;
                else
                    v156[v159] = v4.Dictionary.join(v160, v161);
                end;
            end;
            return v4.Dictionary.join(v153, v156);
        end;
    end, 
    [v24.name] = function(v162, v163) --[[ Line: 388 ]]
        -- upvalues: v3 (copy), v10 (copy), v4 (copy)
        v3.isType(v163.assetVersionData, "table", "assetVersionData must be a table.");
        local v164 = tostring(v163.assetId);
        local v165 = v162[v164];
        local v166 = v10.fromVersionData(v163.assetVersionData, v165);
        return v4.Dictionary.join(v162, {
            [v164] = v166
        });
    end, 
    [v29.name] = v32.isEnabled() and function(v167, v168) --[[ Line: 401 ]]
        -- upvalues: v10 (copy)
        local v169 = table.clone(v167);
        for _, v171 in v168.outfits do
            local l_assetsToUpdate_0 = v171.assetsToUpdate;
            local l_outfitModerationStatus_0 = v171.outfitModerationStatus;
            if l_assetsToUpdate_0 then
                for _, v175 in l_assetsToUpdate_0 do
                    local v176 = tostring(v175.id);
                    v169[v176] = v10.fromOutfitDetails(v175, v167[v176], l_outfitModerationStatus_0);
                end;
            end;
        end;
        return v169;
    end or nil, 
    [v35.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v177, v178) --[[ Line: 421 ]]
        -- upvalues: v10 (copy)
        local v179 = table.clone(v177);
        local v180 = v178.assetData or {};
        for _, v182 in v180 do
            local v183 = tostring(v182.id);
            local v184 = v177[v183];
            v179[v183] = v10.fromSortResults(v182, v184);
        end;
        return v179;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v185, v186) --[[ Line: 435 ]]
        -- upvalues: v4 (copy)
        v185 = v185 or {};
        local v187 = {};
        for _, v189 in v186.items do
            if v189.itemType == Enum.AvatarItemType.Asset.Name then
                local v190 = tostring(v189.itemId);
                local v191 = v185[v190];
                if v191 then
                    v187[v190] = v4.Dictionary.join(v191, {
                        isOwned = true
                    });
                end;
            end;
        end;
        return v4.Dictionary.join(v185, v187);
    end or nil, 
    [l_FetchAssetOrBundleInfoBatchedSuccess_0.name] = (not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXInventoryDurablesExpiredFilter_0) and function(v192, v193) --[[ Line: 458 ]]
        -- upvalues: v10 (copy), v4 (copy)
        v192 = v192 or {};
        local l_hydratedAssets_0 = v193.hydratedAssets;
        local l_assetsInBundle_0 = v193.assetsInBundle;
        if #l_hydratedAssets_0 > 0 then
            local v196 = {};
            for _, v198 in l_hydratedAssets_0 do
                local v199 = tostring(v198.id);
                local v200 = v192[v199];
                v196[v199] = v10.fromGetCatalogItemData(v198, v200);
            end;
            v192 = v4.Dictionary.join(v192, v196);
        end;
        if #l_assetsInBundle_0 > 0 then
            local v201 = {};
            for _, v203 in l_assetsInBundle_0 do
                local v204 = tostring(v203.id);
                local v205 = v192[v204];
                v201[v204] = v10.fromBundleItemData(v203, v205);
            end;
            v192 = v4.Dictionary.join(v192, v201);
        end;
        return v192;
    end or nil, 
    [v38.name] = l_FFlagAXSubscriptionRefetchClearCatalogData_0 and function(v206) --[[ Line: 497 ]]
        -- upvalues: v4 (copy)
        local v207 = {};
        for v208, v209 in v206 do
            if v209.receivedCatalogData then
                v207[v208] = v4.Dictionary.join(v209, {
                    receivedCatalogData = false
                });
            end;
        end;
        if next(v207) == nil then
            return v206;
        else
            return v4.Dictionary.join(v206, v207);
        end;
    end or nil
});