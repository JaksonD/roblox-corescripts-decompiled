local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.capability);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        enabled_capabilities = if not (v5 ~= nil) or v5.enabled_capabilities == nil then {} else v5.enabled_capabilities, 
        proto_version = (not (v5 ~= nil) or v5.proto_version == nil) and "" or v5.proto_version
    }, v4));
end;
v4.encode = function(v6) --[[ Line: 52 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.enabled_capabilities ~= nil and #v6.enabled_capabilities > 0 then
        for _, v10 in v6.enabled_capabilities do
            local v11, v12 = v0.writeTag(v7, v8, 1, v0.wireTypes.varint);
            v11, v12 = v0.writeVarInt(v11, v12, v3.Capability.toNumber(v10));
            v7 = v11;
            v8 = v12;
        end;
    end;
    if v6.proto_version ~= nil and v6.proto_version ~= "" then
        local v13, v14 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
        v13, v14 = v0.writeString(v13, v14, v6.proto_version);
        v7 = v13;
        v8 = v14;
    end;
    local v15 = buffer.create(v8);
    buffer.copy(v15, 0, v7, 0, v8);
    return v15;
end;
v4.decode = function(v16) --[[ Line: 77 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    local v17 = v4.new();
    local v18 = 0;
    while v18 < buffer.len(v16) do
        local v19 = nil;
        local v20 = nil;
        local v21, v22, v23 = v0.readTag(v16, v18);
        v19 = v21;
        v20 = v22;
        v18 = v23;
        if v20 == v0.wireTypes.varint then
            if v19 == 1 then
                v21 = nil;
                v22, v23 = v0.readVarIntI32(v16, v18);
                v21 = v22;
                v18 = v23;
                table.insert(v17.enabled_capabilities, v3.Capability.fromNumber(v21) or v21);
            else
                v21 = nil;
                v22, v23 = v0.readVarInt(v16, v18);
                v21 = v22;
                v18 = v23;
            end;
        elseif v20 == v0.wireTypes.lengthDelimited then
            if v19 == 2 then
                v21 = nil;
                v22, v23 = v0.readBuffer(v16, v18);
                v21 = v22;
                v18 = v23;
                v17.proto_version = buffer.tostring(v21);
            else
                v21 = nil;
                v22, v23 = v0.readVarInt(v16, v18);
                v18 = v23 + v22;
            end;
        elseif v20 == v0.wireTypes.i32 then
            v21 = nil;
            v22, v23 = v0.readFixed32(v16, v18);
            v21 = v22;
            v18 = v23;
        elseif v20 == v0.wireTypes.i64 then
            v21 = nil;
            v22, v23 = v0.readFixed64(v16, v18);
            v21 = v22;
            v18 = v23;
        else
            error("Unsupported wire type: " .. v20);
        end;
    end;
    return v17;
end;
v4.jsonEncode = function(v24) --[[ Line: 128 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v3 (copy)
    local v25 = {};
    if v24.enabled_capabilities ~= nil and #v24.enabled_capabilities > 0 then
        local v26 = {};
        for _, v28 in v24.enabled_capabilities do
            table.insert(v26, if typeof(v28) == "number" then v28 else v3.Capability.toNumber(v28));
        end;
        v25.enabledCapabilities = v26;
    end;
    if v24.proto_version ~= nil and v24.proto_version ~= "" then
        v25.protoVersion = v24.proto_version;
    end;
    return v25;
end;
v4.jsonDecode = function(v29) --[[ Line: 151 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v30 = v4.new();
    if v29.enabled_capabilities ~= nil then
        local v31 = {};
        for _, v33 in v29.enabled_capabilities do
            table.insert(v31, if typeof(v33) == "number" then v3.Capability.fromNumber(v33) or v33 else v3.Capability.fromName(v33) or v33);
        end;
        v30.enabled_capabilities = v31;
    end;
    if v29.enabledCapabilities ~= nil then
        local v34 = {};
        for _, v36 in v29.enabledCapabilities do
            table.insert(v34, if typeof(v36) == "number" then v3.Capability.fromNumber(v36) or v36 else v3.Capability.fromName(v36) or v36);
        end;
        v30.enabled_capabilities = v34;
    end;
    if v29.proto_version ~= nil then
        v30.proto_version = v29.proto_version;
    end;
    if v29.protoVersion ~= nil then
        v30.proto_version = v29.protoVersion;
    end;
    return v30;
end;
v4.descriptor = {
    name = "ClientCapabilities", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
};
v2.ClientCapabilities = v4;
v1.default:register(v2.ClientCapabilities);
return {
    ClientCapabilities = v2.ClientCapabilities
};