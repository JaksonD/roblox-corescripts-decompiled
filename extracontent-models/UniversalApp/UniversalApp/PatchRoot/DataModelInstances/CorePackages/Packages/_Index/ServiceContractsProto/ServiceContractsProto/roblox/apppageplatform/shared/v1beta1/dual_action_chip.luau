local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 109 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 130 ]] --[[ Name: decode ]]
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
                v20.props = v2.DualActionChipSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 178 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 192 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.DualActionChipSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "DualActionChipSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DualActionChipSchema"
};
v2.DualActionChipSchema = v6;
v1.default:register(v2.DualActionChipSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 221 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        text = if not (v31 ~= nil) or v31.text == nil then nil else v31.text, 
        leading_icon_name = if not (v31 ~= nil) or v31.leading_icon_name == nil then nil else v31.leading_icon_name, 
        leading_icon_variant = if not (v31 ~= nil) or v31.leading_icon_variant == nil then nil else v31.leading_icon_variant, 
        leading_is_circular = if not (v31 ~= nil) or v31.leading_is_circular == nil then nil else v31.leading_is_circular, 
        leading_on_activated = if not (v31 ~= nil) or v31.leading_on_activated == nil then nil else v31.leading_on_activated, 
        trailing_icon_name = if not (v31 ~= nil) or v31.trailing_icon_name == nil then nil else v31.trailing_icon_name, 
        trailing_icon_variant = if not (v31 ~= nil) or v31.trailing_icon_variant == nil then nil else v31.trailing_icon_variant, 
        trailing_is_circular = if not (v31 ~= nil) or v31.trailing_is_circular == nil then nil else v31.trailing_is_circular, 
        trailing_on_activated = if not (v31 ~= nil) or v31.trailing_on_activated == nil then nil else v31.trailing_on_activated, 
        test_id = if not (v31 ~= nil) or v31.test_id == nil then nil else v31.test_id, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 254 ]] --[[ Name: encode ]]
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
    if v32.leading_on_activated ~= nil then
        local v47 = v32.leading_on_activated:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.trailing_icon_name ~= nil then
        local v50 = v32.trailing_icon_name:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.trailing_icon_variant ~= nil then
        local v53 = v32.trailing_icon_variant:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.trailing_is_circular ~= nil then
        local v56 = v32.trailing_is_circular:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.trailing_on_activated ~= nil then
        local v59 = v32.trailing_on_activated:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.test_id ~= nil then
        local v62 = v32.test_id:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.layout_order ~= nil then
        local v65 = v32.layout_order:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.anchor_point ~= nil then
        local v68 = v32.anchor_point:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.position ~= nil then
        local v71 = v32.position:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.size ~= nil then
        local v74 = v32.size:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    local v77 = buffer.create(v34);
    buffer.copy(v77, 0, v33, 0, v34);
    return v77;
