local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
return {
    getPurchaseInfoForLookId = function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: getPurchaseInfoForLookId ]]
        -- upvalues: v1 (copy)
        local v7 = {};
        local v8 = {};
        local v9 = {};
        local v10 = 0;
        local v11 = v5[v6];
        if v4 == nil or v11 == nil then
            return v10, v7, v8, v9;
        else
            for _, v13 in v4 do
                local v14 = v11.lookAssetInfos[tostring(v13.itemId)];
                local v15 = (v11.lookBundleInfos or {})[tostring(v13.itemId)];
                assert(v14 or v15, "itemInfo should not be nil");
                local v16 = v14 or v15;
                if v13.itemId ~= tostring(v1.BlockyBundleId) then
                    if not v13.selectedInTryOnManager or not v16.isPurchasable or v16.quantityOwned > 0 then
                        if v13.itemType == v1.ItemType.Bundle then
                            table.insert(v8, v13.itemId);
                        elseif v13.itemType == v1.ItemType.Asset then
                            table.insert(v7, v13.itemId);
                        end;
                    else
                        v10 = v10 + v16.priceInRobux;
                        table.insert(v9, (tonumber(v13.itemId)));
                    end;
                end;
            end;
            return v10, v7, v8, v9;
        end;
    end
};