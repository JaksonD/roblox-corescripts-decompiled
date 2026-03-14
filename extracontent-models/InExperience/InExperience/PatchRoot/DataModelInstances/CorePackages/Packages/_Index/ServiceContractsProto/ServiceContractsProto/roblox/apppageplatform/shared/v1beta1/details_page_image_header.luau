local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.prop_types_engine);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 111 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 120 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 141 ]] --[[ Name: decode ]]
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
                v20.props = v2.DetailsPageImageHeaderSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 189 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 203 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.DetailsPageImageHeaderSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "DetailsPageImageHeaderSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DetailsPageImageHeaderSchema"
};
v2.DetailsPageImageHeaderSchema = v6;
v1.default:register(v2.DetailsPageImageHeaderSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 232 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        image = if not (v31 ~= nil) or v31.image == nil then nil else v31.image, 
        image_size = if not (v31 ~= nil) or v31.image_size == nil then nil else v31.image_size, 
        tile_size = if not (v31 ~= nil) or v31.tile_size == nil then nil else v31.tile_size, 
        scale_type = if not (v31 ~= nil) or v31.scale_type == nil then nil else v31.scale_type, 
        resample_mode = if not (v31 ~= nil) or v31.resample_mode == nil then nil else v31.resample_mode, 
        image_style = if not (v31 ~= nil) or v31.image_style == nil then nil else v31.image_style, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        visible = if not (v31 ~= nil) or v31.visible == nil then nil else v31.visible, 
        z_index = if not (v31 ~= nil) or v31.z_index == nil then nil else v31.z_index, 
        background_style = if not (v31 ~= nil) or v31.background_style == nil then nil else v31.background_style, 
        automatic_size = if not (v31 ~= nil) or v31.automatic_size == nil then nil else v31.automatic_size, 
        test_id = if not (v31 ~= nil) or v31.test_id == nil then nil else v31.test_id, 
        image_tag = if not (v31 ~= nil) or v31.image_tag == nil then nil else v31.image_tag, 
        image_size_constraint = if not (v31 ~= nil) or v31.image_size_constraint == nil then nil else v31.image_size_constraint
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 258 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.image ~= nil then
        local v35 = v32.image:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.image_size ~= nil then
        local v38 = v32.image_size:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.tile_size ~= nil then
        local v41 = v32.tile_size:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.scale_type ~= nil then
        local v44 = v32.scale_type:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.resample_mode ~= nil then
        local v47 = v32.resample_mode:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.image_style ~= nil then
        local v50 = v32.image_style:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.size ~= nil then
        local v53 = v32.size:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.position ~= nil then
        local v56 = v32.position:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.anchor_point ~= nil then
        local v59 = v32.anchor_point:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.layout_order ~= nil then
        local v62 = v32.layout_order:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.visible ~= nil then
        local v65 = v32.visible:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.z_index ~= nil then
        local v68 = v32.z_index:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.background_style ~= nil then
        local v71 = v32.background_style:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.automatic_size ~= nil then
        local v74 = v32.automatic_size:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.test_id ~= nil then
        local v77 = v32.test_id:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.image_tag ~= nil then
        local v80 = v32.image_tag:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.image_size_constraint ~= nil then
        local v83 = v32.image_size_constraint:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    local v86 = buffer.create(v34);
    buffer.copy(v86, 0, v33, 0, v34);
    return v86;
end;
v6.decode = function(v87) --[[ Line: 369 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v88 = v6.new();
    local v89 = 0;
    while v89 < buffer.len(v87) do
        local v90 = nil;
        local v91 = nil;
        local v92, v93, v94 = v0.readTag(v87, v89);
        v90 = v92;
        v91 = v93;
        v89 = v94;
        if v91 == v0.wireTypes.varint then
            v92 = nil;
            v93, v94 = v0.readVarInt(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.lengthDelimited then
            if v90 == 1 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.image = v3.ImageStringProp.decode(v92);
            elseif v90 == 2 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.image_size = v3.UiScaledUDim2Prop.decode(v92);
            elseif v90 == 3 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.tile_size = v3.UDim2Prop.decode(v92);
            elseif v90 == 4 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.scale_type = v4.ScaleTypeProp.decode(v92);
            elseif v90 == 5 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.resample_mode = v4.ResamplerModeProp.decode(v92);
            elseif v90 == 6 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.image_style = v3.ColorStyleProp.decode(v92);
            elseif v90 == 7 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.size = v3.UiScaledUDim2Prop.decode(v92);
            elseif v90 == 8 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.position = v3.UiScaledUDim2Prop.decode(v92);
            elseif v90 == 9 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.anchor_point = v3.Vector2Prop.decode(v92);
            elseif v90 == 10 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.layout_order = v3.Int32Prop.decode(v92);
            elseif v90 == 11 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.visible = v3.BoolProp.decode(v92);
            elseif v90 == 12 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.z_index = v3.Int32Prop.decode(v92);
            elseif v90 == 13 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.background_style = v3.ColorStyleProp.decode(v92);
            elseif v90 == 14 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.automatic_size = v4.AutomaticSizeProp.decode(v92);
            elseif v90 == 15 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.test_id = v3.StringProp.decode(v92);
            elseif v90 == 16 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.image_tag = v3.StringProp.decode(v92);
            elseif v90 == 17 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.image_size_constraint = v4.SizeConstraintProp.decode(v92);
            else
                v92 = nil;
                v93, v94 = v0.readVarInt(v87, v89);
                v89 = v94 + v93;
            end;
        elseif v91 == v0.wireTypes.i32 then
            v92 = nil;
            v93, v94 = v0.readFixed32(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.i64 then
            v92 = nil;
            v93, v94 = v0.readFixed64(v87, v89);
            v92 = v93;
            v89 = v94;
        else
            error("Unsupported wire type: " .. v91);
        end;
    end;
    return v88;
end;
v6.jsonEncode = function(v95) --[[ Line: 497 ]] --[[ Name: jsonEncode ]]
    local v96 = {};
    if v95.image ~= nil then
        v96.image = v95.image:jsonEncode();
    end;
    if v95.image_size ~= nil then
        v96.imageSize = v95.image_size:jsonEncode();
    end;
    if v95.tile_size ~= nil then
        v96.tileSize = v95.tile_size:jsonEncode();
    end;
    if v95.scale_type ~= nil then
        v96.scaleType = v95.scale_type:jsonEncode();
    end;
    if v95.resample_mode ~= nil then
        v96.resampleMode = v95.resample_mode:jsonEncode();
    end;
    if v95.image_style ~= nil then
        v96.imageStyle = v95.image_style:jsonEncode();
    end;
    if v95.size ~= nil then
        v96.size = v95.size:jsonEncode();
    end;
    if v95.position ~= nil then
        v96.position = v95.position:jsonEncode();
    end;
    if v95.anchor_point ~= nil then
        v96.anchorPoint = v95.anchor_point:jsonEncode();
    end;
    if v95.layout_order ~= nil then
        v96.layoutOrder = v95.layout_order:jsonEncode();
    end;
    if v95.visible ~= nil then
        v96.visible = v95.visible:jsonEncode();
    end;
    if v95.z_index ~= nil then
        v96.zIndex = v95.z_index:jsonEncode();
    end;
    if v95.background_style ~= nil then
        v96.backgroundStyle = v95.background_style:jsonEncode();
    end;
    if v95.automatic_size ~= nil then
        v96.automaticSize = v95.automatic_size:jsonEncode();
    end;
    if v95.test_id ~= nil then
        v96.testId = v95.test_id:jsonEncode();
    end;
    if v95.image_tag ~= nil then
        v96.imageTag = v95.image_tag:jsonEncode();
    end;
    if v95.image_size_constraint ~= nil then
        v96.imageSizeConstraint = v95.image_size_constraint:jsonEncode();
    end;
    return v96;
end;
v6.jsonDecode = function(v97) --[[ Line: 571 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v98 = v6.new();
    if v97.image ~= nil then
        v98.image = v3.ImageStringProp.jsonDecode(v97.image);
    end;
    if v97.image_size ~= nil then
        v98.image_size = v3.UiScaledUDim2Prop.jsonDecode(v97.image_size);
    end;
    if v97.imageSize ~= nil then
        v98.image_size = v3.UiScaledUDim2Prop.jsonDecode(v97.imageSize);
    end;
    if v97.tile_size ~= nil then
        v98.tile_size = v3.UDim2Prop.jsonDecode(v97.tile_size);
    end;
    if v97.tileSize ~= nil then
        v98.tile_size = v3.UDim2Prop.jsonDecode(v97.tileSize);
    end;
    if v97.scale_type ~= nil then
        v98.scale_type = v4.ScaleTypeProp.jsonDecode(v97.scale_type);
    end;
    if v97.scaleType ~= nil then
        v98.scale_type = v4.ScaleTypeProp.jsonDecode(v97.scaleType);
    end;
    if v97.resample_mode ~= nil then
        v98.resample_mode = v4.ResamplerModeProp.jsonDecode(v97.resample_mode);
    end;
    if v97.resampleMode ~= nil then
        v98.resample_mode = v4.ResamplerModeProp.jsonDecode(v97.resampleMode);
    end;
    if v97.image_style ~= nil then
        v98.image_style = v3.ColorStyleProp.jsonDecode(v97.image_style);
    end;
    if v97.imageStyle ~= nil then
        v98.image_style = v3.ColorStyleProp.jsonDecode(v97.imageStyle);
    end;
    if v97.size ~= nil then
        v98.size = v3.UiScaledUDim2Prop.jsonDecode(v97.size);
    end;
    if v97.position ~= nil then
        v98.position = v3.UiScaledUDim2Prop.jsonDecode(v97.position);
    end;
    if v97.anchor_point ~= nil then
        v98.anchor_point = v3.Vector2Prop.jsonDecode(v97.anchor_point);
    end;
    if v97.anchorPoint ~= nil then
        v98.anchor_point = v3.Vector2Prop.jsonDecode(v97.anchorPoint);
    end;
    if v97.layout_order ~= nil then
        v98.layout_order = v3.Int32Prop.jsonDecode(v97.layout_order);
    end;
    if v97.layoutOrder ~= nil then
        v98.layout_order = v3.Int32Prop.jsonDecode(v97.layoutOrder);
    end;
    if v97.visible ~= nil then
        v98.visible = v3.BoolProp.jsonDecode(v97.visible);
    end;
    if v97.z_index ~= nil then
        v98.z_index = v3.Int32Prop.jsonDecode(v97.z_index);
    end;
    if v97.zIndex ~= nil then
        v98.z_index = v3.Int32Prop.jsonDecode(v97.zIndex);
    end;
    if v97.background_style ~= nil then
        v98.background_style = v3.ColorStyleProp.jsonDecode(v97.background_style);
    end;
    if v97.backgroundStyle ~= nil then
        v98.background_style = v3.ColorStyleProp.jsonDecode(v97.backgroundStyle);
    end;
    if v97.automatic_size ~= nil then
        v98.automatic_size = v4.AutomaticSizeProp.jsonDecode(v97.automatic_size);
    end;
    if v97.automaticSize ~= nil then
        v98.automatic_size = v4.AutomaticSizeProp.jsonDecode(v97.automaticSize);
    end;
    if v97.test_id ~= nil then
        v98.test_id = v3.StringProp.jsonDecode(v97.test_id);
    end;
    if v97.testId ~= nil then
        v98.test_id = v3.StringProp.jsonDecode(v97.testId);
    end;
    if v97.image_tag ~= nil then
        v98.image_tag = v3.StringProp.jsonDecode(v97.image_tag);
    end;
    if v97.imageTag ~= nil then
        v98.image_tag = v3.StringProp.jsonDecode(v97.imageTag);
    end;
    if v97.image_size_constraint ~= nil then
        v98.image_size_constraint = v4.SizeConstraintProp.jsonDecode(v97.image_size_constraint);
    end;
    if v97.imageSizeConstraint ~= nil then
        v98.image_size_constraint = v4.SizeConstraintProp.jsonDecode(v97.imageSizeConstraint);
    end;
    return v98;
end;
v6.descriptor = {
    name = "DetailsPageImageHeaderSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.DetailsPageImageHeaderSchema_Props = v6;
v1.default:register(v2.DetailsPageImageHeaderSchema_Props);
return {
    DetailsPageImageHeaderSchema = v2.DetailsPageImageHeaderSchema, 
    DetailsPageImageHeaderSchema_Props = v2.DetailsPageImageHeaderSchema_Props
};