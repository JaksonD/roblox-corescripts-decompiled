local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local l_ItemTypeEnum_0 = require(l_Parent_0.AXCommon).Enums.ItemTypeEnum;
local _ = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local v5 = require(l_script_FirstAncestor_0.Utils.convertAssetInfoToItemData);
local v6 = require(l_script_FirstAncestor_0.Utils.convertBundleInfoToItemData);
local v7 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local _ = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_getPriceInRobux_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).getPriceInRobux;
return function(v10) --[[ Line: 47 ]] --[[ Name: buildBulkPurchaseAnalyticsPayload ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), v5 (copy), v7 (copy), l_getPriceInRobux_0 (copy), v6 (copy)
    local l_itemId_0 = v10.itemId;
    local l_collectibleResellableInstances_0 = v10.collectibleResellableInstances;
    local l_storedData_0 = v10.storedData;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if v10.itemType == l_ItemTypeEnum_0.Asset then
        local v17 = v10.assetsMap and v10.assetsMap[l_itemId_0];
        if not v17 then
            return nil;
        else
            local v18 = if v17.collectibleItemId and l_collectibleResellableInstances_0 then l_collectibleResellableInstances_0[v17.collectibleItemId] else nil;
            local v19 = v5(v17, v18);
            local v20 = v7(v19, true);
            v15 = l_getPriceInRobux_0(v19, v20);
            v14 = v17.assetTypeId;
            if l_storedData_0 and l_storedData_0.timedOptions then
                for _, v22 in l_storedData_0.timedOptions do
                    if v22.selected then
                        v16 = v22.days;
                        v15 = v22.price;
                        break;
                    end;
                end;
            end;
        end;
    else
        local v23 = v10.bundlesMap and v10.bundlesMap[l_itemId_0];
        if not v23 then
            return nil;
        else
            local v24 = if v23.collectibleItemId and l_collectibleResellableInstances_0 then l_collectibleResellableInstances_0[v23.collectibleItemId] else nil;
            local v25 = v6(v23, v24);
            local v26 = v7(v25, true);
            v15 = l_getPriceInRobux_0(v25, v26);
            v14 = if v25 then v25.itemSubType else nil;
        end;
    end;
    return {
        itemSubType = v14, 
        timedOptionDays = v16, 
        price = v15
    };
end;