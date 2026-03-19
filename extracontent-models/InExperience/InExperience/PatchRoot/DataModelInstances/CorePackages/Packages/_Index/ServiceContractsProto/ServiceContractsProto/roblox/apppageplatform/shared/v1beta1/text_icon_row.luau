local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 113 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 134 ]] --[[ Name: decode ]]
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
                v20.props = v2.TextIconRowSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 182 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 196 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.TextIconRowSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "TextIconRowSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TextIconRowSchema"
};
v2.TextIconRowSchema = v6;
v1.default:register(v2.TextIconRowSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 225 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        automatic_size = if not (v31 ~= nil) or v31.automatic_size == nil then nil else v31.automatic_size, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        z_index = if not (v31 ~= nil) or v31.z_index == nil then nil else v31.z_index, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        selectable = if not (v31 ~= nil) or v31.selectable == nil then nil else v31.selectable, 
        icon_first = if not (v31 ~= nil) or v31.icon_first == nil then nil else v31.icon_first, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        text = if not (v31 ~= nil) or v31.text == nil then nil else v31.text, 
        text_color = if not (v31 ~= nil) or v31.text_color == nil then nil else v31.text_color, 
        font_style = if not (v31 ~= nil) or v31.font_style == nil then nil else v31.font_style, 
        gap = if not (v31 ~= nil) or v31.gap == nil then nil else v31.gap, 
        icon = if not (v31 ~= nil) or v31.icon == nil then nil else v31.icon, 
        icon_width = if not (v31 ~= nil) or v31.icon_width == nil then nil else v31.icon_width, 
        icon_color = if not (v31 ~= nil) or v31.icon_color == nil then nil else v31.icon_color, 
        text_flex_mode = if not (v31 ~= nil) or v31.text_flex_mode == nil then nil else v31.text_flex_mode, 
        background_style = if not (v31 ~= nil) or v31.background_style == nil then nil else v31.background_style, 
        corner_radius = if not (v31 ~= nil) or v31.corner_radius == nil then nil else v31.corner_radius
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 249 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.automatic_size ~= nil then
        local v35 = v32.automatic_size:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.layout_order ~= nil then
        local v38 = v32.layout_order:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.anchor_point ~= nil then
        local v41 = v32.anchor_point:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.size ~= nil then
        local v44 = v32.size:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.z_index ~= nil then
        local v47 = v32.z_index:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.position ~= nil then
        local v50 = v32.position:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.selectable ~= nil then
        local v53 = v32.selectable:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.icon_first ~= nil then
        local v56 = v32.icon_first:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.on_activated ~= nil then
        local v59 = v32.on_activated:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.text ~= nil then
        local v62 = v32.text:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.text_color ~= nil then
        local v65 = v32.text_color:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.font_style ~= nil then
        local v68 = v32.font_style:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.gap ~= nil then
        local v71 = v32.gap:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.icon ~= nil then
        local v74 = v32.icon:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.icon_width ~= nil then
        local v77 = v32.icon_width:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.icon_color ~= nil then
        local v80 = v32.icon_color:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.text_flex_mode ~= nil then
        local v83 = v32.text_flex_mode:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.background_style ~= nil then
        local v86 = v32.background_style:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    if v32.corner_radius ~= nil then
        local v89 = v32.corner_radius:encode();
        local v90, v91 = v0.writeTag(v33, v34, 19, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v33 = v90;
        v34 = v91;
    end;
    local v92 = buffer.create(v34);
    buffer.copy(v92, 0, v33, 0, v34);
    return v92;
end;
v6.decode = function(v93) --[[ Line: 372 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v94 = v6.new();
    local v95 = 0;
    while v95 < buffer.len(v93) do
        local v96 = nil;
        local v97 = nil;
        local v98, v99, v100 = v0.readTag(v93, v95);
        v96 = v98;
        v97 = v99;
        v95 = v100;
        if v97 == v0.wireTypes.varint then
            v98 = nil;
            v99, v100 = v0.readVarInt(v93, v95);
            v98 = v99;
            v95 = v100;
        elseif v97 == v0.wireTypes.lengthDelimited then
            if v96 == 1 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.automatic_size = v3.StringProp.decode(v98);
            elseif v96 == 2 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.layout_order = v3.Int32Prop.decode(v98);
            elseif v96 == 3 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.anchor_point = v3.Vector2Prop.decode(v98);
            elseif v96 == 4 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.size = v3.UDim2Prop.decode(v98);
            elseif v96 == 5 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.z_index = v3.FloatProp.decode(v98);
            elseif v96 == 6 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.position = v3.UDim2Prop.decode(v98);
            elseif v96 == 7 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.selectable = v3.BoolProp.decode(v98);
            elseif v96 == 8 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.icon_first = v3.BoolProp.decode(v98);
            elseif v96 == 9 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.on_activated = v4.ActionProp.decode(v98);
            elseif v96 == 10 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.text = v3.StringProp.decode(v98);
            elseif v96 == 11 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.text_color = v3.ColorProp.decode(v98);
            elseif v96 == 12 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.font_style = v3.TypographyProp.decode(v98);
            elseif v96 == 13 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.gap = v3.FloatProp.decode(v98);
            elseif v96 == 14 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.icon = v3.IconProp.decode(v98);
            elseif v96 == 15 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.icon_width = v3.FloatProp.decode(v98);
            elseif v96 == 16 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.icon_color = v3.ColorProp.decode(v98);
            elseif v96 == 17 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.text_flex_mode = v3.StringProp.decode(v98);
            elseif v96 == 18 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.background_style = v3.TypographyProp.decode(v98);
            elseif v96 == 19 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.corner_radius = v3.UDimProp.decode(v98);
            else
                v98 = nil;
                v99, v100 = v0.readVarInt(v93, v95);
                v95 = v100 + v99;
            end;
        elseif v97 == v0.wireTypes.i32 then
            v98 = nil;
            v99, v100 = v0.readFixed32(v93, v95);
            v98 = v99;
            v95 = v100;
        elseif v97 == v0.wireTypes.i64 then
            v98 = nil;
            v99, v100 = v0.readFixed64(v93, v95);
            v98 = v99;
            v95 = v100;
        else
            error("Unsupported wire type: " .. v97);
        end;
    end;
    return v94;
end;
v6.jsonEncode = function(v101) --[[ Line: 506 ]] --[[ Name: jsonEncode ]]
    local v102 = {};
    if v101.automatic_size ~= nil then
        v102.automaticSize = v101.automatic_size:jsonEncode();
    end;
    if v101.layout_order ~= nil then
        v102.layoutOrder = v101.layout_order:jsonEncode();
    end;
    if v101.anchor_point ~= nil then
        v102.anchorPoint = v101.anchor_point:jsonEncode();
    end;
    if v101.size ~= nil then
        v102.size = v101.size:jsonEncode();
    end;
    if v101.z_index ~= nil then
        v102.zIndex = v101.z_index:jsonEncode();
    end;
    if v101.position ~= nil then
        v102.position = v101.position:jsonEncode();
    end;
    if v101.selectable ~= nil then
        v102.selectable = v101.selectable:jsonEncode();
    end;
    if v101.icon_first ~= nil then
        v102.iconFirst = v101.icon_first:jsonEncode();
    end;
    if v101.on_activated ~= nil then
        v102.onActivated = v101.on_activated:jsonEncode();
    end;
    if v101.text ~= nil then
        v102.text = v101.text:jsonEncode();
    end;
    if v101.text_color ~= nil then
        v102.textColor = v101.text_color:jsonEncode();
    end;
    if v101.font_style ~= nil then
        v102.fontStyle = v101.font_style:jsonEncode();
    end;
    if v101.gap ~= nil then
        v102.gap = v101.gap:jsonEncode();
    end;
    if v101.icon ~= nil then
        v102.icon = v101.icon:jsonEncode();
    end;
    if v101.icon_width ~= nil then
        v102.iconWidth = v101.icon_width:jsonEncode();
    end;
    if v101.icon_color ~= nil then
        v102.iconColor = v101.icon_color:jsonEncode();
    end;
    if v101.text_flex_mode ~= nil then
        v102.textFlexMode = v101.text_flex_mode:jsonEncode();
    end;
    if v101.background_style ~= nil then
        v102.backgroundStyle = v101.background_style:jsonEncode();
    end;
    if v101.corner_radius ~= nil then
        v102.cornerRadius = v101.corner_radius:jsonEncode();
    end;
    return v102;
end;
v6.jsonDecode = function(v103) --[[ Line: 588 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v104 = v6.new();
    if v103.automatic_size ~= nil then
        v104.automatic_size = v3.StringProp.jsonDecode(v103.automatic_size);
    end;
    if v103.automaticSize ~= nil then
        v104.automatic_size = v3.StringProp.jsonDecode(v103.automaticSize);
    end;
    if v103.layout_order ~= nil then
        v104.layout_order = v3.Int32Prop.jsonDecode(v103.layout_order);
    end;
    if v103.layoutOrder ~= nil then
        v104.layout_order = v3.Int32Prop.jsonDecode(v103.layoutOrder);
    end;
    if v103.anchor_point ~= nil then
        v104.anchor_point = v3.Vector2Prop.jsonDecode(v103.anchor_point);
    end;
    if v103.anchorPoint ~= nil then
        v104.anchor_point = v3.Vector2Prop.jsonDecode(v103.anchorPoint);
    end;
    if v103.size ~= nil then
        v104.size = v3.UDim2Prop.jsonDecode(v103.size);
    end;
    if v103.z_index ~= nil then
        v104.z_index = v3.FloatProp.jsonDecode(v103.z_index);
    end;
    if v103.zIndex ~= nil then
        v104.z_index = v3.FloatProp.jsonDecode(v103.zIndex);
    end;
    if v103.position ~= nil then
        v104.position = v3.UDim2Prop.jsonDecode(v103.position);
    end;
    if v103.selectable ~= nil then
        v104.selectable = v3.BoolProp.jsonDecode(v103.selectable);
    end;
    if v103.icon_first ~= nil then
        v104.icon_first = v3.BoolProp.jsonDecode(v103.icon_first);
    end;
    if v103.iconFirst ~= nil then
        v104.icon_first = v3.BoolProp.jsonDecode(v103.iconFirst);
    end;
    if v103.on_activated ~= nil then
        v104.on_activated = v4.ActionProp.jsonDecode(v103.on_activated);
    end;
    if v103.onActivated ~= nil then
        v104.on_activated = v4.ActionProp.jsonDecode(v103.onActivated);
    end;
    if v103.text ~= nil then
        v104.text = v3.StringProp.jsonDecode(v103.text);
    end;
    if v103.text_color ~= nil then
        v104.text_color = v3.ColorProp.jsonDecode(v103.text_color);
    end;
    if v103.textColor ~= nil then
        v104.text_color = v3.ColorProp.jsonDecode(v103.textColor);
    end;
    if v103.font_style ~= nil then
        v104.font_style = v3.TypographyProp.jsonDecode(v103.font_style);
    end;
    if v103.fontStyle ~= nil then
        v104.font_style = v3.TypographyProp.jsonDecode(v103.fontStyle);
    end;
    if v103.gap ~= nil then
        v104.gap = v3.FloatProp.jsonDecode(v103.gap);
    end;
    if v103.icon ~= nil then
        v104.icon = v3.IconProp.jsonDecode(v103.icon);
    end;
    if v103.icon_width ~= nil then
        v104.icon_width = v3.FloatProp.jsonDecode(v103.icon_width);
    end;
    if v103.iconWidth ~= nil then
        v104.icon_width = v3.FloatProp.jsonDecode(v103.iconWidth);
    end;
    if v103.icon_color ~= nil then
        v104.icon_color = v3.ColorProp.jsonDecode(v103.icon_color);
    end;
    if v103.iconColor ~= nil then
        v104.icon_color = v3.ColorProp.jsonDecode(v103.iconColor);
    end;
    if v103.text_flex_mode ~= nil then
        v104.text_flex_mode = v3.StringProp.jsonDecode(v103.text_flex_mode);
    end;
    if v103.textFlexMode ~= nil then
        v104.text_flex_mode = v3.StringProp.jsonDecode(v103.textFlexMode);
    end;
    if v103.background_style ~= nil then
        v104.background_style = v3.TypographyProp.jsonDecode(v103.background_style);
    end;
    if v103.backgroundStyle ~= nil then
        v104.background_style = v3.TypographyProp.jsonDecode(v103.backgroundStyle);
    end;
    if v103.corner_radius ~= nil then
        v104.corner_radius = v3.UDimProp.jsonDecode(v103.corner_radius);
    end;
    if v103.cornerRadius ~= nil then
        v104.corner_radius = v3.UDimProp.jsonDecode(v103.cornerRadius);
    end;
    return v104;
end;
v6.descriptor = {
    name = "TextIconRowSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.TextIconRowSchema_Props = v6;
v1.default:register(v2.TextIconRowSchema_Props);
return {
    TextIconRowSchema = v2.TextIconRowSchema, 
    TextIconRowSchema_Props = v2.TextIconRowSchema_Props
};