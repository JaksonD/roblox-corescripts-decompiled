local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.prop_types_engine);
local v5 = require(script.Parent.actions);
local v6 = require(script.Parent.component_shared);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 104 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        props = if not (v9 ~= nil) or v9.props == nil then nil else v9.props, 
        shared = if not (v9 ~= nil) or v9.shared == nil then nil else v9.shared
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 111 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.props ~= nil then
        local v13 = v10.props:encode();
        local v14, v15 = v0.writeTag(v11, v12, 1, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v11 = v14;
        v12 = v15;
    end;
    if v10.shared ~= nil then
        local v16 = v10.shared:encode();
        local v17, v18 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
        v17, v18 = v0.writeBuffer(v17, v18, v16, buffer.len(v16));
        v11 = v17;
        v12 = v18;
    end;
    local v19 = buffer.create(v12);
    buffer.copy(v19, 0, v11, 0, v12);
    return v19;
end;
v7.decode = function(v20) --[[ Line: 132 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v2 (copy), v6 (copy)
    local v21 = l_v7_0.new();
    local v22 = 0;
    while v22 < buffer.len(v20) do
        local v23 = nil;
        local v24 = nil;
        local v25, v26, v27 = v0.readTag(v20, v22);
        v23 = v25;
        v24 = v26;
        v22 = v27;
        if v24 == v0.wireTypes.varint then
            v25 = nil;
            v26, v27 = v0.readVarInt(v20, v22);
            v25 = v26;
            v22 = v27;
        elseif v24 == v0.wireTypes.lengthDelimited then
            if v23 == 1 then
                v25 = nil;
                v26, v27 = v0.readBuffer(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.props = v2.ImageSchema_Props.decode(v25);
            elseif v23 == 2 then
                v25 = nil;
                v26, v27 = v0.readBuffer(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.shared = v6.ComponentShared.decode(v25);
            else
                v25 = nil;
                v26, v27 = v0.readVarInt(v20, v22);
                v22 = v27 + v26;
            end;
        elseif v24 == v0.wireTypes.i32 then
            v25 = nil;
            v26, v27 = v0.readFixed32(v20, v22);
            v25 = v26;
            v22 = v27;
        elseif v24 == v0.wireTypes.i64 then
            v25 = nil;
            v26, v27 = v0.readFixed64(v20, v22);
            v25 = v26;
            v22 = v27;
        else
            error("Unsupported wire type: " .. v24);
        end;
    end;
    return v21;
end;
v7.jsonEncode = function(v28) --[[ Line: 180 ]] --[[ Name: jsonEncode ]]
    local v29 = {};
    if v28.props ~= nil then
        v29.props = v28.props:jsonEncode();
    end;
    if v28.shared ~= nil then
        v29.shared = v28.shared:jsonEncode();
    end;
    return v29;
end;
v7.jsonDecode = function(v30) --[[ Line: 194 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy), v6 (copy)
    local v31 = l_v7_0.new();
    if v30.props ~= nil then
        v31.props = v2.ImageSchema_Props.jsonDecode(v30.props);
    end;
    if v30.shared ~= nil then
        v31.shared = v6.ComponentShared.jsonDecode(v30.shared);
    end;
    return v31;
end;
v7.descriptor = {
    name = "ImageSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ImageSchema"
};
v2.ImageSchema = v7;
v1.default:register(v2.ImageSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v32) --[[ Line: 223 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        anchor_point = if not (v32 ~= nil) or v32.anchor_point == nil then nil else v32.anchor_point, 
        clips_descendants = if not (v32 ~= nil) or v32.clips_descendants == nil then nil else v32.clips_descendants, 
        layout_order = if not (v32 ~= nil) or v32.layout_order == nil then nil else v32.layout_order, 
        position = if not (v32 ~= nil) or v32.position == nil then nil else v32.position, 
        size = if not (v32 ~= nil) or v32.size == nil then nil else v32.size, 
        on_activated = if not (v32 ~= nil) or v32.on_activated == nil then nil else v32.on_activated, 
        image = if not (v32 ~= nil) or v32.image == nil then nil else v32.image, 
        scale_type = if not (v32 ~= nil) or v32.scale_type == nil then nil else v32.scale_type, 
        resample_mode = if not (v32 ~= nil) or v32.resample_mode == nil then nil else v32.resample_mode, 
        tile_size = if not (v32 ~= nil) or v32.tile_size == nil then nil else v32.tile_size, 
        image_style = if not (v32 ~= nil) or v32.image_style == nil then nil else v32.image_style, 
        test_id = if not (v32 ~= nil) or v32.test_id == nil then nil else v32.test_id, 
        tag = if not (v32 ~= nil) or v32.tag == nil then nil else v32.tag, 
        cursor_type = if not (v32 ~= nil) or v32.cursor_type == nil then nil else v32.cursor_type, 
        visible = if not (v32 ~= nil) or v32.visible == nil then nil else v32.visible, 
        z_index = if not (v32 ~= nil) or v32.z_index == nil then nil else v32.z_index, 
        children = if not (v32 ~= nil) or v32.children == nil then nil else v32.children, 
        size_constraint = if not (v32 ~= nil) or v32.size_constraint == nil then nil else v32.size_constraint, 
        automatic_size = if not (v32 ~= nil) or v32.automatic_size == nil then nil else v32.automatic_size
    }, v7));
end;
v7.encode = function(v33) --[[ Line: 247 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.anchor_point ~= nil then
        local v36 = v33.anchor_point:encode();
        local v37, v38 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
        v34 = v37;
        v35 = v38;
    end;
    if v33.clips_descendants ~= nil then
        local v39 = v33.clips_descendants:encode();
        local v40, v41 = v0.writeTag(v34, v35, 2, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v34 = v40;
        v35 = v41;
    end;
    if v33.layout_order ~= nil then
        local v42 = v33.layout_order:encode();
        local v43, v44 = v0.writeTag(v34, v35, 3, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
        v34 = v43;
        v35 = v44;
    end;
    if v33.position ~= nil then
        local v45 = v33.position:encode();
        local v46, v47 = v0.writeTag(v34, v35, 4, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
        v34 = v46;
        v35 = v47;
    end;
    if v33.size ~= nil then
        local v48 = v33.size:encode();
        local v49, v50 = v0.writeTag(v34, v35, 5, v0.wireTypes.lengthDelimited);
        v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
        v34 = v49;
        v35 = v50;
    end;
    if v33.on_activated ~= nil then
        local v51 = v33.on_activated:encode();
        local v52, v53 = v0.writeTag(v34, v35, 6, v0.wireTypes.lengthDelimited);
        v52, v53 = v0.writeBuffer(v52, v53, v51, buffer.len(v51));
        v34 = v52;
        v35 = v53;
    end;
    if v33.image ~= nil then
        local v54 = v33.image:encode();
        local v55, v56 = v0.writeTag(v34, v35, 7, v0.wireTypes.lengthDelimited);
        v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
        v34 = v55;
        v35 = v56;
    end;
    if v33.scale_type ~= nil then
        local v57 = v33.scale_type:encode();
        local v58, v59 = v0.writeTag(v34, v35, 8, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
        v34 = v58;
        v35 = v59;
    end;
    if v33.resample_mode ~= nil then
        local v60 = v33.resample_mode:encode();
        local v61, v62 = v0.writeTag(v34, v35, 9, v0.wireTypes.lengthDelimited);
        v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
        v34 = v61;
        v35 = v62;
    end;
    if v33.tile_size ~= nil then
        local v63 = v33.tile_size:encode();
        local v64, v65 = v0.writeTag(v34, v35, 10, v0.wireTypes.lengthDelimited);
        v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
        v34 = v64;
        v35 = v65;
    end;
    if v33.image_style ~= nil then
        local v66 = v33.image_style:encode();
        local v67, v68 = v0.writeTag(v34, v35, 11, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
        v34 = v67;
        v35 = v68;
    end;
    if v33.test_id ~= nil then
        local v69 = v33.test_id:encode();
        local v70, v71 = v0.writeTag(v34, v35, 12, v0.wireTypes.lengthDelimited);
        v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
        v34 = v70;
        v35 = v71;
    end;
    if v33.tag ~= nil then
        local v72 = v33.tag:encode();
        local v73, v74 = v0.writeTag(v34, v35, 13, v0.wireTypes.lengthDelimited);
        v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
        v34 = v73;
        v35 = v74;
    end;
    if v33.cursor_type ~= nil then
        local v75 = v33.cursor_type:encode();
        local v76, v77 = v0.writeTag(v34, v35, 14, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
        v34 = v76;
        v35 = v77;
    end;
    if v33.visible ~= nil then
        local v78 = v33.visible:encode();
        local v79, v80 = v0.writeTag(v34, v35, 15, v0.wireTypes.lengthDelimited);
        v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
        v34 = v79;
        v35 = v80;
    end;
    if v33.z_index ~= nil then
        local v81 = v33.z_index:encode();
        local v82, v83 = v0.writeTag(v34, v35, 16, v0.wireTypes.lengthDelimited);
        v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
        v34 = v82;
        v35 = v83;
    end;
    if v33.children ~= nil then
        local v84 = v33.children:encode();
        local v85, v86 = v0.writeTag(v34, v35, 17, v0.wireTypes.lengthDelimited);
        v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
        v34 = v85;
        v35 = v86;
    end;
    if v33.size_constraint ~= nil then
        local v87 = v33.size_constraint:encode();
        local v88, v89 = v0.writeTag(v34, v35, 18, v0.wireTypes.lengthDelimited);
        v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
        v34 = v88;
        v35 = v89;
    end;
    if v33.automatic_size ~= nil then
        local v90 = v33.automatic_size:encode();
        local v91, v92 = v0.writeTag(v34, v35, 19, v0.wireTypes.lengthDelimited);
        v91, v92 = v0.writeBuffer(v91, v92, v90, buffer.len(v90));
        v34 = v91;
        v35 = v92;
    end;
    local v93 = buffer.create(v35);
    buffer.copy(v93, 0, v34, 0, v35);
    return v93;
end;
v7.decode = function(v94) --[[ Line: 370 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v95 = v7.new();
    local v96 = 0;
    while v96 < buffer.len(v94) do
        local v97 = nil;
        local v98 = nil;
        local v99, v100, v101 = v0.readTag(v94, v96);
        v97 = v99;
        v98 = v100;
        v96 = v101;
        if v98 == v0.wireTypes.varint then
            v99 = nil;
            v100, v101 = v0.readVarInt(v94, v96);
            v99 = v100;
            v96 = v101;
        elseif v98 == v0.wireTypes.lengthDelimited then
            if v97 == 1 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.anchor_point = v3.Vector2Prop.decode(v99);
            elseif v97 == 2 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.clips_descendants = v3.BoolProp.decode(v99);
            elseif v97 == 3 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.layout_order = v3.Int32Prop.decode(v99);
            elseif v97 == 4 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.position = v3.UDim2Prop.decode(v99);
            elseif v97 == 5 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.size = v3.UDim2Prop.decode(v99);
            elseif v97 == 6 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.on_activated = v5.ActionProp.decode(v99);
            elseif v97 == 7 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.image = v3.ImageStringProp.decode(v99);
            elseif v97 == 8 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.scale_type = v4.ScaleTypeProp.decode(v99);
            elseif v97 == 9 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.resample_mode = v4.ResamplerModeProp.decode(v99);
            elseif v97 == 10 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.tile_size = v3.UDim2Prop.decode(v99);
            elseif v97 == 11 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.image_style = v3.ColorStyleProp.decode(v99);
            elseif v97 == 12 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.test_id = v3.StringProp.decode(v99);
            elseif v97 == 13 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.tag = v3.StringProp.decode(v99);
            elseif v97 == 14 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.cursor_type = v3.StringProp.decode(v99);
            elseif v97 == 15 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.visible = v3.BoolProp.decode(v99);
            elseif v97 == 16 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.z_index = v3.Int32Prop.decode(v99);
            elseif v97 == 17 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.children = v3.LazyNestedComponentListProp.decode(v99);
            elseif v97 == 18 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.size_constraint = v4.SizeConstraintProp.decode(v99);
            elseif v97 == 19 then
                v99 = nil;
                v100, v101 = v0.readBuffer(v94, v96);
                v99 = v100;
                v96 = v101;
                v95.automatic_size = v4.AutomaticSizeProp.decode(v99);
            else
                v99 = nil;
                v100, v101 = v0.readVarInt(v94, v96);
                v96 = v101 + v100;
            end;
        elseif v98 == v0.wireTypes.i32 then
            v99 = nil;
            v100, v101 = v0.readFixed32(v94, v96);
            v99 = v100;
            v96 = v101;
        elseif v98 == v0.wireTypes.i64 then
            v99 = nil;
            v100, v101 = v0.readFixed64(v94, v96);
            v99 = v100;
            v96 = v101;
        else
            error("Unsupported wire type: " .. v98);
        end;
    end;
    return v95;
end;
v7.jsonEncode = function(v102) --[[ Line: 508 ]] --[[ Name: jsonEncode ]]
    local v103 = {};
    if v102.anchor_point ~= nil then
        v103.anchorPoint = v102.anchor_point:jsonEncode();
    end;
    if v102.clips_descendants ~= nil then
        v103.clipsDescendants = v102.clips_descendants:jsonEncode();
    end;
    if v102.layout_order ~= nil then
        v103.layoutOrder = v102.layout_order:jsonEncode();
    end;
    if v102.position ~= nil then
        v103.position = v102.position:jsonEncode();
    end;
    if v102.size ~= nil then
        v103.size = v102.size:jsonEncode();
    end;
    if v102.on_activated ~= nil then
        v103.onActivated = v102.on_activated:jsonEncode();
    end;
    if v102.image ~= nil then
        v103.image = v102.image:jsonEncode();
    end;
    if v102.scale_type ~= nil then
        v103.scaleType = v102.scale_type:jsonEncode();
    end;
    if v102.resample_mode ~= nil then
        v103.resampleMode = v102.resample_mode:jsonEncode();
    end;
    if v102.tile_size ~= nil then
        v103.tileSize = v102.tile_size:jsonEncode();
    end;
    if v102.image_style ~= nil then
        v103.imageStyle = v102.image_style:jsonEncode();
    end;
    if v102.test_id ~= nil then
        v103.testId = v102.test_id:jsonEncode();
    end;
    if v102.tag ~= nil then
        v103.tag = v102.tag:jsonEncode();
    end;
    if v102.cursor_type ~= nil then
        v103.cursorType = v102.cursor_type:jsonEncode();
    end;
    if v102.visible ~= nil then
        v103.visible = v102.visible:jsonEncode();
    end;
    if v102.z_index ~= nil then
        v103.zIndex = v102.z_index:jsonEncode();
    end;
    if v102.children ~= nil then
        v103.children = v102.children:jsonEncode();
    end;
    if v102.size_constraint ~= nil then
        v103.sizeConstraint = v102.size_constraint:jsonEncode();
    end;
    if v102.automatic_size ~= nil then
        v103.automaticSize = v102.automatic_size:jsonEncode();
    end;
    return v103;
end;
v7.jsonDecode = function(v104) --[[ Line: 590 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v105 = v7.new();
    if v104.anchor_point ~= nil then
        v105.anchor_point = v3.Vector2Prop.jsonDecode(v104.anchor_point);
    end;
    if v104.anchorPoint ~= nil then
        v105.anchor_point = v3.Vector2Prop.jsonDecode(v104.anchorPoint);
    end;
    if v104.clips_descendants ~= nil then
        v105.clips_descendants = v3.BoolProp.jsonDecode(v104.clips_descendants);
    end;
    if v104.clipsDescendants ~= nil then
        v105.clips_descendants = v3.BoolProp.jsonDecode(v104.clipsDescendants);
    end;
    if v104.layout_order ~= nil then
        v105.layout_order = v3.Int32Prop.jsonDecode(v104.layout_order);
    end;
    if v104.layoutOrder ~= nil then
        v105.layout_order = v3.Int32Prop.jsonDecode(v104.layoutOrder);
    end;
    if v104.position ~= nil then
        v105.position = v3.UDim2Prop.jsonDecode(v104.position);
    end;
    if v104.size ~= nil then
        v105.size = v3.UDim2Prop.jsonDecode(v104.size);
    end;
    if v104.on_activated ~= nil then
        v105.on_activated = v5.ActionProp.jsonDecode(v104.on_activated);
    end;
    if v104.onActivated ~= nil then
        v105.on_activated = v5.ActionProp.jsonDecode(v104.onActivated);
    end;
    if v104.image ~= nil then
        v105.image = v3.ImageStringProp.jsonDecode(v104.image);
    end;
    if v104.scale_type ~= nil then
        v105.scale_type = v4.ScaleTypeProp.jsonDecode(v104.scale_type);
    end;
    if v104.scaleType ~= nil then
        v105.scale_type = v4.ScaleTypeProp.jsonDecode(v104.scaleType);
    end;
    if v104.resample_mode ~= nil then
        v105.resample_mode = v4.ResamplerModeProp.jsonDecode(v104.resample_mode);
    end;
    if v104.resampleMode ~= nil then
        v105.resample_mode = v4.ResamplerModeProp.jsonDecode(v104.resampleMode);
    end;
    if v104.tile_size ~= nil then
        v105.tile_size = v3.UDim2Prop.jsonDecode(v104.tile_size);
    end;
    if v104.tileSize ~= nil then
        v105.tile_size = v3.UDim2Prop.jsonDecode(v104.tileSize);
    end;
    if v104.image_style ~= nil then
        v105.image_style = v3.ColorStyleProp.jsonDecode(v104.image_style);
    end;
    if v104.imageStyle ~= nil then
        v105.image_style = v3.ColorStyleProp.jsonDecode(v104.imageStyle);
    end;
    if v104.test_id ~= nil then
        v105.test_id = v3.StringProp.jsonDecode(v104.test_id);
    end;
    if v104.testId ~= nil then
        v105.test_id = v3.StringProp.jsonDecode(v104.testId);
    end;
    if v104.tag ~= nil then
        v105.tag = v3.StringProp.jsonDecode(v104.tag);
    end;
    if v104.cursor_type ~= nil then
        v105.cursor_type = v3.StringProp.jsonDecode(v104.cursor_type);
    end;
    if v104.cursorType ~= nil then
        v105.cursor_type = v3.StringProp.jsonDecode(v104.cursorType);
    end;
    if v104.visible ~= nil then
        v105.visible = v3.BoolProp.jsonDecode(v104.visible);
    end;
    if v104.z_index ~= nil then
        v105.z_index = v3.Int32Prop.jsonDecode(v104.z_index);
    end;
    if v104.zIndex ~= nil then
        v105.z_index = v3.Int32Prop.jsonDecode(v104.zIndex);
    end;
    if v104.children ~= nil then
        v105.children = v3.LazyNestedComponentListProp.jsonDecode(v104.children);
    end;
    if v104.size_constraint ~= nil then
        v105.size_constraint = v4.SizeConstraintProp.jsonDecode(v104.size_constraint);
    end;
    if v104.sizeConstraint ~= nil then
        v105.size_constraint = v4.SizeConstraintProp.jsonDecode(v104.sizeConstraint);
    end;
    if v104.automatic_size ~= nil then
        v105.automatic_size = v4.AutomaticSizeProp.jsonDecode(v104.automatic_size);
    end;
    if v104.automaticSize ~= nil then
        v105.automatic_size = v4.AutomaticSizeProp.jsonDecode(v104.automaticSize);
    end;
    return v105;
end;
v7.descriptor = {
    name = "ImageSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.ImageSchema_Props = v7;
v1.default:register(v2.ImageSchema_Props);
return {
    ImageSchema = v2.ImageSchema, 
    ImageSchema_Props = v2.ImageSchema_Props
};