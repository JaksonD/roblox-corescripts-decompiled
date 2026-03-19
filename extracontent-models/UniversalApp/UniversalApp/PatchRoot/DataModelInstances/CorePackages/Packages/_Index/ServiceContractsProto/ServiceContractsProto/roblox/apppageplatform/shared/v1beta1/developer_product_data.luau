local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and 0 or v4.id, 
        name = (not (v4 ~= nil) or v4.name == nil) and "" or v4.name, 
        description = (not (v4 ~= nil) or v4.description == nil) and "" or v4.description, 
        image_asset_id = (not (v4 ~= nil) or v4.image_asset_id == nil) and 0 or v4.image_asset_id, 
        price_in_robux = (not (v4 ~= nil) or v4.price_in_robux == nil) and 0 or v4.price_in_robux
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 60 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= 0 then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.name ~= nil and v5.name ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.name);
        v6 = v10;
        v7 = v11;
    end;
    if v5.description ~= nil and v5.description ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.description);
        v6 = v12;
        v7 = v13;
    end;
    if v5.image_asset_id ~= nil and v5.image_asset_id ~= 0 then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v5.image_asset_id);
        v6 = v14;
        v7 = v15;
    end;
    if v5.price_in_robux ~= nil and v5.price_in_robux ~= 0 then
        local v16, v17 = v0.writeTag(v6, v7, 5, v0.wireTypes.varint);
        v16, v17 = v0.writeVarInt(v16, v17, v5.price_in_robux);
        v6 = v16;
        v7 = v17;
    end;
    local v18 = buffer.create(v7);
    buffer.copy(v18, 0, v6, 0, v7);
    return v18;
end;
v3.decode = function(v19) --[[ Line: 94 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v20 = v3.new();
    local v21 = 0;
    while v21 < buffer.len(v19) do
        local v22 = nil;
        local v23 = nil;
        local v24, v25, v26 = v0.readTag(v19, v21);
        v22 = v24;
        v23 = v25;
        v21 = v26;
        if v23 == v0.wireTypes.varint then
            if v22 == 1 then
                v24 = nil;
                v25, v26 = v0.readVarIntI64(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.id = v24;
            elseif v22 == 4 then
                v24 = nil;
                v25, v26 = v0.readVarIntI64(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.image_asset_id = v24;
            elseif v22 == 5 then
                v24 = nil;
                v25, v26 = v0.readVarIntI64(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.price_in_robux = v24;
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v24 = v25;
                v21 = v26;
            end;
        elseif v23 == v0.wireTypes.lengthDelimited then
            if v22 == 2 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.name = buffer.tostring(v24);
            elseif v22 == 3 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.description = buffer.tostring(v24);
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v21 = v26 + v25;
            end;
        elseif v23 == v0.wireTypes.i32 then
            v24 = nil;
            v25, v26 = v0.readFixed32(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.i64 then
            v24 = nil;
            v25, v26 = v0.readFixed64(v19, v21);
            v24 = v25;
            v21 = v26;
        else
            error("Unsupported wire type: " .. v23);
        end;
    end;
    return v20;
end;
v3.jsonEncode = function(v27) --[[ Line: 157 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.id ~= nil and v27.id ~= 0 then
        v28.id = v27.id;
    end;
    if v27.name ~= nil and v27.name ~= "" then
        v28.name = v27.name;
    end;
    if v27.description ~= nil and v27.description ~= "" then
        v28.description = v27.description;
    end;
    if v27.image_asset_id ~= nil and v27.image_asset_id ~= 0 then
        v28.imageAssetId = v27.image_asset_id;
    end;
    if v27.price_in_robux ~= nil and v27.price_in_robux ~= 0 then
        v28.priceInRobux = v27.price_in_robux;
    end;
    return v28;
end;
v3.jsonDecode = function(v29) --[[ Line: 183 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v30 = v3.new();
    if v29.id ~= nil then
        v30.id = v29.id;
    end;
    if v29.name ~= nil then
        v30.name = v29.name;
    end;
    if v29.description ~= nil then
        v30.description = v29.description;
    end;
    if v29.image_asset_id ~= nil then
        v30.image_asset_id = v29.image_asset_id;
    end;
    if v29.imageAssetId ~= nil then
        v30.image_asset_id = v29.imageAssetId;
    end;
    if v29.price_in_robux ~= nil then
        v30.price_in_robux = v29.price_in_robux;
    end;
    if v29.priceInRobux ~= nil then
        v30.price_in_robux = v29.priceInRobux;
    end;
    return v30;
end;
v3.descriptor = {
    name = "DeveloperProductData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductData"
};
v2.DeveloperProductData = v3;
v1.default:register(v2.DeveloperProductData);
return {
    DeveloperProductData = v2.DeveloperProductData
};