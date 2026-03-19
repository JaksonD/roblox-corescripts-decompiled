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
v5.encode = function(v8) --[[ Line: 95 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 116 ]] --[[ Name: decode ]]
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
                v19.props = v2.SingleItemCollectionSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 164 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 178 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.SingleItemCollectionSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "SingleItemCollectionSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SingleItemCollectionSchema"
};
v2.SingleItemCollectionSchema = v5;
v1.default:register(v2.SingleItemCollectionSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 207 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        automatic_size = if not (v30 ~= nil) or v30.automatic_size == nil then nil else v30.automatic_size, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        size = if not (v30 ~= nil) or v30.size == nil then nil else v30.size, 
        item = if not (v30 ~= nil) or v30.item == nil then nil else v30.item
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 219 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.automatic_size ~= nil then
        local v34 = v31.automatic_size:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.anchor_point ~= nil then
        local v37 = v31.anchor_point:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.position ~= nil then
        local v40 = v31.position:encode();
        local v41, v42 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v32 = v41;
        v33 = v42;
    end;
    if v31.size ~= nil then
        local v43 = v31.size:encode();
        local v44, v45 = v0.writeTag(v32, v33, 4, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
        v32 = v44;
        v33 = v45;
    end;
    if v31.item ~= nil then
        local v46 = v31.item:encode();
        local v47, v48 = v0.writeTag(v32, v33, 5, v0.wireTypes.lengthDelimited);
        v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
        v32 = v47;
        v33 = v48;
    end;
    local v49 = buffer.create(v33);
    buffer.copy(v49, 0, v32, 0, v33);
    return v49;
end;
v5.decode = function(v50) --[[ Line: 258 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v51 = v5.new();
    local v52 = 0;
    while v52 < buffer.len(v50) do
        local v53 = nil;
        local v54 = nil;
        local v55, v56, v57 = v0.readTag(v50, v52);
        v53 = v55;
        v54 = v56;
        v52 = v57;
        if v54 == v0.wireTypes.varint then
            v55 = nil;
            v56, v57 = v0.readVarInt(v50, v52);
            v55 = v56;
            v52 = v57;
        elseif v54 == v0.wireTypes.lengthDelimited then
            if v53 == 1 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.automatic_size = v3.StringProp.decode(v55);
            elseif v53 == 2 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.anchor_point = v3.Vector2Prop.decode(v55);
            elseif v53 == 3 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.position = v3.UDim2Prop.decode(v55);
            elseif v53 == 4 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.size = v3.UDim2Prop.decode(v55);
            elseif v53 == 5 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.item = v3.NestedComponentProp.decode(v55);
            else
                v55 = nil;
                v56, v57 = v0.readVarInt(v50, v52);
                v52 = v57 + v56;
            end;
        elseif v54 == v0.wireTypes.i32 then
            v55 = nil;
            v56, v57 = v0.readFixed32(v50, v52);
            v55 = v56;
            v52 = v57;
        elseif v54 == v0.wireTypes.i64 then
            v55 = nil;
            v56, v57 = v0.readFixed64(v50, v52);
            v55 = v56;
            v52 = v57;
        else
            error("Unsupported wire type: " .. v54);
        end;
    end;
    return v51;
end;
v5.jsonEncode = function(v58) --[[ Line: 321 ]] --[[ Name: jsonEncode ]]
    local v59 = {};
    if v58.automatic_size ~= nil then
        v59.automaticSize = v58.automatic_size:jsonEncode();
    end;
    if v58.anchor_point ~= nil then
        v59.anchorPoint = v58.anchor_point:jsonEncode();
    end;
    if v58.position ~= nil then
        v59.position = v58.position:jsonEncode();
    end;
    if v58.size ~= nil then
        v59.size = v58.size:jsonEncode();
    end;
    if v58.item ~= nil then
        v59.item = v58.item:jsonEncode();
    end;
    return v59;
end;
v5.jsonDecode = function(v60) --[[ Line: 347 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v61 = v5.new();
    if v60.automatic_size ~= nil then
        v61.automatic_size = v3.StringProp.jsonDecode(v60.automatic_size);
    end;
    if v60.automaticSize ~= nil then
        v61.automatic_size = v3.StringProp.jsonDecode(v60.automaticSize);
    end;
    if v60.anchor_point ~= nil then
        v61.anchor_point = v3.Vector2Prop.jsonDecode(v60.anchor_point);
    end;
    if v60.anchorPoint ~= nil then
        v61.anchor_point = v3.Vector2Prop.jsonDecode(v60.anchorPoint);
    end;
    if v60.position ~= nil then
        v61.position = v3.UDim2Prop.jsonDecode(v60.position);
    end;
    if v60.size ~= nil then
        v61.size = v3.UDim2Prop.jsonDecode(v60.size);
    end;
    if v60.item ~= nil then
        v61.item = v3.NestedComponentProp.jsonDecode(v60.item);
    end;
    return v61;
end;
v5.descriptor = {
    name = "SingleItemCollectionSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.SingleItemCollectionSchema_Props = v5;
v1.default:register(v2.SingleItemCollectionSchema_Props);
return {
    SingleItemCollectionSchema = v2.SingleItemCollectionSchema, 
    SingleItemCollectionSchema_Props = v2.SingleItemCollectionSchema_Props
};