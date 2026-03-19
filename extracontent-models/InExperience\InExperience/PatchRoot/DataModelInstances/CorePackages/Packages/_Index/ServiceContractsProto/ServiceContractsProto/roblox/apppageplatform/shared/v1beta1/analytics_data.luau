local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        kind = if not (v4 ~= nil) or v4.kind == nil then nil else v4.kind
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 45 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.kind ~= nil then
        if v5.kind.type == "binding_path" then
            local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
            v8, v9 = v0.writeString(v8, v9, v5.kind.value);
            v6 = v8;
            v7 = v9;
        elseif v5.kind.type == "literal" then
            local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
            v10, v11 = v0.writeString(v10, v11, v5.kind.value);
            v6 = v10;
            v7 = v11;
        end;
    end;
    local v12 = buffer.create(v7);
    buffer.copy(v12, 0, v6, 0, v7);
    return v12;
end;
v3.decode = function(v13) --[[ Line: 64 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v14 = v3.new();
    local v15 = 0;
    while v15 < buffer.len(v13) do
        local v16 = nil;
        local v17 = nil;
        local v18, v19, v20 = v0.readTag(v13, v15);
        v16 = v18;
        v17 = v19;
        v15 = v20;
        if v17 == v0.wireTypes.varint then
            v18 = nil;
            v19, v20 = v0.readVarInt(v13, v15);
            v18 = v19;
            v15 = v20;
        elseif v17 == v0.wireTypes.lengthDelimited then
            if v16 == 1 then
                v18 = nil;
                v19, v20 = v0.readBuffer(v13, v15);
                v18 = v19;
                v15 = v20;
                v14.kind = {
                    type = "binding_path", 
                    value = buffer.tostring(v18)
                };
            elseif v16 == 2 then
                v18 = nil;
                v19, v20 = v0.readBuffer(v13, v15);
                v18 = v19;
                v15 = v20;
                v14.kind = {
                    type = "literal", 
                    value = buffer.tostring(v18)
                };
            else
                v18 = nil;
                v19, v20 = v0.readVarInt(v13, v15);
                v15 = v20 + v19;
            end;
        elseif v17 == v0.wireTypes.i32 then
            v18 = nil;
            v19, v20 = v0.readFixed32(v13, v15);
            v18 = v19;
            v15 = v20;
        elseif v17 == v0.wireTypes.i64 then
            v18 = nil;
            v19, v20 = v0.readFixed64(v13, v15);
            v18 = v19;
            v15 = v20;
        else
            error("Unsupported wire type: " .. v17);
        end;
    end;
    return v14;
end;
v3.jsonEncode = function(v21) --[[ Line: 112 ]] --[[ Name: jsonEncode ]]
    local v22 = {};
    if v21.kind ~= nil then
        if v21.kind.type == "binding_path" then
            v22.bindingPath = v21.kind.value;
            return v22;
        elseif v21.kind.type == "literal" then
            v22.literal = v21.kind.value;
        end;
    end;
    return v22;
end;
v3.jsonDecode = function(v23) --[[ Line: 126 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v24 = v3.new();
    if v23.binding_path ~= nil then
        v24.kind = {
            type = "binding_path", 
            value = v23.binding_path
        };
    end;
    if v23.bindingPath ~= nil then
        v24.kind = {
            type = "binding_path", 
            value = v23.bindingPath
        };
    end;
    if v23.literal ~= nil then
        v24.kind = {
            type = "literal", 
            value = v23.literal
        };
    end;
    return v24;
end;
v3.descriptor = {
    name = "AnalyticsDataField", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataField"
};
v2.AnalyticsDataField = v3;
v1.default:register(v2.AnalyticsDataField);
return {
    AnalyticsDataField = v2.AnalyticsDataField
};