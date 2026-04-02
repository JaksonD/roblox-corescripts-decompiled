local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 206 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        parameters = if not (v8 ~= nil) or v8.parameters == nil then {} else v8.parameters, 
        translations = if not (v8 ~= nil) or v8.translations == nil then {} else v8.translations
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 213 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.parameters ~= nil and next(v9.parameters) ~= nil then
        for v12, v13 in v9.parameters do
            local v14 = buffer.create(0);
            local v15, v16 = v0.writeTag(v14, 0, 1, v0.wireTypes.lengthDelimited);
            v15, v16 = v0.writeString(v15, v16, v12);
            v15, v16 = v0.writeTag(v15, v16, 2, v0.wireTypes.lengthDelimited);
            v15, v16 = v0.writeString(v15, v16, v13);
            v14 = v15;
            local l_v16_0 = v16;
            v15, v16 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
            v15, v16 = v0.writeBuffer(v15, v16, v14, l_v16_0);
            v10 = v15;
            v11 = v16;
        end;
    end;
    if v9.translations ~= nil and next(v9.translations) ~= nil then
        for v18, v19 in v9.translations do
            local v20 = buffer.create(0);
            local v21, v22 = v0.writeTag(v20, 0, 1, v0.wireTypes.lengthDelimited);
            v21, v22 = v0.writeString(v21, v22, v18);
            v21, v22 = v0.writeTag(v21, v22, 2, v0.wireTypes.lengthDelimited);
            v21, v22 = v0.writeString(v21, v22, v19);
            v20 = v21;
            local l_v22_0 = v22;
            v21, v22 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
            v21, v22 = v0.writeBuffer(v21, v22, v20, l_v22_0);
            v10 = v21;
            v11 = v22;
        end;
    end;
    local v24 = buffer.create(v11);
    buffer.copy(v24, 0, v10, 0, v11);
    return v24;
