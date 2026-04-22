local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct);
local v4 = require(script.Parent.prop_condition);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 3068 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        namespace = (not (v7 ~= nil) or v7.namespace == nil) and "" or v7.namespace, 
        key = (not (v7 ~= nil) or v7.key == nil) and "" or v7.key, 
        map_key = (not (v7 ~= nil) or v7.map_key == nil) and "" or v7.map_key
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 3076 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v9 = buffer.create(0);
    local v10 = 0;
    if v8.namespace ~= nil and v8.namespace ~= "" then
        local v11, v12 = v0.writeTag(v9, v10, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeString(v11, v12, v8.namespace);
        v9 = v11;
        v10 = v12;
    end;
    if v8.key ~= nil and v8.key ~= "" then
        local v13, v14 = v0.writeTag(v9, v10, 2, v0.wireTypes.lengthDelimited);
        v13, v14 = v0.writeString(v13, v14, v8.key);
        v9 = v13;
        v10 = v14;
    end;
    if v8.map_key ~= nil and v8.map_key ~= "" then
        local v15, v16 = v0.writeTag(v9, v10, 3, v0.wireTypes.lengthDelimited);
        v15, v16 = v0.writeString(v15, v16, v8.map_key);
        v9 = v15;
        v10 = v16;
    end;
    local v17 = buffer.create(v10);
    buffer.copy(v17, 0, v9, 0, v10);
    return v17;
end;
v5.decode = function(v18) --[[ Line: 3100 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_0 (copy), v0 (copy)
    local v19 = l_v5_0.new();
    local v20 = 0;
    while v20 < buffer.len(v18) do
        local v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v0.readTag(v18, v20);
        v21 = v23;
        v22 = v24;
        v20 = v25;
        if v22 == v0.wireTypes.varint then
            v23 = nil;
            v24, v25 = v0.readVarInt(v18, v20);
            v23 = v24;
            v20 = v25;
        elseif v22 == v0.wireTypes.lengthDelimited then
            if v21 == 1 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.namespace = buffer.tostring(v23);
            elseif v21 == 2 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.key = buffer.tostring(v23);
            elseif v21 == 3 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.map_key = buffer.tostring(v23);
            else
                v23 = nil;
                v24, v25 = v0.readVarInt(v18, v20);
                v20 = v25 + v24;
            end;
        elseif v22 == v0.wireTypes.i32 then
            v23 = nil;
            v24, v25 = v0.readFixed32(v18, v20);
            v23 = v24;
            v20 = v25;
        elseif v22 == v0.wireTypes.i64 then
            v23 = nil;
            v24, v25 = v0.readFixed64(v18, v20);
            v23 = v24;
            v20 = v25;
        else
            error("Unsupported wire type: " .. v22);
        end;
    end;
    return v19;
end;
v5.jsonEncode = function(v26) --[[ Line: 3153 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.namespace ~= nil and v26.namespace ~= "" then
        v27.namespace = v26.namespace;
    end;
    if v26.key ~= nil and v26.key ~= "" then
        v27.key = v26.key;
    end;
    if v26.map_key ~= nil and v26.map_key ~= "" then
        v27.mapKey = v26.map_key;
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 3171 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy)
    local v29 = l_v5_0.new();
    if v28.namespace ~= nil then
        v29.namespace = v28.namespace;
    end;
    if v28.key ~= nil then
        v29.key = v28.key;
    end;
    if v28.map_key ~= nil then
        v29.map_key = v28.map_key;
    end;
    if v28.mapKey ~= nil then
        v29.map_key = v28.mapKey;
    end;
    return v29;
end;
v5.descriptor = {
    name = "TranslationRef", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
};
v2.TranslationRef = v5;
v1.default:register(v2.TranslationRef);
v5 = {};
v5.__index = v5;
local l_v5_1 = v5 --[[ copy: 5 -> 7 ]];
v5.new = function(v31) --[[ Line: 3207 ]] --[[ Name: new ]]
    -- upvalues: l_v5_1 (copy)
    return (setmetatable({
        str = (not (v31 ~= nil) or v31.str == nil) and "" or v31.str, 
        args = if not (v31 ~= nil) or v31.args == nil then {} else v31.args, 
        translation = if not (v31 ~= nil) or v31.translation == nil then nil else v31.translation
    }, l_v5_1));
end;
v5.encode = function(v32) --[[ Line: 3215 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.str ~= nil and v32.str ~= "" then
        local v35, v36 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeString(v35, v36, v32.str);
        v33 = v35;
        v34 = v36;
    end;
    if v32.args ~= nil and next(v32.args) ~= nil then
        for v37, v38 in v32.args do
            local v39 = buffer.create(0);
            local v40, v41 = v0.writeTag(v39, 0, 1, v0.wireTypes.lengthDelimited);
            v40, v41 = v0.writeString(v40, v41, v37);
            v39 = v40;
            local l_v41_0 = v41;
            v40 = v38:encode();
            local v43;
            v41, v43 = v0.writeTag(v39, l_v41_0, 2, v0.wireTypes.lengthDelimited);
            v41, v43 = v0.writeBuffer(v41, v43, v40, buffer.len(v40));
            v39 = v41;
            l_v41_0 = v43;
            v41, v43 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
            v41, v43 = v0.writeBuffer(v41, v43, v39, l_v41_0);
            v33 = v41;
            v34 = v43;
        end;
    end;
    if v32.translation ~= nil then
        local v44 = v32.translation:encode();
        local v45, v46 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    local v47 = buffer.create(v34);
    buffer.copy(v47, 0, v33, 0, v34);
    return v47;
end;
v5.decode = function(v48) --[[ Line: 3249 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_1 (copy), v0 (copy), v2 (copy)
    local v49 = l_v5_1.new();
    local v50 = 0;
    while v50 < buffer.len(v48) do
        local v51 = nil;
        local v52 = nil;
        local v53, v54, v55 = v0.readTag(v48, v50);
        v51 = v53;
        v52 = v54;
        v50 = v55;
        if v52 == v0.wireTypes.varint then
            v53 = nil;
            v54, v55 = v0.readVarInt(v48, v50);
            v53 = v54;
            v50 = v55;
        elseif v52 == v0.wireTypes.lengthDelimited then
            if v51 == 1 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.str = buffer.tostring(v53);
            elseif v51 == 2 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v54 = v2.StringFormat_ArgsEntry.decode(v53);
                v55 = v2.StringFormat_FormatArg.new();
                v49.args[v54.key or ""] = v54.value or v55;
            elseif v51 == 3 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.translation = v2.TranslationRef.decode(v53);
            else
                v53 = nil;
                v54, v55 = v0.readVarInt(v48, v50);
                v50 = v55 + v54;
            end;
        elseif v52 == v0.wireTypes.i32 then
            v53 = nil;
            v54, v55 = v0.readFixed32(v48, v50);
            v53 = v54;
            v50 = v55;
        elseif v52 == v0.wireTypes.i64 then
            v53 = nil;
            v54, v55 = v0.readFixed64(v48, v50);
            v53 = v54;
            v50 = v55;
        else
            error("Unsupported wire type: " .. v52);
        end;
    end;
    return v49;
end;
v5.jsonEncode = function(v56) --[[ Line: 3309 ]] --[[ Name: jsonEncode ]]
    local v57 = {};
    if v56.str ~= nil and v56.str ~= "" then
        v57.str = v56.str;
    end;
    if v56.args ~= nil and next(v56.args) ~= nil then
        local v58 = {};
        for v59, v60 in v56.args do
            v58[v59] = v60:jsonEncode();
        end;
        v57.args = v58;
    end;
    if v56.translation ~= nil then
        v57.translation = v56.translation:jsonEncode();
    end;
    return v57;
end;
v5.jsonDecode = function(v61) --[[ Line: 3331 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_1 (copy), v2 (copy)
    local v62 = l_v5_1.new();
    if v61.str ~= nil then
        v62.str = v61.str;
    end;
    if v61.args ~= nil then
        local v63 = {};
        for v64, v65 in v61.args do
            v63[v64] = v2.StringFormat_FormatArg.jsonDecode(v65);
        end;
        v62.args = v63;
    end;
    if v61.translation ~= nil then
        v62.translation = v2.TranslationRef.jsonDecode(v61.translation);
    end;
    return v62;
end;
v5.descriptor = {
    name = "StringFormat", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
};
v2.StringFormat = v5;
v1.default:register(v2.StringFormat);
v5 = {};
v5.__index = v5;
local l_v5_2 = v5 --[[ copy: 5 -> 8 ]];
v5.new = function(v67) --[[ Line: 3368 ]] --[[ Name: new ]]
    -- upvalues: l_v5_2 (copy)
    return (setmetatable({
        kind = if not (v67 ~= nil) or v67.kind == nil then nil else v67.kind, 
        formatter = if not (v67 ~= nil) or v67.formatter == nil then nil else v67.formatter
    }, l_v5_2));
end;
v5.encode = function(v68) --[[ Line: 3375 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v69 = buffer.create(0);
    local v70 = 0;
    if v68.kind ~= nil then
        if v68.kind.type == "literal" then
            local v71, v72 = v0.writeTag(v69, v70, 1, v0.wireTypes.lengthDelimited);
            v71, v72 = v0.writeString(v71, v72, v68.kind.value);
            v69 = v71;
            v70 = v72;
        elseif v68.kind.type == "binding_path" then
            local v73, v74 = v0.writeTag(v69, v70, 2, v0.wireTypes.lengthDelimited);
            v73, v74 = v0.writeString(v73, v74, v68.kind.value);
            v69 = v73;
            v70 = v74;
        end;
    end;
    if v68.formatter ~= nil then
        local v75 = v68.formatter:encode();
        local v76, v77 = v0.writeTag(v69, v70, 3, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
        v69 = v76;
        v70 = v77;
    end;
    local v78 = buffer.create(v70);
    buffer.copy(v78, 0, v69, 0, v70);
    return v78;
end;
v5.decode = function(v79) --[[ Line: 3400 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_2 (copy), v0 (copy), v2 (copy)
    local v80 = l_v5_2.new();
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
                v80.kind = {
                    type = "literal", 
                    value = buffer.tostring(v84)
                };
            elseif v82 == 2 then
                v84 = nil;
                v85, v86 = v0.readBuffer(v79, v81);
                v84 = v85;
                v81 = v86;
                v80.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v84)
                };
            elseif v82 == 3 then
                v84 = nil;
                v85, v86 = v0.readBuffer(v79, v81);
                v84 = v85;
                v81 = v86;
                v80.formatter = v2.StringFormat_FormatArg_Formatter.decode(v84);
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
v5.jsonEncode = function(v87) --[[ Line: 3453 ]] --[[ Name: jsonEncode ]]
    local v88 = {};
    if v87.kind ~= nil then
        if v87.kind.type == "literal" then
            v88.literal = v87.kind.value;
        elseif v87.kind.type == "binding_path" then
            v88.bindingPath = v87.kind.value;
        end;
    end;
    if v87.formatter ~= nil then
        v88.formatter = v87.formatter:jsonEncode();
    end;
    return v88;
end;
v5.jsonDecode = function(v89) --[[ Line: 3471 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_2 (copy), v2 (copy)
    local v90 = l_v5_2.new();
    if v89.literal ~= nil then
        v90.kind = {
            type = "literal", 
            value = v89.literal
        };
    end;
    if v89.binding_path ~= nil then
        v90.kind = {
            type = "binding_path", 
            value = v89.binding_path
        };
    end;
    if v89.bindingPath ~= nil then
        v90.kind = {
            type = "binding_path", 
            value = v89.bindingPath
        };
    end;
    if v89.formatter ~= nil then
        v90.formatter = v2.StringFormat_FormatArg_Formatter.jsonDecode(v89.formatter);
    end;
    return v90;
end;
v5.descriptor = {
    name = "StringFormat_FormatArg", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
};
v2.StringFormat_FormatArg = v5;
v1.default:register(v2.StringFormat_FormatArg);
v5 = {};
v5.__index = v5;
local l_v5_3 = v5 --[[ copy: 5 -> 9 ]];
v5.new = function(v92) --[[ Line: 3507 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v5_3 (copy)
    return (setmetatable({
        type = if not (v92 ~= nil) or v92.type == nil then assert(v2.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else v92.type, 
        config = if not (v92 ~= nil) or v92.config == nil then nil else v92.config
    }, l_v5_3));
end;
v5.encode = function(v93) --[[ Line: 3518 ]] --[[ Name: encode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v94 = buffer.create(0);
    local v95 = 0;
    if v93.type ~= nil and (v93.type ~= nil and v93.type ~= 0 or v93.type ~= v2.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
        local v96, v97 = v0.writeTag(v94, v95, 1, v0.wireTypes.varint);
        v96, v97 = v0.writeVarInt(v96, v97, v2.StringFormat_FormatArg_Formatter_Type.toNumber(v93.type));
        v94 = v96;
        v95 = v97;
    end;
    if v93.config ~= nil and v93.config.type == "date_config" then
        local v98 = v93.config.value:encode();
        local v99, v100 = v0.writeTag(v94, v95, 2, v0.wireTypes.lengthDelimited);
        v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
        v94 = v99;
        v95 = v100;
    end;
    local v101 = buffer.create(v95);
    buffer.copy(v101, 0, v94, 0, v95);
    return v101;
end;
v5.decode = function(v102) --[[ Line: 3550 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_3 (copy), v0 (copy), v2 (copy)
    local v103 = l_v5_3.new();
    local v104 = 0;
    while v104 < buffer.len(v102) do
        local v105 = nil;
        local v106 = nil;
        local v107, v108, v109 = v0.readTag(v102, v104);
        v105 = v107;
        v106 = v108;
        v104 = v109;
        if v106 == v0.wireTypes.varint then
            if v105 == 1 then
                v107 = nil;
                v108, v109 = v0.readVarIntI32(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.type = v2.StringFormat_FormatArg_Formatter_Type.fromNumber(v107) or v107;
            else
                v107 = nil;
                v108, v109 = v0.readVarInt(v102, v104);
                v107 = v108;
                v104 = v109;
            end;
        elseif v106 == v0.wireTypes.lengthDelimited then
            if v105 == 2 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.config = {
                    type = "date_config", 
                    value = v2.StringFormat_FormatArg_Formatter_DateConfig.decode(v107)
                };
            else
                v107 = nil;
                v108, v109 = v0.readVarInt(v102, v104);
                v104 = v109 + v108;
            end;
        elseif v106 == v0.wireTypes.i32 then
            v107 = nil;
            v108, v109 = v0.readFixed32(v102, v104);
            v107 = v108;
            v104 = v109;
        elseif v106 == v0.wireTypes.i64 then
            v107 = nil;
            v108, v109 = v0.readFixed64(v102, v104);
            v107 = v108;
            v104 = v109;
        else
            error("Unsupported wire type: " .. v106);
        end;
    end;
    return v103;
end;
v5.jsonEncode = function(v110) --[[ Line: 3601 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v111 = {};
    if v110.type ~= nil and (v110.type ~= nil and v110.type ~= 0 or v110.type ~= v2.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
        v111.type = if typeof(v110.type) == "number" then v110.type else v2.StringFormat_FormatArg_Formatter_Type.toNumber(v110.type);
    end;
    if v110.config ~= nil and v110.config.type == "date_config" then
        v111.dateConfig = v110.config.value:jsonEncode();
    end;
    return v111;
end;
v5.jsonDecode = function(v112) --[[ Line: 3625 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_3 (copy), v2 (copy)
    local v113 = l_v5_3.new();
    if v112.type ~= nil then
        v113.type = if typeof(v112.type) == "number" then v2.StringFormat_FormatArg_Formatter_Type.fromNumber(v112.type) or v112.type else v2.StringFormat_FormatArg_Formatter_Type.fromName(v112.type) or v112.type;
    end;
    if v112.date_config ~= nil then
        v113.config = {
            type = "date_config", 
            value = v2.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(v112.date_config)
        };
    end;
    if v112.dateConfig ~= nil then
        v113.config = {
            type = "date_config", 
            value = v2.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(v112.dateConfig)
        };
    end;
    return v113;
end;
v5.descriptor = {
    name = "StringFormat_FormatArg_Formatter", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
};
v2.StringFormat_FormatArg_Formatter = v5;
v1.default:register(v2.StringFormat_FormatArg_Formatter);
v5 = {};
v5.__index = v5;
local l_v5_4 = v5 --[[ copy: 5 -> 10 ]];
v5.new = function(v115) --[[ Line: 3667 ]] --[[ Name: new ]]
    -- upvalues: l_v5_4 (copy)
    return (setmetatable({
        pattern = (not (v115 ~= nil) or v115.pattern == nil) and "" or v115.pattern
    }, l_v5_4));
end;
v5.encode = function(v116) --[[ Line: 3675 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v117 = buffer.create(0);
    local v118 = 0;
    if v116.pattern ~= nil and v116.pattern ~= "" then
        local v119, v120 = v0.writeTag(v117, v118, 1, v0.wireTypes.lengthDelimited);
        v119, v120 = v0.writeString(v119, v120, v116.pattern);
        v117 = v119;
        v118 = v120;
    end;
    local v121 = buffer.create(v118);
    buffer.copy(v121, 0, v117, 0, v118);
    return v121;
end;
v5.decode = function(v122) --[[ Line: 3691 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_4 (copy), v0 (copy)
    local v123 = l_v5_4.new();
    local v124 = 0;
    while v124 < buffer.len(v122) do
        local v125 = nil;
        local v126 = nil;
        local v127, v128, v129 = v0.readTag(v122, v124);
        v125 = v127;
        v126 = v128;
        v124 = v129;
        if v126 == v0.wireTypes.varint then
            v127 = nil;
            v128, v129 = v0.readVarInt(v122, v124);
            v127 = v128;
            v124 = v129;
        elseif v126 == v0.wireTypes.lengthDelimited then
            if v125 == 1 then
                v127 = nil;
                v128, v129 = v0.readBuffer(v122, v124);
                v127 = v128;
                v124 = v129;
                v123.pattern = buffer.tostring(v127);
            else
                v127 = nil;
                v128, v129 = v0.readVarInt(v122, v124);
                v124 = v129 + v128;
            end;
        elseif v126 == v0.wireTypes.i32 then
            v127 = nil;
            v128, v129 = v0.readFixed32(v122, v124);
            v127 = v128;
            v124 = v129;
        elseif v126 == v0.wireTypes.i64 then
            v127 = nil;
            v128, v129 = v0.readFixed64(v122, v124);
            v127 = v128;
            v124 = v129;
        else
            error("Unsupported wire type: " .. v126);
        end;
    end;
    return v123;
end;
v5.jsonEncode = function(v130) --[[ Line: 3736 ]] --[[ Name: jsonEncode ]]
    local v131 = {};
    if v130.pattern ~= nil and v130.pattern ~= "" then
        v131.pattern = v130.pattern;
    end;
    return v131;
end;
v5.jsonDecode = function(v132) --[[ Line: 3748 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_4 (copy)
    local v133 = l_v5_4.new();
    if v132.pattern ~= nil then
        v133.pattern = v132.pattern;
    end;
    return v133;
end;
v5.descriptor = {
    name = "StringFormat_FormatArg_Formatter_DateConfig", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
};
v2.StringFormat_FormatArg_Formatter_DateConfig = v5;
v1.default:register(v2.StringFormat_FormatArg_Formatter_DateConfig);
v2.StringFormat_FormatArg_Formatter_Type = {
    fromNumber = function(v134) --[[ Line: 3771 ]] --[[ Name: fromNumber ]]
        if v134 == 0 then
            return "TYPE_INVALID";
        elseif v134 == 1 then
            return "TYPE_NUMBER_ABBREVIATE";
        elseif v134 == 2 then
            return "TYPE_NUMBER_LOCALIZE";
        elseif v134 == 3 then
            return "TYPE_DATE_FORMAT";
        else
            return nil;
        end;
    end, 
    toNumber = function(v135) --[[ Line: 3785 ]] --[[ Name: toNumber ]]
        if v135 == "TYPE_INVALID" then
            return 0;
        elseif v135 == "TYPE_NUMBER_ABBREVIATE" then
            return 1;
        elseif v135 == "TYPE_NUMBER_LOCALIZE" then
            return 2;
        elseif v135 == "TYPE_DATE_FORMAT" then
            return 3;
        else
            return v135;
        end;
    end, 
    fromName = function(v136) --[[ Line: 3799 ]] --[[ Name: fromName ]]
        if v136 == "TYPE_INVALID" then
            return "TYPE_INVALID";
        elseif v136 == "TYPE_NUMBER_ABBREVIATE" then
            return "TYPE_NUMBER_ABBREVIATE";
        elseif v136 == "TYPE_NUMBER_LOCALIZE" then
            return "TYPE_NUMBER_LOCALIZE";
        elseif v136 == "TYPE_DATE_FORMAT" then
            return "TYPE_DATE_FORMAT";
        else
            return nil;
        end;
    end
};
v5 = {};
v5.__index = v5;
local l_v5_5 = v5 --[[ copy: 5 -> 11 ]];
v5.new = function(v138) --[[ Line: 3818 ]] --[[ Name: new ]]
    -- upvalues: l_v5_5 (copy)
    return (setmetatable({
        key = (not (v138 ~= nil) or v138.key == nil) and "" or v138.key, 
        value = if not (v138 ~= nil) or v138.value == nil then nil else v138.value
    }, l_v5_5));
end;
v5.encode = function(v139) --[[ Line: 3825 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v140 = buffer.create(0);
    local v141 = 0;
    if v139.key ~= nil and v139.key ~= "" then
        local v142, v143 = v0.writeTag(v140, v141, 1, v0.wireTypes.lengthDelimited);
        v142, v143 = v0.writeString(v142, v143, v139.key);
        v140 = v142;
        v141 = v143;
    end;
    if v139.value ~= nil then
        local v144 = v139.value:encode();
        local v145, v146 = v0.writeTag(v140, v141, 2, v0.wireTypes.lengthDelimited);
        v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
        v140 = v145;
        v141 = v146;
    end;
    local v147 = buffer.create(v141);
    buffer.copy(v147, 0, v140, 0, v141);
    return v147;
end;
v5.decode = function(v148) --[[ Line: 3845 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_5 (copy), v0 (copy), v2 (copy)
    local v149 = l_v5_5.new();
    local v150 = 0;
    while v150 < buffer.len(v148) do
        local v151 = nil;
        local v152 = nil;
        local v153, v154, v155 = v0.readTag(v148, v150);
        v151 = v153;
        v152 = v154;
        v150 = v155;
        if v152 == v0.wireTypes.varint then
            v153 = nil;
            v154, v155 = v0.readVarInt(v148, v150);
            v153 = v154;
            v150 = v155;
        elseif v152 == v0.wireTypes.lengthDelimited then
            if v151 == 1 then
                v153 = nil;
                v154, v155 = v0.readBuffer(v148, v150);
                v153 = v154;
                v150 = v155;
                v149.key = buffer.tostring(v153);
            elseif v151 == 2 then
                v153 = nil;
                v154, v155 = v0.readBuffer(v148, v150);
                v153 = v154;
                v150 = v155;
                v149.value = v2.StringFormat_FormatArg.decode(v153);
            else
                v153 = nil;
                v154, v155 = v0.readVarInt(v148, v150);
                v150 = v155 + v154;
            end;
        elseif v152 == v0.wireTypes.i32 then
            v153 = nil;
            v154, v155 = v0.readFixed32(v148, v150);
            v153 = v154;
            v150 = v155;
        elseif v152 == v0.wireTypes.i64 then
            v153 = nil;
            v154, v155 = v0.readFixed64(v148, v150);
            v153 = v154;
            v150 = v155;
        else
            error("Unsupported wire type: " .. v152);
        end;
    end;
    return v149;
end;
v5.jsonEncode = function(v156) --[[ Line: 3893 ]] --[[ Name: jsonEncode ]]
    local v157 = {};
    if v156.key ~= nil and v156.key ~= "" then
        v157.key = v156.key;
    end;
    if v156.value ~= nil then
        v157.value = v156.value:jsonEncode();
    end;
    return v157;
end;
v5.jsonDecode = function(v158) --[[ Line: 3907 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_5 (copy), v2 (copy)
    local v159 = l_v5_5.new();
    if v158.key ~= nil then
        v159.key = v158.key;
    end;
    if v158.value ~= nil then
        v159.value = v2.StringFormat_FormatArg.jsonDecode(v158.value);
    end;
    return v159;
end;
v5.descriptor = {
    name = "StringFormat_ArgsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
};
v2.StringFormat_ArgsEntry = v5;
v1.default:register(v2.StringFormat_ArgsEntry);
v5 = {};
v5.__index = v5;
local l_v5_6 = v5 --[[ copy: 5 -> 12 ]];
v5.new = function(v161) --[[ Line: 3935 ]] --[[ Name: new ]]
    -- upvalues: l_v5_6 (copy)
    return (setmetatable({
        kind = if not (v161 ~= nil) or v161.kind == nil then nil else v161.kind
    }, l_v5_6));
end;
v5.encode = function(v162) --[[ Line: 3941 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v163 = buffer.create(0);
    local v164 = 0;
    if v162.kind ~= nil then
        if v162.kind.type == "literal" then
            local v165, v166 = v0.writeTag(v163, v164, 1, v0.wireTypes.lengthDelimited);
            v165, v166 = v0.writeString(v165, v166, v162.kind.value);
            v163 = v165;
            v164 = v166;
        elseif v162.kind.type == "binding_path" then
            local v167, v168 = v0.writeTag(v163, v164, 2, v0.wireTypes.lengthDelimited);
            v167, v168 = v0.writeString(v167, v168, v162.kind.value);
            v163 = v167;
            v164 = v168;
        elseif v162.kind.type == "token" then
            local v169, v170 = v0.writeTag(v163, v164, 3, v0.wireTypes.lengthDelimited);
            v169, v170 = v0.writeString(v169, v170, v162.kind.value);
            v163 = v169;
            v164 = v170;
        elseif v162.kind.type == "format" then
            local v171 = v162.kind.value:encode();
            local v172, v173 = v0.writeTag(v163, v164, 4, v0.wireTypes.lengthDelimited);
            v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
            v163 = v172;
            v164 = v173;
        elseif v162.kind.type == "conditional" then
            local v174 = v162.kind.value:encode();
            local v175, v176 = v0.writeTag(v163, v164, 5, v0.wireTypes.lengthDelimited);
            v175, v176 = v0.writeBuffer(v175, v176, v174, buffer.len(v174));
            v163 = v175;
            v164 = v176;
        elseif v162.kind.type == "translation" then
            local v177 = v162.kind.value:encode();
            local v178, v179 = v0.writeTag(v163, v164, 6, v0.wireTypes.lengthDelimited);
            v178, v179 = v0.writeBuffer(v178, v179, v177, buffer.len(v177));
            v163 = v178;
            v164 = v179;
        end;
    end;
    local v180 = buffer.create(v164);
    buffer.copy(v180, 0, v163, 0, v164);
    return v180;
end;
v5.decode = function(v181) --[[ Line: 3975 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_6 (copy), v0 (copy), v2 (copy)
    local v182 = l_v5_6.new();
    local v183 = 0;
    while v183 < buffer.len(v181) do
        local v184 = nil;
        local v185 = nil;
        local v186, v187, v188 = v0.readTag(v181, v183);
        v184 = v186;
        v185 = v187;
        v183 = v188;
        if v185 == v0.wireTypes.varint then
            v186 = nil;
            v187, v188 = v0.readVarInt(v181, v183);
            v186 = v187;
            v183 = v188;
        elseif v185 == v0.wireTypes.lengthDelimited then
            if v184 == 1 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "literal", 
                    value = buffer.tostring(v186)
                };
            elseif v184 == 2 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v186)
                };
            elseif v184 == 3 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "token", 
                    value = buffer.tostring(v186)
                };
            elseif v184 == 4 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v186)
                };
            elseif v184 == 5 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "conditional", 
                    value = v2.StringProp_ConditionalOptions.decode(v186)
                };
            elseif v184 == 6 then
                v186 = nil;
                v187, v188 = v0.readBuffer(v181, v183);
                v186 = v187;
                v183 = v188;
                v182.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v186)
                };
            else
                v186 = nil;
                v187, v188 = v0.readVarInt(v181, v183);
                v183 = v188 + v187;
            end;
        elseif v185 == v0.wireTypes.i32 then
            v186 = nil;
            v187, v188 = v0.readFixed32(v181, v183);
            v186 = v187;
            v183 = v188;
        elseif v185 == v0.wireTypes.i64 then
            v186 = nil;
            v187, v188 = v0.readFixed64(v181, v183);
            v186 = v187;
            v183 = v188;
        else
            error("Unsupported wire type: " .. v185);
        end;
    end;
    return v182;
end;
v5.jsonEncode = function(v189) --[[ Line: 4043 ]] --[[ Name: jsonEncode ]]
    local v190 = {};
    if v189.kind ~= nil then
        if v189.kind.type == "literal" then
            v190.literal = v189.kind.value;
            return v190;
        elseif v189.kind.type == "binding_path" then
            v190.bindingPath = v189.kind.value;
            return v190;
        elseif v189.kind.type == "token" then
            v190.token = v189.kind.value;
            return v190;
        elseif v189.kind.type == "format" then
            v190.format = v189.kind.value:jsonEncode();
            return v190;
        elseif v189.kind.type == "conditional" then
            v190.conditional = v189.kind.value:jsonEncode();
            return v190;
        elseif v189.kind.type == "translation" then
            v190.translation = v189.kind.value:jsonEncode();
        end;
    end;
    return v190;
end;
v5.jsonDecode = function(v191) --[[ Line: 4065 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_6 (copy), v2 (copy)
    local v192 = l_v5_6.new();
    if v191.literal ~= nil then
        v192.kind = {
            type = "literal", 
            value = v191.literal
        };
    end;
    if v191.binding_path ~= nil then
        v192.kind = {
            type = "binding_path", 
            value = v191.binding_path
        };
    end;
    if v191.bindingPath ~= nil then
        v192.kind = {
            type = "binding_path", 
            value = v191.bindingPath
        };
    end;
    if v191.token ~= nil then
        v192.kind = {
            type = "token", 
            value = v191.token
        };
    end;
    if v191.format ~= nil then
        v192.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v191.format)
        };
    end;
    if v191.conditional ~= nil then
        v192.kind = {
            type = "conditional", 
            value = v2.StringProp_ConditionalOptions.jsonDecode(v191.conditional)
        };
    end;
    if v191.translation ~= nil then
        v192.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v191.translation)
        };
    end;
    return v192;
end;
v5.descriptor = {
    name = "StringProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
};
v2.StringProp = v5;
v1.default:register(v2.StringProp);
v5 = {};
v5.__index = v5;
local l_v5_7 = v5 --[[ copy: 5 -> 13 ]];
v5.new = function(v194) --[[ Line: 4114 ]] --[[ Name: new ]]
    -- upvalues: l_v5_7 (copy)
    return (setmetatable({
        condition = if not (v194 ~= nil) or v194.condition == nil then nil else v194.condition, 
        kind = if not (v194 ~= nil) or v194.kind == nil then nil else v194.kind
    }, l_v5_7));
end;
v5.encode = function(v195) --[[ Line: 4123 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v196 = buffer.create(0);
    local v197 = 0;
    if v195.condition ~= nil then
        local v198 = v195.condition:encode();
        local v199, v200 = v0.writeTag(v196, v197, 1, v0.wireTypes.lengthDelimited);
        v199, v200 = v0.writeBuffer(v199, v200, v198, buffer.len(v198));
        v196 = v199;
        v197 = v200;
    end;
    if v195.kind ~= nil then
        if v195.kind.type == "literal" then
            local v201, v202 = v0.writeTag(v196, v197, 2, v0.wireTypes.lengthDelimited);
            v201, v202 = v0.writeString(v201, v202, v195.kind.value);
            v196 = v201;
            v197 = v202;
        elseif v195.kind.type == "binding_path" then
            local v203, v204 = v0.writeTag(v196, v197, 3, v0.wireTypes.lengthDelimited);
            v203, v204 = v0.writeString(v203, v204, v195.kind.value);
            v196 = v203;
            v197 = v204;
        elseif v195.kind.type == "token" then
            local v205, v206 = v0.writeTag(v196, v197, 4, v0.wireTypes.lengthDelimited);
            v205, v206 = v0.writeString(v205, v206, v195.kind.value);
            v196 = v205;
            v197 = v206;
        elseif v195.kind.type == "format" then
            local v207 = v195.kind.value:encode();
            local v208, v209 = v0.writeTag(v196, v197, 5, v0.wireTypes.lengthDelimited);
            v208, v209 = v0.writeBuffer(v208, v209, v207, buffer.len(v207));
            v196 = v208;
            v197 = v209;
        elseif v195.kind.type == "translation" then
            local v210 = v195.kind.value:encode();
            local v211, v212 = v0.writeTag(v196, v197, 6, v0.wireTypes.lengthDelimited);
            v211, v212 = v0.writeBuffer(v211, v212, v210, buffer.len(v210));
            v196 = v211;
            v197 = v212;
        end;
    end;
    local v213 = buffer.create(v197);
    buffer.copy(v213, 0, v196, 0, v197);
    return v213;
end;
v5.decode = function(v214) --[[ Line: 4159 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_7 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v215 = l_v5_7.new();
    local v216 = 0;
    while v216 < buffer.len(v214) do
        local v217 = nil;
        local v218 = nil;
        local v219, v220, v221 = v0.readTag(v214, v216);
        v217 = v219;
        v218 = v220;
        v216 = v221;
        if v218 == v0.wireTypes.varint then
            v219 = nil;
            v220, v221 = v0.readVarInt(v214, v216);
            v219 = v220;
            v216 = v221;
        elseif v218 == v0.wireTypes.lengthDelimited then
            if v217 == 1 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.condition = v4.PropCondition.decode(v219);
            elseif v217 == 2 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.kind = {
                    type = "literal", 
                    value = buffer.tostring(v219)
                };
            elseif v217 == 3 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v219)
                };
            elseif v217 == 4 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.kind = {
                    type = "token", 
                    value = buffer.tostring(v219)
                };
            elseif v217 == 5 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v219)
                };
            elseif v217 == 6 then
                v219 = nil;
                v220, v221 = v0.readBuffer(v214, v216);
                v219 = v220;
                v216 = v221;
                v215.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v219)
                };
            else
                v219 = nil;
                v220, v221 = v0.readVarInt(v214, v216);
                v216 = v221 + v220;
            end;
        elseif v218 == v0.wireTypes.i32 then
            v219 = nil;
            v220, v221 = v0.readFixed32(v214, v216);
            v219 = v220;
            v216 = v221;
        elseif v218 == v0.wireTypes.i64 then
            v219 = nil;
            v220, v221 = v0.readFixed64(v214, v216);
            v219 = v220;
            v216 = v221;
        else
            error("Unsupported wire type: " .. v218);
        end;
    end;
    return v215;
end;
v5.jsonEncode = function(v222) --[[ Line: 4227 ]] --[[ Name: jsonEncode ]]
    local v223 = {};
    if v222.condition ~= nil then
        v223.condition = v222.condition:jsonEncode();
    end;
    if v222.kind ~= nil then
        if v222.kind.type == "literal" then
            v223.literal = v222.kind.value;
            return v223;
        elseif v222.kind.type == "binding_path" then
            v223.bindingPath = v222.kind.value;
            return v223;
        elseif v222.kind.type == "token" then
            v223.token = v222.kind.value;
            return v223;
        elseif v222.kind.type == "format" then
            v223.format = v222.kind.value:jsonEncode();
            return v223;
        elseif v222.kind.type == "translation" then
            v223.translation = v222.kind.value:jsonEncode();
        end;
    end;
    return v223;
end;
v5.jsonDecode = function(v224) --[[ Line: 4251 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_7 (copy), v4 (copy), v2 (copy)
    local v225 = l_v5_7.new();
    if v224.condition ~= nil then
        v225.condition = v4.PropCondition.jsonDecode(v224.condition);
    end;
    if v224.literal ~= nil then
        v225.kind = {
            type = "literal", 
            value = v224.literal
        };
    end;
    if v224.binding_path ~= nil then
        v225.kind = {
            type = "binding_path", 
            value = v224.binding_path
        };
    end;
    if v224.bindingPath ~= nil then
        v225.kind = {
            type = "binding_path", 
            value = v224.bindingPath
        };
    end;
    if v224.token ~= nil then
        v225.kind = {
            type = "token", 
            value = v224.token
        };
    end;
    if v224.format ~= nil then
        v225.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v224.format)
        };
    end;
    if v224.translation ~= nil then
        v225.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v224.translation)
        };
    end;
    return v225;
end;
v5.descriptor = {
    name = "StringProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.StringProp_ConditionalOption = v5;
v1.default:register(v2.StringProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_8 = v5 --[[ copy: 5 -> 14 ]];
v5.new = function(v227) --[[ Line: 4300 ]] --[[ Name: new ]]
    -- upvalues: l_v5_8 (copy)
    return (setmetatable({
        options = if not (v227 ~= nil) or v227.options == nil then {} else v227.options
    }, l_v5_8));
end;
v5.encode = function(v228) --[[ Line: 4308 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v229 = buffer.create(0);
    local v230 = 0;
    if v228.options ~= nil and #v228.options > 0 then
        for _, v232 in v228.options do
            local v233 = v232:encode();
            local v234, v235 = v0.writeTag(v229, v230, 1, v0.wireTypes.lengthDelimited);
            v234, v235 = v0.writeBuffer(v234, v235, v233, buffer.len(v233));
            v229 = v234;
            v230 = v235;
        end;
    end;
    local v236 = buffer.create(v230);
    buffer.copy(v236, 0, v229, 0, v230);
    return v236;
end;
v5.decode = function(v237) --[[ Line: 4325 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_8 (copy), v0 (copy), v2 (copy)
    local v238 = l_v5_8.new();
    local v239 = 0;
    while v239 < buffer.len(v237) do
        local v240 = nil;
        local v241 = nil;
        local v242, v243, v244 = v0.readTag(v237, v239);
        v240 = v242;
        v241 = v243;
        v239 = v244;
        if v241 == v0.wireTypes.varint then
            v242 = nil;
            v243, v244 = v0.readVarInt(v237, v239);
            v242 = v243;
            v239 = v244;
        elseif v241 == v0.wireTypes.lengthDelimited then
            if v240 == 1 then
                v242 = nil;
                v243, v244 = v0.readBuffer(v237, v239);
                v242 = v243;
                v239 = v244;
                table.insert(v238.options, v2.StringProp_ConditionalOption.decode(v242));
            else
                v242 = nil;
                v243, v244 = v0.readVarInt(v237, v239);
                v239 = v244 + v243;
            end;
        elseif v241 == v0.wireTypes.i32 then
            v242 = nil;
            v243, v244 = v0.readFixed32(v237, v239);
            v242 = v243;
            v239 = v244;
        elseif v241 == v0.wireTypes.i64 then
            v242 = nil;
            v243, v244 = v0.readFixed64(v237, v239);
            v242 = v243;
            v239 = v244;
        else
            error("Unsupported wire type: " .. v241);
        end;
    end;
    return v238;
end;
v5.jsonEncode = function(v245) --[[ Line: 4368 ]] --[[ Name: jsonEncode ]]
    local v246 = {};
    if v245.options ~= nil and #v245.options > 0 then
        local v247 = {};
        for _, v249 in v245.options do
            table.insert(v247, v249:jsonEncode());
        end;
        v246.options = v247;
    end;
    return v246;
end;
v5.jsonDecode = function(v250) --[[ Line: 4382 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_8 (copy), v2 (copy)
    local v251 = l_v5_8.new();
    if v250.options ~= nil then
        local v252 = {};
        for _, v254 in v250.options do
            table.insert(v252, v2.StringProp_ConditionalOption.jsonDecode(v254));
        end;
        v251.options = v252;
    end;
    return v251;
end;
v5.descriptor = {
    name = "StringProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.StringProp_ConditionalOptions = v5;
v1.default:register(v2.StringProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_9 = v5 --[[ copy: 5 -> 15 ]];
v5.new = function(v256) --[[ Line: 4411 ]] --[[ Name: new ]]
    -- upvalues: l_v5_9 (copy)
    return (setmetatable({
        kind = if not (v256 ~= nil) or v256.kind == nil then nil else v256.kind
    }, l_v5_9));
end;
v5.encode = function(v257) --[[ Line: 4417 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v258 = buffer.create(0);
    local v259 = 0;
    if v257.kind ~= nil then
        if v257.kind.type == "literal" then
            local v260, v261 = v0.writeTag(v258, v259, 1, v0.wireTypes.i32);
            v260, v261 = v0.writeFloat(v260, v261, v257.kind.value);
            v258 = v260;
            v259 = v261;
        elseif v257.kind.type == "binding_path" then
            local v262, v263 = v0.writeTag(v258, v259, 2, v0.wireTypes.lengthDelimited);
            v262, v263 = v0.writeString(v262, v263, v257.kind.value);
            v258 = v262;
            v259 = v263;
        elseif v257.kind.type == "token" then
            local v264, v265 = v0.writeTag(v258, v259, 3, v0.wireTypes.lengthDelimited);
            v264, v265 = v0.writeString(v264, v265, v257.kind.value);
            v258 = v264;
            v259 = v265;
        elseif v257.kind.type == "conditional" then
            local v266 = v257.kind.value:encode();
            local v267, v268 = v0.writeTag(v258, v259, 4, v0.wireTypes.lengthDelimited);
            v267, v268 = v0.writeBuffer(v267, v268, v266, buffer.len(v266));
            v258 = v267;
            v259 = v268;
        end;
    end;
    local v269 = buffer.create(v259);
    buffer.copy(v269, 0, v258, 0, v259);
    return v269;
end;
v5.decode = function(v270) --[[ Line: 4443 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_9 (copy), v0 (copy), v2 (copy)
    local v271 = l_v5_9.new();
    local v272 = 0;
    while v272 < buffer.len(v270) do
        local v273 = nil;
        local v274 = nil;
        local v275, v276, v277 = v0.readTag(v270, v272);
        v273 = v275;
        v274 = v276;
        v272 = v277;
        if v274 == v0.wireTypes.varint then
            v275 = nil;
            v276, v277 = v0.readVarInt(v270, v272);
            v275 = v276;
            v272 = v277;
        elseif v274 == v0.wireTypes.lengthDelimited then
            if v273 == 2 then
                v275 = nil;
                v276, v277 = v0.readBuffer(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v275)
                };
            elseif v273 == 3 then
                v275 = nil;
                v276, v277 = v0.readBuffer(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.kind = {
                    type = "token", 
                    value = buffer.tostring(v275)
                };
            elseif v273 == 4 then
                v275 = nil;
                v276, v277 = v0.readBuffer(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.kind = {
                    type = "conditional", 
                    value = v2.FloatProp_ConditionalOptions.decode(v275)
                };
            else
                v275 = nil;
                v276, v277 = v0.readVarInt(v270, v272);
                v272 = v277 + v276;
            end;
        elseif v274 == v0.wireTypes.i32 then
            if v273 == 1 then
                v275 = nil;
                v276, v277 = v0.readFloat(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.kind = {
                    type = "literal", 
                    value = v275
                };
            else
                v275 = nil;
                v276, v277 = v0.readFixed32(v270, v272);
                v275 = v276;
                v272 = v277;
            end;
        elseif v274 == v0.wireTypes.i64 then
            v275 = nil;
            v276, v277 = v0.readFixed64(v270, v272);
            v275 = v276;
            v272 = v277;
        else
            error("Unsupported wire type: " .. v274);
        end;
    end;
    return v271;
end;
v5.jsonEncode = function(v278) --[[ Line: 4501 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v279 = {};
    if v278.kind ~= nil then
        if v278.kind.type == "literal" then
            v279.literal = v0.json.serializeNumber(v278.kind.value);
            return v279;
        elseif v278.kind.type == "binding_path" then
            v279.bindingPath = v278.kind.value;
            return v279;
        elseif v278.kind.type == "token" then
            v279.token = v278.kind.value;
            return v279;
        elseif v278.kind.type == "conditional" then
            v279.conditional = v278.kind.value:jsonEncode();
        end;
    end;
    return v279;
end;
v5.jsonDecode = function(v280) --[[ Line: 4519 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_9 (copy), v0 (copy), v2 (copy)
    local v281 = l_v5_9.new();
    if v280.literal ~= nil then
        v281.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v280.literal)
        };
    end;
    if v280.binding_path ~= nil then
        v281.kind = {
            type = "binding_path", 
            value = v280.binding_path
        };
    end;
    if v280.bindingPath ~= nil then
        v281.kind = {
            type = "binding_path", 
            value = v280.bindingPath
        };
    end;
    if v280.token ~= nil then
        v281.kind = {
            type = "token", 
            value = v280.token
        };
    end;
    if v280.conditional ~= nil then
        v281.kind = {
            type = "conditional", 
            value = v2.FloatProp_ConditionalOptions.jsonDecode(v280.conditional)
        };
    end;
    return v281;
end;
v5.descriptor = {
    name = "FloatProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
};
v2.FloatProp = v5;
v1.default:register(v2.FloatProp);
v5 = {};
v5.__index = v5;
local l_v5_10 = v5 --[[ copy: 5 -> 16 ]];
v5.new = function(v283) --[[ Line: 4560 ]] --[[ Name: new ]]
    -- upvalues: l_v5_10 (copy)
    return (setmetatable({
        condition = if not (v283 ~= nil) or v283.condition == nil then nil else v283.condition, 
        kind = if not (v283 ~= nil) or v283.kind == nil then nil else v283.kind
    }, l_v5_10));
end;
v5.encode = function(v284) --[[ Line: 4569 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v285 = buffer.create(0);
    local v286 = 0;
    if v284.condition ~= nil then
        local v287 = v284.condition:encode();
        local v288, v289 = v0.writeTag(v285, v286, 1, v0.wireTypes.lengthDelimited);
        v288, v289 = v0.writeBuffer(v288, v289, v287, buffer.len(v287));
        v285 = v288;
        v286 = v289;
    end;
    if v284.kind ~= nil then
        if v284.kind.type == "literal" then
            local v290, v291 = v0.writeTag(v285, v286, 2, v0.wireTypes.i32);
            v290, v291 = v0.writeFloat(v290, v291, v284.kind.value);
            v285 = v290;
            v286 = v291;
        elseif v284.kind.type == "binding_path" then
            local v292, v293 = v0.writeTag(v285, v286, 3, v0.wireTypes.lengthDelimited);
            v292, v293 = v0.writeString(v292, v293, v284.kind.value);
            v285 = v292;
            v286 = v293;
        elseif v284.kind.type == "token" then
            local v294, v295 = v0.writeTag(v285, v286, 4, v0.wireTypes.lengthDelimited);
            v294, v295 = v0.writeString(v294, v295, v284.kind.value);
            v285 = v294;
            v286 = v295;
        end;
    end;
    local v296 = buffer.create(v286);
    buffer.copy(v296, 0, v285, 0, v286);
    return v296;
end;
v5.decode = function(v297) --[[ Line: 4597 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_10 (copy), v0 (copy), v4 (copy)
    local v298 = l_v5_10.new();
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
                v298.condition = v4.PropCondition.decode(v302);
            elseif v300 == 3 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v302)
                };
            elseif v300 == 4 then
                v302 = nil;
                v303, v304 = v0.readBuffer(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.kind = {
                    type = "token", 
                    value = buffer.tostring(v302)
                };
            else
                v302 = nil;
                v303, v304 = v0.readVarInt(v297, v299);
                v299 = v304 + v303;
            end;
        elseif v301 == v0.wireTypes.i32 then
            if v300 == 2 then
                v302 = nil;
                v303, v304 = v0.readFloat(v297, v299);
                v302 = v303;
                v299 = v304;
                v298.kind = {
                    type = "literal", 
                    value = v302
                };
            else
                v302 = nil;
                v303, v304 = v0.readFixed32(v297, v299);
                v302 = v303;
                v299 = v304;
            end;
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
v5.jsonEncode = function(v305) --[[ Line: 4655 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v306 = {};
    if v305.condition ~= nil then
        v306.condition = v305.condition:jsonEncode();
    end;
    if v305.kind ~= nil then
        if v305.kind.type == "literal" then
            v306.literal = v0.json.serializeNumber(v305.kind.value);
            return v306;
        elseif v305.kind.type == "binding_path" then
            v306.bindingPath = v305.kind.value;
            return v306;
        elseif v305.kind.type == "token" then
            v306.token = v305.kind.value;
        end;
    end;
    return v306;
end;
v5.jsonDecode = function(v307) --[[ Line: 4675 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_10 (copy), v4 (copy), v0 (copy)
    local v308 = l_v5_10.new();
    if v307.condition ~= nil then
        v308.condition = v4.PropCondition.jsonDecode(v307.condition);
    end;
    if v307.literal ~= nil then
        v308.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v307.literal)
        };
    end;
    if v307.binding_path ~= nil then
        v308.kind = {
            type = "binding_path", 
            value = v307.binding_path
        };
    end;
    if v307.bindingPath ~= nil then
        v308.kind = {
            type = "binding_path", 
            value = v307.bindingPath
        };
    end;
    if v307.token ~= nil then
        v308.kind = {
            type = "token", 
            value = v307.token
        };
    end;
    return v308;
end;
v5.descriptor = {
    name = "FloatProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FloatProp_ConditionalOption = v5;
v1.default:register(v2.FloatProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_11 = v5 --[[ copy: 5 -> 17 ]];
v5.new = function(v310) --[[ Line: 4716 ]] --[[ Name: new ]]
    -- upvalues: l_v5_11 (copy)
    return (setmetatable({
        options = if not (v310 ~= nil) or v310.options == nil then {} else v310.options
    }, l_v5_11));
end;
v5.encode = function(v311) --[[ Line: 4724 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v312 = buffer.create(0);
    local v313 = 0;
    if v311.options ~= nil and #v311.options > 0 then
        for _, v315 in v311.options do
            local v316 = v315:encode();
            local v317, v318 = v0.writeTag(v312, v313, 1, v0.wireTypes.lengthDelimited);
            v317, v318 = v0.writeBuffer(v317, v318, v316, buffer.len(v316));
            v312 = v317;
            v313 = v318;
        end;
    end;
    local v319 = buffer.create(v313);
    buffer.copy(v319, 0, v312, 0, v313);
    return v319;
end;
v5.decode = function(v320) --[[ Line: 4741 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_11 (copy), v0 (copy), v2 (copy)
    local v321 = l_v5_11.new();
    local v322 = 0;
    while v322 < buffer.len(v320) do
        local v323 = nil;
        local v324 = nil;
        local v325, v326, v327 = v0.readTag(v320, v322);
        v323 = v325;
        v324 = v326;
        v322 = v327;
        if v324 == v0.wireTypes.varint then
            v325 = nil;
            v326, v327 = v0.readVarInt(v320, v322);
            v325 = v326;
            v322 = v327;
        elseif v324 == v0.wireTypes.lengthDelimited then
            if v323 == 1 then
                v325 = nil;
                v326, v327 = v0.readBuffer(v320, v322);
                v325 = v326;
                v322 = v327;
                table.insert(v321.options, v2.FloatProp_ConditionalOption.decode(v325));
            else
                v325 = nil;
                v326, v327 = v0.readVarInt(v320, v322);
                v322 = v327 + v326;
            end;
        elseif v324 == v0.wireTypes.i32 then
            v325 = nil;
            v326, v327 = v0.readFixed32(v320, v322);
            v325 = v326;
            v322 = v327;
        elseif v324 == v0.wireTypes.i64 then
            v325 = nil;
            v326, v327 = v0.readFixed64(v320, v322);
            v325 = v326;
            v322 = v327;
        else
            error("Unsupported wire type: " .. v324);
        end;
    end;
    return v321;
end;
v5.jsonEncode = function(v328) --[[ Line: 4784 ]] --[[ Name: jsonEncode ]]
    local v329 = {};
    if v328.options ~= nil and #v328.options > 0 then
        local v330 = {};
        for _, v332 in v328.options do
            table.insert(v330, v332:jsonEncode());
        end;
        v329.options = v330;
    end;
    return v329;
end;
v5.jsonDecode = function(v333) --[[ Line: 4798 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_11 (copy), v2 (copy)
    local v334 = l_v5_11.new();
    if v333.options ~= nil then
        local v335 = {};
        for _, v337 in v333.options do
            table.insert(v335, v2.FloatProp_ConditionalOption.jsonDecode(v337));
        end;
        v334.options = v335;
    end;
    return v334;
end;
v5.descriptor = {
    name = "FloatProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FloatProp_ConditionalOptions = v5;
v1.default:register(v2.FloatProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_12 = v5 --[[ copy: 5 -> 18 ]];
v5.new = function(v339) --[[ Line: 4827 ]] --[[ Name: new ]]
    -- upvalues: l_v5_12 (copy)
    return (setmetatable({
        kind = if not (v339 ~= nil) or v339.kind == nil then nil else v339.kind
    }, l_v5_12));
end;
v5.encode = function(v340) --[[ Line: 4833 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v341 = buffer.create(0);
    local v342 = 0;
    if v340.kind ~= nil then
        if v340.kind.type == "literal" then
            local v343, v344 = v0.writeTag(v341, v342, 1, v0.wireTypes.i64);
            v343, v344 = v0.writeDouble(v343, v344, v340.kind.value);
            v341 = v343;
            v342 = v344;
        elseif v340.kind.type == "binding_path" then
            local v345, v346 = v0.writeTag(v341, v342, 2, v0.wireTypes.lengthDelimited);
            v345, v346 = v0.writeString(v345, v346, v340.kind.value);
            v341 = v345;
            v342 = v346;
        elseif v340.kind.type == "token" then
            local v347, v348 = v0.writeTag(v341, v342, 3, v0.wireTypes.lengthDelimited);
            v347, v348 = v0.writeString(v347, v348, v340.kind.value);
            v341 = v347;
            v342 = v348;
        elseif v340.kind.type == "conditional" then
            local v349 = v340.kind.value:encode();
            local v350, v351 = v0.writeTag(v341, v342, 4, v0.wireTypes.lengthDelimited);
            v350, v351 = v0.writeBuffer(v350, v351, v349, buffer.len(v349));
            v341 = v350;
            v342 = v351;
        end;
    end;
    local v352 = buffer.create(v342);
    buffer.copy(v352, 0, v341, 0, v342);
    return v352;
end;
v5.decode = function(v353) --[[ Line: 4859 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_12 (copy), v0 (copy), v2 (copy)
    local v354 = l_v5_12.new();
    local v355 = 0;
    while v355 < buffer.len(v353) do
        local v356 = nil;
        local v357 = nil;
        local v358, v359, v360 = v0.readTag(v353, v355);
        v356 = v358;
        v357 = v359;
        v355 = v360;
        if v357 == v0.wireTypes.varint then
            v358 = nil;
            v359, v360 = v0.readVarInt(v353, v355);
            v358 = v359;
            v355 = v360;
        elseif v357 == v0.wireTypes.lengthDelimited then
            if v356 == 2 then
                v358 = nil;
                v359, v360 = v0.readBuffer(v353, v355);
                v358 = v359;
                v355 = v360;
                v354.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v358)
                };
            elseif v356 == 3 then
                v358 = nil;
                v359, v360 = v0.readBuffer(v353, v355);
                v358 = v359;
                v355 = v360;
                v354.kind = {
                    type = "token", 
                    value = buffer.tostring(v358)
                };
            elseif v356 == 4 then
                v358 = nil;
                v359, v360 = v0.readBuffer(v353, v355);
                v358 = v359;
                v355 = v360;
                v354.kind = {
                    type = "conditional", 
                    value = v2.DoubleProp_ConditionalOptions.decode(v358)
                };
            else
                v358 = nil;
                v359, v360 = v0.readVarInt(v353, v355);
                v355 = v360 + v359;
            end;
        elseif v357 == v0.wireTypes.i32 then
            v358 = nil;
            v359, v360 = v0.readFixed32(v353, v355);
            v358 = v359;
            v355 = v360;
        elseif v357 == v0.wireTypes.i64 then
            if v356 == 1 then
                v358 = nil;
                v359, v360 = v0.readDouble(v353, v355);
                v358 = v359;
                v355 = v360;
                v354.kind = {
                    type = "literal", 
                    value = v358
                };
            else
                v358 = nil;
                v359, v360 = v0.readFixed64(v353, v355);
                v358 = v359;
                v355 = v360;
            end;
        else
            error("Unsupported wire type: " .. v357);
        end;
    end;
    return v354;
end;
v5.jsonEncode = function(v361) --[[ Line: 4917 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v362 = {};
    if v361.kind ~= nil then
        if v361.kind.type == "literal" then
            v362.literal = v0.json.serializeNumber(v361.kind.value);
            return v362;
        elseif v361.kind.type == "binding_path" then
            v362.bindingPath = v361.kind.value;
            return v362;
        elseif v361.kind.type == "token" then
            v362.token = v361.kind.value;
            return v362;
        elseif v361.kind.type == "conditional" then
            v362.conditional = v361.kind.value:jsonEncode();
        end;
    end;
    return v362;
end;
v5.jsonDecode = function(v363) --[[ Line: 4935 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_12 (copy), v0 (copy), v2 (copy)
    local v364 = l_v5_12.new();
    if v363.literal ~= nil then
        v364.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v363.literal)
        };
    end;
    if v363.binding_path ~= nil then
        v364.kind = {
            type = "binding_path", 
            value = v363.binding_path
        };
    end;
    if v363.bindingPath ~= nil then
        v364.kind = {
            type = "binding_path", 
            value = v363.bindingPath
        };
    end;
    if v363.token ~= nil then
        v364.kind = {
            type = "token", 
            value = v363.token
        };
    end;
    if v363.conditional ~= nil then
        v364.kind = {
            type = "conditional", 
            value = v2.DoubleProp_ConditionalOptions.jsonDecode(v363.conditional)
        };
    end;
    return v364;
end;
v5.descriptor = {
    name = "DoubleProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
};
v2.DoubleProp = v5;
v1.default:register(v2.DoubleProp);
v5 = {};
v5.__index = v5;
local l_v5_13 = v5 --[[ copy: 5 -> 19 ]];
v5.new = function(v366) --[[ Line: 4976 ]] --[[ Name: new ]]
    -- upvalues: l_v5_13 (copy)
    return (setmetatable({
        condition = if not (v366 ~= nil) or v366.condition == nil then nil else v366.condition, 
        kind = if not (v366 ~= nil) or v366.kind == nil then nil else v366.kind
    }, l_v5_13));
end;
v5.encode = function(v367) --[[ Line: 4985 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v368 = buffer.create(0);
    local v369 = 0;
    if v367.condition ~= nil then
        local v370 = v367.condition:encode();
        local v371, v372 = v0.writeTag(v368, v369, 1, v0.wireTypes.lengthDelimited);
        v371, v372 = v0.writeBuffer(v371, v372, v370, buffer.len(v370));
        v368 = v371;
        v369 = v372;
    end;
    if v367.kind ~= nil then
        if v367.kind.type == "literal" then
            local v373, v374 = v0.writeTag(v368, v369, 2, v0.wireTypes.i64);
            v373, v374 = v0.writeDouble(v373, v374, v367.kind.value);
            v368 = v373;
            v369 = v374;
        elseif v367.kind.type == "binding_path" then
            local v375, v376 = v0.writeTag(v368, v369, 3, v0.wireTypes.lengthDelimited);
            v375, v376 = v0.writeString(v375, v376, v367.kind.value);
            v368 = v375;
            v369 = v376;
        elseif v367.kind.type == "token" then
            local v377, v378 = v0.writeTag(v368, v369, 4, v0.wireTypes.lengthDelimited);
            v377, v378 = v0.writeString(v377, v378, v367.kind.value);
            v368 = v377;
            v369 = v378;
        end;
    end;
    local v379 = buffer.create(v369);
    buffer.copy(v379, 0, v368, 0, v369);
    return v379;
end;
v5.decode = function(v380) --[[ Line: 5013 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_13 (copy), v0 (copy), v4 (copy)
    local v381 = l_v5_13.new();
    local v382 = 0;
    while v382 < buffer.len(v380) do
        local v383 = nil;
        local v384 = nil;
        local v385, v386, v387 = v0.readTag(v380, v382);
        v383 = v385;
        v384 = v386;
        v382 = v387;
        if v384 == v0.wireTypes.varint then
            v385 = nil;
            v386, v387 = v0.readVarInt(v380, v382);
            v385 = v386;
            v382 = v387;
        elseif v384 == v0.wireTypes.lengthDelimited then
            if v383 == 1 then
                v385 = nil;
                v386, v387 = v0.readBuffer(v380, v382);
                v385 = v386;
                v382 = v387;
                v381.condition = v4.PropCondition.decode(v385);
            elseif v383 == 3 then
                v385 = nil;
                v386, v387 = v0.readBuffer(v380, v382);
                v385 = v386;
                v382 = v387;
                v381.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v385)
                };
            elseif v383 == 4 then
                v385 = nil;
                v386, v387 = v0.readBuffer(v380, v382);
                v385 = v386;
                v382 = v387;
                v381.kind = {
                    type = "token", 
                    value = buffer.tostring(v385)
                };
            else
                v385 = nil;
                v386, v387 = v0.readVarInt(v380, v382);
                v382 = v387 + v386;
            end;
        elseif v384 == v0.wireTypes.i32 then
            v385 = nil;
            v386, v387 = v0.readFixed32(v380, v382);
            v385 = v386;
            v382 = v387;
        elseif v384 == v0.wireTypes.i64 then
            if v383 == 2 then
                v385 = nil;
                v386, v387 = v0.readDouble(v380, v382);
                v385 = v386;
                v382 = v387;
                v381.kind = {
                    type = "literal", 
                    value = v385
                };
            else
                v385 = nil;
                v386, v387 = v0.readFixed64(v380, v382);
                v385 = v386;
                v382 = v387;
            end;
        else
            error("Unsupported wire type: " .. v384);
        end;
    end;
    return v381;
end;
v5.jsonEncode = function(v388) --[[ Line: 5071 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v389 = {};
    if v388.condition ~= nil then
        v389.condition = v388.condition:jsonEncode();
    end;
    if v388.kind ~= nil then
        if v388.kind.type == "literal" then
            v389.literal = v0.json.serializeNumber(v388.kind.value);
            return v389;
        elseif v388.kind.type == "binding_path" then
            v389.bindingPath = v388.kind.value;
            return v389;
        elseif v388.kind.type == "token" then
            v389.token = v388.kind.value;
        end;
    end;
    return v389;
end;
v5.jsonDecode = function(v390) --[[ Line: 5091 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_13 (copy), v4 (copy), v0 (copy)
    local v391 = l_v5_13.new();
    if v390.condition ~= nil then
        v391.condition = v4.PropCondition.jsonDecode(v390.condition);
    end;
    if v390.literal ~= nil then
        v391.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v390.literal)
        };
    end;
    if v390.binding_path ~= nil then
        v391.kind = {
            type = "binding_path", 
            value = v390.binding_path
        };
    end;
    if v390.bindingPath ~= nil then
        v391.kind = {
            type = "binding_path", 
            value = v390.bindingPath
        };
    end;
    if v390.token ~= nil then
        v391.kind = {
            type = "token", 
            value = v390.token
        };
    end;
    return v391;
end;
v5.descriptor = {
    name = "DoubleProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.DoubleProp_ConditionalOption = v5;
v1.default:register(v2.DoubleProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_14 = v5 --[[ copy: 5 -> 20 ]];
v5.new = function(v393) --[[ Line: 5132 ]] --[[ Name: new ]]
    -- upvalues: l_v5_14 (copy)
    return (setmetatable({
        options = if not (v393 ~= nil) or v393.options == nil then {} else v393.options
    }, l_v5_14));
end;
v5.encode = function(v394) --[[ Line: 5140 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v395 = buffer.create(0);
    local v396 = 0;
    if v394.options ~= nil and #v394.options > 0 then
        for _, v398 in v394.options do
            local v399 = v398:encode();
            local v400, v401 = v0.writeTag(v395, v396, 1, v0.wireTypes.lengthDelimited);
            v400, v401 = v0.writeBuffer(v400, v401, v399, buffer.len(v399));
            v395 = v400;
            v396 = v401;
        end;
    end;
    local v402 = buffer.create(v396);
    buffer.copy(v402, 0, v395, 0, v396);
    return v402;
end;
v5.decode = function(v403) --[[ Line: 5157 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_14 (copy), v0 (copy), v2 (copy)
    local v404 = l_v5_14.new();
    local v405 = 0;
    while v405 < buffer.len(v403) do
        local v406 = nil;
        local v407 = nil;
        local v408, v409, v410 = v0.readTag(v403, v405);
        v406 = v408;
        v407 = v409;
        v405 = v410;
        if v407 == v0.wireTypes.varint then
            v408 = nil;
            v409, v410 = v0.readVarInt(v403, v405);
            v408 = v409;
            v405 = v410;
        elseif v407 == v0.wireTypes.lengthDelimited then
            if v406 == 1 then
                v408 = nil;
                v409, v410 = v0.readBuffer(v403, v405);
                v408 = v409;
                v405 = v410;
                table.insert(v404.options, v2.DoubleProp_ConditionalOption.decode(v408));
            else
                v408 = nil;
                v409, v410 = v0.readVarInt(v403, v405);
                v405 = v410 + v409;
            end;
        elseif v407 == v0.wireTypes.i32 then
            v408 = nil;
            v409, v410 = v0.readFixed32(v403, v405);
            v408 = v409;
            v405 = v410;
        elseif v407 == v0.wireTypes.i64 then
            v408 = nil;
            v409, v410 = v0.readFixed64(v403, v405);
            v408 = v409;
            v405 = v410;
        else
            error("Unsupported wire type: " .. v407);
        end;
    end;
    return v404;
end;
v5.jsonEncode = function(v411) --[[ Line: 5200 ]] --[[ Name: jsonEncode ]]
    local v412 = {};
    if v411.options ~= nil and #v411.options > 0 then
        local v413 = {};
        for _, v415 in v411.options do
            table.insert(v413, v415:jsonEncode());
        end;
        v412.options = v413;
    end;
    return v412;
end;
v5.jsonDecode = function(v416) --[[ Line: 5214 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_14 (copy), v2 (copy)
    local v417 = l_v5_14.new();
    if v416.options ~= nil then
        local v418 = {};
        for _, v420 in v416.options do
            table.insert(v418, v2.DoubleProp_ConditionalOption.jsonDecode(v420));
        end;
        v417.options = v418;
    end;
    return v417;
end;
v5.descriptor = {
    name = "DoubleProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.DoubleProp_ConditionalOptions = v5;
v1.default:register(v2.DoubleProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_15 = v5 --[[ copy: 5 -> 21 ]];
v5.new = function(v422) --[[ Line: 5243 ]] --[[ Name: new ]]
    -- upvalues: l_v5_15 (copy)
    return (setmetatable({
        kind = if not (v422 ~= nil) or v422.kind == nil then nil else v422.kind
    }, l_v5_15));
end;
v5.encode = function(v423) --[[ Line: 5249 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v424 = buffer.create(0);
    local v425 = 0;
    if v423.kind ~= nil then
        if v423.kind.type == "literal" then
            local v426, v427 = v0.writeTag(v424, v425, 1, v0.wireTypes.varint);
            v426, v427 = v0.writeVarInt(v426, v427, v423.kind.value);
            v424 = v426;
            v425 = v427;
        elseif v423.kind.type == "binding_path" then
            local v428, v429 = v0.writeTag(v424, v425, 2, v0.wireTypes.lengthDelimited);
            v428, v429 = v0.writeString(v428, v429, v423.kind.value);
            v424 = v428;
            v425 = v429;
        elseif v423.kind.type == "token" then
            local v430, v431 = v0.writeTag(v424, v425, 3, v0.wireTypes.lengthDelimited);
            v430, v431 = v0.writeString(v430, v431, v423.kind.value);
            v424 = v430;
            v425 = v431;
        elseif v423.kind.type == "conditional" then
            local v432 = v423.kind.value:encode();
            local v433, v434 = v0.writeTag(v424, v425, 4, v0.wireTypes.lengthDelimited);
            v433, v434 = v0.writeBuffer(v433, v434, v432, buffer.len(v432));
            v424 = v433;
            v425 = v434;
        end;
    end;
    local v435 = buffer.create(v425);
    buffer.copy(v435, 0, v424, 0, v425);
    return v435;
end;
v5.decode = function(v436) --[[ Line: 5275 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_15 (copy), v0 (copy), v2 (copy)
    local v437 = l_v5_15.new();
    local v438 = 0;
    while v438 < buffer.len(v436) do
        local v439 = nil;
        local v440 = nil;
        local v441, v442, v443 = v0.readTag(v436, v438);
        v439 = v441;
        v440 = v442;
        v438 = v443;
        if v440 == v0.wireTypes.varint then
            if v439 == 1 then
                v441 = nil;
                v442, v443 = v0.readVarIntI32(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.kind = {
                    type = "literal", 
                    value = v441
                };
            else
                v441 = nil;
                v442, v443 = v0.readVarInt(v436, v438);
                v441 = v442;
                v438 = v443;
            end;
        elseif v440 == v0.wireTypes.lengthDelimited then
            if v439 == 2 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v441)
                };
            elseif v439 == 3 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.kind = {
                    type = "token", 
                    value = buffer.tostring(v441)
                };
            elseif v439 == 4 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.kind = {
                    type = "conditional", 
                    value = v2.Int32Prop_ConditionalOptions.decode(v441)
                };
            else
                v441 = nil;
                v442, v443 = v0.readVarInt(v436, v438);
                v438 = v443 + v442;
            end;
        elseif v440 == v0.wireTypes.i32 then
            v441 = nil;
            v442, v443 = v0.readFixed32(v436, v438);
            v441 = v442;
            v438 = v443;
        elseif v440 == v0.wireTypes.i64 then
            v441 = nil;
            v442, v443 = v0.readFixed64(v436, v438);
            v441 = v442;
            v438 = v443;
        else
            error("Unsupported wire type: " .. v440);
        end;
    end;
    return v437;
end;
v5.jsonEncode = function(v444) --[[ Line: 5333 ]] --[[ Name: jsonEncode ]]
    local v445 = {};
    if v444.kind ~= nil then
        if v444.kind.type == "literal" then
            v445.literal = v444.kind.value;
            return v445;
        elseif v444.kind.type == "binding_path" then
            v445.bindingPath = v444.kind.value;
            return v445;
        elseif v444.kind.type == "token" then
            v445.token = v444.kind.value;
            return v445;
        elseif v444.kind.type == "conditional" then
            v445.conditional = v444.kind.value:jsonEncode();
        end;
    end;
    return v445;
end;
v5.jsonDecode = function(v446) --[[ Line: 5351 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_15 (copy), v2 (copy)
    local v447 = l_v5_15.new();
    if v446.literal ~= nil then
        v447.kind = {
            type = "literal", 
            value = v446.literal
        };
    end;
    if v446.binding_path ~= nil then
        v447.kind = {
            type = "binding_path", 
            value = v446.binding_path
        };
    end;
    if v446.bindingPath ~= nil then
        v447.kind = {
            type = "binding_path", 
            value = v446.bindingPath
        };
    end;
    if v446.token ~= nil then
        v447.kind = {
            type = "token", 
            value = v446.token
        };
    end;
    if v446.conditional ~= nil then
        v447.kind = {
            type = "conditional", 
            value = v2.Int32Prop_ConditionalOptions.jsonDecode(v446.conditional)
        };
    end;
    return v447;
end;
v5.descriptor = {
    name = "Int32Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
};
v2.Int32Prop = v5;
v1.default:register(v2.Int32Prop);
v5 = {};
v5.__index = v5;
local l_v5_16 = v5 --[[ copy: 5 -> 22 ]];
v5.new = function(v449) --[[ Line: 5392 ]] --[[ Name: new ]]
    -- upvalues: l_v5_16 (copy)
    return (setmetatable({
        condition = if not (v449 ~= nil) or v449.condition == nil then nil else v449.condition, 
        kind = if not (v449 ~= nil) or v449.kind == nil then nil else v449.kind
    }, l_v5_16));
end;
v5.encode = function(v450) --[[ Line: 5401 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v451 = buffer.create(0);
    local v452 = 0;
    if v450.condition ~= nil then
        local v453 = v450.condition:encode();
        local v454, v455 = v0.writeTag(v451, v452, 1, v0.wireTypes.lengthDelimited);
        v454, v455 = v0.writeBuffer(v454, v455, v453, buffer.len(v453));
        v451 = v454;
        v452 = v455;
    end;
    if v450.kind ~= nil then
        if v450.kind.type == "literal" then
            local v456, v457 = v0.writeTag(v451, v452, 2, v0.wireTypes.varint);
            v456, v457 = v0.writeVarInt(v456, v457, v450.kind.value);
            v451 = v456;
            v452 = v457;
        elseif v450.kind.type == "binding_path" then
            local v458, v459 = v0.writeTag(v451, v452, 3, v0.wireTypes.lengthDelimited);
            v458, v459 = v0.writeString(v458, v459, v450.kind.value);
            v451 = v458;
            v452 = v459;
        elseif v450.kind.type == "token" then
            local v460, v461 = v0.writeTag(v451, v452, 4, v0.wireTypes.lengthDelimited);
            v460, v461 = v0.writeString(v460, v461, v450.kind.value);
            v451 = v460;
            v452 = v461;
        end;
    end;
    local v462 = buffer.create(v452);
    buffer.copy(v462, 0, v451, 0, v452);
    return v462;
end;
v5.decode = function(v463) --[[ Line: 5429 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_16 (copy), v0 (copy), v4 (copy)
    local v464 = l_v5_16.new();
    local v465 = 0;
    while v465 < buffer.len(v463) do
        local v466 = nil;
        local v467 = nil;
        local v468, v469, v470 = v0.readTag(v463, v465);
        v466 = v468;
        v467 = v469;
        v465 = v470;
        if v467 == v0.wireTypes.varint then
            if v466 == 2 then
                v468 = nil;
                v469, v470 = v0.readVarIntI32(v463, v465);
                v468 = v469;
                v465 = v470;
                v464.kind = {
                    type = "literal", 
                    value = v468
                };
            else
                v468 = nil;
                v469, v470 = v0.readVarInt(v463, v465);
                v468 = v469;
                v465 = v470;
            end;
        elseif v467 == v0.wireTypes.lengthDelimited then
            if v466 == 1 then
                v468 = nil;
                v469, v470 = v0.readBuffer(v463, v465);
                v468 = v469;
                v465 = v470;
                v464.condition = v4.PropCondition.decode(v468);
            elseif v466 == 3 then
                v468 = nil;
                v469, v470 = v0.readBuffer(v463, v465);
                v468 = v469;
                v465 = v470;
                v464.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v468)
                };
            elseif v466 == 4 then
                v468 = nil;
                v469, v470 = v0.readBuffer(v463, v465);
                v468 = v469;
                v465 = v470;
                v464.kind = {
                    type = "token", 
                    value = buffer.tostring(v468)
                };
            else
                v468 = nil;
                v469, v470 = v0.readVarInt(v463, v465);
                v465 = v470 + v469;
            end;
        elseif v467 == v0.wireTypes.i32 then
            v468 = nil;
            v469, v470 = v0.readFixed32(v463, v465);
            v468 = v469;
            v465 = v470;
        elseif v467 == v0.wireTypes.i64 then
            v468 = nil;
            v469, v470 = v0.readFixed64(v463, v465);
            v468 = v469;
            v465 = v470;
        else
            error("Unsupported wire type: " .. v467);
        end;
    end;
    return v464;
end;
v5.jsonEncode = function(v471) --[[ Line: 5487 ]] --[[ Name: jsonEncode ]]
    local v472 = {};
    if v471.condition ~= nil then
        v472.condition = v471.condition:jsonEncode();
    end;
    if v471.kind ~= nil then
        if v471.kind.type == "literal" then
            v472.literal = v471.kind.value;
            return v472;
        elseif v471.kind.type == "binding_path" then
            v472.bindingPath = v471.kind.value;
            return v472;
        elseif v471.kind.type == "token" then
            v472.token = v471.kind.value;
        end;
    end;
    return v472;
end;
v5.jsonDecode = function(v473) --[[ Line: 5507 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_16 (copy), v4 (copy)
    local v474 = l_v5_16.new();
    if v473.condition ~= nil then
        v474.condition = v4.PropCondition.jsonDecode(v473.condition);
    end;
    if v473.literal ~= nil then
        v474.kind = {
            type = "literal", 
            value = v473.literal
        };
    end;
    if v473.binding_path ~= nil then
        v474.kind = {
            type = "binding_path", 
            value = v473.binding_path
        };
    end;
    if v473.bindingPath ~= nil then
        v474.kind = {
            type = "binding_path", 
            value = v473.bindingPath
        };
    end;
    if v473.token ~= nil then
        v474.kind = {
            type = "token", 
            value = v473.token
        };
    end;
    return v474;
end;
v5.descriptor = {
    name = "Int32Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Int32Prop_ConditionalOption = v5;
v1.default:register(v2.Int32Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_17 = v5 --[[ copy: 5 -> 23 ]];
v5.new = function(v476) --[[ Line: 5548 ]] --[[ Name: new ]]
    -- upvalues: l_v5_17 (copy)
    return (setmetatable({
        options = if not (v476 ~= nil) or v476.options == nil then {} else v476.options
    }, l_v5_17));
end;
v5.encode = function(v477) --[[ Line: 5556 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v478 = buffer.create(0);
    local v479 = 0;
    if v477.options ~= nil and #v477.options > 0 then
        for _, v481 in v477.options do
            local v482 = v481:encode();
            local v483, v484 = v0.writeTag(v478, v479, 1, v0.wireTypes.lengthDelimited);
            v483, v484 = v0.writeBuffer(v483, v484, v482, buffer.len(v482));
            v478 = v483;
            v479 = v484;
        end;
    end;
    local v485 = buffer.create(v479);
    buffer.copy(v485, 0, v478, 0, v479);
    return v485;
end;
v5.decode = function(v486) --[[ Line: 5573 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_17 (copy), v0 (copy), v2 (copy)
    local v487 = l_v5_17.new();
    local v488 = 0;
    while v488 < buffer.len(v486) do
        local v489 = nil;
        local v490 = nil;
        local v491, v492, v493 = v0.readTag(v486, v488);
        v489 = v491;
        v490 = v492;
        v488 = v493;
        if v490 == v0.wireTypes.varint then
            v491 = nil;
            v492, v493 = v0.readVarInt(v486, v488);
            v491 = v492;
            v488 = v493;
        elseif v490 == v0.wireTypes.lengthDelimited then
            if v489 == 1 then
                v491 = nil;
                v492, v493 = v0.readBuffer(v486, v488);
                v491 = v492;
                v488 = v493;
                table.insert(v487.options, v2.Int32Prop_ConditionalOption.decode(v491));
            else
                v491 = nil;
                v492, v493 = v0.readVarInt(v486, v488);
                v488 = v493 + v492;
            end;
        elseif v490 == v0.wireTypes.i32 then
            v491 = nil;
            v492, v493 = v0.readFixed32(v486, v488);
            v491 = v492;
            v488 = v493;
        elseif v490 == v0.wireTypes.i64 then
            v491 = nil;
            v492, v493 = v0.readFixed64(v486, v488);
            v491 = v492;
            v488 = v493;
        else
            error("Unsupported wire type: " .. v490);
        end;
    end;
    return v487;
end;
v5.jsonEncode = function(v494) --[[ Line: 5616 ]] --[[ Name: jsonEncode ]]
    local v495 = {};
    if v494.options ~= nil and #v494.options > 0 then
        local v496 = {};
        for _, v498 in v494.options do
            table.insert(v496, v498:jsonEncode());
        end;
        v495.options = v496;
    end;
    return v495;
end;
v5.jsonDecode = function(v499) --[[ Line: 5630 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_17 (copy), v2 (copy)
    local v500 = l_v5_17.new();
    if v499.options ~= nil then
        local v501 = {};
        for _, v503 in v499.options do
            table.insert(v501, v2.Int32Prop_ConditionalOption.jsonDecode(v503));
        end;
        v500.options = v501;
    end;
    return v500;
end;
v5.descriptor = {
    name = "Int32Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Int32Prop_ConditionalOptions = v5;
v1.default:register(v2.Int32Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_18 = v5 --[[ copy: 5 -> 24 ]];
v5.new = function(v505) --[[ Line: 5659 ]] --[[ Name: new ]]
    -- upvalues: l_v5_18 (copy)
    return (setmetatable({
        kind = if not (v505 ~= nil) or v505.kind == nil then nil else v505.kind
    }, l_v5_18));
end;
v5.encode = function(v506) --[[ Line: 5665 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v507 = buffer.create(0);
    local v508 = 0;
    if v506.kind ~= nil then
        if v506.kind.type == "literal" then
            local v509, v510 = v0.writeTag(v507, v508, 1, v0.wireTypes.varint);
            v509, v510 = v0.writeVarInt(v509, v510, v506.kind.value);
            v507 = v509;
            v508 = v510;
        elseif v506.kind.type == "binding_path" then
            local v511, v512 = v0.writeTag(v507, v508, 2, v0.wireTypes.lengthDelimited);
            v511, v512 = v0.writeString(v511, v512, v506.kind.value);
            v507 = v511;
            v508 = v512;
        elseif v506.kind.type == "token" then
            local v513, v514 = v0.writeTag(v507, v508, 3, v0.wireTypes.lengthDelimited);
            v513, v514 = v0.writeString(v513, v514, v506.kind.value);
            v507 = v513;
            v508 = v514;
        elseif v506.kind.type == "conditional" then
            local v515 = v506.kind.value:encode();
            local v516, v517 = v0.writeTag(v507, v508, 4, v0.wireTypes.lengthDelimited);
            v516, v517 = v0.writeBuffer(v516, v517, v515, buffer.len(v515));
            v507 = v516;
            v508 = v517;
        end;
    end;
    local v518 = buffer.create(v508);
    buffer.copy(v518, 0, v507, 0, v508);
    return v518;
end;
v5.decode = function(v519) --[[ Line: 5691 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_18 (copy), v0 (copy), v2 (copy)
    local v520 = l_v5_18.new();
    local v521 = 0;
    while v521 < buffer.len(v519) do
        local v522 = nil;
        local v523 = nil;
        local v524, v525, v526 = v0.readTag(v519, v521);
        v522 = v524;
        v523 = v525;
        v521 = v526;
        if v523 == v0.wireTypes.varint then
            if v522 == 1 then
                v524 = nil;
                v525, v526 = v0.readVarIntI64(v519, v521);
                v524 = v525;
                v521 = v526;
                v520.kind = {
                    type = "literal", 
                    value = v524
                };
            else
                v524 = nil;
                v525, v526 = v0.readVarInt(v519, v521);
                v524 = v525;
                v521 = v526;
            end;
        elseif v523 == v0.wireTypes.lengthDelimited then
            if v522 == 2 then
                v524 = nil;
                v525, v526 = v0.readBuffer(v519, v521);
                v524 = v525;
                v521 = v526;
                v520.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v524)
                };
            elseif v522 == 3 then
                v524 = nil;
                v525, v526 = v0.readBuffer(v519, v521);
                v524 = v525;
                v521 = v526;
                v520.kind = {
                    type = "token", 
                    value = buffer.tostring(v524)
                };
            elseif v522 == 4 then
                v524 = nil;
                v525, v526 = v0.readBuffer(v519, v521);
                v524 = v525;
                v521 = v526;
                v520.kind = {
                    type = "conditional", 
                    value = v2.Int64Prop_ConditionalOptions.decode(v524)
                };
            else
                v524 = nil;
                v525, v526 = v0.readVarInt(v519, v521);
                v521 = v526 + v525;
            end;
        elseif v523 == v0.wireTypes.i32 then
            v524 = nil;
            v525, v526 = v0.readFixed32(v519, v521);
            v524 = v525;
            v521 = v526;
        elseif v523 == v0.wireTypes.i64 then
            v524 = nil;
            v525, v526 = v0.readFixed64(v519, v521);
            v524 = v525;
            v521 = v526;
        else
            error("Unsupported wire type: " .. v523);
        end;
    end;
    return v520;
end;
v5.jsonEncode = function(v527) --[[ Line: 5749 ]] --[[ Name: jsonEncode ]]
    local v528 = {};
    if v527.kind ~= nil then
        if v527.kind.type == "literal" then
            v528.literal = v527.kind.value;
            return v528;
        elseif v527.kind.type == "binding_path" then
            v528.bindingPath = v527.kind.value;
            return v528;
        elseif v527.kind.type == "token" then
            v528.token = v527.kind.value;
            return v528;
        elseif v527.kind.type == "conditional" then
            v528.conditional = v527.kind.value:jsonEncode();
        end;
    end;
    return v528;
end;
v5.jsonDecode = function(v529) --[[ Line: 5767 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_18 (copy), v2 (copy)
    local v530 = l_v5_18.new();
    if v529.literal ~= nil then
        v530.kind = {
            type = "literal", 
            value = v529.literal
        };
    end;
    if v529.binding_path ~= nil then
        v530.kind = {
            type = "binding_path", 
            value = v529.binding_path
        };
    end;
    if v529.bindingPath ~= nil then
        v530.kind = {
            type = "binding_path", 
            value = v529.bindingPath
        };
    end;
    if v529.token ~= nil then
        v530.kind = {
            type = "token", 
            value = v529.token
        };
    end;
    if v529.conditional ~= nil then
        v530.kind = {
            type = "conditional", 
            value = v2.Int64Prop_ConditionalOptions.jsonDecode(v529.conditional)
        };
    end;
    return v530;
end;
v5.descriptor = {
    name = "Int64Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
};
v2.Int64Prop = v5;
v1.default:register(v2.Int64Prop);
v5 = {};
v5.__index = v5;
local l_v5_19 = v5 --[[ copy: 5 -> 25 ]];
v5.new = function(v532) --[[ Line: 5808 ]] --[[ Name: new ]]
    -- upvalues: l_v5_19 (copy)
    return (setmetatable({
        condition = if not (v532 ~= nil) or v532.condition == nil then nil else v532.condition, 
        kind = if not (v532 ~= nil) or v532.kind == nil then nil else v532.kind
    }, l_v5_19));
end;
v5.encode = function(v533) --[[ Line: 5817 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v534 = buffer.create(0);
    local v535 = 0;
    if v533.condition ~= nil then
        local v536 = v533.condition:encode();
        local v537, v538 = v0.writeTag(v534, v535, 1, v0.wireTypes.lengthDelimited);
        v537, v538 = v0.writeBuffer(v537, v538, v536, buffer.len(v536));
        v534 = v537;
        v535 = v538;
    end;
    if v533.kind ~= nil then
        if v533.kind.type == "literal" then
            local v539, v540 = v0.writeTag(v534, v535, 2, v0.wireTypes.varint);
            v539, v540 = v0.writeVarInt(v539, v540, v533.kind.value);
            v534 = v539;
            v535 = v540;
        elseif v533.kind.type == "binding_path" then
            local v541, v542 = v0.writeTag(v534, v535, 3, v0.wireTypes.lengthDelimited);
            v541, v542 = v0.writeString(v541, v542, v533.kind.value);
            v534 = v541;
            v535 = v542;
        elseif v533.kind.type == "token" then
            local v543, v544 = v0.writeTag(v534, v535, 4, v0.wireTypes.lengthDelimited);
            v543, v544 = v0.writeString(v543, v544, v533.kind.value);
            v534 = v543;
            v535 = v544;
        end;
    end;
    local v545 = buffer.create(v535);
    buffer.copy(v545, 0, v534, 0, v535);
    return v545;
end;
v5.decode = function(v546) --[[ Line: 5845 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_19 (copy), v0 (copy), v4 (copy)
    local v547 = l_v5_19.new();
    local v548 = 0;
    while v548 < buffer.len(v546) do
        local v549 = nil;
        local v550 = nil;
        local v551, v552, v553 = v0.readTag(v546, v548);
        v549 = v551;
        v550 = v552;
        v548 = v553;
        if v550 == v0.wireTypes.varint then
            if v549 == 2 then
                v551 = nil;
                v552, v553 = v0.readVarIntI64(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.kind = {
                    type = "literal", 
                    value = v551
                };
            else
                v551 = nil;
                v552, v553 = v0.readVarInt(v546, v548);
                v551 = v552;
                v548 = v553;
            end;
        elseif v550 == v0.wireTypes.lengthDelimited then
            if v549 == 1 then
                v551 = nil;
                v552, v553 = v0.readBuffer(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.condition = v4.PropCondition.decode(v551);
            elseif v549 == 3 then
                v551 = nil;
                v552, v553 = v0.readBuffer(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v551)
                };
            elseif v549 == 4 then
                v551 = nil;
                v552, v553 = v0.readBuffer(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.kind = {
                    type = "token", 
                    value = buffer.tostring(v551)
                };
            else
                v551 = nil;
                v552, v553 = v0.readVarInt(v546, v548);
                v548 = v553 + v552;
            end;
        elseif v550 == v0.wireTypes.i32 then
            v551 = nil;
            v552, v553 = v0.readFixed32(v546, v548);
            v551 = v552;
            v548 = v553;
        elseif v550 == v0.wireTypes.i64 then
            v551 = nil;
            v552, v553 = v0.readFixed64(v546, v548);
            v551 = v552;
            v548 = v553;
        else
            error("Unsupported wire type: " .. v550);
        end;
    end;
    return v547;
end;
v5.jsonEncode = function(v554) --[[ Line: 5903 ]] --[[ Name: jsonEncode ]]
    local v555 = {};
    if v554.condition ~= nil then
        v555.condition = v554.condition:jsonEncode();
    end;
    if v554.kind ~= nil then
        if v554.kind.type == "literal" then
            v555.literal = v554.kind.value;
            return v555;
        elseif v554.kind.type == "binding_path" then
            v555.bindingPath = v554.kind.value;
            return v555;
        elseif v554.kind.type == "token" then
            v555.token = v554.kind.value;
        end;
    end;
    return v555;
end;
v5.jsonDecode = function(v556) --[[ Line: 5923 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_19 (copy), v4 (copy)
    local v557 = l_v5_19.new();
    if v556.condition ~= nil then
        v557.condition = v4.PropCondition.jsonDecode(v556.condition);
    end;
    if v556.literal ~= nil then
        v557.kind = {
            type = "literal", 
            value = v556.literal
        };
    end;
    if v556.binding_path ~= nil then
        v557.kind = {
            type = "binding_path", 
            value = v556.binding_path
        };
    end;
    if v556.bindingPath ~= nil then
        v557.kind = {
            type = "binding_path", 
            value = v556.bindingPath
        };
    end;
    if v556.token ~= nil then
        v557.kind = {
            type = "token", 
            value = v556.token
        };
    end;
    return v557;
end;
v5.descriptor = {
    name = "Int64Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Int64Prop_ConditionalOption = v5;
v1.default:register(v2.Int64Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_20 = v5 --[[ copy: 5 -> 26 ]];
v5.new = function(v559) --[[ Line: 5964 ]] --[[ Name: new ]]
    -- upvalues: l_v5_20 (copy)
    return (setmetatable({
        options = if not (v559 ~= nil) or v559.options == nil then {} else v559.options
    }, l_v5_20));
end;
v5.encode = function(v560) --[[ Line: 5972 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v561 = buffer.create(0);
    local v562 = 0;
    if v560.options ~= nil and #v560.options > 0 then
        for _, v564 in v560.options do
            local v565 = v564:encode();
            local v566, v567 = v0.writeTag(v561, v562, 1, v0.wireTypes.lengthDelimited);
            v566, v567 = v0.writeBuffer(v566, v567, v565, buffer.len(v565));
            v561 = v566;
            v562 = v567;
        end;
    end;
    local v568 = buffer.create(v562);
    buffer.copy(v568, 0, v561, 0, v562);
    return v568;
end;
v5.decode = function(v569) --[[ Line: 5989 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_20 (copy), v0 (copy), v2 (copy)
    local v570 = l_v5_20.new();
    local v571 = 0;
    while v571 < buffer.len(v569) do
        local v572 = nil;
        local v573 = nil;
        local v574, v575, v576 = v0.readTag(v569, v571);
        v572 = v574;
        v573 = v575;
        v571 = v576;
        if v573 == v0.wireTypes.varint then
            v574 = nil;
            v575, v576 = v0.readVarInt(v569, v571);
            v574 = v575;
            v571 = v576;
        elseif v573 == v0.wireTypes.lengthDelimited then
            if v572 == 1 then
                v574 = nil;
                v575, v576 = v0.readBuffer(v569, v571);
                v574 = v575;
                v571 = v576;
                table.insert(v570.options, v2.Int64Prop_ConditionalOption.decode(v574));
            else
                v574 = nil;
                v575, v576 = v0.readVarInt(v569, v571);
                v571 = v576 + v575;
            end;
        elseif v573 == v0.wireTypes.i32 then
            v574 = nil;
            v575, v576 = v0.readFixed32(v569, v571);
            v574 = v575;
            v571 = v576;
        elseif v573 == v0.wireTypes.i64 then
            v574 = nil;
            v575, v576 = v0.readFixed64(v569, v571);
            v574 = v575;
            v571 = v576;
        else
            error("Unsupported wire type: " .. v573);
        end;
    end;
    return v570;
end;
v5.jsonEncode = function(v577) --[[ Line: 6032 ]] --[[ Name: jsonEncode ]]
    local v578 = {};
    if v577.options ~= nil and #v577.options > 0 then
        local v579 = {};
        for _, v581 in v577.options do
            table.insert(v579, v581:jsonEncode());
        end;
        v578.options = v579;
    end;
    return v578;
end;
v5.jsonDecode = function(v582) --[[ Line: 6046 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_20 (copy), v2 (copy)
    local v583 = l_v5_20.new();
    if v582.options ~= nil then
        local v584 = {};
        for _, v586 in v582.options do
            table.insert(v584, v2.Int64Prop_ConditionalOption.jsonDecode(v586));
        end;
        v583.options = v584;
    end;
    return v583;
end;
v5.descriptor = {
    name = "Int64Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Int64Prop_ConditionalOptions = v5;
v1.default:register(v2.Int64Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_21 = v5 --[[ copy: 5 -> 27 ]];
v5.new = function(v588) --[[ Line: 6075 ]] --[[ Name: new ]]
    -- upvalues: l_v5_21 (copy)
    return (setmetatable({
        kind = if not (v588 ~= nil) or v588.kind == nil then nil else v588.kind
    }, l_v5_21));
end;
v5.encode = function(v589) --[[ Line: 6081 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v590 = buffer.create(0);
    local v591 = 0;
    if v589.kind ~= nil then
        if v589.kind.type == "literal" then
            local v592, v593 = v0.writeTag(v590, v591, 1, v0.wireTypes.varint);
            v592, v593 = v0.writeVarInt(v592, v593, v589.kind.value and 1 or 0);
            v590 = v592;
            v591 = v593;
        elseif v589.kind.type == "binding_path" then
            local v594, v595 = v0.writeTag(v590, v591, 2, v0.wireTypes.lengthDelimited);
            v594, v595 = v0.writeString(v594, v595, v589.kind.value);
            v590 = v594;
            v591 = v595;
        elseif v589.kind.type == "conditional" then
            local v596 = v589.kind.value:encode();
            local v597, v598 = v0.writeTag(v590, v591, 3, v0.wireTypes.lengthDelimited);
            v597, v598 = v0.writeBuffer(v597, v598, v596, buffer.len(v596));
            v590 = v597;
            v591 = v598;
        end;
    end;
    local v599 = buffer.create(v591);
    buffer.copy(v599, 0, v590, 0, v591);
    return v599;
end;
v5.decode = function(v600) --[[ Line: 6104 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_21 (copy), v0 (copy), v2 (copy)
    local v601 = l_v5_21.new();
    local v602 = 0;
    while v602 < buffer.len(v600) do
        local v603 = nil;
        local v604 = nil;
        local v605, v606, v607 = v0.readTag(v600, v602);
        v603 = v605;
        v604 = v606;
        v602 = v607;
        if v604 == v0.wireTypes.varint then
            if v603 == 1 then
                v605 = nil;
                v606, v607 = v0.readVarInt(v600, v602);
                v605 = v606;
                v602 = v607;
                v601.kind = {
                    type = "literal", 
                    value = v605 ~= 0
                };
            else
                v605 = nil;
                v606, v607 = v0.readVarInt(v600, v602);
                v605 = v606;
                v602 = v607;
            end;
        elseif v604 == v0.wireTypes.lengthDelimited then
            if v603 == 2 then
                v605 = nil;
                v606, v607 = v0.readBuffer(v600, v602);
                v605 = v606;
                v602 = v607;
                v601.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v605)
                };
            elseif v603 == 3 then
                v605 = nil;
                v606, v607 = v0.readBuffer(v600, v602);
                v605 = v606;
                v602 = v607;
                v601.kind = {
                    type = "conditional", 
                    value = v2.BoolProp_ConditionalOptions.decode(v605)
                };
            else
                v605 = nil;
                v606, v607 = v0.readVarInt(v600, v602);
                v602 = v607 + v606;
            end;
        elseif v604 == v0.wireTypes.i32 then
            v605 = nil;
            v606, v607 = v0.readFixed32(v600, v602);
            v605 = v606;
            v602 = v607;
        elseif v604 == v0.wireTypes.i64 then
            v605 = nil;
            v606, v607 = v0.readFixed64(v600, v602);
            v605 = v606;
            v602 = v607;
        else
            error("Unsupported wire type: " .. v604);
        end;
    end;
    return v601;
end;
v5.jsonEncode = function(v608) --[[ Line: 6157 ]] --[[ Name: jsonEncode ]]
    local v609 = {};
    if v608.kind ~= nil then
        if v608.kind.type == "literal" then
            v609.literal = v608.kind.value;
            return v609;
        elseif v608.kind.type == "binding_path" then
            v609.bindingPath = v608.kind.value;
            return v609;
        elseif v608.kind.type == "conditional" then
            v609.conditional = v608.kind.value:jsonEncode();
        end;
    end;
    return v609;
end;
v5.jsonDecode = function(v610) --[[ Line: 6173 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_21 (copy), v2 (copy)
    local v611 = l_v5_21.new();
    if v610.literal ~= nil then
        v611.kind = {
            type = "literal", 
            value = v610.literal
        };
    end;
    if v610.binding_path ~= nil then
        v611.kind = {
            type = "binding_path", 
            value = v610.binding_path
        };
    end;
    if v610.bindingPath ~= nil then
        v611.kind = {
            type = "binding_path", 
            value = v610.bindingPath
        };
    end;
    if v610.conditional ~= nil then
        v611.kind = {
            type = "conditional", 
            value = v2.BoolProp_ConditionalOptions.jsonDecode(v610.conditional)
        };
    end;
    return v611;
end;
v5.descriptor = {
    name = "BoolProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
};
v2.BoolProp = v5;
v1.default:register(v2.BoolProp);
v5 = {};
v5.__index = v5;
local l_v5_22 = v5 --[[ copy: 5 -> 28 ]];
v5.new = function(v613) --[[ Line: 6210 ]] --[[ Name: new ]]
    -- upvalues: l_v5_22 (copy)
    return (setmetatable({
        condition = if not (v613 ~= nil) or v613.condition == nil then nil else v613.condition, 
        kind = if not (v613 ~= nil) or v613.kind == nil then nil else v613.kind
    }, l_v5_22));
end;
v5.encode = function(v614) --[[ Line: 6219 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v615 = buffer.create(0);
    local v616 = 0;
    if v614.condition ~= nil then
        local v617 = v614.condition:encode();
        local v618, v619 = v0.writeTag(v615, v616, 1, v0.wireTypes.lengthDelimited);
        v618, v619 = v0.writeBuffer(v618, v619, v617, buffer.len(v617));
        v615 = v618;
        v616 = v619;
    end;
    if v614.kind ~= nil then
        if v614.kind.type == "literal" then
            local v620, v621 = v0.writeTag(v615, v616, 2, v0.wireTypes.varint);
            v620, v621 = v0.writeVarInt(v620, v621, v614.kind.value and 1 or 0);
            v615 = v620;
            v616 = v621;
        elseif v614.kind.type == "binding_path" then
            local v622, v623 = v0.writeTag(v615, v616, 3, v0.wireTypes.lengthDelimited);
            v622, v623 = v0.writeString(v622, v623, v614.kind.value);
            v615 = v622;
            v616 = v623;
        end;
    end;
    local v624 = buffer.create(v616);
    buffer.copy(v624, 0, v615, 0, v616);
    return v624;
end;
v5.decode = function(v625) --[[ Line: 6244 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_22 (copy), v0 (copy), v4 (copy)
    local v626 = l_v5_22.new();
    local v627 = 0;
    while v627 < buffer.len(v625) do
        local v628 = nil;
        local v629 = nil;
        local v630, v631, v632 = v0.readTag(v625, v627);
        v628 = v630;
        v629 = v631;
        v627 = v632;
        if v629 == v0.wireTypes.varint then
            if v628 == 2 then
                v630 = nil;
                v631, v632 = v0.readVarInt(v625, v627);
                v630 = v631;
                v627 = v632;
                v626.kind = {
                    type = "literal", 
                    value = v630 ~= 0
                };
            else
                v630 = nil;
                v631, v632 = v0.readVarInt(v625, v627);
                v630 = v631;
                v627 = v632;
            end;
        elseif v629 == v0.wireTypes.lengthDelimited then
            if v628 == 1 then
                v630 = nil;
                v631, v632 = v0.readBuffer(v625, v627);
                v630 = v631;
                v627 = v632;
                v626.condition = v4.PropCondition.decode(v630);
            elseif v628 == 3 then
                v630 = nil;
                v631, v632 = v0.readBuffer(v625, v627);
                v630 = v631;
                v627 = v632;
                v626.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v630)
                };
            else
                v630 = nil;
                v631, v632 = v0.readVarInt(v625, v627);
                v627 = v632 + v631;
            end;
        elseif v629 == v0.wireTypes.i32 then
            v630 = nil;
            v631, v632 = v0.readFixed32(v625, v627);
            v630 = v631;
            v627 = v632;
        elseif v629 == v0.wireTypes.i64 then
            v630 = nil;
            v631, v632 = v0.readFixed64(v625, v627);
            v630 = v631;
            v627 = v632;
        else
            error("Unsupported wire type: " .. v629);
        end;
    end;
    return v626;
end;
v5.jsonEncode = function(v633) --[[ Line: 6297 ]] --[[ Name: jsonEncode ]]
    local v634 = {};
    if v633.condition ~= nil then
        v634.condition = v633.condition:jsonEncode();
    end;
    if v633.kind ~= nil then
        if v633.kind.type == "literal" then
            v634.literal = v633.kind.value;
            return v634;
        elseif v633.kind.type == "binding_path" then
            v634.bindingPath = v633.kind.value;
        end;
    end;
    return v634;
end;
v5.jsonDecode = function(v635) --[[ Line: 6315 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_22 (copy), v4 (copy)
    local v636 = l_v5_22.new();
    if v635.condition ~= nil then
        v636.condition = v4.PropCondition.jsonDecode(v635.condition);
    end;
    if v635.literal ~= nil then
        v636.kind = {
            type = "literal", 
            value = v635.literal
        };
    end;
    if v635.binding_path ~= nil then
        v636.kind = {
            type = "binding_path", 
            value = v635.binding_path
        };
    end;
    if v635.bindingPath ~= nil then
        v636.kind = {
            type = "binding_path", 
            value = v635.bindingPath
        };
    end;
    return v636;
end;
v5.descriptor = {
    name = "BoolProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.BoolProp_ConditionalOption = v5;
v1.default:register(v2.BoolProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_23 = v5 --[[ copy: 5 -> 29 ]];
v5.new = function(v638) --[[ Line: 6352 ]] --[[ Name: new ]]
    -- upvalues: l_v5_23 (copy)
    return (setmetatable({
        options = if not (v638 ~= nil) or v638.options == nil then {} else v638.options
    }, l_v5_23));
end;
v5.encode = function(v639) --[[ Line: 6360 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v640 = buffer.create(0);
    local v641 = 0;
    if v639.options ~= nil and #v639.options > 0 then
        for _, v643 in v639.options do
            local v644 = v643:encode();
            local v645, v646 = v0.writeTag(v640, v641, 1, v0.wireTypes.lengthDelimited);
            v645, v646 = v0.writeBuffer(v645, v646, v644, buffer.len(v644));
            v640 = v645;
            v641 = v646;
        end;
    end;
    local v647 = buffer.create(v641);
    buffer.copy(v647, 0, v640, 0, v641);
    return v647;
end;
v5.decode = function(v648) --[[ Line: 6377 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_23 (copy), v0 (copy), v2 (copy)
    local v649 = l_v5_23.new();
    local v650 = 0;
    while v650 < buffer.len(v648) do
        local v651 = nil;
        local v652 = nil;
        local v653, v654, v655 = v0.readTag(v648, v650);
        v651 = v653;
        v652 = v654;
        v650 = v655;
        if v652 == v0.wireTypes.varint then
            v653 = nil;
            v654, v655 = v0.readVarInt(v648, v650);
            v653 = v654;
            v650 = v655;
        elseif v652 == v0.wireTypes.lengthDelimited then
            if v651 == 1 then
                v653 = nil;
                v654, v655 = v0.readBuffer(v648, v650);
                v653 = v654;
                v650 = v655;
                table.insert(v649.options, v2.BoolProp_ConditionalOption.decode(v653));
            else
                v653 = nil;
                v654, v655 = v0.readVarInt(v648, v650);
                v650 = v655 + v654;
            end;
        elseif v652 == v0.wireTypes.i32 then
            v653 = nil;
            v654, v655 = v0.readFixed32(v648, v650);
            v653 = v654;
            v650 = v655;
        elseif v652 == v0.wireTypes.i64 then
            v653 = nil;
            v654, v655 = v0.readFixed64(v648, v650);
            v653 = v654;
            v650 = v655;
        else
            error("Unsupported wire type: " .. v652);
        end;
    end;
    return v649;
end;
v5.jsonEncode = function(v656) --[[ Line: 6420 ]] --[[ Name: jsonEncode ]]
    local v657 = {};
    if v656.options ~= nil and #v656.options > 0 then
        local v658 = {};
        for _, v660 in v656.options do
            table.insert(v658, v660:jsonEncode());
        end;
        v657.options = v658;
    end;
    return v657;
end;
v5.jsonDecode = function(v661) --[[ Line: 6434 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_23 (copy), v2 (copy)
    local v662 = l_v5_23.new();
    if v661.options ~= nil then
        local v663 = {};
        for _, v665 in v661.options do
            table.insert(v663, v2.BoolProp_ConditionalOption.jsonDecode(v665));
        end;
        v662.options = v663;
    end;
    return v662;
end;
v5.descriptor = {
    name = "BoolProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.BoolProp_ConditionalOptions = v5;
v1.default:register(v2.BoolProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_24 = v5 --[[ copy: 5 -> 30 ]];
v5.new = function(v667) --[[ Line: 6463 ]] --[[ Name: new ]]
    -- upvalues: l_v5_24 (copy)
    return (setmetatable({
        kind = if not (v667 ~= nil) or v667.kind == nil then nil else v667.kind
    }, l_v5_24));
end;
v5.encode = function(v668) --[[ Line: 6469 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v669 = buffer.create(0);
    local v670 = 0;
    if v668.kind ~= nil then
        if v668.kind.type == "literal" then
            local v671 = v668.kind.value:encode();
            local v672, v673 = v0.writeTag(v669, v670, 1, v0.wireTypes.lengthDelimited);
            v672, v673 = v0.writeBuffer(v672, v673, v671, buffer.len(v671));
            v669 = v672;
            v670 = v673;
        elseif v668.kind.type == "binding_path" then
            local v674, v675 = v0.writeTag(v669, v670, 2, v0.wireTypes.lengthDelimited);
            v674, v675 = v0.writeString(v674, v675, v668.kind.value);
            v669 = v674;
            v670 = v675;
        elseif v668.kind.type == "conditional" then
            local v676 = v668.kind.value:encode();
            local v677, v678 = v0.writeTag(v669, v670, 3, v0.wireTypes.lengthDelimited);
            v677, v678 = v0.writeBuffer(v677, v678, v676, buffer.len(v676));
            v669 = v677;
            v670 = v678;
        end;
    end;
    local v679 = buffer.create(v670);
    buffer.copy(v679, 0, v669, 0, v670);
    return v679;
end;
v5.decode = function(v680) --[[ Line: 6493 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_24 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v681 = l_v5_24.new();
    local v682 = 0;
    while v682 < buffer.len(v680) do
        local v683 = nil;
        local v684 = nil;
        local v685, v686, v687 = v0.readTag(v680, v682);
        v683 = v685;
        v684 = v686;
        v682 = v687;
        if v684 == v0.wireTypes.varint then
            v685 = nil;
            v686, v687 = v0.readVarInt(v680, v682);
            v685 = v686;
            v682 = v687;
        elseif v684 == v0.wireTypes.lengthDelimited then
            if v683 == 1 then
                v685 = nil;
                v686, v687 = v0.readBuffer(v680, v682);
                v685 = v686;
                v682 = v687;
                v681.kind = {
                    type = "literal", 
                    value = v3.Struct.decode(v685)
                };
            elseif v683 == 2 then
                v685 = nil;
                v686, v687 = v0.readBuffer(v680, v682);
                v685 = v686;
                v682 = v687;
                v681.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v685)
                };
            elseif v683 == 3 then
                v685 = nil;
                v686, v687 = v0.readBuffer(v680, v682);
                v685 = v686;
                v682 = v687;
                v681.kind = {
                    type = "conditional", 
                    value = v2.StructProp_ConditionalOptions.decode(v685)
                };
            else
                v685 = nil;
                v686, v687 = v0.readVarInt(v680, v682);
                v682 = v687 + v686;
            end;
        elseif v684 == v0.wireTypes.i32 then
            v685 = nil;
            v686, v687 = v0.readFixed32(v680, v682);
            v685 = v686;
            v682 = v687;
        elseif v684 == v0.wireTypes.i64 then
            v685 = nil;
            v686, v687 = v0.readFixed64(v680, v682);
            v685 = v686;
            v682 = v687;
        else
            error("Unsupported wire type: " .. v684);
        end;
    end;
    return v681;
end;
v5.jsonEncode = function(v688) --[[ Line: 6546 ]] --[[ Name: jsonEncode ]]
    local v689 = {};
    if v688.kind ~= nil then
        if v688.kind.type == "literal" then
            v689.literal = v688.kind.value:jsonEncode();
            return v689;
        elseif v688.kind.type == "binding_path" then
            v689.bindingPath = v688.kind.value;
            return v689;
        elseif v688.kind.type == "conditional" then
            v689.conditional = v688.kind.value:jsonEncode();
        end;
    end;
    return v689;
end;
v5.jsonDecode = function(v690) --[[ Line: 6562 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_24 (copy), v3 (copy), v2 (copy)
    local v691 = l_v5_24.new();
    if v690.literal ~= nil then
        v691.kind = {
            type = "literal", 
            value = v3.Struct.jsonDecode(v690.literal)
        };
    end;
    if v690.binding_path ~= nil then
        v691.kind = {
            type = "binding_path", 
            value = v690.binding_path
        };
    end;
    if v690.bindingPath ~= nil then
        v691.kind = {
            type = "binding_path", 
            value = v690.bindingPath
        };
    end;
    if v690.conditional ~= nil then
        v691.kind = {
            type = "conditional", 
            value = v2.StructProp_ConditionalOptions.jsonDecode(v690.conditional)
        };
    end;
    return v691;
end;
v5.descriptor = {
    name = "StructProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
};
v2.StructProp = v5;
v1.default:register(v2.StructProp);
v5 = {};
v5.__index = v5;
local l_v5_25 = v5 --[[ copy: 5 -> 31 ]];
v5.new = function(v693) --[[ Line: 6599 ]] --[[ Name: new ]]
    -- upvalues: l_v5_25 (copy)
    return (setmetatable({
        condition = if not (v693 ~= nil) or v693.condition == nil then nil else v693.condition, 
        kind = if not (v693 ~= nil) or v693.kind == nil then nil else v693.kind
    }, l_v5_25));
end;
v5.encode = function(v694) --[[ Line: 6608 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v695 = buffer.create(0);
    local v696 = 0;
    if v694.condition ~= nil then
        local v697 = v694.condition:encode();
        local v698, v699 = v0.writeTag(v695, v696, 1, v0.wireTypes.lengthDelimited);
        v698, v699 = v0.writeBuffer(v698, v699, v697, buffer.len(v697));
        v695 = v698;
        v696 = v699;
    end;
    if v694.kind ~= nil then
        if v694.kind.type == "literal" then
            local v700 = v694.kind.value:encode();
            local v701, v702 = v0.writeTag(v695, v696, 2, v0.wireTypes.lengthDelimited);
            v701, v702 = v0.writeBuffer(v701, v702, v700, buffer.len(v700));
            v695 = v701;
            v696 = v702;
        elseif v694.kind.type == "binding_path" then
            local v703, v704 = v0.writeTag(v695, v696, 3, v0.wireTypes.lengthDelimited);
            v703, v704 = v0.writeString(v703, v704, v694.kind.value);
            v695 = v703;
            v696 = v704;
        end;
    end;
    local v705 = buffer.create(v696);
    buffer.copy(v705, 0, v695, 0, v696);
    return v705;
end;
v5.decode = function(v706) --[[ Line: 6634 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_25 (copy), v0 (copy), v4 (copy), v3 (copy)
    local v707 = l_v5_25.new();
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
                v707.condition = v4.PropCondition.decode(v711);
            elseif v709 == 2 then
                v711 = nil;
                v712, v713 = v0.readBuffer(v706, v708);
                v711 = v712;
                v708 = v713;
                v707.kind = {
                    type = "literal", 
                    value = v3.Struct.decode(v711)
                };
            elseif v709 == 3 then
                v711 = nil;
                v712, v713 = v0.readBuffer(v706, v708);
                v711 = v712;
                v708 = v713;
                v707.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v711)
                };
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
v5.jsonEncode = function(v714) --[[ Line: 6687 ]] --[[ Name: jsonEncode ]]
    local v715 = {};
    if v714.condition ~= nil then
        v715.condition = v714.condition:jsonEncode();
    end;
    if v714.kind ~= nil then
        if v714.kind.type == "literal" then
            v715.literal = v714.kind.value:jsonEncode();
            return v715;
        elseif v714.kind.type == "binding_path" then
            v715.bindingPath = v714.kind.value;
        end;
    end;
    return v715;
end;
v5.jsonDecode = function(v716) --[[ Line: 6705 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_25 (copy), v4 (copy), v3 (copy)
    local v717 = l_v5_25.new();
    if v716.condition ~= nil then
        v717.condition = v4.PropCondition.jsonDecode(v716.condition);
    end;
    if v716.literal ~= nil then
        v717.kind = {
            type = "literal", 
            value = v3.Struct.jsonDecode(v716.literal)
        };
    end;
    if v716.binding_path ~= nil then
        v717.kind = {
            type = "binding_path", 
            value = v716.binding_path
        };
    end;
    if v716.bindingPath ~= nil then
        v717.kind = {
            type = "binding_path", 
            value = v716.bindingPath
        };
    end;
    return v717;
end;
v5.descriptor = {
    name = "StructProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.StructProp_ConditionalOption = v5;
v1.default:register(v2.StructProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_26 = v5 --[[ copy: 5 -> 32 ]];
v5.new = function(v719) --[[ Line: 6742 ]] --[[ Name: new ]]
    -- upvalues: l_v5_26 (copy)
    return (setmetatable({
        options = if not (v719 ~= nil) or v719.options == nil then {} else v719.options
    }, l_v5_26));
end;
v5.encode = function(v720) --[[ Line: 6750 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v721 = buffer.create(0);
    local v722 = 0;
    if v720.options ~= nil and #v720.options > 0 then
        for _, v724 in v720.options do
            local v725 = v724:encode();
            local v726, v727 = v0.writeTag(v721, v722, 1, v0.wireTypes.lengthDelimited);
            v726, v727 = v0.writeBuffer(v726, v727, v725, buffer.len(v725));
            v721 = v726;
            v722 = v727;
        end;
    end;
    local v728 = buffer.create(v722);
    buffer.copy(v728, 0, v721, 0, v722);
    return v728;
end;
v5.decode = function(v729) --[[ Line: 6767 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_26 (copy), v0 (copy), v2 (copy)
    local v730 = l_v5_26.new();
    local v731 = 0;
    while v731 < buffer.len(v729) do
        local v732 = nil;
        local v733 = nil;
        local v734, v735, v736 = v0.readTag(v729, v731);
        v732 = v734;
        v733 = v735;
        v731 = v736;
        if v733 == v0.wireTypes.varint then
            v734 = nil;
            v735, v736 = v0.readVarInt(v729, v731);
            v734 = v735;
            v731 = v736;
        elseif v733 == v0.wireTypes.lengthDelimited then
            if v732 == 1 then
                v734 = nil;
                v735, v736 = v0.readBuffer(v729, v731);
                v734 = v735;
                v731 = v736;
                table.insert(v730.options, v2.StructProp_ConditionalOption.decode(v734));
            else
                v734 = nil;
                v735, v736 = v0.readVarInt(v729, v731);
                v731 = v736 + v735;
            end;
        elseif v733 == v0.wireTypes.i32 then
            v734 = nil;
            v735, v736 = v0.readFixed32(v729, v731);
            v734 = v735;
            v731 = v736;
        elseif v733 == v0.wireTypes.i64 then
            v734 = nil;
            v735, v736 = v0.readFixed64(v729, v731);
            v734 = v735;
            v731 = v736;
        else
            error("Unsupported wire type: " .. v733);
        end;
    end;
    return v730;
end;
v5.jsonEncode = function(v737) --[[ Line: 6810 ]] --[[ Name: jsonEncode ]]
    local v738 = {};
    if v737.options ~= nil and #v737.options > 0 then
        local v739 = {};
        for _, v741 in v737.options do
            table.insert(v739, v741:jsonEncode());
        end;
        v738.options = v739;
    end;
    return v738;
end;
v5.jsonDecode = function(v742) --[[ Line: 6824 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_26 (copy), v2 (copy)
    local v743 = l_v5_26.new();
    if v742.options ~= nil then
        local v744 = {};
        for _, v746 in v742.options do
            table.insert(v744, v2.StructProp_ConditionalOption.jsonDecode(v746));
        end;
        v743.options = v744;
    end;
    return v743;
end;
v5.descriptor = {
    name = "StructProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.StructProp_ConditionalOptions = v5;
v1.default:register(v2.StructProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_27 = v5 --[[ copy: 5 -> 33 ]];
v5.new = function(v748) --[[ Line: 6853 ]] --[[ Name: new ]]
    -- upvalues: l_v5_27 (copy)
    return (setmetatable({
        kind = if not (v748 ~= nil) or v748.kind == nil then nil else v748.kind
    }, l_v5_27));
end;
v5.encode = function(v749) --[[ Line: 6859 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v750 = buffer.create(0);
    local v751 = 0;
    if v749.kind ~= nil then
        if v749.kind.type == "literal" then
            local v752, v753 = v0.writeTag(v750, v751, 1, v0.wireTypes.lengthDelimited);
            v752, v753 = v0.writeString(v752, v753, v749.kind.value);
            v750 = v752;
            v751 = v753;
        elseif v749.kind.type == "binding_path" then
            local v754, v755 = v0.writeTag(v750, v751, 2, v0.wireTypes.lengthDelimited);
            v754, v755 = v0.writeString(v754, v755, v749.kind.value);
            v750 = v754;
            v751 = v755;
        elseif v749.kind.type == "format" then
            local v756 = v749.kind.value:encode();
            local v757, v758 = v0.writeTag(v750, v751, 3, v0.wireTypes.lengthDelimited);
            v757, v758 = v0.writeBuffer(v757, v758, v756, buffer.len(v756));
            v750 = v757;
            v751 = v758;
        elseif v749.kind.type == "conditional" then
            local v759 = v749.kind.value:encode();
            local v760, v761 = v0.writeTag(v750, v751, 4, v0.wireTypes.lengthDelimited);
            v760, v761 = v0.writeBuffer(v760, v761, v759, buffer.len(v759));
            v750 = v760;
            v751 = v761;
        elseif v749.kind.type == "translation" then
            local v762 = v749.kind.value:encode();
            local v763, v764 = v0.writeTag(v750, v751, 5, v0.wireTypes.lengthDelimited);
            v763, v764 = v0.writeBuffer(v763, v764, v762, buffer.len(v762));
            v750 = v763;
            v751 = v764;
        end;
    end;
    local v765 = buffer.create(v751);
    buffer.copy(v765, 0, v750, 0, v751);
    return v765;
end;
v5.decode = function(v766) --[[ Line: 6890 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_27 (copy), v0 (copy), v2 (copy)
    local v767 = l_v5_27.new();
    local v768 = 0;
    while v768 < buffer.len(v766) do
        local v769 = nil;
        local v770 = nil;
        local v771, v772, v773 = v0.readTag(v766, v768);
        v769 = v771;
        v770 = v772;
        v768 = v773;
        if v770 == v0.wireTypes.varint then
            v771 = nil;
            v772, v773 = v0.readVarInt(v766, v768);
            v771 = v772;
            v768 = v773;
        elseif v770 == v0.wireTypes.lengthDelimited then
            if v769 == 1 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.kind = {
                    type = "literal", 
                    value = buffer.tostring(v771)
                };
            elseif v769 == 2 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v771)
                };
            elseif v769 == 3 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v771)
                };
            elseif v769 == 4 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.kind = {
                    type = "conditional", 
                    value = v2.ImageStringProp_ConditionalOptions.decode(v771)
                };
            elseif v769 == 5 then
                v771 = nil;
                v772, v773 = v0.readBuffer(v766, v768);
                v771 = v772;
                v768 = v773;
                v767.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v771)
                };
            else
                v771 = nil;
                v772, v773 = v0.readVarInt(v766, v768);
                v768 = v773 + v772;
            end;
        elseif v770 == v0.wireTypes.i32 then
            v771 = nil;
            v772, v773 = v0.readFixed32(v766, v768);
            v771 = v772;
            v768 = v773;
        elseif v770 == v0.wireTypes.i64 then
            v771 = nil;
            v772, v773 = v0.readFixed64(v766, v768);
            v771 = v772;
            v768 = v773;
        else
            error("Unsupported wire type: " .. v770);
        end;
    end;
    return v767;
end;
v5.jsonEncode = function(v774) --[[ Line: 6954 ]] --[[ Name: jsonEncode ]]
    local v775 = {};
    if v774.kind ~= nil then
        if v774.kind.type == "literal" then
            v775.literal = v774.kind.value;
            return v775;
        elseif v774.kind.type == "binding_path" then
            v775.bindingPath = v774.kind.value;
            return v775;
        elseif v774.kind.type == "format" then
            v775.format = v774.kind.value:jsonEncode();
            return v775;
        elseif v774.kind.type == "conditional" then
            v775.conditional = v774.kind.value:jsonEncode();
            return v775;
        elseif v774.kind.type == "translation" then
            v775.translation = v774.kind.value:jsonEncode();
        end;
    end;
    return v775;
end;
v5.jsonDecode = function(v776) --[[ Line: 6974 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_27 (copy), v2 (copy)
    local v777 = l_v5_27.new();
    if v776.literal ~= nil then
        v777.kind = {
            type = "literal", 
            value = v776.literal
        };
    end;
    if v776.binding_path ~= nil then
        v777.kind = {
            type = "binding_path", 
            value = v776.binding_path
        };
    end;
    if v776.bindingPath ~= nil then
        v777.kind = {
            type = "binding_path", 
            value = v776.bindingPath
        };
    end;
    if v776.format ~= nil then
        v777.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v776.format)
        };
    end;
    if v776.conditional ~= nil then
        v777.kind = {
            type = "conditional", 
            value = v2.ImageStringProp_ConditionalOptions.jsonDecode(v776.conditional)
        };
    end;
    if v776.translation ~= nil then
        v777.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v776.translation)
        };
    end;
    return v777;
end;
v5.descriptor = {
    name = "ImageStringProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
};
v2.ImageStringProp = v5;
v1.default:register(v2.ImageStringProp);
v5 = {};
v5.__index = v5;
local l_v5_28 = v5 --[[ copy: 5 -> 34 ]];
v5.new = function(v779) --[[ Line: 7021 ]] --[[ Name: new ]]
    -- upvalues: l_v5_28 (copy)
    return (setmetatable({
        condition = if not (v779 ~= nil) or v779.condition == nil then nil else v779.condition, 
        kind = if not (v779 ~= nil) or v779.kind == nil then nil else v779.kind
    }, l_v5_28));
end;
v5.encode = function(v780) --[[ Line: 7030 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v781 = buffer.create(0);
    local v782 = 0;
    if v780.condition ~= nil then
        local v783 = v780.condition:encode();
        local v784, v785 = v0.writeTag(v781, v782, 1, v0.wireTypes.lengthDelimited);
        v784, v785 = v0.writeBuffer(v784, v785, v783, buffer.len(v783));
        v781 = v784;
        v782 = v785;
    end;
    if v780.kind ~= nil then
        if v780.kind.type == "literal" then
            local v786, v787 = v0.writeTag(v781, v782, 2, v0.wireTypes.lengthDelimited);
            v786, v787 = v0.writeString(v786, v787, v780.kind.value);
            v781 = v786;
            v782 = v787;
        elseif v780.kind.type == "binding_path" then
            local v788, v789 = v0.writeTag(v781, v782, 3, v0.wireTypes.lengthDelimited);
            v788, v789 = v0.writeString(v788, v789, v780.kind.value);
            v781 = v788;
            v782 = v789;
        elseif v780.kind.type == "format" then
            local v790 = v780.kind.value:encode();
            local v791, v792 = v0.writeTag(v781, v782, 4, v0.wireTypes.lengthDelimited);
            v791, v792 = v0.writeBuffer(v791, v792, v790, buffer.len(v790));
            v781 = v791;
            v782 = v792;
        elseif v780.kind.type == "translation" then
            local v793 = v780.kind.value:encode();
            local v794, v795 = v0.writeTag(v781, v782, 5, v0.wireTypes.lengthDelimited);
            v794, v795 = v0.writeBuffer(v794, v795, v793, buffer.len(v793));
            v781 = v794;
            v782 = v795;
        end;
    end;
    local v796 = buffer.create(v782);
    buffer.copy(v796, 0, v781, 0, v782);
    return v796;
end;
v5.decode = function(v797) --[[ Line: 7063 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_28 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v798 = l_v5_28.new();
    local v799 = 0;
    while v799 < buffer.len(v797) do
        local v800 = nil;
        local v801 = nil;
        local v802, v803, v804 = v0.readTag(v797, v799);
        v800 = v802;
        v801 = v803;
        v799 = v804;
        if v801 == v0.wireTypes.varint then
            v802 = nil;
            v803, v804 = v0.readVarInt(v797, v799);
            v802 = v803;
            v799 = v804;
        elseif v801 == v0.wireTypes.lengthDelimited then
            if v800 == 1 then
                v802 = nil;
                v803, v804 = v0.readBuffer(v797, v799);
                v802 = v803;
                v799 = v804;
                v798.condition = v4.PropCondition.decode(v802);
            elseif v800 == 2 then
                v802 = nil;
                v803, v804 = v0.readBuffer(v797, v799);
                v802 = v803;
                v799 = v804;
                v798.kind = {
                    type = "literal", 
                    value = buffer.tostring(v802)
                };
            elseif v800 == 3 then
                v802 = nil;
                v803, v804 = v0.readBuffer(v797, v799);
                v802 = v803;
                v799 = v804;
                v798.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v802)
                };
            elseif v800 == 4 then
                v802 = nil;
                v803, v804 = v0.readBuffer(v797, v799);
                v802 = v803;
                v799 = v804;
                v798.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v802)
                };
            elseif v800 == 5 then
                v802 = nil;
                v803, v804 = v0.readBuffer(v797, v799);
                v802 = v803;
                v799 = v804;
                v798.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v802)
                };
            else
                v802 = nil;
                v803, v804 = v0.readVarInt(v797, v799);
                v799 = v804 + v803;
            end;
        elseif v801 == v0.wireTypes.i32 then
            v802 = nil;
            v803, v804 = v0.readFixed32(v797, v799);
            v802 = v803;
            v799 = v804;
        elseif v801 == v0.wireTypes.i64 then
            v802 = nil;
            v803, v804 = v0.readFixed64(v797, v799);
            v802 = v803;
            v799 = v804;
        else
            error("Unsupported wire type: " .. v801);
        end;
    end;
    return v798;
end;
v5.jsonEncode = function(v805) --[[ Line: 7126 ]] --[[ Name: jsonEncode ]]
    local v806 = {};
    if v805.condition ~= nil then
        v806.condition = v805.condition:jsonEncode();
    end;
    if v805.kind ~= nil then
        if v805.kind.type == "literal" then
            v806.literal = v805.kind.value;
            return v806;
        elseif v805.kind.type == "binding_path" then
            v806.bindingPath = v805.kind.value;
            return v806;
        elseif v805.kind.type == "format" then
            v806.format = v805.kind.value:jsonEncode();
            return v806;
        elseif v805.kind.type == "translation" then
            v806.translation = v805.kind.value:jsonEncode();
        end;
    end;
    return v806;
end;
v5.jsonDecode = function(v807) --[[ Line: 7148 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_28 (copy), v4 (copy), v2 (copy)
    local v808 = l_v5_28.new();
    if v807.condition ~= nil then
        v808.condition = v4.PropCondition.jsonDecode(v807.condition);
    end;
    if v807.literal ~= nil then
        v808.kind = {
            type = "literal", 
            value = v807.literal
        };
    end;
    if v807.binding_path ~= nil then
        v808.kind = {
            type = "binding_path", 
            value = v807.binding_path
        };
    end;
    if v807.bindingPath ~= nil then
        v808.kind = {
            type = "binding_path", 
            value = v807.bindingPath
        };
    end;
    if v807.format ~= nil then
        v808.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v807.format)
        };
    end;
    if v807.translation ~= nil then
        v808.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v807.translation)
        };
    end;
    return v808;
end;
v5.descriptor = {
    name = "ImageStringProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ImageStringProp_ConditionalOption = v5;
v1.default:register(v2.ImageStringProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_29 = v5 --[[ copy: 5 -> 35 ]];
v5.new = function(v810) --[[ Line: 7195 ]] --[[ Name: new ]]
    -- upvalues: l_v5_29 (copy)
    return (setmetatable({
        options = if not (v810 ~= nil) or v810.options == nil then {} else v810.options
    }, l_v5_29));
end;
v5.encode = function(v811) --[[ Line: 7203 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v812 = buffer.create(0);
    local v813 = 0;
    if v811.options ~= nil and #v811.options > 0 then
        for _, v815 in v811.options do
            local v816 = v815:encode();
            local v817, v818 = v0.writeTag(v812, v813, 1, v0.wireTypes.lengthDelimited);
            v817, v818 = v0.writeBuffer(v817, v818, v816, buffer.len(v816));
            v812 = v817;
            v813 = v818;
        end;
    end;
    local v819 = buffer.create(v813);
    buffer.copy(v819, 0, v812, 0, v813);
    return v819;
end;
v5.decode = function(v820) --[[ Line: 7220 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_29 (copy), v0 (copy), v2 (copy)
    local v821 = l_v5_29.new();
    local v822 = 0;
    while v822 < buffer.len(v820) do
        local v823 = nil;
        local v824 = nil;
        local v825, v826, v827 = v0.readTag(v820, v822);
        v823 = v825;
        v824 = v826;
        v822 = v827;
        if v824 == v0.wireTypes.varint then
            v825 = nil;
            v826, v827 = v0.readVarInt(v820, v822);
            v825 = v826;
            v822 = v827;
        elseif v824 == v0.wireTypes.lengthDelimited then
            if v823 == 1 then
                v825 = nil;
                v826, v827 = v0.readBuffer(v820, v822);
                v825 = v826;
                v822 = v827;
                table.insert(v821.options, v2.ImageStringProp_ConditionalOption.decode(v825));
            else
                v825 = nil;
                v826, v827 = v0.readVarInt(v820, v822);
                v822 = v827 + v826;
            end;
        elseif v824 == v0.wireTypes.i32 then
            v825 = nil;
            v826, v827 = v0.readFixed32(v820, v822);
            v825 = v826;
            v822 = v827;
        elseif v824 == v0.wireTypes.i64 then
            v825 = nil;
            v826, v827 = v0.readFixed64(v820, v822);
            v825 = v826;
            v822 = v827;
        else
            error("Unsupported wire type: " .. v824);
        end;
    end;
    return v821;
end;
v5.jsonEncode = function(v828) --[[ Line: 7263 ]] --[[ Name: jsonEncode ]]
    local v829 = {};
    if v828.options ~= nil and #v828.options > 0 then
        local v830 = {};
        for _, v832 in v828.options do
            table.insert(v830, v832:jsonEncode());
        end;
        v829.options = v830;
    end;
    return v829;
end;
v5.jsonDecode = function(v833) --[[ Line: 7277 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_29 (copy), v2 (copy)
    local v834 = l_v5_29.new();
    if v833.options ~= nil then
        local v835 = {};
        for _, v837 in v833.options do
            table.insert(v835, v2.ImageStringProp_ConditionalOption.jsonDecode(v837));
        end;
        v834.options = v835;
    end;
    return v834;
end;
v5.descriptor = {
    name = "ImageStringProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ImageStringProp_ConditionalOptions = v5;
v1.default:register(v2.ImageStringProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_30 = v5 --[[ copy: 5 -> 36 ]];
v5.new = function(v839) --[[ Line: 7308 ]] --[[ Name: new ]]
    -- upvalues: l_v5_30 (copy)
    return (setmetatable({
        kind = if not (v839 ~= nil) or v839.kind == nil then nil else v839.kind
    }, l_v5_30));
end;
v5.encode = function(v840) --[[ Line: 7314 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v841 = buffer.create(0);
    local v842 = 0;
    if v840.kind ~= nil then
        if v840.kind.type == "literal" then
            local v843, v844 = v0.writeTag(v841, v842, 1, v0.wireTypes.lengthDelimited);
            v843, v844 = v0.writeString(v843, v844, v840.kind.value);
            v841 = v843;
            v842 = v844;
        elseif v840.kind.type == "binding_path" then
            local v845, v846 = v0.writeTag(v841, v842, 2, v0.wireTypes.lengthDelimited);
            v845, v846 = v0.writeString(v845, v846, v840.kind.value);
            v841 = v845;
            v842 = v846;
        elseif v840.kind.type == "format" then
            local v847 = v840.kind.value:encode();
            local v848, v849 = v0.writeTag(v841, v842, 3, v0.wireTypes.lengthDelimited);
            v848, v849 = v0.writeBuffer(v848, v849, v847, buffer.len(v847));
            v841 = v848;
            v842 = v849;
        elseif v840.kind.type == "conditional" then
            local v850 = v840.kind.value:encode();
            local v851, v852 = v0.writeTag(v841, v842, 4, v0.wireTypes.lengthDelimited);
            v851, v852 = v0.writeBuffer(v851, v852, v850, buffer.len(v850));
            v841 = v851;
            v842 = v852;
        elseif v840.kind.type == "translation" then
            local v853 = v840.kind.value:encode();
            local v854, v855 = v0.writeTag(v841, v842, 5, v0.wireTypes.lengthDelimited);
            v854, v855 = v0.writeBuffer(v854, v855, v853, buffer.len(v853));
            v841 = v854;
            v842 = v855;
        end;
    end;
    local v856 = buffer.create(v842);
    buffer.copy(v856, 0, v841, 0, v842);
    return v856;
end;
v5.decode = function(v857) --[[ Line: 7345 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_30 (copy), v0 (copy), v2 (copy)
    local v858 = l_v5_30.new();
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
                v858.kind = {
                    type = "literal", 
                    value = buffer.tostring(v862)
                };
            elseif v860 == 2 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v858.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v862)
                };
            elseif v860 == 3 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v858.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v862)
                };
            elseif v860 == 4 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v858.kind = {
                    type = "conditional", 
                    value = v2.ImageSetProp_ConditionalOptions.decode(v862)
                };
            elseif v860 == 5 then
                v862 = nil;
                v863, v864 = v0.readBuffer(v857, v859);
                v862 = v863;
                v859 = v864;
                v858.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v862)
                };
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
v5.jsonEncode = function(v865) --[[ Line: 7408 ]] --[[ Name: jsonEncode ]]
    local v866 = {};
    if v865.kind ~= nil then
        if v865.kind.type == "literal" then
            v866.literal = v865.kind.value;
            return v866;
        elseif v865.kind.type == "binding_path" then
            v866.bindingPath = v865.kind.value;
            return v866;
        elseif v865.kind.type == "format" then
            v866.format = v865.kind.value:jsonEncode();
            return v866;
        elseif v865.kind.type == "conditional" then
            v866.conditional = v865.kind.value:jsonEncode();
            return v866;
        elseif v865.kind.type == "translation" then
            v866.translation = v865.kind.value:jsonEncode();
        end;
    end;
    return v866;
end;
v5.jsonDecode = function(v867) --[[ Line: 7428 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_30 (copy), v2 (copy)
    local v868 = l_v5_30.new();
    if v867.literal ~= nil then
        v868.kind = {
            type = "literal", 
            value = v867.literal
        };
    end;
    if v867.binding_path ~= nil then
        v868.kind = {
            type = "binding_path", 
            value = v867.binding_path
        };
    end;
    if v867.bindingPath ~= nil then
        v868.kind = {
            type = "binding_path", 
            value = v867.bindingPath
        };
    end;
    if v867.format ~= nil then
        v868.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v867.format)
        };
    end;
    if v867.conditional ~= nil then
        v868.kind = {
            type = "conditional", 
            value = v2.ImageSetProp_ConditionalOptions.jsonDecode(v867.conditional)
        };
    end;
    if v867.translation ~= nil then
        v868.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v867.translation)
        };
    end;
    return v868;
end;
v5.descriptor = {
    name = "ImageSetProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
};
v2.ImageSetProp = v5;
v1.default:register(v2.ImageSetProp);
v5 = {};
v5.__index = v5;
local l_v5_31 = v5 --[[ copy: 5 -> 37 ]];
v5.new = function(v870) --[[ Line: 7473 ]] --[[ Name: new ]]
    -- upvalues: l_v5_31 (copy)
    return (setmetatable({
        condition = if not (v870 ~= nil) or v870.condition == nil then nil else v870.condition, 
        kind = if not (v870 ~= nil) or v870.kind == nil then nil else v870.kind
    }, l_v5_31));
end;
v5.encode = function(v871) --[[ Line: 7482 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v872 = buffer.create(0);
    local v873 = 0;
    if v871.condition ~= nil then
        local v874 = v871.condition:encode();
        local v875, v876 = v0.writeTag(v872, v873, 1, v0.wireTypes.lengthDelimited);
        v875, v876 = v0.writeBuffer(v875, v876, v874, buffer.len(v874));
        v872 = v875;
        v873 = v876;
    end;
    if v871.kind ~= nil then
        if v871.kind.type == "literal" then
            local v877, v878 = v0.writeTag(v872, v873, 2, v0.wireTypes.lengthDelimited);
            v877, v878 = v0.writeString(v877, v878, v871.kind.value);
            v872 = v877;
            v873 = v878;
        elseif v871.kind.type == "binding_path" then
            local v879, v880 = v0.writeTag(v872, v873, 3, v0.wireTypes.lengthDelimited);
            v879, v880 = v0.writeString(v879, v880, v871.kind.value);
            v872 = v879;
            v873 = v880;
        elseif v871.kind.type == "format" then
            local v881 = v871.kind.value:encode();
            local v882, v883 = v0.writeTag(v872, v873, 4, v0.wireTypes.lengthDelimited);
            v882, v883 = v0.writeBuffer(v882, v883, v881, buffer.len(v881));
            v872 = v882;
            v873 = v883;
        elseif v871.kind.type == "translation" then
            local v884 = v871.kind.value:encode();
            local v885, v886 = v0.writeTag(v872, v873, 5, v0.wireTypes.lengthDelimited);
            v885, v886 = v0.writeBuffer(v885, v886, v884, buffer.len(v884));
            v872 = v885;
            v873 = v886;
        end;
    end;
    local v887 = buffer.create(v873);
    buffer.copy(v887, 0, v872, 0, v873);
    return v887;
end;
v5.decode = function(v888) --[[ Line: 7515 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_31 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v889 = l_v5_31.new();
    local v890 = 0;
    while v890 < buffer.len(v888) do
        local v891 = nil;
        local v892 = nil;
        local v893, v894, v895 = v0.readTag(v888, v890);
        v891 = v893;
        v892 = v894;
        v890 = v895;
        if v892 == v0.wireTypes.varint then
            v893 = nil;
            v894, v895 = v0.readVarInt(v888, v890);
            v893 = v894;
            v890 = v895;
        elseif v892 == v0.wireTypes.lengthDelimited then
            if v891 == 1 then
                v893 = nil;
                v894, v895 = v0.readBuffer(v888, v890);
                v893 = v894;
                v890 = v895;
                v889.condition = v4.PropCondition.decode(v893);
            elseif v891 == 2 then
                v893 = nil;
                v894, v895 = v0.readBuffer(v888, v890);
                v893 = v894;
                v890 = v895;
                v889.kind = {
                    type = "literal", 
                    value = buffer.tostring(v893)
                };
            elseif v891 == 3 then
                v893 = nil;
                v894, v895 = v0.readBuffer(v888, v890);
                v893 = v894;
                v890 = v895;
                v889.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v893)
                };
            elseif v891 == 4 then
                v893 = nil;
                v894, v895 = v0.readBuffer(v888, v890);
                v893 = v894;
                v890 = v895;
                v889.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v893)
                };
            elseif v891 == 5 then
                v893 = nil;
                v894, v895 = v0.readBuffer(v888, v890);
                v893 = v894;
                v890 = v895;
                v889.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v893)
                };
            else
                v893 = nil;
                v894, v895 = v0.readVarInt(v888, v890);
                v890 = v895 + v894;
            end;
        elseif v892 == v0.wireTypes.i32 then
            v893 = nil;
            v894, v895 = v0.readFixed32(v888, v890);
            v893 = v894;
            v890 = v895;
        elseif v892 == v0.wireTypes.i64 then
            v893 = nil;
            v894, v895 = v0.readFixed64(v888, v890);
            v893 = v894;
            v890 = v895;
        else
            error("Unsupported wire type: " .. v892);
        end;
    end;
    return v889;
end;
v5.jsonEncode = function(v896) --[[ Line: 7578 ]] --[[ Name: jsonEncode ]]
    local v897 = {};
    if v896.condition ~= nil then
        v897.condition = v896.condition:jsonEncode();
    end;
    if v896.kind ~= nil then
        if v896.kind.type == "literal" then
            v897.literal = v896.kind.value;
            return v897;
        elseif v896.kind.type == "binding_path" then
            v897.bindingPath = v896.kind.value;
            return v897;
        elseif v896.kind.type == "format" then
            v897.format = v896.kind.value:jsonEncode();
            return v897;
        elseif v896.kind.type == "translation" then
            v897.translation = v896.kind.value:jsonEncode();
        end;
    end;
    return v897;
end;
v5.jsonDecode = function(v898) --[[ Line: 7600 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_31 (copy), v4 (copy), v2 (copy)
    local v899 = l_v5_31.new();
    if v898.condition ~= nil then
        v899.condition = v4.PropCondition.jsonDecode(v898.condition);
    end;
    if v898.literal ~= nil then
        v899.kind = {
            type = "literal", 
            value = v898.literal
        };
    end;
    if v898.binding_path ~= nil then
        v899.kind = {
            type = "binding_path", 
            value = v898.binding_path
        };
    end;
    if v898.bindingPath ~= nil then
        v899.kind = {
            type = "binding_path", 
            value = v898.bindingPath
        };
    end;
    if v898.format ~= nil then
        v899.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v898.format)
        };
    end;
    if v898.translation ~= nil then
        v899.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v898.translation)
        };
    end;
    return v899;
end;
v5.descriptor = {
    name = "ImageSetProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ImageSetProp_ConditionalOption = v5;
v1.default:register(v2.ImageSetProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_32 = v5 --[[ copy: 5 -> 38 ]];
v5.new = function(v901) --[[ Line: 7645 ]] --[[ Name: new ]]
    -- upvalues: l_v5_32 (copy)
    return (setmetatable({
        options = if not (v901 ~= nil) or v901.options == nil then {} else v901.options
    }, l_v5_32));
end;
v5.encode = function(v902) --[[ Line: 7653 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v903 = buffer.create(0);
    local v904 = 0;
    if v902.options ~= nil and #v902.options > 0 then
        for _, v906 in v902.options do
            local v907 = v906:encode();
            local v908, v909 = v0.writeTag(v903, v904, 1, v0.wireTypes.lengthDelimited);
            v908, v909 = v0.writeBuffer(v908, v909, v907, buffer.len(v907));
            v903 = v908;
            v904 = v909;
        end;
    end;
    local v910 = buffer.create(v904);
    buffer.copy(v910, 0, v903, 0, v904);
    return v910;
end;
v5.decode = function(v911) --[[ Line: 7670 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_32 (copy), v0 (copy), v2 (copy)
    local v912 = l_v5_32.new();
    local v913 = 0;
    while v913 < buffer.len(v911) do
        local v914 = nil;
        local v915 = nil;
        local v916, v917, v918 = v0.readTag(v911, v913);
        v914 = v916;
        v915 = v917;
        v913 = v918;
        if v915 == v0.wireTypes.varint then
            v916 = nil;
            v917, v918 = v0.readVarInt(v911, v913);
            v916 = v917;
            v913 = v918;
        elseif v915 == v0.wireTypes.lengthDelimited then
            if v914 == 1 then
                v916 = nil;
                v917, v918 = v0.readBuffer(v911, v913);
                v916 = v917;
                v913 = v918;
                table.insert(v912.options, v2.ImageSetProp_ConditionalOption.decode(v916));
            else
                v916 = nil;
                v917, v918 = v0.readVarInt(v911, v913);
                v913 = v918 + v917;
            end;
        elseif v915 == v0.wireTypes.i32 then
            v916 = nil;
            v917, v918 = v0.readFixed32(v911, v913);
            v916 = v917;
            v913 = v918;
        elseif v915 == v0.wireTypes.i64 then
            v916 = nil;
            v917, v918 = v0.readFixed64(v911, v913);
            v916 = v917;
            v913 = v918;
        else
            error("Unsupported wire type: " .. v915);
        end;
    end;
    return v912;
end;
v5.jsonEncode = function(v919) --[[ Line: 7713 ]] --[[ Name: jsonEncode ]]
    local v920 = {};
    if v919.options ~= nil and #v919.options > 0 then
        local v921 = {};
        for _, v923 in v919.options do
            table.insert(v921, v923:jsonEncode());
        end;
        v920.options = v921;
    end;
    return v920;
end;
v5.jsonDecode = function(v924) --[[ Line: 7727 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_32 (copy), v2 (copy)
    local v925 = l_v5_32.new();
    if v924.options ~= nil then
        local v926 = {};
        for _, v928 in v924.options do
            table.insert(v926, v2.ImageSetProp_ConditionalOption.jsonDecode(v928));
        end;
        v925.options = v926;
    end;
    return v925;
end;
v5.descriptor = {
    name = "ImageSetProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ImageSetProp_ConditionalOptions = v5;
v1.default:register(v2.ImageSetProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_33 = v5 --[[ copy: 5 -> 39 ]];
v5.new = function(v930) --[[ Line: 7756 ]] --[[ Name: new ]]
    -- upvalues: l_v5_33 (copy)
    return (setmetatable({
        kind = if not (v930 ~= nil) or v930.kind == nil then nil else v930.kind
    }, l_v5_33));
end;
v5.encode = function(v931) --[[ Line: 7762 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v932 = buffer.create(0);
    local v933 = 0;
    if v931.kind ~= nil then
        if v931.kind.type == "literal" then
            local v934, v935 = v0.writeTag(v932, v933, 1, v0.wireTypes.lengthDelimited);
            v934, v935 = v0.writeString(v934, v935, v931.kind.value);
            v932 = v934;
            v933 = v935;
        elseif v931.kind.type == "token" then
            local v936, v937 = v0.writeTag(v932, v933, 2, v0.wireTypes.lengthDelimited);
            v936, v937 = v0.writeString(v936, v937, v931.kind.value);
            v932 = v936;
            v933 = v937;
        elseif v931.kind.type == "conditional" then
            local v938 = v931.kind.value:encode();
            local v939, v940 = v0.writeTag(v932, v933, 3, v0.wireTypes.lengthDelimited);
            v939, v940 = v0.writeBuffer(v939, v940, v938, buffer.len(v938));
            v932 = v939;
            v933 = v940;
        elseif v931.kind.type == "binding_path" then
            local v941, v942 = v0.writeTag(v932, v933, 4, v0.wireTypes.lengthDelimited);
            v941, v942 = v0.writeString(v941, v942, v931.kind.value);
            v932 = v941;
            v933 = v942;
        end;
    end;
    local v943 = buffer.create(v933);
    buffer.copy(v943, 0, v932, 0, v933);
    return v943;
end;
v5.decode = function(v944) --[[ Line: 7788 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_33 (copy), v0 (copy), v2 (copy)
    local v945 = l_v5_33.new();
    local v946 = 0;
    while v946 < buffer.len(v944) do
        local v947 = nil;
        local v948 = nil;
        local v949, v950, v951 = v0.readTag(v944, v946);
        v947 = v949;
        v948 = v950;
        v946 = v951;
        if v948 == v0.wireTypes.varint then
            v949 = nil;
            v950, v951 = v0.readVarInt(v944, v946);
            v949 = v950;
            v946 = v951;
        elseif v948 == v0.wireTypes.lengthDelimited then
            if v947 == 1 then
                v949 = nil;
                v950, v951 = v0.readBuffer(v944, v946);
                v949 = v950;
                v946 = v951;
                v945.kind = {
                    type = "literal", 
                    value = buffer.tostring(v949)
                };
            elseif v947 == 2 then
                v949 = nil;
                v950, v951 = v0.readBuffer(v944, v946);
                v949 = v950;
                v946 = v951;
                v945.kind = {
                    type = "token", 
                    value = buffer.tostring(v949)
                };
            elseif v947 == 3 then
                v949 = nil;
                v950, v951 = v0.readBuffer(v944, v946);
                v949 = v950;
                v946 = v951;
                v945.kind = {
                    type = "conditional", 
                    value = v2.ColorProp_ConditionalOptions.decode(v949)
                };
            elseif v947 == 4 then
                v949 = nil;
                v950, v951 = v0.readBuffer(v944, v946);
                v949 = v950;
                v946 = v951;
                v945.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v949)
                };
            else
                v949 = nil;
                v950, v951 = v0.readVarInt(v944, v946);
                v946 = v951 + v950;
            end;
        elseif v948 == v0.wireTypes.i32 then
            v949 = nil;
            v950, v951 = v0.readFixed32(v944, v946);
            v949 = v950;
            v946 = v951;
        elseif v948 == v0.wireTypes.i64 then
            v949 = nil;
            v950, v951 = v0.readFixed64(v944, v946);
            v949 = v950;
            v946 = v951;
        else
            error("Unsupported wire type: " .. v948);
        end;
    end;
    return v945;
end;
v5.jsonEncode = function(v952) --[[ Line: 7846 ]] --[[ Name: jsonEncode ]]
    local v953 = {};
    if v952.kind ~= nil then
        if v952.kind.type == "literal" then
            v953.literal = v952.kind.value;
            return v953;
        elseif v952.kind.type == "token" then
            v953.token = v952.kind.value;
            return v953;
        elseif v952.kind.type == "conditional" then
            v953.conditional = v952.kind.value:jsonEncode();
            return v953;
        elseif v952.kind.type == "binding_path" then
            v953.bindingPath = v952.kind.value;
        end;
    end;
    return v953;
end;
v5.jsonDecode = function(v954) --[[ Line: 7864 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_33 (copy), v2 (copy)
    local v955 = l_v5_33.new();
    if v954.literal ~= nil then
        v955.kind = {
            type = "literal", 
            value = v954.literal
        };
    end;
    if v954.token ~= nil then
        v955.kind = {
            type = "token", 
            value = v954.token
        };
    end;
    if v954.conditional ~= nil then
        v955.kind = {
            type = "conditional", 
            value = v2.ColorProp_ConditionalOptions.jsonDecode(v954.conditional)
        };
    end;
    if v954.binding_path ~= nil then
        v955.kind = {
            type = "binding_path", 
            value = v954.binding_path
        };
    end;
    if v954.bindingPath ~= nil then
        v955.kind = {
            type = "binding_path", 
            value = v954.bindingPath
        };
    end;
    return v955;
end;
v5.descriptor = {
    name = "ColorProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
};
v2.ColorProp = v5;
v1.default:register(v2.ColorProp);
v5 = {};
v5.__index = v5;
local l_v5_34 = v5 --[[ copy: 5 -> 40 ]];
v5.new = function(v957) --[[ Line: 7905 ]] --[[ Name: new ]]
    -- upvalues: l_v5_34 (copy)
    return (setmetatable({
        condition = if not (v957 ~= nil) or v957.condition == nil then nil else v957.condition, 
        kind = if not (v957 ~= nil) or v957.kind == nil then nil else v957.kind
    }, l_v5_34));
end;
v5.encode = function(v958) --[[ Line: 7914 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v959 = buffer.create(0);
    local v960 = 0;
    if v958.condition ~= nil then
        local v961 = v958.condition:encode();
        local v962, v963 = v0.writeTag(v959, v960, 1, v0.wireTypes.lengthDelimited);
        v962, v963 = v0.writeBuffer(v962, v963, v961, buffer.len(v961));
        v959 = v962;
        v960 = v963;
    end;
    if v958.kind ~= nil then
        if v958.kind.type == "literal" then
            local v964, v965 = v0.writeTag(v959, v960, 2, v0.wireTypes.lengthDelimited);
            v964, v965 = v0.writeString(v964, v965, v958.kind.value);
            v959 = v964;
            v960 = v965;
        elseif v958.kind.type == "token" then
            local v966, v967 = v0.writeTag(v959, v960, 3, v0.wireTypes.lengthDelimited);
            v966, v967 = v0.writeString(v966, v967, v958.kind.value);
            v959 = v966;
            v960 = v967;
        elseif v958.kind.type == "binding_path" then
            local v968, v969 = v0.writeTag(v959, v960, 4, v0.wireTypes.lengthDelimited);
            v968, v969 = v0.writeString(v968, v969, v958.kind.value);
            v959 = v968;
            v960 = v969;
        end;
    end;
    local v970 = buffer.create(v960);
    buffer.copy(v970, 0, v959, 0, v960);
    return v970;
end;
v5.decode = function(v971) --[[ Line: 7942 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_34 (copy), v0 (copy), v4 (copy)
    local v972 = l_v5_34.new();
    local v973 = 0;
    while v973 < buffer.len(v971) do
        local v974 = nil;
        local v975 = nil;
        local v976, v977, v978 = v0.readTag(v971, v973);
        v974 = v976;
        v975 = v977;
        v973 = v978;
        if v975 == v0.wireTypes.varint then
            v976 = nil;
            v977, v978 = v0.readVarInt(v971, v973);
            v976 = v977;
            v973 = v978;
        elseif v975 == v0.wireTypes.lengthDelimited then
            if v974 == 1 then
                v976 = nil;
                v977, v978 = v0.readBuffer(v971, v973);
                v976 = v977;
                v973 = v978;
                v972.condition = v4.PropCondition.decode(v976);
            elseif v974 == 2 then
                v976 = nil;
                v977, v978 = v0.readBuffer(v971, v973);
                v976 = v977;
                v973 = v978;
                v972.kind = {
                    type = "literal", 
                    value = buffer.tostring(v976)
                };
            elseif v974 == 3 then
                v976 = nil;
                v977, v978 = v0.readBuffer(v971, v973);
                v976 = v977;
                v973 = v978;
                v972.kind = {
                    type = "token", 
                    value = buffer.tostring(v976)
                };
            elseif v974 == 4 then
                v976 = nil;
                v977, v978 = v0.readBuffer(v971, v973);
                v976 = v977;
                v973 = v978;
                v972.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v976)
                };
            else
                v976 = nil;
                v977, v978 = v0.readVarInt(v971, v973);
                v973 = v978 + v977;
            end;
        elseif v975 == v0.wireTypes.i32 then
            v976 = nil;
            v977, v978 = v0.readFixed32(v971, v973);
            v976 = v977;
            v973 = v978;
        elseif v975 == v0.wireTypes.i64 then
            v976 = nil;
            v977, v978 = v0.readFixed64(v971, v973);
            v976 = v977;
            v973 = v978;
        else
            error("Unsupported wire type: " .. v975);
        end;
    end;
    return v972;
end;
v5.jsonEncode = function(v979) --[[ Line: 8000 ]] --[[ Name: jsonEncode ]]
    local v980 = {};
    if v979.condition ~= nil then
        v980.condition = v979.condition:jsonEncode();
    end;
    if v979.kind ~= nil then
        if v979.kind.type == "literal" then
            v980.literal = v979.kind.value;
            return v980;
        elseif v979.kind.type == "token" then
            v980.token = v979.kind.value;
            return v980;
        elseif v979.kind.type == "binding_path" then
            v980.bindingPath = v979.kind.value;
        end;
    end;
    return v980;
end;
v5.jsonDecode = function(v981) --[[ Line: 8020 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_34 (copy), v4 (copy)
    local v982 = l_v5_34.new();
    if v981.condition ~= nil then
        v982.condition = v4.PropCondition.jsonDecode(v981.condition);
    end;
    if v981.literal ~= nil then
        v982.kind = {
            type = "literal", 
            value = v981.literal
        };
    end;
    if v981.token ~= nil then
        v982.kind = {
            type = "token", 
            value = v981.token
        };
    end;
    if v981.binding_path ~= nil then
        v982.kind = {
            type = "binding_path", 
            value = v981.binding_path
        };
    end;
    if v981.bindingPath ~= nil then
        v982.kind = {
            type = "binding_path", 
            value = v981.bindingPath
        };
    end;
    return v982;
end;
v5.descriptor = {
    name = "ColorProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ColorProp_ConditionalOption = v5;
v1.default:register(v2.ColorProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_35 = v5 --[[ copy: 5 -> 41 ]];
v5.new = function(v984) --[[ Line: 8061 ]] --[[ Name: new ]]
    -- upvalues: l_v5_35 (copy)
    return (setmetatable({
        options = if not (v984 ~= nil) or v984.options == nil then {} else v984.options
    }, l_v5_35));
end;
v5.encode = function(v985) --[[ Line: 8069 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v986 = buffer.create(0);
    local v987 = 0;
    if v985.options ~= nil and #v985.options > 0 then
        for _, v989 in v985.options do
            local v990 = v989:encode();
            local v991, v992 = v0.writeTag(v986, v987, 1, v0.wireTypes.lengthDelimited);
            v991, v992 = v0.writeBuffer(v991, v992, v990, buffer.len(v990));
            v986 = v991;
            v987 = v992;
        end;
    end;
    local v993 = buffer.create(v987);
    buffer.copy(v993, 0, v986, 0, v987);
    return v993;
end;
v5.decode = function(v994) --[[ Line: 8086 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_35 (copy), v0 (copy), v2 (copy)
    local v995 = l_v5_35.new();
    local v996 = 0;
    while v996 < buffer.len(v994) do
        local v997 = nil;
        local v998 = nil;
        local v999, v1000, v1001 = v0.readTag(v994, v996);
        v997 = v999;
        v998 = v1000;
        v996 = v1001;
        if v998 == v0.wireTypes.varint then
            v999 = nil;
            v1000, v1001 = v0.readVarInt(v994, v996);
            v999 = v1000;
            v996 = v1001;
        elseif v998 == v0.wireTypes.lengthDelimited then
            if v997 == 1 then
                v999 = nil;
                v1000, v1001 = v0.readBuffer(v994, v996);
                v999 = v1000;
                v996 = v1001;
                table.insert(v995.options, v2.ColorProp_ConditionalOption.decode(v999));
            else
                v999 = nil;
                v1000, v1001 = v0.readVarInt(v994, v996);
                v996 = v1001 + v1000;
            end;
        elseif v998 == v0.wireTypes.i32 then
            v999 = nil;
            v1000, v1001 = v0.readFixed32(v994, v996);
            v999 = v1000;
            v996 = v1001;
        elseif v998 == v0.wireTypes.i64 then
            v999 = nil;
            v1000, v1001 = v0.readFixed64(v994, v996);
            v999 = v1000;
            v996 = v1001;
        else
            error("Unsupported wire type: " .. v998);
        end;
    end;
    return v995;
end;
v5.jsonEncode = function(v1002) --[[ Line: 8129 ]] --[[ Name: jsonEncode ]]
    local v1003 = {};
    if v1002.options ~= nil and #v1002.options > 0 then
        local v1004 = {};
        for _, v1006 in v1002.options do
            table.insert(v1004, v1006:jsonEncode());
        end;
        v1003.options = v1004;
    end;
    return v1003;
end;
v5.jsonDecode = function(v1007) --[[ Line: 8143 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_35 (copy), v2 (copy)
    local v1008 = l_v5_35.new();
    if v1007.options ~= nil then
        local v1009 = {};
        for _, v1011 in v1007.options do
            table.insert(v1009, v2.ColorProp_ConditionalOption.jsonDecode(v1011));
        end;
        v1008.options = v1009;
    end;
    return v1008;
end;
v5.descriptor = {
    name = "ColorProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ColorProp_ConditionalOptions = v5;
v1.default:register(v2.ColorProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_36 = v5 --[[ copy: 5 -> 42 ]];
v5.new = function(v1013) --[[ Line: 8172 ]] --[[ Name: new ]]
    -- upvalues: l_v5_36 (copy)
    return (setmetatable({
        kind = if not (v1013 ~= nil) or v1013.kind == nil then nil else v1013.kind
    }, l_v5_36));
end;
v5.encode = function(v1014) --[[ Line: 8178 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1015 = buffer.create(0);
    local v1016 = 0;
    if v1014.kind ~= nil then
        if v1014.kind.type == "token" then
            local v1017, v1018 = v0.writeTag(v1015, v1016, 1, v0.wireTypes.lengthDelimited);
            v1017, v1018 = v0.writeString(v1017, v1018, v1014.kind.value);
            v1015 = v1017;
            v1016 = v1018;
        elseif v1014.kind.type == "conditional" then
            local v1019 = v1014.kind.value:encode();
            local v1020, v1021 = v0.writeTag(v1015, v1016, 2, v0.wireTypes.lengthDelimited);
            v1020, v1021 = v0.writeBuffer(v1020, v1021, v1019, buffer.len(v1019));
            v1015 = v1020;
            v1016 = v1021;
        end;
    end;
    local v1022 = buffer.create(v1016);
    buffer.copy(v1022, 0, v1015, 0, v1016);
    return v1022;
end;
v5.decode = function(v1023) --[[ Line: 8198 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_36 (copy), v0 (copy), v2 (copy)
    local v1024 = l_v5_36.new();
    local v1025 = 0;
    while v1025 < buffer.len(v1023) do
        local v1026 = nil;
        local v1027 = nil;
        local v1028, v1029, v1030 = v0.readTag(v1023, v1025);
        v1026 = v1028;
        v1027 = v1029;
        v1025 = v1030;
        if v1027 == v0.wireTypes.varint then
            v1028 = nil;
            v1029, v1030 = v0.readVarInt(v1023, v1025);
            v1028 = v1029;
            v1025 = v1030;
        elseif v1027 == v0.wireTypes.lengthDelimited then
            if v1026 == 1 then
                v1028 = nil;
                v1029, v1030 = v0.readBuffer(v1023, v1025);
                v1028 = v1029;
                v1025 = v1030;
                v1024.kind = {
                    type = "token", 
                    value = buffer.tostring(v1028)
                };
            elseif v1026 == 2 then
                v1028 = nil;
                v1029, v1030 = v0.readBuffer(v1023, v1025);
                v1028 = v1029;
                v1025 = v1030;
                v1024.kind = {
                    type = "conditional", 
                    value = v2.TypographyProp_ConditionalOptions.decode(v1028)
                };
            else
                v1028 = nil;
                v1029, v1030 = v0.readVarInt(v1023, v1025);
                v1025 = v1030 + v1029;
            end;
        elseif v1027 == v0.wireTypes.i32 then
            v1028 = nil;
            v1029, v1030 = v0.readFixed32(v1023, v1025);
            v1028 = v1029;
            v1025 = v1030;
        elseif v1027 == v0.wireTypes.i64 then
            v1028 = nil;
            v1029, v1030 = v0.readFixed64(v1023, v1025);
            v1028 = v1029;
            v1025 = v1030;
        else
            error("Unsupported wire type: " .. v1027);
        end;
    end;
    return v1024;
end;
v5.jsonEncode = function(v1031) --[[ Line: 8247 ]] --[[ Name: jsonEncode ]]
    local v1032 = {};
    if v1031.kind ~= nil then
        if v1031.kind.type == "token" then
            v1032.token = v1031.kind.value;
            return v1032;
        elseif v1031.kind.type == "conditional" then
            v1032.conditional = v1031.kind.value:jsonEncode();
        end;
    end;
    return v1032;
end;
v5.jsonDecode = function(v1033) --[[ Line: 8261 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_36 (copy), v2 (copy)
    local v1034 = l_v5_36.new();
    if v1033.token ~= nil then
        v1034.kind = {
            type = "token", 
            value = v1033.token
        };
    end;
    if v1033.conditional ~= nil then
        v1034.kind = {
            type = "conditional", 
            value = v2.TypographyProp_ConditionalOptions.jsonDecode(v1033.conditional)
        };
    end;
    return v1034;
end;
v5.descriptor = {
    name = "TypographyProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
};
v2.TypographyProp = v5;
v1.default:register(v2.TypographyProp);
v5 = {};
v5.__index = v5;
local l_v5_37 = v5 --[[ copy: 5 -> 43 ]];
v5.new = function(v1036) --[[ Line: 8292 ]] --[[ Name: new ]]
    -- upvalues: l_v5_37 (copy)
    return (setmetatable({
        condition = if not (v1036 ~= nil) or v1036.condition == nil then nil else v1036.condition, 
        kind = if not (v1036 ~= nil) or v1036.kind == nil then nil else v1036.kind
    }, l_v5_37));
end;
v5.encode = function(v1037) --[[ Line: 8301 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1038 = buffer.create(0);
    local v1039 = 0;
    if v1037.condition ~= nil then
        local v1040 = v1037.condition:encode();
        local v1041, v1042 = v0.writeTag(v1038, v1039, 1, v0.wireTypes.lengthDelimited);
        v1041, v1042 = v0.writeBuffer(v1041, v1042, v1040, buffer.len(v1040));
        v1038 = v1041;
        v1039 = v1042;
    end;
    if v1037.kind ~= nil and v1037.kind.type == "token" then
        local v1043, v1044 = v0.writeTag(v1038, v1039, 2, v0.wireTypes.lengthDelimited);
        v1043, v1044 = v0.writeString(v1043, v1044, v1037.kind.value);
        v1038 = v1043;
        v1039 = v1044;
    end;
    local v1045 = buffer.create(v1039);
    buffer.copy(v1045, 0, v1038, 0, v1039);
    return v1045;
end;
v5.decode = function(v1046) --[[ Line: 8323 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_37 (copy), v0 (copy), v4 (copy)
    local v1047 = l_v5_37.new();
    local v1048 = 0;
    while v1048 < buffer.len(v1046) do
        local v1049 = nil;
        local v1050 = nil;
        local v1051, v1052, v1053 = v0.readTag(v1046, v1048);
        v1049 = v1051;
        v1050 = v1052;
        v1048 = v1053;
        if v1050 == v0.wireTypes.varint then
            v1051 = nil;
            v1052, v1053 = v0.readVarInt(v1046, v1048);
            v1051 = v1052;
            v1048 = v1053;
        elseif v1050 == v0.wireTypes.lengthDelimited then
            if v1049 == 1 then
                v1051 = nil;
                v1052, v1053 = v0.readBuffer(v1046, v1048);
                v1051 = v1052;
                v1048 = v1053;
                v1047.condition = v4.PropCondition.decode(v1051);
            elseif v1049 == 2 then
                v1051 = nil;
                v1052, v1053 = v0.readBuffer(v1046, v1048);
                v1051 = v1052;
                v1048 = v1053;
                v1047.kind = {
                    type = "token", 
                    value = buffer.tostring(v1051)
                };
            else
                v1051 = nil;
                v1052, v1053 = v0.readVarInt(v1046, v1048);
                v1048 = v1053 + v1052;
            end;
        elseif v1050 == v0.wireTypes.i32 then
            v1051 = nil;
            v1052, v1053 = v0.readFixed32(v1046, v1048);
            v1051 = v1052;
            v1048 = v1053;
        elseif v1050 == v0.wireTypes.i64 then
            v1051 = nil;
            v1052, v1053 = v0.readFixed64(v1046, v1048);
            v1051 = v1052;
            v1048 = v1053;
        else
            error("Unsupported wire type: " .. v1050);
        end;
    end;
    return v1047;
end;
v5.jsonEncode = function(v1054) --[[ Line: 8371 ]] --[[ Name: jsonEncode ]]
    local v1055 = {};
    if v1054.condition ~= nil then
        v1055.condition = v1054.condition:jsonEncode();
    end;
    if v1054.kind ~= nil and v1054.kind.type == "token" then
        v1055.token = v1054.kind.value;
    end;
    return v1055;
end;
v5.jsonDecode = function(v1056) --[[ Line: 8387 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_37 (copy), v4 (copy)
    local v1057 = l_v5_37.new();
    if v1056.condition ~= nil then
        v1057.condition = v4.PropCondition.jsonDecode(v1056.condition);
    end;
    if v1056.token ~= nil then
        v1057.kind = {
            type = "token", 
            value = v1056.token
        };
    end;
    return v1057;
end;
v5.descriptor = {
    name = "TypographyProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TypographyProp_ConditionalOption = v5;
v1.default:register(v2.TypographyProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_38 = v5 --[[ copy: 5 -> 44 ]];
v5.new = function(v1059) --[[ Line: 8418 ]] --[[ Name: new ]]
    -- upvalues: l_v5_38 (copy)
    return (setmetatable({
        options = if not (v1059 ~= nil) or v1059.options == nil then {} else v1059.options
    }, l_v5_38));
end;
v5.encode = function(v1060) --[[ Line: 8426 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1061 = buffer.create(0);
    local v1062 = 0;
    if v1060.options ~= nil and #v1060.options > 0 then
        for _, v1064 in v1060.options do
            local v1065 = v1064:encode();
            local v1066, v1067 = v0.writeTag(v1061, v1062, 1, v0.wireTypes.lengthDelimited);
            v1066, v1067 = v0.writeBuffer(v1066, v1067, v1065, buffer.len(v1065));
            v1061 = v1066;
            v1062 = v1067;
        end;
    end;
    local v1068 = buffer.create(v1062);
    buffer.copy(v1068, 0, v1061, 0, v1062);
    return v1068;
end;
v5.decode = function(v1069) --[[ Line: 8443 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_38 (copy), v0 (copy), v2 (copy)
    local v1070 = l_v5_38.new();
    local v1071 = 0;
    while v1071 < buffer.len(v1069) do
        local v1072 = nil;
        local v1073 = nil;
        local v1074, v1075, v1076 = v0.readTag(v1069, v1071);
        v1072 = v1074;
        v1073 = v1075;
        v1071 = v1076;
        if v1073 == v0.wireTypes.varint then
            v1074 = nil;
            v1075, v1076 = v0.readVarInt(v1069, v1071);
            v1074 = v1075;
            v1071 = v1076;
        elseif v1073 == v0.wireTypes.lengthDelimited then
            if v1072 == 1 then
                v1074 = nil;
                v1075, v1076 = v0.readBuffer(v1069, v1071);
                v1074 = v1075;
                v1071 = v1076;
                table.insert(v1070.options, v2.TypographyProp_ConditionalOption.decode(v1074));
            else
                v1074 = nil;
                v1075, v1076 = v0.readVarInt(v1069, v1071);
                v1071 = v1076 + v1075;
            end;
        elseif v1073 == v0.wireTypes.i32 then
            v1074 = nil;
            v1075, v1076 = v0.readFixed32(v1069, v1071);
            v1074 = v1075;
            v1071 = v1076;
        elseif v1073 == v0.wireTypes.i64 then
            v1074 = nil;
            v1075, v1076 = v0.readFixed64(v1069, v1071);
            v1074 = v1075;
            v1071 = v1076;
        else
            error("Unsupported wire type: " .. v1073);
        end;
    end;
    return v1070;
end;
v5.jsonEncode = function(v1077) --[[ Line: 8486 ]] --[[ Name: jsonEncode ]]
    local v1078 = {};
    if v1077.options ~= nil and #v1077.options > 0 then
        local v1079 = {};
        for _, v1081 in v1077.options do
            table.insert(v1079, v1081:jsonEncode());
        end;
        v1078.options = v1079;
    end;
    return v1078;
end;
v5.jsonDecode = function(v1082) --[[ Line: 8500 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_38 (copy), v2 (copy)
    local v1083 = l_v5_38.new();
    if v1082.options ~= nil then
        local v1084 = {};
        for _, v1086 in v1082.options do
            table.insert(v1084, v2.TypographyProp_ConditionalOption.jsonDecode(v1086));
        end;
        v1083.options = v1084;
    end;
    return v1083;
end;
v5.descriptor = {
    name = "TypographyProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TypographyProp_ConditionalOptions = v5;
v1.default:register(v2.TypographyProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_39 = v5 --[[ copy: 5 -> 45 ]];
v5.new = function(v1088) --[[ Line: 8531 ]] --[[ Name: new ]]
    -- upvalues: l_v5_39 (copy)
    return (setmetatable({
        kind = if not (v1088 ~= nil) or v1088.kind == nil then nil else v1088.kind
    }, l_v5_39));
end;
v5.encode = function(v1089) --[[ Line: 8537 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1090 = buffer.create(0);
    local v1091 = 0;
    if v1089.kind ~= nil then
        if v1089.kind.type == "token" then
            local v1092, v1093 = v0.writeTag(v1090, v1091, 1, v0.wireTypes.lengthDelimited);
            v1092, v1093 = v0.writeString(v1092, v1093, v1089.kind.value);
            v1090 = v1092;
            v1091 = v1093;
        elseif v1089.kind.type == "conditional" then
            local v1094 = v1089.kind.value:encode();
            local v1095, v1096 = v0.writeTag(v1090, v1091, 2, v0.wireTypes.lengthDelimited);
            v1095, v1096 = v0.writeBuffer(v1095, v1096, v1094, buffer.len(v1094));
            v1090 = v1095;
            v1091 = v1096;
        end;
    end;
    local v1097 = buffer.create(v1091);
    buffer.copy(v1097, 0, v1090, 0, v1091);
    return v1097;
end;
v5.decode = function(v1098) --[[ Line: 8557 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_39 (copy), v0 (copy), v2 (copy)
    local v1099 = l_v5_39.new();
    local v1100 = 0;
    while v1100 < buffer.len(v1098) do
        local v1101 = nil;
        local v1102 = nil;
        local v1103, v1104, v1105 = v0.readTag(v1098, v1100);
        v1101 = v1103;
        v1102 = v1104;
        v1100 = v1105;
        if v1102 == v0.wireTypes.varint then
            v1103 = nil;
            v1104, v1105 = v0.readVarInt(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        elseif v1102 == v0.wireTypes.lengthDelimited then
            if v1101 == 1 then
                v1103 = nil;
                v1104, v1105 = v0.readBuffer(v1098, v1100);
                v1103 = v1104;
                v1100 = v1105;
                v1099.kind = {
                    type = "token", 
                    value = buffer.tostring(v1103)
                };
            elseif v1101 == 2 then
                v1103 = nil;
                v1104, v1105 = v0.readBuffer(v1098, v1100);
                v1103 = v1104;
                v1100 = v1105;
                v1099.kind = {
                    type = "conditional", 
                    value = v2.TypographyFontProp_ConditionalOptions.decode(v1103)
                };
            else
                v1103 = nil;
                v1104, v1105 = v0.readVarInt(v1098, v1100);
                v1100 = v1105 + v1104;
            end;
        elseif v1102 == v0.wireTypes.i32 then
            v1103 = nil;
            v1104, v1105 = v0.readFixed32(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        elseif v1102 == v0.wireTypes.i64 then
            v1103 = nil;
            v1104, v1105 = v0.readFixed64(v1098, v1100);
            v1103 = v1104;
            v1100 = v1105;
        else
            error("Unsupported wire type: " .. v1102);
        end;
    end;
    return v1099;
end;
v5.jsonEncode = function(v1106) --[[ Line: 8606 ]] --[[ Name: jsonEncode ]]
    local v1107 = {};
    if v1106.kind ~= nil then
        if v1106.kind.type == "token" then
            v1107.token = v1106.kind.value;
            return v1107;
        elseif v1106.kind.type == "conditional" then
            v1107.conditional = v1106.kind.value:jsonEncode();
        end;
    end;
    return v1107;
end;
v5.jsonDecode = function(v1108) --[[ Line: 8620 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_39 (copy), v2 (copy)
    local v1109 = l_v5_39.new();
    if v1108.token ~= nil then
        v1109.kind = {
            type = "token", 
            value = v1108.token
        };
    end;
    if v1108.conditional ~= nil then
        v1109.kind = {
            type = "conditional", 
            value = v2.TypographyFontProp_ConditionalOptions.jsonDecode(v1108.conditional)
        };
    end;
    return v1109;
end;
v5.descriptor = {
    name = "TypographyFontProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
};
v2.TypographyFontProp = v5;
v1.default:register(v2.TypographyFontProp);
v5 = {};
v5.__index = v5;
local l_v5_40 = v5 --[[ copy: 5 -> 46 ]];
v5.new = function(v1111) --[[ Line: 8651 ]] --[[ Name: new ]]
    -- upvalues: l_v5_40 (copy)
    return (setmetatable({
        condition = if not (v1111 ~= nil) or v1111.condition == nil then nil else v1111.condition, 
        kind = if not (v1111 ~= nil) or v1111.kind == nil then nil else v1111.kind
    }, l_v5_40));
end;
v5.encode = function(v1112) --[[ Line: 8660 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1113 = buffer.create(0);
    local v1114 = 0;
    if v1112.condition ~= nil then
        local v1115 = v1112.condition:encode();
        local v1116, v1117 = v0.writeTag(v1113, v1114, 1, v0.wireTypes.lengthDelimited);
        v1116, v1117 = v0.writeBuffer(v1116, v1117, v1115, buffer.len(v1115));
        v1113 = v1116;
        v1114 = v1117;
    end;
    if v1112.kind ~= nil and v1112.kind.type == "token" then
        local v1118, v1119 = v0.writeTag(v1113, v1114, 2, v0.wireTypes.lengthDelimited);
        v1118, v1119 = v0.writeString(v1118, v1119, v1112.kind.value);
        v1113 = v1118;
        v1114 = v1119;
    end;
    local v1120 = buffer.create(v1114);
    buffer.copy(v1120, 0, v1113, 0, v1114);
    return v1120;
end;
v5.decode = function(v1121) --[[ Line: 8682 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_40 (copy), v0 (copy), v4 (copy)
    local v1122 = l_v5_40.new();
    local v1123 = 0;
    while v1123 < buffer.len(v1121) do
        local v1124 = nil;
        local v1125 = nil;
        local v1126, v1127, v1128 = v0.readTag(v1121, v1123);
        v1124 = v1126;
        v1125 = v1127;
        v1123 = v1128;
        if v1125 == v0.wireTypes.varint then
            v1126 = nil;
            v1127, v1128 = v0.readVarInt(v1121, v1123);
            v1126 = v1127;
            v1123 = v1128;
        elseif v1125 == v0.wireTypes.lengthDelimited then
            if v1124 == 1 then
                v1126 = nil;
                v1127, v1128 = v0.readBuffer(v1121, v1123);
                v1126 = v1127;
                v1123 = v1128;
                v1122.condition = v4.PropCondition.decode(v1126);
            elseif v1124 == 2 then
                v1126 = nil;
                v1127, v1128 = v0.readBuffer(v1121, v1123);
                v1126 = v1127;
                v1123 = v1128;
                v1122.kind = {
                    type = "token", 
                    value = buffer.tostring(v1126)
                };
            else
                v1126 = nil;
                v1127, v1128 = v0.readVarInt(v1121, v1123);
                v1123 = v1128 + v1127;
            end;
        elseif v1125 == v0.wireTypes.i32 then
            v1126 = nil;
            v1127, v1128 = v0.readFixed32(v1121, v1123);
            v1126 = v1127;
            v1123 = v1128;
        elseif v1125 == v0.wireTypes.i64 then
            v1126 = nil;
            v1127, v1128 = v0.readFixed64(v1121, v1123);
            v1126 = v1127;
            v1123 = v1128;
        else
            error("Unsupported wire type: " .. v1125);
        end;
    end;
    return v1122;
end;
v5.jsonEncode = function(v1129) --[[ Line: 8730 ]] --[[ Name: jsonEncode ]]
    local v1130 = {};
    if v1129.condition ~= nil then
        v1130.condition = v1129.condition:jsonEncode();
    end;
    if v1129.kind ~= nil and v1129.kind.type == "token" then
        v1130.token = v1129.kind.value;
    end;
    return v1130;
end;
v5.jsonDecode = function(v1131) --[[ Line: 8746 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_40 (copy), v4 (copy)
    local v1132 = l_v5_40.new();
    if v1131.condition ~= nil then
        v1132.condition = v4.PropCondition.jsonDecode(v1131.condition);
    end;
    if v1131.token ~= nil then
        v1132.kind = {
            type = "token", 
            value = v1131.token
        };
    end;
    return v1132;
end;
v5.descriptor = {
    name = "TypographyFontProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TypographyFontProp_ConditionalOption = v5;
v1.default:register(v2.TypographyFontProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_41 = v5 --[[ copy: 5 -> 47 ]];
v5.new = function(v1134) --[[ Line: 8777 ]] --[[ Name: new ]]
    -- upvalues: l_v5_41 (copy)
    return (setmetatable({
        options = if not (v1134 ~= nil) or v1134.options == nil then {} else v1134.options
    }, l_v5_41));
end;
v5.encode = function(v1135) --[[ Line: 8785 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1136 = buffer.create(0);
    local v1137 = 0;
    if v1135.options ~= nil and #v1135.options > 0 then
        for _, v1139 in v1135.options do
            local v1140 = v1139:encode();
            local v1141, v1142 = v0.writeTag(v1136, v1137, 1, v0.wireTypes.lengthDelimited);
            v1141, v1142 = v0.writeBuffer(v1141, v1142, v1140, buffer.len(v1140));
            v1136 = v1141;
            v1137 = v1142;
        end;
    end;
    local v1143 = buffer.create(v1137);
    buffer.copy(v1143, 0, v1136, 0, v1137);
    return v1143;
end;
v5.decode = function(v1144) --[[ Line: 8802 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_41 (copy), v0 (copy), v2 (copy)
    local v1145 = l_v5_41.new();
    local v1146 = 0;
    while v1146 < buffer.len(v1144) do
        local v1147 = nil;
        local v1148 = nil;
        local v1149, v1150, v1151 = v0.readTag(v1144, v1146);
        v1147 = v1149;
        v1148 = v1150;
        v1146 = v1151;
        if v1148 == v0.wireTypes.varint then
            v1149 = nil;
            v1150, v1151 = v0.readVarInt(v1144, v1146);
            v1149 = v1150;
            v1146 = v1151;
        elseif v1148 == v0.wireTypes.lengthDelimited then
            if v1147 == 1 then
                v1149 = nil;
                v1150, v1151 = v0.readBuffer(v1144, v1146);
                v1149 = v1150;
                v1146 = v1151;
                table.insert(v1145.options, v2.TypographyFontProp_ConditionalOption.decode(v1149));
            else
                v1149 = nil;
                v1150, v1151 = v0.readVarInt(v1144, v1146);
                v1146 = v1151 + v1150;
            end;
        elseif v1148 == v0.wireTypes.i32 then
            v1149 = nil;
            v1150, v1151 = v0.readFixed32(v1144, v1146);
            v1149 = v1150;
            v1146 = v1151;
        elseif v1148 == v0.wireTypes.i64 then
            v1149 = nil;
            v1150, v1151 = v0.readFixed64(v1144, v1146);
            v1149 = v1150;
            v1146 = v1151;
        else
            error("Unsupported wire type: " .. v1148);
        end;
    end;
    return v1145;
end;
v5.jsonEncode = function(v1152) --[[ Line: 8845 ]] --[[ Name: jsonEncode ]]
    local v1153 = {};
    if v1152.options ~= nil and #v1152.options > 0 then
        local v1154 = {};
        for _, v1156 in v1152.options do
            table.insert(v1154, v1156:jsonEncode());
        end;
        v1153.options = v1154;
    end;
    return v1153;
end;
v5.jsonDecode = function(v1157) --[[ Line: 8859 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_41 (copy), v2 (copy)
    local v1158 = l_v5_41.new();
    if v1157.options ~= nil then
        local v1159 = {};
        for _, v1161 in v1157.options do
            table.insert(v1159, v2.TypographyFontProp_ConditionalOption.jsonDecode(v1161));
        end;
        v1158.options = v1159;
    end;
    return v1158;
end;
v5.descriptor = {
    name = "TypographyFontProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TypographyFontProp_ConditionalOptions = v5;
v1.default:register(v2.TypographyFontProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_42 = v5 --[[ copy: 5 -> 48 ]];
v5.new = function(v1163) --[[ Line: 8890 ]] --[[ Name: new ]]
    -- upvalues: l_v5_42 (copy)
    return (setmetatable({
        kind = if not (v1163 ~= nil) or v1163.kind == nil then nil else v1163.kind
    }, l_v5_42));
end;
v5.encode = function(v1164) --[[ Line: 8896 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1165 = buffer.create(0);
    local v1166 = 0;
    if v1164.kind ~= nil then
        if v1164.kind.type == "token" then
            local v1167, v1168 = v0.writeTag(v1165, v1166, 1, v0.wireTypes.lengthDelimited);
            v1167, v1168 = v0.writeString(v1167, v1168, v1164.kind.value);
            v1165 = v1167;
            v1166 = v1168;
        elseif v1164.kind.type == "conditional" then
            local v1169 = v1164.kind.value:encode();
            local v1170, v1171 = v0.writeTag(v1165, v1166, 2, v0.wireTypes.lengthDelimited);
            v1170, v1171 = v0.writeBuffer(v1170, v1171, v1169, buffer.len(v1169));
            v1165 = v1170;
            v1166 = v1171;
        end;
    end;
    local v1172 = buffer.create(v1166);
    buffer.copy(v1172, 0, v1165, 0, v1166);
    return v1172;
end;
v5.decode = function(v1173) --[[ Line: 8916 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_42 (copy), v0 (copy), v2 (copy)
    local v1174 = l_v5_42.new();
    local v1175 = 0;
    while v1175 < buffer.len(v1173) do
        local v1176 = nil;
        local v1177 = nil;
        local v1178, v1179, v1180 = v0.readTag(v1173, v1175);
        v1176 = v1178;
        v1177 = v1179;
        v1175 = v1180;
        if v1177 == v0.wireTypes.varint then
            v1178 = nil;
            v1179, v1180 = v0.readVarInt(v1173, v1175);
            v1178 = v1179;
            v1175 = v1180;
        elseif v1177 == v0.wireTypes.lengthDelimited then
            if v1176 == 1 then
                v1178 = nil;
                v1179, v1180 = v0.readBuffer(v1173, v1175);
                v1178 = v1179;
                v1175 = v1180;
                v1174.kind = {
                    type = "token", 
                    value = buffer.tostring(v1178)
                };
            elseif v1176 == 2 then
                v1178 = nil;
                v1179, v1180 = v0.readBuffer(v1173, v1175);
                v1178 = v1179;
                v1175 = v1180;
                v1174.kind = {
                    type = "conditional", 
                    value = v2.ColorStyleProp_ConditionalOptions.decode(v1178)
                };
            else
                v1178 = nil;
                v1179, v1180 = v0.readVarInt(v1173, v1175);
                v1175 = v1180 + v1179;
            end;
        elseif v1177 == v0.wireTypes.i32 then
            v1178 = nil;
            v1179, v1180 = v0.readFixed32(v1173, v1175);
            v1178 = v1179;
            v1175 = v1180;
        elseif v1177 == v0.wireTypes.i64 then
            v1178 = nil;
            v1179, v1180 = v0.readFixed64(v1173, v1175);
            v1178 = v1179;
            v1175 = v1180;
        else
            error("Unsupported wire type: " .. v1177);
        end;
    end;
    return v1174;
end;
v5.jsonEncode = function(v1181) --[[ Line: 8965 ]] --[[ Name: jsonEncode ]]
    local v1182 = {};
    if v1181.kind ~= nil then
        if v1181.kind.type == "token" then
            v1182.token = v1181.kind.value;
            return v1182;
        elseif v1181.kind.type == "conditional" then
            v1182.conditional = v1181.kind.value:jsonEncode();
        end;
    end;
    return v1182;
end;
v5.jsonDecode = function(v1183) --[[ Line: 8979 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_42 (copy), v2 (copy)
    local v1184 = l_v5_42.new();
    if v1183.token ~= nil then
        v1184.kind = {
            type = "token", 
            value = v1183.token
        };
    end;
    if v1183.conditional ~= nil then
        v1184.kind = {
            type = "conditional", 
            value = v2.ColorStyleProp_ConditionalOptions.jsonDecode(v1183.conditional)
        };
    end;
    return v1184;
end;
v5.descriptor = {
    name = "ColorStyleProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
};
v2.ColorStyleProp = v5;
v1.default:register(v2.ColorStyleProp);
v5 = {};
v5.__index = v5;
local l_v5_43 = v5 --[[ copy: 5 -> 49 ]];
v5.new = function(v1186) --[[ Line: 9010 ]] --[[ Name: new ]]
    -- upvalues: l_v5_43 (copy)
    return (setmetatable({
        condition = if not (v1186 ~= nil) or v1186.condition == nil then nil else v1186.condition, 
        kind = if not (v1186 ~= nil) or v1186.kind == nil then nil else v1186.kind
    }, l_v5_43));
end;
v5.encode = function(v1187) --[[ Line: 9019 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1188 = buffer.create(0);
    local v1189 = 0;
    if v1187.condition ~= nil then
        local v1190 = v1187.condition:encode();
        local v1191, v1192 = v0.writeTag(v1188, v1189, 1, v0.wireTypes.lengthDelimited);
        v1191, v1192 = v0.writeBuffer(v1191, v1192, v1190, buffer.len(v1190));
        v1188 = v1191;
        v1189 = v1192;
    end;
    if v1187.kind ~= nil and v1187.kind.type == "token" then
        local v1193, v1194 = v0.writeTag(v1188, v1189, 2, v0.wireTypes.lengthDelimited);
        v1193, v1194 = v0.writeString(v1193, v1194, v1187.kind.value);
        v1188 = v1193;
        v1189 = v1194;
    end;
    local v1195 = buffer.create(v1189);
    buffer.copy(v1195, 0, v1188, 0, v1189);
    return v1195;
end;
v5.decode = function(v1196) --[[ Line: 9041 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_43 (copy), v0 (copy), v4 (copy)
    local v1197 = l_v5_43.new();
    local v1198 = 0;
    while v1198 < buffer.len(v1196) do
        local v1199 = nil;
        local v1200 = nil;
        local v1201, v1202, v1203 = v0.readTag(v1196, v1198);
        v1199 = v1201;
        v1200 = v1202;
        v1198 = v1203;
        if v1200 == v0.wireTypes.varint then
            v1201 = nil;
            v1202, v1203 = v0.readVarInt(v1196, v1198);
            v1201 = v1202;
            v1198 = v1203;
        elseif v1200 == v0.wireTypes.lengthDelimited then
            if v1199 == 1 then
                v1201 = nil;
                v1202, v1203 = v0.readBuffer(v1196, v1198);
                v1201 = v1202;
                v1198 = v1203;
                v1197.condition = v4.PropCondition.decode(v1201);
            elseif v1199 == 2 then
                v1201 = nil;
                v1202, v1203 = v0.readBuffer(v1196, v1198);
                v1201 = v1202;
                v1198 = v1203;
                v1197.kind = {
                    type = "token", 
                    value = buffer.tostring(v1201)
                };
            else
                v1201 = nil;
                v1202, v1203 = v0.readVarInt(v1196, v1198);
                v1198 = v1203 + v1202;
            end;
        elseif v1200 == v0.wireTypes.i32 then
            v1201 = nil;
            v1202, v1203 = v0.readFixed32(v1196, v1198);
            v1201 = v1202;
            v1198 = v1203;
        elseif v1200 == v0.wireTypes.i64 then
            v1201 = nil;
            v1202, v1203 = v0.readFixed64(v1196, v1198);
            v1201 = v1202;
            v1198 = v1203;
        else
            error("Unsupported wire type: " .. v1200);
        end;
    end;
    return v1197;
end;
v5.jsonEncode = function(v1204) --[[ Line: 9089 ]] --[[ Name: jsonEncode ]]
    local v1205 = {};
    if v1204.condition ~= nil then
        v1205.condition = v1204.condition:jsonEncode();
    end;
    if v1204.kind ~= nil and v1204.kind.type == "token" then
        v1205.token = v1204.kind.value;
    end;
    return v1205;
end;
v5.jsonDecode = function(v1206) --[[ Line: 9105 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_43 (copy), v4 (copy)
    local v1207 = l_v5_43.new();
    if v1206.condition ~= nil then
        v1207.condition = v4.PropCondition.jsonDecode(v1206.condition);
    end;
    if v1206.token ~= nil then
        v1207.kind = {
            type = "token", 
            value = v1206.token
        };
    end;
    return v1207;
end;
v5.descriptor = {
    name = "ColorStyleProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ColorStyleProp_ConditionalOption = v5;
v1.default:register(v2.ColorStyleProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_44 = v5 --[[ copy: 5 -> 50 ]];
v5.new = function(v1209) --[[ Line: 9136 ]] --[[ Name: new ]]
    -- upvalues: l_v5_44 (copy)
    return (setmetatable({
        options = if not (v1209 ~= nil) or v1209.options == nil then {} else v1209.options
    }, l_v5_44));
end;
v5.encode = function(v1210) --[[ Line: 9144 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1211 = buffer.create(0);
    local v1212 = 0;
    if v1210.options ~= nil and #v1210.options > 0 then
        for _, v1214 in v1210.options do
            local v1215 = v1214:encode();
            local v1216, v1217 = v0.writeTag(v1211, v1212, 1, v0.wireTypes.lengthDelimited);
            v1216, v1217 = v0.writeBuffer(v1216, v1217, v1215, buffer.len(v1215));
            v1211 = v1216;
            v1212 = v1217;
        end;
    end;
    local v1218 = buffer.create(v1212);
    buffer.copy(v1218, 0, v1211, 0, v1212);
    return v1218;
end;
v5.decode = function(v1219) --[[ Line: 9161 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_44 (copy), v0 (copy), v2 (copy)
    local v1220 = l_v5_44.new();
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
                table.insert(v1220.options, v2.ColorStyleProp_ConditionalOption.decode(v1224));
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
v5.jsonEncode = function(v1227) --[[ Line: 9204 ]] --[[ Name: jsonEncode ]]
    local v1228 = {};
    if v1227.options ~= nil and #v1227.options > 0 then
        local v1229 = {};
        for _, v1231 in v1227.options do
            table.insert(v1229, v1231:jsonEncode());
        end;
        v1228.options = v1229;
    end;
    return v1228;
end;
v5.jsonDecode = function(v1232) --[[ Line: 9218 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_44 (copy), v2 (copy)
    local v1233 = l_v5_44.new();
    if v1232.options ~= nil then
        local v1234 = {};
        for _, v1236 in v1232.options do
            table.insert(v1234, v2.ColorStyleProp_ConditionalOption.jsonDecode(v1236));
        end;
        v1233.options = v1234;
    end;
    return v1233;
end;
v5.descriptor = {
    name = "ColorStyleProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ColorStyleProp_ConditionalOptions = v5;
v1.default:register(v2.ColorStyleProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_45 = v5 --[[ copy: 5 -> 51 ]];
v5.new = function(v1238) --[[ Line: 9249 ]] --[[ Name: new ]]
    -- upvalues: l_v5_45 (copy)
    return (setmetatable({
        kind = if not (v1238 ~= nil) or v1238.kind == nil then nil else v1238.kind
    }, l_v5_45));
end;
v5.encode = function(v1239) --[[ Line: 9255 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1240 = buffer.create(0);
    local v1241 = 0;
    if v1239.kind ~= nil then
        if v1239.kind.type == "literal" then
            local v1242, v1243 = v0.writeTag(v1240, v1241, 1, v0.wireTypes.lengthDelimited);
            v1242, v1243 = v0.writeString(v1242, v1243, v1239.kind.value);
            v1240 = v1242;
            v1241 = v1243;
        elseif v1239.kind.type == "conditional" then
            local v1244 = v1239.kind.value:encode();
            local v1245, v1246 = v0.writeTag(v1240, v1241, 2, v0.wireTypes.lengthDelimited);
            v1245, v1246 = v0.writeBuffer(v1245, v1246, v1244, buffer.len(v1244));
            v1240 = v1245;
            v1241 = v1246;
        elseif v1239.kind.type == "binding_path" then
            local v1247, v1248 = v0.writeTag(v1240, v1241, 3, v0.wireTypes.lengthDelimited);
            v1247, v1248 = v0.writeString(v1247, v1248, v1239.kind.value);
            v1240 = v1247;
            v1241 = v1248;
        end;
    end;
    local v1249 = buffer.create(v1241);
    buffer.copy(v1249, 0, v1240, 0, v1241);
    return v1249;
end;
v5.decode = function(v1250) --[[ Line: 9278 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_45 (copy), v0 (copy), v2 (copy)
    local v1251 = l_v5_45.new();
    local v1252 = 0;
    while v1252 < buffer.len(v1250) do
        local v1253 = nil;
        local v1254 = nil;
        local v1255, v1256, v1257 = v0.readTag(v1250, v1252);
        v1253 = v1255;
        v1254 = v1256;
        v1252 = v1257;
        if v1254 == v0.wireTypes.varint then
            v1255 = nil;
            v1256, v1257 = v0.readVarInt(v1250, v1252);
            v1255 = v1256;
            v1252 = v1257;
        elseif v1254 == v0.wireTypes.lengthDelimited then
            if v1253 == 1 then
                v1255 = nil;
                v1256, v1257 = v0.readBuffer(v1250, v1252);
                v1255 = v1256;
                v1252 = v1257;
                v1251.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1255)
                };
            elseif v1253 == 2 then
                v1255 = nil;
                v1256, v1257 = v0.readBuffer(v1250, v1252);
                v1255 = v1256;
                v1252 = v1257;
                v1251.kind = {
                    type = "conditional", 
                    value = v2.FillBehaviorProp_ConditionalOptions.decode(v1255)
                };
            elseif v1253 == 3 then
                v1255 = nil;
                v1256, v1257 = v0.readBuffer(v1250, v1252);
                v1255 = v1256;
                v1252 = v1257;
                v1251.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1255)
                };
            else
                v1255 = nil;
                v1256, v1257 = v0.readVarInt(v1250, v1252);
                v1252 = v1257 + v1256;
            end;
        elseif v1254 == v0.wireTypes.i32 then
            v1255 = nil;
            v1256, v1257 = v0.readFixed32(v1250, v1252);
            v1255 = v1256;
            v1252 = v1257;
        elseif v1254 == v0.wireTypes.i64 then
            v1255 = nil;
            v1256, v1257 = v0.readFixed64(v1250, v1252);
            v1255 = v1256;
            v1252 = v1257;
        else
            error("Unsupported wire type: " .. v1254);
        end;
    end;
    return v1251;
end;
v5.jsonEncode = function(v1258) --[[ Line: 9332 ]] --[[ Name: jsonEncode ]]
    local v1259 = {};
    if v1258.kind ~= nil then
        if v1258.kind.type == "literal" then
            v1259.literal = v1258.kind.value;
            return v1259;
        elseif v1258.kind.type == "conditional" then
            v1259.conditional = v1258.kind.value:jsonEncode();
            return v1259;
        elseif v1258.kind.type == "binding_path" then
            v1259.bindingPath = v1258.kind.value;
        end;
    end;
    return v1259;
end;
v5.jsonDecode = function(v1260) --[[ Line: 9348 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_45 (copy), v2 (copy)
    local v1261 = l_v5_45.new();
    if v1260.literal ~= nil then
        v1261.kind = {
            type = "literal", 
            value = v1260.literal
        };
    end;
    if v1260.conditional ~= nil then
        v1261.kind = {
            type = "conditional", 
            value = v2.FillBehaviorProp_ConditionalOptions.jsonDecode(v1260.conditional)
        };
    end;
    if v1260.binding_path ~= nil then
        v1261.kind = {
            type = "binding_path", 
            value = v1260.binding_path
        };
    end;
    if v1260.bindingPath ~= nil then
        v1261.kind = {
            type = "binding_path", 
            value = v1260.bindingPath
        };
    end;
    return v1261;
end;
v5.descriptor = {
    name = "FillBehaviorProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
};
v2.FillBehaviorProp = v5;
v1.default:register(v2.FillBehaviorProp);
v5 = {};
v5.__index = v5;
local l_v5_46 = v5 --[[ copy: 5 -> 52 ]];
v5.new = function(v1263) --[[ Line: 9387 ]] --[[ Name: new ]]
    -- upvalues: l_v5_46 (copy)
    return (setmetatable({
        condition = if not (v1263 ~= nil) or v1263.condition == nil then nil else v1263.condition, 
        kind = if not (v1263 ~= nil) or v1263.kind == nil then nil else v1263.kind
    }, l_v5_46));
end;
v5.encode = function(v1264) --[[ Line: 9396 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1265 = buffer.create(0);
    local v1266 = 0;
    if v1264.condition ~= nil then
        local v1267 = v1264.condition:encode();
        local v1268, v1269 = v0.writeTag(v1265, v1266, 1, v0.wireTypes.lengthDelimited);
        v1268, v1269 = v0.writeBuffer(v1268, v1269, v1267, buffer.len(v1267));
        v1265 = v1268;
        v1266 = v1269;
    end;
    if v1264.kind ~= nil then
        if v1264.kind.type == "literal" then
            local v1270, v1271 = v0.writeTag(v1265, v1266, 2, v0.wireTypes.lengthDelimited);
            v1270, v1271 = v0.writeString(v1270, v1271, v1264.kind.value);
            v1265 = v1270;
            v1266 = v1271;
        elseif v1264.kind.type == "binding_path" then
            local v1272, v1273 = v0.writeTag(v1265, v1266, 3, v0.wireTypes.lengthDelimited);
            v1272, v1273 = v0.writeString(v1272, v1273, v1264.kind.value);
            v1265 = v1272;
            v1266 = v1273;
        end;
    end;
    local v1274 = buffer.create(v1266);
    buffer.copy(v1274, 0, v1265, 0, v1266);
    return v1274;
end;
v5.decode = function(v1275) --[[ Line: 9421 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_46 (copy), v0 (copy), v4 (copy)
    local v1276 = l_v5_46.new();
    local v1277 = 0;
    while v1277 < buffer.len(v1275) do
        local v1278 = nil;
        local v1279 = nil;
        local v1280, v1281, v1282 = v0.readTag(v1275, v1277);
        v1278 = v1280;
        v1279 = v1281;
        v1277 = v1282;
        if v1279 == v0.wireTypes.varint then
            v1280 = nil;
            v1281, v1282 = v0.readVarInt(v1275, v1277);
            v1280 = v1281;
            v1277 = v1282;
        elseif v1279 == v0.wireTypes.lengthDelimited then
            if v1278 == 1 then
                v1280 = nil;
                v1281, v1282 = v0.readBuffer(v1275, v1277);
                v1280 = v1281;
                v1277 = v1282;
                v1276.condition = v4.PropCondition.decode(v1280);
            elseif v1278 == 2 then
                v1280 = nil;
                v1281, v1282 = v0.readBuffer(v1275, v1277);
                v1280 = v1281;
                v1277 = v1282;
                v1276.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1280)
                };
            elseif v1278 == 3 then
                v1280 = nil;
                v1281, v1282 = v0.readBuffer(v1275, v1277);
                v1280 = v1281;
                v1277 = v1282;
                v1276.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1280)
                };
            else
                v1280 = nil;
                v1281, v1282 = v0.readVarInt(v1275, v1277);
                v1277 = v1282 + v1281;
            end;
        elseif v1279 == v0.wireTypes.i32 then
            v1280 = nil;
            v1281, v1282 = v0.readFixed32(v1275, v1277);
            v1280 = v1281;
            v1277 = v1282;
        elseif v1279 == v0.wireTypes.i64 then
            v1280 = nil;
            v1281, v1282 = v0.readFixed64(v1275, v1277);
            v1280 = v1281;
            v1277 = v1282;
        else
            error("Unsupported wire type: " .. v1279);
        end;
    end;
    return v1276;
end;
v5.jsonEncode = function(v1283) --[[ Line: 9474 ]] --[[ Name: jsonEncode ]]
    local v1284 = {};
    if v1283.condition ~= nil then
        v1284.condition = v1283.condition:jsonEncode();
    end;
    if v1283.kind ~= nil then
        if v1283.kind.type == "literal" then
            v1284.literal = v1283.kind.value;
            return v1284;
        elseif v1283.kind.type == "binding_path" then
            v1284.bindingPath = v1283.kind.value;
        end;
    end;
    return v1284;
end;
v5.jsonDecode = function(v1285) --[[ Line: 9492 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_46 (copy), v4 (copy)
    local v1286 = l_v5_46.new();
    if v1285.condition ~= nil then
        v1286.condition = v4.PropCondition.jsonDecode(v1285.condition);
    end;
    if v1285.literal ~= nil then
        v1286.kind = {
            type = "literal", 
            value = v1285.literal
        };
    end;
    if v1285.binding_path ~= nil then
        v1286.kind = {
            type = "binding_path", 
            value = v1285.binding_path
        };
    end;
    if v1285.bindingPath ~= nil then
        v1286.kind = {
            type = "binding_path", 
            value = v1285.bindingPath
        };
    end;
    return v1286;
end;
v5.descriptor = {
    name = "FillBehaviorProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FillBehaviorProp_ConditionalOption = v5;
v1.default:register(v2.FillBehaviorProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_47 = v5 --[[ copy: 5 -> 53 ]];
v5.new = function(v1288) --[[ Line: 9531 ]] --[[ Name: new ]]
    -- upvalues: l_v5_47 (copy)
    return (setmetatable({
        options = if not (v1288 ~= nil) or v1288.options == nil then {} else v1288.options
    }, l_v5_47));
end;
v5.encode = function(v1289) --[[ Line: 9539 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1290 = buffer.create(0);
    local v1291 = 0;
    if v1289.options ~= nil and #v1289.options > 0 then
        for _, v1293 in v1289.options do
            local v1294 = v1293:encode();
            local v1295, v1296 = v0.writeTag(v1290, v1291, 1, v0.wireTypes.lengthDelimited);
            v1295, v1296 = v0.writeBuffer(v1295, v1296, v1294, buffer.len(v1294));
            v1290 = v1295;
            v1291 = v1296;
        end;
    end;
    local v1297 = buffer.create(v1291);
    buffer.copy(v1297, 0, v1290, 0, v1291);
    return v1297;
end;
v5.decode = function(v1298) --[[ Line: 9556 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_47 (copy), v0 (copy), v2 (copy)
    local v1299 = l_v5_47.new();
    local v1300 = 0;
    while v1300 < buffer.len(v1298) do
        local v1301 = nil;
        local v1302 = nil;
        local v1303, v1304, v1305 = v0.readTag(v1298, v1300);
        v1301 = v1303;
        v1302 = v1304;
        v1300 = v1305;
        if v1302 == v0.wireTypes.varint then
            v1303 = nil;
            v1304, v1305 = v0.readVarInt(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        elseif v1302 == v0.wireTypes.lengthDelimited then
            if v1301 == 1 then
                v1303 = nil;
                v1304, v1305 = v0.readBuffer(v1298, v1300);
                v1303 = v1304;
                v1300 = v1305;
                table.insert(v1299.options, v2.FillBehaviorProp_ConditionalOption.decode(v1303));
            else
                v1303 = nil;
                v1304, v1305 = v0.readVarInt(v1298, v1300);
                v1300 = v1305 + v1304;
            end;
        elseif v1302 == v0.wireTypes.i32 then
            v1303 = nil;
            v1304, v1305 = v0.readFixed32(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        elseif v1302 == v0.wireTypes.i64 then
            v1303 = nil;
            v1304, v1305 = v0.readFixed64(v1298, v1300);
            v1303 = v1304;
            v1300 = v1305;
        else
            error("Unsupported wire type: " .. v1302);
        end;
    end;
    return v1299;
end;
v5.jsonEncode = function(v1306) --[[ Line: 9599 ]] --[[ Name: jsonEncode ]]
    local v1307 = {};
    if v1306.options ~= nil and #v1306.options > 0 then
        local v1308 = {};
        for _, v1310 in v1306.options do
            table.insert(v1308, v1310:jsonEncode());
        end;
        v1307.options = v1308;
    end;
    return v1307;
end;
v5.jsonDecode = function(v1311) --[[ Line: 9613 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_47 (copy), v2 (copy)
    local v1312 = l_v5_47.new();
    if v1311.options ~= nil then
        local v1313 = {};
        for _, v1315 in v1311.options do
            table.insert(v1313, v2.FillBehaviorProp_ConditionalOption.jsonDecode(v1315));
        end;
        v1312.options = v1313;
    end;
    return v1312;
end;
v5.descriptor = {
    name = "FillBehaviorProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FillBehaviorProp_ConditionalOptions = v5;
v1.default:register(v2.FillBehaviorProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_48 = v5 --[[ copy: 5 -> 54 ]];
v5.new = function(v1317) --[[ Line: 9644 ]] --[[ Name: new ]]
    -- upvalues: l_v5_48 (copy)
    return (setmetatable({
        kind = if not (v1317 ~= nil) or v1317.kind == nil then nil else v1317.kind
    }, l_v5_48));
end;
v5.encode = function(v1318) --[[ Line: 9650 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1319 = buffer.create(0);
    local v1320 = 0;
    if v1318.kind ~= nil then
        if v1318.kind.type == "literal" then
            local v1321, v1322 = v0.writeTag(v1319, v1320, 1, v0.wireTypes.lengthDelimited);
            v1321, v1322 = v0.writeString(v1321, v1322, v1318.kind.value);
            v1319 = v1321;
            v1320 = v1322;
        elseif v1318.kind.type == "conditional" then
            local v1323 = v1318.kind.value:encode();
            local v1324, v1325 = v0.writeTag(v1319, v1320, 2, v0.wireTypes.lengthDelimited);
            v1324, v1325 = v0.writeBuffer(v1324, v1325, v1323, buffer.len(v1323));
            v1319 = v1324;
            v1320 = v1325;
        elseif v1318.kind.type == "binding_path" then
            local v1326, v1327 = v0.writeTag(v1319, v1320, 3, v0.wireTypes.lengthDelimited);
            v1326, v1327 = v0.writeString(v1326, v1327, v1318.kind.value);
            v1319 = v1326;
            v1320 = v1327;
        end;
    end;
    local v1328 = buffer.create(v1320);
    buffer.copy(v1328, 0, v1319, 0, v1320);
    return v1328;
end;
v5.decode = function(v1329) --[[ Line: 9673 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_48 (copy), v0 (copy), v2 (copy)
    local v1330 = l_v5_48.new();
    local v1331 = 0;
    while v1331 < buffer.len(v1329) do
        local v1332 = nil;
        local v1333 = nil;
        local v1334, v1335, v1336 = v0.readTag(v1329, v1331);
        v1332 = v1334;
        v1333 = v1335;
        v1331 = v1336;
        if v1333 == v0.wireTypes.varint then
            v1334 = nil;
            v1335, v1336 = v0.readVarInt(v1329, v1331);
            v1334 = v1335;
            v1331 = v1336;
        elseif v1333 == v0.wireTypes.lengthDelimited then
            if v1332 == 1 then
                v1334 = nil;
                v1335, v1336 = v0.readBuffer(v1329, v1331);
                v1334 = v1335;
                v1331 = v1336;
                v1330.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1334)
                };
            elseif v1332 == 2 then
                v1334 = nil;
                v1335, v1336 = v0.readBuffer(v1329, v1331);
                v1334 = v1335;
                v1331 = v1336;
                v1330.kind = {
                    type = "conditional", 
                    value = v2.InputSizeProp_ConditionalOptions.decode(v1334)
                };
            elseif v1332 == 3 then
                v1334 = nil;
                v1335, v1336 = v0.readBuffer(v1329, v1331);
                v1334 = v1335;
                v1331 = v1336;
                v1330.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1334)
                };
            else
                v1334 = nil;
                v1335, v1336 = v0.readVarInt(v1329, v1331);
                v1331 = v1336 + v1335;
            end;
        elseif v1333 == v0.wireTypes.i32 then
            v1334 = nil;
            v1335, v1336 = v0.readFixed32(v1329, v1331);
            v1334 = v1335;
            v1331 = v1336;
        elseif v1333 == v0.wireTypes.i64 then
            v1334 = nil;
            v1335, v1336 = v0.readFixed64(v1329, v1331);
            v1334 = v1335;
            v1331 = v1336;
        else
            error("Unsupported wire type: " .. v1333);
        end;
    end;
    return v1330;
end;
v5.jsonEncode = function(v1337) --[[ Line: 9727 ]] --[[ Name: jsonEncode ]]
    local v1338 = {};
    if v1337.kind ~= nil then
        if v1337.kind.type == "literal" then
            v1338.literal = v1337.kind.value;
            return v1338;
        elseif v1337.kind.type == "conditional" then
            v1338.conditional = v1337.kind.value:jsonEncode();
            return v1338;
        elseif v1337.kind.type == "binding_path" then
            v1338.bindingPath = v1337.kind.value;
        end;
    end;
    return v1338;
end;
v5.jsonDecode = function(v1339) --[[ Line: 9743 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_48 (copy), v2 (copy)
    local v1340 = l_v5_48.new();
    if v1339.literal ~= nil then
        v1340.kind = {
            type = "literal", 
            value = v1339.literal
        };
    end;
    if v1339.conditional ~= nil then
        v1340.kind = {
            type = "conditional", 
            value = v2.InputSizeProp_ConditionalOptions.jsonDecode(v1339.conditional)
        };
    end;
    if v1339.binding_path ~= nil then
        v1340.kind = {
            type = "binding_path", 
            value = v1339.binding_path
        };
    end;
    if v1339.bindingPath ~= nil then
        v1340.kind = {
            type = "binding_path", 
            value = v1339.bindingPath
        };
    end;
    return v1340;
end;
v5.descriptor = {
    name = "InputSizeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
};
v2.InputSizeProp = v5;
v1.default:register(v2.InputSizeProp);
v5 = {};
v5.__index = v5;
local l_v5_49 = v5 --[[ copy: 5 -> 55 ]];
v5.new = function(v1342) --[[ Line: 9782 ]] --[[ Name: new ]]
    -- upvalues: l_v5_49 (copy)
    return (setmetatable({
        condition = if not (v1342 ~= nil) or v1342.condition == nil then nil else v1342.condition, 
        kind = if not (v1342 ~= nil) or v1342.kind == nil then nil else v1342.kind
    }, l_v5_49));
end;
v5.encode = function(v1343) --[[ Line: 9791 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1344 = buffer.create(0);
    local v1345 = 0;
    if v1343.condition ~= nil then
        local v1346 = v1343.condition:encode();
        local v1347, v1348 = v0.writeTag(v1344, v1345, 1, v0.wireTypes.lengthDelimited);
        v1347, v1348 = v0.writeBuffer(v1347, v1348, v1346, buffer.len(v1346));
        v1344 = v1347;
        v1345 = v1348;
    end;
    if v1343.kind ~= nil then
        if v1343.kind.type == "literal" then
            local v1349, v1350 = v0.writeTag(v1344, v1345, 2, v0.wireTypes.lengthDelimited);
            v1349, v1350 = v0.writeString(v1349, v1350, v1343.kind.value);
            v1344 = v1349;
            v1345 = v1350;
        elseif v1343.kind.type == "binding_path" then
            local v1351, v1352 = v0.writeTag(v1344, v1345, 3, v0.wireTypes.lengthDelimited);
            v1351, v1352 = v0.writeString(v1351, v1352, v1343.kind.value);
            v1344 = v1351;
            v1345 = v1352;
        end;
    end;
    local v1353 = buffer.create(v1345);
    buffer.copy(v1353, 0, v1344, 0, v1345);
    return v1353;
end;
v5.decode = function(v1354) --[[ Line: 9816 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_49 (copy), v0 (copy), v4 (copy)
    local v1355 = l_v5_49.new();
    local v1356 = 0;
    while v1356 < buffer.len(v1354) do
        local v1357 = nil;
        local v1358 = nil;
        local v1359, v1360, v1361 = v0.readTag(v1354, v1356);
        v1357 = v1359;
        v1358 = v1360;
        v1356 = v1361;
        if v1358 == v0.wireTypes.varint then
            v1359 = nil;
            v1360, v1361 = v0.readVarInt(v1354, v1356);
            v1359 = v1360;
            v1356 = v1361;
        elseif v1358 == v0.wireTypes.lengthDelimited then
            if v1357 == 1 then
                v1359 = nil;
                v1360, v1361 = v0.readBuffer(v1354, v1356);
                v1359 = v1360;
                v1356 = v1361;
                v1355.condition = v4.PropCondition.decode(v1359);
            elseif v1357 == 2 then
                v1359 = nil;
                v1360, v1361 = v0.readBuffer(v1354, v1356);
                v1359 = v1360;
                v1356 = v1361;
                v1355.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1359)
                };
            elseif v1357 == 3 then
                v1359 = nil;
                v1360, v1361 = v0.readBuffer(v1354, v1356);
                v1359 = v1360;
                v1356 = v1361;
                v1355.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1359)
                };
            else
                v1359 = nil;
                v1360, v1361 = v0.readVarInt(v1354, v1356);
                v1356 = v1361 + v1360;
            end;
        elseif v1358 == v0.wireTypes.i32 then
            v1359 = nil;
            v1360, v1361 = v0.readFixed32(v1354, v1356);
            v1359 = v1360;
            v1356 = v1361;
        elseif v1358 == v0.wireTypes.i64 then
            v1359 = nil;
            v1360, v1361 = v0.readFixed64(v1354, v1356);
            v1359 = v1360;
            v1356 = v1361;
        else
            error("Unsupported wire type: " .. v1358);
        end;
    end;
    return v1355;
end;
v5.jsonEncode = function(v1362) --[[ Line: 9869 ]] --[[ Name: jsonEncode ]]
    local v1363 = {};
    if v1362.condition ~= nil then
        v1363.condition = v1362.condition:jsonEncode();
    end;
    if v1362.kind ~= nil then
        if v1362.kind.type == "literal" then
            v1363.literal = v1362.kind.value;
            return v1363;
        elseif v1362.kind.type == "binding_path" then
            v1363.bindingPath = v1362.kind.value;
        end;
    end;
    return v1363;
end;
v5.jsonDecode = function(v1364) --[[ Line: 9887 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_49 (copy), v4 (copy)
    local v1365 = l_v5_49.new();
    if v1364.condition ~= nil then
        v1365.condition = v4.PropCondition.jsonDecode(v1364.condition);
    end;
    if v1364.literal ~= nil then
        v1365.kind = {
            type = "literal", 
            value = v1364.literal
        };
    end;
    if v1364.binding_path ~= nil then
        v1365.kind = {
            type = "binding_path", 
            value = v1364.binding_path
        };
    end;
    if v1364.bindingPath ~= nil then
        v1365.kind = {
            type = "binding_path", 
            value = v1364.bindingPath
        };
    end;
    return v1365;
end;
v5.descriptor = {
    name = "InputSizeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.InputSizeProp_ConditionalOption = v5;
v1.default:register(v2.InputSizeProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_50 = v5 --[[ copy: 5 -> 56 ]];
v5.new = function(v1367) --[[ Line: 9924 ]] --[[ Name: new ]]
    -- upvalues: l_v5_50 (copy)
    return (setmetatable({
        options = if not (v1367 ~= nil) or v1367.options == nil then {} else v1367.options
    }, l_v5_50));
end;
v5.encode = function(v1368) --[[ Line: 9932 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1369 = buffer.create(0);
    local v1370 = 0;
    if v1368.options ~= nil and #v1368.options > 0 then
        for _, v1372 in v1368.options do
            local v1373 = v1372:encode();
            local v1374, v1375 = v0.writeTag(v1369, v1370, 1, v0.wireTypes.lengthDelimited);
            v1374, v1375 = v0.writeBuffer(v1374, v1375, v1373, buffer.len(v1373));
            v1369 = v1374;
            v1370 = v1375;
        end;
    end;
    local v1376 = buffer.create(v1370);
    buffer.copy(v1376, 0, v1369, 0, v1370);
    return v1376;
end;
v5.decode = function(v1377) --[[ Line: 9949 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_50 (copy), v0 (copy), v2 (copy)
    local v1378 = l_v5_50.new();
    local v1379 = 0;
    while v1379 < buffer.len(v1377) do
        local v1380 = nil;
        local v1381 = nil;
        local v1382, v1383, v1384 = v0.readTag(v1377, v1379);
        v1380 = v1382;
        v1381 = v1383;
        v1379 = v1384;
        if v1381 == v0.wireTypes.varint then
            v1382 = nil;
            v1383, v1384 = v0.readVarInt(v1377, v1379);
            v1382 = v1383;
            v1379 = v1384;
        elseif v1381 == v0.wireTypes.lengthDelimited then
            if v1380 == 1 then
                v1382 = nil;
                v1383, v1384 = v0.readBuffer(v1377, v1379);
                v1382 = v1383;
                v1379 = v1384;
                table.insert(v1378.options, v2.InputSizeProp_ConditionalOption.decode(v1382));
            else
                v1382 = nil;
                v1383, v1384 = v0.readVarInt(v1377, v1379);
                v1379 = v1384 + v1383;
            end;
        elseif v1381 == v0.wireTypes.i32 then
            v1382 = nil;
            v1383, v1384 = v0.readFixed32(v1377, v1379);
            v1382 = v1383;
            v1379 = v1384;
        elseif v1381 == v0.wireTypes.i64 then
            v1382 = nil;
            v1383, v1384 = v0.readFixed64(v1377, v1379);
            v1382 = v1383;
            v1379 = v1384;
        else
            error("Unsupported wire type: " .. v1381);
        end;
    end;
    return v1378;
end;
v5.jsonEncode = function(v1385) --[[ Line: 9992 ]] --[[ Name: jsonEncode ]]
    local v1386 = {};
    if v1385.options ~= nil and #v1385.options > 0 then
        local v1387 = {};
        for _, v1389 in v1385.options do
            table.insert(v1387, v1389:jsonEncode());
        end;
        v1386.options = v1387;
    end;
    return v1386;
end;
v5.jsonDecode = function(v1390) --[[ Line: 10006 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_50 (copy), v2 (copy)
    local v1391 = l_v5_50.new();
    if v1390.options ~= nil then
        local v1392 = {};
        for _, v1394 in v1390.options do
            table.insert(v1392, v2.InputSizeProp_ConditionalOption.jsonDecode(v1394));
        end;
        v1391.options = v1392;
    end;
    return v1391;
end;
v5.descriptor = {
    name = "InputSizeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.InputSizeProp_ConditionalOptions = v5;
v1.default:register(v2.InputSizeProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_51 = v5 --[[ copy: 5 -> 57 ]];
v5.new = function(v1396) --[[ Line: 10037 ]] --[[ Name: new ]]
    -- upvalues: l_v5_51 (copy)
    return (setmetatable({
        kind = if not (v1396 ~= nil) or v1396.kind == nil then nil else v1396.kind
    }, l_v5_51));
end;
v5.encode = function(v1397) --[[ Line: 10043 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1398 = buffer.create(0);
    local v1399 = 0;
    if v1397.kind ~= nil then
        if v1397.kind.type == "literal" then
            local v1400, v1401 = v0.writeTag(v1398, v1399, 1, v0.wireTypes.lengthDelimited);
            v1400, v1401 = v0.writeString(v1400, v1401, v1397.kind.value);
            v1398 = v1400;
            v1399 = v1401;
        elseif v1397.kind.type == "token" then
            local v1402, v1403 = v0.writeTag(v1398, v1399, 2, v0.wireTypes.lengthDelimited);
            v1402, v1403 = v0.writeString(v1402, v1403, v1397.kind.value);
            v1398 = v1402;
            v1399 = v1403;
        elseif v1397.kind.type == "conditional" then
            local v1404 = v1397.kind.value:encode();
            local v1405, v1406 = v0.writeTag(v1398, v1399, 3, v0.wireTypes.lengthDelimited);
            v1405, v1406 = v0.writeBuffer(v1405, v1406, v1404, buffer.len(v1404));
            v1398 = v1405;
            v1399 = v1406;
        elseif v1397.kind.type == "binding_path" then
            local v1407, v1408 = v0.writeTag(v1398, v1399, 4, v0.wireTypes.lengthDelimited);
            v1407, v1408 = v0.writeString(v1407, v1408, v1397.kind.value);
            v1398 = v1407;
            v1399 = v1408;
        end;
    end;
    local v1409 = buffer.create(v1399);
    buffer.copy(v1409, 0, v1398, 0, v1399);
    return v1409;
end;
v5.decode = function(v1410) --[[ Line: 10069 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_51 (copy), v0 (copy), v2 (copy)
    local v1411 = l_v5_51.new();
    local v1412 = 0;
    while v1412 < buffer.len(v1410) do
        local v1413 = nil;
        local v1414 = nil;
        local v1415, v1416, v1417 = v0.readTag(v1410, v1412);
        v1413 = v1415;
        v1414 = v1416;
        v1412 = v1417;
        if v1414 == v0.wireTypes.varint then
            v1415 = nil;
            v1416, v1417 = v0.readVarInt(v1410, v1412);
            v1415 = v1416;
            v1412 = v1417;
        elseif v1414 == v0.wireTypes.lengthDelimited then
            if v1413 == 1 then
                v1415 = nil;
                v1416, v1417 = v0.readBuffer(v1410, v1412);
                v1415 = v1416;
                v1412 = v1417;
                v1411.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1415)
                };
            elseif v1413 == 2 then
                v1415 = nil;
                v1416, v1417 = v0.readBuffer(v1410, v1412);
                v1415 = v1416;
                v1412 = v1417;
                v1411.kind = {
                    type = "token", 
                    value = buffer.tostring(v1415)
                };
            elseif v1413 == 3 then
                v1415 = nil;
                v1416, v1417 = v0.readBuffer(v1410, v1412);
                v1415 = v1416;
                v1412 = v1417;
                v1411.kind = {
                    type = "conditional", 
                    value = v2.UDimProp_ConditionalOptions.decode(v1415)
                };
            elseif v1413 == 4 then
                v1415 = nil;
                v1416, v1417 = v0.readBuffer(v1410, v1412);
                v1415 = v1416;
                v1412 = v1417;
                v1411.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1415)
                };
            else
                v1415 = nil;
                v1416, v1417 = v0.readVarInt(v1410, v1412);
                v1412 = v1417 + v1416;
            end;
        elseif v1414 == v0.wireTypes.i32 then
            v1415 = nil;
            v1416, v1417 = v0.readFixed32(v1410, v1412);
            v1415 = v1416;
            v1412 = v1417;
        elseif v1414 == v0.wireTypes.i64 then
            v1415 = nil;
            v1416, v1417 = v0.readFixed64(v1410, v1412);
            v1415 = v1416;
            v1412 = v1417;
        else
            error("Unsupported wire type: " .. v1414);
        end;
    end;
    return v1411;
end;
v5.jsonEncode = function(v1418) --[[ Line: 10127 ]] --[[ Name: jsonEncode ]]
    local v1419 = {};
    if v1418.kind ~= nil then
        if v1418.kind.type == "literal" then
            v1419.literal = v1418.kind.value;
            return v1419;
        elseif v1418.kind.type == "token" then
            v1419.token = v1418.kind.value;
            return v1419;
        elseif v1418.kind.type == "conditional" then
            v1419.conditional = v1418.kind.value:jsonEncode();
            return v1419;
        elseif v1418.kind.type == "binding_path" then
            v1419.bindingPath = v1418.kind.value;
        end;
    end;
    return v1419;
end;
v5.jsonDecode = function(v1420) --[[ Line: 10145 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_51 (copy), v2 (copy)
    local v1421 = l_v5_51.new();
    if v1420.literal ~= nil then
        v1421.kind = {
            type = "literal", 
            value = v1420.literal
        };
    end;
    if v1420.token ~= nil then
        v1421.kind = {
            type = "token", 
            value = v1420.token
        };
    end;
    if v1420.conditional ~= nil then
        v1421.kind = {
            type = "conditional", 
            value = v2.UDimProp_ConditionalOptions.jsonDecode(v1420.conditional)
        };
    end;
    if v1420.binding_path ~= nil then
        v1421.kind = {
            type = "binding_path", 
            value = v1420.binding_path
        };
    end;
    if v1420.bindingPath ~= nil then
        v1421.kind = {
            type = "binding_path", 
            value = v1420.bindingPath
        };
    end;
    return v1421;
end;
v5.descriptor = {
    name = "UDimProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
};
v2.UDimProp = v5;
v1.default:register(v2.UDimProp);
v5 = {};
v5.__index = v5;
local l_v5_52 = v5 --[[ copy: 5 -> 58 ]];
v5.new = function(v1423) --[[ Line: 10186 ]] --[[ Name: new ]]
    -- upvalues: l_v5_52 (copy)
    return (setmetatable({
        condition = if not (v1423 ~= nil) or v1423.condition == nil then nil else v1423.condition, 
        kind = if not (v1423 ~= nil) or v1423.kind == nil then nil else v1423.kind
    }, l_v5_52));
end;
v5.encode = function(v1424) --[[ Line: 10195 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1425 = buffer.create(0);
    local v1426 = 0;
    if v1424.condition ~= nil then
        local v1427 = v1424.condition:encode();
        local v1428, v1429 = v0.writeTag(v1425, v1426, 1, v0.wireTypes.lengthDelimited);
        v1428, v1429 = v0.writeBuffer(v1428, v1429, v1427, buffer.len(v1427));
        v1425 = v1428;
        v1426 = v1429;
    end;
    if v1424.kind ~= nil then
        if v1424.kind.type == "literal" then
            local v1430, v1431 = v0.writeTag(v1425, v1426, 2, v0.wireTypes.lengthDelimited);
            v1430, v1431 = v0.writeString(v1430, v1431, v1424.kind.value);
            v1425 = v1430;
            v1426 = v1431;
        elseif v1424.kind.type == "token" then
            local v1432, v1433 = v0.writeTag(v1425, v1426, 3, v0.wireTypes.lengthDelimited);
            v1432, v1433 = v0.writeString(v1432, v1433, v1424.kind.value);
            v1425 = v1432;
            v1426 = v1433;
        elseif v1424.kind.type == "binding_path" then
            local v1434, v1435 = v0.writeTag(v1425, v1426, 4, v0.wireTypes.lengthDelimited);
            v1434, v1435 = v0.writeString(v1434, v1435, v1424.kind.value);
            v1425 = v1434;
            v1426 = v1435;
        end;
    end;
    local v1436 = buffer.create(v1426);
    buffer.copy(v1436, 0, v1425, 0, v1426);
    return v1436;
end;
v5.decode = function(v1437) --[[ Line: 10223 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_52 (copy), v0 (copy), v4 (copy)
    local v1438 = l_v5_52.new();
    local v1439 = 0;
    while v1439 < buffer.len(v1437) do
        local v1440 = nil;
        local v1441 = nil;
        local v1442, v1443, v1444 = v0.readTag(v1437, v1439);
        v1440 = v1442;
        v1441 = v1443;
        v1439 = v1444;
        if v1441 == v0.wireTypes.varint then
            v1442 = nil;
            v1443, v1444 = v0.readVarInt(v1437, v1439);
            v1442 = v1443;
            v1439 = v1444;
        elseif v1441 == v0.wireTypes.lengthDelimited then
            if v1440 == 1 then
                v1442 = nil;
                v1443, v1444 = v0.readBuffer(v1437, v1439);
                v1442 = v1443;
                v1439 = v1444;
                v1438.condition = v4.PropCondition.decode(v1442);
            elseif v1440 == 2 then
                v1442 = nil;
                v1443, v1444 = v0.readBuffer(v1437, v1439);
                v1442 = v1443;
                v1439 = v1444;
                v1438.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1442)
                };
            elseif v1440 == 3 then
                v1442 = nil;
                v1443, v1444 = v0.readBuffer(v1437, v1439);
                v1442 = v1443;
                v1439 = v1444;
                v1438.kind = {
                    type = "token", 
                    value = buffer.tostring(v1442)
                };
            elseif v1440 == 4 then
                v1442 = nil;
                v1443, v1444 = v0.readBuffer(v1437, v1439);
                v1442 = v1443;
                v1439 = v1444;
                v1438.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1442)
                };
            else
                v1442 = nil;
                v1443, v1444 = v0.readVarInt(v1437, v1439);
                v1439 = v1444 + v1443;
            end;
        elseif v1441 == v0.wireTypes.i32 then
            v1442 = nil;
            v1443, v1444 = v0.readFixed32(v1437, v1439);
            v1442 = v1443;
            v1439 = v1444;
        elseif v1441 == v0.wireTypes.i64 then
            v1442 = nil;
            v1443, v1444 = v0.readFixed64(v1437, v1439);
            v1442 = v1443;
            v1439 = v1444;
        else
            error("Unsupported wire type: " .. v1441);
        end;
    end;
    return v1438;
end;
v5.jsonEncode = function(v1445) --[[ Line: 10281 ]] --[[ Name: jsonEncode ]]
    local v1446 = {};
    if v1445.condition ~= nil then
        v1446.condition = v1445.condition:jsonEncode();
    end;
    if v1445.kind ~= nil then
        if v1445.kind.type == "literal" then
            v1446.literal = v1445.kind.value;
            return v1446;
        elseif v1445.kind.type == "token" then
            v1446.token = v1445.kind.value;
            return v1446;
        elseif v1445.kind.type == "binding_path" then
            v1446.bindingPath = v1445.kind.value;
        end;
    end;
    return v1446;
end;
v5.jsonDecode = function(v1447) --[[ Line: 10301 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_52 (copy), v4 (copy)
    local v1448 = l_v5_52.new();
    if v1447.condition ~= nil then
        v1448.condition = v4.PropCondition.jsonDecode(v1447.condition);
    end;
    if v1447.literal ~= nil then
        v1448.kind = {
            type = "literal", 
            value = v1447.literal
        };
    end;
    if v1447.token ~= nil then
        v1448.kind = {
            type = "token", 
            value = v1447.token
        };
    end;
    if v1447.binding_path ~= nil then
        v1448.kind = {
            type = "binding_path", 
            value = v1447.binding_path
        };
    end;
    if v1447.bindingPath ~= nil then
        v1448.kind = {
            type = "binding_path", 
            value = v1447.bindingPath
        };
    end;
    return v1448;
end;
v5.descriptor = {
    name = "UDimProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UDimProp_ConditionalOption = v5;
v1.default:register(v2.UDimProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_53 = v5 --[[ copy: 5 -> 59 ]];
v5.new = function(v1450) --[[ Line: 10342 ]] --[[ Name: new ]]
    -- upvalues: l_v5_53 (copy)
    return (setmetatable({
        options = if not (v1450 ~= nil) or v1450.options == nil then {} else v1450.options
    }, l_v5_53));
end;
v5.encode = function(v1451) --[[ Line: 10350 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1452 = buffer.create(0);
    local v1453 = 0;
    if v1451.options ~= nil and #v1451.options > 0 then
        for _, v1455 in v1451.options do
            local v1456 = v1455:encode();
            local v1457, v1458 = v0.writeTag(v1452, v1453, 1, v0.wireTypes.lengthDelimited);
            v1457, v1458 = v0.writeBuffer(v1457, v1458, v1456, buffer.len(v1456));
            v1452 = v1457;
            v1453 = v1458;
        end;
    end;
    local v1459 = buffer.create(v1453);
    buffer.copy(v1459, 0, v1452, 0, v1453);
    return v1459;
end;
v5.decode = function(v1460) --[[ Line: 10367 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_53 (copy), v0 (copy), v2 (copy)
    local v1461 = l_v5_53.new();
    local v1462 = 0;
    while v1462 < buffer.len(v1460) do
        local v1463 = nil;
        local v1464 = nil;
        local v1465, v1466, v1467 = v0.readTag(v1460, v1462);
        v1463 = v1465;
        v1464 = v1466;
        v1462 = v1467;
        if v1464 == v0.wireTypes.varint then
            v1465 = nil;
            v1466, v1467 = v0.readVarInt(v1460, v1462);
            v1465 = v1466;
            v1462 = v1467;
        elseif v1464 == v0.wireTypes.lengthDelimited then
            if v1463 == 1 then
                v1465 = nil;
                v1466, v1467 = v0.readBuffer(v1460, v1462);
                v1465 = v1466;
                v1462 = v1467;
                table.insert(v1461.options, v2.UDimProp_ConditionalOption.decode(v1465));
            else
                v1465 = nil;
                v1466, v1467 = v0.readVarInt(v1460, v1462);
                v1462 = v1467 + v1466;
            end;
        elseif v1464 == v0.wireTypes.i32 then
            v1465 = nil;
            v1466, v1467 = v0.readFixed32(v1460, v1462);
            v1465 = v1466;
            v1462 = v1467;
        elseif v1464 == v0.wireTypes.i64 then
            v1465 = nil;
            v1466, v1467 = v0.readFixed64(v1460, v1462);
            v1465 = v1466;
            v1462 = v1467;
        else
            error("Unsupported wire type: " .. v1464);
        end;
    end;
    return v1461;
end;
v5.jsonEncode = function(v1468) --[[ Line: 10410 ]] --[[ Name: jsonEncode ]]
    local v1469 = {};
    if v1468.options ~= nil and #v1468.options > 0 then
        local v1470 = {};
        for _, v1472 in v1468.options do
            table.insert(v1470, v1472:jsonEncode());
        end;
        v1469.options = v1470;
    end;
    return v1469;
end;
v5.jsonDecode = function(v1473) --[[ Line: 10424 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_53 (copy), v2 (copy)
    local v1474 = l_v5_53.new();
    if v1473.options ~= nil then
        local v1475 = {};
        for _, v1477 in v1473.options do
            table.insert(v1475, v2.UDimProp_ConditionalOption.jsonDecode(v1477));
        end;
        v1474.options = v1475;
    end;
    return v1474;
end;
v5.descriptor = {
    name = "UDimProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UDimProp_ConditionalOptions = v5;
v1.default:register(v2.UDimProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_54 = v5 --[[ copy: 5 -> 60 ]];
v5.new = function(v1479) --[[ Line: 10453 ]] --[[ Name: new ]]
    -- upvalues: l_v5_54 (copy)
    return (setmetatable({
        kind = if not (v1479 ~= nil) or v1479.kind == nil then nil else v1479.kind
    }, l_v5_54));
end;
v5.encode = function(v1480) --[[ Line: 10459 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1481 = buffer.create(0);
    local v1482 = 0;
    if v1480.kind ~= nil then
        if v1480.kind.type == "literal" then
            local v1483, v1484 = v0.writeTag(v1481, v1482, 1, v0.wireTypes.lengthDelimited);
            v1483, v1484 = v0.writeString(v1483, v1484, v1480.kind.value);
            v1481 = v1483;
            v1482 = v1484;
        elseif v1480.kind.type == "token" then
            local v1485, v1486 = v0.writeTag(v1481, v1482, 2, v0.wireTypes.lengthDelimited);
            v1485, v1486 = v0.writeString(v1485, v1486, v1480.kind.value);
            v1481 = v1485;
            v1482 = v1486;
        elseif v1480.kind.type == "conditional" then
            local v1487 = v1480.kind.value:encode();
            local v1488, v1489 = v0.writeTag(v1481, v1482, 3, v0.wireTypes.lengthDelimited);
            v1488, v1489 = v0.writeBuffer(v1488, v1489, v1487, buffer.len(v1487));
            v1481 = v1488;
            v1482 = v1489;
        elseif v1480.kind.type == "binding_path" then
            local v1490, v1491 = v0.writeTag(v1481, v1482, 4, v0.wireTypes.lengthDelimited);
            v1490, v1491 = v0.writeString(v1490, v1491, v1480.kind.value);
            v1481 = v1490;
            v1482 = v1491;
        end;
    end;
    local v1492 = buffer.create(v1482);
    buffer.copy(v1492, 0, v1481, 0, v1482);
    return v1492;
end;
v5.decode = function(v1493) --[[ Line: 10485 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_54 (copy), v0 (copy), v2 (copy)
    local v1494 = l_v5_54.new();
    local v1495 = 0;
    while v1495 < buffer.len(v1493) do
        local v1496 = nil;
        local v1497 = nil;
        local v1498, v1499, v1500 = v0.readTag(v1493, v1495);
        v1496 = v1498;
        v1497 = v1499;
        v1495 = v1500;
        if v1497 == v0.wireTypes.varint then
            v1498 = nil;
            v1499, v1500 = v0.readVarInt(v1493, v1495);
            v1498 = v1499;
            v1495 = v1500;
        elseif v1497 == v0.wireTypes.lengthDelimited then
            if v1496 == 1 then
                v1498 = nil;
                v1499, v1500 = v0.readBuffer(v1493, v1495);
                v1498 = v1499;
                v1495 = v1500;
                v1494.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1498)
                };
            elseif v1496 == 2 then
                v1498 = nil;
                v1499, v1500 = v0.readBuffer(v1493, v1495);
                v1498 = v1499;
                v1495 = v1500;
                v1494.kind = {
                    type = "token", 
                    value = buffer.tostring(v1498)
                };
            elseif v1496 == 3 then
                v1498 = nil;
                v1499, v1500 = v0.readBuffer(v1493, v1495);
                v1498 = v1499;
                v1495 = v1500;
                v1494.kind = {
                    type = "conditional", 
                    value = v2.UDim2Prop_ConditionalOptions.decode(v1498)
                };
            elseif v1496 == 4 then
                v1498 = nil;
                v1499, v1500 = v0.readBuffer(v1493, v1495);
                v1498 = v1499;
                v1495 = v1500;
                v1494.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1498)
                };
            else
                v1498 = nil;
                v1499, v1500 = v0.readVarInt(v1493, v1495);
                v1495 = v1500 + v1499;
            end;
        elseif v1497 == v0.wireTypes.i32 then
            v1498 = nil;
            v1499, v1500 = v0.readFixed32(v1493, v1495);
            v1498 = v1499;
            v1495 = v1500;
        elseif v1497 == v0.wireTypes.i64 then
            v1498 = nil;
            v1499, v1500 = v0.readFixed64(v1493, v1495);
            v1498 = v1499;
            v1495 = v1500;
        else
            error("Unsupported wire type: " .. v1497);
        end;
    end;
    return v1494;
end;
v5.jsonEncode = function(v1501) --[[ Line: 10543 ]] --[[ Name: jsonEncode ]]
    local v1502 = {};
    if v1501.kind ~= nil then
        if v1501.kind.type == "literal" then
            v1502.literal = v1501.kind.value;
            return v1502;
        elseif v1501.kind.type == "token" then
            v1502.token = v1501.kind.value;
            return v1502;
        elseif v1501.kind.type == "conditional" then
            v1502.conditional = v1501.kind.value:jsonEncode();
            return v1502;
        elseif v1501.kind.type == "binding_path" then
            v1502.bindingPath = v1501.kind.value;
        end;
    end;
    return v1502;
end;
v5.jsonDecode = function(v1503) --[[ Line: 10561 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_54 (copy), v2 (copy)
    local v1504 = l_v5_54.new();
    if v1503.literal ~= nil then
        v1504.kind = {
            type = "literal", 
            value = v1503.literal
        };
    end;
    if v1503.token ~= nil then
        v1504.kind = {
            type = "token", 
            value = v1503.token
        };
    end;
    if v1503.conditional ~= nil then
        v1504.kind = {
            type = "conditional", 
            value = v2.UDim2Prop_ConditionalOptions.jsonDecode(v1503.conditional)
        };
    end;
    if v1503.binding_path ~= nil then
        v1504.kind = {
            type = "binding_path", 
            value = v1503.binding_path
        };
    end;
    if v1503.bindingPath ~= nil then
        v1504.kind = {
            type = "binding_path", 
            value = v1503.bindingPath
        };
    end;
    return v1504;
end;
v5.descriptor = {
    name = "UDim2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
};
v2.UDim2Prop = v5;
v1.default:register(v2.UDim2Prop);
v5 = {};
v5.__index = v5;
local l_v5_55 = v5 --[[ copy: 5 -> 61 ]];
v5.new = function(v1506) --[[ Line: 10602 ]] --[[ Name: new ]]
    -- upvalues: l_v5_55 (copy)
    return (setmetatable({
        condition = if not (v1506 ~= nil) or v1506.condition == nil then nil else v1506.condition, 
        kind = if not (v1506 ~= nil) or v1506.kind == nil then nil else v1506.kind
    }, l_v5_55));
end;
v5.encode = function(v1507) --[[ Line: 10611 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1508 = buffer.create(0);
    local v1509 = 0;
    if v1507.condition ~= nil then
        local v1510 = v1507.condition:encode();
        local v1511, v1512 = v0.writeTag(v1508, v1509, 1, v0.wireTypes.lengthDelimited);
        v1511, v1512 = v0.writeBuffer(v1511, v1512, v1510, buffer.len(v1510));
        v1508 = v1511;
        v1509 = v1512;
    end;
    if v1507.kind ~= nil then
        if v1507.kind.type == "literal" then
            local v1513, v1514 = v0.writeTag(v1508, v1509, 2, v0.wireTypes.lengthDelimited);
            v1513, v1514 = v0.writeString(v1513, v1514, v1507.kind.value);
            v1508 = v1513;
            v1509 = v1514;
        elseif v1507.kind.type == "token" then
            local v1515, v1516 = v0.writeTag(v1508, v1509, 3, v0.wireTypes.lengthDelimited);
            v1515, v1516 = v0.writeString(v1515, v1516, v1507.kind.value);
            v1508 = v1515;
            v1509 = v1516;
        elseif v1507.kind.type == "binding_path" then
            local v1517, v1518 = v0.writeTag(v1508, v1509, 4, v0.wireTypes.lengthDelimited);
            v1517, v1518 = v0.writeString(v1517, v1518, v1507.kind.value);
            v1508 = v1517;
            v1509 = v1518;
        end;
    end;
    local v1519 = buffer.create(v1509);
    buffer.copy(v1519, 0, v1508, 0, v1509);
    return v1519;
end;
v5.decode = function(v1520) --[[ Line: 10639 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_55 (copy), v0 (copy), v4 (copy)
    local v1521 = l_v5_55.new();
    local v1522 = 0;
    while v1522 < buffer.len(v1520) do
        local v1523 = nil;
        local v1524 = nil;
        local v1525, v1526, v1527 = v0.readTag(v1520, v1522);
        v1523 = v1525;
        v1524 = v1526;
        v1522 = v1527;
        if v1524 == v0.wireTypes.varint then
            v1525 = nil;
            v1526, v1527 = v0.readVarInt(v1520, v1522);
            v1525 = v1526;
            v1522 = v1527;
        elseif v1524 == v0.wireTypes.lengthDelimited then
            if v1523 == 1 then
                v1525 = nil;
                v1526, v1527 = v0.readBuffer(v1520, v1522);
                v1525 = v1526;
                v1522 = v1527;
                v1521.condition = v4.PropCondition.decode(v1525);
            elseif v1523 == 2 then
                v1525 = nil;
                v1526, v1527 = v0.readBuffer(v1520, v1522);
                v1525 = v1526;
                v1522 = v1527;
                v1521.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1525)
                };
            elseif v1523 == 3 then
                v1525 = nil;
                v1526, v1527 = v0.readBuffer(v1520, v1522);
                v1525 = v1526;
                v1522 = v1527;
                v1521.kind = {
                    type = "token", 
                    value = buffer.tostring(v1525)
                };
            elseif v1523 == 4 then
                v1525 = nil;
                v1526, v1527 = v0.readBuffer(v1520, v1522);
                v1525 = v1526;
                v1522 = v1527;
                v1521.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1525)
                };
            else
                v1525 = nil;
                v1526, v1527 = v0.readVarInt(v1520, v1522);
                v1522 = v1527 + v1526;
            end;
        elseif v1524 == v0.wireTypes.i32 then
            v1525 = nil;
            v1526, v1527 = v0.readFixed32(v1520, v1522);
            v1525 = v1526;
            v1522 = v1527;
        elseif v1524 == v0.wireTypes.i64 then
            v1525 = nil;
            v1526, v1527 = v0.readFixed64(v1520, v1522);
            v1525 = v1526;
            v1522 = v1527;
        else
            error("Unsupported wire type: " .. v1524);
        end;
    end;
    return v1521;
end;
v5.jsonEncode = function(v1528) --[[ Line: 10697 ]] --[[ Name: jsonEncode ]]
    local v1529 = {};
    if v1528.condition ~= nil then
        v1529.condition = v1528.condition:jsonEncode();
    end;
    if v1528.kind ~= nil then
        if v1528.kind.type == "literal" then
            v1529.literal = v1528.kind.value;
            return v1529;
        elseif v1528.kind.type == "token" then
            v1529.token = v1528.kind.value;
            return v1529;
        elseif v1528.kind.type == "binding_path" then
            v1529.bindingPath = v1528.kind.value;
        end;
    end;
    return v1529;
end;
v5.jsonDecode = function(v1530) --[[ Line: 10717 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_55 (copy), v4 (copy)
    local v1531 = l_v5_55.new();
    if v1530.condition ~= nil then
        v1531.condition = v4.PropCondition.jsonDecode(v1530.condition);
    end;
    if v1530.literal ~= nil then
        v1531.kind = {
            type = "literal", 
            value = v1530.literal
        };
    end;
    if v1530.token ~= nil then
        v1531.kind = {
            type = "token", 
            value = v1530.token
        };
    end;
    if v1530.binding_path ~= nil then
        v1531.kind = {
            type = "binding_path", 
            value = v1530.binding_path
        };
    end;
    if v1530.bindingPath ~= nil then
        v1531.kind = {
            type = "binding_path", 
            value = v1530.bindingPath
        };
    end;
    return v1531;
end;
v5.descriptor = {
    name = "UDim2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UDim2Prop_ConditionalOption = v5;
v1.default:register(v2.UDim2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_56 = v5 --[[ copy: 5 -> 62 ]];
v5.new = function(v1533) --[[ Line: 10758 ]] --[[ Name: new ]]
    -- upvalues: l_v5_56 (copy)
    return (setmetatable({
        options = if not (v1533 ~= nil) or v1533.options == nil then {} else v1533.options
    }, l_v5_56));
end;
v5.encode = function(v1534) --[[ Line: 10766 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1535 = buffer.create(0);
    local v1536 = 0;
    if v1534.options ~= nil and #v1534.options > 0 then
        for _, v1538 in v1534.options do
            local v1539 = v1538:encode();
            local v1540, v1541 = v0.writeTag(v1535, v1536, 1, v0.wireTypes.lengthDelimited);
            v1540, v1541 = v0.writeBuffer(v1540, v1541, v1539, buffer.len(v1539));
            v1535 = v1540;
            v1536 = v1541;
        end;
    end;
    local v1542 = buffer.create(v1536);
    buffer.copy(v1542, 0, v1535, 0, v1536);
    return v1542;
end;
v5.decode = function(v1543) --[[ Line: 10783 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_56 (copy), v0 (copy), v2 (copy)
    local v1544 = l_v5_56.new();
    local v1545 = 0;
    while v1545 < buffer.len(v1543) do
        local v1546 = nil;
        local v1547 = nil;
        local v1548, v1549, v1550 = v0.readTag(v1543, v1545);
        v1546 = v1548;
        v1547 = v1549;
        v1545 = v1550;
        if v1547 == v0.wireTypes.varint then
            v1548 = nil;
            v1549, v1550 = v0.readVarInt(v1543, v1545);
            v1548 = v1549;
            v1545 = v1550;
        elseif v1547 == v0.wireTypes.lengthDelimited then
            if v1546 == 1 then
                v1548 = nil;
                v1549, v1550 = v0.readBuffer(v1543, v1545);
                v1548 = v1549;
                v1545 = v1550;
                table.insert(v1544.options, v2.UDim2Prop_ConditionalOption.decode(v1548));
            else
                v1548 = nil;
                v1549, v1550 = v0.readVarInt(v1543, v1545);
                v1545 = v1550 + v1549;
            end;
        elseif v1547 == v0.wireTypes.i32 then
            v1548 = nil;
            v1549, v1550 = v0.readFixed32(v1543, v1545);
            v1548 = v1549;
            v1545 = v1550;
        elseif v1547 == v0.wireTypes.i64 then
            v1548 = nil;
            v1549, v1550 = v0.readFixed64(v1543, v1545);
            v1548 = v1549;
            v1545 = v1550;
        else
            error("Unsupported wire type: " .. v1547);
        end;
    end;
    return v1544;
end;
v5.jsonEncode = function(v1551) --[[ Line: 10826 ]] --[[ Name: jsonEncode ]]
    local v1552 = {};
    if v1551.options ~= nil and #v1551.options > 0 then
        local v1553 = {};
        for _, v1555 in v1551.options do
            table.insert(v1553, v1555:jsonEncode());
        end;
        v1552.options = v1553;
    end;
    return v1552;
end;
v5.jsonDecode = function(v1556) --[[ Line: 10840 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_56 (copy), v2 (copy)
    local v1557 = l_v5_56.new();
    if v1556.options ~= nil then
        local v1558 = {};
        for _, v1560 in v1556.options do
            table.insert(v1558, v2.UDim2Prop_ConditionalOption.jsonDecode(v1560));
        end;
        v1557.options = v1558;
    end;
    return v1557;
end;
v5.descriptor = {
    name = "UDim2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UDim2Prop_ConditionalOptions = v5;
v1.default:register(v2.UDim2Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_57 = v5 --[[ copy: 5 -> 63 ]];
v5.new = function(v1562) --[[ Line: 10869 ]] --[[ Name: new ]]
    -- upvalues: l_v5_57 (copy)
    return (setmetatable({
        kind = if not (v1562 ~= nil) or v1562.kind == nil then nil else v1562.kind
    }, l_v5_57));
end;
v5.encode = function(v1563) --[[ Line: 10875 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1564 = buffer.create(0);
    local v1565 = 0;
    if v1563.kind ~= nil then
        if v1563.kind.type == "literal" then
            local v1566, v1567 = v0.writeTag(v1564, v1565, 1, v0.wireTypes.lengthDelimited);
            v1566, v1567 = v0.writeString(v1566, v1567, v1563.kind.value);
            v1564 = v1566;
            v1565 = v1567;
        elseif v1563.kind.type == "token" then
            local v1568, v1569 = v0.writeTag(v1564, v1565, 2, v0.wireTypes.lengthDelimited);
            v1568, v1569 = v0.writeString(v1568, v1569, v1563.kind.value);
            v1564 = v1568;
            v1565 = v1569;
        elseif v1563.kind.type == "conditional" then
            local v1570 = v1563.kind.value:encode();
            local v1571, v1572 = v0.writeTag(v1564, v1565, 3, v0.wireTypes.lengthDelimited);
            v1571, v1572 = v0.writeBuffer(v1571, v1572, v1570, buffer.len(v1570));
            v1564 = v1571;
            v1565 = v1572;
        elseif v1563.kind.type == "binding_path" then
            local v1573, v1574 = v0.writeTag(v1564, v1565, 4, v0.wireTypes.lengthDelimited);
            v1573, v1574 = v0.writeString(v1573, v1574, v1563.kind.value);
            v1564 = v1573;
            v1565 = v1574;
        end;
    end;
    local v1575 = buffer.create(v1565);
    buffer.copy(v1575, 0, v1564, 0, v1565);
    return v1575;
end;
v5.decode = function(v1576) --[[ Line: 10901 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_57 (copy), v0 (copy), v2 (copy)
    local v1577 = l_v5_57.new();
    local v1578 = 0;
    while v1578 < buffer.len(v1576) do
        local v1579 = nil;
        local v1580 = nil;
        local v1581, v1582, v1583 = v0.readTag(v1576, v1578);
        v1579 = v1581;
        v1580 = v1582;
        v1578 = v1583;
        if v1580 == v0.wireTypes.varint then
            v1581 = nil;
            v1582, v1583 = v0.readVarInt(v1576, v1578);
            v1581 = v1582;
            v1578 = v1583;
        elseif v1580 == v0.wireTypes.lengthDelimited then
            if v1579 == 1 then
                v1581 = nil;
                v1582, v1583 = v0.readBuffer(v1576, v1578);
                v1581 = v1582;
                v1578 = v1583;
                v1577.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1581)
                };
            elseif v1579 == 2 then
                v1581 = nil;
                v1582, v1583 = v0.readBuffer(v1576, v1578);
                v1581 = v1582;
                v1578 = v1583;
                v1577.kind = {
                    type = "token", 
                    value = buffer.tostring(v1581)
                };
            elseif v1579 == 3 then
                v1581 = nil;
                v1582, v1583 = v0.readBuffer(v1576, v1578);
                v1581 = v1582;
                v1578 = v1583;
                v1577.kind = {
                    type = "conditional", 
                    value = v2.Vector2Prop_ConditionalOptions.decode(v1581)
                };
            elseif v1579 == 4 then
                v1581 = nil;
                v1582, v1583 = v0.readBuffer(v1576, v1578);
                v1581 = v1582;
                v1578 = v1583;
                v1577.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1581)
                };
            else
                v1581 = nil;
                v1582, v1583 = v0.readVarInt(v1576, v1578);
                v1578 = v1583 + v1582;
            end;
        elseif v1580 == v0.wireTypes.i32 then
            v1581 = nil;
            v1582, v1583 = v0.readFixed32(v1576, v1578);
            v1581 = v1582;
            v1578 = v1583;
        elseif v1580 == v0.wireTypes.i64 then
            v1581 = nil;
            v1582, v1583 = v0.readFixed64(v1576, v1578);
            v1581 = v1582;
            v1578 = v1583;
        else
            error("Unsupported wire type: " .. v1580);
        end;
    end;
    return v1577;
end;
v5.jsonEncode = function(v1584) --[[ Line: 10959 ]] --[[ Name: jsonEncode ]]
    local v1585 = {};
    if v1584.kind ~= nil then
        if v1584.kind.type == "literal" then
            v1585.literal = v1584.kind.value;
            return v1585;
        elseif v1584.kind.type == "token" then
            v1585.token = v1584.kind.value;
            return v1585;
        elseif v1584.kind.type == "conditional" then
            v1585.conditional = v1584.kind.value:jsonEncode();
            return v1585;
        elseif v1584.kind.type == "binding_path" then
            v1585.bindingPath = v1584.kind.value;
        end;
    end;
    return v1585;
end;
v5.jsonDecode = function(v1586) --[[ Line: 10977 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_57 (copy), v2 (copy)
    local v1587 = l_v5_57.new();
    if v1586.literal ~= nil then
        v1587.kind = {
            type = "literal", 
            value = v1586.literal
        };
    end;
    if v1586.token ~= nil then
        v1587.kind = {
            type = "token", 
            value = v1586.token
        };
    end;
    if v1586.conditional ~= nil then
        v1587.kind = {
            type = "conditional", 
            value = v2.Vector2Prop_ConditionalOptions.jsonDecode(v1586.conditional)
        };
    end;
    if v1586.binding_path ~= nil then
        v1587.kind = {
            type = "binding_path", 
            value = v1586.binding_path
        };
    end;
    if v1586.bindingPath ~= nil then
        v1587.kind = {
            type = "binding_path", 
            value = v1586.bindingPath
        };
    end;
    return v1587;
end;
v5.descriptor = {
    name = "Vector2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
};
v2.Vector2Prop = v5;
v1.default:register(v2.Vector2Prop);
v5 = {};
v5.__index = v5;
local l_v5_58 = v5 --[[ copy: 5 -> 64 ]];
v5.new = function(v1589) --[[ Line: 11018 ]] --[[ Name: new ]]
    -- upvalues: l_v5_58 (copy)
    return (setmetatable({
        condition = if not (v1589 ~= nil) or v1589.condition == nil then nil else v1589.condition, 
        kind = if not (v1589 ~= nil) or v1589.kind == nil then nil else v1589.kind
    }, l_v5_58));
end;
v5.encode = function(v1590) --[[ Line: 11027 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1591 = buffer.create(0);
    local v1592 = 0;
    if v1590.condition ~= nil then
        local v1593 = v1590.condition:encode();
        local v1594, v1595 = v0.writeTag(v1591, v1592, 1, v0.wireTypes.lengthDelimited);
        v1594, v1595 = v0.writeBuffer(v1594, v1595, v1593, buffer.len(v1593));
        v1591 = v1594;
        v1592 = v1595;
    end;
    if v1590.kind ~= nil then
        if v1590.kind.type == "literal" then
            local v1596, v1597 = v0.writeTag(v1591, v1592, 2, v0.wireTypes.lengthDelimited);
            v1596, v1597 = v0.writeString(v1596, v1597, v1590.kind.value);
            v1591 = v1596;
            v1592 = v1597;
        elseif v1590.kind.type == "token" then
            local v1598, v1599 = v0.writeTag(v1591, v1592, 3, v0.wireTypes.lengthDelimited);
            v1598, v1599 = v0.writeString(v1598, v1599, v1590.kind.value);
            v1591 = v1598;
            v1592 = v1599;
        elseif v1590.kind.type == "binding_path" then
            local v1600, v1601 = v0.writeTag(v1591, v1592, 4, v0.wireTypes.lengthDelimited);
            v1600, v1601 = v0.writeString(v1600, v1601, v1590.kind.value);
            v1591 = v1600;
            v1592 = v1601;
        end;
    end;
    local v1602 = buffer.create(v1592);
    buffer.copy(v1602, 0, v1591, 0, v1592);
    return v1602;
end;
v5.decode = function(v1603) --[[ Line: 11055 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_58 (copy), v0 (copy), v4 (copy)
    local v1604 = l_v5_58.new();
    local v1605 = 0;
    while v1605 < buffer.len(v1603) do
        local v1606 = nil;
        local v1607 = nil;
        local v1608, v1609, v1610 = v0.readTag(v1603, v1605);
        v1606 = v1608;
        v1607 = v1609;
        v1605 = v1610;
        if v1607 == v0.wireTypes.varint then
            v1608 = nil;
            v1609, v1610 = v0.readVarInt(v1603, v1605);
            v1608 = v1609;
            v1605 = v1610;
        elseif v1607 == v0.wireTypes.lengthDelimited then
            if v1606 == 1 then
                v1608 = nil;
                v1609, v1610 = v0.readBuffer(v1603, v1605);
                v1608 = v1609;
                v1605 = v1610;
                v1604.condition = v4.PropCondition.decode(v1608);
            elseif v1606 == 2 then
                v1608 = nil;
                v1609, v1610 = v0.readBuffer(v1603, v1605);
                v1608 = v1609;
                v1605 = v1610;
                v1604.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1608)
                };
            elseif v1606 == 3 then
                v1608 = nil;
                v1609, v1610 = v0.readBuffer(v1603, v1605);
                v1608 = v1609;
                v1605 = v1610;
                v1604.kind = {
                    type = "token", 
                    value = buffer.tostring(v1608)
                };
            elseif v1606 == 4 then
                v1608 = nil;
                v1609, v1610 = v0.readBuffer(v1603, v1605);
                v1608 = v1609;
                v1605 = v1610;
                v1604.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1608)
                };
            else
                v1608 = nil;
                v1609, v1610 = v0.readVarInt(v1603, v1605);
                v1605 = v1610 + v1609;
            end;
        elseif v1607 == v0.wireTypes.i32 then
            v1608 = nil;
            v1609, v1610 = v0.readFixed32(v1603, v1605);
            v1608 = v1609;
            v1605 = v1610;
        elseif v1607 == v0.wireTypes.i64 then
            v1608 = nil;
            v1609, v1610 = v0.readFixed64(v1603, v1605);
            v1608 = v1609;
            v1605 = v1610;
        else
            error("Unsupported wire type: " .. v1607);
        end;
    end;
    return v1604;
end;
v5.jsonEncode = function(v1611) --[[ Line: 11113 ]] --[[ Name: jsonEncode ]]
    local v1612 = {};
    if v1611.condition ~= nil then
        v1612.condition = v1611.condition:jsonEncode();
    end;
    if v1611.kind ~= nil then
        if v1611.kind.type == "literal" then
            v1612.literal = v1611.kind.value;
            return v1612;
        elseif v1611.kind.type == "token" then
            v1612.token = v1611.kind.value;
            return v1612;
        elseif v1611.kind.type == "binding_path" then
            v1612.bindingPath = v1611.kind.value;
        end;
    end;
    return v1612;
end;
v5.jsonDecode = function(v1613) --[[ Line: 11133 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_58 (copy), v4 (copy)
    local v1614 = l_v5_58.new();
    if v1613.condition ~= nil then
        v1614.condition = v4.PropCondition.jsonDecode(v1613.condition);
    end;
    if v1613.literal ~= nil then
        v1614.kind = {
            type = "literal", 
            value = v1613.literal
        };
    end;
    if v1613.token ~= nil then
        v1614.kind = {
            type = "token", 
            value = v1613.token
        };
    end;
    if v1613.binding_path ~= nil then
        v1614.kind = {
            type = "binding_path", 
            value = v1613.binding_path
        };
    end;
    if v1613.bindingPath ~= nil then
        v1614.kind = {
            type = "binding_path", 
            value = v1613.bindingPath
        };
    end;
    return v1614;
end;
v5.descriptor = {
    name = "Vector2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Vector2Prop_ConditionalOption = v5;
v1.default:register(v2.Vector2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_59 = v5 --[[ copy: 5 -> 65 ]];
v5.new = function(v1616) --[[ Line: 11174 ]] --[[ Name: new ]]
    -- upvalues: l_v5_59 (copy)
    return (setmetatable({
        options = if not (v1616 ~= nil) or v1616.options == nil then {} else v1616.options
    }, l_v5_59));
end;
v5.encode = function(v1617) --[[ Line: 11182 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1618 = buffer.create(0);
    local v1619 = 0;
    if v1617.options ~= nil and #v1617.options > 0 then
        for _, v1621 in v1617.options do
            local v1622 = v1621:encode();
            local v1623, v1624 = v0.writeTag(v1618, v1619, 1, v0.wireTypes.lengthDelimited);
            v1623, v1624 = v0.writeBuffer(v1623, v1624, v1622, buffer.len(v1622));
            v1618 = v1623;
            v1619 = v1624;
        end;
    end;
    local v1625 = buffer.create(v1619);
    buffer.copy(v1625, 0, v1618, 0, v1619);
    return v1625;
end;
v5.decode = function(v1626) --[[ Line: 11199 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_59 (copy), v0 (copy), v2 (copy)
    local v1627 = l_v5_59.new();
    local v1628 = 0;
    while v1628 < buffer.len(v1626) do
        local v1629 = nil;
        local v1630 = nil;
        local v1631, v1632, v1633 = v0.readTag(v1626, v1628);
        v1629 = v1631;
        v1630 = v1632;
        v1628 = v1633;
        if v1630 == v0.wireTypes.varint then
            v1631 = nil;
            v1632, v1633 = v0.readVarInt(v1626, v1628);
            v1631 = v1632;
            v1628 = v1633;
        elseif v1630 == v0.wireTypes.lengthDelimited then
            if v1629 == 1 then
                v1631 = nil;
                v1632, v1633 = v0.readBuffer(v1626, v1628);
                v1631 = v1632;
                v1628 = v1633;
                table.insert(v1627.options, v2.Vector2Prop_ConditionalOption.decode(v1631));
            else
                v1631 = nil;
                v1632, v1633 = v0.readVarInt(v1626, v1628);
                v1628 = v1633 + v1632;
            end;
        elseif v1630 == v0.wireTypes.i32 then
            v1631 = nil;
            v1632, v1633 = v0.readFixed32(v1626, v1628);
            v1631 = v1632;
            v1628 = v1633;
        elseif v1630 == v0.wireTypes.i64 then
            v1631 = nil;
            v1632, v1633 = v0.readFixed64(v1626, v1628);
            v1631 = v1632;
            v1628 = v1633;
        else
            error("Unsupported wire type: " .. v1630);
        end;
    end;
    return v1627;
end;
v5.jsonEncode = function(v1634) --[[ Line: 11242 ]] --[[ Name: jsonEncode ]]
    local v1635 = {};
    if v1634.options ~= nil and #v1634.options > 0 then
        local v1636 = {};
        for _, v1638 in v1634.options do
            table.insert(v1636, v1638:jsonEncode());
        end;
        v1635.options = v1636;
    end;
    return v1635;
end;
v5.jsonDecode = function(v1639) --[[ Line: 11256 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_59 (copy), v2 (copy)
    local v1640 = l_v5_59.new();
    if v1639.options ~= nil then
        local v1641 = {};
        for _, v1643 in v1639.options do
            table.insert(v1641, v2.Vector2Prop_ConditionalOption.jsonDecode(v1643));
        end;
        v1640.options = v1641;
    end;
    return v1640;
end;
v5.descriptor = {
    name = "Vector2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Vector2Prop_ConditionalOptions = v5;
v1.default:register(v2.Vector2Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_60 = v5 --[[ copy: 5 -> 66 ]];
v5.new = function(v1645) --[[ Line: 11285 ]] --[[ Name: new ]]
    -- upvalues: l_v5_60 (copy)
    return (setmetatable({
        kind = if not (v1645 ~= nil) or v1645.kind == nil then nil else v1645.kind
    }, l_v5_60));
end;
v5.encode = function(v1646) --[[ Line: 11291 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1647 = buffer.create(0);
    local v1648 = 0;
    if v1646.kind ~= nil then
        if v1646.kind.type == "literal" then
            local v1649 = v1646.kind.value:encode();
            local v1650, v1651 = v0.writeTag(v1647, v1648, 1, v0.wireTypes.lengthDelimited);
            v1650, v1651 = v0.writeBuffer(v1650, v1651, v1649, buffer.len(v1649));
            v1647 = v1650;
            v1648 = v1651;
        elseif v1646.kind.type == "binding_path" then
            local v1652, v1653 = v0.writeTag(v1647, v1648, 2, v0.wireTypes.lengthDelimited);
            v1652, v1653 = v0.writeString(v1652, v1653, v1646.kind.value);
            v1647 = v1652;
            v1648 = v1653;
        elseif v1646.kind.type == "translation" then
            local v1654 = v1646.kind.value:encode();
            local v1655, v1656 = v0.writeTag(v1647, v1648, 3, v0.wireTypes.lengthDelimited);
            v1655, v1656 = v0.writeBuffer(v1655, v1656, v1654, buffer.len(v1654));
            v1647 = v1655;
            v1648 = v1656;
        end;
    end;
    local v1657 = buffer.create(v1648);
    buffer.copy(v1657, 0, v1647, 0, v1648);
    return v1657;
end;
v5.decode = function(v1658) --[[ Line: 11315 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_60 (copy), v0 (copy), v2 (copy)
    local v1659 = l_v5_60.new();
    local v1660 = 0;
    while v1660 < buffer.len(v1658) do
        local v1661 = nil;
        local v1662 = nil;
        local v1663, v1664, v1665 = v0.readTag(v1658, v1660);
        v1661 = v1663;
        v1662 = v1664;
        v1660 = v1665;
        if v1662 == v0.wireTypes.varint then
            v1663 = nil;
            v1664, v1665 = v0.readVarInt(v1658, v1660);
            v1663 = v1664;
            v1660 = v1665;
        elseif v1662 == v0.wireTypes.lengthDelimited then
            if v1661 == 1 then
                v1663 = nil;
                v1664, v1665 = v0.readBuffer(v1658, v1660);
                v1663 = v1664;
                v1660 = v1665;
                v1659.kind = {
                    type = "literal", 
                    value = v2.TemplateArg_LiteralValue.decode(v1663)
                };
            elseif v1661 == 2 then
                v1663 = nil;
                v1664, v1665 = v0.readBuffer(v1658, v1660);
                v1663 = v1664;
                v1660 = v1665;
                v1659.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1663)
                };
            elseif v1661 == 3 then
                v1663 = nil;
                v1664, v1665 = v0.readBuffer(v1658, v1660);
                v1663 = v1664;
                v1660 = v1665;
                v1659.kind = {
                    type = "translation", 
                    value = v2.TranslationRef.decode(v1663)
                };
            else
                v1663 = nil;
                v1664, v1665 = v0.readVarInt(v1658, v1660);
                v1660 = v1665 + v1664;
            end;
        elseif v1662 == v0.wireTypes.i32 then
            v1663 = nil;
            v1664, v1665 = v0.readFixed32(v1658, v1660);
            v1663 = v1664;
            v1660 = v1665;
        elseif v1662 == v0.wireTypes.i64 then
            v1663 = nil;
            v1664, v1665 = v0.readFixed64(v1658, v1660);
            v1663 = v1664;
            v1660 = v1665;
        else
            error("Unsupported wire type: " .. v1662);
        end;
    end;
    return v1659;
end;
v5.jsonEncode = function(v1666) --[[ Line: 11368 ]] --[[ Name: jsonEncode ]]
    local v1667 = {};
    if v1666.kind ~= nil then
        if v1666.kind.type == "literal" then
            v1667.literal = v1666.kind.value:jsonEncode();
            return v1667;
        elseif v1666.kind.type == "binding_path" then
            v1667.bindingPath = v1666.kind.value;
            return v1667;
        elseif v1666.kind.type == "translation" then
            v1667.translation = v1666.kind.value:jsonEncode();
        end;
    end;
    return v1667;
end;
v5.jsonDecode = function(v1668) --[[ Line: 11384 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_60 (copy), v2 (copy)
    local v1669 = l_v5_60.new();
    if v1668.literal ~= nil then
        v1669.kind = {
            type = "literal", 
            value = v2.TemplateArg_LiteralValue.jsonDecode(v1668.literal)
        };
    end;
    if v1668.binding_path ~= nil then
        v1669.kind = {
            type = "binding_path", 
            value = v1668.binding_path
        };
    end;
    if v1668.bindingPath ~= nil then
        v1669.kind = {
            type = "binding_path", 
            value = v1668.bindingPath
        };
    end;
    if v1668.translation ~= nil then
        v1669.kind = {
            type = "translation", 
            value = v2.TranslationRef.jsonDecode(v1668.translation)
        };
    end;
    return v1669;
end;
v5.descriptor = {
    name = "TemplateArg", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateArg"
};
v2.TemplateArg = v5;
v1.default:register(v2.TemplateArg);
v5 = {};
v5.__index = v5;
local l_v5_61 = v5 --[[ copy: 5 -> 67 ]];
v5.new = function(v1671) --[[ Line: 11420 ]] --[[ Name: new ]]
    -- upvalues: l_v5_61 (copy)
    return (setmetatable({
        kind = if not (v1671 ~= nil) or v1671.kind == nil then nil else v1671.kind
    }, l_v5_61));
end;
v5.encode = function(v1672) --[[ Line: 11426 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1673 = buffer.create(0);
    local v1674 = 0;
    if v1672.kind ~= nil then
        if v1672.kind.type == "string_value" then
            local v1675, v1676 = v0.writeTag(v1673, v1674, 1, v0.wireTypes.lengthDelimited);
            v1675, v1676 = v0.writeString(v1675, v1676, v1672.kind.value);
            v1673 = v1675;
            v1674 = v1676;
        elseif v1672.kind.type == "int32_value" then
            local v1677, v1678 = v0.writeTag(v1673, v1674, 2, v0.wireTypes.varint);
            v1677, v1678 = v0.writeVarInt(v1677, v1678, v1672.kind.value);
            v1673 = v1677;
            v1674 = v1678;
        elseif v1672.kind.type == "int64_value" then
            local v1679, v1680 = v0.writeTag(v1673, v1674, 3, v0.wireTypes.varint);
            v1679, v1680 = v0.writeVarInt(v1679, v1680, v1672.kind.value);
            v1673 = v1679;
            v1674 = v1680;
        elseif v1672.kind.type == "float_value" then
            local v1681, v1682 = v0.writeTag(v1673, v1674, 4, v0.wireTypes.i32);
            v1681, v1682 = v0.writeFloat(v1681, v1682, v1672.kind.value);
            v1673 = v1681;
            v1674 = v1682;
        elseif v1672.kind.type == "double_value" then
            local v1683, v1684 = v0.writeTag(v1673, v1674, 5, v0.wireTypes.i64);
            v1683, v1684 = v0.writeDouble(v1683, v1684, v1672.kind.value);
            v1673 = v1683;
            v1674 = v1684;
        elseif v1672.kind.type == "bool_value" then
            local v1685, v1686 = v0.writeTag(v1673, v1674, 6, v0.wireTypes.varint);
            v1685, v1686 = v0.writeVarInt(v1685, v1686, v1672.kind.value and 1 or 0);
            v1673 = v1685;
            v1674 = v1686;
        end;
    end;
    local v1687 = buffer.create(v1674);
    buffer.copy(v1687, 0, v1673, 0, v1674);
    return v1687;
end;
v5.decode = function(v1688) --[[ Line: 11457 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_61 (copy), v0 (copy)
    local v1689 = l_v5_61.new();
    local v1690 = 0;
    while v1690 < buffer.len(v1688) do
        local v1691 = nil;
        local v1692 = nil;
        local v1693, v1694, v1695 = v0.readTag(v1688, v1690);
        v1691 = v1693;
        v1692 = v1694;
        v1690 = v1695;
        if v1692 == v0.wireTypes.varint then
            if v1691 == 2 then
                v1693 = nil;
                v1694, v1695 = v0.readVarIntI32(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "int32_value", 
                    value = v1693
                };
            elseif v1691 == 3 then
                v1693 = nil;
                v1694, v1695 = v0.readVarIntI64(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "int64_value", 
                    value = v1693
                };
            elseif v1691 == 6 then
                v1693 = nil;
                v1694, v1695 = v0.readVarInt(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "bool_value", 
                    value = v1693 ~= 0
                };
            else
                v1693 = nil;
                v1694, v1695 = v0.readVarInt(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
            end;
        elseif v1692 == v0.wireTypes.lengthDelimited then
            if v1691 == 1 then
                v1693 = nil;
                v1694, v1695 = v0.readBuffer(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "string_value", 
                    value = buffer.tostring(v1693)
                };
            else
                v1693 = nil;
                v1694, v1695 = v0.readVarInt(v1688, v1690);
                v1690 = v1695 + v1694;
            end;
        elseif v1692 == v0.wireTypes.i32 then
            if v1691 == 4 then
                v1693 = nil;
                v1694, v1695 = v0.readFloat(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "float_value", 
                    value = v1693
                };
            else
                v1693 = nil;
                v1694, v1695 = v0.readFixed32(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
            end;
        elseif v1692 == v0.wireTypes.i64 then
            if v1691 == 5 then
                v1693 = nil;
                v1694, v1695 = v0.readDouble(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
                v1689.kind = {
                    type = "double_value", 
                    value = v1693
                };
            else
                v1693 = nil;
                v1694, v1695 = v0.readFixed64(v1688, v1690);
                v1693 = v1694;
                v1690 = v1695;
            end;
        else
            error("Unsupported wire type: " .. v1692);
        end;
    end;
    return v1689;
end;
v5.jsonEncode = function(v1696) --[[ Line: 11525 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v1697 = {};
    if v1696.kind ~= nil then
        if v1696.kind.type == "string_value" then
            v1697.stringValue = v1696.kind.value;
            return v1697;
        elseif v1696.kind.type == "int32_value" then
            v1697.int32Value = v1696.kind.value;
            return v1697;
        elseif v1696.kind.type == "int64_value" then
            v1697.int64Value = v1696.kind.value;
            return v1697;
        elseif v1696.kind.type == "float_value" then
            v1697.floatValue = v0.json.serializeNumber(v1696.kind.value);
            return v1697;
        elseif v1696.kind.type == "double_value" then
            v1697.doubleValue = v0.json.serializeNumber(v1696.kind.value);
            return v1697;
        elseif v1696.kind.type == "bool_value" then
            v1697.boolValue = v1696.kind.value;
        end;
    end;
    return v1697;
end;
v5.jsonDecode = function(v1698) --[[ Line: 11547 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_61 (copy), v0 (copy)
    local v1699 = l_v5_61.new();
    if v1698.string_value ~= nil then
        v1699.kind = {
            type = "string_value", 
            value = v1698.string_value
        };
    end;
    if v1698.stringValue ~= nil then
        v1699.kind = {
            type = "string_value", 
            value = v1698.stringValue
        };
    end;
    if v1698.int32_value ~= nil then
        v1699.kind = {
            type = "int32_value", 
            value = v1698.int32_value
        };
    end;
    if v1698.int32Value ~= nil then
        v1699.kind = {
            type = "int32_value", 
            value = v1698.int32Value
        };
    end;
    if v1698.int64_value ~= nil then
        v1699.kind = {
            type = "int64_value", 
            value = v1698.int64_value
        };
    end;
    if v1698.int64Value ~= nil then
        v1699.kind = {
            type = "int64_value", 
            value = v1698.int64Value
        };
    end;
    if v1698.float_value ~= nil then
        v1699.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v1698.float_value)
        };
    end;
    if v1698.floatValue ~= nil then
        v1699.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v1698.floatValue)
        };
    end;
    if v1698.double_value ~= nil then
        v1699.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v1698.double_value)
        };
    end;
    if v1698.doubleValue ~= nil then
        v1699.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v1698.doubleValue)
        };
    end;
    if v1698.bool_value ~= nil then
        v1699.kind = {
            type = "bool_value", 
            value = v1698.bool_value
        };
    end;
    if v1698.boolValue ~= nil then
        v1699.kind = {
            type = "bool_value", 
            value = v1698.boolValue
        };
    end;
    return v1699;
end;
v5.descriptor = {
    name = "TemplateArg_LiteralValue", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
};
v2.TemplateArg_LiteralValue = v5;
v1.default:register(v2.TemplateArg_LiteralValue);
v5 = {};
v5.__index = v5;
local l_v5_62 = v5 --[[ copy: 5 -> 68 ]];
v5.new = function(v1701) --[[ Line: 11615 ]] --[[ Name: new ]]
    -- upvalues: l_v5_62 (copy)
    return (setmetatable({
        kind = if not (v1701 ~= nil) or v1701.kind == nil then nil else v1701.kind
    }, l_v5_62));
end;
v5.encode = function(v1702) --[[ Line: 11621 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1703 = buffer.create(0);
    local v1704 = 0;
    if v1702.kind ~= nil then
        if v1702.kind.type == "literal" then
            local v1705 = v1702.kind.value:encode();
            local v1706, v1707 = v0.writeTag(v1703, v1704, 1, v0.wireTypes.lengthDelimited);
            v1706, v1707 = v0.writeBuffer(v1706, v1707, v1705, buffer.len(v1705));
            v1703 = v1706;
            v1704 = v1707;
        elseif v1702.kind.type == "conditional" then
            local v1708 = v1702.kind.value:encode();
            local v1709, v1710 = v0.writeTag(v1703, v1704, 2, v0.wireTypes.lengthDelimited);
            v1709, v1710 = v0.writeBuffer(v1709, v1710, v1708, buffer.len(v1708));
            v1703 = v1709;
            v1704 = v1710;
        end;
    end;
    local v1711 = buffer.create(v1704);
    buffer.copy(v1711, 0, v1703, 0, v1704);
    return v1711;
end;
v5.decode = function(v1712) --[[ Line: 11642 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_62 (copy), v0 (copy), v2 (copy)
    local v1713 = l_v5_62.new();
    local v1714 = 0;
    while v1714 < buffer.len(v1712) do
        local v1715 = nil;
        local v1716 = nil;
        local v1717, v1718, v1719 = v0.readTag(v1712, v1714);
        v1715 = v1717;
        v1716 = v1718;
        v1714 = v1719;
        if v1716 == v0.wireTypes.varint then
            v1717 = nil;
            v1718, v1719 = v0.readVarInt(v1712, v1714);
            v1717 = v1718;
            v1714 = v1719;
        elseif v1716 == v0.wireTypes.lengthDelimited then
            if v1715 == 1 then
                v1717 = nil;
                v1718, v1719 = v0.readBuffer(v1712, v1714);
                v1717 = v1718;
                v1714 = v1719;
                v1713.kind = {
                    type = "literal", 
                    value = v2.NestedComponentProp_TemplateData.decode(v1717)
                };
            elseif v1715 == 2 then
                v1717 = nil;
                v1718, v1719 = v0.readBuffer(v1712, v1714);
                v1717 = v1718;
                v1714 = v1719;
                v1713.kind = {
                    type = "conditional", 
                    value = v2.NestedComponentProp_ConditionalOptions.decode(v1717)
                };
            else
                v1717 = nil;
                v1718, v1719 = v0.readVarInt(v1712, v1714);
                v1714 = v1719 + v1718;
            end;
        elseif v1716 == v0.wireTypes.i32 then
            v1717 = nil;
            v1718, v1719 = v0.readFixed32(v1712, v1714);
            v1717 = v1718;
            v1714 = v1719;
        elseif v1716 == v0.wireTypes.i64 then
            v1717 = nil;
            v1718, v1719 = v0.readFixed64(v1712, v1714);
            v1717 = v1718;
            v1714 = v1719;
        else
            error("Unsupported wire type: " .. v1716);
        end;
    end;
    return v1713;
end;
v5.jsonEncode = function(v1720) --[[ Line: 11691 ]] --[[ Name: jsonEncode ]]
    local v1721 = {};
    if v1720.kind ~= nil then
        if v1720.kind.type == "literal" then
            v1721.literal = v1720.kind.value:jsonEncode();
            return v1721;
        elseif v1720.kind.type == "conditional" then
            v1721.conditional = v1720.kind.value:jsonEncode();
        end;
    end;
    return v1721;
end;
v5.jsonDecode = function(v1722) --[[ Line: 11705 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_62 (copy), v2 (copy)
    local v1723 = l_v5_62.new();
    if v1722.literal ~= nil then
        v1723.kind = {
            type = "literal", 
            value = v2.NestedComponentProp_TemplateData.jsonDecode(v1722.literal)
        };
    end;
    if v1722.conditional ~= nil then
        v1723.kind = {
            type = "conditional", 
            value = v2.NestedComponentProp_ConditionalOptions.jsonDecode(v1722.conditional)
        };
    end;
    return v1723;
end;
v5.descriptor = {
    name = "NestedComponentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.NestedComponentProp"
};
v2.NestedComponentProp = v5;
v1.default:register(v2.NestedComponentProp);
v5 = {};
v5.__index = v5;
local l_v5_63 = v5 --[[ copy: 5 -> 69 ]];
v5.new = function(v1725) --[[ Line: 11737 ]] --[[ Name: new ]]
    -- upvalues: l_v5_63 (copy)
    return (setmetatable({
        condition = if not (v1725 ~= nil) or v1725.condition == nil then nil else v1725.condition, 
        kind = if not (v1725 ~= nil) or v1725.kind == nil then nil else v1725.kind
    }, l_v5_63));
end;
v5.encode = function(v1726) --[[ Line: 11746 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1727 = buffer.create(0);
    local v1728 = 0;
    if v1726.condition ~= nil then
        local v1729 = v1726.condition:encode();
        local v1730, v1731 = v0.writeTag(v1727, v1728, 1, v0.wireTypes.lengthDelimited);
        v1730, v1731 = v0.writeBuffer(v1730, v1731, v1729, buffer.len(v1729));
        v1727 = v1730;
        v1728 = v1731;
    end;
    if v1726.kind ~= nil and v1726.kind.type == "literal" then
        local v1732 = v1726.kind.value:encode();
        local v1733, v1734 = v0.writeTag(v1727, v1728, 2, v0.wireTypes.lengthDelimited);
        v1733, v1734 = v0.writeBuffer(v1733, v1734, v1732, buffer.len(v1732));
        v1727 = v1733;
        v1728 = v1734;
    end;
    local v1735 = buffer.create(v1728);
    buffer.copy(v1735, 0, v1727, 0, v1728);
    return v1735;
end;
v5.decode = function(v1736) --[[ Line: 11769 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_63 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1737 = l_v5_63.new();
    local v1738 = 0;
    while v1738 < buffer.len(v1736) do
        local v1739 = nil;
        local v1740 = nil;
        local v1741, v1742, v1743 = v0.readTag(v1736, v1738);
        v1739 = v1741;
        v1740 = v1742;
        v1738 = v1743;
        if v1740 == v0.wireTypes.varint then
            v1741 = nil;
            v1742, v1743 = v0.readVarInt(v1736, v1738);
            v1741 = v1742;
            v1738 = v1743;
        elseif v1740 == v0.wireTypes.lengthDelimited then
            if v1739 == 1 then
                v1741 = nil;
                v1742, v1743 = v0.readBuffer(v1736, v1738);
                v1741 = v1742;
                v1738 = v1743;
                v1737.condition = v4.PropCondition.decode(v1741);
            elseif v1739 == 2 then
                v1741 = nil;
                v1742, v1743 = v0.readBuffer(v1736, v1738);
                v1741 = v1742;
                v1738 = v1743;
                v1737.kind = {
                    type = "literal", 
                    value = v2.NestedComponentProp_TemplateData.decode(v1741)
                };
            else
                v1741 = nil;
                v1742, v1743 = v0.readVarInt(v1736, v1738);
                v1738 = v1743 + v1742;
            end;
        elseif v1740 == v0.wireTypes.i32 then
            v1741 = nil;
            v1742, v1743 = v0.readFixed32(v1736, v1738);
            v1741 = v1742;
            v1738 = v1743;
        elseif v1740 == v0.wireTypes.i64 then
            v1741 = nil;
            v1742, v1743 = v0.readFixed64(v1736, v1738);
            v1741 = v1742;
            v1738 = v1743;
        else
            error("Unsupported wire type: " .. v1740);
        end;
    end;
    return v1737;
end;
v5.jsonEncode = function(v1744) --[[ Line: 11817 ]] --[[ Name: jsonEncode ]]
    local v1745 = {};
    if v1744.condition ~= nil then
        v1745.condition = v1744.condition:jsonEncode();
    end;
    if v1744.kind ~= nil and v1744.kind.type == "literal" then
        v1745.literal = v1744.kind.value:jsonEncode();
    end;
    return v1745;
end;
v5.jsonDecode = function(v1746) --[[ Line: 11833 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_63 (copy), v4 (copy), v2 (copy)
    local v1747 = l_v5_63.new();
    if v1746.condition ~= nil then
        v1747.condition = v4.PropCondition.jsonDecode(v1746.condition);
    end;
    if v1746.literal ~= nil then
        v1747.kind = {
            type = "literal", 
            value = v2.NestedComponentProp_TemplateData.jsonDecode(v1746.literal)
        };
    end;
    return v1747;
end;
v5.descriptor = {
    name = "NestedComponentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.NestedComponentProp_ConditionalOption = v5;
v1.default:register(v2.NestedComponentProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_64 = v5 --[[ copy: 5 -> 70 ]];
v5.new = function(v1749) --[[ Line: 11865 ]] --[[ Name: new ]]
    -- upvalues: l_v5_64 (copy)
    return (setmetatable({
        options = if not (v1749 ~= nil) or v1749.options == nil then {} else v1749.options
    }, l_v5_64));
end;
v5.encode = function(v1750) --[[ Line: 11873 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1751 = buffer.create(0);
    local v1752 = 0;
    if v1750.options ~= nil and #v1750.options > 0 then
        for _, v1754 in v1750.options do
            local v1755 = v1754:encode();
            local v1756, v1757 = v0.writeTag(v1751, v1752, 1, v0.wireTypes.lengthDelimited);
            v1756, v1757 = v0.writeBuffer(v1756, v1757, v1755, buffer.len(v1755));
            v1751 = v1756;
            v1752 = v1757;
        end;
    end;
    local v1758 = buffer.create(v1752);
    buffer.copy(v1758, 0, v1751, 0, v1752);
    return v1758;
end;
v5.decode = function(v1759) --[[ Line: 11890 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_64 (copy), v0 (copy), v2 (copy)
    local v1760 = l_v5_64.new();
    local v1761 = 0;
    while v1761 < buffer.len(v1759) do
        local v1762 = nil;
        local v1763 = nil;
        local v1764, v1765, v1766 = v0.readTag(v1759, v1761);
        v1762 = v1764;
        v1763 = v1765;
        v1761 = v1766;
        if v1763 == v0.wireTypes.varint then
            v1764 = nil;
            v1765, v1766 = v0.readVarInt(v1759, v1761);
            v1764 = v1765;
            v1761 = v1766;
        elseif v1763 == v0.wireTypes.lengthDelimited then
            if v1762 == 1 then
                v1764 = nil;
                v1765, v1766 = v0.readBuffer(v1759, v1761);
                v1764 = v1765;
                v1761 = v1766;
                table.insert(v1760.options, v2.NestedComponentProp_ConditionalOption.decode(v1764));
            else
                v1764 = nil;
                v1765, v1766 = v0.readVarInt(v1759, v1761);
                v1761 = v1766 + v1765;
            end;
        elseif v1763 == v0.wireTypes.i32 then
            v1764 = nil;
            v1765, v1766 = v0.readFixed32(v1759, v1761);
            v1764 = v1765;
            v1761 = v1766;
        elseif v1763 == v0.wireTypes.i64 then
            v1764 = nil;
            v1765, v1766 = v0.readFixed64(v1759, v1761);
            v1764 = v1765;
            v1761 = v1766;
        else
            error("Unsupported wire type: " .. v1763);
        end;
    end;
    return v1760;
end;
v5.jsonEncode = function(v1767) --[[ Line: 11933 ]] --[[ Name: jsonEncode ]]
    local v1768 = {};
    if v1767.options ~= nil and #v1767.options > 0 then
        local v1769 = {};
        for _, v1771 in v1767.options do
            table.insert(v1769, v1771:jsonEncode());
        end;
        v1768.options = v1769;
    end;
    return v1768;
end;
v5.jsonDecode = function(v1772) --[[ Line: 11947 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_64 (copy), v2 (copy)
    local v1773 = l_v5_64.new();
    if v1772.options ~= nil then
        local v1774 = {};
        for _, v1776 in v1772.options do
            table.insert(v1774, v2.NestedComponentProp_ConditionalOption.jsonDecode(v1776));
        end;
        v1773.options = v1774;
    end;
    return v1773;
end;
v5.descriptor = {
    name = "NestedComponentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.NestedComponentProp_ConditionalOptions = v5;
v1.default:register(v2.NestedComponentProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_65 = v5 --[[ copy: 5 -> 71 ]];
v5.new = function(v1778) --[[ Line: 11978 ]] --[[ Name: new ]]
    -- upvalues: l_v5_65 (copy)
    return (setmetatable({
        inputs = if not (v1778 ~= nil) or v1778.inputs == nil then {} else v1778.inputs, 
        roblox_component = (not (v1778 ~= nil) or v1778.roblox_component == nil) and "" or v1778.roblox_component
    }, l_v5_65));
end;
v5.encode = function(v1779) --[[ Line: 11987 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1780 = buffer.create(0);
    local v1781 = 0;
    if v1779.inputs ~= nil and next(v1779.inputs) ~= nil then
        for v1782, v1783 in v1779.inputs do
            local v1784 = buffer.create(0);
            local v1785, v1786 = v0.writeTag(v1784, 0, 1, v0.wireTypes.lengthDelimited);
            v1785, v1786 = v0.writeString(v1785, v1786, v1782);
            v1784 = v1785;
            local l_v1786_0 = v1786;
            v1785 = v1783:encode();
            local v1788;
            v1786, v1788 = v0.writeTag(v1784, l_v1786_0, 2, v0.wireTypes.lengthDelimited);
            v1786, v1788 = v0.writeBuffer(v1786, v1788, v1785, buffer.len(v1785));
            v1784 = v1786;
            l_v1786_0 = v1788;
            v1786, v1788 = v0.writeTag(v1780, v1781, 1, v0.wireTypes.lengthDelimited);
            v1786, v1788 = v0.writeBuffer(v1786, v1788, v1784, l_v1786_0);
            v1780 = v1786;
            v1781 = v1788;
        end;
    end;
    if v1779.roblox_component ~= nil and v1779.roblox_component ~= "" then
        local v1789, v1790 = v0.writeTag(v1780, v1781, 2, v0.wireTypes.lengthDelimited);
        v1789, v1790 = v0.writeString(v1789, v1790, v1779.roblox_component);
        v1780 = v1789;
        v1781 = v1790;
    end;
    local v1791 = buffer.create(v1781);
    buffer.copy(v1791, 0, v1780, 0, v1781);
    return v1791;
end;
v5.decode = function(v1792) --[[ Line: 12015 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_65 (copy), v0 (copy), v2 (copy)
    local v1793 = l_v5_65.new();
    local v1794 = 0;
    while v1794 < buffer.len(v1792) do
        local v1795 = nil;
        local v1796 = nil;
        local v1797, v1798, v1799 = v0.readTag(v1792, v1794);
        v1795 = v1797;
        v1796 = v1798;
        v1794 = v1799;
        if v1796 == v0.wireTypes.varint then
            v1797 = nil;
            v1798, v1799 = v0.readVarInt(v1792, v1794);
            v1797 = v1798;
            v1794 = v1799;
        elseif v1796 == v0.wireTypes.lengthDelimited then
            if v1795 == 1 then
                v1797 = nil;
                v1798, v1799 = v0.readBuffer(v1792, v1794);
                v1797 = v1798;
                v1794 = v1799;
                v1798 = v2.NestedComponentProp_TemplateData_InputsEntry.decode(v1797);
                v1799 = v2.TemplateArg.new();
                v1793.inputs[v1798.key or ""] = v1798.value or v1799;
            elseif v1795 == 2 then
                v1797 = nil;
                v1798, v1799 = v0.readBuffer(v1792, v1794);
                v1797 = v1798;
                v1794 = v1799;
                v1793.roblox_component = buffer.tostring(v1797);
            else
                v1797 = nil;
                v1798, v1799 = v0.readVarInt(v1792, v1794);
                v1794 = v1799 + v1798;
            end;
        elseif v1796 == v0.wireTypes.i32 then
            v1797 = nil;
            v1798, v1799 = v0.readFixed32(v1792, v1794);
            v1797 = v1798;
            v1794 = v1799;
        elseif v1796 == v0.wireTypes.i64 then
            v1797 = nil;
            v1798, v1799 = v0.readFixed64(v1792, v1794);
            v1797 = v1798;
            v1794 = v1799;
        else
            error("Unsupported wire type: " .. v1796);
        end;
    end;
    return v1793;
end;
v5.jsonEncode = function(v1800) --[[ Line: 12070 ]] --[[ Name: jsonEncode ]]
    local v1801 = {};
    if v1800.inputs ~= nil and next(v1800.inputs) ~= nil then
        local v1802 = {};
        for v1803, v1804 in v1800.inputs do
            v1802[v1803] = v1804:jsonEncode();
        end;
        v1801.inputs = v1802;
    end;
    if v1800.roblox_component ~= nil and v1800.roblox_component ~= "" then
        v1801.robloxComponent = v1800.roblox_component;
    end;
    return v1801;
end;
v5.jsonDecode = function(v1805) --[[ Line: 12088 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_65 (copy), v2 (copy)
    local v1806 = l_v5_65.new();
    if v1805.inputs ~= nil then
        local v1807 = {};
        for v1808, v1809 in v1805.inputs do
            v1807[v1808] = v2.TemplateArg.jsonDecode(v1809);
        end;
        v1806.inputs = v1807;
    end;
    if v1805.roblox_component ~= nil then
        v1806.roblox_component = v1805.roblox_component;
    end;
    if v1805.robloxComponent ~= nil then
        v1806.roblox_component = v1805.robloxComponent;
    end;
    return v1806;
end;
v5.descriptor = {
    name = "NestedComponentProp_TemplateData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
};
v2.NestedComponentProp_TemplateData = v5;
v1.default:register(v2.NestedComponentProp_TemplateData);
v5 = {};
v5.__index = v5;
local l_v5_66 = v5 --[[ copy: 5 -> 72 ]];
v5.new = function(v1811) --[[ Line: 12127 ]] --[[ Name: new ]]
    -- upvalues: l_v5_66 (copy)
    return (setmetatable({
        key = (not (v1811 ~= nil) or v1811.key == nil) and "" or v1811.key, 
        value = if not (v1811 ~= nil) or v1811.value == nil then nil else v1811.value
    }, l_v5_66));
end;
v5.encode = function(v1812) --[[ Line: 12136 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1813 = buffer.create(0);
    local v1814 = 0;
    if v1812.key ~= nil and v1812.key ~= "" then
        local v1815, v1816 = v0.writeTag(v1813, v1814, 1, v0.wireTypes.lengthDelimited);
        v1815, v1816 = v0.writeString(v1815, v1816, v1812.key);
        v1813 = v1815;
        v1814 = v1816;
    end;
    if v1812.value ~= nil then
        local v1817 = v1812.value:encode();
        local v1818, v1819 = v0.writeTag(v1813, v1814, 2, v0.wireTypes.lengthDelimited);
        v1818, v1819 = v0.writeBuffer(v1818, v1819, v1817, buffer.len(v1817));
        v1813 = v1818;
        v1814 = v1819;
    end;
    local v1820 = buffer.create(v1814);
    buffer.copy(v1820, 0, v1813, 0, v1814);
    return v1820;
end;
v5.decode = function(v1821) --[[ Line: 12158 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_66 (copy), v0 (copy), v2 (copy)
    local v1822 = l_v5_66.new();
    local v1823 = 0;
    while v1823 < buffer.len(v1821) do
        local v1824 = nil;
        local v1825 = nil;
        local v1826, v1827, v1828 = v0.readTag(v1821, v1823);
        v1824 = v1826;
        v1825 = v1827;
        v1823 = v1828;
        if v1825 == v0.wireTypes.varint then
            v1826 = nil;
            v1827, v1828 = v0.readVarInt(v1821, v1823);
            v1826 = v1827;
            v1823 = v1828;
        elseif v1825 == v0.wireTypes.lengthDelimited then
            if v1824 == 1 then
                v1826 = nil;
                v1827, v1828 = v0.readBuffer(v1821, v1823);
                v1826 = v1827;
                v1823 = v1828;
                v1822.key = buffer.tostring(v1826);
            elseif v1824 == 2 then
                v1826 = nil;
                v1827, v1828 = v0.readBuffer(v1821, v1823);
                v1826 = v1827;
                v1823 = v1828;
                v1822.value = v2.TemplateArg.decode(v1826);
            else
                v1826 = nil;
                v1827, v1828 = v0.readVarInt(v1821, v1823);
                v1823 = v1828 + v1827;
            end;
        elseif v1825 == v0.wireTypes.i32 then
            v1826 = nil;
            v1827, v1828 = v0.readFixed32(v1821, v1823);
            v1826 = v1827;
            v1823 = v1828;
        elseif v1825 == v0.wireTypes.i64 then
            v1826 = nil;
            v1827, v1828 = v0.readFixed64(v1821, v1823);
            v1826 = v1827;
            v1823 = v1828;
        else
            error("Unsupported wire type: " .. v1825);
        end;
    end;
    return v1822;
end;
v5.jsonEncode = function(v1829) --[[ Line: 12208 ]] --[[ Name: jsonEncode ]]
    local v1830 = {};
    if v1829.key ~= nil and v1829.key ~= "" then
        v1830.key = v1829.key;
    end;
    if v1829.value ~= nil then
        v1830.value = v1829.value:jsonEncode();
    end;
    return v1830;
end;
v5.jsonDecode = function(v1831) --[[ Line: 12224 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_66 (copy), v2 (copy)
    local v1832 = l_v5_66.new();
    if v1831.key ~= nil then
        v1832.key = v1831.key;
    end;
    if v1831.value ~= nil then
        v1832.value = v2.TemplateArg.jsonDecode(v1831.value);
    end;
    return v1832;
end;
v5.descriptor = {
    name = "NestedComponentProp_TemplateData_InputsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
};
v2.NestedComponentProp_TemplateData_InputsEntry = v5;
v1.default:register(v2.NestedComponentProp_TemplateData_InputsEntry);
v5 = {};
v5.__index = v5;
local l_v5_67 = v5 --[[ copy: 5 -> 73 ]];
v5.new = function(v1834) --[[ Line: 12254 ]] --[[ Name: new ]]
    -- upvalues: l_v5_67 (copy)
    return (setmetatable({
        kind = if not (v1834 ~= nil) or v1834.kind == nil then nil else v1834.kind
    }, l_v5_67));
end;
v5.encode = function(v1835) --[[ Line: 12262 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1836 = buffer.create(0);
    local v1837 = 0;
    if v1835.kind ~= nil then
        if v1835.kind.type == "array_map" then
            local v1838 = v1835.kind.value:encode();
            local v1839, v1840 = v0.writeTag(v1836, v1837, 1, v0.wireTypes.lengthDelimited);
            v1839, v1840 = v0.writeBuffer(v1839, v1840, v1838, buffer.len(v1838));
            v1836 = v1839;
            v1837 = v1840;
        elseif v1835.kind.type == "item_list" then
            local v1841 = v1835.kind.value:encode();
            local v1842, v1843 = v0.writeTag(v1836, v1837, 2, v0.wireTypes.lengthDelimited);
            v1842, v1843 = v0.writeBuffer(v1842, v1843, v1841, buffer.len(v1841));
            v1836 = v1842;
            v1837 = v1843;
        elseif v1835.kind.type == "conditional" then
            local v1844 = v1835.kind.value:encode();
            local v1845, v1846 = v0.writeTag(v1836, v1837, 3, v0.wireTypes.lengthDelimited);
            v1845, v1846 = v0.writeBuffer(v1845, v1846, v1844, buffer.len(v1844));
            v1836 = v1845;
            v1837 = v1846;
        elseif v1835.kind.type == "ordered_template_data" then
            local v1847 = v1835.kind.value:encode();
            local v1848, v1849 = v0.writeTag(v1836, v1837, 4, v0.wireTypes.lengthDelimited);
            v1848, v1849 = v0.writeBuffer(v1848, v1849, v1847, buffer.len(v1847));
            v1836 = v1848;
            v1837 = v1849;
        end;
    end;
    local v1850 = buffer.create(v1837);
    buffer.copy(v1850, 0, v1836, 0, v1837);
    return v1850;
end;
v5.decode = function(v1851) --[[ Line: 12291 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_67 (copy), v0 (copy), v2 (copy)
    local v1852 = l_v5_67.new();
    local v1853 = 0;
    while v1853 < buffer.len(v1851) do
        local v1854 = nil;
        local v1855 = nil;
        local v1856, v1857, v1858 = v0.readTag(v1851, v1853);
        v1854 = v1856;
        v1855 = v1857;
        v1853 = v1858;
        if v1855 == v0.wireTypes.varint then
            v1856 = nil;
            v1857, v1858 = v0.readVarInt(v1851, v1853);
            v1856 = v1857;
            v1853 = v1858;
        elseif v1855 == v0.wireTypes.lengthDelimited then
            if v1854 == 1 then
                v1856 = nil;
                v1857, v1858 = v0.readBuffer(v1851, v1853);
                v1856 = v1857;
                v1853 = v1858;
                v1852.kind = {
                    type = "array_map", 
                    value = v2.LazyNestedComponentListProp_TemplateData.decode(v1856)
                };
            elseif v1854 == 2 then
                v1856 = nil;
                v1857, v1858 = v0.readBuffer(v1851, v1853);
                v1856 = v1857;
                v1853 = v1858;
                v1852.kind = {
                    type = "item_list", 
                    value = v2.LazyNestedComponentListProp_TemplateDataList.decode(v1856)
                };
            elseif v1854 == 3 then
                v1856 = nil;
                v1857, v1858 = v0.readBuffer(v1851, v1853);
                v1856 = v1857;
                v1853 = v1858;
                v1852.kind = {
                    type = "conditional", 
                    value = v2.LazyNestedComponentListProp_ConditionalOptions.decode(v1856)
                };
            elseif v1854 == 4 then
                v1856 = nil;
                v1857, v1858 = v0.readBuffer(v1851, v1853);
                v1856 = v1857;
                v1853 = v1858;
                v1852.kind = {
                    type = "ordered_template_data", 
                    value = v2.LazyNestedComponentListProp_OrderedTemplateData.decode(v1856)
                };
            else
                v1856 = nil;
                v1857, v1858 = v0.readVarInt(v1851, v1853);
                v1853 = v1858 + v1857;
            end;
        elseif v1855 == v0.wireTypes.i32 then
            v1856 = nil;
            v1857, v1858 = v0.readFixed32(v1851, v1853);
            v1856 = v1857;
            v1853 = v1858;
        elseif v1855 == v0.wireTypes.i64 then
            v1856 = nil;
            v1857, v1858 = v0.readFixed64(v1851, v1853);
            v1856 = v1857;
            v1853 = v1858;
        else
            error("Unsupported wire type: " .. v1855);
        end;
    end;
    return v1852;
end;
v5.jsonEncode = function(v1859) --[[ Line: 12359 ]] --[[ Name: jsonEncode ]]
    local v1860 = {};
    if v1859.kind ~= nil then
        if v1859.kind.type == "array_map" then
            v1860.arrayMap = v1859.kind.value:jsonEncode();
            return v1860;
        elseif v1859.kind.type == "item_list" then
            v1860.itemList = v1859.kind.value:jsonEncode();
            return v1860;
        elseif v1859.kind.type == "conditional" then
            v1860.conditional = v1859.kind.value:jsonEncode();
            return v1860;
        elseif v1859.kind.type == "ordered_template_data" then
            v1860.orderedTemplateData = v1859.kind.value:jsonEncode();
        end;
    end;
    return v1860;
end;
v5.jsonDecode = function(v1861) --[[ Line: 12377 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_67 (copy), v2 (copy)
    local v1862 = l_v5_67.new();
    if v1861.array_map ~= nil then
        v1862.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1861.array_map)
        };
    end;
    if v1861.arrayMap ~= nil then
        v1862.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1861.arrayMap)
        };
    end;
    if v1861.item_list ~= nil then
        v1862.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1861.item_list)
        };
    end;
    if v1861.itemList ~= nil then
        v1862.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1861.itemList)
        };
    end;
    if v1861.conditional ~= nil then
        v1862.kind = {
            type = "conditional", 
            value = v2.LazyNestedComponentListProp_ConditionalOptions.jsonDecode(v1861.conditional)
        };
    end;
    if v1861.ordered_template_data ~= nil then
        v1862.kind = {
            type = "ordered_template_data", 
            value = v2.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(v1861.ordered_template_data)
        };
    end;
    if v1861.orderedTemplateData ~= nil then
        v1862.kind = {
            type = "ordered_template_data", 
            value = v2.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(v1861.orderedTemplateData)
        };
    end;
    return v1862;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LazyNestedComponentListProp"
};
v2.LazyNestedComponentListProp = v5;
v1.default:register(v2.LazyNestedComponentListProp);
v5 = {};
v5.__index = v5;
local l_v5_68 = v5 --[[ copy: 5 -> 74 ]];
v5.new = function(v1864) --[[ Line: 12448 ]] --[[ Name: new ]]
    -- upvalues: l_v5_68 (copy)
    return (setmetatable({
        condition = if not (v1864 ~= nil) or v1864.condition == nil then nil else v1864.condition, 
        kind = if not (v1864 ~= nil) or v1864.kind == nil then nil else v1864.kind
    }, l_v5_68));
end;
v5.encode = function(v1865) --[[ Line: 12457 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1866 = buffer.create(0);
    local v1867 = 0;
    if v1865.condition ~= nil then
        local v1868 = v1865.condition:encode();
        local v1869, v1870 = v0.writeTag(v1866, v1867, 1, v0.wireTypes.lengthDelimited);
        v1869, v1870 = v0.writeBuffer(v1869, v1870, v1868, buffer.len(v1868));
        v1866 = v1869;
        v1867 = v1870;
    end;
    if v1865.kind ~= nil then
        if v1865.kind.type == "literal" then
            local v1871 = v1865.kind.value:encode();
            local v1872, v1873 = v0.writeTag(v1866, v1867, 2, v0.wireTypes.lengthDelimited);
            v1872, v1873 = v0.writeBuffer(v1872, v1873, v1871, buffer.len(v1871));
            v1866 = v1872;
            v1867 = v1873;
        elseif v1865.kind.type == "item_list" then
            local v1874 = v1865.kind.value:encode();
            local v1875, v1876 = v0.writeTag(v1866, v1867, 3, v0.wireTypes.lengthDelimited);
            v1875, v1876 = v0.writeBuffer(v1875, v1876, v1874, buffer.len(v1874));
            v1866 = v1875;
            v1867 = v1876;
        end;
    end;
    local v1877 = buffer.create(v1867);
    buffer.copy(v1877, 0, v1866, 0, v1867);
    return v1877;
end;
v5.decode = function(v1878) --[[ Line: 12486 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_68 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1879 = l_v5_68.new();
    local v1880 = 0;
    while v1880 < buffer.len(v1878) do
        local v1881 = nil;
        local v1882 = nil;
        local v1883, v1884, v1885 = v0.readTag(v1878, v1880);
        v1881 = v1883;
        v1882 = v1884;
        v1880 = v1885;
        if v1882 == v0.wireTypes.varint then
            v1883 = nil;
            v1884, v1885 = v0.readVarInt(v1878, v1880);
            v1883 = v1884;
            v1880 = v1885;
        elseif v1882 == v0.wireTypes.lengthDelimited then
            if v1881 == 1 then
                v1883 = nil;
                v1884, v1885 = v0.readBuffer(v1878, v1880);
                v1883 = v1884;
                v1880 = v1885;
                v1879.condition = v4.PropCondition.decode(v1883);
            elseif v1881 == 2 then
                v1883 = nil;
                v1884, v1885 = v0.readBuffer(v1878, v1880);
                v1883 = v1884;
                v1880 = v1885;
                v1879.kind = {
                    type = "literal", 
                    value = v2.LazyNestedComponentListProp_TemplateData.decode(v1883)
                };
            elseif v1881 == 3 then
                v1883 = nil;
                v1884, v1885 = v0.readBuffer(v1878, v1880);
                v1883 = v1884;
                v1880 = v1885;
                v1879.kind = {
                    type = "item_list", 
                    value = v2.LazyNestedComponentListProp_TemplateDataList.decode(v1883)
                };
            else
                v1883 = nil;
                v1884, v1885 = v0.readVarInt(v1878, v1880);
                v1880 = v1885 + v1884;
            end;
        elseif v1882 == v0.wireTypes.i32 then
            v1883 = nil;
            v1884, v1885 = v0.readFixed32(v1878, v1880);
            v1883 = v1884;
            v1880 = v1885;
        elseif v1882 == v0.wireTypes.i64 then
            v1883 = nil;
            v1884, v1885 = v0.readFixed64(v1878, v1880);
            v1883 = v1884;
            v1880 = v1885;
        else
            error("Unsupported wire type: " .. v1882);
        end;
    end;
    return v1879;
end;
v5.jsonEncode = function(v1886) --[[ Line: 12545 ]] --[[ Name: jsonEncode ]]
    local v1887 = {};
    if v1886.condition ~= nil then
        v1887.condition = v1886.condition:jsonEncode();
    end;
    if v1886.kind ~= nil then
        if v1886.kind.type == "literal" then
            v1887.literal = v1886.kind.value:jsonEncode();
            return v1887;
        elseif v1886.kind.type == "item_list" then
            v1887.itemList = v1886.kind.value:jsonEncode();
        end;
    end;
    return v1887;
end;
v5.jsonDecode = function(v1888) --[[ Line: 12565 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_68 (copy), v4 (copy), v2 (copy)
    local v1889 = l_v5_68.new();
    if v1888.condition ~= nil then
        v1889.condition = v4.PropCondition.jsonDecode(v1888.condition);
    end;
    if v1888.literal ~= nil then
        v1889.kind = {
            type = "literal", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1888.literal)
        };
    end;
    if v1888.item_list ~= nil then
        v1889.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1888.item_list)
        };
    end;
    if v1888.itemList ~= nil then
        v1889.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1888.itemList)
        };
    end;
    return v1889;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.LazyNestedComponentListProp_ConditionalOption = v5;
v1.default:register(v2.LazyNestedComponentListProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_69 = v5 --[[ copy: 5 -> 75 ]];
v5.new = function(v1891) --[[ Line: 12613 ]] --[[ Name: new ]]
    -- upvalues: l_v5_69 (copy)
    return (setmetatable({
        options = if not (v1891 ~= nil) or v1891.options == nil then {} else v1891.options
    }, l_v5_69));
end;
v5.encode = function(v1892) --[[ Line: 12621 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1893 = buffer.create(0);
    local v1894 = 0;
    if v1892.options ~= nil and #v1892.options > 0 then
        for _, v1896 in v1892.options do
            local v1897 = v1896:encode();
            local v1898, v1899 = v0.writeTag(v1893, v1894, 1, v0.wireTypes.lengthDelimited);
            v1898, v1899 = v0.writeBuffer(v1898, v1899, v1897, buffer.len(v1897));
            v1893 = v1898;
            v1894 = v1899;
        end;
    end;
    local v1900 = buffer.create(v1894);
    buffer.copy(v1900, 0, v1893, 0, v1894);
    return v1900;
end;
v5.decode = function(v1901) --[[ Line: 12640 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_69 (copy), v0 (copy), v2 (copy)
    local v1902 = l_v5_69.new();
    local v1903 = 0;
    while v1903 < buffer.len(v1901) do
        local v1904 = nil;
        local v1905 = nil;
        local v1906, v1907, v1908 = v0.readTag(v1901, v1903);
        v1904 = v1906;
        v1905 = v1907;
        v1903 = v1908;
        if v1905 == v0.wireTypes.varint then
            v1906 = nil;
            v1907, v1908 = v0.readVarInt(v1901, v1903);
            v1906 = v1907;
            v1903 = v1908;
        elseif v1905 == v0.wireTypes.lengthDelimited then
            if v1904 == 1 then
                v1906 = nil;
                v1907, v1908 = v0.readBuffer(v1901, v1903);
                v1906 = v1907;
                v1903 = v1908;
                table.insert(v1902.options, v2.LazyNestedComponentListProp_ConditionalOption.decode(v1906));
            else
                v1906 = nil;
                v1907, v1908 = v0.readVarInt(v1901, v1903);
                v1903 = v1908 + v1907;
            end;
        elseif v1905 == v0.wireTypes.i32 then
            v1906 = nil;
            v1907, v1908 = v0.readFixed32(v1901, v1903);
            v1906 = v1907;
            v1903 = v1908;
        elseif v1905 == v0.wireTypes.i64 then
            v1906 = nil;
            v1907, v1908 = v0.readFixed64(v1901, v1903);
            v1906 = v1907;
            v1903 = v1908;
        else
            error("Unsupported wire type: " .. v1905);
        end;
    end;
    return v1902;
end;
v5.jsonEncode = function(v1909) --[[ Line: 12685 ]] --[[ Name: jsonEncode ]]
    local v1910 = {};
    if v1909.options ~= nil and #v1909.options > 0 then
        local v1911 = {};
        for _, v1913 in v1909.options do
            table.insert(v1911, v1913:jsonEncode());
        end;
        v1910.options = v1911;
    end;
    return v1910;
end;
v5.jsonDecode = function(v1914) --[[ Line: 12701 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_69 (copy), v2 (copy)
    local v1915 = l_v5_69.new();
    if v1914.options ~= nil then
        local v1916 = {};
        for _, v1918 in v1914.options do
            table.insert(v1916, v2.LazyNestedComponentListProp_ConditionalOption.jsonDecode(v1918));
        end;
        v1915.options = v1916;
    end;
    return v1915;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.LazyNestedComponentListProp_ConditionalOptions = v5;
v1.default:register(v2.LazyNestedComponentListProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_70 = v5 --[[ copy: 5 -> 76 ]];
v5.new = function(v1920) --[[ Line: 12732 ]] --[[ Name: new ]]
    -- upvalues: l_v5_70 (copy)
    return (setmetatable({
        binding_path = (not (v1920 ~= nil) or v1920.binding_path == nil) and "" or v1920.binding_path, 
        roblox_component = (not (v1920 ~= nil) or v1920.roblox_component == nil) and "" or v1920.roblox_component, 
        inputs = if not (v1920 ~= nil) or v1920.inputs == nil then {} else v1920.inputs
    }, l_v5_70));
end;
v5.encode = function(v1921) --[[ Line: 12742 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1922 = buffer.create(0);
    local v1923 = 0;
    if v1921.binding_path ~= nil and v1921.binding_path ~= "" then
        local v1924, v1925 = v0.writeTag(v1922, v1923, 1, v0.wireTypes.lengthDelimited);
        v1924, v1925 = v0.writeString(v1924, v1925, v1921.binding_path);
        v1922 = v1924;
        v1923 = v1925;
    end;
    if v1921.roblox_component ~= nil and v1921.roblox_component ~= "" then
        local v1926, v1927 = v0.writeTag(v1922, v1923, 2, v0.wireTypes.lengthDelimited);
        v1926, v1927 = v0.writeString(v1926, v1927, v1921.roblox_component);
        v1922 = v1926;
        v1923 = v1927;
    end;
    if v1921.inputs ~= nil and next(v1921.inputs) ~= nil then
        for v1928, v1929 in v1921.inputs do
            local v1930 = buffer.create(0);
            local v1931, v1932 = v0.writeTag(v1930, 0, 1, v0.wireTypes.lengthDelimited);
            v1931, v1932 = v0.writeString(v1931, v1932, v1928);
            v1930 = v1931;
            local l_v1932_0 = v1932;
            v1931 = v1929:encode();
            local v1934;
            v1932, v1934 = v0.writeTag(v1930, l_v1932_0, 2, v0.wireTypes.lengthDelimited);
            v1932, v1934 = v0.writeBuffer(v1932, v1934, v1931, buffer.len(v1931));
            v1930 = v1932;
            l_v1932_0 = v1934;
            v1932, v1934 = v0.writeTag(v1922, v1923, 3, v0.wireTypes.lengthDelimited);
            v1932, v1934 = v0.writeBuffer(v1932, v1934, v1930, l_v1932_0);
            v1922 = v1932;
            v1923 = v1934;
        end;
    end;
    local v1935 = buffer.create(v1923);
    buffer.copy(v1935, 0, v1922, 0, v1923);
    return v1935;
end;
v5.decode = function(v1936) --[[ Line: 12777 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_70 (copy), v0 (copy), v2 (copy)
    local v1937 = l_v5_70.new();
    local v1938 = 0;
    while v1938 < buffer.len(v1936) do
        local v1939 = nil;
        local v1940 = nil;
        local v1941, v1942, v1943 = v0.readTag(v1936, v1938);
        v1939 = v1941;
        v1940 = v1942;
        v1938 = v1943;
        if v1940 == v0.wireTypes.varint then
            v1941 = nil;
            v1942, v1943 = v0.readVarInt(v1936, v1938);
            v1941 = v1942;
            v1938 = v1943;
        elseif v1940 == v0.wireTypes.lengthDelimited then
            if v1939 == 1 then
                v1941 = nil;
                v1942, v1943 = v0.readBuffer(v1936, v1938);
                v1941 = v1942;
                v1938 = v1943;
                v1937.binding_path = buffer.tostring(v1941);
            elseif v1939 == 2 then
                v1941 = nil;
                v1942, v1943 = v0.readBuffer(v1936, v1938);
                v1941 = v1942;
                v1938 = v1943;
                v1937.roblox_component = buffer.tostring(v1941);
            elseif v1939 == 3 then
                v1941 = nil;
                v1942, v1943 = v0.readBuffer(v1936, v1938);
                v1941 = v1942;
                v1938 = v1943;
                v1942 = v2.LazyNestedComponentListProp_TemplateData_InputsEntry.decode(v1941);
                v1943 = v2.TemplateArg.new();
                v1937.inputs[v1942.key or ""] = v1942.value or v1943;
            else
                v1941 = nil;
                v1942, v1943 = v0.readVarInt(v1936, v1938);
                v1938 = v1943 + v1942;
            end;
        elseif v1940 == v0.wireTypes.i32 then
            v1941 = nil;
            v1942, v1943 = v0.readFixed32(v1936, v1938);
            v1941 = v1942;
            v1938 = v1943;
        elseif v1940 == v0.wireTypes.i64 then
            v1941 = nil;
            v1942, v1943 = v0.readFixed64(v1936, v1938);
            v1941 = v1942;
            v1938 = v1943;
        else
            error("Unsupported wire type: " .. v1940);
        end;
    end;
    return v1937;
end;
v5.jsonEncode = function(v1944) --[[ Line: 12839 ]] --[[ Name: jsonEncode ]]
    local v1945 = {};
    if v1944.binding_path ~= nil and v1944.binding_path ~= "" then
        v1945.bindingPath = v1944.binding_path;
    end;
    if v1944.roblox_component ~= nil and v1944.roblox_component ~= "" then
        v1945.robloxComponent = v1944.roblox_component;
    end;
    if v1944.inputs ~= nil and next(v1944.inputs) ~= nil then
        local v1946 = {};
        for v1947, v1948 in v1944.inputs do
            v1946[v1947] = v1948:jsonEncode();
        end;
        v1945.inputs = v1946;
    end;
    return v1945;
end;
v5.jsonDecode = function(v1949) --[[ Line: 12863 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_70 (copy), v2 (copy)
    local v1950 = l_v5_70.new();
    if v1949.binding_path ~= nil then
        v1950.binding_path = v1949.binding_path;
    end;
    if v1949.bindingPath ~= nil then
        v1950.binding_path = v1949.bindingPath;
    end;
    if v1949.roblox_component ~= nil then
        v1950.roblox_component = v1949.roblox_component;
    end;
    if v1949.robloxComponent ~= nil then
        v1950.roblox_component = v1949.robloxComponent;
    end;
    if v1949.inputs ~= nil then
        local v1951 = {};
        for v1952, v1953 in v1949.inputs do
            v1951[v1952] = v2.TemplateArg.jsonDecode(v1953);
        end;
        v1950.inputs = v1951;
    end;
    return v1950;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
};
v2.LazyNestedComponentListProp_TemplateData = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateData);
v5 = {};
v5.__index = v5;
local l_v5_71 = v5 --[[ copy: 5 -> 77 ]];
v5.new = function(v1955) --[[ Line: 12911 ]] --[[ Name: new ]]
    -- upvalues: l_v5_71 (copy)
    return (setmetatable({
        key = (not (v1955 ~= nil) or v1955.key == nil) and "" or v1955.key, 
        value = if not (v1955 ~= nil) or v1955.value == nil then nil else v1955.value
    }, l_v5_71));
end;
v5.encode = function(v1956) --[[ Line: 12923 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1957 = buffer.create(0);
    local v1958 = 0;
    if v1956.key ~= nil and v1956.key ~= "" then
        local v1959, v1960 = v0.writeTag(v1957, v1958, 1, v0.wireTypes.lengthDelimited);
        v1959, v1960 = v0.writeString(v1959, v1960, v1956.key);
        v1957 = v1959;
        v1958 = v1960;
    end;
    if v1956.value ~= nil then
        local v1961 = v1956.value:encode();
        local v1962, v1963 = v0.writeTag(v1957, v1958, 2, v0.wireTypes.lengthDelimited);
        v1962, v1963 = v0.writeBuffer(v1962, v1963, v1961, buffer.len(v1961));
        v1957 = v1962;
        v1958 = v1963;
    end;
    local v1964 = buffer.create(v1958);
    buffer.copy(v1964, 0, v1957, 0, v1958);
    return v1964;
end;
v5.decode = function(v1965) --[[ Line: 12945 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_71 (copy), v0 (copy), v2 (copy)
    local v1966 = l_v5_71.new();
    local v1967 = 0;
    while v1967 < buffer.len(v1965) do
        local v1968 = nil;
        local v1969 = nil;
        local v1970, v1971, v1972 = v0.readTag(v1965, v1967);
        v1968 = v1970;
        v1969 = v1971;
        v1967 = v1972;
        if v1969 == v0.wireTypes.varint then
            v1970 = nil;
            v1971, v1972 = v0.readVarInt(v1965, v1967);
            v1970 = v1971;
            v1967 = v1972;
        elseif v1969 == v0.wireTypes.lengthDelimited then
            if v1968 == 1 then
                v1970 = nil;
                v1971, v1972 = v0.readBuffer(v1965, v1967);
                v1970 = v1971;
                v1967 = v1972;
                v1966.key = buffer.tostring(v1970);
            elseif v1968 == 2 then
                v1970 = nil;
                v1971, v1972 = v0.readBuffer(v1965, v1967);
                v1970 = v1971;
                v1967 = v1972;
                v1966.value = v2.TemplateArg.decode(v1970);
            else
                v1970 = nil;
                v1971, v1972 = v0.readVarInt(v1965, v1967);
                v1967 = v1972 + v1971;
            end;
        elseif v1969 == v0.wireTypes.i32 then
            v1970 = nil;
            v1971, v1972 = v0.readFixed32(v1965, v1967);
            v1970 = v1971;
            v1967 = v1972;
        elseif v1969 == v0.wireTypes.i64 then
            v1970 = nil;
            v1971, v1972 = v0.readFixed64(v1965, v1967);
            v1970 = v1971;
            v1967 = v1972;
        else
            error("Unsupported wire type: " .. v1969);
        end;
    end;
    return v1966;
end;
v5.jsonEncode = function(v1973) --[[ Line: 12995 ]] --[[ Name: jsonEncode ]]
    local v1974 = {};
    if v1973.key ~= nil and v1973.key ~= "" then
        v1974.key = v1973.key;
    end;
    if v1973.value ~= nil then
        v1974.value = v1973.value:jsonEncode();
    end;
    return v1974;
end;
v5.jsonDecode = function(v1975) --[[ Line: 13011 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_71 (copy), v2 (copy)
    local v1976 = l_v5_71.new();
    if v1975.key ~= nil then
        v1976.key = v1975.key;
    end;
    if v1975.value ~= nil then
        v1976.value = v2.TemplateArg.jsonDecode(v1975.value);
    end;
    return v1976;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateData_InputsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
};
v2.LazyNestedComponentListProp_TemplateData_InputsEntry = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateData_InputsEntry);
v5 = {};
v5.__index = v5;
local l_v5_72 = v5 --[[ copy: 5 -> 78 ]];
v5.new = function(v1978) --[[ Line: 13042 ]] --[[ Name: new ]]
    -- upvalues: l_v5_72 (copy)
    return (setmetatable({
        items = if not (v1978 ~= nil) or v1978.items == nil then {} else v1978.items
    }, l_v5_72));
end;
v5.encode = function(v1979) --[[ Line: 13050 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1980 = buffer.create(0);
    local v1981 = 0;
    if v1979.items ~= nil and #v1979.items > 0 then
        for _, v1983 in v1979.items do
            local v1984 = v1983:encode();
            local v1985, v1986 = v0.writeTag(v1980, v1981, 1, v0.wireTypes.lengthDelimited);
            v1985, v1986 = v0.writeBuffer(v1985, v1986, v1984, buffer.len(v1984));
            v1980 = v1985;
            v1981 = v1986;
        end;
    end;
    local v1987 = buffer.create(v1981);
    buffer.copy(v1987, 0, v1980, 0, v1981);
    return v1987;
end;
v5.decode = function(v1988) --[[ Line: 13069 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_72 (copy), v0 (copy), v2 (copy)
    local v1989 = l_v5_72.new();
    local v1990 = 0;
    while v1990 < buffer.len(v1988) do
        local v1991 = nil;
        local v1992 = nil;
        local v1993, v1994, v1995 = v0.readTag(v1988, v1990);
        v1991 = v1993;
        v1992 = v1994;
        v1990 = v1995;
        if v1992 == v0.wireTypes.varint then
            v1993 = nil;
            v1994, v1995 = v0.readVarInt(v1988, v1990);
            v1993 = v1994;
            v1990 = v1995;
        elseif v1992 == v0.wireTypes.lengthDelimited then
            if v1991 == 1 then
                v1993 = nil;
                v1994, v1995 = v0.readBuffer(v1988, v1990);
                v1993 = v1994;
                v1990 = v1995;
                table.insert(v1989.items, v2.LazyNestedComponentListProp_TemplateData.decode(v1993));
            else
                v1993 = nil;
                v1994, v1995 = v0.readVarInt(v1988, v1990);
                v1990 = v1995 + v1994;
            end;
        elseif v1992 == v0.wireTypes.i32 then
            v1993 = nil;
            v1994, v1995 = v0.readFixed32(v1988, v1990);
            v1993 = v1994;
            v1990 = v1995;
        elseif v1992 == v0.wireTypes.i64 then
            v1993 = nil;
            v1994, v1995 = v0.readFixed64(v1988, v1990);
            v1993 = v1994;
            v1990 = v1995;
        else
            error("Unsupported wire type: " .. v1992);
        end;
    end;
    return v1989;
end;
v5.jsonEncode = function(v1996) --[[ Line: 13114 ]] --[[ Name: jsonEncode ]]
    local v1997 = {};
    if v1996.items ~= nil and #v1996.items > 0 then
        local v1998 = {};
        for _, v2000 in v1996.items do
            table.insert(v1998, v2000:jsonEncode());
        end;
        v1997.items = v1998;
    end;
    return v1997;
end;
v5.jsonDecode = function(v2001) --[[ Line: 13130 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_72 (copy), v2 (copy)
    local v2002 = l_v5_72.new();
    if v2001.items ~= nil then
        local v2003 = {};
        for _, v2005 in v2001.items do
            table.insert(v2003, v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2005));
        end;
        v2002.items = v2003;
    end;
    return v2002;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateDataList", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateDataList"
};
v2.LazyNestedComponentListProp_TemplateDataList = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateDataList);
v5 = {};
v5.__index = v5;
local l_v5_73 = v5 --[[ copy: 5 -> 79 ]];
v5.new = function(v2007) --[[ Line: 13161 ]] --[[ Name: new ]]
    -- upvalues: l_v5_73 (copy)
    return (setmetatable({
        entry_map_path = (not (v2007 ~= nil) or v2007.entry_map_path == nil) and "" or v2007.entry_map_path, 
        entry_order = if not (v2007 ~= nil) or v2007.entry_order == nil then nil else v2007.entry_order, 
        template_data_map = if not (v2007 ~= nil) or v2007.template_data_map == nil then {} else v2007.template_data_map
    }, l_v5_73));
end;
v5.encode = function(v2008) --[[ Line: 13171 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2009 = buffer.create(0);
    local v2010 = 0;
    if v2008.entry_map_path ~= nil and v2008.entry_map_path ~= "" then
        local v2011, v2012 = v0.writeTag(v2009, v2010, 1, v0.wireTypes.lengthDelimited);
        v2011, v2012 = v0.writeString(v2011, v2012, v2008.entry_map_path);
        v2009 = v2011;
        v2010 = v2012;
    end;
    if v2008.entry_order ~= nil then
        local v2013 = v2008.entry_order:encode();
        local v2014, v2015 = v0.writeTag(v2009, v2010, 2, v0.wireTypes.lengthDelimited);
        v2014, v2015 = v0.writeBuffer(v2014, v2015, v2013, buffer.len(v2013));
        v2009 = v2014;
        v2010 = v2015;
    end;
    if v2008.template_data_map ~= nil and next(v2008.template_data_map) ~= nil then
        for v2016, v2017 in v2008.template_data_map do
            local v2018 = buffer.create(0);
            local v2019, v2020 = v0.writeTag(v2018, 0, 1, v0.wireTypes.lengthDelimited);
            v2019, v2020 = v0.writeString(v2019, v2020, v2016);
            v2018 = v2019;
            local l_v2020_0 = v2020;
            v2019 = v2017:encode();
            local v2022;
            v2020, v2022 = v0.writeTag(v2018, l_v2020_0, 2, v0.wireTypes.lengthDelimited);
            v2020, v2022 = v0.writeBuffer(v2020, v2022, v2019, buffer.len(v2019));
            v2018 = v2020;
            l_v2020_0 = v2022;
            v2020, v2022 = v0.writeTag(v2009, v2010, 3, v0.wireTypes.lengthDelimited);
            v2020, v2022 = v0.writeBuffer(v2020, v2022, v2018, l_v2020_0);
            v2009 = v2020;
            v2010 = v2022;
        end;
    end;
    local v2023 = buffer.create(v2010);
    buffer.copy(v2023, 0, v2009, 0, v2010);
    return v2023;
end;
v5.decode = function(v2024) --[[ Line: 13207 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_73 (copy), v0 (copy), v2 (copy)
    local v2025 = l_v5_73.new();
    local v2026 = 0;
    while v2026 < buffer.len(v2024) do
        local v2027 = nil;
        local v2028 = nil;
        local v2029, v2030, v2031 = v0.readTag(v2024, v2026);
        v2027 = v2029;
        v2028 = v2030;
        v2026 = v2031;
        if v2028 == v0.wireTypes.varint then
            v2029 = nil;
            v2030, v2031 = v0.readVarInt(v2024, v2026);
            v2029 = v2030;
            v2026 = v2031;
        elseif v2028 == v0.wireTypes.lengthDelimited then
            if v2027 == 1 then
                v2029 = nil;
                v2030, v2031 = v0.readBuffer(v2024, v2026);
                v2029 = v2030;
                v2026 = v2031;
                v2025.entry_map_path = buffer.tostring(v2029);
            elseif v2027 == 2 then
                v2029 = nil;
                v2030, v2031 = v0.readBuffer(v2024, v2026);
                v2029 = v2030;
                v2026 = v2031;
                v2025.entry_order = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.decode(v2029);
            elseif v2027 == 3 then
                v2029 = nil;
                v2030, v2031 = v0.readBuffer(v2024, v2026);
                v2029 = v2030;
                v2026 = v2031;
                v2030 = v2.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry.decode(v2029);
                v2031 = v2.LazyNestedComponentListProp_TemplateData.new();
                v2025.template_data_map[v2030.key or ""] = v2030.value or v2031;
            else
                v2029 = nil;
                v2030, v2031 = v0.readVarInt(v2024, v2026);
                v2026 = v2031 + v2030;
            end;
        elseif v2028 == v0.wireTypes.i32 then
            v2029 = nil;
            v2030, v2031 = v0.readFixed32(v2024, v2026);
            v2029 = v2030;
            v2026 = v2031;
        elseif v2028 == v0.wireTypes.i64 then
            v2029 = nil;
            v2030, v2031 = v0.readFixed64(v2024, v2026);
            v2029 = v2030;
            v2026 = v2031;
        else
            error("Unsupported wire type: " .. v2028);
        end;
    end;
    return v2025;
end;
v5.jsonEncode = function(v2032) --[[ Line: 13271 ]] --[[ Name: jsonEncode ]]
    local v2033 = {};
    if v2032.entry_map_path ~= nil and v2032.entry_map_path ~= "" then
        v2033.entryMapPath = v2032.entry_map_path;
    end;
    if v2032.entry_order ~= nil then
        v2033.entryOrder = v2032.entry_order:jsonEncode();
    end;
    if v2032.template_data_map ~= nil and next(v2032.template_data_map) ~= nil then
        local v2034 = {};
        for v2035, v2036 in v2032.template_data_map do
            v2034[v2035] = v2036:jsonEncode();
        end;
        v2033.templateDataMap = v2034;
    end;
    return v2033;
end;
v5.jsonDecode = function(v2037) --[[ Line: 13295 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_73 (copy), v2 (copy)
    local v2038 = l_v5_73.new();
    if v2037.entry_map_path ~= nil then
        v2038.entry_map_path = v2037.entry_map_path;
    end;
    if v2037.entryMapPath ~= nil then
        v2038.entry_map_path = v2037.entryMapPath;
    end;
    if v2037.entry_order ~= nil then
        v2038.entry_order = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.jsonDecode(v2037.entry_order);
    end;
    if v2037.entryOrder ~= nil then
        v2038.entry_order = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData.jsonDecode(v2037.entryOrder);
    end;
    if v2037.template_data_map ~= nil then
        local v2039 = {};
        for v2040, v2041 in v2037.template_data_map do
            v2039[v2040] = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2041);
        end;
        v2038.template_data_map = v2039;
    end;
    if v2037.templateDataMap ~= nil then
        local v2042 = {};
        for v2043, v2044 in v2037.templateDataMap do
            v2042[v2043] = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2044);
        end;
        v2038.template_data_map = v2042;
    end;
    return v2038;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_OrderedTemplateData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OrderedTemplateData"
};
v2.LazyNestedComponentListProp_OrderedTemplateData = v5;
v1.default:register(v2.LazyNestedComponentListProp_OrderedTemplateData);
v5 = {};
v5.__index = v5;
local l_v5_74 = v5 --[[ copy: 5 -> 80 ]];
v5.new = function(v2046) --[[ Line: 13355 ]] --[[ Name: new ]]
    -- upvalues: l_v5_74 (copy)
    return (setmetatable({
        kind = if not (v2046 ~= nil) or v2046.kind == nil then nil else v2046.kind
    }, l_v5_74));
end;
v5.encode = function(v2047) --[[ Line: 13366 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2048 = buffer.create(0);
    local v2049 = 0;
    if v2047.kind ~= nil then
        if v2047.kind.type == "literal" then
            local v2050 = v2047.kind.value:encode();
            local v2051, v2052 = v0.writeTag(v2048, v2049, 1, v0.wireTypes.lengthDelimited);
            v2051, v2052 = v0.writeBuffer(v2051, v2052, v2050, buffer.len(v2050));
            v2048 = v2051;
            v2049 = v2052;
        elseif v2047.kind.type == "binding_path" then
            local v2053, v2054 = v0.writeTag(v2048, v2049, 2, v0.wireTypes.lengthDelimited);
            v2053, v2054 = v0.writeString(v2053, v2054, v2047.kind.value);
            v2048 = v2053;
            v2049 = v2054;
        end;
    end;
    local v2055 = buffer.create(v2049);
    buffer.copy(v2055, 0, v2048, 0, v2049);
    return v2055;
end;
v5.decode = function(v2056) --[[ Line: 13388 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_74 (copy), v0 (copy), v2 (copy)
    local v2057 = l_v5_74.new();
    local v2058 = 0;
    while v2058 < buffer.len(v2056) do
        local v2059 = nil;
        local v2060 = nil;
        local v2061, v2062, v2063 = v0.readTag(v2056, v2058);
        v2059 = v2061;
        v2060 = v2062;
        v2058 = v2063;
        if v2060 == v0.wireTypes.varint then
            v2061 = nil;
            v2062, v2063 = v0.readVarInt(v2056, v2058);
            v2061 = v2062;
            v2058 = v2063;
        elseif v2060 == v0.wireTypes.lengthDelimited then
            if v2059 == 1 then
                v2061 = nil;
                v2062, v2063 = v0.readBuffer(v2056, v2058);
                v2061 = v2062;
                v2058 = v2063;
                v2057.kind = {
                    type = "literal", 
                    value = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue.decode(v2061)
                };
            elseif v2059 == 2 then
                v2061 = nil;
                v2062, v2063 = v0.readBuffer(v2056, v2058);
                v2061 = v2062;
                v2058 = v2063;
                v2057.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2061)
                };
            else
                v2061 = nil;
                v2062, v2063 = v0.readVarInt(v2056, v2058);
                v2058 = v2063 + v2062;
            end;
        elseif v2060 == v0.wireTypes.i32 then
            v2061 = nil;
            v2062, v2063 = v0.readFixed32(v2056, v2058);
            v2061 = v2062;
            v2058 = v2063;
        elseif v2060 == v0.wireTypes.i64 then
            v2061 = nil;
            v2062, v2063 = v0.readFixed64(v2056, v2058);
            v2061 = v2062;
            v2058 = v2063;
        else
            error("Unsupported wire type: " .. v2060);
        end;
    end;
    return v2057;
end;
v5.jsonEncode = function(v2064) --[[ Line: 13443 ]] --[[ Name: jsonEncode ]]
    local v2065 = {};
    if v2064.kind ~= nil then
        if v2064.kind.type == "literal" then
            v2065.literal = v2064.kind.value:jsonEncode();
            return v2065;
        elseif v2064.kind.type == "binding_path" then
            v2065.bindingPath = v2064.kind.value;
        end;
    end;
    return v2065;
end;
v5.jsonDecode = function(v2066) --[[ Line: 13459 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_74 (copy), v2 (copy)
    local v2067 = l_v5_74.new();
    if v2066.literal ~= nil then
        v2067.kind = {
            type = "literal", 
            value = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue.jsonDecode(v2066.literal)
        };
    end;
    if v2066.binding_path ~= nil then
        v2067.kind = {
            type = "binding_path", 
            value = v2066.binding_path
        };
    end;
    if v2066.bindingPath ~= nil then
        v2067.kind = {
            type = "binding_path", 
            value = v2066.bindingPath
        };
    end;
    return v2067;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderData"
};
v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData = v5;
v1.default:register(v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData);
v5 = {};
v5.__index = v5;
local l_v5_75 = v5 --[[ copy: 5 -> 81 ]];
v5.new = function(v2069) --[[ Line: 13500 ]] --[[ Name: new ]]
    -- upvalues: l_v5_75 (copy)
    return (setmetatable({
        items = if not (v2069 ~= nil) or v2069.items == nil then {} else v2069.items
    }, l_v5_75));
end;
v5.encode = function(v2070) --[[ Line: 13511 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2071 = buffer.create(0);
    local v2072 = 0;
    if v2070.items ~= nil and #v2070.items > 0 then
        for _, v2074 in v2070.items do
            local v2075, v2076 = v0.writeTag(v2071, v2072, 1, v0.wireTypes.lengthDelimited);
            v2075, v2076 = v0.writeString(v2075, v2076, v2074);
            v2071 = v2075;
            v2072 = v2076;
        end;
    end;
    local v2077 = buffer.create(v2072);
    buffer.copy(v2077, 0, v2071, 0, v2072);
    return v2077;
end;
v5.decode = function(v2078) --[[ Line: 13529 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_75 (copy), v0 (copy)
    local v2079 = l_v5_75.new();
    local v2080 = 0;
    while v2080 < buffer.len(v2078) do
        local v2081 = nil;
        local v2082 = nil;
        local v2083, v2084, v2085 = v0.readTag(v2078, v2080);
        v2081 = v2083;
        v2082 = v2084;
        v2080 = v2085;
        if v2082 == v0.wireTypes.varint then
            v2083 = nil;
            v2084, v2085 = v0.readVarInt(v2078, v2080);
            v2083 = v2084;
            v2080 = v2085;
        elseif v2082 == v0.wireTypes.lengthDelimited then
            if v2081 == 1 then
                v2083 = nil;
                v2084, v2085 = v0.readBuffer(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                table.insert(v2079.items, buffer.tostring(v2083));
            else
                v2083 = nil;
                v2084, v2085 = v0.readVarInt(v2078, v2080);
                v2080 = v2085 + v2084;
            end;
        elseif v2082 == v0.wireTypes.i32 then
            v2083 = nil;
            v2084, v2085 = v0.readFixed32(v2078, v2080);
            v2083 = v2084;
            v2080 = v2085;
        elseif v2082 == v0.wireTypes.i64 then
            v2083 = nil;
            v2084, v2085 = v0.readFixed64(v2078, v2080);
            v2083 = v2084;
            v2080 = v2085;
        else
            error("Unsupported wire type: " .. v2082);
        end;
    end;
    return v2079;
end;
v5.jsonEncode = function(v2086) --[[ Line: 13574 ]] --[[ Name: jsonEncode ]]
    local v2087 = {};
    if v2086.items ~= nil and #v2086.items > 0 then
        local v2088 = {};
        for _, v2090 in v2086.items do
            table.insert(v2088, v2090);
        end;
        v2087.items = v2088;
    end;
    return v2087;
end;
v5.jsonDecode = function(v2091) --[[ Line: 13590 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_75 (copy)
    local v2092 = l_v5_75.new();
    if v2091.items ~= nil then
        local v2093 = {};
        for _, v2095 in v2091.items do
            table.insert(v2093, v2095);
        end;
        v2092.items = v2093;
    end;
    return v2092;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
};
v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue = v5;
v1.default:register(v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue);
v5 = {};
v5.__index = v5;
local l_v5_76 = v5 --[[ copy: 5 -> 82 ]];
v5.new = function(v2097) --[[ Line: 13625 ]] --[[ Name: new ]]
    -- upvalues: l_v5_76 (copy)
    return (setmetatable({
        key = (not (v2097 ~= nil) or v2097.key == nil) and "" or v2097.key, 
        value = if not (v2097 ~= nil) or v2097.value == nil then nil else v2097.value
    }, l_v5_76));
end;
v5.encode = function(v2098) --[[ Line: 13637 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2099 = buffer.create(0);
    local v2100 = 0;
    if v2098.key ~= nil and v2098.key ~= "" then
        local v2101, v2102 = v0.writeTag(v2099, v2100, 1, v0.wireTypes.lengthDelimited);
        v2101, v2102 = v0.writeString(v2101, v2102, v2098.key);
        v2099 = v2101;
        v2100 = v2102;
    end;
    if v2098.value ~= nil then
        local v2103 = v2098.value:encode();
        local v2104, v2105 = v0.writeTag(v2099, v2100, 2, v0.wireTypes.lengthDelimited);
        v2104, v2105 = v0.writeBuffer(v2104, v2105, v2103, buffer.len(v2103));
        v2099 = v2104;
        v2100 = v2105;
    end;
    local v2106 = buffer.create(v2100);
    buffer.copy(v2106, 0, v2099, 0, v2100);
    return v2106;
end;
v5.decode = function(v2107) --[[ Line: 13659 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_76 (copy), v0 (copy), v2 (copy)
    local v2108 = l_v5_76.new();
    local v2109 = 0;
    while v2109 < buffer.len(v2107) do
        local v2110 = nil;
        local v2111 = nil;
        local v2112, v2113, v2114 = v0.readTag(v2107, v2109);
        v2110 = v2112;
        v2111 = v2113;
        v2109 = v2114;
        if v2111 == v0.wireTypes.varint then
            v2112 = nil;
            v2113, v2114 = v0.readVarInt(v2107, v2109);
            v2112 = v2113;
            v2109 = v2114;
        elseif v2111 == v0.wireTypes.lengthDelimited then
            if v2110 == 1 then
                v2112 = nil;
                v2113, v2114 = v0.readBuffer(v2107, v2109);
                v2112 = v2113;
                v2109 = v2114;
                v2108.key = buffer.tostring(v2112);
            elseif v2110 == 2 then
                v2112 = nil;
                v2113, v2114 = v0.readBuffer(v2107, v2109);
                v2112 = v2113;
                v2109 = v2114;
                v2108.value = v2.LazyNestedComponentListProp_TemplateData.decode(v2112);
            else
                v2112 = nil;
                v2113, v2114 = v0.readVarInt(v2107, v2109);
                v2109 = v2114 + v2113;
            end;
        elseif v2111 == v0.wireTypes.i32 then
            v2112 = nil;
            v2113, v2114 = v0.readFixed32(v2107, v2109);
            v2112 = v2113;
            v2109 = v2114;
        elseif v2111 == v0.wireTypes.i64 then
            v2112 = nil;
            v2113, v2114 = v0.readFixed64(v2107, v2109);
            v2112 = v2113;
            v2109 = v2114;
        else
            error("Unsupported wire type: " .. v2111);
        end;
    end;
    return v2108;
end;
v5.jsonEncode = function(v2115) --[[ Line: 13709 ]] --[[ Name: jsonEncode ]]
    local v2116 = {};
    if v2115.key ~= nil and v2115.key ~= "" then
        v2116.key = v2115.key;
    end;
    if v2115.value ~= nil then
        v2116.value = v2115.value:jsonEncode();
    end;
    return v2116;
end;
v5.jsonDecode = function(v2117) --[[ Line: 13725 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_76 (copy), v2 (copy)
    local v2118 = l_v5_76.new();
    if v2117.key ~= nil then
        v2118.key = v2117.key;
    end;
    if v2117.value ~= nil then
        v2118.value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2117.value);
    end;
    return v2118;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateDataMapEntry"
};
v2.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry = v5;
v1.default:register(v2.LazyNestedComponentListProp_OrderedTemplateData_TemplateDataMapEntry);
v5 = {};
v5.__index = v5;
local l_v5_77 = v5 --[[ copy: 5 -> 83 ]];
v5.new = function(v2120) --[[ Line: 13756 ]] --[[ Name: new ]]
    -- upvalues: l_v5_77 (copy)
    return (setmetatable({
        kind = if not (v2120 ~= nil) or v2120.kind == nil then nil else v2120.kind
    }, l_v5_77));
end;
v5.encode = function(v2121) --[[ Line: 13762 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2122 = buffer.create(0);
    local v2123 = 0;
    if v2121.kind ~= nil then
        if v2121.kind.type == "array_map" then
            local v2124 = v2121.kind.value:encode();
            local v2125, v2126 = v0.writeTag(v2122, v2123, 1, v0.wireTypes.lengthDelimited);
            v2125, v2126 = v0.writeBuffer(v2125, v2126, v2124, buffer.len(v2124));
            v2122 = v2125;
            v2123 = v2126;
        elseif v2121.kind.type == "item_list" then
            local v2127 = v2121.kind.value:encode();
            local v2128, v2129 = v0.writeTag(v2122, v2123, 2, v0.wireTypes.lengthDelimited);
            v2128, v2129 = v0.writeBuffer(v2128, v2129, v2127, buffer.len(v2127));
            v2122 = v2128;
            v2123 = v2129;
        elseif v2121.kind.type == "conditional" then
            local v2130 = v2121.kind.value:encode();
            local v2131, v2132 = v0.writeTag(v2122, v2123, 3, v0.wireTypes.lengthDelimited);
            v2131, v2132 = v0.writeBuffer(v2131, v2132, v2130, buffer.len(v2130));
            v2122 = v2131;
            v2123 = v2132;
        elseif v2121.kind.type == "ordered_template_data" then
            local v2133 = v2121.kind.value:encode();
            local v2134, v2135 = v0.writeTag(v2122, v2123, 4, v0.wireTypes.lengthDelimited);
            v2134, v2135 = v0.writeBuffer(v2134, v2135, v2133, buffer.len(v2133));
            v2122 = v2134;
            v2123 = v2135;
        end;
    end;
    local v2136 = buffer.create(v2123);
    buffer.copy(v2136, 0, v2122, 0, v2123);
    return v2136;
end;
v5.decode = function(v2137) --[[ Line: 13791 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_77 (copy), v0 (copy), v2 (copy)
    local v2138 = l_v5_77.new();
    local v2139 = 0;
    while v2139 < buffer.len(v2137) do
        local v2140 = nil;
        local v2141 = nil;
        local v2142, v2143, v2144 = v0.readTag(v2137, v2139);
        v2140 = v2142;
        v2141 = v2143;
        v2139 = v2144;
        if v2141 == v0.wireTypes.varint then
            v2142 = nil;
            v2143, v2144 = v0.readVarInt(v2137, v2139);
            v2142 = v2143;
            v2139 = v2144;
        elseif v2141 == v0.wireTypes.lengthDelimited then
            if v2140 == 1 then
                v2142 = nil;
                v2143, v2144 = v0.readBuffer(v2137, v2139);
                v2142 = v2143;
                v2139 = v2144;
                v2138.kind = {
                    type = "array_map", 
                    value = v2.LazyNestedComponentListProp_TemplateData.decode(v2142)
                };
            elseif v2140 == 2 then
                v2142 = nil;
                v2143, v2144 = v0.readBuffer(v2137, v2139);
                v2142 = v2143;
                v2139 = v2144;
                v2138.kind = {
                    type = "item_list", 
                    value = v2.LazyNestedComponentListProp_TemplateDataList.decode(v2142)
                };
            elseif v2140 == 3 then
                v2142 = nil;
                v2143, v2144 = v0.readBuffer(v2137, v2139);
                v2142 = v2143;
                v2139 = v2144;
                v2138.kind = {
                    type = "conditional", 
                    value = v2.LazyNestedComponentListProp_ConditionalOptions.decode(v2142)
                };
            elseif v2140 == 4 then
                v2142 = nil;
                v2143, v2144 = v0.readBuffer(v2137, v2139);
                v2142 = v2143;
                v2139 = v2144;
                v2138.kind = {
                    type = "ordered_template_data", 
                    value = v2.LazyNestedComponentListProp_OrderedTemplateData.decode(v2142)
                };
            else
                v2142 = nil;
                v2143, v2144 = v0.readVarInt(v2137, v2139);
                v2139 = v2144 + v2143;
            end;
        elseif v2141 == v0.wireTypes.i32 then
            v2142 = nil;
            v2143, v2144 = v0.readFixed32(v2137, v2139);
            v2142 = v2143;
            v2139 = v2144;
        elseif v2141 == v0.wireTypes.i64 then
            v2142 = nil;
            v2143, v2144 = v0.readFixed64(v2137, v2139);
            v2142 = v2143;
            v2139 = v2144;
        else
            error("Unsupported wire type: " .. v2141);
        end;
    end;
    return v2138;
end;
v5.jsonEncode = function(v2145) --[[ Line: 13859 ]] --[[ Name: jsonEncode ]]
    local v2146 = {};
    if v2145.kind ~= nil then
        if v2145.kind.type == "array_map" then
            v2146.arrayMap = v2145.kind.value:jsonEncode();
            return v2146;
        elseif v2145.kind.type == "item_list" then
            v2146.itemList = v2145.kind.value:jsonEncode();
            return v2146;
        elseif v2145.kind.type == "conditional" then
            v2146.conditional = v2145.kind.value:jsonEncode();
            return v2146;
        elseif v2145.kind.type == "ordered_template_data" then
            v2146.orderedTemplateData = v2145.kind.value:jsonEncode();
        end;
    end;
    return v2146;
end;
v5.jsonDecode = function(v2147) --[[ Line: 13877 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_77 (copy), v2 (copy)
    local v2148 = l_v5_77.new();
    if v2147.array_map ~= nil then
        v2148.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2147.array_map)
        };
    end;
    if v2147.arrayMap ~= nil then
        v2148.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v2147.arrayMap)
        };
    end;
    if v2147.item_list ~= nil then
        v2148.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v2147.item_list)
        };
    end;
    if v2147.itemList ~= nil then
        v2148.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v2147.itemList)
        };
    end;
    if v2147.conditional ~= nil then
        v2148.kind = {
            type = "conditional", 
            value = v2.LazyNestedComponentListProp_ConditionalOptions.jsonDecode(v2147.conditional)
        };
    end;
    if v2147.ordered_template_data ~= nil then
        v2148.kind = {
            type = "ordered_template_data", 
            value = v2.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(v2147.ordered_template_data)
        };
    end;
    if v2147.orderedTemplateData ~= nil then
        v2148.kind = {
            type = "ordered_template_data", 
            value = v2.LazyNestedComponentListProp_OrderedTemplateData.jsonDecode(v2147.orderedTemplateData)
        };
    end;
    return v2148;
end;
v5.descriptor = {
    name = "NestedComponentListProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.NestedComponentListProp"
};
v2.NestedComponentListProp = v5;
v1.default:register(v2.NestedComponentListProp);
v5 = {};
v5.__index = v5;
local l_v5_78 = v5 --[[ copy: 5 -> 84 ]];
v5.new = function(v2150) --[[ Line: 13948 ]] --[[ Name: new ]]
    -- upvalues: l_v5_78 (copy)
    return (setmetatable({
        kind = if not (v2150 ~= nil) or v2150.kind == nil then nil else v2150.kind
    }, l_v5_78));
end;
v5.encode = function(v2151) --[[ Line: 13954 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2152 = buffer.create(0);
    local v2153 = 0;
    if v2151.kind ~= nil then
        if v2151.kind.type == "literal" then
            local v2154, v2155 = v0.writeTag(v2152, v2153, 1, v0.wireTypes.lengthDelimited);
            v2154, v2155 = v0.writeString(v2154, v2155, v2151.kind.value);
            v2152 = v2154;
            v2153 = v2155;
        elseif v2151.kind.type == "binding_path" then
            local v2156, v2157 = v0.writeTag(v2152, v2153, 2, v0.wireTypes.lengthDelimited);
            v2156, v2157 = v0.writeString(v2156, v2157, v2151.kind.value);
            v2152 = v2156;
            v2153 = v2157;
        elseif v2151.kind.type == "conditional" then
            local v2158 = v2151.kind.value:encode();
            local v2159, v2160 = v0.writeTag(v2152, v2153, 3, v0.wireTypes.lengthDelimited);
            v2159, v2160 = v0.writeBuffer(v2159, v2160, v2158, buffer.len(v2158));
            v2152 = v2159;
            v2153 = v2160;
        end;
    end;
    local v2161 = buffer.create(v2153);
    buffer.copy(v2161, 0, v2152, 0, v2153);
    return v2161;
end;
v5.decode = function(v2162) --[[ Line: 13977 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_78 (copy), v0 (copy), v2 (copy)
    local v2163 = l_v5_78.new();
    local v2164 = 0;
    while v2164 < buffer.len(v2162) do
        local v2165 = nil;
        local v2166 = nil;
        local v2167, v2168, v2169 = v0.readTag(v2162, v2164);
        v2165 = v2167;
        v2166 = v2168;
        v2164 = v2169;
        if v2166 == v0.wireTypes.varint then
            v2167 = nil;
            v2168, v2169 = v0.readVarInt(v2162, v2164);
            v2167 = v2168;
            v2164 = v2169;
        elseif v2166 == v0.wireTypes.lengthDelimited then
            if v2165 == 1 then
                v2167 = nil;
                v2168, v2169 = v0.readBuffer(v2162, v2164);
                v2167 = v2168;
                v2164 = v2169;
                v2163.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2167)
                };
            elseif v2165 == 2 then
                v2167 = nil;
                v2168, v2169 = v0.readBuffer(v2162, v2164);
                v2167 = v2168;
                v2164 = v2169;
                v2163.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2167)
                };
            elseif v2165 == 3 then
                v2167 = nil;
                v2168, v2169 = v0.readBuffer(v2162, v2164);
                v2167 = v2168;
                v2164 = v2169;
                v2163.kind = {
                    type = "conditional", 
                    value = v2.IconProp_ConditionalOptions.decode(v2167)
                };
            else
                v2167 = nil;
                v2168, v2169 = v0.readVarInt(v2162, v2164);
                v2164 = v2169 + v2168;
            end;
        elseif v2166 == v0.wireTypes.i32 then
            v2167 = nil;
            v2168, v2169 = v0.readFixed32(v2162, v2164);
            v2167 = v2168;
            v2164 = v2169;
        elseif v2166 == v0.wireTypes.i64 then
            v2167 = nil;
            v2168, v2169 = v0.readFixed64(v2162, v2164);
            v2167 = v2168;
            v2164 = v2169;
        else
            error("Unsupported wire type: " .. v2166);
        end;
    end;
    return v2163;
end;
v5.jsonEncode = function(v2170) --[[ Line: 14030 ]] --[[ Name: jsonEncode ]]
    local v2171 = {};
    if v2170.kind ~= nil then
        if v2170.kind.type == "literal" then
            v2171.literal = v2170.kind.value;
            return v2171;
        elseif v2170.kind.type == "binding_path" then
            v2171.bindingPath = v2170.kind.value;
            return v2171;
        elseif v2170.kind.type == "conditional" then
            v2171.conditional = v2170.kind.value:jsonEncode();
        end;
    end;
    return v2171;
end;
v5.jsonDecode = function(v2172) --[[ Line: 14046 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_78 (copy), v2 (copy)
    local v2173 = l_v5_78.new();
    if v2172.literal ~= nil then
        v2173.kind = {
            type = "literal", 
            value = v2172.literal
        };
    end;
    if v2172.binding_path ~= nil then
        v2173.kind = {
            type = "binding_path", 
            value = v2172.binding_path
        };
    end;
    if v2172.bindingPath ~= nil then
        v2173.kind = {
            type = "binding_path", 
            value = v2172.bindingPath
        };
    end;
    if v2172.conditional ~= nil then
        v2173.kind = {
            type = "conditional", 
            value = v2.IconProp_ConditionalOptions.jsonDecode(v2172.conditional)
        };
    end;
    return v2173;
end;
v5.descriptor = {
    name = "IconProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
};
v2.IconProp = v5;
v1.default:register(v2.IconProp);
v5 = {};
v5.__index = v5;
local l_v5_79 = v5 --[[ copy: 5 -> 85 ]];
v5.new = function(v2175) --[[ Line: 14083 ]] --[[ Name: new ]]
    -- upvalues: l_v5_79 (copy)
    return (setmetatable({
        condition = if not (v2175 ~= nil) or v2175.condition == nil then nil else v2175.condition, 
        kind = if not (v2175 ~= nil) or v2175.kind == nil then nil else v2175.kind
    }, l_v5_79));
end;
v5.encode = function(v2176) --[[ Line: 14092 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2177 = buffer.create(0);
    local v2178 = 0;
    if v2176.condition ~= nil then
        local v2179 = v2176.condition:encode();
        local v2180, v2181 = v0.writeTag(v2177, v2178, 1, v0.wireTypes.lengthDelimited);
        v2180, v2181 = v0.writeBuffer(v2180, v2181, v2179, buffer.len(v2179));
        v2177 = v2180;
        v2178 = v2181;
    end;
    if v2176.kind ~= nil then
        if v2176.kind.type == "literal" then
            local v2182, v2183 = v0.writeTag(v2177, v2178, 2, v0.wireTypes.lengthDelimited);
            v2182, v2183 = v0.writeString(v2182, v2183, v2176.kind.value);
            v2177 = v2182;
            v2178 = v2183;
        elseif v2176.kind.type == "binding_path" then
            local v2184, v2185 = v0.writeTag(v2177, v2178, 3, v0.wireTypes.lengthDelimited);
            v2184, v2185 = v0.writeString(v2184, v2185, v2176.kind.value);
            v2177 = v2184;
            v2178 = v2185;
        end;
    end;
    local v2186 = buffer.create(v2178);
    buffer.copy(v2186, 0, v2177, 0, v2178);
    return v2186;
end;
v5.decode = function(v2187) --[[ Line: 14117 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_79 (copy), v0 (copy), v4 (copy)
    local v2188 = l_v5_79.new();
    local v2189 = 0;
    while v2189 < buffer.len(v2187) do
        local v2190 = nil;
        local v2191 = nil;
        local v2192, v2193, v2194 = v0.readTag(v2187, v2189);
        v2190 = v2192;
        v2191 = v2193;
        v2189 = v2194;
        if v2191 == v0.wireTypes.varint then
            v2192 = nil;
            v2193, v2194 = v0.readVarInt(v2187, v2189);
            v2192 = v2193;
            v2189 = v2194;
        elseif v2191 == v0.wireTypes.lengthDelimited then
            if v2190 == 1 then
                v2192 = nil;
                v2193, v2194 = v0.readBuffer(v2187, v2189);
                v2192 = v2193;
                v2189 = v2194;
                v2188.condition = v4.PropCondition.decode(v2192);
            elseif v2190 == 2 then
                v2192 = nil;
                v2193, v2194 = v0.readBuffer(v2187, v2189);
                v2192 = v2193;
                v2189 = v2194;
                v2188.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2192)
                };
            elseif v2190 == 3 then
                v2192 = nil;
                v2193, v2194 = v0.readBuffer(v2187, v2189);
                v2192 = v2193;
                v2189 = v2194;
                v2188.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2192)
                };
            else
                v2192 = nil;
                v2193, v2194 = v0.readVarInt(v2187, v2189);
                v2189 = v2194 + v2193;
            end;
        elseif v2191 == v0.wireTypes.i32 then
            v2192 = nil;
            v2193, v2194 = v0.readFixed32(v2187, v2189);
            v2192 = v2193;
            v2189 = v2194;
        elseif v2191 == v0.wireTypes.i64 then
            v2192 = nil;
            v2193, v2194 = v0.readFixed64(v2187, v2189);
            v2192 = v2193;
            v2189 = v2194;
        else
            error("Unsupported wire type: " .. v2191);
        end;
    end;
    return v2188;
end;
v5.jsonEncode = function(v2195) --[[ Line: 14170 ]] --[[ Name: jsonEncode ]]
    local v2196 = {};
    if v2195.condition ~= nil then
        v2196.condition = v2195.condition:jsonEncode();
    end;
    if v2195.kind ~= nil then
        if v2195.kind.type == "literal" then
            v2196.literal = v2195.kind.value;
            return v2196;
        elseif v2195.kind.type == "binding_path" then
            v2196.bindingPath = v2195.kind.value;
        end;
    end;
    return v2196;
end;
v5.jsonDecode = function(v2197) --[[ Line: 14188 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_79 (copy), v4 (copy)
    local v2198 = l_v5_79.new();
    if v2197.condition ~= nil then
        v2198.condition = v4.PropCondition.jsonDecode(v2197.condition);
    end;
    if v2197.literal ~= nil then
        v2198.kind = {
            type = "literal", 
            value = v2197.literal
        };
    end;
    if v2197.binding_path ~= nil then
        v2198.kind = {
            type = "binding_path", 
            value = v2197.binding_path
        };
    end;
    if v2197.bindingPath ~= nil then
        v2198.kind = {
            type = "binding_path", 
            value = v2197.bindingPath
        };
    end;
    return v2198;
end;
v5.descriptor = {
    name = "IconProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.IconProp_ConditionalOption = v5;
v1.default:register(v2.IconProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_80 = v5 --[[ copy: 5 -> 86 ]];
v5.new = function(v2200) --[[ Line: 14225 ]] --[[ Name: new ]]
    -- upvalues: l_v5_80 (copy)
    return (setmetatable({
        options = if not (v2200 ~= nil) or v2200.options == nil then {} else v2200.options
    }, l_v5_80));
end;
v5.encode = function(v2201) --[[ Line: 14233 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2202 = buffer.create(0);
    local v2203 = 0;
    if v2201.options ~= nil and #v2201.options > 0 then
        for _, v2205 in v2201.options do
            local v2206 = v2205:encode();
            local v2207, v2208 = v0.writeTag(v2202, v2203, 1, v0.wireTypes.lengthDelimited);
            v2207, v2208 = v0.writeBuffer(v2207, v2208, v2206, buffer.len(v2206));
            v2202 = v2207;
            v2203 = v2208;
        end;
    end;
    local v2209 = buffer.create(v2203);
    buffer.copy(v2209, 0, v2202, 0, v2203);
    return v2209;
end;
v5.decode = function(v2210) --[[ Line: 14250 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_80 (copy), v0 (copy), v2 (copy)
    local v2211 = l_v5_80.new();
    local v2212 = 0;
    while v2212 < buffer.len(v2210) do
        local v2213 = nil;
        local v2214 = nil;
        local v2215, v2216, v2217 = v0.readTag(v2210, v2212);
        v2213 = v2215;
        v2214 = v2216;
        v2212 = v2217;
        if v2214 == v0.wireTypes.varint then
            v2215 = nil;
            v2216, v2217 = v0.readVarInt(v2210, v2212);
            v2215 = v2216;
            v2212 = v2217;
        elseif v2214 == v0.wireTypes.lengthDelimited then
            if v2213 == 1 then
                v2215 = nil;
                v2216, v2217 = v0.readBuffer(v2210, v2212);
                v2215 = v2216;
                v2212 = v2217;
                table.insert(v2211.options, v2.IconProp_ConditionalOption.decode(v2215));
            else
                v2215 = nil;
                v2216, v2217 = v0.readVarInt(v2210, v2212);
                v2212 = v2217 + v2216;
            end;
        elseif v2214 == v0.wireTypes.i32 then
            v2215 = nil;
            v2216, v2217 = v0.readFixed32(v2210, v2212);
            v2215 = v2216;
            v2212 = v2217;
        elseif v2214 == v0.wireTypes.i64 then
            v2215 = nil;
            v2216, v2217 = v0.readFixed64(v2210, v2212);
            v2215 = v2216;
            v2212 = v2217;
        else
            error("Unsupported wire type: " .. v2214);
        end;
    end;
    return v2211;
end;
v5.jsonEncode = function(v2218) --[[ Line: 14293 ]] --[[ Name: jsonEncode ]]
    local v2219 = {};
    if v2218.options ~= nil and #v2218.options > 0 then
        local v2220 = {};
        for _, v2222 in v2218.options do
            table.insert(v2220, v2222:jsonEncode());
        end;
        v2219.options = v2220;
    end;
    return v2219;
end;
v5.jsonDecode = function(v2223) --[[ Line: 14307 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_80 (copy), v2 (copy)
    local v2224 = l_v5_80.new();
    if v2223.options ~= nil then
        local v2225 = {};
        for _, v2227 in v2223.options do
            table.insert(v2225, v2.IconProp_ConditionalOption.jsonDecode(v2227));
        end;
        v2224.options = v2225;
    end;
    return v2224;
end;
v5.descriptor = {
    name = "IconProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.IconProp_ConditionalOptions = v5;
v1.default:register(v2.IconProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_81 = v5 --[[ copy: 5 -> 87 ]];
v5.new = function(v2229) --[[ Line: 14336 ]] --[[ Name: new ]]
    -- upvalues: l_v5_81 (copy)
    return (setmetatable({
        oneof_prop = if not (v2229 ~= nil) or v2229.oneof_prop == nil then nil else v2229.oneof_prop
    }, l_v5_81));
end;
v5.encode = function(v2230) --[[ Line: 14342 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2231 = buffer.create(0);
    local v2232 = 0;
    if v2230.oneof_prop ~= nil then
        if v2230.oneof_prop.type == "string_prop" then
            local v2233 = v2230.oneof_prop.value:encode();
            local v2234, v2235 = v0.writeTag(v2231, v2232, 1, v0.wireTypes.lengthDelimited);
            v2234, v2235 = v0.writeBuffer(v2234, v2235, v2233, buffer.len(v2233));
            v2231 = v2234;
            v2232 = v2235;
        elseif v2230.oneof_prop.type == "int32_prop" then
            local v2236 = v2230.oneof_prop.value:encode();
            local v2237, v2238 = v0.writeTag(v2231, v2232, 2, v0.wireTypes.lengthDelimited);
            v2237, v2238 = v0.writeBuffer(v2237, v2238, v2236, buffer.len(v2236));
            v2231 = v2237;
            v2232 = v2238;
        end;
    end;
    local v2239 = buffer.create(v2232);
    buffer.copy(v2239, 0, v2231, 0, v2232);
    return v2239;
end;
v5.decode = function(v2240) --[[ Line: 14363 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_81 (copy), v0 (copy), v2 (copy)
    local v2241 = l_v5_81.new();
    local v2242 = 0;
    while v2242 < buffer.len(v2240) do
        local v2243 = nil;
        local v2244 = nil;
        local v2245, v2246, v2247 = v0.readTag(v2240, v2242);
        v2243 = v2245;
        v2244 = v2246;
        v2242 = v2247;
        if v2244 == v0.wireTypes.varint then
            v2245 = nil;
            v2246, v2247 = v0.readVarInt(v2240, v2242);
            v2245 = v2246;
            v2242 = v2247;
        elseif v2244 == v0.wireTypes.lengthDelimited then
            if v2243 == 1 then
                v2245 = nil;
                v2246, v2247 = v0.readBuffer(v2240, v2242);
                v2245 = v2246;
                v2242 = v2247;
                v2241.oneof_prop = {
                    type = "string_prop", 
                    value = v2.StringProp.decode(v2245)
                };
            elseif v2243 == 2 then
                v2245 = nil;
                v2246, v2247 = v0.readBuffer(v2240, v2242);
                v2245 = v2246;
                v2242 = v2247;
                v2241.oneof_prop = {
                    type = "int32_prop", 
                    value = v2.Int32Prop.decode(v2245)
                };
            else
                v2245 = nil;
                v2246, v2247 = v0.readVarInt(v2240, v2242);
                v2242 = v2247 + v2246;
            end;
        elseif v2244 == v0.wireTypes.i32 then
            v2245 = nil;
            v2246, v2247 = v0.readFixed32(v2240, v2242);
            v2245 = v2246;
            v2242 = v2247;
        elseif v2244 == v0.wireTypes.i64 then
            v2245 = nil;
            v2246, v2247 = v0.readFixed64(v2240, v2242);
            v2245 = v2246;
            v2242 = v2247;
        else
            error("Unsupported wire type: " .. v2244);
        end;
    end;
    return v2241;
end;
v5.jsonEncode = function(v2248) --[[ Line: 14411 ]] --[[ Name: jsonEncode ]]
    local v2249 = {};
    if v2248.oneof_prop ~= nil then
        if v2248.oneof_prop.type == "string_prop" then
            v2249.stringProp = v2248.oneof_prop.value:jsonEncode();
            return v2249;
        elseif v2248.oneof_prop.type == "int32_prop" then
            v2249.int32Prop = v2248.oneof_prop.value:jsonEncode();
        end;
    end;
    return v2249;
end;
v5.jsonDecode = function(v2250) --[[ Line: 14425 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_81 (copy), v2 (copy)
    local v2251 = l_v5_81.new();
    if v2250.string_prop ~= nil then
        v2251.oneof_prop = {
            type = "string_prop", 
            value = v2.StringProp.jsonDecode(v2250.string_prop)
        };
    end;
    if v2250.stringProp ~= nil then
        v2251.oneof_prop = {
            type = "string_prop", 
            value = v2.StringProp.jsonDecode(v2250.stringProp)
        };
    end;
    if v2250.int32_prop ~= nil then
        v2251.oneof_prop = {
            type = "int32_prop", 
            value = v2.Int32Prop.jsonDecode(v2250.int32_prop)
        };
    end;
    if v2250.int32Prop ~= nil then
        v2251.oneof_prop = {
            type = "int32_prop", 
            value = v2.Int32Prop.jsonDecode(v2250.int32Prop)
        };
    end;
    return v2251;
end;
v5.descriptor = {
    name = "IconSizeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
};
v2.IconSizeProp = v5;
v1.default:register(v2.IconSizeProp);
v5 = {};
v5.__index = v5;
local l_v5_82 = v5 --[[ copy: 5 -> 88 ]];
v5.new = function(v2253) --[[ Line: 14461 ]] --[[ Name: new ]]
    -- upvalues: l_v5_82 (copy)
    return (setmetatable({
        kind = if not (v2253 ~= nil) or v2253.kind == nil then nil else v2253.kind
    }, l_v5_82));
end;
v5.encode = function(v2254) --[[ Line: 14467 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2255 = buffer.create(0);
    local v2256 = 0;
    if v2254.kind ~= nil then
        if v2254.kind.type == "literal" then
            local v2257 = v2254.kind.value:encode();
            local v2258, v2259 = v0.writeTag(v2255, v2256, 1, v0.wireTypes.lengthDelimited);
            v2258, v2259 = v0.writeBuffer(v2258, v2259, v2257, buffer.len(v2257));
            v2255 = v2258;
            v2256 = v2259;
        elseif v2254.kind.type == "conditional" then
            local v2260 = v2254.kind.value:encode();
            local v2261, v2262 = v0.writeTag(v2255, v2256, 2, v0.wireTypes.lengthDelimited);
            v2261, v2262 = v0.writeBuffer(v2261, v2262, v2260, buffer.len(v2260));
            v2255 = v2261;
            v2256 = v2262;
        end;
    end;
    local v2263 = buffer.create(v2256);
    buffer.copy(v2263, 0, v2255, 0, v2256);
    return v2263;
end;
v5.decode = function(v2264) --[[ Line: 14488 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_82 (copy), v0 (copy), v2 (copy)
    local v2265 = l_v5_82.new();
    local v2266 = 0;
    while v2266 < buffer.len(v2264) do
        local v2267 = nil;
        local v2268 = nil;
        local v2269, v2270, v2271 = v0.readTag(v2264, v2266);
        v2267 = v2269;
        v2268 = v2270;
        v2266 = v2271;
        if v2268 == v0.wireTypes.varint then
            v2269 = nil;
            v2270, v2271 = v0.readVarInt(v2264, v2266);
            v2269 = v2270;
            v2266 = v2271;
        elseif v2268 == v0.wireTypes.lengthDelimited then
            if v2267 == 1 then
                v2269 = nil;
                v2270, v2271 = v0.readBuffer(v2264, v2266);
                v2269 = v2270;
                v2266 = v2271;
                v2265.kind = {
                    type = "literal", 
                    value = v2.GradientProp_GradientData.decode(v2269)
                };
            elseif v2267 == 2 then
                v2269 = nil;
                v2270, v2271 = v0.readBuffer(v2264, v2266);
                v2269 = v2270;
                v2266 = v2271;
                v2265.kind = {
                    type = "conditional", 
                    value = v2.GradientProp_ConditionalOptions.decode(v2269)
                };
            else
                v2269 = nil;
                v2270, v2271 = v0.readVarInt(v2264, v2266);
                v2266 = v2271 + v2270;
            end;
        elseif v2268 == v0.wireTypes.i32 then
            v2269 = nil;
            v2270, v2271 = v0.readFixed32(v2264, v2266);
            v2269 = v2270;
            v2266 = v2271;
        elseif v2268 == v0.wireTypes.i64 then
            v2269 = nil;
            v2270, v2271 = v0.readFixed64(v2264, v2266);
            v2269 = v2270;
            v2266 = v2271;
        else
            error("Unsupported wire type: " .. v2268);
        end;
    end;
    return v2265;
end;
v5.jsonEncode = function(v2272) --[[ Line: 14536 ]] --[[ Name: jsonEncode ]]
    local v2273 = {};
    if v2272.kind ~= nil then
        if v2272.kind.type == "literal" then
            v2273.literal = v2272.kind.value:jsonEncode();
            return v2273;
        elseif v2272.kind.type == "conditional" then
            v2273.conditional = v2272.kind.value:jsonEncode();
        end;
    end;
    return v2273;
end;
v5.jsonDecode = function(v2274) --[[ Line: 14550 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_82 (copy), v2 (copy)
    local v2275 = l_v5_82.new();
    if v2274.literal ~= nil then
        v2275.kind = {
            type = "literal", 
            value = v2.GradientProp_GradientData.jsonDecode(v2274.literal)
        };
    end;
    if v2274.conditional ~= nil then
        v2275.kind = {
            type = "conditional", 
            value = v2.GradientProp_ConditionalOptions.jsonDecode(v2274.conditional)
        };
    end;
    return v2275;
end;
v5.descriptor = {
    name = "GradientProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
};
v2.GradientProp = v5;
v1.default:register(v2.GradientProp);
v5 = {};
v5.__index = v5;
local l_v5_83 = v5 --[[ copy: 5 -> 89 ]];
v5.new = function(v2277) --[[ Line: 14579 ]] --[[ Name: new ]]
    -- upvalues: l_v5_83 (copy)
    return (setmetatable({
        condition = if not (v2277 ~= nil) or v2277.condition == nil then nil else v2277.condition, 
        kind = if not (v2277 ~= nil) or v2277.kind == nil then nil else v2277.kind
    }, l_v5_83));
end;
v5.encode = function(v2278) --[[ Line: 14588 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2279 = buffer.create(0);
    local v2280 = 0;
    if v2278.condition ~= nil then
        local v2281 = v2278.condition:encode();
        local v2282, v2283 = v0.writeTag(v2279, v2280, 1, v0.wireTypes.lengthDelimited);
        v2282, v2283 = v0.writeBuffer(v2282, v2283, v2281, buffer.len(v2281));
        v2279 = v2282;
        v2280 = v2283;
    end;
    if v2278.kind ~= nil and v2278.kind.type == "literal" then
        local v2284 = v2278.kind.value:encode();
        local v2285, v2286 = v0.writeTag(v2279, v2280, 2, v0.wireTypes.lengthDelimited);
        v2285, v2286 = v0.writeBuffer(v2285, v2286, v2284, buffer.len(v2284));
        v2279 = v2285;
        v2280 = v2286;
    end;
    local v2287 = buffer.create(v2280);
    buffer.copy(v2287, 0, v2279, 0, v2280);
    return v2287;
end;
v5.decode = function(v2288) --[[ Line: 14611 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_83 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v2289 = l_v5_83.new();
    local v2290 = 0;
    while v2290 < buffer.len(v2288) do
        local v2291 = nil;
        local v2292 = nil;
        local v2293, v2294, v2295 = v0.readTag(v2288, v2290);
        v2291 = v2293;
        v2292 = v2294;
        v2290 = v2295;
        if v2292 == v0.wireTypes.varint then
            v2293 = nil;
            v2294, v2295 = v0.readVarInt(v2288, v2290);
            v2293 = v2294;
            v2290 = v2295;
        elseif v2292 == v0.wireTypes.lengthDelimited then
            if v2291 == 1 then
                v2293 = nil;
                v2294, v2295 = v0.readBuffer(v2288, v2290);
                v2293 = v2294;
                v2290 = v2295;
                v2289.condition = v4.PropCondition.decode(v2293);
            elseif v2291 == 2 then
                v2293 = nil;
                v2294, v2295 = v0.readBuffer(v2288, v2290);
                v2293 = v2294;
                v2290 = v2295;
                v2289.kind = {
                    type = "literal", 
                    value = v2.GradientProp_GradientData.decode(v2293)
                };
            else
                v2293 = nil;
                v2294, v2295 = v0.readVarInt(v2288, v2290);
                v2290 = v2295 + v2294;
            end;
        elseif v2292 == v0.wireTypes.i32 then
            v2293 = nil;
            v2294, v2295 = v0.readFixed32(v2288, v2290);
            v2293 = v2294;
            v2290 = v2295;
        elseif v2292 == v0.wireTypes.i64 then
            v2293 = nil;
            v2294, v2295 = v0.readFixed64(v2288, v2290);
            v2293 = v2294;
            v2290 = v2295;
        else
            error("Unsupported wire type: " .. v2292);
        end;
    end;
    return v2289;
end;
v5.jsonEncode = function(v2296) --[[ Line: 14659 ]] --[[ Name: jsonEncode ]]
    local v2297 = {};
    if v2296.condition ~= nil then
        v2297.condition = v2296.condition:jsonEncode();
    end;
    if v2296.kind ~= nil and v2296.kind.type == "literal" then
        v2297.literal = v2296.kind.value:jsonEncode();
    end;
    return v2297;
end;
v5.jsonDecode = function(v2298) --[[ Line: 14675 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_83 (copy), v4 (copy), v2 (copy)
    local v2299 = l_v5_83.new();
    if v2298.condition ~= nil then
        v2299.condition = v4.PropCondition.jsonDecode(v2298.condition);
    end;
    if v2298.literal ~= nil then
        v2299.kind = {
            type = "literal", 
            value = v2.GradientProp_GradientData.jsonDecode(v2298.literal)
        };
    end;
    return v2299;
end;
v5.descriptor = {
    name = "GradientProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.GradientProp_ConditionalOption = v5;
v1.default:register(v2.GradientProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_84 = v5 --[[ copy: 5 -> 90 ]];
v5.new = function(v2301) --[[ Line: 14704 ]] --[[ Name: new ]]
    -- upvalues: l_v5_84 (copy)
    return (setmetatable({
        options = if not (v2301 ~= nil) or v2301.options == nil then {} else v2301.options
    }, l_v5_84));
end;
v5.encode = function(v2302) --[[ Line: 14712 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2303 = buffer.create(0);
    local v2304 = 0;
    if v2302.options ~= nil and #v2302.options > 0 then
        for _, v2306 in v2302.options do
            local v2307 = v2306:encode();
            local v2308, v2309 = v0.writeTag(v2303, v2304, 1, v0.wireTypes.lengthDelimited);
            v2308, v2309 = v0.writeBuffer(v2308, v2309, v2307, buffer.len(v2307));
            v2303 = v2308;
            v2304 = v2309;
        end;
    end;
    local v2310 = buffer.create(v2304);
    buffer.copy(v2310, 0, v2303, 0, v2304);
    return v2310;
end;
v5.decode = function(v2311) --[[ Line: 14729 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_84 (copy), v0 (copy), v2 (copy)
    local v2312 = l_v5_84.new();
    local v2313 = 0;
    while v2313 < buffer.len(v2311) do
        local v2314 = nil;
        local v2315 = nil;
        local v2316, v2317, v2318 = v0.readTag(v2311, v2313);
        v2314 = v2316;
        v2315 = v2317;
        v2313 = v2318;
        if v2315 == v0.wireTypes.varint then
            v2316 = nil;
            v2317, v2318 = v0.readVarInt(v2311, v2313);
            v2316 = v2317;
            v2313 = v2318;
        elseif v2315 == v0.wireTypes.lengthDelimited then
            if v2314 == 1 then
                v2316 = nil;
                v2317, v2318 = v0.readBuffer(v2311, v2313);
                v2316 = v2317;
                v2313 = v2318;
                table.insert(v2312.options, v2.GradientProp_ConditionalOption.decode(v2316));
            else
                v2316 = nil;
                v2317, v2318 = v0.readVarInt(v2311, v2313);
                v2313 = v2318 + v2317;
            end;
        elseif v2315 == v0.wireTypes.i32 then
            v2316 = nil;
            v2317, v2318 = v0.readFixed32(v2311, v2313);
            v2316 = v2317;
            v2313 = v2318;
        elseif v2315 == v0.wireTypes.i64 then
            v2316 = nil;
            v2317, v2318 = v0.readFixed64(v2311, v2313);
            v2316 = v2317;
            v2313 = v2318;
        else
            error("Unsupported wire type: " .. v2315);
        end;
    end;
    return v2312;
end;
v5.jsonEncode = function(v2319) --[[ Line: 14772 ]] --[[ Name: jsonEncode ]]
    local v2320 = {};
    if v2319.options ~= nil and #v2319.options > 0 then
        local v2321 = {};
        for _, v2323 in v2319.options do
            table.insert(v2321, v2323:jsonEncode());
        end;
        v2320.options = v2321;
    end;
    return v2320;
end;
v5.jsonDecode = function(v2324) --[[ Line: 14786 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_84 (copy), v2 (copy)
    local v2325 = l_v5_84.new();
    if v2324.options ~= nil then
        local v2326 = {};
        for _, v2328 in v2324.options do
            table.insert(v2326, v2.GradientProp_ConditionalOption.jsonDecode(v2328));
        end;
        v2325.options = v2326;
    end;
    return v2325;
end;
v5.descriptor = {
    name = "GradientProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.GradientProp_ConditionalOptions = v5;
v1.default:register(v2.GradientProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_85 = v5 --[[ copy: 5 -> 91 ]];
v5.new = function(v2330) --[[ Line: 14815 ]] --[[ Name: new ]]
    -- upvalues: l_v5_85 (copy)
    return (setmetatable({
        start_color = (not (v2330 ~= nil) or v2330.start_color == nil) and "" or v2330.start_color, 
        end_color = (not (v2330 ~= nil) or v2330.end_color == nil) and "" or v2330.end_color, 
        start_opacity = (not (v2330 ~= nil) or v2330.start_opacity == nil) and 0 or v2330.start_opacity, 
        end_opacity = (not (v2330 ~= nil) or v2330.end_opacity == nil) and 0 or v2330.end_opacity, 
        degree = (not (v2330 ~= nil) or v2330.degree == nil) and 0 or v2330.degree
    }, l_v5_85));
end;
v5.encode = function(v2331) --[[ Line: 14827 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2332 = buffer.create(0);
    local v2333 = 0;
    if v2331.start_color ~= nil and v2331.start_color ~= "" then
        local v2334, v2335 = v0.writeTag(v2332, v2333, 1, v0.wireTypes.lengthDelimited);
        v2334, v2335 = v0.writeString(v2334, v2335, v2331.start_color);
        v2332 = v2334;
        v2333 = v2335;
    end;
    if v2331.end_color ~= nil and v2331.end_color ~= "" then
        local v2336, v2337 = v0.writeTag(v2332, v2333, 2, v0.wireTypes.lengthDelimited);
        v2336, v2337 = v0.writeString(v2336, v2337, v2331.end_color);
        v2332 = v2336;
        v2333 = v2337;
    end;
    if v2331.start_opacity ~= nil and v2331.start_opacity ~= 0 then
        local v2338, v2339 = v0.writeTag(v2332, v2333, 3, v0.wireTypes.i32);
        v2338, v2339 = v0.writeFloat(v2338, v2339, v2331.start_opacity);
        v2332 = v2338;
        v2333 = v2339;
    end;
    if v2331.end_opacity ~= nil and v2331.end_opacity ~= 0 then
        local v2340, v2341 = v0.writeTag(v2332, v2333, 4, v0.wireTypes.i32);
        v2340, v2341 = v0.writeFloat(v2340, v2341, v2331.end_opacity);
        v2332 = v2340;
        v2333 = v2341;
    end;
    if v2331.degree ~= nil and v2331.degree ~= 0 then
        local v2342, v2343 = v0.writeTag(v2332, v2333, 5, v0.wireTypes.varint);
        v2342, v2343 = v0.writeVarInt(v2342, v2343, v2331.degree);
        v2332 = v2342;
        v2333 = v2343;
    end;
    local v2344 = buffer.create(v2333);
    buffer.copy(v2344, 0, v2332, 0, v2333);
    return v2344;
end;
v5.decode = function(v2345) --[[ Line: 14861 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_85 (copy), v0 (copy)
    local v2346 = l_v5_85.new();
    local v2347 = 0;
    while v2347 < buffer.len(v2345) do
        local v2348 = nil;
        local v2349 = nil;
        local v2350, v2351, v2352 = v0.readTag(v2345, v2347);
        v2348 = v2350;
        v2349 = v2351;
        v2347 = v2352;
        if v2349 == v0.wireTypes.varint then
            if v2348 == 5 then
                v2350 = nil;
                v2351, v2352 = v0.readVarIntI32(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
                v2346.degree = v2350;
            else
                v2350 = nil;
                v2351, v2352 = v0.readVarInt(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
            end;
        elseif v2349 == v0.wireTypes.lengthDelimited then
            if v2348 == 1 then
                v2350 = nil;
                v2351, v2352 = v0.readBuffer(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
                v2346.start_color = buffer.tostring(v2350);
            elseif v2348 == 2 then
                v2350 = nil;
                v2351, v2352 = v0.readBuffer(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
                v2346.end_color = buffer.tostring(v2350);
            else
                v2350 = nil;
                v2351, v2352 = v0.readVarInt(v2345, v2347);
                v2347 = v2352 + v2351;
            end;
        elseif v2349 == v0.wireTypes.i32 then
            if v2348 == 3 then
                v2350 = nil;
                v2351, v2352 = v0.readFloat(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
                v2346.start_opacity = v2350;
            elseif v2348 == 4 then
                v2350 = nil;
                v2351, v2352 = v0.readFloat(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
                v2346.end_opacity = v2350;
            else
                v2350 = nil;
                v2351, v2352 = v0.readFixed32(v2345, v2347);
                v2350 = v2351;
                v2347 = v2352;
            end;
        elseif v2349 == v0.wireTypes.i64 then
            v2350 = nil;
            v2351, v2352 = v0.readFixed64(v2345, v2347);
            v2350 = v2351;
            v2347 = v2352;
        else
            error("Unsupported wire type: " .. v2349);
        end;
    end;
    return v2346;
end;
v5.jsonEncode = function(v2353) --[[ Line: 14924 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v2354 = {};
    if v2353.start_color ~= nil and v2353.start_color ~= "" then
        v2354.startColor = v2353.start_color;
    end;
    if v2353.end_color ~= nil and v2353.end_color ~= "" then
        v2354.endColor = v2353.end_color;
    end;
    if v2353.start_opacity ~= nil and v2353.start_opacity ~= 0 then
        v2354.startOpacity = v0.json.serializeNumber(v2353.start_opacity);
    end;
    if v2353.end_opacity ~= nil and v2353.end_opacity ~= 0 then
        v2354.endOpacity = v0.json.serializeNumber(v2353.end_opacity);
    end;
    if v2353.degree ~= nil and v2353.degree ~= 0 then
        v2354.degree = v2353.degree;
    end;
    return v2354;
end;
v5.jsonDecode = function(v2355) --[[ Line: 14950 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_85 (copy), v0 (copy)
    local v2356 = l_v5_85.new();
    if v2355.start_color ~= nil then
        v2356.start_color = v2355.start_color;
    end;
    if v2355.startColor ~= nil then
        v2356.start_color = v2355.startColor;
    end;
    if v2355.end_color ~= nil then
        v2356.end_color = v2355.end_color;
    end;
    if v2355.endColor ~= nil then
        v2356.end_color = v2355.endColor;
    end;
    if v2355.start_opacity ~= nil then
        v2356.start_opacity = v0.json.deserializeNumber(v2355.start_opacity);
    end;
    if v2355.startOpacity ~= nil then
        v2356.start_opacity = v0.json.deserializeNumber(v2355.startOpacity);
    end;
    if v2355.end_opacity ~= nil then
        v2356.end_opacity = v0.json.deserializeNumber(v2355.end_opacity);
    end;
    if v2355.endOpacity ~= nil then
        v2356.end_opacity = v0.json.deserializeNumber(v2355.endOpacity);
    end;
    if v2355.degree ~= nil then
        v2356.degree = v2355.degree;
    end;
    return v2356;
end;
v5.descriptor = {
    name = "GradientProp_GradientData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
};
v2.GradientProp_GradientData = v5;
v1.default:register(v2.GradientProp_GradientData);
v5 = {};
v5.__index = v5;
local l_v5_86 = v5 --[[ copy: 5 -> 92 ]];
v5.new = function(v2358) --[[ Line: 15006 ]] --[[ Name: new ]]
    -- upvalues: l_v5_86 (copy)
    return (setmetatable({
        kind = if not (v2358 ~= nil) or v2358.kind == nil then nil else v2358.kind
    }, l_v5_86));
end;
v5.encode = function(v2359) --[[ Line: 15012 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2360 = buffer.create(0);
    local v2361 = 0;
    if v2359.kind ~= nil then
        if v2359.kind.type == "literal" then
            local v2362 = v2359.kind.value:encode();
            local v2363, v2364 = v0.writeTag(v2360, v2361, 1, v0.wireTypes.lengthDelimited);
            v2363, v2364 = v0.writeBuffer(v2363, v2364, v2362, buffer.len(v2362));
            v2360 = v2363;
            v2361 = v2364;
        elseif v2359.kind.type == "binding_path" then
            local v2365, v2366 = v0.writeTag(v2360, v2361, 2, v0.wireTypes.lengthDelimited);
            v2365, v2366 = v0.writeString(v2365, v2366, v2359.kind.value);
            v2360 = v2365;
            v2361 = v2366;
        elseif v2359.kind.type == "conditional" then
            local v2367 = v2359.kind.value:encode();
            local v2368, v2369 = v0.writeTag(v2360, v2361, 3, v0.wireTypes.lengthDelimited);
            v2368, v2369 = v0.writeBuffer(v2368, v2369, v2367, buffer.len(v2367));
            v2360 = v2368;
            v2361 = v2369;
        end;
    end;
    local v2370 = buffer.create(v2361);
    buffer.copy(v2370, 0, v2360, 0, v2361);
    return v2370;
end;
v5.decode = function(v2371) --[[ Line: 15036 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_86 (copy), v0 (copy), v2 (copy)
    local v2372 = l_v5_86.new();
    local v2373 = 0;
    while v2373 < buffer.len(v2371) do
        local v2374 = nil;
        local v2375 = nil;
        local v2376, v2377, v2378 = v0.readTag(v2371, v2373);
        v2374 = v2376;
        v2375 = v2377;
        v2373 = v2378;
        if v2375 == v0.wireTypes.varint then
            v2376 = nil;
            v2377, v2378 = v0.readVarInt(v2371, v2373);
            v2376 = v2377;
            v2373 = v2378;
        elseif v2375 == v0.wireTypes.lengthDelimited then
            if v2374 == 1 then
                v2376 = nil;
                v2377, v2378 = v0.readBuffer(v2371, v2373);
                v2376 = v2377;
                v2373 = v2378;
                v2372.kind = {
                    type = "literal", 
                    value = v2.ArrayOfStructProp_ArrayOfStructs.decode(v2376)
                };
            elseif v2374 == 2 then
                v2376 = nil;
                v2377, v2378 = v0.readBuffer(v2371, v2373);
                v2376 = v2377;
                v2373 = v2378;
                v2372.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2376)
                };
            elseif v2374 == 3 then
                v2376 = nil;
                v2377, v2378 = v0.readBuffer(v2371, v2373);
                v2376 = v2377;
                v2373 = v2378;
                v2372.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfStructProp_ConditionalOptions.decode(v2376)
                };
            else
                v2376 = nil;
                v2377, v2378 = v0.readVarInt(v2371, v2373);
                v2373 = v2378 + v2377;
            end;
        elseif v2375 == v0.wireTypes.i32 then
            v2376 = nil;
            v2377, v2378 = v0.readFixed32(v2371, v2373);
            v2376 = v2377;
            v2373 = v2378;
        elseif v2375 == v0.wireTypes.i64 then
            v2376 = nil;
            v2377, v2378 = v0.readFixed64(v2371, v2373);
            v2376 = v2377;
            v2373 = v2378;
        else
            error("Unsupported wire type: " .. v2375);
        end;
    end;
    return v2372;
end;
v5.jsonEncode = function(v2379) --[[ Line: 15090 ]] --[[ Name: jsonEncode ]]
    local v2380 = {};
    if v2379.kind ~= nil then
        if v2379.kind.type == "literal" then
            v2380.literal = v2379.kind.value:jsonEncode();
            return v2380;
        elseif v2379.kind.type == "binding_path" then
            v2380.bindingPath = v2379.kind.value;
            return v2380;
        elseif v2379.kind.type == "conditional" then
            v2380.conditional = v2379.kind.value:jsonEncode();
        end;
    end;
    return v2380;
end;
v5.jsonDecode = function(v2381) --[[ Line: 15106 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_86 (copy), v2 (copy)
    local v2382 = l_v5_86.new();
    if v2381.literal ~= nil then
        v2382.kind = {
            type = "literal", 
            value = v2.ArrayOfStructProp_ArrayOfStructs.jsonDecode(v2381.literal)
        };
    end;
    if v2381.binding_path ~= nil then
        v2382.kind = {
            type = "binding_path", 
            value = v2381.binding_path
        };
    end;
    if v2381.bindingPath ~= nil then
        v2382.kind = {
            type = "binding_path", 
            value = v2381.bindingPath
        };
    end;
    if v2381.conditional ~= nil then
        v2382.kind = {
            type = "conditional", 
            value = v2.ArrayOfStructProp_ConditionalOptions.jsonDecode(v2381.conditional)
        };
    end;
    return v2382;
end;
v5.descriptor = {
    name = "ArrayOfStructProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
};
v2.ArrayOfStructProp = v5;
v1.default:register(v2.ArrayOfStructProp);
v5 = {};
v5.__index = v5;
local l_v5_87 = v5 --[[ copy: 5 -> 93 ]];
v5.new = function(v2384) --[[ Line: 15146 ]] --[[ Name: new ]]
    -- upvalues: l_v5_87 (copy)
    return (setmetatable({
        condition = if not (v2384 ~= nil) or v2384.condition == nil then nil else v2384.condition, 
        kind = if not (v2384 ~= nil) or v2384.kind == nil then nil else v2384.kind
    }, l_v5_87));
end;
v5.encode = function(v2385) --[[ Line: 15155 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2386 = buffer.create(0);
    local v2387 = 0;
    if v2385.condition ~= nil then
        local v2388 = v2385.condition:encode();
        local v2389, v2390 = v0.writeTag(v2386, v2387, 1, v0.wireTypes.lengthDelimited);
        v2389, v2390 = v0.writeBuffer(v2389, v2390, v2388, buffer.len(v2388));
        v2386 = v2389;
        v2387 = v2390;
    end;
    if v2385.kind ~= nil then
        if v2385.kind.type == "literal" then
            local v2391 = v2385.kind.value:encode();
            local v2392, v2393 = v0.writeTag(v2386, v2387, 2, v0.wireTypes.lengthDelimited);
            v2392, v2393 = v0.writeBuffer(v2392, v2393, v2391, buffer.len(v2391));
            v2386 = v2392;
            v2387 = v2393;
        elseif v2385.kind.type == "binding_path" then
            local v2394, v2395 = v0.writeTag(v2386, v2387, 3, v0.wireTypes.lengthDelimited);
            v2394, v2395 = v0.writeString(v2394, v2395, v2385.kind.value);
            v2386 = v2394;
            v2387 = v2395;
        end;
    end;
    local v2396 = buffer.create(v2387);
    buffer.copy(v2396, 0, v2386, 0, v2387);
    return v2396;
end;
v5.decode = function(v2397) --[[ Line: 15181 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_87 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v2398 = l_v5_87.new();
    local v2399 = 0;
    while v2399 < buffer.len(v2397) do
        local v2400 = nil;
        local v2401 = nil;
        local v2402, v2403, v2404 = v0.readTag(v2397, v2399);
        v2400 = v2402;
        v2401 = v2403;
        v2399 = v2404;
        if v2401 == v0.wireTypes.varint then
            v2402 = nil;
            v2403, v2404 = v0.readVarInt(v2397, v2399);
            v2402 = v2403;
            v2399 = v2404;
        elseif v2401 == v0.wireTypes.lengthDelimited then
            if v2400 == 1 then
                v2402 = nil;
                v2403, v2404 = v0.readBuffer(v2397, v2399);
                v2402 = v2403;
                v2399 = v2404;
                v2398.condition = v4.PropCondition.decode(v2402);
            elseif v2400 == 2 then
                v2402 = nil;
                v2403, v2404 = v0.readBuffer(v2397, v2399);
                v2402 = v2403;
                v2399 = v2404;
                v2398.kind = {
                    type = "literal", 
                    value = v2.ArrayOfStructProp_ArrayOfStructs.decode(v2402)
                };
            elseif v2400 == 3 then
                v2402 = nil;
                v2403, v2404 = v0.readBuffer(v2397, v2399);
                v2402 = v2403;
                v2399 = v2404;
                v2398.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2402)
                };
            else
                v2402 = nil;
                v2403, v2404 = v0.readVarInt(v2397, v2399);
                v2399 = v2404 + v2403;
            end;
        elseif v2401 == v0.wireTypes.i32 then
            v2402 = nil;
            v2403, v2404 = v0.readFixed32(v2397, v2399);
            v2402 = v2403;
            v2399 = v2404;
        elseif v2401 == v0.wireTypes.i64 then
            v2402 = nil;
            v2403, v2404 = v0.readFixed64(v2397, v2399);
            v2402 = v2403;
            v2399 = v2404;
        else
            error("Unsupported wire type: " .. v2401);
        end;
    end;
    return v2398;
end;
v5.jsonEncode = function(v2405) --[[ Line: 15234 ]] --[[ Name: jsonEncode ]]
    local v2406 = {};
    if v2405.condition ~= nil then
        v2406.condition = v2405.condition:jsonEncode();
    end;
    if v2405.kind ~= nil then
        if v2405.kind.type == "literal" then
            v2406.literal = v2405.kind.value:jsonEncode();
            return v2406;
        elseif v2405.kind.type == "binding_path" then
            v2406.bindingPath = v2405.kind.value;
        end;
    end;
    return v2406;
end;
v5.jsonDecode = function(v2407) --[[ Line: 15252 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_87 (copy), v4 (copy), v2 (copy)
    local v2408 = l_v5_87.new();
    if v2407.condition ~= nil then
        v2408.condition = v4.PropCondition.jsonDecode(v2407.condition);
    end;
    if v2407.literal ~= nil then
        v2408.kind = {
            type = "literal", 
            value = v2.ArrayOfStructProp_ArrayOfStructs.jsonDecode(v2407.literal)
        };
    end;
    if v2407.binding_path ~= nil then
        v2408.kind = {
            type = "binding_path", 
            value = v2407.binding_path
        };
    end;
    if v2407.bindingPath ~= nil then
        v2408.kind = {
            type = "binding_path", 
            value = v2407.bindingPath
        };
    end;
    return v2408;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfStructProp_ConditionalOption = v5;
v1.default:register(v2.ArrayOfStructProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_88 = v5 --[[ copy: 5 -> 94 ]];
v5.new = function(v2410) --[[ Line: 15292 ]] --[[ Name: new ]]
    -- upvalues: l_v5_88 (copy)
    return (setmetatable({
        options = if not (v2410 ~= nil) or v2410.options == nil then {} else v2410.options
    }, l_v5_88));
end;
v5.encode = function(v2411) --[[ Line: 15300 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2412 = buffer.create(0);
    local v2413 = 0;
    if v2411.options ~= nil and #v2411.options > 0 then
        for _, v2415 in v2411.options do
            local v2416 = v2415:encode();
            local v2417, v2418 = v0.writeTag(v2412, v2413, 1, v0.wireTypes.lengthDelimited);
            v2417, v2418 = v0.writeBuffer(v2417, v2418, v2416, buffer.len(v2416));
            v2412 = v2417;
            v2413 = v2418;
        end;
    end;
    local v2419 = buffer.create(v2413);
    buffer.copy(v2419, 0, v2412, 0, v2413);
    return v2419;
end;
v5.decode = function(v2420) --[[ Line: 15317 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_88 (copy), v0 (copy), v2 (copy)
    local v2421 = l_v5_88.new();
    local v2422 = 0;
    while v2422 < buffer.len(v2420) do
        local v2423 = nil;
        local v2424 = nil;
        local v2425, v2426, v2427 = v0.readTag(v2420, v2422);
        v2423 = v2425;
        v2424 = v2426;
        v2422 = v2427;
        if v2424 == v0.wireTypes.varint then
            v2425 = nil;
            v2426, v2427 = v0.readVarInt(v2420, v2422);
            v2425 = v2426;
            v2422 = v2427;
        elseif v2424 == v0.wireTypes.lengthDelimited then
            if v2423 == 1 then
                v2425 = nil;
                v2426, v2427 = v0.readBuffer(v2420, v2422);
                v2425 = v2426;
                v2422 = v2427;
                table.insert(v2421.options, v2.ArrayOfStructProp_ConditionalOption.decode(v2425));
            else
                v2425 = nil;
                v2426, v2427 = v0.readVarInt(v2420, v2422);
                v2422 = v2427 + v2426;
            end;
        elseif v2424 == v0.wireTypes.i32 then
            v2425 = nil;
            v2426, v2427 = v0.readFixed32(v2420, v2422);
            v2425 = v2426;
            v2422 = v2427;
        elseif v2424 == v0.wireTypes.i64 then
            v2425 = nil;
            v2426, v2427 = v0.readFixed64(v2420, v2422);
            v2425 = v2426;
            v2422 = v2427;
        else
            error("Unsupported wire type: " .. v2424);
        end;
    end;
    return v2421;
end;
v5.jsonEncode = function(v2428) --[[ Line: 15360 ]] --[[ Name: jsonEncode ]]
    local v2429 = {};
    if v2428.options ~= nil and #v2428.options > 0 then
        local v2430 = {};
        for _, v2432 in v2428.options do
            table.insert(v2430, v2432:jsonEncode());
        end;
        v2429.options = v2430;
    end;
    return v2429;
end;
v5.jsonDecode = function(v2433) --[[ Line: 15374 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_88 (copy), v2 (copy)
    local v2434 = l_v5_88.new();
    if v2433.options ~= nil then
        local v2435 = {};
        for _, v2437 in v2433.options do
            table.insert(v2435, v2.ArrayOfStructProp_ConditionalOption.jsonDecode(v2437));
        end;
        v2434.options = v2435;
    end;
    return v2434;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfStructProp_ConditionalOptions = v5;
v1.default:register(v2.ArrayOfStructProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_89 = v5 --[[ copy: 5 -> 95 ]];
v5.new = function(v2439) --[[ Line: 15405 ]] --[[ Name: new ]]
    -- upvalues: l_v5_89 (copy)
    return (setmetatable({
        entry = if not (v2439 ~= nil) or v2439.entry == nil then {} else v2439.entry
    }, l_v5_89));
end;
v5.encode = function(v2440) --[[ Line: 15413 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2441 = buffer.create(0);
    local v2442 = 0;
    if v2440.entry ~= nil and #v2440.entry > 0 then
        for _, v2444 in v2440.entry do
            local v2445 = v2444:encode();
            local v2446, v2447 = v0.writeTag(v2441, v2442, 1, v0.wireTypes.lengthDelimited);
            v2446, v2447 = v0.writeBuffer(v2446, v2447, v2445, buffer.len(v2445));
            v2441 = v2446;
            v2442 = v2447;
        end;
    end;
    local v2448 = buffer.create(v2442);
    buffer.copy(v2448, 0, v2441, 0, v2442);
    return v2448;
end;
v5.decode = function(v2449) --[[ Line: 15430 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_89 (copy), v0 (copy), v3 (copy)
    local v2450 = l_v5_89.new();
    local v2451 = 0;
    while v2451 < buffer.len(v2449) do
        local v2452 = nil;
        local v2453 = nil;
        local v2454, v2455, v2456 = v0.readTag(v2449, v2451);
        v2452 = v2454;
        v2453 = v2455;
        v2451 = v2456;
        if v2453 == v0.wireTypes.varint then
            v2454 = nil;
            v2455, v2456 = v0.readVarInt(v2449, v2451);
            v2454 = v2455;
            v2451 = v2456;
        elseif v2453 == v0.wireTypes.lengthDelimited then
            if v2452 == 1 then
                v2454 = nil;
                v2455, v2456 = v0.readBuffer(v2449, v2451);
                v2454 = v2455;
                v2451 = v2456;
                table.insert(v2450.entry, v3.Struct.decode(v2454));
            else
                v2454 = nil;
                v2455, v2456 = v0.readVarInt(v2449, v2451);
                v2451 = v2456 + v2455;
            end;
        elseif v2453 == v0.wireTypes.i32 then
            v2454 = nil;
            v2455, v2456 = v0.readFixed32(v2449, v2451);
            v2454 = v2455;
            v2451 = v2456;
        elseif v2453 == v0.wireTypes.i64 then
            v2454 = nil;
            v2455, v2456 = v0.readFixed64(v2449, v2451);
            v2454 = v2455;
            v2451 = v2456;
        else
            error("Unsupported wire type: " .. v2453);
        end;
    end;
    return v2450;
end;
v5.jsonEncode = function(v2457) --[[ Line: 15473 ]] --[[ Name: jsonEncode ]]
    local v2458 = {};
    if v2457.entry ~= nil and #v2457.entry > 0 then
        local v2459 = {};
        for _, v2461 in v2457.entry do
            table.insert(v2459, v2461:jsonEncode());
        end;
        v2458.entry = v2459;
    end;
    return v2458;
end;
v5.jsonDecode = function(v2462) --[[ Line: 15487 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_89 (copy), v3 (copy)
    local v2463 = l_v5_89.new();
    if v2462.entry ~= nil then
        local v2464 = {};
        for _, v2466 in v2462.entry do
            table.insert(v2464, v3.Struct.jsonDecode(v2466));
        end;
        v2463.entry = v2464;
    end;
    return v2463;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ArrayOfStructs", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
};
v2.ArrayOfStructProp_ArrayOfStructs = v5;
v1.default:register(v2.ArrayOfStructProp_ArrayOfStructs);
v5 = {};
v5.__index = v5;
local l_v5_90 = v5 --[[ copy: 5 -> 96 ]];
v5.new = function(v2468) --[[ Line: 15518 ]] --[[ Name: new ]]
    -- upvalues: l_v5_90 (copy)
    return (setmetatable({
        kind = if not (v2468 ~= nil) or v2468.kind == nil then nil else v2468.kind
    }, l_v5_90));
end;
v5.encode = function(v2469) --[[ Line: 15524 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2470 = buffer.create(0);
    local v2471 = 0;
    if v2469.kind ~= nil then
        if v2469.kind.type == "literal" then
            local v2472, v2473 = v0.writeTag(v2470, v2471, 1, v0.wireTypes.lengthDelimited);
            v2472, v2473 = v0.writeString(v2472, v2473, v2469.kind.value);
            v2470 = v2472;
            v2471 = v2473;
        elseif v2469.kind.type == "token" then
            local v2474, v2475 = v0.writeTag(v2470, v2471, 2, v0.wireTypes.lengthDelimited);
            v2474, v2475 = v0.writeString(v2474, v2475, v2469.kind.value);
            v2470 = v2474;
            v2471 = v2475;
        elseif v2469.kind.type == "conditional" then
            local v2476 = v2469.kind.value:encode();
            local v2477, v2478 = v0.writeTag(v2470, v2471, 3, v0.wireTypes.lengthDelimited);
            v2477, v2478 = v0.writeBuffer(v2477, v2478, v2476, buffer.len(v2476));
            v2470 = v2477;
            v2471 = v2478;
        elseif v2469.kind.type == "binding_path" then
            local v2479, v2480 = v0.writeTag(v2470, v2471, 4, v0.wireTypes.lengthDelimited);
            v2479, v2480 = v0.writeString(v2479, v2480, v2469.kind.value);
            v2470 = v2479;
            v2471 = v2480;
        end;
    end;
    local v2481 = buffer.create(v2471);
    buffer.copy(v2481, 0, v2470, 0, v2471);
    return v2481;
end;
v5.decode = function(v2482) --[[ Line: 15550 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_90 (copy), v0 (copy), v2 (copy)
    local v2483 = l_v5_90.new();
    local v2484 = 0;
    while v2484 < buffer.len(v2482) do
        local v2485 = nil;
        local v2486 = nil;
        local v2487, v2488, v2489 = v0.readTag(v2482, v2484);
        v2485 = v2487;
        v2486 = v2488;
        v2484 = v2489;
        if v2486 == v0.wireTypes.varint then
            v2487 = nil;
            v2488, v2489 = v0.readVarInt(v2482, v2484);
            v2487 = v2488;
            v2484 = v2489;
        elseif v2486 == v0.wireTypes.lengthDelimited then
            if v2485 == 1 then
                v2487 = nil;
                v2488, v2489 = v0.readBuffer(v2482, v2484);
                v2487 = v2488;
                v2484 = v2489;
                v2483.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2487)
                };
            elseif v2485 == 2 then
                v2487 = nil;
                v2488, v2489 = v0.readBuffer(v2482, v2484);
                v2487 = v2488;
                v2484 = v2489;
                v2483.kind = {
                    type = "token", 
                    value = buffer.tostring(v2487)
                };
            elseif v2485 == 3 then
                v2487 = nil;
                v2488, v2489 = v0.readBuffer(v2482, v2484);
                v2487 = v2488;
                v2484 = v2489;
                v2483.kind = {
                    type = "conditional", 
                    value = v2.UiScaledFloatProp_ConditionalOptions.decode(v2487)
                };
            elseif v2485 == 4 then
                v2487 = nil;
                v2488, v2489 = v0.readBuffer(v2482, v2484);
                v2487 = v2488;
                v2484 = v2489;
                v2483.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2487)
                };
            else
                v2487 = nil;
                v2488, v2489 = v0.readVarInt(v2482, v2484);
                v2484 = v2489 + v2488;
            end;
        elseif v2486 == v0.wireTypes.i32 then
            v2487 = nil;
            v2488, v2489 = v0.readFixed32(v2482, v2484);
            v2487 = v2488;
            v2484 = v2489;
        elseif v2486 == v0.wireTypes.i64 then
            v2487 = nil;
            v2488, v2489 = v0.readFixed64(v2482, v2484);
            v2487 = v2488;
            v2484 = v2489;
        else
            error("Unsupported wire type: " .. v2486);
        end;
    end;
    return v2483;
end;
v5.jsonEncode = function(v2490) --[[ Line: 15609 ]] --[[ Name: jsonEncode ]]
    local v2491 = {};
    if v2490.kind ~= nil then
        if v2490.kind.type == "literal" then
            v2491.literal = v2490.kind.value;
            return v2491;
        elseif v2490.kind.type == "token" then
            v2491.token = v2490.kind.value;
            return v2491;
        elseif v2490.kind.type == "conditional" then
            v2491.conditional = v2490.kind.value:jsonEncode();
            return v2491;
        elseif v2490.kind.type == "binding_path" then
            v2491.bindingPath = v2490.kind.value;
        end;
    end;
    return v2491;
end;
v5.jsonDecode = function(v2492) --[[ Line: 15627 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_90 (copy), v2 (copy)
    local v2493 = l_v5_90.new();
    if v2492.literal ~= nil then
        v2493.kind = {
            type = "literal", 
            value = v2492.literal
        };
    end;
    if v2492.token ~= nil then
        v2493.kind = {
            type = "token", 
            value = v2492.token
        };
    end;
    if v2492.conditional ~= nil then
        v2493.kind = {
            type = "conditional", 
            value = v2.UiScaledFloatProp_ConditionalOptions.jsonDecode(v2492.conditional)
        };
    end;
    if v2492.binding_path ~= nil then
        v2493.kind = {
            type = "binding_path", 
            value = v2492.binding_path
        };
    end;
    if v2492.bindingPath ~= nil then
        v2493.kind = {
            type = "binding_path", 
            value = v2492.bindingPath
        };
    end;
    return v2493;
end;
v5.descriptor = {
    name = "UiScaledFloatProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
};
v2.UiScaledFloatProp = v5;
v1.default:register(v2.UiScaledFloatProp);
v5 = {};
v5.__index = v5;
local l_v5_91 = v5 --[[ copy: 5 -> 97 ]];
v5.new = function(v2495) --[[ Line: 15670 ]] --[[ Name: new ]]
    -- upvalues: l_v5_91 (copy)
    return (setmetatable({
        condition = if not (v2495 ~= nil) or v2495.condition == nil then nil else v2495.condition, 
        kind = if not (v2495 ~= nil) or v2495.kind == nil then nil else v2495.kind
    }, l_v5_91));
end;
v5.encode = function(v2496) --[[ Line: 15679 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2497 = buffer.create(0);
    local v2498 = 0;
    if v2496.condition ~= nil then
        local v2499 = v2496.condition:encode();
        local v2500, v2501 = v0.writeTag(v2497, v2498, 1, v0.wireTypes.lengthDelimited);
        v2500, v2501 = v0.writeBuffer(v2500, v2501, v2499, buffer.len(v2499));
        v2497 = v2500;
        v2498 = v2501;
    end;
    if v2496.kind ~= nil then
        if v2496.kind.type == "literal" then
            local v2502, v2503 = v0.writeTag(v2497, v2498, 2, v0.wireTypes.lengthDelimited);
            v2502, v2503 = v0.writeString(v2502, v2503, v2496.kind.value);
            v2497 = v2502;
            v2498 = v2503;
        elseif v2496.kind.type == "token" then
            local v2504, v2505 = v0.writeTag(v2497, v2498, 3, v0.wireTypes.lengthDelimited);
            v2504, v2505 = v0.writeString(v2504, v2505, v2496.kind.value);
            v2497 = v2504;
            v2498 = v2505;
        elseif v2496.kind.type == "binding_path" then
            local v2506, v2507 = v0.writeTag(v2497, v2498, 4, v0.wireTypes.lengthDelimited);
            v2506, v2507 = v0.writeString(v2506, v2507, v2496.kind.value);
            v2497 = v2506;
            v2498 = v2507;
        end;
    end;
    local v2508 = buffer.create(v2498);
    buffer.copy(v2508, 0, v2497, 0, v2498);
    return v2508;
end;
v5.decode = function(v2509) --[[ Line: 15707 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_91 (copy), v0 (copy), v4 (copy)
    local v2510 = l_v5_91.new();
    local v2511 = 0;
    while v2511 < buffer.len(v2509) do
        local v2512 = nil;
        local v2513 = nil;
        local v2514, v2515, v2516 = v0.readTag(v2509, v2511);
        v2512 = v2514;
        v2513 = v2515;
        v2511 = v2516;
        if v2513 == v0.wireTypes.varint then
            v2514 = nil;
            v2515, v2516 = v0.readVarInt(v2509, v2511);
            v2514 = v2515;
            v2511 = v2516;
        elseif v2513 == v0.wireTypes.lengthDelimited then
            if v2512 == 1 then
                v2514 = nil;
                v2515, v2516 = v0.readBuffer(v2509, v2511);
                v2514 = v2515;
                v2511 = v2516;
                v2510.condition = v4.PropCondition.decode(v2514);
            elseif v2512 == 2 then
                v2514 = nil;
                v2515, v2516 = v0.readBuffer(v2509, v2511);
                v2514 = v2515;
                v2511 = v2516;
                v2510.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2514)
                };
            elseif v2512 == 3 then
                v2514 = nil;
                v2515, v2516 = v0.readBuffer(v2509, v2511);
                v2514 = v2515;
                v2511 = v2516;
                v2510.kind = {
                    type = "token", 
                    value = buffer.tostring(v2514)
                };
            elseif v2512 == 4 then
                v2514 = nil;
                v2515, v2516 = v0.readBuffer(v2509, v2511);
                v2514 = v2515;
                v2511 = v2516;
                v2510.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2514)
                };
            else
                v2514 = nil;
                v2515, v2516 = v0.readVarInt(v2509, v2511);
                v2511 = v2516 + v2515;
            end;
        elseif v2513 == v0.wireTypes.i32 then
            v2514 = nil;
            v2515, v2516 = v0.readFixed32(v2509, v2511);
            v2514 = v2515;
            v2511 = v2516;
        elseif v2513 == v0.wireTypes.i64 then
            v2514 = nil;
            v2515, v2516 = v0.readFixed64(v2509, v2511);
            v2514 = v2515;
            v2511 = v2516;
        else
            error("Unsupported wire type: " .. v2513);
        end;
    end;
    return v2510;
end;
v5.jsonEncode = function(v2517) --[[ Line: 15765 ]] --[[ Name: jsonEncode ]]
    local v2518 = {};
    if v2517.condition ~= nil then
        v2518.condition = v2517.condition:jsonEncode();
    end;
    if v2517.kind ~= nil then
        if v2517.kind.type == "literal" then
            v2518.literal = v2517.kind.value;
            return v2518;
        elseif v2517.kind.type == "token" then
            v2518.token = v2517.kind.value;
            return v2518;
        elseif v2517.kind.type == "binding_path" then
            v2518.bindingPath = v2517.kind.value;
        end;
    end;
    return v2518;
end;
v5.jsonDecode = function(v2519) --[[ Line: 15785 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_91 (copy), v4 (copy)
    local v2520 = l_v5_91.new();
    if v2519.condition ~= nil then
        v2520.condition = v4.PropCondition.jsonDecode(v2519.condition);
    end;
    if v2519.literal ~= nil then
        v2520.kind = {
            type = "literal", 
            value = v2519.literal
        };
    end;
    if v2519.token ~= nil then
        v2520.kind = {
            type = "token", 
            value = v2519.token
        };
    end;
    if v2519.binding_path ~= nil then
        v2520.kind = {
            type = "binding_path", 
            value = v2519.binding_path
        };
    end;
    if v2519.bindingPath ~= nil then
        v2520.kind = {
            type = "binding_path", 
            value = v2519.bindingPath
        };
    end;
    return v2520;
end;
v5.descriptor = {
    name = "UiScaledFloatProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledFloatProp_ConditionalOption = v5;
v1.default:register(v2.UiScaledFloatProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_92 = v5 --[[ copy: 5 -> 98 ]];
v5.new = function(v2522) --[[ Line: 15828 ]] --[[ Name: new ]]
    -- upvalues: l_v5_92 (copy)
    return (setmetatable({
        options = if not (v2522 ~= nil) or v2522.options == nil then {} else v2522.options
    }, l_v5_92));
end;
v5.encode = function(v2523) --[[ Line: 15836 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2524 = buffer.create(0);
    local v2525 = 0;
    if v2523.options ~= nil and #v2523.options > 0 then
        for _, v2527 in v2523.options do
            local v2528 = v2527:encode();
            local v2529, v2530 = v0.writeTag(v2524, v2525, 1, v0.wireTypes.lengthDelimited);
            v2529, v2530 = v0.writeBuffer(v2529, v2530, v2528, buffer.len(v2528));
            v2524 = v2529;
            v2525 = v2530;
        end;
    end;
    local v2531 = buffer.create(v2525);
    buffer.copy(v2531, 0, v2524, 0, v2525);
    return v2531;
end;
v5.decode = function(v2532) --[[ Line: 15853 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_92 (copy), v0 (copy), v2 (copy)
    local v2533 = l_v5_92.new();
    local v2534 = 0;
    while v2534 < buffer.len(v2532) do
        local v2535 = nil;
        local v2536 = nil;
        local v2537, v2538, v2539 = v0.readTag(v2532, v2534);
        v2535 = v2537;
        v2536 = v2538;
        v2534 = v2539;
        if v2536 == v0.wireTypes.varint then
            v2537 = nil;
            v2538, v2539 = v0.readVarInt(v2532, v2534);
            v2537 = v2538;
            v2534 = v2539;
        elseif v2536 == v0.wireTypes.lengthDelimited then
            if v2535 == 1 then
                v2537 = nil;
                v2538, v2539 = v0.readBuffer(v2532, v2534);
                v2537 = v2538;
                v2534 = v2539;
                table.insert(v2533.options, v2.UiScaledFloatProp_ConditionalOption.decode(v2537));
            else
                v2537 = nil;
                v2538, v2539 = v0.readVarInt(v2532, v2534);
                v2534 = v2539 + v2538;
            end;
        elseif v2536 == v0.wireTypes.i32 then
            v2537 = nil;
            v2538, v2539 = v0.readFixed32(v2532, v2534);
            v2537 = v2538;
            v2534 = v2539;
        elseif v2536 == v0.wireTypes.i64 then
            v2537 = nil;
            v2538, v2539 = v0.readFixed64(v2532, v2534);
            v2537 = v2538;
            v2534 = v2539;
        else
            error("Unsupported wire type: " .. v2536);
        end;
    end;
    return v2533;
end;
v5.jsonEncode = function(v2540) --[[ Line: 15896 ]] --[[ Name: jsonEncode ]]
    local v2541 = {};
    if v2540.options ~= nil and #v2540.options > 0 then
        local v2542 = {};
        for _, v2544 in v2540.options do
            table.insert(v2542, v2544:jsonEncode());
        end;
        v2541.options = v2542;
    end;
    return v2541;
end;
v5.jsonDecode = function(v2545) --[[ Line: 15910 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_92 (copy), v2 (copy)
    local v2546 = l_v5_92.new();
    if v2545.options ~= nil then
        local v2547 = {};
        for _, v2549 in v2545.options do
            table.insert(v2547, v2.UiScaledFloatProp_ConditionalOption.jsonDecode(v2549));
        end;
        v2546.options = v2547;
    end;
    return v2546;
end;
v5.descriptor = {
    name = "UiScaledFloatProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledFloatProp_ConditionalOptions = v5;
v1.default:register(v2.UiScaledFloatProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_93 = v5 --[[ copy: 5 -> 99 ]];
v5.new = function(v2551) --[[ Line: 15941 ]] --[[ Name: new ]]
    -- upvalues: l_v5_93 (copy)
    return (setmetatable({
        kind = if not (v2551 ~= nil) or v2551.kind == nil then nil else v2551.kind
    }, l_v5_93));
end;
v5.encode = function(v2552) --[[ Line: 15947 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2553 = buffer.create(0);
    local v2554 = 0;
    if v2552.kind ~= nil then
        if v2552.kind.type == "literal" then
            local v2555, v2556 = v0.writeTag(v2553, v2554, 1, v0.wireTypes.lengthDelimited);
            v2555, v2556 = v0.writeString(v2555, v2556, v2552.kind.value);
            v2553 = v2555;
            v2554 = v2556;
        elseif v2552.kind.type == "token" then
            local v2557, v2558 = v0.writeTag(v2553, v2554, 2, v0.wireTypes.lengthDelimited);
            v2557, v2558 = v0.writeString(v2557, v2558, v2552.kind.value);
            v2553 = v2557;
            v2554 = v2558;
        elseif v2552.kind.type == "conditional" then
            local v2559 = v2552.kind.value:encode();
            local v2560, v2561 = v0.writeTag(v2553, v2554, 3, v0.wireTypes.lengthDelimited);
            v2560, v2561 = v0.writeBuffer(v2560, v2561, v2559, buffer.len(v2559));
            v2553 = v2560;
            v2554 = v2561;
        elseif v2552.kind.type == "binding_path" then
            local v2562, v2563 = v0.writeTag(v2553, v2554, 4, v0.wireTypes.lengthDelimited);
            v2562, v2563 = v0.writeString(v2562, v2563, v2552.kind.value);
            v2553 = v2562;
            v2554 = v2563;
        end;
    end;
    local v2564 = buffer.create(v2554);
    buffer.copy(v2564, 0, v2553, 0, v2554);
    return v2564;
end;
v5.decode = function(v2565) --[[ Line: 15973 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_93 (copy), v0 (copy), v2 (copy)
    local v2566 = l_v5_93.new();
    local v2567 = 0;
    while v2567 < buffer.len(v2565) do
        local v2568 = nil;
        local v2569 = nil;
        local v2570, v2571, v2572 = v0.readTag(v2565, v2567);
        v2568 = v2570;
        v2569 = v2571;
        v2567 = v2572;
        if v2569 == v0.wireTypes.varint then
            v2570 = nil;
            v2571, v2572 = v0.readVarInt(v2565, v2567);
            v2570 = v2571;
            v2567 = v2572;
        elseif v2569 == v0.wireTypes.lengthDelimited then
            if v2568 == 1 then
                v2570 = nil;
                v2571, v2572 = v0.readBuffer(v2565, v2567);
                v2570 = v2571;
                v2567 = v2572;
                v2566.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2570)
                };
            elseif v2568 == 2 then
                v2570 = nil;
                v2571, v2572 = v0.readBuffer(v2565, v2567);
                v2570 = v2571;
                v2567 = v2572;
                v2566.kind = {
                    type = "token", 
                    value = buffer.tostring(v2570)
                };
            elseif v2568 == 3 then
                v2570 = nil;
                v2571, v2572 = v0.readBuffer(v2565, v2567);
                v2570 = v2571;
                v2567 = v2572;
                v2566.kind = {
                    type = "conditional", 
                    value = v2.UiScaledUDimProp_ConditionalOptions.decode(v2570)
                };
            elseif v2568 == 4 then
                v2570 = nil;
                v2571, v2572 = v0.readBuffer(v2565, v2567);
                v2570 = v2571;
                v2567 = v2572;
                v2566.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2570)
                };
            else
                v2570 = nil;
                v2571, v2572 = v0.readVarInt(v2565, v2567);
                v2567 = v2572 + v2571;
            end;
        elseif v2569 == v0.wireTypes.i32 then
            v2570 = nil;
            v2571, v2572 = v0.readFixed32(v2565, v2567);
            v2570 = v2571;
            v2567 = v2572;
        elseif v2569 == v0.wireTypes.i64 then
            v2570 = nil;
            v2571, v2572 = v0.readFixed64(v2565, v2567);
            v2570 = v2571;
            v2567 = v2572;
        else
            error("Unsupported wire type: " .. v2569);
        end;
    end;
    return v2566;
end;
v5.jsonEncode = function(v2573) --[[ Line: 16032 ]] --[[ Name: jsonEncode ]]
    local v2574 = {};
    if v2573.kind ~= nil then
        if v2573.kind.type == "literal" then
            v2574.literal = v2573.kind.value;
            return v2574;
        elseif v2573.kind.type == "token" then
            v2574.token = v2573.kind.value;
            return v2574;
        elseif v2573.kind.type == "conditional" then
            v2574.conditional = v2573.kind.value:jsonEncode();
            return v2574;
        elseif v2573.kind.type == "binding_path" then
            v2574.bindingPath = v2573.kind.value;
        end;
    end;
    return v2574;
end;
v5.jsonDecode = function(v2575) --[[ Line: 16050 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_93 (copy), v2 (copy)
    local v2576 = l_v5_93.new();
    if v2575.literal ~= nil then
        v2576.kind = {
            type = "literal", 
            value = v2575.literal
        };
    end;
    if v2575.token ~= nil then
        v2576.kind = {
            type = "token", 
            value = v2575.token
        };
    end;
    if v2575.conditional ~= nil then
        v2576.kind = {
            type = "conditional", 
            value = v2.UiScaledUDimProp_ConditionalOptions.jsonDecode(v2575.conditional)
        };
    end;
    if v2575.binding_path ~= nil then
        v2576.kind = {
            type = "binding_path", 
            value = v2575.binding_path
        };
    end;
    if v2575.bindingPath ~= nil then
        v2576.kind = {
            type = "binding_path", 
            value = v2575.bindingPath
        };
    end;
    return v2576;
end;
v5.descriptor = {
    name = "UiScaledUDimProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
};
v2.UiScaledUDimProp = v5;
v1.default:register(v2.UiScaledUDimProp);
v5 = {};
v5.__index = v5;
local l_v5_94 = v5 --[[ copy: 5 -> 100 ]];
v5.new = function(v2578) --[[ Line: 16093 ]] --[[ Name: new ]]
    -- upvalues: l_v5_94 (copy)
    return (setmetatable({
        condition = if not (v2578 ~= nil) or v2578.condition == nil then nil else v2578.condition, 
        kind = if not (v2578 ~= nil) or v2578.kind == nil then nil else v2578.kind
    }, l_v5_94));
end;
v5.encode = function(v2579) --[[ Line: 16102 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2580 = buffer.create(0);
    local v2581 = 0;
    if v2579.condition ~= nil then
        local v2582 = v2579.condition:encode();
        local v2583, v2584 = v0.writeTag(v2580, v2581, 1, v0.wireTypes.lengthDelimited);
        v2583, v2584 = v0.writeBuffer(v2583, v2584, v2582, buffer.len(v2582));
        v2580 = v2583;
        v2581 = v2584;
    end;
    if v2579.kind ~= nil then
        if v2579.kind.type == "literal" then
            local v2585, v2586 = v0.writeTag(v2580, v2581, 2, v0.wireTypes.lengthDelimited);
            v2585, v2586 = v0.writeString(v2585, v2586, v2579.kind.value);
            v2580 = v2585;
            v2581 = v2586;
        elseif v2579.kind.type == "token" then
            local v2587, v2588 = v0.writeTag(v2580, v2581, 3, v0.wireTypes.lengthDelimited);
            v2587, v2588 = v0.writeString(v2587, v2588, v2579.kind.value);
            v2580 = v2587;
            v2581 = v2588;
        elseif v2579.kind.type == "binding_path" then
            local v2589, v2590 = v0.writeTag(v2580, v2581, 4, v0.wireTypes.lengthDelimited);
            v2589, v2590 = v0.writeString(v2589, v2590, v2579.kind.value);
            v2580 = v2589;
            v2581 = v2590;
        end;
    end;
    local v2591 = buffer.create(v2581);
    buffer.copy(v2591, 0, v2580, 0, v2581);
    return v2591;
end;
v5.decode = function(v2592) --[[ Line: 16130 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_94 (copy), v0 (copy), v4 (copy)
    local v2593 = l_v5_94.new();
    local v2594 = 0;
    while v2594 < buffer.len(v2592) do
        local v2595 = nil;
        local v2596 = nil;
        local v2597, v2598, v2599 = v0.readTag(v2592, v2594);
        v2595 = v2597;
        v2596 = v2598;
        v2594 = v2599;
        if v2596 == v0.wireTypes.varint then
            v2597 = nil;
            v2598, v2599 = v0.readVarInt(v2592, v2594);
            v2597 = v2598;
            v2594 = v2599;
        elseif v2596 == v0.wireTypes.lengthDelimited then
            if v2595 == 1 then
                v2597 = nil;
                v2598, v2599 = v0.readBuffer(v2592, v2594);
                v2597 = v2598;
                v2594 = v2599;
                v2593.condition = v4.PropCondition.decode(v2597);
            elseif v2595 == 2 then
                v2597 = nil;
                v2598, v2599 = v0.readBuffer(v2592, v2594);
                v2597 = v2598;
                v2594 = v2599;
                v2593.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2597)
                };
            elseif v2595 == 3 then
                v2597 = nil;
                v2598, v2599 = v0.readBuffer(v2592, v2594);
                v2597 = v2598;
                v2594 = v2599;
                v2593.kind = {
                    type = "token", 
                    value = buffer.tostring(v2597)
                };
            elseif v2595 == 4 then
                v2597 = nil;
                v2598, v2599 = v0.readBuffer(v2592, v2594);
                v2597 = v2598;
                v2594 = v2599;
                v2593.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2597)
                };
            else
                v2597 = nil;
                v2598, v2599 = v0.readVarInt(v2592, v2594);
                v2594 = v2599 + v2598;
            end;
        elseif v2596 == v0.wireTypes.i32 then
            v2597 = nil;
            v2598, v2599 = v0.readFixed32(v2592, v2594);
            v2597 = v2598;
            v2594 = v2599;
        elseif v2596 == v0.wireTypes.i64 then
            v2597 = nil;
            v2598, v2599 = v0.readFixed64(v2592, v2594);
            v2597 = v2598;
            v2594 = v2599;
        else
            error("Unsupported wire type: " .. v2596);
        end;
    end;
    return v2593;
end;
v5.jsonEncode = function(v2600) --[[ Line: 16188 ]] --[[ Name: jsonEncode ]]
    local v2601 = {};
    if v2600.condition ~= nil then
        v2601.condition = v2600.condition:jsonEncode();
    end;
    if v2600.kind ~= nil then
        if v2600.kind.type == "literal" then
            v2601.literal = v2600.kind.value;
            return v2601;
        elseif v2600.kind.type == "token" then
            v2601.token = v2600.kind.value;
            return v2601;
        elseif v2600.kind.type == "binding_path" then
            v2601.bindingPath = v2600.kind.value;
        end;
    end;
    return v2601;
end;
v5.jsonDecode = function(v2602) --[[ Line: 16208 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_94 (copy), v4 (copy)
    local v2603 = l_v5_94.new();
    if v2602.condition ~= nil then
        v2603.condition = v4.PropCondition.jsonDecode(v2602.condition);
    end;
    if v2602.literal ~= nil then
        v2603.kind = {
            type = "literal", 
            value = v2602.literal
        };
    end;
    if v2602.token ~= nil then
        v2603.kind = {
            type = "token", 
            value = v2602.token
        };
    end;
    if v2602.binding_path ~= nil then
        v2603.kind = {
            type = "binding_path", 
            value = v2602.binding_path
        };
    end;
    if v2602.bindingPath ~= nil then
        v2603.kind = {
            type = "binding_path", 
            value = v2602.bindingPath
        };
    end;
    return v2603;
end;
v5.descriptor = {
    name = "UiScaledUDimProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledUDimProp_ConditionalOption = v5;
v1.default:register(v2.UiScaledUDimProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_95 = v5 --[[ copy: 5 -> 101 ]];
v5.new = function(v2605) --[[ Line: 16251 ]] --[[ Name: new ]]
    -- upvalues: l_v5_95 (copy)
    return (setmetatable({
        options = if not (v2605 ~= nil) or v2605.options == nil then {} else v2605.options
    }, l_v5_95));
end;
v5.encode = function(v2606) --[[ Line: 16259 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2607 = buffer.create(0);
    local v2608 = 0;
    if v2606.options ~= nil and #v2606.options > 0 then
        for _, v2610 in v2606.options do
            local v2611 = v2610:encode();
            local v2612, v2613 = v0.writeTag(v2607, v2608, 1, v0.wireTypes.lengthDelimited);
            v2612, v2613 = v0.writeBuffer(v2612, v2613, v2611, buffer.len(v2611));
            v2607 = v2612;
            v2608 = v2613;
        end;
    end;
    local v2614 = buffer.create(v2608);
    buffer.copy(v2614, 0, v2607, 0, v2608);
    return v2614;
end;
v5.decode = function(v2615) --[[ Line: 16276 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_95 (copy), v0 (copy), v2 (copy)
    local v2616 = l_v5_95.new();
    local v2617 = 0;
    while v2617 < buffer.len(v2615) do
        local v2618 = nil;
        local v2619 = nil;
        local v2620, v2621, v2622 = v0.readTag(v2615, v2617);
        v2618 = v2620;
        v2619 = v2621;
        v2617 = v2622;
        if v2619 == v0.wireTypes.varint then
            v2620 = nil;
            v2621, v2622 = v0.readVarInt(v2615, v2617);
            v2620 = v2621;
            v2617 = v2622;
        elseif v2619 == v0.wireTypes.lengthDelimited then
            if v2618 == 1 then
                v2620 = nil;
                v2621, v2622 = v0.readBuffer(v2615, v2617);
                v2620 = v2621;
                v2617 = v2622;
                table.insert(v2616.options, v2.UiScaledUDimProp_ConditionalOption.decode(v2620));
            else
                v2620 = nil;
                v2621, v2622 = v0.readVarInt(v2615, v2617);
                v2617 = v2622 + v2621;
            end;
        elseif v2619 == v0.wireTypes.i32 then
            v2620 = nil;
            v2621, v2622 = v0.readFixed32(v2615, v2617);
            v2620 = v2621;
            v2617 = v2622;
        elseif v2619 == v0.wireTypes.i64 then
            v2620 = nil;
            v2621, v2622 = v0.readFixed64(v2615, v2617);
            v2620 = v2621;
            v2617 = v2622;
        else
            error("Unsupported wire type: " .. v2619);
        end;
    end;
    return v2616;
end;
v5.jsonEncode = function(v2623) --[[ Line: 16319 ]] --[[ Name: jsonEncode ]]
    local v2624 = {};
    if v2623.options ~= nil and #v2623.options > 0 then
        local v2625 = {};
        for _, v2627 in v2623.options do
            table.insert(v2625, v2627:jsonEncode());
        end;
        v2624.options = v2625;
    end;
    return v2624;
end;
v5.jsonDecode = function(v2628) --[[ Line: 16333 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_95 (copy), v2 (copy)
    local v2629 = l_v5_95.new();
    if v2628.options ~= nil then
        local v2630 = {};
        for _, v2632 in v2628.options do
            table.insert(v2630, v2.UiScaledUDimProp_ConditionalOption.jsonDecode(v2632));
        end;
        v2629.options = v2630;
    end;
    return v2629;
end;
v5.descriptor = {
    name = "UiScaledUDimProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledUDimProp_ConditionalOptions = v5;
v1.default:register(v2.UiScaledUDimProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_96 = v5 --[[ copy: 5 -> 102 ]];
v5.new = function(v2634) --[[ Line: 16364 ]] --[[ Name: new ]]
    -- upvalues: l_v5_96 (copy)
    return (setmetatable({
        kind = if not (v2634 ~= nil) or v2634.kind == nil then nil else v2634.kind
    }, l_v5_96));
end;
v5.encode = function(v2635) --[[ Line: 16370 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2636 = buffer.create(0);
    local v2637 = 0;
    if v2635.kind ~= nil then
        if v2635.kind.type == "literal" then
            local v2638, v2639 = v0.writeTag(v2636, v2637, 1, v0.wireTypes.lengthDelimited);
            v2638, v2639 = v0.writeString(v2638, v2639, v2635.kind.value);
            v2636 = v2638;
            v2637 = v2639;
        elseif v2635.kind.type == "token" then
            local v2640, v2641 = v0.writeTag(v2636, v2637, 2, v0.wireTypes.lengthDelimited);
            v2640, v2641 = v0.writeString(v2640, v2641, v2635.kind.value);
            v2636 = v2640;
            v2637 = v2641;
        elseif v2635.kind.type == "conditional" then
            local v2642 = v2635.kind.value:encode();
            local v2643, v2644 = v0.writeTag(v2636, v2637, 3, v0.wireTypes.lengthDelimited);
            v2643, v2644 = v0.writeBuffer(v2643, v2644, v2642, buffer.len(v2642));
            v2636 = v2643;
            v2637 = v2644;
        elseif v2635.kind.type == "binding_path" then
            local v2645, v2646 = v0.writeTag(v2636, v2637, 4, v0.wireTypes.lengthDelimited);
            v2645, v2646 = v0.writeString(v2645, v2646, v2635.kind.value);
            v2636 = v2645;
            v2637 = v2646;
        end;
    end;
    local v2647 = buffer.create(v2637);
    buffer.copy(v2647, 0, v2636, 0, v2637);
    return v2647;
end;
v5.decode = function(v2648) --[[ Line: 16396 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_96 (copy), v0 (copy), v2 (copy)
    local v2649 = l_v5_96.new();
    local v2650 = 0;
    while v2650 < buffer.len(v2648) do
        local v2651 = nil;
        local v2652 = nil;
        local v2653, v2654, v2655 = v0.readTag(v2648, v2650);
        v2651 = v2653;
        v2652 = v2654;
        v2650 = v2655;
        if v2652 == v0.wireTypes.varint then
            v2653 = nil;
            v2654, v2655 = v0.readVarInt(v2648, v2650);
            v2653 = v2654;
            v2650 = v2655;
        elseif v2652 == v0.wireTypes.lengthDelimited then
            if v2651 == 1 then
                v2653 = nil;
                v2654, v2655 = v0.readBuffer(v2648, v2650);
                v2653 = v2654;
                v2650 = v2655;
                v2649.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2653)
                };
            elseif v2651 == 2 then
                v2653 = nil;
                v2654, v2655 = v0.readBuffer(v2648, v2650);
                v2653 = v2654;
                v2650 = v2655;
                v2649.kind = {
                    type = "token", 
                    value = buffer.tostring(v2653)
                };
            elseif v2651 == 3 then
                v2653 = nil;
                v2654, v2655 = v0.readBuffer(v2648, v2650);
                v2653 = v2654;
                v2650 = v2655;
                v2649.kind = {
                    type = "conditional", 
                    value = v2.UiScaledUDim2Prop_ConditionalOptions.decode(v2653)
                };
            elseif v2651 == 4 then
                v2653 = nil;
                v2654, v2655 = v0.readBuffer(v2648, v2650);
                v2653 = v2654;
                v2650 = v2655;
                v2649.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2653)
                };
            else
                v2653 = nil;
                v2654, v2655 = v0.readVarInt(v2648, v2650);
                v2650 = v2655 + v2654;
            end;
        elseif v2652 == v0.wireTypes.i32 then
            v2653 = nil;
            v2654, v2655 = v0.readFixed32(v2648, v2650);
            v2653 = v2654;
            v2650 = v2655;
        elseif v2652 == v0.wireTypes.i64 then
            v2653 = nil;
            v2654, v2655 = v0.readFixed64(v2648, v2650);
            v2653 = v2654;
            v2650 = v2655;
        else
            error("Unsupported wire type: " .. v2652);
        end;
    end;
    return v2649;
end;
v5.jsonEncode = function(v2656) --[[ Line: 16455 ]] --[[ Name: jsonEncode ]]
    local v2657 = {};
    if v2656.kind ~= nil then
        if v2656.kind.type == "literal" then
            v2657.literal = v2656.kind.value;
            return v2657;
        elseif v2656.kind.type == "token" then
            v2657.token = v2656.kind.value;
            return v2657;
        elseif v2656.kind.type == "conditional" then
            v2657.conditional = v2656.kind.value:jsonEncode();
            return v2657;
        elseif v2656.kind.type == "binding_path" then
            v2657.bindingPath = v2656.kind.value;
        end;
    end;
    return v2657;
end;
v5.jsonDecode = function(v2658) --[[ Line: 16473 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_96 (copy), v2 (copy)
    local v2659 = l_v5_96.new();
    if v2658.literal ~= nil then
        v2659.kind = {
            type = "literal", 
            value = v2658.literal
        };
    end;
    if v2658.token ~= nil then
        v2659.kind = {
            type = "token", 
            value = v2658.token
        };
    end;
    if v2658.conditional ~= nil then
        v2659.kind = {
            type = "conditional", 
            value = v2.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(v2658.conditional)
        };
    end;
    if v2658.binding_path ~= nil then
        v2659.kind = {
            type = "binding_path", 
            value = v2658.binding_path
        };
    end;
    if v2658.bindingPath ~= nil then
        v2659.kind = {
            type = "binding_path", 
            value = v2658.bindingPath
        };
    end;
    return v2659;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
};
v2.UiScaledUDim2Prop = v5;
v1.default:register(v2.UiScaledUDim2Prop);
v5 = {};
v5.__index = v5;
local l_v5_97 = v5 --[[ copy: 5 -> 103 ]];
v5.new = function(v2661) --[[ Line: 16516 ]] --[[ Name: new ]]
    -- upvalues: l_v5_97 (copy)
    return (setmetatable({
        condition = if not (v2661 ~= nil) or v2661.condition == nil then nil else v2661.condition, 
        kind = if not (v2661 ~= nil) or v2661.kind == nil then nil else v2661.kind
    }, l_v5_97));
end;
v5.encode = function(v2662) --[[ Line: 16525 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2663 = buffer.create(0);
    local v2664 = 0;
    if v2662.condition ~= nil then
        local v2665 = v2662.condition:encode();
        local v2666, v2667 = v0.writeTag(v2663, v2664, 1, v0.wireTypes.lengthDelimited);
        v2666, v2667 = v0.writeBuffer(v2666, v2667, v2665, buffer.len(v2665));
        v2663 = v2666;
        v2664 = v2667;
    end;
    if v2662.kind ~= nil then
        if v2662.kind.type == "literal" then
            local v2668, v2669 = v0.writeTag(v2663, v2664, 2, v0.wireTypes.lengthDelimited);
            v2668, v2669 = v0.writeString(v2668, v2669, v2662.kind.value);
            v2663 = v2668;
            v2664 = v2669;
        elseif v2662.kind.type == "token" then
            local v2670, v2671 = v0.writeTag(v2663, v2664, 3, v0.wireTypes.lengthDelimited);
            v2670, v2671 = v0.writeString(v2670, v2671, v2662.kind.value);
            v2663 = v2670;
            v2664 = v2671;
        elseif v2662.kind.type == "binding_path" then
            local v2672, v2673 = v0.writeTag(v2663, v2664, 4, v0.wireTypes.lengthDelimited);
            v2672, v2673 = v0.writeString(v2672, v2673, v2662.kind.value);
            v2663 = v2672;
            v2664 = v2673;
        end;
    end;
    local v2674 = buffer.create(v2664);
    buffer.copy(v2674, 0, v2663, 0, v2664);
    return v2674;
end;
v5.decode = function(v2675) --[[ Line: 16553 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_97 (copy), v0 (copy), v4 (copy)
    local v2676 = l_v5_97.new();
    local v2677 = 0;
    while v2677 < buffer.len(v2675) do
        local v2678 = nil;
        local v2679 = nil;
        local v2680, v2681, v2682 = v0.readTag(v2675, v2677);
        v2678 = v2680;
        v2679 = v2681;
        v2677 = v2682;
        if v2679 == v0.wireTypes.varint then
            v2680 = nil;
            v2681, v2682 = v0.readVarInt(v2675, v2677);
            v2680 = v2681;
            v2677 = v2682;
        elseif v2679 == v0.wireTypes.lengthDelimited then
            if v2678 == 1 then
                v2680 = nil;
                v2681, v2682 = v0.readBuffer(v2675, v2677);
                v2680 = v2681;
                v2677 = v2682;
                v2676.condition = v4.PropCondition.decode(v2680);
            elseif v2678 == 2 then
                v2680 = nil;
                v2681, v2682 = v0.readBuffer(v2675, v2677);
                v2680 = v2681;
                v2677 = v2682;
                v2676.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2680)
                };
            elseif v2678 == 3 then
                v2680 = nil;
                v2681, v2682 = v0.readBuffer(v2675, v2677);
                v2680 = v2681;
                v2677 = v2682;
                v2676.kind = {
                    type = "token", 
                    value = buffer.tostring(v2680)
                };
            elseif v2678 == 4 then
                v2680 = nil;
                v2681, v2682 = v0.readBuffer(v2675, v2677);
                v2680 = v2681;
                v2677 = v2682;
                v2676.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2680)
                };
            else
                v2680 = nil;
                v2681, v2682 = v0.readVarInt(v2675, v2677);
                v2677 = v2682 + v2681;
            end;
        elseif v2679 == v0.wireTypes.i32 then
            v2680 = nil;
            v2681, v2682 = v0.readFixed32(v2675, v2677);
            v2680 = v2681;
            v2677 = v2682;
        elseif v2679 == v0.wireTypes.i64 then
            v2680 = nil;
            v2681, v2682 = v0.readFixed64(v2675, v2677);
            v2680 = v2681;
            v2677 = v2682;
        else
            error("Unsupported wire type: " .. v2679);
        end;
    end;
    return v2676;
end;
v5.jsonEncode = function(v2683) --[[ Line: 16611 ]] --[[ Name: jsonEncode ]]
    local v2684 = {};
    if v2683.condition ~= nil then
        v2684.condition = v2683.condition:jsonEncode();
    end;
    if v2683.kind ~= nil then
        if v2683.kind.type == "literal" then
            v2684.literal = v2683.kind.value;
            return v2684;
        elseif v2683.kind.type == "token" then
            v2684.token = v2683.kind.value;
            return v2684;
        elseif v2683.kind.type == "binding_path" then
            v2684.bindingPath = v2683.kind.value;
        end;
    end;
    return v2684;
end;
v5.jsonDecode = function(v2685) --[[ Line: 16631 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_97 (copy), v4 (copy)
    local v2686 = l_v5_97.new();
    if v2685.condition ~= nil then
        v2686.condition = v4.PropCondition.jsonDecode(v2685.condition);
    end;
    if v2685.literal ~= nil then
        v2686.kind = {
            type = "literal", 
            value = v2685.literal
        };
    end;
    if v2685.token ~= nil then
        v2686.kind = {
            type = "token", 
            value = v2685.token
        };
    end;
    if v2685.binding_path ~= nil then
        v2686.kind = {
            type = "binding_path", 
            value = v2685.binding_path
        };
    end;
    if v2685.bindingPath ~= nil then
        v2686.kind = {
            type = "binding_path", 
            value = v2685.bindingPath
        };
    end;
    return v2686;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledUDim2Prop_ConditionalOption = v5;
v1.default:register(v2.UiScaledUDim2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
v5.new = function(v2687) --[[ Line: 16674 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        options = if not (v2687 ~= nil) or v2687.options == nil then {} else v2687.options
    }, v5));
end;
v5.encode = function(v2688) --[[ Line: 16682 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2689 = buffer.create(0);
    local v2690 = 0;
    if v2688.options ~= nil and #v2688.options > 0 then
        for _, v2692 in v2688.options do
            local v2693 = v2692:encode();
            local v2694, v2695 = v0.writeTag(v2689, v2690, 1, v0.wireTypes.lengthDelimited);
            v2694, v2695 = v0.writeBuffer(v2694, v2695, v2693, buffer.len(v2693));
            v2689 = v2694;
            v2690 = v2695;
        end;
    end;
    local v2696 = buffer.create(v2690);
    buffer.copy(v2696, 0, v2689, 0, v2690);
    return v2696;
end;
v5.decode = function(v2697) --[[ Line: 16699 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v2 (copy)
    local v2698 = v5.new();
    local v2699 = 0;
    while v2699 < buffer.len(v2697) do
        local v2700 = nil;
        local v2701 = nil;
        local v2702, v2703, v2704 = v0.readTag(v2697, v2699);
        v2700 = v2702;
        v2701 = v2703;
        v2699 = v2704;
        if v2701 == v0.wireTypes.varint then
            v2702 = nil;
            v2703, v2704 = v0.readVarInt(v2697, v2699);
            v2702 = v2703;
            v2699 = v2704;
        elseif v2701 == v0.wireTypes.lengthDelimited then
            if v2700 == 1 then
                v2702 = nil;
                v2703, v2704 = v0.readBuffer(v2697, v2699);
                v2702 = v2703;
                v2699 = v2704;
                table.insert(v2698.options, v2.UiScaledUDim2Prop_ConditionalOption.decode(v2702));
            else
                v2702 = nil;
                v2703, v2704 = v0.readVarInt(v2697, v2699);
                v2699 = v2704 + v2703;
            end;
        elseif v2701 == v0.wireTypes.i32 then
            v2702 = nil;
            v2703, v2704 = v0.readFixed32(v2697, v2699);
            v2702 = v2703;
            v2699 = v2704;
        elseif v2701 == v0.wireTypes.i64 then
            v2702 = nil;
            v2703, v2704 = v0.readFixed64(v2697, v2699);
            v2702 = v2703;
            v2699 = v2704;
        else
            error("Unsupported wire type: " .. v2701);
        end;
    end;
    return v2698;
end;
v5.jsonEncode = function(v2705) --[[ Line: 16742 ]] --[[ Name: jsonEncode ]]
    local v2706 = {};
    if v2705.options ~= nil and #v2705.options > 0 then
        local v2707 = {};
        for _, v2709 in v2705.options do
            table.insert(v2707, v2709:jsonEncode());
        end;
        v2706.options = v2707;
    end;
    return v2706;
end;
v5.jsonDecode = function(v2710) --[[ Line: 16756 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v2711 = v5.new();
    if v2710.options ~= nil then
        local v2712 = {};
        for _, v2714 in v2710.options do
            table.insert(v2712, v2.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v2714));
        end;
        v2711.options = v2712;
    end;
    return v2711;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledUDim2Prop_ConditionalOptions = v5;
v1.default:register(v2.UiScaledUDim2Prop_ConditionalOptions);
return {
    TranslationRef = v2.TranslationRef, 
    StringFormat = v2.StringFormat, 
    StringFormat_FormatArg = v2.StringFormat_FormatArg, 
    StringFormat_FormatArg_Formatter = v2.StringFormat_FormatArg_Formatter, 
    StringFormat_FormatArg_Formatter_DateConfig = v2.StringFormat_FormatArg_Formatter_DateConfig, 
    StringFormat_FormatArg_Formatter_Type = v2.StringFormat_FormatArg_Formatter_Type, 
    StringProp = v2.StringProp, 
    StringProp_ConditionalOption = v2.StringProp_ConditionalOption, 
    StringProp_ConditionalOptions = v2.StringProp_ConditionalOptions, 
    FloatProp = v2.FloatProp, 
    FloatProp_ConditionalOption = v2.FloatProp_ConditionalOption, 
    FloatProp_ConditionalOptions = v2.FloatProp_ConditionalOptions, 
    DoubleProp = v2.DoubleProp, 
    DoubleProp_ConditionalOption = v2.DoubleProp_ConditionalOption, 
    DoubleProp_ConditionalOptions = v2.DoubleProp_ConditionalOptions, 
    Int32Prop = v2.Int32Prop, 
    Int32Prop_ConditionalOption = v2.Int32Prop_ConditionalOption, 
    Int32Prop_ConditionalOptions = v2.Int32Prop_ConditionalOptions, 
    Int64Prop = v2.Int64Prop, 
    Int64Prop_ConditionalOption = v2.Int64Prop_ConditionalOption, 
    Int64Prop_ConditionalOptions = v2.Int64Prop_ConditionalOptions, 
    BoolProp = v2.BoolProp, 
    BoolProp_ConditionalOption = v2.BoolProp_ConditionalOption, 
    BoolProp_ConditionalOptions = v2.BoolProp_ConditionalOptions, 
    StructProp = v2.StructProp, 
    StructProp_ConditionalOption = v2.StructProp_ConditionalOption, 
    StructProp_ConditionalOptions = v2.StructProp_ConditionalOptions, 
    ImageStringProp = v2.ImageStringProp, 
    ImageStringProp_ConditionalOption = v2.ImageStringProp_ConditionalOption, 
    ImageStringProp_ConditionalOptions = v2.ImageStringProp_ConditionalOptions, 
    ImageSetProp = v2.ImageSetProp, 
    ImageSetProp_ConditionalOption = v2.ImageSetProp_ConditionalOption, 
    ImageSetProp_ConditionalOptions = v2.ImageSetProp_ConditionalOptions, 
    ColorProp = v2.ColorProp, 
    ColorProp_ConditionalOption = v2.ColorProp_ConditionalOption, 
    ColorProp_ConditionalOptions = v2.ColorProp_ConditionalOptions, 
    TypographyProp = v2.TypographyProp, 
    TypographyProp_ConditionalOption = v2.TypographyProp_ConditionalOption, 
    TypographyProp_ConditionalOptions = v2.TypographyProp_ConditionalOptions, 
    TypographyFontProp = v2.TypographyFontProp, 
    TypographyFontProp_ConditionalOption = v2.TypographyFontProp_ConditionalOption, 
    TypographyFontProp_ConditionalOptions = v2.TypographyFontProp_ConditionalOptions, 
    ColorStyleProp = v2.ColorStyleProp, 
    ColorStyleProp_ConditionalOption = v2.ColorStyleProp_ConditionalOption, 
    ColorStyleProp_ConditionalOptions = v2.ColorStyleProp_ConditionalOptions, 
    FillBehaviorProp = v2.FillBehaviorProp, 
    FillBehaviorProp_ConditionalOption = v2.FillBehaviorProp_ConditionalOption, 
    FillBehaviorProp_ConditionalOptions = v2.FillBehaviorProp_ConditionalOptions, 
    InputSizeProp = v2.InputSizeProp, 
    InputSizeProp_ConditionalOption = v2.InputSizeProp_ConditionalOption, 
    InputSizeProp_ConditionalOptions = v2.InputSizeProp_ConditionalOptions, 
    UDimProp = v2.UDimProp, 
    UDimProp_ConditionalOption = v2.UDimProp_ConditionalOption, 
    UDimProp_ConditionalOptions = v2.UDimProp_ConditionalOptions, 
    UDim2Prop = v2.UDim2Prop, 
    UDim2Prop_ConditionalOption = v2.UDim2Prop_ConditionalOption, 
    UDim2Prop_ConditionalOptions = v2.UDim2Prop_ConditionalOptions, 
    Vector2Prop = v2.Vector2Prop, 
    Vector2Prop_ConditionalOption = v2.Vector2Prop_ConditionalOption, 
    Vector2Prop_ConditionalOptions = v2.Vector2Prop_ConditionalOptions, 
    TemplateArg = v2.TemplateArg, 
    TemplateArg_LiteralValue = v2.TemplateArg_LiteralValue, 
    NestedComponentProp = v2.NestedComponentProp, 
    NestedComponentProp_ConditionalOption = v2.NestedComponentProp_ConditionalOption, 
    NestedComponentProp_ConditionalOptions = v2.NestedComponentProp_ConditionalOptions, 
    NestedComponentProp_TemplateData = v2.NestedComponentProp_TemplateData, 
    LazyNestedComponentListProp = v2.LazyNestedComponentListProp, 
    LazyNestedComponentListProp_ConditionalOption = v2.LazyNestedComponentListProp_ConditionalOption, 
    LazyNestedComponentListProp_ConditionalOptions = v2.LazyNestedComponentListProp_ConditionalOptions, 
    LazyNestedComponentListProp_TemplateData = v2.LazyNestedComponentListProp_TemplateData, 
    LazyNestedComponentListProp_TemplateDataList = v2.LazyNestedComponentListProp_TemplateDataList, 
    LazyNestedComponentListProp_OrderedTemplateData = v2.LazyNestedComponentListProp_OrderedTemplateData, 
    LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData, 
    LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue = v2.LazyNestedComponentListProp_OrderedTemplateData_EntryOrderData_LiteralValue, 
    NestedComponentListProp = v2.NestedComponentListProp, 
    IconProp = v2.IconProp, 
    IconProp_ConditionalOption = v2.IconProp_ConditionalOption, 
    IconProp_ConditionalOptions = v2.IconProp_ConditionalOptions, 
    IconSizeProp = v2.IconSizeProp, 
    GradientProp = v2.GradientProp, 
    GradientProp_ConditionalOption = v2.GradientProp_ConditionalOption, 
    GradientProp_ConditionalOptions = v2.GradientProp_ConditionalOptions, 
    GradientProp_GradientData = v2.GradientProp_GradientData, 
    ArrayOfStructProp = v2.ArrayOfStructProp, 
    ArrayOfStructProp_ConditionalOption = v2.ArrayOfStructProp_ConditionalOption, 
    ArrayOfStructProp_ConditionalOptions = v2.ArrayOfStructProp_ConditionalOptions, 
    ArrayOfStructProp_ArrayOfStructs = v2.ArrayOfStructProp_ArrayOfStructs, 
    UiScaledFloatProp = v2.UiScaledFloatProp, 
    UiScaledFloatProp_ConditionalOption = v2.UiScaledFloatProp_ConditionalOption, 
    UiScaledFloatProp_ConditionalOptions = v2.UiScaledFloatProp_ConditionalOptions, 
    UiScaledUDimProp = v2.UiScaledUDimProp, 
    UiScaledUDimProp_ConditionalOption = v2.UiScaledUDimProp_ConditionalOption, 
    UiScaledUDimProp_ConditionalOptions = v2.UiScaledUDimProp_ConditionalOptions, 
    UiScaledUDim2Prop = v2.UiScaledUDim2Prop, 
    UiScaledUDim2Prop_ConditionalOption = v2.UiScaledUDim2Prop_ConditionalOption, 
    UiScaledUDim2Prop_ConditionalOptions = v2.UiScaledUDim2Prop_ConditionalOptions
};