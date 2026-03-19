local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
local l_v3_0 = v3 --[[ copy: 3 -> 4 ]];
v3.new = function(v5) --[[ Line: 137 ]] --[[ Name: new ]]
    -- upvalues: l_v3_0 (copy)
    return (setmetatable({
        id = (not (v5 ~= nil) or v5.id == nil) and "" or v5.id, 
        type = (not (v5 ~= nil) or v5.type == nil) and "" or v5.type
    }, l_v3_0));
end;
v3.encode = function(v6) --[[ Line: 144 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.id ~= nil and v6.id ~= "" then
        local v9, v10 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
        v9, v10 = v0.writeString(v9, v10, v6.id);
        v7 = v9;
        v8 = v10;
    end;
    if v6.type ~= nil and v6.type ~= "" then
        local v11, v12 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeString(v11, v12, v6.type);
        v7 = v11;
        v8 = v12;
    end;
    local v13 = buffer.create(v8);
    buffer.copy(v13, 0, v7, 0, v8);
    return v13;
end;
v3.decode = function(v14) --[[ Line: 163 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_0 (copy), v0 (copy)
    local v15 = l_v3_0.new();
    local v16 = 0;
    while v16 < buffer.len(v14) do
        local v17 = nil;
        local v18 = nil;
        local v19, v20, v21 = v0.readTag(v14, v16);
        v17 = v19;
        v18 = v20;
        v16 = v21;
        if v18 == v0.wireTypes.varint then
            v19 = nil;
            v20, v21 = v0.readVarInt(v14, v16);
            v19 = v20;
            v16 = v21;
        elseif v18 == v0.wireTypes.lengthDelimited then
            if v17 == 1 then
                v19 = nil;
                v20, v21 = v0.readBuffer(v14, v16);
                v19 = v20;
                v16 = v21;
                v15.id = buffer.tostring(v19);
            elseif v17 == 2 then
                v19 = nil;
                v20, v21 = v0.readBuffer(v14, v16);
                v19 = v20;
                v16 = v21;
                v15.type = buffer.tostring(v19);
            else
                v19 = nil;
                v20, v21 = v0.readVarInt(v14, v16);
                v16 = v21 + v20;
            end;
        elseif v18 == v0.wireTypes.i32 then
            v19 = nil;
            v20, v21 = v0.readFixed32(v14, v16);
            v19 = v20;
            v16 = v21;
        elseif v18 == v0.wireTypes.i64 then
            v19 = nil;
            v20, v21 = v0.readFixed64(v14, v16);
            v19 = v20;
            v16 = v21;
        else
            error("Unsupported wire type: " .. v18);
        end;
    end;
    return v15;
end;
v3.jsonEncode = function(v22) --[[ Line: 211 ]] --[[ Name: jsonEncode ]]
    local v23 = {};
    if v22.id ~= nil and v22.id ~= "" then
        v23.id = v22.id;
    end;
    if v22.type ~= nil and v22.type ~= "" then
        v23.type = v22.type;
    end;
    return v23;
end;
v3.jsonDecode = function(v24) --[[ Line: 225 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_0 (copy)
    local v25 = l_v3_0.new();
    if v24.id ~= nil then
        v25.id = v24.id;
    end;
    if v24.type ~= nil then
        v25.type = v24.type;
    end;
    return v25;
end;
v3.descriptor = {
    name = "CatalogSortContentData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContentData"
};
v2.CatalogSortContentData = v3;
v1.default:register(v2.CatalogSortContentData);
v3 = {};
v3.__index = v3;
local l_v3_1 = v3 --[[ copy: 3 -> 5 ]];
v3.new = function(v27) --[[ Line: 253 ]] --[[ Name: new ]]
    -- upvalues: l_v3_1 (copy)
    return (setmetatable({
        content_type = (not (v27 ~= nil) or v27.content_type == nil) and "" or v27.content_type
    }, l_v3_1));
end;
v3.encode = function(v28) --[[ Line: 261 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v29 = buffer.create(0);
    local v30 = 0;
    if v28.content_type ~= nil and v28.content_type ~= "" then
        local v31, v32 = v0.writeTag(v29, v30, 1, v0.wireTypes.lengthDelimited);
        v31, v32 = v0.writeString(v31, v32, v28.content_type);
        v29 = v31;
        v30 = v32;
    end;
    local v33 = buffer.create(v30);
    buffer.copy(v33, 0, v29, 0, v30);
    return v33;
end;
v3.decode = function(v34) --[[ Line: 275 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_1 (copy), v0 (copy)
    local v35 = l_v3_1.new();
    local v36 = 0;
    while v36 < buffer.len(v34) do
        local v37 = nil;
        local v38 = nil;
        local v39, v40, v41 = v0.readTag(v34, v36);
        v37 = v39;
        v38 = v40;
        v36 = v41;
        if v38 == v0.wireTypes.varint then
            v39 = nil;
            v40, v41 = v0.readVarInt(v34, v36);
            v39 = v40;
            v36 = v41;
        elseif v38 == v0.wireTypes.lengthDelimited then
            if v37 == 1 then
                v39 = nil;
                v40, v41 = v0.readBuffer(v34, v36);
                v39 = v40;
                v36 = v41;
                v35.content_type = buffer.tostring(v39);
            else
                v39 = nil;
                v40, v41 = v0.readVarInt(v34, v36);
                v36 = v41 + v40;
            end;
        elseif v38 == v0.wireTypes.i32 then
            v39 = nil;
            v40, v41 = v0.readFixed32(v34, v36);
            v39 = v40;
            v36 = v41;
        elseif v38 == v0.wireTypes.i64 then
            v39 = nil;
            v40, v41 = v0.readFixed64(v34, v36);
            v39 = v40;
            v36 = v41;
        else
            error("Unsupported wire type: " .. v38);
        end;
    end;
    return v35;
end;
v3.jsonEncode = function(v42) --[[ Line: 318 ]] --[[ Name: jsonEncode ]]
    local v43 = {};
    if v42.content_type ~= nil and v42.content_type ~= "" then
        v43.contentType = v42.content_type;
    end;
    return v43;
end;
v3.jsonDecode = function(v44) --[[ Line: 328 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_1 (copy)
    local v45 = l_v3_1.new();
    if v44.content_type ~= nil then
        v45.content_type = v44.content_type;
    end;
    if v44.contentType ~= nil then
        v45.content_type = v44.contentType;
    end;
    return v45;
end;
v3.descriptor = {
    name = "CatalogSortCardItemFooter", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardItemFooter"
};
v2.CatalogSortCardItemFooter = v3;
v1.default:register(v2.CatalogSortCardItemFooter);
v3 = {};
v3.__index = v3;
local l_v3_2 = v3 --[[ copy: 3 -> 6 ]];
v3.new = function(v47) --[[ Line: 356 ]] --[[ Name: new ]]
    -- upvalues: l_v3_2 (copy)
    return (setmetatable({
        thumbnail_aspect_ratio = (not (v47 ~= nil) or v47.thumbnail_aspect_ratio == nil) and "" or v47.thumbnail_aspect_ratio
    }, l_v3_2));
end;
v3.encode = function(v48) --[[ Line: 364 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v49 = buffer.create(0);
    local v50 = 0;
    if v48.thumbnail_aspect_ratio ~= nil and v48.thumbnail_aspect_ratio ~= "" then
        local v51, v52 = v0.writeTag(v49, v50, 1, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeString(v51, v52, v48.thumbnail_aspect_ratio);
        v49 = v51;
        v50 = v52;
    end;
    local v53 = buffer.create(v50);
    buffer.copy(v53, 0, v49, 0, v50);
    return v53;
end;
v3.decode = function(v54) --[[ Line: 378 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_2 (copy), v0 (copy)
    local v55 = l_v3_2.new();
    local v56 = 0;
    while v56 < buffer.len(v54) do
        local v57 = nil;
        local v58 = nil;
        local v59, v60, v61 = v0.readTag(v54, v56);
        v57 = v59;
        v58 = v60;
        v56 = v61;
        if v58 == v0.wireTypes.varint then
            v59 = nil;
            v60, v61 = v0.readVarInt(v54, v56);
            v59 = v60;
            v56 = v61;
        elseif v58 == v0.wireTypes.lengthDelimited then
            if v57 == 1 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.thumbnail_aspect_ratio = buffer.tostring(v59);
            else
                v59 = nil;
                v60, v61 = v0.readVarInt(v54, v56);
                v56 = v61 + v60;
            end;
        elseif v58 == v0.wireTypes.i32 then
            v59 = nil;
            v60, v61 = v0.readFixed32(v54, v56);
            v59 = v60;
            v56 = v61;
        elseif v58 == v0.wireTypes.i64 then
            v59 = nil;
            v60, v61 = v0.readFixed64(v54, v56);
            v59 = v60;
            v56 = v61;
        else
            error("Unsupported wire type: " .. v58);
        end;
    end;
    return v55;
end;
v3.jsonEncode = function(v62) --[[ Line: 421 ]] --[[ Name: jsonEncode ]]
    local v63 = {};
    if v62.thumbnail_aspect_ratio ~= nil and v62.thumbnail_aspect_ratio ~= "" then
        v63.thumbnailAspectRatio = v62.thumbnail_aspect_ratio;
    end;
    return v63;
end;
v3.jsonDecode = function(v64) --[[ Line: 431 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_2 (copy)
    local v65 = l_v3_2.new();
    if v64.thumbnail_aspect_ratio ~= nil then
        v65.thumbnail_aspect_ratio = v64.thumbnail_aspect_ratio;
    end;
    if v64.thumbnailAspectRatio ~= nil then
        v65.thumbnail_aspect_ratio = v64.thumbnailAspectRatio;
    end;
    return v65;
end;
v3.descriptor = {
    name = "CatalogSortCardStyle", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardStyle"
};
v2.CatalogSortCardStyle = v3;
v1.default:register(v2.CatalogSortCardStyle);
v3 = {};
v3.__index = v3;
v3.new = function(v66) --[[ Line: 459 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v66 ~= nil) or v66.id == nil) and "" or v66.id, 
        type = (not (v66 ~= nil) or v66.type == nil) and "" or v66.type, 
        hydration_priority = (not (v66 ~= nil) or v66.hydration_priority == nil) and 0 or v66.hydration_priority, 
        hydration_count = (not (v66 ~= nil) or v66.hydration_count == nil) and 0 or v66.hydration_count, 
        content = if not (v66 ~= nil) or v66.content == nil then {} else v66.content, 
        preview_columns = (not (v66 ~= nil) or v66.preview_columns == nil) and 0 or v66.preview_columns, 
        title = (not (v66 ~= nil) or v66.title == nil) and "" or v66.title, 
        description = (not (v66 ~= nil) or v66.description == nil) and "" or v66.description, 
        card_style = if not (v66 ~= nil) or v66.card_style == nil then nil else v66.card_style, 
        card_footers = if not (v66 ~= nil) or v66.card_footers == nil then {} else v66.card_footers
    }, v3));
end;
v3.encode = function(v67) --[[ Line: 474 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v68 = buffer.create(0);
    local v69 = 0;
    if v67.id ~= nil and v67.id ~= "" then
        local v70, v71 = v0.writeTag(v68, v69, 1, v0.wireTypes.lengthDelimited);
        v70, v71 = v0.writeString(v70, v71, v67.id);
        v68 = v70;
        v69 = v71;
    end;
    if v67.type ~= nil and v67.type ~= "" then
        local v72, v73 = v0.writeTag(v68, v69, 2, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeString(v72, v73, v67.type);
        v68 = v72;
        v69 = v73;
    end;
    if v67.hydration_priority ~= nil and v67.hydration_priority ~= 0 then
        local v74, v75 = v0.writeTag(v68, v69, 3, v0.wireTypes.varint);
        v74, v75 = v0.writeVarInt(v74, v75, v67.hydration_priority);
        v68 = v74;
        v69 = v75;
    end;
    if v67.hydration_count ~= nil and v67.hydration_count ~= 0 then
        local v76, v77 = v0.writeTag(v68, v69, 4, v0.wireTypes.varint);
        v76, v77 = v0.writeVarInt(v76, v77, v67.hydration_count);
        v68 = v76;
        v69 = v77;
    end;
    if v67.content ~= nil and #v67.content > 0 then
        for _, v79 in v67.content do
            local v80 = v79:encode();
            local v81, v82 = v0.writeTag(v68, v69, 5, v0.wireTypes.lengthDelimited);
            v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
            v68 = v81;
            v69 = v82;
        end;
    end;
    if v67.preview_columns ~= nil and v67.preview_columns ~= 0 then
        local v83, v84 = v0.writeTag(v68, v69, 6, v0.wireTypes.varint);
        v83, v84 = v0.writeVarInt(v83, v84, v67.preview_columns);
        v68 = v83;
        v69 = v84;
    end;
    if v67.title ~= nil and v67.title ~= "" then
        local v85, v86 = v0.writeTag(v68, v69, 7, v0.wireTypes.lengthDelimited);
        v85, v86 = v0.writeString(v85, v86, v67.title);
        v68 = v85;
        v69 = v86;
    end;
    if v67.description ~= nil and v67.description ~= "" then
        local v87, v88 = v0.writeTag(v68, v69, 8, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeString(v87, v88, v67.description);
        v68 = v87;
        v69 = v88;
    end;
    if v67.card_style ~= nil then
        local v89 = v67.card_style:encode();
        local v90, v91 = v0.writeTag(v68, v69, 9, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v68 = v90;
        v69 = v91;
    end;
    if v67.card_footers ~= nil and #v67.card_footers > 0 then
        for _, v93 in v67.card_footers do
            local v94 = v93:encode();
            local v95, v96 = v0.writeTag(v68, v69, 10, v0.wireTypes.lengthDelimited);
            v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
            v68 = v95;
            v69 = v96;
        end;
    end;
    local v97 = buffer.create(v69);
    buffer.copy(v97, 0, v68, 0, v69);
    return v97;
end;
v3.decode = function(v98) --[[ Line: 540 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    local v99 = v3.new();
    local v100 = 0;
    while v100 < buffer.len(v98) do
        local v101 = nil;
        local v102 = nil;
        local v103, v104, v105 = v0.readTag(v98, v100);
        v101 = v103;
        v102 = v104;
        v100 = v105;
        if v102 == v0.wireTypes.varint then
            if v101 == 3 then
                v103 = nil;
                v104, v105 = v0.readVarIntI32(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.hydration_priority = v103;
            elseif v101 == 4 then
                v103 = nil;
                v104, v105 = v0.readVarIntI32(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.hydration_count = v103;
            elseif v101 == 6 then
                v103 = nil;
                v104, v105 = v0.readVarIntI64(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.preview_columns = v103;
            else
                v103 = nil;
                v104, v105 = v0.readVarInt(v98, v100);
                v103 = v104;
                v100 = v105;
            end;
        elseif v102 == v0.wireTypes.lengthDelimited then
            if v101 == 1 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.id = buffer.tostring(v103);
            elseif v101 == 2 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.type = buffer.tostring(v103);
            elseif v101 == 5 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                table.insert(v99.content, v2.CatalogSortContentData.decode(v103));
            elseif v101 == 7 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.title = buffer.tostring(v103);
            elseif v101 == 8 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.description = buffer.tostring(v103);
            elseif v101 == 9 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.card_style = v2.CatalogSortCardStyle.decode(v103);
            elseif v101 == 10 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                table.insert(v99.card_footers, v2.CatalogSortCardItemFooter.decode(v103));
            else
                v103 = nil;
                v104, v105 = v0.readVarInt(v98, v100);
                v100 = v105 + v104;
            end;
        elseif v102 == v0.wireTypes.i32 then
            v103 = nil;
            v104, v105 = v0.readFixed32(v98, v100);
            v103 = v104;
            v100 = v105;
        elseif v102 == v0.wireTypes.i64 then
            v103 = nil;
            v104, v105 = v0.readFixed64(v98, v100);
            v103 = v104;
            v100 = v105;
        else
            error("Unsupported wire type: " .. v102);
        end;
    end;
    return v99;
end;
v3.jsonEncode = function(v106) --[[ Line: 628 ]] --[[ Name: jsonEncode ]]
    local v107 = {};
    if v106.id ~= nil and v106.id ~= "" then
        v107.id = v106.id;
    end;
    if v106.type ~= nil and v106.type ~= "" then
        v107.type = v106.type;
    end;
    if v106.hydration_priority ~= nil and v106.hydration_priority ~= 0 then
        v107.hydrationPriority = v106.hydration_priority;
    end;
    if v106.hydration_count ~= nil and v106.hydration_count ~= 0 then
        v107.hydrationCount = v106.hydration_count;
    end;
    if v106.content ~= nil and #v106.content > 0 then
        local v108 = {};
        for _, v110 in v106.content do
            table.insert(v108, v110:jsonEncode());
        end;
        v107.content = v108;
    end;
    if v106.preview_columns ~= nil and v106.preview_columns ~= 0 then
        v107.previewColumns = v106.preview_columns;
    end;
    if v106.title ~= nil and v106.title ~= "" then
        v107.title = v106.title;
    end;
    if v106.description ~= nil and v106.description ~= "" then
        v107.description = v106.description;
    end;
    if v106.card_style ~= nil then
        v107.cardStyle = v106.card_style:jsonEncode();
    end;
    if v106.card_footers ~= nil and #v106.card_footers > 0 then
        local v111 = {};
        for _, v113 in v106.card_footers do
            table.insert(v111, v113:jsonEncode());
        end;
        v107.cardFooters = v111;
    end;
    return v107;
end;
v3.jsonDecode = function(v114) --[[ Line: 682 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v115 = v3.new();
    if v114.id ~= nil then
        v115.id = v114.id;
    end;
    if v114.type ~= nil then
        v115.type = v114.type;
    end;
    if v114.hydration_priority ~= nil then
        v115.hydration_priority = v114.hydration_priority;
    end;
    if v114.hydrationPriority ~= nil then
        v115.hydration_priority = v114.hydrationPriority;
    end;
    if v114.hydration_count ~= nil then
        v115.hydration_count = v114.hydration_count;
    end;
    if v114.hydrationCount ~= nil then
        v115.hydration_count = v114.hydrationCount;
    end;
    if v114.content ~= nil then
        local v116 = {};
        for _, v118 in v114.content do
            table.insert(v116, v2.CatalogSortContentData.jsonDecode(v118));
        end;
        v115.content = v116;
    end;
    if v114.preview_columns ~= nil then
        v115.preview_columns = v114.preview_columns;
    end;
    if v114.previewColumns ~= nil then
        v115.preview_columns = v114.previewColumns;
    end;
    if v114.title ~= nil then
        v115.title = v114.title;
    end;
    if v114.description ~= nil then
        v115.description = v114.description;
    end;
    if v114.card_style ~= nil then
        v115.card_style = v2.CatalogSortCardStyle.jsonDecode(v114.card_style);
    end;
    if v114.cardStyle ~= nil then
        v115.card_style = v2.CatalogSortCardStyle.jsonDecode(v114.cardStyle);
    end;
    if v114.card_footers ~= nil then
        local v119 = {};
        for _, v121 in v114.card_footers do
            table.insert(v119, v2.CatalogSortCardItemFooter.jsonDecode(v121));
        end;
        v115.card_footers = v119;
    end;
    if v114.cardFooters ~= nil then
        local v122 = {};
        for _, v124 in v114.cardFooters do
            table.insert(v122, v2.CatalogSortCardItemFooter.jsonDecode(v124));
        end;
        v115.card_footers = v122;
    end;
    return v115;
end;
v3.descriptor = {
    name = "CatalogSortData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortData"
};
v2.CatalogSortData = v3;
v1.default:register(v2.CatalogSortData);
return {
    CatalogSortContentData = v2.CatalogSortContentData, 
    CatalogSortCardItemFooter = v2.CatalogSortCardItemFooter, 
    CatalogSortCardStyle = v2.CatalogSortCardStyle, 
    CatalogSortData = v2.CatalogSortData
};