local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.hydration_data_spec);
local v4 = require(script.Parent.ui_component_type);
local v5 = require(script.Parent.analytics_data);
local v6 = require(script.Parent.prop_types);
local v7 = {};
v7.__index = v7;
local l_v7_0 = v7 --[[ copy: 7 -> 8 ]];
v7.new = function(v9) --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_v7_0 (copy)
    return (setmetatable({
        component_type = if not (v9 ~= nil) or v9.component_type == nil then assert(v4.UiComponentType.fromNumber(0), "Enum has no 0 default") else v9.component_type, 
        data = if not (v9 ~= nil) or v9.data == nil then {} else v9.data, 
        analytics_data = if not (v9 ~= nil) or v9.analytics_data == nil then {} else v9.analytics_data, 
        is_component_filtered = if not (v9 ~= nil) or v9.is_component_filtered == nil then nil else v9.is_component_filtered
    }, l_v7_0));
end;
v7.encode = function(v10) --[[ Line: 96 ]] --[[ Name: encode ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v11 = buffer.create(0);
    local v12 = 0;
    if v10.component_type ~= nil and (v10.component_type ~= nil and v10.component_type ~= 0 or v10.component_type ~= v4.UiComponentType.fromNumber(0)) then
        local v13, v14 = v0.writeTag(v11, v12, 1, v0.wireTypes.varint);
        v13, v14 = v0.writeVarInt(v13, v14, v4.UiComponentType.toNumber(v10.component_type));
        v11 = v13;
        v12 = v14;
    end;
    if v10.data ~= nil and #v10.data > 0 then
        for _, v16 in v10.data do
            local v17 = v16:encode();
            local v18, v19 = v0.writeTag(v11, v12, 2, v0.wireTypes.lengthDelimited);
            v18, v19 = v0.writeBuffer(v18, v19, v17, buffer.len(v17));
            v11 = v18;
            v12 = v19;
        end;
    end;
    if v10.analytics_data ~= nil and next(v10.analytics_data) ~= nil then
        for v20, v21 in v10.analytics_data do
            local v22 = buffer.create(0);
            local v23, v24 = v0.writeTag(v22, 0, 1, v0.wireTypes.lengthDelimited);
            v23, v24 = v0.writeString(v23, v24, v20);
            v22 = v23;
            local l_v24_0 = v24;
            v23 = v21:encode();
            local v26;
            v24, v26 = v0.writeTag(v22, l_v24_0, 2, v0.wireTypes.lengthDelimited);
            v24, v26 = v0.writeBuffer(v24, v26, v23, buffer.len(v23));
            v22 = v24;
            l_v24_0 = v26;
            v24, v26 = v0.writeTag(v11, v12, 3, v0.wireTypes.lengthDelimited);
            v24, v26 = v0.writeBuffer(v24, v26, v22, l_v24_0);
            v11 = v24;
            v12 = v26;
        end;
    end;
    if v10.is_component_filtered ~= nil then
        local v27 = v10.is_component_filtered:encode();
        local v28, v29 = v0.writeTag(v11, v12, 4, v0.wireTypes.lengthDelimited);
        v28, v29 = v0.writeBuffer(v28, v29, v27, buffer.len(v27));
        v11 = v28;
        v12 = v29;
    end;
    local v30 = buffer.create(v12);
    buffer.copy(v30, 0, v11, 0, v12);
    return v30;
end;
v7.decode = function(v31) --[[ Line: 151 ]] --[[ Name: decode ]]
    -- upvalues: l_v7_0 (copy), v0 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v32 = l_v7_0.new();
    local v33 = 0;
    while v33 < buffer.len(v31) do
        local v34 = nil;
        local v35 = nil;
        local v36, v37, v38 = v0.readTag(v31, v33);
        v34 = v36;
        v35 = v37;
        v33 = v38;
        if v35 == v0.wireTypes.varint then
            if v34 == 1 then
                v36 = nil;
                v37, v38 = v0.readVarIntI32(v31, v33);
                v36 = v37;
                v33 = v38;
                v32.component_type = v4.UiComponentType.fromNumber(v36) or v36;
            else
                v36 = nil;
                v37, v38 = v0.readVarInt(v31, v33);
                v36 = v37;
                v33 = v38;
            end;
        elseif v35 == v0.wireTypes.lengthDelimited then
            if v34 == 2 then
                v36 = nil;
                v37, v38 = v0.readBuffer(v31, v33);
                v36 = v37;
                v33 = v38;
                table.insert(v32.data, v3.HydrationDataSpec.decode(v36));
            elseif v34 == 3 then
                v36 = nil;
                v37, v38 = v0.readBuffer(v31, v33);
                v36 = v37;
                v33 = v38;
                v37 = v2.ComponentShared_AnalyticsDataEntry.decode(v36);
                v38 = v5.AnalyticsDataField.new();
                v32.analytics_data[v37.key or ""] = v37.value or v38;
            elseif v34 == 4 then
                v36 = nil;
                v37, v38 = v0.readBuffer(v31, v33);
                v36 = v37;
                v33 = v38;
                v32.is_component_filtered = v6.BoolProp.decode(v36);
            else
                v36 = nil;
                v37, v38 = v0.readVarInt(v31, v33);
                v33 = v38 + v37;
            end;
        elseif v35 == v0.wireTypes.i32 then
            v36 = nil;
            v37, v38 = v0.readFixed32(v31, v33);
            v36 = v37;
            v33 = v38;
        elseif v35 == v0.wireTypes.i64 then
            v36 = nil;
            v37, v38 = v0.readFixed64(v31, v33);
            v36 = v37;
            v33 = v38;
        else
            error("Unsupported wire type: " .. v35);
        end;
    end;
    return v32;
end;
v7.jsonEncode = function(v39) --[[ Line: 223 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v4 (copy)
    local v40 = {};
    if v39.component_type ~= nil and (v39.component_type ~= nil and v39.component_type ~= 0 or v39.component_type ~= v4.UiComponentType.fromNumber(0)) then
        v40.componentType = if typeof(v39.component_type) == "number" then v39.component_type else v4.UiComponentType.toNumber(v39.component_type);
    end;
    if v39.data ~= nil and #v39.data > 0 then
        local v41 = {};
        for _, v43 in v39.data do
            table.insert(v41, v43:jsonEncode());
        end;
        v40.data = v41;
    end;
    if v39.analytics_data ~= nil and next(v39.analytics_data) ~= nil then
        local v44 = {};
        for v45, v46 in v39.analytics_data do
            v44[v45] = v46:jsonEncode();
        end;
        v40.analyticsData = v44;
    end;
    if v39.is_component_filtered ~= nil then
        v40.isComponentFiltered = v39.is_component_filtered:jsonEncode();
    end;
    return v40;
end;
v7.jsonDecode = function(v47) --[[ Line: 264 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v7_0 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v48 = l_v7_0.new();
    if v47.component_type ~= nil then
        v48.component_type = if typeof(v47.component_type) == "number" then v4.UiComponentType.fromNumber(v47.component_type) or v47.component_type else v4.UiComponentType.fromName(v47.component_type) or v47.component_type;
    end;
    if v47.componentType ~= nil then
        v48.component_type = if typeof(v47.componentType) == "number" then v4.UiComponentType.fromNumber(v47.componentType) or v47.componentType else v4.UiComponentType.fromName(v47.componentType) or v47.componentType;
    end;
    if v47.data ~= nil then
        local v49 = {};
        for _, v51 in v47.data do
            table.insert(v49, v3.HydrationDataSpec.jsonDecode(v51));
        end;
        v48.data = v49;
    end;
    if v47.analytics_data ~= nil then
        local v52 = {};
        for v53, v54 in v47.analytics_data do
            v52[v53] = v5.AnalyticsDataField.jsonDecode(v54);
        end;
        v48.analytics_data = v52;
    end;
    if v47.analyticsData ~= nil then
        local v55 = {};
        for v56, v57 in v47.analyticsData do
            v55[v56] = v5.AnalyticsDataField.jsonDecode(v57);
        end;
        v48.analytics_data = v55;
    end;
    if v47.is_component_filtered ~= nil then
        v48.is_component_filtered = v6.BoolProp.jsonDecode(v47.is_component_filtered);
    end;
    if v47.isComponentFiltered ~= nil then
        v48.is_component_filtered = v6.BoolProp.jsonDecode(v47.isComponentFiltered);
    end;
    return v48;
end;
v7.descriptor = {
    name = "ComponentShared", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ComponentShared"
};
v2.ComponentShared = v7;
v1.default:register(v2.ComponentShared);
v7 = {};
v7.__index = v7;
v7.new = function(v58) --[[ Line: 346 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        key = (not (v58 ~= nil) or v58.key == nil) and "" or v58.key, 
        value = if not (v58 ~= nil) or v58.value == nil then nil else v58.value
    }, v7));
end;
v7.encode = function(v59) --[[ Line: 355 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v60 = buffer.create(0);
    local v61 = 0;
    if v59.key ~= nil and v59.key ~= "" then
        local v62, v63 = v0.writeTag(v60, v61, 1, v0.wireTypes.lengthDelimited);
        v62, v63 = v0.writeString(v62, v63, v59.key);
        v60 = v62;
        v61 = v63;
    end;
    if v59.value ~= nil then
        local v64 = v59.value:encode();
        local v65, v66 = v0.writeTag(v60, v61, 2, v0.wireTypes.lengthDelimited);
        v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
        v60 = v65;
        v61 = v66;
    end;
    local v67 = buffer.create(v61);
    buffer.copy(v67, 0, v60, 0, v61);
    return v67;
end;
v7.decode = function(v68) --[[ Line: 375 ]] --[[ Name: decode ]]
    -- upvalues: v7 (copy), v0 (copy), v5 (copy)
    local v69 = v7.new();
    local v70 = 0;
    while v70 < buffer.len(v68) do
        local v71 = nil;
        local v72 = nil;
        local v73, v74, v75 = v0.readTag(v68, v70);
        v71 = v73;
        v72 = v74;
        v70 = v75;
        if v72 == v0.wireTypes.varint then
            v73 = nil;
            v74, v75 = v0.readVarInt(v68, v70);
            v73 = v74;
            v70 = v75;
        elseif v72 == v0.wireTypes.lengthDelimited then
            if v71 == 1 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.key = buffer.tostring(v73);
            elseif v71 == 2 then
                v73 = nil;
                v74, v75 = v0.readBuffer(v68, v70);
                v73 = v74;
                v70 = v75;
                v69.value = v5.AnalyticsDataField.decode(v73);
            else
                v73 = nil;
                v74, v75 = v0.readVarInt(v68, v70);
                v70 = v75 + v74;
            end;
        elseif v72 == v0.wireTypes.i32 then
            v73 = nil;
            v74, v75 = v0.readFixed32(v68, v70);
            v73 = v74;
            v70 = v75;
        elseif v72 == v0.wireTypes.i64 then
            v73 = nil;
            v74, v75 = v0.readFixed64(v68, v70);
            v73 = v74;
            v70 = v75;
        else
            error("Unsupported wire type: " .. v72);
        end;
    end;
    return v69;
end;
v7.jsonEncode = function(v76) --[[ Line: 423 ]] --[[ Name: jsonEncode ]]
    local v77 = {};
    if v76.key ~= nil and v76.key ~= "" then
        v77.key = v76.key;
    end;
    if v76.value ~= nil then
        v77.value = v76.value:jsonEncode();
    end;
    return v77;
end;
v7.jsonDecode = function(v78) --[[ Line: 437 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v7 (copy), v5 (copy)
    local v79 = v7.new();
    if v78.key ~= nil then
        v79.key = v78.key;
    end;
    if v78.value ~= nil then
        v79.value = v5.AnalyticsDataField.jsonDecode(v78.value);
    end;
    return v79;
end;
v7.descriptor = {
    name = "ComponentShared_AnalyticsDataEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataEntry"
};
v2.ComponentShared_AnalyticsDataEntry = v7;
v1.default:register(v2.ComponentShared_AnalyticsDataEntry);
return {
    ComponentShared = v2.ComponentShared
};