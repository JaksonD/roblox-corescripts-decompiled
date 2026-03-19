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
v7.new = function(v9) --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        props = if not (v9 ~= nil) or v9.props == nil then nil else v9.props, 
        shared = if not (v9 ~= nil) or v9.shared == nil then nil else v9.shared
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 92 ]] --[[ Name: encode ]]
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
v7.decode = function(v20) --[[ Line: 113 ]] --[[ Name: decode ]]
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
v7.jsonEncode = function(v28) --[[ Line: 161 ]] --[[ Name: jsonEncode ]]
    local v29 = {};
    if v28.props ~= nil then
        v29.props = v28.props:jsonEncode();
    end;
    if v28.shared ~= nil then
        v29.shared = v28.shared:jsonEncode();
    end;
    return v29;
end;
v7.jsonDecode = function(v30) --[[ Line: 175 ]] --[[ Name: jsonDecode ]]
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
v7.new = function(v32) --[[ Line: 204 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        layout_order = if not (v32 ~= nil) or v32.layout_order == nil then nil else v32.layout_order, 
        feed_items = if not (v32 ~= nil) or v32.feed_items == nil then nil else v32.feed_items, 
        threshold_from_end = if not (v32 ~= nil) or v32.threshold_from_end == nil then nil else v32.threshold_from_end, 
        on_scroll_to_end = if not (v32 ~= nil) or v32.on_scroll_to_end == nil then nil else v32.on_scroll_to_end, 
        background_style = if not (v32 ~= nil) or v32.background_style == nil then nil else v32.background_style, 
        horizontal_alignment = if not (v32 ~= nil) or v32.horizontal_alignment == nil then nil else v32.horizontal_alignment, 
        horizontal_padding = if not (v32 ~= nil) or v32.horizontal_padding == nil then nil else v32.horizontal_padding, 
        gap_between_feed_items = if not (v32 ~= nil) or v32.gap_between_feed_items == nil then nil else v32.gap_between_feed_items
    }, v7));
end;
v7.encode = function(v33) --[[ Line: 221 ]] --[[ Name: encode ]]
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
    local v60 = buffer.create(v35);
    buffer.copy(v60, 0, v34, 0, v35);
    return v60;
