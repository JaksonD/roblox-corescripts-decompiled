local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 79 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 86 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 107 ]] --[[ Name: decode ]]
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
                v20.props = v2.InfoTableCellSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 155 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 169 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.InfoTableCellSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "InfoTableCellSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.InfoTableCellSchema"
};
v2.InfoTableCellSchema = v6;
v1.default:register(v2.InfoTableCellSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 198 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        label_component = if not (v31 ~= nil) or v31.label_component == nil then nil else v31.label_component, 
        value_component = if not (v31 ~= nil) or v31.value_component == nil then nil else v31.value_component, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 209 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.label_component ~= nil then
        local v35 = v32.label_component:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.value_component ~= nil then
        local v38 = v32.value_component:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.on_activated ~= nil then
        local v41 = v32.on_activated:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.layout_order ~= nil then
        local v44 = v32.layout_order:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    local v47 = buffer.create(v34);
    buffer.copy(v47, 0, v33, 0, v34);
    return v47;
end;
v6.decode = function(v48) --[[ Line: 242 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v49 = v6.new();
    local v50 = 0;
    while v50 < buffer.len(v48) do
        local v51 = nil;
        local v52 = nil;
        local v53, v54, v55 = v0.readTag(v48, v50);
        v51 = v53;
        v52 = v54;
        v50 = v55;
        if v52 == v0.wireTypes.varint then
            v53 = nil;
            v54, v55 = v0.readVarInt(v48, v50);
            v53 = v54;
            v50 = v55;
        elseif v52 == v0.wireTypes.lengthDelimited then
            if v51 == 1 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.label_component = v3.NestedComponentProp.decode(v53);
            elseif v51 == 2 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.value_component = v3.NestedComponentProp.decode(v53);
            elseif v51 == 3 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.on_activated = v4.ActionProp.decode(v53);
            elseif v51 == 4 then
                v53 = nil;
                v54, v55 = v0.readBuffer(v48, v50);
                v53 = v54;
                v50 = v55;
                v49.layout_order = v3.Int32Prop.decode(v53);
            else
                v53 = nil;
                v54, v55 = v0.readVarInt(v48, v50);
                v50 = v55 + v54;
            end;
        elseif v52 == v0.wireTypes.i32 then
            v53 = nil;
            v54, v55 = v0.readFixed32(v48, v50);
            v53 = v54;
            v50 = v55;
        elseif v52 == v0.wireTypes.i64 then
            v53 = nil;
            v54, v55 = v0.readFixed64(v48, v50);
            v53 = v54;
            v50 = v55;
        else
            error("Unsupported wire type: " .. v52);
        end;
    end;
    return v49;
end;
v6.jsonEncode = function(v56) --[[ Line: 302 ]] --[[ Name: jsonEncode ]]
    local v57 = {};
    if v56.label_component ~= nil then
        v57.labelComponent = v56.label_component:jsonEncode();
    end;
    if v56.value_component ~= nil then
        v57.valueComponent = v56.value_component:jsonEncode();
    end;
    if v56.on_activated ~= nil then
        v57.onActivated = v56.on_activated:jsonEncode();
    end;
    if v56.layout_order ~= nil then
        v57.layoutOrder = v56.layout_order:jsonEncode();
    end;
    return v57;
end;
v6.jsonDecode = function(v58) --[[ Line: 324 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v59 = v6.new();
    if v58.label_component ~= nil then
        v59.label_component = v3.NestedComponentProp.jsonDecode(v58.label_component);
    end;
    if v58.labelComponent ~= nil then
        v59.label_component = v3.NestedComponentProp.jsonDecode(v58.labelComponent);
    end;
    if v58.value_component ~= nil then
        v59.value_component = v3.NestedComponentProp.jsonDecode(v58.value_component);
    end;
    if v58.valueComponent ~= nil then
        v59.value_component = v3.NestedComponentProp.jsonDecode(v58.valueComponent);
    end;
    if v58.on_activated ~= nil then
        v59.on_activated = v4.ActionProp.jsonDecode(v58.on_activated);
    end;
    if v58.onActivated ~= nil then
        v59.on_activated = v4.ActionProp.jsonDecode(v58.onActivated);
    end;
    if v58.layout_order ~= nil then
        v59.layout_order = v3.Int32Prop.jsonDecode(v58.layout_order);
    end;
    if v58.layoutOrder ~= nil then
        v59.layout_order = v3.Int32Prop.jsonDecode(v58.layoutOrder);
    end;
    return v59;
end;
v6.descriptor = {
    name = "InfoTableCellSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.InfoTableCellSchema_Props = v6;
v1.default:register(v2.InfoTableCellSchema_Props);
return {
    InfoTableCellSchema = v2.InfoTableCellSchema, 
    InfoTableCellSchema_Props = v2.InfoTableCellSchema_Props
};