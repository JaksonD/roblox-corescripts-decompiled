local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 222 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        feed_page_token = (not (v8 ~= nil) or v8.feed_page_token == nil) and "" or v8.feed_page_token, 
        device = (not (v8 ~= nil) or v8.device == nil) and "" or v8.device, 
        country = (not (v8 ~= nil) or v8.country == nil) and "" or v8.country, 
        age_group = (not (v8 ~= nil) or v8.age_group == nil) and "" or v8.age_group, 
        session_id = (not (v8 ~= nil) or v8.session_id == nil) and "" or v8.session_id, 
        entry_pagination_key = (not (v8 ~= nil) or v8.entry_pagination_key == nil) and "" or v8.entry_pagination_key, 
        entry_page_token = (not (v8 ~= nil) or v8.entry_page_token == nil) and "" or v8.entry_page_token
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 236 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.feed_page_token ~= nil and v9.feed_page_token ~= "" then
        local v12, v13 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v9.feed_page_token);
        v10 = v12;
        v11 = v13;
    end;
    if v9.device ~= nil and v9.device ~= "" then
        local v14, v15 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v9.device);
        v10 = v14;
        v11 = v15;
    end;
    if v9.country ~= nil and v9.country ~= "" then
        local v16, v17 = v0.writeTag(v10, v11, 3, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeString(v16, v17, v9.country);
        v10 = v16;
        v11 = v17;
    end;
    if v9.age_group ~= nil and v9.age_group ~= "" then
        local v18, v19 = v0.writeTag(v10, v11, 4, v0.wireTypes.lengthDelimited);
        v18, v19 = v0.writeString(v18, v19, v9.age_group);
        v10 = v18;
        v11 = v19;
    end;
    if v9.session_id ~= nil and v9.session_id ~= "" then
        local v20, v21 = v0.writeTag(v10, v11, 5, v0.wireTypes.lengthDelimited);
        v20, v21 = v0.writeString(v20, v21, v9.session_id);
        v10 = v20;
        v11 = v21;
    end;
    if v9.entry_pagination_key ~= nil and v9.entry_pagination_key ~= "" then
        local v22, v23 = v0.writeTag(v10, v11, 6, v0.wireTypes.lengthDelimited);
        v22, v23 = v0.writeString(v22, v23, v9.entry_pagination_key);
        v10 = v22;
        v11 = v23;
    end;
    if v9.entry_page_token ~= nil and v9.entry_page_token ~= "" then
        local v24, v25 = v0.writeTag(v10, v11, 7, v0.wireTypes.lengthDelimited);
        v24, v25 = v0.writeString(v24, v25, v9.entry_page_token);
        v10 = v24;
        v11 = v25;
    end;
    local v26 = buffer.create(v11);
    buffer.copy(v26, 0, v10, 0, v11);
    return v26;
end;
v6.decode = function(v27) --[[ Line: 280 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy)
    local v28 = l_v6_0.new();
    local v29 = 0;
    while v29 < buffer.len(v27) do
        local v30 = nil;
        local v31 = nil;
        local v32, v33, v34 = v0.readTag(v27, v29);
        v30 = v32;
        v31 = v33;
        v29 = v34;
        if v31 == v0.wireTypes.varint then
            v32 = nil;
            v33, v34 = v0.readVarInt(v27, v29);
            v32 = v33;
            v29 = v34;
        elseif v31 == v0.wireTypes.lengthDelimited then
            if v30 == 1 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.feed_page_token = buffer.tostring(v32);
            elseif v30 == 2 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.device = buffer.tostring(v32);
            elseif v30 == 3 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.country = buffer.tostring(v32);
            elseif v30 == 4 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.age_group = buffer.tostring(v32);
            elseif v30 == 5 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.session_id = buffer.tostring(v32);
            elseif v30 == 6 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.entry_pagination_key = buffer.tostring(v32);
            elseif v30 == 7 then
                v32 = nil;
                v33, v34 = v0.readBuffer(v27, v29);
                v32 = v33;
                v29 = v34;
                v28.entry_page_token = buffer.tostring(v32);
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
v6.jsonEncode = function(v35) --[[ Line: 353 ]] --[[ Name: jsonEncode ]]
    local v36 = {};
    if v35.feed_page_token ~= nil and v35.feed_page_token ~= "" then
        v36.feedPageToken = v35.feed_page_token;
    end;
    if v35.device ~= nil and v35.device ~= "" then
        v36.device = v35.device;
    end;
    if v35.country ~= nil and v35.country ~= "" then
        v36.country = v35.country;
    end;
    if v35.age_group ~= nil and v35.age_group ~= "" then
        v36.ageGroup = v35.age_group;
    end;
    if v35.session_id ~= nil and v35.session_id ~= "" then
        v36.sessionId = v35.session_id;
    end;
    if v35.entry_pagination_key ~= nil and v35.entry_pagination_key ~= "" then
        v36.entryPaginationKey = v35.entry_pagination_key;
    end;
    if v35.entry_page_token ~= nil and v35.entry_page_token ~= "" then
        v36.entryPageToken = v35.entry_page_token;
    end;
    return v36;
end;
v6.jsonDecode = function(v37) --[[ Line: 387 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy)
    local v38 = l_v6_0.new();
    if v37.feed_page_token ~= nil then
        v38.feed_page_token = v37.feed_page_token;
    end;
    if v37.feedPageToken ~= nil then
        v38.feed_page_token = v37.feedPageToken;
    end;
    if v37.device ~= nil then
        v38.device = v37.device;
    end;
    if v37.country ~= nil then
        v38.country = v37.country;
    end;
    if v37.age_group ~= nil then
        v38.age_group = v37.age_group;
    end;
    if v37.ageGroup ~= nil then
        v38.age_group = v37.ageGroup;
    end;
    if v37.session_id ~= nil then
        v38.session_id = v37.session_id;
    end;
    if v37.sessionId ~= nil then
        v38.session_id = v37.sessionId;
    end;
    if v37.entry_pagination_key ~= nil then
        v38.entry_pagination_key = v37.entry_pagination_key;
    end;
    if v37.entryPaginationKey ~= nil then
        v38.entry_pagination_key = v37.entryPaginationKey;
    end;
    if v37.entry_page_token ~= nil then
        v38.entry_page_token = v37.entry_page_token;
    end;
    if v37.entryPageToken ~= nil then
        v38.entry_page_token = v37.entryPageToken;
    end;
    return v38;
end;
v6.descriptor = {
    name = "GetChartsPageRequest", 
    fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageRequest"
};
v2.GetChartsPageRequest = v6;
v1.default:register(v2.GetChartsPageRequest);
v6 = {};
v6.__index = v6;
local l_v6_1 = v6 --[[ copy: 6 -> 8 ]];
v6.new = function(v40) --[[ Line: 455 ]] --[[ Name: new ]]
    -- upvalues: l_v6_1 (copy)
    return (setmetatable({
        page_entries = if not (v40 ~= nil) or v40.page_entries == nil then {} else v40.page_entries, 
        hydration_data = if not (v40 ~= nil) or v40.hydration_data == nil then nil else v40.hydration_data, 
        templates = if not (v40 ~= nil) or v40.templates == nil then {} else v40.templates
    }, l_v6_1));
end;
v6.encode = function(v41) --[[ Line: 463 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v42 = buffer.create(0);
    local v43 = 0;
    if v41.page_entries ~= nil and #v41.page_entries > 0 then
        for _, v45 in v41.page_entries do
            local v46 = v45:encode();
            local v47, v48 = v0.writeTag(v42, v43, 1, v0.wireTypes.lengthDelimited);
            v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
            v42 = v47;
            v43 = v48;
        end;
    end;
    if v41.hydration_data ~= nil then
        local v49 = v41.hydration_data:encode();
        local v50, v51 = v0.writeTag(v42, v43, 2, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeBuffer(v50, v51, v49, buffer.len(v49));
        v42 = v50;
        v43 = v51;
    end;
    if v41.templates ~= nil and next(v41.templates) ~= nil then
        for v52, v53 in v41.templates do
            local v54 = buffer.create(0);
            local v55, v56 = v0.writeTag(v54, 0, 1, v0.wireTypes.lengthDelimited);
            v55, v56 = v0.writeString(v55, v56, v52);
            v54 = v55;
            local l_v56_0 = v56;
            v55 = v53:encode();
            local v58;
            v56, v58 = v0.writeTag(v54, l_v56_0, 2, v0.wireTypes.lengthDelimited);
            v56, v58 = v0.writeBuffer(v56, v58, v55, buffer.len(v55));
            v54 = v56;
            l_v56_0 = v58;
            v56, v58 = v0.writeTag(v42, v43, 3, v0.wireTypes.lengthDelimited);
            v56, v58 = v0.writeBuffer(v56, v58, v54, l_v56_0);
            v42 = v56;
            v43 = v58;
        end;
    end;
    local v59 = buffer.create(v43);
    buffer.copy(v59, 0, v42, 0, v43);
    return v59;
end;
v6.decode = function(v60) --[[ Line: 500 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_1 (copy), v0 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v61 = l_v6_1.new();
    local v62 = 0;
    while v62 < buffer.len(v60) do
        local v63 = nil;
        local v64 = nil;
        local v65, v66, v67 = v0.readTag(v60, v62);
        v63 = v65;
        v64 = v66;
        v62 = v67;
        if v64 == v0.wireTypes.varint then
            v65 = nil;
            v66, v67 = v0.readVarInt(v60, v62);
            v65 = v66;
            v62 = v67;
        elseif v64 == v0.wireTypes.lengthDelimited then
            if v63 == 1 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                table.insert(v61.page_entries, v5.UniversalPageEntry.decode(v65));
            elseif v63 == 2 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.hydration_data = v3.HydrationContent.decode(v65);
            elseif v63 == 3 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v66 = v2.GetChartsPageResponse_TemplatesEntry.decode(v65);
                v67 = v4.TemplateEntry.new();
                v61.templates[v66.key or ""] = v66.value or v67;
            else
                v65 = nil;
                v66, v67 = v0.readVarInt(v60, v62);
                v62 = v67 + v66;
            end;
        elseif v64 == v0.wireTypes.i32 then
            v65 = nil;
            v66, v67 = v0.readFixed32(v60, v62);
            v65 = v66;
            v62 = v67;
        elseif v64 == v0.wireTypes.i64 then
            v65 = nil;
            v66, v67 = v0.readFixed64(v60, v62);
            v65 = v66;
            v62 = v67;
        else
            error("Unsupported wire type: " .. v64);
        end;
    end;
    return v61;
end;
v6.jsonEncode = function(v68) --[[ Line: 564 ]] --[[ Name: jsonEncode ]]
    local v69 = {};
    if v68.page_entries ~= nil and #v68.page_entries > 0 then
        local v70 = {};
        for _, v72 in v68.page_entries do
            table.insert(v70, v72:jsonEncode());
        end;
        v69.pageEntries = v70;
    end;
    if v68.hydration_data ~= nil then
        v69.hydrationData = v68.hydration_data:jsonEncode();
    end;
    if v68.templates ~= nil and next(v68.templates) ~= nil then
        local v73 = {};
        for v74, v75 in v68.templates do
            v73[v74] = v75:jsonEncode();
        end;
        v69.templates = v73;
    end;
    return v69;
end;
v6.jsonDecode = function(v76) --[[ Line: 590 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_1 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v77 = l_v6_1.new();
    if v76.page_entries ~= nil then
        local v78 = {};
        for _, v80 in v76.page_entries do
            table.insert(v78, v5.UniversalPageEntry.jsonDecode(v80));
        end;
        v77.page_entries = v78;
    end;
    if v76.pageEntries ~= nil then
        local v81 = {};
        for _, v83 in v76.pageEntries do
            table.insert(v81, v5.UniversalPageEntry.jsonDecode(v83));
        end;
        v77.page_entries = v81;
    end;
    if v76.hydration_data ~= nil then
        v77.hydration_data = v3.HydrationContent.jsonDecode(v76.hydration_data);
    end;
    if v76.hydrationData ~= nil then
        v77.hydration_data = v3.HydrationContent.jsonDecode(v76.hydrationData);
    end;
    if v76.templates ~= nil then
        local v84 = {};
        for v85, v86 in v76.templates do
            v84[v85] = v4.TemplateEntry.jsonDecode(v86);
        end;
        v77.templates = v84;
    end;
    return v77;
end;
v6.descriptor = {
    name = "GetChartsPageResponse", 
    fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageResponse"
};
v2.GetChartsPageResponse = v6;
v1.default:register(v2.GetChartsPageResponse);
v6 = {};
v6.__index = v6;
local l_v6_2 = v6 --[[ copy: 6 -> 9 ]];
v6.new = function(v88) --[[ Line: 655 ]] --[[ Name: new ]]
    -- upvalues: l_v6_2 (copy)
    return (setmetatable({
        key = (not (v88 ~= nil) or v88.key == nil) and "" or v88.key, 
        value = if not (v88 ~= nil) or v88.value == nil then nil else v88.value
    }, l_v6_2));
end;
v6.encode = function(v89) --[[ Line: 664 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v90 = buffer.create(0);
    local v91 = 0;
    if v89.key ~= nil and v89.key ~= "" then
        local v92, v93 = v0.writeTag(v90, v91, 1, v0.wireTypes.lengthDelimited);
        v92, v93 = v0.writeString(v92, v93, v89.key);
        v90 = v92;
        v91 = v93;
    end;
    if v89.value ~= nil then
        local v94 = v89.value:encode();
        local v95, v96 = v0.writeTag(v90, v91, 2, v0.wireTypes.lengthDelimited);
        v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
        v90 = v95;
        v91 = v96;
    end;
    local v97 = buffer.create(v91);
    buffer.copy(v97, 0, v90, 0, v91);
    return v97;
end;
v6.decode = function(v98) --[[ Line: 684 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_2 (copy), v0 (copy), v4 (copy)
    local v99 = l_v6_2.new();
    local v100 = 0;
    while v100 < buffer.len(v98) do
        local v101 = nil;
        local v102 = nil;
        local v103, v104, v105 = v0.readTag(v98, v100);
        v101 = v103;
        v102 = v104;
        v100 = v105;
        if v102 == v0.wireTypes.varint then
            v103 = nil;
            v104, v105 = v0.readVarInt(v98, v100);
            v103 = v104;
            v100 = v105;
        elseif v102 == v0.wireTypes.lengthDelimited then
            if v101 == 1 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.key = buffer.tostring(v103);
            elseif v101 == 2 then
                v103 = nil;
                v104, v105 = v0.readBuffer(v98, v100);
                v103 = v104;
                v100 = v105;
                v99.value = v4.TemplateEntry.decode(v103);
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
v6.jsonEncode = function(v106) --[[ Line: 732 ]] --[[ Name: jsonEncode ]]
    local v107 = {};
    if v106.key ~= nil and v106.key ~= "" then
        v107.key = v106.key;
    end;
    if v106.value ~= nil then
        v107.value = v106.value:jsonEncode();
    end;
    return v107;
end;
v6.jsonDecode = function(v108) --[[ Line: 746 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_2 (copy), v4 (copy)
    local v109 = l_v6_2.new();
    if v108.key ~= nil then
        v109.key = v108.key;
    end;
    if v108.value ~= nil then
        v109.value = v4.TemplateEntry.jsonDecode(v108.value);
    end;
    return v109;
end;
v6.descriptor = {
    name = "GetChartsPageResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
};
v2.GetChartsPageResponse_TemplatesEntry = v6;
v1.default:register(v2.GetChartsPageResponse_TemplatesEntry);
v6 = {};
v6.__index = v6;
local l_v6_3 = v6 --[[ copy: 6 -> 10 ]];
v6.new = function(v111) --[[ Line: 776 ]] --[[ Name: new ]]
    -- upvalues: l_v6_3 (copy)
    return (setmetatable({
        sort_id = (not (v111 ~= nil) or v111.sort_id == nil) and "" or v111.sort_id, 
        content_page_token = (not (v111 ~= nil) or v111.content_page_token == nil) and "" or v111.content_page_token, 
        device = (not (v111 ~= nil) or v111.device == nil) and "" or v111.device, 
        country = (not (v111 ~= nil) or v111.country == nil) and "" or v111.country, 
        session_id = (not (v111 ~= nil) or v111.session_id == nil) and "" or v111.session_id
    }, l_v6_3));
end;
v6.encode = function(v112) --[[ Line: 788 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v113 = buffer.create(0);
    local v114 = 0;
    if v112.sort_id ~= nil and v112.sort_id ~= "" then
        local v115, v116 = v0.writeTag(v113, v114, 1, v0.wireTypes.lengthDelimited);
        v115, v116 = v0.writeString(v115, v116, v112.sort_id);
        v113 = v115;
        v114 = v116;
    end;
    if v112.content_page_token ~= nil and v112.content_page_token ~= "" then
        local v117, v118 = v0.writeTag(v113, v114, 2, v0.wireTypes.lengthDelimited);
        v117, v118 = v0.writeString(v117, v118, v112.content_page_token);
        v113 = v117;
        v114 = v118;
    end;
    if v112.device ~= nil and v112.device ~= "" then
        local v119, v120 = v0.writeTag(v113, v114, 3, v0.wireTypes.lengthDelimited);
        v119, v120 = v0.writeString(v119, v120, v112.device);
        v113 = v119;
        v114 = v120;
    end;
    if v112.country ~= nil and v112.country ~= "" then
        local v121, v122 = v0.writeTag(v113, v114, 4, v0.wireTypes.lengthDelimited);
        v121, v122 = v0.writeString(v121, v122, v112.country);
        v113 = v121;
        v114 = v122;
    end;
    if v112.session_id ~= nil and v112.session_id ~= "" then
        local v123, v124 = v0.writeTag(v113, v114, 5, v0.wireTypes.lengthDelimited);
        v123, v124 = v0.writeString(v123, v124, v112.session_id);
        v113 = v123;
        v114 = v124;
    end;
    local v125 = buffer.create(v114);
    buffer.copy(v125, 0, v113, 0, v114);
    return v125;
end;
v6.decode = function(v126) --[[ Line: 822 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_3 (copy), v0 (copy)
    local v127 = l_v6_3.new();
    local v128 = 0;
    while v128 < buffer.len(v126) do
        local v129 = nil;
        local v130 = nil;
        local v131, v132, v133 = v0.readTag(v126, v128);
        v129 = v131;
        v130 = v132;
        v128 = v133;
        if v130 == v0.wireTypes.varint then
            v131 = nil;
            v132, v133 = v0.readVarInt(v126, v128);
            v131 = v132;
            v128 = v133;
        elseif v130 == v0.wireTypes.lengthDelimited then
            if v129 == 1 then
                v131 = nil;
                v132, v133 = v0.readBuffer(v126, v128);
                v131 = v132;
                v128 = v133;
                v127.sort_id = buffer.tostring(v131);
            elseif v129 == 2 then
                v131 = nil;
                v132, v133 = v0.readBuffer(v126, v128);
                v131 = v132;
                v128 = v133;
                v127.content_page_token = buffer.tostring(v131);
            elseif v129 == 3 then
                v131 = nil;
                v132, v133 = v0.readBuffer(v126, v128);
                v131 = v132;
                v128 = v133;
                v127.device = buffer.tostring(v131);
            elseif v129 == 4 then
                v131 = nil;
                v132, v133 = v0.readBuffer(v126, v128);
                v131 = v132;
                v128 = v133;
                v127.country = buffer.tostring(v131);
            elseif v129 == 5 then
                v131 = nil;
                v132, v133 = v0.readBuffer(v126, v128);
                v131 = v132;
                v128 = v133;
                v127.session_id = buffer.tostring(v131);
            else
                v131 = nil;
                v132, v133 = v0.readVarInt(v126, v128);
                v128 = v133 + v132;
            end;
        elseif v130 == v0.wireTypes.i32 then
            v131 = nil;
            v132, v133 = v0.readFixed32(v126, v128);
            v131 = v132;
            v128 = v133;
        elseif v130 == v0.wireTypes.i64 then
            v131 = nil;
            v132, v133 = v0.readFixed64(v126, v128);
            v131 = v132;
            v128 = v133;
        else
            error("Unsupported wire type: " .. v130);
        end;
    end;
    return v127;
end;
v6.jsonEncode = function(v134) --[[ Line: 885 ]] --[[ Name: jsonEncode ]]
    local v135 = {};
    if v134.sort_id ~= nil and v134.sort_id ~= "" then
        v135.sortId = v134.sort_id;
    end;
    if v134.content_page_token ~= nil and v134.content_page_token ~= "" then
        v135.contentPageToken = v134.content_page_token;
    end;
    if v134.device ~= nil and v134.device ~= "" then
        v135.device = v134.device;
    end;
    if v134.country ~= nil and v134.country ~= "" then
        v135.country = v134.country;
    end;
    if v134.session_id ~= nil and v134.session_id ~= "" then
        v135.sessionId = v134.session_id;
    end;
    return v135;
end;
v6.jsonDecode = function(v136) --[[ Line: 911 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_3 (copy)
    local v137 = l_v6_3.new();
    if v136.sort_id ~= nil then
        v137.sort_id = v136.sort_id;
    end;
    if v136.sortId ~= nil then
        v137.sort_id = v136.sortId;
    end;
    if v136.content_page_token ~= nil then
        v137.content_page_token = v136.content_page_token;
    end;
    if v136.contentPageToken ~= nil then
        v137.content_page_token = v136.contentPageToken;
    end;
    if v136.device ~= nil then
        v137.device = v136.device;
    end;
    if v136.country ~= nil then
        v137.country = v136.country;
    end;
    if v136.session_id ~= nil then
        v137.session_id = v136.session_id;
    end;
    if v136.sessionId ~= nil then
        v137.session_id = v136.sessionId;
    end;
    return v137;
end;
v6.descriptor = {
    name = "GetChartsSortDetailRequest", 
    fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailRequest"
};
v2.GetChartsSortDetailRequest = v6;
v1.default:register(v2.GetChartsSortDetailRequest);
v6 = {};
v6.__index = v6;
local l_v6_4 = v6 --[[ copy: 6 -> 11 ]];
v6.new = function(v139) --[[ Line: 963 ]] --[[ Name: new ]]
    -- upvalues: l_v6_4 (copy)
    return (setmetatable({
        page_entries = if not (v139 ~= nil) or v139.page_entries == nil then {} else v139.page_entries, 
        hydration_data = if not (v139 ~= nil) or v139.hydration_data == nil then nil else v139.hydration_data, 
        templates = if not (v139 ~= nil) or v139.templates == nil then {} else v139.templates, 
        next_content_page_token = (not (v139 ~= nil) or v139.next_content_page_token == nil) and "" or v139.next_content_page_token
    }, l_v6_4));
end;
v6.encode = function(v140) --[[ Line: 976 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v141 = buffer.create(0);
    local v142 = 0;
    if v140.page_entries ~= nil and #v140.page_entries > 0 then
        for _, v144 in v140.page_entries do
            local v145 = v144:encode();
            local v146, v147 = v0.writeTag(v141, v142, 1, v0.wireTypes.lengthDelimited);
            v146, v147 = v0.writeBuffer(v146, v147, v145, buffer.len(v145));
            v141 = v146;
            v142 = v147;
        end;
    end;
    if v140.hydration_data ~= nil then
        local v148 = v140.hydration_data:encode();
        local v149, v150 = v0.writeTag(v141, v142, 2, v0.wireTypes.lengthDelimited);
        v149, v150 = v0.writeBuffer(v149, v150, v148, buffer.len(v148));
        v141 = v149;
        v142 = v150;
    end;
    if v140.templates ~= nil and next(v140.templates) ~= nil then
        for v151, v152 in v140.templates do
            local v153 = buffer.create(0);
            local v154, v155 = v0.writeTag(v153, 0, 1, v0.wireTypes.lengthDelimited);
            v154, v155 = v0.writeString(v154, v155, v151);
            v153 = v154;
            local l_v155_0 = v155;
            v154 = v152:encode();
            local v157;
            v155, v157 = v0.writeTag(v153, l_v155_0, 2, v0.wireTypes.lengthDelimited);
            v155, v157 = v0.writeBuffer(v155, v157, v154, buffer.len(v154));
            v153 = v155;
            l_v155_0 = v157;
            v155, v157 = v0.writeTag(v141, v142, 3, v0.wireTypes.lengthDelimited);
            v155, v157 = v0.writeBuffer(v155, v157, v153, l_v155_0);
            v141 = v155;
            v142 = v157;
        end;
    end;
    if v140.next_content_page_token ~= nil and v140.next_content_page_token ~= "" then
        local v158, v159 = v0.writeTag(v141, v142, 4, v0.wireTypes.lengthDelimited);
        v158, v159 = v0.writeString(v158, v159, v140.next_content_page_token);
        v141 = v158;
        v142 = v159;
    end;
    local v160 = buffer.create(v142);
    buffer.copy(v160, 0, v141, 0, v142);
    return v160;
end;
v6.decode = function(v161) --[[ Line: 1018 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_4 (copy), v0 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v162 = l_v6_4.new();
    local v163 = 0;
    while v163 < buffer.len(v161) do
        local v164 = nil;
        local v165 = nil;
        local v166, v167, v168 = v0.readTag(v161, v163);
        v164 = v166;
        v165 = v167;
        v163 = v168;
        if v165 == v0.wireTypes.varint then
            v166 = nil;
            v167, v168 = v0.readVarInt(v161, v163);
            v166 = v167;
            v163 = v168;
        elseif v165 == v0.wireTypes.lengthDelimited then
            if v164 == 1 then
                v166 = nil;
                v167, v168 = v0.readBuffer(v161, v163);
                v166 = v167;
                v163 = v168;
                table.insert(v162.page_entries, v5.UniversalPageEntry.decode(v166));
            elseif v164 == 2 then
                v166 = nil;
                v167, v168 = v0.readBuffer(v161, v163);
                v166 = v167;
                v163 = v168;
                v162.hydration_data = v3.HydrationContent.decode(v166);
            elseif v164 == 3 then
                v166 = nil;
                v167, v168 = v0.readBuffer(v161, v163);
                v166 = v167;
                v163 = v168;
                v167 = v2.GetChartsSortDetailResponse_TemplatesEntry.decode(v166);
                v168 = v4.TemplateEntry.new();
                v162.templates[v167.key or ""] = v167.value or v168;
            elseif v164 == 4 then
                v166 = nil;
                v167, v168 = v0.readBuffer(v161, v163);
                v166 = v167;
                v163 = v168;
                v162.next_content_page_token = buffer.tostring(v166);
            else
                v166 = nil;
                v167, v168 = v0.readVarInt(v161, v163);
                v163 = v168 + v167;
            end;
        elseif v165 == v0.wireTypes.i32 then
            v166 = nil;
            v167, v168 = v0.readFixed32(v161, v163);
            v166 = v167;
            v163 = v168;
        elseif v165 == v0.wireTypes.i64 then
            v166 = nil;
            v167, v168 = v0.readFixed64(v161, v163);
            v166 = v167;
            v163 = v168;
        else
            error("Unsupported wire type: " .. v165);
        end;
    end;
    return v162;
end;
v6.jsonEncode = function(v169) --[[ Line: 1087 ]] --[[ Name: jsonEncode ]]
    local v170 = {};
    if v169.page_entries ~= nil and #v169.page_entries > 0 then
        local v171 = {};
        for _, v173 in v169.page_entries do
            table.insert(v171, v173:jsonEncode());
        end;
        v170.pageEntries = v171;
    end;
    if v169.hydration_data ~= nil then
        v170.hydrationData = v169.hydration_data:jsonEncode();
    end;
    if v169.templates ~= nil and next(v169.templates) ~= nil then
        local v174 = {};
        for v175, v176 in v169.templates do
            v174[v175] = v176:jsonEncode();
        end;
        v170.templates = v174;
    end;
    if v169.next_content_page_token ~= nil and v169.next_content_page_token ~= "" then
        v170.nextContentPageToken = v169.next_content_page_token;
    end;
    return v170;
end;
v6.jsonDecode = function(v177) --[[ Line: 1117 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_4 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v178 = l_v6_4.new();
    if v177.page_entries ~= nil then
        local v179 = {};
        for _, v181 in v177.page_entries do
            table.insert(v179, v5.UniversalPageEntry.jsonDecode(v181));
        end;
        v178.page_entries = v179;
    end;
    if v177.pageEntries ~= nil then
        local v182 = {};
        for _, v184 in v177.pageEntries do
            table.insert(v182, v5.UniversalPageEntry.jsonDecode(v184));
        end;
        v178.page_entries = v182;
    end;
    if v177.hydration_data ~= nil then
        v178.hydration_data = v3.HydrationContent.jsonDecode(v177.hydration_data);
    end;
    if v177.hydrationData ~= nil then
        v178.hydration_data = v3.HydrationContent.jsonDecode(v177.hydrationData);
    end;
    if v177.templates ~= nil then
        local v185 = {};
        for v186, v187 in v177.templates do
            v185[v186] = v4.TemplateEntry.jsonDecode(v187);
        end;
        v178.templates = v185;
    end;
    if v177.next_content_page_token ~= nil then
        v178.next_content_page_token = v177.next_content_page_token;
    end;
    if v177.nextContentPageToken ~= nil then
        v178.next_content_page_token = v177.nextContentPageToken;
    end;
    return v178;
end;
v6.descriptor = {
    name = "GetChartsSortDetailResponse", 
    fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailResponse"
};
v2.GetChartsSortDetailResponse = v6;
v1.default:register(v2.GetChartsSortDetailResponse);
v6 = {};
v6.__index = v6;
v6.new = function(v188) --[[ Line: 1190 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v188 ~= nil) or v188.key == nil) and "" or v188.key, 
        value = if not (v188 ~= nil) or v188.value == nil then nil else v188.value
    }, v6));
end;
v6.encode = function(v189) --[[ Line: 1199 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v190 = buffer.create(0);
    local v191 = 0;
    if v189.key ~= nil and v189.key ~= "" then
        local v192, v193 = v0.writeTag(v190, v191, 1, v0.wireTypes.lengthDelimited);
        v192, v193 = v0.writeString(v192, v193, v189.key);
        v190 = v192;
        v191 = v193;
    end;
    if v189.value ~= nil then
        local v194 = v189.value:encode();
        local v195, v196 = v0.writeTag(v190, v191, 2, v0.wireTypes.lengthDelimited);
        v195, v196 = v0.writeBuffer(v195, v196, v194, buffer.len(v194));
        v190 = v195;
        v191 = v196;
    end;
    local v197 = buffer.create(v191);
    buffer.copy(v197, 0, v190, 0, v191);
    return v197;
end;
v6.decode = function(v198) --[[ Line: 1221 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v4 (copy)
    local v199 = v6.new();
    local v200 = 0;
    while v200 < buffer.len(v198) do
        local v201 = nil;
        local v202 = nil;
        local v203, v204, v205 = v0.readTag(v198, v200);
        v201 = v203;
        v202 = v204;
        v200 = v205;
        if v202 == v0.wireTypes.varint then
            v203 = nil;
            v204, v205 = v0.readVarInt(v198, v200);
            v203 = v204;
            v200 = v205;
        elseif v202 == v0.wireTypes.lengthDelimited then
            if v201 == 1 then
                v203 = nil;
                v204, v205 = v0.readBuffer(v198, v200);
                v203 = v204;
                v200 = v205;
                v199.key = buffer.tostring(v203);
            elseif v201 == 2 then
                v203 = nil;
                v204, v205 = v0.readBuffer(v198, v200);
                v203 = v204;
                v200 = v205;
                v199.value = v4.TemplateEntry.decode(v203);
            else
                v203 = nil;
                v204, v205 = v0.readVarInt(v198, v200);
                v200 = v205 + v204;
            end;
        elseif v202 == v0.wireTypes.i32 then
            v203 = nil;
            v204, v205 = v0.readFixed32(v198, v200);
            v203 = v204;
            v200 = v205;
        elseif v202 == v0.wireTypes.i64 then
            v203 = nil;
            v204, v205 = v0.readFixed64(v198, v200);
            v203 = v204;
            v200 = v205;
        else
            error("Unsupported wire type: " .. v202);
        end;
    end;
    return v199;
end;
v6.jsonEncode = function(v206) --[[ Line: 1271 ]] --[[ Name: jsonEncode ]]
    local v207 = {};
    if v206.key ~= nil and v206.key ~= "" then
        v207.key = v206.key;
    end;
    if v206.value ~= nil then
        v207.value = v206.value:jsonEncode();
    end;
    return v207;
end;
v6.jsonDecode = function(v208) --[[ Line: 1287 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v209 = v6.new();
    if v208.key ~= nil then
        v209.key = v208.key;
    end;
    if v208.value ~= nil then
        v209.value = v4.TemplateEntry.jsonDecode(v208.value);
    end;
    return v209;
end;
v6.descriptor = {
    name = "GetChartsSortDetailResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
};
v2.GetChartsSortDetailResponse_TemplatesEntry = v6;
v1.default:register(v2.GetChartsSortDetailResponse_TemplatesEntry);
return {
    GetChartsPageRequest = v2.GetChartsPageRequest, 
    GetChartsPageResponse = v2.GetChartsPageResponse, 
    GetChartsSortDetailRequest = v2.GetChartsSortDetailRequest, 
    GetChartsSortDetailResponse = v2.GetChartsSortDetailResponse
};