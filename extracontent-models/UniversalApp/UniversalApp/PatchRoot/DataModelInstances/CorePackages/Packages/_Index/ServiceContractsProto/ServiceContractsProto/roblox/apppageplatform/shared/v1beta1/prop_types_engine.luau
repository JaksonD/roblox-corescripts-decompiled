local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_condition);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 999 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        kind = if not (v6 ~= nil) or v6.kind == nil then nil else v6.kind
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 1005 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.kind ~= nil then
        if v7.kind.type == "literal" then
            local v10, v11 = v0.writeTag(v8, v9, 1, v0.wireTypes.varint);
            v10, v11 = v0.writeVarInt(v10, v11, v2.AutomaticSize.toNumber(v7.kind.value));
            v8 = v10;
            v9 = v11;
        elseif v7.kind.type == "binding_path" then
            local v12, v13 = v0.writeTag(v8, v9, 2, v0.wireTypes.lengthDelimited);
            v12, v13 = v0.writeString(v12, v13, v7.kind.value);
            v8 = v12;
            v9 = v13;
        elseif v7.kind.type == "conditional" then
            local v14 = v7.kind.value:encode();
            local v15, v16 = v0.writeTag(v8, v9, 3, v0.wireTypes.lengthDelimited);
            v15, v16 = v0.writeBuffer(v15, v16, v14, buffer.len(v14));
            v8 = v15;
            v9 = v16;
        end;
    end;
    local v17 = buffer.create(v9);
    buffer.copy(v17, 0, v8, 0, v9);
    return v17;
