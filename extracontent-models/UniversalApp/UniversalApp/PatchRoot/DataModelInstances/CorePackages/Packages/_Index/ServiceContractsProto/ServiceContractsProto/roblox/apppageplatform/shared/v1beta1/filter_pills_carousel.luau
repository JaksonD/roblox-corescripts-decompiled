local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.prop_types);
local v4 = require(script.Parent.actions);
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
                v20.props = v2.FilterPillsCarouselSchema_Props.decode(v24);
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
        v30.props = v2.FilterPillsCarouselSchema_Props.jsonDecode(v29.props);
    end;
    if v29.shared ~= nil then
        v30.shared = v5.ComponentShared.jsonDecode(v29.shared);
    end;
    return v30;
end;
v6.descriptor = {
    name = "FilterPillsCarouselSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsCarouselSchema"
};
v2.FilterPillsCarouselSchema = v6;
v1.default:register(v2.FilterPillsCarouselSchema);
v6 = {};
v6.__index = v6;
v6.new = function(v31) --[[ Line: 214 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        filter_groups = if not (v31 ~= nil) or v31.filter_groups == nil then nil else v31.filter_groups, 
        on_filter_applied = if not (v31 ~= nil) or v31.on_filter_applied == nil then nil else v31.on_filter_applied, 
        impression_event_name = if not (v31 ~= nil) or v31.impression_event_name == nil then nil else v31.impression_event_name, 
        skip_item_impressions_log = if not (v31 ~= nil) or v31.skip_item_impressions_log == nil then nil else v31.skip_item_impressions_log, 
        on_filter_click = if not (v31 ~= nil) or v31.on_filter_click == nil then nil else v31.on_filter_click, 
        title = if not (v31 ~= nil) or v31.title == nil then nil else v31.title, 
        background_style = if not (v31 ~= nil) or v31.background_style == nil then nil else v31.background_style, 
        tag = if not (v31 ~= nil) or v31.tag == nil then nil else v31.tag
    }, v6));
