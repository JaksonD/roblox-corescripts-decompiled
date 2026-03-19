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
v7.new = function(v9) --[[ Line: 487 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        kind = if not (v9 ~= nil) or v9.kind == nil then nil else v9.kind
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 493 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.kind ~= nil then
        if v10.kind.type == "literal" then
            local v13 = v10.kind.value:encode();
            local v14, v15 = v0.writeTag(v11, v12, 1, v0.wireTypes.lengthDelimited);
            v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
            v11 = v14;
            v12 = v15;
        elseif v10.kind.type == "binding_path" then
            local v16, v17 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
            v16, v17 = v0.writeString(v16, v17, v10.kind.value);
            v11 = v16;
            v12 = v17;
        elseif v10.kind.type == "conditional" then
            local v18 = v10.kind.value:encode();
            local v19, v20 = v0.writeTag(v11, v12, 3, v0.wireTypes.lengthDelimited);
            v19, v20 = v0.writeBuffer(v19, v20, v18, buffer.len(v18));
            v11 = v19;
            v12 = v20;
        end;
    end;
    local v21 = buffer.create(v12);
    buffer.copy(v21, 0, v11, 0, v12);
    return v21;
end;
v7.decode = function(v22) --[[ Line: 517 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v2 (copy)
    local v23 = l_v7_0.new();
    local v24 = 0;
    while v24 < buffer.len(v22) do
        local v25 = nil;
        local v26 = nil;
        local v27, v28, v29 = v0.readTag(v22, v24);
        v25 = v27;
        v26 = v28;
        v24 = v29;
        if v26 == v0.wireTypes.varint then
            v27 = nil;
            v28, v29 = v0.readVarInt(v22, v24);
            v27 = v28;
            v24 = v29;
        elseif v26 == v0.wireTypes.lengthDelimited then
            if v25 == 1 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "literal", 
                    value = v2.TabItemIconData_TabItemIconOrString.decode(v27)
                };
            elseif v25 == 2 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v27)
                };
            elseif v25 == 3 then
                v27 = nil;
                v28, v29 = v0.readBuffer(v22, v24);
                v27 = v28;
                v24 = v29;
                v23.kind = {
                    type = "conditional", 
                    value = v2.TabItemIconData_ConditionalOptions.decode(v27)
                };
            else
                v27 = nil;
                v28, v29 = v0.readVarInt(v22, v24);
                v24 = v29 + v28;
            end;
        elseif v26 == v0.wireTypes.i32 then
            v27 = nil;
            v28, v29 = v0.readFixed32(v22, v24);
            v27 = v28;
            v24 = v29;
        elseif v26 == v0.wireTypes.i64 then
            v27 = nil;
            v28, v29 = v0.readFixed64(v22, v24);
            v27 = v28;
            v24 = v29;
        else
            error("Unsupported wire type: " .. v26);
        end;
    end;
    return v23;
end;
v7.jsonEncode = function(v30) --[[ Line: 571 ]] --[[ Name: jsonEncode ]]
    local v31 = {};
    if v30.kind ~= nil then
        if v30.kind.type == "literal" then
            v31.literal = v30.kind.value:jsonEncode();
            return v31;
        elseif v30.kind.type == "binding_path" then
            v31.bindingPath = v30.kind.value;
            return v31;
        elseif v30.kind.type == "conditional" then
            v31.conditional = v30.kind.value:jsonEncode();
        end;
    end;
    return v31;
end;
v7.jsonDecode = function(v32) --[[ Line: 587 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy)
    local v33 = l_v7_0.new();
    if v32.literal ~= nil then
        v33.kind = {
            type = "literal", 
            value = v2.TabItemIconData_TabItemIconOrString.jsonDecode(v32.literal)
        };
    end;
    if v32.binding_path ~= nil then
        v33.kind = {
            type = "binding_path", 
            value = v32.binding_path
        };
    end;
    if v32.bindingPath ~= nil then
        v33.kind = {
            type = "binding_path", 
            value = v32.bindingPath
        };
    end;
    if v32.conditional ~= nil then
        v33.kind = {
            type = "conditional", 
            value = v2.TabItemIconData_ConditionalOptions.jsonDecode(v32.conditional)
        };
    end;
    return v33;
end;
v7.descriptor = {
    name = "TabItemIconData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabItemIconData"
};
v2.TabItemIconData = v7;
v1.default:register(v2.TabItemIconData);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v35) --[[ Line: 627 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        condition = if not (v35 ~= nil) or v35.condition == nil then nil else v35.condition, 
        kind = if not (v35 ~= nil) or v35.kind == nil then nil else v35.kind
    }, l_v7_1));
