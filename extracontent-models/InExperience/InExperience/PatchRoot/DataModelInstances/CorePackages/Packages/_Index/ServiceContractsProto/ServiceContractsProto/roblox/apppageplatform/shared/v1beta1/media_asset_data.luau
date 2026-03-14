local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        asset_id = (not (v4 ~= nil) or v4.asset_id == nil) and 0 or v4.asset_id, 
        asset_type_id = (not (v4 ~= nil) or v4.asset_type_id == nil) and 0 or v4.asset_type_id, 
        video_hash = (not (v4 ~= nil) or v4.video_hash == nil) and "" or v4.video_hash
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 51 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.asset_id ~= nil and v5.asset_id ~= 0 then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.asset_id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.asset_type_id ~= nil and v5.asset_type_id ~= 0 then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v5.asset_type_id);
        v6 = v10;
        v7 = v11;
    end;
    if v5.video_hash ~= nil and v5.video_hash ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.video_hash);
        v6 = v12;
        v7 = v13;
    end;
    local v14 = buffer.create(v7);
    buffer.copy(v14, 0, v6, 0, v7);
    return v14;
end;
v3.decode = function(v15) --[[ Line: 75 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v16 = v3.new();
    local v17 = 0;
    while v17 < buffer.len(v15) do
        local v18 = nil;
        local v19 = nil;
        local v20, v21, v22 = v0.readTag(v15, v17);
        v18 = v20;
        v19 = v21;
        v17 = v22;
        if v19 == v0.wireTypes.varint then
            if v18 == 1 then
                v20 = nil;
                v21, v22 = v0.readVarIntI64(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.asset_id = v20;
            elseif v18 == 2 then
                v20 = nil;
                v21, v22 = v0.readVarIntI64(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.asset_type_id = v20;
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v20 = v21;
                v17 = v22;
            end;
        elseif v19 == v0.wireTypes.lengthDelimited then
            if v18 == 3 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.video_hash = buffer.tostring(v20);
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v17 = v22 + v21;
            end;
        elseif v19 == v0.wireTypes.i32 then
            v20 = nil;
            v21, v22 = v0.readFixed32(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.i64 then
            v20 = nil;
            v21, v22 = v0.readFixed64(v15, v17);
            v20 = v21;
            v17 = v22;
        else
            error("Unsupported wire type: " .. v19);
        end;
    end;
    return v16;
end;
v3.jsonEncode = function(v23) --[[ Line: 128 ]] --[[ Name: jsonEncode ]]
    local v24 = {};
    if v23.asset_id ~= nil and v23.asset_id ~= 0 then
        v24.assetId = v23.asset_id;
    end;
    if v23.asset_type_id ~= nil and v23.asset_type_id ~= 0 then
        v24.assetTypeId = v23.asset_type_id;
    end;
    if v23.video_hash ~= nil and v23.video_hash ~= "" then
        v24.videoHash = v23.video_hash;
    end;
    return v24;
end;
v3.jsonDecode = function(v25) --[[ Line: 146 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v26 = v3.new();
    if v25.asset_id ~= nil then
        v26.asset_id = v25.asset_id;
    end;
    if v25.assetId ~= nil then
        v26.asset_id = v25.assetId;
    end;
    if v25.asset_type_id ~= nil then
        v26.asset_type_id = v25.asset_type_id;
    end;
    if v25.assetTypeId ~= nil then
        v26.asset_type_id = v25.assetTypeId;
    end;
    if v25.video_hash ~= nil then
        v26.video_hash = v25.video_hash;
    end;
    if v25.videoHash ~= nil then
        v26.video_hash = v25.videoHash;
    end;
    return v26;
end;
v3.descriptor = {
    name = "MediaAssetData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetData"
};
v2.MediaAssetData = v3;
v1.default:register(v2.MediaAssetData);
return {
    MediaAssetData = v2.MediaAssetData
};