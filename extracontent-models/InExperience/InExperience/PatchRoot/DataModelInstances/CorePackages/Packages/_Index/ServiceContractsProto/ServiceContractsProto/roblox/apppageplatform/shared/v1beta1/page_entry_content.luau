local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.page_entry);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 1807 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        page_entry = if not (v6 ~= nil) or v6.page_entry == nil then nil else v6.page_entry, 
        input_data = if not (v6 ~= nil) or v6.input_data == nil then nil else v6.input_data
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 1814 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.page_entry ~= nil then
        local v10 = v7.page_entry:encode();
        local v11, v12 = v0.writeTag(v8, v9, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeBuffer(v11, v12, v10, buffer.len(v10));
        v8 = v11;
        v9 = v12;
    end;
    if v7.input_data ~= nil then
        local v13 = v7.input_data:encode();
        local v14, v15 = v0.writeTag(v8, v9, 2, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v8 = v14;
        v9 = v15;
    end;
    local v16 = buffer.create(v9);
    buffer.copy(v16, 0, v8, 0, v9);
    return v16;
end;
v4.decode = function(v17) --[[ Line: 1835 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_0 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v18 = l_v4_0.new();
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
                v18.page_entry = v3.PageEntry.decode(v22);
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.input_data = v2.PageEntryInputData.decode(v22);
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
v4.jsonEncode = function(v25) --[[ Line: 1883 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.page_entry ~= nil then
        v26.pageEntry = v25.page_entry:jsonEncode();
    end;
    if v25.input_data ~= nil then
        v26.inputData = v25.input_data:jsonEncode();
    end;
    return v26;
end;
v4.jsonDecode = function(v27) --[[ Line: 1897 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_0 (copy), v3 (copy), v2 (copy)
    local v28 = l_v4_0.new();
    if v27.page_entry ~= nil then
        v28.page_entry = v3.PageEntry.jsonDecode(v27.page_entry);
    end;
    if v27.pageEntry ~= nil then
        v28.page_entry = v3.PageEntry.jsonDecode(v27.pageEntry);
    end;
    if v27.input_data ~= nil then
        v28.input_data = v2.PageEntryInputData.jsonDecode(v27.input_data);
    end;
    if v27.inputData ~= nil then
        v28.input_data = v2.PageEntryInputData.jsonDecode(v27.inputData);
    end;
    return v28;
end;
v4.descriptor = {
    name = "UniversalPageEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
};
v2.UniversalPageEntry = v4;
v1.default:register(v2.UniversalPageEntry);
v4 = {};
v4.__index = v4;
local l_v4_1 = v4 --[[ copy: 4 -> 6 ]];
v4.new = function(v30) --[[ Line: 1933 ]] --[[ Name: new ]]
    -- upvalues: l_v4_1 (copy)
    return (setmetatable({
        input_data = if not (v30 ~= nil) or v30.input_data == nil then nil else v30.input_data, 
        roblox_component = (not (v30 ~= nil) or v30.roblox_component == nil) and "" or v30.roblox_component
    }, l_v4_1));
end;
v4.encode = function(v31) --[[ Line: 1940 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.input_data ~= nil then
        local v34 = v31.input_data:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.roblox_component ~= nil and v31.roblox_component ~= "" then
        local v37, v38 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeString(v37, v38, v31.roblox_component);
        v32 = v37;
        v33 = v38;
    end;
    local v39 = buffer.create(v33);
    buffer.copy(v39, 0, v32, 0, v33);
    return v39;
end;
v4.decode = function(v40) --[[ Line: 1960 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_1 (copy), v0 (copy), v2 (copy)
    local v41 = l_v4_1.new();
    local v42 = 0;
    while v42 < buffer.len(v40) do
        local v43 = nil;
        local v44 = nil;
        local v45, v46, v47 = v0.readTag(v40, v42);
        v43 = v45;
        v44 = v46;
        v42 = v47;
        if v44 == v0.wireTypes.varint then
            v45 = nil;
            v46, v47 = v0.readVarInt(v40, v42);
            v45 = v46;
            v42 = v47;
        elseif v44 == v0.wireTypes.lengthDelimited then
            if v43 == 1 then
                v45 = nil;
                v46, v47 = v0.readBuffer(v40, v42);
                v45 = v46;
                v42 = v47;
                v41.input_data = v2.PageEntryInputData.decode(v45);
            elseif v43 == 2 then
                v45 = nil;
                v46, v47 = v0.readBuffer(v40, v42);
                v45 = v46;
                v42 = v47;
                v41.roblox_component = buffer.tostring(v45);
            else
                v45 = nil;
                v46, v47 = v0.readVarInt(v40, v42);
                v42 = v47 + v46;
            end;
        elseif v44 == v0.wireTypes.i32 then
            v45 = nil;
            v46, v47 = v0.readFixed32(v40, v42);
            v45 = v46;
            v42 = v47;
        elseif v44 == v0.wireTypes.i64 then
            v45 = nil;
            v46, v47 = v0.readFixed64(v40, v42);
            v45 = v46;
            v42 = v47;
        else
            error("Unsupported wire type: " .. v44);
        end;
    end;
    return v41;
end;
v4.jsonEncode = function(v48) --[[ Line: 2008 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.input_data ~= nil then
        v49.inputData = v48.input_data:jsonEncode();
    end;
    if v48.roblox_component ~= nil and v48.roblox_component ~= "" then
        v49.robloxComponent = v48.roblox_component;
    end;
    return v49;
end;
v4.jsonDecode = function(v50) --[[ Line: 2022 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_1 (copy), v2 (copy)
    local v51 = l_v4_1.new();
    if v50.input_data ~= nil then
        v51.input_data = v2.PageEntryInputData.jsonDecode(v50.input_data);
    end;
    if v50.inputData ~= nil then
        v51.input_data = v2.PageEntryInputData.jsonDecode(v50.inputData);
    end;
    if v50.roblox_component ~= nil then
        v51.roblox_component = v50.roblox_component;
    end;
    if v50.robloxComponent ~= nil then
        v51.roblox_component = v50.robloxComponent;
    end;
    return v51;
end;
v4.descriptor = {
    name = "FeedEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
};
v2.FeedEntry = v4;
v1.default:register(v2.FeedEntry);
v4 = {};
v4.__index = v4;
local l_v4_2 = v4 --[[ copy: 4 -> 7 ]];
v4.new = function(v53) --[[ Line: 2058 ]] --[[ Name: new ]]
    -- upvalues: l_v4_2 (copy)
    return (setmetatable({
        kind = if not (v53 ~= nil) or v53.kind == nil then nil else v53.kind
    }, l_v4_2));
end;
v4.encode = function(v54) --[[ Line: 2064 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v55 = buffer.create(0);
    local v56 = 0;
    if v54.kind ~= nil then
        if v54.kind.type == "badges_grid" then
            local v57 = v54.kind.value:encode();
            local v58, v59 = v0.writeTag(v55, v56, 1, v0.wireTypes.lengthDelimited);
            v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
            v55 = v58;
            v56 = v59;
        elseif v54.kind.type == "badge_details" then
            local v60 = v54.kind.value:encode();
            local v61, v62 = v0.writeTag(v55, v56, 2, v0.wireTypes.lengthDelimited);
            v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
            v55 = v61;
            v56 = v62;
        elseif v54.kind.type == "static_content" then
            local v63 = v54.kind.value:encode();
            local v64, v65 = v0.writeTag(v55, v56, 3, v0.wireTypes.lengthDelimited);
            v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
            v55 = v64;
            v56 = v65;
        elseif v54.kind.type == "experience_attribution_row" then
            local v66 = v54.kind.value:encode();
            local v67, v68 = v0.writeTag(v55, v56, 4, v0.wireTypes.lengthDelimited);
            v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
            v55 = v67;
            v56 = v68;
        elseif v54.kind.type == "experience_action_module" then
            local v69 = v54.kind.value:encode();
            local v70, v71 = v0.writeTag(v55, v56, 5, v0.wireTypes.lengthDelimited);
            v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
            v55 = v70;
            v56 = v71;
        elseif v54.kind.type == "experience_media_gallery" then
            local v72 = v54.kind.value:encode();
            local v73, v74 = v0.writeTag(v55, v56, 6, v0.wireTypes.lengthDelimited);
            v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
            v55 = v73;
            v56 = v74;
        elseif v54.kind.type == "experience_description" then
            local v75 = v54.kind.value:encode();
            local v76, v77 = v0.writeTag(v55, v56, 7, v0.wireTypes.lengthDelimited);
            v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
            v55 = v76;
            v56 = v77;
        elseif v54.kind.type == "experience_stat_row" then
            local v78 = v54.kind.value:encode();
            local v79, v80 = v0.writeTag(v55, v56, 8, v0.wireTypes.lengthDelimited);
            v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
            v55 = v79;
            v56 = v80;
        elseif v54.kind.type == "experience_info_table" then
            local v81 = v54.kind.value:encode();
            local v82, v83 = v0.writeTag(v55, v56, 9, v0.wireTypes.lengthDelimited);
            v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
            v55 = v82;
            v56 = v83;
        elseif v54.kind.type == "social_link_row" then
            local v84 = v54.kind.value:encode();
            local v85, v86 = v0.writeTag(v55, v56, 10, v0.wireTypes.lengthDelimited);
            v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
            v55 = v85;
            v56 = v86;
        elseif v54.kind.type == "experience_carousel" then
            local v87 = v54.kind.value:encode();
            local v88, v89 = v0.writeTag(v55, v56, 11, v0.wireTypes.lengthDelimited);
            v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
            v55 = v88;
            v56 = v89;
        elseif v54.kind.type == "song_carousel" then
            local v90 = v54.kind.value:encode();
            local v91, v92 = v0.writeTag(v55, v56, 12, v0.wireTypes.lengthDelimited);
            v91, v92 = v0.writeBuffer(v91, v92, v90, buffer.len(v90));
            v55 = v91;
            v56 = v92;
        elseif v54.kind.type == "events_carousel" then
            local v93 = v54.kind.value:encode();
            local v94, v95 = v0.writeTag(v55, v56, 13, v0.wireTypes.lengthDelimited);
            v94, v95 = v0.writeBuffer(v94, v95, v93, buffer.len(v93));
            v55 = v94;
            v56 = v95;
        elseif v54.kind.type == "game_passes_grid" then
            local v96 = v54.kind.value:encode();
            local v97, v98 = v0.writeTag(v55, v56, 14, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
            v55 = v97;
            v56 = v98;
        elseif v54.kind.type == "developer_products_grid" then
            local v99 = v54.kind.value:encode();
            local v100, v101 = v0.writeTag(v55, v56, 15, v0.wireTypes.lengthDelimited);
            v100, v101 = v0.writeBuffer(v100, v101, v99, buffer.len(v99));
            v55 = v100;
            v56 = v101;
        elseif v54.kind.type == "subscriptions_grid" then
            local v102 = v54.kind.value:encode();
            local v103, v104 = v0.writeTag(v55, v56, 16, v0.wireTypes.lengthDelimited);
            v103, v104 = v0.writeBuffer(v103, v104, v102, buffer.len(v102));
            v55 = v103;
            v56 = v104;
        elseif v54.kind.type == "card_container" then
            local v105 = v54.kind.value:encode();
            local v106, v107 = v0.writeTag(v55, v56, 20, v0.wireTypes.lengthDelimited);
            v106, v107 = v0.writeBuffer(v106, v107, v105, buffer.len(v105));
            v55 = v106;
            v56 = v107;
        elseif v54.kind.type == "card" then
            local v108 = v54.kind.value:encode();
            local v109, v110 = v0.writeTag(v55, v56, 21, v0.wireTypes.lengthDelimited);
            v109, v110 = v0.writeBuffer(v109, v110, v108, buffer.len(v108));
            v55 = v109;
            v56 = v110;
        elseif v54.kind.type == "dialog" then
            local v111 = v54.kind.value:encode();
            local v112, v113 = v0.writeTag(v55, v56, 22, v0.wireTypes.lengthDelimited);
            v112, v113 = v0.writeBuffer(v112, v113, v111, buffer.len(v111));
            v55 = v112;
            v56 = v113;
        elseif v54.kind.type == "banner" then
            local v114 = v54.kind.value:encode();
            local v115, v116 = v0.writeTag(v55, v56, 23, v0.wireTypes.lengthDelimited);
            v115, v116 = v0.writeBuffer(v115, v116, v114, buffer.len(v114));
            v55 = v115;
            v56 = v116;
        elseif v54.kind.type == "tooltip" then
            local v117 = v54.kind.value:encode();
            local v118, v119 = v0.writeTag(v55, v56, 24, v0.wireTypes.lengthDelimited);
            v118, v119 = v0.writeBuffer(v118, v119, v117, buffer.len(v117));
            v55 = v118;
            v56 = v119;
        elseif v54.kind.type == "experience_details_feed" then
            local v120 = v54.kind.value:encode();
            local v121, v122 = v0.writeTag(v55, v56, 500, v0.wireTypes.lengthDelimited);
            v121, v122 = v0.writeBuffer(v121, v122, v120, buffer.len(v120));
            v55 = v121;
            v56 = v122;
        elseif v54.kind.type == "experience_details_action_bar" then
            local v123 = v54.kind.value:encode();
            local v124, v125 = v0.writeTag(v55, v56, 501, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v55 = v124;
            v56 = v125;
        elseif v54.kind.type == "event_details_feed" then
            local v126 = v54.kind.value:encode();
            local v127, v128 = v0.writeTag(v55, v56, 600, v0.wireTypes.lengthDelimited);
            v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
            v55 = v127;
            v56 = v128;
        elseif v54.kind.type == "dev_store_feed" then
            local v129 = v54.kind.value:encode();
            local v130, v131 = v0.writeTag(v55, v56, 700, v0.wireTypes.lengthDelimited);
            v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
            v55 = v130;
            v56 = v131;
        elseif v54.kind.type == "charts_feed" then
            local v132 = v54.kind.value:encode();
            local v133, v134 = v0.writeTag(v55, v56, 800, v0.wireTypes.lengthDelimited);
            v133, v134 = v0.writeBuffer(v133, v134, v132, buffer.len(v132));
            v55 = v133;
            v56 = v134;
        elseif v54.kind.type == "filter_pills" then
            local v135 = v54.kind.value:encode();
            local v136, v137 = v0.writeTag(v55, v56, 801, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeBuffer(v136, v137, v135, buffer.len(v135));
            v55 = v136;
            v56 = v137;
        elseif v54.kind.type == "sort_selector" then
            local v138 = v54.kind.value:encode();
            local v139, v140 = v0.writeTag(v55, v56, 802, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v55 = v139;
            v56 = v140;
        elseif v54.kind.type == "marketplace_catalog_feed" then
            local v141 = v54.kind.value:encode();
            local v142, v143 = v0.writeTag(v55, v56, 900, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v55 = v142;
            v56 = v143;
        elseif v54.kind.type == "marketplace_catalog_category_menu" then
            local v144 = v54.kind.value:encode();
            local v145, v146 = v0.writeTag(v55, v56, 901, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
            v55 = v145;
            v56 = v146;
        elseif v54.kind.type == "marketplace_catalog_item_group" then
            local v147 = v54.kind.value:encode();
            local v148, v149 = v0.writeTag(v55, v56, 902, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v55 = v148;
            v56 = v149;
        elseif v54.kind.type == "marketplace_catalog_item_carousel" then
            local v150 = v54.kind.value:encode();
            local v151, v152 = v0.writeTag(v55, v56, 903, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v55 = v151;
            v56 = v152;
        end;
    end;
    local v153 = buffer.create(v56);
    buffer.copy(v153, 0, v55, 0, v56);
    return v153;
end;
v4.decode = function(v154) --[[ Line: 2205 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_2 (copy), v0 (copy), v2 (copy)
    local v155 = l_v4_2.new();
    local v156 = 0;
    while v156 < buffer.len(v154) do
        local v157 = nil;
        local v158 = nil;
        local v159, v160, v161 = v0.readTag(v154, v156);
        v157 = v159;
        v158 = v160;
        v156 = v161;
        if v158 == v0.wireTypes.varint then
            v159 = nil;
            v160, v161 = v0.readVarInt(v154, v156);
            v159 = v160;
            v156 = v161;
        elseif v158 == v0.wireTypes.lengthDelimited then
            if v157 == 1 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "badges_grid", 
                    value = v2.BadgesGridInputData.decode(v159)
                };
            elseif v157 == 2 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "badge_details", 
                    value = v2.BadgeDetailsInputData.decode(v159)
                };
            elseif v157 == 3 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "static_content", 
                    value = v2.StaticInputData.decode(v159)
                };
            elseif v157 == 4 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_attribution_row", 
                    value = v2.ExperienceAttributionRowInputData.decode(v159)
                };
            elseif v157 == 5 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_action_module", 
                    value = v2.ExperienceActionModuleInputData.decode(v159)
                };
            elseif v157 == 6 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_media_gallery", 
                    value = v2.ExperienceMediaGalleryInputData.decode(v159)
                };
            elseif v157 == 7 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_description", 
                    value = v2.ExperienceDescriptionInputData.decode(v159)
                };
            elseif v157 == 8 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_stat_row", 
                    value = v2.ExperienceStatRowInputData.decode(v159)
                };
            elseif v157 == 9 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_info_table", 
                    value = v2.ExperienceInfoTableInputData.decode(v159)
                };
            elseif v157 == 10 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "social_link_row", 
                    value = v2.SocialLinkRowInputData.decode(v159)
                };
            elseif v157 == 11 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_carousel", 
                    value = v2.ExperienceCarouselInputData.decode(v159)
                };
            elseif v157 == 12 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "song_carousel", 
                    value = v2.SongCarouselInputData.decode(v159)
                };
            elseif v157 == 13 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "events_carousel", 
                    value = v2.EventsCarouselInputData.decode(v159)
                };
            elseif v157 == 14 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "game_passes_grid", 
                    value = v2.GamePassesGridInputData.decode(v159)
                };
            elseif v157 == 15 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "developer_products_grid", 
                    value = v2.GameDeveloperProductsGridInputData.decode(v159)
                };
            elseif v157 == 16 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "subscriptions_grid", 
                    value = v2.GameSubscriptionsGridInputData.decode(v159)
                };
            elseif v157 == 20 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "card_container", 
                    value = v2.CardContainerInputData.decode(v159)
                };
            elseif v157 == 21 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "card", 
                    value = v2.CardInputData.decode(v159)
                };
            elseif v157 == 22 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "dialog", 
                    value = v2.DialogInputData.decode(v159)
                };
            elseif v157 == 23 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "banner", 
                    value = v2.BannerInputData.decode(v159)
                };
            elseif v157 == 24 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "tooltip", 
                    value = v2.TooltipInputData.decode(v159)
                };
            elseif v157 == 500 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_details_feed", 
                    value = v2.ExperienceDetailsFeedInputData.decode(v159)
                };
            elseif v157 == 501 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "experience_details_action_bar", 
                    value = v2.ExperienceDetailsActionBarInputData.decode(v159)
                };
            elseif v157 == 600 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "event_details_feed", 
                    value = v2.EventDetailsFeedInputData.decode(v159)
                };
            elseif v157 == 700 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "dev_store_feed", 
                    value = v2.DevStoreFeedInputData.decode(v159)
                };
            elseif v157 == 800 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "charts_feed", 
                    value = v2.ChartsFeedInputData.decode(v159)
                };
            elseif v157 == 801 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "filter_pills", 
                    value = v2.FilterPillsInputData.decode(v159)
                };
            elseif v157 == 802 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "sort_selector", 
                    value = v2.SortSelectorInputData.decode(v159)
                };
            elseif v157 == 900 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "marketplace_catalog_feed", 
                    value = v2.UAMarketplaceCatalogFeedInputData.decode(v159)
                };
            elseif v157 == 901 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "marketplace_catalog_category_menu", 
                    value = v2.UAMarketplaceCatalogCategoryMenuInputData.decode(v159)
                };
            elseif v157 == 902 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "marketplace_catalog_item_group", 
                    value = v2.UAMarketplaceCatalogItemGroupInputData.decode(v159)
                };
            elseif v157 == 903 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v155.kind = {
                    type = "marketplace_catalog_item_carousel", 
                    value = v2.UAMarketplaceCatalogItemCarouselInputData.decode(v159)
                };
            else
                v159 = nil;
                v160, v161 = v0.readVarInt(v154, v156);
                v156 = v161 + v160;
            end;
        elseif v158 == v0.wireTypes.i32 then
            v159 = nil;
            v160, v161 = v0.readFixed32(v154, v156);
            v159 = v160;
            v156 = v161;
        elseif v158 == v0.wireTypes.i64 then
            v159 = nil;
            v160, v161 = v0.readFixed64(v154, v156);
            v159 = v160;
            v156 = v161;
        else
            error("Unsupported wire type: " .. v158);
        end;
    end;
    return v155;
end;
v4.jsonEncode = function(v162) --[[ Line: 2441 ]] --[[ Name: jsonEncode ]]
    local v163 = {};
    if v162.kind ~= nil then
        if v162.kind.type == "badges_grid" then
            v163.badgesGrid = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "badge_details" then
            v163.badgeDetails = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "static_content" then
            v163.staticContent = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_attribution_row" then
            v163.experienceAttributionRow = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_action_module" then
            v163.experienceActionModule = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_media_gallery" then
            v163.experienceMediaGallery = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_description" then
            v163.experienceDescription = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_stat_row" then
            v163.experienceStatRow = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_info_table" then
            v163.experienceInfoTable = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "social_link_row" then
            v163.socialLinkRow = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_carousel" then
            v163.experienceCarousel = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "song_carousel" then
            v163.songCarousel = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "events_carousel" then
            v163.eventsCarousel = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "game_passes_grid" then
            v163.gamePassesGrid = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "developer_products_grid" then
            v163.developerProductsGrid = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "subscriptions_grid" then
            v163.subscriptionsGrid = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "card_container" then
            v163.cardContainer = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "card" then
            v163.card = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "dialog" then
            v163.dialog = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "banner" then
            v163.banner = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "tooltip" then
            v163.tooltip = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_details_feed" then
            v163.experienceDetailsFeed = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "experience_details_action_bar" then
            v163.experienceDetailsActionBar = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "event_details_feed" then
            v163.eventDetailsFeed = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "dev_store_feed" then
            v163.devStoreFeed = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "charts_feed" then
            v163.chartsFeed = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "filter_pills" then
            v163.filterPills = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "sort_selector" then
            v163.sortSelector = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "marketplace_catalog_feed" then
            v163.marketplaceCatalogFeed = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "marketplace_catalog_category_menu" then
            v163.marketplaceCatalogCategoryMenu = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "marketplace_catalog_item_group" then
            v163.marketplaceCatalogItemGroup = v162.kind.value:jsonEncode();
            return v163;
        elseif v162.kind.type == "marketplace_catalog_item_carousel" then
            v163.marketplaceCatalogItemCarousel = v162.kind.value:jsonEncode();
        end;
    end;
    return v163;
end;
v4.jsonDecode = function(v164) --[[ Line: 2515 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_2 (copy), v2 (copy)
    local v165 = l_v4_2.new();
    if v164.badges_grid ~= nil then
        v165.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v164.badges_grid)
        };
    end;
    if v164.badgesGrid ~= nil then
        v165.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v164.badgesGrid)
        };
    end;
    if v164.badge_details ~= nil then
        v165.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v164.badge_details)
        };
    end;
    if v164.badgeDetails ~= nil then
        v165.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v164.badgeDetails)
        };
    end;
    if v164.static_content ~= nil then
        v165.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v164.static_content)
        };
    end;
    if v164.staticContent ~= nil then
        v165.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v164.staticContent)
        };
    end;
    if v164.experience_attribution_row ~= nil then
        v165.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v164.experience_attribution_row)
        };
    end;
    if v164.experienceAttributionRow ~= nil then
        v165.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v164.experienceAttributionRow)
        };
    end;
    if v164.experience_action_module ~= nil then
        v165.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v164.experience_action_module)
        };
    end;
    if v164.experienceActionModule ~= nil then
        v165.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v164.experienceActionModule)
        };
    end;
    if v164.experience_media_gallery ~= nil then
        v165.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v164.experience_media_gallery)
        };
    end;
    if v164.experienceMediaGallery ~= nil then
        v165.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v164.experienceMediaGallery)
        };
    end;
    if v164.experience_description ~= nil then
        v165.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v164.experience_description)
        };
    end;
    if v164.experienceDescription ~= nil then
        v165.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v164.experienceDescription)
        };
    end;
    if v164.experience_stat_row ~= nil then
        v165.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v164.experience_stat_row)
        };
    end;
    if v164.experienceStatRow ~= nil then
        v165.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v164.experienceStatRow)
        };
    end;
    if v164.experience_info_table ~= nil then
        v165.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v164.experience_info_table)
        };
    end;
    if v164.experienceInfoTable ~= nil then
        v165.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v164.experienceInfoTable)
        };
    end;
    if v164.social_link_row ~= nil then
        v165.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v164.social_link_row)
        };
    end;
    if v164.socialLinkRow ~= nil then
        v165.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v164.socialLinkRow)
        };
    end;
    if v164.experience_carousel ~= nil then
        v165.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v164.experience_carousel)
        };
    end;
    if v164.experienceCarousel ~= nil then
        v165.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v164.experienceCarousel)
        };
    end;
    if v164.song_carousel ~= nil then
        v165.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v164.song_carousel)
        };
    end;
    if v164.songCarousel ~= nil then
        v165.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v164.songCarousel)
        };
    end;
    if v164.events_carousel ~= nil then
        v165.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v164.events_carousel)
        };
    end;
    if v164.eventsCarousel ~= nil then
        v165.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v164.eventsCarousel)
        };
    end;
    if v164.game_passes_grid ~= nil then
        v165.kind = {
            type = "game_passes_grid", 
            value = v2.GamePassesGridInputData.jsonDecode(v164.game_passes_grid)
        };
    end;
    if v164.gamePassesGrid ~= nil then
        v165.kind = {
            type = "game_passes_grid", 
            value = v2.GamePassesGridInputData.jsonDecode(v164.gamePassesGrid)
        };
    end;
    if v164.developer_products_grid ~= nil then
        v165.kind = {
            type = "developer_products_grid", 
            value = v2.GameDeveloperProductsGridInputData.jsonDecode(v164.developer_products_grid)
        };
    end;
    if v164.developerProductsGrid ~= nil then
        v165.kind = {
            type = "developer_products_grid", 
            value = v2.GameDeveloperProductsGridInputData.jsonDecode(v164.developerProductsGrid)
        };
    end;
    if v164.subscriptions_grid ~= nil then
        v165.kind = {
            type = "subscriptions_grid", 
            value = v2.GameSubscriptionsGridInputData.jsonDecode(v164.subscriptions_grid)
        };
    end;
    if v164.subscriptionsGrid ~= nil then
        v165.kind = {
            type = "subscriptions_grid", 
            value = v2.GameSubscriptionsGridInputData.jsonDecode(v164.subscriptionsGrid)
        };
    end;
    if v164.card_container ~= nil then
        v165.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v164.card_container)
        };
    end;
    if v164.cardContainer ~= nil then
        v165.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v164.cardContainer)
        };
    end;
    if v164.card ~= nil then
        v165.kind = {
            type = "card", 
            value = v2.CardInputData.jsonDecode(v164.card)
        };
    end;
    if v164.dialog ~= nil then
        v165.kind = {
            type = "dialog", 
            value = v2.DialogInputData.jsonDecode(v164.dialog)
        };
    end;
    if v164.banner ~= nil then
        v165.kind = {
            type = "banner", 
            value = v2.BannerInputData.jsonDecode(v164.banner)
        };
    end;
    if v164.tooltip ~= nil then
        v165.kind = {
            type = "tooltip", 
            value = v2.TooltipInputData.jsonDecode(v164.tooltip)
        };
    end;
    if v164.experience_details_feed ~= nil then
        v165.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v164.experience_details_feed)
        };
    end;
    if v164.experienceDetailsFeed ~= nil then
        v165.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v164.experienceDetailsFeed)
        };
    end;
    if v164.experience_details_action_bar ~= nil then
        v165.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v164.experience_details_action_bar)
        };
    end;
    if v164.experienceDetailsActionBar ~= nil then
        v165.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v164.experienceDetailsActionBar)
        };
    end;
    if v164.event_details_feed ~= nil then
        v165.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v164.event_details_feed)
        };
    end;
    if v164.eventDetailsFeed ~= nil then
        v165.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v164.eventDetailsFeed)
        };
    end;
    if v164.dev_store_feed ~= nil then
        v165.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v164.dev_store_feed)
        };
    end;
    if v164.devStoreFeed ~= nil then
        v165.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v164.devStoreFeed)
        };
    end;
    if v164.charts_feed ~= nil then
        v165.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v164.charts_feed)
        };
    end;
    if v164.chartsFeed ~= nil then
        v165.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v164.chartsFeed)
        };
    end;
    if v164.filter_pills ~= nil then
        v165.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v164.filter_pills)
        };
    end;
    if v164.filterPills ~= nil then
        v165.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v164.filterPills)
        };
    end;
    if v164.sort_selector ~= nil then
        v165.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v164.sort_selector)
        };
    end;
    if v164.sortSelector ~= nil then
        v165.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v164.sortSelector)
        };
    end;
    if v164.marketplace_catalog_feed ~= nil then
        v165.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v164.marketplace_catalog_feed)
        };
    end;
    if v164.marketplaceCatalogFeed ~= nil then
        v165.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v164.marketplaceCatalogFeed)
        };
    end;
    if v164.marketplace_catalog_category_menu ~= nil then
        v165.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v164.marketplace_catalog_category_menu)
        };
    end;
    if v164.marketplaceCatalogCategoryMenu ~= nil then
        v165.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v164.marketplaceCatalogCategoryMenu)
        };
    end;
    if v164.marketplace_catalog_item_group ~= nil then
        v165.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v164.marketplace_catalog_item_group)
        };
    end;
    if v164.marketplaceCatalogItemGroup ~= nil then
        v165.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v164.marketplaceCatalogItemGroup)
        };
    end;
    if v164.marketplace_catalog_item_carousel ~= nil then
        v165.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v164.marketplace_catalog_item_carousel)
        };
    end;
    if v164.marketplaceCatalogItemCarousel ~= nil then
        v165.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v164.marketplaceCatalogItemCarousel)
        };
    end;
    return v165;
end;
v4.descriptor = {
    name = "PageEntryInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
};
v2.PageEntryInputData = v4;
v1.default:register(v2.PageEntryInputData);
v4 = {};
v4.__index = v4;
local l_v4_3 = v4 --[[ copy: 4 -> 8 ]];
v4.new = function(v167) --[[ Line: 2899 ]] --[[ Name: new ]]
    -- upvalues: l_v4_3 (copy)
    return (setmetatable({
        section_title = (not (v167 ~= nil) or v167.section_title == nil) and "" or v167.section_title, 
        badges = if not (v167 ~= nil) or v167.badges == nil then {} else v167.badges, 
        collection_id = (not (v167 ~= nil) or v167.collection_id == nil) and "" or v167.collection_id, 
        collection_position = (not (v167 ~= nil) or v167.collection_position == nil) and "" or v167.collection_position, 
        universe_id = (not (v167 ~= nil) or v167.universe_id == nil) and "" or v167.universe_id
    }, l_v4_3));
