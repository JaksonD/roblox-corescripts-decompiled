local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v30 = l_memoize_0(function(v8, v9, v10, v11, v12, v13) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy)
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    assert(v8, "silence type checker");
    v14 = v8.isOwned;
    v15 = v8.isPurchasable;
    v16 = v5.IsResellable(v8);
    v17 = v8.isForRent;
    v18 = v8.collectibleItemId;
    v19 = v8.timedOptions and v8.isPurchasable;
    local v20 = v16 and v9 == nil;
    local l_None_0 = v3.ResaleRestriction.None;
    local v22 = true;
    local v23 = true;
    local v24 = not v14 and not v15 or v20 or v17 or v10 == nil;
    local v25 = nil;
    if v18 then
        local v26 = v11[v18];
        if v16 then
            if v13 and v26 then
                v26.resaleRestriction = v3.ResaleRestriction.Disabled;
            end;
            local v27 = v26 and v26.hasResellers;
            l_None_0 = if v26 then v26.resaleRestriction else v3.ResaleRestriction.None;
            v23 = v26 and v26.unitsAvailableForConsumption and v26.unitsAvailableForConsumption > 0;
            v22 = v5.isCollectibleSellableInShop(v26);
            v25 = not v27 and v5.reachQuantityLimit(v26, v12);
            v24 = not v22 or v17 or v10 == nil or v25;
        elseif v26 then
            v24 = v24 or not v5.isOriginalStockSellableInShop(v26);
        end;
    end;
    local v28 = v14 and (not (v16 and v22) or v25) and not v19;
    local l_assetType_0 = v8.assetType;
    if l_assetType_0 and v2.AssetTypeIdStringToName[l_assetType_0] == nil and v28 then
        v24 = true;
        v28 = false;
    end;
    if v28 then
        return v2.ItemPromptType.OpenGoToAvatarEditorPrompt;
    elseif v18 and l_None_0 == v3.ResaleRestriction.Disabled and not v23 then
        return v2.ItemPromptType.SoldOut;
    elseif v24 then
        return v2.ItemPromptType.Disabled;
    else
        return v2.ItemPromptType.OpenPurchasePrompt;
    end;
end);
return function(v31, v32, v33, v34) --[[ Line: 106 ]]
    -- upvalues: v4 (copy), v2 (copy), l_getAppFeaturePolicies_0 (copy), v30 (copy)
    local v35 = v4(v31.AvatarExperience.Common, v32, v33);
    local v36 = nil;
    local v37 = nil;
    if not v35 then
        return v2.ItemPromptType.Disabled;
    else
        assert(v35, "silence type checker");
        v36 = v35.resellerUserAssetIds;
        v37 = v35.collectibleItemId;
        local v38 = v36 and v36[1];
        local v39 = v31.AvatarExperience.Catalog.UserAssets[v38];
        local v40 = v31.UserRobux[v31.LocalUserId];
        local l_CollectiblesItemInfo_0 = v31.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
        local v42 = nil;
        if v37 then
            v42 = v31.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v37];
        end;
        local v43 = nil;
        v43 = if v34 and v34.DisableResellingCollectiblesForCompliance then v34.DisableResellingCollectiblesForCompliance else l_getAppFeaturePolicies_0().getDisableResellingCollectiblesForCompliance();
        return v30(v35, v39, v40, l_CollectiblesItemInfo_0, v42, v43);
    end;
end;