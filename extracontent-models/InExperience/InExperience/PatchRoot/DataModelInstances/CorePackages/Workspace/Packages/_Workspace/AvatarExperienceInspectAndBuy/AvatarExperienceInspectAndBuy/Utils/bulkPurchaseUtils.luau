local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Utils.convertAssetInfoToItemData);
local v5 = require(l_script_FirstAncestor_0.Utils.convertBundleInfoToItemData);
local v6 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local v7 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_getPriceInRobux_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).getPriceInRobux;
local _ = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local function v14(v10, v11) --[[ Line: 31 ]] --[[ Name: convertAvatarItemToItemData ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy), v5 (copy)
    if v10.itemType == l_ItemTypeEnum_0.Asset then
        local v12 = v11.assets[v10.id];
        if not v12 then
            return nil;
        else
            return v4(v12);
        end;
    elseif v10.itemType == l_ItemTypeEnum_0.Bundle then
        local v13 = v11.bundles[v10.id];
        if not v13 then
            return nil;
        else
            return v5(v13);
        end;
    else
        return nil;
    end;
end;
local function v17(v15) --[[ Line: 52 ]] --[[ Name: isPurchasableItem ]]
    -- upvalues: v7 (copy)
    local v16 = true;
    if v15 ~= v7.Free then
        v16 = true;
        if v15 ~= v7.PurchaseFromRoblox then
            v16 = v15 == v7.PurchaseFromResale;
        end;
    end;
    return v16;
end;
local function v19(v18) --[[ Line: 62 ]] --[[ Name: createBulkPurchaseRequestItem ]]
    -- upvalues: l_ItemTypeEnum_0 (copy)
    return {
        id = v18.id and tonumber(v18.id) or 0, 
        itemType = if v18.itemType == l_ItemTypeEnum_0.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value
    };
end;
return {
    convertAvatarItemToItemData = v14, 
    isPurchasableItem = v17, 
    createBulkPurchaseRequestItem = v19, 
    getBulkPurchaseEligibleItems = function(v20, v21) --[[ Line: 76 ]] --[[ Name: getBulkPurchaseEligibleItems ]]
        -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v19 (copy), l_getPriceInRobux_0 (copy)
        if not v20 then
            return {
                requestedItems = {}, 
                totalPrice = 0
            };
        else
            local v22 = {};
            local v23 = 0;
            for _, v25 in v20 do
                local v26;
                if v25.itemType == l_ItemTypeEnum_0.Asset then
                    local v27 = v21.assets[v25.id];
                    v26 = if not v27 then nil else v4(v27);
                elseif v25.itemType == l_ItemTypeEnum_0.Bundle then
                    local v28 = v21.bundles[v25.id];
                    v26 = if not v28 then nil else v5(v28);
                else
                    v26 = nil;
                end;
                local v29 = v6(v26, true);
                if v26 then
                    local v30 = true;
                    if v29 ~= v7.Free then
                        v30 = true;
                        if v29 ~= v7.PurchaseFromRoblox then
                            v30 = v29 == v7.PurchaseFromResale;
                        end;
                    end;
                    if v30 then
                        table.insert(v22, (v19(v26)));
                        v30 = l_getPriceInRobux_0(v26, v29);
                        if v30 ~= nil then
                            v23 = v23 + v30;
                        end;
                    end;
                end;
            end;
            return {
                requestedItems = v22, 
                totalPrice = v23
            };
        end;
    end, 
    buildRequestedItemsWithTimedOptions = function(v31, v32) --[[ Line: 118 ]] --[[ Name: buildRequestedItemsWithTimedOptions ]]
        local v33 = {};
        for _, v35 in v31 do
            local v36 = v32[tostring(v35.id)];
            local v37 = nil;
            if v36 and v36.timedOptions then
                for _, v39 in v36.timedOptions do
                    if v39.selected and v39.days > 0 then
                        v37 = {
                            {
                                Type = Enum.PurchaseOption.TimedOption, 
                                Value = v39.days * 86400
                            }
                        };
                        break;
                    end;
                end;
            end;
            table.insert(v33, {
                id = v35.id, 
                itemType = v35.itemType, 
                PurchaseOptions = v37
            });
        end;
        return v33;
    end
};