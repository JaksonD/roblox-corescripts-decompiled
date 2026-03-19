local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.actions);
local v4 = require(script.Parent.prop_types);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 102 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 123 ]] --[[ Name: decode ]]
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
                v20.props = v2.CatalogVirtualizedFeedSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 171 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 185 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.CatalogVirtualizedFeedSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "CatalogVirtualizedFeedSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogVirtualizedFeedSchema"
};
v2.CatalogVirtualizedFeedSchema = v6;
v1.default:register(v2.CatalogVirtualizedFeedSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 214 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        feed_items = if not (v31 ~= nil) or v31.feed_items == nil then nil else v31.feed_items, 
        on_load_more = if not (v31 ~= nil) or v31.on_load_more == nil then nil else v31.on_load_more, 
        on_resize = if not (v31 ~= nil) or v31.on_resize == nil then nil else v31.on_resize, 
        tags = if not (v31 ~= nil) or v31.tags == nil then nil else v31.tags, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 229 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.feed_items ~= nil then
        local v35 = v32.feed_items:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.on_load_more ~= nil then
        local v38 = v32.on_load_more:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.on_resize ~= nil then
        local v41 = v32.on_resize:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.tags ~= nil then
        local v44 = v32.tags:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.position ~= nil then
        local v47 = v32.position:encode();
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
    if v32.anchor_point ~= nil then
        local v53 = v32.anchor_point:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.size ~= nil then
        local v56 = v32.size:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    local v59 = buffer.create(v34);
    buffer.copy(v59, 0, v33, 0, v34);
    return v59;
end;
v6.decode = function(v60) --[[ Line: 286 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v4 (copy), v3 (copy)
    local v61 = v6.new();
    local v62 = 0;
    while v62 < buffer.len(v60) do
        local v63 = nil;
        local v64 = nil;
        local v65, v66, v67 = v0.readTag(v60, v62);
        v63 = v65;
        v64 = v66;
        v62 = v67;
        if v64 == v0.wireTypes.varint then
            v65 = nil;
            v66, v67 = v0.readVarInt(v60, v62);
            v65 = v66;
            v62 = v67;
        elseif v64 == v0.wireTypes.lengthDelimited then
            if v63 == 1 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.feed_items = v4.LazyNestedComponentListProp.decode(v65);
            elseif v63 == 2 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.on_load_more = v3.ActionProp.decode(v65);
            elseif v63 == 3 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.on_resize = v3.ActionProp.decode(v65);
            elseif v63 == 4 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.tags = v4.StringProp.decode(v65);
            elseif v63 == 5 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.position = v4.UiScaledUDim2Prop.decode(v65);
            elseif v63 == 6 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.layout_order = v4.FloatProp.decode(v65);
            elseif v63 == 7 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.anchor_point = v4.Vector2Prop.decode(v65);
            elseif v63 == 8 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.size = v4.UiScaledUDim2Prop.decode(v65);
            else
                v65 = nil;
                v66, v67 = v0.readVarInt(v60, v62);
                v62 = v67 + v66;
            end;
        elseif v64 == v0.wireTypes.i32 then
            v65 = nil;
            v66, v67 = v0.readFixed32(v60, v62);
            v65 = v66;
            v62 = v67;
        elseif v64 == v0.wireTypes.i64 then
            v65 = nil;
            v66, v67 = v0.readFixed64(v60, v62);
            v65 = v66;
            v62 = v67;
        else
            error("Unsupported wire type: " .. v64);
        end;
    end;
    return v61;
end;
v6.jsonEncode = function(v68) --[[ Line: 365 ]] --[[ Name: jsonEncode ]]
    local v69 = {};
    if v68.feed_items ~= nil then
        v69.feedItems = v68.feed_items:jsonEncode();
    end;
    if v68.on_load_more ~= nil then
        v69.onLoadMore = v68.on_load_more:jsonEncode();
    end;
    if v68.on_resize ~= nil then
        v69.onResize = v68.on_resize:jsonEncode();
    end;
    if v68.tags ~= nil then
        v69.tags = v68.tags:jsonEncode();
    end;
    if v68.position ~= nil then
        v69.position = v68.position:jsonEncode();
    end;
    if v68.layout_order ~= nil then
        v69.layoutOrder = v68.layout_order:jsonEncode();
    end;
    if v68.anchor_point ~= nil then
        v69.anchorPoint = v68.anchor_point:jsonEncode();
    end;
    if v68.size ~= nil then
        v69.size = v68.size:jsonEncode();
    end;
    return v69;
end;
v6.jsonDecode = function(v70) --[[ Line: 403 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy)
    local v71 = v6.new();
    if v70.feed_items ~= nil then
        v71.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v70.feed_items);
    end;
    if v70.feedItems ~= nil then
        v71.feed_items = v4.LazyNestedComponentListProp.jsonDecode(v70.feedItems);
    end;
    if v70.on_load_more ~= nil then
        v71.on_load_more = v3.ActionProp.jsonDecode(v70.on_load_more);
    end;
    if v70.onLoadMore ~= nil then
        v71.on_load_more = v3.ActionProp.jsonDecode(v70.onLoadMore);
    end;
    if v70.on_resize ~= nil then
        v71.on_resize = v3.ActionProp.jsonDecode(v70.on_resize);
    end;
    if v70.onResize ~= nil then
        v71.on_resize = v3.ActionProp.jsonDecode(v70.onResize);
    end;
    if v70.tags ~= nil then
        v71.tags = v4.StringProp.jsonDecode(v70.tags);
    end;
    if v70.position ~= nil then
        v71.position = v4.UiScaledUDim2Prop.jsonDecode(v70.position);
    end;
    if v70.layout_order ~= nil then
        v71.layout_order = v4.FloatProp.jsonDecode(v70.layout_order);
    end;
    if v70.layoutOrder ~= nil then
        v71.layout_order = v4.FloatProp.jsonDecode(v70.layoutOrder);
    end;
    if v70.anchor_point ~= nil then
        v71.anchor_point = v4.Vector2Prop.jsonDecode(v70.anchor_point);
    end;
    if v70.anchorPoint ~= nil then
        v71.anchor_point = v4.Vector2Prop.jsonDecode(v70.anchorPoint);
    end;
    if v70.size ~= nil then
        v71.size = v4.UiScaledUDim2Prop.jsonDecode(v70.size);
    end;
    return v71;
end;
v6.descriptor = {
    name = "CatalogVirtualizedFeedSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CatalogVirtualizedFeedSchema_Props = v6;
v1.default:register(v2.CatalogVirtualizedFeedSchema_Props);
return {
    CatalogVirtualizedFeedSchema = v2.CatalogVirtualizedFeedSchema, 
    CatalogVirtualizedFeedSchema_Props = v2.CatalogVirtualizedFeedSchema_Props
};