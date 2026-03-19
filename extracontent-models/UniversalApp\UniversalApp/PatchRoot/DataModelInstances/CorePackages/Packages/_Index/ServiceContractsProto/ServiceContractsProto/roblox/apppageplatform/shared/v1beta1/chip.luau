local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 98 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 119 ]] --[[ Name: decode ]]
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
                v20.props = v2.ChipSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 167 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 181 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.ChipSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "ChipSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ChipSchema"
};
v2.ChipSchema = v6;
v1.default:register(v2.ChipSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 210 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        text = if not (v31 ~= nil) or v31.text == nil then nil else v31.text, 
        leading_icon_name = if not (v31 ~= nil) or v31.leading_icon_name == nil then nil else v31.leading_icon_name, 
        leading_icon_variant = if not (v31 ~= nil) or v31.leading_icon_variant == nil then nil else v31.leading_icon_variant, 
        leading_is_circular = if not (v31 ~= nil) or v31.leading_is_circular == nil then nil else v31.leading_is_circular, 
        trailing_icon_name = if not (v31 ~= nil) or v31.trailing_icon_name == nil then nil else v31.trailing_icon_name, 
        trailing_icon_variant = if not (v31 ~= nil) or v31.trailing_icon_variant == nil then nil else v31.trailing_icon_variant, 
        trailing_is_circular = if not (v31 ~= nil) or v31.trailing_is_circular == nil then nil else v31.trailing_is_circular, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        is_checked = if not (v31 ~= nil) or v31.is_checked == nil then nil else v31.is_checked, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 236 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.text ~= nil then
        local v35 = v32.text:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.leading_icon_name ~= nil then
        local v38 = v32.leading_icon_name:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.leading_icon_variant ~= nil then
        local v41 = v32.leading_icon_variant:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.leading_is_circular ~= nil then
        local v44 = v32.leading_is_circular:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.trailing_icon_name ~= nil then
        local v47 = v32.trailing_icon_name:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.trailing_icon_variant ~= nil then
        local v50 = v32.trailing_icon_variant:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.trailing_is_circular ~= nil then
        local v53 = v32.trailing_is_circular:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.on_activated ~= nil then
        local v56 = v32.on_activated:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.is_checked ~= nil then
        local v59 = v32.is_checked:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.layout_order ~= nil then
        local v62 = v32.layout_order:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.anchor_point ~= nil then
        local v65 = v32.anchor_point:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.position ~= nil then
        local v68 = v32.position:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.size ~= nil then
        local v71 = v32.size:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    local v74 = buffer.create(v34);
    buffer.copy(v74, 0, v33, 0, v34);
    return v74;
end;
v6.decode = function(v75) --[[ Line: 323 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v76 = v6.new();
    local v77 = 0;
    while v77 < buffer.len(v75) do
        local v78 = nil;
        local v79 = nil;
        local v80, v81, v82 = v0.readTag(v75, v77);
        v78 = v80;
        v79 = v81;
        v77 = v82;
        if v79 == v0.wireTypes.varint then
            v80 = nil;
            v81, v82 = v0.readVarInt(v75, v77);
            v80 = v81;
            v77 = v82;
        elseif v79 == v0.wireTypes.lengthDelimited then
            if v78 == 1 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.text = v3.StringProp.decode(v80);
            elseif v78 == 2 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.leading_icon_name = v3.StringProp.decode(v80);
            elseif v78 == 3 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.leading_icon_variant = v3.StringProp.decode(v80);
            elseif v78 == 4 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.leading_is_circular = v3.BoolProp.decode(v80);
            elseif v78 == 5 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.trailing_icon_name = v3.StringProp.decode(v80);
            elseif v78 == 6 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.trailing_icon_variant = v3.StringProp.decode(v80);
            elseif v78 == 7 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.trailing_is_circular = v3.BoolProp.decode(v80);
            elseif v78 == 8 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.on_activated = v4.ActionProp.decode(v80);
            elseif v78 == 9 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.is_checked = v3.BoolProp.decode(v80);
            elseif v78 == 10 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.layout_order = v3.Int32Prop.decode(v80);
            elseif v78 == 11 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.anchor_point = v3.Vector2Prop.decode(v80);
            elseif v78 == 12 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.position = v3.UDim2Prop.decode(v80);
            elseif v78 == 13 then
                v80 = nil;
                v81, v82 = v0.readBuffer(v75, v77);
                v80 = v81;
                v77 = v82;
                v76.size = v3.UDim2Prop.decode(v80);
            else
                v80 = nil;
                v81, v82 = v0.readVarInt(v75, v77);
                v77 = v82 + v81;
            end;
        elseif v79 == v0.wireTypes.i32 then
            v80 = nil;
            v81, v82 = v0.readFixed32(v75, v77);
            v80 = v81;
            v77 = v82;
        elseif v79 == v0.wireTypes.i64 then
            v80 = nil;
            v81, v82 = v0.readFixed64(v75, v77);
            v80 = v81;
            v77 = v82;
        else
            error("Unsupported wire type: " .. v79);
        end;
    end;
    return v76;
end;
v6.jsonEncode = function(v83) --[[ Line: 428 ]] --[[ Name: jsonEncode ]]
    local v84 = {};
    if v83.text ~= nil then
        v84.text = v83.text:jsonEncode();
    end;
    if v83.leading_icon_name ~= nil then
        v84.leadingIconName = v83.leading_icon_name:jsonEncode();
    end;
    if v83.leading_icon_variant ~= nil then
        v84.leadingIconVariant = v83.leading_icon_variant:jsonEncode();
    end;
    if v83.leading_is_circular ~= nil then
        v84.leadingIsCircular = v83.leading_is_circular:jsonEncode();
    end;
    if v83.trailing_icon_name ~= nil then
        v84.trailingIconName = v83.trailing_icon_name:jsonEncode();
    end;
    if v83.trailing_icon_variant ~= nil then
        v84.trailingIconVariant = v83.trailing_icon_variant:jsonEncode();
    end;
    if v83.trailing_is_circular ~= nil then
        v84.trailingIsCircular = v83.trailing_is_circular:jsonEncode();
    end;
    if v83.on_activated ~= nil then
        v84.onActivated = v83.on_activated:jsonEncode();
    end;
    if v83.is_checked ~= nil then
        v84.isChecked = v83.is_checked:jsonEncode();
    end;
    if v83.layout_order ~= nil then
        v84.layoutOrder = v83.layout_order:jsonEncode();
    end;
    if v83.anchor_point ~= nil then
        v84.anchorPoint = v83.anchor_point:jsonEncode();
    end;
    if v83.position ~= nil then
        v84.position = v83.position:jsonEncode();
    end;
    if v83.size ~= nil then
        v84.size = v83.size:jsonEncode();
    end;
    return v84;
end;
v6.jsonDecode = function(v85) --[[ Line: 486 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v86 = v6.new();
    if v85.text ~= nil then
        v86.text = v3.StringProp.jsonDecode(v85.text);
    end;
    if v85.leading_icon_name ~= nil then
        v86.leading_icon_name = v3.StringProp.jsonDecode(v85.leading_icon_name);
    end;
    if v85.leadingIconName ~= nil then
        v86.leading_icon_name = v3.StringProp.jsonDecode(v85.leadingIconName);
    end;
    if v85.leading_icon_variant ~= nil then
        v86.leading_icon_variant = v3.StringProp.jsonDecode(v85.leading_icon_variant);
    end;
    if v85.leadingIconVariant ~= nil then
        v86.leading_icon_variant = v3.StringProp.jsonDecode(v85.leadingIconVariant);
    end;
    if v85.leading_is_circular ~= nil then
        v86.leading_is_circular = v3.BoolProp.jsonDecode(v85.leading_is_circular);
    end;
    if v85.leadingIsCircular ~= nil then
        v86.leading_is_circular = v3.BoolProp.jsonDecode(v85.leadingIsCircular);
    end;
    if v85.trailing_icon_name ~= nil then
        v86.trailing_icon_name = v3.StringProp.jsonDecode(v85.trailing_icon_name);
    end;
    if v85.trailingIconName ~= nil then
        v86.trailing_icon_name = v3.StringProp.jsonDecode(v85.trailingIconName);
    end;
    if v85.trailing_icon_variant ~= nil then
        v86.trailing_icon_variant = v3.StringProp.jsonDecode(v85.trailing_icon_variant);
    end;
    if v85.trailingIconVariant ~= nil then
        v86.trailing_icon_variant = v3.StringProp.jsonDecode(v85.trailingIconVariant);
    end;
    if v85.trailing_is_circular ~= nil then
        v86.trailing_is_circular = v3.BoolProp.jsonDecode(v85.trailing_is_circular);
    end;
    if v85.trailingIsCircular ~= nil then
        v86.trailing_is_circular = v3.BoolProp.jsonDecode(v85.trailingIsCircular);
    end;
    if v85.on_activated ~= nil then
        v86.on_activated = v4.ActionProp.jsonDecode(v85.on_activated);
    end;
    if v85.onActivated ~= nil then
        v86.on_activated = v4.ActionProp.jsonDecode(v85.onActivated);
    end;
    if v85.is_checked ~= nil then
        v86.is_checked = v3.BoolProp.jsonDecode(v85.is_checked);
    end;
    if v85.isChecked ~= nil then
        v86.is_checked = v3.BoolProp.jsonDecode(v85.isChecked);
    end;
    if v85.layout_order ~= nil then
        v86.layout_order = v3.Int32Prop.jsonDecode(v85.layout_order);
    end;
    if v85.layoutOrder ~= nil then
        v86.layout_order = v3.Int32Prop.jsonDecode(v85.layoutOrder);
    end;
    if v85.anchor_point ~= nil then
        v86.anchor_point = v3.Vector2Prop.jsonDecode(v85.anchor_point);
    end;
    if v85.anchorPoint ~= nil then
        v86.anchor_point = v3.Vector2Prop.jsonDecode(v85.anchorPoint);
    end;
    if v85.position ~= nil then
        v86.position = v3.UDim2Prop.jsonDecode(v85.position);
    end;
    if v85.size ~= nil then
        v86.size = v3.UDim2Prop.jsonDecode(v85.size);
    end;
    return v86;
end;
v6.descriptor = {
    name = "ChipSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.ChipSchema_Props = v6;
v1.default:register(v2.ChipSchema_Props);
return {
    ChipSchema = v2.ChipSchema, 
    ChipSchema_Props = v2.ChipSchema_Props
};