local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and "" or v4.id, 
        title = (not (v4 ~= nil) or v4.title == nil) and "" or v4.title, 
        subtitle = (not (v4 ~= nil) or v4.subtitle == nil) and "" or v4.subtitle, 
        event_start = (not (v4 ~= nil) or v4.event_start == nil) and "" or v4.event_start, 
        event_end = (not (v4 ~= nil) or v4.event_end == nil) and "" or v4.event_end, 
        user_rsvp = v4 ~= nil and not (v4.user_rsvp == nil) and v4.user_rsvp, 
        media_asset_id = (not (v4 ~= nil) or v4.media_asset_id == nil) and 0 or v4.media_asset_id, 
        description = (not (v4 ~= nil) or v4.description == nil) and "" or v4.description, 
        rsvp_count = (not (v4 ~= nil) or v4.rsvp_count == nil) and 0 or v4.rsvp_count
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 69 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.title ~= nil and v5.title ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.title);
        v6 = v10;
        v7 = v11;
    end;
    if v5.subtitle ~= nil and v5.subtitle ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.subtitle);
        v6 = v12;
        v7 = v13;
    end;
    if v5.event_start ~= nil and v5.event_start ~= "" then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v5.event_start);
        v6 = v14;
        v7 = v15;
    end;
    if v5.event_end ~= nil and v5.event_end ~= "" then
        local v16, v17 = v0.writeTag(v6, v7, 5, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeString(v16, v17, v5.event_end);
        v6 = v16;
        v7 = v17;
    end;
    if v5.user_rsvp then
        local v18, v19 = v0.writeTag(v6, v7, 6, v0.wireTypes.varint);
        v18, v19 = v0.writeVarInt(v18, v19, v5.user_rsvp and 1 or 0);
        v6 = v18;
        v7 = v19;
    end;
    if v5.media_asset_id ~= nil and v5.media_asset_id ~= 0 then
        local v20, v21 = v0.writeTag(v6, v7, 7, v0.wireTypes.varint);
        v20, v21 = v0.writeVarInt(v20, v21, v5.media_asset_id);
        v6 = v20;
        v7 = v21;
    end;
    if v5.description ~= nil and v5.description ~= "" then
        local v22, v23 = v0.writeTag(v6, v7, 8, v0.wireTypes.lengthDelimited);
        v22, v23 = v0.writeString(v22, v23, v5.description);
        v6 = v22;
        v7 = v23;
    end;
    if v5.rsvp_count ~= nil and v5.rsvp_count ~= 0 then
        local v24, v25 = v0.writeTag(v6, v7, 9, v0.wireTypes.varint);
        v24, v25 = v0.writeVarInt(v24, v25, v5.rsvp_count);
        v6 = v24;
        v7 = v25;
    end;
    local v26 = buffer.create(v7);
    buffer.copy(v26, 0, v6, 0, v7);
    return v26;
end;
v3.decode = function(v27) --[[ Line: 123 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v28 = v3.new();
    local v29 = 0;
    while v29 < buffer.len(v27) do
        local v30 = nil;
        local v31 = nil;
        local v32, v33, v34 = v0.readTag(v27, v29);
        v30 = v32;
        v31 = v33;
        v29 = v34;
        if v31 == v0.wireTypes.varint then
            if v30 == 6 then
                v32 = nil;
                v33, v34 = v0.readVarInt(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.user_rsvp = v32 ~= 0;
            elseif v30 == 7 then
                v32 = nil;
                v33, v34 = v0.readVarIntI64(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.media_asset_id = v32;
            elseif v30 == 9 then
                v32 = nil;
                v33, v34 = v0.readVarIntI64(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.rsvp_count = v32;
            else
                v32 = nil;
                v33, v34 = v0.readVarInt(v27, v29);
                v32 = v33;
                v29 = v34;
            end;
        elseif v31 == v0.wireTypes.lengthDelimited then
            if v30 == 1 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.id = buffer.tostring(v32);
            elseif v30 == 2 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.title = buffer.tostring(v32);
            elseif v30 == 3 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.subtitle = buffer.tostring(v32);
            elseif v30 == 4 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.event_start = buffer.tostring(v32);
            elseif v30 == 5 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.event_end = buffer.tostring(v32);
            elseif v30 == 8 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.description = buffer.tostring(v32);
            else
                v32 = nil;
                v33, v34 = v0.readVarInt(v27, v29);
                v29 = v34 + v33;
            end;
        elseif v31 == v0.wireTypes.i32 then
            v32 = nil;
            v33, v34 = v0.readFixed32(v27, v29);
            v32 = v33;
            v29 = v34;
        elseif v31 == v0.wireTypes.i64 then
            v32 = nil;
            v33, v34 = v0.readFixed64(v27, v29);
            v32 = v33;
            v29 = v34;
        else
            error("Unsupported wire type: " .. v31);
        end;
    end;
    return v28;
end;
v3.jsonEncode = function(v35) --[[ Line: 206 ]] --[[ Name: jsonEncode ]]
    local v36 = {};
    if v35.id ~= nil and v35.id ~= "" then
        v36.id = v35.id;
    end;
    if v35.title ~= nil and v35.title ~= "" then
        v36.title = v35.title;
    end;
    if v35.subtitle ~= nil and v35.subtitle ~= "" then
        v36.subtitle = v35.subtitle;
    end;
    if v35.event_start ~= nil and v35.event_start ~= "" then
        v36.eventStart = v35.event_start;
    end;
    if v35.event_end ~= nil and v35.event_end ~= "" then
        v36.eventEnd = v35.event_end;
    end;
    if v35.user_rsvp then
        v36.userRsvp = v35.user_rsvp;
    end;
    if v35.media_asset_id ~= nil and v35.media_asset_id ~= 0 then
        v36.mediaAssetId = v35.media_asset_id;
    end;
    if v35.description ~= nil and v35.description ~= "" then
        v36.description = v35.description;
    end;
    if v35.rsvp_count ~= nil and v35.rsvp_count ~= 0 then
        v36.rsvpCount = v35.rsvp_count;
    end;
    return v36;
end;
v3.jsonDecode = function(v37) --[[ Line: 248 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v38 = v3.new();
    if v37.id ~= nil then
        v38.id = v37.id;
    end;
    if v37.title ~= nil then
        v38.title = v37.title;
    end;
    if v37.subtitle ~= nil then
        v38.subtitle = v37.subtitle;
    end;
    if v37.event_start ~= nil then
        v38.event_start = v37.event_start;
    end;
    if v37.eventStart ~= nil then
        v38.event_start = v37.eventStart;
    end;
    if v37.event_end ~= nil then
        v38.event_end = v37.event_end;
    end;
    if v37.eventEnd ~= nil then
        v38.event_end = v37.eventEnd;
    end;
    if v37.user_rsvp ~= nil then
        v38.user_rsvp = v37.user_rsvp;
    end;
    if v37.userRsvp ~= nil then
        v38.user_rsvp = v37.userRsvp;
    end;
    if v37.media_asset_id ~= nil then
        v38.media_asset_id = v37.media_asset_id;
    end;
    if v37.mediaAssetId ~= nil then
        v38.media_asset_id = v37.mediaAssetId;
    end;
    if v37.description ~= nil then
        v38.description = v37.description;
    end;
    if v37.rsvp_count ~= nil then
        v38.rsvp_count = v37.rsvp_count;
    end;
    if v37.rsvpCount ~= nil then
        v38.rsvp_count = v37.rsvpCount;
    end;
    return v38;
end;
v3.descriptor = {
    name = "EventData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventData"
};
v2.EventData = v3;
v1.default:register(v2.EventData);
return {
    EventData = v2.EventData
};