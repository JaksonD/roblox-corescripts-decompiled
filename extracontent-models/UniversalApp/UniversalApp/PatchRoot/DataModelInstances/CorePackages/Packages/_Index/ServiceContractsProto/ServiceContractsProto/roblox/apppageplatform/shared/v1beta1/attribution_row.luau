local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = require(script.Parent.prop_types_engine);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 131 ]] --[[ Name: new ]]
    -- upvalues: l_v7_0 (copy)
    return (setmetatable({
        props = if not (v9 ~= nil) or v9.props == nil then nil else v9.props, 
        shared = if not (v9 ~= nil) or v9.shared == nil then nil else v9.shared
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 138 ]] --[[ Name: encode ]]
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
v7.decode = function(v20) --[[ Line: 159 ]] --[[ Name: decode ]]
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
                v21.props = v2.AttributionRowSchema_Props.decode(v25);
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
v7.jsonEncode = function(v28) --[[ Line: 207 ]] --[[ Name: jsonEncode ]]
    local v29 = {};
    if v28.props ~= nil then
        v29.props = v28.props:jsonEncode();
    end;
    if v28.shared ~= nil then
        v29.shared = v28.shared:jsonEncode();
    end;
    return v29;
end;
v7.jsonDecode = function(v30) --[[ Line: 221 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v2 (copy), v5 (copy)
    local v31 = l_v7_0.new();
    if v30.props ~= nil then
        v31.props = v2.AttributionRowSchema_Props.jsonDecode(v30.props);
    end;
    if v30.shared ~= nil then
        v31.shared = v5.ComponentShared.jsonDecode(v30.shared);
    end;
    return v31;
end;
v7.descriptor = {
    name = "AttributionRowSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowSchema"
};
v2.AttributionRowSchema = v7;
v1.default:register(v2.AttributionRowSchema);
v7 = {};
v7.__index = v7;
v7.new = function(v32) --[[ Line: 250 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        on_activated = if not (v32 ~= nil) or v32.on_activated == nil then nil else v32.on_activated, 
        right_button_content = if not (v32 ~= nil) or v32.right_button_content == nil then nil else v32.right_button_content, 
        layout_order = if not (v32 ~= nil) or v32.layout_order == nil then nil else v32.layout_order, 
        position = if not (v32 ~= nil) or v32.position == nil then nil else v32.position, 
        image = if not (v32 ~= nil) or v32.image == nil then nil else v32.image, 
        image_size = if not (v32 ~= nil) or v32.image_size == nil then nil else v32.image_size, 
        title = if not (v32 ~= nil) or v32.title == nil then nil else v32.title, 
        title_text_color = if not (v32 ~= nil) or v32.title_text_color == nil then nil else v32.title_text_color, 
        title_font_style = if not (v32 ~= nil) or v32.title_font_style == nil then nil else v32.title_font_style, 
        subtitle = if not (v32 ~= nil) or v32.subtitle == nil then nil else v32.subtitle, 
        subtitle_text_color = if not (v32 ~= nil) or v32.subtitle_text_color == nil then nil else v32.subtitle_text_color, 
        subtitle_font_style = if not (v32 ~= nil) or v32.subtitle_font_style == nil then nil else v32.subtitle_font_style, 
        subtitle_icon_size = if not (v32 ~= nil) or v32.subtitle_icon_size == nil then nil else v32.subtitle_icon_size, 
        subtitle_icon_name = if not (v32 ~= nil) or v32.subtitle_icon_name == nil then nil else v32.subtitle_icon_name, 
        subtitle_icon_style = if not (v32 ~= nil) or v32.subtitle_icon_style == nil then nil else v32.subtitle_icon_style, 
        subtitle_icon_variant = if not (v32 ~= nil) or v32.subtitle_icon_variant == nil then nil else v32.subtitle_icon_variant, 
        subtitle_on_activated = if not (v32 ~= nil) or v32.subtitle_on_activated == nil then nil else v32.subtitle_on_activated, 
        caption = if not (v32 ~= nil) or v32.caption == nil then nil else v32.caption, 
        caption_text_color = if not (v32 ~= nil) or v32.caption_text_color == nil then nil else v32.caption_text_color, 
        caption_font_style = if not (v32 ~= nil) or v32.caption_font_style == nil then nil else v32.caption_font_style, 
        text_container_size = if not (v32 ~= nil) or v32.text_container_size == nil then nil else v32.text_container_size, 
        size = if not (v32 ~= nil) or v32.size == nil then nil else v32.size, 
        subtitle_background_icon_name = if not (v32 ~= nil) or v32.subtitle_background_icon_name == nil then nil else v32.subtitle_background_icon_name, 
        subtitle_background_icon_background_style = if not (v32 ~= nil) or v32.subtitle_background_icon_background_style == nil then nil else v32.subtitle_background_icon_background_style, 
        title_text_wrap = if not (v32 ~= nil) or v32.title_text_wrap == nil then nil else v32.title_text_wrap, 
        title_text_truncate = if not (v32 ~= nil) or v32.title_text_truncate == nil then nil else v32.title_text_truncate, 
        subtitle_text_wrap = if not (v32 ~= nil) or v32.subtitle_text_wrap == nil then nil else v32.subtitle_text_wrap, 
        subtitle_text_truncate = if not (v32 ~= nil) or v32.subtitle_text_truncate == nil then nil else v32.subtitle_text_truncate
    }, v7));
end;
v7.encode = function(v33) --[[ Line: 308 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.on_activated ~= nil then
        local v36 = v33.on_activated:encode();
        local v37, v38 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
        v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
        v34 = v37;
        v35 = v38;
    end;
    if v33.right_button_content ~= nil then
        local v39 = v33.right_button_content:encode();
        local v40, v41 = v0.writeTag(v34, v35, 2, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v34 = v40;
        v35 = v41;
    end;
    if v33.layout_order ~= nil then
        local v42 = v33.layout_order:encode();
        local v43, v44 = v0.writeTag(v34, v35, 3, v0.wireTypes.lengthDelimited);
        v43, v44 = v0.writeBuffer(v43, v44, v42, buffer.len(v42));
        v34 = v43;
        v35 = v44;
    end;
    if v33.position ~= nil then
        local v45 = v33.position:encode();
        local v46, v47 = v0.writeTag(v34, v35, 4, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
        v34 = v46;
        v35 = v47;
    end;
    if v33.image ~= nil then
        local v48 = v33.image:encode();
        local v49, v50 = v0.writeTag(v34, v35, 5, v0.wireTypes.lengthDelimited);
        v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
        v34 = v49;
        v35 = v50;
    end;
    if v33.image_size ~= nil then
        local v51 = v33.image_size:encode();
        local v52, v53 = v0.writeTag(v34, v35, 6, v0.wireTypes.lengthDelimited);
        v52, v53 = v0.writeBuffer(v52, v53, v51, buffer.len(v51));
        v34 = v52;
        v35 = v53;
    end;
    if v33.title ~= nil then
        local v54 = v33.title:encode();
        local v55, v56 = v0.writeTag(v34, v35, 7, v0.wireTypes.lengthDelimited);
        v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
        v34 = v55;
        v35 = v56;
    end;
    if v33.title_text_color ~= nil then
        local v57 = v33.title_text_color:encode();
        local v58, v59 = v0.writeTag(v34, v35, 8, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
        v34 = v58;
        v35 = v59;
    end;
    if v33.title_font_style ~= nil then
        local v60 = v33.title_font_style:encode();
        local v61, v62 = v0.writeTag(v34, v35, 9, v0.wireTypes.lengthDelimited);
        v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
        v34 = v61;
        v35 = v62;
    end;
    if v33.subtitle ~= nil then
        local v63 = v33.subtitle:encode();
        local v64, v65 = v0.writeTag(v34, v35, 10, v0.wireTypes.lengthDelimited);
        v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
        v34 = v64;
        v35 = v65;
    end;
    if v33.subtitle_text_color ~= nil then
        local v66 = v33.subtitle_text_color:encode();
        local v67, v68 = v0.writeTag(v34, v35, 11, v0.wireTypes.lengthDelimited);
        v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
        v34 = v67;
        v35 = v68;
    end;
    if v33.subtitle_font_style ~= nil then
        local v69 = v33.subtitle_font_style:encode();
        local v70, v71 = v0.writeTag(v34, v35, 12, v0.wireTypes.lengthDelimited);
        v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
        v34 = v70;
        v35 = v71;
    end;
    if v33.subtitle_icon_size ~= nil then
        local v72 = v33.subtitle_icon_size:encode();
        local v73, v74 = v0.writeTag(v34, v35, 13, v0.wireTypes.lengthDelimited);
        v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
        v34 = v73;
        v35 = v74;
    end;
    if v33.subtitle_icon_name ~= nil then
        local v75 = v33.subtitle_icon_name:encode();
        local v76, v77 = v0.writeTag(v34, v35, 14, v0.wireTypes.lengthDelimited);
        v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
        v34 = v76;
        v35 = v77;
    end;
    if v33.subtitle_icon_style ~= nil then
        local v78 = v33.subtitle_icon_style:encode();
        local v79, v80 = v0.writeTag(v34, v35, 15, v0.wireTypes.lengthDelimited);
        v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
        v34 = v79;
        v35 = v80;
    end;
    if v33.subtitle_icon_variant ~= nil then
        local v81 = v33.subtitle_icon_variant:encode();
        local v82, v83 = v0.writeTag(v34, v35, 16, v0.wireTypes.lengthDelimited);
        v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
        v34 = v82;
        v35 = v83;
    end;
    if v33.subtitle_on_activated ~= nil then
        local v84 = v33.subtitle_on_activated:encode();
        local v85, v86 = v0.writeTag(v34, v35, 17, v0.wireTypes.lengthDelimited);
        v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
        v34 = v85;
        v35 = v86;
    end;
    if v33.caption ~= nil then
        local v87 = v33.caption:encode();
        local v88, v89 = v0.writeTag(v34, v35, 18, v0.wireTypes.lengthDelimited);
        v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
        v34 = v88;
        v35 = v89;
    end;
    if v33.caption_text_color ~= nil then
        local v90 = v33.caption_text_color:encode();
        local v91, v92 = v0.writeTag(v34, v35, 19, v0.wireTypes.lengthDelimited);
        v91, v92 = v0.writeBuffer(v91, v92, v90, buffer.len(v90));
        v34 = v91;
        v35 = v92;
    end;
    if v33.caption_font_style ~= nil then
        local v93 = v33.caption_font_style:encode();
        local v94, v95 = v0.writeTag(v34, v35, 20, v0.wireTypes.lengthDelimited);
        v94, v95 = v0.writeBuffer(v94, v95, v93, buffer.len(v93));
        v34 = v94;
        v35 = v95;
    end;
    if v33.text_container_size ~= nil then
        local v96 = v33.text_container_size:encode();
        local v97, v98 = v0.writeTag(v34, v35, 21, v0.wireTypes.lengthDelimited);
        v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
        v34 = v97;
        v35 = v98;
    end;
    if v33.size ~= nil then
        local v99 = v33.size:encode();
        local v100, v101 = v0.writeTag(v34, v35, 22, v0.wireTypes.lengthDelimited);
        v100, v101 = v0.writeBuffer(v100, v101, v99, buffer.len(v99));
        v34 = v100;
        v35 = v101;
    end;
    if v33.subtitle_background_icon_name ~= nil then
        local v102 = v33.subtitle_background_icon_name:encode();
        local v103, v104 = v0.writeTag(v34, v35, 23, v0.wireTypes.lengthDelimited);
        v103, v104 = v0.writeBuffer(v103, v104, v102, buffer.len(v102));
        v34 = v103;
        v35 = v104;
    end;
    if v33.subtitle_background_icon_background_style ~= nil then
        local v105 = v33.subtitle_background_icon_background_style:encode();
        local v106, v107 = v0.writeTag(v34, v35, 24, v0.wireTypes.lengthDelimited);
        v106, v107 = v0.writeBuffer(v106, v107, v105, buffer.len(v105));
        v34 = v106;
        v35 = v107;
    end;
    if v33.title_text_wrap ~= nil then
        local v108 = v33.title_text_wrap:encode();
        local v109, v110 = v0.writeTag(v34, v35, 25, v0.wireTypes.lengthDelimited);
        v109, v110 = v0.writeBuffer(v109, v110, v108, buffer.len(v108));
        v34 = v109;
        v35 = v110;
    end;
    if v33.title_text_truncate ~= nil then
        local v111 = v33.title_text_truncate:encode();
        local v112, v113 = v0.writeTag(v34, v35, 26, v0.wireTypes.lengthDelimited);
        v112, v113 = v0.writeBuffer(v112, v113, v111, buffer.len(v111));
        v34 = v112;
        v35 = v113;
    end;
    if v33.subtitle_text_wrap ~= nil then
        local v114 = v33.subtitle_text_wrap:encode();
        local v115, v116 = v0.writeTag(v34, v35, 27, v0.wireTypes.lengthDelimited);
        v115, v116 = v0.writeBuffer(v115, v116, v114, buffer.len(v114));
        v34 = v115;
        v35 = v116;
    end;
    if v33.subtitle_text_truncate ~= nil then
        local v117 = v33.subtitle_text_truncate:encode();
        local v118, v119 = v0.writeTag(v34, v35, 28, v0.wireTypes.lengthDelimited);
        v118, v119 = v0.writeBuffer(v118, v119, v117, buffer.len(v117));
        v34 = v118;
        v35 = v119;
    end;
    local v120 = buffer.create(v35);
    buffer.copy(v120, 0, v34, 0, v35);
    return v120;
end;
v7.decode = function(v121) --[[ Line: 485 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v4 (copy), v3 (copy), v6 (copy)
    local v122 = v7.new();
    local v123 = 0;
    while v123 < buffer.len(v121) do
        local v124 = nil;
        local v125 = nil;
        local v126, v127, v128 = v0.readTag(v121, v123);
        v124 = v126;
        v125 = v127;
        v123 = v128;
        if v125 == v0.wireTypes.varint then
            v126 = nil;
            v127, v128 = v0.readVarInt(v121, v123);
            v126 = v127;
            v123 = v128;
        elseif v125 == v0.wireTypes.lengthDelimited then
            if v124 == 1 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.on_activated = v4.ActionProp.decode(v126);
            elseif v124 == 2 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.right_button_content = v3.NestedComponentProp.decode(v126);
            elseif v124 == 3 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.layout_order = v3.Int32Prop.decode(v126);
            elseif v124 == 4 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.position = v3.UDim2Prop.decode(v126);
            elseif v124 == 5 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.image = v3.ImageStringProp.decode(v126);
            elseif v124 == 6 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.image_size = v3.UDim2Prop.decode(v126);
            elseif v124 == 7 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.title = v3.StringProp.decode(v126);
            elseif v124 == 8 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.title_text_color = v3.ColorProp.decode(v126);
            elseif v124 == 9 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.title_font_style = v3.TypographyProp.decode(v126);
            elseif v124 == 10 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle = v3.StringProp.decode(v126);
            elseif v124 == 11 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_text_color = v3.ColorProp.decode(v126);
            elseif v124 == 12 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_font_style = v3.TypographyProp.decode(v126);
            elseif v124 == 13 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_icon_size = v3.StringProp.decode(v126);
            elseif v124 == 14 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_icon_name = v3.StringProp.decode(v126);
            elseif v124 == 15 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_icon_style = v3.StringProp.decode(v126);
            elseif v124 == 16 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_icon_variant = v3.StringProp.decode(v126);
            elseif v124 == 17 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_on_activated = v4.ActionProp.decode(v126);
            elseif v124 == 18 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.caption = v3.StringProp.decode(v126);
            elseif v124 == 19 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.caption_text_color = v3.ColorProp.decode(v126);
            elseif v124 == 20 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.caption_font_style = v3.TypographyProp.decode(v126);
            elseif v124 == 21 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.text_container_size = v3.UDim2Prop.decode(v126);
            elseif v124 == 22 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.size = v3.UDim2Prop.decode(v126);
            elseif v124 == 23 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_background_icon_name = v3.StringProp.decode(v126);
            elseif v124 == 24 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_background_icon_background_style = v3.ColorProp.decode(v126);
            elseif v124 == 25 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.title_text_wrap = v3.BoolProp.decode(v126);
            elseif v124 == 26 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.title_text_truncate = v6.TextTruncateProp.decode(v126);
            elseif v124 == 27 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_text_wrap = v3.BoolProp.decode(v126);
            elseif v124 == 28 then
                v126 = nil;
                v127, v128 = v0.readBuffer(v121, v123);
                v126 = v127;
                v123 = v128;
                v122.subtitle_text_truncate = v6.TextTruncateProp.decode(v126);
            else
                v126 = nil;
                v127, v128 = v0.readVarInt(v121, v123);
                v123 = v128 + v127;
            end;
        elseif v125 == v0.wireTypes.i32 then
            v126 = nil;
            v127, v128 = v0.readFixed32(v121, v123);
            v126 = v127;
            v123 = v128;
        elseif v125 == v0.wireTypes.i64 then
            v126 = nil;
            v127, v128 = v0.readFixed64(v121, v123);
            v126 = v127;
            v123 = v128;
        else
            error("Unsupported wire type: " .. v125);
        end;
    end;
    return v122;
end;
v7.jsonEncode = function(v129) --[[ Line: 673 ]] --[[ Name: jsonEncode ]]
    local v130 = {};
    if v129.on_activated ~= nil then
        v130.onActivated = v129.on_activated:jsonEncode();
    end;
    if v129.right_button_content ~= nil then
        v130.rightButtonContent = v129.right_button_content:jsonEncode();
    end;
    if v129.layout_order ~= nil then
        v130.layoutOrder = v129.layout_order:jsonEncode();
    end;
    if v129.position ~= nil then
        v130.position = v129.position:jsonEncode();
    end;
    if v129.image ~= nil then
        v130.image = v129.image:jsonEncode();
    end;
    if v129.image_size ~= nil then
        v130.imageSize = v129.image_size:jsonEncode();
    end;
    if v129.title ~= nil then
        v130.title = v129.title:jsonEncode();
    end;
    if v129.title_text_color ~= nil then
        v130.titleTextColor = v129.title_text_color:jsonEncode();
    end;
    if v129.title_font_style ~= nil then
        v130.titleFontStyle = v129.title_font_style:jsonEncode();
    end;
    if v129.subtitle ~= nil then
        v130.subtitle = v129.subtitle:jsonEncode();
    end;
    if v129.subtitle_text_color ~= nil then
        v130.subtitleTextColor = v129.subtitle_text_color:jsonEncode();
    end;
    if v129.subtitle_font_style ~= nil then
        v130.subtitleFontStyle = v129.subtitle_font_style:jsonEncode();
    end;
    if v129.subtitle_icon_size ~= nil then
        v130.subtitleIconSize = v129.subtitle_icon_size:jsonEncode();
    end;
    if v129.subtitle_icon_name ~= nil then
        v130.subtitleIconName = v129.subtitle_icon_name:jsonEncode();
    end;
    if v129.subtitle_icon_style ~= nil then
        v130.subtitleIconStyle = v129.subtitle_icon_style:jsonEncode();
    end;
    if v129.subtitle_icon_variant ~= nil then
        v130.subtitleIconVariant = v129.subtitle_icon_variant:jsonEncode();
    end;
    if v129.subtitle_on_activated ~= nil then
        v130.subtitleOnActivated = v129.subtitle_on_activated:jsonEncode();
    end;
    if v129.caption ~= nil then
        v130.caption = v129.caption:jsonEncode();
    end;
    if v129.caption_text_color ~= nil then
        v130.captionTextColor = v129.caption_text_color:jsonEncode();
    end;
    if v129.caption_font_style ~= nil then
        v130.captionFontStyle = v129.caption_font_style:jsonEncode();
    end;
    if v129.text_container_size ~= nil then
        v130.textContainerSize = v129.text_container_size:jsonEncode();
    end;
    if v129.size ~= nil then
        v130.size = v129.size:jsonEncode();
    end;
    if v129.subtitle_background_icon_name ~= nil then
        v130.subtitleBackgroundIconName = v129.subtitle_background_icon_name:jsonEncode();
    end;
    if v129.subtitle_background_icon_background_style ~= nil then
        v130.subtitleBackgroundIconBackgroundStyle = v129.subtitle_background_icon_background_style:jsonEncode();
    end;
    if v129.title_text_wrap ~= nil then
        v130.titleTextWrap = v129.title_text_wrap:jsonEncode();
    end;
    if v129.title_text_truncate ~= nil then
        v130.titleTextTruncate = v129.title_text_truncate:jsonEncode();
    end;
    if v129.subtitle_text_wrap ~= nil then
        v130.subtitleTextWrap = v129.subtitle_text_wrap:jsonEncode();
    end;
    if v129.subtitle_text_truncate ~= nil then
        v130.subtitleTextTruncate = v129.subtitle_text_truncate:jsonEncode();
    end;
    return v130;
end;
v7.jsonDecode = function(v131) --[[ Line: 791 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v4 (copy), v3 (copy), v6 (copy)
    local v132 = v7.new();
    if v131.on_activated ~= nil then
        v132.on_activated = v4.ActionProp.jsonDecode(v131.on_activated);
    end;
    if v131.onActivated ~= nil then
        v132.on_activated = v4.ActionProp.jsonDecode(v131.onActivated);
    end;
    if v131.right_button_content ~= nil then
        v132.right_button_content = v3.NestedComponentProp.jsonDecode(v131.right_button_content);
    end;
    if v131.rightButtonContent ~= nil then
        v132.right_button_content = v3.NestedComponentProp.jsonDecode(v131.rightButtonContent);
    end;
    if v131.layout_order ~= nil then
        v132.layout_order = v3.Int32Prop.jsonDecode(v131.layout_order);
    end;
    if v131.layoutOrder ~= nil then
        v132.layout_order = v3.Int32Prop.jsonDecode(v131.layoutOrder);
    end;
    if v131.position ~= nil then
        v132.position = v3.UDim2Prop.jsonDecode(v131.position);
    end;
    if v131.image ~= nil then
        v132.image = v3.ImageStringProp.jsonDecode(v131.image);
    end;
    if v131.image_size ~= nil then
        v132.image_size = v3.UDim2Prop.jsonDecode(v131.image_size);
    end;
    if v131.imageSize ~= nil then
        v132.image_size = v3.UDim2Prop.jsonDecode(v131.imageSize);
    end;
    if v131.title ~= nil then
        v132.title = v3.StringProp.jsonDecode(v131.title);
    end;
    if v131.title_text_color ~= nil then
        v132.title_text_color = v3.ColorProp.jsonDecode(v131.title_text_color);
    end;
    if v131.titleTextColor ~= nil then
        v132.title_text_color = v3.ColorProp.jsonDecode(v131.titleTextColor);
    end;
    if v131.title_font_style ~= nil then
        v132.title_font_style = v3.TypographyProp.jsonDecode(v131.title_font_style);
    end;
    if v131.titleFontStyle ~= nil then
        v132.title_font_style = v3.TypographyProp.jsonDecode(v131.titleFontStyle);
    end;
    if v131.subtitle ~= nil then
        v132.subtitle = v3.StringProp.jsonDecode(v131.subtitle);
    end;
    if v131.subtitle_text_color ~= nil then
        v132.subtitle_text_color = v3.ColorProp.jsonDecode(v131.subtitle_text_color);
    end;
    if v131.subtitleTextColor ~= nil then
        v132.subtitle_text_color = v3.ColorProp.jsonDecode(v131.subtitleTextColor);
    end;
    if v131.subtitle_font_style ~= nil then
        v132.subtitle_font_style = v3.TypographyProp.jsonDecode(v131.subtitle_font_style);
    end;
    if v131.subtitleFontStyle ~= nil then
        v132.subtitle_font_style = v3.TypographyProp.jsonDecode(v131.subtitleFontStyle);
    end;
    if v131.subtitle_icon_size ~= nil then
        v132.subtitle_icon_size = v3.StringProp.jsonDecode(v131.subtitle_icon_size);
    end;
    if v131.subtitleIconSize ~= nil then
        v132.subtitle_icon_size = v3.StringProp.jsonDecode(v131.subtitleIconSize);
    end;
    if v131.subtitle_icon_name ~= nil then
        v132.subtitle_icon_name = v3.StringProp.jsonDecode(v131.subtitle_icon_name);
    end;
    if v131.subtitleIconName ~= nil then
        v132.subtitle_icon_name = v3.StringProp.jsonDecode(v131.subtitleIconName);
    end;
    if v131.subtitle_icon_style ~= nil then
        v132.subtitle_icon_style = v3.StringProp.jsonDecode(v131.subtitle_icon_style);
    end;
    if v131.subtitleIconStyle ~= nil then
        v132.subtitle_icon_style = v3.StringProp.jsonDecode(v131.subtitleIconStyle);
    end;
    if v131.subtitle_icon_variant ~= nil then
        v132.subtitle_icon_variant = v3.StringProp.jsonDecode(v131.subtitle_icon_variant);
    end;
    if v131.subtitleIconVariant ~= nil then
        v132.subtitle_icon_variant = v3.StringProp.jsonDecode(v131.subtitleIconVariant);
    end;
    if v131.subtitle_on_activated ~= nil then
        v132.subtitle_on_activated = v4.ActionProp.jsonDecode(v131.subtitle_on_activated);
    end;
    if v131.subtitleOnActivated ~= nil then
        v132.subtitle_on_activated = v4.ActionProp.jsonDecode(v131.subtitleOnActivated);
    end;
    if v131.caption ~= nil then
        v132.caption = v3.StringProp.jsonDecode(v131.caption);
    end;
    if v131.caption_text_color ~= nil then
        v132.caption_text_color = v3.ColorProp.jsonDecode(v131.caption_text_color);
    end;
    if v131.captionTextColor ~= nil then
        v132.caption_text_color = v3.ColorProp.jsonDecode(v131.captionTextColor);
    end;
    if v131.caption_font_style ~= nil then
        v132.caption_font_style = v3.TypographyProp.jsonDecode(v131.caption_font_style);
    end;
    if v131.captionFontStyle ~= nil then
        v132.caption_font_style = v3.TypographyProp.jsonDecode(v131.captionFontStyle);
    end;
    if v131.text_container_size ~= nil then
        v132.text_container_size = v3.UDim2Prop.jsonDecode(v131.text_container_size);
    end;
    if v131.textContainerSize ~= nil then
        v132.text_container_size = v3.UDim2Prop.jsonDecode(v131.textContainerSize);
    end;
    if v131.size ~= nil then
        v132.size = v3.UDim2Prop.jsonDecode(v131.size);
    end;
    if v131.subtitle_background_icon_name ~= nil then
        v132.subtitle_background_icon_name = v3.StringProp.jsonDecode(v131.subtitle_background_icon_name);
    end;
    if v131.subtitleBackgroundIconName ~= nil then
        v132.subtitle_background_icon_name = v3.StringProp.jsonDecode(v131.subtitleBackgroundIconName);
    end;
    if v131.subtitle_background_icon_background_style ~= nil then
        v132.subtitle_background_icon_background_style = v3.ColorProp.jsonDecode(v131.subtitle_background_icon_background_style);
    end;
    if v131.subtitleBackgroundIconBackgroundStyle ~= nil then
        v132.subtitle_background_icon_background_style = v3.ColorProp.jsonDecode(v131.subtitleBackgroundIconBackgroundStyle);
    end;
    if v131.title_text_wrap ~= nil then
        v132.title_text_wrap = v3.BoolProp.jsonDecode(v131.title_text_wrap);
    end;
    if v131.titleTextWrap ~= nil then
        v132.title_text_wrap = v3.BoolProp.jsonDecode(v131.titleTextWrap);
    end;
    if v131.title_text_truncate ~= nil then
        v132.title_text_truncate = v6.TextTruncateProp.jsonDecode(v131.title_text_truncate);
    end;
    if v131.titleTextTruncate ~= nil then
        v132.title_text_truncate = v6.TextTruncateProp.jsonDecode(v131.titleTextTruncate);
    end;
    if v131.subtitle_text_wrap ~= nil then
        v132.subtitle_text_wrap = v3.BoolProp.jsonDecode(v131.subtitle_text_wrap);
    end;
    if v131.subtitleTextWrap ~= nil then
        v132.subtitle_text_wrap = v3.BoolProp.jsonDecode(v131.subtitleTextWrap);
    end;
    if v131.subtitle_text_truncate ~= nil then
        v132.subtitle_text_truncate = v6.TextTruncateProp.jsonDecode(v131.subtitle_text_truncate);
    end;
    if v131.subtitleTextTruncate ~= nil then
        v132.subtitle_text_truncate = v6.TextTruncateProp.jsonDecode(v131.subtitleTextTruncate);
    end;
    return v132;
end;
v7.descriptor = {
    name = "AttributionRowSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.AttributionRowSchema_Props = v7;
v1.default:register(v2.AttributionRowSchema_Props);
return {
    AttributionRowSchema = v2.AttributionRowSchema, 
    AttributionRowSchema_Props = v2.AttributionRowSchema_Props
};