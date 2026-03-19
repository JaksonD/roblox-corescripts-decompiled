local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 121 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 130 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 151 ]] --[[ Name: decode ]]
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
                v20.props = v2.CountdownTextIconRowSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 199 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 213 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.CountdownTextIconRowSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "CountdownTextIconRowSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CountdownTextIconRowSchema"
};
v2.CountdownTextIconRowSchema = v6;
v1.default:register(v2.CountdownTextIconRowSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 242 ]] --[[ Name: new ]]
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
        corner_radius = if not (v31 ~= nil) or v31.corner_radius == nil then nil else v31.corner_radius, 
        end_timestamp = if not (v31 ~= nil) or v31.end_timestamp == nil then nil else v31.end_timestamp, 
        format_string_hours_minutes = if not (v31 ~= nil) or v31.format_string_hours_minutes == nil then nil else v31.format_string_hours_minutes, 
        default_string = if not (v31 ~= nil) or v31.default_string == nil then nil else v31.default_string
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 273 ]] --[[ Name: encode ]]
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
    if v32.end_timestamp ~= nil then
        local v92 = v32.end_timestamp:encode();
        local v93, v94 = v0.writeTag(v33, v34, 20, v0.wireTypes.lengthDelimited);
        v93, v94 = v0.writeBuffer(v93, v94, v92, buffer.len(v92));
        v33 = v93;
        v34 = v94;
    end;
    if v32.format_string_hours_minutes ~= nil then
        local v95 = v32.format_string_hours_minutes:encode();
        local v96, v97 = v0.writeTag(v33, v34, 21, v0.wireTypes.lengthDelimited);
        v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
        v33 = v96;
        v34 = v97;
    end;
    if v32.default_string ~= nil then
        local v98 = v32.default_string:encode();
        local v99, v100 = v0.writeTag(v33, v34, 22, v0.wireTypes.lengthDelimited);
        v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
        v33 = v99;
        v34 = v100;
    end;
    local v101 = buffer.create(v34);
    buffer.copy(v101, 0, v33, 0, v34);
    return v101;
