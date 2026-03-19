local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and "" or v4.id, 
        media_asset_id = (not (v4 ~= nil) or v4.media_asset_id == nil) and "" or v4.media_asset_id, 
        title = (not (v4 ~= nil) or v4.title == nil) and "" or v4.title, 
        artist = (not (v4 ~= nil) or v4.artist == nil) and "" or v4.artist
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 54 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.media_asset_id ~= nil and v5.media_asset_id ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.media_asset_id);
        v6 = v10;
        v7 = v11;
    end;
    if v5.title ~= nil and v5.title ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.title);
        v6 = v12;
        v7 = v13;
    end;
    if v5.artist ~= nil and v5.artist ~= "" then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v5.artist);
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
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.lengthDelimited then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.id = buffer.tostring(v22);
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.media_asset_id = buffer.tostring(v22);
            elseif v20 == 3 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.title = buffer.tostring(v22);
            elseif v20 == 4 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.artist = buffer.tostring(v22);
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
    if v25.id ~= nil and v25.id ~= "" then
        v26.id = v25.id;
    end;
    if v25.media_asset_id ~= nil and v25.media_asset_id ~= "" then
        v26.mediaAssetId = v25.media_asset_id;
    end;
    if v25.title ~= nil and v25.title ~= "" then
        v26.title = v25.title;
    end;
    if v25.artist ~= nil and v25.artist ~= "" then
        v26.artist = v25.artist;
    end;
    return v26;
end;
v3.jsonDecode = function(v27) --[[ Line: 163 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v28 = v3.new();
    if v27.id ~= nil then
        v28.id = v27.id;
    end;
    if v27.media_asset_id ~= nil then
        v28.media_asset_id = v27.media_asset_id;
    end;
    if v27.mediaAssetId ~= nil then
        v28.media_asset_id = v27.mediaAssetId;
    end;
    if v27.title ~= nil then
        v28.title = v27.title;
    end;
    if v27.artist ~= nil then
        v28.artist = v27.artist;
    end;
    return v28;
end;
v3.descriptor = {
    name = "SongData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongData"
};
v2.SongData = v3;
v1.default:register(v2.SongData);
return {
    SongData = v2.SongData
};