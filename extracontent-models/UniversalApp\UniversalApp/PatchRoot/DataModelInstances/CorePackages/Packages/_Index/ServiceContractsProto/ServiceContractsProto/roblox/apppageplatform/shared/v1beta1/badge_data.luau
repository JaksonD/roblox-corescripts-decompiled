local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 63 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        id = (not (v5 ~= nil) or v5.id == nil) and 0 or v5.id, 
        display_name = (not (v5 ~= nil) or v5.display_name == nil) and "" or v5.display_name, 
        display_icon_image_id = (not (v5 ~= nil) or v5.display_icon_image_id == nil) and 0 or v5.display_icon_image_id, 
        display_description = (not (v5 ~= nil) or v5.display_description == nil) and "" or v5.display_description, 
        total_awarded_count = (not (v5 ~= nil) or v5.total_awarded_count == nil) and 0 or v5.total_awarded_count, 
        past_day_awarded_count = (not (v5 ~= nil) or v5.past_day_awarded_count == nil) and 0 or v5.past_day_awarded_count, 
        rarity = (not (v5 ~= nil) or v5.rarity == nil) and "" or v5.rarity, 
        badge_type_label = (not (v5 ~= nil) or v5.badge_type_label == nil) and "" or v5.badge_type_label, 
        created_time = if not (v5 ~= nil) or v5.created_time == nil then nil else v5.created_time, 
        updated_time = if not (v5 ~= nil) or v5.updated_time == nil then nil else v5.updated_time, 
        is_earned_by_user = v5 ~= nil and not (v5.is_earned_by_user == nil) and v5.is_earned_by_user, 
        awarded_time = if not (v5 ~= nil) or v5.awarded_time == nil then nil else v5.awarded_time
    }, v4));
