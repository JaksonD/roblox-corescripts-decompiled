local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function(v10, v11) --[[ Line: 26 ]] --[[ Name: useItemDataDigest ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), l_getUseSelectorDeepEquals_0 (copy), v5 (copy), v2 (copy), v7 (copy)
    local v13 = l_useSelector_0(function(v12) --[[ Line: 27 ]]
        -- upvalues: v4 (ref), v10 (copy), v11 (copy)
        return v4(v12.AvatarExperience.Common, v10, v11);
    end, l_getUseSelectorDeepEquals_0());
    local v14 = if v13 then v13.collectibleItemId else nil;
    local v15 = v5.isLimitedCollectible(v13);
    local v17 = v2.useCallback(function(v16) --[[ Line: 34 ]]
        -- upvalues: v14 (copy)
        if v14 then
            return v16.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v14];
        else
            return nil;
        end;
    end, {
        v14
    });
    local v18 = l_useSelector_0(v17, l_getUseSelectorDeepEquals_0());
    local v20 = v2.useCallback(function(v19) --[[ Line: 41 ]]
        -- upvalues: v15 (copy), v14 (copy)
        if not v15 then
            return nil;
        elseif v14 then
            return v19.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v14];
        else
            return nil;
        end;
    end, {
        v14, 
        v15
    });
    local v21 = l_useSelector_0(v20, l_getUseSelectorDeepEquals_0());
    local v22 = v5.IsResellable(v13) or false;
    local v23 = v5.getIsTradable(v13);
    local v24 = v5.HasAttribution(v13);
    local v25 = 0;
    local v26 = false;
    local v27 = false;
    local v28 = if v13 and v13.resellerUserAssetIds then #v13.resellerUserAssetIds > 0 else false;
    local v29 = if v13 and v13.soldCount then v13.soldCount else 0;
    local v30 = if v13 and v13.totalQuantity then v13.totalQuantity else 0;
    local v31 = if v13 and v13.originalPrice then v13.originalPrice else 0;
    local v32 = if v13 and v13.averagePrice then v13.averagePrice else 0;
    local l_None_0 = v7.ResaleRestriction.None;
    if v18 then
        l_None_0 = if v18.resaleRestriction then v18.resaleRestriction else v7.ResaleRestriction.None;
        v28 = if v18.hasResellers then v18.hasResellers else false;
        local v34 = v18.assetStock or 0;
        local v35 = v18.unitsAvailableForConsumption or 0;
        v29 = if v34 and v35 then v34 - v35 else 0;
        v31 = v18.price or 0;
        v32 = v18.recentAveragePrice or 0;
        v30 = v18.assetStock or 0;
        v25 = v18.quantityLimitPerUser or 0;
        v27 = v5.reachQuantityLimit(v18, v21);
        v26 = v5.shouldShowQuantityLimit(v25);
    end;
    local v36 = false;
    if v29 < v30 then
        v36 = v5.isOriginalStockSellableInShop(v18);
    end;
    local v37 = v13 and v13.isPBR;
    return {
        averagePrice = v32, 
        hasResellers = v28, 
        isResellable = v22, 
        hasAttribution = v24, 
        isStockAvailable = v36, 
        isTradable = v23, 
        itemStock = v30, 
        originalPrice = v31, 
        collectiblesResaleRestriction = l_None_0, 
        quantityLimit = v25, 
        reachedQuantityLimit = v27, 
        shouldShowQuantityLimit = v26, 
        soldCount = v29, 
        isPBR = v37
    };
end;