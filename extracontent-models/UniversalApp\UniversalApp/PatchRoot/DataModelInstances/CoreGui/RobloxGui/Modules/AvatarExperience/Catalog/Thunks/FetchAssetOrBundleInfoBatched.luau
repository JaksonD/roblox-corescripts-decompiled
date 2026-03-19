local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleItemDataBatched);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData);
local l_FetchAssetOrBundleInfoBatchedSuccess_0 = v3.State.Actions.FetchAssetOrBundleInfoBatchedSuccess;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v16) --[[ Line: 26 ]] --[[ Name: keyMapper ]]
    -- upvalues: v8 (copy)
    return v8.GetBatchItemDetailsKey(v16);
end;
local function _(v18, v19) --[[ Line: 30 ]] --[[ Name: checkIfReceivedFromBundleItemData ]]
    local v20 = v18.AvatarExperience.Common.AssetInfos[v19];
    if v20 and v20.receivedFromBundleItemData then
        return true;
    else
        return false;
    end;
end;
local function v28(v22, v23, v24, v25) --[[ Line: 38 ]]
    -- upvalues: v11 (copy), v10 (copy), v5 (copy), v12 (copy), v2 (copy)
    local v26 = {};
    local l_LocalUserId_0 = v22:getState().LocalUserId;
    table.insert(v26, v22:dispatch(v11(v23, v24, l_LocalUserId_0)));
    if v25 then
        table.insert(v26, v22:dispatch(v10(v23, v24, nil, v5.MaxResellersPerPage)));
        table.insert(v26, v22:dispatch(v12(v23, v24)));
    end;
    return v2.all(v26);
end;
return function(v29, _, v31) --[[ Line: 65 ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v4 (copy), v6 (copy), v28 (copy), l_FetchAssetOrBundleInfoBatchedSuccess_0 (copy), v9 (copy)
    return function(v32, _) --[[ Line: 66 ]]
        -- upvalues: v31 (copy), l_PerformFetch_0 (ref), v8 (ref), v4 (ref), v29 (copy), v6 (ref), v28 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v9 (ref)
        local v34 = {};
        local v35 = {};
        local v36 = {};
        for _, v38 in v31 do
            table.insert(v34, v38.id);
            local v39 = tonumber(v38.id);
            if v39 then
                table.insert(v35, {
                    id = v39, 
                    itemType = v38.itemType
                });
                v36[v39] = v38;
            end;
        end;
        return l_PerformFetch_0.Single(v8.GetBatchItemDetailsKey(v34), function(v40) --[[ Line: 84 ]]
            -- upvalues: v4 (ref), v29 (ref), v35 (copy), v36 (copy), v6 (ref), v28 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v9 (ref)
            local v41 = {};
            return v4.FetchItemDetails(v29, v35):andThen(function(v42) --[[ Line: 86 ]]
                -- upvalues: v40 (copy), v41 (ref), v36 (ref), v6 (ref), v28 (ref), v29 (ref), l_FetchAssetOrBundleInfoBatchedSuccess_0 (ref), v9 (ref)
                local v43 = v40:getState();
                v41 = if v42.responseBody and v42.responseBody.data then v42.responseBody.data else {};
                local v44 = {};
                local v45 = {};
                local v46 = {};
                for _, v48 in v41 do
                    v48.owned = v36[v48.id].quantityOwned > 0;
                    v48.isPurchasable = v36[v48.id].isPurchasable;
                    local l_itemType_0 = v48.itemType;
                    if l_itemType_0 == v6.ItemType.Bundle then
                        table.insert(v44, v48);
                        if v48.bundledItems then
                            for _, v51 in v48.bundledItems do
                                local v52 = tostring(v51.id);
                                if v51.Type == v6.ItemType.Asset then
                                    local v53 = v43.AvatarExperience.Common.AssetInfos[v52];
                                    if not (v53 and v53.receivedFromBundleItemData and true or false) then
                                        table.insert(v45, v51);
                                    end;
                                end;
                            end;
                        end;
                    elseif l_itemType_0 == v6.ItemType.Asset then
                        table.insert(v46, v48);
                    end;
                    local l_collectibleItemId_0 = v48.collectibleItemId;
                    local l_hasResellers_0 = v48.hasResellers;
                    if l_collectibleItemId_0 then
                        v28(v40, v29, l_collectibleItemId_0, l_hasResellers_0);
                    end;
                end;
                local v56 = {};
                for _, v58 in v41 do
                    if v58.collectibleItemId then
                        table.insert(v56, v58.collectibleItemId);
                    end;
                end;
                v40:dispatch(l_FetchAssetOrBundleInfoBatchedSuccess_0({
                    hydratedBundles = v44, 
                    assetsInBundle = v45, 
                    hydratedAssets = v46
                }));
                v40:dispatch(v9(v29, v56));
            end);
        end)(v32);
    end;
end;