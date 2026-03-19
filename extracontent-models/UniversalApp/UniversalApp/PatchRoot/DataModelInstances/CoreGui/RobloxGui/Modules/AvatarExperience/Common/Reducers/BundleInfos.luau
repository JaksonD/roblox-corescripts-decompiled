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
local v20 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v6.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
return v3.createReducer({}, {
    [v13.name] = function(v25, v26) --[[ Line: 43 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v26.bundleId, "string", "bundleId must be a string.");
        v4.isType(v26.bundleData, "table", "bundleData must be a table.");
        local v27 = tostring(v26.bundleId);
        local v28 = v25[v27];
        local v29 = v10.fromGetCatalogItemData(v26.bundleData, v28);
        return v5.Dictionary.join(v25, {
            [v27] = v29
        });
    end, 
    [v15.name] = function(v30, v31) --[[ Line: 55 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v31.bundles, "table", "bundles must be a table.");
        local v32 = {};
        for _, v34 in v31.bundles do
            local v35 = tostring(v34.id);
            local v36 = v30[v35];
            v32[v35] = v10.fromGetRecommendedItemsDataV2(v34, v36);
        end;
        return v5.Dictionary.join(v30, v32);
    end, 
    [v16.name] = function(v37, v38) --[[ Line: 71 ]]
        -- upvalues: v4 (copy), v20 (copy), v10 (copy), v5 (copy)
        v4.isType(v38.payload, "table", "payload must be a table.");
        if not v38.payload[v20.ContentType.Bundle] then
            return v37;
        else
            local v39 = {};
            for _, v41 in v38.payload[v20.ContentType.Bundle] do
                local v42 = tostring(v41.id);
                local v43 = v37[v42];
                v39[v42] = v10.fromHydrateWidgetInfo(v41, v43);
            end;
            return v5.Dictionary.join(v37, v39);
        end;
    end, 
    [v14.name] = function(v44, v45) --[[ Line: 88 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v45.sortResults, "table", "sortResults must be a table.");
        local v46 = {};
        for _, v48 in v45.sortResults do
            local v49 = tostring(v48.id);
            local v50 = v44[v49];
            v46[v49] = v10.fromSortResults(v48, v50);
        end;
        return v5.Dictionary.join(v44, v46);
    end, 
    [v12.name] = function(v51, v52) --[[ Line: 105 ]]
        -- upvalues: v4 (copy), v10 (copy), v11 (copy), v5 (copy)
        v4.isType(v52.bundleId, "string", "bundleId must be a string.");
        v4.isType(v52.recommendedItems, "table", "recommendedItems must be a table.");
        local v53 = tostring(v52.bundleId);
        local v54 = {};
        local v55 = {};
        for _, v57 in v52.recommendedItems do
            local v58 = tostring(v57.id);
            local v59 = v51[v58];
            v54[v58] = v10.fromGetRecommendedItemsDataV2(v57, v59);
            v55[#v55 + 1] = {
                id = v58, 
                type = v11.ItemType.Bundle, 
                subType = tostring(v57.bundleType)
            };
        end;
        local v60 = v51[v53];
        v54[v53] = v10.fromRecommendedItemSummaries(v55, v60);
        return v5.Dictionary.join(v51, v54);
    end, 
    [v17.name] = function(v61, v62) --[[ Line: 134 ]]
        -- upvalues: v4 (copy), v10 (copy), v5 (copy)
        v4.isType(v62.bundleId, "string", "bundleId must be a string.");
        v4.isType(v62.isOwned, "boolean", "isOwned must be a bool.");
        local v63 = tostring(v62.bundleId);
        local v64 = v61[v63];
        local v65 = v10.fromIsOwned(v62.isOwned, v64);
        return v5.Dictionary.join(v61, {
            [v63] = v65
        });
    end, 
    [v22.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v66, v67) --[[ Line: 145 ]]
        -- upvalues: v10 (copy)
        local v68 = table.clone(v66);
        local v69 = v67.bundleData or {};
        for _, v71 in v69 do
            local v72 = tostring(v71.id);
            local v73 = v66[v72];
            v68[v72] = v10.fromSortResults(v71, v73);
        end;
        return v68;
    end or nil, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v74, v75) --[[ Line: 159 ]]
        -- upvalues: v5 (copy)
        v74 = v74 or {};
        local v76 = {};
        for _, v78 in v75.items do
            if v78.itemType == Enum.AvatarItemType.Bundle.Name then
                local v79 = tostring(v78.itemId);
                local v80 = v74[v79];
                if v80 then
                    v76[v79] = v5.Dictionary.join(v80, {
                        isOwned = true
                    });
                end;
            end;
        end;
        return v5.Dictionary.join(v74, v76);
    end or nil, 
    [l_FetchAssetOrBundleInfoBatchedSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v81, v82) --[[ Line: 181 ]]
        -- upvalues: v10 (copy), v5 (copy)
        v81 = v81 or {};
        local l_hydratedBundles_0 = v82.hydratedBundles;
        local v84 = {};
        for _, v86 in l_hydratedBundles_0 do
            local v87 = tostring(v86.id);
            local v88 = v81[v87];
            v84[v87] = v10.fromGetCatalogItemData(v86, v88);
        end;
        return v5.Dictionary.join(v81, v84);
    end or nil
});