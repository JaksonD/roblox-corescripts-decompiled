local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 101 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 108 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 129 ]] --[[ Name: decode ]]
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
                v20.props = v2.TextSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 177 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 191 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.TextSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "TextSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TextSchema"
};
v2.TextSchema = v6;
v1.default:register(v2.TextSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 220 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        clips_descendants = if not (v31 ~= nil) or v31.clips_descendants == nil then nil else v31.clips_descendants, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        text = if not (v31 ~= nil) or v31.text == nil then nil else v31.text, 
        rich_text = if not (v31 ~= nil) or v31.rich_text == nil then nil else v31.rich_text, 
        font_style = if not (v31 ~= nil) or v31.font_style == nil then nil else v31.font_style, 
        text_color = if not (v31 ~= nil) or v31.text_color == nil then nil else v31.text_color, 
        text_wrap = if not (v31 ~= nil) or v31.text_wrap == nil then nil else v31.text_wrap, 
        text_truncate = if not (v31 ~= nil) or v31.text_truncate == nil then nil else v31.text_truncate, 
        text_direction = if not (v31 ~= nil) or v31.text_direction == nil then nil else v31.text_direction, 
        text_x_alignment = if not (v31 ~= nil) or v31.text_x_alignment == nil then nil else v31.text_x_alignment, 
        text_y_alignment = if not (v31 ~= nil) or v31.text_y_alignment == nil then nil else v31.text_y_alignment, 
        text_scaled = if not (v31 ~= nil) or v31.text_scaled == nil then nil else v31.text_scaled, 
        automatic_size = if not (v31 ~= nil) or v31.automatic_size == nil then nil else v31.automatic_size, 
        tag = if not (v31 ~= nil) or v31.tag == nil then nil else v31.tag
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 243 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.anchor_point ~= nil then
        local v35 = v32.anchor_point:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.clips_descendants ~= nil then
        local v38 = v32.clips_descendants:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.layout_order ~= nil then
        local v41 = v32.layout_order:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.position ~= nil then
        local v44 = v32.position:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.size ~= nil then
        local v47 = v32.size:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.on_activated ~= nil then
        local v50 = v32.on_activated:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.text ~= nil then
        local v53 = v32.text:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.rich_text ~= nil then
        local v56 = v32.rich_text:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.font_style ~= nil then
        local v59 = v32.font_style:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.text_color ~= nil then
        local v62 = v32.text_color:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.text_wrap ~= nil then
        local v65 = v32.text_wrap:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.text_truncate ~= nil then
        local v68 = v32.text_truncate:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.text_direction ~= nil then
        local v71 = v32.text_direction:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.text_x_alignment ~= nil then
        local v74 = v32.text_x_alignment:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.text_y_alignment ~= nil then
        local v77 = v32.text_y_alignment:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.text_scaled ~= nil then
        local v80 = v32.text_scaled:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.automatic_size ~= nil then
        local v83 = v32.automatic_size:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.tag ~= nil then
        local v86 = v32.tag:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    local v89 = buffer.create(v34);
    buffer.copy(v89, 0, v33, 0, v34);
    return v89;
end;
v6.decode = function(v90) --[[ Line: 360 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v91 = v6.new();
    local v92 = 0;
    while v92 < buffer.len(v90) do
        local v93 = nil;
        local v94 = nil;
        local v95, v96, v97 = v0.readTag(v90, v92);
        v93 = v95;
        v94 = v96;
        v92 = v97;
        if v94 == v0.wireTypes.varint then
            v95 = nil;
            v96, v97 = v0.readVarInt(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.lengthDelimited then
            if v93 == 1 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.anchor_point = v3.Vector2Prop.decode(v95);
            elseif v93 == 2 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.clips_descendants = v3.BoolProp.decode(v95);
            elseif v93 == 3 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.layout_order = v3.Int32Prop.decode(v95);
            elseif v93 == 4 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.position = v3.UDim2Prop.decode(v95);
            elseif v93 == 5 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.size = v3.UDim2Prop.decode(v95);
            elseif v93 == 6 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.on_activated = v4.ActionProp.decode(v95);
            elseif v93 == 7 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text = v3.StringProp.decode(v95);
            elseif v93 == 8 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.rich_text = v3.BoolProp.decode(v95);
            elseif v93 == 9 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.font_style = v3.TypographyProp.decode(v95);
            elseif v93 == 10 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_color = v3.ColorProp.decode(v95);
            elseif v93 == 11 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_wrap = v3.BoolProp.decode(v95);
            elseif v93 == 12 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_truncate = v3.StringProp.decode(v95);
            elseif v93 == 13 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_direction = v3.StringProp.decode(v95);
            elseif v93 == 14 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_x_alignment = v3.StringProp.decode(v95);
            elseif v93 == 15 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_y_alignment = v3.StringProp.decode(v95);
            elseif v93 == 16 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.text_scaled = v3.BoolProp.decode(v95);
            elseif v93 == 17 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.automatic_size = v3.StringProp.decode(v95);
            elseif v93 == 18 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.tag = v3.StringProp.decode(v95);
            else
                v95 = nil;
                v96, v97 = v0.readVarInt(v90, v92);
                v92 = v97 + v96;
            end;
        elseif v94 == v0.wireTypes.i32 then
            v95 = nil;
            v96, v97 = v0.readFixed32(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.i64 then
            v95 = nil;
            v96, v97 = v0.readFixed64(v90, v92);
            v95 = v96;
            v92 = v97;
        else
            error("Unsupported wire type: " .. v94);
        end;
    end;
    return v91;
end;
v6.jsonEncode = function(v98) --[[ Line: 488 ]] --[[ Name: jsonEncode ]]
    local v99 = {};
    if v98.anchor_point ~= nil then
        v99.anchorPoint = v98.anchor_point:jsonEncode();
    end;
    if v98.clips_descendants ~= nil then
        v99.clipsDescendants = v98.clips_descendants:jsonEncode();
    end;
    if v98.layout_order ~= nil then
        v99.layoutOrder = v98.layout_order:jsonEncode();
    end;
    if v98.position ~= nil then
        v99.position = v98.position:jsonEncode();
    end;
    if v98.size ~= nil then
        v99.size = v98.size:jsonEncode();
    end;
    if v98.on_activated ~= nil then
        v99.onActivated = v98.on_activated:jsonEncode();
    end;
    if v98.text ~= nil then
        v99.text = v98.text:jsonEncode();
    end;
    if v98.rich_text ~= nil then
        v99.richText = v98.rich_text:jsonEncode();
    end;
    if v98.font_style ~= nil then
        v99.fontStyle = v98.font_style:jsonEncode();
    end;
    if v98.text_color ~= nil then
        v99.textColor = v98.text_color:jsonEncode();
    end;
    if v98.text_wrap ~= nil then
        v99.textWrap = v98.text_wrap:jsonEncode();
    end;
    if v98.text_truncate ~= nil then
        v99.textTruncate = v98.text_truncate:jsonEncode();
    end;
    if v98.text_direction ~= nil then
        v99.textDirection = v98.text_direction:jsonEncode();
    end;
    if v98.text_x_alignment ~= nil then
        v99.textXAlignment = v98.text_x_alignment:jsonEncode();
    end;
    if v98.text_y_alignment ~= nil then
        v99.textYAlignment = v98.text_y_alignment:jsonEncode();
    end;
    if v98.text_scaled ~= nil then
        v99.textScaled = v98.text_scaled:jsonEncode();
    end;
    if v98.automatic_size ~= nil then
        v99.automaticSize = v98.automatic_size:jsonEncode();
    end;
    if v98.tag ~= nil then
        v99.tag = v98.tag:jsonEncode();
    end;
    return v99;
end;
v6.jsonDecode = function(v100) --[[ Line: 566 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v101 = v6.new();
    if v100.anchor_point ~= nil then
        v101.anchor_point = v3.Vector2Prop.jsonDecode(v100.anchor_point);
    end;
    if v100.anchorPoint ~= nil then
        v101.anchor_point = v3.Vector2Prop.jsonDecode(v100.anchorPoint);
    end;
    if v100.clips_descendants ~= nil then
        v101.clips_descendants = v3.BoolProp.jsonDecode(v100.clips_descendants);
    end;
    if v100.clipsDescendants ~= nil then
        v101.clips_descendants = v3.BoolProp.jsonDecode(v100.clipsDescendants);
    end;
    if v100.layout_order ~= nil then
        v101.layout_order = v3.Int32Prop.jsonDecode(v100.layout_order);
    end;
    if v100.layoutOrder ~= nil then
        v101.layout_order = v3.Int32Prop.jsonDecode(v100.layoutOrder);
    end;
    if v100.position ~= nil then
        v101.position = v3.UDim2Prop.jsonDecode(v100.position);
    end;
    if v100.size ~= nil then
        v101.size = v3.UDim2Prop.jsonDecode(v100.size);
    end;
    if v100.on_activated ~= nil then
        v101.on_activated = v4.ActionProp.jsonDecode(v100.on_activated);
    end;
    if v100.onActivated ~= nil then
        v101.on_activated = v4.ActionProp.jsonDecode(v100.onActivated);
    end;
    if v100.text ~= nil then
        v101.text = v3.StringProp.jsonDecode(v100.text);
    end;
    if v100.rich_text ~= nil then
        v101.rich_text = v3.BoolProp.jsonDecode(v100.rich_text);
    end;
    if v100.richText ~= nil then
        v101.rich_text = v3.BoolProp.jsonDecode(v100.richText);
    end;
    if v100.font_style ~= nil then
        v101.font_style = v3.TypographyProp.jsonDecode(v100.font_style);
    end;
    if v100.fontStyle ~= nil then
        v101.font_style = v3.TypographyProp.jsonDecode(v100.fontStyle);
    end;
    if v100.text_color ~= nil then
        v101.text_color = v3.ColorProp.jsonDecode(v100.text_color);
    end;
    if v100.textColor ~= nil then
        v101.text_color = v3.ColorProp.jsonDecode(v100.textColor);
    end;
    if v100.text_wrap ~= nil then
        v101.text_wrap = v3.BoolProp.jsonDecode(v100.text_wrap);
    end;
    if v100.textWrap ~= nil then
        v101.text_wrap = v3.BoolProp.jsonDecode(v100.textWrap);
    end;
    if v100.text_truncate ~= nil then
        v101.text_truncate = v3.StringProp.jsonDecode(v100.text_truncate);
    end;
    if v100.textTruncate ~= nil then
        v101.text_truncate = v3.StringProp.jsonDecode(v100.textTruncate);
    end;
    if v100.text_direction ~= nil then
        v101.text_direction = v3.StringProp.jsonDecode(v100.text_direction);
    end;
    if v100.textDirection ~= nil then
        v101.text_direction = v3.StringProp.jsonDecode(v100.textDirection);
    end;
    if v100.text_x_alignment ~= nil then
        v101.text_x_alignment = v3.StringProp.jsonDecode(v100.text_x_alignment);
    end;
    if v100.textXAlignment ~= nil then
        v101.text_x_alignment = v3.StringProp.jsonDecode(v100.textXAlignment);
    end;
    if v100.text_y_alignment ~= nil then
        v101.text_y_alignment = v3.StringProp.jsonDecode(v100.text_y_alignment);
    end;
    if v100.textYAlignment ~= nil then
        v101.text_y_alignment = v3.StringProp.jsonDecode(v100.textYAlignment);
    end;
    if v100.text_scaled ~= nil then
        v101.text_scaled = v3.BoolProp.jsonDecode(v100.text_scaled);
    end;
    if v100.textScaled ~= nil then
        v101.text_scaled = v3.BoolProp.jsonDecode(v100.textScaled);
    end;
    if v100.automatic_size ~= nil then
        v101.automatic_size = v3.StringProp.jsonDecode(v100.automatic_size);
    end;
    if v100.automaticSize ~= nil then
        v101.automatic_size = v3.StringProp.jsonDecode(v100.automaticSize);
    end;
    if v100.tag ~= nil then
        v101.tag = v3.StringProp.jsonDecode(v100.tag);
    end;
    return v101;
end;
v6.descriptor = {
    name = "TextSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.TextSchema_Props = v6;
v1.default:register(v2.TextSchema_Props);
return {
    TextSchema = v2.TextSchema, 
    TextSchema_Props = v2.TextSchema_Props
};