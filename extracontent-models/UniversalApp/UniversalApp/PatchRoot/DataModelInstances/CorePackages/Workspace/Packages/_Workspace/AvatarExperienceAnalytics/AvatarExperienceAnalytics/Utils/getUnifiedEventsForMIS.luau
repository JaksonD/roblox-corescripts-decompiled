local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local v1 = require(l_script_FirstAncestor_0.Lib.CartIdService);
local v2 = require(l_script_FirstAncestor_0.UnifiedEventLogEnums);
return function(v3, v4, v5, v6, v7) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v8 = 0;
    local v9 = {};
    local v10 = {};
    local v11 = 0;
    local v12 = {};
    local v13 = {};
    local v14 = {};
    for _, v16 in v3 do
        if v5 and (v5.lookAssetInfos[v16.itemId] or v5.lookBundleInfos[v16.itemId]) then
            if v5.lookAssetInfos[v16.itemId] then
                table.insert(v9, v16.itemId);
                v8 = v8 + v16.priceInRobux;
            elseif v5.lookBundleInfos[v16.itemId] then
                table.insert(v10, v16.itemId);
                v8 = v8 + v16.priceInRobux;
            end;
        elseif v6 and (v6.lookAssetInfos[v16.itemId] or v6.lookBundleInfos[v16.itemId]) then
            if v6.lookAssetInfos[v16.itemId] then
                table.insert(v12, v16.itemId);
                v11 = v11 + v16.priceInRobux;
            elseif v6.lookBundleInfos[v16.itemId] then
                table.insert(v13, v16.itemId);
                v11 = v11 + v16.priceInRobux;
            end;
        else
            local v17 = nil;
            for _, v19 in v4 do
                if v19.itemId == v16.itemId and v19.itemType == v16.itemType then
                    v17 = v19;
                    break;
                end;
            end;
            table.insert(v14, {
                cartId = v1.getCartId(), 
                action = v7, 
                itemId = v16.itemId, 
                itemType = if v16.itemType == "Asset" then v2.MarketplaceUnifiedItemType.ASSET else v2.MarketplaceUnifiedItemType.BUNDLE, 
                assetType = if v16.itemType == "Asset" then v16.itemSubType else nil, 
                bundleType = if v16.itemType == "Bundle" then v16.itemSubType else nil, 
                widgetId = if v17.widgetInfo then v17.widgetInfo.widgetId else nil, 
                widgetType = if v17.widgetInfo then v17.widgetInfo.widgetType else nil, 
                widgetItemPrice = if v17.widgetInfo then v16.priceInRobux else nil, 
                organicItemPrice = if v17.widgetInfo then nil else v16.priceInRobux, 
                status = v16.status
            });
        end;
    end;
    if #v9 > 0 or #v10 > 0 then
        local v20 = if #v9 > 0 then table.concat(v9, ",") else "";
        local v21 = if #v10 > 0 then table.concat(v10, ",") else "";
        local v22 = {
            cartId = v1.getCartId(), 
            action = v7, 
            itemId = v5.itemId, 
            itemType = v2.MarketplaceUnifiedItemType.LOOK
        };
        if v5.isOrganicLook then
            v22.organicAssetIds = v20;
            v22.organicBundleIds = v21;
            v22.organicItemPrice = v8;
        else
            v22.assetIds = v20;
            v22.bundleIds = v21;
            v22.widgetItemPrice = v8;
        end;
        table.insert(v14, v22);
    end;
    if #v12 > 0 or #v13 > 0 then
        local v23 = if #v12 > 0 then table.concat(v12, ",") else "";
        local v24 = if #v13 > 0 then table.concat(v13, ",") else "";
        local v25 = {
            cartId = v1.getCartId(), 
            action = v7, 
            itemId = v6.itemId, 
            itemType = v2.MarketplaceUnifiedItemType.LOOK
        };
        if v6.isOrganicLook then
            v25.organicAssetIds = v23;
            v25.organicBundleIds = v24;
            v25.organicItemPrice = v11;
        else
            v25.assetIds = v23;
            v25.bundleIds = v24;
            v25.widgetItemPrice = v11;
        end;
        table.insert(v14, v25);
    end;
    return v14;
end;