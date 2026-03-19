local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Utils.convertAssetInfoToItemData);
local v5 = require(l_script_FirstAncestor_0.Utils.convertBundleInfoToItemData);
local v6 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local v7 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_getPriceInRobux_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).getPriceInRobux;
local function v13(v9, v10) --[[ Line: 26 ]] --[[ Name: convertAvatarItemToItemData ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy), v5 (copy)
    if v9.itemType == l_ItemTypeEnum_0.Asset then
        local v11 = v10.assets[v9.id];
        if not v11 then
            return nil;
        else
            return v4(v11);
        end;
    elseif v9.itemType == l_ItemTypeEnum_0.Bundle then
        local v12 = v10.bundles[v9.id];
        if not v12 then
            return nil;
        else
            return v5(v12);
        end;
    else
        return nil;
    end;
end;
local function v16(v14) --[[ Line: 47 ]] --[[ Name: isPurchasableItem ]]
    -- upvalues: v7 (copy)
    local v15 = true;
    if v14 ~= v7.Free then
        v15 = true;
        if v14 ~= v7.PurchaseFromRoblox then
            v15 = v14 == v7.PurchaseFromResale;
        end;
    end;
    return v15;
end;
local function v18(v17) --[[ Line: 57 ]] --[[ Name: createBulkPurchaseRequestItem ]]
    -- upvalues: l_ItemTypeEnum_0 (copy)
    return {
        id = v17.id and tonumber(v17.id) or 0, 
        itemType = if v17.itemType == l_ItemTypeEnum_0.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value
    };
end;
return {
    convertAvatarItemToItemData = v13, 
    isPurchasableItem = v16, 
    createBulkPurchaseRequestItem = v18, 
    getBulkPurchaseEligibleItems = function(v19, v20) --[[ Line: 71 ]] --[[ Name: getBulkPurchaseEligibleItems ]]
        -- upvalues: l_ItemTypeEnum_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v18 (copy), l_getPriceInRobux_0 (copy)
        if not v19 then
            return {
                requestedItems = {}, 
                totalPrice = 0
            };
        else
            local v21 = {};
            local v22 = 0;
            for _, v24 in v19 do
                local v25;
                if v24.itemType == l_ItemTypeEnum_0.Asset then
                    local v26 = v20.assets[v24.id];
                    v25 = if not v26 then nil else v4(v26);
                elseif v24.itemType == l_ItemTypeEnum_0.Bundle then
                    local v27 = v20.bundles[v24.id];
                    v25 = if not v27 then nil else v5(v27);
                else
                    v25 = nil;
                end;
                local v28 = v6(v25, true);
                if v25 then
                    local v29 = true;
                    if v28 ~= v7.Free then
                        v29 = true;
                        if v28 ~= v7.PurchaseFromRoblox then
                            v29 = v28 == v7.PurchaseFromResale;
                        end;
                    end;
                    if v29 then
                        table.insert(v21, (v18(v25)));
                        v29 = l_getPriceInRobux_0(v25, v28);
                        if v29 ~= nil then
                            v22 = v22 + v29;
                        end;
                    end;
                end;
            end;
            return {
                requestedItems = v21, 
                totalPrice = v22
            };
        end;
    end
};