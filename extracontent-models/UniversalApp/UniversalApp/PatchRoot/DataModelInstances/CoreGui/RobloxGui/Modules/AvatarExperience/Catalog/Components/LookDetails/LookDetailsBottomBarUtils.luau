local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v13.FFlagAXMISEnableMultiShopping;
local l_FFlagAXBlackbirdRoot_0 = v13.FFlagAXBlackbirdRoot;
local v22 = {
    getItemInfo = function(v16, v17, v18, v19) --[[ Line: 26 ]]
        -- upvalues: v5 (copy)
        if not v18 or not v19 then
            return nil;
        else
            local v20 = v18[v19];
            if not v20 then
                return nil;
            elseif v17 == v5.ItemType.Asset then
                return v20.lookAssetInfos[v16];
            elseif v17 == v5.ItemType.Bundle then
                local l_lookBundleInfos_0 = v20.lookBundleInfos;
                if l_lookBundleInfos_0 then
                    return l_lookBundleInfos_0[v16];
                else
                    return nil;
                end;
            else
                return nil;
            end;
        end;
    end
};
v22.getOwnedTryOnItems = function(v23, v24, v25) --[[ Line: 55 ]]
    -- upvalues: v22 (copy)
    local v26 = {};
    for v27, v28 in v23 do
        if v28.selectedInTryOnManager then
            local v29 = v22.getItemInfo(v28.itemId, v28.itemType, v24, v25);
            if v29 and v29.quantityOwned > 0 then
                v26[v27] = v28;
            end;
        end;
    end;
    return v26;
end;
v22.getPriceForItem = function(v30, v31, v32, v33, v34) --[[ Line: 78 ]]
    -- upvalues: v6 (copy)
    local l_priceInRobux_0 = v30.priceInRobux;
    if v34 and v30.timedOptions then
        local v36 = v30.timedOptions[v34];
        if v36 then
            l_priceInRobux_0 = v36.price;
        end;
    end;
    if v30.collectibleItemId then
        local v37 = v6.findCheapestCollectiblePurchaseInfoV2(v30.collectibleItemId, v6.IsResellable(v30), v31, v32, v33);
        if v37.price then
            l_priceInRobux_0 = v37.price;
        end;
    end;
    return l_priceInRobux_0;
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v22.getBottomBarInfoMIS = function(v38, v39, v40, v41, v42, v43, v44) --[[ Line: 113 ]]
        -- upvalues: l_FFlagAXBlackbirdRoot_0 (copy), v22 (copy), v3 (copy)
        local v45 = 0;
        local v46 = 0;
        local v47 = 0;
        local v48 = 0;
        local v49 = false;
        local v50 = {};
        if not v43 then
            local l_v47_0 = v47;
            local l_v45_0 = v45;
            local l_v46_0 = v46;
            local l_v49_0 = v49;
            local v55 = nil;
            if l_FFlagAXBlackbirdRoot_0 then
                return l_v47_0, l_v45_0, l_v46_0, l_v49_0, v55, v48;
            else
                return l_v47_0, l_v45_0, l_v46_0, l_v49_0, v55, nil;
            end;
        else
            for _, v57 in v38 do
                v45 = v45 + 1;
                local v58 = v22.getItemInfo(v57.id, v57.itemType, v42, v43);
                if not v58 then
                    if not v49 then
                        v49 = true;
                    end;
                elseif not v58 or not v58.quantityOwned or v58.quantityOwned <= 0 then
                    local v59 = nil;
                    local v60 = nil;
                    if v44 then
                        for _, v62 in v44 do
                            if v62.itemId == v57.id and v62.itemType == v57.itemType then
                                v60 = v62;
                                v59 = v62.selectedTimedOptionIndex;
                                break;
                            end;
                        end;
                    end;
                    local v63 = v22.getPriceForItem(v58, v39, v40, v41, v59);
                    if v63 ~= nil then
                        v47 = v47 + v63;
                        v46 = v46 + 1;
                        if l_FFlagAXBlackbirdRoot_0 then
                            if v58 and v58.discountInformation then
                                v48 = v48 + v58.discountInformation.originalPrice;
                            else
                                v48 = v48 + v63;
                            end;
                        end;
                        if v60 then
                            v50[v57.id] = v3.Dictionary.join(v60, {
                                expectedPrice = v63
                            });
                        end;
                    end;
                end;
            end;
            local l_v47_1 = v47;
            local l_v45_1 = v45;
            local l_v46_1 = v46;
            local l_v49_1 = v49;
            local l_v50_0 = v50;
            if l_FFlagAXBlackbirdRoot_0 then
                return l_v47_1, l_v45_1, l_v46_1, l_v49_1, l_v50_0, v48;
            else
                return l_v47_1, l_v45_1, l_v46_1, l_v49_1, l_v50_0, nil;
            end;
        end;
    end;
    v22.getOwnedItemsInLook = function(v69, v70, v71) --[[ Line: 213 ]]
        -- upvalues: v22 (copy)
        local v72 = {};
        for v73, v74 in v69 do
            local v75 = if v74.itemType then v22.getItemInfo(v74.id, v74.itemType, v70, v71) else nil;
            if v75 and v75.quantityOwned > 0 then
                v72[v73] = v74;
            end;
        end;
        return v72;
    end;
end;
return v22;