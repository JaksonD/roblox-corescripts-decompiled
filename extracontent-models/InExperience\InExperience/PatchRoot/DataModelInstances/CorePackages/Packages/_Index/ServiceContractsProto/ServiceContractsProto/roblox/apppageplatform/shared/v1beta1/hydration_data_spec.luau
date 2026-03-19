local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.hydration_content_type);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_v4_0 (copy)
    return (setmetatable({
        content_type = if not (v6 ~= nil) or v6.content_type == nil then assert(v3.HydrationContentType.fromNumber(0), "Enum has no 0 default") else v6.content_type, 
        id_binding = if not (v6 ~= nil) or v6.id_binding == nil then nil else v6.id_binding, 
        alias = (not (v6 ~= nil) or v6.alias == nil) and "" or v6.alias
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 80 ]] --[[ Name: encode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.content_type ~= nil and (v7.content_type ~= nil and v7.content_type ~= 0 or v7.content_type ~= v3.HydrationContentType.fromNumber(0)) then
        local v10, v11 = v0.writeTag(v8, v9, 1, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v3.HydrationContentType.toNumber(v7.content_type));
        v8 = v10;
        v9 = v11;
    end;
    if v7.id_binding ~= nil then
        local v12 = v7.id_binding:encode();
        local v13, v14 = v0.writeTag(v8, v9, 2, v0.wireTypes.lengthDelimited);
        v13, v14 = v0.writeBuffer(v13, v14, v12, buffer.len(v12));
        v8 = v13;
        v9 = v14;
    end;
    if v7.alias ~= nil and v7.alias ~= "" then
        local v15, v16 = v0.writeTag(v8, v9, 3, v0.wireTypes.lengthDelimited);
        v15, v16 = v0.writeString(v15, v16, v7.alias);
        v8 = v15;
        v9 = v16;
    end;
    local v17 = buffer.create(v9);
    buffer.copy(v17, 0, v8, 0, v9);
    return v17;
end;
v4.decode = function(v18) --[[ Line: 118 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_0 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v19 = l_v4_0.new();
    local v20 = 0;
    while v20 < buffer.len(v18) do
        local v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v0.readTag(v18, v20);
        v21 = v23;
        v22 = v24;
        v20 = v25;
        if v22 == v0.wireTypes.varint then
            if v21 == 1 then
                v23 = nil;
                v24, v25 = v0.readVarIntI32(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.content_type = v3.HydrationContentType.fromNumber(v23) or v23;
            else
                v23 = nil;
                v24, v25 = v0.readVarInt(v18, v20);
                v23 = v24;
                v20 = v25;
            end;
        elseif v22 == v0.wireTypes.lengthDelimited then
            if v21 == 2 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.id_binding = v2.IdBinding.decode(v23);
            elseif v21 == 3 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.alias = buffer.tostring(v23);
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
v4.jsonEncode = function(v26) --[[ Line: 175 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v3 (copy)
    local v27 = {};
    if v26.content_type ~= nil and (v26.content_type ~= nil and v26.content_type ~= 0 or v26.content_type ~= v3.HydrationContentType.fromNumber(0)) then
        v27.contentType = if typeof(v26.content_type) == "number" then v26.content_type else v3.HydrationContentType.toNumber(v26.content_type);
    end;
    if v26.id_binding ~= nil then
        v27.idBinding = v26.id_binding:jsonEncode();
    end;
    if v26.alias ~= nil and v26.alias ~= "" then
        v27.alias = v26.alias;
    end;
    return v27;
end;
v4.jsonDecode = function(v28) --[[ Line: 204 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_0 (copy), v3 (copy), v2 (copy)
    local v29 = l_v4_0.new();
    if v28.content_type ~= nil then
        v29.content_type = if typeof(v28.content_type) == "number" then v3.HydrationContentType.fromNumber(v28.content_type) or v28.content_type else v3.HydrationContentType.fromName(v28.content_type) or v28.content_type;
    end;
    if v28.contentType ~= nil then
        v29.content_type = if typeof(v28.contentType) == "number" then v3.HydrationContentType.fromNumber(v28.contentType) or v28.contentType else v3.HydrationContentType.fromName(v28.contentType) or v28.contentType;
    end;
    if v28.id_binding ~= nil then
        v29.id_binding = v2.IdBinding.jsonDecode(v28.id_binding);
    end;
    if v28.idBinding ~= nil then
        v29.id_binding = v2.IdBinding.jsonDecode(v28.idBinding);
    end;
    if v28.alias ~= nil then
        v29.alias = v28.alias;
    end;
    return v29;
end;
v4.descriptor = {
    name = "HydrationDataSpec", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HydrationDataSpec"
};
v2.HydrationDataSpec = v4;
v1.default:register(v2.HydrationDataSpec);
v4 = {};
v4.__index = v4;
v4.new = function(v30) --[[ Line: 256 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        kind = if not (v30 ~= nil) or v30.kind == nil then nil else v30.kind
    }, v4));
end;
v4.encode = function(v31) --[[ Line: 262 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.kind ~= nil then
        if v31.kind.type == "literal" then
            local v34, v35 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
            v34, v35 = v0.writeString(v34, v35, v31.kind.value);
            v32 = v34;
            v33 = v35;
        elseif v31.kind.type == "input_path" then
            local v36, v37 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
            v36, v37 = v0.writeString(v36, v37, v31.kind.value);
            v32 = v36;
            v33 = v37;
        end;
    end;
    local v38 = buffer.create(v33);
    buffer.copy(v38, 0, v32, 0, v33);
    return v38;
end;
v4.decode = function(v39) --[[ Line: 281 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v40 = v4.new();
    local v41 = 0;
    while v41 < buffer.len(v39) do
        local v42 = nil;
        local v43 = nil;
        local v44, v45, v46 = v0.readTag(v39, v41);
        v42 = v44;
        v43 = v45;
        v41 = v46;
        if v43 == v0.wireTypes.varint then
            v44 = nil;
            v45, v46 = v0.readVarInt(v39, v41);
            v44 = v45;
            v41 = v46;
        elseif v43 == v0.wireTypes.lengthDelimited then
            if v42 == 1 then
                v44 = nil;
                v45, v46 = v0.readBuffer(v39, v41);
                v44 = v45;
                v41 = v46;
                v40.kind = {
                    type = "literal", 
                    value = buffer.tostring(v44)
                };
            elseif v42 == 2 then
                v44 = nil;
                v45, v46 = v0.readBuffer(v39, v41);
                v44 = v45;
                v41 = v46;
                v40.kind = {
                    type = "input_path", 
                    value = buffer.tostring(v44)
                };
            else
                v44 = nil;
                v45, v46 = v0.readVarInt(v39, v41);
                v41 = v46 + v45;
            end;
        elseif v43 == v0.wireTypes.i32 then
            v44 = nil;
            v45, v46 = v0.readFixed32(v39, v41);
            v44 = v45;
            v41 = v46;
        elseif v43 == v0.wireTypes.i64 then
            v44 = nil;
            v45, v46 = v0.readFixed64(v39, v41);
            v44 = v45;
            v41 = v46;
        else
            error("Unsupported wire type: " .. v43);
        end;
    end;
    return v40;
end;
v4.jsonEncode = function(v47) --[[ Line: 329 ]] --[[ Name: jsonEncode ]]
    local v48 = {};
    if v47.kind ~= nil then
        if v47.kind.type == "literal" then
            v48.literal = v47.kind.value;
            return v48;
        elseif v47.kind.type == "input_path" then
            v48.inputPath = v47.kind.value;
        end;
    end;
    return v48;
end;
v4.jsonDecode = function(v49) --[[ Line: 343 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy)
    local v50 = v4.new();
    if v49.literal ~= nil then
        v50.kind = {
            type = "literal", 
            value = v49.literal
        };
    end;
    if v49.input_path ~= nil then
        v50.kind = {
            type = "input_path", 
            value = v49.input_path
        };
    end;
    if v49.inputPath ~= nil then
        v50.kind = {
            type = "input_path", 
            value = v49.inputPath
        };
    end;
    return v50;
end;
v4.descriptor = {
    name = "IdBinding", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IdBinding"
};
v2.IdBinding = v4;
v1.default:register(v2.IdBinding);
return {
    HydrationDataSpec = v2.HydrationDataSpec, 
    IdBinding = v2.IdBinding
};