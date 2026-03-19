local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.prop_condition);
local v5 = require(script.Parent.component_shared);
local v6 = require(script.Parent.actions);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 334 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        kind = if not (v9 ~= nil) or v9.kind == nil then nil else v9.kind
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 340 ]] --[[ Name: encode ]]
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
v7.decode = function(v22) --[[ Line: 364 ]] --[[ Name: decode ]]
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
                    value = v2.MenuItemProp_MenuItem.decode(v27)
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
                    value = v2.MenuItemProp_ConditionalOptions.decode(v27)
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
v7.jsonEncode = function(v30) --[[ Line: 417 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v32) --[[ Line: 433 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy)
    local v33 = l_v7_0.new();
    if v32.literal ~= nil then
        v33.kind = {
            type = "literal", 
            value = v2.MenuItemProp_MenuItem.jsonDecode(v32.literal)
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
            value = v2.MenuItemProp_ConditionalOptions.jsonDecode(v32.conditional)
        };
    end;
    return v33;
end;
v7.descriptor = {
    name = "MenuItemProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MenuItemProp"
};
v2.MenuItemProp = v7;
v1.default:register(v2.MenuItemProp);
v7 = {};
v7.__index = v7;
local l_v7_1 = v7 --[[ copy: 7 -> 9 ]];
v7.new = function(v35) --[[ Line: 470 ]] --[[ Name: new ]]
    -- upvalues: l_v7_1 (copy)
    return (setmetatable({
        condition = if not (v35 ~= nil) or v35.condition == nil then nil else v35.condition, 
        kind = if not (v35 ~= nil) or v35.kind == nil then nil else v35.kind
    }, l_v7_1));
end;
v7.encode = function(v36) --[[ Line: 479 ]] --[[ Name: encode ]]
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
v7.decode = function(v48) --[[ Line: 505 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_1 (copy), v0 (copy), v4 (copy), v2 (copy)
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
                v49.condition = v4.PropCondition.decode(v53);
            elseif v51 == 2 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.kind = {
                    type = "literal", 
                    value = v2.MenuItemProp_MenuItem.decode(v53)
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
v7.jsonEncode = function(v56) --[[ Line: 558 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v58) --[[ Line: 576 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_1 (copy), v4 (copy), v2 (copy)
    local v59 = l_v7_1.new();
    if v58.condition ~= nil then
        v59.condition = v4.PropCondition.jsonDecode(v58.condition);
    end;
    if v58.literal ~= nil then
        v59.kind = {
            type = "literal", 
            value = v2.MenuItemProp_MenuItem.jsonDecode(v58.literal)
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
    name = "MenuItemProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.MenuItemProp_ConditionalOption = v7;
v1.default:register(v2.MenuItemProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_2 = v7 --[[ copy: 7 -> 10 ]];
v7.new = function(v61) --[[ Line: 613 ]] --[[ Name: new ]]
    -- upvalues: l_v7_2 (copy)
    return (setmetatable({
        options = if not (v61 ~= nil) or v61.options == nil then {} else v61.options
    }, l_v7_2));
end;
v7.encode = function(v62) --[[ Line: 621 ]] --[[ Name: encode ]]
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
v7.decode = function(v71) --[[ Line: 638 ]] --[[ Name: decode ]]
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
                table.insert(v72.options, v2.MenuItemProp_ConditionalOption.decode(v76));
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
v7.jsonEncode = function(v79) --[[ Line: 681 ]] --[[ Name: jsonEncode ]]
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
v7.jsonDecode = function(v84) --[[ Line: 695 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_2 (copy), v2 (copy)
    local v85 = l_v7_2.new();
    if v84.options ~= nil then
        local v86 = {};
        for _, v88 in v84.options do
            table.insert(v86, v2.MenuItemProp_ConditionalOption.jsonDecode(v88));
        end;
        v85.options = v86;
    end;
    return v85;
end;
v7.descriptor = {
    name = "MenuItemProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.MenuItemProp_ConditionalOptions = v7;
v1.default:register(v2.MenuItemProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_3 = v7 --[[ copy: 7 -> 11 ]];
v7.new = function(v90) --[[ Line: 724 ]] --[[ Name: new ]]
    -- upvalues: l_v7_3 (copy)
    return (setmetatable({
        id = if not (v90 ~= nil) or v90.id == nil then nil else v90.id, 
        text = if not (v90 ~= nil) or v90.text == nil then nil else v90.text, 
        icon = if not (v90 ~= nil) or v90.icon == nil then nil else v90.icon, 
        on_activated = if not (v90 ~= nil) or v90.on_activated == nil then nil else v90.on_activated, 
        is_disabled = if not (v90 ~= nil) or v90.is_disabled == nil then nil else v90.is_disabled, 
        is_checked = if not (v90 ~= nil) or v90.is_checked == nil then nil else v90.is_checked, 
        input_size = if not (v90 ~= nil) or v90.input_size == nil then nil else v90.input_size
    }, l_v7_3));
end;
v7.encode = function(v91) --[[ Line: 736 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v92 = buffer.create(0);
    local v93 = 0;
    if v91.id ~= nil then
        local v94 = v91.id:encode();
        local v95, v96 = v0.writeTag(v92, v93, 1, v0.wireTypes.lengthDelimited);
        v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
        v92 = v95;
        v93 = v96;
    end;
    if v91.text ~= nil then
        local v97 = v91.text:encode();
        local v98, v99 = v0.writeTag(v92, v93, 2, v0.wireTypes.lengthDelimited);
        v98, v99 = v0.writeBuffer(v98, v99, v97, buffer.len(v97));
        v92 = v98;
        v93 = v99;
    end;
    if v91.icon ~= nil then
        local v100 = v91.icon:encode();
        local v101, v102 = v0.writeTag(v92, v93, 3, v0.wireTypes.lengthDelimited);
        v101, v102 = v0.writeBuffer(v101, v102, v100, buffer.len(v100));
        v92 = v101;
        v93 = v102;
    end;
    if v91.on_activated ~= nil then
        local v103 = v91.on_activated:encode();
        local v104, v105 = v0.writeTag(v92, v93, 4, v0.wireTypes.lengthDelimited);
        v104, v105 = v0.writeBuffer(v104, v105, v103, buffer.len(v103));
        v92 = v104;
        v93 = v105;
    end;
    if v91.is_disabled ~= nil then
        local v106 = v91.is_disabled:encode();
        local v107, v108 = v0.writeTag(v92, v93, 5, v0.wireTypes.lengthDelimited);
        v107, v108 = v0.writeBuffer(v107, v108, v106, buffer.len(v106));
        v92 = v107;
        v93 = v108;
    end;
    if v91.is_checked ~= nil then
        local v109 = v91.is_checked:encode();
        local v110, v111 = v0.writeTag(v92, v93, 6, v0.wireTypes.lengthDelimited);
        v110, v111 = v0.writeBuffer(v110, v111, v109, buffer.len(v109));
        v92 = v110;
        v93 = v111;
    end;
    if v91.input_size ~= nil then
        local v112 = v91.input_size:encode();
        local v113, v114 = v0.writeTag(v92, v93, 7, v0.wireTypes.lengthDelimited);
        v113, v114 = v0.writeBuffer(v113, v114, v112, buffer.len(v112));
        v92 = v113;
        v93 = v114;
    end;
    local v115 = buffer.create(v93);
    buffer.copy(v115, 0, v92, 0, v93);
    return v115;
end;
v7.decode = function(v116) --[[ Line: 787 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_3 (copy), v0 (copy), v3 (copy), v6 (copy)
    local v117 = l_v7_3.new();
    local v118 = 0;
    while v118 < buffer.len(v116) do
        local v119 = nil;
        local v120 = nil;
        local v121, v122, v123 = v0.readTag(v116, v118);
        v119 = v121;
        v120 = v122;
        v118 = v123;
        if v120 == v0.wireTypes.varint then
            v121 = nil;
            v122, v123 = v0.readVarInt(v116, v118);
            v121 = v122;
            v118 = v123;
        elseif v120 == v0.wireTypes.lengthDelimited then
            if v119 == 1 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.id = v3.StringProp.decode(v121);
            elseif v119 == 2 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.text = v3.StringProp.decode(v121);
            elseif v119 == 3 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.icon = v3.StringProp.decode(v121);
            elseif v119 == 4 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.on_activated = v6.ActionProp.decode(v121);
            elseif v119 == 5 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.is_disabled = v3.BoolProp.decode(v121);
            elseif v119 == 6 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.is_checked = v3.BoolProp.decode(v121);
            elseif v119 == 7 then
                v121 = nil;
                v122, v123 = v0.readBuffer(v116, v118);
                v121 = v122;
                v118 = v123;
                v117.input_size = v3.StringProp.decode(v121);
            else
                v121 = nil;
                v122, v123 = v0.readVarInt(v116, v118);
                v118 = v123 + v122;
            end;
        elseif v120 == v0.wireTypes.i32 then
            v121 = nil;
            v122, v123 = v0.readFixed32(v116, v118);
            v121 = v122;
            v118 = v123;
        elseif v120 == v0.wireTypes.i64 then
            v121 = nil;
            v122, v123 = v0.readFixed64(v116, v118);
            v121 = v122;
            v118 = v123;
        else
            error("Unsupported wire type: " .. v120);
        end;
    end;
    return v117;
end;
v7.jsonEncode = function(v124) --[[ Line: 860 ]] --[[ Name: jsonEncode ]]
    local v125 = {};
    if v124.id ~= nil then
        v125.id = v124.id:jsonEncode();
    end;
    if v124.text ~= nil then
        v125.text = v124.text:jsonEncode();
    end;
    if v124.icon ~= nil then
        v125.icon = v124.icon:jsonEncode();
    end;
    if v124.on_activated ~= nil then
        v125.onActivated = v124.on_activated:jsonEncode();
    end;
    if v124.is_disabled ~= nil then
        v125.isDisabled = v124.is_disabled:jsonEncode();
    end;
    if v124.is_checked ~= nil then
        v125.isChecked = v124.is_checked:jsonEncode();
    end;
    if v124.input_size ~= nil then
        v125.inputSize = v124.input_size:jsonEncode();
    end;
    return v125;
end;
v7.jsonDecode = function(v126) --[[ Line: 894 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_3 (copy), v3 (copy), v6 (copy)
    local v127 = l_v7_3.new();
    if v126.id ~= nil then
        v127.id = v3.StringProp.jsonDecode(v126.id);
    end;
    if v126.text ~= nil then
        v127.text = v3.StringProp.jsonDecode(v126.text);
    end;
    if v126.icon ~= nil then
        v127.icon = v3.StringProp.jsonDecode(v126.icon);
    end;
    if v126.on_activated ~= nil then
        v127.on_activated = v6.ActionProp.jsonDecode(v126.on_activated);
    end;
    if v126.onActivated ~= nil then
        v127.on_activated = v6.ActionProp.jsonDecode(v126.onActivated);
    end;
    if v126.is_disabled ~= nil then
        v127.is_disabled = v3.BoolProp.jsonDecode(v126.is_disabled);
    end;
    if v126.isDisabled ~= nil then
        v127.is_disabled = v3.BoolProp.jsonDecode(v126.isDisabled);
    end;
    if v126.is_checked ~= nil then
        v127.is_checked = v3.BoolProp.jsonDecode(v126.is_checked);
    end;
    if v126.isChecked ~= nil then
        v127.is_checked = v3.BoolProp.jsonDecode(v126.isChecked);
    end;
    if v126.input_size ~= nil then
        v127.input_size = v3.StringProp.jsonDecode(v126.input_size);
    end;
    if v126.inputSize ~= nil then
        v127.input_size = v3.StringProp.jsonDecode(v126.inputSize);
    end;
    return v127;
end;
v7.descriptor = {
    name = "MenuItemProp_MenuItem", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MenuItem"
};
v2.MenuItemProp_MenuItem = v7;
v1.default:register(v2.MenuItemProp_MenuItem);
v7 = {};
v7.__index = v7;
local l_v7_4 = v7 --[[ copy: 7 -> 12 ]];
v7.new = function(v129) --[[ Line: 958 ]] --[[ Name: new ]]
    -- upvalues: l_v7_4 (copy)
    return (setmetatable({
        kind = if not (v129 ~= nil) or v129.kind == nil then nil else v129.kind
    }, l_v7_4));
end;
v7.encode = function(v130) --[[ Line: 964 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v131 = buffer.create(0);
    local v132 = 0;
    if v130.kind ~= nil then
        if v130.kind.type == "literal" then
            local v133 = v130.kind.value:encode();
            local v134, v135 = v0.writeTag(v131, v132, 1, v0.wireTypes.lengthDelimited);
            v134, v135 = v0.writeBuffer(v134, v135, v133, buffer.len(v133));
            v131 = v134;
            v132 = v135;
        elseif v130.kind.type == "binding_path" then
            local v136, v137 = v0.writeTag(v131, v132, 2, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeString(v136, v137, v130.kind.value);
            v131 = v136;
            v132 = v137;
        elseif v130.kind.type == "conditional" then
            local v138 = v130.kind.value:encode();
            local v139, v140 = v0.writeTag(v131, v132, 3, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v131 = v139;
            v132 = v140;
        end;
    end;
    local v141 = buffer.create(v132);
    buffer.copy(v141, 0, v131, 0, v132);
    return v141;
end;
v7.decode = function(v142) --[[ Line: 988 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_4 (copy), v0 (copy), v2 (copy)
    local v143 = l_v7_4.new();
    local v144 = 0;
    while v144 < buffer.len(v142) do
        local v145 = nil;
        local v146 = nil;
        local v147, v148, v149 = v0.readTag(v142, v144);
        v145 = v147;
        v146 = v148;
        v144 = v149;
        if v146 == v0.wireTypes.varint then
            v147 = nil;
            v148, v149 = v0.readVarInt(v142, v144);
            v147 = v148;
            v144 = v149;
        elseif v146 == v0.wireTypes.lengthDelimited then
            if v145 == 1 then
                v147 = nil;
                v148, v149 = v0.readBuffer(v142, v144);
                v147 = v148;
                v144 = v149;
                v143.kind = {
                    type = "literal", 
                    value = v2.ArrayOfMenuItemProp_ArrayOfMenuItems.decode(v147)
                };
            elseif v145 == 2 then
                v147 = nil;
                v148, v149 = v0.readBuffer(v142, v144);
                v147 = v148;
                v144 = v149;
                v143.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v147)
                };
            elseif v145 == 3 then
                v147 = nil;
                v148, v149 = v0.readBuffer(v142, v144);
                v147 = v148;
                v144 = v149;
                v143.kind = {
                    type = "conditional", 
                    value = v2.ArrayOfMenuItemProp_ConditionalOptions.decode(v147)
                };
            else
                v147 = nil;
                v148, v149 = v0.readVarInt(v142, v144);
                v144 = v149 + v148;
            end;
        elseif v146 == v0.wireTypes.i32 then
            v147 = nil;
            v148, v149 = v0.readFixed32(v142, v144);
            v147 = v148;
            v144 = v149;
        elseif v146 == v0.wireTypes.i64 then
            v147 = nil;
            v148, v149 = v0.readFixed64(v142, v144);
            v147 = v148;
            v144 = v149;
        else
            error("Unsupported wire type: " .. v146);
        end;
    end;
    return v143;
end;
v7.jsonEncode = function(v150) --[[ Line: 1043 ]] --[[ Name: jsonEncode ]]
    local v151 = {};
    if v150.kind ~= nil then
        if v150.kind.type == "literal" then
            v151.literal = v150.kind.value:jsonEncode();
            return v151;
        elseif v150.kind.type == "binding_path" then
            v151.bindingPath = v150.kind.value;
            return v151;
        elseif v150.kind.type == "conditional" then
            v151.conditional = v150.kind.value:jsonEncode();
        end;
    end;
    return v151;
end;
v7.jsonDecode = function(v152) --[[ Line: 1059 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_4 (copy), v2 (copy)
    local v153 = l_v7_4.new();
    if v152.literal ~= nil then
        v153.kind = {
            type = "literal", 
            value = v2.ArrayOfMenuItemProp_ArrayOfMenuItems.jsonDecode(v152.literal)
        };
    end;
    if v152.binding_path ~= nil then
        v153.kind = {
            type = "binding_path", 
            value = v152.binding_path
        };
    end;
    if v152.bindingPath ~= nil then
        v153.kind = {
            type = "binding_path", 
            value = v152.bindingPath
        };
    end;
    if v152.conditional ~= nil then
        v153.kind = {
            type = "conditional", 
            value = v2.ArrayOfMenuItemProp_ConditionalOptions.jsonDecode(v152.conditional)
        };
    end;
    return v153;
end;
v7.descriptor = {
    name = "ArrayOfMenuItemProp", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfMenuItemProp"
};
v2.ArrayOfMenuItemProp = v7;
v1.default:register(v2.ArrayOfMenuItemProp);
v7 = {};
v7.__index = v7;
local l_v7_5 = v7 --[[ copy: 7 -> 13 ]];
v7.new = function(v155) --[[ Line: 1099 ]] --[[ Name: new ]]
    -- upvalues: l_v7_5 (copy)
    return (setmetatable({
        condition = if not (v155 ~= nil) or v155.condition == nil then nil else v155.condition, 
        kind = if not (v155 ~= nil) or v155.kind == nil then nil else v155.kind
    }, l_v7_5));
end;
v7.encode = function(v156) --[[ Line: 1108 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v157 = buffer.create(0);
    local v158 = 0;
    if v156.condition ~= nil then
        local v159 = v156.condition:encode();
        local v160, v161 = v0.writeTag(v157, v158, 1, v0.wireTypes.lengthDelimited);
        v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
        v157 = v160;
        v158 = v161;
    end;
    if v156.kind ~= nil then
        if v156.kind.type == "literal" then
            local v162 = v156.kind.value:encode();
            local v163, v164 = v0.writeTag(v157, v158, 2, v0.wireTypes.lengthDelimited);
            v163, v164 = v0.writeBuffer(v163, v164, v162, buffer.len(v162));
            v157 = v163;
            v158 = v164;
        elseif v156.kind.type == "binding_path" then
            local v165, v166 = v0.writeTag(v157, v158, 3, v0.wireTypes.lengthDelimited);
            v165, v166 = v0.writeString(v165, v166, v156.kind.value);
            v157 = v165;
            v158 = v166;
        end;
    end;
    local v167 = buffer.create(v158);
    buffer.copy(v167, 0, v157, 0, v158);
    return v167;
end;
v7.decode = function(v168) --[[ Line: 1134 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_5 (copy), v0 (copy), v4 (copy), v2 (copy)
    local v169 = l_v7_5.new();
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
                v169.condition = v4.PropCondition.decode(v173);
            elseif v171 == 2 then
                v173 = nil;
                v174, v175 = v0.readBuffer(v168, v170);
                v173 = v174;
                v170 = v175;
                v169.kind = {
                    type = "literal", 
                    value = v2.ArrayOfMenuItemProp_ArrayOfMenuItems.decode(v173)
                };
            elseif v171 == 3 then
                v173 = nil;
                v174, v175 = v0.readBuffer(v168, v170);
                v173 = v174;
                v170 = v175;
                v169.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v173)
                };
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
v7.jsonEncode = function(v176) --[[ Line: 1188 ]] --[[ Name: jsonEncode ]]
    local v177 = {};
    if v176.condition ~= nil then
        v177.condition = v176.condition:jsonEncode();
    end;
    if v176.kind ~= nil then
        if v176.kind.type == "literal" then
            v177.literal = v176.kind.value:jsonEncode();
            return v177;
        elseif v176.kind.type == "binding_path" then
            v177.bindingPath = v176.kind.value;
        end;
    end;
    return v177;
end;
v7.jsonDecode = function(v178) --[[ Line: 1206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_5 (copy), v4 (copy), v2 (copy)
    local v179 = l_v7_5.new();
    if v178.condition ~= nil then
        v179.condition = v4.PropCondition.jsonDecode(v178.condition);
    end;
    if v178.literal ~= nil then
        v179.kind = {
            type = "literal", 
            value = v2.ArrayOfMenuItemProp_ArrayOfMenuItems.jsonDecode(v178.literal)
        };
    end;
    if v178.binding_path ~= nil then
        v179.kind = {
            type = "binding_path", 
            value = v178.binding_path
        };
    end;
    if v178.bindingPath ~= nil then
        v179.kind = {
            type = "binding_path", 
            value = v178.bindingPath
        };
    end;
    return v179;
end;
v7.descriptor = {
    name = "ArrayOfMenuItemProp_ConditionalOption", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
};
v2.ArrayOfMenuItemProp_ConditionalOption = v7;
v1.default:register(v2.ArrayOfMenuItemProp_ConditionalOption);
v7 = {};
v7.__index = v7;
local l_v7_6 = v7 --[[ copy: 7 -> 14 ]];
v7.new = function(v181) --[[ Line: 1246 ]] --[[ Name: new ]]
    -- upvalues: l_v7_6 (copy)
    return (setmetatable({
        options = if not (v181 ~= nil) or v181.options == nil then {} else v181.options
    }, l_v7_6));
end;
v7.encode = function(v182) --[[ Line: 1254 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v183 = buffer.create(0);
    local v184 = 0;
    if v182.options ~= nil and #v182.options > 0 then
        for _, v186 in v182.options do
            local v187 = v186:encode();
            local v188, v189 = v0.writeTag(v183, v184, 1, v0.wireTypes.lengthDelimited);
            v188, v189 = v0.writeBuffer(v188, v189, v187, buffer.len(v187));
            v183 = v188;
            v184 = v189;
        end;
    end;
    local v190 = buffer.create(v184);
    buffer.copy(v190, 0, v183, 0, v184);
    return v190;
end;
v7.decode = function(v191) --[[ Line: 1271 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_6 (copy), v0 (copy), v2 (copy)
    local v192 = l_v7_6.new();
    local v193 = 0;
    while v193 < buffer.len(v191) do
        local v194 = nil;
        local v195 = nil;
        local v196, v197, v198 = v0.readTag(v191, v193);
        v194 = v196;
        v195 = v197;
        v193 = v198;
        if v195 == v0.wireTypes.varint then
            v196 = nil;
            v197, v198 = v0.readVarInt(v191, v193);
            v196 = v197;
            v193 = v198;
        elseif v195 == v0.wireTypes.lengthDelimited then
            if v194 == 1 then
                v196 = nil;
                v197, v198 = v0.readBuffer(v191, v193);
                v196 = v197;
                v193 = v198;
                table.insert(v192.options, v2.ArrayOfMenuItemProp_ConditionalOption.decode(v196));
            else
                v196 = nil;
                v197, v198 = v0.readVarInt(v191, v193);
                v193 = v198 + v197;
            end;
        elseif v195 == v0.wireTypes.i32 then
            v196 = nil;
            v197, v198 = v0.readFixed32(v191, v193);
            v196 = v197;
            v193 = v198;
        elseif v195 == v0.wireTypes.i64 then
            v196 = nil;
            v197, v198 = v0.readFixed64(v191, v193);
            v196 = v197;
            v193 = v198;
        else
            error("Unsupported wire type: " .. v195);
        end;
    end;
    return v192;
end;
v7.jsonEncode = function(v199) --[[ Line: 1314 ]] --[[ Name: jsonEncode ]]
    local v200 = {};
    if v199.options ~= nil and #v199.options > 0 then
        local v201 = {};
        for _, v203 in v199.options do
            table.insert(v201, v203:jsonEncode());
        end;
        v200.options = v201;
    end;
    return v200;
end;
v7.jsonDecode = function(v204) --[[ Line: 1328 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_6 (copy), v2 (copy)
    local v205 = l_v7_6.new();
    if v204.options ~= nil then
        local v206 = {};
        for _, v208 in v204.options do
            table.insert(v206, v2.ArrayOfMenuItemProp_ConditionalOption.jsonDecode(v208));
        end;
        v205.options = v206;
    end;
    return v205;
end;
v7.descriptor = {
    name = "ArrayOfMenuItemProp_ConditionalOptions", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
};
v2.ArrayOfMenuItemProp_ConditionalOptions = v7;
v1.default:register(v2.ArrayOfMenuItemProp_ConditionalOptions);
v7 = {};
v7.__index = v7;
local l_v7_7 = v7 --[[ copy: 7 -> 15 ]];
v7.new = function(v210) --[[ Line: 1359 ]] --[[ Name: new ]]
    -- upvalues: l_v7_7 (copy)
    return (setmetatable({
        array = if not (v210 ~= nil) or v210.array == nil then {} else v210.array
    }, l_v7_7));
end;
v7.encode = function(v211) --[[ Line: 1367 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v212 = buffer.create(0);
    local v213 = 0;
    if v211.array ~= nil and #v211.array > 0 then
        for _, v215 in v211.array do
            local v216 = v215:encode();
            local v217, v218 = v0.writeTag(v212, v213, 1, v0.wireTypes.lengthDelimited);
            v217, v218 = v0.writeBuffer(v217, v218, v216, buffer.len(v216));
            v212 = v217;
            v213 = v218;
        end;
    end;
    local v219 = buffer.create(v213);
    buffer.copy(v219, 0, v212, 0, v213);
    return v219;
end;
v7.decode = function(v220) --[[ Line: 1384 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_7 (copy), v0 (copy), v2 (copy)
    local v221 = l_v7_7.new();
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
                table.insert(v221.array, v2.MenuItemProp.decode(v225));
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
v7.jsonEncode = function(v228) --[[ Line: 1427 ]] --[[ Name: jsonEncode ]]
    local v229 = {};
    if v228.array ~= nil and #v228.array > 0 then
        local v230 = {};
        for _, v232 in v228.array do
            table.insert(v230, v232:jsonEncode());
        end;
        v229.array = v230;
    end;
    return v229;
end;
v7.jsonDecode = function(v233) --[[ Line: 1441 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_7 (copy), v2 (copy)
    local v234 = l_v7_7.new();
    if v233.array ~= nil then
        local v235 = {};
        for _, v237 in v233.array do
            table.insert(v235, v2.MenuItemProp.jsonDecode(v237));
        end;
        v234.array = v235;
    end;
    return v234;
end;
v7.descriptor = {
    name = "ArrayOfMenuItemProp_ArrayOfMenuItems", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfMenuItems"
};
v2.ArrayOfMenuItemProp_ArrayOfMenuItems = v7;
v1.default:register(v2.ArrayOfMenuItemProp_ArrayOfMenuItems);
v7 = {};
v7.__index = v7;
local l_v7_8 = v7 --[[ copy: 7 -> 16 ]];
v7.new = function(v239) --[[ Line: 1472 ]] --[[ Name: new ]]
    -- upvalues: l_v7_8 (copy)
    return (setmetatable({
        props = if not (v239 ~= nil) or v239.props == nil then nil else v239.props, 
        shared = if not (v239 ~= nil) or v239.shared == nil then nil else v239.shared
    }, l_v7_8));
end;
v7.encode = function(v240) --[[ Line: 1479 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v241 = buffer.create(0);
    local v242 = 0;
    if v240.props ~= nil then
        local v243 = v240.props:encode();
        local v244, v245 = v0.writeTag(v241, v242, 1, v0.wireTypes.lengthDelimited);
        v244, v245 = v0.writeBuffer(v244, v245, v243, buffer.len(v243));
        v241 = v244;
        v242 = v245;
    end;
    if v240.shared ~= nil then
        local v246 = v240.shared:encode();
        local v247, v248 = v0.writeTag(v241, v242, 2, v0.wireTypes.lengthDelimited);
        v247, v248 = v0.writeBuffer(v247, v248, v246, buffer.len(v246));
        v241 = v247;
        v242 = v248;
    end;
    local v249 = buffer.create(v242);
    buffer.copy(v249, 0, v241, 0, v242);
    return v249;
end;
v7.decode = function(v250) --[[ Line: 1500 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_8 (copy), v0 (copy), v2 (copy), v5 (copy)
    local v251 = l_v7_8.new();
    local v252 = 0;
    while v252 < buffer.len(v250) do
        local v253 = nil;
        local v254 = nil;
        local v255, v256, v257 = v0.readTag(v250, v252);
        v253 = v255;
        v254 = v256;
        v252 = v257;
        if v254 == v0.wireTypes.varint then
            v255 = nil;
            v256, v257 = v0.readVarInt(v250, v252);
            v255 = v256;
            v252 = v257;
        elseif v254 == v0.wireTypes.lengthDelimited then
            if v253 == 1 then
                v255 = nil;
                v256, v257 = v0.readBuffer(v250, v252);
                v255 = v256;
                v252 = v257;
                v251.props = v2.OverflowMenuSchema_Props.decode(v255);
            elseif v253 == 2 then
                v255 = nil;
                v256, v257 = v0.readBuffer(v250, v252);
                v255 = v256;
                v252 = v257;
                v251.shared = v5.ComponentShared.decode(v255);
            else
                v255 = nil;
                v256, v257 = v0.readVarInt(v250, v252);
                v252 = v257 + v256;
            end;
        elseif v254 == v0.wireTypes.i32 then
            v255 = nil;
            v256, v257 = v0.readFixed32(v250, v252);
            v255 = v256;
            v252 = v257;
        elseif v254 == v0.wireTypes.i64 then
            v255 = nil;
            v256, v257 = v0.readFixed64(v250, v252);
            v255 = v256;
            v252 = v257;
        else
            error("Unsupported wire type: " .. v254);
        end;
    end;
    return v251;
end;
v7.jsonEncode = function(v258) --[[ Line: 1548 ]] --[[ Name: jsonEncode ]]
    local v259 = {};
    if v258.props ~= nil then
        v259.props = v258.props:jsonEncode();
    end;
    if v258.shared ~= nil then
        v259.shared = v258.shared:jsonEncode();
    end;
    return v259;
end;
v7.jsonDecode = function(v260) --[[ Line: 1562 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_8 (copy), v2 (copy), v5 (copy)
    local v261 = l_v7_8.new();
    if v260.props ~= nil then
        v261.props = v2.OverflowMenuSchema_Props.jsonDecode(v260.props);
    end;
    if v260.shared ~= nil then
        v261.shared = v5.ComponentShared.jsonDecode(v260.shared);
    end;
    return v261;
end;
v7.descriptor = {
    name = "OverflowMenuSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenuSchema"
};
v2.OverflowMenuSchema = v7;
v1.default:register(v2.OverflowMenuSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v262) --[[ Line: 1591 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        items = if not (v262 ~= nil) or v262.items == nil then nil else v262.items, 
        button_variant = if not (v262 ~= nil) or v262.button_variant == nil then nil else v262.button_variant, 
        button_size = if not (v262 ~= nil) or v262.button_size == nil then nil else v262.button_size, 
        button_icon = if not (v262 ~= nil) or v262.button_icon == nil then nil else v262.button_icon, 
        popover_align = if not (v262 ~= nil) or v262.popover_align == nil then nil else v262.popover_align, 
        popover_side = if not (v262 ~= nil) or v262.popover_side == nil then nil else v262.popover_side, 
        menu_width = if not (v262 ~= nil) or v262.menu_width == nil then nil else v262.menu_width, 
        layout_order = if not (v262 ~= nil) or v262.layout_order == nil then nil else v262.layout_order, 
        anchor_point = if not (v262 ~= nil) or v262.anchor_point == nil then nil else v262.anchor_point, 
        position = if not (v262 ~= nil) or v262.position == nil then nil else v262.position, 
        z_index = if not (v262 ~= nil) or v262.z_index == nil then nil else v262.z_index, 
        button_icon_background_style = if not (v262 ~= nil) or v262.button_icon_background_style == nil then nil else v262.button_icon_background_style
    }, v7));
end;
v7.encode = function(v263) --[[ Line: 1610 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v264 = buffer.create(0);
    local v265 = 0;
    if v263.items ~= nil then
        local v266 = v263.items:encode();
        local v267, v268 = v0.writeTag(v264, v265, 1, v0.wireTypes.lengthDelimited);
        v267, v268 = v0.writeBuffer(v267, v268, v266, buffer.len(v266));
        v264 = v267;
        v265 = v268;
    end;
    if v263.button_variant ~= nil then
        local v269 = v263.button_variant:encode();
        local v270, v271 = v0.writeTag(v264, v265, 2, v0.wireTypes.lengthDelimited);
        v270, v271 = v0.writeBuffer(v270, v271, v269, buffer.len(v269));
        v264 = v270;
        v265 = v271;
    end;
    if v263.button_size ~= nil then
        local v272 = v263.button_size:encode();
        local v273, v274 = v0.writeTag(v264, v265, 3, v0.wireTypes.lengthDelimited);
        v273, v274 = v0.writeBuffer(v273, v274, v272, buffer.len(v272));
        v264 = v273;
        v265 = v274;
    end;
    if v263.button_icon ~= nil then
        local v275 = v263.button_icon:encode();
        local v276, v277 = v0.writeTag(v264, v265, 4, v0.wireTypes.lengthDelimited);
        v276, v277 = v0.writeBuffer(v276, v277, v275, buffer.len(v275));
        v264 = v276;
        v265 = v277;
    end;
    if v263.popover_align ~= nil then
        local v278 = v263.popover_align:encode();
        local v279, v280 = v0.writeTag(v264, v265, 5, v0.wireTypes.lengthDelimited);
        v279, v280 = v0.writeBuffer(v279, v280, v278, buffer.len(v278));
        v264 = v279;
        v265 = v280;
    end;
    if v263.popover_side ~= nil then
        local v281 = v263.popover_side:encode();
        local v282, v283 = v0.writeTag(v264, v265, 6, v0.wireTypes.lengthDelimited);
        v282, v283 = v0.writeBuffer(v282, v283, v281, buffer.len(v281));
        v264 = v282;
        v265 = v283;
    end;
    if v263.menu_width ~= nil then
        local v284 = v263.menu_width:encode();
        local v285, v286 = v0.writeTag(v264, v265, 7, v0.wireTypes.lengthDelimited);
        v285, v286 = v0.writeBuffer(v285, v286, v284, buffer.len(v284));
        v264 = v285;
        v265 = v286;
    end;
    if v263.layout_order ~= nil then
        local v287 = v263.layout_order:encode();
        local v288, v289 = v0.writeTag(v264, v265, 8, v0.wireTypes.lengthDelimited);
        v288, v289 = v0.writeBuffer(v288, v289, v287, buffer.len(v287));
        v264 = v288;
        v265 = v289;
    end;
    if v263.anchor_point ~= nil then
        local v290 = v263.anchor_point:encode();
        local v291, v292 = v0.writeTag(v264, v265, 9, v0.wireTypes.lengthDelimited);
        v291, v292 = v0.writeBuffer(v291, v292, v290, buffer.len(v290));
        v264 = v291;
        v265 = v292;
    end;
    if v263.position ~= nil then
        local v293 = v263.position:encode();
        local v294, v295 = v0.writeTag(v264, v265, 10, v0.wireTypes.lengthDelimited);
        v294, v295 = v0.writeBuffer(v294, v295, v293, buffer.len(v293));
        v264 = v294;
        v265 = v295;
    end;
    if v263.z_index ~= nil then
        local v296 = v263.z_index:encode();
        local v297, v298 = v0.writeTag(v264, v265, 11, v0.wireTypes.lengthDelimited);
        v297, v298 = v0.writeBuffer(v297, v298, v296, buffer.len(v296));
        v264 = v297;
        v265 = v298;
    end;
    if v263.button_icon_background_style ~= nil then
        local v299 = v263.button_icon_background_style:encode();
        local v300, v301 = v0.writeTag(v264, v265, 12, v0.wireTypes.lengthDelimited);
        v300, v301 = v0.writeBuffer(v300, v301, v299, buffer.len(v299));
        v264 = v300;
        v265 = v301;
    end;
    local v302 = buffer.create(v265);
    buffer.copy(v302, 0, v264, 0, v265);
    return v302;
end;
v7.decode = function(v303) --[[ Line: 1691 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v304 = v7.new();
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
                v304.items = v2.ArrayOfMenuItemProp.decode(v308);
            elseif v306 == 2 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.button_variant = v3.StringProp.decode(v308);
            elseif v306 == 3 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.button_size = v3.StringProp.decode(v308);
            elseif v306 == 4 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.button_icon = v3.StringProp.decode(v308);
            elseif v306 == 5 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.popover_align = v3.StringProp.decode(v308);
            elseif v306 == 6 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.popover_side = v3.StringProp.decode(v308);
            elseif v306 == 7 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.menu_width = v3.UDim2Prop.decode(v308);
            elseif v306 == 8 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.layout_order = v3.Int32Prop.decode(v308);
            elseif v306 == 9 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.anchor_point = v3.Vector2Prop.decode(v308);
            elseif v306 == 10 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.position = v3.UDim2Prop.decode(v308);
            elseif v306 == 11 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.z_index = v3.Int32Prop.decode(v308);
            elseif v306 == 12 then
                v308 = nil;
                v309, v310 = v0.readBuffer(v303, v305);
                v308 = v309;
                v305 = v310;
                v304.button_icon_background_style = v3.ColorProp.decode(v308);
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
v7.jsonEncode = function(v311) --[[ Line: 1790 ]] --[[ Name: jsonEncode ]]
    local v312 = {};
    if v311.items ~= nil then
        v312.items = v311.items:jsonEncode();
    end;
    if v311.button_variant ~= nil then
        v312.buttonVariant = v311.button_variant:jsonEncode();
    end;
    if v311.button_size ~= nil then
        v312.buttonSize = v311.button_size:jsonEncode();
    end;
    if v311.button_icon ~= nil then
        v312.buttonIcon = v311.button_icon:jsonEncode();
    end;
    if v311.popover_align ~= nil then
        v312.popoverAlign = v311.popover_align:jsonEncode();
    end;
    if v311.popover_side ~= nil then
        v312.popoverSide = v311.popover_side:jsonEncode();
    end;
    if v311.menu_width ~= nil then
        v312.menuWidth = v311.menu_width:jsonEncode();
    end;
    if v311.layout_order ~= nil then
        v312.layoutOrder = v311.layout_order:jsonEncode();
    end;
    if v311.anchor_point ~= nil then
        v312.anchorPoint = v311.anchor_point:jsonEncode();
    end;
    if v311.position ~= nil then
        v312.position = v311.position:jsonEncode();
    end;
    if v311.z_index ~= nil then
        v312.zIndex = v311.z_index:jsonEncode();
    end;
    if v311.button_icon_background_style ~= nil then
        v312.buttonIconBackgroundStyle = v311.button_icon_background_style:jsonEncode();
    end;
    return v312;
end;
v7.jsonDecode = function(v313) --[[ Line: 1844 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v2 (copy), v3 (copy)
    local v314 = v7.new();
    if v313.items ~= nil then
        v314.items = v2.ArrayOfMenuItemProp.jsonDecode(v313.items);
    end;
    if v313.button_variant ~= nil then
        v314.button_variant = v3.StringProp.jsonDecode(v313.button_variant);
    end;
    if v313.buttonVariant ~= nil then
        v314.button_variant = v3.StringProp.jsonDecode(v313.buttonVariant);
    end;
    if v313.button_size ~= nil then
        v314.button_size = v3.StringProp.jsonDecode(v313.button_size);
    end;
    if v313.buttonSize ~= nil then
        v314.button_size = v3.StringProp.jsonDecode(v313.buttonSize);
    end;
    if v313.button_icon ~= nil then
        v314.button_icon = v3.StringProp.jsonDecode(v313.button_icon);
    end;
    if v313.buttonIcon ~= nil then
        v314.button_icon = v3.StringProp.jsonDecode(v313.buttonIcon);
    end;
    if v313.popover_align ~= nil then
        v314.popover_align = v3.StringProp.jsonDecode(v313.popover_align);
    end;
    if v313.popoverAlign ~= nil then
        v314.popover_align = v3.StringProp.jsonDecode(v313.popoverAlign);
    end;
    if v313.popover_side ~= nil then
        v314.popover_side = v3.StringProp.jsonDecode(v313.popover_side);
    end;
    if v313.popoverSide ~= nil then
        v314.popover_side = v3.StringProp.jsonDecode(v313.popoverSide);
    end;
    if v313.menu_width ~= nil then
        v314.menu_width = v3.UDim2Prop.jsonDecode(v313.menu_width);
    end;
    if v313.menuWidth ~= nil then
        v314.menu_width = v3.UDim2Prop.jsonDecode(v313.menuWidth);
    end;
    if v313.layout_order ~= nil then
        v314.layout_order = v3.Int32Prop.jsonDecode(v313.layout_order);
    end;
    if v313.layoutOrder ~= nil then
        v314.layout_order = v3.Int32Prop.jsonDecode(v313.layoutOrder);
    end;
    if v313.anchor_point ~= nil then
        v314.anchor_point = v3.Vector2Prop.jsonDecode(v313.anchor_point);
    end;
    if v313.anchorPoint ~= nil then
        v314.anchor_point = v3.Vector2Prop.jsonDecode(v313.anchorPoint);
    end;
    if v313.position ~= nil then
        v314.position = v3.UDim2Prop.jsonDecode(v313.position);
    end;
    if v313.z_index ~= nil then
        v314.z_index = v3.Int32Prop.jsonDecode(v313.z_index);
    end;
    if v313.zIndex ~= nil then
        v314.z_index = v3.Int32Prop.jsonDecode(v313.zIndex);
    end;
    if v313.button_icon_background_style ~= nil then
        v314.button_icon_background_style = v3.ColorProp.jsonDecode(v313.button_icon_background_style);
    end;
    if v313.buttonIconBackgroundStyle ~= nil then
        v314.button_icon_background_style = v3.ColorProp.jsonDecode(v313.buttonIconBackgroundStyle);
    end;
    return v314;
end;
v7.descriptor = {
    name = "OverflowMenuSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.OverflowMenuSchema_Props = v7;
v1.default:register(v2.OverflowMenuSchema_Props);
return {
    MenuItemProp = v2.MenuItemProp, 
    MenuItemProp_ConditionalOption = v2.MenuItemProp_ConditionalOption, 
    MenuItemProp_ConditionalOptions = v2.MenuItemProp_ConditionalOptions, 
    MenuItemProp_MenuItem = v2.MenuItemProp_MenuItem, 
    ArrayOfMenuItemProp = v2.ArrayOfMenuItemProp, 
    ArrayOfMenuItemProp_ConditionalOption = v2.ArrayOfMenuItemProp_ConditionalOption, 
    ArrayOfMenuItemProp_ConditionalOptions = v2.ArrayOfMenuItemProp_ConditionalOptions, 
    ArrayOfMenuItemProp_ArrayOfMenuItems = v2.ArrayOfMenuItemProp_ArrayOfMenuItems, 
    OverflowMenuSchema = v2.OverflowMenuSchema, 
    OverflowMenuSchema_Props = v2.OverflowMenuSchema_Props
};