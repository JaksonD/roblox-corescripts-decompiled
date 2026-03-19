local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 84 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 105 ]] --[[ Name: decode ]]
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
                v19.props = v2.AssociatedItemsRowSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 153 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 167 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.AssociatedItemsRowSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "AssociatedItemsRowSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AssociatedItemsRowSchema"
};
v2.AssociatedItemsRowSchema = v5;
v1.default:register(v2.AssociatedItemsRowSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 196 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        items = if not (v30 ~= nil) or v30.items == nil then nil else v30.items, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 205 ]] --[[ Name: encode ]]
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
    if v31.layout_order ~= nil then
        local v37 = v31.layout_order:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    local v40 = buffer.create(v33);
    buffer.copy(v40, 0, v32, 0, v33);
    return v40;
end;
v5.decode = function(v41) --[[ Line: 226 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v42 = v5.new();
    local v43 = 0;
    while v43 < buffer.len(v41) do
        local v44 = nil;
        local v45 = nil;
        local v46, v47, v48 = v0.readTag(v41, v43);
        v44 = v46;
        v45 = v47;
        v43 = v48;
        if v45 == v0.wireTypes.varint then
            v46 = nil;
            v47, v48 = v0.readVarInt(v41, v43);
            v46 = v47;
            v43 = v48;
        elseif v45 == v0.wireTypes.lengthDelimited then
            if v44 == 1 then
                v46 = nil;
                v47, v48 = v0.readBuffer(v41, v43);
                v46 = v47;
                v43 = v48;
                v42.items = v3.LazyNestedComponentListProp.decode(v46);
            elseif v44 == 2 then
                v46 = nil;
                v47, v48 = v0.readBuffer(v41, v43);
                v46 = v47;
                v43 = v48;
                v42.layout_order = v3.Int32Prop.decode(v46);
            else
                v46 = nil;
                v47, v48 = v0.readVarInt(v41, v43);
                v43 = v48 + v47;
            end;
        elseif v45 == v0.wireTypes.i32 then
            v46 = nil;
            v47, v48 = v0.readFixed32(v41, v43);
            v46 = v47;
            v43 = v48;
        elseif v45 == v0.wireTypes.i64 then
            v46 = nil;
            v47, v48 = v0.readFixed64(v41, v43);
            v46 = v47;
            v43 = v48;
        else
            error("Unsupported wire type: " .. v45);
        end;
    end;
    return v42;
end;
v5.jsonEncode = function(v49) --[[ Line: 275 ]] --[[ Name: jsonEncode ]]
    local v50 = {};
    if v49.items ~= nil then
        v50.items = v49.items:jsonEncode();
    end;
    if v49.layout_order ~= nil then
        v50.layoutOrder = v49.layout_order:jsonEncode();
    end;
    return v50;
end;
v5.jsonDecode = function(v51) --[[ Line: 289 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v52 = v5.new();
    if v51.items ~= nil then
        v52.items = v3.LazyNestedComponentListProp.jsonDecode(v51.items);
    end;
    if v51.layout_order ~= nil then
        v52.layout_order = v3.Int32Prop.jsonDecode(v51.layout_order);
    end;
    if v51.layoutOrder ~= nil then
        v52.layout_order = v3.Int32Prop.jsonDecode(v51.layoutOrder);
    end;
    return v52;
end;
v5.descriptor = {
    name = "AssociatedItemsRowSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.AssociatedItemsRowSchema_Props = v5;
v1.default:register(v2.AssociatedItemsRowSchema_Props);
return {
    AssociatedItemsRowSchema = v2.AssociatedItemsRowSchema, 
    AssociatedItemsRowSchema_Props = v2.AssociatedItemsRowSchema_Props
};