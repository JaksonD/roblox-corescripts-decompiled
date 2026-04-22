local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
local l_v3_0 = v3 --[[ copy: 3 -> 4 ]];
v3.new = function(v5) --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: l_v3_0 (copy)
    return (setmetatable({
        type = (not (v5 ~= nil) or v5.type == nil) and "" or v5.type, 
        amount_in_robux = (not (v5 ~= nil) or v5.amount_in_robux == nil) and 0 or v5.amount_in_robux, 
        percent = (not (v5 ~= nil) or v5.percent == nil) and 0 or v5.percent
    }, l_v3_0));
end;
v3.encode = function(v6) --[[ Line: 89 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.type ~= nil and v6.type ~= "" then
        local v9, v10 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
        v9, v10 = v0.writeString(v9, v10, v6.type);
        v7 = v9;
        v8 = v10;
    end;
    if v6.amount_in_robux ~= nil and v6.amount_in_robux ~= 0 then
        local v11, v12 = v0.writeTag(v7, v8, 2, v0.wireTypes.varint);
        v11, v12 = v0.writeVarInt(v11, v12, v6.amount_in_robux);
        v7 = v11;
        v8 = v12;
    end;
    if v6.percent ~= nil and v6.percent ~= 0 then
        local v13, v14 = v0.writeTag(v7, v8, 3, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v6.percent);
        v7 = v13;
        v8 = v14;
    end;
    local v15 = buffer.create(v8);
    buffer.copy(v15, 0, v7, 0, v8);
    return v15;
end;
v3.decode = function(v16) --[[ Line: 113 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_0 (copy), v0 (copy)
    local v17 = l_v3_0.new();
    local v18 = 0;
    while v18 < buffer.len(v16) do
        local v19 = nil;
        local v20 = nil;
        local v21, v22, v23 = v0.readTag(v16, v18);
        v19 = v21;
        v20 = v22;
        v18 = v23;
        if v20 == v0.wireTypes.varint then
            if v19 == 2 then
                v21 = nil;
                v22, v23 = v0.readVarIntI64(v16, v18);
                v21 = v22;
                v18 = v23;
                v17.amount_in_robux = v21;
            elseif v19 == 3 then
                v21 = nil;
                v22, v23 = v0.readVarIntI64(v16, v18);
                v21 = v22;
                v18 = v23;
                v17.percent = v21;
            else
                v21 = nil;
                v22, v23 = v0.readVarInt(v16, v18);
                v21 = v22;
                v18 = v23;
            end;
        elseif v20 == v0.wireTypes.lengthDelimited then
            if v19 == 1 then
                v21 = nil;
                v22, v23 = v0.readBuffer(v16, v18);
                v21 = v22;
                v18 = v23;
                v17.type = buffer.tostring(v21);
            else
                v21 = nil;
                v22, v23 = v0.readVarInt(v16, v18);
                v18 = v23 + v22;
            end;
        elseif v20 == v0.wireTypes.i32 then
            v21 = nil;
            v22, v23 = v0.readFixed32(v16, v18);
            v21 = v22;
            v18 = v23;
        elseif v20 == v0.wireTypes.i64 then
            v21 = nil;
            v22, v23 = v0.readFixed64(v16, v18);
            v21 = v22;
            v18 = v23;
        else
            error("Unsupported wire type: " .. v20);
        end;
    end;
    return v17;
end;
v3.jsonEncode = function(v24) --[[ Line: 166 ]] --[[ Name: jsonEncode ]]
    local v25 = {};
    if v24.type ~= nil and v24.type ~= "" then
        v25.type = v24.type;
    end;
    if v24.amount_in_robux ~= nil and v24.amount_in_robux ~= 0 then
        v25.amountInRobux = v24.amount_in_robux;
    end;
    if v24.percent ~= nil and v24.percent ~= 0 then
        v25.percent = v24.percent;
    end;
    return v25;
end;
v3.jsonDecode = function(v26) --[[ Line: 184 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_0 (copy)
    local v27 = l_v3_0.new();
    if v26.type ~= nil then
        v27.type = v26.type;
    end;
    if v26.amount_in_robux ~= nil then
        v27.amount_in_robux = v26.amount_in_robux;
    end;
    if v26.amountInRobux ~= nil then
        v27.amount_in_robux = v26.amountInRobux;
    end;
    if v26.percent ~= nil then
        v27.percent = v26.percent;
    end;
    return v27;
end;
v3.descriptor = {
    name = "PriceDiscountDetail", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PriceDiscountDetail"
};
v2.PriceDiscountDetail = v3;
v1.default:register(v2.PriceDiscountDetail);
v3 = {};
v3.__index = v3;
v3.new = function(v28) --[[ Line: 220 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v28 ~= nil) or v28.id == nil) and "" or v28.id, 
        display_name = (not (v28 ~= nil) or v28.display_name == nil) and "" or v28.display_name, 
        price = (not (v28 ~= nil) or v28.price == nil) and 0 or v28.price, 
        product_id = (not (v28 ~= nil) or v28.product_id == nil) and 0 or v28.product_id, 
        is_owned = v28 ~= nil and not (v28.is_owned == nil) and v28.is_owned, 
        display_icon_image_asset_id = (not (v28 ~= nil) or v28.display_icon_image_asset_id == nil) and 0 or v28.display_icon_image_asset_id, 
        display_description = (not (v28 ~= nil) or v28.display_description == nil) and "" or v28.display_description, 
        price_discount_details = if not (v28 ~= nil) or v28.price_discount_details == nil then {} else v28.price_discount_details, 
        user_base_price_in_robux = (not (v28 ~= nil) or v28.user_base_price_in_robux == nil) and 0 or v28.user_base_price_in_robux
    }, v3));
end;
v3.encode = function(v29) --[[ Line: 242 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v30 = buffer.create(0);
    local v31 = 0;
    if v29.id ~= nil and v29.id ~= "" then
        local v32, v33 = v0.writeTag(v30, v31, 1, v0.wireTypes.lengthDelimited);
        v32, v33 = v0.writeString(v32, v33, v29.id);
        v30 = v32;
        v31 = v33;
    end;
    if v29.display_name ~= nil and v29.display_name ~= "" then
        local v34, v35 = v0.writeTag(v30, v31, 2, v0.wireTypes.lengthDelimited);
        v34, v35 = v0.writeString(v34, v35, v29.display_name);
        v30 = v34;
        v31 = v35;
    end;
    if v29.price ~= nil and v29.price ~= 0 then
        local v36, v37 = v0.writeTag(v30, v31, 3, v0.wireTypes.varint);
        v36, v37 = v0.writeVarInt(v36, v37, v29.price);
        v30 = v36;
        v31 = v37;
    end;
    if v29.product_id ~= nil and v29.product_id ~= 0 then
        local v38, v39 = v0.writeTag(v30, v31, 4, v0.wireTypes.varint);
        v38, v39 = v0.writeVarInt(v38, v39, v29.product_id);
        v30 = v38;
        v31 = v39;
    end;
    if v29.is_owned then
        local v40, v41 = v0.writeTag(v30, v31, 5, v0.wireTypes.varint);
        v40, v41 = v0.writeVarInt(v40, v41, v29.is_owned and 1 or 0);
        v30 = v40;
        v31 = v41;
    end;
    if v29.display_icon_image_asset_id ~= nil and v29.display_icon_image_asset_id ~= 0 then
        local v42, v43 = v0.writeTag(v30, v31, 6, v0.wireTypes.varint);
        v42, v43 = v0.writeVarInt(v42, v43, v29.display_icon_image_asset_id);
        v30 = v42;
        v31 = v43;
    end;
    if v29.display_description ~= nil and v29.display_description ~= "" then
        local v44, v45 = v0.writeTag(v30, v31, 7, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeString(v44, v45, v29.display_description);
        v30 = v44;
        v31 = v45;
    end;
    if v29.price_discount_details ~= nil and #v29.price_discount_details > 0 then
        for _, v47 in v29.price_discount_details do
            local v48 = v47:encode();
            local v49, v50 = v0.writeTag(v30, v31, 8, v0.wireTypes.lengthDelimited);
            v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
            v30 = v49;
            v31 = v50;
        end;
    end;
    if v29.user_base_price_in_robux ~= nil and v29.user_base_price_in_robux ~= 0 then
        local v51, v52 = v0.writeTag(v30, v31, 9, v0.wireTypes.varint);
        v51, v52 = v0.writeVarInt(v51, v52, v29.user_base_price_in_robux);
        v30 = v51;
        v31 = v52;
    end;
    local v53 = buffer.create(v31);
    buffer.copy(v53, 0, v30, 0, v31);
    return v53;
end;
v3.decode = function(v54) --[[ Line: 299 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    local v55 = v3.new();
    local v56 = 0;
    while v56 < buffer.len(v54) do
        local v57 = nil;
        local v58 = nil;
        local v59, v60, v61 = v0.readTag(v54, v56);
        v57 = v59;
        v58 = v60;
        v56 = v61;
        if v58 == v0.wireTypes.varint then
            if v57 == 3 then
                v59 = nil;
                v60, v61 = v0.readVarIntI64(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.price = v59;
            elseif v57 == 4 then
                v59 = nil;
                v60, v61 = v0.readVarIntI64(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.product_id = v59;
            elseif v57 == 5 then
                v59 = nil;
                v60, v61 = v0.readVarInt(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.is_owned = v59 ~= 0;
            elseif v57 == 6 then
                v59 = nil;
                v60, v61 = v0.readVarIntI64(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.display_icon_image_asset_id = v59;
            elseif v57 == 9 then
                v59 = nil;
                v60, v61 = v0.readVarIntI64(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.user_base_price_in_robux = v59;
            else
                v59 = nil;
                v60, v61 = v0.readVarInt(v54, v56);
                v59 = v60;
                v56 = v61;
            end;
        elseif v58 == v0.wireTypes.lengthDelimited then
            if v57 == 1 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.id = buffer.tostring(v59);
            elseif v57 == 2 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.display_name = buffer.tostring(v59);
            elseif v57 == 7 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.display_description = buffer.tostring(v59);
            elseif v57 == 8 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                table.insert(v55.price_discount_details, v2.PriceDiscountDetail.decode(v59));
            else
                v59 = nil;
                v60, v61 = v0.readVarInt(v54, v56);
                v56 = v61 + v60;
            end;
        elseif v58 == v0.wireTypes.i32 then
            v59 = nil;
            v60, v61 = v0.readFixed32(v54, v56);
            v59 = v60;
            v56 = v61;
        elseif v58 == v0.wireTypes.i64 then
            v59 = nil;
            v60, v61 = v0.readFixed64(v54, v56);
            v59 = v60;
            v56 = v61;
        else
            error("Unsupported wire type: " .. v58);
        end;
    end;
    return v55;
end;
v3.jsonEncode = function(v62) --[[ Line: 382 ]] --[[ Name: jsonEncode ]]
    local v63 = {};
    if v62.id ~= nil and v62.id ~= "" then
        v63.id = v62.id;
    end;
    if v62.display_name ~= nil and v62.display_name ~= "" then
        v63.displayName = v62.display_name;
    end;
    if v62.price ~= nil and v62.price ~= 0 then
        v63.price = v62.price;
    end;
    if v62.product_id ~= nil and v62.product_id ~= 0 then
        v63.productId = v62.product_id;
    end;
    if v62.is_owned then
        v63.isOwned = v62.is_owned;
    end;
    if v62.display_icon_image_asset_id ~= nil and v62.display_icon_image_asset_id ~= 0 then
        v63.displayIconImageAssetId = v62.display_icon_image_asset_id;
    end;
    if v62.display_description ~= nil and v62.display_description ~= "" then
        v63.displayDescription = v62.display_description;
    end;
    if v62.price_discount_details ~= nil and #v62.price_discount_details > 0 then
        local v64 = {};
        for _, v66 in v62.price_discount_details do
            table.insert(v64, v66:jsonEncode());
        end;
        v63.priceDiscountDetails = v64;
    end;
    if v62.user_base_price_in_robux ~= nil and v62.user_base_price_in_robux ~= 0 then
        v63.userBasePriceInRobux = v62.user_base_price_in_robux;
    end;
    return v63;
end;
v3.jsonDecode = function(v67) --[[ Line: 428 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v68 = v3.new();
    if v67.id ~= nil then
        v68.id = v67.id;
    end;
    if v67.display_name ~= nil then
        v68.display_name = v67.display_name;
    end;
    if v67.displayName ~= nil then
        v68.display_name = v67.displayName;
    end;
    if v67.price ~= nil then
        v68.price = v67.price;
    end;
    if v67.product_id ~= nil then
        v68.product_id = v67.product_id;
    end;
    if v67.productId ~= nil then
        v68.product_id = v67.productId;
    end;
    if v67.is_owned ~= nil then
        v68.is_owned = v67.is_owned;
    end;
    if v67.isOwned ~= nil then
        v68.is_owned = v67.isOwned;
    end;
    if v67.display_icon_image_asset_id ~= nil then
        v68.display_icon_image_asset_id = v67.display_icon_image_asset_id;
    end;
    if v67.displayIconImageAssetId ~= nil then
        v68.display_icon_image_asset_id = v67.displayIconImageAssetId;
    end;
    if v67.display_description ~= nil then
        v68.display_description = v67.display_description;
    end;
    if v67.displayDescription ~= nil then
        v68.display_description = v67.displayDescription;
    end;
    if v67.price_discount_details ~= nil then
        local v69 = {};
        for _, v71 in v67.price_discount_details do
            table.insert(v69, v2.PriceDiscountDetail.jsonDecode(v71));
        end;
        v68.price_discount_details = v69;
    end;
    if v67.priceDiscountDetails ~= nil then
        local v72 = {};
        for _, v74 in v67.priceDiscountDetails do
            table.insert(v72, v2.PriceDiscountDetail.jsonDecode(v74));
        end;
        v68.price_discount_details = v72;
    end;
    if v67.user_base_price_in_robux ~= nil then
        v68.user_base_price_in_robux = v67.user_base_price_in_robux;
    end;
    if v67.userBasePriceInRobux ~= nil then
        v68.user_base_price_in_robux = v67.userBasePriceInRobux;
    end;
    return v68;
end;
v3.descriptor = {
    name = "GamePassData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassData"
};
v2.GamePassData = v3;
v1.default:register(v2.GamePassData);
return {
    PriceDiscountDetail = v2.PriceDiscountDetail, 
    GamePassData = v2.GamePassData
};