end;
v4.encode = function(v168) --[[ Line: 2911 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v169 = buffer.create(0);
    local v170 = 0;
    if v168.section_title ~= nil and v168.section_title ~= "" then
        local v171, v172 = v0.writeTag(v169, v170, 1, v0.wireTypes.lengthDelimited);
        v171, v172 = v0.writeString(v171, v172, v168.section_title);
        v169 = v171;
        v170 = v172;
    end;
    if v168.badges ~= nil and #v168.badges > 0 then
        for _, v174 in v168.badges do
            local v175 = v174:encode();
            local v176, v177 = v0.writeTag(v169, v170, 2, v0.wireTypes.lengthDelimited);
            v176, v177 = v0.writeBuffer(v176, v177, v175, buffer.len(v175));
            v169 = v176;
            v170 = v177;
        end;
    end;
    if v168.collection_id ~= nil and v168.collection_id ~= "" then
        local v178, v179 = v0.writeTag(v169, v170, 3, v0.wireTypes.lengthDelimited);
        v178, v179 = v0.writeString(v178, v179, v168.collection_id);
        v169 = v178;
        v170 = v179;
    end;
    if v168.collection_position ~= nil and v168.collection_position ~= "" then
        local v180, v181 = v0.writeTag(v169, v170, 4, v0.wireTypes.lengthDelimited);
        v180, v181 = v0.writeString(v180, v181, v168.collection_position);
        v169 = v180;
        v170 = v181;
    end;
    if v168.universe_id ~= nil and v168.universe_id ~= "" then
        local v182, v183 = v0.writeTag(v169, v170, 5, v0.wireTypes.lengthDelimited);
        v182, v183 = v0.writeString(v182, v183, v168.universe_id);
        v169 = v182;
        v170 = v183;
    end;
    local v184 = buffer.create(v170);
    buffer.copy(v184, 0, v169, 0, v170);
    return v184;
end;
v4.decode = function(v185) --[[ Line: 2948 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_3 (copy), v0 (copy), v2 (copy)
    local v186 = l_v4_3.new();
    local v187 = 0;
    while v187 < buffer.len(v185) do
        local v188 = nil;
        local v189 = nil;
        local v190, v191, v192 = v0.readTag(v185, v187);
        v188 = v190;
        v189 = v191;
        v187 = v192;
        if v189 == v0.wireTypes.varint then
            v190 = nil;
            v191, v192 = v0.readVarInt(v185, v187);
            v190 = v191;
            v187 = v192;
        elseif v189 == v0.wireTypes.lengthDelimited then
            if v188 == 1 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.section_title = buffer.tostring(v190);
            elseif v188 == 2 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                table.insert(v186.badges, v2.BadgesGridInputData_BadgeInputData.decode(v190));
            elseif v188 == 3 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.collection_id = buffer.tostring(v190);
            elseif v188 == 4 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.collection_position = buffer.tostring(v190);
            elseif v188 == 5 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.universe_id = buffer.tostring(v190);
            else
                v190 = nil;
                v191, v192 = v0.readVarInt(v185, v187);
                v187 = v192 + v191;
            end;
        elseif v189 == v0.wireTypes.i32 then
            v190 = nil;
            v191, v192 = v0.readFixed32(v185, v187);
            v190 = v191;
            v187 = v192;
        elseif v189 == v0.wireTypes.i64 then
            v190 = nil;
            v191, v192 = v0.readFixed64(v185, v187);
            v190 = v191;
            v187 = v192;
        else
            error("Unsupported wire type: " .. v189);
        end;
    end;
    return v186;
end;
v4.jsonEncode = function(v193) --[[ Line: 3011 ]] --[[ Name: jsonEncode ]]
    local v194 = {};
    if v193.section_title ~= nil and v193.section_title ~= "" then
        v194.sectionTitle = v193.section_title;
    end;
    if v193.badges ~= nil and #v193.badges > 0 then
        local v195 = {};
        for _, v197 in v193.badges do
            table.insert(v195, v197:jsonEncode());
        end;
        v194.badges = v195;
    end;
    if v193.collection_id ~= nil and v193.collection_id ~= "" then
        v194.collectionId = v193.collection_id;
    end;
    if v193.collection_position ~= nil and v193.collection_position ~= "" then
        v194.collectionPosition = v193.collection_position;
    end;
    if v193.universe_id ~= nil and v193.universe_id ~= "" then
        v194.universeId = v193.universe_id;
    end;
    return v194;
end;
v4.jsonDecode = function(v198) --[[ Line: 3041 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_3 (copy), v2 (copy)
    local v199 = l_v4_3.new();
    if v198.section_title ~= nil then
        v199.section_title = v198.section_title;
    end;
    if v198.sectionTitle ~= nil then
        v199.section_title = v198.sectionTitle;
    end;
    if v198.badges ~= nil then
        local v200 = {};
        for _, v202 in v198.badges do
            table.insert(v200, v2.BadgesGridInputData_BadgeInputData.jsonDecode(v202));
        end;
        v199.badges = v200;
    end;
    if v198.collection_id ~= nil then
        v199.collection_id = v198.collection_id;
    end;
    if v198.collectionId ~= nil then
        v199.collection_id = v198.collectionId;
    end;
    if v198.collection_position ~= nil then
        v199.collection_position = v198.collection_position;
    end;
    if v198.collectionPosition ~= nil then
        v199.collection_position = v198.collectionPosition;
    end;
    if v198.universe_id ~= nil then
        v199.universe_id = v198.universe_id;
    end;
    if v198.universeId ~= nil then
        v199.universe_id = v198.universeId;
    end;
    return v199;
end;
v4.descriptor = {
    name = "BadgesGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
};
v2.BadgesGridInputData = v4;
v1.default:register(v2.BadgesGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_4 = v4 --[[ copy: 4 -> 9 ]];
v4.new = function(v204) --[[ Line: 3102 ]] --[[ Name: new ]]
    -- upvalues: l_v4_4 (copy)
    return (setmetatable({
        badge_id = (not (v204 ~= nil) or v204.badge_id == nil) and "" or v204.badge_id
    }, l_v4_4));
end;
v4.encode = function(v205) --[[ Line: 3110 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v206 = buffer.create(0);
    local v207 = 0;
    if v205.badge_id ~= nil and v205.badge_id ~= "" then
        local v208, v209 = v0.writeTag(v206, v207, 1, v0.wireTypes.lengthDelimited);
        v208, v209 = v0.writeString(v208, v209, v205.badge_id);
        v206 = v208;
        v207 = v209;
    end;
    local v210 = buffer.create(v207);
    buffer.copy(v210, 0, v206, 0, v207);
    return v210;
end;
v4.decode = function(v211) --[[ Line: 3124 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_4 (copy), v0 (copy)
    local v212 = l_v4_4.new();
    local v213 = 0;
    while v213 < buffer.len(v211) do
        local v214 = nil;
        local v215 = nil;
        local v216, v217, v218 = v0.readTag(v211, v213);
        v214 = v216;
        v215 = v217;
        v213 = v218;
        if v215 == v0.wireTypes.varint then
            v216 = nil;
            v217, v218 = v0.readVarInt(v211, v213);
            v216 = v217;
            v213 = v218;
        elseif v215 == v0.wireTypes.lengthDelimited then
            if v214 == 1 then
                v216 = nil;
                v217, v218 = v0.readBuffer(v211, v213);
                v216 = v217;
                v213 = v218;
                v212.badge_id = buffer.tostring(v216);
            else
                v216 = nil;
                v217, v218 = v0.readVarInt(v211, v213);
                v213 = v218 + v217;
            end;
        elseif v215 == v0.wireTypes.i32 then
            v216 = nil;
            v217, v218 = v0.readFixed32(v211, v213);
            v216 = v217;
            v213 = v218;
        elseif v215 == v0.wireTypes.i64 then
            v216 = nil;
            v217, v218 = v0.readFixed64(v211, v213);
            v216 = v217;
            v213 = v218;
        else
            error("Unsupported wire type: " .. v215);
        end;
    end;
    return v212;
end;
v4.jsonEncode = function(v219) --[[ Line: 3167 ]] --[[ Name: jsonEncode ]]
    local v220 = {};
    if v219.badge_id ~= nil and v219.badge_id ~= "" then
        v220.badgeId = v219.badge_id;
    end;
    return v220;
end;
v4.jsonDecode = function(v221) --[[ Line: 3177 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_4 (copy)
    local v222 = l_v4_4.new();
    if v221.badge_id ~= nil then
        v222.badge_id = v221.badge_id;
    end;
    if v221.badgeId ~= nil then
        v222.badge_id = v221.badgeId;
    end;
    return v222;
end;
v4.descriptor = {
    name = "BadgesGridInputData_BadgeInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
};
v2.BadgesGridInputData_BadgeInputData = v4;
v1.default:register(v2.BadgesGridInputData_BadgeInputData);
v4 = {};
v4.__index = v4;
local l_v4_5 = v4 --[[ copy: 4 -> 10 ]];
v4.new = function(v224) --[[ Line: 3207 ]] --[[ Name: new ]]
    -- upvalues: l_v4_5 (copy)
    return (setmetatable({
        badge_id = (not (v224 ~= nil) or v224.badge_id == nil) and "" or v224.badge_id, 
        universe_id = (not (v224 ~= nil) or v224.universe_id == nil) and "" or v224.universe_id, 
        localized_literals = if not (v224 ~= nil) or v224.localized_literals == nil then nil else v224.localized_literals, 
        creator_key = (not (v224 ~= nil) or v224.creator_key == nil) and "" or v224.creator_key
    }, l_v4_5));
end;
v4.encode = function(v225) --[[ Line: 3216 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v226 = buffer.create(0);
    local v227 = 0;
    if v225.badge_id ~= nil and v225.badge_id ~= "" then
        local v228, v229 = v0.writeTag(v226, v227, 1, v0.wireTypes.lengthDelimited);
        v228, v229 = v0.writeString(v228, v229, v225.badge_id);
        v226 = v228;
        v227 = v229;
    end;
    if v225.universe_id ~= nil and v225.universe_id ~= "" then
        local v230, v231 = v0.writeTag(v226, v227, 2, v0.wireTypes.lengthDelimited);
        v230, v231 = v0.writeString(v230, v231, v225.universe_id);
        v226 = v230;
        v227 = v231;
    end;
    if v225.localized_literals ~= nil then
        local v232 = v225.localized_literals:encode();
        local v233, v234 = v0.writeTag(v226, v227, 3, v0.wireTypes.lengthDelimited);
        v233, v234 = v0.writeBuffer(v233, v234, v232, buffer.len(v232));
        v226 = v233;
        v227 = v234;
    end;
    if v225.creator_key ~= nil and v225.creator_key ~= "" then
        local v235, v236 = v0.writeTag(v226, v227, 4, v0.wireTypes.lengthDelimited);
        v235, v236 = v0.writeString(v235, v236, v225.creator_key);
        v226 = v235;
        v227 = v236;
    end;
    local v237 = buffer.create(v227);
    buffer.copy(v237, 0, v226, 0, v227);
    return v237;
end;
v4.decode = function(v238) --[[ Line: 3246 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_5 (copy), v0 (copy), v2 (copy)
    local v239 = l_v4_5.new();
    local v240 = 0;
    while v240 < buffer.len(v238) do
        local v241 = nil;
        local v242 = nil;
        local v243, v244, v245 = v0.readTag(v238, v240);
        v241 = v243;
        v242 = v244;
        v240 = v245;
        if v242 == v0.wireTypes.varint then
            v243 = nil;
            v244, v245 = v0.readVarInt(v238, v240);
            v243 = v244;
            v240 = v245;
        elseif v242 == v0.wireTypes.lengthDelimited then
            if v241 == 1 then
                v243 = nil;
                v244, v245 = v0.readBuffer(v238, v240);
                v243 = v244;
                v240 = v245;
                v239.badge_id = buffer.tostring(v243);
            elseif v241 == 2 then
                v243 = nil;
                v244, v245 = v0.readBuffer(v238, v240);
                v243 = v244;
                v240 = v245;
                v239.universe_id = buffer.tostring(v243);
            elseif v241 == 3 then
                v243 = nil;
                v244, v245 = v0.readBuffer(v238, v240);
                v243 = v244;
                v240 = v245;
                v239.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.decode(v243);
            elseif v241 == 4 then
                v243 = nil;
                v244, v245 = v0.readBuffer(v238, v240);
                v243 = v244;
                v240 = v245;
                v239.creator_key = buffer.tostring(v243);
            else
                v243 = nil;
                v244, v245 = v0.readVarInt(v238, v240);
                v240 = v245 + v244;
            end;
        elseif v242 == v0.wireTypes.i32 then
            v243 = nil;
            v244, v245 = v0.readFixed32(v238, v240);
            v243 = v244;
            v240 = v245;
        elseif v242 == v0.wireTypes.i64 then
            v243 = nil;
            v244, v245 = v0.readFixed64(v238, v240);
            v243 = v244;
            v240 = v245;
        else
            error("Unsupported wire type: " .. v242);
        end;
    end;
    return v239;
end;
v4.jsonEncode = function(v246) --[[ Line: 3304 ]] --[[ Name: jsonEncode ]]
    local v247 = {};
    if v246.badge_id ~= nil and v246.badge_id ~= "" then
        v247.badgeId = v246.badge_id;
    end;
    if v246.universe_id ~= nil and v246.universe_id ~= "" then
        v247.universeId = v246.universe_id;
    end;
    if v246.localized_literals ~= nil then
        v247.localizedLiterals = v246.localized_literals:jsonEncode();
    end;
    if v246.creator_key ~= nil and v246.creator_key ~= "" then
        v247.creatorKey = v246.creator_key;
    end;
    return v247;
end;
v4.jsonDecode = function(v248) --[[ Line: 3326 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_5 (copy), v2 (copy)
    local v249 = l_v4_5.new();
    if v248.badge_id ~= nil then
        v249.badge_id = v248.badge_id;
    end;
    if v248.badgeId ~= nil then
        v249.badge_id = v248.badgeId;
    end;
    if v248.universe_id ~= nil then
        v249.universe_id = v248.universe_id;
    end;
    if v248.universeId ~= nil then
        v249.universe_id = v248.universeId;
    end;
    if v248.localized_literals ~= nil then
        v249.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v248.localized_literals);
    end;
    if v248.localizedLiterals ~= nil then
        v249.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v248.localizedLiterals);
    end;
    if v248.creator_key ~= nil then
        v249.creator_key = v248.creator_key;
    end;
    if v248.creatorKey ~= nil then
        v249.creator_key = v248.creatorKey;
    end;
    return v249;
end;
v4.descriptor = {
    name = "BadgeDetailsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
};
v2.BadgeDetailsInputData = v4;
v1.default:register(v2.BadgeDetailsInputData);
v4 = {};
v4.__index = v4;
local l_v4_6 = v4 --[[ copy: 4 -> 11 ]];
v4.new = function(v251) --[[ Line: 3380 ]] --[[ Name: new ]]
    -- upvalues: l_v4_6 (copy)
    return (setmetatable({
        info_table = if not (v251 ~= nil) or v251.info_table == nil then nil else v251.info_table, 
        action_module = if not (v251 ~= nil) or v251.action_module == nil then nil else v251.action_module, 
        overflow_menu = if not (v251 ~= nil) or v251.overflow_menu == nil then nil else v251.overflow_menu
    }, l_v4_6));
end;
v4.encode = function(v252) --[[ Line: 3390 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v253 = buffer.create(0);
    local v254 = 0;
    if v252.info_table ~= nil then
        local v255 = v252.info_table:encode();
        local v256, v257 = v0.writeTag(v253, v254, 1, v0.wireTypes.lengthDelimited);
        v256, v257 = v0.writeBuffer(v256, v257, v255, buffer.len(v255));
        v253 = v256;
        v254 = v257;
    end;
    if v252.action_module ~= nil then
        local v258 = v252.action_module:encode();
        local v259, v260 = v0.writeTag(v253, v254, 2, v0.wireTypes.lengthDelimited);
        v259, v260 = v0.writeBuffer(v259, v260, v258, buffer.len(v258));
        v253 = v259;
        v254 = v260;
    end;
    if v252.overflow_menu ~= nil then
        local v261 = v252.overflow_menu:encode();
        local v262, v263 = v0.writeTag(v253, v254, 3, v0.wireTypes.lengthDelimited);
        v262, v263 = v0.writeBuffer(v262, v263, v261, buffer.len(v261));
        v253 = v262;
        v254 = v263;
    end;
    local v264 = buffer.create(v254);
    buffer.copy(v264, 0, v253, 0, v254);
    return v264;
end;
v4.decode = function(v265) --[[ Line: 3417 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_6 (copy), v0 (copy), v2 (copy)
    local v266 = l_v4_6.new();
    local v267 = 0;
    while v267 < buffer.len(v265) do
        local v268 = nil;
        local v269 = nil;
        local v270, v271, v272 = v0.readTag(v265, v267);
        v268 = v270;
        v269 = v271;
        v267 = v272;
        if v269 == v0.wireTypes.varint then
            v270 = nil;
            v271, v272 = v0.readVarInt(v265, v267);
            v270 = v271;
            v267 = v272;
        elseif v269 == v0.wireTypes.lengthDelimited then
            if v268 == 1 then
                v270 = nil;
                v271, v272 = v0.readBuffer(v265, v267);
                v270 = v271;
                v267 = v272;
                v266.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(v270);
            elseif v268 == 2 then
                v270 = nil;
                v271, v272 = v0.readBuffer(v265, v267);
                v270 = v271;
                v267 = v272;
                v266.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(v270);
            elseif v268 == 3 then
                v270 = nil;
                v271, v272 = v0.readBuffer(v265, v267);
                v270 = v271;
                v267 = v272;
                v266.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(v270);
            else
                v270 = nil;
                v271, v272 = v0.readVarInt(v265, v267);
                v267 = v272 + v271;
            end;
        elseif v269 == v0.wireTypes.i32 then
            v270 = nil;
            v271, v272 = v0.readFixed32(v265, v267);
            v270 = v271;
            v267 = v272;
        elseif v269 == v0.wireTypes.i64 then
            v270 = nil;
            v271, v272 = v0.readFixed64(v265, v267);
            v270 = v271;
            v267 = v272;
        else
            error("Unsupported wire type: " .. v269);
        end;
    end;
    return v266;
end;
v4.jsonEncode = function(v273) --[[ Line: 3470 ]] --[[ Name: jsonEncode ]]
    local v274 = {};
    if v273.info_table ~= nil then
        v274.infoTable = v273.info_table:jsonEncode();
    end;
    if v273.action_module ~= nil then
        v274.actionModule = v273.action_module:jsonEncode();
    end;
    if v273.overflow_menu ~= nil then
        v274.overflowMenu = v273.overflow_menu:jsonEncode();
    end;
    return v274;
end;
v4.jsonDecode = function(v275) --[[ Line: 3488 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_6 (copy), v2 (copy)
    local v276 = l_v4_6.new();
    if v275.info_table ~= nil then
        v276.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v275.info_table);
    end;
    if v275.infoTable ~= nil then
        v276.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v275.infoTable);
    end;
    if v275.action_module ~= nil then
        v276.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v275.action_module);
    end;
    if v275.actionModule ~= nil then
        v276.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v275.actionModule);
    end;
    if v275.overflow_menu ~= nil then
        v276.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v275.overflow_menu);
    end;
    if v275.overflowMenu ~= nil then
        v276.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v275.overflowMenu);
    end;
    return v276;
end;
v4.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
};
v2.BadgeDetailsInputData_LocalizedLiterals = v4;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals);
v4 = {};
v4.__index = v4;
local l_v4_7 = v4 --[[ copy: 4 -> 12 ]];
v4.new = function(v278) --[[ Line: 3539 ]] --[[ Name: new ]]
    -- upvalues: l_v4_7 (copy)
    return (setmetatable({
        type_label = (not (v278 ~= nil) or v278.type_label == nil) and "" or v278.type_label, 
        earned_label = (not (v278 ~= nil) or v278.earned_label == nil) and "" or v278.earned_label, 
        updated_label = (not (v278 ~= nil) or v278.updated_label == nil) and "" or v278.updated_label, 
        experience_label = (not (v278 ~= nil) or v278.experience_label == nil) and "" or v278.experience_label, 
        rarity_label = (not (v278 ~= nil) or v278.rarity_label == nil) and "" or v278.rarity_label, 
        won_yesterday_label = (not (v278 ~= nil) or v278.won_yesterday_label == nil) and "" or v278.won_yesterday_label, 
        won_ever_label = (not (v278 ~= nil) or v278.won_ever_label == nil) and "" or v278.won_ever_label
    }, l_v4_7));
end;
v4.encode = function(v279) --[[ Line: 3558 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v280 = buffer.create(0);
    local v281 = 0;
    if v279.type_label ~= nil and v279.type_label ~= "" then
        local v282, v283 = v0.writeTag(v280, v281, 1, v0.wireTypes.lengthDelimited);
        v282, v283 = v0.writeString(v282, v283, v279.type_label);
        v280 = v282;
        v281 = v283;
    end;
    if v279.earned_label ~= nil and v279.earned_label ~= "" then
        local v284, v285 = v0.writeTag(v280, v281, 2, v0.wireTypes.lengthDelimited);
        v284, v285 = v0.writeString(v284, v285, v279.earned_label);
        v280 = v284;
        v281 = v285;
    end;
    if v279.updated_label ~= nil and v279.updated_label ~= "" then
        local v286, v287 = v0.writeTag(v280, v281, 3, v0.wireTypes.lengthDelimited);
        v286, v287 = v0.writeString(v286, v287, v279.updated_label);
        v280 = v286;
        v281 = v287;
    end;
    if v279.experience_label ~= nil and v279.experience_label ~= "" then
        local v288, v289 = v0.writeTag(v280, v281, 4, v0.wireTypes.lengthDelimited);
        v288, v289 = v0.writeString(v288, v289, v279.experience_label);
        v280 = v288;
        v281 = v289;
    end;
    if v279.rarity_label ~= nil and v279.rarity_label ~= "" then
        local v290, v291 = v0.writeTag(v280, v281, 5, v0.wireTypes.lengthDelimited);
        v290, v291 = v0.writeString(v290, v291, v279.rarity_label);
        v280 = v290;
        v281 = v291;
    end;
    if v279.won_yesterday_label ~= nil and v279.won_yesterday_label ~= "" then
        local v292, v293 = v0.writeTag(v280, v281, 6, v0.wireTypes.lengthDelimited);
        v292, v293 = v0.writeString(v292, v293, v279.won_yesterday_label);
        v280 = v292;
        v281 = v293;
    end;
    if v279.won_ever_label ~= nil and v279.won_ever_label ~= "" then
        local v294, v295 = v0.writeTag(v280, v281, 7, v0.wireTypes.lengthDelimited);
        v294, v295 = v0.writeString(v294, v295, v279.won_ever_label);
        v280 = v294;
        v281 = v295;
    end;
    local v296 = buffer.create(v281);
    buffer.copy(v296, 0, v280, 0, v281);
    return v296;
end;
v4.decode = function(v297) --[[ Line: 3604 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_7 (copy), v0 (copy)
    local v298 = l_v4_7.new();
    local v299 = 0;
    while v299 < buffer.len(v297) do
        local v300 = nil;
        local v301 = nil;
        local v302, v303, v304 = v0.readTag(v297, v299);
        v300 = v302;
        v301 = v303;
        v299 = v304;
        if v301 == v0.wireTypes.varint then
            v302 = nil;
            v303, v304 = v0.readVarInt(v297, v299);
            v302 = v303;
            v299 = v304;
        elseif v301 == v0.wireTypes.lengthDelimited then
            if v300 == 1 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.type_label = buffer.tostring(v302);
            elseif v300 == 2 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.earned_label = buffer.tostring(v302);
            elseif v300 == 3 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.updated_label = buffer.tostring(v302);
            elseif v300 == 4 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.experience_label = buffer.tostring(v302);
            elseif v300 == 5 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.rarity_label = buffer.tostring(v302);
            elseif v300 == 6 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.won_yesterday_label = buffer.tostring(v302);
            elseif v300 == 7 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.won_ever_label = buffer.tostring(v302);
            else
                v302 = nil;
                v303, v304 = v0.readVarInt(v297, v299);
                v299 = v304 + v303;
            end;
        elseif v301 == v0.wireTypes.i32 then
            v302 = nil;
            v303, v304 = v0.readFixed32(v297, v299);
            v302 = v303;
            v299 = v304;
        elseif v301 == v0.wireTypes.i64 then
            v302 = nil;
            v303, v304 = v0.readFixed64(v297, v299);
            v302 = v303;
            v299 = v304;
        else
            error("Unsupported wire type: " .. v301);
        end;
    end;
    return v298;
end;
v4.jsonEncode = function(v305) --[[ Line: 3679 ]] --[[ Name: jsonEncode ]]
    local v306 = {};
    if v305.type_label ~= nil and v305.type_label ~= "" then
        v306.typeLabel = v305.type_label;
    end;
    if v305.earned_label ~= nil and v305.earned_label ~= "" then
        v306.earnedLabel = v305.earned_label;
    end;
    if v305.updated_label ~= nil and v305.updated_label ~= "" then
        v306.updatedLabel = v305.updated_label;
    end;
    if v305.experience_label ~= nil and v305.experience_label ~= "" then
        v306.experienceLabel = v305.experience_label;
    end;
    if v305.rarity_label ~= nil and v305.rarity_label ~= "" then
        v306.rarityLabel = v305.rarity_label;
    end;
    if v305.won_yesterday_label ~= nil and v305.won_yesterday_label ~= "" then
        v306.wonYesterdayLabel = v305.won_yesterday_label;
    end;
    if v305.won_ever_label ~= nil and v305.won_ever_label ~= "" then
        v306.wonEverLabel = v305.won_ever_label;
    end;
    return v306;
end;
v4.jsonDecode = function(v307) --[[ Line: 3715 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_7 (copy)
    local v308 = l_v4_7.new();
    if v307.type_label ~= nil then
        v308.type_label = v307.type_label;
    end;
    if v307.typeLabel ~= nil then
        v308.type_label = v307.typeLabel;
    end;
    if v307.earned_label ~= nil then
        v308.earned_label = v307.earned_label;
    end;
    if v307.earnedLabel ~= nil then
        v308.earned_label = v307.earnedLabel;
    end;
    if v307.updated_label ~= nil then
        v308.updated_label = v307.updated_label;
    end;
    if v307.updatedLabel ~= nil then
        v308.updated_label = v307.updatedLabel;
    end;
    if v307.experience_label ~= nil then
        v308.experience_label = v307.experience_label;
    end;
    if v307.experienceLabel ~= nil then
        v308.experience_label = v307.experienceLabel;
    end;
    if v307.rarity_label ~= nil then
        v308.rarity_label = v307.rarity_label;
    end;
    if v307.rarityLabel ~= nil then
        v308.rarity_label = v307.rarityLabel;
    end;
    if v307.won_yesterday_label ~= nil then
        v308.won_yesterday_label = v307.won_yesterday_label;
    end;
    if v307.wonYesterdayLabel ~= nil then
        v308.won_yesterday_label = v307.wonYesterdayLabel;
    end;
    if v307.won_ever_label ~= nil then
        v308.won_ever_label = v307.won_ever_label;
    end;
    if v307.wonEverLabel ~= nil then
        v308.won_ever_label = v307.wonEverLabel;
    end;
    return v308;
end;
v4.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
};
v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable = v4;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable);
v4 = {};
v4.__index = v4;
local l_v4_8 = v4 --[[ copy: 4 -> 13 ]];
v4.new = function(v310) --[[ Line: 3795 ]] --[[ Name: new ]]
    -- upvalues: l_v4_8 (copy)
    return (setmetatable({
        share = (not (v310 ~= nil) or v310.share == nil) and "" or v310.share, 
        report = (not (v310 ~= nil) or v310.report == nil) and "" or v310.report
    }, l_v4_8));
end;
v4.encode = function(v311) --[[ Line: 3807 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v312 = buffer.create(0);
    local v313 = 0;
    if v311.share ~= nil and v311.share ~= "" then
        local v314, v315 = v0.writeTag(v312, v313, 1, v0.wireTypes.lengthDelimited);
        v314, v315 = v0.writeString(v314, v315, v311.share);
        v312 = v314;
        v313 = v315;
    end;
    if v311.report ~= nil and v311.report ~= "" then
        local v316, v317 = v0.writeTag(v312, v313, 2, v0.wireTypes.lengthDelimited);
        v316, v317 = v0.writeString(v316, v317, v311.report);
        v312 = v316;
        v313 = v317;
    end;
    local v318 = buffer.create(v313);
    buffer.copy(v318, 0, v312, 0, v313);
    return v318;
end;
v4.decode = function(v319) --[[ Line: 3828 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_8 (copy), v0 (copy)
    local v320 = l_v4_8.new();
    local v321 = 0;
    while v321 < buffer.len(v319) do
        local v322 = nil;
        local v323 = nil;
        local v324, v325, v326 = v0.readTag(v319, v321);
        v322 = v324;
        v323 = v325;
        v321 = v326;
        if v323 == v0.wireTypes.varint then
            v324 = nil;
            v325, v326 = v0.readVarInt(v319, v321);
            v324 = v325;
            v321 = v326;
        elseif v323 == v0.wireTypes.lengthDelimited then
            if v322 == 1 then
                v324 = nil;
                v325, v326 = v0.readBuffer(v319, v321);
                v324 = v325;
                v321 = v326;
                v320.share = buffer.tostring(v324);
            elseif v322 == 2 then
                v324 = nil;
                v325, v326 = v0.readBuffer(v319, v321);
                v324 = v325;
                v321 = v326;
                v320.report = buffer.tostring(v324);
            else
                v324 = nil;
                v325, v326 = v0.readVarInt(v319, v321);
                v321 = v326 + v325;
            end;
        elseif v323 == v0.wireTypes.i32 then
            v324 = nil;
            v325, v326 = v0.readFixed32(v319, v321);
            v324 = v325;
            v321 = v326;
        elseif v323 == v0.wireTypes.i64 then
            v324 = nil;
            v325, v326 = v0.readFixed64(v319, v321);
            v324 = v325;
            v321 = v326;
        else
            error("Unsupported wire type: " .. v323);
        end;
    end;
    return v320;
end;
v4.jsonEncode = function(v327) --[[ Line: 3878 ]] --[[ Name: jsonEncode ]]
    local v328 = {};
    if v327.share ~= nil and v327.share ~= "" then
        v328.share = v327.share;
    end;
    if v327.report ~= nil and v327.report ~= "" then
        v328.report = v327.report;
    end;
    return v328;
end;
v4.jsonDecode = function(v329) --[[ Line: 3894 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_8 (copy)
    local v330 = l_v4_8.new();
    if v329.share ~= nil then
        v330.share = v329.share;
    end;
    if v329.report ~= nil then
        v330.report = v329.report;
    end;
    return v330;
end;
v4.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
};
v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule = v4;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule);
v4 = {};
v4.__index = v4;
local l_v4_9 = v4 --[[ copy: 4 -> 14 ]];
v4.new = function(v332) --[[ Line: 3926 ]] --[[ Name: new ]]
    -- upvalues: l_v4_9 (copy)
    return (setmetatable({
        report = (not (v332 ~= nil) or v332.report == nil) and "" or v332.report, 
        remove = (not (v332 ~= nil) or v332.remove == nil) and "" or v332.remove
    }, l_v4_9));
end;
v4.encode = function(v333) --[[ Line: 3938 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v334 = buffer.create(0);
    local v335 = 0;
    if v333.report ~= nil and v333.report ~= "" then
        local v336, v337 = v0.writeTag(v334, v335, 1, v0.wireTypes.lengthDelimited);
        v336, v337 = v0.writeString(v336, v337, v333.report);
        v334 = v336;
        v335 = v337;
    end;
    if v333.remove ~= nil and v333.remove ~= "" then
        local v338, v339 = v0.writeTag(v334, v335, 2, v0.wireTypes.lengthDelimited);
        v338, v339 = v0.writeString(v338, v339, v333.remove);
        v334 = v338;
        v335 = v339;
    end;
    local v340 = buffer.create(v335);
    buffer.copy(v340, 0, v334, 0, v335);
    return v340;
end;
v4.decode = function(v341) --[[ Line: 3959 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_9 (copy), v0 (copy)
    local v342 = l_v4_9.new();
    local v343 = 0;
    while v343 < buffer.len(v341) do
        local v344 = nil;
        local v345 = nil;
        local v346, v347, v348 = v0.readTag(v341, v343);
        v344 = v346;
        v345 = v347;
        v343 = v348;
        if v345 == v0.wireTypes.varint then
            v346 = nil;
            v347, v348 = v0.readVarInt(v341, v343);
            v346 = v347;
            v343 = v348;
        elseif v345 == v0.wireTypes.lengthDelimited then
            if v344 == 1 then
                v346 = nil;
                v347, v348 = v0.readBuffer(v341, v343);
                v346 = v347;
                v343 = v348;
                v342.report = buffer.tostring(v346);
            elseif v344 == 2 then
                v346 = nil;
                v347, v348 = v0.readBuffer(v341, v343);
                v346 = v347;
                v343 = v348;
                v342.remove = buffer.tostring(v346);
            else
                v346 = nil;
                v347, v348 = v0.readVarInt(v341, v343);
                v343 = v348 + v347;
            end;
        elseif v345 == v0.wireTypes.i32 then
            v346 = nil;
            v347, v348 = v0.readFixed32(v341, v343);
            v346 = v347;
            v343 = v348;
        elseif v345 == v0.wireTypes.i64 then
            v346 = nil;
            v347, v348 = v0.readFixed64(v341, v343);
            v346 = v347;
            v343 = v348;
        else
            error("Unsupported wire type: " .. v345);
        end;
    end;
    return v342;
end;
v4.jsonEncode = function(v349) --[[ Line: 4009 ]] --[[ Name: jsonEncode ]]
    local v350 = {};
    if v349.report ~= nil and v349.report ~= "" then
        v350.report = v349.report;
    end;
    if v349.remove ~= nil and v349.remove ~= "" then
        v350.remove = v349.remove;
    end;
    return v350;
end;
v4.jsonDecode = function(v351) --[[ Line: 4025 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_9 (copy)
    local v352 = l_v4_9.new();
    if v351.report ~= nil then
        v352.report = v351.report;
    end;
    if v351.remove ~= nil then
        v352.remove = v351.remove;
    end;
    return v352;
end;
v4.descriptor = {
    name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
};
v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = v4;
v1.default:register(v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu);
v4 = {};
v4.__index = v4;
local l_v4_10 = v4 --[[ copy: 4 -> 15 ]];
v4.new = function(_) --[[ Line: 4056 ]] --[[ Name: new ]]
    -- upvalues: l_v4_10 (copy)
    return (setmetatable({}, l_v4_10));
end;
v4.encode = function(_) --[[ Line: 4060 ]] --[[ Name: encode ]]
    local v356 = buffer.create(0);
    local v357 = buffer.create(0);
    buffer.copy(v357, 0, v356, 0, 0);
    return v357;
end;
v4.decode = function(v358) --[[ Line: 4069 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_10 (copy), v0 (copy)
    local v359 = l_v4_10.new();
    local v360 = 0;
    while v360 < buffer.len(v358) do
        local v361 = nil;
        local v362 = nil;
        local v363, v364, v365 = v0.readTag(v358, v360);
        v361 = v363;
        v362 = v364;
        v360 = v365;
        if v362 == v0.wireTypes.varint then
            v363 = nil;
            v364, v365 = v0.readVarInt(v358, v360);
            v363 = v364;
            v360 = v365;
        elseif v362 == v0.wireTypes.lengthDelimited then
            v363 = nil;
            v364, v365 = v0.readVarInt(v358, v360);
            v360 = v365 + v364;
        elseif v362 == v0.wireTypes.i32 then
            v363 = nil;
            v364, v365 = v0.readFixed32(v358, v360);
            v363 = v364;
            v360 = v365;
        elseif v362 == v0.wireTypes.i64 then
            v363 = nil;
            v364, v365 = v0.readFixed64(v358, v360);
            v363 = v364;
            v360 = v365;
        else
            error("Unsupported wire type: " .. v362);
        end;
    end;
    return v359;
end;
v4.jsonEncode = function(_) --[[ Line: 4107 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 4113 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_10 (copy)
    return (l_v4_10.new());
end;
v4.descriptor = {
    name = "StaticInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
};
v2.StaticInputData = v4;
v1.default:register(v2.StaticInputData);
v4 = {};
v4.__index = v4;
local l_v4_11 = v4 --[[ copy: 4 -> 16 ]];
v4.new = function(v369) --[[ Line: 4133 ]] --[[ Name: new ]]
    -- upvalues: l_v4_11 (copy)
    return (setmetatable({
        universe_id = (not (v369 ~= nil) or v369.universe_id == nil) and "" or v369.universe_id, 
        creator_key = (not (v369 ~= nil) or v369.creator_key == nil) and "" or v369.creator_key, 
        entry_map = if not (v369 ~= nil) or v369.entry_map == nil then {} else v369.entry_map, 
        entry_order = if not (v369 ~= nil) or v369.entry_order == nil then {} else v369.entry_order
    }, l_v4_11));
end;
v4.encode = function(v370) --[[ Line: 4144 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v371 = buffer.create(0);
    local v372 = 0;
    if v370.universe_id ~= nil and v370.universe_id ~= "" then
        local v373, v374 = v0.writeTag(v371, v372, 1, v0.wireTypes.lengthDelimited);
        v373, v374 = v0.writeString(v373, v374, v370.universe_id);
        v371 = v373;
        v372 = v374;
    end;
    if v370.creator_key ~= nil and v370.creator_key ~= "" then
        local v375, v376 = v0.writeTag(v371, v372, 2, v0.wireTypes.lengthDelimited);
        v375, v376 = v0.writeString(v375, v376, v370.creator_key);
        v371 = v375;
        v372 = v376;
    end;
    if v370.entry_map ~= nil and next(v370.entry_map) ~= nil then
        for v377, v378 in v370.entry_map do
            local v379 = buffer.create(0);
            local v380, v381 = v0.writeTag(v379, 0, 1, v0.wireTypes.lengthDelimited);
            v380, v381 = v0.writeString(v380, v381, v377);
            v379 = v380;
            local l_v381_0 = v381;
            v380 = v378:encode();
            local v383;
            v381, v383 = v0.writeTag(v379, l_v381_0, 2, v0.wireTypes.lengthDelimited);
            v381, v383 = v0.writeBuffer(v381, v383, v380, buffer.len(v380));
            v379 = v381;
            l_v381_0 = v383;
            v381, v383 = v0.writeTag(v371, v372, 3, v0.wireTypes.lengthDelimited);
            v381, v383 = v0.writeBuffer(v381, v383, v379, l_v381_0);
            v371 = v381;
            v372 = v383;
        end;
    end;
    if v370.entry_order ~= nil and #v370.entry_order > 0 then
        for _, v385 in v370.entry_order do
            local v386, v387 = v0.writeTag(v371, v372, 4, v0.wireTypes.lengthDelimited);
            v386, v387 = v0.writeString(v386, v387, v385);
            v371 = v386;
            v372 = v387;
        end;
    end;
    local v388 = buffer.create(v372);
    buffer.copy(v388, 0, v371, 0, v372);
    return v388;
end;
v4.decode = function(v389) --[[ Line: 4184 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_11 (copy), v0 (copy), v2 (copy)
    local v390 = l_v4_11.new();
    local v391 = 0;
    while v391 < buffer.len(v389) do
        local v392 = nil;
        local v393 = nil;
        local v394, v395, v396 = v0.readTag(v389, v391);
        v392 = v394;
        v393 = v395;
        v391 = v396;
        if v393 == v0.wireTypes.varint then
            v394 = nil;
            v395, v396 = v0.readVarInt(v389, v391);
            v394 = v395;
            v391 = v396;
        elseif v393 == v0.wireTypes.lengthDelimited then
            if v392 == 1 then
                v394 = nil;
                v395, v396 = v0.readBuffer(v389, v391);
                v394 = v395;
                v391 = v396;
                v390.universe_id = buffer.tostring(v394);
            elseif v392 == 2 then
                v394 = nil;
                v395, v396 = v0.readBuffer(v389, v391);
                v394 = v395;
                v391 = v396;
                v390.creator_key = buffer.tostring(v394);
            elseif v392 == 3 then
                v394 = nil;
                v395, v396 = v0.readBuffer(v389, v391);
                v394 = v395;
                v391 = v396;
                v395 = v2.ExperienceDetailsFeedInputData_EntryMapEntry.decode(v394);
                v396 = v2.FeedEntry.new();
                v390.entry_map[v395.key or ""] = v395.value or v396;
            elseif v392 == 4 then
                v394 = nil;
                v395, v396 = v0.readBuffer(v389, v391);
                v394 = v395;
                v391 = v396;
                table.insert(v390.entry_order, buffer.tostring(v394));
            else
                v394 = nil;
                v395, v396 = v0.readVarInt(v389, v391);
                v391 = v396 + v395;
            end;
        elseif v393 == v0.wireTypes.i32 then
            v394 = nil;
            v395, v396 = v0.readFixed32(v389, v391);
            v394 = v395;
            v391 = v396;
        elseif v393 == v0.wireTypes.i64 then
            v394 = nil;
            v395, v396 = v0.readFixed64(v389, v391);
            v394 = v395;
            v391 = v396;
        else
            error("Unsupported wire type: " .. v393);
        end;
    end;
    return v390;
end;
v4.jsonEncode = function(v397) --[[ Line: 4249 ]] --[[ Name: jsonEncode ]]
    local v398 = {};
    if v397.universe_id ~= nil and v397.universe_id ~= "" then
        v398.universeId = v397.universe_id;
    end;
    if v397.creator_key ~= nil and v397.creator_key ~= "" then
        v398.creatorKey = v397.creator_key;
    end;
    if v397.entry_map ~= nil and next(v397.entry_map) ~= nil then
        local v399 = {};
        for v400, v401 in v397.entry_map do
            v399[v400] = v401:jsonEncode();
        end;
        v398.entryMap = v399;
    end;
    if v397.entry_order ~= nil and #v397.entry_order > 0 then
        local v402 = {};
        for _, v404 in v397.entry_order do
            table.insert(v402, v404);
        end;
        v398.entryOrder = v402;
    end;
    return v398;
end;
v4.jsonDecode = function(v405) --[[ Line: 4279 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_11 (copy), v2 (copy)
    local v406 = l_v4_11.new();
    if v405.universe_id ~= nil then
        v406.universe_id = v405.universe_id;
    end;
    if v405.universeId ~= nil then
        v406.universe_id = v405.universeId;
    end;
    if v405.creator_key ~= nil then
        v406.creator_key = v405.creator_key;
    end;
    if v405.creatorKey ~= nil then
        v406.creator_key = v405.creatorKey;
    end;
    if v405.entry_map ~= nil then
        local v407 = {};
        for v408, v409 in v405.entry_map do
            v407[v408] = v2.FeedEntry.jsonDecode(v409);
        end;
        v406.entry_map = v407;
    end;
    if v405.entryMap ~= nil then
        local v410 = {};
        for v411, v412 in v405.entryMap do
            v410[v411] = v2.FeedEntry.jsonDecode(v412);
        end;
        v406.entry_map = v410;
    end;
    if v405.entry_order ~= nil then
        local v413 = {};
        for _, v415 in v405.entry_order do
            table.insert(v413, v415);
        end;
        v406.entry_order = v413;
    end;
    if v405.entryOrder ~= nil then
        local v416 = {};
        for _, v418 in v405.entryOrder do
            table.insert(v416, v418);
        end;
        v406.entry_order = v416;
    end;
    return v406;
end;
v4.descriptor = {
    name = "ExperienceDetailsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
};
v2.ExperienceDetailsFeedInputData = v4;
v1.default:register(v2.ExperienceDetailsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_12 = v4 --[[ copy: 4 -> 17 ]];
v4.new = function(v420) --[[ Line: 4351 ]] --[[ Name: new ]]
    -- upvalues: l_v4_12 (copy)
    return (setmetatable({
        key = (not (v420 ~= nil) or v420.key == nil) and "" or v420.key, 
        value = if not (v420 ~= nil) or v420.value == nil then nil else v420.value
    }, l_v4_12));
end;
v4.encode = function(v421) --[[ Line: 4360 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v422 = buffer.create(0);
    local v423 = 0;
    if v421.key ~= nil and v421.key ~= "" then
        local v424, v425 = v0.writeTag(v422, v423, 1, v0.wireTypes.lengthDelimited);
        v424, v425 = v0.writeString(v424, v425, v421.key);
        v422 = v424;
        v423 = v425;
    end;
    if v421.value ~= nil then
        local v426 = v421.value:encode();
        local v427, v428 = v0.writeTag(v422, v423, 2, v0.wireTypes.lengthDelimited);
        v427, v428 = v0.writeBuffer(v427, v428, v426, buffer.len(v426));
        v422 = v427;
        v423 = v428;
    end;
    local v429 = buffer.create(v423);
    buffer.copy(v429, 0, v422, 0, v423);
    return v429;
end;
v4.decode = function(v430) --[[ Line: 4382 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_12 (copy), v0 (copy), v2 (copy)
    local v431 = l_v4_12.new();
    local v432 = 0;
    while v432 < buffer.len(v430) do
        local v433 = nil;
        local v434 = nil;
        local v435, v436, v437 = v0.readTag(v430, v432);
        v433 = v435;
        v434 = v436;
        v432 = v437;
        if v434 == v0.wireTypes.varint then
            v435 = nil;
            v436, v437 = v0.readVarInt(v430, v432);
            v435 = v436;
            v432 = v437;
        elseif v434 == v0.wireTypes.lengthDelimited then
            if v433 == 1 then
                v435 = nil;
                v436, v437 = v0.readBuffer(v430, v432);
                v435 = v436;
                v432 = v437;
                v431.key = buffer.tostring(v435);
            elseif v433 == 2 then
                v435 = nil;
                v436, v437 = v0.readBuffer(v430, v432);
                v435 = v436;
                v432 = v437;
                v431.value = v2.FeedEntry.decode(v435);
            else
                v435 = nil;
                v436, v437 = v0.readVarInt(v430, v432);
                v432 = v437 + v436;
            end;
        elseif v434 == v0.wireTypes.i32 then
            v435 = nil;
            v436, v437 = v0.readFixed32(v430, v432);
            v435 = v436;
            v432 = v437;
        elseif v434 == v0.wireTypes.i64 then
            v435 = nil;
            v436, v437 = v0.readFixed64(v430, v432);
            v435 = v436;
            v432 = v437;
        else
            error("Unsupported wire type: " .. v434);
        end;
    end;
    return v431;
end;
v4.jsonEncode = function(v438) --[[ Line: 4432 ]] --[[ Name: jsonEncode ]]
    local v439 = {};
    if v438.key ~= nil and v438.key ~= "" then
        v439.key = v438.key;
    end;
    if v438.value ~= nil then
        v439.value = v438.value:jsonEncode();
    end;
    return v439;
end;
v4.jsonDecode = function(v440) --[[ Line: 4448 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_12 (copy), v2 (copy)
    local v441 = l_v4_12.new();
    if v440.key ~= nil then
        v441.key = v440.key;
    end;
    if v440.value ~= nil then
        v441.value = v2.FeedEntry.jsonDecode(v440.value);
    end;
    return v441;
end;
v4.descriptor = {
    name = "ExperienceDetailsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.ExperienceDetailsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.ExperienceDetailsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_13 = v4 --[[ copy: 4 -> 18 ]];
v4.new = function(v443) --[[ Line: 4478 ]] --[[ Name: new ]]
    -- upvalues: l_v4_13 (copy)
    return (setmetatable({
        universe_id = (not (v443 ~= nil) or v443.universe_id == nil) and "" or v443.universe_id
    }, l_v4_13));
end;
v4.encode = function(v444) --[[ Line: 4486 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v445 = buffer.create(0);
    local v446 = 0;
    if v444.universe_id ~= nil and v444.universe_id ~= "" then
        local v447, v448 = v0.writeTag(v445, v446, 1, v0.wireTypes.lengthDelimited);
        v447, v448 = v0.writeString(v447, v448, v444.universe_id);
        v445 = v447;
        v446 = v448;
    end;
    local v449 = buffer.create(v446);
    buffer.copy(v449, 0, v445, 0, v446);
    return v449;
end;
v4.decode = function(v450) --[[ Line: 4500 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_13 (copy), v0 (copy)
    local v451 = l_v4_13.new();
    local v452 = 0;
    while v452 < buffer.len(v450) do
        local v453 = nil;
        local v454 = nil;
        local v455, v456, v457 = v0.readTag(v450, v452);
        v453 = v455;
        v454 = v456;
        v452 = v457;
        if v454 == v0.wireTypes.varint then
            v455 = nil;
            v456, v457 = v0.readVarInt(v450, v452);
            v455 = v456;
            v452 = v457;
        elseif v454 == v0.wireTypes.lengthDelimited then
            if v453 == 1 then
                v455 = nil;
                v456, v457 = v0.readBuffer(v450, v452);
                v455 = v456;
                v452 = v457;
                v451.universe_id = buffer.tostring(v455);
            else
                v455 = nil;
                v456, v457 = v0.readVarInt(v450, v452);
                v452 = v457 + v456;
            end;
        elseif v454 == v0.wireTypes.i32 then
            v455 = nil;
            v456, v457 = v0.readFixed32(v450, v452);
            v455 = v456;
            v452 = v457;
        elseif v454 == v0.wireTypes.i64 then
            v455 = nil;
            v456, v457 = v0.readFixed64(v450, v452);
            v455 = v456;
            v452 = v457;
        else
            error("Unsupported wire type: " .. v454);
        end;
    end;
    return v451;
end;
v4.jsonEncode = function(v458) --[[ Line: 4543 ]] --[[ Name: jsonEncode ]]
    local v459 = {};
    if v458.universe_id ~= nil and v458.universe_id ~= "" then
        v459.universeId = v458.universe_id;
    end;
    return v459;
end;
v4.jsonDecode = function(v460) --[[ Line: 4553 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_13 (copy)
    local v461 = l_v4_13.new();
    if v460.universe_id ~= nil then
        v461.universe_id = v460.universe_id;
    end;
    if v460.universeId ~= nil then
        v461.universe_id = v460.universeId;
    end;
    return v461;
end;
v4.descriptor = {
    name = "ExperienceDetailsActionBarInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
};
v2.ExperienceDetailsActionBarInputData = v4;
v1.default:register(v2.ExperienceDetailsActionBarInputData);
v4 = {};
v4.__index = v4;
local l_v4_14 = v4 --[[ copy: 4 -> 19 ]];
v4.new = function(v463) --[[ Line: 4583 ]] --[[ Name: new ]]
    -- upvalues: l_v4_14 (copy)
    return (setmetatable({
        universe_id = (not (v463 ~= nil) or v463.universe_id == nil) and "" or v463.universe_id, 
        creator_key = (not (v463 ~= nil) or v463.creator_key == nil) and "" or v463.creator_key
    }, l_v4_14));
end;
v4.encode = function(v464) --[[ Line: 4592 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v465 = buffer.create(0);
    local v466 = 0;
    if v464.universe_id ~= nil and v464.universe_id ~= "" then
        local v467, v468 = v0.writeTag(v465, v466, 1, v0.wireTypes.lengthDelimited);
        v467, v468 = v0.writeString(v467, v468, v464.universe_id);
        v465 = v467;
        v466 = v468;
    end;
    if v464.creator_key ~= nil and v464.creator_key ~= "" then
        local v469, v470 = v0.writeTag(v465, v466, 2, v0.wireTypes.lengthDelimited);
        v469, v470 = v0.writeString(v469, v470, v464.creator_key);
        v465 = v469;
        v466 = v470;
    end;
    local v471 = buffer.create(v466);
    buffer.copy(v471, 0, v465, 0, v466);
    return v471;
end;
v4.decode = function(v472) --[[ Line: 4611 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_14 (copy), v0 (copy)
    local v473 = l_v4_14.new();
    local v474 = 0;
    while v474 < buffer.len(v472) do
        local v475 = nil;
        local v476 = nil;
        local v477, v478, v479 = v0.readTag(v472, v474);
        v475 = v477;
        v476 = v478;
        v474 = v479;
        if v476 == v0.wireTypes.varint then
            v477 = nil;
            v478, v479 = v0.readVarInt(v472, v474);
            v477 = v478;
            v474 = v479;
        elseif v476 == v0.wireTypes.lengthDelimited then
            if v475 == 1 then
                v477 = nil;
                v478, v479 = v0.readBuffer(v472, v474);
                v477 = v478;
                v474 = v479;
                v473.universe_id = buffer.tostring(v477);
            elseif v475 == 2 then
                v477 = nil;
                v478, v479 = v0.readBuffer(v472, v474);
                v477 = v478;
                v474 = v479;
                v473.creator_key = buffer.tostring(v477);
            else
                v477 = nil;
                v478, v479 = v0.readVarInt(v472, v474);
                v474 = v479 + v478;
            end;
        elseif v476 == v0.wireTypes.i32 then
            v477 = nil;
            v478, v479 = v0.readFixed32(v472, v474);
            v477 = v478;
            v474 = v479;
        elseif v476 == v0.wireTypes.i64 then
            v477 = nil;
            v478, v479 = v0.readFixed64(v472, v474);
            v477 = v478;
            v474 = v479;
        else
            error("Unsupported wire type: " .. v476);
        end;
    end;
    return v473;
end;
v4.jsonEncode = function(v480) --[[ Line: 4659 ]] --[[ Name: jsonEncode ]]
    local v481 = {};
    if v480.universe_id ~= nil and v480.universe_id ~= "" then
        v481.universeId = v480.universe_id;
    end;
    if v480.creator_key ~= nil and v480.creator_key ~= "" then
        v481.creatorKey = v480.creator_key;
    end;
    return v481;
end;
v4.jsonDecode = function(v482) --[[ Line: 4673 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_14 (copy)
    local v483 = l_v4_14.new();
    if v482.universe_id ~= nil then
        v483.universe_id = v482.universe_id;
    end;
    if v482.universeId ~= nil then
        v483.universe_id = v482.universeId;
    end;
    if v482.creator_key ~= nil then
        v483.creator_key = v482.creator_key;
    end;
    if v482.creatorKey ~= nil then
        v483.creator_key = v482.creatorKey;
    end;
    return v483;
end;
v4.descriptor = {
    name = "ExperienceAttributionRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
};
v2.ExperienceAttributionRowInputData = v4;
v1.default:register(v2.ExperienceAttributionRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_15 = v4 --[[ copy: 4 -> 20 ]];
v4.new = function(v485) --[[ Line: 4711 ]] --[[ Name: new ]]
    -- upvalues: l_v4_15 (copy)
    return (setmetatable({
        universe_id = (not (v485 ~= nil) or v485.universe_id == nil) and "" or v485.universe_id
    }, l_v4_15));
end;
v4.encode = function(v486) --[[ Line: 4719 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v487 = buffer.create(0);
    local v488 = 0;
    if v486.universe_id ~= nil and v486.universe_id ~= "" then
        local v489, v490 = v0.writeTag(v487, v488, 1, v0.wireTypes.lengthDelimited);
        v489, v490 = v0.writeString(v489, v490, v486.universe_id);
        v487 = v489;
        v488 = v490;
    end;
    local v491 = buffer.create(v488);
    buffer.copy(v491, 0, v487, 0, v488);
    return v491;
end;
v4.decode = function(v492) --[[ Line: 4733 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_15 (copy), v0 (copy)
    local v493 = l_v4_15.new();
    local v494 = 0;
    while v494 < buffer.len(v492) do
        local v495 = nil;
        local v496 = nil;
        local v497, v498, v499 = v0.readTag(v492, v494);
        v495 = v497;
        v496 = v498;
        v494 = v499;
        if v496 == v0.wireTypes.varint then
            v497 = nil;
            v498, v499 = v0.readVarInt(v492, v494);
            v497 = v498;
            v494 = v499;
        elseif v496 == v0.wireTypes.lengthDelimited then
            if v495 == 1 then
                v497 = nil;
                v498, v499 = v0.readBuffer(v492, v494);
                v497 = v498;
                v494 = v499;
                v493.universe_id = buffer.tostring(v497);
            else
                v497 = nil;
                v498, v499 = v0.readVarInt(v492, v494);
                v494 = v499 + v498;
            end;
        elseif v496 == v0.wireTypes.i32 then
            v497 = nil;
            v498, v499 = v0.readFixed32(v492, v494);
            v497 = v498;
            v494 = v499;
        elseif v496 == v0.wireTypes.i64 then
            v497 = nil;
            v498, v499 = v0.readFixed64(v492, v494);
            v497 = v498;
            v494 = v499;
        else
            error("Unsupported wire type: " .. v496);
        end;
    end;
    return v493;
end;
v4.jsonEncode = function(v500) --[[ Line: 4776 ]] --[[ Name: jsonEncode ]]
    local v501 = {};
    if v500.universe_id ~= nil and v500.universe_id ~= "" then
        v501.universeId = v500.universe_id;
    end;
    return v501;
end;
v4.jsonDecode = function(v502) --[[ Line: 4786 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_15 (copy)
    local v503 = l_v4_15.new();
    if v502.universe_id ~= nil then
        v503.universe_id = v502.universe_id;
    end;
    if v502.universeId ~= nil then
        v503.universe_id = v502.universeId;
    end;
    return v503;
end;
v4.descriptor = {
    name = "ExperienceActionModuleInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
};
v2.ExperienceActionModuleInputData = v4;
v1.default:register(v2.ExperienceActionModuleInputData);
v4 = {};
v4.__index = v4;
local l_v4_16 = v4 --[[ copy: 4 -> 21 ]];
v4.new = function(v505) --[[ Line: 4814 ]] --[[ Name: new ]]
    -- upvalues: l_v4_16 (copy)
    return (setmetatable({
        media_items = if not (v505 ~= nil) or v505.media_items == nil then {} else v505.media_items
    }, l_v4_16));
end;
v4.encode = function(v506) --[[ Line: 4822 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v507 = buffer.create(0);
    local v508 = 0;
    if v506.media_items ~= nil and #v506.media_items > 0 then
        for _, v510 in v506.media_items do
            local v511 = v510:encode();
            local v512, v513 = v0.writeTag(v507, v508, 1, v0.wireTypes.lengthDelimited);
            v512, v513 = v0.writeBuffer(v512, v513, v511, buffer.len(v511));
            v507 = v512;
            v508 = v513;
        end;
    end;
    local v514 = buffer.create(v508);
    buffer.copy(v514, 0, v507, 0, v508);
    return v514;
end;
v4.decode = function(v515) --[[ Line: 4839 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_16 (copy), v0 (copy), v2 (copy)
    local v516 = l_v4_16.new();
    local v517 = 0;
    while v517 < buffer.len(v515) do
        local v518 = nil;
        local v519 = nil;
        local v520, v521, v522 = v0.readTag(v515, v517);
        v518 = v520;
        v519 = v521;
        v517 = v522;
        if v519 == v0.wireTypes.varint then
            v520 = nil;
            v521, v522 = v0.readVarInt(v515, v517);
            v520 = v521;
            v517 = v522;
        elseif v519 == v0.wireTypes.lengthDelimited then
            if v518 == 1 then
                v520 = nil;
                v521, v522 = v0.readBuffer(v515, v517);
                v520 = v521;
                v517 = v522;
                table.insert(v516.media_items, v2.ExperienceMediaGalleryInputData_MediaItem.decode(v520));
            else
                v520 = nil;
                v521, v522 = v0.readVarInt(v515, v517);
                v517 = v522 + v521;
            end;
        elseif v519 == v0.wireTypes.i32 then
            v520 = nil;
            v521, v522 = v0.readFixed32(v515, v517);
            v520 = v521;
            v517 = v522;
        elseif v519 == v0.wireTypes.i64 then
            v520 = nil;
            v521, v522 = v0.readFixed64(v515, v517);
            v520 = v521;
            v517 = v522;
        else
            error("Unsupported wire type: " .. v519);
        end;
    end;
    return v516;
end;
v4.jsonEncode = function(v523) --[[ Line: 4882 ]] --[[ Name: jsonEncode ]]
    local v524 = {};
    if v523.media_items ~= nil and #v523.media_items > 0 then
        local v525 = {};
        for _, v527 in v523.media_items do
            table.insert(v525, v527:jsonEncode());
        end;
        v524.mediaItems = v525;
    end;
    return v524;
end;
v4.jsonDecode = function(v528) --[[ Line: 4896 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_16 (copy), v2 (copy)
    local v529 = l_v4_16.new();
    if v528.media_items ~= nil then
        local v530 = {};
        for _, v532 in v528.media_items do
            table.insert(v530, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v532));
        end;
        v529.media_items = v530;
    end;
    if v528.mediaItems ~= nil then
        local v533 = {};
        for _, v535 in v528.mediaItems do
            table.insert(v533, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v535));
        end;
        v529.media_items = v533;
    end;
    return v529;
end;
v4.descriptor = {
    name = "ExperienceMediaGalleryInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
};
v2.ExperienceMediaGalleryInputData = v4;
v1.default:register(v2.ExperienceMediaGalleryInputData);
v4 = {};
v4.__index = v4;
local l_v4_17 = v4 --[[ copy: 4 -> 22 ]];
v4.new = function(v537) --[[ Line: 4934 ]] --[[ Name: new ]]
    -- upvalues: l_v4_17 (copy)
    return (setmetatable({
        media_asset_id = (not (v537 ~= nil) or v537.media_asset_id == nil) and "" or v537.media_asset_id
    }, l_v4_17));
end;
v4.encode = function(v538) --[[ Line: 4942 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v539 = buffer.create(0);
    local v540 = 0;
    if v538.media_asset_id ~= nil and v538.media_asset_id ~= "" then
        local v541, v542 = v0.writeTag(v539, v540, 1, v0.wireTypes.lengthDelimited);
        v541, v542 = v0.writeString(v541, v542, v538.media_asset_id);
        v539 = v541;
        v540 = v542;
    end;
    local v543 = buffer.create(v540);
    buffer.copy(v543, 0, v539, 0, v540);
    return v543;
end;
v4.decode = function(v544) --[[ Line: 4958 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_17 (copy), v0 (copy)
    local v545 = l_v4_17.new();
    local v546 = 0;
    while v546 < buffer.len(v544) do
        local v547 = nil;
        local v548 = nil;
        local v549, v550, v551 = v0.readTag(v544, v546);
        v547 = v549;
        v548 = v550;
        v546 = v551;
        if v548 == v0.wireTypes.varint then
            v549 = nil;
            v550, v551 = v0.readVarInt(v544, v546);
            v549 = v550;
            v546 = v551;
        elseif v548 == v0.wireTypes.lengthDelimited then
            if v547 == 1 then
                v549 = nil;
                v550, v551 = v0.readBuffer(v544, v546);
                v549 = v550;
                v546 = v551;
                v545.media_asset_id = buffer.tostring(v549);
            else
                v549 = nil;
                v550, v551 = v0.readVarInt(v544, v546);
                v546 = v551 + v550;
            end;
        elseif v548 == v0.wireTypes.i32 then
            v549 = nil;
            v550, v551 = v0.readFixed32(v544, v546);
            v549 = v550;
            v546 = v551;
        elseif v548 == v0.wireTypes.i64 then
            v549 = nil;
            v550, v551 = v0.readFixed64(v544, v546);
            v549 = v550;
            v546 = v551;
        else
            error("Unsupported wire type: " .. v548);
        end;
    end;
    return v545;
end;
v4.jsonEncode = function(v552) --[[ Line: 5003 ]] --[[ Name: jsonEncode ]]
    local v553 = {};
    if v552.media_asset_id ~= nil and v552.media_asset_id ~= "" then
        v553.mediaAssetId = v552.media_asset_id;
    end;
    return v553;
end;
v4.jsonDecode = function(v554) --[[ Line: 5015 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_17 (copy)
    local v555 = l_v4_17.new();
    if v554.media_asset_id ~= nil then
        v555.media_asset_id = v554.media_asset_id;
    end;
    if v554.mediaAssetId ~= nil then
        v555.media_asset_id = v554.mediaAssetId;
    end;
    return v555;
end;
v4.descriptor = {
    name = "ExperienceMediaGalleryInputData_MediaItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
};
v2.ExperienceMediaGalleryInputData_MediaItem = v4;
v1.default:register(v2.ExperienceMediaGalleryInputData_MediaItem);
v4 = {};
v4.__index = v4;
local l_v4_18 = v4 --[[ copy: 4 -> 23 ]];
v4.new = function(v557) --[[ Line: 5045 ]] --[[ Name: new ]]
    -- upvalues: l_v4_18 (copy)
    return (setmetatable({
        universe_id = (not (v557 ~= nil) or v557.universe_id == nil) and "" or v557.universe_id
    }, l_v4_18));
end;
v4.encode = function(v558) --[[ Line: 5053 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v559 = buffer.create(0);
    local v560 = 0;
    if v558.universe_id ~= nil and v558.universe_id ~= "" then
        local v561, v562 = v0.writeTag(v559, v560, 1, v0.wireTypes.lengthDelimited);
        v561, v562 = v0.writeString(v561, v562, v558.universe_id);
        v559 = v561;
        v560 = v562;
    end;
    local v563 = buffer.create(v560);
    buffer.copy(v563, 0, v559, 0, v560);
    return v563;
end;
v4.decode = function(v564) --[[ Line: 5067 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_18 (copy), v0 (copy)
    local v565 = l_v4_18.new();
    local v566 = 0;
    while v566 < buffer.len(v564) do
        local v567 = nil;
        local v568 = nil;
        local v569, v570, v571 = v0.readTag(v564, v566);
        v567 = v569;
        v568 = v570;
        v566 = v571;
        if v568 == v0.wireTypes.varint then
            v569 = nil;
            v570, v571 = v0.readVarInt(v564, v566);
            v569 = v570;
            v566 = v571;
        elseif v568 == v0.wireTypes.lengthDelimited then
            if v567 == 1 then
                v569 = nil;
                v570, v571 = v0.readBuffer(v564, v566);
                v569 = v570;
                v566 = v571;
                v565.universe_id = buffer.tostring(v569);
            else
                v569 = nil;
                v570, v571 = v0.readVarInt(v564, v566);
                v566 = v571 + v570;
            end;
        elseif v568 == v0.wireTypes.i32 then
            v569 = nil;
            v570, v571 = v0.readFixed32(v564, v566);
            v569 = v570;
            v566 = v571;
        elseif v568 == v0.wireTypes.i64 then
            v569 = nil;
            v570, v571 = v0.readFixed64(v564, v566);
            v569 = v570;
            v566 = v571;
        else
            error("Unsupported wire type: " .. v568);
        end;
    end;
    return v565;
end;
v4.jsonEncode = function(v572) --[[ Line: 5110 ]] --[[ Name: jsonEncode ]]
    local v573 = {};
    if v572.universe_id ~= nil and v572.universe_id ~= "" then
        v573.universeId = v572.universe_id;
    end;
    return v573;
end;
v4.jsonDecode = function(v574) --[[ Line: 5120 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_18 (copy)
    local v575 = l_v4_18.new();
    if v574.universe_id ~= nil then
        v575.universe_id = v574.universe_id;
    end;
    if v574.universeId ~= nil then
        v575.universe_id = v574.universeId;
    end;
    return v575;
end;
v4.descriptor = {
    name = "ExperienceDescriptionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
};
v2.ExperienceDescriptionInputData = v4;
v1.default:register(v2.ExperienceDescriptionInputData);
v4 = {};
v4.__index = v4;
local l_v4_19 = v4 --[[ copy: 4 -> 24 ]];
v4.new = function(v577) --[[ Line: 5148 ]] --[[ Name: new ]]
    -- upvalues: l_v4_19 (copy)
    return (setmetatable({
        universe_id = (not (v577 ~= nil) or v577.universe_id == nil) and "" or v577.universe_id
    }, l_v4_19));
end;
v4.encode = function(v578) --[[ Line: 5156 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v579 = buffer.create(0);
    local v580 = 0;
    if v578.universe_id ~= nil and v578.universe_id ~= "" then
        local v581, v582 = v0.writeTag(v579, v580, 1, v0.wireTypes.lengthDelimited);
        v581, v582 = v0.writeString(v581, v582, v578.universe_id);
        v579 = v581;
        v580 = v582;
    end;
    local v583 = buffer.create(v580);
    buffer.copy(v583, 0, v579, 0, v580);
    return v583;
end;
v4.decode = function(v584) --[[ Line: 5170 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_19 (copy), v0 (copy)
    local v585 = l_v4_19.new();
    local v586 = 0;
    while v586 < buffer.len(v584) do
        local v587 = nil;
        local v588 = nil;
        local v589, v590, v591 = v0.readTag(v584, v586);
        v587 = v589;
        v588 = v590;
        v586 = v591;
        if v588 == v0.wireTypes.varint then
            v589 = nil;
            v590, v591 = v0.readVarInt(v584, v586);
            v589 = v590;
            v586 = v591;
        elseif v588 == v0.wireTypes.lengthDelimited then
            if v587 == 1 then
                v589 = nil;
                v590, v591 = v0.readBuffer(v584, v586);
                v589 = v590;
                v586 = v591;
                v585.universe_id = buffer.tostring(v589);
            else
                v589 = nil;
                v590, v591 = v0.readVarInt(v584, v586);
                v586 = v591 + v590;
            end;
        elseif v588 == v0.wireTypes.i32 then
            v589 = nil;
            v590, v591 = v0.readFixed32(v584, v586);
            v589 = v590;
            v586 = v591;
        elseif v588 == v0.wireTypes.i64 then
            v589 = nil;
            v590, v591 = v0.readFixed64(v584, v586);
            v589 = v590;
            v586 = v591;
        else
            error("Unsupported wire type: " .. v588);
        end;
    end;
    return v585;
end;
v4.jsonEncode = function(v592) --[[ Line: 5213 ]] --[[ Name: jsonEncode ]]
    local v593 = {};
    if v592.universe_id ~= nil and v592.universe_id ~= "" then
        v593.universeId = v592.universe_id;
    end;
    return v593;
end;
v4.jsonDecode = function(v594) --[[ Line: 5223 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_19 (copy)
    local v595 = l_v4_19.new();
    if v594.universe_id ~= nil then
        v595.universe_id = v594.universe_id;
    end;
    if v594.universeId ~= nil then
        v595.universe_id = v594.universeId;
    end;
    return v595;
end;
v4.descriptor = {
    name = "ExperienceStatRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
};
v2.ExperienceStatRowInputData = v4;
v1.default:register(v2.ExperienceStatRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_20 = v4 --[[ copy: 4 -> 25 ]];
v4.new = function(v597) --[[ Line: 5251 ]] --[[ Name: new ]]
    -- upvalues: l_v4_20 (copy)
    return (setmetatable({
        universe_id = (not (v597 ~= nil) or v597.universe_id == nil) and "" or v597.universe_id
    }, l_v4_20));
end;
v4.encode = function(v598) --[[ Line: 5259 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v599 = buffer.create(0);
    local v600 = 0;
    if v598.universe_id ~= nil and v598.universe_id ~= "" then
        local v601, v602 = v0.writeTag(v599, v600, 1, v0.wireTypes.lengthDelimited);
        v601, v602 = v0.writeString(v601, v602, v598.universe_id);
        v599 = v601;
        v600 = v602;
    end;
    local v603 = buffer.create(v600);
    buffer.copy(v603, 0, v599, 0, v600);
    return v603;
end;
v4.decode = function(v604) --[[ Line: 5273 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_20 (copy), v0 (copy)
    local v605 = l_v4_20.new();
    local v606 = 0;
    while v606 < buffer.len(v604) do
        local v607 = nil;
        local v608 = nil;
        local v609, v610, v611 = v0.readTag(v604, v606);
        v607 = v609;
        v608 = v610;
        v606 = v611;
        if v608 == v0.wireTypes.varint then
            v609 = nil;
            v610, v611 = v0.readVarInt(v604, v606);
            v609 = v610;
            v606 = v611;
        elseif v608 == v0.wireTypes.lengthDelimited then
            if v607 == 1 then
                v609 = nil;
                v610, v611 = v0.readBuffer(v604, v606);
                v609 = v610;
                v606 = v611;
                v605.universe_id = buffer.tostring(v609);
            else
                v609 = nil;
                v610, v611 = v0.readVarInt(v604, v606);
                v606 = v611 + v610;
            end;
        elseif v608 == v0.wireTypes.i32 then
            v609 = nil;
            v610, v611 = v0.readFixed32(v604, v606);
            v609 = v610;
            v606 = v611;
        elseif v608 == v0.wireTypes.i64 then
            v609 = nil;
            v610, v611 = v0.readFixed64(v604, v606);
            v609 = v610;
            v606 = v611;
        else
            error("Unsupported wire type: " .. v608);
        end;
    end;
    return v605;
end;
v4.jsonEncode = function(v612) --[[ Line: 5316 ]] --[[ Name: jsonEncode ]]
    local v613 = {};
    if v612.universe_id ~= nil and v612.universe_id ~= "" then
        v613.universeId = v612.universe_id;
    end;
    return v613;
end;
v4.jsonDecode = function(v614) --[[ Line: 5326 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_20 (copy)
    local v615 = l_v4_20.new();
    if v614.universe_id ~= nil then
        v615.universe_id = v614.universe_id;
    end;
    if v614.universeId ~= nil then
        v615.universe_id = v614.universeId;
    end;
    return v615;
end;
v4.descriptor = {
    name = "ExperienceInfoTableInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
};
v2.ExperienceInfoTableInputData = v4;
v1.default:register(v2.ExperienceInfoTableInputData);
v4 = {};
v4.__index = v4;
local l_v4_21 = v4 --[[ copy: 4 -> 26 ]];
v4.new = function(v617) --[[ Line: 5354 ]] --[[ Name: new ]]
    -- upvalues: l_v4_21 (copy)
    return (setmetatable({
        social_link_items = if not (v617 ~= nil) or v617.social_link_items == nil then {} else v617.social_link_items
    }, l_v4_21));
end;
v4.encode = function(v618) --[[ Line: 5360 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v619 = buffer.create(0);
    local v620 = 0;
    if v618.social_link_items ~= nil and #v618.social_link_items > 0 then
        for _, v622 in v618.social_link_items do
            local v623 = v622:encode();
            local v624, v625 = v0.writeTag(v619, v620, 1, v0.wireTypes.lengthDelimited);
            v624, v625 = v0.writeBuffer(v624, v625, v623, buffer.len(v623));
            v619 = v624;
            v620 = v625;
        end;
    end;
    local v626 = buffer.create(v620);
    buffer.copy(v626, 0, v619, 0, v620);
    return v626;
end;
v4.decode = function(v627) --[[ Line: 5377 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_21 (copy), v0 (copy), v2 (copy)
    local v628 = l_v4_21.new();
    local v629 = 0;
    while v629 < buffer.len(v627) do
        local v630 = nil;
        local v631 = nil;
        local v632, v633, v634 = v0.readTag(v627, v629);
        v630 = v632;
        v631 = v633;
        v629 = v634;
        if v631 == v0.wireTypes.varint then
            v632 = nil;
            v633, v634 = v0.readVarInt(v627, v629);
            v632 = v633;
            v629 = v634;
        elseif v631 == v0.wireTypes.lengthDelimited then
            if v630 == 1 then
                v632 = nil;
                v633, v634 = v0.readBuffer(v627, v629);
                v632 = v633;
                v629 = v634;
                table.insert(v628.social_link_items, v2.SocialLinkRowInputData_SocialLinkItem.decode(v632));
            else
                v632 = nil;
                v633, v634 = v0.readVarInt(v627, v629);
                v629 = v634 + v633;
            end;
        elseif v631 == v0.wireTypes.i32 then
            v632 = nil;
            v633, v634 = v0.readFixed32(v627, v629);
            v632 = v633;
            v629 = v634;
        elseif v631 == v0.wireTypes.i64 then
            v632 = nil;
            v633, v634 = v0.readFixed64(v627, v629);
            v632 = v633;
            v629 = v634;
        else
            error("Unsupported wire type: " .. v631);
        end;
    end;
    return v628;
end;
v4.jsonEncode = function(v635) --[[ Line: 5420 ]] --[[ Name: jsonEncode ]]
    local v636 = {};
    if v635.social_link_items ~= nil and #v635.social_link_items > 0 then
        local v637 = {};
        for _, v639 in v635.social_link_items do
            table.insert(v637, v639:jsonEncode());
        end;
        v636.socialLinkItems = v637;
    end;
    return v636;
end;
v4.jsonDecode = function(v640) --[[ Line: 5434 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_21 (copy), v2 (copy)
    local v641 = l_v4_21.new();
    if v640.social_link_items ~= nil then
        local v642 = {};
        for _, v644 in v640.social_link_items do
            table.insert(v642, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v644));
        end;
        v641.social_link_items = v642;
    end;
    if v640.socialLinkItems ~= nil then
        local v645 = {};
        for _, v647 in v640.socialLinkItems do
            table.insert(v645, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v647));
        end;
        v641.social_link_items = v645;
    end;
    return v641;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
};
v2.SocialLinkRowInputData = v4;
v1.default:register(v2.SocialLinkRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_22 = v4 --[[ copy: 4 -> 27 ]];
v4.new = function(v649) --[[ Line: 5472 ]] --[[ Name: new ]]
    -- upvalues: l_v4_22 (copy)
    return (setmetatable({
        social_link_id = (not (v649 ~= nil) or v649.social_link_id == nil) and "" or v649.social_link_id
    }, l_v4_22));
end;
v4.encode = function(v650) --[[ Line: 5480 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v651 = buffer.create(0);
    local v652 = 0;
    if v650.social_link_id ~= nil and v650.social_link_id ~= "" then
        local v653, v654 = v0.writeTag(v651, v652, 1, v0.wireTypes.lengthDelimited);
        v653, v654 = v0.writeString(v653, v654, v650.social_link_id);
        v651 = v653;
        v652 = v654;
    end;
    local v655 = buffer.create(v652);
    buffer.copy(v655, 0, v651, 0, v652);
    return v655;
end;
v4.decode = function(v656) --[[ Line: 5494 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_22 (copy), v0 (copy)
    local v657 = l_v4_22.new();
    local v658 = 0;
    while v658 < buffer.len(v656) do
        local v659 = nil;
        local v660 = nil;
        local v661, v662, v663 = v0.readTag(v656, v658);
        v659 = v661;
        v660 = v662;
        v658 = v663;
        if v660 == v0.wireTypes.varint then
            v661 = nil;
            v662, v663 = v0.readVarInt(v656, v658);
            v661 = v662;
            v658 = v663;
        elseif v660 == v0.wireTypes.lengthDelimited then
            if v659 == 1 then
                v661 = nil;
                v662, v663 = v0.readBuffer(v656, v658);
                v661 = v662;
                v658 = v663;
                v657.social_link_id = buffer.tostring(v661);
            else
                v661 = nil;
                v662, v663 = v0.readVarInt(v656, v658);
                v658 = v663 + v662;
            end;
        elseif v660 == v0.wireTypes.i32 then
            v661 = nil;
            v662, v663 = v0.readFixed32(v656, v658);
            v661 = v662;
            v658 = v663;
        elseif v660 == v0.wireTypes.i64 then
            v661 = nil;
            v662, v663 = v0.readFixed64(v656, v658);
            v661 = v662;
            v658 = v663;
        else
            error("Unsupported wire type: " .. v660);
        end;
    end;
    return v657;
end;
v4.jsonEncode = function(v664) --[[ Line: 5537 ]] --[[ Name: jsonEncode ]]
    local v665 = {};
    if v664.social_link_id ~= nil and v664.social_link_id ~= "" then
        v665.socialLinkId = v664.social_link_id;
    end;
    return v665;
end;
v4.jsonDecode = function(v666) --[[ Line: 5547 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_22 (copy)
    local v667 = l_v4_22.new();
    if v666.social_link_id ~= nil then
        v667.social_link_id = v666.social_link_id;
    end;
    if v666.socialLinkId ~= nil then
        v667.social_link_id = v666.socialLinkId;
    end;
    return v667;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData_SocialLinkItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
};
v2.SocialLinkRowInputData_SocialLinkItem = v4;
v1.default:register(v2.SocialLinkRowInputData_SocialLinkItem);
v4 = {};
v4.__index = v4;
local l_v4_23 = v4 --[[ copy: 4 -> 28 ]];
v4.new = function(v669) --[[ Line: 5577 ]] --[[ Name: new ]]
    -- upvalues: l_v4_23 (copy)
    return (setmetatable({
        title = (not (v669 ~= nil) or v669.title == nil) and "" or v669.title, 
        universe_items = if not (v669 ~= nil) or v669.universe_items == nil then {} else v669.universe_items, 
        next_page_token = (not (v669 ~= nil) or v669.next_page_token == nil) and "" or v669.next_page_token, 
        sort_id = (not (v669 ~= nil) or v669.sort_id == nil) and "" or v669.sort_id, 
        secondary_sort_id = (not (v669 ~= nil) or v669.secondary_sort_id == nil) and 0 or v669.secondary_sort_id
    }, l_v4_23));
end;
v4.encode = function(v670) --[[ Line: 5589 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v671 = buffer.create(0);
    local v672 = 0;
    if v670.title ~= nil and v670.title ~= "" then
        local v673, v674 = v0.writeTag(v671, v672, 1, v0.wireTypes.lengthDelimited);
        v673, v674 = v0.writeString(v673, v674, v670.title);
        v671 = v673;
        v672 = v674;
    end;
    if v670.universe_items ~= nil and #v670.universe_items > 0 then
        for _, v676 in v670.universe_items do
            local v677 = v676:encode();
            local v678, v679 = v0.writeTag(v671, v672, 2, v0.wireTypes.lengthDelimited);
            v678, v679 = v0.writeBuffer(v678, v679, v677, buffer.len(v677));
            v671 = v678;
            v672 = v679;
        end;
    end;
    if v670.next_page_token ~= nil and v670.next_page_token ~= "" then
        local v680, v681 = v0.writeTag(v671, v672, 3, v0.wireTypes.lengthDelimited);
        v680, v681 = v0.writeString(v680, v681, v670.next_page_token);
        v671 = v680;
        v672 = v681;
    end;
    if v670.sort_id ~= nil and v670.sort_id ~= "" then
        local v682, v683 = v0.writeTag(v671, v672, 4, v0.wireTypes.lengthDelimited);
        v682, v683 = v0.writeString(v682, v683, v670.sort_id);
        v671 = v682;
        v672 = v683;
    end;
    if v670.secondary_sort_id ~= nil and v670.secondary_sort_id ~= 0 then
        local v684, v685 = v0.writeTag(v671, v672, 5, v0.wireTypes.varint);
        v684, v685 = v0.writeVarInt(v684, v685, v670.secondary_sort_id);
        v671 = v684;
        v672 = v685;
    end;
    local v686 = buffer.create(v672);
    buffer.copy(v686, 0, v671, 0, v672);
    return v686;
end;
v4.decode = function(v687) --[[ Line: 5626 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_23 (copy), v0 (copy), v2 (copy)
    local v688 = l_v4_23.new();
    local v689 = 0;
    while v689 < buffer.len(v687) do
        local v690 = nil;
        local v691 = nil;
        local v692, v693, v694 = v0.readTag(v687, v689);
        v690 = v692;
        v691 = v693;
        v689 = v694;
        if v691 == v0.wireTypes.varint then
            if v690 == 5 then
                v692 = nil;
                v693, v694 = v0.readVarIntI32(v687, v689);
                v692 = v693;
                v689 = v694;
                v688.secondary_sort_id = v692;
            else
                v692 = nil;
                v693, v694 = v0.readVarInt(v687, v689);
                v692 = v693;
                v689 = v694;
            end;
        elseif v691 == v0.wireTypes.lengthDelimited then
            if v690 == 1 then
                v692 = nil;
                v693, v694 = v0.readBuffer(v687, v689);
                v692 = v693;
                v689 = v694;
                v688.title = buffer.tostring(v692);
            elseif v690 == 2 then
                v692 = nil;
                v693, v694 = v0.readBuffer(v687, v689);
                v692 = v693;
                v689 = v694;
                table.insert(v688.universe_items, v2.ExperienceCarouselInputData_UniverseItem.decode(v692));
            elseif v690 == 3 then
                v692 = nil;
                v693, v694 = v0.readBuffer(v687, v689);
                v692 = v693;
                v689 = v694;
                v688.next_page_token = buffer.tostring(v692);
            elseif v690 == 4 then
                v692 = nil;
                v693, v694 = v0.readBuffer(v687, v689);
                v692 = v693;
                v689 = v694;
                v688.sort_id = buffer.tostring(v692);
            else
                v692 = nil;
                v693, v694 = v0.readVarInt(v687, v689);
                v689 = v694 + v693;
            end;
        elseif v691 == v0.wireTypes.i32 then
            v692 = nil;
            v693, v694 = v0.readFixed32(v687, v689);
            v692 = v693;
            v689 = v694;
        elseif v691 == v0.wireTypes.i64 then
            v692 = nil;
            v693, v694 = v0.readFixed64(v687, v689);
            v692 = v693;
            v689 = v694;
        else
            error("Unsupported wire type: " .. v691);
        end;
    end;
    return v688;
end;
v4.jsonEncode = function(v695) --[[ Line: 5689 ]] --[[ Name: jsonEncode ]]
    local v696 = {};
    if v695.title ~= nil and v695.title ~= "" then
        v696.title = v695.title;
    end;
    if v695.universe_items ~= nil and #v695.universe_items > 0 then
        local v697 = {};
        for _, v699 in v695.universe_items do
            table.insert(v697, v699:jsonEncode());
        end;
        v696.universeItems = v697;
    end;
    if v695.next_page_token ~= nil and v695.next_page_token ~= "" then
        v696.nextPageToken = v695.next_page_token;
    end;
    if v695.sort_id ~= nil and v695.sort_id ~= "" then
        v696.sortId = v695.sort_id;
    end;
    if v695.secondary_sort_id ~= nil and v695.secondary_sort_id ~= 0 then
        v696.secondarySortId = v695.secondary_sort_id;
    end;
    return v696;
end;
v4.jsonDecode = function(v700) --[[ Line: 5719 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_23 (copy), v2 (copy)
    local v701 = l_v4_23.new();
    if v700.title ~= nil then
        v701.title = v700.title;
    end;
    if v700.universe_items ~= nil then
        local v702 = {};
        for _, v704 in v700.universe_items do
            table.insert(v702, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v704));
        end;
        v701.universe_items = v702;
    end;
    if v700.universeItems ~= nil then
        local v705 = {};
        for _, v707 in v700.universeItems do
            table.insert(v705, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v707));
        end;
        v701.universe_items = v705;
    end;
    if v700.next_page_token ~= nil then
        v701.next_page_token = v700.next_page_token;
    end;
    if v700.nextPageToken ~= nil then
        v701.next_page_token = v700.nextPageToken;
    end;
    if v700.sort_id ~= nil then
        v701.sort_id = v700.sort_id;
    end;
    if v700.sortId ~= nil then
        v701.sort_id = v700.sortId;
    end;
    if v700.secondary_sort_id ~= nil then
        v701.secondary_sort_id = v700.secondary_sort_id;
    end;
    if v700.secondarySortId ~= nil then
        v701.secondary_sort_id = v700.secondarySortId;
    end;
    return v701;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
};
v2.ExperienceCarouselInputData = v4;
v1.default:register(v2.ExperienceCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_24 = v4 --[[ copy: 4 -> 29 ]];
v4.new = function(v709) --[[ Line: 5785 ]] --[[ Name: new ]]
    -- upvalues: l_v4_24 (copy)
    return (setmetatable({
        universe_id = (not (v709 ~= nil) or v709.universe_id == nil) and "" or v709.universe_id
    }, l_v4_24));
end;
v4.encode = function(v710) --[[ Line: 5793 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v711 = buffer.create(0);
    local v712 = 0;
    if v710.universe_id ~= nil and v710.universe_id ~= "" then
        local v713, v714 = v0.writeTag(v711, v712, 1, v0.wireTypes.lengthDelimited);
        v713, v714 = v0.writeString(v713, v714, v710.universe_id);
        v711 = v713;
        v712 = v714;
    end;
    local v715 = buffer.create(v712);
    buffer.copy(v715, 0, v711, 0, v712);
    return v715;
end;
v4.decode = function(v716) --[[ Line: 5809 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_24 (copy), v0 (copy)
    local v717 = l_v4_24.new();
    local v718 = 0;
    while v718 < buffer.len(v716) do
        local v719 = nil;
        local v720 = nil;
        local v721, v722, v723 = v0.readTag(v716, v718);
        v719 = v721;
        v720 = v722;
        v718 = v723;
        if v720 == v0.wireTypes.varint then
            v721 = nil;
            v722, v723 = v0.readVarInt(v716, v718);
            v721 = v722;
            v718 = v723;
        elseif v720 == v0.wireTypes.lengthDelimited then
            if v719 == 1 then
                v721 = nil;
                v722, v723 = v0.readBuffer(v716, v718);
                v721 = v722;
                v718 = v723;
                v717.universe_id = buffer.tostring(v721);
            else
                v721 = nil;
                v722, v723 = v0.readVarInt(v716, v718);
                v718 = v723 + v722;
            end;
        elseif v720 == v0.wireTypes.i32 then
            v721 = nil;
            v722, v723 = v0.readFixed32(v716, v718);
            v721 = v722;
            v718 = v723;
        elseif v720 == v0.wireTypes.i64 then
            v721 = nil;
            v722, v723 = v0.readFixed64(v716, v718);
            v721 = v722;
            v718 = v723;
        else
            error("Unsupported wire type: " .. v720);
        end;
    end;
    return v717;
end;
v4.jsonEncode = function(v724) --[[ Line: 5854 ]] --[[ Name: jsonEncode ]]
    local v725 = {};
    if v724.universe_id ~= nil and v724.universe_id ~= "" then
        v725.universeId = v724.universe_id;
    end;
    return v725;
end;
v4.jsonDecode = function(v726) --[[ Line: 5866 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_24 (copy)
    local v727 = l_v4_24.new();
    if v726.universe_id ~= nil then
        v727.universe_id = v726.universe_id;
    end;
    if v726.universeId ~= nil then
        v727.universe_id = v726.universeId;
    end;
    return v727;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData_UniverseItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
};
v2.ExperienceCarouselInputData_UniverseItem = v4;
v1.default:register(v2.ExperienceCarouselInputData_UniverseItem);
v4 = {};
v4.__index = v4;
local l_v4_25 = v4 --[[ copy: 4 -> 30 ]];
v4.new = function(v729) --[[ Line: 5896 ]] --[[ Name: new ]]
    -- upvalues: l_v4_25 (copy)
    return (setmetatable({
        title = (not (v729 ~= nil) or v729.title == nil) and "" or v729.title, 
        song_items = if not (v729 ~= nil) or v729.song_items == nil then {} else v729.song_items, 
        next_page_token = (not (v729 ~= nil) or v729.next_page_token == nil) and "" or v729.next_page_token, 
        sort_id = (not (v729 ~= nil) or v729.sort_id == nil) and "" or v729.sort_id, 
        secondary_sort_id = (not (v729 ~= nil) or v729.secondary_sort_id == nil) and 0 or v729.secondary_sort_id
    }, l_v4_25));
end;
v4.encode = function(v730) --[[ Line: 5906 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v731 = buffer.create(0);
    local v732 = 0;
    if v730.title ~= nil and v730.title ~= "" then
        local v733, v734 = v0.writeTag(v731, v732, 1, v0.wireTypes.lengthDelimited);
        v733, v734 = v0.writeString(v733, v734, v730.title);
        v731 = v733;
        v732 = v734;
    end;
    if v730.song_items ~= nil and #v730.song_items > 0 then
        for _, v736 in v730.song_items do
            local v737 = v736:encode();
            local v738, v739 = v0.writeTag(v731, v732, 2, v0.wireTypes.lengthDelimited);
            v738, v739 = v0.writeBuffer(v738, v739, v737, buffer.len(v737));
            v731 = v738;
            v732 = v739;
        end;
    end;
    if v730.next_page_token ~= nil and v730.next_page_token ~= "" then
        local v740, v741 = v0.writeTag(v731, v732, 3, v0.wireTypes.lengthDelimited);
        v740, v741 = v0.writeString(v740, v741, v730.next_page_token);
        v731 = v740;
        v732 = v741;
    end;
    if v730.sort_id ~= nil and v730.sort_id ~= "" then
        local v742, v743 = v0.writeTag(v731, v732, 4, v0.wireTypes.lengthDelimited);
        v742, v743 = v0.writeString(v742, v743, v730.sort_id);
        v731 = v742;
        v732 = v743;
    end;
    if v730.secondary_sort_id ~= nil and v730.secondary_sort_id ~= 0 then
        local v744, v745 = v0.writeTag(v731, v732, 5, v0.wireTypes.varint);
        v744, v745 = v0.writeVarInt(v744, v745, v730.secondary_sort_id);
        v731 = v744;
        v732 = v745;
    end;
    local v746 = buffer.create(v732);
    buffer.copy(v746, 0, v731, 0, v732);
    return v746;
end;
v4.decode = function(v747) --[[ Line: 5943 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_25 (copy), v0 (copy), v2 (copy)
    local v748 = l_v4_25.new();
    local v749 = 0;
    while v749 < buffer.len(v747) do
        local v750 = nil;
        local v751 = nil;
        local v752, v753, v754 = v0.readTag(v747, v749);
        v750 = v752;
        v751 = v753;
        v749 = v754;
        if v751 == v0.wireTypes.varint then
            if v750 == 5 then
                v752 = nil;
                v753, v754 = v0.readVarIntI32(v747, v749);
                v752 = v753;
                v749 = v754;
                v748.secondary_sort_id = v752;
            else
                v752 = nil;
                v753, v754 = v0.readVarInt(v747, v749);
                v752 = v753;
                v749 = v754;
            end;
        elseif v751 == v0.wireTypes.lengthDelimited then
            if v750 == 1 then
                v752 = nil;
                v753, v754 = v0.readBuffer(v747, v749);
                v752 = v753;
                v749 = v754;
                v748.title = buffer.tostring(v752);
            elseif v750 == 2 then
                v752 = nil;
                v753, v754 = v0.readBuffer(v747, v749);
                v752 = v753;
                v749 = v754;
                table.insert(v748.song_items, v2.SongCarouselInputData_SongItem.decode(v752));
            elseif v750 == 3 then
                v752 = nil;
                v753, v754 = v0.readBuffer(v747, v749);
                v752 = v753;
                v749 = v754;
                v748.next_page_token = buffer.tostring(v752);
            elseif v750 == 4 then
                v752 = nil;
                v753, v754 = v0.readBuffer(v747, v749);
                v752 = v753;
                v749 = v754;
                v748.sort_id = buffer.tostring(v752);
            else
                v752 = nil;
                v753, v754 = v0.readVarInt(v747, v749);
                v749 = v754 + v753;
            end;
        elseif v751 == v0.wireTypes.i32 then
            v752 = nil;
            v753, v754 = v0.readFixed32(v747, v749);
            v752 = v753;
            v749 = v754;
        elseif v751 == v0.wireTypes.i64 then
            v752 = nil;
            v753, v754 = v0.readFixed64(v747, v749);
            v752 = v753;
            v749 = v754;
        else
            error("Unsupported wire type: " .. v751);
        end;
    end;
    return v748;
end;
v4.jsonEncode = function(v755) --[[ Line: 6006 ]] --[[ Name: jsonEncode ]]
    local v756 = {};
    if v755.title ~= nil and v755.title ~= "" then
        v756.title = v755.title;
    end;
    if v755.song_items ~= nil and #v755.song_items > 0 then
        local v757 = {};
        for _, v759 in v755.song_items do
            table.insert(v757, v759:jsonEncode());
        end;
        v756.songItems = v757;
    end;
    if v755.next_page_token ~= nil and v755.next_page_token ~= "" then
        v756.nextPageToken = v755.next_page_token;
    end;
    if v755.sort_id ~= nil and v755.sort_id ~= "" then
        v756.sortId = v755.sort_id;
    end;
    if v755.secondary_sort_id ~= nil and v755.secondary_sort_id ~= 0 then
        v756.secondarySortId = v755.secondary_sort_id;
    end;
    return v756;
end;
v4.jsonDecode = function(v760) --[[ Line: 6036 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_25 (copy), v2 (copy)
    local v761 = l_v4_25.new();
    if v760.title ~= nil then
        v761.title = v760.title;
    end;
    if v760.song_items ~= nil then
        local v762 = {};
        for _, v764 in v760.song_items do
            table.insert(v762, v2.SongCarouselInputData_SongItem.jsonDecode(v764));
        end;
        v761.song_items = v762;
    end;
    if v760.songItems ~= nil then
        local v765 = {};
        for _, v767 in v760.songItems do
            table.insert(v765, v2.SongCarouselInputData_SongItem.jsonDecode(v767));
        end;
        v761.song_items = v765;
    end;
    if v760.next_page_token ~= nil then
        v761.next_page_token = v760.next_page_token;
    end;
    if v760.nextPageToken ~= nil then
        v761.next_page_token = v760.nextPageToken;
    end;
    if v760.sort_id ~= nil then
        v761.sort_id = v760.sort_id;
    end;
    if v760.sortId ~= nil then
        v761.sort_id = v760.sortId;
    end;
    if v760.secondary_sort_id ~= nil then
        v761.secondary_sort_id = v760.secondary_sort_id;
    end;
    if v760.secondarySortId ~= nil then
        v761.secondary_sort_id = v760.secondarySortId;
    end;
    return v761;
end;
v4.descriptor = {
    name = "SongCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
};
v2.SongCarouselInputData = v4;
v1.default:register(v2.SongCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_26 = v4 --[[ copy: 4 -> 31 ]];
v4.new = function(v769) --[[ Line: 6102 ]] --[[ Name: new ]]
    -- upvalues: l_v4_26 (copy)
    return (setmetatable({
        song_id = (not (v769 ~= nil) or v769.song_id == nil) and "" or v769.song_id
    }, l_v4_26));
end;
v4.encode = function(v770) --[[ Line: 6110 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v771 = buffer.create(0);
    local v772 = 0;
    if v770.song_id ~= nil and v770.song_id ~= "" then
        local v773, v774 = v0.writeTag(v771, v772, 1, v0.wireTypes.lengthDelimited);
        v773, v774 = v0.writeString(v773, v774, v770.song_id);
        v771 = v773;
        v772 = v774;
    end;
    local v775 = buffer.create(v772);
    buffer.copy(v775, 0, v771, 0, v772);
    return v775;
end;
v4.decode = function(v776) --[[ Line: 6124 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_26 (copy), v0 (copy)
    local v777 = l_v4_26.new();
    local v778 = 0;
    while v778 < buffer.len(v776) do
        local v779 = nil;
        local v780 = nil;
        local v781, v782, v783 = v0.readTag(v776, v778);
        v779 = v781;
        v780 = v782;
        v778 = v783;
        if v780 == v0.wireTypes.varint then
            v781 = nil;
            v782, v783 = v0.readVarInt(v776, v778);
            v781 = v782;
            v778 = v783;
        elseif v780 == v0.wireTypes.lengthDelimited then
            if v779 == 1 then
                v781 = nil;
                v782, v783 = v0.readBuffer(v776, v778);
                v781 = v782;
                v778 = v783;
                v777.song_id = buffer.tostring(v781);
            else
                v781 = nil;
                v782, v783 = v0.readVarInt(v776, v778);
                v778 = v783 + v782;
            end;
        elseif v780 == v0.wireTypes.i32 then
            v781 = nil;
            v782, v783 = v0.readFixed32(v776, v778);
            v781 = v782;
            v778 = v783;
        elseif v780 == v0.wireTypes.i64 then
            v781 = nil;
            v782, v783 = v0.readFixed64(v776, v778);
            v781 = v782;
            v778 = v783;
        else
            error("Unsupported wire type: " .. v780);
        end;
    end;
    return v777;
end;
v4.jsonEncode = function(v784) --[[ Line: 6167 ]] --[[ Name: jsonEncode ]]
    local v785 = {};
    if v784.song_id ~= nil and v784.song_id ~= "" then
        v785.songId = v784.song_id;
    end;
    return v785;
end;
v4.jsonDecode = function(v786) --[[ Line: 6177 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_26 (copy)
    local v787 = l_v4_26.new();
    if v786.song_id ~= nil then
        v787.song_id = v786.song_id;
    end;
    if v786.songId ~= nil then
        v787.song_id = v786.songId;
    end;
    return v787;
end;
v4.descriptor = {
    name = "SongCarouselInputData_SongItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
};
v2.SongCarouselInputData_SongItem = v4;
v1.default:register(v2.SongCarouselInputData_SongItem);
v4 = {};
v4.__index = v4;
local l_v4_27 = v4 --[[ copy: 4 -> 32 ]];
v4.new = function(v789) --[[ Line: 6205 ]] --[[ Name: new ]]
    -- upvalues: l_v4_27 (copy)
    return (setmetatable({
        title = (not (v789 ~= nil) or v789.title == nil) and "" or v789.title, 
        event_items = if not (v789 ~= nil) or v789.event_items == nil then {} else v789.event_items
    }, l_v4_27));
end;
v4.encode = function(v790) --[[ Line: 6212 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v791 = buffer.create(0);
    local v792 = 0;
    if v790.title ~= nil and v790.title ~= "" then
        local v793, v794 = v0.writeTag(v791, v792, 1, v0.wireTypes.lengthDelimited);
        v793, v794 = v0.writeString(v793, v794, v790.title);
        v791 = v793;
        v792 = v794;
    end;
    if v790.event_items ~= nil and #v790.event_items > 0 then
        for _, v796 in v790.event_items do
            local v797 = v796:encode();
            local v798, v799 = v0.writeTag(v791, v792, 2, v0.wireTypes.lengthDelimited);
            v798, v799 = v0.writeBuffer(v798, v799, v797, buffer.len(v797));
            v791 = v798;
            v792 = v799;
        end;
    end;
    local v800 = buffer.create(v792);
    buffer.copy(v800, 0, v791, 0, v792);
    return v800;
end;
v4.decode = function(v801) --[[ Line: 6234 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_27 (copy), v0 (copy), v2 (copy)
    local v802 = l_v4_27.new();
    local v803 = 0;
    while v803 < buffer.len(v801) do
        local v804 = nil;
        local v805 = nil;
        local v806, v807, v808 = v0.readTag(v801, v803);
        v804 = v806;
        v805 = v807;
        v803 = v808;
        if v805 == v0.wireTypes.varint then
            v806 = nil;
            v807, v808 = v0.readVarInt(v801, v803);
            v806 = v807;
            v803 = v808;
        elseif v805 == v0.wireTypes.lengthDelimited then
            if v804 == 1 then
                v806 = nil;
                v807, v808 = v0.readBuffer(v801, v803);
                v806 = v807;
                v803 = v808;
                v802.title = buffer.tostring(v806);
            elseif v804 == 2 then
                v806 = nil;
                v807, v808 = v0.readBuffer(v801, v803);
                v806 = v807;
                v803 = v808;
                table.insert(v802.event_items, v2.EventsCarouselInputData_EventItem.decode(v806));
            else
                v806 = nil;
                v807, v808 = v0.readVarInt(v801, v803);
                v803 = v808 + v807;
            end;
        elseif v805 == v0.wireTypes.i32 then
            v806 = nil;
            v807, v808 = v0.readFixed32(v801, v803);
            v806 = v807;
            v803 = v808;
        elseif v805 == v0.wireTypes.i64 then
            v806 = nil;
            v807, v808 = v0.readFixed64(v801, v803);
            v806 = v807;
            v803 = v808;
        else
            error("Unsupported wire type: " .. v805);
        end;
    end;
    return v802;
end;
v4.jsonEncode = function(v809) --[[ Line: 6282 ]] --[[ Name: jsonEncode ]]
    local v810 = {};
    if v809.title ~= nil and v809.title ~= "" then
        v810.title = v809.title;
    end;
    if v809.event_items ~= nil and #v809.event_items > 0 then
        local v811 = {};
        for _, v813 in v809.event_items do
            table.insert(v811, v813:jsonEncode());
        end;
        v810.eventItems = v811;
    end;
    return v810;
end;
v4.jsonDecode = function(v814) --[[ Line: 6300 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_27 (copy), v2 (copy)
    local v815 = l_v4_27.new();
    if v814.title ~= nil then
        v815.title = v814.title;
    end;
    if v814.event_items ~= nil then
        local v816 = {};
        for _, v818 in v814.event_items do
            table.insert(v816, v2.EventsCarouselInputData_EventItem.jsonDecode(v818));
        end;
        v815.event_items = v816;
    end;
    if v814.eventItems ~= nil then
        local v819 = {};
        for _, v821 in v814.eventItems do
            table.insert(v819, v2.EventsCarouselInputData_EventItem.jsonDecode(v821));
        end;
        v815.event_items = v819;
    end;
    return v815;
end;
v4.descriptor = {
    name = "EventsCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
};
v2.EventsCarouselInputData = v4;
v1.default:register(v2.EventsCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_28 = v4 --[[ copy: 4 -> 33 ]];
v4.new = function(v823) --[[ Line: 6342 ]] --[[ Name: new ]]
    -- upvalues: l_v4_28 (copy)
    return (setmetatable({
        event_id = (not (v823 ~= nil) or v823.event_id == nil) and "" or v823.event_id
    }, l_v4_28));
end;
v4.encode = function(v824) --[[ Line: 6350 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v825 = buffer.create(0);
    local v826 = 0;
    if v824.event_id ~= nil and v824.event_id ~= "" then
        local v827, v828 = v0.writeTag(v825, v826, 1, v0.wireTypes.lengthDelimited);
        v827, v828 = v0.writeString(v827, v828, v824.event_id);
        v825 = v827;
        v826 = v828;
    end;
    local v829 = buffer.create(v826);
    buffer.copy(v829, 0, v825, 0, v826);
    return v829;
end;
v4.decode = function(v830) --[[ Line: 6364 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_28 (copy), v0 (copy)
    local v831 = l_v4_28.new();
    local v832 = 0;
    while v832 < buffer.len(v830) do
        local v833 = nil;
        local v834 = nil;
        local v835, v836, v837 = v0.readTag(v830, v832);
        v833 = v835;
        v834 = v836;
        v832 = v837;
        if v834 == v0.wireTypes.varint then
            v835 = nil;
            v836, v837 = v0.readVarInt(v830, v832);
            v835 = v836;
            v832 = v837;
        elseif v834 == v0.wireTypes.lengthDelimited then
            if v833 == 1 then
                v835 = nil;
                v836, v837 = v0.readBuffer(v830, v832);
                v835 = v836;
                v832 = v837;
                v831.event_id = buffer.tostring(v835);
            else
                v835 = nil;
                v836, v837 = v0.readVarInt(v830, v832);
                v832 = v837 + v836;
            end;
        elseif v834 == v0.wireTypes.i32 then
            v835 = nil;
            v836, v837 = v0.readFixed32(v830, v832);
            v835 = v836;
            v832 = v837;
        elseif v834 == v0.wireTypes.i64 then
            v835 = nil;
            v836, v837 = v0.readFixed64(v830, v832);
            v835 = v836;
            v832 = v837;
        else
            error("Unsupported wire type: " .. v834);
        end;
    end;
    return v831;
end;
v4.jsonEncode = function(v838) --[[ Line: 6407 ]] --[[ Name: jsonEncode ]]
    local v839 = {};
    if v838.event_id ~= nil and v838.event_id ~= "" then
        v839.eventId = v838.event_id;
    end;
    return v839;
end;
v4.jsonDecode = function(v840) --[[ Line: 6417 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_28 (copy)
    local v841 = l_v4_28.new();
    if v840.event_id ~= nil then
        v841.event_id = v840.event_id;
    end;
    if v840.eventId ~= nil then
        v841.event_id = v840.eventId;
    end;
    return v841;
end;
v4.descriptor = {
    name = "EventsCarouselInputData_EventItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
};
v2.EventsCarouselInputData_EventItem = v4;
v1.default:register(v2.EventsCarouselInputData_EventItem);
v4 = {};
v4.__index = v4;
local l_v4_29 = v4 --[[ copy: 4 -> 34 ]];
v4.new = function(v843) --[[ Line: 6447 ]] --[[ Name: new ]]
    -- upvalues: l_v4_29 (copy)
    return (setmetatable({
        universe_id = (not (v843 ~= nil) or v843.universe_id == nil) and "" or v843.universe_id, 
        entry_map = if not (v843 ~= nil) or v843.entry_map == nil then {} else v843.entry_map
    }, l_v4_29));
end;
v4.encode = function(v844) --[[ Line: 6454 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v845 = buffer.create(0);
    local v846 = 0;
    if v844.universe_id ~= nil and v844.universe_id ~= "" then
        local v847, v848 = v0.writeTag(v845, v846, 1, v0.wireTypes.lengthDelimited);
        v847, v848 = v0.writeString(v847, v848, v844.universe_id);
        v845 = v847;
        v846 = v848;
    end;
    if v844.entry_map ~= nil and next(v844.entry_map) ~= nil then
        for v849, v850 in v844.entry_map do
            local v851 = buffer.create(0);
            local v852, v853 = v0.writeTag(v851, 0, 1, v0.wireTypes.lengthDelimited);
            v852, v853 = v0.writeString(v852, v853, v849);
            v851 = v852;
            local l_v853_0 = v853;
            v852 = v850:encode();
            local v855;
            v853, v855 = v0.writeTag(v851, l_v853_0, 2, v0.wireTypes.lengthDelimited);
            v853, v855 = v0.writeBuffer(v853, v855, v852, buffer.len(v852));
            v851 = v853;
            l_v853_0 = v855;
            v853, v855 = v0.writeTag(v845, v846, 2, v0.wireTypes.lengthDelimited);
            v853, v855 = v0.writeBuffer(v853, v855, v851, l_v853_0);
            v845 = v853;
            v846 = v855;
        end;
    end;
    local v856 = buffer.create(v846);
    buffer.copy(v856, 0, v845, 0, v846);
    return v856;
end;
v4.decode = function(v857) --[[ Line: 6482 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_29 (copy), v0 (copy), v2 (copy)
    local v858 = l_v4_29.new();
    local v859 = 0;
    while v859 < buffer.len(v857) do
        local v860 = nil;
        local v861 = nil;
        local v862, v863, v864 = v0.readTag(v857, v859);
        v860 = v862;
        v861 = v863;
        v859 = v864;
        if v861 == v0.wireTypes.varint then
            v862 = nil;
            v863, v864 = v0.readVarInt(v857, v859);
            v862 = v863;
            v859 = v864;
        elseif v861 == v0.wireTypes.lengthDelimited then
            if v860 == 1 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v858.universe_id = buffer.tostring(v862);
            elseif v860 == 2 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v863 = v2.DevStoreFeedInputData_EntryMapEntry.decode(v862);
                v864 = v2.FeedEntry.new();
                v858.entry_map[v863.key or ""] = v863.value or v864;
            else
                v862 = nil;
                v863, v864 = v0.readVarInt(v857, v859);
                v859 = v864 + v863;
            end;
        elseif v861 == v0.wireTypes.i32 then
            v862 = nil;
            v863, v864 = v0.readFixed32(v857, v859);
            v862 = v863;
            v859 = v864;
        elseif v861 == v0.wireTypes.i64 then
            v862 = nil;
            v863, v864 = v0.readFixed64(v857, v859);
            v862 = v863;
            v859 = v864;
        else
            error("Unsupported wire type: " .. v861);
        end;
    end;
    return v858;
end;
v4.jsonEncode = function(v865) --[[ Line: 6537 ]] --[[ Name: jsonEncode ]]
    local v866 = {};
    if v865.universe_id ~= nil and v865.universe_id ~= "" then
        v866.universeId = v865.universe_id;
    end;
    if v865.entry_map ~= nil and next(v865.entry_map) ~= nil then
        local v867 = {};
        for v868, v869 in v865.entry_map do
            v867[v868] = v869:jsonEncode();
        end;
        v866.entryMap = v867;
    end;
    return v866;
end;
v4.jsonDecode = function(v870) --[[ Line: 6555 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_29 (copy), v2 (copy)
    local v871 = l_v4_29.new();
    if v870.universe_id ~= nil then
        v871.universe_id = v870.universe_id;
    end;
    if v870.universeId ~= nil then
        v871.universe_id = v870.universeId;
    end;
    if v870.entry_map ~= nil then
        local v872 = {};
        for v873, v874 in v870.entry_map do
            v872[v873] = v2.FeedEntry.jsonDecode(v874);
        end;
        v871.entry_map = v872;
    end;
    if v870.entryMap ~= nil then
        local v875 = {};
        for v876, v877 in v870.entryMap do
            v875[v876] = v2.FeedEntry.jsonDecode(v877);
        end;
        v871.entry_map = v875;
    end;
    return v871;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
};
v2.DevStoreFeedInputData = v4;
v1.default:register(v2.DevStoreFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_30 = v4 --[[ copy: 4 -> 35 ]];
v4.new = function(v879) --[[ Line: 6601 ]] --[[ Name: new ]]
    -- upvalues: l_v4_30 (copy)
    return (setmetatable({
        key = (not (v879 ~= nil) or v879.key == nil) and "" or v879.key, 
        value = if not (v879 ~= nil) or v879.value == nil then nil else v879.value
    }, l_v4_30));
end;
v4.encode = function(v880) --[[ Line: 6610 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v881 = buffer.create(0);
    local v882 = 0;
    if v880.key ~= nil and v880.key ~= "" then
        local v883, v884 = v0.writeTag(v881, v882, 1, v0.wireTypes.lengthDelimited);
        v883, v884 = v0.writeString(v883, v884, v880.key);
        v881 = v883;
        v882 = v884;
    end;
    if v880.value ~= nil then
        local v885 = v880.value:encode();
        local v886, v887 = v0.writeTag(v881, v882, 2, v0.wireTypes.lengthDelimited);
        v886, v887 = v0.writeBuffer(v886, v887, v885, buffer.len(v885));
        v881 = v886;
        v882 = v887;
    end;
    local v888 = buffer.create(v882);
    buffer.copy(v888, 0, v881, 0, v882);
    return v888;
end;
v4.decode = function(v889) --[[ Line: 6630 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_30 (copy), v0 (copy), v2 (copy)
    local v890 = l_v4_30.new();
    local v891 = 0;
    while v891 < buffer.len(v889) do
        local v892 = nil;
        local v893 = nil;
        local v894, v895, v896 = v0.readTag(v889, v891);
        v892 = v894;
        v893 = v895;
        v891 = v896;
        if v893 == v0.wireTypes.varint then
            v894 = nil;
            v895, v896 = v0.readVarInt(v889, v891);
            v894 = v895;
            v891 = v896;
        elseif v893 == v0.wireTypes.lengthDelimited then
            if v892 == 1 then
                v894 = nil;
                v895, v896 = v0.readBuffer(v889, v891);
                v894 = v895;
                v891 = v896;
                v890.key = buffer.tostring(v894);
            elseif v892 == 2 then
                v894 = nil;
                v895, v896 = v0.readBuffer(v889, v891);
                v894 = v895;
                v891 = v896;
                v890.value = v2.FeedEntry.decode(v894);
            else
                v894 = nil;
                v895, v896 = v0.readVarInt(v889, v891);
                v891 = v896 + v895;
            end;
        elseif v893 == v0.wireTypes.i32 then
            v894 = nil;
            v895, v896 = v0.readFixed32(v889, v891);
            v894 = v895;
            v891 = v896;
        elseif v893 == v0.wireTypes.i64 then
            v894 = nil;
            v895, v896 = v0.readFixed64(v889, v891);
            v894 = v895;
            v891 = v896;
        else
            error("Unsupported wire type: " .. v893);
        end;
    end;
    return v890;
end;
v4.jsonEncode = function(v897) --[[ Line: 6678 ]] --[[ Name: jsonEncode ]]
    local v898 = {};
    if v897.key ~= nil and v897.key ~= "" then
        v898.key = v897.key;
    end;
    if v897.value ~= nil then
        v898.value = v897.value:jsonEncode();
    end;
    return v898;
end;
v4.jsonDecode = function(v899) --[[ Line: 6692 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_30 (copy), v2 (copy)
    local v900 = l_v4_30.new();
    if v899.key ~= nil then
        v900.key = v899.key;
    end;
    if v899.value ~= nil then
        v900.value = v2.FeedEntry.jsonDecode(v899.value);
    end;
    return v900;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.DevStoreFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.DevStoreFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_31 = v4 --[[ copy: 4 -> 36 ]];
v4.new = function(v902) --[[ Line: 6722 ]] --[[ Name: new ]]
    -- upvalues: l_v4_31 (copy)
    return (setmetatable({
        game_passes = if not (v902 ~= nil) or v902.game_passes == nil then {} else v902.game_passes
    }, l_v4_31));
end;
v4.encode = function(v903) --[[ Line: 6728 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v904 = buffer.create(0);
    local v905 = 0;
    if v903.game_passes ~= nil and #v903.game_passes > 0 then
        for _, v907 in v903.game_passes do
            local v908 = v907:encode();
            local v909, v910 = v0.writeTag(v904, v905, 1, v0.wireTypes.lengthDelimited);
            v909, v910 = v0.writeBuffer(v909, v910, v908, buffer.len(v908));
            v904 = v909;
            v905 = v910;
        end;
    end;
    local v911 = buffer.create(v905);
    buffer.copy(v911, 0, v904, 0, v905);
    return v911;
end;
v4.decode = function(v912) --[[ Line: 6745 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_31 (copy), v0 (copy), v2 (copy)
    local v913 = l_v4_31.new();
    local v914 = 0;
    while v914 < buffer.len(v912) do
        local v915 = nil;
        local v916 = nil;
        local v917, v918, v919 = v0.readTag(v912, v914);
        v915 = v917;
        v916 = v918;
        v914 = v919;
        if v916 == v0.wireTypes.varint then
            v917 = nil;
            v918, v919 = v0.readVarInt(v912, v914);
            v917 = v918;
            v914 = v919;
        elseif v916 == v0.wireTypes.lengthDelimited then
            if v915 == 1 then
                v917 = nil;
                v918, v919 = v0.readBuffer(v912, v914);
                v917 = v918;
                v914 = v919;
                table.insert(v913.game_passes, v2.GamePassesGridInputData_GamePassItem.decode(v917));
            else
                v917 = nil;
                v918, v919 = v0.readVarInt(v912, v914);
                v914 = v919 + v918;
            end;
        elseif v916 == v0.wireTypes.i32 then
            v917 = nil;
            v918, v919 = v0.readFixed32(v912, v914);
            v917 = v918;
            v914 = v919;
        elseif v916 == v0.wireTypes.i64 then
            v917 = nil;
            v918, v919 = v0.readFixed64(v912, v914);
            v917 = v918;
            v914 = v919;
        else
            error("Unsupported wire type: " .. v916);
        end;
    end;
    return v913;
end;
v4.jsonEncode = function(v920) --[[ Line: 6788 ]] --[[ Name: jsonEncode ]]
    local v921 = {};
    if v920.game_passes ~= nil and #v920.game_passes > 0 then
        local v922 = {};
        for _, v924 in v920.game_passes do
            table.insert(v922, v924:jsonEncode());
        end;
        v921.gamePasses = v922;
    end;
    return v921;
end;
v4.jsonDecode = function(v925) --[[ Line: 6802 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_31 (copy), v2 (copy)
    local v926 = l_v4_31.new();
    if v925.game_passes ~= nil then
        local v927 = {};
        for _, v929 in v925.game_passes do
            table.insert(v927, v2.GamePassesGridInputData_GamePassItem.jsonDecode(v929));
        end;
        v926.game_passes = v927;
    end;
    if v925.gamePasses ~= nil then
        local v930 = {};
        for _, v932 in v925.gamePasses do
            table.insert(v930, v2.GamePassesGridInputData_GamePassItem.jsonDecode(v932));
        end;
        v926.game_passes = v930;
    end;
    return v926;
end;
v4.descriptor = {
    name = "GamePassesGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassesGridInputData"
};
v2.GamePassesGridInputData = v4;
v1.default:register(v2.GamePassesGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_32 = v4 --[[ copy: 4 -> 37 ]];
v4.new = function(v934) --[[ Line: 6840 ]] --[[ Name: new ]]
    -- upvalues: l_v4_32 (copy)
    return (setmetatable({
        game_pass_id = (not (v934 ~= nil) or v934.game_pass_id == nil) and "" or v934.game_pass_id
    }, l_v4_32));
end;
v4.encode = function(v935) --[[ Line: 6848 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v936 = buffer.create(0);
    local v937 = 0;
    if v935.game_pass_id ~= nil and v935.game_pass_id ~= "" then
        local v938, v939 = v0.writeTag(v936, v937, 1, v0.wireTypes.lengthDelimited);
        v938, v939 = v0.writeString(v938, v939, v935.game_pass_id);
        v936 = v938;
        v937 = v939;
    end;
    local v940 = buffer.create(v937);
    buffer.copy(v940, 0, v936, 0, v937);
    return v940;
end;
v4.decode = function(v941) --[[ Line: 6862 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_32 (copy), v0 (copy)
    local v942 = l_v4_32.new();
    local v943 = 0;
    while v943 < buffer.len(v941) do
        local v944 = nil;
        local v945 = nil;
        local v946, v947, v948 = v0.readTag(v941, v943);
        v944 = v946;
        v945 = v947;
        v943 = v948;
        if v945 == v0.wireTypes.varint then
            v946 = nil;
            v947, v948 = v0.readVarInt(v941, v943);
            v946 = v947;
            v943 = v948;
        elseif v945 == v0.wireTypes.lengthDelimited then
            if v944 == 1 then
                v946 = nil;
                v947, v948 = v0.readBuffer(v941, v943);
                v946 = v947;
                v943 = v948;
                v942.game_pass_id = buffer.tostring(v946);
            else
                v946 = nil;
                v947, v948 = v0.readVarInt(v941, v943);
                v943 = v948 + v947;
            end;
        elseif v945 == v0.wireTypes.i32 then
            v946 = nil;
            v947, v948 = v0.readFixed32(v941, v943);
            v946 = v947;
            v943 = v948;
        elseif v945 == v0.wireTypes.i64 then
            v946 = nil;
            v947, v948 = v0.readFixed64(v941, v943);
            v946 = v947;
            v943 = v948;
        else
            error("Unsupported wire type: " .. v945);
        end;
    end;
    return v942;
end;
v4.jsonEncode = function(v949) --[[ Line: 6905 ]] --[[ Name: jsonEncode ]]
    local v950 = {};
    if v949.game_pass_id ~= nil and v949.game_pass_id ~= "" then
        v950.gamePassId = v949.game_pass_id;
    end;
    return v950;
end;
v4.jsonDecode = function(v951) --[[ Line: 6915 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_32 (copy)
    local v952 = l_v4_32.new();
    if v951.game_pass_id ~= nil then
        v952.game_pass_id = v951.game_pass_id;
    end;
    if v951.gamePassId ~= nil then
        v952.game_pass_id = v951.gamePassId;
    end;
    return v952;
end;
v4.descriptor = {
    name = "GamePassesGridInputData_GamePassItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
};
v2.GamePassesGridInputData_GamePassItem = v4;
v1.default:register(v2.GamePassesGridInputData_GamePassItem);
v4 = {};
v4.__index = v4;
local l_v4_33 = v4 --[[ copy: 4 -> 38 ]];
v4.new = function(v954) --[[ Line: 6945 ]] --[[ Name: new ]]
    -- upvalues: l_v4_33 (copy)
    return (setmetatable({
        developer_products = if not (v954 ~= nil) or v954.developer_products == nil then {} else v954.developer_products
    }, l_v4_33));
end;
v4.encode = function(v955) --[[ Line: 6953 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v956 = buffer.create(0);
    local v957 = 0;
    if v955.developer_products ~= nil and #v955.developer_products > 0 then
        for _, v959 in v955.developer_products do
            local v960 = v959:encode();
            local v961, v962 = v0.writeTag(v956, v957, 1, v0.wireTypes.lengthDelimited);
            v961, v962 = v0.writeBuffer(v961, v962, v960, buffer.len(v960));
            v956 = v961;
            v957 = v962;
        end;
    end;
    local v963 = buffer.create(v957);
    buffer.copy(v963, 0, v956, 0, v957);
    return v963;
end;
v4.decode = function(v964) --[[ Line: 6970 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_33 (copy), v0 (copy), v2 (copy)
    local v965 = l_v4_33.new();
    local v966 = 0;
    while v966 < buffer.len(v964) do
        local v967 = nil;
        local v968 = nil;
        local v969, v970, v971 = v0.readTag(v964, v966);
        v967 = v969;
        v968 = v970;
        v966 = v971;
        if v968 == v0.wireTypes.varint then
            v969 = nil;
            v970, v971 = v0.readVarInt(v964, v966);
            v969 = v970;
            v966 = v971;
        elseif v968 == v0.wireTypes.lengthDelimited then
            if v967 == 1 then
                v969 = nil;
                v970, v971 = v0.readBuffer(v964, v966);
                v969 = v970;
                v966 = v971;
                table.insert(v965.developer_products, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.decode(v969));
            else
                v969 = nil;
                v970, v971 = v0.readVarInt(v964, v966);
                v966 = v971 + v970;
            end;
        elseif v968 == v0.wireTypes.i32 then
            v969 = nil;
            v970, v971 = v0.readFixed32(v964, v966);
            v969 = v970;
            v966 = v971;
        elseif v968 == v0.wireTypes.i64 then
            v969 = nil;
            v970, v971 = v0.readFixed64(v964, v966);
            v969 = v970;
            v966 = v971;
        else
            error("Unsupported wire type: " .. v968);
        end;
    end;
    return v965;
end;
v4.jsonEncode = function(v972) --[[ Line: 7016 ]] --[[ Name: jsonEncode ]]
    local v973 = {};
    if v972.developer_products ~= nil and #v972.developer_products > 0 then
        local v974 = {};
        for _, v976 in v972.developer_products do
            table.insert(v974, v976:jsonEncode());
        end;
        v973.developerProducts = v974;
    end;
    return v973;
end;
v4.jsonDecode = function(v977) --[[ Line: 7030 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_33 (copy), v2 (copy)
    local v978 = l_v4_33.new();
    if v977.developer_products ~= nil then
        local v979 = {};
        for _, v981 in v977.developer_products do
            table.insert(v979, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.jsonDecode(v981));
        end;
        v978.developer_products = v979;
    end;
    if v977.developerProducts ~= nil then
        local v982 = {};
        for _, v984 in v977.developerProducts do
            table.insert(v982, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.jsonDecode(v984));
        end;
        v978.developer_products = v982;
    end;
    return v978;
end;
v4.descriptor = {
    name = "GameDeveloperProductsGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductsGridInputData"
};
v2.GameDeveloperProductsGridInputData = v4;
v1.default:register(v2.GameDeveloperProductsGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_34 = v4 --[[ copy: 4 -> 39 ]];
v4.new = function(v986) --[[ Line: 7077 ]] --[[ Name: new ]]
    -- upvalues: l_v4_34 (copy)
    return (setmetatable({
        developer_product_id = (not (v986 ~= nil) or v986.developer_product_id == nil) and "" or v986.developer_product_id
    }, l_v4_34));
end;
v4.encode = function(v987) --[[ Line: 7090 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v988 = buffer.create(0);
    local v989 = 0;
    if v987.developer_product_id ~= nil and v987.developer_product_id ~= "" then
        local v990, v991 = v0.writeTag(v988, v989, 1, v0.wireTypes.lengthDelimited);
        v990, v991 = v0.writeString(v990, v991, v987.developer_product_id);
        v988 = v990;
        v989 = v991;
    end;
    local v992 = buffer.create(v989);
    buffer.copy(v992, 0, v988, 0, v989);
    return v992;
end;
v4.decode = function(v993) --[[ Line: 7106 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_34 (copy), v0 (copy)
    local v994 = l_v4_34.new();
    local v995 = 0;
    while v995 < buffer.len(v993) do
        local v996 = nil;
        local v997 = nil;
        local v998, v999, v1000 = v0.readTag(v993, v995);
        v996 = v998;
        v997 = v999;
        v995 = v1000;
        if v997 == v0.wireTypes.varint then
            v998 = nil;
            v999, v1000 = v0.readVarInt(v993, v995);
            v998 = v999;
            v995 = v1000;
        elseif v997 == v0.wireTypes.lengthDelimited then
            if v996 == 1 then
                v998 = nil;
                v999, v1000 = v0.readBuffer(v993, v995);
                v998 = v999;
                v995 = v1000;
                v994.developer_product_id = buffer.tostring(v998);
            else
                v998 = nil;
                v999, v1000 = v0.readVarInt(v993, v995);
                v995 = v1000 + v999;
            end;
        elseif v997 == v0.wireTypes.i32 then
            v998 = nil;
            v999, v1000 = v0.readFixed32(v993, v995);
            v998 = v999;
            v995 = v1000;
        elseif v997 == v0.wireTypes.i64 then
            v998 = nil;
            v999, v1000 = v0.readFixed64(v993, v995);
            v998 = v999;
            v995 = v1000;
        else
            error("Unsupported wire type: " .. v997);
        end;
    end;
    return v994;
end;
v4.jsonEncode = function(v1001) --[[ Line: 7151 ]] --[[ Name: jsonEncode ]]
    local v1002 = {};
    if v1001.developer_product_id ~= nil and v1001.developer_product_id ~= "" then
        v1002.developerProductId = v1001.developer_product_id;
    end;
    return v1002;
end;
v4.jsonDecode = function(v1003) --[[ Line: 7163 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_34 (copy)
    local v1004 = l_v4_34.new();
    if v1003.developer_product_id ~= nil then
        v1004.developer_product_id = v1003.developer_product_id;
    end;
    if v1003.developerProductId ~= nil then
        v1004.developer_product_id = v1003.developerProductId;
    end;
    return v1004;
end;
v4.descriptor = {
    name = "GameDeveloperProductsGridInputData_DeveloperProductItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
};
v2.GameDeveloperProductsGridInputData_DeveloperProductItem = v4;
v1.default:register(v2.GameDeveloperProductsGridInputData_DeveloperProductItem);
v4 = {};
v4.__index = v4;
local l_v4_35 = v4 --[[ copy: 4 -> 40 ]];
v4.new = function(v1006) --[[ Line: 7194 ]] --[[ Name: new ]]
    -- upvalues: l_v4_35 (copy)
    return (setmetatable({
        subscriptions = if not (v1006 ~= nil) or v1006.subscriptions == nil then {} else v1006.subscriptions
    }, l_v4_35));
end;
v4.encode = function(v1007) --[[ Line: 7202 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1008 = buffer.create(0);
    local v1009 = 0;
    if v1007.subscriptions ~= nil and #v1007.subscriptions > 0 then
        for _, v1011 in v1007.subscriptions do
            local v1012 = v1011:encode();
            local v1013, v1014 = v0.writeTag(v1008, v1009, 1, v0.wireTypes.lengthDelimited);
            v1013, v1014 = v0.writeBuffer(v1013, v1014, v1012, buffer.len(v1012));
            v1008 = v1013;
            v1009 = v1014;
        end;
    end;
    local v1015 = buffer.create(v1009);
    buffer.copy(v1015, 0, v1008, 0, v1009);
    return v1015;
end;
v4.decode = function(v1016) --[[ Line: 7219 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_35 (copy), v0 (copy), v2 (copy)
    local v1017 = l_v4_35.new();
    local v1018 = 0;
    while v1018 < buffer.len(v1016) do
        local v1019 = nil;
        local v1020 = nil;
        local v1021, v1022, v1023 = v0.readTag(v1016, v1018);
        v1019 = v1021;
        v1020 = v1022;
        v1018 = v1023;
        if v1020 == v0.wireTypes.varint then
            v1021 = nil;
            v1022, v1023 = v0.readVarInt(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        elseif v1020 == v0.wireTypes.lengthDelimited then
            if v1019 == 1 then
                v1021 = nil;
                v1022, v1023 = v0.readBuffer(v1016, v1018);
                v1021 = v1022;
                v1018 = v1023;
                table.insert(v1017.subscriptions, v2.GameSubscriptionsGridInputData_SubscriptionItem.decode(v1021));
            else
                v1021 = nil;
                v1022, v1023 = v0.readVarInt(v1016, v1018);
                v1018 = v1023 + v1022;
            end;
        elseif v1020 == v0.wireTypes.i32 then
            v1021 = nil;
            v1022, v1023 = v0.readFixed32(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        elseif v1020 == v0.wireTypes.i64 then
            v1021 = nil;
            v1022, v1023 = v0.readFixed64(v1016, v1018);
            v1021 = v1022;
            v1018 = v1023;
        else
            error("Unsupported wire type: " .. v1020);
        end;
    end;
    return v1017;
end;
v4.jsonEncode = function(v1024) --[[ Line: 7265 ]] --[[ Name: jsonEncode ]]
    local v1025 = {};
    if v1024.subscriptions ~= nil and #v1024.subscriptions > 0 then
        local v1026 = {};
        for _, v1028 in v1024.subscriptions do
            table.insert(v1026, v1028:jsonEncode());
        end;
        v1025.subscriptions = v1026;
    end;
    return v1025;
end;
v4.jsonDecode = function(v1029) --[[ Line: 7279 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_35 (copy), v2 (copy)
    local v1030 = l_v4_35.new();
    if v1029.subscriptions ~= nil then
        local v1031 = {};
        for _, v1033 in v1029.subscriptions do
            table.insert(v1031, v2.GameSubscriptionsGridInputData_SubscriptionItem.jsonDecode(v1033));
        end;
        v1030.subscriptions = v1031;
    end;
    return v1030;
end;
v4.descriptor = {
    name = "GameSubscriptionsGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionsGridInputData"
};
v2.GameSubscriptionsGridInputData = v4;
v1.default:register(v2.GameSubscriptionsGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_36 = v4 --[[ copy: 4 -> 41 ]];
v4.new = function(v1035) --[[ Line: 7308 ]] --[[ Name: new ]]
    -- upvalues: l_v4_36 (copy)
    return (setmetatable({
        subscription_id = (not (v1035 ~= nil) or v1035.subscription_id == nil) and "" or v1035.subscription_id
    }, l_v4_36));
end;
v4.encode = function(v1036) --[[ Line: 7316 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1037 = buffer.create(0);
    local v1038 = 0;
    if v1036.subscription_id ~= nil and v1036.subscription_id ~= "" then
        local v1039, v1040 = v0.writeTag(v1037, v1038, 1, v0.wireTypes.lengthDelimited);
        v1039, v1040 = v0.writeString(v1039, v1040, v1036.subscription_id);
        v1037 = v1039;
        v1038 = v1040;
    end;
    local v1041 = buffer.create(v1038);
    buffer.copy(v1041, 0, v1037, 0, v1038);
    return v1041;
end;
v4.decode = function(v1042) --[[ Line: 7332 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_36 (copy), v0 (copy)
    local v1043 = l_v4_36.new();
    local v1044 = 0;
    while v1044 < buffer.len(v1042) do
        local v1045 = nil;
        local v1046 = nil;
        local v1047, v1048, v1049 = v0.readTag(v1042, v1044);
        v1045 = v1047;
        v1046 = v1048;
        v1044 = v1049;
        if v1046 == v0.wireTypes.varint then
            v1047 = nil;
            v1048, v1049 = v0.readVarInt(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        elseif v1046 == v0.wireTypes.lengthDelimited then
            if v1045 == 1 then
                v1047 = nil;
                v1048, v1049 = v0.readBuffer(v1042, v1044);
                v1047 = v1048;
                v1044 = v1049;
                v1043.subscription_id = buffer.tostring(v1047);
            else
                v1047 = nil;
                v1048, v1049 = v0.readVarInt(v1042, v1044);
                v1044 = v1049 + v1048;
            end;
        elseif v1046 == v0.wireTypes.i32 then
            v1047 = nil;
            v1048, v1049 = v0.readFixed32(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        elseif v1046 == v0.wireTypes.i64 then
            v1047 = nil;
            v1048, v1049 = v0.readFixed64(v1042, v1044);
            v1047 = v1048;
            v1044 = v1049;
        else
            error("Unsupported wire type: " .. v1046);
        end;
    end;
    return v1043;
end;
v4.jsonEncode = function(v1050) --[[ Line: 7377 ]] --[[ Name: jsonEncode ]]
    local v1051 = {};
    if v1050.subscription_id ~= nil and v1050.subscription_id ~= "" then
        v1051.subscriptionId = v1050.subscription_id;
    end;
    return v1051;
end;
v4.jsonDecode = function(v1052) --[[ Line: 7389 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_36 (copy)
    local v1053 = l_v4_36.new();
    if v1052.subscription_id ~= nil then
        v1053.subscription_id = v1052.subscription_id;
    end;
    if v1052.subscriptionId ~= nil then
        v1053.subscription_id = v1052.subscriptionId;
    end;
    return v1053;
end;
v4.descriptor = {
    name = "GameSubscriptionsGridInputData_SubscriptionItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
};
v2.GameSubscriptionsGridInputData_SubscriptionItem = v4;
v1.default:register(v2.GameSubscriptionsGridInputData_SubscriptionItem);
v4 = {};
v4.__index = v4;
local l_v4_37 = v4 --[[ copy: 4 -> 42 ]];
v4.new = function(v1055) --[[ Line: 7420 ]] --[[ Name: new ]]
    -- upvalues: l_v4_37 (copy)
    return (setmetatable({
        roblox_component = (not (v1055 ~= nil) or v1055.roblox_component == nil) and "" or v1055.roblox_component, 
        identifier = (not (v1055 ~= nil) or v1055.identifier == nil) and "" or v1055.identifier, 
        title = (not (v1055 ~= nil) or v1055.title == nil) and "" or v1055.title, 
        user_id = (not (v1055 ~= nil) or v1055.user_id == nil) and "" or v1055.user_id, 
        description = (not (v1055 ~= nil) or v1055.description == nil) and "" or v1055.description, 
        cta_text = (not (v1055 ~= nil) or v1055.cta_text == nil) and "" or v1055.cta_text, 
        prompt_id = (not (v1055 ~= nil) or v1055.prompt_id == nil) and "" or v1055.prompt_id, 
        prompt_type = (not (v1055 ~= nil) or v1055.prompt_type == nil) and "" or v1055.prompt_type
    }, l_v4_37));
end;
v4.encode = function(v1056) --[[ Line: 7435 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1057 = buffer.create(0);
    local v1058 = 0;
    if v1056.roblox_component ~= nil and v1056.roblox_component ~= "" then
        local v1059, v1060 = v0.writeTag(v1057, v1058, 1, v0.wireTypes.lengthDelimited);
        v1059, v1060 = v0.writeString(v1059, v1060, v1056.roblox_component);
        v1057 = v1059;
        v1058 = v1060;
    end;
    if v1056.identifier ~= nil and v1056.identifier ~= "" then
        local v1061, v1062 = v0.writeTag(v1057, v1058, 2, v0.wireTypes.lengthDelimited);
        v1061, v1062 = v0.writeString(v1061, v1062, v1056.identifier);
        v1057 = v1061;
        v1058 = v1062;
    end;
    if v1056.title ~= nil and v1056.title ~= "" then
        local v1063, v1064 = v0.writeTag(v1057, v1058, 3, v0.wireTypes.lengthDelimited);
        v1063, v1064 = v0.writeString(v1063, v1064, v1056.title);
        v1057 = v1063;
        v1058 = v1064;
    end;
    if v1056.user_id ~= nil and v1056.user_id ~= "" then
        local v1065, v1066 = v0.writeTag(v1057, v1058, 4, v0.wireTypes.lengthDelimited);
        v1065, v1066 = v0.writeString(v1065, v1066, v1056.user_id);
        v1057 = v1065;
        v1058 = v1066;
    end;
    if v1056.description ~= nil and v1056.description ~= "" then
        local v1067, v1068 = v0.writeTag(v1057, v1058, 5, v0.wireTypes.lengthDelimited);
        v1067, v1068 = v0.writeString(v1067, v1068, v1056.description);
        v1057 = v1067;
        v1058 = v1068;
    end;
    if v1056.cta_text ~= nil and v1056.cta_text ~= "" then
        local v1069, v1070 = v0.writeTag(v1057, v1058, 6, v0.wireTypes.lengthDelimited);
        v1069, v1070 = v0.writeString(v1069, v1070, v1056.cta_text);
        v1057 = v1069;
        v1058 = v1070;
    end;
    if v1056.prompt_id ~= nil and v1056.prompt_id ~= "" then
        local v1071, v1072 = v0.writeTag(v1057, v1058, 7, v0.wireTypes.lengthDelimited);
        v1071, v1072 = v0.writeString(v1071, v1072, v1056.prompt_id);
        v1057 = v1071;
        v1058 = v1072;
    end;
    if v1056.prompt_type ~= nil and v1056.prompt_type ~= "" then
        local v1073, v1074 = v0.writeTag(v1057, v1058, 8, v0.wireTypes.lengthDelimited);
        v1073, v1074 = v0.writeString(v1073, v1074, v1056.prompt_type);
        v1057 = v1073;
        v1058 = v1074;
    end;
    local v1075 = buffer.create(v1058);
    buffer.copy(v1075, 0, v1057, 0, v1058);
    return v1075;
end;
v4.decode = function(v1076) --[[ Line: 7484 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_37 (copy), v0 (copy)
    local v1077 = l_v4_37.new();
    local v1078 = 0;
    while v1078 < buffer.len(v1076) do
        local v1079 = nil;
        local v1080 = nil;
        local v1081, v1082, v1083 = v0.readTag(v1076, v1078);
        v1079 = v1081;
        v1080 = v1082;
        v1078 = v1083;
        if v1080 == v0.wireTypes.varint then
            v1081 = nil;
            v1082, v1083 = v0.readVarInt(v1076, v1078);
            v1081 = v1082;
            v1078 = v1083;
        elseif v1080 == v0.wireTypes.lengthDelimited then
            if v1079 == 1 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.roblox_component = buffer.tostring(v1081);
            elseif v1079 == 2 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.identifier = buffer.tostring(v1081);
            elseif v1079 == 3 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.title = buffer.tostring(v1081);
            elseif v1079 == 4 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.user_id = buffer.tostring(v1081);
            elseif v1079 == 5 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.description = buffer.tostring(v1081);
            elseif v1079 == 6 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.cta_text = buffer.tostring(v1081);
            elseif v1079 == 7 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.prompt_id = buffer.tostring(v1081);
            elseif v1079 == 8 then
                v1081 = nil;
                v1082, v1083 = v0.readBuffer(v1076, v1078);
                v1081 = v1082;
                v1078 = v1083;
                v1077.prompt_type = buffer.tostring(v1081);
            else
                v1081 = nil;
                v1082, v1083 = v0.readVarInt(v1076, v1078);
                v1078 = v1083 + v1082;
            end;
        elseif v1080 == v0.wireTypes.i32 then
            v1081 = nil;
            v1082, v1083 = v0.readFixed32(v1076, v1078);
            v1081 = v1082;
            v1078 = v1083;
        elseif v1080 == v0.wireTypes.i64 then
            v1081 = nil;
            v1082, v1083 = v0.readFixed64(v1076, v1078);
            v1081 = v1082;
            v1078 = v1083;
        else
            error("Unsupported wire type: " .. v1080);
        end;
    end;
    return v1077;
end;
v4.jsonEncode = function(v1084) --[[ Line: 7562 ]] --[[ Name: jsonEncode ]]
    local v1085 = {};
    if v1084.roblox_component ~= nil and v1084.roblox_component ~= "" then
        v1085.robloxComponent = v1084.roblox_component;
    end;
    if v1084.identifier ~= nil and v1084.identifier ~= "" then
        v1085.identifier = v1084.identifier;
    end;
    if v1084.title ~= nil and v1084.title ~= "" then
        v1085.title = v1084.title;
    end;
    if v1084.user_id ~= nil and v1084.user_id ~= "" then
        v1085.userId = v1084.user_id;
    end;
    if v1084.description ~= nil and v1084.description ~= "" then
        v1085.description = v1084.description;
    end;
    if v1084.cta_text ~= nil and v1084.cta_text ~= "" then
        v1085.ctaText = v1084.cta_text;
    end;
    if v1084.prompt_id ~= nil and v1084.prompt_id ~= "" then
        v1085.promptId = v1084.prompt_id;
    end;
    if v1084.prompt_type ~= nil and v1084.prompt_type ~= "" then
        v1085.promptType = v1084.prompt_type;
    end;
    return v1085;
end;
v4.jsonDecode = function(v1086) --[[ Line: 7600 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_37 (copy)
    local v1087 = l_v4_37.new();
    if v1086.roblox_component ~= nil then
        v1087.roblox_component = v1086.roblox_component;
    end;
    if v1086.robloxComponent ~= nil then
        v1087.roblox_component = v1086.robloxComponent;
    end;
    if v1086.identifier ~= nil then
        v1087.identifier = v1086.identifier;
    end;
    if v1086.title ~= nil then
        v1087.title = v1086.title;
    end;
    if v1086.user_id ~= nil then
        v1087.user_id = v1086.user_id;
    end;
    if v1086.userId ~= nil then
        v1087.user_id = v1086.userId;
    end;
    if v1086.description ~= nil then
        v1087.description = v1086.description;
    end;
    if v1086.cta_text ~= nil then
        v1087.cta_text = v1086.cta_text;
    end;
    if v1086.ctaText ~= nil then
        v1087.cta_text = v1086.ctaText;
    end;
    if v1086.prompt_id ~= nil then
        v1087.prompt_id = v1086.prompt_id;
    end;
    if v1086.promptId ~= nil then
        v1087.prompt_id = v1086.promptId;
    end;
    if v1086.prompt_type ~= nil then
        v1087.prompt_type = v1086.prompt_type;
    end;
    if v1086.promptType ~= nil then
        v1087.prompt_type = v1086.promptType;
    end;
    return v1087;
end;
v4.descriptor = {
    name = "CardContainerCardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
};
v2.CardContainerCardInputData = v4;
v1.default:register(v2.CardContainerCardInputData);
v4 = {};
v4.__index = v4;
local l_v4_38 = v4 --[[ copy: 4 -> 43 ]];
v4.new = function(v1089) --[[ Line: 7672 ]] --[[ Name: new ]]
    -- upvalues: l_v4_38 (copy)
    return (setmetatable({
        title = (not (v1089 ~= nil) or v1089.title == nil) and "" or v1089.title, 
        dismiss_text = (not (v1089 ~= nil) or v1089.dismiss_text == nil) and "" or v1089.dismiss_text, 
        user_id = (not (v1089 ~= nil) or v1089.user_id == nil) and "" or v1089.user_id, 
        cards = if not (v1089 ~= nil) or v1089.cards == nil then {} else v1089.cards, 
        prompt_id = (not (v1089 ~= nil) or v1089.prompt_id == nil) and "" or v1089.prompt_id, 
        prompt_type = (not (v1089 ~= nil) or v1089.prompt_type == nil) and "" or v1089.prompt_type
    }, l_v4_38));
end;
v4.encode = function(v1090) --[[ Line: 7683 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1091 = buffer.create(0);
    local v1092 = 0;
    if v1090.title ~= nil and v1090.title ~= "" then
        local v1093, v1094 = v0.writeTag(v1091, v1092, 1, v0.wireTypes.lengthDelimited);
        v1093, v1094 = v0.writeString(v1093, v1094, v1090.title);
        v1091 = v1093;
        v1092 = v1094;
    end;
    if v1090.dismiss_text ~= nil and v1090.dismiss_text ~= "" then
        local v1095, v1096 = v0.writeTag(v1091, v1092, 2, v0.wireTypes.lengthDelimited);
        v1095, v1096 = v0.writeString(v1095, v1096, v1090.dismiss_text);
        v1091 = v1095;
        v1092 = v1096;
    end;
    if v1090.user_id ~= nil and v1090.user_id ~= "" then
        local v1097, v1098 = v0.writeTag(v1091, v1092, 3, v0.wireTypes.lengthDelimited);
        v1097, v1098 = v0.writeString(v1097, v1098, v1090.user_id);
        v1091 = v1097;
        v1092 = v1098;
    end;
    if v1090.cards ~= nil and #v1090.cards > 0 then
        for _, v1100 in v1090.cards do
            local v1101 = v1100:encode();
            local v1102, v1103 = v0.writeTag(v1091, v1092, 4, v0.wireTypes.lengthDelimited);
            v1102, v1103 = v0.writeBuffer(v1102, v1103, v1101, buffer.len(v1101));
            v1091 = v1102;
            v1092 = v1103;
        end;
    end;
    if v1090.prompt_id ~= nil and v1090.prompt_id ~= "" then
        local v1104, v1105 = v0.writeTag(v1091, v1092, 5, v0.wireTypes.lengthDelimited);
        v1104, v1105 = v0.writeString(v1104, v1105, v1090.prompt_id);
        v1091 = v1104;
        v1092 = v1105;
    end;
    if v1090.prompt_type ~= nil and v1090.prompt_type ~= "" then
        local v1106, v1107 = v0.writeTag(v1091, v1092, 6, v0.wireTypes.lengthDelimited);
        v1106, v1107 = v0.writeString(v1106, v1107, v1090.prompt_type);
        v1091 = v1106;
        v1092 = v1107;
    end;
    local v1108 = buffer.create(v1092);
    buffer.copy(v1108, 0, v1091, 0, v1092);
    return v1108;
end;
v4.decode = function(v1109) --[[ Line: 7725 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_38 (copy), v0 (copy), v2 (copy)
    local v1110 = l_v4_38.new();
    local v1111 = 0;
    while v1111 < buffer.len(v1109) do
        local v1112 = nil;
        local v1113 = nil;
        local v1114, v1115, v1116 = v0.readTag(v1109, v1111);
        v1112 = v1114;
        v1113 = v1115;
        v1111 = v1116;
        if v1113 == v0.wireTypes.varint then
            v1114 = nil;
            v1115, v1116 = v0.readVarInt(v1109, v1111);
            v1114 = v1115;
            v1111 = v1116;
        elseif v1113 == v0.wireTypes.lengthDelimited then
            if v1112 == 1 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                v1110.title = buffer.tostring(v1114);
            elseif v1112 == 2 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                v1110.dismiss_text = buffer.tostring(v1114);
            elseif v1112 == 3 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                v1110.user_id = buffer.tostring(v1114);
            elseif v1112 == 4 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                table.insert(v1110.cards, v2.CardContainerCardInputData.decode(v1114));
            elseif v1112 == 5 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                v1110.prompt_id = buffer.tostring(v1114);
            elseif v1112 == 6 then
                v1114 = nil;
                v1115, v1116 = v0.readBuffer(v1109, v1111);
                v1114 = v1115;
                v1111 = v1116;
                v1110.prompt_type = buffer.tostring(v1114);
            else
                v1114 = nil;
                v1115, v1116 = v0.readVarInt(v1109, v1111);
                v1111 = v1116 + v1115;
            end;
        elseif v1113 == v0.wireTypes.i32 then
            v1114 = nil;
            v1115, v1116 = v0.readFixed32(v1109, v1111);
            v1114 = v1115;
            v1111 = v1116;
        elseif v1113 == v0.wireTypes.i64 then
            v1114 = nil;
            v1115, v1116 = v0.readFixed64(v1109, v1111);
            v1114 = v1115;
            v1111 = v1116;
        else
            error("Unsupported wire type: " .. v1113);
        end;
    end;
    return v1110;
end;
v4.jsonEncode = function(v1117) --[[ Line: 7793 ]] --[[ Name: jsonEncode ]]
    local v1118 = {};
    if v1117.title ~= nil and v1117.title ~= "" then
        v1118.title = v1117.title;
    end;
    if v1117.dismiss_text ~= nil and v1117.dismiss_text ~= "" then
        v1118.dismissText = v1117.dismiss_text;
    end;
    if v1117.user_id ~= nil and v1117.user_id ~= "" then
        v1118.userId = v1117.user_id;
    end;
    if v1117.cards ~= nil and #v1117.cards > 0 then
        local v1119 = {};
        for _, v1121 in v1117.cards do
            table.insert(v1119, v1121:jsonEncode());
        end;
        v1118.cards = v1119;
    end;
    if v1117.prompt_id ~= nil and v1117.prompt_id ~= "" then
        v1118.promptId = v1117.prompt_id;
    end;
    if v1117.prompt_type ~= nil and v1117.prompt_type ~= "" then
        v1118.promptType = v1117.prompt_type;
    end;
    return v1118;
end;
v4.jsonDecode = function(v1122) --[[ Line: 7827 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_38 (copy), v2 (copy)
    local v1123 = l_v4_38.new();
    if v1122.title ~= nil then
        v1123.title = v1122.title;
    end;
    if v1122.dismiss_text ~= nil then
        v1123.dismiss_text = v1122.dismiss_text;
    end;
    if v1122.dismissText ~= nil then
        v1123.dismiss_text = v1122.dismissText;
    end;
    if v1122.user_id ~= nil then
        v1123.user_id = v1122.user_id;
    end;
    if v1122.userId ~= nil then
        v1123.user_id = v1122.userId;
    end;
    if v1122.cards ~= nil then
        local v1124 = {};
        for _, v1126 in v1122.cards do
            table.insert(v1124, v2.CardContainerCardInputData.jsonDecode(v1126));
        end;
        v1123.cards = v1124;
    end;
    if v1122.prompt_id ~= nil then
        v1123.prompt_id = v1122.prompt_id;
    end;
    if v1122.promptId ~= nil then
        v1123.prompt_id = v1122.promptId;
    end;
    if v1122.prompt_type ~= nil then
        v1123.prompt_type = v1122.prompt_type;
    end;
    if v1122.promptType ~= nil then
        v1123.prompt_type = v1122.promptType;
    end;
    return v1123;
end;
v4.descriptor = {
    name = "CardContainerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
};
v2.CardContainerInputData = v4;
v1.default:register(v2.CardContainerInputData);
v4 = {};
v4.__index = v4;
local l_v4_39 = v4 --[[ copy: 4 -> 44 ]];
v4.new = function(v1128) --[[ Line: 7892 ]] --[[ Name: new ]]
    -- upvalues: l_v4_39 (copy)
    return (setmetatable({
        title = (not (v1128 ~= nil) or v1128.title == nil) and "" or v1128.title, 
        user_id = (not (v1128 ~= nil) or v1128.user_id == nil) and "" or v1128.user_id, 
        description = (not (v1128 ~= nil) or v1128.description == nil) and "" or v1128.description, 
        cta_text = (not (v1128 ~= nil) or v1128.cta_text == nil) and "" or v1128.cta_text, 
        prompt_id = (not (v1128 ~= nil) or v1128.prompt_id == nil) and "" or v1128.prompt_id, 
        prompt_type = (not (v1128 ~= nil) or v1128.prompt_type == nil) and "" or v1128.prompt_type
    }, l_v4_39));
end;
v4.encode = function(v1129) --[[ Line: 7903 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1130 = buffer.create(0);
    local v1131 = 0;
    if v1129.title ~= nil and v1129.title ~= "" then
        local v1132, v1133 = v0.writeTag(v1130, v1131, 1, v0.wireTypes.lengthDelimited);
        v1132, v1133 = v0.writeString(v1132, v1133, v1129.title);
        v1130 = v1132;
        v1131 = v1133;
    end;
    if v1129.user_id ~= nil and v1129.user_id ~= "" then
        local v1134, v1135 = v0.writeTag(v1130, v1131, 2, v0.wireTypes.lengthDelimited);
        v1134, v1135 = v0.writeString(v1134, v1135, v1129.user_id);
        v1130 = v1134;
        v1131 = v1135;
    end;
    if v1129.description ~= nil and v1129.description ~= "" then
        local v1136, v1137 = v0.writeTag(v1130, v1131, 3, v0.wireTypes.lengthDelimited);
        v1136, v1137 = v0.writeString(v1136, v1137, v1129.description);
        v1130 = v1136;
        v1131 = v1137;
    end;
    if v1129.cta_text ~= nil and v1129.cta_text ~= "" then
        local v1138, v1139 = v0.writeTag(v1130, v1131, 4, v0.wireTypes.lengthDelimited);
        v1138, v1139 = v0.writeString(v1138, v1139, v1129.cta_text);
        v1130 = v1138;
        v1131 = v1139;
    end;
    if v1129.prompt_id ~= nil and v1129.prompt_id ~= "" then
        local v1140, v1141 = v0.writeTag(v1130, v1131, 5, v0.wireTypes.lengthDelimited);
        v1140, v1141 = v0.writeString(v1140, v1141, v1129.prompt_id);
        v1130 = v1140;
        v1131 = v1141;
    end;
    if v1129.prompt_type ~= nil and v1129.prompt_type ~= "" then
        local v1142, v1143 = v0.writeTag(v1130, v1131, 6, v0.wireTypes.lengthDelimited);
        v1142, v1143 = v0.writeString(v1142, v1143, v1129.prompt_type);
        v1130 = v1142;
        v1131 = v1143;
    end;
    local v1144 = buffer.create(v1131);
    buffer.copy(v1144, 0, v1130, 0, v1131);
    return v1144;
end;
v4.decode = function(v1145) --[[ Line: 7942 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_39 (copy), v0 (copy)
    local v1146 = l_v4_39.new();
    local v1147 = 0;
    while v1147 < buffer.len(v1145) do
        local v1148 = nil;
        local v1149 = nil;
        local v1150, v1151, v1152 = v0.readTag(v1145, v1147);
        v1148 = v1150;
        v1149 = v1151;
        v1147 = v1152;
        if v1149 == v0.wireTypes.varint then
            v1150 = nil;
            v1151, v1152 = v0.readVarInt(v1145, v1147);
            v1150 = v1151;
            v1147 = v1152;
        elseif v1149 == v0.wireTypes.lengthDelimited then
            if v1148 == 1 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.title = buffer.tostring(v1150);
            elseif v1148 == 2 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.user_id = buffer.tostring(v1150);
            elseif v1148 == 3 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.description = buffer.tostring(v1150);
            elseif v1148 == 4 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.cta_text = buffer.tostring(v1150);
            elseif v1148 == 5 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.prompt_id = buffer.tostring(v1150);
            elseif v1148 == 6 then
                v1150 = nil;
                v1151, v1152 = v0.readBuffer(v1145, v1147);
                v1150 = v1151;
                v1147 = v1152;
                v1146.prompt_type = buffer.tostring(v1150);
            else
                v1150 = nil;
                v1151, v1152 = v0.readVarInt(v1145, v1147);
                v1147 = v1152 + v1151;
            end;
        elseif v1149 == v0.wireTypes.i32 then
            v1150 = nil;
            v1151, v1152 = v0.readFixed32(v1145, v1147);
            v1150 = v1151;
            v1147 = v1152;
        elseif v1149 == v0.wireTypes.i64 then
            v1150 = nil;
            v1151, v1152 = v0.readFixed64(v1145, v1147);
            v1150 = v1151;
            v1147 = v1152;
        else
            error("Unsupported wire type: " .. v1149);
        end;
    end;
    return v1146;
end;
v4.jsonEncode = function(v1153) --[[ Line: 8010 ]] --[[ Name: jsonEncode ]]
    local v1154 = {};
    if v1153.title ~= nil and v1153.title ~= "" then
        v1154.title = v1153.title;
    end;
    if v1153.user_id ~= nil and v1153.user_id ~= "" then
        v1154.userId = v1153.user_id;
    end;
    if v1153.description ~= nil and v1153.description ~= "" then
        v1154.description = v1153.description;
    end;
    if v1153.cta_text ~= nil and v1153.cta_text ~= "" then
        v1154.ctaText = v1153.cta_text;
    end;
    if v1153.prompt_id ~= nil and v1153.prompt_id ~= "" then
        v1154.promptId = v1153.prompt_id;
    end;
    if v1153.prompt_type ~= nil and v1153.prompt_type ~= "" then
        v1154.promptType = v1153.prompt_type;
    end;
    return v1154;
end;
v4.jsonDecode = function(v1155) --[[ Line: 8040 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_39 (copy)
    local v1156 = l_v4_39.new();
    if v1155.title ~= nil then
        v1156.title = v1155.title;
    end;
    if v1155.user_id ~= nil then
        v1156.user_id = v1155.user_id;
    end;
    if v1155.userId ~= nil then
        v1156.user_id = v1155.userId;
    end;
    if v1155.description ~= nil then
        v1156.description = v1155.description;
    end;
    if v1155.cta_text ~= nil then
        v1156.cta_text = v1155.cta_text;
    end;
    if v1155.ctaText ~= nil then
        v1156.cta_text = v1155.ctaText;
    end;
    if v1155.prompt_id ~= nil then
        v1156.prompt_id = v1155.prompt_id;
    end;
    if v1155.promptId ~= nil then
        v1156.prompt_id = v1155.promptId;
    end;
    if v1155.prompt_type ~= nil then
        v1156.prompt_type = v1155.prompt_type;
    end;
    if v1155.promptType ~= nil then
        v1156.prompt_type = v1155.promptType;
    end;
    return v1156;
end;
v4.descriptor = {
    name = "CardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
};
v2.CardInputData = v4;
v1.default:register(v2.CardInputData);
v4 = {};
v4.__index = v4;
local l_v4_40 = v4 --[[ copy: 4 -> 45 ]];
v4.new = function(_) --[[ Line: 8100 ]] --[[ Name: new ]]
    -- upvalues: l_v4_40 (copy)
    return (setmetatable({}, l_v4_40));
end;
v4.encode = function(_) --[[ Line: 8104 ]] --[[ Name: encode ]]
    local v1160 = buffer.create(0);
    local v1161 = buffer.create(0);
    buffer.copy(v1161, 0, v1160, 0, 0);
    return v1161;
end;
v4.decode = function(v1162) --[[ Line: 8113 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_40 (copy), v0 (copy)
    local v1163 = l_v4_40.new();
    local v1164 = 0;
    while v1164 < buffer.len(v1162) do
        local v1165 = nil;
        local v1166 = nil;
        local v1167, v1168, v1169 = v0.readTag(v1162, v1164);
        v1165 = v1167;
        v1166 = v1168;
        v1164 = v1169;
        if v1166 == v0.wireTypes.varint then
            v1167 = nil;
            v1168, v1169 = v0.readVarInt(v1162, v1164);
            v1167 = v1168;
            v1164 = v1169;
        elseif v1166 == v0.wireTypes.lengthDelimited then
            v1167 = nil;
            v1168, v1169 = v0.readVarInt(v1162, v1164);
            v1164 = v1169 + v1168;
        elseif v1166 == v0.wireTypes.i32 then
            v1167 = nil;
            v1168, v1169 = v0.readFixed32(v1162, v1164);
            v1167 = v1168;
            v1164 = v1169;
        elseif v1166 == v0.wireTypes.i64 then
            v1167 = nil;
            v1168, v1169 = v0.readFixed64(v1162, v1164);
            v1167 = v1168;
            v1164 = v1169;
        else
            error("Unsupported wire type: " .. v1166);
        end;
    end;
    return v1163;
end;
v4.jsonEncode = function(_) --[[ Line: 8151 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 8157 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_40 (copy)
    return (l_v4_40.new());
end;
v4.descriptor = {
    name = "DialogInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
};
v2.DialogInputData = v4;
v1.default:register(v2.DialogInputData);
v4 = {};
v4.__index = v4;
local l_v4_41 = v4 --[[ copy: 4 -> 46 ]];
v4.new = function(_) --[[ Line: 8177 ]] --[[ Name: new ]]
    -- upvalues: l_v4_41 (copy)
    return (setmetatable({}, l_v4_41));
end;
v4.encode = function(_) --[[ Line: 8181 ]] --[[ Name: encode ]]
    local v1175 = buffer.create(0);
    local v1176 = buffer.create(0);
    buffer.copy(v1176, 0, v1175, 0, 0);
    return v1176;
end;
v4.decode = function(v1177) --[[ Line: 8190 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_41 (copy), v0 (copy)
    local v1178 = l_v4_41.new();
    local v1179 = 0;
    while v1179 < buffer.len(v1177) do
        local v1180 = nil;
        local v1181 = nil;
        local v1182, v1183, v1184 = v0.readTag(v1177, v1179);
        v1180 = v1182;
        v1181 = v1183;
        v1179 = v1184;
        if v1181 == v0.wireTypes.varint then
            v1182 = nil;
            v1183, v1184 = v0.readVarInt(v1177, v1179);
            v1182 = v1183;
            v1179 = v1184;
        elseif v1181 == v0.wireTypes.lengthDelimited then
            v1182 = nil;
            v1183, v1184 = v0.readVarInt(v1177, v1179);
            v1179 = v1184 + v1183;
        elseif v1181 == v0.wireTypes.i32 then
            v1182 = nil;
            v1183, v1184 = v0.readFixed32(v1177, v1179);
            v1182 = v1183;
            v1179 = v1184;
        elseif v1181 == v0.wireTypes.i64 then
            v1182 = nil;
            v1183, v1184 = v0.readFixed64(v1177, v1179);
            v1182 = v1183;
            v1179 = v1184;
        else
            error("Unsupported wire type: " .. v1181);
        end;
    end;
    return v1178;
end;
v4.jsonEncode = function(_) --[[ Line: 8228 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 8234 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_41 (copy)
    return (l_v4_41.new());
end;
v4.descriptor = {
    name = "BannerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
};
v2.BannerInputData = v4;
v1.default:register(v2.BannerInputData);
v4 = {};
v4.__index = v4;
local l_v4_42 = v4 --[[ copy: 4 -> 47 ]];
v4.new = function(_) --[[ Line: 8254 ]] --[[ Name: new ]]
    -- upvalues: l_v4_42 (copy)
    return (setmetatable({}, l_v4_42));
end;
v4.encode = function(_) --[[ Line: 8258 ]] --[[ Name: encode ]]
    local v1190 = buffer.create(0);
    local v1191 = buffer.create(0);
    buffer.copy(v1191, 0, v1190, 0, 0);
    return v1191;
end;
v4.decode = function(v1192) --[[ Line: 8267 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_42 (copy), v0 (copy)
    local v1193 = l_v4_42.new();
    local v1194 = 0;
    while v1194 < buffer.len(v1192) do
        local v1195 = nil;
        local v1196 = nil;
        local v1197, v1198, v1199 = v0.readTag(v1192, v1194);
        v1195 = v1197;
        v1196 = v1198;
        v1194 = v1199;
        if v1196 == v0.wireTypes.varint then
            v1197 = nil;
            v1198, v1199 = v0.readVarInt(v1192, v1194);
            v1197 = v1198;
            v1194 = v1199;
        elseif v1196 == v0.wireTypes.lengthDelimited then
            v1197 = nil;
            v1198, v1199 = v0.readVarInt(v1192, v1194);
            v1194 = v1199 + v1198;
        elseif v1196 == v0.wireTypes.i32 then
            v1197 = nil;
            v1198, v1199 = v0.readFixed32(v1192, v1194);
            v1197 = v1198;
            v1194 = v1199;
        elseif v1196 == v0.wireTypes.i64 then
            v1197 = nil;
            v1198, v1199 = v0.readFixed64(v1192, v1194);
            v1197 = v1198;
            v1194 = v1199;
        else
            error("Unsupported wire type: " .. v1196);
        end;
    end;
    return v1193;
end;
v4.jsonEncode = function(_) --[[ Line: 8305 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 8311 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_42 (copy)
    return (l_v4_42.new());
end;
v4.descriptor = {
    name = "TooltipInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
};
v2.TooltipInputData = v4;
v1.default:register(v2.TooltipInputData);
v4 = {};
v4.__index = v4;
local l_v4_43 = v4 --[[ copy: 4 -> 48 ]];
v4.new = function(v1203) --[[ Line: 8331 ]] --[[ Name: new ]]
    -- upvalues: l_v4_43 (copy)
    return (setmetatable({
        event_id = (not (v1203 ~= nil) or v1203.event_id == nil) and 0 or v1203.event_id, 
        entry_map = if not (v1203 ~= nil) or v1203.entry_map == nil then {} else v1203.entry_map, 
        entry_order = if not (v1203 ~= nil) or v1203.entry_order == nil then {} else v1203.entry_order
    }, l_v4_43));
end;
v4.encode = function(v1204) --[[ Line: 8341 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1205 = buffer.create(0);
    local v1206 = 0;
    if v1204.event_id ~= nil and v1204.event_id ~= 0 then
        local v1207, v1208 = v0.writeTag(v1205, v1206, 1, v0.wireTypes.varint);
        v1207, v1208 = v0.writeVarInt(v1207, v1208, v1204.event_id);
        v1205 = v1207;
        v1206 = v1208;
    end;
    if v1204.entry_map ~= nil and next(v1204.entry_map) ~= nil then
        for v1209, v1210 in v1204.entry_map do
            local v1211 = buffer.create(0);
            local v1212, v1213 = v0.writeTag(v1211, 0, 1, v0.wireTypes.lengthDelimited);
            v1212, v1213 = v0.writeString(v1212, v1213, v1209);
            v1211 = v1212;
            local l_v1213_0 = v1213;
            v1212 = v1210:encode();
            local v1215;
            v1213, v1215 = v0.writeTag(v1211, l_v1213_0, 2, v0.wireTypes.lengthDelimited);
            v1213, v1215 = v0.writeBuffer(v1213, v1215, v1212, buffer.len(v1212));
            v1211 = v1213;
            l_v1213_0 = v1215;
            v1213, v1215 = v0.writeTag(v1205, v1206, 3, v0.wireTypes.lengthDelimited);
            v1213, v1215 = v0.writeBuffer(v1213, v1215, v1211, l_v1213_0);
            v1205 = v1213;
            v1206 = v1215;
        end;
    end;
    if v1204.entry_order ~= nil and #v1204.entry_order > 0 then
        for _, v1217 in v1204.entry_order do
            local v1218, v1219 = v0.writeTag(v1205, v1206, 4, v0.wireTypes.lengthDelimited);
            v1218, v1219 = v0.writeString(v1218, v1219, v1217);
            v1205 = v1218;
            v1206 = v1219;
        end;
    end;
    local v1220 = buffer.create(v1206);
    buffer.copy(v1220, 0, v1205, 0, v1206);
    return v1220;
end;
v4.decode = function(v1221) --[[ Line: 8376 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_43 (copy), v0 (copy), v2 (copy)
    local v1222 = l_v4_43.new();
    local v1223 = 0;
    while v1223 < buffer.len(v1221) do
        local v1224 = nil;
        local v1225 = nil;
        local v1226, v1227, v1228 = v0.readTag(v1221, v1223);
        v1224 = v1226;
        v1225 = v1227;
        v1223 = v1228;
        if v1225 == v0.wireTypes.varint then
            if v1224 == 1 then
                v1226 = nil;
                v1227, v1228 = v0.readVarIntI64(v1221, v1223);
                v1226 = v1227;
                v1223 = v1228;
                v1222.event_id = v1226;
            else
                v1226 = nil;
                v1227, v1228 = v0.readVarInt(v1221, v1223);
                v1226 = v1227;
                v1223 = v1228;
            end;
        elseif v1225 == v0.wireTypes.lengthDelimited then
            if v1224 == 3 then
                v1226 = nil;
                v1227, v1228 = v0.readBuffer(v1221, v1223);
                v1226 = v1227;
                v1223 = v1228;
                v1227 = v2.EventDetailsFeedInputData_EntryMapEntry.decode(v1226);
                v1228 = v2.FeedEntry.new();
                v1222.entry_map[v1227.key or ""] = v1227.value or v1228;
            elseif v1224 == 4 then
                v1226 = nil;
                v1227, v1228 = v0.readBuffer(v1221, v1223);
                v1226 = v1227;
                v1223 = v1228;
                table.insert(v1222.entry_order, buffer.tostring(v1226));
            else
                v1226 = nil;
                v1227, v1228 = v0.readVarInt(v1221, v1223);
                v1223 = v1228 + v1227;
            end;
        elseif v1225 == v0.wireTypes.i32 then
            v1226 = nil;
            v1227, v1228 = v0.readFixed32(v1221, v1223);
            v1226 = v1227;
            v1223 = v1228;
        elseif v1225 == v0.wireTypes.i64 then
            v1226 = nil;
            v1227, v1228 = v0.readFixed64(v1221, v1223);
            v1226 = v1227;
            v1223 = v1228;
        else
            error("Unsupported wire type: " .. v1225);
        end;
    end;
    return v1222;
end;
v4.jsonEncode = function(v1229) --[[ Line: 8436 ]] --[[ Name: jsonEncode ]]
    local v1230 = {};
    if v1229.event_id ~= nil and v1229.event_id ~= 0 then
        v1230.eventId = v1229.event_id;
    end;
    if v1229.entry_map ~= nil and next(v1229.entry_map) ~= nil then
        local v1231 = {};
        for v1232, v1233 in v1229.entry_map do
            v1231[v1232] = v1233:jsonEncode();
        end;
        v1230.entryMap = v1231;
    end;
    if v1229.entry_order ~= nil and #v1229.entry_order > 0 then
        local v1234 = {};
        for _, v1236 in v1229.entry_order do
            table.insert(v1234, v1236);
        end;
        v1230.entryOrder = v1234;
    end;
    return v1230;
end;
v4.jsonDecode = function(v1237) --[[ Line: 8462 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_43 (copy), v2 (copy)
    local v1238 = l_v4_43.new();
    if v1237.event_id ~= nil then
        v1238.event_id = v1237.event_id;
    end;
    if v1237.eventId ~= nil then
        v1238.event_id = v1237.eventId;
    end;
    if v1237.entry_map ~= nil then
        local v1239 = {};
        for v1240, v1241 in v1237.entry_map do
            v1239[v1240] = v2.FeedEntry.jsonDecode(v1241);
        end;
        v1238.entry_map = v1239;
    end;
    if v1237.entryMap ~= nil then
        local v1242 = {};
        for v1243, v1244 in v1237.entryMap do
            v1242[v1243] = v2.FeedEntry.jsonDecode(v1244);
        end;
        v1238.entry_map = v1242;
    end;
    if v1237.entry_order ~= nil then
        local v1245 = {};
        for _, v1247 in v1237.entry_order do
            table.insert(v1245, v1247);
        end;
        v1238.entry_order = v1245;
    end;
    if v1237.entryOrder ~= nil then
        local v1248 = {};
        for _, v1250 in v1237.entryOrder do
            table.insert(v1248, v1250);
        end;
        v1238.entry_order = v1248;
    end;
    return v1238;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
};
v2.EventDetailsFeedInputData = v4;
v1.default:register(v2.EventDetailsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_44 = v4 --[[ copy: 4 -> 49 ]];
v4.new = function(v1252) --[[ Line: 8526 ]] --[[ Name: new ]]
    -- upvalues: l_v4_44 (copy)
    return (setmetatable({
        key = (not (v1252 ~= nil) or v1252.key == nil) and "" or v1252.key, 
        value = if not (v1252 ~= nil) or v1252.value == nil then nil else v1252.value
    }, l_v4_44));
end;
v4.encode = function(v1253) --[[ Line: 8535 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1254 = buffer.create(0);
    local v1255 = 0;
    if v1253.key ~= nil and v1253.key ~= "" then
        local v1256, v1257 = v0.writeTag(v1254, v1255, 1, v0.wireTypes.lengthDelimited);
        v1256, v1257 = v0.writeString(v1256, v1257, v1253.key);
        v1254 = v1256;
        v1255 = v1257;
    end;
    if v1253.value ~= nil then
        local v1258 = v1253.value:encode();
        local v1259, v1260 = v0.writeTag(v1254, v1255, 2, v0.wireTypes.lengthDelimited);
        v1259, v1260 = v0.writeBuffer(v1259, v1260, v1258, buffer.len(v1258));
        v1254 = v1259;
        v1255 = v1260;
    end;
    local v1261 = buffer.create(v1255);
    buffer.copy(v1261, 0, v1254, 0, v1255);
    return v1261;
end;
v4.decode = function(v1262) --[[ Line: 8555 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_44 (copy), v0 (copy), v2 (copy)
    local v1263 = l_v4_44.new();
    local v1264 = 0;
    while v1264 < buffer.len(v1262) do
        local v1265 = nil;
        local v1266 = nil;
        local v1267, v1268, v1269 = v0.readTag(v1262, v1264);
        v1265 = v1267;
        v1266 = v1268;
        v1264 = v1269;
        if v1266 == v0.wireTypes.varint then
            v1267 = nil;
            v1268, v1269 = v0.readVarInt(v1262, v1264);
            v1267 = v1268;
            v1264 = v1269;
        elseif v1266 == v0.wireTypes.lengthDelimited then
            if v1265 == 1 then
                v1267 = nil;
                v1268, v1269 = v0.readBuffer(v1262, v1264);
                v1267 = v1268;
                v1264 = v1269;
                v1263.key = buffer.tostring(v1267);
            elseif v1265 == 2 then
                v1267 = nil;
                v1268, v1269 = v0.readBuffer(v1262, v1264);
                v1267 = v1268;
                v1264 = v1269;
                v1263.value = v2.FeedEntry.decode(v1267);
            else
                v1267 = nil;
                v1268, v1269 = v0.readVarInt(v1262, v1264);
                v1264 = v1269 + v1268;
            end;
        elseif v1266 == v0.wireTypes.i32 then
            v1267 = nil;
            v1268, v1269 = v0.readFixed32(v1262, v1264);
            v1267 = v1268;
            v1264 = v1269;
        elseif v1266 == v0.wireTypes.i64 then
            v1267 = nil;
            v1268, v1269 = v0.readFixed64(v1262, v1264);
            v1267 = v1268;
            v1264 = v1269;
        else
            error("Unsupported wire type: " .. v1266);
        end;
    end;
    return v1263;
end;
v4.jsonEncode = function(v1270) --[[ Line: 8603 ]] --[[ Name: jsonEncode ]]
    local v1271 = {};
    if v1270.key ~= nil and v1270.key ~= "" then
        v1271.key = v1270.key;
    end;
    if v1270.value ~= nil then
        v1271.value = v1270.value:jsonEncode();
    end;
    return v1271;
end;
v4.jsonDecode = function(v1272) --[[ Line: 8617 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_44 (copy), v2 (copy)
    local v1273 = l_v4_44.new();
    if v1272.key ~= nil then
        v1273.key = v1272.key;
    end;
    if v1272.value ~= nil then
        v1273.value = v2.FeedEntry.jsonDecode(v1272.value);
    end;
    return v1273;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.EventDetailsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.EventDetailsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_45 = v4 --[[ copy: 4 -> 50 ]];
v4.new = function(v1275) --[[ Line: 8647 ]] --[[ Name: new ]]
    -- upvalues: l_v4_45 (copy)
    return (setmetatable({
        entry_map = if not (v1275 ~= nil) or v1275.entry_map == nil then {} else v1275.entry_map, 
        entry_order = if not (v1275 ~= nil) or v1275.entry_order == nil then {} else v1275.entry_order, 
        next_page_token = (not (v1275 ~= nil) or v1275.next_page_token == nil) and "" or v1275.next_page_token
    }, l_v4_45));
end;
v4.encode = function(v1276) --[[ Line: 8655 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1277 = buffer.create(0);
    local v1278 = 0;
    if v1276.entry_map ~= nil and next(v1276.entry_map) ~= nil then
        for v1279, v1280 in v1276.entry_map do
            local v1281 = buffer.create(0);
            local v1282, v1283 = v0.writeTag(v1281, 0, 1, v0.wireTypes.lengthDelimited);
            v1282, v1283 = v0.writeString(v1282, v1283, v1279);
            v1281 = v1282;
            local l_v1283_0 = v1283;
            v1282 = v1280:encode();
            local v1285;
            v1283, v1285 = v0.writeTag(v1281, l_v1283_0, 2, v0.wireTypes.lengthDelimited);
            v1283, v1285 = v0.writeBuffer(v1283, v1285, v1282, buffer.len(v1282));
            v1281 = v1283;
            l_v1283_0 = v1285;
            v1283, v1285 = v0.writeTag(v1277, v1278, 1, v0.wireTypes.lengthDelimited);
            v1283, v1285 = v0.writeBuffer(v1283, v1285, v1281, l_v1283_0);
            v1277 = v1283;
            v1278 = v1285;
        end;
    end;
    if v1276.entry_order ~= nil and #v1276.entry_order > 0 then
        for _, v1287 in v1276.entry_order do
            local v1288, v1289 = v0.writeTag(v1277, v1278, 2, v0.wireTypes.lengthDelimited);
            v1288, v1289 = v0.writeString(v1288, v1289, v1287);
            v1277 = v1288;
            v1278 = v1289;
        end;
    end;
    if v1276.next_page_token ~= nil and v1276.next_page_token ~= "" then
        local v1290, v1291 = v0.writeTag(v1277, v1278, 3, v0.wireTypes.lengthDelimited);
        v1290, v1291 = v0.writeString(v1290, v1291, v1276.next_page_token);
        v1277 = v1290;
        v1278 = v1291;
    end;
    local v1292 = buffer.create(v1278);
    buffer.copy(v1292, 0, v1277, 0, v1278);
    return v1292;
end;
v4.decode = function(v1293) --[[ Line: 8690 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_45 (copy), v0 (copy), v2 (copy)
    local v1294 = l_v4_45.new();
    local v1295 = 0;
    while v1295 < buffer.len(v1293) do
        local v1296 = nil;
        local v1297 = nil;
        local v1298, v1299, v1300 = v0.readTag(v1293, v1295);
        v1296 = v1298;
        v1297 = v1299;
        v1295 = v1300;
        if v1297 == v0.wireTypes.varint then
            v1298 = nil;
            v1299, v1300 = v0.readVarInt(v1293, v1295);
            v1298 = v1299;
            v1295 = v1300;
        elseif v1297 == v0.wireTypes.lengthDelimited then
            if v1296 == 1 then
                v1298 = nil;
                v1299, v1300 = v0.readBuffer(v1293, v1295);
                v1298 = v1299;
                v1295 = v1300;
                v1299 = v2.ChartsFeedInputData_EntryMapEntry.decode(v1298);
                v1300 = v2.FeedEntry.new();
                v1294.entry_map[v1299.key or ""] = v1299.value or v1300;
            elseif v1296 == 2 then
                v1298 = nil;
                v1299, v1300 = v0.readBuffer(v1293, v1295);
                v1298 = v1299;
                v1295 = v1300;
                table.insert(v1294.entry_order, buffer.tostring(v1298));
            elseif v1296 == 3 then
                v1298 = nil;
                v1299, v1300 = v0.readBuffer(v1293, v1295);
                v1298 = v1299;
                v1295 = v1300;
                v1294.next_page_token = buffer.tostring(v1298);
            else
                v1298 = nil;
                v1299, v1300 = v0.readVarInt(v1293, v1295);
                v1295 = v1300 + v1299;
            end;
        elseif v1297 == v0.wireTypes.i32 then
            v1298 = nil;
            v1299, v1300 = v0.readFixed32(v1293, v1295);
            v1298 = v1299;
            v1295 = v1300;
        elseif v1297 == v0.wireTypes.i64 then
            v1298 = nil;
            v1299, v1300 = v0.readFixed64(v1293, v1295);
            v1298 = v1299;
            v1295 = v1300;
        else
            error("Unsupported wire type: " .. v1297);
        end;
    end;
    return v1294;
end;
v4.jsonEncode = function(v1301) --[[ Line: 8750 ]] --[[ Name: jsonEncode ]]
    local v1302 = {};
    if v1301.entry_map ~= nil and next(v1301.entry_map) ~= nil then
        local v1303 = {};
        for v1304, v1305 in v1301.entry_map do
            v1303[v1304] = v1305:jsonEncode();
        end;
        v1302.entryMap = v1303;
    end;
    if v1301.entry_order ~= nil and #v1301.entry_order > 0 then
        local v1306 = {};
        for _, v1308 in v1301.entry_order do
            table.insert(v1306, v1308);
        end;
        v1302.entryOrder = v1306;
    end;
    if v1301.next_page_token ~= nil and v1301.next_page_token ~= "" then
        v1302.nextPageToken = v1301.next_page_token;
    end;
    return v1302;
end;
v4.jsonDecode = function(v1309) --[[ Line: 8776 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_45 (copy), v2 (copy)
    local v1310 = l_v4_45.new();
    if v1309.entry_map ~= nil then
        local v1311 = {};
        for v1312, v1313 in v1309.entry_map do
            v1311[v1312] = v2.FeedEntry.jsonDecode(v1313);
        end;
        v1310.entry_map = v1311;
    end;
    if v1309.entryMap ~= nil then
        local v1314 = {};
        for v1315, v1316 in v1309.entryMap do
            v1314[v1315] = v2.FeedEntry.jsonDecode(v1316);
        end;
        v1310.entry_map = v1314;
    end;
    if v1309.entry_order ~= nil then
        local v1317 = {};
        for _, v1319 in v1309.entry_order do
            table.insert(v1317, v1319);
        end;
        v1310.entry_order = v1317;
    end;
    if v1309.entryOrder ~= nil then
        local v1320 = {};
        for _, v1322 in v1309.entryOrder do
            table.insert(v1320, v1322);
        end;
        v1310.entry_order = v1320;
    end;
    if v1309.next_page_token ~= nil then
        v1310.next_page_token = v1309.next_page_token;
    end;
    if v1309.nextPageToken ~= nil then
        v1310.next_page_token = v1309.nextPageToken;
    end;
    return v1310;
end;
v4.descriptor = {
    name = "ChartsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
};
v2.ChartsFeedInputData = v4;
v1.default:register(v2.ChartsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_46 = v4 --[[ copy: 4 -> 51 ]];
v4.new = function(v1324) --[[ Line: 8840 ]] --[[ Name: new ]]
    -- upvalues: l_v4_46 (copy)
    return (setmetatable({
        key = (not (v1324 ~= nil) or v1324.key == nil) and "" or v1324.key, 
        value = if not (v1324 ~= nil) or v1324.value == nil then nil else v1324.value
    }, l_v4_46));
end;
v4.encode = function(v1325) --[[ Line: 8849 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1326 = buffer.create(0);
    local v1327 = 0;
    if v1325.key ~= nil and v1325.key ~= "" then
        local v1328, v1329 = v0.writeTag(v1326, v1327, 1, v0.wireTypes.lengthDelimited);
        v1328, v1329 = v0.writeString(v1328, v1329, v1325.key);
        v1326 = v1328;
        v1327 = v1329;
    end;
    if v1325.value ~= nil then
        local v1330 = v1325.value:encode();
        local v1331, v1332 = v0.writeTag(v1326, v1327, 2, v0.wireTypes.lengthDelimited);
        v1331, v1332 = v0.writeBuffer(v1331, v1332, v1330, buffer.len(v1330));
        v1326 = v1331;
        v1327 = v1332;
    end;
    local v1333 = buffer.create(v1327);
    buffer.copy(v1333, 0, v1326, 0, v1327);
    return v1333;
end;
v4.decode = function(v1334) --[[ Line: 8869 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_46 (copy), v0 (copy), v2 (copy)
    local v1335 = l_v4_46.new();
    local v1336 = 0;
    while v1336 < buffer.len(v1334) do
        local v1337 = nil;
        local v1338 = nil;
        local v1339, v1340, v1341 = v0.readTag(v1334, v1336);
        v1337 = v1339;
        v1338 = v1340;
        v1336 = v1341;
        if v1338 == v0.wireTypes.varint then
            v1339 = nil;
            v1340, v1341 = v0.readVarInt(v1334, v1336);
            v1339 = v1340;
            v1336 = v1341;
        elseif v1338 == v0.wireTypes.lengthDelimited then
            if v1337 == 1 then
                v1339 = nil;
                v1340, v1341 = v0.readBuffer(v1334, v1336);
                v1339 = v1340;
                v1336 = v1341;
                v1335.key = buffer.tostring(v1339);
            elseif v1337 == 2 then
                v1339 = nil;
                v1340, v1341 = v0.readBuffer(v1334, v1336);
                v1339 = v1340;
                v1336 = v1341;
                v1335.value = v2.FeedEntry.decode(v1339);
            else
                v1339 = nil;
                v1340, v1341 = v0.readVarInt(v1334, v1336);
                v1336 = v1341 + v1340;
            end;
        elseif v1338 == v0.wireTypes.i32 then
            v1339 = nil;
            v1340, v1341 = v0.readFixed32(v1334, v1336);
            v1339 = v1340;
            v1336 = v1341;
        elseif v1338 == v0.wireTypes.i64 then
            v1339 = nil;
            v1340, v1341 = v0.readFixed64(v1334, v1336);
            v1339 = v1340;
            v1336 = v1341;
        else
            error("Unsupported wire type: " .. v1338);
        end;
    end;
    return v1335;
end;
v4.jsonEncode = function(v1342) --[[ Line: 8917 ]] --[[ Name: jsonEncode ]]
    local v1343 = {};
    if v1342.key ~= nil and v1342.key ~= "" then
        v1343.key = v1342.key;
    end;
    if v1342.value ~= nil then
        v1343.value = v1342.value:jsonEncode();
    end;
    return v1343;
end;
v4.jsonDecode = function(v1344) --[[ Line: 8931 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_46 (copy), v2 (copy)
    local v1345 = l_v4_46.new();
    if v1344.key ~= nil then
        v1345.key = v1344.key;
    end;
    if v1344.value ~= nil then
        v1345.value = v2.FeedEntry.jsonDecode(v1344.value);
    end;
    return v1345;
end;
v4.descriptor = {
    name = "ChartsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.ChartsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.ChartsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_47 = v4 --[[ copy: 4 -> 52 ]];
v4.new = function(v1347) --[[ Line: 8961 ]] --[[ Name: new ]]
    -- upvalues: l_v4_47 (copy)
    return (setmetatable({
        filter_groups = if not (v1347 ~= nil) or v1347.filter_groups == nil then {} else v1347.filter_groups
    }, l_v4_47));
end;
v4.encode = function(v1348) --[[ Line: 8967 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1349 = buffer.create(0);
    local v1350 = 0;
    if v1348.filter_groups ~= nil and #v1348.filter_groups > 0 then
        for _, v1352 in v1348.filter_groups do
            local v1353 = v1352:encode();
            local v1354, v1355 = v0.writeTag(v1349, v1350, 1, v0.wireTypes.lengthDelimited);
            v1354, v1355 = v0.writeBuffer(v1354, v1355, v1353, buffer.len(v1353));
            v1349 = v1354;
            v1350 = v1355;
        end;
    end;
    local v1356 = buffer.create(v1350);
    buffer.copy(v1356, 0, v1349, 0, v1350);
    return v1356;
end;
v4.decode = function(v1357) --[[ Line: 8984 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_47 (copy), v0 (copy), v2 (copy)
    local v1358 = l_v4_47.new();
    local v1359 = 0;
    while v1359 < buffer.len(v1357) do
        local v1360 = nil;
        local v1361 = nil;
        local v1362, v1363, v1364 = v0.readTag(v1357, v1359);
        v1360 = v1362;
        v1361 = v1363;
        v1359 = v1364;
        if v1361 == v0.wireTypes.varint then
            v1362 = nil;
            v1363, v1364 = v0.readVarInt(v1357, v1359);
            v1362 = v1363;
            v1359 = v1364;
        elseif v1361 == v0.wireTypes.lengthDelimited then
            if v1360 == 1 then
                v1362 = nil;
                v1363, v1364 = v0.readBuffer(v1357, v1359);
                v1362 = v1363;
                v1359 = v1364;
                table.insert(v1358.filter_groups, v2.FilterPillsInputData_FilterGroup.decode(v1362));
            else
                v1362 = nil;
                v1363, v1364 = v0.readVarInt(v1357, v1359);
                v1359 = v1364 + v1363;
            end;
        elseif v1361 == v0.wireTypes.i32 then
            v1362 = nil;
            v1363, v1364 = v0.readFixed32(v1357, v1359);
            v1362 = v1363;
            v1359 = v1364;
        elseif v1361 == v0.wireTypes.i64 then
            v1362 = nil;
            v1363, v1364 = v0.readFixed64(v1357, v1359);
            v1362 = v1363;
            v1359 = v1364;
        else
            error("Unsupported wire type: " .. v1361);
        end;
    end;
    return v1358;
end;
v4.jsonEncode = function(v1365) --[[ Line: 9027 ]] --[[ Name: jsonEncode ]]
    local v1366 = {};
    if v1365.filter_groups ~= nil and #v1365.filter_groups > 0 then
        local v1367 = {};
        for _, v1369 in v1365.filter_groups do
            table.insert(v1367, v1369:jsonEncode());
        end;
        v1366.filterGroups = v1367;
    end;
    return v1366;
end;
v4.jsonDecode = function(v1370) --[[ Line: 9041 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_47 (copy), v2 (copy)
    local v1371 = l_v4_47.new();
    if v1370.filter_groups ~= nil then
        local v1372 = {};
        for _, v1374 in v1370.filter_groups do
            table.insert(v1372, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1374));
        end;
        v1371.filter_groups = v1372;
    end;
    if v1370.filterGroups ~= nil then
        local v1375 = {};
        for _, v1377 in v1370.filterGroups do
            table.insert(v1375, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1377));
        end;
        v1371.filter_groups = v1375;
    end;
    return v1371;
end;
v4.descriptor = {
    name = "FilterPillsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
};
v2.FilterPillsInputData = v4;
v1.default:register(v2.FilterPillsInputData);
v4 = {};
v4.__index = v4;
local l_v4_48 = v4 --[[ copy: 4 -> 53 ]];
v4.new = function(v1379) --[[ Line: 9079 ]] --[[ Name: new ]]
    -- upvalues: l_v4_48 (copy)
    return (setmetatable({
        filter_id = (not (v1379 ~= nil) or v1379.filter_id == nil) and "" or v1379.filter_id, 
        display_name = (not (v1379 ~= nil) or v1379.display_name == nil) and "" or v1379.display_name, 
        options = if not (v1379 ~= nil) or v1379.options == nil then {} else v1379.options, 
        default_option_id = (not (v1379 ~= nil) or v1379.default_option_id == nil) and "" or v1379.default_option_id
    }, l_v4_48));
end;
v4.encode = function(v1380) --[[ Line: 9090 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1381 = buffer.create(0);
    local v1382 = 0;
    if v1380.filter_id ~= nil and v1380.filter_id ~= "" then
        local v1383, v1384 = v0.writeTag(v1381, v1382, 1, v0.wireTypes.lengthDelimited);
        v1383, v1384 = v0.writeString(v1383, v1384, v1380.filter_id);
        v1381 = v1383;
        v1382 = v1384;
    end;
    if v1380.display_name ~= nil and v1380.display_name ~= "" then
        local v1385, v1386 = v0.writeTag(v1381, v1382, 2, v0.wireTypes.lengthDelimited);
        v1385, v1386 = v0.writeString(v1385, v1386, v1380.display_name);
        v1381 = v1385;
        v1382 = v1386;
    end;
    if v1380.options ~= nil and #v1380.options > 0 then
        for _, v1388 in v1380.options do
            local v1389 = v1388:encode();
            local v1390, v1391 = v0.writeTag(v1381, v1382, 3, v0.wireTypes.lengthDelimited);
            v1390, v1391 = v0.writeBuffer(v1390, v1391, v1389, buffer.len(v1389));
            v1381 = v1390;
            v1382 = v1391;
        end;
    end;
    if v1380.default_option_id ~= nil and v1380.default_option_id ~= "" then
        local v1392, v1393 = v0.writeTag(v1381, v1382, 4, v0.wireTypes.lengthDelimited);
        v1392, v1393 = v0.writeString(v1392, v1393, v1380.default_option_id);
        v1381 = v1392;
        v1382 = v1393;
    end;
    local v1394 = buffer.create(v1382);
    buffer.copy(v1394, 0, v1381, 0, v1382);
    return v1394;
end;
v4.decode = function(v1395) --[[ Line: 9122 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_48 (copy), v0 (copy), v2 (copy)
    local v1396 = l_v4_48.new();
    local v1397 = 0;
    while v1397 < buffer.len(v1395) do
        local v1398 = nil;
        local v1399 = nil;
        local v1400, v1401, v1402 = v0.readTag(v1395, v1397);
        v1398 = v1400;
        v1399 = v1401;
        v1397 = v1402;
        if v1399 == v0.wireTypes.varint then
            v1400 = nil;
            v1401, v1402 = v0.readVarInt(v1395, v1397);
            v1400 = v1401;
            v1397 = v1402;
        elseif v1399 == v0.wireTypes.lengthDelimited then
            if v1398 == 1 then
                v1400 = nil;
                v1401, v1402 = v0.readBuffer(v1395, v1397);
                v1400 = v1401;
                v1397 = v1402;
                v1396.filter_id = buffer.tostring(v1400);
            elseif v1398 == 2 then
                v1400 = nil;
                v1401, v1402 = v0.readBuffer(v1395, v1397);
                v1400 = v1401;
                v1397 = v1402;
                v1396.display_name = buffer.tostring(v1400);
            elseif v1398 == 3 then
                v1400 = nil;
                v1401, v1402 = v0.readBuffer(v1395, v1397);
                v1400 = v1401;
                v1397 = v1402;
                table.insert(v1396.options, v2.FilterPillsInputData_FilterOption.decode(v1400));
            elseif v1398 == 4 then
                v1400 = nil;
                v1401, v1402 = v0.readBuffer(v1395, v1397);
                v1400 = v1401;
                v1397 = v1402;
                v1396.default_option_id = buffer.tostring(v1400);
            else
                v1400 = nil;
                v1401, v1402 = v0.readVarInt(v1395, v1397);
                v1397 = v1402 + v1401;
            end;
        elseif v1399 == v0.wireTypes.i32 then
            v1400 = nil;
            v1401, v1402 = v0.readFixed32(v1395, v1397);
            v1400 = v1401;
            v1397 = v1402;
        elseif v1399 == v0.wireTypes.i64 then
            v1400 = nil;
            v1401, v1402 = v0.readFixed64(v1395, v1397);
            v1400 = v1401;
            v1397 = v1402;
        else
            error("Unsupported wire type: " .. v1399);
        end;
    end;
    return v1396;
end;
v4.jsonEncode = function(v1403) --[[ Line: 9180 ]] --[[ Name: jsonEncode ]]
    local v1404 = {};
    if v1403.filter_id ~= nil and v1403.filter_id ~= "" then
        v1404.filterId = v1403.filter_id;
    end;
    if v1403.display_name ~= nil and v1403.display_name ~= "" then
        v1404.displayName = v1403.display_name;
    end;
    if v1403.options ~= nil and #v1403.options > 0 then
        local v1405 = {};
        for _, v1407 in v1403.options do
            table.insert(v1405, v1407:jsonEncode());
        end;
        v1404.options = v1405;
    end;
    if v1403.default_option_id ~= nil and v1403.default_option_id ~= "" then
        v1404.defaultOptionId = v1403.default_option_id;
    end;
    return v1404;
end;
v4.jsonDecode = function(v1408) --[[ Line: 9206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_48 (copy), v2 (copy)
    local v1409 = l_v4_48.new();
    if v1408.filter_id ~= nil then
        v1409.filter_id = v1408.filter_id;
    end;
    if v1408.filterId ~= nil then
        v1409.filter_id = v1408.filterId;
    end;
    if v1408.display_name ~= nil then
        v1409.display_name = v1408.display_name;
    end;
    if v1408.displayName ~= nil then
        v1409.display_name = v1408.displayName;
    end;
    if v1408.options ~= nil then
        local v1410 = {};
        for _, v1412 in v1408.options do
            table.insert(v1410, v2.FilterPillsInputData_FilterOption.jsonDecode(v1412));
        end;
        v1409.options = v1410;
    end;
    if v1408.default_option_id ~= nil then
        v1409.default_option_id = v1408.default_option_id;
    end;
    if v1408.defaultOptionId ~= nil then
        v1409.default_option_id = v1408.defaultOptionId;
    end;
    return v1409;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterGroup", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
};
v2.FilterPillsInputData_FilterGroup = v4;
v1.default:register(v2.FilterPillsInputData_FilterGroup);
v4 = {};
v4.__index = v4;
local l_v4_49 = v4 --[[ copy: 4 -> 54 ]];
v4.new = function(v1414) --[[ Line: 9261 ]] --[[ Name: new ]]
    -- upvalues: l_v4_49 (copy)
    return (setmetatable({
        option_id = (not (v1414 ~= nil) or v1414.option_id == nil) and "" or v1414.option_id, 
        display_name = (not (v1414 ~= nil) or v1414.display_name == nil) and "" or v1414.display_name
    }, l_v4_49));
end;
v4.encode = function(v1415) --[[ Line: 9270 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1416 = buffer.create(0);
    local v1417 = 0;
    if v1415.option_id ~= nil and v1415.option_id ~= "" then
        local v1418, v1419 = v0.writeTag(v1416, v1417, 1, v0.wireTypes.lengthDelimited);
        v1418, v1419 = v0.writeString(v1418, v1419, v1415.option_id);
        v1416 = v1418;
        v1417 = v1419;
    end;
    if v1415.display_name ~= nil and v1415.display_name ~= "" then
        local v1420, v1421 = v0.writeTag(v1416, v1417, 2, v0.wireTypes.lengthDelimited);
        v1420, v1421 = v0.writeString(v1420, v1421, v1415.display_name);
        v1416 = v1420;
        v1417 = v1421;
    end;
    local v1422 = buffer.create(v1417);
    buffer.copy(v1422, 0, v1416, 0, v1417);
    return v1422;
end;
v4.decode = function(v1423) --[[ Line: 9289 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_49 (copy), v0 (copy)
    local v1424 = l_v4_49.new();
    local v1425 = 0;
    while v1425 < buffer.len(v1423) do
        local v1426 = nil;
        local v1427 = nil;
        local v1428, v1429, v1430 = v0.readTag(v1423, v1425);
        v1426 = v1428;
        v1427 = v1429;
        v1425 = v1430;
        if v1427 == v0.wireTypes.varint then
            v1428 = nil;
            v1429, v1430 = v0.readVarInt(v1423, v1425);
            v1428 = v1429;
            v1425 = v1430;
        elseif v1427 == v0.wireTypes.lengthDelimited then
            if v1426 == 1 then
                v1428 = nil;
                v1429, v1430 = v0.readBuffer(v1423, v1425);
                v1428 = v1429;
                v1425 = v1430;
                v1424.option_id = buffer.tostring(v1428);
            elseif v1426 == 2 then
                v1428 = nil;
                v1429, v1430 = v0.readBuffer(v1423, v1425);
                v1428 = v1429;
                v1425 = v1430;
                v1424.display_name = buffer.tostring(v1428);
            else
                v1428 = nil;
                v1429, v1430 = v0.readVarInt(v1423, v1425);
                v1425 = v1430 + v1429;
            end;
        elseif v1427 == v0.wireTypes.i32 then
            v1428 = nil;
            v1429, v1430 = v0.readFixed32(v1423, v1425);
            v1428 = v1429;
            v1425 = v1430;
        elseif v1427 == v0.wireTypes.i64 then
            v1428 = nil;
            v1429, v1430 = v0.readFixed64(v1423, v1425);
            v1428 = v1429;
            v1425 = v1430;
        else
            error("Unsupported wire type: " .. v1427);
        end;
    end;
    return v1424;
end;
v4.jsonEncode = function(v1431) --[[ Line: 9337 ]] --[[ Name: jsonEncode ]]
    local v1432 = {};
    if v1431.option_id ~= nil and v1431.option_id ~= "" then
        v1432.optionId = v1431.option_id;
    end;
    if v1431.display_name ~= nil and v1431.display_name ~= "" then
        v1432.displayName = v1431.display_name;
    end;
    return v1432;
end;
v4.jsonDecode = function(v1433) --[[ Line: 9351 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_49 (copy)
    local v1434 = l_v4_49.new();
    if v1433.option_id ~= nil then
        v1434.option_id = v1433.option_id;
    end;
    if v1433.optionId ~= nil then
        v1434.option_id = v1433.optionId;
    end;
    if v1433.display_name ~= nil then
        v1434.display_name = v1433.display_name;
    end;
    if v1433.displayName ~= nil then
        v1434.display_name = v1433.displayName;
    end;
    return v1434;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
};
v2.FilterPillsInputData_FilterOption = v4;
v1.default:register(v2.FilterPillsInputData_FilterOption);
v4 = {};
v4.__index = v4;
local l_v4_50 = v4 --[[ copy: 4 -> 55 ]];
v4.new = function(v1436) --[[ Line: 9389 ]] --[[ Name: new ]]
    -- upvalues: l_v4_50 (copy)
    return (setmetatable({
        sort_options = if not (v1436 ~= nil) or v1436.sort_options == nil then {} else v1436.sort_options, 
        selected_sort_id = (not (v1436 ~= nil) or v1436.selected_sort_id == nil) and "" or v1436.selected_sort_id
    }, l_v4_50));
end;
v4.encode = function(v1437) --[[ Line: 9396 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1438 = buffer.create(0);
    local v1439 = 0;
    if v1437.sort_options ~= nil and #v1437.sort_options > 0 then
        for _, v1441 in v1437.sort_options do
            local v1442 = v1441:encode();
            local v1443, v1444 = v0.writeTag(v1438, v1439, 1, v0.wireTypes.lengthDelimited);
            v1443, v1444 = v0.writeBuffer(v1443, v1444, v1442, buffer.len(v1442));
            v1438 = v1443;
            v1439 = v1444;
        end;
    end;
    if v1437.selected_sort_id ~= nil and v1437.selected_sort_id ~= "" then
        local v1445, v1446 = v0.writeTag(v1438, v1439, 2, v0.wireTypes.lengthDelimited);
        v1445, v1446 = v0.writeString(v1445, v1446, v1437.selected_sort_id);
        v1438 = v1445;
        v1439 = v1446;
    end;
    local v1447 = buffer.create(v1439);
    buffer.copy(v1447, 0, v1438, 0, v1439);
    return v1447;
end;
v4.decode = function(v1448) --[[ Line: 9418 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_50 (copy), v0 (copy), v2 (copy)
    local v1449 = l_v4_50.new();
    local v1450 = 0;
    while v1450 < buffer.len(v1448) do
        local v1451 = nil;
        local v1452 = nil;
        local v1453, v1454, v1455 = v0.readTag(v1448, v1450);
        v1451 = v1453;
        v1452 = v1454;
        v1450 = v1455;
        if v1452 == v0.wireTypes.varint then
            v1453 = nil;
            v1454, v1455 = v0.readVarInt(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        elseif v1452 == v0.wireTypes.lengthDelimited then
            if v1451 == 1 then
                v1453 = nil;
                v1454, v1455 = v0.readBuffer(v1448, v1450);
                v1453 = v1454;
                v1450 = v1455;
                table.insert(v1449.sort_options, v2.SortSelectorInputData_SortOption.decode(v1453));
            elseif v1451 == 2 then
                v1453 = nil;
                v1454, v1455 = v0.readBuffer(v1448, v1450);
                v1453 = v1454;
                v1450 = v1455;
                v1449.selected_sort_id = buffer.tostring(v1453);
            else
                v1453 = nil;
                v1454, v1455 = v0.readVarInt(v1448, v1450);
                v1450 = v1455 + v1454;
            end;
        elseif v1452 == v0.wireTypes.i32 then
            v1453 = nil;
            v1454, v1455 = v0.readFixed32(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        elseif v1452 == v0.wireTypes.i64 then
            v1453 = nil;
            v1454, v1455 = v0.readFixed64(v1448, v1450);
            v1453 = v1454;
            v1450 = v1455;
        else
            error("Unsupported wire type: " .. v1452);
        end;
    end;
    return v1449;
end;
v4.jsonEncode = function(v1456) --[[ Line: 9466 ]] --[[ Name: jsonEncode ]]
    local v1457 = {};
    if v1456.sort_options ~= nil and #v1456.sort_options > 0 then
        local v1458 = {};
        for _, v1460 in v1456.sort_options do
            table.insert(v1458, v1460:jsonEncode());
        end;
        v1457.sortOptions = v1458;
    end;
    if v1456.selected_sort_id ~= nil and v1456.selected_sort_id ~= "" then
        v1457.selectedSortId = v1456.selected_sort_id;
    end;
    return v1457;
end;
v4.jsonDecode = function(v1461) --[[ Line: 9484 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_50 (copy), v2 (copy)
    local v1462 = l_v4_50.new();
    if v1461.sort_options ~= nil then
        local v1463 = {};
        for _, v1465 in v1461.sort_options do
            table.insert(v1463, v2.SortSelectorInputData_SortOption.jsonDecode(v1465));
        end;
        v1462.sort_options = v1463;
    end;
    if v1461.sortOptions ~= nil then
        local v1466 = {};
        for _, v1468 in v1461.sortOptions do
            table.insert(v1466, v2.SortSelectorInputData_SortOption.jsonDecode(v1468));
        end;
        v1462.sort_options = v1466;
    end;
    if v1461.selected_sort_id ~= nil then
        v1462.selected_sort_id = v1461.selected_sort_id;
    end;
    if v1461.selectedSortId ~= nil then
        v1462.selected_sort_id = v1461.selectedSortId;
    end;
    return v1462;
end;
v4.descriptor = {
    name = "SortSelectorInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
};
v2.SortSelectorInputData = v4;
v1.default:register(v2.SortSelectorInputData);
v4 = {};
v4.__index = v4;
local l_v4_51 = v4 --[[ copy: 4 -> 56 ]];
v4.new = function(v1470) --[[ Line: 9530 ]] --[[ Name: new ]]
    -- upvalues: l_v4_51 (copy)
    return (setmetatable({
        sort_id = (not (v1470 ~= nil) or v1470.sort_id == nil) and "" or v1470.sort_id, 
        display_name = (not (v1470 ~= nil) or v1470.display_name == nil) and "" or v1470.display_name, 
        content_type = (not (v1470 ~= nil) or v1470.content_type == nil) and "" or v1470.content_type
    }, l_v4_51));
end;
v4.encode = function(v1471) --[[ Line: 9540 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1472 = buffer.create(0);
    local v1473 = 0;
    if v1471.sort_id ~= nil and v1471.sort_id ~= "" then
        local v1474, v1475 = v0.writeTag(v1472, v1473, 1, v0.wireTypes.lengthDelimited);
        v1474, v1475 = v0.writeString(v1474, v1475, v1471.sort_id);
        v1472 = v1474;
        v1473 = v1475;
    end;
    if v1471.display_name ~= nil and v1471.display_name ~= "" then
        local v1476, v1477 = v0.writeTag(v1472, v1473, 2, v0.wireTypes.lengthDelimited);
        v1476, v1477 = v0.writeString(v1476, v1477, v1471.display_name);
        v1472 = v1476;
        v1473 = v1477;
    end;
    if v1471.content_type ~= nil and v1471.content_type ~= "" then
        local v1478, v1479 = v0.writeTag(v1472, v1473, 3, v0.wireTypes.lengthDelimited);
        v1478, v1479 = v0.writeString(v1478, v1479, v1471.content_type);
        v1472 = v1478;
        v1473 = v1479;
    end;
    local v1480 = buffer.create(v1473);
    buffer.copy(v1480, 0, v1472, 0, v1473);
    return v1480;
end;
v4.decode = function(v1481) --[[ Line: 9564 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_51 (copy), v0 (copy)
    local v1482 = l_v4_51.new();
    local v1483 = 0;
    while v1483 < buffer.len(v1481) do
        local v1484 = nil;
        local v1485 = nil;
        local v1486, v1487, v1488 = v0.readTag(v1481, v1483);
        v1484 = v1486;
        v1485 = v1487;
        v1483 = v1488;
        if v1485 == v0.wireTypes.varint then
            v1486 = nil;
            v1487, v1488 = v0.readVarInt(v1481, v1483);
            v1486 = v1487;
            v1483 = v1488;
        elseif v1485 == v0.wireTypes.lengthDelimited then
            if v1484 == 1 then
                v1486 = nil;
                v1487, v1488 = v0.readBuffer(v1481, v1483);
                v1486 = v1487;
                v1483 = v1488;
                v1482.sort_id = buffer.tostring(v1486);
            elseif v1484 == 2 then
                v1486 = nil;
                v1487, v1488 = v0.readBuffer(v1481, v1483);
                v1486 = v1487;
                v1483 = v1488;
                v1482.display_name = buffer.tostring(v1486);
            elseif v1484 == 3 then
                v1486 = nil;
                v1487, v1488 = v0.readBuffer(v1481, v1483);
                v1486 = v1487;
                v1483 = v1488;
                v1482.content_type = buffer.tostring(v1486);
            else
                v1486 = nil;
                v1487, v1488 = v0.readVarInt(v1481, v1483);
                v1483 = v1488 + v1487;
            end;
        elseif v1485 == v0.wireTypes.i32 then
            v1486 = nil;
            v1487, v1488 = v0.readFixed32(v1481, v1483);
            v1486 = v1487;
            v1483 = v1488;
        elseif v1485 == v0.wireTypes.i64 then
            v1486 = nil;
            v1487, v1488 = v0.readFixed64(v1481, v1483);
            v1486 = v1487;
            v1483 = v1488;
        else
            error("Unsupported wire type: " .. v1485);
        end;
    end;
    return v1482;
end;
v4.jsonEncode = function(v1489) --[[ Line: 9617 ]] --[[ Name: jsonEncode ]]
    local v1490 = {};
    if v1489.sort_id ~= nil and v1489.sort_id ~= "" then
        v1490.sortId = v1489.sort_id;
    end;
    if v1489.display_name ~= nil and v1489.display_name ~= "" then
        v1490.displayName = v1489.display_name;
    end;
    if v1489.content_type ~= nil and v1489.content_type ~= "" then
        v1490.contentType = v1489.content_type;
    end;
    return v1490;
end;
v4.jsonDecode = function(v1491) --[[ Line: 9635 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_51 (copy)
    local v1492 = l_v4_51.new();
    if v1491.sort_id ~= nil then
        v1492.sort_id = v1491.sort_id;
    end;
    if v1491.sortId ~= nil then
        v1492.sort_id = v1491.sortId;
    end;
    if v1491.display_name ~= nil then
        v1492.display_name = v1491.display_name;
    end;
    if v1491.displayName ~= nil then
        v1492.display_name = v1491.displayName;
    end;
    if v1491.content_type ~= nil then
        v1492.content_type = v1491.content_type;
    end;
    if v1491.contentType ~= nil then
        v1492.content_type = v1491.contentType;
    end;
    return v1492;
end;
v4.descriptor = {
    name = "SortSelectorInputData_SortOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
};
v2.SortSelectorInputData_SortOption = v4;
v1.default:register(v2.SortSelectorInputData_SortOption);
v4 = {};
v4.__index = v4;
local l_v4_52 = v4 --[[ copy: 4 -> 57 ]];
v4.new = function(v1494) --[[ Line: 9681 ]] --[[ Name: new ]]
    -- upvalues: l_v4_52 (copy)
    return (setmetatable({
        id = (not (v1494 ~= nil) or v1494.id == nil) and "" or v1494.id, 
        preview_rows = (not (v1494 ~= nil) or v1494.preview_rows == nil) and 0 or v1494.preview_rows
    }, l_v4_52));
end;
v4.encode = function(v1495) --[[ Line: 9690 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1496 = buffer.create(0);
    local v1497 = 0;
    if v1495.id ~= nil and v1495.id ~= "" then
        local v1498, v1499 = v0.writeTag(v1496, v1497, 1, v0.wireTypes.lengthDelimited);
        v1498, v1499 = v0.writeString(v1498, v1499, v1495.id);
        v1496 = v1498;
        v1497 = v1499;
    end;
    if v1495.preview_rows ~= nil and v1495.preview_rows ~= 0 then
        local v1500, v1501 = v0.writeTag(v1496, v1497, 4, v0.wireTypes.varint);
        v1500, v1501 = v0.writeVarInt(v1500, v1501, v1495.preview_rows);
        v1496 = v1500;
        v1497 = v1501;
    end;
    local v1502 = buffer.create(v1497);
    buffer.copy(v1502, 0, v1496, 0, v1497);
    return v1502;
end;
v4.decode = function(v1503) --[[ Line: 9709 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_52 (copy), v0 (copy)
    local v1504 = l_v4_52.new();
    local v1505 = 0;
    while v1505 < buffer.len(v1503) do
        local v1506 = nil;
        local v1507 = nil;
        local v1508, v1509, v1510 = v0.readTag(v1503, v1505);
        v1506 = v1508;
        v1507 = v1509;
        v1505 = v1510;
        if v1507 == v0.wireTypes.varint then
            if v1506 == 4 then
                v1508 = nil;
                v1509, v1510 = v0.readVarIntI64(v1503, v1505);
                v1508 = v1509;
                v1505 = v1510;
                v1504.preview_rows = v1508;
            else
                v1508 = nil;
                v1509, v1510 = v0.readVarInt(v1503, v1505);
                v1508 = v1509;
                v1505 = v1510;
            end;
        elseif v1507 == v0.wireTypes.lengthDelimited then
            if v1506 == 1 then
                v1508 = nil;
                v1509, v1510 = v0.readBuffer(v1503, v1505);
                v1508 = v1509;
                v1505 = v1510;
                v1504.id = buffer.tostring(v1508);
            else
                v1508 = nil;
                v1509, v1510 = v0.readVarInt(v1503, v1505);
                v1505 = v1510 + v1509;
            end;
        elseif v1507 == v0.wireTypes.i32 then
            v1508 = nil;
            v1509, v1510 = v0.readFixed32(v1503, v1505);
            v1508 = v1509;
            v1505 = v1510;
        elseif v1507 == v0.wireTypes.i64 then
            v1508 = nil;
            v1509, v1510 = v0.readFixed64(v1503, v1505);
            v1508 = v1509;
            v1505 = v1510;
        else
            error("Unsupported wire type: " .. v1507);
        end;
    end;
    return v1504;
end;
v4.jsonEncode = function(v1511) --[[ Line: 9757 ]] --[[ Name: jsonEncode ]]
    local v1512 = {};
    if v1511.id ~= nil and v1511.id ~= "" then
        v1512.id = v1511.id;
    end;
    if v1511.preview_rows ~= nil and v1511.preview_rows ~= 0 then
        v1512.previewRows = v1511.preview_rows;
    end;
    return v1512;
end;
v4.jsonDecode = function(v1513) --[[ Line: 9771 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_52 (copy)
    local v1514 = l_v4_52.new();
    if v1513.id ~= nil then
        v1514.id = v1513.id;
    end;
    if v1513.preview_rows ~= nil then
        v1514.preview_rows = v1513.preview_rows;
    end;
    if v1513.previewRows ~= nil then
        v1514.preview_rows = v1513.previewRows;
    end;
    return v1514;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemGroupInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
};
v2.UAMarketplaceCatalogItemGroupInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemGroupInputData);
v4 = {};
v4.__index = v4;
local l_v4_53 = v4 --[[ copy: 4 -> 58 ]];
v4.new = function(v1516) --[[ Line: 9805 ]] --[[ Name: new ]]
    -- upvalues: l_v4_53 (copy)
    return (setmetatable({
        id = (not (v1516 ~= nil) or v1516.id == nil) and "" or v1516.id, 
        num_items_to_show = (not (v1516 ~= nil) or v1516.num_items_to_show == nil) and 0 or v1516.num_items_to_show
    }, l_v4_53));
end;
v4.encode = function(v1517) --[[ Line: 9814 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1518 = buffer.create(0);
    local v1519 = 0;
    if v1517.id ~= nil and v1517.id ~= "" then
        local v1520, v1521 = v0.writeTag(v1518, v1519, 1, v0.wireTypes.lengthDelimited);
        v1520, v1521 = v0.writeString(v1520, v1521, v1517.id);
        v1518 = v1520;
        v1519 = v1521;
    end;
    if v1517.num_items_to_show ~= nil and v1517.num_items_to_show ~= 0 then
        local v1522, v1523 = v0.writeTag(v1518, v1519, 5, v0.wireTypes.varint);
        v1522, v1523 = v0.writeVarInt(v1522, v1523, v1517.num_items_to_show);
        v1518 = v1522;
        v1519 = v1523;
    end;
    local v1524 = buffer.create(v1519);
    buffer.copy(v1524, 0, v1518, 0, v1519);
    return v1524;
end;
v4.decode = function(v1525) --[[ Line: 9835 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_53 (copy), v0 (copy)
    local v1526 = l_v4_53.new();
    local v1527 = 0;
    while v1527 < buffer.len(v1525) do
        local v1528 = nil;
        local v1529 = nil;
        local v1530, v1531, v1532 = v0.readTag(v1525, v1527);
        v1528 = v1530;
        v1529 = v1531;
        v1527 = v1532;
        if v1529 == v0.wireTypes.varint then
            if v1528 == 5 then
                v1530 = nil;
                v1531, v1532 = v0.readVarIntI64(v1525, v1527);
                v1530 = v1531;
                v1527 = v1532;
                v1526.num_items_to_show = v1530;
            else
                v1530 = nil;
                v1531, v1532 = v0.readVarInt(v1525, v1527);
                v1530 = v1531;
                v1527 = v1532;
            end;
        elseif v1529 == v0.wireTypes.lengthDelimited then
            if v1528 == 1 then
                v1530 = nil;
                v1531, v1532 = v0.readBuffer(v1525, v1527);
                v1530 = v1531;
                v1527 = v1532;
                v1526.id = buffer.tostring(v1530);
            else
                v1530 = nil;
                v1531, v1532 = v0.readVarInt(v1525, v1527);
                v1527 = v1532 + v1531;
            end;
        elseif v1529 == v0.wireTypes.i32 then
            v1530 = nil;
            v1531, v1532 = v0.readFixed32(v1525, v1527);
            v1530 = v1531;
            v1527 = v1532;
        elseif v1529 == v0.wireTypes.i64 then
            v1530 = nil;
            v1531, v1532 = v0.readFixed64(v1525, v1527);
            v1530 = v1531;
            v1527 = v1532;
        else
            error("Unsupported wire type: " .. v1529);
        end;
    end;
    return v1526;
end;
v4.jsonEncode = function(v1533) --[[ Line: 9885 ]] --[[ Name: jsonEncode ]]
    local v1534 = {};
    if v1533.id ~= nil and v1533.id ~= "" then
        v1534.id = v1533.id;
    end;
    if v1533.num_items_to_show ~= nil and v1533.num_items_to_show ~= 0 then
        v1534.numItemsToShow = v1533.num_items_to_show;
    end;
    return v1534;
end;
v4.jsonDecode = function(v1535) --[[ Line: 9901 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_53 (copy)
    local v1536 = l_v4_53.new();
    if v1535.id ~= nil then
        v1536.id = v1535.id;
    end;
    if v1535.num_items_to_show ~= nil then
        v1536.num_items_to_show = v1535.num_items_to_show;
    end;
    if v1535.numItemsToShow ~= nil then
        v1536.num_items_to_show = v1535.numItemsToShow;
    end;
    return v1536;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
};
v2.UAMarketplaceCatalogItemCarouselInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_54 = v4 --[[ copy: 4 -> 59 ]];
v4.new = function(v1538) --[[ Line: 9935 ]] --[[ Name: new ]]
    -- upvalues: l_v4_54 (copy)
    return (setmetatable({
        feed_item_input_map = if not (v1538 ~= nil) or v1538.feed_item_input_map == nil then {} else v1538.feed_item_input_map, 
        marketplace_catalog_feed_items = if not (v1538 ~= nil) or v1538.marketplace_catalog_feed_items == nil then {} else v1538.marketplace_catalog_feed_items
    }, l_v4_54));
end;
v4.encode = function(v1539) --[[ Line: 9948 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1540 = buffer.create(0);
    local v1541 = 0;
    if v1539.feed_item_input_map ~= nil and next(v1539.feed_item_input_map) ~= nil then
        for v1542, v1543 in v1539.feed_item_input_map do
            local v1544 = buffer.create(0);
            local v1545, v1546 = v0.writeTag(v1544, 0, 1, v0.wireTypes.lengthDelimited);
            v1545, v1546 = v0.writeString(v1545, v1546, v1542);
            v1544 = v1545;
            local l_v1546_0 = v1546;
            v1545 = v1543:encode();
            local v1548;
            v1546, v1548 = v0.writeTag(v1544, l_v1546_0, 2, v0.wireTypes.lengthDelimited);
            v1546, v1548 = v0.writeBuffer(v1546, v1548, v1545, buffer.len(v1545));
            v1544 = v1546;
            l_v1546_0 = v1548;
            v1546, v1548 = v0.writeTag(v1540, v1541, 1, v0.wireTypes.lengthDelimited);
            v1546, v1548 = v0.writeBuffer(v1546, v1548, v1544, l_v1546_0);
            v1540 = v1546;
            v1541 = v1548;
        end;
    end;
    if v1539.marketplace_catalog_feed_items ~= nil and #v1539.marketplace_catalog_feed_items > 0 then
        for _, v1550 in v1539.marketplace_catalog_feed_items do
            local v1551 = v1550:encode();
            local v1552, v1553 = v0.writeTag(v1540, v1541, 2, v0.wireTypes.lengthDelimited);
            v1552, v1553 = v0.writeBuffer(v1552, v1553, v1551, buffer.len(v1551));
            v1540 = v1552;
            v1541 = v1553;
        end;
    end;
    local v1554 = buffer.create(v1541);
    buffer.copy(v1554, 0, v1540, 0, v1541);
    return v1554;
end;
v4.decode = function(v1555) --[[ Line: 9979 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_54 (copy), v0 (copy), v2 (copy)
    local v1556 = l_v4_54.new();
    local v1557 = 0;
    while v1557 < buffer.len(v1555) do
        local v1558 = nil;
        local v1559 = nil;
        local v1560, v1561, v1562 = v0.readTag(v1555, v1557);
        v1558 = v1560;
        v1559 = v1561;
        v1557 = v1562;
        if v1559 == v0.wireTypes.varint then
            v1560 = nil;
            v1561, v1562 = v0.readVarInt(v1555, v1557);
            v1560 = v1561;
            v1557 = v1562;
        elseif v1559 == v0.wireTypes.lengthDelimited then
            if v1558 == 1 then
                v1560 = nil;
                v1561, v1562 = v0.readBuffer(v1555, v1557);
                v1560 = v1561;
                v1557 = v1562;
                v1561 = v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry.decode(v1560);
                v1562 = v2.PageEntryInputData.new();
                v1556.feed_item_input_map[v1561.key or ""] = v1561.value or v1562;
            elseif v1558 == 2 then
                v1560 = nil;
                v1561, v1562 = v0.readBuffer(v1555, v1557);
                v1560 = v1561;
                v1557 = v1562;
                table.insert(v1556.marketplace_catalog_feed_items, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.decode(v1560));
            else
                v1560 = nil;
                v1561, v1562 = v0.readVarInt(v1555, v1557);
                v1557 = v1562 + v1561;
            end;
        elseif v1559 == v0.wireTypes.i32 then
            v1560 = nil;
            v1561, v1562 = v0.readFixed32(v1555, v1557);
            v1560 = v1561;
            v1557 = v1562;
        elseif v1559 == v0.wireTypes.i64 then
            v1560 = nil;
            v1561, v1562 = v0.readFixed64(v1555, v1557);
            v1560 = v1561;
            v1557 = v1562;
        else
            error("Unsupported wire type: " .. v1559);
        end;
    end;
    return v1556;
end;
v4.jsonEncode = function(v1563) --[[ Line: 10037 ]] --[[ Name: jsonEncode ]]
    local v1564 = {};
    if v1563.feed_item_input_map ~= nil and next(v1563.feed_item_input_map) ~= nil then
        local v1565 = {};
        for v1566, v1567 in v1563.feed_item_input_map do
            v1565[v1566] = v1567:jsonEncode();
        end;
        v1564.feedItemInputMap = v1565;
    end;
    if v1563.marketplace_catalog_feed_items ~= nil and #v1563.marketplace_catalog_feed_items > 0 then
        local v1568 = {};
        for _, v1570 in v1563.marketplace_catalog_feed_items do
            table.insert(v1568, v1570:jsonEncode());
        end;
        v1564.marketplaceCatalogFeedItems = v1568;
    end;
    return v1564;
end;
v4.jsonDecode = function(v1571) --[[ Line: 10059 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_54 (copy), v2 (copy)
    local v1572 = l_v4_54.new();
    if v1571.feed_item_input_map ~= nil then
        local v1573 = {};
        for v1574, v1575 in v1571.feed_item_input_map do
            v1573[v1574] = v2.PageEntryInputData.jsonDecode(v1575);
        end;
        v1572.feed_item_input_map = v1573;
    end;
    if v1571.feedItemInputMap ~= nil then
        local v1576 = {};
        for v1577, v1578 in v1571.feedItemInputMap do
            v1576[v1577] = v2.PageEntryInputData.jsonDecode(v1578);
        end;
        v1572.feed_item_input_map = v1576;
    end;
    if v1571.marketplace_catalog_feed_items ~= nil then
        local v1579 = {};
        for _, v1581 in v1571.marketplace_catalog_feed_items do
            table.insert(v1579, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1581));
        end;
        v1572.marketplace_catalog_feed_items = v1579;
    end;
    if v1571.marketplaceCatalogFeedItems ~= nil then
        local v1582 = {};
        for _, v1584 in v1571.marketplaceCatalogFeedItems do
            table.insert(v1582, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1584));
        end;
        v1572.marketplace_catalog_feed_items = v1582;
    end;
    return v1572;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
};
v2.UAMarketplaceCatalogFeedInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_55 = v4 --[[ copy: 4 -> 60 ]];
v4.new = function(v1586) --[[ Line: 10124 ]] --[[ Name: new ]]
    -- upvalues: l_v4_55 (copy)
    return (setmetatable({
        roblox_component = (not (v1586 ~= nil) or v1586.roblox_component == nil) and "" or v1586.roblox_component, 
        feed_item_id = (not (v1586 ~= nil) or v1586.feed_item_id == nil) and "" or v1586.feed_item_id
    }, l_v4_55));
end;
v4.encode = function(v1587) --[[ Line: 10136 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1588 = buffer.create(0);
    local v1589 = 0;
    if v1587.roblox_component ~= nil and v1587.roblox_component ~= "" then
        local v1590, v1591 = v0.writeTag(v1588, v1589, 1, v0.wireTypes.lengthDelimited);
        v1590, v1591 = v0.writeString(v1590, v1591, v1587.roblox_component);
        v1588 = v1590;
        v1589 = v1591;
    end;
    if v1587.feed_item_id ~= nil and v1587.feed_item_id ~= "" then
        local v1592, v1593 = v0.writeTag(v1588, v1589, 2, v0.wireTypes.lengthDelimited);
        v1592, v1593 = v0.writeString(v1592, v1593, v1587.feed_item_id);
        v1588 = v1592;
        v1589 = v1593;
    end;
    local v1594 = buffer.create(v1589);
    buffer.copy(v1594, 0, v1588, 0, v1589);
    return v1594;
end;
v4.decode = function(v1595) --[[ Line: 10157 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_55 (copy), v0 (copy)
    local v1596 = l_v4_55.new();
    local v1597 = 0;
    while v1597 < buffer.len(v1595) do
        local v1598 = nil;
        local v1599 = nil;
        local v1600, v1601, v1602 = v0.readTag(v1595, v1597);
        v1598 = v1600;
        v1599 = v1601;
        v1597 = v1602;
        if v1599 == v0.wireTypes.varint then
            v1600 = nil;
            v1601, v1602 = v0.readVarInt(v1595, v1597);
            v1600 = v1601;
            v1597 = v1602;
        elseif v1599 == v0.wireTypes.lengthDelimited then
            if v1598 == 1 then
                v1600 = nil;
                v1601, v1602 = v0.readBuffer(v1595, v1597);
                v1600 = v1601;
                v1597 = v1602;
                v1596.roblox_component = buffer.tostring(v1600);
            elseif v1598 == 2 then
                v1600 = nil;
                v1601, v1602 = v0.readBuffer(v1595, v1597);
                v1600 = v1601;
                v1597 = v1602;
                v1596.feed_item_id = buffer.tostring(v1600);
            else
                v1600 = nil;
                v1601, v1602 = v0.readVarInt(v1595, v1597);
                v1597 = v1602 + v1601;
            end;
        elseif v1599 == v0.wireTypes.i32 then
            v1600 = nil;
            v1601, v1602 = v0.readFixed32(v1595, v1597);
            v1600 = v1601;
            v1597 = v1602;
        elseif v1599 == v0.wireTypes.i64 then
            v1600 = nil;
            v1601, v1602 = v0.readFixed64(v1595, v1597);
            v1600 = v1601;
            v1597 = v1602;
        else
            error("Unsupported wire type: " .. v1599);
        end;
    end;
    return v1596;
end;
v4.jsonEncode = function(v1603) --[[ Line: 10207 ]] --[[ Name: jsonEncode ]]
    local v1604 = {};
    if v1603.roblox_component ~= nil and v1603.roblox_component ~= "" then
        v1604.robloxComponent = v1603.roblox_component;
    end;
    if v1603.feed_item_id ~= nil and v1603.feed_item_id ~= "" then
        v1604.feedItemId = v1603.feed_item_id;
    end;
    return v1604;
end;
v4.jsonDecode = function(v1605) --[[ Line: 10223 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_55 (copy)
    local v1606 = l_v4_55.new();
    if v1605.roblox_component ~= nil then
        v1606.roblox_component = v1605.roblox_component;
    end;
    if v1605.robloxComponent ~= nil then
        v1606.roblox_component = v1605.robloxComponent;
    end;
    if v1605.feed_item_id ~= nil then
        v1606.feed_item_id = v1605.feed_item_id;
    end;
    if v1605.feedItemId ~= nil then
        v1606.feed_item_id = v1605.feedItemId;
    end;
    return v1606;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogFeedItem"
};
v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem);
v4 = {};
v4.__index = v4;
local l_v4_56 = v4 --[[ copy: 4 -> 61 ]];
v4.new = function(v1608) --[[ Line: 10263 ]] --[[ Name: new ]]
    -- upvalues: l_v4_56 (copy)
    return (setmetatable({
        key = (not (v1608 ~= nil) or v1608.key == nil) and "" or v1608.key, 
        value = if not (v1608 ~= nil) or v1608.value == nil then nil else v1608.value
    }, l_v4_56));
end;
v4.encode = function(v1609) --[[ Line: 10275 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1610 = buffer.create(0);
    local v1611 = 0;
    if v1609.key ~= nil and v1609.key ~= "" then
        local v1612, v1613 = v0.writeTag(v1610, v1611, 1, v0.wireTypes.lengthDelimited);
        v1612, v1613 = v0.writeString(v1612, v1613, v1609.key);
        v1610 = v1612;
        v1611 = v1613;
    end;
    if v1609.value ~= nil then
        local v1614 = v1609.value:encode();
        local v1615, v1616 = v0.writeTag(v1610, v1611, 2, v0.wireTypes.lengthDelimited);
        v1615, v1616 = v0.writeBuffer(v1615, v1616, v1614, buffer.len(v1614));
        v1610 = v1615;
        v1611 = v1616;
    end;
    local v1617 = buffer.create(v1611);
    buffer.copy(v1617, 0, v1610, 0, v1611);
    return v1617;
end;
v4.decode = function(v1618) --[[ Line: 10297 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_56 (copy), v0 (copy), v2 (copy)
    local v1619 = l_v4_56.new();
    local v1620 = 0;
    while v1620 < buffer.len(v1618) do
        local v1621 = nil;
        local v1622 = nil;
        local v1623, v1624, v1625 = v0.readTag(v1618, v1620);
        v1621 = v1623;
        v1622 = v1624;
        v1620 = v1625;
        if v1622 == v0.wireTypes.varint then
            v1623 = nil;
            v1624, v1625 = v0.readVarInt(v1618, v1620);
            v1623 = v1624;
            v1620 = v1625;
        elseif v1622 == v0.wireTypes.lengthDelimited then
            if v1621 == 1 then
                v1623 = nil;
                v1624, v1625 = v0.readBuffer(v1618, v1620);
                v1623 = v1624;
                v1620 = v1625;
                v1619.key = buffer.tostring(v1623);
            elseif v1621 == 2 then
                v1623 = nil;
                v1624, v1625 = v0.readBuffer(v1618, v1620);
                v1623 = v1624;
                v1620 = v1625;
                v1619.value = v2.PageEntryInputData.decode(v1623);
            else
                v1623 = nil;
                v1624, v1625 = v0.readVarInt(v1618, v1620);
                v1620 = v1625 + v1624;
            end;
        elseif v1622 == v0.wireTypes.i32 then
            v1623 = nil;
            v1624, v1625 = v0.readFixed32(v1618, v1620);
            v1623 = v1624;
            v1620 = v1625;
        elseif v1622 == v0.wireTypes.i64 then
            v1623 = nil;
            v1624, v1625 = v0.readFixed64(v1618, v1620);
            v1623 = v1624;
            v1620 = v1625;
        else
            error("Unsupported wire type: " .. v1622);
        end;
    end;
    return v1619;
end;
v4.jsonEncode = function(v1626) --[[ Line: 10347 ]] --[[ Name: jsonEncode ]]
    local v1627 = {};
    if v1626.key ~= nil and v1626.key ~= "" then
        v1627.key = v1626.key;
    end;
    if v1626.value ~= nil then
        v1627.value = v1626.value:jsonEncode();
    end;
    return v1627;
end;
v4.jsonDecode = function(v1628) --[[ Line: 10363 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_56 (copy), v2 (copy)
    local v1629 = l_v4_56.new();
    if v1628.key ~= nil then
        v1629.key = v1628.key;
    end;
    if v1628.value ~= nil then
        v1629.value = v2.PageEntryInputData.jsonDecode(v1628.value);
    end;
    return v1629;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FeedItemInputMapEntry"
};
v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_57 = v4 --[[ copy: 4 -> 62 ]];
v4.new = function(v1631) --[[ Line: 10394 ]] --[[ Name: new ]]
    -- upvalues: l_v4_57 (copy)
    return (setmetatable({
        marketplace_catalog_category_items = if not (v1631 ~= nil) or v1631.marketplace_catalog_category_items == nil then {} else v1631.marketplace_catalog_category_items, 
        active_category_id = (not (v1631 ~= nil) or v1631.active_category_id == nil) and "" or v1631.active_category_id, 
        active_tooltip_idx = (not (v1631 ~= nil) or v1631.active_tooltip_idx == nil) and 0 or v1631.active_tooltip_idx
    }, l_v4_57));
end;
v4.encode = function(v1632) --[[ Line: 10407 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1633 = buffer.create(0);
    local v1634 = 0;
    if v1632.marketplace_catalog_category_items ~= nil and #v1632.marketplace_catalog_category_items > 0 then
        for _, v1636 in v1632.marketplace_catalog_category_items do
            local v1637 = v1636:encode();
            local v1638, v1639 = v0.writeTag(v1633, v1634, 1, v0.wireTypes.lengthDelimited);
            v1638, v1639 = v0.writeBuffer(v1638, v1639, v1637, buffer.len(v1637));
            v1633 = v1638;
            v1634 = v1639;
        end;
    end;
    if v1632.active_category_id ~= nil and v1632.active_category_id ~= "" then
        local v1640, v1641 = v0.writeTag(v1633, v1634, 2, v0.wireTypes.lengthDelimited);
        v1640, v1641 = v0.writeString(v1640, v1641, v1632.active_category_id);
        v1633 = v1640;
        v1634 = v1641;
    end;
    if v1632.active_tooltip_idx ~= nil and v1632.active_tooltip_idx ~= 0 then
        local v1642, v1643 = v0.writeTag(v1633, v1634, 3, v0.wireTypes.varint);
        v1642, v1643 = v0.writeVarInt(v1642, v1643, v1632.active_tooltip_idx);
        v1633 = v1642;
        v1634 = v1643;
    end;
    local v1644 = buffer.create(v1634);
    buffer.copy(v1644, 0, v1633, 0, v1634);
    return v1644;
end;
v4.decode = function(v1645) --[[ Line: 10436 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_57 (copy), v0 (copy), v2 (copy)
    local v1646 = l_v4_57.new();
    local v1647 = 0;
    while v1647 < buffer.len(v1645) do
        local v1648 = nil;
        local v1649 = nil;
        local v1650, v1651, v1652 = v0.readTag(v1645, v1647);
        v1648 = v1650;
        v1649 = v1651;
        v1647 = v1652;
        if v1649 == v0.wireTypes.varint then
            if v1648 == 3 then
                v1650 = nil;
                v1651, v1652 = v0.readVarIntI64(v1645, v1647);
                v1650 = v1651;
                v1647 = v1652;
                v1646.active_tooltip_idx = v1650;
            else
                v1650 = nil;
                v1651, v1652 = v0.readVarInt(v1645, v1647);
                v1650 = v1651;
                v1647 = v1652;
            end;
        elseif v1649 == v0.wireTypes.lengthDelimited then
            if v1648 == 1 then
                v1650 = nil;
                v1651, v1652 = v0.readBuffer(v1645, v1647);
                v1650 = v1651;
                v1647 = v1652;
                table.insert(v1646.marketplace_catalog_category_items, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(v1650));
            elseif v1648 == 2 then
                v1650 = nil;
                v1651, v1652 = v0.readBuffer(v1645, v1647);
                v1650 = v1651;
                v1647 = v1652;
                v1646.active_category_id = buffer.tostring(v1650);
            else
                v1650 = nil;
                v1651, v1652 = v0.readVarInt(v1645, v1647);
                v1647 = v1652 + v1651;
            end;
        elseif v1649 == v0.wireTypes.i32 then
            v1650 = nil;
            v1651, v1652 = v0.readFixed32(v1645, v1647);
            v1650 = v1651;
            v1647 = v1652;
        elseif v1649 == v0.wireTypes.i64 then
            v1650 = nil;
            v1651, v1652 = v0.readFixed64(v1645, v1647);
            v1650 = v1651;
            v1647 = v1652;
        else
            error("Unsupported wire type: " .. v1649);
        end;
    end;
    return v1646;
end;
v4.jsonEncode = function(v1653) --[[ Line: 10494 ]] --[[ Name: jsonEncode ]]
    local v1654 = {};
    if v1653.marketplace_catalog_category_items ~= nil and #v1653.marketplace_catalog_category_items > 0 then
        local v1655 = {};
        for _, v1657 in v1653.marketplace_catalog_category_items do
            table.insert(v1655, v1657:jsonEncode());
        end;
        v1654.marketplaceCatalogCategoryItems = v1655;
    end;
    if v1653.active_category_id ~= nil and v1653.active_category_id ~= "" then
        v1654.activeCategoryId = v1653.active_category_id;
    end;
    if v1653.active_tooltip_idx ~= nil and v1653.active_tooltip_idx ~= 0 then
        v1654.activeTooltipIdx = v1653.active_tooltip_idx;
    end;
    return v1654;
end;
v4.jsonDecode = function(v1658) --[[ Line: 10518 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_57 (copy), v2 (copy)
    local v1659 = l_v4_57.new();
    if v1658.marketplace_catalog_category_items ~= nil then
        local v1660 = {};
        for _, v1662 in v1658.marketplace_catalog_category_items do
            table.insert(v1660, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1662));
        end;
        v1659.marketplace_catalog_category_items = v1660;
    end;
    if v1658.marketplaceCatalogCategoryItems ~= nil then
        local v1663 = {};
        for _, v1665 in v1658.marketplaceCatalogCategoryItems do
            table.insert(v1663, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1665));
        end;
        v1659.marketplace_catalog_category_items = v1663;
    end;
    if v1658.active_category_id ~= nil then
        v1659.active_category_id = v1658.active_category_id;
    end;
    if v1658.activeCategoryId ~= nil then
        v1659.active_category_id = v1658.activeCategoryId;
    end;
    if v1658.active_tooltip_idx ~= nil then
        v1659.active_tooltip_idx = v1658.active_tooltip_idx;
    end;
    if v1658.activeTooltipIdx ~= nil then
        v1659.active_tooltip_idx = v1658.activeTooltipIdx;
    end;
    return v1659;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
};
v2.UAMarketplaceCatalogCategoryMenuInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData);
v4 = {};
v4.__index = v4;
v4.new = function(v1666) --[[ Line: 10581 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        marketplace_catalog_category_item_id = (not (v1666 ~= nil) or v1666.marketplace_catalog_category_item_id == nil) and "" or v1666.marketplace_catalog_category_item_id
    }, v4));
end;
v4.encode = function(v1667) --[[ Line: 10595 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1668 = buffer.create(0);
    local v1669 = 0;
    if v1667.marketplace_catalog_category_item_id ~= nil and v1667.marketplace_catalog_category_item_id ~= "" then
        local v1670, v1671 = v0.writeTag(v1668, v1669, 1, v0.wireTypes.lengthDelimited);
        v1670, v1671 = v0.writeString(v1670, v1671, v1667.marketplace_catalog_category_item_id);
        v1668 = v1670;
        v1669 = v1671;
    end;
    local v1672 = buffer.create(v1669);
    buffer.copy(v1672, 0, v1668, 0, v1669);
    return v1672;
end;
v4.decode = function(v1673) --[[ Line: 10611 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v1674 = v4.new();
    local v1675 = 0;
    while v1675 < buffer.len(v1673) do
        local v1676 = nil;
        local v1677 = nil;
        local v1678, v1679, v1680 = v0.readTag(v1673, v1675);
        v1676 = v1678;
        v1677 = v1679;
        v1675 = v1680;
        if v1677 == v0.wireTypes.varint then
            v1678 = nil;
            v1679, v1680 = v0.readVarInt(v1673, v1675);
            v1678 = v1679;
            v1675 = v1680;
        elseif v1677 == v0.wireTypes.lengthDelimited then
            if v1676 == 1 then
                v1678 = nil;
                v1679, v1680 = v0.readBuffer(v1673, v1675);
                v1678 = v1679;
                v1675 = v1680;
                v1674.marketplace_catalog_category_item_id = buffer.tostring(v1678);
            else
                v1678 = nil;
                v1679, v1680 = v0.readVarInt(v1673, v1675);
                v1675 = v1680 + v1679;
            end;
        elseif v1677 == v0.wireTypes.i32 then
            v1678 = nil;
            v1679, v1680 = v0.readFixed32(v1673, v1675);
            v1678 = v1679;
            v1675 = v1680;
        elseif v1677 == v0.wireTypes.i64 then
            v1678 = nil;
            v1679, v1680 = v0.readFixed64(v1673, v1675);
            v1678 = v1679;
            v1675 = v1680;
        else
            error("Unsupported wire type: " .. v1677);
        end;
    end;
    return v1674;
end;
v4.jsonEncode = function(v1681) --[[ Line: 10656 ]] --[[ Name: jsonEncode ]]
    local v1682 = {};
    if v1681.marketplace_catalog_category_item_id ~= nil and v1681.marketplace_catalog_category_item_id ~= "" then
        v1682.marketplaceCatalogCategoryItemId = v1681.marketplace_catalog_category_item_id;
    end;
    return v1682;
end;
v4.jsonDecode = function(v1683) --[[ Line: 10668 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy)
    local v1684 = v4.new();
    if v1683.marketplace_catalog_category_item_id ~= nil then
        v1684.marketplace_catalog_category_item_id = v1683.marketplace_catalog_category_item_id;
    end;
    if v1683.marketplaceCatalogCategoryItemId ~= nil then
        v1684.marketplace_catalog_category_item_id = v1683.marketplaceCatalogCategoryItemId;
    end;
    return v1684;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
};
v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem);
v2.PageEntryFormat = {
    fromNumber = function(v1685) --[[ Line: 10698 ]] --[[ Name: fromNumber ]]
        if v1685 == 0 then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v1685 == 1 then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end, 
    toNumber = function(v1686) --[[ Line: 10708 ]] --[[ Name: toNumber ]]
        if v1686 == "PAGE_ENTRY_FORMAT_INVALID" then
            return 0;
        elseif v1686 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return 1;
        else
            return v1686;
        end;
    end, 
    fromName = function(v1687) --[[ Line: 10718 ]] --[[ Name: fromName ]]
        if v1687 == "PAGE_ENTRY_FORMAT_INVALID" then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v1687 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end
};
return {
    UniversalPageEntry = v2.UniversalPageEntry, 
    FeedEntry = v2.FeedEntry, 
    PageEntryInputData = v2.PageEntryInputData, 
    BadgesGridInputData = v2.BadgesGridInputData, 
    BadgesGridInputData_BadgeInputData = v2.BadgesGridInputData_BadgeInputData, 
    BadgeDetailsInputData = v2.BadgeDetailsInputData, 
    BadgeDetailsInputData_LocalizedLiterals = v2.BadgeDetailsInputData_LocalizedLiterals, 
    BadgeDetailsInputData_LocalizedLiterals_InfoTable = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable, 
    BadgeDetailsInputData_LocalizedLiterals_ActionModule = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule, 
    BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu, 
    StaticInputData = v2.StaticInputData, 
    ExperienceDetailsFeedInputData = v2.ExperienceDetailsFeedInputData, 
    ExperienceDetailsActionBarInputData = v2.ExperienceDetailsActionBarInputData, 
    ExperienceAttributionRowInputData = v2.ExperienceAttributionRowInputData, 
    ExperienceActionModuleInputData = v2.ExperienceActionModuleInputData, 
    ExperienceMediaGalleryInputData = v2.ExperienceMediaGalleryInputData, 
    ExperienceMediaGalleryInputData_MediaItem = v2.ExperienceMediaGalleryInputData_MediaItem, 
    ExperienceDescriptionInputData = v2.ExperienceDescriptionInputData, 
    ExperienceStatRowInputData = v2.ExperienceStatRowInputData, 
    ExperienceInfoTableInputData = v2.ExperienceInfoTableInputData, 
    SocialLinkRowInputData = v2.SocialLinkRowInputData, 
    SocialLinkRowInputData_SocialLinkItem = v2.SocialLinkRowInputData_SocialLinkItem, 
    ExperienceCarouselInputData = v2.ExperienceCarouselInputData, 
    ExperienceCarouselInputData_UniverseItem = v2.ExperienceCarouselInputData_UniverseItem, 
    SongCarouselInputData = v2.SongCarouselInputData, 
    SongCarouselInputData_SongItem = v2.SongCarouselInputData_SongItem, 
    EventsCarouselInputData = v2.EventsCarouselInputData, 
    EventsCarouselInputData_EventItem = v2.EventsCarouselInputData_EventItem, 
    DevStoreFeedInputData = v2.DevStoreFeedInputData, 
    GamePassesGridInputData = v2.GamePassesGridInputData, 
    GamePassesGridInputData_GamePassItem = v2.GamePassesGridInputData_GamePassItem, 
    GameDeveloperProductsGridInputData = v2.GameDeveloperProductsGridInputData, 
    GameDeveloperProductsGridInputData_DeveloperProductItem = v2.GameDeveloperProductsGridInputData_DeveloperProductItem, 
    GameSubscriptionsGridInputData = v2.GameSubscriptionsGridInputData, 
    GameSubscriptionsGridInputData_SubscriptionItem = v2.GameSubscriptionsGridInputData_SubscriptionItem, 
    CardContainerCardInputData = v2.CardContainerCardInputData, 
    CardContainerInputData = v2.CardContainerInputData, 
    CardInputData = v2.CardInputData, 
    DialogInputData = v2.DialogInputData, 
    BannerInputData = v2.BannerInputData, 
    TooltipInputData = v2.TooltipInputData, 
    EventDetailsFeedInputData = v2.EventDetailsFeedInputData, 
    ChartsFeedInputData = v2.ChartsFeedInputData, 
    FilterPillsInputData = v2.FilterPillsInputData, 
    FilterPillsInputData_FilterGroup = v2.FilterPillsInputData_FilterGroup, 
    FilterPillsInputData_FilterOption = v2.FilterPillsInputData_FilterOption, 
    SortSelectorInputData = v2.SortSelectorInputData, 
    SortSelectorInputData_SortOption = v2.SortSelectorInputData_SortOption, 
    UAMarketplaceCatalogItemGroupInputData = v2.UAMarketplaceCatalogItemGroupInputData, 
    UAMarketplaceCatalogItemCarouselInputData = v2.UAMarketplaceCatalogItemCarouselInputData, 
    UAMarketplaceCatalogFeedInputData = v2.UAMarketplaceCatalogFeedInputData, 
    UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem, 
    UAMarketplaceCatalogCategoryMenuInputData = v2.UAMarketplaceCatalogCategoryMenuInputData, 
    UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem, 
    PageEntryFormat = v2.PageEntryFormat
};