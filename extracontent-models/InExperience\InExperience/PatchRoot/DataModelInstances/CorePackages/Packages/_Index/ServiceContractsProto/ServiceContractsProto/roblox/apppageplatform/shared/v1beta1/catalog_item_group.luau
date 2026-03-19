local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.actions);
local v4 = require(script.Parent.catalog_sort_prop_types);
local v5 = require(script.Parent.component_shared);
local v6 = require(script.Parent.prop_types);
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
    -- upvalues: l_v7_0 (copy), v0 (copy), v2 (copy), v5 (copy)
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
                v21.props = v2.CatalogItemGroupSchema_Props.decode(v25);
            elseif v23 == 2 then
                v25 = nil;
                v26, v27 = v0.readBuffer(v20, v22);
                v25 = v26;
                v22 = v27;
                v21.shared = v5.ComponentShared.decode(v25);
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
    -- upvalues: l_v7_0 (copy), v2 (copy), v5 (copy)
    local v31 = l_v7_0.new();
    if v30.props ~= nil then
        v31.props = v2.CatalogItemGroupSchema_Props.jsonDecode(v30.props);
    end;
    if v30.shared ~= nil then
        v31.shared = v5.ComponentShared.jsonDecode(v30.shared);
    end;
    return v31;
end;
v7.descriptor = {
    name = "CatalogItemGroupSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGroupSchema"
};
v2.CatalogItemGroupSchema = v7;
v1.default:register(v2.CatalogItemGroupSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v32) --[[ Line: 224 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        id = if not (v32 ~= nil) or v32.id == nil then nil else v32.id, 
        type = if not (v32 ~= nil) or v32.type == nil then nil else v32.type, 
        content = if not (v32 ~= nil) or v32.content == nil then nil else v32.content, 
        preview_rows = if not (v32 ~= nil) or v32.preview_rows == nil then nil else v32.preview_rows, 
        preview_columns = if not (v32 ~= nil) or v32.preview_columns == nil then nil else v32.preview_columns, 
        title = if not (v32 ~= nil) or v32.title == nil then nil else v32.title, 
        description = if not (v32 ~= nil) or v32.description == nil then nil else v32.description, 
        item_footers = if not (v32 ~= nil) or v32.item_footers == nil then nil else v32.item_footers, 
        card_style = if not (v32 ~= nil) or v32.card_style == nil then nil else v32.card_style, 
        on_see_all = if not (v32 ~= nil) or v32.on_see_all == nil then nil else v32.on_see_all, 
        tags = if not (v32 ~= nil) or v32.tags == nil then nil else v32.tags, 
        position = if not (v32 ~= nil) or v32.position == nil then nil else v32.position, 
        layout_order = if not (v32 ~= nil) or v32.layout_order == nil then nil else v32.layout_order, 
        anchor_point = if not (v32 ~= nil) or v32.anchor_point == nil then nil else v32.anchor_point, 
        size = if not (v32 ~= nil) or v32.size == nil then nil else v32.size
    }, v7));
