local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 240 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        parameters = if not (v8 ~= nil) or v8.parameters == nil then {} else v8.parameters, 
        translations = if not (v8 ~= nil) or v8.translations == nil then {} else v8.translations
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 247 ]] --[[ Name: encode ]]
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
v6.decode = function(v25) --[[ Line: 282 ]] --[[ Name: decode ]]
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
v6.jsonEncode = function(v33) --[[ Line: 344 ]] --[[ Name: jsonEncode ]]
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
v6.jsonDecode = function(v41) --[[ Line: 366 ]] --[[ Name: jsonDecode ]]
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
v6.new = function(v50) --[[ Line: 404 ]] --[[ Name: new ]]
    -- upvalues: l_v6_1 (copy)
    return (setmetatable({
        key = (not (v50 ~= nil) or v50.key == nil) and "" or v50.key, 
        value = (not (v50 ~= nil) or v50.value == nil) and "" or v50.value
    }, l_v6_1));
end;
v6.encode = function(v51) --[[ Line: 413 ]] --[[ Name: encode ]]
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
v6.decode = function(v59) --[[ Line: 432 ]] --[[ Name: decode ]]
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
v6.jsonEncode = function(v67) --[[ Line: 480 ]] --[[ Name: jsonEncode ]]
    local v68 = {};
    if v67.key ~= nil and v67.key ~= "" then
        v68.key = v67.key;
    end;
    if v67.value ~= nil and v67.value ~= "" then
        v68.value = v67.value;
    end;
    return v68;
end;
v6.jsonDecode = function(v69) --[[ Line: 494 ]] --[[ Name: jsonDecode ]]
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
v6.new = function(v72) --[[ Line: 522 ]] --[[ Name: new ]]
    -- upvalues: l_v6_2 (copy)
    return (setmetatable({
        key = (not (v72 ~= nil) or v72.key == nil) and "" or v72.key, 
        value = (not (v72 ~= nil) or v72.value == nil) and "" or v72.value
    }, l_v6_2));
end;
v6.encode = function(v73) --[[ Line: 531 ]] --[[ Name: encode ]]
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
v6.decode = function(v81) --[[ Line: 550 ]] --[[ Name: decode ]]
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
v6.jsonEncode = function(v89) --[[ Line: 598 ]] --[[ Name: jsonEncode ]]
    local v90 = {};
    if v89.key ~= nil and v89.key ~= "" then
        v90.key = v89.key;
    end;
    if v89.value ~= nil and v89.value ~= "" then
        v90.value = v89.value;
    end;
    return v90;
end;
v6.jsonDecode = function(v91) --[[ Line: 612 ]] --[[ Name: jsonDecode ]]
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
v6.new = function(v94) --[[ Line: 640 ]] --[[ Name: new ]]
    -- upvalues: l_v6_3 (copy)
    return (setmetatable({
        page_entries = if not (v94 ~= nil) or v94.page_entries == nil then {} else v94.page_entries, 
        hydration_data = if not (v94 ~= nil) or v94.hydration_data == nil then nil else v94.hydration_data, 
        templates = if not (v94 ~= nil) or v94.templates == nil then {} else v94.templates, 
        custom_prompts = if not (v94 ~= nil) or v94.custom_prompts == nil then {} else v94.custom_prompts, 
        localized_literals = if not (v94 ~= nil) or v94.localized_literals == nil then {} else v94.localized_literals
    }, l_v6_3));
end;
v6.encode = function(v95) --[[ Line: 652 ]] --[[ Name: encode ]]
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
    if v95.localized_literals ~= nil and next(v95.localized_literals) ~= nil then
        for v120, v121 in v95.localized_literals do
            local v122 = buffer.create(0);
            local v123, v124 = v0.writeTag(v122, 0, 1, v0.wireTypes.lengthDelimited);
            v123, v124 = v0.writeString(v123, v124, v120);
            v123, v124 = v0.writeTag(v123, v124, 2, v0.wireTypes.lengthDelimited);
            v123, v124 = v0.writeString(v123, v124, v121);
            v122 = v123;
            local l_v124_0 = v124;
            v123, v124 = v0.writeTag(v96, v97, 5, v0.wireTypes.lengthDelimited);
            v123, v124 = v0.writeBuffer(v123, v124, v122, l_v124_0);
            v96 = v123;
            v97 = v124;
        end;
    end;
    local v126 = buffer.create(v97);
    buffer.copy(v126, 0, v96, 0, v97);
    return v126;
