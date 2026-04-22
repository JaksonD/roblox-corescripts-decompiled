local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v10 = require(l_Modules_0.AvatarExperience.Common.Models.BundleInfo);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedBundlesAction);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local l_PurchaseItemsSuccess_0 = v8.State.Actions.PurchaseItemsSuccess;
local l_FetchAssetOrBundleInfoBatchedSuccess_0 = v8.State.Actions.FetchAssetOrBundleInfoBatchedSuccess;
local l_WidgetConstants_0 = v8.WidgetConstants;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v6.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
local v25 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearReceivedCatalogData);
local l_FFlagAXSubscriptionRefetchClearCatalogData_0 = v7.FFlagAXSubscriptionRefetchClearCatalogData;
return v3.createReducer({}, {
    [v13.name] = function(v27, v28) --[[ Line: 45 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v28.bundleId, "string", "bundleId must be a string.");
        v4.isType(v28.bundleData, "table", "bundleData must be a table.");
        local v29 = tostring(v28.bundleId);
        local v30 = v27[v29];
        local v31 = v10.fromGetCatalogItemData(v28.bundleData, v30);
        return v5.Dictionary.join(v27, {
            [v29] = v31
        });
    end, 
    [v15.name] = function(v32, v33) --[[ Line: 57 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v33.bundles, "table", "bundles must be a table.");
        local v34 = {};
        for _, v36 in v33.bundles do
            local v37 = tostring(v36.id);
            local v38 = v32[v37];
            v34[v37] = v10.fromGetRecommendedItemsDataV2(v36, v38);
        end;
        return v5.Dictionary.join(v32, v34);
    end, 
    [v16.name] = function(v39, v40) --[[ Line: 73 ]]
        -- upvalues: v4 (copy), l_WidgetConstants_0 (copy), v10 (copy), v5 (copy)
        v4.isType(v40.payload, "table", "payload must be a table.");
        if not v40.payload[l_WidgetConstants_0.ContentType.Bundle] then
            return v39;
        else
            local v41 = {};
            for _, v43 in v40.payload[l_WidgetConstants_0.ContentType.Bundle] do
                local v44 = tostring(v43.id);
                local v45 = v39[v44];
                v41[v44] = v10.fromHydrateWidgetInfo(v43, v45);
            end;
            return v5.Dictionary.join(v39, v41);
        end;
    end, 
    [v14.name] = function(v46, v47) --[[ Line: 90 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v47.sortResults, "table", "sortResults must be a table.");
        local v48 = {};
        for _, v50 in v47.sortResults do
            local v51 = tostring(v50.id);
            local v52 = v46[v51];
            v48[v51] = v10.fromSortResults(v50, v52);
        end;
        return v5.Dictionary.join(v46, v48);
    end, 
    [v12.name] = function(v53, v54) --[[ Line: 107 ]]
        -- upvalues: v4 (copy), v10 (copy), v11 (copy), v5 (copy)
        v4.isType(v54.bundleId, "string", "bundleId must be a string.");
        v4.isType(v54.recommendedItems, "table", "recommendedItems must be a table.");
        local v55 = tostring(v54.bundleId);
        local v56 = {};
        local v57 = {};
        for _, v59 in v54.recommendedItems do
            local v60 = tostring(v59.id);
            local v61 = v53[v60];
            v56[v60] = v10.fromGetRecommendedItemsDataV2(v59, v61);
            v57[#v57 + 1] = {
                id = v60, 
                type = v11.ItemType.Bundle, 
                subType = tostring(v59.bundleType)
            };
        end;
        local v62 = v53[v55];
        v56[v55] = v10.fromRecommendedItemSummaries(v57, v62);
        return v5.Dictionary.join(v53, v56);
    end, 
    [v17.name] = function(v63, v64) --[[ Line: 136 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v64.bundleId, "string", "bundleId must be a string.");
        v4.isType(v64.isOwned, "boolean", "isOwned must be a bool.");
        local v65 = tostring(v64.bundleId);
        local v66 = v63[v65];
        local v67 = v10.fromIsOwned(v64.isOwned, v66);
        return v5.Dictionary.join(v63, {
            [v65] = v67
        });
    end, 
    [v22.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v68, v69) --[[ Line: 147 ]]
        -- upvalues: v10 (copy)
        local v70 = table.clone(v68);
        local v71 = v69.bundleData or {};
        for _, v73 in v71 do
            local v74 = tostring(v73.id);
            local v75 = v68[v74];
            v70[v74] = v10.fromSortResults(v73, v75);
        end;
        return v70;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v76, v77) --[[ Line: 161 ]]
        -- upvalues: v5 (copy)
        v76 = v76 or {};
        local v78 = {};
        for _, v80 in v77.items do
            if v80.itemType == Enum.AvatarItemType.Bundle.Name then
                local v81 = tostring(v80.itemId);
                local v82 = v76[v81];
                if v82 then
                    v78[v81] = v5.Dictionary.join(v82, {
                        isOwned = true
                    });
                end;
            end;
        end;
        return v5.Dictionary.join(v76, v78);
    end or nil, 
    [l_FetchAssetOrBundleInfoBatchedSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v83, v84) --[[ Line: 183 ]]
        -- upvalues: v10 (copy), v5 (copy)
        v83 = v83 or {};
        local l_hydratedBundles_0 = v84.hydratedBundles;
        local v86 = {};
        for _, v88 in l_hydratedBundles_0 do
            local v89 = tostring(v88.id);
            local v90 = v83[v89];
            v86[v89] = v10.fromGetCatalogItemData(v88, v90);
        end;
        return v5.Dictionary.join(v83, v86);
    end or nil, 
    [v25.name] = l_FFlagAXSubscriptionRefetchClearCatalogData_0 and function(v91) --[[ Line: 203 ]]
        -- upvalues: v5 (copy)
        local v92 = {};
        for v93, v94 in v91 do
            if v94.receivedCatalogData then
                v92[v93] = v5.Dictionary.join(v94, {
                    receivedCatalogData = false
                });
            end;
        end;
        if next(v92) == nil then
            return v91;
        else
            return v5.Dictionary.join(v91, v92);
        end;
    end or nil
});