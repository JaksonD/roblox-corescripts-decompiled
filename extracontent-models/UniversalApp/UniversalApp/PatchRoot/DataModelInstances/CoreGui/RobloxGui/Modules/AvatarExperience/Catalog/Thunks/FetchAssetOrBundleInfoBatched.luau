local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleItemDataBatched);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData);
local l_FetchAssetOrBundleInfoBatchedSuccess_0 = v3.State.Actions.FetchAssetOrBundleInfoBatchedSuccess;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v4.FFlagAXInventoryDurablesExpiredFilter;
local function _(v18) --[[ Line: 29 ]] --[[ Name: keyMapper ]]
    -- upvalues: v9 (copy)
    return v9.GetBatchItemDetailsKey(v18);
end;
local function _(v20, v21) --[[ Line: 33 ]] --[[ Name: checkIfReceivedFromBundleItemData ]]
    local v22 = v20.AvatarExperience.Common.AssetInfos[v21];
    if v22 and v22.receivedFromBundleItemData then
        return true;
    else
        return false;
    end;
end;
local function v30(v24, v25, v26, v27) --[[ Line: 41 ]]
    -- upvalues: v12 (copy), v11 (copy), v6 (copy), v13 (copy), v2 (copy)
    local v28 = {};
    local l_LocalUserId_0 = v24:getState().LocalUserId;
    table.insert(v28, v24:dispatch(v12(v25, v26, l_LocalUserId_0)));
    if v27 then
        table.insert(v28, v24:dispatch(v11(v25, v26, nil, v6.MaxResellersPerPage)));
        table.insert(v28, v24:dispatch(v13(v25, v26)));
    end;
    return v2.all(v28);
end;
return function(v31, _, v33, v34) --[[ Line: 68 ]]
    -- upvalues: l_PerformFetch_0 (copy), v9 (copy), v5 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v7 (copy), v30 (copy), l_FetchAssetOrBundleInfoBatchedSuccess_0 (copy), v10 (copy)
    return function(v35, _) --[[ Line: 69 ]]
        -- upvalues: v33 (copy), l_PerformFetch_0 (ref), v9 (ref), v5 (ref), v31 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v34 (copy), v7 (ref), v30 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v10 (ref)
        local v37 = {};
        local v38 = {};
        local v39 = {};
        for _, v41 in v33 do
            table.insert(v37, v41.id);
            local v42 = tonumber(v41.id);
            if v42 then
                table.insert(v38, {
                    id = v42, 
                    itemType = v41.itemType
                });
                v39[v42] = v41;
            end;
        end;
        return l_PerformFetch_0.Single(v9.GetBatchItemDetailsKey(v37), function(v43) --[[ Line: 87 ]]
            -- upvalues: v5 (ref), v31 (ref), v38 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v39 (copy), v34 (ref), v7 (ref), v30 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v10 (ref)
            local v44 = {};
            return v5.FetchItemDetails(v31, v38):andThen(function(v45) --[[ Line: 89 ]]
                -- upvalues: v43 (copy), v44 (ref), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v39 (ref), v34 (ref), v7 (ref), v30 (ref), v31 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v10 (ref)
                local v46 = v43:getState();
                v44 = if v45.responseBody and v45.responseBody.data then v45.responseBody.data else {};
                local v47 = {};
                local v48 = {};
                local v49 = {};
                for _, v51 in v44 do
                    if l_FFlagAXInventoryDurablesExpiredFilter_0 then
                        local v52 = v39[v51.id];
                        if v52 then
                            local v53 = false;
                            if v52.quantityOwned ~= nil then
                                v53 = v52.quantityOwned > 0;
                            end;
                            v51.owned = v53;
                            v51.isPurchasable = v52.isPurchasable;
                        end;
                    else
                        v51.owned = v39[v51.id].quantityOwned > 0;
                        v51.isPurchasable = v39[v51.id].isPurchasable;
                    end;
                    if l_FFlagAXInventoryDurablesExpiredFilter_0 and v34 then
                        v51.skipReceivedCatalogData = true;
                    end;
                    if l_FFlagAXInventoryDurablesExpiredFilter_0 and v51.assetType and type(v51.assetType) == "number" then
                        v51.assetType = v7.AssetTypeIdStringToName[tostring(v51.assetType)];
                    end;
                    local l_itemType_0 = v51.itemType;
                    if l_itemType_0 == v7.ItemType.Bundle then
                        table.insert(v47, v51);
                        if v51.bundledItems then
                            for _, v56 in v51.bundledItems do
                                local v57 = tostring(v56.id);
                                if v56.Type == v7.ItemType.Asset then
                                    local v58 = v46.AvatarExperience.Common.AssetInfos[v57];
                                    if not (v58 and v58.receivedFromBundleItemData and true or false) then
                                        table.insert(v48, v56);
                                    end;
                                end;
                            end;
                        end;
                    elseif l_itemType_0 == v7.ItemType.Asset then
                        table.insert(v49, v51);
                    end;
                    local l_collectibleItemId_0 = v51.collectibleItemId;
                    local l_hasResellers_0 = v51.hasResellers;
                    if l_collectibleItemId_0 then
                        v30(v43, v31, l_collectibleItemId_0, l_hasResellers_0);
                    end;
                end;
                local v61 = {};
                for _, v63 in v44 do
                    if v63.collectibleItemId then
                        table.insert(v61, v63.collectibleItemId);
                    end;
                end;
                v43:dispatch(l_FetchAssetOrBundleInfoBatchedSuccess_0({
                    hydratedBundles = v47, 
                    assetsInBundle = v48, 
                    hydratedAssets = v49
                }));
                v43:dispatch(v10(v31, v61));
            end);
        end)(v35);
    end;
end;