end;
v6.encode = function(v32) --[[ Line: 233 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v33 = buffer.create(0);
    local v34 = 0;
    if v32.filter_groups ~= nil then
        local v35 = v32.filter_groups:encode();
        local v36, v37 = v0.writeTag(v33, v34, 1, v0.wireTypes.lengthDelimited);
        v36, v37 = v0.writeBuffer(v36, v37, v35, buffer.len(v35));
        v33 = v36;
        v34 = v37;
    end;
    if v32.on_filter_applied ~= nil then
        local v38 = v32.on_filter_applied:encode();
        local v39, v40 = v0.writeTag(v33, v34, 2, v0.wireTypes.lengthDelimited);
        v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
        v33 = v39;
        v34 = v40;
    end;
    if v32.impression_event_name ~= nil then
        local v41 = v32.impression_event_name:encode();
        local v42, v43 = v0.writeTag(v33, v34, 3, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v33 = v42;
        v34 = v43;
    end;
    if v32.skip_item_impressions_log ~= nil then
        local v44 = v32.skip_item_impressions_log:encode();
        local v45, v46 = v0.writeTag(v33, v34, 4, v0.wireTypes.lengthDelimited);
        v45, v46 = v0.writeBuffer(v45, v46, v44, buffer.len(v44));
        v33 = v45;
        v34 = v46;
    end;
    if v32.on_filter_click ~= nil then
        local v47 = v32.on_filter_click:encode();
        local v48, v49 = v0.writeTag(v33, v34, 5, v0.wireTypes.lengthDelimited);
        v48, v49 = v0.writeBuffer(v48, v49, v47, buffer.len(v47));
        v33 = v48;
        v34 = v49;
    end;
    if v32.title ~= nil then
        local v50 = v32.title:encode();
        local v51, v52 = v0.writeTag(v33, v34, 6, v0.wireTypes.lengthDelimited);
        v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
        v33 = v51;
        v34 = v52;
    end;
    if v32.background_style ~= nil then
        local v53 = v32.background_style:encode();
        local v54, v55 = v0.writeTag(v33, v34, 7, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
        v33 = v54;
        v34 = v55;
    end;
    if v32.tag ~= nil then
        local v56 = v32.tag:encode();
        local v57, v58 = v0.writeTag(v33, v34, 8, v0.wireTypes.lengthDelimited);
        v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
        v33 = v57;
        v34 = v58;
    end;
    local v59 = buffer.create(v34);
    buffer.copy(v59, 0, v33, 0, v34);
    return v59;
end;
v6.decode = function(v60) --[[ Line: 290 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v3 (copy), v4 (copy)
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
                v61.filter_groups = v3.ArrayOfStructProp.decode(v65);
            elseif v63 == 2 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.on_filter_applied = v4.ActionProp.decode(v65);
            elseif v63 == 3 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.impression_event_name = v3.StringProp.decode(v65);
            elseif v63 == 4 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.skip_item_impressions_log = v3.BoolProp.decode(v65);
            elseif v63 == 5 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.on_filter_click = v4.ActionProp.decode(v65);
            elseif v63 == 6 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.title = v3.StringProp.decode(v65);
            elseif v63 == 7 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.background_style = v3.ColorStyleProp.decode(v65);
            elseif v63 == 8 then
                v65 = nil;
                v66, v67 = v0.readBuffer(v60, v62);
                v65 = v66;
                v62 = v67;
                v61.tag = v3.StringProp.decode(v65);
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
v6.jsonEncode = function(v68) --[[ Line: 372 ]] --[[ Name: jsonEncode ]]
    local v69 = {};
    if v68.filter_groups ~= nil then
        v69.filterGroups = v68.filter_groups:jsonEncode();
    end;
    if v68.on_filter_applied ~= nil then
        v69.onFilterApplied = v68.on_filter_applied:jsonEncode();
    end;
    if v68.impression_event_name ~= nil then
        v69.impressionEventName = v68.impression_event_name:jsonEncode();
    end;
    if v68.skip_item_impressions_log ~= nil then
        v69.skipItemImpressionsLog = v68.skip_item_impressions_log:jsonEncode();
    end;
    if v68.on_filter_click ~= nil then
        v69.onFilterClick = v68.on_filter_click:jsonEncode();
    end;
    if v68.title ~= nil then
        v69.title = v68.title:jsonEncode();
    end;
    if v68.background_style ~= nil then
        v69.backgroundStyle = v68.background_style:jsonEncode();
    end;
    if v68.tag ~= nil then
        v69.tag = v68.tag:jsonEncode();
    end;
    return v69;
end;
v6.jsonDecode = function(v70) --[[ Line: 410 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local v71 = v6.new();
    if v70.filter_groups ~= nil then
        v71.filter_groups = v3.ArrayOfStructProp.jsonDecode(v70.filter_groups);
    end;
    if v70.filterGroups ~= nil then
        v71.filter_groups = v3.ArrayOfStructProp.jsonDecode(v70.filterGroups);
    end;
    if v70.on_filter_applied ~= nil then
        v71.on_filter_applied = v4.ActionProp.jsonDecode(v70.on_filter_applied);
    end;
    if v70.onFilterApplied ~= nil then
        v71.on_filter_applied = v4.ActionProp.jsonDecode(v70.onFilterApplied);
    end;
    if v70.impression_event_name ~= nil then
        v71.impression_event_name = v3.StringProp.jsonDecode(v70.impression_event_name);
    end;
    if v70.impressionEventName ~= nil then
        v71.impression_event_name = v3.StringProp.jsonDecode(v70.impressionEventName);
    end;
    if v70.skip_item_impressions_log ~= nil then
        v71.skip_item_impressions_log = v3.BoolProp.jsonDecode(v70.skip_item_impressions_log);
    end;
    if v70.skipItemImpressionsLog ~= nil then
        v71.skip_item_impressions_log = v3.BoolProp.jsonDecode(v70.skipItemImpressionsLog);
    end;
    if v70.on_filter_click ~= nil then
        v71.on_filter_click = v4.ActionProp.jsonDecode(v70.on_filter_click);
    end;
    if v70.onFilterClick ~= nil then
        v71.on_filter_click = v4.ActionProp.jsonDecode(v70.onFilterClick);
    end;
    if v70.title ~= nil then
        v71.title = v3.StringProp.jsonDecode(v70.title);
    end;
    if v70.background_style ~= nil then
        v71.background_style = v3.ColorStyleProp.jsonDecode(v70.background_style);
    end;
    if v70.backgroundStyle ~= nil then
        v71.background_style = v3.ColorStyleProp.jsonDecode(v70.backgroundStyle);
    end;
    if v70.tag ~= nil then
        v71.tag = v3.StringProp.jsonDecode(v70.tag);
    end;
    return v71;
end;
v6.descriptor = {
    name = "FilterPillsCarouselSchema_Props", 
    fullName = "roblox.apppageplatform.shared.v1beta1.Props"
};
v2.FilterPillsCarouselSchema_Props = v6;
v1.default:register(v2.FilterPillsCarouselSchema_Props);
return {
    FilterPillsCarouselSchema = v2.FilterPillsCarouselSchema, 
    FilterPillsCarouselSchema_Props = v2.FilterPillsCarouselSchema_Props
};