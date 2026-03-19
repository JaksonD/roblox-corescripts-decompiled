local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.actions);
local v4 = require(script.Parent.prop_types);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 108 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 115 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 136 ]] --[[ Name: decode ]]
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
                v20.props = v2.CollectionGridSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 184 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 198 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.CollectionGridSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "CollectionGridSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CollectionGridSchema"
};
v2.CollectionGridSchema = v6;
v1.default:register(v2.CollectionGridSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 227 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        buffer_rows_below_screen = if not (v31 ~= nil) or v31.buffer_rows_below_screen == nil then nil else v31.buffer_rows_below_screen, 
        buffer_rows_above_screen = if not (v31 ~= nil) or v31.buffer_rows_above_screen == nil then nil else v31.buffer_rows_above_screen, 
        collection_item_size = if not (v31 ~= nil) or v31.collection_item_size == nil then nil else v31.collection_item_size, 
        disable_relative_gap = if not (v31 ~= nil) or v31.disable_relative_gap == nil then nil else v31.disable_relative_gap, 
        focus_nav_actions_component = if not (v31 ~= nil) or v31.focus_nav_actions_component == nil then nil else v31.focus_nav_actions_component, 
        header_component = if not (v31 ~= nil) or v31.header_component == nil then nil else v31.header_component, 
        item_height_from_width = if not (v31 ~= nil) or v31.item_height_from_width == nil then nil else v31.item_height_from_width, 
        items = if not (v31 ~= nil) or v31.items == nil then nil else v31.items, 
        max_num_rows = if not (v31 ~= nil) or v31.max_num_rows == nil then nil else v31.max_num_rows, 
        should_use_frame_bounds_for_impressions = if not (v31 ~= nil) or v31.should_use_frame_bounds_for_impressions == nil then nil else v31.should_use_frame_bounds_for_impressions, 
        disable_selection_order = if not (v31 ~= nil) or v31.disable_selection_order == nil then nil else v31.disable_selection_order, 
        title_text = if not (v31 ~= nil) or v31.title_text == nil then nil else v31.title_text, 
        threshold_rows_from_bottom = if not (v31 ~= nil) or v31.threshold_rows_from_bottom == nil then nil else v31.threshold_rows_from_bottom, 
        on_reached_threshold_from_end = if not (v31 ~= nil) or v31.on_reached_threshold_from_end == nil then nil else v31.on_reached_threshold_from_end
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 272 ]] --[[ Name: encode ]]
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
    if v32.position ~= nil then
        local v38 = v32.position:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.size ~= nil then
        local v41 = v32.size:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.buffer_rows_below_screen ~= nil then
        local v44 = v32.buffer_rows_below_screen:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.buffer_rows_above_screen ~= nil then
        local v47 = v32.buffer_rows_above_screen:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.collection_item_size ~= nil then
        local v50 = v32.collection_item_size:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.disable_relative_gap ~= nil then
        local v53 = v32.disable_relative_gap:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.focus_nav_actions_component ~= nil then
        local v56 = v32.focus_nav_actions_component:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.header_component ~= nil then
        local v59 = v32.header_component:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.item_height_from_width ~= nil then
        local v62 = v32.item_height_from_width:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.items ~= nil then
        local v65 = v32.items:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.max_num_rows ~= nil then
        local v68 = v32.max_num_rows:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.should_use_frame_bounds_for_impressions ~= nil then
        local v71 = v32.should_use_frame_bounds_for_impressions:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.disable_selection_order ~= nil then
        local v74 = v32.disable_selection_order:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.title_text ~= nil then
        local v77 = v32.title_text:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.threshold_rows_from_bottom ~= nil then
        local v80 = v32.threshold_rows_from_bottom:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.on_reached_threshold_from_end ~= nil then
        local v83 = v32.on_reached_threshold_from_end:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    local v86 = buffer.create(v34);
    buffer.copy(v86, 0, v33, 0, v34);
    return v86;
