local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 57 ]] --[[ Name: new ]]
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
        rsvp_count = (not (v4 ~= nil) or v4.rsvp_count == nil) and 0 or v4.rsvp_count, 
        place_id = (not (v4 ~= nil) or v4.place_id == nil) and "" or v4.place_id
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 72 ]] --[[ Name: encode ]]
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
    if v5.place_id ~= nil and v5.place_id ~= "" then
        local v26, v27 = v0.writeTag(v6, v7, 10, v0.wireTypes.lengthDelimited);
        v26, v27 = v0.writeString(v26, v27, v5.place_id);
        v6 = v26;
        v7 = v27;
    end;
    local v28 = buffer.create(v7);
    buffer.copy(v28, 0, v6, 0, v7);
    return v28;
end;
v3.decode = function(v29) --[[ Line: 131 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v30 = v3.new();
    local v31 = 0;
    while v31 < buffer.len(v29) do
        local v32 = nil;
        local v33 = nil;
        local v34, v35, v36 = v0.readTag(v29, v31);
        v32 = v34;
        v33 = v35;
        v31 = v36;
        if v33 == v0.wireTypes.varint then
            if v32 == 6 then
                v34 = nil;
                v35, v36 = v0.readVarInt(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.user_rsvp = v34 ~= 0;
            elseif v32 == 7 then
                v34 = nil;
                v35, v36 = v0.readVarIntI64(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.media_asset_id = v34;
            elseif v32 == 9 then
                v34 = nil;
                v35, v36 = v0.readVarIntI64(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.rsvp_count = v34;
            else
                v34 = nil;
                v35, v36 = v0.readVarInt(v29, v31);
                v34 = v35;
                v31 = v36;
            end;
        elseif v33 == v0.wireTypes.lengthDelimited then
            if v32 == 1 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.id = buffer.tostring(v34);
            elseif v32 == 2 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.title = buffer.tostring(v34);
            elseif v32 == 3 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.subtitle = buffer.tostring(v34);
            elseif v32 == 4 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.event_start = buffer.tostring(v34);
            elseif v32 == 5 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.event_end = buffer.tostring(v34);
            elseif v32 == 8 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.description = buffer.tostring(v34);
            elseif v32 == 10 then
                v34 = nil;
                v35, v36 = v0.readBuffer(v29, v31);
                v34 = v35;
                v31 = v36;
                v30.place_id = buffer.tostring(v34);
            else
                v34 = nil;
                v35, v36 = v0.readVarInt(v29, v31);
                v31 = v36 + v35;
            end;
        elseif v33 == v0.wireTypes.i32 then
            v34 = nil;
            v35, v36 = v0.readFixed32(v29, v31);
            v34 = v35;
            v31 = v36;
        elseif v33 == v0.wireTypes.i64 then
            v34 = nil;
            v35, v36 = v0.readFixed64(v29, v31);
            v34 = v35;
            v31 = v36;
        else
            error("Unsupported wire type: " .. v33);
        end;
    end;
    return v30;
end;
v3.jsonEncode = function(v37) --[[ Line: 219 ]] --[[ Name: jsonEncode ]]
    local v38 = {};
    if v37.id ~= nil and v37.id ~= "" then
        v38.id = v37.id;
    end;
    if v37.title ~= nil and v37.title ~= "" then
        v38.title = v37.title;
    end;
    if v37.subtitle ~= nil and v37.subtitle ~= "" then
        v38.subtitle = v37.subtitle;
    end;
    if v37.event_start ~= nil and v37.event_start ~= "" then
        v38.eventStart = v37.event_start;
    end;
    if v37.event_end ~= nil and v37.event_end ~= "" then
        v38.eventEnd = v37.event_end;
    end;
    if v37.user_rsvp then
        v38.userRsvp = v37.user_rsvp;
    end;
    if v37.media_asset_id ~= nil and v37.media_asset_id ~= 0 then
        v38.mediaAssetId = v37.media_asset_id;
    end;
    if v37.description ~= nil and v37.description ~= "" then
        v38.description = v37.description;
    end;
    if v37.rsvp_count ~= nil and v37.rsvp_count ~= 0 then
        v38.rsvpCount = v37.rsvp_count;
    end;
    if v37.place_id ~= nil and v37.place_id ~= "" then
        v38.placeId = v37.place_id;
    end;
    return v38;
end;
v3.jsonDecode = function(v39) --[[ Line: 265 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v40 = v3.new();
    if v39.id ~= nil then
        v40.id = v39.id;
    end;
    if v39.title ~= nil then
        v40.title = v39.title;
    end;
    if v39.subtitle ~= nil then
        v40.subtitle = v39.subtitle;
    end;
    if v39.event_start ~= nil then
        v40.event_start = v39.event_start;
    end;
    if v39.eventStart ~= nil then
        v40.event_start = v39.eventStart;
    end;
    if v39.event_end ~= nil then
        v40.event_end = v39.event_end;
    end;
    if v39.eventEnd ~= nil then
        v40.event_end = v39.eventEnd;
    end;
    if v39.user_rsvp ~= nil then
        v40.user_rsvp = v39.user_rsvp;
    end;
    if v39.userRsvp ~= nil then
        v40.user_rsvp = v39.userRsvp;
    end;
    if v39.media_asset_id ~= nil then
        v40.media_asset_id = v39.media_asset_id;
    end;
    if v39.mediaAssetId ~= nil then
        v40.media_asset_id = v39.mediaAssetId;
    end;
    if v39.description ~= nil then
        v40.description = v39.description;
    end;
    if v39.rsvp_count ~= nil then
        v40.rsvp_count = v39.rsvp_count;
    end;
    if v39.rsvpCount ~= nil then
        v40.rsvp_count = v39.rsvpCount;
    end;
    if v39.place_id ~= nil then
        v40.place_id = v39.place_id;
    end;
    if v39.placeId ~= nil then
        v40.place_id = v39.placeId;
    end;
    return v40;
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