end;
v6.decode = function(v127) --[[ Line: 716 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_3 (copy), v0 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v128 = l_v6_3.new();
    local v129 = 0;
    while v129 < buffer.len(v127) do
        local v130 = nil;
        local v131 = nil;
        local v132, v133, v134 = v0.readTag(v127, v129);
        v130 = v132;
        v131 = v133;
        v129 = v134;
        if v131 == v0.wireTypes.varint then
            v132 = nil;
            v133, v134 = v0.readVarInt(v127, v129);
            v132 = v133;
            v129 = v134;
        elseif v131 == v0.wireTypes.lengthDelimited then
            if v130 == 1 then
                v132 = nil;
                v133, v134 = v0.readBuffer(v127, v129);
                v132 = v133;
                v129 = v134;
                table.insert(v128.page_entries, v4.UniversalPageEntry.decode(v132));
            elseif v130 == 2 then
                v132 = nil;
                v133, v134 = v0.readBuffer(v127, v129);
                v132 = v133;
                v129 = v134;
                v128.hydration_data = v3.HydrationContent.decode(v132);
            elseif v130 == 3 then
                v132 = nil;
                v133, v134 = v0.readBuffer(v127, v129);
                v132 = v133;
                v129 = v134;
                v133 = v2.GetEligiblePromptsResponse_TemplatesEntry.decode(v132);
                v134 = v5.TemplateEntry.new();
                v128.templates[v133.key or ""] = v133.value or v134;
            elseif v130 == 4 then
                v132 = nil;
                v133, v134 = v0.readBuffer(v127, v129);
                v132 = v133;
                v129 = v134;
                v133 = v2.GetEligiblePromptsResponse_CustomPromptsEntry.decode(v132);
                v134 = v2.CustomPrompt.new();
                v128.custom_prompts[v133.key or ""] = v133.value or v134;
            elseif v130 == 5 then
                v132 = nil;
                v133, v134 = v0.readBuffer(v127, v129);
                v132 = v133;
                v129 = v134;
                v133 = v2.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(v132);
                v128.localized_literals[v133.key or ""] = v133.value or "";
            else
                v132 = nil;
                v133, v134 = v0.readVarInt(v127, v129);
                v129 = v134 + v133;
            end;
        elseif v131 == v0.wireTypes.i32 then
            v132 = nil;
            v133, v134 = v0.readFixed32(v127, v129);
            v132 = v133;
            v129 = v134;
        elseif v131 == v0.wireTypes.i64 then
            v132 = nil;
            v133, v134 = v0.readFixed64(v127, v129);
            v132 = v133;
            v129 = v134;
        else
            error("Unsupported wire type: " .. v131);
        end;
    end;
    return v128;
end;
v6.jsonEncode = function(v135) --[[ Line: 804 ]] --[[ Name: jsonEncode ]]
    local v136 = {};
    if v135.page_entries ~= nil and #v135.page_entries > 0 then
        local v137 = {};
        for _, v139 in v135.page_entries do
            table.insert(v137, v139:jsonEncode());
        end;
        v136.pageEntries = v137;
    end;
    if v135.hydration_data ~= nil then
        v136.hydrationData = v135.hydration_data:jsonEncode();
    end;
    if v135.templates ~= nil and next(v135.templates) ~= nil then
        local v140 = {};
        for v141, v142 in v135.templates do
            v140[v141] = v142:jsonEncode();
        end;
        v136.templates = v140;
    end;
    if v135.custom_prompts ~= nil and next(v135.custom_prompts) ~= nil then
        local v143 = {};
        for v144, v145 in v135.custom_prompts do
            v143[v144] = v145:jsonEncode();
        end;
        v136.customPrompts = v143;
    end;
    if v135.localized_literals ~= nil and next(v135.localized_literals) ~= nil then
        local v146 = {};
        for v147, v148 in v135.localized_literals do
            v146[v147] = v148;
        end;
        v136.localizedLiterals = v146;
    end;
    return v136;
end;
v6.jsonDecode = function(v149) --[[ Line: 846 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_3 (copy), v4 (copy), v3 (copy), v5 (copy), v2 (copy)
    local v150 = l_v6_3.new();
    if v149.page_entries ~= nil then
        local v151 = {};
        for _, v153 in v149.page_entries do
            table.insert(v151, v4.UniversalPageEntry.jsonDecode(v153));
        end;
        v150.page_entries = v151;
    end;
    if v149.pageEntries ~= nil then
        local v154 = {};
        for _, v156 in v149.pageEntries do
            table.insert(v154, v4.UniversalPageEntry.jsonDecode(v156));
        end;
        v150.page_entries = v154;
    end;
    if v149.hydration_data ~= nil then
        v150.hydration_data = v3.HydrationContent.jsonDecode(v149.hydration_data);
    end;
    if v149.hydrationData ~= nil then
        v150.hydration_data = v3.HydrationContent.jsonDecode(v149.hydrationData);
    end;
    if v149.templates ~= nil then
        local v157 = {};
        for v158, v159 in v149.templates do
            v157[v158] = v5.TemplateEntry.jsonDecode(v159);
        end;
        v150.templates = v157;
    end;
    if v149.custom_prompts ~= nil then
        local v160 = {};
        for v161, v162 in v149.custom_prompts do
            v160[v161] = v2.CustomPrompt.jsonDecode(v162);
        end;
        v150.custom_prompts = v160;
    end;
    if v149.customPrompts ~= nil then
        local v163 = {};
        for v164, v165 in v149.customPrompts do
            v163[v164] = v2.CustomPrompt.jsonDecode(v165);
        end;
        v150.custom_prompts = v163;
    end;
    if v149.localized_literals ~= nil then
        local v166 = {};
        for v167, v168 in v149.localized_literals do
            v166[v167] = v168;
        end;
        v150.localized_literals = v166;
    end;
    if v149.localizedLiterals ~= nil then
        local v169 = {};
        for v170, v171 in v149.localizedLiterals do
            v169[v170] = v171;
        end;
        v150.localized_literals = v169;
    end;
    return v150;
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
v6.new = function(v173) --[[ Line: 947 ]] --[[ Name: new ]]
    -- upvalues: l_v6_4 (copy)
    return (setmetatable({
        key = (not (v173 ~= nil) or v173.key == nil) and "" or v173.key, 
        value = if not (v173 ~= nil) or v173.value == nil then nil else v173.value
    }, l_v6_4));
end;
v6.encode = function(v174) --[[ Line: 956 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v175 = buffer.create(0);
    local v176 = 0;
    if v174.key ~= nil and v174.key ~= "" then
        local v177, v178 = v0.writeTag(v175, v176, 1, v0.wireTypes.lengthDelimited);
        v177, v178 = v0.writeString(v177, v178, v174.key);
        v175 = v177;
        v176 = v178;
    end;
    if v174.value ~= nil then
        local v179 = v174.value:encode();
        local v180, v181 = v0.writeTag(v175, v176, 2, v0.wireTypes.lengthDelimited);
        v180, v181 = v0.writeBuffer(v180, v181, v179, buffer.len(v179));
        v175 = v180;
        v176 = v181;
    end;
    local v182 = buffer.create(v176);
    buffer.copy(v182, 0, v175, 0, v176);
    return v182;
end;
v6.decode = function(v183) --[[ Line: 978 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_4 (copy), v0 (copy), v5 (copy)
    local v184 = l_v6_4.new();
    local v185 = 0;
    while v185 < buffer.len(v183) do
        local v186 = nil;
        local v187 = nil;
        local v188, v189, v190 = v0.readTag(v183, v185);
        v186 = v188;
        v187 = v189;
        v185 = v190;
        if v187 == v0.wireTypes.varint then
            v188 = nil;
            v189, v190 = v0.readVarInt(v183, v185);
            v188 = v189;
            v185 = v190;
        elseif v187 == v0.wireTypes.lengthDelimited then
            if v186 == 1 then
                v188 = nil;
                v189, v190 = v0.readBuffer(v183, v185);
                v188 = v189;
                v185 = v190;
                v184.key = buffer.tostring(v188);
            elseif v186 == 2 then
                v188 = nil;
                v189, v190 = v0.readBuffer(v183, v185);
                v188 = v189;
                v185 = v190;
                v184.value = v5.TemplateEntry.decode(v188);
            else
                v188 = nil;
                v189, v190 = v0.readVarInt(v183, v185);
                v185 = v190 + v189;
            end;
        elseif v187 == v0.wireTypes.i32 then
            v188 = nil;
            v189, v190 = v0.readFixed32(v183, v185);
            v188 = v189;
            v185 = v190;
        elseif v187 == v0.wireTypes.i64 then
            v188 = nil;
            v189, v190 = v0.readFixed64(v183, v185);
            v188 = v189;
            v185 = v190;
        else
            error("Unsupported wire type: " .. v187);
        end;
    end;
    return v184;
end;
v6.jsonEncode = function(v191) --[[ Line: 1028 ]] --[[ Name: jsonEncode ]]
    local v192 = {};
    if v191.key ~= nil and v191.key ~= "" then
        v192.key = v191.key;
    end;
    if v191.value ~= nil then
        v192.value = v191.value:jsonEncode();
    end;
    return v192;
end;
v6.jsonDecode = function(v193) --[[ Line: 1044 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_4 (copy), v5 (copy)
    local v194 = l_v6_4.new();
    if v193.key ~= nil then
        v194.key = v193.key;
    end;
    if v193.value ~= nil then
        v194.value = v5.TemplateEntry.jsonDecode(v193.value);
    end;
    return v194;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
};
v2.GetEligiblePromptsResponse_TemplatesEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_TemplatesEntry);
v6 = {};
v6.__index = v6;
local l_v6_5 = v6 --[[ copy: 6 -> 12 ]];
v6.new = function(v196) --[[ Line: 1074 ]] --[[ Name: new ]]
    -- upvalues: l_v6_5 (copy)
    return (setmetatable({
        key = (not (v196 ~= nil) or v196.key == nil) and "" or v196.key, 
        value = if not (v196 ~= nil) or v196.value == nil then nil else v196.value
    }, l_v6_5));
end;
v6.encode = function(v197) --[[ Line: 1083 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v198 = buffer.create(0);
    local v199 = 0;
    if v197.key ~= nil and v197.key ~= "" then
        local v200, v201 = v0.writeTag(v198, v199, 1, v0.wireTypes.lengthDelimited);
        v200, v201 = v0.writeString(v200, v201, v197.key);
        v198 = v200;
        v199 = v201;
    end;
    if v197.value ~= nil then
        local v202 = v197.value:encode();
        local v203, v204 = v0.writeTag(v198, v199, 2, v0.wireTypes.lengthDelimited);
        v203, v204 = v0.writeBuffer(v203, v204, v202, buffer.len(v202));
        v198 = v203;
        v199 = v204;
    end;
    local v205 = buffer.create(v199);
    buffer.copy(v205, 0, v198, 0, v199);
    return v205;
end;
v6.decode = function(v206) --[[ Line: 1105 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_5 (copy), v0 (copy), v2 (copy)
    local v207 = l_v6_5.new();
    local v208 = 0;
    while v208 < buffer.len(v206) do
        local v209 = nil;
        local v210 = nil;
        local v211, v212, v213 = v0.readTag(v206, v208);
        v209 = v211;
        v210 = v212;
        v208 = v213;
        if v210 == v0.wireTypes.varint then
            v211 = nil;
            v212, v213 = v0.readVarInt(v206, v208);
            v211 = v212;
            v208 = v213;
        elseif v210 == v0.wireTypes.lengthDelimited then
            if v209 == 1 then
                v211 = nil;
                v212, v213 = v0.readBuffer(v206, v208);
                v211 = v212;
                v208 = v213;
                v207.key = buffer.tostring(v211);
            elseif v209 == 2 then
                v211 = nil;
                v212, v213 = v0.readBuffer(v206, v208);
                v211 = v212;
                v208 = v213;
                v207.value = v2.CustomPrompt.decode(v211);
            else
                v211 = nil;
                v212, v213 = v0.readVarInt(v206, v208);
                v208 = v213 + v212;
            end;
        elseif v210 == v0.wireTypes.i32 then
            v211 = nil;
            v212, v213 = v0.readFixed32(v206, v208);
            v211 = v212;
            v208 = v213;
        elseif v210 == v0.wireTypes.i64 then
            v211 = nil;
            v212, v213 = v0.readFixed64(v206, v208);
            v211 = v212;
            v208 = v213;
        else
            error("Unsupported wire type: " .. v210);
        end;
    end;
    return v207;
end;
v6.jsonEncode = function(v214) --[[ Line: 1155 ]] --[[ Name: jsonEncode ]]
    local v215 = {};
    if v214.key ~= nil and v214.key ~= "" then
        v215.key = v214.key;
    end;
    if v214.value ~= nil then
        v215.value = v214.value:jsonEncode();
    end;
    return v215;
end;
v6.jsonDecode = function(v216) --[[ Line: 1171 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_5 (copy), v2 (copy)
    local v217 = l_v6_5.new();
    if v216.key ~= nil then
        v217.key = v216.key;
    end;
    if v216.value ~= nil then
        v217.value = v2.CustomPrompt.jsonDecode(v216.value);
    end;
    return v217;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_CustomPromptsEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
};
v2.GetEligiblePromptsResponse_CustomPromptsEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_CustomPromptsEntry);
v6 = {};
v6.__index = v6;
v6.new = function(v218) --[[ Line: 1202 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v218 ~= nil) or v218.key == nil) and "" or v218.key, 
        value = (not (v218 ~= nil) or v218.value == nil) and "" or v218.value
    }, v6));
end;
v6.encode = function(v219) --[[ Line: 1214 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v220 = buffer.create(0);
    local v221 = 0;
    if v219.key ~= nil and v219.key ~= "" then
        local v222, v223 = v0.writeTag(v220, v221, 1, v0.wireTypes.lengthDelimited);
        v222, v223 = v0.writeString(v222, v223, v219.key);
        v220 = v222;
        v221 = v223;
    end;
    if v219.value ~= nil and v219.value ~= "" then
        local v224, v225 = v0.writeTag(v220, v221, 2, v0.wireTypes.lengthDelimited);
        v224, v225 = v0.writeString(v224, v225, v219.value);
        v220 = v224;
        v221 = v225;
    end;
    local v226 = buffer.create(v221);
    buffer.copy(v226, 0, v220, 0, v221);
    return v226;
end;
v6.decode = function(v227) --[[ Line: 1235 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy)
    local v228 = v6.new();
    local v229 = 0;
    while v229 < buffer.len(v227) do
        local v230 = nil;
        local v231 = nil;
        local v232, v233, v234 = v0.readTag(v227, v229);
        v230 = v232;
        v231 = v233;
        v229 = v234;
        if v231 == v0.wireTypes.varint then
            v232 = nil;
            v233, v234 = v0.readVarInt(v227, v229);
            v232 = v233;
            v229 = v234;
        elseif v231 == v0.wireTypes.lengthDelimited then
            if v230 == 1 then
                v232 = nil;
                v233, v234 = v0.readBuffer(v227, v229);
                v232 = v233;
                v229 = v234;
                v228.key = buffer.tostring(v232);
            elseif v230 == 2 then
                v232 = nil;
                v233, v234 = v0.readBuffer(v227, v229);
                v232 = v233;
                v229 = v234;
                v228.value = buffer.tostring(v232);
            else
                v232 = nil;
                v233, v234 = v0.readVarInt(v227, v229);
                v229 = v234 + v233;
            end;
        elseif v231 == v0.wireTypes.i32 then
            v232 = nil;
            v233, v234 = v0.readFixed32(v227, v229);
            v232 = v233;
            v229 = v234;
        elseif v231 == v0.wireTypes.i64 then
            v232 = nil;
            v233, v234 = v0.readFixed64(v227, v229);
            v232 = v233;
            v229 = v234;
        else
            error("Unsupported wire type: " .. v231);
        end;
    end;
    return v228;
end;
v6.jsonEncode = function(v235) --[[ Line: 1285 ]] --[[ Name: jsonEncode ]]
    local v236 = {};
    if v235.key ~= nil and v235.key ~= "" then
        v236.key = v235.key;
    end;
    if v235.value ~= nil and v235.value ~= "" then
        v236.value = v235.value;
    end;
    return v236;
end;
v6.jsonDecode = function(v237) --[[ Line: 1301 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy)
    local v238 = v6.new();
    if v237.key ~= nil then
        v238.key = v237.key;
    end;
    if v237.value ~= nil then
        v238.value = v237.value;
    end;
    return v238;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_LocalizedLiteralsEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.LocalizedLiteralsEntry"
};
v2.GetEligiblePromptsResponse_LocalizedLiteralsEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_LocalizedLiteralsEntry);
return {
    CustomPrompt = v2.CustomPrompt, 
    GetEligiblePromptsResponse = v2.GetEligiblePromptsResponse
};