end;
v6.decode = function(v87) --[[ Line: 383 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v4 (copy), v3 (copy)
    local v88 = v6.new();
    local v89 = 0;
    while v89 < buffer.len(v87) do
        local v90 = nil;
        local v91 = nil;
        local v92, v93, v94 = v0.readTag(v87, v89);
        v90 = v92;
        v91 = v93;
        v89 = v94;
        if v91 == v0.wireTypes.varint then
            v92 = nil;
            v93, v94 = v0.readVarInt(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.lengthDelimited then
            if v90 == 1 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.anchor_point = v4.Vector2Prop.decode(v92);
            elseif v90 == 2 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.position = v4.UDim2Prop.decode(v92);
            elseif v90 == 3 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.size = v4.UDim2Prop.decode(v92);
            elseif v90 == 4 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.buffer_rows_below_screen = v4.FloatProp.decode(v92);
            elseif v90 == 5 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.buffer_rows_above_screen = v4.FloatProp.decode(v92);
            elseif v90 == 6 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.collection_item_size = v4.StringProp.decode(v92);
            elseif v90 == 7 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.disable_relative_gap = v4.BoolProp.decode(v92);
            elseif v90 == 8 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.focus_nav_actions_component = v4.NestedComponentProp.decode(v92);
            elseif v90 == 9 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.header_component = v4.NestedComponentProp.decode(v92);
            elseif v90 == 10 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.item_height_from_width = v4.UDimProp.decode(v92);
            elseif v90 == 11 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.items = v4.LazyNestedComponentListProp.decode(v92);
            elseif v90 == 12 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.max_num_rows = v4.FloatProp.decode(v92);
            elseif v90 == 13 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.should_use_frame_bounds_for_impressions = v4.BoolProp.decode(v92);
            elseif v90 == 14 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.disable_selection_order = v4.BoolProp.decode(v92);
            elseif v90 == 15 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.title_text = v4.StringProp.decode(v92);
            elseif v90 == 16 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.threshold_rows_from_bottom = v4.Int32Prop.decode(v92);
            elseif v90 == 17 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.on_reached_threshold_from_end = v3.ActionProp.decode(v92);
            else
                v92 = nil;
                v93, v94 = v0.readVarInt(v87, v89);
                v89 = v94 + v93;
            end;
        elseif v91 == v0.wireTypes.i32 then
            v92 = nil;
            v93, v94 = v0.readFixed32(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.i64 then
            v92 = nil;
            v93, v94 = v0.readFixed64(v87, v89);
            v92 = v93;
            v89 = v94;
        else
            error("Unsupported wire type: " .. v91);
        end;
    end;
    return v88;
end;
v6.jsonEncode = function(v95) --[[ Line: 517 ]] --[[ Name: jsonEncode ]]
    local v96 = {};
    if v95.anchor_point ~= nil then
        v96.anchorPoint = v95.anchor_point:jsonEncode();
    end;
    if v95.position ~= nil then
        v96.position = v95.position:jsonEncode();
    end;
    if v95.size ~= nil then
        v96.size = v95.size:jsonEncode();
    end;
    if v95.buffer_rows_below_screen ~= nil then
        v96.bufferRowsBelowScreen = v95.buffer_rows_below_screen:jsonEncode();
    end;
    if v95.buffer_rows_above_screen ~= nil then
        v96.bufferRowsAboveScreen = v95.buffer_rows_above_screen:jsonEncode();
    end;
    if v95.collection_item_size ~= nil then
        v96.collectionItemSize = v95.collection_item_size:jsonEncode();
    end;
    if v95.disable_relative_gap ~= nil then
        v96.disableRelativeGap = v95.disable_relative_gap:jsonEncode();
    end;
    if v95.focus_nav_actions_component ~= nil then
        v96.focusNavActionsComponent = v95.focus_nav_actions_component:jsonEncode();
    end;
    if v95.header_component ~= nil then
        v96.headerComponent = v95.header_component:jsonEncode();
    end;
    if v95.item_height_from_width ~= nil then
        v96.itemHeightFromWidth = v95.item_height_from_width:jsonEncode();
    end;
    if v95.items ~= nil then
        v96.items = v95.items:jsonEncode();
    end;
    if v95.max_num_rows ~= nil then
        v96.maxNumRows = v95.max_num_rows:jsonEncode();
    end;
    if v95.should_use_frame_bounds_for_impressions ~= nil then
        v96.shouldUseFrameBoundsForImpressions = v95.should_use_frame_bounds_for_impressions:jsonEncode();
    end;
    if v95.disable_selection_order ~= nil then
        v96.disableSelectionOrder = v95.disable_selection_order:jsonEncode();
    end;
    if v95.title_text ~= nil then
        v96.titleText = v95.title_text:jsonEncode();
    end;
    if v95.threshold_rows_from_bottom ~= nil then
        v96.thresholdRowsFromBottom = v95.threshold_rows_from_bottom:jsonEncode();
    end;
    if v95.on_reached_threshold_from_end ~= nil then
        v96.onReachedThresholdFromEnd = v95.on_reached_threshold_from_end:jsonEncode();
    end;
    return v96;
end;
v6.jsonDecode = function(v97) --[[ Line: 591 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy)
    local v98 = v6.new();
    if v97.anchor_point ~= nil then
        v98.anchor_point = v4.Vector2Prop.jsonDecode(v97.anchor_point);
    end;
    if v97.anchorPoint ~= nil then
        v98.anchor_point = v4.Vector2Prop.jsonDecode(v97.anchorPoint);
    end;
    if v97.position ~= nil then
        v98.position = v4.UDim2Prop.jsonDecode(v97.position);
    end;
    if v97.size ~= nil then
        v98.size = v4.UDim2Prop.jsonDecode(v97.size);
    end;
    if v97.buffer_rows_below_screen ~= nil then
        v98.buffer_rows_below_screen = v4.FloatProp.jsonDecode(v97.buffer_rows_below_screen);
    end;
    if v97.bufferRowsBelowScreen ~= nil then
        v98.buffer_rows_below_screen = v4.FloatProp.jsonDecode(v97.bufferRowsBelowScreen);
    end;
    if v97.buffer_rows_above_screen ~= nil then
        v98.buffer_rows_above_screen = v4.FloatProp.jsonDecode(v97.buffer_rows_above_screen);
    end;
    if v97.bufferRowsAboveScreen ~= nil then
        v98.buffer_rows_above_screen = v4.FloatProp.jsonDecode(v97.bufferRowsAboveScreen);
    end;
    if v97.collection_item_size ~= nil then
        v98.collection_item_size = v4.StringProp.jsonDecode(v97.collection_item_size);
    end;
    if v97.collectionItemSize ~= nil then
        v98.collection_item_size = v4.StringProp.jsonDecode(v97.collectionItemSize);
    end;
    if v97.disable_relative_gap ~= nil then
        v98.disable_relative_gap = v4.BoolProp.jsonDecode(v97.disable_relative_gap);
    end;
    if v97.disableRelativeGap ~= nil then
        v98.disable_relative_gap = v4.BoolProp.jsonDecode(v97.disableRelativeGap);
    end;
    if v97.focus_nav_actions_component ~= nil then
        v98.focus_nav_actions_component = v4.NestedComponentProp.jsonDecode(v97.focus_nav_actions_component);
    end;
    if v97.focusNavActionsComponent ~= nil then
        v98.focus_nav_actions_component = v4.NestedComponentProp.jsonDecode(v97.focusNavActionsComponent);
    end;
    if v97.header_component ~= nil then
        v98.header_component = v4.NestedComponentProp.jsonDecode(v97.header_component);
    end;
    if v97.headerComponent ~= nil then
        v98.header_component = v4.NestedComponentProp.jsonDecode(v97.headerComponent);
    end;
    if v97.item_height_from_width ~= nil then
        v98.item_height_from_width = v4.UDimProp.jsonDecode(v97.item_height_from_width);
    end;
    if v97.itemHeightFromWidth ~= nil then
        v98.item_height_from_width = v4.UDimProp.jsonDecode(v97.itemHeightFromWidth);
    end;
    if v97.items ~= nil then
        v98.items = v4.LazyNestedComponentListProp.jsonDecode(v97.items);
    end;
    if v97.max_num_rows ~= nil then
        v98.max_num_rows = v4.FloatProp.jsonDecode(v97.max_num_rows);
    end;
    if v97.maxNumRows ~= nil then
        v98.max_num_rows = v4.FloatProp.jsonDecode(v97.maxNumRows);
    end;
    if v97.should_use_frame_bounds_for_impressions ~= nil then
        v98.should_use_frame_bounds_for_impressions = v4.BoolProp.jsonDecode(v97.should_use_frame_bounds_for_impressions);
    end;
    if v97.shouldUseFrameBoundsForImpressions ~= nil then
        v98.should_use_frame_bounds_for_impressions = v4.BoolProp.jsonDecode(v97.shouldUseFrameBoundsForImpressions);
    end;
    if v97.disable_selection_order ~= nil then
        v98.disable_selection_order = v4.BoolProp.jsonDecode(v97.disable_selection_order);
    end;
    if v97.disableSelectionOrder ~= nil then
        v98.disable_selection_order = v4.BoolProp.jsonDecode(v97.disableSelectionOrder);
    end;
    if v97.title_text ~= nil then
        v98.title_text = v4.StringProp.jsonDecode(v97.title_text);
    end;
    if v97.titleText ~= nil then
        v98.title_text = v4.StringProp.jsonDecode(v97.titleText);
    end;
    if v97.threshold_rows_from_bottom ~= nil then
        v98.threshold_rows_from_bottom = v4.Int32Prop.jsonDecode(v97.threshold_rows_from_bottom);
    end;
    if v97.thresholdRowsFromBottom ~= nil then
        v98.threshold_rows_from_bottom = v4.Int32Prop.jsonDecode(v97.thresholdRowsFromBottom);
    end;
    if v97.on_reached_threshold_from_end ~= nil then
        v98.on_reached_threshold_from_end = v3.ActionProp.jsonDecode(v97.on_reached_threshold_from_end);
    end;
    if v97.onReachedThresholdFromEnd ~= nil then
        v98.on_reached_threshold_from_end = v3.ActionProp.jsonDecode(v97.onReachedThresholdFromEnd);
    end;
    return v98;
end;
v6.descriptor = {
    name = "CollectionGridSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CollectionGridSchema_Props = v6;
v1.default:register(v2.CollectionGridSchema_Props);
return {
    CollectionGridSchema = v2.CollectionGridSchema, 
    CollectionGridSchema_Props = v2.CollectionGridSchema_Props
};