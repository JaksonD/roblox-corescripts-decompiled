local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 73 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 80 ]] --[[ Name: encode ]]
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
v5.decode = function(v18) --[[ Line: 101 ]] --[[ Name: decode ]]
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
                v19.props = v2.PlayButtonSchema_Props.decode(v23);
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
v5.jsonEncode = function(v26) --[[ Line: 149 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 163 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.PlayButtonSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "PlayButtonSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonSchema"
};
v2.PlayButtonSchema = v5;
v1.default:register(v2.PlayButtonSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 192 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        width = if not (v30 ~= nil) or v30.width == nil then nil else v30.width, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 200 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.width ~= nil then
        local v34 = v31.width:encode();
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
    local v43 = buffer.create(v33);
    buffer.copy(v43, 0, v32, 0, v33);
    return v43;
end;
v5.decode = function(v44) --[[ Line: 227 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v45 = v5.new();
    local v46 = 0;
    while v46 < buffer.len(v44) do
        local v47 = nil;
        local v48 = nil;
        local v49, v50, v51 = v0.readTag(v44, v46);
        v47 = v49;
        v48 = v50;
        v46 = v51;
        if v48 == v0.wireTypes.varint then
            v49 = nil;
            v50, v51 = v0.readVarInt(v44, v46);
            v49 = v50;
            v46 = v51;
        elseif v48 == v0.wireTypes.lengthDelimited then
            if v47 == 1 then
                v49 = nil;
                v50, v51 = v0.readBuffer(v44, v46);
                v49 = v50;
                v46 = v51;
                v45.width = v3.UDimProp.decode(v49);
            elseif v47 == 2 then
                v49 = nil;
                v50, v51 = v0.readBuffer(v44, v46);
                v49 = v50;
                v46 = v51;
                v45.anchor_point = v3.Vector2Prop.decode(v49);
            elseif v47 == 3 then
                v49 = nil;
                v50, v51 = v0.readBuffer(v44, v46);
                v49 = v50;
                v46 = v51;
                v45.position = v3.UDim2Prop.decode(v49);
            else
                v49 = nil;
                v50, v51 = v0.readVarInt(v44, v46);
                v46 = v51 + v50;
            end;
        elseif v48 == v0.wireTypes.i32 then
            v49 = nil;
            v50, v51 = v0.readFixed32(v44, v46);
            v49 = v50;
            v46 = v51;
        elseif v48 == v0.wireTypes.i64 then
            v49 = nil;
            v50, v51 = v0.readFixed64(v44, v46);
            v49 = v50;
            v46 = v51;
        else
            error("Unsupported wire type: " .. v48);
        end;
    end;
    return v45;
end;
v5.jsonEncode = function(v52) --[[ Line: 280 ]] --[[ Name: jsonEncode ]]
    local v53 = {};
    if v52.width ~= nil then
        v53.width = v52.width:jsonEncode();
    end;
    if v52.anchor_point ~= nil then
        v53.anchorPoint = v52.anchor_point:jsonEncode();
    end;
    if v52.position ~= nil then
        v53.position = v52.position:jsonEncode();
    end;
    return v53;
end;
v5.jsonDecode = function(v54) --[[ Line: 298 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v55 = v5.new();
    if v54.width ~= nil then
        v55.width = v3.UDimProp.jsonDecode(v54.width);
    end;
    if v54.anchor_point ~= nil then
        v55.anchor_point = v3.Vector2Prop.jsonDecode(v54.anchor_point);
    end;
    if v54.anchorPoint ~= nil then
        v55.anchor_point = v3.Vector2Prop.jsonDecode(v54.anchorPoint);
    end;
    if v54.position ~= nil then
        v55.position = v3.UDim2Prop.jsonDecode(v54.position);
    end;
    return v55;
end;
v5.descriptor = {
    name = "PlayButtonSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.PlayButtonSchema_Props = v5;
v1.default:register(v2.PlayButtonSchema_Props);
return {
    PlayButtonSchema = v2.PlayButtonSchema, 
    PlayButtonSchema_Props = v2.PlayButtonSchema_Props
};