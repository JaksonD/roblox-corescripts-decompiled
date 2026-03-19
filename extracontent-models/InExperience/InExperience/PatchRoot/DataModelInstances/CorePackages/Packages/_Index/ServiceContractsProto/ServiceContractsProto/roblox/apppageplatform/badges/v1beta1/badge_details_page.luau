local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v6 = require(script.Parent.Parent.Parent.shared.v1beta1.universal_page_entry);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 370 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_v7_0 (copy)
    return (setmetatable({
        badge_id = (not (v9 ~= nil) or v9.badge_id == nil) and 0 or v9.badge_id, 
        user_id = (not (v9 ~= nil) or v9.user_id == nil) and 0 or v9.user_id, 
        page_entry_format = if not (v9 ~= nil) or v9.page_entry_format == nil then assert(v6.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else v9.page_entry_format
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 383 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v6 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.badge_id ~= nil and v10.badge_id ~= 0 then
        local v13, v14 = v0.writeTag(v11, v12, 1, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v10.badge_id);
        v11 = v13;
        v12 = v14;
    end;
    if v10.user_id ~= nil and v10.user_id ~= 0 then
        local v15, v16 = v0.writeTag(v11, v12, 2, v0.wireTypes.varint);
        v15, v16 = v0.writeVarInt(v15, v16, v10.user_id);
        v11 = v15;
        v12 = v16;
    end;
    if v10.page_entry_format ~= nil and (v10.page_entry_format ~= nil and v10.page_entry_format ~= 0 or v10.page_entry_format ~= v6.PageEntryFormat.fromNumber(0)) then
        local v17, v18 = v0.writeTag(v11, v12, 3, v0.wireTypes.varint);
        v17, v18 = v0.writeVarInt(v17, v18, v6.PageEntryFormat.toNumber(v10.page_entry_format));
        v11 = v17;
        v12 = v18;
    end;
    local v19 = buffer.create(v12);
    buffer.copy(v19, 0, v11, 0, v12);
    return v19;
end;
v7.decode = function(v20) --[[ Line: 420 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v6 (copy)
    local v21 = l_v7_0.new();
    local v22 = 0;
    while v22 < buffer.len(v20) do
        local v23 = nil;
        local v24 = nil;
        local v25, v26, v27 = v0.readTag(v20, v22);
        v23 = v25;
        v24 = v26;
        v22 = v27;
        if v24 == v0.wireTypes.varint then
            if v23 == 1 then
                v25 = nil;
                v26, v27 = v0.readVarIntI64(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.badge_id = v25;
            elseif v23 == 2 then
                v25 = nil;
                v26, v27 = v0.readVarIntI64(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.user_id = v25;
            elseif v23 == 3 then
                v25 = nil;
                v26, v27 = v0.readVarIntI32(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.page_entry_format = v6.PageEntryFormat.fromNumber(v25) or v25;
            else
                v25 = nil;
                v26, v27 = v0.readVarInt(v20, v22);
                v25 = v26;
                v22 = v27;
            end;
        elseif v24 == v0.wireTypes.lengthDelimited then
            v25 = nil;
            v26, v27 = v0.readVarInt(v20, v22);
            v22 = v27 + v26;
        elseif v24 == v0.wireTypes.i32 then
            v25 = nil;
            v26, v27 = v0.readFixed32(v20, v22);
            v25 = v26;
            v22 = v27;
        elseif v24 == v0.wireTypes.i64 then
            v25 = nil;
            v26, v27 = v0.readFixed64(v20, v22);
            v25 = v26;
            v22 = v27;
        else
            error("Unsupported wire type: " .. v24);
        end;
    end;
    return v21;
end;
v7.jsonEncode = function(v28) --[[ Line: 476 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v6 (copy)
    local v29 = {};
    if v28.badge_id ~= nil and v28.badge_id ~= 0 then
        v29.badgeId = v28.badge_id;
    end;
    if v28.user_id ~= nil and v28.user_id ~= 0 then
        v29.userId = v28.user_id;
    end;
    if v28.page_entry_format ~= nil and (v28.page_entry_format ~= nil and v28.page_entry_format ~= 0 or v28.page_entry_format ~= v6.PageEntryFormat.fromNumber(0)) then
        v29.pageEntryFormat = if typeof(v28.page_entry_format) == "number" then v28.page_entry_format else v6.PageEntryFormat.toNumber(v28.page_entry_format);
    end;
    return v29;
end;
v7.jsonDecode = function(v30) --[[ Line: 505 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v6 (copy)
    local v31 = l_v7_0.new();
    if v30.badge_id ~= nil then
        v31.badge_id = v30.badge_id;
    end;
    if v30.badgeId ~= nil then
        v31.badge_id = v30.badgeId;
    end;
    if v30.user_id ~= nil then
        v31.user_id = v30.user_id;
    end;
    if v30.userId ~= nil then
        v31.user_id = v30.userId;
    end;
    if v30.page_entry_format ~= nil then
        v31.page_entry_format = if typeof(v30.page_entry_format) == "number" then v6.PageEntryFormat.fromNumber(v30.page_entry_format) or v30.page_entry_format else v6.PageEntryFormat.fromName(v30.page_entry_format) or v30.page_entry_format;
    end;
    if v30.pageEntryFormat ~= nil then
        v31.page_entry_format = if typeof(v30.pageEntryFormat) == "number" then v6.PageEntryFormat.fromNumber(v30.pageEntryFormat) or v30.pageEntryFormat else v6.PageEntryFormat.fromName(v30.pageEntryFormat) or v30.pageEntryFormat;
    end;
    return v31;
end;
v7.descriptor = {
    name = "BadgeDetailsPageRequest", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageRequest"
};
v2.BadgeDetailsPageRequest = v7;
v1.default:register(v2.BadgeDetailsPageRequest);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v33) --[[ Line: 561 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        page_entries = if not (v33 ~= nil) or v33.page_entries == nil then {} else v33.page_entries, 
        hydration_data = if not (v33 ~= nil) or v33.hydration_data == nil then nil else v33.hydration_data, 
        templates = if not (v33 ~= nil) or v33.templates == nil then {} else v33.templates
    }, l_v7_1));
end;
v7.encode = function(v34) --[[ Line: 569 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v35 = buffer.create(0);
    local v36 = 0;
    if v34.page_entries ~= nil and #v34.page_entries > 0 then
        for _, v38 in v34.page_entries do
            local v39 = v38:encode();
            local v40, v41 = v0.writeTag(v35, v36, 1, v0.wireTypes.lengthDelimited);
            v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
            v35 = v40;
            v36 = v41;
        end;
    end;
    if v34.hydration_data ~= nil then
        local v42 = v34.hydration_data:encode();
        local v43, v44 = v0.writeTag(v35, v36, 2, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
        v35 = v43;
        v36 = v44;
    end;
    if v34.templates ~= nil and next(v34.templates) ~= nil then
        for v45, v46 in v34.templates do
            local v47 = buffer.create(0);
            local v48, v49 = v0.writeTag(v47, 0, 1, v0.wireTypes.lengthDelimited);
            v48, v49 = v0.writeString(v48, v49, v45);
            v47 = v48;
            local l_v49_0 = v49;
            v48 = v46:encode();
            local v51;
            v49, v51 = v0.writeTag(v47, l_v49_0, 2, v0.wireTypes.lengthDelimited);
            v49, v51 = v0.writeBuffer(v49, v51, v48, buffer.len(v48));
            v47 = v49;
            l_v49_0 = v51;
            v49, v51 = v0.writeTag(v35, v36, 3, v0.wireTypes.lengthDelimited);
            v49, v51 = v0.writeBuffer(v49, v51, v47, l_v49_0);
            v35 = v49;
            v36 = v51;
        end;
    end;
    local v52 = buffer.create(v36);
    buffer.copy(v52, 0, v35, 0, v36);
    return v52;
end;
v7.decode = function(v53) --[[ Line: 606 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v54 = l_v7_1.new();
    local v55 = 0;
    while v55 < buffer.len(v53) do
        local v56 = nil;
        local v57 = nil;
        local v58, v59, v60 = v0.readTag(v53, v55);
        v56 = v58;
        v57 = v59;
        v55 = v60;
        if v57 == v0.wireTypes.varint then
            v58 = nil;
            v59, v60 = v0.readVarInt(v53, v55);
            v58 = v59;
            v55 = v60;
        elseif v57 == v0.wireTypes.lengthDelimited then
            if v56 == 1 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                table.insert(v54.page_entries, v2.BadgeDetailsPageEntry.decode(v58));
            elseif v56 == 2 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                v54.hydration_data = v3.HydrationContent.decode(v58);
            elseif v56 == 3 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                v59 = v2.BadgeDetailsPageResponse_TemplatesEntry.decode(v58);
                v60 = v5.TemplateEntry.new();
                v54.templates[v59.key or ""] = v59.value or v60;
            else
                v58 = nil;
                v59, v60 = v0.readVarInt(v53, v55);
                v55 = v60 + v59;
            end;
        elseif v57 == v0.wireTypes.i32 then
            v58 = nil;
            v59, v60 = v0.readFixed32(v53, v55);
            v58 = v59;
            v55 = v60;
        elseif v57 == v0.wireTypes.i64 then
            v58 = nil;
            v59, v60 = v0.readFixed64(v53, v55);
            v58 = v59;
            v55 = v60;
        else
            error("Unsupported wire type: " .. v57);
        end;
    end;
    return v54;
end;
v7.jsonEncode = function(v61) --[[ Line: 667 ]] --[[ Name: jsonEncode ]]
    local v62 = {};
    if v61.page_entries ~= nil and #v61.page_entries > 0 then
        local v63 = {};
        for _, v65 in v61.page_entries do
            table.insert(v63, v65:jsonEncode());
        end;
        v62.pageEntries = v63;
    end;
    if v61.hydration_data ~= nil then
        v62.hydrationData = v61.hydration_data:jsonEncode();
    end;
    if v61.templates ~= nil and next(v61.templates) ~= nil then
        local v66 = {};
        for v67, v68 in v61.templates do
            v66[v67] = v68:jsonEncode();
        end;
        v62.templates = v66;
    end;
    return v62;
end;
v7.jsonDecode = function(v69) --[[ Line: 693 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v70 = l_v7_1.new();
    if v69.page_entries ~= nil then
        local v71 = {};
        for _, v73 in v69.page_entries do
            table.insert(v71, v2.BadgeDetailsPageEntry.jsonDecode(v73));
        end;
        v70.page_entries = v71;
    end;
    if v69.pageEntries ~= nil then
        local v74 = {};
        for _, v76 in v69.pageEntries do
            table.insert(v74, v2.BadgeDetailsPageEntry.jsonDecode(v76));
        end;
        v70.page_entries = v74;
    end;
    if v69.hydration_data ~= nil then
        v70.hydration_data = v3.HydrationContent.jsonDecode(v69.hydration_data);
    end;
    if v69.hydrationData ~= nil then
        v70.hydration_data = v3.HydrationContent.jsonDecode(v69.hydrationData);
    end;
    if v69.templates ~= nil then
        local v77 = {};
        for v78, v79 in v69.templates do
            v77[v78] = v5.TemplateEntry.jsonDecode(v79);
        end;
        v70.templates = v77;
    end;
    return v70;
end;
v7.descriptor = {
    name = "BadgeDetailsPageResponse", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageResponse"
};
v2.BadgeDetailsPageResponse = v7;
v1.default:register(v2.BadgeDetailsPageResponse);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v81) --[[ Line: 752 ]] --[[ Name: new ]]
    -- upvalues: l_v7_2 (copy)
    return (setmetatable({
        key = (not (v81 ~= nil) or v81.key == nil) and "" or v81.key, 
        value = if not (v81 ~= nil) or v81.value == nil then nil else v81.value
    }, l_v7_2));
end;
v7.encode = function(v82) --[[ Line: 761 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v83 = buffer.create(0);
    local v84 = 0;
    if v82.key ~= nil and v82.key ~= "" then
        local v85, v86 = v0.writeTag(v83, v84, 1, v0.wireTypes.lengthDelimited);
        v85, v86 = v0.writeString(v85, v86, v82.key);
        v83 = v85;
        v84 = v86;
    end;
    if v82.value ~= nil then
        local v87 = v82.value:encode();
        local v88, v89 = v0.writeTag(v83, v84, 2, v0.wireTypes.lengthDelimited);
        v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
        v83 = v88;
        v84 = v89;
    end;
    local v90 = buffer.create(v84);
    buffer.copy(v90, 0, v83, 0, v84);
    return v90;
end;
v7.decode = function(v91) --[[ Line: 781 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_2 (copy), v0 (copy), v5 (copy)
    local v92 = l_v7_2.new();
    local v93 = 0;
    while v93 < buffer.len(v91) do
        local v94 = nil;
        local v95 = nil;
        local v96, v97, v98 = v0.readTag(v91, v93);
        v94 = v96;
        v95 = v97;
        v93 = v98;
        if v95 == v0.wireTypes.varint then
            v96 = nil;
            v97, v98 = v0.readVarInt(v91, v93);
            v96 = v97;
            v93 = v98;
        elseif v95 == v0.wireTypes.lengthDelimited then
            if v94 == 1 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.key = buffer.tostring(v96);
            elseif v94 == 2 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.value = v5.TemplateEntry.decode(v96);
            else
                v96 = nil;
                v97, v98 = v0.readVarInt(v91, v93);
                v93 = v98 + v97;
            end;
        elseif v95 == v0.wireTypes.i32 then
            v96 = nil;
            v97, v98 = v0.readFixed32(v91, v93);
            v96 = v97;
            v93 = v98;
        elseif v95 == v0.wireTypes.i64 then
            v96 = nil;
            v97, v98 = v0.readFixed64(v91, v93);
            v96 = v97;
            v93 = v98;
        else
            error("Unsupported wire type: " .. v95);
        end;
    end;
    return v92;
end;
v7.jsonEncode = function(v99) --[[ Line: 829 ]] --[[ Name: jsonEncode ]]
    local v100 = {};
    if v99.key ~= nil and v99.key ~= "" then
        v100.key = v99.key;
    end;
    if v99.value ~= nil then
        v100.value = v99.value:jsonEncode();
    end;
    return v100;
end;
v7.jsonDecode = function(v101) --[[ Line: 843 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v5 (copy)
    local v102 = l_v7_2.new();
    if v101.key ~= nil then
        v102.key = v101.key;
    end;
    if v101.value ~= nil then
        v102.value = v5.TemplateEntry.jsonDecode(v101.value);
    end;
    return v102;
end;
v7.descriptor = {
    name = "BadgeDetailsPageResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
};
v2.BadgeDetailsPageResponse_TemplatesEntry = v7;
v1.default:register(v2.BadgeDetailsPageResponse_TemplatesEntry);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v104) --[[ Line: 873 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        page_entries = if not (v104 ~= nil) or v104.page_entries == nil then {} else v104.page_entries, 
        hydration_data = if not (v104 ~= nil) or v104.hydration_data == nil then nil else v104.hydration_data, 
        templates = if not (v104 ~= nil) or v104.templates == nil then {} else v104.templates
    }, l_v7_3));
end;
v7.encode = function(v105) --[[ Line: 883 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v106 = buffer.create(0);
    local v107 = 0;
    if v105.page_entries ~= nil and #v105.page_entries > 0 then
        for _, v109 in v105.page_entries do
            local v110 = v109:encode();
            local v111, v112 = v0.writeTag(v106, v107, 1, v0.wireTypes.lengthDelimited);
            v111, v112 = v0.writeBuffer(v111, v112, v110, buffer.len(v110));
            v106 = v111;
            v107 = v112;
        end;
    end;
    if v105.hydration_data ~= nil then
        local v113 = v105.hydration_data:encode();
        local v114, v115 = v0.writeTag(v106, v107, 2, v0.wireTypes.lengthDelimited);
        v114, v115 = v0.writeBuffer(v114, v115, v113, buffer.len(v113));
        v106 = v114;
        v107 = v115;
    end;
    if v105.templates ~= nil and next(v105.templates) ~= nil then
        for v116, v117 in v105.templates do
            local v118 = buffer.create(0);
            local v119, v120 = v0.writeTag(v118, 0, 1, v0.wireTypes.lengthDelimited);
            v119, v120 = v0.writeString(v119, v120, v116);
            v118 = v119;
            local l_v120_0 = v120;
            v119 = v117:encode();
            local v122;
            v120, v122 = v0.writeTag(v118, l_v120_0, 2, v0.wireTypes.lengthDelimited);
            v120, v122 = v0.writeBuffer(v120, v122, v119, buffer.len(v119));
            v118 = v120;
            l_v120_0 = v122;
            v120, v122 = v0.writeTag(v106, v107, 3, v0.wireTypes.lengthDelimited);
            v120, v122 = v0.writeBuffer(v120, v122, v118, l_v120_0);
            v106 = v120;
            v107 = v122;
        end;
    end;
    local v123 = buffer.create(v107);
    buffer.copy(v123, 0, v106, 0, v107);
    return v123;
end;
v7.decode = function(v124) --[[ Line: 920 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v6 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v125 = l_v7_3.new();
    local v126 = 0;
    while v126 < buffer.len(v124) do
        local v127 = nil;
        local v128 = nil;
        local v129, v130, v131 = v0.readTag(v124, v126);
        v127 = v129;
        v128 = v130;
        v126 = v131;
        if v128 == v0.wireTypes.varint then
            v129 = nil;
            v130, v131 = v0.readVarInt(v124, v126);
            v129 = v130;
            v126 = v131;
        elseif v128 == v0.wireTypes.lengthDelimited then
            if v127 == 1 then
                v129 = nil;
                v130, v131 = v0.readBuffer(v124, v126);
                v129 = v130;
                v126 = v131;
                table.insert(v125.page_entries, v6.UniversalPageEntry.decode(v129));
            elseif v127 == 2 then
                v129 = nil;
                v130, v131 = v0.readBuffer(v124, v126);
                v129 = v130;
                v126 = v131;
                v125.hydration_data = v3.HydrationContent.decode(v129);
            elseif v127 == 3 then
                v129 = nil;
                v130, v131 = v0.readBuffer(v124, v126);
                v129 = v130;
                v126 = v131;
                v130 = v2.BadgeDetailsPageV2Response_TemplatesEntry.decode(v129);
                v131 = v5.TemplateEntry.new();
                v125.templates[v130.key or ""] = v130.value or v131;
            else
                v129 = nil;
                v130, v131 = v0.readVarInt(v124, v126);
                v126 = v131 + v130;
            end;
        elseif v128 == v0.wireTypes.i32 then
            v129 = nil;
            v130, v131 = v0.readFixed32(v124, v126);
            v129 = v130;
            v126 = v131;
        elseif v128 == v0.wireTypes.i64 then
            v129 = nil;
            v130, v131 = v0.readFixed64(v124, v126);
            v129 = v130;
            v126 = v131;
        else
            error("Unsupported wire type: " .. v128);
        end;
    end;
    return v125;
end;
v7.jsonEncode = function(v132) --[[ Line: 984 ]] --[[ Name: jsonEncode ]]
    local v133 = {};
    if v132.page_entries ~= nil and #v132.page_entries > 0 then
        local v134 = {};
        for _, v136 in v132.page_entries do
            table.insert(v134, v136:jsonEncode());
        end;
        v133.pageEntries = v134;
    end;
    if v132.hydration_data ~= nil then
        v133.hydrationData = v132.hydration_data:jsonEncode();
    end;
    if v132.templates ~= nil and next(v132.templates) ~= nil then
        local v137 = {};
        for v138, v139 in v132.templates do
            v137[v138] = v139:jsonEncode();
        end;
        v133.templates = v137;
    end;
    return v133;
end;
v7.jsonDecode = function(v140) --[[ Line: 1010 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v6 (copy), v3 (copy), v5 (copy)
    local v141 = l_v7_3.new();
    if v140.page_entries ~= nil then
        local v142 = {};
        for _, v144 in v140.page_entries do
            table.insert(v142, v6.UniversalPageEntry.jsonDecode(v144));
        end;
        v141.page_entries = v142;
    end;
    if v140.pageEntries ~= nil then
        local v145 = {};
        for _, v147 in v140.pageEntries do
            table.insert(v145, v6.UniversalPageEntry.jsonDecode(v147));
        end;
        v141.page_entries = v145;
    end;
    if v140.hydration_data ~= nil then
        v141.hydration_data = v3.HydrationContent.jsonDecode(v140.hydration_data);
    end;
    if v140.hydrationData ~= nil then
        v141.hydration_data = v3.HydrationContent.jsonDecode(v140.hydrationData);
    end;
    if v140.templates ~= nil then
        local v148 = {};
        for v149, v150 in v140.templates do
            v148[v149] = v5.TemplateEntry.jsonDecode(v150);
        end;
        v141.templates = v148;
    end;
    return v141;
end;
v7.descriptor = {
    name = "BadgeDetailsPageV2Response", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageV2Response"
};
v2.BadgeDetailsPageV2Response = v7;
v1.default:register(v2.BadgeDetailsPageV2Response);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v152) --[[ Line: 1075 ]] --[[ Name: new ]]
    -- upvalues: l_v7_4 (copy)
    return (setmetatable({
        key = (not (v152 ~= nil) or v152.key == nil) and "" or v152.key, 
        value = if not (v152 ~= nil) or v152.value == nil then nil else v152.value
    }, l_v7_4));
end;
v7.encode = function(v153) --[[ Line: 1084 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v154 = buffer.create(0);
    local v155 = 0;
    if v153.key ~= nil and v153.key ~= "" then
        local v156, v157 = v0.writeTag(v154, v155, 1, v0.wireTypes.lengthDelimited);
        v156, v157 = v0.writeString(v156, v157, v153.key);
        v154 = v156;
        v155 = v157;
    end;
    if v153.value ~= nil then
        local v158 = v153.value:encode();
        local v159, v160 = v0.writeTag(v154, v155, 2, v0.wireTypes.lengthDelimited);
        v159, v160 = v0.writeBuffer(v159, v160, v158, buffer.len(v158));
        v154 = v159;
        v155 = v160;
    end;
    local v161 = buffer.create(v155);
    buffer.copy(v161, 0, v154, 0, v155);
    return v161;
end;
v7.decode = function(v162) --[[ Line: 1106 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v5 (copy)
    local v163 = l_v7_4.new();
    local v164 = 0;
    while v164 < buffer.len(v162) do
        local v165 = nil;
        local v166 = nil;
        local v167, v168, v169 = v0.readTag(v162, v164);
        v165 = v167;
        v166 = v168;
        v164 = v169;
        if v166 == v0.wireTypes.varint then
            v167 = nil;
            v168, v169 = v0.readVarInt(v162, v164);
            v167 = v168;
            v164 = v169;
        elseif v166 == v0.wireTypes.lengthDelimited then
            if v165 == 1 then
                v167 = nil;
                v168, v169 = v0.readBuffer(v162, v164);
                v167 = v168;
                v164 = v169;
                v163.key = buffer.tostring(v167);
            elseif v165 == 2 then
                v167 = nil;
                v168, v169 = v0.readBuffer(v162, v164);
                v167 = v168;
                v164 = v169;
                v163.value = v5.TemplateEntry.decode(v167);
            else
                v167 = nil;
                v168, v169 = v0.readVarInt(v162, v164);
                v164 = v169 + v168;
            end;
        elseif v166 == v0.wireTypes.i32 then
            v167 = nil;
            v168, v169 = v0.readFixed32(v162, v164);
            v167 = v168;
            v164 = v169;
        elseif v166 == v0.wireTypes.i64 then
            v167 = nil;
            v168, v169 = v0.readFixed64(v162, v164);
            v167 = v168;
            v164 = v169;
        else
            error("Unsupported wire type: " .. v166);
        end;
    end;
    return v163;
end;
v7.jsonEncode = function(v170) --[[ Line: 1156 ]] --[[ Name: jsonEncode ]]
    local v171 = {};
    if v170.key ~= nil and v170.key ~= "" then
        v171.key = v170.key;
    end;
    if v170.value ~= nil then
        v171.value = v170.value:jsonEncode();
    end;
    return v171;
end;
v7.jsonDecode = function(v172) --[[ Line: 1172 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v5 (copy)
    local v173 = l_v7_4.new();
    if v172.key ~= nil then
        v173.key = v172.key;
    end;
    if v172.value ~= nil then
        v173.value = v5.TemplateEntry.jsonDecode(v172.value);
    end;
    return v173;
end;
v7.descriptor = {
    name = "BadgeDetailsPageV2Response_TemplatesEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
};
v2.BadgeDetailsPageV2Response_TemplatesEntry = v7;
v1.default:register(v2.BadgeDetailsPageV2Response_TemplatesEntry);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v175) --[[ Line: 1202 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        page_entry = if not (v175 ~= nil) or v175.page_entry == nil then nil else v175.page_entry, 
        kind = if not (v175 ~= nil) or v175.kind == nil then nil else v175.kind
    }, l_v7_5));
end;
v7.encode = function(v176) --[[ Line: 1209 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v177 = buffer.create(0);
    local v178 = 0;
    if v176.page_entry ~= nil then
        local v179 = v176.page_entry:encode();
        local v180, v181 = v0.writeTag(v177, v178, 1, v0.wireTypes.lengthDelimited);
        v180, v181 = v0.writeBuffer(v180, v181, v179, buffer.len(v179));
        v177 = v180;
        v178 = v181;
    end;
    if v176.kind ~= nil and v176.kind.type == "badge_details" then
        local v182 = v176.kind.value:encode();
        local v183, v184 = v0.writeTag(v177, v178, 2, v0.wireTypes.lengthDelimited);
        v183, v184 = v0.writeBuffer(v183, v184, v182, buffer.len(v182));
        v177 = v183;
        v178 = v184;
    end;
    local v185 = buffer.create(v178);
    buffer.copy(v185, 0, v177, 0, v178);
    return v185;
end;
v7.decode = function(v186) --[[ Line: 1232 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v187 = l_v7_5.new();
    local v188 = 0;
    while v188 < buffer.len(v186) do
        local v189 = nil;
        local v190 = nil;
        local v191, v192, v193 = v0.readTag(v186, v188);
        v189 = v191;
        v190 = v192;
        v188 = v193;
        if v190 == v0.wireTypes.varint then
            v191 = nil;
            v192, v193 = v0.readVarInt(v186, v188);
            v191 = v192;
            v188 = v193;
        elseif v190 == v0.wireTypes.lengthDelimited then
            if v189 == 1 then
                v191 = nil;
                v192, v193 = v0.readBuffer(v186, v188);
                v191 = v192;
                v188 = v193;
                v187.page_entry = v4.PageEntry.decode(v191);
            elseif v189 == 2 then
                v191 = nil;
                v192, v193 = v0.readBuffer(v186, v188);
                v191 = v192;
                v188 = v193;
                v187.kind = {
                    type = "badge_details", 
                    value = v2.BadgeDetailsContent.decode(v191)
                };
            else
                v191 = nil;
                v192, v193 = v0.readVarInt(v186, v188);
                v188 = v193 + v192;
            end;
        elseif v190 == v0.wireTypes.i32 then
            v191 = nil;
            v192, v193 = v0.readFixed32(v186, v188);
            v191 = v192;
            v188 = v193;
        elseif v190 == v0.wireTypes.i64 then
            v191 = nil;
            v192, v193 = v0.readFixed64(v186, v188);
            v191 = v192;
            v188 = v193;
        else
            error("Unsupported wire type: " .. v190);
        end;
    end;
    return v187;
end;
v7.jsonEncode = function(v194) --[[ Line: 1280 ]] --[[ Name: jsonEncode ]]
    local v195 = {};
    if v194.page_entry ~= nil then
        v195.pageEntry = v194.page_entry:jsonEncode();
    end;
    if v194.kind ~= nil and v194.kind.type == "badge_details" then
        v195.badgeDetails = v194.kind.value:jsonEncode();
    end;
    return v195;
end;
v7.jsonDecode = function(v196) --[[ Line: 1296 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v4 (copy), v2 (copy)
    local v197 = l_v7_5.new();
    if v196.page_entry ~= nil then
        v197.page_entry = v4.PageEntry.jsonDecode(v196.page_entry);
    end;
    if v196.pageEntry ~= nil then
        v197.page_entry = v4.PageEntry.jsonDecode(v196.pageEntry);
    end;
    if v196.badge_details ~= nil then
        v197.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsContent.jsonDecode(v196.badge_details)
        };
    end;
    if v196.badgeDetails ~= nil then
        v197.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsContent.jsonDecode(v196.badgeDetails)
        };
    end;
    return v197;
end;
v7.descriptor = {
    name = "BadgeDetailsPageEntry", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageEntry"
};
v2.BadgeDetailsPageEntry = v7;
v1.default:register(v2.BadgeDetailsPageEntry);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v199) --[[ Line: 1332 ]] --[[ Name: new ]]
    -- upvalues: l_v7_6 (copy)
    return (setmetatable({
        badge_id = (not (v199 ~= nil) or v199.badge_id == nil) and "" or v199.badge_id, 
        universe_id = (not (v199 ~= nil) or v199.universe_id == nil) and "" or v199.universe_id, 
        localized_literals = if not (v199 ~= nil) or v199.localized_literals == nil then nil else v199.localized_literals, 
        creator_key = (not (v199 ~= nil) or v199.creator_key == nil) and "" or v199.creator_key
    }, l_v7_6));
end;
v7.encode = function(v200) --[[ Line: 1341 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v201 = buffer.create(0);
    local v202 = 0;
    if v200.badge_id ~= nil and v200.badge_id ~= "" then
        local v203, v204 = v0.writeTag(v201, v202, 1, v0.wireTypes.lengthDelimited);
        v203, v204 = v0.writeString(v203, v204, v200.badge_id);
        v201 = v203;
        v202 = v204;
    end;
    if v200.universe_id ~= nil and v200.universe_id ~= "" then
        local v205, v206 = v0.writeTag(v201, v202, 2, v0.wireTypes.lengthDelimited);
        v205, v206 = v0.writeString(v205, v206, v200.universe_id);
        v201 = v205;
        v202 = v206;
    end;
    if v200.localized_literals ~= nil then
        local v207 = v200.localized_literals:encode();
        local v208, v209 = v0.writeTag(v201, v202, 3, v0.wireTypes.lengthDelimited);
        v208, v209 = v0.writeBuffer(v208, v209, v207, buffer.len(v207));
        v201 = v208;
        v202 = v209;
    end;
    if v200.creator_key ~= nil and v200.creator_key ~= "" then
        local v210, v211 = v0.writeTag(v201, v202, 4, v0.wireTypes.lengthDelimited);
        v210, v211 = v0.writeString(v210, v211, v200.creator_key);
        v201 = v210;
        v202 = v211;
    end;
    local v212 = buffer.create(v202);
    buffer.copy(v212, 0, v201, 0, v202);
    return v212;
end;
v7.decode = function(v213) --[[ Line: 1371 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v2 (copy)
    local v214 = l_v7_6.new();
    local v215 = 0;
    while v215 < buffer.len(v213) do
        local v216 = nil;
        local v217 = nil;
        local v218, v219, v220 = v0.readTag(v213, v215);
        v216 = v218;
        v217 = v219;
        v215 = v220;
        if v217 == v0.wireTypes.varint then
            v218 = nil;
            v219, v220 = v0.readVarInt(v213, v215);
            v218 = v219;
            v215 = v220;
        elseif v217 == v0.wireTypes.lengthDelimited then
            if v216 == 1 then
                v218 = nil;
                v219, v220 = v0.readBuffer(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.badge_id = buffer.tostring(v218);
            elseif v216 == 2 then
                v218 = nil;
                v219, v220 = v0.readBuffer(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.universe_id = buffer.tostring(v218);
            elseif v216 == 3 then
                v218 = nil;
                v219, v220 = v0.readBuffer(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.localized_literals = v2.BadgeDetailsContent_LocalizedLiterals.decode(v218);
            elseif v216 == 4 then
                v218 = nil;
                v219, v220 = v0.readBuffer(v213, v215);
                v218 = v219;
                v215 = v220;
                v214.creator_key = buffer.tostring(v218);
            else
                v218 = nil;
                v219, v220 = v0.readVarInt(v213, v215);
                v215 = v220 + v219;
            end;
        elseif v217 == v0.wireTypes.i32 then
            v218 = nil;
            v219, v220 = v0.readFixed32(v213, v215);
            v218 = v219;
            v215 = v220;
        elseif v217 == v0.wireTypes.i64 then
            v218 = nil;
            v219, v220 = v0.readFixed64(v213, v215);
            v218 = v219;
            v215 = v220;
        else
            error("Unsupported wire type: " .. v217);
        end;
    end;
    return v214;
end;
v7.jsonEncode = function(v221) --[[ Line: 1429 ]] --[[ Name: jsonEncode ]]
    local v222 = {};
    if v221.badge_id ~= nil and v221.badge_id ~= "" then
        v222.badgeId = v221.badge_id;
    end;
    if v221.universe_id ~= nil and v221.universe_id ~= "" then
        v222.universeId = v221.universe_id;
    end;
    if v221.localized_literals ~= nil then
        v222.localizedLiterals = v221.localized_literals:jsonEncode();
    end;
    if v221.creator_key ~= nil and v221.creator_key ~= "" then
        v222.creatorKey = v221.creator_key;
    end;
    return v222;
end;
v7.jsonDecode = function(v223) --[[ Line: 1451 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v2 (copy)
    local v224 = l_v7_6.new();
    if v223.badge_id ~= nil then
        v224.badge_id = v223.badge_id;
    end;
    if v223.badgeId ~= nil then
        v224.badge_id = v223.badgeId;
    end;
    if v223.universe_id ~= nil then
        v224.universe_id = v223.universe_id;
    end;
    if v223.universeId ~= nil then
        v224.universe_id = v223.universeId;
    end;
    if v223.localized_literals ~= nil then
        v224.localized_literals = v2.BadgeDetailsContent_LocalizedLiterals.jsonDecode(v223.localized_literals);
    end;
    if v223.localizedLiterals ~= nil then
        v224.localized_literals = v2.BadgeDetailsContent_LocalizedLiterals.jsonDecode(v223.localizedLiterals);
    end;
    if v223.creator_key ~= nil then
        v224.creator_key = v223.creator_key;
    end;
    if v223.creatorKey ~= nil then
        v224.creator_key = v223.creatorKey;
    end;
    return v224;
end;
v7.descriptor = {
    name = "BadgeDetailsContent", 
    fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsContent"
};
v2.BadgeDetailsContent = v7;
v1.default:register(v2.BadgeDetailsContent);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v226) --[[ Line: 1504 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        info_table = if not (v226 ~= nil) or v226.info_table == nil then nil else v226.info_table, 
        action_module = if not (v226 ~= nil) or v226.action_module == nil then nil else v226.action_module, 
        overflow_menu = if not (v226 ~= nil) or v226.overflow_menu == nil then nil else v226.overflow_menu
    }, l_v7_7));
end;
v7.encode = function(v227) --[[ Line: 1514 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v228 = buffer.create(0);
    local v229 = 0;
    if v227.info_table ~= nil then
        local v230 = v227.info_table:encode();
        local v231, v232 = v0.writeTag(v228, v229, 1, v0.wireTypes.lengthDelimited);
        v231, v232 = v0.writeBuffer(v231, v232, v230, buffer.len(v230));
        v228 = v231;
        v229 = v232;
    end;
    if v227.action_module ~= nil then
        local v233 = v227.action_module:encode();
        local v234, v235 = v0.writeTag(v228, v229, 2, v0.wireTypes.lengthDelimited);
        v234, v235 = v0.writeBuffer(v234, v235, v233, buffer.len(v233));
        v228 = v234;
        v229 = v235;
    end;
    if v227.overflow_menu ~= nil then
        local v236 = v227.overflow_menu:encode();
        local v237, v238 = v0.writeTag(v228, v229, 3, v0.wireTypes.lengthDelimited);
        v237, v238 = v0.writeBuffer(v237, v238, v236, buffer.len(v236));
        v228 = v237;
        v229 = v238;
    end;
    local v239 = buffer.create(v229);
    buffer.copy(v239, 0, v228, 0, v229);
    return v239;
end;
v7.decode = function(v240) --[[ Line: 1541 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v2 (copy)
    local v241 = l_v7_7.new();
    local v242 = 0;
    while v242 < buffer.len(v240) do
        local v243 = nil;
        local v244 = nil;
        local v245, v246, v247 = v0.readTag(v240, v242);
        v243 = v245;
        v244 = v246;
        v242 = v247;
        if v244 == v0.wireTypes.varint then
            v245 = nil;
            v246, v247 = v0.readVarInt(v240, v242);
            v245 = v246;
            v242 = v247;
        elseif v244 == v0.wireTypes.lengthDelimited then
            if v243 == 1 then
                v245 = nil;
                v246, v247 = v0.readBuffer(v240, v242);
                v245 = v246;
                v242 = v247;
                v241.info_table = v2.BadgeDetailsContent_LocalizedLiterals_InfoTable.decode(v245);
            elseif v243 == 2 then
                v245 = nil;
                v246, v247 = v0.readBuffer(v240, v242);
                v245 = v246;
                v242 = v247;
                v241.action_module = v2.BadgeDetailsContent_LocalizedLiterals_ActionModule.decode(v245);
            elseif v243 == 3 then
                v245 = nil;
                v246, v247 = v0.readBuffer(v240, v242);
                v245 = v246;
                v242 = v247;
                v241.overflow_menu = v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.decode(v245);
            else
                v245 = nil;
                v246, v247 = v0.readVarInt(v240, v242);
                v242 = v247 + v246;
            end;
        elseif v244 == v0.wireTypes.i32 then
            v245 = nil;
            v246, v247 = v0.readFixed32(v240, v242);
            v245 = v246;
            v242 = v247;
        elseif v244 == v0.wireTypes.i64 then
            v245 = nil;
            v246, v247 = v0.readFixed64(v240, v242);
            v245 = v246;
            v242 = v247;
        else
            error("Unsupported wire type: " .. v244);
        end;
    end;
    return v241;
end;
v7.jsonEncode = function(v248) --[[ Line: 1594 ]] --[[ Name: jsonEncode ]]
    local v249 = {};
    if v248.info_table ~= nil then
        v249.infoTable = v248.info_table:jsonEncode();
    end;
    if v248.action_module ~= nil then
        v249.actionModule = v248.action_module:jsonEncode();
    end;
    if v248.overflow_menu ~= nil then
        v249.overflowMenu = v248.overflow_menu:jsonEncode();
    end;
    return v249;
end;
v7.jsonDecode = function(v250) --[[ Line: 1612 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v2 (copy)
    local v251 = l_v7_7.new();
    if v250.info_table ~= nil then
        v251.info_table = v2.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(v250.info_table);
    end;
    if v250.infoTable ~= nil then
        v251.info_table = v2.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(v250.infoTable);
    end;
    if v250.action_module ~= nil then
        v251.action_module = v2.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(v250.action_module);
    end;
    if v250.actionModule ~= nil then
        v251.action_module = v2.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(v250.actionModule);
    end;
    if v250.overflow_menu ~= nil then
        v251.overflow_menu = v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(v250.overflow_menu);
    end;
    if v250.overflowMenu ~= nil then
        v251.overflow_menu = v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(v250.overflowMenu);
    end;
    return v251;
end;
v7.descriptor = {
    name = "BadgeDetailsContent_LocalizedLiterals", 
    fullName = "roblox.apppageplatform.badges.v1beta1.LocalizedLiterals"
};
v2.BadgeDetailsContent_LocalizedLiterals = v7;
v1.default:register(v2.BadgeDetailsContent_LocalizedLiterals);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v253) --[[ Line: 1662 ]] --[[ Name: new ]]
    -- upvalues: l_v7_8 (copy)
    return (setmetatable({
        type_label = (not (v253 ~= nil) or v253.type_label == nil) and "" or v253.type_label, 
        earned_label = (not (v253 ~= nil) or v253.earned_label == nil) and "" or v253.earned_label, 
        updated_label = (not (v253 ~= nil) or v253.updated_label == nil) and "" or v253.updated_label, 
        experience_label = (not (v253 ~= nil) or v253.experience_label == nil) and "" or v253.experience_label, 
        rarity_label = (not (v253 ~= nil) or v253.rarity_label == nil) and "" or v253.rarity_label, 
        won_yesterday_label = (not (v253 ~= nil) or v253.won_yesterday_label == nil) and "" or v253.won_yesterday_label, 
        won_ever_label = (not (v253 ~= nil) or v253.won_ever_label == nil) and "" or v253.won_ever_label
    }, l_v7_8));
end;
v7.encode = function(v254) --[[ Line: 1678 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v255 = buffer.create(0);
    local v256 = 0;
    if v254.type_label ~= nil and v254.type_label ~= "" then
        local v257, v258 = v0.writeTag(v255, v256, 1, v0.wireTypes.lengthDelimited);
        v257, v258 = v0.writeString(v257, v258, v254.type_label);
        v255 = v257;
        v256 = v258;
    end;
    if v254.earned_label ~= nil and v254.earned_label ~= "" then
        local v259, v260 = v0.writeTag(v255, v256, 2, v0.wireTypes.lengthDelimited);
        v259, v260 = v0.writeString(v259, v260, v254.earned_label);
        v255 = v259;
        v256 = v260;
    end;
    if v254.updated_label ~= nil and v254.updated_label ~= "" then
        local v261, v262 = v0.writeTag(v255, v256, 3, v0.wireTypes.lengthDelimited);
        v261, v262 = v0.writeString(v261, v262, v254.updated_label);
        v255 = v261;
        v256 = v262;
    end;
    if v254.experience_label ~= nil and v254.experience_label ~= "" then
        local v263, v264 = v0.writeTag(v255, v256, 4, v0.wireTypes.lengthDelimited);
        v263, v264 = v0.writeString(v263, v264, v254.experience_label);
        v255 = v263;
        v256 = v264;
    end;
    if v254.rarity_label ~= nil and v254.rarity_label ~= "" then
        local v265, v266 = v0.writeTag(v255, v256, 5, v0.wireTypes.lengthDelimited);
        v265, v266 = v0.writeString(v265, v266, v254.rarity_label);
        v255 = v265;
        v256 = v266;
    end;
    if v254.won_yesterday_label ~= nil and v254.won_yesterday_label ~= "" then
        local v267, v268 = v0.writeTag(v255, v256, 6, v0.wireTypes.lengthDelimited);
        v267, v268 = v0.writeString(v267, v268, v254.won_yesterday_label);
        v255 = v267;
        v256 = v268;
    end;
    if v254.won_ever_label ~= nil and v254.won_ever_label ~= "" then
        local v269, v270 = v0.writeTag(v255, v256, 7, v0.wireTypes.lengthDelimited);
        v269, v270 = v0.writeString(v269, v270, v254.won_ever_label);
        v255 = v269;
        v256 = v270;
    end;
    local v271 = buffer.create(v256);
    buffer.copy(v271, 0, v255, 0, v256);
    return v271;
end;
v7.decode = function(v272) --[[ Line: 1724 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy)
    local v273 = l_v7_8.new();
    local v274 = 0;
    while v274 < buffer.len(v272) do
        local v275 = nil;
        local v276 = nil;
        local v277, v278, v279 = v0.readTag(v272, v274);
        v275 = v277;
        v276 = v278;
        v274 = v279;
        if v276 == v0.wireTypes.varint then
            v277 = nil;
            v278, v279 = v0.readVarInt(v272, v274);
            v277 = v278;
            v274 = v279;
        elseif v276 == v0.wireTypes.lengthDelimited then
            if v275 == 1 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.type_label = buffer.tostring(v277);
            elseif v275 == 2 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.earned_label = buffer.tostring(v277);
            elseif v275 == 3 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.updated_label = buffer.tostring(v277);
            elseif v275 == 4 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.experience_label = buffer.tostring(v277);
            elseif v275 == 5 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.rarity_label = buffer.tostring(v277);
            elseif v275 == 6 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.won_yesterday_label = buffer.tostring(v277);
            elseif v275 == 7 then
                v277 = nil;
                v278, v279 = v0.readBuffer(v272, v274);
                v277 = v278;
                v274 = v279;
                v273.won_ever_label = buffer.tostring(v277);
            else
                v277 = nil;
                v278, v279 = v0.readVarInt(v272, v274);
                v274 = v279 + v278;
            end;
        elseif v276 == v0.wireTypes.i32 then
            v277 = nil;
            v278, v279 = v0.readFixed32(v272, v274);
            v277 = v278;
            v274 = v279;
        elseif v276 == v0.wireTypes.i64 then
            v277 = nil;
            v278, v279 = v0.readFixed64(v272, v274);
            v277 = v278;
            v274 = v279;
        else
            error("Unsupported wire type: " .. v276);
        end;
    end;
    return v273;
end;
v7.jsonEncode = function(v280) --[[ Line: 1799 ]] --[[ Name: jsonEncode ]]
    local v281 = {};
    if v280.type_label ~= nil and v280.type_label ~= "" then
        v281.typeLabel = v280.type_label;
    end;
    if v280.earned_label ~= nil and v280.earned_label ~= "" then
        v281.earnedLabel = v280.earned_label;
    end;
    if v280.updated_label ~= nil and v280.updated_label ~= "" then
        v281.updatedLabel = v280.updated_label;
    end;
    if v280.experience_label ~= nil and v280.experience_label ~= "" then
        v281.experienceLabel = v280.experience_label;
    end;
    if v280.rarity_label ~= nil and v280.rarity_label ~= "" then
        v281.rarityLabel = v280.rarity_label;
    end;
    if v280.won_yesterday_label ~= nil and v280.won_yesterday_label ~= "" then
        v281.wonYesterdayLabel = v280.won_yesterday_label;
    end;
    if v280.won_ever_label ~= nil and v280.won_ever_label ~= "" then
        v281.wonEverLabel = v280.won_ever_label;
    end;
    return v281;
end;
v7.jsonDecode = function(v282) --[[ Line: 1835 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy)
    local v283 = l_v7_8.new();
    if v282.type_label ~= nil then
        v283.type_label = v282.type_label;
    end;
    if v282.typeLabel ~= nil then
        v283.type_label = v282.typeLabel;
    end;
    if v282.earned_label ~= nil then
        v283.earned_label = v282.earned_label;
    end;
    if v282.earnedLabel ~= nil then
        v283.earned_label = v282.earnedLabel;
    end;
    if v282.updated_label ~= nil then
        v283.updated_label = v282.updated_label;
    end;
    if v282.updatedLabel ~= nil then
        v283.updated_label = v282.updatedLabel;
    end;
    if v282.experience_label ~= nil then
        v283.experience_label = v282.experience_label;
    end;
    if v282.experienceLabel ~= nil then
        v283.experience_label = v282.experienceLabel;
    end;
    if v282.rarity_label ~= nil then
        v283.rarity_label = v282.rarity_label;
    end;
    if v282.rarityLabel ~= nil then
        v283.rarity_label = v282.rarityLabel;
    end;
    if v282.won_yesterday_label ~= nil then
        v283.won_yesterday_label = v282.won_yesterday_label;
    end;
    if v282.wonYesterdayLabel ~= nil then
        v283.won_yesterday_label = v282.wonYesterdayLabel;
    end;
    if v282.won_ever_label ~= nil then
        v283.won_ever_label = v282.won_ever_label;
    end;
    if v282.wonEverLabel ~= nil then
        v283.won_ever_label = v282.wonEverLabel;
    end;
    return v283;
end;
v7.descriptor = {
    name = "BadgeDetailsContent_LocalizedLiterals_InfoTable", 
    fullName = "roblox.apppageplatform.badges.v1beta1.InfoTable"
};
v2.BadgeDetailsContent_LocalizedLiterals_InfoTable = v7;
v1.default:register(v2.BadgeDetailsContent_LocalizedLiterals_InfoTable);
v7 = {};
v7.__index = v7;
local l_v7_9 = v7 --[[ copy: 7 -> 17 ]];
v7.new = function(v285) --[[ Line: 1915 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        share = (not (v285 ~= nil) or v285.share == nil) and "" or v285.share, 
        report = (not (v285 ~= nil) or v285.report == nil) and "" or v285.report
    }, l_v7_9));
end;
v7.encode = function(v286) --[[ Line: 1927 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v287 = buffer.create(0);
    local v288 = 0;
    if v286.share ~= nil and v286.share ~= "" then
        local v289, v290 = v0.writeTag(v287, v288, 1, v0.wireTypes.lengthDelimited);
        v289, v290 = v0.writeString(v289, v290, v286.share);
        v287 = v289;
        v288 = v290;
    end;
    if v286.report ~= nil and v286.report ~= "" then
        local v291, v292 = v0.writeTag(v287, v288, 2, v0.wireTypes.lengthDelimited);
        v291, v292 = v0.writeString(v291, v292, v286.report);
        v287 = v291;
        v288 = v292;
    end;
    local v293 = buffer.create(v288);
    buffer.copy(v293, 0, v287, 0, v288);
    return v293;
end;
v7.decode = function(v294) --[[ Line: 1948 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy)
    local v295 = l_v7_9.new();
    local v296 = 0;
    while v296 < buffer.len(v294) do
        local v297 = nil;
        local v298 = nil;
        local v299, v300, v301 = v0.readTag(v294, v296);
        v297 = v299;
        v298 = v300;
        v296 = v301;
        if v298 == v0.wireTypes.varint then
            v299 = nil;
            v300, v301 = v0.readVarInt(v294, v296);
            v299 = v300;
            v296 = v301;
        elseif v298 == v0.wireTypes.lengthDelimited then
            if v297 == 1 then
                v299 = nil;
                v300, v301 = v0.readBuffer(v294, v296);
                v299 = v300;
                v296 = v301;
                v295.share = buffer.tostring(v299);
            elseif v297 == 2 then
                v299 = nil;
                v300, v301 = v0.readBuffer(v294, v296);
                v299 = v300;
                v296 = v301;
                v295.report = buffer.tostring(v299);
            else
                v299 = nil;
                v300, v301 = v0.readVarInt(v294, v296);
                v296 = v301 + v300;
            end;
        elseif v298 == v0.wireTypes.i32 then
            v299 = nil;
            v300, v301 = v0.readFixed32(v294, v296);
            v299 = v300;
            v296 = v301;
        elseif v298 == v0.wireTypes.i64 then
            v299 = nil;
            v300, v301 = v0.readFixed64(v294, v296);
            v299 = v300;
            v296 = v301;
        else
            error("Unsupported wire type: " .. v298);
        end;
    end;
    return v295;
end;
v7.jsonEncode = function(v302) --[[ Line: 1998 ]] --[[ Name: jsonEncode ]]
    local v303 = {};
    if v302.share ~= nil and v302.share ~= "" then
        v303.share = v302.share;
    end;
    if v302.report ~= nil and v302.report ~= "" then
        v303.report = v302.report;
    end;
    return v303;
end;
v7.jsonDecode = function(v304) --[[ Line: 2014 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy)
    local v305 = l_v7_9.new();
    if v304.share ~= nil then
        v305.share = v304.share;
    end;
    if v304.report ~= nil then
        v305.report = v304.report;
    end;
    return v305;
end;
v7.descriptor = {
    name = "BadgeDetailsContent_LocalizedLiterals_ActionModule", 
    fullName = "roblox.apppageplatform.badges.v1beta1.ActionModule"
};
v2.BadgeDetailsContent_LocalizedLiterals_ActionModule = v7;
v1.default:register(v2.BadgeDetailsContent_LocalizedLiterals_ActionModule);
v7 = {};
v7.__index = v7;
v7.new = function(v306) --[[ Line: 2046 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        report = (not (v306 ~= nil) or v306.report == nil) and "" or v306.report, 
        remove = (not (v306 ~= nil) or v306.remove == nil) and "" or v306.remove
    }, v7));
end;
v7.encode = function(v307) --[[ Line: 2058 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v308 = buffer.create(0);
    local v309 = 0;
    if v307.report ~= nil and v307.report ~= "" then
        local v310, v311 = v0.writeTag(v308, v309, 1, v0.wireTypes.lengthDelimited);
        v310, v311 = v0.writeString(v310, v311, v307.report);
        v308 = v310;
        v309 = v311;
    end;
    if v307.remove ~= nil and v307.remove ~= "" then
        local v312, v313 = v0.writeTag(v308, v309, 2, v0.wireTypes.lengthDelimited);
        v312, v313 = v0.writeString(v312, v313, v307.remove);
        v308 = v312;
        v309 = v313;
    end;
    local v314 = buffer.create(v309);
    buffer.copy(v314, 0, v308, 0, v309);
    return v314;
end;
v7.decode = function(v315) --[[ Line: 2079 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy)
    local v316 = v7.new();
    local v317 = 0;
    while v317 < buffer.len(v315) do
        local v318 = nil;
        local v319 = nil;
        local v320, v321, v322 = v0.readTag(v315, v317);
        v318 = v320;
        v319 = v321;
        v317 = v322;
        if v319 == v0.wireTypes.varint then
            v320 = nil;
            v321, v322 = v0.readVarInt(v315, v317);
            v320 = v321;
            v317 = v322;
        elseif v319 == v0.wireTypes.lengthDelimited then
            if v318 == 1 then
                v320 = nil;
                v321, v322 = v0.readBuffer(v315, v317);
                v320 = v321;
                v317 = v322;
                v316.report = buffer.tostring(v320);
            elseif v318 == 2 then
                v320 = nil;
                v321, v322 = v0.readBuffer(v315, v317);
                v320 = v321;
                v317 = v322;
                v316.remove = buffer.tostring(v320);
            else
                v320 = nil;
                v321, v322 = v0.readVarInt(v315, v317);
                v317 = v322 + v321;
            end;
        elseif v319 == v0.wireTypes.i32 then
            v320 = nil;
            v321, v322 = v0.readFixed32(v315, v317);
            v320 = v321;
            v317 = v322;
        elseif v319 == v0.wireTypes.i64 then
            v320 = nil;
            v321, v322 = v0.readFixed64(v315, v317);
            v320 = v321;
            v317 = v322;
        else
            error("Unsupported wire type: " .. v319);
        end;
    end;
    return v316;
end;
v7.jsonEncode = function(v323) --[[ Line: 2129 ]] --[[ Name: jsonEncode ]]
    local v324 = {};
    if v323.report ~= nil and v323.report ~= "" then
        v324.report = v323.report;
    end;
    if v323.remove ~= nil and v323.remove ~= "" then
        v324.remove = v323.remove;
    end;
    return v324;
end;
v7.jsonDecode = function(v325) --[[ Line: 2145 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy)
    local v326 = v7.new();
    if v325.report ~= nil then
        v326.report = v325.report;
    end;
    if v325.remove ~= nil then
        v326.remove = v325.remove;
    end;
    return v326;
end;
v7.descriptor = {
    name = "BadgeDetailsContent_LocalizedLiterals_OverflowMenu", 
    fullName = "roblox.apppageplatform.badges.v1beta1.OverflowMenu"
};
v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu = v7;
v1.default:register(v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu);
return {
    BadgeDetailsPageRequest = v2.BadgeDetailsPageRequest, 
    BadgeDetailsPageResponse = v2.BadgeDetailsPageResponse, 
    BadgeDetailsPageV2Response = v2.BadgeDetailsPageV2Response, 
    BadgeDetailsPageEntry = v2.BadgeDetailsPageEntry, 
    BadgeDetailsContent = v2.BadgeDetailsContent, 
    BadgeDetailsContent_LocalizedLiterals = v2.BadgeDetailsContent_LocalizedLiterals, 
    BadgeDetailsContent_LocalizedLiterals_InfoTable = v2.BadgeDetailsContent_LocalizedLiterals_InfoTable, 
    BadgeDetailsContent_LocalizedLiterals_ActionModule = v2.BadgeDetailsContent_LocalizedLiterals_ActionModule, 
    BadgeDetailsContent_LocalizedLiterals_OverflowMenu = v2.BadgeDetailsContent_LocalizedLiterals_OverflowMenu
};