end;
v7.encode = function(v36) --[[ Line: 636 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v37 = buffer.create(0);
    local v38 = 0;
    if v36.condition ~= nil then
        local v39 = v36.condition:encode();
        local v40, v41 = v0.writeTag(v37, v38, 1, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v37 = v40;
        v38 = v41;
    end;
    if v36.kind ~= nil then
        if v36.kind.type == "literal" then
            local v42 = v36.kind.value:encode();
            local v43, v44 = v0.writeTag(v37, v38, 2, v0.wireTypes.lengthDelimited);
            v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
            v37 = v43;
            v38 = v44;
        elseif v36.kind.type == "binding_path" then
            local v45, v46 = v0.writeTag(v37, v38, 3, v0.wireTypes.lengthDelimited);
            v45, v46 = v0.writeString(v45, v46, v36.kind.value);
            v37 = v45;
            v38 = v46;
        end;
    end;
    local v47 = buffer.create(v38);
    buffer.copy(v47, 0, v37, 0, v38);
    return v47;
end;
v7.decode = function(v48) --[[ Line: 662 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v49 = l_v7_1.new();
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
                v49.condition = v5.PropCondition.decode(v53);
            elseif v51 == 2 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.kind = {
                    type = "literal", 
                    value = v2.TabItemIconData_TabItemIconOrString.decode(v53)
                };
            elseif v51 == 3 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v53)
                };
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
v7.jsonEncode = function(v56) --[[ Line: 715 ]] --[[ Name: jsonEncode ]]
    local v57 = {};
    if v56.condition ~= nil then
        v57.condition = v56.condition:jsonEncode();
    end;
    if v56.kind ~= nil then
        if v56.kind.type == "literal" then
            v57.literal = v56.kind.value:jsonEncode();
            return v57;
        elseif v56.kind.type == "binding_path" then
            v57.bindingPath = v56.kind.value;
        end;
    end;
    return v57;
end;
v7.jsonDecode = function(v58) --[[ Line: 733 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy), v5 (copy), v2 (copy)
    local v59 = l_v7_1.new();
    if v58.condition ~= nil then
        v59.condition = v5.PropCondition.jsonDecode(v58.condition);
    end;
    if v58.literal ~= nil then
        v59.kind = {
            type = "literal", 
            value = v2.TabItemIconData_TabItemIconOrString.jsonDecode(v58.literal)
        };
    end;
    if v58.binding_path ~= nil then
        v59.kind = {
            type = "binding_path", 
            value = v58.binding_path
        };
    end;
    if v58.bindingPath ~= nil then
        v59.kind = {
            type = "binding_path", 
            value = v58.bindingPath
        };
    end;
    return v59;
end;
v7.descriptor = {
    name = "TabItemIconData_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TabItemIconData_ConditionalOption = v7;
v1.default:register(v2.TabItemIconData_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v61) --[[ Line: 773 ]] --[[ Name: new ]]
    -- upvalues: l_v7_2 (copy)
    return (setmetatable({
        options = if not (v61 ~= nil) or v61.options == nil then {} else v61.options
    }, l_v7_2));
end;
v7.encode = function(v62) --[[ Line: 781 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v63 = buffer.create(0);
    local v64 = 0;
    if v62.options ~= nil and #v62.options > 0 then
        for _, v66 in v62.options do
            local v67 = v66:encode();
            local v68, v69 = v0.writeTag(v63, v64, 1, v0.wireTypes.lengthDelimited);
            v68, v69 = v0.writeBuffer(v68, v69, v67, buffer.len(v67));
            v63 = v68;
            v64 = v69;
        end;
    end;
    local v70 = buffer.create(v64);
    buffer.copy(v70, 0, v63, 0, v64);
    return v70;
end;
v7.decode = function(v71) --[[ Line: 798 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_2 (copy), v0 (copy), v2 (copy)
    local v72 = l_v7_2.new();
    local v73 = 0;
    while v73 < buffer.len(v71) do
        local v74 = nil;
        local v75 = nil;
        local v76, v77, v78 = v0.readTag(v71, v73);
        v74 = v76;
        v75 = v77;
        v73 = v78;
        if v75 == v0.wireTypes.varint then
            v76 = nil;
            v77, v78 = v0.readVarInt(v71, v73);
            v76 = v77;
            v73 = v78;
        elseif v75 == v0.wireTypes.lengthDelimited then
            if v74 == 1 then
                v76 = nil;
                v77, v78 = v0.readBuffer(v71, v73);
                v76 = v77;
                v73 = v78;
                table.insert(v72.options, v2.TabItemIconData_ConditionalOption.decode(v76));
            else
                v76 = nil;
                v77, v78 = v0.readVarInt(v71, v73);
                v73 = v78 + v77;
            end;
        elseif v75 == v0.wireTypes.i32 then
            v76 = nil;
            v77, v78 = v0.readFixed32(v71, v73);
            v76 = v77;
            v73 = v78;
        elseif v75 == v0.wireTypes.i64 then
            v76 = nil;
            v77, v78 = v0.readFixed64(v71, v73);
            v76 = v77;
            v73 = v78;
        else
            error("Unsupported wire type: " .. v75);
        end;
    end;
    return v72;
end;
v7.jsonEncode = function(v79) --[[ Line: 841 ]] --[[ Name: jsonEncode ]]
    local v80 = {};
    if v79.options ~= nil and #v79.options > 0 then
        local v81 = {};
        for _, v83 in v79.options do
            table.insert(v81, v83:jsonEncode());
        end;
        v80.options = v81;
    end;
    return v80;
end;
v7.jsonDecode = function(v84) --[[ Line: 855 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v2 (copy)
    local v85 = l_v7_2.new();
    if v84.options ~= nil then
        local v86 = {};
        for _, v88 in v84.options do
            table.insert(v86, v2.TabItemIconData_ConditionalOption.jsonDecode(v88));
        end;
        v85.options = v86;
    end;
    return v85;
end;
v7.descriptor = {
    name = "TabItemIconData_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TabItemIconData_ConditionalOptions = v7;
v1.default:register(v2.TabItemIconData_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v90) --[[ Line: 886 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        name = if not (v90 ~= nil) or v90.name == nil then nil else v90.name, 
        variant = if not (v90 ~= nil) or v90.variant == nil then nil else v90.variant
    }, l_v7_3));
end;
v7.encode = function(v91) --[[ Line: 895 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v92 = buffer.create(0);
    local v93 = 0;
    if v91.name ~= nil then
        local v94 = v91.name:encode();
        local v95, v96 = v0.writeTag(v92, v93, 1, v0.wireTypes.lengthDelimited);
        v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
        v92 = v95;
        v93 = v96;
    end;
    if v91.variant ~= nil then
        local v97 = v91.variant:encode();
        local v98, v99 = v0.writeTag(v92, v93, 2, v0.wireTypes.lengthDelimited);
        v98, v99 = v0.writeBuffer(v98, v99, v97, buffer.len(v97));
        v92 = v98;
        v93 = v99;
    end;
    local v100 = buffer.create(v93);
    buffer.copy(v100, 0, v92, 0, v93);
    return v100;
end;
v7.decode = function(v101) --[[ Line: 916 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v6 (copy)
    local v102 = l_v7_3.new();
    local v103 = 0;
    while v103 < buffer.len(v101) do
        local v104 = nil;
        local v105 = nil;
        local v106, v107, v108 = v0.readTag(v101, v103);
        v104 = v106;
        v105 = v107;
        v103 = v108;
        if v105 == v0.wireTypes.varint then
            v106 = nil;
            v107, v108 = v0.readVarInt(v101, v103);
            v106 = v107;
            v103 = v108;
        elseif v105 == v0.wireTypes.lengthDelimited then
            if v104 == 1 then
                v106 = nil;
                v107, v108 = v0.readBuffer(v101, v103);
                v106 = v107;
                v103 = v108;
                v102.name = v6.StringProp.decode(v106);
            elseif v104 == 2 then
                v106 = nil;
                v107, v108 = v0.readBuffer(v101, v103);
                v106 = v107;
                v103 = v108;
                v102.variant = v6.StringProp.decode(v106);
            else
                v106 = nil;
                v107, v108 = v0.readVarInt(v101, v103);
                v103 = v108 + v107;
            end;
        elseif v105 == v0.wireTypes.i32 then
            v106 = nil;
            v107, v108 = v0.readFixed32(v101, v103);
            v106 = v107;
            v103 = v108;
        elseif v105 == v0.wireTypes.i64 then
            v106 = nil;
            v107, v108 = v0.readFixed64(v101, v103);
            v106 = v107;
            v103 = v108;
        else
            error("Unsupported wire type: " .. v105);
        end;
    end;
    return v102;
end;
v7.jsonEncode = function(v109) --[[ Line: 964 ]] --[[ Name: jsonEncode ]]
    local v110 = {};
    if v109.name ~= nil then
        v110.name = v109.name:jsonEncode();
    end;
    if v109.variant ~= nil then
        v110.variant = v109.variant:jsonEncode();
    end;
    return v110;
end;
v7.jsonDecode = function(v111) --[[ Line: 978 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v6 (copy)
    local v112 = l_v7_3.new();
    if v111.name ~= nil then
        v112.name = v6.StringProp.jsonDecode(v111.name);
    end;
    if v111.variant ~= nil then
        v112.variant = v6.StringProp.jsonDecode(v111.variant);
    end;
    return v112;
end;
v7.descriptor = {
    name = "TabItemIconData_TabItemIcon", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabItemIcon"
};
v2.TabItemIconData_TabItemIcon = v7;
v1.default:register(v2.TabItemIconData_TabItemIcon);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v114) --[[ Line: 1006 ]] --[[ Name: new ]]
    -- upvalues: l_v7_4 (copy)
    return (setmetatable({
        oneof_prop = if not (v114 ~= nil) or v114.oneof_prop == nil then nil else v114.oneof_prop
    }, l_v7_4));
end;
v7.encode = function(v115) --[[ Line: 1014 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v116 = buffer.create(0);
    local v117 = 0;
    if v115.oneof_prop ~= nil then
        if v115.oneof_prop.type == "tab_item_icon" then
            local v118 = v115.oneof_prop.value:encode();
            local v119, v120 = v0.writeTag(v116, v117, 1, v0.wireTypes.lengthDelimited);
            v119, v120 = v0.writeBuffer(v119, v120, v118, buffer.len(v118));
            v116 = v119;
            v117 = v120;
        elseif v115.oneof_prop.type == "tab_item_name" then
            local v121 = v115.oneof_prop.value:encode();
            local v122, v123 = v0.writeTag(v116, v117, 2, v0.wireTypes.lengthDelimited);
            v122, v123 = v0.writeBuffer(v122, v123, v121, buffer.len(v121));
            v116 = v122;
            v117 = v123;
        end;
    end;
    local v124 = buffer.create(v117);
    buffer.copy(v124, 0, v116, 0, v117);
    return v124;
end;
v7.decode = function(v125) --[[ Line: 1035 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v2 (copy), v6 (copy)
    local v126 = l_v7_4.new();
    local v127 = 0;
    while v127 < buffer.len(v125) do
        local v128 = nil;
        local v129 = nil;
        local v130, v131, v132 = v0.readTag(v125, v127);
        v128 = v130;
        v129 = v131;
        v127 = v132;
        if v129 == v0.wireTypes.varint then
            v130 = nil;
            v131, v132 = v0.readVarInt(v125, v127);
            v130 = v131;
            v127 = v132;
        elseif v129 == v0.wireTypes.lengthDelimited then
            if v128 == 1 then
                v130 = nil;
                v131, v132 = v0.readBuffer(v125, v127);
                v130 = v131;
                v127 = v132;
                v126.oneof_prop = {
                    type = "tab_item_icon", 
                    value = v2.TabItemIconData_TabItemIcon.decode(v130)
                };
            elseif v128 == 2 then
                v130 = nil;
                v131, v132 = v0.readBuffer(v125, v127);
                v130 = v131;
                v127 = v132;
                v126.oneof_prop = {
                    type = "tab_item_name", 
                    value = v6.StringProp.decode(v130)
                };
            else
                v130 = nil;
                v131, v132 = v0.readVarInt(v125, v127);
                v127 = v132 + v131;
            end;
        elseif v129 == v0.wireTypes.i32 then
            v130 = nil;
            v131, v132 = v0.readFixed32(v125, v127);
            v130 = v131;
            v127 = v132;
        elseif v129 == v0.wireTypes.i64 then
            v130 = nil;
            v131, v132 = v0.readFixed64(v125, v127);
            v130 = v131;
            v127 = v132;
        else
            error("Unsupported wire type: " .. v129);
        end;
    end;
    return v126;
end;
v7.jsonEncode = function(v133) --[[ Line: 1087 ]] --[[ Name: jsonEncode ]]
    local v134 = {};
    if v133.oneof_prop ~= nil then
        if v133.oneof_prop.type == "tab_item_icon" then
            v134.tabItemIcon = v133.oneof_prop.value:jsonEncode();
            return v134;
        elseif v133.oneof_prop.type == "tab_item_name" then
            v134.tabItemName = v133.oneof_prop.value:jsonEncode();
        end;
    end;
    return v134;
end;
v7.jsonDecode = function(v135) --[[ Line: 1101 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy), v6 (copy)
    local v136 = l_v7_4.new();
    if v135.tab_item_icon ~= nil then
        v136.oneof_prop = {
            type = "tab_item_icon", 
            value = v2.TabItemIconData_TabItemIcon.jsonDecode(v135.tab_item_icon)
        };
    end;
    if v135.tabItemIcon ~= nil then
        v136.oneof_prop = {
            type = "tab_item_icon", 
            value = v2.TabItemIconData_TabItemIcon.jsonDecode(v135.tabItemIcon)
        };
    end;
    if v135.tab_item_name ~= nil then
        v136.oneof_prop = {
            type = "tab_item_name", 
            value = v6.StringProp.jsonDecode(v135.tab_item_name)
        };
    end;
    if v135.tabItemName ~= nil then
        v136.oneof_prop = {
            type = "tab_item_name", 
            value = v6.StringProp.jsonDecode(v135.tabItemName)
        };
    end;
    return v136;
end;
v7.descriptor = {
    name = "TabItemIconData_TabItemIconOrString", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabItemIconOrString"
};
v2.TabItemIconData_TabItemIconOrString = v7;
v1.default:register(v2.TabItemIconData_TabItemIconOrString);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v138) --[[ Line: 1147 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        kind = if not (v138 ~= nil) or v138.kind == nil then nil else v138.kind
    }, l_v7_5));
end;
v7.encode = function(v139) --[[ Line: 1153 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v140 = buffer.create(0);
    local v141 = 0;
    if v139.kind ~= nil then
        if v139.kind.type == "literal" then
            local v142 = v139.kind.value:encode();
            local v143, v144 = v0.writeTag(v140, v141, 1, v0.wireTypes.lengthDelimited);
            v143, v144 = v0.writeBuffer(v143, v144, v142, buffer.len(v142));
            v140 = v143;
            v141 = v144;
        elseif v139.kind.type == "binding_path" then
            local v145, v146 = v0.writeTag(v140, v141, 2, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeString(v145, v146, v139.kind.value);
            v140 = v145;
            v141 = v146;
        elseif v139.kind.type == "conditional" then
            local v147 = v139.kind.value:encode();
            local v148, v149 = v0.writeTag(v140, v141, 3, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v140 = v148;
            v141 = v149;
        end;
    end;
    local v150 = buffer.create(v141);
    buffer.copy(v150, 0, v140, 0, v141);
    return v150;
end;
v7.decode = function(v151) --[[ Line: 1177 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v2 (copy)
    local v152 = l_v7_5.new();
    local v153 = 0;
    while v153 < buffer.len(v151) do
        local v154 = nil;
        local v155 = nil;
        local v156, v157, v158 = v0.readTag(v151, v153);
        v154 = v156;
        v155 = v157;
        v153 = v158;
        if v155 == v0.wireTypes.varint then
            v156 = nil;
            v157, v158 = v0.readVarInt(v151, v153);
            v156 = v157;
            v153 = v158;
        elseif v155 == v0.wireTypes.lengthDelimited then
            if v154 == 1 then
                v156 = nil;
                v157, v158 = v0.readBuffer(v151, v153);
                v156 = v157;
                v153 = v158;
                v152.kind = {
                    type = "literal", 
                    value = v2.TabItemData_TabItem.decode(v156)
                };
            elseif v154 == 2 then
                v156 = nil;
                v157, v158 = v0.readBuffer(v151, v153);
                v156 = v157;
                v153 = v158;
                v152.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v156)
                };
            elseif v154 == 3 then
                v156 = nil;
                v157, v158 = v0.readBuffer(v151, v153);
                v156 = v157;
                v153 = v158;
                v152.kind = {
                    type = "conditional", 
                    value = v2.TabItemData_ConditionalOptions.decode(v156)
                };
            else
                v156 = nil;
                v157, v158 = v0.readVarInt(v151, v153);
                v153 = v158 + v157;
            end;
        elseif v155 == v0.wireTypes.i32 then
            v156 = nil;
            v157, v158 = v0.readFixed32(v151, v153);
            v156 = v157;
            v153 = v158;
        elseif v155 == v0.wireTypes.i64 then
            v156 = nil;
            v157, v158 = v0.readFixed64(v151, v153);
            v156 = v157;
            v153 = v158;
        else
            error("Unsupported wire type: " .. v155);
        end;
    end;
    return v152;
end;
v7.jsonEncode = function(v159) --[[ Line: 1230 ]] --[[ Name: jsonEncode ]]
    local v160 = {};
    if v159.kind ~= nil then
        if v159.kind.type == "literal" then
            v160.literal = v159.kind.value:jsonEncode();
            return v160;
        elseif v159.kind.type == "binding_path" then
            v160.bindingPath = v159.kind.value;
            return v160;
        elseif v159.kind.type == "conditional" then
            v160.conditional = v159.kind.value:jsonEncode();
        end;
    end;
    return v160;
end;
v7.jsonDecode = function(v161) --[[ Line: 1246 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v2 (copy)
    local v162 = l_v7_5.new();
    if v161.literal ~= nil then
        v162.kind = {
            type = "literal", 
            value = v2.TabItemData_TabItem.jsonDecode(v161.literal)
        };
    end;
    if v161.binding_path ~= nil then
        v162.kind = {
            type = "binding_path", 
            value = v161.binding_path
        };
    end;
    if v161.bindingPath ~= nil then
        v162.kind = {
            type = "binding_path", 
            value = v161.bindingPath
        };
    end;
    if v161.conditional ~= nil then
        v162.kind = {
            type = "conditional", 
            value = v2.TabItemData_ConditionalOptions.jsonDecode(v161.conditional)
        };
    end;
    return v162;
end;
v7.descriptor = {
    name = "TabItemData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabItemData"
};
v2.TabItemData = v7;
v1.default:register(v2.TabItemData);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v164) --[[ Line: 1283 ]] --[[ Name: new ]]
    -- upvalues: l_v7_6 (copy)
    return (setmetatable({
        condition = if not (v164 ~= nil) or v164.condition == nil then nil else v164.condition, 
        kind = if not (v164 ~= nil) or v164.kind == nil then nil else v164.kind
    }, l_v7_6));
end;
v7.encode = function(v165) --[[ Line: 1292 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v166 = buffer.create(0);
    local v167 = 0;
    if v165.condition ~= nil then
        local v168 = v165.condition:encode();
        local v169, v170 = v0.writeTag(v166, v167, 1, v0.wireTypes.lengthDelimited);
        v169, v170 = v0.writeBuffer(v169, v170, v168, buffer.len(v168));
        v166 = v169;
        v167 = v170;
    end;
    if v165.kind ~= nil then
        if v165.kind.type == "literal" then
            local v171 = v165.kind.value:encode();
            local v172, v173 = v0.writeTag(v166, v167, 2, v0.wireTypes.lengthDelimited);
            v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
            v166 = v172;
            v167 = v173;
        elseif v165.kind.type == "binding_path" then
            local v174, v175 = v0.writeTag(v166, v167, 3, v0.wireTypes.lengthDelimited);
            v174, v175 = v0.writeString(v174, v175, v165.kind.value);
            v166 = v174;
            v167 = v175;
        end;
    end;
    local v176 = buffer.create(v167);
    buffer.copy(v176, 0, v166, 0, v167);
    return v176;
end;
v7.decode = function(v177) --[[ Line: 1318 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v178 = l_v7_6.new();
    local v179 = 0;
    while v179 < buffer.len(v177) do
        local v180 = nil;
        local v181 = nil;
        local v182, v183, v184 = v0.readTag(v177, v179);
        v180 = v182;
        v181 = v183;
        v179 = v184;
        if v181 == v0.wireTypes.varint then
            v182 = nil;
            v183, v184 = v0.readVarInt(v177, v179);
            v182 = v183;
            v179 = v184;
        elseif v181 == v0.wireTypes.lengthDelimited then
            if v180 == 1 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.condition = v5.PropCondition.decode(v182);
            elseif v180 == 2 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "literal", 
                    value = v2.TabItemData_TabItem.decode(v182)
                };
            elseif v180 == 3 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v182)
                };
            else
                v182 = nil;
                v183, v184 = v0.readVarInt(v177, v179);
                v179 = v184 + v183;
            end;
        elseif v181 == v0.wireTypes.i32 then
            v182 = nil;
            v183, v184 = v0.readFixed32(v177, v179);
            v182 = v183;
            v179 = v184;
        elseif v181 == v0.wireTypes.i64 then
            v182 = nil;
            v183, v184 = v0.readFixed64(v177, v179);
            v182 = v183;
            v179 = v184;
        else
            error("Unsupported wire type: " .. v181);
        end;
    end;
    return v178;
end;
v7.jsonEncode = function(v185) --[[ Line: 1371 ]] --[[ Name: jsonEncode ]]
    local v186 = {};
    if v185.condition ~= nil then
        v186.condition = v185.condition:jsonEncode();
    end;
    if v185.kind ~= nil then
        if v185.kind.type == "literal" then
            v186.literal = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "binding_path" then
            v186.bindingPath = v185.kind.value;
        end;
    end;
    return v186;
end;
v7.jsonDecode = function(v187) --[[ Line: 1389 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v5 (copy), v2 (copy)
    local v188 = l_v7_6.new();
    if v187.condition ~= nil then
        v188.condition = v5.PropCondition.jsonDecode(v187.condition);
    end;
    if v187.literal ~= nil then
        v188.kind = {
            type = "literal", 
            value = v2.TabItemData_TabItem.jsonDecode(v187.literal)
        };
    end;
    if v187.binding_path ~= nil then
        v188.kind = {
            type = "binding_path", 
            value = v187.binding_path
        };
    end;
    if v187.bindingPath ~= nil then
        v188.kind = {
            type = "binding_path", 
            value = v187.bindingPath
        };
    end;
    return v188;
end;
v7.descriptor = {
    name = "TabItemData_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.TabItemData_ConditionalOption = v7;
v1.default:register(v2.TabItemData_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v190) --[[ Line: 1426 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        options = if not (v190 ~= nil) or v190.options == nil then {} else v190.options
    }, l_v7_7));
end;
v7.encode = function(v191) --[[ Line: 1434 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v192 = buffer.create(0);
    local v193 = 0;
    if v191.options ~= nil and #v191.options > 0 then
        for _, v195 in v191.options do
            local v196 = v195:encode();
            local v197, v198 = v0.writeTag(v192, v193, 1, v0.wireTypes.lengthDelimited);
            v197, v198 = v0.writeBuffer(v197, v198, v196, buffer.len(v196));
            v192 = v197;
            v193 = v198;
        end;
    end;
    local v199 = buffer.create(v193);
    buffer.copy(v199, 0, v192, 0, v193);
    return v199;
end;
v7.decode = function(v200) --[[ Line: 1451 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v2 (copy)
    local v201 = l_v7_7.new();
    local v202 = 0;
    while v202 < buffer.len(v200) do
        local v203 = nil;
        local v204 = nil;
        local v205, v206, v207 = v0.readTag(v200, v202);
        v203 = v205;
        v204 = v206;
        v202 = v207;
        if v204 == v0.wireTypes.varint then
            v205 = nil;
            v206, v207 = v0.readVarInt(v200, v202);
            v205 = v206;
            v202 = v207;
        elseif v204 == v0.wireTypes.lengthDelimited then
            if v203 == 1 then
                v205 = nil;
                v206, v207 = v0.readBuffer(v200, v202);
                v205 = v206;
                v202 = v207;
                table.insert(v201.options, v2.TabItemData_ConditionalOption.decode(v205));
            else
                v205 = nil;
                v206, v207 = v0.readVarInt(v200, v202);
                v202 = v207 + v206;
            end;
        elseif v204 == v0.wireTypes.i32 then
            v205 = nil;
            v206, v207 = v0.readFixed32(v200, v202);
            v205 = v206;
            v202 = v207;
        elseif v204 == v0.wireTypes.i64 then
            v205 = nil;
            v206, v207 = v0.readFixed64(v200, v202);
            v205 = v206;
            v202 = v207;
        else
            error("Unsupported wire type: " .. v204);
        end;
    end;
    return v201;
end;
v7.jsonEncode = function(v208) --[[ Line: 1494 ]] --[[ Name: jsonEncode ]]
    local v209 = {};
    if v208.options ~= nil and #v208.options > 0 then
        local v210 = {};
        for _, v212 in v208.options do
            table.insert(v210, v212:jsonEncode());
        end;
        v209.options = v210;
    end;
    return v209;
end;
v7.jsonDecode = function(v213) --[[ Line: 1508 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v2 (copy)
    local v214 = l_v7_7.new();
    if v213.options ~= nil then
        local v215 = {};
        for _, v217 in v213.options do
            table.insert(v215, v2.TabItemData_ConditionalOption.jsonDecode(v217));
        end;
        v214.options = v215;
    end;
    return v214;
end;
v7.descriptor = {
    name = "TabItemData_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.TabItemData_ConditionalOptions = v7;
v1.default:register(v2.TabItemData_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v219) --[[ Line: 1537 ]] --[[ Name: new ]]
    -- upvalues: l_v7_8 (copy)
    return (setmetatable({
        id = if not (v219 ~= nil) or v219.id == nil then nil else v219.id, 
        text = if not (v219 ~= nil) or v219.text == nil then nil else v219.text, 
        icon = if not (v219 ~= nil) or v219.icon == nil then nil else v219.icon, 
        is_disabled = if not (v219 ~= nil) or v219.is_disabled == nil then nil else v219.is_disabled
    }, l_v7_8));
end;
v7.encode = function(v220) --[[ Line: 1546 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v221 = buffer.create(0);
    local v222 = 0;
    if v220.id ~= nil then
        local v223 = v220.id:encode();
        local v224, v225 = v0.writeTag(v221, v222, 1, v0.wireTypes.lengthDelimited);
        v224, v225 = v0.writeBuffer(v224, v225, v223, buffer.len(v223));
        v221 = v224;
        v222 = v225;
    end;
    if v220.text ~= nil then
        local v226 = v220.text:encode();
        local v227, v228 = v0.writeTag(v221, v222, 2, v0.wireTypes.lengthDelimited);
        v227, v228 = v0.writeBuffer(v227, v228, v226, buffer.len(v226));
        v221 = v227;
        v222 = v228;
    end;
    if v220.icon ~= nil then
        local v229 = v220.icon:encode();
        local v230, v231 = v0.writeTag(v221, v222, 3, v0.wireTypes.lengthDelimited);
        v230, v231 = v0.writeBuffer(v230, v231, v229, buffer.len(v229));
        v221 = v230;
        v222 = v231;
    end;
    if v220.is_disabled ~= nil then
        local v232 = v220.is_disabled:encode();
        local v233, v234 = v0.writeTag(v221, v222, 4, v0.wireTypes.lengthDelimited);
        v233, v234 = v0.writeBuffer(v233, v234, v232, buffer.len(v232));
        v221 = v233;
        v222 = v234;
    end;
    local v235 = buffer.create(v222);
    buffer.copy(v235, 0, v221, 0, v222);
    return v235;
end;
v7.decode = function(v236) --[[ Line: 1579 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v6 (copy), v2 (copy)
    local v237 = l_v7_8.new();
    local v238 = 0;
    while v238 < buffer.len(v236) do
        local v239 = nil;
        local v240 = nil;
        local v241, v242, v243 = v0.readTag(v236, v238);
        v239 = v241;
        v240 = v242;
        v238 = v243;
        if v240 == v0.wireTypes.varint then
            v241 = nil;
            v242, v243 = v0.readVarInt(v236, v238);
            v241 = v242;
            v238 = v243;
        elseif v240 == v0.wireTypes.lengthDelimited then
            if v239 == 1 then
                v241 = nil;
                v242, v243 = v0.readBuffer(v236, v238);
                v241 = v242;
                v238 = v243;
                v237.id = v6.StringProp.decode(v241);
            elseif v239 == 2 then
                v241 = nil;
                v242, v243 = v0.readBuffer(v236, v238);
                v241 = v242;
                v238 = v243;
                v237.text = v6.StringProp.decode(v241);
            elseif v239 == 3 then
                v241 = nil;
                v242, v243 = v0.readBuffer(v236, v238);
                v241 = v242;
                v238 = v243;
                v237.icon = v2.TabItemIconData.decode(v241);
            elseif v239 == 4 then
                v241 = nil;
                v242, v243 = v0.readBuffer(v236, v238);
                v241 = v242;
                v238 = v243;
                v237.is_disabled = v6.BoolProp.decode(v241);
            else
                v241 = nil;
                v242, v243 = v0.readVarInt(v236, v238);
                v238 = v243 + v242;
            end;
        elseif v240 == v0.wireTypes.i32 then
            v241 = nil;
            v242, v243 = v0.readFixed32(v236, v238);
            v241 = v242;
            v238 = v243;
        elseif v240 == v0.wireTypes.i64 then
            v241 = nil;
            v242, v243 = v0.readFixed64(v236, v238);
            v241 = v242;
            v238 = v243;
        else
            error("Unsupported wire type: " .. v240);
        end;
    end;
    return v237;
end;
v7.jsonEncode = function(v244) --[[ Line: 1637 ]] --[[ Name: jsonEncode ]]
    local v245 = {};
    if v244.id ~= nil then
        v245.id = v244.id:jsonEncode();
    end;
    if v244.text ~= nil then
        v245.text = v244.text:jsonEncode();
    end;
    if v244.icon ~= nil then
        v245.icon = v244.icon:jsonEncode();
    end;
    if v244.is_disabled ~= nil then
        v245.isDisabled = v244.is_disabled:jsonEncode();
    end;
    return v245;
end;
v7.jsonDecode = function(v246) --[[ Line: 1659 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v6 (copy), v2 (copy)
    local v247 = l_v7_8.new();
    if v246.id ~= nil then
        v247.id = v6.StringProp.jsonDecode(v246.id);
    end;
    if v246.text ~= nil then
        v247.text = v6.StringProp.jsonDecode(v246.text);
    end;
    if v246.icon ~= nil then
        v247.icon = v2.TabItemIconData.jsonDecode(v246.icon);
    end;
    if v246.is_disabled ~= nil then
        v247.is_disabled = v6.BoolProp.jsonDecode(v246.is_disabled);
    end;
    if v246.isDisabled ~= nil then
        v247.is_disabled = v6.BoolProp.jsonDecode(v246.isDisabled);
    end;
    return v247;
end;
v7.descriptor = {
    name = "TabItemData_TabItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabItem"
};
v2.TabItemData_TabItem = v7;
v1.default:register(v2.TabItemData_TabItem);
v7 = {};
v7.__index = v7;
local l_v7_9 = v7 --[[ copy: 7 -> 17 ]];
v7.new = function(v249) --[[ Line: 1699 ]] --[[ Name: new ]]
    -- upvalues: l_v7_9 (copy)
    return (setmetatable({
        kind = if not (v249 ~= nil) or v249.kind == nil then nil else v249.kind
    }, l_v7_9));
end;
v7.encode = function(v250) --[[ Line: 1705 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v251 = buffer.create(0);
    local v252 = 0;
    if v250.kind ~= nil then
        if v250.kind.type == "literal" then
            local v253 = v250.kind.value:encode();
            local v254, v255 = v0.writeTag(v251, v252, 1, v0.wireTypes.lengthDelimited);
            v254, v255 = v0.writeBuffer(v254, v255, v253, buffer.len(v253));
            v251 = v254;
            v252 = v255;
        elseif v250.kind.type == "binding_path" then
            local v256, v257 = v0.writeTag(v251, v252, 2, v0.wireTypes.lengthDelimited);
            v256, v257 = v0.writeString(v256, v257, v250.kind.value);
            v251 = v256;
            v252 = v257;
        elseif v250.kind.type == "conditional" then
            local v258 = v250.kind.value:encode();
            local v259, v260 = v0.writeTag(v251, v252, 3, v0.wireTypes.lengthDelimited);
            v259, v260 = v0.writeBuffer(v259, v260, v258, buffer.len(v258));
            v251 = v259;
            v252 = v260;
        end;
    end;
    local v261 = buffer.create(v252);
    buffer.copy(v261, 0, v251, 0, v252);
    return v261;
end;
v7.decode = function(v262) --[[ Line: 1729 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_9 (copy), v0 (copy), v2 (copy)
    local v263 = l_v7_9.new();
    local v264 = 0;
    while v264 < buffer.len(v262) do
        local v265 = nil;
        local v266 = nil;
        local v267, v268, v269 = v0.readTag(v262, v264);
        v265 = v267;
        v266 = v268;
        v264 = v269;
        if v266 == v0.wireTypes.varint then
            v267 = nil;
            v268, v269 = v0.readVarInt(v262, v264);
            v267 = v268;
            v264 = v269;
        elseif v266 == v0.wireTypes.lengthDelimited then
            if v265 == 1 then
                v267 = nil;
                v268, v269 = v0.readBuffer(v262, v264);
                v267 = v268;
                v264 = v269;
                v263.kind = {
                    type = "literal", 
                    value = v2.ArrayOfTabItemDataProp_ArrayOfTabItemData.decode(v267)
                };
            elseif v265 == 2 then
                v267 = nil;
                v268, v269 = v0.readBuffer(v262, v264);
                v267 = v268;
                v264 = v269;
                v263.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v267)
                };
            elseif v265 == 3 then
                v267 = nil;
                v268, v269 = v0.readBuffer(v262, v264);
                v267 = v268;
                v264 = v269;
                v263.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfTabItemDataProp_ConditionalOptions.decode(v267)
                };
            else
                v267 = nil;
                v268, v269 = v0.readVarInt(v262, v264);
                v264 = v269 + v268;
            end;
        elseif v266 == v0.wireTypes.i32 then
            v267 = nil;
            v268, v269 = v0.readFixed32(v262, v264);
            v267 = v268;
            v264 = v269;
        elseif v266 == v0.wireTypes.i64 then
            v267 = nil;
            v268, v269 = v0.readFixed64(v262, v264);
            v267 = v268;
            v264 = v269;
        else
            error("Unsupported wire type: " .. v266);
        end;
    end;
    return v263;
end;
v7.jsonEncode = function(v270) --[[ Line: 1786 ]] --[[ Name: jsonEncode ]]
    local v271 = {};
    if v270.kind ~= nil then
        if v270.kind.type == "literal" then
            v271.literal = v270.kind.value:jsonEncode();
            return v271;
        elseif v270.kind.type == "binding_path" then
            v271.bindingPath = v270.kind.value;
            return v271;
        elseif v270.kind.type == "conditional" then
            v271.conditional = v270.kind.value:jsonEncode();
        end;
    end;
    return v271;
end;
v7.jsonDecode = function(v272) --[[ Line: 1802 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_9 (copy), v2 (copy)
    local v273 = l_v7_9.new();
    if v272.literal ~= nil then
        v273.kind = {
            type = "literal", 
            value = v2.ArrayOfTabItemDataProp_ArrayOfTabItemData.jsonDecode(v272.literal)
        };
    end;
    if v272.binding_path ~= nil then
        v273.kind = {
            type = "binding_path", 
            value = v272.binding_path
        };
    end;
    if v272.bindingPath ~= nil then
        v273.kind = {
            type = "binding_path", 
            value = v272.bindingPath
        };
    end;
    if v272.conditional ~= nil then
        v273.kind = {
            type = "conditional", 
            value = v2.ArrayOfTabItemDataProp_ConditionalOptions.jsonDecode(v272.conditional)
        };
    end;
    return v273;
end;
v7.descriptor = {
    name = "ArrayOfTabItemDataProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfTabItemDataProp"
};
v2.ArrayOfTabItemDataProp = v7;
v1.default:register(v2.ArrayOfTabItemDataProp);
v7 = {};
v7.__index = v7;
local l_v7_10 = v7 --[[ copy: 7 -> 18 ]];
v7.new = function(v275) --[[ Line: 1844 ]] --[[ Name: new ]]
    -- upvalues: l_v7_10 (copy)
    return (setmetatable({
        condition = if not (v275 ~= nil) or v275.condition == nil then nil else v275.condition, 
        kind = if not (v275 ~= nil) or v275.kind == nil then nil else v275.kind
    }, l_v7_10));
end;
v7.encode = function(v276) --[[ Line: 1853 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v277 = buffer.create(0);
    local v278 = 0;
    if v276.condition ~= nil then
        local v279 = v276.condition:encode();
        local v280, v281 = v0.writeTag(v277, v278, 1, v0.wireTypes.lengthDelimited);
        v280, v281 = v0.writeBuffer(v280, v281, v279, buffer.len(v279));
        v277 = v280;
        v278 = v281;
    end;
    if v276.kind ~= nil then
        if v276.kind.type == "literal" then
            local v282 = v276.kind.value:encode();
            local v283, v284 = v0.writeTag(v277, v278, 2, v0.wireTypes.lengthDelimited);
            v283, v284 = v0.writeBuffer(v283, v284, v282, buffer.len(v282));
            v277 = v283;
            v278 = v284;
        elseif v276.kind.type == "binding_path" then
            local v285, v286 = v0.writeTag(v277, v278, 3, v0.wireTypes.lengthDelimited);
            v285, v286 = v0.writeString(v285, v286, v276.kind.value);
            v277 = v285;
            v278 = v286;
        end;
    end;
    local v287 = buffer.create(v278);
    buffer.copy(v287, 0, v277, 0, v278);
    return v287;
end;
v7.decode = function(v288) --[[ Line: 1881 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_10 (copy), v0 (copy), v5 (copy), v2 (copy)
    local v289 = l_v7_10.new();
    local v290 = 0;
    while v290 < buffer.len(v288) do
        local v291 = nil;
        local v292 = nil;
        local v293, v294, v295 = v0.readTag(v288, v290);
        v291 = v293;
        v292 = v294;
        v290 = v295;
        if v292 == v0.wireTypes.varint then
            v293 = nil;
            v294, v295 = v0.readVarInt(v288, v290);
            v293 = v294;
            v290 = v295;
        elseif v292 == v0.wireTypes.lengthDelimited then
            if v291 == 1 then
                v293 = nil;
                v294, v295 = v0.readBuffer(v288, v290);
                v293 = v294;
                v290 = v295;
                v289.condition = v5.PropCondition.decode(v293);
            elseif v291 == 2 then
                v293 = nil;
                v294, v295 = v0.readBuffer(v288, v290);
                v293 = v294;
                v290 = v295;
                v289.kind = {
                    type = "literal", 
                    value = v2.ArrayOfTabItemDataProp_ArrayOfTabItemData.decode(v293)
                };
            elseif v291 == 3 then
                v293 = nil;
                v294, v295 = v0.readBuffer(v288, v290);
                v293 = v294;
                v290 = v295;
                v289.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v293)
                };
            else
                v293 = nil;
                v294, v295 = v0.readVarInt(v288, v290);
                v290 = v295 + v294;
            end;
        elseif v292 == v0.wireTypes.i32 then
            v293 = nil;
            v294, v295 = v0.readFixed32(v288, v290);
            v293 = v294;
            v290 = v295;
        elseif v292 == v0.wireTypes.i64 then
            v293 = nil;
            v294, v295 = v0.readFixed64(v288, v290);
            v293 = v294;
            v290 = v295;
        else
            error("Unsupported wire type: " .. v292);
        end;
    end;
    return v289;
end;
v7.jsonEncode = function(v296) --[[ Line: 1937 ]] --[[ Name: jsonEncode ]]
    local v297 = {};
    if v296.condition ~= nil then
        v297.condition = v296.condition:jsonEncode();
    end;
    if v296.kind ~= nil then
        if v296.kind.type == "literal" then
            v297.literal = v296.kind.value:jsonEncode();
            return v297;
        elseif v296.kind.type == "binding_path" then
            v297.bindingPath = v296.kind.value;
        end;
    end;
    return v297;
end;
v7.jsonDecode = function(v298) --[[ Line: 1957 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_10 (copy), v5 (copy), v2 (copy)
    local v299 = l_v7_10.new();
    if v298.condition ~= nil then
        v299.condition = v5.PropCondition.jsonDecode(v298.condition);
    end;
    if v298.literal ~= nil then
        v299.kind = {
            type = "literal", 
            value = v2.ArrayOfTabItemDataProp_ArrayOfTabItemData.jsonDecode(v298.literal)
        };
    end;
    if v298.binding_path ~= nil then
        v299.kind = {
            type = "binding_path", 
            value = v298.binding_path
        };
    end;
    if v298.bindingPath ~= nil then
        v299.kind = {
            type = "binding_path", 
            value = v298.bindingPath
        };
    end;
    return v299;
end;
v7.descriptor = {
    name = "ArrayOfTabItemDataProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfTabItemDataProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfTabItemDataProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_11 = v7 --[[ copy: 7 -> 19 ]];
v7.new = function(v301) --[[ Line: 1999 ]] --[[ Name: new ]]
    -- upvalues: l_v7_11 (copy)
    return (setmetatable({
        options = if not (v301 ~= nil) or v301.options == nil then {} else v301.options
    }, l_v7_11));
end;
v7.encode = function(v302) --[[ Line: 2007 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v303 = buffer.create(0);
    local v304 = 0;
    if v302.options ~= nil and #v302.options > 0 then
        for _, v306 in v302.options do
            local v307 = v306:encode();
            local v308, v309 = v0.writeTag(v303, v304, 1, v0.wireTypes.lengthDelimited);
            v308, v309 = v0.writeBuffer(v308, v309, v307, buffer.len(v307));
            v303 = v308;
            v304 = v309;
        end;
    end;
    local v310 = buffer.create(v304);
    buffer.copy(v310, 0, v303, 0, v304);
    return v310;
end;
v7.decode = function(v311) --[[ Line: 2026 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_11 (copy), v0 (copy), v2 (copy)
    local v312 = l_v7_11.new();
    local v313 = 0;
    while v313 < buffer.len(v311) do
        local v314 = nil;
        local v315 = nil;
        local v316, v317, v318 = v0.readTag(v311, v313);
        v314 = v316;
        v315 = v317;
        v313 = v318;
        if v315 == v0.wireTypes.varint then
            v316 = nil;
            v317, v318 = v0.readVarInt(v311, v313);
            v316 = v317;
            v313 = v318;
        elseif v315 == v0.wireTypes.lengthDelimited then
            if v314 == 1 then
                v316 = nil;
                v317, v318 = v0.readBuffer(v311, v313);
                v316 = v317;
                v313 = v318;
                table.insert(v312.options, v2.ArrayOfTabItemDataProp_ConditionalOption.decode(v316));
            else
                v316 = nil;
                v317, v318 = v0.readVarInt(v311, v313);
                v313 = v318 + v317;
            end;
        elseif v315 == v0.wireTypes.i32 then
            v316 = nil;
            v317, v318 = v0.readFixed32(v311, v313);
            v316 = v317;
            v313 = v318;
        elseif v315 == v0.wireTypes.i64 then
            v316 = nil;
            v317, v318 = v0.readFixed64(v311, v313);
            v316 = v317;
            v313 = v318;
        else
            error("Unsupported wire type: " .. v315);
        end;
    end;
    return v312;
end;
v7.jsonEncode = function(v319) --[[ Line: 2071 ]] --[[ Name: jsonEncode ]]
    local v320 = {};
    if v319.options ~= nil and #v319.options > 0 then
        local v321 = {};
        for _, v323 in v319.options do
            table.insert(v321, v323:jsonEncode());
        end;
        v320.options = v321;
    end;
    return v320;
end;
v7.jsonDecode = function(v324) --[[ Line: 2087 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_11 (copy), v2 (copy)
    local v325 = l_v7_11.new();
    if v324.options ~= nil then
        local v326 = {};
        for _, v328 in v324.options do
            table.insert(v326, v2.ArrayOfTabItemDataProp_ConditionalOption.jsonDecode(v328));
        end;
        v325.options = v326;
    end;
    return v325;
end;
v7.descriptor = {
    name = "ArrayOfTabItemDataProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfTabItemDataProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfTabItemDataProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_12 = v7 --[[ copy: 7 -> 20 ]];
v7.new = function(v330) --[[ Line: 2118 ]] --[[ Name: new ]]
    -- upvalues: l_v7_12 (copy)
    return (setmetatable({
        array = if not (v330 ~= nil) or v330.array == nil then {} else v330.array
    }, l_v7_12));
end;
v7.encode = function(v331) --[[ Line: 2126 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v332 = buffer.create(0);
    local v333 = 0;
    if v331.array ~= nil and #v331.array > 0 then
        for _, v335 in v331.array do
            local v336 = v335:encode();
            local v337, v338 = v0.writeTag(v332, v333, 1, v0.wireTypes.lengthDelimited);
            v337, v338 = v0.writeBuffer(v337, v338, v336, buffer.len(v336));
            v332 = v337;
            v333 = v338;
        end;
    end;
    local v339 = buffer.create(v333);
    buffer.copy(v339, 0, v332, 0, v333);
    return v339;
end;
v7.decode = function(v340) --[[ Line: 2145 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_12 (copy), v0 (copy), v2 (copy)
    local v341 = l_v7_12.new();
    local v342 = 0;
    while v342 < buffer.len(v340) do
        local v343 = nil;
        local v344 = nil;
        local v345, v346, v347 = v0.readTag(v340, v342);
        v343 = v345;
        v344 = v346;
        v342 = v347;
        if v344 == v0.wireTypes.varint then
            v345 = nil;
            v346, v347 = v0.readVarInt(v340, v342);
            v345 = v346;
            v342 = v347;
        elseif v344 == v0.wireTypes.lengthDelimited then
            if v343 == 1 then
                v345 = nil;
                v346, v347 = v0.readBuffer(v340, v342);
                v345 = v346;
                v342 = v347;
                table.insert(v341.array, v2.TabItemData.decode(v345));
            else
                v345 = nil;
                v346, v347 = v0.readVarInt(v340, v342);
                v342 = v347 + v346;
            end;
        elseif v344 == v0.wireTypes.i32 then
            v345 = nil;
            v346, v347 = v0.readFixed32(v340, v342);
            v345 = v346;
            v342 = v347;
        elseif v344 == v0.wireTypes.i64 then
            v345 = nil;
            v346, v347 = v0.readFixed64(v340, v342);
            v345 = v346;
            v342 = v347;
        else
            error("Unsupported wire type: " .. v344);
        end;
    end;
    return v341;
end;
v7.jsonEncode = function(v348) --[[ Line: 2190 ]] --[[ Name: jsonEncode ]]
    local v349 = {};
    if v348.array ~= nil and #v348.array > 0 then
        local v350 = {};
        for _, v352 in v348.array do
            table.insert(v350, v352:jsonEncode());
        end;
        v349.array = v350;
    end;
    return v349;
end;
v7.jsonDecode = function(v353) --[[ Line: 2206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_12 (copy), v2 (copy)
    local v354 = l_v7_12.new();
    if v353.array ~= nil then
        local v355 = {};
        for _, v357 in v353.array do
            table.insert(v355, v2.TabItemData.jsonDecode(v357));
        end;
        v354.array = v355;
    end;
    return v354;
end;
v7.descriptor = {
    name = "ArrayOfTabItemDataProp_ArrayOfTabItemData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfTabItemData"
};
v2.ArrayOfTabItemDataProp_ArrayOfTabItemData = v7;
v1.default:register(v2.ArrayOfTabItemDataProp_ArrayOfTabItemData);
v7 = {};
v7.__index = v7;
local l_v7_13 = v7 --[[ copy: 7 -> 21 ]];
v7.new = function(v359) --[[ Line: 2237 ]] --[[ Name: new ]]
    -- upvalues: l_v7_13 (copy)
    return (setmetatable({
        props = if not (v359 ~= nil) or v359.props == nil then nil else v359.props, 
        shared = if not (v359 ~= nil) or v359.shared == nil then nil else v359.shared
    }, l_v7_13));
end;
v7.encode = function(v360) --[[ Line: 2244 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v361 = buffer.create(0);
    local v362 = 0;
    if v360.props ~= nil then
        local v363 = v360.props:encode();
        local v364, v365 = v0.writeTag(v361, v362, 1, v0.wireTypes.lengthDelimited);
        v364, v365 = v0.writeBuffer(v364, v365, v363, buffer.len(v363));
        v361 = v364;
        v362 = v365;
    end;
    if v360.shared ~= nil then
        local v366 = v360.shared:encode();
        local v367, v368 = v0.writeTag(v361, v362, 2, v0.wireTypes.lengthDelimited);
        v367, v368 = v0.writeBuffer(v367, v368, v366, buffer.len(v366));
        v361 = v367;
        v362 = v368;
    end;
    local v369 = buffer.create(v362);
    buffer.copy(v369, 0, v361, 0, v362);
    return v369;
end;
v7.decode = function(v370) --[[ Line: 2265 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_13 (copy), v0 (copy), v2 (copy), v4 (copy)
    local v371 = l_v7_13.new();
    local v372 = 0;
    while v372 < buffer.len(v370) do
        local v373 = nil;
        local v374 = nil;
        local v375, v376, v377 = v0.readTag(v370, v372);
        v373 = v375;
        v374 = v376;
        v372 = v377;
        if v374 == v0.wireTypes.varint then
            v375 = nil;
            v376, v377 = v0.readVarInt(v370, v372);
            v375 = v376;
            v372 = v377;
        elseif v374 == v0.wireTypes.lengthDelimited then
            if v373 == 1 then
                v375 = nil;
                v376, v377 = v0.readBuffer(v370, v372);
                v375 = v376;
                v372 = v377;
                v371.props = v2.TabsSchema_Props.decode(v375);
            elseif v373 == 2 then
                v375 = nil;
                v376, v377 = v0.readBuffer(v370, v372);
                v375 = v376;
                v372 = v377;
                v371.shared = v4.ComponentShared.decode(v375);
            else
                v375 = nil;
                v376, v377 = v0.readVarInt(v370, v372);
                v372 = v377 + v376;
            end;
        elseif v374 == v0.wireTypes.i32 then
            v375 = nil;
            v376, v377 = v0.readFixed32(v370, v372);
            v375 = v376;
            v372 = v377;
        elseif v374 == v0.wireTypes.i64 then
            v375 = nil;
            v376, v377 = v0.readFixed64(v370, v372);
            v375 = v376;
            v372 = v377;
        else
            error("Unsupported wire type: " .. v374);
        end;
    end;
    return v371;
end;
v7.jsonEncode = function(v378) --[[ Line: 2313 ]] --[[ Name: jsonEncode ]]
    local v379 = {};
    if v378.props ~= nil then
        v379.props = v378.props:jsonEncode();
    end;
    if v378.shared ~= nil then
        v379.shared = v378.shared:jsonEncode();
    end;
    return v379;
end;
v7.jsonDecode = function(v380) --[[ Line: 2327 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_13 (copy), v2 (copy), v4 (copy)
    local v381 = l_v7_13.new();
    if v380.props ~= nil then
        v381.props = v2.TabsSchema_Props.jsonDecode(v380.props);
    end;
    if v380.shared ~= nil then
        v381.shared = v4.ComponentShared.jsonDecode(v380.shared);
    end;
    return v381;
end;
v7.descriptor = {
    name = "TabsSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TabsSchema"
};
v2.TabsSchema = v7;
v1.default:register(v2.TabsSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v382) --[[ Line: 2356 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        anchor_point = if not (v382 ~= nil) or v382.anchor_point == nil then nil else v382.anchor_point, 
        layout_order = if not (v382 ~= nil) or v382.layout_order == nil then nil else v382.layout_order, 
        position = if not (v382 ~= nil) or v382.position == nil then nil else v382.position, 
        visible = if not (v382 ~= nil) or v382.visible == nil then nil else v382.visible, 
        z_index = if not (v382 ~= nil) or v382.z_index == nil then nil else v382.z_index, 
        tabs = if not (v382 ~= nil) or v382.tabs == nil then nil else v382.tabs, 
        default_active_tab_id = if not (v382 ~= nil) or v382.default_active_tab_id == nil then nil else v382.default_active_tab_id, 
        active_tab_id = if not (v382 ~= nil) or v382.active_tab_id == nil then nil else v382.active_tab_id, 
        on_activated = if not (v382 ~= nil) or v382.on_activated == nil then nil else v382.on_activated, 
        size = if not (v382 ~= nil) or v382.size == nil then nil else v382.size, 
        fill_behavior = if not (v382 ~= nil) or v382.fill_behavior == nil then nil else v382.fill_behavior, 
        on_absolute_size_changed = if not (v382 ~= nil) or v382.on_absolute_size_changed == nil then nil else v382.on_absolute_size_changed, 
        on_absolute_position_changed = if not (v382 ~= nil) or v382.on_absolute_position_changed == nil then nil else v382.on_absolute_position_changed
    }, v7));
end;
v7.encode = function(v383) --[[ Line: 2380 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v384 = buffer.create(0);
    local v385 = 0;
    if v383.anchor_point ~= nil then
        local v386 = v383.anchor_point:encode();
        local v387, v388 = v0.writeTag(v384, v385, 1, v0.wireTypes.lengthDelimited);
        v387, v388 = v0.writeBuffer(v387, v388, v386, buffer.len(v386));
        v384 = v387;
        v385 = v388;
    end;
    if v383.layout_order ~= nil then
        local v389 = v383.layout_order:encode();
        local v390, v391 = v0.writeTag(v384, v385, 2, v0.wireTypes.lengthDelimited);
        v390, v391 = v0.writeBuffer(v390, v391, v389, buffer.len(v389));
        v384 = v390;
        v385 = v391;
    end;
    if v383.position ~= nil then
        local v392 = v383.position:encode();
        local v393, v394 = v0.writeTag(v384, v385, 3, v0.wireTypes.lengthDelimited);
        v393, v394 = v0.writeBuffer(v393, v394, v392, buffer.len(v392));
        v384 = v393;
        v385 = v394;
    end;
    if v383.visible ~= nil then
        local v395 = v383.visible:encode();
        local v396, v397 = v0.writeTag(v384, v385, 4, v0.wireTypes.lengthDelimited);
        v396, v397 = v0.writeBuffer(v396, v397, v395, buffer.len(v395));
        v384 = v396;
        v385 = v397;
    end;
    if v383.z_index ~= nil then
        local v398 = v383.z_index:encode();
        local v399, v400 = v0.writeTag(v384, v385, 5, v0.wireTypes.lengthDelimited);
        v399, v400 = v0.writeBuffer(v399, v400, v398, buffer.len(v398));
        v384 = v399;
        v385 = v400;
    end;
    if v383.tabs ~= nil then
        local v401 = v383.tabs:encode();
        local v402, v403 = v0.writeTag(v384, v385, 6, v0.wireTypes.lengthDelimited);
        v402, v403 = v0.writeBuffer(v402, v403, v401, buffer.len(v401));
        v384 = v402;
        v385 = v403;
    end;
    if v383.default_active_tab_id ~= nil then
        local v404 = v383.default_active_tab_id:encode();
        local v405, v406 = v0.writeTag(v384, v385, 7, v0.wireTypes.lengthDelimited);
        v405, v406 = v0.writeBuffer(v405, v406, v404, buffer.len(v404));
        v384 = v405;
        v385 = v406;
    end;
    if v383.active_tab_id ~= nil then
        local v407 = v383.active_tab_id:encode();
        local v408, v409 = v0.writeTag(v384, v385, 8, v0.wireTypes.lengthDelimited);
        v408, v409 = v0.writeBuffer(v408, v409, v407, buffer.len(v407));
        v384 = v408;
        v385 = v409;
    end;
    if v383.on_activated ~= nil then
        local v410 = v383.on_activated:encode();
        local v411, v412 = v0.writeTag(v384, v385, 9, v0.wireTypes.lengthDelimited);
        v411, v412 = v0.writeBuffer(v411, v412, v410, buffer.len(v410));
        v384 = v411;
        v385 = v412;
    end;
    if v383.size ~= nil then
        local v413 = v383.size:encode();
        local v414, v415 = v0.writeTag(v384, v385, 10, v0.wireTypes.lengthDelimited);
        v414, v415 = v0.writeBuffer(v414, v415, v413, buffer.len(v413));
        v384 = v414;
        v385 = v415;
    end;
    if v383.fill_behavior ~= nil then
        local v416 = v383.fill_behavior:encode();
        local v417, v418 = v0.writeTag(v384, v385, 11, v0.wireTypes.lengthDelimited);
        v417, v418 = v0.writeBuffer(v417, v418, v416, buffer.len(v416));
        v384 = v417;
        v385 = v418;
    end;
    if v383.on_absolute_size_changed ~= nil then
        local v419 = v383.on_absolute_size_changed:encode();
        local v420, v421 = v0.writeTag(v384, v385, 12, v0.wireTypes.lengthDelimited);
        v420, v421 = v0.writeBuffer(v420, v421, v419, buffer.len(v419));
        v384 = v420;
        v385 = v421;
    end;
    if v383.on_absolute_position_changed ~= nil then
        local v422 = v383.on_absolute_position_changed:encode();
        local v423, v424 = v0.writeTag(v384, v385, 13, v0.wireTypes.lengthDelimited);
        v423, v424 = v0.writeBuffer(v423, v424, v422, buffer.len(v422));
        v384 = v423;
        v385 = v424;
    end;
    local v425 = buffer.create(v385);
    buffer.copy(v425, 0, v384, 0, v385);
    return v425;
end;
v7.decode = function(v426) --[[ Line: 2467 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v6 (copy), v2 (copy), v3 (copy)
    local v427 = v7.new();
    local v428 = 0;
    while v428 < buffer.len(v426) do
        local v429 = nil;
        local v430 = nil;
        local v431, v432, v433 = v0.readTag(v426, v428);
        v429 = v431;
        v430 = v432;
        v428 = v433;
        if v430 == v0.wireTypes.varint then
            v431 = nil;
            v432, v433 = v0.readVarInt(v426, v428);
            v431 = v432;
            v428 = v433;
        elseif v430 == v0.wireTypes.lengthDelimited then
            if v429 == 1 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.anchor_point = v6.Vector2Prop.decode(v431);
            elseif v429 == 2 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.layout_order = v6.FloatProp.decode(v431);
            elseif v429 == 3 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.position = v6.UDim2Prop.decode(v431);
            elseif v429 == 4 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.visible = v6.FloatProp.decode(v431);
            elseif v429 == 5 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.z_index = v6.FloatProp.decode(v431);
            elseif v429 == 6 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.tabs = v2.ArrayOfTabItemDataProp.decode(v431);
            elseif v429 == 7 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.default_active_tab_id = v6.StringProp.decode(v431);
            elseif v429 == 8 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.active_tab_id = v6.StringProp.decode(v431);
            elseif v429 == 9 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.on_activated = v3.ActionProp.decode(v431);
            elseif v429 == 10 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.size = v6.InputSizeProp.decode(v431);
            elseif v429 == 11 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.fill_behavior = v6.FillBehaviorProp.decode(v431);
            elseif v429 == 12 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.on_absolute_size_changed = v3.ActionProp.decode(v431);
            elseif v429 == 13 then
                v431 = nil;
                v432, v433 = v0.readBuffer(v426, v428);
                v431 = v432;
                v428 = v433;
                v427.on_absolute_position_changed = v3.ActionProp.decode(v431);
            else
                v431 = nil;
                v432, v433 = v0.readVarInt(v426, v428);
                v428 = v433 + v432;
            end;
        elseif v430 == v0.wireTypes.i32 then
            v431 = nil;
            v432, v433 = v0.readFixed32(v426, v428);
            v431 = v432;
            v428 = v433;
        elseif v430 == v0.wireTypes.i64 then
            v431 = nil;
            v432, v433 = v0.readFixed64(v426, v428);
            v431 = v432;
            v428 = v433;
        else
            error("Unsupported wire type: " .. v430);
        end;
    end;
    return v427;
end;
v7.jsonEncode = function(v434) --[[ Line: 2574 ]] --[[ Name: jsonEncode ]]
    local v435 = {};
    if v434.anchor_point ~= nil then
        v435.anchorPoint = v434.anchor_point:jsonEncode();
    end;
    if v434.layout_order ~= nil then
        v435.layoutOrder = v434.layout_order:jsonEncode();
    end;
    if v434.position ~= nil then
        v435.position = v434.position:jsonEncode();
    end;
    if v434.visible ~= nil then
        v435.visible = v434.visible:jsonEncode();
    end;
    if v434.z_index ~= nil then
        v435.zIndex = v434.z_index:jsonEncode();
    end;
    if v434.tabs ~= nil then
        v435.tabs = v434.tabs:jsonEncode();
    end;
    if v434.default_active_tab_id ~= nil then
        v435.defaultActiveTabId = v434.default_active_tab_id:jsonEncode();
    end;
    if v434.active_tab_id ~= nil then
        v435.activeTabId = v434.active_tab_id:jsonEncode();
    end;
    if v434.on_activated ~= nil then
        v435.onActivated = v434.on_activated:jsonEncode();
    end;
    if v434.size ~= nil then
        v435.size = v434.size:jsonEncode();
    end;
    if v434.fill_behavior ~= nil then
        v435.fillBehavior = v434.fill_behavior:jsonEncode();
    end;
    if v434.on_absolute_size_changed ~= nil then
        v435.onAbsoluteSizeChanged = v434.on_absolute_size_changed:jsonEncode();
    end;
    if v434.on_absolute_position_changed ~= nil then
        v435.onAbsolutePositionChanged = v434.on_absolute_position_changed:jsonEncode();
    end;
    return v435;
end;
v7.jsonDecode = function(v436) --[[ Line: 2632 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v6 (copy), v2 (copy), v3 (copy)
    local v437 = v7.new();
    if v436.anchor_point ~= nil then
        v437.anchor_point = v6.Vector2Prop.jsonDecode(v436.anchor_point);
    end;
    if v436.anchorPoint ~= nil then
        v437.anchor_point = v6.Vector2Prop.jsonDecode(v436.anchorPoint);
    end;
    if v436.layout_order ~= nil then
        v437.layout_order = v6.FloatProp.jsonDecode(v436.layout_order);
    end;
    if v436.layoutOrder ~= nil then
        v437.layout_order = v6.FloatProp.jsonDecode(v436.layoutOrder);
    end;
    if v436.position ~= nil then
        v437.position = v6.UDim2Prop.jsonDecode(v436.position);
    end;
    if v436.visible ~= nil then
        v437.visible = v6.FloatProp.jsonDecode(v436.visible);
    end;
    if v436.z_index ~= nil then
        v437.z_index = v6.FloatProp.jsonDecode(v436.z_index);
    end;
    if v436.zIndex ~= nil then
        v437.z_index = v6.FloatProp.jsonDecode(v436.zIndex);
    end;
    if v436.tabs ~= nil then
        v437.tabs = v2.ArrayOfTabItemDataProp.jsonDecode(v436.tabs);
    end;
    if v436.default_active_tab_id ~= nil then
        v437.default_active_tab_id = v6.StringProp.jsonDecode(v436.default_active_tab_id);
    end;
    if v436.defaultActiveTabId ~= nil then
        v437.default_active_tab_id = v6.StringProp.jsonDecode(v436.defaultActiveTabId);
    end;
    if v436.active_tab_id ~= nil then
        v437.active_tab_id = v6.StringProp.jsonDecode(v436.active_tab_id);
    end;
    if v436.activeTabId ~= nil then
        v437.active_tab_id = v6.StringProp.jsonDecode(v436.activeTabId);
    end;
    if v436.on_activated ~= nil then
        v437.on_activated = v3.ActionProp.jsonDecode(v436.on_activated);
    end;
    if v436.onActivated ~= nil then
        v437.on_activated = v3.ActionProp.jsonDecode(v436.onActivated);
    end;
    if v436.size ~= nil then
        v437.size = v6.InputSizeProp.jsonDecode(v436.size);
    end;
    if v436.fill_behavior ~= nil then
        v437.fill_behavior = v6.FillBehaviorProp.jsonDecode(v436.fill_behavior);
    end;
    if v436.fillBehavior ~= nil then
        v437.fill_behavior = v6.FillBehaviorProp.jsonDecode(v436.fillBehavior);
    end;
    if v436.on_absolute_size_changed ~= nil then
        v437.on_absolute_size_changed = v3.ActionProp.jsonDecode(v436.on_absolute_size_changed);
    end;
    if v436.onAbsoluteSizeChanged ~= nil then
        v437.on_absolute_size_changed = v3.ActionProp.jsonDecode(v436.onAbsoluteSizeChanged);
    end;
    if v436.on_absolute_position_changed ~= nil then
        v437.on_absolute_position_changed = v3.ActionProp.jsonDecode(v436.on_absolute_position_changed);
    end;
    if v436.onAbsolutePositionChanged ~= nil then
        v437.on_absolute_position_changed = v3.ActionProp.jsonDecode(v436.onAbsolutePositionChanged);
    end;
    return v437;
end;
v7.descriptor = {
    name = "TabsSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.TabsSchema_Props = v7;
v1.default:register(v2.TabsSchema_Props);
return {
    TabItemIconData = v2.TabItemIconData, 
    TabItemIconData_ConditionalOption = v2.TabItemIconData_ConditionalOption, 
    TabItemIconData_ConditionalOptions = v2.TabItemIconData_ConditionalOptions, 
    TabItemIconData_TabItemIcon = v2.TabItemIconData_TabItemIcon, 
    TabItemIconData_TabItemIconOrString = v2.TabItemIconData_TabItemIconOrString, 
    TabItemData = v2.TabItemData, 
    TabItemData_ConditionalOption = v2.TabItemData_ConditionalOption, 
    TabItemData_ConditionalOptions = v2.TabItemData_ConditionalOptions, 
    TabItemData_TabItem = v2.TabItemData_TabItem, 
    ArrayOfTabItemDataProp = v2.ArrayOfTabItemDataProp, 
    ArrayOfTabItemDataProp_ConditionalOption = v2.ArrayOfTabItemDataProp_ConditionalOption, 
    ArrayOfTabItemDataProp_ConditionalOptions = v2.ArrayOfTabItemDataProp_ConditionalOptions, 
    ArrayOfTabItemDataProp_ArrayOfTabItemData = v2.ArrayOfTabItemDataProp_ArrayOfTabItemData, 
    TabsSchema = v2.TabsSchema, 
    TabsSchema_Props = v2.TabsSchema_Props
};