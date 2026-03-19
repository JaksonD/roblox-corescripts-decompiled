local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        kind = if not (v6 ~= nil) or v6.kind == nil then nil else v6.kind
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 82 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.kind ~= nil and v7.kind.type == "literal" then
        local v10 = v7.kind.value:encode();
        local v11, v12 = v0.writeTag(v8, v9, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeBuffer(v11, v12, v10, buffer.len(v10));
        v8 = v11;
        v9 = v12;
    end;
    local v13 = buffer.create(v9);
    buffer.copy(v13, 0, v8, 0, v9);
    return v13;
end;
v4.decode = function(v14) --[[ Line: 99 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_0 (copy), v0 (copy), v2 (copy)
    local v15 = l_v4_0.new();
    local v16 = 0;
    while v16 < buffer.len(v14) do
        local v17 = nil;
        local v18 = nil;
        local v19, v20, v21 = v0.readTag(v14, v16);
        v17 = v19;
        v18 = v20;
        v16 = v21;
        if v18 == v0.wireTypes.varint then
            v19 = nil;
            v20, v21 = v0.readVarInt(v14, v16);
            v19 = v20;
            v16 = v21;
        elseif v18 == v0.wireTypes.lengthDelimited then
            if v17 == 1 then
                v19 = nil;
                v20, v21 = v0.readBuffer(v14, v16);
                v19 = v20;
                v16 = v21;
                v15.kind = {
                    type = "literal", 
                    value = v2.GenericShareLinkData_GenericShareLinkLiteralData.decode(v19)
                };
            else
                v19 = nil;
                v20, v21 = v0.readVarInt(v14, v16);
                v16 = v21 + v20;
            end;
        elseif v18 == v0.wireTypes.i32 then
            v19 = nil;
            v20, v21 = v0.readFixed32(v14, v16);
            v19 = v20;
            v16 = v21;
        elseif v18 == v0.wireTypes.i64 then
            v19 = nil;
            v20, v21 = v0.readFixed64(v14, v16);
            v19 = v20;
            v16 = v21;
        else
            error("Unsupported wire type: " .. v18);
        end;
    end;
    return v15;
end;
v4.jsonEncode = function(v22) --[[ Line: 145 ]] --[[ Name: jsonEncode ]]
    local v23 = {};
    if v22.kind ~= nil and v22.kind.type == "literal" then
        v23.literal = v22.kind.value:jsonEncode();
    end;
    return v23;
end;
v4.jsonDecode = function(v24) --[[ Line: 157 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_0 (copy), v2 (copy)
    local v25 = l_v4_0.new();
    if v24.literal ~= nil then
        v25.kind = {
            type = "literal", 
            value = v2.GenericShareLinkData_GenericShareLinkLiteralData.jsonDecode(v24.literal)
        };
    end;
    return v25;
end;
v4.descriptor = {
    name = "GenericShareLinkData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkData"
};
v2.GenericShareLinkData = v4;
v1.default:register(v2.GenericShareLinkData);
v4 = {};
v4.__index = v4;
v4.new = function(v26) --[[ Line: 185 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        url = if not (v26 ~= nil) or v26.url == nil then nil else v26.url, 
        share_url_context = if not (v26 ~= nil) or v26.share_url_context == nil then nil else v26.share_url_context
    }, v4));
end;
v4.encode = function(v27) --[[ Line: 199 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v28 = buffer.create(0);
    local v29 = 0;
    if v27.url ~= nil then
        local v30 = v27.url:encode();
        local v31, v32 = v0.writeTag(v28, v29, 1, v0.wireTypes.lengthDelimited);
        v31, v32 = v0.writeBuffer(v31, v32, v30, buffer.len(v30));
        v28 = v31;
        v29 = v32;
    end;
    if v27.share_url_context ~= nil then
        local v33 = v27.share_url_context:encode();
        local v34, v35 = v0.writeTag(v28, v29, 2, v0.wireTypes.lengthDelimited);
        v34, v35 = v0.writeBuffer(v34, v35, v33, buffer.len(v33));
        v28 = v34;
        v29 = v35;
    end;
    local v36 = buffer.create(v29);
    buffer.copy(v36, 0, v28, 0, v29);
    return v36;
end;
v4.decode = function(v37) --[[ Line: 222 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    local v38 = v4.new();
    local v39 = 0;
    while v39 < buffer.len(v37) do
        local v40 = nil;
        local v41 = nil;
        local v42, v43, v44 = v0.readTag(v37, v39);
        v40 = v42;
        v41 = v43;
        v39 = v44;
        if v41 == v0.wireTypes.varint then
            v42 = nil;
            v43, v44 = v0.readVarInt(v37, v39);
            v42 = v43;
            v39 = v44;
        elseif v41 == v0.wireTypes.lengthDelimited then
            if v40 == 1 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.url = v3.StringProp.decode(v42);
            elseif v40 == 2 then
                v42 = nil;
                v43, v44 = v0.readBuffer(v37, v39);
                v42 = v43;
                v39 = v44;
                v38.share_url_context = v3.StringProp.decode(v42);
            else
                v42 = nil;
                v43, v44 = v0.readVarInt(v37, v39);
                v39 = v44 + v43;
            end;
        elseif v41 == v0.wireTypes.i32 then
            v42 = nil;
            v43, v44 = v0.readFixed32(v37, v39);
            v42 = v43;
            v39 = v44;
        elseif v41 == v0.wireTypes.i64 then
            v42 = nil;
            v43, v44 = v0.readFixed64(v37, v39);
            v42 = v43;
            v39 = v44;
        else
            error("Unsupported wire type: " .. v41);
        end;
    end;
    return v38;
end;
v4.jsonEncode = function(v45) --[[ Line: 272 ]] --[[ Name: jsonEncode ]]
    local v46 = {};
    if v45.url ~= nil then
        v46.url = v45.url:jsonEncode();
    end;
    if v45.share_url_context ~= nil then
        v46.shareUrlContext = v45.share_url_context:jsonEncode();
    end;
    return v46;
end;
v4.jsonDecode = function(v47) --[[ Line: 288 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v48 = v4.new();
    if v47.url ~= nil then
        v48.url = v3.StringProp.jsonDecode(v47.url);
    end;
    if v47.share_url_context ~= nil then
        v48.share_url_context = v3.StringProp.jsonDecode(v47.share_url_context);
    end;
    if v47.shareUrlContext ~= nil then
        v48.share_url_context = v3.StringProp.jsonDecode(v47.shareUrlContext);
    end;
    return v48;
end;
v4.descriptor = {
    name = "GenericShareLinkData_GenericShareLinkLiteralData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
};
v2.GenericShareLinkData_GenericShareLinkLiteralData = v4;
v1.default:register(v2.GenericShareLinkData_GenericShareLinkLiteralData);
return {
    GenericShareLinkData = v2.GenericShareLinkData, 
    GenericShareLinkData_GenericShareLinkLiteralData = v2.GenericShareLinkData_GenericShareLinkLiteralData
};