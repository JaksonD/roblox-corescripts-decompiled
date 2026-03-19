local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 107 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 114 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.props ~= nil then
        local v12 = v9.props:encode();
        local v13, v14 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
        v13, v14 = v0.writeBuffer(v13, v14, v12, buffer.len(v12));
        v10 = v13;
        v11 = v14;
    end;
    if v9.shared ~= nil then
        local v15 = v9.shared:encode();
        local v16, v17 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeBuffer(v16, v17, v15, buffer.len(v15));
        v10 = v16;
        v11 = v17;
    end;
    local v18 = buffer.create(v11);
    buffer.copy(v18, 0, v10, 0, v11);
    return v18;
end;
v6.decode = function(v19) --[[ Line: 135 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy), v2 (copy), v5 (copy)
    local v20 = l_v6_0.new();
    local v21 = 0;
    while v21 < buffer.len(v19) do
        local v22 = nil;
        local v23 = nil;
        local v24, v25, v26 = v0.readTag(v19, v21);
        v22 = v24;
        v23 = v25;
        v21 = v26;
        if v23 == v0.wireTypes.varint then
            v24 = nil;
            v25, v26 = v0.readVarInt(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.lengthDelimited then
            if v22 == 1 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.props = v2.DialogSchema_Props.decode(v24);
            elseif v22 == 2 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.shared = v5.ComponentShared.decode(v24);
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v21 = v26 + v25;
            end;
        elseif v23 == v0.wireTypes.i32 then
            v24 = nil;
            v25, v26 = v0.readFixed32(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.i64 then
            v24 = nil;
            v25, v26 = v0.readFixed64(v19, v21);
            v24 = v25;
            v21 = v26;
        else
            error("Unsupported wire type: " .. v23);
        end;
    end;
    return v20;
end;
v6.jsonEncode = function(v27) --[[ Line: 183 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 197 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.DialogSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "DialogSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DialogSchema"
};
v2.DialogSchema = v6;
v1.default:register(v2.DialogSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 226 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        image = if not (v31 ~= nil) or v31.image == nil then nil else v31.image, 
        image_aspect_ratio = if not (v31 ~= nil) or v31.image_aspect_ratio == nil then nil else v31.image_aspect_ratio, 
        title_text = if not (v31 ~= nil) or v31.title_text == nil then nil else v31.title_text, 
        body_text = if not (v31 ~= nil) or v31.body_text == nil then nil else v31.body_text, 
        body_component = if not (v31 ~= nil) or v31.body_component == nil then nil else v31.body_component, 
        actions_label = if not (v31 ~= nil) or v31.actions_label == nil then nil else v31.actions_label, 
        actions_orientation = if not (v31 ~= nil) or v31.actions_orientation == nil then nil else v31.actions_orientation, 
        primary_button_action = if not (v31 ~= nil) or v31.primary_button_action == nil then nil else v31.primary_button_action, 
        primary_button_text = if not (v31 ~= nil) or v31.primary_button_text == nil then nil else v31.primary_button_text, 
        primary_button_icon = if not (v31 ~= nil) or v31.primary_button_icon == nil then nil else v31.primary_button_icon, 
        primary_button_input_delay = if not (v31 ~= nil) or v31.primary_button_input_delay == nil then nil else v31.primary_button_input_delay, 
        primary_button_side_effect_action = if not (v31 ~= nil) or v31.primary_button_side_effect_action == nil then nil else v31.primary_button_side_effect_action, 
        secondary_button_action = if not (v31 ~= nil) or v31.secondary_button_action == nil then nil else v31.secondary_button_action, 
        secondary_button_text = if not (v31 ~= nil) or v31.secondary_button_text == nil then nil else v31.secondary_button_text, 
        secondary_button_icon = if not (v31 ~= nil) or v31.secondary_button_icon == nil then nil else v31.secondary_button_icon, 
        secondary_button_input_delay = if not (v31 ~= nil) or v31.secondary_button_input_delay == nil then nil else v31.secondary_button_input_delay, 
        secondary_button_side_effect_action = if not (v31 ~= nil) or v31.secondary_button_side_effect_action == nil then nil else v31.secondary_button_side_effect_action, 
        on_close = if not (v31 ~= nil) or v31.on_close == nil then nil else v31.on_close, 
        disable_portal = if not (v31 ~= nil) or v31.disable_portal == nil then nil else v31.disable_portal, 
        has_backdrop = if not (v31 ~= nil) or v31.has_backdrop == nil then nil else v31.has_backdrop
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 276 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.size ~= nil then
        local v35 = v32.size:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.image ~= nil then
        local v38 = v32.image:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.image_aspect_ratio ~= nil then
        local v41 = v32.image_aspect_ratio:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.title_text ~= nil then
        local v44 = v32.title_text:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.body_text ~= nil then
        local v47 = v32.body_text:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.body_component ~= nil then
        local v50 = v32.body_component:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.actions_label ~= nil then
        local v53 = v32.actions_label:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.actions_orientation ~= nil then
        local v56 = v32.actions_orientation:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.primary_button_action ~= nil then
        local v59 = v32.primary_button_action:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.primary_button_text ~= nil then
        local v62 = v32.primary_button_text:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.primary_button_icon ~= nil then
        local v65 = v32.primary_button_icon:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.primary_button_input_delay ~= nil then
        local v68 = v32.primary_button_input_delay:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.primary_button_side_effect_action ~= nil then
        local v71 = v32.primary_button_side_effect_action:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.secondary_button_action ~= nil then
        local v74 = v32.secondary_button_action:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.secondary_button_text ~= nil then
        local v77 = v32.secondary_button_text:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.secondary_button_icon ~= nil then
        local v80 = v32.secondary_button_icon:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.secondary_button_input_delay ~= nil then
        local v83 = v32.secondary_button_input_delay:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.secondary_button_side_effect_action ~= nil then
        local v86 = v32.secondary_button_side_effect_action:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    if v32.on_close ~= nil then
        local v89 = v32.on_close:encode();
        local v90, v91 = v0.writeTag(v33, v34, 19, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v33 = v90;
        v34 = v91;
    end;
    if v32.disable_portal ~= nil then
        local v92 = v32.disable_portal:encode();
        local v93, v94 = v0.writeTag(v33, v34, 20, v0.wireTypes.lengthDelimited);
        v93, v94 = v0.writeBuffer(v93, v94, v92, buffer.len(v92));
        v33 = v93;
        v34 = v94;
    end;
    if v32.has_backdrop ~= nil then
        local v95 = v32.has_backdrop:encode();
        local v96, v97 = v0.writeTag(v33, v34, 21, v0.wireTypes.lengthDelimited);
        v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
        v33 = v96;
        v34 = v97;
    end;
    local v98 = buffer.create(v34);
    buffer.copy(v98, 0, v33, 0, v34);
    return v98;
end;
v6.decode = function(v99) --[[ Line: 411 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v100 = v6.new();
    local v101 = 0;
    while v101 < buffer.len(v99) do
        local v102 = nil;
        local v103 = nil;
        local v104, v105, v106 = v0.readTag(v99, v101);
        v102 = v104;
        v103 = v105;
        v101 = v106;
        if v103 == v0.wireTypes.varint then
            v104 = nil;
            v105, v106 = v0.readVarInt(v99, v101);
            v104 = v105;
            v101 = v106;
        elseif v103 == v0.wireTypes.lengthDelimited then
            if v102 == 1 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.size = v3.StringProp.decode(v104);
            elseif v102 == 2 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.image = v3.StringProp.decode(v104);
            elseif v102 == 3 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.image_aspect_ratio = v3.FloatProp.decode(v104);
            elseif v102 == 4 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.title_text = v3.StringProp.decode(v104);
            elseif v102 == 5 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.body_text = v3.StringProp.decode(v104);
            elseif v102 == 6 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.body_component = v3.NestedComponentProp.decode(v104);
            elseif v102 == 7 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.actions_label = v3.StringProp.decode(v104);
            elseif v102 == 8 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.actions_orientation = v3.StringProp.decode(v104);
            elseif v102 == 9 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.primary_button_action = v4.ActionProp.decode(v104);
            elseif v102 == 10 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.primary_button_text = v3.StringProp.decode(v104);
            elseif v102 == 11 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.primary_button_icon = v3.IconProp.decode(v104);
            elseif v102 == 12 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.primary_button_input_delay = v3.FloatProp.decode(v104);
            elseif v102 == 13 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.primary_button_side_effect_action = v4.ActionProp.decode(v104);
            elseif v102 == 14 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.secondary_button_action = v4.ActionProp.decode(v104);
            elseif v102 == 15 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.secondary_button_text = v3.StringProp.decode(v104);
            elseif v102 == 16 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.secondary_button_icon = v3.IconProp.decode(v104);
            elseif v102 == 17 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.secondary_button_input_delay = v3.FloatProp.decode(v104);
            elseif v102 == 18 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.secondary_button_side_effect_action = v4.ActionProp.decode(v104);
            elseif v102 == 19 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.on_close = v4.ActionProp.decode(v104);
            elseif v102 == 20 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.disable_portal = v3.BoolProp.decode(v104);
            elseif v102 == 21 then
                v104 = nil;
                v105, v106 = v0.readBuffer(v99, v101);
                v104 = v105;
                v101 = v106;
                v100.has_backdrop = v3.BoolProp.decode(v104);
            else
                v104 = nil;
                v105, v106 = v0.readVarInt(v99, v101);
                v101 = v106 + v105;
            end;
        elseif v103 == v0.wireTypes.i32 then
            v104 = nil;
            v105, v106 = v0.readFixed32(v99, v101);
            v104 = v105;
            v101 = v106;
        elseif v103 == v0.wireTypes.i64 then
            v104 = nil;
            v105, v106 = v0.readFixed64(v99, v101);
            v104 = v105;
            v101 = v106;
        else
            error("Unsupported wire type: " .. v103);
        end;
    end;
    return v100;
end;
v6.jsonEncode = function(v107) --[[ Line: 564 ]] --[[ Name: jsonEncode ]]
    local v108 = {};
    if v107.size ~= nil then
        v108.size = v107.size:jsonEncode();
    end;
    if v107.image ~= nil then
        v108.image = v107.image:jsonEncode();
    end;
    if v107.image_aspect_ratio ~= nil then
        v108.imageAspectRatio = v107.image_aspect_ratio:jsonEncode();
    end;
    if v107.title_text ~= nil then
        v108.titleText = v107.title_text:jsonEncode();
    end;
    if v107.body_text ~= nil then
        v108.bodyText = v107.body_text:jsonEncode();
    end;
    if v107.body_component ~= nil then
        v108.bodyComponent = v107.body_component:jsonEncode();
    end;
    if v107.actions_label ~= nil then
        v108.actionsLabel = v107.actions_label:jsonEncode();
    end;
    if v107.actions_orientation ~= nil then
        v108.actionsOrientation = v107.actions_orientation:jsonEncode();
    end;
    if v107.primary_button_action ~= nil then
        v108.primaryButtonAction = v107.primary_button_action:jsonEncode();
    end;
    if v107.primary_button_text ~= nil then
        v108.primaryButtonText = v107.primary_button_text:jsonEncode();
    end;
    if v107.primary_button_icon ~= nil then
        v108.primaryButtonIcon = v107.primary_button_icon:jsonEncode();
    end;
    if v107.primary_button_input_delay ~= nil then
        v108.primaryButtonInputDelay = v107.primary_button_input_delay:jsonEncode();
    end;
    if v107.primary_button_side_effect_action ~= nil then
        v108.primaryButtonSideEffectAction = v107.primary_button_side_effect_action:jsonEncode();
    end;
    if v107.secondary_button_action ~= nil then
        v108.secondaryButtonAction = v107.secondary_button_action:jsonEncode();
    end;
    if v107.secondary_button_text ~= nil then
        v108.secondaryButtonText = v107.secondary_button_text:jsonEncode();
    end;
    if v107.secondary_button_icon ~= nil then
        v108.secondaryButtonIcon = v107.secondary_button_icon:jsonEncode();
    end;
    if v107.secondary_button_input_delay ~= nil then
        v108.secondaryButtonInputDelay = v107.secondary_button_input_delay:jsonEncode();
    end;
    if v107.secondary_button_side_effect_action ~= nil then
        v108.secondaryButtonSideEffectAction = v107.secondary_button_side_effect_action:jsonEncode();
    end;
    if v107.on_close ~= nil then
        v108.onClose = v107.on_close:jsonEncode();
    end;
    if v107.disable_portal ~= nil then
        v108.disablePortal = v107.disable_portal:jsonEncode();
    end;
    if v107.has_backdrop ~= nil then
        v108.hasBackdrop = v107.has_backdrop:jsonEncode();
    end;
    return v108;
end;
v6.jsonDecode = function(v109) --[[ Line: 654 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v110 = v6.new();
    if v109.size ~= nil then
        v110.size = v3.StringProp.jsonDecode(v109.size);
    end;
    if v109.image ~= nil then
        v110.image = v3.StringProp.jsonDecode(v109.image);
    end;
    if v109.image_aspect_ratio ~= nil then
        v110.image_aspect_ratio = v3.FloatProp.jsonDecode(v109.image_aspect_ratio);
    end;
    if v109.imageAspectRatio ~= nil then
        v110.image_aspect_ratio = v3.FloatProp.jsonDecode(v109.imageAspectRatio);
    end;
    if v109.title_text ~= nil then
        v110.title_text = v3.StringProp.jsonDecode(v109.title_text);
    end;
    if v109.titleText ~= nil then
        v110.title_text = v3.StringProp.jsonDecode(v109.titleText);
    end;
    if v109.body_text ~= nil then
        v110.body_text = v3.StringProp.jsonDecode(v109.body_text);
    end;
    if v109.bodyText ~= nil then
        v110.body_text = v3.StringProp.jsonDecode(v109.bodyText);
    end;
    if v109.body_component ~= nil then
        v110.body_component = v3.NestedComponentProp.jsonDecode(v109.body_component);
    end;
    if v109.bodyComponent ~= nil then
        v110.body_component = v3.NestedComponentProp.jsonDecode(v109.bodyComponent);
    end;
    if v109.actions_label ~= nil then
        v110.actions_label = v3.StringProp.jsonDecode(v109.actions_label);
    end;
    if v109.actionsLabel ~= nil then
        v110.actions_label = v3.StringProp.jsonDecode(v109.actionsLabel);
    end;
    if v109.actions_orientation ~= nil then
        v110.actions_orientation = v3.StringProp.jsonDecode(v109.actions_orientation);
    end;
    if v109.actionsOrientation ~= nil then
        v110.actions_orientation = v3.StringProp.jsonDecode(v109.actionsOrientation);
    end;
    if v109.primary_button_action ~= nil then
        v110.primary_button_action = v4.ActionProp.jsonDecode(v109.primary_button_action);
    end;
    if v109.primaryButtonAction ~= nil then
        v110.primary_button_action = v4.ActionProp.jsonDecode(v109.primaryButtonAction);
    end;
    if v109.primary_button_text ~= nil then
        v110.primary_button_text = v3.StringProp.jsonDecode(v109.primary_button_text);
    end;
    if v109.primaryButtonText ~= nil then
        v110.primary_button_text = v3.StringProp.jsonDecode(v109.primaryButtonText);
    end;
    if v109.primary_button_icon ~= nil then
        v110.primary_button_icon = v3.IconProp.jsonDecode(v109.primary_button_icon);
    end;
    if v109.primaryButtonIcon ~= nil then
        v110.primary_button_icon = v3.IconProp.jsonDecode(v109.primaryButtonIcon);
    end;
    if v109.primary_button_input_delay ~= nil then
        v110.primary_button_input_delay = v3.FloatProp.jsonDecode(v109.primary_button_input_delay);
    end;
    if v109.primaryButtonInputDelay ~= nil then
        v110.primary_button_input_delay = v3.FloatProp.jsonDecode(v109.primaryButtonInputDelay);
    end;
    if v109.primary_button_side_effect_action ~= nil then
        v110.primary_button_side_effect_action = v4.ActionProp.jsonDecode(v109.primary_button_side_effect_action);
    end;
    if v109.primaryButtonSideEffectAction ~= nil then
        v110.primary_button_side_effect_action = v4.ActionProp.jsonDecode(v109.primaryButtonSideEffectAction);
    end;
    if v109.secondary_button_action ~= nil then
        v110.secondary_button_action = v4.ActionProp.jsonDecode(v109.secondary_button_action);
    end;
    if v109.secondaryButtonAction ~= nil then
        v110.secondary_button_action = v4.ActionProp.jsonDecode(v109.secondaryButtonAction);
    end;
    if v109.secondary_button_text ~= nil then
        v110.secondary_button_text = v3.StringProp.jsonDecode(v109.secondary_button_text);
    end;
    if v109.secondaryButtonText ~= nil then
        v110.secondary_button_text = v3.StringProp.jsonDecode(v109.secondaryButtonText);
    end;
    if v109.secondary_button_icon ~= nil then
        v110.secondary_button_icon = v3.IconProp.jsonDecode(v109.secondary_button_icon);
    end;
    if v109.secondaryButtonIcon ~= nil then
        v110.secondary_button_icon = v3.IconProp.jsonDecode(v109.secondaryButtonIcon);
    end;
    if v109.secondary_button_input_delay ~= nil then
        v110.secondary_button_input_delay = v3.FloatProp.jsonDecode(v109.secondary_button_input_delay);
    end;
    if v109.secondaryButtonInputDelay ~= nil then
        v110.secondary_button_input_delay = v3.FloatProp.jsonDecode(v109.secondaryButtonInputDelay);
    end;
    if v109.secondary_button_side_effect_action ~= nil then
        v110.secondary_button_side_effect_action = v4.ActionProp.jsonDecode(v109.secondary_button_side_effect_action);
    end;
    if v109.secondaryButtonSideEffectAction ~= nil then
        v110.secondary_button_side_effect_action = v4.ActionProp.jsonDecode(v109.secondaryButtonSideEffectAction);
    end;
    if v109.on_close ~= nil then
        v110.on_close = v4.ActionProp.jsonDecode(v109.on_close);
    end;
    if v109.onClose ~= nil then
        v110.on_close = v4.ActionProp.jsonDecode(v109.onClose);
    end;
    if v109.disable_portal ~= nil then
        v110.disable_portal = v3.BoolProp.jsonDecode(v109.disable_portal);
    end;
    if v109.disablePortal ~= nil then
        v110.disable_portal = v3.BoolProp.jsonDecode(v109.disablePortal);
    end;
    if v109.has_backdrop ~= nil then
        v110.has_backdrop = v3.BoolProp.jsonDecode(v109.has_backdrop);
    end;
    if v109.hasBackdrop ~= nil then
        v110.has_backdrop = v3.BoolProp.jsonDecode(v109.hasBackdrop);
    end;
    return v110;
end;
v6.descriptor = {
    name = "DialogSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.DialogSchema_Props = v6;
v1.default:register(v2.DialogSchema_Props);
return {
    DialogSchema = v2.DialogSchema, 
    DialogSchema_Props = v2.DialogSchema_Props
};