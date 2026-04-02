local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.page_entry);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 1925 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        page_entry = if not (v6 ~= nil) or v6.page_entry == nil then nil else v6.page_entry, 
        input_data = if not (v6 ~= nil) or v6.input_data == nil then nil else v6.input_data
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 1932 ]] --[[ Name: encode ]]
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
v4.decode = function(v17) --[[ Line: 1953 ]] --[[ Name: decode ]]
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
v4.jsonEncode = function(v25) --[[ Line: 2001 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.page_entry ~= nil then
        v26.pageEntry = v25.page_entry:jsonEncode();
    end;
    if v25.input_data ~= nil then
        v26.inputData = v25.input_data:jsonEncode();
    end;
    return v26;
end;
v4.jsonDecode = function(v27) --[[ Line: 2015 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v30) --[[ Line: 2051 ]] --[[ Name: new ]]
    -- upvalues: l_v4_1 (copy)
    return (setmetatable({
        input_data = if not (v30 ~= nil) or v30.input_data == nil then nil else v30.input_data, 
        roblox_component = (not (v30 ~= nil) or v30.roblox_component == nil) and "" or v30.roblox_component
    }, l_v4_1));
end;
v4.encode = function(v31) --[[ Line: 2058 ]] --[[ Name: encode ]]
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
v4.decode = function(v40) --[[ Line: 2078 ]] --[[ Name: decode ]]
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
v4.jsonEncode = function(v48) --[[ Line: 2126 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.input_data ~= nil then
        v49.inputData = v48.input_data:jsonEncode();
    end;
    if v48.roblox_component ~= nil and v48.roblox_component ~= "" then
        v49.robloxComponent = v48.roblox_component;
    end;
    return v49;
end;
v4.jsonDecode = function(v50) --[[ Line: 2140 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v53) --[[ Line: 2176 ]] --[[ Name: new ]]
    -- upvalues: l_v4_2 (copy)
    return (setmetatable({
        kind = if not (v53 ~= nil) or v53.kind == nil then nil else v53.kind
    }, l_v4_2));
end;
v4.encode = function(v54) --[[ Line: 2182 ]] --[[ Name: encode ]]
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
        elseif v54.kind.type == "coachmark" then
            local v120 = v54.kind.value:encode();
            local v121, v122 = v0.writeTag(v55, v56, 25, v0.wireTypes.lengthDelimited);
            v121, v122 = v0.writeBuffer(v121, v122, v120, buffer.len(v120));
            v55 = v121;
            v56 = v122;
        elseif v54.kind.type == "experience_content_rating_label" then
            local v123 = v54.kind.value:encode();
            local v124, v125 = v0.writeTag(v55, v56, 30, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v55 = v124;
            v56 = v125;
        elseif v54.kind.type == "experience_details_feed" then
            local v126 = v54.kind.value:encode();
            local v127, v128 = v0.writeTag(v55, v56, 500, v0.wireTypes.lengthDelimited);
            v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
            v55 = v127;
            v56 = v128;
        elseif v54.kind.type == "experience_details_action_bar" then
            local v129 = v54.kind.value:encode();
            local v130, v131 = v0.writeTag(v55, v56, 501, v0.wireTypes.lengthDelimited);
            v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
            v55 = v130;
            v56 = v131;
        elseif v54.kind.type == "event_details_feed" then
            local v132 = v54.kind.value:encode();
            local v133, v134 = v0.writeTag(v55, v56, 600, v0.wireTypes.lengthDelimited);
            v133, v134 = v0.writeBuffer(v133, v134, v132, buffer.len(v132));
            v55 = v133;
            v56 = v134;
        elseif v54.kind.type == "event_details_action_bar" then
            local v135 = v54.kind.value:encode();
            local v136, v137 = v0.writeTag(v55, v56, 601, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeBuffer(v136, v137, v135, buffer.len(v135));
            v55 = v136;
            v56 = v137;
        elseif v54.kind.type == "dev_store_feed" then
            local v138 = v54.kind.value:encode();
            local v139, v140 = v0.writeTag(v55, v56, 700, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v55 = v139;
            v56 = v140;
        elseif v54.kind.type == "charts_feed" then
            local v141 = v54.kind.value:encode();
            local v142, v143 = v0.writeTag(v55, v56, 800, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v55 = v142;
            v56 = v143;
        elseif v54.kind.type == "filter_pills" then
            local v144 = v54.kind.value:encode();
            local v145, v146 = v0.writeTag(v55, v56, 801, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
            v55 = v145;
            v56 = v146;
        elseif v54.kind.type == "sort_selector" then
            local v147 = v54.kind.value:encode();
            local v148, v149 = v0.writeTag(v55, v56, 802, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v55 = v148;
            v56 = v149;
        elseif v54.kind.type == "marketplace_catalog_feed" then
            local v150 = v54.kind.value:encode();
            local v151, v152 = v0.writeTag(v55, v56, 900, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v55 = v151;
            v56 = v152;
        elseif v54.kind.type == "marketplace_catalog_category_menu" then
            local v153 = v54.kind.value:encode();
            local v154, v155 = v0.writeTag(v55, v56, 901, v0.wireTypes.lengthDelimited);
            v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
            v55 = v154;
            v56 = v155;
        elseif v54.kind.type == "marketplace_catalog_item_group" then
            local v156 = v54.kind.value:encode();
            local v157, v158 = v0.writeTag(v55, v56, 902, v0.wireTypes.lengthDelimited);
            v157, v158 = v0.writeBuffer(v157, v158, v156, buffer.len(v156));
            v55 = v157;
            v56 = v158;
        elseif v54.kind.type == "marketplace_catalog_item_carousel" then
            local v159 = v54.kind.value:encode();
            local v160, v161 = v0.writeTag(v55, v56, 903, v0.wireTypes.lengthDelimited);
            v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
            v55 = v160;
            v56 = v161;
        end;
    end;
    local v162 = buffer.create(v56);
    buffer.copy(v162, 0, v55, 0, v56);
    return v162;
end;
v4.decode = function(v163) --[[ Line: 2335 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_2 (copy), v0 (copy), v2 (copy)
    local v164 = l_v4_2.new();
    local v165 = 0;
    while v165 < buffer.len(v163) do
        local v166 = nil;
        local v167 = nil;
        local v168, v169, v170 = v0.readTag(v163, v165);
        v166 = v168;
        v167 = v169;
        v165 = v170;
        if v167 == v0.wireTypes.varint then
            v168 = nil;
            v169, v170 = v0.readVarInt(v163, v165);
            v168 = v169;
            v165 = v170;
        elseif v167 == v0.wireTypes.lengthDelimited then
            if v166 == 1 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "badges_grid", 
                    value = v2.BadgesGridInputData.decode(v168)
                };
            elseif v166 == 2 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "badge_details", 
                    value = v2.BadgeDetailsInputData.decode(v168)
                };
            elseif v166 == 3 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "static_content", 
                    value = v2.StaticInputData.decode(v168)
                };
            elseif v166 == 4 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_attribution_row", 
                    value = v2.ExperienceAttributionRowInputData.decode(v168)
                };
            elseif v166 == 5 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_action_module", 
                    value = v2.ExperienceActionModuleInputData.decode(v168)
                };
            elseif v166 == 6 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_media_gallery", 
                    value = v2.ExperienceMediaGalleryInputData.decode(v168)
                };
            elseif v166 == 7 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_description", 
                    value = v2.ExperienceDescriptionInputData.decode(v168)
                };
            elseif v166 == 8 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_stat_row", 
                    value = v2.ExperienceStatRowInputData.decode(v168)
                };
            elseif v166 == 9 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_info_table", 
                    value = v2.ExperienceInfoTableInputData.decode(v168)
                };
            elseif v166 == 10 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "social_link_row", 
                    value = v2.SocialLinkRowInputData.decode(v168)
                };
            elseif v166 == 11 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_carousel", 
                    value = v2.ExperienceCarouselInputData.decode(v168)
                };
            elseif v166 == 12 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "song_carousel", 
                    value = v2.SongCarouselInputData.decode(v168)
                };
            elseif v166 == 13 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "events_carousel", 
                    value = v2.EventsCarouselInputData.decode(v168)
                };
            elseif v166 == 14 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "game_passes_grid", 
                    value = v2.GamePassesGridInputData.decode(v168)
                };
            elseif v166 == 15 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "developer_products_grid", 
                    value = v2.GameDeveloperProductsGridInputData.decode(v168)
                };
            elseif v166 == 16 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "subscriptions_grid", 
                    value = v2.GameSubscriptionsGridInputData.decode(v168)
                };
            elseif v166 == 20 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "card_container", 
                    value = v2.CardContainerInputData.decode(v168)
                };
            elseif v166 == 21 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "card", 
                    value = v2.CardInputData.decode(v168)
                };
            elseif v166 == 22 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "dialog", 
                    value = v2.DialogInputData.decode(v168)
                };
            elseif v166 == 23 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "banner", 
                    value = v2.BannerInputData.decode(v168)
                };
            elseif v166 == 24 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "tooltip", 
                    value = v2.TooltipInputData.decode(v168)
                };
            elseif v166 == 25 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "coachmark", 
                    value = v2.CoachmarkInputData.decode(v168)
                };
            elseif v166 == 30 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_content_rating_label", 
                    value = v2.ExperienceContentRatingLabelInputData.decode(v168)
                };
            elseif v166 == 500 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_details_feed", 
                    value = v2.ExperienceDetailsFeedInputData.decode(v168)
                };
            elseif v166 == 501 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "experience_details_action_bar", 
                    value = v2.ExperienceDetailsActionBarInputData.decode(v168)
                };
            elseif v166 == 600 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "event_details_feed", 
                    value = v2.EventDetailsFeedInputData.decode(v168)
                };
            elseif v166 == 601 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "event_details_action_bar", 
                    value = v2.EventDetailsActionBarInputData.decode(v168)
                };
            elseif v166 == 700 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "dev_store_feed", 
                    value = v2.DevStoreFeedInputData.decode(v168)
                };
            elseif v166 == 800 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "charts_feed", 
                    value = v2.ChartsFeedInputData.decode(v168)
                };
            elseif v166 == 801 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "filter_pills", 
                    value = v2.FilterPillsInputData.decode(v168)
                };
            elseif v166 == 802 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "sort_selector", 
                    value = v2.SortSelectorInputData.decode(v168)
                };
            elseif v166 == 900 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "marketplace_catalog_feed", 
                    value = v2.UAMarketplaceCatalogFeedInputData.decode(v168)
                };
            elseif v166 == 901 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "marketplace_catalog_category_menu", 
                    value = v2.UAMarketplaceCatalogCategoryMenuInputData.decode(v168)
                };
            elseif v166 == 902 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "marketplace_catalog_item_group", 
                    value = v2.UAMarketplaceCatalogItemGroupInputData.decode(v168)
                };
            elseif v166 == 903 then
                v168 = nil;
                v169, v170 = v0.readBuffer(v163, v165);
                v168 = v169;
                v165 = v170;
                v164.kind = {
                    type = "marketplace_catalog_item_carousel", 
                    value = v2.UAMarketplaceCatalogItemCarouselInputData.decode(v168)
                };
            else
                v168 = nil;
                v169, v170 = v0.readVarInt(v163, v165);
                v165 = v170 + v169;
            end;
        elseif v167 == v0.wireTypes.i32 then
            v168 = nil;
            v169, v170 = v0.readFixed32(v163, v165);
            v168 = v169;
            v165 = v170;
        elseif v167 == v0.wireTypes.i64 then
            v168 = nil;
            v169, v170 = v0.readFixed64(v163, v165);
            v168 = v169;
            v165 = v170;
        else
            error("Unsupported wire type: " .. v167);
        end;
    end;
    return v164;
end;
v4.jsonEncode = function(v171) --[[ Line: 2592 ]] --[[ Name: jsonEncode ]]
    local v172 = {};
    if v171.kind ~= nil then
        if v171.kind.type == "badges_grid" then
            v172.badgesGrid = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "badge_details" then
            v172.badgeDetails = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "static_content" then
            v172.staticContent = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_attribution_row" then
            v172.experienceAttributionRow = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_action_module" then
            v172.experienceActionModule = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_media_gallery" then
            v172.experienceMediaGallery = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_description" then
            v172.experienceDescription = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_stat_row" then
            v172.experienceStatRow = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_info_table" then
            v172.experienceInfoTable = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "social_link_row" then
            v172.socialLinkRow = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_carousel" then
            v172.experienceCarousel = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "song_carousel" then
            v172.songCarousel = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "events_carousel" then
            v172.eventsCarousel = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "game_passes_grid" then
            v172.gamePassesGrid = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "developer_products_grid" then
            v172.developerProductsGrid = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "subscriptions_grid" then
            v172.subscriptionsGrid = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "card_container" then
            v172.cardContainer = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "card" then
            v172.card = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "dialog" then
            v172.dialog = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "banner" then
            v172.banner = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "tooltip" then
            v172.tooltip = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "coachmark" then
            v172.coachmark = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_content_rating_label" then
            v172.experienceContentRatingLabel = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_details_feed" then
            v172.experienceDetailsFeed = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "experience_details_action_bar" then
            v172.experienceDetailsActionBar = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "event_details_feed" then
            v172.eventDetailsFeed = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "event_details_action_bar" then
            v172.eventDetailsActionBar = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "dev_store_feed" then
            v172.devStoreFeed = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "charts_feed" then
            v172.chartsFeed = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "filter_pills" then
            v172.filterPills = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "sort_selector" then
            v172.sortSelector = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "marketplace_catalog_feed" then
            v172.marketplaceCatalogFeed = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "marketplace_catalog_category_menu" then
            v172.marketplaceCatalogCategoryMenu = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "marketplace_catalog_item_group" then
            v172.marketplaceCatalogItemGroup = v171.kind.value:jsonEncode();
            return v172;
        elseif v171.kind.type == "marketplace_catalog_item_carousel" then
            v172.marketplaceCatalogItemCarousel = v171.kind.value:jsonEncode();
        end;
    end;
    return v172;
end;
v4.jsonDecode = function(v173) --[[ Line: 2672 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_2 (copy), v2 (copy)
    local v174 = l_v4_2.new();
    if v173.badges_grid ~= nil then
        v174.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v173.badges_grid)
        };
    end;
    if v173.badgesGrid ~= nil then
        v174.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v173.badgesGrid)
        };
    end;
    if v173.badge_details ~= nil then
        v174.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v173.badge_details)
        };
    end;
    if v173.badgeDetails ~= nil then
        v174.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v173.badgeDetails)
        };
    end;
    if v173.static_content ~= nil then
        v174.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v173.static_content)
        };
    end;
    if v173.staticContent ~= nil then
        v174.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v173.staticContent)
        };
    end;
    if v173.experience_attribution_row ~= nil then
        v174.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v173.experience_attribution_row)
        };
    end;
    if v173.experienceAttributionRow ~= nil then
        v174.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v173.experienceAttributionRow)
        };
    end;
    if v173.experience_action_module ~= nil then
        v174.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v173.experience_action_module)
        };
    end;
    if v173.experienceActionModule ~= nil then
        v174.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v173.experienceActionModule)
        };
    end;
    if v173.experience_media_gallery ~= nil then
        v174.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v173.experience_media_gallery)
        };
    end;
    if v173.experienceMediaGallery ~= nil then
        v174.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v173.experienceMediaGallery)
        };
    end;
    if v173.experience_description ~= nil then
        v174.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v173.experience_description)
        };
    end;
    if v173.experienceDescription ~= nil then
        v174.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v173.experienceDescription)
        };
    end;
    if v173.experience_stat_row ~= nil then
        v174.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v173.experience_stat_row)
        };
    end;
    if v173.experienceStatRow ~= nil then
        v174.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v173.experienceStatRow)
        };
    end;
    if v173.experience_info_table ~= nil then
        v174.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v173.experience_info_table)
        };
    end;
    if v173.experienceInfoTable ~= nil then
        v174.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v173.experienceInfoTable)
        };
    end;
    if v173.social_link_row ~= nil then
        v174.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v173.social_link_row)
        };
    end;
    if v173.socialLinkRow ~= nil then
        v174.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v173.socialLinkRow)
        };
    end;
    if v173.experience_carousel ~= nil then
        v174.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v173.experience_carousel)
        };
    end;
    if v173.experienceCarousel ~= nil then
        v174.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v173.experienceCarousel)
        };
    end;
    if v173.song_carousel ~= nil then
        v174.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v173.song_carousel)
        };
    end;
    if v173.songCarousel ~= nil then
        v174.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v173.songCarousel)
        };
    end;
    if v173.events_carousel ~= nil then
        v174.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v173.events_carousel)
        };
    end;
    if v173.eventsCarousel ~= nil then
        v174.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v173.eventsCarousel)
        };
    end;
    if v173.game_passes_grid ~= nil then
        v174.kind = {
            type = "game_passes_grid", 
            value = v2.GamePassesGridInputData.jsonDecode(v173.game_passes_grid)
        };
    end;
    if v173.gamePassesGrid ~= nil then
        v174.kind = {
            type = "game_passes_grid", 
            value = v2.GamePassesGridInputData.jsonDecode(v173.gamePassesGrid)
        };
    end;
    if v173.developer_products_grid ~= nil then
        v174.kind = {
            type = "developer_products_grid", 
            value = v2.GameDeveloperProductsGridInputData.jsonDecode(v173.developer_products_grid)
        };
    end;
    if v173.developerProductsGrid ~= nil then
        v174.kind = {
            type = "developer_products_grid", 
            value = v2.GameDeveloperProductsGridInputData.jsonDecode(v173.developerProductsGrid)
        };
    end;
    if v173.subscriptions_grid ~= nil then
        v174.kind = {
            type = "subscriptions_grid", 
            value = v2.GameSubscriptionsGridInputData.jsonDecode(v173.subscriptions_grid)
        };
    end;
    if v173.subscriptionsGrid ~= nil then
        v174.kind = {
            type = "subscriptions_grid", 
            value = v2.GameSubscriptionsGridInputData.jsonDecode(v173.subscriptionsGrid)
        };
    end;
    if v173.card_container ~= nil then
        v174.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v173.card_container)
        };
    end;
    if v173.cardContainer ~= nil then
        v174.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v173.cardContainer)
        };
    end;
    if v173.card ~= nil then
        v174.kind = {
            type = "card", 
            value = v2.CardInputData.jsonDecode(v173.card)
        };
    end;
    if v173.dialog ~= nil then
        v174.kind = {
            type = "dialog", 
            value = v2.DialogInputData.jsonDecode(v173.dialog)
        };
    end;
    if v173.banner ~= nil then
        v174.kind = {
            type = "banner", 
            value = v2.BannerInputData.jsonDecode(v173.banner)
        };
    end;
    if v173.tooltip ~= nil then
        v174.kind = {
            type = "tooltip", 
            value = v2.TooltipInputData.jsonDecode(v173.tooltip)
        };
    end;
    if v173.coachmark ~= nil then
        v174.kind = {
            type = "coachmark", 
            value = v2.CoachmarkInputData.jsonDecode(v173.coachmark)
        };
    end;
    if v173.experience_content_rating_label ~= nil then
        v174.kind = {
            type = "experience_content_rating_label", 
            value = v2.ExperienceContentRatingLabelInputData.jsonDecode(v173.experience_content_rating_label)
        };
    end;
    if v173.experienceContentRatingLabel ~= nil then
        v174.kind = {
            type = "experience_content_rating_label", 
            value = v2.ExperienceContentRatingLabelInputData.jsonDecode(v173.experienceContentRatingLabel)
        };
    end;
    if v173.experience_details_feed ~= nil then
        v174.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v173.experience_details_feed)
        };
    end;
    if v173.experienceDetailsFeed ~= nil then
        v174.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v173.experienceDetailsFeed)
        };
    end;
    if v173.experience_details_action_bar ~= nil then
        v174.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v173.experience_details_action_bar)
        };
    end;
    if v173.experienceDetailsActionBar ~= nil then
        v174.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v173.experienceDetailsActionBar)
        };
    end;
    if v173.event_details_feed ~= nil then
        v174.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v173.event_details_feed)
        };
    end;
    if v173.eventDetailsFeed ~= nil then
        v174.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v173.eventDetailsFeed)
        };
    end;
    if v173.event_details_action_bar ~= nil then
        v174.kind = {
            type = "event_details_action_bar", 
            value = v2.EventDetailsActionBarInputData.jsonDecode(v173.event_details_action_bar)
        };
    end;
    if v173.eventDetailsActionBar ~= nil then
        v174.kind = {
            type = "event_details_action_bar", 
            value = v2.EventDetailsActionBarInputData.jsonDecode(v173.eventDetailsActionBar)
        };
    end;
    if v173.dev_store_feed ~= nil then
        v174.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v173.dev_store_feed)
        };
    end;
    if v173.devStoreFeed ~= nil then
        v174.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v173.devStoreFeed)
        };
    end;
    if v173.charts_feed ~= nil then
        v174.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v173.charts_feed)
        };
    end;
    if v173.chartsFeed ~= nil then
        v174.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v173.chartsFeed)
        };
    end;
    if v173.filter_pills ~= nil then
        v174.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v173.filter_pills)
        };
    end;
    if v173.filterPills ~= nil then
        v174.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v173.filterPills)
        };
    end;
    if v173.sort_selector ~= nil then
        v174.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v173.sort_selector)
        };
    end;
    if v173.sortSelector ~= nil then
        v174.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v173.sortSelector)
        };
    end;
    if v173.marketplace_catalog_feed ~= nil then
        v174.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v173.marketplace_catalog_feed)
        };
    end;
    if v173.marketplaceCatalogFeed ~= nil then
        v174.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v173.marketplaceCatalogFeed)
        };
    end;
    if v173.marketplace_catalog_category_menu ~= nil then
        v174.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v173.marketplace_catalog_category_menu)
        };
    end;
    if v173.marketplaceCatalogCategoryMenu ~= nil then
        v174.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v173.marketplaceCatalogCategoryMenu)
        };
    end;
    if v173.marketplace_catalog_item_group ~= nil then
        v174.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v173.marketplace_catalog_item_group)
        };
    end;
    if v173.marketplaceCatalogItemGroup ~= nil then
        v174.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v173.marketplaceCatalogItemGroup)
        };
    end;
    if v173.marketplace_catalog_item_carousel ~= nil then
        v174.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v173.marketplace_catalog_item_carousel)
        };
    end;
    if v173.marketplaceCatalogItemCarousel ~= nil then
        v174.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v173.marketplaceCatalogItemCarousel)
        };
    end;
    return v174;
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
v4.new = function(v176) --[[ Line: 3090 ]] --[[ Name: new ]]
    -- upvalues: l_v4_3 (copy)
    return (setmetatable({
        section_title = (not (v176 ~= nil) or v176.section_title == nil) and "" or v176.section_title, 
        badges = if not (v176 ~= nil) or v176.badges == nil then {} else v176.badges, 
        collection_id = (not (v176 ~= nil) or v176.collection_id == nil) and "" or v176.collection_id, 
        collection_position = (not (v176 ~= nil) or v176.collection_position == nil) and "" or v176.collection_position, 
        universe_id = (not (v176 ~= nil) or v176.universe_id == nil) and "" or v176.universe_id
    }, l_v4_3));
