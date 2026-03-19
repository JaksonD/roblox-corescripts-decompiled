local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.component_shared);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        props = if not (v6 ~= nil) or v6.props == nil then nil else v6.props, 
        shared = if not (v6 ~= nil) or v6.shared == nil then nil else v6.shared
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 71 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.props ~= nil then
        local v10 = v7.props:encode();
        local v11, v12 = v0.writeTag(v8, v9, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeBuffer(v11, v12, v10, buffer.len(v10));
        v8 = v11;
        v9 = v12;
    end;
    if v7.shared ~= nil then
        local v13 = v7.shared:encode();
        local v14, v15 = v0.writeTag(v8, v9, 2, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v8 = v14;
        v9 = v15;
    end;
    local v16 = buffer.create(v9);
    buffer.copy(v16, 0, v8, 0, v9);
    return v16;
end;
v4.decode = function(v17) --[[ Line: 92 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_0 (copy), v0 (copy), v2 (copy), v3 (copy)
    local v18 = l_v4_0.new();
    local v19 = 0;
    while v19 < buffer.len(v17) do
        local v20 = nil;
        local v21 = nil;
        local v22, v23, v24 = v0.readTag(v17, v19);
        v20 = v22;
        v21 = v23;
        v19 = v24;
        if v21 == v0.wireTypes.varint then
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.lengthDelimited then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.props = v2.FragmentSchema_Props.decode(v22);
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.shared = v3.ComponentShared.decode(v22);
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v19 = v24 + v23;
            end;
        elseif v21 == v0.wireTypes.i32 then
            v22 = nil;
            v23, v24 = v0.readFixed32(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.i64 then
            v22 = nil;
            v23, v24 = v0.readFixed64(v17, v19);
            v22 = v23;
            v19 = v24;
        else
            error("Unsupported wire type: " .. v21);
        end;
    end;
    return v18;
end;
v4.jsonEncode = function(v25) --[[ Line: 140 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.props ~= nil then
        v26.props = v25.props:jsonEncode();
    end;
    if v25.shared ~= nil then
        v26.shared = v25.shared:jsonEncode();
    end;
    return v26;
end;
v4.jsonDecode = function(v27) --[[ Line: 154 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_0 (copy), v2 (copy), v3 (copy)
    local v28 = l_v4_0.new();
    if v27.props ~= nil then
        v28.props = v2.FragmentSchema_Props.jsonDecode(v27.props);
    end;
    if v27.shared ~= nil then
        v28.shared = v3.ComponentShared.jsonDecode(v27.shared);
    end;
    return v28;
end;
v4.descriptor = {
    name = "FragmentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FragmentSchema"
};
v2.FragmentSchema = v4;
v1.default:register(v2.FragmentSchema);
v4 = {};
v4.__index = v4;
v4.new = function(_) --[[ Line: 183 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({}, v4));
end;
v4.encode = function(_) --[[ Line: 187 ]] --[[ Name: encode ]]
    local v31 = buffer.create(0);
    local v32 = buffer.create(0);
    buffer.copy(v32, 0, v31, 0, 0);
    return v32;
end;
v4.decode = function(v33) --[[ Line: 196 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v34 = v4.new();
    local v35 = 0;
    while v35 < buffer.len(v33) do
        local v36 = nil;
        local v37 = nil;
        local v38, v39, v40 = v0.readTag(v33, v35);
        v36 = v38;
        v37 = v39;
        v35 = v40;
        if v37 == v0.wireTypes.varint then
            v38 = nil;
            v39, v40 = v0.readVarInt(v33, v35);
            v38 = v39;
            v35 = v40;
        elseif v37 == v0.wireTypes.lengthDelimited then
            v38 = nil;
            v39, v40 = v0.readVarInt(v33, v35);
            v35 = v40 + v39;
        elseif v37 == v0.wireTypes.i32 then
            v38 = nil;
            v39, v40 = v0.readFixed32(v33, v35);
            v38 = v39;
            v35 = v40;
        elseif v37 == v0.wireTypes.i64 then
            v38 = nil;
            v39, v40 = v0.readFixed64(v33, v35);
            v38 = v39;
            v35 = v40;
        else
            error("Unsupported wire type: " .. v37);
        end;
    end;
    return v34;
end;
v4.jsonEncode = function(_) --[[ Line: 234 ]] --[[ Name: jsonEncode ]]
    return {};
end;
v4.jsonDecode = function(_) --[[ Line: 240 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy)
    return (v4.new());
end;
v4.descriptor = {
    name = "FragmentSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.FragmentSchema_Props = v4;
v1.default:register(v2.FragmentSchema_Props);
return {
    FragmentSchema = v2.FragmentSchema, 
    FragmentSchema_Props = v2.FragmentSchema_Props
};