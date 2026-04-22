local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = {};
v4.__index = v4;
local l_v4_0 = v4 --[[ copy: 4 -> 5 ]];
v4.new = function(v6) --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: l_v4_0 (copy)
    return (setmetatable({
        kind = if not (v6 ~= nil) or v6.kind == nil then nil else v6.kind
    }, l_v4_0));
end;
v4.encode = function(v7) --[[ Line: 108 ]] --[[ Name: encode ]]
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
v4.decode = function(v14) --[[ Line: 125 ]] --[[ Name: decode ]]
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
v4.jsonEncode = function(v22) --[[ Line: 171 ]] --[[ Name: jsonEncode ]]
    local v23 = {};
    if v22.kind ~= nil and v22.kind.type == "literal" then
        v23.literal = v22.kind.value:jsonEncode();
    end;
    return v23;
end;
v4.jsonDecode = function(v24) --[[ Line: 183 ]] --[[ Name: jsonDecode ]]
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
local l_v4_1 = v4 --[[ copy: 4 -> 6 ]];
v4.new = function(v27) --[[ Line: 211 ]] --[[ Name: new ]]
    -- upvalues: l_v4_1 (copy)
    return (setmetatable({
        url = if not (v27 ~= nil) or v27.url == nil then nil else v27.url, 
        share_url_context = if not (v27 ~= nil) or v27.share_url_context == nil then nil else v27.share_url_context
    }, l_v4_1));
