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
local l_FFlagAXDurablesSupport_0 = v13.FFlagAXDurablesSupport;
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
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v6 (copy)
    local l_priceInRobux_0 = v30.priceInRobux;
    if l_FFlagAXDurablesSupport_0 and v34 and v30.timedOptions then
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
        -- upvalues: v22 (copy), l_FFlagAXDurablesSupport_0 (copy), v3 (copy)
        local v45 = 0;
        local v46 = 0;
        local v47 = 0;
        local v48 = false;
        local v49 = {};
        if not v43 then
            return v47, v45, v46, v48, nil;
        else
            for _, v51 in v38 do
                v45 = v45 + 1;
                local v52 = v22.getItemInfo(v51.id, v51.itemType, v42, v43);
                if not v52 then
                    if not v48 then
                        v48 = true;
                    end;
                elseif not v52 or not v52.quantityOwned or v52.quantityOwned <= 0 then
                    local v53 = nil;
                    local v54 = nil;
                    if l_FFlagAXDurablesSupport_0 and v44 then
                        for _, v56 in v44 do
                            if v56.itemId == v51.id and v56.itemType == v51.itemType then
                                v54 = v56;
                                v53 = v56.selectedTimedOptionIndex;
                                break;
                            end;
                        end;
                    end;
                    local v57 = v22.getPriceForItem(v52, v39, v40, v41, if l_FFlagAXDurablesSupport_0 then v53 else nil);
                    if v57 ~= nil then
                        v47 = v47 + v57;
                        v46 = v46 + 1;
                        if v54 then
                            v49[v51.id] = v3.Dictionary.join(v54, {
                                expectedPrice = v57
                            });
                        end;
                    end;
                end;
            end;
            return v47, v45, v46, v48, v49;
        end;
    end;
    v22.getOwnedItemsInLook = function(v58, v59, v60) --[[ Line: 198 ]]
        -- upvalues: v22 (copy)
        local v61 = {};
        for v62, v63 in v58 do
            local v64 = if v63.itemType then v22.getItemInfo(v63.id, v63.itemType, v59, v60) else nil;
            if v64 and v64.quantityOwned > 0 then
                v61[v62] = v63;
            end;
        end;
        return v61;
    end;
end;
return v22;