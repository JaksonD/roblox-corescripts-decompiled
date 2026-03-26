local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 93 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 114 ]] --[[ Name: decode ]]
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
                v19.props = v2.IconSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 162 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 176 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.IconSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "IconSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IconSchema"
};
v2.IconSchema = v5;
v1.default:register(v2.IconSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 205 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        name = if not (v30 ~= nil) or v30.name == nil then nil else v30.name, 
        style = if not (v30 ~= nil) or v30.style == nil then nil else v30.style, 
        size = if not (v30 ~= nil) or v30.size == nil then nil else v30.size, 
        variant = if not (v30 ~= nil) or v30.variant == nil then nil else v30.variant, 
        rotation = if not (v30 ~= nil) or v30.rotation == nil then nil else v30.rotation, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        visible = if not (v30 ~= nil) or v30.visible == nil then nil else v30.visible, 
        z_index = if not (v30 ~= nil) or v30.z_index == nil then nil else v30.z_index, 
        children = if not (v30 ~= nil) or v30.children == nil then nil else v30.children
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 221 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.name ~= nil then
        local v34 = v31.name:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.style ~= nil then
        local v37 = v31.style:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.size ~= nil then
        local v40 = v31.size:encode();
        local v41, v42 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v32 = v41;
        v33 = v42;
    end;
    if v31.variant ~= nil then
        local v43 = v31.variant:encode();
        local v44, v45 = v0.writeTag(v32, v33, 4, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
        v32 = v44;
        v33 = v45;
    end;
    if v31.rotation ~= nil then
        local v46 = v31.rotation:encode();
        local v47, v48 = v0.writeTag(v32, v33, 5, v0.wireTypes.lengthDelimited);
        v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
        v32 = v47;
        v33 = v48;
    end;
    if v31.anchor_point ~= nil then
        local v49 = v31.anchor_point:encode();
        local v50, v51 = v0.writeTag(v32, v33, 6, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeBuffer(v50, v51, v49, buffer.len(v49));
        v32 = v50;
        v33 = v51;
    end;
    if v31.layout_order ~= nil then
        local v52 = v31.layout_order:encode();
        local v53, v54 = v0.writeTag(v32, v33, 7, v0.wireTypes.lengthDelimited);
        v53, v54 = v0.writeBuffer(v53, v54, v52, buffer.len(v52));
        v32 = v53;
        v33 = v54;
    end;
    if v31.position ~= nil then
        local v55 = v31.position:encode();
        local v56, v57 = v0.writeTag(v32, v33, 8, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeBuffer(v56, v57, v55, buffer.len(v55));
        v32 = v56;
        v33 = v57;
    end;
    if v31.visible ~= nil then
        local v58 = v31.visible:encode();
        local v59, v60 = v0.writeTag(v32, v33, 9, v0.wireTypes.lengthDelimited);
        v59, v60 = v0.writeBuffer(v59, v60, v58, buffer.len(v58));
        v32 = v59;
        v33 = v60;
    end;
    if v31.z_index ~= nil then
        local v61 = v31.z_index:encode();
        local v62, v63 = v0.writeTag(v32, v33, 10, v0.wireTypes.lengthDelimited);
        v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
        v32 = v62;
        v33 = v63;
    end;
    if v31.children ~= nil then
        local v64 = v31.children:encode();
        local v65, v66 = v0.writeTag(v32, v33, 11, v0.wireTypes.lengthDelimited);
        v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
        v32 = v65;
        v33 = v66;
    end;
    local v67 = buffer.create(v33);
    buffer.copy(v67, 0, v32, 0, v33);
    return v67;
end;
v5.decode = function(v68) --[[ Line: 296 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v69 = v5.new();
    local v70 = 0;
    while v70 < buffer.len(v68) do
        local v71 = nil;
        local v72 = nil;
        local v73, v74, v75 = v0.readTag(v68, v70);
        v71 = v73;
        v72 = v74;
        v70 = v75;
        if v72 == v0.wireTypes.varint then
            v73 = nil;
            v74, v75 = v0.readVarInt(v68, v70);
            v73 = v74;
            v70 = v75;
        elseif v72 == v0.wireTypes.lengthDelimited then
            if v71 == 1 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.name = v3.StringProp.decode(v73);
            elseif v71 == 2 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.style = v3.ColorStyleProp.decode(v73);
            elseif v71 == 3 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.size = v3.IconSizeProp.decode(v73);
            elseif v71 == 4 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.variant = v3.StringProp.decode(v73);
            elseif v71 == 5 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.rotation = v3.FloatProp.decode(v73);
            elseif v71 == 6 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.anchor_point = v3.Vector2Prop.decode(v73);
            elseif v71 == 7 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.layout_order = v3.Int32Prop.decode(v73);
            elseif v71 == 8 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.position = v3.UDim2Prop.decode(v73);
            elseif v71 == 9 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.visible = v3.BoolProp.decode(v73);
            elseif v71 == 10 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.z_index = v3.Int32Prop.decode(v73);
            elseif v71 == 11 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.children = v3.LazyNestedComponentListProp.decode(v73);
            else
                v73 = nil;
                v74, v75 = v0.readVarInt(v68, v70);
                v70 = v75 + v74;
            end;
        elseif v72 == v0.wireTypes.i32 then
            v73 = nil;
            v74, v75 = v0.readFixed32(v68, v70);
            v73 = v74;
            v70 = v75;
        elseif v72 == v0.wireTypes.i64 then
            v73 = nil;
            v74, v75 = v0.readFixed64(v68, v70);
            v73 = v74;
            v70 = v75;
        else
            error("Unsupported wire type: " .. v72);
        end;
    end;
    return v69;
end;
v5.jsonEncode = function(v76) --[[ Line: 390 ]] --[[ Name: jsonEncode ]]
    local v77 = {};
    if v76.name ~= nil then
        v77.name = v76.name:jsonEncode();
    end;
    if v76.style ~= nil then
        v77.style = v76.style:jsonEncode();
    end;
    if v76.size ~= nil then
        v77.size = v76.size:jsonEncode();
    end;
    if v76.variant ~= nil then
        v77.variant = v76.variant:jsonEncode();
    end;
    if v76.rotation ~= nil then
        v77.rotation = v76.rotation:jsonEncode();
    end;
    if v76.anchor_point ~= nil then
        v77.anchorPoint = v76.anchor_point:jsonEncode();
    end;
    if v76.layout_order ~= nil then
        v77.layoutOrder = v76.layout_order:jsonEncode();
    end;
    if v76.position ~= nil then
        v77.position = v76.position:jsonEncode();
    end;
    if v76.visible ~= nil then
        v77.visible = v76.visible:jsonEncode();
    end;
    if v76.z_index ~= nil then
        v77.zIndex = v76.z_index:jsonEncode();
    end;
    if v76.children ~= nil then
        v77.children = v76.children:jsonEncode();
    end;
    return v77;
end;
v5.jsonDecode = function(v78) --[[ Line: 440 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v79 = v5.new();
    if v78.name ~= nil then
        v79.name = v3.StringProp.jsonDecode(v78.name);
    end;
    if v78.style ~= nil then
        v79.style = v3.ColorStyleProp.jsonDecode(v78.style);
    end;
    if v78.size ~= nil then
        v79.size = v3.IconSizeProp.jsonDecode(v78.size);
    end;
    if v78.variant ~= nil then
        v79.variant = v3.StringProp.jsonDecode(v78.variant);
    end;
    if v78.rotation ~= nil then
        v79.rotation = v3.FloatProp.jsonDecode(v78.rotation);
    end;
    if v78.anchor_point ~= nil then
        v79.anchor_point = v3.Vector2Prop.jsonDecode(v78.anchor_point);
    end;
    if v78.anchorPoint ~= nil then
        v79.anchor_point = v3.Vector2Prop.jsonDecode(v78.anchorPoint);
    end;
    if v78.layout_order ~= nil then
        v79.layout_order = v3.Int32Prop.jsonDecode(v78.layout_order);
    end;
    if v78.layoutOrder ~= nil then
        v79.layout_order = v3.Int32Prop.jsonDecode(v78.layoutOrder);
    end;
    if v78.position ~= nil then
        v79.position = v3.UDim2Prop.jsonDecode(v78.position);
    end;
    if v78.visible ~= nil then
        v79.visible = v3.BoolProp.jsonDecode(v78.visible);
    end;
    if v78.z_index ~= nil then
        v79.z_index = v3.Int32Prop.jsonDecode(v78.z_index);
    end;
    if v78.zIndex ~= nil then
        v79.z_index = v3.Int32Prop.jsonDecode(v78.zIndex);
    end;
    if v78.children ~= nil then
        v79.children = v3.LazyNestedComponentListProp.jsonDecode(v78.children);
    end;
    return v79;
end;
v5.descriptor = {
    name = "IconSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.IconSchema_Props = v5;
v1.default:register(v2.IconSchema_Props);
return {
    IconSchema = v2.IconSchema, 
    IconSchema_Props = v2.IconSchema_Props
};