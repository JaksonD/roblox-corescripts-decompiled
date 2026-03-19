local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct);
local v4 = require(script.Parent.prop_condition);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 2753 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        str = (not (v7 ~= nil) or v7.str == nil) and "" or v7.str, 
        args = if not (v7 ~= nil) or v7.args == nil then {} else v7.args
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 2760 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v9 = buffer.create(0);
    local v10 = 0;
    if v8.str ~= nil and v8.str ~= "" then
        local v11, v12 = v0.writeTag(v9, v10, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeString(v11, v12, v8.str);
        v9 = v11;
        v10 = v12;
    end;
    if v8.args ~= nil and next(v8.args) ~= nil then
        for v13, v14 in v8.args do
            local v15 = buffer.create(0);
            local v16, v17 = v0.writeTag(v15, 0, 1, v0.wireTypes.lengthDelimited);
            v16, v17 = v0.writeString(v16, v17, v13);
            v15 = v16;
            local l_v17_0 = v17;
            v16 = v14:encode();
            local v19;
            v17, v19 = v0.writeTag(v15, l_v17_0, 2, v0.wireTypes.lengthDelimited);
            v17, v19 = v0.writeBuffer(v17, v19, v16, buffer.len(v16));
            v15 = v17;
            l_v17_0 = v19;
            v17, v19 = v0.writeTag(v9, v10, 2, v0.wireTypes.lengthDelimited);
            v17, v19 = v0.writeBuffer(v17, v19, v15, l_v17_0);
            v9 = v17;
            v10 = v19;
        end;
    end;
    local v20 = buffer.create(v10);
    buffer.copy(v20, 0, v9, 0, v10);
    return v20;
end;
v5.decode = function(v21) --[[ Line: 2788 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_0 (copy), v0 (copy), v2 (copy)
    local v22 = l_v5_0.new();
    local v23 = 0;
    while v23 < buffer.len(v21) do
        local v24 = nil;
        local v25 = nil;
        local v26, v27, v28 = v0.readTag(v21, v23);
        v24 = v26;
        v25 = v27;
        v23 = v28;
        if v25 == v0.wireTypes.varint then
            v26 = nil;
            v27, v28 = v0.readVarInt(v21, v23);
            v26 = v27;
            v23 = v28;
        elseif v25 == v0.wireTypes.lengthDelimited then
            if v24 == 1 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v22.str = buffer.tostring(v26);
            elseif v24 == 2 then
                v26 = nil;
                v27, v28 = v0.readBuffer(v21, v23);
                v26 = v27;
                v23 = v28;
                v27 = v2.StringFormat_ArgsEntry.decode(v26);
                v28 = v2.StringFormat_FormatArg.new();
                v22.args[v27.key or ""] = v27.value or v28;
            else
                v26 = nil;
                v27, v28 = v0.readVarInt(v21, v23);
                v23 = v28 + v27;
            end;
        elseif v25 == v0.wireTypes.i32 then
            v26 = nil;
            v27, v28 = v0.readFixed32(v21, v23);
            v26 = v27;
            v23 = v28;
        elseif v25 == v0.wireTypes.i64 then
            v26 = nil;
            v27, v28 = v0.readFixed64(v21, v23);
            v26 = v27;
            v23 = v28;
        else
            error("Unsupported wire type: " .. v25);
        end;
    end;
    return v22;
end;
v5.jsonEncode = function(v29) --[[ Line: 2843 ]] --[[ Name: jsonEncode ]]
    local v30 = {};
    if v29.str ~= nil and v29.str ~= "" then
        v30.str = v29.str;
    end;
    if v29.args ~= nil and next(v29.args) ~= nil then
        local v31 = {};
        for v32, v33 in v29.args do
            v31[v32] = v33:jsonEncode();
        end;
        v30.args = v31;
    end;
    return v30;
end;
v5.jsonDecode = function(v34) --[[ Line: 2861 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy)
    local v35 = l_v5_0.new();
    if v34.str ~= nil then
        v35.str = v34.str;
    end;
    if v34.args ~= nil then
        local v36 = {};
        for v37, v38 in v34.args do
            v36[v37] = v2.StringFormat_FormatArg.jsonDecode(v38);
        end;
        v35.args = v36;
    end;
    return v35;
end;
v5.descriptor = {
    name = "StringFormat", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
};
v2.StringFormat = v5;
v1.default:register(v2.StringFormat);
v5 = {};
v5.__index = v5;
local l_v5_1 = v5 --[[ copy: 5 -> 7 ]];
v5.new = function(v40) --[[ Line: 2894 ]] --[[ Name: new ]]
    -- upvalues: l_v5_1 (copy)
    return (setmetatable({
        kind = if not (v40 ~= nil) or v40.kind == nil then nil else v40.kind
    }, l_v5_1));
end;
v5.encode = function(v41) --[[ Line: 2900 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v42 = buffer.create(0);
    local v43 = 0;
    if v41.kind ~= nil then
        if v41.kind.type == "literal" then
            local v44, v45 = v0.writeTag(v42, v43, 1, v0.wireTypes.lengthDelimited);
            v44, v45 = v0.writeString(v44, v45, v41.kind.value);
            v42 = v44;
            v43 = v45;
        elseif v41.kind.type == "binding_path" then
            local v46, v47 = v0.writeTag(v42, v43, 2, v0.wireTypes.lengthDelimited);
            v46, v47 = v0.writeString(v46, v47, v41.kind.value);
            v42 = v46;
            v43 = v47;
        end;
    end;
    local v48 = buffer.create(v43);
    buffer.copy(v48, 0, v42, 0, v43);
    return v48;
end;
v5.decode = function(v49) --[[ Line: 2919 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_1 (copy), v0 (copy)
    local v50 = l_v5_1.new();
    local v51 = 0;
    while v51 < buffer.len(v49) do
        local v52 = nil;
        local v53 = nil;
        local v54, v55, v56 = v0.readTag(v49, v51);
        v52 = v54;
        v53 = v55;
        v51 = v56;
        if v53 == v0.wireTypes.varint then
            v54 = nil;
            v55, v56 = v0.readVarInt(v49, v51);
            v54 = v55;
            v51 = v56;
        elseif v53 == v0.wireTypes.lengthDelimited then
            if v52 == 1 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.kind = {
                    type = "literal", 
                    value = buffer.tostring(v54)
                };
            elseif v52 == 2 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v54)
                };
            else
                v54 = nil;
                v55, v56 = v0.readVarInt(v49, v51);
                v51 = v56 + v55;
            end;
        elseif v53 == v0.wireTypes.i32 then
            v54 = nil;
            v55, v56 = v0.readFixed32(v49, v51);
            v54 = v55;
            v51 = v56;
        elseif v53 == v0.wireTypes.i64 then
            v54 = nil;
            v55, v56 = v0.readFixed64(v49, v51);
            v54 = v55;
            v51 = v56;
        else
            error("Unsupported wire type: " .. v53);
        end;
    end;
    return v50;
end;
v5.jsonEncode = function(v57) --[[ Line: 2967 ]] --[[ Name: jsonEncode ]]
    local v58 = {};
    if v57.kind ~= nil then
        if v57.kind.type == "literal" then
            v58.literal = v57.kind.value;
            return v58;
        elseif v57.kind.type == "binding_path" then
            v58.bindingPath = v57.kind.value;
        end;
    end;
    return v58;
end;
v5.jsonDecode = function(v59) --[[ Line: 2981 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_1 (copy)
    local v60 = l_v5_1.new();
    if v59.literal ~= nil then
        v60.kind = {
            type = "literal", 
            value = v59.literal
        };
    end;
    if v59.binding_path ~= nil then
        v60.kind = {
            type = "binding_path", 
            value = v59.binding_path
        };
    end;
    if v59.bindingPath ~= nil then
        v60.kind = {
            type = "binding_path", 
            value = v59.bindingPath
        };
    end;
    return v60;
end;
v5.descriptor = {
    name = "StringFormat_FormatArg", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
};
v2.StringFormat_FormatArg = v5;
v1.default:register(v2.StringFormat_FormatArg);
v5 = {};
v5.__index = v5;
local l_v5_2 = v5 --[[ copy: 5 -> 8 ]];
v5.new = function(v62) --[[ Line: 3013 ]] --[[ Name: new ]]
    -- upvalues: l_v5_2 (copy)
    return (setmetatable({
        key = (not (v62 ~= nil) or v62.key == nil) and "" or v62.key, 
        value = if not (v62 ~= nil) or v62.value == nil then nil else v62.value
    }, l_v5_2));
end;
v5.encode = function(v63) --[[ Line: 3020 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v64 = buffer.create(0);
    local v65 = 0;
    if v63.key ~= nil and v63.key ~= "" then
        local v66, v67 = v0.writeTag(v64, v65, 1, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeString(v66, v67, v63.key);
        v64 = v66;
        v65 = v67;
    end;
    if v63.value ~= nil then
        local v68 = v63.value:encode();
        local v69, v70 = v0.writeTag(v64, v65, 2, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v64 = v69;
        v65 = v70;
    end;
    local v71 = buffer.create(v65);
    buffer.copy(v71, 0, v64, 0, v65);
    return v71;
end;
v5.decode = function(v72) --[[ Line: 3040 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_2 (copy), v0 (copy), v2 (copy)
    local v73 = l_v5_2.new();
    local v74 = 0;
    while v74 < buffer.len(v72) do
        local v75 = nil;
        local v76 = nil;
        local v77, v78, v79 = v0.readTag(v72, v74);
        v75 = v77;
        v76 = v78;
        v74 = v79;
        if v76 == v0.wireTypes.varint then
            v77 = nil;
            v78, v79 = v0.readVarInt(v72, v74);
            v77 = v78;
            v74 = v79;
        elseif v76 == v0.wireTypes.lengthDelimited then
            if v75 == 1 then
                v77 = nil;
                v78, v79 = v0.readBuffer(v72, v74);
                v77 = v78;
                v74 = v79;
                v73.key = buffer.tostring(v77);
            elseif v75 == 2 then
                v77 = nil;
                v78, v79 = v0.readBuffer(v72, v74);
                v77 = v78;
                v74 = v79;
                v73.value = v2.StringFormat_FormatArg.decode(v77);
            else
                v77 = nil;
                v78, v79 = v0.readVarInt(v72, v74);
                v74 = v79 + v78;
            end;
        elseif v76 == v0.wireTypes.i32 then
            v77 = nil;
            v78, v79 = v0.readFixed32(v72, v74);
            v77 = v78;
            v74 = v79;
        elseif v76 == v0.wireTypes.i64 then
            v77 = nil;
            v78, v79 = v0.readFixed64(v72, v74);
            v77 = v78;
            v74 = v79;
        else
            error("Unsupported wire type: " .. v76);
        end;
    end;
    return v73;
end;
v5.jsonEncode = function(v80) --[[ Line: 3088 ]] --[[ Name: jsonEncode ]]
    local v81 = {};
    if v80.key ~= nil and v80.key ~= "" then
        v81.key = v80.key;
    end;
    if v80.value ~= nil then
        v81.value = v80.value:jsonEncode();
    end;
    return v81;
end;
v5.jsonDecode = function(v82) --[[ Line: 3102 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_2 (copy), v2 (copy)
    local v83 = l_v5_2.new();
    if v82.key ~= nil then
        v83.key = v82.key;
    end;
    if v82.value ~= nil then
        v83.value = v2.StringFormat_FormatArg.jsonDecode(v82.value);
    end;
    return v83;
end;
v5.descriptor = {
    name = "StringFormat_ArgsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
};
v2.StringFormat_ArgsEntry = v5;
v1.default:register(v2.StringFormat_ArgsEntry);
v5 = {};
v5.__index = v5;
local l_v5_3 = v5 --[[ copy: 5 -> 9 ]];
v5.new = function(v85) --[[ Line: 3130 ]] --[[ Name: new ]]
    -- upvalues: l_v5_3 (copy)
    return (setmetatable({
        kind = if not (v85 ~= nil) or v85.kind == nil then nil else v85.kind
    }, l_v5_3));
end;
v5.encode = function(v86) --[[ Line: 3136 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v87 = buffer.create(0);
    local v88 = 0;
    if v86.kind ~= nil then
        if v86.kind.type == "literal" then
            local v89, v90 = v0.writeTag(v87, v88, 1, v0.wireTypes.lengthDelimited);
            v89, v90 = v0.writeString(v89, v90, v86.kind.value);
            v87 = v89;
            v88 = v90;
        elseif v86.kind.type == "binding_path" then
            local v91, v92 = v0.writeTag(v87, v88, 2, v0.wireTypes.lengthDelimited);
            v91, v92 = v0.writeString(v91, v92, v86.kind.value);
            v87 = v91;
            v88 = v92;
        elseif v86.kind.type == "token" then
            local v93, v94 = v0.writeTag(v87, v88, 3, v0.wireTypes.lengthDelimited);
            v93, v94 = v0.writeString(v93, v94, v86.kind.value);
            v87 = v93;
            v88 = v94;
        elseif v86.kind.type == "format" then
            local v95 = v86.kind.value:encode();
            local v96, v97 = v0.writeTag(v87, v88, 4, v0.wireTypes.lengthDelimited);
            v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
            v87 = v96;
            v88 = v97;
        elseif v86.kind.type == "conditional" then
            local v98 = v86.kind.value:encode();
            local v99, v100 = v0.writeTag(v87, v88, 5, v0.wireTypes.lengthDelimited);
            v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
            v87 = v99;
            v88 = v100;
        end;
    end;
    local v101 = buffer.create(v88);
    buffer.copy(v101, 0, v87, 0, v88);
    return v101;
end;
v5.decode = function(v102) --[[ Line: 3166 ]] --[[ Name: decode ]]
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
            v107 = nil;
            v108, v109 = v0.readVarInt(v102, v104);
            v107 = v108;
            v104 = v109;
        elseif v106 == v0.wireTypes.lengthDelimited then
            if v105 == 1 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.kind = {
                    type = "literal", 
                    value = buffer.tostring(v107)
                };
            elseif v105 == 2 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v107)
                };
            elseif v105 == 3 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.kind = {
                    type = "token", 
                    value = buffer.tostring(v107)
                };
            elseif v105 == 4 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v107)
                };
            elseif v105 == 5 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.kind = {
                    type = "conditional", 
                    value = v2.StringProp_ConditionalOptions.decode(v107)
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
v5.jsonEncode = function(v110) --[[ Line: 3229 ]] --[[ Name: jsonEncode ]]
    local v111 = {};
    if v110.kind ~= nil then
        if v110.kind.type == "literal" then
            v111.literal = v110.kind.value;
            return v111;
        elseif v110.kind.type == "binding_path" then
            v111.bindingPath = v110.kind.value;
            return v111;
        elseif v110.kind.type == "token" then
            v111.token = v110.kind.value;
            return v111;
        elseif v110.kind.type == "format" then
            v111.format = v110.kind.value:jsonEncode();
            return v111;
        elseif v110.kind.type == "conditional" then
            v111.conditional = v110.kind.value:jsonEncode();
        end;
    end;
    return v111;
end;
v5.jsonDecode = function(v112) --[[ Line: 3249 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_3 (copy), v2 (copy)
    local v113 = l_v5_3.new();
    if v112.literal ~= nil then
        v113.kind = {
            type = "literal", 
            value = v112.literal
        };
    end;
    if v112.binding_path ~= nil then
        v113.kind = {
            type = "binding_path", 
            value = v112.binding_path
        };
    end;
    if v112.bindingPath ~= nil then
        v113.kind = {
            type = "binding_path", 
            value = v112.bindingPath
        };
    end;
    if v112.token ~= nil then
        v113.kind = {
            type = "token", 
            value = v112.token
        };
    end;
    if v112.format ~= nil then
        v113.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v112.format)
        };
    end;
    if v112.conditional ~= nil then
        v113.kind = {
            type = "conditional", 
            value = v2.StringProp_ConditionalOptions.jsonDecode(v112.conditional)
        };
    end;
    return v113;
end;
v5.descriptor = {
    name = "StringProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
};
v2.StringProp = v5;
v1.default:register(v2.StringProp);
v5 = {};
v5.__index = v5;
local l_v5_4 = v5 --[[ copy: 5 -> 10 ]];
v5.new = function(v115) --[[ Line: 3294 ]] --[[ Name: new ]]
    -- upvalues: l_v5_4 (copy)
    return (setmetatable({
        condition = if not (v115 ~= nil) or v115.condition == nil then nil else v115.condition, 
        kind = if not (v115 ~= nil) or v115.kind == nil then nil else v115.kind
    }, l_v5_4));
end;
v5.encode = function(v116) --[[ Line: 3303 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v117 = buffer.create(0);
    local v118 = 0;
    if v116.condition ~= nil then
        local v119 = v116.condition:encode();
        local v120, v121 = v0.writeTag(v117, v118, 1, v0.wireTypes.lengthDelimited);
        v120, v121 = v0.writeBuffer(v120, v121, v119, buffer.len(v119));
        v117 = v120;
        v118 = v121;
    end;
    if v116.kind ~= nil then
        if v116.kind.type == "literal" then
            local v122, v123 = v0.writeTag(v117, v118, 2, v0.wireTypes.lengthDelimited);
            v122, v123 = v0.writeString(v122, v123, v116.kind.value);
            v117 = v122;
            v118 = v123;
        elseif v116.kind.type == "binding_path" then
            local v124, v125 = v0.writeTag(v117, v118, 3, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeString(v124, v125, v116.kind.value);
            v117 = v124;
            v118 = v125;
        elseif v116.kind.type == "token" then
            local v126, v127 = v0.writeTag(v117, v118, 4, v0.wireTypes.lengthDelimited);
            v126, v127 = v0.writeString(v126, v127, v116.kind.value);
            v117 = v126;
            v118 = v127;
        elseif v116.kind.type == "format" then
            local v128 = v116.kind.value:encode();
            local v129, v130 = v0.writeTag(v117, v118, 5, v0.wireTypes.lengthDelimited);
            v129, v130 = v0.writeBuffer(v129, v130, v128, buffer.len(v128));
            v117 = v129;
            v118 = v130;
        end;
    end;
    local v131 = buffer.create(v118);
    buffer.copy(v131, 0, v117, 0, v118);
    return v131;
end;
v5.decode = function(v132) --[[ Line: 3335 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_4 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v133 = l_v5_4.new();
    local v134 = 0;
    while v134 < buffer.len(v132) do
        local v135 = nil;
        local v136 = nil;
        local v137, v138, v139 = v0.readTag(v132, v134);
        v135 = v137;
        v136 = v138;
        v134 = v139;
        if v136 == v0.wireTypes.varint then
            v137 = nil;
            v138, v139 = v0.readVarInt(v132, v134);
            v137 = v138;
            v134 = v139;
        elseif v136 == v0.wireTypes.lengthDelimited then
            if v135 == 1 then
                v137 = nil;
                v138, v139 = v0.readBuffer(v132, v134);
                v137 = v138;
                v134 = v139;
                v133.condition = v4.PropCondition.decode(v137);
            elseif v135 == 2 then
                v137 = nil;
                v138, v139 = v0.readBuffer(v132, v134);
                v137 = v138;
                v134 = v139;
                v133.kind = {
                    type = "literal", 
                    value = buffer.tostring(v137)
                };
            elseif v135 == 3 then
                v137 = nil;
                v138, v139 = v0.readBuffer(v132, v134);
                v137 = v138;
                v134 = v139;
                v133.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v137)
                };
            elseif v135 == 4 then
                v137 = nil;
                v138, v139 = v0.readBuffer(v132, v134);
                v137 = v138;
                v134 = v139;
                v133.kind = {
                    type = "token", 
                    value = buffer.tostring(v137)
                };
            elseif v135 == 5 then
                v137 = nil;
                v138, v139 = v0.readBuffer(v132, v134);
                v137 = v138;
                v134 = v139;
                v133.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v137)
                };
            else
                v137 = nil;
                v138, v139 = v0.readVarInt(v132, v134);
                v134 = v139 + v138;
            end;
        elseif v136 == v0.wireTypes.i32 then
            v137 = nil;
            v138, v139 = v0.readFixed32(v132, v134);
            v137 = v138;
            v134 = v139;
        elseif v136 == v0.wireTypes.i64 then
            v137 = nil;
            v138, v139 = v0.readFixed64(v132, v134);
            v137 = v138;
            v134 = v139;
        else
            error("Unsupported wire type: " .. v136);
        end;
    end;
    return v133;
end;
v5.jsonEncode = function(v140) --[[ Line: 3398 ]] --[[ Name: jsonEncode ]]
    local v141 = {};
    if v140.condition ~= nil then
        v141.condition = v140.condition:jsonEncode();
    end;
    if v140.kind ~= nil then
        if v140.kind.type == "literal" then
            v141.literal = v140.kind.value;
            return v141;
        elseif v140.kind.type == "binding_path" then
            v141.bindingPath = v140.kind.value;
            return v141;
        elseif v140.kind.type == "token" then
            v141.token = v140.kind.value;
            return v141;
        elseif v140.kind.type == "format" then
            v141.format = v140.kind.value:jsonEncode();
        end;
    end;
    return v141;
end;
v5.jsonDecode = function(v142) --[[ Line: 3420 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_4 (copy), v4 (copy), v2 (copy)
    local v143 = l_v5_4.new();
    if v142.condition ~= nil then
        v143.condition = v4.PropCondition.jsonDecode(v142.condition);
    end;
    if v142.literal ~= nil then
        v143.kind = {
            type = "literal", 
            value = v142.literal
        };
    end;
    if v142.binding_path ~= nil then
        v143.kind = {
            type = "binding_path", 
            value = v142.binding_path
        };
    end;
    if v142.bindingPath ~= nil then
        v143.kind = {
            type = "binding_path", 
            value = v142.bindingPath
        };
    end;
    if v142.token ~= nil then
        v143.kind = {
            type = "token", 
            value = v142.token
        };
    end;
    if v142.format ~= nil then
        v143.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v142.format)
        };
    end;
    return v143;
end;
v5.descriptor = {
    name = "StringProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.StringProp_ConditionalOption = v5;
v1.default:register(v2.StringProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_5 = v5 --[[ copy: 5 -> 11 ]];
v5.new = function(v145) --[[ Line: 3465 ]] --[[ Name: new ]]
    -- upvalues: l_v5_5 (copy)
    return (setmetatable({
        options = if not (v145 ~= nil) or v145.options == nil then {} else v145.options
    }, l_v5_5));
end;
v5.encode = function(v146) --[[ Line: 3473 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v147 = buffer.create(0);
    local v148 = 0;
    if v146.options ~= nil and #v146.options > 0 then
        for _, v150 in v146.options do
            local v151 = v150:encode();
            local v152, v153 = v0.writeTag(v147, v148, 1, v0.wireTypes.lengthDelimited);
            v152, v153 = v0.writeBuffer(v152, v153, v151, buffer.len(v151));
            v147 = v152;
            v148 = v153;
        end;
    end;
    local v154 = buffer.create(v148);
    buffer.copy(v154, 0, v147, 0, v148);
    return v154;
end;
v5.decode = function(v155) --[[ Line: 3490 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_5 (copy), v0 (copy), v2 (copy)
    local v156 = l_v5_5.new();
    local v157 = 0;
    while v157 < buffer.len(v155) do
        local v158 = nil;
        local v159 = nil;
        local v160, v161, v162 = v0.readTag(v155, v157);
        v158 = v160;
        v159 = v161;
        v157 = v162;
        if v159 == v0.wireTypes.varint then
            v160 = nil;
            v161, v162 = v0.readVarInt(v155, v157);
            v160 = v161;
            v157 = v162;
        elseif v159 == v0.wireTypes.lengthDelimited then
            if v158 == 1 then
                v160 = nil;
                v161, v162 = v0.readBuffer(v155, v157);
                v160 = v161;
                v157 = v162;
                table.insert(v156.options, v2.StringProp_ConditionalOption.decode(v160));
            else
                v160 = nil;
                v161, v162 = v0.readVarInt(v155, v157);
                v157 = v162 + v161;
            end;
        elseif v159 == v0.wireTypes.i32 then
            v160 = nil;
            v161, v162 = v0.readFixed32(v155, v157);
            v160 = v161;
            v157 = v162;
        elseif v159 == v0.wireTypes.i64 then
            v160 = nil;
            v161, v162 = v0.readFixed64(v155, v157);
            v160 = v161;
            v157 = v162;
        else
            error("Unsupported wire type: " .. v159);
        end;
    end;
    return v156;
end;
v5.jsonEncode = function(v163) --[[ Line: 3533 ]] --[[ Name: jsonEncode ]]
    local v164 = {};
    if v163.options ~= nil and #v163.options > 0 then
        local v165 = {};
        for _, v167 in v163.options do
            table.insert(v165, v167:jsonEncode());
        end;
        v164.options = v165;
    end;
    return v164;
end;
v5.jsonDecode = function(v168) --[[ Line: 3547 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_5 (copy), v2 (copy)
    local v169 = l_v5_5.new();
    if v168.options ~= nil then
        local v170 = {};
        for _, v172 in v168.options do
            table.insert(v170, v2.StringProp_ConditionalOption.jsonDecode(v172));
        end;
        v169.options = v170;
    end;
    return v169;
end;
v5.descriptor = {
    name = "StringProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.StringProp_ConditionalOptions = v5;
v1.default:register(v2.StringProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_6 = v5 --[[ copy: 5 -> 12 ]];
v5.new = function(v174) --[[ Line: 3576 ]] --[[ Name: new ]]
    -- upvalues: l_v5_6 (copy)
    return (setmetatable({
        kind = if not (v174 ~= nil) or v174.kind == nil then nil else v174.kind
    }, l_v5_6));
end;
v5.encode = function(v175) --[[ Line: 3582 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v176 = buffer.create(0);
    local v177 = 0;
    if v175.kind ~= nil then
        if v175.kind.type == "literal" then
            local v178, v179 = v0.writeTag(v176, v177, 1, v0.wireTypes.i32);
            v178, v179 = v0.writeFloat(v178, v179, v175.kind.value);
            v176 = v178;
            v177 = v179;
        elseif v175.kind.type == "binding_path" then
            local v180, v181 = v0.writeTag(v176, v177, 2, v0.wireTypes.lengthDelimited);
            v180, v181 = v0.writeString(v180, v181, v175.kind.value);
            v176 = v180;
            v177 = v181;
        elseif v175.kind.type == "token" then
            local v182, v183 = v0.writeTag(v176, v177, 3, v0.wireTypes.lengthDelimited);
            v182, v183 = v0.writeString(v182, v183, v175.kind.value);
            v176 = v182;
            v177 = v183;
        elseif v175.kind.type == "conditional" then
            local v184 = v175.kind.value:encode();
            local v185, v186 = v0.writeTag(v176, v177, 4, v0.wireTypes.lengthDelimited);
            v185, v186 = v0.writeBuffer(v185, v186, v184, buffer.len(v184));
            v176 = v185;
            v177 = v186;
        end;
    end;
    local v187 = buffer.create(v177);
    buffer.copy(v187, 0, v176, 0, v177);
    return v187;
end;
v5.decode = function(v188) --[[ Line: 3608 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_6 (copy), v0 (copy), v2 (copy)
    local v189 = l_v5_6.new();
    local v190 = 0;
    while v190 < buffer.len(v188) do
        local v191 = nil;
        local v192 = nil;
        local v193, v194, v195 = v0.readTag(v188, v190);
        v191 = v193;
        v192 = v194;
        v190 = v195;
        if v192 == v0.wireTypes.varint then
            v193 = nil;
            v194, v195 = v0.readVarInt(v188, v190);
            v193 = v194;
            v190 = v195;
        elseif v192 == v0.wireTypes.lengthDelimited then
            if v191 == 2 then
                v193 = nil;
                v194, v195 = v0.readBuffer(v188, v190);
                v193 = v194;
                v190 = v195;
                v189.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v193)
                };
            elseif v191 == 3 then
                v193 = nil;
                v194, v195 = v0.readBuffer(v188, v190);
                v193 = v194;
                v190 = v195;
                v189.kind = {
                    type = "token", 
                    value = buffer.tostring(v193)
                };
            elseif v191 == 4 then
                v193 = nil;
                v194, v195 = v0.readBuffer(v188, v190);
                v193 = v194;
                v190 = v195;
                v189.kind = {
                    type = "conditional", 
                    value = v2.FloatProp_ConditionalOptions.decode(v193)
                };
            else
                v193 = nil;
                v194, v195 = v0.readVarInt(v188, v190);
                v190 = v195 + v194;
            end;
        elseif v192 == v0.wireTypes.i32 then
            if v191 == 1 then
                v193 = nil;
                v194, v195 = v0.readFloat(v188, v190);
                v193 = v194;
                v190 = v195;
                v189.kind = {
                    type = "literal", 
                    value = v193
                };
            else
                v193 = nil;
                v194, v195 = v0.readFixed32(v188, v190);
                v193 = v194;
                v190 = v195;
            end;
        elseif v192 == v0.wireTypes.i64 then
            v193 = nil;
            v194, v195 = v0.readFixed64(v188, v190);
            v193 = v194;
            v190 = v195;
        else
            error("Unsupported wire type: " .. v192);
        end;
    end;
    return v189;
end;
v5.jsonEncode = function(v196) --[[ Line: 3666 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v197 = {};
    if v196.kind ~= nil then
        if v196.kind.type == "literal" then
            v197.literal = v0.json.serializeNumber(v196.kind.value);
            return v197;
        elseif v196.kind.type == "binding_path" then
            v197.bindingPath = v196.kind.value;
            return v197;
        elseif v196.kind.type == "token" then
            v197.token = v196.kind.value;
            return v197;
        elseif v196.kind.type == "conditional" then
            v197.conditional = v196.kind.value:jsonEncode();
        end;
    end;
    return v197;
end;
v5.jsonDecode = function(v198) --[[ Line: 3684 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_6 (copy), v0 (copy), v2 (copy)
    local v199 = l_v5_6.new();
    if v198.literal ~= nil then
        v199.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v198.literal)
        };
    end;
    if v198.binding_path ~= nil then
        v199.kind = {
            type = "binding_path", 
            value = v198.binding_path
        };
    end;
    if v198.bindingPath ~= nil then
        v199.kind = {
            type = "binding_path", 
            value = v198.bindingPath
        };
    end;
    if v198.token ~= nil then
        v199.kind = {
            type = "token", 
            value = v198.token
        };
    end;
    if v198.conditional ~= nil then
        v199.kind = {
            type = "conditional", 
            value = v2.FloatProp_ConditionalOptions.jsonDecode(v198.conditional)
        };
    end;
    return v199;
end;
v5.descriptor = {
    name = "FloatProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
};
v2.FloatProp = v5;
v1.default:register(v2.FloatProp);
v5 = {};
v5.__index = v5;
local l_v5_7 = v5 --[[ copy: 5 -> 13 ]];
v5.new = function(v201) --[[ Line: 3725 ]] --[[ Name: new ]]
    -- upvalues: l_v5_7 (copy)
    return (setmetatable({
        condition = if not (v201 ~= nil) or v201.condition == nil then nil else v201.condition, 
        kind = if not (v201 ~= nil) or v201.kind == nil then nil else v201.kind
    }, l_v5_7));
end;
v5.encode = function(v202) --[[ Line: 3734 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v203 = buffer.create(0);
    local v204 = 0;
    if v202.condition ~= nil then
        local v205 = v202.condition:encode();
        local v206, v207 = v0.writeTag(v203, v204, 1, v0.wireTypes.lengthDelimited);
        v206, v207 = v0.writeBuffer(v206, v207, v205, buffer.len(v205));
        v203 = v206;
        v204 = v207;
    end;
    if v202.kind ~= nil then
        if v202.kind.type == "literal" then
            local v208, v209 = v0.writeTag(v203, v204, 2, v0.wireTypes.i32);
            v208, v209 = v0.writeFloat(v208, v209, v202.kind.value);
            v203 = v208;
            v204 = v209;
        elseif v202.kind.type == "binding_path" then
            local v210, v211 = v0.writeTag(v203, v204, 3, v0.wireTypes.lengthDelimited);
            v210, v211 = v0.writeString(v210, v211, v202.kind.value);
            v203 = v210;
            v204 = v211;
        elseif v202.kind.type == "token" then
            local v212, v213 = v0.writeTag(v203, v204, 4, v0.wireTypes.lengthDelimited);
            v212, v213 = v0.writeString(v212, v213, v202.kind.value);
            v203 = v212;
            v204 = v213;
        end;
    end;
    local v214 = buffer.create(v204);
    buffer.copy(v214, 0, v203, 0, v204);
    return v214;
end;
v5.decode = function(v215) --[[ Line: 3762 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_7 (copy), v0 (copy), v4 (copy)
    local v216 = l_v5_7.new();
    local v217 = 0;
    while v217 < buffer.len(v215) do
        local v218 = nil;
        local v219 = nil;
        local v220, v221, v222 = v0.readTag(v215, v217);
        v218 = v220;
        v219 = v221;
        v217 = v222;
        if v219 == v0.wireTypes.varint then
            v220 = nil;
            v221, v222 = v0.readVarInt(v215, v217);
            v220 = v221;
            v217 = v222;
        elseif v219 == v0.wireTypes.lengthDelimited then
            if v218 == 1 then
                v220 = nil;
                v221, v222 = v0.readBuffer(v215, v217);
                v220 = v221;
                v217 = v222;
                v216.condition = v4.PropCondition.decode(v220);
            elseif v218 == 3 then
                v220 = nil;
                v221, v222 = v0.readBuffer(v215, v217);
                v220 = v221;
                v217 = v222;
                v216.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v220)
                };
            elseif v218 == 4 then
                v220 = nil;
                v221, v222 = v0.readBuffer(v215, v217);
                v220 = v221;
                v217 = v222;
                v216.kind = {
                    type = "token", 
                    value = buffer.tostring(v220)
                };
            else
                v220 = nil;
                v221, v222 = v0.readVarInt(v215, v217);
                v217 = v222 + v221;
            end;
        elseif v219 == v0.wireTypes.i32 then
            if v218 == 2 then
                v220 = nil;
                v221, v222 = v0.readFloat(v215, v217);
                v220 = v221;
                v217 = v222;
                v216.kind = {
                    type = "literal", 
                    value = v220
                };
            else
                v220 = nil;
                v221, v222 = v0.readFixed32(v215, v217);
                v220 = v221;
                v217 = v222;
            end;
        elseif v219 == v0.wireTypes.i64 then
            v220 = nil;
            v221, v222 = v0.readFixed64(v215, v217);
            v220 = v221;
            v217 = v222;
        else
            error("Unsupported wire type: " .. v219);
        end;
    end;
    return v216;
end;
v5.jsonEncode = function(v223) --[[ Line: 3820 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v224 = {};
    if v223.condition ~= nil then
        v224.condition = v223.condition:jsonEncode();
    end;
    if v223.kind ~= nil then
        if v223.kind.type == "literal" then
            v224.literal = v0.json.serializeNumber(v223.kind.value);
            return v224;
        elseif v223.kind.type == "binding_path" then
            v224.bindingPath = v223.kind.value;
            return v224;
        elseif v223.kind.type == "token" then
            v224.token = v223.kind.value;
        end;
    end;
    return v224;
end;
v5.jsonDecode = function(v225) --[[ Line: 3840 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_7 (copy), v4 (copy), v0 (copy)
    local v226 = l_v5_7.new();
    if v225.condition ~= nil then
        v226.condition = v4.PropCondition.jsonDecode(v225.condition);
    end;
    if v225.literal ~= nil then
        v226.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v225.literal)
        };
    end;
    if v225.binding_path ~= nil then
        v226.kind = {
            type = "binding_path", 
            value = v225.binding_path
        };
    end;
    if v225.bindingPath ~= nil then
        v226.kind = {
            type = "binding_path", 
            value = v225.bindingPath
        };
    end;
    if v225.token ~= nil then
        v226.kind = {
            type = "token", 
            value = v225.token
        };
    end;
    return v226;
end;
v5.descriptor = {
    name = "FloatProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FloatProp_ConditionalOption = v5;
v1.default:register(v2.FloatProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_8 = v5 --[[ copy: 5 -> 14 ]];
v5.new = function(v228) --[[ Line: 3881 ]] --[[ Name: new ]]
    -- upvalues: l_v5_8 (copy)
    return (setmetatable({
        options = if not (v228 ~= nil) or v228.options == nil then {} else v228.options
    }, l_v5_8));
end;
v5.encode = function(v229) --[[ Line: 3889 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v230 = buffer.create(0);
    local v231 = 0;
    if v229.options ~= nil and #v229.options > 0 then
        for _, v233 in v229.options do
            local v234 = v233:encode();
            local v235, v236 = v0.writeTag(v230, v231, 1, v0.wireTypes.lengthDelimited);
            v235, v236 = v0.writeBuffer(v235, v236, v234, buffer.len(v234));
            v230 = v235;
            v231 = v236;
        end;
    end;
    local v237 = buffer.create(v231);
    buffer.copy(v237, 0, v230, 0, v231);
    return v237;
end;
v5.decode = function(v238) --[[ Line: 3906 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_8 (copy), v0 (copy), v2 (copy)
    local v239 = l_v5_8.new();
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
                table.insert(v239.options, v2.FloatProp_ConditionalOption.decode(v243));
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
v5.jsonEncode = function(v246) --[[ Line: 3949 ]] --[[ Name: jsonEncode ]]
    local v247 = {};
    if v246.options ~= nil and #v246.options > 0 then
        local v248 = {};
        for _, v250 in v246.options do
            table.insert(v248, v250:jsonEncode());
        end;
        v247.options = v248;
    end;
    return v247;
end;
v5.jsonDecode = function(v251) --[[ Line: 3963 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_8 (copy), v2 (copy)
    local v252 = l_v5_8.new();
    if v251.options ~= nil then
        local v253 = {};
        for _, v255 in v251.options do
            table.insert(v253, v2.FloatProp_ConditionalOption.jsonDecode(v255));
        end;
        v252.options = v253;
    end;
    return v252;
end;
v5.descriptor = {
    name = "FloatProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FloatProp_ConditionalOptions = v5;
v1.default:register(v2.FloatProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_9 = v5 --[[ copy: 5 -> 15 ]];
v5.new = function(v257) --[[ Line: 3992 ]] --[[ Name: new ]]
    -- upvalues: l_v5_9 (copy)
    return (setmetatable({
        kind = if not (v257 ~= nil) or v257.kind == nil then nil else v257.kind
    }, l_v5_9));
end;
v5.encode = function(v258) --[[ Line: 3998 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v259 = buffer.create(0);
    local v260 = 0;
    if v258.kind ~= nil then
        if v258.kind.type == "literal" then
            local v261, v262 = v0.writeTag(v259, v260, 1, v0.wireTypes.i64);
            v261, v262 = v0.writeDouble(v261, v262, v258.kind.value);
            v259 = v261;
            v260 = v262;
        elseif v258.kind.type == "binding_path" then
            local v263, v264 = v0.writeTag(v259, v260, 2, v0.wireTypes.lengthDelimited);
            v263, v264 = v0.writeString(v263, v264, v258.kind.value);
            v259 = v263;
            v260 = v264;
        elseif v258.kind.type == "token" then
            local v265, v266 = v0.writeTag(v259, v260, 3, v0.wireTypes.lengthDelimited);
            v265, v266 = v0.writeString(v265, v266, v258.kind.value);
            v259 = v265;
            v260 = v266;
        elseif v258.kind.type == "conditional" then
            local v267 = v258.kind.value:encode();
            local v268, v269 = v0.writeTag(v259, v260, 4, v0.wireTypes.lengthDelimited);
            v268, v269 = v0.writeBuffer(v268, v269, v267, buffer.len(v267));
            v259 = v268;
            v260 = v269;
        end;
    end;
    local v270 = buffer.create(v260);
    buffer.copy(v270, 0, v259, 0, v260);
    return v270;
end;
v5.decode = function(v271) --[[ Line: 4024 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_9 (copy), v0 (copy), v2 (copy)
    local v272 = l_v5_9.new();
    local v273 = 0;
    while v273 < buffer.len(v271) do
        local v274 = nil;
        local v275 = nil;
        local v276, v277, v278 = v0.readTag(v271, v273);
        v274 = v276;
        v275 = v277;
        v273 = v278;
        if v275 == v0.wireTypes.varint then
            v276 = nil;
            v277, v278 = v0.readVarInt(v271, v273);
            v276 = v277;
            v273 = v278;
        elseif v275 == v0.wireTypes.lengthDelimited then
            if v274 == 2 then
                v276 = nil;
                v277, v278 = v0.readBuffer(v271, v273);
                v276 = v277;
                v273 = v278;
                v272.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v276)
                };
            elseif v274 == 3 then
                v276 = nil;
                v277, v278 = v0.readBuffer(v271, v273);
                v276 = v277;
                v273 = v278;
                v272.kind = {
                    type = "token", 
                    value = buffer.tostring(v276)
                };
            elseif v274 == 4 then
                v276 = nil;
                v277, v278 = v0.readBuffer(v271, v273);
                v276 = v277;
                v273 = v278;
                v272.kind = {
                    type = "conditional", 
                    value = v2.DoubleProp_ConditionalOptions.decode(v276)
                };
            else
                v276 = nil;
                v277, v278 = v0.readVarInt(v271, v273);
                v273 = v278 + v277;
            end;
        elseif v275 == v0.wireTypes.i32 then
            v276 = nil;
            v277, v278 = v0.readFixed32(v271, v273);
            v276 = v277;
            v273 = v278;
        elseif v275 == v0.wireTypes.i64 then
            if v274 == 1 then
                v276 = nil;
                v277, v278 = v0.readDouble(v271, v273);
                v276 = v277;
                v273 = v278;
                v272.kind = {
                    type = "literal", 
                    value = v276
                };
            else
                v276 = nil;
                v277, v278 = v0.readFixed64(v271, v273);
                v276 = v277;
                v273 = v278;
            end;
        else
            error("Unsupported wire type: " .. v275);
        end;
    end;
    return v272;
end;
v5.jsonEncode = function(v279) --[[ Line: 4082 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v280 = {};
    if v279.kind ~= nil then
        if v279.kind.type == "literal" then
            v280.literal = v0.json.serializeNumber(v279.kind.value);
            return v280;
        elseif v279.kind.type == "binding_path" then
            v280.bindingPath = v279.kind.value;
            return v280;
        elseif v279.kind.type == "token" then
            v280.token = v279.kind.value;
            return v280;
        elseif v279.kind.type == "conditional" then
            v280.conditional = v279.kind.value:jsonEncode();
        end;
    end;
    return v280;
end;
v5.jsonDecode = function(v281) --[[ Line: 4100 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_9 (copy), v0 (copy), v2 (copy)
    local v282 = l_v5_9.new();
    if v281.literal ~= nil then
        v282.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v281.literal)
        };
    end;
    if v281.binding_path ~= nil then
        v282.kind = {
            type = "binding_path", 
            value = v281.binding_path
        };
    end;
    if v281.bindingPath ~= nil then
        v282.kind = {
            type = "binding_path", 
            value = v281.bindingPath
        };
    end;
    if v281.token ~= nil then
        v282.kind = {
            type = "token", 
            value = v281.token
        };
    end;
    if v281.conditional ~= nil then
        v282.kind = {
            type = "conditional", 
            value = v2.DoubleProp_ConditionalOptions.jsonDecode(v281.conditional)
        };
    end;
    return v282;
end;
v5.descriptor = {
    name = "DoubleProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
};
v2.DoubleProp = v5;
v1.default:register(v2.DoubleProp);
v5 = {};
v5.__index = v5;
local l_v5_10 = v5 --[[ copy: 5 -> 16 ]];
v5.new = function(v284) --[[ Line: 4141 ]] --[[ Name: new ]]
    -- upvalues: l_v5_10 (copy)
    return (setmetatable({
        condition = if not (v284 ~= nil) or v284.condition == nil then nil else v284.condition, 
        kind = if not (v284 ~= nil) or v284.kind == nil then nil else v284.kind
    }, l_v5_10));
end;
v5.encode = function(v285) --[[ Line: 4150 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v286 = buffer.create(0);
    local v287 = 0;
    if v285.condition ~= nil then
        local v288 = v285.condition:encode();
        local v289, v290 = v0.writeTag(v286, v287, 1, v0.wireTypes.lengthDelimited);
        v289, v290 = v0.writeBuffer(v289, v290, v288, buffer.len(v288));
        v286 = v289;
        v287 = v290;
    end;
    if v285.kind ~= nil then
        if v285.kind.type == "literal" then
            local v291, v292 = v0.writeTag(v286, v287, 2, v0.wireTypes.i64);
            v291, v292 = v0.writeDouble(v291, v292, v285.kind.value);
            v286 = v291;
            v287 = v292;
        elseif v285.kind.type == "binding_path" then
            local v293, v294 = v0.writeTag(v286, v287, 3, v0.wireTypes.lengthDelimited);
            v293, v294 = v0.writeString(v293, v294, v285.kind.value);
            v286 = v293;
            v287 = v294;
        elseif v285.kind.type == "token" then
            local v295, v296 = v0.writeTag(v286, v287, 4, v0.wireTypes.lengthDelimited);
            v295, v296 = v0.writeString(v295, v296, v285.kind.value);
            v286 = v295;
            v287 = v296;
        end;
    end;
    local v297 = buffer.create(v287);
    buffer.copy(v297, 0, v286, 0, v287);
    return v297;
end;
v5.decode = function(v298) --[[ Line: 4178 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_10 (copy), v0 (copy), v4 (copy)
    local v299 = l_v5_10.new();
    local v300 = 0;
    while v300 < buffer.len(v298) do
        local v301 = nil;
        local v302 = nil;
        local v303, v304, v305 = v0.readTag(v298, v300);
        v301 = v303;
        v302 = v304;
        v300 = v305;
        if v302 == v0.wireTypes.varint then
            v303 = nil;
            v304, v305 = v0.readVarInt(v298, v300);
            v303 = v304;
            v300 = v305;
        elseif v302 == v0.wireTypes.lengthDelimited then
            if v301 == 1 then
                v303 = nil;
                v304, v305 = v0.readBuffer(v298, v300);
                v303 = v304;
                v300 = v305;
                v299.condition = v4.PropCondition.decode(v303);
            elseif v301 == 3 then
                v303 = nil;
                v304, v305 = v0.readBuffer(v298, v300);
                v303 = v304;
                v300 = v305;
                v299.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v303)
                };
            elseif v301 == 4 then
                v303 = nil;
                v304, v305 = v0.readBuffer(v298, v300);
                v303 = v304;
                v300 = v305;
                v299.kind = {
                    type = "token", 
                    value = buffer.tostring(v303)
                };
            else
                v303 = nil;
                v304, v305 = v0.readVarInt(v298, v300);
                v300 = v305 + v304;
            end;
        elseif v302 == v0.wireTypes.i32 then
            v303 = nil;
            v304, v305 = v0.readFixed32(v298, v300);
            v303 = v304;
            v300 = v305;
        elseif v302 == v0.wireTypes.i64 then
            if v301 == 2 then
                v303 = nil;
                v304, v305 = v0.readDouble(v298, v300);
                v303 = v304;
                v300 = v305;
                v299.kind = {
                    type = "literal", 
                    value = v303
                };
            else
                v303 = nil;
                v304, v305 = v0.readFixed64(v298, v300);
                v303 = v304;
                v300 = v305;
            end;
        else
            error("Unsupported wire type: " .. v302);
        end;
    end;
    return v299;
end;
v5.jsonEncode = function(v306) --[[ Line: 4236 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v307 = {};
    if v306.condition ~= nil then
        v307.condition = v306.condition:jsonEncode();
    end;
    if v306.kind ~= nil then
        if v306.kind.type == "literal" then
            v307.literal = v0.json.serializeNumber(v306.kind.value);
            return v307;
        elseif v306.kind.type == "binding_path" then
            v307.bindingPath = v306.kind.value;
            return v307;
        elseif v306.kind.type == "token" then
            v307.token = v306.kind.value;
        end;
    end;
    return v307;
end;
v5.jsonDecode = function(v308) --[[ Line: 4256 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_10 (copy), v4 (copy), v0 (copy)
    local v309 = l_v5_10.new();
    if v308.condition ~= nil then
        v309.condition = v4.PropCondition.jsonDecode(v308.condition);
    end;
    if v308.literal ~= nil then
        v309.kind = {
            type = "literal", 
            value = v0.json.deserializeNumber(v308.literal)
        };
    end;
    if v308.binding_path ~= nil then
        v309.kind = {
            type = "binding_path", 
            value = v308.binding_path
        };
    end;
    if v308.bindingPath ~= nil then
        v309.kind = {
            type = "binding_path", 
            value = v308.bindingPath
        };
    end;
    if v308.token ~= nil then
        v309.kind = {
            type = "token", 
            value = v308.token
        };
    end;
    return v309;
end;
v5.descriptor = {
    name = "DoubleProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.DoubleProp_ConditionalOption = v5;
v1.default:register(v2.DoubleProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_11 = v5 --[[ copy: 5 -> 17 ]];
v5.new = function(v311) --[[ Line: 4297 ]] --[[ Name: new ]]
    -- upvalues: l_v5_11 (copy)
    return (setmetatable({
        options = if not (v311 ~= nil) or v311.options == nil then {} else v311.options
    }, l_v5_11));
end;
v5.encode = function(v312) --[[ Line: 4305 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v313 = buffer.create(0);
    local v314 = 0;
    if v312.options ~= nil and #v312.options > 0 then
        for _, v316 in v312.options do
            local v317 = v316:encode();
            local v318, v319 = v0.writeTag(v313, v314, 1, v0.wireTypes.lengthDelimited);
            v318, v319 = v0.writeBuffer(v318, v319, v317, buffer.len(v317));
            v313 = v318;
            v314 = v319;
        end;
    end;
    local v320 = buffer.create(v314);
    buffer.copy(v320, 0, v313, 0, v314);
    return v320;
end;
v5.decode = function(v321) --[[ Line: 4322 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_11 (copy), v0 (copy), v2 (copy)
    local v322 = l_v5_11.new();
    local v323 = 0;
    while v323 < buffer.len(v321) do
        local v324 = nil;
        local v325 = nil;
        local v326, v327, v328 = v0.readTag(v321, v323);
        v324 = v326;
        v325 = v327;
        v323 = v328;
        if v325 == v0.wireTypes.varint then
            v326 = nil;
            v327, v328 = v0.readVarInt(v321, v323);
            v326 = v327;
            v323 = v328;
        elseif v325 == v0.wireTypes.lengthDelimited then
            if v324 == 1 then
                v326 = nil;
                v327, v328 = v0.readBuffer(v321, v323);
                v326 = v327;
                v323 = v328;
                table.insert(v322.options, v2.DoubleProp_ConditionalOption.decode(v326));
            else
                v326 = nil;
                v327, v328 = v0.readVarInt(v321, v323);
                v323 = v328 + v327;
            end;
        elseif v325 == v0.wireTypes.i32 then
            v326 = nil;
            v327, v328 = v0.readFixed32(v321, v323);
            v326 = v327;
            v323 = v328;
        elseif v325 == v0.wireTypes.i64 then
            v326 = nil;
            v327, v328 = v0.readFixed64(v321, v323);
            v326 = v327;
            v323 = v328;
        else
            error("Unsupported wire type: " .. v325);
        end;
    end;
    return v322;
end;
v5.jsonEncode = function(v329) --[[ Line: 4365 ]] --[[ Name: jsonEncode ]]
    local v330 = {};
    if v329.options ~= nil and #v329.options > 0 then
        local v331 = {};
        for _, v333 in v329.options do
            table.insert(v331, v333:jsonEncode());
        end;
        v330.options = v331;
    end;
    return v330;
end;
v5.jsonDecode = function(v334) --[[ Line: 4379 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_11 (copy), v2 (copy)
    local v335 = l_v5_11.new();
    if v334.options ~= nil then
        local v336 = {};
        for _, v338 in v334.options do
            table.insert(v336, v2.DoubleProp_ConditionalOption.jsonDecode(v338));
        end;
        v335.options = v336;
    end;
    return v335;
end;
v5.descriptor = {
    name = "DoubleProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.DoubleProp_ConditionalOptions = v5;
v1.default:register(v2.DoubleProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_12 = v5 --[[ copy: 5 -> 18 ]];
v5.new = function(v340) --[[ Line: 4408 ]] --[[ Name: new ]]
    -- upvalues: l_v5_12 (copy)
    return (setmetatable({
        kind = if not (v340 ~= nil) or v340.kind == nil then nil else v340.kind
    }, l_v5_12));
end;
v5.encode = function(v341) --[[ Line: 4414 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v342 = buffer.create(0);
    local v343 = 0;
    if v341.kind ~= nil then
        if v341.kind.type == "literal" then
            local v344, v345 = v0.writeTag(v342, v343, 1, v0.wireTypes.varint);
            v344, v345 = v0.writeVarInt(v344, v345, v341.kind.value);
            v342 = v344;
            v343 = v345;
        elseif v341.kind.type == "binding_path" then
            local v346, v347 = v0.writeTag(v342, v343, 2, v0.wireTypes.lengthDelimited);
            v346, v347 = v0.writeString(v346, v347, v341.kind.value);
            v342 = v346;
            v343 = v347;
        elseif v341.kind.type == "token" then
            local v348, v349 = v0.writeTag(v342, v343, 3, v0.wireTypes.lengthDelimited);
            v348, v349 = v0.writeString(v348, v349, v341.kind.value);
            v342 = v348;
            v343 = v349;
        elseif v341.kind.type == "conditional" then
            local v350 = v341.kind.value:encode();
            local v351, v352 = v0.writeTag(v342, v343, 4, v0.wireTypes.lengthDelimited);
            v351, v352 = v0.writeBuffer(v351, v352, v350, buffer.len(v350));
            v342 = v351;
            v343 = v352;
        end;
    end;
    local v353 = buffer.create(v343);
    buffer.copy(v353, 0, v342, 0, v343);
    return v353;
end;
v5.decode = function(v354) --[[ Line: 4440 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_12 (copy), v0 (copy), v2 (copy)
    local v355 = l_v5_12.new();
    local v356 = 0;
    while v356 < buffer.len(v354) do
        local v357 = nil;
        local v358 = nil;
        local v359, v360, v361 = v0.readTag(v354, v356);
        v357 = v359;
        v358 = v360;
        v356 = v361;
        if v358 == v0.wireTypes.varint then
            if v357 == 1 then
                v359 = nil;
                v360, v361 = v0.readVarIntI32(v354, v356);
                v359 = v360;
                v356 = v361;
                v355.kind = {
                    type = "literal", 
                    value = v359
                };
            else
                v359 = nil;
                v360, v361 = v0.readVarInt(v354, v356);
                v359 = v360;
                v356 = v361;
            end;
        elseif v358 == v0.wireTypes.lengthDelimited then
            if v357 == 2 then
                v359 = nil;
                v360, v361 = v0.readBuffer(v354, v356);
                v359 = v360;
                v356 = v361;
                v355.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v359)
                };
            elseif v357 == 3 then
                v359 = nil;
                v360, v361 = v0.readBuffer(v354, v356);
                v359 = v360;
                v356 = v361;
                v355.kind = {
                    type = "token", 
                    value = buffer.tostring(v359)
                };
            elseif v357 == 4 then
                v359 = nil;
                v360, v361 = v0.readBuffer(v354, v356);
                v359 = v360;
                v356 = v361;
                v355.kind = {
                    type = "conditional", 
                    value = v2.Int32Prop_ConditionalOptions.decode(v359)
                };
            else
                v359 = nil;
                v360, v361 = v0.readVarInt(v354, v356);
                v356 = v361 + v360;
            end;
        elseif v358 == v0.wireTypes.i32 then
            v359 = nil;
            v360, v361 = v0.readFixed32(v354, v356);
            v359 = v360;
            v356 = v361;
        elseif v358 == v0.wireTypes.i64 then
            v359 = nil;
            v360, v361 = v0.readFixed64(v354, v356);
            v359 = v360;
            v356 = v361;
        else
            error("Unsupported wire type: " .. v358);
        end;
    end;
    return v355;
end;
v5.jsonEncode = function(v362) --[[ Line: 4498 ]] --[[ Name: jsonEncode ]]
    local v363 = {};
    if v362.kind ~= nil then
        if v362.kind.type == "literal" then
            v363.literal = v362.kind.value;
            return v363;
        elseif v362.kind.type == "binding_path" then
            v363.bindingPath = v362.kind.value;
            return v363;
        elseif v362.kind.type == "token" then
            v363.token = v362.kind.value;
            return v363;
        elseif v362.kind.type == "conditional" then
            v363.conditional = v362.kind.value:jsonEncode();
        end;
    end;
    return v363;
end;
v5.jsonDecode = function(v364) --[[ Line: 4516 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_12 (copy), v2 (copy)
    local v365 = l_v5_12.new();
    if v364.literal ~= nil then
        v365.kind = {
            type = "literal", 
            value = v364.literal
        };
    end;
    if v364.binding_path ~= nil then
        v365.kind = {
            type = "binding_path", 
            value = v364.binding_path
        };
    end;
    if v364.bindingPath ~= nil then
        v365.kind = {
            type = "binding_path", 
            value = v364.bindingPath
        };
    end;
    if v364.token ~= nil then
        v365.kind = {
            type = "token", 
            value = v364.token
        };
    end;
    if v364.conditional ~= nil then
        v365.kind = {
            type = "conditional", 
            value = v2.Int32Prop_ConditionalOptions.jsonDecode(v364.conditional)
        };
    end;
    return v365;
end;
v5.descriptor = {
    name = "Int32Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
};
v2.Int32Prop = v5;
v1.default:register(v2.Int32Prop);
v5 = {};
v5.__index = v5;
local l_v5_13 = v5 --[[ copy: 5 -> 19 ]];
v5.new = function(v367) --[[ Line: 4557 ]] --[[ Name: new ]]
    -- upvalues: l_v5_13 (copy)
    return (setmetatable({
        condition = if not (v367 ~= nil) or v367.condition == nil then nil else v367.condition, 
        kind = if not (v367 ~= nil) or v367.kind == nil then nil else v367.kind
    }, l_v5_13));
end;
v5.encode = function(v368) --[[ Line: 4566 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v369 = buffer.create(0);
    local v370 = 0;
    if v368.condition ~= nil then
        local v371 = v368.condition:encode();
        local v372, v373 = v0.writeTag(v369, v370, 1, v0.wireTypes.lengthDelimited);
        v372, v373 = v0.writeBuffer(v372, v373, v371, buffer.len(v371));
        v369 = v372;
        v370 = v373;
    end;
    if v368.kind ~= nil then
        if v368.kind.type == "literal" then
            local v374, v375 = v0.writeTag(v369, v370, 2, v0.wireTypes.varint);
            v374, v375 = v0.writeVarInt(v374, v375, v368.kind.value);
            v369 = v374;
            v370 = v375;
        elseif v368.kind.type == "binding_path" then
            local v376, v377 = v0.writeTag(v369, v370, 3, v0.wireTypes.lengthDelimited);
            v376, v377 = v0.writeString(v376, v377, v368.kind.value);
            v369 = v376;
            v370 = v377;
        elseif v368.kind.type == "token" then
            local v378, v379 = v0.writeTag(v369, v370, 4, v0.wireTypes.lengthDelimited);
            v378, v379 = v0.writeString(v378, v379, v368.kind.value);
            v369 = v378;
            v370 = v379;
        end;
    end;
    local v380 = buffer.create(v370);
    buffer.copy(v380, 0, v369, 0, v370);
    return v380;
end;
v5.decode = function(v381) --[[ Line: 4594 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_13 (copy), v0 (copy), v4 (copy)
    local v382 = l_v5_13.new();
    local v383 = 0;
    while v383 < buffer.len(v381) do
        local v384 = nil;
        local v385 = nil;
        local v386, v387, v388 = v0.readTag(v381, v383);
        v384 = v386;
        v385 = v387;
        v383 = v388;
        if v385 == v0.wireTypes.varint then
            if v384 == 2 then
                v386 = nil;
                v387, v388 = v0.readVarIntI32(v381, v383);
                v386 = v387;
                v383 = v388;
                v382.kind = {
                    type = "literal", 
                    value = v386
                };
            else
                v386 = nil;
                v387, v388 = v0.readVarInt(v381, v383);
                v386 = v387;
                v383 = v388;
            end;
        elseif v385 == v0.wireTypes.lengthDelimited then
            if v384 == 1 then
                v386 = nil;
                v387, v388 = v0.readBuffer(v381, v383);
                v386 = v387;
                v383 = v388;
                v382.condition = v4.PropCondition.decode(v386);
            elseif v384 == 3 then
                v386 = nil;
                v387, v388 = v0.readBuffer(v381, v383);
                v386 = v387;
                v383 = v388;
                v382.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v386)
                };
            elseif v384 == 4 then
                v386 = nil;
                v387, v388 = v0.readBuffer(v381, v383);
                v386 = v387;
                v383 = v388;
                v382.kind = {
                    type = "token", 
                    value = buffer.tostring(v386)
                };
            else
                v386 = nil;
                v387, v388 = v0.readVarInt(v381, v383);
                v383 = v388 + v387;
            end;
        elseif v385 == v0.wireTypes.i32 then
            v386 = nil;
            v387, v388 = v0.readFixed32(v381, v383);
            v386 = v387;
            v383 = v388;
        elseif v385 == v0.wireTypes.i64 then
            v386 = nil;
            v387, v388 = v0.readFixed64(v381, v383);
            v386 = v387;
            v383 = v388;
        else
            error("Unsupported wire type: " .. v385);
        end;
    end;
    return v382;
end;
v5.jsonEncode = function(v389) --[[ Line: 4652 ]] --[[ Name: jsonEncode ]]
    local v390 = {};
    if v389.condition ~= nil then
        v390.condition = v389.condition:jsonEncode();
    end;
    if v389.kind ~= nil then
        if v389.kind.type == "literal" then
            v390.literal = v389.kind.value;
            return v390;
        elseif v389.kind.type == "binding_path" then
            v390.bindingPath = v389.kind.value;
            return v390;
        elseif v389.kind.type == "token" then
            v390.token = v389.kind.value;
        end;
    end;
    return v390;
end;
v5.jsonDecode = function(v391) --[[ Line: 4672 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_13 (copy), v4 (copy)
    local v392 = l_v5_13.new();
    if v391.condition ~= nil then
        v392.condition = v4.PropCondition.jsonDecode(v391.condition);
    end;
    if v391.literal ~= nil then
        v392.kind = {
            type = "literal", 
            value = v391.literal
        };
    end;
    if v391.binding_path ~= nil then
        v392.kind = {
            type = "binding_path", 
            value = v391.binding_path
        };
    end;
    if v391.bindingPath ~= nil then
        v392.kind = {
            type = "binding_path", 
            value = v391.bindingPath
        };
    end;
    if v391.token ~= nil then
        v392.kind = {
            type = "token", 
            value = v391.token
        };
    end;
    return v392;
end;
v5.descriptor = {
    name = "Int32Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Int32Prop_ConditionalOption = v5;
v1.default:register(v2.Int32Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_14 = v5 --[[ copy: 5 -> 20 ]];
v5.new = function(v394) --[[ Line: 4713 ]] --[[ Name: new ]]
    -- upvalues: l_v5_14 (copy)
    return (setmetatable({
        options = if not (v394 ~= nil) or v394.options == nil then {} else v394.options
    }, l_v5_14));
end;
v5.encode = function(v395) --[[ Line: 4721 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v396 = buffer.create(0);
    local v397 = 0;
    if v395.options ~= nil and #v395.options > 0 then
        for _, v399 in v395.options do
            local v400 = v399:encode();
            local v401, v402 = v0.writeTag(v396, v397, 1, v0.wireTypes.lengthDelimited);
            v401, v402 = v0.writeBuffer(v401, v402, v400, buffer.len(v400));
            v396 = v401;
            v397 = v402;
        end;
    end;
    local v403 = buffer.create(v397);
    buffer.copy(v403, 0, v396, 0, v397);
    return v403;
end;
v5.decode = function(v404) --[[ Line: 4738 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_14 (copy), v0 (copy), v2 (copy)
    local v405 = l_v5_14.new();
    local v406 = 0;
    while v406 < buffer.len(v404) do
        local v407 = nil;
        local v408 = nil;
        local v409, v410, v411 = v0.readTag(v404, v406);
        v407 = v409;
        v408 = v410;
        v406 = v411;
        if v408 == v0.wireTypes.varint then
            v409 = nil;
            v410, v411 = v0.readVarInt(v404, v406);
            v409 = v410;
            v406 = v411;
        elseif v408 == v0.wireTypes.lengthDelimited then
            if v407 == 1 then
                v409 = nil;
                v410, v411 = v0.readBuffer(v404, v406);
                v409 = v410;
                v406 = v411;
                table.insert(v405.options, v2.Int32Prop_ConditionalOption.decode(v409));
            else
                v409 = nil;
                v410, v411 = v0.readVarInt(v404, v406);
                v406 = v411 + v410;
            end;
        elseif v408 == v0.wireTypes.i32 then
            v409 = nil;
            v410, v411 = v0.readFixed32(v404, v406);
            v409 = v410;
            v406 = v411;
        elseif v408 == v0.wireTypes.i64 then
            v409 = nil;
            v410, v411 = v0.readFixed64(v404, v406);
            v409 = v410;
            v406 = v411;
        else
            error("Unsupported wire type: " .. v408);
        end;
    end;
    return v405;
end;
v5.jsonEncode = function(v412) --[[ Line: 4781 ]] --[[ Name: jsonEncode ]]
    local v413 = {};
    if v412.options ~= nil and #v412.options > 0 then
        local v414 = {};
        for _, v416 in v412.options do
            table.insert(v414, v416:jsonEncode());
        end;
        v413.options = v414;
    end;
    return v413;
end;
v5.jsonDecode = function(v417) --[[ Line: 4795 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_14 (copy), v2 (copy)
    local v418 = l_v5_14.new();
    if v417.options ~= nil then
        local v419 = {};
        for _, v421 in v417.options do
            table.insert(v419, v2.Int32Prop_ConditionalOption.jsonDecode(v421));
        end;
        v418.options = v419;
    end;
    return v418;
end;
v5.descriptor = {
    name = "Int32Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Int32Prop_ConditionalOptions = v5;
v1.default:register(v2.Int32Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_15 = v5 --[[ copy: 5 -> 21 ]];
v5.new = function(v423) --[[ Line: 4824 ]] --[[ Name: new ]]
    -- upvalues: l_v5_15 (copy)
    return (setmetatable({
        kind = if not (v423 ~= nil) or v423.kind == nil then nil else v423.kind
    }, l_v5_15));
end;
v5.encode = function(v424) --[[ Line: 4830 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v425 = buffer.create(0);
    local v426 = 0;
    if v424.kind ~= nil then
        if v424.kind.type == "literal" then
            local v427, v428 = v0.writeTag(v425, v426, 1, v0.wireTypes.varint);
            v427, v428 = v0.writeVarInt(v427, v428, v424.kind.value);
            v425 = v427;
            v426 = v428;
        elseif v424.kind.type == "binding_path" then
            local v429, v430 = v0.writeTag(v425, v426, 2, v0.wireTypes.lengthDelimited);
            v429, v430 = v0.writeString(v429, v430, v424.kind.value);
            v425 = v429;
            v426 = v430;
        elseif v424.kind.type == "token" then
            local v431, v432 = v0.writeTag(v425, v426, 3, v0.wireTypes.lengthDelimited);
            v431, v432 = v0.writeString(v431, v432, v424.kind.value);
            v425 = v431;
            v426 = v432;
        elseif v424.kind.type == "conditional" then
            local v433 = v424.kind.value:encode();
            local v434, v435 = v0.writeTag(v425, v426, 4, v0.wireTypes.lengthDelimited);
            v434, v435 = v0.writeBuffer(v434, v435, v433, buffer.len(v433));
            v425 = v434;
            v426 = v435;
        end;
    end;
    local v436 = buffer.create(v426);
    buffer.copy(v436, 0, v425, 0, v426);
    return v436;
end;
v5.decode = function(v437) --[[ Line: 4856 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_15 (copy), v0 (copy), v2 (copy)
    local v438 = l_v5_15.new();
    local v439 = 0;
    while v439 < buffer.len(v437) do
        local v440 = nil;
        local v441 = nil;
        local v442, v443, v444 = v0.readTag(v437, v439);
        v440 = v442;
        v441 = v443;
        v439 = v444;
        if v441 == v0.wireTypes.varint then
            if v440 == 1 then
                v442 = nil;
                v443, v444 = v0.readVarIntI64(v437, v439);
                v442 = v443;
                v439 = v444;
                v438.kind = {
                    type = "literal", 
                    value = v442
                };
            else
                v442 = nil;
                v443, v444 = v0.readVarInt(v437, v439);
                v442 = v443;
                v439 = v444;
            end;
        elseif v441 == v0.wireTypes.lengthDelimited then
            if v440 == 2 then
                v442 = nil;
                v443, v444 = v0.readBuffer(v437, v439);
                v442 = v443;
                v439 = v444;
                v438.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v442)
                };
            elseif v440 == 3 then
                v442 = nil;
                v443, v444 = v0.readBuffer(v437, v439);
                v442 = v443;
                v439 = v444;
                v438.kind = {
                    type = "token", 
                    value = buffer.tostring(v442)
                };
            elseif v440 == 4 then
                v442 = nil;
                v443, v444 = v0.readBuffer(v437, v439);
                v442 = v443;
                v439 = v444;
                v438.kind = {
                    type = "conditional", 
                    value = v2.Int64Prop_ConditionalOptions.decode(v442)
                };
            else
                v442 = nil;
                v443, v444 = v0.readVarInt(v437, v439);
                v439 = v444 + v443;
            end;
        elseif v441 == v0.wireTypes.i32 then
            v442 = nil;
            v443, v444 = v0.readFixed32(v437, v439);
            v442 = v443;
            v439 = v444;
        elseif v441 == v0.wireTypes.i64 then
            v442 = nil;
            v443, v444 = v0.readFixed64(v437, v439);
            v442 = v443;
            v439 = v444;
        else
            error("Unsupported wire type: " .. v441);
        end;
    end;
    return v438;
end;
v5.jsonEncode = function(v445) --[[ Line: 4914 ]] --[[ Name: jsonEncode ]]
    local v446 = {};
    if v445.kind ~= nil then
        if v445.kind.type == "literal" then
            v446.literal = v445.kind.value;
            return v446;
        elseif v445.kind.type == "binding_path" then
            v446.bindingPath = v445.kind.value;
            return v446;
        elseif v445.kind.type == "token" then
            v446.token = v445.kind.value;
            return v446;
        elseif v445.kind.type == "conditional" then
            v446.conditional = v445.kind.value:jsonEncode();
        end;
    end;
    return v446;
end;
v5.jsonDecode = function(v447) --[[ Line: 4932 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_15 (copy), v2 (copy)
    local v448 = l_v5_15.new();
    if v447.literal ~= nil then
        v448.kind = {
            type = "literal", 
            value = v447.literal
        };
    end;
    if v447.binding_path ~= nil then
        v448.kind = {
            type = "binding_path", 
            value = v447.binding_path
        };
    end;
    if v447.bindingPath ~= nil then
        v448.kind = {
            type = "binding_path", 
            value = v447.bindingPath
        };
    end;
    if v447.token ~= nil then
        v448.kind = {
            type = "token", 
            value = v447.token
        };
    end;
    if v447.conditional ~= nil then
        v448.kind = {
            type = "conditional", 
            value = v2.Int64Prop_ConditionalOptions.jsonDecode(v447.conditional)
        };
    end;
    return v448;
end;
v5.descriptor = {
    name = "Int64Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
};
v2.Int64Prop = v5;
v1.default:register(v2.Int64Prop);
v5 = {};
v5.__index = v5;
local l_v5_16 = v5 --[[ copy: 5 -> 22 ]];
v5.new = function(v450) --[[ Line: 4973 ]] --[[ Name: new ]]
    -- upvalues: l_v5_16 (copy)
    return (setmetatable({
        condition = if not (v450 ~= nil) or v450.condition == nil then nil else v450.condition, 
        kind = if not (v450 ~= nil) or v450.kind == nil then nil else v450.kind
    }, l_v5_16));
end;
v5.encode = function(v451) --[[ Line: 4982 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v452 = buffer.create(0);
    local v453 = 0;
    if v451.condition ~= nil then
        local v454 = v451.condition:encode();
        local v455, v456 = v0.writeTag(v452, v453, 1, v0.wireTypes.lengthDelimited);
        v455, v456 = v0.writeBuffer(v455, v456, v454, buffer.len(v454));
        v452 = v455;
        v453 = v456;
    end;
    if v451.kind ~= nil then
        if v451.kind.type == "literal" then
            local v457, v458 = v0.writeTag(v452, v453, 2, v0.wireTypes.varint);
            v457, v458 = v0.writeVarInt(v457, v458, v451.kind.value);
            v452 = v457;
            v453 = v458;
        elseif v451.kind.type == "binding_path" then
            local v459, v460 = v0.writeTag(v452, v453, 3, v0.wireTypes.lengthDelimited);
            v459, v460 = v0.writeString(v459, v460, v451.kind.value);
            v452 = v459;
            v453 = v460;
        elseif v451.kind.type == "token" then
            local v461, v462 = v0.writeTag(v452, v453, 4, v0.wireTypes.lengthDelimited);
            v461, v462 = v0.writeString(v461, v462, v451.kind.value);
            v452 = v461;
            v453 = v462;
        end;
    end;
    local v463 = buffer.create(v453);
    buffer.copy(v463, 0, v452, 0, v453);
    return v463;
end;
v5.decode = function(v464) --[[ Line: 5010 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_16 (copy), v0 (copy), v4 (copy)
    local v465 = l_v5_16.new();
    local v466 = 0;
    while v466 < buffer.len(v464) do
        local v467 = nil;
        local v468 = nil;
        local v469, v470, v471 = v0.readTag(v464, v466);
        v467 = v469;
        v468 = v470;
        v466 = v471;
        if v468 == v0.wireTypes.varint then
            if v467 == 2 then
                v469 = nil;
                v470, v471 = v0.readVarIntI64(v464, v466);
                v469 = v470;
                v466 = v471;
                v465.kind = {
                    type = "literal", 
                    value = v469
                };
            else
                v469 = nil;
                v470, v471 = v0.readVarInt(v464, v466);
                v469 = v470;
                v466 = v471;
            end;
        elseif v468 == v0.wireTypes.lengthDelimited then
            if v467 == 1 then
                v469 = nil;
                v470, v471 = v0.readBuffer(v464, v466);
                v469 = v470;
                v466 = v471;
                v465.condition = v4.PropCondition.decode(v469);
            elseif v467 == 3 then
                v469 = nil;
                v470, v471 = v0.readBuffer(v464, v466);
                v469 = v470;
                v466 = v471;
                v465.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v469)
                };
            elseif v467 == 4 then
                v469 = nil;
                v470, v471 = v0.readBuffer(v464, v466);
                v469 = v470;
                v466 = v471;
                v465.kind = {
                    type = "token", 
                    value = buffer.tostring(v469)
                };
            else
                v469 = nil;
                v470, v471 = v0.readVarInt(v464, v466);
                v466 = v471 + v470;
            end;
        elseif v468 == v0.wireTypes.i32 then
            v469 = nil;
            v470, v471 = v0.readFixed32(v464, v466);
            v469 = v470;
            v466 = v471;
        elseif v468 == v0.wireTypes.i64 then
            v469 = nil;
            v470, v471 = v0.readFixed64(v464, v466);
            v469 = v470;
            v466 = v471;
        else
            error("Unsupported wire type: " .. v468);
        end;
    end;
    return v465;
end;
v5.jsonEncode = function(v472) --[[ Line: 5068 ]] --[[ Name: jsonEncode ]]
    local v473 = {};
    if v472.condition ~= nil then
        v473.condition = v472.condition:jsonEncode();
    end;
    if v472.kind ~= nil then
        if v472.kind.type == "literal" then
            v473.literal = v472.kind.value;
            return v473;
        elseif v472.kind.type == "binding_path" then
            v473.bindingPath = v472.kind.value;
            return v473;
        elseif v472.kind.type == "token" then
            v473.token = v472.kind.value;
        end;
    end;
    return v473;
end;
v5.jsonDecode = function(v474) --[[ Line: 5088 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_16 (copy), v4 (copy)
    local v475 = l_v5_16.new();
    if v474.condition ~= nil then
        v475.condition = v4.PropCondition.jsonDecode(v474.condition);
    end;
    if v474.literal ~= nil then
        v475.kind = {
            type = "literal", 
            value = v474.literal
        };
    end;
    if v474.binding_path ~= nil then
        v475.kind = {
            type = "binding_path", 
            value = v474.binding_path
        };
    end;
    if v474.bindingPath ~= nil then
        v475.kind = {
            type = "binding_path", 
            value = v474.bindingPath
        };
    end;
    if v474.token ~= nil then
        v475.kind = {
            type = "token", 
            value = v474.token
        };
    end;
    return v475;
end;
v5.descriptor = {
    name = "Int64Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Int64Prop_ConditionalOption = v5;
v1.default:register(v2.Int64Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_17 = v5 --[[ copy: 5 -> 23 ]];
v5.new = function(v477) --[[ Line: 5129 ]] --[[ Name: new ]]
    -- upvalues: l_v5_17 (copy)
    return (setmetatable({
        options = if not (v477 ~= nil) or v477.options == nil then {} else v477.options
    }, l_v5_17));
end;
v5.encode = function(v478) --[[ Line: 5137 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v479 = buffer.create(0);
    local v480 = 0;
    if v478.options ~= nil and #v478.options > 0 then
        for _, v482 in v478.options do
            local v483 = v482:encode();
            local v484, v485 = v0.writeTag(v479, v480, 1, v0.wireTypes.lengthDelimited);
            v484, v485 = v0.writeBuffer(v484, v485, v483, buffer.len(v483));
            v479 = v484;
            v480 = v485;
        end;
    end;
    local v486 = buffer.create(v480);
    buffer.copy(v486, 0, v479, 0, v480);
    return v486;
end;
v5.decode = function(v487) --[[ Line: 5154 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_17 (copy), v0 (copy), v2 (copy)
    local v488 = l_v5_17.new();
    local v489 = 0;
    while v489 < buffer.len(v487) do
        local v490 = nil;
        local v491 = nil;
        local v492, v493, v494 = v0.readTag(v487, v489);
        v490 = v492;
        v491 = v493;
        v489 = v494;
        if v491 == v0.wireTypes.varint then
            v492 = nil;
            v493, v494 = v0.readVarInt(v487, v489);
            v492 = v493;
            v489 = v494;
        elseif v491 == v0.wireTypes.lengthDelimited then
            if v490 == 1 then
                v492 = nil;
                v493, v494 = v0.readBuffer(v487, v489);
                v492 = v493;
                v489 = v494;
                table.insert(v488.options, v2.Int64Prop_ConditionalOption.decode(v492));
            else
                v492 = nil;
                v493, v494 = v0.readVarInt(v487, v489);
                v489 = v494 + v493;
            end;
        elseif v491 == v0.wireTypes.i32 then
            v492 = nil;
            v493, v494 = v0.readFixed32(v487, v489);
            v492 = v493;
            v489 = v494;
        elseif v491 == v0.wireTypes.i64 then
            v492 = nil;
            v493, v494 = v0.readFixed64(v487, v489);
            v492 = v493;
            v489 = v494;
        else
            error("Unsupported wire type: " .. v491);
        end;
    end;
    return v488;
end;
v5.jsonEncode = function(v495) --[[ Line: 5197 ]] --[[ Name: jsonEncode ]]
    local v496 = {};
    if v495.options ~= nil and #v495.options > 0 then
        local v497 = {};
        for _, v499 in v495.options do
            table.insert(v497, v499:jsonEncode());
        end;
        v496.options = v497;
    end;
    return v496;
end;
v5.jsonDecode = function(v500) --[[ Line: 5211 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_17 (copy), v2 (copy)
    local v501 = l_v5_17.new();
    if v500.options ~= nil then
        local v502 = {};
        for _, v504 in v500.options do
            table.insert(v502, v2.Int64Prop_ConditionalOption.jsonDecode(v504));
        end;
        v501.options = v502;
    end;
    return v501;
end;
v5.descriptor = {
    name = "Int64Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Int64Prop_ConditionalOptions = v5;
v1.default:register(v2.Int64Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_18 = v5 --[[ copy: 5 -> 24 ]];
v5.new = function(v506) --[[ Line: 5240 ]] --[[ Name: new ]]
    -- upvalues: l_v5_18 (copy)
    return (setmetatable({
        kind = if not (v506 ~= nil) or v506.kind == nil then nil else v506.kind
    }, l_v5_18));
end;
v5.encode = function(v507) --[[ Line: 5246 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v508 = buffer.create(0);
    local v509 = 0;
    if v507.kind ~= nil then
        if v507.kind.type == "literal" then
            local v510, v511 = v0.writeTag(v508, v509, 1, v0.wireTypes.varint);
            v510, v511 = v0.writeVarInt(v510, v511, v507.kind.value and 1 or 0);
            v508 = v510;
            v509 = v511;
        elseif v507.kind.type == "binding_path" then
            local v512, v513 = v0.writeTag(v508, v509, 2, v0.wireTypes.lengthDelimited);
            v512, v513 = v0.writeString(v512, v513, v507.kind.value);
            v508 = v512;
            v509 = v513;
        elseif v507.kind.type == "conditional" then
            local v514 = v507.kind.value:encode();
            local v515, v516 = v0.writeTag(v508, v509, 3, v0.wireTypes.lengthDelimited);
            v515, v516 = v0.writeBuffer(v515, v516, v514, buffer.len(v514));
            v508 = v515;
            v509 = v516;
        end;
    end;
    local v517 = buffer.create(v509);
    buffer.copy(v517, 0, v508, 0, v509);
    return v517;
end;
v5.decode = function(v518) --[[ Line: 5269 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_18 (copy), v0 (copy), v2 (copy)
    local v519 = l_v5_18.new();
    local v520 = 0;
    while v520 < buffer.len(v518) do
        local v521 = nil;
        local v522 = nil;
        local v523, v524, v525 = v0.readTag(v518, v520);
        v521 = v523;
        v522 = v524;
        v520 = v525;
        if v522 == v0.wireTypes.varint then
            if v521 == 1 then
                v523 = nil;
                v524, v525 = v0.readVarInt(v518, v520);
                v523 = v524;
                v520 = v525;
                v519.kind = {
                    type = "literal", 
                    value = v523 ~= 0
                };
            else
                v523 = nil;
                v524, v525 = v0.readVarInt(v518, v520);
                v523 = v524;
                v520 = v525;
            end;
        elseif v522 == v0.wireTypes.lengthDelimited then
            if v521 == 2 then
                v523 = nil;
                v524, v525 = v0.readBuffer(v518, v520);
                v523 = v524;
                v520 = v525;
                v519.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v523)
                };
            elseif v521 == 3 then
                v523 = nil;
                v524, v525 = v0.readBuffer(v518, v520);
                v523 = v524;
                v520 = v525;
                v519.kind = {
                    type = "conditional", 
                    value = v2.BoolProp_ConditionalOptions.decode(v523)
                };
            else
                v523 = nil;
                v524, v525 = v0.readVarInt(v518, v520);
                v520 = v525 + v524;
            end;
        elseif v522 == v0.wireTypes.i32 then
            v523 = nil;
            v524, v525 = v0.readFixed32(v518, v520);
            v523 = v524;
            v520 = v525;
        elseif v522 == v0.wireTypes.i64 then
            v523 = nil;
            v524, v525 = v0.readFixed64(v518, v520);
            v523 = v524;
            v520 = v525;
        else
            error("Unsupported wire type: " .. v522);
        end;
    end;
    return v519;
end;
v5.jsonEncode = function(v526) --[[ Line: 5322 ]] --[[ Name: jsonEncode ]]
    local v527 = {};
    if v526.kind ~= nil then
        if v526.kind.type == "literal" then
            v527.literal = v526.kind.value;
            return v527;
        elseif v526.kind.type == "binding_path" then
            v527.bindingPath = v526.kind.value;
            return v527;
        elseif v526.kind.type == "conditional" then
            v527.conditional = v526.kind.value:jsonEncode();
        end;
    end;
    return v527;
end;
v5.jsonDecode = function(v528) --[[ Line: 5338 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_18 (copy), v2 (copy)
    local v529 = l_v5_18.new();
    if v528.literal ~= nil then
        v529.kind = {
            type = "literal", 
            value = v528.literal
        };
    end;
    if v528.binding_path ~= nil then
        v529.kind = {
            type = "binding_path", 
            value = v528.binding_path
        };
    end;
    if v528.bindingPath ~= nil then
        v529.kind = {
            type = "binding_path", 
            value = v528.bindingPath
        };
    end;
    if v528.conditional ~= nil then
        v529.kind = {
            type = "conditional", 
            value = v2.BoolProp_ConditionalOptions.jsonDecode(v528.conditional)
        };
    end;
    return v529;
end;
v5.descriptor = {
    name = "BoolProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
};
v2.BoolProp = v5;
v1.default:register(v2.BoolProp);
v5 = {};
v5.__index = v5;
local l_v5_19 = v5 --[[ copy: 5 -> 25 ]];
v5.new = function(v531) --[[ Line: 5375 ]] --[[ Name: new ]]
    -- upvalues: l_v5_19 (copy)
    return (setmetatable({
        condition = if not (v531 ~= nil) or v531.condition == nil then nil else v531.condition, 
        kind = if not (v531 ~= nil) or v531.kind == nil then nil else v531.kind
    }, l_v5_19));
end;
v5.encode = function(v532) --[[ Line: 5384 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v533 = buffer.create(0);
    local v534 = 0;
    if v532.condition ~= nil then
        local v535 = v532.condition:encode();
        local v536, v537 = v0.writeTag(v533, v534, 1, v0.wireTypes.lengthDelimited);
        v536, v537 = v0.writeBuffer(v536, v537, v535, buffer.len(v535));
        v533 = v536;
        v534 = v537;
    end;
    if v532.kind ~= nil then
        if v532.kind.type == "literal" then
            local v538, v539 = v0.writeTag(v533, v534, 2, v0.wireTypes.varint);
            v538, v539 = v0.writeVarInt(v538, v539, v532.kind.value and 1 or 0);
            v533 = v538;
            v534 = v539;
        elseif v532.kind.type == "binding_path" then
            local v540, v541 = v0.writeTag(v533, v534, 3, v0.wireTypes.lengthDelimited);
            v540, v541 = v0.writeString(v540, v541, v532.kind.value);
            v533 = v540;
            v534 = v541;
        end;
    end;
    local v542 = buffer.create(v534);
    buffer.copy(v542, 0, v533, 0, v534);
    return v542;
end;
v5.decode = function(v543) --[[ Line: 5409 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_19 (copy), v0 (copy), v4 (copy)
    local v544 = l_v5_19.new();
    local v545 = 0;
    while v545 < buffer.len(v543) do
        local v546 = nil;
        local v547 = nil;
        local v548, v549, v550 = v0.readTag(v543, v545);
        v546 = v548;
        v547 = v549;
        v545 = v550;
        if v547 == v0.wireTypes.varint then
            if v546 == 2 then
                v548 = nil;
                v549, v550 = v0.readVarInt(v543, v545);
                v548 = v549;
                v545 = v550;
                v544.kind = {
                    type = "literal", 
                    value = v548 ~= 0
                };
            else
                v548 = nil;
                v549, v550 = v0.readVarInt(v543, v545);
                v548 = v549;
                v545 = v550;
            end;
        elseif v547 == v0.wireTypes.lengthDelimited then
            if v546 == 1 then
                v548 = nil;
                v549, v550 = v0.readBuffer(v543, v545);
                v548 = v549;
                v545 = v550;
                v544.condition = v4.PropCondition.decode(v548);
            elseif v546 == 3 then
                v548 = nil;
                v549, v550 = v0.readBuffer(v543, v545);
                v548 = v549;
                v545 = v550;
                v544.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v548)
                };
            else
                v548 = nil;
                v549, v550 = v0.readVarInt(v543, v545);
                v545 = v550 + v549;
            end;
        elseif v547 == v0.wireTypes.i32 then
            v548 = nil;
            v549, v550 = v0.readFixed32(v543, v545);
            v548 = v549;
            v545 = v550;
        elseif v547 == v0.wireTypes.i64 then
            v548 = nil;
            v549, v550 = v0.readFixed64(v543, v545);
            v548 = v549;
            v545 = v550;
        else
            error("Unsupported wire type: " .. v547);
        end;
    end;
    return v544;
end;
v5.jsonEncode = function(v551) --[[ Line: 5462 ]] --[[ Name: jsonEncode ]]
    local v552 = {};
    if v551.condition ~= nil then
        v552.condition = v551.condition:jsonEncode();
    end;
    if v551.kind ~= nil then
        if v551.kind.type == "literal" then
            v552.literal = v551.kind.value;
            return v552;
        elseif v551.kind.type == "binding_path" then
            v552.bindingPath = v551.kind.value;
        end;
    end;
    return v552;
end;
v5.jsonDecode = function(v553) --[[ Line: 5480 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_19 (copy), v4 (copy)
    local v554 = l_v5_19.new();
    if v553.condition ~= nil then
        v554.condition = v4.PropCondition.jsonDecode(v553.condition);
    end;
    if v553.literal ~= nil then
        v554.kind = {
            type = "literal", 
            value = v553.literal
        };
    end;
    if v553.binding_path ~= nil then
        v554.kind = {
            type = "binding_path", 
            value = v553.binding_path
        };
    end;
    if v553.bindingPath ~= nil then
        v554.kind = {
            type = "binding_path", 
            value = v553.bindingPath
        };
    end;
    return v554;
end;
v5.descriptor = {
    name = "BoolProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.BoolProp_ConditionalOption = v5;
v1.default:register(v2.BoolProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_20 = v5 --[[ copy: 5 -> 26 ]];
v5.new = function(v556) --[[ Line: 5517 ]] --[[ Name: new ]]
    -- upvalues: l_v5_20 (copy)
    return (setmetatable({
        options = if not (v556 ~= nil) or v556.options == nil then {} else v556.options
    }, l_v5_20));
end;
v5.encode = function(v557) --[[ Line: 5525 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v558 = buffer.create(0);
    local v559 = 0;
    if v557.options ~= nil and #v557.options > 0 then
        for _, v561 in v557.options do
            local v562 = v561:encode();
            local v563, v564 = v0.writeTag(v558, v559, 1, v0.wireTypes.lengthDelimited);
            v563, v564 = v0.writeBuffer(v563, v564, v562, buffer.len(v562));
            v558 = v563;
            v559 = v564;
        end;
    end;
    local v565 = buffer.create(v559);
    buffer.copy(v565, 0, v558, 0, v559);
    return v565;
end;
v5.decode = function(v566) --[[ Line: 5542 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_20 (copy), v0 (copy), v2 (copy)
    local v567 = l_v5_20.new();
    local v568 = 0;
    while v568 < buffer.len(v566) do
        local v569 = nil;
        local v570 = nil;
        local v571, v572, v573 = v0.readTag(v566, v568);
        v569 = v571;
        v570 = v572;
        v568 = v573;
        if v570 == v0.wireTypes.varint then
            v571 = nil;
            v572, v573 = v0.readVarInt(v566, v568);
            v571 = v572;
            v568 = v573;
        elseif v570 == v0.wireTypes.lengthDelimited then
            if v569 == 1 then
                v571 = nil;
                v572, v573 = v0.readBuffer(v566, v568);
                v571 = v572;
                v568 = v573;
                table.insert(v567.options, v2.BoolProp_ConditionalOption.decode(v571));
            else
                v571 = nil;
                v572, v573 = v0.readVarInt(v566, v568);
                v568 = v573 + v572;
            end;
        elseif v570 == v0.wireTypes.i32 then
            v571 = nil;
            v572, v573 = v0.readFixed32(v566, v568);
            v571 = v572;
            v568 = v573;
        elseif v570 == v0.wireTypes.i64 then
            v571 = nil;
            v572, v573 = v0.readFixed64(v566, v568);
            v571 = v572;
            v568 = v573;
        else
            error("Unsupported wire type: " .. v570);
        end;
    end;
    return v567;
end;
v5.jsonEncode = function(v574) --[[ Line: 5585 ]] --[[ Name: jsonEncode ]]
    local v575 = {};
    if v574.options ~= nil and #v574.options > 0 then
        local v576 = {};
        for _, v578 in v574.options do
            table.insert(v576, v578:jsonEncode());
        end;
        v575.options = v576;
    end;
    return v575;
end;
v5.jsonDecode = function(v579) --[[ Line: 5599 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_20 (copy), v2 (copy)
    local v580 = l_v5_20.new();
    if v579.options ~= nil then
        local v581 = {};
        for _, v583 in v579.options do
            table.insert(v581, v2.BoolProp_ConditionalOption.jsonDecode(v583));
        end;
        v580.options = v581;
    end;
    return v580;
end;
v5.descriptor = {
    name = "BoolProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.BoolProp_ConditionalOptions = v5;
v1.default:register(v2.BoolProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_21 = v5 --[[ copy: 5 -> 27 ]];
v5.new = function(v585) --[[ Line: 5628 ]] --[[ Name: new ]]
    -- upvalues: l_v5_21 (copy)
    return (setmetatable({
        kind = if not (v585 ~= nil) or v585.kind == nil then nil else v585.kind
    }, l_v5_21));
end;
v5.encode = function(v586) --[[ Line: 5634 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v587 = buffer.create(0);
    local v588 = 0;
    if v586.kind ~= nil then
        if v586.kind.type == "literal" then
            local v589 = v586.kind.value:encode();
            local v590, v591 = v0.writeTag(v587, v588, 1, v0.wireTypes.lengthDelimited);
            v590, v591 = v0.writeBuffer(v590, v591, v589, buffer.len(v589));
            v587 = v590;
            v588 = v591;
        elseif v586.kind.type == "binding_path" then
            local v592, v593 = v0.writeTag(v587, v588, 2, v0.wireTypes.lengthDelimited);
            v592, v593 = v0.writeString(v592, v593, v586.kind.value);
            v587 = v592;
            v588 = v593;
        elseif v586.kind.type == "conditional" then
            local v594 = v586.kind.value:encode();
            local v595, v596 = v0.writeTag(v587, v588, 3, v0.wireTypes.lengthDelimited);
            v595, v596 = v0.writeBuffer(v595, v596, v594, buffer.len(v594));
            v587 = v595;
            v588 = v596;
        end;
    end;
    local v597 = buffer.create(v588);
    buffer.copy(v597, 0, v587, 0, v588);
    return v597;
end;
v5.decode = function(v598) --[[ Line: 5658 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_21 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v599 = l_v5_21.new();
    local v600 = 0;
    while v600 < buffer.len(v598) do
        local v601 = nil;
        local v602 = nil;
        local v603, v604, v605 = v0.readTag(v598, v600);
        v601 = v603;
        v602 = v604;
        v600 = v605;
        if v602 == v0.wireTypes.varint then
            v603 = nil;
            v604, v605 = v0.readVarInt(v598, v600);
            v603 = v604;
            v600 = v605;
        elseif v602 == v0.wireTypes.lengthDelimited then
            if v601 == 1 then
                v603 = nil;
                v604, v605 = v0.readBuffer(v598, v600);
                v603 = v604;
                v600 = v605;
                v599.kind = {
                    type = "literal", 
                    value = v3.Struct.decode(v603)
                };
            elseif v601 == 2 then
                v603 = nil;
                v604, v605 = v0.readBuffer(v598, v600);
                v603 = v604;
                v600 = v605;
                v599.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v603)
                };
            elseif v601 == 3 then
                v603 = nil;
                v604, v605 = v0.readBuffer(v598, v600);
                v603 = v604;
                v600 = v605;
                v599.kind = {
                    type = "conditional", 
                    value = v2.StructProp_ConditionalOptions.decode(v603)
                };
            else
                v603 = nil;
                v604, v605 = v0.readVarInt(v598, v600);
                v600 = v605 + v604;
            end;
        elseif v602 == v0.wireTypes.i32 then
            v603 = nil;
            v604, v605 = v0.readFixed32(v598, v600);
            v603 = v604;
            v600 = v605;
        elseif v602 == v0.wireTypes.i64 then
            v603 = nil;
            v604, v605 = v0.readFixed64(v598, v600);
            v603 = v604;
            v600 = v605;
        else
            error("Unsupported wire type: " .. v602);
        end;
    end;
    return v599;
end;
v5.jsonEncode = function(v606) --[[ Line: 5711 ]] --[[ Name: jsonEncode ]]
    local v607 = {};
    if v606.kind ~= nil then
        if v606.kind.type == "literal" then
            v607.literal = v606.kind.value:jsonEncode();
            return v607;
        elseif v606.kind.type == "binding_path" then
            v607.bindingPath = v606.kind.value;
            return v607;
        elseif v606.kind.type == "conditional" then
            v607.conditional = v606.kind.value:jsonEncode();
        end;
    end;
    return v607;
end;
v5.jsonDecode = function(v608) --[[ Line: 5727 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_21 (copy), v3 (copy), v2 (copy)
    local v609 = l_v5_21.new();
    if v608.literal ~= nil then
        v609.kind = {
            type = "literal", 
            value = v3.Struct.jsonDecode(v608.literal)
        };
    end;
    if v608.binding_path ~= nil then
        v609.kind = {
            type = "binding_path", 
            value = v608.binding_path
        };
    end;
    if v608.bindingPath ~= nil then
        v609.kind = {
            type = "binding_path", 
            value = v608.bindingPath
        };
    end;
    if v608.conditional ~= nil then
        v609.kind = {
            type = "conditional", 
            value = v2.StructProp_ConditionalOptions.jsonDecode(v608.conditional)
        };
    end;
    return v609;
end;
v5.descriptor = {
    name = "StructProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
};
v2.StructProp = v5;
v1.default:register(v2.StructProp);
v5 = {};
v5.__index = v5;
local l_v5_22 = v5 --[[ copy: 5 -> 28 ]];
v5.new = function(v611) --[[ Line: 5764 ]] --[[ Name: new ]]
    -- upvalues: l_v5_22 (copy)
    return (setmetatable({
        condition = if not (v611 ~= nil) or v611.condition == nil then nil else v611.condition, 
        kind = if not (v611 ~= nil) or v611.kind == nil then nil else v611.kind
    }, l_v5_22));
end;
v5.encode = function(v612) --[[ Line: 5773 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v613 = buffer.create(0);
    local v614 = 0;
    if v612.condition ~= nil then
        local v615 = v612.condition:encode();
        local v616, v617 = v0.writeTag(v613, v614, 1, v0.wireTypes.lengthDelimited);
        v616, v617 = v0.writeBuffer(v616, v617, v615, buffer.len(v615));
        v613 = v616;
        v614 = v617;
    end;
    if v612.kind ~= nil then
        if v612.kind.type == "literal" then
            local v618 = v612.kind.value:encode();
            local v619, v620 = v0.writeTag(v613, v614, 2, v0.wireTypes.lengthDelimited);
            v619, v620 = v0.writeBuffer(v619, v620, v618, buffer.len(v618));
            v613 = v619;
            v614 = v620;
        elseif v612.kind.type == "binding_path" then
            local v621, v622 = v0.writeTag(v613, v614, 3, v0.wireTypes.lengthDelimited);
            v621, v622 = v0.writeString(v621, v622, v612.kind.value);
            v613 = v621;
            v614 = v622;
        end;
    end;
    local v623 = buffer.create(v614);
    buffer.copy(v623, 0, v613, 0, v614);
    return v623;
end;
v5.decode = function(v624) --[[ Line: 5799 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_22 (copy), v0 (copy), v4 (copy), v3 (copy)
    local v625 = l_v5_22.new();
    local v626 = 0;
    while v626 < buffer.len(v624) do
        local v627 = nil;
        local v628 = nil;
        local v629, v630, v631 = v0.readTag(v624, v626);
        v627 = v629;
        v628 = v630;
        v626 = v631;
        if v628 == v0.wireTypes.varint then
            v629 = nil;
            v630, v631 = v0.readVarInt(v624, v626);
            v629 = v630;
            v626 = v631;
        elseif v628 == v0.wireTypes.lengthDelimited then
            if v627 == 1 then
                v629 = nil;
                v630, v631 = v0.readBuffer(v624, v626);
                v629 = v630;
                v626 = v631;
                v625.condition = v4.PropCondition.decode(v629);
            elseif v627 == 2 then
                v629 = nil;
                v630, v631 = v0.readBuffer(v624, v626);
                v629 = v630;
                v626 = v631;
                v625.kind = {
                    type = "literal", 
                    value = v3.Struct.decode(v629)
                };
            elseif v627 == 3 then
                v629 = nil;
                v630, v631 = v0.readBuffer(v624, v626);
                v629 = v630;
                v626 = v631;
                v625.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v629)
                };
            else
                v629 = nil;
                v630, v631 = v0.readVarInt(v624, v626);
                v626 = v631 + v630;
            end;
        elseif v628 == v0.wireTypes.i32 then
            v629 = nil;
            v630, v631 = v0.readFixed32(v624, v626);
            v629 = v630;
            v626 = v631;
        elseif v628 == v0.wireTypes.i64 then
            v629 = nil;
            v630, v631 = v0.readFixed64(v624, v626);
            v629 = v630;
            v626 = v631;
        else
            error("Unsupported wire type: " .. v628);
        end;
    end;
    return v625;
end;
v5.jsonEncode = function(v632) --[[ Line: 5852 ]] --[[ Name: jsonEncode ]]
    local v633 = {};
    if v632.condition ~= nil then
        v633.condition = v632.condition:jsonEncode();
    end;
    if v632.kind ~= nil then
        if v632.kind.type == "literal" then
            v633.literal = v632.kind.value:jsonEncode();
            return v633;
        elseif v632.kind.type == "binding_path" then
            v633.bindingPath = v632.kind.value;
        end;
    end;
    return v633;
end;
v5.jsonDecode = function(v634) --[[ Line: 5870 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_22 (copy), v4 (copy), v3 (copy)
    local v635 = l_v5_22.new();
    if v634.condition ~= nil then
        v635.condition = v4.PropCondition.jsonDecode(v634.condition);
    end;
    if v634.literal ~= nil then
        v635.kind = {
            type = "literal", 
            value = v3.Struct.jsonDecode(v634.literal)
        };
    end;
    if v634.binding_path ~= nil then
        v635.kind = {
            type = "binding_path", 
            value = v634.binding_path
        };
    end;
    if v634.bindingPath ~= nil then
        v635.kind = {
            type = "binding_path", 
            value = v634.bindingPath
        };
    end;
    return v635;
end;
v5.descriptor = {
    name = "StructProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.StructProp_ConditionalOption = v5;
v1.default:register(v2.StructProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_23 = v5 --[[ copy: 5 -> 29 ]];
v5.new = function(v637) --[[ Line: 5907 ]] --[[ Name: new ]]
    -- upvalues: l_v5_23 (copy)
    return (setmetatable({
        options = if not (v637 ~= nil) or v637.options == nil then {} else v637.options
    }, l_v5_23));
end;
v5.encode = function(v638) --[[ Line: 5915 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v639 = buffer.create(0);
    local v640 = 0;
    if v638.options ~= nil and #v638.options > 0 then
        for _, v642 in v638.options do
            local v643 = v642:encode();
            local v644, v645 = v0.writeTag(v639, v640, 1, v0.wireTypes.lengthDelimited);
            v644, v645 = v0.writeBuffer(v644, v645, v643, buffer.len(v643));
            v639 = v644;
            v640 = v645;
        end;
    end;
    local v646 = buffer.create(v640);
    buffer.copy(v646, 0, v639, 0, v640);
    return v646;
end;
v5.decode = function(v647) --[[ Line: 5932 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_23 (copy), v0 (copy), v2 (copy)
    local v648 = l_v5_23.new();
    local v649 = 0;
    while v649 < buffer.len(v647) do
        local v650 = nil;
        local v651 = nil;
        local v652, v653, v654 = v0.readTag(v647, v649);
        v650 = v652;
        v651 = v653;
        v649 = v654;
        if v651 == v0.wireTypes.varint then
            v652 = nil;
            v653, v654 = v0.readVarInt(v647, v649);
            v652 = v653;
            v649 = v654;
        elseif v651 == v0.wireTypes.lengthDelimited then
            if v650 == 1 then
                v652 = nil;
                v653, v654 = v0.readBuffer(v647, v649);
                v652 = v653;
                v649 = v654;
                table.insert(v648.options, v2.StructProp_ConditionalOption.decode(v652));
            else
                v652 = nil;
                v653, v654 = v0.readVarInt(v647, v649);
                v649 = v654 + v653;
            end;
        elseif v651 == v0.wireTypes.i32 then
            v652 = nil;
            v653, v654 = v0.readFixed32(v647, v649);
            v652 = v653;
            v649 = v654;
        elseif v651 == v0.wireTypes.i64 then
            v652 = nil;
            v653, v654 = v0.readFixed64(v647, v649);
            v652 = v653;
            v649 = v654;
        else
            error("Unsupported wire type: " .. v651);
        end;
    end;
    return v648;
end;
v5.jsonEncode = function(v655) --[[ Line: 5975 ]] --[[ Name: jsonEncode ]]
    local v656 = {};
    if v655.options ~= nil and #v655.options > 0 then
        local v657 = {};
        for _, v659 in v655.options do
            table.insert(v657, v659:jsonEncode());
        end;
        v656.options = v657;
    end;
    return v656;
end;
v5.jsonDecode = function(v660) --[[ Line: 5989 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_23 (copy), v2 (copy)
    local v661 = l_v5_23.new();
    if v660.options ~= nil then
        local v662 = {};
        for _, v664 in v660.options do
            table.insert(v662, v2.StructProp_ConditionalOption.jsonDecode(v664));
        end;
        v661.options = v662;
    end;
    return v661;
end;
v5.descriptor = {
    name = "StructProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.StructProp_ConditionalOptions = v5;
v1.default:register(v2.StructProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_24 = v5 --[[ copy: 5 -> 30 ]];
v5.new = function(v666) --[[ Line: 6018 ]] --[[ Name: new ]]
    -- upvalues: l_v5_24 (copy)
    return (setmetatable({
        kind = if not (v666 ~= nil) or v666.kind == nil then nil else v666.kind
    }, l_v5_24));
end;
v5.encode = function(v667) --[[ Line: 6024 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v668 = buffer.create(0);
    local v669 = 0;
    if v667.kind ~= nil then
        if v667.kind.type == "literal" then
            local v670, v671 = v0.writeTag(v668, v669, 1, v0.wireTypes.lengthDelimited);
            v670, v671 = v0.writeString(v670, v671, v667.kind.value);
            v668 = v670;
            v669 = v671;
        elseif v667.kind.type == "binding_path" then
            local v672, v673 = v0.writeTag(v668, v669, 2, v0.wireTypes.lengthDelimited);
            v672, v673 = v0.writeString(v672, v673, v667.kind.value);
            v668 = v672;
            v669 = v673;
        elseif v667.kind.type == "format" then
            local v674 = v667.kind.value:encode();
            local v675, v676 = v0.writeTag(v668, v669, 3, v0.wireTypes.lengthDelimited);
            v675, v676 = v0.writeBuffer(v675, v676, v674, buffer.len(v674));
            v668 = v675;
            v669 = v676;
        elseif v667.kind.type == "conditional" then
            local v677 = v667.kind.value:encode();
            local v678, v679 = v0.writeTag(v668, v669, 4, v0.wireTypes.lengthDelimited);
            v678, v679 = v0.writeBuffer(v678, v679, v677, buffer.len(v677));
            v668 = v678;
            v669 = v679;
        end;
    end;
    local v680 = buffer.create(v669);
    buffer.copy(v680, 0, v668, 0, v669);
    return v680;
end;
v5.decode = function(v681) --[[ Line: 6051 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_24 (copy), v0 (copy), v2 (copy)
    local v682 = l_v5_24.new();
    local v683 = 0;
    while v683 < buffer.len(v681) do
        local v684 = nil;
        local v685 = nil;
        local v686, v687, v688 = v0.readTag(v681, v683);
        v684 = v686;
        v685 = v687;
        v683 = v688;
        if v685 == v0.wireTypes.varint then
            v686 = nil;
            v687, v688 = v0.readVarInt(v681, v683);
            v686 = v687;
            v683 = v688;
        elseif v685 == v0.wireTypes.lengthDelimited then
            if v684 == 1 then
                v686 = nil;
                v687, v688 = v0.readBuffer(v681, v683);
                v686 = v687;
                v683 = v688;
                v682.kind = {
                    type = "literal", 
                    value = buffer.tostring(v686)
                };
            elseif v684 == 2 then
                v686 = nil;
                v687, v688 = v0.readBuffer(v681, v683);
                v686 = v687;
                v683 = v688;
                v682.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v686)
                };
            elseif v684 == 3 then
                v686 = nil;
                v687, v688 = v0.readBuffer(v681, v683);
                v686 = v687;
                v683 = v688;
                v682.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v686)
                };
            elseif v684 == 4 then
                v686 = nil;
                v687, v688 = v0.readBuffer(v681, v683);
                v686 = v687;
                v683 = v688;
                v682.kind = {
                    type = "conditional", 
                    value = v2.ImageStringProp_ConditionalOptions.decode(v686)
                };
            else
                v686 = nil;
                v687, v688 = v0.readVarInt(v681, v683);
                v683 = v688 + v687;
            end;
        elseif v685 == v0.wireTypes.i32 then
            v686 = nil;
            v687, v688 = v0.readFixed32(v681, v683);
            v686 = v687;
            v683 = v688;
        elseif v685 == v0.wireTypes.i64 then
            v686 = nil;
            v687, v688 = v0.readFixed64(v681, v683);
            v686 = v687;
            v683 = v688;
        else
            error("Unsupported wire type: " .. v685);
        end;
    end;
    return v682;
end;
v5.jsonEncode = function(v689) --[[ Line: 6110 ]] --[[ Name: jsonEncode ]]
    local v690 = {};
    if v689.kind ~= nil then
        if v689.kind.type == "literal" then
            v690.literal = v689.kind.value;
            return v690;
        elseif v689.kind.type == "binding_path" then
            v690.bindingPath = v689.kind.value;
            return v690;
        elseif v689.kind.type == "format" then
            v690.format = v689.kind.value:jsonEncode();
            return v690;
        elseif v689.kind.type == "conditional" then
            v690.conditional = v689.kind.value:jsonEncode();
        end;
    end;
    return v690;
end;
v5.jsonDecode = function(v691) --[[ Line: 6128 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_24 (copy), v2 (copy)
    local v692 = l_v5_24.new();
    if v691.literal ~= nil then
        v692.kind = {
            type = "literal", 
            value = v691.literal
        };
    end;
    if v691.binding_path ~= nil then
        v692.kind = {
            type = "binding_path", 
            value = v691.binding_path
        };
    end;
    if v691.bindingPath ~= nil then
        v692.kind = {
            type = "binding_path", 
            value = v691.bindingPath
        };
    end;
    if v691.format ~= nil then
        v692.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v691.format)
        };
    end;
    if v691.conditional ~= nil then
        v692.kind = {
            type = "conditional", 
            value = v2.ImageStringProp_ConditionalOptions.jsonDecode(v691.conditional)
        };
    end;
    return v692;
end;
v5.descriptor = {
    name = "ImageStringProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
};
v2.ImageStringProp = v5;
v1.default:register(v2.ImageStringProp);
v5 = {};
v5.__index = v5;
local l_v5_25 = v5 --[[ copy: 5 -> 31 ]];
v5.new = function(v694) --[[ Line: 6171 ]] --[[ Name: new ]]
    -- upvalues: l_v5_25 (copy)
    return (setmetatable({
        condition = if not (v694 ~= nil) or v694.condition == nil then nil else v694.condition, 
        kind = if not (v694 ~= nil) or v694.kind == nil then nil else v694.kind
    }, l_v5_25));
end;
v5.encode = function(v695) --[[ Line: 6180 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v696 = buffer.create(0);
    local v697 = 0;
    if v695.condition ~= nil then
        local v698 = v695.condition:encode();
        local v699, v700 = v0.writeTag(v696, v697, 1, v0.wireTypes.lengthDelimited);
        v699, v700 = v0.writeBuffer(v699, v700, v698, buffer.len(v698));
        v696 = v699;
        v697 = v700;
    end;
    if v695.kind ~= nil then
        if v695.kind.type == "literal" then
            local v701, v702 = v0.writeTag(v696, v697, 2, v0.wireTypes.lengthDelimited);
            v701, v702 = v0.writeString(v701, v702, v695.kind.value);
            v696 = v701;
            v697 = v702;
        elseif v695.kind.type == "binding_path" then
            local v703, v704 = v0.writeTag(v696, v697, 3, v0.wireTypes.lengthDelimited);
            v703, v704 = v0.writeString(v703, v704, v695.kind.value);
            v696 = v703;
            v697 = v704;
        elseif v695.kind.type == "format" then
            local v705 = v695.kind.value:encode();
            local v706, v707 = v0.writeTag(v696, v697, 4, v0.wireTypes.lengthDelimited);
            v706, v707 = v0.writeBuffer(v706, v707, v705, buffer.len(v705));
            v696 = v706;
            v697 = v707;
        end;
    end;
    local v708 = buffer.create(v697);
    buffer.copy(v708, 0, v696, 0, v697);
    return v708;
end;
v5.decode = function(v709) --[[ Line: 6209 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_25 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v710 = l_v5_25.new();
    local v711 = 0;
    while v711 < buffer.len(v709) do
        local v712 = nil;
        local v713 = nil;
        local v714, v715, v716 = v0.readTag(v709, v711);
        v712 = v714;
        v713 = v715;
        v711 = v716;
        if v713 == v0.wireTypes.varint then
            v714 = nil;
            v715, v716 = v0.readVarInt(v709, v711);
            v714 = v715;
            v711 = v716;
        elseif v713 == v0.wireTypes.lengthDelimited then
            if v712 == 1 then
                v714 = nil;
                v715, v716 = v0.readBuffer(v709, v711);
                v714 = v715;
                v711 = v716;
                v710.condition = v4.PropCondition.decode(v714);
            elseif v712 == 2 then
                v714 = nil;
                v715, v716 = v0.readBuffer(v709, v711);
                v714 = v715;
                v711 = v716;
                v710.kind = {
                    type = "literal", 
                    value = buffer.tostring(v714)
                };
            elseif v712 == 3 then
                v714 = nil;
                v715, v716 = v0.readBuffer(v709, v711);
                v714 = v715;
                v711 = v716;
                v710.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v714)
                };
            elseif v712 == 4 then
                v714 = nil;
                v715, v716 = v0.readBuffer(v709, v711);
                v714 = v715;
                v711 = v716;
                v710.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v714)
                };
            else
                v714 = nil;
                v715, v716 = v0.readVarInt(v709, v711);
                v711 = v716 + v715;
            end;
        elseif v713 == v0.wireTypes.i32 then
            v714 = nil;
            v715, v716 = v0.readFixed32(v709, v711);
            v714 = v715;
            v711 = v716;
        elseif v713 == v0.wireTypes.i64 then
            v714 = nil;
            v715, v716 = v0.readFixed64(v709, v711);
            v714 = v715;
            v711 = v716;
        else
            error("Unsupported wire type: " .. v713);
        end;
    end;
    return v710;
end;
v5.jsonEncode = function(v717) --[[ Line: 6267 ]] --[[ Name: jsonEncode ]]
    local v718 = {};
    if v717.condition ~= nil then
        v718.condition = v717.condition:jsonEncode();
    end;
    if v717.kind ~= nil then
        if v717.kind.type == "literal" then
            v718.literal = v717.kind.value;
            return v718;
        elseif v717.kind.type == "binding_path" then
            v718.bindingPath = v717.kind.value;
            return v718;
        elseif v717.kind.type == "format" then
            v718.format = v717.kind.value:jsonEncode();
        end;
    end;
    return v718;
end;
v5.jsonDecode = function(v719) --[[ Line: 6287 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_25 (copy), v4 (copy), v2 (copy)
    local v720 = l_v5_25.new();
    if v719.condition ~= nil then
        v720.condition = v4.PropCondition.jsonDecode(v719.condition);
    end;
    if v719.literal ~= nil then
        v720.kind = {
            type = "literal", 
            value = v719.literal
        };
    end;
    if v719.binding_path ~= nil then
        v720.kind = {
            type = "binding_path", 
            value = v719.binding_path
        };
    end;
    if v719.bindingPath ~= nil then
        v720.kind = {
            type = "binding_path", 
            value = v719.bindingPath
        };
    end;
    if v719.format ~= nil then
        v720.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v719.format)
        };
    end;
    return v720;
end;
v5.descriptor = {
    name = "ImageStringProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ImageStringProp_ConditionalOption = v5;
v1.default:register(v2.ImageStringProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_26 = v5 --[[ copy: 5 -> 32 ]];
v5.new = function(v722) --[[ Line: 6330 ]] --[[ Name: new ]]
    -- upvalues: l_v5_26 (copy)
    return (setmetatable({
        options = if not (v722 ~= nil) or v722.options == nil then {} else v722.options
    }, l_v5_26));
end;
v5.encode = function(v723) --[[ Line: 6338 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v724 = buffer.create(0);
    local v725 = 0;
    if v723.options ~= nil and #v723.options > 0 then
        for _, v727 in v723.options do
            local v728 = v727:encode();
            local v729, v730 = v0.writeTag(v724, v725, 1, v0.wireTypes.lengthDelimited);
            v729, v730 = v0.writeBuffer(v729, v730, v728, buffer.len(v728));
            v724 = v729;
            v725 = v730;
        end;
    end;
    local v731 = buffer.create(v725);
    buffer.copy(v731, 0, v724, 0, v725);
    return v731;
end;
v5.decode = function(v732) --[[ Line: 6355 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_26 (copy), v0 (copy), v2 (copy)
    local v733 = l_v5_26.new();
    local v734 = 0;
    while v734 < buffer.len(v732) do
        local v735 = nil;
        local v736 = nil;
        local v737, v738, v739 = v0.readTag(v732, v734);
        v735 = v737;
        v736 = v738;
        v734 = v739;
        if v736 == v0.wireTypes.varint then
            v737 = nil;
            v738, v739 = v0.readVarInt(v732, v734);
            v737 = v738;
            v734 = v739;
        elseif v736 == v0.wireTypes.lengthDelimited then
            if v735 == 1 then
                v737 = nil;
                v738, v739 = v0.readBuffer(v732, v734);
                v737 = v738;
                v734 = v739;
                table.insert(v733.options, v2.ImageStringProp_ConditionalOption.decode(v737));
            else
                v737 = nil;
                v738, v739 = v0.readVarInt(v732, v734);
                v734 = v739 + v738;
            end;
        elseif v736 == v0.wireTypes.i32 then
            v737 = nil;
            v738, v739 = v0.readFixed32(v732, v734);
            v737 = v738;
            v734 = v739;
        elseif v736 == v0.wireTypes.i64 then
            v737 = nil;
            v738, v739 = v0.readFixed64(v732, v734);
            v737 = v738;
            v734 = v739;
        else
            error("Unsupported wire type: " .. v736);
        end;
    end;
    return v733;
end;
v5.jsonEncode = function(v740) --[[ Line: 6398 ]] --[[ Name: jsonEncode ]]
    local v741 = {};
    if v740.options ~= nil and #v740.options > 0 then
        local v742 = {};
        for _, v744 in v740.options do
            table.insert(v742, v744:jsonEncode());
        end;
        v741.options = v742;
    end;
    return v741;
end;
v5.jsonDecode = function(v745) --[[ Line: 6412 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_26 (copy), v2 (copy)
    local v746 = l_v5_26.new();
    if v745.options ~= nil then
        local v747 = {};
        for _, v749 in v745.options do
            table.insert(v747, v2.ImageStringProp_ConditionalOption.jsonDecode(v749));
        end;
        v746.options = v747;
    end;
    return v746;
end;
v5.descriptor = {
    name = "ImageStringProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ImageStringProp_ConditionalOptions = v5;
v1.default:register(v2.ImageStringProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_27 = v5 --[[ copy: 5 -> 33 ]];
v5.new = function(v751) --[[ Line: 6443 ]] --[[ Name: new ]]
    -- upvalues: l_v5_27 (copy)
    return (setmetatable({
        kind = if not (v751 ~= nil) or v751.kind == nil then nil else v751.kind
    }, l_v5_27));
end;
v5.encode = function(v752) --[[ Line: 6449 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v753 = buffer.create(0);
    local v754 = 0;
    if v752.kind ~= nil then
        if v752.kind.type == "literal" then
            local v755, v756 = v0.writeTag(v753, v754, 1, v0.wireTypes.lengthDelimited);
            v755, v756 = v0.writeString(v755, v756, v752.kind.value);
            v753 = v755;
            v754 = v756;
        elseif v752.kind.type == "binding_path" then
            local v757, v758 = v0.writeTag(v753, v754, 2, v0.wireTypes.lengthDelimited);
            v757, v758 = v0.writeString(v757, v758, v752.kind.value);
            v753 = v757;
            v754 = v758;
        elseif v752.kind.type == "format" then
            local v759 = v752.kind.value:encode();
            local v760, v761 = v0.writeTag(v753, v754, 3, v0.wireTypes.lengthDelimited);
            v760, v761 = v0.writeBuffer(v760, v761, v759, buffer.len(v759));
            v753 = v760;
            v754 = v761;
        elseif v752.kind.type == "conditional" then
            local v762 = v752.kind.value:encode();
            local v763, v764 = v0.writeTag(v753, v754, 4, v0.wireTypes.lengthDelimited);
            v763, v764 = v0.writeBuffer(v763, v764, v762, buffer.len(v762));
            v753 = v763;
            v754 = v764;
        end;
    end;
    local v765 = buffer.create(v754);
    buffer.copy(v765, 0, v753, 0, v754);
    return v765;
end;
v5.decode = function(v766) --[[ Line: 6476 ]] --[[ Name: decode ]]
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
                    value = v2.ImageSetProp_ConditionalOptions.decode(v771)
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
v5.jsonEncode = function(v774) --[[ Line: 6534 ]] --[[ Name: jsonEncode ]]
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
        end;
    end;
    return v775;
end;
v5.jsonDecode = function(v776) --[[ Line: 6552 ]] --[[ Name: jsonDecode ]]
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
            value = v2.ImageSetProp_ConditionalOptions.jsonDecode(v776.conditional)
        };
    end;
    return v777;
end;
v5.descriptor = {
    name = "ImageSetProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
};
v2.ImageSetProp = v5;
v1.default:register(v2.ImageSetProp);
v5 = {};
v5.__index = v5;
local l_v5_28 = v5 --[[ copy: 5 -> 34 ]];
v5.new = function(v779) --[[ Line: 6593 ]] --[[ Name: new ]]
    -- upvalues: l_v5_28 (copy)
    return (setmetatable({
        condition = if not (v779 ~= nil) or v779.condition == nil then nil else v779.condition, 
        kind = if not (v779 ~= nil) or v779.kind == nil then nil else v779.kind
    }, l_v5_28));
end;
v5.encode = function(v780) --[[ Line: 6602 ]] --[[ Name: encode ]]
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
        end;
    end;
    local v793 = buffer.create(v782);
    buffer.copy(v793, 0, v781, 0, v782);
    return v793;
end;
v5.decode = function(v794) --[[ Line: 6631 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_28 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v795 = l_v5_28.new();
    local v796 = 0;
    while v796 < buffer.len(v794) do
        local v797 = nil;
        local v798 = nil;
        local v799, v800, v801 = v0.readTag(v794, v796);
        v797 = v799;
        v798 = v800;
        v796 = v801;
        if v798 == v0.wireTypes.varint then
            v799 = nil;
            v800, v801 = v0.readVarInt(v794, v796);
            v799 = v800;
            v796 = v801;
        elseif v798 == v0.wireTypes.lengthDelimited then
            if v797 == 1 then
                v799 = nil;
                v800, v801 = v0.readBuffer(v794, v796);
                v799 = v800;
                v796 = v801;
                v795.condition = v4.PropCondition.decode(v799);
            elseif v797 == 2 then
                v799 = nil;
                v800, v801 = v0.readBuffer(v794, v796);
                v799 = v800;
                v796 = v801;
                v795.kind = {
                    type = "literal", 
                    value = buffer.tostring(v799)
                };
            elseif v797 == 3 then
                v799 = nil;
                v800, v801 = v0.readBuffer(v794, v796);
                v799 = v800;
                v796 = v801;
                v795.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v799)
                };
            elseif v797 == 4 then
                v799 = nil;
                v800, v801 = v0.readBuffer(v794, v796);
                v799 = v800;
                v796 = v801;
                v795.kind = {
                    type = "format", 
                    value = v2.StringFormat.decode(v799)
                };
            else
                v799 = nil;
                v800, v801 = v0.readVarInt(v794, v796);
                v796 = v801 + v800;
            end;
        elseif v798 == v0.wireTypes.i32 then
            v799 = nil;
            v800, v801 = v0.readFixed32(v794, v796);
            v799 = v800;
            v796 = v801;
        elseif v798 == v0.wireTypes.i64 then
            v799 = nil;
            v800, v801 = v0.readFixed64(v794, v796);
            v799 = v800;
            v796 = v801;
        else
            error("Unsupported wire type: " .. v798);
        end;
    end;
    return v795;
end;
v5.jsonEncode = function(v802) --[[ Line: 6689 ]] --[[ Name: jsonEncode ]]
    local v803 = {};
    if v802.condition ~= nil then
        v803.condition = v802.condition:jsonEncode();
    end;
    if v802.kind ~= nil then
        if v802.kind.type == "literal" then
            v803.literal = v802.kind.value;
            return v803;
        elseif v802.kind.type == "binding_path" then
            v803.bindingPath = v802.kind.value;
            return v803;
        elseif v802.kind.type == "format" then
            v803.format = v802.kind.value:jsonEncode();
        end;
    end;
    return v803;
end;
v5.jsonDecode = function(v804) --[[ Line: 6709 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_28 (copy), v4 (copy), v2 (copy)
    local v805 = l_v5_28.new();
    if v804.condition ~= nil then
        v805.condition = v4.PropCondition.jsonDecode(v804.condition);
    end;
    if v804.literal ~= nil then
        v805.kind = {
            type = "literal", 
            value = v804.literal
        };
    end;
    if v804.binding_path ~= nil then
        v805.kind = {
            type = "binding_path", 
            value = v804.binding_path
        };
    end;
    if v804.bindingPath ~= nil then
        v805.kind = {
            type = "binding_path", 
            value = v804.bindingPath
        };
    end;
    if v804.format ~= nil then
        v805.kind = {
            type = "format", 
            value = v2.StringFormat.jsonDecode(v804.format)
        };
    end;
    return v805;
end;
v5.descriptor = {
    name = "ImageSetProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ImageSetProp_ConditionalOption = v5;
v1.default:register(v2.ImageSetProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_29 = v5 --[[ copy: 5 -> 35 ]];
v5.new = function(v807) --[[ Line: 6750 ]] --[[ Name: new ]]
    -- upvalues: l_v5_29 (copy)
    return (setmetatable({
        options = if not (v807 ~= nil) or v807.options == nil then {} else v807.options
    }, l_v5_29));
end;
v5.encode = function(v808) --[[ Line: 6758 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v809 = buffer.create(0);
    local v810 = 0;
    if v808.options ~= nil and #v808.options > 0 then
        for _, v812 in v808.options do
            local v813 = v812:encode();
            local v814, v815 = v0.writeTag(v809, v810, 1, v0.wireTypes.lengthDelimited);
            v814, v815 = v0.writeBuffer(v814, v815, v813, buffer.len(v813));
            v809 = v814;
            v810 = v815;
        end;
    end;
    local v816 = buffer.create(v810);
    buffer.copy(v816, 0, v809, 0, v810);
    return v816;
end;
v5.decode = function(v817) --[[ Line: 6775 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_29 (copy), v0 (copy), v2 (copy)
    local v818 = l_v5_29.new();
    local v819 = 0;
    while v819 < buffer.len(v817) do
        local v820 = nil;
        local v821 = nil;
        local v822, v823, v824 = v0.readTag(v817, v819);
        v820 = v822;
        v821 = v823;
        v819 = v824;
        if v821 == v0.wireTypes.varint then
            v822 = nil;
            v823, v824 = v0.readVarInt(v817, v819);
            v822 = v823;
            v819 = v824;
        elseif v821 == v0.wireTypes.lengthDelimited then
            if v820 == 1 then
                v822 = nil;
                v823, v824 = v0.readBuffer(v817, v819);
                v822 = v823;
                v819 = v824;
                table.insert(v818.options, v2.ImageSetProp_ConditionalOption.decode(v822));
            else
                v822 = nil;
                v823, v824 = v0.readVarInt(v817, v819);
                v819 = v824 + v823;
            end;
        elseif v821 == v0.wireTypes.i32 then
            v822 = nil;
            v823, v824 = v0.readFixed32(v817, v819);
            v822 = v823;
            v819 = v824;
        elseif v821 == v0.wireTypes.i64 then
            v822 = nil;
            v823, v824 = v0.readFixed64(v817, v819);
            v822 = v823;
            v819 = v824;
        else
            error("Unsupported wire type: " .. v821);
        end;
    end;
    return v818;
end;
v5.jsonEncode = function(v825) --[[ Line: 6818 ]] --[[ Name: jsonEncode ]]
    local v826 = {};
    if v825.options ~= nil and #v825.options > 0 then
        local v827 = {};
        for _, v829 in v825.options do
            table.insert(v827, v829:jsonEncode());
        end;
        v826.options = v827;
    end;
    return v826;
end;
v5.jsonDecode = function(v830) --[[ Line: 6832 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_29 (copy), v2 (copy)
    local v831 = l_v5_29.new();
    if v830.options ~= nil then
        local v832 = {};
        for _, v834 in v830.options do
            table.insert(v832, v2.ImageSetProp_ConditionalOption.jsonDecode(v834));
        end;
        v831.options = v832;
    end;
    return v831;
end;
v5.descriptor = {
    name = "ImageSetProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ImageSetProp_ConditionalOptions = v5;
v1.default:register(v2.ImageSetProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_30 = v5 --[[ copy: 5 -> 36 ]];
v5.new = function(v836) --[[ Line: 6861 ]] --[[ Name: new ]]
    -- upvalues: l_v5_30 (copy)
    return (setmetatable({
        kind = if not (v836 ~= nil) or v836.kind == nil then nil else v836.kind
    }, l_v5_30));
end;
v5.encode = function(v837) --[[ Line: 6867 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v838 = buffer.create(0);
    local v839 = 0;
    if v837.kind ~= nil then
        if v837.kind.type == "literal" then
            local v840, v841 = v0.writeTag(v838, v839, 1, v0.wireTypes.lengthDelimited);
            v840, v841 = v0.writeString(v840, v841, v837.kind.value);
            v838 = v840;
            v839 = v841;
        elseif v837.kind.type == "token" then
            local v842, v843 = v0.writeTag(v838, v839, 2, v0.wireTypes.lengthDelimited);
            v842, v843 = v0.writeString(v842, v843, v837.kind.value);
            v838 = v842;
            v839 = v843;
        elseif v837.kind.type == "conditional" then
            local v844 = v837.kind.value:encode();
            local v845, v846 = v0.writeTag(v838, v839, 3, v0.wireTypes.lengthDelimited);
            v845, v846 = v0.writeBuffer(v845, v846, v844, buffer.len(v844));
            v838 = v845;
            v839 = v846;
        elseif v837.kind.type == "binding_path" then
            local v847, v848 = v0.writeTag(v838, v839, 4, v0.wireTypes.lengthDelimited);
            v847, v848 = v0.writeString(v847, v848, v837.kind.value);
            v838 = v847;
            v839 = v848;
        end;
    end;
    local v849 = buffer.create(v839);
    buffer.copy(v849, 0, v838, 0, v839);
    return v849;
end;
v5.decode = function(v850) --[[ Line: 6893 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_30 (copy), v0 (copy), v2 (copy)
    local v851 = l_v5_30.new();
    local v852 = 0;
    while v852 < buffer.len(v850) do
        local v853 = nil;
        local v854 = nil;
        local v855, v856, v857 = v0.readTag(v850, v852);
        v853 = v855;
        v854 = v856;
        v852 = v857;
        if v854 == v0.wireTypes.varint then
            v855 = nil;
            v856, v857 = v0.readVarInt(v850, v852);
            v855 = v856;
            v852 = v857;
        elseif v854 == v0.wireTypes.lengthDelimited then
            if v853 == 1 then
                v855 = nil;
                v856, v857 = v0.readBuffer(v850, v852);
                v855 = v856;
                v852 = v857;
                v851.kind = {
                    type = "literal", 
                    value = buffer.tostring(v855)
                };
            elseif v853 == 2 then
                v855 = nil;
                v856, v857 = v0.readBuffer(v850, v852);
                v855 = v856;
                v852 = v857;
                v851.kind = {
                    type = "token", 
                    value = buffer.tostring(v855)
                };
            elseif v853 == 3 then
                v855 = nil;
                v856, v857 = v0.readBuffer(v850, v852);
                v855 = v856;
                v852 = v857;
                v851.kind = {
                    type = "conditional", 
                    value = v2.ColorProp_ConditionalOptions.decode(v855)
                };
            elseif v853 == 4 then
                v855 = nil;
                v856, v857 = v0.readBuffer(v850, v852);
                v855 = v856;
                v852 = v857;
                v851.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v855)
                };
            else
                v855 = nil;
                v856, v857 = v0.readVarInt(v850, v852);
                v852 = v857 + v856;
            end;
        elseif v854 == v0.wireTypes.i32 then
            v855 = nil;
            v856, v857 = v0.readFixed32(v850, v852);
            v855 = v856;
            v852 = v857;
        elseif v854 == v0.wireTypes.i64 then
            v855 = nil;
            v856, v857 = v0.readFixed64(v850, v852);
            v855 = v856;
            v852 = v857;
        else
            error("Unsupported wire type: " .. v854);
        end;
    end;
    return v851;
end;
v5.jsonEncode = function(v858) --[[ Line: 6951 ]] --[[ Name: jsonEncode ]]
    local v859 = {};
    if v858.kind ~= nil then
        if v858.kind.type == "literal" then
            v859.literal = v858.kind.value;
            return v859;
        elseif v858.kind.type == "token" then
            v859.token = v858.kind.value;
            return v859;
        elseif v858.kind.type == "conditional" then
            v859.conditional = v858.kind.value:jsonEncode();
            return v859;
        elseif v858.kind.type == "binding_path" then
            v859.bindingPath = v858.kind.value;
        end;
    end;
    return v859;
end;
v5.jsonDecode = function(v860) --[[ Line: 6969 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_30 (copy), v2 (copy)
    local v861 = l_v5_30.new();
    if v860.literal ~= nil then
        v861.kind = {
            type = "literal", 
            value = v860.literal
        };
    end;
    if v860.token ~= nil then
        v861.kind = {
            type = "token", 
            value = v860.token
        };
    end;
    if v860.conditional ~= nil then
        v861.kind = {
            type = "conditional", 
            value = v2.ColorProp_ConditionalOptions.jsonDecode(v860.conditional)
        };
    end;
    if v860.binding_path ~= nil then
        v861.kind = {
            type = "binding_path", 
            value = v860.binding_path
        };
    end;
    if v860.bindingPath ~= nil then
        v861.kind = {
            type = "binding_path", 
            value = v860.bindingPath
        };
    end;
    return v861;
end;
v5.descriptor = {
    name = "ColorProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
};
v2.ColorProp = v5;
v1.default:register(v2.ColorProp);
v5 = {};
v5.__index = v5;
local l_v5_31 = v5 --[[ copy: 5 -> 37 ]];
v5.new = function(v863) --[[ Line: 7010 ]] --[[ Name: new ]]
    -- upvalues: l_v5_31 (copy)
    return (setmetatable({
        condition = if not (v863 ~= nil) or v863.condition == nil then nil else v863.condition, 
        kind = if not (v863 ~= nil) or v863.kind == nil then nil else v863.kind
    }, l_v5_31));
end;
v5.encode = function(v864) --[[ Line: 7019 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v865 = buffer.create(0);
    local v866 = 0;
    if v864.condition ~= nil then
        local v867 = v864.condition:encode();
        local v868, v869 = v0.writeTag(v865, v866, 1, v0.wireTypes.lengthDelimited);
        v868, v869 = v0.writeBuffer(v868, v869, v867, buffer.len(v867));
        v865 = v868;
        v866 = v869;
    end;
    if v864.kind ~= nil then
        if v864.kind.type == "literal" then
            local v870, v871 = v0.writeTag(v865, v866, 2, v0.wireTypes.lengthDelimited);
            v870, v871 = v0.writeString(v870, v871, v864.kind.value);
            v865 = v870;
            v866 = v871;
        elseif v864.kind.type == "token" then
            local v872, v873 = v0.writeTag(v865, v866, 3, v0.wireTypes.lengthDelimited);
            v872, v873 = v0.writeString(v872, v873, v864.kind.value);
            v865 = v872;
            v866 = v873;
        elseif v864.kind.type == "binding_path" then
            local v874, v875 = v0.writeTag(v865, v866, 4, v0.wireTypes.lengthDelimited);
            v874, v875 = v0.writeString(v874, v875, v864.kind.value);
            v865 = v874;
            v866 = v875;
        end;
    end;
    local v876 = buffer.create(v866);
    buffer.copy(v876, 0, v865, 0, v866);
    return v876;
end;
v5.decode = function(v877) --[[ Line: 7047 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_31 (copy), v0 (copy), v4 (copy)
    local v878 = l_v5_31.new();
    local v879 = 0;
    while v879 < buffer.len(v877) do
        local v880 = nil;
        local v881 = nil;
        local v882, v883, v884 = v0.readTag(v877, v879);
        v880 = v882;
        v881 = v883;
        v879 = v884;
        if v881 == v0.wireTypes.varint then
            v882 = nil;
            v883, v884 = v0.readVarInt(v877, v879);
            v882 = v883;
            v879 = v884;
        elseif v881 == v0.wireTypes.lengthDelimited then
            if v880 == 1 then
                v882 = nil;
                v883, v884 = v0.readBuffer(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.condition = v4.PropCondition.decode(v882);
            elseif v880 == 2 then
                v882 = nil;
                v883, v884 = v0.readBuffer(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.kind = {
                    type = "literal", 
                    value = buffer.tostring(v882)
                };
            elseif v880 == 3 then
                v882 = nil;
                v883, v884 = v0.readBuffer(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.kind = {
                    type = "token", 
                    value = buffer.tostring(v882)
                };
            elseif v880 == 4 then
                v882 = nil;
                v883, v884 = v0.readBuffer(v877, v879);
                v882 = v883;
                v879 = v884;
                v878.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v882)
                };
            else
                v882 = nil;
                v883, v884 = v0.readVarInt(v877, v879);
                v879 = v884 + v883;
            end;
        elseif v881 == v0.wireTypes.i32 then
            v882 = nil;
            v883, v884 = v0.readFixed32(v877, v879);
            v882 = v883;
            v879 = v884;
        elseif v881 == v0.wireTypes.i64 then
            v882 = nil;
            v883, v884 = v0.readFixed64(v877, v879);
            v882 = v883;
            v879 = v884;
        else
            error("Unsupported wire type: " .. v881);
        end;
    end;
    return v878;
end;
v5.jsonEncode = function(v885) --[[ Line: 7105 ]] --[[ Name: jsonEncode ]]
    local v886 = {};
    if v885.condition ~= nil then
        v886.condition = v885.condition:jsonEncode();
    end;
    if v885.kind ~= nil then
        if v885.kind.type == "literal" then
            v886.literal = v885.kind.value;
            return v886;
        elseif v885.kind.type == "token" then
            v886.token = v885.kind.value;
            return v886;
        elseif v885.kind.type == "binding_path" then
            v886.bindingPath = v885.kind.value;
        end;
    end;
    return v886;
end;
v5.jsonDecode = function(v887) --[[ Line: 7125 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_31 (copy), v4 (copy)
    local v888 = l_v5_31.new();
    if v887.condition ~= nil then
        v888.condition = v4.PropCondition.jsonDecode(v887.condition);
    end;
    if v887.literal ~= nil then
        v888.kind = {
            type = "literal", 
            value = v887.literal
        };
    end;
    if v887.token ~= nil then
        v888.kind = {
            type = "token", 
            value = v887.token
        };
    end;
    if v887.binding_path ~= nil then
        v888.kind = {
            type = "binding_path", 
            value = v887.binding_path
        };
    end;
    if v887.bindingPath ~= nil then
        v888.kind = {
            type = "binding_path", 
            value = v887.bindingPath
        };
    end;
    return v888;
end;
v5.descriptor = {
    name = "ColorProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ColorProp_ConditionalOption = v5;
v1.default:register(v2.ColorProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_32 = v5 --[[ copy: 5 -> 38 ]];
v5.new = function(v890) --[[ Line: 7166 ]] --[[ Name: new ]]
    -- upvalues: l_v5_32 (copy)
    return (setmetatable({
        options = if not (v890 ~= nil) or v890.options == nil then {} else v890.options
    }, l_v5_32));
end;
v5.encode = function(v891) --[[ Line: 7174 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v892 = buffer.create(0);
    local v893 = 0;
    if v891.options ~= nil and #v891.options > 0 then
        for _, v895 in v891.options do
            local v896 = v895:encode();
            local v897, v898 = v0.writeTag(v892, v893, 1, v0.wireTypes.lengthDelimited);
            v897, v898 = v0.writeBuffer(v897, v898, v896, buffer.len(v896));
            v892 = v897;
            v893 = v898;
        end;
    end;
    local v899 = buffer.create(v893);
    buffer.copy(v899, 0, v892, 0, v893);
    return v899;
end;
v5.decode = function(v900) --[[ Line: 7191 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_32 (copy), v0 (copy), v2 (copy)
    local v901 = l_v5_32.new();
    local v902 = 0;
    while v902 < buffer.len(v900) do
        local v903 = nil;
        local v904 = nil;
        local v905, v906, v907 = v0.readTag(v900, v902);
        v903 = v905;
        v904 = v906;
        v902 = v907;
        if v904 == v0.wireTypes.varint then
            v905 = nil;
            v906, v907 = v0.readVarInt(v900, v902);
            v905 = v906;
            v902 = v907;
        elseif v904 == v0.wireTypes.lengthDelimited then
            if v903 == 1 then
                v905 = nil;
                v906, v907 = v0.readBuffer(v900, v902);
                v905 = v906;
                v902 = v907;
                table.insert(v901.options, v2.ColorProp_ConditionalOption.decode(v905));
            else
                v905 = nil;
                v906, v907 = v0.readVarInt(v900, v902);
                v902 = v907 + v906;
            end;
        elseif v904 == v0.wireTypes.i32 then
            v905 = nil;
            v906, v907 = v0.readFixed32(v900, v902);
            v905 = v906;
            v902 = v907;
        elseif v904 == v0.wireTypes.i64 then
            v905 = nil;
            v906, v907 = v0.readFixed64(v900, v902);
            v905 = v906;
            v902 = v907;
        else
            error("Unsupported wire type: " .. v904);
        end;
    end;
    return v901;
end;
v5.jsonEncode = function(v908) --[[ Line: 7234 ]] --[[ Name: jsonEncode ]]
    local v909 = {};
    if v908.options ~= nil and #v908.options > 0 then
        local v910 = {};
        for _, v912 in v908.options do
            table.insert(v910, v912:jsonEncode());
        end;
        v909.options = v910;
    end;
    return v909;
end;
v5.jsonDecode = function(v913) --[[ Line: 7248 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_32 (copy), v2 (copy)
    local v914 = l_v5_32.new();
    if v913.options ~= nil then
        local v915 = {};
        for _, v917 in v913.options do
            table.insert(v915, v2.ColorProp_ConditionalOption.jsonDecode(v917));
        end;
        v914.options = v915;
    end;
    return v914;
end;
v5.descriptor = {
    name = "ColorProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ColorProp_ConditionalOptions = v5;
v1.default:register(v2.ColorProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_33 = v5 --[[ copy: 5 -> 39 ]];
v5.new = function(v919) --[[ Line: 7277 ]] --[[ Name: new ]]
    -- upvalues: l_v5_33 (copy)
    return (setmetatable({
        kind = if not (v919 ~= nil) or v919.kind == nil then nil else v919.kind
    }, l_v5_33));
end;
v5.encode = function(v920) --[[ Line: 7283 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v921 = buffer.create(0);
    local v922 = 0;
    if v920.kind ~= nil then
        if v920.kind.type == "token" then
            local v923, v924 = v0.writeTag(v921, v922, 1, v0.wireTypes.lengthDelimited);
            v923, v924 = v0.writeString(v923, v924, v920.kind.value);
            v921 = v923;
            v922 = v924;
        elseif v920.kind.type == "conditional" then
            local v925 = v920.kind.value:encode();
            local v926, v927 = v0.writeTag(v921, v922, 2, v0.wireTypes.lengthDelimited);
            v926, v927 = v0.writeBuffer(v926, v927, v925, buffer.len(v925));
            v921 = v926;
            v922 = v927;
        end;
    end;
    local v928 = buffer.create(v922);
    buffer.copy(v928, 0, v921, 0, v922);
    return v928;
end;
v5.decode = function(v929) --[[ Line: 7303 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_33 (copy), v0 (copy), v2 (copy)
    local v930 = l_v5_33.new();
    local v931 = 0;
    while v931 < buffer.len(v929) do
        local v932 = nil;
        local v933 = nil;
        local v934, v935, v936 = v0.readTag(v929, v931);
        v932 = v934;
        v933 = v935;
        v931 = v936;
        if v933 == v0.wireTypes.varint then
            v934 = nil;
            v935, v936 = v0.readVarInt(v929, v931);
            v934 = v935;
            v931 = v936;
        elseif v933 == v0.wireTypes.lengthDelimited then
            if v932 == 1 then
                v934 = nil;
                v935, v936 = v0.readBuffer(v929, v931);
                v934 = v935;
                v931 = v936;
                v930.kind = {
                    type = "token", 
                    value = buffer.tostring(v934)
                };
            elseif v932 == 2 then
                v934 = nil;
                v935, v936 = v0.readBuffer(v929, v931);
                v934 = v935;
                v931 = v936;
                v930.kind = {
                    type = "conditional", 
                    value = v2.TypographyProp_ConditionalOptions.decode(v934)
                };
            else
                v934 = nil;
                v935, v936 = v0.readVarInt(v929, v931);
                v931 = v936 + v935;
            end;
        elseif v933 == v0.wireTypes.i32 then
            v934 = nil;
            v935, v936 = v0.readFixed32(v929, v931);
            v934 = v935;
            v931 = v936;
        elseif v933 == v0.wireTypes.i64 then
            v934 = nil;
            v935, v936 = v0.readFixed64(v929, v931);
            v934 = v935;
            v931 = v936;
        else
            error("Unsupported wire type: " .. v933);
        end;
    end;
    return v930;
end;
v5.jsonEncode = function(v937) --[[ Line: 7352 ]] --[[ Name: jsonEncode ]]
    local v938 = {};
    if v937.kind ~= nil then
        if v937.kind.type == "token" then
            v938.token = v937.kind.value;
            return v938;
        elseif v937.kind.type == "conditional" then
            v938.conditional = v937.kind.value:jsonEncode();
        end;
    end;
    return v938;
end;
v5.jsonDecode = function(v939) --[[ Line: 7366 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_33 (copy), v2 (copy)
    local v940 = l_v5_33.new();
    if v939.token ~= nil then
        v940.kind = {
            type = "token", 
            value = v939.token
        };
    end;
    if v939.conditional ~= nil then
        v940.kind = {
            type = "conditional", 
            value = v2.TypographyProp_ConditionalOptions.jsonDecode(v939.conditional)
        };
    end;
    return v940;
end;
v5.descriptor = {
    name = "TypographyProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
};
v2.TypographyProp = v5;
v1.default:register(v2.TypographyProp);
v5 = {};
v5.__index = v5;
local l_v5_34 = v5 --[[ copy: 5 -> 40 ]];
v5.new = function(v942) --[[ Line: 7397 ]] --[[ Name: new ]]
    -- upvalues: l_v5_34 (copy)
    return (setmetatable({
        condition = if not (v942 ~= nil) or v942.condition == nil then nil else v942.condition, 
        kind = if not (v942 ~= nil) or v942.kind == nil then nil else v942.kind
    }, l_v5_34));
end;
v5.encode = function(v943) --[[ Line: 7406 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v944 = buffer.create(0);
    local v945 = 0;
    if v943.condition ~= nil then
        local v946 = v943.condition:encode();
        local v947, v948 = v0.writeTag(v944, v945, 1, v0.wireTypes.lengthDelimited);
        v947, v948 = v0.writeBuffer(v947, v948, v946, buffer.len(v946));
        v944 = v947;
        v945 = v948;
    end;
    if v943.kind ~= nil and v943.kind.type == "token" then
        local v949, v950 = v0.writeTag(v944, v945, 2, v0.wireTypes.lengthDelimited);
        v949, v950 = v0.writeString(v949, v950, v943.kind.value);
        v944 = v949;
        v945 = v950;
    end;
    local v951 = buffer.create(v945);
    buffer.copy(v951, 0, v944, 0, v945);
    return v951;
end;
v5.decode = function(v952) --[[ Line: 7428 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_34 (copy), v0 (copy), v4 (copy)
    local v953 = l_v5_34.new();
    local v954 = 0;
    while v954 < buffer.len(v952) do
        local v955 = nil;
        local v956 = nil;
        local v957, v958, v959 = v0.readTag(v952, v954);
        v955 = v957;
        v956 = v958;
        v954 = v959;
        if v956 == v0.wireTypes.varint then
            v957 = nil;
            v958, v959 = v0.readVarInt(v952, v954);
            v957 = v958;
            v954 = v959;
        elseif v956 == v0.wireTypes.lengthDelimited then
            if v955 == 1 then
                v957 = nil;
                v958, v959 = v0.readBuffer(v952, v954);
                v957 = v958;
                v954 = v959;
                v953.condition = v4.PropCondition.decode(v957);
            elseif v955 == 2 then
                v957 = nil;
                v958, v959 = v0.readBuffer(v952, v954);
                v957 = v958;
                v954 = v959;
                v953.kind = {
                    type = "token", 
                    value = buffer.tostring(v957)
                };
            else
                v957 = nil;
                v958, v959 = v0.readVarInt(v952, v954);
                v954 = v959 + v958;
            end;
        elseif v956 == v0.wireTypes.i32 then
            v957 = nil;
            v958, v959 = v0.readFixed32(v952, v954);
            v957 = v958;
            v954 = v959;
        elseif v956 == v0.wireTypes.i64 then
            v957 = nil;
            v958, v959 = v0.readFixed64(v952, v954);
            v957 = v958;
            v954 = v959;
        else
            error("Unsupported wire type: " .. v956);
        end;
    end;
    return v953;
end;
v5.jsonEncode = function(v960) --[[ Line: 7476 ]] --[[ Name: jsonEncode ]]
    local v961 = {};
    if v960.condition ~= nil then
        v961.condition = v960.condition:jsonEncode();
    end;
    if v960.kind ~= nil and v960.kind.type == "token" then
        v961.token = v960.kind.value;
    end;
    return v961;
end;
v5.jsonDecode = function(v962) --[[ Line: 7492 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_34 (copy), v4 (copy)
    local v963 = l_v5_34.new();
    if v962.condition ~= nil then
        v963.condition = v4.PropCondition.jsonDecode(v962.condition);
    end;
    if v962.token ~= nil then
        v963.kind = {
            type = "token", 
            value = v962.token
        };
    end;
    return v963;
end;
v5.descriptor = {
    name = "TypographyProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TypographyProp_ConditionalOption = v5;
v1.default:register(v2.TypographyProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_35 = v5 --[[ copy: 5 -> 41 ]];
v5.new = function(v965) --[[ Line: 7523 ]] --[[ Name: new ]]
    -- upvalues: l_v5_35 (copy)
    return (setmetatable({
        options = if not (v965 ~= nil) or v965.options == nil then {} else v965.options
    }, l_v5_35));
end;
v5.encode = function(v966) --[[ Line: 7531 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v967 = buffer.create(0);
    local v968 = 0;
    if v966.options ~= nil and #v966.options > 0 then
        for _, v970 in v966.options do
            local v971 = v970:encode();
            local v972, v973 = v0.writeTag(v967, v968, 1, v0.wireTypes.lengthDelimited);
            v972, v973 = v0.writeBuffer(v972, v973, v971, buffer.len(v971));
            v967 = v972;
            v968 = v973;
        end;
    end;
    local v974 = buffer.create(v968);
    buffer.copy(v974, 0, v967, 0, v968);
    return v974;
end;
v5.decode = function(v975) --[[ Line: 7548 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_35 (copy), v0 (copy), v2 (copy)
    local v976 = l_v5_35.new();
    local v977 = 0;
    while v977 < buffer.len(v975) do
        local v978 = nil;
        local v979 = nil;
        local v980, v981, v982 = v0.readTag(v975, v977);
        v978 = v980;
        v979 = v981;
        v977 = v982;
        if v979 == v0.wireTypes.varint then
            v980 = nil;
            v981, v982 = v0.readVarInt(v975, v977);
            v980 = v981;
            v977 = v982;
        elseif v979 == v0.wireTypes.lengthDelimited then
            if v978 == 1 then
                v980 = nil;
                v981, v982 = v0.readBuffer(v975, v977);
                v980 = v981;
                v977 = v982;
                table.insert(v976.options, v2.TypographyProp_ConditionalOption.decode(v980));
            else
                v980 = nil;
                v981, v982 = v0.readVarInt(v975, v977);
                v977 = v982 + v981;
            end;
        elseif v979 == v0.wireTypes.i32 then
            v980 = nil;
            v981, v982 = v0.readFixed32(v975, v977);
            v980 = v981;
            v977 = v982;
        elseif v979 == v0.wireTypes.i64 then
            v980 = nil;
            v981, v982 = v0.readFixed64(v975, v977);
            v980 = v981;
            v977 = v982;
        else
            error("Unsupported wire type: " .. v979);
        end;
    end;
    return v976;
end;
v5.jsonEncode = function(v983) --[[ Line: 7591 ]] --[[ Name: jsonEncode ]]
    local v984 = {};
    if v983.options ~= nil and #v983.options > 0 then
        local v985 = {};
        for _, v987 in v983.options do
            table.insert(v985, v987:jsonEncode());
        end;
        v984.options = v985;
    end;
    return v984;
end;
v5.jsonDecode = function(v988) --[[ Line: 7605 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_35 (copy), v2 (copy)
    local v989 = l_v5_35.new();
    if v988.options ~= nil then
        local v990 = {};
        for _, v992 in v988.options do
            table.insert(v990, v2.TypographyProp_ConditionalOption.jsonDecode(v992));
        end;
        v989.options = v990;
    end;
    return v989;
end;
v5.descriptor = {
    name = "TypographyProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TypographyProp_ConditionalOptions = v5;
v1.default:register(v2.TypographyProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_36 = v5 --[[ copy: 5 -> 42 ]];
v5.new = function(v994) --[[ Line: 7636 ]] --[[ Name: new ]]
    -- upvalues: l_v5_36 (copy)
    return (setmetatable({
        kind = if not (v994 ~= nil) or v994.kind == nil then nil else v994.kind
    }, l_v5_36));
end;
v5.encode = function(v995) --[[ Line: 7642 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v996 = buffer.create(0);
    local v997 = 0;
    if v995.kind ~= nil then
        if v995.kind.type == "token" then
            local v998, v999 = v0.writeTag(v996, v997, 1, v0.wireTypes.lengthDelimited);
            v998, v999 = v0.writeString(v998, v999, v995.kind.value);
            v996 = v998;
            v997 = v999;
        elseif v995.kind.type == "conditional" then
            local v1000 = v995.kind.value:encode();
            local v1001, v1002 = v0.writeTag(v996, v997, 2, v0.wireTypes.lengthDelimited);
            v1001, v1002 = v0.writeBuffer(v1001, v1002, v1000, buffer.len(v1000));
            v996 = v1001;
            v997 = v1002;
        end;
    end;
    local v1003 = buffer.create(v997);
    buffer.copy(v1003, 0, v996, 0, v997);
    return v1003;
end;
v5.decode = function(v1004) --[[ Line: 7662 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_36 (copy), v0 (copy), v2 (copy)
    local v1005 = l_v5_36.new();
    local v1006 = 0;
    while v1006 < buffer.len(v1004) do
        local v1007 = nil;
        local v1008 = nil;
        local v1009, v1010, v1011 = v0.readTag(v1004, v1006);
        v1007 = v1009;
        v1008 = v1010;
        v1006 = v1011;
        if v1008 == v0.wireTypes.varint then
            v1009 = nil;
            v1010, v1011 = v0.readVarInt(v1004, v1006);
            v1009 = v1010;
            v1006 = v1011;
        elseif v1008 == v0.wireTypes.lengthDelimited then
            if v1007 == 1 then
                v1009 = nil;
                v1010, v1011 = v0.readBuffer(v1004, v1006);
                v1009 = v1010;
                v1006 = v1011;
                v1005.kind = {
                    type = "token", 
                    value = buffer.tostring(v1009)
                };
            elseif v1007 == 2 then
                v1009 = nil;
                v1010, v1011 = v0.readBuffer(v1004, v1006);
                v1009 = v1010;
                v1006 = v1011;
                v1005.kind = {
                    type = "conditional", 
                    value = v2.TypographyFontProp_ConditionalOptions.decode(v1009)
                };
            else
                v1009 = nil;
                v1010, v1011 = v0.readVarInt(v1004, v1006);
                v1006 = v1011 + v1010;
            end;
        elseif v1008 == v0.wireTypes.i32 then
            v1009 = nil;
            v1010, v1011 = v0.readFixed32(v1004, v1006);
            v1009 = v1010;
            v1006 = v1011;
        elseif v1008 == v0.wireTypes.i64 then
            v1009 = nil;
            v1010, v1011 = v0.readFixed64(v1004, v1006);
            v1009 = v1010;
            v1006 = v1011;
        else
            error("Unsupported wire type: " .. v1008);
        end;
    end;
    return v1005;
end;
v5.jsonEncode = function(v1012) --[[ Line: 7711 ]] --[[ Name: jsonEncode ]]
    local v1013 = {};
    if v1012.kind ~= nil then
        if v1012.kind.type == "token" then
            v1013.token = v1012.kind.value;
            return v1013;
        elseif v1012.kind.type == "conditional" then
            v1013.conditional = v1012.kind.value:jsonEncode();
        end;
    end;
    return v1013;
end;
v5.jsonDecode = function(v1014) --[[ Line: 7725 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_36 (copy), v2 (copy)
    local v1015 = l_v5_36.new();
    if v1014.token ~= nil then
        v1015.kind = {
            type = "token", 
            value = v1014.token
        };
    end;
    if v1014.conditional ~= nil then
        v1015.kind = {
            type = "conditional", 
            value = v2.TypographyFontProp_ConditionalOptions.jsonDecode(v1014.conditional)
        };
    end;
    return v1015;
end;
v5.descriptor = {
    name = "TypographyFontProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
};
v2.TypographyFontProp = v5;
v1.default:register(v2.TypographyFontProp);
v5 = {};
v5.__index = v5;
local l_v5_37 = v5 --[[ copy: 5 -> 43 ]];
v5.new = function(v1017) --[[ Line: 7756 ]] --[[ Name: new ]]
    -- upvalues: l_v5_37 (copy)
    return (setmetatable({
        condition = if not (v1017 ~= nil) or v1017.condition == nil then nil else v1017.condition, 
        kind = if not (v1017 ~= nil) or v1017.kind == nil then nil else v1017.kind
    }, l_v5_37));
end;
v5.encode = function(v1018) --[[ Line: 7765 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1019 = buffer.create(0);
    local v1020 = 0;
    if v1018.condition ~= nil then
        local v1021 = v1018.condition:encode();
        local v1022, v1023 = v0.writeTag(v1019, v1020, 1, v0.wireTypes.lengthDelimited);
        v1022, v1023 = v0.writeBuffer(v1022, v1023, v1021, buffer.len(v1021));
        v1019 = v1022;
        v1020 = v1023;
    end;
    if v1018.kind ~= nil and v1018.kind.type == "token" then
        local v1024, v1025 = v0.writeTag(v1019, v1020, 2, v0.wireTypes.lengthDelimited);
        v1024, v1025 = v0.writeString(v1024, v1025, v1018.kind.value);
        v1019 = v1024;
        v1020 = v1025;
    end;
    local v1026 = buffer.create(v1020);
    buffer.copy(v1026, 0, v1019, 0, v1020);
    return v1026;
end;
v5.decode = function(v1027) --[[ Line: 7787 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_37 (copy), v0 (copy), v4 (copy)
    local v1028 = l_v5_37.new();
    local v1029 = 0;
    while v1029 < buffer.len(v1027) do
        local v1030 = nil;
        local v1031 = nil;
        local v1032, v1033, v1034 = v0.readTag(v1027, v1029);
        v1030 = v1032;
        v1031 = v1033;
        v1029 = v1034;
        if v1031 == v0.wireTypes.varint then
            v1032 = nil;
            v1033, v1034 = v0.readVarInt(v1027, v1029);
            v1032 = v1033;
            v1029 = v1034;
        elseif v1031 == v0.wireTypes.lengthDelimited then
            if v1030 == 1 then
                v1032 = nil;
                v1033, v1034 = v0.readBuffer(v1027, v1029);
                v1032 = v1033;
                v1029 = v1034;
                v1028.condition = v4.PropCondition.decode(v1032);
            elseif v1030 == 2 then
                v1032 = nil;
                v1033, v1034 = v0.readBuffer(v1027, v1029);
                v1032 = v1033;
                v1029 = v1034;
                v1028.kind = {
                    type = "token", 
                    value = buffer.tostring(v1032)
                };
            else
                v1032 = nil;
                v1033, v1034 = v0.readVarInt(v1027, v1029);
                v1029 = v1034 + v1033;
            end;
        elseif v1031 == v0.wireTypes.i32 then
            v1032 = nil;
            v1033, v1034 = v0.readFixed32(v1027, v1029);
            v1032 = v1033;
            v1029 = v1034;
        elseif v1031 == v0.wireTypes.i64 then
            v1032 = nil;
            v1033, v1034 = v0.readFixed64(v1027, v1029);
            v1032 = v1033;
            v1029 = v1034;
        else
            error("Unsupported wire type: " .. v1031);
        end;
    end;
    return v1028;
end;
v5.jsonEncode = function(v1035) --[[ Line: 7835 ]] --[[ Name: jsonEncode ]]
    local v1036 = {};
    if v1035.condition ~= nil then
        v1036.condition = v1035.condition:jsonEncode();
    end;
    if v1035.kind ~= nil and v1035.kind.type == "token" then
        v1036.token = v1035.kind.value;
    end;
    return v1036;
end;
v5.jsonDecode = function(v1037) --[[ Line: 7851 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_37 (copy), v4 (copy)
    local v1038 = l_v5_37.new();
    if v1037.condition ~= nil then
        v1038.condition = v4.PropCondition.jsonDecode(v1037.condition);
    end;
    if v1037.token ~= nil then
        v1038.kind = {
            type = "token", 
            value = v1037.token
        };
    end;
    return v1038;
end;
v5.descriptor = {
    name = "TypographyFontProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TypographyFontProp_ConditionalOption = v5;
v1.default:register(v2.TypographyFontProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_38 = v5 --[[ copy: 5 -> 44 ]];
v5.new = function(v1040) --[[ Line: 7882 ]] --[[ Name: new ]]
    -- upvalues: l_v5_38 (copy)
    return (setmetatable({
        options = if not (v1040 ~= nil) or v1040.options == nil then {} else v1040.options
    }, l_v5_38));
end;
v5.encode = function(v1041) --[[ Line: 7890 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1042 = buffer.create(0);
    local v1043 = 0;
    if v1041.options ~= nil and #v1041.options > 0 then
        for _, v1045 in v1041.options do
            local v1046 = v1045:encode();
            local v1047, v1048 = v0.writeTag(v1042, v1043, 1, v0.wireTypes.lengthDelimited);
            v1047, v1048 = v0.writeBuffer(v1047, v1048, v1046, buffer.len(v1046));
            v1042 = v1047;
            v1043 = v1048;
        end;
    end;
    local v1049 = buffer.create(v1043);
    buffer.copy(v1049, 0, v1042, 0, v1043);
    return v1049;
end;
v5.decode = function(v1050) --[[ Line: 7907 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_38 (copy), v0 (copy), v2 (copy)
    local v1051 = l_v5_38.new();
    local v1052 = 0;
    while v1052 < buffer.len(v1050) do
        local v1053 = nil;
        local v1054 = nil;
        local v1055, v1056, v1057 = v0.readTag(v1050, v1052);
        v1053 = v1055;
        v1054 = v1056;
        v1052 = v1057;
        if v1054 == v0.wireTypes.varint then
            v1055 = nil;
            v1056, v1057 = v0.readVarInt(v1050, v1052);
            v1055 = v1056;
            v1052 = v1057;
        elseif v1054 == v0.wireTypes.lengthDelimited then
            if v1053 == 1 then
                v1055 = nil;
                v1056, v1057 = v0.readBuffer(v1050, v1052);
                v1055 = v1056;
                v1052 = v1057;
                table.insert(v1051.options, v2.TypographyFontProp_ConditionalOption.decode(v1055));
            else
                v1055 = nil;
                v1056, v1057 = v0.readVarInt(v1050, v1052);
                v1052 = v1057 + v1056;
            end;
        elseif v1054 == v0.wireTypes.i32 then
            v1055 = nil;
            v1056, v1057 = v0.readFixed32(v1050, v1052);
            v1055 = v1056;
            v1052 = v1057;
        elseif v1054 == v0.wireTypes.i64 then
            v1055 = nil;
            v1056, v1057 = v0.readFixed64(v1050, v1052);
            v1055 = v1056;
            v1052 = v1057;
        else
            error("Unsupported wire type: " .. v1054);
        end;
    end;
    return v1051;
end;
v5.jsonEncode = function(v1058) --[[ Line: 7950 ]] --[[ Name: jsonEncode ]]
    local v1059 = {};
    if v1058.options ~= nil and #v1058.options > 0 then
        local v1060 = {};
        for _, v1062 in v1058.options do
            table.insert(v1060, v1062:jsonEncode());
        end;
        v1059.options = v1060;
    end;
    return v1059;
end;
v5.jsonDecode = function(v1063) --[[ Line: 7964 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_38 (copy), v2 (copy)
    local v1064 = l_v5_38.new();
    if v1063.options ~= nil then
        local v1065 = {};
        for _, v1067 in v1063.options do
            table.insert(v1065, v2.TypographyFontProp_ConditionalOption.jsonDecode(v1067));
        end;
        v1064.options = v1065;
    end;
    return v1064;
end;
v5.descriptor = {
    name = "TypographyFontProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TypographyFontProp_ConditionalOptions = v5;
v1.default:register(v2.TypographyFontProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_39 = v5 --[[ copy: 5 -> 45 ]];
v5.new = function(v1069) --[[ Line: 7995 ]] --[[ Name: new ]]
    -- upvalues: l_v5_39 (copy)
    return (setmetatable({
        kind = if not (v1069 ~= nil) or v1069.kind == nil then nil else v1069.kind
    }, l_v5_39));
end;
v5.encode = function(v1070) --[[ Line: 8001 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1071 = buffer.create(0);
    local v1072 = 0;
    if v1070.kind ~= nil then
        if v1070.kind.type == "token" then
            local v1073, v1074 = v0.writeTag(v1071, v1072, 1, v0.wireTypes.lengthDelimited);
            v1073, v1074 = v0.writeString(v1073, v1074, v1070.kind.value);
            v1071 = v1073;
            v1072 = v1074;
        elseif v1070.kind.type == "conditional" then
            local v1075 = v1070.kind.value:encode();
            local v1076, v1077 = v0.writeTag(v1071, v1072, 2, v0.wireTypes.lengthDelimited);
            v1076, v1077 = v0.writeBuffer(v1076, v1077, v1075, buffer.len(v1075));
            v1071 = v1076;
            v1072 = v1077;
        end;
    end;
    local v1078 = buffer.create(v1072);
    buffer.copy(v1078, 0, v1071, 0, v1072);
    return v1078;
end;
v5.decode = function(v1079) --[[ Line: 8021 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_39 (copy), v0 (copy), v2 (copy)
    local v1080 = l_v5_39.new();
    local v1081 = 0;
    while v1081 < buffer.len(v1079) do
        local v1082 = nil;
        local v1083 = nil;
        local v1084, v1085, v1086 = v0.readTag(v1079, v1081);
        v1082 = v1084;
        v1083 = v1085;
        v1081 = v1086;
        if v1083 == v0.wireTypes.varint then
            v1084 = nil;
            v1085, v1086 = v0.readVarInt(v1079, v1081);
            v1084 = v1085;
            v1081 = v1086;
        elseif v1083 == v0.wireTypes.lengthDelimited then
            if v1082 == 1 then
                v1084 = nil;
                v1085, v1086 = v0.readBuffer(v1079, v1081);
                v1084 = v1085;
                v1081 = v1086;
                v1080.kind = {
                    type = "token", 
                    value = buffer.tostring(v1084)
                };
            elseif v1082 == 2 then
                v1084 = nil;
                v1085, v1086 = v0.readBuffer(v1079, v1081);
                v1084 = v1085;
                v1081 = v1086;
                v1080.kind = {
                    type = "conditional", 
                    value = v2.ColorStyleProp_ConditionalOptions.decode(v1084)
                };
            else
                v1084 = nil;
                v1085, v1086 = v0.readVarInt(v1079, v1081);
                v1081 = v1086 + v1085;
            end;
        elseif v1083 == v0.wireTypes.i32 then
            v1084 = nil;
            v1085, v1086 = v0.readFixed32(v1079, v1081);
            v1084 = v1085;
            v1081 = v1086;
        elseif v1083 == v0.wireTypes.i64 then
            v1084 = nil;
            v1085, v1086 = v0.readFixed64(v1079, v1081);
            v1084 = v1085;
            v1081 = v1086;
        else
            error("Unsupported wire type: " .. v1083);
        end;
    end;
    return v1080;
end;
v5.jsonEncode = function(v1087) --[[ Line: 8070 ]] --[[ Name: jsonEncode ]]
    local v1088 = {};
    if v1087.kind ~= nil then
        if v1087.kind.type == "token" then
            v1088.token = v1087.kind.value;
            return v1088;
        elseif v1087.kind.type == "conditional" then
            v1088.conditional = v1087.kind.value:jsonEncode();
        end;
    end;
    return v1088;
end;
v5.jsonDecode = function(v1089) --[[ Line: 8084 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_39 (copy), v2 (copy)
    local v1090 = l_v5_39.new();
    if v1089.token ~= nil then
        v1090.kind = {
            type = "token", 
            value = v1089.token
        };
    end;
    if v1089.conditional ~= nil then
        v1090.kind = {
            type = "conditional", 
            value = v2.ColorStyleProp_ConditionalOptions.jsonDecode(v1089.conditional)
        };
    end;
    return v1090;
end;
v5.descriptor = {
    name = "ColorStyleProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
};
v2.ColorStyleProp = v5;
v1.default:register(v2.ColorStyleProp);
v5 = {};
v5.__index = v5;
local l_v5_40 = v5 --[[ copy: 5 -> 46 ]];
v5.new = function(v1092) --[[ Line: 8115 ]] --[[ Name: new ]]
    -- upvalues: l_v5_40 (copy)
    return (setmetatable({
        condition = if not (v1092 ~= nil) or v1092.condition == nil then nil else v1092.condition, 
        kind = if not (v1092 ~= nil) or v1092.kind == nil then nil else v1092.kind
    }, l_v5_40));
end;
v5.encode = function(v1093) --[[ Line: 8124 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1094 = buffer.create(0);
    local v1095 = 0;
    if v1093.condition ~= nil then
        local v1096 = v1093.condition:encode();
        local v1097, v1098 = v0.writeTag(v1094, v1095, 1, v0.wireTypes.lengthDelimited);
        v1097, v1098 = v0.writeBuffer(v1097, v1098, v1096, buffer.len(v1096));
        v1094 = v1097;
        v1095 = v1098;
    end;
    if v1093.kind ~= nil and v1093.kind.type == "token" then
        local v1099, v1100 = v0.writeTag(v1094, v1095, 2, v0.wireTypes.lengthDelimited);
        v1099, v1100 = v0.writeString(v1099, v1100, v1093.kind.value);
        v1094 = v1099;
        v1095 = v1100;
    end;
    local v1101 = buffer.create(v1095);
    buffer.copy(v1101, 0, v1094, 0, v1095);
    return v1101;
end;
v5.decode = function(v1102) --[[ Line: 8146 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_40 (copy), v0 (copy), v4 (copy)
    local v1103 = l_v5_40.new();
    local v1104 = 0;
    while v1104 < buffer.len(v1102) do
        local v1105 = nil;
        local v1106 = nil;
        local v1107, v1108, v1109 = v0.readTag(v1102, v1104);
        v1105 = v1107;
        v1106 = v1108;
        v1104 = v1109;
        if v1106 == v0.wireTypes.varint then
            v1107 = nil;
            v1108, v1109 = v0.readVarInt(v1102, v1104);
            v1107 = v1108;
            v1104 = v1109;
        elseif v1106 == v0.wireTypes.lengthDelimited then
            if v1105 == 1 then
                v1107 = nil;
                v1108, v1109 = v0.readBuffer(v1102, v1104);
                v1107 = v1108;
                v1104 = v1109;
                v1103.condition = v4.PropCondition.decode(v1107);
            elseif v1105 == 2 then
                v1107 = nil;
                v1108, v1109 = v0.readBuffer(v1102, v1104);
                v1107 = v1108;
                v1104 = v1109;
                v1103.kind = {
                    type = "token", 
                    value = buffer.tostring(v1107)
                };
            else
                v1107 = nil;
                v1108, v1109 = v0.readVarInt(v1102, v1104);
                v1104 = v1109 + v1108;
            end;
        elseif v1106 == v0.wireTypes.i32 then
            v1107 = nil;
            v1108, v1109 = v0.readFixed32(v1102, v1104);
            v1107 = v1108;
            v1104 = v1109;
        elseif v1106 == v0.wireTypes.i64 then
            v1107 = nil;
            v1108, v1109 = v0.readFixed64(v1102, v1104);
            v1107 = v1108;
            v1104 = v1109;
        else
            error("Unsupported wire type: " .. v1106);
        end;
    end;
    return v1103;
end;
v5.jsonEncode = function(v1110) --[[ Line: 8194 ]] --[[ Name: jsonEncode ]]
    local v1111 = {};
    if v1110.condition ~= nil then
        v1111.condition = v1110.condition:jsonEncode();
    end;
    if v1110.kind ~= nil and v1110.kind.type == "token" then
        v1111.token = v1110.kind.value;
    end;
    return v1111;
end;
v5.jsonDecode = function(v1112) --[[ Line: 8210 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_40 (copy), v4 (copy)
    local v1113 = l_v5_40.new();
    if v1112.condition ~= nil then
        v1113.condition = v4.PropCondition.jsonDecode(v1112.condition);
    end;
    if v1112.token ~= nil then
        v1113.kind = {
            type = "token", 
            value = v1112.token
        };
    end;
    return v1113;
end;
v5.descriptor = {
    name = "ColorStyleProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ColorStyleProp_ConditionalOption = v5;
v1.default:register(v2.ColorStyleProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_41 = v5 --[[ copy: 5 -> 47 ]];
v5.new = function(v1115) --[[ Line: 8241 ]] --[[ Name: new ]]
    -- upvalues: l_v5_41 (copy)
    return (setmetatable({
        options = if not (v1115 ~= nil) or v1115.options == nil then {} else v1115.options
    }, l_v5_41));
end;
v5.encode = function(v1116) --[[ Line: 8249 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1117 = buffer.create(0);
    local v1118 = 0;
    if v1116.options ~= nil and #v1116.options > 0 then
        for _, v1120 in v1116.options do
            local v1121 = v1120:encode();
            local v1122, v1123 = v0.writeTag(v1117, v1118, 1, v0.wireTypes.lengthDelimited);
            v1122, v1123 = v0.writeBuffer(v1122, v1123, v1121, buffer.len(v1121));
            v1117 = v1122;
            v1118 = v1123;
        end;
    end;
    local v1124 = buffer.create(v1118);
    buffer.copy(v1124, 0, v1117, 0, v1118);
    return v1124;
end;
v5.decode = function(v1125) --[[ Line: 8266 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_41 (copy), v0 (copy), v2 (copy)
    local v1126 = l_v5_41.new();
    local v1127 = 0;
    while v1127 < buffer.len(v1125) do
        local v1128 = nil;
        local v1129 = nil;
        local v1130, v1131, v1132 = v0.readTag(v1125, v1127);
        v1128 = v1130;
        v1129 = v1131;
        v1127 = v1132;
        if v1129 == v0.wireTypes.varint then
            v1130 = nil;
            v1131, v1132 = v0.readVarInt(v1125, v1127);
            v1130 = v1131;
            v1127 = v1132;
        elseif v1129 == v0.wireTypes.lengthDelimited then
            if v1128 == 1 then
                v1130 = nil;
                v1131, v1132 = v0.readBuffer(v1125, v1127);
                v1130 = v1131;
                v1127 = v1132;
                table.insert(v1126.options, v2.ColorStyleProp_ConditionalOption.decode(v1130));
            else
                v1130 = nil;
                v1131, v1132 = v0.readVarInt(v1125, v1127);
                v1127 = v1132 + v1131;
            end;
        elseif v1129 == v0.wireTypes.i32 then
            v1130 = nil;
            v1131, v1132 = v0.readFixed32(v1125, v1127);
            v1130 = v1131;
            v1127 = v1132;
        elseif v1129 == v0.wireTypes.i64 then
            v1130 = nil;
            v1131, v1132 = v0.readFixed64(v1125, v1127);
            v1130 = v1131;
            v1127 = v1132;
        else
            error("Unsupported wire type: " .. v1129);
        end;
    end;
    return v1126;
end;
v5.jsonEncode = function(v1133) --[[ Line: 8309 ]] --[[ Name: jsonEncode ]]
    local v1134 = {};
    if v1133.options ~= nil and #v1133.options > 0 then
        local v1135 = {};
        for _, v1137 in v1133.options do
            table.insert(v1135, v1137:jsonEncode());
        end;
        v1134.options = v1135;
    end;
    return v1134;
end;
v5.jsonDecode = function(v1138) --[[ Line: 8323 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_41 (copy), v2 (copy)
    local v1139 = l_v5_41.new();
    if v1138.options ~= nil then
        local v1140 = {};
        for _, v1142 in v1138.options do
            table.insert(v1140, v2.ColorStyleProp_ConditionalOption.jsonDecode(v1142));
        end;
        v1139.options = v1140;
    end;
    return v1139;
end;
v5.descriptor = {
    name = "ColorStyleProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ColorStyleProp_ConditionalOptions = v5;
v1.default:register(v2.ColorStyleProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_42 = v5 --[[ copy: 5 -> 48 ]];
v5.new = function(v1144) --[[ Line: 8354 ]] --[[ Name: new ]]
    -- upvalues: l_v5_42 (copy)
    return (setmetatable({
        kind = if not (v1144 ~= nil) or v1144.kind == nil then nil else v1144.kind
    }, l_v5_42));
end;
v5.encode = function(v1145) --[[ Line: 8360 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1146 = buffer.create(0);
    local v1147 = 0;
    if v1145.kind ~= nil then
        if v1145.kind.type == "literal" then
            local v1148, v1149 = v0.writeTag(v1146, v1147, 1, v0.wireTypes.lengthDelimited);
            v1148, v1149 = v0.writeString(v1148, v1149, v1145.kind.value);
            v1146 = v1148;
            v1147 = v1149;
        elseif v1145.kind.type == "conditional" then
            local v1150 = v1145.kind.value:encode();
            local v1151, v1152 = v0.writeTag(v1146, v1147, 2, v0.wireTypes.lengthDelimited);
            v1151, v1152 = v0.writeBuffer(v1151, v1152, v1150, buffer.len(v1150));
            v1146 = v1151;
            v1147 = v1152;
        elseif v1145.kind.type == "binding_path" then
            local v1153, v1154 = v0.writeTag(v1146, v1147, 3, v0.wireTypes.lengthDelimited);
            v1153, v1154 = v0.writeString(v1153, v1154, v1145.kind.value);
            v1146 = v1153;
            v1147 = v1154;
        end;
    end;
    local v1155 = buffer.create(v1147);
    buffer.copy(v1155, 0, v1146, 0, v1147);
    return v1155;
end;
v5.decode = function(v1156) --[[ Line: 8383 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_42 (copy), v0 (copy), v2 (copy)
    local v1157 = l_v5_42.new();
    local v1158 = 0;
    while v1158 < buffer.len(v1156) do
        local v1159 = nil;
        local v1160 = nil;
        local v1161, v1162, v1163 = v0.readTag(v1156, v1158);
        v1159 = v1161;
        v1160 = v1162;
        v1158 = v1163;
        if v1160 == v0.wireTypes.varint then
            v1161 = nil;
            v1162, v1163 = v0.readVarInt(v1156, v1158);
            v1161 = v1162;
            v1158 = v1163;
        elseif v1160 == v0.wireTypes.lengthDelimited then
            if v1159 == 1 then
                v1161 = nil;
                v1162, v1163 = v0.readBuffer(v1156, v1158);
                v1161 = v1162;
                v1158 = v1163;
                v1157.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1161)
                };
            elseif v1159 == 2 then
                v1161 = nil;
                v1162, v1163 = v0.readBuffer(v1156, v1158);
                v1161 = v1162;
                v1158 = v1163;
                v1157.kind = {
                    type = "conditional", 
                    value = v2.FillBehaviorProp_ConditionalOptions.decode(v1161)
                };
            elseif v1159 == 3 then
                v1161 = nil;
                v1162, v1163 = v0.readBuffer(v1156, v1158);
                v1161 = v1162;
                v1158 = v1163;
                v1157.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1161)
                };
            else
                v1161 = nil;
                v1162, v1163 = v0.readVarInt(v1156, v1158);
                v1158 = v1163 + v1162;
            end;
        elseif v1160 == v0.wireTypes.i32 then
            v1161 = nil;
            v1162, v1163 = v0.readFixed32(v1156, v1158);
            v1161 = v1162;
            v1158 = v1163;
        elseif v1160 == v0.wireTypes.i64 then
            v1161 = nil;
            v1162, v1163 = v0.readFixed64(v1156, v1158);
            v1161 = v1162;
            v1158 = v1163;
        else
            error("Unsupported wire type: " .. v1160);
        end;
    end;
    return v1157;
end;
v5.jsonEncode = function(v1164) --[[ Line: 8437 ]] --[[ Name: jsonEncode ]]
    local v1165 = {};
    if v1164.kind ~= nil then
        if v1164.kind.type == "literal" then
            v1165.literal = v1164.kind.value;
            return v1165;
        elseif v1164.kind.type == "conditional" then
            v1165.conditional = v1164.kind.value:jsonEncode();
            return v1165;
        elseif v1164.kind.type == "binding_path" then
            v1165.bindingPath = v1164.kind.value;
        end;
    end;
    return v1165;
end;
v5.jsonDecode = function(v1166) --[[ Line: 8453 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_42 (copy), v2 (copy)
    local v1167 = l_v5_42.new();
    if v1166.literal ~= nil then
        v1167.kind = {
            type = "literal", 
            value = v1166.literal
        };
    end;
    if v1166.conditional ~= nil then
        v1167.kind = {
            type = "conditional", 
            value = v2.FillBehaviorProp_ConditionalOptions.jsonDecode(v1166.conditional)
        };
    end;
    if v1166.binding_path ~= nil then
        v1167.kind = {
            type = "binding_path", 
            value = v1166.binding_path
        };
    end;
    if v1166.bindingPath ~= nil then
        v1167.kind = {
            type = "binding_path", 
            value = v1166.bindingPath
        };
    end;
    return v1167;
end;
v5.descriptor = {
    name = "FillBehaviorProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
};
v2.FillBehaviorProp = v5;
v1.default:register(v2.FillBehaviorProp);
v5 = {};
v5.__index = v5;
local l_v5_43 = v5 --[[ copy: 5 -> 49 ]];
v5.new = function(v1169) --[[ Line: 8492 ]] --[[ Name: new ]]
    -- upvalues: l_v5_43 (copy)
    return (setmetatable({
        condition = if not (v1169 ~= nil) or v1169.condition == nil then nil else v1169.condition, 
        kind = if not (v1169 ~= nil) or v1169.kind == nil then nil else v1169.kind
    }, l_v5_43));
end;
v5.encode = function(v1170) --[[ Line: 8501 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1171 = buffer.create(0);
    local v1172 = 0;
    if v1170.condition ~= nil then
        local v1173 = v1170.condition:encode();
        local v1174, v1175 = v0.writeTag(v1171, v1172, 1, v0.wireTypes.lengthDelimited);
        v1174, v1175 = v0.writeBuffer(v1174, v1175, v1173, buffer.len(v1173));
        v1171 = v1174;
        v1172 = v1175;
    end;
    if v1170.kind ~= nil then
        if v1170.kind.type == "literal" then
            local v1176, v1177 = v0.writeTag(v1171, v1172, 2, v0.wireTypes.lengthDelimited);
            v1176, v1177 = v0.writeString(v1176, v1177, v1170.kind.value);
            v1171 = v1176;
            v1172 = v1177;
        elseif v1170.kind.type == "binding_path" then
            local v1178, v1179 = v0.writeTag(v1171, v1172, 3, v0.wireTypes.lengthDelimited);
            v1178, v1179 = v0.writeString(v1178, v1179, v1170.kind.value);
            v1171 = v1178;
            v1172 = v1179;
        end;
    end;
    local v1180 = buffer.create(v1172);
    buffer.copy(v1180, 0, v1171, 0, v1172);
    return v1180;
end;
v5.decode = function(v1181) --[[ Line: 8526 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_43 (copy), v0 (copy), v4 (copy)
    local v1182 = l_v5_43.new();
    local v1183 = 0;
    while v1183 < buffer.len(v1181) do
        local v1184 = nil;
        local v1185 = nil;
        local v1186, v1187, v1188 = v0.readTag(v1181, v1183);
        v1184 = v1186;
        v1185 = v1187;
        v1183 = v1188;
        if v1185 == v0.wireTypes.varint then
            v1186 = nil;
            v1187, v1188 = v0.readVarInt(v1181, v1183);
            v1186 = v1187;
            v1183 = v1188;
        elseif v1185 == v0.wireTypes.lengthDelimited then
            if v1184 == 1 then
                v1186 = nil;
                v1187, v1188 = v0.readBuffer(v1181, v1183);
                v1186 = v1187;
                v1183 = v1188;
                v1182.condition = v4.PropCondition.decode(v1186);
            elseif v1184 == 2 then
                v1186 = nil;
                v1187, v1188 = v0.readBuffer(v1181, v1183);
                v1186 = v1187;
                v1183 = v1188;
                v1182.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1186)
                };
            elseif v1184 == 3 then
                v1186 = nil;
                v1187, v1188 = v0.readBuffer(v1181, v1183);
                v1186 = v1187;
                v1183 = v1188;
                v1182.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1186)
                };
            else
                v1186 = nil;
                v1187, v1188 = v0.readVarInt(v1181, v1183);
                v1183 = v1188 + v1187;
            end;
        elseif v1185 == v0.wireTypes.i32 then
            v1186 = nil;
            v1187, v1188 = v0.readFixed32(v1181, v1183);
            v1186 = v1187;
            v1183 = v1188;
        elseif v1185 == v0.wireTypes.i64 then
            v1186 = nil;
            v1187, v1188 = v0.readFixed64(v1181, v1183);
            v1186 = v1187;
            v1183 = v1188;
        else
            error("Unsupported wire type: " .. v1185);
        end;
    end;
    return v1182;
end;
v5.jsonEncode = function(v1189) --[[ Line: 8579 ]] --[[ Name: jsonEncode ]]
    local v1190 = {};
    if v1189.condition ~= nil then
        v1190.condition = v1189.condition:jsonEncode();
    end;
    if v1189.kind ~= nil then
        if v1189.kind.type == "literal" then
            v1190.literal = v1189.kind.value;
            return v1190;
        elseif v1189.kind.type == "binding_path" then
            v1190.bindingPath = v1189.kind.value;
        end;
    end;
    return v1190;
end;
v5.jsonDecode = function(v1191) --[[ Line: 8597 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_43 (copy), v4 (copy)
    local v1192 = l_v5_43.new();
    if v1191.condition ~= nil then
        v1192.condition = v4.PropCondition.jsonDecode(v1191.condition);
    end;
    if v1191.literal ~= nil then
        v1192.kind = {
            type = "literal", 
            value = v1191.literal
        };
    end;
    if v1191.binding_path ~= nil then
        v1192.kind = {
            type = "binding_path", 
            value = v1191.binding_path
        };
    end;
    if v1191.bindingPath ~= nil then
        v1192.kind = {
            type = "binding_path", 
            value = v1191.bindingPath
        };
    end;
    return v1192;
end;
v5.descriptor = {
    name = "FillBehaviorProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.FillBehaviorProp_ConditionalOption = v5;
v1.default:register(v2.FillBehaviorProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_44 = v5 --[[ copy: 5 -> 50 ]];
v5.new = function(v1194) --[[ Line: 8636 ]] --[[ Name: new ]]
    -- upvalues: l_v5_44 (copy)
    return (setmetatable({
        options = if not (v1194 ~= nil) or v1194.options == nil then {} else v1194.options
    }, l_v5_44));
end;
v5.encode = function(v1195) --[[ Line: 8644 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1196 = buffer.create(0);
    local v1197 = 0;
    if v1195.options ~= nil and #v1195.options > 0 then
        for _, v1199 in v1195.options do
            local v1200 = v1199:encode();
            local v1201, v1202 = v0.writeTag(v1196, v1197, 1, v0.wireTypes.lengthDelimited);
            v1201, v1202 = v0.writeBuffer(v1201, v1202, v1200, buffer.len(v1200));
            v1196 = v1201;
            v1197 = v1202;
        end;
    end;
    local v1203 = buffer.create(v1197);
    buffer.copy(v1203, 0, v1196, 0, v1197);
    return v1203;
end;
v5.decode = function(v1204) --[[ Line: 8661 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_44 (copy), v0 (copy), v2 (copy)
    local v1205 = l_v5_44.new();
    local v1206 = 0;
    while v1206 < buffer.len(v1204) do
        local v1207 = nil;
        local v1208 = nil;
        local v1209, v1210, v1211 = v0.readTag(v1204, v1206);
        v1207 = v1209;
        v1208 = v1210;
        v1206 = v1211;
        if v1208 == v0.wireTypes.varint then
            v1209 = nil;
            v1210, v1211 = v0.readVarInt(v1204, v1206);
            v1209 = v1210;
            v1206 = v1211;
        elseif v1208 == v0.wireTypes.lengthDelimited then
            if v1207 == 1 then
                v1209 = nil;
                v1210, v1211 = v0.readBuffer(v1204, v1206);
                v1209 = v1210;
                v1206 = v1211;
                table.insert(v1205.options, v2.FillBehaviorProp_ConditionalOption.decode(v1209));
            else
                v1209 = nil;
                v1210, v1211 = v0.readVarInt(v1204, v1206);
                v1206 = v1211 + v1210;
            end;
        elseif v1208 == v0.wireTypes.i32 then
            v1209 = nil;
            v1210, v1211 = v0.readFixed32(v1204, v1206);
            v1209 = v1210;
            v1206 = v1211;
        elseif v1208 == v0.wireTypes.i64 then
            v1209 = nil;
            v1210, v1211 = v0.readFixed64(v1204, v1206);
            v1209 = v1210;
            v1206 = v1211;
        else
            error("Unsupported wire type: " .. v1208);
        end;
    end;
    return v1205;
end;
v5.jsonEncode = function(v1212) --[[ Line: 8704 ]] --[[ Name: jsonEncode ]]
    local v1213 = {};
    if v1212.options ~= nil and #v1212.options > 0 then
        local v1214 = {};
        for _, v1216 in v1212.options do
            table.insert(v1214, v1216:jsonEncode());
        end;
        v1213.options = v1214;
    end;
    return v1213;
end;
v5.jsonDecode = function(v1217) --[[ Line: 8718 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_44 (copy), v2 (copy)
    local v1218 = l_v5_44.new();
    if v1217.options ~= nil then
        local v1219 = {};
        for _, v1221 in v1217.options do
            table.insert(v1219, v2.FillBehaviorProp_ConditionalOption.jsonDecode(v1221));
        end;
        v1218.options = v1219;
    end;
    return v1218;
end;
v5.descriptor = {
    name = "FillBehaviorProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.FillBehaviorProp_ConditionalOptions = v5;
v1.default:register(v2.FillBehaviorProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_45 = v5 --[[ copy: 5 -> 51 ]];
v5.new = function(v1223) --[[ Line: 8749 ]] --[[ Name: new ]]
    -- upvalues: l_v5_45 (copy)
    return (setmetatable({
        kind = if not (v1223 ~= nil) or v1223.kind == nil then nil else v1223.kind
    }, l_v5_45));
end;
v5.encode = function(v1224) --[[ Line: 8755 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1225 = buffer.create(0);
    local v1226 = 0;
    if v1224.kind ~= nil then
        if v1224.kind.type == "literal" then
            local v1227, v1228 = v0.writeTag(v1225, v1226, 1, v0.wireTypes.lengthDelimited);
            v1227, v1228 = v0.writeString(v1227, v1228, v1224.kind.value);
            v1225 = v1227;
            v1226 = v1228;
        elseif v1224.kind.type == "conditional" then
            local v1229 = v1224.kind.value:encode();
            local v1230, v1231 = v0.writeTag(v1225, v1226, 2, v0.wireTypes.lengthDelimited);
            v1230, v1231 = v0.writeBuffer(v1230, v1231, v1229, buffer.len(v1229));
            v1225 = v1230;
            v1226 = v1231;
        elseif v1224.kind.type == "binding_path" then
            local v1232, v1233 = v0.writeTag(v1225, v1226, 3, v0.wireTypes.lengthDelimited);
            v1232, v1233 = v0.writeString(v1232, v1233, v1224.kind.value);
            v1225 = v1232;
            v1226 = v1233;
        end;
    end;
    local v1234 = buffer.create(v1226);
    buffer.copy(v1234, 0, v1225, 0, v1226);
    return v1234;
end;
v5.decode = function(v1235) --[[ Line: 8778 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_45 (copy), v0 (copy), v2 (copy)
    local v1236 = l_v5_45.new();
    local v1237 = 0;
    while v1237 < buffer.len(v1235) do
        local v1238 = nil;
        local v1239 = nil;
        local v1240, v1241, v1242 = v0.readTag(v1235, v1237);
        v1238 = v1240;
        v1239 = v1241;
        v1237 = v1242;
        if v1239 == v0.wireTypes.varint then
            v1240 = nil;
            v1241, v1242 = v0.readVarInt(v1235, v1237);
            v1240 = v1241;
            v1237 = v1242;
        elseif v1239 == v0.wireTypes.lengthDelimited then
            if v1238 == 1 then
                v1240 = nil;
                v1241, v1242 = v0.readBuffer(v1235, v1237);
                v1240 = v1241;
                v1237 = v1242;
                v1236.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1240)
                };
            elseif v1238 == 2 then
                v1240 = nil;
                v1241, v1242 = v0.readBuffer(v1235, v1237);
                v1240 = v1241;
                v1237 = v1242;
                v1236.kind = {
                    type = "conditional", 
                    value = v2.InputSizeProp_ConditionalOptions.decode(v1240)
                };
            elseif v1238 == 3 then
                v1240 = nil;
                v1241, v1242 = v0.readBuffer(v1235, v1237);
                v1240 = v1241;
                v1237 = v1242;
                v1236.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1240)
                };
            else
                v1240 = nil;
                v1241, v1242 = v0.readVarInt(v1235, v1237);
                v1237 = v1242 + v1241;
            end;
        elseif v1239 == v0.wireTypes.i32 then
            v1240 = nil;
            v1241, v1242 = v0.readFixed32(v1235, v1237);
            v1240 = v1241;
            v1237 = v1242;
        elseif v1239 == v0.wireTypes.i64 then
            v1240 = nil;
            v1241, v1242 = v0.readFixed64(v1235, v1237);
            v1240 = v1241;
            v1237 = v1242;
        else
            error("Unsupported wire type: " .. v1239);
        end;
    end;
    return v1236;
end;
v5.jsonEncode = function(v1243) --[[ Line: 8832 ]] --[[ Name: jsonEncode ]]
    local v1244 = {};
    if v1243.kind ~= nil then
        if v1243.kind.type == "literal" then
            v1244.literal = v1243.kind.value;
            return v1244;
        elseif v1243.kind.type == "conditional" then
            v1244.conditional = v1243.kind.value:jsonEncode();
            return v1244;
        elseif v1243.kind.type == "binding_path" then
            v1244.bindingPath = v1243.kind.value;
        end;
    end;
    return v1244;
end;
v5.jsonDecode = function(v1245) --[[ Line: 8848 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_45 (copy), v2 (copy)
    local v1246 = l_v5_45.new();
    if v1245.literal ~= nil then
        v1246.kind = {
            type = "literal", 
            value = v1245.literal
        };
    end;
    if v1245.conditional ~= nil then
        v1246.kind = {
            type = "conditional", 
            value = v2.InputSizeProp_ConditionalOptions.jsonDecode(v1245.conditional)
        };
    end;
    if v1245.binding_path ~= nil then
        v1246.kind = {
            type = "binding_path", 
            value = v1245.binding_path
        };
    end;
    if v1245.bindingPath ~= nil then
        v1246.kind = {
            type = "binding_path", 
            value = v1245.bindingPath
        };
    end;
    return v1246;
end;
v5.descriptor = {
    name = "InputSizeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
};
v2.InputSizeProp = v5;
v1.default:register(v2.InputSizeProp);
v5 = {};
v5.__index = v5;
local l_v5_46 = v5 --[[ copy: 5 -> 52 ]];
v5.new = function(v1248) --[[ Line: 8887 ]] --[[ Name: new ]]
    -- upvalues: l_v5_46 (copy)
    return (setmetatable({
        condition = if not (v1248 ~= nil) or v1248.condition == nil then nil else v1248.condition, 
        kind = if not (v1248 ~= nil) or v1248.kind == nil then nil else v1248.kind
    }, l_v5_46));
end;
v5.encode = function(v1249) --[[ Line: 8896 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1250 = buffer.create(0);
    local v1251 = 0;
    if v1249.condition ~= nil then
        local v1252 = v1249.condition:encode();
        local v1253, v1254 = v0.writeTag(v1250, v1251, 1, v0.wireTypes.lengthDelimited);
        v1253, v1254 = v0.writeBuffer(v1253, v1254, v1252, buffer.len(v1252));
        v1250 = v1253;
        v1251 = v1254;
    end;
    if v1249.kind ~= nil then
        if v1249.kind.type == "literal" then
            local v1255, v1256 = v0.writeTag(v1250, v1251, 2, v0.wireTypes.lengthDelimited);
            v1255, v1256 = v0.writeString(v1255, v1256, v1249.kind.value);
            v1250 = v1255;
            v1251 = v1256;
        elseif v1249.kind.type == "binding_path" then
            local v1257, v1258 = v0.writeTag(v1250, v1251, 3, v0.wireTypes.lengthDelimited);
            v1257, v1258 = v0.writeString(v1257, v1258, v1249.kind.value);
            v1250 = v1257;
            v1251 = v1258;
        end;
    end;
    local v1259 = buffer.create(v1251);
    buffer.copy(v1259, 0, v1250, 0, v1251);
    return v1259;
end;
v5.decode = function(v1260) --[[ Line: 8921 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_46 (copy), v0 (copy), v4 (copy)
    local v1261 = l_v5_46.new();
    local v1262 = 0;
    while v1262 < buffer.len(v1260) do
        local v1263 = nil;
        local v1264 = nil;
        local v1265, v1266, v1267 = v0.readTag(v1260, v1262);
        v1263 = v1265;
        v1264 = v1266;
        v1262 = v1267;
        if v1264 == v0.wireTypes.varint then
            v1265 = nil;
            v1266, v1267 = v0.readVarInt(v1260, v1262);
            v1265 = v1266;
            v1262 = v1267;
        elseif v1264 == v0.wireTypes.lengthDelimited then
            if v1263 == 1 then
                v1265 = nil;
                v1266, v1267 = v0.readBuffer(v1260, v1262);
                v1265 = v1266;
                v1262 = v1267;
                v1261.condition = v4.PropCondition.decode(v1265);
            elseif v1263 == 2 then
                v1265 = nil;
                v1266, v1267 = v0.readBuffer(v1260, v1262);
                v1265 = v1266;
                v1262 = v1267;
                v1261.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1265)
                };
            elseif v1263 == 3 then
                v1265 = nil;
                v1266, v1267 = v0.readBuffer(v1260, v1262);
                v1265 = v1266;
                v1262 = v1267;
                v1261.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1265)
                };
            else
                v1265 = nil;
                v1266, v1267 = v0.readVarInt(v1260, v1262);
                v1262 = v1267 + v1266;
            end;
        elseif v1264 == v0.wireTypes.i32 then
            v1265 = nil;
            v1266, v1267 = v0.readFixed32(v1260, v1262);
            v1265 = v1266;
            v1262 = v1267;
        elseif v1264 == v0.wireTypes.i64 then
            v1265 = nil;
            v1266, v1267 = v0.readFixed64(v1260, v1262);
            v1265 = v1266;
            v1262 = v1267;
        else
            error("Unsupported wire type: " .. v1264);
        end;
    end;
    return v1261;
end;
v5.jsonEncode = function(v1268) --[[ Line: 8974 ]] --[[ Name: jsonEncode ]]
    local v1269 = {};
    if v1268.condition ~= nil then
        v1269.condition = v1268.condition:jsonEncode();
    end;
    if v1268.kind ~= nil then
        if v1268.kind.type == "literal" then
            v1269.literal = v1268.kind.value;
            return v1269;
        elseif v1268.kind.type == "binding_path" then
            v1269.bindingPath = v1268.kind.value;
        end;
    end;
    return v1269;
end;
v5.jsonDecode = function(v1270) --[[ Line: 8992 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_46 (copy), v4 (copy)
    local v1271 = l_v5_46.new();
    if v1270.condition ~= nil then
        v1271.condition = v4.PropCondition.jsonDecode(v1270.condition);
    end;
    if v1270.literal ~= nil then
        v1271.kind = {
            type = "literal", 
            value = v1270.literal
        };
    end;
    if v1270.binding_path ~= nil then
        v1271.kind = {
            type = "binding_path", 
            value = v1270.binding_path
        };
    end;
    if v1270.bindingPath ~= nil then
        v1271.kind = {
            type = "binding_path", 
            value = v1270.bindingPath
        };
    end;
    return v1271;
end;
v5.descriptor = {
    name = "InputSizeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.InputSizeProp_ConditionalOption = v5;
v1.default:register(v2.InputSizeProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_47 = v5 --[[ copy: 5 -> 53 ]];
v5.new = function(v1273) --[[ Line: 9029 ]] --[[ Name: new ]]
    -- upvalues: l_v5_47 (copy)
    return (setmetatable({
        options = if not (v1273 ~= nil) or v1273.options == nil then {} else v1273.options
    }, l_v5_47));
end;
v5.encode = function(v1274) --[[ Line: 9037 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1275 = buffer.create(0);
    local v1276 = 0;
    if v1274.options ~= nil and #v1274.options > 0 then
        for _, v1278 in v1274.options do
            local v1279 = v1278:encode();
            local v1280, v1281 = v0.writeTag(v1275, v1276, 1, v0.wireTypes.lengthDelimited);
            v1280, v1281 = v0.writeBuffer(v1280, v1281, v1279, buffer.len(v1279));
            v1275 = v1280;
            v1276 = v1281;
        end;
    end;
    local v1282 = buffer.create(v1276);
    buffer.copy(v1282, 0, v1275, 0, v1276);
    return v1282;
end;
v5.decode = function(v1283) --[[ Line: 9054 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_47 (copy), v0 (copy), v2 (copy)
    local v1284 = l_v5_47.new();
    local v1285 = 0;
    while v1285 < buffer.len(v1283) do
        local v1286 = nil;
        local v1287 = nil;
        local v1288, v1289, v1290 = v0.readTag(v1283, v1285);
        v1286 = v1288;
        v1287 = v1289;
        v1285 = v1290;
        if v1287 == v0.wireTypes.varint then
            v1288 = nil;
            v1289, v1290 = v0.readVarInt(v1283, v1285);
            v1288 = v1289;
            v1285 = v1290;
        elseif v1287 == v0.wireTypes.lengthDelimited then
            if v1286 == 1 then
                v1288 = nil;
                v1289, v1290 = v0.readBuffer(v1283, v1285);
                v1288 = v1289;
                v1285 = v1290;
                table.insert(v1284.options, v2.InputSizeProp_ConditionalOption.decode(v1288));
            else
                v1288 = nil;
                v1289, v1290 = v0.readVarInt(v1283, v1285);
                v1285 = v1290 + v1289;
            end;
        elseif v1287 == v0.wireTypes.i32 then
            v1288 = nil;
            v1289, v1290 = v0.readFixed32(v1283, v1285);
            v1288 = v1289;
            v1285 = v1290;
        elseif v1287 == v0.wireTypes.i64 then
            v1288 = nil;
            v1289, v1290 = v0.readFixed64(v1283, v1285);
            v1288 = v1289;
            v1285 = v1290;
        else
            error("Unsupported wire type: " .. v1287);
        end;
    end;
    return v1284;
end;
v5.jsonEncode = function(v1291) --[[ Line: 9097 ]] --[[ Name: jsonEncode ]]
    local v1292 = {};
    if v1291.options ~= nil and #v1291.options > 0 then
        local v1293 = {};
        for _, v1295 in v1291.options do
            table.insert(v1293, v1295:jsonEncode());
        end;
        v1292.options = v1293;
    end;
    return v1292;
end;
v5.jsonDecode = function(v1296) --[[ Line: 9111 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_47 (copy), v2 (copy)
    local v1297 = l_v5_47.new();
    if v1296.options ~= nil then
        local v1298 = {};
        for _, v1300 in v1296.options do
            table.insert(v1298, v2.InputSizeProp_ConditionalOption.jsonDecode(v1300));
        end;
        v1297.options = v1298;
    end;
    return v1297;
end;
v5.descriptor = {
    name = "InputSizeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.InputSizeProp_ConditionalOptions = v5;
v1.default:register(v2.InputSizeProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_48 = v5 --[[ copy: 5 -> 54 ]];
v5.new = function(v1302) --[[ Line: 9142 ]] --[[ Name: new ]]
    -- upvalues: l_v5_48 (copy)
    return (setmetatable({
        kind = if not (v1302 ~= nil) or v1302.kind == nil then nil else v1302.kind
    }, l_v5_48));
end;
v5.encode = function(v1303) --[[ Line: 9148 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1304 = buffer.create(0);
    local v1305 = 0;
    if v1303.kind ~= nil then
        if v1303.kind.type == "literal" then
            local v1306, v1307 = v0.writeTag(v1304, v1305, 1, v0.wireTypes.lengthDelimited);
            v1306, v1307 = v0.writeString(v1306, v1307, v1303.kind.value);
            v1304 = v1306;
            v1305 = v1307;
        elseif v1303.kind.type == "token" then
            local v1308, v1309 = v0.writeTag(v1304, v1305, 2, v0.wireTypes.lengthDelimited);
            v1308, v1309 = v0.writeString(v1308, v1309, v1303.kind.value);
            v1304 = v1308;
            v1305 = v1309;
        elseif v1303.kind.type == "conditional" then
            local v1310 = v1303.kind.value:encode();
            local v1311, v1312 = v0.writeTag(v1304, v1305, 3, v0.wireTypes.lengthDelimited);
            v1311, v1312 = v0.writeBuffer(v1311, v1312, v1310, buffer.len(v1310));
            v1304 = v1311;
            v1305 = v1312;
        elseif v1303.kind.type == "binding_path" then
            local v1313, v1314 = v0.writeTag(v1304, v1305, 4, v0.wireTypes.lengthDelimited);
            v1313, v1314 = v0.writeString(v1313, v1314, v1303.kind.value);
            v1304 = v1313;
            v1305 = v1314;
        end;
    end;
    local v1315 = buffer.create(v1305);
    buffer.copy(v1315, 0, v1304, 0, v1305);
    return v1315;
end;
v5.decode = function(v1316) --[[ Line: 9174 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_48 (copy), v0 (copy), v2 (copy)
    local v1317 = l_v5_48.new();
    local v1318 = 0;
    while v1318 < buffer.len(v1316) do
        local v1319 = nil;
        local v1320 = nil;
        local v1321, v1322, v1323 = v0.readTag(v1316, v1318);
        v1319 = v1321;
        v1320 = v1322;
        v1318 = v1323;
        if v1320 == v0.wireTypes.varint then
            v1321 = nil;
            v1322, v1323 = v0.readVarInt(v1316, v1318);
            v1321 = v1322;
            v1318 = v1323;
        elseif v1320 == v0.wireTypes.lengthDelimited then
            if v1319 == 1 then
                v1321 = nil;
                v1322, v1323 = v0.readBuffer(v1316, v1318);
                v1321 = v1322;
                v1318 = v1323;
                v1317.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1321)
                };
            elseif v1319 == 2 then
                v1321 = nil;
                v1322, v1323 = v0.readBuffer(v1316, v1318);
                v1321 = v1322;
                v1318 = v1323;
                v1317.kind = {
                    type = "token", 
                    value = buffer.tostring(v1321)
                };
            elseif v1319 == 3 then
                v1321 = nil;
                v1322, v1323 = v0.readBuffer(v1316, v1318);
                v1321 = v1322;
                v1318 = v1323;
                v1317.kind = {
                    type = "conditional", 
                    value = v2.UDimProp_ConditionalOptions.decode(v1321)
                };
            elseif v1319 == 4 then
                v1321 = nil;
                v1322, v1323 = v0.readBuffer(v1316, v1318);
                v1321 = v1322;
                v1318 = v1323;
                v1317.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1321)
                };
            else
                v1321 = nil;
                v1322, v1323 = v0.readVarInt(v1316, v1318);
                v1318 = v1323 + v1322;
            end;
        elseif v1320 == v0.wireTypes.i32 then
            v1321 = nil;
            v1322, v1323 = v0.readFixed32(v1316, v1318);
            v1321 = v1322;
            v1318 = v1323;
        elseif v1320 == v0.wireTypes.i64 then
            v1321 = nil;
            v1322, v1323 = v0.readFixed64(v1316, v1318);
            v1321 = v1322;
            v1318 = v1323;
        else
            error("Unsupported wire type: " .. v1320);
        end;
    end;
    return v1317;
end;
v5.jsonEncode = function(v1324) --[[ Line: 9232 ]] --[[ Name: jsonEncode ]]
    local v1325 = {};
    if v1324.kind ~= nil then
        if v1324.kind.type == "literal" then
            v1325.literal = v1324.kind.value;
            return v1325;
        elseif v1324.kind.type == "token" then
            v1325.token = v1324.kind.value;
            return v1325;
        elseif v1324.kind.type == "conditional" then
            v1325.conditional = v1324.kind.value:jsonEncode();
            return v1325;
        elseif v1324.kind.type == "binding_path" then
            v1325.bindingPath = v1324.kind.value;
        end;
    end;
    return v1325;
end;
v5.jsonDecode = function(v1326) --[[ Line: 9250 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_48 (copy), v2 (copy)
    local v1327 = l_v5_48.new();
    if v1326.literal ~= nil then
        v1327.kind = {
            type = "literal", 
            value = v1326.literal
        };
    end;
    if v1326.token ~= nil then
        v1327.kind = {
            type = "token", 
            value = v1326.token
        };
    end;
    if v1326.conditional ~= nil then
        v1327.kind = {
            type = "conditional", 
            value = v2.UDimProp_ConditionalOptions.jsonDecode(v1326.conditional)
        };
    end;
    if v1326.binding_path ~= nil then
        v1327.kind = {
            type = "binding_path", 
            value = v1326.binding_path
        };
    end;
    if v1326.bindingPath ~= nil then
        v1327.kind = {
            type = "binding_path", 
            value = v1326.bindingPath
        };
    end;
    return v1327;
end;
v5.descriptor = {
    name = "UDimProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
};
v2.UDimProp = v5;
v1.default:register(v2.UDimProp);
v5 = {};
v5.__index = v5;
local l_v5_49 = v5 --[[ copy: 5 -> 55 ]];
v5.new = function(v1329) --[[ Line: 9291 ]] --[[ Name: new ]]
    -- upvalues: l_v5_49 (copy)
    return (setmetatable({
        condition = if not (v1329 ~= nil) or v1329.condition == nil then nil else v1329.condition, 
        kind = if not (v1329 ~= nil) or v1329.kind == nil then nil else v1329.kind
    }, l_v5_49));
end;
v5.encode = function(v1330) --[[ Line: 9300 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1331 = buffer.create(0);
    local v1332 = 0;
    if v1330.condition ~= nil then
        local v1333 = v1330.condition:encode();
        local v1334, v1335 = v0.writeTag(v1331, v1332, 1, v0.wireTypes.lengthDelimited);
        v1334, v1335 = v0.writeBuffer(v1334, v1335, v1333, buffer.len(v1333));
        v1331 = v1334;
        v1332 = v1335;
    end;
    if v1330.kind ~= nil then
        if v1330.kind.type == "literal" then
            local v1336, v1337 = v0.writeTag(v1331, v1332, 2, v0.wireTypes.lengthDelimited);
            v1336, v1337 = v0.writeString(v1336, v1337, v1330.kind.value);
            v1331 = v1336;
            v1332 = v1337;
        elseif v1330.kind.type == "token" then
            local v1338, v1339 = v0.writeTag(v1331, v1332, 3, v0.wireTypes.lengthDelimited);
            v1338, v1339 = v0.writeString(v1338, v1339, v1330.kind.value);
            v1331 = v1338;
            v1332 = v1339;
        elseif v1330.kind.type == "binding_path" then
            local v1340, v1341 = v0.writeTag(v1331, v1332, 4, v0.wireTypes.lengthDelimited);
            v1340, v1341 = v0.writeString(v1340, v1341, v1330.kind.value);
            v1331 = v1340;
            v1332 = v1341;
        end;
    end;
    local v1342 = buffer.create(v1332);
    buffer.copy(v1342, 0, v1331, 0, v1332);
    return v1342;
end;
v5.decode = function(v1343) --[[ Line: 9328 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_49 (copy), v0 (copy), v4 (copy)
    local v1344 = l_v5_49.new();
    local v1345 = 0;
    while v1345 < buffer.len(v1343) do
        local v1346 = nil;
        local v1347 = nil;
        local v1348, v1349, v1350 = v0.readTag(v1343, v1345);
        v1346 = v1348;
        v1347 = v1349;
        v1345 = v1350;
        if v1347 == v0.wireTypes.varint then
            v1348 = nil;
            v1349, v1350 = v0.readVarInt(v1343, v1345);
            v1348 = v1349;
            v1345 = v1350;
        elseif v1347 == v0.wireTypes.lengthDelimited then
            if v1346 == 1 then
                v1348 = nil;
                v1349, v1350 = v0.readBuffer(v1343, v1345);
                v1348 = v1349;
                v1345 = v1350;
                v1344.condition = v4.PropCondition.decode(v1348);
            elseif v1346 == 2 then
                v1348 = nil;
                v1349, v1350 = v0.readBuffer(v1343, v1345);
                v1348 = v1349;
                v1345 = v1350;
                v1344.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1348)
                };
            elseif v1346 == 3 then
                v1348 = nil;
                v1349, v1350 = v0.readBuffer(v1343, v1345);
                v1348 = v1349;
                v1345 = v1350;
                v1344.kind = {
                    type = "token", 
                    value = buffer.tostring(v1348)
                };
            elseif v1346 == 4 then
                v1348 = nil;
                v1349, v1350 = v0.readBuffer(v1343, v1345);
                v1348 = v1349;
                v1345 = v1350;
                v1344.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1348)
                };
            else
                v1348 = nil;
                v1349, v1350 = v0.readVarInt(v1343, v1345);
                v1345 = v1350 + v1349;
            end;
        elseif v1347 == v0.wireTypes.i32 then
            v1348 = nil;
            v1349, v1350 = v0.readFixed32(v1343, v1345);
            v1348 = v1349;
            v1345 = v1350;
        elseif v1347 == v0.wireTypes.i64 then
            v1348 = nil;
            v1349, v1350 = v0.readFixed64(v1343, v1345);
            v1348 = v1349;
            v1345 = v1350;
        else
            error("Unsupported wire type: " .. v1347);
        end;
    end;
    return v1344;
end;
v5.jsonEncode = function(v1351) --[[ Line: 9386 ]] --[[ Name: jsonEncode ]]
    local v1352 = {};
    if v1351.condition ~= nil then
        v1352.condition = v1351.condition:jsonEncode();
    end;
    if v1351.kind ~= nil then
        if v1351.kind.type == "literal" then
            v1352.literal = v1351.kind.value;
            return v1352;
        elseif v1351.kind.type == "token" then
            v1352.token = v1351.kind.value;
            return v1352;
        elseif v1351.kind.type == "binding_path" then
            v1352.bindingPath = v1351.kind.value;
        end;
    end;
    return v1352;
end;
v5.jsonDecode = function(v1353) --[[ Line: 9406 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_49 (copy), v4 (copy)
    local v1354 = l_v5_49.new();
    if v1353.condition ~= nil then
        v1354.condition = v4.PropCondition.jsonDecode(v1353.condition);
    end;
    if v1353.literal ~= nil then
        v1354.kind = {
            type = "literal", 
            value = v1353.literal
        };
    end;
    if v1353.token ~= nil then
        v1354.kind = {
            type = "token", 
            value = v1353.token
        };
    end;
    if v1353.binding_path ~= nil then
        v1354.kind = {
            type = "binding_path", 
            value = v1353.binding_path
        };
    end;
    if v1353.bindingPath ~= nil then
        v1354.kind = {
            type = "binding_path", 
            value = v1353.bindingPath
        };
    end;
    return v1354;
end;
v5.descriptor = {
    name = "UDimProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UDimProp_ConditionalOption = v5;
v1.default:register(v2.UDimProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_50 = v5 --[[ copy: 5 -> 56 ]];
v5.new = function(v1356) --[[ Line: 9447 ]] --[[ Name: new ]]
    -- upvalues: l_v5_50 (copy)
    return (setmetatable({
        options = if not (v1356 ~= nil) or v1356.options == nil then {} else v1356.options
    }, l_v5_50));
end;
v5.encode = function(v1357) --[[ Line: 9455 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1358 = buffer.create(0);
    local v1359 = 0;
    if v1357.options ~= nil and #v1357.options > 0 then
        for _, v1361 in v1357.options do
            local v1362 = v1361:encode();
            local v1363, v1364 = v0.writeTag(v1358, v1359, 1, v0.wireTypes.lengthDelimited);
            v1363, v1364 = v0.writeBuffer(v1363, v1364, v1362, buffer.len(v1362));
            v1358 = v1363;
            v1359 = v1364;
        end;
    end;
    local v1365 = buffer.create(v1359);
    buffer.copy(v1365, 0, v1358, 0, v1359);
    return v1365;
end;
v5.decode = function(v1366) --[[ Line: 9472 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_50 (copy), v0 (copy), v2 (copy)
    local v1367 = l_v5_50.new();
    local v1368 = 0;
    while v1368 < buffer.len(v1366) do
        local v1369 = nil;
        local v1370 = nil;
        local v1371, v1372, v1373 = v0.readTag(v1366, v1368);
        v1369 = v1371;
        v1370 = v1372;
        v1368 = v1373;
        if v1370 == v0.wireTypes.varint then
            v1371 = nil;
            v1372, v1373 = v0.readVarInt(v1366, v1368);
            v1371 = v1372;
            v1368 = v1373;
        elseif v1370 == v0.wireTypes.lengthDelimited then
            if v1369 == 1 then
                v1371 = nil;
                v1372, v1373 = v0.readBuffer(v1366, v1368);
                v1371 = v1372;
                v1368 = v1373;
                table.insert(v1367.options, v2.UDimProp_ConditionalOption.decode(v1371));
            else
                v1371 = nil;
                v1372, v1373 = v0.readVarInt(v1366, v1368);
                v1368 = v1373 + v1372;
            end;
        elseif v1370 == v0.wireTypes.i32 then
            v1371 = nil;
            v1372, v1373 = v0.readFixed32(v1366, v1368);
            v1371 = v1372;
            v1368 = v1373;
        elseif v1370 == v0.wireTypes.i64 then
            v1371 = nil;
            v1372, v1373 = v0.readFixed64(v1366, v1368);
            v1371 = v1372;
            v1368 = v1373;
        else
            error("Unsupported wire type: " .. v1370);
        end;
    end;
    return v1367;
end;
v5.jsonEncode = function(v1374) --[[ Line: 9515 ]] --[[ Name: jsonEncode ]]
    local v1375 = {};
    if v1374.options ~= nil and #v1374.options > 0 then
        local v1376 = {};
        for _, v1378 in v1374.options do
            table.insert(v1376, v1378:jsonEncode());
        end;
        v1375.options = v1376;
    end;
    return v1375;
end;
v5.jsonDecode = function(v1379) --[[ Line: 9529 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_50 (copy), v2 (copy)
    local v1380 = l_v5_50.new();
    if v1379.options ~= nil then
        local v1381 = {};
        for _, v1383 in v1379.options do
            table.insert(v1381, v2.UDimProp_ConditionalOption.jsonDecode(v1383));
        end;
        v1380.options = v1381;
    end;
    return v1380;
end;
v5.descriptor = {
    name = "UDimProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UDimProp_ConditionalOptions = v5;
v1.default:register(v2.UDimProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_51 = v5 --[[ copy: 5 -> 57 ]];
v5.new = function(v1385) --[[ Line: 9558 ]] --[[ Name: new ]]
    -- upvalues: l_v5_51 (copy)
    return (setmetatable({
        kind = if not (v1385 ~= nil) or v1385.kind == nil then nil else v1385.kind
    }, l_v5_51));
end;
v5.encode = function(v1386) --[[ Line: 9564 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1387 = buffer.create(0);
    local v1388 = 0;
    if v1386.kind ~= nil then
        if v1386.kind.type == "literal" then
            local v1389, v1390 = v0.writeTag(v1387, v1388, 1, v0.wireTypes.lengthDelimited);
            v1389, v1390 = v0.writeString(v1389, v1390, v1386.kind.value);
            v1387 = v1389;
            v1388 = v1390;
        elseif v1386.kind.type == "token" then
            local v1391, v1392 = v0.writeTag(v1387, v1388, 2, v0.wireTypes.lengthDelimited);
            v1391, v1392 = v0.writeString(v1391, v1392, v1386.kind.value);
            v1387 = v1391;
            v1388 = v1392;
        elseif v1386.kind.type == "conditional" then
            local v1393 = v1386.kind.value:encode();
            local v1394, v1395 = v0.writeTag(v1387, v1388, 3, v0.wireTypes.lengthDelimited);
            v1394, v1395 = v0.writeBuffer(v1394, v1395, v1393, buffer.len(v1393));
            v1387 = v1394;
            v1388 = v1395;
        elseif v1386.kind.type == "binding_path" then
            local v1396, v1397 = v0.writeTag(v1387, v1388, 4, v0.wireTypes.lengthDelimited);
            v1396, v1397 = v0.writeString(v1396, v1397, v1386.kind.value);
            v1387 = v1396;
            v1388 = v1397;
        end;
    end;
    local v1398 = buffer.create(v1388);
    buffer.copy(v1398, 0, v1387, 0, v1388);
    return v1398;
end;
v5.decode = function(v1399) --[[ Line: 9590 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_51 (copy), v0 (copy), v2 (copy)
    local v1400 = l_v5_51.new();
    local v1401 = 0;
    while v1401 < buffer.len(v1399) do
        local v1402 = nil;
        local v1403 = nil;
        local v1404, v1405, v1406 = v0.readTag(v1399, v1401);
        v1402 = v1404;
        v1403 = v1405;
        v1401 = v1406;
        if v1403 == v0.wireTypes.varint then
            v1404 = nil;
            v1405, v1406 = v0.readVarInt(v1399, v1401);
            v1404 = v1405;
            v1401 = v1406;
        elseif v1403 == v0.wireTypes.lengthDelimited then
            if v1402 == 1 then
                v1404 = nil;
                v1405, v1406 = v0.readBuffer(v1399, v1401);
                v1404 = v1405;
                v1401 = v1406;
                v1400.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1404)
                };
            elseif v1402 == 2 then
                v1404 = nil;
                v1405, v1406 = v0.readBuffer(v1399, v1401);
                v1404 = v1405;
                v1401 = v1406;
                v1400.kind = {
                    type = "token", 
                    value = buffer.tostring(v1404)
                };
            elseif v1402 == 3 then
                v1404 = nil;
                v1405, v1406 = v0.readBuffer(v1399, v1401);
                v1404 = v1405;
                v1401 = v1406;
                v1400.kind = {
                    type = "conditional", 
                    value = v2.UDim2Prop_ConditionalOptions.decode(v1404)
                };
            elseif v1402 == 4 then
                v1404 = nil;
                v1405, v1406 = v0.readBuffer(v1399, v1401);
                v1404 = v1405;
                v1401 = v1406;
                v1400.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1404)
                };
            else
                v1404 = nil;
                v1405, v1406 = v0.readVarInt(v1399, v1401);
                v1401 = v1406 + v1405;
            end;
        elseif v1403 == v0.wireTypes.i32 then
            v1404 = nil;
            v1405, v1406 = v0.readFixed32(v1399, v1401);
            v1404 = v1405;
            v1401 = v1406;
        elseif v1403 == v0.wireTypes.i64 then
            v1404 = nil;
            v1405, v1406 = v0.readFixed64(v1399, v1401);
            v1404 = v1405;
            v1401 = v1406;
        else
            error("Unsupported wire type: " .. v1403);
        end;
    end;
    return v1400;
end;
v5.jsonEncode = function(v1407) --[[ Line: 9648 ]] --[[ Name: jsonEncode ]]
    local v1408 = {};
    if v1407.kind ~= nil then
        if v1407.kind.type == "literal" then
            v1408.literal = v1407.kind.value;
            return v1408;
        elseif v1407.kind.type == "token" then
            v1408.token = v1407.kind.value;
            return v1408;
        elseif v1407.kind.type == "conditional" then
            v1408.conditional = v1407.kind.value:jsonEncode();
            return v1408;
        elseif v1407.kind.type == "binding_path" then
            v1408.bindingPath = v1407.kind.value;
        end;
    end;
    return v1408;
end;
v5.jsonDecode = function(v1409) --[[ Line: 9666 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_51 (copy), v2 (copy)
    local v1410 = l_v5_51.new();
    if v1409.literal ~= nil then
        v1410.kind = {
            type = "literal", 
            value = v1409.literal
        };
    end;
    if v1409.token ~= nil then
        v1410.kind = {
            type = "token", 
            value = v1409.token
        };
    end;
    if v1409.conditional ~= nil then
        v1410.kind = {
            type = "conditional", 
            value = v2.UDim2Prop_ConditionalOptions.jsonDecode(v1409.conditional)
        };
    end;
    if v1409.binding_path ~= nil then
        v1410.kind = {
            type = "binding_path", 
            value = v1409.binding_path
        };
    end;
    if v1409.bindingPath ~= nil then
        v1410.kind = {
            type = "binding_path", 
            value = v1409.bindingPath
        };
    end;
    return v1410;
end;
v5.descriptor = {
    name = "UDim2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
};
v2.UDim2Prop = v5;
v1.default:register(v2.UDim2Prop);
v5 = {};
v5.__index = v5;
local l_v5_52 = v5 --[[ copy: 5 -> 58 ]];
v5.new = function(v1412) --[[ Line: 9707 ]] --[[ Name: new ]]
    -- upvalues: l_v5_52 (copy)
    return (setmetatable({
        condition = if not (v1412 ~= nil) or v1412.condition == nil then nil else v1412.condition, 
        kind = if not (v1412 ~= nil) or v1412.kind == nil then nil else v1412.kind
    }, l_v5_52));
end;
v5.encode = function(v1413) --[[ Line: 9716 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1414 = buffer.create(0);
    local v1415 = 0;
    if v1413.condition ~= nil then
        local v1416 = v1413.condition:encode();
        local v1417, v1418 = v0.writeTag(v1414, v1415, 1, v0.wireTypes.lengthDelimited);
        v1417, v1418 = v0.writeBuffer(v1417, v1418, v1416, buffer.len(v1416));
        v1414 = v1417;
        v1415 = v1418;
    end;
    if v1413.kind ~= nil then
        if v1413.kind.type == "literal" then
            local v1419, v1420 = v0.writeTag(v1414, v1415, 2, v0.wireTypes.lengthDelimited);
            v1419, v1420 = v0.writeString(v1419, v1420, v1413.kind.value);
            v1414 = v1419;
            v1415 = v1420;
        elseif v1413.kind.type == "token" then
            local v1421, v1422 = v0.writeTag(v1414, v1415, 3, v0.wireTypes.lengthDelimited);
            v1421, v1422 = v0.writeString(v1421, v1422, v1413.kind.value);
            v1414 = v1421;
            v1415 = v1422;
        elseif v1413.kind.type == "binding_path" then
            local v1423, v1424 = v0.writeTag(v1414, v1415, 4, v0.wireTypes.lengthDelimited);
            v1423, v1424 = v0.writeString(v1423, v1424, v1413.kind.value);
            v1414 = v1423;
            v1415 = v1424;
        end;
    end;
    local v1425 = buffer.create(v1415);
    buffer.copy(v1425, 0, v1414, 0, v1415);
    return v1425;
end;
v5.decode = function(v1426) --[[ Line: 9744 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_52 (copy), v0 (copy), v4 (copy)
    local v1427 = l_v5_52.new();
    local v1428 = 0;
    while v1428 < buffer.len(v1426) do
        local v1429 = nil;
        local v1430 = nil;
        local v1431, v1432, v1433 = v0.readTag(v1426, v1428);
        v1429 = v1431;
        v1430 = v1432;
        v1428 = v1433;
        if v1430 == v0.wireTypes.varint then
            v1431 = nil;
            v1432, v1433 = v0.readVarInt(v1426, v1428);
            v1431 = v1432;
            v1428 = v1433;
        elseif v1430 == v0.wireTypes.lengthDelimited then
            if v1429 == 1 then
                v1431 = nil;
                v1432, v1433 = v0.readBuffer(v1426, v1428);
                v1431 = v1432;
                v1428 = v1433;
                v1427.condition = v4.PropCondition.decode(v1431);
            elseif v1429 == 2 then
                v1431 = nil;
                v1432, v1433 = v0.readBuffer(v1426, v1428);
                v1431 = v1432;
                v1428 = v1433;
                v1427.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1431)
                };
            elseif v1429 == 3 then
                v1431 = nil;
                v1432, v1433 = v0.readBuffer(v1426, v1428);
                v1431 = v1432;
                v1428 = v1433;
                v1427.kind = {
                    type = "token", 
                    value = buffer.tostring(v1431)
                };
            elseif v1429 == 4 then
                v1431 = nil;
                v1432, v1433 = v0.readBuffer(v1426, v1428);
                v1431 = v1432;
                v1428 = v1433;
                v1427.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1431)
                };
            else
                v1431 = nil;
                v1432, v1433 = v0.readVarInt(v1426, v1428);
                v1428 = v1433 + v1432;
            end;
        elseif v1430 == v0.wireTypes.i32 then
            v1431 = nil;
            v1432, v1433 = v0.readFixed32(v1426, v1428);
            v1431 = v1432;
            v1428 = v1433;
        elseif v1430 == v0.wireTypes.i64 then
            v1431 = nil;
            v1432, v1433 = v0.readFixed64(v1426, v1428);
            v1431 = v1432;
            v1428 = v1433;
        else
            error("Unsupported wire type: " .. v1430);
        end;
    end;
    return v1427;
end;
v5.jsonEncode = function(v1434) --[[ Line: 9802 ]] --[[ Name: jsonEncode ]]
    local v1435 = {};
    if v1434.condition ~= nil then
        v1435.condition = v1434.condition:jsonEncode();
    end;
    if v1434.kind ~= nil then
        if v1434.kind.type == "literal" then
            v1435.literal = v1434.kind.value;
            return v1435;
        elseif v1434.kind.type == "token" then
            v1435.token = v1434.kind.value;
            return v1435;
        elseif v1434.kind.type == "binding_path" then
            v1435.bindingPath = v1434.kind.value;
        end;
    end;
    return v1435;
end;
v5.jsonDecode = function(v1436) --[[ Line: 9822 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_52 (copy), v4 (copy)
    local v1437 = l_v5_52.new();
    if v1436.condition ~= nil then
        v1437.condition = v4.PropCondition.jsonDecode(v1436.condition);
    end;
    if v1436.literal ~= nil then
        v1437.kind = {
            type = "literal", 
            value = v1436.literal
        };
    end;
    if v1436.token ~= nil then
        v1437.kind = {
            type = "token", 
            value = v1436.token
        };
    end;
    if v1436.binding_path ~= nil then
        v1437.kind = {
            type = "binding_path", 
            value = v1436.binding_path
        };
    end;
    if v1436.bindingPath ~= nil then
        v1437.kind = {
            type = "binding_path", 
            value = v1436.bindingPath
        };
    end;
    return v1437;
end;
v5.descriptor = {
    name = "UDim2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UDim2Prop_ConditionalOption = v5;
v1.default:register(v2.UDim2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_53 = v5 --[[ copy: 5 -> 59 ]];
v5.new = function(v1439) --[[ Line: 9863 ]] --[[ Name: new ]]
    -- upvalues: l_v5_53 (copy)
    return (setmetatable({
        options = if not (v1439 ~= nil) or v1439.options == nil then {} else v1439.options
    }, l_v5_53));
end;
v5.encode = function(v1440) --[[ Line: 9871 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1441 = buffer.create(0);
    local v1442 = 0;
    if v1440.options ~= nil and #v1440.options > 0 then
        for _, v1444 in v1440.options do
            local v1445 = v1444:encode();
            local v1446, v1447 = v0.writeTag(v1441, v1442, 1, v0.wireTypes.lengthDelimited);
            v1446, v1447 = v0.writeBuffer(v1446, v1447, v1445, buffer.len(v1445));
            v1441 = v1446;
            v1442 = v1447;
        end;
    end;
    local v1448 = buffer.create(v1442);
    buffer.copy(v1448, 0, v1441, 0, v1442);
    return v1448;
end;
v5.decode = function(v1449) --[[ Line: 9888 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_53 (copy), v0 (copy), v2 (copy)
    local v1450 = l_v5_53.new();
    local v1451 = 0;
    while v1451 < buffer.len(v1449) do
        local v1452 = nil;
        local v1453 = nil;
        local v1454, v1455, v1456 = v0.readTag(v1449, v1451);
        v1452 = v1454;
        v1453 = v1455;
        v1451 = v1456;
        if v1453 == v0.wireTypes.varint then
            v1454 = nil;
            v1455, v1456 = v0.readVarInt(v1449, v1451);
            v1454 = v1455;
            v1451 = v1456;
        elseif v1453 == v0.wireTypes.lengthDelimited then
            if v1452 == 1 then
                v1454 = nil;
                v1455, v1456 = v0.readBuffer(v1449, v1451);
                v1454 = v1455;
                v1451 = v1456;
                table.insert(v1450.options, v2.UDim2Prop_ConditionalOption.decode(v1454));
            else
                v1454 = nil;
                v1455, v1456 = v0.readVarInt(v1449, v1451);
                v1451 = v1456 + v1455;
            end;
        elseif v1453 == v0.wireTypes.i32 then
            v1454 = nil;
            v1455, v1456 = v0.readFixed32(v1449, v1451);
            v1454 = v1455;
            v1451 = v1456;
        elseif v1453 == v0.wireTypes.i64 then
            v1454 = nil;
            v1455, v1456 = v0.readFixed64(v1449, v1451);
            v1454 = v1455;
            v1451 = v1456;
        else
            error("Unsupported wire type: " .. v1453);
        end;
    end;
    return v1450;
end;
v5.jsonEncode = function(v1457) --[[ Line: 9931 ]] --[[ Name: jsonEncode ]]
    local v1458 = {};
    if v1457.options ~= nil and #v1457.options > 0 then
        local v1459 = {};
        for _, v1461 in v1457.options do
            table.insert(v1459, v1461:jsonEncode());
        end;
        v1458.options = v1459;
    end;
    return v1458;
end;
v5.jsonDecode = function(v1462) --[[ Line: 9945 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_53 (copy), v2 (copy)
    local v1463 = l_v5_53.new();
    if v1462.options ~= nil then
        local v1464 = {};
        for _, v1466 in v1462.options do
            table.insert(v1464, v2.UDim2Prop_ConditionalOption.jsonDecode(v1466));
        end;
        v1463.options = v1464;
    end;
    return v1463;
end;
v5.descriptor = {
    name = "UDim2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UDim2Prop_ConditionalOptions = v5;
v1.default:register(v2.UDim2Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_54 = v5 --[[ copy: 5 -> 60 ]];
v5.new = function(v1468) --[[ Line: 9974 ]] --[[ Name: new ]]
    -- upvalues: l_v5_54 (copy)
    return (setmetatable({
        kind = if not (v1468 ~= nil) or v1468.kind == nil then nil else v1468.kind
    }, l_v5_54));
end;
v5.encode = function(v1469) --[[ Line: 9980 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1470 = buffer.create(0);
    local v1471 = 0;
    if v1469.kind ~= nil then
        if v1469.kind.type == "literal" then
            local v1472, v1473 = v0.writeTag(v1470, v1471, 1, v0.wireTypes.lengthDelimited);
            v1472, v1473 = v0.writeString(v1472, v1473, v1469.kind.value);
            v1470 = v1472;
            v1471 = v1473;
        elseif v1469.kind.type == "token" then
            local v1474, v1475 = v0.writeTag(v1470, v1471, 2, v0.wireTypes.lengthDelimited);
            v1474, v1475 = v0.writeString(v1474, v1475, v1469.kind.value);
            v1470 = v1474;
            v1471 = v1475;
        elseif v1469.kind.type == "conditional" then
            local v1476 = v1469.kind.value:encode();
            local v1477, v1478 = v0.writeTag(v1470, v1471, 3, v0.wireTypes.lengthDelimited);
            v1477, v1478 = v0.writeBuffer(v1477, v1478, v1476, buffer.len(v1476));
            v1470 = v1477;
            v1471 = v1478;
        elseif v1469.kind.type == "binding_path" then
            local v1479, v1480 = v0.writeTag(v1470, v1471, 4, v0.wireTypes.lengthDelimited);
            v1479, v1480 = v0.writeString(v1479, v1480, v1469.kind.value);
            v1470 = v1479;
            v1471 = v1480;
        end;
    end;
    local v1481 = buffer.create(v1471);
    buffer.copy(v1481, 0, v1470, 0, v1471);
    return v1481;
end;
v5.decode = function(v1482) --[[ Line: 10006 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_54 (copy), v0 (copy), v2 (copy)
    local v1483 = l_v5_54.new();
    local v1484 = 0;
    while v1484 < buffer.len(v1482) do
        local v1485 = nil;
        local v1486 = nil;
        local v1487, v1488, v1489 = v0.readTag(v1482, v1484);
        v1485 = v1487;
        v1486 = v1488;
        v1484 = v1489;
        if v1486 == v0.wireTypes.varint then
            v1487 = nil;
            v1488, v1489 = v0.readVarInt(v1482, v1484);
            v1487 = v1488;
            v1484 = v1489;
        elseif v1486 == v0.wireTypes.lengthDelimited then
            if v1485 == 1 then
                v1487 = nil;
                v1488, v1489 = v0.readBuffer(v1482, v1484);
                v1487 = v1488;
                v1484 = v1489;
                v1483.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1487)
                };
            elseif v1485 == 2 then
                v1487 = nil;
                v1488, v1489 = v0.readBuffer(v1482, v1484);
                v1487 = v1488;
                v1484 = v1489;
                v1483.kind = {
                    type = "token", 
                    value = buffer.tostring(v1487)
                };
            elseif v1485 == 3 then
                v1487 = nil;
                v1488, v1489 = v0.readBuffer(v1482, v1484);
                v1487 = v1488;
                v1484 = v1489;
                v1483.kind = {
                    type = "conditional", 
                    value = v2.Vector2Prop_ConditionalOptions.decode(v1487)
                };
            elseif v1485 == 4 then
                v1487 = nil;
                v1488, v1489 = v0.readBuffer(v1482, v1484);
                v1487 = v1488;
                v1484 = v1489;
                v1483.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1487)
                };
            else
                v1487 = nil;
                v1488, v1489 = v0.readVarInt(v1482, v1484);
                v1484 = v1489 + v1488;
            end;
        elseif v1486 == v0.wireTypes.i32 then
            v1487 = nil;
            v1488, v1489 = v0.readFixed32(v1482, v1484);
            v1487 = v1488;
            v1484 = v1489;
        elseif v1486 == v0.wireTypes.i64 then
            v1487 = nil;
            v1488, v1489 = v0.readFixed64(v1482, v1484);
            v1487 = v1488;
            v1484 = v1489;
        else
            error("Unsupported wire type: " .. v1486);
        end;
    end;
    return v1483;
end;
v5.jsonEncode = function(v1490) --[[ Line: 10064 ]] --[[ Name: jsonEncode ]]
    local v1491 = {};
    if v1490.kind ~= nil then
        if v1490.kind.type == "literal" then
            v1491.literal = v1490.kind.value;
            return v1491;
        elseif v1490.kind.type == "token" then
            v1491.token = v1490.kind.value;
            return v1491;
        elseif v1490.kind.type == "conditional" then
            v1491.conditional = v1490.kind.value:jsonEncode();
            return v1491;
        elseif v1490.kind.type == "binding_path" then
            v1491.bindingPath = v1490.kind.value;
        end;
    end;
    return v1491;
end;
v5.jsonDecode = function(v1492) --[[ Line: 10082 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_54 (copy), v2 (copy)
    local v1493 = l_v5_54.new();
    if v1492.literal ~= nil then
        v1493.kind = {
            type = "literal", 
            value = v1492.literal
        };
    end;
    if v1492.token ~= nil then
        v1493.kind = {
            type = "token", 
            value = v1492.token
        };
    end;
    if v1492.conditional ~= nil then
        v1493.kind = {
            type = "conditional", 
            value = v2.Vector2Prop_ConditionalOptions.jsonDecode(v1492.conditional)
        };
    end;
    if v1492.binding_path ~= nil then
        v1493.kind = {
            type = "binding_path", 
            value = v1492.binding_path
        };
    end;
    if v1492.bindingPath ~= nil then
        v1493.kind = {
            type = "binding_path", 
            value = v1492.bindingPath
        };
    end;
    return v1493;
end;
v5.descriptor = {
    name = "Vector2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
};
v2.Vector2Prop = v5;
v1.default:register(v2.Vector2Prop);
v5 = {};
v5.__index = v5;
local l_v5_55 = v5 --[[ copy: 5 -> 61 ]];
v5.new = function(v1495) --[[ Line: 10123 ]] --[[ Name: new ]]
    -- upvalues: l_v5_55 (copy)
    return (setmetatable({
        condition = if not (v1495 ~= nil) or v1495.condition == nil then nil else v1495.condition, 
        kind = if not (v1495 ~= nil) or v1495.kind == nil then nil else v1495.kind
    }, l_v5_55));
end;
v5.encode = function(v1496) --[[ Line: 10132 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1497 = buffer.create(0);
    local v1498 = 0;
    if v1496.condition ~= nil then
        local v1499 = v1496.condition:encode();
        local v1500, v1501 = v0.writeTag(v1497, v1498, 1, v0.wireTypes.lengthDelimited);
        v1500, v1501 = v0.writeBuffer(v1500, v1501, v1499, buffer.len(v1499));
        v1497 = v1500;
        v1498 = v1501;
    end;
    if v1496.kind ~= nil then
        if v1496.kind.type == "literal" then
            local v1502, v1503 = v0.writeTag(v1497, v1498, 2, v0.wireTypes.lengthDelimited);
            v1502, v1503 = v0.writeString(v1502, v1503, v1496.kind.value);
            v1497 = v1502;
            v1498 = v1503;
        elseif v1496.kind.type == "token" then
            local v1504, v1505 = v0.writeTag(v1497, v1498, 3, v0.wireTypes.lengthDelimited);
            v1504, v1505 = v0.writeString(v1504, v1505, v1496.kind.value);
            v1497 = v1504;
            v1498 = v1505;
        elseif v1496.kind.type == "binding_path" then
            local v1506, v1507 = v0.writeTag(v1497, v1498, 4, v0.wireTypes.lengthDelimited);
            v1506, v1507 = v0.writeString(v1506, v1507, v1496.kind.value);
            v1497 = v1506;
            v1498 = v1507;
        end;
    end;
    local v1508 = buffer.create(v1498);
    buffer.copy(v1508, 0, v1497, 0, v1498);
    return v1508;
end;
v5.decode = function(v1509) --[[ Line: 10160 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_55 (copy), v0 (copy), v4 (copy)
    local v1510 = l_v5_55.new();
    local v1511 = 0;
    while v1511 < buffer.len(v1509) do
        local v1512 = nil;
        local v1513 = nil;
        local v1514, v1515, v1516 = v0.readTag(v1509, v1511);
        v1512 = v1514;
        v1513 = v1515;
        v1511 = v1516;
        if v1513 == v0.wireTypes.varint then
            v1514 = nil;
            v1515, v1516 = v0.readVarInt(v1509, v1511);
            v1514 = v1515;
            v1511 = v1516;
        elseif v1513 == v0.wireTypes.lengthDelimited then
            if v1512 == 1 then
                v1514 = nil;
                v1515, v1516 = v0.readBuffer(v1509, v1511);
                v1514 = v1515;
                v1511 = v1516;
                v1510.condition = v4.PropCondition.decode(v1514);
            elseif v1512 == 2 then
                v1514 = nil;
                v1515, v1516 = v0.readBuffer(v1509, v1511);
                v1514 = v1515;
                v1511 = v1516;
                v1510.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1514)
                };
            elseif v1512 == 3 then
                v1514 = nil;
                v1515, v1516 = v0.readBuffer(v1509, v1511);
                v1514 = v1515;
                v1511 = v1516;
                v1510.kind = {
                    type = "token", 
                    value = buffer.tostring(v1514)
                };
            elseif v1512 == 4 then
                v1514 = nil;
                v1515, v1516 = v0.readBuffer(v1509, v1511);
                v1514 = v1515;
                v1511 = v1516;
                v1510.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1514)
                };
            else
                v1514 = nil;
                v1515, v1516 = v0.readVarInt(v1509, v1511);
                v1511 = v1516 + v1515;
            end;
        elseif v1513 == v0.wireTypes.i32 then
            v1514 = nil;
            v1515, v1516 = v0.readFixed32(v1509, v1511);
            v1514 = v1515;
            v1511 = v1516;
        elseif v1513 == v0.wireTypes.i64 then
            v1514 = nil;
            v1515, v1516 = v0.readFixed64(v1509, v1511);
            v1514 = v1515;
            v1511 = v1516;
        else
            error("Unsupported wire type: " .. v1513);
        end;
    end;
    return v1510;
end;
v5.jsonEncode = function(v1517) --[[ Line: 10218 ]] --[[ Name: jsonEncode ]]
    local v1518 = {};
    if v1517.condition ~= nil then
        v1518.condition = v1517.condition:jsonEncode();
    end;
    if v1517.kind ~= nil then
        if v1517.kind.type == "literal" then
            v1518.literal = v1517.kind.value;
            return v1518;
        elseif v1517.kind.type == "token" then
            v1518.token = v1517.kind.value;
            return v1518;
        elseif v1517.kind.type == "binding_path" then
            v1518.bindingPath = v1517.kind.value;
        end;
    end;
    return v1518;
end;
v5.jsonDecode = function(v1519) --[[ Line: 10238 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_55 (copy), v4 (copy)
    local v1520 = l_v5_55.new();
    if v1519.condition ~= nil then
        v1520.condition = v4.PropCondition.jsonDecode(v1519.condition);
    end;
    if v1519.literal ~= nil then
        v1520.kind = {
            type = "literal", 
            value = v1519.literal
        };
    end;
    if v1519.token ~= nil then
        v1520.kind = {
            type = "token", 
            value = v1519.token
        };
    end;
    if v1519.binding_path ~= nil then
        v1520.kind = {
            type = "binding_path", 
            value = v1519.binding_path
        };
    end;
    if v1519.bindingPath ~= nil then
        v1520.kind = {
            type = "binding_path", 
            value = v1519.bindingPath
        };
    end;
    return v1520;
end;
v5.descriptor = {
    name = "Vector2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.Vector2Prop_ConditionalOption = v5;
v1.default:register(v2.Vector2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_56 = v5 --[[ copy: 5 -> 62 ]];
v5.new = function(v1522) --[[ Line: 10279 ]] --[[ Name: new ]]
    -- upvalues: l_v5_56 (copy)
    return (setmetatable({
        options = if not (v1522 ~= nil) or v1522.options == nil then {} else v1522.options
    }, l_v5_56));
end;
v5.encode = function(v1523) --[[ Line: 10287 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1524 = buffer.create(0);
    local v1525 = 0;
    if v1523.options ~= nil and #v1523.options > 0 then
        for _, v1527 in v1523.options do
            local v1528 = v1527:encode();
            local v1529, v1530 = v0.writeTag(v1524, v1525, 1, v0.wireTypes.lengthDelimited);
            v1529, v1530 = v0.writeBuffer(v1529, v1530, v1528, buffer.len(v1528));
            v1524 = v1529;
            v1525 = v1530;
        end;
    end;
    local v1531 = buffer.create(v1525);
    buffer.copy(v1531, 0, v1524, 0, v1525);
    return v1531;
end;
v5.decode = function(v1532) --[[ Line: 10304 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_56 (copy), v0 (copy), v2 (copy)
    local v1533 = l_v5_56.new();
    local v1534 = 0;
    while v1534 < buffer.len(v1532) do
        local v1535 = nil;
        local v1536 = nil;
        local v1537, v1538, v1539 = v0.readTag(v1532, v1534);
        v1535 = v1537;
        v1536 = v1538;
        v1534 = v1539;
        if v1536 == v0.wireTypes.varint then
            v1537 = nil;
            v1538, v1539 = v0.readVarInt(v1532, v1534);
            v1537 = v1538;
            v1534 = v1539;
        elseif v1536 == v0.wireTypes.lengthDelimited then
            if v1535 == 1 then
                v1537 = nil;
                v1538, v1539 = v0.readBuffer(v1532, v1534);
                v1537 = v1538;
                v1534 = v1539;
                table.insert(v1533.options, v2.Vector2Prop_ConditionalOption.decode(v1537));
            else
                v1537 = nil;
                v1538, v1539 = v0.readVarInt(v1532, v1534);
                v1534 = v1539 + v1538;
            end;
        elseif v1536 == v0.wireTypes.i32 then
            v1537 = nil;
            v1538, v1539 = v0.readFixed32(v1532, v1534);
            v1537 = v1538;
            v1534 = v1539;
        elseif v1536 == v0.wireTypes.i64 then
            v1537 = nil;
            v1538, v1539 = v0.readFixed64(v1532, v1534);
            v1537 = v1538;
            v1534 = v1539;
        else
            error("Unsupported wire type: " .. v1536);
        end;
    end;
    return v1533;
end;
v5.jsonEncode = function(v1540) --[[ Line: 10347 ]] --[[ Name: jsonEncode ]]
    local v1541 = {};
    if v1540.options ~= nil and #v1540.options > 0 then
        local v1542 = {};
        for _, v1544 in v1540.options do
            table.insert(v1542, v1544:jsonEncode());
        end;
        v1541.options = v1542;
    end;
    return v1541;
end;
v5.jsonDecode = function(v1545) --[[ Line: 10361 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_56 (copy), v2 (copy)
    local v1546 = l_v5_56.new();
    if v1545.options ~= nil then
        local v1547 = {};
        for _, v1549 in v1545.options do
            table.insert(v1547, v2.Vector2Prop_ConditionalOption.jsonDecode(v1549));
        end;
        v1546.options = v1547;
    end;
    return v1546;
end;
v5.descriptor = {
    name = "Vector2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.Vector2Prop_ConditionalOptions = v5;
v1.default:register(v2.Vector2Prop_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_57 = v5 --[[ copy: 5 -> 63 ]];
v5.new = function(v1551) --[[ Line: 10390 ]] --[[ Name: new ]]
    -- upvalues: l_v5_57 (copy)
    return (setmetatable({
        kind = if not (v1551 ~= nil) or v1551.kind == nil then nil else v1551.kind
    }, l_v5_57));
end;
v5.encode = function(v1552) --[[ Line: 10396 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1553 = buffer.create(0);
    local v1554 = 0;
    if v1552.kind ~= nil then
        if v1552.kind.type == "literal" then
            local v1555 = v1552.kind.value:encode();
            local v1556, v1557 = v0.writeTag(v1553, v1554, 1, v0.wireTypes.lengthDelimited);
            v1556, v1557 = v0.writeBuffer(v1556, v1557, v1555, buffer.len(v1555));
            v1553 = v1556;
            v1554 = v1557;
        elseif v1552.kind.type == "binding_path" then
            local v1558, v1559 = v0.writeTag(v1553, v1554, 2, v0.wireTypes.lengthDelimited);
            v1558, v1559 = v0.writeString(v1558, v1559, v1552.kind.value);
            v1553 = v1558;
            v1554 = v1559;
        end;
    end;
    local v1560 = buffer.create(v1554);
    buffer.copy(v1560, 0, v1553, 0, v1554);
    return v1560;
end;
v5.decode = function(v1561) --[[ Line: 10416 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_57 (copy), v0 (copy), v2 (copy)
    local v1562 = l_v5_57.new();
    local v1563 = 0;
    while v1563 < buffer.len(v1561) do
        local v1564 = nil;
        local v1565 = nil;
        local v1566, v1567, v1568 = v0.readTag(v1561, v1563);
        v1564 = v1566;
        v1565 = v1567;
        v1563 = v1568;
        if v1565 == v0.wireTypes.varint then
            v1566 = nil;
            v1567, v1568 = v0.readVarInt(v1561, v1563);
            v1566 = v1567;
            v1563 = v1568;
        elseif v1565 == v0.wireTypes.lengthDelimited then
            if v1564 == 1 then
                v1566 = nil;
                v1567, v1568 = v0.readBuffer(v1561, v1563);
                v1566 = v1567;
                v1563 = v1568;
                v1562.kind = {
                    type = "literal", 
                    value = v2.TemplateArg_LiteralValue.decode(v1566)
                };
            elseif v1564 == 2 then
                v1566 = nil;
                v1567, v1568 = v0.readBuffer(v1561, v1563);
                v1566 = v1567;
                v1563 = v1568;
                v1562.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1566)
                };
            else
                v1566 = nil;
                v1567, v1568 = v0.readVarInt(v1561, v1563);
                v1563 = v1568 + v1567;
            end;
        elseif v1565 == v0.wireTypes.i32 then
            v1566 = nil;
            v1567, v1568 = v0.readFixed32(v1561, v1563);
            v1566 = v1567;
            v1563 = v1568;
        elseif v1565 == v0.wireTypes.i64 then
            v1566 = nil;
            v1567, v1568 = v0.readFixed64(v1561, v1563);
            v1566 = v1567;
            v1563 = v1568;
        else
            error("Unsupported wire type: " .. v1565);
        end;
    end;
    return v1562;
end;
v5.jsonEncode = function(v1569) --[[ Line: 10464 ]] --[[ Name: jsonEncode ]]
    local v1570 = {};
    if v1569.kind ~= nil then
        if v1569.kind.type == "literal" then
            v1570.literal = v1569.kind.value:jsonEncode();
            return v1570;
        elseif v1569.kind.type == "binding_path" then
            v1570.bindingPath = v1569.kind.value;
        end;
    end;
    return v1570;
end;
v5.jsonDecode = function(v1571) --[[ Line: 10478 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_57 (copy), v2 (copy)
    local v1572 = l_v5_57.new();
    if v1571.literal ~= nil then
        v1572.kind = {
            type = "literal", 
            value = v2.TemplateArg_LiteralValue.jsonDecode(v1571.literal)
        };
    end;
    if v1571.binding_path ~= nil then
        v1572.kind = {
            type = "binding_path", 
            value = v1571.binding_path
        };
    end;
    if v1571.bindingPath ~= nil then
        v1572.kind = {
            type = "binding_path", 
            value = v1571.bindingPath
        };
    end;
    return v1572;
end;
v5.descriptor = {
    name = "TemplateArg", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateArg"
};
v2.TemplateArg = v5;
v1.default:register(v2.TemplateArg);
v5 = {};
v5.__index = v5;
local l_v5_58 = v5 --[[ copy: 5 -> 64 ]];
v5.new = function(v1574) --[[ Line: 10510 ]] --[[ Name: new ]]
    -- upvalues: l_v5_58 (copy)
    return (setmetatable({
        kind = if not (v1574 ~= nil) or v1574.kind == nil then nil else v1574.kind
    }, l_v5_58));
end;
v5.encode = function(v1575) --[[ Line: 10516 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1576 = buffer.create(0);
    local v1577 = 0;
    if v1575.kind ~= nil then
        if v1575.kind.type == "string_value" then
            local v1578, v1579 = v0.writeTag(v1576, v1577, 1, v0.wireTypes.lengthDelimited);
            v1578, v1579 = v0.writeString(v1578, v1579, v1575.kind.value);
            v1576 = v1578;
            v1577 = v1579;
        elseif v1575.kind.type == "int32_value" then
            local v1580, v1581 = v0.writeTag(v1576, v1577, 2, v0.wireTypes.varint);
            v1580, v1581 = v0.writeVarInt(v1580, v1581, v1575.kind.value);
            v1576 = v1580;
            v1577 = v1581;
        elseif v1575.kind.type == "int64_value" then
            local v1582, v1583 = v0.writeTag(v1576, v1577, 3, v0.wireTypes.varint);
            v1582, v1583 = v0.writeVarInt(v1582, v1583, v1575.kind.value);
            v1576 = v1582;
            v1577 = v1583;
        elseif v1575.kind.type == "float_value" then
            local v1584, v1585 = v0.writeTag(v1576, v1577, 4, v0.wireTypes.i32);
            v1584, v1585 = v0.writeFloat(v1584, v1585, v1575.kind.value);
            v1576 = v1584;
            v1577 = v1585;
        elseif v1575.kind.type == "double_value" then
            local v1586, v1587 = v0.writeTag(v1576, v1577, 5, v0.wireTypes.i64);
            v1586, v1587 = v0.writeDouble(v1586, v1587, v1575.kind.value);
            v1576 = v1586;
            v1577 = v1587;
        elseif v1575.kind.type == "bool_value" then
            local v1588, v1589 = v0.writeTag(v1576, v1577, 6, v0.wireTypes.varint);
            v1588, v1589 = v0.writeVarInt(v1588, v1589, v1575.kind.value and 1 or 0);
            v1576 = v1588;
            v1577 = v1589;
        end;
    end;
    local v1590 = buffer.create(v1577);
    buffer.copy(v1590, 0, v1576, 0, v1577);
    return v1590;
end;
v5.decode = function(v1591) --[[ Line: 10547 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_58 (copy), v0 (copy)
    local v1592 = l_v5_58.new();
    local v1593 = 0;
    while v1593 < buffer.len(v1591) do
        local v1594 = nil;
        local v1595 = nil;
        local v1596, v1597, v1598 = v0.readTag(v1591, v1593);
        v1594 = v1596;
        v1595 = v1597;
        v1593 = v1598;
        if v1595 == v0.wireTypes.varint then
            if v1594 == 2 then
                v1596 = nil;
                v1597, v1598 = v0.readVarIntI32(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "int32_value", 
                    value = v1596
                };
            elseif v1594 == 3 then
                v1596 = nil;
                v1597, v1598 = v0.readVarIntI64(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "int64_value", 
                    value = v1596
                };
            elseif v1594 == 6 then
                v1596 = nil;
                v1597, v1598 = v0.readVarInt(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "bool_value", 
                    value = v1596 ~= 0
                };
            else
                v1596 = nil;
                v1597, v1598 = v0.readVarInt(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
            end;
        elseif v1595 == v0.wireTypes.lengthDelimited then
            if v1594 == 1 then
                v1596 = nil;
                v1597, v1598 = v0.readBuffer(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "string_value", 
                    value = buffer.tostring(v1596)
                };
            else
                v1596 = nil;
                v1597, v1598 = v0.readVarInt(v1591, v1593);
                v1593 = v1598 + v1597;
            end;
        elseif v1595 == v0.wireTypes.i32 then
            if v1594 == 4 then
                v1596 = nil;
                v1597, v1598 = v0.readFloat(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "float_value", 
                    value = v1596
                };
            else
                v1596 = nil;
                v1597, v1598 = v0.readFixed32(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
            end;
        elseif v1595 == v0.wireTypes.i64 then
            if v1594 == 5 then
                v1596 = nil;
                v1597, v1598 = v0.readDouble(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
                v1592.kind = {
                    type = "double_value", 
                    value = v1596
                };
            else
                v1596 = nil;
                v1597, v1598 = v0.readFixed64(v1591, v1593);
                v1596 = v1597;
                v1593 = v1598;
            end;
        else
            error("Unsupported wire type: " .. v1595);
        end;
    end;
    return v1592;
end;
v5.jsonEncode = function(v1599) --[[ Line: 10615 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v1600 = {};
    if v1599.kind ~= nil then
        if v1599.kind.type == "string_value" then
            v1600.stringValue = v1599.kind.value;
            return v1600;
        elseif v1599.kind.type == "int32_value" then
            v1600.int32Value = v1599.kind.value;
            return v1600;
        elseif v1599.kind.type == "int64_value" then
            v1600.int64Value = v1599.kind.value;
            return v1600;
        elseif v1599.kind.type == "float_value" then
            v1600.floatValue = v0.json.serializeNumber(v1599.kind.value);
            return v1600;
        elseif v1599.kind.type == "double_value" then
            v1600.doubleValue = v0.json.serializeNumber(v1599.kind.value);
            return v1600;
        elseif v1599.kind.type == "bool_value" then
            v1600.boolValue = v1599.kind.value;
        end;
    end;
    return v1600;
end;
v5.jsonDecode = function(v1601) --[[ Line: 10637 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_58 (copy), v0 (copy)
    local v1602 = l_v5_58.new();
    if v1601.string_value ~= nil then
        v1602.kind = {
            type = "string_value", 
            value = v1601.string_value
        };
    end;
    if v1601.stringValue ~= nil then
        v1602.kind = {
            type = "string_value", 
            value = v1601.stringValue
        };
    end;
    if v1601.int32_value ~= nil then
        v1602.kind = {
            type = "int32_value", 
            value = v1601.int32_value
        };
    end;
    if v1601.int32Value ~= nil then
        v1602.kind = {
            type = "int32_value", 
            value = v1601.int32Value
        };
    end;
    if v1601.int64_value ~= nil then
        v1602.kind = {
            type = "int64_value", 
            value = v1601.int64_value
        };
    end;
    if v1601.int64Value ~= nil then
        v1602.kind = {
            type = "int64_value", 
            value = v1601.int64Value
        };
    end;
    if v1601.float_value ~= nil then
        v1602.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v1601.float_value)
        };
    end;
    if v1601.floatValue ~= nil then
        v1602.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v1601.floatValue)
        };
    end;
    if v1601.double_value ~= nil then
        v1602.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v1601.double_value)
        };
    end;
    if v1601.doubleValue ~= nil then
        v1602.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v1601.doubleValue)
        };
    end;
    if v1601.bool_value ~= nil then
        v1602.kind = {
            type = "bool_value", 
            value = v1601.bool_value
        };
    end;
    if v1601.boolValue ~= nil then
        v1602.kind = {
            type = "bool_value", 
            value = v1601.boolValue
        };
    end;
    return v1602;
end;
v5.descriptor = {
    name = "TemplateArg_LiteralValue", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
};
v2.TemplateArg_LiteralValue = v5;
v1.default:register(v2.TemplateArg_LiteralValue);
v5 = {};
v5.__index = v5;
local l_v5_59 = v5 --[[ copy: 5 -> 65 ]];
v5.new = function(v1604) --[[ Line: 10705 ]] --[[ Name: new ]]
    -- upvalues: l_v5_59 (copy)
    return (setmetatable({
        kind = if not (v1604 ~= nil) or v1604.kind == nil then nil else v1604.kind
    }, l_v5_59));
end;
v5.encode = function(v1605) --[[ Line: 10711 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1606 = buffer.create(0);
    local v1607 = 0;
    if v1605.kind ~= nil then
        if v1605.kind.type == "literal" then
            local v1608 = v1605.kind.value:encode();
            local v1609, v1610 = v0.writeTag(v1606, v1607, 1, v0.wireTypes.lengthDelimited);
            v1609, v1610 = v0.writeBuffer(v1609, v1610, v1608, buffer.len(v1608));
            v1606 = v1609;
            v1607 = v1610;
        elseif v1605.kind.type == "conditional" then
            local v1611 = v1605.kind.value:encode();
            local v1612, v1613 = v0.writeTag(v1606, v1607, 2, v0.wireTypes.lengthDelimited);
            v1612, v1613 = v0.writeBuffer(v1612, v1613, v1611, buffer.len(v1611));
            v1606 = v1612;
            v1607 = v1613;
        end;
    end;
    local v1614 = buffer.create(v1607);
    buffer.copy(v1614, 0, v1606, 0, v1607);
    return v1614;
end;
v5.decode = function(v1615) --[[ Line: 10732 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_59 (copy), v0 (copy), v2 (copy)
    local v1616 = l_v5_59.new();
    local v1617 = 0;
    while v1617 < buffer.len(v1615) do
        local v1618 = nil;
        local v1619 = nil;
        local v1620, v1621, v1622 = v0.readTag(v1615, v1617);
        v1618 = v1620;
        v1619 = v1621;
        v1617 = v1622;
        if v1619 == v0.wireTypes.varint then
            v1620 = nil;
            v1621, v1622 = v0.readVarInt(v1615, v1617);
            v1620 = v1621;
            v1617 = v1622;
        elseif v1619 == v0.wireTypes.lengthDelimited then
            if v1618 == 1 then
                v1620 = nil;
                v1621, v1622 = v0.readBuffer(v1615, v1617);
                v1620 = v1621;
                v1617 = v1622;
                v1616.kind = {
                    type = "literal", 
                    value = v2.NestedComponentProp_TemplateData.decode(v1620)
                };
            elseif v1618 == 2 then
                v1620 = nil;
                v1621, v1622 = v0.readBuffer(v1615, v1617);
                v1620 = v1621;
                v1617 = v1622;
                v1616.kind = {
                    type = "conditional", 
                    value = v2.NestedComponentProp_ConditionalOptions.decode(v1620)
                };
            else
                v1620 = nil;
                v1621, v1622 = v0.readVarInt(v1615, v1617);
                v1617 = v1622 + v1621;
            end;
        elseif v1619 == v0.wireTypes.i32 then
            v1620 = nil;
            v1621, v1622 = v0.readFixed32(v1615, v1617);
            v1620 = v1621;
            v1617 = v1622;
        elseif v1619 == v0.wireTypes.i64 then
            v1620 = nil;
            v1621, v1622 = v0.readFixed64(v1615, v1617);
            v1620 = v1621;
            v1617 = v1622;
        else
            error("Unsupported wire type: " .. v1619);
        end;
    end;
    return v1616;
end;
v5.jsonEncode = function(v1623) --[[ Line: 10781 ]] --[[ Name: jsonEncode ]]
    local v1624 = {};
    if v1623.kind ~= nil then
        if v1623.kind.type == "literal" then
            v1624.literal = v1623.kind.value:jsonEncode();
            return v1624;
        elseif v1623.kind.type == "conditional" then
            v1624.conditional = v1623.kind.value:jsonEncode();
        end;
    end;
    return v1624;
end;
v5.jsonDecode = function(v1625) --[[ Line: 10795 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_59 (copy), v2 (copy)
    local v1626 = l_v5_59.new();
    if v1625.literal ~= nil then
        v1626.kind = {
            type = "literal", 
            value = v2.NestedComponentProp_TemplateData.jsonDecode(v1625.literal)
        };
    end;
    if v1625.conditional ~= nil then
        v1626.kind = {
            type = "conditional", 
            value = v2.NestedComponentProp_ConditionalOptions.jsonDecode(v1625.conditional)
        };
    end;
    return v1626;
end;
v5.descriptor = {
    name = "NestedComponentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.NestedComponentProp"
};
v2.NestedComponentProp = v5;
v1.default:register(v2.NestedComponentProp);
v5 = {};
v5.__index = v5;
local l_v5_60 = v5 --[[ copy: 5 -> 66 ]];
v5.new = function(v1628) --[[ Line: 10827 ]] --[[ Name: new ]]
    -- upvalues: l_v5_60 (copy)
    return (setmetatable({
        condition = if not (v1628 ~= nil) or v1628.condition == nil then nil else v1628.condition, 
        kind = if not (v1628 ~= nil) or v1628.kind == nil then nil else v1628.kind
    }, l_v5_60));
end;
v5.encode = function(v1629) --[[ Line: 10836 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1630 = buffer.create(0);
    local v1631 = 0;
    if v1629.condition ~= nil then
        local v1632 = v1629.condition:encode();
        local v1633, v1634 = v0.writeTag(v1630, v1631, 1, v0.wireTypes.lengthDelimited);
        v1633, v1634 = v0.writeBuffer(v1633, v1634, v1632, buffer.len(v1632));
        v1630 = v1633;
        v1631 = v1634;
    end;
    if v1629.kind ~= nil and v1629.kind.type == "literal" then
        local v1635 = v1629.kind.value:encode();
        local v1636, v1637 = v0.writeTag(v1630, v1631, 2, v0.wireTypes.lengthDelimited);
        v1636, v1637 = v0.writeBuffer(v1636, v1637, v1635, buffer.len(v1635));
        v1630 = v1636;
        v1631 = v1637;
    end;
    local v1638 = buffer.create(v1631);
    buffer.copy(v1638, 0, v1630, 0, v1631);
    return v1638;
end;
v5.decode = function(v1639) --[[ Line: 10859 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_60 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1640 = l_v5_60.new();
    local v1641 = 0;
    while v1641 < buffer.len(v1639) do
        local v1642 = nil;
        local v1643 = nil;
        local v1644, v1645, v1646 = v0.readTag(v1639, v1641);
        v1642 = v1644;
        v1643 = v1645;
        v1641 = v1646;
        if v1643 == v0.wireTypes.varint then
            v1644 = nil;
            v1645, v1646 = v0.readVarInt(v1639, v1641);
            v1644 = v1645;
            v1641 = v1646;
        elseif v1643 == v0.wireTypes.lengthDelimited then
            if v1642 == 1 then
                v1644 = nil;
                v1645, v1646 = v0.readBuffer(v1639, v1641);
                v1644 = v1645;
                v1641 = v1646;
                v1640.condition = v4.PropCondition.decode(v1644);
            elseif v1642 == 2 then
                v1644 = nil;
                v1645, v1646 = v0.readBuffer(v1639, v1641);
                v1644 = v1645;
                v1641 = v1646;
                v1640.kind = {
                    type = "literal", 
                    value = v2.NestedComponentProp_TemplateData.decode(v1644)
                };
            else
                v1644 = nil;
                v1645, v1646 = v0.readVarInt(v1639, v1641);
                v1641 = v1646 + v1645;
            end;
        elseif v1643 == v0.wireTypes.i32 then
            v1644 = nil;
            v1645, v1646 = v0.readFixed32(v1639, v1641);
            v1644 = v1645;
            v1641 = v1646;
        elseif v1643 == v0.wireTypes.i64 then
            v1644 = nil;
            v1645, v1646 = v0.readFixed64(v1639, v1641);
            v1644 = v1645;
            v1641 = v1646;
        else
            error("Unsupported wire type: " .. v1643);
        end;
    end;
    return v1640;
end;
v5.jsonEncode = function(v1647) --[[ Line: 10907 ]] --[[ Name: jsonEncode ]]
    local v1648 = {};
    if v1647.condition ~= nil then
        v1648.condition = v1647.condition:jsonEncode();
    end;
    if v1647.kind ~= nil and v1647.kind.type == "literal" then
        v1648.literal = v1647.kind.value:jsonEncode();
    end;
    return v1648;
end;
v5.jsonDecode = function(v1649) --[[ Line: 10923 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_60 (copy), v4 (copy), v2 (copy)
    local v1650 = l_v5_60.new();
    if v1649.condition ~= nil then
        v1650.condition = v4.PropCondition.jsonDecode(v1649.condition);
    end;
    if v1649.literal ~= nil then
        v1650.kind = {
            type = "literal", 
            value = v2.NestedComponentProp_TemplateData.jsonDecode(v1649.literal)
        };
    end;
    return v1650;
end;
v5.descriptor = {
    name = "NestedComponentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.NestedComponentProp_ConditionalOption = v5;
v1.default:register(v2.NestedComponentProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_61 = v5 --[[ copy: 5 -> 67 ]];
v5.new = function(v1652) --[[ Line: 10955 ]] --[[ Name: new ]]
    -- upvalues: l_v5_61 (copy)
    return (setmetatable({
        options = if not (v1652 ~= nil) or v1652.options == nil then {} else v1652.options
    }, l_v5_61));
end;
v5.encode = function(v1653) --[[ Line: 10963 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1654 = buffer.create(0);
    local v1655 = 0;
    if v1653.options ~= nil and #v1653.options > 0 then
        for _, v1657 in v1653.options do
            local v1658 = v1657:encode();
            local v1659, v1660 = v0.writeTag(v1654, v1655, 1, v0.wireTypes.lengthDelimited);
            v1659, v1660 = v0.writeBuffer(v1659, v1660, v1658, buffer.len(v1658));
            v1654 = v1659;
            v1655 = v1660;
        end;
    end;
    local v1661 = buffer.create(v1655);
    buffer.copy(v1661, 0, v1654, 0, v1655);
    return v1661;
end;
v5.decode = function(v1662) --[[ Line: 10980 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_61 (copy), v0 (copy), v2 (copy)
    local v1663 = l_v5_61.new();
    local v1664 = 0;
    while v1664 < buffer.len(v1662) do
        local v1665 = nil;
        local v1666 = nil;
        local v1667, v1668, v1669 = v0.readTag(v1662, v1664);
        v1665 = v1667;
        v1666 = v1668;
        v1664 = v1669;
        if v1666 == v0.wireTypes.varint then
            v1667 = nil;
            v1668, v1669 = v0.readVarInt(v1662, v1664);
            v1667 = v1668;
            v1664 = v1669;
        elseif v1666 == v0.wireTypes.lengthDelimited then
            if v1665 == 1 then
                v1667 = nil;
                v1668, v1669 = v0.readBuffer(v1662, v1664);
                v1667 = v1668;
                v1664 = v1669;
                table.insert(v1663.options, v2.NestedComponentProp_ConditionalOption.decode(v1667));
            else
                v1667 = nil;
                v1668, v1669 = v0.readVarInt(v1662, v1664);
                v1664 = v1669 + v1668;
            end;
        elseif v1666 == v0.wireTypes.i32 then
            v1667 = nil;
            v1668, v1669 = v0.readFixed32(v1662, v1664);
            v1667 = v1668;
            v1664 = v1669;
        elseif v1666 == v0.wireTypes.i64 then
            v1667 = nil;
            v1668, v1669 = v0.readFixed64(v1662, v1664);
            v1667 = v1668;
            v1664 = v1669;
        else
            error("Unsupported wire type: " .. v1666);
        end;
    end;
    return v1663;
end;
v5.jsonEncode = function(v1670) --[[ Line: 11023 ]] --[[ Name: jsonEncode ]]
    local v1671 = {};
    if v1670.options ~= nil and #v1670.options > 0 then
        local v1672 = {};
        for _, v1674 in v1670.options do
            table.insert(v1672, v1674:jsonEncode());
        end;
        v1671.options = v1672;
    end;
    return v1671;
end;
v5.jsonDecode = function(v1675) --[[ Line: 11037 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_61 (copy), v2 (copy)
    local v1676 = l_v5_61.new();
    if v1675.options ~= nil then
        local v1677 = {};
        for _, v1679 in v1675.options do
            table.insert(v1677, v2.NestedComponentProp_ConditionalOption.jsonDecode(v1679));
        end;
        v1676.options = v1677;
    end;
    return v1676;
end;
v5.descriptor = {
    name = "NestedComponentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.NestedComponentProp_ConditionalOptions = v5;
v1.default:register(v2.NestedComponentProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_62 = v5 --[[ copy: 5 -> 68 ]];
v5.new = function(v1681) --[[ Line: 11068 ]] --[[ Name: new ]]
    -- upvalues: l_v5_62 (copy)
    return (setmetatable({
        inputs = if not (v1681 ~= nil) or v1681.inputs == nil then {} else v1681.inputs, 
        roblox_component = (not (v1681 ~= nil) or v1681.roblox_component == nil) and "" or v1681.roblox_component
    }, l_v5_62));
end;
v5.encode = function(v1682) --[[ Line: 11077 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1683 = buffer.create(0);
    local v1684 = 0;
    if v1682.inputs ~= nil and next(v1682.inputs) ~= nil then
        for v1685, v1686 in v1682.inputs do
            local v1687 = buffer.create(0);
            local v1688, v1689 = v0.writeTag(v1687, 0, 1, v0.wireTypes.lengthDelimited);
            v1688, v1689 = v0.writeString(v1688, v1689, v1685);
            v1687 = v1688;
            local l_v1689_0 = v1689;
            v1688 = v1686:encode();
            local v1691;
            v1689, v1691 = v0.writeTag(v1687, l_v1689_0, 2, v0.wireTypes.lengthDelimited);
            v1689, v1691 = v0.writeBuffer(v1689, v1691, v1688, buffer.len(v1688));
            v1687 = v1689;
            l_v1689_0 = v1691;
            v1689, v1691 = v0.writeTag(v1683, v1684, 1, v0.wireTypes.lengthDelimited);
            v1689, v1691 = v0.writeBuffer(v1689, v1691, v1687, l_v1689_0);
            v1683 = v1689;
            v1684 = v1691;
        end;
    end;
    if v1682.roblox_component ~= nil and v1682.roblox_component ~= "" then
        local v1692, v1693 = v0.writeTag(v1683, v1684, 2, v0.wireTypes.lengthDelimited);
        v1692, v1693 = v0.writeString(v1692, v1693, v1682.roblox_component);
        v1683 = v1692;
        v1684 = v1693;
    end;
    local v1694 = buffer.create(v1684);
    buffer.copy(v1694, 0, v1683, 0, v1684);
    return v1694;
end;
v5.decode = function(v1695) --[[ Line: 11105 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_62 (copy), v0 (copy), v2 (copy)
    local v1696 = l_v5_62.new();
    local v1697 = 0;
    while v1697 < buffer.len(v1695) do
        local v1698 = nil;
        local v1699 = nil;
        local v1700, v1701, v1702 = v0.readTag(v1695, v1697);
        v1698 = v1700;
        v1699 = v1701;
        v1697 = v1702;
        if v1699 == v0.wireTypes.varint then
            v1700 = nil;
            v1701, v1702 = v0.readVarInt(v1695, v1697);
            v1700 = v1701;
            v1697 = v1702;
        elseif v1699 == v0.wireTypes.lengthDelimited then
            if v1698 == 1 then
                v1700 = nil;
                v1701, v1702 = v0.readBuffer(v1695, v1697);
                v1700 = v1701;
                v1697 = v1702;
                v1701 = v2.NestedComponentProp_TemplateData_InputsEntry.decode(v1700);
                v1702 = v2.TemplateArg.new();
                v1696.inputs[v1701.key or ""] = v1701.value or v1702;
            elseif v1698 == 2 then
                v1700 = nil;
                v1701, v1702 = v0.readBuffer(v1695, v1697);
                v1700 = v1701;
                v1697 = v1702;
                v1696.roblox_component = buffer.tostring(v1700);
            else
                v1700 = nil;
                v1701, v1702 = v0.readVarInt(v1695, v1697);
                v1697 = v1702 + v1701;
            end;
        elseif v1699 == v0.wireTypes.i32 then
            v1700 = nil;
            v1701, v1702 = v0.readFixed32(v1695, v1697);
            v1700 = v1701;
            v1697 = v1702;
        elseif v1699 == v0.wireTypes.i64 then
            v1700 = nil;
            v1701, v1702 = v0.readFixed64(v1695, v1697);
            v1700 = v1701;
            v1697 = v1702;
        else
            error("Unsupported wire type: " .. v1699);
        end;
    end;
    return v1696;
end;
v5.jsonEncode = function(v1703) --[[ Line: 11160 ]] --[[ Name: jsonEncode ]]
    local v1704 = {};
    if v1703.inputs ~= nil and next(v1703.inputs) ~= nil then
        local v1705 = {};
        for v1706, v1707 in v1703.inputs do
            v1705[v1706] = v1707:jsonEncode();
        end;
        v1704.inputs = v1705;
    end;
    if v1703.roblox_component ~= nil and v1703.roblox_component ~= "" then
        v1704.robloxComponent = v1703.roblox_component;
    end;
    return v1704;
end;
v5.jsonDecode = function(v1708) --[[ Line: 11178 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_62 (copy), v2 (copy)
    local v1709 = l_v5_62.new();
    if v1708.inputs ~= nil then
        local v1710 = {};
        for v1711, v1712 in v1708.inputs do
            v1710[v1711] = v2.TemplateArg.jsonDecode(v1712);
        end;
        v1709.inputs = v1710;
    end;
    if v1708.roblox_component ~= nil then
        v1709.roblox_component = v1708.roblox_component;
    end;
    if v1708.robloxComponent ~= nil then
        v1709.roblox_component = v1708.robloxComponent;
    end;
    return v1709;
end;
v5.descriptor = {
    name = "NestedComponentProp_TemplateData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
};
v2.NestedComponentProp_TemplateData = v5;
v1.default:register(v2.NestedComponentProp_TemplateData);
v5 = {};
v5.__index = v5;
local l_v5_63 = v5 --[[ copy: 5 -> 69 ]];
v5.new = function(v1714) --[[ Line: 11217 ]] --[[ Name: new ]]
    -- upvalues: l_v5_63 (copy)
    return (setmetatable({
        key = (not (v1714 ~= nil) or v1714.key == nil) and "" or v1714.key, 
        value = if not (v1714 ~= nil) or v1714.value == nil then nil else v1714.value
    }, l_v5_63));
end;
v5.encode = function(v1715) --[[ Line: 11226 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1716 = buffer.create(0);
    local v1717 = 0;
    if v1715.key ~= nil and v1715.key ~= "" then
        local v1718, v1719 = v0.writeTag(v1716, v1717, 1, v0.wireTypes.lengthDelimited);
        v1718, v1719 = v0.writeString(v1718, v1719, v1715.key);
        v1716 = v1718;
        v1717 = v1719;
    end;
    if v1715.value ~= nil then
        local v1720 = v1715.value:encode();
        local v1721, v1722 = v0.writeTag(v1716, v1717, 2, v0.wireTypes.lengthDelimited);
        v1721, v1722 = v0.writeBuffer(v1721, v1722, v1720, buffer.len(v1720));
        v1716 = v1721;
        v1717 = v1722;
    end;
    local v1723 = buffer.create(v1717);
    buffer.copy(v1723, 0, v1716, 0, v1717);
    return v1723;
end;
v5.decode = function(v1724) --[[ Line: 11248 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_63 (copy), v0 (copy), v2 (copy)
    local v1725 = l_v5_63.new();
    local v1726 = 0;
    while v1726 < buffer.len(v1724) do
        local v1727 = nil;
        local v1728 = nil;
        local v1729, v1730, v1731 = v0.readTag(v1724, v1726);
        v1727 = v1729;
        v1728 = v1730;
        v1726 = v1731;
        if v1728 == v0.wireTypes.varint then
            v1729 = nil;
            v1730, v1731 = v0.readVarInt(v1724, v1726);
            v1729 = v1730;
            v1726 = v1731;
        elseif v1728 == v0.wireTypes.lengthDelimited then
            if v1727 == 1 then
                v1729 = nil;
                v1730, v1731 = v0.readBuffer(v1724, v1726);
                v1729 = v1730;
                v1726 = v1731;
                v1725.key = buffer.tostring(v1729);
            elseif v1727 == 2 then
                v1729 = nil;
                v1730, v1731 = v0.readBuffer(v1724, v1726);
                v1729 = v1730;
                v1726 = v1731;
                v1725.value = v2.TemplateArg.decode(v1729);
            else
                v1729 = nil;
                v1730, v1731 = v0.readVarInt(v1724, v1726);
                v1726 = v1731 + v1730;
            end;
        elseif v1728 == v0.wireTypes.i32 then
            v1729 = nil;
            v1730, v1731 = v0.readFixed32(v1724, v1726);
            v1729 = v1730;
            v1726 = v1731;
        elseif v1728 == v0.wireTypes.i64 then
            v1729 = nil;
            v1730, v1731 = v0.readFixed64(v1724, v1726);
            v1729 = v1730;
            v1726 = v1731;
        else
            error("Unsupported wire type: " .. v1728);
        end;
    end;
    return v1725;
end;
v5.jsonEncode = function(v1732) --[[ Line: 11298 ]] --[[ Name: jsonEncode ]]
    local v1733 = {};
    if v1732.key ~= nil and v1732.key ~= "" then
        v1733.key = v1732.key;
    end;
    if v1732.value ~= nil then
        v1733.value = v1732.value:jsonEncode();
    end;
    return v1733;
end;
v5.jsonDecode = function(v1734) --[[ Line: 11314 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_63 (copy), v2 (copy)
    local v1735 = l_v5_63.new();
    if v1734.key ~= nil then
        v1735.key = v1734.key;
    end;
    if v1734.value ~= nil then
        v1735.value = v2.TemplateArg.jsonDecode(v1734.value);
    end;
    return v1735;
end;
v5.descriptor = {
    name = "NestedComponentProp_TemplateData_InputsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
};
v2.NestedComponentProp_TemplateData_InputsEntry = v5;
v1.default:register(v2.NestedComponentProp_TemplateData_InputsEntry);
v5 = {};
v5.__index = v5;
local l_v5_64 = v5 --[[ copy: 5 -> 70 ]];
v5.new = function(v1737) --[[ Line: 11344 ]] --[[ Name: new ]]
    -- upvalues: l_v5_64 (copy)
    return (setmetatable({
        kind = if not (v1737 ~= nil) or v1737.kind == nil then nil else v1737.kind
    }, l_v5_64));
end;
v5.encode = function(v1738) --[[ Line: 11352 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1739 = buffer.create(0);
    local v1740 = 0;
    if v1738.kind ~= nil then
        if v1738.kind.type == "array_map" then
            local v1741 = v1738.kind.value:encode();
            local v1742, v1743 = v0.writeTag(v1739, v1740, 1, v0.wireTypes.lengthDelimited);
            v1742, v1743 = v0.writeBuffer(v1742, v1743, v1741, buffer.len(v1741));
            v1739 = v1742;
            v1740 = v1743;
        elseif v1738.kind.type == "item_list" then
            local v1744 = v1738.kind.value:encode();
            local v1745, v1746 = v0.writeTag(v1739, v1740, 2, v0.wireTypes.lengthDelimited);
            v1745, v1746 = v0.writeBuffer(v1745, v1746, v1744, buffer.len(v1744));
            v1739 = v1745;
            v1740 = v1746;
        elseif v1738.kind.type == "conditional" then
            local v1747 = v1738.kind.value:encode();
            local v1748, v1749 = v0.writeTag(v1739, v1740, 3, v0.wireTypes.lengthDelimited);
            v1748, v1749 = v0.writeBuffer(v1748, v1749, v1747, buffer.len(v1747));
            v1739 = v1748;
            v1740 = v1749;
        end;
    end;
    local v1750 = buffer.create(v1740);
    buffer.copy(v1750, 0, v1739, 0, v1740);
    return v1750;
end;
v5.decode = function(v1751) --[[ Line: 11377 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_64 (copy), v0 (copy), v2 (copy)
    local v1752 = l_v5_64.new();
    local v1753 = 0;
    while v1753 < buffer.len(v1751) do
        local v1754 = nil;
        local v1755 = nil;
        local v1756, v1757, v1758 = v0.readTag(v1751, v1753);
        v1754 = v1756;
        v1755 = v1757;
        v1753 = v1758;
        if v1755 == v0.wireTypes.varint then
            v1756 = nil;
            v1757, v1758 = v0.readVarInt(v1751, v1753);
            v1756 = v1757;
            v1753 = v1758;
        elseif v1755 == v0.wireTypes.lengthDelimited then
            if v1754 == 1 then
                v1756 = nil;
                v1757, v1758 = v0.readBuffer(v1751, v1753);
                v1756 = v1757;
                v1753 = v1758;
                v1752.kind = {
                    type = "array_map", 
                    value = v2.LazyNestedComponentListProp_TemplateData.decode(v1756)
                };
            elseif v1754 == 2 then
                v1756 = nil;
                v1757, v1758 = v0.readBuffer(v1751, v1753);
                v1756 = v1757;
                v1753 = v1758;
                v1752.kind = {
                    type = "item_list", 
                    value = v2.LazyNestedComponentListProp_TemplateDataList.decode(v1756)
                };
            elseif v1754 == 3 then
                v1756 = nil;
                v1757, v1758 = v0.readBuffer(v1751, v1753);
                v1756 = v1757;
                v1753 = v1758;
                v1752.kind = {
                    type = "conditional", 
                    value = v2.LazyNestedComponentListProp_ConditionalOptions.decode(v1756)
                };
            else
                v1756 = nil;
                v1757, v1758 = v0.readVarInt(v1751, v1753);
                v1753 = v1758 + v1757;
            end;
        elseif v1755 == v0.wireTypes.i32 then
            v1756 = nil;
            v1757, v1758 = v0.readFixed32(v1751, v1753);
            v1756 = v1757;
            v1753 = v1758;
        elseif v1755 == v0.wireTypes.i64 then
            v1756 = nil;
            v1757, v1758 = v0.readFixed64(v1751, v1753);
            v1756 = v1757;
            v1753 = v1758;
        else
            error("Unsupported wire type: " .. v1755);
        end;
    end;
    return v1752;
end;
v5.jsonEncode = function(v1759) --[[ Line: 11437 ]] --[[ Name: jsonEncode ]]
    local v1760 = {};
    if v1759.kind ~= nil then
        if v1759.kind.type == "array_map" then
            v1760.arrayMap = v1759.kind.value:jsonEncode();
            return v1760;
        elseif v1759.kind.type == "item_list" then
            v1760.itemList = v1759.kind.value:jsonEncode();
            return v1760;
        elseif v1759.kind.type == "conditional" then
            v1760.conditional = v1759.kind.value:jsonEncode();
        end;
    end;
    return v1760;
end;
v5.jsonDecode = function(v1761) --[[ Line: 11453 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_64 (copy), v2 (copy)
    local v1762 = l_v5_64.new();
    if v1761.array_map ~= nil then
        v1762.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1761.array_map)
        };
    end;
    if v1761.arrayMap ~= nil then
        v1762.kind = {
            type = "array_map", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1761.arrayMap)
        };
    end;
    if v1761.item_list ~= nil then
        v1762.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1761.item_list)
        };
    end;
    if v1761.itemList ~= nil then
        v1762.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1761.itemList)
        };
    end;
    if v1761.conditional ~= nil then
        v1762.kind = {
            type = "conditional", 
            value = v2.LazyNestedComponentListProp_ConditionalOptions.jsonDecode(v1761.conditional)
        };
    end;
    return v1762;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.LazyNestedComponentListProp"
};
v2.LazyNestedComponentListProp = v5;
v1.default:register(v2.LazyNestedComponentListProp);
v5 = {};
v5.__index = v5;
local l_v5_65 = v5 --[[ copy: 5 -> 71 ]];
v5.new = function(v1764) --[[ Line: 11508 ]] --[[ Name: new ]]
    -- upvalues: l_v5_65 (copy)
    return (setmetatable({
        condition = if not (v1764 ~= nil) or v1764.condition == nil then nil else v1764.condition, 
        kind = if not (v1764 ~= nil) or v1764.kind == nil then nil else v1764.kind
    }, l_v5_65));
end;
v5.encode = function(v1765) --[[ Line: 11517 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1766 = buffer.create(0);
    local v1767 = 0;
    if v1765.condition ~= nil then
        local v1768 = v1765.condition:encode();
        local v1769, v1770 = v0.writeTag(v1766, v1767, 1, v0.wireTypes.lengthDelimited);
        v1769, v1770 = v0.writeBuffer(v1769, v1770, v1768, buffer.len(v1768));
        v1766 = v1769;
        v1767 = v1770;
    end;
    if v1765.kind ~= nil then
        if v1765.kind.type == "literal" then
            local v1771 = v1765.kind.value:encode();
            local v1772, v1773 = v0.writeTag(v1766, v1767, 2, v0.wireTypes.lengthDelimited);
            v1772, v1773 = v0.writeBuffer(v1772, v1773, v1771, buffer.len(v1771));
            v1766 = v1772;
            v1767 = v1773;
        elseif v1765.kind.type == "item_list" then
            local v1774 = v1765.kind.value:encode();
            local v1775, v1776 = v0.writeTag(v1766, v1767, 3, v0.wireTypes.lengthDelimited);
            v1775, v1776 = v0.writeBuffer(v1775, v1776, v1774, buffer.len(v1774));
            v1766 = v1775;
            v1767 = v1776;
        end;
    end;
    local v1777 = buffer.create(v1767);
    buffer.copy(v1777, 0, v1766, 0, v1767);
    return v1777;
end;
v5.decode = function(v1778) --[[ Line: 11546 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_65 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v1779 = l_v5_65.new();
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
                v1779.condition = v4.PropCondition.decode(v1783);
            elseif v1781 == 2 then
                v1783 = nil;
                v1784, v1785 = v0.readBuffer(v1778, v1780);
                v1783 = v1784;
                v1780 = v1785;
                v1779.kind = {
                    type = "literal", 
                    value = v2.LazyNestedComponentListProp_TemplateData.decode(v1783)
                };
            elseif v1781 == 3 then
                v1783 = nil;
                v1784, v1785 = v0.readBuffer(v1778, v1780);
                v1783 = v1784;
                v1780 = v1785;
                v1779.kind = {
                    type = "item_list", 
                    value = v2.LazyNestedComponentListProp_TemplateDataList.decode(v1783)
                };
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
v5.jsonEncode = function(v1786) --[[ Line: 11605 ]] --[[ Name: jsonEncode ]]
    local v1787 = {};
    if v1786.condition ~= nil then
        v1787.condition = v1786.condition:jsonEncode();
    end;
    if v1786.kind ~= nil then
        if v1786.kind.type == "literal" then
            v1787.literal = v1786.kind.value:jsonEncode();
            return v1787;
        elseif v1786.kind.type == "item_list" then
            v1787.itemList = v1786.kind.value:jsonEncode();
        end;
    end;
    return v1787;
end;
v5.jsonDecode = function(v1788) --[[ Line: 11625 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_65 (copy), v4 (copy), v2 (copy)
    local v1789 = l_v5_65.new();
    if v1788.condition ~= nil then
        v1789.condition = v4.PropCondition.jsonDecode(v1788.condition);
    end;
    if v1788.literal ~= nil then
        v1789.kind = {
            type = "literal", 
            value = v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1788.literal)
        };
    end;
    if v1788.item_list ~= nil then
        v1789.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1788.item_list)
        };
    end;
    if v1788.itemList ~= nil then
        v1789.kind = {
            type = "item_list", 
            value = v2.LazyNestedComponentListProp_TemplateDataList.jsonDecode(v1788.itemList)
        };
    end;
    return v1789;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.LazyNestedComponentListProp_ConditionalOption = v5;
v1.default:register(v2.LazyNestedComponentListProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_66 = v5 --[[ copy: 5 -> 72 ]];
v5.new = function(v1791) --[[ Line: 11673 ]] --[[ Name: new ]]
    -- upvalues: l_v5_66 (copy)
    return (setmetatable({
        options = if not (v1791 ~= nil) or v1791.options == nil then {} else v1791.options
    }, l_v5_66));
end;
v5.encode = function(v1792) --[[ Line: 11681 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1793 = buffer.create(0);
    local v1794 = 0;
    if v1792.options ~= nil and #v1792.options > 0 then
        for _, v1796 in v1792.options do
            local v1797 = v1796:encode();
            local v1798, v1799 = v0.writeTag(v1793, v1794, 1, v0.wireTypes.lengthDelimited);
            v1798, v1799 = v0.writeBuffer(v1798, v1799, v1797, buffer.len(v1797));
            v1793 = v1798;
            v1794 = v1799;
        end;
    end;
    local v1800 = buffer.create(v1794);
    buffer.copy(v1800, 0, v1793, 0, v1794);
    return v1800;
end;
v5.decode = function(v1801) --[[ Line: 11700 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_66 (copy), v0 (copy), v2 (copy)
    local v1802 = l_v5_66.new();
    local v1803 = 0;
    while v1803 < buffer.len(v1801) do
        local v1804 = nil;
        local v1805 = nil;
        local v1806, v1807, v1808 = v0.readTag(v1801, v1803);
        v1804 = v1806;
        v1805 = v1807;
        v1803 = v1808;
        if v1805 == v0.wireTypes.varint then
            v1806 = nil;
            v1807, v1808 = v0.readVarInt(v1801, v1803);
            v1806 = v1807;
            v1803 = v1808;
        elseif v1805 == v0.wireTypes.lengthDelimited then
            if v1804 == 1 then
                v1806 = nil;
                v1807, v1808 = v0.readBuffer(v1801, v1803);
                v1806 = v1807;
                v1803 = v1808;
                table.insert(v1802.options, v2.LazyNestedComponentListProp_ConditionalOption.decode(v1806));
            else
                v1806 = nil;
                v1807, v1808 = v0.readVarInt(v1801, v1803);
                v1803 = v1808 + v1807;
            end;
        elseif v1805 == v0.wireTypes.i32 then
            v1806 = nil;
            v1807, v1808 = v0.readFixed32(v1801, v1803);
            v1806 = v1807;
            v1803 = v1808;
        elseif v1805 == v0.wireTypes.i64 then
            v1806 = nil;
            v1807, v1808 = v0.readFixed64(v1801, v1803);
            v1806 = v1807;
            v1803 = v1808;
        else
            error("Unsupported wire type: " .. v1805);
        end;
    end;
    return v1802;
end;
v5.jsonEncode = function(v1809) --[[ Line: 11745 ]] --[[ Name: jsonEncode ]]
    local v1810 = {};
    if v1809.options ~= nil and #v1809.options > 0 then
        local v1811 = {};
        for _, v1813 in v1809.options do
            table.insert(v1811, v1813:jsonEncode());
        end;
        v1810.options = v1811;
    end;
    return v1810;
end;
v5.jsonDecode = function(v1814) --[[ Line: 11761 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_66 (copy), v2 (copy)
    local v1815 = l_v5_66.new();
    if v1814.options ~= nil then
        local v1816 = {};
        for _, v1818 in v1814.options do
            table.insert(v1816, v2.LazyNestedComponentListProp_ConditionalOption.jsonDecode(v1818));
        end;
        v1815.options = v1816;
    end;
    return v1815;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.LazyNestedComponentListProp_ConditionalOptions = v5;
v1.default:register(v2.LazyNestedComponentListProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_67 = v5 --[[ copy: 5 -> 73 ]];
v5.new = function(v1820) --[[ Line: 11792 ]] --[[ Name: new ]]
    -- upvalues: l_v5_67 (copy)
    return (setmetatable({
        binding_path = (not (v1820 ~= nil) or v1820.binding_path == nil) and "" or v1820.binding_path, 
        roblox_component = (not (v1820 ~= nil) or v1820.roblox_component == nil) and "" or v1820.roblox_component, 
        inputs = if not (v1820 ~= nil) or v1820.inputs == nil then {} else v1820.inputs
    }, l_v5_67));
end;
v5.encode = function(v1821) --[[ Line: 11802 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1822 = buffer.create(0);
    local v1823 = 0;
    if v1821.binding_path ~= nil and v1821.binding_path ~= "" then
        local v1824, v1825 = v0.writeTag(v1822, v1823, 1, v0.wireTypes.lengthDelimited);
        v1824, v1825 = v0.writeString(v1824, v1825, v1821.binding_path);
        v1822 = v1824;
        v1823 = v1825;
    end;
    if v1821.roblox_component ~= nil and v1821.roblox_component ~= "" then
        local v1826, v1827 = v0.writeTag(v1822, v1823, 2, v0.wireTypes.lengthDelimited);
        v1826, v1827 = v0.writeString(v1826, v1827, v1821.roblox_component);
        v1822 = v1826;
        v1823 = v1827;
    end;
    if v1821.inputs ~= nil and next(v1821.inputs) ~= nil then
        for v1828, v1829 in v1821.inputs do
            local v1830 = buffer.create(0);
            local v1831, v1832 = v0.writeTag(v1830, 0, 1, v0.wireTypes.lengthDelimited);
            v1831, v1832 = v0.writeString(v1831, v1832, v1828);
            v1830 = v1831;
            local l_v1832_0 = v1832;
            v1831 = v1829:encode();
            local v1834;
            v1832, v1834 = v0.writeTag(v1830, l_v1832_0, 2, v0.wireTypes.lengthDelimited);
            v1832, v1834 = v0.writeBuffer(v1832, v1834, v1831, buffer.len(v1831));
            v1830 = v1832;
            l_v1832_0 = v1834;
            v1832, v1834 = v0.writeTag(v1822, v1823, 3, v0.wireTypes.lengthDelimited);
            v1832, v1834 = v0.writeBuffer(v1832, v1834, v1830, l_v1832_0);
            v1822 = v1832;
            v1823 = v1834;
        end;
    end;
    local v1835 = buffer.create(v1823);
    buffer.copy(v1835, 0, v1822, 0, v1823);
    return v1835;
end;
v5.decode = function(v1836) --[[ Line: 11837 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_67 (copy), v0 (copy), v2 (copy)
    local v1837 = l_v5_67.new();
    local v1838 = 0;
    while v1838 < buffer.len(v1836) do
        local v1839 = nil;
        local v1840 = nil;
        local v1841, v1842, v1843 = v0.readTag(v1836, v1838);
        v1839 = v1841;
        v1840 = v1842;
        v1838 = v1843;
        if v1840 == v0.wireTypes.varint then
            v1841 = nil;
            v1842, v1843 = v0.readVarInt(v1836, v1838);
            v1841 = v1842;
            v1838 = v1843;
        elseif v1840 == v0.wireTypes.lengthDelimited then
            if v1839 == 1 then
                v1841 = nil;
                v1842, v1843 = v0.readBuffer(v1836, v1838);
                v1841 = v1842;
                v1838 = v1843;
                v1837.binding_path = buffer.tostring(v1841);
            elseif v1839 == 2 then
                v1841 = nil;
                v1842, v1843 = v0.readBuffer(v1836, v1838);
                v1841 = v1842;
                v1838 = v1843;
                v1837.roblox_component = buffer.tostring(v1841);
            elseif v1839 == 3 then
                v1841 = nil;
                v1842, v1843 = v0.readBuffer(v1836, v1838);
                v1841 = v1842;
                v1838 = v1843;
                v1842 = v2.LazyNestedComponentListProp_TemplateData_InputsEntry.decode(v1841);
                v1843 = v2.TemplateArg.new();
                v1837.inputs[v1842.key or ""] = v1842.value or v1843;
            else
                v1841 = nil;
                v1842, v1843 = v0.readVarInt(v1836, v1838);
                v1838 = v1843 + v1842;
            end;
        elseif v1840 == v0.wireTypes.i32 then
            v1841 = nil;
            v1842, v1843 = v0.readFixed32(v1836, v1838);
            v1841 = v1842;
            v1838 = v1843;
        elseif v1840 == v0.wireTypes.i64 then
            v1841 = nil;
            v1842, v1843 = v0.readFixed64(v1836, v1838);
            v1841 = v1842;
            v1838 = v1843;
        else
            error("Unsupported wire type: " .. v1840);
        end;
    end;
    return v1837;
end;
v5.jsonEncode = function(v1844) --[[ Line: 11899 ]] --[[ Name: jsonEncode ]]
    local v1845 = {};
    if v1844.binding_path ~= nil and v1844.binding_path ~= "" then
        v1845.bindingPath = v1844.binding_path;
    end;
    if v1844.roblox_component ~= nil and v1844.roblox_component ~= "" then
        v1845.robloxComponent = v1844.roblox_component;
    end;
    if v1844.inputs ~= nil and next(v1844.inputs) ~= nil then
        local v1846 = {};
        for v1847, v1848 in v1844.inputs do
            v1846[v1847] = v1848:jsonEncode();
        end;
        v1845.inputs = v1846;
    end;
    return v1845;
end;
v5.jsonDecode = function(v1849) --[[ Line: 11923 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_67 (copy), v2 (copy)
    local v1850 = l_v5_67.new();
    if v1849.binding_path ~= nil then
        v1850.binding_path = v1849.binding_path;
    end;
    if v1849.bindingPath ~= nil then
        v1850.binding_path = v1849.bindingPath;
    end;
    if v1849.roblox_component ~= nil then
        v1850.roblox_component = v1849.roblox_component;
    end;
    if v1849.robloxComponent ~= nil then
        v1850.roblox_component = v1849.robloxComponent;
    end;
    if v1849.inputs ~= nil then
        local v1851 = {};
        for v1852, v1853 in v1849.inputs do
            v1851[v1852] = v2.TemplateArg.jsonDecode(v1853);
        end;
        v1850.inputs = v1851;
    end;
    return v1850;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateData"
};
v2.LazyNestedComponentListProp_TemplateData = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateData);
v5 = {};
v5.__index = v5;
local l_v5_68 = v5 --[[ copy: 5 -> 74 ]];
v5.new = function(v1855) --[[ Line: 11971 ]] --[[ Name: new ]]
    -- upvalues: l_v5_68 (copy)
    return (setmetatable({
        key = (not (v1855 ~= nil) or v1855.key == nil) and "" or v1855.key, 
        value = if not (v1855 ~= nil) or v1855.value == nil then nil else v1855.value
    }, l_v5_68));
end;
v5.encode = function(v1856) --[[ Line: 11983 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1857 = buffer.create(0);
    local v1858 = 0;
    if v1856.key ~= nil and v1856.key ~= "" then
        local v1859, v1860 = v0.writeTag(v1857, v1858, 1, v0.wireTypes.lengthDelimited);
        v1859, v1860 = v0.writeString(v1859, v1860, v1856.key);
        v1857 = v1859;
        v1858 = v1860;
    end;
    if v1856.value ~= nil then
        local v1861 = v1856.value:encode();
        local v1862, v1863 = v0.writeTag(v1857, v1858, 2, v0.wireTypes.lengthDelimited);
        v1862, v1863 = v0.writeBuffer(v1862, v1863, v1861, buffer.len(v1861));
        v1857 = v1862;
        v1858 = v1863;
    end;
    local v1864 = buffer.create(v1858);
    buffer.copy(v1864, 0, v1857, 0, v1858);
    return v1864;
end;
v5.decode = function(v1865) --[[ Line: 12005 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_68 (copy), v0 (copy), v2 (copy)
    local v1866 = l_v5_68.new();
    local v1867 = 0;
    while v1867 < buffer.len(v1865) do
        local v1868 = nil;
        local v1869 = nil;
        local v1870, v1871, v1872 = v0.readTag(v1865, v1867);
        v1868 = v1870;
        v1869 = v1871;
        v1867 = v1872;
        if v1869 == v0.wireTypes.varint then
            v1870 = nil;
            v1871, v1872 = v0.readVarInt(v1865, v1867);
            v1870 = v1871;
            v1867 = v1872;
        elseif v1869 == v0.wireTypes.lengthDelimited then
            if v1868 == 1 then
                v1870 = nil;
                v1871, v1872 = v0.readBuffer(v1865, v1867);
                v1870 = v1871;
                v1867 = v1872;
                v1866.key = buffer.tostring(v1870);
            elseif v1868 == 2 then
                v1870 = nil;
                v1871, v1872 = v0.readBuffer(v1865, v1867);
                v1870 = v1871;
                v1867 = v1872;
                v1866.value = v2.TemplateArg.decode(v1870);
            else
                v1870 = nil;
                v1871, v1872 = v0.readVarInt(v1865, v1867);
                v1867 = v1872 + v1871;
            end;
        elseif v1869 == v0.wireTypes.i32 then
            v1870 = nil;
            v1871, v1872 = v0.readFixed32(v1865, v1867);
            v1870 = v1871;
            v1867 = v1872;
        elseif v1869 == v0.wireTypes.i64 then
            v1870 = nil;
            v1871, v1872 = v0.readFixed64(v1865, v1867);
            v1870 = v1871;
            v1867 = v1872;
        else
            error("Unsupported wire type: " .. v1869);
        end;
    end;
    return v1866;
end;
v5.jsonEncode = function(v1873) --[[ Line: 12055 ]] --[[ Name: jsonEncode ]]
    local v1874 = {};
    if v1873.key ~= nil and v1873.key ~= "" then
        v1874.key = v1873.key;
    end;
    if v1873.value ~= nil then
        v1874.value = v1873.value:jsonEncode();
    end;
    return v1874;
end;
v5.jsonDecode = function(v1875) --[[ Line: 12071 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_68 (copy), v2 (copy)
    local v1876 = l_v5_68.new();
    if v1875.key ~= nil then
        v1876.key = v1875.key;
    end;
    if v1875.value ~= nil then
        v1876.value = v2.TemplateArg.jsonDecode(v1875.value);
    end;
    return v1876;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateData_InputsEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InputsEntry"
};
v2.LazyNestedComponentListProp_TemplateData_InputsEntry = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateData_InputsEntry);
v5 = {};
v5.__index = v5;
local l_v5_69 = v5 --[[ copy: 5 -> 75 ]];
v5.new = function(v1878) --[[ Line: 12102 ]] --[[ Name: new ]]
    -- upvalues: l_v5_69 (copy)
    return (setmetatable({
        items = if not (v1878 ~= nil) or v1878.items == nil then {} else v1878.items
    }, l_v5_69));
end;
v5.encode = function(v1879) --[[ Line: 12110 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1880 = buffer.create(0);
    local v1881 = 0;
    if v1879.items ~= nil and #v1879.items > 0 then
        for _, v1883 in v1879.items do
            local v1884 = v1883:encode();
            local v1885, v1886 = v0.writeTag(v1880, v1881, 1, v0.wireTypes.lengthDelimited);
            v1885, v1886 = v0.writeBuffer(v1885, v1886, v1884, buffer.len(v1884));
            v1880 = v1885;
            v1881 = v1886;
        end;
    end;
    local v1887 = buffer.create(v1881);
    buffer.copy(v1887, 0, v1880, 0, v1881);
    return v1887;
end;
v5.decode = function(v1888) --[[ Line: 12129 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_69 (copy), v0 (copy), v2 (copy)
    local v1889 = l_v5_69.new();
    local v1890 = 0;
    while v1890 < buffer.len(v1888) do
        local v1891 = nil;
        local v1892 = nil;
        local v1893, v1894, v1895 = v0.readTag(v1888, v1890);
        v1891 = v1893;
        v1892 = v1894;
        v1890 = v1895;
        if v1892 == v0.wireTypes.varint then
            v1893 = nil;
            v1894, v1895 = v0.readVarInt(v1888, v1890);
            v1893 = v1894;
            v1890 = v1895;
        elseif v1892 == v0.wireTypes.lengthDelimited then
            if v1891 == 1 then
                v1893 = nil;
                v1894, v1895 = v0.readBuffer(v1888, v1890);
                v1893 = v1894;
                v1890 = v1895;
                table.insert(v1889.items, v2.LazyNestedComponentListProp_TemplateData.decode(v1893));
            else
                v1893 = nil;
                v1894, v1895 = v0.readVarInt(v1888, v1890);
                v1890 = v1895 + v1894;
            end;
        elseif v1892 == v0.wireTypes.i32 then
            v1893 = nil;
            v1894, v1895 = v0.readFixed32(v1888, v1890);
            v1893 = v1894;
            v1890 = v1895;
        elseif v1892 == v0.wireTypes.i64 then
            v1893 = nil;
            v1894, v1895 = v0.readFixed64(v1888, v1890);
            v1893 = v1894;
            v1890 = v1895;
        else
            error("Unsupported wire type: " .. v1892);
        end;
    end;
    return v1889;
end;
v5.jsonEncode = function(v1896) --[[ Line: 12174 ]] --[[ Name: jsonEncode ]]
    local v1897 = {};
    if v1896.items ~= nil and #v1896.items > 0 then
        local v1898 = {};
        for _, v1900 in v1896.items do
            table.insert(v1898, v1900:jsonEncode());
        end;
        v1897.items = v1898;
    end;
    return v1897;
end;
v5.jsonDecode = function(v1901) --[[ Line: 12190 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_69 (copy), v2 (copy)
    local v1902 = l_v5_69.new();
    if v1901.items ~= nil then
        local v1903 = {};
        for _, v1905 in v1901.items do
            table.insert(v1903, v2.LazyNestedComponentListProp_TemplateData.jsonDecode(v1905));
        end;
        v1902.items = v1903;
    end;
    return v1902;
end;
v5.descriptor = {
    name = "LazyNestedComponentListProp_TemplateDataList", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateDataList"
};
v2.LazyNestedComponentListProp_TemplateDataList = v5;
v1.default:register(v2.LazyNestedComponentListProp_TemplateDataList);
v5 = {};
v5.__index = v5;
local l_v5_70 = v5 --[[ copy: 5 -> 76 ]];
v5.new = function(v1907) --[[ Line: 12221 ]] --[[ Name: new ]]
    -- upvalues: l_v5_70 (copy)
    return (setmetatable({
        kind = if not (v1907 ~= nil) or v1907.kind == nil then nil else v1907.kind
    }, l_v5_70));
end;
v5.encode = function(v1908) --[[ Line: 12227 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1909 = buffer.create(0);
    local v1910 = 0;
    if v1908.kind ~= nil then
        if v1908.kind.type == "literal" then
            local v1911, v1912 = v0.writeTag(v1909, v1910, 1, v0.wireTypes.lengthDelimited);
            v1911, v1912 = v0.writeString(v1911, v1912, v1908.kind.value);
            v1909 = v1911;
            v1910 = v1912;
        elseif v1908.kind.type == "binding_path" then
            local v1913, v1914 = v0.writeTag(v1909, v1910, 2, v0.wireTypes.lengthDelimited);
            v1913, v1914 = v0.writeString(v1913, v1914, v1908.kind.value);
            v1909 = v1913;
            v1910 = v1914;
        elseif v1908.kind.type == "conditional" then
            local v1915 = v1908.kind.value:encode();
            local v1916, v1917 = v0.writeTag(v1909, v1910, 3, v0.wireTypes.lengthDelimited);
            v1916, v1917 = v0.writeBuffer(v1916, v1917, v1915, buffer.len(v1915));
            v1909 = v1916;
            v1910 = v1917;
        end;
    end;
    local v1918 = buffer.create(v1910);
    buffer.copy(v1918, 0, v1909, 0, v1910);
    return v1918;
end;
v5.decode = function(v1919) --[[ Line: 12250 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_70 (copy), v0 (copy), v2 (copy)
    local v1920 = l_v5_70.new();
    local v1921 = 0;
    while v1921 < buffer.len(v1919) do
        local v1922 = nil;
        local v1923 = nil;
        local v1924, v1925, v1926 = v0.readTag(v1919, v1921);
        v1922 = v1924;
        v1923 = v1925;
        v1921 = v1926;
        if v1923 == v0.wireTypes.varint then
            v1924 = nil;
            v1925, v1926 = v0.readVarInt(v1919, v1921);
            v1924 = v1925;
            v1921 = v1926;
        elseif v1923 == v0.wireTypes.lengthDelimited then
            if v1922 == 1 then
                v1924 = nil;
                v1925, v1926 = v0.readBuffer(v1919, v1921);
                v1924 = v1925;
                v1921 = v1926;
                v1920.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1924)
                };
            elseif v1922 == 2 then
                v1924 = nil;
                v1925, v1926 = v0.readBuffer(v1919, v1921);
                v1924 = v1925;
                v1921 = v1926;
                v1920.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1924)
                };
            elseif v1922 == 3 then
                v1924 = nil;
                v1925, v1926 = v0.readBuffer(v1919, v1921);
                v1924 = v1925;
                v1921 = v1926;
                v1920.kind = {
                    type = "conditional", 
                    value = v2.IconProp_ConditionalOptions.decode(v1924)
                };
            else
                v1924 = nil;
                v1925, v1926 = v0.readVarInt(v1919, v1921);
                v1921 = v1926 + v1925;
            end;
        elseif v1923 == v0.wireTypes.i32 then
            v1924 = nil;
            v1925, v1926 = v0.readFixed32(v1919, v1921);
            v1924 = v1925;
            v1921 = v1926;
        elseif v1923 == v0.wireTypes.i64 then
            v1924 = nil;
            v1925, v1926 = v0.readFixed64(v1919, v1921);
            v1924 = v1925;
            v1921 = v1926;
        else
            error("Unsupported wire type: " .. v1923);
        end;
    end;
    return v1920;
end;
v5.jsonEncode = function(v1927) --[[ Line: 12303 ]] --[[ Name: jsonEncode ]]
    local v1928 = {};
    if v1927.kind ~= nil then
        if v1927.kind.type == "literal" then
            v1928.literal = v1927.kind.value;
            return v1928;
        elseif v1927.kind.type == "binding_path" then
            v1928.bindingPath = v1927.kind.value;
            return v1928;
        elseif v1927.kind.type == "conditional" then
            v1928.conditional = v1927.kind.value:jsonEncode();
        end;
    end;
    return v1928;
end;
v5.jsonDecode = function(v1929) --[[ Line: 12319 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_70 (copy), v2 (copy)
    local v1930 = l_v5_70.new();
    if v1929.literal ~= nil then
        v1930.kind = {
            type = "literal", 
            value = v1929.literal
        };
    end;
    if v1929.binding_path ~= nil then
        v1930.kind = {
            type = "binding_path", 
            value = v1929.binding_path
        };
    end;
    if v1929.bindingPath ~= nil then
        v1930.kind = {
            type = "binding_path", 
            value = v1929.bindingPath
        };
    end;
    if v1929.conditional ~= nil then
        v1930.kind = {
            type = "conditional", 
            value = v2.IconProp_ConditionalOptions.jsonDecode(v1929.conditional)
        };
    end;
    return v1930;
end;
v5.descriptor = {
    name = "IconProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
};
v2.IconProp = v5;
v1.default:register(v2.IconProp);
v5 = {};
v5.__index = v5;
local l_v5_71 = v5 --[[ copy: 5 -> 77 ]];
v5.new = function(v1932) --[[ Line: 12356 ]] --[[ Name: new ]]
    -- upvalues: l_v5_71 (copy)
    return (setmetatable({
        condition = if not (v1932 ~= nil) or v1932.condition == nil then nil else v1932.condition, 
        kind = if not (v1932 ~= nil) or v1932.kind == nil then nil else v1932.kind
    }, l_v5_71));
end;
v5.encode = function(v1933) --[[ Line: 12365 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1934 = buffer.create(0);
    local v1935 = 0;
    if v1933.condition ~= nil then
        local v1936 = v1933.condition:encode();
        local v1937, v1938 = v0.writeTag(v1934, v1935, 1, v0.wireTypes.lengthDelimited);
        v1937, v1938 = v0.writeBuffer(v1937, v1938, v1936, buffer.len(v1936));
        v1934 = v1937;
        v1935 = v1938;
    end;
    if v1933.kind ~= nil then
        if v1933.kind.type == "literal" then
            local v1939, v1940 = v0.writeTag(v1934, v1935, 2, v0.wireTypes.lengthDelimited);
            v1939, v1940 = v0.writeString(v1939, v1940, v1933.kind.value);
            v1934 = v1939;
            v1935 = v1940;
        elseif v1933.kind.type == "binding_path" then
            local v1941, v1942 = v0.writeTag(v1934, v1935, 3, v0.wireTypes.lengthDelimited);
            v1941, v1942 = v0.writeString(v1941, v1942, v1933.kind.value);
            v1934 = v1941;
            v1935 = v1942;
        end;
    end;
    local v1943 = buffer.create(v1935);
    buffer.copy(v1943, 0, v1934, 0, v1935);
    return v1943;
end;
v5.decode = function(v1944) --[[ Line: 12390 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_71 (copy), v0 (copy), v4 (copy)
    local v1945 = l_v5_71.new();
    local v1946 = 0;
    while v1946 < buffer.len(v1944) do
        local v1947 = nil;
        local v1948 = nil;
        local v1949, v1950, v1951 = v0.readTag(v1944, v1946);
        v1947 = v1949;
        v1948 = v1950;
        v1946 = v1951;
        if v1948 == v0.wireTypes.varint then
            v1949 = nil;
            v1950, v1951 = v0.readVarInt(v1944, v1946);
            v1949 = v1950;
            v1946 = v1951;
        elseif v1948 == v0.wireTypes.lengthDelimited then
            if v1947 == 1 then
                v1949 = nil;
                v1950, v1951 = v0.readBuffer(v1944, v1946);
                v1949 = v1950;
                v1946 = v1951;
                v1945.condition = v4.PropCondition.decode(v1949);
            elseif v1947 == 2 then
                v1949 = nil;
                v1950, v1951 = v0.readBuffer(v1944, v1946);
                v1949 = v1950;
                v1946 = v1951;
                v1945.kind = {
                    type = "literal", 
                    value = buffer.tostring(v1949)
                };
            elseif v1947 == 3 then
                v1949 = nil;
                v1950, v1951 = v0.readBuffer(v1944, v1946);
                v1949 = v1950;
                v1946 = v1951;
                v1945.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v1949)
                };
            else
                v1949 = nil;
                v1950, v1951 = v0.readVarInt(v1944, v1946);
                v1946 = v1951 + v1950;
            end;
        elseif v1948 == v0.wireTypes.i32 then
            v1949 = nil;
            v1950, v1951 = v0.readFixed32(v1944, v1946);
            v1949 = v1950;
            v1946 = v1951;
        elseif v1948 == v0.wireTypes.i64 then
            v1949 = nil;
            v1950, v1951 = v0.readFixed64(v1944, v1946);
            v1949 = v1950;
            v1946 = v1951;
        else
            error("Unsupported wire type: " .. v1948);
        end;
    end;
    return v1945;
end;
v5.jsonEncode = function(v1952) --[[ Line: 12443 ]] --[[ Name: jsonEncode ]]
    local v1953 = {};
    if v1952.condition ~= nil then
        v1953.condition = v1952.condition:jsonEncode();
    end;
    if v1952.kind ~= nil then
        if v1952.kind.type == "literal" then
            v1953.literal = v1952.kind.value;
            return v1953;
        elseif v1952.kind.type == "binding_path" then
            v1953.bindingPath = v1952.kind.value;
        end;
    end;
    return v1953;
end;
v5.jsonDecode = function(v1954) --[[ Line: 12461 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_71 (copy), v4 (copy)
    local v1955 = l_v5_71.new();
    if v1954.condition ~= nil then
        v1955.condition = v4.PropCondition.jsonDecode(v1954.condition);
    end;
    if v1954.literal ~= nil then
        v1955.kind = {
            type = "literal", 
            value = v1954.literal
        };
    end;
    if v1954.binding_path ~= nil then
        v1955.kind = {
            type = "binding_path", 
            value = v1954.binding_path
        };
    end;
    if v1954.bindingPath ~= nil then
        v1955.kind = {
            type = "binding_path", 
            value = v1954.bindingPath
        };
    end;
    return v1955;
end;
v5.descriptor = {
    name = "IconProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.IconProp_ConditionalOption = v5;
v1.default:register(v2.IconProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_72 = v5 --[[ copy: 5 -> 78 ]];
v5.new = function(v1957) --[[ Line: 12498 ]] --[[ Name: new ]]
    -- upvalues: l_v5_72 (copy)
    return (setmetatable({
        options = if not (v1957 ~= nil) or v1957.options == nil then {} else v1957.options
    }, l_v5_72));
end;
v5.encode = function(v1958) --[[ Line: 12506 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1959 = buffer.create(0);
    local v1960 = 0;
    if v1958.options ~= nil and #v1958.options > 0 then
        for _, v1962 in v1958.options do
            local v1963 = v1962:encode();
            local v1964, v1965 = v0.writeTag(v1959, v1960, 1, v0.wireTypes.lengthDelimited);
            v1964, v1965 = v0.writeBuffer(v1964, v1965, v1963, buffer.len(v1963));
            v1959 = v1964;
            v1960 = v1965;
        end;
    end;
    local v1966 = buffer.create(v1960);
    buffer.copy(v1966, 0, v1959, 0, v1960);
    return v1966;
end;
v5.decode = function(v1967) --[[ Line: 12523 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_72 (copy), v0 (copy), v2 (copy)
    local v1968 = l_v5_72.new();
    local v1969 = 0;
    while v1969 < buffer.len(v1967) do
        local v1970 = nil;
        local v1971 = nil;
        local v1972, v1973, v1974 = v0.readTag(v1967, v1969);
        v1970 = v1972;
        v1971 = v1973;
        v1969 = v1974;
        if v1971 == v0.wireTypes.varint then
            v1972 = nil;
            v1973, v1974 = v0.readVarInt(v1967, v1969);
            v1972 = v1973;
            v1969 = v1974;
        elseif v1971 == v0.wireTypes.lengthDelimited then
            if v1970 == 1 then
                v1972 = nil;
                v1973, v1974 = v0.readBuffer(v1967, v1969);
                v1972 = v1973;
                v1969 = v1974;
                table.insert(v1968.options, v2.IconProp_ConditionalOption.decode(v1972));
            else
                v1972 = nil;
                v1973, v1974 = v0.readVarInt(v1967, v1969);
                v1969 = v1974 + v1973;
            end;
        elseif v1971 == v0.wireTypes.i32 then
            v1972 = nil;
            v1973, v1974 = v0.readFixed32(v1967, v1969);
            v1972 = v1973;
            v1969 = v1974;
        elseif v1971 == v0.wireTypes.i64 then
            v1972 = nil;
            v1973, v1974 = v0.readFixed64(v1967, v1969);
            v1972 = v1973;
            v1969 = v1974;
        else
            error("Unsupported wire type: " .. v1971);
        end;
    end;
    return v1968;
end;
v5.jsonEncode = function(v1975) --[[ Line: 12566 ]] --[[ Name: jsonEncode ]]
    local v1976 = {};
    if v1975.options ~= nil and #v1975.options > 0 then
        local v1977 = {};
        for _, v1979 in v1975.options do
            table.insert(v1977, v1979:jsonEncode());
        end;
        v1976.options = v1977;
    end;
    return v1976;
end;
v5.jsonDecode = function(v1980) --[[ Line: 12580 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_72 (copy), v2 (copy)
    local v1981 = l_v5_72.new();
    if v1980.options ~= nil then
        local v1982 = {};
        for _, v1984 in v1980.options do
            table.insert(v1982, v2.IconProp_ConditionalOption.jsonDecode(v1984));
        end;
        v1981.options = v1982;
    end;
    return v1981;
end;
v5.descriptor = {
    name = "IconProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.IconProp_ConditionalOptions = v5;
v1.default:register(v2.IconProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_73 = v5 --[[ copy: 5 -> 79 ]];
v5.new = function(v1986) --[[ Line: 12609 ]] --[[ Name: new ]]
    -- upvalues: l_v5_73 (copy)
    return (setmetatable({
        kind = if not (v1986 ~= nil) or v1986.kind == nil then nil else v1986.kind
    }, l_v5_73));
end;
v5.encode = function(v1987) --[[ Line: 12615 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v1988 = buffer.create(0);
    local v1989 = 0;
    if v1987.kind ~= nil then
        if v1987.kind.type == "literal" then
            local v1990 = v1987.kind.value:encode();
            local v1991, v1992 = v0.writeTag(v1988, v1989, 1, v0.wireTypes.lengthDelimited);
            v1991, v1992 = v0.writeBuffer(v1991, v1992, v1990, buffer.len(v1990));
            v1988 = v1991;
            v1989 = v1992;
        elseif v1987.kind.type == "conditional" then
            local v1993 = v1987.kind.value:encode();
            local v1994, v1995 = v0.writeTag(v1988, v1989, 2, v0.wireTypes.lengthDelimited);
            v1994, v1995 = v0.writeBuffer(v1994, v1995, v1993, buffer.len(v1993));
            v1988 = v1994;
            v1989 = v1995;
        end;
    end;
    local v1996 = buffer.create(v1989);
    buffer.copy(v1996, 0, v1988, 0, v1989);
    return v1996;
end;
v5.decode = function(v1997) --[[ Line: 12636 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_73 (copy), v0 (copy), v2 (copy)
    local v1998 = l_v5_73.new();
    local v1999 = 0;
    while v1999 < buffer.len(v1997) do
        local v2000 = nil;
        local v2001 = nil;
        local v2002, v2003, v2004 = v0.readTag(v1997, v1999);
        v2000 = v2002;
        v2001 = v2003;
        v1999 = v2004;
        if v2001 == v0.wireTypes.varint then
            v2002 = nil;
            v2003, v2004 = v0.readVarInt(v1997, v1999);
            v2002 = v2003;
            v1999 = v2004;
        elseif v2001 == v0.wireTypes.lengthDelimited then
            if v2000 == 1 then
                v2002 = nil;
                v2003, v2004 = v0.readBuffer(v1997, v1999);
                v2002 = v2003;
                v1999 = v2004;
                v1998.kind = {
                    type = "literal", 
                    value = v2.GradientProp_GradientData.decode(v2002)
                };
            elseif v2000 == 2 then
                v2002 = nil;
                v2003, v2004 = v0.readBuffer(v1997, v1999);
                v2002 = v2003;
                v1999 = v2004;
                v1998.kind = {
                    type = "conditional", 
                    value = v2.GradientProp_ConditionalOptions.decode(v2002)
                };
            else
                v2002 = nil;
                v2003, v2004 = v0.readVarInt(v1997, v1999);
                v1999 = v2004 + v2003;
            end;
        elseif v2001 == v0.wireTypes.i32 then
            v2002 = nil;
            v2003, v2004 = v0.readFixed32(v1997, v1999);
            v2002 = v2003;
            v1999 = v2004;
        elseif v2001 == v0.wireTypes.i64 then
            v2002 = nil;
            v2003, v2004 = v0.readFixed64(v1997, v1999);
            v2002 = v2003;
            v1999 = v2004;
        else
            error("Unsupported wire type: " .. v2001);
        end;
    end;
    return v1998;
end;
v5.jsonEncode = function(v2005) --[[ Line: 12684 ]] --[[ Name: jsonEncode ]]
    local v2006 = {};
    if v2005.kind ~= nil then
        if v2005.kind.type == "literal" then
            v2006.literal = v2005.kind.value:jsonEncode();
            return v2006;
        elseif v2005.kind.type == "conditional" then
            v2006.conditional = v2005.kind.value:jsonEncode();
        end;
    end;
    return v2006;
end;
v5.jsonDecode = function(v2007) --[[ Line: 12698 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_73 (copy), v2 (copy)
    local v2008 = l_v5_73.new();
    if v2007.literal ~= nil then
        v2008.kind = {
            type = "literal", 
            value = v2.GradientProp_GradientData.jsonDecode(v2007.literal)
        };
    end;
    if v2007.conditional ~= nil then
        v2008.kind = {
            type = "conditional", 
            value = v2.GradientProp_ConditionalOptions.jsonDecode(v2007.conditional)
        };
    end;
    return v2008;
end;
v5.descriptor = {
    name = "GradientProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
};
v2.GradientProp = v5;
v1.default:register(v2.GradientProp);
v5 = {};
v5.__index = v5;
local l_v5_74 = v5 --[[ copy: 5 -> 80 ]];
v5.new = function(v2010) --[[ Line: 12727 ]] --[[ Name: new ]]
    -- upvalues: l_v5_74 (copy)
    return (setmetatable({
        condition = if not (v2010 ~= nil) or v2010.condition == nil then nil else v2010.condition, 
        kind = if not (v2010 ~= nil) or v2010.kind == nil then nil else v2010.kind
    }, l_v5_74));
end;
v5.encode = function(v2011) --[[ Line: 12736 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2012 = buffer.create(0);
    local v2013 = 0;
    if v2011.condition ~= nil then
        local v2014 = v2011.condition:encode();
        local v2015, v2016 = v0.writeTag(v2012, v2013, 1, v0.wireTypes.lengthDelimited);
        v2015, v2016 = v0.writeBuffer(v2015, v2016, v2014, buffer.len(v2014));
        v2012 = v2015;
        v2013 = v2016;
    end;
    if v2011.kind ~= nil and v2011.kind.type == "literal" then
        local v2017 = v2011.kind.value:encode();
        local v2018, v2019 = v0.writeTag(v2012, v2013, 2, v0.wireTypes.lengthDelimited);
        v2018, v2019 = v0.writeBuffer(v2018, v2019, v2017, buffer.len(v2017));
        v2012 = v2018;
        v2013 = v2019;
    end;
    local v2020 = buffer.create(v2013);
    buffer.copy(v2020, 0, v2012, 0, v2013);
    return v2020;
end;
v5.decode = function(v2021) --[[ Line: 12759 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_74 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v2022 = l_v5_74.new();
    local v2023 = 0;
    while v2023 < buffer.len(v2021) do
        local v2024 = nil;
        local v2025 = nil;
        local v2026, v2027, v2028 = v0.readTag(v2021, v2023);
        v2024 = v2026;
        v2025 = v2027;
        v2023 = v2028;
        if v2025 == v0.wireTypes.varint then
            v2026 = nil;
            v2027, v2028 = v0.readVarInt(v2021, v2023);
            v2026 = v2027;
            v2023 = v2028;
        elseif v2025 == v0.wireTypes.lengthDelimited then
            if v2024 == 1 then
                v2026 = nil;
                v2027, v2028 = v0.readBuffer(v2021, v2023);
                v2026 = v2027;
                v2023 = v2028;
                v2022.condition = v4.PropCondition.decode(v2026);
            elseif v2024 == 2 then
                v2026 = nil;
                v2027, v2028 = v0.readBuffer(v2021, v2023);
                v2026 = v2027;
                v2023 = v2028;
                v2022.kind = {
                    type = "literal", 
                    value = v2.GradientProp_GradientData.decode(v2026)
                };
            else
                v2026 = nil;
                v2027, v2028 = v0.readVarInt(v2021, v2023);
                v2023 = v2028 + v2027;
            end;
        elseif v2025 == v0.wireTypes.i32 then
            v2026 = nil;
            v2027, v2028 = v0.readFixed32(v2021, v2023);
            v2026 = v2027;
            v2023 = v2028;
        elseif v2025 == v0.wireTypes.i64 then
            v2026 = nil;
            v2027, v2028 = v0.readFixed64(v2021, v2023);
            v2026 = v2027;
            v2023 = v2028;
        else
            error("Unsupported wire type: " .. v2025);
        end;
    end;
    return v2022;
end;
v5.jsonEncode = function(v2029) --[[ Line: 12807 ]] --[[ Name: jsonEncode ]]
    local v2030 = {};
    if v2029.condition ~= nil then
        v2030.condition = v2029.condition:jsonEncode();
    end;
    if v2029.kind ~= nil and v2029.kind.type == "literal" then
        v2030.literal = v2029.kind.value:jsonEncode();
    end;
    return v2030;
end;
v5.jsonDecode = function(v2031) --[[ Line: 12823 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_74 (copy), v4 (copy), v2 (copy)
    local v2032 = l_v5_74.new();
    if v2031.condition ~= nil then
        v2032.condition = v4.PropCondition.jsonDecode(v2031.condition);
    end;
    if v2031.literal ~= nil then
        v2032.kind = {
            type = "literal", 
            value = v2.GradientProp_GradientData.jsonDecode(v2031.literal)
        };
    end;
    return v2032;
end;
v5.descriptor = {
    name = "GradientProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.GradientProp_ConditionalOption = v5;
v1.default:register(v2.GradientProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_75 = v5 --[[ copy: 5 -> 81 ]];
v5.new = function(v2034) --[[ Line: 12852 ]] --[[ Name: new ]]
    -- upvalues: l_v5_75 (copy)
    return (setmetatable({
        options = if not (v2034 ~= nil) or v2034.options == nil then {} else v2034.options
    }, l_v5_75));
end;
v5.encode = function(v2035) --[[ Line: 12860 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2036 = buffer.create(0);
    local v2037 = 0;
    if v2035.options ~= nil and #v2035.options > 0 then
        for _, v2039 in v2035.options do
            local v2040 = v2039:encode();
            local v2041, v2042 = v0.writeTag(v2036, v2037, 1, v0.wireTypes.lengthDelimited);
            v2041, v2042 = v0.writeBuffer(v2041, v2042, v2040, buffer.len(v2040));
            v2036 = v2041;
            v2037 = v2042;
        end;
    end;
    local v2043 = buffer.create(v2037);
    buffer.copy(v2043, 0, v2036, 0, v2037);
    return v2043;
end;
v5.decode = function(v2044) --[[ Line: 12877 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_75 (copy), v0 (copy), v2 (copy)
    local v2045 = l_v5_75.new();
    local v2046 = 0;
    while v2046 < buffer.len(v2044) do
        local v2047 = nil;
        local v2048 = nil;
        local v2049, v2050, v2051 = v0.readTag(v2044, v2046);
        v2047 = v2049;
        v2048 = v2050;
        v2046 = v2051;
        if v2048 == v0.wireTypes.varint then
            v2049 = nil;
            v2050, v2051 = v0.readVarInt(v2044, v2046);
            v2049 = v2050;
            v2046 = v2051;
        elseif v2048 == v0.wireTypes.lengthDelimited then
            if v2047 == 1 then
                v2049 = nil;
                v2050, v2051 = v0.readBuffer(v2044, v2046);
                v2049 = v2050;
                v2046 = v2051;
                table.insert(v2045.options, v2.GradientProp_ConditionalOption.decode(v2049));
            else
                v2049 = nil;
                v2050, v2051 = v0.readVarInt(v2044, v2046);
                v2046 = v2051 + v2050;
            end;
        elseif v2048 == v0.wireTypes.i32 then
            v2049 = nil;
            v2050, v2051 = v0.readFixed32(v2044, v2046);
            v2049 = v2050;
            v2046 = v2051;
        elseif v2048 == v0.wireTypes.i64 then
            v2049 = nil;
            v2050, v2051 = v0.readFixed64(v2044, v2046);
            v2049 = v2050;
            v2046 = v2051;
        else
            error("Unsupported wire type: " .. v2048);
        end;
    end;
    return v2045;
end;
v5.jsonEncode = function(v2052) --[[ Line: 12920 ]] --[[ Name: jsonEncode ]]
    local v2053 = {};
    if v2052.options ~= nil and #v2052.options > 0 then
        local v2054 = {};
        for _, v2056 in v2052.options do
            table.insert(v2054, v2056:jsonEncode());
        end;
        v2053.options = v2054;
    end;
    return v2053;
end;
v5.jsonDecode = function(v2057) --[[ Line: 12934 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_75 (copy), v2 (copy)
    local v2058 = l_v5_75.new();
    if v2057.options ~= nil then
        local v2059 = {};
        for _, v2061 in v2057.options do
            table.insert(v2059, v2.GradientProp_ConditionalOption.jsonDecode(v2061));
        end;
        v2058.options = v2059;
    end;
    return v2058;
end;
v5.descriptor = {
    name = "GradientProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.GradientProp_ConditionalOptions = v5;
v1.default:register(v2.GradientProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_76 = v5 --[[ copy: 5 -> 82 ]];
v5.new = function(v2063) --[[ Line: 12963 ]] --[[ Name: new ]]
    -- upvalues: l_v5_76 (copy)
    return (setmetatable({
        start_color = (not (v2063 ~= nil) or v2063.start_color == nil) and "" or v2063.start_color, 
        end_color = (not (v2063 ~= nil) or v2063.end_color == nil) and "" or v2063.end_color, 
        start_opacity = (not (v2063 ~= nil) or v2063.start_opacity == nil) and 0 or v2063.start_opacity, 
        end_opacity = (not (v2063 ~= nil) or v2063.end_opacity == nil) and 0 or v2063.end_opacity, 
        degree = (not (v2063 ~= nil) or v2063.degree == nil) and 0 or v2063.degree
    }, l_v5_76));
end;
v5.encode = function(v2064) --[[ Line: 12975 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2065 = buffer.create(0);
    local v2066 = 0;
    if v2064.start_color ~= nil and v2064.start_color ~= "" then
        local v2067, v2068 = v0.writeTag(v2065, v2066, 1, v0.wireTypes.lengthDelimited);
        v2067, v2068 = v0.writeString(v2067, v2068, v2064.start_color);
        v2065 = v2067;
        v2066 = v2068;
    end;
    if v2064.end_color ~= nil and v2064.end_color ~= "" then
        local v2069, v2070 = v0.writeTag(v2065, v2066, 2, v0.wireTypes.lengthDelimited);
        v2069, v2070 = v0.writeString(v2069, v2070, v2064.end_color);
        v2065 = v2069;
        v2066 = v2070;
    end;
    if v2064.start_opacity ~= nil and v2064.start_opacity ~= 0 then
        local v2071, v2072 = v0.writeTag(v2065, v2066, 3, v0.wireTypes.i32);
        v2071, v2072 = v0.writeFloat(v2071, v2072, v2064.start_opacity);
        v2065 = v2071;
        v2066 = v2072;
    end;
    if v2064.end_opacity ~= nil and v2064.end_opacity ~= 0 then
        local v2073, v2074 = v0.writeTag(v2065, v2066, 4, v0.wireTypes.i32);
        v2073, v2074 = v0.writeFloat(v2073, v2074, v2064.end_opacity);
        v2065 = v2073;
        v2066 = v2074;
    end;
    if v2064.degree ~= nil and v2064.degree ~= 0 then
        local v2075, v2076 = v0.writeTag(v2065, v2066, 5, v0.wireTypes.varint);
        v2075, v2076 = v0.writeVarInt(v2075, v2076, v2064.degree);
        v2065 = v2075;
        v2066 = v2076;
    end;
    local v2077 = buffer.create(v2066);
    buffer.copy(v2077, 0, v2065, 0, v2066);
    return v2077;
end;
v5.decode = function(v2078) --[[ Line: 13009 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_76 (copy), v0 (copy)
    local v2079 = l_v5_76.new();
    local v2080 = 0;
    while v2080 < buffer.len(v2078) do
        local v2081 = nil;
        local v2082 = nil;
        local v2083, v2084, v2085 = v0.readTag(v2078, v2080);
        v2081 = v2083;
        v2082 = v2084;
        v2080 = v2085;
        if v2082 == v0.wireTypes.varint then
            if v2081 == 5 then
                v2083 = nil;
                v2084, v2085 = v0.readVarIntI32(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                v2079.degree = v2083;
            else
                v2083 = nil;
                v2084, v2085 = v0.readVarInt(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
            end;
        elseif v2082 == v0.wireTypes.lengthDelimited then
            if v2081 == 1 then
                v2083 = nil;
                v2084, v2085 = v0.readBuffer(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                v2079.start_color = buffer.tostring(v2083);
            elseif v2081 == 2 then
                v2083 = nil;
                v2084, v2085 = v0.readBuffer(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                v2079.end_color = buffer.tostring(v2083);
            else
                v2083 = nil;
                v2084, v2085 = v0.readVarInt(v2078, v2080);
                v2080 = v2085 + v2084;
            end;
        elseif v2082 == v0.wireTypes.i32 then
            if v2081 == 3 then
                v2083 = nil;
                v2084, v2085 = v0.readFloat(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                v2079.start_opacity = v2083;
            elseif v2081 == 4 then
                v2083 = nil;
                v2084, v2085 = v0.readFloat(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
                v2079.end_opacity = v2083;
            else
                v2083 = nil;
                v2084, v2085 = v0.readFixed32(v2078, v2080);
                v2083 = v2084;
                v2080 = v2085;
            end;
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
v5.jsonEncode = function(v2086) --[[ Line: 13072 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v2087 = {};
    if v2086.start_color ~= nil and v2086.start_color ~= "" then
        v2087.startColor = v2086.start_color;
    end;
    if v2086.end_color ~= nil and v2086.end_color ~= "" then
        v2087.endColor = v2086.end_color;
    end;
    if v2086.start_opacity ~= nil and v2086.start_opacity ~= 0 then
        v2087.startOpacity = v0.json.serializeNumber(v2086.start_opacity);
    end;
    if v2086.end_opacity ~= nil and v2086.end_opacity ~= 0 then
        v2087.endOpacity = v0.json.serializeNumber(v2086.end_opacity);
    end;
    if v2086.degree ~= nil and v2086.degree ~= 0 then
        v2087.degree = v2086.degree;
    end;
    return v2087;
end;
v5.jsonDecode = function(v2088) --[[ Line: 13098 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_76 (copy), v0 (copy)
    local v2089 = l_v5_76.new();
    if v2088.start_color ~= nil then
        v2089.start_color = v2088.start_color;
    end;
    if v2088.startColor ~= nil then
        v2089.start_color = v2088.startColor;
    end;
    if v2088.end_color ~= nil then
        v2089.end_color = v2088.end_color;
    end;
    if v2088.endColor ~= nil then
        v2089.end_color = v2088.endColor;
    end;
    if v2088.start_opacity ~= nil then
        v2089.start_opacity = v0.json.deserializeNumber(v2088.start_opacity);
    end;
    if v2088.startOpacity ~= nil then
        v2089.start_opacity = v0.json.deserializeNumber(v2088.startOpacity);
    end;
    if v2088.end_opacity ~= nil then
        v2089.end_opacity = v0.json.deserializeNumber(v2088.end_opacity);
    end;
    if v2088.endOpacity ~= nil then
        v2089.end_opacity = v0.json.deserializeNumber(v2088.endOpacity);
    end;
    if v2088.degree ~= nil then
        v2089.degree = v2088.degree;
    end;
    return v2089;
end;
v5.descriptor = {
    name = "GradientProp_GradientData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
};
v2.GradientProp_GradientData = v5;
v1.default:register(v2.GradientProp_GradientData);
v5 = {};
v5.__index = v5;
local l_v5_77 = v5 --[[ copy: 5 -> 83 ]];
v5.new = function(v2091) --[[ Line: 13154 ]] --[[ Name: new ]]
    -- upvalues: l_v5_77 (copy)
    return (setmetatable({
        kind = if not (v2091 ~= nil) or v2091.kind == nil then nil else v2091.kind
    }, l_v5_77));
end;
v5.encode = function(v2092) --[[ Line: 13160 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2093 = buffer.create(0);
    local v2094 = 0;
    if v2092.kind ~= nil then
        if v2092.kind.type == "literal" then
            local v2095 = v2092.kind.value:encode();
            local v2096, v2097 = v0.writeTag(v2093, v2094, 1, v0.wireTypes.lengthDelimited);
            v2096, v2097 = v0.writeBuffer(v2096, v2097, v2095, buffer.len(v2095));
            v2093 = v2096;
            v2094 = v2097;
        elseif v2092.kind.type == "binding_path" then
            local v2098, v2099 = v0.writeTag(v2093, v2094, 2, v0.wireTypes.lengthDelimited);
            v2098, v2099 = v0.writeString(v2098, v2099, v2092.kind.value);
            v2093 = v2098;
            v2094 = v2099;
        elseif v2092.kind.type == "conditional" then
            local v2100 = v2092.kind.value:encode();
            local v2101, v2102 = v0.writeTag(v2093, v2094, 3, v0.wireTypes.lengthDelimited);
            v2101, v2102 = v0.writeBuffer(v2101, v2102, v2100, buffer.len(v2100));
            v2093 = v2101;
            v2094 = v2102;
        end;
    end;
    local v2103 = buffer.create(v2094);
    buffer.copy(v2103, 0, v2093, 0, v2094);
    return v2103;
end;
v5.decode = function(v2104) --[[ Line: 13184 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_77 (copy), v0 (copy), v2 (copy)
    local v2105 = l_v5_77.new();
    local v2106 = 0;
    while v2106 < buffer.len(v2104) do
        local v2107 = nil;
        local v2108 = nil;
        local v2109, v2110, v2111 = v0.readTag(v2104, v2106);
        v2107 = v2109;
        v2108 = v2110;
        v2106 = v2111;
        if v2108 == v0.wireTypes.varint then
            v2109 = nil;
            v2110, v2111 = v0.readVarInt(v2104, v2106);
            v2109 = v2110;
            v2106 = v2111;
        elseif v2108 == v0.wireTypes.lengthDelimited then
            if v2107 == 1 then
                v2109 = nil;
                v2110, v2111 = v0.readBuffer(v2104, v2106);
                v2109 = v2110;
                v2106 = v2111;
                v2105.kind = {
                    type = "literal", 
                    value = v2.ArrayOfStructProp_ArrayOfStructs.decode(v2109)
                };
            elseif v2107 == 2 then
                v2109 = nil;
                v2110, v2111 = v0.readBuffer(v2104, v2106);
                v2109 = v2110;
                v2106 = v2111;
                v2105.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2109)
                };
            elseif v2107 == 3 then
                v2109 = nil;
                v2110, v2111 = v0.readBuffer(v2104, v2106);
                v2109 = v2110;
                v2106 = v2111;
                v2105.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfStructProp_ConditionalOptions.decode(v2109)
                };
            else
                v2109 = nil;
                v2110, v2111 = v0.readVarInt(v2104, v2106);
                v2106 = v2111 + v2110;
            end;
        elseif v2108 == v0.wireTypes.i32 then
            v2109 = nil;
            v2110, v2111 = v0.readFixed32(v2104, v2106);
            v2109 = v2110;
            v2106 = v2111;
        elseif v2108 == v0.wireTypes.i64 then
            v2109 = nil;
            v2110, v2111 = v0.readFixed64(v2104, v2106);
            v2109 = v2110;
            v2106 = v2111;
        else
            error("Unsupported wire type: " .. v2108);
        end;
    end;
    return v2105;
end;
v5.jsonEncode = function(v2112) --[[ Line: 13238 ]] --[[ Name: jsonEncode ]]
    local v2113 = {};
    if v2112.kind ~= nil then
        if v2112.kind.type == "literal" then
            v2113.literal = v2112.kind.value:jsonEncode();
            return v2113;
        elseif v2112.kind.type == "binding_path" then
            v2113.bindingPath = v2112.kind.value;
            return v2113;
        elseif v2112.kind.type == "conditional" then
            v2113.conditional = v2112.kind.value:jsonEncode();
        end;
    end;
    return v2113;
end;
v5.jsonDecode = function(v2114) --[[ Line: 13254 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_77 (copy), v2 (copy)
    local v2115 = l_v5_77.new();
    if v2114.literal ~= nil then
        v2115.kind = {
            type = "literal", 
            value = v2.ArrayOfStructProp_ArrayOfStructs.jsonDecode(v2114.literal)
        };
    end;
    if v2114.binding_path ~= nil then
        v2115.kind = {
            type = "binding_path", 
            value = v2114.binding_path
        };
    end;
    if v2114.bindingPath ~= nil then
        v2115.kind = {
            type = "binding_path", 
            value = v2114.bindingPath
        };
    end;
    if v2114.conditional ~= nil then
        v2115.kind = {
            type = "conditional", 
            value = v2.ArrayOfStructProp_ConditionalOptions.jsonDecode(v2114.conditional)
        };
    end;
    return v2115;
end;
v5.descriptor = {
    name = "ArrayOfStructProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
};
v2.ArrayOfStructProp = v5;
v1.default:register(v2.ArrayOfStructProp);
v5 = {};
v5.__index = v5;
local l_v5_78 = v5 --[[ copy: 5 -> 84 ]];
v5.new = function(v2117) --[[ Line: 13294 ]] --[[ Name: new ]]
    -- upvalues: l_v5_78 (copy)
    return (setmetatable({
        condition = if not (v2117 ~= nil) or v2117.condition == nil then nil else v2117.condition, 
        kind = if not (v2117 ~= nil) or v2117.kind == nil then nil else v2117.kind
    }, l_v5_78));
end;
v5.encode = function(v2118) --[[ Line: 13303 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2119 = buffer.create(0);
    local v2120 = 0;
    if v2118.condition ~= nil then
        local v2121 = v2118.condition:encode();
        local v2122, v2123 = v0.writeTag(v2119, v2120, 1, v0.wireTypes.lengthDelimited);
        v2122, v2123 = v0.writeBuffer(v2122, v2123, v2121, buffer.len(v2121));
        v2119 = v2122;
        v2120 = v2123;
    end;
    if v2118.kind ~= nil then
        if v2118.kind.type == "literal" then
            local v2124 = v2118.kind.value:encode();
            local v2125, v2126 = v0.writeTag(v2119, v2120, 2, v0.wireTypes.lengthDelimited);
            v2125, v2126 = v0.writeBuffer(v2125, v2126, v2124, buffer.len(v2124));
            v2119 = v2125;
            v2120 = v2126;
        elseif v2118.kind.type == "binding_path" then
            local v2127, v2128 = v0.writeTag(v2119, v2120, 3, v0.wireTypes.lengthDelimited);
            v2127, v2128 = v0.writeString(v2127, v2128, v2118.kind.value);
            v2119 = v2127;
            v2120 = v2128;
        end;
    end;
    local v2129 = buffer.create(v2120);
    buffer.copy(v2129, 0, v2119, 0, v2120);
    return v2129;
end;
v5.decode = function(v2130) --[[ Line: 13329 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_78 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v2131 = l_v5_78.new();
    local v2132 = 0;
    while v2132 < buffer.len(v2130) do
        local v2133 = nil;
        local v2134 = nil;
        local v2135, v2136, v2137 = v0.readTag(v2130, v2132);
        v2133 = v2135;
        v2134 = v2136;
        v2132 = v2137;
        if v2134 == v0.wireTypes.varint then
            v2135 = nil;
            v2136, v2137 = v0.readVarInt(v2130, v2132);
            v2135 = v2136;
            v2132 = v2137;
        elseif v2134 == v0.wireTypes.lengthDelimited then
            if v2133 == 1 then
                v2135 = nil;
                v2136, v2137 = v0.readBuffer(v2130, v2132);
                v2135 = v2136;
                v2132 = v2137;
                v2131.condition = v4.PropCondition.decode(v2135);
            elseif v2133 == 2 then
                v2135 = nil;
                v2136, v2137 = v0.readBuffer(v2130, v2132);
                v2135 = v2136;
                v2132 = v2137;
                v2131.kind = {
                    type = "literal", 
                    value = v2.ArrayOfStructProp_ArrayOfStructs.decode(v2135)
                };
            elseif v2133 == 3 then
                v2135 = nil;
                v2136, v2137 = v0.readBuffer(v2130, v2132);
                v2135 = v2136;
                v2132 = v2137;
                v2131.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2135)
                };
            else
                v2135 = nil;
                v2136, v2137 = v0.readVarInt(v2130, v2132);
                v2132 = v2137 + v2136;
            end;
        elseif v2134 == v0.wireTypes.i32 then
            v2135 = nil;
            v2136, v2137 = v0.readFixed32(v2130, v2132);
            v2135 = v2136;
            v2132 = v2137;
        elseif v2134 == v0.wireTypes.i64 then
            v2135 = nil;
            v2136, v2137 = v0.readFixed64(v2130, v2132);
            v2135 = v2136;
            v2132 = v2137;
        else
            error("Unsupported wire type: " .. v2134);
        end;
    end;
    return v2131;
end;
v5.jsonEncode = function(v2138) --[[ Line: 13382 ]] --[[ Name: jsonEncode ]]
    local v2139 = {};
    if v2138.condition ~= nil then
        v2139.condition = v2138.condition:jsonEncode();
    end;
    if v2138.kind ~= nil then
        if v2138.kind.type == "literal" then
            v2139.literal = v2138.kind.value:jsonEncode();
            return v2139;
        elseif v2138.kind.type == "binding_path" then
            v2139.bindingPath = v2138.kind.value;
        end;
    end;
    return v2139;
end;
v5.jsonDecode = function(v2140) --[[ Line: 13400 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_78 (copy), v4 (copy), v2 (copy)
    local v2141 = l_v5_78.new();
    if v2140.condition ~= nil then
        v2141.condition = v4.PropCondition.jsonDecode(v2140.condition);
    end;
    if v2140.literal ~= nil then
        v2141.kind = {
            type = "literal", 
            value = v2.ArrayOfStructProp_ArrayOfStructs.jsonDecode(v2140.literal)
        };
    end;
    if v2140.binding_path ~= nil then
        v2141.kind = {
            type = "binding_path", 
            value = v2140.binding_path
        };
    end;
    if v2140.bindingPath ~= nil then
        v2141.kind = {
            type = "binding_path", 
            value = v2140.bindingPath
        };
    end;
    return v2141;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfStructProp_ConditionalOption = v5;
v1.default:register(v2.ArrayOfStructProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_79 = v5 --[[ copy: 5 -> 85 ]];
v5.new = function(v2143) --[[ Line: 13440 ]] --[[ Name: new ]]
    -- upvalues: l_v5_79 (copy)
    return (setmetatable({
        options = if not (v2143 ~= nil) or v2143.options == nil then {} else v2143.options
    }, l_v5_79));
end;
v5.encode = function(v2144) --[[ Line: 13448 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2145 = buffer.create(0);
    local v2146 = 0;
    if v2144.options ~= nil and #v2144.options > 0 then
        for _, v2148 in v2144.options do
            local v2149 = v2148:encode();
            local v2150, v2151 = v0.writeTag(v2145, v2146, 1, v0.wireTypes.lengthDelimited);
            v2150, v2151 = v0.writeBuffer(v2150, v2151, v2149, buffer.len(v2149));
            v2145 = v2150;
            v2146 = v2151;
        end;
    end;
    local v2152 = buffer.create(v2146);
    buffer.copy(v2152, 0, v2145, 0, v2146);
    return v2152;
end;
v5.decode = function(v2153) --[[ Line: 13465 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_79 (copy), v0 (copy), v2 (copy)
    local v2154 = l_v5_79.new();
    local v2155 = 0;
    while v2155 < buffer.len(v2153) do
        local v2156 = nil;
        local v2157 = nil;
        local v2158, v2159, v2160 = v0.readTag(v2153, v2155);
        v2156 = v2158;
        v2157 = v2159;
        v2155 = v2160;
        if v2157 == v0.wireTypes.varint then
            v2158 = nil;
            v2159, v2160 = v0.readVarInt(v2153, v2155);
            v2158 = v2159;
            v2155 = v2160;
        elseif v2157 == v0.wireTypes.lengthDelimited then
            if v2156 == 1 then
                v2158 = nil;
                v2159, v2160 = v0.readBuffer(v2153, v2155);
                v2158 = v2159;
                v2155 = v2160;
                table.insert(v2154.options, v2.ArrayOfStructProp_ConditionalOption.decode(v2158));
            else
                v2158 = nil;
                v2159, v2160 = v0.readVarInt(v2153, v2155);
                v2155 = v2160 + v2159;
            end;
        elseif v2157 == v0.wireTypes.i32 then
            v2158 = nil;
            v2159, v2160 = v0.readFixed32(v2153, v2155);
            v2158 = v2159;
            v2155 = v2160;
        elseif v2157 == v0.wireTypes.i64 then
            v2158 = nil;
            v2159, v2160 = v0.readFixed64(v2153, v2155);
            v2158 = v2159;
            v2155 = v2160;
        else
            error("Unsupported wire type: " .. v2157);
        end;
    end;
    return v2154;
end;
v5.jsonEncode = function(v2161) --[[ Line: 13508 ]] --[[ Name: jsonEncode ]]
    local v2162 = {};
    if v2161.options ~= nil and #v2161.options > 0 then
        local v2163 = {};
        for _, v2165 in v2161.options do
            table.insert(v2163, v2165:jsonEncode());
        end;
        v2162.options = v2163;
    end;
    return v2162;
end;
v5.jsonDecode = function(v2166) --[[ Line: 13522 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_79 (copy), v2 (copy)
    local v2167 = l_v5_79.new();
    if v2166.options ~= nil then
        local v2168 = {};
        for _, v2170 in v2166.options do
            table.insert(v2168, v2.ArrayOfStructProp_ConditionalOption.jsonDecode(v2170));
        end;
        v2167.options = v2168;
    end;
    return v2167;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfStructProp_ConditionalOptions = v5;
v1.default:register(v2.ArrayOfStructProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_80 = v5 --[[ copy: 5 -> 86 ]];
v5.new = function(v2172) --[[ Line: 13553 ]] --[[ Name: new ]]
    -- upvalues: l_v5_80 (copy)
    return (setmetatable({
        entry = if not (v2172 ~= nil) or v2172.entry == nil then {} else v2172.entry
    }, l_v5_80));
end;
v5.encode = function(v2173) --[[ Line: 13561 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2174 = buffer.create(0);
    local v2175 = 0;
    if v2173.entry ~= nil and #v2173.entry > 0 then
        for _, v2177 in v2173.entry do
            local v2178 = v2177:encode();
            local v2179, v2180 = v0.writeTag(v2174, v2175, 1, v0.wireTypes.lengthDelimited);
            v2179, v2180 = v0.writeBuffer(v2179, v2180, v2178, buffer.len(v2178));
            v2174 = v2179;
            v2175 = v2180;
        end;
    end;
    local v2181 = buffer.create(v2175);
    buffer.copy(v2181, 0, v2174, 0, v2175);
    return v2181;
end;
v5.decode = function(v2182) --[[ Line: 13578 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_80 (copy), v0 (copy), v3 (copy)
    local v2183 = l_v5_80.new();
    local v2184 = 0;
    while v2184 < buffer.len(v2182) do
        local v2185 = nil;
        local v2186 = nil;
        local v2187, v2188, v2189 = v0.readTag(v2182, v2184);
        v2185 = v2187;
        v2186 = v2188;
        v2184 = v2189;
        if v2186 == v0.wireTypes.varint then
            v2187 = nil;
            v2188, v2189 = v0.readVarInt(v2182, v2184);
            v2187 = v2188;
            v2184 = v2189;
        elseif v2186 == v0.wireTypes.lengthDelimited then
            if v2185 == 1 then
                v2187 = nil;
                v2188, v2189 = v0.readBuffer(v2182, v2184);
                v2187 = v2188;
                v2184 = v2189;
                table.insert(v2183.entry, v3.Struct.decode(v2187));
            else
                v2187 = nil;
                v2188, v2189 = v0.readVarInt(v2182, v2184);
                v2184 = v2189 + v2188;
            end;
        elseif v2186 == v0.wireTypes.i32 then
            v2187 = nil;
            v2188, v2189 = v0.readFixed32(v2182, v2184);
            v2187 = v2188;
            v2184 = v2189;
        elseif v2186 == v0.wireTypes.i64 then
            v2187 = nil;
            v2188, v2189 = v0.readFixed64(v2182, v2184);
            v2187 = v2188;
            v2184 = v2189;
        else
            error("Unsupported wire type: " .. v2186);
        end;
    end;
    return v2183;
end;
v5.jsonEncode = function(v2190) --[[ Line: 13621 ]] --[[ Name: jsonEncode ]]
    local v2191 = {};
    if v2190.entry ~= nil and #v2190.entry > 0 then
        local v2192 = {};
        for _, v2194 in v2190.entry do
            table.insert(v2192, v2194:jsonEncode());
        end;
        v2191.entry = v2192;
    end;
    return v2191;
end;
v5.jsonDecode = function(v2195) --[[ Line: 13635 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_80 (copy), v3 (copy)
    local v2196 = l_v5_80.new();
    if v2195.entry ~= nil then
        local v2197 = {};
        for _, v2199 in v2195.entry do
            table.insert(v2197, v3.Struct.jsonDecode(v2199));
        end;
        v2196.entry = v2197;
    end;
    return v2196;
end;
v5.descriptor = {
    name = "ArrayOfStructProp_ArrayOfStructs", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
};
v2.ArrayOfStructProp_ArrayOfStructs = v5;
v1.default:register(v2.ArrayOfStructProp_ArrayOfStructs);
v5 = {};
v5.__index = v5;
local l_v5_81 = v5 --[[ copy: 5 -> 87 ]];
v5.new = function(v2201) --[[ Line: 13666 ]] --[[ Name: new ]]
    -- upvalues: l_v5_81 (copy)
    return (setmetatable({
        kind = if not (v2201 ~= nil) or v2201.kind == nil then nil else v2201.kind
    }, l_v5_81));
end;
v5.encode = function(v2202) --[[ Line: 13672 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2203 = buffer.create(0);
    local v2204 = 0;
    if v2202.kind ~= nil then
        if v2202.kind.type == "literal" then
            local v2205, v2206 = v0.writeTag(v2203, v2204, 1, v0.wireTypes.lengthDelimited);
            v2205, v2206 = v0.writeString(v2205, v2206, v2202.kind.value);
            v2203 = v2205;
            v2204 = v2206;
        elseif v2202.kind.type == "token" then
            local v2207, v2208 = v0.writeTag(v2203, v2204, 2, v0.wireTypes.lengthDelimited);
            v2207, v2208 = v0.writeString(v2207, v2208, v2202.kind.value);
            v2203 = v2207;
            v2204 = v2208;
        elseif v2202.kind.type == "conditional" then
            local v2209 = v2202.kind.value:encode();
            local v2210, v2211 = v0.writeTag(v2203, v2204, 3, v0.wireTypes.lengthDelimited);
            v2210, v2211 = v0.writeBuffer(v2210, v2211, v2209, buffer.len(v2209));
            v2203 = v2210;
            v2204 = v2211;
        elseif v2202.kind.type == "binding_path" then
            local v2212, v2213 = v0.writeTag(v2203, v2204, 4, v0.wireTypes.lengthDelimited);
            v2212, v2213 = v0.writeString(v2212, v2213, v2202.kind.value);
            v2203 = v2212;
            v2204 = v2213;
        end;
    end;
    local v2214 = buffer.create(v2204);
    buffer.copy(v2214, 0, v2203, 0, v2204);
    return v2214;
end;
v5.decode = function(v2215) --[[ Line: 13698 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_81 (copy), v0 (copy), v2 (copy)
    local v2216 = l_v5_81.new();
    local v2217 = 0;
    while v2217 < buffer.len(v2215) do
        local v2218 = nil;
        local v2219 = nil;
        local v2220, v2221, v2222 = v0.readTag(v2215, v2217);
        v2218 = v2220;
        v2219 = v2221;
        v2217 = v2222;
        if v2219 == v0.wireTypes.varint then
            v2220 = nil;
            v2221, v2222 = v0.readVarInt(v2215, v2217);
            v2220 = v2221;
            v2217 = v2222;
        elseif v2219 == v0.wireTypes.lengthDelimited then
            if v2218 == 1 then
                v2220 = nil;
                v2221, v2222 = v0.readBuffer(v2215, v2217);
                v2220 = v2221;
                v2217 = v2222;
                v2216.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2220)
                };
            elseif v2218 == 2 then
                v2220 = nil;
                v2221, v2222 = v0.readBuffer(v2215, v2217);
                v2220 = v2221;
                v2217 = v2222;
                v2216.kind = {
                    type = "token", 
                    value = buffer.tostring(v2220)
                };
            elseif v2218 == 3 then
                v2220 = nil;
                v2221, v2222 = v0.readBuffer(v2215, v2217);
                v2220 = v2221;
                v2217 = v2222;
                v2216.kind = {
                    type = "conditional", 
                    value = v2.UiScaledFloatProp_ConditionalOptions.decode(v2220)
                };
            elseif v2218 == 4 then
                v2220 = nil;
                v2221, v2222 = v0.readBuffer(v2215, v2217);
                v2220 = v2221;
                v2217 = v2222;
                v2216.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2220)
                };
            else
                v2220 = nil;
                v2221, v2222 = v0.readVarInt(v2215, v2217);
                v2217 = v2222 + v2221;
            end;
        elseif v2219 == v0.wireTypes.i32 then
            v2220 = nil;
            v2221, v2222 = v0.readFixed32(v2215, v2217);
            v2220 = v2221;
            v2217 = v2222;
        elseif v2219 == v0.wireTypes.i64 then
            v2220 = nil;
            v2221, v2222 = v0.readFixed64(v2215, v2217);
            v2220 = v2221;
            v2217 = v2222;
        else
            error("Unsupported wire type: " .. v2219);
        end;
    end;
    return v2216;
end;
v5.jsonEncode = function(v2223) --[[ Line: 13757 ]] --[[ Name: jsonEncode ]]
    local v2224 = {};
    if v2223.kind ~= nil then
        if v2223.kind.type == "literal" then
            v2224.literal = v2223.kind.value;
            return v2224;
        elseif v2223.kind.type == "token" then
            v2224.token = v2223.kind.value;
            return v2224;
        elseif v2223.kind.type == "conditional" then
            v2224.conditional = v2223.kind.value:jsonEncode();
            return v2224;
        elseif v2223.kind.type == "binding_path" then
            v2224.bindingPath = v2223.kind.value;
        end;
    end;
    return v2224;
end;
v5.jsonDecode = function(v2225) --[[ Line: 13775 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_81 (copy), v2 (copy)
    local v2226 = l_v5_81.new();
    if v2225.literal ~= nil then
        v2226.kind = {
            type = "literal", 
            value = v2225.literal
        };
    end;
    if v2225.token ~= nil then
        v2226.kind = {
            type = "token", 
            value = v2225.token
        };
    end;
    if v2225.conditional ~= nil then
        v2226.kind = {
            type = "conditional", 
            value = v2.UiScaledFloatProp_ConditionalOptions.jsonDecode(v2225.conditional)
        };
    end;
    if v2225.binding_path ~= nil then
        v2226.kind = {
            type = "binding_path", 
            value = v2225.binding_path
        };
    end;
    if v2225.bindingPath ~= nil then
        v2226.kind = {
            type = "binding_path", 
            value = v2225.bindingPath
        };
    end;
    return v2226;
end;
v5.descriptor = {
    name = "UiScaledFloatProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
};
v2.UiScaledFloatProp = v5;
v1.default:register(v2.UiScaledFloatProp);
v5 = {};
v5.__index = v5;
local l_v5_82 = v5 --[[ copy: 5 -> 88 ]];
v5.new = function(v2228) --[[ Line: 13818 ]] --[[ Name: new ]]
    -- upvalues: l_v5_82 (copy)
    return (setmetatable({
        condition = if not (v2228 ~= nil) or v2228.condition == nil then nil else v2228.condition, 
        kind = if not (v2228 ~= nil) or v2228.kind == nil then nil else v2228.kind
    }, l_v5_82));
end;
v5.encode = function(v2229) --[[ Line: 13827 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2230 = buffer.create(0);
    local v2231 = 0;
    if v2229.condition ~= nil then
        local v2232 = v2229.condition:encode();
        local v2233, v2234 = v0.writeTag(v2230, v2231, 1, v0.wireTypes.lengthDelimited);
        v2233, v2234 = v0.writeBuffer(v2233, v2234, v2232, buffer.len(v2232));
        v2230 = v2233;
        v2231 = v2234;
    end;
    if v2229.kind ~= nil then
        if v2229.kind.type == "literal" then
            local v2235, v2236 = v0.writeTag(v2230, v2231, 2, v0.wireTypes.lengthDelimited);
            v2235, v2236 = v0.writeString(v2235, v2236, v2229.kind.value);
            v2230 = v2235;
            v2231 = v2236;
        elseif v2229.kind.type == "token" then
            local v2237, v2238 = v0.writeTag(v2230, v2231, 3, v0.wireTypes.lengthDelimited);
            v2237, v2238 = v0.writeString(v2237, v2238, v2229.kind.value);
            v2230 = v2237;
            v2231 = v2238;
        elseif v2229.kind.type == "binding_path" then
            local v2239, v2240 = v0.writeTag(v2230, v2231, 4, v0.wireTypes.lengthDelimited);
            v2239, v2240 = v0.writeString(v2239, v2240, v2229.kind.value);
            v2230 = v2239;
            v2231 = v2240;
        end;
    end;
    local v2241 = buffer.create(v2231);
    buffer.copy(v2241, 0, v2230, 0, v2231);
    return v2241;
end;
v5.decode = function(v2242) --[[ Line: 13855 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_82 (copy), v0 (copy), v4 (copy)
    local v2243 = l_v5_82.new();
    local v2244 = 0;
    while v2244 < buffer.len(v2242) do
        local v2245 = nil;
        local v2246 = nil;
        local v2247, v2248, v2249 = v0.readTag(v2242, v2244);
        v2245 = v2247;
        v2246 = v2248;
        v2244 = v2249;
        if v2246 == v0.wireTypes.varint then
            v2247 = nil;
            v2248, v2249 = v0.readVarInt(v2242, v2244);
            v2247 = v2248;
            v2244 = v2249;
        elseif v2246 == v0.wireTypes.lengthDelimited then
            if v2245 == 1 then
                v2247 = nil;
                v2248, v2249 = v0.readBuffer(v2242, v2244);
                v2247 = v2248;
                v2244 = v2249;
                v2243.condition = v4.PropCondition.decode(v2247);
            elseif v2245 == 2 then
                v2247 = nil;
                v2248, v2249 = v0.readBuffer(v2242, v2244);
                v2247 = v2248;
                v2244 = v2249;
                v2243.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2247)
                };
            elseif v2245 == 3 then
                v2247 = nil;
                v2248, v2249 = v0.readBuffer(v2242, v2244);
                v2247 = v2248;
                v2244 = v2249;
                v2243.kind = {
                    type = "token", 
                    value = buffer.tostring(v2247)
                };
            elseif v2245 == 4 then
                v2247 = nil;
                v2248, v2249 = v0.readBuffer(v2242, v2244);
                v2247 = v2248;
                v2244 = v2249;
                v2243.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2247)
                };
            else
                v2247 = nil;
                v2248, v2249 = v0.readVarInt(v2242, v2244);
                v2244 = v2249 + v2248;
            end;
        elseif v2246 == v0.wireTypes.i32 then
            v2247 = nil;
            v2248, v2249 = v0.readFixed32(v2242, v2244);
            v2247 = v2248;
            v2244 = v2249;
        elseif v2246 == v0.wireTypes.i64 then
            v2247 = nil;
            v2248, v2249 = v0.readFixed64(v2242, v2244);
            v2247 = v2248;
            v2244 = v2249;
        else
            error("Unsupported wire type: " .. v2246);
        end;
    end;
    return v2243;
end;
v5.jsonEncode = function(v2250) --[[ Line: 13913 ]] --[[ Name: jsonEncode ]]
    local v2251 = {};
    if v2250.condition ~= nil then
        v2251.condition = v2250.condition:jsonEncode();
    end;
    if v2250.kind ~= nil then
        if v2250.kind.type == "literal" then
            v2251.literal = v2250.kind.value;
            return v2251;
        elseif v2250.kind.type == "token" then
            v2251.token = v2250.kind.value;
            return v2251;
        elseif v2250.kind.type == "binding_path" then
            v2251.bindingPath = v2250.kind.value;
        end;
    end;
    return v2251;
end;
v5.jsonDecode = function(v2252) --[[ Line: 13933 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_82 (copy), v4 (copy)
    local v2253 = l_v5_82.new();
    if v2252.condition ~= nil then
        v2253.condition = v4.PropCondition.jsonDecode(v2252.condition);
    end;
    if v2252.literal ~= nil then
        v2253.kind = {
            type = "literal", 
            value = v2252.literal
        };
    end;
    if v2252.token ~= nil then
        v2253.kind = {
            type = "token", 
            value = v2252.token
        };
    end;
    if v2252.binding_path ~= nil then
        v2253.kind = {
            type = "binding_path", 
            value = v2252.binding_path
        };
    end;
    if v2252.bindingPath ~= nil then
        v2253.kind = {
            type = "binding_path", 
            value = v2252.bindingPath
        };
    end;
    return v2253;
end;
v5.descriptor = {
    name = "UiScaledFloatProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledFloatProp_ConditionalOption = v5;
v1.default:register(v2.UiScaledFloatProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_83 = v5 --[[ copy: 5 -> 89 ]];
v5.new = function(v2255) --[[ Line: 13976 ]] --[[ Name: new ]]
    -- upvalues: l_v5_83 (copy)
    return (setmetatable({
        options = if not (v2255 ~= nil) or v2255.options == nil then {} else v2255.options
    }, l_v5_83));
end;
v5.encode = function(v2256) --[[ Line: 13984 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2257 = buffer.create(0);
    local v2258 = 0;
    if v2256.options ~= nil and #v2256.options > 0 then
        for _, v2260 in v2256.options do
            local v2261 = v2260:encode();
            local v2262, v2263 = v0.writeTag(v2257, v2258, 1, v0.wireTypes.lengthDelimited);
            v2262, v2263 = v0.writeBuffer(v2262, v2263, v2261, buffer.len(v2261));
            v2257 = v2262;
            v2258 = v2263;
        end;
    end;
    local v2264 = buffer.create(v2258);
    buffer.copy(v2264, 0, v2257, 0, v2258);
    return v2264;
end;
v5.decode = function(v2265) --[[ Line: 14001 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_83 (copy), v0 (copy), v2 (copy)
    local v2266 = l_v5_83.new();
    local v2267 = 0;
    while v2267 < buffer.len(v2265) do
        local v2268 = nil;
        local v2269 = nil;
        local v2270, v2271, v2272 = v0.readTag(v2265, v2267);
        v2268 = v2270;
        v2269 = v2271;
        v2267 = v2272;
        if v2269 == v0.wireTypes.varint then
            v2270 = nil;
            v2271, v2272 = v0.readVarInt(v2265, v2267);
            v2270 = v2271;
            v2267 = v2272;
        elseif v2269 == v0.wireTypes.lengthDelimited then
            if v2268 == 1 then
                v2270 = nil;
                v2271, v2272 = v0.readBuffer(v2265, v2267);
                v2270 = v2271;
                v2267 = v2272;
                table.insert(v2266.options, v2.UiScaledFloatProp_ConditionalOption.decode(v2270));
            else
                v2270 = nil;
                v2271, v2272 = v0.readVarInt(v2265, v2267);
                v2267 = v2272 + v2271;
            end;
        elseif v2269 == v0.wireTypes.i32 then
            v2270 = nil;
            v2271, v2272 = v0.readFixed32(v2265, v2267);
            v2270 = v2271;
            v2267 = v2272;
        elseif v2269 == v0.wireTypes.i64 then
            v2270 = nil;
            v2271, v2272 = v0.readFixed64(v2265, v2267);
            v2270 = v2271;
            v2267 = v2272;
        else
            error("Unsupported wire type: " .. v2269);
        end;
    end;
    return v2266;
end;
v5.jsonEncode = function(v2273) --[[ Line: 14044 ]] --[[ Name: jsonEncode ]]
    local v2274 = {};
    if v2273.options ~= nil and #v2273.options > 0 then
        local v2275 = {};
        for _, v2277 in v2273.options do
            table.insert(v2275, v2277:jsonEncode());
        end;
        v2274.options = v2275;
    end;
    return v2274;
end;
v5.jsonDecode = function(v2278) --[[ Line: 14058 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_83 (copy), v2 (copy)
    local v2279 = l_v5_83.new();
    if v2278.options ~= nil then
        local v2280 = {};
        for _, v2282 in v2278.options do
            table.insert(v2280, v2.UiScaledFloatProp_ConditionalOption.jsonDecode(v2282));
        end;
        v2279.options = v2280;
    end;
    return v2279;
end;
v5.descriptor = {
    name = "UiScaledFloatProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledFloatProp_ConditionalOptions = v5;
v1.default:register(v2.UiScaledFloatProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_84 = v5 --[[ copy: 5 -> 90 ]];
v5.new = function(v2284) --[[ Line: 14089 ]] --[[ Name: new ]]
    -- upvalues: l_v5_84 (copy)
    return (setmetatable({
        kind = if not (v2284 ~= nil) or v2284.kind == nil then nil else v2284.kind
    }, l_v5_84));
end;
v5.encode = function(v2285) --[[ Line: 14095 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2286 = buffer.create(0);
    local v2287 = 0;
    if v2285.kind ~= nil then
        if v2285.kind.type == "literal" then
            local v2288, v2289 = v0.writeTag(v2286, v2287, 1, v0.wireTypes.lengthDelimited);
            v2288, v2289 = v0.writeString(v2288, v2289, v2285.kind.value);
            v2286 = v2288;
            v2287 = v2289;
        elseif v2285.kind.type == "token" then
            local v2290, v2291 = v0.writeTag(v2286, v2287, 2, v0.wireTypes.lengthDelimited);
            v2290, v2291 = v0.writeString(v2290, v2291, v2285.kind.value);
            v2286 = v2290;
            v2287 = v2291;
        elseif v2285.kind.type == "conditional" then
            local v2292 = v2285.kind.value:encode();
            local v2293, v2294 = v0.writeTag(v2286, v2287, 3, v0.wireTypes.lengthDelimited);
            v2293, v2294 = v0.writeBuffer(v2293, v2294, v2292, buffer.len(v2292));
            v2286 = v2293;
            v2287 = v2294;
        elseif v2285.kind.type == "binding_path" then
            local v2295, v2296 = v0.writeTag(v2286, v2287, 4, v0.wireTypes.lengthDelimited);
            v2295, v2296 = v0.writeString(v2295, v2296, v2285.kind.value);
            v2286 = v2295;
            v2287 = v2296;
        end;
    end;
    local v2297 = buffer.create(v2287);
    buffer.copy(v2297, 0, v2286, 0, v2287);
    return v2297;
end;
v5.decode = function(v2298) --[[ Line: 14121 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_84 (copy), v0 (copy), v2 (copy)
    local v2299 = l_v5_84.new();
    local v2300 = 0;
    while v2300 < buffer.len(v2298) do
        local v2301 = nil;
        local v2302 = nil;
        local v2303, v2304, v2305 = v0.readTag(v2298, v2300);
        v2301 = v2303;
        v2302 = v2304;
        v2300 = v2305;
        if v2302 == v0.wireTypes.varint then
            v2303 = nil;
            v2304, v2305 = v0.readVarInt(v2298, v2300);
            v2303 = v2304;
            v2300 = v2305;
        elseif v2302 == v0.wireTypes.lengthDelimited then
            if v2301 == 1 then
                v2303 = nil;
                v2304, v2305 = v0.readBuffer(v2298, v2300);
                v2303 = v2304;
                v2300 = v2305;
                v2299.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2303)
                };
            elseif v2301 == 2 then
                v2303 = nil;
                v2304, v2305 = v0.readBuffer(v2298, v2300);
                v2303 = v2304;
                v2300 = v2305;
                v2299.kind = {
                    type = "token", 
                    value = buffer.tostring(v2303)
                };
            elseif v2301 == 3 then
                v2303 = nil;
                v2304, v2305 = v0.readBuffer(v2298, v2300);
                v2303 = v2304;
                v2300 = v2305;
                v2299.kind = {
                    type = "conditional", 
                    value = v2.UiScaledUDimProp_ConditionalOptions.decode(v2303)
                };
            elseif v2301 == 4 then
                v2303 = nil;
                v2304, v2305 = v0.readBuffer(v2298, v2300);
                v2303 = v2304;
                v2300 = v2305;
                v2299.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2303)
                };
            else
                v2303 = nil;
                v2304, v2305 = v0.readVarInt(v2298, v2300);
                v2300 = v2305 + v2304;
            end;
        elseif v2302 == v0.wireTypes.i32 then
            v2303 = nil;
            v2304, v2305 = v0.readFixed32(v2298, v2300);
            v2303 = v2304;
            v2300 = v2305;
        elseif v2302 == v0.wireTypes.i64 then
            v2303 = nil;
            v2304, v2305 = v0.readFixed64(v2298, v2300);
            v2303 = v2304;
            v2300 = v2305;
        else
            error("Unsupported wire type: " .. v2302);
        end;
    end;
    return v2299;
end;
v5.jsonEncode = function(v2306) --[[ Line: 14180 ]] --[[ Name: jsonEncode ]]
    local v2307 = {};
    if v2306.kind ~= nil then
        if v2306.kind.type == "literal" then
            v2307.literal = v2306.kind.value;
            return v2307;
        elseif v2306.kind.type == "token" then
            v2307.token = v2306.kind.value;
            return v2307;
        elseif v2306.kind.type == "conditional" then
            v2307.conditional = v2306.kind.value:jsonEncode();
            return v2307;
        elseif v2306.kind.type == "binding_path" then
            v2307.bindingPath = v2306.kind.value;
        end;
    end;
    return v2307;
end;
v5.jsonDecode = function(v2308) --[[ Line: 14198 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_84 (copy), v2 (copy)
    local v2309 = l_v5_84.new();
    if v2308.literal ~= nil then
        v2309.kind = {
            type = "literal", 
            value = v2308.literal
        };
    end;
    if v2308.token ~= nil then
        v2309.kind = {
            type = "token", 
            value = v2308.token
        };
    end;
    if v2308.conditional ~= nil then
        v2309.kind = {
            type = "conditional", 
            value = v2.UiScaledUDimProp_ConditionalOptions.jsonDecode(v2308.conditional)
        };
    end;
    if v2308.binding_path ~= nil then
        v2309.kind = {
            type = "binding_path", 
            value = v2308.binding_path
        };
    end;
    if v2308.bindingPath ~= nil then
        v2309.kind = {
            type = "binding_path", 
            value = v2308.bindingPath
        };
    end;
    return v2309;
end;
v5.descriptor = {
    name = "UiScaledUDimProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
};
v2.UiScaledUDimProp = v5;
v1.default:register(v2.UiScaledUDimProp);
v5 = {};
v5.__index = v5;
local l_v5_85 = v5 --[[ copy: 5 -> 91 ]];
v5.new = function(v2311) --[[ Line: 14241 ]] --[[ Name: new ]]
    -- upvalues: l_v5_85 (copy)
    return (setmetatable({
        condition = if not (v2311 ~= nil) or v2311.condition == nil then nil else v2311.condition, 
        kind = if not (v2311 ~= nil) or v2311.kind == nil then nil else v2311.kind
    }, l_v5_85));
end;
v5.encode = function(v2312) --[[ Line: 14250 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2313 = buffer.create(0);
    local v2314 = 0;
    if v2312.condition ~= nil then
        local v2315 = v2312.condition:encode();
        local v2316, v2317 = v0.writeTag(v2313, v2314, 1, v0.wireTypes.lengthDelimited);
        v2316, v2317 = v0.writeBuffer(v2316, v2317, v2315, buffer.len(v2315));
        v2313 = v2316;
        v2314 = v2317;
    end;
    if v2312.kind ~= nil then
        if v2312.kind.type == "literal" then
            local v2318, v2319 = v0.writeTag(v2313, v2314, 2, v0.wireTypes.lengthDelimited);
            v2318, v2319 = v0.writeString(v2318, v2319, v2312.kind.value);
            v2313 = v2318;
            v2314 = v2319;
        elseif v2312.kind.type == "token" then
            local v2320, v2321 = v0.writeTag(v2313, v2314, 3, v0.wireTypes.lengthDelimited);
            v2320, v2321 = v0.writeString(v2320, v2321, v2312.kind.value);
            v2313 = v2320;
            v2314 = v2321;
        elseif v2312.kind.type == "binding_path" then
            local v2322, v2323 = v0.writeTag(v2313, v2314, 4, v0.wireTypes.lengthDelimited);
            v2322, v2323 = v0.writeString(v2322, v2323, v2312.kind.value);
            v2313 = v2322;
            v2314 = v2323;
        end;
    end;
    local v2324 = buffer.create(v2314);
    buffer.copy(v2324, 0, v2313, 0, v2314);
    return v2324;
end;
v5.decode = function(v2325) --[[ Line: 14278 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_85 (copy), v0 (copy), v4 (copy)
    local v2326 = l_v5_85.new();
    local v2327 = 0;
    while v2327 < buffer.len(v2325) do
        local v2328 = nil;
        local v2329 = nil;
        local v2330, v2331, v2332 = v0.readTag(v2325, v2327);
        v2328 = v2330;
        v2329 = v2331;
        v2327 = v2332;
        if v2329 == v0.wireTypes.varint then
            v2330 = nil;
            v2331, v2332 = v0.readVarInt(v2325, v2327);
            v2330 = v2331;
            v2327 = v2332;
        elseif v2329 == v0.wireTypes.lengthDelimited then
            if v2328 == 1 then
                v2330 = nil;
                v2331, v2332 = v0.readBuffer(v2325, v2327);
                v2330 = v2331;
                v2327 = v2332;
                v2326.condition = v4.PropCondition.decode(v2330);
            elseif v2328 == 2 then
                v2330 = nil;
                v2331, v2332 = v0.readBuffer(v2325, v2327);
                v2330 = v2331;
                v2327 = v2332;
                v2326.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2330)
                };
            elseif v2328 == 3 then
                v2330 = nil;
                v2331, v2332 = v0.readBuffer(v2325, v2327);
                v2330 = v2331;
                v2327 = v2332;
                v2326.kind = {
                    type = "token", 
                    value = buffer.tostring(v2330)
                };
            elseif v2328 == 4 then
                v2330 = nil;
                v2331, v2332 = v0.readBuffer(v2325, v2327);
                v2330 = v2331;
                v2327 = v2332;
                v2326.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2330)
                };
            else
                v2330 = nil;
                v2331, v2332 = v0.readVarInt(v2325, v2327);
                v2327 = v2332 + v2331;
            end;
        elseif v2329 == v0.wireTypes.i32 then
            v2330 = nil;
            v2331, v2332 = v0.readFixed32(v2325, v2327);
            v2330 = v2331;
            v2327 = v2332;
        elseif v2329 == v0.wireTypes.i64 then
            v2330 = nil;
            v2331, v2332 = v0.readFixed64(v2325, v2327);
            v2330 = v2331;
            v2327 = v2332;
        else
            error("Unsupported wire type: " .. v2329);
        end;
    end;
    return v2326;
end;
v5.jsonEncode = function(v2333) --[[ Line: 14336 ]] --[[ Name: jsonEncode ]]
    local v2334 = {};
    if v2333.condition ~= nil then
        v2334.condition = v2333.condition:jsonEncode();
    end;
    if v2333.kind ~= nil then
        if v2333.kind.type == "literal" then
            v2334.literal = v2333.kind.value;
            return v2334;
        elseif v2333.kind.type == "token" then
            v2334.token = v2333.kind.value;
            return v2334;
        elseif v2333.kind.type == "binding_path" then
            v2334.bindingPath = v2333.kind.value;
        end;
    end;
    return v2334;
end;
v5.jsonDecode = function(v2335) --[[ Line: 14356 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_85 (copy), v4 (copy)
    local v2336 = l_v5_85.new();
    if v2335.condition ~= nil then
        v2336.condition = v4.PropCondition.jsonDecode(v2335.condition);
    end;
    if v2335.literal ~= nil then
        v2336.kind = {
            type = "literal", 
            value = v2335.literal
        };
    end;
    if v2335.token ~= nil then
        v2336.kind = {
            type = "token", 
            value = v2335.token
        };
    end;
    if v2335.binding_path ~= nil then
        v2336.kind = {
            type = "binding_path", 
            value = v2335.binding_path
        };
    end;
    if v2335.bindingPath ~= nil then
        v2336.kind = {
            type = "binding_path", 
            value = v2335.bindingPath
        };
    end;
    return v2336;
end;
v5.descriptor = {
    name = "UiScaledUDimProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledUDimProp_ConditionalOption = v5;
v1.default:register(v2.UiScaledUDimProp_ConditionalOption);
v5 = {};
v5.__index = v5;
local l_v5_86 = v5 --[[ copy: 5 -> 92 ]];
v5.new = function(v2338) --[[ Line: 14399 ]] --[[ Name: new ]]
    -- upvalues: l_v5_86 (copy)
    return (setmetatable({
        options = if not (v2338 ~= nil) or v2338.options == nil then {} else v2338.options
    }, l_v5_86));
end;
v5.encode = function(v2339) --[[ Line: 14407 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2340 = buffer.create(0);
    local v2341 = 0;
    if v2339.options ~= nil and #v2339.options > 0 then
        for _, v2343 in v2339.options do
            local v2344 = v2343:encode();
            local v2345, v2346 = v0.writeTag(v2340, v2341, 1, v0.wireTypes.lengthDelimited);
            v2345, v2346 = v0.writeBuffer(v2345, v2346, v2344, buffer.len(v2344));
            v2340 = v2345;
            v2341 = v2346;
        end;
    end;
    local v2347 = buffer.create(v2341);
    buffer.copy(v2347, 0, v2340, 0, v2341);
    return v2347;
end;
v5.decode = function(v2348) --[[ Line: 14424 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_86 (copy), v0 (copy), v2 (copy)
    local v2349 = l_v5_86.new();
    local v2350 = 0;
    while v2350 < buffer.len(v2348) do
        local v2351 = nil;
        local v2352 = nil;
        local v2353, v2354, v2355 = v0.readTag(v2348, v2350);
        v2351 = v2353;
        v2352 = v2354;
        v2350 = v2355;
        if v2352 == v0.wireTypes.varint then
            v2353 = nil;
            v2354, v2355 = v0.readVarInt(v2348, v2350);
            v2353 = v2354;
            v2350 = v2355;
        elseif v2352 == v0.wireTypes.lengthDelimited then
            if v2351 == 1 then
                v2353 = nil;
                v2354, v2355 = v0.readBuffer(v2348, v2350);
                v2353 = v2354;
                v2350 = v2355;
                table.insert(v2349.options, v2.UiScaledUDimProp_ConditionalOption.decode(v2353));
            else
                v2353 = nil;
                v2354, v2355 = v0.readVarInt(v2348, v2350);
                v2350 = v2355 + v2354;
            end;
        elseif v2352 == v0.wireTypes.i32 then
            v2353 = nil;
            v2354, v2355 = v0.readFixed32(v2348, v2350);
            v2353 = v2354;
            v2350 = v2355;
        elseif v2352 == v0.wireTypes.i64 then
            v2353 = nil;
            v2354, v2355 = v0.readFixed64(v2348, v2350);
            v2353 = v2354;
            v2350 = v2355;
        else
            error("Unsupported wire type: " .. v2352);
        end;
    end;
    return v2349;
end;
v5.jsonEncode = function(v2356) --[[ Line: 14467 ]] --[[ Name: jsonEncode ]]
    local v2357 = {};
    if v2356.options ~= nil and #v2356.options > 0 then
        local v2358 = {};
        for _, v2360 in v2356.options do
            table.insert(v2358, v2360:jsonEncode());
        end;
        v2357.options = v2358;
    end;
    return v2357;
end;
v5.jsonDecode = function(v2361) --[[ Line: 14481 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_86 (copy), v2 (copy)
    local v2362 = l_v5_86.new();
    if v2361.options ~= nil then
        local v2363 = {};
        for _, v2365 in v2361.options do
            table.insert(v2363, v2.UiScaledUDimProp_ConditionalOption.jsonDecode(v2365));
        end;
        v2362.options = v2363;
    end;
    return v2362;
end;
v5.descriptor = {
    name = "UiScaledUDimProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledUDimProp_ConditionalOptions = v5;
v1.default:register(v2.UiScaledUDimProp_ConditionalOptions);
v5 = {};
v5.__index = v5;
local l_v5_87 = v5 --[[ copy: 5 -> 93 ]];
v5.new = function(v2367) --[[ Line: 14512 ]] --[[ Name: new ]]
    -- upvalues: l_v5_87 (copy)
    return (setmetatable({
        kind = if not (v2367 ~= nil) or v2367.kind == nil then nil else v2367.kind
    }, l_v5_87));
end;
v5.encode = function(v2368) --[[ Line: 14518 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2369 = buffer.create(0);
    local v2370 = 0;
    if v2368.kind ~= nil then
        if v2368.kind.type == "literal" then
            local v2371, v2372 = v0.writeTag(v2369, v2370, 1, v0.wireTypes.lengthDelimited);
            v2371, v2372 = v0.writeString(v2371, v2372, v2368.kind.value);
            v2369 = v2371;
            v2370 = v2372;
        elseif v2368.kind.type == "token" then
            local v2373, v2374 = v0.writeTag(v2369, v2370, 2, v0.wireTypes.lengthDelimited);
            v2373, v2374 = v0.writeString(v2373, v2374, v2368.kind.value);
            v2369 = v2373;
            v2370 = v2374;
        elseif v2368.kind.type == "conditional" then
            local v2375 = v2368.kind.value:encode();
            local v2376, v2377 = v0.writeTag(v2369, v2370, 3, v0.wireTypes.lengthDelimited);
            v2376, v2377 = v0.writeBuffer(v2376, v2377, v2375, buffer.len(v2375));
            v2369 = v2376;
            v2370 = v2377;
        elseif v2368.kind.type == "binding_path" then
            local v2378, v2379 = v0.writeTag(v2369, v2370, 4, v0.wireTypes.lengthDelimited);
            v2378, v2379 = v0.writeString(v2378, v2379, v2368.kind.value);
            v2369 = v2378;
            v2370 = v2379;
        end;
    end;
    local v2380 = buffer.create(v2370);
    buffer.copy(v2380, 0, v2369, 0, v2370);
    return v2380;
end;
v5.decode = function(v2381) --[[ Line: 14544 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_87 (copy), v0 (copy), v2 (copy)
    local v2382 = l_v5_87.new();
    local v2383 = 0;
    while v2383 < buffer.len(v2381) do
        local v2384 = nil;
        local v2385 = nil;
        local v2386, v2387, v2388 = v0.readTag(v2381, v2383);
        v2384 = v2386;
        v2385 = v2387;
        v2383 = v2388;
        if v2385 == v0.wireTypes.varint then
            v2386 = nil;
            v2387, v2388 = v0.readVarInt(v2381, v2383);
            v2386 = v2387;
            v2383 = v2388;
        elseif v2385 == v0.wireTypes.lengthDelimited then
            if v2384 == 1 then
                v2386 = nil;
                v2387, v2388 = v0.readBuffer(v2381, v2383);
                v2386 = v2387;
                v2383 = v2388;
                v2382.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2386)
                };
            elseif v2384 == 2 then
                v2386 = nil;
                v2387, v2388 = v0.readBuffer(v2381, v2383);
                v2386 = v2387;
                v2383 = v2388;
                v2382.kind = {
                    type = "token", 
                    value = buffer.tostring(v2386)
                };
            elseif v2384 == 3 then
                v2386 = nil;
                v2387, v2388 = v0.readBuffer(v2381, v2383);
                v2386 = v2387;
                v2383 = v2388;
                v2382.kind = {
                    type = "conditional", 
                    value = v2.UiScaledUDim2Prop_ConditionalOptions.decode(v2386)
                };
            elseif v2384 == 4 then
                v2386 = nil;
                v2387, v2388 = v0.readBuffer(v2381, v2383);
                v2386 = v2387;
                v2383 = v2388;
                v2382.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2386)
                };
            else
                v2386 = nil;
                v2387, v2388 = v0.readVarInt(v2381, v2383);
                v2383 = v2388 + v2387;
            end;
        elseif v2385 == v0.wireTypes.i32 then
            v2386 = nil;
            v2387, v2388 = v0.readFixed32(v2381, v2383);
            v2386 = v2387;
            v2383 = v2388;
        elseif v2385 == v0.wireTypes.i64 then
            v2386 = nil;
            v2387, v2388 = v0.readFixed64(v2381, v2383);
            v2386 = v2387;
            v2383 = v2388;
        else
            error("Unsupported wire type: " .. v2385);
        end;
    end;
    return v2382;
end;
v5.jsonEncode = function(v2389) --[[ Line: 14603 ]] --[[ Name: jsonEncode ]]
    local v2390 = {};
    if v2389.kind ~= nil then
        if v2389.kind.type == "literal" then
            v2390.literal = v2389.kind.value;
            return v2390;
        elseif v2389.kind.type == "token" then
            v2390.token = v2389.kind.value;
            return v2390;
        elseif v2389.kind.type == "conditional" then
            v2390.conditional = v2389.kind.value:jsonEncode();
            return v2390;
        elseif v2389.kind.type == "binding_path" then
            v2390.bindingPath = v2389.kind.value;
        end;
    end;
    return v2390;
end;
v5.jsonDecode = function(v2391) --[[ Line: 14621 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_87 (copy), v2 (copy)
    local v2392 = l_v5_87.new();
    if v2391.literal ~= nil then
        v2392.kind = {
            type = "literal", 
            value = v2391.literal
        };
    end;
    if v2391.token ~= nil then
        v2392.kind = {
            type = "token", 
            value = v2391.token
        };
    end;
    if v2391.conditional ~= nil then
        v2392.kind = {
            type = "conditional", 
            value = v2.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(v2391.conditional)
        };
    end;
    if v2391.binding_path ~= nil then
        v2392.kind = {
            type = "binding_path", 
            value = v2391.binding_path
        };
    end;
    if v2391.bindingPath ~= nil then
        v2392.kind = {
            type = "binding_path", 
            value = v2391.bindingPath
        };
    end;
    return v2392;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
};
v2.UiScaledUDim2Prop = v5;
v1.default:register(v2.UiScaledUDim2Prop);
v5 = {};
v5.__index = v5;
local l_v5_88 = v5 --[[ copy: 5 -> 94 ]];
v5.new = function(v2394) --[[ Line: 14664 ]] --[[ Name: new ]]
    -- upvalues: l_v5_88 (copy)
    return (setmetatable({
        condition = if not (v2394 ~= nil) or v2394.condition == nil then nil else v2394.condition, 
        kind = if not (v2394 ~= nil) or v2394.kind == nil then nil else v2394.kind
    }, l_v5_88));
end;
v5.encode = function(v2395) --[[ Line: 14673 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2396 = buffer.create(0);
    local v2397 = 0;
    if v2395.condition ~= nil then
        local v2398 = v2395.condition:encode();
        local v2399, v2400 = v0.writeTag(v2396, v2397, 1, v0.wireTypes.lengthDelimited);
        v2399, v2400 = v0.writeBuffer(v2399, v2400, v2398, buffer.len(v2398));
        v2396 = v2399;
        v2397 = v2400;
    end;
    if v2395.kind ~= nil then
        if v2395.kind.type == "literal" then
            local v2401, v2402 = v0.writeTag(v2396, v2397, 2, v0.wireTypes.lengthDelimited);
            v2401, v2402 = v0.writeString(v2401, v2402, v2395.kind.value);
            v2396 = v2401;
            v2397 = v2402;
        elseif v2395.kind.type == "token" then
            local v2403, v2404 = v0.writeTag(v2396, v2397, 3, v0.wireTypes.lengthDelimited);
            v2403, v2404 = v0.writeString(v2403, v2404, v2395.kind.value);
            v2396 = v2403;
            v2397 = v2404;
        elseif v2395.kind.type == "binding_path" then
            local v2405, v2406 = v0.writeTag(v2396, v2397, 4, v0.wireTypes.lengthDelimited);
            v2405, v2406 = v0.writeString(v2405, v2406, v2395.kind.value);
            v2396 = v2405;
            v2397 = v2406;
        end;
    end;
    local v2407 = buffer.create(v2397);
    buffer.copy(v2407, 0, v2396, 0, v2397);
    return v2407;
end;
v5.decode = function(v2408) --[[ Line: 14701 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_88 (copy), v0 (copy), v4 (copy)
    local v2409 = l_v5_88.new();
    local v2410 = 0;
    while v2410 < buffer.len(v2408) do
        local v2411 = nil;
        local v2412 = nil;
        local v2413, v2414, v2415 = v0.readTag(v2408, v2410);
        v2411 = v2413;
        v2412 = v2414;
        v2410 = v2415;
        if v2412 == v0.wireTypes.varint then
            v2413 = nil;
            v2414, v2415 = v0.readVarInt(v2408, v2410);
            v2413 = v2414;
            v2410 = v2415;
        elseif v2412 == v0.wireTypes.lengthDelimited then
            if v2411 == 1 then
                v2413 = nil;
                v2414, v2415 = v0.readBuffer(v2408, v2410);
                v2413 = v2414;
                v2410 = v2415;
                v2409.condition = v4.PropCondition.decode(v2413);
            elseif v2411 == 2 then
                v2413 = nil;
                v2414, v2415 = v0.readBuffer(v2408, v2410);
                v2413 = v2414;
                v2410 = v2415;
                v2409.kind = {
                    type = "literal", 
                    value = buffer.tostring(v2413)
                };
            elseif v2411 == 3 then
                v2413 = nil;
                v2414, v2415 = v0.readBuffer(v2408, v2410);
                v2413 = v2414;
                v2410 = v2415;
                v2409.kind = {
                    type = "token", 
                    value = buffer.tostring(v2413)
                };
            elseif v2411 == 4 then
                v2413 = nil;
                v2414, v2415 = v0.readBuffer(v2408, v2410);
                v2413 = v2414;
                v2410 = v2415;
                v2409.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v2413)
                };
            else
                v2413 = nil;
                v2414, v2415 = v0.readVarInt(v2408, v2410);
                v2410 = v2415 + v2414;
            end;
        elseif v2412 == v0.wireTypes.i32 then
            v2413 = nil;
            v2414, v2415 = v0.readFixed32(v2408, v2410);
            v2413 = v2414;
            v2410 = v2415;
        elseif v2412 == v0.wireTypes.i64 then
            v2413 = nil;
            v2414, v2415 = v0.readFixed64(v2408, v2410);
            v2413 = v2414;
            v2410 = v2415;
        else
            error("Unsupported wire type: " .. v2412);
        end;
    end;
    return v2409;
end;
v5.jsonEncode = function(v2416) --[[ Line: 14759 ]] --[[ Name: jsonEncode ]]
    local v2417 = {};
    if v2416.condition ~= nil then
        v2417.condition = v2416.condition:jsonEncode();
    end;
    if v2416.kind ~= nil then
        if v2416.kind.type == "literal" then
            v2417.literal = v2416.kind.value;
            return v2417;
        elseif v2416.kind.type == "token" then
            v2417.token = v2416.kind.value;
            return v2417;
        elseif v2416.kind.type == "binding_path" then
            v2417.bindingPath = v2416.kind.value;
        end;
    end;
    return v2417;
end;
v5.jsonDecode = function(v2418) --[[ Line: 14779 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_88 (copy), v4 (copy)
    local v2419 = l_v5_88.new();
    if v2418.condition ~= nil then
        v2419.condition = v4.PropCondition.jsonDecode(v2418.condition);
    end;
    if v2418.literal ~= nil then
        v2419.kind = {
            type = "literal", 
            value = v2418.literal
        };
    end;
    if v2418.token ~= nil then
        v2419.kind = {
            type = "token", 
            value = v2418.token
        };
    end;
    if v2418.binding_path ~= nil then
        v2419.kind = {
            type = "binding_path", 
            value = v2418.binding_path
        };
    end;
    if v2418.bindingPath ~= nil then
        v2419.kind = {
            type = "binding_path", 
            value = v2418.bindingPath
        };
    end;
    return v2419;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UiScaledUDim2Prop_ConditionalOption = v5;
v1.default:register(v2.UiScaledUDim2Prop_ConditionalOption);
v5 = {};
v5.__index = v5;
v5.new = function(v2420) --[[ Line: 14822 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        options = if not (v2420 ~= nil) or v2420.options == nil then {} else v2420.options
    }, v5));
end;
v5.encode = function(v2421) --[[ Line: 14830 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v2422 = buffer.create(0);
    local v2423 = 0;
    if v2421.options ~= nil and #v2421.options > 0 then
        for _, v2425 in v2421.options do
            local v2426 = v2425:encode();
            local v2427, v2428 = v0.writeTag(v2422, v2423, 1, v0.wireTypes.lengthDelimited);
            v2427, v2428 = v0.writeBuffer(v2427, v2428, v2426, buffer.len(v2426));
            v2422 = v2427;
            v2423 = v2428;
        end;
    end;
    local v2429 = buffer.create(v2423);
    buffer.copy(v2429, 0, v2422, 0, v2423);
    return v2429;
end;
v5.decode = function(v2430) --[[ Line: 14847 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v2 (copy)
    local v2431 = v5.new();
    local v2432 = 0;
    while v2432 < buffer.len(v2430) do
        local v2433 = nil;
        local v2434 = nil;
        local v2435, v2436, v2437 = v0.readTag(v2430, v2432);
        v2433 = v2435;
        v2434 = v2436;
        v2432 = v2437;
        if v2434 == v0.wireTypes.varint then
            v2435 = nil;
            v2436, v2437 = v0.readVarInt(v2430, v2432);
            v2435 = v2436;
            v2432 = v2437;
        elseif v2434 == v0.wireTypes.lengthDelimited then
            if v2433 == 1 then
                v2435 = nil;
                v2436, v2437 = v0.readBuffer(v2430, v2432);
                v2435 = v2436;
                v2432 = v2437;
                table.insert(v2431.options, v2.UiScaledUDim2Prop_ConditionalOption.decode(v2435));
            else
                v2435 = nil;
                v2436, v2437 = v0.readVarInt(v2430, v2432);
                v2432 = v2437 + v2436;
            end;
        elseif v2434 == v0.wireTypes.i32 then
            v2435 = nil;
            v2436, v2437 = v0.readFixed32(v2430, v2432);
            v2435 = v2436;
            v2432 = v2437;
        elseif v2434 == v0.wireTypes.i64 then
            v2435 = nil;
            v2436, v2437 = v0.readFixed64(v2430, v2432);
            v2435 = v2436;
            v2432 = v2437;
        else
            error("Unsupported wire type: " .. v2434);
        end;
    end;
    return v2431;
end;
v5.jsonEncode = function(v2438) --[[ Line: 14890 ]] --[[ Name: jsonEncode ]]
    local v2439 = {};
    if v2438.options ~= nil and #v2438.options > 0 then
        local v2440 = {};
        for _, v2442 in v2438.options do
            table.insert(v2440, v2442:jsonEncode());
        end;
        v2439.options = v2440;
    end;
    return v2439;
end;
v5.jsonDecode = function(v2443) --[[ Line: 14904 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v2444 = v5.new();
    if v2443.options ~= nil then
        local v2445 = {};
        for _, v2447 in v2443.options do
            table.insert(v2445, v2.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v2447));
        end;
        v2444.options = v2445;
    end;
    return v2444;
end;
v5.descriptor = {
    name = "UiScaledUDim2Prop_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UiScaledUDim2Prop_ConditionalOptions = v5;
v1.default:register(v2.UiScaledUDim2Prop_ConditionalOptions);
return {
    StringFormat = v2.StringFormat, 
    StringFormat_FormatArg = v2.StringFormat_FormatArg, 
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
    IconProp = v2.IconProp, 
    IconProp_ConditionalOption = v2.IconProp_ConditionalOption, 
    IconProp_ConditionalOptions = v2.IconProp_ConditionalOptions, 
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