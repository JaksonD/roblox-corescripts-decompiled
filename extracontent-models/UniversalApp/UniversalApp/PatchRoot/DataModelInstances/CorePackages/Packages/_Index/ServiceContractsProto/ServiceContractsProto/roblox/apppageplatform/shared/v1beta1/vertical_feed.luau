local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.actions);
local v4 = require(script.Parent.prop_types);
local v5 = require(script.Parent.prop_types_engine);
local v6 = require(script.Parent.component_shared);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 105 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        props = if not (v9 ~= nil) or v9.props == nil then nil else v9.props, 
        shared = if not (v9 ~= nil) or v9.shared == nil then nil else v9.shared
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 112 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.props ~= nil then
        local v13 = v10.props:encode();
        local v14, v15 = v0.writeTag(v11, v12, 1, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v11 = v14;
        v12 = v15;
    end;
    if v10.shared ~= nil then
        local v16 = v10.shared:encode();
        local v17, v18 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
        v17, v18 = v0.writeBuffer(v17, v18, v16, buffer.len(v16));
        v11 = v17;
        v12 = v18;
    end;
    local v19 = buffer.create(v12);
    buffer.copy(v19, 0, v11, 0, v12);
    return v19;
end;
v7.decode = function(v20) --[[ Line: 133 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v2 (copy), v6 (copy)
    local v21 = l_v7_0.new();
    local v22 = 0;
    while v22 < buffer.len(v20) do
        local v23 = nil;
        local v24 = nil;
        local v25, v26, v27 = v0.readTag(v20, v22);
        v23 = v25;
        v24 = v26;
        v22 = v27;
        if v24 == v0.wireTypes.varint then
            v25 = nil;
            v26, v27 = v0.readVarInt(v20, v22);
            v25 = v26;
            v22 = v27;
        elseif v24 == v0.wireTypes.lengthDelimited then
            if v23 == 1 then
                v25 = nil;
                v26, v27 = v0.readBuffer(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.props = v2.VerticalFeedSchema_Props.decode(v25);
            elseif v23 == 2 then
                v25 = nil;
                v26, v27 = v0.readBuffer(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.shared = v6.ComponentShared.decode(v25);
            else
                v25 = nil;
                v26, v27 = v0.readVarInt(v20, v22);
                v22 = v27 + v26;
            end;
        elseif v24 == v0.wireTypes.i32 then
            v25 = nil;
            v26, v27 = v0.readFixed32(v20, v22);
            v25 = v26;
            v22 = v27;
        elseif v24 == v0.wireTypes.i64 then
            v25 = nil;
            v26, v27 = v0.readFixed64(v20, v22);
            v25 = v26;
            v22 = v27;
        else
            error("Unsupported wire type: " .. v24);
        end;
    end;
    return v21;
end;
v7.jsonEncode = function(v28) --[[ Line: 181 ]] --[[ Name: jsonEncode ]]
    local v29 = {};
    if v28.props ~= nil then
        v29.props = v28.props:jsonEncode();
    end;
    if v28.shared ~= nil then
        v29.shared = v28.shared:jsonEncode();
    end;
    return v29;
end;
v7.jsonDecode = function(v30) --[[ Line: 195 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy), v6 (copy)
    local v31 = l_v7_0.new();
    if v30.props ~= nil then
        v31.props = v2.VerticalFeedSchema_Props.jsonDecode(v30.props);
    end;
    if v30.shared ~= nil then
        v31.shared = v6.ComponentShared.jsonDecode(v30.shared);
    end;
    return v31;
end;
v7.descriptor = {
    name = "VerticalFeedSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedSchema"
};
v2.VerticalFeedSchema = v7;
v1.default:register(v2.VerticalFeedSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v32) --[[ Line: 224 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        layout_order = if not (v32 ~= nil) or v32.layout_order == nil then nil else v32.layout_order, 
        feed_items = if not (v32 ~= nil) or v32.feed_items == nil then nil else v32.feed_items, 
        threshold_from_end = if not (v32 ~= nil) or v32.threshold_from_end == nil then nil else v32.threshold_from_end, 
        on_scroll_to_end = if not (v32 ~= nil) or v32.on_scroll_to_end == nil then nil else v32.on_scroll_to_end, 
        background_style = if not (v32 ~= nil) or v32.background_style == nil then nil else v32.background_style, 
        horizontal_alignment = if not (v32 ~= nil) or v32.horizontal_alignment == nil then nil else v32.horizontal_alignment, 
        horizontal_padding = if not (v32 ~= nil) or v32.horizontal_padding == nil then nil else v32.horizontal_padding, 
        gap_between_feed_items = if not (v32 ~= nil) or v32.gap_between_feed_items == nil then nil else v32.gap_between_feed_items, 
        impressions_tag = if not (v32 ~= nil) or v32.impressions_tag == nil then nil else v32.impressions_tag, 
        selection_behavior_left = if not (v32 ~= nil) or v32.selection_behavior_left == nil then nil else v32.selection_behavior_left, 
        selection_behavior_right = if not (v32 ~= nil) or v32.selection_behavior_right == nil then nil else v32.selection_behavior_right, 
        on_refresh = if not (v32 ~= nil) or v32.on_refresh == nil then nil else v32.on_refresh, 
        sticky_items = if not (v32 ~= nil) or v32.sticky_items == nil then nil else v32.sticky_items, 
        gap_after_sticky_items = if not (v32 ~= nil) or v32.gap_after_sticky_items == nil then nil else v32.gap_after_sticky_items, 
        gap_between_sticky_items = if not (v32 ~= nil) or v32.gap_between_sticky_items == nil then nil else v32.gap_between_sticky_items, 
        sticky_padding_top = if not (v32 ~= nil) or v32.sticky_padding_top == nil then nil else v32.sticky_padding_top, 
        sticky_padding_bottom = if not (v32 ~= nil) or v32.sticky_padding_bottom == nil then nil else v32.sticky_padding_bottom, 
        sticky_content_tag = if not (v32 ~= nil) or v32.sticky_content_tag == nil then nil else v32.sticky_content_tag
    }, v7));
end;
v7.encode = function(v33) --[[ Line: 261 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.layout_order ~= nil then
        local v36 = v33.layout_order:encode();
        local v37, v38 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
        v34 = v37;
        v35 = v38;
    end;
    if v33.feed_items ~= nil then
        local v39 = v33.feed_items:encode();
        local v40, v41 = v0.writeTag(v34, v35, 2, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v34 = v40;
        v35 = v41;
    end;
    if v33.threshold_from_end ~= nil then
        local v42 = v33.threshold_from_end:encode();
        local v43, v44 = v0.writeTag(v34, v35, 3, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
        v34 = v43;
        v35 = v44;
    end;
    if v33.on_scroll_to_end ~= nil then
        local v45 = v33.on_scroll_to_end:encode();
        local v46, v47 = v0.writeTag(v34, v35, 4, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
        v34 = v46;
        v35 = v47;
    end;
    if v33.background_style ~= nil then
        local v48 = v33.background_style:encode();
        local v49, v50 = v0.writeTag(v34, v35, 5, v0.wireTypes.lengthDelimited);
        v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
        v34 = v49;
        v35 = v50;
    end;
    if v33.horizontal_alignment ~= nil then
        local v51 = v33.horizontal_alignment:encode();
        local v52, v53 = v0.writeTag(v34, v35, 6, v0.wireTypes.lengthDelimited);
        v52, v53 = v0.writeBuffer(v52, v53, v51, buffer.len(v51));
        v34 = v52;
        v35 = v53;
    end;
    if v33.horizontal_padding ~= nil then
        local v54 = v33.horizontal_padding:encode();
        local v55, v56 = v0.writeTag(v34, v35, 7, v0.wireTypes.lengthDelimited);
        v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
        v34 = v55;
        v35 = v56;
    end;
    if v33.gap_between_feed_items ~= nil then
        local v57 = v33.gap_between_feed_items:encode();
        local v58, v59 = v0.writeTag(v34, v35, 8, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
        v34 = v58;
        v35 = v59;
    end;
    if v33.impressions_tag ~= nil then
        local v60 = v33.impressions_tag:encode();
        local v61, v62 = v0.writeTag(v34, v35, 9, v0.wireTypes.lengthDelimited);
        v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
        v34 = v61;
        v35 = v62;
    end;
    if v33.selection_behavior_left ~= nil then
        local v63 = v33.selection_behavior_left:encode();
        local v64, v65 = v0.writeTag(v34, v35, 10, v0.wireTypes.lengthDelimited);
        v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
        v34 = v64;
        v35 = v65;
    end;
    if v33.selection_behavior_right ~= nil then
        local v66 = v33.selection_behavior_right:encode();
        local v67, v68 = v0.writeTag(v34, v35, 11, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
        v34 = v67;
        v35 = v68;
    end;
    if v33.on_refresh ~= nil then
        local v69 = v33.on_refresh:encode();
        local v70, v71 = v0.writeTag(v34, v35, 12, v0.wireTypes.lengthDelimited);
        v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
        v34 = v70;
        v35 = v71;
    end;
    if v33.sticky_items ~= nil then
        local v72 = v33.sticky_items:encode();
        local v73, v74 = v0.writeTag(v34, v35, 13, v0.wireTypes.lengthDelimited);
        v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
        v34 = v73;
        v35 = v74;
    end;
    if v33.gap_after_sticky_items ~= nil then
        local v75 = v33.gap_after_sticky_items:encode();
        local v76, v77 = v0.writeTag(v34, v35, 14, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
        v34 = v76;
        v35 = v77;
    end;
    if v33.gap_between_sticky_items ~= nil then
        local v78 = v33.gap_between_sticky_items:encode();
        local v79, v80 = v0.writeTag(v34, v35, 15, v0.wireTypes.lengthDelimited);
        v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
        v34 = v79;
        v35 = v80;
    end;
    if v33.sticky_padding_top ~= nil then
        local v81 = v33.sticky_padding_top:encode();
        local v82, v83 = v0.writeTag(v34, v35, 16, v0.wireTypes.lengthDelimited);
        v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
        v34 = v82;
        v35 = v83;
    end;
    if v33.sticky_padding_bottom ~= nil then
        local v84 = v33.sticky_padding_bottom:encode();
        local v85, v86 = v0.writeTag(v34, v35, 17, v0.wireTypes.lengthDelimited);
        v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
        v34 = v85;
        v35 = v86;
    end;
    if v33.sticky_content_tag ~= nil then
        local v87 = v33.sticky_content_tag:encode();
        local v88, v89 = v0.writeTag(v34, v35, 18, v0.wireTypes.lengthDelimited);
        v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
        v34 = v88;
        v35 = v89;
    end;
    local v90 = buffer.create(v35);
    buffer.copy(v90, 0, v34, 0, v35);
    return v90;
end;
v7.decode = function(v91) --[[ Line: 378 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v92 = v7.new();
    local v93 = 0;
    while v93 < buffer.len(v91) do
        local v94 = nil;
        local v95 = nil;
        local v96, v97, v98 = v0.readTag(v91, v93);
        v94 = v96;
        v95 = v97;
        v93 = v98;
        if v95 == v0.wireTypes.varint then
            v96 = nil;
            v97, v98 = v0.readVarInt(v91, v93);
            v96 = v97;
            v93 = v98;
        elseif v95 == v0.wireTypes.lengthDelimited then
            if v94 == 1 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.layout_order = v4.Int32Prop.decode(v96);
            elseif v94 == 2 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.feed_items = v4.LazyNestedComponentListProp.decode(v96);
            elseif v94 == 3 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.threshold_from_end = v4.Int32Prop.decode(v96);
            elseif v94 == 4 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.on_scroll_to_end = v3.ActionProp.decode(v96);
            elseif v94 == 5 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.background_style = v4.ColorProp.decode(v96);
            elseif v94 == 6 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.horizontal_alignment = v5.HorizontalAlignmentProp.decode(v96);
            elseif v94 == 7 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.horizontal_padding = v4.Int32Prop.decode(v96);
            elseif v94 == 8 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.gap_between_feed_items = v4.Int32Prop.decode(v96);
            elseif v94 == 9 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.impressions_tag = v4.StringProp.decode(v96);
            elseif v94 == 10 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.selection_behavior_left = v5.SelectionBehaviorProp.decode(v96);
            elseif v94 == 11 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.selection_behavior_right = v5.SelectionBehaviorProp.decode(v96);
            elseif v94 == 12 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.on_refresh = v3.ActionProp.decode(v96);
            elseif v94 == 13 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.sticky_items = v4.LazyNestedComponentListProp.decode(v96);
            elseif v94 == 14 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.gap_after_sticky_items = v4.Int32Prop.decode(v96);
            elseif v94 == 15 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.gap_between_sticky_items = v4.Int32Prop.decode(v96);
            elseif v94 == 16 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.sticky_padding_top = v4.Int32Prop.decode(v96);
            elseif v94 == 17 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.sticky_padding_bottom = v4.Int32Prop.decode(v96);
            elseif v94 == 18 then
                v96 = nil;
                v97, v98 = v0.readBuffer(v91, v93);
                v96 = v97;
                v93 = v98;
                v92.sticky_content_tag = v4.StringProp.decode(v96);
            else
                v96 = nil;
                v97, v98 = v0.readVarInt(v91, v93);
                v93 = v98 + v97;
            end;
        elseif v95 == v0.wireTypes.i32 then
            v96 = nil;
            v97, v98 = v0.readFixed32(v91, v93);
            v96 = v97;
            v93 = v98;
        elseif v95 == v0.wireTypes.i64 then
            v96 = nil;
            v97, v98 = v0.readFixed64(v91, v93);
            v96 = v97;
            v93 = v98;
        else
            error("Unsupported wire type: " .. v95);
        end;
    end;
    return v92;
end;
v7.jsonEncode = function(v99) --[[ Line: 515 ]] --[[ Name: jsonEncode ]]
    local v100 = {};
    if v99.layout_order ~= nil then
        v100.layoutOrder = v99.layout_order:jsonEncode();
    end;
    if v99.feed_items ~= nil then
        v100.feedItems = v99.feed_items:jsonEncode();
    end;
    if v99.threshold_from_end ~= nil then
        v100.thresholdFromEnd = v99.threshold_from_end:jsonEncode();
    end;
    if v99.on_scroll_to_end ~= nil then
        v100.onScrollToEnd = v99.on_scroll_to_end:jsonEncode();
    end;
    if v99.background_style ~= nil then
        v100.backgroundStyle = v99.background_style:jsonEncode();
    end;
    if v99.horizontal_alignment ~= nil then
        v100.horizontalAlignment = v99.horizontal_alignment:jsonEncode();
    end;
    if v99.horizontal_padding ~= nil then
        v100.horizontalPadding = v99.horizontal_padding:jsonEncode();
    end;
    if v99.gap_between_feed_items ~= nil then
        v100.gapBetweenFeedItems = v99.gap_between_feed_items:jsonEncode();
    end;
    if v99.impressions_tag ~= nil then
        v100.impressionsTag = v99.impressions_tag:jsonEncode();
    end;
    if v99.selection_behavior_left ~= nil then
        v100.selectionBehaviorLeft = v99.selection_behavior_left:jsonEncode();
    end;
    if v99.selection_behavior_right ~= nil then
        v100.selectionBehaviorRight = v99.selection_behavior_right:jsonEncode();
    end;
    if v99.on_refresh ~= nil then
        v100.onRefresh = v99.on_refresh:jsonEncode();
    end;
    if v99.sticky_items ~= nil then
        v100.stickyItems = v99.sticky_items:jsonEncode();
    end;
    if v99.gap_after_sticky_items ~= nil then
        v100.gapAfterStickyItems = v99.gap_after_sticky_items:jsonEncode();
    end;
    if v99.gap_between_sticky_items ~= nil then
        v100.gapBetweenStickyItems = v99.gap_between_sticky_items:jsonEncode();
    end;
    if v99.sticky_padding_top ~= nil then
        v100.stickyPaddingTop = v99.sticky_padding_top:jsonEncode();
    end;
    if v99.sticky_padding_bottom ~= nil then
        v100.stickyPaddingBottom = v99.sticky_padding_bottom:jsonEncode();
    end;
    if v99.sticky_content_tag ~= nil then
        v100.stickyContentTag = v99.sticky_content_tag:jsonEncode();
    end;
    return v100;
end;
v7.jsonDecode = function(v101) --[[ Line: 593 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v102 = v7.new();
    if v101.layout_order ~= nil then
        v102.layout_order = v4.Int32Prop.jsonDecode(v101.layout_order);
    end;
    if v101.layoutOrder ~= nil then
        v102.layout_order = v4.Int32Prop.jsonDecode(v101.layoutOrder);
    end;
    if v101.feed_items ~= nil then
        v102.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v101.feed_items);
    end;
    if v101.feedItems ~= nil then
        v102.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v101.feedItems);
    end;
    if v101.threshold_from_end ~= nil then
        v102.threshold_from_end = v4.Int32Prop.jsonDecode(v101.threshold_from_end);
    end;
    if v101.thresholdFromEnd ~= nil then
        v102.threshold_from_end = v4.Int32Prop.jsonDecode(v101.thresholdFromEnd);
    end;
    if v101.on_scroll_to_end ~= nil then
        v102.on_scroll_to_end = v3.ActionProp.jsonDecode(v101.on_scroll_to_end);
    end;
    if v101.onScrollToEnd ~= nil then
        v102.on_scroll_to_end = v3.ActionProp.jsonDecode(v101.onScrollToEnd);
    end;
    if v101.background_style ~= nil then
        v102.background_style = v4.ColorProp.jsonDecode(v101.background_style);
    end;
    if v101.backgroundStyle ~= nil then
        v102.background_style = v4.ColorProp.jsonDecode(v101.backgroundStyle);
    end;
    if v101.horizontal_alignment ~= nil then
        v102.horizontal_alignment = v5.HorizontalAlignmentProp.jsonDecode(v101.horizontal_alignment);
    end;
    if v101.horizontalAlignment ~= nil then
        v102.horizontal_alignment = v5.HorizontalAlignmentProp.jsonDecode(v101.horizontalAlignment);
    end;
    if v101.horizontal_padding ~= nil then
        v102.horizontal_padding = v4.Int32Prop.jsonDecode(v101.horizontal_padding);
    end;
    if v101.horizontalPadding ~= nil then
        v102.horizontal_padding = v4.Int32Prop.jsonDecode(v101.horizontalPadding);
    end;
    if v101.gap_between_feed_items ~= nil then
        v102.gap_between_feed_items = v4.Int32Prop.jsonDecode(v101.gap_between_feed_items);
    end;
    if v101.gapBetweenFeedItems ~= nil then
        v102.gap_between_feed_items = v4.Int32Prop.jsonDecode(v101.gapBetweenFeedItems);
    end;
    if v101.impressions_tag ~= nil then
        v102.impressions_tag = v4.StringProp.jsonDecode(v101.impressions_tag);
    end;
    if v101.impressionsTag ~= nil then
        v102.impressions_tag = v4.StringProp.jsonDecode(v101.impressionsTag);
    end;
    if v101.selection_behavior_left ~= nil then
        v102.selection_behavior_left = v5.SelectionBehaviorProp.jsonDecode(v101.selection_behavior_left);
    end;
    if v101.selectionBehaviorLeft ~= nil then
        v102.selection_behavior_left = v5.SelectionBehaviorProp.jsonDecode(v101.selectionBehaviorLeft);
    end;
    if v101.selection_behavior_right ~= nil then
        v102.selection_behavior_right = v5.SelectionBehaviorProp.jsonDecode(v101.selection_behavior_right);
    end;
    if v101.selectionBehaviorRight ~= nil then
        v102.selection_behavior_right = v5.SelectionBehaviorProp.jsonDecode(v101.selectionBehaviorRight);
    end;
    if v101.on_refresh ~= nil then
        v102.on_refresh = v3.ActionProp.jsonDecode(v101.on_refresh);
    end;
    if v101.onRefresh ~= nil then
        v102.on_refresh = v3.ActionProp.jsonDecode(v101.onRefresh);
    end;
    if v101.sticky_items ~= nil then
        v102.sticky_items = v4.LazyNestedComponentListProp.jsonDecode(v101.sticky_items);
    end;
    if v101.stickyItems ~= nil then
        v102.sticky_items = v4.LazyNestedComponentListProp.jsonDecode(v101.stickyItems);
    end;
    if v101.gap_after_sticky_items ~= nil then
        v102.gap_after_sticky_items = v4.Int32Prop.jsonDecode(v101.gap_after_sticky_items);
    end;
    if v101.gapAfterStickyItems ~= nil then
        v102.gap_after_sticky_items = v4.Int32Prop.jsonDecode(v101.gapAfterStickyItems);
    end;
    if v101.gap_between_sticky_items ~= nil then
        v102.gap_between_sticky_items = v4.Int32Prop.jsonDecode(v101.gap_between_sticky_items);
    end;
    if v101.gapBetweenStickyItems ~= nil then
        v102.gap_between_sticky_items = v4.Int32Prop.jsonDecode(v101.gapBetweenStickyItems);
    end;
    if v101.sticky_padding_top ~= nil then
        v102.sticky_padding_top = v4.Int32Prop.jsonDecode(v101.sticky_padding_top);
    end;
    if v101.stickyPaddingTop ~= nil then
        v102.sticky_padding_top = v4.Int32Prop.jsonDecode(v101.stickyPaddingTop);
    end;
    if v101.sticky_padding_bottom ~= nil then
        v102.sticky_padding_bottom = v4.Int32Prop.jsonDecode(v101.sticky_padding_bottom);
    end;
    if v101.stickyPaddingBottom ~= nil then
        v102.sticky_padding_bottom = v4.Int32Prop.jsonDecode(v101.stickyPaddingBottom);
    end;
    if v101.sticky_content_tag ~= nil then
        v102.sticky_content_tag = v4.StringProp.jsonDecode(v101.sticky_content_tag);
    end;
    if v101.stickyContentTag ~= nil then
        v102.sticky_content_tag = v4.StringProp.jsonDecode(v101.stickyContentTag);
    end;
    return v102;
end;
v7.descriptor = {
    name = "VerticalFeedSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.VerticalFeedSchema_Props = v7;
v1.default:register(v2.VerticalFeedSchema_Props);
return {
    VerticalFeedSchema = v2.VerticalFeedSchema, 
    VerticalFeedSchema_Props = v2.VerticalFeedSchema_Props
};