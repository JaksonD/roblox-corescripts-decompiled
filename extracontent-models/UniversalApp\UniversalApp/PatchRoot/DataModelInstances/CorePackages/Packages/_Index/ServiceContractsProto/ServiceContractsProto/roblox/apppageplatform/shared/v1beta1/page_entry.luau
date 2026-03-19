local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        roblox_component = (not (v4 ~= nil) or v4.roblox_component == nil) and "" or v4.roblox_component, 
        identifier = (not (v4 ~= nil) or v4.identifier == nil) and "" or v4.identifier, 
        title = (not (v4 ~= nil) or v4.title == nil) and "" or v4.title
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 51 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.roblox_component ~= nil and v5.roblox_component ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.roblox_component);
        v6 = v8;
        v7 = v9;
    end;
    if v5.identifier ~= nil and v5.identifier ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.identifier);
        v6 = v10;
        v7 = v11;
    end;
    if v5.title ~= nil and v5.title ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.title);
        v6 = v12;
        v7 = v13;
    end;
    local v14 = buffer.create(v7);
    buffer.copy(v14, 0, v6, 0, v7);
    return v14;
end;
v3.decode = function(v15) --[[ Line: 75 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v16 = v3.new();
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
                v16.roblox_component = buffer.tostring(v20);
            elseif v18 == 2 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.identifier = buffer.tostring(v20);
            elseif v18 == 3 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.title = buffer.tostring(v20);
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
v3.jsonEncode = function(v23) --[[ Line: 128 ]] --[[ Name: jsonEncode ]]
    local v24 = {};
    if v23.roblox_component ~= nil and v23.roblox_component ~= "" then
        v24.robloxComponent = v23.roblox_component;
    end;
    if v23.identifier ~= nil and v23.identifier ~= "" then
        v24.identifier = v23.identifier;
    end;
    if v23.title ~= nil and v23.title ~= "" then
        v24.title = v23.title;
    end;
    return v24;
end;
v3.jsonDecode = function(v25) --[[ Line: 146 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v26 = v3.new();
    if v25.roblox_component ~= nil then
        v26.roblox_component = v25.roblox_component;
    end;
    if v25.robloxComponent ~= nil then
        v26.roblox_component = v25.robloxComponent;
    end;
    if v25.identifier ~= nil then
        v26.identifier = v25.identifier;
    end;
    if v25.title ~= nil then
        v26.title = v25.title;
    end;
    return v26;
end;
v3.descriptor = {
    name = "PageEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PageEntry"
};
v2.PageEntry = v3;
v1.default:register(v2.PageEntry);
return {
    PageEntry = v2.PageEntry
};