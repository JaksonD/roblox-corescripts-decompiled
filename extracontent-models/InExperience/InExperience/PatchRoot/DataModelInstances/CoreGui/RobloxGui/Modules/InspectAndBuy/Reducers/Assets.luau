local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetBundlesAssetIsPartOf);
local v7 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local v8 = require(l_Parent_0.Actions.SetAvatarPreviewDetails);
local v9 = require(l_Parent_0.Actions.SetFavoriteAsset);
local v10 = require(l_Parent_0.Actions.UpdateBulkPuchaseResults);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v12 = require(l_Parent_0.Flags.FFlagAXEnableFetchAvatarPreview);
local l_FFlagAXEnableInspectAndBuyBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase;
local v14 = require(l_Parent_0.Flags.FFlagAXEnableFavoritesInfoForAssetsAndBundles);
return v2.createReducer({}, {
    [v9.name] = v14 and function(v15, v16) --[[ Line: 26 ]]
        -- upvalues: v1 (copy), v4 (copy)
        local v17 = v15[v16.id] or {};
        local v18 = v1.Dictionary.join({}, v17);
        v15[v16.id] = v1.Dictionary.join(v18, v4.fromGetFavoriteForAsset(v16.id, v16.isFavorite));
        return v15;
    end or nil, 
    [v10.name] = l_FFlagAXEnableInspectAndBuyBulkPurchase_0 and function(v19, v20) --[[ Line: 38 ]]
        -- upvalues: v1 (copy), v4 (copy)
        for _, v22 in v20.result.Items do
            if v22.type == Enum.MarketplaceProductType.AvatarAsset then
                local v23 = v1.Dictionary.join({}, v19[v22.id]);
                v19[v22.id] = v1.Dictionary.join(v23, v4.fromBulkPurchaseResult(v22, v23));
            end;
        end;
        return v19;
    end or nil, 
    [v5.name] = function(v24, v25) --[[ Line: 53 ]]
        -- upvalues: v1 (copy), v4 (copy)
        local v26 = {};
        for _, v28 in ipairs(v25.assets) do
            assert(v28.assetId ~= nil, "Expected an asset id when setting an asset's information.");
            local v29 = v24[v28.assetId] or {};
            v26[v28.assetId] = v1.Dictionary.join(v29, v28);
            if v26[v28.assetId] then
                v26[v28.assetId] = v4.getSaleDetailsForCollectibles(v26[v28.assetId]);
            end;
        end;
        return (v1.Dictionary.join(v24, v26));
    end, 
    [v8.name] = v12 and function(v30, v31) --[[ Line: 74 ]]
        -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy), v1 (copy)
        local l_look_0 = v31.avatarPreviewDetails.look;
        if l_look_0.items then
            local v33 = {};
            for _, v35 in l_look_0.items do
                if v35.itemType == l_ItemTypeEnum_0.Asset then
                    v33[tostring(v35.id)] = v4.fromAvatarPreviewItem(v35);
                end;
            end;
            return v1.Dictionary.join(v30, v33);
        else
            return v30;
        end;
    end or nil, 
    [v6.name] = function(v36, v37) --[[ Line: 95 ]]
        -- upvalues: v4 (copy), v1 (copy)
        local v38 = tostring(v37.assetId);
        local l_bundleIds_0 = v37.bundleIds;
        local v40 = v36[v38] or {};
        local v41 = v4.fromGetAssetBundles(v38, l_bundleIds_0);
        v41 = v1.Dictionary.join(v40, v41);
        return v1.Dictionary.join(v36, {
            [v38] = v41
        });
    end, 
    [v7.name] = function(v42, v43) --[[ Line: 104 ]]
        -- upvalues: v4 (copy), v1 (copy)
        local l_bundleInfo_0 = v43.bundleInfo;
        local v45 = tostring(v43.assetId);
        local v46 = v42[v45] or {};
        local v47 = v4.fromBundleInfo(v45, l_bundleInfo_0);
        v47 = v1.Dictionary.join(v46, v47);
        return v1.Dictionary.join(v42, {
            [v45] = v47
        });
    end
});