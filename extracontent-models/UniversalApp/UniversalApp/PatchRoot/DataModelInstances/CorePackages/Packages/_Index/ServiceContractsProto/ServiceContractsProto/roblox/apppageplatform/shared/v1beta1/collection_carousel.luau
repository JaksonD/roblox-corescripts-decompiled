local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 110 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 117 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 138 ]] --[[ Name: decode ]]
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
v6.jsonEncode = function(v27) --[[ Line: 186 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 200 ]] --[[ Name: jsonDecode ]]
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
v6.new = function(v31) --[[ Line: 229 ]] --[[ Name: new ]]
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
        items = if not (v31 ~= nil) or v31.items == nil then nil else v31.items
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 273 ]] --[[ Name: encode ]]
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
    local v89 = buffer.create(v34);
    buffer.copy(v89, 0, v33, 0, v34);
    return v89;
end;
v6.decode = function(v90) --[[ Line: 390 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v91 = v6.new();
    local v92 = 0;
    while v92 < buffer.len(v90) do
        local v93 = nil;
        local v94 = nil;
        local v95, v96, v97 = v0.readTag(v90, v92);
        v93 = v95;
        v94 = v96;
        v92 = v97;
        if v94 == v0.wireTypes.varint then
            v95 = nil;
            v96, v97 = v0.readVarInt(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.lengthDelimited then
            if v93 == 1 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.collection_item_size = v3.StringProp.decode(v95);
            elseif v93 == 2 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.item_height_from_width = v3.UDimProp.decode(v95);
            elseif v93 == 3 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.header_component = v3.NestedComponentProp.decode(v95);
            elseif v93 == 4 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.position = v3.UDim2Prop.decode(v95);
            elseif v93 == 5 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.size = v3.UDim2Prop.decode(v95);
            elseif v93 == 6 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.anchor_point = v3.Vector2Prop.decode(v95);
            elseif v93 == 7 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.scrolling_enabled_override = v3.BoolProp.decode(v95);
            elseif v93 == 8 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.force_scrollable = v3.BoolProp.decode(v95);
            elseif v93 == 9 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.max_items_to_show = v3.FloatProp.decode(v95);
            elseif v93 == 10 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.should_use_frame_bounds_for_impressions = v3.BoolProp.decode(v95);
            elseif v93 == 11 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.background_mural_url = v3.ImageStringProp.decode(v95);
            elseif v93 == 12 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.on_scroll_to_end = v4.ActionProp.decode(v95);
            elseif v93 == 13 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.scroll_threshold_from_end = v3.FloatProp.decode(v95);
            elseif v93 == 14 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.item_template_key = v3.StringProp.decode(v95);
            elseif v93 == 15 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.focus_nav_actions_component = v3.NestedComponentProp.decode(v95);
            elseif v93 == 16 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.disable_selection_order = v3.BoolProp.decode(v95);
            elseif v93 == 17 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.num_items_to_render_off_screen = v3.FloatProp.decode(v95);
            elseif v93 == 18 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v91.items = v3.LazyNestedComponentListProp.decode(v95);
            else
                v95 = nil;
                v96, v97 = v0.readVarInt(v90, v92);
                v92 = v97 + v96;
            end;
        elseif v94 == v0.wireTypes.i32 then
            v95 = nil;
            v96, v97 = v0.readFixed32(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.i64 then
            v95 = nil;
            v96, v97 = v0.readFixed64(v90, v92);
            v95 = v96;
            v92 = v97;
        else
            error("Unsupported wire type: " .. v94);
        end;
    end;
    return v91;
end;
v6.jsonEncode = function(v98) --[[ Line: 529 ]] --[[ Name: jsonEncode ]]
    local v99 = {};
    if v98.collection_item_size ~= nil then
        v99.collectionItemSize = v98.collection_item_size:jsonEncode();
    end;
    if v98.item_height_from_width ~= nil then
        v99.itemHeightFromWidth = v98.item_height_from_width:jsonEncode();
    end;
    if v98.header_component ~= nil then
        v99.headerComponent = v98.header_component:jsonEncode();
    end;
    if v98.position ~= nil then
        v99.position = v98.position:jsonEncode();
    end;
    if v98.size ~= nil then
        v99.size = v98.size:jsonEncode();
    end;
    if v98.anchor_point ~= nil then
        v99.anchorPoint = v98.anchor_point:jsonEncode();
    end;
    if v98.scrolling_enabled_override ~= nil then
        v99.scrollingEnabledOverride = v98.scrolling_enabled_override:jsonEncode();
    end;
    if v98.force_scrollable ~= nil then
        v99.forceScrollable = v98.force_scrollable:jsonEncode();
    end;
    if v98.max_items_to_show ~= nil then
        v99.maxItemsToShow = v98.max_items_to_show:jsonEncode();
    end;
    if v98.should_use_frame_bounds_for_impressions ~= nil then
        v99.shouldUseFrameBoundsForImpressions = v98.should_use_frame_bounds_for_impressions:jsonEncode();
    end;
    if v98.background_mural_url ~= nil then
        v99.backgroundMuralUrl = v98.background_mural_url:jsonEncode();
    end;
    if v98.on_scroll_to_end ~= nil then
        v99.onScrollToEnd = v98.on_scroll_to_end:jsonEncode();
    end;
    if v98.scroll_threshold_from_end ~= nil then
        v99.scrollThresholdFromEnd = v98.scroll_threshold_from_end:jsonEncode();
    end;
    if v98.item_template_key ~= nil then
        v99.itemTemplateKey = v98.item_template_key:jsonEncode();
    end;
    if v98.focus_nav_actions_component ~= nil then
        v99.focusNavActionsComponent = v98.focus_nav_actions_component:jsonEncode();
    end;
    if v98.disable_selection_order ~= nil then
        v99.disableSelectionOrder = v98.disable_selection_order:jsonEncode();
    end;
    if v98.num_items_to_render_off_screen ~= nil then
        v99.numItemsToRenderOffScreen = v98.num_items_to_render_off_screen:jsonEncode();
    end;
    if v98.items ~= nil then
        v99.items = v98.items:jsonEncode();
    end;
    return v99;
end;
v6.jsonDecode = function(v100) --[[ Line: 607 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v101 = v6.new();
    if v100.collection_item_size ~= nil then
        v101.collection_item_size = v3.StringProp.jsonDecode(v100.collection_item_size);
    end;
    if v100.collectionItemSize ~= nil then
        v101.collection_item_size = v3.StringProp.jsonDecode(v100.collectionItemSize);
    end;
    if v100.item_height_from_width ~= nil then
        v101.item_height_from_width = v3.UDimProp.jsonDecode(v100.item_height_from_width);
    end;
    if v100.itemHeightFromWidth ~= nil then
        v101.item_height_from_width = v3.UDimProp.jsonDecode(v100.itemHeightFromWidth);
    end;
    if v100.header_component ~= nil then
        v101.header_component = v3.NestedComponentProp.jsonDecode(v100.header_component);
    end;
    if v100.headerComponent ~= nil then
        v101.header_component = v3.NestedComponentProp.jsonDecode(v100.headerComponent);
    end;
    if v100.position ~= nil then
        v101.position = v3.UDim2Prop.jsonDecode(v100.position);
    end;
    if v100.size ~= nil then
        v101.size = v3.UDim2Prop.jsonDecode(v100.size);
    end;
    if v100.anchor_point ~= nil then
        v101.anchor_point = v3.Vector2Prop.jsonDecode(v100.anchor_point);
    end;
    if v100.anchorPoint ~= nil then
        v101.anchor_point = v3.Vector2Prop.jsonDecode(v100.anchorPoint);
    end;
    if v100.scrolling_enabled_override ~= nil then
        v101.scrolling_enabled_override = v3.BoolProp.jsonDecode(v100.scrolling_enabled_override);
    end;
    if v100.scrollingEnabledOverride ~= nil then
        v101.scrolling_enabled_override = v3.BoolProp.jsonDecode(v100.scrollingEnabledOverride);
    end;
    if v100.force_scrollable ~= nil then
        v101.force_scrollable = v3.BoolProp.jsonDecode(v100.force_scrollable);
    end;
    if v100.forceScrollable ~= nil then
        v101.force_scrollable = v3.BoolProp.jsonDecode(v100.forceScrollable);
    end;
    if v100.max_items_to_show ~= nil then
        v101.max_items_to_show = v3.FloatProp.jsonDecode(v100.max_items_to_show);
    end;
    if v100.maxItemsToShow ~= nil then
        v101.max_items_to_show = v3.FloatProp.jsonDecode(v100.maxItemsToShow);
    end;
    if v100.should_use_frame_bounds_for_impressions ~= nil then
        v101.should_use_frame_bounds_for_impressions = v3.BoolProp.jsonDecode(v100.should_use_frame_bounds_for_impressions);
    end;
    if v100.shouldUseFrameBoundsForImpressions ~= nil then
        v101.should_use_frame_bounds_for_impressions = v3.BoolProp.jsonDecode(v100.shouldUseFrameBoundsForImpressions);
    end;
    if v100.background_mural_url ~= nil then
        v101.background_mural_url = v3.ImageStringProp.jsonDecode(v100.background_mural_url);
    end;
    if v100.backgroundMuralUrl ~= nil then
        v101.background_mural_url = v3.ImageStringProp.jsonDecode(v100.backgroundMuralUrl);
    end;
    if v100.on_scroll_to_end ~= nil then
        v101.on_scroll_to_end = v4.ActionProp.jsonDecode(v100.on_scroll_to_end);
    end;
    if v100.onScrollToEnd ~= nil then
        v101.on_scroll_to_end = v4.ActionProp.jsonDecode(v100.onScrollToEnd);
    end;
    if v100.scroll_threshold_from_end ~= nil then
        v101.scroll_threshold_from_end = v3.FloatProp.jsonDecode(v100.scroll_threshold_from_end);
    end;
    if v100.scrollThresholdFromEnd ~= nil then
        v101.scroll_threshold_from_end = v3.FloatProp.jsonDecode(v100.scrollThresholdFromEnd);
    end;
    if v100.item_template_key ~= nil then
        v101.item_template_key = v3.StringProp.jsonDecode(v100.item_template_key);
    end;
    if v100.itemTemplateKey ~= nil then
        v101.item_template_key = v3.StringProp.jsonDecode(v100.itemTemplateKey);
    end;
    if v100.focus_nav_actions_component ~= nil then
        v101.focus_nav_actions_component = v3.NestedComponentProp.jsonDecode(v100.focus_nav_actions_component);
    end;
    if v100.focusNavActionsComponent ~= nil then
        v101.focus_nav_actions_component = v3.NestedComponentProp.jsonDecode(v100.focusNavActionsComponent);
    end;
    if v100.disable_selection_order ~= nil then
        v101.disable_selection_order = v3.BoolProp.jsonDecode(v100.disable_selection_order);
    end;
    if v100.disableSelectionOrder ~= nil then
        v101.disable_selection_order = v3.BoolProp.jsonDecode(v100.disableSelectionOrder);
    end;
    if v100.num_items_to_render_off_screen ~= nil then
        v101.num_items_to_render_off_screen = v3.FloatProp.jsonDecode(v100.num_items_to_render_off_screen);
    end;
    if v100.numItemsToRenderOffScreen ~= nil then
        v101.num_items_to_render_off_screen = v3.FloatProp.jsonDecode(v100.numItemsToRenderOffScreen);
    end;
    if v100.items ~= nil then
        v101.items = v3.LazyNestedComponentListProp.jsonDecode(v100.items);
    end;
    return v101;
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