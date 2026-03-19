local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 99 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 108 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 129 ]] --[[ Name: decode ]]
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
                v20.props = v2.GameTileActiveFriendsFooterSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 177 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 191 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.GameTileActiveFriendsFooterSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "GameTileActiveFriendsFooterSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameTileActiveFriendsFooterSchema"
};
v2.GameTileActiveFriendsFooterSchema = v6;
v1.default:register(v2.GameTileActiveFriendsFooterSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 222 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        background_color3 = if not (v31 ~= nil) or v31.background_color3 == nil then nil else v31.background_color3, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        automatic_size = if not (v31 ~= nil) or v31.automatic_size == nil then nil else v31.automatic_size, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        z_index = if not (v31 ~= nil) or v31.z_index == nil then nil else v31.z_index, 
        universe_id = if not (v31 ~= nil) or v31.universe_id == nil then nil else v31.universe_id, 
        icon_width = if not (v31 ~= nil) or v31.icon_width == nil then nil else v31.icon_width, 
        max_avatars = if not (v31 ~= nil) or v31.max_avatars == nil then nil else v31.max_avatars, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 240 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.anchor_point ~= nil then
        local v35 = v32.anchor_point:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.background_color3 ~= nil then
        local v38 = v32.background_color3:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.position ~= nil then
        local v41 = v32.position:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.automatic_size ~= nil then
        local v44 = v32.automatic_size:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.layout_order ~= nil then
        local v47 = v32.layout_order:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.size ~= nil then
        local v50 = v32.size:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.z_index ~= nil then
        local v53 = v32.z_index:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.universe_id ~= nil then
        local v56 = v32.universe_id:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.icon_width ~= nil then
        local v59 = v32.icon_width:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.max_avatars ~= nil then
        local v62 = v32.max_avatars:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.on_activated ~= nil then
        local v65 = v32.on_activated:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    local v68 = buffer.create(v34);
    buffer.copy(v68, 0, v33, 0, v34);
    return v68;
end;
v6.decode = function(v69) --[[ Line: 315 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v70 = v6.new();
    local v71 = 0;
    while v71 < buffer.len(v69) do
        local v72 = nil;
        local v73 = nil;
        local v74, v75, v76 = v0.readTag(v69, v71);
        v72 = v74;
        v73 = v75;
        v71 = v76;
        if v73 == v0.wireTypes.varint then
            v74 = nil;
            v75, v76 = v0.readVarInt(v69, v71);
            v74 = v75;
            v71 = v76;
        elseif v73 == v0.wireTypes.lengthDelimited then
            if v72 == 1 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.anchor_point = v3.Vector2Prop.decode(v74);
            elseif v72 == 2 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.background_color3 = v3.ColorProp.decode(v74);
            elseif v72 == 3 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.position = v3.UDim2Prop.decode(v74);
            elseif v72 == 4 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.automatic_size = v3.StringProp.decode(v74);
            elseif v72 == 5 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.layout_order = v3.Int32Prop.decode(v74);
            elseif v72 == 6 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.size = v3.UDim2Prop.decode(v74);
            elseif v72 == 7 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.z_index = v3.FloatProp.decode(v74);
            elseif v72 == 8 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.universe_id = v3.StringProp.decode(v74);
            elseif v72 == 9 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.icon_width = v3.FloatProp.decode(v74);
            elseif v72 == 10 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.max_avatars = v3.FloatProp.decode(v74);
            elseif v72 == 11 then
                v74 = nil;
                v75, v76 = v0.readBuffer(v69, v71);
                v74 = v75;
                v71 = v76;
                v70.on_activated = v4.ActionProp.decode(v74);
            else
                v74 = nil;
                v75, v76 = v0.readVarInt(v69, v71);
                v71 = v76 + v75;
            end;
        elseif v73 == v0.wireTypes.i32 then
            v74 = nil;
            v75, v76 = v0.readFixed32(v69, v71);
            v74 = v75;
            v71 = v76;
        elseif v73 == v0.wireTypes.i64 then
            v74 = nil;
            v75, v76 = v0.readFixed64(v69, v71);
            v74 = v75;
            v71 = v76;
        else
            error("Unsupported wire type: " .. v73);
        end;
    end;
    return v70;
end;
v6.jsonEncode = function(v77) --[[ Line: 408 ]] --[[ Name: jsonEncode ]]
    local v78 = {};
    if v77.anchor_point ~= nil then
        v78.anchorPoint = v77.anchor_point:jsonEncode();
    end;
    if v77.background_color3 ~= nil then
        v78.backgroundColor3 = v77.background_color3:jsonEncode();
    end;
    if v77.position ~= nil then
        v78.position = v77.position:jsonEncode();
    end;
    if v77.automatic_size ~= nil then
        v78.automaticSize = v77.automatic_size:jsonEncode();
    end;
    if v77.layout_order ~= nil then
        v78.layoutOrder = v77.layout_order:jsonEncode();
    end;
    if v77.size ~= nil then
        v78.size = v77.size:jsonEncode();
    end;
    if v77.z_index ~= nil then
        v78.zIndex = v77.z_index:jsonEncode();
    end;
    if v77.universe_id ~= nil then
        v78.universeId = v77.universe_id:jsonEncode();
    end;
    if v77.icon_width ~= nil then
        v78.iconWidth = v77.icon_width:jsonEncode();
    end;
    if v77.max_avatars ~= nil then
        v78.maxAvatars = v77.max_avatars:jsonEncode();
    end;
    if v77.on_activated ~= nil then
        v78.onActivated = v77.on_activated:jsonEncode();
    end;
    return v78;
end;
v6.jsonDecode = function(v79) --[[ Line: 458 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v80 = v6.new();
    if v79.anchor_point ~= nil then
        v80.anchor_point = v3.Vector2Prop.jsonDecode(v79.anchor_point);
    end;
    if v79.anchorPoint ~= nil then
        v80.anchor_point = v3.Vector2Prop.jsonDecode(v79.anchorPoint);
    end;
    if v79.background_color3 ~= nil then
        v80.background_color3 = v3.ColorProp.jsonDecode(v79.background_color3);
    end;
    if v79.backgroundColor3 ~= nil then
        v80.background_color3 = v3.ColorProp.jsonDecode(v79.backgroundColor3);
    end;
    if v79.position ~= nil then
        v80.position = v3.UDim2Prop.jsonDecode(v79.position);
    end;
    if v79.automatic_size ~= nil then
        v80.automatic_size = v3.StringProp.jsonDecode(v79.automatic_size);
    end;
    if v79.automaticSize ~= nil then
        v80.automatic_size = v3.StringProp.jsonDecode(v79.automaticSize);
    end;
    if v79.layout_order ~= nil then
        v80.layout_order = v3.Int32Prop.jsonDecode(v79.layout_order);
    end;
    if v79.layoutOrder ~= nil then
        v80.layout_order = v3.Int32Prop.jsonDecode(v79.layoutOrder);
    end;
    if v79.size ~= nil then
        v80.size = v3.UDim2Prop.jsonDecode(v79.size);
    end;
    if v79.z_index ~= nil then
        v80.z_index = v3.FloatProp.jsonDecode(v79.z_index);
    end;
    if v79.zIndex ~= nil then
        v80.z_index = v3.FloatProp.jsonDecode(v79.zIndex);
    end;
    if v79.universe_id ~= nil then
        v80.universe_id = v3.StringProp.jsonDecode(v79.universe_id);
    end;
    if v79.universeId ~= nil then
        v80.universe_id = v3.StringProp.jsonDecode(v79.universeId);
    end;
    if v79.icon_width ~= nil then
        v80.icon_width = v3.FloatProp.jsonDecode(v79.icon_width);
    end;
    if v79.iconWidth ~= nil then
        v80.icon_width = v3.FloatProp.jsonDecode(v79.iconWidth);
    end;
    if v79.max_avatars ~= nil then
        v80.max_avatars = v3.FloatProp.jsonDecode(v79.max_avatars);
    end;
    if v79.maxAvatars ~= nil then
        v80.max_avatars = v3.FloatProp.jsonDecode(v79.maxAvatars);
    end;
    if v79.on_activated ~= nil then
        v80.on_activated = v4.ActionProp.jsonDecode(v79.on_activated);
    end;
    if v79.onActivated ~= nil then
        v80.on_activated = v4.ActionProp.jsonDecode(v79.onActivated);
    end;
    return v80;
end;
v6.descriptor = {
    name = "GameTileActiveFriendsFooterSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.GameTileActiveFriendsFooterSchema_Props = v6;
v1.default:register(v2.GameTileActiveFriendsFooterSchema_Props);
return {
    GameTileActiveFriendsFooterSchema = v2.GameTileActiveFriendsFooterSchema, 
    GameTileActiveFriendsFooterSchema_Props = v2.GameTileActiveFriendsFooterSchema_Props
};