end;
v4.decode = function(v18) --[[ Line: 1029 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_0 (copy), v0 (copy), v2 (copy)
    local v19 = l_v4_0.new();
    local v20 = 0;
    while v20 < buffer.len(v18) do
        local v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v0.readTag(v18, v20);
        v21 = v23;
        v22 = v24;
        v20 = v25;
        if v22 == v0.wireTypes.varint then
            if v21 == 1 then
                v23 = nil;
                v24, v25 = v0.readVarIntI32(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.kind = {
                    type = "literal", 
                    value = v2.AutomaticSize.fromNumber(v23) or v23
                };
            else
                v23 = nil;
                v24, v25 = v0.readVarInt(v18, v20);
                v23 = v24;
                v20 = v25;
            end;
        elseif v22 == v0.wireTypes.lengthDelimited then
            if v21 == 2 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v23)
                };
            elseif v21 == 3 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.kind = {
                    type = "conditional", 
                    value = v2.AutomaticSizeProp_ConditionalOptions.decode(v23)
                };
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
v4.jsonEncode = function(v26) --[[ Line: 1086 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v27 = {};
    if v26.kind ~= nil then
        if v26.kind.type == "literal" then
            v27.literal = if typeof(v26.kind.value) == "number" then v26.kind.value else v2.AutomaticSize.toNumber(v26.kind.value);
            return v27;
        elseif v26.kind.type == "binding_path" then
            v27.bindingPath = v26.kind.value;
            return v27;
        elseif v26.kind.type == "conditional" then
            v27.conditional = v26.kind.value:jsonEncode();
        end;
    end;
    return v27;
end;
v4.jsonDecode = function(v28) --[[ Line: 1104 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_0 (copy), v2 (copy)
    local v29 = l_v4_0.new();
    if v28.literal ~= nil then
        v29.kind = {
            type = "literal", 
            value = if typeof(v28.literal) == "number" then v2.AutomaticSize.fromNumber(v28.literal) or v28.literal else v2.AutomaticSize.fromName(v28.literal) or v28.literal
        };
    end;
    if v28.binding_path ~= nil then
        v29.kind = {
            type = "binding_path", 
            value = v28.binding_path
        };
    end;
    if v28.bindingPath ~= nil then
        v29.kind = {
            type = "binding_path", 
            value = v28.bindingPath
        };
    end;
    if v28.conditional ~= nil then
        v29.kind = {
            type = "conditional", 
            value = v2.AutomaticSizeProp_ConditionalOptions.jsonDecode(v28.conditional)
        };
    end;
    return v29;
end;
v4.descriptor = {
    name = "AutomaticSizeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AutomaticSizeProp"
};
v2.AutomaticSizeProp = v4;
v1.default:register(v2.AutomaticSizeProp);
v4 = {};
v4.__index = v4;
local l_v4_1 = v4 --[[ copy: 4 -> 6 ]];
v4.new = function(v31) --[[ Line: 1148 ]] --[[ Name: new ]]
    -- upvalues: l_v4_1 (copy)
    return (setmetatable({
        condition = if not (v31 ~= nil) or v31.condition == nil then nil else v31.condition, 
        kind = if not (v31 ~= nil) or v31.kind == nil then nil else v31.kind
    }, l_v4_1));
end;
v4.encode = function(v32) --[[ Line: 1157 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.condition ~= nil then
        local v35 = v32.condition:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.kind ~= nil then
        if v32.kind.type == "literal" then
            local v38, v39 = v0.writeTag(v33, v34, 2, v0.wireTypes.varint);
            v38, v39 = v0.writeVarInt(v38, v39, v2.AutomaticSize.toNumber(v32.kind.value));
            v33 = v38;
            v34 = v39;
        elseif v32.kind.type == "binding_path" then
            local v40, v41 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
            v40, v41 = v0.writeString(v40, v41, v32.kind.value);
            v33 = v40;
            v34 = v41;
        end;
    end;
    local v42 = buffer.create(v34);
    buffer.copy(v42, 0, v33, 0, v34);
    return v42;
end;
v4.decode = function(v43) --[[ Line: 1183 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_1 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v44 = l_v4_1.new();
    local v45 = 0;
    while v45 < buffer.len(v43) do
        local v46 = nil;
        local v47 = nil;
        local v48, v49, v50 = v0.readTag(v43, v45);
        v46 = v48;
        v47 = v49;
        v45 = v50;
        if v47 == v0.wireTypes.varint then
            if v46 == 2 then
                v48 = nil;
                v49, v50 = v0.readVarIntI32(v43, v45);
                v48 = v49;
                v45 = v50;
                v44.kind = {
                    type = "literal", 
                    value = v2.AutomaticSize.fromNumber(v48) or v48
                };
            else
                v48 = nil;
                v49, v50 = v0.readVarInt(v43, v45);
                v48 = v49;
                v45 = v50;
            end;
        elseif v47 == v0.wireTypes.lengthDelimited then
            if v46 == 1 then
                v48 = nil;
                v49, v50 = v0.readBuffer(v43, v45);
                v48 = v49;
                v45 = v50;
                v44.condition = v3.PropCondition.decode(v48);
            elseif v46 == 3 then
                v48 = nil;
                v49, v50 = v0.readBuffer(v43, v45);
                v48 = v49;
                v45 = v50;
                v44.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v48)
                };
            else
                v48 = nil;
                v49, v50 = v0.readVarInt(v43, v45);
                v45 = v50 + v49;
            end;
        elseif v47 == v0.wireTypes.i32 then
            v48 = nil;
            v49, v50 = v0.readFixed32(v43, v45);
            v48 = v49;
            v45 = v50;
        elseif v47 == v0.wireTypes.i64 then
            v48 = nil;
            v49, v50 = v0.readFixed64(v43, v45);
            v48 = v49;
            v45 = v50;
        else
            error("Unsupported wire type: " .. v47);
        end;
    end;
    return v44;
end;
v4.jsonEncode = function(v51) --[[ Line: 1239 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v52 = {};
    if v51.condition ~= nil then
        v52.condition = v51.condition:jsonEncode();
    end;
    if v51.kind ~= nil then
        if v51.kind.type == "literal" then
            v52.literal = if typeof(v51.kind.value) == "number" then v51.kind.value else v2.AutomaticSize.toNumber(v51.kind.value);
            return v52;
        elseif v51.kind.type == "binding_path" then
            v52.bindingPath = v51.kind.value;
        end;
    end;
    return v52;
end;
v4.jsonDecode = function(v53) --[[ Line: 1259 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_1 (copy), v3 (copy), v2 (copy)
    local v54 = l_v4_1.new();
    if v53.condition ~= nil then
        v54.condition = v3.PropCondition.jsonDecode(v53.condition);
    end;
    if v53.literal ~= nil then
        v54.kind = {
            type = "literal", 
            value = if typeof(v53.literal) == "number" then v2.AutomaticSize.fromNumber(v53.literal) or v53.literal else v2.AutomaticSize.fromName(v53.literal) or v53.literal
        };
    end;
    if v53.binding_path ~= nil then
        v54.kind = {
            type = "binding_path", 
            value = v53.binding_path
        };
    end;
    if v53.bindingPath ~= nil then
        v54.kind = {
            type = "binding_path", 
            value = v53.bindingPath
        };
    end;
    return v54;
end;
v4.descriptor = {
    name = "AutomaticSizeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.AutomaticSizeProp_ConditionalOption = v4;
v1.default:register(v2.AutomaticSizeProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_2 = v4 --[[ copy: 4 -> 7 ]];
v4.new = function(v56) --[[ Line: 1303 ]] --[[ Name: new ]]
    -- upvalues: l_v4_2 (copy)
    return (setmetatable({
        options = if not (v56 ~= nil) or v56.options == nil then {} else v56.options
    }, l_v4_2));
end;
v4.encode = function(v57) --[[ Line: 1311 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v58 = buffer.create(0);
    local v59 = 0;
    if v57.options ~= nil and #v57.options > 0 then
        for _, v61 in v57.options do
            local v62 = v61:encode();
            local v63, v64 = v0.writeTag(v58, v59, 1, v0.wireTypes.lengthDelimited);
            v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
            v58 = v63;
            v59 = v64;
        end;
    end;
    local v65 = buffer.create(v59);
    buffer.copy(v65, 0, v58, 0, v59);
    return v65;
end;
v4.decode = function(v66) --[[ Line: 1328 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_2 (copy), v0 (copy), v2 (copy)
    local v67 = l_v4_2.new();
    local v68 = 0;
    while v68 < buffer.len(v66) do
        local v69 = nil;
        local v70 = nil;
        local v71, v72, v73 = v0.readTag(v66, v68);
        v69 = v71;
        v70 = v72;
        v68 = v73;
        if v70 == v0.wireTypes.varint then
            v71 = nil;
            v72, v73 = v0.readVarInt(v66, v68);
            v71 = v72;
            v68 = v73;
        elseif v70 == v0.wireTypes.lengthDelimited then
            if v69 == 1 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                table.insert(v67.options, v2.AutomaticSizeProp_ConditionalOption.decode(v71));
            else
                v71 = nil;
                v72, v73 = v0.readVarInt(v66, v68);
                v68 = v73 + v72;
            end;
        elseif v70 == v0.wireTypes.i32 then
            v71 = nil;
            v72, v73 = v0.readFixed32(v66, v68);
            v71 = v72;
            v68 = v73;
        elseif v70 == v0.wireTypes.i64 then
            v71 = nil;
            v72, v73 = v0.readFixed64(v66, v68);
            v71 = v72;
            v68 = v73;
        else
            error("Unsupported wire type: " .. v70);
        end;
    end;
    return v67;
end;
v4.jsonEncode = function(v74) --[[ Line: 1371 ]] --[[ Name: jsonEncode ]]
    local v75 = {};
    if v74.options ~= nil and #v74.options > 0 then
        local v76 = {};
        for _, v78 in v74.options do
            table.insert(v76, v78:jsonEncode());
        end;
        v75.options = v76;
    end;
    return v75;
end;
v4.jsonDecode = function(v79) --[[ Line: 1385 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_2 (copy), v2 (copy)
    local v80 = l_v4_2.new();
    if v79.options ~= nil then
        local v81 = {};
        for _, v83 in v79.options do
            table.insert(v81, v2.AutomaticSizeProp_ConditionalOption.jsonDecode(v83));
        end;
        v80.options = v81;
    end;
    return v80;
end;
v4.descriptor = {
    name = "AutomaticSizeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.AutomaticSizeProp_ConditionalOptions = v4;
v1.default:register(v2.AutomaticSizeProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_3 = v4 --[[ copy: 4 -> 8 ]];
v4.new = function(v85) --[[ Line: 1416 ]] --[[ Name: new ]]
    -- upvalues: l_v4_3 (copy)
    return (setmetatable({
        kind = if not (v85 ~= nil) or v85.kind == nil then nil else v85.kind
    }, l_v4_3));
end;
v4.encode = function(v86) --[[ Line: 1422 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v87 = buffer.create(0);
    local v88 = 0;
    if v86.kind ~= nil then
        if v86.kind.type == "literal" then
            local v89, v90 = v0.writeTag(v87, v88, 1, v0.wireTypes.varint);
            v89, v90 = v0.writeVarInt(v89, v90, v2.TextTruncate.toNumber(v86.kind.value));
            v87 = v89;
            v88 = v90;
        elseif v86.kind.type == "binding_path" then
            local v91, v92 = v0.writeTag(v87, v88, 2, v0.wireTypes.lengthDelimited);
            v91, v92 = v0.writeString(v91, v92, v86.kind.value);
            v87 = v91;
            v88 = v92;
        elseif v86.kind.type == "conditional" then
            local v93 = v86.kind.value:encode();
            local v94, v95 = v0.writeTag(v87, v88, 3, v0.wireTypes.lengthDelimited);
            v94, v95 = v0.writeBuffer(v94, v95, v93, buffer.len(v93));
            v87 = v94;
            v88 = v95;
        end;
    end;
    local v96 = buffer.create(v88);
    buffer.copy(v96, 0, v87, 0, v88);
    return v96;
end;
v4.decode = function(v97) --[[ Line: 1446 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_3 (copy), v0 (copy), v2 (copy)
    local v98 = l_v4_3.new();
    local v99 = 0;
    while v99 < buffer.len(v97) do
        local v100 = nil;
        local v101 = nil;
        local v102, v103, v104 = v0.readTag(v97, v99);
        v100 = v102;
        v101 = v103;
        v99 = v104;
        if v101 == v0.wireTypes.varint then
            if v100 == 1 then
                v102 = nil;
                v103, v104 = v0.readVarIntI32(v97, v99);
                v102 = v103;
                v99 = v104;
                v98.kind = {
                    type = "literal", 
                    value = v2.TextTruncate.fromNumber(v102) or v102
                };
            else
                v102 = nil;
                v103, v104 = v0.readVarInt(v97, v99);
                v102 = v103;
                v99 = v104;
            end;
        elseif v101 == v0.wireTypes.lengthDelimited then
            if v100 == 2 then
                v102 = nil;
                v103, v104 = v0.readBuffer(v97, v99);
                v102 = v103;
                v99 = v104;
                v98.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v102)
                };
            elseif v100 == 3 then
                v102 = nil;
                v103, v104 = v0.readBuffer(v97, v99);
                v102 = v103;
                v99 = v104;
                v98.kind = {
                    type = "conditional", 
                    value = v2.TextTruncateProp_ConditionalOptions.decode(v102)
                };
            else
                v102 = nil;
                v103, v104 = v0.readVarInt(v97, v99);
                v99 = v104 + v103;
            end;
        elseif v101 == v0.wireTypes.i32 then
            v102 = nil;
            v103, v104 = v0.readFixed32(v97, v99);
            v102 = v103;
            v99 = v104;
        elseif v101 == v0.wireTypes.i64 then
            v102 = nil;
            v103, v104 = v0.readFixed64(v97, v99);
            v102 = v103;
            v99 = v104;
        else
            error("Unsupported wire type: " .. v101);
        end;
    end;
    return v98;
end;
v4.jsonEncode = function(v105) --[[ Line: 1503 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v106 = {};
    if v105.kind ~= nil then
        if v105.kind.type == "literal" then
            v106.literal = if typeof(v105.kind.value) == "number" then v105.kind.value else v2.TextTruncate.toNumber(v105.kind.value);
            return v106;
        elseif v105.kind.type == "binding_path" then
            v106.bindingPath = v105.kind.value;
            return v106;
        elseif v105.kind.type == "conditional" then
            v106.conditional = v105.kind.value:jsonEncode();
        end;
    end;
    return v106;
end;
v4.jsonDecode = function(v107) --[[ Line: 1521 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_3 (copy), v2 (copy)
    local v108 = l_v4_3.new();
    if v107.literal ~= nil then
        v108.kind = {
            type = "literal", 
            value = if typeof(v107.literal) == "number" then v2.TextTruncate.fromNumber(v107.literal) or v107.literal else v2.TextTruncate.fromName(v107.literal) or v107.literal
        };
    end;
    if v107.binding_path ~= nil then
        v108.kind = {
            type = "binding_path", 
            value = v107.binding_path
        };
    end;
    if v107.bindingPath ~= nil then
        v108.kind = {
            type = "binding_path", 
            value = v107.bindingPath
        };
    end;
    if v107.conditional ~= nil then
        v108.kind = {
            type = "conditional", 
            value = v2.TextTruncateProp_ConditionalOptions.jsonDecode(v107.conditional)
        };
    end;
    return v108;
end;
v4.descriptor = {
    name = "TextTruncateProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TextTruncateProp"
};
v2.TextTruncateProp = v4;
v1.default:register(v2.TextTruncateProp);
v4 = {};
v4.__index = v4;
local l_v4_4 = v4 --[[ copy: 4 -> 9 ]];
v4.new = function(v110) --[[ Line: 1565 ]] --[[ Name: new ]]
    -- upvalues: l_v4_4 (copy)
    return (setmetatable({
        condition = if not (v110 ~= nil) or v110.condition == nil then nil else v110.condition, 
        kind = if not (v110 ~= nil) or v110.kind == nil then nil else v110.kind
    }, l_v4_4));
end;
v4.encode = function(v111) --[[ Line: 1574 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v112 = buffer.create(0);
    local v113 = 0;
    if v111.condition ~= nil then
        local v114 = v111.condition:encode();
        local v115, v116 = v0.writeTag(v112, v113, 1, v0.wireTypes.lengthDelimited);
        v115, v116 = v0.writeBuffer(v115, v116, v114, buffer.len(v114));
        v112 = v115;
        v113 = v116;
    end;
    if v111.kind ~= nil then
        if v111.kind.type == "literal" then
            local v117, v118 = v0.writeTag(v112, v113, 2, v0.wireTypes.varint);
            v117, v118 = v0.writeVarInt(v117, v118, v2.TextTruncate.toNumber(v111.kind.value));
            v112 = v117;
            v113 = v118;
        elseif v111.kind.type == "binding_path" then
            local v119, v120 = v0.writeTag(v112, v113, 3, v0.wireTypes.lengthDelimited);
            v119, v120 = v0.writeString(v119, v120, v111.kind.value);
            v112 = v119;
            v113 = v120;
        end;
    end;
    local v121 = buffer.create(v113);
    buffer.copy(v121, 0, v112, 0, v113);
    return v121;
end;
v4.decode = function(v122) --[[ Line: 1600 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_4 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v123 = l_v4_4.new();
    local v124 = 0;
    while v124 < buffer.len(v122) do
        local v125 = nil;
        local v126 = nil;
        local v127, v128, v129 = v0.readTag(v122, v124);
        v125 = v127;
        v126 = v128;
        v124 = v129;
        if v126 == v0.wireTypes.varint then
            if v125 == 2 then
                v127 = nil;
                v128, v129 = v0.readVarIntI32(v122, v124);
                v127 = v128;
                v124 = v129;
                v123.kind = {
                    type = "literal", 
                    value = v2.TextTruncate.fromNumber(v127) or v127
                };
            else
                v127 = nil;
                v128, v129 = v0.readVarInt(v122, v124);
                v127 = v128;
                v124 = v129;
            end;
        elseif v126 == v0.wireTypes.lengthDelimited then
            if v125 == 1 then
                v127 = nil;
                v128, v129 = v0.readBuffer(v122, v124);
                v127 = v128;
                v124 = v129;
                v123.condition = v3.PropCondition.decode(v127);
            elseif v125 == 3 then
                v127 = nil;
                v128, v129 = v0.readBuffer(v122, v124);
                v127 = v128;
                v124 = v129;
                v123.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v127)
                };
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
v4.jsonEncode = function(v130) --[[ Line: 1656 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v131 = {};
    if v130.condition ~= nil then
        v131.condition = v130.condition:jsonEncode();
    end;
    if v130.kind ~= nil then
        if v130.kind.type == "literal" then
            v131.literal = if typeof(v130.kind.value) == "number" then v130.kind.value else v2.TextTruncate.toNumber(v130.kind.value);
            return v131;
        elseif v130.kind.type == "binding_path" then
            v131.bindingPath = v130.kind.value;
        end;
    end;
    return v131;
end;
v4.jsonDecode = function(v132) --[[ Line: 1676 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_4 (copy), v3 (copy), v2 (copy)
    local v133 = l_v4_4.new();
    if v132.condition ~= nil then
        v133.condition = v3.PropCondition.jsonDecode(v132.condition);
    end;
    if v132.literal ~= nil then
        v133.kind = {
            type = "literal", 
            value = if typeof(v132.literal) == "number" then v2.TextTruncate.fromNumber(v132.literal) or v132.literal else v2.TextTruncate.fromName(v132.literal) or v132.literal
        };
    end;
    if v132.binding_path ~= nil then
        v133.kind = {
            type = "binding_path", 
            value = v132.binding_path
        };
    end;
    if v132.bindingPath ~= nil then
        v133.kind = {
            type = "binding_path", 
            value = v132.bindingPath
        };
    end;
    return v133;
end;
v4.descriptor = {
    name = "TextTruncateProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TextTruncateProp_ConditionalOption = v4;
v1.default:register(v2.TextTruncateProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_5 = v4 --[[ copy: 4 -> 10 ]];
v4.new = function(v135) --[[ Line: 1720 ]] --[[ Name: new ]]
    -- upvalues: l_v4_5 (copy)
    return (setmetatable({
        options = if not (v135 ~= nil) or v135.options == nil then {} else v135.options
    }, l_v4_5));
end;
v4.encode = function(v136) --[[ Line: 1728 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v137 = buffer.create(0);
    local v138 = 0;
    if v136.options ~= nil and #v136.options > 0 then
        for _, v140 in v136.options do
            local v141 = v140:encode();
            local v142, v143 = v0.writeTag(v137, v138, 1, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v137 = v142;
            v138 = v143;
        end;
    end;
    local v144 = buffer.create(v138);
    buffer.copy(v144, 0, v137, 0, v138);
    return v144;
end;
v4.decode = function(v145) --[[ Line: 1745 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_5 (copy), v0 (copy), v2 (copy)
    local v146 = l_v4_5.new();
    local v147 = 0;
    while v147 < buffer.len(v145) do
        local v148 = nil;
        local v149 = nil;
        local v150, v151, v152 = v0.readTag(v145, v147);
        v148 = v150;
        v149 = v151;
        v147 = v152;
        if v149 == v0.wireTypes.varint then
            v150 = nil;
            v151, v152 = v0.readVarInt(v145, v147);
            v150 = v151;
            v147 = v152;
        elseif v149 == v0.wireTypes.lengthDelimited then
            if v148 == 1 then
                v150 = nil;
                v151, v152 = v0.readBuffer(v145, v147);
                v150 = v151;
                v147 = v152;
                table.insert(v146.options, v2.TextTruncateProp_ConditionalOption.decode(v150));
            else
                v150 = nil;
                v151, v152 = v0.readVarInt(v145, v147);
                v147 = v152 + v151;
            end;
        elseif v149 == v0.wireTypes.i32 then
            v150 = nil;
            v151, v152 = v0.readFixed32(v145, v147);
            v150 = v151;
            v147 = v152;
        elseif v149 == v0.wireTypes.i64 then
            v150 = nil;
            v151, v152 = v0.readFixed64(v145, v147);
            v150 = v151;
            v147 = v152;
        else
            error("Unsupported wire type: " .. v149);
        end;
    end;
    return v146;
end;
v4.jsonEncode = function(v153) --[[ Line: 1788 ]] --[[ Name: jsonEncode ]]
    local v154 = {};
    if v153.options ~= nil and #v153.options > 0 then
        local v155 = {};
        for _, v157 in v153.options do
            table.insert(v155, v157:jsonEncode());
        end;
        v154.options = v155;
    end;
    return v154;
end;
v4.jsonDecode = function(v158) --[[ Line: 1802 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_5 (copy), v2 (copy)
    local v159 = l_v4_5.new();
    if v158.options ~= nil then
        local v160 = {};
        for _, v162 in v158.options do
            table.insert(v160, v2.TextTruncateProp_ConditionalOption.jsonDecode(v162));
        end;
        v159.options = v160;
    end;
    return v159;
end;
v4.descriptor = {
    name = "TextTruncateProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TextTruncateProp_ConditionalOptions = v4;
v1.default:register(v2.TextTruncateProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_6 = v4 --[[ copy: 4 -> 11 ]];
v4.new = function(v164) --[[ Line: 1833 ]] --[[ Name: new ]]
    -- upvalues: l_v4_6 (copy)
    return (setmetatable({
        kind = if not (v164 ~= nil) or v164.kind == nil then nil else v164.kind
    }, l_v4_6));
end;
v4.encode = function(v165) --[[ Line: 1839 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v166 = buffer.create(0);
    local v167 = 0;
    if v165.kind ~= nil then
        if v165.kind.type == "literal" then
            local v168, v169 = v0.writeTag(v166, v167, 1, v0.wireTypes.varint);
            v168, v169 = v0.writeVarInt(v168, v169, v2.TextXAlignment.toNumber(v165.kind.value));
            v166 = v168;
            v167 = v169;
        elseif v165.kind.type == "binding_path" then
            local v170, v171 = v0.writeTag(v166, v167, 2, v0.wireTypes.lengthDelimited);
            v170, v171 = v0.writeString(v170, v171, v165.kind.value);
            v166 = v170;
            v167 = v171;
        elseif v165.kind.type == "conditional" then
            local v172 = v165.kind.value:encode();
            local v173, v174 = v0.writeTag(v166, v167, 3, v0.wireTypes.lengthDelimited);
            v173, v174 = v0.writeBuffer(v173, v174, v172, buffer.len(v172));
            v166 = v173;
            v167 = v174;
        end;
    end;
    local v175 = buffer.create(v167);
    buffer.copy(v175, 0, v166, 0, v167);
    return v175;
end;
v4.decode = function(v176) --[[ Line: 1863 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_6 (copy), v0 (copy), v2 (copy)
    local v177 = l_v4_6.new();
    local v178 = 0;
    while v178 < buffer.len(v176) do
        local v179 = nil;
        local v180 = nil;
        local v181, v182, v183 = v0.readTag(v176, v178);
        v179 = v181;
        v180 = v182;
        v178 = v183;
        if v180 == v0.wireTypes.varint then
            if v179 == 1 then
                v181 = nil;
                v182, v183 = v0.readVarIntI32(v176, v178);
                v181 = v182;
                v178 = v183;
                v177.kind = {
                    type = "literal", 
                    value = v2.TextXAlignment.fromNumber(v181) or v181
                };
            else
                v181 = nil;
                v182, v183 = v0.readVarInt(v176, v178);
                v181 = v182;
                v178 = v183;
            end;
        elseif v180 == v0.wireTypes.lengthDelimited then
            if v179 == 2 then
                v181 = nil;
                v182, v183 = v0.readBuffer(v176, v178);
                v181 = v182;
                v178 = v183;
                v177.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v181)
                };
            elseif v179 == 3 then
                v181 = nil;
                v182, v183 = v0.readBuffer(v176, v178);
                v181 = v182;
                v178 = v183;
                v177.kind = {
                    type = "conditional", 
                    value = v2.TextXAlignmentProp_ConditionalOptions.decode(v181)
                };
            else
                v181 = nil;
                v182, v183 = v0.readVarInt(v176, v178);
                v178 = v183 + v182;
            end;
        elseif v180 == v0.wireTypes.i32 then
            v181 = nil;
            v182, v183 = v0.readFixed32(v176, v178);
            v181 = v182;
            v178 = v183;
        elseif v180 == v0.wireTypes.i64 then
            v181 = nil;
            v182, v183 = v0.readFixed64(v176, v178);
            v181 = v182;
            v178 = v183;
        else
            error("Unsupported wire type: " .. v180);
        end;
    end;
    return v177;
end;
v4.jsonEncode = function(v184) --[[ Line: 1920 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v185 = {};
    if v184.kind ~= nil then
        if v184.kind.type == "literal" then
            v185.literal = if typeof(v184.kind.value) == "number" then v184.kind.value else v2.TextXAlignment.toNumber(v184.kind.value);
            return v185;
        elseif v184.kind.type == "binding_path" then
            v185.bindingPath = v184.kind.value;
            return v185;
        elseif v184.kind.type == "conditional" then
            v185.conditional = v184.kind.value:jsonEncode();
        end;
    end;
    return v185;
end;
v4.jsonDecode = function(v186) --[[ Line: 1938 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_6 (copy), v2 (copy)
    local v187 = l_v4_6.new();
    if v186.literal ~= nil then
        v187.kind = {
            type = "literal", 
            value = if typeof(v186.literal) == "number" then v2.TextXAlignment.fromNumber(v186.literal) or v186.literal else v2.TextXAlignment.fromName(v186.literal) or v186.literal
        };
    end;
    if v186.binding_path ~= nil then
        v187.kind = {
            type = "binding_path", 
            value = v186.binding_path
        };
    end;
    if v186.bindingPath ~= nil then
        v187.kind = {
            type = "binding_path", 
            value = v186.bindingPath
        };
    end;
    if v186.conditional ~= nil then
        v187.kind = {
            type = "conditional", 
            value = v2.TextXAlignmentProp_ConditionalOptions.jsonDecode(v186.conditional)
        };
    end;
    return v187;
end;
v4.descriptor = {
    name = "TextXAlignmentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TextXAlignmentProp"
};
v2.TextXAlignmentProp = v4;
v1.default:register(v2.TextXAlignmentProp);
v4 = {};
v4.__index = v4;
local l_v4_7 = v4 --[[ copy: 4 -> 12 ]];
v4.new = function(v189) --[[ Line: 1982 ]] --[[ Name: new ]]
    -- upvalues: l_v4_7 (copy)
    return (setmetatable({
        condition = if not (v189 ~= nil) or v189.condition == nil then nil else v189.condition, 
        kind = if not (v189 ~= nil) or v189.kind == nil then nil else v189.kind
    }, l_v4_7));
end;
v4.encode = function(v190) --[[ Line: 1991 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v191 = buffer.create(0);
    local v192 = 0;
    if v190.condition ~= nil then
        local v193 = v190.condition:encode();
        local v194, v195 = v0.writeTag(v191, v192, 1, v0.wireTypes.lengthDelimited);
        v194, v195 = v0.writeBuffer(v194, v195, v193, buffer.len(v193));
        v191 = v194;
        v192 = v195;
    end;
    if v190.kind ~= nil then
        if v190.kind.type == "literal" then
            local v196, v197 = v0.writeTag(v191, v192, 2, v0.wireTypes.varint);
            v196, v197 = v0.writeVarInt(v196, v197, v2.TextXAlignment.toNumber(v190.kind.value));
            v191 = v196;
            v192 = v197;
        elseif v190.kind.type == "binding_path" then
            local v198, v199 = v0.writeTag(v191, v192, 3, v0.wireTypes.lengthDelimited);
            v198, v199 = v0.writeString(v198, v199, v190.kind.value);
            v191 = v198;
            v192 = v199;
        end;
    end;
    local v200 = buffer.create(v192);
    buffer.copy(v200, 0, v191, 0, v192);
    return v200;
end;
v4.decode = function(v201) --[[ Line: 2017 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_7 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v202 = l_v4_7.new();
    local v203 = 0;
    while v203 < buffer.len(v201) do
        local v204 = nil;
        local v205 = nil;
        local v206, v207, v208 = v0.readTag(v201, v203);
        v204 = v206;
        v205 = v207;
        v203 = v208;
        if v205 == v0.wireTypes.varint then
            if v204 == 2 then
                v206 = nil;
                v207, v208 = v0.readVarIntI32(v201, v203);
                v206 = v207;
                v203 = v208;
                v202.kind = {
                    type = "literal", 
                    value = v2.TextXAlignment.fromNumber(v206) or v206
                };
            else
                v206 = nil;
                v207, v208 = v0.readVarInt(v201, v203);
                v206 = v207;
                v203 = v208;
            end;
        elseif v205 == v0.wireTypes.lengthDelimited then
            if v204 == 1 then
                v206 = nil;
                v207, v208 = v0.readBuffer(v201, v203);
                v206 = v207;
                v203 = v208;
                v202.condition = v3.PropCondition.decode(v206);
            elseif v204 == 3 then
                v206 = nil;
                v207, v208 = v0.readBuffer(v201, v203);
                v206 = v207;
                v203 = v208;
                v202.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v206)
                };
            else
                v206 = nil;
                v207, v208 = v0.readVarInt(v201, v203);
                v203 = v208 + v207;
            end;
        elseif v205 == v0.wireTypes.i32 then
            v206 = nil;
            v207, v208 = v0.readFixed32(v201, v203);
            v206 = v207;
            v203 = v208;
        elseif v205 == v0.wireTypes.i64 then
            v206 = nil;
            v207, v208 = v0.readFixed64(v201, v203);
            v206 = v207;
            v203 = v208;
        else
            error("Unsupported wire type: " .. v205);
        end;
    end;
    return v202;
end;
v4.jsonEncode = function(v209) --[[ Line: 2073 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v210 = {};
    if v209.condition ~= nil then
        v210.condition = v209.condition:jsonEncode();
    end;
    if v209.kind ~= nil then
        if v209.kind.type == "literal" then
            v210.literal = if typeof(v209.kind.value) == "number" then v209.kind.value else v2.TextXAlignment.toNumber(v209.kind.value);
            return v210;
        elseif v209.kind.type == "binding_path" then
            v210.bindingPath = v209.kind.value;
        end;
    end;
    return v210;
end;
v4.jsonDecode = function(v211) --[[ Line: 2093 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_7 (copy), v3 (copy), v2 (copy)
    local v212 = l_v4_7.new();
    if v211.condition ~= nil then
        v212.condition = v3.PropCondition.jsonDecode(v211.condition);
    end;
    if v211.literal ~= nil then
        v212.kind = {
            type = "literal", 
            value = if typeof(v211.literal) == "number" then v2.TextXAlignment.fromNumber(v211.literal) or v211.literal else v2.TextXAlignment.fromName(v211.literal) or v211.literal
        };
    end;
    if v211.binding_path ~= nil then
        v212.kind = {
            type = "binding_path", 
            value = v211.binding_path
        };
    end;
    if v211.bindingPath ~= nil then
        v212.kind = {
            type = "binding_path", 
            value = v211.bindingPath
        };
    end;
    return v212;
end;
v4.descriptor = {
    name = "TextXAlignmentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TextXAlignmentProp_ConditionalOption = v4;
v1.default:register(v2.TextXAlignmentProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_8 = v4 --[[ copy: 4 -> 13 ]];
v4.new = function(v214) --[[ Line: 2137 ]] --[[ Name: new ]]
    -- upvalues: l_v4_8 (copy)
    return (setmetatable({
        options = if not (v214 ~= nil) or v214.options == nil then {} else v214.options
    }, l_v4_8));
end;
v4.encode = function(v215) --[[ Line: 2145 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v216 = buffer.create(0);
    local v217 = 0;
    if v215.options ~= nil and #v215.options > 0 then
        for _, v219 in v215.options do
            local v220 = v219:encode();
            local v221, v222 = v0.writeTag(v216, v217, 1, v0.wireTypes.lengthDelimited);
            v221, v222 = v0.writeBuffer(v221, v222, v220, buffer.len(v220));
            v216 = v221;
            v217 = v222;
        end;
    end;
    local v223 = buffer.create(v217);
    buffer.copy(v223, 0, v216, 0, v217);
    return v223;
end;
v4.decode = function(v224) --[[ Line: 2162 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_8 (copy), v0 (copy), v2 (copy)
    local v225 = l_v4_8.new();
    local v226 = 0;
    while v226 < buffer.len(v224) do
        local v227 = nil;
        local v228 = nil;
        local v229, v230, v231 = v0.readTag(v224, v226);
        v227 = v229;
        v228 = v230;
        v226 = v231;
        if v228 == v0.wireTypes.varint then
            v229 = nil;
            v230, v231 = v0.readVarInt(v224, v226);
            v229 = v230;
            v226 = v231;
        elseif v228 == v0.wireTypes.lengthDelimited then
            if v227 == 1 then
                v229 = nil;
                v230, v231 = v0.readBuffer(v224, v226);
                v229 = v230;
                v226 = v231;
                table.insert(v225.options, v2.TextXAlignmentProp_ConditionalOption.decode(v229));
            else
                v229 = nil;
                v230, v231 = v0.readVarInt(v224, v226);
                v226 = v231 + v230;
            end;
        elseif v228 == v0.wireTypes.i32 then
            v229 = nil;
            v230, v231 = v0.readFixed32(v224, v226);
            v229 = v230;
            v226 = v231;
        elseif v228 == v0.wireTypes.i64 then
            v229 = nil;
            v230, v231 = v0.readFixed64(v224, v226);
            v229 = v230;
            v226 = v231;
        else
            error("Unsupported wire type: " .. v228);
        end;
    end;
    return v225;
end;
v4.jsonEncode = function(v232) --[[ Line: 2205 ]] --[[ Name: jsonEncode ]]
    local v233 = {};
    if v232.options ~= nil and #v232.options > 0 then
        local v234 = {};
        for _, v236 in v232.options do
            table.insert(v234, v236:jsonEncode());
        end;
        v233.options = v234;
    end;
    return v233;
end;
v4.jsonDecode = function(v237) --[[ Line: 2219 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_8 (copy), v2 (copy)
    local v238 = l_v4_8.new();
    if v237.options ~= nil then
        local v239 = {};
        for _, v241 in v237.options do
            table.insert(v239, v2.TextXAlignmentProp_ConditionalOption.jsonDecode(v241));
        end;
        v238.options = v239;
    end;
    return v238;
end;
v4.descriptor = {
    name = "TextXAlignmentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TextXAlignmentProp_ConditionalOptions = v4;
v1.default:register(v2.TextXAlignmentProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_9 = v4 --[[ copy: 4 -> 14 ]];
v4.new = function(v243) --[[ Line: 2250 ]] --[[ Name: new ]]
    -- upvalues: l_v4_9 (copy)
    return (setmetatable({
        kind = if not (v243 ~= nil) or v243.kind == nil then nil else v243.kind
    }, l_v4_9));
end;
v4.encode = function(v244) --[[ Line: 2256 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v245 = buffer.create(0);
    local v246 = 0;
    if v244.kind ~= nil then
        if v244.kind.type == "literal" then
            local v247, v248 = v0.writeTag(v245, v246, 1, v0.wireTypes.varint);
            v247, v248 = v0.writeVarInt(v247, v248, v2.TextYAlignment.toNumber(v244.kind.value));
            v245 = v247;
            v246 = v248;
        elseif v244.kind.type == "binding_path" then
            local v249, v250 = v0.writeTag(v245, v246, 2, v0.wireTypes.lengthDelimited);
            v249, v250 = v0.writeString(v249, v250, v244.kind.value);
            v245 = v249;
            v246 = v250;
        elseif v244.kind.type == "conditional" then
            local v251 = v244.kind.value:encode();
            local v252, v253 = v0.writeTag(v245, v246, 3, v0.wireTypes.lengthDelimited);
            v252, v253 = v0.writeBuffer(v252, v253, v251, buffer.len(v251));
            v245 = v252;
            v246 = v253;
        end;
    end;
    local v254 = buffer.create(v246);
    buffer.copy(v254, 0, v245, 0, v246);
    return v254;
end;
v4.decode = function(v255) --[[ Line: 2280 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_9 (copy), v0 (copy), v2 (copy)
    local v256 = l_v4_9.new();
    local v257 = 0;
    while v257 < buffer.len(v255) do
        local v258 = nil;
        local v259 = nil;
        local v260, v261, v262 = v0.readTag(v255, v257);
        v258 = v260;
        v259 = v261;
        v257 = v262;
        if v259 == v0.wireTypes.varint then
            if v258 == 1 then
                v260 = nil;
                v261, v262 = v0.readVarIntI32(v255, v257);
                v260 = v261;
                v257 = v262;
                v256.kind = {
                    type = "literal", 
                    value = v2.TextYAlignment.fromNumber(v260) or v260
                };
            else
                v260 = nil;
                v261, v262 = v0.readVarInt(v255, v257);
                v260 = v261;
                v257 = v262;
            end;
        elseif v259 == v0.wireTypes.lengthDelimited then
            if v258 == 2 then
                v260 = nil;
                v261, v262 = v0.readBuffer(v255, v257);
                v260 = v261;
                v257 = v262;
                v256.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v260)
                };
            elseif v258 == 3 then
                v260 = nil;
                v261, v262 = v0.readBuffer(v255, v257);
                v260 = v261;
                v257 = v262;
                v256.kind = {
                    type = "conditional", 
                    value = v2.TextYAlignmentProp_ConditionalOptions.decode(v260)
                };
            else
                v260 = nil;
                v261, v262 = v0.readVarInt(v255, v257);
                v257 = v262 + v261;
            end;
        elseif v259 == v0.wireTypes.i32 then
            v260 = nil;
            v261, v262 = v0.readFixed32(v255, v257);
            v260 = v261;
            v257 = v262;
        elseif v259 == v0.wireTypes.i64 then
            v260 = nil;
            v261, v262 = v0.readFixed64(v255, v257);
            v260 = v261;
            v257 = v262;
        else
            error("Unsupported wire type: " .. v259);
        end;
    end;
    return v256;
end;
v4.jsonEncode = function(v263) --[[ Line: 2337 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v264 = {};
    if v263.kind ~= nil then
        if v263.kind.type == "literal" then
            v264.literal = if typeof(v263.kind.value) == "number" then v263.kind.value else v2.TextYAlignment.toNumber(v263.kind.value);
            return v264;
        elseif v263.kind.type == "binding_path" then
            v264.bindingPath = v263.kind.value;
            return v264;
        elseif v263.kind.type == "conditional" then
            v264.conditional = v263.kind.value:jsonEncode();
        end;
    end;
    return v264;
end;
v4.jsonDecode = function(v265) --[[ Line: 2355 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_9 (copy), v2 (copy)
    local v266 = l_v4_9.new();
    if v265.literal ~= nil then
        v266.kind = {
            type = "literal", 
            value = if typeof(v265.literal) == "number" then v2.TextYAlignment.fromNumber(v265.literal) or v265.literal else v2.TextYAlignment.fromName(v265.literal) or v265.literal
        };
    end;
    if v265.binding_path ~= nil then
        v266.kind = {
            type = "binding_path", 
            value = v265.binding_path
        };
    end;
    if v265.bindingPath ~= nil then
        v266.kind = {
            type = "binding_path", 
            value = v265.bindingPath
        };
    end;
    if v265.conditional ~= nil then
        v266.kind = {
            type = "conditional", 
            value = v2.TextYAlignmentProp_ConditionalOptions.jsonDecode(v265.conditional)
        };
    end;
    return v266;
end;
v4.descriptor = {
    name = "TextYAlignmentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TextYAlignmentProp"
};
v2.TextYAlignmentProp = v4;
v1.default:register(v2.TextYAlignmentProp);
v4 = {};
v4.__index = v4;
local l_v4_10 = v4 --[[ copy: 4 -> 15 ]];
v4.new = function(v268) --[[ Line: 2399 ]] --[[ Name: new ]]
    -- upvalues: l_v4_10 (copy)
    return (setmetatable({
        condition = if not (v268 ~= nil) or v268.condition == nil then nil else v268.condition, 
        kind = if not (v268 ~= nil) or v268.kind == nil then nil else v268.kind
    }, l_v4_10));
end;
v4.encode = function(v269) --[[ Line: 2408 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v270 = buffer.create(0);
    local v271 = 0;
    if v269.condition ~= nil then
        local v272 = v269.condition:encode();
        local v273, v274 = v0.writeTag(v270, v271, 1, v0.wireTypes.lengthDelimited);
        v273, v274 = v0.writeBuffer(v273, v274, v272, buffer.len(v272));
        v270 = v273;
        v271 = v274;
    end;
    if v269.kind ~= nil then
        if v269.kind.type == "literal" then
            local v275, v276 = v0.writeTag(v270, v271, 2, v0.wireTypes.varint);
            v275, v276 = v0.writeVarInt(v275, v276, v2.TextYAlignment.toNumber(v269.kind.value));
            v270 = v275;
            v271 = v276;
        elseif v269.kind.type == "binding_path" then
            local v277, v278 = v0.writeTag(v270, v271, 3, v0.wireTypes.lengthDelimited);
            v277, v278 = v0.writeString(v277, v278, v269.kind.value);
            v270 = v277;
            v271 = v278;
        end;
    end;
    local v279 = buffer.create(v271);
    buffer.copy(v279, 0, v270, 0, v271);
    return v279;
end;
v4.decode = function(v280) --[[ Line: 2434 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_10 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v281 = l_v4_10.new();
    local v282 = 0;
    while v282 < buffer.len(v280) do
        local v283 = nil;
        local v284 = nil;
        local v285, v286, v287 = v0.readTag(v280, v282);
        v283 = v285;
        v284 = v286;
        v282 = v287;
        if v284 == v0.wireTypes.varint then
            if v283 == 2 then
                v285 = nil;
                v286, v287 = v0.readVarIntI32(v280, v282);
                v285 = v286;
                v282 = v287;
                v281.kind = {
                    type = "literal", 
                    value = v2.TextYAlignment.fromNumber(v285) or v285
                };
            else
                v285 = nil;
                v286, v287 = v0.readVarInt(v280, v282);
                v285 = v286;
                v282 = v287;
            end;
        elseif v284 == v0.wireTypes.lengthDelimited then
            if v283 == 1 then
                v285 = nil;
                v286, v287 = v0.readBuffer(v280, v282);
                v285 = v286;
                v282 = v287;
                v281.condition = v3.PropCondition.decode(v285);
            elseif v283 == 3 then
                v285 = nil;
                v286, v287 = v0.readBuffer(v280, v282);
                v285 = v286;
                v282 = v287;
                v281.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v285)
                };
            else
                v285 = nil;
                v286, v287 = v0.readVarInt(v280, v282);
                v282 = v287 + v286;
            end;
        elseif v284 == v0.wireTypes.i32 then
            v285 = nil;
            v286, v287 = v0.readFixed32(v280, v282);
            v285 = v286;
            v282 = v287;
        elseif v284 == v0.wireTypes.i64 then
            v285 = nil;
            v286, v287 = v0.readFixed64(v280, v282);
            v285 = v286;
            v282 = v287;
        else
            error("Unsupported wire type: " .. v284);
        end;
    end;
    return v281;
end;
v4.jsonEncode = function(v288) --[[ Line: 2490 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v289 = {};
    if v288.condition ~= nil then
        v289.condition = v288.condition:jsonEncode();
    end;
    if v288.kind ~= nil then
        if v288.kind.type == "literal" then
            v289.literal = if typeof(v288.kind.value) == "number" then v288.kind.value else v2.TextYAlignment.toNumber(v288.kind.value);
            return v289;
        elseif v288.kind.type == "binding_path" then
            v289.bindingPath = v288.kind.value;
        end;
    end;
    return v289;
end;
v4.jsonDecode = function(v290) --[[ Line: 2510 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_10 (copy), v3 (copy), v2 (copy)
    local v291 = l_v4_10.new();
    if v290.condition ~= nil then
        v291.condition = v3.PropCondition.jsonDecode(v290.condition);
    end;
    if v290.literal ~= nil then
        v291.kind = {
            type = "literal", 
            value = if typeof(v290.literal) == "number" then v2.TextYAlignment.fromNumber(v290.literal) or v290.literal else v2.TextYAlignment.fromName(v290.literal) or v290.literal
        };
    end;
    if v290.binding_path ~= nil then
        v291.kind = {
            type = "binding_path", 
            value = v290.binding_path
        };
    end;
    if v290.bindingPath ~= nil then
        v291.kind = {
            type = "binding_path", 
            value = v290.bindingPath
        };
    end;
    return v291;
end;
v4.descriptor = {
    name = "TextYAlignmentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TextYAlignmentProp_ConditionalOption = v4;
v1.default:register(v2.TextYAlignmentProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_11 = v4 --[[ copy: 4 -> 16 ]];
v4.new = function(v293) --[[ Line: 2554 ]] --[[ Name: new ]]
    -- upvalues: l_v4_11 (copy)
    return (setmetatable({
        options = if not (v293 ~= nil) or v293.options == nil then {} else v293.options
    }, l_v4_11));
end;
v4.encode = function(v294) --[[ Line: 2562 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v295 = buffer.create(0);
    local v296 = 0;
    if v294.options ~= nil and #v294.options > 0 then
        for _, v298 in v294.options do
            local v299 = v298:encode();
            local v300, v301 = v0.writeTag(v295, v296, 1, v0.wireTypes.lengthDelimited);
            v300, v301 = v0.writeBuffer(v300, v301, v299, buffer.len(v299));
            v295 = v300;
            v296 = v301;
        end;
    end;
    local v302 = buffer.create(v296);
    buffer.copy(v302, 0, v295, 0, v296);
    return v302;
end;
v4.decode = function(v303) --[[ Line: 2579 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_11 (copy), v0 (copy), v2 (copy)
    local v304 = l_v4_11.new();
    local v305 = 0;
    while v305 < buffer.len(v303) do
        local v306 = nil;
        local v307 = nil;
        local v308, v309, v310 = v0.readTag(v303, v305);
        v306 = v308;
        v307 = v309;
        v305 = v310;
        if v307 == v0.wireTypes.varint then
            v308 = nil;
            v309, v310 = v0.readVarInt(v303, v305);
            v308 = v309;
            v305 = v310;
        elseif v307 == v0.wireTypes.lengthDelimited then
            if v306 == 1 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                table.insert(v304.options, v2.TextYAlignmentProp_ConditionalOption.decode(v308));
            else
                v308 = nil;
                v309, v310 = v0.readVarInt(v303, v305);
                v305 = v310 + v309;
            end;
        elseif v307 == v0.wireTypes.i32 then
            v308 = nil;
            v309, v310 = v0.readFixed32(v303, v305);
            v308 = v309;
            v305 = v310;
        elseif v307 == v0.wireTypes.i64 then
            v308 = nil;
            v309, v310 = v0.readFixed64(v303, v305);
            v308 = v309;
            v305 = v310;
        else
            error("Unsupported wire type: " .. v307);
        end;
    end;
    return v304;
end;
v4.jsonEncode = function(v311) --[[ Line: 2622 ]] --[[ Name: jsonEncode ]]
    local v312 = {};
    if v311.options ~= nil and #v311.options > 0 then
        local v313 = {};
        for _, v315 in v311.options do
            table.insert(v313, v315:jsonEncode());
        end;
        v312.options = v313;
    end;
    return v312;
end;
v4.jsonDecode = function(v316) --[[ Line: 2636 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_11 (copy), v2 (copy)
    local v317 = l_v4_11.new();
    if v316.options ~= nil then
        local v318 = {};
        for _, v320 in v316.options do
            table.insert(v318, v2.TextYAlignmentProp_ConditionalOption.jsonDecode(v320));
        end;
        v317.options = v318;
    end;
    return v317;
end;
v4.descriptor = {
    name = "TextYAlignmentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TextYAlignmentProp_ConditionalOptions = v4;
v1.default:register(v2.TextYAlignmentProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_12 = v4 --[[ copy: 4 -> 17 ]];
v4.new = function(v322) --[[ Line: 2667 ]] --[[ Name: new ]]
    -- upvalues: l_v4_12 (copy)
    return (setmetatable({
        kind = if not (v322 ~= nil) or v322.kind == nil then nil else v322.kind
    }, l_v4_12));
end;
v4.encode = function(v323) --[[ Line: 2673 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v324 = buffer.create(0);
    local v325 = 0;
    if v323.kind ~= nil then
        if v323.kind.type == "literal" then
            local v326, v327 = v0.writeTag(v324, v325, 1, v0.wireTypes.varint);
            v326, v327 = v0.writeVarInt(v326, v327, v2.UIFlexMode.toNumber(v323.kind.value));
            v324 = v326;
            v325 = v327;
        elseif v323.kind.type == "binding_path" then
            local v328, v329 = v0.writeTag(v324, v325, 2, v0.wireTypes.lengthDelimited);
            v328, v329 = v0.writeString(v328, v329, v323.kind.value);
            v324 = v328;
            v325 = v329;
        elseif v323.kind.type == "conditional" then
            local v330 = v323.kind.value:encode();
            local v331, v332 = v0.writeTag(v324, v325, 3, v0.wireTypes.lengthDelimited);
            v331, v332 = v0.writeBuffer(v331, v332, v330, buffer.len(v330));
            v324 = v331;
            v325 = v332;
        end;
    end;
    local v333 = buffer.create(v325);
    buffer.copy(v333, 0, v324, 0, v325);
    return v333;
end;
v4.decode = function(v334) --[[ Line: 2696 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_12 (copy), v0 (copy), v2 (copy)
    local v335 = l_v4_12.new();
    local v336 = 0;
    while v336 < buffer.len(v334) do
        local v337 = nil;
        local v338 = nil;
        local v339, v340, v341 = v0.readTag(v334, v336);
        v337 = v339;
        v338 = v340;
        v336 = v341;
        if v338 == v0.wireTypes.varint then
            if v337 == 1 then
                v339 = nil;
                v340, v341 = v0.readVarIntI32(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.kind = {
                    type = "literal", 
                    value = v2.UIFlexMode.fromNumber(v339) or v339
                };
            else
                v339 = nil;
                v340, v341 = v0.readVarInt(v334, v336);
                v339 = v340;
                v336 = v341;
            end;
        elseif v338 == v0.wireTypes.lengthDelimited then
            if v337 == 2 then
                v339 = nil;
                v340, v341 = v0.readBuffer(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v339)
                };
            elseif v337 == 3 then
                v339 = nil;
                v340, v341 = v0.readBuffer(v334, v336);
                v339 = v340;
                v336 = v341;
                v335.kind = {
                    type = "conditional", 
                    value = v2.UIFlexModeProp_ConditionalOptions.decode(v339)
                };
            else
                v339 = nil;
                v340, v341 = v0.readVarInt(v334, v336);
                v336 = v341 + v340;
            end;
        elseif v338 == v0.wireTypes.i32 then
            v339 = nil;
            v340, v341 = v0.readFixed32(v334, v336);
            v339 = v340;
            v336 = v341;
        elseif v338 == v0.wireTypes.i64 then
            v339 = nil;
            v340, v341 = v0.readFixed64(v334, v336);
            v339 = v340;
            v336 = v341;
        else
            error("Unsupported wire type: " .. v338);
        end;
    end;
    return v335;
end;
v4.jsonEncode = function(v342) --[[ Line: 2753 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v343 = {};
    if v342.kind ~= nil then
        if v342.kind.type == "literal" then
            v343.literal = if typeof(v342.kind.value) == "number" then v342.kind.value else v2.UIFlexMode.toNumber(v342.kind.value);
            return v343;
        elseif v342.kind.type == "binding_path" then
            v343.bindingPath = v342.kind.value;
            return v343;
        elseif v342.kind.type == "conditional" then
            v343.conditional = v342.kind.value:jsonEncode();
        end;
    end;
    return v343;
end;
v4.jsonDecode = function(v344) --[[ Line: 2771 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_12 (copy), v2 (copy)
    local v345 = l_v4_12.new();
    if v344.literal ~= nil then
        v345.kind = {
            type = "literal", 
            value = if typeof(v344.literal) == "number" then v2.UIFlexMode.fromNumber(v344.literal) or v344.literal else v2.UIFlexMode.fromName(v344.literal) or v344.literal
        };
    end;
    if v344.binding_path ~= nil then
        v345.kind = {
            type = "binding_path", 
            value = v344.binding_path
        };
    end;
    if v344.bindingPath ~= nil then
        v345.kind = {
            type = "binding_path", 
            value = v344.bindingPath
        };
    end;
    if v344.conditional ~= nil then
        v345.kind = {
            type = "conditional", 
            value = v2.UIFlexModeProp_ConditionalOptions.jsonDecode(v344.conditional)
        };
    end;
    return v345;
end;
v4.descriptor = {
    name = "UIFlexModeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UIFlexModeProp"
};
v2.UIFlexModeProp = v4;
v1.default:register(v2.UIFlexModeProp);
v4 = {};
v4.__index = v4;
local l_v4_13 = v4 --[[ copy: 4 -> 18 ]];
v4.new = function(v347) --[[ Line: 2815 ]] --[[ Name: new ]]
    -- upvalues: l_v4_13 (copy)
    return (setmetatable({
        condition = if not (v347 ~= nil) or v347.condition == nil then nil else v347.condition, 
        kind = if not (v347 ~= nil) or v347.kind == nil then nil else v347.kind
    }, l_v4_13));
end;
v4.encode = function(v348) --[[ Line: 2824 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v349 = buffer.create(0);
    local v350 = 0;
    if v348.condition ~= nil then
        local v351 = v348.condition:encode();
        local v352, v353 = v0.writeTag(v349, v350, 1, v0.wireTypes.lengthDelimited);
        v352, v353 = v0.writeBuffer(v352, v353, v351, buffer.len(v351));
        v349 = v352;
        v350 = v353;
    end;
    if v348.kind ~= nil then
        if v348.kind.type == "literal" then
            local v354, v355 = v0.writeTag(v349, v350, 2, v0.wireTypes.varint);
            v354, v355 = v0.writeVarInt(v354, v355, v2.UIFlexMode.toNumber(v348.kind.value));
            v349 = v354;
            v350 = v355;
        elseif v348.kind.type == "binding_path" then
            local v356, v357 = v0.writeTag(v349, v350, 3, v0.wireTypes.lengthDelimited);
            v356, v357 = v0.writeString(v356, v357, v348.kind.value);
            v349 = v356;
            v350 = v357;
        end;
    end;
    local v358 = buffer.create(v350);
    buffer.copy(v358, 0, v349, 0, v350);
    return v358;
end;
v4.decode = function(v359) --[[ Line: 2849 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_13 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v360 = l_v4_13.new();
    local v361 = 0;
    while v361 < buffer.len(v359) do
        local v362 = nil;
        local v363 = nil;
        local v364, v365, v366 = v0.readTag(v359, v361);
        v362 = v364;
        v363 = v365;
        v361 = v366;
        if v363 == v0.wireTypes.varint then
            if v362 == 2 then
                v364 = nil;
                v365, v366 = v0.readVarIntI32(v359, v361);
                v364 = v365;
                v361 = v366;
                v360.kind = {
                    type = "literal", 
                    value = v2.UIFlexMode.fromNumber(v364) or v364
                };
            else
                v364 = nil;
                v365, v366 = v0.readVarInt(v359, v361);
                v364 = v365;
                v361 = v366;
            end;
        elseif v363 == v0.wireTypes.lengthDelimited then
            if v362 == 1 then
                v364 = nil;
                v365, v366 = v0.readBuffer(v359, v361);
                v364 = v365;
                v361 = v366;
                v360.condition = v3.PropCondition.decode(v364);
            elseif v362 == 3 then
                v364 = nil;
                v365, v366 = v0.readBuffer(v359, v361);
                v364 = v365;
                v361 = v366;
                v360.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v364)
                };
            else
                v364 = nil;
                v365, v366 = v0.readVarInt(v359, v361);
                v361 = v366 + v365;
            end;
        elseif v363 == v0.wireTypes.i32 then
            v364 = nil;
            v365, v366 = v0.readFixed32(v359, v361);
            v364 = v365;
            v361 = v366;
        elseif v363 == v0.wireTypes.i64 then
            v364 = nil;
            v365, v366 = v0.readFixed64(v359, v361);
            v364 = v365;
            v361 = v366;
        else
            error("Unsupported wire type: " .. v363);
        end;
    end;
    return v360;
end;
v4.jsonEncode = function(v367) --[[ Line: 2905 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v368 = {};
    if v367.condition ~= nil then
        v368.condition = v367.condition:jsonEncode();
    end;
    if v367.kind ~= nil then
        if v367.kind.type == "literal" then
            v368.literal = if typeof(v367.kind.value) == "number" then v367.kind.value else v2.UIFlexMode.toNumber(v367.kind.value);
            return v368;
        elseif v367.kind.type == "binding_path" then
            v368.bindingPath = v367.kind.value;
        end;
    end;
    return v368;
end;
v4.jsonDecode = function(v369) --[[ Line: 2925 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_13 (copy), v3 (copy), v2 (copy)
    local v370 = l_v4_13.new();
    if v369.condition ~= nil then
        v370.condition = v3.PropCondition.jsonDecode(v369.condition);
    end;
    if v369.literal ~= nil then
        v370.kind = {
            type = "literal", 
            value = if typeof(v369.literal) == "number" then v2.UIFlexMode.fromNumber(v369.literal) or v369.literal else v2.UIFlexMode.fromName(v369.literal) or v369.literal
        };
    end;
    if v369.binding_path ~= nil then
        v370.kind = {
            type = "binding_path", 
            value = v369.binding_path
        };
    end;
    if v369.bindingPath ~= nil then
        v370.kind = {
            type = "binding_path", 
            value = v369.bindingPath
        };
    end;
    return v370;
end;
v4.descriptor = {
    name = "UIFlexModeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.UIFlexModeProp_ConditionalOption = v4;
v1.default:register(v2.UIFlexModeProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_14 = v4 --[[ copy: 4 -> 19 ]];
v4.new = function(v372) --[[ Line: 2969 ]] --[[ Name: new ]]
    -- upvalues: l_v4_14 (copy)
    return (setmetatable({
        options = if not (v372 ~= nil) or v372.options == nil then {} else v372.options
    }, l_v4_14));
end;
v4.encode = function(v373) --[[ Line: 2977 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v374 = buffer.create(0);
    local v375 = 0;
    if v373.options ~= nil and #v373.options > 0 then
        for _, v377 in v373.options do
            local v378 = v377:encode();
            local v379, v380 = v0.writeTag(v374, v375, 1, v0.wireTypes.lengthDelimited);
            v379, v380 = v0.writeBuffer(v379, v380, v378, buffer.len(v378));
            v374 = v379;
            v375 = v380;
        end;
    end;
    local v381 = buffer.create(v375);
    buffer.copy(v381, 0, v374, 0, v375);
    return v381;
end;
v4.decode = function(v382) --[[ Line: 2994 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_14 (copy), v0 (copy), v2 (copy)
    local v383 = l_v4_14.new();
    local v384 = 0;
    while v384 < buffer.len(v382) do
        local v385 = nil;
        local v386 = nil;
        local v387, v388, v389 = v0.readTag(v382, v384);
        v385 = v387;
        v386 = v388;
        v384 = v389;
        if v386 == v0.wireTypes.varint then
            v387 = nil;
            v388, v389 = v0.readVarInt(v382, v384);
            v387 = v388;
            v384 = v389;
        elseif v386 == v0.wireTypes.lengthDelimited then
            if v385 == 1 then
                v387 = nil;
                v388, v389 = v0.readBuffer(v382, v384);
                v387 = v388;
                v384 = v389;
                table.insert(v383.options, v2.UIFlexModeProp_ConditionalOption.decode(v387));
            else
                v387 = nil;
                v388, v389 = v0.readVarInt(v382, v384);
                v384 = v389 + v388;
            end;
        elseif v386 == v0.wireTypes.i32 then
            v387 = nil;
            v388, v389 = v0.readFixed32(v382, v384);
            v387 = v388;
            v384 = v389;
        elseif v386 == v0.wireTypes.i64 then
            v387 = nil;
            v388, v389 = v0.readFixed64(v382, v384);
            v387 = v388;
            v384 = v389;
        else
            error("Unsupported wire type: " .. v386);
        end;
    end;
    return v383;
end;
v4.jsonEncode = function(v390) --[[ Line: 3037 ]] --[[ Name: jsonEncode ]]
    local v391 = {};
    if v390.options ~= nil and #v390.options > 0 then
        local v392 = {};
        for _, v394 in v390.options do
            table.insert(v392, v394:jsonEncode());
        end;
        v391.options = v392;
    end;
    return v391;
end;
v4.jsonDecode = function(v395) --[[ Line: 3051 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_14 (copy), v2 (copy)
    local v396 = l_v4_14.new();
    if v395.options ~= nil then
        local v397 = {};
        for _, v399 in v395.options do
            table.insert(v397, v2.UIFlexModeProp_ConditionalOption.jsonDecode(v399));
        end;
        v396.options = v397;
    end;
    return v396;
end;
v4.descriptor = {
    name = "UIFlexModeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.UIFlexModeProp_ConditionalOptions = v4;
v1.default:register(v2.UIFlexModeProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_15 = v4 --[[ copy: 4 -> 20 ]];
v4.new = function(v401) --[[ Line: 3082 ]] --[[ Name: new ]]
    -- upvalues: l_v4_15 (copy)
    return (setmetatable({
        kind = if not (v401 ~= nil) or v401.kind == nil then nil else v401.kind
    }, l_v4_15));
end;
v4.encode = function(v402) --[[ Line: 3088 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v403 = buffer.create(0);
    local v404 = 0;
    if v402.kind ~= nil then
        if v402.kind.type == "literal" then
            local v405, v406 = v0.writeTag(v403, v404, 1, v0.wireTypes.varint);
            v405, v406 = v0.writeVarInt(v405, v406, v2.ScaleType.toNumber(v402.kind.value));
            v403 = v405;
            v404 = v406;
        elseif v402.kind.type == "binding_path" then
            local v407, v408 = v0.writeTag(v403, v404, 2, v0.wireTypes.lengthDelimited);
            v407, v408 = v0.writeString(v407, v408, v402.kind.value);
            v403 = v407;
            v404 = v408;
        elseif v402.kind.type == "conditional" then
            local v409 = v402.kind.value:encode();
            local v410, v411 = v0.writeTag(v403, v404, 3, v0.wireTypes.lengthDelimited);
            v410, v411 = v0.writeBuffer(v410, v411, v409, buffer.len(v409));
            v403 = v410;
            v404 = v411;
        end;
    end;
    local v412 = buffer.create(v404);
    buffer.copy(v412, 0, v403, 0, v404);
    return v412;
end;
v4.decode = function(v413) --[[ Line: 3111 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_15 (copy), v0 (copy), v2 (copy)
    local v414 = l_v4_15.new();
    local v415 = 0;
    while v415 < buffer.len(v413) do
        local v416 = nil;
        local v417 = nil;
        local v418, v419, v420 = v0.readTag(v413, v415);
        v416 = v418;
        v417 = v419;
        v415 = v420;
        if v417 == v0.wireTypes.varint then
            if v416 == 1 then
                v418 = nil;
                v419, v420 = v0.readVarIntI32(v413, v415);
                v418 = v419;
                v415 = v420;
                v414.kind = {
                    type = "literal", 
                    value = v2.ScaleType.fromNumber(v418) or v418
                };
            else
                v418 = nil;
                v419, v420 = v0.readVarInt(v413, v415);
                v418 = v419;
                v415 = v420;
            end;
        elseif v417 == v0.wireTypes.lengthDelimited then
            if v416 == 2 then
                v418 = nil;
                v419, v420 = v0.readBuffer(v413, v415);
                v418 = v419;
                v415 = v420;
                v414.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v418)
                };
            elseif v416 == 3 then
                v418 = nil;
                v419, v420 = v0.readBuffer(v413, v415);
                v418 = v419;
                v415 = v420;
                v414.kind = {
                    type = "conditional", 
                    value = v2.ScaleTypeProp_ConditionalOptions.decode(v418)
                };
            else
                v418 = nil;
                v419, v420 = v0.readVarInt(v413, v415);
                v415 = v420 + v419;
            end;
        elseif v417 == v0.wireTypes.i32 then
            v418 = nil;
            v419, v420 = v0.readFixed32(v413, v415);
            v418 = v419;
            v415 = v420;
        elseif v417 == v0.wireTypes.i64 then
            v418 = nil;
            v419, v420 = v0.readFixed64(v413, v415);
            v418 = v419;
            v415 = v420;
        else
            error("Unsupported wire type: " .. v417);
        end;
    end;
    return v414;
end;
v4.jsonEncode = function(v421) --[[ Line: 3168 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v422 = {};
    if v421.kind ~= nil then
        if v421.kind.type == "literal" then
            v422.literal = if typeof(v421.kind.value) == "number" then v421.kind.value else v2.ScaleType.toNumber(v421.kind.value);
            return v422;
        elseif v421.kind.type == "binding_path" then
            v422.bindingPath = v421.kind.value;
            return v422;
        elseif v421.kind.type == "conditional" then
            v422.conditional = v421.kind.value:jsonEncode();
        end;
    end;
    return v422;
end;
v4.jsonDecode = function(v423) --[[ Line: 3186 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_15 (copy), v2 (copy)
    local v424 = l_v4_15.new();
    if v423.literal ~= nil then
        v424.kind = {
            type = "literal", 
            value = if typeof(v423.literal) == "number" then v2.ScaleType.fromNumber(v423.literal) or v423.literal else v2.ScaleType.fromName(v423.literal) or v423.literal
        };
    end;
    if v423.binding_path ~= nil then
        v424.kind = {
            type = "binding_path", 
            value = v423.binding_path
        };
    end;
    if v423.bindingPath ~= nil then
        v424.kind = {
            type = "binding_path", 
            value = v423.bindingPath
        };
    end;
    if v423.conditional ~= nil then
        v424.kind = {
            type = "conditional", 
            value = v2.ScaleTypeProp_ConditionalOptions.jsonDecode(v423.conditional)
        };
    end;
    return v424;
end;
v4.descriptor = {
    name = "ScaleTypeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ScaleTypeProp"
};
v2.ScaleTypeProp = v4;
v1.default:register(v2.ScaleTypeProp);
v4 = {};
v4.__index = v4;
local l_v4_16 = v4 --[[ copy: 4 -> 21 ]];
v4.new = function(v426) --[[ Line: 3230 ]] --[[ Name: new ]]
    -- upvalues: l_v4_16 (copy)
    return (setmetatable({
        condition = if not (v426 ~= nil) or v426.condition == nil then nil else v426.condition, 
        kind = if not (v426 ~= nil) or v426.kind == nil then nil else v426.kind
    }, l_v4_16));
end;
v4.encode = function(v427) --[[ Line: 3239 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v428 = buffer.create(0);
    local v429 = 0;
    if v427.condition ~= nil then
        local v430 = v427.condition:encode();
        local v431, v432 = v0.writeTag(v428, v429, 1, v0.wireTypes.lengthDelimited);
        v431, v432 = v0.writeBuffer(v431, v432, v430, buffer.len(v430));
        v428 = v431;
        v429 = v432;
    end;
    if v427.kind ~= nil then
        if v427.kind.type == "literal" then
            local v433, v434 = v0.writeTag(v428, v429, 2, v0.wireTypes.varint);
            v433, v434 = v0.writeVarInt(v433, v434, v2.ScaleType.toNumber(v427.kind.value));
            v428 = v433;
            v429 = v434;
        elseif v427.kind.type == "binding_path" then
            local v435, v436 = v0.writeTag(v428, v429, 3, v0.wireTypes.lengthDelimited);
            v435, v436 = v0.writeString(v435, v436, v427.kind.value);
            v428 = v435;
            v429 = v436;
        end;
    end;
    local v437 = buffer.create(v429);
    buffer.copy(v437, 0, v428, 0, v429);
    return v437;
end;
v4.decode = function(v438) --[[ Line: 3264 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_16 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v439 = l_v4_16.new();
    local v440 = 0;
    while v440 < buffer.len(v438) do
        local v441 = nil;
        local v442 = nil;
        local v443, v444, v445 = v0.readTag(v438, v440);
        v441 = v443;
        v442 = v444;
        v440 = v445;
        if v442 == v0.wireTypes.varint then
            if v441 == 2 then
                v443 = nil;
                v444, v445 = v0.readVarIntI32(v438, v440);
                v443 = v444;
                v440 = v445;
                v439.kind = {
                    type = "literal", 
                    value = v2.ScaleType.fromNumber(v443) or v443
                };
            else
                v443 = nil;
                v444, v445 = v0.readVarInt(v438, v440);
                v443 = v444;
                v440 = v445;
            end;
        elseif v442 == v0.wireTypes.lengthDelimited then
            if v441 == 1 then
                v443 = nil;
                v444, v445 = v0.readBuffer(v438, v440);
                v443 = v444;
                v440 = v445;
                v439.condition = v3.PropCondition.decode(v443);
            elseif v441 == 3 then
                v443 = nil;
                v444, v445 = v0.readBuffer(v438, v440);
                v443 = v444;
                v440 = v445;
                v439.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v443)
                };
            else
                v443 = nil;
                v444, v445 = v0.readVarInt(v438, v440);
                v440 = v445 + v444;
            end;
        elseif v442 == v0.wireTypes.i32 then
            v443 = nil;
            v444, v445 = v0.readFixed32(v438, v440);
            v443 = v444;
            v440 = v445;
        elseif v442 == v0.wireTypes.i64 then
            v443 = nil;
            v444, v445 = v0.readFixed64(v438, v440);
            v443 = v444;
            v440 = v445;
        else
            error("Unsupported wire type: " .. v442);
        end;
    end;
    return v439;
end;
v4.jsonEncode = function(v446) --[[ Line: 3320 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v447 = {};
    if v446.condition ~= nil then
        v447.condition = v446.condition:jsonEncode();
    end;
    if v446.kind ~= nil then
        if v446.kind.type == "literal" then
            v447.literal = if typeof(v446.kind.value) == "number" then v446.kind.value else v2.ScaleType.toNumber(v446.kind.value);
            return v447;
        elseif v446.kind.type == "binding_path" then
            v447.bindingPath = v446.kind.value;
        end;
    end;
    return v447;
end;
v4.jsonDecode = function(v448) --[[ Line: 3340 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_16 (copy), v3 (copy), v2 (copy)
    local v449 = l_v4_16.new();
    if v448.condition ~= nil then
        v449.condition = v3.PropCondition.jsonDecode(v448.condition);
    end;
    if v448.literal ~= nil then
        v449.kind = {
            type = "literal", 
            value = if typeof(v448.literal) == "number" then v2.ScaleType.fromNumber(v448.literal) or v448.literal else v2.ScaleType.fromName(v448.literal) or v448.literal
        };
    end;
    if v448.binding_path ~= nil then
        v449.kind = {
            type = "binding_path", 
            value = v448.binding_path
        };
    end;
    if v448.bindingPath ~= nil then
        v449.kind = {
            type = "binding_path", 
            value = v448.bindingPath
        };
    end;
    return v449;
end;
v4.descriptor = {
    name = "ScaleTypeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ScaleTypeProp_ConditionalOption = v4;
v1.default:register(v2.ScaleTypeProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_17 = v4 --[[ copy: 4 -> 22 ]];
v4.new = function(v451) --[[ Line: 3382 ]] --[[ Name: new ]]
    -- upvalues: l_v4_17 (copy)
    return (setmetatable({
        options = if not (v451 ~= nil) or v451.options == nil then {} else v451.options
    }, l_v4_17));
end;
v4.encode = function(v452) --[[ Line: 3390 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v453 = buffer.create(0);
    local v454 = 0;
    if v452.options ~= nil and #v452.options > 0 then
        for _, v456 in v452.options do
            local v457 = v456:encode();
            local v458, v459 = v0.writeTag(v453, v454, 1, v0.wireTypes.lengthDelimited);
            v458, v459 = v0.writeBuffer(v458, v459, v457, buffer.len(v457));
            v453 = v458;
            v454 = v459;
        end;
    end;
    local v460 = buffer.create(v454);
    buffer.copy(v460, 0, v453, 0, v454);
    return v460;
end;
v4.decode = function(v461) --[[ Line: 3407 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_17 (copy), v0 (copy), v2 (copy)
    local v462 = l_v4_17.new();
    local v463 = 0;
    while v463 < buffer.len(v461) do
        local v464 = nil;
        local v465 = nil;
        local v466, v467, v468 = v0.readTag(v461, v463);
        v464 = v466;
        v465 = v467;
        v463 = v468;
        if v465 == v0.wireTypes.varint then
            v466 = nil;
            v467, v468 = v0.readVarInt(v461, v463);
            v466 = v467;
            v463 = v468;
        elseif v465 == v0.wireTypes.lengthDelimited then
            if v464 == 1 then
                v466 = nil;
                v467, v468 = v0.readBuffer(v461, v463);
                v466 = v467;
                v463 = v468;
                table.insert(v462.options, v2.ScaleTypeProp_ConditionalOption.decode(v466));
            else
                v466 = nil;
                v467, v468 = v0.readVarInt(v461, v463);
                v463 = v468 + v467;
            end;
        elseif v465 == v0.wireTypes.i32 then
            v466 = nil;
            v467, v468 = v0.readFixed32(v461, v463);
            v466 = v467;
            v463 = v468;
        elseif v465 == v0.wireTypes.i64 then
            v466 = nil;
            v467, v468 = v0.readFixed64(v461, v463);
            v466 = v467;
            v463 = v468;
        else
            error("Unsupported wire type: " .. v465);
        end;
    end;
    return v462;
end;
v4.jsonEncode = function(v469) --[[ Line: 3450 ]] --[[ Name: jsonEncode ]]
    local v470 = {};
    if v469.options ~= nil and #v469.options > 0 then
        local v471 = {};
        for _, v473 in v469.options do
            table.insert(v471, v473:jsonEncode());
        end;
        v470.options = v471;
    end;
    return v470;
end;
v4.jsonDecode = function(v474) --[[ Line: 3464 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_17 (copy), v2 (copy)
    local v475 = l_v4_17.new();
    if v474.options ~= nil then
        local v476 = {};
        for _, v478 in v474.options do
            table.insert(v476, v2.ScaleTypeProp_ConditionalOption.jsonDecode(v478));
        end;
        v475.options = v476;
    end;
    return v475;
end;
v4.descriptor = {
    name = "ScaleTypeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ScaleTypeProp_ConditionalOptions = v4;
v1.default:register(v2.ScaleTypeProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_18 = v4 --[[ copy: 4 -> 23 ]];
v4.new = function(v480) --[[ Line: 3495 ]] --[[ Name: new ]]
    -- upvalues: l_v4_18 (copy)
    return (setmetatable({
        kind = if not (v480 ~= nil) or v480.kind == nil then nil else v480.kind
    }, l_v4_18));
end;
v4.encode = function(v481) --[[ Line: 3501 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v482 = buffer.create(0);
    local v483 = 0;
    if v481.kind ~= nil then
        if v481.kind.type == "literal" then
            local v484, v485 = v0.writeTag(v482, v483, 1, v0.wireTypes.varint);
            v484, v485 = v0.writeVarInt(v484, v485, v2.ResamplerMode.toNumber(v481.kind.value));
            v482 = v484;
            v483 = v485;
        elseif v481.kind.type == "binding_path" then
            local v486, v487 = v0.writeTag(v482, v483, 2, v0.wireTypes.lengthDelimited);
            v486, v487 = v0.writeString(v486, v487, v481.kind.value);
            v482 = v486;
            v483 = v487;
        elseif v481.kind.type == "conditional" then
            local v488 = v481.kind.value:encode();
            local v489, v490 = v0.writeTag(v482, v483, 3, v0.wireTypes.lengthDelimited);
            v489, v490 = v0.writeBuffer(v489, v490, v488, buffer.len(v488));
            v482 = v489;
            v483 = v490;
        end;
    end;
    local v491 = buffer.create(v483);
    buffer.copy(v491, 0, v482, 0, v483);
    return v491;
end;
v4.decode = function(v492) --[[ Line: 3525 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_18 (copy), v0 (copy), v2 (copy)
    local v493 = l_v4_18.new();
    local v494 = 0;
    while v494 < buffer.len(v492) do
        local v495 = nil;
        local v496 = nil;
        local v497, v498, v499 = v0.readTag(v492, v494);
        v495 = v497;
        v496 = v498;
        v494 = v499;
        if v496 == v0.wireTypes.varint then
            if v495 == 1 then
                v497 = nil;
                v498, v499 = v0.readVarIntI32(v492, v494);
                v497 = v498;
                v494 = v499;
                v493.kind = {
                    type = "literal", 
                    value = v2.ResamplerMode.fromNumber(v497) or v497
                };
            else
                v497 = nil;
                v498, v499 = v0.readVarInt(v492, v494);
                v497 = v498;
                v494 = v499;
            end;
        elseif v496 == v0.wireTypes.lengthDelimited then
            if v495 == 2 then
                v497 = nil;
                v498, v499 = v0.readBuffer(v492, v494);
                v497 = v498;
                v494 = v499;
                v493.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v497)
                };
            elseif v495 == 3 then
                v497 = nil;
                v498, v499 = v0.readBuffer(v492, v494);
                v497 = v498;
                v494 = v499;
                v493.kind = {
                    type = "conditional", 
                    value = v2.ResamplerModeProp_ConditionalOptions.decode(v497)
                };
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
v4.jsonEncode = function(v500) --[[ Line: 3582 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v501 = {};
    if v500.kind ~= nil then
        if v500.kind.type == "literal" then
            v501.literal = if typeof(v500.kind.value) == "number" then v500.kind.value else v2.ResamplerMode.toNumber(v500.kind.value);
            return v501;
        elseif v500.kind.type == "binding_path" then
            v501.bindingPath = v500.kind.value;
            return v501;
        elseif v500.kind.type == "conditional" then
            v501.conditional = v500.kind.value:jsonEncode();
        end;
    end;
    return v501;
end;
v4.jsonDecode = function(v502) --[[ Line: 3600 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_18 (copy), v2 (copy)
    local v503 = l_v4_18.new();
    if v502.literal ~= nil then
        v503.kind = {
            type = "literal", 
            value = if typeof(v502.literal) == "number" then v2.ResamplerMode.fromNumber(v502.literal) or v502.literal else v2.ResamplerMode.fromName(v502.literal) or v502.literal
        };
    end;
    if v502.binding_path ~= nil then
        v503.kind = {
            type = "binding_path", 
            value = v502.binding_path
        };
    end;
    if v502.bindingPath ~= nil then
        v503.kind = {
            type = "binding_path", 
            value = v502.bindingPath
        };
    end;
    if v502.conditional ~= nil then
        v503.kind = {
            type = "conditional", 
            value = v2.ResamplerModeProp_ConditionalOptions.jsonDecode(v502.conditional)
        };
    end;
    return v503;
end;
v4.descriptor = {
    name = "ResamplerModeProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ResamplerModeProp"
};
v2.ResamplerModeProp = v4;
v1.default:register(v2.ResamplerModeProp);
v4 = {};
v4.__index = v4;
local l_v4_19 = v4 --[[ copy: 4 -> 24 ]];
v4.new = function(v505) --[[ Line: 3644 ]] --[[ Name: new ]]
    -- upvalues: l_v4_19 (copy)
    return (setmetatable({
        condition = if not (v505 ~= nil) or v505.condition == nil then nil else v505.condition, 
        kind = if not (v505 ~= nil) or v505.kind == nil then nil else v505.kind
    }, l_v4_19));
end;
v4.encode = function(v506) --[[ Line: 3653 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v507 = buffer.create(0);
    local v508 = 0;
    if v506.condition ~= nil then
        local v509 = v506.condition:encode();
        local v510, v511 = v0.writeTag(v507, v508, 1, v0.wireTypes.lengthDelimited);
        v510, v511 = v0.writeBuffer(v510, v511, v509, buffer.len(v509));
        v507 = v510;
        v508 = v511;
    end;
    if v506.kind ~= nil then
        if v506.kind.type == "literal" then
            local v512, v513 = v0.writeTag(v507, v508, 2, v0.wireTypes.varint);
            v512, v513 = v0.writeVarInt(v512, v513, v2.ResamplerMode.toNumber(v506.kind.value));
            v507 = v512;
            v508 = v513;
        elseif v506.kind.type == "binding_path" then
            local v514, v515 = v0.writeTag(v507, v508, 3, v0.wireTypes.lengthDelimited);
            v514, v515 = v0.writeString(v514, v515, v506.kind.value);
            v507 = v514;
            v508 = v515;
        end;
    end;
    local v516 = buffer.create(v508);
    buffer.copy(v516, 0, v507, 0, v508);
    return v516;
end;
v4.decode = function(v517) --[[ Line: 3679 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_19 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v518 = l_v4_19.new();
    local v519 = 0;
    while v519 < buffer.len(v517) do
        local v520 = nil;
        local v521 = nil;
        local v522, v523, v524 = v0.readTag(v517, v519);
        v520 = v522;
        v521 = v523;
        v519 = v524;
        if v521 == v0.wireTypes.varint then
            if v520 == 2 then
                v522 = nil;
                v523, v524 = v0.readVarIntI32(v517, v519);
                v522 = v523;
                v519 = v524;
                v518.kind = {
                    type = "literal", 
                    value = v2.ResamplerMode.fromNumber(v522) or v522
                };
            else
                v522 = nil;
                v523, v524 = v0.readVarInt(v517, v519);
                v522 = v523;
                v519 = v524;
            end;
        elseif v521 == v0.wireTypes.lengthDelimited then
            if v520 == 1 then
                v522 = nil;
                v523, v524 = v0.readBuffer(v517, v519);
                v522 = v523;
                v519 = v524;
                v518.condition = v3.PropCondition.decode(v522);
            elseif v520 == 3 then
                v522 = nil;
                v523, v524 = v0.readBuffer(v517, v519);
                v522 = v523;
                v519 = v524;
                v518.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v522)
                };
            else
                v522 = nil;
                v523, v524 = v0.readVarInt(v517, v519);
                v519 = v524 + v523;
            end;
        elseif v521 == v0.wireTypes.i32 then
            v522 = nil;
            v523, v524 = v0.readFixed32(v517, v519);
            v522 = v523;
            v519 = v524;
        elseif v521 == v0.wireTypes.i64 then
            v522 = nil;
            v523, v524 = v0.readFixed64(v517, v519);
            v522 = v523;
            v519 = v524;
        else
            error("Unsupported wire type: " .. v521);
        end;
    end;
    return v518;
end;
v4.jsonEncode = function(v525) --[[ Line: 3735 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v526 = {};
    if v525.condition ~= nil then
        v526.condition = v525.condition:jsonEncode();
    end;
    if v525.kind ~= nil then
        if v525.kind.type == "literal" then
            v526.literal = if typeof(v525.kind.value) == "number" then v525.kind.value else v2.ResamplerMode.toNumber(v525.kind.value);
            return v526;
        elseif v525.kind.type == "binding_path" then
            v526.bindingPath = v525.kind.value;
        end;
    end;
    return v526;
end;
v4.jsonDecode = function(v527) --[[ Line: 3755 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_19 (copy), v3 (copy), v2 (copy)
    local v528 = l_v4_19.new();
    if v527.condition ~= nil then
        v528.condition = v3.PropCondition.jsonDecode(v527.condition);
    end;
    if v527.literal ~= nil then
        v528.kind = {
            type = "literal", 
            value = if typeof(v527.literal) == "number" then v2.ResamplerMode.fromNumber(v527.literal) or v527.literal else v2.ResamplerMode.fromName(v527.literal) or v527.literal
        };
    end;
    if v527.binding_path ~= nil then
        v528.kind = {
            type = "binding_path", 
            value = v527.binding_path
        };
    end;
    if v527.bindingPath ~= nil then
        v528.kind = {
            type = "binding_path", 
            value = v527.bindingPath
        };
    end;
    return v528;
end;
v4.descriptor = {
    name = "ResamplerModeProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ResamplerModeProp_ConditionalOption = v4;
v1.default:register(v2.ResamplerModeProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_20 = v4 --[[ copy: 4 -> 25 ]];
v4.new = function(v530) --[[ Line: 3799 ]] --[[ Name: new ]]
    -- upvalues: l_v4_20 (copy)
    return (setmetatable({
        options = if not (v530 ~= nil) or v530.options == nil then {} else v530.options
    }, l_v4_20));
end;
v4.encode = function(v531) --[[ Line: 3807 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v532 = buffer.create(0);
    local v533 = 0;
    if v531.options ~= nil and #v531.options > 0 then
        for _, v535 in v531.options do
            local v536 = v535:encode();
            local v537, v538 = v0.writeTag(v532, v533, 1, v0.wireTypes.lengthDelimited);
            v537, v538 = v0.writeBuffer(v537, v538, v536, buffer.len(v536));
            v532 = v537;
            v533 = v538;
        end;
    end;
    local v539 = buffer.create(v533);
    buffer.copy(v539, 0, v532, 0, v533);
    return v539;
end;
v4.decode = function(v540) --[[ Line: 3824 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_20 (copy), v0 (copy), v2 (copy)
    local v541 = l_v4_20.new();
    local v542 = 0;
    while v542 < buffer.len(v540) do
        local v543 = nil;
        local v544 = nil;
        local v545, v546, v547 = v0.readTag(v540, v542);
        v543 = v545;
        v544 = v546;
        v542 = v547;
        if v544 == v0.wireTypes.varint then
            v545 = nil;
            v546, v547 = v0.readVarInt(v540, v542);
            v545 = v546;
            v542 = v547;
        elseif v544 == v0.wireTypes.lengthDelimited then
            if v543 == 1 then
                v545 = nil;
                v546, v547 = v0.readBuffer(v540, v542);
                v545 = v546;
                v542 = v547;
                table.insert(v541.options, v2.ResamplerModeProp_ConditionalOption.decode(v545));
            else
                v545 = nil;
                v546, v547 = v0.readVarInt(v540, v542);
                v542 = v547 + v546;
            end;
        elseif v544 == v0.wireTypes.i32 then
            v545 = nil;
            v546, v547 = v0.readFixed32(v540, v542);
            v545 = v546;
            v542 = v547;
        elseif v544 == v0.wireTypes.i64 then
            v545 = nil;
            v546, v547 = v0.readFixed64(v540, v542);
            v545 = v546;
            v542 = v547;
        else
            error("Unsupported wire type: " .. v544);
        end;
    end;
    return v541;
end;
v4.jsonEncode = function(v548) --[[ Line: 3867 ]] --[[ Name: jsonEncode ]]
    local v549 = {};
    if v548.options ~= nil and #v548.options > 0 then
        local v550 = {};
        for _, v552 in v548.options do
            table.insert(v550, v552:jsonEncode());
        end;
        v549.options = v550;
    end;
    return v549;
end;
v4.jsonDecode = function(v553) --[[ Line: 3881 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_20 (copy), v2 (copy)
    local v554 = l_v4_20.new();
    if v553.options ~= nil then
        local v555 = {};
        for _, v557 in v553.options do
            table.insert(v555, v2.ResamplerModeProp_ConditionalOption.jsonDecode(v557));
        end;
        v554.options = v555;
    end;
    return v554;
end;
v4.descriptor = {
    name = "ResamplerModeProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ResamplerModeProp_ConditionalOptions = v4;
v1.default:register(v2.ResamplerModeProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_21 = v4 --[[ copy: 4 -> 26 ]];
v4.new = function(v559) --[[ Line: 3912 ]] --[[ Name: new ]]
    -- upvalues: l_v4_21 (copy)
    return (setmetatable({
        kind = if not (v559 ~= nil) or v559.kind == nil then nil else v559.kind
    }, l_v4_21));
end;
v4.encode = function(v560) --[[ Line: 3918 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v561 = buffer.create(0);
    local v562 = 0;
    if v560.kind ~= nil then
        if v560.kind.type == "literal" then
            local v563, v564 = v0.writeTag(v561, v562, 1, v0.wireTypes.varint);
            v563, v564 = v0.writeVarInt(v563, v564, v2.SizeConstraint.toNumber(v560.kind.value));
            v561 = v563;
            v562 = v564;
        elseif v560.kind.type == "binding_path" then
            local v565, v566 = v0.writeTag(v561, v562, 2, v0.wireTypes.lengthDelimited);
            v565, v566 = v0.writeString(v565, v566, v560.kind.value);
            v561 = v565;
            v562 = v566;
        elseif v560.kind.type == "conditional" then
            local v567 = v560.kind.value:encode();
            local v568, v569 = v0.writeTag(v561, v562, 3, v0.wireTypes.lengthDelimited);
            v568, v569 = v0.writeBuffer(v568, v569, v567, buffer.len(v567));
            v561 = v568;
            v562 = v569;
        end;
    end;
    local v570 = buffer.create(v562);
    buffer.copy(v570, 0, v561, 0, v562);
    return v570;
end;
v4.decode = function(v571) --[[ Line: 3942 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_21 (copy), v0 (copy), v2 (copy)
    local v572 = l_v4_21.new();
    local v573 = 0;
    while v573 < buffer.len(v571) do
        local v574 = nil;
        local v575 = nil;
        local v576, v577, v578 = v0.readTag(v571, v573);
        v574 = v576;
        v575 = v577;
        v573 = v578;
        if v575 == v0.wireTypes.varint then
            if v574 == 1 then
                v576 = nil;
                v577, v578 = v0.readVarIntI32(v571, v573);
                v576 = v577;
                v573 = v578;
                v572.kind = {
                    type = "literal", 
                    value = v2.SizeConstraint.fromNumber(v576) or v576
                };
            else
                v576 = nil;
                v577, v578 = v0.readVarInt(v571, v573);
                v576 = v577;
                v573 = v578;
            end;
        elseif v575 == v0.wireTypes.lengthDelimited then
            if v574 == 2 then
                v576 = nil;
                v577, v578 = v0.readBuffer(v571, v573);
                v576 = v577;
                v573 = v578;
                v572.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v576)
                };
            elseif v574 == 3 then
                v576 = nil;
                v577, v578 = v0.readBuffer(v571, v573);
                v576 = v577;
                v573 = v578;
                v572.kind = {
                    type = "conditional", 
                    value = v2.SizeConstraintProp_ConditionalOptions.decode(v576)
                };
            else
                v576 = nil;
                v577, v578 = v0.readVarInt(v571, v573);
                v573 = v578 + v577;
            end;
        elseif v575 == v0.wireTypes.i32 then
            v576 = nil;
            v577, v578 = v0.readFixed32(v571, v573);
            v576 = v577;
            v573 = v578;
        elseif v575 == v0.wireTypes.i64 then
            v576 = nil;
            v577, v578 = v0.readFixed64(v571, v573);
            v576 = v577;
            v573 = v578;
        else
            error("Unsupported wire type: " .. v575);
        end;
    end;
    return v572;
end;
v4.jsonEncode = function(v579) --[[ Line: 3999 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v580 = {};
    if v579.kind ~= nil then
        if v579.kind.type == "literal" then
            v580.literal = if typeof(v579.kind.value) == "number" then v579.kind.value else v2.SizeConstraint.toNumber(v579.kind.value);
            return v580;
        elseif v579.kind.type == "binding_path" then
            v580.bindingPath = v579.kind.value;
            return v580;
        elseif v579.kind.type == "conditional" then
            v580.conditional = v579.kind.value:jsonEncode();
        end;
    end;
    return v580;
end;
v4.jsonDecode = function(v581) --[[ Line: 4017 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_21 (copy), v2 (copy)
    local v582 = l_v4_21.new();
    if v581.literal ~= nil then
        v582.kind = {
            type = "literal", 
            value = if typeof(v581.literal) == "number" then v2.SizeConstraint.fromNumber(v581.literal) or v581.literal else v2.SizeConstraint.fromName(v581.literal) or v581.literal
        };
    end;
    if v581.binding_path ~= nil then
        v582.kind = {
            type = "binding_path", 
            value = v581.binding_path
        };
    end;
    if v581.bindingPath ~= nil then
        v582.kind = {
            type = "binding_path", 
            value = v581.bindingPath
        };
    end;
    if v581.conditional ~= nil then
        v582.kind = {
            type = "conditional", 
            value = v2.SizeConstraintProp_ConditionalOptions.jsonDecode(v581.conditional)
        };
    end;
    return v582;
end;
v4.descriptor = {
    name = "SizeConstraintProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SizeConstraintProp"
};
v2.SizeConstraintProp = v4;
v1.default:register(v2.SizeConstraintProp);
v4 = {};
v4.__index = v4;
local l_v4_22 = v4 --[[ copy: 4 -> 27 ]];
v4.new = function(v584) --[[ Line: 4061 ]] --[[ Name: new ]]
    -- upvalues: l_v4_22 (copy)
    return (setmetatable({
        condition = if not (v584 ~= nil) or v584.condition == nil then nil else v584.condition, 
        kind = if not (v584 ~= nil) or v584.kind == nil then nil else v584.kind
    }, l_v4_22));
end;
v4.encode = function(v585) --[[ Line: 4070 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v586 = buffer.create(0);
    local v587 = 0;
    if v585.condition ~= nil then
        local v588 = v585.condition:encode();
        local v589, v590 = v0.writeTag(v586, v587, 1, v0.wireTypes.lengthDelimited);
        v589, v590 = v0.writeBuffer(v589, v590, v588, buffer.len(v588));
        v586 = v589;
        v587 = v590;
    end;
    if v585.kind ~= nil then
        if v585.kind.type == "literal" then
            local v591, v592 = v0.writeTag(v586, v587, 2, v0.wireTypes.varint);
            v591, v592 = v0.writeVarInt(v591, v592, v2.SizeConstraint.toNumber(v585.kind.value));
            v586 = v591;
            v587 = v592;
        elseif v585.kind.type == "binding_path" then
            local v593, v594 = v0.writeTag(v586, v587, 3, v0.wireTypes.lengthDelimited);
            v593, v594 = v0.writeString(v593, v594, v585.kind.value);
            v586 = v593;
            v587 = v594;
        end;
    end;
    local v595 = buffer.create(v587);
    buffer.copy(v595, 0, v586, 0, v587);
    return v595;
end;
v4.decode = function(v596) --[[ Line: 4096 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_22 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v597 = l_v4_22.new();
    local v598 = 0;
    while v598 < buffer.len(v596) do
        local v599 = nil;
        local v600 = nil;
        local v601, v602, v603 = v0.readTag(v596, v598);
        v599 = v601;
        v600 = v602;
        v598 = v603;
        if v600 == v0.wireTypes.varint then
            if v599 == 2 then
                v601 = nil;
                v602, v603 = v0.readVarIntI32(v596, v598);
                v601 = v602;
                v598 = v603;
                v597.kind = {
                    type = "literal", 
                    value = v2.SizeConstraint.fromNumber(v601) or v601
                };
            else
                v601 = nil;
                v602, v603 = v0.readVarInt(v596, v598);
                v601 = v602;
                v598 = v603;
            end;
        elseif v600 == v0.wireTypes.lengthDelimited then
            if v599 == 1 then
                v601 = nil;
                v602, v603 = v0.readBuffer(v596, v598);
                v601 = v602;
                v598 = v603;
                v597.condition = v3.PropCondition.decode(v601);
            elseif v599 == 3 then
                v601 = nil;
                v602, v603 = v0.readBuffer(v596, v598);
                v601 = v602;
                v598 = v603;
                v597.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v601)
                };
            else
                v601 = nil;
                v602, v603 = v0.readVarInt(v596, v598);
                v598 = v603 + v602;
            end;
        elseif v600 == v0.wireTypes.i32 then
            v601 = nil;
            v602, v603 = v0.readFixed32(v596, v598);
            v601 = v602;
            v598 = v603;
        elseif v600 == v0.wireTypes.i64 then
            v601 = nil;
            v602, v603 = v0.readFixed64(v596, v598);
            v601 = v602;
            v598 = v603;
        else
            error("Unsupported wire type: " .. v600);
        end;
    end;
    return v597;
end;
v4.jsonEncode = function(v604) --[[ Line: 4152 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v605 = {};
    if v604.condition ~= nil then
        v605.condition = v604.condition:jsonEncode();
    end;
    if v604.kind ~= nil then
        if v604.kind.type == "literal" then
            v605.literal = if typeof(v604.kind.value) == "number" then v604.kind.value else v2.SizeConstraint.toNumber(v604.kind.value);
            return v605;
        elseif v604.kind.type == "binding_path" then
            v605.bindingPath = v604.kind.value;
        end;
    end;
    return v605;
end;
v4.jsonDecode = function(v606) --[[ Line: 4172 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_22 (copy), v3 (copy), v2 (copy)
    local v607 = l_v4_22.new();
    if v606.condition ~= nil then
        v607.condition = v3.PropCondition.jsonDecode(v606.condition);
    end;
    if v606.literal ~= nil then
        v607.kind = {
            type = "literal", 
            value = if typeof(v606.literal) == "number" then v2.SizeConstraint.fromNumber(v606.literal) or v606.literal else v2.SizeConstraint.fromName(v606.literal) or v606.literal
        };
    end;
    if v606.binding_path ~= nil then
        v607.kind = {
            type = "binding_path", 
            value = v606.binding_path
        };
    end;
    if v606.bindingPath ~= nil then
        v607.kind = {
            type = "binding_path", 
            value = v606.bindingPath
        };
    end;
    return v607;
end;
v4.descriptor = {
    name = "SizeConstraintProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.SizeConstraintProp_ConditionalOption = v4;
v1.default:register(v2.SizeConstraintProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_23 = v4 --[[ copy: 4 -> 28 ]];
v4.new = function(v609) --[[ Line: 4216 ]] --[[ Name: new ]]
    -- upvalues: l_v4_23 (copy)
    return (setmetatable({
        options = if not (v609 ~= nil) or v609.options == nil then {} else v609.options
    }, l_v4_23));
end;
v4.encode = function(v610) --[[ Line: 4224 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v611 = buffer.create(0);
    local v612 = 0;
    if v610.options ~= nil and #v610.options > 0 then
        for _, v614 in v610.options do
            local v615 = v614:encode();
            local v616, v617 = v0.writeTag(v611, v612, 1, v0.wireTypes.lengthDelimited);
            v616, v617 = v0.writeBuffer(v616, v617, v615, buffer.len(v615));
            v611 = v616;
            v612 = v617;
        end;
    end;
    local v618 = buffer.create(v612);
    buffer.copy(v618, 0, v611, 0, v612);
    return v618;
end;
v4.decode = function(v619) --[[ Line: 4241 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_23 (copy), v0 (copy), v2 (copy)
    local v620 = l_v4_23.new();
    local v621 = 0;
    while v621 < buffer.len(v619) do
        local v622 = nil;
        local v623 = nil;
        local v624, v625, v626 = v0.readTag(v619, v621);
        v622 = v624;
        v623 = v625;
        v621 = v626;
        if v623 == v0.wireTypes.varint then
            v624 = nil;
            v625, v626 = v0.readVarInt(v619, v621);
            v624 = v625;
            v621 = v626;
        elseif v623 == v0.wireTypes.lengthDelimited then
            if v622 == 1 then
                v624 = nil;
                v625, v626 = v0.readBuffer(v619, v621);
                v624 = v625;
                v621 = v626;
                table.insert(v620.options, v2.SizeConstraintProp_ConditionalOption.decode(v624));
            else
                v624 = nil;
                v625, v626 = v0.readVarInt(v619, v621);
                v621 = v626 + v625;
            end;
        elseif v623 == v0.wireTypes.i32 then
            v624 = nil;
            v625, v626 = v0.readFixed32(v619, v621);
            v624 = v625;
            v621 = v626;
        elseif v623 == v0.wireTypes.i64 then
            v624 = nil;
            v625, v626 = v0.readFixed64(v619, v621);
            v624 = v625;
            v621 = v626;
        else
            error("Unsupported wire type: " .. v623);
        end;
    end;
    return v620;
end;
v4.jsonEncode = function(v627) --[[ Line: 4284 ]] --[[ Name: jsonEncode ]]
    local v628 = {};
    if v627.options ~= nil and #v627.options > 0 then
        local v629 = {};
        for _, v631 in v627.options do
            table.insert(v629, v631:jsonEncode());
        end;
        v628.options = v629;
    end;
    return v628;
end;
v4.jsonDecode = function(v632) --[[ Line: 4298 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_23 (copy), v2 (copy)
    local v633 = l_v4_23.new();
    if v632.options ~= nil then
        local v634 = {};
        for _, v636 in v632.options do
            table.insert(v634, v2.SizeConstraintProp_ConditionalOption.jsonDecode(v636));
        end;
        v633.options = v634;
    end;
    return v633;
end;
v4.descriptor = {
    name = "SizeConstraintProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.SizeConstraintProp_ConditionalOptions = v4;
v1.default:register(v2.SizeConstraintProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_24 = v4 --[[ copy: 4 -> 29 ]];
v4.new = function(v638) --[[ Line: 4329 ]] --[[ Name: new ]]
    -- upvalues: l_v4_24 (copy)
    return (setmetatable({
        kind = if not (v638 ~= nil) or v638.kind == nil then nil else v638.kind
    }, l_v4_24));
end;
v4.encode = function(v639) --[[ Line: 4335 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v640 = buffer.create(0);
    local v641 = 0;
    if v639.kind ~= nil then
        if v639.kind.type == "literal" then
            local v642, v643 = v0.writeTag(v640, v641, 1, v0.wireTypes.varint);
            v642, v643 = v0.writeVarInt(v642, v643, v2.HorizontalAlignment.toNumber(v639.kind.value));
            v640 = v642;
            v641 = v643;
        elseif v639.kind.type == "binding_path" then
            local v644, v645 = v0.writeTag(v640, v641, 2, v0.wireTypes.lengthDelimited);
            v644, v645 = v0.writeString(v644, v645, v639.kind.value);
            v640 = v644;
            v641 = v645;
        elseif v639.kind.type == "conditional" then
            local v646 = v639.kind.value:encode();
            local v647, v648 = v0.writeTag(v640, v641, 3, v0.wireTypes.lengthDelimited);
            v647, v648 = v0.writeBuffer(v647, v648, v646, buffer.len(v646));
            v640 = v647;
            v641 = v648;
        end;
    end;
    local v649 = buffer.create(v641);
    buffer.copy(v649, 0, v640, 0, v641);
    return v649;
end;
v4.decode = function(v650) --[[ Line: 4359 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_24 (copy), v0 (copy), v2 (copy)
    local v651 = l_v4_24.new();
    local v652 = 0;
    while v652 < buffer.len(v650) do
        local v653 = nil;
        local v654 = nil;
        local v655, v656, v657 = v0.readTag(v650, v652);
        v653 = v655;
        v654 = v656;
        v652 = v657;
        if v654 == v0.wireTypes.varint then
            if v653 == 1 then
                v655 = nil;
                v656, v657 = v0.readVarIntI32(v650, v652);
                v655 = v656;
                v652 = v657;
                v651.kind = {
                    type = "literal", 
                    value = v2.HorizontalAlignment.fromNumber(v655) or v655
                };
            else
                v655 = nil;
                v656, v657 = v0.readVarInt(v650, v652);
                v655 = v656;
                v652 = v657;
            end;
        elseif v654 == v0.wireTypes.lengthDelimited then
            if v653 == 2 then
                v655 = nil;
                v656, v657 = v0.readBuffer(v650, v652);
                v655 = v656;
                v652 = v657;
                v651.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v655)
                };
            elseif v653 == 3 then
                v655 = nil;
                v656, v657 = v0.readBuffer(v650, v652);
                v655 = v656;
                v652 = v657;
                v651.kind = {
                    type = "conditional", 
                    value = v2.HorizontalAlignmentProp_ConditionalOptions.decode(v655)
                };
            else
                v655 = nil;
                v656, v657 = v0.readVarInt(v650, v652);
                v652 = v657 + v656;
            end;
        elseif v654 == v0.wireTypes.i32 then
            v655 = nil;
            v656, v657 = v0.readFixed32(v650, v652);
            v655 = v656;
            v652 = v657;
        elseif v654 == v0.wireTypes.i64 then
            v655 = nil;
            v656, v657 = v0.readFixed64(v650, v652);
            v655 = v656;
            v652 = v657;
        else
            error("Unsupported wire type: " .. v654);
        end;
    end;
    return v651;
end;
v4.jsonEncode = function(v658) --[[ Line: 4418 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v659 = {};
    if v658.kind ~= nil then
        if v658.kind.type == "literal" then
            v659.literal = if typeof(v658.kind.value) == "number" then v658.kind.value else v2.HorizontalAlignment.toNumber(v658.kind.value);
            return v659;
        elseif v658.kind.type == "binding_path" then
            v659.bindingPath = v658.kind.value;
            return v659;
        elseif v658.kind.type == "conditional" then
            v659.conditional = v658.kind.value:jsonEncode();
        end;
    end;
    return v659;
end;
v4.jsonDecode = function(v660) --[[ Line: 4436 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_24 (copy), v2 (copy)
    local v661 = l_v4_24.new();
    if v660.literal ~= nil then
        v661.kind = {
            type = "literal", 
            value = if typeof(v660.literal) == "number" then v2.HorizontalAlignment.fromNumber(v660.literal) or v660.literal else v2.HorizontalAlignment.fromName(v660.literal) or v660.literal
        };
    end;
    if v660.binding_path ~= nil then
        v661.kind = {
            type = "binding_path", 
            value = v660.binding_path
        };
    end;
    if v660.bindingPath ~= nil then
        v661.kind = {
            type = "binding_path", 
            value = v660.bindingPath
        };
    end;
    if v660.conditional ~= nil then
        v661.kind = {
            type = "conditional", 
            value = v2.HorizontalAlignmentProp_ConditionalOptions.jsonDecode(v660.conditional)
        };
    end;
    return v661;
end;
v4.descriptor = {
    name = "HorizontalAlignmentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HorizontalAlignmentProp"
};
v2.HorizontalAlignmentProp = v4;
v1.default:register(v2.HorizontalAlignmentProp);
v4 = {};
v4.__index = v4;
local l_v4_25 = v4 --[[ copy: 4 -> 30 ]];
v4.new = function(v663) --[[ Line: 4480 ]] --[[ Name: new ]]
    -- upvalues: l_v4_25 (copy)
    return (setmetatable({
        condition = if not (v663 ~= nil) or v663.condition == nil then nil else v663.condition, 
        kind = if not (v663 ~= nil) or v663.kind == nil then nil else v663.kind
    }, l_v4_25));
end;
v4.encode = function(v664) --[[ Line: 4489 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v665 = buffer.create(0);
    local v666 = 0;
    if v664.condition ~= nil then
        local v667 = v664.condition:encode();
        local v668, v669 = v0.writeTag(v665, v666, 1, v0.wireTypes.lengthDelimited);
        v668, v669 = v0.writeBuffer(v668, v669, v667, buffer.len(v667));
        v665 = v668;
        v666 = v669;
    end;
    if v664.kind ~= nil then
        if v664.kind.type == "literal" then
            local v670, v671 = v0.writeTag(v665, v666, 2, v0.wireTypes.varint);
            v670, v671 = v0.writeVarInt(v670, v671, v2.HorizontalAlignment.toNumber(v664.kind.value));
            v665 = v670;
            v666 = v671;
        elseif v664.kind.type == "binding_path" then
            local v672, v673 = v0.writeTag(v665, v666, 3, v0.wireTypes.lengthDelimited);
            v672, v673 = v0.writeString(v672, v673, v664.kind.value);
            v665 = v672;
            v666 = v673;
        end;
    end;
    local v674 = buffer.create(v666);
    buffer.copy(v674, 0, v665, 0, v666);
    return v674;
end;
v4.decode = function(v675) --[[ Line: 4517 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_25 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v676 = l_v4_25.new();
    local v677 = 0;
    while v677 < buffer.len(v675) do
        local v678 = nil;
        local v679 = nil;
        local v680, v681, v682 = v0.readTag(v675, v677);
        v678 = v680;
        v679 = v681;
        v677 = v682;
        if v679 == v0.wireTypes.varint then
            if v678 == 2 then
                v680 = nil;
                v681, v682 = v0.readVarIntI32(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.kind = {
                    type = "literal", 
                    value = v2.HorizontalAlignment.fromNumber(v680) or v680
                };
            else
                v680 = nil;
                v681, v682 = v0.readVarInt(v675, v677);
                v680 = v681;
                v677 = v682;
            end;
        elseif v679 == v0.wireTypes.lengthDelimited then
            if v678 == 1 then
                v680 = nil;
                v681, v682 = v0.readBuffer(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.condition = v3.PropCondition.decode(v680);
            elseif v678 == 3 then
                v680 = nil;
                v681, v682 = v0.readBuffer(v675, v677);
                v680 = v681;
                v677 = v682;
                v676.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v680)
                };
            else
                v680 = nil;
                v681, v682 = v0.readVarInt(v675, v677);
                v677 = v682 + v681;
            end;
        elseif v679 == v0.wireTypes.i32 then
            v680 = nil;
            v681, v682 = v0.readFixed32(v675, v677);
            v680 = v681;
            v677 = v682;
        elseif v679 == v0.wireTypes.i64 then
            v680 = nil;
            v681, v682 = v0.readFixed64(v675, v677);
            v680 = v681;
            v677 = v682;
        else
            error("Unsupported wire type: " .. v679);
        end;
    end;
    return v676;
end;
v4.jsonEncode = function(v683) --[[ Line: 4575 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v684 = {};
    if v683.condition ~= nil then
        v684.condition = v683.condition:jsonEncode();
    end;
    if v683.kind ~= nil then
        if v683.kind.type == "literal" then
            v684.literal = if typeof(v683.kind.value) == "number" then v683.kind.value else v2.HorizontalAlignment.toNumber(v683.kind.value);
            return v684;
        elseif v683.kind.type == "binding_path" then
            v684.bindingPath = v683.kind.value;
        end;
    end;
    return v684;
end;
v4.jsonDecode = function(v685) --[[ Line: 4597 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_25 (copy), v3 (copy), v2 (copy)
    local v686 = l_v4_25.new();
    if v685.condition ~= nil then
        v686.condition = v3.PropCondition.jsonDecode(v685.condition);
    end;
    if v685.literal ~= nil then
        v686.kind = {
            type = "literal", 
            value = if typeof(v685.literal) == "number" then v2.HorizontalAlignment.fromNumber(v685.literal) or v685.literal else v2.HorizontalAlignment.fromName(v685.literal) or v685.literal
        };
    end;
    if v685.binding_path ~= nil then
        v686.kind = {
            type = "binding_path", 
            value = v685.binding_path
        };
    end;
    if v685.bindingPath ~= nil then
        v686.kind = {
            type = "binding_path", 
            value = v685.bindingPath
        };
    end;
    return v686;
end;
v4.descriptor = {
    name = "HorizontalAlignmentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.HorizontalAlignmentProp_ConditionalOption = v4;
v1.default:register(v2.HorizontalAlignmentProp_ConditionalOption);
v4 = {};
v4.__index = v4;
local l_v4_26 = v4 --[[ copy: 4 -> 31 ]];
v4.new = function(v688) --[[ Line: 4641 ]] --[[ Name: new ]]
    -- upvalues: l_v4_26 (copy)
    return (setmetatable({
        option = if not (v688 ~= nil) or v688.option == nil then {} else v688.option
    }, l_v4_26));
end;
v4.encode = function(v689) --[[ Line: 4649 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v690 = buffer.create(0);
    local v691 = 0;
    if v689.option ~= nil and #v689.option > 0 then
        for _, v693 in v689.option do
            local v694 = v693:encode();
            local v695, v696 = v0.writeTag(v690, v691, 1, v0.wireTypes.lengthDelimited);
            v695, v696 = v0.writeBuffer(v695, v696, v694, buffer.len(v694));
            v690 = v695;
            v691 = v696;
        end;
    end;
    local v697 = buffer.create(v691);
    buffer.copy(v697, 0, v690, 0, v691);
    return v697;
end;
v4.decode = function(v698) --[[ Line: 4668 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_26 (copy), v0 (copy), v2 (copy)
    local v699 = l_v4_26.new();
    local v700 = 0;
    while v700 < buffer.len(v698) do
        local v701 = nil;
        local v702 = nil;
        local v703, v704, v705 = v0.readTag(v698, v700);
        v701 = v703;
        v702 = v704;
        v700 = v705;
        if v702 == v0.wireTypes.varint then
            v703 = nil;
            v704, v705 = v0.readVarInt(v698, v700);
            v703 = v704;
            v700 = v705;
        elseif v702 == v0.wireTypes.lengthDelimited then
            if v701 == 1 then
                v703 = nil;
                v704, v705 = v0.readBuffer(v698, v700);
                v703 = v704;
                v700 = v705;
                table.insert(v699.option, v2.HorizontalAlignmentProp_ConditionalOption.decode(v703));
            else
                v703 = nil;
                v704, v705 = v0.readVarInt(v698, v700);
                v700 = v705 + v704;
            end;
        elseif v702 == v0.wireTypes.i32 then
            v703 = nil;
            v704, v705 = v0.readFixed32(v698, v700);
            v703 = v704;
            v700 = v705;
        elseif v702 == v0.wireTypes.i64 then
            v703 = nil;
            v704, v705 = v0.readFixed64(v698, v700);
            v703 = v704;
            v700 = v705;
        else
            error("Unsupported wire type: " .. v702);
        end;
    end;
    return v699;
end;
v4.jsonEncode = function(v706) --[[ Line: 4713 ]] --[[ Name: jsonEncode ]]
    local v707 = {};
    if v706.option ~= nil and #v706.option > 0 then
        local v708 = {};
        for _, v710 in v706.option do
            table.insert(v708, v710:jsonEncode());
        end;
        v707.option = v708;
    end;
    return v707;
end;
v4.jsonDecode = function(v711) --[[ Line: 4729 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_26 (copy), v2 (copy)
    local v712 = l_v4_26.new();
    if v711.option ~= nil then
        local v713 = {};
        for _, v715 in v711.option do
            table.insert(v713, v2.HorizontalAlignmentProp_ConditionalOption.jsonDecode(v715));
        end;
        v712.option = v713;
    end;
    return v712;
end;
v4.descriptor = {
    name = "HorizontalAlignmentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.HorizontalAlignmentProp_ConditionalOptions = v4;
v1.default:register(v2.HorizontalAlignmentProp_ConditionalOptions);
v4 = {};
v4.__index = v4;
local l_v4_27 = v4 --[[ copy: 4 -> 32 ]];
v4.new = function(v717) --[[ Line: 4760 ]] --[[ Name: new ]]
    -- upvalues: l_v4_27 (copy)
    return (setmetatable({
        kind = if not (v717 ~= nil) or v717.kind == nil then nil else v717.kind
    }, l_v4_27));
end;
v4.encode = function(v718) --[[ Line: 4766 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v719 = buffer.create(0);
    local v720 = 0;
    if v718.kind ~= nil then
        if v718.kind.type == "literal" then
            local v721, v722 = v0.writeTag(v719, v720, 1, v0.wireTypes.varint);
            v721, v722 = v0.writeVarInt(v721, v722, v2.VerticalAlignment.toNumber(v718.kind.value));
            v719 = v721;
            v720 = v722;
        elseif v718.kind.type == "binding_path" then
            local v723, v724 = v0.writeTag(v719, v720, 2, v0.wireTypes.lengthDelimited);
            v723, v724 = v0.writeString(v723, v724, v718.kind.value);
            v719 = v723;
            v720 = v724;
        elseif v718.kind.type == "conditional" then
            local v725 = v718.kind.value:encode();
            local v726, v727 = v0.writeTag(v719, v720, 3, v0.wireTypes.lengthDelimited);
            v726, v727 = v0.writeBuffer(v726, v727, v725, buffer.len(v725));
            v719 = v726;
            v720 = v727;
        end;
    end;
    local v728 = buffer.create(v720);
    buffer.copy(v728, 0, v719, 0, v720);
    return v728;
end;
v4.decode = function(v729) --[[ Line: 4790 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_27 (copy), v0 (copy), v2 (copy)
    local v730 = l_v4_27.new();
    local v731 = 0;
    while v731 < buffer.len(v729) do
        local v732 = nil;
        local v733 = nil;
        local v734, v735, v736 = v0.readTag(v729, v731);
        v732 = v734;
        v733 = v735;
        v731 = v736;
        if v733 == v0.wireTypes.varint then
            if v732 == 1 then
                v734 = nil;
                v735, v736 = v0.readVarIntI32(v729, v731);
                v734 = v735;
                v731 = v736;
                v730.kind = {
                    type = "literal", 
                    value = v2.VerticalAlignment.fromNumber(v734) or v734
                };
            else
                v734 = nil;
                v735, v736 = v0.readVarInt(v729, v731);
                v734 = v735;
                v731 = v736;
            end;
        elseif v733 == v0.wireTypes.lengthDelimited then
            if v732 == 2 then
                v734 = nil;
                v735, v736 = v0.readBuffer(v729, v731);
                v734 = v735;
                v731 = v736;
                v730.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v734)
                };
            elseif v732 == 3 then
                v734 = nil;
                v735, v736 = v0.readBuffer(v729, v731);
                v734 = v735;
                v731 = v736;
                v730.kind = {
                    type = "conditional", 
                    value = v2.VerticalAlignmentProp_ConditionalOptions.decode(v734)
                };
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
v4.jsonEncode = function(v737) --[[ Line: 4849 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v738 = {};
    if v737.kind ~= nil then
        if v737.kind.type == "literal" then
            v738.literal = if typeof(v737.kind.value) == "number" then v737.kind.value else v2.VerticalAlignment.toNumber(v737.kind.value);
            return v738;
        elseif v737.kind.type == "binding_path" then
            v738.bindingPath = v737.kind.value;
            return v738;
        elseif v737.kind.type == "conditional" then
            v738.conditional = v737.kind.value:jsonEncode();
        end;
    end;
    return v738;
end;
v4.jsonDecode = function(v739) --[[ Line: 4867 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_27 (copy), v2 (copy)
    local v740 = l_v4_27.new();
    if v739.literal ~= nil then
        v740.kind = {
            type = "literal", 
            value = if typeof(v739.literal) == "number" then v2.VerticalAlignment.fromNumber(v739.literal) or v739.literal else v2.VerticalAlignment.fromName(v739.literal) or v739.literal
        };
    end;
    if v739.binding_path ~= nil then
        v740.kind = {
            type = "binding_path", 
            value = v739.binding_path
        };
    end;
    if v739.bindingPath ~= nil then
        v740.kind = {
            type = "binding_path", 
            value = v739.bindingPath
        };
    end;
    if v739.conditional ~= nil then
        v740.kind = {
            type = "conditional", 
            value = v2.VerticalAlignmentProp_ConditionalOptions.jsonDecode(v739.conditional)
        };
    end;
    return v740;
end;
v4.descriptor = {
    name = "VerticalAlignmentProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.VerticalAlignmentProp"
};
v2.VerticalAlignmentProp = v4;
v1.default:register(v2.VerticalAlignmentProp);
v4 = {};
v4.__index = v4;
local l_v4_28 = v4 --[[ copy: 4 -> 33 ]];
v4.new = function(v742) --[[ Line: 4911 ]] --[[ Name: new ]]
    -- upvalues: l_v4_28 (copy)
    return (setmetatable({
        condition = if not (v742 ~= nil) or v742.condition == nil then nil else v742.condition, 
        kind = if not (v742 ~= nil) or v742.kind == nil then nil else v742.kind
    }, l_v4_28));
end;
v4.encode = function(v743) --[[ Line: 4920 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v744 = buffer.create(0);
    local v745 = 0;
    if v743.condition ~= nil then
        local v746 = v743.condition:encode();
        local v747, v748 = v0.writeTag(v744, v745, 1, v0.wireTypes.lengthDelimited);
        v747, v748 = v0.writeBuffer(v747, v748, v746, buffer.len(v746));
        v744 = v747;
        v745 = v748;
    end;
    if v743.kind ~= nil then
        if v743.kind.type == "literal" then
            local v749, v750 = v0.writeTag(v744, v745, 2, v0.wireTypes.varint);
            v749, v750 = v0.writeVarInt(v749, v750, v2.VerticalAlignment.toNumber(v743.kind.value));
            v744 = v749;
            v745 = v750;
        elseif v743.kind.type == "binding_path" then
            local v751, v752 = v0.writeTag(v744, v745, 3, v0.wireTypes.lengthDelimited);
            v751, v752 = v0.writeString(v751, v752, v743.kind.value);
            v744 = v751;
            v745 = v752;
        end;
    end;
    local v753 = buffer.create(v745);
    buffer.copy(v753, 0, v744, 0, v745);
    return v753;
end;
v4.decode = function(v754) --[[ Line: 4946 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_28 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v755 = l_v4_28.new();
    local v756 = 0;
    while v756 < buffer.len(v754) do
        local v757 = nil;
        local v758 = nil;
        local v759, v760, v761 = v0.readTag(v754, v756);
        v757 = v759;
        v758 = v760;
        v756 = v761;
        if v758 == v0.wireTypes.varint then
            if v757 == 2 then
                v759 = nil;
                v760, v761 = v0.readVarIntI32(v754, v756);
                v759 = v760;
                v756 = v761;
                v755.kind = {
                    type = "literal", 
                    value = v2.VerticalAlignment.fromNumber(v759) or v759
                };
            else
                v759 = nil;
                v760, v761 = v0.readVarInt(v754, v756);
                v759 = v760;
                v756 = v761;
            end;
        elseif v758 == v0.wireTypes.lengthDelimited then
            if v757 == 1 then
                v759 = nil;
                v760, v761 = v0.readBuffer(v754, v756);
                v759 = v760;
                v756 = v761;
                v755.condition = v3.PropCondition.decode(v759);
            elseif v757 == 3 then
                v759 = nil;
                v760, v761 = v0.readBuffer(v754, v756);
                v759 = v760;
                v756 = v761;
                v755.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v759)
                };
            else
                v759 = nil;
                v760, v761 = v0.readVarInt(v754, v756);
                v756 = v761 + v760;
            end;
        elseif v758 == v0.wireTypes.i32 then
            v759 = nil;
            v760, v761 = v0.readFixed32(v754, v756);
            v759 = v760;
            v756 = v761;
        elseif v758 == v0.wireTypes.i64 then
            v759 = nil;
            v760, v761 = v0.readFixed64(v754, v756);
            v759 = v760;
            v756 = v761;
        else
            error("Unsupported wire type: " .. v758);
        end;
    end;
    return v755;
end;
v4.jsonEncode = function(v762) --[[ Line: 5002 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v763 = {};
    if v762.condition ~= nil then
        v763.condition = v762.condition:jsonEncode();
    end;
    if v762.kind ~= nil then
        if v762.kind.type == "literal" then
            v763.literal = if typeof(v762.kind.value) == "number" then v762.kind.value else v2.VerticalAlignment.toNumber(v762.kind.value);
            return v763;
        elseif v762.kind.type == "binding_path" then
            v763.bindingPath = v762.kind.value;
        end;
    end;
    return v763;
end;
v4.jsonDecode = function(v764) --[[ Line: 5022 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_28 (copy), v3 (copy), v2 (copy)
    local v765 = l_v4_28.new();
    if v764.condition ~= nil then
        v765.condition = v3.PropCondition.jsonDecode(v764.condition);
    end;
    if v764.literal ~= nil then
        v765.kind = {
            type = "literal", 
            value = if typeof(v764.literal) == "number" then v2.VerticalAlignment.fromNumber(v764.literal) or v764.literal else v2.VerticalAlignment.fromName(v764.literal) or v764.literal
        };
    end;
    if v764.binding_path ~= nil then
        v765.kind = {
            type = "binding_path", 
            value = v764.binding_path
        };
    end;
    if v764.bindingPath ~= nil then
        v765.kind = {
            type = "binding_path", 
            value = v764.bindingPath
        };
    end;
    return v765;
end;
v4.descriptor = {
    name = "VerticalAlignmentProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.VerticalAlignmentProp_ConditionalOption = v4;
v1.default:register(v2.VerticalAlignmentProp_ConditionalOption);
v4 = {};
v4.__index = v4;
v4.new = function(v766) --[[ Line: 5066 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        option = if not (v766 ~= nil) or v766.option == nil then {} else v766.option
    }, v4));
end;
v4.encode = function(v767) --[[ Line: 5074 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v768 = buffer.create(0);
    local v769 = 0;
    if v767.option ~= nil and #v767.option > 0 then
        for _, v771 in v767.option do
            local v772 = v771:encode();
            local v773, v774 = v0.writeTag(v768, v769, 1, v0.wireTypes.lengthDelimited);
            v773, v774 = v0.writeBuffer(v773, v774, v772, buffer.len(v772));
            v768 = v773;
            v769 = v774;
        end;
    end;
    local v775 = buffer.create(v769);
    buffer.copy(v775, 0, v768, 0, v769);
    return v775;
end;
v4.decode = function(v776) --[[ Line: 5093 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v2 (copy)
    local v777 = v4.new();
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
                table.insert(v777.option, v2.VerticalAlignmentProp_ConditionalOption.decode(v781));
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
v4.jsonEncode = function(v784) --[[ Line: 5138 ]] --[[ Name: jsonEncode ]]
    local v785 = {};
    if v784.option ~= nil and #v784.option > 0 then
        local v786 = {};
        for _, v788 in v784.option do
            table.insert(v786, v788:jsonEncode());
        end;
        v785.option = v786;
    end;
    return v785;
end;
v4.jsonDecode = function(v789) --[[ Line: 5154 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v790 = v4.new();
    if v789.option ~= nil then
        local v791 = {};
        for _, v793 in v789.option do
            table.insert(v791, v2.VerticalAlignmentProp_ConditionalOption.jsonDecode(v793));
        end;
        v790.option = v791;
    end;
    return v790;
end;
v4.descriptor = {
    name = "VerticalAlignmentProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.VerticalAlignmentProp_ConditionalOptions = v4;
v1.default:register(v2.VerticalAlignmentProp_ConditionalOptions);
v2.AutomaticSize = {
    fromNumber = function(v794) --[[ Line: 5182 ]] --[[ Name: fromNumber ]]
        if v794 == 0 then
            return "AUTOMATIC_SIZE_INVALID";
        elseif v794 == 1 then
            return "AUTOMATIC_SIZE_NONE";
        elseif v794 == 2 then
            return "AUTOMATIC_SIZE_X";
        elseif v794 == 3 then
            return "AUTOMATIC_SIZE_Y";
        elseif v794 == 4 then
            return "AUTOMATIC_SIZE_XY";
        else
            return nil;
        end;
    end, 
    toNumber = function(v795) --[[ Line: 5198 ]] --[[ Name: toNumber ]]
        if v795 == "AUTOMATIC_SIZE_INVALID" then
            return 0;
        elseif v795 == "AUTOMATIC_SIZE_NONE" then
            return 1;
        elseif v795 == "AUTOMATIC_SIZE_X" then
            return 2;
        elseif v795 == "AUTOMATIC_SIZE_Y" then
            return 3;
        elseif v795 == "AUTOMATIC_SIZE_XY" then
            return 4;
        else
            return v795;
        end;
    end, 
    fromName = function(v796) --[[ Line: 5214 ]] --[[ Name: fromName ]]
        if v796 == "AUTOMATIC_SIZE_INVALID" then
            return "AUTOMATIC_SIZE_INVALID";
        elseif v796 == "AUTOMATIC_SIZE_NONE" then
            return "AUTOMATIC_SIZE_NONE";
        elseif v796 == "AUTOMATIC_SIZE_X" then
            return "AUTOMATIC_SIZE_X";
        elseif v796 == "AUTOMATIC_SIZE_Y" then
            return "AUTOMATIC_SIZE_Y";
        elseif v796 == "AUTOMATIC_SIZE_XY" then
            return "AUTOMATIC_SIZE_XY";
        else
            return nil;
        end;
    end
};
v2.TextTruncate = {
    fromNumber = function(v797) --[[ Line: 5232 ]] --[[ Name: fromNumber ]]
        if v797 == 0 then
            return "TEXT_TRUNCATE_INVALID";
        elseif v797 == 1 then
            return "TEXT_TRUNCATE_NONE";
        elseif v797 == 2 then
            return "TEXT_TRUNCATE_AT_END";
        elseif v797 == 3 then
            return "TEXT_TRUNCATE_SPLIT_WORD";
        else
            return nil;
        end;
    end, 
    toNumber = function(v798) --[[ Line: 5246 ]] --[[ Name: toNumber ]]
        if v798 == "TEXT_TRUNCATE_INVALID" then
            return 0;
        elseif v798 == "TEXT_TRUNCATE_NONE" then
            return 1;
        elseif v798 == "TEXT_TRUNCATE_AT_END" then
            return 2;
        elseif v798 == "TEXT_TRUNCATE_SPLIT_WORD" then
            return 3;
        else
            return v798;
        end;
    end, 
    fromName = function(v799) --[[ Line: 5260 ]] --[[ Name: fromName ]]
        if v799 == "TEXT_TRUNCATE_INVALID" then
            return "TEXT_TRUNCATE_INVALID";
        elseif v799 == "TEXT_TRUNCATE_NONE" then
            return "TEXT_TRUNCATE_NONE";
        elseif v799 == "TEXT_TRUNCATE_AT_END" then
            return "TEXT_TRUNCATE_AT_END";
        elseif v799 == "TEXT_TRUNCATE_SPLIT_WORD" then
            return "TEXT_TRUNCATE_SPLIT_WORD";
        else
            return nil;
        end;
    end
};
v2.TextXAlignment = {
    fromNumber = function(v800) --[[ Line: 5276 ]] --[[ Name: fromNumber ]]
        if v800 == 0 then
            return "TEXT_X_ALIGNMENT_INVALID";
        elseif v800 == 1 then
            return "TEXT_X_ALIGNMENT_LEFT";
        elseif v800 == 2 then
            return "TEXT_X_ALIGNMENT_CENTER";
        elseif v800 == 3 then
            return "TEXT_X_ALIGNMENT_RIGHT";
        else
            return nil;
        end;
    end, 
    toNumber = function(v801) --[[ Line: 5290 ]] --[[ Name: toNumber ]]
        if v801 == "TEXT_X_ALIGNMENT_INVALID" then
            return 0;
        elseif v801 == "TEXT_X_ALIGNMENT_LEFT" then
            return 1;
        elseif v801 == "TEXT_X_ALIGNMENT_CENTER" then
            return 2;
        elseif v801 == "TEXT_X_ALIGNMENT_RIGHT" then
            return 3;
        else
            return v801;
        end;
    end, 
    fromName = function(v802) --[[ Line: 5304 ]] --[[ Name: fromName ]]
        if v802 == "TEXT_X_ALIGNMENT_INVALID" then
            return "TEXT_X_ALIGNMENT_INVALID";
        elseif v802 == "TEXT_X_ALIGNMENT_LEFT" then
            return "TEXT_X_ALIGNMENT_LEFT";
        elseif v802 == "TEXT_X_ALIGNMENT_CENTER" then
            return "TEXT_X_ALIGNMENT_CENTER";
        elseif v802 == "TEXT_X_ALIGNMENT_RIGHT" then
            return "TEXT_X_ALIGNMENT_RIGHT";
        else
            return nil;
        end;
    end
};
v2.TextYAlignment = {
    fromNumber = function(v803) --[[ Line: 5320 ]] --[[ Name: fromNumber ]]
        if v803 == 0 then
            return "TEXT_Y_ALIGNMENT_INVALID";
        elseif v803 == 1 then
            return "TEXT_Y_ALIGNMENT_TOP";
        elseif v803 == 2 then
            return "TEXT_Y_ALIGNMENT_CENTER";
        elseif v803 == 3 then
            return "TEXT_Y_ALIGNMENT_BOTTOM";
        else
            return nil;
        end;
    end, 
    toNumber = function(v804) --[[ Line: 5334 ]] --[[ Name: toNumber ]]
        if v804 == "TEXT_Y_ALIGNMENT_INVALID" then
            return 0;
        elseif v804 == "TEXT_Y_ALIGNMENT_TOP" then
            return 1;
        elseif v804 == "TEXT_Y_ALIGNMENT_CENTER" then
            return 2;
        elseif v804 == "TEXT_Y_ALIGNMENT_BOTTOM" then
            return 3;
        else
            return v804;
        end;
    end, 
    fromName = function(v805) --[[ Line: 5348 ]] --[[ Name: fromName ]]
        if v805 == "TEXT_Y_ALIGNMENT_INVALID" then
            return "TEXT_Y_ALIGNMENT_INVALID";
        elseif v805 == "TEXT_Y_ALIGNMENT_TOP" then
            return "TEXT_Y_ALIGNMENT_TOP";
        elseif v805 == "TEXT_Y_ALIGNMENT_CENTER" then
            return "TEXT_Y_ALIGNMENT_CENTER";
        elseif v805 == "TEXT_Y_ALIGNMENT_BOTTOM" then
            return "TEXT_Y_ALIGNMENT_BOTTOM";
        else
            return nil;
        end;
    end
};
v2.UIFlexMode = {
    fromNumber = function(v806) --[[ Line: 5364 ]] --[[ Name: fromNumber ]]
        if v806 == 0 then
            return "UI_FLEX_MODE_INVALID";
        elseif v806 == 1 then
            return "UI_FLEX_MODE_NONE";
        elseif v806 == 2 then
            return "UI_FLEX_MODE_GROW";
        elseif v806 == 3 then
            return "UI_FLEX_MODE_SHRINK";
        elseif v806 == 4 then
            return "UI_FLEX_MODE_FILL";
        elseif v806 == 5 then
            return "UI_FLEX_MODE_CUSTOM";
        else
            return nil;
        end;
    end, 
    toNumber = function(v807) --[[ Line: 5382 ]] --[[ Name: toNumber ]]
        if v807 == "UI_FLEX_MODE_INVALID" then
            return 0;
        elseif v807 == "UI_FLEX_MODE_NONE" then
            return 1;
        elseif v807 == "UI_FLEX_MODE_GROW" then
            return 2;
        elseif v807 == "UI_FLEX_MODE_SHRINK" then
            return 3;
        elseif v807 == "UI_FLEX_MODE_FILL" then
            return 4;
        elseif v807 == "UI_FLEX_MODE_CUSTOM" then
            return 5;
        else
            return v807;
        end;
    end, 
    fromName = function(v808) --[[ Line: 5400 ]] --[[ Name: fromName ]]
        if v808 == "UI_FLEX_MODE_INVALID" then
            return "UI_FLEX_MODE_INVALID";
        elseif v808 == "UI_FLEX_MODE_NONE" then
            return "UI_FLEX_MODE_NONE";
        elseif v808 == "UI_FLEX_MODE_GROW" then
            return "UI_FLEX_MODE_GROW";
        elseif v808 == "UI_FLEX_MODE_SHRINK" then
            return "UI_FLEX_MODE_SHRINK";
        elseif v808 == "UI_FLEX_MODE_FILL" then
            return "UI_FLEX_MODE_FILL";
        elseif v808 == "UI_FLEX_MODE_CUSTOM" then
            return "UI_FLEX_MODE_CUSTOM";
        else
            return nil;
        end;
    end
};
v2.ScaleType = {
    fromNumber = function(v809) --[[ Line: 5420 ]] --[[ Name: fromNumber ]]
        if v809 == 0 then
            return "SCALE_TYPE_INVALID";
        elseif v809 == 1 then
            return "SCALE_TYPE_STRETCH";
        elseif v809 == 2 then
            return "SCALE_TYPE_SLICE";
        elseif v809 == 3 then
            return "SCALE_TYPE_TILE";
        elseif v809 == 4 then
            return "SCALE_TYPE_FIT";
        elseif v809 == 5 then
            return "SCALE_TYPE_CROP";
        else
            return nil;
        end;
    end, 
    toNumber = function(v810) --[[ Line: 5438 ]] --[[ Name: toNumber ]]
        if v810 == "SCALE_TYPE_INVALID" then
            return 0;
        elseif v810 == "SCALE_TYPE_STRETCH" then
            return 1;
        elseif v810 == "SCALE_TYPE_SLICE" then
            return 2;
        elseif v810 == "SCALE_TYPE_TILE" then
            return 3;
        elseif v810 == "SCALE_TYPE_FIT" then
            return 4;
        elseif v810 == "SCALE_TYPE_CROP" then
            return 5;
        else
            return v810;
        end;
    end, 
    fromName = function(v811) --[[ Line: 5456 ]] --[[ Name: fromName ]]
        if v811 == "SCALE_TYPE_INVALID" then
            return "SCALE_TYPE_INVALID";
        elseif v811 == "SCALE_TYPE_STRETCH" then
            return "SCALE_TYPE_STRETCH";
        elseif v811 == "SCALE_TYPE_SLICE" then
            return "SCALE_TYPE_SLICE";
        elseif v811 == "SCALE_TYPE_TILE" then
            return "SCALE_TYPE_TILE";
        elseif v811 == "SCALE_TYPE_FIT" then
            return "SCALE_TYPE_FIT";
        elseif v811 == "SCALE_TYPE_CROP" then
            return "SCALE_TYPE_CROP";
        else
            return nil;
        end;
    end
};
v2.ResamplerMode = {
    fromNumber = function(v812) --[[ Line: 5476 ]] --[[ Name: fromNumber ]]
        if v812 == 0 then
            return "RESAMPLER_MODE_INVALID";
        elseif v812 == 1 then
            return "RESAMPLER_MODE_DEFAULT";
        elseif v812 == 2 then
            return "RESAMPLER_MODE_PIXELATED";
        else
            return nil;
        end;
    end, 
    toNumber = function(v813) --[[ Line: 5488 ]] --[[ Name: toNumber ]]
        if v813 == "RESAMPLER_MODE_INVALID" then
            return 0;
        elseif v813 == "RESAMPLER_MODE_DEFAULT" then
            return 1;
        elseif v813 == "RESAMPLER_MODE_PIXELATED" then
            return 2;
        else
            return v813;
        end;
    end, 
    fromName = function(v814) --[[ Line: 5500 ]] --[[ Name: fromName ]]
        if v814 == "RESAMPLER_MODE_INVALID" then
            return "RESAMPLER_MODE_INVALID";
        elseif v814 == "RESAMPLER_MODE_DEFAULT" then
            return "RESAMPLER_MODE_DEFAULT";
        elseif v814 == "RESAMPLER_MODE_PIXELATED" then
            return "RESAMPLER_MODE_PIXELATED";
        else
            return nil;
        end;
    end
};
v2.SizeConstraint = {
    fromNumber = function(v815) --[[ Line: 5514 ]] --[[ Name: fromNumber ]]
        if v815 == 0 then
            return "SIZE_CONSTRAINT_INVALID";
        elseif v815 == 1 then
            return "SIZE_CONSTRAINT_RELATIVE_XY";
        elseif v815 == 2 then
            return "SIZE_CONSTRAINT_RELATIVE_XX";
        elseif v815 == 3 then
            return "SIZE_CONSTRAINT_RELATIVE_YY";
        else
            return nil;
        end;
    end, 
    toNumber = function(v816) --[[ Line: 5528 ]] --[[ Name: toNumber ]]
        if v816 == "SIZE_CONSTRAINT_INVALID" then
            return 0;
        elseif v816 == "SIZE_CONSTRAINT_RELATIVE_XY" then
            return 1;
        elseif v816 == "SIZE_CONSTRAINT_RELATIVE_XX" then
            return 2;
        elseif v816 == "SIZE_CONSTRAINT_RELATIVE_YY" then
            return 3;
        else
            return v816;
        end;
    end, 
    fromName = function(v817) --[[ Line: 5542 ]] --[[ Name: fromName ]]
        if v817 == "SIZE_CONSTRAINT_INVALID" then
            return "SIZE_CONSTRAINT_INVALID";
        elseif v817 == "SIZE_CONSTRAINT_RELATIVE_XY" then
            return "SIZE_CONSTRAINT_RELATIVE_XY";
        elseif v817 == "SIZE_CONSTRAINT_RELATIVE_XX" then
            return "SIZE_CONSTRAINT_RELATIVE_XX";
        elseif v817 == "SIZE_CONSTRAINT_RELATIVE_YY" then
            return "SIZE_CONSTRAINT_RELATIVE_YY";
        else
            return nil;
        end;
    end
};
v2.HorizontalAlignment = {
    fromNumber = function(v818) --[[ Line: 5558 ]] --[[ Name: fromNumber ]]
        if v818 == 0 then
            return "HORIZONTAL_ALIGNMENT_INVALID";
        elseif v818 == 1 then
            return "HORIZONTAL_ALIGNMENT_LEFT";
        elseif v818 == 2 then
            return "HORIZONTAL_ALIGNMENT_CENTER";
        elseif v818 == 3 then
            return "HORIZONTAL_ALIGNMENT_RIGHT";
        else
            return nil;
        end;
    end, 
    toNumber = function(v819) --[[ Line: 5572 ]] --[[ Name: toNumber ]]
        if v819 == "HORIZONTAL_ALIGNMENT_INVALID" then
            return 0;
        elseif v819 == "HORIZONTAL_ALIGNMENT_LEFT" then
            return 1;
        elseif v819 == "HORIZONTAL_ALIGNMENT_CENTER" then
            return 2;
        elseif v819 == "HORIZONTAL_ALIGNMENT_RIGHT" then
            return 3;
        else
            return v819;
        end;
    end, 
    fromName = function(v820) --[[ Line: 5586 ]] --[[ Name: fromName ]]
        if v820 == "HORIZONTAL_ALIGNMENT_INVALID" then
            return "HORIZONTAL_ALIGNMENT_INVALID";
        elseif v820 == "HORIZONTAL_ALIGNMENT_LEFT" then
            return "HORIZONTAL_ALIGNMENT_LEFT";
        elseif v820 == "HORIZONTAL_ALIGNMENT_CENTER" then
            return "HORIZONTAL_ALIGNMENT_CENTER";
        elseif v820 == "HORIZONTAL_ALIGNMENT_RIGHT" then
            return "HORIZONTAL_ALIGNMENT_RIGHT";
        else
            return nil;
        end;
    end
};
v2.VerticalAlignment = {
    fromNumber = function(v821) --[[ Line: 5602 ]] --[[ Name: fromNumber ]]
        if v821 == 0 then
            return "VERTICAL_ALIGNMENT_INVALID";
        elseif v821 == 1 then
            return "VERTICAL_ALIGNMENT_TOP";
        elseif v821 == 2 then
            return "VERTICAL_ALIGNMENT_CENTER";
        elseif v821 == 3 then
            return "VERTICAL_ALIGNMENT_BOTTOM";
        else
            return nil;
        end;
    end, 
    toNumber = function(v822) --[[ Line: 5616 ]] --[[ Name: toNumber ]]
        if v822 == "VERTICAL_ALIGNMENT_INVALID" then
            return 0;
        elseif v822 == "VERTICAL_ALIGNMENT_TOP" then
            return 1;
        elseif v822 == "VERTICAL_ALIGNMENT_CENTER" then
            return 2;
        elseif v822 == "VERTICAL_ALIGNMENT_BOTTOM" then
            return 3;
        else
            return v822;
        end;
    end, 
    fromName = function(v823) --[[ Line: 5630 ]] --[[ Name: fromName ]]
        if v823 == "VERTICAL_ALIGNMENT_INVALID" then
            return "VERTICAL_ALIGNMENT_INVALID";
        elseif v823 == "VERTICAL_ALIGNMENT_TOP" then
            return "VERTICAL_ALIGNMENT_TOP";
        elseif v823 == "VERTICAL_ALIGNMENT_CENTER" then
            return "VERTICAL_ALIGNMENT_CENTER";
        elseif v823 == "VERTICAL_ALIGNMENT_BOTTOM" then
            return "VERTICAL_ALIGNMENT_BOTTOM";
        else
            return nil;
        end;
    end
};
return {
    AutomaticSizeProp = v2.AutomaticSizeProp, 
    AutomaticSizeProp_ConditionalOption = v2.AutomaticSizeProp_ConditionalOption, 
    AutomaticSizeProp_ConditionalOptions = v2.AutomaticSizeProp_ConditionalOptions, 
    TextTruncateProp = v2.TextTruncateProp, 
    TextTruncateProp_ConditionalOption = v2.TextTruncateProp_ConditionalOption, 
    TextTruncateProp_ConditionalOptions = v2.TextTruncateProp_ConditionalOptions, 
    TextXAlignmentProp = v2.TextXAlignmentProp, 
    TextXAlignmentProp_ConditionalOption = v2.TextXAlignmentProp_ConditionalOption, 
    TextXAlignmentProp_ConditionalOptions = v2.TextXAlignmentProp_ConditionalOptions, 
    TextYAlignmentProp = v2.TextYAlignmentProp, 
    TextYAlignmentProp_ConditionalOption = v2.TextYAlignmentProp_ConditionalOption, 
    TextYAlignmentProp_ConditionalOptions = v2.TextYAlignmentProp_ConditionalOptions, 
    UIFlexModeProp = v2.UIFlexModeProp, 
    UIFlexModeProp_ConditionalOption = v2.UIFlexModeProp_ConditionalOption, 
    UIFlexModeProp_ConditionalOptions = v2.UIFlexModeProp_ConditionalOptions, 
    ScaleTypeProp = v2.ScaleTypeProp, 
    ScaleTypeProp_ConditionalOption = v2.ScaleTypeProp_ConditionalOption, 
    ScaleTypeProp_ConditionalOptions = v2.ScaleTypeProp_ConditionalOptions, 
    ResamplerModeProp = v2.ResamplerModeProp, 
    ResamplerModeProp_ConditionalOption = v2.ResamplerModeProp_ConditionalOption, 
    ResamplerModeProp_ConditionalOptions = v2.ResamplerModeProp_ConditionalOptions, 
    SizeConstraintProp = v2.SizeConstraintProp, 
    SizeConstraintProp_ConditionalOption = v2.SizeConstraintProp_ConditionalOption, 
    SizeConstraintProp_ConditionalOptions = v2.SizeConstraintProp_ConditionalOptions, 
    HorizontalAlignmentProp = v2.HorizontalAlignmentProp, 
    HorizontalAlignmentProp_ConditionalOption = v2.HorizontalAlignmentProp_ConditionalOption, 
    HorizontalAlignmentProp_ConditionalOptions = v2.HorizontalAlignmentProp_ConditionalOptions, 
    VerticalAlignmentProp = v2.VerticalAlignmentProp, 
    VerticalAlignmentProp_ConditionalOption = v2.VerticalAlignmentProp_ConditionalOption, 
    VerticalAlignmentProp_ConditionalOptions = v2.VerticalAlignmentProp_ConditionalOptions, 
    AutomaticSize = v2.AutomaticSize, 
    TextTruncate = v2.TextTruncate, 
    TextXAlignment = v2.TextXAlignment, 
    TextYAlignment = v2.TextYAlignment, 
    UIFlexMode = v2.UIFlexMode, 
    ScaleType = v2.ScaleType, 
    ResamplerMode = v2.ResamplerMode, 
    SizeConstraint = v2.SizeConstraint, 
    HorizontalAlignment = v2.HorizontalAlignment, 
    VerticalAlignment = v2.VerticalAlignment
};