end;
v4.encode = function(v177) --[[ Line: 3102 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v178 = buffer.create(0);
    local v179 = 0;
    if v177.section_title ~= nil and v177.section_title ~= "" then
        local v180, v181 = v0.writeTag(v178, v179, 1, v0.wireTypes.lengthDelimited);
        v180, v181 = v0.writeString(v180, v181, v177.section_title);
        v178 = v180;
        v179 = v181;
    end;
    if v177.badges ~= nil and #v177.badges > 0 then
        for _, v183 in v177.badges do
            local v184 = v183:encode();
            local v185, v186 = v0.writeTag(v178, v179, 2, v0.wireTypes.lengthDelimited);
            v185, v186 = v0.writeBuffer(v185, v186, v184, buffer.len(v184));
            v178 = v185;
            v179 = v186;
        end;
    end;
    if v177.collection_id ~= nil and v177.collection_id ~= "" then
        local v187, v188 = v0.writeTag(v178, v179, 3, v0.wireTypes.lengthDelimited);
        v187, v188 = v0.writeString(v187, v188, v177.collection_id);
        v178 = v187;
        v179 = v188;
    end;
    if v177.collection_position ~= nil and v177.collection_position ~= "" then
        local v189, v190 = v0.writeTag(v178, v179, 4, v0.wireTypes.lengthDelimited);
        v189, v190 = v0.writeString(v189, v190, v177.collection_position);
        v178 = v189;
        v179 = v190;
    end;
    if v177.universe_id ~= nil and v177.universe_id ~= "" then
        local v191, v192 = v0.writeTag(v178, v179, 5, v0.wireTypes.lengthDelimited);
        v191, v192 = v0.writeString(v191, v192, v177.universe_id);
        v178 = v191;
        v179 = v192;
    end;
    local v193 = buffer.create(v179);
    buffer.copy(v193, 0, v178, 0, v179);
    return v193;
end;
v4.decode = function(v194) --[[ Line: 3139 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_3 (copy), v0 (copy), v2 (copy)
    local v195 = l_v4_3.new();
    local v196 = 0;
    while v196 < buffer.len(v194) do
        local v197 = nil;
        local v198 = nil;
        local v199, v200, v201 = v0.readTag(v194, v196);
        v197 = v199;
        v198 = v200;
        v196 = v201;
        if v198 == v0.wireTypes.varint then
            v199 = nil;
            v200, v201 = v0.readVarInt(v194, v196);
            v199 = v200;
            v196 = v201;
        elseif v198 == v0.wireTypes.lengthDelimited then
            if v197 == 1 then
                v199 = nil;
                v200, v201 = v0.readBuffer(v194, v196);
                v199 = v200;
                v196 = v201;
                v195.section_title = buffer.tostring(v199);
            elseif v197 == 2 then
                v199 = nil;
                v200, v201 = v0.readBuffer(v194, v196);
                v199 = v200;
                v196 = v201;
                table.insert(v195.badges, v2.BadgesGridInputData_BadgeInputData.decode(v199));
            elseif v197 == 3 then
                v199 = nil;
                v200, v201 = v0.readBuffer(v194, v196);
                v199 = v200;
                v196 = v201;
                v195.collection_id = buffer.tostring(v199);
            elseif v197 == 4 then
                v199 = nil;
                v200, v201 = v0.readBuffer(v194, v196);
                v199 = v200;
                v196 = v201;
                v195.collection_position = buffer.tostring(v199);
            elseif v197 == 5 then
                v199 = nil;
                v200, v201 = v0.readBuffer(v194, v196);
                v199 = v200;
                v196 = v201;
                v195.universe_id = buffer.tostring(v199);
            else
                v199 = nil;
                v200, v201 = v0.readVarInt(v194, v196);
                v196 = v201 + v200;
            end;
        elseif v198 == v0.wireTypes.i32 then
            v199 = nil;
            v200, v201 = v0.readFixed32(v194, v196);
            v199 = v200;
            v196 = v201;
        elseif v198 == v0.wireTypes.i64 then
            v199 = nil;
            v200, v201 = v0.readFixed64(v194, v196);
            v199 = v200;
            v196 = v201;
        else
            error("Unsupported wire type: " .. v198);
        end;
    end;
    return v195;
end;
v4.jsonEncode = function(v202) --[[ Line: 3202 ]] --[[ Name: jsonEncode ]]
    local v203 = {};
    if v202.section_title ~= nil and v202.section_title ~= "" then
        v203.sectionTitle = v202.section_title;
    end;
    if v202.badges ~= nil and #v202.badges > 0 then
        local v204 = {};
        for _, v206 in v202.badges do
            table.insert(v204, v206:jsonEncode());
        end;
        v203.badges = v204;
    end;
    if v202.collection_id ~= nil and v202.collection_id ~= "" then
        v203.collectionId = v202.collection_id;
    end;
    if v202.collection_position ~= nil and v202.collection_position ~= "" then
        v203.collectionPosition = v202.collection_position;
    end;
    if v202.universe_id ~= nil and v202.universe_id ~= "" then
        v203.universeId = v202.universe_id;
    end;
    return v203;
end;
v4.jsonDecode = function(v207) --[[ Line: 3232 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_3 (copy), v2 (copy)
    local v208 = l_v4_3.new();
    if v207.section_title ~= nil then
        v208.section_title = v207.section_title;
    end;
    if v207.sectionTitle ~= nil then
        v208.section_title = v207.sectionTitle;
    end;
    if v207.badges ~= nil then
        local v209 = {};
        for _, v211 in v207.badges do
            table.insert(v209, v2.BadgesGridInputData_BadgeInputData.jsonDecode(v211));
        end;
        v208.badges = v209;
    end;
    if v207.collection_id ~= nil then
        v208.collection_id = v207.collection_id;
    end;
    if v207.collectionId ~= nil then
        v208.collection_id = v207.collectionId;
    end;
    if v207.collection_position ~= nil then
        v208.collection_position = v207.collection_position;
    end;
    if v207.collectionPosition ~= nil then
        v208.collection_position = v207.collectionPosition;
    end;
    if v207.universe_id ~= nil then
        v208.universe_id = v207.universe_id;
    end;
    if v207.universeId ~= nil then
        v208.universe_id = v207.universeId;
    end;
    return v208;
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
v4.new = function(v213) --[[ Line: 3293 ]] --[[ Name: new ]]
    -- upvalues: l_v4_4 (copy)
    return (setmetatable({
        badge_id = (not (v213 ~= nil) or v213.badge_id == nil) and "" or v213.badge_id
    }, l_v4_4));
end;
v4.encode = function(v214) --[[ Line: 3301 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v215 = buffer.create(0);
    local v216 = 0;
    if v214.badge_id ~= nil and v214.badge_id ~= "" then
        local v217, v218 = v0.writeTag(v215, v216, 1, v0.wireTypes.lengthDelimited);
        v217, v218 = v0.writeString(v217, v218, v214.badge_id);
        v215 = v217;
        v216 = v218;
    end;
    local v219 = buffer.create(v216);
    buffer.copy(v219, 0, v215, 0, v216);
    return v219;
end;
v4.decode = function(v220) --[[ Line: 3315 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_4 (copy), v0 (copy)
    local v221 = l_v4_4.new();
    local v222 = 0;
    while v222 < buffer.len(v220) do
        local v223 = nil;
        local v224 = nil;
        local v225, v226, v227 = v0.readTag(v220, v222);
        v223 = v225;
        v224 = v226;
        v222 = v227;
        if v224 == v0.wireTypes.varint then
            v225 = nil;
            v226, v227 = v0.readVarInt(v220, v222);
            v225 = v226;
            v222 = v227;
        elseif v224 == v0.wireTypes.lengthDelimited then
            if v223 == 1 then
                v225 = nil;
                v226, v227 = v0.readBuffer(v220, v222);
                v225 = v226;
                v222 = v227;
                v221.badge_id = buffer.tostring(v225);
            else
                v225 = nil;
                v226, v227 = v0.readVarInt(v220, v222);
                v222 = v227 + v226;
            end;
        elseif v224 == v0.wireTypes.i32 then
            v225 = nil;
            v226, v227 = v0.readFixed32(v220, v222);
            v225 = v226;
            v222 = v227;
        elseif v224 == v0.wireTypes.i64 then
            v225 = nil;
            v226, v227 = v0.readFixed64(v220, v222);
            v225 = v226;
            v222 = v227;
        else
            error("Unsupported wire type: " .. v224);
        end;
    end;
    return v221;
end;
v4.jsonEncode = function(v228) --[[ Line: 3358 ]] --[[ Name: jsonEncode ]]
    local v229 = {};
    if v228.badge_id ~= nil and v228.badge_id ~= "" then
        v229.badgeId = v228.badge_id;
    end;
    return v229;
end;
v4.jsonDecode = function(v230) --[[ Line: 3368 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_4 (copy)
    local v231 = l_v4_4.new();
    if v230.badge_id ~= nil then
        v231.badge_id = v230.badge_id;
    end;
    if v230.badgeId ~= nil then
        v231.badge_id = v230.badgeId;
    end;
    return v231;
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
v4.new = function(v233) --[[ Line: 3398 ]] --[[ Name: new ]]
    -- upvalues: l_v4_5 (copy)
    return (setmetatable({
        badge_id = (not (v233 ~= nil) or v233.badge_id == nil) and "" or v233.badge_id, 
        universe_id = (not (v233 ~= nil) or v233.universe_id == nil) and "" or v233.universe_id, 
        localized_literals = if not (v233 ~= nil) or v233.localized_literals == nil then nil else v233.localized_literals, 
        creator_key = (not (v233 ~= nil) or v233.creator_key == nil) and "" or v233.creator_key
    }, l_v4_5));
end;
v4.encode = function(v234) --[[ Line: 3407 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v235 = buffer.create(0);
    local v236 = 0;
    if v234.badge_id ~= nil and v234.badge_id ~= "" then
        local v237, v238 = v0.writeTag(v235, v236, 1, v0.wireTypes.lengthDelimited);
        v237, v238 = v0.writeString(v237, v238, v234.badge_id);
        v235 = v237;
        v236 = v238;
    end;
    if v234.universe_id ~= nil and v234.universe_id ~= "" then
        local v239, v240 = v0.writeTag(v235, v236, 2, v0.wireTypes.lengthDelimited);
        v239, v240 = v0.writeString(v239, v240, v234.universe_id);
        v235 = v239;
        v236 = v240;
    end;
    if v234.localized_literals ~= nil then
        local v241 = v234.localized_literals:encode();
        local v242, v243 = v0.writeTag(v235, v236, 3, v0.wireTypes.lengthDelimited);
        v242, v243 = v0.writeBuffer(v242, v243, v241, buffer.len(v241));
        v235 = v242;
        v236 = v243;
    end;
    if v234.creator_key ~= nil and v234.creator_key ~= "" then
        local v244, v245 = v0.writeTag(v235, v236, 4, v0.wireTypes.lengthDelimited);
        v244, v245 = v0.writeString(v244, v245, v234.creator_key);
        v235 = v244;
        v236 = v245;
    end;
    local v246 = buffer.create(v236);
    buffer.copy(v246, 0, v235, 0, v236);
    return v246;
end;
v4.decode = function(v247) --[[ Line: 3437 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_5 (copy), v0 (copy), v2 (copy)
    local v248 = l_v4_5.new();
    local v249 = 0;
    while v249 < buffer.len(v247) do
        local v250 = nil;
        local v251 = nil;
        local v252, v253, v254 = v0.readTag(v247, v249);
        v250 = v252;
        v251 = v253;
        v249 = v254;
        if v251 == v0.wireTypes.varint then
            v252 = nil;
            v253, v254 = v0.readVarInt(v247, v249);
            v252 = v253;
            v249 = v254;
        elseif v251 == v0.wireTypes.lengthDelimited then
            if v250 == 1 then
                v252 = nil;
                v253, v254 = v0.readBuffer(v247, v249);
                v252 = v253;
                v249 = v254;
                v248.badge_id = buffer.tostring(v252);
            elseif v250 == 2 then
                v252 = nil;
                v253, v254 = v0.readBuffer(v247, v249);
                v252 = v253;
                v249 = v254;
                v248.universe_id = buffer.tostring(v252);
            elseif v250 == 3 then
                v252 = nil;
                v253, v254 = v0.readBuffer(v247, v249);
                v252 = v253;
                v249 = v254;
                v248.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.decode(v252);
            elseif v250 == 4 then
                v252 = nil;
                v253, v254 = v0.readBuffer(v247, v249);
                v252 = v253;
                v249 = v254;
                v248.creator_key = buffer.tostring(v252);
            else
                v252 = nil;
                v253, v254 = v0.readVarInt(v247, v249);
                v249 = v254 + v253;
            end;
        elseif v251 == v0.wireTypes.i32 then
            v252 = nil;
            v253, v254 = v0.readFixed32(v247, v249);
            v252 = v253;
            v249 = v254;
        elseif v251 == v0.wireTypes.i64 then
            v252 = nil;
            v253, v254 = v0.readFixed64(v247, v249);
            v252 = v253;
            v249 = v254;
        else
            error("Unsupported wire type: " .. v251);
        end;
    end;
    return v248;
end;
v4.jsonEncode = function(v255) --[[ Line: 3495 ]] --[[ Name: jsonEncode ]]
    local v256 = {};
    if v255.badge_id ~= nil and v255.badge_id ~= "" then
        v256.badgeId = v255.badge_id;
    end;
    if v255.universe_id ~= nil and v255.universe_id ~= "" then
        v256.universeId = v255.universe_id;
    end;
    if v255.localized_literals ~= nil then
        v256.localizedLiterals = v255.localized_literals:jsonEncode();
    end;
    if v255.creator_key ~= nil and v255.creator_key ~= "" then
        v256.creatorKey = v255.creator_key;
    end;
    return v256;
end;
v4.jsonDecode = function(v257) --[[ Line: 3517 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_5 (copy), v2 (copy)
    local v258 = l_v4_5.new();
    if v257.badge_id ~= nil then
        v258.badge_id = v257.badge_id;
    end;
    if v257.badgeId ~= nil then
        v258.badge_id = v257.badgeId;
    end;
    if v257.universe_id ~= nil then
        v258.universe_id = v257.universe_id;
    end;
    if v257.universeId ~= nil then
        v258.universe_id = v257.universeId;
    end;
    if v257.localized_literals ~= nil then
        v258.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v257.localized_literals);
    end;
    if v257.localizedLiterals ~= nil then
        v258.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v257.localizedLiterals);
    end;
    if v257.creator_key ~= nil then
        v258.creator_key = v257.creator_key;
    end;
    if v257.creatorKey ~= nil then
        v258.creator_key = v257.creatorKey;
    end;
    return v258;
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
v4.new = function(v260) --[[ Line: 3571 ]] --[[ Name: new ]]
    -- upvalues: l_v4_6 (copy)
    return (setmetatable({
        info_table = if not (v260 ~= nil) or v260.info_table == nil then nil else v260.info_table, 
        action_module = if not (v260 ~= nil) or v260.action_module == nil then nil else v260.action_module, 
        overflow_menu = if not (v260 ~= nil) or v260.overflow_menu == nil then nil else v260.overflow_menu
    }, l_v4_6));
end;
v4.encode = function(v261) --[[ Line: 3581 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v262 = buffer.create(0);
    local v263 = 0;
    if v261.info_table ~= nil then
        local v264 = v261.info_table:encode();
        local v265, v266 = v0.writeTag(v262, v263, 1, v0.wireTypes.lengthDelimited);
        v265, v266 = v0.writeBuffer(v265, v266, v264, buffer.len(v264));
        v262 = v265;
        v263 = v266;
    end;
    if v261.action_module ~= nil then
        local v267 = v261.action_module:encode();
        local v268, v269 = v0.writeTag(v262, v263, 2, v0.wireTypes.lengthDelimited);
        v268, v269 = v0.writeBuffer(v268, v269, v267, buffer.len(v267));
        v262 = v268;
        v263 = v269;
    end;
    if v261.overflow_menu ~= nil then
        local v270 = v261.overflow_menu:encode();
        local v271, v272 = v0.writeTag(v262, v263, 3, v0.wireTypes.lengthDelimited);
        v271, v272 = v0.writeBuffer(v271, v272, v270, buffer.len(v270));
        v262 = v271;
        v263 = v272;
    end;
    local v273 = buffer.create(v263);
    buffer.copy(v273, 0, v262, 0, v263);
    return v273;
end;
v4.decode = function(v274) --[[ Line: 3608 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_6 (copy), v0 (copy), v2 (copy)
    local v275 = l_v4_6.new();
    local v276 = 0;
    while v276 < buffer.len(v274) do
        local v277 = nil;
        local v278 = nil;
        local v279, v280, v281 = v0.readTag(v274, v276);
        v277 = v279;
        v278 = v280;
        v276 = v281;
        if v278 == v0.wireTypes.varint then
            v279 = nil;
            v280, v281 = v0.readVarInt(v274, v276);
            v279 = v280;
            v276 = v281;
        elseif v278 == v0.wireTypes.lengthDelimited then
            if v277 == 1 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(v279);
            elseif v277 == 2 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(v279);
            elseif v277 == 3 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(v279);
            else
                v279 = nil;
                v280, v281 = v0.readVarInt(v274, v276);
                v276 = v281 + v280;
            end;
        elseif v278 == v0.wireTypes.i32 then
            v279 = nil;
            v280, v281 = v0.readFixed32(v274, v276);
            v279 = v280;
            v276 = v281;
        elseif v278 == v0.wireTypes.i64 then
            v279 = nil;
            v280, v281 = v0.readFixed64(v274, v276);
            v279 = v280;
            v276 = v281;
        else
            error("Unsupported wire type: " .. v278);
        end;
    end;
    return v275;
end;
v4.jsonEncode = function(v282) --[[ Line: 3661 ]] --[[ Name: jsonEncode ]]
    local v283 = {};
    if v282.info_table ~= nil then
        v283.infoTable = v282.info_table:jsonEncode();
    end;
    if v282.action_module ~= nil then
        v283.actionModule = v282.action_module:jsonEncode();
    end;
    if v282.overflow_menu ~= nil then
        v283.overflowMenu = v282.overflow_menu:jsonEncode();
    end;
    return v283;
end;
v4.jsonDecode = function(v284) --[[ Line: 3679 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_6 (copy), v2 (copy)
    local v285 = l_v4_6.new();
    if v284.info_table ~= nil then
        v285.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v284.info_table);
    end;
    if v284.infoTable ~= nil then
        v285.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v284.infoTable);
    end;
    if v284.action_module ~= nil then
        v285.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v284.action_module);
    end;
    if v284.actionModule ~= nil then
        v285.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v284.actionModule);
    end;
    if v284.overflow_menu ~= nil then
        v285.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v284.overflow_menu);
    end;
    if v284.overflowMenu ~= nil then
        v285.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v284.overflowMenu);
    end;
    return v285;
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
v4.new = function(v287) --[[ Line: 3730 ]] --[[ Name: new ]]
    -- upvalues: l_v4_7 (copy)
    return (setmetatable({
        type_label = (not (v287 ~= nil) or v287.type_label == nil) and "" or v287.type_label, 
        earned_label = (not (v287 ~= nil) or v287.earned_label == nil) and "" or v287.earned_label, 
        updated_label = (not (v287 ~= nil) or v287.updated_label == nil) and "" or v287.updated_label, 
        experience_label = (not (v287 ~= nil) or v287.experience_label == nil) and "" or v287.experience_label, 
        rarity_label = (not (v287 ~= nil) or v287.rarity_label == nil) and "" or v287.rarity_label, 
        won_yesterday_label = (not (v287 ~= nil) or v287.won_yesterday_label == nil) and "" or v287.won_yesterday_label, 
        won_ever_label = (not (v287 ~= nil) or v287.won_ever_label == nil) and "" or v287.won_ever_label
    }, l_v4_7));
end;
v4.encode = function(v288) --[[ Line: 3749 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v289 = buffer.create(0);
    local v290 = 0;
    if v288.type_label ~= nil and v288.type_label ~= "" then
        local v291, v292 = v0.writeTag(v289, v290, 1, v0.wireTypes.lengthDelimited);
        v291, v292 = v0.writeString(v291, v292, v288.type_label);
        v289 = v291;
        v290 = v292;
    end;
    if v288.earned_label ~= nil and v288.earned_label ~= "" then
        local v293, v294 = v0.writeTag(v289, v290, 2, v0.wireTypes.lengthDelimited);
        v293, v294 = v0.writeString(v293, v294, v288.earned_label);
        v289 = v293;
        v290 = v294;
    end;
    if v288.updated_label ~= nil and v288.updated_label ~= "" then
        local v295, v296 = v0.writeTag(v289, v290, 3, v0.wireTypes.lengthDelimited);
        v295, v296 = v0.writeString(v295, v296, v288.updated_label);
        v289 = v295;
        v290 = v296;
    end;
    if v288.experience_label ~= nil and v288.experience_label ~= "" then
        local v297, v298 = v0.writeTag(v289, v290, 4, v0.wireTypes.lengthDelimited);
        v297, v298 = v0.writeString(v297, v298, v288.experience_label);
        v289 = v297;
        v290 = v298;
    end;
    if v288.rarity_label ~= nil and v288.rarity_label ~= "" then
        local v299, v300 = v0.writeTag(v289, v290, 5, v0.wireTypes.lengthDelimited);
        v299, v300 = v0.writeString(v299, v300, v288.rarity_label);
        v289 = v299;
        v290 = v300;
    end;
    if v288.won_yesterday_label ~= nil and v288.won_yesterday_label ~= "" then
        local v301, v302 = v0.writeTag(v289, v290, 6, v0.wireTypes.lengthDelimited);
        v301, v302 = v0.writeString(v301, v302, v288.won_yesterday_label);
        v289 = v301;
        v290 = v302;
    end;
    if v288.won_ever_label ~= nil and v288.won_ever_label ~= "" then
        local v303, v304 = v0.writeTag(v289, v290, 7, v0.wireTypes.lengthDelimited);
        v303, v304 = v0.writeString(v303, v304, v288.won_ever_label);
        v289 = v303;
        v290 = v304;
    end;
    local v305 = buffer.create(v290);
    buffer.copy(v305, 0, v289, 0, v290);
    return v305;
end;
v4.decode = function(v306) --[[ Line: 3795 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_7 (copy), v0 (copy)
    local v307 = l_v4_7.new();
    local v308 = 0;
    while v308 < buffer.len(v306) do
        local v309 = nil;
        local v310 = nil;
        local v311, v312, v313 = v0.readTag(v306, v308);
        v309 = v311;
        v310 = v312;
        v308 = v313;
        if v310 == v0.wireTypes.varint then
            v311 = nil;
            v312, v313 = v0.readVarInt(v306, v308);
            v311 = v312;
            v308 = v313;
        elseif v310 == v0.wireTypes.lengthDelimited then
            if v309 == 1 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.type_label = buffer.tostring(v311);
            elseif v309 == 2 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.earned_label = buffer.tostring(v311);
            elseif v309 == 3 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.updated_label = buffer.tostring(v311);
            elseif v309 == 4 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.experience_label = buffer.tostring(v311);
            elseif v309 == 5 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.rarity_label = buffer.tostring(v311);
            elseif v309 == 6 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.won_yesterday_label = buffer.tostring(v311);
            elseif v309 == 7 then
                v311 = nil;
                v312, v313 = v0.readBuffer(v306, v308);
                v311 = v312;
                v308 = v313;
                v307.won_ever_label = buffer.tostring(v311);
            else
                v311 = nil;
                v312, v313 = v0.readVarInt(v306, v308);
                v308 = v313 + v312;
            end;
        elseif v310 == v0.wireTypes.i32 then
            v311 = nil;
            v312, v313 = v0.readFixed32(v306, v308);
            v311 = v312;
            v308 = v313;
        elseif v310 == v0.wireTypes.i64 then
            v311 = nil;
            v312, v313 = v0.readFixed64(v306, v308);
            v311 = v312;
            v308 = v313;
        else
            error("Unsupported wire type: " .. v310);
        end;
    end;
    return v307;
end;
v4.jsonEncode = function(v314) --[[ Line: 3870 ]] --[[ Name: jsonEncode ]]
    local v315 = {};
    if v314.type_label ~= nil and v314.type_label ~= "" then
        v315.typeLabel = v314.type_label;
    end;
    if v314.earned_label ~= nil and v314.earned_label ~= "" then
        v315.earnedLabel = v314.earned_label;
    end;
    if v314.updated_label ~= nil and v314.updated_label ~= "" then
        v315.updatedLabel = v314.updated_label;
    end;
    if v314.experience_label ~= nil and v314.experience_label ~= "" then
        v315.experienceLabel = v314.experience_label;
    end;
    if v314.rarity_label ~= nil and v314.rarity_label ~= "" then
        v315.rarityLabel = v314.rarity_label;
    end;
    if v314.won_yesterday_label ~= nil and v314.won_yesterday_label ~= "" then
        v315.wonYesterdayLabel = v314.won_yesterday_label;
    end;
    if v314.won_ever_label ~= nil and v314.won_ever_label ~= "" then
        v315.wonEverLabel = v314.won_ever_label;
    end;
    return v315;
end;
v4.jsonDecode = function(v316) --[[ Line: 3906 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_7 (copy)
    local v317 = l_v4_7.new();
    if v316.type_label ~= nil then
        v317.type_label = v316.type_label;
    end;
    if v316.typeLabel ~= nil then
        v317.type_label = v316.typeLabel;
    end;
    if v316.earned_label ~= nil then
        v317.earned_label = v316.earned_label;
    end;
    if v316.earnedLabel ~= nil then
        v317.earned_label = v316.earnedLabel;
    end;
    if v316.updated_label ~= nil then
        v317.updated_label = v316.updated_label;
    end;
    if v316.updatedLabel ~= nil then
        v317.updated_label = v316.updatedLabel;
    end;
    if v316.experience_label ~= nil then
        v317.experience_label = v316.experience_label;
    end;
    if v316.experienceLabel ~= nil then
        v317.experience_label = v316.experienceLabel;
    end;
    if v316.rarity_label ~= nil then
        v317.rarity_label = v316.rarity_label;
    end;
    if v316.rarityLabel ~= nil then
        v317.rarity_label = v316.rarityLabel;
    end;
    if v316.won_yesterday_label ~= nil then
        v317.won_yesterday_label = v316.won_yesterday_label;
    end;
    if v316.wonYesterdayLabel ~= nil then
        v317.won_yesterday_label = v316.wonYesterdayLabel;
    end;
    if v316.won_ever_label ~= nil then
        v317.won_ever_label = v316.won_ever_label;
    end;
    if v316.wonEverLabel ~= nil then
        v317.won_ever_label = v316.wonEverLabel;
    end;
    return v317;
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
v4.new = function(v319) --[[ Line: 3986 ]] --[[ Name: new ]]
    -- upvalues: l_v4_8 (copy)
    return (setmetatable({
        share = (not (v319 ~= nil) or v319.share == nil) and "" or v319.share, 
        report = (not (v319 ~= nil) or v319.report == nil) and "" or v319.report
    }, l_v4_8));
end;
v4.encode = function(v320) --[[ Line: 3998 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v321 = buffer.create(0);
    local v322 = 0;
    if v320.share ~= nil and v320.share ~= "" then
        local v323, v324 = v0.writeTag(v321, v322, 1, v0.wireTypes.lengthDelimited);
        v323, v324 = v0.writeString(v323, v324, v320.share);
        v321 = v323;
        v322 = v324;
    end;
    if v320.report ~= nil and v320.report ~= "" then
        local v325, v326 = v0.writeTag(v321, v322, 2, v0.wireTypes.lengthDelimited);
        v325, v326 = v0.writeString(v325, v326, v320.report);
        v321 = v325;
        v322 = v326;
    end;
    local v327 = buffer.create(v322);
    buffer.copy(v327, 0, v321, 0, v322);
    return v327;
end;
v4.decode = function(v328) --[[ Line: 4019 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_8 (copy), v0 (copy)
    local v329 = l_v4_8.new();
    local v330 = 0;
    while v330 < buffer.len(v328) do
        local v331 = nil;
        local v332 = nil;
        local v333, v334, v335 = v0.readTag(v328, v330);
        v331 = v333;
        v332 = v334;
        v330 = v335;
        if v332 == v0.wireTypes.varint then
            v333 = nil;
            v334, v335 = v0.readVarInt(v328, v330);
            v333 = v334;
            v330 = v335;
        elseif v332 == v0.wireTypes.lengthDelimited then
            if v331 == 1 then
                v333 = nil;
                v334, v335 = v0.readBuffer(v328, v330);
                v333 = v334;
                v330 = v335;
                v329.share = buffer.tostring(v333);
            elseif v331 == 2 then
                v333 = nil;
                v334, v335 = v0.readBuffer(v328, v330);
                v333 = v334;
                v330 = v335;
                v329.report = buffer.tostring(v333);
            else
                v333 = nil;
                v334, v335 = v0.readVarInt(v328, v330);
                v330 = v335 + v334;
            end;
        elseif v332 == v0.wireTypes.i32 then
            v333 = nil;
            v334, v335 = v0.readFixed32(v328, v330);
            v333 = v334;
            v330 = v335;
        elseif v332 == v0.wireTypes.i64 then
            v333 = nil;
            v334, v335 = v0.readFixed64(v328, v330);
            v333 = v334;
            v330 = v335;
        else
            error("Unsupported wire type: " .. v332);
        end;
    end;
    return v329;
end;
v4.jsonEncode = function(v336) --[[ Line: 4069 ]] --[[ Name: jsonEncode ]]
    local v337 = {};
    if v336.share ~= nil and v336.share ~= "" then
        v337.share = v336.share;
    end;
    if v336.report ~= nil and v336.report ~= "" then
        v337.report = v336.report;
    end;
    return v337;
end;
v4.jsonDecode = function(v338) --[[ Line: 4085 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_8 (copy)
    local v339 = l_v4_8.new();
    if v338.share ~= nil then
        v339.share = v338.share;
    end;
    if v338.report ~= nil then
        v339.report = v338.report;
    end;
    return v339;
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
v4.new = function(v341) --[[ Line: 4117 ]] --[[ Name: new ]]
    -- upvalues: l_v4_9 (copy)
    return (setmetatable({
        report = (not (v341 ~= nil) or v341.report == nil) and "" or v341.report, 
        remove = (not (v341 ~= nil) or v341.remove == nil) and "" or v341.remove
    }, l_v4_9));
end;
v4.encode = function(v342) --[[ Line: 4129 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v343 = buffer.create(0);
    local v344 = 0;
    if v342.report ~= nil and v342.report ~= "" then
        local v345, v346 = v0.writeTag(v343, v344, 1, v0.wireTypes.lengthDelimited);
        v345, v346 = v0.writeString(v345, v346, v342.report);
        v343 = v345;
        v344 = v346;
    end;
    if v342.remove ~= nil and v342.remove ~= "" then
        local v347, v348 = v0.writeTag(v343, v344, 2, v0.wireTypes.lengthDelimited);
        v347, v348 = v0.writeString(v347, v348, v342.remove);
        v343 = v347;
        v344 = v348;
    end;
    local v349 = buffer.create(v344);
    buffer.copy(v349, 0, v343, 0, v344);
    return v349;
end;
v4.decode = function(v350) --[[ Line: 4150 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_9 (copy), v0 (copy)
    local v351 = l_v4_9.new();
    local v352 = 0;
    while v352 < buffer.len(v350) do
        local v353 = nil;
        local v354 = nil;
        local v355, v356, v357 = v0.readTag(v350, v352);
        v353 = v355;
        v354 = v356;
        v352 = v357;
        if v354 == v0.wireTypes.varint then
            v355 = nil;
            v356, v357 = v0.readVarInt(v350, v352);
            v355 = v356;
            v352 = v357;
        elseif v354 == v0.wireTypes.lengthDelimited then
            if v353 == 1 then
                v355 = nil;
                v356, v357 = v0.readBuffer(v350, v352);
                v355 = v356;
                v352 = v357;
                v351.report = buffer.tostring(v355);
            elseif v353 == 2 then
                v355 = nil;
                v356, v357 = v0.readBuffer(v350, v352);
                v355 = v356;
                v352 = v357;
                v351.remove = buffer.tostring(v355);
            else
                v355 = nil;
                v356, v357 = v0.readVarInt(v350, v352);
                v352 = v357 + v356;
            end;
        elseif v354 == v0.wireTypes.i32 then
            v355 = nil;
            v356, v357 = v0.readFixed32(v350, v352);
            v355 = v356;
            v352 = v357;
        elseif v354 == v0.wireTypes.i64 then
            v355 = nil;
            v356, v357 = v0.readFixed64(v350, v352);
            v355 = v356;
            v352 = v357;
        else
            error("Unsupported wire type: " .. v354);
        end;
    end;
    return v351;
end;
v4.jsonEncode = function(v358) --[[ Line: 4200 ]] --[[ Name: jsonEncode ]]
    local v359 = {};
    if v358.report ~= nil and v358.report ~= "" then
        v359.report = v358.report;
    end;
    if v358.remove ~= nil and v358.remove ~= "" then
        v359.remove = v358.remove;
    end;
    return v359;
end;
v4.jsonDecode = function(v360) --[[ Line: 4216 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_9 (copy)
    local v361 = l_v4_9.new();
    if v360.report ~= nil then
        v361.report = v360.report;
    end;
    if v360.remove ~= nil then
        v361.remove = v360.remove;
    end;
    return v361;
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
v4.new = function(_) --[[ Line: 4247 ]] --[[ Name: new ]]
    -- upvalues: l_v4_10 (copy)
    return (setmetatable({}, l_v4_10));
end;
v4.encode = function(_) --[[ Line: 4251 ]] --[[ Name: encode ]]
    local v365 = buffer.create(0);
    local v366 = buffer.create(0);
    buffer.copy(v366, 0, v365, 0, 0);
    return v366;
end;
v4.decode = function(v367) --[[ Line: 4260 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_10 (copy), v0 (copy)
    local v368 = l_v4_10.new();
    local v369 = 0;
    while v369 < buffer.len(v367) do
        local v370 = nil;
        local v371 = nil;
        local v372, v373, v374 = v0.readTag(v367, v369);
        v370 = v372;
        v371 = v373;
        v369 = v374;
        if v371 == v0.wireTypes.varint then
            v372 = nil;
            v373, v374 = v0.readVarInt(v367, v369);
            v372 = v373;
            v369 = v374;
        elseif v371 == v0.wireTypes.lengthDelimited then
            v372 = nil;
            v373, v374 = v0.readVarInt(v367, v369);
            v369 = v374 + v373;
        elseif v371 == v0.wireTypes.i32 then
            v372 = nil;
            v373, v374 = v0.readFixed32(v367, v369);
            v372 = v373;
            v369 = v374;
        elseif v371 == v0.wireTypes.i64 then
            v372 = nil;
            v373, v374 = v0.readFixed64(v367, v369);
            v372 = v373;
            v369 = v374;
        else
            error("Unsupported wire type: " .. v371);
        end;
    end;
    return v368;
end;
v4.jsonEncode = function(_) --[[ Line: 4298 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 4304 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v378) --[[ Line: 4324 ]] --[[ Name: new ]]
    -- upvalues: l_v4_11 (copy)
    return (setmetatable({
        universe_id = (not (v378 ~= nil) or v378.universe_id == nil) and "" or v378.universe_id, 
        creator_key = (not (v378 ~= nil) or v378.creator_key == nil) and "" or v378.creator_key, 
        entry_map = if not (v378 ~= nil) or v378.entry_map == nil then {} else v378.entry_map, 
        entry_order = if not (v378 ~= nil) or v378.entry_order == nil then {} else v378.entry_order
    }, l_v4_11));
end;
v4.encode = function(v379) --[[ Line: 4335 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v380 = buffer.create(0);
    local v381 = 0;
    if v379.universe_id ~= nil and v379.universe_id ~= "" then
        local v382, v383 = v0.writeTag(v380, v381, 1, v0.wireTypes.lengthDelimited);
        v382, v383 = v0.writeString(v382, v383, v379.universe_id);
        v380 = v382;
        v381 = v383;
    end;
    if v379.creator_key ~= nil and v379.creator_key ~= "" then
        local v384, v385 = v0.writeTag(v380, v381, 2, v0.wireTypes.lengthDelimited);
        v384, v385 = v0.writeString(v384, v385, v379.creator_key);
        v380 = v384;
        v381 = v385;
    end;
    if v379.entry_map ~= nil and next(v379.entry_map) ~= nil then
        for v386, v387 in v379.entry_map do
            local v388 = buffer.create(0);
            local v389, v390 = v0.writeTag(v388, 0, 1, v0.wireTypes.lengthDelimited);
            v389, v390 = v0.writeString(v389, v390, v386);
            v388 = v389;
            local l_v390_0 = v390;
            v389 = v387:encode();
            local v392;
            v390, v392 = v0.writeTag(v388, l_v390_0, 2, v0.wireTypes.lengthDelimited);
            v390, v392 = v0.writeBuffer(v390, v392, v389, buffer.len(v389));
            v388 = v390;
            l_v390_0 = v392;
            v390, v392 = v0.writeTag(v380, v381, 3, v0.wireTypes.lengthDelimited);
            v390, v392 = v0.writeBuffer(v390, v392, v388, l_v390_0);
            v380 = v390;
            v381 = v392;
        end;
    end;
    if v379.entry_order ~= nil and #v379.entry_order > 0 then
        for _, v394 in v379.entry_order do
            local v395, v396 = v0.writeTag(v380, v381, 4, v0.wireTypes.lengthDelimited);
            v395, v396 = v0.writeString(v395, v396, v394);
            v380 = v395;
            v381 = v396;
        end;
    end;
    local v397 = buffer.create(v381);
    buffer.copy(v397, 0, v380, 0, v381);
    return v397;
end;
v4.decode = function(v398) --[[ Line: 4375 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_11 (copy), v0 (copy), v2 (copy)
    local v399 = l_v4_11.new();
    local v400 = 0;
    while v400 < buffer.len(v398) do
        local v401 = nil;
        local v402 = nil;
        local v403, v404, v405 = v0.readTag(v398, v400);
        v401 = v403;
        v402 = v404;
        v400 = v405;
        if v402 == v0.wireTypes.varint then
            v403 = nil;
            v404, v405 = v0.readVarInt(v398, v400);
            v403 = v404;
            v400 = v405;
        elseif v402 == v0.wireTypes.lengthDelimited then
            if v401 == 1 then
                v403 = nil;
                v404, v405 = v0.readBuffer(v398, v400);
                v403 = v404;
                v400 = v405;
                v399.universe_id = buffer.tostring(v403);
            elseif v401 == 2 then
                v403 = nil;
                v404, v405 = v0.readBuffer(v398, v400);
                v403 = v404;
                v400 = v405;
                v399.creator_key = buffer.tostring(v403);
            elseif v401 == 3 then
                v403 = nil;
                v404, v405 = v0.readBuffer(v398, v400);
                v403 = v404;
                v400 = v405;
                v404 = v2.ExperienceDetailsFeedInputData_EntryMapEntry.decode(v403);
                v405 = v2.FeedEntry.new();
                v399.entry_map[v404.key or ""] = v404.value or v405;
            elseif v401 == 4 then
                v403 = nil;
                v404, v405 = v0.readBuffer(v398, v400);
                v403 = v404;
                v400 = v405;
                table.insert(v399.entry_order, buffer.tostring(v403));
            else
                v403 = nil;
                v404, v405 = v0.readVarInt(v398, v400);
                v400 = v405 + v404;
            end;
        elseif v402 == v0.wireTypes.i32 then
            v403 = nil;
            v404, v405 = v0.readFixed32(v398, v400);
            v403 = v404;
            v400 = v405;
        elseif v402 == v0.wireTypes.i64 then
            v403 = nil;
            v404, v405 = v0.readFixed64(v398, v400);
            v403 = v404;
            v400 = v405;
        else
            error("Unsupported wire type: " .. v402);
        end;
    end;
    return v399;
end;
v4.jsonEncode = function(v406) --[[ Line: 4440 ]] --[[ Name: jsonEncode ]]
    local v407 = {};
    if v406.universe_id ~= nil and v406.universe_id ~= "" then
        v407.universeId = v406.universe_id;
    end;
    if v406.creator_key ~= nil and v406.creator_key ~= "" then
        v407.creatorKey = v406.creator_key;
    end;
    if v406.entry_map ~= nil and next(v406.entry_map) ~= nil then
        local v408 = {};
        for v409, v410 in v406.entry_map do
            v408[v409] = v410:jsonEncode();
        end;
        v407.entryMap = v408;
    end;
    if v406.entry_order ~= nil and #v406.entry_order > 0 then
        local v411 = {};
        for _, v413 in v406.entry_order do
            table.insert(v411, v413);
        end;
        v407.entryOrder = v411;
    end;
    return v407;
end;
v4.jsonDecode = function(v414) --[[ Line: 4470 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_11 (copy), v2 (copy)
    local v415 = l_v4_11.new();
    if v414.universe_id ~= nil then
        v415.universe_id = v414.universe_id;
    end;
    if v414.universeId ~= nil then
        v415.universe_id = v414.universeId;
    end;
    if v414.creator_key ~= nil then
        v415.creator_key = v414.creator_key;
    end;
    if v414.creatorKey ~= nil then
        v415.creator_key = v414.creatorKey;
    end;
    if v414.entry_map ~= nil then
        local v416 = {};
        for v417, v418 in v414.entry_map do
            v416[v417] = v2.FeedEntry.jsonDecode(v418);
        end;
        v415.entry_map = v416;
    end;
    if v414.entryMap ~= nil then
        local v419 = {};
        for v420, v421 in v414.entryMap do
            v419[v420] = v2.FeedEntry.jsonDecode(v421);
        end;
        v415.entry_map = v419;
    end;
    if v414.entry_order ~= nil then
        local v422 = {};
        for _, v424 in v414.entry_order do
            table.insert(v422, v424);
        end;
        v415.entry_order = v422;
    end;
    if v414.entryOrder ~= nil then
        local v425 = {};
        for _, v427 in v414.entryOrder do
            table.insert(v425, v427);
        end;
        v415.entry_order = v425;
    end;
    return v415;
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
v4.new = function(v429) --[[ Line: 4542 ]] --[[ Name: new ]]
    -- upvalues: l_v4_12 (copy)
    return (setmetatable({
        key = (not (v429 ~= nil) or v429.key == nil) and "" or v429.key, 
        value = if not (v429 ~= nil) or v429.value == nil then nil else v429.value
    }, l_v4_12));
end;
v4.encode = function(v430) --[[ Line: 4551 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v431 = buffer.create(0);
    local v432 = 0;
    if v430.key ~= nil and v430.key ~= "" then
        local v433, v434 = v0.writeTag(v431, v432, 1, v0.wireTypes.lengthDelimited);
        v433, v434 = v0.writeString(v433, v434, v430.key);
        v431 = v433;
        v432 = v434;
    end;
    if v430.value ~= nil then
        local v435 = v430.value:encode();
        local v436, v437 = v0.writeTag(v431, v432, 2, v0.wireTypes.lengthDelimited);
        v436, v437 = v0.writeBuffer(v436, v437, v435, buffer.len(v435));
        v431 = v436;
        v432 = v437;
    end;
    local v438 = buffer.create(v432);
    buffer.copy(v438, 0, v431, 0, v432);
    return v438;
end;
v4.decode = function(v439) --[[ Line: 4573 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_12 (copy), v0 (copy), v2 (copy)
    local v440 = l_v4_12.new();
    local v441 = 0;
    while v441 < buffer.len(v439) do
        local v442 = nil;
        local v443 = nil;
        local v444, v445, v446 = v0.readTag(v439, v441);
        v442 = v444;
        v443 = v445;
        v441 = v446;
        if v443 == v0.wireTypes.varint then
            v444 = nil;
            v445, v446 = v0.readVarInt(v439, v441);
            v444 = v445;
            v441 = v446;
        elseif v443 == v0.wireTypes.lengthDelimited then
            if v442 == 1 then
                v444 = nil;
                v445, v446 = v0.readBuffer(v439, v441);
                v444 = v445;
                v441 = v446;
                v440.key = buffer.tostring(v444);
            elseif v442 == 2 then
                v444 = nil;
                v445, v446 = v0.readBuffer(v439, v441);
                v444 = v445;
                v441 = v446;
                v440.value = v2.FeedEntry.decode(v444);
            else
                v444 = nil;
                v445, v446 = v0.readVarInt(v439, v441);
                v441 = v446 + v445;
            end;
        elseif v443 == v0.wireTypes.i32 then
            v444 = nil;
            v445, v446 = v0.readFixed32(v439, v441);
            v444 = v445;
            v441 = v446;
        elseif v443 == v0.wireTypes.i64 then
            v444 = nil;
            v445, v446 = v0.readFixed64(v439, v441);
            v444 = v445;
            v441 = v446;
        else
            error("Unsupported wire type: " .. v443);
        end;
    end;
    return v440;
end;
v4.jsonEncode = function(v447) --[[ Line: 4623 ]] --[[ Name: jsonEncode ]]
    local v448 = {};
    if v447.key ~= nil and v447.key ~= "" then
        v448.key = v447.key;
    end;
    if v447.value ~= nil then
        v448.value = v447.value:jsonEncode();
    end;
    return v448;
end;
v4.jsonDecode = function(v449) --[[ Line: 4639 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_12 (copy), v2 (copy)
    local v450 = l_v4_12.new();
    if v449.key ~= nil then
        v450.key = v449.key;
    end;
    if v449.value ~= nil then
        v450.value = v2.FeedEntry.jsonDecode(v449.value);
    end;
    return v450;
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
v4.new = function(v452) --[[ Line: 4669 ]] --[[ Name: new ]]
    -- upvalues: l_v4_13 (copy)
    return (setmetatable({
        universe_id = (not (v452 ~= nil) or v452.universe_id == nil) and "" or v452.universe_id
    }, l_v4_13));
end;
v4.encode = function(v453) --[[ Line: 4677 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v454 = buffer.create(0);
    local v455 = 0;
    if v453.universe_id ~= nil and v453.universe_id ~= "" then
        local v456, v457 = v0.writeTag(v454, v455, 1, v0.wireTypes.lengthDelimited);
        v456, v457 = v0.writeString(v456, v457, v453.universe_id);
        v454 = v456;
        v455 = v457;
    end;
    local v458 = buffer.create(v455);
    buffer.copy(v458, 0, v454, 0, v455);
    return v458;
end;
v4.decode = function(v459) --[[ Line: 4691 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_13 (copy), v0 (copy)
    local v460 = l_v4_13.new();
    local v461 = 0;
    while v461 < buffer.len(v459) do
        local v462 = nil;
        local v463 = nil;
        local v464, v465, v466 = v0.readTag(v459, v461);
        v462 = v464;
        v463 = v465;
        v461 = v466;
        if v463 == v0.wireTypes.varint then
            v464 = nil;
            v465, v466 = v0.readVarInt(v459, v461);
            v464 = v465;
            v461 = v466;
        elseif v463 == v0.wireTypes.lengthDelimited then
            if v462 == 1 then
                v464 = nil;
                v465, v466 = v0.readBuffer(v459, v461);
                v464 = v465;
                v461 = v466;
                v460.universe_id = buffer.tostring(v464);
            else
                v464 = nil;
                v465, v466 = v0.readVarInt(v459, v461);
                v461 = v466 + v465;
            end;
        elseif v463 == v0.wireTypes.i32 then
            v464 = nil;
            v465, v466 = v0.readFixed32(v459, v461);
            v464 = v465;
            v461 = v466;
        elseif v463 == v0.wireTypes.i64 then
            v464 = nil;
            v465, v466 = v0.readFixed64(v459, v461);
            v464 = v465;
            v461 = v466;
        else
            error("Unsupported wire type: " .. v463);
        end;
    end;
    return v460;
end;
v4.jsonEncode = function(v467) --[[ Line: 4734 ]] --[[ Name: jsonEncode ]]
    local v468 = {};
    if v467.universe_id ~= nil and v467.universe_id ~= "" then
        v468.universeId = v467.universe_id;
    end;
    return v468;
end;
v4.jsonDecode = function(v469) --[[ Line: 4744 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_13 (copy)
    local v470 = l_v4_13.new();
    if v469.universe_id ~= nil then
        v470.universe_id = v469.universe_id;
    end;
    if v469.universeId ~= nil then
        v470.universe_id = v469.universeId;
    end;
    return v470;
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
v4.new = function(v472) --[[ Line: 4774 ]] --[[ Name: new ]]
    -- upvalues: l_v4_14 (copy)
    return (setmetatable({
        universe_id = (not (v472 ~= nil) or v472.universe_id == nil) and "" or v472.universe_id, 
        creator_key = (not (v472 ~= nil) or v472.creator_key == nil) and "" or v472.creator_key
    }, l_v4_14));
end;
v4.encode = function(v473) --[[ Line: 4783 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v474 = buffer.create(0);
    local v475 = 0;
    if v473.universe_id ~= nil and v473.universe_id ~= "" then
        local v476, v477 = v0.writeTag(v474, v475, 1, v0.wireTypes.lengthDelimited);
        v476, v477 = v0.writeString(v476, v477, v473.universe_id);
        v474 = v476;
        v475 = v477;
    end;
    if v473.creator_key ~= nil and v473.creator_key ~= "" then
        local v478, v479 = v0.writeTag(v474, v475, 2, v0.wireTypes.lengthDelimited);
        v478, v479 = v0.writeString(v478, v479, v473.creator_key);
        v474 = v478;
        v475 = v479;
    end;
    local v480 = buffer.create(v475);
    buffer.copy(v480, 0, v474, 0, v475);
    return v480;
end;
v4.decode = function(v481) --[[ Line: 4802 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_14 (copy), v0 (copy)
    local v482 = l_v4_14.new();
    local v483 = 0;
    while v483 < buffer.len(v481) do
        local v484 = nil;
        local v485 = nil;
        local v486, v487, v488 = v0.readTag(v481, v483);
        v484 = v486;
        v485 = v487;
        v483 = v488;
        if v485 == v0.wireTypes.varint then
            v486 = nil;
            v487, v488 = v0.readVarInt(v481, v483);
            v486 = v487;
            v483 = v488;
        elseif v485 == v0.wireTypes.lengthDelimited then
            if v484 == 1 then
                v486 = nil;
                v487, v488 = v0.readBuffer(v481, v483);
                v486 = v487;
                v483 = v488;
                v482.universe_id = buffer.tostring(v486);
            elseif v484 == 2 then
                v486 = nil;
                v487, v488 = v0.readBuffer(v481, v483);
                v486 = v487;
                v483 = v488;
                v482.creator_key = buffer.tostring(v486);
            else
                v486 = nil;
                v487, v488 = v0.readVarInt(v481, v483);
                v483 = v488 + v487;
            end;
        elseif v485 == v0.wireTypes.i32 then
            v486 = nil;
            v487, v488 = v0.readFixed32(v481, v483);
            v486 = v487;
            v483 = v488;
        elseif v485 == v0.wireTypes.i64 then
            v486 = nil;
            v487, v488 = v0.readFixed64(v481, v483);
            v486 = v487;
            v483 = v488;
        else
            error("Unsupported wire type: " .. v485);
        end;
    end;
    return v482;
end;
v4.jsonEncode = function(v489) --[[ Line: 4850 ]] --[[ Name: jsonEncode ]]
    local v490 = {};
    if v489.universe_id ~= nil and v489.universe_id ~= "" then
        v490.universeId = v489.universe_id;
    end;
    if v489.creator_key ~= nil and v489.creator_key ~= "" then
        v490.creatorKey = v489.creator_key;
    end;
    return v490;
end;
v4.jsonDecode = function(v491) --[[ Line: 4864 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_14 (copy)
    local v492 = l_v4_14.new();
    if v491.universe_id ~= nil then
        v492.universe_id = v491.universe_id;
    end;
    if v491.universeId ~= nil then
        v492.universe_id = v491.universeId;
    end;
    if v491.creator_key ~= nil then
        v492.creator_key = v491.creator_key;
    end;
    if v491.creatorKey ~= nil then
        v492.creator_key = v491.creatorKey;
    end;
    return v492;
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
v4.new = function(v494) --[[ Line: 4902 ]] --[[ Name: new ]]
    -- upvalues: l_v4_15 (copy)
    return (setmetatable({
        universe_id = (not (v494 ~= nil) or v494.universe_id == nil) and "" or v494.universe_id
    }, l_v4_15));
end;
v4.encode = function(v495) --[[ Line: 4910 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v496 = buffer.create(0);
    local v497 = 0;
    if v495.universe_id ~= nil and v495.universe_id ~= "" then
        local v498, v499 = v0.writeTag(v496, v497, 1, v0.wireTypes.lengthDelimited);
        v498, v499 = v0.writeString(v498, v499, v495.universe_id);
        v496 = v498;
        v497 = v499;
    end;
    local v500 = buffer.create(v497);
    buffer.copy(v500, 0, v496, 0, v497);
    return v500;
end;
v4.decode = function(v501) --[[ Line: 4924 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_15 (copy), v0 (copy)
    local v502 = l_v4_15.new();
    local v503 = 0;
    while v503 < buffer.len(v501) do
        local v504 = nil;
        local v505 = nil;
        local v506, v507, v508 = v0.readTag(v501, v503);
        v504 = v506;
        v505 = v507;
        v503 = v508;
        if v505 == v0.wireTypes.varint then
            v506 = nil;
            v507, v508 = v0.readVarInt(v501, v503);
            v506 = v507;
            v503 = v508;
        elseif v505 == v0.wireTypes.lengthDelimited then
            if v504 == 1 then
                v506 = nil;
                v507, v508 = v0.readBuffer(v501, v503);
                v506 = v507;
                v503 = v508;
                v502.universe_id = buffer.tostring(v506);
            else
                v506 = nil;
                v507, v508 = v0.readVarInt(v501, v503);
                v503 = v508 + v507;
            end;
        elseif v505 == v0.wireTypes.i32 then
            v506 = nil;
            v507, v508 = v0.readFixed32(v501, v503);
            v506 = v507;
            v503 = v508;
        elseif v505 == v0.wireTypes.i64 then
            v506 = nil;
            v507, v508 = v0.readFixed64(v501, v503);
            v506 = v507;
            v503 = v508;
        else
            error("Unsupported wire type: " .. v505);
        end;
    end;
    return v502;
end;
v4.jsonEncode = function(v509) --[[ Line: 4967 ]] --[[ Name: jsonEncode ]]
    local v510 = {};
    if v509.universe_id ~= nil and v509.universe_id ~= "" then
        v510.universeId = v509.universe_id;
    end;
    return v510;
end;
v4.jsonDecode = function(v511) --[[ Line: 4977 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_15 (copy)
    local v512 = l_v4_15.new();
    if v511.universe_id ~= nil then
        v512.universe_id = v511.universe_id;
    end;
    if v511.universeId ~= nil then
        v512.universe_id = v511.universeId;
    end;
    return v512;
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
v4.new = function(v514) --[[ Line: 5005 ]] --[[ Name: new ]]
    -- upvalues: l_v4_16 (copy)
    return (setmetatable({
        media_items = if not (v514 ~= nil) or v514.media_items == nil then {} else v514.media_items
    }, l_v4_16));
end;
v4.encode = function(v515) --[[ Line: 5013 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v516 = buffer.create(0);
    local v517 = 0;
    if v515.media_items ~= nil and #v515.media_items > 0 then
        for _, v519 in v515.media_items do
            local v520 = v519:encode();
            local v521, v522 = v0.writeTag(v516, v517, 1, v0.wireTypes.lengthDelimited);
            v521, v522 = v0.writeBuffer(v521, v522, v520, buffer.len(v520));
            v516 = v521;
            v517 = v522;
        end;
    end;
    local v523 = buffer.create(v517);
    buffer.copy(v523, 0, v516, 0, v517);
    return v523;
end;
v4.decode = function(v524) --[[ Line: 5030 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_16 (copy), v0 (copy), v2 (copy)
    local v525 = l_v4_16.new();
    local v526 = 0;
    while v526 < buffer.len(v524) do
        local v527 = nil;
        local v528 = nil;
        local v529, v530, v531 = v0.readTag(v524, v526);
        v527 = v529;
        v528 = v530;
        v526 = v531;
        if v528 == v0.wireTypes.varint then
            v529 = nil;
            v530, v531 = v0.readVarInt(v524, v526);
            v529 = v530;
            v526 = v531;
        elseif v528 == v0.wireTypes.lengthDelimited then
            if v527 == 1 then
                v529 = nil;
                v530, v531 = v0.readBuffer(v524, v526);
                v529 = v530;
                v526 = v531;
                table.insert(v525.media_items, v2.ExperienceMediaGalleryInputData_MediaItem.decode(v529));
            else
                v529 = nil;
                v530, v531 = v0.readVarInt(v524, v526);
                v526 = v531 + v530;
            end;
        elseif v528 == v0.wireTypes.i32 then
            v529 = nil;
            v530, v531 = v0.readFixed32(v524, v526);
            v529 = v530;
            v526 = v531;
        elseif v528 == v0.wireTypes.i64 then
            v529 = nil;
            v530, v531 = v0.readFixed64(v524, v526);
            v529 = v530;
            v526 = v531;
        else
            error("Unsupported wire type: " .. v528);
        end;
    end;
    return v525;
end;
v4.jsonEncode = function(v532) --[[ Line: 5073 ]] --[[ Name: jsonEncode ]]
    local v533 = {};
    if v532.media_items ~= nil and #v532.media_items > 0 then
        local v534 = {};
        for _, v536 in v532.media_items do
            table.insert(v534, v536:jsonEncode());
        end;
        v533.mediaItems = v534;
    end;
    return v533;
end;
v4.jsonDecode = function(v537) --[[ Line: 5087 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_16 (copy), v2 (copy)
    local v538 = l_v4_16.new();
    if v537.media_items ~= nil then
        local v539 = {};
        for _, v541 in v537.media_items do
            table.insert(v539, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v541));
        end;
        v538.media_items = v539;
    end;
    if v537.mediaItems ~= nil then
        local v542 = {};
        for _, v544 in v537.mediaItems do
            table.insert(v542, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v544));
        end;
        v538.media_items = v542;
    end;
    return v538;
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
v4.new = function(v546) --[[ Line: 5125 ]] --[[ Name: new ]]
    -- upvalues: l_v4_17 (copy)
    return (setmetatable({
        media_asset_id = (not (v546 ~= nil) or v546.media_asset_id == nil) and "" or v546.media_asset_id
    }, l_v4_17));
end;
v4.encode = function(v547) --[[ Line: 5133 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v548 = buffer.create(0);
    local v549 = 0;
    if v547.media_asset_id ~= nil and v547.media_asset_id ~= "" then
        local v550, v551 = v0.writeTag(v548, v549, 1, v0.wireTypes.lengthDelimited);
        v550, v551 = v0.writeString(v550, v551, v547.media_asset_id);
        v548 = v550;
        v549 = v551;
    end;
    local v552 = buffer.create(v549);
    buffer.copy(v552, 0, v548, 0, v549);
    return v552;
end;
v4.decode = function(v553) --[[ Line: 5149 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_17 (copy), v0 (copy)
    local v554 = l_v4_17.new();
    local v555 = 0;
    while v555 < buffer.len(v553) do
        local v556 = nil;
        local v557 = nil;
        local v558, v559, v560 = v0.readTag(v553, v555);
        v556 = v558;
        v557 = v559;
        v555 = v560;
        if v557 == v0.wireTypes.varint then
            v558 = nil;
            v559, v560 = v0.readVarInt(v553, v555);
            v558 = v559;
            v555 = v560;
        elseif v557 == v0.wireTypes.lengthDelimited then
            if v556 == 1 then
                v558 = nil;
                v559, v560 = v0.readBuffer(v553, v555);
                v558 = v559;
                v555 = v560;
                v554.media_asset_id = buffer.tostring(v558);
            else
                v558 = nil;
                v559, v560 = v0.readVarInt(v553, v555);
                v555 = v560 + v559;
            end;
        elseif v557 == v0.wireTypes.i32 then
            v558 = nil;
            v559, v560 = v0.readFixed32(v553, v555);
            v558 = v559;
            v555 = v560;
        elseif v557 == v0.wireTypes.i64 then
            v558 = nil;
            v559, v560 = v0.readFixed64(v553, v555);
            v558 = v559;
            v555 = v560;
        else
            error("Unsupported wire type: " .. v557);
        end;
    end;
    return v554;
end;
v4.jsonEncode = function(v561) --[[ Line: 5194 ]] --[[ Name: jsonEncode ]]
    local v562 = {};
    if v561.media_asset_id ~= nil and v561.media_asset_id ~= "" then
        v562.mediaAssetId = v561.media_asset_id;
    end;
    return v562;
end;
v4.jsonDecode = function(v563) --[[ Line: 5206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_17 (copy)
    local v564 = l_v4_17.new();
    if v563.media_asset_id ~= nil then
        v564.media_asset_id = v563.media_asset_id;
    end;
    if v563.mediaAssetId ~= nil then
        v564.media_asset_id = v563.mediaAssetId;
    end;
    return v564;
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
v4.new = function(v566) --[[ Line: 5236 ]] --[[ Name: new ]]
    -- upvalues: l_v4_18 (copy)
    return (setmetatable({
        universe_id = (not (v566 ~= nil) or v566.universe_id == nil) and "" or v566.universe_id
    }, l_v4_18));
end;
v4.encode = function(v567) --[[ Line: 5244 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v568 = buffer.create(0);
    local v569 = 0;
    if v567.universe_id ~= nil and v567.universe_id ~= "" then
        local v570, v571 = v0.writeTag(v568, v569, 1, v0.wireTypes.lengthDelimited);
        v570, v571 = v0.writeString(v570, v571, v567.universe_id);
        v568 = v570;
        v569 = v571;
    end;
    local v572 = buffer.create(v569);
    buffer.copy(v572, 0, v568, 0, v569);
    return v572;
end;
v4.decode = function(v573) --[[ Line: 5258 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_18 (copy), v0 (copy)
    local v574 = l_v4_18.new();
    local v575 = 0;
    while v575 < buffer.len(v573) do
        local v576 = nil;
        local v577 = nil;
        local v578, v579, v580 = v0.readTag(v573, v575);
        v576 = v578;
        v577 = v579;
        v575 = v580;
        if v577 == v0.wireTypes.varint then
            v578 = nil;
            v579, v580 = v0.readVarInt(v573, v575);
            v578 = v579;
            v575 = v580;
        elseif v577 == v0.wireTypes.lengthDelimited then
            if v576 == 1 then
                v578 = nil;
                v579, v580 = v0.readBuffer(v573, v575);
                v578 = v579;
                v575 = v580;
                v574.universe_id = buffer.tostring(v578);
            else
                v578 = nil;
                v579, v580 = v0.readVarInt(v573, v575);
                v575 = v580 + v579;
            end;
        elseif v577 == v0.wireTypes.i32 then
            v578 = nil;
            v579, v580 = v0.readFixed32(v573, v575);
            v578 = v579;
            v575 = v580;
        elseif v577 == v0.wireTypes.i64 then
            v578 = nil;
            v579, v580 = v0.readFixed64(v573, v575);
            v578 = v579;
            v575 = v580;
        else
            error("Unsupported wire type: " .. v577);
        end;
    end;
    return v574;
end;
v4.jsonEncode = function(v581) --[[ Line: 5301 ]] --[[ Name: jsonEncode ]]
    local v582 = {};
    if v581.universe_id ~= nil and v581.universe_id ~= "" then
        v582.universeId = v581.universe_id;
    end;
    return v582;
end;
v4.jsonDecode = function(v583) --[[ Line: 5311 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_18 (copy)
    local v584 = l_v4_18.new();
    if v583.universe_id ~= nil then
        v584.universe_id = v583.universe_id;
    end;
    if v583.universeId ~= nil then
        v584.universe_id = v583.universeId;
    end;
    return v584;
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
v4.new = function(v586) --[[ Line: 5339 ]] --[[ Name: new ]]
    -- upvalues: l_v4_19 (copy)
    return (setmetatable({
        universe_id = (not (v586 ~= nil) or v586.universe_id == nil) and "" or v586.universe_id
    }, l_v4_19));
end;
v4.encode = function(v587) --[[ Line: 5347 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v588 = buffer.create(0);
    local v589 = 0;
    if v587.universe_id ~= nil and v587.universe_id ~= "" then
        local v590, v591 = v0.writeTag(v588, v589, 1, v0.wireTypes.lengthDelimited);
        v590, v591 = v0.writeString(v590, v591, v587.universe_id);
        v588 = v590;
        v589 = v591;
    end;
    local v592 = buffer.create(v589);
    buffer.copy(v592, 0, v588, 0, v589);
    return v592;
end;
v4.decode = function(v593) --[[ Line: 5361 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_19 (copy), v0 (copy)
    local v594 = l_v4_19.new();
    local v595 = 0;
    while v595 < buffer.len(v593) do
        local v596 = nil;
        local v597 = nil;
        local v598, v599, v600 = v0.readTag(v593, v595);
        v596 = v598;
        v597 = v599;
        v595 = v600;
        if v597 == v0.wireTypes.varint then
            v598 = nil;
            v599, v600 = v0.readVarInt(v593, v595);
            v598 = v599;
            v595 = v600;
        elseif v597 == v0.wireTypes.lengthDelimited then
            if v596 == 1 then
                v598 = nil;
                v599, v600 = v0.readBuffer(v593, v595);
                v598 = v599;
                v595 = v600;
                v594.universe_id = buffer.tostring(v598);
            else
                v598 = nil;
                v599, v600 = v0.readVarInt(v593, v595);
                v595 = v600 + v599;
            end;
        elseif v597 == v0.wireTypes.i32 then
            v598 = nil;
            v599, v600 = v0.readFixed32(v593, v595);
            v598 = v599;
            v595 = v600;
        elseif v597 == v0.wireTypes.i64 then
            v598 = nil;
            v599, v600 = v0.readFixed64(v593, v595);
            v598 = v599;
            v595 = v600;
        else
            error("Unsupported wire type: " .. v597);
        end;
    end;
    return v594;
end;
v4.jsonEncode = function(v601) --[[ Line: 5404 ]] --[[ Name: jsonEncode ]]
    local v602 = {};
    if v601.universe_id ~= nil and v601.universe_id ~= "" then
        v602.universeId = v601.universe_id;
    end;
    return v602;
end;
v4.jsonDecode = function(v603) --[[ Line: 5414 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_19 (copy)
    local v604 = l_v4_19.new();
    if v603.universe_id ~= nil then
        v604.universe_id = v603.universe_id;
    end;
    if v603.universeId ~= nil then
        v604.universe_id = v603.universeId;
    end;
    return v604;
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
v4.new = function(v606) --[[ Line: 5442 ]] --[[ Name: new ]]
    -- upvalues: l_v4_20 (copy)
    return (setmetatable({
        universe_id = (not (v606 ~= nil) or v606.universe_id == nil) and "" or v606.universe_id
    }, l_v4_20));
end;
v4.encode = function(v607) --[[ Line: 5450 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v608 = buffer.create(0);
    local v609 = 0;
    if v607.universe_id ~= nil and v607.universe_id ~= "" then
        local v610, v611 = v0.writeTag(v608, v609, 1, v0.wireTypes.lengthDelimited);
        v610, v611 = v0.writeString(v610, v611, v607.universe_id);
        v608 = v610;
        v609 = v611;
    end;
    local v612 = buffer.create(v609);
    buffer.copy(v612, 0, v608, 0, v609);
    return v612;
end;
v4.decode = function(v613) --[[ Line: 5464 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_20 (copy), v0 (copy)
    local v614 = l_v4_20.new();
    local v615 = 0;
    while v615 < buffer.len(v613) do
        local v616 = nil;
        local v617 = nil;
        local v618, v619, v620 = v0.readTag(v613, v615);
        v616 = v618;
        v617 = v619;
        v615 = v620;
        if v617 == v0.wireTypes.varint then
            v618 = nil;
            v619, v620 = v0.readVarInt(v613, v615);
            v618 = v619;
            v615 = v620;
        elseif v617 == v0.wireTypes.lengthDelimited then
            if v616 == 1 then
                v618 = nil;
                v619, v620 = v0.readBuffer(v613, v615);
                v618 = v619;
                v615 = v620;
                v614.universe_id = buffer.tostring(v618);
            else
                v618 = nil;
                v619, v620 = v0.readVarInt(v613, v615);
                v615 = v620 + v619;
            end;
        elseif v617 == v0.wireTypes.i32 then
            v618 = nil;
            v619, v620 = v0.readFixed32(v613, v615);
            v618 = v619;
            v615 = v620;
        elseif v617 == v0.wireTypes.i64 then
            v618 = nil;
            v619, v620 = v0.readFixed64(v613, v615);
            v618 = v619;
            v615 = v620;
        else
            error("Unsupported wire type: " .. v617);
        end;
    end;
    return v614;
end;
v4.jsonEncode = function(v621) --[[ Line: 5507 ]] --[[ Name: jsonEncode ]]
    local v622 = {};
    if v621.universe_id ~= nil and v621.universe_id ~= "" then
        v622.universeId = v621.universe_id;
    end;
    return v622;
end;
v4.jsonDecode = function(v623) --[[ Line: 5517 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_20 (copy)
    local v624 = l_v4_20.new();
    if v623.universe_id ~= nil then
        v624.universe_id = v623.universe_id;
    end;
    if v623.universeId ~= nil then
        v624.universe_id = v623.universeId;
    end;
    return v624;
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
v4.new = function(v626) --[[ Line: 5545 ]] --[[ Name: new ]]
    -- upvalues: l_v4_21 (copy)
    return (setmetatable({
        universe_id = (not (v626 ~= nil) or v626.universe_id == nil) and "" or v626.universe_id
    }, l_v4_21));
end;
v4.encode = function(v627) --[[ Line: 5553 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v628 = buffer.create(0);
    local v629 = 0;
    if v627.universe_id ~= nil and v627.universe_id ~= "" then
        local v630, v631 = v0.writeTag(v628, v629, 1, v0.wireTypes.lengthDelimited);
        v630, v631 = v0.writeString(v630, v631, v627.universe_id);
        v628 = v630;
        v629 = v631;
    end;
    local v632 = buffer.create(v629);
    buffer.copy(v632, 0, v628, 0, v629);
    return v632;
end;
v4.decode = function(v633) --[[ Line: 5567 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_21 (copy), v0 (copy)
    local v634 = l_v4_21.new();
    local v635 = 0;
    while v635 < buffer.len(v633) do
        local v636 = nil;
        local v637 = nil;
        local v638, v639, v640 = v0.readTag(v633, v635);
        v636 = v638;
        v637 = v639;
        v635 = v640;
        if v637 == v0.wireTypes.varint then
            v638 = nil;
            v639, v640 = v0.readVarInt(v633, v635);
            v638 = v639;
            v635 = v640;
        elseif v637 == v0.wireTypes.lengthDelimited then
            if v636 == 1 then
                v638 = nil;
                v639, v640 = v0.readBuffer(v633, v635);
                v638 = v639;
                v635 = v640;
                v634.universe_id = buffer.tostring(v638);
            else
                v638 = nil;
                v639, v640 = v0.readVarInt(v633, v635);
                v635 = v640 + v639;
            end;
        elseif v637 == v0.wireTypes.i32 then
            v638 = nil;
            v639, v640 = v0.readFixed32(v633, v635);
            v638 = v639;
            v635 = v640;
        elseif v637 == v0.wireTypes.i64 then
            v638 = nil;
            v639, v640 = v0.readFixed64(v633, v635);
            v638 = v639;
            v635 = v640;
        else
            error("Unsupported wire type: " .. v637);
        end;
    end;
    return v634;
end;
v4.jsonEncode = function(v641) --[[ Line: 5610 ]] --[[ Name: jsonEncode ]]
    local v642 = {};
    if v641.universe_id ~= nil and v641.universe_id ~= "" then
        v642.universeId = v641.universe_id;
    end;
    return v642;
end;
v4.jsonDecode = function(v643) --[[ Line: 5620 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_21 (copy)
    local v644 = l_v4_21.new();
    if v643.universe_id ~= nil then
        v644.universe_id = v643.universe_id;
    end;
    if v643.universeId ~= nil then
        v644.universe_id = v643.universeId;
    end;
    return v644;
end;
v4.descriptor = {
    name = "ExperienceContentRatingLabelInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
};
v2.ExperienceContentRatingLabelInputData = v4;
v1.default:register(v2.ExperienceContentRatingLabelInputData);
v4 = {};
v4.__index = v4;
local l_v4_22 = v4 --[[ copy: 4 -> 27 ]];
v4.new = function(v646) --[[ Line: 5650 ]] --[[ Name: new ]]
    -- upvalues: l_v4_22 (copy)
    return (setmetatable({
        social_link_items = if not (v646 ~= nil) or v646.social_link_items == nil then {} else v646.social_link_items
    }, l_v4_22));
end;
v4.encode = function(v647) --[[ Line: 5656 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v648 = buffer.create(0);
    local v649 = 0;
    if v647.social_link_items ~= nil and #v647.social_link_items > 0 then
        for _, v651 in v647.social_link_items do
            local v652 = v651:encode();
            local v653, v654 = v0.writeTag(v648, v649, 1, v0.wireTypes.lengthDelimited);
            v653, v654 = v0.writeBuffer(v653, v654, v652, buffer.len(v652));
            v648 = v653;
            v649 = v654;
        end;
    end;
    local v655 = buffer.create(v649);
    buffer.copy(v655, 0, v648, 0, v649);
    return v655;
end;
v4.decode = function(v656) --[[ Line: 5673 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_22 (copy), v0 (copy), v2 (copy)
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
                table.insert(v657.social_link_items, v2.SocialLinkRowInputData_SocialLinkItem.decode(v661));
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
v4.jsonEncode = function(v664) --[[ Line: 5716 ]] --[[ Name: jsonEncode ]]
    local v665 = {};
    if v664.social_link_items ~= nil and #v664.social_link_items > 0 then
        local v666 = {};
        for _, v668 in v664.social_link_items do
            table.insert(v666, v668:jsonEncode());
        end;
        v665.socialLinkItems = v666;
    end;
    return v665;
end;
v4.jsonDecode = function(v669) --[[ Line: 5730 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_22 (copy), v2 (copy)
    local v670 = l_v4_22.new();
    if v669.social_link_items ~= nil then
        local v671 = {};
        for _, v673 in v669.social_link_items do
            table.insert(v671, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v673));
        end;
        v670.social_link_items = v671;
    end;
    if v669.socialLinkItems ~= nil then
        local v674 = {};
        for _, v676 in v669.socialLinkItems do
            table.insert(v674, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v676));
        end;
        v670.social_link_items = v674;
    end;
    return v670;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
};
v2.SocialLinkRowInputData = v4;
v1.default:register(v2.SocialLinkRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_23 = v4 --[[ copy: 4 -> 28 ]];
v4.new = function(v678) --[[ Line: 5768 ]] --[[ Name: new ]]
    -- upvalues: l_v4_23 (copy)
    return (setmetatable({
        social_link_id = (not (v678 ~= nil) or v678.social_link_id == nil) and "" or v678.social_link_id
    }, l_v4_23));
end;
v4.encode = function(v679) --[[ Line: 5776 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v680 = buffer.create(0);
    local v681 = 0;
    if v679.social_link_id ~= nil and v679.social_link_id ~= "" then
        local v682, v683 = v0.writeTag(v680, v681, 1, v0.wireTypes.lengthDelimited);
        v682, v683 = v0.writeString(v682, v683, v679.social_link_id);
        v680 = v682;
        v681 = v683;
    end;
    local v684 = buffer.create(v681);
    buffer.copy(v684, 0, v680, 0, v681);
    return v684;
end;
v4.decode = function(v685) --[[ Line: 5790 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_23 (copy), v0 (copy)
    local v686 = l_v4_23.new();
    local v687 = 0;
    while v687 < buffer.len(v685) do
        local v688 = nil;
        local v689 = nil;
        local v690, v691, v692 = v0.readTag(v685, v687);
        v688 = v690;
        v689 = v691;
        v687 = v692;
        if v689 == v0.wireTypes.varint then
            v690 = nil;
            v691, v692 = v0.readVarInt(v685, v687);
            v690 = v691;
            v687 = v692;
        elseif v689 == v0.wireTypes.lengthDelimited then
            if v688 == 1 then
                v690 = nil;
                v691, v692 = v0.readBuffer(v685, v687);
                v690 = v691;
                v687 = v692;
                v686.social_link_id = buffer.tostring(v690);
            else
                v690 = nil;
                v691, v692 = v0.readVarInt(v685, v687);
                v687 = v692 + v691;
            end;
        elseif v689 == v0.wireTypes.i32 then
            v690 = nil;
            v691, v692 = v0.readFixed32(v685, v687);
            v690 = v691;
            v687 = v692;
        elseif v689 == v0.wireTypes.i64 then
            v690 = nil;
            v691, v692 = v0.readFixed64(v685, v687);
            v690 = v691;
            v687 = v692;
        else
            error("Unsupported wire type: " .. v689);
        end;
    end;
    return v686;
end;
v4.jsonEncode = function(v693) --[[ Line: 5833 ]] --[[ Name: jsonEncode ]]
    local v694 = {};
    if v693.social_link_id ~= nil and v693.social_link_id ~= "" then
        v694.socialLinkId = v693.social_link_id;
    end;
    return v694;
end;
v4.jsonDecode = function(v695) --[[ Line: 5843 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_23 (copy)
    local v696 = l_v4_23.new();
    if v695.social_link_id ~= nil then
        v696.social_link_id = v695.social_link_id;
    end;
    if v695.socialLinkId ~= nil then
        v696.social_link_id = v695.socialLinkId;
    end;
    return v696;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData_SocialLinkItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
};
v2.SocialLinkRowInputData_SocialLinkItem = v4;
v1.default:register(v2.SocialLinkRowInputData_SocialLinkItem);
v4 = {};
v4.__index = v4;
local l_v4_24 = v4 --[[ copy: 4 -> 29 ]];
v4.new = function(v698) --[[ Line: 5873 ]] --[[ Name: new ]]
    -- upvalues: l_v4_24 (copy)
    return (setmetatable({
        title = (not (v698 ~= nil) or v698.title == nil) and "" or v698.title, 
        universe_items = if not (v698 ~= nil) or v698.universe_items == nil then {} else v698.universe_items, 
        next_page_token = (not (v698 ~= nil) or v698.next_page_token == nil) and "" or v698.next_page_token, 
        sort_id = (not (v698 ~= nil) or v698.sort_id == nil) and "" or v698.sort_id, 
        secondary_sort_id = (not (v698 ~= nil) or v698.secondary_sort_id == nil) and 0 or v698.secondary_sort_id
    }, l_v4_24));
end;
v4.encode = function(v699) --[[ Line: 5885 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v700 = buffer.create(0);
    local v701 = 0;
    if v699.title ~= nil and v699.title ~= "" then
        local v702, v703 = v0.writeTag(v700, v701, 1, v0.wireTypes.lengthDelimited);
        v702, v703 = v0.writeString(v702, v703, v699.title);
        v700 = v702;
        v701 = v703;
    end;
    if v699.universe_items ~= nil and #v699.universe_items > 0 then
        for _, v705 in v699.universe_items do
            local v706 = v705:encode();
            local v707, v708 = v0.writeTag(v700, v701, 2, v0.wireTypes.lengthDelimited);
            v707, v708 = v0.writeBuffer(v707, v708, v706, buffer.len(v706));
            v700 = v707;
            v701 = v708;
        end;
    end;
    if v699.next_page_token ~= nil and v699.next_page_token ~= "" then
        local v709, v710 = v0.writeTag(v700, v701, 3, v0.wireTypes.lengthDelimited);
        v709, v710 = v0.writeString(v709, v710, v699.next_page_token);
        v700 = v709;
        v701 = v710;
    end;
    if v699.sort_id ~= nil and v699.sort_id ~= "" then
        local v711, v712 = v0.writeTag(v700, v701, 4, v0.wireTypes.lengthDelimited);
        v711, v712 = v0.writeString(v711, v712, v699.sort_id);
        v700 = v711;
        v701 = v712;
    end;
    if v699.secondary_sort_id ~= nil and v699.secondary_sort_id ~= 0 then
        local v713, v714 = v0.writeTag(v700, v701, 5, v0.wireTypes.varint);
        v713, v714 = v0.writeVarInt(v713, v714, v699.secondary_sort_id);
        v700 = v713;
        v701 = v714;
    end;
    local v715 = buffer.create(v701);
    buffer.copy(v715, 0, v700, 0, v701);
    return v715;
end;
v4.decode = function(v716) --[[ Line: 5922 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_24 (copy), v0 (copy), v2 (copy)
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
            if v719 == 5 then
                v721 = nil;
                v722, v723 = v0.readVarIntI32(v716, v718);
                v721 = v722;
                v718 = v723;
                v717.secondary_sort_id = v721;
            else
                v721 = nil;
                v722, v723 = v0.readVarInt(v716, v718);
                v721 = v722;
                v718 = v723;
            end;
        elseif v720 == v0.wireTypes.lengthDelimited then
            if v719 == 1 then
                v721 = nil;
                v722, v723 = v0.readBuffer(v716, v718);
                v721 = v722;
                v718 = v723;
                v717.title = buffer.tostring(v721);
            elseif v719 == 2 then
                v721 = nil;
                v722, v723 = v0.readBuffer(v716, v718);
                v721 = v722;
                v718 = v723;
                table.insert(v717.universe_items, v2.ExperienceCarouselInputData_UniverseItem.decode(v721));
            elseif v719 == 3 then
                v721 = nil;
                v722, v723 = v0.readBuffer(v716, v718);
                v721 = v722;
                v718 = v723;
                v717.next_page_token = buffer.tostring(v721);
            elseif v719 == 4 then
                v721 = nil;
                v722, v723 = v0.readBuffer(v716, v718);
                v721 = v722;
                v718 = v723;
                v717.sort_id = buffer.tostring(v721);
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
v4.jsonEncode = function(v724) --[[ Line: 5985 ]] --[[ Name: jsonEncode ]]
    local v725 = {};
    if v724.title ~= nil and v724.title ~= "" then
        v725.title = v724.title;
    end;
    if v724.universe_items ~= nil and #v724.universe_items > 0 then
        local v726 = {};
        for _, v728 in v724.universe_items do
            table.insert(v726, v728:jsonEncode());
        end;
        v725.universeItems = v726;
    end;
    if v724.next_page_token ~= nil and v724.next_page_token ~= "" then
        v725.nextPageToken = v724.next_page_token;
    end;
    if v724.sort_id ~= nil and v724.sort_id ~= "" then
        v725.sortId = v724.sort_id;
    end;
    if v724.secondary_sort_id ~= nil and v724.secondary_sort_id ~= 0 then
        v725.secondarySortId = v724.secondary_sort_id;
    end;
    return v725;
end;
v4.jsonDecode = function(v729) --[[ Line: 6015 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_24 (copy), v2 (copy)
    local v730 = l_v4_24.new();
    if v729.title ~= nil then
        v730.title = v729.title;
    end;
    if v729.universe_items ~= nil then
        local v731 = {};
        for _, v733 in v729.universe_items do
            table.insert(v731, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v733));
        end;
        v730.universe_items = v731;
    end;
    if v729.universeItems ~= nil then
        local v734 = {};
        for _, v736 in v729.universeItems do
            table.insert(v734, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v736));
        end;
        v730.universe_items = v734;
    end;
    if v729.next_page_token ~= nil then
        v730.next_page_token = v729.next_page_token;
    end;
    if v729.nextPageToken ~= nil then
        v730.next_page_token = v729.nextPageToken;
    end;
    if v729.sort_id ~= nil then
        v730.sort_id = v729.sort_id;
    end;
    if v729.sortId ~= nil then
        v730.sort_id = v729.sortId;
    end;
    if v729.secondary_sort_id ~= nil then
        v730.secondary_sort_id = v729.secondary_sort_id;
    end;
    if v729.secondarySortId ~= nil then
        v730.secondary_sort_id = v729.secondarySortId;
    end;
    return v730;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
};
v2.ExperienceCarouselInputData = v4;
v1.default:register(v2.ExperienceCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_25 = v4 --[[ copy: 4 -> 30 ]];
v4.new = function(v738) --[[ Line: 6081 ]] --[[ Name: new ]]
    -- upvalues: l_v4_25 (copy)
    return (setmetatable({
        universe_id = (not (v738 ~= nil) or v738.universe_id == nil) and "" or v738.universe_id
    }, l_v4_25));
end;
v4.encode = function(v739) --[[ Line: 6089 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v740 = buffer.create(0);
    local v741 = 0;
    if v739.universe_id ~= nil and v739.universe_id ~= "" then
        local v742, v743 = v0.writeTag(v740, v741, 1, v0.wireTypes.lengthDelimited);
        v742, v743 = v0.writeString(v742, v743, v739.universe_id);
        v740 = v742;
        v741 = v743;
    end;
    local v744 = buffer.create(v741);
    buffer.copy(v744, 0, v740, 0, v741);
    return v744;
end;
v4.decode = function(v745) --[[ Line: 6105 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_25 (copy), v0 (copy)
    local v746 = l_v4_25.new();
    local v747 = 0;
    while v747 < buffer.len(v745) do
        local v748 = nil;
        local v749 = nil;
        local v750, v751, v752 = v0.readTag(v745, v747);
        v748 = v750;
        v749 = v751;
        v747 = v752;
        if v749 == v0.wireTypes.varint then
            v750 = nil;
            v751, v752 = v0.readVarInt(v745, v747);
            v750 = v751;
            v747 = v752;
        elseif v749 == v0.wireTypes.lengthDelimited then
            if v748 == 1 then
                v750 = nil;
                v751, v752 = v0.readBuffer(v745, v747);
                v750 = v751;
                v747 = v752;
                v746.universe_id = buffer.tostring(v750);
            else
                v750 = nil;
                v751, v752 = v0.readVarInt(v745, v747);
                v747 = v752 + v751;
            end;
        elseif v749 == v0.wireTypes.i32 then
            v750 = nil;
            v751, v752 = v0.readFixed32(v745, v747);
            v750 = v751;
            v747 = v752;
        elseif v749 == v0.wireTypes.i64 then
            v750 = nil;
            v751, v752 = v0.readFixed64(v745, v747);
            v750 = v751;
            v747 = v752;
        else
            error("Unsupported wire type: " .. v749);
        end;
    end;
    return v746;
end;
v4.jsonEncode = function(v753) --[[ Line: 6150 ]] --[[ Name: jsonEncode ]]
    local v754 = {};
    if v753.universe_id ~= nil and v753.universe_id ~= "" then
        v754.universeId = v753.universe_id;
    end;
    return v754;
end;
v4.jsonDecode = function(v755) --[[ Line: 6162 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_25 (copy)
    local v756 = l_v4_25.new();
    if v755.universe_id ~= nil then
        v756.universe_id = v755.universe_id;
    end;
    if v755.universeId ~= nil then
        v756.universe_id = v755.universeId;
    end;
    return v756;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData_UniverseItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
};
v2.ExperienceCarouselInputData_UniverseItem = v4;
v1.default:register(v2.ExperienceCarouselInputData_UniverseItem);
v4 = {};
v4.__index = v4;
local l_v4_26 = v4 --[[ copy: 4 -> 31 ]];
v4.new = function(v758) --[[ Line: 6192 ]] --[[ Name: new ]]
    -- upvalues: l_v4_26 (copy)
    return (setmetatable({
        title = (not (v758 ~= nil) or v758.title == nil) and "" or v758.title, 
        song_items = if not (v758 ~= nil) or v758.song_items == nil then {} else v758.song_items, 
        next_page_token = (not (v758 ~= nil) or v758.next_page_token == nil) and "" or v758.next_page_token, 
        sort_id = (not (v758 ~= nil) or v758.sort_id == nil) and "" or v758.sort_id, 
        secondary_sort_id = (not (v758 ~= nil) or v758.secondary_sort_id == nil) and 0 or v758.secondary_sort_id
    }, l_v4_26));
end;
v4.encode = function(v759) --[[ Line: 6202 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v760 = buffer.create(0);
    local v761 = 0;
    if v759.title ~= nil and v759.title ~= "" then
        local v762, v763 = v0.writeTag(v760, v761, 1, v0.wireTypes.lengthDelimited);
        v762, v763 = v0.writeString(v762, v763, v759.title);
        v760 = v762;
        v761 = v763;
    end;
    if v759.song_items ~= nil and #v759.song_items > 0 then
        for _, v765 in v759.song_items do
            local v766 = v765:encode();
            local v767, v768 = v0.writeTag(v760, v761, 2, v0.wireTypes.lengthDelimited);
            v767, v768 = v0.writeBuffer(v767, v768, v766, buffer.len(v766));
            v760 = v767;
            v761 = v768;
        end;
    end;
    if v759.next_page_token ~= nil and v759.next_page_token ~= "" then
        local v769, v770 = v0.writeTag(v760, v761, 3, v0.wireTypes.lengthDelimited);
        v769, v770 = v0.writeString(v769, v770, v759.next_page_token);
        v760 = v769;
        v761 = v770;
    end;
    if v759.sort_id ~= nil and v759.sort_id ~= "" then
        local v771, v772 = v0.writeTag(v760, v761, 4, v0.wireTypes.lengthDelimited);
        v771, v772 = v0.writeString(v771, v772, v759.sort_id);
        v760 = v771;
        v761 = v772;
    end;
    if v759.secondary_sort_id ~= nil and v759.secondary_sort_id ~= 0 then
        local v773, v774 = v0.writeTag(v760, v761, 5, v0.wireTypes.varint);
        v773, v774 = v0.writeVarInt(v773, v774, v759.secondary_sort_id);
        v760 = v773;
        v761 = v774;
    end;
    local v775 = buffer.create(v761);
    buffer.copy(v775, 0, v760, 0, v761);
    return v775;
end;
v4.decode = function(v776) --[[ Line: 6239 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_26 (copy), v0 (copy), v2 (copy)
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
            if v779 == 5 then
                v781 = nil;
                v782, v783 = v0.readVarIntI32(v776, v778);
                v781 = v782;
                v778 = v783;
                v777.secondary_sort_id = v781;
            else
                v781 = nil;
                v782, v783 = v0.readVarInt(v776, v778);
                v781 = v782;
                v778 = v783;
            end;
        elseif v780 == v0.wireTypes.lengthDelimited then
            if v779 == 1 then
                v781 = nil;
                v782, v783 = v0.readBuffer(v776, v778);
                v781 = v782;
                v778 = v783;
                v777.title = buffer.tostring(v781);
            elseif v779 == 2 then
                v781 = nil;
                v782, v783 = v0.readBuffer(v776, v778);
                v781 = v782;
                v778 = v783;
                table.insert(v777.song_items, v2.SongCarouselInputData_SongItem.decode(v781));
            elseif v779 == 3 then
                v781 = nil;
                v782, v783 = v0.readBuffer(v776, v778);
                v781 = v782;
                v778 = v783;
                v777.next_page_token = buffer.tostring(v781);
            elseif v779 == 4 then
                v781 = nil;
                v782, v783 = v0.readBuffer(v776, v778);
                v781 = v782;
                v778 = v783;
                v777.sort_id = buffer.tostring(v781);
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
v4.jsonEncode = function(v784) --[[ Line: 6302 ]] --[[ Name: jsonEncode ]]
    local v785 = {};
    if v784.title ~= nil and v784.title ~= "" then
        v785.title = v784.title;
    end;
    if v784.song_items ~= nil and #v784.song_items > 0 then
        local v786 = {};
        for _, v788 in v784.song_items do
            table.insert(v786, v788:jsonEncode());
        end;
        v785.songItems = v786;
    end;
    if v784.next_page_token ~= nil and v784.next_page_token ~= "" then
        v785.nextPageToken = v784.next_page_token;
    end;
    if v784.sort_id ~= nil and v784.sort_id ~= "" then
        v785.sortId = v784.sort_id;
    end;
    if v784.secondary_sort_id ~= nil and v784.secondary_sort_id ~= 0 then
        v785.secondarySortId = v784.secondary_sort_id;
    end;
    return v785;
end;
v4.jsonDecode = function(v789) --[[ Line: 6332 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_26 (copy), v2 (copy)
    local v790 = l_v4_26.new();
    if v789.title ~= nil then
        v790.title = v789.title;
    end;
    if v789.song_items ~= nil then
        local v791 = {};
        for _, v793 in v789.song_items do
            table.insert(v791, v2.SongCarouselInputData_SongItem.jsonDecode(v793));
        end;
        v790.song_items = v791;
    end;
    if v789.songItems ~= nil then
        local v794 = {};
        for _, v796 in v789.songItems do
            table.insert(v794, v2.SongCarouselInputData_SongItem.jsonDecode(v796));
        end;
        v790.song_items = v794;
    end;
    if v789.next_page_token ~= nil then
        v790.next_page_token = v789.next_page_token;
    end;
    if v789.nextPageToken ~= nil then
        v790.next_page_token = v789.nextPageToken;
    end;
    if v789.sort_id ~= nil then
        v790.sort_id = v789.sort_id;
    end;
    if v789.sortId ~= nil then
        v790.sort_id = v789.sortId;
    end;
    if v789.secondary_sort_id ~= nil then
        v790.secondary_sort_id = v789.secondary_sort_id;
    end;
    if v789.secondarySortId ~= nil then
        v790.secondary_sort_id = v789.secondarySortId;
    end;
    return v790;
end;
v4.descriptor = {
    name = "SongCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
};
v2.SongCarouselInputData = v4;
v1.default:register(v2.SongCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_27 = v4 --[[ copy: 4 -> 32 ]];
v4.new = function(v798) --[[ Line: 6398 ]] --[[ Name: new ]]
    -- upvalues: l_v4_27 (copy)
    return (setmetatable({
        song_id = (not (v798 ~= nil) or v798.song_id == nil) and "" or v798.song_id
    }, l_v4_27));
end;
v4.encode = function(v799) --[[ Line: 6406 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v800 = buffer.create(0);
    local v801 = 0;
    if v799.song_id ~= nil and v799.song_id ~= "" then
        local v802, v803 = v0.writeTag(v800, v801, 1, v0.wireTypes.lengthDelimited);
        v802, v803 = v0.writeString(v802, v803, v799.song_id);
        v800 = v802;
        v801 = v803;
    end;
    local v804 = buffer.create(v801);
    buffer.copy(v804, 0, v800, 0, v801);
    return v804;
end;
v4.decode = function(v805) --[[ Line: 6420 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_27 (copy), v0 (copy)
    local v806 = l_v4_27.new();
    local v807 = 0;
    while v807 < buffer.len(v805) do
        local v808 = nil;
        local v809 = nil;
        local v810, v811, v812 = v0.readTag(v805, v807);
        v808 = v810;
        v809 = v811;
        v807 = v812;
        if v809 == v0.wireTypes.varint then
            v810 = nil;
            v811, v812 = v0.readVarInt(v805, v807);
            v810 = v811;
            v807 = v812;
        elseif v809 == v0.wireTypes.lengthDelimited then
            if v808 == 1 then
                v810 = nil;
                v811, v812 = v0.readBuffer(v805, v807);
                v810 = v811;
                v807 = v812;
                v806.song_id = buffer.tostring(v810);
            else
                v810 = nil;
                v811, v812 = v0.readVarInt(v805, v807);
                v807 = v812 + v811;
            end;
        elseif v809 == v0.wireTypes.i32 then
            v810 = nil;
            v811, v812 = v0.readFixed32(v805, v807);
            v810 = v811;
            v807 = v812;
        elseif v809 == v0.wireTypes.i64 then
            v810 = nil;
            v811, v812 = v0.readFixed64(v805, v807);
            v810 = v811;
            v807 = v812;
        else
            error("Unsupported wire type: " .. v809);
        end;
    end;
    return v806;
end;
v4.jsonEncode = function(v813) --[[ Line: 6463 ]] --[[ Name: jsonEncode ]]
    local v814 = {};
    if v813.song_id ~= nil and v813.song_id ~= "" then
        v814.songId = v813.song_id;
    end;
    return v814;
end;
v4.jsonDecode = function(v815) --[[ Line: 6473 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_27 (copy)
    local v816 = l_v4_27.new();
    if v815.song_id ~= nil then
        v816.song_id = v815.song_id;
    end;
    if v815.songId ~= nil then
        v816.song_id = v815.songId;
    end;
    return v816;
end;
v4.descriptor = {
    name = "SongCarouselInputData_SongItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
};
v2.SongCarouselInputData_SongItem = v4;
v1.default:register(v2.SongCarouselInputData_SongItem);
v4 = {};
v4.__index = v4;
local l_v4_28 = v4 --[[ copy: 4 -> 33 ]];
v4.new = function(v818) --[[ Line: 6501 ]] --[[ Name: new ]]
    -- upvalues: l_v4_28 (copy)
    return (setmetatable({
        title = (not (v818 ~= nil) or v818.title == nil) and "" or v818.title, 
        event_items = if not (v818 ~= nil) or v818.event_items == nil then {} else v818.event_items
    }, l_v4_28));
end;
v4.encode = function(v819) --[[ Line: 6508 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v820 = buffer.create(0);
    local v821 = 0;
    if v819.title ~= nil and v819.title ~= "" then
        local v822, v823 = v0.writeTag(v820, v821, 1, v0.wireTypes.lengthDelimited);
        v822, v823 = v0.writeString(v822, v823, v819.title);
        v820 = v822;
        v821 = v823;
    end;
    if v819.event_items ~= nil and #v819.event_items > 0 then
        for _, v825 in v819.event_items do
            local v826 = v825:encode();
            local v827, v828 = v0.writeTag(v820, v821, 2, v0.wireTypes.lengthDelimited);
            v827, v828 = v0.writeBuffer(v827, v828, v826, buffer.len(v826));
            v820 = v827;
            v821 = v828;
        end;
    end;
    local v829 = buffer.create(v821);
    buffer.copy(v829, 0, v820, 0, v821);
    return v829;
end;
v4.decode = function(v830) --[[ Line: 6530 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_28 (copy), v0 (copy), v2 (copy)
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
                v831.title = buffer.tostring(v835);
            elseif v833 == 2 then
                v835 = nil;
                v836, v837 = v0.readBuffer(v830, v832);
                v835 = v836;
                v832 = v837;
                table.insert(v831.event_items, v2.EventsCarouselInputData_EventItem.decode(v835));
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
v4.jsonEncode = function(v838) --[[ Line: 6578 ]] --[[ Name: jsonEncode ]]
    local v839 = {};
    if v838.title ~= nil and v838.title ~= "" then
        v839.title = v838.title;
    end;
    if v838.event_items ~= nil and #v838.event_items > 0 then
        local v840 = {};
        for _, v842 in v838.event_items do
            table.insert(v840, v842:jsonEncode());
        end;
        v839.eventItems = v840;
    end;
    return v839;
end;
v4.jsonDecode = function(v843) --[[ Line: 6596 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_28 (copy), v2 (copy)
    local v844 = l_v4_28.new();
    if v843.title ~= nil then
        v844.title = v843.title;
    end;
    if v843.event_items ~= nil then
        local v845 = {};
        for _, v847 in v843.event_items do
            table.insert(v845, v2.EventsCarouselInputData_EventItem.jsonDecode(v847));
        end;
        v844.event_items = v845;
    end;
    if v843.eventItems ~= nil then
        local v848 = {};
        for _, v850 in v843.eventItems do
            table.insert(v848, v2.EventsCarouselInputData_EventItem.jsonDecode(v850));
        end;
        v844.event_items = v848;
    end;
    return v844;
end;
v4.descriptor = {
    name = "EventsCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
};
v2.EventsCarouselInputData = v4;
v1.default:register(v2.EventsCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_29 = v4 --[[ copy: 4 -> 34 ]];
v4.new = function(v852) --[[ Line: 6638 ]] --[[ Name: new ]]
    -- upvalues: l_v4_29 (copy)
    return (setmetatable({
        event_id = (not (v852 ~= nil) or v852.event_id == nil) and "" or v852.event_id
    }, l_v4_29));
end;
v4.encode = function(v853) --[[ Line: 6646 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v854 = buffer.create(0);
    local v855 = 0;
    if v853.event_id ~= nil and v853.event_id ~= "" then
        local v856, v857 = v0.writeTag(v854, v855, 1, v0.wireTypes.lengthDelimited);
        v856, v857 = v0.writeString(v856, v857, v853.event_id);
        v854 = v856;
        v855 = v857;
    end;
    local v858 = buffer.create(v855);
    buffer.copy(v858, 0, v854, 0, v855);
    return v858;
end;
v4.decode = function(v859) --[[ Line: 6660 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_29 (copy), v0 (copy)
    local v860 = l_v4_29.new();
    local v861 = 0;
    while v861 < buffer.len(v859) do
        local v862 = nil;
        local v863 = nil;
        local v864, v865, v866 = v0.readTag(v859, v861);
        v862 = v864;
        v863 = v865;
        v861 = v866;
        if v863 == v0.wireTypes.varint then
            v864 = nil;
            v865, v866 = v0.readVarInt(v859, v861);
            v864 = v865;
            v861 = v866;
        elseif v863 == v0.wireTypes.lengthDelimited then
            if v862 == 1 then
                v864 = nil;
                v865, v866 = v0.readBuffer(v859, v861);
                v864 = v865;
                v861 = v866;
                v860.event_id = buffer.tostring(v864);
            else
                v864 = nil;
                v865, v866 = v0.readVarInt(v859, v861);
                v861 = v866 + v865;
            end;
        elseif v863 == v0.wireTypes.i32 then
            v864 = nil;
            v865, v866 = v0.readFixed32(v859, v861);
            v864 = v865;
            v861 = v866;
        elseif v863 == v0.wireTypes.i64 then
            v864 = nil;
            v865, v866 = v0.readFixed64(v859, v861);
            v864 = v865;
            v861 = v866;
        else
            error("Unsupported wire type: " .. v863);
        end;
    end;
    return v860;
end;
v4.jsonEncode = function(v867) --[[ Line: 6703 ]] --[[ Name: jsonEncode ]]
    local v868 = {};
    if v867.event_id ~= nil and v867.event_id ~= "" then
        v868.eventId = v867.event_id;
    end;
    return v868;
end;
v4.jsonDecode = function(v869) --[[ Line: 6713 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_29 (copy)
    local v870 = l_v4_29.new();
    if v869.event_id ~= nil then
        v870.event_id = v869.event_id;
    end;
    if v869.eventId ~= nil then
        v870.event_id = v869.eventId;
    end;
    return v870;
end;
v4.descriptor = {
    name = "EventsCarouselInputData_EventItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
};
v2.EventsCarouselInputData_EventItem = v4;
v1.default:register(v2.EventsCarouselInputData_EventItem);
v4 = {};
v4.__index = v4;
local l_v4_30 = v4 --[[ copy: 4 -> 35 ]];
v4.new = function(v872) --[[ Line: 6743 ]] --[[ Name: new ]]
    -- upvalues: l_v4_30 (copy)
    return (setmetatable({
        universe_id = (not (v872 ~= nil) or v872.universe_id == nil) and "" or v872.universe_id, 
        entry_map = if not (v872 ~= nil) or v872.entry_map == nil then {} else v872.entry_map
    }, l_v4_30));
end;
v4.encode = function(v873) --[[ Line: 6750 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v874 = buffer.create(0);
    local v875 = 0;
    if v873.universe_id ~= nil and v873.universe_id ~= "" then
        local v876, v877 = v0.writeTag(v874, v875, 1, v0.wireTypes.lengthDelimited);
        v876, v877 = v0.writeString(v876, v877, v873.universe_id);
        v874 = v876;
        v875 = v877;
    end;
    if v873.entry_map ~= nil and next(v873.entry_map) ~= nil then
        for v878, v879 in v873.entry_map do
            local v880 = buffer.create(0);
            local v881, v882 = v0.writeTag(v880, 0, 1, v0.wireTypes.lengthDelimited);
            v881, v882 = v0.writeString(v881, v882, v878);
            v880 = v881;
            local l_v882_0 = v882;
            v881 = v879:encode();
            local v884;
            v882, v884 = v0.writeTag(v880, l_v882_0, 2, v0.wireTypes.lengthDelimited);
            v882, v884 = v0.writeBuffer(v882, v884, v881, buffer.len(v881));
            v880 = v882;
            l_v882_0 = v884;
            v882, v884 = v0.writeTag(v874, v875, 2, v0.wireTypes.lengthDelimited);
            v882, v884 = v0.writeBuffer(v882, v884, v880, l_v882_0);
            v874 = v882;
            v875 = v884;
        end;
    end;
    local v885 = buffer.create(v875);
    buffer.copy(v885, 0, v874, 0, v875);
    return v885;
end;
v4.decode = function(v886) --[[ Line: 6778 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_30 (copy), v0 (copy), v2 (copy)
    local v887 = l_v4_30.new();
    local v888 = 0;
    while v888 < buffer.len(v886) do
        local v889 = nil;
        local v890 = nil;
        local v891, v892, v893 = v0.readTag(v886, v888);
        v889 = v891;
        v890 = v892;
        v888 = v893;
        if v890 == v0.wireTypes.varint then
            v891 = nil;
            v892, v893 = v0.readVarInt(v886, v888);
            v891 = v892;
            v888 = v893;
        elseif v890 == v0.wireTypes.lengthDelimited then
            if v889 == 1 then
                v891 = nil;
                v892, v893 = v0.readBuffer(v886, v888);
                v891 = v892;
                v888 = v893;
                v887.universe_id = buffer.tostring(v891);
            elseif v889 == 2 then
                v891 = nil;
                v892, v893 = v0.readBuffer(v886, v888);
                v891 = v892;
                v888 = v893;
                v892 = v2.DevStoreFeedInputData_EntryMapEntry.decode(v891);
                v893 = v2.FeedEntry.new();
                v887.entry_map[v892.key or ""] = v892.value or v893;
            else
                v891 = nil;
                v892, v893 = v0.readVarInt(v886, v888);
                v888 = v893 + v892;
            end;
        elseif v890 == v0.wireTypes.i32 then
            v891 = nil;
            v892, v893 = v0.readFixed32(v886, v888);
            v891 = v892;
            v888 = v893;
        elseif v890 == v0.wireTypes.i64 then
            v891 = nil;
            v892, v893 = v0.readFixed64(v886, v888);
            v891 = v892;
            v888 = v893;
        else
            error("Unsupported wire type: " .. v890);
        end;
    end;
    return v887;
end;
v4.jsonEncode = function(v894) --[[ Line: 6833 ]] --[[ Name: jsonEncode ]]
    local v895 = {};
    if v894.universe_id ~= nil and v894.universe_id ~= "" then
        v895.universeId = v894.universe_id;
    end;
    if v894.entry_map ~= nil and next(v894.entry_map) ~= nil then
        local v896 = {};
        for v897, v898 in v894.entry_map do
            v896[v897] = v898:jsonEncode();
        end;
        v895.entryMap = v896;
    end;
    return v895;
end;
v4.jsonDecode = function(v899) --[[ Line: 6851 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_30 (copy), v2 (copy)
    local v900 = l_v4_30.new();
    if v899.universe_id ~= nil then
        v900.universe_id = v899.universe_id;
    end;
    if v899.universeId ~= nil then
        v900.universe_id = v899.universeId;
    end;
    if v899.entry_map ~= nil then
        local v901 = {};
        for v902, v903 in v899.entry_map do
            v901[v902] = v2.FeedEntry.jsonDecode(v903);
        end;
        v900.entry_map = v901;
    end;
    if v899.entryMap ~= nil then
        local v904 = {};
        for v905, v906 in v899.entryMap do
            v904[v905] = v2.FeedEntry.jsonDecode(v906);
        end;
        v900.entry_map = v904;
    end;
    return v900;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
};
v2.DevStoreFeedInputData = v4;
v1.default:register(v2.DevStoreFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_31 = v4 --[[ copy: 4 -> 36 ]];
v4.new = function(v908) --[[ Line: 6897 ]] --[[ Name: new ]]
    -- upvalues: l_v4_31 (copy)
    return (setmetatable({
        key = (not (v908 ~= nil) or v908.key == nil) and "" or v908.key, 
        value = if not (v908 ~= nil) or v908.value == nil then nil else v908.value
    }, l_v4_31));
end;
v4.encode = function(v909) --[[ Line: 6906 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v910 = buffer.create(0);
    local v911 = 0;
    if v909.key ~= nil and v909.key ~= "" then
        local v912, v913 = v0.writeTag(v910, v911, 1, v0.wireTypes.lengthDelimited);
        v912, v913 = v0.writeString(v912, v913, v909.key);
        v910 = v912;
        v911 = v913;
    end;
    if v909.value ~= nil then
        local v914 = v909.value:encode();
        local v915, v916 = v0.writeTag(v910, v911, 2, v0.wireTypes.lengthDelimited);
        v915, v916 = v0.writeBuffer(v915, v916, v914, buffer.len(v914));
        v910 = v915;
        v911 = v916;
    end;
    local v917 = buffer.create(v911);
    buffer.copy(v917, 0, v910, 0, v911);
    return v917;
end;
v4.decode = function(v918) --[[ Line: 6926 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_31 (copy), v0 (copy), v2 (copy)
    local v919 = l_v4_31.new();
    local v920 = 0;
    while v920 < buffer.len(v918) do
        local v921 = nil;
        local v922 = nil;
        local v923, v924, v925 = v0.readTag(v918, v920);
        v921 = v923;
        v922 = v924;
        v920 = v925;
        if v922 == v0.wireTypes.varint then
            v923 = nil;
            v924, v925 = v0.readVarInt(v918, v920);
            v923 = v924;
            v920 = v925;
        elseif v922 == v0.wireTypes.lengthDelimited then
            if v921 == 1 then
                v923 = nil;
                v924, v925 = v0.readBuffer(v918, v920);
                v923 = v924;
                v920 = v925;
                v919.key = buffer.tostring(v923);
            elseif v921 == 2 then
                v923 = nil;
                v924, v925 = v0.readBuffer(v918, v920);
                v923 = v924;
                v920 = v925;
                v919.value = v2.FeedEntry.decode(v923);
            else
                v923 = nil;
                v924, v925 = v0.readVarInt(v918, v920);
                v920 = v925 + v924;
            end;
        elseif v922 == v0.wireTypes.i32 then
            v923 = nil;
            v924, v925 = v0.readFixed32(v918, v920);
            v923 = v924;
            v920 = v925;
        elseif v922 == v0.wireTypes.i64 then
            v923 = nil;
            v924, v925 = v0.readFixed64(v918, v920);
            v923 = v924;
            v920 = v925;
        else
            error("Unsupported wire type: " .. v922);
        end;
    end;
    return v919;
end;
v4.jsonEncode = function(v926) --[[ Line: 6974 ]] --[[ Name: jsonEncode ]]
    local v927 = {};
    if v926.key ~= nil and v926.key ~= "" then
        v927.key = v926.key;
    end;
    if v926.value ~= nil then
        v927.value = v926.value:jsonEncode();
    end;
    return v927;
end;
v4.jsonDecode = function(v928) --[[ Line: 6988 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_31 (copy), v2 (copy)
    local v929 = l_v4_31.new();
    if v928.key ~= nil then
        v929.key = v928.key;
    end;
    if v928.value ~= nil then
        v929.value = v2.FeedEntry.jsonDecode(v928.value);
    end;
    return v929;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.DevStoreFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.DevStoreFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_32 = v4 --[[ copy: 4 -> 37 ]];
v4.new = function(v931) --[[ Line: 7018 ]] --[[ Name: new ]]
    -- upvalues: l_v4_32 (copy)
    return (setmetatable({
        game_passes = if not (v931 ~= nil) or v931.game_passes == nil then {} else v931.game_passes
    }, l_v4_32));
end;
v4.encode = function(v932) --[[ Line: 7024 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v933 = buffer.create(0);
    local v934 = 0;
    if v932.game_passes ~= nil and #v932.game_passes > 0 then
        for _, v936 in v932.game_passes do
            local v937 = v936:encode();
            local v938, v939 = v0.writeTag(v933, v934, 1, v0.wireTypes.lengthDelimited);
            v938, v939 = v0.writeBuffer(v938, v939, v937, buffer.len(v937));
            v933 = v938;
            v934 = v939;
        end;
    end;
    local v940 = buffer.create(v934);
    buffer.copy(v940, 0, v933, 0, v934);
    return v940;
end;
v4.decode = function(v941) --[[ Line: 7041 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_32 (copy), v0 (copy), v2 (copy)
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
                table.insert(v942.game_passes, v2.GamePassesGridInputData_GamePassItem.decode(v946));
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
v4.jsonEncode = function(v949) --[[ Line: 7084 ]] --[[ Name: jsonEncode ]]
    local v950 = {};
    if v949.game_passes ~= nil and #v949.game_passes > 0 then
        local v951 = {};
        for _, v953 in v949.game_passes do
            table.insert(v951, v953:jsonEncode());
        end;
        v950.gamePasses = v951;
    end;
    return v950;
end;
v4.jsonDecode = function(v954) --[[ Line: 7098 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_32 (copy), v2 (copy)
    local v955 = l_v4_32.new();
    if v954.game_passes ~= nil then
        local v956 = {};
        for _, v958 in v954.game_passes do
            table.insert(v956, v2.GamePassesGridInputData_GamePassItem.jsonDecode(v958));
        end;
        v955.game_passes = v956;
    end;
    if v954.gamePasses ~= nil then
        local v959 = {};
        for _, v961 in v954.gamePasses do
            table.insert(v959, v2.GamePassesGridInputData_GamePassItem.jsonDecode(v961));
        end;
        v955.game_passes = v959;
    end;
    return v955;
end;
v4.descriptor = {
    name = "GamePassesGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassesGridInputData"
};
v2.GamePassesGridInputData = v4;
v1.default:register(v2.GamePassesGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_33 = v4 --[[ copy: 4 -> 38 ]];
v4.new = function(v963) --[[ Line: 7136 ]] --[[ Name: new ]]
    -- upvalues: l_v4_33 (copy)
    return (setmetatable({
        game_pass_id = (not (v963 ~= nil) or v963.game_pass_id == nil) and "" or v963.game_pass_id
    }, l_v4_33));
end;
v4.encode = function(v964) --[[ Line: 7144 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v965 = buffer.create(0);
    local v966 = 0;
    if v964.game_pass_id ~= nil and v964.game_pass_id ~= "" then
        local v967, v968 = v0.writeTag(v965, v966, 1, v0.wireTypes.lengthDelimited);
        v967, v968 = v0.writeString(v967, v968, v964.game_pass_id);
        v965 = v967;
        v966 = v968;
    end;
    local v969 = buffer.create(v966);
    buffer.copy(v969, 0, v965, 0, v966);
    return v969;
end;
v4.decode = function(v970) --[[ Line: 7158 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_33 (copy), v0 (copy)
    local v971 = l_v4_33.new();
    local v972 = 0;
    while v972 < buffer.len(v970) do
        local v973 = nil;
        local v974 = nil;
        local v975, v976, v977 = v0.readTag(v970, v972);
        v973 = v975;
        v974 = v976;
        v972 = v977;
        if v974 == v0.wireTypes.varint then
            v975 = nil;
            v976, v977 = v0.readVarInt(v970, v972);
            v975 = v976;
            v972 = v977;
        elseif v974 == v0.wireTypes.lengthDelimited then
            if v973 == 1 then
                v975 = nil;
                v976, v977 = v0.readBuffer(v970, v972);
                v975 = v976;
                v972 = v977;
                v971.game_pass_id = buffer.tostring(v975);
            else
                v975 = nil;
                v976, v977 = v0.readVarInt(v970, v972);
                v972 = v977 + v976;
            end;
        elseif v974 == v0.wireTypes.i32 then
            v975 = nil;
            v976, v977 = v0.readFixed32(v970, v972);
            v975 = v976;
            v972 = v977;
        elseif v974 == v0.wireTypes.i64 then
            v975 = nil;
            v976, v977 = v0.readFixed64(v970, v972);
            v975 = v976;
            v972 = v977;
        else
            error("Unsupported wire type: " .. v974);
        end;
    end;
    return v971;
end;
v4.jsonEncode = function(v978) --[[ Line: 7201 ]] --[[ Name: jsonEncode ]]
    local v979 = {};
    if v978.game_pass_id ~= nil and v978.game_pass_id ~= "" then
        v979.gamePassId = v978.game_pass_id;
    end;
    return v979;
end;
v4.jsonDecode = function(v980) --[[ Line: 7211 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_33 (copy)
    local v981 = l_v4_33.new();
    if v980.game_pass_id ~= nil then
        v981.game_pass_id = v980.game_pass_id;
    end;
    if v980.gamePassId ~= nil then
        v981.game_pass_id = v980.gamePassId;
    end;
    return v981;
end;
v4.descriptor = {
    name = "GamePassesGridInputData_GamePassItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
};
v2.GamePassesGridInputData_GamePassItem = v4;
v1.default:register(v2.GamePassesGridInputData_GamePassItem);
v4 = {};
v4.__index = v4;
local l_v4_34 = v4 --[[ copy: 4 -> 39 ]];
v4.new = function(v983) --[[ Line: 7241 ]] --[[ Name: new ]]
    -- upvalues: l_v4_34 (copy)
    return (setmetatable({
        developer_products = if not (v983 ~= nil) or v983.developer_products == nil then {} else v983.developer_products
    }, l_v4_34));
end;
v4.encode = function(v984) --[[ Line: 7249 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v985 = buffer.create(0);
    local v986 = 0;
    if v984.developer_products ~= nil and #v984.developer_products > 0 then
        for _, v988 in v984.developer_products do
            local v989 = v988:encode();
            local v990, v991 = v0.writeTag(v985, v986, 1, v0.wireTypes.lengthDelimited);
            v990, v991 = v0.writeBuffer(v990, v991, v989, buffer.len(v989));
            v985 = v990;
            v986 = v991;
        end;
    end;
    local v992 = buffer.create(v986);
    buffer.copy(v992, 0, v985, 0, v986);
    return v992;
end;
v4.decode = function(v993) --[[ Line: 7266 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_34 (copy), v0 (copy), v2 (copy)
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
                table.insert(v994.developer_products, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.decode(v998));
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
v4.jsonEncode = function(v1001) --[[ Line: 7312 ]] --[[ Name: jsonEncode ]]
    local v1002 = {};
    if v1001.developer_products ~= nil and #v1001.developer_products > 0 then
        local v1003 = {};
        for _, v1005 in v1001.developer_products do
            table.insert(v1003, v1005:jsonEncode());
        end;
        v1002.developerProducts = v1003;
    end;
    return v1002;
end;
v4.jsonDecode = function(v1006) --[[ Line: 7326 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_34 (copy), v2 (copy)
    local v1007 = l_v4_34.new();
    if v1006.developer_products ~= nil then
        local v1008 = {};
        for _, v1010 in v1006.developer_products do
            table.insert(v1008, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.jsonDecode(v1010));
        end;
        v1007.developer_products = v1008;
    end;
    if v1006.developerProducts ~= nil then
        local v1011 = {};
        for _, v1013 in v1006.developerProducts do
            table.insert(v1011, v2.GameDeveloperProductsGridInputData_DeveloperProductItem.jsonDecode(v1013));
        end;
        v1007.developer_products = v1011;
    end;
    return v1007;
end;
v4.descriptor = {
    name = "GameDeveloperProductsGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductsGridInputData"
};
v2.GameDeveloperProductsGridInputData = v4;
v1.default:register(v2.GameDeveloperProductsGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_35 = v4 --[[ copy: 4 -> 40 ]];
v4.new = function(v1015) --[[ Line: 7373 ]] --[[ Name: new ]]
    -- upvalues: l_v4_35 (copy)
    return (setmetatable({
        developer_product_id = (not (v1015 ~= nil) or v1015.developer_product_id == nil) and "" or v1015.developer_product_id
    }, l_v4_35));
end;
v4.encode = function(v1016) --[[ Line: 7386 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1017 = buffer.create(0);
    local v1018 = 0;
    if v1016.developer_product_id ~= nil and v1016.developer_product_id ~= "" then
        local v1019, v1020 = v0.writeTag(v1017, v1018, 1, v0.wireTypes.lengthDelimited);
        v1019, v1020 = v0.writeString(v1019, v1020, v1016.developer_product_id);
        v1017 = v1019;
        v1018 = v1020;
    end;
    local v1021 = buffer.create(v1018);
    buffer.copy(v1021, 0, v1017, 0, v1018);
    return v1021;
end;
v4.decode = function(v1022) --[[ Line: 7402 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_35 (copy), v0 (copy)
    local v1023 = l_v4_35.new();
    local v1024 = 0;
    while v1024 < buffer.len(v1022) do
        local v1025 = nil;
        local v1026 = nil;
        local v1027, v1028, v1029 = v0.readTag(v1022, v1024);
        v1025 = v1027;
        v1026 = v1028;
        v1024 = v1029;
        if v1026 == v0.wireTypes.varint then
            v1027 = nil;
            v1028, v1029 = v0.readVarInt(v1022, v1024);
            v1027 = v1028;
            v1024 = v1029;
        elseif v1026 == v0.wireTypes.lengthDelimited then
            if v1025 == 1 then
                v1027 = nil;
                v1028, v1029 = v0.readBuffer(v1022, v1024);
                v1027 = v1028;
                v1024 = v1029;
                v1023.developer_product_id = buffer.tostring(v1027);
            else
                v1027 = nil;
                v1028, v1029 = v0.readVarInt(v1022, v1024);
                v1024 = v1029 + v1028;
            end;
        elseif v1026 == v0.wireTypes.i32 then
            v1027 = nil;
            v1028, v1029 = v0.readFixed32(v1022, v1024);
            v1027 = v1028;
            v1024 = v1029;
        elseif v1026 == v0.wireTypes.i64 then
            v1027 = nil;
            v1028, v1029 = v0.readFixed64(v1022, v1024);
            v1027 = v1028;
            v1024 = v1029;
        else
            error("Unsupported wire type: " .. v1026);
        end;
    end;
    return v1023;
end;
v4.jsonEncode = function(v1030) --[[ Line: 7447 ]] --[[ Name: jsonEncode ]]
    local v1031 = {};
    if v1030.developer_product_id ~= nil and v1030.developer_product_id ~= "" then
        v1031.developerProductId = v1030.developer_product_id;
    end;
    return v1031;
end;
v4.jsonDecode = function(v1032) --[[ Line: 7459 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_35 (copy)
    local v1033 = l_v4_35.new();
    if v1032.developer_product_id ~= nil then
        v1033.developer_product_id = v1032.developer_product_id;
    end;
    if v1032.developerProductId ~= nil then
        v1033.developer_product_id = v1032.developerProductId;
    end;
    return v1033;
end;
v4.descriptor = {
    name = "GameDeveloperProductsGridInputData_DeveloperProductItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
};
v2.GameDeveloperProductsGridInputData_DeveloperProductItem = v4;
v1.default:register(v2.GameDeveloperProductsGridInputData_DeveloperProductItem);
v4 = {};
v4.__index = v4;
local l_v4_36 = v4 --[[ copy: 4 -> 41 ]];
v4.new = function(v1035) --[[ Line: 7490 ]] --[[ Name: new ]]
    -- upvalues: l_v4_36 (copy)
    return (setmetatable({
        subscriptions = if not (v1035 ~= nil) or v1035.subscriptions == nil then {} else v1035.subscriptions
    }, l_v4_36));
end;
v4.encode = function(v1036) --[[ Line: 7498 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1037 = buffer.create(0);
    local v1038 = 0;
    if v1036.subscriptions ~= nil and #v1036.subscriptions > 0 then
        for _, v1040 in v1036.subscriptions do
            local v1041 = v1040:encode();
            local v1042, v1043 = v0.writeTag(v1037, v1038, 1, v0.wireTypes.lengthDelimited);
            v1042, v1043 = v0.writeBuffer(v1042, v1043, v1041, buffer.len(v1041));
            v1037 = v1042;
            v1038 = v1043;
        end;
    end;
    local v1044 = buffer.create(v1038);
    buffer.copy(v1044, 0, v1037, 0, v1038);
    return v1044;
end;
v4.decode = function(v1045) --[[ Line: 7515 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_36 (copy), v0 (copy), v2 (copy)
    local v1046 = l_v4_36.new();
    local v1047 = 0;
    while v1047 < buffer.len(v1045) do
        local v1048 = nil;
        local v1049 = nil;
        local v1050, v1051, v1052 = v0.readTag(v1045, v1047);
        v1048 = v1050;
        v1049 = v1051;
        v1047 = v1052;
        if v1049 == v0.wireTypes.varint then
            v1050 = nil;
            v1051, v1052 = v0.readVarInt(v1045, v1047);
            v1050 = v1051;
            v1047 = v1052;
        elseif v1049 == v0.wireTypes.lengthDelimited then
            if v1048 == 1 then
                v1050 = nil;
                v1051, v1052 = v0.readBuffer(v1045, v1047);
                v1050 = v1051;
                v1047 = v1052;
                table.insert(v1046.subscriptions, v2.GameSubscriptionsGridInputData_SubscriptionItem.decode(v1050));
            else
                v1050 = nil;
                v1051, v1052 = v0.readVarInt(v1045, v1047);
                v1047 = v1052 + v1051;
            end;
        elseif v1049 == v0.wireTypes.i32 then
            v1050 = nil;
            v1051, v1052 = v0.readFixed32(v1045, v1047);
            v1050 = v1051;
            v1047 = v1052;
        elseif v1049 == v0.wireTypes.i64 then
            v1050 = nil;
            v1051, v1052 = v0.readFixed64(v1045, v1047);
            v1050 = v1051;
            v1047 = v1052;
        else
            error("Unsupported wire type: " .. v1049);
        end;
    end;
    return v1046;
end;
v4.jsonEncode = function(v1053) --[[ Line: 7561 ]] --[[ Name: jsonEncode ]]
    local v1054 = {};
    if v1053.subscriptions ~= nil and #v1053.subscriptions > 0 then
        local v1055 = {};
        for _, v1057 in v1053.subscriptions do
            table.insert(v1055, v1057:jsonEncode());
        end;
        v1054.subscriptions = v1055;
    end;
    return v1054;
end;
v4.jsonDecode = function(v1058) --[[ Line: 7575 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_36 (copy), v2 (copy)
    local v1059 = l_v4_36.new();
    if v1058.subscriptions ~= nil then
        local v1060 = {};
        for _, v1062 in v1058.subscriptions do
            table.insert(v1060, v2.GameSubscriptionsGridInputData_SubscriptionItem.jsonDecode(v1062));
        end;
        v1059.subscriptions = v1060;
    end;
    return v1059;
end;
v4.descriptor = {
    name = "GameSubscriptionsGridInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionsGridInputData"
};
v2.GameSubscriptionsGridInputData = v4;
v1.default:register(v2.GameSubscriptionsGridInputData);
v4 = {};
v4.__index = v4;
local l_v4_37 = v4 --[[ copy: 4 -> 42 ]];
v4.new = function(v1064) --[[ Line: 7604 ]] --[[ Name: new ]]
    -- upvalues: l_v4_37 (copy)
    return (setmetatable({
        subscription_id = (not (v1064 ~= nil) or v1064.subscription_id == nil) and "" or v1064.subscription_id
    }, l_v4_37));
end;
v4.encode = function(v1065) --[[ Line: 7612 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1066 = buffer.create(0);
    local v1067 = 0;
    if v1065.subscription_id ~= nil and v1065.subscription_id ~= "" then
        local v1068, v1069 = v0.writeTag(v1066, v1067, 1, v0.wireTypes.lengthDelimited);
        v1068, v1069 = v0.writeString(v1068, v1069, v1065.subscription_id);
        v1066 = v1068;
        v1067 = v1069;
    end;
    local v1070 = buffer.create(v1067);
    buffer.copy(v1070, 0, v1066, 0, v1067);
    return v1070;
end;
v4.decode = function(v1071) --[[ Line: 7628 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_37 (copy), v0 (copy)
    local v1072 = l_v4_37.new();
    local v1073 = 0;
    while v1073 < buffer.len(v1071) do
        local v1074 = nil;
        local v1075 = nil;
        local v1076, v1077, v1078 = v0.readTag(v1071, v1073);
        v1074 = v1076;
        v1075 = v1077;
        v1073 = v1078;
        if v1075 == v0.wireTypes.varint then
            v1076 = nil;
            v1077, v1078 = v0.readVarInt(v1071, v1073);
            v1076 = v1077;
            v1073 = v1078;
        elseif v1075 == v0.wireTypes.lengthDelimited then
            if v1074 == 1 then
                v1076 = nil;
                v1077, v1078 = v0.readBuffer(v1071, v1073);
                v1076 = v1077;
                v1073 = v1078;
                v1072.subscription_id = buffer.tostring(v1076);
            else
                v1076 = nil;
                v1077, v1078 = v0.readVarInt(v1071, v1073);
                v1073 = v1078 + v1077;
            end;
        elseif v1075 == v0.wireTypes.i32 then
            v1076 = nil;
            v1077, v1078 = v0.readFixed32(v1071, v1073);
            v1076 = v1077;
            v1073 = v1078;
        elseif v1075 == v0.wireTypes.i64 then
            v1076 = nil;
            v1077, v1078 = v0.readFixed64(v1071, v1073);
            v1076 = v1077;
            v1073 = v1078;
        else
            error("Unsupported wire type: " .. v1075);
        end;
    end;
    return v1072;
end;
v4.jsonEncode = function(v1079) --[[ Line: 7673 ]] --[[ Name: jsonEncode ]]
    local v1080 = {};
    if v1079.subscription_id ~= nil and v1079.subscription_id ~= "" then
        v1080.subscriptionId = v1079.subscription_id;
    end;
    return v1080;
end;
v4.jsonDecode = function(v1081) --[[ Line: 7685 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_37 (copy)
    local v1082 = l_v4_37.new();
    if v1081.subscription_id ~= nil then
        v1082.subscription_id = v1081.subscription_id;
    end;
    if v1081.subscriptionId ~= nil then
        v1082.subscription_id = v1081.subscriptionId;
    end;
    return v1082;
end;
v4.descriptor = {
    name = "GameSubscriptionsGridInputData_SubscriptionItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
};
v2.GameSubscriptionsGridInputData_SubscriptionItem = v4;
v1.default:register(v2.GameSubscriptionsGridInputData_SubscriptionItem);
v4 = {};
v4.__index = v4;
local l_v4_38 = v4 --[[ copy: 4 -> 43 ]];
v4.new = function(v1084) --[[ Line: 7716 ]] --[[ Name: new ]]
    -- upvalues: l_v4_38 (copy)
    return (setmetatable({
        roblox_component = (not (v1084 ~= nil) or v1084.roblox_component == nil) and "" or v1084.roblox_component, 
        identifier = (not (v1084 ~= nil) or v1084.identifier == nil) and "" or v1084.identifier, 
        title = (not (v1084 ~= nil) or v1084.title == nil) and "" or v1084.title, 
        user_id = (not (v1084 ~= nil) or v1084.user_id == nil) and "" or v1084.user_id, 
        description = (not (v1084 ~= nil) or v1084.description == nil) and "" or v1084.description, 
        cta_text = (not (v1084 ~= nil) or v1084.cta_text == nil) and "" or v1084.cta_text, 
        prompt_id = (not (v1084 ~= nil) or v1084.prompt_id == nil) and "" or v1084.prompt_id, 
        prompt_type = (not (v1084 ~= nil) or v1084.prompt_type == nil) and "" or v1084.prompt_type
    }, l_v4_38));
end;
v4.encode = function(v1085) --[[ Line: 7731 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1086 = buffer.create(0);
    local v1087 = 0;
    if v1085.roblox_component ~= nil and v1085.roblox_component ~= "" then
        local v1088, v1089 = v0.writeTag(v1086, v1087, 1, v0.wireTypes.lengthDelimited);
        v1088, v1089 = v0.writeString(v1088, v1089, v1085.roblox_component);
        v1086 = v1088;
        v1087 = v1089;
    end;
    if v1085.identifier ~= nil and v1085.identifier ~= "" then
        local v1090, v1091 = v0.writeTag(v1086, v1087, 2, v0.wireTypes.lengthDelimited);
        v1090, v1091 = v0.writeString(v1090, v1091, v1085.identifier);
        v1086 = v1090;
        v1087 = v1091;
    end;
    if v1085.title ~= nil and v1085.title ~= "" then
        local v1092, v1093 = v0.writeTag(v1086, v1087, 3, v0.wireTypes.lengthDelimited);
        v1092, v1093 = v0.writeString(v1092, v1093, v1085.title);
        v1086 = v1092;
        v1087 = v1093;
    end;
    if v1085.user_id ~= nil and v1085.user_id ~= "" then
        local v1094, v1095 = v0.writeTag(v1086, v1087, 4, v0.wireTypes.lengthDelimited);
        v1094, v1095 = v0.writeString(v1094, v1095, v1085.user_id);
        v1086 = v1094;
        v1087 = v1095;
    end;
    if v1085.description ~= nil and v1085.description ~= "" then
        local v1096, v1097 = v0.writeTag(v1086, v1087, 5, v0.wireTypes.lengthDelimited);
        v1096, v1097 = v0.writeString(v1096, v1097, v1085.description);
        v1086 = v1096;
        v1087 = v1097;
    end;
    if v1085.cta_text ~= nil and v1085.cta_text ~= "" then
        local v1098, v1099 = v0.writeTag(v1086, v1087, 6, v0.wireTypes.lengthDelimited);
        v1098, v1099 = v0.writeString(v1098, v1099, v1085.cta_text);
        v1086 = v1098;
        v1087 = v1099;
    end;
    if v1085.prompt_id ~= nil and v1085.prompt_id ~= "" then
        local v1100, v1101 = v0.writeTag(v1086, v1087, 7, v0.wireTypes.lengthDelimited);
        v1100, v1101 = v0.writeString(v1100, v1101, v1085.prompt_id);
        v1086 = v1100;
        v1087 = v1101;
    end;
    if v1085.prompt_type ~= nil and v1085.prompt_type ~= "" then
        local v1102, v1103 = v0.writeTag(v1086, v1087, 8, v0.wireTypes.lengthDelimited);
        v1102, v1103 = v0.writeString(v1102, v1103, v1085.prompt_type);
        v1086 = v1102;
        v1087 = v1103;
    end;
    local v1104 = buffer.create(v1087);
    buffer.copy(v1104, 0, v1086, 0, v1087);
    return v1104;
end;
v4.decode = function(v1105) --[[ Line: 7780 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_38 (copy), v0 (copy)
    local v1106 = l_v4_38.new();
    local v1107 = 0;
    while v1107 < buffer.len(v1105) do
        local v1108 = nil;
        local v1109 = nil;
        local v1110, v1111, v1112 = v0.readTag(v1105, v1107);
        v1108 = v1110;
        v1109 = v1111;
        v1107 = v1112;
        if v1109 == v0.wireTypes.varint then
            v1110 = nil;
            v1111, v1112 = v0.readVarInt(v1105, v1107);
            v1110 = v1111;
            v1107 = v1112;
        elseif v1109 == v0.wireTypes.lengthDelimited then
            if v1108 == 1 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.roblox_component = buffer.tostring(v1110);
            elseif v1108 == 2 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.identifier = buffer.tostring(v1110);
            elseif v1108 == 3 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.title = buffer.tostring(v1110);
            elseif v1108 == 4 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.user_id = buffer.tostring(v1110);
            elseif v1108 == 5 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.description = buffer.tostring(v1110);
            elseif v1108 == 6 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.cta_text = buffer.tostring(v1110);
            elseif v1108 == 7 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.prompt_id = buffer.tostring(v1110);
            elseif v1108 == 8 then
                v1110 = nil;
                v1111, v1112 = v0.readBuffer(v1105, v1107);
                v1110 = v1111;
                v1107 = v1112;
                v1106.prompt_type = buffer.tostring(v1110);
            else
                v1110 = nil;
                v1111, v1112 = v0.readVarInt(v1105, v1107);
                v1107 = v1112 + v1111;
            end;
        elseif v1109 == v0.wireTypes.i32 then
            v1110 = nil;
            v1111, v1112 = v0.readFixed32(v1105, v1107);
            v1110 = v1111;
            v1107 = v1112;
        elseif v1109 == v0.wireTypes.i64 then
            v1110 = nil;
            v1111, v1112 = v0.readFixed64(v1105, v1107);
            v1110 = v1111;
            v1107 = v1112;
        else
            error("Unsupported wire type: " .. v1109);
        end;
    end;
    return v1106;
end;
v4.jsonEncode = function(v1113) --[[ Line: 7858 ]] --[[ Name: jsonEncode ]]
    local v1114 = {};
    if v1113.roblox_component ~= nil and v1113.roblox_component ~= "" then
        v1114.robloxComponent = v1113.roblox_component;
    end;
    if v1113.identifier ~= nil and v1113.identifier ~= "" then
        v1114.identifier = v1113.identifier;
    end;
    if v1113.title ~= nil and v1113.title ~= "" then
        v1114.title = v1113.title;
    end;
    if v1113.user_id ~= nil and v1113.user_id ~= "" then
        v1114.userId = v1113.user_id;
    end;
    if v1113.description ~= nil and v1113.description ~= "" then
        v1114.description = v1113.description;
    end;
    if v1113.cta_text ~= nil and v1113.cta_text ~= "" then
        v1114.ctaText = v1113.cta_text;
    end;
    if v1113.prompt_id ~= nil and v1113.prompt_id ~= "" then
        v1114.promptId = v1113.prompt_id;
    end;
    if v1113.prompt_type ~= nil and v1113.prompt_type ~= "" then
        v1114.promptType = v1113.prompt_type;
    end;
    return v1114;
end;
v4.jsonDecode = function(v1115) --[[ Line: 7896 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_38 (copy)
    local v1116 = l_v4_38.new();
    if v1115.roblox_component ~= nil then
        v1116.roblox_component = v1115.roblox_component;
    end;
    if v1115.robloxComponent ~= nil then
        v1116.roblox_component = v1115.robloxComponent;
    end;
    if v1115.identifier ~= nil then
        v1116.identifier = v1115.identifier;
    end;
    if v1115.title ~= nil then
        v1116.title = v1115.title;
    end;
    if v1115.user_id ~= nil then
        v1116.user_id = v1115.user_id;
    end;
    if v1115.userId ~= nil then
        v1116.user_id = v1115.userId;
    end;
    if v1115.description ~= nil then
        v1116.description = v1115.description;
    end;
    if v1115.cta_text ~= nil then
        v1116.cta_text = v1115.cta_text;
    end;
    if v1115.ctaText ~= nil then
        v1116.cta_text = v1115.ctaText;
    end;
    if v1115.prompt_id ~= nil then
        v1116.prompt_id = v1115.prompt_id;
    end;
    if v1115.promptId ~= nil then
        v1116.prompt_id = v1115.promptId;
    end;
    if v1115.prompt_type ~= nil then
        v1116.prompt_type = v1115.prompt_type;
    end;
    if v1115.promptType ~= nil then
        v1116.prompt_type = v1115.promptType;
    end;
    return v1116;
end;
v4.descriptor = {
    name = "CardContainerCardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
};
v2.CardContainerCardInputData = v4;
v1.default:register(v2.CardContainerCardInputData);
v4 = {};
v4.__index = v4;
local l_v4_39 = v4 --[[ copy: 4 -> 44 ]];
v4.new = function(v1118) --[[ Line: 7968 ]] --[[ Name: new ]]
    -- upvalues: l_v4_39 (copy)
    return (setmetatable({
        title = (not (v1118 ~= nil) or v1118.title == nil) and "" or v1118.title, 
        dismiss_text = (not (v1118 ~= nil) or v1118.dismiss_text == nil) and "" or v1118.dismiss_text, 
        user_id = (not (v1118 ~= nil) or v1118.user_id == nil) and "" or v1118.user_id, 
        cards = if not (v1118 ~= nil) or v1118.cards == nil then {} else v1118.cards, 
        prompt_id = (not (v1118 ~= nil) or v1118.prompt_id == nil) and "" or v1118.prompt_id, 
        prompt_type = (not (v1118 ~= nil) or v1118.prompt_type == nil) and "" or v1118.prompt_type
    }, l_v4_39));
end;
v4.encode = function(v1119) --[[ Line: 7979 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1120 = buffer.create(0);
    local v1121 = 0;
    if v1119.title ~= nil and v1119.title ~= "" then
        local v1122, v1123 = v0.writeTag(v1120, v1121, 1, v0.wireTypes.lengthDelimited);
        v1122, v1123 = v0.writeString(v1122, v1123, v1119.title);
        v1120 = v1122;
        v1121 = v1123;
    end;
    if v1119.dismiss_text ~= nil and v1119.dismiss_text ~= "" then
        local v1124, v1125 = v0.writeTag(v1120, v1121, 2, v0.wireTypes.lengthDelimited);
        v1124, v1125 = v0.writeString(v1124, v1125, v1119.dismiss_text);
        v1120 = v1124;
        v1121 = v1125;
    end;
    if v1119.user_id ~= nil and v1119.user_id ~= "" then
        local v1126, v1127 = v0.writeTag(v1120, v1121, 3, v0.wireTypes.lengthDelimited);
        v1126, v1127 = v0.writeString(v1126, v1127, v1119.user_id);
        v1120 = v1126;
        v1121 = v1127;
    end;
    if v1119.cards ~= nil and #v1119.cards > 0 then
        for _, v1129 in v1119.cards do
            local v1130 = v1129:encode();
            local v1131, v1132 = v0.writeTag(v1120, v1121, 4, v0.wireTypes.lengthDelimited);
            v1131, v1132 = v0.writeBuffer(v1131, v1132, v1130, buffer.len(v1130));
            v1120 = v1131;
            v1121 = v1132;
        end;
    end;
    if v1119.prompt_id ~= nil and v1119.prompt_id ~= "" then
        local v1133, v1134 = v0.writeTag(v1120, v1121, 5, v0.wireTypes.lengthDelimited);
        v1133, v1134 = v0.writeString(v1133, v1134, v1119.prompt_id);
        v1120 = v1133;
        v1121 = v1134;
    end;
    if v1119.prompt_type ~= nil and v1119.prompt_type ~= "" then
        local v1135, v1136 = v0.writeTag(v1120, v1121, 6, v0.wireTypes.lengthDelimited);
        v1135, v1136 = v0.writeString(v1135, v1136, v1119.prompt_type);
        v1120 = v1135;
        v1121 = v1136;
    end;
    local v1137 = buffer.create(v1121);
    buffer.copy(v1137, 0, v1120, 0, v1121);
    return v1137;
end;
v4.decode = function(v1138) --[[ Line: 8021 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_39 (copy), v0 (copy), v2 (copy)
    local v1139 = l_v4_39.new();
    local v1140 = 0;
    while v1140 < buffer.len(v1138) do
        local v1141 = nil;
        local v1142 = nil;
        local v1143, v1144, v1145 = v0.readTag(v1138, v1140);
        v1141 = v1143;
        v1142 = v1144;
        v1140 = v1145;
        if v1142 == v0.wireTypes.varint then
            v1143 = nil;
            v1144, v1145 = v0.readVarInt(v1138, v1140);
            v1143 = v1144;
            v1140 = v1145;
        elseif v1142 == v0.wireTypes.lengthDelimited then
            if v1141 == 1 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                v1139.title = buffer.tostring(v1143);
            elseif v1141 == 2 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                v1139.dismiss_text = buffer.tostring(v1143);
            elseif v1141 == 3 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                v1139.user_id = buffer.tostring(v1143);
            elseif v1141 == 4 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                table.insert(v1139.cards, v2.CardContainerCardInputData.decode(v1143));
            elseif v1141 == 5 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                v1139.prompt_id = buffer.tostring(v1143);
            elseif v1141 == 6 then
                v1143 = nil;
                v1144, v1145 = v0.readBuffer(v1138, v1140);
                v1143 = v1144;
                v1140 = v1145;
                v1139.prompt_type = buffer.tostring(v1143);
            else
                v1143 = nil;
                v1144, v1145 = v0.readVarInt(v1138, v1140);
                v1140 = v1145 + v1144;
            end;
        elseif v1142 == v0.wireTypes.i32 then
            v1143 = nil;
            v1144, v1145 = v0.readFixed32(v1138, v1140);
            v1143 = v1144;
            v1140 = v1145;
        elseif v1142 == v0.wireTypes.i64 then
            v1143 = nil;
            v1144, v1145 = v0.readFixed64(v1138, v1140);
            v1143 = v1144;
            v1140 = v1145;
        else
            error("Unsupported wire type: " .. v1142);
        end;
    end;
    return v1139;
end;
v4.jsonEncode = function(v1146) --[[ Line: 8089 ]] --[[ Name: jsonEncode ]]
    local v1147 = {};
    if v1146.title ~= nil and v1146.title ~= "" then
        v1147.title = v1146.title;
    end;
    if v1146.dismiss_text ~= nil and v1146.dismiss_text ~= "" then
        v1147.dismissText = v1146.dismiss_text;
    end;
    if v1146.user_id ~= nil and v1146.user_id ~= "" then
        v1147.userId = v1146.user_id;
    end;
    if v1146.cards ~= nil and #v1146.cards > 0 then
        local v1148 = {};
        for _, v1150 in v1146.cards do
            table.insert(v1148, v1150:jsonEncode());
        end;
        v1147.cards = v1148;
    end;
    if v1146.prompt_id ~= nil and v1146.prompt_id ~= "" then
        v1147.promptId = v1146.prompt_id;
    end;
    if v1146.prompt_type ~= nil and v1146.prompt_type ~= "" then
        v1147.promptType = v1146.prompt_type;
    end;
    return v1147;
end;
v4.jsonDecode = function(v1151) --[[ Line: 8123 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_39 (copy), v2 (copy)
    local v1152 = l_v4_39.new();
    if v1151.title ~= nil then
        v1152.title = v1151.title;
    end;
    if v1151.dismiss_text ~= nil then
        v1152.dismiss_text = v1151.dismiss_text;
    end;
    if v1151.dismissText ~= nil then
        v1152.dismiss_text = v1151.dismissText;
    end;
    if v1151.user_id ~= nil then
        v1152.user_id = v1151.user_id;
    end;
    if v1151.userId ~= nil then
        v1152.user_id = v1151.userId;
    end;
    if v1151.cards ~= nil then
        local v1153 = {};
        for _, v1155 in v1151.cards do
            table.insert(v1153, v2.CardContainerCardInputData.jsonDecode(v1155));
        end;
        v1152.cards = v1153;
    end;
    if v1151.prompt_id ~= nil then
        v1152.prompt_id = v1151.prompt_id;
    end;
    if v1151.promptId ~= nil then
        v1152.prompt_id = v1151.promptId;
    end;
    if v1151.prompt_type ~= nil then
        v1152.prompt_type = v1151.prompt_type;
    end;
    if v1151.promptType ~= nil then
        v1152.prompt_type = v1151.promptType;
    end;
    return v1152;
end;
v4.descriptor = {
    name = "CardContainerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
};
v2.CardContainerInputData = v4;
v1.default:register(v2.CardContainerInputData);
v4 = {};
v4.__index = v4;
local l_v4_40 = v4 --[[ copy: 4 -> 45 ]];
v4.new = function(v1157) --[[ Line: 8188 ]] --[[ Name: new ]]
    -- upvalues: l_v4_40 (copy)
    return (setmetatable({
        title = (not (v1157 ~= nil) or v1157.title == nil) and "" or v1157.title, 
        user_id = (not (v1157 ~= nil) or v1157.user_id == nil) and "" or v1157.user_id, 
        description = (not (v1157 ~= nil) or v1157.description == nil) and "" or v1157.description, 
        cta_text = (not (v1157 ~= nil) or v1157.cta_text == nil) and "" or v1157.cta_text, 
        prompt_id = (not (v1157 ~= nil) or v1157.prompt_id == nil) and "" or v1157.prompt_id, 
        prompt_type = (not (v1157 ~= nil) or v1157.prompt_type == nil) and "" or v1157.prompt_type
    }, l_v4_40));
end;
v4.encode = function(v1158) --[[ Line: 8199 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1159 = buffer.create(0);
    local v1160 = 0;
    if v1158.title ~= nil and v1158.title ~= "" then
        local v1161, v1162 = v0.writeTag(v1159, v1160, 1, v0.wireTypes.lengthDelimited);
        v1161, v1162 = v0.writeString(v1161, v1162, v1158.title);
        v1159 = v1161;
        v1160 = v1162;
    end;
    if v1158.user_id ~= nil and v1158.user_id ~= "" then
        local v1163, v1164 = v0.writeTag(v1159, v1160, 2, v0.wireTypes.lengthDelimited);
        v1163, v1164 = v0.writeString(v1163, v1164, v1158.user_id);
        v1159 = v1163;
        v1160 = v1164;
    end;
    if v1158.description ~= nil and v1158.description ~= "" then
        local v1165, v1166 = v0.writeTag(v1159, v1160, 3, v0.wireTypes.lengthDelimited);
        v1165, v1166 = v0.writeString(v1165, v1166, v1158.description);
        v1159 = v1165;
        v1160 = v1166;
    end;
    if v1158.cta_text ~= nil and v1158.cta_text ~= "" then
        local v1167, v1168 = v0.writeTag(v1159, v1160, 4, v0.wireTypes.lengthDelimited);
        v1167, v1168 = v0.writeString(v1167, v1168, v1158.cta_text);
        v1159 = v1167;
        v1160 = v1168;
    end;
    if v1158.prompt_id ~= nil and v1158.prompt_id ~= "" then
        local v1169, v1170 = v0.writeTag(v1159, v1160, 5, v0.wireTypes.lengthDelimited);
        v1169, v1170 = v0.writeString(v1169, v1170, v1158.prompt_id);
        v1159 = v1169;
        v1160 = v1170;
    end;
    if v1158.prompt_type ~= nil and v1158.prompt_type ~= "" then
        local v1171, v1172 = v0.writeTag(v1159, v1160, 6, v0.wireTypes.lengthDelimited);
        v1171, v1172 = v0.writeString(v1171, v1172, v1158.prompt_type);
        v1159 = v1171;
        v1160 = v1172;
    end;
    local v1173 = buffer.create(v1160);
    buffer.copy(v1173, 0, v1159, 0, v1160);
    return v1173;
end;
v4.decode = function(v1174) --[[ Line: 8238 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_40 (copy), v0 (copy)
    local v1175 = l_v4_40.new();
    local v1176 = 0;
    while v1176 < buffer.len(v1174) do
        local v1177 = nil;
        local v1178 = nil;
        local v1179, v1180, v1181 = v0.readTag(v1174, v1176);
        v1177 = v1179;
        v1178 = v1180;
        v1176 = v1181;
        if v1178 == v0.wireTypes.varint then
            v1179 = nil;
            v1180, v1181 = v0.readVarInt(v1174, v1176);
            v1179 = v1180;
            v1176 = v1181;
        elseif v1178 == v0.wireTypes.lengthDelimited then
            if v1177 == 1 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.title = buffer.tostring(v1179);
            elseif v1177 == 2 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.user_id = buffer.tostring(v1179);
            elseif v1177 == 3 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.description = buffer.tostring(v1179);
            elseif v1177 == 4 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.cta_text = buffer.tostring(v1179);
            elseif v1177 == 5 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.prompt_id = buffer.tostring(v1179);
            elseif v1177 == 6 then
                v1179 = nil;
                v1180, v1181 = v0.readBuffer(v1174, v1176);
                v1179 = v1180;
                v1176 = v1181;
                v1175.prompt_type = buffer.tostring(v1179);
            else
                v1179 = nil;
                v1180, v1181 = v0.readVarInt(v1174, v1176);
                v1176 = v1181 + v1180;
            end;
        elseif v1178 == v0.wireTypes.i32 then
            v1179 = nil;
            v1180, v1181 = v0.readFixed32(v1174, v1176);
            v1179 = v1180;
            v1176 = v1181;
        elseif v1178 == v0.wireTypes.i64 then
            v1179 = nil;
            v1180, v1181 = v0.readFixed64(v1174, v1176);
            v1179 = v1180;
            v1176 = v1181;
        else
            error("Unsupported wire type: " .. v1178);
        end;
    end;
    return v1175;
end;
v4.jsonEncode = function(v1182) --[[ Line: 8306 ]] --[[ Name: jsonEncode ]]
    local v1183 = {};
    if v1182.title ~= nil and v1182.title ~= "" then
        v1183.title = v1182.title;
    end;
    if v1182.user_id ~= nil and v1182.user_id ~= "" then
        v1183.userId = v1182.user_id;
    end;
    if v1182.description ~= nil and v1182.description ~= "" then
        v1183.description = v1182.description;
    end;
    if v1182.cta_text ~= nil and v1182.cta_text ~= "" then
        v1183.ctaText = v1182.cta_text;
    end;
    if v1182.prompt_id ~= nil and v1182.prompt_id ~= "" then
        v1183.promptId = v1182.prompt_id;
    end;
    if v1182.prompt_type ~= nil and v1182.prompt_type ~= "" then
        v1183.promptType = v1182.prompt_type;
    end;
    return v1183;
end;
v4.jsonDecode = function(v1184) --[[ Line: 8336 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_40 (copy)
    local v1185 = l_v4_40.new();
    if v1184.title ~= nil then
        v1185.title = v1184.title;
    end;
    if v1184.user_id ~= nil then
        v1185.user_id = v1184.user_id;
    end;
    if v1184.userId ~= nil then
        v1185.user_id = v1184.userId;
    end;
    if v1184.description ~= nil then
        v1185.description = v1184.description;
    end;
    if v1184.cta_text ~= nil then
        v1185.cta_text = v1184.cta_text;
    end;
    if v1184.ctaText ~= nil then
        v1185.cta_text = v1184.ctaText;
    end;
    if v1184.prompt_id ~= nil then
        v1185.prompt_id = v1184.prompt_id;
    end;
    if v1184.promptId ~= nil then
        v1185.prompt_id = v1184.promptId;
    end;
    if v1184.prompt_type ~= nil then
        v1185.prompt_type = v1184.prompt_type;
    end;
    if v1184.promptType ~= nil then
        v1185.prompt_type = v1184.promptType;
    end;
    return v1185;
end;
v4.descriptor = {
    name = "CardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
};
v2.CardInputData = v4;
v1.default:register(v2.CardInputData);
v4 = {};
v4.__index = v4;
local l_v4_41 = v4 --[[ copy: 4 -> 46 ]];
v4.new = function(_) --[[ Line: 8396 ]] --[[ Name: new ]]
    -- upvalues: l_v4_41 (copy)
    return (setmetatable({}, l_v4_41));
end;
v4.encode = function(_) --[[ Line: 8400 ]] --[[ Name: encode ]]
    local v1189 = buffer.create(0);
    local v1190 = buffer.create(0);
    buffer.copy(v1190, 0, v1189, 0, 0);
    return v1190;
end;
v4.decode = function(v1191) --[[ Line: 8409 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_41 (copy), v0 (copy)
    local v1192 = l_v4_41.new();
    local v1193 = 0;
    while v1193 < buffer.len(v1191) do
        local v1194 = nil;
        local v1195 = nil;
        local v1196, v1197, v1198 = v0.readTag(v1191, v1193);
        v1194 = v1196;
        v1195 = v1197;
        v1193 = v1198;
        if v1195 == v0.wireTypes.varint then
            v1196 = nil;
            v1197, v1198 = v0.readVarInt(v1191, v1193);
            v1196 = v1197;
            v1193 = v1198;
        elseif v1195 == v0.wireTypes.lengthDelimited then
            v1196 = nil;
            v1197, v1198 = v0.readVarInt(v1191, v1193);
            v1193 = v1198 + v1197;
        elseif v1195 == v0.wireTypes.i32 then
            v1196 = nil;
            v1197, v1198 = v0.readFixed32(v1191, v1193);
            v1196 = v1197;
            v1193 = v1198;
        elseif v1195 == v0.wireTypes.i64 then
            v1196 = nil;
            v1197, v1198 = v0.readFixed64(v1191, v1193);
            v1196 = v1197;
            v1193 = v1198;
        else
            error("Unsupported wire type: " .. v1195);
        end;
    end;
    return v1192;
end;
v4.jsonEncode = function(_) --[[ Line: 8447 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 8453 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_41 (copy)
    return (l_v4_41.new());
end;
v4.descriptor = {
    name = "DialogInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
};
v2.DialogInputData = v4;
v1.default:register(v2.DialogInputData);
v4 = {};
v4.__index = v4;
local l_v4_42 = v4 --[[ copy: 4 -> 47 ]];
v4.new = function(v1202) --[[ Line: 8473 ]] --[[ Name: new ]]
    -- upvalues: l_v4_42 (copy)
    return (setmetatable({
        title = (not (v1202 ~= nil) or v1202.title == nil) and "" or v1202.title, 
        description = (not (v1202 ~= nil) or v1202.description == nil) and "" or v1202.description, 
        primary_text = (not (v1202 ~= nil) or v1202.primary_text == nil) and "" or v1202.primary_text, 
        secondary_text = (not (v1202 ~= nil) or v1202.secondary_text == nil) and "" or v1202.secondary_text, 
        prompt_id = (not (v1202 ~= nil) or v1202.prompt_id == nil) and "" or v1202.prompt_id, 
        prompt_type = (not (v1202 ~= nil) or v1202.prompt_type == nil) and "" or v1202.prompt_type
    }, l_v4_42));
end;
v4.encode = function(v1203) --[[ Line: 8484 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1204 = buffer.create(0);
    local v1205 = 0;
    if v1203.title ~= nil and v1203.title ~= "" then
        local v1206, v1207 = v0.writeTag(v1204, v1205, 1, v0.wireTypes.lengthDelimited);
        v1206, v1207 = v0.writeString(v1206, v1207, v1203.title);
        v1204 = v1206;
        v1205 = v1207;
    end;
    if v1203.description ~= nil and v1203.description ~= "" then
        local v1208, v1209 = v0.writeTag(v1204, v1205, 2, v0.wireTypes.lengthDelimited);
        v1208, v1209 = v0.writeString(v1208, v1209, v1203.description);
        v1204 = v1208;
        v1205 = v1209;
    end;
    if v1203.primary_text ~= nil and v1203.primary_text ~= "" then
        local v1210, v1211 = v0.writeTag(v1204, v1205, 3, v0.wireTypes.lengthDelimited);
        v1210, v1211 = v0.writeString(v1210, v1211, v1203.primary_text);
        v1204 = v1210;
        v1205 = v1211;
    end;
    if v1203.secondary_text ~= nil and v1203.secondary_text ~= "" then
        local v1212, v1213 = v0.writeTag(v1204, v1205, 4, v0.wireTypes.lengthDelimited);
        v1212, v1213 = v0.writeString(v1212, v1213, v1203.secondary_text);
        v1204 = v1212;
        v1205 = v1213;
    end;
    if v1203.prompt_id ~= nil and v1203.prompt_id ~= "" then
        local v1214, v1215 = v0.writeTag(v1204, v1205, 5, v0.wireTypes.lengthDelimited);
        v1214, v1215 = v0.writeString(v1214, v1215, v1203.prompt_id);
        v1204 = v1214;
        v1205 = v1215;
    end;
    if v1203.prompt_type ~= nil and v1203.prompt_type ~= "" then
        local v1216, v1217 = v0.writeTag(v1204, v1205, 6, v0.wireTypes.lengthDelimited);
        v1216, v1217 = v0.writeString(v1216, v1217, v1203.prompt_type);
        v1204 = v1216;
        v1205 = v1217;
    end;
    local v1218 = buffer.create(v1205);
    buffer.copy(v1218, 0, v1204, 0, v1205);
    return v1218;
end;
v4.decode = function(v1219) --[[ Line: 8523 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_42 (copy), v0 (copy)
    local v1220 = l_v4_42.new();
    local v1221 = 0;
    while v1221 < buffer.len(v1219) do
        local v1222 = nil;
        local v1223 = nil;
        local v1224, v1225, v1226 = v0.readTag(v1219, v1221);
        v1222 = v1224;
        v1223 = v1225;
        v1221 = v1226;
        if v1223 == v0.wireTypes.varint then
            v1224 = nil;
            v1225, v1226 = v0.readVarInt(v1219, v1221);
            v1224 = v1225;
            v1221 = v1226;
        elseif v1223 == v0.wireTypes.lengthDelimited then
            if v1222 == 1 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.title = buffer.tostring(v1224);
            elseif v1222 == 2 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.description = buffer.tostring(v1224);
            elseif v1222 == 3 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.primary_text = buffer.tostring(v1224);
            elseif v1222 == 4 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.secondary_text = buffer.tostring(v1224);
            elseif v1222 == 5 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.prompt_id = buffer.tostring(v1224);
            elseif v1222 == 6 then
                v1224 = nil;
                v1225, v1226 = v0.readBuffer(v1219, v1221);
                v1224 = v1225;
                v1221 = v1226;
                v1220.prompt_type = buffer.tostring(v1224);
            else
                v1224 = nil;
                v1225, v1226 = v0.readVarInt(v1219, v1221);
                v1221 = v1226 + v1225;
            end;
        elseif v1223 == v0.wireTypes.i32 then
            v1224 = nil;
            v1225, v1226 = v0.readFixed32(v1219, v1221);
            v1224 = v1225;
            v1221 = v1226;
        elseif v1223 == v0.wireTypes.i64 then
            v1224 = nil;
            v1225, v1226 = v0.readFixed64(v1219, v1221);
            v1224 = v1225;
            v1221 = v1226;
        else
            error("Unsupported wire type: " .. v1223);
        end;
    end;
    return v1220;
end;
v4.jsonEncode = function(v1227) --[[ Line: 8591 ]] --[[ Name: jsonEncode ]]
    local v1228 = {};
    if v1227.title ~= nil and v1227.title ~= "" then
        v1228.title = v1227.title;
    end;
    if v1227.description ~= nil and v1227.description ~= "" then
        v1228.description = v1227.description;
    end;
    if v1227.primary_text ~= nil and v1227.primary_text ~= "" then
        v1228.primaryText = v1227.primary_text;
    end;
    if v1227.secondary_text ~= nil and v1227.secondary_text ~= "" then
        v1228.secondaryText = v1227.secondary_text;
    end;
    if v1227.prompt_id ~= nil and v1227.prompt_id ~= "" then
        v1228.promptId = v1227.prompt_id;
    end;
    if v1227.prompt_type ~= nil and v1227.prompt_type ~= "" then
        v1228.promptType = v1227.prompt_type;
    end;
    return v1228;
end;
v4.jsonDecode = function(v1229) --[[ Line: 8621 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_42 (copy)
    local v1230 = l_v4_42.new();
    if v1229.title ~= nil then
        v1230.title = v1229.title;
    end;
    if v1229.description ~= nil then
        v1230.description = v1229.description;
    end;
    if v1229.primary_text ~= nil then
        v1230.primary_text = v1229.primary_text;
    end;
    if v1229.primaryText ~= nil then
        v1230.primary_text = v1229.primaryText;
    end;
    if v1229.secondary_text ~= nil then
        v1230.secondary_text = v1229.secondary_text;
    end;
    if v1229.secondaryText ~= nil then
        v1230.secondary_text = v1229.secondaryText;
    end;
    if v1229.prompt_id ~= nil then
        v1230.prompt_id = v1229.prompt_id;
    end;
    if v1229.promptId ~= nil then
        v1230.prompt_id = v1229.promptId;
    end;
    if v1229.prompt_type ~= nil then
        v1230.prompt_type = v1229.prompt_type;
    end;
    if v1229.promptType ~= nil then
        v1230.prompt_type = v1229.promptType;
    end;
    return v1230;
end;
v4.descriptor = {
    name = "BannerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
};
v2.BannerInputData = v4;
v1.default:register(v2.BannerInputData);
v4 = {};
v4.__index = v4;
local l_v4_43 = v4 --[[ copy: 4 -> 48 ]];
v4.new = function(v1232) --[[ Line: 8681 ]] --[[ Name: new ]]
    -- upvalues: l_v4_43 (copy)
    return (setmetatable({
        tooltip_text = (not (v1232 ~= nil) or v1232.tooltip_text == nil) and "" or v1232.tooltip_text, 
        prompt_id = (not (v1232 ~= nil) or v1232.prompt_id == nil) and "" or v1232.prompt_id, 
        prompt_type = (not (v1232 ~= nil) or v1232.prompt_type == nil) and "" or v1232.prompt_type
    }, l_v4_43));
end;
v4.encode = function(v1233) --[[ Line: 8689 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1234 = buffer.create(0);
    local v1235 = 0;
    if v1233.tooltip_text ~= nil and v1233.tooltip_text ~= "" then
        local v1236, v1237 = v0.writeTag(v1234, v1235, 1, v0.wireTypes.lengthDelimited);
        v1236, v1237 = v0.writeString(v1236, v1237, v1233.tooltip_text);
        v1234 = v1236;
        v1235 = v1237;
    end;
    if v1233.prompt_id ~= nil and v1233.prompt_id ~= "" then
        local v1238, v1239 = v0.writeTag(v1234, v1235, 2, v0.wireTypes.lengthDelimited);
        v1238, v1239 = v0.writeString(v1238, v1239, v1233.prompt_id);
        v1234 = v1238;
        v1235 = v1239;
    end;
    if v1233.prompt_type ~= nil and v1233.prompt_type ~= "" then
        local v1240, v1241 = v0.writeTag(v1234, v1235, 3, v0.wireTypes.lengthDelimited);
        v1240, v1241 = v0.writeString(v1240, v1241, v1233.prompt_type);
        v1234 = v1240;
        v1235 = v1241;
    end;
    local v1242 = buffer.create(v1235);
    buffer.copy(v1242, 0, v1234, 0, v1235);
    return v1242;
end;
v4.decode = function(v1243) --[[ Line: 8713 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_43 (copy), v0 (copy)
    local v1244 = l_v4_43.new();
    local v1245 = 0;
    while v1245 < buffer.len(v1243) do
        local v1246 = nil;
        local v1247 = nil;
        local v1248, v1249, v1250 = v0.readTag(v1243, v1245);
        v1246 = v1248;
        v1247 = v1249;
        v1245 = v1250;
        if v1247 == v0.wireTypes.varint then
            v1248 = nil;
            v1249, v1250 = v0.readVarInt(v1243, v1245);
            v1248 = v1249;
            v1245 = v1250;
        elseif v1247 == v0.wireTypes.lengthDelimited then
            if v1246 == 1 then
                v1248 = nil;
                v1249, v1250 = v0.readBuffer(v1243, v1245);
                v1248 = v1249;
                v1245 = v1250;
                v1244.tooltip_text = buffer.tostring(v1248);
            elseif v1246 == 2 then
                v1248 = nil;
                v1249, v1250 = v0.readBuffer(v1243, v1245);
                v1248 = v1249;
                v1245 = v1250;
                v1244.prompt_id = buffer.tostring(v1248);
            elseif v1246 == 3 then
                v1248 = nil;
                v1249, v1250 = v0.readBuffer(v1243, v1245);
                v1248 = v1249;
                v1245 = v1250;
                v1244.prompt_type = buffer.tostring(v1248);
            else
                v1248 = nil;
                v1249, v1250 = v0.readVarInt(v1243, v1245);
                v1245 = v1250 + v1249;
            end;
        elseif v1247 == v0.wireTypes.i32 then
            v1248 = nil;
            v1249, v1250 = v0.readFixed32(v1243, v1245);
            v1248 = v1249;
            v1245 = v1250;
        elseif v1247 == v0.wireTypes.i64 then
            v1248 = nil;
            v1249, v1250 = v0.readFixed64(v1243, v1245);
            v1248 = v1249;
            v1245 = v1250;
        else
            error("Unsupported wire type: " .. v1247);
        end;
    end;
    return v1244;
end;
v4.jsonEncode = function(v1251) --[[ Line: 8766 ]] --[[ Name: jsonEncode ]]
    local v1252 = {};
    if v1251.tooltip_text ~= nil and v1251.tooltip_text ~= "" then
        v1252.tooltipText = v1251.tooltip_text;
    end;
    if v1251.prompt_id ~= nil and v1251.prompt_id ~= "" then
        v1252.promptId = v1251.prompt_id;
    end;
    if v1251.prompt_type ~= nil and v1251.prompt_type ~= "" then
        v1252.promptType = v1251.prompt_type;
    end;
    return v1252;
end;
v4.jsonDecode = function(v1253) --[[ Line: 8784 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_43 (copy)
    local v1254 = l_v4_43.new();
    if v1253.tooltip_text ~= nil then
        v1254.tooltip_text = v1253.tooltip_text;
    end;
    if v1253.tooltipText ~= nil then
        v1254.tooltip_text = v1253.tooltipText;
    end;
    if v1253.prompt_id ~= nil then
        v1254.prompt_id = v1253.prompt_id;
    end;
    if v1253.promptId ~= nil then
        v1254.prompt_id = v1253.promptId;
    end;
    if v1253.prompt_type ~= nil then
        v1254.prompt_type = v1253.prompt_type;
    end;
    if v1253.promptType ~= nil then
        v1254.prompt_type = v1253.promptType;
    end;
    return v1254;
end;
v4.descriptor = {
    name = "TooltipInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
};
v2.TooltipInputData = v4;
v1.default:register(v2.TooltipInputData);
v4 = {};
v4.__index = v4;
local l_v4_44 = v4 --[[ copy: 4 -> 49 ]];
v4.new = function(v1256) --[[ Line: 8828 ]] --[[ Name: new ]]
    -- upvalues: l_v4_44 (copy)
    return (setmetatable({
        media_id = (not (v1256 ~= nil) or v1256.media_id == nil) and "" or v1256.media_id, 
        title = (not (v1256 ~= nil) or v1256.title == nil) and "" or v1256.title, 
        description = (not (v1256 ~= nil) or v1256.description == nil) and "" or v1256.description, 
        prompt_id = (not (v1256 ~= nil) or v1256.prompt_id == nil) and "" or v1256.prompt_id, 
        prompt_type = (not (v1256 ~= nil) or v1256.prompt_type == nil) and "" or v1256.prompt_type, 
        anchor_tag = (not (v1256 ~= nil) or v1256.anchor_tag == nil) and "" or v1256.anchor_tag
    }, l_v4_44));
end;
v4.encode = function(v1257) --[[ Line: 8839 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1258 = buffer.create(0);
    local v1259 = 0;
    if v1257.media_id ~= nil and v1257.media_id ~= "" then
        local v1260, v1261 = v0.writeTag(v1258, v1259, 1, v0.wireTypes.lengthDelimited);
        v1260, v1261 = v0.writeString(v1260, v1261, v1257.media_id);
        v1258 = v1260;
        v1259 = v1261;
    end;
    if v1257.title ~= nil and v1257.title ~= "" then
        local v1262, v1263 = v0.writeTag(v1258, v1259, 2, v0.wireTypes.lengthDelimited);
        v1262, v1263 = v0.writeString(v1262, v1263, v1257.title);
        v1258 = v1262;
        v1259 = v1263;
    end;
    if v1257.description ~= nil and v1257.description ~= "" then
        local v1264, v1265 = v0.writeTag(v1258, v1259, 3, v0.wireTypes.lengthDelimited);
        v1264, v1265 = v0.writeString(v1264, v1265, v1257.description);
        v1258 = v1264;
        v1259 = v1265;
    end;
    if v1257.prompt_id ~= nil and v1257.prompt_id ~= "" then
        local v1266, v1267 = v0.writeTag(v1258, v1259, 4, v0.wireTypes.lengthDelimited);
        v1266, v1267 = v0.writeString(v1266, v1267, v1257.prompt_id);
        v1258 = v1266;
        v1259 = v1267;
    end;
    if v1257.prompt_type ~= nil and v1257.prompt_type ~= "" then
        local v1268, v1269 = v0.writeTag(v1258, v1259, 5, v0.wireTypes.lengthDelimited);
        v1268, v1269 = v0.writeString(v1268, v1269, v1257.prompt_type);
        v1258 = v1268;
        v1259 = v1269;
    end;
    if v1257.anchor_tag ~= nil and v1257.anchor_tag ~= "" then
        local v1270, v1271 = v0.writeTag(v1258, v1259, 6, v0.wireTypes.lengthDelimited);
        v1270, v1271 = v0.writeString(v1270, v1271, v1257.anchor_tag);
        v1258 = v1270;
        v1259 = v1271;
    end;
    local v1272 = buffer.create(v1259);
    buffer.copy(v1272, 0, v1258, 0, v1259);
    return v1272;
end;
v4.decode = function(v1273) --[[ Line: 8878 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_44 (copy), v0 (copy)
    local v1274 = l_v4_44.new();
    local v1275 = 0;
    while v1275 < buffer.len(v1273) do
        local v1276 = nil;
        local v1277 = nil;
        local v1278, v1279, v1280 = v0.readTag(v1273, v1275);
        v1276 = v1278;
        v1277 = v1279;
        v1275 = v1280;
        if v1277 == v0.wireTypes.varint then
            v1278 = nil;
            v1279, v1280 = v0.readVarInt(v1273, v1275);
            v1278 = v1279;
            v1275 = v1280;
        elseif v1277 == v0.wireTypes.lengthDelimited then
            if v1276 == 1 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.media_id = buffer.tostring(v1278);
            elseif v1276 == 2 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.title = buffer.tostring(v1278);
            elseif v1276 == 3 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.description = buffer.tostring(v1278);
            elseif v1276 == 4 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.prompt_id = buffer.tostring(v1278);
            elseif v1276 == 5 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.prompt_type = buffer.tostring(v1278);
            elseif v1276 == 6 then
                v1278 = nil;
                v1279, v1280 = v0.readBuffer(v1273, v1275);
                v1278 = v1279;
                v1275 = v1280;
                v1274.anchor_tag = buffer.tostring(v1278);
            else
                v1278 = nil;
                v1279, v1280 = v0.readVarInt(v1273, v1275);
                v1275 = v1280 + v1279;
            end;
        elseif v1277 == v0.wireTypes.i32 then
            v1278 = nil;
            v1279, v1280 = v0.readFixed32(v1273, v1275);
            v1278 = v1279;
            v1275 = v1280;
        elseif v1277 == v0.wireTypes.i64 then
            v1278 = nil;
            v1279, v1280 = v0.readFixed64(v1273, v1275);
            v1278 = v1279;
            v1275 = v1280;
        else
            error("Unsupported wire type: " .. v1277);
        end;
    end;
    return v1274;
end;
v4.jsonEncode = function(v1281) --[[ Line: 8946 ]] --[[ Name: jsonEncode ]]
    local v1282 = {};
    if v1281.media_id ~= nil and v1281.media_id ~= "" then
        v1282.mediaId = v1281.media_id;
    end;
    if v1281.title ~= nil and v1281.title ~= "" then
        v1282.title = v1281.title;
    end;
    if v1281.description ~= nil and v1281.description ~= "" then
        v1282.description = v1281.description;
    end;
    if v1281.prompt_id ~= nil and v1281.prompt_id ~= "" then
        v1282.promptId = v1281.prompt_id;
    end;
    if v1281.prompt_type ~= nil and v1281.prompt_type ~= "" then
        v1282.promptType = v1281.prompt_type;
    end;
    if v1281.anchor_tag ~= nil and v1281.anchor_tag ~= "" then
        v1282.anchorTag = v1281.anchor_tag;
    end;
    return v1282;
end;
v4.jsonDecode = function(v1283) --[[ Line: 8976 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_44 (copy)
    local v1284 = l_v4_44.new();
    if v1283.media_id ~= nil then
        v1284.media_id = v1283.media_id;
    end;
    if v1283.mediaId ~= nil then
        v1284.media_id = v1283.mediaId;
    end;
    if v1283.title ~= nil then
        v1284.title = v1283.title;
    end;
    if v1283.description ~= nil then
        v1284.description = v1283.description;
    end;
    if v1283.prompt_id ~= nil then
        v1284.prompt_id = v1283.prompt_id;
    end;
    if v1283.promptId ~= nil then
        v1284.prompt_id = v1283.promptId;
    end;
    if v1283.prompt_type ~= nil then
        v1284.prompt_type = v1283.prompt_type;
    end;
    if v1283.promptType ~= nil then
        v1284.prompt_type = v1283.promptType;
    end;
    if v1283.anchor_tag ~= nil then
        v1284.anchor_tag = v1283.anchor_tag;
    end;
    if v1283.anchorTag ~= nil then
        v1284.anchor_tag = v1283.anchorTag;
    end;
    return v1284;
end;
v4.descriptor = {
    name = "CoachmarkInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
};
v2.CoachmarkInputData = v4;
v1.default:register(v2.CoachmarkInputData);
v4 = {};
v4.__index = v4;
local l_v4_45 = v4 --[[ copy: 4 -> 50 ]];
v4.new = function(v1286) --[[ Line: 9036 ]] --[[ Name: new ]]
    -- upvalues: l_v4_45 (copy)
    return (setmetatable({
        event_id = (not (v1286 ~= nil) or v1286.event_id == nil) and "" or v1286.event_id, 
        entry_map = if not (v1286 ~= nil) or v1286.entry_map == nil then {} else v1286.entry_map, 
        entry_order = if not (v1286 ~= nil) or v1286.entry_order == nil then {} else v1286.entry_order
    }, l_v4_45));
end;
v4.encode = function(v1287) --[[ Line: 9046 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1288 = buffer.create(0);
    local v1289 = 0;
    if v1287.event_id ~= nil and v1287.event_id ~= "" then
        local v1290, v1291 = v0.writeTag(v1288, v1289, 1, v0.wireTypes.lengthDelimited);
        v1290, v1291 = v0.writeString(v1290, v1291, v1287.event_id);
        v1288 = v1290;
        v1289 = v1291;
    end;
    if v1287.entry_map ~= nil and next(v1287.entry_map) ~= nil then
        for v1292, v1293 in v1287.entry_map do
            local v1294 = buffer.create(0);
            local v1295, v1296 = v0.writeTag(v1294, 0, 1, v0.wireTypes.lengthDelimited);
            v1295, v1296 = v0.writeString(v1295, v1296, v1292);
            v1294 = v1295;
            local l_v1296_0 = v1296;
            v1295 = v1293:encode();
            local v1298;
            v1296, v1298 = v0.writeTag(v1294, l_v1296_0, 2, v0.wireTypes.lengthDelimited);
            v1296, v1298 = v0.writeBuffer(v1296, v1298, v1295, buffer.len(v1295));
            v1294 = v1296;
            l_v1296_0 = v1298;
            v1296, v1298 = v0.writeTag(v1288, v1289, 3, v0.wireTypes.lengthDelimited);
            v1296, v1298 = v0.writeBuffer(v1296, v1298, v1294, l_v1296_0);
            v1288 = v1296;
            v1289 = v1298;
        end;
    end;
    if v1287.entry_order ~= nil and #v1287.entry_order > 0 then
        for _, v1300 in v1287.entry_order do
            local v1301, v1302 = v0.writeTag(v1288, v1289, 4, v0.wireTypes.lengthDelimited);
            v1301, v1302 = v0.writeString(v1301, v1302, v1300);
            v1288 = v1301;
            v1289 = v1302;
        end;
    end;
    local v1303 = buffer.create(v1289);
    buffer.copy(v1303, 0, v1288, 0, v1289);
    return v1303;
end;
v4.decode = function(v1304) --[[ Line: 9081 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_45 (copy), v0 (copy), v2 (copy)
    local v1305 = l_v4_45.new();
    local v1306 = 0;
    while v1306 < buffer.len(v1304) do
        local v1307 = nil;
        local v1308 = nil;
        local v1309, v1310, v1311 = v0.readTag(v1304, v1306);
        v1307 = v1309;
        v1308 = v1310;
        v1306 = v1311;
        if v1308 == v0.wireTypes.varint then
            v1309 = nil;
            v1310, v1311 = v0.readVarInt(v1304, v1306);
            v1309 = v1310;
            v1306 = v1311;
        elseif v1308 == v0.wireTypes.lengthDelimited then
            if v1307 == 1 then
                v1309 = nil;
                v1310, v1311 = v0.readBuffer(v1304, v1306);
                v1309 = v1310;
                v1306 = v1311;
                v1305.event_id = buffer.tostring(v1309);
            elseif v1307 == 3 then
                v1309 = nil;
                v1310, v1311 = v0.readBuffer(v1304, v1306);
                v1309 = v1310;
                v1306 = v1311;
                v1310 = v2.EventDetailsFeedInputData_EntryMapEntry.decode(v1309);
                v1311 = v2.FeedEntry.new();
                v1305.entry_map[v1310.key or ""] = v1310.value or v1311;
            elseif v1307 == 4 then
                v1309 = nil;
                v1310, v1311 = v0.readBuffer(v1304, v1306);
                v1309 = v1310;
                v1306 = v1311;
                table.insert(v1305.entry_order, buffer.tostring(v1309));
            else
                v1309 = nil;
                v1310, v1311 = v0.readVarInt(v1304, v1306);
                v1306 = v1311 + v1310;
            end;
        elseif v1308 == v0.wireTypes.i32 then
            v1309 = nil;
            v1310, v1311 = v0.readFixed32(v1304, v1306);
            v1309 = v1310;
            v1306 = v1311;
        elseif v1308 == v0.wireTypes.i64 then
            v1309 = nil;
            v1310, v1311 = v0.readFixed64(v1304, v1306);
            v1309 = v1310;
            v1306 = v1311;
        else
            error("Unsupported wire type: " .. v1308);
        end;
    end;
    return v1305;
end;
v4.jsonEncode = function(v1312) --[[ Line: 9141 ]] --[[ Name: jsonEncode ]]
    local v1313 = {};
    if v1312.event_id ~= nil and v1312.event_id ~= "" then
        v1313.eventId = v1312.event_id;
    end;
    if v1312.entry_map ~= nil and next(v1312.entry_map) ~= nil then
        local v1314 = {};
        for v1315, v1316 in v1312.entry_map do
            v1314[v1315] = v1316:jsonEncode();
        end;
        v1313.entryMap = v1314;
    end;
    if v1312.entry_order ~= nil and #v1312.entry_order > 0 then
        local v1317 = {};
        for _, v1319 in v1312.entry_order do
            table.insert(v1317, v1319);
        end;
        v1313.entryOrder = v1317;
    end;
    return v1313;
end;
v4.jsonDecode = function(v1320) --[[ Line: 9167 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_45 (copy), v2 (copy)
    local v1321 = l_v4_45.new();
    if v1320.event_id ~= nil then
        v1321.event_id = v1320.event_id;
    end;
    if v1320.eventId ~= nil then
        v1321.event_id = v1320.eventId;
    end;
    if v1320.entry_map ~= nil then
        local v1322 = {};
        for v1323, v1324 in v1320.entry_map do
            v1322[v1323] = v2.FeedEntry.jsonDecode(v1324);
        end;
        v1321.entry_map = v1322;
    end;
    if v1320.entryMap ~= nil then
        local v1325 = {};
        for v1326, v1327 in v1320.entryMap do
            v1325[v1326] = v2.FeedEntry.jsonDecode(v1327);
        end;
        v1321.entry_map = v1325;
    end;
    if v1320.entry_order ~= nil then
        local v1328 = {};
        for _, v1330 in v1320.entry_order do
            table.insert(v1328, v1330);
        end;
        v1321.entry_order = v1328;
    end;
    if v1320.entryOrder ~= nil then
        local v1331 = {};
        for _, v1333 in v1320.entryOrder do
            table.insert(v1331, v1333);
        end;
        v1321.entry_order = v1331;
    end;
    return v1321;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
};
v2.EventDetailsFeedInputData = v4;
v1.default:register(v2.EventDetailsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_46 = v4 --[[ copy: 4 -> 51 ]];
v4.new = function(v1335) --[[ Line: 9231 ]] --[[ Name: new ]]
    -- upvalues: l_v4_46 (copy)
    return (setmetatable({
        key = (not (v1335 ~= nil) or v1335.key == nil) and "" or v1335.key, 
        value = if not (v1335 ~= nil) or v1335.value == nil then nil else v1335.value
    }, l_v4_46));
end;
v4.encode = function(v1336) --[[ Line: 9240 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1337 = buffer.create(0);
    local v1338 = 0;
    if v1336.key ~= nil and v1336.key ~= "" then
        local v1339, v1340 = v0.writeTag(v1337, v1338, 1, v0.wireTypes.lengthDelimited);
        v1339, v1340 = v0.writeString(v1339, v1340, v1336.key);
        v1337 = v1339;
        v1338 = v1340;
    end;
    if v1336.value ~= nil then
        local v1341 = v1336.value:encode();
        local v1342, v1343 = v0.writeTag(v1337, v1338, 2, v0.wireTypes.lengthDelimited);
        v1342, v1343 = v0.writeBuffer(v1342, v1343, v1341, buffer.len(v1341));
        v1337 = v1342;
        v1338 = v1343;
    end;
    local v1344 = buffer.create(v1338);
    buffer.copy(v1344, 0, v1337, 0, v1338);
    return v1344;
end;
v4.decode = function(v1345) --[[ Line: 9260 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_46 (copy), v0 (copy), v2 (copy)
    local v1346 = l_v4_46.new();
    local v1347 = 0;
    while v1347 < buffer.len(v1345) do
        local v1348 = nil;
        local v1349 = nil;
        local v1350, v1351, v1352 = v0.readTag(v1345, v1347);
        v1348 = v1350;
        v1349 = v1351;
        v1347 = v1352;
        if v1349 == v0.wireTypes.varint then
            v1350 = nil;
            v1351, v1352 = v0.readVarInt(v1345, v1347);
            v1350 = v1351;
            v1347 = v1352;
        elseif v1349 == v0.wireTypes.lengthDelimited then
            if v1348 == 1 then
                v1350 = nil;
                v1351, v1352 = v0.readBuffer(v1345, v1347);
                v1350 = v1351;
                v1347 = v1352;
                v1346.key = buffer.tostring(v1350);
            elseif v1348 == 2 then
                v1350 = nil;
                v1351, v1352 = v0.readBuffer(v1345, v1347);
                v1350 = v1351;
                v1347 = v1352;
                v1346.value = v2.FeedEntry.decode(v1350);
            else
                v1350 = nil;
                v1351, v1352 = v0.readVarInt(v1345, v1347);
                v1347 = v1352 + v1351;
            end;
        elseif v1349 == v0.wireTypes.i32 then
            v1350 = nil;
            v1351, v1352 = v0.readFixed32(v1345, v1347);
            v1350 = v1351;
            v1347 = v1352;
        elseif v1349 == v0.wireTypes.i64 then
            v1350 = nil;
            v1351, v1352 = v0.readFixed64(v1345, v1347);
            v1350 = v1351;
            v1347 = v1352;
        else
            error("Unsupported wire type: " .. v1349);
        end;
    end;
    return v1346;
end;
v4.jsonEncode = function(v1353) --[[ Line: 9308 ]] --[[ Name: jsonEncode ]]
    local v1354 = {};
    if v1353.key ~= nil and v1353.key ~= "" then
        v1354.key = v1353.key;
    end;
    if v1353.value ~= nil then
        v1354.value = v1353.value:jsonEncode();
    end;
    return v1354;
end;
v4.jsonDecode = function(v1355) --[[ Line: 9322 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_46 (copy), v2 (copy)
    local v1356 = l_v4_46.new();
    if v1355.key ~= nil then
        v1356.key = v1355.key;
    end;
    if v1355.value ~= nil then
        v1356.value = v2.FeedEntry.jsonDecode(v1355.value);
    end;
    return v1356;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.EventDetailsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.EventDetailsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_47 = v4 --[[ copy: 4 -> 52 ]];
v4.new = function(v1358) --[[ Line: 9352 ]] --[[ Name: new ]]
    -- upvalues: l_v4_47 (copy)
    return (setmetatable({
        event_id = (not (v1358 ~= nil) or v1358.event_id == nil) and "" or v1358.event_id, 
        universe_id = (not (v1358 ~= nil) or v1358.universe_id == nil) and "" or v1358.universe_id
    }, l_v4_47));
end;
v4.encode = function(v1359) --[[ Line: 9361 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1360 = buffer.create(0);
    local v1361 = 0;
    if v1359.event_id ~= nil and v1359.event_id ~= "" then
        local v1362, v1363 = v0.writeTag(v1360, v1361, 1, v0.wireTypes.lengthDelimited);
        v1362, v1363 = v0.writeString(v1362, v1363, v1359.event_id);
        v1360 = v1362;
        v1361 = v1363;
    end;
    if v1359.universe_id ~= nil and v1359.universe_id ~= "" then
        local v1364, v1365 = v0.writeTag(v1360, v1361, 2, v0.wireTypes.lengthDelimited);
        v1364, v1365 = v0.writeString(v1364, v1365, v1359.universe_id);
        v1360 = v1364;
        v1361 = v1365;
    end;
    local v1366 = buffer.create(v1361);
    buffer.copy(v1366, 0, v1360, 0, v1361);
    return v1366;
end;
v4.decode = function(v1367) --[[ Line: 9380 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_47 (copy), v0 (copy)
    local v1368 = l_v4_47.new();
    local v1369 = 0;
    while v1369 < buffer.len(v1367) do
        local v1370 = nil;
        local v1371 = nil;
        local v1372, v1373, v1374 = v0.readTag(v1367, v1369);
        v1370 = v1372;
        v1371 = v1373;
        v1369 = v1374;
        if v1371 == v0.wireTypes.varint then
            v1372 = nil;
            v1373, v1374 = v0.readVarInt(v1367, v1369);
            v1372 = v1373;
            v1369 = v1374;
        elseif v1371 == v0.wireTypes.lengthDelimited then
            if v1370 == 1 then
                v1372 = nil;
                v1373, v1374 = v0.readBuffer(v1367, v1369);
                v1372 = v1373;
                v1369 = v1374;
                v1368.event_id = buffer.tostring(v1372);
            elseif v1370 == 2 then
                v1372 = nil;
                v1373, v1374 = v0.readBuffer(v1367, v1369);
                v1372 = v1373;
                v1369 = v1374;
                v1368.universe_id = buffer.tostring(v1372);
            else
                v1372 = nil;
                v1373, v1374 = v0.readVarInt(v1367, v1369);
                v1369 = v1374 + v1373;
            end;
        elseif v1371 == v0.wireTypes.i32 then
            v1372 = nil;
            v1373, v1374 = v0.readFixed32(v1367, v1369);
            v1372 = v1373;
            v1369 = v1374;
        elseif v1371 == v0.wireTypes.i64 then
            v1372 = nil;
            v1373, v1374 = v0.readFixed64(v1367, v1369);
            v1372 = v1373;
            v1369 = v1374;
        else
            error("Unsupported wire type: " .. v1371);
        end;
    end;
    return v1368;
end;
v4.jsonEncode = function(v1375) --[[ Line: 9428 ]] --[[ Name: jsonEncode ]]
    local v1376 = {};
    if v1375.event_id ~= nil and v1375.event_id ~= "" then
        v1376.eventId = v1375.event_id;
    end;
    if v1375.universe_id ~= nil and v1375.universe_id ~= "" then
        v1376.universeId = v1375.universe_id;
    end;
    return v1376;
end;
v4.jsonDecode = function(v1377) --[[ Line: 9442 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_47 (copy)
    local v1378 = l_v4_47.new();
    if v1377.event_id ~= nil then
        v1378.event_id = v1377.event_id;
    end;
    if v1377.eventId ~= nil then
        v1378.event_id = v1377.eventId;
    end;
    if v1377.universe_id ~= nil then
        v1378.universe_id = v1377.universe_id;
    end;
    if v1377.universeId ~= nil then
        v1378.universe_id = v1377.universeId;
    end;
    return v1378;
end;
v4.descriptor = {
    name = "EventDetailsActionBarInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
};
v2.EventDetailsActionBarInputData = v4;
v1.default:register(v2.EventDetailsActionBarInputData);
v4 = {};
v4.__index = v4;
local l_v4_48 = v4 --[[ copy: 4 -> 53 ]];
v4.new = function(v1380) --[[ Line: 9478 ]] --[[ Name: new ]]
    -- upvalues: l_v4_48 (copy)
    return (setmetatable({
        entry_map = if not (v1380 ~= nil) or v1380.entry_map == nil then {} else v1380.entry_map, 
        entry_order = if not (v1380 ~= nil) or v1380.entry_order == nil then {} else v1380.entry_order, 
        next_page_token = (not (v1380 ~= nil) or v1380.next_page_token == nil) and "" or v1380.next_page_token
    }, l_v4_48));
end;
v4.encode = function(v1381) --[[ Line: 9486 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1382 = buffer.create(0);
    local v1383 = 0;
    if v1381.entry_map ~= nil and next(v1381.entry_map) ~= nil then
        for v1384, v1385 in v1381.entry_map do
            local v1386 = buffer.create(0);
            local v1387, v1388 = v0.writeTag(v1386, 0, 1, v0.wireTypes.lengthDelimited);
            v1387, v1388 = v0.writeString(v1387, v1388, v1384);
            v1386 = v1387;
            local l_v1388_0 = v1388;
            v1387 = v1385:encode();
            local v1390;
            v1388, v1390 = v0.writeTag(v1386, l_v1388_0, 2, v0.wireTypes.lengthDelimited);
            v1388, v1390 = v0.writeBuffer(v1388, v1390, v1387, buffer.len(v1387));
            v1386 = v1388;
            l_v1388_0 = v1390;
            v1388, v1390 = v0.writeTag(v1382, v1383, 1, v0.wireTypes.lengthDelimited);
            v1388, v1390 = v0.writeBuffer(v1388, v1390, v1386, l_v1388_0);
            v1382 = v1388;
            v1383 = v1390;
        end;
    end;
    if v1381.entry_order ~= nil and #v1381.entry_order > 0 then
        for _, v1392 in v1381.entry_order do
            local v1393, v1394 = v0.writeTag(v1382, v1383, 2, v0.wireTypes.lengthDelimited);
            v1393, v1394 = v0.writeString(v1393, v1394, v1392);
            v1382 = v1393;
            v1383 = v1394;
        end;
    end;
    if v1381.next_page_token ~= nil and v1381.next_page_token ~= "" then
        local v1395, v1396 = v0.writeTag(v1382, v1383, 3, v0.wireTypes.lengthDelimited);
        v1395, v1396 = v0.writeString(v1395, v1396, v1381.next_page_token);
        v1382 = v1395;
        v1383 = v1396;
    end;
    local v1397 = buffer.create(v1383);
    buffer.copy(v1397, 0, v1382, 0, v1383);
    return v1397;
end;
v4.decode = function(v1398) --[[ Line: 9521 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_48 (copy), v0 (copy), v2 (copy)
    local v1399 = l_v4_48.new();
    local v1400 = 0;
    while v1400 < buffer.len(v1398) do
        local v1401 = nil;
        local v1402 = nil;
        local v1403, v1404, v1405 = v0.readTag(v1398, v1400);
        v1401 = v1403;
        v1402 = v1404;
        v1400 = v1405;
        if v1402 == v0.wireTypes.varint then
            v1403 = nil;
            v1404, v1405 = v0.readVarInt(v1398, v1400);
            v1403 = v1404;
            v1400 = v1405;
        elseif v1402 == v0.wireTypes.lengthDelimited then
            if v1401 == 1 then
                v1403 = nil;
                v1404, v1405 = v0.readBuffer(v1398, v1400);
                v1403 = v1404;
                v1400 = v1405;
                v1404 = v2.ChartsFeedInputData_EntryMapEntry.decode(v1403);
                v1405 = v2.FeedEntry.new();
                v1399.entry_map[v1404.key or ""] = v1404.value or v1405;
            elseif v1401 == 2 then
                v1403 = nil;
                v1404, v1405 = v0.readBuffer(v1398, v1400);
                v1403 = v1404;
                v1400 = v1405;
                table.insert(v1399.entry_order, buffer.tostring(v1403));
            elseif v1401 == 3 then
                v1403 = nil;
                v1404, v1405 = v0.readBuffer(v1398, v1400);
                v1403 = v1404;
                v1400 = v1405;
                v1399.next_page_token = buffer.tostring(v1403);
            else
                v1403 = nil;
                v1404, v1405 = v0.readVarInt(v1398, v1400);
                v1400 = v1405 + v1404;
            end;
        elseif v1402 == v0.wireTypes.i32 then
            v1403 = nil;
            v1404, v1405 = v0.readFixed32(v1398, v1400);
            v1403 = v1404;
            v1400 = v1405;
        elseif v1402 == v0.wireTypes.i64 then
            v1403 = nil;
            v1404, v1405 = v0.readFixed64(v1398, v1400);
            v1403 = v1404;
            v1400 = v1405;
        else
            error("Unsupported wire type: " .. v1402);
        end;
    end;
    return v1399;
end;
v4.jsonEncode = function(v1406) --[[ Line: 9581 ]] --[[ Name: jsonEncode ]]
    local v1407 = {};
    if v1406.entry_map ~= nil and next(v1406.entry_map) ~= nil then
        local v1408 = {};
        for v1409, v1410 in v1406.entry_map do
            v1408[v1409] = v1410:jsonEncode();
        end;
        v1407.entryMap = v1408;
    end;
    if v1406.entry_order ~= nil and #v1406.entry_order > 0 then
        local v1411 = {};
        for _, v1413 in v1406.entry_order do
            table.insert(v1411, v1413);
        end;
        v1407.entryOrder = v1411;
    end;
    if v1406.next_page_token ~= nil and v1406.next_page_token ~= "" then
        v1407.nextPageToken = v1406.next_page_token;
    end;
    return v1407;
end;
v4.jsonDecode = function(v1414) --[[ Line: 9607 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_48 (copy), v2 (copy)
    local v1415 = l_v4_48.new();
    if v1414.entry_map ~= nil then
        local v1416 = {};
        for v1417, v1418 in v1414.entry_map do
            v1416[v1417] = v2.FeedEntry.jsonDecode(v1418);
        end;
        v1415.entry_map = v1416;
    end;
    if v1414.entryMap ~= nil then
        local v1419 = {};
        for v1420, v1421 in v1414.entryMap do
            v1419[v1420] = v2.FeedEntry.jsonDecode(v1421);
        end;
        v1415.entry_map = v1419;
    end;
    if v1414.entry_order ~= nil then
        local v1422 = {};
        for _, v1424 in v1414.entry_order do
            table.insert(v1422, v1424);
        end;
        v1415.entry_order = v1422;
    end;
    if v1414.entryOrder ~= nil then
        local v1425 = {};
        for _, v1427 in v1414.entryOrder do
            table.insert(v1425, v1427);
        end;
        v1415.entry_order = v1425;
    end;
    if v1414.next_page_token ~= nil then
        v1415.next_page_token = v1414.next_page_token;
    end;
    if v1414.nextPageToken ~= nil then
        v1415.next_page_token = v1414.nextPageToken;
    end;
    return v1415;
end;
v4.descriptor = {
    name = "ChartsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
};
v2.ChartsFeedInputData = v4;
v1.default:register(v2.ChartsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_49 = v4 --[[ copy: 4 -> 54 ]];
v4.new = function(v1429) --[[ Line: 9671 ]] --[[ Name: new ]]
    -- upvalues: l_v4_49 (copy)
    return (setmetatable({
        key = (not (v1429 ~= nil) or v1429.key == nil) and "" or v1429.key, 
        value = if not (v1429 ~= nil) or v1429.value == nil then nil else v1429.value
    }, l_v4_49));
end;
v4.encode = function(v1430) --[[ Line: 9680 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1431 = buffer.create(0);
    local v1432 = 0;
    if v1430.key ~= nil and v1430.key ~= "" then
        local v1433, v1434 = v0.writeTag(v1431, v1432, 1, v0.wireTypes.lengthDelimited);
        v1433, v1434 = v0.writeString(v1433, v1434, v1430.key);
        v1431 = v1433;
        v1432 = v1434;
    end;
    if v1430.value ~= nil then
        local v1435 = v1430.value:encode();
        local v1436, v1437 = v0.writeTag(v1431, v1432, 2, v0.wireTypes.lengthDelimited);
        v1436, v1437 = v0.writeBuffer(v1436, v1437, v1435, buffer.len(v1435));
        v1431 = v1436;
        v1432 = v1437;
    end;
    local v1438 = buffer.create(v1432);
    buffer.copy(v1438, 0, v1431, 0, v1432);
    return v1438;
end;
v4.decode = function(v1439) --[[ Line: 9700 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_49 (copy), v0 (copy), v2 (copy)
    local v1440 = l_v4_49.new();
    local v1441 = 0;
    while v1441 < buffer.len(v1439) do
        local v1442 = nil;
        local v1443 = nil;
        local v1444, v1445, v1446 = v0.readTag(v1439, v1441);
        v1442 = v1444;
        v1443 = v1445;
        v1441 = v1446;
        if v1443 == v0.wireTypes.varint then
            v1444 = nil;
            v1445, v1446 = v0.readVarInt(v1439, v1441);
            v1444 = v1445;
            v1441 = v1446;
        elseif v1443 == v0.wireTypes.lengthDelimited then
            if v1442 == 1 then
                v1444 = nil;
                v1445, v1446 = v0.readBuffer(v1439, v1441);
                v1444 = v1445;
                v1441 = v1446;
                v1440.key = buffer.tostring(v1444);
            elseif v1442 == 2 then
                v1444 = nil;
                v1445, v1446 = v0.readBuffer(v1439, v1441);
                v1444 = v1445;
                v1441 = v1446;
                v1440.value = v2.FeedEntry.decode(v1444);
            else
                v1444 = nil;
                v1445, v1446 = v0.readVarInt(v1439, v1441);
                v1441 = v1446 + v1445;
            end;
        elseif v1443 == v0.wireTypes.i32 then
            v1444 = nil;
            v1445, v1446 = v0.readFixed32(v1439, v1441);
            v1444 = v1445;
            v1441 = v1446;
        elseif v1443 == v0.wireTypes.i64 then
            v1444 = nil;
            v1445, v1446 = v0.readFixed64(v1439, v1441);
            v1444 = v1445;
            v1441 = v1446;
        else
            error("Unsupported wire type: " .. v1443);
        end;
    end;
    return v1440;
end;
v4.jsonEncode = function(v1447) --[[ Line: 9748 ]] --[[ Name: jsonEncode ]]
    local v1448 = {};
    if v1447.key ~= nil and v1447.key ~= "" then
        v1448.key = v1447.key;
    end;
    if v1447.value ~= nil then
        v1448.value = v1447.value:jsonEncode();
    end;
    return v1448;
end;
v4.jsonDecode = function(v1449) --[[ Line: 9762 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_49 (copy), v2 (copy)
    local v1450 = l_v4_49.new();
    if v1449.key ~= nil then
        v1450.key = v1449.key;
    end;
    if v1449.value ~= nil then
        v1450.value = v2.FeedEntry.jsonDecode(v1449.value);
    end;
    return v1450;
end;
v4.descriptor = {
    name = "ChartsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.ChartsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.ChartsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_50 = v4 --[[ copy: 4 -> 55 ]];
v4.new = function(v1452) --[[ Line: 9792 ]] --[[ Name: new ]]
    -- upvalues: l_v4_50 (copy)
    return (setmetatable({
        filter_groups = if not (v1452 ~= nil) or v1452.filter_groups == nil then {} else v1452.filter_groups
    }, l_v4_50));
end;
v4.encode = function(v1453) --[[ Line: 9798 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1454 = buffer.create(0);
    local v1455 = 0;
    if v1453.filter_groups ~= nil and #v1453.filter_groups > 0 then
        for _, v1457 in v1453.filter_groups do
            local v1458 = v1457:encode();
            local v1459, v1460 = v0.writeTag(v1454, v1455, 1, v0.wireTypes.lengthDelimited);
            v1459, v1460 = v0.writeBuffer(v1459, v1460, v1458, buffer.len(v1458));
            v1454 = v1459;
            v1455 = v1460;
        end;
    end;
    local v1461 = buffer.create(v1455);
    buffer.copy(v1461, 0, v1454, 0, v1455);
    return v1461;
end;
v4.decode = function(v1462) --[[ Line: 9815 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_50 (copy), v0 (copy), v2 (copy)
    local v1463 = l_v4_50.new();
    local v1464 = 0;
    while v1464 < buffer.len(v1462) do
        local v1465 = nil;
        local v1466 = nil;
        local v1467, v1468, v1469 = v0.readTag(v1462, v1464);
        v1465 = v1467;
        v1466 = v1468;
        v1464 = v1469;
        if v1466 == v0.wireTypes.varint then
            v1467 = nil;
            v1468, v1469 = v0.readVarInt(v1462, v1464);
            v1467 = v1468;
            v1464 = v1469;
        elseif v1466 == v0.wireTypes.lengthDelimited then
            if v1465 == 1 then
                v1467 = nil;
                v1468, v1469 = v0.readBuffer(v1462, v1464);
                v1467 = v1468;
                v1464 = v1469;
                table.insert(v1463.filter_groups, v2.FilterPillsInputData_FilterGroup.decode(v1467));
            else
                v1467 = nil;
                v1468, v1469 = v0.readVarInt(v1462, v1464);
                v1464 = v1469 + v1468;
            end;
        elseif v1466 == v0.wireTypes.i32 then
            v1467 = nil;
            v1468, v1469 = v0.readFixed32(v1462, v1464);
            v1467 = v1468;
            v1464 = v1469;
        elseif v1466 == v0.wireTypes.i64 then
            v1467 = nil;
            v1468, v1469 = v0.readFixed64(v1462, v1464);
            v1467 = v1468;
            v1464 = v1469;
        else
            error("Unsupported wire type: " .. v1466);
        end;
    end;
    return v1463;
end;
v4.jsonEncode = function(v1470) --[[ Line: 9858 ]] --[[ Name: jsonEncode ]]
    local v1471 = {};
    if v1470.filter_groups ~= nil and #v1470.filter_groups > 0 then
        local v1472 = {};
        for _, v1474 in v1470.filter_groups do
            table.insert(v1472, v1474:jsonEncode());
        end;
        v1471.filterGroups = v1472;
    end;
    return v1471;
end;
v4.jsonDecode = function(v1475) --[[ Line: 9872 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_50 (copy), v2 (copy)
    local v1476 = l_v4_50.new();
    if v1475.filter_groups ~= nil then
        local v1477 = {};
        for _, v1479 in v1475.filter_groups do
            table.insert(v1477, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1479));
        end;
        v1476.filter_groups = v1477;
    end;
    if v1475.filterGroups ~= nil then
        local v1480 = {};
        for _, v1482 in v1475.filterGroups do
            table.insert(v1480, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1482));
        end;
        v1476.filter_groups = v1480;
    end;
    return v1476;
end;
v4.descriptor = {
    name = "FilterPillsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
};
v2.FilterPillsInputData = v4;
v1.default:register(v2.FilterPillsInputData);
v4 = {};
v4.__index = v4;
local l_v4_51 = v4 --[[ copy: 4 -> 56 ]];
v4.new = function(v1484) --[[ Line: 9910 ]] --[[ Name: new ]]
    -- upvalues: l_v4_51 (copy)
    return (setmetatable({
        filter_id = (not (v1484 ~= nil) or v1484.filter_id == nil) and "" or v1484.filter_id, 
        display_name = (not (v1484 ~= nil) or v1484.display_name == nil) and "" or v1484.display_name, 
        options = if not (v1484 ~= nil) or v1484.options == nil then {} else v1484.options, 
        default_option_id = (not (v1484 ~= nil) or v1484.default_option_id == nil) and "" or v1484.default_option_id
    }, l_v4_51));
end;
v4.encode = function(v1485) --[[ Line: 9921 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1486 = buffer.create(0);
    local v1487 = 0;
    if v1485.filter_id ~= nil and v1485.filter_id ~= "" then
        local v1488, v1489 = v0.writeTag(v1486, v1487, 1, v0.wireTypes.lengthDelimited);
        v1488, v1489 = v0.writeString(v1488, v1489, v1485.filter_id);
        v1486 = v1488;
        v1487 = v1489;
    end;
    if v1485.display_name ~= nil and v1485.display_name ~= "" then
        local v1490, v1491 = v0.writeTag(v1486, v1487, 2, v0.wireTypes.lengthDelimited);
        v1490, v1491 = v0.writeString(v1490, v1491, v1485.display_name);
        v1486 = v1490;
        v1487 = v1491;
    end;
    if v1485.options ~= nil and #v1485.options > 0 then
        for _, v1493 in v1485.options do
            local v1494 = v1493:encode();
            local v1495, v1496 = v0.writeTag(v1486, v1487, 3, v0.wireTypes.lengthDelimited);
            v1495, v1496 = v0.writeBuffer(v1495, v1496, v1494, buffer.len(v1494));
            v1486 = v1495;
            v1487 = v1496;
        end;
    end;
    if v1485.default_option_id ~= nil and v1485.default_option_id ~= "" then
        local v1497, v1498 = v0.writeTag(v1486, v1487, 4, v0.wireTypes.lengthDelimited);
        v1497, v1498 = v0.writeString(v1497, v1498, v1485.default_option_id);
        v1486 = v1497;
        v1487 = v1498;
    end;
    local v1499 = buffer.create(v1487);
    buffer.copy(v1499, 0, v1486, 0, v1487);
    return v1499;
end;
v4.decode = function(v1500) --[[ Line: 9953 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_51 (copy), v0 (copy), v2 (copy)
    local v1501 = l_v4_51.new();
    local v1502 = 0;
    while v1502 < buffer.len(v1500) do
        local v1503 = nil;
        local v1504 = nil;
        local v1505, v1506, v1507 = v0.readTag(v1500, v1502);
        v1503 = v1505;
        v1504 = v1506;
        v1502 = v1507;
        if v1504 == v0.wireTypes.varint then
            v1505 = nil;
            v1506, v1507 = v0.readVarInt(v1500, v1502);
            v1505 = v1506;
            v1502 = v1507;
        elseif v1504 == v0.wireTypes.lengthDelimited then
            if v1503 == 1 then
                v1505 = nil;
                v1506, v1507 = v0.readBuffer(v1500, v1502);
                v1505 = v1506;
                v1502 = v1507;
                v1501.filter_id = buffer.tostring(v1505);
            elseif v1503 == 2 then
                v1505 = nil;
                v1506, v1507 = v0.readBuffer(v1500, v1502);
                v1505 = v1506;
                v1502 = v1507;
                v1501.display_name = buffer.tostring(v1505);
            elseif v1503 == 3 then
                v1505 = nil;
                v1506, v1507 = v0.readBuffer(v1500, v1502);
                v1505 = v1506;
                v1502 = v1507;
                table.insert(v1501.options, v2.FilterPillsInputData_FilterOption.decode(v1505));
            elseif v1503 == 4 then
                v1505 = nil;
                v1506, v1507 = v0.readBuffer(v1500, v1502);
                v1505 = v1506;
                v1502 = v1507;
                v1501.default_option_id = buffer.tostring(v1505);
            else
                v1505 = nil;
                v1506, v1507 = v0.readVarInt(v1500, v1502);
                v1502 = v1507 + v1506;
            end;
        elseif v1504 == v0.wireTypes.i32 then
            v1505 = nil;
            v1506, v1507 = v0.readFixed32(v1500, v1502);
            v1505 = v1506;
            v1502 = v1507;
        elseif v1504 == v0.wireTypes.i64 then
            v1505 = nil;
            v1506, v1507 = v0.readFixed64(v1500, v1502);
            v1505 = v1506;
            v1502 = v1507;
        else
            error("Unsupported wire type: " .. v1504);
        end;
    end;
    return v1501;
end;
v4.jsonEncode = function(v1508) --[[ Line: 10011 ]] --[[ Name: jsonEncode ]]
    local v1509 = {};
    if v1508.filter_id ~= nil and v1508.filter_id ~= "" then
        v1509.filterId = v1508.filter_id;
    end;
    if v1508.display_name ~= nil and v1508.display_name ~= "" then
        v1509.displayName = v1508.display_name;
    end;
    if v1508.options ~= nil and #v1508.options > 0 then
        local v1510 = {};
        for _, v1512 in v1508.options do
            table.insert(v1510, v1512:jsonEncode());
        end;
        v1509.options = v1510;
    end;
    if v1508.default_option_id ~= nil and v1508.default_option_id ~= "" then
        v1509.defaultOptionId = v1508.default_option_id;
    end;
    return v1509;
end;
v4.jsonDecode = function(v1513) --[[ Line: 10037 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_51 (copy), v2 (copy)
    local v1514 = l_v4_51.new();
    if v1513.filter_id ~= nil then
        v1514.filter_id = v1513.filter_id;
    end;
    if v1513.filterId ~= nil then
        v1514.filter_id = v1513.filterId;
    end;
    if v1513.display_name ~= nil then
        v1514.display_name = v1513.display_name;
    end;
    if v1513.displayName ~= nil then
        v1514.display_name = v1513.displayName;
    end;
    if v1513.options ~= nil then
        local v1515 = {};
        for _, v1517 in v1513.options do
            table.insert(v1515, v2.FilterPillsInputData_FilterOption.jsonDecode(v1517));
        end;
        v1514.options = v1515;
    end;
    if v1513.default_option_id ~= nil then
        v1514.default_option_id = v1513.default_option_id;
    end;
    if v1513.defaultOptionId ~= nil then
        v1514.default_option_id = v1513.defaultOptionId;
    end;
    return v1514;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterGroup", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
};
v2.FilterPillsInputData_FilterGroup = v4;
v1.default:register(v2.FilterPillsInputData_FilterGroup);
v4 = {};
v4.__index = v4;
local l_v4_52 = v4 --[[ copy: 4 -> 57 ]];
v4.new = function(v1519) --[[ Line: 10092 ]] --[[ Name: new ]]
    -- upvalues: l_v4_52 (copy)
    return (setmetatable({
        option_id = (not (v1519 ~= nil) or v1519.option_id == nil) and "" or v1519.option_id, 
        display_name = (not (v1519 ~= nil) or v1519.display_name == nil) and "" or v1519.display_name
    }, l_v4_52));
end;
v4.encode = function(v1520) --[[ Line: 10101 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1521 = buffer.create(0);
    local v1522 = 0;
    if v1520.option_id ~= nil and v1520.option_id ~= "" then
        local v1523, v1524 = v0.writeTag(v1521, v1522, 1, v0.wireTypes.lengthDelimited);
        v1523, v1524 = v0.writeString(v1523, v1524, v1520.option_id);
        v1521 = v1523;
        v1522 = v1524;
    end;
    if v1520.display_name ~= nil and v1520.display_name ~= "" then
        local v1525, v1526 = v0.writeTag(v1521, v1522, 2, v0.wireTypes.lengthDelimited);
        v1525, v1526 = v0.writeString(v1525, v1526, v1520.display_name);
        v1521 = v1525;
        v1522 = v1526;
    end;
    local v1527 = buffer.create(v1522);
    buffer.copy(v1527, 0, v1521, 0, v1522);
    return v1527;
end;
v4.decode = function(v1528) --[[ Line: 10120 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_52 (copy), v0 (copy)
    local v1529 = l_v4_52.new();
    local v1530 = 0;
    while v1530 < buffer.len(v1528) do
        local v1531 = nil;
        local v1532 = nil;
        local v1533, v1534, v1535 = v0.readTag(v1528, v1530);
        v1531 = v1533;
        v1532 = v1534;
        v1530 = v1535;
        if v1532 == v0.wireTypes.varint then
            v1533 = nil;
            v1534, v1535 = v0.readVarInt(v1528, v1530);
            v1533 = v1534;
            v1530 = v1535;
        elseif v1532 == v0.wireTypes.lengthDelimited then
            if v1531 == 1 then
                v1533 = nil;
                v1534, v1535 = v0.readBuffer(v1528, v1530);
                v1533 = v1534;
                v1530 = v1535;
                v1529.option_id = buffer.tostring(v1533);
            elseif v1531 == 2 then
                v1533 = nil;
                v1534, v1535 = v0.readBuffer(v1528, v1530);
                v1533 = v1534;
                v1530 = v1535;
                v1529.display_name = buffer.tostring(v1533);
            else
                v1533 = nil;
                v1534, v1535 = v0.readVarInt(v1528, v1530);
                v1530 = v1535 + v1534;
            end;
        elseif v1532 == v0.wireTypes.i32 then
            v1533 = nil;
            v1534, v1535 = v0.readFixed32(v1528, v1530);
            v1533 = v1534;
            v1530 = v1535;
        elseif v1532 == v0.wireTypes.i64 then
            v1533 = nil;
            v1534, v1535 = v0.readFixed64(v1528, v1530);
            v1533 = v1534;
            v1530 = v1535;
        else
            error("Unsupported wire type: " .. v1532);
        end;
    end;
    return v1529;
end;
v4.jsonEncode = function(v1536) --[[ Line: 10168 ]] --[[ Name: jsonEncode ]]
    local v1537 = {};
    if v1536.option_id ~= nil and v1536.option_id ~= "" then
        v1537.optionId = v1536.option_id;
    end;
    if v1536.display_name ~= nil and v1536.display_name ~= "" then
        v1537.displayName = v1536.display_name;
    end;
    return v1537;
end;
v4.jsonDecode = function(v1538) --[[ Line: 10182 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_52 (copy)
    local v1539 = l_v4_52.new();
    if v1538.option_id ~= nil then
        v1539.option_id = v1538.option_id;
    end;
    if v1538.optionId ~= nil then
        v1539.option_id = v1538.optionId;
    end;
    if v1538.display_name ~= nil then
        v1539.display_name = v1538.display_name;
    end;
    if v1538.displayName ~= nil then
        v1539.display_name = v1538.displayName;
    end;
    return v1539;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
};
v2.FilterPillsInputData_FilterOption = v4;
v1.default:register(v2.FilterPillsInputData_FilterOption);
v4 = {};
v4.__index = v4;
local l_v4_53 = v4 --[[ copy: 4 -> 58 ]];
v4.new = function(v1541) --[[ Line: 10220 ]] --[[ Name: new ]]
    -- upvalues: l_v4_53 (copy)
    return (setmetatable({
        sort_options = if not (v1541 ~= nil) or v1541.sort_options == nil then {} else v1541.sort_options, 
        selected_sort_id = (not (v1541 ~= nil) or v1541.selected_sort_id == nil) and "" or v1541.selected_sort_id
    }, l_v4_53));
end;
v4.encode = function(v1542) --[[ Line: 10227 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1543 = buffer.create(0);
    local v1544 = 0;
    if v1542.sort_options ~= nil and #v1542.sort_options > 0 then
        for _, v1546 in v1542.sort_options do
            local v1547 = v1546:encode();
            local v1548, v1549 = v0.writeTag(v1543, v1544, 1, v0.wireTypes.lengthDelimited);
            v1548, v1549 = v0.writeBuffer(v1548, v1549, v1547, buffer.len(v1547));
            v1543 = v1548;
            v1544 = v1549;
        end;
    end;
    if v1542.selected_sort_id ~= nil and v1542.selected_sort_id ~= "" then
        local v1550, v1551 = v0.writeTag(v1543, v1544, 2, v0.wireTypes.lengthDelimited);
        v1550, v1551 = v0.writeString(v1550, v1551, v1542.selected_sort_id);
        v1543 = v1550;
        v1544 = v1551;
    end;
    local v1552 = buffer.create(v1544);
    buffer.copy(v1552, 0, v1543, 0, v1544);
    return v1552;
end;
v4.decode = function(v1553) --[[ Line: 10249 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_53 (copy), v0 (copy), v2 (copy)
    local v1554 = l_v4_53.new();
    local v1555 = 0;
    while v1555 < buffer.len(v1553) do
        local v1556 = nil;
        local v1557 = nil;
        local v1558, v1559, v1560 = v0.readTag(v1553, v1555);
        v1556 = v1558;
        v1557 = v1559;
        v1555 = v1560;
        if v1557 == v0.wireTypes.varint then
            v1558 = nil;
            v1559, v1560 = v0.readVarInt(v1553, v1555);
            v1558 = v1559;
            v1555 = v1560;
        elseif v1557 == v0.wireTypes.lengthDelimited then
            if v1556 == 1 then
                v1558 = nil;
                v1559, v1560 = v0.readBuffer(v1553, v1555);
                v1558 = v1559;
                v1555 = v1560;
                table.insert(v1554.sort_options, v2.SortSelectorInputData_SortOption.decode(v1558));
            elseif v1556 == 2 then
                v1558 = nil;
                v1559, v1560 = v0.readBuffer(v1553, v1555);
                v1558 = v1559;
                v1555 = v1560;
                v1554.selected_sort_id = buffer.tostring(v1558);
            else
                v1558 = nil;
                v1559, v1560 = v0.readVarInt(v1553, v1555);
                v1555 = v1560 + v1559;
            end;
        elseif v1557 == v0.wireTypes.i32 then
            v1558 = nil;
            v1559, v1560 = v0.readFixed32(v1553, v1555);
            v1558 = v1559;
            v1555 = v1560;
        elseif v1557 == v0.wireTypes.i64 then
            v1558 = nil;
            v1559, v1560 = v0.readFixed64(v1553, v1555);
            v1558 = v1559;
            v1555 = v1560;
        else
            error("Unsupported wire type: " .. v1557);
        end;
    end;
    return v1554;
end;
v4.jsonEncode = function(v1561) --[[ Line: 10297 ]] --[[ Name: jsonEncode ]]
    local v1562 = {};
    if v1561.sort_options ~= nil and #v1561.sort_options > 0 then
        local v1563 = {};
        for _, v1565 in v1561.sort_options do
            table.insert(v1563, v1565:jsonEncode());
        end;
        v1562.sortOptions = v1563;
    end;
    if v1561.selected_sort_id ~= nil and v1561.selected_sort_id ~= "" then
        v1562.selectedSortId = v1561.selected_sort_id;
    end;
    return v1562;
end;
v4.jsonDecode = function(v1566) --[[ Line: 10315 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_53 (copy), v2 (copy)
    local v1567 = l_v4_53.new();
    if v1566.sort_options ~= nil then
        local v1568 = {};
        for _, v1570 in v1566.sort_options do
            table.insert(v1568, v2.SortSelectorInputData_SortOption.jsonDecode(v1570));
        end;
        v1567.sort_options = v1568;
    end;
    if v1566.sortOptions ~= nil then
        local v1571 = {};
        for _, v1573 in v1566.sortOptions do
            table.insert(v1571, v2.SortSelectorInputData_SortOption.jsonDecode(v1573));
        end;
        v1567.sort_options = v1571;
    end;
    if v1566.selected_sort_id ~= nil then
        v1567.selected_sort_id = v1566.selected_sort_id;
    end;
    if v1566.selectedSortId ~= nil then
        v1567.selected_sort_id = v1566.selectedSortId;
    end;
    return v1567;
end;
v4.descriptor = {
    name = "SortSelectorInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
};
v2.SortSelectorInputData = v4;
v1.default:register(v2.SortSelectorInputData);
v4 = {};
v4.__index = v4;
local l_v4_54 = v4 --[[ copy: 4 -> 59 ]];
v4.new = function(v1575) --[[ Line: 10361 ]] --[[ Name: new ]]
    -- upvalues: l_v4_54 (copy)
    return (setmetatable({
        sort_id = (not (v1575 ~= nil) or v1575.sort_id == nil) and "" or v1575.sort_id, 
        display_name = (not (v1575 ~= nil) or v1575.display_name == nil) and "" or v1575.display_name, 
        content_type = (not (v1575 ~= nil) or v1575.content_type == nil) and "" or v1575.content_type
    }, l_v4_54));
end;
v4.encode = function(v1576) --[[ Line: 10371 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1577 = buffer.create(0);
    local v1578 = 0;
    if v1576.sort_id ~= nil and v1576.sort_id ~= "" then
        local v1579, v1580 = v0.writeTag(v1577, v1578, 1, v0.wireTypes.lengthDelimited);
        v1579, v1580 = v0.writeString(v1579, v1580, v1576.sort_id);
        v1577 = v1579;
        v1578 = v1580;
    end;
    if v1576.display_name ~= nil and v1576.display_name ~= "" then
        local v1581, v1582 = v0.writeTag(v1577, v1578, 2, v0.wireTypes.lengthDelimited);
        v1581, v1582 = v0.writeString(v1581, v1582, v1576.display_name);
        v1577 = v1581;
        v1578 = v1582;
    end;
    if v1576.content_type ~= nil and v1576.content_type ~= "" then
        local v1583, v1584 = v0.writeTag(v1577, v1578, 3, v0.wireTypes.lengthDelimited);
        v1583, v1584 = v0.writeString(v1583, v1584, v1576.content_type);
        v1577 = v1583;
        v1578 = v1584;
    end;
    local v1585 = buffer.create(v1578);
    buffer.copy(v1585, 0, v1577, 0, v1578);
    return v1585;
end;
v4.decode = function(v1586) --[[ Line: 10395 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_54 (copy), v0 (copy)
    local v1587 = l_v4_54.new();
    local v1588 = 0;
    while v1588 < buffer.len(v1586) do
        local v1589 = nil;
        local v1590 = nil;
        local v1591, v1592, v1593 = v0.readTag(v1586, v1588);
        v1589 = v1591;
        v1590 = v1592;
        v1588 = v1593;
        if v1590 == v0.wireTypes.varint then
            v1591 = nil;
            v1592, v1593 = v0.readVarInt(v1586, v1588);
            v1591 = v1592;
            v1588 = v1593;
        elseif v1590 == v0.wireTypes.lengthDelimited then
            if v1589 == 1 then
                v1591 = nil;
                v1592, v1593 = v0.readBuffer(v1586, v1588);
                v1591 = v1592;
                v1588 = v1593;
                v1587.sort_id = buffer.tostring(v1591);
            elseif v1589 == 2 then
                v1591 = nil;
                v1592, v1593 = v0.readBuffer(v1586, v1588);
                v1591 = v1592;
                v1588 = v1593;
                v1587.display_name = buffer.tostring(v1591);
            elseif v1589 == 3 then
                v1591 = nil;
                v1592, v1593 = v0.readBuffer(v1586, v1588);
                v1591 = v1592;
                v1588 = v1593;
                v1587.content_type = buffer.tostring(v1591);
            else
                v1591 = nil;
                v1592, v1593 = v0.readVarInt(v1586, v1588);
                v1588 = v1593 + v1592;
            end;
        elseif v1590 == v0.wireTypes.i32 then
            v1591 = nil;
            v1592, v1593 = v0.readFixed32(v1586, v1588);
            v1591 = v1592;
            v1588 = v1593;
        elseif v1590 == v0.wireTypes.i64 then
            v1591 = nil;
            v1592, v1593 = v0.readFixed64(v1586, v1588);
            v1591 = v1592;
            v1588 = v1593;
        else
            error("Unsupported wire type: " .. v1590);
        end;
    end;
    return v1587;
end;
v4.jsonEncode = function(v1594) --[[ Line: 10448 ]] --[[ Name: jsonEncode ]]
    local v1595 = {};
    if v1594.sort_id ~= nil and v1594.sort_id ~= "" then
        v1595.sortId = v1594.sort_id;
    end;
    if v1594.display_name ~= nil and v1594.display_name ~= "" then
        v1595.displayName = v1594.display_name;
    end;
    if v1594.content_type ~= nil and v1594.content_type ~= "" then
        v1595.contentType = v1594.content_type;
    end;
    return v1595;
end;
v4.jsonDecode = function(v1596) --[[ Line: 10466 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_54 (copy)
    local v1597 = l_v4_54.new();
    if v1596.sort_id ~= nil then
        v1597.sort_id = v1596.sort_id;
    end;
    if v1596.sortId ~= nil then
        v1597.sort_id = v1596.sortId;
    end;
    if v1596.display_name ~= nil then
        v1597.display_name = v1596.display_name;
    end;
    if v1596.displayName ~= nil then
        v1597.display_name = v1596.displayName;
    end;
    if v1596.content_type ~= nil then
        v1597.content_type = v1596.content_type;
    end;
    if v1596.contentType ~= nil then
        v1597.content_type = v1596.contentType;
    end;
    return v1597;
end;
v4.descriptor = {
    name = "SortSelectorInputData_SortOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
};
v2.SortSelectorInputData_SortOption = v4;
v1.default:register(v2.SortSelectorInputData_SortOption);
v4 = {};
v4.__index = v4;
local l_v4_55 = v4 --[[ copy: 4 -> 60 ]];
v4.new = function(v1599) --[[ Line: 10512 ]] --[[ Name: new ]]
    -- upvalues: l_v4_55 (copy)
    return (setmetatable({
        id = (not (v1599 ~= nil) or v1599.id == nil) and "" or v1599.id, 
        preview_rows = (not (v1599 ~= nil) or v1599.preview_rows == nil) and 0 or v1599.preview_rows
    }, l_v4_55));
end;
v4.encode = function(v1600) --[[ Line: 10521 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1601 = buffer.create(0);
    local v1602 = 0;
    if v1600.id ~= nil and v1600.id ~= "" then
        local v1603, v1604 = v0.writeTag(v1601, v1602, 1, v0.wireTypes.lengthDelimited);
        v1603, v1604 = v0.writeString(v1603, v1604, v1600.id);
        v1601 = v1603;
        v1602 = v1604;
    end;
    if v1600.preview_rows ~= nil and v1600.preview_rows ~= 0 then
        local v1605, v1606 = v0.writeTag(v1601, v1602, 4, v0.wireTypes.varint);
        v1605, v1606 = v0.writeVarInt(v1605, v1606, v1600.preview_rows);
        v1601 = v1605;
        v1602 = v1606;
    end;
    local v1607 = buffer.create(v1602);
    buffer.copy(v1607, 0, v1601, 0, v1602);
    return v1607;
end;
v4.decode = function(v1608) --[[ Line: 10540 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_55 (copy), v0 (copy)
    local v1609 = l_v4_55.new();
    local v1610 = 0;
    while v1610 < buffer.len(v1608) do
        local v1611 = nil;
        local v1612 = nil;
        local v1613, v1614, v1615 = v0.readTag(v1608, v1610);
        v1611 = v1613;
        v1612 = v1614;
        v1610 = v1615;
        if v1612 == v0.wireTypes.varint then
            if v1611 == 4 then
                v1613 = nil;
                v1614, v1615 = v0.readVarIntI64(v1608, v1610);
                v1613 = v1614;
                v1610 = v1615;
                v1609.preview_rows = v1613;
            else
                v1613 = nil;
                v1614, v1615 = v0.readVarInt(v1608, v1610);
                v1613 = v1614;
                v1610 = v1615;
            end;
        elseif v1612 == v0.wireTypes.lengthDelimited then
            if v1611 == 1 then
                v1613 = nil;
                v1614, v1615 = v0.readBuffer(v1608, v1610);
                v1613 = v1614;
                v1610 = v1615;
                v1609.id = buffer.tostring(v1613);
            else
                v1613 = nil;
                v1614, v1615 = v0.readVarInt(v1608, v1610);
                v1610 = v1615 + v1614;
            end;
        elseif v1612 == v0.wireTypes.i32 then
            v1613 = nil;
            v1614, v1615 = v0.readFixed32(v1608, v1610);
            v1613 = v1614;
            v1610 = v1615;
        elseif v1612 == v0.wireTypes.i64 then
            v1613 = nil;
            v1614, v1615 = v0.readFixed64(v1608, v1610);
            v1613 = v1614;
            v1610 = v1615;
        else
            error("Unsupported wire type: " .. v1612);
        end;
    end;
    return v1609;
end;
v4.jsonEncode = function(v1616) --[[ Line: 10588 ]] --[[ Name: jsonEncode ]]
    local v1617 = {};
    if v1616.id ~= nil and v1616.id ~= "" then
        v1617.id = v1616.id;
    end;
    if v1616.preview_rows ~= nil and v1616.preview_rows ~= 0 then
        v1617.previewRows = v1616.preview_rows;
    end;
    return v1617;
end;
v4.jsonDecode = function(v1618) --[[ Line: 10602 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_55 (copy)
    local v1619 = l_v4_55.new();
    if v1618.id ~= nil then
        v1619.id = v1618.id;
    end;
    if v1618.preview_rows ~= nil then
        v1619.preview_rows = v1618.preview_rows;
    end;
    if v1618.previewRows ~= nil then
        v1619.preview_rows = v1618.previewRows;
    end;
    return v1619;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemGroupInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
};
v2.UAMarketplaceCatalogItemGroupInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemGroupInputData);
v4 = {};
v4.__index = v4;
local l_v4_56 = v4 --[[ copy: 4 -> 61 ]];
v4.new = function(v1621) --[[ Line: 10636 ]] --[[ Name: new ]]
    -- upvalues: l_v4_56 (copy)
    return (setmetatable({
        id = (not (v1621 ~= nil) or v1621.id == nil) and "" or v1621.id, 
        num_items_to_show = (not (v1621 ~= nil) or v1621.num_items_to_show == nil) and 0 or v1621.num_items_to_show
    }, l_v4_56));
end;
v4.encode = function(v1622) --[[ Line: 10645 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1623 = buffer.create(0);
    local v1624 = 0;
    if v1622.id ~= nil and v1622.id ~= "" then
        local v1625, v1626 = v0.writeTag(v1623, v1624, 1, v0.wireTypes.lengthDelimited);
        v1625, v1626 = v0.writeString(v1625, v1626, v1622.id);
        v1623 = v1625;
        v1624 = v1626;
    end;
    if v1622.num_items_to_show ~= nil and v1622.num_items_to_show ~= 0 then
        local v1627, v1628 = v0.writeTag(v1623, v1624, 5, v0.wireTypes.varint);
        v1627, v1628 = v0.writeVarInt(v1627, v1628, v1622.num_items_to_show);
        v1623 = v1627;
        v1624 = v1628;
    end;
    local v1629 = buffer.create(v1624);
    buffer.copy(v1629, 0, v1623, 0, v1624);
    return v1629;
end;
v4.decode = function(v1630) --[[ Line: 10666 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_56 (copy), v0 (copy)
    local v1631 = l_v4_56.new();
    local v1632 = 0;
    while v1632 < buffer.len(v1630) do
        local v1633 = nil;
        local v1634 = nil;
        local v1635, v1636, v1637 = v0.readTag(v1630, v1632);
        v1633 = v1635;
        v1634 = v1636;
        v1632 = v1637;
        if v1634 == v0.wireTypes.varint then
            if v1633 == 5 then
                v1635 = nil;
                v1636, v1637 = v0.readVarIntI64(v1630, v1632);
                v1635 = v1636;
                v1632 = v1637;
                v1631.num_items_to_show = v1635;
            else
                v1635 = nil;
                v1636, v1637 = v0.readVarInt(v1630, v1632);
                v1635 = v1636;
                v1632 = v1637;
            end;
        elseif v1634 == v0.wireTypes.lengthDelimited then
            if v1633 == 1 then
                v1635 = nil;
                v1636, v1637 = v0.readBuffer(v1630, v1632);
                v1635 = v1636;
                v1632 = v1637;
                v1631.id = buffer.tostring(v1635);
            else
                v1635 = nil;
                v1636, v1637 = v0.readVarInt(v1630, v1632);
                v1632 = v1637 + v1636;
            end;
        elseif v1634 == v0.wireTypes.i32 then
            v1635 = nil;
            v1636, v1637 = v0.readFixed32(v1630, v1632);
            v1635 = v1636;
            v1632 = v1637;
        elseif v1634 == v0.wireTypes.i64 then
            v1635 = nil;
            v1636, v1637 = v0.readFixed64(v1630, v1632);
            v1635 = v1636;
            v1632 = v1637;
        else
            error("Unsupported wire type: " .. v1634);
        end;
    end;
    return v1631;
end;
v4.jsonEncode = function(v1638) --[[ Line: 10716 ]] --[[ Name: jsonEncode ]]
    local v1639 = {};
    if v1638.id ~= nil and v1638.id ~= "" then
        v1639.id = v1638.id;
    end;
    if v1638.num_items_to_show ~= nil and v1638.num_items_to_show ~= 0 then
        v1639.numItemsToShow = v1638.num_items_to_show;
    end;
    return v1639;
end;
v4.jsonDecode = function(v1640) --[[ Line: 10732 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_56 (copy)
    local v1641 = l_v4_56.new();
    if v1640.id ~= nil then
        v1641.id = v1640.id;
    end;
    if v1640.num_items_to_show ~= nil then
        v1641.num_items_to_show = v1640.num_items_to_show;
    end;
    if v1640.numItemsToShow ~= nil then
        v1641.num_items_to_show = v1640.numItemsToShow;
    end;
    return v1641;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
};
v2.UAMarketplaceCatalogItemCarouselInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_57 = v4 --[[ copy: 4 -> 62 ]];
v4.new = function(v1643) --[[ Line: 10766 ]] --[[ Name: new ]]
    -- upvalues: l_v4_57 (copy)
    return (setmetatable({
        feed_item_input_map = if not (v1643 ~= nil) or v1643.feed_item_input_map == nil then {} else v1643.feed_item_input_map, 
        marketplace_catalog_feed_items = if not (v1643 ~= nil) or v1643.marketplace_catalog_feed_items == nil then {} else v1643.marketplace_catalog_feed_items
    }, l_v4_57));
end;
v4.encode = function(v1644) --[[ Line: 10779 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1645 = buffer.create(0);
    local v1646 = 0;
    if v1644.feed_item_input_map ~= nil and next(v1644.feed_item_input_map) ~= nil then
        for v1647, v1648 in v1644.feed_item_input_map do
            local v1649 = buffer.create(0);
            local v1650, v1651 = v0.writeTag(v1649, 0, 1, v0.wireTypes.lengthDelimited);
            v1650, v1651 = v0.writeString(v1650, v1651, v1647);
            v1649 = v1650;
            local l_v1651_0 = v1651;
            v1650 = v1648:encode();
            local v1653;
            v1651, v1653 = v0.writeTag(v1649, l_v1651_0, 2, v0.wireTypes.lengthDelimited);
            v1651, v1653 = v0.writeBuffer(v1651, v1653, v1650, buffer.len(v1650));
            v1649 = v1651;
            l_v1651_0 = v1653;
            v1651, v1653 = v0.writeTag(v1645, v1646, 1, v0.wireTypes.lengthDelimited);
            v1651, v1653 = v0.writeBuffer(v1651, v1653, v1649, l_v1651_0);
            v1645 = v1651;
            v1646 = v1653;
        end;
    end;
    if v1644.marketplace_catalog_feed_items ~= nil and #v1644.marketplace_catalog_feed_items > 0 then
        for _, v1655 in v1644.marketplace_catalog_feed_items do
            local v1656 = v1655:encode();
            local v1657, v1658 = v0.writeTag(v1645, v1646, 2, v0.wireTypes.lengthDelimited);
            v1657, v1658 = v0.writeBuffer(v1657, v1658, v1656, buffer.len(v1656));
            v1645 = v1657;
            v1646 = v1658;
        end;
    end;
    local v1659 = buffer.create(v1646);
    buffer.copy(v1659, 0, v1645, 0, v1646);
    return v1659;
end;
v4.decode = function(v1660) --[[ Line: 10810 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_57 (copy), v0 (copy), v2 (copy)
    local v1661 = l_v4_57.new();
    local v1662 = 0;
    while v1662 < buffer.len(v1660) do
        local v1663 = nil;
        local v1664 = nil;
        local v1665, v1666, v1667 = v0.readTag(v1660, v1662);
        v1663 = v1665;
        v1664 = v1666;
        v1662 = v1667;
        if v1664 == v0.wireTypes.varint then
            v1665 = nil;
            v1666, v1667 = v0.readVarInt(v1660, v1662);
            v1665 = v1666;
            v1662 = v1667;
        elseif v1664 == v0.wireTypes.lengthDelimited then
            if v1663 == 1 then
                v1665 = nil;
                v1666, v1667 = v0.readBuffer(v1660, v1662);
                v1665 = v1666;
                v1662 = v1667;
                v1666 = v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry.decode(v1665);
                v1667 = v2.PageEntryInputData.new();
                v1661.feed_item_input_map[v1666.key or ""] = v1666.value or v1667;
            elseif v1663 == 2 then
                v1665 = nil;
                v1666, v1667 = v0.readBuffer(v1660, v1662);
                v1665 = v1666;
                v1662 = v1667;
                table.insert(v1661.marketplace_catalog_feed_items, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.decode(v1665));
            else
                v1665 = nil;
                v1666, v1667 = v0.readVarInt(v1660, v1662);
                v1662 = v1667 + v1666;
            end;
        elseif v1664 == v0.wireTypes.i32 then
            v1665 = nil;
            v1666, v1667 = v0.readFixed32(v1660, v1662);
            v1665 = v1666;
            v1662 = v1667;
        elseif v1664 == v0.wireTypes.i64 then
            v1665 = nil;
            v1666, v1667 = v0.readFixed64(v1660, v1662);
            v1665 = v1666;
            v1662 = v1667;
        else
            error("Unsupported wire type: " .. v1664);
        end;
    end;
    return v1661;
end;
v4.jsonEncode = function(v1668) --[[ Line: 10868 ]] --[[ Name: jsonEncode ]]
    local v1669 = {};
    if v1668.feed_item_input_map ~= nil and next(v1668.feed_item_input_map) ~= nil then
        local v1670 = {};
        for v1671, v1672 in v1668.feed_item_input_map do
            v1670[v1671] = v1672:jsonEncode();
        end;
        v1669.feedItemInputMap = v1670;
    end;
    if v1668.marketplace_catalog_feed_items ~= nil and #v1668.marketplace_catalog_feed_items > 0 then
        local v1673 = {};
        for _, v1675 in v1668.marketplace_catalog_feed_items do
            table.insert(v1673, v1675:jsonEncode());
        end;
        v1669.marketplaceCatalogFeedItems = v1673;
    end;
    return v1669;
end;
v4.jsonDecode = function(v1676) --[[ Line: 10890 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_57 (copy), v2 (copy)
    local v1677 = l_v4_57.new();
    if v1676.feed_item_input_map ~= nil then
        local v1678 = {};
        for v1679, v1680 in v1676.feed_item_input_map do
            v1678[v1679] = v2.PageEntryInputData.jsonDecode(v1680);
        end;
        v1677.feed_item_input_map = v1678;
    end;
    if v1676.feedItemInputMap ~= nil then
        local v1681 = {};
        for v1682, v1683 in v1676.feedItemInputMap do
            v1681[v1682] = v2.PageEntryInputData.jsonDecode(v1683);
        end;
        v1677.feed_item_input_map = v1681;
    end;
    if v1676.marketplace_catalog_feed_items ~= nil then
        local v1684 = {};
        for _, v1686 in v1676.marketplace_catalog_feed_items do
            table.insert(v1684, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1686));
        end;
        v1677.marketplace_catalog_feed_items = v1684;
    end;
    if v1676.marketplaceCatalogFeedItems ~= nil then
        local v1687 = {};
        for _, v1689 in v1676.marketplaceCatalogFeedItems do
            table.insert(v1687, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1689));
        end;
        v1677.marketplace_catalog_feed_items = v1687;
    end;
    return v1677;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
};
v2.UAMarketplaceCatalogFeedInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_58 = v4 --[[ copy: 4 -> 63 ]];
v4.new = function(v1691) --[[ Line: 10955 ]] --[[ Name: new ]]
    -- upvalues: l_v4_58 (copy)
    return (setmetatable({
        roblox_component = (not (v1691 ~= nil) or v1691.roblox_component == nil) and "" or v1691.roblox_component, 
        feed_item_id = (not (v1691 ~= nil) or v1691.feed_item_id == nil) and "" or v1691.feed_item_id
    }, l_v4_58));
end;
v4.encode = function(v1692) --[[ Line: 10967 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1693 = buffer.create(0);
    local v1694 = 0;
    if v1692.roblox_component ~= nil and v1692.roblox_component ~= "" then
        local v1695, v1696 = v0.writeTag(v1693, v1694, 1, v0.wireTypes.lengthDelimited);
        v1695, v1696 = v0.writeString(v1695, v1696, v1692.roblox_component);
        v1693 = v1695;
        v1694 = v1696;
    end;
    if v1692.feed_item_id ~= nil and v1692.feed_item_id ~= "" then
        local v1697, v1698 = v0.writeTag(v1693, v1694, 2, v0.wireTypes.lengthDelimited);
        v1697, v1698 = v0.writeString(v1697, v1698, v1692.feed_item_id);
        v1693 = v1697;
        v1694 = v1698;
    end;
    local v1699 = buffer.create(v1694);
    buffer.copy(v1699, 0, v1693, 0, v1694);
    return v1699;
end;
v4.decode = function(v1700) --[[ Line: 10988 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_58 (copy), v0 (copy)
    local v1701 = l_v4_58.new();
    local v1702 = 0;
    while v1702 < buffer.len(v1700) do
        local v1703 = nil;
        local v1704 = nil;
        local v1705, v1706, v1707 = v0.readTag(v1700, v1702);
        v1703 = v1705;
        v1704 = v1706;
        v1702 = v1707;
        if v1704 == v0.wireTypes.varint then
            v1705 = nil;
            v1706, v1707 = v0.readVarInt(v1700, v1702);
            v1705 = v1706;
            v1702 = v1707;
        elseif v1704 == v0.wireTypes.lengthDelimited then
            if v1703 == 1 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.roblox_component = buffer.tostring(v1705);
            elseif v1703 == 2 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.feed_item_id = buffer.tostring(v1705);
            else
                v1705 = nil;
                v1706, v1707 = v0.readVarInt(v1700, v1702);
                v1702 = v1707 + v1706;
            end;
        elseif v1704 == v0.wireTypes.i32 then
            v1705 = nil;
            v1706, v1707 = v0.readFixed32(v1700, v1702);
            v1705 = v1706;
            v1702 = v1707;
        elseif v1704 == v0.wireTypes.i64 then
            v1705 = nil;
            v1706, v1707 = v0.readFixed64(v1700, v1702);
            v1705 = v1706;
            v1702 = v1707;
        else
            error("Unsupported wire type: " .. v1704);
        end;
    end;
    return v1701;
end;
v4.jsonEncode = function(v1708) --[[ Line: 11038 ]] --[[ Name: jsonEncode ]]
    local v1709 = {};
    if v1708.roblox_component ~= nil and v1708.roblox_component ~= "" then
        v1709.robloxComponent = v1708.roblox_component;
    end;
    if v1708.feed_item_id ~= nil and v1708.feed_item_id ~= "" then
        v1709.feedItemId = v1708.feed_item_id;
    end;
    return v1709;
end;
v4.jsonDecode = function(v1710) --[[ Line: 11054 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_58 (copy)
    local v1711 = l_v4_58.new();
    if v1710.roblox_component ~= nil then
        v1711.roblox_component = v1710.roblox_component;
    end;
    if v1710.robloxComponent ~= nil then
        v1711.roblox_component = v1710.robloxComponent;
    end;
    if v1710.feed_item_id ~= nil then
        v1711.feed_item_id = v1710.feed_item_id;
    end;
    if v1710.feedItemId ~= nil then
        v1711.feed_item_id = v1710.feedItemId;
    end;
    return v1711;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogFeedItem"
};
v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem);
v4 = {};
v4.__index = v4;
local l_v4_59 = v4 --[[ copy: 4 -> 64 ]];
v4.new = function(v1713) --[[ Line: 11094 ]] --[[ Name: new ]]
    -- upvalues: l_v4_59 (copy)
    return (setmetatable({
        key = (not (v1713 ~= nil) or v1713.key == nil) and "" or v1713.key, 
        value = if not (v1713 ~= nil) or v1713.value == nil then nil else v1713.value
    }, l_v4_59));
end;
v4.encode = function(v1714) --[[ Line: 11106 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1715 = buffer.create(0);
    local v1716 = 0;
    if v1714.key ~= nil and v1714.key ~= "" then
        local v1717, v1718 = v0.writeTag(v1715, v1716, 1, v0.wireTypes.lengthDelimited);
        v1717, v1718 = v0.writeString(v1717, v1718, v1714.key);
        v1715 = v1717;
        v1716 = v1718;
    end;
    if v1714.value ~= nil then
        local v1719 = v1714.value:encode();
        local v1720, v1721 = v0.writeTag(v1715, v1716, 2, v0.wireTypes.lengthDelimited);
        v1720, v1721 = v0.writeBuffer(v1720, v1721, v1719, buffer.len(v1719));
        v1715 = v1720;
        v1716 = v1721;
    end;
    local v1722 = buffer.create(v1716);
    buffer.copy(v1722, 0, v1715, 0, v1716);
    return v1722;
end;
v4.decode = function(v1723) --[[ Line: 11128 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_59 (copy), v0 (copy), v2 (copy)
    local v1724 = l_v4_59.new();
    local v1725 = 0;
    while v1725 < buffer.len(v1723) do
        local v1726 = nil;
        local v1727 = nil;
        local v1728, v1729, v1730 = v0.readTag(v1723, v1725);
        v1726 = v1728;
        v1727 = v1729;
        v1725 = v1730;
        if v1727 == v0.wireTypes.varint then
            v1728 = nil;
            v1729, v1730 = v0.readVarInt(v1723, v1725);
            v1728 = v1729;
            v1725 = v1730;
        elseif v1727 == v0.wireTypes.lengthDelimited then
            if v1726 == 1 then
                v1728 = nil;
                v1729, v1730 = v0.readBuffer(v1723, v1725);
                v1728 = v1729;
                v1725 = v1730;
                v1724.key = buffer.tostring(v1728);
            elseif v1726 == 2 then
                v1728 = nil;
                v1729, v1730 = v0.readBuffer(v1723, v1725);
                v1728 = v1729;
                v1725 = v1730;
                v1724.value = v2.PageEntryInputData.decode(v1728);
            else
                v1728 = nil;
                v1729, v1730 = v0.readVarInt(v1723, v1725);
                v1725 = v1730 + v1729;
            end;
        elseif v1727 == v0.wireTypes.i32 then
            v1728 = nil;
            v1729, v1730 = v0.readFixed32(v1723, v1725);
            v1728 = v1729;
            v1725 = v1730;
        elseif v1727 == v0.wireTypes.i64 then
            v1728 = nil;
            v1729, v1730 = v0.readFixed64(v1723, v1725);
            v1728 = v1729;
            v1725 = v1730;
        else
            error("Unsupported wire type: " .. v1727);
        end;
    end;
    return v1724;
end;
v4.jsonEncode = function(v1731) --[[ Line: 11178 ]] --[[ Name: jsonEncode ]]
    local v1732 = {};
    if v1731.key ~= nil and v1731.key ~= "" then
        v1732.key = v1731.key;
    end;
    if v1731.value ~= nil then
        v1732.value = v1731.value:jsonEncode();
    end;
    return v1732;
end;
v4.jsonDecode = function(v1733) --[[ Line: 11194 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_59 (copy), v2 (copy)
    local v1734 = l_v4_59.new();
    if v1733.key ~= nil then
        v1734.key = v1733.key;
    end;
    if v1733.value ~= nil then
        v1734.value = v2.PageEntryInputData.jsonDecode(v1733.value);
    end;
    return v1734;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FeedItemInputMapEntry"
};
v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_60 = v4 --[[ copy: 4 -> 65 ]];
v4.new = function(v1736) --[[ Line: 11225 ]] --[[ Name: new ]]
    -- upvalues: l_v4_60 (copy)
    return (setmetatable({
        marketplace_catalog_category_items = if not (v1736 ~= nil) or v1736.marketplace_catalog_category_items == nil then {} else v1736.marketplace_catalog_category_items, 
        active_category_id = (not (v1736 ~= nil) or v1736.active_category_id == nil) and "" or v1736.active_category_id, 
        active_tooltip_idx = (not (v1736 ~= nil) or v1736.active_tooltip_idx == nil) and 0 or v1736.active_tooltip_idx
    }, l_v4_60));
end;
v4.encode = function(v1737) --[[ Line: 11238 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1738 = buffer.create(0);
    local v1739 = 0;
    if v1737.marketplace_catalog_category_items ~= nil and #v1737.marketplace_catalog_category_items > 0 then
        for _, v1741 in v1737.marketplace_catalog_category_items do
            local v1742 = v1741:encode();
            local v1743, v1744 = v0.writeTag(v1738, v1739, 1, v0.wireTypes.lengthDelimited);
            v1743, v1744 = v0.writeBuffer(v1743, v1744, v1742, buffer.len(v1742));
            v1738 = v1743;
            v1739 = v1744;
        end;
    end;
    if v1737.active_category_id ~= nil and v1737.active_category_id ~= "" then
        local v1745, v1746 = v0.writeTag(v1738, v1739, 2, v0.wireTypes.lengthDelimited);
        v1745, v1746 = v0.writeString(v1745, v1746, v1737.active_category_id);
        v1738 = v1745;
        v1739 = v1746;
    end;
    if v1737.active_tooltip_idx ~= nil and v1737.active_tooltip_idx ~= 0 then
        local v1747, v1748 = v0.writeTag(v1738, v1739, 3, v0.wireTypes.varint);
        v1747, v1748 = v0.writeVarInt(v1747, v1748, v1737.active_tooltip_idx);
        v1738 = v1747;
        v1739 = v1748;
    end;
    local v1749 = buffer.create(v1739);
    buffer.copy(v1749, 0, v1738, 0, v1739);
    return v1749;
end;
v4.decode = function(v1750) --[[ Line: 11267 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_60 (copy), v0 (copy), v2 (copy)
    local v1751 = l_v4_60.new();
    local v1752 = 0;
    while v1752 < buffer.len(v1750) do
        local v1753 = nil;
        local v1754 = nil;
        local v1755, v1756, v1757 = v0.readTag(v1750, v1752);
        v1753 = v1755;
        v1754 = v1756;
        v1752 = v1757;
        if v1754 == v0.wireTypes.varint then
            if v1753 == 3 then
                v1755 = nil;
                v1756, v1757 = v0.readVarIntI64(v1750, v1752);
                v1755 = v1756;
                v1752 = v1757;
                v1751.active_tooltip_idx = v1755;
            else
                v1755 = nil;
                v1756, v1757 = v0.readVarInt(v1750, v1752);
                v1755 = v1756;
                v1752 = v1757;
            end;
        elseif v1754 == v0.wireTypes.lengthDelimited then
            if v1753 == 1 then
                v1755 = nil;
                v1756, v1757 = v0.readBuffer(v1750, v1752);
                v1755 = v1756;
                v1752 = v1757;
                table.insert(v1751.marketplace_catalog_category_items, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(v1755));
            elseif v1753 == 2 then
                v1755 = nil;
                v1756, v1757 = v0.readBuffer(v1750, v1752);
                v1755 = v1756;
                v1752 = v1757;
                v1751.active_category_id = buffer.tostring(v1755);
            else
                v1755 = nil;
                v1756, v1757 = v0.readVarInt(v1750, v1752);
                v1752 = v1757 + v1756;
            end;
        elseif v1754 == v0.wireTypes.i32 then
            v1755 = nil;
            v1756, v1757 = v0.readFixed32(v1750, v1752);
            v1755 = v1756;
            v1752 = v1757;
        elseif v1754 == v0.wireTypes.i64 then
            v1755 = nil;
            v1756, v1757 = v0.readFixed64(v1750, v1752);
            v1755 = v1756;
            v1752 = v1757;
        else
            error("Unsupported wire type: " .. v1754);
        end;
    end;
    return v1751;
end;
v4.jsonEncode = function(v1758) --[[ Line: 11325 ]] --[[ Name: jsonEncode ]]
    local v1759 = {};
    if v1758.marketplace_catalog_category_items ~= nil and #v1758.marketplace_catalog_category_items > 0 then
        local v1760 = {};
        for _, v1762 in v1758.marketplace_catalog_category_items do
            table.insert(v1760, v1762:jsonEncode());
        end;
        v1759.marketplaceCatalogCategoryItems = v1760;
    end;
    if v1758.active_category_id ~= nil and v1758.active_category_id ~= "" then
        v1759.activeCategoryId = v1758.active_category_id;
    end;
    if v1758.active_tooltip_idx ~= nil and v1758.active_tooltip_idx ~= 0 then
        v1759.activeTooltipIdx = v1758.active_tooltip_idx;
    end;
    return v1759;
end;
v4.jsonDecode = function(v1763) --[[ Line: 11349 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_60 (copy), v2 (copy)
    local v1764 = l_v4_60.new();
    if v1763.marketplace_catalog_category_items ~= nil then
        local v1765 = {};
        for _, v1767 in v1763.marketplace_catalog_category_items do
            table.insert(v1765, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1767));
        end;
        v1764.marketplace_catalog_category_items = v1765;
    end;
    if v1763.marketplaceCatalogCategoryItems ~= nil then
        local v1768 = {};
        for _, v1770 in v1763.marketplaceCatalogCategoryItems do
            table.insert(v1768, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1770));
        end;
        v1764.marketplace_catalog_category_items = v1768;
    end;
    if v1763.active_category_id ~= nil then
        v1764.active_category_id = v1763.active_category_id;
    end;
    if v1763.activeCategoryId ~= nil then
        v1764.active_category_id = v1763.activeCategoryId;
    end;
    if v1763.active_tooltip_idx ~= nil then
        v1764.active_tooltip_idx = v1763.active_tooltip_idx;
    end;
    if v1763.activeTooltipIdx ~= nil then
        v1764.active_tooltip_idx = v1763.activeTooltipIdx;
    end;
    return v1764;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
};
v2.UAMarketplaceCatalogCategoryMenuInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData);
v4 = {};
v4.__index = v4;
v4.new = function(v1771) --[[ Line: 11412 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        marketplace_catalog_category_item_id = (not (v1771 ~= nil) or v1771.marketplace_catalog_category_item_id == nil) and "" or v1771.marketplace_catalog_category_item_id
    }, v4));
end;
v4.encode = function(v1772) --[[ Line: 11426 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1773 = buffer.create(0);
    local v1774 = 0;
    if v1772.marketplace_catalog_category_item_id ~= nil and v1772.marketplace_catalog_category_item_id ~= "" then
        local v1775, v1776 = v0.writeTag(v1773, v1774, 1, v0.wireTypes.lengthDelimited);
        v1775, v1776 = v0.writeString(v1775, v1776, v1772.marketplace_catalog_category_item_id);
        v1773 = v1775;
        v1774 = v1776;
    end;
    local v1777 = buffer.create(v1774);
    buffer.copy(v1777, 0, v1773, 0, v1774);
    return v1777;
end;
v4.decode = function(v1778) --[[ Line: 11442 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v1779 = v4.new();
    local v1780 = 0;
    while v1780 < buffer.len(v1778) do
        local v1781 = nil;
        local v1782 = nil;
        local v1783, v1784, v1785 = v0.readTag(v1778, v1780);
        v1781 = v1783;
        v1782 = v1784;
        v1780 = v1785;
        if v1782 == v0.wireTypes.varint then
            v1783 = nil;
            v1784, v1785 = v0.readVarInt(v1778, v1780);
            v1783 = v1784;
            v1780 = v1785;
        elseif v1782 == v0.wireTypes.lengthDelimited then
            if v1781 == 1 then
                v1783 = nil;
                v1784, v1785 = v0.readBuffer(v1778, v1780);
                v1783 = v1784;
                v1780 = v1785;
                v1779.marketplace_catalog_category_item_id = buffer.tostring(v1783);
            else
                v1783 = nil;
                v1784, v1785 = v0.readVarInt(v1778, v1780);
                v1780 = v1785 + v1784;
            end;
        elseif v1782 == v0.wireTypes.i32 then
            v1783 = nil;
            v1784, v1785 = v0.readFixed32(v1778, v1780);
            v1783 = v1784;
            v1780 = v1785;
        elseif v1782 == v0.wireTypes.i64 then
            v1783 = nil;
            v1784, v1785 = v0.readFixed64(v1778, v1780);
            v1783 = v1784;
            v1780 = v1785;
        else
            error("Unsupported wire type: " .. v1782);
        end;
    end;
    return v1779;
end;
v4.jsonEncode = function(v1786) --[[ Line: 11487 ]] --[[ Name: jsonEncode ]]
    local v1787 = {};
    if v1786.marketplace_catalog_category_item_id ~= nil and v1786.marketplace_catalog_category_item_id ~= "" then
        v1787.marketplaceCatalogCategoryItemId = v1786.marketplace_catalog_category_item_id;
    end;
    return v1787;
end;
v4.jsonDecode = function(v1788) --[[ Line: 11499 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy)
    local v1789 = v4.new();
    if v1788.marketplace_catalog_category_item_id ~= nil then
        v1789.marketplace_catalog_category_item_id = v1788.marketplace_catalog_category_item_id;
    end;
    if v1788.marketplaceCatalogCategoryItemId ~= nil then
        v1789.marketplace_catalog_category_item_id = v1788.marketplaceCatalogCategoryItemId;
    end;
    return v1789;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
};
v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem);
v2.PageEntryFormat = {
    fromNumber = function(v1790) --[[ Line: 11529 ]] --[[ Name: fromNumber ]]
        if v1790 == 0 then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v1790 == 1 then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end, 
    toNumber = function(v1791) --[[ Line: 11539 ]] --[[ Name: toNumber ]]
        if v1791 == "PAGE_ENTRY_FORMAT_INVALID" then
            return 0;
        elseif v1791 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return 1;
        else
            return v1791;
        end;
    end, 
    fromName = function(v1792) --[[ Line: 11549 ]] --[[ Name: fromName ]]
        if v1792 == "PAGE_ENTRY_FORMAT_INVALID" then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v1792 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
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
    ExperienceContentRatingLabelInputData = v2.ExperienceContentRatingLabelInputData, 
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
    CoachmarkInputData = v2.CoachmarkInputData, 
    EventDetailsFeedInputData = v2.EventDetailsFeedInputData, 
    EventDetailsActionBarInputData = v2.EventDetailsActionBarInputData, 
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