end;
v7.decode = function(v61) --[[ Line: 278 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v62 = v7.new();
    local v63 = 0;
    while v63 < buffer.len(v61) do
        local v64 = nil;
        local v65 = nil;
        local v66, v67, v68 = v0.readTag(v61, v63);
        v64 = v66;
        v65 = v67;
        v63 = v68;
        if v65 == v0.wireTypes.varint then
            v66 = nil;
            v67, v68 = v0.readVarInt(v61, v63);
            v66 = v67;
            v63 = v68;
        elseif v65 == v0.wireTypes.lengthDelimited then
            if v64 == 1 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.layout_order = v4.Int32Prop.decode(v66);
            elseif v64 == 2 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.feed_items = v4.LazyNestedComponentListProp.decode(v66);
            elseif v64 == 3 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.threshold_from_end = v4.Int32Prop.decode(v66);
            elseif v64 == 4 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.on_scroll_to_end = v3.ActionProp.decode(v66);
            elseif v64 == 5 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.background_style = v4.ColorProp.decode(v66);
            elseif v64 == 6 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.horizontal_alignment = v5.HorizontalAlignmentProp.decode(v66);
            elseif v64 == 7 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.horizontal_padding = v4.Int32Prop.decode(v66);
            elseif v64 == 8 then
                v66 = nil;
                v67, v68 = v0.readBuffer(v61, v63);
                v66 = v67;
                v63 = v68;
                v62.gap_between_feed_items = v4.Int32Prop.decode(v66);
            else
                v66 = nil;
                v67, v68 = v0.readVarInt(v61, v63);
                v63 = v68 + v67;
            end;
        elseif v65 == v0.wireTypes.i32 then
            v66 = nil;
            v67, v68 = v0.readFixed32(v61, v63);
            v66 = v67;
            v63 = v68;
        elseif v65 == v0.wireTypes.i64 then
            v66 = nil;
            v67, v68 = v0.readFixed64(v61, v63);
            v66 = v67;
            v63 = v68;
        else
            error("Unsupported wire type: " .. v65);
        end;
    end;
    return v62;
end;
v7.jsonEncode = function(v69) --[[ Line: 359 ]] --[[ Name: jsonEncode ]]
    local v70 = {};
    if v69.layout_order ~= nil then
        v70.layoutOrder = v69.layout_order:jsonEncode();
    end;
    if v69.feed_items ~= nil then
        v70.feedItems = v69.feed_items:jsonEncode();
    end;
    if v69.threshold_from_end ~= nil then
        v70.thresholdFromEnd = v69.threshold_from_end:jsonEncode();
    end;
    if v69.on_scroll_to_end ~= nil then
        v70.onScrollToEnd = v69.on_scroll_to_end:jsonEncode();
    end;
    if v69.background_style ~= nil then
        v70.backgroundStyle = v69.background_style:jsonEncode();
    end;
    if v69.horizontal_alignment ~= nil then
        v70.horizontalAlignment = v69.horizontal_alignment:jsonEncode();
    end;
    if v69.horizontal_padding ~= nil then
        v70.horizontalPadding = v69.horizontal_padding:jsonEncode();
    end;
    if v69.gap_between_feed_items ~= nil then
        v70.gapBetweenFeedItems = v69.gap_between_feed_items:jsonEncode();
    end;
    return v70;
end;
v7.jsonDecode = function(v71) --[[ Line: 397 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v72 = v7.new();
    if v71.layout_order ~= nil then
        v72.layout_order = v4.Int32Prop.jsonDecode(v71.layout_order);
    end;
    if v71.layoutOrder ~= nil then
        v72.layout_order = v4.Int32Prop.jsonDecode(v71.layoutOrder);
    end;
    if v71.feed_items ~= nil then
        v72.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v71.feed_items);
    end;
    if v71.feedItems ~= nil then
        v72.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v71.feedItems);
    end;
    if v71.threshold_from_end ~= nil then
        v72.threshold_from_end = v4.Int32Prop.jsonDecode(v71.threshold_from_end);
    end;
    if v71.thresholdFromEnd ~= nil then
        v72.threshold_from_end = v4.Int32Prop.jsonDecode(v71.thresholdFromEnd);
    end;
    if v71.on_scroll_to_end ~= nil then
        v72.on_scroll_to_end = v3.ActionProp.jsonDecode(v71.on_scroll_to_end);
    end;
    if v71.onScrollToEnd ~= nil then
        v72.on_scroll_to_end = v3.ActionProp.jsonDecode(v71.onScrollToEnd);
    end;
    if v71.background_style ~= nil then
        v72.background_style = v4.ColorProp.jsonDecode(v71.background_style);
    end;
    if v71.backgroundStyle ~= nil then
        v72.background_style = v4.ColorProp.jsonDecode(v71.backgroundStyle);
    end;
    if v71.horizontal_alignment ~= nil then
        v72.horizontal_alignment = v5.HorizontalAlignmentProp.jsonDecode(v71.horizontal_alignment);
    end;
    if v71.horizontalAlignment ~= nil then
        v72.horizontal_alignment = v5.HorizontalAlignmentProp.jsonDecode(v71.horizontalAlignment);
    end;
    if v71.horizontal_padding ~= nil then
        v72.horizontal_padding = v4.Int32Prop.jsonDecode(v71.horizontal_padding);
    end;
    if v71.horizontalPadding ~= nil then
        v72.horizontal_padding = v4.Int32Prop.jsonDecode(v71.horizontalPadding);
    end;
    if v71.gap_between_feed_items ~= nil then
        v72.gap_between_feed_items = v4.Int32Prop.jsonDecode(v71.gap_between_feed_items);
    end;
    if v71.gapBetweenFeedItems ~= nil then
        v72.gap_between_feed_items = v4.Int32Prop.jsonDecode(v71.gapBetweenFeedItems);
    end;
    return v72;
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