end;
v6.decode = function(v102) --[[ Line: 414 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v103 = v6.new();
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
                v103.automatic_size = v3.StringProp.decode(v107);
            elseif v105 == 2 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.layout_order = v3.Int32Prop.decode(v107);
            elseif v105 == 3 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.anchor_point = v3.Vector2Prop.decode(v107);
            elseif v105 == 4 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.size = v3.UDim2Prop.decode(v107);
            elseif v105 == 5 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.z_index = v3.FloatProp.decode(v107);
            elseif v105 == 6 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.position = v3.UDim2Prop.decode(v107);
            elseif v105 == 7 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.selectable = v3.BoolProp.decode(v107);
            elseif v105 == 8 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.icon_first = v3.BoolProp.decode(v107);
            elseif v105 == 9 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.on_activated = v4.ActionProp.decode(v107);
            elseif v105 == 10 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.text = v3.StringProp.decode(v107);
            elseif v105 == 11 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.text_color = v3.ColorProp.decode(v107);
            elseif v105 == 12 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.font_style = v3.TypographyProp.decode(v107);
            elseif v105 == 13 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.gap = v3.FloatProp.decode(v107);
            elseif v105 == 14 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.icon = v3.IconProp.decode(v107);
            elseif v105 == 15 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.icon_width = v3.FloatProp.decode(v107);
            elseif v105 == 16 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.icon_color = v3.ColorProp.decode(v107);
            elseif v105 == 17 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.text_flex_mode = v3.StringProp.decode(v107);
            elseif v105 == 18 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.background_style = v3.TypographyProp.decode(v107);
            elseif v105 == 19 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.corner_radius = v3.UDimProp.decode(v107);
            elseif v105 == 20 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.end_timestamp = v3.FloatProp.decode(v107);
            elseif v105 == 21 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.format_string_hours_minutes = v3.StringProp.decode(v107);
            elseif v105 == 22 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.default_string = v3.StringProp.decode(v107);
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
v6.jsonEncode = function(v110) --[[ Line: 564 ]] --[[ Name: jsonEncode ]]
    local v111 = {};
    if v110.automatic_size ~= nil then
        v111.automaticSize = v110.automatic_size:jsonEncode();
    end;
    if v110.layout_order ~= nil then
        v111.layoutOrder = v110.layout_order:jsonEncode();
    end;
    if v110.anchor_point ~= nil then
        v111.anchorPoint = v110.anchor_point:jsonEncode();
    end;
    if v110.size ~= nil then
        v111.size = v110.size:jsonEncode();
    end;
    if v110.z_index ~= nil then
        v111.zIndex = v110.z_index:jsonEncode();
    end;
    if v110.position ~= nil then
        v111.position = v110.position:jsonEncode();
    end;
    if v110.selectable ~= nil then
        v111.selectable = v110.selectable:jsonEncode();
    end;
    if v110.icon_first ~= nil then
        v111.iconFirst = v110.icon_first:jsonEncode();
    end;
    if v110.on_activated ~= nil then
        v111.onActivated = v110.on_activated:jsonEncode();
    end;
    if v110.text ~= nil then
        v111.text = v110.text:jsonEncode();
    end;
    if v110.text_color ~= nil then
        v111.textColor = v110.text_color:jsonEncode();
    end;
    if v110.font_style ~= nil then
        v111.fontStyle = v110.font_style:jsonEncode();
    end;
    if v110.gap ~= nil then
        v111.gap = v110.gap:jsonEncode();
    end;
    if v110.icon ~= nil then
        v111.icon = v110.icon:jsonEncode();
    end;
    if v110.icon_width ~= nil then
        v111.iconWidth = v110.icon_width:jsonEncode();
    end;
    if v110.icon_color ~= nil then
        v111.iconColor = v110.icon_color:jsonEncode();
    end;
    if v110.text_flex_mode ~= nil then
        v111.textFlexMode = v110.text_flex_mode:jsonEncode();
    end;
    if v110.background_style ~= nil then
        v111.backgroundStyle = v110.background_style:jsonEncode();
    end;
    if v110.corner_radius ~= nil then
        v111.cornerRadius = v110.corner_radius:jsonEncode();
    end;
    if v110.end_timestamp ~= nil then
        v111.endTimestamp = v110.end_timestamp:jsonEncode();
    end;
    if v110.format_string_hours_minutes ~= nil then
        v111.formatStringHoursMinutes = v110.format_string_hours_minutes:jsonEncode();
    end;
    if v110.default_string ~= nil then
        v111.defaultString = v110.default_string:jsonEncode();
    end;
    return v111;
end;
v6.jsonDecode = function(v112) --[[ Line: 658 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v113 = v6.new();
    if v112.automatic_size ~= nil then
        v113.automatic_size = v3.StringProp.jsonDecode(v112.automatic_size);
    end;
    if v112.automaticSize ~= nil then
        v113.automatic_size = v3.StringProp.jsonDecode(v112.automaticSize);
    end;
    if v112.layout_order ~= nil then
        v113.layout_order = v3.Int32Prop.jsonDecode(v112.layout_order);
    end;
    if v112.layoutOrder ~= nil then
        v113.layout_order = v3.Int32Prop.jsonDecode(v112.layoutOrder);
    end;
    if v112.anchor_point ~= nil then
        v113.anchor_point = v3.Vector2Prop.jsonDecode(v112.anchor_point);
    end;
    if v112.anchorPoint ~= nil then
        v113.anchor_point = v3.Vector2Prop.jsonDecode(v112.anchorPoint);
    end;
    if v112.size ~= nil then
        v113.size = v3.UDim2Prop.jsonDecode(v112.size);
    end;
    if v112.z_index ~= nil then
        v113.z_index = v3.FloatProp.jsonDecode(v112.z_index);
    end;
    if v112.zIndex ~= nil then
        v113.z_index = v3.FloatProp.jsonDecode(v112.zIndex);
    end;
    if v112.position ~= nil then
        v113.position = v3.UDim2Prop.jsonDecode(v112.position);
    end;
    if v112.selectable ~= nil then
        v113.selectable = v3.BoolProp.jsonDecode(v112.selectable);
    end;
    if v112.icon_first ~= nil then
        v113.icon_first = v3.BoolProp.jsonDecode(v112.icon_first);
    end;
    if v112.iconFirst ~= nil then
        v113.icon_first = v3.BoolProp.jsonDecode(v112.iconFirst);
    end;
    if v112.on_activated ~= nil then
        v113.on_activated = v4.ActionProp.jsonDecode(v112.on_activated);
    end;
    if v112.onActivated ~= nil then
        v113.on_activated = v4.ActionProp.jsonDecode(v112.onActivated);
    end;
    if v112.text ~= nil then
        v113.text = v3.StringProp.jsonDecode(v112.text);
    end;
    if v112.text_color ~= nil then
        v113.text_color = v3.ColorProp.jsonDecode(v112.text_color);
    end;
    if v112.textColor ~= nil then
        v113.text_color = v3.ColorProp.jsonDecode(v112.textColor);
    end;
    if v112.font_style ~= nil then
        v113.font_style = v3.TypographyProp.jsonDecode(v112.font_style);
    end;
    if v112.fontStyle ~= nil then
        v113.font_style = v3.TypographyProp.jsonDecode(v112.fontStyle);
    end;
    if v112.gap ~= nil then
        v113.gap = v3.FloatProp.jsonDecode(v112.gap);
    end;
    if v112.icon ~= nil then
        v113.icon = v3.IconProp.jsonDecode(v112.icon);
    end;
    if v112.icon_width ~= nil then
        v113.icon_width = v3.FloatProp.jsonDecode(v112.icon_width);
    end;
    if v112.iconWidth ~= nil then
        v113.icon_width = v3.FloatProp.jsonDecode(v112.iconWidth);
    end;
    if v112.icon_color ~= nil then
        v113.icon_color = v3.ColorProp.jsonDecode(v112.icon_color);
    end;
    if v112.iconColor ~= nil then
        v113.icon_color = v3.ColorProp.jsonDecode(v112.iconColor);
    end;
    if v112.text_flex_mode ~= nil then
        v113.text_flex_mode = v3.StringProp.jsonDecode(v112.text_flex_mode);
    end;
    if v112.textFlexMode ~= nil then
        v113.text_flex_mode = v3.StringProp.jsonDecode(v112.textFlexMode);
    end;
    if v112.background_style ~= nil then
        v113.background_style = v3.TypographyProp.jsonDecode(v112.background_style);
    end;
    if v112.backgroundStyle ~= nil then
        v113.background_style = v3.TypographyProp.jsonDecode(v112.backgroundStyle);
    end;
    if v112.corner_radius ~= nil then
        v113.corner_radius = v3.UDimProp.jsonDecode(v112.corner_radius);
    end;
    if v112.cornerRadius ~= nil then
        v113.corner_radius = v3.UDimProp.jsonDecode(v112.cornerRadius);
    end;
    if v112.end_timestamp ~= nil then
        v113.end_timestamp = v3.FloatProp.jsonDecode(v112.end_timestamp);
    end;
    if v112.endTimestamp ~= nil then
        v113.end_timestamp = v3.FloatProp.jsonDecode(v112.endTimestamp);
    end;
    if v112.format_string_hours_minutes ~= nil then
        v113.format_string_hours_minutes = v3.StringProp.jsonDecode(v112.format_string_hours_minutes);
    end;
    if v112.formatStringHoursMinutes ~= nil then
        v113.format_string_hours_minutes = v3.StringProp.jsonDecode(v112.formatStringHoursMinutes);
    end;
    if v112.default_string ~= nil then
        v113.default_string = v3.StringProp.jsonDecode(v112.default_string);
    end;
    if v112.defaultString ~= nil then
        v113.default_string = v3.StringProp.jsonDecode(v112.defaultString);
    end;
    return v113;
end;
v6.descriptor = {
    name = "CountdownTextIconRowSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CountdownTextIconRowSchema_Props = v6;
v1.default:register(v2.CountdownTextIconRowSchema_Props);
return {
    CountdownTextIconRowSchema = v2.CountdownTextIconRowSchema, 
    CountdownTextIconRowSchema_Props = v2.CountdownTextIconRowSchema_Props
};