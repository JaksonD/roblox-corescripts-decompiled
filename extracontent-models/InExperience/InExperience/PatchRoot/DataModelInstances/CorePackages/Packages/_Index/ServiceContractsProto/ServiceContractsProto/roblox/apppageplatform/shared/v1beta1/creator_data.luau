local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        creator_type = (not (v4 ~= nil) or v4.creator_type == nil) and "" or v4.creator_type, 
        creator_id = (not (v4 ~= nil) or v4.creator_id == nil) and 0 or v4.creator_id, 
        creator_name = (not (v4 ~= nil) or v4.creator_name == nil) and "" or v4.creator_name, 
        is_verified = v4 ~= nil and not (v4.is_verified == nil) and v4.is_verified
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 54 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.creator_type ~= nil and v5.creator_type ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.creator_type);
        v6 = v8;
        v7 = v9;
    end;
    if v5.creator_id ~= nil and v5.creator_id ~= 0 then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v5.creator_id);
        v6 = v10;
        v7 = v11;
    end;
    if v5.creator_name ~= nil and v5.creator_name ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.creator_name);
        v6 = v12;
        v7 = v13;
    end;
    if v5.is_verified then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v5.is_verified and 1 or 0);
        v6 = v14;
        v7 = v15;
    end;
    local v16 = buffer.create(v7);
    buffer.copy(v16, 0, v6, 0, v7);
    return v16;
end;
v3.decode = function(v17) --[[ Line: 83 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v18 = v3.new();
    local v19 = 0;
    while v19 < buffer.len(v17) do
        local v20 = nil;
        local v21 = nil;
        local v22, v23, v24 = v0.readTag(v17, v19);
        v20 = v22;
        v21 = v23;
        v19 = v24;
        if v21 == v0.wireTypes.varint then
            if v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readVarIntI64(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.creator_id = v22;
            elseif v20 == 4 then
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.is_verified = v22 ~= 0;
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
            end;
        elseif v21 == v0.wireTypes.lengthDelimited then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.creator_type = buffer.tostring(v22);
            elseif v20 == 3 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.creator_name = buffer.tostring(v22);
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v19 = v24 + v23;
            end;
        elseif v21 == v0.wireTypes.i32 then
            v22 = nil;
            v23, v24 = v0.readFixed32(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.i64 then
            v22 = nil;
            v23, v24 = v0.readFixed64(v17, v19);
            v22 = v23;
            v19 = v24;
        else
            error("Unsupported wire type: " .. v21);
        end;
    end;
    return v18;
end;
v3.jsonEncode = function(v25) --[[ Line: 141 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.creator_type ~= nil and v25.creator_type ~= "" then
        v26.creatorType = v25.creator_type;
    end;
    if v25.creator_id ~= nil and v25.creator_id ~= 0 then
        v26.creatorId = v25.creator_id;
    end;
    if v25.creator_name ~= nil and v25.creator_name ~= "" then
        v26.creatorName = v25.creator_name;
    end;
    if v25.is_verified then
        v26.isVerified = v25.is_verified;
    end;
    return v26;
end;
v3.jsonDecode = function(v27) --[[ Line: 163 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v28 = v3.new();
    if v27.creator_type ~= nil then
        v28.creator_type = v27.creator_type;
    end;
    if v27.creatorType ~= nil then
        v28.creator_type = v27.creatorType;
    end;
    if v27.creator_id ~= nil then
        v28.creator_id = v27.creator_id;
    end;
    if v27.creatorId ~= nil then
        v28.creator_id = v27.creatorId;
    end;
    if v27.creator_name ~= nil then
        v28.creator_name = v27.creator_name;
    end;
    if v27.creatorName ~= nil then
        v28.creator_name = v27.creatorName;
    end;
    if v27.is_verified ~= nil then
        v28.is_verified = v27.is_verified;
    end;
    if v27.isVerified ~= nil then
        v28.is_verified = v27.isVerified;
    end;
    return v28;
end;
v3.descriptor = {
    name = "CreatorData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CreatorData"
};
v2.CreatorData = v3;
v1.default:register(v2.CreatorData);
return {
    CreatorData = v2.CreatorData
};