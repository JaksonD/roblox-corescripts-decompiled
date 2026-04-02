local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.component_shared);
local v5 = {};
v5.__index = v5;
local l_v5_0 = v5 --[[ copy: 5 -> 6 ]];
v5.new = function(v7) --[[ Line: 101 ]] --[[ Name: new ]]
    -- upvalues: l_v5_0 (copy)
    return (setmetatable({
        props = if not (v7 ~= nil) or v7.props == nil then nil else v7.props, 
        shared = if not (v7 ~= nil) or v7.shared == nil then nil else v7.shared
    }, l_v5_0));
end;
v5.encode = function(v8) --[[ Line: 108 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v9 = buffer.create(0);
    local v10 = 0;
    if v8.props ~= nil then
        local v11 = v8.props:encode();
        local v12, v13 = v0.writeTag(v9, v10, 1, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeBuffer(v12, v13, v11, buffer.len(v11));
        v9 = v12;
        v10 = v13;
    end;
    if v8.shared ~= nil then
        local v14 = v8.shared:encode();
        local v15, v16 = v0.writeTag(v9, v10, 2, v0.wireTypes.lengthDelimited);
        v15, v16 = v0.writeBuffer(v15, v16, v14, buffer.len(v14));
        v9 = v15;
        v10 = v16;
    end;
    local v17 = buffer.create(v10);
    buffer.copy(v17, 0, v9, 0, v10);
    return v17;
end;
v5.decode = function(v18) --[[ Line: 129 ]] --[[ Name: decode ]]
    -- upvalues: l_v5_0 (copy), v0 (copy), v2 (copy), v4 (copy)
    local v19 = l_v5_0.new();
    local v20 = 0;
    while v20 < buffer.len(v18) do
        local v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v0.readTag(v18, v20);
        v21 = v23;
        v22 = v24;
        v20 = v25;
        if v22 == v0.wireTypes.varint then
            v23 = nil;
            v24, v25 = v0.readVarInt(v18, v20);
            v23 = v24;
            v20 = v25;
        elseif v22 == v0.wireTypes.lengthDelimited then
            if v21 == 1 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.props = v2.PlayButtonSchema_Props.decode(v23);
            elseif v21 == 2 then
                v23 = nil;
                v24, v25 = v0.readBuffer(v18, v20);
                v23 = v24;
                v20 = v25;
                v19.shared = v4.ComponentShared.decode(v23);
            else
                v23 = nil;
                v24, v25 = v0.readVarInt(v18, v20);
                v20 = v25 + v24;
            end;
        elseif v22 == v0.wireTypes.i32 then
            v23 = nil;
            v24, v25 = v0.readFixed32(v18, v20);
            v23 = v24;
            v20 = v25;
        elseif v22 == v0.wireTypes.i64 then
            v23 = nil;
            v24, v25 = v0.readFixed64(v18, v20);
            v23 = v24;
            v20 = v25;
        else
            error("Unsupported wire type: " .. v22);
        end;
    end;
    return v19;
end;
v5.jsonEncode = function(v26) --[[ Line: 177 ]] --[[ Name: jsonEncode ]]
    local v27 = {};
    if v26.props ~= nil then
        v27.props = v26.props:jsonEncode();
    end;
    if v26.shared ~= nil then
        v27.shared = v26.shared:jsonEncode();
    end;
    return v27;
end;
v5.jsonDecode = function(v28) --[[ Line: 191 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v5_0 (copy), v2 (copy), v4 (copy)
    local v29 = l_v5_0.new();
    if v28.props ~= nil then
        v29.props = v2.PlayButtonSchema_Props.jsonDecode(v28.props);
    end;
    if v28.shared ~= nil then
        v29.shared = v4.ComponentShared.jsonDecode(v28.shared);
    end;
    return v29;
end;
v5.descriptor = {
    name = "PlayButtonSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonSchema"
};
v2.PlayButtonSchema = v5;
v1.default:register(v2.PlayButtonSchema);
v5 = {};
v5.__index = v5;
v5.new = function(v30) --[[ Line: 220 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        width = if not (v30 ~= nil) or v30.width == nil then nil else v30.width, 
        anchor_point = if not (v30 ~= nil) or v30.anchor_point == nil then nil else v30.anchor_point, 
        position = if not (v30 ~= nil) or v30.position == nil then nil else v30.position, 
        layout_order = if not (v30 ~= nil) or v30.layout_order == nil then nil else v30.layout_order, 
        button_size = if not (v30 ~= nil) or v30.button_size == nil then nil else v30.button_size, 
        fill_behavior = if not (v30 ~= nil) or v30.fill_behavior == nil then nil else v30.fill_behavior, 
        fetch_delay_in_seconds = if not (v30 ~= nil) or v30.fetch_delay_in_seconds == nil then nil else v30.fetch_delay_in_seconds, 
        hide_if_unplayable = if not (v30 ~= nil) or v30.hide_if_unplayable == nil then nil else v30.hide_if_unplayable, 
        hide_if_loading = if not (v30 ~= nil) or v30.hide_if_loading == nil then nil else v30.hide_if_loading, 
        open_game_details_on_purchase_required = if not (v30 ~= nil) or v30.open_game_details_on_purchase_required == nil then nil else v30.open_game_details_on_purchase_required, 
        hide_playable_icon = if not (v30 ~= nil) or v30.hide_playable_icon == nil then nil else v30.hide_playable_icon, 
        playable_text = if not (v30 ~= nil) or v30.playable_text == nil then nil else v30.playable_text, 
        universe_id = if not (v30 ~= nil) or v30.universe_id == nil then nil else v30.universe_id, 
        root_place_id = if not (v30 ~= nil) or v30.root_place_id == nil then nil else v30.root_place_id, 
        place_id = if not (v30 ~= nil) or v30.place_id == nil then nil else v30.place_id, 
        experience_join_data = if not (v30 ~= nil) or v30.experience_join_data == nil then nil else v30.experience_join_data, 
        applied_filters = if not (v30 ~= nil) or v30.applied_filters == nil then nil else v30.applied_filters
    }, v5));
end;
v5.encode = function(v31) --[[ Line: 249 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.width ~= nil then
        local v34 = v31.width:encode();
        local v35, v36 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
        v35, v36 = v0.writeBuffer(v35, v36, v34, buffer.len(v34));
        v32 = v35;
        v33 = v36;
    end;
    if v31.anchor_point ~= nil then
        local v37 = v31.anchor_point:encode();
        local v38, v39 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeBuffer(v38, v39, v37, buffer.len(v37));
        v32 = v38;
        v33 = v39;
    end;
    if v31.position ~= nil then
        local v40 = v31.position:encode();
        local v41, v42 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v32 = v41;
        v33 = v42;
    end;
    if v31.layout_order ~= nil then
        local v43 = v31.layout_order:encode();
        local v44, v45 = v0.writeTag(v32, v33, 4, v0.wireTypes.lengthDelimited);
        v44, v45 = v0.writeBuffer(v44, v45, v43, buffer.len(v43));
        v32 = v44;
        v33 = v45;
    end;
    if v31.button_size ~= nil then
        local v46 = v31.button_size:encode();
        local v47, v48 = v0.writeTag(v32, v33, 5, v0.wireTypes.lengthDelimited);
        v47, v48 = v0.writeBuffer(v47, v48, v46, buffer.len(v46));
        v32 = v47;
        v33 = v48;
    end;
    if v31.fill_behavior ~= nil then
        local v49 = v31.fill_behavior:encode();
        local v50, v51 = v0.writeTag(v32, v33, 6, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeBuffer(v50, v51, v49, buffer.len(v49));
        v32 = v50;
        v33 = v51;
    end;
    if v31.fetch_delay_in_seconds ~= nil then
        local v52 = v31.fetch_delay_in_seconds:encode();
        local v53, v54 = v0.writeTag(v32, v33, 7, v0.wireTypes.lengthDelimited);
        v53, v54 = v0.writeBuffer(v53, v54, v52, buffer.len(v52));
        v32 = v53;
        v33 = v54;
    end;
    if v31.hide_if_unplayable ~= nil then
        local v55 = v31.hide_if_unplayable:encode();
        local v56, v57 = v0.writeTag(v32, v33, 8, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeBuffer(v56, v57, v55, buffer.len(v55));
        v32 = v56;
        v33 = v57;
    end;
    if v31.hide_if_loading ~= nil then
        local v58 = v31.hide_if_loading:encode();
        local v59, v60 = v0.writeTag(v32, v33, 9, v0.wireTypes.lengthDelimited);
        v59, v60 = v0.writeBuffer(v59, v60, v58, buffer.len(v58));
        v32 = v59;
        v33 = v60;
    end;
    if v31.open_game_details_on_purchase_required ~= nil then
        local v61 = v31.open_game_details_on_purchase_required:encode();
        local v62, v63 = v0.writeTag(v32, v33, 10, v0.wireTypes.lengthDelimited);
        v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
        v32 = v62;
        v33 = v63;
    end;
    if v31.hide_playable_icon ~= nil then
        local v64 = v31.hide_playable_icon:encode();
        local v65, v66 = v0.writeTag(v32, v33, 11, v0.wireTypes.lengthDelimited);
        v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
        v32 = v65;
        v33 = v66;
    end;
    if v31.playable_text ~= nil then
        local v67 = v31.playable_text:encode();
        local v68, v69 = v0.writeTag(v32, v33, 12, v0.wireTypes.lengthDelimited);
        v68, v69 = v0.writeBuffer(v68, v69, v67, buffer.len(v67));
        v32 = v68;
        v33 = v69;
    end;
    if v31.universe_id ~= nil then
        local v70 = v31.universe_id:encode();
        local v71, v72 = v0.writeTag(v32, v33, 13, v0.wireTypes.lengthDelimited);
        v71, v72 = v0.writeBuffer(v71, v72, v70, buffer.len(v70));
        v32 = v71;
        v33 = v72;
    end;
    if v31.root_place_id ~= nil then
        local v73 = v31.root_place_id:encode();
        local v74, v75 = v0.writeTag(v32, v33, 14, v0.wireTypes.lengthDelimited);
        v74, v75 = v0.writeBuffer(v74, v75, v73, buffer.len(v73));
        v32 = v74;
        v33 = v75;
    end;
    if v31.place_id ~= nil then
        local v76 = v31.place_id:encode();
        local v77, v78 = v0.writeTag(v32, v33, 15, v0.wireTypes.lengthDelimited);
        v77, v78 = v0.writeBuffer(v77, v78, v76, buffer.len(v76));
        v32 = v77;
        v33 = v78;
    end;
    if v31.experience_join_data ~= nil then
        local v79 = v31.experience_join_data:encode();
        local v80, v81 = v0.writeTag(v32, v33, 16, v0.wireTypes.lengthDelimited);
        v80, v81 = v0.writeBuffer(v80, v81, v79, buffer.len(v79));
        v32 = v80;
        v33 = v81;
    end;
    if v31.applied_filters ~= nil then
        local v82 = v31.applied_filters:encode();
        local v83, v84 = v0.writeTag(v32, v33, 17, v0.wireTypes.lengthDelimited);
        v83, v84 = v0.writeBuffer(v83, v84, v82, buffer.len(v82));
        v32 = v83;
        v33 = v84;
    end;
    local v85 = buffer.create(v33);
    buffer.copy(v85, 0, v32, 0, v33);
    return v85;
end;
v5.decode = function(v86) --[[ Line: 360 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy)
    local v87 = v5.new();
    local v88 = 0;
    while v88 < buffer.len(v86) do
        local v89 = nil;
        local v90 = nil;
        local v91, v92, v93 = v0.readTag(v86, v88);
        v89 = v91;
        v90 = v92;
        v88 = v93;
        if v90 == v0.wireTypes.varint then
            v91 = nil;
            v92, v93 = v0.readVarInt(v86, v88);
            v91 = v92;
            v88 = v93;
        elseif v90 == v0.wireTypes.lengthDelimited then
            if v89 == 1 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.width = v3.UDimProp.decode(v91);
            elseif v89 == 2 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.anchor_point = v3.Vector2Prop.decode(v91);
            elseif v89 == 3 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.position = v3.UDim2Prop.decode(v91);
            elseif v89 == 4 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.layout_order = v3.Int32Prop.decode(v91);
            elseif v89 == 5 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.button_size = v3.InputSizeProp.decode(v91);
            elseif v89 == 6 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.fill_behavior = v3.FillBehaviorProp.decode(v91);
            elseif v89 == 7 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.fetch_delay_in_seconds = v3.FloatProp.decode(v91);
            elseif v89 == 8 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.hide_if_unplayable = v3.BoolProp.decode(v91);
            elseif v89 == 9 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.hide_if_loading = v3.BoolProp.decode(v91);
            elseif v89 == 10 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.open_game_details_on_purchase_required = v3.BoolProp.decode(v91);
            elseif v89 == 11 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.hide_playable_icon = v3.BoolProp.decode(v91);
            elseif v89 == 12 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.playable_text = v3.StringProp.decode(v91);
            elseif v89 == 13 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.universe_id = v3.StringProp.decode(v91);
            elseif v89 == 14 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.root_place_id = v3.StringProp.decode(v91);
            elseif v89 == 15 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.place_id = v3.StringProp.decode(v91);
            elseif v89 == 16 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.experience_join_data = v3.StructProp.decode(v91);
            elseif v89 == 17 then
                v91 = nil;
                v92, v93 = v0.readBuffer(v86, v88);
                v91 = v92;
                v88 = v93;
                v87.applied_filters = v3.StringProp.decode(v91);
            else
                v91 = nil;
                v92, v93 = v0.readVarInt(v86, v88);
                v88 = v93 + v92;
            end;
        elseif v90 == v0.wireTypes.i32 then
            v91 = nil;
            v92, v93 = v0.readFixed32(v86, v88);
            v91 = v92;
            v88 = v93;
        elseif v90 == v0.wireTypes.i64 then
            v91 = nil;
            v92, v93 = v0.readFixed64(v86, v88);
            v91 = v92;
            v88 = v93;
        else
            error("Unsupported wire type: " .. v90);
        end;
    end;
    return v87;
end;
v5.jsonEncode = function(v94) --[[ Line: 487 ]] --[[ Name: jsonEncode ]]
    local v95 = {};
    if v94.width ~= nil then
        v95.width = v94.width:jsonEncode();
    end;
    if v94.anchor_point ~= nil then
        v95.anchorPoint = v94.anchor_point:jsonEncode();
    end;
    if v94.position ~= nil then
        v95.position = v94.position:jsonEncode();
    end;
    if v94.layout_order ~= nil then
        v95.layoutOrder = v94.layout_order:jsonEncode();
    end;
    if v94.button_size ~= nil then
        v95.buttonSize = v94.button_size:jsonEncode();
    end;
    if v94.fill_behavior ~= nil then
        v95.fillBehavior = v94.fill_behavior:jsonEncode();
    end;
    if v94.fetch_delay_in_seconds ~= nil then
        v95.fetchDelayInSeconds = v94.fetch_delay_in_seconds:jsonEncode();
    end;
    if v94.hide_if_unplayable ~= nil then
        v95.hideIfUnplayable = v94.hide_if_unplayable:jsonEncode();
    end;
    if v94.hide_if_loading ~= nil then
        v95.hideIfLoading = v94.hide_if_loading:jsonEncode();
    end;
    if v94.open_game_details_on_purchase_required ~= nil then
        v95.openGameDetailsOnPurchaseRequired = v94.open_game_details_on_purchase_required:jsonEncode();
    end;
    if v94.hide_playable_icon ~= nil then
        v95.hidePlayableIcon = v94.hide_playable_icon:jsonEncode();
    end;
    if v94.playable_text ~= nil then
        v95.playableText = v94.playable_text:jsonEncode();
    end;
    if v94.universe_id ~= nil then
        v95.universeId = v94.universe_id:jsonEncode();
    end;
    if v94.root_place_id ~= nil then
        v95.rootPlaceId = v94.root_place_id:jsonEncode();
    end;
    if v94.place_id ~= nil then
        v95.placeId = v94.place_id:jsonEncode();
    end;
    if v94.experience_join_data ~= nil then
        v95.experienceJoinData = v94.experience_join_data:jsonEncode();
    end;
    if v94.applied_filters ~= nil then
        v95.appliedFilters = v94.applied_filters:jsonEncode();
    end;
    return v95;
end;
v5.jsonDecode = function(v96) --[[ Line: 561 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v97 = v5.new();
    if v96.width ~= nil then
        v97.width = v3.UDimProp.jsonDecode(v96.width);
    end;
    if v96.anchor_point ~= nil then
        v97.anchor_point = v3.Vector2Prop.jsonDecode(v96.anchor_point);
    end;
    if v96.anchorPoint ~= nil then
        v97.anchor_point = v3.Vector2Prop.jsonDecode(v96.anchorPoint);
    end;
    if v96.position ~= nil then
        v97.position = v3.UDim2Prop.jsonDecode(v96.position);
    end;
    if v96.layout_order ~= nil then
        v97.layout_order = v3.Int32Prop.jsonDecode(v96.layout_order);
    end;
    if v96.layoutOrder ~= nil then
        v97.layout_order = v3.Int32Prop.jsonDecode(v96.layoutOrder);
    end;
    if v96.button_size ~= nil then
        v97.button_size = v3.InputSizeProp.jsonDecode(v96.button_size);
    end;
    if v96.buttonSize ~= nil then
        v97.button_size = v3.InputSizeProp.jsonDecode(v96.buttonSize);
    end;
    if v96.fill_behavior ~= nil then
        v97.fill_behavior = v3.FillBehaviorProp.jsonDecode(v96.fill_behavior);
    end;
    if v96.fillBehavior ~= nil then
        v97.fill_behavior = v3.FillBehaviorProp.jsonDecode(v96.fillBehavior);
    end;
    if v96.fetch_delay_in_seconds ~= nil then
        v97.fetch_delay_in_seconds = v3.FloatProp.jsonDecode(v96.fetch_delay_in_seconds);
    end;
    if v96.fetchDelayInSeconds ~= nil then
        v97.fetch_delay_in_seconds = v3.FloatProp.jsonDecode(v96.fetchDelayInSeconds);
    end;
    if v96.hide_if_unplayable ~= nil then
        v97.hide_if_unplayable = v3.BoolProp.jsonDecode(v96.hide_if_unplayable);
    end;
    if v96.hideIfUnplayable ~= nil then
        v97.hide_if_unplayable = v3.BoolProp.jsonDecode(v96.hideIfUnplayable);
    end;
    if v96.hide_if_loading ~= nil then
        v97.hide_if_loading = v3.BoolProp.jsonDecode(v96.hide_if_loading);
    end;
    if v96.hideIfLoading ~= nil then
        v97.hide_if_loading = v3.BoolProp.jsonDecode(v96.hideIfLoading);
    end;
    if v96.open_game_details_on_purchase_required ~= nil then
        v97.open_game_details_on_purchase_required = v3.BoolProp.jsonDecode(v96.open_game_details_on_purchase_required);
    end;
    if v96.openGameDetailsOnPurchaseRequired ~= nil then
        v97.open_game_details_on_purchase_required = v3.BoolProp.jsonDecode(v96.openGameDetailsOnPurchaseRequired);
    end;
    if v96.hide_playable_icon ~= nil then
        v97.hide_playable_icon = v3.BoolProp.jsonDecode(v96.hide_playable_icon);
    end;
    if v96.hidePlayableIcon ~= nil then
        v97.hide_playable_icon = v3.BoolProp.jsonDecode(v96.hidePlayableIcon);
    end;
    if v96.playable_text ~= nil then
        v97.playable_text = v3.StringProp.jsonDecode(v96.playable_text);
    end;
    if v96.playableText ~= nil then
        v97.playable_text = v3.StringProp.jsonDecode(v96.playableText);
    end;
    if v96.universe_id ~= nil then
        v97.universe_id = v3.StringProp.jsonDecode(v96.universe_id);
    end;
    if v96.universeId ~= nil then
        v97.universe_id = v3.StringProp.jsonDecode(v96.universeId);
    end;
    if v96.root_place_id ~= nil then
        v97.root_place_id = v3.StringProp.jsonDecode(v96.root_place_id);
    end;
    if v96.rootPlaceId ~= nil then
        v97.root_place_id = v3.StringProp.jsonDecode(v96.rootPlaceId);
    end;
    if v96.place_id ~= nil then
        v97.place_id = v3.StringProp.jsonDecode(v96.place_id);
    end;
    if v96.placeId ~= nil then
        v97.place_id = v3.StringProp.jsonDecode(v96.placeId);
    end;
    if v96.experience_join_data ~= nil then
        v97.experience_join_data = v3.StructProp.jsonDecode(v96.experience_join_data);
    end;
    if v96.experienceJoinData ~= nil then
        v97.experience_join_data = v3.StructProp.jsonDecode(v96.experienceJoinData);
    end;
    if v96.applied_filters ~= nil then
        v97.applied_filters = v3.StringProp.jsonDecode(v96.applied_filters);
    end;
    if v96.appliedFilters ~= nil then
        v97.applied_filters = v3.StringProp.jsonDecode(v96.appliedFilters);
    end;
    return v97;
end;
v5.descriptor = {
    name = "PlayButtonSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.PlayButtonSchema_Props = v5;
v1.default:register(v2.PlayButtonSchema_Props);
return {
    PlayButtonSchema = v2.PlayButtonSchema, 
    PlayButtonSchema_Props = v2.PlayButtonSchema_Props
};