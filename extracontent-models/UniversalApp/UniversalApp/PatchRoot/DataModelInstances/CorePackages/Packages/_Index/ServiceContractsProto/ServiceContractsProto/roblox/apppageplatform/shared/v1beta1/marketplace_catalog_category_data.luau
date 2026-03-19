local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and "" or v4.id, 
        title = (not (v4 ~= nil) or v4.title == nil) and "" or v4.title, 
        name = (not (v4 ~= nil) or v4.name == nil) and "" or v4.name, 
        taxonomy_id = (not (v4 ~= nil) or v4.taxonomy_id == nil) and "" or v4.taxonomy_id, 
        buttons_enabled = if not (v4 ~= nil) or v4.buttons_enabled == nil then {} else v4.buttons_enabled, 
        subcategories = if not (v4 ~= nil) or v4.subcategories == nil then {} else v4.subcategories, 
        default_subcategory_id = (not (v4 ~= nil) or v4.default_subcategory_id == nil) and "" or v4.default_subcategory_id, 
        asset_types = if not (v4 ~= nil) or v4.asset_types == nil then {} else v4.asset_types, 
        bundle_types = if not (v4 ~= nil) or v4.bundle_types == nil then {} else v4.bundle_types, 
        can_animate_camera_based_mood = v4 ~= nil and not (v4.can_animate_camera_based_mood == nil) and v4.can_animate_camera_based_mood, 
        camera_focus = (not (v4 ~= nil) or v4.camera_focus == nil) and "" or v4.camera_focus, 
        camera_zoom_radius = (not (v4 ~= nil) or v4.camera_zoom_radius == nil) and 0 or v4.camera_zoom_radius, 
        tile_type = (not (v4 ~= nil) or v4.tile_type == nil) and "" or v4.tile_type, 
        looks_widget_context_for_organic_content = (not (v4 ~= nil) or v4.looks_widget_context_for_organic_content == nil) and "" or v4.looks_widget_context_for_organic_content, 
        time_to_refresh = (not (v4 ~= nil) or v4.time_to_refresh == nil) and 0 or v4.time_to_refresh, 
        category_id = (not (v4 ~= nil) or v4.category_id == nil) and 0 or v4.category_id, 
        subcategory_id = (not (v4 ~= nil) or v4.subcategory_id == nil) and 0 or v4.subcategory_id
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 108 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.title ~= nil and v5.title ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.title);
        v6 = v10;
        v7 = v11;
    end;
    if v5.name ~= nil and v5.name ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.name);
        v6 = v12;
        v7 = v13;
    end;
    if v5.taxonomy_id ~= nil and v5.taxonomy_id ~= "" then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v5.taxonomy_id);
        v6 = v14;
        v7 = v15;
    end;
    if v5.buttons_enabled ~= nil and #v5.buttons_enabled > 0 then
        for _, v17 in v5.buttons_enabled do
            local v18, v19 = v0.writeTag(v6, v7, 5, v0.wireTypes.lengthDelimited);
            v18, v19 = v0.writeString(v18, v19, v17);
            v6 = v18;
            v7 = v19;
        end;
    end;
    if v5.subcategories ~= nil and #v5.subcategories > 0 then
        for _, v21 in v5.subcategories do
            local v22, v23 = v0.writeTag(v6, v7, 6, v0.wireTypes.lengthDelimited);
            v22, v23 = v0.writeString(v22, v23, v21);
            v6 = v22;
            v7 = v23;
        end;
    end;
    if v5.default_subcategory_id ~= nil and v5.default_subcategory_id ~= "" then
        local v24, v25 = v0.writeTag(v6, v7, 7, v0.wireTypes.lengthDelimited);
        v24, v25 = v0.writeString(v24, v25, v5.default_subcategory_id);
        v6 = v24;
        v7 = v25;
    end;
    if v5.asset_types ~= nil and #v5.asset_types > 0 then
        for _, v27 in v5.asset_types do
            local v28, v29 = v0.writeTag(v6, v7, 8, v0.wireTypes.lengthDelimited);
            v28, v29 = v0.writeString(v28, v29, v27);
            v6 = v28;
            v7 = v29;
        end;
    end;
    if v5.bundle_types ~= nil and #v5.bundle_types > 0 then
        for _, v31 in v5.bundle_types do
            local v32, v33 = v0.writeTag(v6, v7, 9, v0.wireTypes.lengthDelimited);
            v32, v33 = v0.writeString(v32, v33, v31);
            v6 = v32;
            v7 = v33;
        end;
    end;
    if v5.can_animate_camera_based_mood then
        local v34, v35 = v0.writeTag(v6, v7, 10, v0.wireTypes.varint);
        v34, v35 = v0.writeVarInt(v34, v35, v5.can_animate_camera_based_mood and 1 or 0);
        v6 = v34;
        v7 = v35;
    end;
    if v5.camera_focus ~= nil and v5.camera_focus ~= "" then
        local v36, v37 = v0.writeTag(v6, v7, 11, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeString(v36, v37, v5.camera_focus);
        v6 = v36;
        v7 = v37;
    end;
    if v5.camera_zoom_radius ~= nil and v5.camera_zoom_radius ~= 0 then
        local v38, v39 = v0.writeTag(v6, v7, 12, v0.wireTypes.i32);
        v38, v39 = v0.writeFloat(v38, v39, v5.camera_zoom_radius);
        v6 = v38;
        v7 = v39;
    end;
    if v5.tile_type ~= nil and v5.tile_type ~= "" then
        local v40, v41 = v0.writeTag(v6, v7, 13, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeString(v40, v41, v5.tile_type);
        v6 = v40;
        v7 = v41;
    end;
    if v5.looks_widget_context_for_organic_content ~= nil and v5.looks_widget_context_for_organic_content ~= "" then
        local v42, v43 = v0.writeTag(v6, v7, 14, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeString(v42, v43, v5.looks_widget_context_for_organic_content);
        v6 = v42;
        v7 = v43;
    end;
    if v5.time_to_refresh ~= nil and v5.time_to_refresh ~= 0 then
        local v44, v45 = v0.writeTag(v6, v7, 15, v0.wireTypes.varint);
        v44, v45 = v0.writeVarInt(v44, v45, v5.time_to_refresh);
        v6 = v44;
        v7 = v45;
    end;
    if v5.category_id ~= nil and v5.category_id ~= 0 then
        local v46, v47 = v0.writeTag(v6, v7, 16, v0.wireTypes.varint);
        v46, v47 = v0.writeVarInt(v46, v47, v5.category_id);
        v6 = v46;
        v7 = v47;
    end;
    if v5.subcategory_id ~= nil and v5.subcategory_id ~= 0 then
        local v48, v49 = v0.writeTag(v6, v7, 17, v0.wireTypes.varint);
        v48, v49 = v0.writeVarInt(v48, v49, v5.subcategory_id);
        v6 = v48;
        v7 = v49;
    end;
    local v50 = buffer.create(v7);
    buffer.copy(v50, 0, v6, 0, v7);
    return v50;
end;
v3.decode = function(v51) --[[ Line: 213 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v52 = v3.new();
    local v53 = 0;
    while v53 < buffer.len(v51) do
        local v54 = nil;
        local v55 = nil;
        local v56, v57, v58 = v0.readTag(v51, v53);
        v54 = v56;
        v55 = v57;
        v53 = v58;
        if v55 == v0.wireTypes.varint then
            if v54 == 10 then
                v56 = nil;
                v57, v58 = v0.readVarInt(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.can_animate_camera_based_mood = v56 ~= 0;
            elseif v54 == 15 then
                v56 = nil;
                v57, v58 = v0.readVarIntI64(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.time_to_refresh = v56;
            elseif v54 == 16 then
                v56 = nil;
                v57, v58 = v0.readVarIntI64(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.category_id = v56;
            elseif v54 == 17 then
                v56 = nil;
                v57, v58 = v0.readVarIntI64(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.subcategory_id = v56;
            else
                v56 = nil;
                v57, v58 = v0.readVarInt(v51, v53);
                v56 = v57;
                v53 = v58;
            end;
        elseif v55 == v0.wireTypes.lengthDelimited then
            if v54 == 1 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.id = buffer.tostring(v56);
            elseif v54 == 2 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.title = buffer.tostring(v56);
            elseif v54 == 3 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.name = buffer.tostring(v56);
            elseif v54 == 4 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.taxonomy_id = buffer.tostring(v56);
            elseif v54 == 5 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                table.insert(v52.buttons_enabled, buffer.tostring(v56));
            elseif v54 == 6 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                table.insert(v52.subcategories, buffer.tostring(v56));
            elseif v54 == 7 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.default_subcategory_id = buffer.tostring(v56);
            elseif v54 == 8 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                table.insert(v52.asset_types, buffer.tostring(v56));
            elseif v54 == 9 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                table.insert(v52.bundle_types, buffer.tostring(v56));
            elseif v54 == 11 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.camera_focus = buffer.tostring(v56);
            elseif v54 == 13 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.tile_type = buffer.tostring(v56);
            elseif v54 == 14 then
                v56 = nil;
                v57, v58 = v0.readBuffer(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.looks_widget_context_for_organic_content = buffer.tostring(v56);
            else
                v56 = nil;
                v57, v58 = v0.readVarInt(v51, v53);
                v53 = v58 + v57;
            end;
        elseif v55 == v0.wireTypes.i32 then
            if v54 == 12 then
                v56 = nil;
                v57, v58 = v0.readFloat(v51, v53);
                v56 = v57;
                v53 = v58;
                v52.camera_zoom_radius = v56;
            else
                v56 = nil;
                v57, v58 = v0.readFixed32(v51, v53);
                v56 = v57;
                v53 = v58;
            end;
        elseif v55 == v0.wireTypes.i64 then
            v56 = nil;
            v57, v58 = v0.readFixed64(v51, v53);
            v56 = v57;
            v53 = v58;
        else
            error("Unsupported wire type: " .. v55);
        end;
    end;
    return v52;
end;
v3.jsonEncode = function(v59) --[[ Line: 336 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v0 (copy)
    local v60 = {};
    if v59.id ~= nil and v59.id ~= "" then
        v60.id = v59.id;
    end;
    if v59.title ~= nil and v59.title ~= "" then
        v60.title = v59.title;
    end;
    if v59.name ~= nil and v59.name ~= "" then
        v60.name = v59.name;
    end;
    if v59.taxonomy_id ~= nil and v59.taxonomy_id ~= "" then
        v60.taxonomyId = v59.taxonomy_id;
    end;
    if v59.buttons_enabled ~= nil and #v59.buttons_enabled > 0 then
        local v61 = {};
        for _, v63 in v59.buttons_enabled do
            table.insert(v61, v63);
        end;
        v60.buttonsEnabled = v61;
    end;
    if v59.subcategories ~= nil and #v59.subcategories > 0 then
        local v64 = {};
        for _, v66 in v59.subcategories do
            table.insert(v64, v66);
        end;
        v60.subcategories = v64;
    end;
    if v59.default_subcategory_id ~= nil and v59.default_subcategory_id ~= "" then
        v60.defaultSubcategoryId = v59.default_subcategory_id;
    end;
    if v59.asset_types ~= nil and #v59.asset_types > 0 then
        local v67 = {};
        for _, v69 in v59.asset_types do
            table.insert(v67, v69);
        end;
        v60.assetTypes = v67;
    end;
    if v59.bundle_types ~= nil and #v59.bundle_types > 0 then
        local v70 = {};
        for _, v72 in v59.bundle_types do
            table.insert(v70, v72);
        end;
        v60.bundleTypes = v70;
    end;
    if v59.can_animate_camera_based_mood then
        v60.canAnimateCameraBasedMood = v59.can_animate_camera_based_mood;
    end;
    if v59.camera_focus ~= nil and v59.camera_focus ~= "" then
        v60.cameraFocus = v59.camera_focus;
    end;
    if v59.camera_zoom_radius ~= nil and v59.camera_zoom_radius ~= 0 then
        v60.cameraZoomRadius = v0.json.serializeNumber(v59.camera_zoom_radius);
    end;
    if v59.tile_type ~= nil and v59.tile_type ~= "" then
        v60.tileType = v59.tile_type;
    end;
    if v59.looks_widget_context_for_organic_content ~= nil and v59.looks_widget_context_for_organic_content ~= "" then
        v60.looksWidgetContextForOrganicContent = v59.looks_widget_context_for_organic_content;
    end;
    if v59.time_to_refresh ~= nil and v59.time_to_refresh ~= 0 then
        v60.timeToRefresh = v59.time_to_refresh;
    end;
    if v59.category_id ~= nil and v59.category_id ~= 0 then
        v60.categoryId = v59.category_id;
    end;
    if v59.subcategory_id ~= nil and v59.subcategory_id ~= 0 then
        v60.subcategoryId = v59.subcategory_id;
    end;
    return v60;
end;
v3.jsonDecode = function(v73) --[[ Line: 429 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v74 = v3.new();
    if v73.id ~= nil then
        v74.id = v73.id;
    end;
    if v73.title ~= nil then
        v74.title = v73.title;
    end;
    if v73.name ~= nil then
        v74.name = v73.name;
    end;
    if v73.taxonomy_id ~= nil then
        v74.taxonomy_id = v73.taxonomy_id;
    end;
    if v73.taxonomyId ~= nil then
        v74.taxonomy_id = v73.taxonomyId;
    end;
    if v73.buttons_enabled ~= nil then
        local v75 = {};
        for _, v77 in v73.buttons_enabled do
            table.insert(v75, v77);
        end;
        v74.buttons_enabled = v75;
    end;
    if v73.buttonsEnabled ~= nil then
        local v78 = {};
        for _, v80 in v73.buttonsEnabled do
            table.insert(v78, v80);
        end;
        v74.buttons_enabled = v78;
    end;
    if v73.subcategories ~= nil then
        local v81 = {};
        for _, v83 in v73.subcategories do
            table.insert(v81, v83);
        end;
        v74.subcategories = v81;
    end;
    if v73.default_subcategory_id ~= nil then
        v74.default_subcategory_id = v73.default_subcategory_id;
    end;
    if v73.defaultSubcategoryId ~= nil then
        v74.default_subcategory_id = v73.defaultSubcategoryId;
    end;
    if v73.asset_types ~= nil then
        local v84 = {};
        for _, v86 in v73.asset_types do
            table.insert(v84, v86);
        end;
        v74.asset_types = v84;
    end;
    if v73.assetTypes ~= nil then
        local v87 = {};
        for _, v89 in v73.assetTypes do
            table.insert(v87, v89);
        end;
        v74.asset_types = v87;
    end;
    if v73.bundle_types ~= nil then
        local v90 = {};
        for _, v92 in v73.bundle_types do
            table.insert(v90, v92);
        end;
        v74.bundle_types = v90;
    end;
    if v73.bundleTypes ~= nil then
        local v93 = {};
        for _, v95 in v73.bundleTypes do
            table.insert(v93, v95);
        end;
        v74.bundle_types = v93;
    end;
    if v73.can_animate_camera_based_mood ~= nil then
        v74.can_animate_camera_based_mood = v73.can_animate_camera_based_mood;
    end;
    if v73.canAnimateCameraBasedMood ~= nil then
        v74.can_animate_camera_based_mood = v73.canAnimateCameraBasedMood;
    end;
    if v73.camera_focus ~= nil then
        v74.camera_focus = v73.camera_focus;
    end;
    if v73.cameraFocus ~= nil then
        v74.camera_focus = v73.cameraFocus;
    end;
    if v73.camera_zoom_radius ~= nil then
        v74.camera_zoom_radius = v0.json.deserializeNumber(v73.camera_zoom_radius);
    end;
    if v73.cameraZoomRadius ~= nil then
        v74.camera_zoom_radius = v0.json.deserializeNumber(v73.cameraZoomRadius);
    end;
    if v73.tile_type ~= nil then
        v74.tile_type = v73.tile_type;
    end;
    if v73.tileType ~= nil then
        v74.tile_type = v73.tileType;
    end;
    if v73.looks_widget_context_for_organic_content ~= nil then
        v74.looks_widget_context_for_organic_content = v73.looks_widget_context_for_organic_content;
    end;
    if v73.looksWidgetContextForOrganicContent ~= nil then
        v74.looks_widget_context_for_organic_content = v73.looksWidgetContextForOrganicContent;
    end;
    if v73.time_to_refresh ~= nil then
        v74.time_to_refresh = v73.time_to_refresh;
    end;
    if v73.timeToRefresh ~= nil then
        v74.time_to_refresh = v73.timeToRefresh;
    end;
    if v73.category_id ~= nil then
        v74.category_id = v73.category_id;
    end;
    if v73.categoryId ~= nil then
        v74.category_id = v73.categoryId;
    end;
    if v73.subcategory_id ~= nil then
        v74.subcategory_id = v73.subcategory_id;
    end;
    if v73.subcategoryId ~= nil then
        v74.subcategory_id = v73.subcategoryId;
    end;
    return v74;
end;
v3.descriptor = {
    name = "MarketplaceCatalogCategoryData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryData"
};
v2.MarketplaceCatalogCategoryData = v3;
v1.default:register(v2.MarketplaceCatalogCategoryData);
return {
    MarketplaceCatalogCategoryData = v2.MarketplaceCatalogCategoryData
};