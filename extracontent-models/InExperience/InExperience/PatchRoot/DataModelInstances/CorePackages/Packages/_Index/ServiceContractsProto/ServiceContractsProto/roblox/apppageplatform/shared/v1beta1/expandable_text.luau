local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 96 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 117 ]] --[[ Name: decode ]]
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
                v19.props = v2.ExpandableTextSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 165 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 179 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.ExpandableTextSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "ExpandableTextSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ExpandableTextSchema"
};
v2.ExpandableTextSchema = v5;
v1.default:register(v2.ExpandableTextSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 208 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        text = if not (v30 ~= nil) or v30.text == nil then nil else v30.text, 
        compact_number_of_lines = if not (v30 ~= nil) or v30.compact_number_of_lines == nil then nil else v30.compact_number_of_lines, 
        expanded_initially = if not (v30 ~= nil) or v30.expanded_initially == nil then nil else v30.expanded_initially, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        size = if not (v30 ~= nil) or v30.size == nil then nil else v30.size, 
        header_component = if not (v30 ~= nil) or v30.header_component == nil then nil else v30.header_component
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 225 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.text ~= nil then
        local v34 = v31.text:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.compact_number_of_lines ~= nil then
        local v37 = v31.compact_number_of_lines:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.expanded_initially ~= nil then
        local v40 = v31.expanded_initially:encode();
        local v41, v42 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v32 = v41;
        v33 = v42;
    end;
    if v31.layout_order ~= nil then
        local v43 = v31.layout_order:encode();
        local v44, v45 = v0.writeTag(v32, v33, 4, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
        v32 = v44;
        v33 = v45;
    end;
    if v31.anchor_point ~= nil then
        local v46 = v31.anchor_point:encode();
        local v47, v48 = v0.writeTag(v32, v33, 5, v0.wireTypes.lengthDelimited);
        v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
        v32 = v47;
        v33 = v48;
    end;
    if v31.position ~= nil then
        local v49 = v31.position:encode();
        local v50, v51 = v0.writeTag(v32, v33, 6, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeBuffer(v50, v51, v49, buffer.len(v49));
        v32 = v50;
        v33 = v51;
    end;
    if v31.size ~= nil then
        local v52 = v31.size:encode();
        local v53, v54 = v0.writeTag(v32, v33, 7, v0.wireTypes.lengthDelimited);
        v53, v54 = v0.writeBuffer(v53, v54, v52, buffer.len(v52));
        v32 = v53;
        v33 = v54;
    end;
    if v31.header_component ~= nil then
        local v55 = v31.header_component:encode();
        local v56, v57 = v0.writeTag(v32, v33, 8, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeBuffer(v56, v57, v55, buffer.len(v55));
        v32 = v56;
        v33 = v57;
    end;
    local v58 = buffer.create(v33);
    buffer.copy(v58, 0, v32, 0, v33);
    return v58;
end;
v5.decode = function(v59) --[[ Line: 282 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v60 = v5.new();
    local v61 = 0;
    while v61 < buffer.len(v59) do
        local v62 = nil;
        local v63 = nil;
        local v64, v65, v66 = v0.readTag(v59, v61);
        v62 = v64;
        v63 = v65;
        v61 = v66;
        if v63 == v0.wireTypes.varint then
            v64 = nil;
            v65, v66 = v0.readVarInt(v59, v61);
            v64 = v65;
            v61 = v66;
        elseif v63 == v0.wireTypes.lengthDelimited then
            if v62 == 1 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.text = v3.StringProp.decode(v64);
            elseif v62 == 2 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.compact_number_of_lines = v3.Int32Prop.decode(v64);
            elseif v62 == 3 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.expanded_initially = v3.BoolProp.decode(v64);
            elseif v62 == 4 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.layout_order = v3.Int32Prop.decode(v64);
            elseif v62 == 5 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.anchor_point = v3.Vector2Prop.decode(v64);
            elseif v62 == 6 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.position = v3.UDim2Prop.decode(v64);
            elseif v62 == 7 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.size = v3.UDim2Prop.decode(v64);
            elseif v62 == 8 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.header_component = v3.NestedComponentProp.decode(v64);
            else
                v64 = nil;
                v65, v66 = v0.readVarInt(v59, v61);
                v61 = v66 + v65;
            end;
        elseif v63 == v0.wireTypes.i32 then
            v64 = nil;
            v65, v66 = v0.readFixed32(v59, v61);
            v64 = v65;
            v61 = v66;
        elseif v63 == v0.wireTypes.i64 then
            v64 = nil;
            v65, v66 = v0.readFixed64(v59, v61);
            v64 = v65;
            v61 = v66;
        else
            error("Unsupported wire type: " .. v63);
        end;
    end;
    return v60;
end;
v5.jsonEncode = function(v67) --[[ Line: 362 ]] --[[ Name: jsonEncode ]]
    local v68 = {};
    if v67.text ~= nil then
        v68.text = v67.text:jsonEncode();
    end;
    if v67.compact_number_of_lines ~= nil then
        v68.compactNumberOfLines = v67.compact_number_of_lines:jsonEncode();
    end;
    if v67.expanded_initially ~= nil then
        v68.expandedInitially = v67.expanded_initially:jsonEncode();
    end;
    if v67.layout_order ~= nil then
        v68.layoutOrder = v67.layout_order:jsonEncode();
    end;
    if v67.anchor_point ~= nil then
        v68.anchorPoint = v67.anchor_point:jsonEncode();
    end;
    if v67.position ~= nil then
        v68.position = v67.position:jsonEncode();
    end;
    if v67.size ~= nil then
        v68.size = v67.size:jsonEncode();
    end;
    if v67.header_component ~= nil then
        v68.headerComponent = v67.header_component:jsonEncode();
    end;
    return v68;
end;
v5.jsonDecode = function(v69) --[[ Line: 400 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v70 = v5.new();
    if v69.text ~= nil then
        v70.text = v3.StringProp.jsonDecode(v69.text);
    end;
    if v69.compact_number_of_lines ~= nil then
        v70.compact_number_of_lines = v3.Int32Prop.jsonDecode(v69.compact_number_of_lines);
    end;
    if v69.compactNumberOfLines ~= nil then
        v70.compact_number_of_lines = v3.Int32Prop.jsonDecode(v69.compactNumberOfLines);
    end;
    if v69.expanded_initially ~= nil then
        v70.expanded_initially = v3.BoolProp.jsonDecode(v69.expanded_initially);
    end;
    if v69.expandedInitially ~= nil then
        v70.expanded_initially = v3.BoolProp.jsonDecode(v69.expandedInitially);
    end;
    if v69.layout_order ~= nil then
        v70.layout_order = v3.Int32Prop.jsonDecode(v69.layout_order);
    end;
    if v69.layoutOrder ~= nil then
        v70.layout_order = v3.Int32Prop.jsonDecode(v69.layoutOrder);
    end;
    if v69.anchor_point ~= nil then
        v70.anchor_point = v3.Vector2Prop.jsonDecode(v69.anchor_point);
    end;
    if v69.anchorPoint ~= nil then
        v70.anchor_point = v3.Vector2Prop.jsonDecode(v69.anchorPoint);
    end;
    if v69.position ~= nil then
        v70.position = v3.UDim2Prop.jsonDecode(v69.position);
    end;
    if v69.size ~= nil then
        v70.size = v3.UDim2Prop.jsonDecode(v69.size);
    end;
    if v69.header_component ~= nil then
        v70.header_component = v3.NestedComponentProp.jsonDecode(v69.header_component);
    end;
    if v69.headerComponent ~= nil then
        v70.header_component = v3.NestedComponentProp.jsonDecode(v69.headerComponent);
    end;
    return v70;
end;
v5.descriptor = {
    name = "ExpandableTextSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.ExpandableTextSchema_Props = v5;
v1.default:register(v2.ExpandableTextSchema_Props);
return {
    ExpandableTextSchema = v2.ExpandableTextSchema, 
    ExpandableTextSchema_Props = v2.ExpandableTextSchema_Props
};