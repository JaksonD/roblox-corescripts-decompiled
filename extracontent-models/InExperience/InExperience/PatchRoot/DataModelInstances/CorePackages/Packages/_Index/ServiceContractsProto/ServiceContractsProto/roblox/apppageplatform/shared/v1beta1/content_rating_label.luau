local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 93 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.props ~= nil then
        local v12 = v9.props:encode();
        local v13, v14 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
        v13, v14 = v0.writeBuffer(v13, v14, v12, buffer.len(v12));
        v10 = v13;
        v11 = v14;
    end;
    if v9.shared ~= nil then
        local v15 = v9.shared:encode();
        local v16, v17 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeBuffer(v16, v17, v15, buffer.len(v15));
        v10 = v16;
        v11 = v17;
    end;
    local v18 = buffer.create(v11);
    buffer.copy(v18, 0, v10, 0, v11);
    return v18;
end;
v6.decode = function(v19) --[[ Line: 114 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy), v2 (copy), v5 (copy)
    local v20 = l_v6_0.new();
    local v21 = 0;
    while v21 < buffer.len(v19) do
        local v22 = nil;
        local v23 = nil;
        local v24, v25, v26 = v0.readTag(v19, v21);
        v22 = v24;
        v23 = v25;
        v21 = v26;
        if v23 == v0.wireTypes.varint then
            v24 = nil;
            v25, v26 = v0.readVarInt(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.lengthDelimited then
            if v22 == 1 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.props = v2.ContentRatingLabelSchema_Props.decode(v24);
            elseif v22 == 2 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.shared = v5.ComponentShared.decode(v24);
            else
                v24 = nil;
                v25, v26 = v0.readVarInt(v19, v21);
                v21 = v26 + v25;
            end;
        elseif v23 == v0.wireTypes.i32 then
            v24 = nil;
            v25, v26 = v0.readFixed32(v19, v21);
            v24 = v25;
            v21 = v26;
        elseif v23 == v0.wireTypes.i64 then
            v24 = nil;
            v25, v26 = v0.readFixed64(v19, v21);
            v24 = v25;
            v21 = v26;
        else
            error("Unsupported wire type: " .. v23);
        end;
    end;
    return v20;
end;
v6.jsonEncode = function(v27) --[[ Line: 162 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 176 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.ContentRatingLabelSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "ContentRatingLabelSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ContentRatingLabelSchema"
};
v2.ContentRatingLabelSchema = v6;
v1.default:register(v2.ContentRatingLabelSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 205 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        rating = if not (v31 ~= nil) or v31.rating == nil then nil else v31.rating, 
        display_text = if not (v31 ~= nil) or v31.display_text == nil then nil else v31.display_text, 
        font_style = if not (v31 ~= nil) or v31.font_style == nil then nil else v31.font_style, 
        width = if not (v31 ~= nil) or v31.width == nil then nil else v31.width, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 218 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.rating ~= nil then
        local v35 = v32.rating:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.display_text ~= nil then
        local v38 = v32.display_text:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.font_style ~= nil then
        local v41 = v32.font_style:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.width ~= nil then
        local v44 = v32.width:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.on_activated ~= nil then
        local v47 = v32.on_activated:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.layout_order ~= nil then
        local v50 = v32.layout_order:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    local v53 = buffer.create(v34);
    buffer.copy(v53, 0, v33, 0, v34);
    return v53;
end;
v6.decode = function(v54) --[[ Line: 263 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v55 = v6.new();
    local v56 = 0;
    while v56 < buffer.len(v54) do
        local v57 = nil;
        local v58 = nil;
        local v59, v60, v61 = v0.readTag(v54, v56);
        v57 = v59;
        v58 = v60;
        v56 = v61;
        if v58 == v0.wireTypes.varint then
            v59 = nil;
            v60, v61 = v0.readVarInt(v54, v56);
            v59 = v60;
            v56 = v61;
        elseif v58 == v0.wireTypes.lengthDelimited then
            if v57 == 1 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.rating = v3.StringProp.decode(v59);
            elseif v57 == 2 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.display_text = v3.StringProp.decode(v59);
            elseif v57 == 3 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.font_style = v3.TypographyProp.decode(v59);
            elseif v57 == 4 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.width = v3.Int32Prop.decode(v59);
            elseif v57 == 5 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.on_activated = v4.ActionProp.decode(v59);
            elseif v57 == 6 then
                v59 = nil;
                v60, v61 = v0.readBuffer(v54, v56);
                v59 = v60;
                v56 = v61;
                v55.layout_order = v3.Int32Prop.decode(v59);
            else
                v59 = nil;
                v60, v61 = v0.readVarInt(v54, v56);
                v56 = v61 + v60;
            end;
        elseif v58 == v0.wireTypes.i32 then
            v59 = nil;
            v60, v61 = v0.readFixed32(v54, v56);
            v59 = v60;
            v56 = v61;
        elseif v58 == v0.wireTypes.i64 then
            v59 = nil;
            v60, v61 = v0.readFixed64(v54, v56);
            v59 = v60;
            v56 = v61;
        else
            error("Unsupported wire type: " .. v58);
        end;
    end;
    return v55;
end;
v6.jsonEncode = function(v62) --[[ Line: 331 ]] --[[ Name: jsonEncode ]]
    local v63 = {};
    if v62.rating ~= nil then
        v63.rating = v62.rating:jsonEncode();
    end;
    if v62.display_text ~= nil then
        v63.displayText = v62.display_text:jsonEncode();
    end;
    if v62.font_style ~= nil then
        v63.fontStyle = v62.font_style:jsonEncode();
    end;
    if v62.width ~= nil then
        v63.width = v62.width:jsonEncode();
    end;
    if v62.on_activated ~= nil then
        v63.onActivated = v62.on_activated:jsonEncode();
    end;
    if v62.layout_order ~= nil then
        v63.layoutOrder = v62.layout_order:jsonEncode();
    end;
    return v63;
end;
v6.jsonDecode = function(v64) --[[ Line: 361 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v65 = v6.new();
    if v64.rating ~= nil then
        v65.rating = v3.StringProp.jsonDecode(v64.rating);
    end;
    if v64.display_text ~= nil then
        v65.display_text = v3.StringProp.jsonDecode(v64.display_text);
    end;
    if v64.displayText ~= nil then
        v65.display_text = v3.StringProp.jsonDecode(v64.displayText);
    end;
    if v64.font_style ~= nil then
        v65.font_style = v3.TypographyProp.jsonDecode(v64.font_style);
    end;
    if v64.fontStyle ~= nil then
        v65.font_style = v3.TypographyProp.jsonDecode(v64.fontStyle);
    end;
    if v64.width ~= nil then
        v65.width = v3.Int32Prop.jsonDecode(v64.width);
    end;
    if v64.on_activated ~= nil then
        v65.on_activated = v4.ActionProp.jsonDecode(v64.on_activated);
    end;
    if v64.onActivated ~= nil then
        v65.on_activated = v4.ActionProp.jsonDecode(v64.onActivated);
    end;
    if v64.layout_order ~= nil then
        v65.layout_order = v3.Int32Prop.jsonDecode(v64.layout_order);
    end;
    if v64.layoutOrder ~= nil then
        v65.layout_order = v3.Int32Prop.jsonDecode(v64.layoutOrder);
    end;
    return v65;
end;
v6.descriptor = {
    name = "ContentRatingLabelSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.ContentRatingLabelSchema_Props = v6;
v1.default:register(v2.ContentRatingLabelSchema_Props);
return {
    ContentRatingLabelSchema = v2.ContentRatingLabelSchema, 
    ContentRatingLabelSchema_Props = v2.ContentRatingLabelSchema_Props
};