local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 125 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 132 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 153 ]] --[[ Name: decode ]]
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
                v20.props = v2.SectionHeaderSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 201 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 215 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.SectionHeaderSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "SectionHeaderSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SectionHeaderSchema"
};
v2.SectionHeaderSchema = v6;
v1.default:register(v2.SectionHeaderSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 244 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        automatic_size = if not (v31 ~= nil) or v31.automatic_size == nil then nil else v31.automatic_size, 
        layout_order = if not (v31 ~= nil) or v31.layout_order == nil then nil else v31.layout_order, 
        anchor_point = if not (v31 ~= nil) or v31.anchor_point == nil then nil else v31.anchor_point, 
        size = if not (v31 ~= nil) or v31.size == nil then nil else v31.size, 
        z_index = if not (v31 ~= nil) or v31.z_index == nil then nil else v31.z_index, 
        position = if not (v31 ~= nil) or v31.position == nil then nil else v31.position, 
        icon_component = if not (v31 ~= nil) or v31.icon_component == nil then nil else v31.icon_component, 
        info_text = if not (v31 ~= nil) or v31.info_text == nil then nil else v31.info_text, 
        on_title_activated = if not (v31 ~= nil) or v31.on_title_activated == nil then nil else v31.on_title_activated, 
        on_subtitle_activated = if not (v31 ~= nil) or v31.on_subtitle_activated == nil then nil else v31.on_subtitle_activated, 
        on_info_icon_activated = if not (v31 ~= nil) or v31.on_info_icon_activated == nil then nil else v31.on_info_icon_activated, 
        subtitle_color = if not (v31 ~= nil) or v31.subtitle_color == nil then nil else v31.subtitle_color, 
        subtitle_component = if not (v31 ~= nil) or v31.subtitle_component == nil then nil else v31.subtitle_component, 
        subtitle_icon = if not (v31 ~= nil) or v31.subtitle_icon == nil then nil else v31.subtitle_icon, 
        subtitle_icon_width = if not (v31 ~= nil) or v31.subtitle_icon_width == nil then nil else v31.subtitle_icon_width, 
        subtitle_font_style = if not (v31 ~= nil) or v31.subtitle_font_style == nil then nil else v31.subtitle_font_style, 
        subtitle_gap = if not (v31 ~= nil) or v31.subtitle_gap == nil then nil else v31.subtitle_gap, 
        subtitle_text = if not (v31 ~= nil) or v31.subtitle_text == nil then nil else v31.subtitle_text, 
        title_color = if not (v31 ~= nil) or v31.title_color == nil then nil else v31.title_color, 
        title_component = if not (v31 ~= nil) or v31.title_component == nil then nil else v31.title_component, 
        title_gap = if not (v31 ~= nil) or v31.title_gap == nil then nil else v31.title_gap, 
        title_icon = if not (v31 ~= nil) or v31.title_icon == nil then nil else v31.title_icon, 
        title_icon_width = if not (v31 ~= nil) or v31.title_icon_width == nil then nil else v31.title_icon_width, 
        title_font_style = if not (v31 ~= nil) or v31.title_font_style == nil then nil else v31.title_font_style, 
        title_text = if not (v31 ~= nil) or v31.title_text == nil then nil else v31.title_text, 
        vertical_gap = if not (v31 ~= nil) or v31.vertical_gap == nil then nil else v31.vertical_gap, 
        allow_interaction_for_directional_input = if not (v31 ~= nil) or v31.allow_interaction_for_directional_input == nil then nil else v31.allow_interaction_for_directional_input
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 289 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.automatic_size ~= nil then
        local v35 = v32.automatic_size:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.layout_order ~= nil then
        local v38 = v32.layout_order:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.anchor_point ~= nil then
        local v41 = v32.anchor_point:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.size ~= nil then
        local v44 = v32.size:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.z_index ~= nil then
        local v47 = v32.z_index:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.position ~= nil then
        local v50 = v32.position:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.icon_component ~= nil then
        local v53 = v32.icon_component:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.info_text ~= nil then
        local v56 = v32.info_text:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.on_title_activated ~= nil then
        local v59 = v32.on_title_activated:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.on_subtitle_activated ~= nil then
        local v62 = v32.on_subtitle_activated:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    if v32.on_info_icon_activated ~= nil then
        local v65 = v32.on_info_icon_activated:encode();
        local v66, v67 = v0.writeTag(v33, v34, 11, v0.wireTypes.lengthDelimited);
        v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
        v33 = v66;
        v34 = v67;
    end;
    if v32.subtitle_color ~= nil then
        local v68 = v32.subtitle_color:encode();
        local v69, v70 = v0.writeTag(v33, v34, 12, v0.wireTypes.lengthDelimited);
        v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
        v33 = v69;
        v34 = v70;
    end;
    if v32.subtitle_component ~= nil then
        local v71 = v32.subtitle_component:encode();
        local v72, v73 = v0.writeTag(v33, v34, 13, v0.wireTypes.lengthDelimited);
        v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
        v33 = v72;
        v34 = v73;
    end;
    if v32.subtitle_icon ~= nil then
        local v74 = v32.subtitle_icon:encode();
        local v75, v76 = v0.writeTag(v33, v34, 14, v0.wireTypes.lengthDelimited);
        v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
        v33 = v75;
        v34 = v76;
    end;
    if v32.subtitle_icon_width ~= nil then
        local v77 = v32.subtitle_icon_width:encode();
        local v78, v79 = v0.writeTag(v33, v34, 15, v0.wireTypes.lengthDelimited);
        v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
        v33 = v78;
        v34 = v79;
    end;
    if v32.subtitle_font_style ~= nil then
        local v80 = v32.subtitle_font_style:encode();
        local v81, v82 = v0.writeTag(v33, v34, 16, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
        v33 = v81;
        v34 = v82;
    end;
    if v32.subtitle_gap ~= nil then
        local v83 = v32.subtitle_gap:encode();
        local v84, v85 = v0.writeTag(v33, v34, 17, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v33 = v84;
        v34 = v85;
    end;
    if v32.subtitle_text ~= nil then
        local v86 = v32.subtitle_text:encode();
        local v87, v88 = v0.writeTag(v33, v34, 18, v0.wireTypes.lengthDelimited);
        v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
        v33 = v87;
        v34 = v88;
    end;
    if v32.title_color ~= nil then
        local v89 = v32.title_color:encode();
        local v90, v91 = v0.writeTag(v33, v34, 19, v0.wireTypes.lengthDelimited);
        v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
        v33 = v90;
        v34 = v91;
    end;
    if v32.title_component ~= nil then
        local v92 = v32.title_component:encode();
        local v93, v94 = v0.writeTag(v33, v34, 20, v0.wireTypes.lengthDelimited);
        v93, v94 = v0.writeBuffer(v93, v94, v92, buffer.len(v92));
        v33 = v93;
        v34 = v94;
    end;
    if v32.title_gap ~= nil then
        local v95 = v32.title_gap:encode();
        local v96, v97 = v0.writeTag(v33, v34, 21, v0.wireTypes.lengthDelimited);
        v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
        v33 = v96;
        v34 = v97;
    end;
    if v32.title_icon ~= nil then
        local v98 = v32.title_icon:encode();
        local v99, v100 = v0.writeTag(v33, v34, 22, v0.wireTypes.lengthDelimited);
        v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
        v33 = v99;
        v34 = v100;
    end;
    if v32.title_icon_width ~= nil then
        local v101 = v32.title_icon_width:encode();
        local v102, v103 = v0.writeTag(v33, v34, 23, v0.wireTypes.lengthDelimited);
        v102, v103 = v0.writeBuffer(v102, v103, v101, buffer.len(v101));
        v33 = v102;
        v34 = v103;
    end;
    if v32.title_font_style ~= nil then
        local v104 = v32.title_font_style:encode();
        local v105, v106 = v0.writeTag(v33, v34, 24, v0.wireTypes.lengthDelimited);
        v105, v106 = v0.writeBuffer(v105, v106, v104, buffer.len(v104));
        v33 = v105;
        v34 = v106;
    end;
    if v32.title_text ~= nil then
        local v107 = v32.title_text:encode();
        local v108, v109 = v0.writeTag(v33, v34, 25, v0.wireTypes.lengthDelimited);
        v108, v109 = v0.writeBuffer(v108, v109, v107, buffer.len(v107));
        v33 = v108;
        v34 = v109;
    end;
    if v32.vertical_gap ~= nil then
        local v110 = v32.vertical_gap:encode();
        local v111, v112 = v0.writeTag(v33, v34, 26, v0.wireTypes.lengthDelimited);
        v111, v112 = v0.writeBuffer(v111, v112, v110, buffer.len(v110));
        v33 = v111;
        v34 = v112;
    end;
    if v32.allow_interaction_for_directional_input ~= nil then
        local v113 = v32.allow_interaction_for_directional_input:encode();
        local v114, v115 = v0.writeTag(v33, v34, 27, v0.wireTypes.lengthDelimited);
        v114, v115 = v0.writeBuffer(v114, v115, v113, buffer.len(v113));
        v33 = v114;
        v34 = v115;
    end;
    local v116 = buffer.create(v34);
    buffer.copy(v116, 0, v33, 0, v34);
    return v116;
end;
v6.decode = function(v117) --[[ Line: 460 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v118 = v6.new();
    local v119 = 0;
    while v119 < buffer.len(v117) do
        local v120 = nil;
        local v121 = nil;
        local v122, v123, v124 = v0.readTag(v117, v119);
        v120 = v122;
        v121 = v123;
        v119 = v124;
        if v121 == v0.wireTypes.varint then
            v122 = nil;
            v123, v124 = v0.readVarInt(v117, v119);
            v122 = v123;
            v119 = v124;
        elseif v121 == v0.wireTypes.lengthDelimited then
            if v120 == 1 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.automatic_size = v3.StringProp.decode(v122);
            elseif v120 == 2 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.layout_order = v3.Int32Prop.decode(v122);
            elseif v120 == 3 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.anchor_point = v3.Vector2Prop.decode(v122);
            elseif v120 == 4 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.size = v3.UDim2Prop.decode(v122);
            elseif v120 == 5 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.z_index = v3.FloatProp.decode(v122);
            elseif v120 == 6 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.position = v3.UDim2Prop.decode(v122);
            elseif v120 == 7 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.icon_component = v3.NestedComponentProp.decode(v122);
            elseif v120 == 8 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.info_text = v3.StringProp.decode(v122);
            elseif v120 == 9 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.on_title_activated = v4.ActionProp.decode(v122);
            elseif v120 == 10 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.on_subtitle_activated = v4.ActionProp.decode(v122);
            elseif v120 == 11 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.on_info_icon_activated = v4.ActionProp.decode(v122);
            elseif v120 == 12 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_color = v3.ColorProp.decode(v122);
            elseif v120 == 13 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_component = v3.NestedComponentProp.decode(v122);
            elseif v120 == 14 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_icon = v3.IconProp.decode(v122);
            elseif v120 == 15 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_icon_width = v3.FloatProp.decode(v122);
            elseif v120 == 16 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_font_style = v3.TypographyProp.decode(v122);
            elseif v120 == 17 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_gap = v3.FloatProp.decode(v122);
            elseif v120 == 18 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.subtitle_text = v3.StringProp.decode(v122);
            elseif v120 == 19 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_color = v3.ColorProp.decode(v122);
            elseif v120 == 20 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_component = v3.NestedComponentProp.decode(v122);
            elseif v120 == 21 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_gap = v3.FloatProp.decode(v122);
            elseif v120 == 22 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_icon = v3.IconProp.decode(v122);
            elseif v120 == 23 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_icon_width = v3.FloatProp.decode(v122);
            elseif v120 == 24 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_font_style = v3.TypographyProp.decode(v122);
            elseif v120 == 25 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.title_text = v3.StringProp.decode(v122);
            elseif v120 == 26 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.vertical_gap = v3.FloatProp.decode(v122);
            elseif v120 == 27 then
                v122 = nil;
                v123, v124 = v0.readBuffer(v117, v119);
                v122 = v123;
                v119 = v124;
                v118.allow_interaction_for_directional_input = v3.BoolProp.decode(v122);
            else
                v122 = nil;
                v123, v124 = v0.readVarInt(v117, v119);
                v119 = v124 + v123;
            end;
        elseif v121 == v0.wireTypes.i32 then
            v122 = nil;
            v123, v124 = v0.readFixed32(v117, v119);
            v122 = v123;
            v119 = v124;
        elseif v121 == v0.wireTypes.i64 then
            v122 = nil;
            v123, v124 = v0.readFixed64(v117, v119);
            v122 = v123;
            v119 = v124;
        else
            error("Unsupported wire type: " .. v121);
        end;
    end;
    return v118;
end;
v6.jsonEncode = function(v125) --[[ Line: 640 ]] --[[ Name: jsonEncode ]]
    local v126 = {};
    if v125.automatic_size ~= nil then
        v126.automaticSize = v125.automatic_size:jsonEncode();
    end;
    if v125.layout_order ~= nil then
        v126.layoutOrder = v125.layout_order:jsonEncode();
    end;
    if v125.anchor_point ~= nil then
        v126.anchorPoint = v125.anchor_point:jsonEncode();
    end;
    if v125.size ~= nil then
        v126.size = v125.size:jsonEncode();
    end;
    if v125.z_index ~= nil then
        v126.zIndex = v125.z_index:jsonEncode();
    end;
    if v125.position ~= nil then
        v126.position = v125.position:jsonEncode();
    end;
    if v125.icon_component ~= nil then
        v126.iconComponent = v125.icon_component:jsonEncode();
    end;
    if v125.info_text ~= nil then
        v126.infoText = v125.info_text:jsonEncode();
    end;
    if v125.on_title_activated ~= nil then
        v126.onTitleActivated = v125.on_title_activated:jsonEncode();
    end;
    if v125.on_subtitle_activated ~= nil then
        v126.onSubtitleActivated = v125.on_subtitle_activated:jsonEncode();
    end;
    if v125.on_info_icon_activated ~= nil then
        v126.onInfoIconActivated = v125.on_info_icon_activated:jsonEncode();
    end;
    if v125.subtitle_color ~= nil then
        v126.subtitleColor = v125.subtitle_color:jsonEncode();
    end;
    if v125.subtitle_component ~= nil then
        v126.subtitleComponent = v125.subtitle_component:jsonEncode();
    end;
    if v125.subtitle_icon ~= nil then
        v126.subtitleIcon = v125.subtitle_icon:jsonEncode();
    end;
    if v125.subtitle_icon_width ~= nil then
        v126.subtitleIconWidth = v125.subtitle_icon_width:jsonEncode();
    end;
    if v125.subtitle_font_style ~= nil then
        v126.subtitleFontStyle = v125.subtitle_font_style:jsonEncode();
    end;
    if v125.subtitle_gap ~= nil then
        v126.subtitleGap = v125.subtitle_gap:jsonEncode();
    end;
    if v125.subtitle_text ~= nil then
        v126.subtitleText = v125.subtitle_text:jsonEncode();
    end;
    if v125.title_color ~= nil then
        v126.titleColor = v125.title_color:jsonEncode();
    end;
    if v125.title_component ~= nil then
        v126.titleComponent = v125.title_component:jsonEncode();
    end;
    if v125.title_gap ~= nil then
        v126.titleGap = v125.title_gap:jsonEncode();
    end;
    if v125.title_icon ~= nil then
        v126.titleIcon = v125.title_icon:jsonEncode();
    end;
    if v125.title_icon_width ~= nil then
        v126.titleIconWidth = v125.title_icon_width:jsonEncode();
    end;
    if v125.title_font_style ~= nil then
        v126.titleFontStyle = v125.title_font_style:jsonEncode();
    end;
    if v125.title_text ~= nil then
        v126.titleText = v125.title_text:jsonEncode();
    end;
    if v125.vertical_gap ~= nil then
        v126.verticalGap = v125.vertical_gap:jsonEncode();
    end;
    if v125.allow_interaction_for_directional_input ~= nil then
        v126.allowInteractionForDirectionalInput = v125.allow_interaction_for_directional_input:jsonEncode();
    end;
    return v126;
end;
v6.jsonDecode = function(v127) --[[ Line: 754 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v128 = v6.new();
    if v127.automatic_size ~= nil then
        v128.automatic_size = v3.StringProp.jsonDecode(v127.automatic_size);
    end;
    if v127.automaticSize ~= nil then
        v128.automatic_size = v3.StringProp.jsonDecode(v127.automaticSize);
    end;
    if v127.layout_order ~= nil then
        v128.layout_order = v3.Int32Prop.jsonDecode(v127.layout_order);
    end;
    if v127.layoutOrder ~= nil then
        v128.layout_order = v3.Int32Prop.jsonDecode(v127.layoutOrder);
    end;
    if v127.anchor_point ~= nil then
        v128.anchor_point = v3.Vector2Prop.jsonDecode(v127.anchor_point);
    end;
    if v127.anchorPoint ~= nil then
        v128.anchor_point = v3.Vector2Prop.jsonDecode(v127.anchorPoint);
    end;
    if v127.size ~= nil then
        v128.size = v3.UDim2Prop.jsonDecode(v127.size);
    end;
    if v127.z_index ~= nil then
        v128.z_index = v3.FloatProp.jsonDecode(v127.z_index);
    end;
    if v127.zIndex ~= nil then
        v128.z_index = v3.FloatProp.jsonDecode(v127.zIndex);
    end;
    if v127.position ~= nil then
        v128.position = v3.UDim2Prop.jsonDecode(v127.position);
    end;
    if v127.icon_component ~= nil then
        v128.icon_component = v3.NestedComponentProp.jsonDecode(v127.icon_component);
    end;
    if v127.iconComponent ~= nil then
        v128.icon_component = v3.NestedComponentProp.jsonDecode(v127.iconComponent);
    end;
    if v127.info_text ~= nil then
        v128.info_text = v3.StringProp.jsonDecode(v127.info_text);
    end;
    if v127.infoText ~= nil then
        v128.info_text = v3.StringProp.jsonDecode(v127.infoText);
    end;
    if v127.on_title_activated ~= nil then
        v128.on_title_activated = v4.ActionProp.jsonDecode(v127.on_title_activated);
    end;
    if v127.onTitleActivated ~= nil then
        v128.on_title_activated = v4.ActionProp.jsonDecode(v127.onTitleActivated);
    end;
    if v127.on_subtitle_activated ~= nil then
        v128.on_subtitle_activated = v4.ActionProp.jsonDecode(v127.on_subtitle_activated);
    end;
    if v127.onSubtitleActivated ~= nil then
        v128.on_subtitle_activated = v4.ActionProp.jsonDecode(v127.onSubtitleActivated);
    end;
    if v127.on_info_icon_activated ~= nil then
        v128.on_info_icon_activated = v4.ActionProp.jsonDecode(v127.on_info_icon_activated);
    end;
    if v127.onInfoIconActivated ~= nil then
        v128.on_info_icon_activated = v4.ActionProp.jsonDecode(v127.onInfoIconActivated);
    end;
    if v127.subtitle_color ~= nil then
        v128.subtitle_color = v3.ColorProp.jsonDecode(v127.subtitle_color);
    end;
    if v127.subtitleColor ~= nil then
        v128.subtitle_color = v3.ColorProp.jsonDecode(v127.subtitleColor);
    end;
    if v127.subtitle_component ~= nil then
        v128.subtitle_component = v3.NestedComponentProp.jsonDecode(v127.subtitle_component);
    end;
    if v127.subtitleComponent ~= nil then
        v128.subtitle_component = v3.NestedComponentProp.jsonDecode(v127.subtitleComponent);
    end;
    if v127.subtitle_icon ~= nil then
        v128.subtitle_icon = v3.IconProp.jsonDecode(v127.subtitle_icon);
    end;
    if v127.subtitleIcon ~= nil then
        v128.subtitle_icon = v3.IconProp.jsonDecode(v127.subtitleIcon);
    end;
    if v127.subtitle_icon_width ~= nil then
        v128.subtitle_icon_width = v3.FloatProp.jsonDecode(v127.subtitle_icon_width);
    end;
    if v127.subtitleIconWidth ~= nil then
        v128.subtitle_icon_width = v3.FloatProp.jsonDecode(v127.subtitleIconWidth);
    end;
    if v127.subtitle_font_style ~= nil then
        v128.subtitle_font_style = v3.TypographyProp.jsonDecode(v127.subtitle_font_style);
    end;
    if v127.subtitleFontStyle ~= nil then
        v128.subtitle_font_style = v3.TypographyProp.jsonDecode(v127.subtitleFontStyle);
    end;
    if v127.subtitle_gap ~= nil then
        v128.subtitle_gap = v3.FloatProp.jsonDecode(v127.subtitle_gap);
    end;
    if v127.subtitleGap ~= nil then
        v128.subtitle_gap = v3.FloatProp.jsonDecode(v127.subtitleGap);
    end;
    if v127.subtitle_text ~= nil then
        v128.subtitle_text = v3.StringProp.jsonDecode(v127.subtitle_text);
    end;
    if v127.subtitleText ~= nil then
        v128.subtitle_text = v3.StringProp.jsonDecode(v127.subtitleText);
    end;
    if v127.title_color ~= nil then
        v128.title_color = v3.ColorProp.jsonDecode(v127.title_color);
    end;
    if v127.titleColor ~= nil then
        v128.title_color = v3.ColorProp.jsonDecode(v127.titleColor);
    end;
    if v127.title_component ~= nil then
        v128.title_component = v3.NestedComponentProp.jsonDecode(v127.title_component);
    end;
    if v127.titleComponent ~= nil then
        v128.title_component = v3.NestedComponentProp.jsonDecode(v127.titleComponent);
    end;
    if v127.title_gap ~= nil then
        v128.title_gap = v3.FloatProp.jsonDecode(v127.title_gap);
    end;
    if v127.titleGap ~= nil then
        v128.title_gap = v3.FloatProp.jsonDecode(v127.titleGap);
    end;
    if v127.title_icon ~= nil then
        v128.title_icon = v3.IconProp.jsonDecode(v127.title_icon);
    end;
    if v127.titleIcon ~= nil then
        v128.title_icon = v3.IconProp.jsonDecode(v127.titleIcon);
    end;
    if v127.title_icon_width ~= nil then
        v128.title_icon_width = v3.FloatProp.jsonDecode(v127.title_icon_width);
    end;
    if v127.titleIconWidth ~= nil then
        v128.title_icon_width = v3.FloatProp.jsonDecode(v127.titleIconWidth);
    end;
    if v127.title_font_style ~= nil then
        v128.title_font_style = v3.TypographyProp.jsonDecode(v127.title_font_style);
    end;
    if v127.titleFontStyle ~= nil then
        v128.title_font_style = v3.TypographyProp.jsonDecode(v127.titleFontStyle);
    end;
    if v127.title_text ~= nil then
        v128.title_text = v3.StringProp.jsonDecode(v127.title_text);
    end;
    if v127.titleText ~= nil then
        v128.title_text = v3.StringProp.jsonDecode(v127.titleText);
    end;
    if v127.vertical_gap ~= nil then
        v128.vertical_gap = v3.FloatProp.jsonDecode(v127.vertical_gap);
    end;
    if v127.verticalGap ~= nil then
        v128.vertical_gap = v3.FloatProp.jsonDecode(v127.verticalGap);
    end;
    if v127.allow_interaction_for_directional_input ~= nil then
        v128.allow_interaction_for_directional_input = v3.BoolProp.jsonDecode(v127.allow_interaction_for_directional_input);
    end;
    if v127.allowInteractionForDirectionalInput ~= nil then
        v128.allow_interaction_for_directional_input = v3.BoolProp.jsonDecode(v127.allowInteractionForDirectionalInput);
    end;
    return v128;
end;
v6.descriptor = {
    name = "SectionHeaderSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.SectionHeaderSchema_Props = v6;
v1.default:register(v2.SectionHeaderSchema_Props);
return {
    SectionHeaderSchema = v2.SectionHeaderSchema, 
    SectionHeaderSchema_Props = v2.SectionHeaderSchema_Props
};