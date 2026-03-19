local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 123 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 144 ]] --[[ Name: decode ]]
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
                v20.props = v2.GameTileSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 192 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 206 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.GameTileSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "GameTileSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GameTileSchema"
};
v2.GameTileSchema = v6;
v1.default:register(v2.GameTileSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 235 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        image_aspect_ratio = if not (v31 ~= nil) or v31.image_aspect_ratio == nil then nil else v31.image_aspect_ratio, 
        title_text = if not (v31 ~= nil) or v31.title_text == nil then nil else v31.title_text, 
        image = if not (v31 ~= nil) or v31.image == nil then nil else v31.image, 
        is_contained = if not (v31 ~= nil) or v31.is_contained == nil then nil else v31.is_contained, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        background_image = if not (v31 ~= nil) or v31.background_image == nil then nil else v31.background_image, 
        containment_padding = if not (v31 ~= nil) or v31.containment_padding == nil then nil else v31.containment_padding, 
        corner_radius = if not (v31 ~= nil) or v31.corner_radius == nil then nil else v31.corner_radius, 
        title_lines = if not (v31 ~= nil) or v31.title_lines == nil then nil else v31.title_lines, 
        background_image_component = if not (v31 ~= nil) or v31.background_image_component == nil then nil else v31.background_image_component, 
        cta_button_component = if not (v31 ~= nil) or v31.cta_button_component == nil then nil else v31.cta_button_component, 
        footer_component = if not (v31 ~= nil) or v31.footer_component == nil then nil else v31.footer_component, 
        image_component = if not (v31 ~= nil) or v31.image_component == nil then nil else v31.image_component, 
        thumbnail_overlay_component = if not (v31 ~= nil) or v31.thumbnail_overlay_component == nil then nil else v31.thumbnail_overlay_component, 
        title_component = if not (v31 ~= nil) or v31.title_component == nil then nil else v31.title_component, 
        focus_navigation_actions_component = if not (v31 ~= nil) or v31.focus_navigation_actions_component == nil then nil else v31.focus_navigation_actions_component, 
        thumbnail_background_style = if not (v31 ~= nil) or v31.thumbnail_background_style == nil then nil else v31.thumbnail_background_style, 
        title_font = if not (v31 ~= nil) or v31.title_font == nil then nil else v31.title_font, 
        enable_legacy_hover_state = if not (v31 ~= nil) or v31.enable_legacy_hover_state == nil then nil else v31.enable_legacy_hover_state, 
        universe_id = if not (v31 ~= nil) or v31.universe_id == nil then nil else v31.universe_id, 
        place_id = if not (v31 ~= nil) or v31.place_id == nil then nil else v31.place_id, 
        disable_hold_to_play = if not (v31 ~= nil) or v31.disable_hold_to_play == nil then nil else v31.disable_hold_to_play, 
        rating_text = if not (v31 ~= nil) or v31.rating_text == nil then nil else v31.rating_text, 
        player_count = if not (v31 ~= nil) or v31.player_count == nil then nil else v31.player_count
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 281 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.image_aspect_ratio ~= nil then
        local v35 = v32.image_aspect_ratio:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.title_text ~= nil then
        local v38 = v32.title_text:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.image ~= nil then
        local v41 = v32.image:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.is_contained ~= nil then
        local v44 = v32.is_contained:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.on_activated ~= nil then
        local v47 = v32.on_activated:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.background_image ~= nil then
        local v50 = v32.background_image:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.containment_padding ~= nil then
        local v53 = v32.containment_padding:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.corner_radius ~= nil then
        local v56 = v32.corner_radius:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.title_lines ~= nil then
        local v59 = v32.title_lines:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.background_image_component ~= nil then
        local v62 = v32.background_image_component:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.cta_button_component ~= nil then
        local v65 = v32.cta_button_component:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.footer_component ~= nil then
        local v68 = v32.footer_component:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.image_component ~= nil then
        local v71 = v32.image_component:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.thumbnail_overlay_component ~= nil then
        local v74 = v32.thumbnail_overlay_component:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.title_component ~= nil then
        local v77 = v32.title_component:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.focus_navigation_actions_component ~= nil then
        local v80 = v32.focus_navigation_actions_component:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.thumbnail_background_style ~= nil then
        local v83 = v32.thumbnail_background_style:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.title_font ~= nil then
        local v86 = v32.title_font:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    if v32.enable_legacy_hover_state ~= nil then
        local v89 = v32.enable_legacy_hover_state:encode();
        local v90, v91 = v0.writeTag(v33, v34, 19, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v33 = v90;
        v34 = v91;
    end;
    if v32.universe_id ~= nil then
        local v92 = v32.universe_id:encode();
        local v93, v94 = v0.writeTag(v33, v34, 100, v0.wireTypes.lengthDelimited);
        v93, v94 = v0.writeBuffer(v93, v94, v92, buffer.len(v92));
        v33 = v93;
        v34 = v94;
    end;
    if v32.place_id ~= nil then
        local v95 = v32.place_id:encode();
        local v96, v97 = v0.writeTag(v33, v34, 101, v0.wireTypes.lengthDelimited);
        v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
        v33 = v96;
        v34 = v97;
    end;
    if v32.disable_hold_to_play ~= nil then
        local v98 = v32.disable_hold_to_play:encode();
        local v99, v100 = v0.writeTag(v33, v34, 102, v0.wireTypes.lengthDelimited);
        v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
        v33 = v99;
        v34 = v100;
    end;
    if v32.rating_text ~= nil then
        local v101 = v32.rating_text:encode();
        local v102, v103 = v0.writeTag(v33, v34, 103, v0.wireTypes.lengthDelimited);
        v102, v103 = v0.writeBuffer(v102, v103, v101, buffer.len(v101));
        v33 = v102;
        v34 = v103;
    end;
    if v32.player_count ~= nil then
        local v104 = v32.player_count:encode();
        local v105, v106 = v0.writeTag(v33, v34, 104, v0.wireTypes.lengthDelimited);
        v105, v106 = v0.writeBuffer(v105, v106, v104, buffer.len(v104));
        v33 = v105;
        v34 = v106;
    end;
    local v107 = buffer.create(v34);
    buffer.copy(v107, 0, v33, 0, v34);
    return v107;
end;
v6.decode = function(v108) --[[ Line: 434 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v109 = v6.new();
    local v110 = 0;
    while v110 < buffer.len(v108) do
        local v111 = nil;
        local v112 = nil;
        local v113, v114, v115 = v0.readTag(v108, v110);
        v111 = v113;
        v112 = v114;
        v110 = v115;
        if v112 == v0.wireTypes.varint then
            v113 = nil;
            v114, v115 = v0.readVarInt(v108, v110);
            v113 = v114;
            v110 = v115;
        elseif v112 == v0.wireTypes.lengthDelimited then
            if v111 == 1 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.image_aspect_ratio = v3.FloatProp.decode(v113);
            elseif v111 == 2 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.title_text = v3.StringProp.decode(v113);
            elseif v111 == 3 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.image = v3.ImageStringProp.decode(v113);
            elseif v111 == 4 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.is_contained = v3.BoolProp.decode(v113);
            elseif v111 == 5 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.on_activated = v4.ActionProp.decode(v113);
            elseif v111 == 6 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.background_image = v3.ImageSetProp.decode(v113);
            elseif v111 == 7 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.containment_padding = v3.Int32Prop.decode(v113);
            elseif v111 == 8 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.corner_radius = v3.Int32Prop.decode(v113);
            elseif v111 == 9 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.title_lines = v3.Int32Prop.decode(v113);
            elseif v111 == 10 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.background_image_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 11 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.cta_button_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 12 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.footer_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 13 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.image_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 14 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.thumbnail_overlay_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 15 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.title_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 16 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.focus_navigation_actions_component = v3.NestedComponentProp.decode(v113);
            elseif v111 == 17 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.thumbnail_background_style = v3.ColorProp.decode(v113);
            elseif v111 == 18 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.title_font = v3.TypographyProp.decode(v113);
            elseif v111 == 19 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.enable_legacy_hover_state = v3.BoolProp.decode(v113);
            elseif v111 == 100 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.universe_id = v3.StringProp.decode(v113);
            elseif v111 == 101 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.place_id = v3.StringProp.decode(v113);
            elseif v111 == 102 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.disable_hold_to_play = v3.BoolProp.decode(v113);
            elseif v111 == 103 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.rating_text = v3.StringProp.decode(v113);
            elseif v111 == 104 then
                v113 = nil;
                v114, v115 = v0.readBuffer(v108, v110);
                v113 = v114;
                v110 = v115;
                v109.player_count = v3.FloatProp.decode(v113);
            else
                v113 = nil;
                v114, v115 = v0.readVarInt(v108, v110);
                v110 = v115 + v114;
            end;
        elseif v112 == v0.wireTypes.i32 then
            v113 = nil;
            v114, v115 = v0.readFixed32(v108, v110);
            v113 = v114;
            v110 = v115;
        elseif v112 == v0.wireTypes.i64 then
            v113 = nil;
            v114, v115 = v0.readFixed64(v108, v110);
            v113 = v114;
            v110 = v115;
        else
            error("Unsupported wire type: " .. v112);
        end;
    end;
    return v109;
end;
v6.jsonEncode = function(v116) --[[ Line: 601 ]] --[[ Name: jsonEncode ]]
    local v117 = {};
    if v116.image_aspect_ratio ~= nil then
        v117.imageAspectRatio = v116.image_aspect_ratio:jsonEncode();
    end;
    if v116.title_text ~= nil then
        v117.titleText = v116.title_text:jsonEncode();
    end;
    if v116.image ~= nil then
        v117.image = v116.image:jsonEncode();
    end;
    if v116.is_contained ~= nil then
        v117.isContained = v116.is_contained:jsonEncode();
    end;
    if v116.on_activated ~= nil then
        v117.onActivated = v116.on_activated:jsonEncode();
    end;
    if v116.background_image ~= nil then
        v117.backgroundImage = v116.background_image:jsonEncode();
    end;
    if v116.containment_padding ~= nil then
        v117.containmentPadding = v116.containment_padding:jsonEncode();
    end;
    if v116.corner_radius ~= nil then
        v117.cornerRadius = v116.corner_radius:jsonEncode();
    end;
    if v116.title_lines ~= nil then
        v117.titleLines = v116.title_lines:jsonEncode();
    end;
    if v116.background_image_component ~= nil then
        v117.backgroundImageComponent = v116.background_image_component:jsonEncode();
    end;
    if v116.cta_button_component ~= nil then
        v117.ctaButtonComponent = v116.cta_button_component:jsonEncode();
    end;
    if v116.footer_component ~= nil then
        v117.footerComponent = v116.footer_component:jsonEncode();
    end;
    if v116.image_component ~= nil then
        v117.imageComponent = v116.image_component:jsonEncode();
    end;
    if v116.thumbnail_overlay_component ~= nil then
        v117.thumbnailOverlayComponent = v116.thumbnail_overlay_component:jsonEncode();
    end;
    if v116.title_component ~= nil then
        v117.titleComponent = v116.title_component:jsonEncode();
    end;
    if v116.focus_navigation_actions_component ~= nil then
        v117.focusNavigationActionsComponent = v116.focus_navigation_actions_component:jsonEncode();
    end;
    if v116.thumbnail_background_style ~= nil then
        v117.thumbnailBackgroundStyle = v116.thumbnail_background_style:jsonEncode();
    end;
    if v116.title_font ~= nil then
        v117.titleFont = v116.title_font:jsonEncode();
    end;
    if v116.enable_legacy_hover_state ~= nil then
        v117.enableLegacyHoverState = v116.enable_legacy_hover_state:jsonEncode();
    end;
    if v116.universe_id ~= nil then
        v117.universeId = v116.universe_id:jsonEncode();
    end;
    if v116.place_id ~= nil then
        v117.placeId = v116.place_id:jsonEncode();
    end;
    if v116.disable_hold_to_play ~= nil then
        v117.disableHoldToPlay = v116.disable_hold_to_play:jsonEncode();
    end;
    if v116.rating_text ~= nil then
        v117.ratingText = v116.rating_text:jsonEncode();
    end;
    if v116.player_count ~= nil then
        v117.playerCount = v116.player_count:jsonEncode();
    end;
    return v117;
end;
v6.jsonDecode = function(v118) --[[ Line: 703 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v119 = v6.new();
    if v118.image_aspect_ratio ~= nil then
        v119.image_aspect_ratio = v3.FloatProp.jsonDecode(v118.image_aspect_ratio);
    end;
    if v118.imageAspectRatio ~= nil then
        v119.image_aspect_ratio = v3.FloatProp.jsonDecode(v118.imageAspectRatio);
    end;
    if v118.title_text ~= nil then
        v119.title_text = v3.StringProp.jsonDecode(v118.title_text);
    end;
    if v118.titleText ~= nil then
        v119.title_text = v3.StringProp.jsonDecode(v118.titleText);
    end;
    if v118.image ~= nil then
        v119.image = v3.ImageStringProp.jsonDecode(v118.image);
    end;
    if v118.is_contained ~= nil then
        v119.is_contained = v3.BoolProp.jsonDecode(v118.is_contained);
    end;
    if v118.isContained ~= nil then
        v119.is_contained = v3.BoolProp.jsonDecode(v118.isContained);
    end;
    if v118.on_activated ~= nil then
        v119.on_activated = v4.ActionProp.jsonDecode(v118.on_activated);
    end;
    if v118.onActivated ~= nil then
        v119.on_activated = v4.ActionProp.jsonDecode(v118.onActivated);
    end;
    if v118.background_image ~= nil then
        v119.background_image = v3.ImageSetProp.jsonDecode(v118.background_image);
    end;
    if v118.backgroundImage ~= nil then
        v119.background_image = v3.ImageSetProp.jsonDecode(v118.backgroundImage);
    end;
    if v118.containment_padding ~= nil then
        v119.containment_padding = v3.Int32Prop.jsonDecode(v118.containment_padding);
    end;
    if v118.containmentPadding ~= nil then
        v119.containment_padding = v3.Int32Prop.jsonDecode(v118.containmentPadding);
    end;
    if v118.corner_radius ~= nil then
        v119.corner_radius = v3.Int32Prop.jsonDecode(v118.corner_radius);
    end;
    if v118.cornerRadius ~= nil then
        v119.corner_radius = v3.Int32Prop.jsonDecode(v118.cornerRadius);
    end;
    if v118.title_lines ~= nil then
        v119.title_lines = v3.Int32Prop.jsonDecode(v118.title_lines);
    end;
    if v118.titleLines ~= nil then
        v119.title_lines = v3.Int32Prop.jsonDecode(v118.titleLines);
    end;
    if v118.background_image_component ~= nil then
        v119.background_image_component = v3.NestedComponentProp.jsonDecode(v118.background_image_component);
    end;
    if v118.backgroundImageComponent ~= nil then
        v119.background_image_component = v3.NestedComponentProp.jsonDecode(v118.backgroundImageComponent);
    end;
    if v118.cta_button_component ~= nil then
        v119.cta_button_component = v3.NestedComponentProp.jsonDecode(v118.cta_button_component);
    end;
    if v118.ctaButtonComponent ~= nil then
        v119.cta_button_component = v3.NestedComponentProp.jsonDecode(v118.ctaButtonComponent);
    end;
    if v118.footer_component ~= nil then
        v119.footer_component = v3.NestedComponentProp.jsonDecode(v118.footer_component);
    end;
    if v118.footerComponent ~= nil then
        v119.footer_component = v3.NestedComponentProp.jsonDecode(v118.footerComponent);
    end;
    if v118.image_component ~= nil then
        v119.image_component = v3.NestedComponentProp.jsonDecode(v118.image_component);
    end;
    if v118.imageComponent ~= nil then
        v119.image_component = v3.NestedComponentProp.jsonDecode(v118.imageComponent);
    end;
    if v118.thumbnail_overlay_component ~= nil then
        v119.thumbnail_overlay_component = v3.NestedComponentProp.jsonDecode(v118.thumbnail_overlay_component);
    end;
    if v118.thumbnailOverlayComponent ~= nil then
        v119.thumbnail_overlay_component = v3.NestedComponentProp.jsonDecode(v118.thumbnailOverlayComponent);
    end;
    if v118.title_component ~= nil then
        v119.title_component = v3.NestedComponentProp.jsonDecode(v118.title_component);
    end;
    if v118.titleComponent ~= nil then
        v119.title_component = v3.NestedComponentProp.jsonDecode(v118.titleComponent);
    end;
    if v118.focus_navigation_actions_component ~= nil then
        v119.focus_navigation_actions_component = v3.NestedComponentProp.jsonDecode(v118.focus_navigation_actions_component);
    end;
    if v118.focusNavigationActionsComponent ~= nil then
        v119.focus_navigation_actions_component = v3.NestedComponentProp.jsonDecode(v118.focusNavigationActionsComponent);
    end;
    if v118.thumbnail_background_style ~= nil then
        v119.thumbnail_background_style = v3.ColorProp.jsonDecode(v118.thumbnail_background_style);
    end;
    if v118.thumbnailBackgroundStyle ~= nil then
        v119.thumbnail_background_style = v3.ColorProp.jsonDecode(v118.thumbnailBackgroundStyle);
    end;
    if v118.title_font ~= nil then
        v119.title_font = v3.TypographyProp.jsonDecode(v118.title_font);
    end;
    if v118.titleFont ~= nil then
        v119.title_font = v3.TypographyProp.jsonDecode(v118.titleFont);
    end;
    if v118.enable_legacy_hover_state ~= nil then
        v119.enable_legacy_hover_state = v3.BoolProp.jsonDecode(v118.enable_legacy_hover_state);
    end;
    if v118.enableLegacyHoverState ~= nil then
        v119.enable_legacy_hover_state = v3.BoolProp.jsonDecode(v118.enableLegacyHoverState);
    end;
    if v118.universe_id ~= nil then
        v119.universe_id = v3.StringProp.jsonDecode(v118.universe_id);
    end;
    if v118.universeId ~= nil then
        v119.universe_id = v3.StringProp.jsonDecode(v118.universeId);
    end;
    if v118.place_id ~= nil then
        v119.place_id = v3.StringProp.jsonDecode(v118.place_id);
    end;
    if v118.placeId ~= nil then
        v119.place_id = v3.StringProp.jsonDecode(v118.placeId);
    end;
    if v118.disable_hold_to_play ~= nil then
        v119.disable_hold_to_play = v3.BoolProp.jsonDecode(v118.disable_hold_to_play);
    end;
    if v118.disableHoldToPlay ~= nil then
        v119.disable_hold_to_play = v3.BoolProp.jsonDecode(v118.disableHoldToPlay);
    end;
    if v118.rating_text ~= nil then
        v119.rating_text = v3.StringProp.jsonDecode(v118.rating_text);
    end;
    if v118.ratingText ~= nil then
        v119.rating_text = v3.StringProp.jsonDecode(v118.ratingText);
    end;
    if v118.player_count ~= nil then
        v119.player_count = v3.FloatProp.jsonDecode(v118.player_count);
    end;
    if v118.playerCount ~= nil then
        v119.player_count = v3.FloatProp.jsonDecode(v118.playerCount);
    end;
    return v119;
end;
v6.descriptor = {
    name = "GameTileSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.GameTileSchema_Props = v6;
v1.default:register(v2.GameTileSchema_Props);
return {
    GameTileSchema = v2.GameTileSchema, 
    GameTileSchema_Props = v2.GameTileSchema_Props
};