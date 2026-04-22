local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.page_entry);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 2336 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        page_entry = if not (v6 ~= nil) or v6.page_entry == nil then nil else v6.page_entry, 
        input_data = if not (v6 ~= nil) or v6.input_data == nil then nil else v6.input_data
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 2343 ]] --[[ Name: encode ]]
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
v4.decode = function(v17) --[[ Line: 2364 ]] --[[ Name: decode ]]
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
v4.jsonEncode = function(v25) --[[ Line: 2412 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.page_entry ~= nil then
        v26.pageEntry = v25.page_entry:jsonEncode();
    end;
    if v25.input_data ~= nil then
        v26.inputData = v25.input_data:jsonEncode();
    end;
    return v26;
end;
v4.jsonDecode = function(v27) --[[ Line: 2426 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v30) --[[ Line: 2462 ]] --[[ Name: new ]]
    -- upvalues: l_v4_1 (copy)
    return (setmetatable({
        input_data = if not (v30 ~= nil) or v30.input_data == nil then nil else v30.input_data, 
        roblox_component = (not (v30 ~= nil) or v30.roblox_component == nil) and "" or v30.roblox_component
    }, l_v4_1));
end;
v4.encode = function(v31) --[[ Line: 2469 ]] --[[ Name: encode ]]
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
v4.decode = function(v40) --[[ Line: 2489 ]] --[[ Name: decode ]]
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
v4.jsonEncode = function(v48) --[[ Line: 2537 ]] --[[ Name: jsonEncode ]]
    local v49 = {};
    if v48.input_data ~= nil then
        v49.inputData = v48.input_data:jsonEncode();
    end;
    if v48.roblox_component ~= nil and v48.roblox_component ~= "" then
        v49.robloxComponent = v48.roblox_component;
    end;
    return v49;
end;
v4.jsonDecode = function(v50) --[[ Line: 2551 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v53) --[[ Line: 2587 ]] --[[ Name: new ]]
    -- upvalues: l_v4_2 (copy)
    return (setmetatable({
        kind = if not (v53 ~= nil) or v53.kind == nil then nil else v53.kind
    }, l_v4_2));
end;
v4.encode = function(v54) --[[ Line: 2593 ]] --[[ Name: encode ]]
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
        elseif v54.kind.type == "game_pass_collection" then
            local v96 = v54.kind.value:encode();
            local v97, v98 = v0.writeTag(v55, v56, 14, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
            v55 = v97;
            v56 = v98;
        elseif v54.kind.type == "developer_product_collection" then
            local v99 = v54.kind.value:encode();
            local v100, v101 = v0.writeTag(v55, v56, 15, v0.wireTypes.lengthDelimited);
            v100, v101 = v0.writeBuffer(v100, v101, v99, buffer.len(v99));
            v55 = v100;
            v56 = v101;
        elseif v54.kind.type == "subscription_collection" then
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
        elseif v54.kind.type == "catalog_item_list" then
            local v123 = v54.kind.value:encode();
            local v124, v125 = v0.writeTag(v55, v56, 26, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v55 = v124;
            v56 = v125;
        elseif v54.kind.type == "user_list" then
            local v126 = v54.kind.value:encode();
            local v127, v128 = v0.writeTag(v55, v56, 27, v0.wireTypes.lengthDelimited);
            v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
            v55 = v127;
            v56 = v128;
        elseif v54.kind.type == "experience_content_rating_label" then
            local v129 = v54.kind.value:encode();
            local v130, v131 = v0.writeTag(v55, v56, 30, v0.wireTypes.lengthDelimited);
            v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
            v55 = v130;
            v56 = v131;
        elseif v54.kind.type == "experience_refund_policy" then
            local v132 = v54.kind.value:encode();
            local v133, v134 = v0.writeTag(v55, v56, 31, v0.wireTypes.lengthDelimited);
            v133, v134 = v0.writeBuffer(v133, v134, v132, buffer.len(v132));
            v55 = v133;
            v56 = v134;
        elseif v54.kind.type == "experience_details_feed" then
            local v135 = v54.kind.value:encode();
            local v136, v137 = v0.writeTag(v55, v56, 500, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeBuffer(v136, v137, v135, buffer.len(v135));
            v55 = v136;
            v56 = v137;
        elseif v54.kind.type == "experience_details_action_bar" then
            local v138 = v54.kind.value:encode();
            local v139, v140 = v0.writeTag(v55, v56, 501, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v55 = v139;
            v56 = v140;
        elseif v54.kind.type == "experience_details_banner_image" then
            local v141 = v54.kind.value:encode();
            local v142, v143 = v0.writeTag(v55, v56, 502, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v55 = v142;
            v56 = v143;
        elseif v54.kind.type == "experience_details_sticky_header" then
            local v144 = v54.kind.value:encode();
            local v145, v146 = v0.writeTag(v55, v56, 503, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
            v55 = v145;
            v56 = v146;
        elseif v54.kind.type == "event_details_feed" then
            local v147 = v54.kind.value:encode();
            local v148, v149 = v0.writeTag(v55, v56, 600, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v55 = v148;
            v56 = v149;
        elseif v54.kind.type == "event_details_action_bar" then
            local v150 = v54.kind.value:encode();
            local v151, v152 = v0.writeTag(v55, v56, 601, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v55 = v151;
            v56 = v152;
        elseif v54.kind.type == "event_attribution_row" then
            local v153 = v54.kind.value:encode();
            local v154, v155 = v0.writeTag(v55, v56, 602, v0.wireTypes.lengthDelimited);
            v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
            v55 = v154;
            v56 = v155;
        elseif v54.kind.type == "event_description" then
            local v156 = v54.kind.value:encode();
            local v157, v158 = v0.writeTag(v55, v56, 603, v0.wireTypes.lengthDelimited);
            v157, v158 = v0.writeBuffer(v157, v158, v156, buffer.len(v156));
            v55 = v157;
            v56 = v158;
        elseif v54.kind.type == "event_info_table" then
            local v159 = v54.kind.value:encode();
            local v160, v161 = v0.writeTag(v55, v56, 604, v0.wireTypes.lengthDelimited);
            v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
            v55 = v160;
            v56 = v161;
        elseif v54.kind.type == "dev_store_feed" then
            local v162 = v54.kind.value:encode();
            local v163, v164 = v0.writeTag(v55, v56, 700, v0.wireTypes.lengthDelimited);
            v163, v164 = v0.writeBuffer(v163, v164, v162, buffer.len(v162));
            v55 = v163;
            v56 = v164;
        elseif v54.kind.type == "charts_feed" then
            local v165 = v54.kind.value:encode();
            local v166, v167 = v0.writeTag(v55, v56, 800, v0.wireTypes.lengthDelimited);
            v166, v167 = v0.writeBuffer(v166, v167, v165, buffer.len(v165));
            v55 = v166;
            v56 = v167;
        elseif v54.kind.type == "filter_pills" then
            local v168 = v54.kind.value:encode();
            local v169, v170 = v0.writeTag(v55, v56, 801, v0.wireTypes.lengthDelimited);
            v169, v170 = v0.writeBuffer(v169, v170, v168, buffer.len(v168));
            v55 = v169;
            v56 = v170;
        elseif v54.kind.type == "sort_selector" then
            local v171 = v54.kind.value:encode();
            local v172, v173 = v0.writeTag(v55, v56, 802, v0.wireTypes.lengthDelimited);
            v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
            v55 = v172;
            v56 = v173;
        elseif v54.kind.type == "marketplace_catalog_feed" then
            local v174 = v54.kind.value:encode();
            local v175, v176 = v0.writeTag(v55, v56, 900, v0.wireTypes.lengthDelimited);
            v175, v176 = v0.writeBuffer(v175, v176, v174, buffer.len(v174));
            v55 = v175;
            v56 = v176;
        elseif v54.kind.type == "marketplace_catalog_category_menu" then
            local v177 = v54.kind.value:encode();
            local v178, v179 = v0.writeTag(v55, v56, 901, v0.wireTypes.lengthDelimited);
            v178, v179 = v0.writeBuffer(v178, v179, v177, buffer.len(v177));
            v55 = v178;
            v56 = v179;
        elseif v54.kind.type == "marketplace_catalog_item_group" then
            local v180 = v54.kind.value:encode();
            local v181, v182 = v0.writeTag(v55, v56, 902, v0.wireTypes.lengthDelimited);
            v181, v182 = v0.writeBuffer(v181, v182, v180, buffer.len(v180));
            v55 = v181;
            v56 = v182;
        elseif v54.kind.type == "marketplace_catalog_item_carousel" then
            local v183 = v54.kind.value:encode();
            local v184, v185 = v0.writeTag(v55, v56, 903, v0.wireTypes.lengthDelimited);
            v184, v185 = v0.writeBuffer(v184, v185, v183, buffer.len(v183));
            v55 = v184;
            v56 = v185;
        elseif v54.kind.type == "search_results_feed" then
            local v186 = v54.kind.value:encode();
            local v187, v188 = v0.writeTag(v55, v56, 1000, v0.wireTypes.lengthDelimited);
            v187, v188 = v0.writeBuffer(v187, v188, v186, buffer.len(v186));
            v55 = v187;
            v56 = v188;
        end;
    end;
    local v189 = buffer.create(v56);
    buffer.copy(v189, 0, v55, 0, v56);
    return v189;
end;
v4.decode = function(v190) --[[ Line: 2782 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_2 (copy), v0 (copy), v2 (copy)
    local v191 = l_v4_2.new();
    local v192 = 0;
    while v192 < buffer.len(v190) do
        local v193 = nil;
        local v194 = nil;
        local v195, v196, v197 = v0.readTag(v190, v192);
        v193 = v195;
        v194 = v196;
        v192 = v197;
        if v194 == v0.wireTypes.varint then
            v195 = nil;
            v196, v197 = v0.readVarInt(v190, v192);
            v195 = v196;
            v192 = v197;
        elseif v194 == v0.wireTypes.lengthDelimited then
            if v193 == 1 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "badges_grid", 
                    value = v2.BadgesGridInputData.decode(v195)
                };
            elseif v193 == 2 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "badge_details", 
                    value = v2.BadgeDetailsInputData.decode(v195)
                };
            elseif v193 == 3 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "static_content", 
                    value = v2.StaticInputData.decode(v195)
                };
            elseif v193 == 4 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_attribution_row", 
                    value = v2.ExperienceAttributionRowInputData.decode(v195)
                };
            elseif v193 == 5 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_action_module", 
                    value = v2.ExperienceActionModuleInputData.decode(v195)
                };
            elseif v193 == 6 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_media_gallery", 
                    value = v2.ExperienceMediaGalleryInputData.decode(v195)
                };
            elseif v193 == 7 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_description", 
                    value = v2.ExperienceDescriptionInputData.decode(v195)
                };
            elseif v193 == 8 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_stat_row", 
                    value = v2.ExperienceStatRowInputData.decode(v195)
                };
            elseif v193 == 9 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_info_table", 
                    value = v2.ExperienceInfoTableInputData.decode(v195)
                };
            elseif v193 == 10 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "social_link_row", 
                    value = v2.SocialLinkRowInputData.decode(v195)
                };
            elseif v193 == 11 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_carousel", 
                    value = v2.ExperienceCarouselInputData.decode(v195)
                };
            elseif v193 == 12 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "song_carousel", 
                    value = v2.SongCarouselInputData.decode(v195)
                };
            elseif v193 == 13 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "events_carousel", 
                    value = v2.EventsCarouselInputData.decode(v195)
                };
            elseif v193 == 14 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "game_pass_collection", 
                    value = v2.GamePassCollectionInputData.decode(v195)
                };
            elseif v193 == 15 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "developer_product_collection", 
                    value = v2.DeveloperProductCollectionInputData.decode(v195)
                };
            elseif v193 == 16 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "subscription_collection", 
                    value = v2.SubscriptionCollectionInputData.decode(v195)
                };
            elseif v193 == 20 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "card_container", 
                    value = v2.CardContainerInputData.decode(v195)
                };
            elseif v193 == 21 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "card", 
                    value = v2.CardInputData.decode(v195)
                };
            elseif v193 == 22 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "dialog", 
                    value = v2.DialogInputData.decode(v195)
                };
            elseif v193 == 23 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "banner", 
                    value = v2.BannerInputData.decode(v195)
                };
            elseif v193 == 24 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "tooltip", 
                    value = v2.TooltipInputData.decode(v195)
                };
            elseif v193 == 25 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "coachmark", 
                    value = v2.CoachmarkInputData.decode(v195)
                };
            elseif v193 == 26 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "catalog_item_list", 
                    value = v2.CatalogItemListInputData.decode(v195)
                };
            elseif v193 == 27 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "user_list", 
                    value = v2.UserListInputData.decode(v195)
                };
            elseif v193 == 30 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_content_rating_label", 
                    value = v2.ExperienceContentRatingLabelInputData.decode(v195)
                };
            elseif v193 == 31 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_refund_policy", 
                    value = v2.ExperienceRefundPolicyInputData.decode(v195)
                };
            elseif v193 == 500 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_details_feed", 
                    value = v2.ExperienceDetailsFeedInputData.decode(v195)
                };
            elseif v193 == 501 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_details_action_bar", 
                    value = v2.ExperienceDetailsActionBarInputData.decode(v195)
                };
            elseif v193 == 502 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_details_banner_image", 
                    value = v2.ExperienceDetailsBannerImageInputData.decode(v195)
                };
            elseif v193 == 503 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "experience_details_sticky_header", 
                    value = v2.ExperienceDetailsStickyHeaderInputData.decode(v195)
                };
            elseif v193 == 600 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "event_details_feed", 
                    value = v2.EventDetailsFeedInputData.decode(v195)
                };
            elseif v193 == 601 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "event_details_action_bar", 
                    value = v2.EventDetailsActionBarInputData.decode(v195)
                };
            elseif v193 == 602 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "event_attribution_row", 
                    value = v2.EventAttributionRowInputData.decode(v195)
                };
            elseif v193 == 603 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "event_description", 
                    value = v2.EventDescriptionInputData.decode(v195)
                };
            elseif v193 == 604 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "event_info_table", 
                    value = v2.EventInfoTableInputData.decode(v195)
                };
            elseif v193 == 700 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "dev_store_feed", 
                    value = v2.DevStoreFeedInputData.decode(v195)
                };
            elseif v193 == 800 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "charts_feed", 
                    value = v2.ChartsFeedInputData.decode(v195)
                };
            elseif v193 == 801 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "filter_pills", 
                    value = v2.FilterPillsInputData.decode(v195)
                };
            elseif v193 == 802 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "sort_selector", 
                    value = v2.SortSelectorInputData.decode(v195)
                };
            elseif v193 == 900 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "marketplace_catalog_feed", 
                    value = v2.UAMarketplaceCatalogFeedInputData.decode(v195)
                };
            elseif v193 == 901 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "marketplace_catalog_category_menu", 
                    value = v2.UAMarketplaceCatalogCategoryMenuInputData.decode(v195)
                };
            elseif v193 == 902 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "marketplace_catalog_item_group", 
                    value = v2.UAMarketplaceCatalogItemGroupInputData.decode(v195)
                };
            elseif v193 == 903 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "marketplace_catalog_item_carousel", 
                    value = v2.UAMarketplaceCatalogItemCarouselInputData.decode(v195)
                };
            elseif v193 == 1000 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.kind = {
                    type = "search_results_feed", 
                    value = v2.SearchResultsFeedInputData.decode(v195)
                };
            else
                v195 = nil;
                v196, v197 = v0.readVarInt(v190, v192);
                v192 = v197 + v196;
            end;
        elseif v194 == v0.wireTypes.i32 then
            v195 = nil;
            v196, v197 = v0.readFixed32(v190, v192);
            v195 = v196;
            v192 = v197;
        elseif v194 == v0.wireTypes.i64 then
            v195 = nil;
            v196, v197 = v0.readFixed64(v190, v192);
            v195 = v196;
            v192 = v197;
        else
            error("Unsupported wire type: " .. v194);
        end;
    end;
    return v191;
end;
v4.jsonEncode = function(v198) --[[ Line: 3098 ]] --[[ Name: jsonEncode ]]
    local v199 = {};
    if v198.kind ~= nil then
        if v198.kind.type == "badges_grid" then
            v199.badgesGrid = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "badge_details" then
            v199.badgeDetails = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "static_content" then
            v199.staticContent = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_attribution_row" then
            v199.experienceAttributionRow = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_action_module" then
            v199.experienceActionModule = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_media_gallery" then
            v199.experienceMediaGallery = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_description" then
            v199.experienceDescription = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_stat_row" then
            v199.experienceStatRow = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_info_table" then
            v199.experienceInfoTable = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "social_link_row" then
            v199.socialLinkRow = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_carousel" then
            v199.experienceCarousel = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "song_carousel" then
            v199.songCarousel = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "events_carousel" then
            v199.eventsCarousel = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "game_pass_collection" then
            v199.gamePassCollection = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "developer_product_collection" then
            v199.developerProductCollection = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "subscription_collection" then
            v199.subscriptionCollection = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "card_container" then
            v199.cardContainer = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "card" then
            v199.card = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "dialog" then
            v199.dialog = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "banner" then
            v199.banner = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "tooltip" then
            v199.tooltip = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "coachmark" then
            v199.coachmark = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "catalog_item_list" then
            v199.catalogItemList = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "user_list" then
            v199.userList = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_content_rating_label" then
            v199.experienceContentRatingLabel = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_refund_policy" then
            v199.experienceRefundPolicy = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_details_feed" then
            v199.experienceDetailsFeed = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_details_action_bar" then
            v199.experienceDetailsActionBar = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_details_banner_image" then
            v199.experienceDetailsBannerImage = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "experience_details_sticky_header" then
            v199.experienceDetailsStickyHeader = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "event_details_feed" then
            v199.eventDetailsFeed = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "event_details_action_bar" then
            v199.eventDetailsActionBar = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "event_attribution_row" then
            v199.eventAttributionRow = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "event_description" then
            v199.eventDescription = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "event_info_table" then
            v199.eventInfoTable = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "dev_store_feed" then
            v199.devStoreFeed = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "charts_feed" then
            v199.chartsFeed = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "filter_pills" then
            v199.filterPills = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "sort_selector" then
            v199.sortSelector = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "marketplace_catalog_feed" then
            v199.marketplaceCatalogFeed = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "marketplace_catalog_category_menu" then
            v199.marketplaceCatalogCategoryMenu = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "marketplace_catalog_item_group" then
            v199.marketplaceCatalogItemGroup = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "marketplace_catalog_item_carousel" then
            v199.marketplaceCatalogItemCarousel = v198.kind.value:jsonEncode();
            return v199;
        elseif v198.kind.type == "search_results_feed" then
            v199.searchResultsFeed = v198.kind.value:jsonEncode();
        end;
    end;
    return v199;
end;
v4.jsonDecode = function(v200) --[[ Line: 3196 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_2 (copy), v2 (copy)
    local v201 = l_v4_2.new();
    if v200.badges_grid ~= nil then
        v201.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v200.badges_grid)
        };
    end;
    if v200.badgesGrid ~= nil then
        v201.kind = {
            type = "badges_grid", 
            value = v2.BadgesGridInputData.jsonDecode(v200.badgesGrid)
        };
    end;
    if v200.badge_details ~= nil then
        v201.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v200.badge_details)
        };
    end;
    if v200.badgeDetails ~= nil then
        v201.kind = {
            type = "badge_details", 
            value = v2.BadgeDetailsInputData.jsonDecode(v200.badgeDetails)
        };
    end;
    if v200.static_content ~= nil then
        v201.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v200.static_content)
        };
    end;
    if v200.staticContent ~= nil then
        v201.kind = {
            type = "static_content", 
            value = v2.StaticInputData.jsonDecode(v200.staticContent)
        };
    end;
    if v200.experience_attribution_row ~= nil then
        v201.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v200.experience_attribution_row)
        };
    end;
    if v200.experienceAttributionRow ~= nil then
        v201.kind = {
            type = "experience_attribution_row", 
            value = v2.ExperienceAttributionRowInputData.jsonDecode(v200.experienceAttributionRow)
        };
    end;
    if v200.experience_action_module ~= nil then
        v201.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v200.experience_action_module)
        };
    end;
    if v200.experienceActionModule ~= nil then
        v201.kind = {
            type = "experience_action_module", 
            value = v2.ExperienceActionModuleInputData.jsonDecode(v200.experienceActionModule)
        };
    end;
    if v200.experience_media_gallery ~= nil then
        v201.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v200.experience_media_gallery)
        };
    end;
    if v200.experienceMediaGallery ~= nil then
        v201.kind = {
            type = "experience_media_gallery", 
            value = v2.ExperienceMediaGalleryInputData.jsonDecode(v200.experienceMediaGallery)
        };
    end;
    if v200.experience_description ~= nil then
        v201.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v200.experience_description)
        };
    end;
    if v200.experienceDescription ~= nil then
        v201.kind = {
            type = "experience_description", 
            value = v2.ExperienceDescriptionInputData.jsonDecode(v200.experienceDescription)
        };
    end;
    if v200.experience_stat_row ~= nil then
        v201.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v200.experience_stat_row)
        };
    end;
    if v200.experienceStatRow ~= nil then
        v201.kind = {
            type = "experience_stat_row", 
            value = v2.ExperienceStatRowInputData.jsonDecode(v200.experienceStatRow)
        };
    end;
    if v200.experience_info_table ~= nil then
        v201.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v200.experience_info_table)
        };
    end;
    if v200.experienceInfoTable ~= nil then
        v201.kind = {
            type = "experience_info_table", 
            value = v2.ExperienceInfoTableInputData.jsonDecode(v200.experienceInfoTable)
        };
    end;
    if v200.social_link_row ~= nil then
        v201.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v200.social_link_row)
        };
    end;
    if v200.socialLinkRow ~= nil then
        v201.kind = {
            type = "social_link_row", 
            value = v2.SocialLinkRowInputData.jsonDecode(v200.socialLinkRow)
        };
    end;
    if v200.experience_carousel ~= nil then
        v201.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v200.experience_carousel)
        };
    end;
    if v200.experienceCarousel ~= nil then
        v201.kind = {
            type = "experience_carousel", 
            value = v2.ExperienceCarouselInputData.jsonDecode(v200.experienceCarousel)
        };
    end;
    if v200.song_carousel ~= nil then
        v201.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v200.song_carousel)
        };
    end;
    if v200.songCarousel ~= nil then
        v201.kind = {
            type = "song_carousel", 
            value = v2.SongCarouselInputData.jsonDecode(v200.songCarousel)
        };
    end;
    if v200.events_carousel ~= nil then
        v201.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v200.events_carousel)
        };
    end;
    if v200.eventsCarousel ~= nil then
        v201.kind = {
            type = "events_carousel", 
            value = v2.EventsCarouselInputData.jsonDecode(v200.eventsCarousel)
        };
    end;
    if v200.game_pass_collection ~= nil then
        v201.kind = {
            type = "game_pass_collection", 
            value = v2.GamePassCollectionInputData.jsonDecode(v200.game_pass_collection)
        };
    end;
    if v200.gamePassCollection ~= nil then
        v201.kind = {
            type = "game_pass_collection", 
            value = v2.GamePassCollectionInputData.jsonDecode(v200.gamePassCollection)
        };
    end;
    if v200.developer_product_collection ~= nil then
        v201.kind = {
            type = "developer_product_collection", 
            value = v2.DeveloperProductCollectionInputData.jsonDecode(v200.developer_product_collection)
        };
    end;
    if v200.developerProductCollection ~= nil then
        v201.kind = {
            type = "developer_product_collection", 
            value = v2.DeveloperProductCollectionInputData.jsonDecode(v200.developerProductCollection)
        };
    end;
    if v200.subscription_collection ~= nil then
        v201.kind = {
            type = "subscription_collection", 
            value = v2.SubscriptionCollectionInputData.jsonDecode(v200.subscription_collection)
        };
    end;
    if v200.subscriptionCollection ~= nil then
        v201.kind = {
            type = "subscription_collection", 
            value = v2.SubscriptionCollectionInputData.jsonDecode(v200.subscriptionCollection)
        };
    end;
    if v200.card_container ~= nil then
        v201.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v200.card_container)
        };
    end;
    if v200.cardContainer ~= nil then
        v201.kind = {
            type = "card_container", 
            value = v2.CardContainerInputData.jsonDecode(v200.cardContainer)
        };
    end;
    if v200.card ~= nil then
        v201.kind = {
            type = "card", 
            value = v2.CardInputData.jsonDecode(v200.card)
        };
    end;
    if v200.dialog ~= nil then
        v201.kind = {
            type = "dialog", 
            value = v2.DialogInputData.jsonDecode(v200.dialog)
        };
    end;
    if v200.banner ~= nil then
        v201.kind = {
            type = "banner", 
            value = v2.BannerInputData.jsonDecode(v200.banner)
        };
    end;
    if v200.tooltip ~= nil then
        v201.kind = {
            type = "tooltip", 
            value = v2.TooltipInputData.jsonDecode(v200.tooltip)
        };
    end;
    if v200.coachmark ~= nil then
        v201.kind = {
            type = "coachmark", 
            value = v2.CoachmarkInputData.jsonDecode(v200.coachmark)
        };
    end;
    if v200.catalog_item_list ~= nil then
        v201.kind = {
            type = "catalog_item_list", 
            value = v2.CatalogItemListInputData.jsonDecode(v200.catalog_item_list)
        };
    end;
    if v200.catalogItemList ~= nil then
        v201.kind = {
            type = "catalog_item_list", 
            value = v2.CatalogItemListInputData.jsonDecode(v200.catalogItemList)
        };
    end;
    if v200.user_list ~= nil then
        v201.kind = {
            type = "user_list", 
            value = v2.UserListInputData.jsonDecode(v200.user_list)
        };
    end;
    if v200.userList ~= nil then
        v201.kind = {
            type = "user_list", 
            value = v2.UserListInputData.jsonDecode(v200.userList)
        };
    end;
    if v200.experience_content_rating_label ~= nil then
        v201.kind = {
            type = "experience_content_rating_label", 
            value = v2.ExperienceContentRatingLabelInputData.jsonDecode(v200.experience_content_rating_label)
        };
    end;
    if v200.experienceContentRatingLabel ~= nil then
        v201.kind = {
            type = "experience_content_rating_label", 
            value = v2.ExperienceContentRatingLabelInputData.jsonDecode(v200.experienceContentRatingLabel)
        };
    end;
    if v200.experience_refund_policy ~= nil then
        v201.kind = {
            type = "experience_refund_policy", 
            value = v2.ExperienceRefundPolicyInputData.jsonDecode(v200.experience_refund_policy)
        };
    end;
    if v200.experienceRefundPolicy ~= nil then
        v201.kind = {
            type = "experience_refund_policy", 
            value = v2.ExperienceRefundPolicyInputData.jsonDecode(v200.experienceRefundPolicy)
        };
    end;
    if v200.experience_details_feed ~= nil then
        v201.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v200.experience_details_feed)
        };
    end;
    if v200.experienceDetailsFeed ~= nil then
        v201.kind = {
            type = "experience_details_feed", 
            value = v2.ExperienceDetailsFeedInputData.jsonDecode(v200.experienceDetailsFeed)
        };
    end;
    if v200.experience_details_action_bar ~= nil then
        v201.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v200.experience_details_action_bar)
        };
    end;
    if v200.experienceDetailsActionBar ~= nil then
        v201.kind = {
            type = "experience_details_action_bar", 
            value = v2.ExperienceDetailsActionBarInputData.jsonDecode(v200.experienceDetailsActionBar)
        };
    end;
    if v200.experience_details_banner_image ~= nil then
        v201.kind = {
            type = "experience_details_banner_image", 
            value = v2.ExperienceDetailsBannerImageInputData.jsonDecode(v200.experience_details_banner_image)
        };
    end;
    if v200.experienceDetailsBannerImage ~= nil then
        v201.kind = {
            type = "experience_details_banner_image", 
            value = v2.ExperienceDetailsBannerImageInputData.jsonDecode(v200.experienceDetailsBannerImage)
        };
    end;
    if v200.experience_details_sticky_header ~= nil then
        v201.kind = {
            type = "experience_details_sticky_header", 
            value = v2.ExperienceDetailsStickyHeaderInputData.jsonDecode(v200.experience_details_sticky_header)
        };
    end;
    if v200.experienceDetailsStickyHeader ~= nil then
        v201.kind = {
            type = "experience_details_sticky_header", 
            value = v2.ExperienceDetailsStickyHeaderInputData.jsonDecode(v200.experienceDetailsStickyHeader)
        };
    end;
    if v200.event_details_feed ~= nil then
        v201.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v200.event_details_feed)
        };
    end;
    if v200.eventDetailsFeed ~= nil then
        v201.kind = {
            type = "event_details_feed", 
            value = v2.EventDetailsFeedInputData.jsonDecode(v200.eventDetailsFeed)
        };
    end;
    if v200.event_details_action_bar ~= nil then
        v201.kind = {
            type = "event_details_action_bar", 
            value = v2.EventDetailsActionBarInputData.jsonDecode(v200.event_details_action_bar)
        };
    end;
    if v200.eventDetailsActionBar ~= nil then
        v201.kind = {
            type = "event_details_action_bar", 
            value = v2.EventDetailsActionBarInputData.jsonDecode(v200.eventDetailsActionBar)
        };
    end;
    if v200.event_attribution_row ~= nil then
        v201.kind = {
            type = "event_attribution_row", 
            value = v2.EventAttributionRowInputData.jsonDecode(v200.event_attribution_row)
        };
    end;
    if v200.eventAttributionRow ~= nil then
        v201.kind = {
            type = "event_attribution_row", 
            value = v2.EventAttributionRowInputData.jsonDecode(v200.eventAttributionRow)
        };
    end;
    if v200.event_description ~= nil then
        v201.kind = {
            type = "event_description", 
            value = v2.EventDescriptionInputData.jsonDecode(v200.event_description)
        };
    end;
    if v200.eventDescription ~= nil then
        v201.kind = {
            type = "event_description", 
            value = v2.EventDescriptionInputData.jsonDecode(v200.eventDescription)
        };
    end;
    if v200.event_info_table ~= nil then
        v201.kind = {
            type = "event_info_table", 
            value = v2.EventInfoTableInputData.jsonDecode(v200.event_info_table)
        };
    end;
    if v200.eventInfoTable ~= nil then
        v201.kind = {
            type = "event_info_table", 
            value = v2.EventInfoTableInputData.jsonDecode(v200.eventInfoTable)
        };
    end;
    if v200.dev_store_feed ~= nil then
        v201.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v200.dev_store_feed)
        };
    end;
    if v200.devStoreFeed ~= nil then
        v201.kind = {
            type = "dev_store_feed", 
            value = v2.DevStoreFeedInputData.jsonDecode(v200.devStoreFeed)
        };
    end;
    if v200.charts_feed ~= nil then
        v201.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v200.charts_feed)
        };
    end;
    if v200.chartsFeed ~= nil then
        v201.kind = {
            type = "charts_feed", 
            value = v2.ChartsFeedInputData.jsonDecode(v200.chartsFeed)
        };
    end;
    if v200.filter_pills ~= nil then
        v201.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v200.filter_pills)
        };
    end;
    if v200.filterPills ~= nil then
        v201.kind = {
            type = "filter_pills", 
            value = v2.FilterPillsInputData.jsonDecode(v200.filterPills)
        };
    end;
    if v200.sort_selector ~= nil then
        v201.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v200.sort_selector)
        };
    end;
    if v200.sortSelector ~= nil then
        v201.kind = {
            type = "sort_selector", 
            value = v2.SortSelectorInputData.jsonDecode(v200.sortSelector)
        };
    end;
    if v200.marketplace_catalog_feed ~= nil then
        v201.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v200.marketplace_catalog_feed)
        };
    end;
    if v200.marketplaceCatalogFeed ~= nil then
        v201.kind = {
            type = "marketplace_catalog_feed", 
            value = v2.UAMarketplaceCatalogFeedInputData.jsonDecode(v200.marketplaceCatalogFeed)
        };
    end;
    if v200.marketplace_catalog_category_menu ~= nil then
        v201.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v200.marketplace_catalog_category_menu)
        };
    end;
    if v200.marketplaceCatalogCategoryMenu ~= nil then
        v201.kind = {
            type = "marketplace_catalog_category_menu", 
            value = v2.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(v200.marketplaceCatalogCategoryMenu)
        };
    end;
    if v200.marketplace_catalog_item_group ~= nil then
        v201.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v200.marketplace_catalog_item_group)
        };
    end;
    if v200.marketplaceCatalogItemGroup ~= nil then
        v201.kind = {
            type = "marketplace_catalog_item_group", 
            value = v2.UAMarketplaceCatalogItemGroupInputData.jsonDecode(v200.marketplaceCatalogItemGroup)
        };
    end;
    if v200.marketplace_catalog_item_carousel ~= nil then
        v201.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v200.marketplace_catalog_item_carousel)
        };
    end;
    if v200.marketplaceCatalogItemCarousel ~= nil then
        v201.kind = {
            type = "marketplace_catalog_item_carousel", 
            value = v2.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(v200.marketplaceCatalogItemCarousel)
        };
    end;
    if v200.search_results_feed ~= nil then
        v201.kind = {
            type = "search_results_feed", 
            value = v2.SearchResultsFeedInputData.jsonDecode(v200.search_results_feed)
        };
    end;
    if v200.searchResultsFeed ~= nil then
        v201.kind = {
            type = "search_results_feed", 
            value = v2.SearchResultsFeedInputData.jsonDecode(v200.searchResultsFeed)
        };
    end;
    return v201;
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
v4.new = function(v203) --[[ Line: 3738 ]] --[[ Name: new ]]
    -- upvalues: l_v4_3 (copy)
    return (setmetatable({
        section_title = (not (v203 ~= nil) or v203.section_title == nil) and "" or v203.section_title, 
        badges = if not (v203 ~= nil) or v203.badges == nil then {} else v203.badges, 
        collection_id = (not (v203 ~= nil) or v203.collection_id == nil) and "" or v203.collection_id, 
        collection_position = (not (v203 ~= nil) or v203.collection_position == nil) and "" or v203.collection_position, 
        universe_id = (not (v203 ~= nil) or v203.universe_id == nil) and "" or v203.universe_id
    }, l_v4_3));
end;
v4.encode = function(v204) --[[ Line: 3750 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v205 = buffer.create(0);
    local v206 = 0;
    if v204.section_title ~= nil and v204.section_title ~= "" then
        local v207, v208 = v0.writeTag(v205, v206, 1, v0.wireTypes.lengthDelimited);
        v207, v208 = v0.writeString(v207, v208, v204.section_title);
        v205 = v207;
        v206 = v208;
    end;
    if v204.badges ~= nil and #v204.badges > 0 then
        for _, v210 in v204.badges do
            local v211 = v210:encode();
            local v212, v213 = v0.writeTag(v205, v206, 2, v0.wireTypes.lengthDelimited);
            v212, v213 = v0.writeBuffer(v212, v213, v211, buffer.len(v211));
            v205 = v212;
            v206 = v213;
        end;
    end;
    if v204.collection_id ~= nil and v204.collection_id ~= "" then
        local v214, v215 = v0.writeTag(v205, v206, 3, v0.wireTypes.lengthDelimited);
        v214, v215 = v0.writeString(v214, v215, v204.collection_id);
        v205 = v214;
        v206 = v215;
    end;
    if v204.collection_position ~= nil and v204.collection_position ~= "" then
        local v216, v217 = v0.writeTag(v205, v206, 4, v0.wireTypes.lengthDelimited);
        v216, v217 = v0.writeString(v216, v217, v204.collection_position);
        v205 = v216;
        v206 = v217;
    end;
    if v204.universe_id ~= nil and v204.universe_id ~= "" then
        local v218, v219 = v0.writeTag(v205, v206, 5, v0.wireTypes.lengthDelimited);
        v218, v219 = v0.writeString(v218, v219, v204.universe_id);
        v205 = v218;
        v206 = v219;
    end;
    local v220 = buffer.create(v206);
    buffer.copy(v220, 0, v205, 0, v206);
    return v220;
end;
v4.decode = function(v221) --[[ Line: 3787 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_3 (copy), v0 (copy), v2 (copy)
    local v222 = l_v4_3.new();
    local v223 = 0;
    while v223 < buffer.len(v221) do
        local v224 = nil;
        local v225 = nil;
        local v226, v227, v228 = v0.readTag(v221, v223);
        v224 = v226;
        v225 = v227;
        v223 = v228;
        if v225 == v0.wireTypes.varint then
            v226 = nil;
            v227, v228 = v0.readVarInt(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.lengthDelimited then
            if v224 == 1 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.section_title = buffer.tostring(v226);
            elseif v224 == 2 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                table.insert(v222.badges, v2.BadgesGridInputData_BadgeInputData.decode(v226));
            elseif v224 == 3 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.collection_id = buffer.tostring(v226);
            elseif v224 == 4 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.collection_position = buffer.tostring(v226);
            elseif v224 == 5 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.universe_id = buffer.tostring(v226);
            else
                v226 = nil;
                v227, v228 = v0.readVarInt(v221, v223);
                v223 = v228 + v227;
            end;
        elseif v225 == v0.wireTypes.i32 then
            v226 = nil;
            v227, v228 = v0.readFixed32(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.i64 then
            v226 = nil;
            v227, v228 = v0.readFixed64(v221, v223);
            v226 = v227;
            v223 = v228;
        else
            error("Unsupported wire type: " .. v225);
        end;
    end;
    return v222;
end;
v4.jsonEncode = function(v229) --[[ Line: 3850 ]] --[[ Name: jsonEncode ]]
    local v230 = {};
    if v229.section_title ~= nil and v229.section_title ~= "" then
        v230.sectionTitle = v229.section_title;
    end;
    if v229.badges ~= nil and #v229.badges > 0 then
        local v231 = {};
        for _, v233 in v229.badges do
            table.insert(v231, v233:jsonEncode());
        end;
        v230.badges = v231;
    end;
    if v229.collection_id ~= nil and v229.collection_id ~= "" then
        v230.collectionId = v229.collection_id;
    end;
    if v229.collection_position ~= nil and v229.collection_position ~= "" then
        v230.collectionPosition = v229.collection_position;
    end;
    if v229.universe_id ~= nil and v229.universe_id ~= "" then
        v230.universeId = v229.universe_id;
    end;
    return v230;
end;
v4.jsonDecode = function(v234) --[[ Line: 3880 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_3 (copy), v2 (copy)
    local v235 = l_v4_3.new();
    if v234.section_title ~= nil then
        v235.section_title = v234.section_title;
    end;
    if v234.sectionTitle ~= nil then
        v235.section_title = v234.sectionTitle;
    end;
    if v234.badges ~= nil then
        local v236 = {};
        for _, v238 in v234.badges do
            table.insert(v236, v2.BadgesGridInputData_BadgeInputData.jsonDecode(v238));
        end;
        v235.badges = v236;
    end;
    if v234.collection_id ~= nil then
        v235.collection_id = v234.collection_id;
    end;
    if v234.collectionId ~= nil then
        v235.collection_id = v234.collectionId;
    end;
    if v234.collection_position ~= nil then
        v235.collection_position = v234.collection_position;
    end;
    if v234.collectionPosition ~= nil then
        v235.collection_position = v234.collectionPosition;
    end;
    if v234.universe_id ~= nil then
        v235.universe_id = v234.universe_id;
    end;
    if v234.universeId ~= nil then
        v235.universe_id = v234.universeId;
    end;
    return v235;
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
v4.new = function(v240) --[[ Line: 3941 ]] --[[ Name: new ]]
    -- upvalues: l_v4_4 (copy)
    return (setmetatable({
        badge_id = (not (v240 ~= nil) or v240.badge_id == nil) and "" or v240.badge_id
    }, l_v4_4));
end;
v4.encode = function(v241) --[[ Line: 3949 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v242 = buffer.create(0);
    local v243 = 0;
    if v241.badge_id ~= nil and v241.badge_id ~= "" then
        local v244, v245 = v0.writeTag(v242, v243, 1, v0.wireTypes.lengthDelimited);
        v244, v245 = v0.writeString(v244, v245, v241.badge_id);
        v242 = v244;
        v243 = v245;
    end;
    local v246 = buffer.create(v243);
    buffer.copy(v246, 0, v242, 0, v243);
    return v246;
end;
v4.decode = function(v247) --[[ Line: 3963 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_4 (copy), v0 (copy)
    local v248 = l_v4_4.new();
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
v4.jsonEncode = function(v255) --[[ Line: 4006 ]] --[[ Name: jsonEncode ]]
    local v256 = {};
    if v255.badge_id ~= nil and v255.badge_id ~= "" then
        v256.badgeId = v255.badge_id;
    end;
    return v256;
end;
v4.jsonDecode = function(v257) --[[ Line: 4016 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_4 (copy)
    local v258 = l_v4_4.new();
    if v257.badge_id ~= nil then
        v258.badge_id = v257.badge_id;
    end;
    if v257.badgeId ~= nil then
        v258.badge_id = v257.badgeId;
    end;
    return v258;
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
v4.new = function(v260) --[[ Line: 4046 ]] --[[ Name: new ]]
    -- upvalues: l_v4_5 (copy)
    return (setmetatable({
        badge_id = (not (v260 ~= nil) or v260.badge_id == nil) and "" or v260.badge_id, 
        universe_id = (not (v260 ~= nil) or v260.universe_id == nil) and "" or v260.universe_id, 
        localized_literals = if not (v260 ~= nil) or v260.localized_literals == nil then nil else v260.localized_literals, 
        creator_key = (not (v260 ~= nil) or v260.creator_key == nil) and "" or v260.creator_key
    }, l_v4_5));
end;
v4.encode = function(v261) --[[ Line: 4055 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v262 = buffer.create(0);
    local v263 = 0;
    if v261.badge_id ~= nil and v261.badge_id ~= "" then
        local v264, v265 = v0.writeTag(v262, v263, 1, v0.wireTypes.lengthDelimited);
        v264, v265 = v0.writeString(v264, v265, v261.badge_id);
        v262 = v264;
        v263 = v265;
    end;
    if v261.universe_id ~= nil and v261.universe_id ~= "" then
        local v266, v267 = v0.writeTag(v262, v263, 2, v0.wireTypes.lengthDelimited);
        v266, v267 = v0.writeString(v266, v267, v261.universe_id);
        v262 = v266;
        v263 = v267;
    end;
    if v261.localized_literals ~= nil then
        local v268 = v261.localized_literals:encode();
        local v269, v270 = v0.writeTag(v262, v263, 3, v0.wireTypes.lengthDelimited);
        v269, v270 = v0.writeBuffer(v269, v270, v268, buffer.len(v268));
        v262 = v269;
        v263 = v270;
    end;
    if v261.creator_key ~= nil and v261.creator_key ~= "" then
        local v271, v272 = v0.writeTag(v262, v263, 4, v0.wireTypes.lengthDelimited);
        v271, v272 = v0.writeString(v271, v272, v261.creator_key);
        v262 = v271;
        v263 = v272;
    end;
    local v273 = buffer.create(v263);
    buffer.copy(v273, 0, v262, 0, v263);
    return v273;
end;
v4.decode = function(v274) --[[ Line: 4085 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_5 (copy), v0 (copy), v2 (copy)
    local v275 = l_v4_5.new();
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
                v275.badge_id = buffer.tostring(v279);
            elseif v277 == 2 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.universe_id = buffer.tostring(v279);
            elseif v277 == 3 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.decode(v279);
            elseif v277 == 4 then
                v279 = nil;
                v280, v281 = v0.readBuffer(v274, v276);
                v279 = v280;
                v276 = v281;
                v275.creator_key = buffer.tostring(v279);
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
v4.jsonEncode = function(v282) --[[ Line: 4143 ]] --[[ Name: jsonEncode ]]
    local v283 = {};
    if v282.badge_id ~= nil and v282.badge_id ~= "" then
        v283.badgeId = v282.badge_id;
    end;
    if v282.universe_id ~= nil and v282.universe_id ~= "" then
        v283.universeId = v282.universe_id;
    end;
    if v282.localized_literals ~= nil then
        v283.localizedLiterals = v282.localized_literals:jsonEncode();
    end;
    if v282.creator_key ~= nil and v282.creator_key ~= "" then
        v283.creatorKey = v282.creator_key;
    end;
    return v283;
end;
v4.jsonDecode = function(v284) --[[ Line: 4165 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_5 (copy), v2 (copy)
    local v285 = l_v4_5.new();
    if v284.badge_id ~= nil then
        v285.badge_id = v284.badge_id;
    end;
    if v284.badgeId ~= nil then
        v285.badge_id = v284.badgeId;
    end;
    if v284.universe_id ~= nil then
        v285.universe_id = v284.universe_id;
    end;
    if v284.universeId ~= nil then
        v285.universe_id = v284.universeId;
    end;
    if v284.localized_literals ~= nil then
        v285.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v284.localized_literals);
    end;
    if v284.localizedLiterals ~= nil then
        v285.localized_literals = v2.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(v284.localizedLiterals);
    end;
    if v284.creator_key ~= nil then
        v285.creator_key = v284.creator_key;
    end;
    if v284.creatorKey ~= nil then
        v285.creator_key = v284.creatorKey;
    end;
    return v285;
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
v4.new = function(v287) --[[ Line: 4219 ]] --[[ Name: new ]]
    -- upvalues: l_v4_6 (copy)
    return (setmetatable({
        info_table = if not (v287 ~= nil) or v287.info_table == nil then nil else v287.info_table, 
        action_module = if not (v287 ~= nil) or v287.action_module == nil then nil else v287.action_module, 
        overflow_menu = if not (v287 ~= nil) or v287.overflow_menu == nil then nil else v287.overflow_menu
    }, l_v4_6));
end;
v4.encode = function(v288) --[[ Line: 4229 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v289 = buffer.create(0);
    local v290 = 0;
    if v288.info_table ~= nil then
        local v291 = v288.info_table:encode();
        local v292, v293 = v0.writeTag(v289, v290, 1, v0.wireTypes.lengthDelimited);
        v292, v293 = v0.writeBuffer(v292, v293, v291, buffer.len(v291));
        v289 = v292;
        v290 = v293;
    end;
    if v288.action_module ~= nil then
        local v294 = v288.action_module:encode();
        local v295, v296 = v0.writeTag(v289, v290, 2, v0.wireTypes.lengthDelimited);
        v295, v296 = v0.writeBuffer(v295, v296, v294, buffer.len(v294));
        v289 = v295;
        v290 = v296;
    end;
    if v288.overflow_menu ~= nil then
        local v297 = v288.overflow_menu:encode();
        local v298, v299 = v0.writeTag(v289, v290, 3, v0.wireTypes.lengthDelimited);
        v298, v299 = v0.writeBuffer(v298, v299, v297, buffer.len(v297));
        v289 = v298;
        v290 = v299;
    end;
    local v300 = buffer.create(v290);
    buffer.copy(v300, 0, v289, 0, v290);
    return v300;
end;
v4.decode = function(v301) --[[ Line: 4256 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_6 (copy), v0 (copy), v2 (copy)
    local v302 = l_v4_6.new();
    local v303 = 0;
    while v303 < buffer.len(v301) do
        local v304 = nil;
        local v305 = nil;
        local v306, v307, v308 = v0.readTag(v301, v303);
        v304 = v306;
        v305 = v307;
        v303 = v308;
        if v305 == v0.wireTypes.varint then
            v306 = nil;
            v307, v308 = v0.readVarInt(v301, v303);
            v306 = v307;
            v303 = v308;
        elseif v305 == v0.wireTypes.lengthDelimited then
            if v304 == 1 then
                v306 = nil;
                v307, v308 = v0.readBuffer(v301, v303);
                v306 = v307;
                v303 = v308;
                v302.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(v306);
            elseif v304 == 2 then
                v306 = nil;
                v307, v308 = v0.readBuffer(v301, v303);
                v306 = v307;
                v303 = v308;
                v302.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(v306);
            elseif v304 == 3 then
                v306 = nil;
                v307, v308 = v0.readBuffer(v301, v303);
                v306 = v307;
                v303 = v308;
                v302.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(v306);
            else
                v306 = nil;
                v307, v308 = v0.readVarInt(v301, v303);
                v303 = v308 + v307;
            end;
        elseif v305 == v0.wireTypes.i32 then
            v306 = nil;
            v307, v308 = v0.readFixed32(v301, v303);
            v306 = v307;
            v303 = v308;
        elseif v305 == v0.wireTypes.i64 then
            v306 = nil;
            v307, v308 = v0.readFixed64(v301, v303);
            v306 = v307;
            v303 = v308;
        else
            error("Unsupported wire type: " .. v305);
        end;
    end;
    return v302;
end;
v4.jsonEncode = function(v309) --[[ Line: 4309 ]] --[[ Name: jsonEncode ]]
    local v310 = {};
    if v309.info_table ~= nil then
        v310.infoTable = v309.info_table:jsonEncode();
    end;
    if v309.action_module ~= nil then
        v310.actionModule = v309.action_module:jsonEncode();
    end;
    if v309.overflow_menu ~= nil then
        v310.overflowMenu = v309.overflow_menu:jsonEncode();
    end;
    return v310;
end;
v4.jsonDecode = function(v311) --[[ Line: 4327 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_6 (copy), v2 (copy)
    local v312 = l_v4_6.new();
    if v311.info_table ~= nil then
        v312.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v311.info_table);
    end;
    if v311.infoTable ~= nil then
        v312.info_table = v2.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(v311.infoTable);
    end;
    if v311.action_module ~= nil then
        v312.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v311.action_module);
    end;
    if v311.actionModule ~= nil then
        v312.action_module = v2.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(v311.actionModule);
    end;
    if v311.overflow_menu ~= nil then
        v312.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v311.overflow_menu);
    end;
    if v311.overflowMenu ~= nil then
        v312.overflow_menu = v2.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(v311.overflowMenu);
    end;
    return v312;
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
v4.new = function(v314) --[[ Line: 4378 ]] --[[ Name: new ]]
    -- upvalues: l_v4_7 (copy)
    return (setmetatable({
        type_label = (not (v314 ~= nil) or v314.type_label == nil) and "" or v314.type_label, 
        earned_label = (not (v314 ~= nil) or v314.earned_label == nil) and "" or v314.earned_label, 
        updated_label = (not (v314 ~= nil) or v314.updated_label == nil) and "" or v314.updated_label, 
        experience_label = (not (v314 ~= nil) or v314.experience_label == nil) and "" or v314.experience_label, 
        rarity_label = (not (v314 ~= nil) or v314.rarity_label == nil) and "" or v314.rarity_label, 
        won_yesterday_label = (not (v314 ~= nil) or v314.won_yesterday_label == nil) and "" or v314.won_yesterday_label, 
        won_ever_label = (not (v314 ~= nil) or v314.won_ever_label == nil) and "" or v314.won_ever_label
    }, l_v4_7));
end;
v4.encode = function(v315) --[[ Line: 4397 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v316 = buffer.create(0);
    local v317 = 0;
    if v315.type_label ~= nil and v315.type_label ~= "" then
        local v318, v319 = v0.writeTag(v316, v317, 1, v0.wireTypes.lengthDelimited);
        v318, v319 = v0.writeString(v318, v319, v315.type_label);
        v316 = v318;
        v317 = v319;
    end;
    if v315.earned_label ~= nil and v315.earned_label ~= "" then
        local v320, v321 = v0.writeTag(v316, v317, 2, v0.wireTypes.lengthDelimited);
        v320, v321 = v0.writeString(v320, v321, v315.earned_label);
        v316 = v320;
        v317 = v321;
    end;
    if v315.updated_label ~= nil and v315.updated_label ~= "" then
        local v322, v323 = v0.writeTag(v316, v317, 3, v0.wireTypes.lengthDelimited);
        v322, v323 = v0.writeString(v322, v323, v315.updated_label);
        v316 = v322;
        v317 = v323;
    end;
    if v315.experience_label ~= nil and v315.experience_label ~= "" then
        local v324, v325 = v0.writeTag(v316, v317, 4, v0.wireTypes.lengthDelimited);
        v324, v325 = v0.writeString(v324, v325, v315.experience_label);
        v316 = v324;
        v317 = v325;
    end;
    if v315.rarity_label ~= nil and v315.rarity_label ~= "" then
        local v326, v327 = v0.writeTag(v316, v317, 5, v0.wireTypes.lengthDelimited);
        v326, v327 = v0.writeString(v326, v327, v315.rarity_label);
        v316 = v326;
        v317 = v327;
    end;
    if v315.won_yesterday_label ~= nil and v315.won_yesterday_label ~= "" then
        local v328, v329 = v0.writeTag(v316, v317, 6, v0.wireTypes.lengthDelimited);
        v328, v329 = v0.writeString(v328, v329, v315.won_yesterday_label);
        v316 = v328;
        v317 = v329;
    end;
    if v315.won_ever_label ~= nil and v315.won_ever_label ~= "" then
        local v330, v331 = v0.writeTag(v316, v317, 7, v0.wireTypes.lengthDelimited);
        v330, v331 = v0.writeString(v330, v331, v315.won_ever_label);
        v316 = v330;
        v317 = v331;
    end;
    local v332 = buffer.create(v317);
    buffer.copy(v332, 0, v316, 0, v317);
    return v332;
end;
v4.decode = function(v333) --[[ Line: 4443 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_7 (copy), v0 (copy)
    local v334 = l_v4_7.new();
    local v335 = 0;
    while v335 < buffer.len(v333) do
        local v336 = nil;
        local v337 = nil;
        local v338, v339, v340 = v0.readTag(v333, v335);
        v336 = v338;
        v337 = v339;
        v335 = v340;
        if v337 == v0.wireTypes.varint then
            v338 = nil;
            v339, v340 = v0.readVarInt(v333, v335);
            v338 = v339;
            v335 = v340;
        elseif v337 == v0.wireTypes.lengthDelimited then
            if v336 == 1 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.type_label = buffer.tostring(v338);
            elseif v336 == 2 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.earned_label = buffer.tostring(v338);
            elseif v336 == 3 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.updated_label = buffer.tostring(v338);
            elseif v336 == 4 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.experience_label = buffer.tostring(v338);
            elseif v336 == 5 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.rarity_label = buffer.tostring(v338);
            elseif v336 == 6 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.won_yesterday_label = buffer.tostring(v338);
            elseif v336 == 7 then
                v338 = nil;
                v339, v340 = v0.readBuffer(v333, v335);
                v338 = v339;
                v335 = v340;
                v334.won_ever_label = buffer.tostring(v338);
            else
                v338 = nil;
                v339, v340 = v0.readVarInt(v333, v335);
                v335 = v340 + v339;
            end;
        elseif v337 == v0.wireTypes.i32 then
            v338 = nil;
            v339, v340 = v0.readFixed32(v333, v335);
            v338 = v339;
            v335 = v340;
        elseif v337 == v0.wireTypes.i64 then
            v338 = nil;
            v339, v340 = v0.readFixed64(v333, v335);
            v338 = v339;
            v335 = v340;
        else
            error("Unsupported wire type: " .. v337);
        end;
    end;
    return v334;
end;
v4.jsonEncode = function(v341) --[[ Line: 4518 ]] --[[ Name: jsonEncode ]]
    local v342 = {};
    if v341.type_label ~= nil and v341.type_label ~= "" then
        v342.typeLabel = v341.type_label;
    end;
    if v341.earned_label ~= nil and v341.earned_label ~= "" then
        v342.earnedLabel = v341.earned_label;
    end;
    if v341.updated_label ~= nil and v341.updated_label ~= "" then
        v342.updatedLabel = v341.updated_label;
    end;
    if v341.experience_label ~= nil and v341.experience_label ~= "" then
        v342.experienceLabel = v341.experience_label;
    end;
    if v341.rarity_label ~= nil and v341.rarity_label ~= "" then
        v342.rarityLabel = v341.rarity_label;
    end;
    if v341.won_yesterday_label ~= nil and v341.won_yesterday_label ~= "" then
        v342.wonYesterdayLabel = v341.won_yesterday_label;
    end;
    if v341.won_ever_label ~= nil and v341.won_ever_label ~= "" then
        v342.wonEverLabel = v341.won_ever_label;
    end;
    return v342;
end;
v4.jsonDecode = function(v343) --[[ Line: 4554 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_7 (copy)
    local v344 = l_v4_7.new();
    if v343.type_label ~= nil then
        v344.type_label = v343.type_label;
    end;
    if v343.typeLabel ~= nil then
        v344.type_label = v343.typeLabel;
    end;
    if v343.earned_label ~= nil then
        v344.earned_label = v343.earned_label;
    end;
    if v343.earnedLabel ~= nil then
        v344.earned_label = v343.earnedLabel;
    end;
    if v343.updated_label ~= nil then
        v344.updated_label = v343.updated_label;
    end;
    if v343.updatedLabel ~= nil then
        v344.updated_label = v343.updatedLabel;
    end;
    if v343.experience_label ~= nil then
        v344.experience_label = v343.experience_label;
    end;
    if v343.experienceLabel ~= nil then
        v344.experience_label = v343.experienceLabel;
    end;
    if v343.rarity_label ~= nil then
        v344.rarity_label = v343.rarity_label;
    end;
    if v343.rarityLabel ~= nil then
        v344.rarity_label = v343.rarityLabel;
    end;
    if v343.won_yesterday_label ~= nil then
        v344.won_yesterday_label = v343.won_yesterday_label;
    end;
    if v343.wonYesterdayLabel ~= nil then
        v344.won_yesterday_label = v343.wonYesterdayLabel;
    end;
    if v343.won_ever_label ~= nil then
        v344.won_ever_label = v343.won_ever_label;
    end;
    if v343.wonEverLabel ~= nil then
        v344.won_ever_label = v343.wonEverLabel;
    end;
    return v344;
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
v4.new = function(v346) --[[ Line: 4634 ]] --[[ Name: new ]]
    -- upvalues: l_v4_8 (copy)
    return (setmetatable({
        share = (not (v346 ~= nil) or v346.share == nil) and "" or v346.share, 
        report = (not (v346 ~= nil) or v346.report == nil) and "" or v346.report
    }, l_v4_8));
end;
v4.encode = function(v347) --[[ Line: 4646 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v348 = buffer.create(0);
    local v349 = 0;
    if v347.share ~= nil and v347.share ~= "" then
        local v350, v351 = v0.writeTag(v348, v349, 1, v0.wireTypes.lengthDelimited);
        v350, v351 = v0.writeString(v350, v351, v347.share);
        v348 = v350;
        v349 = v351;
    end;
    if v347.report ~= nil and v347.report ~= "" then
        local v352, v353 = v0.writeTag(v348, v349, 2, v0.wireTypes.lengthDelimited);
        v352, v353 = v0.writeString(v352, v353, v347.report);
        v348 = v352;
        v349 = v353;
    end;
    local v354 = buffer.create(v349);
    buffer.copy(v354, 0, v348, 0, v349);
    return v354;
end;
v4.decode = function(v355) --[[ Line: 4667 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_8 (copy), v0 (copy)
    local v356 = l_v4_8.new();
    local v357 = 0;
    while v357 < buffer.len(v355) do
        local v358 = nil;
        local v359 = nil;
        local v360, v361, v362 = v0.readTag(v355, v357);
        v358 = v360;
        v359 = v361;
        v357 = v362;
        if v359 == v0.wireTypes.varint then
            v360 = nil;
            v361, v362 = v0.readVarInt(v355, v357);
            v360 = v361;
            v357 = v362;
        elseif v359 == v0.wireTypes.lengthDelimited then
            if v358 == 1 then
                v360 = nil;
                v361, v362 = v0.readBuffer(v355, v357);
                v360 = v361;
                v357 = v362;
                v356.share = buffer.tostring(v360);
            elseif v358 == 2 then
                v360 = nil;
                v361, v362 = v0.readBuffer(v355, v357);
                v360 = v361;
                v357 = v362;
                v356.report = buffer.tostring(v360);
            else
                v360 = nil;
                v361, v362 = v0.readVarInt(v355, v357);
                v357 = v362 + v361;
            end;
        elseif v359 == v0.wireTypes.i32 then
            v360 = nil;
            v361, v362 = v0.readFixed32(v355, v357);
            v360 = v361;
            v357 = v362;
        elseif v359 == v0.wireTypes.i64 then
            v360 = nil;
            v361, v362 = v0.readFixed64(v355, v357);
            v360 = v361;
            v357 = v362;
        else
            error("Unsupported wire type: " .. v359);
        end;
    end;
    return v356;
end;
v4.jsonEncode = function(v363) --[[ Line: 4717 ]] --[[ Name: jsonEncode ]]
    local v364 = {};
    if v363.share ~= nil and v363.share ~= "" then
        v364.share = v363.share;
    end;
    if v363.report ~= nil and v363.report ~= "" then
        v364.report = v363.report;
    end;
    return v364;
end;
v4.jsonDecode = function(v365) --[[ Line: 4733 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_8 (copy)
    local v366 = l_v4_8.new();
    if v365.share ~= nil then
        v366.share = v365.share;
    end;
    if v365.report ~= nil then
        v366.report = v365.report;
    end;
    return v366;
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
v4.new = function(v368) --[[ Line: 4765 ]] --[[ Name: new ]]
    -- upvalues: l_v4_9 (copy)
    return (setmetatable({
        report = (not (v368 ~= nil) or v368.report == nil) and "" or v368.report, 
        remove = (not (v368 ~= nil) or v368.remove == nil) and "" or v368.remove
    }, l_v4_9));
end;
v4.encode = function(v369) --[[ Line: 4777 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v370 = buffer.create(0);
    local v371 = 0;
    if v369.report ~= nil and v369.report ~= "" then
        local v372, v373 = v0.writeTag(v370, v371, 1, v0.wireTypes.lengthDelimited);
        v372, v373 = v0.writeString(v372, v373, v369.report);
        v370 = v372;
        v371 = v373;
    end;
    if v369.remove ~= nil and v369.remove ~= "" then
        local v374, v375 = v0.writeTag(v370, v371, 2, v0.wireTypes.lengthDelimited);
        v374, v375 = v0.writeString(v374, v375, v369.remove);
        v370 = v374;
        v371 = v375;
    end;
    local v376 = buffer.create(v371);
    buffer.copy(v376, 0, v370, 0, v371);
    return v376;
end;
v4.decode = function(v377) --[[ Line: 4798 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_9 (copy), v0 (copy)
    local v378 = l_v4_9.new();
    local v379 = 0;
    while v379 < buffer.len(v377) do
        local v380 = nil;
        local v381 = nil;
        local v382, v383, v384 = v0.readTag(v377, v379);
        v380 = v382;
        v381 = v383;
        v379 = v384;
        if v381 == v0.wireTypes.varint then
            v382 = nil;
            v383, v384 = v0.readVarInt(v377, v379);
            v382 = v383;
            v379 = v384;
        elseif v381 == v0.wireTypes.lengthDelimited then
            if v380 == 1 then
                v382 = nil;
                v383, v384 = v0.readBuffer(v377, v379);
                v382 = v383;
                v379 = v384;
                v378.report = buffer.tostring(v382);
            elseif v380 == 2 then
                v382 = nil;
                v383, v384 = v0.readBuffer(v377, v379);
                v382 = v383;
                v379 = v384;
                v378.remove = buffer.tostring(v382);
            else
                v382 = nil;
                v383, v384 = v0.readVarInt(v377, v379);
                v379 = v384 + v383;
            end;
        elseif v381 == v0.wireTypes.i32 then
            v382 = nil;
            v383, v384 = v0.readFixed32(v377, v379);
            v382 = v383;
            v379 = v384;
        elseif v381 == v0.wireTypes.i64 then
            v382 = nil;
            v383, v384 = v0.readFixed64(v377, v379);
            v382 = v383;
            v379 = v384;
        else
            error("Unsupported wire type: " .. v381);
        end;
    end;
    return v378;
end;
v4.jsonEncode = function(v385) --[[ Line: 4848 ]] --[[ Name: jsonEncode ]]
    local v386 = {};
    if v385.report ~= nil and v385.report ~= "" then
        v386.report = v385.report;
    end;
    if v385.remove ~= nil and v385.remove ~= "" then
        v386.remove = v385.remove;
    end;
    return v386;
end;
v4.jsonDecode = function(v387) --[[ Line: 4864 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_9 (copy)
    local v388 = l_v4_9.new();
    if v387.report ~= nil then
        v388.report = v387.report;
    end;
    if v387.remove ~= nil then
        v388.remove = v387.remove;
    end;
    return v388;
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
v4.new = function(_) --[[ Line: 4895 ]] --[[ Name: new ]]
    -- upvalues: l_v4_10 (copy)
    return (setmetatable({}, l_v4_10));
end;
v4.encode = function(_) --[[ Line: 4899 ]] --[[ Name: encode ]]
    local v392 = buffer.create(0);
    local v393 = buffer.create(0);
    buffer.copy(v393, 0, v392, 0, 0);
    return v393;
end;
v4.decode = function(v394) --[[ Line: 4908 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_10 (copy), v0 (copy)
    local v395 = l_v4_10.new();
    local v396 = 0;
    while v396 < buffer.len(v394) do
        local v397 = nil;
        local v398 = nil;
        local v399, v400, v401 = v0.readTag(v394, v396);
        v397 = v399;
        v398 = v400;
        v396 = v401;
        if v398 == v0.wireTypes.varint then
            v399 = nil;
            v400, v401 = v0.readVarInt(v394, v396);
            v399 = v400;
            v396 = v401;
        elseif v398 == v0.wireTypes.lengthDelimited then
            v399 = nil;
            v400, v401 = v0.readVarInt(v394, v396);
            v396 = v401 + v400;
        elseif v398 == v0.wireTypes.i32 then
            v399 = nil;
            v400, v401 = v0.readFixed32(v394, v396);
            v399 = v400;
            v396 = v401;
        elseif v398 == v0.wireTypes.i64 then
            v399 = nil;
            v400, v401 = v0.readFixed64(v394, v396);
            v399 = v400;
            v396 = v401;
        else
            error("Unsupported wire type: " .. v398);
        end;
    end;
    return v395;
end;
v4.jsonEncode = function(_) --[[ Line: 4946 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 4952 ]] --[[ Name: jsonDecode ]]
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
v4.new = function(v405) --[[ Line: 4972 ]] --[[ Name: new ]]
    -- upvalues: l_v4_11 (copy)
    return (setmetatable({
        universe_id = (not (v405 ~= nil) or v405.universe_id == nil) and "" or v405.universe_id, 
        creator_key = (not (v405 ~= nil) or v405.creator_key == nil) and "" or v405.creator_key, 
        entry_map = if not (v405 ~= nil) or v405.entry_map == nil then {} else v405.entry_map, 
        entry_order = if not (v405 ~= nil) or v405.entry_order == nil then {} else v405.entry_order
    }, l_v4_11));
end;
v4.encode = function(v406) --[[ Line: 4983 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v407 = buffer.create(0);
    local v408 = 0;
    if v406.universe_id ~= nil and v406.universe_id ~= "" then
        local v409, v410 = v0.writeTag(v407, v408, 1, v0.wireTypes.lengthDelimited);
        v409, v410 = v0.writeString(v409, v410, v406.universe_id);
        v407 = v409;
        v408 = v410;
    end;
    if v406.creator_key ~= nil and v406.creator_key ~= "" then
        local v411, v412 = v0.writeTag(v407, v408, 2, v0.wireTypes.lengthDelimited);
        v411, v412 = v0.writeString(v411, v412, v406.creator_key);
        v407 = v411;
        v408 = v412;
    end;
    if v406.entry_map ~= nil and next(v406.entry_map) ~= nil then
        for v413, v414 in v406.entry_map do
            local v415 = buffer.create(0);
            local v416, v417 = v0.writeTag(v415, 0, 1, v0.wireTypes.lengthDelimited);
            v416, v417 = v0.writeString(v416, v417, v413);
            v415 = v416;
            local l_v417_0 = v417;
            v416 = v414:encode();
            local v419;
            v417, v419 = v0.writeTag(v415, l_v417_0, 2, v0.wireTypes.lengthDelimited);
            v417, v419 = v0.writeBuffer(v417, v419, v416, buffer.len(v416));
            v415 = v417;
            l_v417_0 = v419;
            v417, v419 = v0.writeTag(v407, v408, 3, v0.wireTypes.lengthDelimited);
            v417, v419 = v0.writeBuffer(v417, v419, v415, l_v417_0);
            v407 = v417;
            v408 = v419;
        end;
    end;
    if v406.entry_order ~= nil and #v406.entry_order > 0 then
        for _, v421 in v406.entry_order do
            local v422, v423 = v0.writeTag(v407, v408, 4, v0.wireTypes.lengthDelimited);
            v422, v423 = v0.writeString(v422, v423, v421);
            v407 = v422;
            v408 = v423;
        end;
    end;
    local v424 = buffer.create(v408);
    buffer.copy(v424, 0, v407, 0, v408);
    return v424;
end;
v4.decode = function(v425) --[[ Line: 5023 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_11 (copy), v0 (copy), v2 (copy)
    local v426 = l_v4_11.new();
    local v427 = 0;
    while v427 < buffer.len(v425) do
        local v428 = nil;
        local v429 = nil;
        local v430, v431, v432 = v0.readTag(v425, v427);
        v428 = v430;
        v429 = v431;
        v427 = v432;
        if v429 == v0.wireTypes.varint then
            v430 = nil;
            v431, v432 = v0.readVarInt(v425, v427);
            v430 = v431;
            v427 = v432;
        elseif v429 == v0.wireTypes.lengthDelimited then
            if v428 == 1 then
                v430 = nil;
                v431, v432 = v0.readBuffer(v425, v427);
                v430 = v431;
                v427 = v432;
                v426.universe_id = buffer.tostring(v430);
            elseif v428 == 2 then
                v430 = nil;
                v431, v432 = v0.readBuffer(v425, v427);
                v430 = v431;
                v427 = v432;
                v426.creator_key = buffer.tostring(v430);
            elseif v428 == 3 then
                v430 = nil;
                v431, v432 = v0.readBuffer(v425, v427);
                v430 = v431;
                v427 = v432;
                v431 = v2.ExperienceDetailsFeedInputData_EntryMapEntry.decode(v430);
                v432 = v2.FeedEntry.new();
                v426.entry_map[v431.key or ""] = v431.value or v432;
            elseif v428 == 4 then
                v430 = nil;
                v431, v432 = v0.readBuffer(v425, v427);
                v430 = v431;
                v427 = v432;
                table.insert(v426.entry_order, buffer.tostring(v430));
            else
                v430 = nil;
                v431, v432 = v0.readVarInt(v425, v427);
                v427 = v432 + v431;
            end;
        elseif v429 == v0.wireTypes.i32 then
            v430 = nil;
            v431, v432 = v0.readFixed32(v425, v427);
            v430 = v431;
            v427 = v432;
        elseif v429 == v0.wireTypes.i64 then
            v430 = nil;
            v431, v432 = v0.readFixed64(v425, v427);
            v430 = v431;
            v427 = v432;
        else
            error("Unsupported wire type: " .. v429);
        end;
    end;
    return v426;
end;
v4.jsonEncode = function(v433) --[[ Line: 5088 ]] --[[ Name: jsonEncode ]]
    local v434 = {};
    if v433.universe_id ~= nil and v433.universe_id ~= "" then
        v434.universeId = v433.universe_id;
    end;
    if v433.creator_key ~= nil and v433.creator_key ~= "" then
        v434.creatorKey = v433.creator_key;
    end;
    if v433.entry_map ~= nil and next(v433.entry_map) ~= nil then
        local v435 = {};
        for v436, v437 in v433.entry_map do
            v435[v436] = v437:jsonEncode();
        end;
        v434.entryMap = v435;
    end;
    if v433.entry_order ~= nil and #v433.entry_order > 0 then
        local v438 = {};
        for _, v440 in v433.entry_order do
            table.insert(v438, v440);
        end;
        v434.entryOrder = v438;
    end;
    return v434;
end;
v4.jsonDecode = function(v441) --[[ Line: 5118 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_11 (copy), v2 (copy)
    local v442 = l_v4_11.new();
    if v441.universe_id ~= nil then
        v442.universe_id = v441.universe_id;
    end;
    if v441.universeId ~= nil then
        v442.universe_id = v441.universeId;
    end;
    if v441.creator_key ~= nil then
        v442.creator_key = v441.creator_key;
    end;
    if v441.creatorKey ~= nil then
        v442.creator_key = v441.creatorKey;
    end;
    if v441.entry_map ~= nil then
        local v443 = {};
        for v444, v445 in v441.entry_map do
            v443[v444] = v2.FeedEntry.jsonDecode(v445);
        end;
        v442.entry_map = v443;
    end;
    if v441.entryMap ~= nil then
        local v446 = {};
        for v447, v448 in v441.entryMap do
            v446[v447] = v2.FeedEntry.jsonDecode(v448);
        end;
        v442.entry_map = v446;
    end;
    if v441.entry_order ~= nil then
        local v449 = {};
        for _, v451 in v441.entry_order do
            table.insert(v449, v451);
        end;
        v442.entry_order = v449;
    end;
    if v441.entryOrder ~= nil then
        local v452 = {};
        for _, v454 in v441.entryOrder do
            table.insert(v452, v454);
        end;
        v442.entry_order = v452;
    end;
    return v442;
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
v4.new = function(v456) --[[ Line: 5190 ]] --[[ Name: new ]]
    -- upvalues: l_v4_12 (copy)
    return (setmetatable({
        key = (not (v456 ~= nil) or v456.key == nil) and "" or v456.key, 
        value = if not (v456 ~= nil) or v456.value == nil then nil else v456.value
    }, l_v4_12));
end;
v4.encode = function(v457) --[[ Line: 5199 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v458 = buffer.create(0);
    local v459 = 0;
    if v457.key ~= nil and v457.key ~= "" then
        local v460, v461 = v0.writeTag(v458, v459, 1, v0.wireTypes.lengthDelimited);
        v460, v461 = v0.writeString(v460, v461, v457.key);
        v458 = v460;
        v459 = v461;
    end;
    if v457.value ~= nil then
        local v462 = v457.value:encode();
        local v463, v464 = v0.writeTag(v458, v459, 2, v0.wireTypes.lengthDelimited);
        v463, v464 = v0.writeBuffer(v463, v464, v462, buffer.len(v462));
        v458 = v463;
        v459 = v464;
    end;
    local v465 = buffer.create(v459);
    buffer.copy(v465, 0, v458, 0, v459);
    return v465;
end;
v4.decode = function(v466) --[[ Line: 5221 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_12 (copy), v0 (copy), v2 (copy)
    local v467 = l_v4_12.new();
    local v468 = 0;
    while v468 < buffer.len(v466) do
        local v469 = nil;
        local v470 = nil;
        local v471, v472, v473 = v0.readTag(v466, v468);
        v469 = v471;
        v470 = v472;
        v468 = v473;
        if v470 == v0.wireTypes.varint then
            v471 = nil;
            v472, v473 = v0.readVarInt(v466, v468);
            v471 = v472;
            v468 = v473;
        elseif v470 == v0.wireTypes.lengthDelimited then
            if v469 == 1 then
                v471 = nil;
                v472, v473 = v0.readBuffer(v466, v468);
                v471 = v472;
                v468 = v473;
                v467.key = buffer.tostring(v471);
            elseif v469 == 2 then
                v471 = nil;
                v472, v473 = v0.readBuffer(v466, v468);
                v471 = v472;
                v468 = v473;
                v467.value = v2.FeedEntry.decode(v471);
            else
                v471 = nil;
                v472, v473 = v0.readVarInt(v466, v468);
                v468 = v473 + v472;
            end;
        elseif v470 == v0.wireTypes.i32 then
            v471 = nil;
            v472, v473 = v0.readFixed32(v466, v468);
            v471 = v472;
            v468 = v473;
        elseif v470 == v0.wireTypes.i64 then
            v471 = nil;
            v472, v473 = v0.readFixed64(v466, v468);
            v471 = v472;
            v468 = v473;
        else
            error("Unsupported wire type: " .. v470);
        end;
    end;
    return v467;
end;
v4.jsonEncode = function(v474) --[[ Line: 5271 ]] --[[ Name: jsonEncode ]]
    local v475 = {};
    if v474.key ~= nil and v474.key ~= "" then
        v475.key = v474.key;
    end;
    if v474.value ~= nil then
        v475.value = v474.value:jsonEncode();
    end;
    return v475;
end;
v4.jsonDecode = function(v476) --[[ Line: 5287 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_12 (copy), v2 (copy)
    local v477 = l_v4_12.new();
    if v476.key ~= nil then
        v477.key = v476.key;
    end;
    if v476.value ~= nil then
        v477.value = v2.FeedEntry.jsonDecode(v476.value);
    end;
    return v477;
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
v4.new = function(v479) --[[ Line: 5317 ]] --[[ Name: new ]]
    -- upvalues: l_v4_13 (copy)
    return (setmetatable({
        universe_id = (not (v479 ~= nil) or v479.universe_id == nil) and "" or v479.universe_id, 
        user_owns_experience = v479 ~= nil and not (v479.user_owns_experience == nil) and v479.user_owns_experience
    }, l_v4_13));
end;
v4.encode = function(v480) --[[ Line: 5328 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v481 = buffer.create(0);
    local v482 = 0;
    if v480.universe_id ~= nil and v480.universe_id ~= "" then
        local v483, v484 = v0.writeTag(v481, v482, 1, v0.wireTypes.lengthDelimited);
        v483, v484 = v0.writeString(v483, v484, v480.universe_id);
        v481 = v483;
        v482 = v484;
    end;
    if v480.user_owns_experience then
        local v485, v486 = v0.writeTag(v481, v482, 2, v0.wireTypes.varint);
        v485, v486 = v0.writeVarInt(v485, v486, v480.user_owns_experience and 1 or 0);
        v481 = v485;
        v482 = v486;
    end;
    local v487 = buffer.create(v482);
    buffer.copy(v487, 0, v481, 0, v482);
    return v487;
end;
v4.decode = function(v488) --[[ Line: 5347 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_13 (copy), v0 (copy)
    local v489 = l_v4_13.new();
    local v490 = 0;
    while v490 < buffer.len(v488) do
        local v491 = nil;
        local v492 = nil;
        local v493, v494, v495 = v0.readTag(v488, v490);
        v491 = v493;
        v492 = v494;
        v490 = v495;
        if v492 == v0.wireTypes.varint then
            if v491 == 2 then
                v493 = nil;
                v494, v495 = v0.readVarInt(v488, v490);
                v493 = v494;
                v490 = v495;
                v489.user_owns_experience = v493 ~= 0;
            else
                v493 = nil;
                v494, v495 = v0.readVarInt(v488, v490);
                v493 = v494;
                v490 = v495;
            end;
        elseif v492 == v0.wireTypes.lengthDelimited then
            if v491 == 1 then
                v493 = nil;
                v494, v495 = v0.readBuffer(v488, v490);
                v493 = v494;
                v490 = v495;
                v489.universe_id = buffer.tostring(v493);
            else
                v493 = nil;
                v494, v495 = v0.readVarInt(v488, v490);
                v490 = v495 + v494;
            end;
        elseif v492 == v0.wireTypes.i32 then
            v493 = nil;
            v494, v495 = v0.readFixed32(v488, v490);
            v493 = v494;
            v490 = v495;
        elseif v492 == v0.wireTypes.i64 then
            v493 = nil;
            v494, v495 = v0.readFixed64(v488, v490);
            v493 = v494;
            v490 = v495;
        else
            error("Unsupported wire type: " .. v492);
        end;
    end;
    return v489;
end;
v4.jsonEncode = function(v496) --[[ Line: 5395 ]] --[[ Name: jsonEncode ]]
    local v497 = {};
    if v496.universe_id ~= nil and v496.universe_id ~= "" then
        v497.universeId = v496.universe_id;
    end;
    if v496.user_owns_experience then
        v497.userOwnsExperience = v496.user_owns_experience;
    end;
    return v497;
end;
v4.jsonDecode = function(v498) --[[ Line: 5409 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_13 (copy)
    local v499 = l_v4_13.new();
    if v498.universe_id ~= nil then
        v499.universe_id = v498.universe_id;
    end;
    if v498.universeId ~= nil then
        v499.universe_id = v498.universeId;
    end;
    if v498.user_owns_experience ~= nil then
        v499.user_owns_experience = v498.user_owns_experience;
    end;
    if v498.userOwnsExperience ~= nil then
        v499.user_owns_experience = v498.userOwnsExperience;
    end;
    return v499;
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
v4.new = function(v501) --[[ Line: 5447 ]] --[[ Name: new ]]
    -- upvalues: l_v4_14 (copy)
    return (setmetatable({
        media_asset_id = (not (v501 ~= nil) or v501.media_asset_id == nil) and "" or v501.media_asset_id
    }, l_v4_14));
end;
v4.encode = function(v502) --[[ Line: 5455 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v503 = buffer.create(0);
    local v504 = 0;
    if v502.media_asset_id ~= nil and v502.media_asset_id ~= "" then
        local v505, v506 = v0.writeTag(v503, v504, 1, v0.wireTypes.lengthDelimited);
        v505, v506 = v0.writeString(v505, v506, v502.media_asset_id);
        v503 = v505;
        v504 = v506;
    end;
    local v507 = buffer.create(v504);
    buffer.copy(v507, 0, v503, 0, v504);
    return v507;
end;
v4.decode = function(v508) --[[ Line: 5469 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_14 (copy), v0 (copy)
    local v509 = l_v4_14.new();
    local v510 = 0;
    while v510 < buffer.len(v508) do
        local v511 = nil;
        local v512 = nil;
        local v513, v514, v515 = v0.readTag(v508, v510);
        v511 = v513;
        v512 = v514;
        v510 = v515;
        if v512 == v0.wireTypes.varint then
            v513 = nil;
            v514, v515 = v0.readVarInt(v508, v510);
            v513 = v514;
            v510 = v515;
        elseif v512 == v0.wireTypes.lengthDelimited then
            if v511 == 1 then
                v513 = nil;
                v514, v515 = v0.readBuffer(v508, v510);
                v513 = v514;
                v510 = v515;
                v509.media_asset_id = buffer.tostring(v513);
            else
                v513 = nil;
                v514, v515 = v0.readVarInt(v508, v510);
                v510 = v515 + v514;
            end;
        elseif v512 == v0.wireTypes.i32 then
            v513 = nil;
            v514, v515 = v0.readFixed32(v508, v510);
            v513 = v514;
            v510 = v515;
        elseif v512 == v0.wireTypes.i64 then
            v513 = nil;
            v514, v515 = v0.readFixed64(v508, v510);
            v513 = v514;
            v510 = v515;
        else
            error("Unsupported wire type: " .. v512);
        end;
    end;
    return v509;
end;
v4.jsonEncode = function(v516) --[[ Line: 5512 ]] --[[ Name: jsonEncode ]]
    local v517 = {};
    if v516.media_asset_id ~= nil and v516.media_asset_id ~= "" then
        v517.mediaAssetId = v516.media_asset_id;
    end;
    return v517;
end;
v4.jsonDecode = function(v518) --[[ Line: 5522 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_14 (copy)
    local v519 = l_v4_14.new();
    if v518.media_asset_id ~= nil then
        v519.media_asset_id = v518.media_asset_id;
    end;
    if v518.mediaAssetId ~= nil then
        v519.media_asset_id = v518.mediaAssetId;
    end;
    return v519;
end;
v4.descriptor = {
    name = "ExperienceDetailsBannerImageInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
};
v2.ExperienceDetailsBannerImageInputData = v4;
v1.default:register(v2.ExperienceDetailsBannerImageInputData);
v4 = {};
v4.__index = v4;
local l_v4_15 = v4 --[[ copy: 4 -> 20 ]];
v4.new = function(v521) --[[ Line: 5552 ]] --[[ Name: new ]]
    -- upvalues: l_v4_15 (copy)
    return (setmetatable({
        universe_id = (not (v521 ~= nil) or v521.universe_id == nil) and "" or v521.universe_id
    }, l_v4_15));
end;
v4.encode = function(v522) --[[ Line: 5560 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v523 = buffer.create(0);
    local v524 = 0;
    if v522.universe_id ~= nil and v522.universe_id ~= "" then
        local v525, v526 = v0.writeTag(v523, v524, 1, v0.wireTypes.lengthDelimited);
        v525, v526 = v0.writeString(v525, v526, v522.universe_id);
        v523 = v525;
        v524 = v526;
    end;
    local v527 = buffer.create(v524);
    buffer.copy(v527, 0, v523, 0, v524);
    return v527;
end;
v4.decode = function(v528) --[[ Line: 5574 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_15 (copy), v0 (copy)
    local v529 = l_v4_15.new();
    local v530 = 0;
    while v530 < buffer.len(v528) do
        local v531 = nil;
        local v532 = nil;
        local v533, v534, v535 = v0.readTag(v528, v530);
        v531 = v533;
        v532 = v534;
        v530 = v535;
        if v532 == v0.wireTypes.varint then
            v533 = nil;
            v534, v535 = v0.readVarInt(v528, v530);
            v533 = v534;
            v530 = v535;
        elseif v532 == v0.wireTypes.lengthDelimited then
            if v531 == 1 then
                v533 = nil;
                v534, v535 = v0.readBuffer(v528, v530);
                v533 = v534;
                v530 = v535;
                v529.universe_id = buffer.tostring(v533);
            else
                v533 = nil;
                v534, v535 = v0.readVarInt(v528, v530);
                v530 = v535 + v534;
            end;
        elseif v532 == v0.wireTypes.i32 then
            v533 = nil;
            v534, v535 = v0.readFixed32(v528, v530);
            v533 = v534;
            v530 = v535;
        elseif v532 == v0.wireTypes.i64 then
            v533 = nil;
            v534, v535 = v0.readFixed64(v528, v530);
            v533 = v534;
            v530 = v535;
        else
            error("Unsupported wire type: " .. v532);
        end;
    end;
    return v529;
end;
v4.jsonEncode = function(v536) --[[ Line: 5617 ]] --[[ Name: jsonEncode ]]
    local v537 = {};
    if v536.universe_id ~= nil and v536.universe_id ~= "" then
        v537.universeId = v536.universe_id;
    end;
    return v537;
end;
v4.jsonDecode = function(v538) --[[ Line: 5627 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_15 (copy)
    local v539 = l_v4_15.new();
    if v538.universe_id ~= nil then
        v539.universe_id = v538.universe_id;
    end;
    if v538.universeId ~= nil then
        v539.universe_id = v538.universeId;
    end;
    return v539;
end;
v4.descriptor = {
    name = "ExperienceDetailsStickyHeaderInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
};
v2.ExperienceDetailsStickyHeaderInputData = v4;
v1.default:register(v2.ExperienceDetailsStickyHeaderInputData);
v4 = {};
v4.__index = v4;
local l_v4_16 = v4 --[[ copy: 4 -> 21 ]];
v4.new = function(v541) --[[ Line: 5657 ]] --[[ Name: new ]]
    -- upvalues: l_v4_16 (copy)
    return (setmetatable({
        universe_id = (not (v541 ~= nil) or v541.universe_id == nil) and "" or v541.universe_id, 
        creator_key = (not (v541 ~= nil) or v541.creator_key == nil) and "" or v541.creator_key
    }, l_v4_16));
end;
v4.encode = function(v542) --[[ Line: 5666 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v543 = buffer.create(0);
    local v544 = 0;
    if v542.universe_id ~= nil and v542.universe_id ~= "" then
        local v545, v546 = v0.writeTag(v543, v544, 1, v0.wireTypes.lengthDelimited);
        v545, v546 = v0.writeString(v545, v546, v542.universe_id);
        v543 = v545;
        v544 = v546;
    end;
    if v542.creator_key ~= nil and v542.creator_key ~= "" then
        local v547, v548 = v0.writeTag(v543, v544, 2, v0.wireTypes.lengthDelimited);
        v547, v548 = v0.writeString(v547, v548, v542.creator_key);
        v543 = v547;
        v544 = v548;
    end;
    local v549 = buffer.create(v544);
    buffer.copy(v549, 0, v543, 0, v544);
    return v549;
end;
v4.decode = function(v550) --[[ Line: 5685 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_16 (copy), v0 (copy)
    local v551 = l_v4_16.new();
    local v552 = 0;
    while v552 < buffer.len(v550) do
        local v553 = nil;
        local v554 = nil;
        local v555, v556, v557 = v0.readTag(v550, v552);
        v553 = v555;
        v554 = v556;
        v552 = v557;
        if v554 == v0.wireTypes.varint then
            v555 = nil;
            v556, v557 = v0.readVarInt(v550, v552);
            v555 = v556;
            v552 = v557;
        elseif v554 == v0.wireTypes.lengthDelimited then
            if v553 == 1 then
                v555 = nil;
                v556, v557 = v0.readBuffer(v550, v552);
                v555 = v556;
                v552 = v557;
                v551.universe_id = buffer.tostring(v555);
            elseif v553 == 2 then
                v555 = nil;
                v556, v557 = v0.readBuffer(v550, v552);
                v555 = v556;
                v552 = v557;
                v551.creator_key = buffer.tostring(v555);
            else
                v555 = nil;
                v556, v557 = v0.readVarInt(v550, v552);
                v552 = v557 + v556;
            end;
        elseif v554 == v0.wireTypes.i32 then
            v555 = nil;
            v556, v557 = v0.readFixed32(v550, v552);
            v555 = v556;
            v552 = v557;
        elseif v554 == v0.wireTypes.i64 then
            v555 = nil;
            v556, v557 = v0.readFixed64(v550, v552);
            v555 = v556;
            v552 = v557;
        else
            error("Unsupported wire type: " .. v554);
        end;
    end;
    return v551;
end;
v4.jsonEncode = function(v558) --[[ Line: 5733 ]] --[[ Name: jsonEncode ]]
    local v559 = {};
    if v558.universe_id ~= nil and v558.universe_id ~= "" then
        v559.universeId = v558.universe_id;
    end;
    if v558.creator_key ~= nil and v558.creator_key ~= "" then
        v559.creatorKey = v558.creator_key;
    end;
    return v559;
end;
v4.jsonDecode = function(v560) --[[ Line: 5747 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_16 (copy)
    local v561 = l_v4_16.new();
    if v560.universe_id ~= nil then
        v561.universe_id = v560.universe_id;
    end;
    if v560.universeId ~= nil then
        v561.universe_id = v560.universeId;
    end;
    if v560.creator_key ~= nil then
        v561.creator_key = v560.creator_key;
    end;
    if v560.creatorKey ~= nil then
        v561.creator_key = v560.creatorKey;
    end;
    return v561;
end;
v4.descriptor = {
    name = "ExperienceAttributionRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
};
v2.ExperienceAttributionRowInputData = v4;
v1.default:register(v2.ExperienceAttributionRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_17 = v4 --[[ copy: 4 -> 22 ]];
v4.new = function(v563) --[[ Line: 5785 ]] --[[ Name: new ]]
    -- upvalues: l_v4_17 (copy)
    return (setmetatable({
        universe_id = (not (v563 ~= nil) or v563.universe_id == nil) and "" or v563.universe_id
    }, l_v4_17));
end;
v4.encode = function(v564) --[[ Line: 5793 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v565 = buffer.create(0);
    local v566 = 0;
    if v564.universe_id ~= nil and v564.universe_id ~= "" then
        local v567, v568 = v0.writeTag(v565, v566, 1, v0.wireTypes.lengthDelimited);
        v567, v568 = v0.writeString(v567, v568, v564.universe_id);
        v565 = v567;
        v566 = v568;
    end;
    local v569 = buffer.create(v566);
    buffer.copy(v569, 0, v565, 0, v566);
    return v569;
end;
v4.decode = function(v570) --[[ Line: 5807 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_17 (copy), v0 (copy)
    local v571 = l_v4_17.new();
    local v572 = 0;
    while v572 < buffer.len(v570) do
        local v573 = nil;
        local v574 = nil;
        local v575, v576, v577 = v0.readTag(v570, v572);
        v573 = v575;
        v574 = v576;
        v572 = v577;
        if v574 == v0.wireTypes.varint then
            v575 = nil;
            v576, v577 = v0.readVarInt(v570, v572);
            v575 = v576;
            v572 = v577;
        elseif v574 == v0.wireTypes.lengthDelimited then
            if v573 == 1 then
                v575 = nil;
                v576, v577 = v0.readBuffer(v570, v572);
                v575 = v576;
                v572 = v577;
                v571.universe_id = buffer.tostring(v575);
            else
                v575 = nil;
                v576, v577 = v0.readVarInt(v570, v572);
                v572 = v577 + v576;
            end;
        elseif v574 == v0.wireTypes.i32 then
            v575 = nil;
            v576, v577 = v0.readFixed32(v570, v572);
            v575 = v576;
            v572 = v577;
        elseif v574 == v0.wireTypes.i64 then
            v575 = nil;
            v576, v577 = v0.readFixed64(v570, v572);
            v575 = v576;
            v572 = v577;
        else
            error("Unsupported wire type: " .. v574);
        end;
    end;
    return v571;
end;
v4.jsonEncode = function(v578) --[[ Line: 5850 ]] --[[ Name: jsonEncode ]]
    local v579 = {};
    if v578.universe_id ~= nil and v578.universe_id ~= "" then
        v579.universeId = v578.universe_id;
    end;
    return v579;
end;
v4.jsonDecode = function(v580) --[[ Line: 5860 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_17 (copy)
    local v581 = l_v4_17.new();
    if v580.universe_id ~= nil then
        v581.universe_id = v580.universe_id;
    end;
    if v580.universeId ~= nil then
        v581.universe_id = v580.universeId;
    end;
    return v581;
end;
v4.descriptor = {
    name = "ExperienceActionModuleInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
};
v2.ExperienceActionModuleInputData = v4;
v1.default:register(v2.ExperienceActionModuleInputData);
v4 = {};
v4.__index = v4;
local l_v4_18 = v4 --[[ copy: 4 -> 23 ]];
v4.new = function(v583) --[[ Line: 5888 ]] --[[ Name: new ]]
    -- upvalues: l_v4_18 (copy)
    return (setmetatable({
        media_items = if not (v583 ~= nil) or v583.media_items == nil then {} else v583.media_items, 
        universe_id = (not (v583 ~= nil) or v583.universe_id == nil) and "" or v583.universe_id, 
        place_id = (not (v583 ~= nil) or v583.place_id == nil) and "" or v583.place_id
    }, l_v4_18));
end;
v4.encode = function(v584) --[[ Line: 5898 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v585 = buffer.create(0);
    local v586 = 0;
    if v584.media_items ~= nil and #v584.media_items > 0 then
        for _, v588 in v584.media_items do
            local v589 = v588:encode();
            local v590, v591 = v0.writeTag(v585, v586, 1, v0.wireTypes.lengthDelimited);
            v590, v591 = v0.writeBuffer(v590, v591, v589, buffer.len(v589));
            v585 = v590;
            v586 = v591;
        end;
    end;
    if v584.universe_id ~= nil and v584.universe_id ~= "" then
        local v592, v593 = v0.writeTag(v585, v586, 2, v0.wireTypes.lengthDelimited);
        v592, v593 = v0.writeString(v592, v593, v584.universe_id);
        v585 = v592;
        v586 = v593;
    end;
    if v584.place_id ~= nil and v584.place_id ~= "" then
        local v594, v595 = v0.writeTag(v585, v586, 3, v0.wireTypes.lengthDelimited);
        v594, v595 = v0.writeString(v594, v595, v584.place_id);
        v585 = v594;
        v586 = v595;
    end;
    local v596 = buffer.create(v586);
    buffer.copy(v596, 0, v585, 0, v586);
    return v596;
end;
v4.decode = function(v597) --[[ Line: 5925 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_18 (copy), v0 (copy), v2 (copy)
    local v598 = l_v4_18.new();
    local v599 = 0;
    while v599 < buffer.len(v597) do
        local v600 = nil;
        local v601 = nil;
        local v602, v603, v604 = v0.readTag(v597, v599);
        v600 = v602;
        v601 = v603;
        v599 = v604;
        if v601 == v0.wireTypes.varint then
            v602 = nil;
            v603, v604 = v0.readVarInt(v597, v599);
            v602 = v603;
            v599 = v604;
        elseif v601 == v0.wireTypes.lengthDelimited then
            if v600 == 1 then
                v602 = nil;
                v603, v604 = v0.readBuffer(v597, v599);
                v602 = v603;
                v599 = v604;
                table.insert(v598.media_items, v2.ExperienceMediaGalleryInputData_MediaItem.decode(v602));
            elseif v600 == 2 then
                v602 = nil;
                v603, v604 = v0.readBuffer(v597, v599);
                v602 = v603;
                v599 = v604;
                v598.universe_id = buffer.tostring(v602);
            elseif v600 == 3 then
                v602 = nil;
                v603, v604 = v0.readBuffer(v597, v599);
                v602 = v603;
                v599 = v604;
                v598.place_id = buffer.tostring(v602);
            else
                v602 = nil;
                v603, v604 = v0.readVarInt(v597, v599);
                v599 = v604 + v603;
            end;
        elseif v601 == v0.wireTypes.i32 then
            v602 = nil;
            v603, v604 = v0.readFixed32(v597, v599);
            v602 = v603;
            v599 = v604;
        elseif v601 == v0.wireTypes.i64 then
            v602 = nil;
            v603, v604 = v0.readFixed64(v597, v599);
            v602 = v603;
            v599 = v604;
        else
            error("Unsupported wire type: " .. v601);
        end;
    end;
    return v598;
end;
v4.jsonEncode = function(v605) --[[ Line: 5978 ]] --[[ Name: jsonEncode ]]
    local v606 = {};
    if v605.media_items ~= nil and #v605.media_items > 0 then
        local v607 = {};
        for _, v609 in v605.media_items do
            table.insert(v607, v609:jsonEncode());
        end;
        v606.mediaItems = v607;
    end;
    if v605.universe_id ~= nil and v605.universe_id ~= "" then
        v606.universeId = v605.universe_id;
    end;
    if v605.place_id ~= nil and v605.place_id ~= "" then
        v606.placeId = v605.place_id;
    end;
    return v606;
end;
v4.jsonDecode = function(v610) --[[ Line: 6000 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_18 (copy), v2 (copy)
    local v611 = l_v4_18.new();
    if v610.media_items ~= nil then
        local v612 = {};
        for _, v614 in v610.media_items do
            table.insert(v612, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v614));
        end;
        v611.media_items = v612;
    end;
    if v610.mediaItems ~= nil then
        local v615 = {};
        for _, v617 in v610.mediaItems do
            table.insert(v615, v2.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v617));
        end;
        v611.media_items = v615;
    end;
    if v610.universe_id ~= nil then
        v611.universe_id = v610.universe_id;
    end;
    if v610.universeId ~= nil then
        v611.universe_id = v610.universeId;
    end;
    if v610.place_id ~= nil then
        v611.place_id = v610.place_id;
    end;
    if v610.placeId ~= nil then
        v611.place_id = v610.placeId;
    end;
    return v611;
end;
v4.descriptor = {
    name = "ExperienceMediaGalleryInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
};
v2.ExperienceMediaGalleryInputData = v4;
v1.default:register(v2.ExperienceMediaGalleryInputData);
v4 = {};
v4.__index = v4;
local l_v4_19 = v4 --[[ copy: 4 -> 24 ]];
v4.new = function(v619) --[[ Line: 6054 ]] --[[ Name: new ]]
    -- upvalues: l_v4_19 (copy)
    return (setmetatable({
        media_asset_id = (not (v619 ~= nil) or v619.media_asset_id == nil) and "" or v619.media_asset_id
    }, l_v4_19));
end;
v4.encode = function(v620) --[[ Line: 6062 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v621 = buffer.create(0);
    local v622 = 0;
    if v620.media_asset_id ~= nil and v620.media_asset_id ~= "" then
        local v623, v624 = v0.writeTag(v621, v622, 1, v0.wireTypes.lengthDelimited);
        v623, v624 = v0.writeString(v623, v624, v620.media_asset_id);
        v621 = v623;
        v622 = v624;
    end;
    local v625 = buffer.create(v622);
    buffer.copy(v625, 0, v621, 0, v622);
    return v625;
end;
v4.decode = function(v626) --[[ Line: 6078 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_19 (copy), v0 (copy)
    local v627 = l_v4_19.new();
    local v628 = 0;
    while v628 < buffer.len(v626) do
        local v629 = nil;
        local v630 = nil;
        local v631, v632, v633 = v0.readTag(v626, v628);
        v629 = v631;
        v630 = v632;
        v628 = v633;
        if v630 == v0.wireTypes.varint then
            v631 = nil;
            v632, v633 = v0.readVarInt(v626, v628);
            v631 = v632;
            v628 = v633;
        elseif v630 == v0.wireTypes.lengthDelimited then
            if v629 == 1 then
                v631 = nil;
                v632, v633 = v0.readBuffer(v626, v628);
                v631 = v632;
                v628 = v633;
                v627.media_asset_id = buffer.tostring(v631);
            else
                v631 = nil;
                v632, v633 = v0.readVarInt(v626, v628);
                v628 = v633 + v632;
            end;
        elseif v630 == v0.wireTypes.i32 then
            v631 = nil;
            v632, v633 = v0.readFixed32(v626, v628);
            v631 = v632;
            v628 = v633;
        elseif v630 == v0.wireTypes.i64 then
            v631 = nil;
            v632, v633 = v0.readFixed64(v626, v628);
            v631 = v632;
            v628 = v633;
        else
            error("Unsupported wire type: " .. v630);
        end;
    end;
    return v627;
end;
v4.jsonEncode = function(v634) --[[ Line: 6123 ]] --[[ Name: jsonEncode ]]
    local v635 = {};
    if v634.media_asset_id ~= nil and v634.media_asset_id ~= "" then
        v635.mediaAssetId = v634.media_asset_id;
    end;
    return v635;
end;
v4.jsonDecode = function(v636) --[[ Line: 6135 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_19 (copy)
    local v637 = l_v4_19.new();
    if v636.media_asset_id ~= nil then
        v637.media_asset_id = v636.media_asset_id;
    end;
    if v636.mediaAssetId ~= nil then
        v637.media_asset_id = v636.mediaAssetId;
    end;
    return v637;
end;
v4.descriptor = {
    name = "ExperienceMediaGalleryInputData_MediaItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
};
v2.ExperienceMediaGalleryInputData_MediaItem = v4;
v1.default:register(v2.ExperienceMediaGalleryInputData_MediaItem);
v4 = {};
v4.__index = v4;
local l_v4_20 = v4 --[[ copy: 4 -> 25 ]];
v4.new = function(v639) --[[ Line: 6165 ]] --[[ Name: new ]]
    -- upvalues: l_v4_20 (copy)
    return (setmetatable({
        universe_id = (not (v639 ~= nil) or v639.universe_id == nil) and "" or v639.universe_id
    }, l_v4_20));
end;
v4.encode = function(v640) --[[ Line: 6173 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v641 = buffer.create(0);
    local v642 = 0;
    if v640.universe_id ~= nil and v640.universe_id ~= "" then
        local v643, v644 = v0.writeTag(v641, v642, 1, v0.wireTypes.lengthDelimited);
        v643, v644 = v0.writeString(v643, v644, v640.universe_id);
        v641 = v643;
        v642 = v644;
    end;
    local v645 = buffer.create(v642);
    buffer.copy(v645, 0, v641, 0, v642);
    return v645;
end;
v4.decode = function(v646) --[[ Line: 6187 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_20 (copy), v0 (copy)
    local v647 = l_v4_20.new();
    local v648 = 0;
    while v648 < buffer.len(v646) do
        local v649 = nil;
        local v650 = nil;
        local v651, v652, v653 = v0.readTag(v646, v648);
        v649 = v651;
        v650 = v652;
        v648 = v653;
        if v650 == v0.wireTypes.varint then
            v651 = nil;
            v652, v653 = v0.readVarInt(v646, v648);
            v651 = v652;
            v648 = v653;
        elseif v650 == v0.wireTypes.lengthDelimited then
            if v649 == 1 then
                v651 = nil;
                v652, v653 = v0.readBuffer(v646, v648);
                v651 = v652;
                v648 = v653;
                v647.universe_id = buffer.tostring(v651);
            else
                v651 = nil;
                v652, v653 = v0.readVarInt(v646, v648);
                v648 = v653 + v652;
            end;
        elseif v650 == v0.wireTypes.i32 then
            v651 = nil;
            v652, v653 = v0.readFixed32(v646, v648);
            v651 = v652;
            v648 = v653;
        elseif v650 == v0.wireTypes.i64 then
            v651 = nil;
            v652, v653 = v0.readFixed64(v646, v648);
            v651 = v652;
            v648 = v653;
        else
            error("Unsupported wire type: " .. v650);
        end;
    end;
    return v647;
end;
v4.jsonEncode = function(v654) --[[ Line: 6230 ]] --[[ Name: jsonEncode ]]
    local v655 = {};
    if v654.universe_id ~= nil and v654.universe_id ~= "" then
        v655.universeId = v654.universe_id;
    end;
    return v655;
end;
v4.jsonDecode = function(v656) --[[ Line: 6240 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_20 (copy)
    local v657 = l_v4_20.new();
    if v656.universe_id ~= nil then
        v657.universe_id = v656.universe_id;
    end;
    if v656.universeId ~= nil then
        v657.universe_id = v656.universeId;
    end;
    return v657;
end;
v4.descriptor = {
    name = "ExperienceDescriptionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
};
v2.ExperienceDescriptionInputData = v4;
v1.default:register(v2.ExperienceDescriptionInputData);
v4 = {};
v4.__index = v4;
local l_v4_21 = v4 --[[ copy: 4 -> 26 ]];
v4.new = function(v659) --[[ Line: 6268 ]] --[[ Name: new ]]
    -- upvalues: l_v4_21 (copy)
    return (setmetatable({
        universe_id = (not (v659 ~= nil) or v659.universe_id == nil) and "" or v659.universe_id
    }, l_v4_21));
end;
v4.encode = function(v660) --[[ Line: 6276 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v661 = buffer.create(0);
    local v662 = 0;
    if v660.universe_id ~= nil and v660.universe_id ~= "" then
        local v663, v664 = v0.writeTag(v661, v662, 1, v0.wireTypes.lengthDelimited);
        v663, v664 = v0.writeString(v663, v664, v660.universe_id);
        v661 = v663;
        v662 = v664;
    end;
    local v665 = buffer.create(v662);
    buffer.copy(v665, 0, v661, 0, v662);
    return v665;
end;
v4.decode = function(v666) --[[ Line: 6290 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_21 (copy), v0 (copy)
    local v667 = l_v4_21.new();
    local v668 = 0;
    while v668 < buffer.len(v666) do
        local v669 = nil;
        local v670 = nil;
        local v671, v672, v673 = v0.readTag(v666, v668);
        v669 = v671;
        v670 = v672;
        v668 = v673;
        if v670 == v0.wireTypes.varint then
            v671 = nil;
            v672, v673 = v0.readVarInt(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.lengthDelimited then
            if v669 == 1 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.universe_id = buffer.tostring(v671);
            else
                v671 = nil;
                v672, v673 = v0.readVarInt(v666, v668);
                v668 = v673 + v672;
            end;
        elseif v670 == v0.wireTypes.i32 then
            v671 = nil;
            v672, v673 = v0.readFixed32(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.i64 then
            v671 = nil;
            v672, v673 = v0.readFixed64(v666, v668);
            v671 = v672;
            v668 = v673;
        else
            error("Unsupported wire type: " .. v670);
        end;
    end;
    return v667;
end;
v4.jsonEncode = function(v674) --[[ Line: 6333 ]] --[[ Name: jsonEncode ]]
    local v675 = {};
    if v674.universe_id ~= nil and v674.universe_id ~= "" then
        v675.universeId = v674.universe_id;
    end;
    return v675;
end;
v4.jsonDecode = function(v676) --[[ Line: 6343 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_21 (copy)
    local v677 = l_v4_21.new();
    if v676.universe_id ~= nil then
        v677.universe_id = v676.universe_id;
    end;
    if v676.universeId ~= nil then
        v677.universe_id = v676.universeId;
    end;
    return v677;
end;
v4.descriptor = {
    name = "ExperienceStatRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
};
v2.ExperienceStatRowInputData = v4;
v1.default:register(v2.ExperienceStatRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_22 = v4 --[[ copy: 4 -> 27 ]];
v4.new = function(v679) --[[ Line: 6371 ]] --[[ Name: new ]]
    -- upvalues: l_v4_22 (copy)
    return (setmetatable({
        universe_id = (not (v679 ~= nil) or v679.universe_id == nil) and "" or v679.universe_id
    }, l_v4_22));
end;
v4.encode = function(v680) --[[ Line: 6379 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v681 = buffer.create(0);
    local v682 = 0;
    if v680.universe_id ~= nil and v680.universe_id ~= "" then
        local v683, v684 = v0.writeTag(v681, v682, 1, v0.wireTypes.lengthDelimited);
        v683, v684 = v0.writeString(v683, v684, v680.universe_id);
        v681 = v683;
        v682 = v684;
    end;
    local v685 = buffer.create(v682);
    buffer.copy(v685, 0, v681, 0, v682);
    return v685;
end;
v4.decode = function(v686) --[[ Line: 6393 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_22 (copy), v0 (copy)
    local v687 = l_v4_22.new();
    local v688 = 0;
    while v688 < buffer.len(v686) do
        local v689 = nil;
        local v690 = nil;
        local v691, v692, v693 = v0.readTag(v686, v688);
        v689 = v691;
        v690 = v692;
        v688 = v693;
        if v690 == v0.wireTypes.varint then
            v691 = nil;
            v692, v693 = v0.readVarInt(v686, v688);
            v691 = v692;
            v688 = v693;
        elseif v690 == v0.wireTypes.lengthDelimited then
            if v689 == 1 then
                v691 = nil;
                v692, v693 = v0.readBuffer(v686, v688);
                v691 = v692;
                v688 = v693;
                v687.universe_id = buffer.tostring(v691);
            else
                v691 = nil;
                v692, v693 = v0.readVarInt(v686, v688);
                v688 = v693 + v692;
            end;
        elseif v690 == v0.wireTypes.i32 then
            v691 = nil;
            v692, v693 = v0.readFixed32(v686, v688);
            v691 = v692;
            v688 = v693;
        elseif v690 == v0.wireTypes.i64 then
            v691 = nil;
            v692, v693 = v0.readFixed64(v686, v688);
            v691 = v692;
            v688 = v693;
        else
            error("Unsupported wire type: " .. v690);
        end;
    end;
    return v687;
end;
v4.jsonEncode = function(v694) --[[ Line: 6436 ]] --[[ Name: jsonEncode ]]
    local v695 = {};
    if v694.universe_id ~= nil and v694.universe_id ~= "" then
        v695.universeId = v694.universe_id;
    end;
    return v695;
end;
v4.jsonDecode = function(v696) --[[ Line: 6446 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_22 (copy)
    local v697 = l_v4_22.new();
    if v696.universe_id ~= nil then
        v697.universe_id = v696.universe_id;
    end;
    if v696.universeId ~= nil then
        v697.universe_id = v696.universeId;
    end;
    return v697;
end;
v4.descriptor = {
    name = "ExperienceInfoTableInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
};
v2.ExperienceInfoTableInputData = v4;
v1.default:register(v2.ExperienceInfoTableInputData);
v4 = {};
v4.__index = v4;
local l_v4_23 = v4 --[[ copy: 4 -> 28 ]];
v4.new = function(v699) --[[ Line: 6474 ]] --[[ Name: new ]]
    -- upvalues: l_v4_23 (copy)
    return (setmetatable({
        universe_id = (not (v699 ~= nil) or v699.universe_id == nil) and "" or v699.universe_id
    }, l_v4_23));
end;
v4.encode = function(v700) --[[ Line: 6482 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v701 = buffer.create(0);
    local v702 = 0;
    if v700.universe_id ~= nil and v700.universe_id ~= "" then
        local v703, v704 = v0.writeTag(v701, v702, 1, v0.wireTypes.lengthDelimited);
        v703, v704 = v0.writeString(v703, v704, v700.universe_id);
        v701 = v703;
        v702 = v704;
    end;
    local v705 = buffer.create(v702);
    buffer.copy(v705, 0, v701, 0, v702);
    return v705;
end;
v4.decode = function(v706) --[[ Line: 6496 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_23 (copy), v0 (copy)
    local v707 = l_v4_23.new();
    local v708 = 0;
    while v708 < buffer.len(v706) do
        local v709 = nil;
        local v710 = nil;
        local v711, v712, v713 = v0.readTag(v706, v708);
        v709 = v711;
        v710 = v712;
        v708 = v713;
        if v710 == v0.wireTypes.varint then
            v711 = nil;
            v712, v713 = v0.readVarInt(v706, v708);
            v711 = v712;
            v708 = v713;
        elseif v710 == v0.wireTypes.lengthDelimited then
            if v709 == 1 then
                v711 = nil;
                v712, v713 = v0.readBuffer(v706, v708);
                v711 = v712;
                v708 = v713;
                v707.universe_id = buffer.tostring(v711);
            else
                v711 = nil;
                v712, v713 = v0.readVarInt(v706, v708);
                v708 = v713 + v712;
            end;
        elseif v710 == v0.wireTypes.i32 then
            v711 = nil;
            v712, v713 = v0.readFixed32(v706, v708);
            v711 = v712;
            v708 = v713;
        elseif v710 == v0.wireTypes.i64 then
            v711 = nil;
            v712, v713 = v0.readFixed64(v706, v708);
            v711 = v712;
            v708 = v713;
        else
            error("Unsupported wire type: " .. v710);
        end;
    end;
    return v707;
end;
v4.jsonEncode = function(v714) --[[ Line: 6539 ]] --[[ Name: jsonEncode ]]
    local v715 = {};
    if v714.universe_id ~= nil and v714.universe_id ~= "" then
        v715.universeId = v714.universe_id;
    end;
    return v715;
end;
v4.jsonDecode = function(v716) --[[ Line: 6549 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_23 (copy)
    local v717 = l_v4_23.new();
    if v716.universe_id ~= nil then
        v717.universe_id = v716.universe_id;
    end;
    if v716.universeId ~= nil then
        v717.universe_id = v716.universeId;
    end;
    return v717;
end;
v4.descriptor = {
    name = "ExperienceContentRatingLabelInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
};
v2.ExperienceContentRatingLabelInputData = v4;
v1.default:register(v2.ExperienceContentRatingLabelInputData);
v4 = {};
v4.__index = v4;
local l_v4_24 = v4 --[[ copy: 4 -> 29 ]];
v4.new = function(v719) --[[ Line: 6579 ]] --[[ Name: new ]]
    -- upvalues: l_v4_24 (copy)
    return (setmetatable({
        universe_id = (not (v719 ~= nil) or v719.universe_id == nil) and "" or v719.universe_id, 
        user_owns_experience = v719 ~= nil and not (v719.user_owns_experience == nil) and v719.user_owns_experience
    }, l_v4_24));
end;
v4.encode = function(v720) --[[ Line: 6590 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v721 = buffer.create(0);
    local v722 = 0;
    if v720.universe_id ~= nil and v720.universe_id ~= "" then
        local v723, v724 = v0.writeTag(v721, v722, 1, v0.wireTypes.lengthDelimited);
        v723, v724 = v0.writeString(v723, v724, v720.universe_id);
        v721 = v723;
        v722 = v724;
    end;
    if v720.user_owns_experience then
        local v725, v726 = v0.writeTag(v721, v722, 2, v0.wireTypes.varint);
        v725, v726 = v0.writeVarInt(v725, v726, v720.user_owns_experience and 1 or 0);
        v721 = v725;
        v722 = v726;
    end;
    local v727 = buffer.create(v722);
    buffer.copy(v727, 0, v721, 0, v722);
    return v727;
end;
v4.decode = function(v728) --[[ Line: 6609 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_24 (copy), v0 (copy)
    local v729 = l_v4_24.new();
    local v730 = 0;
    while v730 < buffer.len(v728) do
        local v731 = nil;
        local v732 = nil;
        local v733, v734, v735 = v0.readTag(v728, v730);
        v731 = v733;
        v732 = v734;
        v730 = v735;
        if v732 == v0.wireTypes.varint then
            if v731 == 2 then
                v733 = nil;
                v734, v735 = v0.readVarInt(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.user_owns_experience = v733 ~= 0;
            else
                v733 = nil;
                v734, v735 = v0.readVarInt(v728, v730);
                v733 = v734;
                v730 = v735;
            end;
        elseif v732 == v0.wireTypes.lengthDelimited then
            if v731 == 1 then
                v733 = nil;
                v734, v735 = v0.readBuffer(v728, v730);
                v733 = v734;
                v730 = v735;
                v729.universe_id = buffer.tostring(v733);
            else
                v733 = nil;
                v734, v735 = v0.readVarInt(v728, v730);
                v730 = v735 + v734;
            end;
        elseif v732 == v0.wireTypes.i32 then
            v733 = nil;
            v734, v735 = v0.readFixed32(v728, v730);
            v733 = v734;
            v730 = v735;
        elseif v732 == v0.wireTypes.i64 then
            v733 = nil;
            v734, v735 = v0.readFixed64(v728, v730);
            v733 = v734;
            v730 = v735;
        else
            error("Unsupported wire type: " .. v732);
        end;
    end;
    return v729;
end;
v4.jsonEncode = function(v736) --[[ Line: 6657 ]] --[[ Name: jsonEncode ]]
    local v737 = {};
    if v736.universe_id ~= nil and v736.universe_id ~= "" then
        v737.universeId = v736.universe_id;
    end;
    if v736.user_owns_experience then
        v737.userOwnsExperience = v736.user_owns_experience;
    end;
    return v737;
end;
v4.jsonDecode = function(v738) --[[ Line: 6671 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_24 (copy)
    local v739 = l_v4_24.new();
    if v738.universe_id ~= nil then
        v739.universe_id = v738.universe_id;
    end;
    if v738.universeId ~= nil then
        v739.universe_id = v738.universeId;
    end;
    if v738.user_owns_experience ~= nil then
        v739.user_owns_experience = v738.user_owns_experience;
    end;
    if v738.userOwnsExperience ~= nil then
        v739.user_owns_experience = v738.userOwnsExperience;
    end;
    return v739;
end;
v4.descriptor = {
    name = "ExperienceRefundPolicyInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
};
v2.ExperienceRefundPolicyInputData = v4;
v1.default:register(v2.ExperienceRefundPolicyInputData);
v4 = {};
v4.__index = v4;
local l_v4_25 = v4 --[[ copy: 4 -> 30 ]];
v4.new = function(v741) --[[ Line: 6707 ]] --[[ Name: new ]]
    -- upvalues: l_v4_25 (copy)
    return (setmetatable({
        social_link_items = if not (v741 ~= nil) or v741.social_link_items == nil then {} else v741.social_link_items
    }, l_v4_25));
end;
v4.encode = function(v742) --[[ Line: 6713 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v743 = buffer.create(0);
    local v744 = 0;
    if v742.social_link_items ~= nil and #v742.social_link_items > 0 then
        for _, v746 in v742.social_link_items do
            local v747 = v746:encode();
            local v748, v749 = v0.writeTag(v743, v744, 1, v0.wireTypes.lengthDelimited);
            v748, v749 = v0.writeBuffer(v748, v749, v747, buffer.len(v747));
            v743 = v748;
            v744 = v749;
        end;
    end;
    local v750 = buffer.create(v744);
    buffer.copy(v750, 0, v743, 0, v744);
    return v750;
end;
v4.decode = function(v751) --[[ Line: 6730 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_25 (copy), v0 (copy), v2 (copy)
    local v752 = l_v4_25.new();
    local v753 = 0;
    while v753 < buffer.len(v751) do
        local v754 = nil;
        local v755 = nil;
        local v756, v757, v758 = v0.readTag(v751, v753);
        v754 = v756;
        v755 = v757;
        v753 = v758;
        if v755 == v0.wireTypes.varint then
            v756 = nil;
            v757, v758 = v0.readVarInt(v751, v753);
            v756 = v757;
            v753 = v758;
        elseif v755 == v0.wireTypes.lengthDelimited then
            if v754 == 1 then
                v756 = nil;
                v757, v758 = v0.readBuffer(v751, v753);
                v756 = v757;
                v753 = v758;
                table.insert(v752.social_link_items, v2.SocialLinkRowInputData_SocialLinkItem.decode(v756));
            else
                v756 = nil;
                v757, v758 = v0.readVarInt(v751, v753);
                v753 = v758 + v757;
            end;
        elseif v755 == v0.wireTypes.i32 then
            v756 = nil;
            v757, v758 = v0.readFixed32(v751, v753);
            v756 = v757;
            v753 = v758;
        elseif v755 == v0.wireTypes.i64 then
            v756 = nil;
            v757, v758 = v0.readFixed64(v751, v753);
            v756 = v757;
            v753 = v758;
        else
            error("Unsupported wire type: " .. v755);
        end;
    end;
    return v752;
end;
v4.jsonEncode = function(v759) --[[ Line: 6773 ]] --[[ Name: jsonEncode ]]
    local v760 = {};
    if v759.social_link_items ~= nil and #v759.social_link_items > 0 then
        local v761 = {};
        for _, v763 in v759.social_link_items do
            table.insert(v761, v763:jsonEncode());
        end;
        v760.socialLinkItems = v761;
    end;
    return v760;
end;
v4.jsonDecode = function(v764) --[[ Line: 6787 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_25 (copy), v2 (copy)
    local v765 = l_v4_25.new();
    if v764.social_link_items ~= nil then
        local v766 = {};
        for _, v768 in v764.social_link_items do
            table.insert(v766, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v768));
        end;
        v765.social_link_items = v766;
    end;
    if v764.socialLinkItems ~= nil then
        local v769 = {};
        for _, v771 in v764.socialLinkItems do
            table.insert(v769, v2.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v771));
        end;
        v765.social_link_items = v769;
    end;
    return v765;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
};
v2.SocialLinkRowInputData = v4;
v1.default:register(v2.SocialLinkRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_26 = v4 --[[ copy: 4 -> 31 ]];
v4.new = function(v773) --[[ Line: 6825 ]] --[[ Name: new ]]
    -- upvalues: l_v4_26 (copy)
    return (setmetatable({
        social_link_id = (not (v773 ~= nil) or v773.social_link_id == nil) and "" or v773.social_link_id
    }, l_v4_26));
end;
v4.encode = function(v774) --[[ Line: 6833 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v775 = buffer.create(0);
    local v776 = 0;
    if v774.social_link_id ~= nil and v774.social_link_id ~= "" then
        local v777, v778 = v0.writeTag(v775, v776, 1, v0.wireTypes.lengthDelimited);
        v777, v778 = v0.writeString(v777, v778, v774.social_link_id);
        v775 = v777;
        v776 = v778;
    end;
    local v779 = buffer.create(v776);
    buffer.copy(v779, 0, v775, 0, v776);
    return v779;
end;
v4.decode = function(v780) --[[ Line: 6847 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_26 (copy), v0 (copy)
    local v781 = l_v4_26.new();
    local v782 = 0;
    while v782 < buffer.len(v780) do
        local v783 = nil;
        local v784 = nil;
        local v785, v786, v787 = v0.readTag(v780, v782);
        v783 = v785;
        v784 = v786;
        v782 = v787;
        if v784 == v0.wireTypes.varint then
            v785 = nil;
            v786, v787 = v0.readVarInt(v780, v782);
            v785 = v786;
            v782 = v787;
        elseif v784 == v0.wireTypes.lengthDelimited then
            if v783 == 1 then
                v785 = nil;
                v786, v787 = v0.readBuffer(v780, v782);
                v785 = v786;
                v782 = v787;
                v781.social_link_id = buffer.tostring(v785);
            else
                v785 = nil;
                v786, v787 = v0.readVarInt(v780, v782);
                v782 = v787 + v786;
            end;
        elseif v784 == v0.wireTypes.i32 then
            v785 = nil;
            v786, v787 = v0.readFixed32(v780, v782);
            v785 = v786;
            v782 = v787;
        elseif v784 == v0.wireTypes.i64 then
            v785 = nil;
            v786, v787 = v0.readFixed64(v780, v782);
            v785 = v786;
            v782 = v787;
        else
            error("Unsupported wire type: " .. v784);
        end;
    end;
    return v781;
end;
v4.jsonEncode = function(v788) --[[ Line: 6890 ]] --[[ Name: jsonEncode ]]
    local v789 = {};
    if v788.social_link_id ~= nil and v788.social_link_id ~= "" then
        v789.socialLinkId = v788.social_link_id;
    end;
    return v789;
end;
v4.jsonDecode = function(v790) --[[ Line: 6900 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_26 (copy)
    local v791 = l_v4_26.new();
    if v790.social_link_id ~= nil then
        v791.social_link_id = v790.social_link_id;
    end;
    if v790.socialLinkId ~= nil then
        v791.social_link_id = v790.socialLinkId;
    end;
    return v791;
end;
v4.descriptor = {
    name = "SocialLinkRowInputData_SocialLinkItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
};
v2.SocialLinkRowInputData_SocialLinkItem = v4;
v1.default:register(v2.SocialLinkRowInputData_SocialLinkItem);
v4 = {};
v4.__index = v4;
local l_v4_27 = v4 --[[ copy: 4 -> 32 ]];
v4.new = function(v793) --[[ Line: 6930 ]] --[[ Name: new ]]
    -- upvalues: l_v4_27 (copy)
    return (setmetatable({
        title = (not (v793 ~= nil) or v793.title == nil) and "" or v793.title, 
        universe_items = if not (v793 ~= nil) or v793.universe_items == nil then {} else v793.universe_items, 
        next_page_token = (not (v793 ~= nil) or v793.next_page_token == nil) and "" or v793.next_page_token, 
        sort_id = (not (v793 ~= nil) or v793.sort_id == nil) and "" or v793.sort_id, 
        secondary_sort_id = (not (v793 ~= nil) or v793.secondary_sort_id == nil) and 0 or v793.secondary_sort_id, 
        max_visible_rows = (not (v793 ~= nil) or v793.max_visible_rows == nil) and 0 or v793.max_visible_rows, 
        subtitle = (not (v793 ~= nil) or v793.subtitle == nil) and "" or v793.subtitle, 
        info_text = (not (v793 ~= nil) or v793.info_text == nil) and "" or v793.info_text, 
        subtitle_link_path = (not (v793 ~= nil) or v793.subtitle_link_path == nil) and "" or v793.subtitle_link_path
    }, l_v4_27));
end;
v4.encode = function(v794) --[[ Line: 6946 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v795 = buffer.create(0);
    local v796 = 0;
    if v794.title ~= nil and v794.title ~= "" then
        local v797, v798 = v0.writeTag(v795, v796, 1, v0.wireTypes.lengthDelimited);
        v797, v798 = v0.writeString(v797, v798, v794.title);
        v795 = v797;
        v796 = v798;
    end;
    if v794.universe_items ~= nil and #v794.universe_items > 0 then
        for _, v800 in v794.universe_items do
            local v801 = v800:encode();
            local v802, v803 = v0.writeTag(v795, v796, 2, v0.wireTypes.lengthDelimited);
            v802, v803 = v0.writeBuffer(v802, v803, v801, buffer.len(v801));
            v795 = v802;
            v796 = v803;
        end;
    end;
    if v794.next_page_token ~= nil and v794.next_page_token ~= "" then
        local v804, v805 = v0.writeTag(v795, v796, 3, v0.wireTypes.lengthDelimited);
        v804, v805 = v0.writeString(v804, v805, v794.next_page_token);
        v795 = v804;
        v796 = v805;
    end;
    if v794.sort_id ~= nil and v794.sort_id ~= "" then
        local v806, v807 = v0.writeTag(v795, v796, 4, v0.wireTypes.lengthDelimited);
        v806, v807 = v0.writeString(v806, v807, v794.sort_id);
        v795 = v806;
        v796 = v807;
    end;
    if v794.secondary_sort_id ~= nil and v794.secondary_sort_id ~= 0 then
        local v808, v809 = v0.writeTag(v795, v796, 5, v0.wireTypes.varint);
        v808, v809 = v0.writeVarInt(v808, v809, v794.secondary_sort_id);
        v795 = v808;
        v796 = v809;
    end;
    if v794.max_visible_rows ~= nil and v794.max_visible_rows ~= 0 then
        local v810, v811 = v0.writeTag(v795, v796, 6, v0.wireTypes.varint);
        v810, v811 = v0.writeVarInt(v810, v811, v794.max_visible_rows);
        v795 = v810;
        v796 = v811;
    end;
    if v794.subtitle ~= nil and v794.subtitle ~= "" then
        local v812, v813 = v0.writeTag(v795, v796, 7, v0.wireTypes.lengthDelimited);
        v812, v813 = v0.writeString(v812, v813, v794.subtitle);
        v795 = v812;
        v796 = v813;
    end;
    if v794.info_text ~= nil and v794.info_text ~= "" then
        local v814, v815 = v0.writeTag(v795, v796, 8, v0.wireTypes.lengthDelimited);
        v814, v815 = v0.writeString(v814, v815, v794.info_text);
        v795 = v814;
        v796 = v815;
    end;
    if v794.subtitle_link_path ~= nil and v794.subtitle_link_path ~= "" then
        local v816, v817 = v0.writeTag(v795, v796, 9, v0.wireTypes.lengthDelimited);
        v816, v817 = v0.writeString(v816, v817, v794.subtitle_link_path);
        v795 = v816;
        v796 = v817;
    end;
    local v818 = buffer.create(v796);
    buffer.copy(v818, 0, v795, 0, v796);
    return v818;
end;
v4.decode = function(v819) --[[ Line: 7003 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_27 (copy), v0 (copy), v2 (copy)
    local v820 = l_v4_27.new();
    local v821 = 0;
    while v821 < buffer.len(v819) do
        local v822 = nil;
        local v823 = nil;
        local v824, v825, v826 = v0.readTag(v819, v821);
        v822 = v824;
        v823 = v825;
        v821 = v826;
        if v823 == v0.wireTypes.varint then
            if v822 == 5 then
                v824 = nil;
                v825, v826 = v0.readVarIntI32(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.secondary_sort_id = v824;
            elseif v822 == 6 then
                v824 = nil;
                v825, v826 = v0.readVarIntI32(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.max_visible_rows = v824;
            else
                v824 = nil;
                v825, v826 = v0.readVarInt(v819, v821);
                v824 = v825;
                v821 = v826;
            end;
        elseif v823 == v0.wireTypes.lengthDelimited then
            if v822 == 1 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.title = buffer.tostring(v824);
            elseif v822 == 2 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                table.insert(v820.universe_items, v2.ExperienceCarouselInputData_UniverseItem.decode(v824));
            elseif v822 == 3 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.next_page_token = buffer.tostring(v824);
            elseif v822 == 4 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.sort_id = buffer.tostring(v824);
            elseif v822 == 7 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.subtitle = buffer.tostring(v824);
            elseif v822 == 8 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.info_text = buffer.tostring(v824);
            elseif v822 == 9 then
                v824 = nil;
                v825, v826 = v0.readBuffer(v819, v821);
                v824 = v825;
                v821 = v826;
                v820.subtitle_link_path = buffer.tostring(v824);
            else
                v824 = nil;
                v825, v826 = v0.readVarInt(v819, v821);
                v821 = v826 + v825;
            end;
        elseif v823 == v0.wireTypes.i32 then
            v824 = nil;
            v825, v826 = v0.readFixed32(v819, v821);
            v824 = v825;
            v821 = v826;
        elseif v823 == v0.wireTypes.i64 then
            v824 = nil;
            v825, v826 = v0.readFixed64(v819, v821);
            v824 = v825;
            v821 = v826;
        else
            error("Unsupported wire type: " .. v823);
        end;
    end;
    return v820;
end;
v4.jsonEncode = function(v827) --[[ Line: 7086 ]] --[[ Name: jsonEncode ]]
    local v828 = {};
    if v827.title ~= nil and v827.title ~= "" then
        v828.title = v827.title;
    end;
    if v827.universe_items ~= nil and #v827.universe_items > 0 then
        local v829 = {};
        for _, v831 in v827.universe_items do
            table.insert(v829, v831:jsonEncode());
        end;
        v828.universeItems = v829;
    end;
    if v827.next_page_token ~= nil and v827.next_page_token ~= "" then
        v828.nextPageToken = v827.next_page_token;
    end;
    if v827.sort_id ~= nil and v827.sort_id ~= "" then
        v828.sortId = v827.sort_id;
    end;
    if v827.secondary_sort_id ~= nil and v827.secondary_sort_id ~= 0 then
        v828.secondarySortId = v827.secondary_sort_id;
    end;
    if v827.max_visible_rows ~= nil and v827.max_visible_rows ~= 0 then
        v828.maxVisibleRows = v827.max_visible_rows;
    end;
    if v827.subtitle ~= nil and v827.subtitle ~= "" then
        v828.subtitle = v827.subtitle;
    end;
    if v827.info_text ~= nil and v827.info_text ~= "" then
        v828.infoText = v827.info_text;
    end;
    if v827.subtitle_link_path ~= nil and v827.subtitle_link_path ~= "" then
        v828.subtitleLinkPath = v827.subtitle_link_path;
    end;
    return v828;
end;
v4.jsonDecode = function(v832) --[[ Line: 7132 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_27 (copy), v2 (copy)
    local v833 = l_v4_27.new();
    if v832.title ~= nil then
        v833.title = v832.title;
    end;
    if v832.universe_items ~= nil then
        local v834 = {};
        for _, v836 in v832.universe_items do
            table.insert(v834, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v836));
        end;
        v833.universe_items = v834;
    end;
    if v832.universeItems ~= nil then
        local v837 = {};
        for _, v839 in v832.universeItems do
            table.insert(v837, v2.ExperienceCarouselInputData_UniverseItem.jsonDecode(v839));
        end;
        v833.universe_items = v837;
    end;
    if v832.next_page_token ~= nil then
        v833.next_page_token = v832.next_page_token;
    end;
    if v832.nextPageToken ~= nil then
        v833.next_page_token = v832.nextPageToken;
    end;
    if v832.sort_id ~= nil then
        v833.sort_id = v832.sort_id;
    end;
    if v832.sortId ~= nil then
        v833.sort_id = v832.sortId;
    end;
    if v832.secondary_sort_id ~= nil then
        v833.secondary_sort_id = v832.secondary_sort_id;
    end;
    if v832.secondarySortId ~= nil then
        v833.secondary_sort_id = v832.secondarySortId;
    end;
    if v832.max_visible_rows ~= nil then
        v833.max_visible_rows = v832.max_visible_rows;
    end;
    if v832.maxVisibleRows ~= nil then
        v833.max_visible_rows = v832.maxVisibleRows;
    end;
    if v832.subtitle ~= nil then
        v833.subtitle = v832.subtitle;
    end;
    if v832.info_text ~= nil then
        v833.info_text = v832.info_text;
    end;
    if v832.infoText ~= nil then
        v833.info_text = v832.infoText;
    end;
    if v832.subtitle_link_path ~= nil then
        v833.subtitle_link_path = v832.subtitle_link_path;
    end;
    if v832.subtitleLinkPath ~= nil then
        v833.subtitle_link_path = v832.subtitleLinkPath;
    end;
    return v833;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
};
v2.ExperienceCarouselInputData = v4;
v1.default:register(v2.ExperienceCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_28 = v4 --[[ copy: 4 -> 33 ]];
v4.new = function(v841) --[[ Line: 7226 ]] --[[ Name: new ]]
    -- upvalues: l_v4_28 (copy)
    return (setmetatable({
        universe_id = (not (v841 ~= nil) or v841.universe_id == nil) and "" or v841.universe_id, 
        is_sponsored = v841 ~= nil and not (v841.is_sponsored == nil) and v841.is_sponsored, 
        roblox_component = (not (v841 ~= nil) or v841.roblox_component == nil) and "" or v841.roblox_component, 
        native_ad_data = (not (v841 ~= nil) or v841.native_ad_data == nil) and "" or v841.native_ad_data, 
        is_content_locked = v841 ~= nil and not (v841.is_content_locked == nil) and v841.is_content_locked
    }, l_v4_28));
end;
v4.encode = function(v842) --[[ Line: 7238 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v843 = buffer.create(0);
    local v844 = 0;
    if v842.universe_id ~= nil and v842.universe_id ~= "" then
        local v845, v846 = v0.writeTag(v843, v844, 1, v0.wireTypes.lengthDelimited);
        v845, v846 = v0.writeString(v845, v846, v842.universe_id);
        v843 = v845;
        v844 = v846;
    end;
    if v842.is_sponsored then
        local v847, v848 = v0.writeTag(v843, v844, 2, v0.wireTypes.varint);
        v847, v848 = v0.writeVarInt(v847, v848, v842.is_sponsored and 1 or 0);
        v843 = v847;
        v844 = v848;
    end;
    if v842.roblox_component ~= nil and v842.roblox_component ~= "" then
        local v849, v850 = v0.writeTag(v843, v844, 3, v0.wireTypes.lengthDelimited);
        v849, v850 = v0.writeString(v849, v850, v842.roblox_component);
        v843 = v849;
        v844 = v850;
    end;
    if v842.native_ad_data ~= nil and v842.native_ad_data ~= "" then
        local v851, v852 = v0.writeTag(v843, v844, 4, v0.wireTypes.lengthDelimited);
        v851, v852 = v0.writeString(v851, v852, v842.native_ad_data);
        v843 = v851;
        v844 = v852;
    end;
    if v842.is_content_locked then
        local v853, v854 = v0.writeTag(v843, v844, 5, v0.wireTypes.varint);
        v853, v854 = v0.writeVarInt(v853, v854, v842.is_content_locked and 1 or 0);
        v843 = v853;
        v844 = v854;
    end;
    local v855 = buffer.create(v844);
    buffer.copy(v855, 0, v843, 0, v844);
    return v855;
end;
v4.decode = function(v856) --[[ Line: 7274 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_28 (copy), v0 (copy)
    local v857 = l_v4_28.new();
    local v858 = 0;
    while v858 < buffer.len(v856) do
        local v859 = nil;
        local v860 = nil;
        local v861, v862, v863 = v0.readTag(v856, v858);
        v859 = v861;
        v860 = v862;
        v858 = v863;
        if v860 == v0.wireTypes.varint then
            if v859 == 2 then
                v861 = nil;
                v862, v863 = v0.readVarInt(v856, v858);
                v861 = v862;
                v858 = v863;
                v857.is_sponsored = v861 ~= 0;
            elseif v859 == 5 then
                v861 = nil;
                v862, v863 = v0.readVarInt(v856, v858);
                v861 = v862;
                v858 = v863;
                v857.is_content_locked = v861 ~= 0;
            else
                v861 = nil;
                v862, v863 = v0.readVarInt(v856, v858);
                v861 = v862;
                v858 = v863;
            end;
        elseif v860 == v0.wireTypes.lengthDelimited then
            if v859 == 1 then
                v861 = nil;
                v862, v863 = v0.readBuffer(v856, v858);
                v861 = v862;
                v858 = v863;
                v857.universe_id = buffer.tostring(v861);
            elseif v859 == 3 then
                v861 = nil;
                v862, v863 = v0.readBuffer(v856, v858);
                v861 = v862;
                v858 = v863;
                v857.roblox_component = buffer.tostring(v861);
            elseif v859 == 4 then
                v861 = nil;
                v862, v863 = v0.readBuffer(v856, v858);
                v861 = v862;
                v858 = v863;
                v857.native_ad_data = buffer.tostring(v861);
            else
                v861 = nil;
                v862, v863 = v0.readVarInt(v856, v858);
                v858 = v863 + v862;
            end;
        elseif v860 == v0.wireTypes.i32 then
            v861 = nil;
            v862, v863 = v0.readFixed32(v856, v858);
            v861 = v862;
            v858 = v863;
        elseif v860 == v0.wireTypes.i64 then
            v861 = nil;
            v862, v863 = v0.readFixed64(v856, v858);
            v861 = v862;
            v858 = v863;
        else
            error("Unsupported wire type: " .. v860);
        end;
    end;
    return v857;
end;
v4.jsonEncode = function(v864) --[[ Line: 7339 ]] --[[ Name: jsonEncode ]]
    local v865 = {};
    if v864.universe_id ~= nil and v864.universe_id ~= "" then
        v865.universeId = v864.universe_id;
    end;
    if v864.is_sponsored then
        v865.isSponsored = v864.is_sponsored;
    end;
    if v864.roblox_component ~= nil and v864.roblox_component ~= "" then
        v865.robloxComponent = v864.roblox_component;
    end;
    if v864.native_ad_data ~= nil and v864.native_ad_data ~= "" then
        v865.nativeAdData = v864.native_ad_data;
    end;
    if v864.is_content_locked then
        v865.isContentLocked = v864.is_content_locked;
    end;
    return v865;
end;
v4.jsonDecode = function(v866) --[[ Line: 7367 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_28 (copy)
    local v867 = l_v4_28.new();
    if v866.universe_id ~= nil then
        v867.universe_id = v866.universe_id;
    end;
    if v866.universeId ~= nil then
        v867.universe_id = v866.universeId;
    end;
    if v866.is_sponsored ~= nil then
        v867.is_sponsored = v866.is_sponsored;
    end;
    if v866.isSponsored ~= nil then
        v867.is_sponsored = v866.isSponsored;
    end;
    if v866.roblox_component ~= nil then
        v867.roblox_component = v866.roblox_component;
    end;
    if v866.robloxComponent ~= nil then
        v867.roblox_component = v866.robloxComponent;
    end;
    if v866.native_ad_data ~= nil then
        v867.native_ad_data = v866.native_ad_data;
    end;
    if v866.nativeAdData ~= nil then
        v867.native_ad_data = v866.nativeAdData;
    end;
    if v866.is_content_locked ~= nil then
        v867.is_content_locked = v866.is_content_locked;
    end;
    if v866.isContentLocked ~= nil then
        v867.is_content_locked = v866.isContentLocked;
    end;
    return v867;
end;
v4.descriptor = {
    name = "ExperienceCarouselInputData_UniverseItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
};
v2.ExperienceCarouselInputData_UniverseItem = v4;
v1.default:register(v2.ExperienceCarouselInputData_UniverseItem);
v4 = {};
v4.__index = v4;
local l_v4_29 = v4 --[[ copy: 4 -> 34 ]];
v4.new = function(v869) --[[ Line: 7429 ]] --[[ Name: new ]]
    -- upvalues: l_v4_29 (copy)
    return (setmetatable({
        title = (not (v869 ~= nil) or v869.title == nil) and "" or v869.title, 
        song_items = if not (v869 ~= nil) or v869.song_items == nil then {} else v869.song_items, 
        next_page_token = (not (v869 ~= nil) or v869.next_page_token == nil) and "" or v869.next_page_token, 
        sort_id = (not (v869 ~= nil) or v869.sort_id == nil) and "" or v869.sort_id, 
        secondary_sort_id = (not (v869 ~= nil) or v869.secondary_sort_id == nil) and 0 or v869.secondary_sort_id, 
        subtitle = (not (v869 ~= nil) or v869.subtitle == nil) and "" or v869.subtitle, 
        info_text = (not (v869 ~= nil) or v869.info_text == nil) and "" or v869.info_text, 
        subtitle_link_path = (not (v869 ~= nil) or v869.subtitle_link_path == nil) and "" or v869.subtitle_link_path
    }, l_v4_29));
end;
v4.encode = function(v870) --[[ Line: 7442 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v871 = buffer.create(0);
    local v872 = 0;
    if v870.title ~= nil and v870.title ~= "" then
        local v873, v874 = v0.writeTag(v871, v872, 1, v0.wireTypes.lengthDelimited);
        v873, v874 = v0.writeString(v873, v874, v870.title);
        v871 = v873;
        v872 = v874;
    end;
    if v870.song_items ~= nil and #v870.song_items > 0 then
        for _, v876 in v870.song_items do
            local v877 = v876:encode();
            local v878, v879 = v0.writeTag(v871, v872, 2, v0.wireTypes.lengthDelimited);
            v878, v879 = v0.writeBuffer(v878, v879, v877, buffer.len(v877));
            v871 = v878;
            v872 = v879;
        end;
    end;
    if v870.next_page_token ~= nil and v870.next_page_token ~= "" then
        local v880, v881 = v0.writeTag(v871, v872, 3, v0.wireTypes.lengthDelimited);
        v880, v881 = v0.writeString(v880, v881, v870.next_page_token);
        v871 = v880;
        v872 = v881;
    end;
    if v870.sort_id ~= nil and v870.sort_id ~= "" then
        local v882, v883 = v0.writeTag(v871, v872, 4, v0.wireTypes.lengthDelimited);
        v882, v883 = v0.writeString(v882, v883, v870.sort_id);
        v871 = v882;
        v872 = v883;
    end;
    if v870.secondary_sort_id ~= nil and v870.secondary_sort_id ~= 0 then
        local v884, v885 = v0.writeTag(v871, v872, 5, v0.wireTypes.varint);
        v884, v885 = v0.writeVarInt(v884, v885, v870.secondary_sort_id);
        v871 = v884;
        v872 = v885;
    end;
    if v870.subtitle ~= nil and v870.subtitle ~= "" then
        local v886, v887 = v0.writeTag(v871, v872, 6, v0.wireTypes.lengthDelimited);
        v886, v887 = v0.writeString(v886, v887, v870.subtitle);
        v871 = v886;
        v872 = v887;
    end;
    if v870.info_text ~= nil and v870.info_text ~= "" then
        local v888, v889 = v0.writeTag(v871, v872, 7, v0.wireTypes.lengthDelimited);
        v888, v889 = v0.writeString(v888, v889, v870.info_text);
        v871 = v888;
        v872 = v889;
    end;
    if v870.subtitle_link_path ~= nil and v870.subtitle_link_path ~= "" then
        local v890, v891 = v0.writeTag(v871, v872, 8, v0.wireTypes.lengthDelimited);
        v890, v891 = v0.writeString(v890, v891, v870.subtitle_link_path);
        v871 = v890;
        v872 = v891;
    end;
    local v892 = buffer.create(v872);
    buffer.copy(v892, 0, v871, 0, v872);
    return v892;
end;
v4.decode = function(v893) --[[ Line: 7494 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_29 (copy), v0 (copy), v2 (copy)
    local v894 = l_v4_29.new();
    local v895 = 0;
    while v895 < buffer.len(v893) do
        local v896 = nil;
        local v897 = nil;
        local v898, v899, v900 = v0.readTag(v893, v895);
        v896 = v898;
        v897 = v899;
        v895 = v900;
        if v897 == v0.wireTypes.varint then
            if v896 == 5 then
                v898 = nil;
                v899, v900 = v0.readVarIntI32(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.secondary_sort_id = v898;
            else
                v898 = nil;
                v899, v900 = v0.readVarInt(v893, v895);
                v898 = v899;
                v895 = v900;
            end;
        elseif v897 == v0.wireTypes.lengthDelimited then
            if v896 == 1 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.title = buffer.tostring(v898);
            elseif v896 == 2 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                table.insert(v894.song_items, v2.SongCarouselInputData_SongItem.decode(v898));
            elseif v896 == 3 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.next_page_token = buffer.tostring(v898);
            elseif v896 == 4 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.sort_id = buffer.tostring(v898);
            elseif v896 == 6 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.subtitle = buffer.tostring(v898);
            elseif v896 == 7 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.info_text = buffer.tostring(v898);
            elseif v896 == 8 then
                v898 = nil;
                v899, v900 = v0.readBuffer(v893, v895);
                v898 = v899;
                v895 = v900;
                v894.subtitle_link_path = buffer.tostring(v898);
            else
                v898 = nil;
                v899, v900 = v0.readVarInt(v893, v895);
                v895 = v900 + v899;
            end;
        elseif v897 == v0.wireTypes.i32 then
            v898 = nil;
            v899, v900 = v0.readFixed32(v893, v895);
            v898 = v899;
            v895 = v900;
        elseif v897 == v0.wireTypes.i64 then
            v898 = nil;
            v899, v900 = v0.readFixed64(v893, v895);
            v898 = v899;
            v895 = v900;
        else
            error("Unsupported wire type: " .. v897);
        end;
    end;
    return v894;
end;
v4.jsonEncode = function(v901) --[[ Line: 7572 ]] --[[ Name: jsonEncode ]]
    local v902 = {};
    if v901.title ~= nil and v901.title ~= "" then
        v902.title = v901.title;
    end;
    if v901.song_items ~= nil and #v901.song_items > 0 then
        local v903 = {};
        for _, v905 in v901.song_items do
            table.insert(v903, v905:jsonEncode());
        end;
        v902.songItems = v903;
    end;
    if v901.next_page_token ~= nil and v901.next_page_token ~= "" then
        v902.nextPageToken = v901.next_page_token;
    end;
    if v901.sort_id ~= nil and v901.sort_id ~= "" then
        v902.sortId = v901.sort_id;
    end;
    if v901.secondary_sort_id ~= nil and v901.secondary_sort_id ~= 0 then
        v902.secondarySortId = v901.secondary_sort_id;
    end;
    if v901.subtitle ~= nil and v901.subtitle ~= "" then
        v902.subtitle = v901.subtitle;
    end;
    if v901.info_text ~= nil and v901.info_text ~= "" then
        v902.infoText = v901.info_text;
    end;
    if v901.subtitle_link_path ~= nil and v901.subtitle_link_path ~= "" then
        v902.subtitleLinkPath = v901.subtitle_link_path;
    end;
    return v902;
end;
v4.jsonDecode = function(v906) --[[ Line: 7614 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_29 (copy), v2 (copy)
    local v907 = l_v4_29.new();
    if v906.title ~= nil then
        v907.title = v906.title;
    end;
    if v906.song_items ~= nil then
        local v908 = {};
        for _, v910 in v906.song_items do
            table.insert(v908, v2.SongCarouselInputData_SongItem.jsonDecode(v910));
        end;
        v907.song_items = v908;
    end;
    if v906.songItems ~= nil then
        local v911 = {};
        for _, v913 in v906.songItems do
            table.insert(v911, v2.SongCarouselInputData_SongItem.jsonDecode(v913));
        end;
        v907.song_items = v911;
    end;
    if v906.next_page_token ~= nil then
        v907.next_page_token = v906.next_page_token;
    end;
    if v906.nextPageToken ~= nil then
        v907.next_page_token = v906.nextPageToken;
    end;
    if v906.sort_id ~= nil then
        v907.sort_id = v906.sort_id;
    end;
    if v906.sortId ~= nil then
        v907.sort_id = v906.sortId;
    end;
    if v906.secondary_sort_id ~= nil then
        v907.secondary_sort_id = v906.secondary_sort_id;
    end;
    if v906.secondarySortId ~= nil then
        v907.secondary_sort_id = v906.secondarySortId;
    end;
    if v906.subtitle ~= nil then
        v907.subtitle = v906.subtitle;
    end;
    if v906.info_text ~= nil then
        v907.info_text = v906.info_text;
    end;
    if v906.infoText ~= nil then
        v907.info_text = v906.infoText;
    end;
    if v906.subtitle_link_path ~= nil then
        v907.subtitle_link_path = v906.subtitle_link_path;
    end;
    if v906.subtitleLinkPath ~= nil then
        v907.subtitle_link_path = v906.subtitleLinkPath;
    end;
    return v907;
end;
v4.descriptor = {
    name = "SongCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
};
v2.SongCarouselInputData = v4;
v1.default:register(v2.SongCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_30 = v4 --[[ copy: 4 -> 35 ]];
v4.new = function(v915) --[[ Line: 7700 ]] --[[ Name: new ]]
    -- upvalues: l_v4_30 (copy)
    return (setmetatable({
        song_id = (not (v915 ~= nil) or v915.song_id == nil) and "" or v915.song_id
    }, l_v4_30));
end;
v4.encode = function(v916) --[[ Line: 7708 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v917 = buffer.create(0);
    local v918 = 0;
    if v916.song_id ~= nil and v916.song_id ~= "" then
        local v919, v920 = v0.writeTag(v917, v918, 1, v0.wireTypes.lengthDelimited);
        v919, v920 = v0.writeString(v919, v920, v916.song_id);
        v917 = v919;
        v918 = v920;
    end;
    local v921 = buffer.create(v918);
    buffer.copy(v921, 0, v917, 0, v918);
    return v921;
end;
v4.decode = function(v922) --[[ Line: 7722 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_30 (copy), v0 (copy)
    local v923 = l_v4_30.new();
    local v924 = 0;
    while v924 < buffer.len(v922) do
        local v925 = nil;
        local v926 = nil;
        local v927, v928, v929 = v0.readTag(v922, v924);
        v925 = v927;
        v926 = v928;
        v924 = v929;
        if v926 == v0.wireTypes.varint then
            v927 = nil;
            v928, v929 = v0.readVarInt(v922, v924);
            v927 = v928;
            v924 = v929;
        elseif v926 == v0.wireTypes.lengthDelimited then
            if v925 == 1 then
                v927 = nil;
                v928, v929 = v0.readBuffer(v922, v924);
                v927 = v928;
                v924 = v929;
                v923.song_id = buffer.tostring(v927);
            else
                v927 = nil;
                v928, v929 = v0.readVarInt(v922, v924);
                v924 = v929 + v928;
            end;
        elseif v926 == v0.wireTypes.i32 then
            v927 = nil;
            v928, v929 = v0.readFixed32(v922, v924);
            v927 = v928;
            v924 = v929;
        elseif v926 == v0.wireTypes.i64 then
            v927 = nil;
            v928, v929 = v0.readFixed64(v922, v924);
            v927 = v928;
            v924 = v929;
        else
            error("Unsupported wire type: " .. v926);
        end;
    end;
    return v923;
end;
v4.jsonEncode = function(v930) --[[ Line: 7765 ]] --[[ Name: jsonEncode ]]
    local v931 = {};
    if v930.song_id ~= nil and v930.song_id ~= "" then
        v931.songId = v930.song_id;
    end;
    return v931;
end;
v4.jsonDecode = function(v932) --[[ Line: 7775 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_30 (copy)
    local v933 = l_v4_30.new();
    if v932.song_id ~= nil then
        v933.song_id = v932.song_id;
    end;
    if v932.songId ~= nil then
        v933.song_id = v932.songId;
    end;
    return v933;
end;
v4.descriptor = {
    name = "SongCarouselInputData_SongItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
};
v2.SongCarouselInputData_SongItem = v4;
v1.default:register(v2.SongCarouselInputData_SongItem);
v4 = {};
v4.__index = v4;
local l_v4_31 = v4 --[[ copy: 4 -> 36 ]];
v4.new = function(v935) --[[ Line: 7803 ]] --[[ Name: new ]]
    -- upvalues: l_v4_31 (copy)
    return (setmetatable({
        title = (not (v935 ~= nil) or v935.title == nil) and "" or v935.title, 
        event_items = if not (v935 ~= nil) or v935.event_items == nil then {} else v935.event_items
    }, l_v4_31));
end;
v4.encode = function(v936) --[[ Line: 7810 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v937 = buffer.create(0);
    local v938 = 0;
    if v936.title ~= nil and v936.title ~= "" then
        local v939, v940 = v0.writeTag(v937, v938, 1, v0.wireTypes.lengthDelimited);
        v939, v940 = v0.writeString(v939, v940, v936.title);
        v937 = v939;
        v938 = v940;
    end;
    if v936.event_items ~= nil and #v936.event_items > 0 then
        for _, v942 in v936.event_items do
            local v943 = v942:encode();
            local v944, v945 = v0.writeTag(v937, v938, 2, v0.wireTypes.lengthDelimited);
            v944, v945 = v0.writeBuffer(v944, v945, v943, buffer.len(v943));
            v937 = v944;
            v938 = v945;
        end;
    end;
    local v946 = buffer.create(v938);
    buffer.copy(v946, 0, v937, 0, v938);
    return v946;
end;
v4.decode = function(v947) --[[ Line: 7832 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_31 (copy), v0 (copy), v2 (copy)
    local v948 = l_v4_31.new();
    local v949 = 0;
    while v949 < buffer.len(v947) do
        local v950 = nil;
        local v951 = nil;
        local v952, v953, v954 = v0.readTag(v947, v949);
        v950 = v952;
        v951 = v953;
        v949 = v954;
        if v951 == v0.wireTypes.varint then
            v952 = nil;
            v953, v954 = v0.readVarInt(v947, v949);
            v952 = v953;
            v949 = v954;
        elseif v951 == v0.wireTypes.lengthDelimited then
            if v950 == 1 then
                v952 = nil;
                v953, v954 = v0.readBuffer(v947, v949);
                v952 = v953;
                v949 = v954;
                v948.title = buffer.tostring(v952);
            elseif v950 == 2 then
                v952 = nil;
                v953, v954 = v0.readBuffer(v947, v949);
                v952 = v953;
                v949 = v954;
                table.insert(v948.event_items, v2.EventsCarouselInputData_EventItem.decode(v952));
            else
                v952 = nil;
                v953, v954 = v0.readVarInt(v947, v949);
                v949 = v954 + v953;
            end;
        elseif v951 == v0.wireTypes.i32 then
            v952 = nil;
            v953, v954 = v0.readFixed32(v947, v949);
            v952 = v953;
            v949 = v954;
        elseif v951 == v0.wireTypes.i64 then
            v952 = nil;
            v953, v954 = v0.readFixed64(v947, v949);
            v952 = v953;
            v949 = v954;
        else
            error("Unsupported wire type: " .. v951);
        end;
    end;
    return v948;
end;
v4.jsonEncode = function(v955) --[[ Line: 7880 ]] --[[ Name: jsonEncode ]]
    local v956 = {};
    if v955.title ~= nil and v955.title ~= "" then
        v956.title = v955.title;
    end;
    if v955.event_items ~= nil and #v955.event_items > 0 then
        local v957 = {};
        for _, v959 in v955.event_items do
            table.insert(v957, v959:jsonEncode());
        end;
        v956.eventItems = v957;
    end;
    return v956;
end;
v4.jsonDecode = function(v960) --[[ Line: 7898 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_31 (copy), v2 (copy)
    local v961 = l_v4_31.new();
    if v960.title ~= nil then
        v961.title = v960.title;
    end;
    if v960.event_items ~= nil then
        local v962 = {};
        for _, v964 in v960.event_items do
            table.insert(v962, v2.EventsCarouselInputData_EventItem.jsonDecode(v964));
        end;
        v961.event_items = v962;
    end;
    if v960.eventItems ~= nil then
        local v965 = {};
        for _, v967 in v960.eventItems do
            table.insert(v965, v2.EventsCarouselInputData_EventItem.jsonDecode(v967));
        end;
        v961.event_items = v965;
    end;
    return v961;
end;
v4.descriptor = {
    name = "EventsCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
};
v2.EventsCarouselInputData = v4;
v1.default:register(v2.EventsCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_32 = v4 --[[ copy: 4 -> 37 ]];
v4.new = function(v969) --[[ Line: 7940 ]] --[[ Name: new ]]
    -- upvalues: l_v4_32 (copy)
    return (setmetatable({
        event_id = (not (v969 ~= nil) or v969.event_id == nil) and "" or v969.event_id
    }, l_v4_32));
end;
v4.encode = function(v970) --[[ Line: 7948 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v971 = buffer.create(0);
    local v972 = 0;
    if v970.event_id ~= nil and v970.event_id ~= "" then
        local v973, v974 = v0.writeTag(v971, v972, 1, v0.wireTypes.lengthDelimited);
        v973, v974 = v0.writeString(v973, v974, v970.event_id);
        v971 = v973;
        v972 = v974;
    end;
    local v975 = buffer.create(v972);
    buffer.copy(v975, 0, v971, 0, v972);
    return v975;
end;
v4.decode = function(v976) --[[ Line: 7962 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_32 (copy), v0 (copy)
    local v977 = l_v4_32.new();
    local v978 = 0;
    while v978 < buffer.len(v976) do
        local v979 = nil;
        local v980 = nil;
        local v981, v982, v983 = v0.readTag(v976, v978);
        v979 = v981;
        v980 = v982;
        v978 = v983;
        if v980 == v0.wireTypes.varint then
            v981 = nil;
            v982, v983 = v0.readVarInt(v976, v978);
            v981 = v982;
            v978 = v983;
        elseif v980 == v0.wireTypes.lengthDelimited then
            if v979 == 1 then
                v981 = nil;
                v982, v983 = v0.readBuffer(v976, v978);
                v981 = v982;
                v978 = v983;
                v977.event_id = buffer.tostring(v981);
            else
                v981 = nil;
                v982, v983 = v0.readVarInt(v976, v978);
                v978 = v983 + v982;
            end;
        elseif v980 == v0.wireTypes.i32 then
            v981 = nil;
            v982, v983 = v0.readFixed32(v976, v978);
            v981 = v982;
            v978 = v983;
        elseif v980 == v0.wireTypes.i64 then
            v981 = nil;
            v982, v983 = v0.readFixed64(v976, v978);
            v981 = v982;
            v978 = v983;
        else
            error("Unsupported wire type: " .. v980);
        end;
    end;
    return v977;
end;
v4.jsonEncode = function(v984) --[[ Line: 8005 ]] --[[ Name: jsonEncode ]]
    local v985 = {};
    if v984.event_id ~= nil and v984.event_id ~= "" then
        v985.eventId = v984.event_id;
    end;
    return v985;
end;
v4.jsonDecode = function(v986) --[[ Line: 8015 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_32 (copy)
    local v987 = l_v4_32.new();
    if v986.event_id ~= nil then
        v987.event_id = v986.event_id;
    end;
    if v986.eventId ~= nil then
        v987.event_id = v986.eventId;
    end;
    return v987;
end;
v4.descriptor = {
    name = "EventsCarouselInputData_EventItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
};
v2.EventsCarouselInputData_EventItem = v4;
v1.default:register(v2.EventsCarouselInputData_EventItem);
v4 = {};
v4.__index = v4;
local l_v4_33 = v4 --[[ copy: 4 -> 38 ]];
v4.new = function(v989) --[[ Line: 8045 ]] --[[ Name: new ]]
    -- upvalues: l_v4_33 (copy)
    return (setmetatable({
        universe_id = (not (v989 ~= nil) or v989.universe_id == nil) and "" or v989.universe_id, 
        entry_map = if not (v989 ~= nil) or v989.entry_map == nil then {} else v989.entry_map
    }, l_v4_33));
end;
v4.encode = function(v990) --[[ Line: 8052 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v991 = buffer.create(0);
    local v992 = 0;
    if v990.universe_id ~= nil and v990.universe_id ~= "" then
        local v993, v994 = v0.writeTag(v991, v992, 1, v0.wireTypes.lengthDelimited);
        v993, v994 = v0.writeString(v993, v994, v990.universe_id);
        v991 = v993;
        v992 = v994;
    end;
    if v990.entry_map ~= nil and next(v990.entry_map) ~= nil then
        for v995, v996 in v990.entry_map do
            local v997 = buffer.create(0);
            local v998, v999 = v0.writeTag(v997, 0, 1, v0.wireTypes.lengthDelimited);
            v998, v999 = v0.writeString(v998, v999, v995);
            v997 = v998;
            local l_v999_0 = v999;
            v998 = v996:encode();
            local v1001;
            v999, v1001 = v0.writeTag(v997, l_v999_0, 2, v0.wireTypes.lengthDelimited);
            v999, v1001 = v0.writeBuffer(v999, v1001, v998, buffer.len(v998));
            v997 = v999;
            l_v999_0 = v1001;
            v999, v1001 = v0.writeTag(v991, v992, 2, v0.wireTypes.lengthDelimited);
            v999, v1001 = v0.writeBuffer(v999, v1001, v997, l_v999_0);
            v991 = v999;
            v992 = v1001;
        end;
    end;
    local v1002 = buffer.create(v992);
    buffer.copy(v1002, 0, v991, 0, v992);
    return v1002;
end;
v4.decode = function(v1003) --[[ Line: 8080 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_33 (copy), v0 (copy), v2 (copy)
    local v1004 = l_v4_33.new();
    local v1005 = 0;
    while v1005 < buffer.len(v1003) do
        local v1006 = nil;
        local v1007 = nil;
        local v1008, v1009, v1010 = v0.readTag(v1003, v1005);
        v1006 = v1008;
        v1007 = v1009;
        v1005 = v1010;
        if v1007 == v0.wireTypes.varint then
            v1008 = nil;
            v1009, v1010 = v0.readVarInt(v1003, v1005);
            v1008 = v1009;
            v1005 = v1010;
        elseif v1007 == v0.wireTypes.lengthDelimited then
            if v1006 == 1 then
                v1008 = nil;
                v1009, v1010 = v0.readBuffer(v1003, v1005);
                v1008 = v1009;
                v1005 = v1010;
                v1004.universe_id = buffer.tostring(v1008);
            elseif v1006 == 2 then
                v1008 = nil;
                v1009, v1010 = v0.readBuffer(v1003, v1005);
                v1008 = v1009;
                v1005 = v1010;
                v1009 = v2.DevStoreFeedInputData_EntryMapEntry.decode(v1008);
                v1010 = v2.FeedEntry.new();
                v1004.entry_map[v1009.key or ""] = v1009.value or v1010;
            else
                v1008 = nil;
                v1009, v1010 = v0.readVarInt(v1003, v1005);
                v1005 = v1010 + v1009;
            end;
        elseif v1007 == v0.wireTypes.i32 then
            v1008 = nil;
            v1009, v1010 = v0.readFixed32(v1003, v1005);
            v1008 = v1009;
            v1005 = v1010;
        elseif v1007 == v0.wireTypes.i64 then
            v1008 = nil;
            v1009, v1010 = v0.readFixed64(v1003, v1005);
            v1008 = v1009;
            v1005 = v1010;
        else
            error("Unsupported wire type: " .. v1007);
        end;
    end;
    return v1004;
end;
v4.jsonEncode = function(v1011) --[[ Line: 8135 ]] --[[ Name: jsonEncode ]]
    local v1012 = {};
    if v1011.universe_id ~= nil and v1011.universe_id ~= "" then
        v1012.universeId = v1011.universe_id;
    end;
    if v1011.entry_map ~= nil and next(v1011.entry_map) ~= nil then
        local v1013 = {};
        for v1014, v1015 in v1011.entry_map do
            v1013[v1014] = v1015:jsonEncode();
        end;
        v1012.entryMap = v1013;
    end;
    return v1012;
end;
v4.jsonDecode = function(v1016) --[[ Line: 8153 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_33 (copy), v2 (copy)
    local v1017 = l_v4_33.new();
    if v1016.universe_id ~= nil then
        v1017.universe_id = v1016.universe_id;
    end;
    if v1016.universeId ~= nil then
        v1017.universe_id = v1016.universeId;
    end;
    if v1016.entry_map ~= nil then
        local v1018 = {};
        for v1019, v1020 in v1016.entry_map do
            v1018[v1019] = v2.FeedEntry.jsonDecode(v1020);
        end;
        v1017.entry_map = v1018;
    end;
    if v1016.entryMap ~= nil then
        local v1021 = {};
        for v1022, v1023 in v1016.entryMap do
            v1021[v1022] = v2.FeedEntry.jsonDecode(v1023);
        end;
        v1017.entry_map = v1021;
    end;
    return v1017;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
};
v2.DevStoreFeedInputData = v4;
v1.default:register(v2.DevStoreFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_34 = v4 --[[ copy: 4 -> 39 ]];
v4.new = function(v1025) --[[ Line: 8199 ]] --[[ Name: new ]]
    -- upvalues: l_v4_34 (copy)
    return (setmetatable({
        key = (not (v1025 ~= nil) or v1025.key == nil) and "" or v1025.key, 
        value = if not (v1025 ~= nil) or v1025.value == nil then nil else v1025.value
    }, l_v4_34));
end;
v4.encode = function(v1026) --[[ Line: 8208 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1027 = buffer.create(0);
    local v1028 = 0;
    if v1026.key ~= nil and v1026.key ~= "" then
        local v1029, v1030 = v0.writeTag(v1027, v1028, 1, v0.wireTypes.lengthDelimited);
        v1029, v1030 = v0.writeString(v1029, v1030, v1026.key);
        v1027 = v1029;
        v1028 = v1030;
    end;
    if v1026.value ~= nil then
        local v1031 = v1026.value:encode();
        local v1032, v1033 = v0.writeTag(v1027, v1028, 2, v0.wireTypes.lengthDelimited);
        v1032, v1033 = v0.writeBuffer(v1032, v1033, v1031, buffer.len(v1031));
        v1027 = v1032;
        v1028 = v1033;
    end;
    local v1034 = buffer.create(v1028);
    buffer.copy(v1034, 0, v1027, 0, v1028);
    return v1034;
end;
v4.decode = function(v1035) --[[ Line: 8228 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_34 (copy), v0 (copy), v2 (copy)
    local v1036 = l_v4_34.new();
    local v1037 = 0;
    while v1037 < buffer.len(v1035) do
        local v1038 = nil;
        local v1039 = nil;
        local v1040, v1041, v1042 = v0.readTag(v1035, v1037);
        v1038 = v1040;
        v1039 = v1041;
        v1037 = v1042;
        if v1039 == v0.wireTypes.varint then
            v1040 = nil;
            v1041, v1042 = v0.readVarInt(v1035, v1037);
            v1040 = v1041;
            v1037 = v1042;
        elseif v1039 == v0.wireTypes.lengthDelimited then
            if v1038 == 1 then
                v1040 = nil;
                v1041, v1042 = v0.readBuffer(v1035, v1037);
                v1040 = v1041;
                v1037 = v1042;
                v1036.key = buffer.tostring(v1040);
            elseif v1038 == 2 then
                v1040 = nil;
                v1041, v1042 = v0.readBuffer(v1035, v1037);
                v1040 = v1041;
                v1037 = v1042;
                v1036.value = v2.FeedEntry.decode(v1040);
            else
                v1040 = nil;
                v1041, v1042 = v0.readVarInt(v1035, v1037);
                v1037 = v1042 + v1041;
            end;
        elseif v1039 == v0.wireTypes.i32 then
            v1040 = nil;
            v1041, v1042 = v0.readFixed32(v1035, v1037);
            v1040 = v1041;
            v1037 = v1042;
        elseif v1039 == v0.wireTypes.i64 then
            v1040 = nil;
            v1041, v1042 = v0.readFixed64(v1035, v1037);
            v1040 = v1041;
            v1037 = v1042;
        else
            error("Unsupported wire type: " .. v1039);
        end;
    end;
    return v1036;
end;
v4.jsonEncode = function(v1043) --[[ Line: 8276 ]] --[[ Name: jsonEncode ]]
    local v1044 = {};
    if v1043.key ~= nil and v1043.key ~= "" then
        v1044.key = v1043.key;
    end;
    if v1043.value ~= nil then
        v1044.value = v1043.value:jsonEncode();
    end;
    return v1044;
end;
v4.jsonDecode = function(v1045) --[[ Line: 8290 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_34 (copy), v2 (copy)
    local v1046 = l_v4_34.new();
    if v1045.key ~= nil then
        v1046.key = v1045.key;
    end;
    if v1045.value ~= nil then
        v1046.value = v2.FeedEntry.jsonDecode(v1045.value);
    end;
    return v1046;
end;
v4.descriptor = {
    name = "DevStoreFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.DevStoreFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.DevStoreFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_35 = v4 --[[ copy: 4 -> 40 ]];
v4.new = function(v1048) --[[ Line: 8320 ]] --[[ Name: new ]]
    -- upvalues: l_v4_35 (copy)
    return (setmetatable({
        game_passes = if not (v1048 ~= nil) or v1048.game_passes == nil then {} else v1048.game_passes
    }, l_v4_35));
end;
v4.encode = function(v1049) --[[ Line: 8328 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1050 = buffer.create(0);
    local v1051 = 0;
    if v1049.game_passes ~= nil and #v1049.game_passes > 0 then
        for _, v1053 in v1049.game_passes do
            local v1054 = v1053:encode();
            local v1055, v1056 = v0.writeTag(v1050, v1051, 1, v0.wireTypes.lengthDelimited);
            v1055, v1056 = v0.writeBuffer(v1055, v1056, v1054, buffer.len(v1054));
            v1050 = v1055;
            v1051 = v1056;
        end;
    end;
    local v1057 = buffer.create(v1051);
    buffer.copy(v1057, 0, v1050, 0, v1051);
    return v1057;
end;
v4.decode = function(v1058) --[[ Line: 8345 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_35 (copy), v0 (copy), v2 (copy)
    local v1059 = l_v4_35.new();
    local v1060 = 0;
    while v1060 < buffer.len(v1058) do
        local v1061 = nil;
        local v1062 = nil;
        local v1063, v1064, v1065 = v0.readTag(v1058, v1060);
        v1061 = v1063;
        v1062 = v1064;
        v1060 = v1065;
        if v1062 == v0.wireTypes.varint then
            v1063 = nil;
            v1064, v1065 = v0.readVarInt(v1058, v1060);
            v1063 = v1064;
            v1060 = v1065;
        elseif v1062 == v0.wireTypes.lengthDelimited then
            if v1061 == 1 then
                v1063 = nil;
                v1064, v1065 = v0.readBuffer(v1058, v1060);
                v1063 = v1064;
                v1060 = v1065;
                table.insert(v1059.game_passes, v2.GamePassCollectionInputData_GamePassItem.decode(v1063));
            else
                v1063 = nil;
                v1064, v1065 = v0.readVarInt(v1058, v1060);
                v1060 = v1065 + v1064;
            end;
        elseif v1062 == v0.wireTypes.i32 then
            v1063 = nil;
            v1064, v1065 = v0.readFixed32(v1058, v1060);
            v1063 = v1064;
            v1060 = v1065;
        elseif v1062 == v0.wireTypes.i64 then
            v1063 = nil;
            v1064, v1065 = v0.readFixed64(v1058, v1060);
            v1063 = v1064;
            v1060 = v1065;
        else
            error("Unsupported wire type: " .. v1062);
        end;
    end;
    return v1059;
end;
v4.jsonEncode = function(v1066) --[[ Line: 8388 ]] --[[ Name: jsonEncode ]]
    local v1067 = {};
    if v1066.game_passes ~= nil and #v1066.game_passes > 0 then
        local v1068 = {};
        for _, v1070 in v1066.game_passes do
            table.insert(v1068, v1070:jsonEncode());
        end;
        v1067.gamePasses = v1068;
    end;
    return v1067;
end;
v4.jsonDecode = function(v1071) --[[ Line: 8402 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_35 (copy), v2 (copy)
    local v1072 = l_v4_35.new();
    if v1071.game_passes ~= nil then
        local v1073 = {};
        for _, v1075 in v1071.game_passes do
            table.insert(v1073, v2.GamePassCollectionInputData_GamePassItem.jsonDecode(v1075));
        end;
        v1072.game_passes = v1073;
    end;
    if v1071.gamePasses ~= nil then
        local v1076 = {};
        for _, v1078 in v1071.gamePasses do
            table.insert(v1076, v2.GamePassCollectionInputData_GamePassItem.jsonDecode(v1078));
        end;
        v1072.game_passes = v1076;
    end;
    return v1072;
end;
v4.descriptor = {
    name = "GamePassCollectionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
};
v2.GamePassCollectionInputData = v4;
v1.default:register(v2.GamePassCollectionInputData);
v4 = {};
v4.__index = v4;
local l_v4_36 = v4 --[[ copy: 4 -> 41 ]];
v4.new = function(v1080) --[[ Line: 8440 ]] --[[ Name: new ]]
    -- upvalues: l_v4_36 (copy)
    return (setmetatable({
        game_pass_id = (not (v1080 ~= nil) or v1080.game_pass_id == nil) and "" or v1080.game_pass_id
    }, l_v4_36));
end;
v4.encode = function(v1081) --[[ Line: 8448 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1082 = buffer.create(0);
    local v1083 = 0;
    if v1081.game_pass_id ~= nil and v1081.game_pass_id ~= "" then
        local v1084, v1085 = v0.writeTag(v1082, v1083, 1, v0.wireTypes.lengthDelimited);
        v1084, v1085 = v0.writeString(v1084, v1085, v1081.game_pass_id);
        v1082 = v1084;
        v1083 = v1085;
    end;
    local v1086 = buffer.create(v1083);
    buffer.copy(v1086, 0, v1082, 0, v1083);
    return v1086;
end;
v4.decode = function(v1087) --[[ Line: 8464 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_36 (copy), v0 (copy)
    local v1088 = l_v4_36.new();
    local v1089 = 0;
    while v1089 < buffer.len(v1087) do
        local v1090 = nil;
        local v1091 = nil;
        local v1092, v1093, v1094 = v0.readTag(v1087, v1089);
        v1090 = v1092;
        v1091 = v1093;
        v1089 = v1094;
        if v1091 == v0.wireTypes.varint then
            v1092 = nil;
            v1093, v1094 = v0.readVarInt(v1087, v1089);
            v1092 = v1093;
            v1089 = v1094;
        elseif v1091 == v0.wireTypes.lengthDelimited then
            if v1090 == 1 then
                v1092 = nil;
                v1093, v1094 = v0.readBuffer(v1087, v1089);
                v1092 = v1093;
                v1089 = v1094;
                v1088.game_pass_id = buffer.tostring(v1092);
            else
                v1092 = nil;
                v1093, v1094 = v0.readVarInt(v1087, v1089);
                v1089 = v1094 + v1093;
            end;
        elseif v1091 == v0.wireTypes.i32 then
            v1092 = nil;
            v1093, v1094 = v0.readFixed32(v1087, v1089);
            v1092 = v1093;
            v1089 = v1094;
        elseif v1091 == v0.wireTypes.i64 then
            v1092 = nil;
            v1093, v1094 = v0.readFixed64(v1087, v1089);
            v1092 = v1093;
            v1089 = v1094;
        else
            error("Unsupported wire type: " .. v1091);
        end;
    end;
    return v1088;
end;
v4.jsonEncode = function(v1095) --[[ Line: 8509 ]] --[[ Name: jsonEncode ]]
    local v1096 = {};
    if v1095.game_pass_id ~= nil and v1095.game_pass_id ~= "" then
        v1096.gamePassId = v1095.game_pass_id;
    end;
    return v1096;
end;
v4.jsonDecode = function(v1097) --[[ Line: 8521 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_36 (copy)
    local v1098 = l_v4_36.new();
    if v1097.game_pass_id ~= nil then
        v1098.game_pass_id = v1097.game_pass_id;
    end;
    if v1097.gamePassId ~= nil then
        v1098.game_pass_id = v1097.gamePassId;
    end;
    return v1098;
end;
v4.descriptor = {
    name = "GamePassCollectionInputData_GamePassItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
};
v2.GamePassCollectionInputData_GamePassItem = v4;
v1.default:register(v2.GamePassCollectionInputData_GamePassItem);
v4 = {};
v4.__index = v4;
local l_v4_37 = v4 --[[ copy: 4 -> 42 ]];
v4.new = function(v1100) --[[ Line: 8551 ]] --[[ Name: new ]]
    -- upvalues: l_v4_37 (copy)
    return (setmetatable({
        developer_products = if not (v1100 ~= nil) or v1100.developer_products == nil then {} else v1100.developer_products
    }, l_v4_37));
end;
v4.encode = function(v1101) --[[ Line: 8559 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1102 = buffer.create(0);
    local v1103 = 0;
    if v1101.developer_products ~= nil and #v1101.developer_products > 0 then
        for _, v1105 in v1101.developer_products do
            local v1106 = v1105:encode();
            local v1107, v1108 = v0.writeTag(v1102, v1103, 1, v0.wireTypes.lengthDelimited);
            v1107, v1108 = v0.writeBuffer(v1107, v1108, v1106, buffer.len(v1106));
            v1102 = v1107;
            v1103 = v1108;
        end;
    end;
    local v1109 = buffer.create(v1103);
    buffer.copy(v1109, 0, v1102, 0, v1103);
    return v1109;
end;
v4.decode = function(v1110) --[[ Line: 8576 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_37 (copy), v0 (copy), v2 (copy)
    local v1111 = l_v4_37.new();
    local v1112 = 0;
    while v1112 < buffer.len(v1110) do
        local v1113 = nil;
        local v1114 = nil;
        local v1115, v1116, v1117 = v0.readTag(v1110, v1112);
        v1113 = v1115;
        v1114 = v1116;
        v1112 = v1117;
        if v1114 == v0.wireTypes.varint then
            v1115 = nil;
            v1116, v1117 = v0.readVarInt(v1110, v1112);
            v1115 = v1116;
            v1112 = v1117;
        elseif v1114 == v0.wireTypes.lengthDelimited then
            if v1113 == 1 then
                v1115 = nil;
                v1116, v1117 = v0.readBuffer(v1110, v1112);
                v1115 = v1116;
                v1112 = v1117;
                table.insert(v1111.developer_products, v2.DeveloperProductCollectionInputData_DeveloperProductItem.decode(v1115));
            else
                v1115 = nil;
                v1116, v1117 = v0.readVarInt(v1110, v1112);
                v1112 = v1117 + v1116;
            end;
        elseif v1114 == v0.wireTypes.i32 then
            v1115 = nil;
            v1116, v1117 = v0.readFixed32(v1110, v1112);
            v1115 = v1116;
            v1112 = v1117;
        elseif v1114 == v0.wireTypes.i64 then
            v1115 = nil;
            v1116, v1117 = v0.readFixed64(v1110, v1112);
            v1115 = v1116;
            v1112 = v1117;
        else
            error("Unsupported wire type: " .. v1114);
        end;
    end;
    return v1111;
end;
v4.jsonEncode = function(v1118) --[[ Line: 8622 ]] --[[ Name: jsonEncode ]]
    local v1119 = {};
    if v1118.developer_products ~= nil and #v1118.developer_products > 0 then
        local v1120 = {};
        for _, v1122 in v1118.developer_products do
            table.insert(v1120, v1122:jsonEncode());
        end;
        v1119.developerProducts = v1120;
    end;
    return v1119;
end;
v4.jsonDecode = function(v1123) --[[ Line: 8636 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_37 (copy), v2 (copy)
    local v1124 = l_v4_37.new();
    if v1123.developer_products ~= nil then
        local v1125 = {};
        for _, v1127 in v1123.developer_products do
            table.insert(v1125, v2.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v1127));
        end;
        v1124.developer_products = v1125;
    end;
    if v1123.developerProducts ~= nil then
        local v1128 = {};
        for _, v1130 in v1123.developerProducts do
            table.insert(v1128, v2.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v1130));
        end;
        v1124.developer_products = v1128;
    end;
    return v1124;
end;
v4.descriptor = {
    name = "DeveloperProductCollectionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
};
v2.DeveloperProductCollectionInputData = v4;
v1.default:register(v2.DeveloperProductCollectionInputData);
v4 = {};
v4.__index = v4;
local l_v4_38 = v4 --[[ copy: 4 -> 43 ]];
v4.new = function(v1132) --[[ Line: 8683 ]] --[[ Name: new ]]
    -- upvalues: l_v4_38 (copy)
    return (setmetatable({
        developer_product_id = (not (v1132 ~= nil) or v1132.developer_product_id == nil) and "" or v1132.developer_product_id
    }, l_v4_38));
end;
v4.encode = function(v1133) --[[ Line: 8696 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1134 = buffer.create(0);
    local v1135 = 0;
    if v1133.developer_product_id ~= nil and v1133.developer_product_id ~= "" then
        local v1136, v1137 = v0.writeTag(v1134, v1135, 1, v0.wireTypes.lengthDelimited);
        v1136, v1137 = v0.writeString(v1136, v1137, v1133.developer_product_id);
        v1134 = v1136;
        v1135 = v1137;
    end;
    local v1138 = buffer.create(v1135);
    buffer.copy(v1138, 0, v1134, 0, v1135);
    return v1138;
end;
v4.decode = function(v1139) --[[ Line: 8712 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_38 (copy), v0 (copy)
    local v1140 = l_v4_38.new();
    local v1141 = 0;
    while v1141 < buffer.len(v1139) do
        local v1142 = nil;
        local v1143 = nil;
        local v1144, v1145, v1146 = v0.readTag(v1139, v1141);
        v1142 = v1144;
        v1143 = v1145;
        v1141 = v1146;
        if v1143 == v0.wireTypes.varint then
            v1144 = nil;
            v1145, v1146 = v0.readVarInt(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        elseif v1143 == v0.wireTypes.lengthDelimited then
            if v1142 == 1 then
                v1144 = nil;
                v1145, v1146 = v0.readBuffer(v1139, v1141);
                v1144 = v1145;
                v1141 = v1146;
                v1140.developer_product_id = buffer.tostring(v1144);
            else
                v1144 = nil;
                v1145, v1146 = v0.readVarInt(v1139, v1141);
                v1141 = v1146 + v1145;
            end;
        elseif v1143 == v0.wireTypes.i32 then
            v1144 = nil;
            v1145, v1146 = v0.readFixed32(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        elseif v1143 == v0.wireTypes.i64 then
            v1144 = nil;
            v1145, v1146 = v0.readFixed64(v1139, v1141);
            v1144 = v1145;
            v1141 = v1146;
        else
            error("Unsupported wire type: " .. v1143);
        end;
    end;
    return v1140;
end;
v4.jsonEncode = function(v1147) --[[ Line: 8757 ]] --[[ Name: jsonEncode ]]
    local v1148 = {};
    if v1147.developer_product_id ~= nil and v1147.developer_product_id ~= "" then
        v1148.developerProductId = v1147.developer_product_id;
    end;
    return v1148;
end;
v4.jsonDecode = function(v1149) --[[ Line: 8769 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_38 (copy)
    local v1150 = l_v4_38.new();
    if v1149.developer_product_id ~= nil then
        v1150.developer_product_id = v1149.developer_product_id;
    end;
    if v1149.developerProductId ~= nil then
        v1150.developer_product_id = v1149.developerProductId;
    end;
    return v1150;
end;
v4.descriptor = {
    name = "DeveloperProductCollectionInputData_DeveloperProductItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
};
v2.DeveloperProductCollectionInputData_DeveloperProductItem = v4;
v1.default:register(v2.DeveloperProductCollectionInputData_DeveloperProductItem);
v4 = {};
v4.__index = v4;
local l_v4_39 = v4 --[[ copy: 4 -> 44 ]];
v4.new = function(v1152) --[[ Line: 8800 ]] --[[ Name: new ]]
    -- upvalues: l_v4_39 (copy)
    return (setmetatable({
        subscriptions = if not (v1152 ~= nil) or v1152.subscriptions == nil then {} else v1152.subscriptions
    }, l_v4_39));
end;
v4.encode = function(v1153) --[[ Line: 8808 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1154 = buffer.create(0);
    local v1155 = 0;
    if v1153.subscriptions ~= nil and #v1153.subscriptions > 0 then
        for _, v1157 in v1153.subscriptions do
            local v1158 = v1157:encode();
            local v1159, v1160 = v0.writeTag(v1154, v1155, 1, v0.wireTypes.lengthDelimited);
            v1159, v1160 = v0.writeBuffer(v1159, v1160, v1158, buffer.len(v1158));
            v1154 = v1159;
            v1155 = v1160;
        end;
    end;
    local v1161 = buffer.create(v1155);
    buffer.copy(v1161, 0, v1154, 0, v1155);
    return v1161;
end;
v4.decode = function(v1162) --[[ Line: 8825 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_39 (copy), v0 (copy), v2 (copy)
    local v1163 = l_v4_39.new();
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
            if v1165 == 1 then
                v1167 = nil;
                v1168, v1169 = v0.readBuffer(v1162, v1164);
                v1167 = v1168;
                v1164 = v1169;
                table.insert(v1163.subscriptions, v2.SubscriptionCollectionInputData_SubscriptionItem.decode(v1167));
            else
                v1167 = nil;
                v1168, v1169 = v0.readVarInt(v1162, v1164);
                v1164 = v1169 + v1168;
            end;
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
v4.jsonEncode = function(v1170) --[[ Line: 8871 ]] --[[ Name: jsonEncode ]]
    local v1171 = {};
    if v1170.subscriptions ~= nil and #v1170.subscriptions > 0 then
        local v1172 = {};
        for _, v1174 in v1170.subscriptions do
            table.insert(v1172, v1174:jsonEncode());
        end;
        v1171.subscriptions = v1172;
    end;
    return v1171;
end;
v4.jsonDecode = function(v1175) --[[ Line: 8885 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_39 (copy), v2 (copy)
    local v1176 = l_v4_39.new();
    if v1175.subscriptions ~= nil then
        local v1177 = {};
        for _, v1179 in v1175.subscriptions do
            table.insert(v1177, v2.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v1179));
        end;
        v1176.subscriptions = v1177;
    end;
    return v1176;
end;
v4.descriptor = {
    name = "SubscriptionCollectionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
};
v2.SubscriptionCollectionInputData = v4;
v1.default:register(v2.SubscriptionCollectionInputData);
v4 = {};
v4.__index = v4;
local l_v4_40 = v4 --[[ copy: 4 -> 45 ]];
v4.new = function(v1181) --[[ Line: 8915 ]] --[[ Name: new ]]
    -- upvalues: l_v4_40 (copy)
    return (setmetatable({
        subscription_id = (not (v1181 ~= nil) or v1181.subscription_id == nil) and "" or v1181.subscription_id
    }, l_v4_40));
end;
v4.encode = function(v1182) --[[ Line: 8926 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1183 = buffer.create(0);
    local v1184 = 0;
    if v1182.subscription_id ~= nil and v1182.subscription_id ~= "" then
        local v1185, v1186 = v0.writeTag(v1183, v1184, 1, v0.wireTypes.lengthDelimited);
        v1185, v1186 = v0.writeString(v1185, v1186, v1182.subscription_id);
        v1183 = v1185;
        v1184 = v1186;
    end;
    local v1187 = buffer.create(v1184);
    buffer.copy(v1187, 0, v1183, 0, v1184);
    return v1187;
end;
v4.decode = function(v1188) --[[ Line: 8942 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_40 (copy), v0 (copy)
    local v1189 = l_v4_40.new();
    local v1190 = 0;
    while v1190 < buffer.len(v1188) do
        local v1191 = nil;
        local v1192 = nil;
        local v1193, v1194, v1195 = v0.readTag(v1188, v1190);
        v1191 = v1193;
        v1192 = v1194;
        v1190 = v1195;
        if v1192 == v0.wireTypes.varint then
            v1193 = nil;
            v1194, v1195 = v0.readVarInt(v1188, v1190);
            v1193 = v1194;
            v1190 = v1195;
        elseif v1192 == v0.wireTypes.lengthDelimited then
            if v1191 == 1 then
                v1193 = nil;
                v1194, v1195 = v0.readBuffer(v1188, v1190);
                v1193 = v1194;
                v1190 = v1195;
                v1189.subscription_id = buffer.tostring(v1193);
            else
                v1193 = nil;
                v1194, v1195 = v0.readVarInt(v1188, v1190);
                v1190 = v1195 + v1194;
            end;
        elseif v1192 == v0.wireTypes.i32 then
            v1193 = nil;
            v1194, v1195 = v0.readFixed32(v1188, v1190);
            v1193 = v1194;
            v1190 = v1195;
        elseif v1192 == v0.wireTypes.i64 then
            v1193 = nil;
            v1194, v1195 = v0.readFixed64(v1188, v1190);
            v1193 = v1194;
            v1190 = v1195;
        else
            error("Unsupported wire type: " .. v1192);
        end;
    end;
    return v1189;
end;
v4.jsonEncode = function(v1196) --[[ Line: 8987 ]] --[[ Name: jsonEncode ]]
    local v1197 = {};
    if v1196.subscription_id ~= nil and v1196.subscription_id ~= "" then
        v1197.subscriptionId = v1196.subscription_id;
    end;
    return v1197;
end;
v4.jsonDecode = function(v1198) --[[ Line: 8999 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_40 (copy)
    local v1199 = l_v4_40.new();
    if v1198.subscription_id ~= nil then
        v1199.subscription_id = v1198.subscription_id;
    end;
    if v1198.subscriptionId ~= nil then
        v1199.subscription_id = v1198.subscriptionId;
    end;
    return v1199;
end;
v4.descriptor = {
    name = "SubscriptionCollectionInputData_SubscriptionItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
};
v2.SubscriptionCollectionInputData_SubscriptionItem = v4;
v1.default:register(v2.SubscriptionCollectionInputData_SubscriptionItem);
v4 = {};
v4.__index = v4;
local l_v4_41 = v4 --[[ copy: 4 -> 46 ]];
v4.new = function(v1201) --[[ Line: 9030 ]] --[[ Name: new ]]
    -- upvalues: l_v4_41 (copy)
    return (setmetatable({
        roblox_component = (not (v1201 ~= nil) or v1201.roblox_component == nil) and "" or v1201.roblox_component, 
        identifier = (not (v1201 ~= nil) or v1201.identifier == nil) and "" or v1201.identifier, 
        title = (not (v1201 ~= nil) or v1201.title == nil) and "" or v1201.title, 
        user_id = (not (v1201 ~= nil) or v1201.user_id == nil) and "" or v1201.user_id, 
        description = (not (v1201 ~= nil) or v1201.description == nil) and "" or v1201.description, 
        cta_text = (not (v1201 ~= nil) or v1201.cta_text == nil) and "" or v1201.cta_text, 
        prompt_id = (not (v1201 ~= nil) or v1201.prompt_id == nil) and "" or v1201.prompt_id, 
        prompt_type = (not (v1201 ~= nil) or v1201.prompt_type == nil) and "" or v1201.prompt_type
    }, l_v4_41));
end;
v4.encode = function(v1202) --[[ Line: 9045 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1203 = buffer.create(0);
    local v1204 = 0;
    if v1202.roblox_component ~= nil and v1202.roblox_component ~= "" then
        local v1205, v1206 = v0.writeTag(v1203, v1204, 1, v0.wireTypes.lengthDelimited);
        v1205, v1206 = v0.writeString(v1205, v1206, v1202.roblox_component);
        v1203 = v1205;
        v1204 = v1206;
    end;
    if v1202.identifier ~= nil and v1202.identifier ~= "" then
        local v1207, v1208 = v0.writeTag(v1203, v1204, 2, v0.wireTypes.lengthDelimited);
        v1207, v1208 = v0.writeString(v1207, v1208, v1202.identifier);
        v1203 = v1207;
        v1204 = v1208;
    end;
    if v1202.title ~= nil and v1202.title ~= "" then
        local v1209, v1210 = v0.writeTag(v1203, v1204, 3, v0.wireTypes.lengthDelimited);
        v1209, v1210 = v0.writeString(v1209, v1210, v1202.title);
        v1203 = v1209;
        v1204 = v1210;
    end;
    if v1202.user_id ~= nil and v1202.user_id ~= "" then
        local v1211, v1212 = v0.writeTag(v1203, v1204, 4, v0.wireTypes.lengthDelimited);
        v1211, v1212 = v0.writeString(v1211, v1212, v1202.user_id);
        v1203 = v1211;
        v1204 = v1212;
    end;
    if v1202.description ~= nil and v1202.description ~= "" then
        local v1213, v1214 = v0.writeTag(v1203, v1204, 5, v0.wireTypes.lengthDelimited);
        v1213, v1214 = v0.writeString(v1213, v1214, v1202.description);
        v1203 = v1213;
        v1204 = v1214;
    end;
    if v1202.cta_text ~= nil and v1202.cta_text ~= "" then
        local v1215, v1216 = v0.writeTag(v1203, v1204, 6, v0.wireTypes.lengthDelimited);
        v1215, v1216 = v0.writeString(v1215, v1216, v1202.cta_text);
        v1203 = v1215;
        v1204 = v1216;
    end;
    if v1202.prompt_id ~= nil and v1202.prompt_id ~= "" then
        local v1217, v1218 = v0.writeTag(v1203, v1204, 7, v0.wireTypes.lengthDelimited);
        v1217, v1218 = v0.writeString(v1217, v1218, v1202.prompt_id);
        v1203 = v1217;
        v1204 = v1218;
    end;
    if v1202.prompt_type ~= nil and v1202.prompt_type ~= "" then
        local v1219, v1220 = v0.writeTag(v1203, v1204, 8, v0.wireTypes.lengthDelimited);
        v1219, v1220 = v0.writeString(v1219, v1220, v1202.prompt_type);
        v1203 = v1219;
        v1204 = v1220;
    end;
    local v1221 = buffer.create(v1204);
    buffer.copy(v1221, 0, v1203, 0, v1204);
    return v1221;
end;
v4.decode = function(v1222) --[[ Line: 9094 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_41 (copy), v0 (copy)
    local v1223 = l_v4_41.new();
    local v1224 = 0;
    while v1224 < buffer.len(v1222) do
        local v1225 = nil;
        local v1226 = nil;
        local v1227, v1228, v1229 = v0.readTag(v1222, v1224);
        v1225 = v1227;
        v1226 = v1228;
        v1224 = v1229;
        if v1226 == v0.wireTypes.varint then
            v1227 = nil;
            v1228, v1229 = v0.readVarInt(v1222, v1224);
            v1227 = v1228;
            v1224 = v1229;
        elseif v1226 == v0.wireTypes.lengthDelimited then
            if v1225 == 1 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.roblox_component = buffer.tostring(v1227);
            elseif v1225 == 2 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.identifier = buffer.tostring(v1227);
            elseif v1225 == 3 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.title = buffer.tostring(v1227);
            elseif v1225 == 4 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.user_id = buffer.tostring(v1227);
            elseif v1225 == 5 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.description = buffer.tostring(v1227);
            elseif v1225 == 6 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.cta_text = buffer.tostring(v1227);
            elseif v1225 == 7 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.prompt_id = buffer.tostring(v1227);
            elseif v1225 == 8 then
                v1227 = nil;
                v1228, v1229 = v0.readBuffer(v1222, v1224);
                v1227 = v1228;
                v1224 = v1229;
                v1223.prompt_type = buffer.tostring(v1227);
            else
                v1227 = nil;
                v1228, v1229 = v0.readVarInt(v1222, v1224);
                v1224 = v1229 + v1228;
            end;
        elseif v1226 == v0.wireTypes.i32 then
            v1227 = nil;
            v1228, v1229 = v0.readFixed32(v1222, v1224);
            v1227 = v1228;
            v1224 = v1229;
        elseif v1226 == v0.wireTypes.i64 then
            v1227 = nil;
            v1228, v1229 = v0.readFixed64(v1222, v1224);
            v1227 = v1228;
            v1224 = v1229;
        else
            error("Unsupported wire type: " .. v1226);
        end;
    end;
    return v1223;
end;
v4.jsonEncode = function(v1230) --[[ Line: 9172 ]] --[[ Name: jsonEncode ]]
    local v1231 = {};
    if v1230.roblox_component ~= nil and v1230.roblox_component ~= "" then
        v1231.robloxComponent = v1230.roblox_component;
    end;
    if v1230.identifier ~= nil and v1230.identifier ~= "" then
        v1231.identifier = v1230.identifier;
    end;
    if v1230.title ~= nil and v1230.title ~= "" then
        v1231.title = v1230.title;
    end;
    if v1230.user_id ~= nil and v1230.user_id ~= "" then
        v1231.userId = v1230.user_id;
    end;
    if v1230.description ~= nil and v1230.description ~= "" then
        v1231.description = v1230.description;
    end;
    if v1230.cta_text ~= nil and v1230.cta_text ~= "" then
        v1231.ctaText = v1230.cta_text;
    end;
    if v1230.prompt_id ~= nil and v1230.prompt_id ~= "" then
        v1231.promptId = v1230.prompt_id;
    end;
    if v1230.prompt_type ~= nil and v1230.prompt_type ~= "" then
        v1231.promptType = v1230.prompt_type;
    end;
    return v1231;
end;
v4.jsonDecode = function(v1232) --[[ Line: 9210 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_41 (copy)
    local v1233 = l_v4_41.new();
    if v1232.roblox_component ~= nil then
        v1233.roblox_component = v1232.roblox_component;
    end;
    if v1232.robloxComponent ~= nil then
        v1233.roblox_component = v1232.robloxComponent;
    end;
    if v1232.identifier ~= nil then
        v1233.identifier = v1232.identifier;
    end;
    if v1232.title ~= nil then
        v1233.title = v1232.title;
    end;
    if v1232.user_id ~= nil then
        v1233.user_id = v1232.user_id;
    end;
    if v1232.userId ~= nil then
        v1233.user_id = v1232.userId;
    end;
    if v1232.description ~= nil then
        v1233.description = v1232.description;
    end;
    if v1232.cta_text ~= nil then
        v1233.cta_text = v1232.cta_text;
    end;
    if v1232.ctaText ~= nil then
        v1233.cta_text = v1232.ctaText;
    end;
    if v1232.prompt_id ~= nil then
        v1233.prompt_id = v1232.prompt_id;
    end;
    if v1232.promptId ~= nil then
        v1233.prompt_id = v1232.promptId;
    end;
    if v1232.prompt_type ~= nil then
        v1233.prompt_type = v1232.prompt_type;
    end;
    if v1232.promptType ~= nil then
        v1233.prompt_type = v1232.promptType;
    end;
    return v1233;
end;
v4.descriptor = {
    name = "CardContainerCardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
};
v2.CardContainerCardInputData = v4;
v1.default:register(v2.CardContainerCardInputData);
v4 = {};
v4.__index = v4;
local l_v4_42 = v4 --[[ copy: 4 -> 47 ]];
v4.new = function(v1235) --[[ Line: 9282 ]] --[[ Name: new ]]
    -- upvalues: l_v4_42 (copy)
    return (setmetatable({
        title = (not (v1235 ~= nil) or v1235.title == nil) and "" or v1235.title, 
        dismiss_text = (not (v1235 ~= nil) or v1235.dismiss_text == nil) and "" or v1235.dismiss_text, 
        user_id = (not (v1235 ~= nil) or v1235.user_id == nil) and "" or v1235.user_id, 
        cards = if not (v1235 ~= nil) or v1235.cards == nil then {} else v1235.cards, 
        prompt_id = (not (v1235 ~= nil) or v1235.prompt_id == nil) and "" or v1235.prompt_id, 
        prompt_type = (not (v1235 ~= nil) or v1235.prompt_type == nil) and "" or v1235.prompt_type
    }, l_v4_42));
end;
v4.encode = function(v1236) --[[ Line: 9293 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1237 = buffer.create(0);
    local v1238 = 0;
    if v1236.title ~= nil and v1236.title ~= "" then
        local v1239, v1240 = v0.writeTag(v1237, v1238, 1, v0.wireTypes.lengthDelimited);
        v1239, v1240 = v0.writeString(v1239, v1240, v1236.title);
        v1237 = v1239;
        v1238 = v1240;
    end;
    if v1236.dismiss_text ~= nil and v1236.dismiss_text ~= "" then
        local v1241, v1242 = v0.writeTag(v1237, v1238, 2, v0.wireTypes.lengthDelimited);
        v1241, v1242 = v0.writeString(v1241, v1242, v1236.dismiss_text);
        v1237 = v1241;
        v1238 = v1242;
    end;
    if v1236.user_id ~= nil and v1236.user_id ~= "" then
        local v1243, v1244 = v0.writeTag(v1237, v1238, 3, v0.wireTypes.lengthDelimited);
        v1243, v1244 = v0.writeString(v1243, v1244, v1236.user_id);
        v1237 = v1243;
        v1238 = v1244;
    end;
    if v1236.cards ~= nil and #v1236.cards > 0 then
        for _, v1246 in v1236.cards do
            local v1247 = v1246:encode();
            local v1248, v1249 = v0.writeTag(v1237, v1238, 4, v0.wireTypes.lengthDelimited);
            v1248, v1249 = v0.writeBuffer(v1248, v1249, v1247, buffer.len(v1247));
            v1237 = v1248;
            v1238 = v1249;
        end;
    end;
    if v1236.prompt_id ~= nil and v1236.prompt_id ~= "" then
        local v1250, v1251 = v0.writeTag(v1237, v1238, 5, v0.wireTypes.lengthDelimited);
        v1250, v1251 = v0.writeString(v1250, v1251, v1236.prompt_id);
        v1237 = v1250;
        v1238 = v1251;
    end;
    if v1236.prompt_type ~= nil and v1236.prompt_type ~= "" then
        local v1252, v1253 = v0.writeTag(v1237, v1238, 6, v0.wireTypes.lengthDelimited);
        v1252, v1253 = v0.writeString(v1252, v1253, v1236.prompt_type);
        v1237 = v1252;
        v1238 = v1253;
    end;
    local v1254 = buffer.create(v1238);
    buffer.copy(v1254, 0, v1237, 0, v1238);
    return v1254;
end;
v4.decode = function(v1255) --[[ Line: 9335 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_42 (copy), v0 (copy), v2 (copy)
    local v1256 = l_v4_42.new();
    local v1257 = 0;
    while v1257 < buffer.len(v1255) do
        local v1258 = nil;
        local v1259 = nil;
        local v1260, v1261, v1262 = v0.readTag(v1255, v1257);
        v1258 = v1260;
        v1259 = v1261;
        v1257 = v1262;
        if v1259 == v0.wireTypes.varint then
            v1260 = nil;
            v1261, v1262 = v0.readVarInt(v1255, v1257);
            v1260 = v1261;
            v1257 = v1262;
        elseif v1259 == v0.wireTypes.lengthDelimited then
            if v1258 == 1 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                v1256.title = buffer.tostring(v1260);
            elseif v1258 == 2 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                v1256.dismiss_text = buffer.tostring(v1260);
            elseif v1258 == 3 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                v1256.user_id = buffer.tostring(v1260);
            elseif v1258 == 4 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                table.insert(v1256.cards, v2.CardContainerCardInputData.decode(v1260));
            elseif v1258 == 5 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                v1256.prompt_id = buffer.tostring(v1260);
            elseif v1258 == 6 then
                v1260 = nil;
                v1261, v1262 = v0.readBuffer(v1255, v1257);
                v1260 = v1261;
                v1257 = v1262;
                v1256.prompt_type = buffer.tostring(v1260);
            else
                v1260 = nil;
                v1261, v1262 = v0.readVarInt(v1255, v1257);
                v1257 = v1262 + v1261;
            end;
        elseif v1259 == v0.wireTypes.i32 then
            v1260 = nil;
            v1261, v1262 = v0.readFixed32(v1255, v1257);
            v1260 = v1261;
            v1257 = v1262;
        elseif v1259 == v0.wireTypes.i64 then
            v1260 = nil;
            v1261, v1262 = v0.readFixed64(v1255, v1257);
            v1260 = v1261;
            v1257 = v1262;
        else
            error("Unsupported wire type: " .. v1259);
        end;
    end;
    return v1256;
end;
v4.jsonEncode = function(v1263) --[[ Line: 9403 ]] --[[ Name: jsonEncode ]]
    local v1264 = {};
    if v1263.title ~= nil and v1263.title ~= "" then
        v1264.title = v1263.title;
    end;
    if v1263.dismiss_text ~= nil and v1263.dismiss_text ~= "" then
        v1264.dismissText = v1263.dismiss_text;
    end;
    if v1263.user_id ~= nil and v1263.user_id ~= "" then
        v1264.userId = v1263.user_id;
    end;
    if v1263.cards ~= nil and #v1263.cards > 0 then
        local v1265 = {};
        for _, v1267 in v1263.cards do
            table.insert(v1265, v1267:jsonEncode());
        end;
        v1264.cards = v1265;
    end;
    if v1263.prompt_id ~= nil and v1263.prompt_id ~= "" then
        v1264.promptId = v1263.prompt_id;
    end;
    if v1263.prompt_type ~= nil and v1263.prompt_type ~= "" then
        v1264.promptType = v1263.prompt_type;
    end;
    return v1264;
end;
v4.jsonDecode = function(v1268) --[[ Line: 9437 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_42 (copy), v2 (copy)
    local v1269 = l_v4_42.new();
    if v1268.title ~= nil then
        v1269.title = v1268.title;
    end;
    if v1268.dismiss_text ~= nil then
        v1269.dismiss_text = v1268.dismiss_text;
    end;
    if v1268.dismissText ~= nil then
        v1269.dismiss_text = v1268.dismissText;
    end;
    if v1268.user_id ~= nil then
        v1269.user_id = v1268.user_id;
    end;
    if v1268.userId ~= nil then
        v1269.user_id = v1268.userId;
    end;
    if v1268.cards ~= nil then
        local v1270 = {};
        for _, v1272 in v1268.cards do
            table.insert(v1270, v2.CardContainerCardInputData.jsonDecode(v1272));
        end;
        v1269.cards = v1270;
    end;
    if v1268.prompt_id ~= nil then
        v1269.prompt_id = v1268.prompt_id;
    end;
    if v1268.promptId ~= nil then
        v1269.prompt_id = v1268.promptId;
    end;
    if v1268.prompt_type ~= nil then
        v1269.prompt_type = v1268.prompt_type;
    end;
    if v1268.promptType ~= nil then
        v1269.prompt_type = v1268.promptType;
    end;
    return v1269;
end;
v4.descriptor = {
    name = "CardContainerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
};
v2.CardContainerInputData = v4;
v1.default:register(v2.CardContainerInputData);
v4 = {};
v4.__index = v4;
local l_v4_43 = v4 --[[ copy: 4 -> 48 ]];
v4.new = function(v1274) --[[ Line: 9502 ]] --[[ Name: new ]]
    -- upvalues: l_v4_43 (copy)
    return (setmetatable({
        title = (not (v1274 ~= nil) or v1274.title == nil) and "" or v1274.title, 
        user_id = (not (v1274 ~= nil) or v1274.user_id == nil) and "" or v1274.user_id, 
        description = (not (v1274 ~= nil) or v1274.description == nil) and "" or v1274.description, 
        cta_text = (not (v1274 ~= nil) or v1274.cta_text == nil) and "" or v1274.cta_text, 
        prompt_id = (not (v1274 ~= nil) or v1274.prompt_id == nil) and "" or v1274.prompt_id, 
        prompt_type = (not (v1274 ~= nil) or v1274.prompt_type == nil) and "" or v1274.prompt_type
    }, l_v4_43));
end;
v4.encode = function(v1275) --[[ Line: 9513 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1276 = buffer.create(0);
    local v1277 = 0;
    if v1275.title ~= nil and v1275.title ~= "" then
        local v1278, v1279 = v0.writeTag(v1276, v1277, 1, v0.wireTypes.lengthDelimited);
        v1278, v1279 = v0.writeString(v1278, v1279, v1275.title);
        v1276 = v1278;
        v1277 = v1279;
    end;
    if v1275.user_id ~= nil and v1275.user_id ~= "" then
        local v1280, v1281 = v0.writeTag(v1276, v1277, 2, v0.wireTypes.lengthDelimited);
        v1280, v1281 = v0.writeString(v1280, v1281, v1275.user_id);
        v1276 = v1280;
        v1277 = v1281;
    end;
    if v1275.description ~= nil and v1275.description ~= "" then
        local v1282, v1283 = v0.writeTag(v1276, v1277, 3, v0.wireTypes.lengthDelimited);
        v1282, v1283 = v0.writeString(v1282, v1283, v1275.description);
        v1276 = v1282;
        v1277 = v1283;
    end;
    if v1275.cta_text ~= nil and v1275.cta_text ~= "" then
        local v1284, v1285 = v0.writeTag(v1276, v1277, 4, v0.wireTypes.lengthDelimited);
        v1284, v1285 = v0.writeString(v1284, v1285, v1275.cta_text);
        v1276 = v1284;
        v1277 = v1285;
    end;
    if v1275.prompt_id ~= nil and v1275.prompt_id ~= "" then
        local v1286, v1287 = v0.writeTag(v1276, v1277, 5, v0.wireTypes.lengthDelimited);
        v1286, v1287 = v0.writeString(v1286, v1287, v1275.prompt_id);
        v1276 = v1286;
        v1277 = v1287;
    end;
    if v1275.prompt_type ~= nil and v1275.prompt_type ~= "" then
        local v1288, v1289 = v0.writeTag(v1276, v1277, 6, v0.wireTypes.lengthDelimited);
        v1288, v1289 = v0.writeString(v1288, v1289, v1275.prompt_type);
        v1276 = v1288;
        v1277 = v1289;
    end;
    local v1290 = buffer.create(v1277);
    buffer.copy(v1290, 0, v1276, 0, v1277);
    return v1290;
end;
v4.decode = function(v1291) --[[ Line: 9552 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_43 (copy), v0 (copy)
    local v1292 = l_v4_43.new();
    local v1293 = 0;
    while v1293 < buffer.len(v1291) do
        local v1294 = nil;
        local v1295 = nil;
        local v1296, v1297, v1298 = v0.readTag(v1291, v1293);
        v1294 = v1296;
        v1295 = v1297;
        v1293 = v1298;
        if v1295 == v0.wireTypes.varint then
            v1296 = nil;
            v1297, v1298 = v0.readVarInt(v1291, v1293);
            v1296 = v1297;
            v1293 = v1298;
        elseif v1295 == v0.wireTypes.lengthDelimited then
            if v1294 == 1 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.title = buffer.tostring(v1296);
            elseif v1294 == 2 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.user_id = buffer.tostring(v1296);
            elseif v1294 == 3 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.description = buffer.tostring(v1296);
            elseif v1294 == 4 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.cta_text = buffer.tostring(v1296);
            elseif v1294 == 5 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.prompt_id = buffer.tostring(v1296);
            elseif v1294 == 6 then
                v1296 = nil;
                v1297, v1298 = v0.readBuffer(v1291, v1293);
                v1296 = v1297;
                v1293 = v1298;
                v1292.prompt_type = buffer.tostring(v1296);
            else
                v1296 = nil;
                v1297, v1298 = v0.readVarInt(v1291, v1293);
                v1293 = v1298 + v1297;
            end;
        elseif v1295 == v0.wireTypes.i32 then
            v1296 = nil;
            v1297, v1298 = v0.readFixed32(v1291, v1293);
            v1296 = v1297;
            v1293 = v1298;
        elseif v1295 == v0.wireTypes.i64 then
            v1296 = nil;
            v1297, v1298 = v0.readFixed64(v1291, v1293);
            v1296 = v1297;
            v1293 = v1298;
        else
            error("Unsupported wire type: " .. v1295);
        end;
    end;
    return v1292;
end;
v4.jsonEncode = function(v1299) --[[ Line: 9620 ]] --[[ Name: jsonEncode ]]
    local v1300 = {};
    if v1299.title ~= nil and v1299.title ~= "" then
        v1300.title = v1299.title;
    end;
    if v1299.user_id ~= nil and v1299.user_id ~= "" then
        v1300.userId = v1299.user_id;
    end;
    if v1299.description ~= nil and v1299.description ~= "" then
        v1300.description = v1299.description;
    end;
    if v1299.cta_text ~= nil and v1299.cta_text ~= "" then
        v1300.ctaText = v1299.cta_text;
    end;
    if v1299.prompt_id ~= nil and v1299.prompt_id ~= "" then
        v1300.promptId = v1299.prompt_id;
    end;
    if v1299.prompt_type ~= nil and v1299.prompt_type ~= "" then
        v1300.promptType = v1299.prompt_type;
    end;
    return v1300;
end;
v4.jsonDecode = function(v1301) --[[ Line: 9650 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_43 (copy)
    local v1302 = l_v4_43.new();
    if v1301.title ~= nil then
        v1302.title = v1301.title;
    end;
    if v1301.user_id ~= nil then
        v1302.user_id = v1301.user_id;
    end;
    if v1301.userId ~= nil then
        v1302.user_id = v1301.userId;
    end;
    if v1301.description ~= nil then
        v1302.description = v1301.description;
    end;
    if v1301.cta_text ~= nil then
        v1302.cta_text = v1301.cta_text;
    end;
    if v1301.ctaText ~= nil then
        v1302.cta_text = v1301.ctaText;
    end;
    if v1301.prompt_id ~= nil then
        v1302.prompt_id = v1301.prompt_id;
    end;
    if v1301.promptId ~= nil then
        v1302.prompt_id = v1301.promptId;
    end;
    if v1301.prompt_type ~= nil then
        v1302.prompt_type = v1301.prompt_type;
    end;
    if v1301.promptType ~= nil then
        v1302.prompt_type = v1301.promptType;
    end;
    return v1302;
end;
v4.descriptor = {
    name = "CardInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
};
v2.CardInputData = v4;
v1.default:register(v2.CardInputData);
v4 = {};
v4.__index = v4;
local l_v4_44 = v4 --[[ copy: 4 -> 49 ]];
v4.new = function(_) --[[ Line: 9710 ]] --[[ Name: new ]]
    -- upvalues: l_v4_44 (copy)
    return (setmetatable({}, l_v4_44));
end;
v4.encode = function(_) --[[ Line: 9714 ]] --[[ Name: encode ]]
    local v1306 = buffer.create(0);
    local v1307 = buffer.create(0);
    buffer.copy(v1307, 0, v1306, 0, 0);
    return v1307;
end;
v4.decode = function(v1308) --[[ Line: 9723 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_44 (copy), v0 (copy)
    local v1309 = l_v4_44.new();
    local v1310 = 0;
    while v1310 < buffer.len(v1308) do
        local v1311 = nil;
        local v1312 = nil;
        local v1313, v1314, v1315 = v0.readTag(v1308, v1310);
        v1311 = v1313;
        v1312 = v1314;
        v1310 = v1315;
        if v1312 == v0.wireTypes.varint then
            v1313 = nil;
            v1314, v1315 = v0.readVarInt(v1308, v1310);
            v1313 = v1314;
            v1310 = v1315;
        elseif v1312 == v0.wireTypes.lengthDelimited then
            v1313 = nil;
            v1314, v1315 = v0.readVarInt(v1308, v1310);
            v1310 = v1315 + v1314;
        elseif v1312 == v0.wireTypes.i32 then
            v1313 = nil;
            v1314, v1315 = v0.readFixed32(v1308, v1310);
            v1313 = v1314;
            v1310 = v1315;
        elseif v1312 == v0.wireTypes.i64 then
            v1313 = nil;
            v1314, v1315 = v0.readFixed64(v1308, v1310);
            v1313 = v1314;
            v1310 = v1315;
        else
            error("Unsupported wire type: " .. v1312);
        end;
    end;
    return v1309;
end;
v4.jsonEncode = function(_) --[[ Line: 9761 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 9767 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_44 (copy)
    return (l_v4_44.new());
end;
v4.descriptor = {
    name = "DialogInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
};
v2.DialogInputData = v4;
v1.default:register(v2.DialogInputData);
v4 = {};
v4.__index = v4;
local l_v4_45 = v4 --[[ copy: 4 -> 50 ]];
v4.new = function(v1319) --[[ Line: 9787 ]] --[[ Name: new ]]
    -- upvalues: l_v4_45 (copy)
    return (setmetatable({
        title = (not (v1319 ~= nil) or v1319.title == nil) and "" or v1319.title, 
        description = (not (v1319 ~= nil) or v1319.description == nil) and "" or v1319.description, 
        primary_text = (not (v1319 ~= nil) or v1319.primary_text == nil) and "" or v1319.primary_text, 
        secondary_text = (not (v1319 ~= nil) or v1319.secondary_text == nil) and "" or v1319.secondary_text, 
        prompt_id = (not (v1319 ~= nil) or v1319.prompt_id == nil) and "" or v1319.prompt_id, 
        prompt_type = (not (v1319 ~= nil) or v1319.prompt_type == nil) and "" or v1319.prompt_type
    }, l_v4_45));
end;
v4.encode = function(v1320) --[[ Line: 9798 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1321 = buffer.create(0);
    local v1322 = 0;
    if v1320.title ~= nil and v1320.title ~= "" then
        local v1323, v1324 = v0.writeTag(v1321, v1322, 1, v0.wireTypes.lengthDelimited);
        v1323, v1324 = v0.writeString(v1323, v1324, v1320.title);
        v1321 = v1323;
        v1322 = v1324;
    end;
    if v1320.description ~= nil and v1320.description ~= "" then
        local v1325, v1326 = v0.writeTag(v1321, v1322, 2, v0.wireTypes.lengthDelimited);
        v1325, v1326 = v0.writeString(v1325, v1326, v1320.description);
        v1321 = v1325;
        v1322 = v1326;
    end;
    if v1320.primary_text ~= nil and v1320.primary_text ~= "" then
        local v1327, v1328 = v0.writeTag(v1321, v1322, 3, v0.wireTypes.lengthDelimited);
        v1327, v1328 = v0.writeString(v1327, v1328, v1320.primary_text);
        v1321 = v1327;
        v1322 = v1328;
    end;
    if v1320.secondary_text ~= nil and v1320.secondary_text ~= "" then
        local v1329, v1330 = v0.writeTag(v1321, v1322, 4, v0.wireTypes.lengthDelimited);
        v1329, v1330 = v0.writeString(v1329, v1330, v1320.secondary_text);
        v1321 = v1329;
        v1322 = v1330;
    end;
    if v1320.prompt_id ~= nil and v1320.prompt_id ~= "" then
        local v1331, v1332 = v0.writeTag(v1321, v1322, 5, v0.wireTypes.lengthDelimited);
        v1331, v1332 = v0.writeString(v1331, v1332, v1320.prompt_id);
        v1321 = v1331;
        v1322 = v1332;
    end;
    if v1320.prompt_type ~= nil and v1320.prompt_type ~= "" then
        local v1333, v1334 = v0.writeTag(v1321, v1322, 6, v0.wireTypes.lengthDelimited);
        v1333, v1334 = v0.writeString(v1333, v1334, v1320.prompt_type);
        v1321 = v1333;
        v1322 = v1334;
    end;
    local v1335 = buffer.create(v1322);
    buffer.copy(v1335, 0, v1321, 0, v1322);
    return v1335;
end;
v4.decode = function(v1336) --[[ Line: 9837 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_45 (copy), v0 (copy)
    local v1337 = l_v4_45.new();
    local v1338 = 0;
    while v1338 < buffer.len(v1336) do
        local v1339 = nil;
        local v1340 = nil;
        local v1341, v1342, v1343 = v0.readTag(v1336, v1338);
        v1339 = v1341;
        v1340 = v1342;
        v1338 = v1343;
        if v1340 == v0.wireTypes.varint then
            v1341 = nil;
            v1342, v1343 = v0.readVarInt(v1336, v1338);
            v1341 = v1342;
            v1338 = v1343;
        elseif v1340 == v0.wireTypes.lengthDelimited then
            if v1339 == 1 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.title = buffer.tostring(v1341);
            elseif v1339 == 2 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.description = buffer.tostring(v1341);
            elseif v1339 == 3 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.primary_text = buffer.tostring(v1341);
            elseif v1339 == 4 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.secondary_text = buffer.tostring(v1341);
            elseif v1339 == 5 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.prompt_id = buffer.tostring(v1341);
            elseif v1339 == 6 then
                v1341 = nil;
                v1342, v1343 = v0.readBuffer(v1336, v1338);
                v1341 = v1342;
                v1338 = v1343;
                v1337.prompt_type = buffer.tostring(v1341);
            else
                v1341 = nil;
                v1342, v1343 = v0.readVarInt(v1336, v1338);
                v1338 = v1343 + v1342;
            end;
        elseif v1340 == v0.wireTypes.i32 then
            v1341 = nil;
            v1342, v1343 = v0.readFixed32(v1336, v1338);
            v1341 = v1342;
            v1338 = v1343;
        elseif v1340 == v0.wireTypes.i64 then
            v1341 = nil;
            v1342, v1343 = v0.readFixed64(v1336, v1338);
            v1341 = v1342;
            v1338 = v1343;
        else
            error("Unsupported wire type: " .. v1340);
        end;
    end;
    return v1337;
end;
v4.jsonEncode = function(v1344) --[[ Line: 9905 ]] --[[ Name: jsonEncode ]]
    local v1345 = {};
    if v1344.title ~= nil and v1344.title ~= "" then
        v1345.title = v1344.title;
    end;
    if v1344.description ~= nil and v1344.description ~= "" then
        v1345.description = v1344.description;
    end;
    if v1344.primary_text ~= nil and v1344.primary_text ~= "" then
        v1345.primaryText = v1344.primary_text;
    end;
    if v1344.secondary_text ~= nil and v1344.secondary_text ~= "" then
        v1345.secondaryText = v1344.secondary_text;
    end;
    if v1344.prompt_id ~= nil and v1344.prompt_id ~= "" then
        v1345.promptId = v1344.prompt_id;
    end;
    if v1344.prompt_type ~= nil and v1344.prompt_type ~= "" then
        v1345.promptType = v1344.prompt_type;
    end;
    return v1345;
end;
v4.jsonDecode = function(v1346) --[[ Line: 9935 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_45 (copy)
    local v1347 = l_v4_45.new();
    if v1346.title ~= nil then
        v1347.title = v1346.title;
    end;
    if v1346.description ~= nil then
        v1347.description = v1346.description;
    end;
    if v1346.primary_text ~= nil then
        v1347.primary_text = v1346.primary_text;
    end;
    if v1346.primaryText ~= nil then
        v1347.primary_text = v1346.primaryText;
    end;
    if v1346.secondary_text ~= nil then
        v1347.secondary_text = v1346.secondary_text;
    end;
    if v1346.secondaryText ~= nil then
        v1347.secondary_text = v1346.secondaryText;
    end;
    if v1346.prompt_id ~= nil then
        v1347.prompt_id = v1346.prompt_id;
    end;
    if v1346.promptId ~= nil then
        v1347.prompt_id = v1346.promptId;
    end;
    if v1346.prompt_type ~= nil then
        v1347.prompt_type = v1346.prompt_type;
    end;
    if v1346.promptType ~= nil then
        v1347.prompt_type = v1346.promptType;
    end;
    return v1347;
end;
v4.descriptor = {
    name = "BannerInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
};
v2.BannerInputData = v4;
v1.default:register(v2.BannerInputData);
v4 = {};
v4.__index = v4;
local l_v4_46 = v4 --[[ copy: 4 -> 51 ]];
v4.new = function(v1349) --[[ Line: 9995 ]] --[[ Name: new ]]
    -- upvalues: l_v4_46 (copy)
    return (setmetatable({
        tooltip_text = (not (v1349 ~= nil) or v1349.tooltip_text == nil) and "" or v1349.tooltip_text, 
        prompt_id = (not (v1349 ~= nil) or v1349.prompt_id == nil) and "" or v1349.prompt_id, 
        prompt_type = (not (v1349 ~= nil) or v1349.prompt_type == nil) and "" or v1349.prompt_type
    }, l_v4_46));
end;
v4.encode = function(v1350) --[[ Line: 10003 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1351 = buffer.create(0);
    local v1352 = 0;
    if v1350.tooltip_text ~= nil and v1350.tooltip_text ~= "" then
        local v1353, v1354 = v0.writeTag(v1351, v1352, 1, v0.wireTypes.lengthDelimited);
        v1353, v1354 = v0.writeString(v1353, v1354, v1350.tooltip_text);
        v1351 = v1353;
        v1352 = v1354;
    end;
    if v1350.prompt_id ~= nil and v1350.prompt_id ~= "" then
        local v1355, v1356 = v0.writeTag(v1351, v1352, 2, v0.wireTypes.lengthDelimited);
        v1355, v1356 = v0.writeString(v1355, v1356, v1350.prompt_id);
        v1351 = v1355;
        v1352 = v1356;
    end;
    if v1350.prompt_type ~= nil and v1350.prompt_type ~= "" then
        local v1357, v1358 = v0.writeTag(v1351, v1352, 3, v0.wireTypes.lengthDelimited);
        v1357, v1358 = v0.writeString(v1357, v1358, v1350.prompt_type);
        v1351 = v1357;
        v1352 = v1358;
    end;
    local v1359 = buffer.create(v1352);
    buffer.copy(v1359, 0, v1351, 0, v1352);
    return v1359;
end;
v4.decode = function(v1360) --[[ Line: 10027 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_46 (copy), v0 (copy)
    local v1361 = l_v4_46.new();
    local v1362 = 0;
    while v1362 < buffer.len(v1360) do
        local v1363 = nil;
        local v1364 = nil;
        local v1365, v1366, v1367 = v0.readTag(v1360, v1362);
        v1363 = v1365;
        v1364 = v1366;
        v1362 = v1367;
        if v1364 == v0.wireTypes.varint then
            v1365 = nil;
            v1366, v1367 = v0.readVarInt(v1360, v1362);
            v1365 = v1366;
            v1362 = v1367;
        elseif v1364 == v0.wireTypes.lengthDelimited then
            if v1363 == 1 then
                v1365 = nil;
                v1366, v1367 = v0.readBuffer(v1360, v1362);
                v1365 = v1366;
                v1362 = v1367;
                v1361.tooltip_text = buffer.tostring(v1365);
            elseif v1363 == 2 then
                v1365 = nil;
                v1366, v1367 = v0.readBuffer(v1360, v1362);
                v1365 = v1366;
                v1362 = v1367;
                v1361.prompt_id = buffer.tostring(v1365);
            elseif v1363 == 3 then
                v1365 = nil;
                v1366, v1367 = v0.readBuffer(v1360, v1362);
                v1365 = v1366;
                v1362 = v1367;
                v1361.prompt_type = buffer.tostring(v1365);
            else
                v1365 = nil;
                v1366, v1367 = v0.readVarInt(v1360, v1362);
                v1362 = v1367 + v1366;
            end;
        elseif v1364 == v0.wireTypes.i32 then
            v1365 = nil;
            v1366, v1367 = v0.readFixed32(v1360, v1362);
            v1365 = v1366;
            v1362 = v1367;
        elseif v1364 == v0.wireTypes.i64 then
            v1365 = nil;
            v1366, v1367 = v0.readFixed64(v1360, v1362);
            v1365 = v1366;
            v1362 = v1367;
        else
            error("Unsupported wire type: " .. v1364);
        end;
    end;
    return v1361;
end;
v4.jsonEncode = function(v1368) --[[ Line: 10080 ]] --[[ Name: jsonEncode ]]
    local v1369 = {};
    if v1368.tooltip_text ~= nil and v1368.tooltip_text ~= "" then
        v1369.tooltipText = v1368.tooltip_text;
    end;
    if v1368.prompt_id ~= nil and v1368.prompt_id ~= "" then
        v1369.promptId = v1368.prompt_id;
    end;
    if v1368.prompt_type ~= nil and v1368.prompt_type ~= "" then
        v1369.promptType = v1368.prompt_type;
    end;
    return v1369;
end;
v4.jsonDecode = function(v1370) --[[ Line: 10098 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_46 (copy)
    local v1371 = l_v4_46.new();
    if v1370.tooltip_text ~= nil then
        v1371.tooltip_text = v1370.tooltip_text;
    end;
    if v1370.tooltipText ~= nil then
        v1371.tooltip_text = v1370.tooltipText;
    end;
    if v1370.prompt_id ~= nil then
        v1371.prompt_id = v1370.prompt_id;
    end;
    if v1370.promptId ~= nil then
        v1371.prompt_id = v1370.promptId;
    end;
    if v1370.prompt_type ~= nil then
        v1371.prompt_type = v1370.prompt_type;
    end;
    if v1370.promptType ~= nil then
        v1371.prompt_type = v1370.promptType;
    end;
    return v1371;
end;
v4.descriptor = {
    name = "TooltipInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
};
v2.TooltipInputData = v4;
v1.default:register(v2.TooltipInputData);
v4 = {};
v4.__index = v4;
local l_v4_47 = v4 --[[ copy: 4 -> 52 ]];
v4.new = function(v1373) --[[ Line: 10142 ]] --[[ Name: new ]]
    -- upvalues: l_v4_47 (copy)
    return (setmetatable({
        media_id = (not (v1373 ~= nil) or v1373.media_id == nil) and "" or v1373.media_id, 
        title = (not (v1373 ~= nil) or v1373.title == nil) and "" or v1373.title, 
        description = (not (v1373 ~= nil) or v1373.description == nil) and "" or v1373.description, 
        prompt_id = (not (v1373 ~= nil) or v1373.prompt_id == nil) and "" or v1373.prompt_id, 
        prompt_type = (not (v1373 ~= nil) or v1373.prompt_type == nil) and "" or v1373.prompt_type, 
        anchor_tag = (not (v1373 ~= nil) or v1373.anchor_tag == nil) and "" or v1373.anchor_tag
    }, l_v4_47));
end;
v4.encode = function(v1374) --[[ Line: 10153 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1375 = buffer.create(0);
    local v1376 = 0;
    if v1374.media_id ~= nil and v1374.media_id ~= "" then
        local v1377, v1378 = v0.writeTag(v1375, v1376, 1, v0.wireTypes.lengthDelimited);
        v1377, v1378 = v0.writeString(v1377, v1378, v1374.media_id);
        v1375 = v1377;
        v1376 = v1378;
    end;
    if v1374.title ~= nil and v1374.title ~= "" then
        local v1379, v1380 = v0.writeTag(v1375, v1376, 2, v0.wireTypes.lengthDelimited);
        v1379, v1380 = v0.writeString(v1379, v1380, v1374.title);
        v1375 = v1379;
        v1376 = v1380;
    end;
    if v1374.description ~= nil and v1374.description ~= "" then
        local v1381, v1382 = v0.writeTag(v1375, v1376, 3, v0.wireTypes.lengthDelimited);
        v1381, v1382 = v0.writeString(v1381, v1382, v1374.description);
        v1375 = v1381;
        v1376 = v1382;
    end;
    if v1374.prompt_id ~= nil and v1374.prompt_id ~= "" then
        local v1383, v1384 = v0.writeTag(v1375, v1376, 4, v0.wireTypes.lengthDelimited);
        v1383, v1384 = v0.writeString(v1383, v1384, v1374.prompt_id);
        v1375 = v1383;
        v1376 = v1384;
    end;
    if v1374.prompt_type ~= nil and v1374.prompt_type ~= "" then
        local v1385, v1386 = v0.writeTag(v1375, v1376, 5, v0.wireTypes.lengthDelimited);
        v1385, v1386 = v0.writeString(v1385, v1386, v1374.prompt_type);
        v1375 = v1385;
        v1376 = v1386;
    end;
    if v1374.anchor_tag ~= nil and v1374.anchor_tag ~= "" then
        local v1387, v1388 = v0.writeTag(v1375, v1376, 6, v0.wireTypes.lengthDelimited);
        v1387, v1388 = v0.writeString(v1387, v1388, v1374.anchor_tag);
        v1375 = v1387;
        v1376 = v1388;
    end;
    local v1389 = buffer.create(v1376);
    buffer.copy(v1389, 0, v1375, 0, v1376);
    return v1389;
end;
v4.decode = function(v1390) --[[ Line: 10192 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_47 (copy), v0 (copy)
    local v1391 = l_v4_47.new();
    local v1392 = 0;
    while v1392 < buffer.len(v1390) do
        local v1393 = nil;
        local v1394 = nil;
        local v1395, v1396, v1397 = v0.readTag(v1390, v1392);
        v1393 = v1395;
        v1394 = v1396;
        v1392 = v1397;
        if v1394 == v0.wireTypes.varint then
            v1395 = nil;
            v1396, v1397 = v0.readVarInt(v1390, v1392);
            v1395 = v1396;
            v1392 = v1397;
        elseif v1394 == v0.wireTypes.lengthDelimited then
            if v1393 == 1 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.media_id = buffer.tostring(v1395);
            elseif v1393 == 2 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.title = buffer.tostring(v1395);
            elseif v1393 == 3 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.description = buffer.tostring(v1395);
            elseif v1393 == 4 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.prompt_id = buffer.tostring(v1395);
            elseif v1393 == 5 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.prompt_type = buffer.tostring(v1395);
            elseif v1393 == 6 then
                v1395 = nil;
                v1396, v1397 = v0.readBuffer(v1390, v1392);
                v1395 = v1396;
                v1392 = v1397;
                v1391.anchor_tag = buffer.tostring(v1395);
            else
                v1395 = nil;
                v1396, v1397 = v0.readVarInt(v1390, v1392);
                v1392 = v1397 + v1396;
            end;
        elseif v1394 == v0.wireTypes.i32 then
            v1395 = nil;
            v1396, v1397 = v0.readFixed32(v1390, v1392);
            v1395 = v1396;
            v1392 = v1397;
        elseif v1394 == v0.wireTypes.i64 then
            v1395 = nil;
            v1396, v1397 = v0.readFixed64(v1390, v1392);
            v1395 = v1396;
            v1392 = v1397;
        else
            error("Unsupported wire type: " .. v1394);
        end;
    end;
    return v1391;
end;
v4.jsonEncode = function(v1398) --[[ Line: 10260 ]] --[[ Name: jsonEncode ]]
    local v1399 = {};
    if v1398.media_id ~= nil and v1398.media_id ~= "" then
        v1399.mediaId = v1398.media_id;
    end;
    if v1398.title ~= nil and v1398.title ~= "" then
        v1399.title = v1398.title;
    end;
    if v1398.description ~= nil and v1398.description ~= "" then
        v1399.description = v1398.description;
    end;
    if v1398.prompt_id ~= nil and v1398.prompt_id ~= "" then
        v1399.promptId = v1398.prompt_id;
    end;
    if v1398.prompt_type ~= nil and v1398.prompt_type ~= "" then
        v1399.promptType = v1398.prompt_type;
    end;
    if v1398.anchor_tag ~= nil and v1398.anchor_tag ~= "" then
        v1399.anchorTag = v1398.anchor_tag;
    end;
    return v1399;
end;
v4.jsonDecode = function(v1400) --[[ Line: 10290 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_47 (copy)
    local v1401 = l_v4_47.new();
    if v1400.media_id ~= nil then
        v1401.media_id = v1400.media_id;
    end;
    if v1400.mediaId ~= nil then
        v1401.media_id = v1400.mediaId;
    end;
    if v1400.title ~= nil then
        v1401.title = v1400.title;
    end;
    if v1400.description ~= nil then
        v1401.description = v1400.description;
    end;
    if v1400.prompt_id ~= nil then
        v1401.prompt_id = v1400.prompt_id;
    end;
    if v1400.promptId ~= nil then
        v1401.prompt_id = v1400.promptId;
    end;
    if v1400.prompt_type ~= nil then
        v1401.prompt_type = v1400.prompt_type;
    end;
    if v1400.promptType ~= nil then
        v1401.prompt_type = v1400.promptType;
    end;
    if v1400.anchor_tag ~= nil then
        v1401.anchor_tag = v1400.anchor_tag;
    end;
    if v1400.anchorTag ~= nil then
        v1401.anchor_tag = v1400.anchorTag;
    end;
    return v1401;
end;
v4.descriptor = {
    name = "CoachmarkInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
};
v2.CoachmarkInputData = v4;
v1.default:register(v2.CoachmarkInputData);
v4 = {};
v4.__index = v4;
local l_v4_48 = v4 --[[ copy: 4 -> 53 ]];
v4.new = function(v1403) --[[ Line: 10350 ]] --[[ Name: new ]]
    -- upvalues: l_v4_48 (copy)
    return (setmetatable({
        event_id = (not (v1403 ~= nil) or v1403.event_id == nil) and "" or v1403.event_id, 
        universe_id = (not (v1403 ~= nil) or v1403.universe_id == nil) and "" or v1403.universe_id, 
        entry_map = if not (v1403 ~= nil) or v1403.entry_map == nil then {} else v1403.entry_map, 
        entry_order = if not (v1403 ~= nil) or v1403.entry_order == nil then {} else v1403.entry_order
    }, l_v4_48));
end;
v4.encode = function(v1404) --[[ Line: 10361 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1405 = buffer.create(0);
    local v1406 = 0;
    if v1404.event_id ~= nil and v1404.event_id ~= "" then
        local v1407, v1408 = v0.writeTag(v1405, v1406, 1, v0.wireTypes.lengthDelimited);
        v1407, v1408 = v0.writeString(v1407, v1408, v1404.event_id);
        v1405 = v1407;
        v1406 = v1408;
    end;
    if v1404.universe_id ~= nil and v1404.universe_id ~= "" then
        local v1409, v1410 = v0.writeTag(v1405, v1406, 2, v0.wireTypes.lengthDelimited);
        v1409, v1410 = v0.writeString(v1409, v1410, v1404.universe_id);
        v1405 = v1409;
        v1406 = v1410;
    end;
    if v1404.entry_map ~= nil and next(v1404.entry_map) ~= nil then
        for v1411, v1412 in v1404.entry_map do
            local v1413 = buffer.create(0);
            local v1414, v1415 = v0.writeTag(v1413, 0, 1, v0.wireTypes.lengthDelimited);
            v1414, v1415 = v0.writeString(v1414, v1415, v1411);
            v1413 = v1414;
            local l_v1415_0 = v1415;
            v1414 = v1412:encode();
            local v1417;
            v1415, v1417 = v0.writeTag(v1413, l_v1415_0, 2, v0.wireTypes.lengthDelimited);
            v1415, v1417 = v0.writeBuffer(v1415, v1417, v1414, buffer.len(v1414));
            v1413 = v1415;
            l_v1415_0 = v1417;
            v1415, v1417 = v0.writeTag(v1405, v1406, 3, v0.wireTypes.lengthDelimited);
            v1415, v1417 = v0.writeBuffer(v1415, v1417, v1413, l_v1415_0);
            v1405 = v1415;
            v1406 = v1417;
        end;
    end;
    if v1404.entry_order ~= nil and #v1404.entry_order > 0 then
        for _, v1419 in v1404.entry_order do
            local v1420, v1421 = v0.writeTag(v1405, v1406, 4, v0.wireTypes.lengthDelimited);
            v1420, v1421 = v0.writeString(v1420, v1421, v1419);
            v1405 = v1420;
            v1406 = v1421;
        end;
    end;
    local v1422 = buffer.create(v1406);
    buffer.copy(v1422, 0, v1405, 0, v1406);
    return v1422;
end;
v4.decode = function(v1423) --[[ Line: 10401 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_48 (copy), v0 (copy), v2 (copy)
    local v1424 = l_v4_48.new();
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
                v1424.event_id = buffer.tostring(v1428);
            elseif v1426 == 2 then
                v1428 = nil;
                v1429, v1430 = v0.readBuffer(v1423, v1425);
                v1428 = v1429;
                v1425 = v1430;
                v1424.universe_id = buffer.tostring(v1428);
            elseif v1426 == 3 then
                v1428 = nil;
                v1429, v1430 = v0.readBuffer(v1423, v1425);
                v1428 = v1429;
                v1425 = v1430;
                v1429 = v2.EventDetailsFeedInputData_EntryMapEntry.decode(v1428);
                v1430 = v2.FeedEntry.new();
                v1424.entry_map[v1429.key or ""] = v1429.value or v1430;
            elseif v1426 == 4 then
                v1428 = nil;
                v1429, v1430 = v0.readBuffer(v1423, v1425);
                v1428 = v1429;
                v1425 = v1430;
                table.insert(v1424.entry_order, buffer.tostring(v1428));
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
v4.jsonEncode = function(v1431) --[[ Line: 10466 ]] --[[ Name: jsonEncode ]]
    local v1432 = {};
    if v1431.event_id ~= nil and v1431.event_id ~= "" then
        v1432.eventId = v1431.event_id;
    end;
    if v1431.universe_id ~= nil and v1431.universe_id ~= "" then
        v1432.universeId = v1431.universe_id;
    end;
    if v1431.entry_map ~= nil and next(v1431.entry_map) ~= nil then
        local v1433 = {};
        for v1434, v1435 in v1431.entry_map do
            v1433[v1434] = v1435:jsonEncode();
        end;
        v1432.entryMap = v1433;
    end;
    if v1431.entry_order ~= nil and #v1431.entry_order > 0 then
        local v1436 = {};
        for _, v1438 in v1431.entry_order do
            table.insert(v1436, v1438);
        end;
        v1432.entryOrder = v1436;
    end;
    return v1432;
end;
v4.jsonDecode = function(v1439) --[[ Line: 10496 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_48 (copy), v2 (copy)
    local v1440 = l_v4_48.new();
    if v1439.event_id ~= nil then
        v1440.event_id = v1439.event_id;
    end;
    if v1439.eventId ~= nil then
        v1440.event_id = v1439.eventId;
    end;
    if v1439.universe_id ~= nil then
        v1440.universe_id = v1439.universe_id;
    end;
    if v1439.universeId ~= nil then
        v1440.universe_id = v1439.universeId;
    end;
    if v1439.entry_map ~= nil then
        local v1441 = {};
        for v1442, v1443 in v1439.entry_map do
            v1441[v1442] = v2.FeedEntry.jsonDecode(v1443);
        end;
        v1440.entry_map = v1441;
    end;
    if v1439.entryMap ~= nil then
        local v1444 = {};
        for v1445, v1446 in v1439.entryMap do
            v1444[v1445] = v2.FeedEntry.jsonDecode(v1446);
        end;
        v1440.entry_map = v1444;
    end;
    if v1439.entry_order ~= nil then
        local v1447 = {};
        for _, v1449 in v1439.entry_order do
            table.insert(v1447, v1449);
        end;
        v1440.entry_order = v1447;
    end;
    if v1439.entryOrder ~= nil then
        local v1450 = {};
        for _, v1452 in v1439.entryOrder do
            table.insert(v1450, v1452);
        end;
        v1440.entry_order = v1450;
    end;
    return v1440;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
};
v2.EventDetailsFeedInputData = v4;
v1.default:register(v2.EventDetailsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_49 = v4 --[[ copy: 4 -> 54 ]];
v4.new = function(v1454) --[[ Line: 10568 ]] --[[ Name: new ]]
    -- upvalues: l_v4_49 (copy)
    return (setmetatable({
        key = (not (v1454 ~= nil) or v1454.key == nil) and "" or v1454.key, 
        value = if not (v1454 ~= nil) or v1454.value == nil then nil else v1454.value
    }, l_v4_49));
end;
v4.encode = function(v1455) --[[ Line: 10577 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1456 = buffer.create(0);
    local v1457 = 0;
    if v1455.key ~= nil and v1455.key ~= "" then
        local v1458, v1459 = v0.writeTag(v1456, v1457, 1, v0.wireTypes.lengthDelimited);
        v1458, v1459 = v0.writeString(v1458, v1459, v1455.key);
        v1456 = v1458;
        v1457 = v1459;
    end;
    if v1455.value ~= nil then
        local v1460 = v1455.value:encode();
        local v1461, v1462 = v0.writeTag(v1456, v1457, 2, v0.wireTypes.lengthDelimited);
        v1461, v1462 = v0.writeBuffer(v1461, v1462, v1460, buffer.len(v1460));
        v1456 = v1461;
        v1457 = v1462;
    end;
    local v1463 = buffer.create(v1457);
    buffer.copy(v1463, 0, v1456, 0, v1457);
    return v1463;
end;
v4.decode = function(v1464) --[[ Line: 10597 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_49 (copy), v0 (copy), v2 (copy)
    local v1465 = l_v4_49.new();
    local v1466 = 0;
    while v1466 < buffer.len(v1464) do
        local v1467 = nil;
        local v1468 = nil;
        local v1469, v1470, v1471 = v0.readTag(v1464, v1466);
        v1467 = v1469;
        v1468 = v1470;
        v1466 = v1471;
        if v1468 == v0.wireTypes.varint then
            v1469 = nil;
            v1470, v1471 = v0.readVarInt(v1464, v1466);
            v1469 = v1470;
            v1466 = v1471;
        elseif v1468 == v0.wireTypes.lengthDelimited then
            if v1467 == 1 then
                v1469 = nil;
                v1470, v1471 = v0.readBuffer(v1464, v1466);
                v1469 = v1470;
                v1466 = v1471;
                v1465.key = buffer.tostring(v1469);
            elseif v1467 == 2 then
                v1469 = nil;
                v1470, v1471 = v0.readBuffer(v1464, v1466);
                v1469 = v1470;
                v1466 = v1471;
                v1465.value = v2.FeedEntry.decode(v1469);
            else
                v1469 = nil;
                v1470, v1471 = v0.readVarInt(v1464, v1466);
                v1466 = v1471 + v1470;
            end;
        elseif v1468 == v0.wireTypes.i32 then
            v1469 = nil;
            v1470, v1471 = v0.readFixed32(v1464, v1466);
            v1469 = v1470;
            v1466 = v1471;
        elseif v1468 == v0.wireTypes.i64 then
            v1469 = nil;
            v1470, v1471 = v0.readFixed64(v1464, v1466);
            v1469 = v1470;
            v1466 = v1471;
        else
            error("Unsupported wire type: " .. v1468);
        end;
    end;
    return v1465;
end;
v4.jsonEncode = function(v1472) --[[ Line: 10645 ]] --[[ Name: jsonEncode ]]
    local v1473 = {};
    if v1472.key ~= nil and v1472.key ~= "" then
        v1473.key = v1472.key;
    end;
    if v1472.value ~= nil then
        v1473.value = v1472.value:jsonEncode();
    end;
    return v1473;
end;
v4.jsonDecode = function(v1474) --[[ Line: 10659 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_49 (copy), v2 (copy)
    local v1475 = l_v4_49.new();
    if v1474.key ~= nil then
        v1475.key = v1474.key;
    end;
    if v1474.value ~= nil then
        v1475.value = v2.FeedEntry.jsonDecode(v1474.value);
    end;
    return v1475;
end;
v4.descriptor = {
    name = "EventDetailsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.EventDetailsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.EventDetailsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_50 = v4 --[[ copy: 4 -> 55 ]];
v4.new = function(v1477) --[[ Line: 10689 ]] --[[ Name: new ]]
    -- upvalues: l_v4_50 (copy)
    return (setmetatable({
        event_id = (not (v1477 ~= nil) or v1477.event_id == nil) and "" or v1477.event_id, 
        universe_id = (not (v1477 ~= nil) or v1477.universe_id == nil) and "" or v1477.universe_id
    }, l_v4_50));
end;
v4.encode = function(v1478) --[[ Line: 10698 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1479 = buffer.create(0);
    local v1480 = 0;
    if v1478.event_id ~= nil and v1478.event_id ~= "" then
        local v1481, v1482 = v0.writeTag(v1479, v1480, 1, v0.wireTypes.lengthDelimited);
        v1481, v1482 = v0.writeString(v1481, v1482, v1478.event_id);
        v1479 = v1481;
        v1480 = v1482;
    end;
    if v1478.universe_id ~= nil and v1478.universe_id ~= "" then
        local v1483, v1484 = v0.writeTag(v1479, v1480, 2, v0.wireTypes.lengthDelimited);
        v1483, v1484 = v0.writeString(v1483, v1484, v1478.universe_id);
        v1479 = v1483;
        v1480 = v1484;
    end;
    local v1485 = buffer.create(v1480);
    buffer.copy(v1485, 0, v1479, 0, v1480);
    return v1485;
end;
v4.decode = function(v1486) --[[ Line: 10717 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_50 (copy), v0 (copy)
    local v1487 = l_v4_50.new();
    local v1488 = 0;
    while v1488 < buffer.len(v1486) do
        local v1489 = nil;
        local v1490 = nil;
        local v1491, v1492, v1493 = v0.readTag(v1486, v1488);
        v1489 = v1491;
        v1490 = v1492;
        v1488 = v1493;
        if v1490 == v0.wireTypes.varint then
            v1491 = nil;
            v1492, v1493 = v0.readVarInt(v1486, v1488);
            v1491 = v1492;
            v1488 = v1493;
        elseif v1490 == v0.wireTypes.lengthDelimited then
            if v1489 == 1 then
                v1491 = nil;
                v1492, v1493 = v0.readBuffer(v1486, v1488);
                v1491 = v1492;
                v1488 = v1493;
                v1487.event_id = buffer.tostring(v1491);
            elseif v1489 == 2 then
                v1491 = nil;
                v1492, v1493 = v0.readBuffer(v1486, v1488);
                v1491 = v1492;
                v1488 = v1493;
                v1487.universe_id = buffer.tostring(v1491);
            else
                v1491 = nil;
                v1492, v1493 = v0.readVarInt(v1486, v1488);
                v1488 = v1493 + v1492;
            end;
        elseif v1490 == v0.wireTypes.i32 then
            v1491 = nil;
            v1492, v1493 = v0.readFixed32(v1486, v1488);
            v1491 = v1492;
            v1488 = v1493;
        elseif v1490 == v0.wireTypes.i64 then
            v1491 = nil;
            v1492, v1493 = v0.readFixed64(v1486, v1488);
            v1491 = v1492;
            v1488 = v1493;
        else
            error("Unsupported wire type: " .. v1490);
        end;
    end;
    return v1487;
end;
v4.jsonEncode = function(v1494) --[[ Line: 10765 ]] --[[ Name: jsonEncode ]]
    local v1495 = {};
    if v1494.event_id ~= nil and v1494.event_id ~= "" then
        v1495.eventId = v1494.event_id;
    end;
    if v1494.universe_id ~= nil and v1494.universe_id ~= "" then
        v1495.universeId = v1494.universe_id;
    end;
    return v1495;
end;
v4.jsonDecode = function(v1496) --[[ Line: 10779 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_50 (copy)
    local v1497 = l_v4_50.new();
    if v1496.event_id ~= nil then
        v1497.event_id = v1496.event_id;
    end;
    if v1496.eventId ~= nil then
        v1497.event_id = v1496.eventId;
    end;
    if v1496.universe_id ~= nil then
        v1497.universe_id = v1496.universe_id;
    end;
    if v1496.universeId ~= nil then
        v1497.universe_id = v1496.universeId;
    end;
    return v1497;
end;
v4.descriptor = {
    name = "EventDetailsActionBarInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
};
v2.EventDetailsActionBarInputData = v4;
v1.default:register(v2.EventDetailsActionBarInputData);
v4 = {};
v4.__index = v4;
local l_v4_51 = v4 --[[ copy: 4 -> 56 ]];
v4.new = function(v1499) --[[ Line: 10815 ]] --[[ Name: new ]]
    -- upvalues: l_v4_51 (copy)
    return (setmetatable({
        event_id = (not (v1499 ~= nil) or v1499.event_id == nil) and "" or v1499.event_id
    }, l_v4_51));
end;
v4.encode = function(v1500) --[[ Line: 10823 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1501 = buffer.create(0);
    local v1502 = 0;
    if v1500.event_id ~= nil and v1500.event_id ~= "" then
        local v1503, v1504 = v0.writeTag(v1501, v1502, 1, v0.wireTypes.lengthDelimited);
        v1503, v1504 = v0.writeString(v1503, v1504, v1500.event_id);
        v1501 = v1503;
        v1502 = v1504;
    end;
    local v1505 = buffer.create(v1502);
    buffer.copy(v1505, 0, v1501, 0, v1502);
    return v1505;
end;
v4.decode = function(v1506) --[[ Line: 10837 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_51 (copy), v0 (copy)
    local v1507 = l_v4_51.new();
    local v1508 = 0;
    while v1508 < buffer.len(v1506) do
        local v1509 = nil;
        local v1510 = nil;
        local v1511, v1512, v1513 = v0.readTag(v1506, v1508);
        v1509 = v1511;
        v1510 = v1512;
        v1508 = v1513;
        if v1510 == v0.wireTypes.varint then
            v1511 = nil;
            v1512, v1513 = v0.readVarInt(v1506, v1508);
            v1511 = v1512;
            v1508 = v1513;
        elseif v1510 == v0.wireTypes.lengthDelimited then
            if v1509 == 1 then
                v1511 = nil;
                v1512, v1513 = v0.readBuffer(v1506, v1508);
                v1511 = v1512;
                v1508 = v1513;
                v1507.event_id = buffer.tostring(v1511);
            else
                v1511 = nil;
                v1512, v1513 = v0.readVarInt(v1506, v1508);
                v1508 = v1513 + v1512;
            end;
        elseif v1510 == v0.wireTypes.i32 then
            v1511 = nil;
            v1512, v1513 = v0.readFixed32(v1506, v1508);
            v1511 = v1512;
            v1508 = v1513;
        elseif v1510 == v0.wireTypes.i64 then
            v1511 = nil;
            v1512, v1513 = v0.readFixed64(v1506, v1508);
            v1511 = v1512;
            v1508 = v1513;
        else
            error("Unsupported wire type: " .. v1510);
        end;
    end;
    return v1507;
end;
v4.jsonEncode = function(v1514) --[[ Line: 10880 ]] --[[ Name: jsonEncode ]]
    local v1515 = {};
    if v1514.event_id ~= nil and v1514.event_id ~= "" then
        v1515.eventId = v1514.event_id;
    end;
    return v1515;
end;
v4.jsonDecode = function(v1516) --[[ Line: 10890 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_51 (copy)
    local v1517 = l_v4_51.new();
    if v1516.event_id ~= nil then
        v1517.event_id = v1516.event_id;
    end;
    if v1516.eventId ~= nil then
        v1517.event_id = v1516.eventId;
    end;
    return v1517;
end;
v4.descriptor = {
    name = "EventDescriptionInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
};
v2.EventDescriptionInputData = v4;
v1.default:register(v2.EventDescriptionInputData);
v4 = {};
v4.__index = v4;
local l_v4_52 = v4 --[[ copy: 4 -> 57 ]];
v4.new = function(v1519) --[[ Line: 10918 ]] --[[ Name: new ]]
    -- upvalues: l_v4_52 (copy)
    return (setmetatable({
        event_id = (not (v1519 ~= nil) or v1519.event_id == nil) and "" or v1519.event_id, 
        universe_id = (not (v1519 ~= nil) or v1519.universe_id == nil) and "" or v1519.universe_id
    }, l_v4_52));
end;
v4.encode = function(v1520) --[[ Line: 10927 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1521 = buffer.create(0);
    local v1522 = 0;
    if v1520.event_id ~= nil and v1520.event_id ~= "" then
        local v1523, v1524 = v0.writeTag(v1521, v1522, 1, v0.wireTypes.lengthDelimited);
        v1523, v1524 = v0.writeString(v1523, v1524, v1520.event_id);
        v1521 = v1523;
        v1522 = v1524;
    end;
    if v1520.universe_id ~= nil and v1520.universe_id ~= "" then
        local v1525, v1526 = v0.writeTag(v1521, v1522, 2, v0.wireTypes.lengthDelimited);
        v1525, v1526 = v0.writeString(v1525, v1526, v1520.universe_id);
        v1521 = v1525;
        v1522 = v1526;
    end;
    local v1527 = buffer.create(v1522);
    buffer.copy(v1527, 0, v1521, 0, v1522);
    return v1527;
end;
v4.decode = function(v1528) --[[ Line: 10946 ]] --[[ Name: decode ]]
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
                v1529.event_id = buffer.tostring(v1533);
            elseif v1531 == 2 then
                v1533 = nil;
                v1534, v1535 = v0.readBuffer(v1528, v1530);
                v1533 = v1534;
                v1530 = v1535;
                v1529.universe_id = buffer.tostring(v1533);
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
v4.jsonEncode = function(v1536) --[[ Line: 10994 ]] --[[ Name: jsonEncode ]]
    local v1537 = {};
    if v1536.event_id ~= nil and v1536.event_id ~= "" then
        v1537.eventId = v1536.event_id;
    end;
    if v1536.universe_id ~= nil and v1536.universe_id ~= "" then
        v1537.universeId = v1536.universe_id;
    end;
    return v1537;
end;
v4.jsonDecode = function(v1538) --[[ Line: 11008 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_52 (copy)
    local v1539 = l_v4_52.new();
    if v1538.event_id ~= nil then
        v1539.event_id = v1538.event_id;
    end;
    if v1538.eventId ~= nil then
        v1539.event_id = v1538.eventId;
    end;
    if v1538.universe_id ~= nil then
        v1539.universe_id = v1538.universe_id;
    end;
    if v1538.universeId ~= nil then
        v1539.universe_id = v1538.universeId;
    end;
    return v1539;
end;
v4.descriptor = {
    name = "EventAttributionRowInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
};
v2.EventAttributionRowInputData = v4;
v1.default:register(v2.EventAttributionRowInputData);
v4 = {};
v4.__index = v4;
local l_v4_53 = v4 --[[ copy: 4 -> 58 ]];
v4.new = function(v1541) --[[ Line: 11044 ]] --[[ Name: new ]]
    -- upvalues: l_v4_53 (copy)
    return (setmetatable({
        event_id = (not (v1541 ~= nil) or v1541.event_id == nil) and "" or v1541.event_id
    }, l_v4_53));
end;
v4.encode = function(v1542) --[[ Line: 11050 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1543 = buffer.create(0);
    local v1544 = 0;
    if v1542.event_id ~= nil and v1542.event_id ~= "" then
        local v1545, v1546 = v0.writeTag(v1543, v1544, 1, v0.wireTypes.lengthDelimited);
        v1545, v1546 = v0.writeString(v1545, v1546, v1542.event_id);
        v1543 = v1545;
        v1544 = v1546;
    end;
    local v1547 = buffer.create(v1544);
    buffer.copy(v1547, 0, v1543, 0, v1544);
    return v1547;
end;
v4.decode = function(v1548) --[[ Line: 11064 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_53 (copy), v0 (copy)
    local v1549 = l_v4_53.new();
    local v1550 = 0;
    while v1550 < buffer.len(v1548) do
        local v1551 = nil;
        local v1552 = nil;
        local v1553, v1554, v1555 = v0.readTag(v1548, v1550);
        v1551 = v1553;
        v1552 = v1554;
        v1550 = v1555;
        if v1552 == v0.wireTypes.varint then
            v1553 = nil;
            v1554, v1555 = v0.readVarInt(v1548, v1550);
            v1553 = v1554;
            v1550 = v1555;
        elseif v1552 == v0.wireTypes.lengthDelimited then
            if v1551 == 1 then
                v1553 = nil;
                v1554, v1555 = v0.readBuffer(v1548, v1550);
                v1553 = v1554;
                v1550 = v1555;
                v1549.event_id = buffer.tostring(v1553);
            else
                v1553 = nil;
                v1554, v1555 = v0.readVarInt(v1548, v1550);
                v1550 = v1555 + v1554;
            end;
        elseif v1552 == v0.wireTypes.i32 then
            v1553 = nil;
            v1554, v1555 = v0.readFixed32(v1548, v1550);
            v1553 = v1554;
            v1550 = v1555;
        elseif v1552 == v0.wireTypes.i64 then
            v1553 = nil;
            v1554, v1555 = v0.readFixed64(v1548, v1550);
            v1553 = v1554;
            v1550 = v1555;
        else
            error("Unsupported wire type: " .. v1552);
        end;
    end;
    return v1549;
end;
v4.jsonEncode = function(v1556) --[[ Line: 11107 ]] --[[ Name: jsonEncode ]]
    local v1557 = {};
    if v1556.event_id ~= nil and v1556.event_id ~= "" then
        v1557.eventId = v1556.event_id;
    end;
    return v1557;
end;
v4.jsonDecode = function(v1558) --[[ Line: 11117 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_53 (copy)
    local v1559 = l_v4_53.new();
    if v1558.event_id ~= nil then
        v1559.event_id = v1558.event_id;
    end;
    if v1558.eventId ~= nil then
        v1559.event_id = v1558.eventId;
    end;
    return v1559;
end;
v4.descriptor = {
    name = "EventInfoTableInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
};
v2.EventInfoTableInputData = v4;
v1.default:register(v2.EventInfoTableInputData);
v4 = {};
v4.__index = v4;
local l_v4_54 = v4 --[[ copy: 4 -> 59 ]];
v4.new = function(v1561) --[[ Line: 11145 ]] --[[ Name: new ]]
    -- upvalues: l_v4_54 (copy)
    return (setmetatable({
        entry_map = if not (v1561 ~= nil) or v1561.entry_map == nil then {} else v1561.entry_map, 
        entry_order = if not (v1561 ~= nil) or v1561.entry_order == nil then {} else v1561.entry_order, 
        next_page_token = (not (v1561 ~= nil) or v1561.next_page_token == nil) and "" or v1561.next_page_token, 
        sticky_filter_pills = if not (v1561 ~= nil) or v1561.sticky_filter_pills == nil then nil else v1561.sticky_filter_pills, 
        applied_filters = (not (v1561 ~= nil) or v1561.applied_filters == nil) and "" or v1561.applied_filters
    }, l_v4_54));
end;
v4.encode = function(v1562) --[[ Line: 11157 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1563 = buffer.create(0);
    local v1564 = 0;
    if v1562.entry_map ~= nil and next(v1562.entry_map) ~= nil then
        for v1565, v1566 in v1562.entry_map do
            local v1567 = buffer.create(0);
            local v1568, v1569 = v0.writeTag(v1567, 0, 1, v0.wireTypes.lengthDelimited);
            v1568, v1569 = v0.writeString(v1568, v1569, v1565);
            v1567 = v1568;
            local l_v1569_0 = v1569;
            v1568 = v1566:encode();
            local v1571;
            v1569, v1571 = v0.writeTag(v1567, l_v1569_0, 2, v0.wireTypes.lengthDelimited);
            v1569, v1571 = v0.writeBuffer(v1569, v1571, v1568, buffer.len(v1568));
            v1567 = v1569;
            l_v1569_0 = v1571;
            v1569, v1571 = v0.writeTag(v1563, v1564, 1, v0.wireTypes.lengthDelimited);
            v1569, v1571 = v0.writeBuffer(v1569, v1571, v1567, l_v1569_0);
            v1563 = v1569;
            v1564 = v1571;
        end;
    end;
    if v1562.entry_order ~= nil and #v1562.entry_order > 0 then
        for _, v1573 in v1562.entry_order do
            local v1574, v1575 = v0.writeTag(v1563, v1564, 2, v0.wireTypes.lengthDelimited);
            v1574, v1575 = v0.writeString(v1574, v1575, v1573);
            v1563 = v1574;
            v1564 = v1575;
        end;
    end;
    if v1562.next_page_token ~= nil and v1562.next_page_token ~= "" then
        local v1576, v1577 = v0.writeTag(v1563, v1564, 3, v0.wireTypes.lengthDelimited);
        v1576, v1577 = v0.writeString(v1576, v1577, v1562.next_page_token);
        v1563 = v1576;
        v1564 = v1577;
    end;
    if v1562.sticky_filter_pills ~= nil then
        local v1578 = v1562.sticky_filter_pills:encode();
        local v1579, v1580 = v0.writeTag(v1563, v1564, 4, v0.wireTypes.lengthDelimited);
        v1579, v1580 = v0.writeBuffer(v1579, v1580, v1578, buffer.len(v1578));
        v1563 = v1579;
        v1564 = v1580;
    end;
    if v1562.applied_filters ~= nil and v1562.applied_filters ~= "" then
        local v1581, v1582 = v0.writeTag(v1563, v1564, 5, v0.wireTypes.lengthDelimited);
        v1581, v1582 = v0.writeString(v1581, v1582, v1562.applied_filters);
        v1563 = v1581;
        v1564 = v1582;
    end;
    local v1583 = buffer.create(v1564);
    buffer.copy(v1583, 0, v1563, 0, v1564);
    return v1583;
end;
v4.decode = function(v1584) --[[ Line: 11203 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_54 (copy), v0 (copy), v2 (copy)
    local v1585 = l_v4_54.new();
    local v1586 = 0;
    while v1586 < buffer.len(v1584) do
        local v1587 = nil;
        local v1588 = nil;
        local v1589, v1590, v1591 = v0.readTag(v1584, v1586);
        v1587 = v1589;
        v1588 = v1590;
        v1586 = v1591;
        if v1588 == v0.wireTypes.varint then
            v1589 = nil;
            v1590, v1591 = v0.readVarInt(v1584, v1586);
            v1589 = v1590;
            v1586 = v1591;
        elseif v1588 == v0.wireTypes.lengthDelimited then
            if v1587 == 1 then
                v1589 = nil;
                v1590, v1591 = v0.readBuffer(v1584, v1586);
                v1589 = v1590;
                v1586 = v1591;
                v1590 = v2.ChartsFeedInputData_EntryMapEntry.decode(v1589);
                v1591 = v2.FeedEntry.new();
                v1585.entry_map[v1590.key or ""] = v1590.value or v1591;
            elseif v1587 == 2 then
                v1589 = nil;
                v1590, v1591 = v0.readBuffer(v1584, v1586);
                v1589 = v1590;
                v1586 = v1591;
                table.insert(v1585.entry_order, buffer.tostring(v1589));
            elseif v1587 == 3 then
                v1589 = nil;
                v1590, v1591 = v0.readBuffer(v1584, v1586);
                v1589 = v1590;
                v1586 = v1591;
                v1585.next_page_token = buffer.tostring(v1589);
            elseif v1587 == 4 then
                v1589 = nil;
                v1590, v1591 = v0.readBuffer(v1584, v1586);
                v1589 = v1590;
                v1586 = v1591;
                v1585.sticky_filter_pills = v2.FilterPillsInputData.decode(v1589);
            elseif v1587 == 5 then
                v1589 = nil;
                v1590, v1591 = v0.readBuffer(v1584, v1586);
                v1589 = v1590;
                v1586 = v1591;
                v1585.applied_filters = buffer.tostring(v1589);
            else
                v1589 = nil;
                v1590, v1591 = v0.readVarInt(v1584, v1586);
                v1586 = v1591 + v1590;
            end;
        elseif v1588 == v0.wireTypes.i32 then
            v1589 = nil;
            v1590, v1591 = v0.readFixed32(v1584, v1586);
            v1589 = v1590;
            v1586 = v1591;
        elseif v1588 == v0.wireTypes.i64 then
            v1589 = nil;
            v1590, v1591 = v0.readFixed64(v1584, v1586);
            v1589 = v1590;
            v1586 = v1591;
        else
            error("Unsupported wire type: " .. v1588);
        end;
    end;
    return v1585;
end;
v4.jsonEncode = function(v1592) --[[ Line: 11273 ]] --[[ Name: jsonEncode ]]
    local v1593 = {};
    if v1592.entry_map ~= nil and next(v1592.entry_map) ~= nil then
        local v1594 = {};
        for v1595, v1596 in v1592.entry_map do
            v1594[v1595] = v1596:jsonEncode();
        end;
        v1593.entryMap = v1594;
    end;
    if v1592.entry_order ~= nil and #v1592.entry_order > 0 then
        local v1597 = {};
        for _, v1599 in v1592.entry_order do
            table.insert(v1597, v1599);
        end;
        v1593.entryOrder = v1597;
    end;
    if v1592.next_page_token ~= nil and v1592.next_page_token ~= "" then
        v1593.nextPageToken = v1592.next_page_token;
    end;
    if v1592.sticky_filter_pills ~= nil then
        v1593.stickyFilterPills = v1592.sticky_filter_pills:jsonEncode();
    end;
    if v1592.applied_filters ~= nil and v1592.applied_filters ~= "" then
        v1593.appliedFilters = v1592.applied_filters;
    end;
    return v1593;
end;
v4.jsonDecode = function(v1600) --[[ Line: 11307 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_54 (copy), v2 (copy)
    local v1601 = l_v4_54.new();
    if v1600.entry_map ~= nil then
        local v1602 = {};
        for v1603, v1604 in v1600.entry_map do
            v1602[v1603] = v2.FeedEntry.jsonDecode(v1604);
        end;
        v1601.entry_map = v1602;
    end;
    if v1600.entryMap ~= nil then
        local v1605 = {};
        for v1606, v1607 in v1600.entryMap do
            v1605[v1606] = v2.FeedEntry.jsonDecode(v1607);
        end;
        v1601.entry_map = v1605;
    end;
    if v1600.entry_order ~= nil then
        local v1608 = {};
        for _, v1610 in v1600.entry_order do
            table.insert(v1608, v1610);
        end;
        v1601.entry_order = v1608;
    end;
    if v1600.entryOrder ~= nil then
        local v1611 = {};
        for _, v1613 in v1600.entryOrder do
            table.insert(v1611, v1613);
        end;
        v1601.entry_order = v1611;
    end;
    if v1600.next_page_token ~= nil then
        v1601.next_page_token = v1600.next_page_token;
    end;
    if v1600.nextPageToken ~= nil then
        v1601.next_page_token = v1600.nextPageToken;
    end;
    if v1600.sticky_filter_pills ~= nil then
        v1601.sticky_filter_pills = v2.FilterPillsInputData.jsonDecode(v1600.sticky_filter_pills);
    end;
    if v1600.stickyFilterPills ~= nil then
        v1601.sticky_filter_pills = v2.FilterPillsInputData.jsonDecode(v1600.stickyFilterPills);
    end;
    if v1600.applied_filters ~= nil then
        v1601.applied_filters = v1600.applied_filters;
    end;
    if v1600.appliedFilters ~= nil then
        v1601.applied_filters = v1600.appliedFilters;
    end;
    return v1601;
end;
v4.descriptor = {
    name = "ChartsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
};
v2.ChartsFeedInputData = v4;
v1.default:register(v2.ChartsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_55 = v4 --[[ copy: 4 -> 60 ]];
v4.new = function(v1615) --[[ Line: 11387 ]] --[[ Name: new ]]
    -- upvalues: l_v4_55 (copy)
    return (setmetatable({
        key = (not (v1615 ~= nil) or v1615.key == nil) and "" or v1615.key, 
        value = if not (v1615 ~= nil) or v1615.value == nil then nil else v1615.value
    }, l_v4_55));
end;
v4.encode = function(v1616) --[[ Line: 11396 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1617 = buffer.create(0);
    local v1618 = 0;
    if v1616.key ~= nil and v1616.key ~= "" then
        local v1619, v1620 = v0.writeTag(v1617, v1618, 1, v0.wireTypes.lengthDelimited);
        v1619, v1620 = v0.writeString(v1619, v1620, v1616.key);
        v1617 = v1619;
        v1618 = v1620;
    end;
    if v1616.value ~= nil then
        local v1621 = v1616.value:encode();
        local v1622, v1623 = v0.writeTag(v1617, v1618, 2, v0.wireTypes.lengthDelimited);
        v1622, v1623 = v0.writeBuffer(v1622, v1623, v1621, buffer.len(v1621));
        v1617 = v1622;
        v1618 = v1623;
    end;
    local v1624 = buffer.create(v1618);
    buffer.copy(v1624, 0, v1617, 0, v1618);
    return v1624;
end;
v4.decode = function(v1625) --[[ Line: 11416 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_55 (copy), v0 (copy), v2 (copy)
    local v1626 = l_v4_55.new();
    local v1627 = 0;
    while v1627 < buffer.len(v1625) do
        local v1628 = nil;
        local v1629 = nil;
        local v1630, v1631, v1632 = v0.readTag(v1625, v1627);
        v1628 = v1630;
        v1629 = v1631;
        v1627 = v1632;
        if v1629 == v0.wireTypes.varint then
            v1630 = nil;
            v1631, v1632 = v0.readVarInt(v1625, v1627);
            v1630 = v1631;
            v1627 = v1632;
        elseif v1629 == v0.wireTypes.lengthDelimited then
            if v1628 == 1 then
                v1630 = nil;
                v1631, v1632 = v0.readBuffer(v1625, v1627);
                v1630 = v1631;
                v1627 = v1632;
                v1626.key = buffer.tostring(v1630);
            elseif v1628 == 2 then
                v1630 = nil;
                v1631, v1632 = v0.readBuffer(v1625, v1627);
                v1630 = v1631;
                v1627 = v1632;
                v1626.value = v2.FeedEntry.decode(v1630);
            else
                v1630 = nil;
                v1631, v1632 = v0.readVarInt(v1625, v1627);
                v1627 = v1632 + v1631;
            end;
        elseif v1629 == v0.wireTypes.i32 then
            v1630 = nil;
            v1631, v1632 = v0.readFixed32(v1625, v1627);
            v1630 = v1631;
            v1627 = v1632;
        elseif v1629 == v0.wireTypes.i64 then
            v1630 = nil;
            v1631, v1632 = v0.readFixed64(v1625, v1627);
            v1630 = v1631;
            v1627 = v1632;
        else
            error("Unsupported wire type: " .. v1629);
        end;
    end;
    return v1626;
end;
v4.jsonEncode = function(v1633) --[[ Line: 11464 ]] --[[ Name: jsonEncode ]]
    local v1634 = {};
    if v1633.key ~= nil and v1633.key ~= "" then
        v1634.key = v1633.key;
    end;
    if v1633.value ~= nil then
        v1634.value = v1633.value:jsonEncode();
    end;
    return v1634;
end;
v4.jsonDecode = function(v1635) --[[ Line: 11478 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_55 (copy), v2 (copy)
    local v1636 = l_v4_55.new();
    if v1635.key ~= nil then
        v1636.key = v1635.key;
    end;
    if v1635.value ~= nil then
        v1636.value = v2.FeedEntry.jsonDecode(v1635.value);
    end;
    return v1636;
end;
v4.descriptor = {
    name = "ChartsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.ChartsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.ChartsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_56 = v4 --[[ copy: 4 -> 61 ]];
v4.new = function(v1638) --[[ Line: 11508 ]] --[[ Name: new ]]
    -- upvalues: l_v4_56 (copy)
    return (setmetatable({
        filter_groups = if not (v1638 ~= nil) or v1638.filter_groups == nil then {} else v1638.filter_groups, 
        sort_id = (not (v1638 ~= nil) or v1638.sort_id == nil) and "" or v1638.sort_id, 
        secondary_sort_id = (not (v1638 ~= nil) or v1638.secondary_sort_id == nil) and 0 or v1638.secondary_sort_id, 
        title = (not (v1638 ~= nil) or v1638.title == nil) and "" or v1638.title
    }, l_v4_56));
end;
v4.encode = function(v1639) --[[ Line: 11517 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1640 = buffer.create(0);
    local v1641 = 0;
    if v1639.filter_groups ~= nil and #v1639.filter_groups > 0 then
        for _, v1643 in v1639.filter_groups do
            local v1644 = v1643:encode();
            local v1645, v1646 = v0.writeTag(v1640, v1641, 1, v0.wireTypes.lengthDelimited);
            v1645, v1646 = v0.writeBuffer(v1645, v1646, v1644, buffer.len(v1644));
            v1640 = v1645;
            v1641 = v1646;
        end;
    end;
    if v1639.sort_id ~= nil and v1639.sort_id ~= "" then
        local v1647, v1648 = v0.writeTag(v1640, v1641, 2, v0.wireTypes.lengthDelimited);
        v1647, v1648 = v0.writeString(v1647, v1648, v1639.sort_id);
        v1640 = v1647;
        v1641 = v1648;
    end;
    if v1639.secondary_sort_id ~= nil and v1639.secondary_sort_id ~= 0 then
        local v1649, v1650 = v0.writeTag(v1640, v1641, 3, v0.wireTypes.varint);
        v1649, v1650 = v0.writeVarInt(v1649, v1650, v1639.secondary_sort_id);
        v1640 = v1649;
        v1641 = v1650;
    end;
    if v1639.title ~= nil and v1639.title ~= "" then
        local v1651, v1652 = v0.writeTag(v1640, v1641, 4, v0.wireTypes.lengthDelimited);
        v1651, v1652 = v0.writeString(v1651, v1652, v1639.title);
        v1640 = v1651;
        v1641 = v1652;
    end;
    local v1653 = buffer.create(v1641);
    buffer.copy(v1653, 0, v1640, 0, v1641);
    return v1653;
end;
v4.decode = function(v1654) --[[ Line: 11549 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_56 (copy), v0 (copy), v2 (copy)
    local v1655 = l_v4_56.new();
    local v1656 = 0;
    while v1656 < buffer.len(v1654) do
        local v1657 = nil;
        local v1658 = nil;
        local v1659, v1660, v1661 = v0.readTag(v1654, v1656);
        v1657 = v1659;
        v1658 = v1660;
        v1656 = v1661;
        if v1658 == v0.wireTypes.varint then
            if v1657 == 3 then
                v1659 = nil;
                v1660, v1661 = v0.readVarIntI32(v1654, v1656);
                v1659 = v1660;
                v1656 = v1661;
                v1655.secondary_sort_id = v1659;
            else
                v1659 = nil;
                v1660, v1661 = v0.readVarInt(v1654, v1656);
                v1659 = v1660;
                v1656 = v1661;
            end;
        elseif v1658 == v0.wireTypes.lengthDelimited then
            if v1657 == 1 then
                v1659 = nil;
                v1660, v1661 = v0.readBuffer(v1654, v1656);
                v1659 = v1660;
                v1656 = v1661;
                table.insert(v1655.filter_groups, v2.FilterPillsInputData_FilterGroup.decode(v1659));
            elseif v1657 == 2 then
                v1659 = nil;
                v1660, v1661 = v0.readBuffer(v1654, v1656);
                v1659 = v1660;
                v1656 = v1661;
                v1655.sort_id = buffer.tostring(v1659);
            elseif v1657 == 4 then
                v1659 = nil;
                v1660, v1661 = v0.readBuffer(v1654, v1656);
                v1659 = v1660;
                v1656 = v1661;
                v1655.title = buffer.tostring(v1659);
            else
                v1659 = nil;
                v1660, v1661 = v0.readVarInt(v1654, v1656);
                v1656 = v1661 + v1660;
            end;
        elseif v1658 == v0.wireTypes.i32 then
            v1659 = nil;
            v1660, v1661 = v0.readFixed32(v1654, v1656);
            v1659 = v1660;
            v1656 = v1661;
        elseif v1658 == v0.wireTypes.i64 then
            v1659 = nil;
            v1660, v1661 = v0.readFixed64(v1654, v1656);
            v1659 = v1660;
            v1656 = v1661;
        else
            error("Unsupported wire type: " .. v1658);
        end;
    end;
    return v1655;
end;
v4.jsonEncode = function(v1662) --[[ Line: 11607 ]] --[[ Name: jsonEncode ]]
    local v1663 = {};
    if v1662.filter_groups ~= nil and #v1662.filter_groups > 0 then
        local v1664 = {};
        for _, v1666 in v1662.filter_groups do
            table.insert(v1664, v1666:jsonEncode());
        end;
        v1663.filterGroups = v1664;
    end;
    if v1662.sort_id ~= nil and v1662.sort_id ~= "" then
        v1663.sortId = v1662.sort_id;
    end;
    if v1662.secondary_sort_id ~= nil and v1662.secondary_sort_id ~= 0 then
        v1663.secondarySortId = v1662.secondary_sort_id;
    end;
    if v1662.title ~= nil and v1662.title ~= "" then
        v1663.title = v1662.title;
    end;
    return v1663;
end;
v4.jsonDecode = function(v1667) --[[ Line: 11633 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_56 (copy), v2 (copy)
    local v1668 = l_v4_56.new();
    if v1667.filter_groups ~= nil then
        local v1669 = {};
        for _, v1671 in v1667.filter_groups do
            table.insert(v1669, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1671));
        end;
        v1668.filter_groups = v1669;
    end;
    if v1667.filterGroups ~= nil then
        local v1672 = {};
        for _, v1674 in v1667.filterGroups do
            table.insert(v1672, v2.FilterPillsInputData_FilterGroup.jsonDecode(v1674));
        end;
        v1668.filter_groups = v1672;
    end;
    if v1667.sort_id ~= nil then
        v1668.sort_id = v1667.sort_id;
    end;
    if v1667.sortId ~= nil then
        v1668.sort_id = v1667.sortId;
    end;
    if v1667.secondary_sort_id ~= nil then
        v1668.secondary_sort_id = v1667.secondary_sort_id;
    end;
    if v1667.secondarySortId ~= nil then
        v1668.secondary_sort_id = v1667.secondarySortId;
    end;
    if v1667.title ~= nil then
        v1668.title = v1667.title;
    end;
    return v1668;
end;
v4.descriptor = {
    name = "FilterPillsInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
};
v2.FilterPillsInputData = v4;
v1.default:register(v2.FilterPillsInputData);
v4 = {};
v4.__index = v4;
local l_v4_57 = v4 --[[ copy: 4 -> 62 ]];
v4.new = function(v1676) --[[ Line: 11691 ]] --[[ Name: new ]]
    -- upvalues: l_v4_57 (copy)
    return (setmetatable({
        filter_id = (not (v1676 ~= nil) or v1676.filter_id == nil) and "" or v1676.filter_id, 
        display_name = (not (v1676 ~= nil) or v1676.display_name == nil) and "" or v1676.display_name, 
        options = if not (v1676 ~= nil) or v1676.options == nil then {} else v1676.options, 
        default_option_id = (not (v1676 ~= nil) or v1676.default_option_id == nil) and "" or v1676.default_option_id, 
        selected_option_id = (not (v1676 ~= nil) or v1676.selected_option_id == nil) and "" or v1676.selected_option_id, 
        filter_type = (not (v1676 ~= nil) or v1676.filter_type == nil) and "" or v1676.filter_type, 
        inactive_option_ids = if not (v1676 ~= nil) or v1676.inactive_option_ids == nil then {} else v1676.inactive_option_ids
    }, l_v4_57));
end;
v4.encode = function(v1677) --[[ Line: 11707 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1678 = buffer.create(0);
    local v1679 = 0;
    if v1677.filter_id ~= nil and v1677.filter_id ~= "" then
        local v1680, v1681 = v0.writeTag(v1678, v1679, 1, v0.wireTypes.lengthDelimited);
        v1680, v1681 = v0.writeString(v1680, v1681, v1677.filter_id);
        v1678 = v1680;
        v1679 = v1681;
    end;
    if v1677.display_name ~= nil and v1677.display_name ~= "" then
        local v1682, v1683 = v0.writeTag(v1678, v1679, 2, v0.wireTypes.lengthDelimited);
        v1682, v1683 = v0.writeString(v1682, v1683, v1677.display_name);
        v1678 = v1682;
        v1679 = v1683;
    end;
    if v1677.options ~= nil and #v1677.options > 0 then
        for _, v1685 in v1677.options do
            local v1686 = v1685:encode();
            local v1687, v1688 = v0.writeTag(v1678, v1679, 3, v0.wireTypes.lengthDelimited);
            v1687, v1688 = v0.writeBuffer(v1687, v1688, v1686, buffer.len(v1686));
            v1678 = v1687;
            v1679 = v1688;
        end;
    end;
    if v1677.default_option_id ~= nil and v1677.default_option_id ~= "" then
        local v1689, v1690 = v0.writeTag(v1678, v1679, 4, v0.wireTypes.lengthDelimited);
        v1689, v1690 = v0.writeString(v1689, v1690, v1677.default_option_id);
        v1678 = v1689;
        v1679 = v1690;
    end;
    if v1677.selected_option_id ~= nil and v1677.selected_option_id ~= "" then
        local v1691, v1692 = v0.writeTag(v1678, v1679, 5, v0.wireTypes.lengthDelimited);
        v1691, v1692 = v0.writeString(v1691, v1692, v1677.selected_option_id);
        v1678 = v1691;
        v1679 = v1692;
    end;
    if v1677.filter_type ~= nil and v1677.filter_type ~= "" then
        local v1693, v1694 = v0.writeTag(v1678, v1679, 6, v0.wireTypes.lengthDelimited);
        v1693, v1694 = v0.writeString(v1693, v1694, v1677.filter_type);
        v1678 = v1693;
        v1679 = v1694;
    end;
    if v1677.inactive_option_ids ~= nil and #v1677.inactive_option_ids > 0 then
        for _, v1696 in v1677.inactive_option_ids do
            local v1697, v1698 = v0.writeTag(v1678, v1679, 7, v0.wireTypes.lengthDelimited);
            v1697, v1698 = v0.writeString(v1697, v1698, v1696);
            v1678 = v1697;
            v1679 = v1698;
        end;
    end;
    local v1699 = buffer.create(v1679);
    buffer.copy(v1699, 0, v1678, 0, v1679);
    return v1699;
end;
v4.decode = function(v1700) --[[ Line: 11756 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_57 (copy), v0 (copy), v2 (copy)
    local v1701 = l_v4_57.new();
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
                v1701.filter_id = buffer.tostring(v1705);
            elseif v1703 == 2 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.display_name = buffer.tostring(v1705);
            elseif v1703 == 3 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                table.insert(v1701.options, v2.FilterPillsInputData_FilterOption.decode(v1705));
            elseif v1703 == 4 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.default_option_id = buffer.tostring(v1705);
            elseif v1703 == 5 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.selected_option_id = buffer.tostring(v1705);
            elseif v1703 == 6 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                v1701.filter_type = buffer.tostring(v1705);
            elseif v1703 == 7 then
                v1705 = nil;
                v1706, v1707 = v0.readBuffer(v1700, v1702);
                v1705 = v1706;
                v1702 = v1707;
                table.insert(v1701.inactive_option_ids, buffer.tostring(v1705));
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
v4.jsonEncode = function(v1708) --[[ Line: 11829 ]] --[[ Name: jsonEncode ]]
    local v1709 = {};
    if v1708.filter_id ~= nil and v1708.filter_id ~= "" then
        v1709.filterId = v1708.filter_id;
    end;
    if v1708.display_name ~= nil and v1708.display_name ~= "" then
        v1709.displayName = v1708.display_name;
    end;
    if v1708.options ~= nil and #v1708.options > 0 then
        local v1710 = {};
        for _, v1712 in v1708.options do
            table.insert(v1710, v1712:jsonEncode());
        end;
        v1709.options = v1710;
    end;
    if v1708.default_option_id ~= nil and v1708.default_option_id ~= "" then
        v1709.defaultOptionId = v1708.default_option_id;
    end;
    if v1708.selected_option_id ~= nil and v1708.selected_option_id ~= "" then
        v1709.selectedOptionId = v1708.selected_option_id;
    end;
    if v1708.filter_type ~= nil and v1708.filter_type ~= "" then
        v1709.filterType = v1708.filter_type;
    end;
    if v1708.inactive_option_ids ~= nil and #v1708.inactive_option_ids > 0 then
        local v1713 = {};
        for _, v1715 in v1708.inactive_option_ids do
            table.insert(v1713, v1715);
        end;
        v1709.inactiveOptionIds = v1713;
    end;
    return v1709;
end;
v4.jsonDecode = function(v1716) --[[ Line: 11871 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_57 (copy), v2 (copy)
    local v1717 = l_v4_57.new();
    if v1716.filter_id ~= nil then
        v1717.filter_id = v1716.filter_id;
    end;
    if v1716.filterId ~= nil then
        v1717.filter_id = v1716.filterId;
    end;
    if v1716.display_name ~= nil then
        v1717.display_name = v1716.display_name;
    end;
    if v1716.displayName ~= nil then
        v1717.display_name = v1716.displayName;
    end;
    if v1716.options ~= nil then
        local v1718 = {};
        for _, v1720 in v1716.options do
            table.insert(v1718, v2.FilterPillsInputData_FilterOption.jsonDecode(v1720));
        end;
        v1717.options = v1718;
    end;
    if v1716.default_option_id ~= nil then
        v1717.default_option_id = v1716.default_option_id;
    end;
    if v1716.defaultOptionId ~= nil then
        v1717.default_option_id = v1716.defaultOptionId;
    end;
    if v1716.selected_option_id ~= nil then
        v1717.selected_option_id = v1716.selected_option_id;
    end;
    if v1716.selectedOptionId ~= nil then
        v1717.selected_option_id = v1716.selectedOptionId;
    end;
    if v1716.filter_type ~= nil then
        v1717.filter_type = v1716.filter_type;
    end;
    if v1716.filterType ~= nil then
        v1717.filter_type = v1716.filterType;
    end;
    if v1716.inactive_option_ids ~= nil then
        local v1721 = {};
        for _, v1723 in v1716.inactive_option_ids do
            table.insert(v1721, v1723);
        end;
        v1717.inactive_option_ids = v1721;
    end;
    if v1716.inactiveOptionIds ~= nil then
        local v1724 = {};
        for _, v1726 in v1716.inactiveOptionIds do
            table.insert(v1724, v1726);
        end;
        v1717.inactive_option_ids = v1724;
    end;
    return v1717;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterGroup", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
};
v2.FilterPillsInputData_FilterGroup = v4;
v1.default:register(v2.FilterPillsInputData_FilterGroup);
v4 = {};
v4.__index = v4;
local l_v4_58 = v4 --[[ copy: 4 -> 63 ]];
v4.new = function(v1728) --[[ Line: 11960 ]] --[[ Name: new ]]
    -- upvalues: l_v4_58 (copy)
    return (setmetatable({
        option_id = (not (v1728 ~= nil) or v1728.option_id == nil) and "" or v1728.option_id, 
        display_name = (not (v1728 ~= nil) or v1728.display_name == nil) and "" or v1728.display_name, 
        option_context_tag = (not (v1728 ~= nil) or v1728.option_context_tag == nil) and "" or v1728.option_context_tag
    }, l_v4_58));
end;
v4.encode = function(v1729) --[[ Line: 11970 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1730 = buffer.create(0);
    local v1731 = 0;
    if v1729.option_id ~= nil and v1729.option_id ~= "" then
        local v1732, v1733 = v0.writeTag(v1730, v1731, 1, v0.wireTypes.lengthDelimited);
        v1732, v1733 = v0.writeString(v1732, v1733, v1729.option_id);
        v1730 = v1732;
        v1731 = v1733;
    end;
    if v1729.display_name ~= nil and v1729.display_name ~= "" then
        local v1734, v1735 = v0.writeTag(v1730, v1731, 2, v0.wireTypes.lengthDelimited);
        v1734, v1735 = v0.writeString(v1734, v1735, v1729.display_name);
        v1730 = v1734;
        v1731 = v1735;
    end;
    if v1729.option_context_tag ~= nil and v1729.option_context_tag ~= "" then
        local v1736, v1737 = v0.writeTag(v1730, v1731, 3, v0.wireTypes.lengthDelimited);
        v1736, v1737 = v0.writeString(v1736, v1737, v1729.option_context_tag);
        v1730 = v1736;
        v1731 = v1737;
    end;
    local v1738 = buffer.create(v1731);
    buffer.copy(v1738, 0, v1730, 0, v1731);
    return v1738;
end;
v4.decode = function(v1739) --[[ Line: 11994 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_58 (copy), v0 (copy)
    local v1740 = l_v4_58.new();
    local v1741 = 0;
    while v1741 < buffer.len(v1739) do
        local v1742 = nil;
        local v1743 = nil;
        local v1744, v1745, v1746 = v0.readTag(v1739, v1741);
        v1742 = v1744;
        v1743 = v1745;
        v1741 = v1746;
        if v1743 == v0.wireTypes.varint then
            v1744 = nil;
            v1745, v1746 = v0.readVarInt(v1739, v1741);
            v1744 = v1745;
            v1741 = v1746;
        elseif v1743 == v0.wireTypes.lengthDelimited then
            if v1742 == 1 then
                v1744 = nil;
                v1745, v1746 = v0.readBuffer(v1739, v1741);
                v1744 = v1745;
                v1741 = v1746;
                v1740.option_id = buffer.tostring(v1744);
            elseif v1742 == 2 then
                v1744 = nil;
                v1745, v1746 = v0.readBuffer(v1739, v1741);
                v1744 = v1745;
                v1741 = v1746;
                v1740.display_name = buffer.tostring(v1744);
            elseif v1742 == 3 then
                v1744 = nil;
                v1745, v1746 = v0.readBuffer(v1739, v1741);
                v1744 = v1745;
                v1741 = v1746;
                v1740.option_context_tag = buffer.tostring(v1744);
            else
                v1744 = nil;
                v1745, v1746 = v0.readVarInt(v1739, v1741);
                v1741 = v1746 + v1745;
            end;
        elseif v1743 == v0.wireTypes.i32 then
            v1744 = nil;
            v1745, v1746 = v0.readFixed32(v1739, v1741);
            v1744 = v1745;
            v1741 = v1746;
        elseif v1743 == v0.wireTypes.i64 then
            v1744 = nil;
            v1745, v1746 = v0.readFixed64(v1739, v1741);
            v1744 = v1745;
            v1741 = v1746;
        else
            error("Unsupported wire type: " .. v1743);
        end;
    end;
    return v1740;
end;
v4.jsonEncode = function(v1747) --[[ Line: 12047 ]] --[[ Name: jsonEncode ]]
    local v1748 = {};
    if v1747.option_id ~= nil and v1747.option_id ~= "" then
        v1748.optionId = v1747.option_id;
    end;
    if v1747.display_name ~= nil and v1747.display_name ~= "" then
        v1748.displayName = v1747.display_name;
    end;
    if v1747.option_context_tag ~= nil and v1747.option_context_tag ~= "" then
        v1748.optionContextTag = v1747.option_context_tag;
    end;
    return v1748;
end;
v4.jsonDecode = function(v1749) --[[ Line: 12065 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_58 (copy)
    local v1750 = l_v4_58.new();
    if v1749.option_id ~= nil then
        v1750.option_id = v1749.option_id;
    end;
    if v1749.optionId ~= nil then
        v1750.option_id = v1749.optionId;
    end;
    if v1749.display_name ~= nil then
        v1750.display_name = v1749.display_name;
    end;
    if v1749.displayName ~= nil then
        v1750.display_name = v1749.displayName;
    end;
    if v1749.option_context_tag ~= nil then
        v1750.option_context_tag = v1749.option_context_tag;
    end;
    if v1749.optionContextTag ~= nil then
        v1750.option_context_tag = v1749.optionContextTag;
    end;
    return v1750;
end;
v4.descriptor = {
    name = "FilterPillsInputData_FilterOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
};
v2.FilterPillsInputData_FilterOption = v4;
v1.default:register(v2.FilterPillsInputData_FilterOption);
v4 = {};
v4.__index = v4;
local l_v4_59 = v4 --[[ copy: 4 -> 64 ]];
v4.new = function(v1752) --[[ Line: 12111 ]] --[[ Name: new ]]
    -- upvalues: l_v4_59 (copy)
    return (setmetatable({
        sort_options = if not (v1752 ~= nil) or v1752.sort_options == nil then {} else v1752.sort_options, 
        selected_sort_id = (not (v1752 ~= nil) or v1752.selected_sort_id == nil) and "" or v1752.selected_sort_id
    }, l_v4_59));
end;
v4.encode = function(v1753) --[[ Line: 12118 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1754 = buffer.create(0);
    local v1755 = 0;
    if v1753.sort_options ~= nil and #v1753.sort_options > 0 then
        for _, v1757 in v1753.sort_options do
            local v1758 = v1757:encode();
            local v1759, v1760 = v0.writeTag(v1754, v1755, 1, v0.wireTypes.lengthDelimited);
            v1759, v1760 = v0.writeBuffer(v1759, v1760, v1758, buffer.len(v1758));
            v1754 = v1759;
            v1755 = v1760;
        end;
    end;
    if v1753.selected_sort_id ~= nil and v1753.selected_sort_id ~= "" then
        local v1761, v1762 = v0.writeTag(v1754, v1755, 2, v0.wireTypes.lengthDelimited);
        v1761, v1762 = v0.writeString(v1761, v1762, v1753.selected_sort_id);
        v1754 = v1761;
        v1755 = v1762;
    end;
    local v1763 = buffer.create(v1755);
    buffer.copy(v1763, 0, v1754, 0, v1755);
    return v1763;
end;
v4.decode = function(v1764) --[[ Line: 12140 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_59 (copy), v0 (copy), v2 (copy)
    local v1765 = l_v4_59.new();
    local v1766 = 0;
    while v1766 < buffer.len(v1764) do
        local v1767 = nil;
        local v1768 = nil;
        local v1769, v1770, v1771 = v0.readTag(v1764, v1766);
        v1767 = v1769;
        v1768 = v1770;
        v1766 = v1771;
        if v1768 == v0.wireTypes.varint then
            v1769 = nil;
            v1770, v1771 = v0.readVarInt(v1764, v1766);
            v1769 = v1770;
            v1766 = v1771;
        elseif v1768 == v0.wireTypes.lengthDelimited then
            if v1767 == 1 then
                v1769 = nil;
                v1770, v1771 = v0.readBuffer(v1764, v1766);
                v1769 = v1770;
                v1766 = v1771;
                table.insert(v1765.sort_options, v2.SortSelectorInputData_SortOption.decode(v1769));
            elseif v1767 == 2 then
                v1769 = nil;
                v1770, v1771 = v0.readBuffer(v1764, v1766);
                v1769 = v1770;
                v1766 = v1771;
                v1765.selected_sort_id = buffer.tostring(v1769);
            else
                v1769 = nil;
                v1770, v1771 = v0.readVarInt(v1764, v1766);
                v1766 = v1771 + v1770;
            end;
        elseif v1768 == v0.wireTypes.i32 then
            v1769 = nil;
            v1770, v1771 = v0.readFixed32(v1764, v1766);
            v1769 = v1770;
            v1766 = v1771;
        elseif v1768 == v0.wireTypes.i64 then
            v1769 = nil;
            v1770, v1771 = v0.readFixed64(v1764, v1766);
            v1769 = v1770;
            v1766 = v1771;
        else
            error("Unsupported wire type: " .. v1768);
        end;
    end;
    return v1765;
end;
v4.jsonEncode = function(v1772) --[[ Line: 12188 ]] --[[ Name: jsonEncode ]]
    local v1773 = {};
    if v1772.sort_options ~= nil and #v1772.sort_options > 0 then
        local v1774 = {};
        for _, v1776 in v1772.sort_options do
            table.insert(v1774, v1776:jsonEncode());
        end;
        v1773.sortOptions = v1774;
    end;
    if v1772.selected_sort_id ~= nil and v1772.selected_sort_id ~= "" then
        v1773.selectedSortId = v1772.selected_sort_id;
    end;
    return v1773;
end;
v4.jsonDecode = function(v1777) --[[ Line: 12206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_59 (copy), v2 (copy)
    local v1778 = l_v4_59.new();
    if v1777.sort_options ~= nil then
        local v1779 = {};
        for _, v1781 in v1777.sort_options do
            table.insert(v1779, v2.SortSelectorInputData_SortOption.jsonDecode(v1781));
        end;
        v1778.sort_options = v1779;
    end;
    if v1777.sortOptions ~= nil then
        local v1782 = {};
        for _, v1784 in v1777.sortOptions do
            table.insert(v1782, v2.SortSelectorInputData_SortOption.jsonDecode(v1784));
        end;
        v1778.sort_options = v1782;
    end;
    if v1777.selected_sort_id ~= nil then
        v1778.selected_sort_id = v1777.selected_sort_id;
    end;
    if v1777.selectedSortId ~= nil then
        v1778.selected_sort_id = v1777.selectedSortId;
    end;
    return v1778;
end;
v4.descriptor = {
    name = "SortSelectorInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
};
v2.SortSelectorInputData = v4;
v1.default:register(v2.SortSelectorInputData);
v4 = {};
v4.__index = v4;
local l_v4_60 = v4 --[[ copy: 4 -> 65 ]];
v4.new = function(v1786) --[[ Line: 12252 ]] --[[ Name: new ]]
    -- upvalues: l_v4_60 (copy)
    return (setmetatable({
        sort_id = (not (v1786 ~= nil) or v1786.sort_id == nil) and "" or v1786.sort_id, 
        display_name = (not (v1786 ~= nil) or v1786.display_name == nil) and "" or v1786.display_name, 
        content_type = (not (v1786 ~= nil) or v1786.content_type == nil) and "" or v1786.content_type
    }, l_v4_60));
end;
v4.encode = function(v1787) --[[ Line: 12262 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1788 = buffer.create(0);
    local v1789 = 0;
    if v1787.sort_id ~= nil and v1787.sort_id ~= "" then
        local v1790, v1791 = v0.writeTag(v1788, v1789, 1, v0.wireTypes.lengthDelimited);
        v1790, v1791 = v0.writeString(v1790, v1791, v1787.sort_id);
        v1788 = v1790;
        v1789 = v1791;
    end;
    if v1787.display_name ~= nil and v1787.display_name ~= "" then
        local v1792, v1793 = v0.writeTag(v1788, v1789, 2, v0.wireTypes.lengthDelimited);
        v1792, v1793 = v0.writeString(v1792, v1793, v1787.display_name);
        v1788 = v1792;
        v1789 = v1793;
    end;
    if v1787.content_type ~= nil and v1787.content_type ~= "" then
        local v1794, v1795 = v0.writeTag(v1788, v1789, 3, v0.wireTypes.lengthDelimited);
        v1794, v1795 = v0.writeString(v1794, v1795, v1787.content_type);
        v1788 = v1794;
        v1789 = v1795;
    end;
    local v1796 = buffer.create(v1789);
    buffer.copy(v1796, 0, v1788, 0, v1789);
    return v1796;
end;
v4.decode = function(v1797) --[[ Line: 12286 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_60 (copy), v0 (copy)
    local v1798 = l_v4_60.new();
    local v1799 = 0;
    while v1799 < buffer.len(v1797) do
        local v1800 = nil;
        local v1801 = nil;
        local v1802, v1803, v1804 = v0.readTag(v1797, v1799);
        v1800 = v1802;
        v1801 = v1803;
        v1799 = v1804;
        if v1801 == v0.wireTypes.varint then
            v1802 = nil;
            v1803, v1804 = v0.readVarInt(v1797, v1799);
            v1802 = v1803;
            v1799 = v1804;
        elseif v1801 == v0.wireTypes.lengthDelimited then
            if v1800 == 1 then
                v1802 = nil;
                v1803, v1804 = v0.readBuffer(v1797, v1799);
                v1802 = v1803;
                v1799 = v1804;
                v1798.sort_id = buffer.tostring(v1802);
            elseif v1800 == 2 then
                v1802 = nil;
                v1803, v1804 = v0.readBuffer(v1797, v1799);
                v1802 = v1803;
                v1799 = v1804;
                v1798.display_name = buffer.tostring(v1802);
            elseif v1800 == 3 then
                v1802 = nil;
                v1803, v1804 = v0.readBuffer(v1797, v1799);
                v1802 = v1803;
                v1799 = v1804;
                v1798.content_type = buffer.tostring(v1802);
            else
                v1802 = nil;
                v1803, v1804 = v0.readVarInt(v1797, v1799);
                v1799 = v1804 + v1803;
            end;
        elseif v1801 == v0.wireTypes.i32 then
            v1802 = nil;
            v1803, v1804 = v0.readFixed32(v1797, v1799);
            v1802 = v1803;
            v1799 = v1804;
        elseif v1801 == v0.wireTypes.i64 then
            v1802 = nil;
            v1803, v1804 = v0.readFixed64(v1797, v1799);
            v1802 = v1803;
            v1799 = v1804;
        else
            error("Unsupported wire type: " .. v1801);
        end;
    end;
    return v1798;
end;
v4.jsonEncode = function(v1805) --[[ Line: 12339 ]] --[[ Name: jsonEncode ]]
    local v1806 = {};
    if v1805.sort_id ~= nil and v1805.sort_id ~= "" then
        v1806.sortId = v1805.sort_id;
    end;
    if v1805.display_name ~= nil and v1805.display_name ~= "" then
        v1806.displayName = v1805.display_name;
    end;
    if v1805.content_type ~= nil and v1805.content_type ~= "" then
        v1806.contentType = v1805.content_type;
    end;
    return v1806;
end;
v4.jsonDecode = function(v1807) --[[ Line: 12357 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_60 (copy)
    local v1808 = l_v4_60.new();
    if v1807.sort_id ~= nil then
        v1808.sort_id = v1807.sort_id;
    end;
    if v1807.sortId ~= nil then
        v1808.sort_id = v1807.sortId;
    end;
    if v1807.display_name ~= nil then
        v1808.display_name = v1807.display_name;
    end;
    if v1807.displayName ~= nil then
        v1808.display_name = v1807.displayName;
    end;
    if v1807.content_type ~= nil then
        v1808.content_type = v1807.content_type;
    end;
    if v1807.contentType ~= nil then
        v1808.content_type = v1807.contentType;
    end;
    return v1808;
end;
v4.descriptor = {
    name = "SortSelectorInputData_SortOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
};
v2.SortSelectorInputData_SortOption = v4;
v1.default:register(v2.SortSelectorInputData_SortOption);
v4 = {};
v4.__index = v4;
local l_v4_61 = v4 --[[ copy: 4 -> 66 ]];
v4.new = function(v1810) --[[ Line: 12403 ]] --[[ Name: new ]]
    -- upvalues: l_v4_61 (copy)
    return (setmetatable({
        id = (not (v1810 ~= nil) or v1810.id == nil) and "" or v1810.id, 
        preview_rows = (not (v1810 ~= nil) or v1810.preview_rows == nil) and 0 or v1810.preview_rows
    }, l_v4_61));
end;
v4.encode = function(v1811) --[[ Line: 12412 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1812 = buffer.create(0);
    local v1813 = 0;
    if v1811.id ~= nil and v1811.id ~= "" then
        local v1814, v1815 = v0.writeTag(v1812, v1813, 1, v0.wireTypes.lengthDelimited);
        v1814, v1815 = v0.writeString(v1814, v1815, v1811.id);
        v1812 = v1814;
        v1813 = v1815;
    end;
    if v1811.preview_rows ~= nil and v1811.preview_rows ~= 0 then
        local v1816, v1817 = v0.writeTag(v1812, v1813, 4, v0.wireTypes.varint);
        v1816, v1817 = v0.writeVarInt(v1816, v1817, v1811.preview_rows);
        v1812 = v1816;
        v1813 = v1817;
    end;
    local v1818 = buffer.create(v1813);
    buffer.copy(v1818, 0, v1812, 0, v1813);
    return v1818;
end;
v4.decode = function(v1819) --[[ Line: 12431 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_61 (copy), v0 (copy)
    local v1820 = l_v4_61.new();
    local v1821 = 0;
    while v1821 < buffer.len(v1819) do
        local v1822 = nil;
        local v1823 = nil;
        local v1824, v1825, v1826 = v0.readTag(v1819, v1821);
        v1822 = v1824;
        v1823 = v1825;
        v1821 = v1826;
        if v1823 == v0.wireTypes.varint then
            if v1822 == 4 then
                v1824 = nil;
                v1825, v1826 = v0.readVarIntI64(v1819, v1821);
                v1824 = v1825;
                v1821 = v1826;
                v1820.preview_rows = v1824;
            else
                v1824 = nil;
                v1825, v1826 = v0.readVarInt(v1819, v1821);
                v1824 = v1825;
                v1821 = v1826;
            end;
        elseif v1823 == v0.wireTypes.lengthDelimited then
            if v1822 == 1 then
                v1824 = nil;
                v1825, v1826 = v0.readBuffer(v1819, v1821);
                v1824 = v1825;
                v1821 = v1826;
                v1820.id = buffer.tostring(v1824);
            else
                v1824 = nil;
                v1825, v1826 = v0.readVarInt(v1819, v1821);
                v1821 = v1826 + v1825;
            end;
        elseif v1823 == v0.wireTypes.i32 then
            v1824 = nil;
            v1825, v1826 = v0.readFixed32(v1819, v1821);
            v1824 = v1825;
            v1821 = v1826;
        elseif v1823 == v0.wireTypes.i64 then
            v1824 = nil;
            v1825, v1826 = v0.readFixed64(v1819, v1821);
            v1824 = v1825;
            v1821 = v1826;
        else
            error("Unsupported wire type: " .. v1823);
        end;
    end;
    return v1820;
end;
v4.jsonEncode = function(v1827) --[[ Line: 12479 ]] --[[ Name: jsonEncode ]]
    local v1828 = {};
    if v1827.id ~= nil and v1827.id ~= "" then
        v1828.id = v1827.id;
    end;
    if v1827.preview_rows ~= nil and v1827.preview_rows ~= 0 then
        v1828.previewRows = v1827.preview_rows;
    end;
    return v1828;
end;
v4.jsonDecode = function(v1829) --[[ Line: 12493 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_61 (copy)
    local v1830 = l_v4_61.new();
    if v1829.id ~= nil then
        v1830.id = v1829.id;
    end;
    if v1829.preview_rows ~= nil then
        v1830.preview_rows = v1829.preview_rows;
    end;
    if v1829.previewRows ~= nil then
        v1830.preview_rows = v1829.previewRows;
    end;
    return v1830;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemGroupInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
};
v2.UAMarketplaceCatalogItemGroupInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemGroupInputData);
v4 = {};
v4.__index = v4;
local l_v4_62 = v4 --[[ copy: 4 -> 67 ]];
v4.new = function(v1832) --[[ Line: 12527 ]] --[[ Name: new ]]
    -- upvalues: l_v4_62 (copy)
    return (setmetatable({
        id = (not (v1832 ~= nil) or v1832.id == nil) and "" or v1832.id, 
        num_items_to_show = (not (v1832 ~= nil) or v1832.num_items_to_show == nil) and 0 or v1832.num_items_to_show
    }, l_v4_62));
end;
v4.encode = function(v1833) --[[ Line: 12536 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1834 = buffer.create(0);
    local v1835 = 0;
    if v1833.id ~= nil and v1833.id ~= "" then
        local v1836, v1837 = v0.writeTag(v1834, v1835, 1, v0.wireTypes.lengthDelimited);
        v1836, v1837 = v0.writeString(v1836, v1837, v1833.id);
        v1834 = v1836;
        v1835 = v1837;
    end;
    if v1833.num_items_to_show ~= nil and v1833.num_items_to_show ~= 0 then
        local v1838, v1839 = v0.writeTag(v1834, v1835, 5, v0.wireTypes.varint);
        v1838, v1839 = v0.writeVarInt(v1838, v1839, v1833.num_items_to_show);
        v1834 = v1838;
        v1835 = v1839;
    end;
    local v1840 = buffer.create(v1835);
    buffer.copy(v1840, 0, v1834, 0, v1835);
    return v1840;
end;
v4.decode = function(v1841) --[[ Line: 12557 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_62 (copy), v0 (copy)
    local v1842 = l_v4_62.new();
    local v1843 = 0;
    while v1843 < buffer.len(v1841) do
        local v1844 = nil;
        local v1845 = nil;
        local v1846, v1847, v1848 = v0.readTag(v1841, v1843);
        v1844 = v1846;
        v1845 = v1847;
        v1843 = v1848;
        if v1845 == v0.wireTypes.varint then
            if v1844 == 5 then
                v1846 = nil;
                v1847, v1848 = v0.readVarIntI64(v1841, v1843);
                v1846 = v1847;
                v1843 = v1848;
                v1842.num_items_to_show = v1846;
            else
                v1846 = nil;
                v1847, v1848 = v0.readVarInt(v1841, v1843);
                v1846 = v1847;
                v1843 = v1848;
            end;
        elseif v1845 == v0.wireTypes.lengthDelimited then
            if v1844 == 1 then
                v1846 = nil;
                v1847, v1848 = v0.readBuffer(v1841, v1843);
                v1846 = v1847;
                v1843 = v1848;
                v1842.id = buffer.tostring(v1846);
            else
                v1846 = nil;
                v1847, v1848 = v0.readVarInt(v1841, v1843);
                v1843 = v1848 + v1847;
            end;
        elseif v1845 == v0.wireTypes.i32 then
            v1846 = nil;
            v1847, v1848 = v0.readFixed32(v1841, v1843);
            v1846 = v1847;
            v1843 = v1848;
        elseif v1845 == v0.wireTypes.i64 then
            v1846 = nil;
            v1847, v1848 = v0.readFixed64(v1841, v1843);
            v1846 = v1847;
            v1843 = v1848;
        else
            error("Unsupported wire type: " .. v1845);
        end;
    end;
    return v1842;
end;
v4.jsonEncode = function(v1849) --[[ Line: 12607 ]] --[[ Name: jsonEncode ]]
    local v1850 = {};
    if v1849.id ~= nil and v1849.id ~= "" then
        v1850.id = v1849.id;
    end;
    if v1849.num_items_to_show ~= nil and v1849.num_items_to_show ~= 0 then
        v1850.numItemsToShow = v1849.num_items_to_show;
    end;
    return v1850;
end;
v4.jsonDecode = function(v1851) --[[ Line: 12623 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_62 (copy)
    local v1852 = l_v4_62.new();
    if v1851.id ~= nil then
        v1852.id = v1851.id;
    end;
    if v1851.num_items_to_show ~= nil then
        v1852.num_items_to_show = v1851.num_items_to_show;
    end;
    if v1851.numItemsToShow ~= nil then
        v1852.num_items_to_show = v1851.numItemsToShow;
    end;
    return v1852;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogItemCarouselInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
};
v2.UAMarketplaceCatalogItemCarouselInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogItemCarouselInputData);
v4 = {};
v4.__index = v4;
local l_v4_63 = v4 --[[ copy: 4 -> 68 ]];
v4.new = function(v1854) --[[ Line: 12657 ]] --[[ Name: new ]]
    -- upvalues: l_v4_63 (copy)
    return (setmetatable({
        feed_item_input_map = if not (v1854 ~= nil) or v1854.feed_item_input_map == nil then {} else v1854.feed_item_input_map, 
        marketplace_catalog_feed_items = if not (v1854 ~= nil) or v1854.marketplace_catalog_feed_items == nil then {} else v1854.marketplace_catalog_feed_items
    }, l_v4_63));
end;
v4.encode = function(v1855) --[[ Line: 12670 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1856 = buffer.create(0);
    local v1857 = 0;
    if v1855.feed_item_input_map ~= nil and next(v1855.feed_item_input_map) ~= nil then
        for v1858, v1859 in v1855.feed_item_input_map do
            local v1860 = buffer.create(0);
            local v1861, v1862 = v0.writeTag(v1860, 0, 1, v0.wireTypes.lengthDelimited);
            v1861, v1862 = v0.writeString(v1861, v1862, v1858);
            v1860 = v1861;
            local l_v1862_0 = v1862;
            v1861 = v1859:encode();
            local v1864;
            v1862, v1864 = v0.writeTag(v1860, l_v1862_0, 2, v0.wireTypes.lengthDelimited);
            v1862, v1864 = v0.writeBuffer(v1862, v1864, v1861, buffer.len(v1861));
            v1860 = v1862;
            l_v1862_0 = v1864;
            v1862, v1864 = v0.writeTag(v1856, v1857, 1, v0.wireTypes.lengthDelimited);
            v1862, v1864 = v0.writeBuffer(v1862, v1864, v1860, l_v1862_0);
            v1856 = v1862;
            v1857 = v1864;
        end;
    end;
    if v1855.marketplace_catalog_feed_items ~= nil and #v1855.marketplace_catalog_feed_items > 0 then
        for _, v1866 in v1855.marketplace_catalog_feed_items do
            local v1867 = v1866:encode();
            local v1868, v1869 = v0.writeTag(v1856, v1857, 2, v0.wireTypes.lengthDelimited);
            v1868, v1869 = v0.writeBuffer(v1868, v1869, v1867, buffer.len(v1867));
            v1856 = v1868;
            v1857 = v1869;
        end;
    end;
    local v1870 = buffer.create(v1857);
    buffer.copy(v1870, 0, v1856, 0, v1857);
    return v1870;
end;
v4.decode = function(v1871) --[[ Line: 12701 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_63 (copy), v0 (copy), v2 (copy)
    local v1872 = l_v4_63.new();
    local v1873 = 0;
    while v1873 < buffer.len(v1871) do
        local v1874 = nil;
        local v1875 = nil;
        local v1876, v1877, v1878 = v0.readTag(v1871, v1873);
        v1874 = v1876;
        v1875 = v1877;
        v1873 = v1878;
        if v1875 == v0.wireTypes.varint then
            v1876 = nil;
            v1877, v1878 = v0.readVarInt(v1871, v1873);
            v1876 = v1877;
            v1873 = v1878;
        elseif v1875 == v0.wireTypes.lengthDelimited then
            if v1874 == 1 then
                v1876 = nil;
                v1877, v1878 = v0.readBuffer(v1871, v1873);
                v1876 = v1877;
                v1873 = v1878;
                v1877 = v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry.decode(v1876);
                v1878 = v2.PageEntryInputData.new();
                v1872.feed_item_input_map[v1877.key or ""] = v1877.value or v1878;
            elseif v1874 == 2 then
                v1876 = nil;
                v1877, v1878 = v0.readBuffer(v1871, v1873);
                v1876 = v1877;
                v1873 = v1878;
                table.insert(v1872.marketplace_catalog_feed_items, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.decode(v1876));
            else
                v1876 = nil;
                v1877, v1878 = v0.readVarInt(v1871, v1873);
                v1873 = v1878 + v1877;
            end;
        elseif v1875 == v0.wireTypes.i32 then
            v1876 = nil;
            v1877, v1878 = v0.readFixed32(v1871, v1873);
            v1876 = v1877;
            v1873 = v1878;
        elseif v1875 == v0.wireTypes.i64 then
            v1876 = nil;
            v1877, v1878 = v0.readFixed64(v1871, v1873);
            v1876 = v1877;
            v1873 = v1878;
        else
            error("Unsupported wire type: " .. v1875);
        end;
    end;
    return v1872;
end;
v4.jsonEncode = function(v1879) --[[ Line: 12759 ]] --[[ Name: jsonEncode ]]
    local v1880 = {};
    if v1879.feed_item_input_map ~= nil and next(v1879.feed_item_input_map) ~= nil then
        local v1881 = {};
        for v1882, v1883 in v1879.feed_item_input_map do
            v1881[v1882] = v1883:jsonEncode();
        end;
        v1880.feedItemInputMap = v1881;
    end;
    if v1879.marketplace_catalog_feed_items ~= nil and #v1879.marketplace_catalog_feed_items > 0 then
        local v1884 = {};
        for _, v1886 in v1879.marketplace_catalog_feed_items do
            table.insert(v1884, v1886:jsonEncode());
        end;
        v1880.marketplaceCatalogFeedItems = v1884;
    end;
    return v1880;
end;
v4.jsonDecode = function(v1887) --[[ Line: 12781 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_63 (copy), v2 (copy)
    local v1888 = l_v4_63.new();
    if v1887.feed_item_input_map ~= nil then
        local v1889 = {};
        for v1890, v1891 in v1887.feed_item_input_map do
            v1889[v1890] = v2.PageEntryInputData.jsonDecode(v1891);
        end;
        v1888.feed_item_input_map = v1889;
    end;
    if v1887.feedItemInputMap ~= nil then
        local v1892 = {};
        for v1893, v1894 in v1887.feedItemInputMap do
            v1892[v1893] = v2.PageEntryInputData.jsonDecode(v1894);
        end;
        v1888.feed_item_input_map = v1892;
    end;
    if v1887.marketplace_catalog_feed_items ~= nil then
        local v1895 = {};
        for _, v1897 in v1887.marketplace_catalog_feed_items do
            table.insert(v1895, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1897));
        end;
        v1888.marketplace_catalog_feed_items = v1895;
    end;
    if v1887.marketplaceCatalogFeedItems ~= nil then
        local v1898 = {};
        for _, v1900 in v1887.marketplaceCatalogFeedItems do
            table.insert(v1898, v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v1900));
        end;
        v1888.marketplace_catalog_feed_items = v1898;
    end;
    return v1888;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
};
v2.UAMarketplaceCatalogFeedInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_64 = v4 --[[ copy: 4 -> 69 ]];
v4.new = function(v1902) --[[ Line: 12846 ]] --[[ Name: new ]]
    -- upvalues: l_v4_64 (copy)
    return (setmetatable({
        roblox_component = (not (v1902 ~= nil) or v1902.roblox_component == nil) and "" or v1902.roblox_component, 
        feed_item_id = (not (v1902 ~= nil) or v1902.feed_item_id == nil) and "" or v1902.feed_item_id
    }, l_v4_64));
end;
v4.encode = function(v1903) --[[ Line: 12858 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1904 = buffer.create(0);
    local v1905 = 0;
    if v1903.roblox_component ~= nil and v1903.roblox_component ~= "" then
        local v1906, v1907 = v0.writeTag(v1904, v1905, 1, v0.wireTypes.lengthDelimited);
        v1906, v1907 = v0.writeString(v1906, v1907, v1903.roblox_component);
        v1904 = v1906;
        v1905 = v1907;
    end;
    if v1903.feed_item_id ~= nil and v1903.feed_item_id ~= "" then
        local v1908, v1909 = v0.writeTag(v1904, v1905, 2, v0.wireTypes.lengthDelimited);
        v1908, v1909 = v0.writeString(v1908, v1909, v1903.feed_item_id);
        v1904 = v1908;
        v1905 = v1909;
    end;
    local v1910 = buffer.create(v1905);
    buffer.copy(v1910, 0, v1904, 0, v1905);
    return v1910;
end;
v4.decode = function(v1911) --[[ Line: 12879 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_64 (copy), v0 (copy)
    local v1912 = l_v4_64.new();
    local v1913 = 0;
    while v1913 < buffer.len(v1911) do
        local v1914 = nil;
        local v1915 = nil;
        local v1916, v1917, v1918 = v0.readTag(v1911, v1913);
        v1914 = v1916;
        v1915 = v1917;
        v1913 = v1918;
        if v1915 == v0.wireTypes.varint then
            v1916 = nil;
            v1917, v1918 = v0.readVarInt(v1911, v1913);
            v1916 = v1917;
            v1913 = v1918;
        elseif v1915 == v0.wireTypes.lengthDelimited then
            if v1914 == 1 then
                v1916 = nil;
                v1917, v1918 = v0.readBuffer(v1911, v1913);
                v1916 = v1917;
                v1913 = v1918;
                v1912.roblox_component = buffer.tostring(v1916);
            elseif v1914 == 2 then
                v1916 = nil;
                v1917, v1918 = v0.readBuffer(v1911, v1913);
                v1916 = v1917;
                v1913 = v1918;
                v1912.feed_item_id = buffer.tostring(v1916);
            else
                v1916 = nil;
                v1917, v1918 = v0.readVarInt(v1911, v1913);
                v1913 = v1918 + v1917;
            end;
        elseif v1915 == v0.wireTypes.i32 then
            v1916 = nil;
            v1917, v1918 = v0.readFixed32(v1911, v1913);
            v1916 = v1917;
            v1913 = v1918;
        elseif v1915 == v0.wireTypes.i64 then
            v1916 = nil;
            v1917, v1918 = v0.readFixed64(v1911, v1913);
            v1916 = v1917;
            v1913 = v1918;
        else
            error("Unsupported wire type: " .. v1915);
        end;
    end;
    return v1912;
end;
v4.jsonEncode = function(v1919) --[[ Line: 12929 ]] --[[ Name: jsonEncode ]]
    local v1920 = {};
    if v1919.roblox_component ~= nil and v1919.roblox_component ~= "" then
        v1920.robloxComponent = v1919.roblox_component;
    end;
    if v1919.feed_item_id ~= nil and v1919.feed_item_id ~= "" then
        v1920.feedItemId = v1919.feed_item_id;
    end;
    return v1920;
end;
v4.jsonDecode = function(v1921) --[[ Line: 12945 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_64 (copy)
    local v1922 = l_v4_64.new();
    if v1921.roblox_component ~= nil then
        v1922.roblox_component = v1921.roblox_component;
    end;
    if v1921.robloxComponent ~= nil then
        v1922.roblox_component = v1921.robloxComponent;
    end;
    if v1921.feed_item_id ~= nil then
        v1922.feed_item_id = v1921.feed_item_id;
    end;
    if v1921.feedItemId ~= nil then
        v1922.feed_item_id = v1921.feedItemId;
    end;
    return v1922;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogFeedItem"
};
v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem);
v4 = {};
v4.__index = v4;
local l_v4_65 = v4 --[[ copy: 4 -> 70 ]];
v4.new = function(v1924) --[[ Line: 12985 ]] --[[ Name: new ]]
    -- upvalues: l_v4_65 (copy)
    return (setmetatable({
        key = (not (v1924 ~= nil) or v1924.key == nil) and "" or v1924.key, 
        value = if not (v1924 ~= nil) or v1924.value == nil then nil else v1924.value
    }, l_v4_65));
end;
v4.encode = function(v1925) --[[ Line: 12997 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1926 = buffer.create(0);
    local v1927 = 0;
    if v1925.key ~= nil and v1925.key ~= "" then
        local v1928, v1929 = v0.writeTag(v1926, v1927, 1, v0.wireTypes.lengthDelimited);
        v1928, v1929 = v0.writeString(v1928, v1929, v1925.key);
        v1926 = v1928;
        v1927 = v1929;
    end;
    if v1925.value ~= nil then
        local v1930 = v1925.value:encode();
        local v1931, v1932 = v0.writeTag(v1926, v1927, 2, v0.wireTypes.lengthDelimited);
        v1931, v1932 = v0.writeBuffer(v1931, v1932, v1930, buffer.len(v1930));
        v1926 = v1931;
        v1927 = v1932;
    end;
    local v1933 = buffer.create(v1927);
    buffer.copy(v1933, 0, v1926, 0, v1927);
    return v1933;
end;
v4.decode = function(v1934) --[[ Line: 13019 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_65 (copy), v0 (copy), v2 (copy)
    local v1935 = l_v4_65.new();
    local v1936 = 0;
    while v1936 < buffer.len(v1934) do
        local v1937 = nil;
        local v1938 = nil;
        local v1939, v1940, v1941 = v0.readTag(v1934, v1936);
        v1937 = v1939;
        v1938 = v1940;
        v1936 = v1941;
        if v1938 == v0.wireTypes.varint then
            v1939 = nil;
            v1940, v1941 = v0.readVarInt(v1934, v1936);
            v1939 = v1940;
            v1936 = v1941;
        elseif v1938 == v0.wireTypes.lengthDelimited then
            if v1937 == 1 then
                v1939 = nil;
                v1940, v1941 = v0.readBuffer(v1934, v1936);
                v1939 = v1940;
                v1936 = v1941;
                v1935.key = buffer.tostring(v1939);
            elseif v1937 == 2 then
                v1939 = nil;
                v1940, v1941 = v0.readBuffer(v1934, v1936);
                v1939 = v1940;
                v1936 = v1941;
                v1935.value = v2.PageEntryInputData.decode(v1939);
            else
                v1939 = nil;
                v1940, v1941 = v0.readVarInt(v1934, v1936);
                v1936 = v1941 + v1940;
            end;
        elseif v1938 == v0.wireTypes.i32 then
            v1939 = nil;
            v1940, v1941 = v0.readFixed32(v1934, v1936);
            v1939 = v1940;
            v1936 = v1941;
        elseif v1938 == v0.wireTypes.i64 then
            v1939 = nil;
            v1940, v1941 = v0.readFixed64(v1934, v1936);
            v1939 = v1940;
            v1936 = v1941;
        else
            error("Unsupported wire type: " .. v1938);
        end;
    end;
    return v1935;
end;
v4.jsonEncode = function(v1942) --[[ Line: 13069 ]] --[[ Name: jsonEncode ]]
    local v1943 = {};
    if v1942.key ~= nil and v1942.key ~= "" then
        v1943.key = v1942.key;
    end;
    if v1942.value ~= nil then
        v1943.value = v1942.value:jsonEncode();
    end;
    return v1943;
end;
v4.jsonDecode = function(v1944) --[[ Line: 13085 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_65 (copy), v2 (copy)
    local v1945 = l_v4_65.new();
    if v1944.key ~= nil then
        v1945.key = v1944.key;
    end;
    if v1944.value ~= nil then
        v1945.value = v2.PageEntryInputData.jsonDecode(v1944.value);
    end;
    return v1945;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FeedItemInputMapEntry"
};
v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry = v4;
v1.default:register(v2.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_66 = v4 --[[ copy: 4 -> 71 ]];
v4.new = function(v1947) --[[ Line: 13116 ]] --[[ Name: new ]]
    -- upvalues: l_v4_66 (copy)
    return (setmetatable({
        marketplace_catalog_category_items = if not (v1947 ~= nil) or v1947.marketplace_catalog_category_items == nil then {} else v1947.marketplace_catalog_category_items, 
        active_category_id = (not (v1947 ~= nil) or v1947.active_category_id == nil) and "" or v1947.active_category_id, 
        active_tooltip_idx = (not (v1947 ~= nil) or v1947.active_tooltip_idx == nil) and 0 or v1947.active_tooltip_idx
    }, l_v4_66));
end;
v4.encode = function(v1948) --[[ Line: 13129 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1949 = buffer.create(0);
    local v1950 = 0;
    if v1948.marketplace_catalog_category_items ~= nil and #v1948.marketplace_catalog_category_items > 0 then
        for _, v1952 in v1948.marketplace_catalog_category_items do
            local v1953 = v1952:encode();
            local v1954, v1955 = v0.writeTag(v1949, v1950, 1, v0.wireTypes.lengthDelimited);
            v1954, v1955 = v0.writeBuffer(v1954, v1955, v1953, buffer.len(v1953));
            v1949 = v1954;
            v1950 = v1955;
        end;
    end;
    if v1948.active_category_id ~= nil and v1948.active_category_id ~= "" then
        local v1956, v1957 = v0.writeTag(v1949, v1950, 2, v0.wireTypes.lengthDelimited);
        v1956, v1957 = v0.writeString(v1956, v1957, v1948.active_category_id);
        v1949 = v1956;
        v1950 = v1957;
    end;
    if v1948.active_tooltip_idx ~= nil and v1948.active_tooltip_idx ~= 0 then
        local v1958, v1959 = v0.writeTag(v1949, v1950, 3, v0.wireTypes.varint);
        v1958, v1959 = v0.writeVarInt(v1958, v1959, v1948.active_tooltip_idx);
        v1949 = v1958;
        v1950 = v1959;
    end;
    local v1960 = buffer.create(v1950);
    buffer.copy(v1960, 0, v1949, 0, v1950);
    return v1960;
end;
v4.decode = function(v1961) --[[ Line: 13158 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_66 (copy), v0 (copy), v2 (copy)
    local v1962 = l_v4_66.new();
    local v1963 = 0;
    while v1963 < buffer.len(v1961) do
        local v1964 = nil;
        local v1965 = nil;
        local v1966, v1967, v1968 = v0.readTag(v1961, v1963);
        v1964 = v1966;
        v1965 = v1967;
        v1963 = v1968;
        if v1965 == v0.wireTypes.varint then
            if v1964 == 3 then
                v1966 = nil;
                v1967, v1968 = v0.readVarIntI64(v1961, v1963);
                v1966 = v1967;
                v1963 = v1968;
                v1962.active_tooltip_idx = v1966;
            else
                v1966 = nil;
                v1967, v1968 = v0.readVarInt(v1961, v1963);
                v1966 = v1967;
                v1963 = v1968;
            end;
        elseif v1965 == v0.wireTypes.lengthDelimited then
            if v1964 == 1 then
                v1966 = nil;
                v1967, v1968 = v0.readBuffer(v1961, v1963);
                v1966 = v1967;
                v1963 = v1968;
                table.insert(v1962.marketplace_catalog_category_items, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(v1966));
            elseif v1964 == 2 then
                v1966 = nil;
                v1967, v1968 = v0.readBuffer(v1961, v1963);
                v1966 = v1967;
                v1963 = v1968;
                v1962.active_category_id = buffer.tostring(v1966);
            else
                v1966 = nil;
                v1967, v1968 = v0.readVarInt(v1961, v1963);
                v1963 = v1968 + v1967;
            end;
        elseif v1965 == v0.wireTypes.i32 then
            v1966 = nil;
            v1967, v1968 = v0.readFixed32(v1961, v1963);
            v1966 = v1967;
            v1963 = v1968;
        elseif v1965 == v0.wireTypes.i64 then
            v1966 = nil;
            v1967, v1968 = v0.readFixed64(v1961, v1963);
            v1966 = v1967;
            v1963 = v1968;
        else
            error("Unsupported wire type: " .. v1965);
        end;
    end;
    return v1962;
end;
v4.jsonEncode = function(v1969) --[[ Line: 13216 ]] --[[ Name: jsonEncode ]]
    local v1970 = {};
    if v1969.marketplace_catalog_category_items ~= nil and #v1969.marketplace_catalog_category_items > 0 then
        local v1971 = {};
        for _, v1973 in v1969.marketplace_catalog_category_items do
            table.insert(v1971, v1973:jsonEncode());
        end;
        v1970.marketplaceCatalogCategoryItems = v1971;
    end;
    if v1969.active_category_id ~= nil and v1969.active_category_id ~= "" then
        v1970.activeCategoryId = v1969.active_category_id;
    end;
    if v1969.active_tooltip_idx ~= nil and v1969.active_tooltip_idx ~= 0 then
        v1970.activeTooltipIdx = v1969.active_tooltip_idx;
    end;
    return v1970;
end;
v4.jsonDecode = function(v1974) --[[ Line: 13240 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_66 (copy), v2 (copy)
    local v1975 = l_v4_66.new();
    if v1974.marketplace_catalog_category_items ~= nil then
        local v1976 = {};
        for _, v1978 in v1974.marketplace_catalog_category_items do
            table.insert(v1976, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1978));
        end;
        v1975.marketplace_catalog_category_items = v1976;
    end;
    if v1974.marketplaceCatalogCategoryItems ~= nil then
        local v1979 = {};
        for _, v1981 in v1974.marketplaceCatalogCategoryItems do
            table.insert(v1979, v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v1981));
        end;
        v1975.marketplace_catalog_category_items = v1979;
    end;
    if v1974.active_category_id ~= nil then
        v1975.active_category_id = v1974.active_category_id;
    end;
    if v1974.activeCategoryId ~= nil then
        v1975.active_category_id = v1974.activeCategoryId;
    end;
    if v1974.active_tooltip_idx ~= nil then
        v1975.active_tooltip_idx = v1974.active_tooltip_idx;
    end;
    if v1974.activeTooltipIdx ~= nil then
        v1975.active_tooltip_idx = v1974.activeTooltipIdx;
    end;
    return v1975;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
};
v2.UAMarketplaceCatalogCategoryMenuInputData = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData);
v4 = {};
v4.__index = v4;
local l_v4_67 = v4 --[[ copy: 4 -> 72 ]];
v4.new = function(v1983) --[[ Line: 13303 ]] --[[ Name: new ]]
    -- upvalues: l_v4_67 (copy)
    return (setmetatable({
        marketplace_catalog_category_item_id = (not (v1983 ~= nil) or v1983.marketplace_catalog_category_item_id == nil) and "" or v1983.marketplace_catalog_category_item_id
    }, l_v4_67));
end;
v4.encode = function(v1984) --[[ Line: 13317 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1985 = buffer.create(0);
    local v1986 = 0;
    if v1984.marketplace_catalog_category_item_id ~= nil and v1984.marketplace_catalog_category_item_id ~= "" then
        local v1987, v1988 = v0.writeTag(v1985, v1986, 1, v0.wireTypes.lengthDelimited);
        v1987, v1988 = v0.writeString(v1987, v1988, v1984.marketplace_catalog_category_item_id);
        v1985 = v1987;
        v1986 = v1988;
    end;
    local v1989 = buffer.create(v1986);
    buffer.copy(v1989, 0, v1985, 0, v1986);
    return v1989;
end;
v4.decode = function(v1990) --[[ Line: 13333 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_67 (copy), v0 (copy)
    local v1991 = l_v4_67.new();
    local v1992 = 0;
    while v1992 < buffer.len(v1990) do
        local v1993 = nil;
        local v1994 = nil;
        local v1995, v1996, v1997 = v0.readTag(v1990, v1992);
        v1993 = v1995;
        v1994 = v1996;
        v1992 = v1997;
        if v1994 == v0.wireTypes.varint then
            v1995 = nil;
            v1996, v1997 = v0.readVarInt(v1990, v1992);
            v1995 = v1996;
            v1992 = v1997;
        elseif v1994 == v0.wireTypes.lengthDelimited then
            if v1993 == 1 then
                v1995 = nil;
                v1996, v1997 = v0.readBuffer(v1990, v1992);
                v1995 = v1996;
                v1992 = v1997;
                v1991.marketplace_catalog_category_item_id = buffer.tostring(v1995);
            else
                v1995 = nil;
                v1996, v1997 = v0.readVarInt(v1990, v1992);
                v1992 = v1997 + v1996;
            end;
        elseif v1994 == v0.wireTypes.i32 then
            v1995 = nil;
            v1996, v1997 = v0.readFixed32(v1990, v1992);
            v1995 = v1996;
            v1992 = v1997;
        elseif v1994 == v0.wireTypes.i64 then
            v1995 = nil;
            v1996, v1997 = v0.readFixed64(v1990, v1992);
            v1995 = v1996;
            v1992 = v1997;
        else
            error("Unsupported wire type: " .. v1994);
        end;
    end;
    return v1991;
end;
v4.jsonEncode = function(v1998) --[[ Line: 13378 ]] --[[ Name: jsonEncode ]]
    local v1999 = {};
    if v1998.marketplace_catalog_category_item_id ~= nil and v1998.marketplace_catalog_category_item_id ~= "" then
        v1999.marketplaceCatalogCategoryItemId = v1998.marketplace_catalog_category_item_id;
    end;
    return v1999;
end;
v4.jsonDecode = function(v2000) --[[ Line: 13390 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_67 (copy)
    local v2001 = l_v4_67.new();
    if v2000.marketplace_catalog_category_item_id ~= nil then
        v2001.marketplace_catalog_category_item_id = v2000.marketplace_catalog_category_item_id;
    end;
    if v2000.marketplaceCatalogCategoryItemId ~= nil then
        v2001.marketplace_catalog_category_item_id = v2000.marketplaceCatalogCategoryItemId;
    end;
    return v2001;
end;
v4.descriptor = {
    name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
};
v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = v4;
v1.default:register(v2.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem);
v4 = {};
v4.__index = v4;
local l_v4_68 = v4 --[[ copy: 4 -> 73 ]];
v4.new = function(v2003) --[[ Line: 13423 ]] --[[ Name: new ]]
    -- upvalues: l_v4_68 (copy)
    return (setmetatable({
        entry_map = if not (v2003 ~= nil) or v2003.entry_map == nil then {} else v2003.entry_map, 
        entry_order = if not (v2003 ~= nil) or v2003.entry_order == nil then {} else v2003.entry_order
    }, l_v4_68));
end;
v4.encode = function(v2004) --[[ Line: 13432 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2005 = buffer.create(0);
    local v2006 = 0;
    if v2004.entry_map ~= nil and next(v2004.entry_map) ~= nil then
        for v2007, v2008 in v2004.entry_map do
            local v2009 = buffer.create(0);
            local v2010, v2011 = v0.writeTag(v2009, 0, 1, v0.wireTypes.lengthDelimited);
            v2010, v2011 = v0.writeString(v2010, v2011, v2007);
            v2009 = v2010;
            local l_v2011_0 = v2011;
            v2010 = v2008:encode();
            local v2013;
            v2011, v2013 = v0.writeTag(v2009, l_v2011_0, 2, v0.wireTypes.lengthDelimited);
            v2011, v2013 = v0.writeBuffer(v2011, v2013, v2010, buffer.len(v2010));
            v2009 = v2011;
            l_v2011_0 = v2013;
            v2011, v2013 = v0.writeTag(v2005, v2006, 1, v0.wireTypes.lengthDelimited);
            v2011, v2013 = v0.writeBuffer(v2011, v2013, v2009, l_v2011_0);
            v2005 = v2011;
            v2006 = v2013;
        end;
    end;
    if v2004.entry_order ~= nil and #v2004.entry_order > 0 then
        for _, v2015 in v2004.entry_order do
            local v2016, v2017 = v0.writeTag(v2005, v2006, 2, v0.wireTypes.lengthDelimited);
            v2016, v2017 = v0.writeString(v2016, v2017, v2015);
            v2005 = v2016;
            v2006 = v2017;
        end;
    end;
    local v2018 = buffer.create(v2006);
    buffer.copy(v2018, 0, v2005, 0, v2006);
    return v2018;
end;
v4.decode = function(v2019) --[[ Line: 13462 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_68 (copy), v0 (copy), v2 (copy)
    local v2020 = l_v4_68.new();
    local v2021 = 0;
    while v2021 < buffer.len(v2019) do
        local v2022 = nil;
        local v2023 = nil;
        local v2024, v2025, v2026 = v0.readTag(v2019, v2021);
        v2022 = v2024;
        v2023 = v2025;
        v2021 = v2026;
        if v2023 == v0.wireTypes.varint then
            v2024 = nil;
            v2025, v2026 = v0.readVarInt(v2019, v2021);
            v2024 = v2025;
            v2021 = v2026;
        elseif v2023 == v0.wireTypes.lengthDelimited then
            if v2022 == 1 then
                v2024 = nil;
                v2025, v2026 = v0.readBuffer(v2019, v2021);
                v2024 = v2025;
                v2021 = v2026;
                v2025 = v2.SearchResultsFeedInputData_EntryMapEntry.decode(v2024);
                v2026 = v2.FeedEntry.new();
                v2020.entry_map[v2025.key or ""] = v2025.value or v2026;
            elseif v2022 == 2 then
                v2024 = nil;
                v2025, v2026 = v0.readBuffer(v2019, v2021);
                v2024 = v2025;
                v2021 = v2026;
                table.insert(v2020.entry_order, buffer.tostring(v2024));
            else
                v2024 = nil;
                v2025, v2026 = v0.readVarInt(v2019, v2021);
                v2021 = v2026 + v2025;
            end;
        elseif v2023 == v0.wireTypes.i32 then
            v2024 = nil;
            v2025, v2026 = v0.readFixed32(v2019, v2021);
            v2024 = v2025;
            v2021 = v2026;
        elseif v2023 == v0.wireTypes.i64 then
            v2024 = nil;
            v2025, v2026 = v0.readFixed64(v2019, v2021);
            v2024 = v2025;
            v2021 = v2026;
        else
            error("Unsupported wire type: " .. v2023);
        end;
    end;
    return v2020;
end;
v4.jsonEncode = function(v2027) --[[ Line: 13517 ]] --[[ Name: jsonEncode ]]
    local v2028 = {};
    if v2027.entry_map ~= nil and next(v2027.entry_map) ~= nil then
        local v2029 = {};
        for v2030, v2031 in v2027.entry_map do
            v2029[v2030] = v2031:jsonEncode();
        end;
        v2028.entryMap = v2029;
    end;
    if v2027.entry_order ~= nil and #v2027.entry_order > 0 then
        local v2032 = {};
        for _, v2034 in v2027.entry_order do
            table.insert(v2032, v2034);
        end;
        v2028.entryOrder = v2032;
    end;
    return v2028;
end;
v4.jsonDecode = function(v2035) --[[ Line: 13539 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_68 (copy), v2 (copy)
    local v2036 = l_v4_68.new();
    if v2035.entry_map ~= nil then
        local v2037 = {};
        for v2038, v2039 in v2035.entry_map do
            v2037[v2038] = v2.FeedEntry.jsonDecode(v2039);
        end;
        v2036.entry_map = v2037;
    end;
    if v2035.entryMap ~= nil then
        local v2040 = {};
        for v2041, v2042 in v2035.entryMap do
            v2040[v2041] = v2.FeedEntry.jsonDecode(v2042);
        end;
        v2036.entry_map = v2040;
    end;
    if v2035.entry_order ~= nil then
        local v2043 = {};
        for _, v2045 in v2035.entry_order do
            table.insert(v2043, v2045);
        end;
        v2036.entry_order = v2043;
    end;
    if v2035.entryOrder ~= nil then
        local v2046 = {};
        for _, v2048 in v2035.entryOrder do
            table.insert(v2046, v2048);
        end;
        v2036.entry_order = v2046;
    end;
    return v2036;
end;
v4.descriptor = {
    name = "SearchResultsFeedInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
};
v2.SearchResultsFeedInputData = v4;
v1.default:register(v2.SearchResultsFeedInputData);
v4 = {};
v4.__index = v4;
local l_v4_69 = v4 --[[ copy: 4 -> 74 ]];
v4.new = function(v2050) --[[ Line: 13595 ]] --[[ Name: new ]]
    -- upvalues: l_v4_69 (copy)
    return (setmetatable({
        key = (not (v2050 ~= nil) or v2050.key == nil) and "" or v2050.key, 
        value = if not (v2050 ~= nil) or v2050.value == nil then nil else v2050.value
    }, l_v4_69));
end;
v4.encode = function(v2051) --[[ Line: 13604 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2052 = buffer.create(0);
    local v2053 = 0;
    if v2051.key ~= nil and v2051.key ~= "" then
        local v2054, v2055 = v0.writeTag(v2052, v2053, 1, v0.wireTypes.lengthDelimited);
        v2054, v2055 = v0.writeString(v2054, v2055, v2051.key);
        v2052 = v2054;
        v2053 = v2055;
    end;
    if v2051.value ~= nil then
        local v2056 = v2051.value:encode();
        local v2057, v2058 = v0.writeTag(v2052, v2053, 2, v0.wireTypes.lengthDelimited);
        v2057, v2058 = v0.writeBuffer(v2057, v2058, v2056, buffer.len(v2056));
        v2052 = v2057;
        v2053 = v2058;
    end;
    local v2059 = buffer.create(v2053);
    buffer.copy(v2059, 0, v2052, 0, v2053);
    return v2059;
end;
v4.decode = function(v2060) --[[ Line: 13626 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_69 (copy), v0 (copy), v2 (copy)
    local v2061 = l_v4_69.new();
    local v2062 = 0;
    while v2062 < buffer.len(v2060) do
        local v2063 = nil;
        local v2064 = nil;
        local v2065, v2066, v2067 = v0.readTag(v2060, v2062);
        v2063 = v2065;
        v2064 = v2066;
        v2062 = v2067;
        if v2064 == v0.wireTypes.varint then
            v2065 = nil;
            v2066, v2067 = v0.readVarInt(v2060, v2062);
            v2065 = v2066;
            v2062 = v2067;
        elseif v2064 == v0.wireTypes.lengthDelimited then
            if v2063 == 1 then
                v2065 = nil;
                v2066, v2067 = v0.readBuffer(v2060, v2062);
                v2065 = v2066;
                v2062 = v2067;
                v2061.key = buffer.tostring(v2065);
            elseif v2063 == 2 then
                v2065 = nil;
                v2066, v2067 = v0.readBuffer(v2060, v2062);
                v2065 = v2066;
                v2062 = v2067;
                v2061.value = v2.FeedEntry.decode(v2065);
            else
                v2065 = nil;
                v2066, v2067 = v0.readVarInt(v2060, v2062);
                v2062 = v2067 + v2066;
            end;
        elseif v2064 == v0.wireTypes.i32 then
            v2065 = nil;
            v2066, v2067 = v0.readFixed32(v2060, v2062);
            v2065 = v2066;
            v2062 = v2067;
        elseif v2064 == v0.wireTypes.i64 then
            v2065 = nil;
            v2066, v2067 = v0.readFixed64(v2060, v2062);
            v2065 = v2066;
            v2062 = v2067;
        else
            error("Unsupported wire type: " .. v2064);
        end;
    end;
    return v2061;
end;
v4.jsonEncode = function(v2068) --[[ Line: 13676 ]] --[[ Name: jsonEncode ]]
    local v2069 = {};
    if v2068.key ~= nil and v2068.key ~= "" then
        v2069.key = v2068.key;
    end;
    if v2068.value ~= nil then
        v2069.value = v2068.value:jsonEncode();
    end;
    return v2069;
end;
v4.jsonDecode = function(v2070) --[[ Line: 13692 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_69 (copy), v2 (copy)
    local v2071 = l_v4_69.new();
    if v2070.key ~= nil then
        v2071.key = v2070.key;
    end;
    if v2070.value ~= nil then
        v2071.value = v2.FeedEntry.jsonDecode(v2070.value);
    end;
    return v2071;
end;
v4.descriptor = {
    name = "SearchResultsFeedInputData_EntryMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
};
v2.SearchResultsFeedInputData_EntryMapEntry = v4;
v1.default:register(v2.SearchResultsFeedInputData_EntryMapEntry);
v4 = {};
v4.__index = v4;
local l_v4_70 = v4 --[[ copy: 4 -> 75 ]];
v4.new = function(v2073) --[[ Line: 13722 ]] --[[ Name: new ]]
    -- upvalues: l_v4_70 (copy)
    return (setmetatable({
        title = (not (v2073 ~= nil) or v2073.title == nil) and "" or v2073.title, 
        user_items = if not (v2073 ~= nil) or v2073.user_items == nil then {} else v2073.user_items, 
        max_visible_rows = (not (v2073 ~= nil) or v2073.max_visible_rows == nil) and 0 or v2073.max_visible_rows
    }, l_v4_70));
end;
v4.encode = function(v2074) --[[ Line: 13730 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2075 = buffer.create(0);
    local v2076 = 0;
    if v2074.title ~= nil and v2074.title ~= "" then
        local v2077, v2078 = v0.writeTag(v2075, v2076, 1, v0.wireTypes.lengthDelimited);
        v2077, v2078 = v0.writeString(v2077, v2078, v2074.title);
        v2075 = v2077;
        v2076 = v2078;
    end;
    if v2074.user_items ~= nil and #v2074.user_items > 0 then
        for _, v2080 in v2074.user_items do
            local v2081 = v2080:encode();
            local v2082, v2083 = v0.writeTag(v2075, v2076, 2, v0.wireTypes.lengthDelimited);
            v2082, v2083 = v0.writeBuffer(v2082, v2083, v2081, buffer.len(v2081));
            v2075 = v2082;
            v2076 = v2083;
        end;
    end;
    if v2074.max_visible_rows ~= nil and v2074.max_visible_rows ~= 0 then
        local v2084, v2085 = v0.writeTag(v2075, v2076, 3, v0.wireTypes.varint);
        v2084, v2085 = v0.writeVarInt(v2084, v2085, v2074.max_visible_rows);
        v2075 = v2084;
        v2076 = v2085;
    end;
    local v2086 = buffer.create(v2076);
    buffer.copy(v2086, 0, v2075, 0, v2076);
    return v2086;
end;
v4.decode = function(v2087) --[[ Line: 13757 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_70 (copy), v0 (copy), v2 (copy)
    local v2088 = l_v4_70.new();
    local v2089 = 0;
    while v2089 < buffer.len(v2087) do
        local v2090 = nil;
        local v2091 = nil;
        local v2092, v2093, v2094 = v0.readTag(v2087, v2089);
        v2090 = v2092;
        v2091 = v2093;
        v2089 = v2094;
        if v2091 == v0.wireTypes.varint then
            if v2090 == 3 then
                v2092 = nil;
                v2093, v2094 = v0.readVarIntI32(v2087, v2089);
                v2092 = v2093;
                v2089 = v2094;
                v2088.max_visible_rows = v2092;
            else
                v2092 = nil;
                v2093, v2094 = v0.readVarInt(v2087, v2089);
                v2092 = v2093;
                v2089 = v2094;
            end;
        elseif v2091 == v0.wireTypes.lengthDelimited then
            if v2090 == 1 then
                v2092 = nil;
                v2093, v2094 = v0.readBuffer(v2087, v2089);
                v2092 = v2093;
                v2089 = v2094;
                v2088.title = buffer.tostring(v2092);
            elseif v2090 == 2 then
                v2092 = nil;
                v2093, v2094 = v0.readBuffer(v2087, v2089);
                v2092 = v2093;
                v2089 = v2094;
                table.insert(v2088.user_items, v2.UserListInputData_UserItem.decode(v2092));
            else
                v2092 = nil;
                v2093, v2094 = v0.readVarInt(v2087, v2089);
                v2089 = v2094 + v2093;
            end;
        elseif v2091 == v0.wireTypes.i32 then
            v2092 = nil;
            v2093, v2094 = v0.readFixed32(v2087, v2089);
            v2092 = v2093;
            v2089 = v2094;
        elseif v2091 == v0.wireTypes.i64 then
            v2092 = nil;
            v2093, v2094 = v0.readFixed64(v2087, v2089);
            v2092 = v2093;
            v2089 = v2094;
        else
            error("Unsupported wire type: " .. v2091);
        end;
    end;
    return v2088;
end;
v4.jsonEncode = function(v2095) --[[ Line: 13810 ]] --[[ Name: jsonEncode ]]
    local v2096 = {};
    if v2095.title ~= nil and v2095.title ~= "" then
        v2096.title = v2095.title;
    end;
    if v2095.user_items ~= nil and #v2095.user_items > 0 then
        local v2097 = {};
        for _, v2099 in v2095.user_items do
            table.insert(v2097, v2099:jsonEncode());
        end;
        v2096.userItems = v2097;
    end;
    if v2095.max_visible_rows ~= nil and v2095.max_visible_rows ~= 0 then
        v2096.maxVisibleRows = v2095.max_visible_rows;
    end;
    return v2096;
end;
v4.jsonDecode = function(v2100) --[[ Line: 13832 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_70 (copy), v2 (copy)
    local v2101 = l_v4_70.new();
    if v2100.title ~= nil then
        v2101.title = v2100.title;
    end;
    if v2100.user_items ~= nil then
        local v2102 = {};
        for _, v2104 in v2100.user_items do
            table.insert(v2102, v2.UserListInputData_UserItem.jsonDecode(v2104));
        end;
        v2101.user_items = v2102;
    end;
    if v2100.userItems ~= nil then
        local v2105 = {};
        for _, v2107 in v2100.userItems do
            table.insert(v2105, v2.UserListInputData_UserItem.jsonDecode(v2107));
        end;
        v2101.user_items = v2105;
    end;
    if v2100.max_visible_rows ~= nil then
        v2101.max_visible_rows = v2100.max_visible_rows;
    end;
    if v2100.maxVisibleRows ~= nil then
        v2101.max_visible_rows = v2100.maxVisibleRows;
    end;
    return v2101;
end;
v4.descriptor = {
    name = "UserListInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
};
v2.UserListInputData = v4;
v1.default:register(v2.UserListInputData);
v4 = {};
v4.__index = v4;
local l_v4_71 = v4 --[[ copy: 4 -> 76 ]];
v4.new = function(v2109) --[[ Line: 13882 ]] --[[ Name: new ]]
    -- upvalues: l_v4_71 (copy)
    return (setmetatable({
        user_id = (not (v2109 ~= nil) or v2109.user_id == nil) and "" or v2109.user_id
    }, l_v4_71));
end;
v4.encode = function(v2110) --[[ Line: 13890 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2111 = buffer.create(0);
    local v2112 = 0;
    if v2110.user_id ~= nil and v2110.user_id ~= "" then
        local v2113, v2114 = v0.writeTag(v2111, v2112, 1, v0.wireTypes.lengthDelimited);
        v2113, v2114 = v0.writeString(v2113, v2114, v2110.user_id);
        v2111 = v2113;
        v2112 = v2114;
    end;
    local v2115 = buffer.create(v2112);
    buffer.copy(v2115, 0, v2111, 0, v2112);
    return v2115;
end;
v4.decode = function(v2116) --[[ Line: 13904 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_71 (copy), v0 (copy)
    local v2117 = l_v4_71.new();
    local v2118 = 0;
    while v2118 < buffer.len(v2116) do
        local v2119 = nil;
        local v2120 = nil;
        local v2121, v2122, v2123 = v0.readTag(v2116, v2118);
        v2119 = v2121;
        v2120 = v2122;
        v2118 = v2123;
        if v2120 == v0.wireTypes.varint then
            v2121 = nil;
            v2122, v2123 = v0.readVarInt(v2116, v2118);
            v2121 = v2122;
            v2118 = v2123;
        elseif v2120 == v0.wireTypes.lengthDelimited then
            if v2119 == 1 then
                v2121 = nil;
                v2122, v2123 = v0.readBuffer(v2116, v2118);
                v2121 = v2122;
                v2118 = v2123;
                v2117.user_id = buffer.tostring(v2121);
            else
                v2121 = nil;
                v2122, v2123 = v0.readVarInt(v2116, v2118);
                v2118 = v2123 + v2122;
            end;
        elseif v2120 == v0.wireTypes.i32 then
            v2121 = nil;
            v2122, v2123 = v0.readFixed32(v2116, v2118);
            v2121 = v2122;
            v2118 = v2123;
        elseif v2120 == v0.wireTypes.i64 then
            v2121 = nil;
            v2122, v2123 = v0.readFixed64(v2116, v2118);
            v2121 = v2122;
            v2118 = v2123;
        else
            error("Unsupported wire type: " .. v2120);
        end;
    end;
    return v2117;
end;
v4.jsonEncode = function(v2124) --[[ Line: 13947 ]] --[[ Name: jsonEncode ]]
    local v2125 = {};
    if v2124.user_id ~= nil and v2124.user_id ~= "" then
        v2125.userId = v2124.user_id;
    end;
    return v2125;
end;
v4.jsonDecode = function(v2126) --[[ Line: 13957 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_71 (copy)
    local v2127 = l_v4_71.new();
    if v2126.user_id ~= nil then
        v2127.user_id = v2126.user_id;
    end;
    if v2126.userId ~= nil then
        v2127.user_id = v2126.userId;
    end;
    return v2127;
end;
v4.descriptor = {
    name = "UserListInputData_UserItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
};
v2.UserListInputData_UserItem = v4;
v1.default:register(v2.UserListInputData_UserItem);
v4 = {};
v4.__index = v4;
local l_v4_72 = v4 --[[ copy: 4 -> 77 ]];
v4.new = function(v2129) --[[ Line: 13985 ]] --[[ Name: new ]]
    -- upvalues: l_v4_72 (copy)
    return (setmetatable({
        title = (not (v2129 ~= nil) or v2129.title == nil) and "" or v2129.title, 
        items = if not (v2129 ~= nil) or v2129.items == nil then {} else v2129.items, 
        max_visible_rows = (not (v2129 ~= nil) or v2129.max_visible_rows == nil) and 0 or v2129.max_visible_rows
    }, l_v4_72));
end;
v4.encode = function(v2130) --[[ Line: 13993 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2131 = buffer.create(0);
    local v2132 = 0;
    if v2130.title ~= nil and v2130.title ~= "" then
        local v2133, v2134 = v0.writeTag(v2131, v2132, 1, v0.wireTypes.lengthDelimited);
        v2133, v2134 = v0.writeString(v2133, v2134, v2130.title);
        v2131 = v2133;
        v2132 = v2134;
    end;
    if v2130.items ~= nil and #v2130.items > 0 then
        for _, v2136 in v2130.items do
            local v2137 = v2136:encode();
            local v2138, v2139 = v0.writeTag(v2131, v2132, 2, v0.wireTypes.lengthDelimited);
            v2138, v2139 = v0.writeBuffer(v2138, v2139, v2137, buffer.len(v2137));
            v2131 = v2138;
            v2132 = v2139;
        end;
    end;
    if v2130.max_visible_rows ~= nil and v2130.max_visible_rows ~= 0 then
        local v2140, v2141 = v0.writeTag(v2131, v2132, 3, v0.wireTypes.varint);
        v2140, v2141 = v0.writeVarInt(v2140, v2141, v2130.max_visible_rows);
        v2131 = v2140;
        v2132 = v2141;
    end;
    local v2142 = buffer.create(v2132);
    buffer.copy(v2142, 0, v2131, 0, v2132);
    return v2142;
end;
v4.decode = function(v2143) --[[ Line: 14020 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_72 (copy), v0 (copy), v2 (copy)
    local v2144 = l_v4_72.new();
    local v2145 = 0;
    while v2145 < buffer.len(v2143) do
        local v2146 = nil;
        local v2147 = nil;
        local v2148, v2149, v2150 = v0.readTag(v2143, v2145);
        v2146 = v2148;
        v2147 = v2149;
        v2145 = v2150;
        if v2147 == v0.wireTypes.varint then
            if v2146 == 3 then
                v2148 = nil;
                v2149, v2150 = v0.readVarIntI32(v2143, v2145);
                v2148 = v2149;
                v2145 = v2150;
                v2144.max_visible_rows = v2148;
            else
                v2148 = nil;
                v2149, v2150 = v0.readVarInt(v2143, v2145);
                v2148 = v2149;
                v2145 = v2150;
            end;
        elseif v2147 == v0.wireTypes.lengthDelimited then
            if v2146 == 1 then
                v2148 = nil;
                v2149, v2150 = v0.readBuffer(v2143, v2145);
                v2148 = v2149;
                v2145 = v2150;
                v2144.title = buffer.tostring(v2148);
            elseif v2146 == 2 then
                v2148 = nil;
                v2149, v2150 = v0.readBuffer(v2143, v2145);
                v2148 = v2149;
                v2145 = v2150;
                table.insert(v2144.items, v2.CatalogItemListInputData_CatalogItem.decode(v2148));
            else
                v2148 = nil;
                v2149, v2150 = v0.readVarInt(v2143, v2145);
                v2145 = v2150 + v2149;
            end;
        elseif v2147 == v0.wireTypes.i32 then
            v2148 = nil;
            v2149, v2150 = v0.readFixed32(v2143, v2145);
            v2148 = v2149;
            v2145 = v2150;
        elseif v2147 == v0.wireTypes.i64 then
            v2148 = nil;
            v2149, v2150 = v0.readFixed64(v2143, v2145);
            v2148 = v2149;
            v2145 = v2150;
        else
            error("Unsupported wire type: " .. v2147);
        end;
    end;
    return v2144;
end;
v4.jsonEncode = function(v2151) --[[ Line: 14073 ]] --[[ Name: jsonEncode ]]
    local v2152 = {};
    if v2151.title ~= nil and v2151.title ~= "" then
        v2152.title = v2151.title;
    end;
    if v2151.items ~= nil and #v2151.items > 0 then
        local v2153 = {};
        for _, v2155 in v2151.items do
            table.insert(v2153, v2155:jsonEncode());
        end;
        v2152.items = v2153;
    end;
    if v2151.max_visible_rows ~= nil and v2151.max_visible_rows ~= 0 then
        v2152.maxVisibleRows = v2151.max_visible_rows;
    end;
    return v2152;
end;
v4.jsonDecode = function(v2156) --[[ Line: 14095 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_72 (copy), v2 (copy)
    local v2157 = l_v4_72.new();
    if v2156.title ~= nil then
        v2157.title = v2156.title;
    end;
    if v2156.items ~= nil then
        local v2158 = {};
        for _, v2160 in v2156.items do
            table.insert(v2158, v2.CatalogItemListInputData_CatalogItem.jsonDecode(v2160));
        end;
        v2157.items = v2158;
    end;
    if v2156.max_visible_rows ~= nil then
        v2157.max_visible_rows = v2156.max_visible_rows;
    end;
    if v2156.maxVisibleRows ~= nil then
        v2157.max_visible_rows = v2156.maxVisibleRows;
    end;
    return v2157;
end;
v4.descriptor = {
    name = "CatalogItemListInputData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
};
v2.CatalogItemListInputData = v4;
v1.default:register(v2.CatalogItemListInputData);
v4 = {};
v4.__index = v4;
v4.new = function(v2161) --[[ Line: 14136 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        item_id = (not (v2161 ~= nil) or v2161.item_id == nil) and "" or v2161.item_id, 
        item_type = (not (v2161 ~= nil) or v2161.item_type == nil) and "" or v2161.item_type
    }, v4));
end;
v4.encode = function(v2162) --[[ Line: 14145 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2163 = buffer.create(0);
    local v2164 = 0;
    if v2162.item_id ~= nil and v2162.item_id ~= "" then
        local v2165, v2166 = v0.writeTag(v2163, v2164, 1, v0.wireTypes.lengthDelimited);
        v2165, v2166 = v0.writeString(v2165, v2166, v2162.item_id);
        v2163 = v2165;
        v2164 = v2166;
    end;
    if v2162.item_type ~= nil and v2162.item_type ~= "" then
        local v2167, v2168 = v0.writeTag(v2163, v2164, 2, v0.wireTypes.lengthDelimited);
        v2167, v2168 = v0.writeString(v2167, v2168, v2162.item_type);
        v2163 = v2167;
        v2164 = v2168;
    end;
    local v2169 = buffer.create(v2164);
    buffer.copy(v2169, 0, v2163, 0, v2164);
    return v2169;
end;
v4.decode = function(v2170) --[[ Line: 14164 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v2171 = v4.new();
    local v2172 = 0;
    while v2172 < buffer.len(v2170) do
        local v2173 = nil;
        local v2174 = nil;
        local v2175, v2176, v2177 = v0.readTag(v2170, v2172);
        v2173 = v2175;
        v2174 = v2176;
        v2172 = v2177;
        if v2174 == v0.wireTypes.varint then
            v2175 = nil;
            v2176, v2177 = v0.readVarInt(v2170, v2172);
            v2175 = v2176;
            v2172 = v2177;
        elseif v2174 == v0.wireTypes.lengthDelimited then
            if v2173 == 1 then
                v2175 = nil;
                v2176, v2177 = v0.readBuffer(v2170, v2172);
                v2175 = v2176;
                v2172 = v2177;
                v2171.item_id = buffer.tostring(v2175);
            elseif v2173 == 2 then
                v2175 = nil;
                v2176, v2177 = v0.readBuffer(v2170, v2172);
                v2175 = v2176;
                v2172 = v2177;
                v2171.item_type = buffer.tostring(v2175);
            else
                v2175 = nil;
                v2176, v2177 = v0.readVarInt(v2170, v2172);
                v2172 = v2177 + v2176;
            end;
        elseif v2174 == v0.wireTypes.i32 then
            v2175 = nil;
            v2176, v2177 = v0.readFixed32(v2170, v2172);
            v2175 = v2176;
            v2172 = v2177;
        elseif v2174 == v0.wireTypes.i64 then
            v2175 = nil;
            v2176, v2177 = v0.readFixed64(v2170, v2172);
            v2175 = v2176;
            v2172 = v2177;
        else
            error("Unsupported wire type: " .. v2174);
        end;
    end;
    return v2171;
end;
v4.jsonEncode = function(v2178) --[[ Line: 14212 ]] --[[ Name: jsonEncode ]]
    local v2179 = {};
    if v2178.item_id ~= nil and v2178.item_id ~= "" then
        v2179.itemId = v2178.item_id;
    end;
    if v2178.item_type ~= nil and v2178.item_type ~= "" then
        v2179.itemType = v2178.item_type;
    end;
    return v2179;
end;
v4.jsonDecode = function(v2180) --[[ Line: 14226 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy)
    local v2181 = v4.new();
    if v2180.item_id ~= nil then
        v2181.item_id = v2180.item_id;
    end;
    if v2180.itemId ~= nil then
        v2181.item_id = v2180.itemId;
    end;
    if v2180.item_type ~= nil then
        v2181.item_type = v2180.item_type;
    end;
    if v2180.itemType ~= nil then
        v2181.item_type = v2180.itemType;
    end;
    return v2181;
end;
v4.descriptor = {
    name = "CatalogItemListInputData_CatalogItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
};
v2.CatalogItemListInputData_CatalogItem = v4;
v1.default:register(v2.CatalogItemListInputData_CatalogItem);
v2.PageEntryFormat = {
    fromNumber = function(v2182) --[[ Line: 14261 ]] --[[ Name: fromNumber ]]
        if v2182 == 0 then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v2182 == 1 then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end, 
    toNumber = function(v2183) --[[ Line: 14271 ]] --[[ Name: toNumber ]]
        if v2183 == "PAGE_ENTRY_FORMAT_INVALID" then
            return 0;
        elseif v2183 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return 1;
        else
            return v2183;
        end;
    end, 
    fromName = function(v2184) --[[ Line: 14281 ]] --[[ Name: fromName ]]
        if v2184 == "PAGE_ENTRY_FORMAT_INVALID" then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v2184 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
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
    ExperienceDetailsBannerImageInputData = v2.ExperienceDetailsBannerImageInputData, 
    ExperienceDetailsStickyHeaderInputData = v2.ExperienceDetailsStickyHeaderInputData, 
    ExperienceAttributionRowInputData = v2.ExperienceAttributionRowInputData, 
    ExperienceActionModuleInputData = v2.ExperienceActionModuleInputData, 
    ExperienceMediaGalleryInputData = v2.ExperienceMediaGalleryInputData, 
    ExperienceMediaGalleryInputData_MediaItem = v2.ExperienceMediaGalleryInputData_MediaItem, 
    ExperienceDescriptionInputData = v2.ExperienceDescriptionInputData, 
    ExperienceStatRowInputData = v2.ExperienceStatRowInputData, 
    ExperienceInfoTableInputData = v2.ExperienceInfoTableInputData, 
    ExperienceContentRatingLabelInputData = v2.ExperienceContentRatingLabelInputData, 
    ExperienceRefundPolicyInputData = v2.ExperienceRefundPolicyInputData, 
    SocialLinkRowInputData = v2.SocialLinkRowInputData, 
    SocialLinkRowInputData_SocialLinkItem = v2.SocialLinkRowInputData_SocialLinkItem, 
    ExperienceCarouselInputData = v2.ExperienceCarouselInputData, 
    ExperienceCarouselInputData_UniverseItem = v2.ExperienceCarouselInputData_UniverseItem, 
    SongCarouselInputData = v2.SongCarouselInputData, 
    SongCarouselInputData_SongItem = v2.SongCarouselInputData_SongItem, 
    EventsCarouselInputData = v2.EventsCarouselInputData, 
    EventsCarouselInputData_EventItem = v2.EventsCarouselInputData_EventItem, 
    DevStoreFeedInputData = v2.DevStoreFeedInputData, 
    GamePassCollectionInputData = v2.GamePassCollectionInputData, 
    GamePassCollectionInputData_GamePassItem = v2.GamePassCollectionInputData_GamePassItem, 
    DeveloperProductCollectionInputData = v2.DeveloperProductCollectionInputData, 
    DeveloperProductCollectionInputData_DeveloperProductItem = v2.DeveloperProductCollectionInputData_DeveloperProductItem, 
    SubscriptionCollectionInputData = v2.SubscriptionCollectionInputData, 
    SubscriptionCollectionInputData_SubscriptionItem = v2.SubscriptionCollectionInputData_SubscriptionItem, 
    CardContainerCardInputData = v2.CardContainerCardInputData, 
    CardContainerInputData = v2.CardContainerInputData, 
    CardInputData = v2.CardInputData, 
    DialogInputData = v2.DialogInputData, 
    BannerInputData = v2.BannerInputData, 
    TooltipInputData = v2.TooltipInputData, 
    CoachmarkInputData = v2.CoachmarkInputData, 
    EventDetailsFeedInputData = v2.EventDetailsFeedInputData, 
    EventDetailsActionBarInputData = v2.EventDetailsActionBarInputData, 
    EventDescriptionInputData = v2.EventDescriptionInputData, 
    EventAttributionRowInputData = v2.EventAttributionRowInputData, 
    EventInfoTableInputData = v2.EventInfoTableInputData, 
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
    SearchResultsFeedInputData = v2.SearchResultsFeedInputData, 
    UserListInputData = v2.UserListInputData, 
    UserListInputData_UserItem = v2.UserListInputData_UserItem, 
    CatalogItemListInputData = v2.CatalogItemListInputData, 
    CatalogItemListInputData_CatalogItem = v2.CatalogItemListInputData_CatalogItem, 
    PageEntryFormat = v2.PageEntryFormat
};