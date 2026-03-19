local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 112 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 119 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 140 ]] --[[ Name: decode ]]
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
                v20.props = v2.CollectionCarouselSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 188 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 202 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.CollectionCarouselSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "CollectionCarouselSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CollectionCarouselSchema"
};
v2.CollectionCarouselSchema = v6;
v1.default:register(v2.CollectionCarouselSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 231 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        collection_item_size = if not (v31 ~= nil) or v31.collection_item_size == nil then nil else v31.collection_item_size, 
        item_height_from_width = if not (v31 ~= nil) or v31.item_height_from_width == nil then nil else v31.item_height_from_width, 
        header_component = if not (v31 ~= nil) or v31.header_component == nil then nil else v31.header_component, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        scrolling_enabled_override = if not (v31 ~= nil) or v31.scrolling_enabled_override == nil then nil else v31.scrolling_enabled_override, 
        force_scrollable = if not (v31 ~= nil) or v31.force_scrollable == nil then nil else v31.force_scrollable, 
        max_items_to_show = if not (v31 ~= nil) or v31.max_items_to_show == nil then nil else v31.max_items_to_show, 
        should_use_frame_bounds_for_impressions = if not (v31 ~= nil) or v31.should_use_frame_bounds_for_impressions == nil then nil else v31.should_use_frame_bounds_for_impressions, 
        background_mural_url = if not (v31 ~= nil) or v31.background_mural_url == nil then nil else v31.background_mural_url, 
        on_scroll_to_end = if not (v31 ~= nil) or v31.on_scroll_to_end == nil then nil else v31.on_scroll_to_end, 
        scroll_threshold_from_end = if not (v31 ~= nil) or v31.scroll_threshold_from_end == nil then nil else v31.scroll_threshold_from_end, 
        item_template_key = if not (v31 ~= nil) or v31.item_template_key == nil then nil else v31.item_template_key, 
        focus_nav_actions_component = if not (v31 ~= nil) or v31.focus_nav_actions_component == nil then nil else v31.focus_nav_actions_component, 
        disable_selection_order = if not (v31 ~= nil) or v31.disable_selection_order == nil then nil else v31.disable_selection_order, 
        num_items_to_render_off_screen = if not (v31 ~= nil) or v31.num_items_to_render_off_screen == nil then nil else v31.num_items_to_render_off_screen, 
        items = if not (v31 ~= nil) or v31.items == nil then nil else v31.items, 
        item_height_mode = if not (v31 ~= nil) or v31.item_height_mode == nil then nil else v31.item_height_mode
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 276 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.collection_item_size ~= nil then
        local v35 = v32.collection_item_size:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.item_height_from_width ~= nil then
        local v38 = v32.item_height_from_width:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.header_component ~= nil then
        local v41 = v32.header_component:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.position ~= nil then
        local v44 = v32.position:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.size ~= nil then
        local v47 = v32.size:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.anchor_point ~= nil then
        local v50 = v32.anchor_point:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.scrolling_enabled_override ~= nil then
        local v53 = v32.scrolling_enabled_override:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.force_scrollable ~= nil then
        local v56 = v32.force_scrollable:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.max_items_to_show ~= nil then
        local v59 = v32.max_items_to_show:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.should_use_frame_bounds_for_impressions ~= nil then
        local v62 = v32.should_use_frame_bounds_for_impressions:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.background_mural_url ~= nil then
        local v65 = v32.background_mural_url:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.on_scroll_to_end ~= nil then
        local v68 = v32.on_scroll_to_end:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.scroll_threshold_from_end ~= nil then
        local v71 = v32.scroll_threshold_from_end:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.item_template_key ~= nil then
        local v74 = v32.item_template_key:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.focus_nav_actions_component ~= nil then
        local v77 = v32.focus_nav_actions_component:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.disable_selection_order ~= nil then
        local v80 = v32.disable_selection_order:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.num_items_to_render_off_screen ~= nil then
        local v83 = v32.num_items_to_render_off_screen:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.items ~= nil then
        local v86 = v32.items:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    if v32.item_height_mode ~= nil then
        local v89 = v32.item_height_mode:encode();
        local v90, v91 = v0.writeTag(v33, v34, 19, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v33 = v90;
        v34 = v91;
    end;
    local v92 = buffer.create(v34);
    buffer.copy(v92, 0, v33, 0, v34);
    return v92;
end;
v6.decode = function(v93) --[[ Line: 399 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v94 = v6.new();
    local v95 = 0;
    while v95 < buffer.len(v93) do
        local v96 = nil;
        local v97 = nil;
        local v98, v99, v100 = v0.readTag(v93, v95);
        v96 = v98;
        v97 = v99;
        v95 = v100;
        if v97 == v0.wireTypes.varint then
            v98 = nil;
            v99, v100 = v0.readVarInt(v93, v95);
            v98 = v99;
            v95 = v100;
        elseif v97 == v0.wireTypes.lengthDelimited then
            if v96 == 1 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.collection_item_size = v3.StringProp.decode(v98);
            elseif v96 == 2 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.item_height_from_width = v3.UDimProp.decode(v98);
            elseif v96 == 3 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.header_component = v3.NestedComponentProp.decode(v98);
            elseif v96 == 4 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.position = v3.UDim2Prop.decode(v98);
            elseif v96 == 5 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.size = v3.UDim2Prop.decode(v98);
            elseif v96 == 6 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.anchor_point = v3.Vector2Prop.decode(v98);
            elseif v96 == 7 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.scrolling_enabled_override = v3.BoolProp.decode(v98);
            elseif v96 == 8 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.force_scrollable = v3.BoolProp.decode(v98);
            elseif v96 == 9 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.max_items_to_show = v3.FloatProp.decode(v98);
            elseif v96 == 10 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.should_use_frame_bounds_for_impressions = v3.BoolProp.decode(v98);
            elseif v96 == 11 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.background_mural_url = v3.ImageStringProp.decode(v98);
            elseif v96 == 12 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.on_scroll_to_end = v4.ActionProp.decode(v98);
            elseif v96 == 13 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.scroll_threshold_from_end = v3.FloatProp.decode(v98);
            elseif v96 == 14 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.item_template_key = v3.StringProp.decode(v98);
            elseif v96 == 15 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.focus_nav_actions_component = v3.NestedComponentProp.decode(v98);
            elseif v96 == 16 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.disable_selection_order = v3.BoolProp.decode(v98);
            elseif v96 == 17 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.num_items_to_render_off_screen = v3.FloatProp.decode(v98);
            elseif v96 == 18 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.items = v3.LazyNestedComponentListProp.decode(v98);
            elseif v96 == 19 then
                v98 = nil;
                v99, v100 = v0.readBuffer(v93, v95);
                v98 = v99;
                v95 = v100;
                v94.item_height_mode = v3.StringProp.decode(v98);
            else
                v98 = nil;
                v99, v100 = v0.readVarInt(v93, v95);
                v95 = v100 + v99;
            end;
        elseif v97 == v0.wireTypes.i32 then
            v98 = nil;
            v99, v100 = v0.readFixed32(v93, v95);
            v98 = v99;
            v95 = v100;
        elseif v97 == v0.wireTypes.i64 then
            v98 = nil;
            v99, v100 = v0.readFixed64(v93, v95);
            v98 = v99;
            v95 = v100;
        else
            error("Unsupported wire type: " .. v97);
        end;
    end;
    return v94;
end;
v6.jsonEncode = function(v101) --[[ Line: 543 ]] --[[ Name: jsonEncode ]]
    local v102 = {};
    if v101.collection_item_size ~= nil then
        v102.collectionItemSize = v101.collection_item_size:jsonEncode();
    end;
    if v101.item_height_from_width ~= nil then
        v102.itemHeightFromWidth = v101.item_height_from_width:jsonEncode();
    end;
    if v101.header_component ~= nil then
        v102.headerComponent = v101.header_component:jsonEncode();
    end;
    if v101.position ~= nil then
        v102.position = v101.position:jsonEncode();
    end;
    if v101.size ~= nil then
        v102.size = v101.size:jsonEncode();
    end;
    if v101.anchor_point ~= nil then
        v102.anchorPoint = v101.anchor_point:jsonEncode();
    end;
    if v101.scrolling_enabled_override ~= nil then
        v102.scrollingEnabledOverride = v101.scrolling_enabled_override:jsonEncode();
    end;
    if v101.force_scrollable ~= nil then
        v102.forceScrollable = v101.force_scrollable:jsonEncode();
    end;
    if v101.max_items_to_show ~= nil then
        v102.maxItemsToShow = v101.max_items_to_show:jsonEncode();
    end;
    if v101.should_use_frame_bounds_for_impressions ~= nil then
        v102.shouldUseFrameBoundsForImpressions = v101.should_use_frame_bounds_for_impressions:jsonEncode();
    end;
    if v101.background_mural_url ~= nil then
        v102.backgroundMuralUrl = v101.background_mural_url:jsonEncode();
    end;
    if v101.on_scroll_to_end ~= nil then
        v102.onScrollToEnd = v101.on_scroll_to_end:jsonEncode();
    end;
    if v101.scroll_threshold_from_end ~= nil then
        v102.scrollThresholdFromEnd = v101.scroll_threshold_from_end:jsonEncode();
    end;
    if v101.item_template_key ~= nil then
        v102.itemTemplateKey = v101.item_template_key:jsonEncode();
    end;
    if v101.focus_nav_actions_component ~= nil then
        v102.focusNavActionsComponent = v101.focus_nav_actions_component:jsonEncode();
    end;
    if v101.disable_selection_order ~= nil then
        v102.disableSelectionOrder = v101.disable_selection_order:jsonEncode();
    end;
    if v101.num_items_to_render_off_screen ~= nil then
        v102.numItemsToRenderOffScreen = v101.num_items_to_render_off_screen:jsonEncode();
    end;
    if v101.items ~= nil then
        v102.items = v101.items:jsonEncode();
    end;
    if v101.item_height_mode ~= nil then
        v102.itemHeightMode = v101.item_height_mode:jsonEncode();
    end;
    return v102;
end;
v6.jsonDecode = function(v103) --[[ Line: 625 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v104 = v6.new();
    if v103.collection_item_size ~= nil then
        v104.collection_item_size = v3.StringProp.jsonDecode(v103.collection_item_size);
    end;
    if v103.collectionItemSize ~= nil then
        v104.collection_item_size = v3.StringProp.jsonDecode(v103.collectionItemSize);
    end;
    if v103.item_height_from_width ~= nil then
        v104.item_height_from_width = v3.UDimProp.jsonDecode(v103.item_height_from_width);
    end;
    if v103.itemHeightFromWidth ~= nil then
        v104.item_height_from_width = v3.UDimProp.jsonDecode(v103.itemHeightFromWidth);
    end;
    if v103.header_component ~= nil then
        v104.header_component = v3.NestedComponentProp.jsonDecode(v103.header_component);
    end;
    if v103.headerComponent ~= nil then
        v104.header_component = v3.NestedComponentProp.jsonDecode(v103.headerComponent);
    end;
    if v103.position ~= nil then
        v104.position = v3.UDim2Prop.jsonDecode(v103.position);
    end;
    if v103.size ~= nil then
        v104.size = v3.UDim2Prop.jsonDecode(v103.size);
    end;
    if v103.anchor_point ~= nil then
        v104.anchor_point = v3.Vector2Prop.jsonDecode(v103.anchor_point);
    end;
    if v103.anchorPoint ~= nil then
        v104.anchor_point = v3.Vector2Prop.jsonDecode(v103.anchorPoint);
    end;
    if v103.scrolling_enabled_override ~= nil then
        v104.scrolling_enabled_override = v3.BoolProp.jsonDecode(v103.scrolling_enabled_override);
    end;
    if v103.scrollingEnabledOverride ~= nil then
        v104.scrolling_enabled_override = v3.BoolProp.jsonDecode(v103.scrollingEnabledOverride);
    end;
    if v103.force_scrollable ~= nil then
        v104.force_scrollable = v3.BoolProp.jsonDecode(v103.force_scrollable);
    end;
    if v103.forceScrollable ~= nil then
        v104.force_scrollable = v3.BoolProp.jsonDecode(v103.forceScrollable);
    end;
    if v103.max_items_to_show ~= nil then
        v104.max_items_to_show = v3.FloatProp.jsonDecode(v103.max_items_to_show);
    end;
    if v103.maxItemsToShow ~= nil then
        v104.max_items_to_show = v3.FloatProp.jsonDecode(v103.maxItemsToShow);
    end;
    if v103.should_use_frame_bounds_for_impressions ~= nil then
        v104.should_use_frame_bounds_for_impressions = v3.BoolProp.jsonDecode(v103.should_use_frame_bounds_for_impressions);
    end;
    if v103.shouldUseFrameBoundsForImpressions ~= nil then
        v104.should_use_frame_bounds_for_impressions = v3.BoolProp.jsonDecode(v103.shouldUseFrameBoundsForImpressions);
    end;
    if v103.background_mural_url ~= nil then
        v104.background_mural_url = v3.ImageStringProp.jsonDecode(v103.background_mural_url);
    end;
    if v103.backgroundMuralUrl ~= nil then
        v104.background_mural_url = v3.ImageStringProp.jsonDecode(v103.backgroundMuralUrl);
    end;
    if v103.on_scroll_to_end ~= nil then
        v104.on_scroll_to_end = v4.ActionProp.jsonDecode(v103.on_scroll_to_end);
    end;
    if v103.onScrollToEnd ~= nil then
        v104.on_scroll_to_end = v4.ActionProp.jsonDecode(v103.onScrollToEnd);
    end;
    if v103.scroll_threshold_from_end ~= nil then
        v104.scroll_threshold_from_end = v3.FloatProp.jsonDecode(v103.scroll_threshold_from_end);
    end;
    if v103.scrollThresholdFromEnd ~= nil then
        v104.scroll_threshold_from_end = v3.FloatProp.jsonDecode(v103.scrollThresholdFromEnd);
    end;
    if v103.item_template_key ~= nil then
        v104.item_template_key = v3.StringProp.jsonDecode(v103.item_template_key);
    end;
    if v103.itemTemplateKey ~= nil then
        v104.item_template_key = v3.StringProp.jsonDecode(v103.itemTemplateKey);
    end;
    if v103.focus_nav_actions_component ~= nil then
        v104.focus_nav_actions_component = v3.NestedComponentProp.jsonDecode(v103.focus_nav_actions_component);
    end;
    if v103.focusNavActionsComponent ~= nil then
        v104.focus_nav_actions_component = v3.NestedComponentProp.jsonDecode(v103.focusNavActionsComponent);
    end;
    if v103.disable_selection_order ~= nil then
        v104.disable_selection_order = v3.BoolProp.jsonDecode(v103.disable_selection_order);
    end;
    if v103.disableSelectionOrder ~= nil then
        v104.disable_selection_order = v3.BoolProp.jsonDecode(v103.disableSelectionOrder);
    end;
    if v103.num_items_to_render_off_screen ~= nil then
        v104.num_items_to_render_off_screen = v3.FloatProp.jsonDecode(v103.num_items_to_render_off_screen);
    end;
    if v103.numItemsToRenderOffScreen ~= nil then
        v104.num_items_to_render_off_screen = v3.FloatProp.jsonDecode(v103.numItemsToRenderOffScreen);
    end;
    if v103.items ~= nil then
        v104.items = v3.LazyNestedComponentListProp.jsonDecode(v103.items);
    end;
    if v103.item_height_mode ~= nil then
        v104.item_height_mode = v3.StringProp.jsonDecode(v103.item_height_mode);
    end;
    if v103.itemHeightMode ~= nil then
        v104.item_height_mode = v3.StringProp.jsonDecode(v103.itemHeightMode);
    end;
    return v104;
end;
v6.descriptor = {
    name = "CollectionCarouselSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CollectionCarouselSchema_Props = v6;
v1.default:register(v2.CollectionCarouselSchema_Props);
return {
    CollectionCarouselSchema = v2.CollectionCarouselSchema, 
    CollectionCarouselSchema_Props = v2.CollectionCarouselSchema_Props
};