end;
v6.decode = function(v78) --[[ Line: 347 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v79 = v6.new();
    local v80 = 0;
    while v80 < buffer.len(v78) do
        local v81 = nil;
        local v82 = nil;
        local v83, v84, v85 = v0.readTag(v78, v80);
        v81 = v83;
        v82 = v84;
        v80 = v85;
        if v82 == v0.wireTypes.varint then
            v83 = nil;
            v84, v85 = v0.readVarInt(v78, v80);
            v83 = v84;
            v80 = v85;
        elseif v82 == v0.wireTypes.lengthDelimited then
            if v81 == 1 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.text = v3.StringProp.decode(v83);
            elseif v81 == 2 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.leading_icon_name = v3.IconProp.decode(v83);
            elseif v81 == 3 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.leading_icon_variant = v3.StringProp.decode(v83);
            elseif v81 == 4 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.leading_is_circular = v3.BoolProp.decode(v83);
            elseif v81 == 5 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.leading_on_activated = v4.ActionProp.decode(v83);
            elseif v81 == 6 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.trailing_icon_name = v3.IconProp.decode(v83);
            elseif v81 == 7 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.trailing_icon_variant = v3.StringProp.decode(v83);
            elseif v81 == 8 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.trailing_is_circular = v3.BoolProp.decode(v83);
            elseif v81 == 9 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.trailing_on_activated = v4.ActionProp.decode(v83);
            elseif v81 == 10 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.test_id = v3.StringProp.decode(v83);
            elseif v81 == 11 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.layout_order = v3.Int32Prop.decode(v83);
            elseif v81 == 12 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.anchor_point = v3.Vector2Prop.decode(v83);
            elseif v81 == 13 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.position = v3.UDim2Prop.decode(v83);
            elseif v81 == 14 then
                v83 = nil;
                v84, v85 = v0.readBuffer(v78, v80);
                v83 = v84;
                v80 = v85;
                v79.size = v3.UDim2Prop.decode(v83);
            else
                v83 = nil;
                v84, v85 = v0.readVarInt(v78, v80);
                v80 = v85 + v84;
            end;
        elseif v82 == v0.wireTypes.i32 then
            v83 = nil;
            v84, v85 = v0.readFixed32(v78, v80);
            v83 = v84;
            v80 = v85;
        elseif v82 == v0.wireTypes.i64 then
            v83 = nil;
            v84, v85 = v0.readFixed64(v78, v80);
            v83 = v84;
            v80 = v85;
        else
            error("Unsupported wire type: " .. v82);
        end;
    end;
    return v79;
end;
v6.jsonEncode = function(v86) --[[ Line: 457 ]] --[[ Name: jsonEncode ]]
    local v87 = {};
    if v86.text ~= nil then
        v87.text = v86.text:jsonEncode();
    end;
    if v86.leading_icon_name ~= nil then
        v87.leadingIconName = v86.leading_icon_name:jsonEncode();
    end;
    if v86.leading_icon_variant ~= nil then
        v87.leadingIconVariant = v86.leading_icon_variant:jsonEncode();
    end;
    if v86.leading_is_circular ~= nil then
        v87.leadingIsCircular = v86.leading_is_circular:jsonEncode();
    end;
    if v86.leading_on_activated ~= nil then
        v87.leadingOnActivated = v86.leading_on_activated:jsonEncode();
    end;
    if v86.trailing_icon_name ~= nil then
        v87.trailingIconName = v86.trailing_icon_name:jsonEncode();
    end;
    if v86.trailing_icon_variant ~= nil then
        v87.trailingIconVariant = v86.trailing_icon_variant:jsonEncode();
    end;
    if v86.trailing_is_circular ~= nil then
        v87.trailingIsCircular = v86.trailing_is_circular:jsonEncode();
    end;
    if v86.trailing_on_activated ~= nil then
        v87.trailingOnActivated = v86.trailing_on_activated:jsonEncode();
    end;
    if v86.test_id ~= nil then
        v87.testId = v86.test_id:jsonEncode();
    end;
    if v86.layout_order ~= nil then
        v87.layoutOrder = v86.layout_order:jsonEncode();
    end;
    if v86.anchor_point ~= nil then
        v87.anchorPoint = v86.anchor_point:jsonEncode();
    end;
    if v86.position ~= nil then
        v87.position = v86.position:jsonEncode();
    end;
    if v86.size ~= nil then
        v87.size = v86.size:jsonEncode();
    end;
    return v87;
end;
v6.jsonDecode = function(v88) --[[ Line: 519 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v89 = v6.new();
    if v88.text ~= nil then
        v89.text = v3.StringProp.jsonDecode(v88.text);
    end;
    if v88.leading_icon_name ~= nil then
        v89.leading_icon_name = v3.IconProp.jsonDecode(v88.leading_icon_name);
    end;
    if v88.leadingIconName ~= nil then
        v89.leading_icon_name = v3.IconProp.jsonDecode(v88.leadingIconName);
    end;
    if v88.leading_icon_variant ~= nil then
        v89.leading_icon_variant = v3.StringProp.jsonDecode(v88.leading_icon_variant);
    end;
    if v88.leadingIconVariant ~= nil then
        v89.leading_icon_variant = v3.StringProp.jsonDecode(v88.leadingIconVariant);
    end;
    if v88.leading_is_circular ~= nil then
        v89.leading_is_circular = v3.BoolProp.jsonDecode(v88.leading_is_circular);
    end;
    if v88.leadingIsCircular ~= nil then
        v89.leading_is_circular = v3.BoolProp.jsonDecode(v88.leadingIsCircular);
    end;
    if v88.leading_on_activated ~= nil then
        v89.leading_on_activated = v4.ActionProp.jsonDecode(v88.leading_on_activated);
    end;
    if v88.leadingOnActivated ~= nil then
        v89.leading_on_activated = v4.ActionProp.jsonDecode(v88.leadingOnActivated);
    end;
    if v88.trailing_icon_name ~= nil then
        v89.trailing_icon_name = v3.IconProp.jsonDecode(v88.trailing_icon_name);
    end;
    if v88.trailingIconName ~= nil then
        v89.trailing_icon_name = v3.IconProp.jsonDecode(v88.trailingIconName);
    end;
    if v88.trailing_icon_variant ~= nil then
        v89.trailing_icon_variant = v3.StringProp.jsonDecode(v88.trailing_icon_variant);
    end;
    if v88.trailingIconVariant ~= nil then
        v89.trailing_icon_variant = v3.StringProp.jsonDecode(v88.trailingIconVariant);
    end;
    if v88.trailing_is_circular ~= nil then
        v89.trailing_is_circular = v3.BoolProp.jsonDecode(v88.trailing_is_circular);
    end;
    if v88.trailingIsCircular ~= nil then
        v89.trailing_is_circular = v3.BoolProp.jsonDecode(v88.trailingIsCircular);
    end;
    if v88.trailing_on_activated ~= nil then
        v89.trailing_on_activated = v4.ActionProp.jsonDecode(v88.trailing_on_activated);
    end;
    if v88.trailingOnActivated ~= nil then
        v89.trailing_on_activated = v4.ActionProp.jsonDecode(v88.trailingOnActivated);
    end;
    if v88.test_id ~= nil then
        v89.test_id = v3.StringProp.jsonDecode(v88.test_id);
    end;
    if v88.testId ~= nil then
        v89.test_id = v3.StringProp.jsonDecode(v88.testId);
    end;
    if v88.layout_order ~= nil then
        v89.layout_order = v3.Int32Prop.jsonDecode(v88.layout_order);
    end;
    if v88.layoutOrder ~= nil then
        v89.layout_order = v3.Int32Prop.jsonDecode(v88.layoutOrder);
    end;
    if v88.anchor_point ~= nil then
        v89.anchor_point = v3.Vector2Prop.jsonDecode(v88.anchor_point);
    end;
    if v88.anchorPoint ~= nil then
        v89.anchor_point = v3.Vector2Prop.jsonDecode(v88.anchorPoint);
    end;
    if v88.position ~= nil then
        v89.position = v3.UDim2Prop.jsonDecode(v88.position);
    end;
    if v88.size ~= nil then
        v89.size = v3.UDim2Prop.jsonDecode(v88.size);
    end;
    return v89;
end;
v6.descriptor = {
    name = "DualActionChipSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.DualActionChipSchema_Props = v6;
v1.default:register(v2.DualActionChipSchema_Props);
return {
    DualActionChipSchema = v2.DualActionChipSchema, 
    DualActionChipSchema_Props = v2.DualActionChipSchema_Props
};