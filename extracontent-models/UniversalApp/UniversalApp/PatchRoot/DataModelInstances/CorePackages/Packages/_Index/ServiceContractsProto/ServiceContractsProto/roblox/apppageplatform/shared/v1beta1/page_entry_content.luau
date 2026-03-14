local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
local l_v3_0 = v3 --[[ copy: 3 -> 4 ]];
v3.new = function(v5) --[[ Line: 430 ]] --[[ Name: new ]]
    -- upvalues: l_v3_0 (copy)
    return (setmetatable({
        kind = if not (v5 ~= nil) or v5.kind == nil then nil else v5.kind
    }, l_v3_0));
end;
v3.encode = function(v6) --[[ Line: 436 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.kind ~= nil then
        if v6.kind.type == "badges_grid" then
            local v9 = v6.kind.value:encode();
            local v10, v11 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
            v10, v11 = v0.writeBuffer(v10, v11, v9, buffer.len(v9));
            v7 = v10;
            v8 = v11;
        elseif v6.kind.type == "badge_details" then
            local v12 = v6.kind.value:encode();
            local v13, v14 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
            v13, v14 = v0.writeBuffer(v13, v14, v12, buffer.len(v12));
            v7 = v13;
            v8 = v14;
        elseif v6.kind.type == "static_content" then
            local v15 = v6.kind.value:encode();
            local v16, v17 = v0.writeTag(v7, v8, 3, v0.wireTypes.lengthDelimited);
            v16, v17 = v0.writeBuffer(v16, v17, v15, buffer.len(v15));
            v7 = v16;
            v8 = v17;
        elseif v6.kind.type == "prompts" then
            local v18 = v6.kind.value:encode();
            local v19, v20 = v0.writeTag(v7, v8, 4, v0.wireTypes.lengthDelimited);
            v19, v20 = v0.writeBuffer(v19, v20, v18, buffer.len(v18));
            v7 = v19;
            v8 = v20;
        end;
    end;
    local v21 = buffer.create(v8);
    buffer.copy(v21, 0, v7, 0, v8);
    return v21;
end;
v3.decode = function(v22) --[[ Line: 465 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_0 (copy), v0 (copy), v2 (copy)
    local v23 = l_v3_0.new();
    local v24 = 0;
    while v24 < buffer.len(v22) do
        local v25 = nil;
        local v26 = nil;
        local v27, v28, v29 = v0.readTag(v22, v24);
        v25 = v27;
        v26 = v28;
        v24 = v29;
        if v26 == v0.wireTypes.varint then
            v27 = nil;
            v28, v29 = v0.readVarInt(v22, v24);
            v27 = v28;
            v24 = v29;
        elseif v26 == v0.wireTypes.lengthDelimited then
            if v25 == 1 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "badges_grid", 
                    value = v2.BadgesGridInputData.decode(v27)
                };
            elseif v25 == 2 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "badge_details", 
                    value = v2.BadgeDetailsInputData.decode(v27)
                };
            elseif v25 == 3 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "static_content", 
                    value = v2.StaticInputData.decode(v27)
                };
            elseif v25 == 4 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "prompts", 
                    value = v2.PromptsInputData.decode(v27)
                };
            else
                v27 = nil;
                v28, v29 = v0.readVarInt(v22, v24);
                v24 = v29 + v28;
            end;
        elseif v26 == v0.wireTypes.i32 then
            v27 = nil;
            v28, v29 = v0.readFixed32(v22, v24);
            v27 = v28;
            v24 = v29;
        elseif v26 == v0.wireTypes.i64 then
            v27 = nil;
            v28, v29 = v0.readFixed64(v22, v24);
            v27 = v28;
            v24 = v29;
        else
            error("Unsupported wire type: " .. v26);
        end;
    end;
    return v23;
end;
v3.jsonEncode = function(v30) --[[ Line: 523 ]] --[[ Name: jsonEncode ]]
    local v31 = {};
    if v30.kind ~= nil then
        if v30.kind.type == "badges_grid" then
            v31.badgesGrid = v30.kind.value:jsonEncode();
            return v31;
        elseif v30.kind.type == "badge_details" then
            v31.badgeDetails = v30.kind.value:jsonEncode();
            return v31;
        elseif v30.kind.type == "static_content" then
            v31.staticContent = v30.kind.value:jsonEncode();
            return v31;
        elseif v30.kind.type == "prompts" then
            v31.prompts = v30.kind.value:jsonEncode();
        end;
    end;
    return v31;
end;
v3.jsonDecode = function(v32) --[[ Line: 541 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_0 (copy), v2 (copy)
    local v33 = l_v3_0.new();
    if v32.badges_grid ~= nil then
        v33.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v32.badges_grid)
        };
    end;
    if v32.badgesGrid ~= nil then
        v33.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v32.badgesGrid)
        };
    end;
    if v32.badge_details ~= nil then
        v33.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v32.badge_details)
        };
    end;
    if v32.badgeDetails ~= nil then
        v33.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v32.badgeDetails)
        };
    end;
    if v32.static_content ~= nil then
        v33.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v32.static_content)
        };
    end;
    if v32.staticContent ~= nil then
        v33.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v32.staticContent)
        };
    end;
    if v32.prompts ~= nil then
        v33.kind = {
            type = "prompts", 
            value = v2.PromptsInputData.jsonDecode(v32.prompts)
        };
    end;
    return v33;
end;
v3.descriptor = {
    name = "PageEntryInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
};
v2.PageEntryInputData = v3;
v1.default:register(v2.PageEntryInputData);
v3 = {};
v3.__index = v3;
local l_v3_1 = v3 --[[ copy: 3 -> 5 ]];
v3.new = function(v35) --[[ Line: 591 ]] --[[ Name: new ]]
    -- upvalues: l_v3_1 (copy)
    return (setmetatable({
        section_title = (not (v35 ~= nil) or v35.section_title == nil) and "" or v35.section_title, 
        badges = if not (v35 ~= nil) or v35.badges == nil then {} else v35.badges, 
        collection_id = (not (v35 ~= nil) or v35.collection_id == nil) and "" or v35.collection_id, 
        collection_position = (not (v35 ~= nil) or v35.collection_position == nil) and "" or v35.collection_position, 
        universe_id = (not (v35 ~= nil) or v35.universe_id == nil) and "" or v35.universe_id
    }, l_v3_1));
