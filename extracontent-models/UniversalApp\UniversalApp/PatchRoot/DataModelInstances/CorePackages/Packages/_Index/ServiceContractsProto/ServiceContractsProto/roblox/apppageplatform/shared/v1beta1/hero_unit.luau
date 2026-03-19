local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
local v5 = require(script.Parent.component_shared);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 88 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        props = if not (v8 ~= nil) or v8.props == nil then nil else v8.props, 
        shared = if not (v8 ~= nil) or v8.shared == nil then nil else v8.shared
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 95 ]] --[[ Name: encode ]]
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
v6.decode = function(v19) --[[ Line: 116 ]] --[[ Name: decode ]]
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
                v20.props = v2.HeroUnitSchema_Props.decode(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 164 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.props ~= nil then
        v28.props = v27.props:jsonEncode();
    end;
    if v27.shared ~= nil then
        v28.shared = v27.shared:jsonEncode();
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 178 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v2 (copy), v5 (copy)
    local v30 = l_v6_0.new();
    if v29.props ~= nil then
        v30.props = v2.HeroUnitSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "HeroUnitSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitSchema"
};
v2.HeroUnitSchema = v6;
v1.default:register(v2.HeroUnitSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 207 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        background_component = if not (v31 ~= nil) or v31.background_component == nil then nil else v31.background_component, 
        bottom_row_component = if not (v31 ~= nil) or v31.bottom_row_component == nil then nil else v31.bottom_row_component, 
        cta_button_component = if not (v31 ~= nil) or v31.cta_button_component == nil then nil else v31.cta_button_component, 
        gradient = if not (v31 ~= nil) or v31.gradient == nil then nil else v31.gradient, 
        header_component = if not (v31 ~= nil) or v31.header_component == nil then nil else v31.header_component, 
        on_activated = if not (v31 ~= nil) or v31.on_activated == nil then nil else v31.on_activated, 
        overlay_component = if not (v31 ~= nil) or v31.overlay_component == nil then nil else v31.overlay_component, 
        background_image = if not (v31 ~= nil) or v31.background_image == nil then nil else v31.background_image, 
        foreground_image = if not (v31 ~= nil) or v31.foreground_image == nil then nil else v31.foreground_image, 
        title_image = if not (v31 ~= nil) or v31.title_image == nil then nil else v31.title_image
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 228 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.background_component ~= nil then
        local v35 = v32.background_component:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.bottom_row_component ~= nil then
        local v38 = v32.bottom_row_component:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.cta_button_component ~= nil then
        local v41 = v32.cta_button_component:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.gradient ~= nil then
        local v44 = v32.gradient:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.header_component ~= nil then
        local v47 = v32.header_component:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.on_activated ~= nil then
        local v50 = v32.on_activated:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.overlay_component ~= nil then
        local v53 = v32.overlay_component:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.background_image ~= nil then
        local v56 = v32.background_image:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    if v32.foreground_image ~= nil then
        local v59 = v32.foreground_image:encode();
        local v60, v61 = v0.writeTag(v33, v34, 9, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
        v33 = v60;
        v34 = v61;
    end;
    if v32.title_image ~= nil then
        local v62 = v32.title_image:encode();
        local v63, v64 = v0.writeTag(v33, v34, 10, v0.wireTypes.lengthDelimited);
        v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
        v33 = v63;
        v34 = v64;
    end;
    local v65 = buffer.create(v34);
    buffer.copy(v65, 0, v33, 0, v34);
    return v65;
end;
v6.decode = function(v66) --[[ Line: 297 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v67 = v6.new();
    local v68 = 0;
    while v68 < buffer.len(v66) do
        local v69 = nil;
        local v70 = nil;
        local v71, v72, v73 = v0.readTag(v66, v68);
        v69 = v71;
        v70 = v72;
        v68 = v73;
        if v70 == v0.wireTypes.varint then
            v71 = nil;
            v72, v73 = v0.readVarInt(v66, v68);
            v71 = v72;
            v68 = v73;
        elseif v70 == v0.wireTypes.lengthDelimited then
            if v69 == 1 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.background_component = v3.NestedComponentProp.decode(v71);
            elseif v69 == 2 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.bottom_row_component = v3.NestedComponentProp.decode(v71);
            elseif v69 == 3 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.cta_button_component = v3.NestedComponentProp.decode(v71);
            elseif v69 == 4 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.gradient = v3.GradientProp.decode(v71);
            elseif v69 == 5 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.header_component = v3.NestedComponentProp.decode(v71);
            elseif v69 == 6 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.on_activated = v4.ActionProp.decode(v71);
            elseif v69 == 7 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.overlay_component = v3.NestedComponentProp.decode(v71);
            elseif v69 == 8 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.background_image = v3.ImageStringProp.decode(v71);
            elseif v69 == 9 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.foreground_image = v3.ImageStringProp.decode(v71);
            elseif v69 == 10 then
                v71 = nil;
                v72, v73 = v0.readBuffer(v66, v68);
                v71 = v72;
                v68 = v73;
                v67.title_image = v3.ImageStringProp.decode(v71);
            else
                v71 = nil;
                v72, v73 = v0.readVarInt(v66, v68);
                v68 = v73 + v72;
            end;
        elseif v70 == v0.wireTypes.i32 then
            v71 = nil;
            v72, v73 = v0.readFixed32(v66, v68);
            v71 = v72;
            v68 = v73;
        elseif v70 == v0.wireTypes.i64 then
            v71 = nil;
            v72, v73 = v0.readFixed64(v66, v68);
            v71 = v72;
            v68 = v73;
        else
            error("Unsupported wire type: " .. v70);
        end;
    end;
    return v67;
end;
v6.jsonEncode = function(v74) --[[ Line: 392 ]] --[[ Name: jsonEncode ]]
    local v75 = {};
    if v74.background_component ~= nil then
        v75.backgroundComponent = v74.background_component:jsonEncode();
    end;
    if v74.bottom_row_component ~= nil then
        v75.bottomRowComponent = v74.bottom_row_component:jsonEncode();
    end;
    if v74.cta_button_component ~= nil then
        v75.ctaButtonComponent = v74.cta_button_component:jsonEncode();
    end;
    if v74.gradient ~= nil then
        v75.gradient = v74.gradient:jsonEncode();
    end;
    if v74.header_component ~= nil then
        v75.headerComponent = v74.header_component:jsonEncode();
    end;
    if v74.on_activated ~= nil then
        v75.onActivated = v74.on_activated:jsonEncode();
    end;
    if v74.overlay_component ~= nil then
        v75.overlayComponent = v74.overlay_component:jsonEncode();
    end;
    if v74.background_image ~= nil then
        v75.backgroundImage = v74.background_image:jsonEncode();
    end;
    if v74.foreground_image ~= nil then
        v75.foregroundImage = v74.foreground_image:jsonEncode();
    end;
    if v74.title_image ~= nil then
        v75.titleImage = v74.title_image:jsonEncode();
    end;
    return v75;
end;
v6.jsonDecode = function(v76) --[[ Line: 438 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v77 = v6.new();
    if v76.background_component ~= nil then
        v77.background_component = v3.NestedComponentProp.jsonDecode(v76.background_component);
    end;
    if v76.backgroundComponent ~= nil then
        v77.background_component = v3.NestedComponentProp.jsonDecode(v76.backgroundComponent);
    end;
    if v76.bottom_row_component ~= nil then
        v77.bottom_row_component = v3.NestedComponentProp.jsonDecode(v76.bottom_row_component);
    end;
    if v76.bottomRowComponent ~= nil then
        v77.bottom_row_component = v3.NestedComponentProp.jsonDecode(v76.bottomRowComponent);
    end;
    if v76.cta_button_component ~= nil then
        v77.cta_button_component = v3.NestedComponentProp.jsonDecode(v76.cta_button_component);
    end;
    if v76.ctaButtonComponent ~= nil then
        v77.cta_button_component = v3.NestedComponentProp.jsonDecode(v76.ctaButtonComponent);
    end;
    if v76.gradient ~= nil then
        v77.gradient = v3.GradientProp.jsonDecode(v76.gradient);
    end;
    if v76.header_component ~= nil then
        v77.header_component = v3.NestedComponentProp.jsonDecode(v76.header_component);
    end;
    if v76.headerComponent ~= nil then
        v77.header_component = v3.NestedComponentProp.jsonDecode(v76.headerComponent);
    end;
    if v76.on_activated ~= nil then
        v77.on_activated = v4.ActionProp.jsonDecode(v76.on_activated);
    end;
    if v76.onActivated ~= nil then
        v77.on_activated = v4.ActionProp.jsonDecode(v76.onActivated);
    end;
    if v76.overlay_component ~= nil then
        v77.overlay_component = v3.NestedComponentProp.jsonDecode(v76.overlay_component);
    end;
    if v76.overlayComponent ~= nil then
        v77.overlay_component = v3.NestedComponentProp.jsonDecode(v76.overlayComponent);
    end;
    if v76.background_image ~= nil then
        v77.background_image = v3.ImageStringProp.jsonDecode(v76.background_image);
    end;
    if v76.backgroundImage ~= nil then
        v77.background_image = v3.ImageStringProp.jsonDecode(v76.backgroundImage);
    end;
    if v76.foreground_image ~= nil then
        v77.foreground_image = v3.ImageStringProp.jsonDecode(v76.foreground_image);
    end;
    if v76.foregroundImage ~= nil then
        v77.foreground_image = v3.ImageStringProp.jsonDecode(v76.foregroundImage);
    end;
    if v76.title_image ~= nil then
        v77.title_image = v3.ImageStringProp.jsonDecode(v76.title_image);
    end;
    if v76.titleImage ~= nil then
        v77.title_image = v3.ImageStringProp.jsonDecode(v76.titleImage);
    end;
    return v77;
end;
v6.descriptor = {
    name = "HeroUnitSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.HeroUnitSchema_Props = v6;
v1.default:register(v2.HeroUnitSchema_Props);
return {
    HeroUnitSchema = v2.HeroUnitSchema, 
    HeroUnitSchema_Props = v2.HeroUnitSchema_Props
};