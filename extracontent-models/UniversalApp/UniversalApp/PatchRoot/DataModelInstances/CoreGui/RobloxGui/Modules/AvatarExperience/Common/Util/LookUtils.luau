local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_CorePackages_0.Workspace.Packages.PurchasePrompt);
local l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXUnifiedPurchasePromptTimedOptionsInLooks;
return {
    getPurchaseInfoForLookId = function(v7, v8, v9) --[[ Line: 18 ]] --[[ Name: getPurchaseInfoForLookId ]]
        -- upvalues: l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (copy), v2 (copy)
        local v10 = {};
        local v11 = {};
        local v12 = {};
        local v13 = if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 then {} else nil;
        local v14 = 0;
        local v15 = v8[v9];
        if v7 == nil or v15 == nil then
            return v14, v10, v11, v12;
        else
            for _, v17 in v7 do
                local v18 = v15.lookAssetInfos[tostring(v17.itemId)];
                local v19 = (v15.lookBundleInfos or {})[tostring(v17.itemId)];
                assert(v18 or v19, "itemInfo should not be nil");
                local v20 = v18 or v19;
                if v17.itemId ~= tostring(v2.BlockyBundleId) then
                    if not v17.selectedInTryOnManager or not v20.isPurchasable or v20.quantityOwned > 0 then
                        if v17.itemType == v2.ItemType.Bundle then
                            table.insert(v11, v17.itemId);
                        elseif v17.itemType == v2.ItemType.Asset then
                            table.insert(v10, v17.itemId);
                        end;
                    else
                        local l_priceInRobux_0 = v20.priceInRobux;
                        if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 and v17.selectedTimedOptionIndex and v20.timedOptions then
                            local v22 = v20.timedOptions[v17.selectedTimedOptionIndex];
                            if v22 and v22.days then
                                table.insert(v13, {
                                    itemType = v17.itemType, 
                                    itemId = v17.itemId, 
                                    days = v22.days
                                });
                                l_priceInRobux_0 = v22.price;
                            end;
                        end;
                        v14 = v14 + l_priceInRobux_0;
                        table.insert(v12, (tonumber(v17.itemId)));
                    end;
                end;
            end;
            local l_v14_0 = v14;
            local l_v10_0 = v10;
            local l_v11_0 = v11;
            local l_v12_0 = v12;
            if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 and v13 and #v13 > 0 then
                return l_v14_0, l_v10_0, l_v11_0, l_v12_0, v13;
            else
                return l_v14_0, l_v10_0, l_v11_0, l_v12_0, nil;
            end;
        end;
    end
};