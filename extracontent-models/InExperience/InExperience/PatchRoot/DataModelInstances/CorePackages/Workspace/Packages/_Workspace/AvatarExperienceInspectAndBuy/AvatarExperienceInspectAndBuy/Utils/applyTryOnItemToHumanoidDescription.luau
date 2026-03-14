local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AXCommon);
local v3 = require(l_Parent_0.Cryo);
local l_Constants_0 = v2.Constants;
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
local l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 = l_Constants_0.ASSET_TYPE_TO_ACCESSORY_TYPE;
local l_ASSET_TYPE_NAME_TO_ID_STRING_0 = l_Constants_0.ASSET_TYPE_NAME_TO_ID_STRING;
local l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 = l_Constants_0.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP;
local l_LAYERED_CLOTHING_ORDER_0 = l_Constants_0.LAYERED_CLOTHING_ORDER;
local l_LAYERED_ASSET_TYPES_0 = l_Constants_0.LAYERED_ASSET_TYPES;
local l_BODY_BUNDLE_TYPE_ID_0 = l_Constants_0.BODY_BUNDLE_TYPE_ID;
local l_SHOES_BUNDLE_TYPE_ID_0 = l_Constants_0.SHOES_BUNDLE_TYPE_ID;
local l_DYNAMIC_HEAD_BUNDLE_TYPE_ID_0 = l_Constants_0.DYNAMIC_HEAD_BUNDLE_TYPE_ID;
local l_FFlagAXFix2DClothingTryOn_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXFix2DClothingTryOn;
local _ = require(l_script_FirstAncestor_0.Types);
local function _(v16, v17) --[[ Line: 25 ]]
    -- upvalues: l_LAYERED_CLOTHING_ORDER_0 (copy), l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 (copy), l_LAYERED_ASSET_TYPES_0 (copy)
    return {
        AssetId = tonumber(v17) or 0, 
        Order = l_LAYERED_CLOTHING_ORDER_0[v16], 
        AccessoryType = l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[v16], 
        IsLayered = l_LAYERED_ASSET_TYPES_0[v16] ~= nil
    };
end;
local _ = function(v19, v20) --[[ Line: 44 ]]
    -- upvalues: v3 (copy)
    return v3.List.filter(v19, function(v21) --[[ Line: 48 ]]
        -- upvalues: v20 (copy)
        for _, v23 in v20 do
            if v21.AccessoryType == v23 then
                return false;
            end;
        end;
        return true;
    end);
end;
local function v36(v25, v26) --[[ Line: 61 ]]
    -- upvalues: l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 (copy), l_LAYERED_CLOTHING_ORDER_0 (copy), l_LAYERED_ASSET_TYPES_0 (copy)
    local v27 = {};
    for _, v29 in v25 do
        local l_assetType_0 = v29.assetType;
        local l_id_0 = v29.id;
        if l_assetType_0 and l_id_0 then
            local v32 = l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_assetType_0];
            local v33 = true;
            if v26 then
                v33 = false;
                for _, v35 in v26 do
                    if v32 == v35 then
                        v33 = true;
                        break;
                    end;
                end;
            end;
            if v33 and v32 then
                table.insert(v27, {
                    AssetId = tonumber(l_id_0) or 0, 
                    Order = l_LAYERED_CLOTHING_ORDER_0[l_assetType_0], 
                    AccessoryType = l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_assetType_0], 
                    IsLayered = l_LAYERED_ASSET_TYPES_0[l_assetType_0] ~= nil
                });
            end;
        end;
    end;
    return v27;
end;
local function v47(v37, v38) --[[ Line: 98 ]]
    -- upvalues: v3 (copy)
    local l_v37_Accessories_0 = v37:GetAccessories(true);
    local v40 = {};
    for _, v42 in v38 do
        table.insert(v40, v42.AccessoryType);
    end;
    local v46 = v3.List.filter(l_v37_Accessories_0, function(v43) --[[ Line: 48 ]]
        -- upvalues: v40 (copy)
        for _, v45 in v40 do
            if v43.AccessoryType == v45 then
                return false;
            end;
        end;
        return true;
    end);
    v37:SetAccessories(v3.List.join(v46, v38), true);
end;
return function(v48, v49) --[[ Line: 117 ]]
    -- upvalues: l_ItemTypeEnum_0 (copy), l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 (copy), l_FFlagAXFix2DClothingTryOn_0 (copy), l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 (copy), l_ASSET_TYPE_NAME_TO_ID_STRING_0 (copy), l_LAYERED_CLOTHING_ORDER_0 (copy), l_LAYERED_ASSET_TYPES_0 (copy), v47 (copy), l_BODY_BUNDLE_TYPE_ID_0 (copy), v36 (copy), l_SHOES_BUNDLE_TYPE_ID_0 (copy), l_DYNAMIC_HEAD_BUNDLE_TYPE_ID_0 (copy)
    if v48.itemType == l_ItemTypeEnum_0.Asset and (l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[v48.itemSubType] or l_FFlagAXFix2DClothingTryOn_0 and l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[v48.itemSubType]) then
        local l_itemSubType_0 = v48.itemSubType;
        local l_itemId_0 = v48.itemId;
        local v52 = if l_FFlagAXFix2DClothingTryOn_0 then l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[l_itemSubType_0] else nil;
        if l_itemId_0 and l_itemSubType_0 ~= l_ASSET_TYPE_NAME_TO_ID_STRING_0.Gear and l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_itemSubType_0] then
            local v53 = {
                {
                    AssetId = tonumber(l_itemId_0) or 0, 
                    Order = l_LAYERED_CLOTHING_ORDER_0[l_itemSubType_0], 
                    AccessoryType = l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_itemSubType_0], 
                    IsLayered = l_LAYERED_ASSET_TYPES_0[l_itemSubType_0] ~= nil
                }
            };
            v47(v49, v53);
        elseif l_FFlagAXFix2DClothingTryOn_0 and v52 and l_itemId_0 then
            v49[v52] = l_itemId_0;
        end;
    end;
    if v48.itemType == l_ItemTypeEnum_0.Bundle and v48.assetsInBundle and v48.itemSubType == l_BODY_BUNDLE_TYPE_ID_0 then
        local v54 = v36(v48.assetsInBundle, {
            Enum.AccessoryType.Hair
        });
        if #v54 > 0 then
            v47(v49, v54);
        end;
        for _, v56 in v48.assetsInBundle do
            local l_assetType_1 = v56.assetType;
            if l_assetType_1 then
                local v58 = l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[l_assetType_1];
                if l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[l_assetType_1] ~= Enum.AccessoryType.Hair and v58 and v56.id then
                    v49[v58] = v56.id;
                end;
            end;
        end;
    end;
    if v48.itemSubType == l_SHOES_BUNDLE_TYPE_ID_0 and v48.assetsInBundle then
        local v59 = v36(v48.assetsInBundle, {
            Enum.AccessoryType.LeftShoe, 
            Enum.AccessoryType.RightShoe
        });
        if #v59 > 0 then
            v47(v49, v59);
        end;
    end;
    if v48.itemSubType == l_DYNAMIC_HEAD_BUNDLE_TYPE_ID_0 and v48.assetsInBundle then
        for _, v61 in v48.assetsInBundle do
            local l_assetType_2 = v61.assetType;
            local l_id_1 = v61.id;
            if l_assetType_2 then
                local v64 = l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[l_assetType_2];
                if v64 and l_id_1 then
                    v49[v64] = l_id_1;
                end;
            end;
        end;
    end;
end;