end;
v4.encode = function(v6) --[[ Line: 88 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.id ~= nil and v6.id ~= 0 then
        local v9, v10 = v0.writeTag(v7, v8, 1, v0.wireTypes.varint);
        v9, v10 = v0.writeVarInt(v9, v10, v6.id);
        v7 = v9;
        v8 = v10;
    end;
    if v6.display_name ~= nil and v6.display_name ~= "" then
        local v11, v12 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeString(v11, v12, v6.display_name);
        v7 = v11;
        v8 = v12;
    end;
    if v6.display_icon_image_id ~= nil and v6.display_icon_image_id ~= 0 then
        local v13, v14 = v0.writeTag(v7, v8, 3, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v6.display_icon_image_id);
        v7 = v13;
        v8 = v14;
    end;
    if v6.display_description ~= nil and v6.display_description ~= "" then
        local v15, v16 = v0.writeTag(v7, v8, 4, v0.wireTypes.lengthDelimited);
        v15, v16 = v0.writeString(v15, v16, v6.display_description);
        v7 = v15;
        v8 = v16;
    end;
    if v6.total_awarded_count ~= nil and v6.total_awarded_count ~= 0 then
        local v17, v18 = v0.writeTag(v7, v8, 5, v0.wireTypes.varint);
        v17, v18 = v0.writeVarInt(v17, v18, v6.total_awarded_count);
        v7 = v17;
        v8 = v18;
    end;
    if v6.past_day_awarded_count ~= nil and v6.past_day_awarded_count ~= 0 then
        local v19, v20 = v0.writeTag(v7, v8, 6, v0.wireTypes.varint);
        v19, v20 = v0.writeVarInt(v19, v20, v6.past_day_awarded_count);
        v7 = v19;
        v8 = v20;
    end;
    if v6.rarity ~= nil and v6.rarity ~= "" then
        local v21, v22 = v0.writeTag(v7, v8, 7, v0.wireTypes.lengthDelimited);
        v21, v22 = v0.writeString(v21, v22, v6.rarity);
        v7 = v21;
        v8 = v22;
    end;
    if v6.badge_type_label ~= nil and v6.badge_type_label ~= "" then
        local v23, v24 = v0.writeTag(v7, v8, 8, v0.wireTypes.lengthDelimited);
        v23, v24 = v0.writeString(v23, v24, v6.badge_type_label);
        v7 = v23;
        v8 = v24;
    end;
    if v6.created_time ~= nil then
        local v25 = v6.created_time:encode();
        local v26, v27 = v0.writeTag(v7, v8, 9, v0.wireTypes.lengthDelimited);
        v26, v27 = v0.writeBuffer(v26, v27, v25, buffer.len(v25));
        v7 = v26;
        v8 = v27;
    end;
    if v6.updated_time ~= nil then
        local v28 = v6.updated_time:encode();
        local v29, v30 = v0.writeTag(v7, v8, 10, v0.wireTypes.lengthDelimited);
        v29, v30 = v0.writeBuffer(v29, v30, v28, buffer.len(v28));
        v7 = v29;
        v8 = v30;
    end;
    if v6.is_earned_by_user then
        local v31, v32 = v0.writeTag(v7, v8, 11, v0.wireTypes.varint);
        v31, v32 = v0.writeVarInt(v31, v32, v6.is_earned_by_user and 1 or 0);
        v7 = v31;
        v8 = v32;
    end;
    if v6.awarded_time ~= nil then
        local v33 = v6.awarded_time:encode();
        local v34, v35 = v0.writeTag(v7, v8, 12, v0.wireTypes.lengthDelimited);
        v34, v35 = v0.writeBuffer(v34, v35, v33, buffer.len(v33));
        v7 = v34;
        v8 = v35;
    end;
    local v36 = buffer.create(v8);
    buffer.copy(v36, 0, v7, 0, v8);
    return v36;
end;
v4.decode = function(v37) --[[ Line: 160 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    local v38 = v4.new();
    local v39 = 0;
    while v39 < buffer.len(v37) do
        local v40 = nil;
        local v41 = nil;
        local v42, v43, v44 = v0.readTag(v37, v39);
        v40 = v42;
        v41 = v43;
        v39 = v44;
        if v41 == v0.wireTypes.varint then
            if v40 == 1 then
                v42 = nil;
                v43, v44 = v0.readVarIntI64(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.id = v42;
            elseif v40 == 3 then
                v42 = nil;
                v43, v44 = v0.readVarIntI64(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.display_icon_image_id = v42;
            elseif v40 == 5 then
                v42 = nil;
                v43, v44 = v0.readVarIntI64(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.total_awarded_count = v42;
            elseif v40 == 6 then
                v42 = nil;
                v43, v44 = v0.readVarIntI64(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.past_day_awarded_count = v42;
            elseif v40 == 11 then
                v42 = nil;
                v43, v44 = v0.readVarInt(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.is_earned_by_user = v42 ~= 0;
            else
                v42 = nil;
                v43, v44 = v0.readVarInt(v37, v39);
                v42 = v43;
                v39 = v44;
            end;
        elseif v41 == v0.wireTypes.lengthDelimited then
            if v40 == 2 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.display_name = buffer.tostring(v42);
            elseif v40 == 4 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.display_description = buffer.tostring(v42);
            elseif v40 == 7 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.rarity = buffer.tostring(v42);
            elseif v40 == 8 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.badge_type_label = buffer.tostring(v42);
            elseif v40 == 9 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.created_time = v3.Timestamp.decode(v42);
            elseif v40 == 10 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.updated_time = v3.Timestamp.decode(v42);
            elseif v40 == 12 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.awarded_time = v3.Timestamp.decode(v42);
            else
                v42 = nil;
                v43, v44 = v0.readVarInt(v37, v39);
                v39 = v44 + v43;
            end;
        elseif v41 == v0.wireTypes.i32 then
            v42 = nil;
            v43, v44 = v0.readFixed32(v37, v39);
            v42 = v43;
            v39 = v44;
        elseif v41 == v0.wireTypes.i64 then
            v42 = nil;
            v43, v44 = v0.readFixed64(v37, v39);
            v42 = v43;
            v39 = v44;
        else
            error("Unsupported wire type: " .. v41);
        end;
    end;
    return v38;
end;
v4.jsonEncode = function(v45) --[[ Line: 258 ]] --[[ Name: jsonEncode ]]
    local v46 = {};
    if v45.id ~= nil and v45.id ~= 0 then
        v46.id = v45.id;
    end;
    if v45.display_name ~= nil and v45.display_name ~= "" then
        v46.displayName = v45.display_name;
    end;
    if v45.display_icon_image_id ~= nil and v45.display_icon_image_id ~= 0 then
        v46.displayIconImageId = v45.display_icon_image_id;
    end;
    if v45.display_description ~= nil and v45.display_description ~= "" then
        v46.displayDescription = v45.display_description;
    end;
    if v45.total_awarded_count ~= nil and v45.total_awarded_count ~= 0 then
        v46.totalAwardedCount = v45.total_awarded_count;
    end;
    if v45.past_day_awarded_count ~= nil and v45.past_day_awarded_count ~= 0 then
        v46.pastDayAwardedCount = v45.past_day_awarded_count;
    end;
    if v45.rarity ~= nil and v45.rarity ~= "" then
        v46.rarity = v45.rarity;
    end;
    if v45.badge_type_label ~= nil and v45.badge_type_label ~= "" then
        v46.badgeTypeLabel = v45.badge_type_label;
    end;
    if v45.created_time ~= nil then
        v46.createdTime = v45.created_time:jsonEncode();
    end;
    if v45.updated_time ~= nil then
        v46.updatedTime = v45.updated_time:jsonEncode();
    end;
    if v45.is_earned_by_user then
        v46.isEarnedByUser = v45.is_earned_by_user;
    end;
    if v45.awarded_time ~= nil then
        v46.awardedTime = v45.awarded_time:jsonEncode();
    end;
    return v46;
end;
v4.jsonDecode = function(v47) --[[ Line: 312 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v48 = v4.new();
    if v47.id ~= nil then
        v48.id = v47.id;
    end;
    if v47.display_name ~= nil then
        v48.display_name = v47.display_name;
    end;
    if v47.displayName ~= nil then
        v48.display_name = v47.displayName;
    end;
    if v47.display_icon_image_id ~= nil then
        v48.display_icon_image_id = v47.display_icon_image_id;
    end;
    if v47.displayIconImageId ~= nil then
        v48.display_icon_image_id = v47.displayIconImageId;
    end;
    if v47.display_description ~= nil then
        v48.display_description = v47.display_description;
    end;
    if v47.displayDescription ~= nil then
        v48.display_description = v47.displayDescription;
    end;
    if v47.total_awarded_count ~= nil then
        v48.total_awarded_count = v47.total_awarded_count;
    end;
    if v47.totalAwardedCount ~= nil then
        v48.total_awarded_count = v47.totalAwardedCount;
    end;
    if v47.past_day_awarded_count ~= nil then
        v48.past_day_awarded_count = v47.past_day_awarded_count;
    end;
    if v47.pastDayAwardedCount ~= nil then
        v48.past_day_awarded_count = v47.pastDayAwardedCount;
    end;
    if v47.rarity ~= nil then
        v48.rarity = v47.rarity;
    end;
    if v47.badge_type_label ~= nil then
        v48.badge_type_label = v47.badge_type_label;
    end;
    if v47.badgeTypeLabel ~= nil then
        v48.badge_type_label = v47.badgeTypeLabel;
    end;
    if v47.created_time ~= nil then
        v48.created_time = v3.Timestamp.jsonDecode(v47.created_time);
    end;
    if v47.createdTime ~= nil then
        v48.created_time = v3.Timestamp.jsonDecode(v47.createdTime);
    end;
    if v47.updated_time ~= nil then
        v48.updated_time = v3.Timestamp.jsonDecode(v47.updated_time);
    end;
    if v47.updatedTime ~= nil then
        v48.updated_time = v3.Timestamp.jsonDecode(v47.updatedTime);
    end;
    if v47.is_earned_by_user ~= nil then
        v48.is_earned_by_user = v47.is_earned_by_user;
    end;
    if v47.isEarnedByUser ~= nil then
        v48.is_earned_by_user = v47.isEarnedByUser;
    end;
    if v47.awarded_time ~= nil then
        v48.awarded_time = v3.Timestamp.jsonDecode(v47.awarded_time);
    end;
    if v47.awardedTime ~= nil then
        v48.awarded_time = v3.Timestamp.jsonDecode(v47.awardedTime);
    end;
    return v48;
end;
v4.descriptor = {
    name = "BadgeData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeData"
};
v2.BadgeData = v4;
v1.default:register(v2.BadgeData);
return {
    BadgeData = v2.BadgeData
};