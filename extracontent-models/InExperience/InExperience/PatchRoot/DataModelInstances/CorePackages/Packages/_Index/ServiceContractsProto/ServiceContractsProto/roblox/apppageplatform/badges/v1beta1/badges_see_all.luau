local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry);
local v6 = require(script.Parent.Parent.Parent.shared.v1beta1.universal_page_entry);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 290 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_v7_0 (copy)
    return (setmetatable({
        universe_id = (not (v9 ~= nil) or v9.universe_id == nil) and 0 or v9.universe_id, 
        user_id = (not (v9 ~= nil) or v9.user_id == nil) and 0 or v9.user_id, 
        page_size = (not (v9 ~= nil) or v9.page_size == nil) and 0 or v9.page_size, 
        cursor = (not (v9 ~= nil) or v9.cursor == nil) and "" or v9.cursor, 
        page_entry_format = if not (v9 ~= nil) or v9.page_entry_format == nil then assert(v6.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else v9.page_entry_format
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 305 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v6 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.universe_id ~= nil and v10.universe_id ~= 0 then
        local v13, v14 = v0.writeTag(v11, v12, 1, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v10.universe_id);
        v11 = v13;
        v12 = v14;
    end;
    if v10.user_id ~= nil and v10.user_id ~= 0 then
        local v15, v16 = v0.writeTag(v11, v12, 2, v0.wireTypes.varint);
        v15, v16 = v0.writeVarInt(v15, v16, v10.user_id);
        v11 = v15;
        v12 = v16;
    end;
    if v10.page_size ~= nil and v10.page_size ~= 0 then
        local v17, v18 = v0.writeTag(v11, v12, 3, v0.wireTypes.varint);
        v17, v18 = v0.writeVarInt(v17, v18, v10.page_size);
        v11 = v17;
        v12 = v18;
    end;
    if v10.cursor ~= nil and v10.cursor ~= "" then
        local v19, v20 = v0.writeTag(v11, v12, 4, v0.wireTypes.lengthDelimited);
        v19, v20 = v0.writeString(v19, v20, v10.cursor);
        v11 = v19;
        v12 = v20;
    end;
    if v10.page_entry_format ~= nil and (v10.page_entry_format ~= nil and v10.page_entry_format ~= 0 or v10.page_entry_format ~= v6.PageEntryFormat.fromNumber(0)) then
        local v21, v22 = v0.writeTag(v11, v12, 5, v0.wireTypes.varint);
        v21, v22 = v0.writeVarInt(v21, v22, v6.PageEntryFormat.toNumber(v10.page_entry_format));
        v11 = v21;
        v12 = v22;
    end;
    local v23 = buffer.create(v12);
    buffer.copy(v23, 0, v11, 0, v12);
    return v23;
end;
v7.decode = function(v24) --[[ Line: 352 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v6 (copy)
    local v25 = l_v7_0.new();
    local v26 = 0;
    while v26 < buffer.len(v24) do
        local v27 = nil;
        local v28 = nil;
        local v29, v30, v31 = v0.readTag(v24, v26);
        v27 = v29;
        v28 = v30;
        v26 = v31;
        if v28 == v0.wireTypes.varint then
            if v27 == 1 then
                v29 = nil;
                v30, v31 = v0.readVarIntI64(v24, v26);
                v29 = v30;
                v26 = v31;
                v25.universe_id = v29;
            elseif v27 == 2 then
                v29 = nil;
                v30, v31 = v0.readVarIntI64(v24, v26);
                v29 = v30;
                v26 = v31;
                v25.user_id = v29;
            elseif v27 == 3 then
                v29 = nil;
                v30, v31 = v0.readVarIntI32(v24, v26);
                v29 = v30;
                v26 = v31;
                v25.page_size = v29;
            elseif v27 == 5 then
                v29 = nil;
                v30, v31 = v0.readVarIntI32(v24, v26);
                v29 = v30;
                v26 = v31;
                v25.page_entry_format = v6.PageEntryFormat.fromNumber(v29) or v29;
            else
                v29 = nil;
                v30, v31 = v0.readVarInt(v24, v26);
                v29 = v30;
                v26 = v31;
            end;
        elseif v28 == v0.wireTypes.lengthDelimited then
            if v27 == 4 then
                v29 = nil;
                v30, v31 = v0.readBuffer(v24, v26);
                v29 = v30;
                v26 = v31;
                v25.cursor = buffer.tostring(v29);
            else
                v29 = nil;
                v30, v31 = v0.readVarInt(v24, v26);
                v26 = v31 + v30;
            end;
        elseif v28 == v0.wireTypes.i32 then
            v29 = nil;
            v30, v31 = v0.readFixed32(v24, v26);
            v29 = v30;
            v26 = v31;
        elseif v28 == v0.wireTypes.i64 then
            v29 = nil;
            v30, v31 = v0.readFixed64(v24, v26);
            v29 = v30;
            v26 = v31;
        else
            error("Unsupported wire type: " .. v28);
        end;
    end;
    return v25;
end;
v7.jsonEncode = function(v32) --[[ Line: 418 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v6 (copy)
    local v33 = {};
    if v32.universe_id ~= nil and v32.universe_id ~= 0 then
        v33.universeId = v32.universe_id;
    end;
    if v32.user_id ~= nil and v32.user_id ~= 0 then
        v33.userId = v32.user_id;
    end;
    if v32.page_size ~= nil and v32.page_size ~= 0 then
        v33.pageSize = v32.page_size;
    end;
    if v32.cursor ~= nil and v32.cursor ~= "" then
        v33.cursor = v32.cursor;
    end;
    if v32.page_entry_format ~= nil and (v32.page_entry_format ~= nil and v32.page_entry_format ~= 0 or v32.page_entry_format ~= v6.PageEntryFormat.fromNumber(0)) then
        v33.pageEntryFormat = if typeof(v32.page_entry_format) == "number" then v32.page_entry_format else v6.PageEntryFormat.toNumber(v32.page_entry_format);
    end;
    return v33;
end;
v7.jsonDecode = function(v34) --[[ Line: 455 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v6 (copy)
    local v35 = l_v7_0.new();
    if v34.universe_id ~= nil then
        v35.universe_id = v34.universe_id;
    end;
    if v34.universeId ~= nil then
        v35.universe_id = v34.universeId;
    end;
    if v34.user_id ~= nil then
        v35.user_id = v34.user_id;
    end;
    if v34.userId ~= nil then
        v35.user_id = v34.userId;
    end;
    if v34.page_size ~= nil then
        v35.page_size = v34.page_size;
    end;
    if v34.pageSize ~= nil then
        v35.page_size = v34.pageSize;
    end;
    if v34.cursor ~= nil then
        v35.cursor = v34.cursor;
    end;
    if v34.page_entry_format ~= nil then
        v35.page_entry_format = if typeof(v34.page_entry_format) == "number" then v6.PageEntryFormat.fromNumber(v34.page_entry_format) or v34.page_entry_format else v6.PageEntryFormat.fromName(v34.page_entry_format) or v34.page_entry_format;
    end;
    if v34.pageEntryFormat ~= nil then
        v35.page_entry_format = if typeof(v34.pageEntryFormat) == "number" then v6.PageEntryFormat.fromNumber(v34.pageEntryFormat) or v34.pageEntryFormat else v6.PageEntryFormat.fromName(v34.pageEntryFormat) or v34.pageEntryFormat;
    end;
    return v35;
end;
v7.descriptor = {
    name = "BadgesSeeAllRequest", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllRequest"
};
v2.BadgesSeeAllRequest = v7;
v1.default:register(v2.BadgesSeeAllRequest);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v37) --[[ Line: 523 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        page_size = (not (v37 ~= nil) or v37.page_size == nil) and 0 or v37.page_size, 
        next_cursor = (not (v37 ~= nil) or v37.next_cursor == nil) and "" or v37.next_cursor, 
        prev_cursor = (not (v37 ~= nil) or v37.prev_cursor == nil) and "" or v37.prev_cursor, 
        total = (not (v37 ~= nil) or v37.total == nil) and 0 or v37.total
    }, l_v7_1));
end;
v7.encode = function(v38) --[[ Line: 532 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v39 = buffer.create(0);
    local v40 = 0;
    if v38.page_size ~= nil and v38.page_size ~= 0 then
        local v41, v42 = v0.writeTag(v39, v40, 1, v0.wireTypes.varint);
        v41, v42 = v0.writeVarInt(v41, v42, v38.page_size);
        v39 = v41;
        v40 = v42;
    end;
    if v38.next_cursor ~= nil and v38.next_cursor ~= "" then
        local v43, v44 = v0.writeTag(v39, v40, 2, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeString(v43, v44, v38.next_cursor);
        v39 = v43;
        v40 = v44;
    end;
    if v38.prev_cursor ~= nil and v38.prev_cursor ~= "" then
        local v45, v46 = v0.writeTag(v39, v40, 3, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeString(v45, v46, v38.prev_cursor);
        v39 = v45;
        v40 = v46;
    end;
    if v38.total ~= nil and v38.total ~= 0 then
        local v47, v48 = v0.writeTag(v39, v40, 4, v0.wireTypes.varint);
        v47, v48 = v0.writeVarInt(v47, v48, v38.total);
        v39 = v47;
        v40 = v48;
    end;
    local v49 = buffer.create(v40);
    buffer.copy(v49, 0, v39, 0, v40);
    return v49;
end;
v7.decode = function(v50) --[[ Line: 561 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy)
    local v51 = l_v7_1.new();
    local v52 = 0;
    while v52 < buffer.len(v50) do
        local v53 = nil;
        local v54 = nil;
        local v55, v56, v57 = v0.readTag(v50, v52);
        v53 = v55;
        v54 = v56;
        v52 = v57;
        if v54 == v0.wireTypes.varint then
            if v53 == 1 then
                v55 = nil;
                v56, v57 = v0.readVarIntI32(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.page_size = v55;
            elseif v53 == 4 then
                v55 = nil;
                v56, v57 = v0.readVarIntI64(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.total = v55;
            else
                v55 = nil;
                v56, v57 = v0.readVarInt(v50, v52);
                v55 = v56;
                v52 = v57;
            end;
        elseif v54 == v0.wireTypes.lengthDelimited then
            if v53 == 2 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.next_cursor = buffer.tostring(v55);
            elseif v53 == 3 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.prev_cursor = buffer.tostring(v55);
            else
                v55 = nil;
                v56, v57 = v0.readVarInt(v50, v52);
                v52 = v57 + v56;
            end;
        elseif v54 == v0.wireTypes.i32 then
            v55 = nil;
            v56, v57 = v0.readFixed32(v50, v52);
            v55 = v56;
            v52 = v57;
        elseif v54 == v0.wireTypes.i64 then
            v55 = nil;
            v56, v57 = v0.readFixed64(v50, v52);
            v55 = v56;
            v52 = v57;
        else
            error("Unsupported wire type: " .. v54);
        end;
    end;
    return v51;
end;
v7.jsonEncode = function(v58) --[[ Line: 619 ]] --[[ Name: jsonEncode ]]
    local v59 = {};
    if v58.page_size ~= nil and v58.page_size ~= 0 then
        v59.pageSize = v58.page_size;
    end;
    if v58.next_cursor ~= nil and v58.next_cursor ~= "" then
        v59.nextCursor = v58.next_cursor;
    end;
    if v58.prev_cursor ~= nil and v58.prev_cursor ~= "" then
        v59.prevCursor = v58.prev_cursor;
    end;
    if v58.total ~= nil and v58.total ~= 0 then
        v59.total = v58.total;
    end;
    return v59;
end;
v7.jsonDecode = function(v60) --[[ Line: 641 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy)
    local v61 = l_v7_1.new();
    if v60.page_size ~= nil then
        v61.page_size = v60.page_size;
    end;
    if v60.pageSize ~= nil then
        v61.page_size = v60.pageSize;
    end;
    if v60.next_cursor ~= nil then
        v61.next_cursor = v60.next_cursor;
    end;
    if v60.nextCursor ~= nil then
        v61.next_cursor = v60.nextCursor;
    end;
    if v60.prev_cursor ~= nil then
        v61.prev_cursor = v60.prev_cursor;
    end;
    if v60.prevCursor ~= nil then
        v61.prev_cursor = v60.prevCursor;
    end;
    if v60.total ~= nil then
        v61.total = v60.total;
    end;
    return v61;
end;
v7.descriptor = {
    name = "Pagination", 
    fullName = "roblox.apppageplatform.badges.v1beta1.Pagination"
};
v2.Pagination = v7;
v1.default:register(v2.Pagination);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v63) --[[ Line: 689 ]] --[[ Name: new ]]
    -- upvalues: l_v7_2 (copy)
    return (setmetatable({
        section_title = (not (v63 ~= nil) or v63.section_title == nil) and "" or v63.section_title, 
        badges = if not (v63 ~= nil) or v63.badges == nil then {} else v63.badges, 
        collection_id = (not (v63 ~= nil) or v63.collection_id == nil) and "" or v63.collection_id, 
        collection_position = (not (v63 ~= nil) or v63.collection_position == nil) and "" or v63.collection_position, 
        universe_id = (not (v63 ~= nil) or v63.universe_id == nil) and "" or v63.universe_id
    }, l_v7_2));
end;
v7.encode = function(v64) --[[ Line: 701 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v65 = buffer.create(0);
    local v66 = 0;
    if v64.section_title ~= nil and v64.section_title ~= "" then
        local v67, v68 = v0.writeTag(v65, v66, 1, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeString(v67, v68, v64.section_title);
        v65 = v67;
        v66 = v68;
    end;
    if v64.badges ~= nil and #v64.badges > 0 then
        for _, v70 in v64.badges do
            local v71 = v70:encode();
            local v72, v73 = v0.writeTag(v65, v66, 2, v0.wireTypes.lengthDelimited);
            v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
            v65 = v72;
            v66 = v73;
        end;
    end;
    if v64.collection_id ~= nil and v64.collection_id ~= "" then
        local v74, v75 = v0.writeTag(v65, v66, 3, v0.wireTypes.lengthDelimited);
        v74, v75 = v0.writeString(v74, v75, v64.collection_id);
        v65 = v74;
        v66 = v75;
    end;
    if v64.collection_position ~= nil and v64.collection_position ~= "" then
        local v76, v77 = v0.writeTag(v65, v66, 4, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeString(v76, v77, v64.collection_position);
        v65 = v76;
        v66 = v77;
    end;
    if v64.universe_id ~= nil and v64.universe_id ~= "" then
        local v78, v79 = v0.writeTag(v65, v66, 5, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeString(v78, v79, v64.universe_id);
        v65 = v78;
        v66 = v79;
    end;
    local v80 = buffer.create(v66);
    buffer.copy(v80, 0, v65, 0, v66);
    return v80;
end;
v7.decode = function(v81) --[[ Line: 738 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_2 (copy), v0 (copy), v2 (copy)
    local v82 = l_v7_2.new();
    local v83 = 0;
    while v83 < buffer.len(v81) do
        local v84 = nil;
        local v85 = nil;
        local v86, v87, v88 = v0.readTag(v81, v83);
        v84 = v86;
        v85 = v87;
        v83 = v88;
        if v85 == v0.wireTypes.varint then
            v86 = nil;
            v87, v88 = v0.readVarInt(v81, v83);
            v86 = v87;
            v83 = v88;
        elseif v85 == v0.wireTypes.lengthDelimited then
            if v84 == 1 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                v82.section_title = buffer.tostring(v86);
            elseif v84 == 2 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                table.insert(v82.badges, v2.BadgesGridPageEntry_BadgeInputData.decode(v86));
            elseif v84 == 3 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                v82.collection_id = buffer.tostring(v86);
            elseif v84 == 4 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                v82.collection_position = buffer.tostring(v86);
            elseif v84 == 5 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                v82.universe_id = buffer.tostring(v86);
            else
                v86 = nil;
                v87, v88 = v0.readVarInt(v81, v83);
                v83 = v88 + v87;
            end;
        elseif v85 == v0.wireTypes.i32 then
            v86 = nil;
            v87, v88 = v0.readFixed32(v81, v83);
            v86 = v87;
            v83 = v88;
        elseif v85 == v0.wireTypes.i64 then
            v86 = nil;
            v87, v88 = v0.readFixed64(v81, v83);
            v86 = v87;
            v83 = v88;
        else
            error("Unsupported wire type: " .. v85);
        end;
    end;
    return v82;
end;
v7.jsonEncode = function(v89) --[[ Line: 801 ]] --[[ Name: jsonEncode ]]
    local v90 = {};
    if v89.section_title ~= nil and v89.section_title ~= "" then
        v90.sectionTitle = v89.section_title;
    end;
    if v89.badges ~= nil and #v89.badges > 0 then
        local v91 = {};
        for _, v93 in v89.badges do
            table.insert(v91, v93:jsonEncode());
        end;
        v90.badges = v91;
    end;
    if v89.collection_id ~= nil and v89.collection_id ~= "" then
        v90.collectionId = v89.collection_id;
    end;
    if v89.collection_position ~= nil and v89.collection_position ~= "" then
        v90.collectionPosition = v89.collection_position;
    end;
    if v89.universe_id ~= nil and v89.universe_id ~= "" then
        v90.universeId = v89.universe_id;
    end;
    return v90;
end;
v7.jsonDecode = function(v94) --[[ Line: 831 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v2 (copy)
    local v95 = l_v7_2.new();
    if v94.section_title ~= nil then
        v95.section_title = v94.section_title;
    end;
    if v94.sectionTitle ~= nil then
        v95.section_title = v94.sectionTitle;
    end;
    if v94.badges ~= nil then
        local v96 = {};
        for _, v98 in v94.badges do
            table.insert(v96, v2.BadgesGridPageEntry_BadgeInputData.jsonDecode(v98));
        end;
        v95.badges = v96;
    end;
    if v94.collection_id ~= nil then
        v95.collection_id = v94.collection_id;
    end;
    if v94.collectionId ~= nil then
        v95.collection_id = v94.collectionId;
    end;
    if v94.collection_position ~= nil then
        v95.collection_position = v94.collection_position;
    end;
    if v94.collectionPosition ~= nil then
        v95.collection_position = v94.collectionPosition;
    end;
    if v94.universe_id ~= nil then
        v95.universe_id = v94.universe_id;
    end;
    if v94.universeId ~= nil then
        v95.universe_id = v94.universeId;
    end;
    return v95;
end;
v7.descriptor = {
    name = "BadgesGridPageEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgesGridPageEntry"
};
v2.BadgesGridPageEntry = v7;
v1.default:register(v2.BadgesGridPageEntry);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v100) --[[ Line: 892 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        badge_id = (not (v100 ~= nil) or v100.badge_id == nil) and "" or v100.badge_id
    }, l_v7_3));
end;
v7.encode = function(v101) --[[ Line: 900 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v102 = buffer.create(0);
    local v103 = 0;
    if v101.badge_id ~= nil and v101.badge_id ~= "" then
        local v104, v105 = v0.writeTag(v102, v103, 1, v0.wireTypes.lengthDelimited);
        v104, v105 = v0.writeString(v104, v105, v101.badge_id);
        v102 = v104;
        v103 = v105;
    end;
    local v106 = buffer.create(v103);
    buffer.copy(v106, 0, v102, 0, v103);
    return v106;
end;
v7.decode = function(v107) --[[ Line: 914 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy)
    local v108 = l_v7_3.new();
    local v109 = 0;
    while v109 < buffer.len(v107) do
        local v110 = nil;
        local v111 = nil;
        local v112, v113, v114 = v0.readTag(v107, v109);
        v110 = v112;
        v111 = v113;
        v109 = v114;
        if v111 == v0.wireTypes.varint then
            v112 = nil;
            v113, v114 = v0.readVarInt(v107, v109);
            v112 = v113;
            v109 = v114;
        elseif v111 == v0.wireTypes.lengthDelimited then
            if v110 == 1 then
                v112 = nil;
                v113, v114 = v0.readBuffer(v107, v109);
                v112 = v113;
                v109 = v114;
                v108.badge_id = buffer.tostring(v112);
            else
                v112 = nil;
                v113, v114 = v0.readVarInt(v107, v109);
                v109 = v114 + v113;
            end;
        elseif v111 == v0.wireTypes.i32 then
            v112 = nil;
            v113, v114 = v0.readFixed32(v107, v109);
            v112 = v113;
            v109 = v114;
        elseif v111 == v0.wireTypes.i64 then
            v112 = nil;
            v113, v114 = v0.readFixed64(v107, v109);
            v112 = v113;
            v109 = v114;
        else
            error("Unsupported wire type: " .. v111);
        end;
    end;
    return v108;
end;
v7.jsonEncode = function(v115) --[[ Line: 957 ]] --[[ Name: jsonEncode ]]
    local v116 = {};
    if v115.badge_id ~= nil and v115.badge_id ~= "" then
        v116.badgeId = v115.badge_id;
    end;
    return v116;
end;
v7.jsonDecode = function(v117) --[[ Line: 967 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy)
    local v118 = l_v7_3.new();
    if v117.badge_id ~= nil then
        v118.badge_id = v117.badge_id;
    end;
    if v117.badgeId ~= nil then
        v118.badge_id = v117.badgeId;
    end;
    return v118;
end;
v7.descriptor = {
    name = "BadgesGridPageEntry_BadgeInputData", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeInputData"
};
v2.BadgesGridPageEntry_BadgeInputData = v7;
v1.default:register(v2.BadgesGridPageEntry_BadgeInputData);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v120) --[[ Line: 997 ]] --[[ Name: new ]]
    -- upvalues: l_v7_4 (copy)
    return (setmetatable({
        page_entry = if not (v120 ~= nil) or v120.page_entry == nil then nil else v120.page_entry, 
        kind = if not (v120 ~= nil) or v120.kind == nil then nil else v120.kind
    }, l_v7_4));
end;
v7.encode = function(v121) --[[ Line: 1004 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v122 = buffer.create(0);
    local v123 = 0;
    if v121.page_entry ~= nil then
        local v124 = v121.page_entry:encode();
        local v125, v126 = v0.writeTag(v122, v123, 1, v0.wireTypes.lengthDelimited);
        v125, v126 = v0.writeBuffer(v125, v126, v124, buffer.len(v124));
        v122 = v125;
        v123 = v126;
    end;
    if v121.kind ~= nil and v121.kind.type == "badges_grid" then
        local v127 = v121.kind.value:encode();
        local v128, v129 = v0.writeTag(v122, v123, 2, v0.wireTypes.lengthDelimited);
        v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
        v122 = v128;
        v123 = v129;
    end;
    local v130 = buffer.create(v123);
    buffer.copy(v130, 0, v122, 0, v123);
    return v130;
end;
v7.decode = function(v131) --[[ Line: 1027 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v132 = l_v7_4.new();
    local v133 = 0;
    while v133 < buffer.len(v131) do
        local v134 = nil;
        local v135 = nil;
        local v136, v137, v138 = v0.readTag(v131, v133);
        v134 = v136;
        v135 = v137;
        v133 = v138;
        if v135 == v0.wireTypes.varint then
            v136 = nil;
            v137, v138 = v0.readVarInt(v131, v133);
            v136 = v137;
            v133 = v138;
        elseif v135 == v0.wireTypes.lengthDelimited then
            if v134 == 1 then
                v136 = nil;
                v137, v138 = v0.readBuffer(v131, v133);
                v136 = v137;
                v133 = v138;
                v132.page_entry = v5.PageEntry.decode(v136);
            elseif v134 == 2 then
                v136 = nil;
                v137, v138 = v0.readBuffer(v131, v133);
                v136 = v137;
                v133 = v138;
                v132.kind = {
                    type = "badges_grid", 
                    value = v2.BadgesGridPageEntry.decode(v136)
                };
            else
                v136 = nil;
                v137, v138 = v0.readVarInt(v131, v133);
                v133 = v138 + v137;
            end;
        elseif v135 == v0.wireTypes.i32 then
            v136 = nil;
            v137, v138 = v0.readFixed32(v131, v133);
            v136 = v137;
            v133 = v138;
        elseif v135 == v0.wireTypes.i64 then
            v136 = nil;
            v137, v138 = v0.readFixed64(v131, v133);
            v136 = v137;
            v133 = v138;
        else
            error("Unsupported wire type: " .. v135);
        end;
    end;
    return v132;
end;
v7.jsonEncode = function(v139) --[[ Line: 1075 ]] --[[ Name: jsonEncode ]]
    local v140 = {};
    if v139.page_entry ~= nil then
        v140.pageEntry = v139.page_entry:jsonEncode();
    end;
    if v139.kind ~= nil and v139.kind.type == "badges_grid" then
        v140.badgesGrid = v139.kind.value:jsonEncode();
    end;
    return v140;
end;
v7.jsonDecode = function(v141) --[[ Line: 1091 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v5 (copy), v2 (copy)
    local v142 = l_v7_4.new();
    if v141.page_entry ~= nil then
        v142.page_entry = v5.PageEntry.jsonDecode(v141.page_entry);
    end;
    if v141.pageEntry ~= nil then
        v142.page_entry = v5.PageEntry.jsonDecode(v141.pageEntry);
    end;
    if v141.badges_grid ~= nil then
        v142.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridPageEntry.jsonDecode(v141.badges_grid)
        };
    end;
    if v141.badgesGrid ~= nil then
        v142.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridPageEntry.jsonDecode(v141.badgesGrid)
        };
    end;
    return v142;
end;
v7.descriptor = {
    name = "BadgesSeeAllPageEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllPageEntry"
};
v2.BadgesSeeAllPageEntry = v7;
v1.default:register(v2.BadgesSeeAllPageEntry);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v144) --[[ Line: 1127 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        page_entries = if not (v144 ~= nil) or v144.page_entries == nil then {} else v144.page_entries, 
        hydration_data = if not (v144 ~= nil) or v144.hydration_data == nil then nil else v144.hydration_data, 
        templates = if not (v144 ~= nil) or v144.templates == nil then {} else v144.templates, 
        pagination = if not (v144 ~= nil) or v144.pagination == nil then nil else v144.pagination
    }, l_v7_5));
end;
v7.encode = function(v145) --[[ Line: 1136 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v146 = buffer.create(0);
    local v147 = 0;
    if v145.page_entries ~= nil and #v145.page_entries > 0 then
        for _, v149 in v145.page_entries do
            local v150 = v149:encode();
            local v151, v152 = v0.writeTag(v146, v147, 1, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v146 = v151;
            v147 = v152;
        end;
    end;
    if v145.hydration_data ~= nil then
        local v153 = v145.hydration_data:encode();
        local v154, v155 = v0.writeTag(v146, v147, 2, v0.wireTypes.lengthDelimited);
        v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
        v146 = v154;
        v147 = v155;
    end;
    if v145.templates ~= nil and next(v145.templates) ~= nil then
        for v156, v157 in v145.templates do
            local v158 = buffer.create(0);
            local v159, v160 = v0.writeTag(v158, 0, 1, v0.wireTypes.lengthDelimited);
            v159, v160 = v0.writeString(v159, v160, v156);
            v158 = v159;
            local l_v160_0 = v160;
            v159 = v157:encode();
            local v162;
            v160, v162 = v0.writeTag(v158, l_v160_0, 2, v0.wireTypes.lengthDelimited);
            v160, v162 = v0.writeBuffer(v160, v162, v159, buffer.len(v159));
            v158 = v160;
            l_v160_0 = v162;
            v160, v162 = v0.writeTag(v146, v147, 3, v0.wireTypes.lengthDelimited);
            v160, v162 = v0.writeBuffer(v160, v162, v158, l_v160_0);
            v146 = v160;
            v147 = v162;
        end;
    end;
    if v145.pagination ~= nil then
        local v163 = v145.pagination:encode();
        local v164, v165 = v0.writeTag(v146, v147, 4, v0.wireTypes.lengthDelimited);
        v164, v165 = v0.writeBuffer(v164, v165, v163, buffer.len(v163));
        v146 = v164;
        v147 = v165;
    end;
    local v166 = buffer.create(v147);
    buffer.copy(v166, 0, v146, 0, v147);
    return v166;
end;
v7.decode = function(v167) --[[ Line: 1179 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v168 = l_v7_5.new();
    local v169 = 0;
    while v169 < buffer.len(v167) do
        local v170 = nil;
        local v171 = nil;
        local v172, v173, v174 = v0.readTag(v167, v169);
        v170 = v172;
        v171 = v173;
        v169 = v174;
        if v171 == v0.wireTypes.varint then
            v172 = nil;
            v173, v174 = v0.readVarInt(v167, v169);
            v172 = v173;
            v169 = v174;
        elseif v171 == v0.wireTypes.lengthDelimited then
            if v170 == 1 then
                v172 = nil;
                v173, v174 = v0.readBuffer(v167, v169);
                v172 = v173;
                v169 = v174;
                table.insert(v168.page_entries, v2.BadgesSeeAllPageEntry.decode(v172));
            elseif v170 == 2 then
                v172 = nil;
                v173, v174 = v0.readBuffer(v167, v169);
                v172 = v173;
                v169 = v174;
                v168.hydration_data = v3.HydrationContent.decode(v172);
            elseif v170 == 3 then
                v172 = nil;
                v173, v174 = v0.readBuffer(v167, v169);
                v172 = v173;
                v169 = v174;
                v173 = v2.BadgesSeeAllResponse_TemplatesEntry.decode(v172);
                v174 = v4.TemplateEntry.new();
                v168.templates[v173.key or ""] = v173.value or v174;
            elseif v170 == 4 then
                v172 = nil;
                v173, v174 = v0.readBuffer(v167, v169);
                v172 = v173;
                v169 = v174;
                v168.pagination = v2.Pagination.decode(v172);
            else
                v172 = nil;
                v173, v174 = v0.readVarInt(v167, v169);
                v169 = v174 + v173;
            end;
        elseif v171 == v0.wireTypes.i32 then
            v172 = nil;
            v173, v174 = v0.readFixed32(v167, v169);
            v172 = v173;
            v169 = v174;
        elseif v171 == v0.wireTypes.i64 then
            v172 = nil;
            v173, v174 = v0.readFixed64(v167, v169);
            v172 = v173;
            v169 = v174;
        else
            error("Unsupported wire type: " .. v171);
        end;
    end;
    return v168;
end;
v7.jsonEncode = function(v175) --[[ Line: 1245 ]] --[[ Name: jsonEncode ]]
    local v176 = {};
    if v175.page_entries ~= nil and #v175.page_entries > 0 then
        local v177 = {};
        for _, v179 in v175.page_entries do
            table.insert(v177, v179:jsonEncode());
        end;
        v176.pageEntries = v177;
    end;
    if v175.hydration_data ~= nil then
        v176.hydrationData = v175.hydration_data:jsonEncode();
    end;
    if v175.templates ~= nil and next(v175.templates) ~= nil then
        local v180 = {};
        for v181, v182 in v175.templates do
            v180[v181] = v182:jsonEncode();
        end;
        v176.templates = v180;
    end;
    if v175.pagination ~= nil then
        v176.pagination = v175.pagination:jsonEncode();
    end;
    return v176;
end;
v7.jsonDecode = function(v183) --[[ Line: 1275 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v184 = l_v7_5.new();
    if v183.page_entries ~= nil then
        local v185 = {};
        for _, v187 in v183.page_entries do
            table.insert(v185, v2.BadgesSeeAllPageEntry.jsonDecode(v187));
        end;
        v184.page_entries = v185;
    end;
    if v183.pageEntries ~= nil then
        local v188 = {};
        for _, v190 in v183.pageEntries do
            table.insert(v188, v2.BadgesSeeAllPageEntry.jsonDecode(v190));
        end;
        v184.page_entries = v188;
    end;
    if v183.hydration_data ~= nil then
        v184.hydration_data = v3.HydrationContent.jsonDecode(v183.hydration_data);
    end;
    if v183.hydrationData ~= nil then
        v184.hydration_data = v3.HydrationContent.jsonDecode(v183.hydrationData);
    end;
    if v183.templates ~= nil then
        local v191 = {};
        for v192, v193 in v183.templates do
            v191[v192] = v4.TemplateEntry.jsonDecode(v193);
        end;
        v184.templates = v191;
    end;
    if v183.pagination ~= nil then
        v184.pagination = v2.Pagination.jsonDecode(v183.pagination);
    end;
    return v184;
end;
v7.descriptor = {
    name = "BadgesSeeAllResponse", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllResponse"
};
v2.BadgesSeeAllResponse = v7;
v1.default:register(v2.BadgesSeeAllResponse);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v195) --[[ Line: 1338 ]] --[[ Name: new ]]
    -- upvalues: l_v7_6 (copy)
    return (setmetatable({
        key = (not (v195 ~= nil) or v195.key == nil) and "" or v195.key, 
        value = if not (v195 ~= nil) or v195.value == nil then nil else v195.value
    }, l_v7_6));
end;
v7.encode = function(v196) --[[ Line: 1347 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v197 = buffer.create(0);
    local v198 = 0;
    if v196.key ~= nil and v196.key ~= "" then
        local v199, v200 = v0.writeTag(v197, v198, 1, v0.wireTypes.lengthDelimited);
        v199, v200 = v0.writeString(v199, v200, v196.key);
        v197 = v199;
        v198 = v200;
    end;
    if v196.value ~= nil then
        local v201 = v196.value:encode();
        local v202, v203 = v0.writeTag(v197, v198, 2, v0.wireTypes.lengthDelimited);
        v202, v203 = v0.writeBuffer(v202, v203, v201, buffer.len(v201));
        v197 = v202;
        v198 = v203;
    end;
    local v204 = buffer.create(v198);
    buffer.copy(v204, 0, v197, 0, v198);
    return v204;
end;
v7.decode = function(v205) --[[ Line: 1367 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v4 (copy)
    local v206 = l_v7_6.new();
    local v207 = 0;
    while v207 < buffer.len(v205) do
        local v208 = nil;
        local v209 = nil;
        local v210, v211, v212 = v0.readTag(v205, v207);
        v208 = v210;
        v209 = v211;
        v207 = v212;
        if v209 == v0.wireTypes.varint then
            v210 = nil;
            v211, v212 = v0.readVarInt(v205, v207);
            v210 = v211;
            v207 = v212;
        elseif v209 == v0.wireTypes.lengthDelimited then
            if v208 == 1 then
                v210 = nil;
                v211, v212 = v0.readBuffer(v205, v207);
                v210 = v211;
                v207 = v212;
                v206.key = buffer.tostring(v210);
            elseif v208 == 2 then
                v210 = nil;
                v211, v212 = v0.readBuffer(v205, v207);
                v210 = v211;
                v207 = v212;
                v206.value = v4.TemplateEntry.decode(v210);
            else
                v210 = nil;
                v211, v212 = v0.readVarInt(v205, v207);
                v207 = v212 + v211;
            end;
        elseif v209 == v0.wireTypes.i32 then
            v210 = nil;
            v211, v212 = v0.readFixed32(v205, v207);
            v210 = v211;
            v207 = v212;
        elseif v209 == v0.wireTypes.i64 then
            v210 = nil;
            v211, v212 = v0.readFixed64(v205, v207);
            v210 = v211;
            v207 = v212;
        else
            error("Unsupported wire type: " .. v209);
        end;
    end;
    return v206;
end;
v7.jsonEncode = function(v213) --[[ Line: 1415 ]] --[[ Name: jsonEncode ]]
    local v214 = {};
    if v213.key ~= nil and v213.key ~= "" then
        v214.key = v213.key;
    end;
    if v213.value ~= nil then
        v214.value = v213.value:jsonEncode();
    end;
    return v214;
end;
v7.jsonDecode = function(v215) --[[ Line: 1429 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v4 (copy)
    local v216 = l_v7_6.new();
    if v215.key ~= nil then
        v216.key = v215.key;
    end;
    if v215.value ~= nil then
        v216.value = v4.TemplateEntry.jsonDecode(v215.value);
    end;
    return v216;
end;
v7.descriptor = {
    name = "BadgesSeeAllResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
};
v2.BadgesSeeAllResponse_TemplatesEntry = v7;
v1.default:register(v2.BadgesSeeAllResponse_TemplatesEntry);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v218) --[[ Line: 1459 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        page_entries = if not (v218 ~= nil) or v218.page_entries == nil then {} else v218.page_entries, 
        hydration_data = if not (v218 ~= nil) or v218.hydration_data == nil then nil else v218.hydration_data, 
        templates = if not (v218 ~= nil) or v218.templates == nil then {} else v218.templates, 
        pagination = if not (v218 ~= nil) or v218.pagination == nil then nil else v218.pagination
    }, l_v7_7));
end;
v7.encode = function(v219) --[[ Line: 1468 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v220 = buffer.create(0);
    local v221 = 0;
    if v219.page_entries ~= nil and #v219.page_entries > 0 then
        for _, v223 in v219.page_entries do
            local v224 = v223:encode();
            local v225, v226 = v0.writeTag(v220, v221, 1, v0.wireTypes.lengthDelimited);
            v225, v226 = v0.writeBuffer(v225, v226, v224, buffer.len(v224));
            v220 = v225;
            v221 = v226;
        end;
    end;
    if v219.hydration_data ~= nil then
        local v227 = v219.hydration_data:encode();
        local v228, v229 = v0.writeTag(v220, v221, 2, v0.wireTypes.lengthDelimited);
        v228, v229 = v0.writeBuffer(v228, v229, v227, buffer.len(v227));
        v220 = v228;
        v221 = v229;
    end;
    if v219.templates ~= nil and next(v219.templates) ~= nil then
        for v230, v231 in v219.templates do
            local v232 = buffer.create(0);
            local v233, v234 = v0.writeTag(v232, 0, 1, v0.wireTypes.lengthDelimited);
            v233, v234 = v0.writeString(v233, v234, v230);
            v232 = v233;
            local l_v234_0 = v234;
            v233 = v231:encode();
            local v236;
            v234, v236 = v0.writeTag(v232, l_v234_0, 2, v0.wireTypes.lengthDelimited);
            v234, v236 = v0.writeBuffer(v234, v236, v233, buffer.len(v233));
            v232 = v234;
            l_v234_0 = v236;
            v234, v236 = v0.writeTag(v220, v221, 3, v0.wireTypes.lengthDelimited);
            v234, v236 = v0.writeBuffer(v234, v236, v232, l_v234_0);
            v220 = v234;
            v221 = v236;
        end;
    end;
    if v219.pagination ~= nil then
        local v237 = v219.pagination:encode();
        local v238, v239 = v0.writeTag(v220, v221, 4, v0.wireTypes.lengthDelimited);
        v238, v239 = v0.writeBuffer(v238, v239, v237, buffer.len(v237));
        v220 = v238;
        v221 = v239;
    end;
    local v240 = buffer.create(v221);
    buffer.copy(v240, 0, v220, 0, v221);
    return v240;
end;
v7.decode = function(v241) --[[ Line: 1511 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v6 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v242 = l_v7_7.new();
    local v243 = 0;
    while v243 < buffer.len(v241) do
        local v244 = nil;
        local v245 = nil;
        local v246, v247, v248 = v0.readTag(v241, v243);
        v244 = v246;
        v245 = v247;
        v243 = v248;
        if v245 == v0.wireTypes.varint then
            v246 = nil;
            v247, v248 = v0.readVarInt(v241, v243);
            v246 = v247;
            v243 = v248;
        elseif v245 == v0.wireTypes.lengthDelimited then
            if v244 == 1 then
                v246 = nil;
                v247, v248 = v0.readBuffer(v241, v243);
                v246 = v247;
                v243 = v248;
                table.insert(v242.page_entries, v6.UniversalPageEntry.decode(v246));
            elseif v244 == 2 then
                v246 = nil;
                v247, v248 = v0.readBuffer(v241, v243);
                v246 = v247;
                v243 = v248;
                v242.hydration_data = v3.HydrationContent.decode(v246);
            elseif v244 == 3 then
                v246 = nil;
                v247, v248 = v0.readBuffer(v241, v243);
                v246 = v247;
                v243 = v248;
                v247 = v2.BadgesSeeAllV2Response_TemplatesEntry.decode(v246);
                v248 = v4.TemplateEntry.new();
                v242.templates[v247.key or ""] = v247.value or v248;
            elseif v244 == 4 then
                v246 = nil;
                v247, v248 = v0.readBuffer(v241, v243);
                v246 = v247;
                v243 = v248;
                v242.pagination = v2.Pagination.decode(v246);
            else
                v246 = nil;
                v247, v248 = v0.readVarInt(v241, v243);
                v243 = v248 + v247;
            end;
        elseif v245 == v0.wireTypes.i32 then
            v246 = nil;
            v247, v248 = v0.readFixed32(v241, v243);
            v246 = v247;
            v243 = v248;
        elseif v245 == v0.wireTypes.i64 then
            v246 = nil;
            v247, v248 = v0.readFixed64(v241, v243);
            v246 = v247;
            v243 = v248;
        else
            error("Unsupported wire type: " .. v245);
        end;
    end;
    return v242;
end;
v7.jsonEncode = function(v249) --[[ Line: 1580 ]] --[[ Name: jsonEncode ]]
    local v250 = {};
    if v249.page_entries ~= nil and #v249.page_entries > 0 then
        local v251 = {};
        for _, v253 in v249.page_entries do
            table.insert(v251, v253:jsonEncode());
        end;
        v250.pageEntries = v251;
    end;
    if v249.hydration_data ~= nil then
        v250.hydrationData = v249.hydration_data:jsonEncode();
    end;
    if v249.templates ~= nil and next(v249.templates) ~= nil then
        local v254 = {};
        for v255, v256 in v249.templates do
            v254[v255] = v256:jsonEncode();
        end;
        v250.templates = v254;
    end;
    if v249.pagination ~= nil then
        v250.pagination = v249.pagination:jsonEncode();
    end;
    return v250;
end;
v7.jsonDecode = function(v257) --[[ Line: 1610 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v6 (copy), v3 (copy), v4 (copy), v2 (copy)
    local v258 = l_v7_7.new();
    if v257.page_entries ~= nil then
        local v259 = {};
        for _, v261 in v257.page_entries do
            table.insert(v259, v6.UniversalPageEntry.jsonDecode(v261));
        end;
        v258.page_entries = v259;
    end;
    if v257.pageEntries ~= nil then
        local v262 = {};
        for _, v264 in v257.pageEntries do
            table.insert(v262, v6.UniversalPageEntry.jsonDecode(v264));
        end;
        v258.page_entries = v262;
    end;
    if v257.hydration_data ~= nil then
        v258.hydration_data = v3.HydrationContent.jsonDecode(v257.hydration_data);
    end;
    if v257.hydrationData ~= nil then
        v258.hydration_data = v3.HydrationContent.jsonDecode(v257.hydrationData);
    end;
    if v257.templates ~= nil then
        local v265 = {};
        for v266, v267 in v257.templates do
            v265[v266] = v4.TemplateEntry.jsonDecode(v267);
        end;
        v258.templates = v265;
    end;
    if v257.pagination ~= nil then
        v258.pagination = v2.Pagination.jsonDecode(v257.pagination);
    end;
    return v258;
end;
v7.descriptor = {
    name = "BadgesSeeAllV2Response", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllV2Response"
};
v2.BadgesSeeAllV2Response = v7;
v1.default:register(v2.BadgesSeeAllV2Response);
v7 = {};
v7.__index = v7;
v7.new = function(v268) --[[ Line: 1679 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        key = (not (v268 ~= nil) or v268.key == nil) and "" or v268.key, 
        value = if not (v268 ~= nil) or v268.value == nil then nil else v268.value
    }, v7));
end;
v7.encode = function(v269) --[[ Line: 1688 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v270 = buffer.create(0);
    local v271 = 0;
    if v269.key ~= nil and v269.key ~= "" then
        local v272, v273 = v0.writeTag(v270, v271, 1, v0.wireTypes.lengthDelimited);
        v272, v273 = v0.writeString(v272, v273, v269.key);
        v270 = v272;
        v271 = v273;
    end;
    if v269.value ~= nil then
        local v274 = v269.value:encode();
        local v275, v276 = v0.writeTag(v270, v271, 2, v0.wireTypes.lengthDelimited);
        v275, v276 = v0.writeBuffer(v275, v276, v274, buffer.len(v274));
        v270 = v275;
        v271 = v276;
    end;
    local v277 = buffer.create(v271);
    buffer.copy(v277, 0, v270, 0, v271);
    return v277;
end;
v7.decode = function(v278) --[[ Line: 1708 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v4 (copy)
    local v279 = v7.new();
    local v280 = 0;
    while v280 < buffer.len(v278) do
        local v281 = nil;
        local v282 = nil;
        local v283, v284, v285 = v0.readTag(v278, v280);
        v281 = v283;
        v282 = v284;
        v280 = v285;
        if v282 == v0.wireTypes.varint then
            v283 = nil;
            v284, v285 = v0.readVarInt(v278, v280);
            v283 = v284;
            v280 = v285;
        elseif v282 == v0.wireTypes.lengthDelimited then
            if v281 == 1 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.key = buffer.tostring(v283);
            elseif v281 == 2 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.value = v4.TemplateEntry.decode(v283);
            else
                v283 = nil;
                v284, v285 = v0.readVarInt(v278, v280);
                v280 = v285 + v284;
            end;
        elseif v282 == v0.wireTypes.i32 then
            v283 = nil;
            v284, v285 = v0.readFixed32(v278, v280);
            v283 = v284;
            v280 = v285;
        elseif v282 == v0.wireTypes.i64 then
            v283 = nil;
            v284, v285 = v0.readFixed64(v278, v280);
            v283 = v284;
            v280 = v285;
        else
            error("Unsupported wire type: " .. v282);
        end;
    end;
    return v279;
end;
v7.jsonEncode = function(v286) --[[ Line: 1756 ]] --[[ Name: jsonEncode ]]
    local v287 = {};
    if v286.key ~= nil and v286.key ~= "" then
        v287.key = v286.key;
    end;
    if v286.value ~= nil then
        v287.value = v286.value:jsonEncode();
    end;
    return v287;
end;
v7.jsonDecode = function(v288) --[[ Line: 1770 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v4 (copy)
    local v289 = v7.new();
    if v288.key ~= nil then
        v289.key = v288.key;
    end;
    if v288.value ~= nil then
        v289.value = v4.TemplateEntry.jsonDecode(v288.value);
    end;
    return v289;
end;
v7.descriptor = {
    name = "BadgesSeeAllV2Response_TemplatesEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
};
v2.BadgesSeeAllV2Response_TemplatesEntry = v7;
v1.default:register(v2.BadgesSeeAllV2Response_TemplatesEntry);
return {
    BadgesSeeAllRequest = v2.BadgesSeeAllRequest, 
    Pagination = v2.Pagination, 
    BadgesGridPageEntry = v2.BadgesGridPageEntry, 
    BadgesGridPageEntry_BadgeInputData = v2.BadgesGridPageEntry_BadgeInputData, 
    BadgesSeeAllPageEntry = v2.BadgesSeeAllPageEntry, 
    BadgesSeeAllResponse = v2.BadgesSeeAllResponse, 
    BadgesSeeAllV2Response = v2.BadgesSeeAllV2Response
};