end;
v3.encode = function(v36) --[[ Line: 603 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v37 = buffer.create(0);
    local v38 = 0;
    if v36.section_title ~= nil and v36.section_title ~= "" then
        local v39, v40 = v0.writeTag(v37, v38, 1, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeString(v39, v40, v36.section_title);
        v37 = v39;
        v38 = v40;
    end;
    if v36.badges ~= nil and #v36.badges > 0 then
        for _, v42 in v36.badges do
            local v43 = v42:encode();
            local v44, v45 = v0.writeTag(v37, v38, 2, v0.wireTypes.lengthDelimited);
            v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
            v37 = v44;
            v38 = v45;
        end;
    end;
    if v36.collection_id ~= nil and v36.collection_id ~= "" then
        local v46, v47 = v0.writeTag(v37, v38, 3, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeString(v46, v47, v36.collection_id);
        v37 = v46;
        v38 = v47;
    end;
    if v36.collection_position ~= nil and v36.collection_position ~= "" then
        local v48, v49 = v0.writeTag(v37, v38, 4, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeString(v48, v49, v36.collection_position);
        v37 = v48;
        v38 = v49;
    end;
    if v36.universe_id ~= nil and v36.universe_id ~= "" then
        local v50, v51 = v0.writeTag(v37, v38, 5, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeString(v50, v51, v36.universe_id);
        v37 = v50;
        v38 = v51;
    end;
    local v52 = buffer.create(v38);
    buffer.copy(v52, 0, v37, 0, v38);
    return v52;
end;
v3.decode = function(v53) --[[ Line: 640 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_1 (copy), v0 (copy), v2 (copy)
    local v54 = l_v3_1.new();
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
                v54.section_title = buffer.tostring(v58);
            elseif v56 == 2 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                table.insert(v54.badges, v2.BadgesGridInputData_BadgeInputData.decode(v58));
            elseif v56 == 3 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                v54.collection_id = buffer.tostring(v58);
            elseif v56 == 4 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                v54.collection_position = buffer.tostring(v58);
            elseif v56 == 5 then
                v58 = nil;
                v59, v60 = v0.readBuffer(v53, v55);
                v58 = v59;
                v55 = v60;
                v54.universe_id = buffer.tostring(v58);
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
v3.jsonEncode = function(v61) --[[ Line: 703 ]] --[[ Name: jsonEncode ]]
    local v62 = {};
    if v61.section_title ~= nil and v61.section_title ~= "" then
        v62.sectionTitle = v61.section_title;
    end;
    if v61.badges ~= nil and #v61.badges > 0 then
        local v63 = {};
        for _, v65 in v61.badges do
            table.insert(v63, v65:jsonEncode());
        end;
        v62.badges = v63;
    end;
    if v61.collection_id ~= nil and v61.collection_id ~= "" then
        v62.collectionId = v61.collection_id;
    end;
    if v61.collection_position ~= nil and v61.collection_position ~= "" then
        v62.collectionPosition = v61.collection_position;
    end;
    if v61.universe_id ~= nil and v61.universe_id ~= "" then
        v62.universeId = v61.universe_id;
    end;
    return v62;
end;
v3.jsonDecode = function(v66) --[[ Line: 733 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_1 (copy), v2 (copy)
    local v67 = l_v3_1.new();
    if v66.section_title ~= nil then
        v67.section_title = v66.section_title;
    end;
    if v66.sectionTitle ~= nil then
        v67.section_title = v66.sectionTitle;
    end;
    if v66.badges ~= nil then
        local v68 = {};
        for _, v70 in v66.badges do
            table.insert(v68, v2.BadgesGridInputData_BadgeInputData.jsonDecode(v70));
        end;
        v67.badges = v68;
    end;
    if v66.collection_id ~= nil then
        v67.collection_id = v66.collection_id;
    end;
    if v66.collectionId ~= nil then
        v67.collection_id = v66.collectionId;
    end;
    if v66.collection_position ~= nil then
        v67.collection_position = v66.collection_position;
    end;
    if v66.collectionPosition ~= nil then
        v67.collection_position = v66.collectionPosition;
    end;
    if v66.universe_id ~= nil then
        v67.universe_id = v66.universe_id;
    end;
    if v66.universeId ~= nil then
        v67.universe_id = v66.universeId;
    end;
    return v67;
end;
v3.descriptor = {
    name = "BadgesGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
};
v2.BadgesGridInputData = v3;
v1.default:register(v2.BadgesGridInputData);
v3 = {};
v3.__index = v3;
local l_v3_2 = v3 --[[ copy: 3 -> 6 ]];
v3.new = function(v72) --[[ Line: 794 ]] --[[ Name: new ]]
    -- upvalues: l_v3_2 (copy)
    return (setmetatable({
        badge_id = (not (v72 ~= nil) or v72.badge_id == nil) and "" or v72.badge_id
    }, l_v3_2));
end;
v3.encode = function(v73) --[[ Line: 802 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v74 = buffer.create(0);
    local v75 = 0;
    if v73.badge_id ~= nil and v73.badge_id ~= "" then
        local v76, v77 = v0.writeTag(v74, v75, 1, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeString(v76, v77, v73.badge_id);
        v74 = v76;
        v75 = v77;
    end;
    local v78 = buffer.create(v75);
    buffer.copy(v78, 0, v74, 0, v75);
    return v78;
end;
v3.decode = function(v79) --[[ Line: 816 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_2 (copy), v0 (copy)
    local v80 = l_v3_2.new();
    local v81 = 0;
    while v81 < buffer.len(v79) do
        local v82 = nil;
        local v83 = nil;
        local v84, v85, v86 = v0.readTag(v79, v81);
        v82 = v84;
        v83 = v85;
        v81 = v86;
        if v83 == v0.wireTypes.varint then
            v84 = nil;
            v85, v86 = v0.readVarInt(v79, v81);
            v84 = v85;
            v81 = v86;
        elseif v83 == v0.wireTypes.lengthDelimited then
            if v82 == 1 then
                v84 = nil;
                v85, v86 = v0.readBuffer(v79, v81);
                v84 = v85;
                v81 = v86;
                v80.badge_id = buffer.tostring(v84);
            else
                v84 = nil;
                v85, v86 = v0.readVarInt(v79, v81);
                v81 = v86 + v85;
            end;
        elseif v83 == v0.wireTypes.i32 then
            v84 = nil;
            v85, v86 = v0.readFixed32(v79, v81);
            v84 = v85;
            v81 = v86;
        elseif v83 == v0.wireTypes.i64 then
            v84 = nil;
            v85, v86 = v0.readFixed64(v79, v81);
            v84 = v85;
            v81 = v86;
        else
            error("Unsupported wire type: " .. v83);
        end;
    end;
    return v80;
end;
v3.jsonEncode = function(v87) --[[ Line: 859 ]] --[[ Name: jsonEncode ]]
    local v88 = {};
    if v87.badge_id ~= nil and v87.badge_id ~= "" then
        v88.badgeId = v87.badge_id;
    end;
    return v88;
end;
v3.jsonDecode = function(v89) --[[ Line: 869 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_2 (copy)
    local v90 = l_v3_2.new();
    if v89.badge_id ~= nil then
        v90.badge_id = v89.badge_id;
    end;
    if v89.badgeId ~= nil then
        v90.badge_id = v89.badgeId;
    end;
    return v90;
end;
v3.descriptor = {
    name = "BadgesGridInputData_BadgeInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
};
v2.BadgesGridInputData_BadgeInputData = v3;
v1.default:register(v2.BadgesGridInputData_BadgeInputData);
v3 = {};
v3.__index = v3;
local l_v3_3 = v3 --[[ copy: 3 -> 7 ]];
v3.new = function(v92) --[[ Line: 899 ]] --[[ Name: new ]]
    -- upvalues: l_v3_3 (copy)
    return (setmetatable({
        badge_id = (not (v92 ~= nil) or v92.badge_id == nil) and "" or v92.badge_id, 
        universe_id = (not (v92 ~= nil) or v92.universe_id == nil) and "" or v92.universe_id, 
        localized_literals = if not (v92 ~= nil) or v92.localized_literals == nil then nil else v92.localized_literals, 
        creator_key = (not (v92 ~= nil) or v92.creator_key == nil) and "" or v92.creator_key
    }, l_v3_3));
end;
v3.encode = function(v93) --[[ Line: 908 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v94 = buffer.create(0);
    local v95 = 0;
    if v93.badge_id ~= nil and v93.badge_id ~= "" then
        local v96, v97 = v0.writeTag(v94, v95, 1, v0.wireTypes.lengthDelimited);
        v96, v97 = v0.writeString(v96, v97, v93.badge_id);
        v94 = v96;
        v95 = v97;
    end;
    if v93.universe_id ~= nil and v93.universe_id ~= "" then
        local v98, v99 = v0.writeTag(v94, v95, 2, v0.wireTypes.lengthDelimited);
        v98, v99 = v0.writeString(v98, v99, v93.universe_id);
        v94 = v98;
        v95 = v99;
    end;
    if v93.localized_literals ~= nil then
        local v100 = v93.localized_literals:encode();
        local v101, v102 = v0.writeTag(v94, v95, 3, v0.wireTypes.lengthDelimited);
        v101, v102 = v0.writeBuffer(v101, v102, v100, buffer.len(v100));
        v94 = v101;
        v95 = v102;
    end;
    if v93.creator_key ~= nil and v93.creator_key ~= "" then
        local v103, v104 = v0.writeTag(v94, v95, 4, v0.wireTypes.lengthDelimited);
        v103, v104 = v0.writeString(v103, v104, v93.creator_key);
        v94 = v103;
        v95 = v104;
    end;
    local v105 = buffer.create(v95);
    buffer.copy(v105, 0, v94, 0, v95);
    return v105;
end;
v3.decode = function(v106) --[[ Line: 938 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_3 (copy), v0 (copy), v2 (copy)
    local v107 = l_v3_3.new();
    local v108 = 0;
    while v108 < buffer.len(v106) do
        local v109 = nil;
        local v110 = nil;
        local v111, v112, v113 = v0.readTag(v106, v108);
        v109 = v111;
        v110 = v112;
        v108 = v113;
        if v110 == v0.wireTypes.varint then
            v111 = nil;
            v112, v113 = v0.readVarInt(v106, v108);
            v111 = v112;
            v108 = v113;
        elseif v110 == v0.wireTypes.lengthDelimited then
            if v109 == 1 then
                v111 = nil;
                v112, v113 = v0.readBuffer(v106, v108);
                v111 = v112;
                v108 = v113;
                v107.badge_id = buffer.tostring(v111);
            elseif v109 == 2 then
                v111 = nil;
                v112, v113 = v0.readBuffer(v106, v108);
                v111 = v112;
                v108 = v113;
                v107.universe_id = buffer.tostring(v111);
            elseif v109 == 3 then
                v111 = nil;
                v112, v113 = v0.readBuffer(v106, v108);
                v111 = v112;
                v108 = v113;
                v107.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.decode(v111);
            elseif v109 == 4 then
                v111 = nil;
                v112, v113 = v0.readBuffer(v106, v108);
                v111 = v112;
                v108 = v113;
                v107.creator_key = buffer.tostring(v111);
            else
                v111 = nil;
                v112, v113 = v0.readVarInt(v106, v108);
                v108 = v113 + v112;
            end;
        elseif v110 == v0.wireTypes.i32 then
            v111 = nil;
            v112, v113 = v0.readFixed32(v106, v108);
            v111 = v112;
            v108 = v113;
        elseif v110 == v0.wireTypes.i64 then
            v111 = nil;
            v112, v113 = v0.readFixed64(v106, v108);
            v111 = v112;
            v108 = v113;
        else
            error("Unsupported wire type: " .. v110);
        end;
    end;
    return v107;
end;
v3.jsonEncode = function(v114) --[[ Line: 996 ]] --[[ Name: jsonEncode ]]
    local v115 = {};
    if v114.badge_id ~= nil and v114.badge_id ~= "" then
        v115.badgeId = v114.badge_id;
    end;
    if v114.universe_id ~= nil and v114.universe_id ~= "" then
        v115.universeId = v114.universe_id;
    end;
    if v114.localized_literals ~= nil then
        v115.localizedLiterals = v114.localized_literals:jsonEncode();
    end;
    if v114.creator_key ~= nil and v114.creator_key ~= "" then
        v115.creatorKey = v114.creator_key;
    end;
    return v115;
end;
v3.jsonDecode = function(v116) --[[ Line: 1018 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_3 (copy), v2 (copy)
    local v117 = l_v3_3.new();
    if v116.badge_id ~= nil then
        v117.badge_id = v116.badge_id;
    end;
    if v116.badgeId ~= nil then
        v117.badge_id = v116.badgeId;
    end;
    if v116.universe_id ~= nil then
        v117.universe_id = v116.universe_id;
    end;
    if v116.universeId ~= nil then
        v117.universe_id = v116.universeId;
    end;
    if v116.localized_literals ~= nil then
        v117.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v116.localized_literals);
    end;
    if v116.localizedLiterals ~= nil then
        v117.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v116.localizedLiterals);
    end;
    if v116.creator_key ~= nil then
        v117.creator_key = v116.creator_key;
    end;
    if v116.creatorKey ~= nil then
        v117.creator_key = v116.creatorKey;
    end;
    return v117;
end;
v3.descriptor = {
    name = "BadgeDetailsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
};
v2.BadgeDetailsInputData = v3;
v1.default:register(v2.BadgeDetailsInputData);
v3 = {};
v3.__index = v3;
local l_v3_4 = v3 --[[ copy: 3 -> 8 ]];
v3.new = function(v119) --[[ Line: 1072 ]] --[[ Name: new ]]
    -- upvalues: l_v3_4 (copy)
    return (setmetatable({
        info_table = if not (v119 ~= nil) or v119.info_table == nil then nil else v119.info_table, 
        action_module = if not (v119 ~= nil) or v119.action_module == nil then nil else v119.action_module, 
        overflow_menu = if not (v119 ~= nil) or v119.overflow_menu == nil then nil else v119.overflow_menu
    }, l_v3_4));
end;
v3.encode = function(v120) --[[ Line: 1082 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v121 = buffer.create(0);
    local v122 = 0;
    if v120.info_table ~= nil then
        local v123 = v120.info_table:encode();
        local v124, v125 = v0.writeTag(v121, v122, 1, v0.wireTypes.lengthDelimited);
        v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
        v121 = v124;
        v122 = v125;
    end;
    if v120.action_module ~= nil then
        local v126 = v120.action_module:encode();
        local v127, v128 = v0.writeTag(v121, v122, 2, v0.wireTypes.lengthDelimited);
        v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
        v121 = v127;
        v122 = v128;
    end;
    if v120.overflow_menu ~= nil then
        local v129 = v120.overflow_menu:encode();
        local v130, v131 = v0.writeTag(v121, v122, 3, v0.wireTypes.lengthDelimited);
        v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
        v121 = v130;
        v122 = v131;
    end;
    local v132 = buffer.create(v122);
    buffer.copy(v132, 0, v121, 0, v122);
    return v132;
end;
v3.decode = function(v133) --[[ Line: 1109 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_4 (copy), v0 (copy), v2 (copy)
    local v134 = l_v3_4.new();
    local v135 = 0;
    while v135 < buffer.len(v133) do
        local v136 = nil;
        local v137 = nil;
        local v138, v139, v140 = v0.readTag(v133, v135);
        v136 = v138;
        v137 = v139;
        v135 = v140;
        if v137 == v0.wireTypes.varint then
            v138 = nil;
            v139, v140 = v0.readVarInt(v133, v135);
            v138 = v139;
            v135 = v140;
        elseif v137 == v0.wireTypes.lengthDelimited then
            if v136 == 1 then
                v138 = nil;
                v139, v140 = v0.readBuffer(v133, v135);
                v138 = v139;
                v135 = v140;
                v134.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(v138);
            elseif v136 == 2 then
                v138 = nil;
                v139, v140 = v0.readBuffer(v133, v135);
                v138 = v139;
                v135 = v140;
                v134.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(v138);
            elseif v136 == 3 then
                v138 = nil;
                v139, v140 = v0.readBuffer(v133, v135);
                v138 = v139;
                v135 = v140;
                v134.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(v138);
            else
                v138 = nil;
                v139, v140 = v0.readVarInt(v133, v135);
                v135 = v140 + v139;
            end;
        elseif v137 == v0.wireTypes.i32 then
            v138 = nil;
            v139, v140 = v0.readFixed32(v133, v135);
            v138 = v139;
            v135 = v140;
        elseif v137 == v0.wireTypes.i64 then
            v138 = nil;
            v139, v140 = v0.readFixed64(v133, v135);
            v138 = v139;
            v135 = v140;
        else
            error("Unsupported wire type: " .. v137);
        end;
    end;
    return v134;
end;
v3.jsonEncode = function(v141) --[[ Line: 1162 ]] --[[ Name: jsonEncode ]]
    local v142 = {};
    if v141.info_table ~= nil then
        v142.infoTable = v141.info_table:jsonEncode();
    end;
    if v141.action_module ~= nil then
        v142.actionModule = v141.action_module:jsonEncode();
    end;
    if v141.overflow_menu ~= nil then
        v142.overflowMenu = v141.overflow_menu:jsonEncode();
    end;
    return v142;
end;
v3.jsonDecode = function(v143) --[[ Line: 1180 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_4 (copy), v2 (copy)
    local v144 = l_v3_4.new();
    if v143.info_table ~= nil then
        v144.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v143.info_table);
    end;
    if v143.infoTable ~= nil then
        v144.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v143.infoTable);
    end;
    if v143.action_module ~= nil then
        v144.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v143.action_module);
    end;
    if v143.actionModule ~= nil then
        v144.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v143.actionModule);
    end;
    if v143.overflow_menu ~= nil then
        v144.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v143.overflow_menu);
    end;
    if v143.overflowMenu ~= nil then
        v144.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v143.overflowMenu);
    end;
    return v144;
end;
v3.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
};
v2.BadgeDetailsInputData_LocalizedLiterals = v3;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals);
v3 = {};
v3.__index = v3;
local l_v3_5 = v3 --[[ copy: 3 -> 9 ]];
v3.new = function(v146) --[[ Line: 1231 ]] --[[ Name: new ]]
    -- upvalues: l_v3_5 (copy)
    return (setmetatable({
        type_label = (not (v146 ~= nil) or v146.type_label == nil) and "" or v146.type_label, 
        earned_label = (not (v146 ~= nil) or v146.earned_label == nil) and "" or v146.earned_label, 
        updated_label = (not (v146 ~= nil) or v146.updated_label == nil) and "" or v146.updated_label, 
        experience_label = (not (v146 ~= nil) or v146.experience_label == nil) and "" or v146.experience_label, 
        rarity_label = (not (v146 ~= nil) or v146.rarity_label == nil) and "" or v146.rarity_label, 
        won_yesterday_label = (not (v146 ~= nil) or v146.won_yesterday_label == nil) and "" or v146.won_yesterday_label, 
        won_ever_label = (not (v146 ~= nil) or v146.won_ever_label == nil) and "" or v146.won_ever_label
    }, l_v3_5));
end;
v3.encode = function(v147) --[[ Line: 1250 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v148 = buffer.create(0);
    local v149 = 0;
    if v147.type_label ~= nil and v147.type_label ~= "" then
        local v150, v151 = v0.writeTag(v148, v149, 1, v0.wireTypes.lengthDelimited);
        v150, v151 = v0.writeString(v150, v151, v147.type_label);
        v148 = v150;
        v149 = v151;
    end;
    if v147.earned_label ~= nil and v147.earned_label ~= "" then
        local v152, v153 = v0.writeTag(v148, v149, 2, v0.wireTypes.lengthDelimited);
        v152, v153 = v0.writeString(v152, v153, v147.earned_label);
        v148 = v152;
        v149 = v153;
    end;
    if v147.updated_label ~= nil and v147.updated_label ~= "" then
        local v154, v155 = v0.writeTag(v148, v149, 3, v0.wireTypes.lengthDelimited);
        v154, v155 = v0.writeString(v154, v155, v147.updated_label);
        v148 = v154;
        v149 = v155;
    end;
    if v147.experience_label ~= nil and v147.experience_label ~= "" then
        local v156, v157 = v0.writeTag(v148, v149, 4, v0.wireTypes.lengthDelimited);
        v156, v157 = v0.writeString(v156, v157, v147.experience_label);
        v148 = v156;
        v149 = v157;
    end;
    if v147.rarity_label ~= nil and v147.rarity_label ~= "" then
        local v158, v159 = v0.writeTag(v148, v149, 5, v0.wireTypes.lengthDelimited);
        v158, v159 = v0.writeString(v158, v159, v147.rarity_label);
        v148 = v158;
        v149 = v159;
    end;
    if v147.won_yesterday_label ~= nil and v147.won_yesterday_label ~= "" then
        local v160, v161 = v0.writeTag(v148, v149, 6, v0.wireTypes.lengthDelimited);
        v160, v161 = v0.writeString(v160, v161, v147.won_yesterday_label);
        v148 = v160;
        v149 = v161;
    end;
    if v147.won_ever_label ~= nil and v147.won_ever_label ~= "" then
        local v162, v163 = v0.writeTag(v148, v149, 7, v0.wireTypes.lengthDelimited);
        v162, v163 = v0.writeString(v162, v163, v147.won_ever_label);
        v148 = v162;
        v149 = v163;
    end;
    local v164 = buffer.create(v149);
    buffer.copy(v164, 0, v148, 0, v149);
    return v164;
end;
v3.decode = function(v165) --[[ Line: 1296 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_5 (copy), v0 (copy)
    local v166 = l_v3_5.new();
    local v167 = 0;
    while v167 < buffer.len(v165) do
        local v168 = nil;
        local v169 = nil;
        local v170, v171, v172 = v0.readTag(v165, v167);
        v168 = v170;
        v169 = v171;
        v167 = v172;
        if v169 == v0.wireTypes.varint then
            v170 = nil;
            v171, v172 = v0.readVarInt(v165, v167);
            v170 = v171;
            v167 = v172;
        elseif v169 == v0.wireTypes.lengthDelimited then
            if v168 == 1 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.type_label = buffer.tostring(v170);
            elseif v168 == 2 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.earned_label = buffer.tostring(v170);
            elseif v168 == 3 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.updated_label = buffer.tostring(v170);
            elseif v168 == 4 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.experience_label = buffer.tostring(v170);
            elseif v168 == 5 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.rarity_label = buffer.tostring(v170);
            elseif v168 == 6 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.won_yesterday_label = buffer.tostring(v170);
            elseif v168 == 7 then
                v170 = nil;
                v171, v172 = v0.readBuffer(v165, v167);
                v170 = v171;
                v167 = v172;
                v166.won_ever_label = buffer.tostring(v170);
            else
                v170 = nil;
                v171, v172 = v0.readVarInt(v165, v167);
                v167 = v172 + v171;
            end;
        elseif v169 == v0.wireTypes.i32 then
            v170 = nil;
            v171, v172 = v0.readFixed32(v165, v167);
            v170 = v171;
            v167 = v172;
        elseif v169 == v0.wireTypes.i64 then
            v170 = nil;
            v171, v172 = v0.readFixed64(v165, v167);
            v170 = v171;
            v167 = v172;
        else
            error("Unsupported wire type: " .. v169);
        end;
    end;
    return v166;
end;
v3.jsonEncode = function(v173) --[[ Line: 1371 ]] --[[ Name: jsonEncode ]]
    local v174 = {};
    if v173.type_label ~= nil and v173.type_label ~= "" then
        v174.typeLabel = v173.type_label;
    end;
    if v173.earned_label ~= nil and v173.earned_label ~= "" then
        v174.earnedLabel = v173.earned_label;
    end;
    if v173.updated_label ~= nil and v173.updated_label ~= "" then
        v174.updatedLabel = v173.updated_label;
    end;
    if v173.experience_label ~= nil and v173.experience_label ~= "" then
        v174.experienceLabel = v173.experience_label;
    end;
    if v173.rarity_label ~= nil and v173.rarity_label ~= "" then
        v174.rarityLabel = v173.rarity_label;
    end;
    if v173.won_yesterday_label ~= nil and v173.won_yesterday_label ~= "" then
        v174.wonYesterdayLabel = v173.won_yesterday_label;
    end;
    if v173.won_ever_label ~= nil and v173.won_ever_label ~= "" then
        v174.wonEverLabel = v173.won_ever_label;
    end;
    return v174;
end;
v3.jsonDecode = function(v175) --[[ Line: 1407 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_5 (copy)
    local v176 = l_v3_5.new();
    if v175.type_label ~= nil then
        v176.type_label = v175.type_label;
    end;
    if v175.typeLabel ~= nil then
        v176.type_label = v175.typeLabel;
    end;
    if v175.earned_label ~= nil then
        v176.earned_label = v175.earned_label;
    end;
    if v175.earnedLabel ~= nil then
        v176.earned_label = v175.earnedLabel;
    end;
    if v175.updated_label ~= nil then
        v176.updated_label = v175.updated_label;
    end;
    if v175.updatedLabel ~= nil then
        v176.updated_label = v175.updatedLabel;
    end;
    if v175.experience_label ~= nil then
        v176.experience_label = v175.experience_label;
    end;
    if v175.experienceLabel ~= nil then
        v176.experience_label = v175.experienceLabel;
    end;
    if v175.rarity_label ~= nil then
        v176.rarity_label = v175.rarity_label;
    end;
    if v175.rarityLabel ~= nil then
        v176.rarity_label = v175.rarityLabel;
    end;
    if v175.won_yesterday_label ~= nil then
        v176.won_yesterday_label = v175.won_yesterday_label;
    end;
    if v175.wonYesterdayLabel ~= nil then
        v176.won_yesterday_label = v175.wonYesterdayLabel;
    end;
    if v175.won_ever_label ~= nil then
        v176.won_ever_label = v175.won_ever_label;
    end;
    if v175.wonEverLabel ~= nil then
        v176.won_ever_label = v175.wonEverLabel;
    end;
    return v176;
end;
v3.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
};
v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable = v3;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable);
v3 = {};
v3.__index = v3;
local l_v3_6 = v3 --[[ copy: 3 -> 10 ]];
v3.new = function(v178) --[[ Line: 1487 ]] --[[ Name: new ]]
    -- upvalues: l_v3_6 (copy)
    return (setmetatable({
        share = (not (v178 ~= nil) or v178.share == nil) and "" or v178.share, 
        report = (not (v178 ~= nil) or v178.report == nil) and "" or v178.report
    }, l_v3_6));
end;
v3.encode = function(v179) --[[ Line: 1499 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v180 = buffer.create(0);
    local v181 = 0;
    if v179.share ~= nil and v179.share ~= "" then
        local v182, v183 = v0.writeTag(v180, v181, 1, v0.wireTypes.lengthDelimited);
        v182, v183 = v0.writeString(v182, v183, v179.share);
        v180 = v182;
        v181 = v183;
    end;
    if v179.report ~= nil and v179.report ~= "" then
        local v184, v185 = v0.writeTag(v180, v181, 2, v0.wireTypes.lengthDelimited);
        v184, v185 = v0.writeString(v184, v185, v179.report);
        v180 = v184;
        v181 = v185;
    end;
    local v186 = buffer.create(v181);
    buffer.copy(v186, 0, v180, 0, v181);
    return v186;
end;
v3.decode = function(v187) --[[ Line: 1520 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_6 (copy), v0 (copy)
    local v188 = l_v3_6.new();
    local v189 = 0;
    while v189 < buffer.len(v187) do
        local v190 = nil;
        local v191 = nil;
        local v192, v193, v194 = v0.readTag(v187, v189);
        v190 = v192;
        v191 = v193;
        v189 = v194;
        if v191 == v0.wireTypes.varint then
            v192 = nil;
            v193, v194 = v0.readVarInt(v187, v189);
            v192 = v193;
            v189 = v194;
        elseif v191 == v0.wireTypes.lengthDelimited then
            if v190 == 1 then
                v192 = nil;
                v193, v194 = v0.readBuffer(v187, v189);
                v192 = v193;
                v189 = v194;
                v188.share = buffer.tostring(v192);
            elseif v190 == 2 then
                v192 = nil;
                v193, v194 = v0.readBuffer(v187, v189);
                v192 = v193;
                v189 = v194;
                v188.report = buffer.tostring(v192);
            else
                v192 = nil;
                v193, v194 = v0.readVarInt(v187, v189);
                v189 = v194 + v193;
            end;
        elseif v191 == v0.wireTypes.i32 then
            v192 = nil;
            v193, v194 = v0.readFixed32(v187, v189);
            v192 = v193;
            v189 = v194;
        elseif v191 == v0.wireTypes.i64 then
            v192 = nil;
            v193, v194 = v0.readFixed64(v187, v189);
            v192 = v193;
            v189 = v194;
        else
            error("Unsupported wire type: " .. v191);
        end;
    end;
    return v188;
end;
v3.jsonEncode = function(v195) --[[ Line: 1570 ]] --[[ Name: jsonEncode ]]
    local v196 = {};
    if v195.share ~= nil and v195.share ~= "" then
        v196.share = v195.share;
    end;
    if v195.report ~= nil and v195.report ~= "" then
        v196.report = v195.report;
    end;
    return v196;
end;
v3.jsonDecode = function(v197) --[[ Line: 1586 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_6 (copy)
    local v198 = l_v3_6.new();
    if v197.share ~= nil then
        v198.share = v197.share;
    end;
    if v197.report ~= nil then
        v198.report = v197.report;
    end;
    return v198;
end;
v3.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
};
v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule = v3;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule);
v3 = {};
v3.__index = v3;
local l_v3_7 = v3 --[[ copy: 3 -> 11 ]];
v3.new = function(v200) --[[ Line: 1618 ]] --[[ Name: new ]]
    -- upvalues: l_v3_7 (copy)
    return (setmetatable({
        report = (not (v200 ~= nil) or v200.report == nil) and "" or v200.report, 
        remove = (not (v200 ~= nil) or v200.remove == nil) and "" or v200.remove
    }, l_v3_7));
end;
v3.encode = function(v201) --[[ Line: 1630 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v202 = buffer.create(0);
    local v203 = 0;
    if v201.report ~= nil and v201.report ~= "" then
        local v204, v205 = v0.writeTag(v202, v203, 1, v0.wireTypes.lengthDelimited);
        v204, v205 = v0.writeString(v204, v205, v201.report);
        v202 = v204;
        v203 = v205;
    end;
    if v201.remove ~= nil and v201.remove ~= "" then
        local v206, v207 = v0.writeTag(v202, v203, 2, v0.wireTypes.lengthDelimited);
        v206, v207 = v0.writeString(v206, v207, v201.remove);
        v202 = v206;
        v203 = v207;
    end;
    local v208 = buffer.create(v203);
    buffer.copy(v208, 0, v202, 0, v203);
    return v208;
end;
v3.decode = function(v209) --[[ Line: 1651 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_7 (copy), v0 (copy)
    local v210 = l_v3_7.new();
    local v211 = 0;
    while v211 < buffer.len(v209) do
        local v212 = nil;
        local v213 = nil;
        local v214, v215, v216 = v0.readTag(v209, v211);
        v212 = v214;
        v213 = v215;
        v211 = v216;
        if v213 == v0.wireTypes.varint then
            v214 = nil;
            v215, v216 = v0.readVarInt(v209, v211);
            v214 = v215;
            v211 = v216;
        elseif v213 == v0.wireTypes.lengthDelimited then
            if v212 == 1 then
                v214 = nil;
                v215, v216 = v0.readBuffer(v209, v211);
                v214 = v215;
                v211 = v216;
                v210.report = buffer.tostring(v214);
            elseif v212 == 2 then
                v214 = nil;
                v215, v216 = v0.readBuffer(v209, v211);
                v214 = v215;
                v211 = v216;
                v210.remove = buffer.tostring(v214);
            else
                v214 = nil;
                v215, v216 = v0.readVarInt(v209, v211);
                v211 = v216 + v215;
            end;
        elseif v213 == v0.wireTypes.i32 then
            v214 = nil;
            v215, v216 = v0.readFixed32(v209, v211);
            v214 = v215;
            v211 = v216;
        elseif v213 == v0.wireTypes.i64 then
            v214 = nil;
            v215, v216 = v0.readFixed64(v209, v211);
            v214 = v215;
            v211 = v216;
        else
            error("Unsupported wire type: " .. v213);
        end;
    end;
    return v210;
end;
v3.jsonEncode = function(v217) --[[ Line: 1701 ]] --[[ Name: jsonEncode ]]
    local v218 = {};
    if v217.report ~= nil and v217.report ~= "" then
        v218.report = v217.report;
    end;
    if v217.remove ~= nil and v217.remove ~= "" then
        v218.remove = v217.remove;
    end;
    return v218;
end;
v3.jsonDecode = function(v219) --[[ Line: 1717 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_7 (copy)
    local v220 = l_v3_7.new();
    if v219.report ~= nil then
        v220.report = v219.report;
    end;
    if v219.remove ~= nil then
        v220.remove = v219.remove;
    end;
    return v220;
end;
v3.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
};
v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = v3;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu);
v3 = {};
v3.__index = v3;
local l_v3_8 = v3 --[[ copy: 3 -> 12 ]];
v3.new = function(_) --[[ Line: 1748 ]] --[[ Name: new ]]
    -- upvalues: l_v3_8 (copy)
    return (setmetatable({}, l_v3_8));
end;
v3.encode = function(_) --[[ Line: 1752 ]] --[[ Name: encode ]]
    local v224 = buffer.create(0);
    local v225 = buffer.create(0);
    buffer.copy(v225, 0, v224, 0, 0);
    return v225;
end;
v3.decode = function(v226) --[[ Line: 1761 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_8 (copy), v0 (copy)
    local v227 = l_v3_8.new();
    local v228 = 0;
    while v228 < buffer.len(v226) do
        local v229 = nil;
        local v230 = nil;
        local v231, v232, v233 = v0.readTag(v226, v228);
        v229 = v231;
        v230 = v232;
        v228 = v233;
        if v230 == v0.wireTypes.varint then
            v231 = nil;
            v232, v233 = v0.readVarInt(v226, v228);
            v231 = v232;
            v228 = v233;
        elseif v230 == v0.wireTypes.lengthDelimited then
            v231 = nil;
            v232, v233 = v0.readVarInt(v226, v228);
            v228 = v233 + v232;
        elseif v230 == v0.wireTypes.i32 then
            v231 = nil;
            v232, v233 = v0.readFixed32(v226, v228);
            v231 = v232;
            v228 = v233;
        elseif v230 == v0.wireTypes.i64 then
            v231 = nil;
            v232, v233 = v0.readFixed64(v226, v228);
            v231 = v232;
            v228 = v233;
        else
            error("Unsupported wire type: " .. v230);
        end;
    end;
    return v227;
end;
v3.jsonEncode = function(_) --[[ Line: 1799 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v3.jsonDecode = function(_) --[[ Line: 1805 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_8 (copy)
    return (l_v3_8.new());
end;
v3.descriptor = {
    name = "StaticInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
};
v2.StaticInputData = v3;
v1.default:register(v2.StaticInputData);
v3 = {};
v3.__index = v3;
local l_v3_9 = v3 --[[ copy: 3 -> 13 ]];
v3.new = function(v237) --[[ Line: 1825 ]] --[[ Name: new ]]
    -- upvalues: l_v3_9 (copy)
    return (setmetatable({
        kind = if not (v237 ~= nil) or v237.kind == nil then nil else v237.kind
    }, l_v3_9));
end;
v3.encode = function(v238) --[[ Line: 1831 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v239 = buffer.create(0);
    local v240 = 0;
    if v238.kind ~= nil then
        if v238.kind.type == "card_container" then
            local v241 = v238.kind.value:encode();
            local v242, v243 = v0.writeTag(v239, v240, 1, v0.wireTypes.lengthDelimited);
            v242, v243 = v0.writeBuffer(v242, v243, v241, buffer.len(v241));
            v239 = v242;
            v240 = v243;
        elseif v238.kind.type == "card" then
            local v244 = v238.kind.value:encode();
            local v245, v246 = v0.writeTag(v239, v240, 2, v0.wireTypes.lengthDelimited);
            v245, v246 = v0.writeBuffer(v245, v246, v244, buffer.len(v244));
            v239 = v245;
            v240 = v246;
        end;
    end;
    local v247 = buffer.create(v240);
    buffer.copy(v247, 0, v239, 0, v240);
    return v247;
end;
v3.decode = function(v248) --[[ Line: 1852 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_9 (copy), v0 (copy), v2 (copy)
    local v249 = l_v3_9.new();
    local v250 = 0;
    while v250 < buffer.len(v248) do
        local v251 = nil;
        local v252 = nil;
        local v253, v254, v255 = v0.readTag(v248, v250);
        v251 = v253;
        v252 = v254;
        v250 = v255;
        if v252 == v0.wireTypes.varint then
            v253 = nil;
            v254, v255 = v0.readVarInt(v248, v250);
            v253 = v254;
            v250 = v255;
        elseif v252 == v0.wireTypes.lengthDelimited then
            if v251 == 1 then
                v253 = nil;
                v254, v255 = v0.readBuffer(v248, v250);
                v253 = v254;
                v250 = v255;
                v249.kind = {
                    type = "card_container", 
                    value = v2.PromptsInputData_CardContainerInputData.decode(v253)
                };
            elseif v251 == 2 then
                v253 = nil;
                v254, v255 = v0.readBuffer(v248, v250);
                v253 = v254;
                v250 = v255;
                v249.kind = {
                    type = "card", 
                    value = v2.PromptsInputData_CardInputData.decode(v253)
                };
            else
                v253 = nil;
                v254, v255 = v0.readVarInt(v248, v250);
                v250 = v255 + v254;
            end;
        elseif v252 == v0.wireTypes.i32 then
            v253 = nil;
            v254, v255 = v0.readFixed32(v248, v250);
            v253 = v254;
            v250 = v255;
        elseif v252 == v0.wireTypes.i64 then
            v253 = nil;
            v254, v255 = v0.readFixed64(v248, v250);
            v253 = v254;
            v250 = v255;
        else
            error("Unsupported wire type: " .. v252);
        end;
    end;
    return v249;
end;
v3.jsonEncode = function(v256) --[[ Line: 1903 ]] --[[ Name: jsonEncode ]]
    local v257 = {};
    if v256.kind ~= nil then
        if v256.kind.type == "card_container" then
            v257.cardContainer = v256.kind.value:jsonEncode();
            return v257;
        elseif v256.kind.type == "card" then
            v257.card = v256.kind.value:jsonEncode();
        end;
    end;
    return v257;
end;
v3.jsonDecode = function(v258) --[[ Line: 1917 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_9 (copy), v2 (copy)
    local v259 = l_v3_9.new();
    if v258.card_container ~= nil then
        v259.kind = {
            type = "card_container", 
            value = v2.PromptsInputData_CardContainerInputData.jsonDecode(v258.card_container)
        };
    end;
    if v258.cardContainer ~= nil then
        v259.kind = {
            type = "card_container", 
            value = v2.PromptsInputData_CardContainerInputData.jsonDecode(v258.cardContainer)
        };
    end;
    if v258.card ~= nil then
        v259.kind = {
            type = "card", 
            value = v2.PromptsInputData_CardInputData.jsonDecode(v258.card)
        };
    end;
    return v259;
end;
v3.descriptor = {
    name = "PromptsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PromptsInputData"
};
v2.PromptsInputData = v3;
v1.default:register(v2.PromptsInputData);
v3 = {};
v3.__index = v3;
local l_v3_10 = v3 --[[ copy: 3 -> 14 ]];
v3.new = function(v261) --[[ Line: 1955 ]] --[[ Name: new ]]
    -- upvalues: l_v3_10 (copy)
    return (setmetatable({
        roblox_component = (not (v261 ~= nil) or v261.roblox_component == nil) and "" or v261.roblox_component, 
        identifier = (not (v261 ~= nil) or v261.identifier == nil) and "" or v261.identifier, 
        title = (not (v261 ~= nil) or v261.title == nil) and "" or v261.title, 
        user_id = (not (v261 ~= nil) or v261.user_id == nil) and "" or v261.user_id, 
        description = (not (v261 ~= nil) or v261.description == nil) and "" or v261.description, 
        cta_text = (not (v261 ~= nil) or v261.cta_text == nil) and "" or v261.cta_text
    }, l_v3_10));
end;
v3.encode = function(v262) --[[ Line: 1968 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v263 = buffer.create(0);
    local v264 = 0;
    if v262.roblox_component ~= nil and v262.roblox_component ~= "" then
        local v265, v266 = v0.writeTag(v263, v264, 1, v0.wireTypes.lengthDelimited);
        v265, v266 = v0.writeString(v265, v266, v262.roblox_component);
        v263 = v265;
        v264 = v266;
    end;
    if v262.identifier ~= nil and v262.identifier ~= "" then
        local v267, v268 = v0.writeTag(v263, v264, 2, v0.wireTypes.lengthDelimited);
        v267, v268 = v0.writeString(v267, v268, v262.identifier);
        v263 = v267;
        v264 = v268;
    end;
    if v262.title ~= nil and v262.title ~= "" then
        local v269, v270 = v0.writeTag(v263, v264, 3, v0.wireTypes.lengthDelimited);
        v269, v270 = v0.writeString(v269, v270, v262.title);
        v263 = v269;
        v264 = v270;
    end;
    if v262.user_id ~= nil and v262.user_id ~= "" then
        local v271, v272 = v0.writeTag(v263, v264, 4, v0.wireTypes.lengthDelimited);
        v271, v272 = v0.writeString(v271, v272, v262.user_id);
        v263 = v271;
        v264 = v272;
    end;
    if v262.description ~= nil and v262.description ~= "" then
        local v273, v274 = v0.writeTag(v263, v264, 5, v0.wireTypes.lengthDelimited);
        v273, v274 = v0.writeString(v273, v274, v262.description);
        v263 = v273;
        v264 = v274;
    end;
    if v262.cta_text ~= nil and v262.cta_text ~= "" then
        local v275, v276 = v0.writeTag(v263, v264, 6, v0.wireTypes.lengthDelimited);
        v275, v276 = v0.writeString(v275, v276, v262.cta_text);
        v263 = v275;
        v264 = v276;
    end;
    local v277 = buffer.create(v264);
    buffer.copy(v277, 0, v263, 0, v264);
    return v277;
end;
v3.decode = function(v278) --[[ Line: 2009 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_10 (copy), v0 (copy)
    local v279 = l_v3_10.new();
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
                v279.roblox_component = buffer.tostring(v283);
            elseif v281 == 2 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.identifier = buffer.tostring(v283);
            elseif v281 == 3 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.title = buffer.tostring(v283);
            elseif v281 == 4 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.user_id = buffer.tostring(v283);
            elseif v281 == 5 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.description = buffer.tostring(v283);
            elseif v281 == 6 then
                v283 = nil;
                v284, v285 = v0.readBuffer(v278, v280);
                v283 = v284;
                v280 = v285;
                v279.cta_text = buffer.tostring(v283);
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
v3.jsonEncode = function(v286) --[[ Line: 2079 ]] --[[ Name: jsonEncode ]]
    local v287 = {};
    if v286.roblox_component ~= nil and v286.roblox_component ~= "" then
        v287.robloxComponent = v286.roblox_component;
    end;
    if v286.identifier ~= nil and v286.identifier ~= "" then
        v287.identifier = v286.identifier;
    end;
    if v286.title ~= nil and v286.title ~= "" then
        v287.title = v286.title;
    end;
    if v286.user_id ~= nil and v286.user_id ~= "" then
        v287.userId = v286.user_id;
    end;
    if v286.description ~= nil and v286.description ~= "" then
        v287.description = v286.description;
    end;
    if v286.cta_text ~= nil and v286.cta_text ~= "" then
        v287.ctaText = v286.cta_text;
    end;
    return v287;
end;
v3.jsonDecode = function(v288) --[[ Line: 2111 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_10 (copy)
    local v289 = l_v3_10.new();
    if v288.roblox_component ~= nil then
        v289.roblox_component = v288.roblox_component;
    end;
    if v288.robloxComponent ~= nil then
        v289.roblox_component = v288.robloxComponent;
    end;
    if v288.identifier ~= nil then
        v289.identifier = v288.identifier;
    end;
    if v288.title ~= nil then
        v289.title = v288.title;
    end;
    if v288.user_id ~= nil then
        v289.user_id = v288.user_id;
    end;
    if v288.userId ~= nil then
        v289.user_id = v288.userId;
    end;
    if v288.description ~= nil then
        v289.description = v288.description;
    end;
    if v288.cta_text ~= nil then
        v289.cta_text = v288.cta_text;
    end;
    if v288.ctaText ~= nil then
        v289.cta_text = v288.ctaText;
    end;
    return v289;
end;
v3.descriptor = {
    name = "PromptsInputData_CardContainerCardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
};
v2.PromptsInputData_CardContainerCardInputData = v3;
v1.default:register(v2.PromptsInputData_CardContainerCardInputData);
v3 = {};
v3.__index = v3;
local l_v3_11 = v3 --[[ copy: 3 -> 15 ]];
v3.new = function(v291) --[[ Line: 2169 ]] --[[ Name: new ]]
    -- upvalues: l_v3_11 (copy)
    return (setmetatable({
        title = (not (v291 ~= nil) or v291.title == nil) and "" or v291.title, 
        user_id = (not (v291 ~= nil) or v291.user_id == nil) and "" or v291.user_id, 
        description = (not (v291 ~= nil) or v291.description == nil) and "" or v291.description, 
        cta_text = (not (v291 ~= nil) or v291.cta_text == nil) and "" or v291.cta_text
    }, l_v3_11));
end;
v3.encode = function(v292) --[[ Line: 2180 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v293 = buffer.create(0);
    local v294 = 0;
    if v292.title ~= nil and v292.title ~= "" then
        local v295, v296 = v0.writeTag(v293, v294, 1, v0.wireTypes.lengthDelimited);
        v295, v296 = v0.writeString(v295, v296, v292.title);
        v293 = v295;
        v294 = v296;
    end;
    if v292.user_id ~= nil and v292.user_id ~= "" then
        local v297, v298 = v0.writeTag(v293, v294, 2, v0.wireTypes.lengthDelimited);
        v297, v298 = v0.writeString(v297, v298, v292.user_id);
        v293 = v297;
        v294 = v298;
    end;
    if v292.description ~= nil and v292.description ~= "" then
        local v299, v300 = v0.writeTag(v293, v294, 3, v0.wireTypes.lengthDelimited);
        v299, v300 = v0.writeString(v299, v300, v292.description);
        v293 = v299;
        v294 = v300;
    end;
    if v292.cta_text ~= nil and v292.cta_text ~= "" then
        local v301, v302 = v0.writeTag(v293, v294, 4, v0.wireTypes.lengthDelimited);
        v301, v302 = v0.writeString(v301, v302, v292.cta_text);
        v293 = v301;
        v294 = v302;
    end;
    local v303 = buffer.create(v294);
    buffer.copy(v303, 0, v293, 0, v294);
    return v303;
end;
v3.decode = function(v304) --[[ Line: 2209 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_11 (copy), v0 (copy)
    local v305 = l_v3_11.new();
    local v306 = 0;
    while v306 < buffer.len(v304) do
        local v307 = nil;
        local v308 = nil;
        local v309, v310, v311 = v0.readTag(v304, v306);
        v307 = v309;
        v308 = v310;
        v306 = v311;
        if v308 == v0.wireTypes.varint then
            v309 = nil;
            v310, v311 = v0.readVarInt(v304, v306);
            v309 = v310;
            v306 = v311;
        elseif v308 == v0.wireTypes.lengthDelimited then
            if v307 == 1 then
                v309 = nil;
                v310, v311 = v0.readBuffer(v304, v306);
                v309 = v310;
                v306 = v311;
                v305.title = buffer.tostring(v309);
            elseif v307 == 2 then
                v309 = nil;
                v310, v311 = v0.readBuffer(v304, v306);
                v309 = v310;
                v306 = v311;
                v305.user_id = buffer.tostring(v309);
            elseif v307 == 3 then
                v309 = nil;
                v310, v311 = v0.readBuffer(v304, v306);
                v309 = v310;
                v306 = v311;
                v305.description = buffer.tostring(v309);
            elseif v307 == 4 then
                v309 = nil;
                v310, v311 = v0.readBuffer(v304, v306);
                v309 = v310;
                v306 = v311;
                v305.cta_text = buffer.tostring(v309);
            else
                v309 = nil;
                v310, v311 = v0.readVarInt(v304, v306);
                v306 = v311 + v310;
            end;
        elseif v308 == v0.wireTypes.i32 then
            v309 = nil;
            v310, v311 = v0.readFixed32(v304, v306);
            v309 = v310;
            v306 = v311;
        elseif v308 == v0.wireTypes.i64 then
            v309 = nil;
            v310, v311 = v0.readFixed64(v304, v306);
            v309 = v310;
            v306 = v311;
        else
            error("Unsupported wire type: " .. v308);
        end;
    end;
    return v305;
end;
v3.jsonEncode = function(v312) --[[ Line: 2267 ]] --[[ Name: jsonEncode ]]
    local v313 = {};
    if v312.title ~= nil and v312.title ~= "" then
        v313.title = v312.title;
    end;
    if v312.user_id ~= nil and v312.user_id ~= "" then
        v313.userId = v312.user_id;
    end;
    if v312.description ~= nil and v312.description ~= "" then
        v313.description = v312.description;
    end;
    if v312.cta_text ~= nil and v312.cta_text ~= "" then
        v313.ctaText = v312.cta_text;
    end;
    return v313;
end;
v3.jsonDecode = function(v314) --[[ Line: 2289 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_11 (copy)
    local v315 = l_v3_11.new();
    if v314.title ~= nil then
        v315.title = v314.title;
    end;
    if v314.user_id ~= nil then
        v315.user_id = v314.user_id;
    end;
    if v314.userId ~= nil then
        v315.user_id = v314.userId;
    end;
    if v314.description ~= nil then
        v315.description = v314.description;
    end;
    if v314.cta_text ~= nil then
        v315.cta_text = v314.cta_text;
    end;
    if v314.ctaText ~= nil then
        v315.cta_text = v314.ctaText;
    end;
    return v315;
end;
v3.descriptor = {
    name = "PromptsInputData_CardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
};
v2.PromptsInputData_CardInputData = v3;
v1.default:register(v2.PromptsInputData_CardInputData);
v3 = {};
v3.__index = v3;
v3.new = function(v316) --[[ Line: 2333 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        title = (not (v316 ~= nil) or v316.title == nil) and "" or v316.title, 
        dismiss_text = (not (v316 ~= nil) or v316.dismiss_text == nil) and "" or v316.dismiss_text, 
        user_id = (not (v316 ~= nil) or v316.user_id == nil) and "" or v316.user_id, 
        cards = if not (v316 ~= nil) or v316.cards == nil then {} else v316.cards
    }, v3));
end;
v3.encode = function(v317) --[[ Line: 2344 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v318 = buffer.create(0);
    local v319 = 0;
    if v317.title ~= nil and v317.title ~= "" then
        local v320, v321 = v0.writeTag(v318, v319, 1, v0.wireTypes.lengthDelimited);
        v320, v321 = v0.writeString(v320, v321, v317.title);
        v318 = v320;
        v319 = v321;
    end;
    if v317.dismiss_text ~= nil and v317.dismiss_text ~= "" then
        local v322, v323 = v0.writeTag(v318, v319, 2, v0.wireTypes.lengthDelimited);
        v322, v323 = v0.writeString(v322, v323, v317.dismiss_text);
        v318 = v322;
        v319 = v323;
    end;
    if v317.user_id ~= nil and v317.user_id ~= "" then
        local v324, v325 = v0.writeTag(v318, v319, 3, v0.wireTypes.lengthDelimited);
        v324, v325 = v0.writeString(v324, v325, v317.user_id);
        v318 = v324;
        v319 = v325;
    end;
    if v317.cards ~= nil and #v317.cards > 0 then
        for _, v327 in v317.cards do
            local v328 = v327:encode();
            local v329, v330 = v0.writeTag(v318, v319, 4, v0.wireTypes.lengthDelimited);
            v329, v330 = v0.writeBuffer(v329, v330, v328, buffer.len(v328));
            v318 = v329;
            v319 = v330;
        end;
    end;
    local v331 = buffer.create(v319);
    buffer.copy(v331, 0, v318, 0, v319);
    return v331;
end;
v3.decode = function(v332) --[[ Line: 2376 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    local v333 = v3.new();
    local v334 = 0;
    while v334 < buffer.len(v332) do
        local v335 = nil;
        local v336 = nil;
        local v337, v338, v339 = v0.readTag(v332, v334);
        v335 = v337;
        v336 = v338;
        v334 = v339;
        if v336 == v0.wireTypes.varint then
            v337 = nil;
            v338, v339 = v0.readVarInt(v332, v334);
            v337 = v338;
            v334 = v339;
        elseif v336 == v0.wireTypes.lengthDelimited then
            if v335 == 1 then
                v337 = nil;
                v338, v339 = v0.readBuffer(v332, v334);
                v337 = v338;
                v334 = v339;
                v333.title = buffer.tostring(v337);
            elseif v335 == 2 then
                v337 = nil;
                v338, v339 = v0.readBuffer(v332, v334);
                v337 = v338;
                v334 = v339;
                v333.dismiss_text = buffer.tostring(v337);
            elseif v335 == 3 then
                v337 = nil;
                v338, v339 = v0.readBuffer(v332, v334);
                v337 = v338;
                v334 = v339;
                v333.user_id = buffer.tostring(v337);
            elseif v335 == 4 then
                v337 = nil;
                v338, v339 = v0.readBuffer(v332, v334);
                v337 = v338;
                v334 = v339;
                table.insert(v333.cards, v2.PromptsInputData_CardContainerCardInputData.decode(v337));
            else
                v337 = nil;
                v338, v339 = v0.readVarInt(v332, v334);
                v334 = v339 + v338;
            end;
        elseif v336 == v0.wireTypes.i32 then
            v337 = nil;
            v338, v339 = v0.readFixed32(v332, v334);
            v337 = v338;
            v334 = v339;
        elseif v336 == v0.wireTypes.i64 then
            v337 = nil;
            v338, v339 = v0.readFixed64(v332, v334);
            v337 = v338;
            v334 = v339;
        else
            error("Unsupported wire type: " .. v336);
        end;
    end;
    return v333;
end;
v3.jsonEncode = function(v340) --[[ Line: 2434 ]] --[[ Name: jsonEncode ]]
    local v341 = {};
    if v340.title ~= nil and v340.title ~= "" then
        v341.title = v340.title;
    end;
    if v340.dismiss_text ~= nil and v340.dismiss_text ~= "" then
        v341.dismissText = v340.dismiss_text;
    end;
    if v340.user_id ~= nil and v340.user_id ~= "" then
        v341.userId = v340.user_id;
    end;
    if v340.cards ~= nil and #v340.cards > 0 then
        local v342 = {};
        for _, v344 in v340.cards do
            table.insert(v342, v344:jsonEncode());
        end;
        v341.cards = v342;
    end;
    return v341;
end;
v3.jsonDecode = function(v345) --[[ Line: 2460 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v346 = v3.new();
    if v345.title ~= nil then
        v346.title = v345.title;
    end;
    if v345.dismiss_text ~= nil then
        v346.dismiss_text = v345.dismiss_text;
    end;
    if v345.dismissText ~= nil then
        v346.dismiss_text = v345.dismissText;
    end;
    if v345.user_id ~= nil then
        v346.user_id = v345.user_id;
    end;
    if v345.userId ~= nil then
        v346.user_id = v345.userId;
    end;
    if v345.cards ~= nil then
        local v347 = {};
        for _, v349 in v345.cards do
            table.insert(v347, v2.PromptsInputData_CardContainerCardInputData.jsonDecode(v349));
        end;
        v346.cards = v347;
    end;
    return v346;
end;
v3.descriptor = {
    name = "PromptsInputData_CardContainerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
};
v2.PromptsInputData_CardContainerInputData = v3;
v1.default:register(v2.PromptsInputData_CardContainerInputData);
return {
    PageEntryInputData = v2.PageEntryInputData, 
    BadgesGridInputData = v2.BadgesGridInputData, 
    BadgesGridInputData_BadgeInputData = v2.BadgesGridInputData_BadgeInputData, 
    BadgeDetailsInputData = v2.BadgeDetailsInputData, 
    BadgeDetailsInputData_LocalizedLiterals = v2.BadgeDetailsInputData_LocalizedLiterals, 
    BadgeDetailsInputData_LocalizedLiterals_InfoTable = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable, 
    BadgeDetailsInputData_LocalizedLiterals_ActionModule = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule, 
    BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu, 
    StaticInputData = v2.StaticInputData, 
    PromptsInputData = v2.PromptsInputData, 
    PromptsInputData_CardContainerCardInputData = v2.PromptsInputData_CardContainerCardInputData, 
    PromptsInputData_CardInputData = v2.PromptsInputData_CardInputData, 
    PromptsInputData_CardContainerInputData = v2.PromptsInputData_CardContainerInputData
};