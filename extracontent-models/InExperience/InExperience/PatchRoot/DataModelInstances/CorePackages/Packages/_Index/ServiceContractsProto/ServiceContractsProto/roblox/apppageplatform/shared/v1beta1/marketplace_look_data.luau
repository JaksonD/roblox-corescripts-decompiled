local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and "" or v4.id
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 45 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    local v10 = buffer.create(v7);
    buffer.copy(v10, 0, v6, 0, v7);
    return v10;
end;
v3.decode = function(v11) --[[ Line: 59 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v12 = v3.new();
    local v13 = 0;
    while v13 < buffer.len(v11) do
        local v14 = nil;
        local v15 = nil;
        local v16, v17, v18 = v0.readTag(v11, v13);
        v14 = v16;
        v15 = v17;
        v13 = v18;
        if v15 == v0.wireTypes.varint then
            v16 = nil;
            v17, v18 = v0.readVarInt(v11, v13);
            v16 = v17;
            v13 = v18;
        elseif v15 == v0.wireTypes.lengthDelimited then
            if v14 == 1 then
                v16 = nil;
                v17, v18 = v0.readBuffer(v11, v13);
                v16 = v17;
                v13 = v18;
                v12.id = buffer.tostring(v16);
            else
                v16 = nil;
                v17, v18 = v0.readVarInt(v11, v13);
                v13 = v18 + v17;
            end;
        elseif v15 == v0.wireTypes.i32 then
            v16 = nil;
            v17, v18 = v0.readFixed32(v11, v13);
            v16 = v17;
            v13 = v18;
        elseif v15 == v0.wireTypes.i64 then
            v16 = nil;
            v17, v18 = v0.readFixed64(v11, v13);
            v16 = v17;
            v13 = v18;
        else
            error("Unsupported wire type: " .. v15);
        end;
    end;
    return v12;
end;
v3.jsonEncode = function(v19) --[[ Line: 102 ]] --[[ Name: jsonEncode ]]
    local v20 = {};
    if v19.id ~= nil and v19.id ~= "" then
        v20.id = v19.id;
    end;
    return v20;
end;
v3.jsonDecode = function(v21) --[[ Line: 112 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v22 = v3.new();
    if v21.id ~= nil then
        v22.id = v21.id;
    end;
    return v22;
end;
v3.descriptor = {
    name = "MarketplaceLookData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookData"
};
v2.MarketplaceLookData = v3;
v1.default:register(v2.MarketplaceLookData);
return {
    MarketplaceLookData = v2.MarketplaceLookData
};