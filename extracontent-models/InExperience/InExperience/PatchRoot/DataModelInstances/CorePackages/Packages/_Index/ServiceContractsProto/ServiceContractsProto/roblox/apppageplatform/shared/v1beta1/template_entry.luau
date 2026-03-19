local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.ui_component_schema);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        template = if not (v5 ~= nil) or v5.template == nil then nil else v5.template, 
        roblox_component = (not (v5 ~= nil) or v5.roblox_component == nil) and "" or v5.roblox_component
    }, v4));
end;
v4.encode = function(v6) --[[ Line: 50 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.template ~= nil then
        local v9 = v6.template:encode();
        local v10, v11 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeBuffer(v10, v11, v9, buffer.len(v9));
        v7 = v10;
        v8 = v11;
    end;
    if v6.roblox_component ~= nil and v6.roblox_component ~= "" then
        local v12, v13 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v6.roblox_component);
        v7 = v12;
        v8 = v13;
    end;
    local v14 = buffer.create(v8);
    buffer.copy(v14, 0, v7, 0, v8);
    return v14;
end;
v4.decode = function(v15) --[[ Line: 70 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    local v16 = v4.new();
    local v17 = 0;
    while v17 < buffer.len(v15) do
        local v18 = nil;
        local v19 = nil;
        local v20, v21, v22 = v0.readTag(v15, v17);
        v18 = v20;
        v19 = v21;
        v17 = v22;
        if v19 == v0.wireTypes.varint then
            v20 = nil;
            v21, v22 = v0.readVarInt(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.lengthDelimited then
            if v18 == 1 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.template = v3.UiComponentSchema.decode(v20);
            elseif v18 == 2 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.roblox_component = buffer.tostring(v20);
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v17 = v22 + v21;
            end;
        elseif v19 == v0.wireTypes.i32 then
            v20 = nil;
            v21, v22 = v0.readFixed32(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.i64 then
            v20 = nil;
            v21, v22 = v0.readFixed64(v15, v17);
            v20 = v21;
            v17 = v22;
        else
            error("Unsupported wire type: " .. v19);
        end;
    end;
    return v16;
end;
v4.jsonEncode = function(v23) --[[ Line: 119 ]] --[[ Name: jsonEncode ]]
    local v24 = {};
    if v23.template ~= nil then
        v24.template = v23.template:jsonEncode();
    end;
    if v23.roblox_component ~= nil and v23.roblox_component ~= "" then
        v24.robloxComponent = v23.roblox_component;
    end;
    return v24;
end;
v4.jsonDecode = function(v25) --[[ Line: 133 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v26 = v4.new();
    if v25.template ~= nil then
        v26.template = v3.UiComponentSchema.jsonDecode(v25.template);
    end;
    if v25.roblox_component ~= nil then
        v26.roblox_component = v25.roblox_component;
    end;
    if v25.robloxComponent ~= nil then
        v26.roblox_component = v25.robloxComponent;
    end;
    return v26;
end;
v4.descriptor = {
    name = "TemplateEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.TemplateEntry"
};
v2.TemplateEntry = v4;
v1.default:register(v2.TemplateEntry);
return {
    TemplateEntry = v2.TemplateEntry
};