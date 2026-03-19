local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetBundles);
local v5 = require(l_Parent_0.Actions.SetFavoriteBundle);
local v6 = require(l_Parent_0.Actions.UpdateBulkPuchaseResults);
local v7 = require(l_Parent_0.Actions.SetAvatarPreviewDetails);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v9 = require(l_Parent_0.Flags.FFlagAXEnableFetchAvatarPreview);
local l_FFlagAXEnableInspectAndBuyBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase;
local v11 = require(l_Parent_0.Flags.FFlagAXEnableFavoritesInfoForAssetsAndBundles);
local v12 = require(l_Parent_0.Models.BundleInfo);
return v2.createReducer({}, {
    [v5.name] = v11 and function(v13, v14) --[[ Line: 35 ]]
        -- upvalues: v1 (copy), v12 (copy)
        local v15 = v13[v14.id] or {};
        local v16 = v1.Dictionary.join({}, v15);
        v13[v14.id] = v1.Dictionary.join(v16, v12.fromGetFavoriteForAsset(v14.id, v14.isFavorite));
        return v13;
    end or nil, 
    [v6.name] = l_FFlagAXEnableInspectAndBuyBulkPurchase_0 and function(v17, v18) --[[ Line: 47 ]]
        -- upvalues: v1 (copy), v12 (copy)
        for _, v20 in v18.result.Items do
            if v20.type == Enum.MarketplaceProductType.AvatarBundle then
                local v21 = v1.Dictionary.join({}, v17[v20.id]);
                v17[v20.id] = v1.Dictionary.join(v21, v12.fromBulkPurchaseResult(v20, v21));
            end;
        end;
        return v17;
    end or nil, 
    [v7.name] = v9 and function(v22, v23) --[[ Line: 63 ]]
        -- upvalues: l_ItemTypeEnum_0 (copy), v12 (copy), v1 (copy)
        local l_look_0 = v23.avatarPreviewDetails.look;
        local v25 = {};
        if l_look_0.items then
            for _, v27 in l_look_0.items do
                if v27.itemType == l_ItemTypeEnum_0.Bundle then
                    v25[tostring(v27.id)] = v12.fromAvatarPreviewItem(v27);
                end;
            end;
        end;
        return v1.Dictionary.join(v22, v25);
    end or nil, 
    [v4.name] = function(v28, v29) --[[ Line: 80 ]]
        -- upvalues: v11 (copy), v1 (copy), v12 (copy)
        local v30 = {};
        for _, v32 in ipairs(v29.bundles) do
            assert(v32.bundleId ~= nil, "Expected a bundle id when setting a bundle's information.");
            local v33 = v28[v32.bundleId] or {};
            if v11 and v32.assetsInBundle then
                local v34 = {};
                for _, v36 in v32.assetsInBundle do
                    local v37 = v33.assetsInBundle or {};
                    for _, v39 in v37 do
                        if v39.id == v36.id then
                            table.insert(v34, (v1.Dictionary.join(v39, v36)));
                            break;
                        end;
                    end;
                end;
                v32.assetsInBundle = v34;
            end;
            v30[v32.bundleId] = v1.Dictionary.join(v33, v32);
            if v30[v32.bundleId] then
                v30[v32.bundleId] = v12.getSaleDetailsForCollectibles(v30[v32.bundleId]);
            end;
        end;
        return v1.Dictionary.join(v28, v30);
    end
});