end;
v4.encode = function(v28) --[[ Line: 225 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v29 = buffer.create(0);
    local v30 = 0;
    if v28.url ~= nil then
        local v31 = v28.url:encode();
        local v32, v33 = v0.writeTag(v29, v30, 1, v0.wireTypes.lengthDelimited);
        v32, v33 = v0.writeBuffer(v32, v33, v31, buffer.len(v31));
        v29 = v32;
        v30 = v33;
    end;
    if v28.share_url_context ~= nil then
        local v34 = v28.share_url_context:encode();
        local v35, v36 = v0.writeTag(v29, v30, 2, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v29 = v35;
        v30 = v36;
    end;
    local v37 = buffer.create(v30);
    buffer.copy(v37, 0, v29, 0, v30);
    return v37;
end;
v4.decode = function(v38) --[[ Line: 248 ]] --[[ Name: decode ]]
    -- upvalues: l_v4_1 (copy), v0 (copy), v3 (copy)
    local v39 = l_v4_1.new();
    local v40 = 0;
    while v40 < buffer.len(v38) do
        local v41 = nil;
        local v42 = nil;
        local v43, v44, v45 = v0.readTag(v38, v40);
        v41 = v43;
        v42 = v44;
        v40 = v45;
        if v42 == v0.wireTypes.varint then
            v43 = nil;
            v44, v45 = v0.readVarInt(v38, v40);
            v43 = v44;
            v40 = v45;
        elseif v42 == v0.wireTypes.lengthDelimited then
            if v41 == 1 then
                v43 = nil;
                v44, v45 = v0.readBuffer(v38, v40);
                v43 = v44;
                v40 = v45;
                v39.url = v3.StringProp.decode(v43);
            elseif v41 == 2 then
                v43 = nil;
                v44, v45 = v0.readBuffer(v38, v40);
                v43 = v44;
                v40 = v45;
                v39.share_url_context = v3.StringProp.decode(v43);
            else
                v43 = nil;
                v44, v45 = v0.readVarInt(v38, v40);
                v40 = v45 + v44;
            end;
        elseif v42 == v0.wireTypes.i32 then
            v43 = nil;
            v44, v45 = v0.readFixed32(v38, v40);
            v43 = v44;
            v40 = v45;
        elseif v42 == v0.wireTypes.i64 then
            v43 = nil;
            v44, v45 = v0.readFixed64(v38, v40);
            v43 = v44;
            v40 = v45;
        else
            error("Unsupported wire type: " .. v42);
        end;
    end;
    return v39;
end;
v4.jsonEncode = function(v46) --[[ Line: 298 ]] --[[ Name: jsonEncode ]]
    local v47 = {};
    if v46.url ~= nil then
        v47.url = v46.url:jsonEncode();
    end;
    if v46.share_url_context ~= nil then
        v47.shareUrlContext = v46.share_url_context:jsonEncode();
    end;
    return v47;
end;
v4.jsonDecode = function(v48) --[[ Line: 314 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v4_1 (copy), v3 (copy)
    local v49 = l_v4_1.new();
    if v48.url ~= nil then
        v49.url = v3.StringProp.jsonDecode(v48.url);
    end;
    if v48.share_url_context ~= nil then
        v49.share_url_context = v3.StringProp.jsonDecode(v48.share_url_context);
    end;
    if v48.shareUrlContext ~= nil then
        v49.share_url_context = v3.StringProp.jsonDecode(v48.shareUrlContext);
    end;
    return v49;
end;
v4.descriptor = {
    name = "GenericShareLinkData_GenericShareLinkLiteralData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
};
v2.GenericShareLinkData_GenericShareLinkLiteralData = v4;
v1.default:register(v2.GenericShareLinkData_GenericShareLinkLiteralData);
v4 = {};
v4.__index = v4;
v4.new = function(v50) --[[ Line: 351 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        share_url_context = if not (v50 ~= nil) or v50.share_url_context == nil then nil else v50.share_url_context, 
        link_type = if not (v50 ~= nil) or v50.link_type == nil then nil else v50.link_type, 
        link_data = if not (v50 ~= nil) or v50.link_data == nil then nil else v50.link_data
    }, v4));
end;
v4.encode = function(v51) --[[ Line: 359 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v52 = buffer.create(0);
    local v53 = 0;
    if v51.share_url_context ~= nil then
        local v54 = v51.share_url_context:encode();
        local v55, v56 = v0.writeTag(v52, v53, 1, v0.wireTypes.lengthDelimited);
        v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
        v52 = v55;
        v53 = v56;
    end;
    if v51.link_type ~= nil then
        local v57 = v51.link_type:encode();
        local v58, v59 = v0.writeTag(v52, v53, 2, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
        v52 = v58;
        v53 = v59;
    end;
    if v51.link_data ~= nil then
        local v60 = v51.link_data:encode();
        local v61, v62 = v0.writeTag(v52, v53, 3, v0.wireTypes.lengthDelimited);
        v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
        v52 = v61;
        v53 = v62;
    end;
    local v63 = buffer.create(v53);
    buffer.copy(v63, 0, v52, 0, v53);
    return v63;
end;
v4.decode = function(v64) --[[ Line: 386 ]] --[[ Name: decode ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    local v65 = v4.new();
    local v66 = 0;
    while v66 < buffer.len(v64) do
        local v67 = nil;
        local v68 = nil;
        local v69, v70, v71 = v0.readTag(v64, v66);
        v67 = v69;
        v68 = v70;
        v66 = v71;
        if v68 == v0.wireTypes.varint then
            v69 = nil;
            v70, v71 = v0.readVarInt(v64, v66);
            v69 = v70;
            v66 = v71;
        elseif v68 == v0.wireTypes.lengthDelimited then
            if v67 == 1 then
                v69 = nil;
                v70, v71 = v0.readBuffer(v64, v66);
                v69 = v70;
                v66 = v71;
                v65.share_url_context = v3.StringProp.decode(v69);
            elseif v67 == 2 then
                v69 = nil;
                v70, v71 = v0.readBuffer(v64, v66);
                v69 = v70;
                v66 = v71;
                v65.link_type = v3.StringProp.decode(v69);
            elseif v67 == 3 then
                v69 = nil;
                v70, v71 = v0.readBuffer(v64, v66);
                v69 = v70;
                v66 = v71;
                v65.link_data = v3.StructProp.decode(v69);
            else
                v69 = nil;
                v70, v71 = v0.readVarInt(v64, v66);
                v66 = v71 + v70;
            end;
        elseif v68 == v0.wireTypes.i32 then
            v69 = nil;
            v70, v71 = v0.readFixed32(v64, v66);
            v69 = v70;
            v66 = v71;
        elseif v68 == v0.wireTypes.i64 then
            v69 = nil;
            v70, v71 = v0.readFixed64(v64, v66);
            v69 = v70;
            v66 = v71;
        else
            error("Unsupported wire type: " .. v68);
        end;
    end;
    return v65;
end;
v4.jsonEncode = function(v72) --[[ Line: 439 ]] --[[ Name: jsonEncode ]]
    local v73 = {};
    if v72.share_url_context ~= nil then
        v73.shareUrlContext = v72.share_url_context:jsonEncode();
    end;
    if v72.link_type ~= nil then
        v73.linkType = v72.link_type:jsonEncode();
    end;
    if v72.link_data ~= nil then
        v73.linkData = v72.link_data:jsonEncode();
    end;
    return v73;
end;
v4.jsonDecode = function(v74) --[[ Line: 457 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v75 = v4.new();
    if v74.share_url_context ~= nil then
        v75.share_url_context = v3.StringProp.jsonDecode(v74.share_url_context);
    end;
    if v74.shareUrlContext ~= nil then
        v75.share_url_context = v3.StringProp.jsonDecode(v74.shareUrlContext);
    end;
    if v74.link_type ~= nil then
        v75.link_type = v3.StringProp.jsonDecode(v74.link_type);
    end;
    if v74.linkType ~= nil then
        v75.link_type = v3.StringProp.jsonDecode(v74.linkType);
    end;
    if v74.link_data ~= nil then
        v75.link_data = v3.StructProp.jsonDecode(v74.link_data);
    end;
    if v74.linkData ~= nil then
        v75.link_data = v3.StructProp.jsonDecode(v74.linkData);
    end;
    return v75;
end;
v4.descriptor = {
    name = "ShareLinkFetchData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchData"
};
v2.ShareLinkFetchData = v4;
v1.default:register(v2.ShareLinkFetchData);
return {
    GenericShareLinkData = v2.GenericShareLinkData, 
    GenericShareLinkData_GenericShareLinkLiteralData = v2.GenericShareLinkData_GenericShareLinkLiteralData, 
    ShareLinkFetchData = v2.ShareLinkFetchData
};