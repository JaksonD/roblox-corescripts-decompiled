local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 82 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 103 ]] --[[ Name: decode ]]
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
                v20.props = v2.ButtonSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 151 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 165 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.ButtonSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "ButtonSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ButtonSchema"
};
v2.ButtonSchema = v6;
v1.default:register(v2.ButtonSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 194 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        width = if not (v31 ~= nil) or v31.width == nil then nil else v31.width
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 204 ]] --[[ Name: encode ]]
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
    if v32.layout_order ~= nil then
        local v38 = v32.layout_order:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.position ~= nil then
        local v41 = v32.position:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.on_activated ~= nil then
        local v44 = v32.on_activated:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.width ~= nil then
        local v47 = v32.width:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    local v50 = buffer.create(v34);
    buffer.copy(v50, 0, v33, 0, v34);
    return v50;
end;
v6.decode = function(v51) --[[ Line: 243 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v52 = v6.new();
    local v53 = 0;
    while v53 < buffer.len(v51) do
        local v54 = nil;
        local v55 = nil;
        local v56, v57, v58 = v0.readTag(v51, v53);
        v54 = v56;
        v55 = v57;
        v53 = v58;
        if v55 == v0.wireTypes.varint then
            v56 = nil;
            v57, v58 = v0.readVarInt(v51, v53);
            v56 = v57;
            v53 = v58;
        elseif v55 == v0.wireTypes.lengthDelimited then
            if v54 == 1 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.anchor_point = v3.Vector2Prop.decode(v56);
            elseif v54 == 2 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.layout_order = v3.Int32Prop.decode(v56);
            elseif v54 == 3 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.position = v3.UDim2Prop.decode(v56);
            elseif v54 == 4 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.on_activated = v4.ActionProp.decode(v56);
            elseif v54 == 5 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.width = v3.UDimProp.decode(v56);
            else
                v56 = nil;
                v57, v58 = v0.readVarInt(v51, v53);
                v53 = v58 + v57;
            end;
        elseif v55 == v0.wireTypes.i32 then
            v56 = nil;
            v57, v58 = v0.readFixed32(v51, v53);
            v56 = v57;
            v53 = v58;
        elseif v55 == v0.wireTypes.i64 then
            v56 = nil;
            v57, v58 = v0.readFixed64(v51, v53);
            v56 = v57;
            v53 = v58;
        else
            error("Unsupported wire type: " .. v55);
        end;
    end;
    return v52;
end;
v6.jsonEncode = function(v59) --[[ Line: 306 ]] --[[ Name: jsonEncode ]]
    local v60 = {};
    if v59.anchor_point ~= nil then
        v60.anchorPoint = v59.anchor_point:jsonEncode();
    end;
    if v59.layout_order ~= nil then
        v60.layoutOrder = v59.layout_order:jsonEncode();
    end;
    if v59.position ~= nil then
        v60.position = v59.position:jsonEncode();
    end;
    if v59.on_activated ~= nil then
        v60.onActivated = v59.on_activated:jsonEncode();
    end;
    if v59.width ~= nil then
        v60.width = v59.width:jsonEncode();
    end;
    return v60;
end;
v6.jsonDecode = function(v61) --[[ Line: 332 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v62 = v6.new();
    if v61.anchor_point ~= nil then
        v62.anchor_point = v3.Vector2Prop.jsonDecode(v61.anchor_point);
    end;
    if v61.anchorPoint ~= nil then
        v62.anchor_point = v3.Vector2Prop.jsonDecode(v61.anchorPoint);
    end;
    if v61.layout_order ~= nil then
        v62.layout_order = v3.Int32Prop.jsonDecode(v61.layout_order);
    end;
    if v61.layoutOrder ~= nil then
        v62.layout_order = v3.Int32Prop.jsonDecode(v61.layoutOrder);
    end;
    if v61.position ~= nil then
        v62.position = v3.UDim2Prop.jsonDecode(v61.position);
    end;
    if v61.on_activated ~= nil then
        v62.on_activated = v4.ActionProp.jsonDecode(v61.on_activated);
    end;
    if v61.onActivated ~= nil then
        v62.on_activated = v4.ActionProp.jsonDecode(v61.onActivated);
    end;
    if v61.width ~= nil then
        v62.width = v3.UDimProp.jsonDecode(v61.width);
    end;
    return v62;
end;
v6.descriptor = {
    name = "ButtonSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.ButtonSchema_Props = v6;
v1.default:register(v2.ButtonSchema_Props);
return {
    ButtonSchema = v2.ButtonSchema, 
    ButtonSchema_Props = v2.ButtonSchema_Props
};