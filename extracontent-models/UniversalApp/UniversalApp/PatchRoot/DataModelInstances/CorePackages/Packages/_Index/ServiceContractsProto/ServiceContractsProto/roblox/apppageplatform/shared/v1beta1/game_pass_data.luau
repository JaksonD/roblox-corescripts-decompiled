local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and "" or v4.id, 
        name = (not (v4 ~= nil) or v4.name == nil) and "" or v4.name, 
        price = (not (v4 ~= nil) or v4.price == nil) and 0 or v4.price, 
        product_id = (not (v4 ~= nil) or v4.product_id == nil) and 0 or v4.product_id, 
        is_owned = v4 ~= nil and not (v4.is_owned == nil) and v4.is_owned, 
        image_asset_id = (not (v4 ~= nil) or v4.image_asset_id == nil) and 0 or v4.image_asset_id, 
        description = (not (v4 ~= nil) or v4.description == nil) and "" or v4.description
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 63 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.name ~= nil and v5.name ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.name);
        v6 = v10;
        v7 = v11;
    end;
    if v5.price ~= nil and v5.price ~= 0 then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.varint);
        v12, v13 = v0.writeVarInt(v12, v13, v5.price);
        v6 = v12;
        v7 = v13;
    end;
    if v5.product_id ~= nil and v5.product_id ~= 0 then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v5.product_id);
        v6 = v14;
        v7 = v15;
    end;
    if v5.is_owned then
        local v16, v17 = v0.writeTag(v6, v7, 5, v0.wireTypes.varint);
        v16, v17 = v0.writeVarInt(v16, v17, v5.is_owned and 1 or 0);
        v6 = v16;
        v7 = v17;
    end;
    if v5.image_asset_id ~= nil and v5.image_asset_id ~= 0 then
        local v18, v19 = v0.writeTag(v6, v7, 6, v0.wireTypes.varint);
        v18, v19 = v0.writeVarInt(v18, v19, v5.image_asset_id);
        v6 = v18;
        v7 = v19;
    end;
    if v5.description ~= nil and v5.description ~= "" then
        local v20, v21 = v0.writeTag(v6, v7, 7, v0.wireTypes.lengthDelimited);
        v20, v21 = v0.writeString(v20, v21, v5.description);
        v6 = v20;
        v7 = v21;
    end;
    local v22 = buffer.create(v7);
    buffer.copy(v22, 0, v6, 0, v7);
    return v22;
end;
v3.decode = function(v23) --[[ Line: 107 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v24 = v3.new();
    local v25 = 0;
    while v25 < buffer.len(v23) do
        local v26 = nil;
        local v27 = nil;
        local v28, v29, v30 = v0.readTag(v23, v25);
        v26 = v28;
        v27 = v29;
        v25 = v30;
        if v27 == v0.wireTypes.varint then
            if v26 == 3 then
                v28 = nil;
                v29, v30 = v0.readVarIntI64(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.price = v28;
            elseif v26 == 4 then
                v28 = nil;
                v29, v30 = v0.readVarIntI64(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.product_id = v28;
            elseif v26 == 5 then
                v28 = nil;
                v29, v30 = v0.readVarInt(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.is_owned = v28 ~= 0;
            elseif v26 == 6 then
                v28 = nil;
                v29, v30 = v0.readVarIntI64(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.image_asset_id = v28;
            else
                v28 = nil;
                v29, v30 = v0.readVarInt(v23, v25);
                v28 = v29;
                v25 = v30;
            end;
        elseif v27 == v0.wireTypes.lengthDelimited then
            if v26 == 1 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.id = buffer.tostring(v28);
            elseif v26 == 2 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.name = buffer.tostring(v28);
            elseif v26 == 7 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.description = buffer.tostring(v28);
            else
                v28 = nil;
                v29, v30 = v0.readVarInt(v23, v25);
                v25 = v30 + v29;
            end;
        elseif v27 == v0.wireTypes.i32 then
            v28 = nil;
            v29, v30 = v0.readFixed32(v23, v25);
            v28 = v29;
            v25 = v30;
        elseif v27 == v0.wireTypes.i64 then
            v28 = nil;
            v29, v30 = v0.readFixed64(v23, v25);
            v28 = v29;
            v25 = v30;
        else
            error("Unsupported wire type: " .. v27);
        end;
    end;
    return v24;
end;
v3.jsonEncode = function(v31) --[[ Line: 180 ]] --[[ Name: jsonEncode ]]
    local v32 = {};
    if v31.id ~= nil and v31.id ~= "" then
        v32.id = v31.id;
    end;
    if v31.name ~= nil and v31.name ~= "" then
        v32.name = v31.name;
    end;
    if v31.price ~= nil and v31.price ~= 0 then
        v32.price = v31.price;
    end;
    if v31.product_id ~= nil and v31.product_id ~= 0 then
        v32.productId = v31.product_id;
    end;
    if v31.is_owned then
        v32.isOwned = v31.is_owned;
    end;
    if v31.image_asset_id ~= nil and v31.image_asset_id ~= 0 then
        v32.imageAssetId = v31.image_asset_id;
    end;
    if v31.description ~= nil and v31.description ~= "" then
        v32.description = v31.description;
    end;
    return v32;
end;
v3.jsonDecode = function(v33) --[[ Line: 214 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v34 = v3.new();
    if v33.id ~= nil then
        v34.id = v33.id;
    end;
    if v33.name ~= nil then
        v34.name = v33.name;
    end;
    if v33.price ~= nil then
        v34.price = v33.price;
    end;
    if v33.product_id ~= nil then
        v34.product_id = v33.product_id;
    end;
    if v33.productId ~= nil then
        v34.product_id = v33.productId;
    end;
    if v33.is_owned ~= nil then
        v34.is_owned = v33.is_owned;
    end;
    if v33.isOwned ~= nil then
        v34.is_owned = v33.isOwned;
    end;
    if v33.image_asset_id ~= nil then
        v34.image_asset_id = v33.image_asset_id;
    end;
    if v33.imageAssetId ~= nil then
        v34.image_asset_id = v33.imageAssetId;
    end;
    if v33.description ~= nil then
        v34.description = v33.description;
    end;
    return v34;
end;
v3.descriptor = {
    name = "GamePassData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassData"
};
v2.GamePassData = v3;
v1.default:register(v2.GamePassData);
return {
    GamePassData = v2.GamePassData
};