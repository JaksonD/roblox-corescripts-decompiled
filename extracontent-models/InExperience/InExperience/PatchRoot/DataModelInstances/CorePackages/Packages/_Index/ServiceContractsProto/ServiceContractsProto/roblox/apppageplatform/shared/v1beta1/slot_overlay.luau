local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 99 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 106 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v9 = buffer.create(0);
    local v10 = 0;
    if v8.props ~= nil then
        local v11 = v8.props:encode();
        local v12, v13 = v0.writeTag(v9, v10, 1, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeBuffer(v12, v13, v11, buffer.len(v11));
        v9 = v12;
        v10 = v13;
    end;
    if v8.shared ~= nil then
        local v14 = v8.shared:encode();
        local v15, v16 = v0.writeTag(v9, v10, 2, v0.wireTypes.lengthDelimited);
        v15, v16 = v0.writeBuffer(v15, v16, v14, buffer.len(v14));
        v9 = v15;
        v10 = v16;
    end;
    local v17 = buffer.create(v10);
    buffer.copy(v17, 0, v9, 0, v10);
    return v17;
end;
v5.decode = function(v18) --[[ Line: 127 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_0 (copy), v0 (copy), v2 (copy), v4 (copy)
    local v19 = l_v5_0.new();
    local v20 = 0;
    while v20 < buffer.len(v18) do
        local v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v0.readTag(v18, v20);
        v21 = v23;
        v22 = v24;
        v20 = v25;
        if v22 == v0.wireTypes.varint then
            v23 = nil;
            v24, v25 = v0.readVarInt(v18, v20);
            v23 = v24;
            v20 = v25;
        elseif v22 == v0.wireTypes.lengthDelimited then
            if v21 == 1 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.props = v2.SlotOverlaySchema_Props.decode(v23);
            elseif v21 == 2 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.shared = v4.ComponentShared.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 175 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 189 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.SlotOverlaySchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "SlotOverlaySchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SlotOverlaySchema"
};
v2.SlotOverlaySchema = v5;
v1.default:register(v2.SlotOverlaySchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 218 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        top_left_slot = if not (v30 ~= nil) or v30.top_left_slot == nil then nil else v30.top_left_slot, 
        top_middle_slot = if not (v30 ~= nil) or v30.top_middle_slot == nil then nil else v30.top_middle_slot, 
        top_right_slot = if not (v30 ~= nil) or v30.top_right_slot == nil then nil else v30.top_right_slot, 
        center_left_slot = if not (v30 ~= nil) or v30.center_left_slot == nil then nil else v30.center_left_slot, 
        center_middle_slot = if not (v30 ~= nil) or v30.center_middle_slot == nil then nil else v30.center_middle_slot, 
        center_right_slot = if not (v30 ~= nil) or v30.center_right_slot == nil then nil else v30.center_right_slot, 
        bottom_left_slot = if not (v30 ~= nil) or v30.bottom_left_slot == nil then nil else v30.bottom_left_slot, 
        bottom_middle_slot = if not (v30 ~= nil) or v30.bottom_middle_slot == nil then nil else v30.bottom_middle_slot, 
        bottom_right_slot = if not (v30 ~= nil) or v30.bottom_right_slot == nil then nil else v30.bottom_right_slot, 
        automatic_size = if not (v30 ~= nil) or v30.automatic_size == nil then nil else v30.automatic_size, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        size = if not (v30 ~= nil) or v30.size == nil then nil else v30.size, 
        z_index = if not (v30 ~= nil) or v30.z_index == nil then nil else v30.z_index, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        padding = if not (v30 ~= nil) or v30.padding == nil then nil else v30.padding
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 239 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.top_left_slot ~= nil then
        local v34 = v31.top_left_slot:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.top_middle_slot ~= nil then
        local v37 = v31.top_middle_slot:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.top_right_slot ~= nil then
        local v40 = v31.top_right_slot:encode();
        local v41, v42 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v32 = v41;
        v33 = v42;
    end;
    if v31.center_left_slot ~= nil then
        local v43 = v31.center_left_slot:encode();
        local v44, v45 = v0.writeTag(v32, v33, 4, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
        v32 = v44;
        v33 = v45;
    end;
    if v31.center_middle_slot ~= nil then
        local v46 = v31.center_middle_slot:encode();
        local v47, v48 = v0.writeTag(v32, v33, 5, v0.wireTypes.lengthDelimited);
        v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
        v32 = v47;
        v33 = v48;
    end;
    if v31.center_right_slot ~= nil then
        local v49 = v31.center_right_slot:encode();
        local v50, v51 = v0.writeTag(v32, v33, 6, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeBuffer(v50, v51, v49, buffer.len(v49));
        v32 = v50;
        v33 = v51;
    end;
    if v31.bottom_left_slot ~= nil then
        local v52 = v31.bottom_left_slot:encode();
        local v53, v54 = v0.writeTag(v32, v33, 7, v0.wireTypes.lengthDelimited);
        v53, v54 = v0.writeBuffer(v53, v54, v52, buffer.len(v52));
        v32 = v53;
        v33 = v54;
    end;
    if v31.bottom_middle_slot ~= nil then
        local v55 = v31.bottom_middle_slot:encode();
        local v56, v57 = v0.writeTag(v32, v33, 8, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeBuffer(v56, v57, v55, buffer.len(v55));
        v32 = v56;
        v33 = v57;
    end;
    if v31.bottom_right_slot ~= nil then
        local v58 = v31.bottom_right_slot:encode();
        local v59, v60 = v0.writeTag(v32, v33, 9, v0.wireTypes.lengthDelimited);
        v59, v60 = v0.writeBuffer(v59, v60, v58, buffer.len(v58));
        v32 = v59;
        v33 = v60;
    end;
    if v31.automatic_size ~= nil then
        local v61 = v31.automatic_size:encode();
        local v62, v63 = v0.writeTag(v32, v33, 10, v0.wireTypes.lengthDelimited);
        v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
        v32 = v62;
        v33 = v63;
    end;
    if v31.layout_order ~= nil then
        local v64 = v31.layout_order:encode();
        local v65, v66 = v0.writeTag(v32, v33, 11, v0.wireTypes.lengthDelimited);
        v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
        v32 = v65;
        v33 = v66;
    end;
    if v31.anchor_point ~= nil then
        local v67 = v31.anchor_point:encode();
        local v68, v69 = v0.writeTag(v32, v33, 12, v0.wireTypes.lengthDelimited);
        v68, v69 = v0.writeBuffer(v68, v69, v67, buffer.len(v67));
        v32 = v68;
        v33 = v69;
    end;
    if v31.size ~= nil then
        local v70 = v31.size:encode();
        local v71, v72 = v0.writeTag(v32, v33, 13, v0.wireTypes.lengthDelimited);
        v71, v72 = v0.writeBuffer(v71, v72, v70, buffer.len(v70));
        v32 = v71;
        v33 = v72;
    end;
    if v31.z_index ~= nil then
        local v73 = v31.z_index:encode();
        local v74, v75 = v0.writeTag(v32, v33, 14, v0.wireTypes.lengthDelimited);
        v74, v75 = v0.writeBuffer(v74, v75, v73, buffer.len(v73));
        v32 = v74;
        v33 = v75;
    end;
    if v31.position ~= nil then
        local v76 = v31.position:encode();
        local v77, v78 = v0.writeTag(v32, v33, 15, v0.wireTypes.lengthDelimited);
        v77, v78 = v0.writeBuffer(v77, v78, v76, buffer.len(v76));
        v32 = v77;
        v33 = v78;
    end;
    if v31.padding ~= nil then
        local v79 = v31.padding:encode();
        local v80, v81 = v0.writeTag(v32, v33, 16, v0.wireTypes.lengthDelimited);
        v80, v81 = v0.writeBuffer(v80, v81, v79, buffer.len(v79));
        v32 = v80;
        v33 = v81;
    end;
    local v82 = buffer.create(v33);
    buffer.copy(v82, 0, v32, 0, v33);
    return v82;
end;
v5.decode = function(v83) --[[ Line: 344 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v84 = v5.new();
    local v85 = 0;
    while v85 < buffer.len(v83) do
        local v86 = nil;
        local v87 = nil;
        local v88, v89, v90 = v0.readTag(v83, v85);
        v86 = v88;
        v87 = v89;
        v85 = v90;
        if v87 == v0.wireTypes.varint then
            v88 = nil;
            v89, v90 = v0.readVarInt(v83, v85);
            v88 = v89;
            v85 = v90;
        elseif v87 == v0.wireTypes.lengthDelimited then
            if v86 == 1 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.top_left_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 2 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.top_middle_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 3 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.top_right_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 4 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.center_left_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 5 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.center_middle_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 6 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.center_right_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 7 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.bottom_left_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 8 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.bottom_middle_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 9 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.bottom_right_slot = v3.NestedComponentProp.decode(v88);
            elseif v86 == 10 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.automatic_size = v3.StringProp.decode(v88);
            elseif v86 == 11 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.layout_order = v3.Int32Prop.decode(v88);
            elseif v86 == 12 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.anchor_point = v3.Vector2Prop.decode(v88);
            elseif v86 == 13 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.size = v3.UDim2Prop.decode(v88);
            elseif v86 == 14 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.z_index = v3.FloatProp.decode(v88);
            elseif v86 == 15 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.position = v3.UDim2Prop.decode(v88);
            elseif v86 == 16 then
                v88 = nil;
                v89, v90 = v0.readBuffer(v83, v85);
                v88 = v89;
                v85 = v90;
                v84.padding = v3.FloatProp.decode(v88);
            else
                v88 = nil;
                v89, v90 = v0.readVarInt(v83, v85);
                v85 = v90 + v89;
            end;
        elseif v87 == v0.wireTypes.i32 then
            v88 = nil;
            v89, v90 = v0.readFixed32(v83, v85);
            v88 = v89;
            v85 = v90;
        elseif v87 == v0.wireTypes.i64 then
            v88 = nil;
            v89, v90 = v0.readFixed64(v83, v85);
            v88 = v89;
            v85 = v90;
        else
            error("Unsupported wire type: " .. v87);
        end;
    end;
    return v84;
end;
v5.jsonEncode = function(v91) --[[ Line: 471 ]] --[[ Name: jsonEncode ]]
    local v92 = {};
    if v91.top_left_slot ~= nil then
        v92.topLeftSlot = v91.top_left_slot:jsonEncode();
    end;
    if v91.top_middle_slot ~= nil then
        v92.topMiddleSlot = v91.top_middle_slot:jsonEncode();
    end;
    if v91.top_right_slot ~= nil then
        v92.topRightSlot = v91.top_right_slot:jsonEncode();
    end;
    if v91.center_left_slot ~= nil then
        v92.centerLeftSlot = v91.center_left_slot:jsonEncode();
    end;
    if v91.center_middle_slot ~= nil then
        v92.centerMiddleSlot = v91.center_middle_slot:jsonEncode();
    end;
    if v91.center_right_slot ~= nil then
        v92.centerRightSlot = v91.center_right_slot:jsonEncode();
    end;
    if v91.bottom_left_slot ~= nil then
        v92.bottomLeftSlot = v91.bottom_left_slot:jsonEncode();
    end;
    if v91.bottom_middle_slot ~= nil then
        v92.bottomMiddleSlot = v91.bottom_middle_slot:jsonEncode();
    end;
    if v91.bottom_right_slot ~= nil then
        v92.bottomRightSlot = v91.bottom_right_slot:jsonEncode();
    end;
    if v91.automatic_size ~= nil then
        v92.automaticSize = v91.automatic_size:jsonEncode();
    end;
    if v91.layout_order ~= nil then
        v92.layoutOrder = v91.layout_order:jsonEncode();
    end;
    if v91.anchor_point ~= nil then
        v92.anchorPoint = v91.anchor_point:jsonEncode();
    end;
    if v91.size ~= nil then
        v92.size = v91.size:jsonEncode();
    end;
    if v91.z_index ~= nil then
        v92.zIndex = v91.z_index:jsonEncode();
    end;
    if v91.position ~= nil then
        v92.position = v91.position:jsonEncode();
    end;
    if v91.padding ~= nil then
        v92.padding = v91.padding:jsonEncode();
    end;
    return v92;
end;
v5.jsonDecode = function(v93) --[[ Line: 541 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v94 = v5.new();
    if v93.top_left_slot ~= nil then
        v94.top_left_slot = v3.NestedComponentProp.jsonDecode(v93.top_left_slot);
    end;
    if v93.topLeftSlot ~= nil then
        v94.top_left_slot = v3.NestedComponentProp.jsonDecode(v93.topLeftSlot);
    end;
    if v93.top_middle_slot ~= nil then
        v94.top_middle_slot = v3.NestedComponentProp.jsonDecode(v93.top_middle_slot);
    end;
    if v93.topMiddleSlot ~= nil then
        v94.top_middle_slot = v3.NestedComponentProp.jsonDecode(v93.topMiddleSlot);
    end;
    if v93.top_right_slot ~= nil then
        v94.top_right_slot = v3.NestedComponentProp.jsonDecode(v93.top_right_slot);
    end;
    if v93.topRightSlot ~= nil then
        v94.top_right_slot = v3.NestedComponentProp.jsonDecode(v93.topRightSlot);
    end;
    if v93.center_left_slot ~= nil then
        v94.center_left_slot = v3.NestedComponentProp.jsonDecode(v93.center_left_slot);
    end;
    if v93.centerLeftSlot ~= nil then
        v94.center_left_slot = v3.NestedComponentProp.jsonDecode(v93.centerLeftSlot);
    end;
    if v93.center_middle_slot ~= nil then
        v94.center_middle_slot = v3.NestedComponentProp.jsonDecode(v93.center_middle_slot);
    end;
    if v93.centerMiddleSlot ~= nil then
        v94.center_middle_slot = v3.NestedComponentProp.jsonDecode(v93.centerMiddleSlot);
    end;
    if v93.center_right_slot ~= nil then
        v94.center_right_slot = v3.NestedComponentProp.jsonDecode(v93.center_right_slot);
    end;
    if v93.centerRightSlot ~= nil then
        v94.center_right_slot = v3.NestedComponentProp.jsonDecode(v93.centerRightSlot);
    end;
    if v93.bottom_left_slot ~= nil then
        v94.bottom_left_slot = v3.NestedComponentProp.jsonDecode(v93.bottom_left_slot);
    end;
    if v93.bottomLeftSlot ~= nil then
        v94.bottom_left_slot = v3.NestedComponentProp.jsonDecode(v93.bottomLeftSlot);
    end;
    if v93.bottom_middle_slot ~= nil then
        v94.bottom_middle_slot = v3.NestedComponentProp.jsonDecode(v93.bottom_middle_slot);
    end;
    if v93.bottomMiddleSlot ~= nil then
        v94.bottom_middle_slot = v3.NestedComponentProp.jsonDecode(v93.bottomMiddleSlot);
    end;
    if v93.bottom_right_slot ~= nil then
        v94.bottom_right_slot = v3.NestedComponentProp.jsonDecode(v93.bottom_right_slot);
    end;
    if v93.bottomRightSlot ~= nil then
        v94.bottom_right_slot = v3.NestedComponentProp.jsonDecode(v93.bottomRightSlot);
    end;
    if v93.automatic_size ~= nil then
        v94.automatic_size = v3.StringProp.jsonDecode(v93.automatic_size);
    end;
    if v93.automaticSize ~= nil then
        v94.automatic_size = v3.StringProp.jsonDecode(v93.automaticSize);
    end;
    if v93.layout_order ~= nil then
        v94.layout_order = v3.Int32Prop.jsonDecode(v93.layout_order);
    end;
    if v93.layoutOrder ~= nil then
        v94.layout_order = v3.Int32Prop.jsonDecode(v93.layoutOrder);
    end;
    if v93.anchor_point ~= nil then
        v94.anchor_point = v3.Vector2Prop.jsonDecode(v93.anchor_point);
    end;
    if v93.anchorPoint ~= nil then
        v94.anchor_point = v3.Vector2Prop.jsonDecode(v93.anchorPoint);
    end;
    if v93.size ~= nil then
        v94.size = v3.UDim2Prop.jsonDecode(v93.size);
    end;
    if v93.z_index ~= nil then
        v94.z_index = v3.FloatProp.jsonDecode(v93.z_index);
    end;
    if v93.zIndex ~= nil then
        v94.z_index = v3.FloatProp.jsonDecode(v93.zIndex);
    end;
    if v93.position ~= nil then
        v94.position = v3.UDim2Prop.jsonDecode(v93.position);
    end;
    if v93.padding ~= nil then
        v94.padding = v3.FloatProp.jsonDecode(v93.padding);
    end;
    return v94;
end;
v5.descriptor = {
    name = "SlotOverlaySchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.SlotOverlaySchema_Props = v5;
v1.default:register(v2.SlotOverlaySchema_Props);
return {
    SlotOverlaySchema = v2.SlotOverlaySchema, 
    SlotOverlaySchema_Props = v2.SlotOverlaySchema_Props
};