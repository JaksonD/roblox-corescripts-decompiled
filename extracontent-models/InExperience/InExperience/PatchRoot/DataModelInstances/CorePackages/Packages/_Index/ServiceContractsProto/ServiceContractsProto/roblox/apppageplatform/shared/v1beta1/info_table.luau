local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 88 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 109 ]] --[[ Name: decode ]]
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
                v19.props = v2.InfoTableSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 157 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 171 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.InfoTableSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "InfoTableSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InfoTableSchema"
};
v2.InfoTableSchema = v5;
v1.default:register(v2.InfoTableSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 200 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        items = if not (v30 ~= nil) or v30.items == nil then nil else v30.items, 
        num_columns = if not (v30 ~= nil) or v30.num_columns == nil then nil else v30.num_columns, 
        grid_tag = if not (v30 ~= nil) or v30.grid_tag == nil then nil else v30.grid_tag, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        size = if not (v30 ~= nil) or v30.size == nil then nil else v30.size
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 212 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.items ~= nil then
        local v34 = v31.items:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.num_columns ~= nil then
        local v37 = v31.num_columns:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.grid_tag ~= nil then
        local v40 = v31.grid_tag:encode();
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
    local v55 = buffer.create(v33);
    buffer.copy(v55, 0, v32, 0, v33);
    return v55;
end;
v5.decode = function(v56) --[[ Line: 263 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v57 = v5.new();
    local v58 = 0;
    while v58 < buffer.len(v56) do
        local v59 = nil;
        local v60 = nil;
        local v61, v62, v63 = v0.readTag(v56, v58);
        v59 = v61;
        v60 = v62;
        v58 = v63;
        if v60 == v0.wireTypes.varint then
            v61 = nil;
            v62, v63 = v0.readVarInt(v56, v58);
            v61 = v62;
            v58 = v63;
        elseif v60 == v0.wireTypes.lengthDelimited then
            if v59 == 1 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.items = v3.LazyNestedComponentListProp.decode(v61);
            elseif v59 == 2 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.num_columns = v3.Int32Prop.decode(v61);
            elseif v59 == 3 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.grid_tag = v3.StringProp.decode(v61);
            elseif v59 == 4 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.layout_order = v3.Int32Prop.decode(v61);
            elseif v59 == 5 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.anchor_point = v3.Vector2Prop.decode(v61);
            elseif v59 == 6 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.position = v3.UDim2Prop.decode(v61);
            elseif v59 == 7 then
                v61 = nil;
                v62, v63 = v0.readBuffer(v56, v58);
                v61 = v62;
                v58 = v63;
                v57.size = v3.UDim2Prop.decode(v61);
            else
                v61 = nil;
                v62, v63 = v0.readVarInt(v56, v58);
                v58 = v63 + v62;
            end;
        elseif v60 == v0.wireTypes.i32 then
            v61 = nil;
            v62, v63 = v0.readFixed32(v56, v58);
            v61 = v62;
            v58 = v63;
        elseif v60 == v0.wireTypes.i64 then
            v61 = nil;
            v62, v63 = v0.readFixed64(v56, v58);
            v61 = v62;
            v58 = v63;
        else
            error("Unsupported wire type: " .. v60);
        end;
    end;
    return v57;
end;
v5.jsonEncode = function(v64) --[[ Line: 337 ]] --[[ Name: jsonEncode ]]
    local v65 = {};
    if v64.items ~= nil then
        v65.items = v64.items:jsonEncode();
    end;
    if v64.num_columns ~= nil then
        v65.numColumns = v64.num_columns:jsonEncode();
    end;
    if v64.grid_tag ~= nil then
        v65.gridTag = v64.grid_tag:jsonEncode();
    end;
    if v64.layout_order ~= nil then
        v65.layoutOrder = v64.layout_order:jsonEncode();
    end;
    if v64.anchor_point ~= nil then
        v65.anchorPoint = v64.anchor_point:jsonEncode();
    end;
    if v64.position ~= nil then
        v65.position = v64.position:jsonEncode();
    end;
    if v64.size ~= nil then
        v65.size = v64.size:jsonEncode();
    end;
    return v65;
end;
v5.jsonDecode = function(v66) --[[ Line: 371 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v67 = v5.new();
    if v66.items ~= nil then
        v67.items = v3.LazyNestedComponentListProp.jsonDecode(v66.items);
    end;
    if v66.num_columns ~= nil then
        v67.num_columns = v3.Int32Prop.jsonDecode(v66.num_columns);
    end;
    if v66.numColumns ~= nil then
        v67.num_columns = v3.Int32Prop.jsonDecode(v66.numColumns);
    end;
    if v66.grid_tag ~= nil then
        v67.grid_tag = v3.StringProp.jsonDecode(v66.grid_tag);
    end;
    if v66.gridTag ~= nil then
        v67.grid_tag = v3.StringProp.jsonDecode(v66.gridTag);
    end;
    if v66.layout_order ~= nil then
        v67.layout_order = v3.Int32Prop.jsonDecode(v66.layout_order);
    end;
    if v66.layoutOrder ~= nil then
        v67.layout_order = v3.Int32Prop.jsonDecode(v66.layoutOrder);
    end;
    if v66.anchor_point ~= nil then
        v67.anchor_point = v3.Vector2Prop.jsonDecode(v66.anchor_point);
    end;
    if v66.anchorPoint ~= nil then
        v67.anchor_point = v3.Vector2Prop.jsonDecode(v66.anchorPoint);
    end;
    if v66.position ~= nil then
        v67.position = v3.UDim2Prop.jsonDecode(v66.position);
    end;
    if v66.size ~= nil then
        v67.size = v3.UDim2Prop.jsonDecode(v66.size);
    end;
    return v67;
end;
v5.descriptor = {
    name = "InfoTableSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.InfoTableSchema_Props = v5;
v1.default:register(v2.InfoTableSchema_Props);
return {
    InfoTableSchema = v2.InfoTableSchema, 
    InfoTableSchema_Props = v2.InfoTableSchema_Props
};