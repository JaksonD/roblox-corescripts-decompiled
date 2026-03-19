local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and 0 or v4.id, 
        name = (not (v4 ~= nil) or v4.name == nil) and "" or v4.name, 
        description = (not (v4 ~= nil) or v4.description == nil) and "" or v4.description, 
        image_asset_id = (not (v4 ~= nil) or v4.image_asset_id == nil) and 0 or v4.image_asset_id, 
        price_display = (not (v4 ~= nil) or v4.price_display == nil) and "" or v4.price_display, 
        period_type = (not (v4 ~= nil) or v4.period_type == nil) and "" or v4.period_type
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
    if v5.price_display ~= nil and v5.price_display ~= "" then
        local v16, v17 = v0.writeTag(v6, v7, 5, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeString(v16, v17, v5.price_display);
        v6 = v16;
        v7 = v17;
    end;
    if v5.period_type ~= nil and v5.period_type ~= "" then
        local v18, v19 = v0.writeTag(v6, v7, 6, v0.wireTypes.lengthDelimited);
        v18, v19 = v0.writeString(v18, v19, v5.period_type);
        v6 = v18;
        v7 = v19;
    end;
    local v20 = buffer.create(v7);
    buffer.copy(v20, 0, v6, 0, v7);
    return v20;
end;
v3.decode = function(v21) --[[ Line: 99 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v22 = v3.new();
    local v23 = 0;
    while v23 < buffer.len(v21) do
        local v24 = nil;
        local v25 = nil;
        local v26, v27, v28 = v0.readTag(v21, v23);
        v24 = v26;
        v25 = v27;
        v23 = v28;
        if v25 == v0.wireTypes.varint then
            if v24 == 1 then
                v26 = nil;
                v27, v28 = v0.readVarIntI64(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.id = v26;
            elseif v24 == 4 then
                v26 = nil;
                v27, v28 = v0.readVarIntI64(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.image_asset_id = v26;
            else
                v26 = nil;
                v27, v28 = v0.readVarInt(v21, v23);
                v26 = v27;
                v23 = v28;
            end;
        elseif v25 == v0.wireTypes.lengthDelimited then
            if v24 == 2 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.name = buffer.tostring(v26);
            elseif v24 == 3 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.description = buffer.tostring(v26);
            elseif v24 == 5 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.price_display = buffer.tostring(v26);
            elseif v24 == 6 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.period_type = buffer.tostring(v26);
            else
                v26 = nil;
                v27, v28 = v0.readVarInt(v21, v23);
                v23 = v28 + v27;
            end;
        elseif v25 == v0.wireTypes.i32 then
            v26 = nil;
            v27, v28 = v0.readFixed32(v21, v23);
            v26 = v27;
            v23 = v28;
        elseif v25 == v0.wireTypes.i64 then
            v26 = nil;
            v27, v28 = v0.readFixed64(v21, v23);
            v26 = v27;
            v23 = v28;
        else
            error("Unsupported wire type: " .. v25);
        end;
    end;
    return v22;
end;
v3.jsonEncode = function(v29) --[[ Line: 167 ]] --[[ Name: jsonEncode ]]
    local v30 = {};
    if v29.id ~= nil and v29.id ~= 0 then
        v30.id = v29.id;
    end;
    if v29.name ~= nil and v29.name ~= "" then
        v30.name = v29.name;
    end;
    if v29.description ~= nil and v29.description ~= "" then
        v30.description = v29.description;
    end;
    if v29.image_asset_id ~= nil and v29.image_asset_id ~= 0 then
        v30.imageAssetId = v29.image_asset_id;
    end;
    if v29.price_display ~= nil and v29.price_display ~= "" then
        v30.priceDisplay = v29.price_display;
    end;
    if v29.period_type ~= nil and v29.period_type ~= "" then
        v30.periodType = v29.period_type;
    end;
    return v30;
end;
v3.jsonDecode = function(v31) --[[ Line: 197 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v32 = v3.new();
    if v31.id ~= nil then
        v32.id = v31.id;
    end;
    if v31.name ~= nil then
        v32.name = v31.name;
    end;
    if v31.description ~= nil then
        v32.description = v31.description;
    end;
    if v31.image_asset_id ~= nil then
        v32.image_asset_id = v31.image_asset_id;
    end;
    if v31.imageAssetId ~= nil then
        v32.image_asset_id = v31.imageAssetId;
    end;
    if v31.price_display ~= nil then
        v32.price_display = v31.price_display;
    end;
    if v31.priceDisplay ~= nil then
        v32.price_display = v31.priceDisplay;
    end;
    if v31.period_type ~= nil then
        v32.period_type = v31.period_type;
    end;
    if v31.periodType ~= nil then
        v32.period_type = v31.periodType;
    end;
    return v32;
end;
v3.descriptor = {
    name = "SubscriptionData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionData"
};
v2.SubscriptionData = v3;
v1.default:register(v2.SubscriptionData);
return {
    SubscriptionData = v2.SubscriptionData
};