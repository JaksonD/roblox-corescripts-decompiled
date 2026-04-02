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
                v19.props = v2.PlayButtonWithContextualMessageSchema_Props.decode(v23);
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
        v29.props = v2.PlayButtonWithContextualMessageSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "PlayButtonWithContextualMessageSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonWithContextualMessageSchema"
};
v2.PlayButtonWithContextualMessageSchema = v5;
v1.default:register(v2.PlayButtonWithContextualMessageSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 209 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        play_button = if not (v30 ~= nil) or v30.play_button == nil then nil else v30.play_button, 
        universe_id = if not (v30 ~= nil) or v30.universe_id == nil then nil else v30.universe_id, 
        fetch_delay_in_seconds = if not (v30 ~= nil) or v30.fetch_delay_in_seconds == nil then nil else v30.fetch_delay_in_seconds, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 222 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.play_button ~= nil then
        local v34 = v31.play_button:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.universe_id ~= nil then
        local v37 = v31.universe_id:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.fetch_delay_in_seconds ~= nil then
        local v40 = v31.fetch_delay_in_seconds:encode();
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
    local v46 = buffer.create(v33);
    buffer.copy(v46, 0, v32, 0, v33);
    return v46;
end;
v5.decode = function(v47) --[[ Line: 257 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v48 = v5.new();
    local v49 = 0;
    while v49 < buffer.len(v47) do
        local v50 = nil;
        local v51 = nil;
        local v52, v53, v54 = v0.readTag(v47, v49);
        v50 = v52;
        v51 = v53;
        v49 = v54;
        if v51 == v0.wireTypes.varint then
            v52 = nil;
            v53, v54 = v0.readVarInt(v47, v49);
            v52 = v53;
            v49 = v54;
        elseif v51 == v0.wireTypes.lengthDelimited then
            if v50 == 1 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.play_button = v3.NestedComponentProp.decode(v52);
            elseif v50 == 2 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.universe_id = v3.StringProp.decode(v52);
            elseif v50 == 3 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.fetch_delay_in_seconds = v3.FloatProp.decode(v52);
            elseif v50 == 4 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.layout_order = v3.Int32Prop.decode(v52);
            else
                v52 = nil;
                v53, v54 = v0.readVarInt(v47, v49);
                v49 = v54 + v53;
            end;
        elseif v51 == v0.wireTypes.i32 then
            v52 = nil;
            v53, v54 = v0.readFixed32(v47, v49);
            v52 = v53;
            v49 = v54;
        elseif v51 == v0.wireTypes.i64 then
            v52 = nil;
            v53, v54 = v0.readFixed64(v47, v49);
            v52 = v53;
            v49 = v54;
        else
            error("Unsupported wire type: " .. v51);
        end;
    end;
    return v48;
end;
v5.jsonEncode = function(v55) --[[ Line: 319 ]] --[[ Name: jsonEncode ]]
    local v56 = {};
    if v55.play_button ~= nil then
        v56.playButton = v55.play_button:jsonEncode();
    end;
    if v55.universe_id ~= nil then
        v56.universeId = v55.universe_id:jsonEncode();
    end;
    if v55.fetch_delay_in_seconds ~= nil then
        v56.fetchDelayInSeconds = v55.fetch_delay_in_seconds:jsonEncode();
    end;
    if v55.layout_order ~= nil then
        v56.layoutOrder = v55.layout_order:jsonEncode();
    end;
    return v56;
end;
v5.jsonDecode = function(v57) --[[ Line: 343 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v58 = v5.new();
    if v57.play_button ~= nil then
        v58.play_button = v3.NestedComponentProp.jsonDecode(v57.play_button);
    end;
    if v57.playButton ~= nil then
        v58.play_button = v3.NestedComponentProp.jsonDecode(v57.playButton);
    end;
    if v57.universe_id ~= nil then
        v58.universe_id = v3.StringProp.jsonDecode(v57.universe_id);
    end;
    if v57.universeId ~= nil then
        v58.universe_id = v3.StringProp.jsonDecode(v57.universeId);
    end;
    if v57.fetch_delay_in_seconds ~= nil then
        v58.fetch_delay_in_seconds = v3.FloatProp.jsonDecode(v57.fetch_delay_in_seconds);
    end;
    if v57.fetchDelayInSeconds ~= nil then
        v58.fetch_delay_in_seconds = v3.FloatProp.jsonDecode(v57.fetchDelayInSeconds);
    end;
    if v57.layout_order ~= nil then
        v58.layout_order = v3.Int32Prop.jsonDecode(v57.layout_order);
    end;
    if v57.layoutOrder ~= nil then
        v58.layout_order = v3.Int32Prop.jsonDecode(v57.layoutOrder);
    end;
    return v58;
end;
v5.descriptor = {
    name = "PlayButtonWithContextualMessageSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.PlayButtonWithContextualMessageSchema_Props = v5;
v1.default:register(v2.PlayButtonWithContextualMessageSchema_Props);
return {
    PlayButtonWithContextualMessageSchema = v2.PlayButtonWithContextualMessageSchema, 
    PlayButtonWithContextualMessageSchema_Props = v2.PlayButtonWithContextualMessageSchema_Props
};