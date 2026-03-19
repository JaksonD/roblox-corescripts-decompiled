local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookFavorite);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetails);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = {};
local _ = function(v14) --[[ Line: 30 ]] --[[ Name: getItemInfo ]]
    local v15 = {};
    if v14 then
        for _, v17 in v14 do
            v15[tostring(v17.id)] = v17;
        end;
    end;
    return v15;
end;
return v3.createReducer(v13, {
    [v6.name] = function(v19, v20) --[[ Line: 43 ]]
        -- upvalues: v13 (copy), v11 (copy), v2 (copy)
        local v21 = v19 or v13;
        local v22 = {};
        local l_lookId_0 = v20.lookId;
        local v24 = {
            lookType = v20.lookType, 
            totalValue = v20.totalValue, 
            totalPrice = v20.totalPrice, 
            totalPremiumPrice = v20.totalPremiumPrice
        };
        local l_lookAssetInfos_0 = v20.lookAssetInfos;
        local v26 = {};
        if l_lookAssetInfos_0 then
            for _, v28 in l_lookAssetInfos_0 do
                v26[tostring(v28.id)] = v28;
            end;
        end;
        v24.lookAssetInfos = v26;
        l_lookAssetInfos_0 = v20.lookBundleInfos;
        v26 = {};
        if l_lookAssetInfos_0 then
            for _, v30 in l_lookAssetInfos_0 do
                v26[tostring(v30.id)] = v30;
            end;
        end;
        v24.lookBundleInfos = v26;
        v24.curator = v20.curator;
        v24.description = v20.description;
        v24.moderationStatus = v20.moderationStatus;
        v24.name = v20.name;
        v24.displayProperties = v20.displayProperties;
        v24.favoriteCount = if v11() then v20.favoriteCount else nil;
        v24.isFavorited = if v11() then v20.isFavorited else nil;
        v22[l_lookId_0] = v24;
        return v2.Dictionary.join(v21, v22);
    end, 
    [v7.name] = function(v31, v32) --[[ Line: 67 ]]
        -- upvalues: v13 (copy), v2 (copy)
        local v33 = v31 or v13;
        local v34 = v33[v32.lookId] or {};
        local v35 = {
            favoriteCount = v34.favoriteCount, 
            isFavorited = v32.isFavorited
        };
        local v36 = v2.Dictionary.join(v34, v35);
        return v2.Dictionary.join(v33, {
            [v32.lookId] = v36
        });
    end, 
    [v8.name] = function(v37, v38) --[[ Line: 79 ]]
        -- upvalues: v13 (copy), v2 (copy)
        local v39 = v37 or v13;
        local v40 = v39[v38.lookId] or {};
        local v41 = v2.Dictionary.join(v40, v38.lookDetails);
        return v2.Dictionary.join(v39, {
            [v38.lookId] = v41
        });
    end, 
    [v9.name] = function(v42, v43) --[[ Line: 87 ]]
        -- upvalues: v13 (copy), v4 (copy), v2 (copy)
        local v44 = v42 or v13;
        local v45 = if v42 then v42[v43.lookId] else nil;
        if v45 == nil then
            return v44;
        else
            assert(v45, "");
            local v46 = v45.totalPrice or 0;
            local v47 = v45.totalPremiumPrice or 0;
            local l_lookAssetInfos_1 = v45.lookAssetInfos;
            local l_lookBundleInfos_0 = v45.lookBundleInfos;
            if l_lookAssetInfos_1 == nil then
                warn("Looks asset info does not exist");
                return v44;
            else
                for _, v51 in v43.purchasedAssetIds do
                    local v52 = tostring(v51);
                    local v53 = l_lookAssetInfos_1[v52];
                    if v53 == nil then
                        warn("Looks reducer could not find asset with id", v52);
                    else
                        l_lookAssetInfos_1[v52].quantityOwned = v53.quantityOwned + 1;
                        v46 = v46 - (v53.priceInRobux or 0);
                        v47 = v47 - (v53.premiumPriceInRobux or 0);
                    end;
                end;
                if l_lookBundleInfos_0 and v43.purchasedBundleIds then
                    for _, v55 in v43.purchasedBundleIds do
                        local v56 = tostring(v55);
                        local v57 = l_lookBundleInfos_0[v56];
                        if v57 == nil then
                            warn("Looks reducer could not find bundle with id", v56);
                        else
                            l_lookBundleInfos_0[v56].quantityOwned = v57.quantityOwned + 1;
                            v46 = v46 - (v57.priceInRobux or 0);
                        end;
                    end;
                end;
                if v46 < 0 then
                    warn("Looks total price is below 0 after manual calculation");
                    v46 = 0;
                end;
                if v47 < 0 then
                    warn("Looks total premium price is below 0 after manual calculation");
                    v47 = 0;
                end;
                local v58 = {
                    [v43.lookId] = {
                        totalPrice = v46, 
                        totalPremiumPrice = v47, 
                        lookAssetInfos = l_lookAssetInfos_1, 
                        lookBundleInfos = l_lookBundleInfos_0
                    }
                };
                local l_isOwnedAfterPurchase_0 = v43.isOwnedAfterPurchase;
                if l_isOwnedAfterPurchase_0 then
                    v58[v43.lookId].owned = l_isOwnedAfterPurchase_0;
                end;
                local v60 = v58[v43.lookId];
                local v61 = v4.joinDeep(v45, v60);
                local v62 = {
                    [v43.lookId] = v61
                };
                return v2.Dictionary.join(v44, v62);
            end;
        end;
    end, 
    [v10.name] = function(v63, v64) --[[ Line: 179 ]]
        -- upvalues: v13 (copy)
        local v65 = v63 or v13;
        local v66 = table.clone(v65);
        v66[v64.lookId] = nil;
        return v66;
    end
});