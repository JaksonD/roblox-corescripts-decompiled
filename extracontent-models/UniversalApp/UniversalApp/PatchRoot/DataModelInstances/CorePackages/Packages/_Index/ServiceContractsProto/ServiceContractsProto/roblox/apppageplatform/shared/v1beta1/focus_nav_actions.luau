local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 82 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 103 ]] --[[ Name: decode ]]
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
                v19.props = v2.FocusNavActionsSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 151 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 165 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.FocusNavActionsSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "FocusNavActionsSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsSchema"
};
v2.FocusNavActionsSchema = v5;
v1.default:register(v2.FocusNavActionsSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 194 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        focus_nav_actions = if not (v30 ~= nil) or v30.focus_nav_actions == nil then nil else v30.focus_nav_actions
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 202 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.focus_nav_actions ~= nil then
        local v34 = v31.focus_nav_actions:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    local v37 = buffer.create(v33);
    buffer.copy(v37, 0, v32, 0, v33);
    return v37;
end;
v5.decode = function(v38) --[[ Line: 217 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v39 = v5.new();
    local v40 = 0;
    while v40 < buffer.len(v38) do
        local v41 = nil;
        local v42 = nil;
        local v43, v44, v45 = v0.readTag(v38, v40);
        v41 = v43;
        v42 = v44;
        v40 = v45;
        if v42 == v0.wireTypes.varint then
            v43 = nil;
            v44, v45 = v0.readVarInt(v38, v40);
            v43 = v44;
            v40 = v45;
        elseif v42 == v0.wireTypes.lengthDelimited then
            if v41 == 1 then
                v43 = nil;
                v44, v45 = v0.readBuffer(v38, v40);
                v43 = v44;
                v40 = v45;
                v39.focus_nav_actions = v3.StructProp.decode(v43);
            else
                v43 = nil;
                v44, v45 = v0.readVarInt(v38, v40);
                v40 = v45 + v44;
            end;
        elseif v42 == v0.wireTypes.i32 then
            v43 = nil;
            v44, v45 = v0.readFixed32(v38, v40);
            v43 = v44;
            v40 = v45;
        elseif v42 == v0.wireTypes.i64 then
            v43 = nil;
            v44, v45 = v0.readFixed64(v38, v40);
            v43 = v44;
            v40 = v45;
        else
            error("Unsupported wire type: " .. v42);
        end;
    end;
    return v39;
end;
v5.jsonEncode = function(v46) --[[ Line: 260 ]] --[[ Name: jsonEncode ]]
    local v47 = {};
    if v46.focus_nav_actions ~= nil then
        v47.focusNavActions = v46.focus_nav_actions:jsonEncode();
    end;
    return v47;
end;
v5.jsonDecode = function(v48) --[[ Line: 270 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v49 = v5.new();
    if v48.focus_nav_actions ~= nil then
        v49.focus_nav_actions = v3.StructProp.jsonDecode(v48.focus_nav_actions);
    end;
    if v48.focusNavActions ~= nil then
        v49.focus_nav_actions = v3.StructProp.jsonDecode(v48.focusNavActions);
    end;
    return v49;
end;
v5.descriptor = {
    name = "FocusNavActionsSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.FocusNavActionsSchema_Props = v5;
v1.default:register(v2.FocusNavActionsSchema_Props);
return {
    FocusNavActionsSchema = v2.FocusNavActionsSchema, 
    FocusNavActionsSchema_Props = v2.FocusNavActionsSchema_Props
};