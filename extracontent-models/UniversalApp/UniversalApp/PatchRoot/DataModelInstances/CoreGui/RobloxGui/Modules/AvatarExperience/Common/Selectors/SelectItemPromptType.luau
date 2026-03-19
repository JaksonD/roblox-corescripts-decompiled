local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v31 = l_memoize_0(function(v9, v10, v11, v12, v13, v14) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_FFlagAXDurablesSupport_0 (copy), v3 (copy), v2 (copy)
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    assert(v9, "silence type checker");
    v15 = v9.isOwned;
    v16 = v9.isPurchasable;
    v17 = v5.IsResellable(v9);
    v18 = v9.isForRent;
    v19 = v9.collectibleItemId;
    if l_FFlagAXDurablesSupport_0 then
        v20 = v9.timedOptions and v9.isPurchasable;
    end;
    local v21 = v17 and v10 == nil;
    local l_None_0 = v3.ResaleRestriction.None;
    local v23 = true;
    local v24 = true;
    local v25 = not v15 and not v16 or v21 or v18 or v11 == nil;
    local v26 = nil;
    if v19 then
        local v27 = v12[v19];
        if v17 then
            if v14 and v27 then
                v27.resaleRestriction = v3.ResaleRestriction.Disabled;
            end;
            local v28 = v27 and v27.hasResellers;
            l_None_0 = if v27 then v27.resaleRestriction else v3.ResaleRestriction.None;
            v24 = v27 and v27.unitsAvailableForConsumption and v27.unitsAvailableForConsumption > 0;
            v23 = v5.isCollectibleSellableInShop(v27);
            v26 = not v28 and v5.reachQuantityLimit(v27, v13);
            v25 = not v23 or v18 or v11 == nil or v26;
        elseif v27 then
            v25 = v25 or not v5.isOriginalStockSellableInShop(v27);
        end;
    end;
    local v29 = nil;
    v29 = if l_FFlagAXDurablesSupport_0 then v15 and (not (v17 and v23) or v26) and not v20 else v15 and (not v17 or not v23 or v26);
    local l_assetType_0 = v9.assetType;
    if l_assetType_0 and v2.AssetTypeIdStringToName[l_assetType_0] == nil and v29 then
        v25 = true;
        v29 = false;
    end;
    if v29 then
        return v2.ItemPromptType.OpenGoToAvatarEditorPrompt;
    elseif v19 and l_None_0 == v3.ResaleRestriction.Disabled and not v24 then
        return v2.ItemPromptType.SoldOut;
    elseif v25 then
        return v2.ItemPromptType.Disabled;
    else
        return v2.ItemPromptType.OpenPurchasePrompt;
    end;
end);
return function(v32, v33, v34, v35) --[[ Line: 114 ]]
    -- upvalues: v4 (copy), v2 (copy), l_getAppFeaturePolicies_0 (copy), v31 (copy)
    local v36 = v4(v32.AvatarExperience.Common, v33, v34);
    local v37 = nil;
    local v38 = nil;
    if not v36 then
        return v2.ItemPromptType.Disabled;
    else
        assert(v36, "silence type checker");
        v37 = v36.resellerUserAssetIds;
        v38 = v36.collectibleItemId;
        local v39 = v37 and v37[1];
        local v40 = v32.AvatarExperience.Catalog.UserAssets[v39];
        local v41 = v32.UserRobux[v32.LocalUserId];
        local l_CollectiblesItemInfo_0 = v32.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
        local v43 = nil;
        if v38 then
            v43 = v32.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v38];
        end;
        local v44 = nil;
        v44 = if v35 and v35.DisableResellingCollectiblesForCompliance then v35.DisableResellingCollectiblesForCompliance else l_getAppFeaturePolicies_0().getDisableResellingCollectiblesForCompliance();
        return v31(v36, v40, v41, l_CollectiblesItemInfo_0, v43, v44);
    end;
end;