end;
v7.encode = function(v33) --[[ Line: 246 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.id ~= nil then
        local v36 = v33.id:encode();
        local v37, v38 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
        v34 = v37;
        v35 = v38;
    end;
    if v33.type ~= nil then
        local v39 = v33.type:encode();
        local v40, v41 = v0.writeTag(v34, v35, 2, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v34 = v40;
        v35 = v41;
    end;
    if v33.content ~= nil then
        local v42 = v33.content:encode();
        local v43, v44 = v0.writeTag(v34, v35, 3, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
        v34 = v43;
        v35 = v44;
    end;
    if v33.preview_rows ~= nil then
        local v45 = v33.preview_rows:encode();
        local v46, v47 = v0.writeTag(v34, v35, 4, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
        v34 = v46;
        v35 = v47;
    end;
    if v33.preview_columns ~= nil then
        local v48 = v33.preview_columns:encode();
        local v49, v50 = v0.writeTag(v34, v35, 5, v0.wireTypes.lengthDelimited);
        v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
        v34 = v49;
        v35 = v50;
    end;
    if v33.title ~= nil then
        local v51 = v33.title:encode();
        local v52, v53 = v0.writeTag(v34, v35, 6, v0.wireTypes.lengthDelimited);
        v52, v53 = v0.writeBuffer(v52, v53, v51, buffer.len(v51));
        v34 = v52;
        v35 = v53;
    end;
    if v33.description ~= nil then
        local v54 = v33.description:encode();
        local v55, v56 = v0.writeTag(v34, v35, 7, v0.wireTypes.lengthDelimited);
        v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
        v34 = v55;
        v35 = v56;
    end;
    if v33.item_footers ~= nil then
        local v57 = v33.item_footers:encode();
        local v58, v59 = v0.writeTag(v34, v35, 8, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
        v34 = v58;
        v35 = v59;
    end;
    if v33.card_style ~= nil then
        local v60 = v33.card_style:encode();
        local v61, v62 = v0.writeTag(v34, v35, 9, v0.wireTypes.lengthDelimited);
        v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
        v34 = v61;
        v35 = v62;
    end;
    if v33.on_see_all ~= nil then
        local v63 = v33.on_see_all:encode();
        local v64, v65 = v0.writeTag(v34, v35, 10, v0.wireTypes.lengthDelimited);
        v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
        v34 = v64;
        v35 = v65;
    end;
    if v33.tags ~= nil then
        local v66 = v33.tags:encode();
        local v67, v68 = v0.writeTag(v34, v35, 11, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
        v34 = v67;
        v35 = v68;
    end;
    if v33.position ~= nil then
        local v69 = v33.position:encode();
        local v70, v71 = v0.writeTag(v34, v35, 12, v0.wireTypes.lengthDelimited);
        v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
        v34 = v70;
        v35 = v71;
    end;
    if v33.layout_order ~= nil then
        local v72 = v33.layout_order:encode();
        local v73, v74 = v0.writeTag(v34, v35, 13, v0.wireTypes.lengthDelimited);
        v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
        v34 = v73;
        v35 = v74;
    end;
    if v33.anchor_point ~= nil then
        local v75 = v33.anchor_point:encode();
        local v76, v77 = v0.writeTag(v34, v35, 14, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
        v34 = v76;
        v35 = v77;
    end;
    if v33.size ~= nil then
        local v78 = v33.size:encode();
        local v79, v80 = v0.writeTag(v34, v35, 15, v0.wireTypes.lengthDelimited);
        v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
        v34 = v79;
        v35 = v80;
    end;
    local v81 = buffer.create(v35);
    buffer.copy(v81, 0, v34, 0, v35);
    return v81;
end;
v7.decode = function(v82) --[[ Line: 345 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v83 = v7.new();
    local v84 = 0;
    while v84 < buffer.len(v82) do
        local v85 = nil;
        local v86 = nil;
        local v87, v88, v89 = v0.readTag(v82, v84);
        v85 = v87;
        v86 = v88;
        v84 = v89;
        if v86 == v0.wireTypes.varint then
            v87 = nil;
            v88, v89 = v0.readVarInt(v82, v84);
            v87 = v88;
            v84 = v89;
        elseif v86 == v0.wireTypes.lengthDelimited then
            if v85 == 1 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.id = v6.StringProp.decode(v87);
            elseif v85 == 2 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.type = v6.StringProp.decode(v87);
            elseif v85 == 3 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.content = v4.ArrayOfCatalogSortContentProp.decode(v87);
            elseif v85 == 4 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.preview_rows = v6.Int32Prop.decode(v87);
            elseif v85 == 5 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.preview_columns = v6.Int32Prop.decode(v87);
            elseif v85 == 6 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.title = v6.StringProp.decode(v87);
            elseif v85 == 7 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.description = v6.StringProp.decode(v87);
            elseif v85 == 8 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.item_footers = v4.ArrayOfItemFooterProp.decode(v87);
            elseif v85 == 9 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.card_style = v4.CardStyleProp.decode(v87);
            elseif v85 == 10 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.on_see_all = v3.ActionProp.decode(v87);
            elseif v85 == 11 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.tags = v6.StringProp.decode(v87);
            elseif v85 == 12 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.position = v6.UiScaledUDim2Prop.decode(v87);
            elseif v85 == 13 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.layout_order = v6.Int32Prop.decode(v87);
            elseif v85 == 14 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.anchor_point = v6.Vector2Prop.decode(v87);
            elseif v85 == 15 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.size = v6.UiScaledUDim2Prop.decode(v87);
            else
                v87 = nil;
                v88, v89 = v0.readVarInt(v82, v84);
                v84 = v89 + v88;
            end;
        elseif v86 == v0.wireTypes.i32 then
            v87 = nil;
            v88, v89 = v0.readFixed32(v82, v84);
            v87 = v88;
            v84 = v89;
        elseif v86 == v0.wireTypes.i64 then
            v87 = nil;
            v88, v89 = v0.readFixed64(v82, v84);
            v87 = v88;
            v84 = v89;
        else
            error("Unsupported wire type: " .. v86);
        end;
    end;
    return v83;
end;
v7.jsonEncode = function(v90) --[[ Line: 465 ]] --[[ Name: jsonEncode ]]
    local v91 = {};
    if v90.id ~= nil then
        v91.id = v90.id:jsonEncode();
    end;
    if v90.type ~= nil then
        v91.type = v90.type:jsonEncode();
    end;
    if v90.content ~= nil then
        v91.content = v90.content:jsonEncode();
    end;
    if v90.preview_rows ~= nil then
        v91.previewRows = v90.preview_rows:jsonEncode();
    end;
    if v90.preview_columns ~= nil then
        v91.previewColumns = v90.preview_columns:jsonEncode();
    end;
    if v90.title ~= nil then
        v91.title = v90.title:jsonEncode();
    end;
    if v90.description ~= nil then
        v91.description = v90.description:jsonEncode();
    end;
    if v90.item_footers ~= nil then
        v91.itemFooters = v90.item_footers:jsonEncode();
    end;
    if v90.card_style ~= nil then
        v91.cardStyle = v90.card_style:jsonEncode();
    end;
    if v90.on_see_all ~= nil then
        v91.onSeeAll = v90.on_see_all:jsonEncode();
    end;
    if v90.tags ~= nil then
        v91.tags = v90.tags:jsonEncode();
    end;
    if v90.position ~= nil then
        v91.position = v90.position:jsonEncode();
    end;
    if v90.layout_order ~= nil then
        v91.layoutOrder = v90.layout_order:jsonEncode();
    end;
    if v90.anchor_point ~= nil then
        v91.anchorPoint = v90.anchor_point:jsonEncode();
    end;
    if v90.size ~= nil then
        v91.size = v90.size:jsonEncode();
    end;
    return v91;
end;
v7.jsonDecode = function(v92) --[[ Line: 531 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v93 = v7.new();
    if v92.id ~= nil then
        v93.id = v6.StringProp.jsonDecode(v92.id);
    end;
    if v92.type ~= nil then
        v93.type = v6.StringProp.jsonDecode(v92.type);
    end;
    if v92.content ~= nil then
        v93.content = v4.ArrayOfCatalogSortContentProp.jsonDecode(v92.content);
    end;
    if v92.preview_rows ~= nil then
        v93.preview_rows = v6.Int32Prop.jsonDecode(v92.preview_rows);
    end;
    if v92.previewRows ~= nil then
        v93.preview_rows = v6.Int32Prop.jsonDecode(v92.previewRows);
    end;
    if v92.preview_columns ~= nil then
        v93.preview_columns = v6.Int32Prop.jsonDecode(v92.preview_columns);
    end;
    if v92.previewColumns ~= nil then
        v93.preview_columns = v6.Int32Prop.jsonDecode(v92.previewColumns);
    end;
    if v92.title ~= nil then
        v93.title = v6.StringProp.jsonDecode(v92.title);
    end;
    if v92.description ~= nil then
        v93.description = v6.StringProp.jsonDecode(v92.description);
    end;
    if v92.item_footers ~= nil then
        v93.item_footers = v4.ArrayOfItemFooterProp.jsonDecode(v92.item_footers);
    end;
    if v92.itemFooters ~= nil then
        v93.item_footers = v4.ArrayOfItemFooterProp.jsonDecode(v92.itemFooters);
    end;
    if v92.card_style ~= nil then
        v93.card_style = v4.CardStyleProp.jsonDecode(v92.card_style);
    end;
    if v92.cardStyle ~= nil then
        v93.card_style = v4.CardStyleProp.jsonDecode(v92.cardStyle);
    end;
    if v92.on_see_all ~= nil then
        v93.on_see_all = v3.ActionProp.jsonDecode(v92.on_see_all);
    end;
    if v92.onSeeAll ~= nil then
        v93.on_see_all = v3.ActionProp.jsonDecode(v92.onSeeAll);
    end;
    if v92.tags ~= nil then
        v93.tags = v6.StringProp.jsonDecode(v92.tags);
    end;
    if v92.position ~= nil then
        v93.position = v6.UiScaledUDim2Prop.jsonDecode(v92.position);
    end;
    if v92.layout_order ~= nil then
        v93.layout_order = v6.Int32Prop.jsonDecode(v92.layout_order);
    end;
    if v92.layoutOrder ~= nil then
        v93.layout_order = v6.Int32Prop.jsonDecode(v92.layoutOrder);
    end;
    if v92.anchor_point ~= nil then
        v93.anchor_point = v6.Vector2Prop.jsonDecode(v92.anchor_point);
    end;
    if v92.anchorPoint ~= nil then
        v93.anchor_point = v6.Vector2Prop.jsonDecode(v92.anchorPoint);
    end;
    if v92.size ~= nil then
        v93.size = v6.UiScaledUDim2Prop.jsonDecode(v92.size);
    end;
    return v93;
end;
v7.descriptor = {
    name = "CatalogItemGroupSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.CatalogItemGroupSchema_Props = v7;
v1.default:register(v2.CatalogItemGroupSchema_Props);
return {
    CatalogItemGroupSchema = v2.CatalogItemGroupSchema, 
    CatalogItemGroupSchema_Props = v2.CatalogItemGroupSchema_Props
};