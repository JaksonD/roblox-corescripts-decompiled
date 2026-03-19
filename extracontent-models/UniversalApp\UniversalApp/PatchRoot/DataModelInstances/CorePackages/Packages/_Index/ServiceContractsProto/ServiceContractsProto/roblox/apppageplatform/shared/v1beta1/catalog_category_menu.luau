local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.actions);
local v4 = require(script.Parent.component_shared);
local v5 = require(script.Parent.prop_condition);
local v6 = require(script.Parent.prop_types);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 771 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        on_activated = if not (v9 ~= nil) or v9.on_activated == nil then nil else v9.on_activated, 
        text = if not (v9 ~= nil) or v9.text == nil then nil else v9.text, 
        variant = if not (v9 ~= nil) or v9.variant == nil then nil else v9.variant
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 779 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.on_activated ~= nil then
        local v13 = v10.on_activated:encode();
        local v14, v15 = v0.writeTag(v11, v12, 1, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v11 = v14;
        v12 = v15;
    end;
    if v10.text ~= nil then
        local v16 = v10.text:encode();
        local v17, v18 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
        v17, v18 = v0.writeBuffer(v17, v18, v16, buffer.len(v16));
        v11 = v17;
        v12 = v18;
    end;
    if v10.variant ~= nil then
        local v19 = v10.variant:encode();
        local v20, v21 = v0.writeTag(v11, v12, 3, v0.wireTypes.lengthDelimited);
        v20, v21 = v0.writeBuffer(v20, v21, v19, buffer.len(v19));
        v11 = v20;
        v12 = v21;
    end;
    local v22 = buffer.create(v12);
    buffer.copy(v22, 0, v11, 0, v12);
    return v22;
end;
v7.decode = function(v23) --[[ Line: 806 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v3 (copy), v6 (copy)
    local v24 = l_v7_0.new();
    local v25 = 0;
    while v25 < buffer.len(v23) do
        local v26 = nil;
        local v27 = nil;
        local v28, v29, v30 = v0.readTag(v23, v25);
        v26 = v28;
        v27 = v29;
        v25 = v30;
        if v27 == v0.wireTypes.varint then
            v28 = nil;
            v29, v30 = v0.readVarInt(v23, v25);
            v28 = v29;
            v25 = v30;
        elseif v27 == v0.wireTypes.lengthDelimited then
            if v26 == 1 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.on_activated = v3.ActionProp.decode(v28);
            elseif v26 == 2 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.text = v6.StringProp.decode(v28);
            elseif v26 == 3 then
                v28 = nil;
                v29, v30 = v0.readBuffer(v23, v25);
                v28 = v29;
                v25 = v30;
                v24.variant = v6.StringProp.decode(v28);
            else
                v28 = nil;
                v29, v30 = v0.readVarInt(v23, v25);
                v25 = v30 + v29;
            end;
        elseif v27 == v0.wireTypes.i32 then
            v28 = nil;
            v29, v30 = v0.readFixed32(v23, v25);
            v28 = v29;
            v25 = v30;
        elseif v27 == v0.wireTypes.i64 then
            v28 = nil;
            v29, v30 = v0.readFixed64(v23, v25);
            v28 = v29;
            v25 = v30;
        else
            error("Unsupported wire type: " .. v27);
        end;
    end;
    return v24;
end;
v7.jsonEncode = function(v31) --[[ Line: 859 ]] --[[ Name: jsonEncode ]]
    local v32 = {};
    if v31.on_activated ~= nil then
        v32.onActivated = v31.on_activated:jsonEncode();
    end;
    if v31.text ~= nil then
        v32.text = v31.text:jsonEncode();
    end;
    if v31.variant ~= nil then
        v32.variant = v31.variant:jsonEncode();
    end;
    return v32;
end;
v7.jsonDecode = function(v33) --[[ Line: 877 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v3 (copy), v6 (copy)
    local v34 = l_v7_0.new();
    if v33.on_activated ~= nil then
        v34.on_activated = v3.ActionProp.jsonDecode(v33.on_activated);
    end;
    if v33.onActivated ~= nil then
        v34.on_activated = v3.ActionProp.jsonDecode(v33.onActivated);
    end;
    if v33.text ~= nil then
        v34.text = v6.StringProp.jsonDecode(v33.text);
    end;
    if v33.variant ~= nil then
        v34.variant = v6.StringProp.jsonDecode(v33.variant);
    end;
    return v34;
end;
v7.descriptor = {
    name = "TooltipInfoActionProps", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInfoActionProps"
};
v2.TooltipInfoActionProps = v7;
v1.default:register(v2.TooltipInfoActionProps);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v36) --[[ Line: 913 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        kind = if not (v36 ~= nil) or v36.kind == nil then nil else v36.kind
    }, l_v7_1));
end;
v7.encode = function(v37) --[[ Line: 921 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v38 = buffer.create(0);
    local v39 = 0;
    if v37.kind ~= nil then
        if v37.kind.type == "literal" then
            local v40 = v37.kind.value:encode();
            local v41, v42 = v0.writeTag(v38, v39, 1, v0.wireTypes.lengthDelimited);
            v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
            v38 = v41;
            v39 = v42;
        elseif v37.kind.type == "binding_path" then
            local v43, v44 = v0.writeTag(v38, v39, 2, v0.wireTypes.lengthDelimited);
            v43, v44 = v0.writeString(v43, v44, v37.kind.value);
            v38 = v43;
            v39 = v44;
        elseif v37.kind.type == "conditional" then
            local v45 = v37.kind.value:encode();
            local v46, v47 = v0.writeTag(v38, v39, 3, v0.wireTypes.lengthDelimited);
            v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
            v38 = v46;
            v39 = v47;
        end;
    end;
    local v48 = buffer.create(v39);
    buffer.copy(v48, 0, v38, 0, v39);
    return v48;
end;
v7.decode = function(v49) --[[ Line: 945 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy), v2 (copy)
    local v50 = l_v7_1.new();
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
                    value = v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions.decode(v54)
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
            elseif v52 == 3 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfTooltipInfoActionsProp_ConditionalOptions.decode(v54)
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
v7.jsonEncode = function(v57) --[[ Line: 1004 ]] --[[ Name: jsonEncode ]]
    local v58 = {};
    if v57.kind ~= nil then
        if v57.kind.type == "literal" then
            v58.literal = v57.kind.value:jsonEncode();
            return v58;
        elseif v57.kind.type == "binding_path" then
            v58.bindingPath = v57.kind.value;
            return v58;
        elseif v57.kind.type == "conditional" then
            v58.conditional = v57.kind.value:jsonEncode();
        end;
    end;
    return v58;
end;
v7.jsonDecode = function(v59) --[[ Line: 1020 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy), v2 (copy)
    local v60 = l_v7_1.new();
    if v59.literal ~= nil then
        v60.kind = {
            type = "literal", 
            value = v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions.jsonDecode(v59.literal)
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
    if v59.conditional ~= nil then
        v60.kind = {
            type = "conditional", 
            value = v2.ArrayOfTooltipInfoActionsProp_ConditionalOptions.jsonDecode(v59.conditional)
        };
    end;
    return v60;
end;
v7.descriptor = {
    name = "ArrayOfTooltipInfoActionsProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfTooltipInfoActionsProp"
};
v2.ArrayOfTooltipInfoActionsProp = v7;
v1.default:register(v2.ArrayOfTooltipInfoActionsProp);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v62) --[[ Line: 1062 ]] --[[ Name: new ]]
    -- upvalues: l_v7_2 (copy)
    return (setmetatable({
        condition = if not (v62 ~= nil) or v62.condition == nil then nil else v62.condition, 
        kind = if not (v62 ~= nil) or v62.kind == nil then nil else v62.kind
    }, l_v7_2));
end;
v7.encode = function(v63) --[[ Line: 1071 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v64 = buffer.create(0);
    local v65 = 0;
    if v63.condition ~= nil then
        local v66 = v63.condition:encode();
        local v67, v68 = v0.writeTag(v64, v65, 1, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
        v64 = v67;
        v65 = v68;
    end;
    if v63.kind ~= nil then
        if v63.kind.type == "literal" then
            local v69 = v63.kind.value:encode();
            local v70, v71 = v0.writeTag(v64, v65, 2, v0.wireTypes.lengthDelimited);
            v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
            v64 = v70;
            v65 = v71;
        elseif v63.kind.type == "binding_path" then
            local v72, v73 = v0.writeTag(v64, v65, 3, v0.wireTypes.lengthDelimited);
            v72, v73 = v0.writeString(v72, v73, v63.kind.value);
            v64 = v72;
            v65 = v73;
        end;
    end;
    local v74 = buffer.create(v65);
    buffer.copy(v74, 0, v64, 0, v65);
    return v74;
end;
v7.decode = function(v75) --[[ Line: 1099 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_2 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v76 = l_v7_2.new();
    local v77 = 0;
    while v77 < buffer.len(v75) do
        local v78 = nil;
        local v79 = nil;
        local v80, v81, v82 = v0.readTag(v75, v77);
        v78 = v80;
        v79 = v81;
        v77 = v82;
        if v79 == v0.wireTypes.varint then
            v80 = nil;
            v81, v82 = v0.readVarInt(v75, v77);
            v80 = v81;
            v77 = v82;
        elseif v79 == v0.wireTypes.lengthDelimited then
            if v78 == 1 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.condition = v5.PropCondition.decode(v80);
            elseif v78 == 2 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.kind = {
                    type = "literal", 
                    value = v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions.decode(v80)
                };
            elseif v78 == 3 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v80)
                };
            else
                v80 = nil;
                v81, v82 = v0.readVarInt(v75, v77);
                v77 = v82 + v81;
            end;
        elseif v79 == v0.wireTypes.i32 then
            v80 = nil;
            v81, v82 = v0.readFixed32(v75, v77);
            v80 = v81;
            v77 = v82;
        elseif v79 == v0.wireTypes.i64 then
            v80 = nil;
            v81, v82 = v0.readFixed64(v75, v77);
            v80 = v81;
            v77 = v82;
        else
            error("Unsupported wire type: " .. v79);
        end;
    end;
    return v76;
end;
v7.jsonEncode = function(v83) --[[ Line: 1157 ]] --[[ Name: jsonEncode ]]
    local v84 = {};
    if v83.condition ~= nil then
        v84.condition = v83.condition:jsonEncode();
    end;
    if v83.kind ~= nil then
        if v83.kind.type == "literal" then
            v84.literal = v83.kind.value:jsonEncode();
            return v84;
        elseif v83.kind.type == "binding_path" then
            v84.bindingPath = v83.kind.value;
        end;
    end;
    return v84;
end;
v7.jsonDecode = function(v85) --[[ Line: 1177 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v5 (copy), v2 (copy)
    local v86 = l_v7_2.new();
    if v85.condition ~= nil then
        v86.condition = v5.PropCondition.jsonDecode(v85.condition);
    end;
    if v85.literal ~= nil then
        v86.kind = {
            type = "literal", 
            value = v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions.jsonDecode(v85.literal)
        };
    end;
    if v85.binding_path ~= nil then
        v86.kind = {
            type = "binding_path", 
            value = v85.binding_path
        };
    end;
    if v85.bindingPath ~= nil then
        v86.kind = {
            type = "binding_path", 
            value = v85.bindingPath
        };
    end;
    return v86;
end;
v7.descriptor = {
    name = "ArrayOfTooltipInfoActionsProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfTooltipInfoActionsProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfTooltipInfoActionsProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v88) --[[ Line: 1221 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        options = if not (v88 ~= nil) or v88.options == nil then {} else v88.options
    }, l_v7_3));
end;
v7.encode = function(v89) --[[ Line: 1232 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v90 = buffer.create(0);
    local v91 = 0;
    if v89.options ~= nil and #v89.options > 0 then
        for _, v93 in v89.options do
            local v94 = v93:encode();
            local v95, v96 = v0.writeTag(v90, v91, 1, v0.wireTypes.lengthDelimited);
            v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
            v90 = v95;
            v91 = v96;
        end;
    end;
    local v97 = buffer.create(v91);
    buffer.copy(v97, 0, v90, 0, v91);
    return v97;
end;
v7.decode = function(v98) --[[ Line: 1251 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v2 (copy)
    local v99 = l_v7_3.new();
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
                table.insert(v99.options, v2.ArrayOfTooltipInfoActionsProp_ConditionalOption.decode(v103));
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
v7.jsonEncode = function(v106) --[[ Line: 1296 ]] --[[ Name: jsonEncode ]]
    local v107 = {};
    if v106.options ~= nil and #v106.options > 0 then
        local v108 = {};
        for _, v110 in v106.options do
            table.insert(v108, v110:jsonEncode());
        end;
        v107.options = v108;
    end;
    return v107;
end;
v7.jsonDecode = function(v111) --[[ Line: 1312 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v2 (copy)
    local v112 = l_v7_3.new();
    if v111.options ~= nil then
        local v113 = {};
        for _, v115 in v111.options do
            table.insert(v113, v2.ArrayOfTooltipInfoActionsProp_ConditionalOption.jsonDecode(v115));
        end;
        v112.options = v113;
    end;
    return v112;
end;
v7.descriptor = {
    name = "ArrayOfTooltipInfoActionsProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfTooltipInfoActionsProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfTooltipInfoActionsProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v117) --[[ Line: 1345 ]] --[[ Name: new ]]
    -- upvalues: l_v7_4 (copy)
    return (setmetatable({
        array = if not (v117 ~= nil) or v117.array == nil then {} else v117.array
    }, l_v7_4));
end;
v7.encode = function(v118) --[[ Line: 1356 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v119 = buffer.create(0);
    local v120 = 0;
    if v118.array ~= nil and #v118.array > 0 then
        for _, v122 in v118.array do
            local v123 = v122:encode();
            local v124, v125 = v0.writeTag(v119, v120, 1, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v119 = v124;
            v120 = v125;
        end;
    end;
    local v126 = buffer.create(v120);
    buffer.copy(v126, 0, v119, 0, v120);
    return v126;
end;
v7.decode = function(v127) --[[ Line: 1375 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v2 (copy)
    local v128 = l_v7_4.new();
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
                table.insert(v128.array, v2.TooltipInfoActionProps.decode(v132));
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
v7.jsonEncode = function(v135) --[[ Line: 1420 ]] --[[ Name: jsonEncode ]]
    local v136 = {};
    if v135.array ~= nil and #v135.array > 0 then
        local v137 = {};
        for _, v139 in v135.array do
            table.insert(v137, v139:jsonEncode());
        end;
        v136.array = v137;
    end;
    return v136;
end;
v7.jsonDecode = function(v140) --[[ Line: 1436 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy)
    local v141 = l_v7_4.new();
    if v140.array ~= nil then
        local v142 = {};
        for _, v144 in v140.array do
            table.insert(v142, v2.TooltipInfoActionProps.jsonDecode(v144));
        end;
        v141.array = v142;
    end;
    return v141;
end;
v7.descriptor = {
    name = "ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfTooltipInfoActions"
};
v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions = v7;
v1.default:register(v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v146) --[[ Line: 1468 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        anchor_id = if not (v146 ~= nil) or v146.anchor_id == nil then nil else v146.anchor_id, 
        title = if not (v146 ~= nil) or v146.title == nil then nil else v146.title, 
        text = if not (v146 ~= nil) or v146.text == nil then nil else v146.text, 
        is_open = if not (v146 ~= nil) or v146.is_open == nil then nil else v146.is_open, 
        on_close = if not (v146 ~= nil) or v146.on_close == nil then nil else v146.on_close, 
        side = if not (v146 ~= nil) or v146.side == nil then nil else v146.side, 
        align = if not (v146 ~= nil) or v146.align == nil then nil else v146.align, 
        actions = if not (v146 ~= nil) or v146.actions == nil then nil else v146.actions
    }, l_v7_5));
end;
v7.encode = function(v147) --[[ Line: 1483 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v148 = buffer.create(0);
    local v149 = 0;
    if v147.anchor_id ~= nil then
        local v150 = v147.anchor_id:encode();
        local v151, v152 = v0.writeTag(v148, v149, 1, v0.wireTypes.lengthDelimited);
        v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
        v148 = v151;
        v149 = v152;
    end;
    if v147.title ~= nil then
        local v153 = v147.title:encode();
        local v154, v155 = v0.writeTag(v148, v149, 2, v0.wireTypes.lengthDelimited);
        v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
        v148 = v154;
        v149 = v155;
    end;
    if v147.text ~= nil then
        local v156 = v147.text:encode();
        local v157, v158 = v0.writeTag(v148, v149, 3, v0.wireTypes.lengthDelimited);
        v157, v158 = v0.writeBuffer(v157, v158, v156, buffer.len(v156));
        v148 = v157;
        v149 = v158;
    end;
    if v147.is_open ~= nil then
        local v159 = v147.is_open:encode();
        local v160, v161 = v0.writeTag(v148, v149, 4, v0.wireTypes.lengthDelimited);
        v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
        v148 = v160;
        v149 = v161;
    end;
    if v147.on_close ~= nil then
        local v162 = v147.on_close:encode();
        local v163, v164 = v0.writeTag(v148, v149, 5, v0.wireTypes.lengthDelimited);
        v163, v164 = v0.writeBuffer(v163, v164, v162, buffer.len(v162));
        v148 = v163;
        v149 = v164;
    end;
    if v147.side ~= nil then
        local v165 = v147.side:encode();
        local v166, v167 = v0.writeTag(v148, v149, 6, v0.wireTypes.lengthDelimited);
        v166, v167 = v0.writeBuffer(v166, v167, v165, buffer.len(v165));
        v148 = v166;
        v149 = v167;
    end;
    if v147.align ~= nil then
        local v168 = v147.align:encode();
        local v169, v170 = v0.writeTag(v148, v149, 7, v0.wireTypes.lengthDelimited);
        v169, v170 = v0.writeBuffer(v169, v170, v168, buffer.len(v168));
        v148 = v169;
        v149 = v170;
    end;
    if v147.actions ~= nil then
        local v171 = v147.actions:encode();
        local v172, v173 = v0.writeTag(v148, v149, 8, v0.wireTypes.lengthDelimited);
        v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
        v148 = v172;
        v149 = v173;
    end;
    local v174 = buffer.create(v149);
    buffer.copy(v174, 0, v148, 0, v149);
    return v174;
end;
v7.decode = function(v175) --[[ Line: 1540 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v6 (copy), v3 (copy), v2 (copy)
    local v176 = l_v7_5.new();
    local v177 = 0;
    while v177 < buffer.len(v175) do
        local v178 = nil;
        local v179 = nil;
        local v180, v181, v182 = v0.readTag(v175, v177);
        v178 = v180;
        v179 = v181;
        v177 = v182;
        if v179 == v0.wireTypes.varint then
            v180 = nil;
            v181, v182 = v0.readVarInt(v175, v177);
            v180 = v181;
            v177 = v182;
        elseif v179 == v0.wireTypes.lengthDelimited then
            if v178 == 1 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.anchor_id = v6.StringProp.decode(v180);
            elseif v178 == 2 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.title = v6.StringProp.decode(v180);
            elseif v178 == 3 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.text = v6.StringProp.decode(v180);
            elseif v178 == 4 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.is_open = v6.BoolProp.decode(v180);
            elseif v178 == 5 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.on_close = v3.ActionProp.decode(v180);
            elseif v178 == 6 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.side = v6.StringProp.decode(v180);
            elseif v178 == 7 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.align = v6.StringProp.decode(v180);
            elseif v178 == 8 then
                v180 = nil;
                v181, v182 = v0.readBuffer(v175, v177);
                v180 = v181;
                v177 = v182;
                v176.actions = v2.ArrayOfTooltipInfoActionsProp.decode(v180);
            else
                v180 = nil;
                v181, v182 = v0.readVarInt(v175, v177);
                v177 = v182 + v181;
            end;
        elseif v179 == v0.wireTypes.i32 then
            v180 = nil;
            v181, v182 = v0.readFixed32(v175, v177);
            v180 = v181;
            v177 = v182;
        elseif v179 == v0.wireTypes.i64 then
            v180 = nil;
            v181, v182 = v0.readFixed64(v175, v177);
            v180 = v181;
            v177 = v182;
        else
            error("Unsupported wire type: " .. v179);
        end;
    end;
    return v176;
end;
v7.jsonEncode = function(v183) --[[ Line: 1618 ]] --[[ Name: jsonEncode ]]
    local v184 = {};
    if v183.anchor_id ~= nil then
        v184.anchorId = v183.anchor_id:jsonEncode();
    end;
    if v183.title ~= nil then
        v184.title = v183.title:jsonEncode();
    end;
    if v183.text ~= nil then
        v184.text = v183.text:jsonEncode();
    end;
    if v183.is_open ~= nil then
        v184.isOpen = v183.is_open:jsonEncode();
    end;
    if v183.on_close ~= nil then
        v184.onClose = v183.on_close:jsonEncode();
    end;
    if v183.side ~= nil then
        v184.side = v183.side:jsonEncode();
    end;
    if v183.align ~= nil then
        v184.align = v183.align:jsonEncode();
    end;
    if v183.actions ~= nil then
        v184.actions = v183.actions:jsonEncode();
    end;
    return v184;
end;
v7.jsonDecode = function(v185) --[[ Line: 1656 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v6 (copy), v3 (copy), v2 (copy)
    local v186 = l_v7_5.new();
    if v185.anchor_id ~= nil then
        v186.anchor_id = v6.StringProp.jsonDecode(v185.anchor_id);
    end;
    if v185.anchorId ~= nil then
        v186.anchor_id = v6.StringProp.jsonDecode(v185.anchorId);
    end;
    if v185.title ~= nil then
        v186.title = v6.StringProp.jsonDecode(v185.title);
    end;
    if v185.text ~= nil then
        v186.text = v6.StringProp.jsonDecode(v185.text);
    end;
    if v185.is_open ~= nil then
        v186.is_open = v6.BoolProp.jsonDecode(v185.is_open);
    end;
    if v185.isOpen ~= nil then
        v186.is_open = v6.BoolProp.jsonDecode(v185.isOpen);
    end;
    if v185.on_close ~= nil then
        v186.on_close = v3.ActionProp.jsonDecode(v185.on_close);
    end;
    if v185.onClose ~= nil then
        v186.on_close = v3.ActionProp.jsonDecode(v185.onClose);
    end;
    if v185.side ~= nil then
        v186.side = v6.StringProp.jsonDecode(v185.side);
    end;
    if v185.align ~= nil then
        v186.align = v6.StringProp.jsonDecode(v185.align);
    end;
    if v185.actions ~= nil then
        v186.actions = v2.ArrayOfTooltipInfoActionsProp.jsonDecode(v185.actions);
    end;
    return v186;
end;
v7.descriptor = {
    name = "CatalogCategoryMenuTooltipInfo", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogCategoryMenuTooltipInfo"
};
v2.CatalogCategoryMenuTooltipInfo = v7;
v1.default:register(v2.CatalogCategoryMenuTooltipInfo);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v188) --[[ Line: 1720 ]] --[[ Name: new ]]
    -- upvalues: l_v7_6 (copy)
    return (setmetatable({
        id = if not (v188 ~= nil) or v188.id == nil then nil else v188.id, 
        text = if not (v188 ~= nil) or v188.text == nil then nil else v188.text, 
        is_disabled = if not (v188 ~= nil) or v188.is_disabled == nil then nil else v188.is_disabled
    }, l_v7_6));
end;
v7.encode = function(v189) --[[ Line: 1728 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v190 = buffer.create(0);
    local v191 = 0;
    if v189.id ~= nil then
        local v192 = v189.id:encode();
        local v193, v194 = v0.writeTag(v190, v191, 1, v0.wireTypes.lengthDelimited);
        v193, v194 = v0.writeBuffer(v193, v194, v192, buffer.len(v192));
        v190 = v193;
        v191 = v194;
    end;
    if v189.text ~= nil then
        local v195 = v189.text:encode();
        local v196, v197 = v0.writeTag(v190, v191, 2, v0.wireTypes.lengthDelimited);
        v196, v197 = v0.writeBuffer(v196, v197, v195, buffer.len(v195));
        v190 = v196;
        v191 = v197;
    end;
    if v189.is_disabled ~= nil then
        local v198 = v189.is_disabled:encode();
        local v199, v200 = v0.writeTag(v190, v191, 3, v0.wireTypes.lengthDelimited);
        v199, v200 = v0.writeBuffer(v199, v200, v198, buffer.len(v198));
        v190 = v199;
        v191 = v200;
    end;
    local v201 = buffer.create(v191);
    buffer.copy(v201, 0, v190, 0, v191);
    return v201;
end;
v7.decode = function(v202) --[[ Line: 1755 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v6 (copy)
    local v203 = l_v7_6.new();
    local v204 = 0;
    while v204 < buffer.len(v202) do
        local v205 = nil;
        local v206 = nil;
        local v207, v208, v209 = v0.readTag(v202, v204);
        v205 = v207;
        v206 = v208;
        v204 = v209;
        if v206 == v0.wireTypes.varint then
            v207 = nil;
            v208, v209 = v0.readVarInt(v202, v204);
            v207 = v208;
            v204 = v209;
        elseif v206 == v0.wireTypes.lengthDelimited then
            if v205 == 1 then
                v207 = nil;
                v208, v209 = v0.readBuffer(v202, v204);
                v207 = v208;
                v204 = v209;
                v203.id = v6.StringProp.decode(v207);
            elseif v205 == 2 then
                v207 = nil;
                v208, v209 = v0.readBuffer(v202, v204);
                v207 = v208;
                v204 = v209;
                v203.text = v6.StringProp.decode(v207);
            elseif v205 == 3 then
                v207 = nil;
                v208, v209 = v0.readBuffer(v202, v204);
                v207 = v208;
                v204 = v209;
                v203.is_disabled = v6.BoolProp.decode(v207);
            else
                v207 = nil;
                v208, v209 = v0.readVarInt(v202, v204);
                v204 = v209 + v208;
            end;
        elseif v206 == v0.wireTypes.i32 then
            v207 = nil;
            v208, v209 = v0.readFixed32(v202, v204);
            v207 = v208;
            v204 = v209;
        elseif v206 == v0.wireTypes.i64 then
            v207 = nil;
            v208, v209 = v0.readFixed64(v202, v204);
            v207 = v208;
            v204 = v209;
        else
            error("Unsupported wire type: " .. v206);
        end;
    end;
    return v203;
end;
v7.jsonEncode = function(v210) --[[ Line: 1808 ]] --[[ Name: jsonEncode ]]
    local v211 = {};
    if v210.id ~= nil then
        v211.id = v210.id:jsonEncode();
    end;
    if v210.text ~= nil then
        v211.text = v210.text:jsonEncode();
    end;
    if v210.is_disabled ~= nil then
        v211.isDisabled = v210.is_disabled:jsonEncode();
    end;
    return v211;
end;
v7.jsonDecode = function(v212) --[[ Line: 1826 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v6 (copy)
    local v213 = l_v7_6.new();
    if v212.id ~= nil then
        v213.id = v6.StringProp.jsonDecode(v212.id);
    end;
    if v212.text ~= nil then
        v213.text = v6.StringProp.jsonDecode(v212.text);
    end;
    if v212.is_disabled ~= nil then
        v213.is_disabled = v6.BoolProp.jsonDecode(v212.is_disabled);
    end;
    if v212.isDisabled ~= nil then
        v213.is_disabled = v6.BoolProp.jsonDecode(v212.isDisabled);
    end;
    return v213;
end;
v7.descriptor = {
    name = "CatalogCategoryMenuItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogCategoryMenuItem"
};
v2.CatalogCategoryMenuItem = v7;
v1.default:register(v2.CatalogCategoryMenuItem);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v215) --[[ Line: 1862 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        id = if not (v215 ~= nil) or v215.id == nil then nil else v215.id, 
        icon = if not (v215 ~= nil) or v215.icon == nil then nil else v215.icon, 
        on_activated = if not (v215 ~= nil) or v215.on_activated == nil then nil else v215.on_activated, 
        is_disabled = if not (v215 ~= nil) or v215.is_disabled == nil then nil else v215.is_disabled
    }, l_v7_7));
end;
v7.encode = function(v216) --[[ Line: 1871 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v217 = buffer.create(0);
    local v218 = 0;
    if v216.id ~= nil then
        local v219 = v216.id:encode();
        local v220, v221 = v0.writeTag(v217, v218, 1, v0.wireTypes.lengthDelimited);
        v220, v221 = v0.writeBuffer(v220, v221, v219, buffer.len(v219));
        v217 = v220;
        v218 = v221;
    end;
    if v216.icon ~= nil then
        local v222 = v216.icon:encode();
        local v223, v224 = v0.writeTag(v217, v218, 2, v0.wireTypes.lengthDelimited);
        v223, v224 = v0.writeBuffer(v223, v224, v222, buffer.len(v222));
        v217 = v223;
        v218 = v224;
    end;
    if v216.on_activated ~= nil then
        local v225 = v216.on_activated:encode();
        local v226, v227 = v0.writeTag(v217, v218, 3, v0.wireTypes.lengthDelimited);
        v226, v227 = v0.writeBuffer(v226, v227, v225, buffer.len(v225));
        v217 = v226;
        v218 = v227;
    end;
    if v216.is_disabled ~= nil then
        local v228 = v216.is_disabled:encode();
        local v229, v230 = v0.writeTag(v217, v218, 4, v0.wireTypes.lengthDelimited);
        v229, v230 = v0.writeBuffer(v229, v230, v228, buffer.len(v228));
        v217 = v229;
        v218 = v230;
    end;
    local v231 = buffer.create(v218);
    buffer.copy(v231, 0, v217, 0, v218);
    return v231;
end;
v7.decode = function(v232) --[[ Line: 1904 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v6 (copy), v3 (copy)
    local v233 = l_v7_7.new();
    local v234 = 0;
    while v234 < buffer.len(v232) do
        local v235 = nil;
        local v236 = nil;
        local v237, v238, v239 = v0.readTag(v232, v234);
        v235 = v237;
        v236 = v238;
        v234 = v239;
        if v236 == v0.wireTypes.varint then
            v237 = nil;
            v238, v239 = v0.readVarInt(v232, v234);
            v237 = v238;
            v234 = v239;
        elseif v236 == v0.wireTypes.lengthDelimited then
            if v235 == 1 then
                v237 = nil;
                v238, v239 = v0.readBuffer(v232, v234);
                v237 = v238;
                v234 = v239;
                v233.id = v6.StringProp.decode(v237);
            elseif v235 == 2 then
                v237 = nil;
                v238, v239 = v0.readBuffer(v232, v234);
                v237 = v238;
                v234 = v239;
                v233.icon = v6.StringProp.decode(v237);
            elseif v235 == 3 then
                v237 = nil;
                v238, v239 = v0.readBuffer(v232, v234);
                v237 = v238;
                v234 = v239;
                v233.on_activated = v3.ActionProp.decode(v237);
            elseif v235 == 4 then
                v237 = nil;
                v238, v239 = v0.readBuffer(v232, v234);
                v237 = v238;
                v234 = v239;
                v233.is_disabled = v6.BoolProp.decode(v237);
            else
                v237 = nil;
                v238, v239 = v0.readVarInt(v232, v234);
                v234 = v239 + v238;
            end;
        elseif v236 == v0.wireTypes.i32 then
            v237 = nil;
            v238, v239 = v0.readFixed32(v232, v234);
            v237 = v238;
            v234 = v239;
        elseif v236 == v0.wireTypes.i64 then
            v237 = nil;
            v238, v239 = v0.readFixed64(v232, v234);
            v237 = v238;
            v234 = v239;
        else
            error("Unsupported wire type: " .. v236);
        end;
    end;
    return v233;
end;
v7.jsonEncode = function(v240) --[[ Line: 1962 ]] --[[ Name: jsonEncode ]]
    local v241 = {};
    if v240.id ~= nil then
        v241.id = v240.id:jsonEncode();
    end;
    if v240.icon ~= nil then
        v241.icon = v240.icon:jsonEncode();
    end;
    if v240.on_activated ~= nil then
        v241.onActivated = v240.on_activated:jsonEncode();
    end;
    if v240.is_disabled ~= nil then
        v241.isDisabled = v240.is_disabled:jsonEncode();
    end;
    return v241;
end;
v7.jsonDecode = function(v242) --[[ Line: 1984 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v6 (copy), v3 (copy)
    local v243 = l_v7_7.new();
    if v242.id ~= nil then
        v243.id = v6.StringProp.jsonDecode(v242.id);
    end;
    if v242.icon ~= nil then
        v243.icon = v6.StringProp.jsonDecode(v242.icon);
    end;
    if v242.on_activated ~= nil then
        v243.on_activated = v3.ActionProp.jsonDecode(v242.on_activated);
    end;
    if v242.onActivated ~= nil then
        v243.on_activated = v3.ActionProp.jsonDecode(v242.onActivated);
    end;
    if v242.is_disabled ~= nil then
        v243.is_disabled = v6.BoolProp.jsonDecode(v242.is_disabled);
    end;
    if v242.isDisabled ~= nil then
        v243.is_disabled = v6.BoolProp.jsonDecode(v242.isDisabled);
    end;
    return v243;
end;
v7.descriptor = {
    name = "CategoryMenuButton", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CategoryMenuButton"
};
v2.CategoryMenuButton = v7;
v1.default:register(v2.CategoryMenuButton);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v245) --[[ Line: 2028 ]] --[[ Name: new ]]
    -- upvalues: l_v7_8 (copy)
    return (setmetatable({
        kind = if not (v245 ~= nil) or v245.kind == nil then nil else v245.kind
    }, l_v7_8));
end;
v7.encode = function(v246) --[[ Line: 2036 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v247 = buffer.create(0);
    local v248 = 0;
    if v246.kind ~= nil then
        if v246.kind.type == "literal" then
            local v249 = v246.kind.value:encode();
            local v250, v251 = v0.writeTag(v247, v248, 1, v0.wireTypes.lengthDelimited);
            v250, v251 = v0.writeBuffer(v250, v251, v249, buffer.len(v249));
            v247 = v250;
            v248 = v251;
        elseif v246.kind.type == "binding_path" then
            local v252, v253 = v0.writeTag(v247, v248, 2, v0.wireTypes.lengthDelimited);
            v252, v253 = v0.writeString(v252, v253, v246.kind.value);
            v247 = v252;
            v248 = v253;
        elseif v246.kind.type == "conditional" then
            local v254 = v246.kind.value:encode();
            local v255, v256 = v0.writeTag(v247, v248, 3, v0.wireTypes.lengthDelimited);
            v255, v256 = v0.writeBuffer(v255, v256, v254, buffer.len(v254));
            v247 = v255;
            v248 = v256;
        end;
    end;
    local v257 = buffer.create(v248);
    buffer.copy(v257, 0, v247, 0, v248);
    return v257;
end;
v7.decode = function(v258) --[[ Line: 2060 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v2 (copy)
    local v259 = l_v7_8.new();
    local v260 = 0;
    while v260 < buffer.len(v258) do
        local v261 = nil;
        local v262 = nil;
        local v263, v264, v265 = v0.readTag(v258, v260);
        v261 = v263;
        v262 = v264;
        v260 = v265;
        if v262 == v0.wireTypes.varint then
            v263 = nil;
            v264, v265 = v0.readVarInt(v258, v260);
            v263 = v264;
            v260 = v265;
        elseif v262 == v0.wireTypes.lengthDelimited then
            if v261 == 1 then
                v263 = nil;
                v264, v265 = v0.readBuffer(v258, v260);
                v263 = v264;
                v260 = v265;
                v259.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem.decode(v263)
                };
            elseif v261 == 2 then
                v263 = nil;
                v264, v265 = v0.readBuffer(v258, v260);
                v263 = v264;
                v260 = v265;
                v259.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v263)
                };
            elseif v261 == 3 then
                v263 = nil;
                v264, v265 = v0.readBuffer(v258, v260);
                v263 = v264;
                v260 = v265;
                v259.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions.decode(v263)
                };
            else
                v263 = nil;
                v264, v265 = v0.readVarInt(v258, v260);
                v260 = v265 + v264;
            end;
        elseif v262 == v0.wireTypes.i32 then
            v263 = nil;
            v264, v265 = v0.readFixed32(v258, v260);
            v263 = v264;
            v260 = v265;
        elseif v262 == v0.wireTypes.i64 then
            v263 = nil;
            v264, v265 = v0.readFixed64(v258, v260);
            v263 = v264;
            v260 = v265;
        else
            error("Unsupported wire type: " .. v262);
        end;
    end;
    return v259;
end;
v7.jsonEncode = function(v266) --[[ Line: 2121 ]] --[[ Name: jsonEncode ]]
    local v267 = {};
    if v266.kind ~= nil then
        if v266.kind.type == "literal" then
            v267.literal = v266.kind.value:jsonEncode();
            return v267;
        elseif v266.kind.type == "binding_path" then
            v267.bindingPath = v266.kind.value;
            return v267;
        elseif v266.kind.type == "conditional" then
            v267.conditional = v266.kind.value:jsonEncode();
        end;
    end;
    return v267;
end;
v7.jsonDecode = function(v268) --[[ Line: 2137 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v2 (copy)
    local v269 = l_v7_8.new();
    if v268.literal ~= nil then
        v269.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem.jsonDecode(v268.literal)
        };
    end;
    if v268.binding_path ~= nil then
        v269.kind = {
            type = "binding_path", 
            value = v268.binding_path
        };
    end;
    if v268.bindingPath ~= nil then
        v269.kind = {
            type = "binding_path", 
            value = v268.bindingPath
        };
    end;
    if v268.conditional ~= nil then
        v269.kind = {
            type = "conditional", 
            value = v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions.jsonDecode(v268.conditional)
        };
    end;
    return v269;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuItemProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogCategoryMenuItemProp"
};
v2.ArrayOfCatalogCategoryMenuItemProp = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuItemProp);
v7 = {};
v7.__index = v7;
local l_v7_9 = v7 --[[ copy: 7 -> 17 ]];
v7.new = function(v271) --[[ Line: 2184 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        condition = if not (v271 ~= nil) or v271.condition == nil then nil else v271.condition, 
        kind = if not (v271 ~= nil) or v271.kind == nil then nil else v271.kind
    }, l_v7_9));
end;
v7.encode = function(v272) --[[ Line: 2196 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v273 = buffer.create(0);
    local v274 = 0;
    if v272.condition ~= nil then
        local v275 = v272.condition:encode();
        local v276, v277 = v0.writeTag(v273, v274, 1, v0.wireTypes.lengthDelimited);
        v276, v277 = v0.writeBuffer(v276, v277, v275, buffer.len(v275));
        v273 = v276;
        v274 = v277;
    end;
    if v272.kind ~= nil then
        if v272.kind.type == "literal" then
            local v278 = v272.kind.value:encode();
            local v279, v280 = v0.writeTag(v273, v274, 2, v0.wireTypes.lengthDelimited);
            v279, v280 = v0.writeBuffer(v279, v280, v278, buffer.len(v278));
            v273 = v279;
            v274 = v280;
        elseif v272.kind.type == "binding_path" then
            local v281, v282 = v0.writeTag(v273, v274, 3, v0.wireTypes.lengthDelimited);
            v281, v282 = v0.writeString(v281, v282, v272.kind.value);
            v273 = v281;
            v274 = v282;
        end;
    end;
    local v283 = buffer.create(v274);
    buffer.copy(v283, 0, v273, 0, v274);
    return v283;
end;
v7.decode = function(v284) --[[ Line: 2224 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v285 = l_v7_9.new();
    local v286 = 0;
    while v286 < buffer.len(v284) do
        local v287 = nil;
        local v288 = nil;
        local v289, v290, v291 = v0.readTag(v284, v286);
        v287 = v289;
        v288 = v290;
        v286 = v291;
        if v288 == v0.wireTypes.varint then
            v289 = nil;
            v290, v291 = v0.readVarInt(v284, v286);
            v289 = v290;
            v286 = v291;
        elseif v288 == v0.wireTypes.lengthDelimited then
            if v287 == 1 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.condition = v5.PropCondition.decode(v289);
            elseif v287 == 2 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem.decode(v289)
                };
            elseif v287 == 3 then
                v289 = nil;
                v290, v291 = v0.readBuffer(v284, v286);
                v289 = v290;
                v286 = v291;
                v285.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v289)
                };
            else
                v289 = nil;
                v290, v291 = v0.readVarInt(v284, v286);
                v286 = v291 + v290;
            end;
        elseif v288 == v0.wireTypes.i32 then
            v289 = nil;
            v290, v291 = v0.readFixed32(v284, v286);
            v289 = v290;
            v286 = v291;
        elseif v288 == v0.wireTypes.i64 then
            v289 = nil;
            v290, v291 = v0.readFixed64(v284, v286);
            v289 = v290;
            v286 = v291;
        else
            error("Unsupported wire type: " .. v288);
        end;
    end;
    return v285;
end;
v7.jsonEncode = function(v292) --[[ Line: 2284 ]] --[[ Name: jsonEncode ]]
    local v293 = {};
    if v292.condition ~= nil then
        v293.condition = v292.condition:jsonEncode();
    end;
    if v292.kind ~= nil then
        if v292.kind.type == "literal" then
            v293.literal = v292.kind.value:jsonEncode();
            return v293;
        elseif v292.kind.type == "binding_path" then
            v293.bindingPath = v292.kind.value;
        end;
    end;
    return v293;
end;
v7.jsonDecode = function(v294) --[[ Line: 2304 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy), v5 (copy), v2 (copy)
    local v295 = l_v7_9.new();
    if v294.condition ~= nil then
        v295.condition = v5.PropCondition.jsonDecode(v294.condition);
    end;
    if v294.literal ~= nil then
        v295.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem.jsonDecode(v294.literal)
        };
    end;
    if v294.binding_path ~= nil then
        v295.kind = {
            type = "binding_path", 
            value = v294.binding_path
        };
    end;
    if v294.bindingPath ~= nil then
        v295.kind = {
            type = "binding_path", 
            value = v294.bindingPath
        };
    end;
    return v295;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuItemProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_10 = v7 --[[ copy: 7 -> 18 ]];
v7.new = function(v297) --[[ Line: 2350 ]] --[[ Name: new ]]
    -- upvalues: l_v7_10 (copy)
    return (setmetatable({
        options = if not (v297 ~= nil) or v297.options == nil then {} else v297.options
    }, l_v7_10));
end;
v7.encode = function(v298) --[[ Line: 2361 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v299 = buffer.create(0);
    local v300 = 0;
    if v298.options ~= nil and #v298.options > 0 then
        for _, v302 in v298.options do
            local v303 = v302:encode();
            local v304, v305 = v0.writeTag(v299, v300, 1, v0.wireTypes.lengthDelimited);
            v304, v305 = v0.writeBuffer(v304, v305, v303, buffer.len(v303));
            v299 = v304;
            v300 = v305;
        end;
    end;
    local v306 = buffer.create(v300);
    buffer.copy(v306, 0, v299, 0, v300);
    return v306;
end;
v7.decode = function(v307) --[[ Line: 2380 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_10 (copy), v0 (copy), v2 (copy)
    local v308 = l_v7_10.new();
    local v309 = 0;
    while v309 < buffer.len(v307) do
        local v310 = nil;
        local v311 = nil;
        local v312, v313, v314 = v0.readTag(v307, v309);
        v310 = v312;
        v311 = v313;
        v309 = v314;
        if v311 == v0.wireTypes.varint then
            v312 = nil;
            v313, v314 = v0.readVarInt(v307, v309);
            v312 = v313;
            v309 = v314;
        elseif v311 == v0.wireTypes.lengthDelimited then
            if v310 == 1 then
                v312 = nil;
                v313, v314 = v0.readBuffer(v307, v309);
                v312 = v313;
                v309 = v314;
                table.insert(v308.options, v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOption.decode(v312));
            else
                v312 = nil;
                v313, v314 = v0.readVarInt(v307, v309);
                v309 = v314 + v313;
            end;
        elseif v311 == v0.wireTypes.i32 then
            v312 = nil;
            v313, v314 = v0.readFixed32(v307, v309);
            v312 = v313;
            v309 = v314;
        elseif v311 == v0.wireTypes.i64 then
            v312 = nil;
            v313, v314 = v0.readFixed64(v307, v309);
            v312 = v313;
            v309 = v314;
        else
            error("Unsupported wire type: " .. v311);
        end;
    end;
    return v308;
end;
v7.jsonEncode = function(v315) --[[ Line: 2428 ]] --[[ Name: jsonEncode ]]
    local v316 = {};
    if v315.options ~= nil and #v315.options > 0 then
        local v317 = {};
        for _, v319 in v315.options do
            table.insert(v317, v319:jsonEncode());
        end;
        v316.options = v317;
    end;
    return v316;
end;
v7.jsonDecode = function(v320) --[[ Line: 2444 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_10 (copy), v2 (copy)
    local v321 = l_v7_10.new();
    if v320.options ~= nil then
        local v322 = {};
        for _, v324 in v320.options do
            table.insert(v322, v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOption.jsonDecode(v324));
        end;
        v321.options = v322;
    end;
    return v321;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_11 = v7 --[[ copy: 7 -> 19 ]];
v7.new = function(v326) --[[ Line: 2477 ]] --[[ Name: new ]]
    -- upvalues: l_v7_11 (copy)
    return (setmetatable({
        array = if not (v326 ~= nil) or v326.array == nil then {} else v326.array
    }, l_v7_11));
end;
v7.encode = function(v327) --[[ Line: 2488 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v328 = buffer.create(0);
    local v329 = 0;
    if v327.array ~= nil and #v327.array > 0 then
        for _, v331 in v327.array do
            local v332 = v331:encode();
            local v333, v334 = v0.writeTag(v328, v329, 1, v0.wireTypes.lengthDelimited);
            v333, v334 = v0.writeBuffer(v333, v334, v332, buffer.len(v332));
            v328 = v333;
            v329 = v334;
        end;
    end;
    local v335 = buffer.create(v329);
    buffer.copy(v335, 0, v328, 0, v329);
    return v335;
end;
v7.decode = function(v336) --[[ Line: 2507 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_11 (copy), v0 (copy), v2 (copy)
    local v337 = l_v7_11.new();
    local v338 = 0;
    while v338 < buffer.len(v336) do
        local v339 = nil;
        local v340 = nil;
        local v341, v342, v343 = v0.readTag(v336, v338);
        v339 = v341;
        v340 = v342;
        v338 = v343;
        if v340 == v0.wireTypes.varint then
            v341 = nil;
            v342, v343 = v0.readVarInt(v336, v338);
            v341 = v342;
            v338 = v343;
        elseif v340 == v0.wireTypes.lengthDelimited then
            if v339 == 1 then
                v341 = nil;
                v342, v343 = v0.readBuffer(v336, v338);
                v341 = v342;
                v338 = v343;
                table.insert(v337.array, v2.CatalogCategoryMenuItem.decode(v341));
            else
                v341 = nil;
                v342, v343 = v0.readVarInt(v336, v338);
                v338 = v343 + v342;
            end;
        elseif v340 == v0.wireTypes.i32 then
            v341 = nil;
            v342, v343 = v0.readFixed32(v336, v338);
            v341 = v342;
            v338 = v343;
        elseif v340 == v0.wireTypes.i64 then
            v341 = nil;
            v342, v343 = v0.readFixed64(v336, v338);
            v341 = v342;
            v338 = v343;
        else
            error("Unsupported wire type: " .. v340);
        end;
    end;
    return v337;
end;
v7.jsonEncode = function(v344) --[[ Line: 2552 ]] --[[ Name: jsonEncode ]]
    local v345 = {};
    if v344.array ~= nil and #v344.array > 0 then
        local v346 = {};
        for _, v348 in v344.array do
            table.insert(v346, v348:jsonEncode());
        end;
        v345.array = v346;
    end;
    return v345;
end;
v7.jsonDecode = function(v349) --[[ Line: 2568 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_11 (copy), v2 (copy)
    local v350 = l_v7_11.new();
    if v349.array ~= nil then
        local v351 = {};
        for _, v353 in v349.array do
            table.insert(v351, v2.CatalogCategoryMenuItem.jsonDecode(v353));
        end;
        v350.array = v351;
    end;
    return v350;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogCategoryMenuItem"
};
v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem);
v7 = {};
v7.__index = v7;
local l_v7_12 = v7 --[[ copy: 7 -> 20 ]];
v7.new = function(v355) --[[ Line: 2600 ]] --[[ Name: new ]]
    -- upvalues: l_v7_12 (copy)
    return (setmetatable({
        kind = if not (v355 ~= nil) or v355.kind == nil then nil else v355.kind
    }, l_v7_12));
end;
v7.encode = function(v356) --[[ Line: 2608 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v357 = buffer.create(0);
    local v358 = 0;
    if v356.kind ~= nil then
        if v356.kind.type == "literal" then
            local v359 = v356.kind.value:encode();
            local v360, v361 = v0.writeTag(v357, v358, 1, v0.wireTypes.lengthDelimited);
            v360, v361 = v0.writeBuffer(v360, v361, v359, buffer.len(v359));
            v357 = v360;
            v358 = v361;
        elseif v356.kind.type == "binding_path" then
            local v362, v363 = v0.writeTag(v357, v358, 2, v0.wireTypes.lengthDelimited);
            v362, v363 = v0.writeString(v362, v363, v356.kind.value);
            v357 = v362;
            v358 = v363;
        elseif v356.kind.type == "conditional" then
            local v364 = v356.kind.value:encode();
            local v365, v366 = v0.writeTag(v357, v358, 3, v0.wireTypes.lengthDelimited);
            v365, v366 = v0.writeBuffer(v365, v366, v364, buffer.len(v364));
            v357 = v365;
            v358 = v366;
        end;
    end;
    local v367 = buffer.create(v358);
    buffer.copy(v367, 0, v357, 0, v358);
    return v367;
end;
v7.decode = function(v368) --[[ Line: 2634 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_12 (copy), v0 (copy), v2 (copy)
    local v369 = l_v7_12.new();
    local v370 = 0;
    while v370 < buffer.len(v368) do
        local v371 = nil;
        local v372 = nil;
        local v373, v374, v375 = v0.readTag(v368, v370);
        v371 = v373;
        v372 = v374;
        v370 = v375;
        if v372 == v0.wireTypes.varint then
            v373 = nil;
            v374, v375 = v0.readVarInt(v368, v370);
            v373 = v374;
            v370 = v375;
        elseif v372 == v0.wireTypes.lengthDelimited then
            if v371 == 1 then
                v373 = nil;
                v374, v375 = v0.readBuffer(v368, v370);
                v373 = v374;
                v370 = v375;
                v369.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo.decode(v373)
                };
            elseif v371 == 2 then
                v373 = nil;
                v374, v375 = v0.readBuffer(v368, v370);
                v373 = v374;
                v370 = v375;
                v369.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v373)
                };
            elseif v371 == 3 then
                v373 = nil;
                v374, v375 = v0.readBuffer(v368, v370);
                v373 = v374;
                v370 = v375;
                v369.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions.decode(v373)
                };
            else
                v373 = nil;
                v374, v375 = v0.readVarInt(v368, v370);
                v370 = v375 + v374;
            end;
        elseif v372 == v0.wireTypes.i32 then
            v373 = nil;
            v374, v375 = v0.readFixed32(v368, v370);
            v373 = v374;
            v370 = v375;
        elseif v372 == v0.wireTypes.i64 then
            v373 = nil;
            v374, v375 = v0.readFixed64(v368, v370);
            v373 = v374;
            v370 = v375;
        else
            error("Unsupported wire type: " .. v372);
        end;
    end;
    return v369;
end;
v7.jsonEncode = function(v376) --[[ Line: 2697 ]] --[[ Name: jsonEncode ]]
    local v377 = {};
    if v376.kind ~= nil then
        if v376.kind.type == "literal" then
            v377.literal = v376.kind.value:jsonEncode();
            return v377;
        elseif v376.kind.type == "binding_path" then
            v377.bindingPath = v376.kind.value;
            return v377;
        elseif v376.kind.type == "conditional" then
            v377.conditional = v376.kind.value:jsonEncode();
        end;
    end;
    return v377;
end;
v7.jsonDecode = function(v378) --[[ Line: 2715 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_12 (copy), v2 (copy)
    local v379 = l_v7_12.new();
    if v378.literal ~= nil then
        v379.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo.jsonDecode(v378.literal)
        };
    end;
    if v378.binding_path ~= nil then
        v379.kind = {
            type = "binding_path", 
            value = v378.binding_path
        };
    end;
    if v378.bindingPath ~= nil then
        v379.kind = {
            type = "binding_path", 
            value = v378.bindingPath
        };
    end;
    if v378.conditional ~= nil then
        v379.kind = {
            type = "conditional", 
            value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions.jsonDecode(v378.conditional)
        };
    end;
    return v379;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuTooltipInfoProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogCategoryMenuTooltipInfoProp"
};
v2.ArrayOfCatalogCategoryMenuTooltipInfoProp = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuTooltipInfoProp);
v7 = {};
v7.__index = v7;
local l_v7_13 = v7 --[[ copy: 7 -> 21 ]];
v7.new = function(v381) --[[ Line: 2764 ]] --[[ Name: new ]]
    -- upvalues: l_v7_13 (copy)
    return (setmetatable({
        condition = if not (v381 ~= nil) or v381.condition == nil then nil else v381.condition, 
        kind = if not (v381 ~= nil) or v381.kind == nil then nil else v381.kind
    }, l_v7_13));
end;
v7.encode = function(v382) --[[ Line: 2776 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v383 = buffer.create(0);
    local v384 = 0;
    if v382.condition ~= nil then
        local v385 = v382.condition:encode();
        local v386, v387 = v0.writeTag(v383, v384, 1, v0.wireTypes.lengthDelimited);
        v386, v387 = v0.writeBuffer(v386, v387, v385, buffer.len(v385));
        v383 = v386;
        v384 = v387;
    end;
    if v382.kind ~= nil then
        if v382.kind.type == "literal" then
            local v388 = v382.kind.value:encode();
            local v389, v390 = v0.writeTag(v383, v384, 2, v0.wireTypes.lengthDelimited);
            v389, v390 = v0.writeBuffer(v389, v390, v388, buffer.len(v388));
            v383 = v389;
            v384 = v390;
        elseif v382.kind.type == "binding_path" then
            local v391, v392 = v0.writeTag(v383, v384, 3, v0.wireTypes.lengthDelimited);
            v391, v392 = v0.writeString(v391, v392, v382.kind.value);
            v383 = v391;
            v384 = v392;
        end;
    end;
    local v393 = buffer.create(v384);
    buffer.copy(v393, 0, v383, 0, v384);
    return v393;
end;
v7.decode = function(v394) --[[ Line: 2804 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_13 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v395 = l_v7_13.new();
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
            if v397 == 1 then
                v399 = nil;
                v400, v401 = v0.readBuffer(v394, v396);
                v399 = v400;
                v396 = v401;
                v395.condition = v5.PropCondition.decode(v399);
            elseif v397 == 2 then
                v399 = nil;
                v400, v401 = v0.readBuffer(v394, v396);
                v399 = v400;
                v396 = v401;
                v395.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo.decode(v399)
                };
            elseif v397 == 3 then
                v399 = nil;
                v400, v401 = v0.readBuffer(v394, v396);
                v399 = v400;
                v396 = v401;
                v395.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v399)
                };
            else
                v399 = nil;
                v400, v401 = v0.readVarInt(v394, v396);
                v396 = v401 + v400;
            end;
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
v7.jsonEncode = function(v402) --[[ Line: 2864 ]] --[[ Name: jsonEncode ]]
    local v403 = {};
    if v402.condition ~= nil then
        v403.condition = v402.condition:jsonEncode();
    end;
    if v402.kind ~= nil then
        if v402.kind.type == "literal" then
            v403.literal = v402.kind.value:jsonEncode();
            return v403;
        elseif v402.kind.type == "binding_path" then
            v403.bindingPath = v402.kind.value;
        end;
    end;
    return v403;
end;
v7.jsonDecode = function(v404) --[[ Line: 2884 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_13 (copy), v5 (copy), v2 (copy)
    local v405 = l_v7_13.new();
    if v404.condition ~= nil then
        v405.condition = v5.PropCondition.jsonDecode(v404.condition);
    end;
    if v404.literal ~= nil then
        v405.kind = {
            type = "literal", 
            value = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo.jsonDecode(v404.literal)
        };
    end;
    if v404.binding_path ~= nil then
        v405.kind = {
            type = "binding_path", 
            value = v404.binding_path
        };
    end;
    if v404.bindingPath ~= nil then
        v405.kind = {
            type = "binding_path", 
            value = v404.bindingPath
        };
    end;
    return v405;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_14 = v7 --[[ copy: 7 -> 22 ]];
v7.new = function(v407) --[[ Line: 2930 ]] --[[ Name: new ]]
    -- upvalues: l_v7_14 (copy)
    return (setmetatable({
        options = if not (v407 ~= nil) or v407.options == nil then {} else v407.options
    }, l_v7_14));
end;
v7.encode = function(v408) --[[ Line: 2941 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v409 = buffer.create(0);
    local v410 = 0;
    if v408.options ~= nil and #v408.options > 0 then
        for _, v412 in v408.options do
            local v413 = v412:encode();
            local v414, v415 = v0.writeTag(v409, v410, 1, v0.wireTypes.lengthDelimited);
            v414, v415 = v0.writeBuffer(v414, v415, v413, buffer.len(v413));
            v409 = v414;
            v410 = v415;
        end;
    end;
    local v416 = buffer.create(v410);
    buffer.copy(v416, 0, v409, 0, v410);
    return v416;
end;
v7.decode = function(v417) --[[ Line: 2960 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_14 (copy), v0 (copy), v2 (copy)
    local v418 = l_v7_14.new();
    local v419 = 0;
    while v419 < buffer.len(v417) do
        local v420 = nil;
        local v421 = nil;
        local v422, v423, v424 = v0.readTag(v417, v419);
        v420 = v422;
        v421 = v423;
        v419 = v424;
        if v421 == v0.wireTypes.varint then
            v422 = nil;
            v423, v424 = v0.readVarInt(v417, v419);
            v422 = v423;
            v419 = v424;
        elseif v421 == v0.wireTypes.lengthDelimited then
            if v420 == 1 then
                v422 = nil;
                v423, v424 = v0.readBuffer(v417, v419);
                v422 = v423;
                v419 = v424;
                table.insert(v418.options, v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption.decode(v422));
            else
                v422 = nil;
                v423, v424 = v0.readVarInt(v417, v419);
                v419 = v424 + v423;
            end;
        elseif v421 == v0.wireTypes.i32 then
            v422 = nil;
            v423, v424 = v0.readFixed32(v417, v419);
            v422 = v423;
            v419 = v424;
        elseif v421 == v0.wireTypes.i64 then
            v422 = nil;
            v423, v424 = v0.readFixed64(v417, v419);
            v422 = v423;
            v419 = v424;
        else
            error("Unsupported wire type: " .. v421);
        end;
    end;
    return v418;
end;
v7.jsonEncode = function(v425) --[[ Line: 3008 ]] --[[ Name: jsonEncode ]]
    local v426 = {};
    if v425.options ~= nil and #v425.options > 0 then
        local v427 = {};
        for _, v429 in v425.options do
            table.insert(v427, v429:jsonEncode());
        end;
        v426.options = v427;
    end;
    return v426;
end;
v7.jsonDecode = function(v430) --[[ Line: 3024 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_14 (copy), v2 (copy)
    local v431 = l_v7_14.new();
    if v430.options ~= nil then
        local v432 = {};
        for _, v434 in v430.options do
            table.insert(v432, v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption.jsonDecode(v434));
        end;
        v431.options = v432;
    end;
    return v431;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_15 = v7 --[[ copy: 7 -> 23 ]];
v7.new = function(v436) --[[ Line: 3060 ]] --[[ Name: new ]]
    -- upvalues: l_v7_15 (copy)
    return (setmetatable({
        array = if not (v436 ~= nil) or v436.array == nil then {} else v436.array
    }, l_v7_15));
end;
v7.encode = function(v437) --[[ Line: 3071 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v438 = buffer.create(0);
    local v439 = 0;
    if v437.array ~= nil and #v437.array > 0 then
        for _, v441 in v437.array do
            local v442 = v441:encode();
            local v443, v444 = v0.writeTag(v438, v439, 1, v0.wireTypes.lengthDelimited);
            v443, v444 = v0.writeBuffer(v443, v444, v442, buffer.len(v442));
            v438 = v443;
            v439 = v444;
        end;
    end;
    local v445 = buffer.create(v439);
    buffer.copy(v445, 0, v438, 0, v439);
    return v445;
end;
v7.decode = function(v446) --[[ Line: 3090 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_15 (copy), v0 (copy), v2 (copy)
    local v447 = l_v7_15.new();
    local v448 = 0;
    while v448 < buffer.len(v446) do
        local v449 = nil;
        local v450 = nil;
        local v451, v452, v453 = v0.readTag(v446, v448);
        v449 = v451;
        v450 = v452;
        v448 = v453;
        if v450 == v0.wireTypes.varint then
            v451 = nil;
            v452, v453 = v0.readVarInt(v446, v448);
            v451 = v452;
            v448 = v453;
        elseif v450 == v0.wireTypes.lengthDelimited then
            if v449 == 1 then
                v451 = nil;
                v452, v453 = v0.readBuffer(v446, v448);
                v451 = v452;
                v448 = v453;
                table.insert(v447.array, v2.CatalogCategoryMenuTooltipInfo.decode(v451));
            else
                v451 = nil;
                v452, v453 = v0.readVarInt(v446, v448);
                v448 = v453 + v452;
            end;
        elseif v450 == v0.wireTypes.i32 then
            v451 = nil;
            v452, v453 = v0.readFixed32(v446, v448);
            v451 = v452;
            v448 = v453;
        elseif v450 == v0.wireTypes.i64 then
            v451 = nil;
            v452, v453 = v0.readFixed64(v446, v448);
            v451 = v452;
            v448 = v453;
        else
            error("Unsupported wire type: " .. v450);
        end;
    end;
    return v447;
end;
v7.jsonEncode = function(v454) --[[ Line: 3135 ]] --[[ Name: jsonEncode ]]
    local v455 = {};
    if v454.array ~= nil and #v454.array > 0 then
        local v456 = {};
        for _, v458 in v454.array do
            table.insert(v456, v458:jsonEncode());
        end;
        v455.array = v456;
    end;
    return v455;
end;
v7.jsonDecode = function(v459) --[[ Line: 3151 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_15 (copy), v2 (copy)
    local v460 = l_v7_15.new();
    if v459.array ~= nil then
        local v461 = {};
        for _, v463 in v459.array do
            table.insert(v461, v2.CatalogCategoryMenuTooltipInfo.jsonDecode(v463));
        end;
        v460.array = v461;
    end;
    return v460;
end;
v7.descriptor = {
    name = "ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogCategoryMenuTooltipInfo"
};
v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo = v7;
v1.default:register(v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo);
v7 = {};
v7.__index = v7;
local l_v7_16 = v7 --[[ copy: 7 -> 24 ]];
v7.new = function(v465) --[[ Line: 3187 ]] --[[ Name: new ]]
    -- upvalues: l_v7_16 (copy)
    return (setmetatable({
        kind = if not (v465 ~= nil) or v465.kind == nil then nil else v465.kind
    }, l_v7_16));
end;
v7.encode = function(v466) --[[ Line: 3195 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v467 = buffer.create(0);
    local v468 = 0;
    if v466.kind ~= nil then
        if v466.kind.type == "literal" then
            local v469 = v466.kind.value:encode();
            local v470, v471 = v0.writeTag(v467, v468, 1, v0.wireTypes.lengthDelimited);
            v470, v471 = v0.writeBuffer(v470, v471, v469, buffer.len(v469));
            v467 = v470;
            v468 = v471;
        elseif v466.kind.type == "binding_path" then
            local v472, v473 = v0.writeTag(v467, v468, 2, v0.wireTypes.lengthDelimited);
            v472, v473 = v0.writeString(v472, v473, v466.kind.value);
            v467 = v472;
            v468 = v473;
        elseif v466.kind.type == "conditional" then
            local v474 = v466.kind.value:encode();
            local v475, v476 = v0.writeTag(v467, v468, 3, v0.wireTypes.lengthDelimited);
            v475, v476 = v0.writeBuffer(v475, v476, v474, buffer.len(v474));
            v467 = v475;
            v468 = v476;
        end;
    end;
    local v477 = buffer.create(v468);
    buffer.copy(v477, 0, v467, 0, v468);
    return v477;
end;
v7.decode = function(v478) --[[ Line: 3219 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_16 (copy), v0 (copy), v2 (copy)
    local v479 = l_v7_16.new();
    local v480 = 0;
    while v480 < buffer.len(v478) do
        local v481 = nil;
        local v482 = nil;
        local v483, v484, v485 = v0.readTag(v478, v480);
        v481 = v483;
        v482 = v484;
        v480 = v485;
        if v482 == v0.wireTypes.varint then
            v483 = nil;
            v484, v485 = v0.readVarInt(v478, v480);
            v483 = v484;
            v480 = v485;
        elseif v482 == v0.wireTypes.lengthDelimited then
            if v481 == 1 then
                v483 = nil;
                v484, v485 = v0.readBuffer(v478, v480);
                v483 = v484;
                v480 = v485;
                v479.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton.decode(v483)
                };
            elseif v481 == 2 then
                v483 = nil;
                v484, v485 = v0.readBuffer(v478, v480);
                v483 = v484;
                v480 = v485;
                v479.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v483)
                };
            elseif v481 == 3 then
                v483 = nil;
                v484, v485 = v0.readBuffer(v478, v480);
                v483 = v484;
                v480 = v485;
                v479.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfCategoryMenuButtonProp_ConditionalOptions.decode(v483)
                };
            else
                v483 = nil;
                v484, v485 = v0.readVarInt(v478, v480);
                v480 = v485 + v484;
            end;
        elseif v482 == v0.wireTypes.i32 then
            v483 = nil;
            v484, v485 = v0.readFixed32(v478, v480);
            v483 = v484;
            v480 = v485;
        elseif v482 == v0.wireTypes.i64 then
            v483 = nil;
            v484, v485 = v0.readFixed64(v478, v480);
            v483 = v484;
            v480 = v485;
        else
            error("Unsupported wire type: " .. v482);
        end;
    end;
    return v479;
end;
v7.jsonEncode = function(v486) --[[ Line: 3278 ]] --[[ Name: jsonEncode ]]
    local v487 = {};
    if v486.kind ~= nil then
        if v486.kind.type == "literal" then
            v487.literal = v486.kind.value:jsonEncode();
            return v487;
        elseif v486.kind.type == "binding_path" then
            v487.bindingPath = v486.kind.value;
            return v487;
        elseif v486.kind.type == "conditional" then
            v487.conditional = v486.kind.value:jsonEncode();
        end;
    end;
    return v487;
end;
v7.jsonDecode = function(v488) --[[ Line: 3294 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_16 (copy), v2 (copy)
    local v489 = l_v7_16.new();
    if v488.literal ~= nil then
        v489.kind = {
            type = "literal", 
            value = v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton.jsonDecode(v488.literal)
        };
    end;
    if v488.binding_path ~= nil then
        v489.kind = {
            type = "binding_path", 
            value = v488.binding_path
        };
    end;
    if v488.bindingPath ~= nil then
        v489.kind = {
            type = "binding_path", 
            value = v488.bindingPath
        };
    end;
    if v488.conditional ~= nil then
        v489.kind = {
            type = "conditional", 
            value = v2.ArrayOfCategoryMenuButtonProp_ConditionalOptions.jsonDecode(v488.conditional)
        };
    end;
    return v489;
end;
v7.descriptor = {
    name = "ArrayOfCategoryMenuButtonProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCategoryMenuButtonProp"
};
v2.ArrayOfCategoryMenuButtonProp = v7;
v1.default:register(v2.ArrayOfCategoryMenuButtonProp);
v7 = {};
v7.__index = v7;
local l_v7_17 = v7 --[[ copy: 7 -> 25 ]];
v7.new = function(v491) --[[ Line: 3336 ]] --[[ Name: new ]]
    -- upvalues: l_v7_17 (copy)
    return (setmetatable({
        condition = if not (v491 ~= nil) or v491.condition == nil then nil else v491.condition, 
        kind = if not (v491 ~= nil) or v491.kind == nil then nil else v491.kind
    }, l_v7_17));
end;
v7.encode = function(v492) --[[ Line: 3345 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v493 = buffer.create(0);
    local v494 = 0;
    if v492.condition ~= nil then
        local v495 = v492.condition:encode();
        local v496, v497 = v0.writeTag(v493, v494, 1, v0.wireTypes.lengthDelimited);
        v496, v497 = v0.writeBuffer(v496, v497, v495, buffer.len(v495));
        v493 = v496;
        v494 = v497;
    end;
    if v492.kind ~= nil then
        if v492.kind.type == "literal" then
            local v498 = v492.kind.value:encode();
            local v499, v500 = v0.writeTag(v493, v494, 2, v0.wireTypes.lengthDelimited);
            v499, v500 = v0.writeBuffer(v499, v500, v498, buffer.len(v498));
            v493 = v499;
            v494 = v500;
        elseif v492.kind.type == "binding_path" then
            local v501, v502 = v0.writeTag(v493, v494, 3, v0.wireTypes.lengthDelimited);
            v501, v502 = v0.writeString(v501, v502, v492.kind.value);
            v493 = v501;
            v494 = v502;
        end;
    end;
    local v503 = buffer.create(v494);
    buffer.copy(v503, 0, v493, 0, v494);
    return v503;
end;
v7.decode = function(v504) --[[ Line: 3373 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_17 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v505 = l_v7_17.new();
    local v506 = 0;
    while v506 < buffer.len(v504) do
        local v507 = nil;
        local v508 = nil;
        local v509, v510, v511 = v0.readTag(v504, v506);
        v507 = v509;
        v508 = v510;
        v506 = v511;
        if v508 == v0.wireTypes.varint then
            v509 = nil;
            v510, v511 = v0.readVarInt(v504, v506);
            v509 = v510;
            v506 = v511;
        elseif v508 == v0.wireTypes.lengthDelimited then
            if v507 == 1 then
                v509 = nil;
                v510, v511 = v0.readBuffer(v504, v506);
                v509 = v510;
                v506 = v511;
                v505.condition = v5.PropCondition.decode(v509);
            elseif v507 == 2 then
                v509 = nil;
                v510, v511 = v0.readBuffer(v504, v506);
                v509 = v510;
                v506 = v511;
                v505.kind = {
                    type = "literal", 
                    value = v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton.decode(v509)
                };
            elseif v507 == 3 then
                v509 = nil;
                v510, v511 = v0.readBuffer(v504, v506);
                v509 = v510;
                v506 = v511;
                v505.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v509)
                };
            else
                v509 = nil;
                v510, v511 = v0.readVarInt(v504, v506);
                v506 = v511 + v510;
            end;
        elseif v508 == v0.wireTypes.i32 then
            v509 = nil;
            v510, v511 = v0.readFixed32(v504, v506);
            v509 = v510;
            v506 = v511;
        elseif v508 == v0.wireTypes.i64 then
            v509 = nil;
            v510, v511 = v0.readFixed64(v504, v506);
            v509 = v510;
            v506 = v511;
        else
            error("Unsupported wire type: " .. v508);
        end;
    end;
    return v505;
end;
v7.jsonEncode = function(v512) --[[ Line: 3431 ]] --[[ Name: jsonEncode ]]
    local v513 = {};
    if v512.condition ~= nil then
        v513.condition = v512.condition:jsonEncode();
    end;
    if v512.kind ~= nil then
        if v512.kind.type == "literal" then
            v513.literal = v512.kind.value:jsonEncode();
            return v513;
        elseif v512.kind.type == "binding_path" then
            v513.bindingPath = v512.kind.value;
        end;
    end;
    return v513;
end;
v7.jsonDecode = function(v514) --[[ Line: 3451 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_17 (copy), v5 (copy), v2 (copy)
    local v515 = l_v7_17.new();
    if v514.condition ~= nil then
        v515.condition = v5.PropCondition.jsonDecode(v514.condition);
    end;
    if v514.literal ~= nil then
        v515.kind = {
            type = "literal", 
            value = v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton.jsonDecode(v514.literal)
        };
    end;
    if v514.binding_path ~= nil then
        v515.kind = {
            type = "binding_path", 
            value = v514.binding_path
        };
    end;
    if v514.bindingPath ~= nil then
        v515.kind = {
            type = "binding_path", 
            value = v514.bindingPath
        };
    end;
    return v515;
end;
v7.descriptor = {
    name = "ArrayOfCategoryMenuButtonProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfCategoryMenuButtonProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfCategoryMenuButtonProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_18 = v7 --[[ copy: 7 -> 26 ]];
v7.new = function(v517) --[[ Line: 3495 ]] --[[ Name: new ]]
    -- upvalues: l_v7_18 (copy)
    return (setmetatable({
        options = if not (v517 ~= nil) or v517.options == nil then {} else v517.options
    }, l_v7_18));
end;
v7.encode = function(v518) --[[ Line: 3506 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v519 = buffer.create(0);
    local v520 = 0;
    if v518.options ~= nil and #v518.options > 0 then
        for _, v522 in v518.options do
            local v523 = v522:encode();
            local v524, v525 = v0.writeTag(v519, v520, 1, v0.wireTypes.lengthDelimited);
            v524, v525 = v0.writeBuffer(v524, v525, v523, buffer.len(v523));
            v519 = v524;
            v520 = v525;
        end;
    end;
    local v526 = buffer.create(v520);
    buffer.copy(v526, 0, v519, 0, v520);
    return v526;
end;
v7.decode = function(v527) --[[ Line: 3525 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_18 (copy), v0 (copy), v2 (copy)
    local v528 = l_v7_18.new();
    local v529 = 0;
    while v529 < buffer.len(v527) do
        local v530 = nil;
        local v531 = nil;
        local v532, v533, v534 = v0.readTag(v527, v529);
        v530 = v532;
        v531 = v533;
        v529 = v534;
        if v531 == v0.wireTypes.varint then
            v532 = nil;
            v533, v534 = v0.readVarInt(v527, v529);
            v532 = v533;
            v529 = v534;
        elseif v531 == v0.wireTypes.lengthDelimited then
            if v530 == 1 then
                v532 = nil;
                v533, v534 = v0.readBuffer(v527, v529);
                v532 = v533;
                v529 = v534;
                table.insert(v528.options, v2.ArrayOfCategoryMenuButtonProp_ConditionalOption.decode(v532));
            else
                v532 = nil;
                v533, v534 = v0.readVarInt(v527, v529);
                v529 = v534 + v533;
            end;
        elseif v531 == v0.wireTypes.i32 then
            v532 = nil;
            v533, v534 = v0.readFixed32(v527, v529);
            v532 = v533;
            v529 = v534;
        elseif v531 == v0.wireTypes.i64 then
            v532 = nil;
            v533, v534 = v0.readFixed64(v527, v529);
            v532 = v533;
            v529 = v534;
        else
            error("Unsupported wire type: " .. v531);
        end;
    end;
    return v528;
end;
v7.jsonEncode = function(v535) --[[ Line: 3570 ]] --[[ Name: jsonEncode ]]
    local v536 = {};
    if v535.options ~= nil and #v535.options > 0 then
        local v537 = {};
        for _, v539 in v535.options do
            table.insert(v537, v539:jsonEncode());
        end;
        v536.options = v537;
    end;
    return v536;
end;
v7.jsonDecode = function(v540) --[[ Line: 3586 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_18 (copy), v2 (copy)
    local v541 = l_v7_18.new();
    if v540.options ~= nil then
        local v542 = {};
        for _, v544 in v540.options do
            table.insert(v542, v2.ArrayOfCategoryMenuButtonProp_ConditionalOption.jsonDecode(v544));
        end;
        v541.options = v542;
    end;
    return v541;
end;
v7.descriptor = {
    name = "ArrayOfCategoryMenuButtonProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfCategoryMenuButtonProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfCategoryMenuButtonProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_19 = v7 --[[ copy: 7 -> 27 ]];
v7.new = function(v546) --[[ Line: 3619 ]] --[[ Name: new ]]
    -- upvalues: l_v7_19 (copy)
    return (setmetatable({
        array = if not (v546 ~= nil) or v546.array == nil then {} else v546.array
    }, l_v7_19));
end;
v7.encode = function(v547) --[[ Line: 3630 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v548 = buffer.create(0);
    local v549 = 0;
    if v547.array ~= nil and #v547.array > 0 then
        for _, v551 in v547.array do
            local v552 = v551:encode();
            local v553, v554 = v0.writeTag(v548, v549, 1, v0.wireTypes.lengthDelimited);
            v553, v554 = v0.writeBuffer(v553, v554, v552, buffer.len(v552));
            v548 = v553;
            v549 = v554;
        end;
    end;
    local v555 = buffer.create(v549);
    buffer.copy(v555, 0, v548, 0, v549);
    return v555;
end;
v7.decode = function(v556) --[[ Line: 3649 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_19 (copy), v0 (copy), v2 (copy)
    local v557 = l_v7_19.new();
    local v558 = 0;
    while v558 < buffer.len(v556) do
        local v559 = nil;
        local v560 = nil;
        local v561, v562, v563 = v0.readTag(v556, v558);
        v559 = v561;
        v560 = v562;
        v558 = v563;
        if v560 == v0.wireTypes.varint then
            v561 = nil;
            v562, v563 = v0.readVarInt(v556, v558);
            v561 = v562;
            v558 = v563;
        elseif v560 == v0.wireTypes.lengthDelimited then
            if v559 == 1 then
                v561 = nil;
                v562, v563 = v0.readBuffer(v556, v558);
                v561 = v562;
                v558 = v563;
                table.insert(v557.array, v2.CategoryMenuButton.decode(v561));
            else
                v561 = nil;
                v562, v563 = v0.readVarInt(v556, v558);
                v558 = v563 + v562;
            end;
        elseif v560 == v0.wireTypes.i32 then
            v561 = nil;
            v562, v563 = v0.readFixed32(v556, v558);
            v561 = v562;
            v558 = v563;
        elseif v560 == v0.wireTypes.i64 then
            v561 = nil;
            v562, v563 = v0.readFixed64(v556, v558);
            v561 = v562;
            v558 = v563;
        else
            error("Unsupported wire type: " .. v560);
        end;
    end;
    return v557;
end;
v7.jsonEncode = function(v564) --[[ Line: 3694 ]] --[[ Name: jsonEncode ]]
    local v565 = {};
    if v564.array ~= nil and #v564.array > 0 then
        local v566 = {};
        for _, v568 in v564.array do
            table.insert(v566, v568:jsonEncode());
        end;
        v565.array = v566;
    end;
    return v565;
end;
v7.jsonDecode = function(v569) --[[ Line: 3710 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_19 (copy), v2 (copy)
    local v570 = l_v7_19.new();
    if v569.array ~= nil then
        local v571 = {};
        for _, v573 in v569.array do
            table.insert(v571, v2.CategoryMenuButton.jsonDecode(v573));
        end;
        v570.array = v571;
    end;
    return v570;
end;
v7.descriptor = {
    name = "ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCategoryMenuButton"
};
v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton = v7;
v1.default:register(v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton);
v7 = {};
v7.__index = v7;
local l_v7_20 = v7 --[[ copy: 7 -> 28 ]];
v7.new = function(v575) --[[ Line: 3742 ]] --[[ Name: new ]]
    -- upvalues: l_v7_20 (copy)
    return (setmetatable({
        props = if not (v575 ~= nil) or v575.props == nil then nil else v575.props, 
        shared = if not (v575 ~= nil) or v575.shared == nil then nil else v575.shared
    }, l_v7_20));
end;
v7.encode = function(v576) --[[ Line: 3751 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v577 = buffer.create(0);
    local v578 = 0;
    if v576.props ~= nil then
        local v579 = v576.props:encode();
        local v580, v581 = v0.writeTag(v577, v578, 1, v0.wireTypes.lengthDelimited);
        v580, v581 = v0.writeBuffer(v580, v581, v579, buffer.len(v579));
        v577 = v580;
        v578 = v581;
    end;
    if v576.shared ~= nil then
        local v582 = v576.shared:encode();
        local v583, v584 = v0.writeTag(v577, v578, 2, v0.wireTypes.lengthDelimited);
        v583, v584 = v0.writeBuffer(v583, v584, v582, buffer.len(v582));
        v577 = v583;
        v578 = v584;
    end;
    local v585 = buffer.create(v578);
    buffer.copy(v585, 0, v577, 0, v578);
    return v585;
end;
v7.decode = function(v586) --[[ Line: 3772 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_20 (copy), v0 (copy), v2 (copy), v4 (copy)
    local v587 = l_v7_20.new();
    local v588 = 0;
    while v588 < buffer.len(v586) do
        local v589 = nil;
        local v590 = nil;
        local v591, v592, v593 = v0.readTag(v586, v588);
        v589 = v591;
        v590 = v592;
        v588 = v593;
        if v590 == v0.wireTypes.varint then
            v591 = nil;
            v592, v593 = v0.readVarInt(v586, v588);
            v591 = v592;
            v588 = v593;
        elseif v590 == v0.wireTypes.lengthDelimited then
            if v589 == 1 then
                v591 = nil;
                v592, v593 = v0.readBuffer(v586, v588);
                v591 = v592;
                v588 = v593;
                v587.props = v2.CatalogCategoryMenuSchema_Props.decode(v591);
            elseif v589 == 2 then
                v591 = nil;
                v592, v593 = v0.readBuffer(v586, v588);
                v591 = v592;
                v588 = v593;
                v587.shared = v4.ComponentShared.decode(v591);
            else
                v591 = nil;
                v592, v593 = v0.readVarInt(v586, v588);
                v588 = v593 + v592;
            end;
        elseif v590 == v0.wireTypes.i32 then
            v591 = nil;
            v592, v593 = v0.readFixed32(v586, v588);
            v591 = v592;
            v588 = v593;
        elseif v590 == v0.wireTypes.i64 then
            v591 = nil;
            v592, v593 = v0.readFixed64(v586, v588);
            v591 = v592;
            v588 = v593;
        else
            error("Unsupported wire type: " .. v590);
        end;
    end;
    return v587;
end;
v7.jsonEncode = function(v594) --[[ Line: 3820 ]] --[[ Name: jsonEncode ]]
    local v595 = {};
    if v594.props ~= nil then
        v595.props = v594.props:jsonEncode();
    end;
    if v594.shared ~= nil then
        v595.shared = v594.shared:jsonEncode();
    end;
    return v595;
end;
v7.jsonDecode = function(v596) --[[ Line: 3834 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_20 (copy), v2 (copy), v4 (copy)
    local v597 = l_v7_20.new();
    if v596.props ~= nil then
        v597.props = v2.CatalogCategoryMenuSchema_Props.jsonDecode(v596.props);
    end;
    if v596.shared ~= nil then
        v597.shared = v4.ComponentShared.jsonDecode(v596.shared);
    end;
    return v597;
end;
v7.descriptor = {
    name = "CatalogCategoryMenuSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogCategoryMenuSchema"
};
v2.CatalogCategoryMenuSchema = v7;
v1.default:register(v2.CatalogCategoryMenuSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v598) --[[ Line: 3863 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        categories = if not (v598 ~= nil) or v598.categories == nil then nil else v598.categories, 
        active_category_id = if not (v598 ~= nil) or v598.active_category_id == nil then nil else v598.active_category_id, 
        on_category_activated = if not (v598 ~= nil) or v598.on_category_activated == nil then nil else v598.on_category_activated, 
        on_subcategory_activated = if not (v598 ~= nil) or v598.on_subcategory_activated == nil then nil else v598.on_subcategory_activated, 
        buttons = if not (v598 ~= nil) or v598.buttons == nil then nil else v598.buttons, 
        buttons_location = if not (v598 ~= nil) or v598.buttons_location == nil then nil else v598.buttons_location, 
        tooltips = if not (v598 ~= nil) or v598.tooltips == nil then nil else v598.tooltips, 
        active_tooltip_idx = if not (v598 ~= nil) or v598.active_tooltip_idx == nil then nil else v598.active_tooltip_idx, 
        position = if not (v598 ~= nil) or v598.position == nil then nil else v598.position, 
        layout_order = if not (v598 ~= nil) or v598.layout_order == nil then nil else v598.layout_order, 
        z_index = if not (v598 ~= nil) or v598.z_index == nil then nil else v598.z_index
    }, v7));
end;
v7.encode = function(v599) --[[ Line: 3885 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v600 = buffer.create(0);
    local v601 = 0;
    if v599.categories ~= nil then
        local v602 = v599.categories:encode();
        local v603, v604 = v0.writeTag(v600, v601, 1, v0.wireTypes.lengthDelimited);
        v603, v604 = v0.writeBuffer(v603, v604, v602, buffer.len(v602));
        v600 = v603;
        v601 = v604;
    end;
    if v599.active_category_id ~= nil then
        local v605 = v599.active_category_id:encode();
        local v606, v607 = v0.writeTag(v600, v601, 2, v0.wireTypes.lengthDelimited);
        v606, v607 = v0.writeBuffer(v606, v607, v605, buffer.len(v605));
        v600 = v606;
        v601 = v607;
    end;
    if v599.on_category_activated ~= nil then
        local v608 = v599.on_category_activated:encode();
        local v609, v610 = v0.writeTag(v600, v601, 3, v0.wireTypes.lengthDelimited);
        v609, v610 = v0.writeBuffer(v609, v610, v608, buffer.len(v608));
        v600 = v609;
        v601 = v610;
    end;
    if v599.on_subcategory_activated ~= nil then
        local v611 = v599.on_subcategory_activated:encode();
        local v612, v613 = v0.writeTag(v600, v601, 4, v0.wireTypes.lengthDelimited);
        v612, v613 = v0.writeBuffer(v612, v613, v611, buffer.len(v611));
        v600 = v612;
        v601 = v613;
    end;
    if v599.buttons ~= nil then
        local v614 = v599.buttons:encode();
        local v615, v616 = v0.writeTag(v600, v601, 5, v0.wireTypes.lengthDelimited);
        v615, v616 = v0.writeBuffer(v615, v616, v614, buffer.len(v614));
        v600 = v615;
        v601 = v616;
    end;
    if v599.buttons_location ~= nil then
        local v617 = v599.buttons_location:encode();
        local v618, v619 = v0.writeTag(v600, v601, 6, v0.wireTypes.lengthDelimited);
        v618, v619 = v0.writeBuffer(v618, v619, v617, buffer.len(v617));
        v600 = v618;
        v601 = v619;
    end;
    if v599.tooltips ~= nil then
        local v620 = v599.tooltips:encode();
        local v621, v622 = v0.writeTag(v600, v601, 7, v0.wireTypes.lengthDelimited);
        v621, v622 = v0.writeBuffer(v621, v622, v620, buffer.len(v620));
        v600 = v621;
        v601 = v622;
    end;
    if v599.active_tooltip_idx ~= nil then
        local v623 = v599.active_tooltip_idx:encode();
        local v624, v625 = v0.writeTag(v600, v601, 8, v0.wireTypes.lengthDelimited);
        v624, v625 = v0.writeBuffer(v624, v625, v623, buffer.len(v623));
        v600 = v624;
        v601 = v625;
    end;
    if v599.position ~= nil then
        local v626 = v599.position:encode();
        local v627, v628 = v0.writeTag(v600, v601, 21, v0.wireTypes.lengthDelimited);
        v627, v628 = v0.writeBuffer(v627, v628, v626, buffer.len(v626));
        v600 = v627;
        v601 = v628;
    end;
    if v599.layout_order ~= nil then
        local v629 = v599.layout_order:encode();
        local v630, v631 = v0.writeTag(v600, v601, 22, v0.wireTypes.lengthDelimited);
        v630, v631 = v0.writeBuffer(v630, v631, v629, buffer.len(v629));
        v600 = v630;
        v601 = v631;
    end;
    if v599.z_index ~= nil then
        local v632 = v599.z_index:encode();
        local v633, v634 = v0.writeTag(v600, v601, 23, v0.wireTypes.lengthDelimited);
        v633, v634 = v0.writeBuffer(v633, v634, v632, buffer.len(v632));
        v600 = v633;
        v601 = v634;
    end;
    local v635 = buffer.create(v601);
    buffer.copy(v635, 0, v600, 0, v601);
    return v635;
end;
v7.decode = function(v636) --[[ Line: 3960 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v637 = v7.new();
    local v638 = 0;
    while v638 < buffer.len(v636) do
        local v639 = nil;
        local v640 = nil;
        local v641, v642, v643 = v0.readTag(v636, v638);
        v639 = v641;
        v640 = v642;
        v638 = v643;
        if v640 == v0.wireTypes.varint then
            v641 = nil;
            v642, v643 = v0.readVarInt(v636, v638);
            v641 = v642;
            v638 = v643;
        elseif v640 == v0.wireTypes.lengthDelimited then
            if v639 == 1 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.categories = v2.ArrayOfCatalogCategoryMenuItemProp.decode(v641);
            elseif v639 == 2 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.active_category_id = v6.StringProp.decode(v641);
            elseif v639 == 3 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.on_category_activated = v3.ActionProp.decode(v641);
            elseif v639 == 4 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.on_subcategory_activated = v3.ActionProp.decode(v641);
            elseif v639 == 5 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.buttons = v2.ArrayOfCategoryMenuButtonProp.decode(v641);
            elseif v639 == 6 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.buttons_location = v6.StringProp.decode(v641);
            elseif v639 == 7 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.tooltips = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp.decode(v641);
            elseif v639 == 8 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.active_tooltip_idx = v6.Int32Prop.decode(v641);
            elseif v639 == 21 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.position = v6.UiScaledUDim2Prop.decode(v641);
            elseif v639 == 22 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.layout_order = v6.Int32Prop.decode(v641);
            elseif v639 == 23 then
                v641 = nil;
                v642, v643 = v0.readBuffer(v636, v638);
                v641 = v642;
                v638 = v643;
                v637.z_index = v6.Int32Prop.decode(v641);
            else
                v641 = nil;
                v642, v643 = v0.readVarInt(v636, v638);
                v638 = v643 + v642;
            end;
        elseif v640 == v0.wireTypes.i32 then
            v641 = nil;
            v642, v643 = v0.readFixed32(v636, v638);
            v641 = v642;
            v638 = v643;
        elseif v640 == v0.wireTypes.i64 then
            v641 = nil;
            v642, v643 = v0.readFixed64(v636, v638);
            v641 = v642;
            v638 = v643;
        else
            error("Unsupported wire type: " .. v640);
        end;
    end;
    return v637;
end;
v7.jsonEncode = function(v644) --[[ Line: 4054 ]] --[[ Name: jsonEncode ]]
    local v645 = {};
    if v644.categories ~= nil then
        v645.categories = v644.categories:jsonEncode();
    end;
    if v644.active_category_id ~= nil then
        v645.activeCategoryId = v644.active_category_id:jsonEncode();
    end;
    if v644.on_category_activated ~= nil then
        v645.onCategoryActivated = v644.on_category_activated:jsonEncode();
    end;
    if v644.on_subcategory_activated ~= nil then
        v645.onSubcategoryActivated = v644.on_subcategory_activated:jsonEncode();
    end;
    if v644.buttons ~= nil then
        v645.buttons = v644.buttons:jsonEncode();
    end;
    if v644.buttons_location ~= nil then
        v645.buttonsLocation = v644.buttons_location:jsonEncode();
    end;
    if v644.tooltips ~= nil then
        v645.tooltips = v644.tooltips:jsonEncode();
    end;
    if v644.active_tooltip_idx ~= nil then
        v645.activeTooltipIdx = v644.active_tooltip_idx:jsonEncode();
    end;
    if v644.position ~= nil then
        v645.position = v644.position:jsonEncode();
    end;
    if v644.layout_order ~= nil then
        v645.layoutOrder = v644.layout_order:jsonEncode();
    end;
    if v644.z_index ~= nil then
        v645.zIndex = v644.z_index:jsonEncode();
    end;
    return v645;
end;
v7.jsonDecode = function(v646) --[[ Line: 4104 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v647 = v7.new();
    if v646.categories ~= nil then
        v647.categories = v2.ArrayOfCatalogCategoryMenuItemProp.jsonDecode(v646.categories);
    end;
    if v646.active_category_id ~= nil then
        v647.active_category_id = v6.StringProp.jsonDecode(v646.active_category_id);
    end;
    if v646.activeCategoryId ~= nil then
        v647.active_category_id = v6.StringProp.jsonDecode(v646.activeCategoryId);
    end;
    if v646.on_category_activated ~= nil then
        v647.on_category_activated = v3.ActionProp.jsonDecode(v646.on_category_activated);
    end;
    if v646.onCategoryActivated ~= nil then
        v647.on_category_activated = v3.ActionProp.jsonDecode(v646.onCategoryActivated);
    end;
    if v646.on_subcategory_activated ~= nil then
        v647.on_subcategory_activated = v3.ActionProp.jsonDecode(v646.on_subcategory_activated);
    end;
    if v646.onSubcategoryActivated ~= nil then
        v647.on_subcategory_activated = v3.ActionProp.jsonDecode(v646.onSubcategoryActivated);
    end;
    if v646.buttons ~= nil then
        v647.buttons = v2.ArrayOfCategoryMenuButtonProp.jsonDecode(v646.buttons);
    end;
    if v646.buttons_location ~= nil then
        v647.buttons_location = v6.StringProp.jsonDecode(v646.buttons_location);
    end;
    if v646.buttonsLocation ~= nil then
        v647.buttons_location = v6.StringProp.jsonDecode(v646.buttonsLocation);
    end;
    if v646.tooltips ~= nil then
        v647.tooltips = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp.jsonDecode(v646.tooltips);
    end;
    if v646.active_tooltip_idx ~= nil then
        v647.active_tooltip_idx = v6.Int32Prop.jsonDecode(v646.active_tooltip_idx);
    end;
    if v646.activeTooltipIdx ~= nil then
        v647.active_tooltip_idx = v6.Int32Prop.jsonDecode(v646.activeTooltipIdx);
    end;
    if v646.position ~= nil then
        v647.position = v6.UiScaledUDim2Prop.jsonDecode(v646.position);
    end;
    if v646.layout_order ~= nil then
        v647.layout_order = v6.Int32Prop.jsonDecode(v646.layout_order);
    end;
    if v646.layoutOrder ~= nil then
        v647.layout_order = v6.Int32Prop.jsonDecode(v646.layoutOrder);
    end;
    if v646.z_index ~= nil then
        v647.z_index = v6.Int32Prop.jsonDecode(v646.z_index);
    end;
    if v646.zIndex ~= nil then
        v647.z_index = v6.Int32Prop.jsonDecode(v646.zIndex);
    end;
    return v647;
end;
v7.descriptor = {
    name = "CatalogCategoryMenuSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CatalogCategoryMenuSchema_Props = v7;
v1.default:register(v2.CatalogCategoryMenuSchema_Props);
return {
    TooltipInfoActionProps = v2.TooltipInfoActionProps, 
    ArrayOfTooltipInfoActionsProp = v2.ArrayOfTooltipInfoActionsProp, 
    ArrayOfTooltipInfoActionsProp_ConditionalOption = v2.ArrayOfTooltipInfoActionsProp_ConditionalOption, 
    ArrayOfTooltipInfoActionsProp_ConditionalOptions = v2.ArrayOfTooltipInfoActionsProp_ConditionalOptions, 
    ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions = v2.ArrayOfTooltipInfoActionsProp_ArrayOfTooltipInfoActions, 
    CatalogCategoryMenuTooltipInfo = v2.CatalogCategoryMenuTooltipInfo, 
    CatalogCategoryMenuItem = v2.CatalogCategoryMenuItem, 
    CategoryMenuButton = v2.CategoryMenuButton, 
    ArrayOfCatalogCategoryMenuItemProp = v2.ArrayOfCatalogCategoryMenuItemProp, 
    ArrayOfCatalogCategoryMenuItemProp_ConditionalOption = v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOption, 
    ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions = v2.ArrayOfCatalogCategoryMenuItemProp_ConditionalOptions, 
    ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem = v2.ArrayOfCatalogCategoryMenuItemProp_ArrayOfCatalogCategoryMenuItem, 
    ArrayOfCatalogCategoryMenuTooltipInfoProp = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp, 
    ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOption, 
    ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ConditionalOptions, 
    ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo = v2.ArrayOfCatalogCategoryMenuTooltipInfoProp_ArrayOfCatalogCategoryMenuTooltipInfo, 
    ArrayOfCategoryMenuButtonProp = v2.ArrayOfCategoryMenuButtonProp, 
    ArrayOfCategoryMenuButtonProp_ConditionalOption = v2.ArrayOfCategoryMenuButtonProp_ConditionalOption, 
    ArrayOfCategoryMenuButtonProp_ConditionalOptions = v2.ArrayOfCategoryMenuButtonProp_ConditionalOptions, 
    ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton = v2.ArrayOfCategoryMenuButtonProp_ArrayOfCategoryMenuButton, 
    CatalogCategoryMenuSchema = v2.CatalogCategoryMenuSchema, 
    CatalogCategoryMenuSchema_Props = v2.CatalogCategoryMenuSchema_Props
};