end;
v6.decode = function(v25) --[[ Line: 248 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy), v2 (copy)
    local v26 = l_v6_0.new();
    local v27 = 0;
    while v27 < buffer.len(v25) do
        local v28 = nil;
        local v29 = nil;
        local v30, v31, v32 = v0.readTag(v25, v27);
        v28 = v30;
        v29 = v31;
        v27 = v32;
        if v29 == v0.wireTypes.varint then
            v30 = nil;
            v31, v32 = v0.readVarInt(v25, v27);
            v30 = v31;
            v27 = v32;
        elseif v29 == v0.wireTypes.lengthDelimited then
            if v28 == 1 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v31 = v2.CustomPrompt_ParametersEntry.decode(v30);
                v26.parameters[v31.key or ""] = v31.value or "";
            elseif v28 == 2 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v31 = v2.CustomPrompt_TranslationsEntry.decode(v30);
                v26.translations[v31.key or ""] = v31.value or "";
            else
                v30 = nil;
                v31, v32 = v0.readVarInt(v25, v27);
                v27 = v32 + v31;
            end;
        elseif v29 == v0.wireTypes.i32 then
            v30 = nil;
            v31, v32 = v0.readFixed32(v25, v27);
            v30 = v31;
            v27 = v32;
        elseif v29 == v0.wireTypes.i64 then
            v30 = nil;
            v31, v32 = v0.readFixed64(v25, v27);
            v30 = v31;
            v27 = v32;
        else
            error("Unsupported wire type: " .. v29);
        end;
    end;
    return v26;
end;
v6.jsonEncode = function(v33) --[[ Line: 310 ]] --[[ Name: jsonEncode ]]
    local v34 = {};
    if v33.parameters ~= nil and next(v33.parameters) ~= nil then
        local v35 = {};
        for v36, v37 in v33.parameters do
            v35[v36] = v37;
        end;
        v34.parameters = v35;
    end;
    if v33.translations ~= nil and next(v33.translations) ~= nil then
        local v38 = {};
        for v39, v40 in v33.translations do
            v38[v39] = v40;
        end;
        v34.translations = v38;
    end;
    return v34;
end;
v6.jsonDecode = function(v41) --[[ Line: 332 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy)
    local v42 = l_v6_0.new();
    if v41.parameters ~= nil then
        local v43 = {};
        for v44, v45 in v41.parameters do
            v43[v44] = v45;
        end;
        v42.parameters = v43;
    end;
    if v41.translations ~= nil then
        local v46 = {};
        for v47, v48 in v41.translations do
            v46[v47] = v48;
        end;
        v42.translations = v46;
    end;
    return v42;
end;
v6.descriptor = {
    name = "CustomPrompt", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPrompt"
};
v2.CustomPrompt = v6;
v1.default:register(v2.CustomPrompt);
v6 = {};
v6.__index = v6;
local l_v6_1 = v6 --[[ copy: 6 -> 8 ]];
v6.new = function(v50) --[[ Line: 370 ]] --[[ Name: new ]]
    -- upvalues: l_v6_1 (copy)
    return (setmetatable({
        key = (not (v50 ~= nil) or v50.key == nil) and "" or v50.key, 
        value = (not (v50 ~= nil) or v50.value == nil) and "" or v50.value
    }, l_v6_1));
end;
v6.encode = function(v51) --[[ Line: 379 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v52 = buffer.create(0);
    local v53 = 0;
    if v51.key ~= nil and v51.key ~= "" then
        local v54, v55 = v0.writeTag(v52, v53, 1, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeString(v54, v55, v51.key);
        v52 = v54;
        v53 = v55;
    end;
    if v51.value ~= nil and v51.value ~= "" then
        local v56, v57 = v0.writeTag(v52, v53, 2, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeString(v56, v57, v51.value);
        v52 = v56;
        v53 = v57;
    end;
    local v58 = buffer.create(v53);
    buffer.copy(v58, 0, v52, 0, v53);
    return v58;
end;
v6.decode = function(v59) --[[ Line: 398 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_1 (copy), v0 (copy)
    local v60 = l_v6_1.new();
    local v61 = 0;
    while v61 < buffer.len(v59) do
        local v62 = nil;
        local v63 = nil;
        local v64, v65, v66 = v0.readTag(v59, v61);
        v62 = v64;
        v63 = v65;
        v61 = v66;
        if v63 == v0.wireTypes.varint then
            v64 = nil;
            v65, v66 = v0.readVarInt(v59, v61);
            v64 = v65;
            v61 = v66;
        elseif v63 == v0.wireTypes.lengthDelimited then
            if v62 == 1 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.key = buffer.tostring(v64);
            elseif v62 == 2 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.value = buffer.tostring(v64);
            else
                v64 = nil;
                v65, v66 = v0.readVarInt(v59, v61);
                v61 = v66 + v65;
            end;
        elseif v63 == v0.wireTypes.i32 then
            v64 = nil;
            v65, v66 = v0.readFixed32(v59, v61);
            v64 = v65;
            v61 = v66;
        elseif v63 == v0.wireTypes.i64 then
            v64 = nil;
            v65, v66 = v0.readFixed64(v59, v61);
            v64 = v65;
            v61 = v66;
        else
            error("Unsupported wire type: " .. v63);
        end;
    end;
    return v60;
end;
v6.jsonEncode = function(v67) --[[ Line: 446 ]] --[[ Name: jsonEncode ]]
    local v68 = {};
    if v67.key ~= nil and v67.key ~= "" then
        v68.key = v67.key;
    end;
    if v67.value ~= nil and v67.value ~= "" then
        v68.value = v67.value;
    end;
    return v68;
end;
v6.jsonDecode = function(v69) --[[ Line: 460 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_1 (copy)
    local v70 = l_v6_1.new();
    if v69.key ~= nil then
        v70.key = v69.key;
    end;
    if v69.value ~= nil then
        v70.value = v69.value;
    end;
    return v70;
end;
v6.descriptor = {
    name = "CustomPrompt_ParametersEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.ParametersEntry"
};
v2.CustomPrompt_ParametersEntry = v6;
v1.default:register(v2.CustomPrompt_ParametersEntry);
v6 = {};
v6.__index = v6;
local l_v6_2 = v6 --[[ copy: 6 -> 9 ]];
v6.new = function(v72) --[[ Line: 488 ]] --[[ Name: new ]]
    -- upvalues: l_v6_2 (copy)
    return (setmetatable({
        key = (not (v72 ~= nil) or v72.key == nil) and "" or v72.key, 
        value = (not (v72 ~= nil) or v72.value == nil) and "" or v72.value
    }, l_v6_2));
end;
v6.encode = function(v73) --[[ Line: 497 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v74 = buffer.create(0);
    local v75 = 0;
    if v73.key ~= nil and v73.key ~= "" then
        local v76, v77 = v0.writeTag(v74, v75, 1, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeString(v76, v77, v73.key);
        v74 = v76;
        v75 = v77;
    end;
    if v73.value ~= nil and v73.value ~= "" then
        local v78, v79 = v0.writeTag(v74, v75, 2, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeString(v78, v79, v73.value);
        v74 = v78;
        v75 = v79;
    end;
    local v80 = buffer.create(v75);
    buffer.copy(v80, 0, v74, 0, v75);
    return v80;
end;
v6.decode = function(v81) --[[ Line: 516 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_2 (copy), v0 (copy)
    local v82 = l_v6_2.new();
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
                v82.key = buffer.tostring(v86);
            elseif v84 == 2 then
                v86 = nil;
                v87, v88 = v0.readBuffer(v81, v83);
                v86 = v87;
                v83 = v88;
                v82.value = buffer.tostring(v86);
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
v6.jsonEncode = function(v89) --[[ Line: 564 ]] --[[ Name: jsonEncode ]]
    local v90 = {};
    if v89.key ~= nil and v89.key ~= "" then
        v90.key = v89.key;
    end;
    if v89.value ~= nil and v89.value ~= "" then
        v90.value = v89.value;
    end;
    return v90;
end;
v6.jsonDecode = function(v91) --[[ Line: 578 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_2 (copy)
    local v92 = l_v6_2.new();
    if v91.key ~= nil then
        v92.key = v91.key;
    end;
    if v91.value ~= nil then
        v92.value = v91.value;
    end;
    return v92;
end;
v6.descriptor = {
    name = "CustomPrompt_TranslationsEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.TranslationsEntry"
};
v2.CustomPrompt_TranslationsEntry = v6;
v1.default:register(v2.CustomPrompt_TranslationsEntry);
v6 = {};
v6.__index = v6;
local l_v6_3 = v6 --[[ copy: 6 -> 10 ]];
v6.new = function(v94) --[[ Line: 606 ]] --[[ Name: new ]]
    -- upvalues: l_v6_3 (copy)
    return (setmetatable({
        page_entries = if not (v94 ~= nil) or v94.page_entries == nil then {} else v94.page_entries, 
        hydration_data = if not (v94 ~= nil) or v94.hydration_data == nil then nil else v94.hydration_data, 
        templates = if not (v94 ~= nil) or v94.templates == nil then {} else v94.templates, 
        custom_prompts = if not (v94 ~= nil) or v94.custom_prompts == nil then {} else v94.custom_prompts
    }, l_v6_3));
end;
v6.encode = function(v95) --[[ Line: 617 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v96 = buffer.create(0);
    local v97 = 0;
    if v95.page_entries ~= nil and #v95.page_entries > 0 then
        for _, v99 in v95.page_entries do
            local v100 = v99:encode();
            local v101, v102 = v0.writeTag(v96, v97, 1, v0.wireTypes.lengthDelimited);
            v101, v102 = v0.writeBuffer(v101, v102, v100, buffer.len(v100));
            v96 = v101;
            v97 = v102;
        end;
    end;
    if v95.hydration_data ~= nil then
        local v103 = v95.hydration_data:encode();
        local v104, v105 = v0.writeTag(v96, v97, 2, v0.wireTypes.lengthDelimited);
        v104, v105 = v0.writeBuffer(v104, v105, v103, buffer.len(v103));
        v96 = v104;
        v97 = v105;
    end;
    if v95.templates ~= nil and next(v95.templates) ~= nil then
        for v106, v107 in v95.templates do
            local v108 = buffer.create(0);
            local v109, v110 = v0.writeTag(v108, 0, 1, v0.wireTypes.lengthDelimited);
            v109, v110 = v0.writeString(v109, v110, v106);
            v108 = v109;
            local l_v110_0 = v110;
            v109 = v107:encode();
            local v112;
            v110, v112 = v0.writeTag(v108, l_v110_0, 2, v0.wireTypes.lengthDelimited);
            v110, v112 = v0.writeBuffer(v110, v112, v109, buffer.len(v109));
            v108 = v110;
            l_v110_0 = v112;
            v110, v112 = v0.writeTag(v96, v97, 3, v0.wireTypes.lengthDelimited);
            v110, v112 = v0.writeBuffer(v110, v112, v108, l_v110_0);
            v96 = v110;
            v97 = v112;
        end;
    end;
    if v95.custom_prompts ~= nil and next(v95.custom_prompts) ~= nil then
        for v113, v114 in v95.custom_prompts do
            local v115 = buffer.create(0);
            local v116, v117 = v0.writeTag(v115, 0, 1, v0.wireTypes.lengthDelimited);
            v116, v117 = v0.writeString(v116, v117, v113);
            v115 = v116;
            local l_v117_0 = v117;
            v116 = v114:encode();
            local v119;
            v117, v119 = v0.writeTag(v115, l_v117_0, 2, v0.wireTypes.lengthDelimited);
            v117, v119 = v0.writeBuffer(v117, v119, v116, buffer.len(v116));
            v115 = v117;
            l_v117_0 = v119;
            v117, v119 = v0.writeTag(v96, v97, 4, v0.wireTypes.lengthDelimited);
            v117, v119 = v0.writeBuffer(v117, v119, v115, l_v117_0);
            v96 = v117;
            v97 = v119;
        end;
    end;
    local v120 = buffer.create(v97);
    buffer.copy(v120, 0, v96, 0, v97);
    return v120;
end;
v6.decode = function(v121) --[[ Line: 668 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_3 (copy), v0 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v122 = l_v6_3.new();
    local v123 = 0;
    while v123 < buffer.len(v121) do
        local v124 = nil;
        local v125 = nil;
        local v126, v127, v128 = v0.readTag(v121, v123);
        v124 = v126;
        v125 = v127;
        v123 = v128;
        if v125 == v0.wireTypes.varint then
            v126 = nil;
            v127, v128 = v0.readVarInt(v121, v123);
            v126 = v127;
            v123 = v128;
        elseif v125 == v0.wireTypes.lengthDelimited then
            if v124 == 1 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                table.insert(v122.page_entries, v4.UniversalPageEntry.decode(v126));
            elseif v124 == 2 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.hydration_data = v3.HydrationContent.decode(v126);
            elseif v124 == 3 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v127 = v2.GetEligiblePromptsResponse_TemplatesEntry.decode(v126);
                v128 = v5.TemplateEntry.new();
                v122.templates[v127.key or ""] = v127.value or v128;
            elseif v124 == 4 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v127 = v2.GetEligiblePromptsResponse_CustomPromptsEntry.decode(v126);
                v128 = v2.CustomPrompt.new();
                v122.custom_prompts[v127.key or ""] = v127.value or v128;
            else
                v126 = nil;
                v127, v128 = v0.readVarInt(v121, v123);
                v123 = v128 + v127;
            end;
        elseif v125 == v0.wireTypes.i32 then
            v126 = nil;
            v127, v128 = v0.readFixed32(v121, v123);
            v126 = v127;
            v123 = v128;
        elseif v125 == v0.wireTypes.i64 then
            v126 = nil;
            v127, v128 = v0.readFixed64(v121, v123);
            v126 = v127;
            v123 = v128;
        else
            error("Unsupported wire type: " .. v125);
        end;
    end;
    return v122;
end;
v6.jsonEncode = function(v129) --[[ Line: 744 ]] --[[ Name: jsonEncode ]]
    local v130 = {};
    if v129.page_entries ~= nil and #v129.page_entries > 0 then
        local v131 = {};
        for _, v133 in v129.page_entries do
            table.insert(v131, v133:jsonEncode());
        end;
        v130.pageEntries = v131;
    end;
    if v129.hydration_data ~= nil then
        v130.hydrationData = v129.hydration_data:jsonEncode();
    end;
    if v129.templates ~= nil and next(v129.templates) ~= nil then
        local v134 = {};
        for v135, v136 in v129.templates do
            v134[v135] = v136:jsonEncode();
        end;
        v130.templates = v134;
    end;
    if v129.custom_prompts ~= nil and next(v129.custom_prompts) ~= nil then
        local v137 = {};
        for v138, v139 in v129.custom_prompts do
            v137[v138] = v139:jsonEncode();
        end;
        v130.customPrompts = v137;
    end;
    return v130;
end;
v6.jsonDecode = function(v140) --[[ Line: 778 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_3 (copy), v4 (copy), v3 (copy), v5 (copy), v2 (copy)
    local v141 = l_v6_3.new();
    if v140.page_entries ~= nil then
        local v142 = {};
        for _, v144 in v140.page_entries do
            table.insert(v142, v4.UniversalPageEntry.jsonDecode(v144));
        end;
        v141.page_entries = v142;
    end;
    if v140.pageEntries ~= nil then
        local v145 = {};
        for _, v147 in v140.pageEntries do
            table.insert(v145, v4.UniversalPageEntry.jsonDecode(v147));
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
    if v140.custom_prompts ~= nil then
        local v151 = {};
        for v152, v153 in v140.custom_prompts do
            v151[v152] = v2.CustomPrompt.jsonDecode(v153);
        end;
        v141.custom_prompts = v151;
    end;
    if v140.customPrompts ~= nil then
        local v154 = {};
        for v155, v156 in v140.customPrompts do
            v154[v155] = v2.CustomPrompt.jsonDecode(v156);
        end;
        v141.custom_prompts = v154;
    end;
    return v141;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
};
v2.GetEligiblePromptsResponse = v6;
v1.default:register(v2.GetEligiblePromptsResponse);
v6 = {};
v6.__index = v6;
local l_v6_4 = v6 --[[ copy: 6 -> 11 ]];
v6.new = function(v158) --[[ Line: 861 ]] --[[ Name: new ]]
    -- upvalues: l_v6_4 (copy)
    return (setmetatable({
        key = (not (v158 ~= nil) or v158.key == nil) and "" or v158.key, 
        value = if not (v158 ~= nil) or v158.value == nil then nil else v158.value
    }, l_v6_4));
end;
v6.encode = function(v159) --[[ Line: 870 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v160 = buffer.create(0);
    local v161 = 0;
    if v159.key ~= nil and v159.key ~= "" then
        local v162, v163 = v0.writeTag(v160, v161, 1, v0.wireTypes.lengthDelimited);
        v162, v163 = v0.writeString(v162, v163, v159.key);
        v160 = v162;
        v161 = v163;
    end;
    if v159.value ~= nil then
        local v164 = v159.value:encode();
        local v165, v166 = v0.writeTag(v160, v161, 2, v0.wireTypes.lengthDelimited);
        v165, v166 = v0.writeBuffer(v165, v166, v164, buffer.len(v164));
        v160 = v165;
        v161 = v166;
    end;
    local v167 = buffer.create(v161);
    buffer.copy(v167, 0, v160, 0, v161);
    return v167;
end;
v6.decode = function(v168) --[[ Line: 892 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_4 (copy), v0 (copy), v5 (copy)
    local v169 = l_v6_4.new();
    local v170 = 0;
    while v170 < buffer.len(v168) do
        local v171 = nil;
        local v172 = nil;
        local v173, v174, v175 = v0.readTag(v168, v170);
        v171 = v173;
        v172 = v174;
        v170 = v175;
        if v172 == v0.wireTypes.varint then
            v173 = nil;
            v174, v175 = v0.readVarInt(v168, v170);
            v173 = v174;
            v170 = v175;
        elseif v172 == v0.wireTypes.lengthDelimited then
            if v171 == 1 then
                v173 = nil;
                v174, v175 = v0.readBuffer(v168, v170);
                v173 = v174;
                v170 = v175;
                v169.key = buffer.tostring(v173);
            elseif v171 == 2 then
                v173 = nil;
                v174, v175 = v0.readBuffer(v168, v170);
                v173 = v174;
                v170 = v175;
                v169.value = v5.TemplateEntry.decode(v173);
            else
                v173 = nil;
                v174, v175 = v0.readVarInt(v168, v170);
                v170 = v175 + v174;
            end;
        elseif v172 == v0.wireTypes.i32 then
            v173 = nil;
            v174, v175 = v0.readFixed32(v168, v170);
            v173 = v174;
            v170 = v175;
        elseif v172 == v0.wireTypes.i64 then
            v173 = nil;
            v174, v175 = v0.readFixed64(v168, v170);
            v173 = v174;
            v170 = v175;
        else
            error("Unsupported wire type: " .. v172);
        end;
    end;
    return v169;
end;
v6.jsonEncode = function(v176) --[[ Line: 942 ]] --[[ Name: jsonEncode ]]
    local v177 = {};
    if v176.key ~= nil and v176.key ~= "" then
        v177.key = v176.key;
    end;
    if v176.value ~= nil then
        v177.value = v176.value:jsonEncode();
    end;
    return v177;
end;
v6.jsonDecode = function(v178) --[[ Line: 958 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_4 (copy), v5 (copy)
    local v179 = l_v6_4.new();
    if v178.key ~= nil then
        v179.key = v178.key;
    end;
    if v178.value ~= nil then
        v179.value = v5.TemplateEntry.jsonDecode(v178.value);
    end;
    return v179;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
};
v2.GetEligiblePromptsResponse_TemplatesEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_TemplatesEntry);
v6 = {};
v6.__index = v6;
v6.new = function(v180) --[[ Line: 988 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v180 ~= nil) or v180.key == nil) and "" or v180.key, 
        value = if not (v180 ~= nil) or v180.value == nil then nil else v180.value
    }, v6));
end;
v6.encode = function(v181) --[[ Line: 997 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v182 = buffer.create(0);
    local v183 = 0;
    if v181.key ~= nil and v181.key ~= "" then
        local v184, v185 = v0.writeTag(v182, v183, 1, v0.wireTypes.lengthDelimited);
        v184, v185 = v0.writeString(v184, v185, v181.key);
        v182 = v184;
        v183 = v185;
    end;
    if v181.value ~= nil then
        local v186 = v181.value:encode();
        local v187, v188 = v0.writeTag(v182, v183, 2, v0.wireTypes.lengthDelimited);
        v187, v188 = v0.writeBuffer(v187, v188, v186, buffer.len(v186));
        v182 = v187;
        v183 = v188;
    end;
    local v189 = buffer.create(v183);
    buffer.copy(v189, 0, v182, 0, v183);
    return v189;
end;
v6.decode = function(v190) --[[ Line: 1019 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v2 (copy)
    local v191 = v6.new();
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
                v191.key = buffer.tostring(v195);
            elseif v193 == 2 then
                v195 = nil;
                v196, v197 = v0.readBuffer(v190, v192);
                v195 = v196;
                v192 = v197;
                v191.value = v2.CustomPrompt.decode(v195);
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
v6.jsonEncode = function(v198) --[[ Line: 1069 ]] --[[ Name: jsonEncode ]]
    local v199 = {};
    if v198.key ~= nil and v198.key ~= "" then
        v199.key = v198.key;
    end;
    if v198.value ~= nil then
        v199.value = v198.value:jsonEncode();
    end;
    return v199;
end;
v6.jsonDecode = function(v200) --[[ Line: 1085 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v2 (copy)
    local v201 = v6.new();
    if v200.key ~= nil then
        v201.key = v200.key;
    end;
    if v200.value ~= nil then
        v201.value = v2.CustomPrompt.jsonDecode(v200.value);
    end;
    return v201;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_CustomPromptsEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
};
v2.GetEligiblePromptsResponse_CustomPromptsEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_CustomPromptsEntry);
return {
    CustomPrompt = v2.CustomPrompt, 
    GetEligiblePromptsResponse = v2.GetEligiblePromptsResponse
};