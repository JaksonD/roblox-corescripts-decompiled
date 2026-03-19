local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 118 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        event_id = (not (v8 ~= nil) or v8.event_id == nil) and 0 or v8.event_id, 
        user_id = (not (v8 ~= nil) or v8.user_id == nil) and 0 or v8.user_id
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 127 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.event_id ~= nil and v9.event_id ~= 0 then
        local v12, v13 = v0.writeTag(v10, v11, 1, v0.wireTypes.varint);
        v12, v13 = v0.writeVarInt(v12, v13, v9.event_id);
        v10 = v12;
        v11 = v13;
    end;
    if v9.user_id ~= nil and v9.user_id ~= 0 then
        local v14, v15 = v0.writeTag(v10, v11, 2, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v9.user_id);
        v10 = v14;
        v11 = v15;
    end;
    local v16 = buffer.create(v11);
    buffer.copy(v16, 0, v10, 0, v11);
    return v16;
end;
v6.decode = function(v17) --[[ Line: 146 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy)
    local v18 = l_v6_0.new();
    local v19 = 0;
    while v19 < buffer.len(v17) do
        local v20 = nil;
        local v21 = nil;
        local v22, v23, v24 = v0.readTag(v17, v19);
        v20 = v22;
        v21 = v23;
        v19 = v24;
        if v21 == v0.wireTypes.varint then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readVarIntI64(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.event_id = v22;
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readVarIntI64(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.user_id = v22;
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
            end;
        elseif v21 == v0.wireTypes.lengthDelimited then
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v19 = v24 + v23;
        elseif v21 == v0.wireTypes.i32 then
            v22 = nil;
            v23, v24 = v0.readFixed32(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.i64 then
            v22 = nil;
            v23, v24 = v0.readFixed64(v17, v19);
            v22 = v23;
            v19 = v24;
        else
            error("Unsupported wire type: " .. v21);
        end;
    end;
    return v18;
end;
v6.jsonEncode = function(v25) --[[ Line: 194 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.event_id ~= nil and v25.event_id ~= 0 then
        v26.eventId = v25.event_id;
    end;
    if v25.user_id ~= nil and v25.user_id ~= 0 then
        v26.userId = v25.user_id;
    end;
    return v26;
end;
v6.jsonDecode = function(v27) --[[ Line: 208 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy)
    local v28 = l_v6_0.new();
    if v27.event_id ~= nil then
        v28.event_id = v27.event_id;
    end;
    if v27.eventId ~= nil then
        v28.event_id = v27.eventId;
    end;
    if v27.user_id ~= nil then
        v28.user_id = v27.user_id;
    end;
    if v27.userId ~= nil then
        v28.user_id = v27.userId;
    end;
    return v28;
end;
v6.descriptor = {
    name = "ExperienceEventDetailsPageRequest", 
    fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageRequest"
};
v2.ExperienceEventDetailsPageRequest = v6;
v1.default:register(v2.ExperienceEventDetailsPageRequest);
v6 = {};
v6.__index = v6;
local l_v6_1 = v6 --[[ copy: 6 -> 8 ]];
v6.new = function(v30) --[[ Line: 246 ]] --[[ Name: new ]]
    -- upvalues: l_v6_1 (copy)
    return (setmetatable({
        page_entries = if not (v30 ~= nil) or v30.page_entries == nil then {} else v30.page_entries, 
        hydration_data = if not (v30 ~= nil) or v30.hydration_data == nil then nil else v30.hydration_data, 
        templates = if not (v30 ~= nil) or v30.templates == nil then {} else v30.templates
    }, l_v6_1));
end;
v6.encode = function(v31) --[[ Line: 256 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v32 = buffer.create(0);
    local v33 = 0;
    if v31.page_entries ~= nil and #v31.page_entries > 0 then
        for _, v35 in v31.page_entries do
            local v36 = v35:encode();
            local v37, v38 = v0.writeTag(v32, v33, 1, v0.wireTypes.lengthDelimited);
            v37, v38 = v0.writeBuffer(v37, v38, v36, buffer.len(v36));
            v32 = v37;
            v33 = v38;
        end;
    end;
    if v31.hydration_data ~= nil then
        local v39 = v31.hydration_data:encode();
        local v40, v41 = v0.writeTag(v32, v33, 2, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeBuffer(v40, v41, v39, buffer.len(v39));
        v32 = v40;
        v33 = v41;
    end;
    if v31.templates ~= nil and next(v31.templates) ~= nil then
        for v42, v43 in v31.templates do
            local v44 = buffer.create(0);
            local v45, v46 = v0.writeTag(v44, 0, 1, v0.wireTypes.lengthDelimited);
            v45, v46 = v0.writeString(v45, v46, v42);
            v44 = v45;
            local l_v46_0 = v46;
            v45 = v43:encode();
            local v48;
            v46, v48 = v0.writeTag(v44, l_v46_0, 2, v0.wireTypes.lengthDelimited);
            v46, v48 = v0.writeBuffer(v46, v48, v45, buffer.len(v45));
            v44 = v46;
            l_v46_0 = v48;
            v46, v48 = v0.writeTag(v32, v33, 3, v0.wireTypes.lengthDelimited);
            v46, v48 = v0.writeBuffer(v46, v48, v44, l_v46_0);
            v32 = v46;
            v33 = v48;
        end;
    end;
    local v49 = buffer.create(v33);
    buffer.copy(v49, 0, v32, 0, v33);
    return v49;
end;
v6.decode = function(v50) --[[ Line: 293 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_1 (copy), v0 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v51 = l_v6_1.new();
    local v52 = 0;
    while v52 < buffer.len(v50) do
        local v53 = nil;
        local v54 = nil;
        local v55, v56, v57 = v0.readTag(v50, v52);
        v53 = v55;
        v54 = v56;
        v52 = v57;
        if v54 == v0.wireTypes.varint then
            v55 = nil;
            v56, v57 = v0.readVarInt(v50, v52);
            v55 = v56;
            v52 = v57;
        elseif v54 == v0.wireTypes.lengthDelimited then
            if v53 == 1 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                table.insert(v51.page_entries, v5.UniversalPageEntry.decode(v55));
            elseif v53 == 2 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v51.hydration_data = v3.HydrationContent.decode(v55);
            elseif v53 == 3 then
                v55 = nil;
                v56, v57 = v0.readBuffer(v50, v52);
                v55 = v56;
                v52 = v57;
                v56 = v2.ExperienceEventDetailsPageResponse_TemplatesEntry.decode(v55);
                v57 = v4.TemplateEntry.new();
                v51.templates[v56.key or ""] = v56.value or v57;
            else
                v55 = nil;
                v56, v57 = v0.readVarInt(v50, v52);
                v52 = v57 + v56;
            end;
        elseif v54 == v0.wireTypes.i32 then
            v55 = nil;
            v56, v57 = v0.readFixed32(v50, v52);
            v55 = v56;
            v52 = v57;
        elseif v54 == v0.wireTypes.i64 then
            v55 = nil;
            v56, v57 = v0.readFixed64(v50, v52);
            v55 = v56;
            v52 = v57;
        else
            error("Unsupported wire type: " .. v54);
        end;
    end;
    return v51;
end;
v6.jsonEncode = function(v58) --[[ Line: 357 ]] --[[ Name: jsonEncode ]]
    local v59 = {};
    if v58.page_entries ~= nil and #v58.page_entries > 0 then
        local v60 = {};
        for _, v62 in v58.page_entries do
            table.insert(v60, v62:jsonEncode());
        end;
        v59.pageEntries = v60;
    end;
    if v58.hydration_data ~= nil then
        v59.hydrationData = v58.hydration_data:jsonEncode();
    end;
    if v58.templates ~= nil and next(v58.templates) ~= nil then
        local v63 = {};
        for v64, v65 in v58.templates do
            v63[v64] = v65:jsonEncode();
        end;
        v59.templates = v63;
    end;
    return v59;
end;
v6.jsonDecode = function(v66) --[[ Line: 383 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_1 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v67 = l_v6_1.new();
    if v66.page_entries ~= nil then
        local v68 = {};
        for _, v70 in v66.page_entries do
            table.insert(v68, v5.UniversalPageEntry.jsonDecode(v70));
        end;
        v67.page_entries = v68;
    end;
    if v66.pageEntries ~= nil then
        local v71 = {};
        for _, v73 in v66.pageEntries do
            table.insert(v71, v5.UniversalPageEntry.jsonDecode(v73));
        end;
        v67.page_entries = v71;
    end;
    if v66.hydration_data ~= nil then
        v67.hydration_data = v3.HydrationContent.jsonDecode(v66.hydration_data);
    end;
    if v66.hydrationData ~= nil then
        v67.hydration_data = v3.HydrationContent.jsonDecode(v66.hydrationData);
    end;
    if v66.templates ~= nil then
        local v74 = {};
        for v75, v76 in v66.templates do
            v74[v75] = v4.TemplateEntry.jsonDecode(v76);
        end;
        v67.templates = v74;
    end;
    return v67;
end;
v6.descriptor = {
    name = "ExperienceEventDetailsPageResponse", 
    fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageResponse"
};
v2.ExperienceEventDetailsPageResponse = v6;
v1.default:register(v2.ExperienceEventDetailsPageResponse);
v6 = {};
v6.__index = v6;
v6.new = function(v77) --[[ Line: 451 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v77 ~= nil) or v77.key == nil) and "" or v77.key, 
        value = if not (v77 ~= nil) or v77.value == nil then nil else v77.value
    }, v6));
end;
v6.encode = function(v78) --[[ Line: 463 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v79 = buffer.create(0);
    local v80 = 0;
    if v78.key ~= nil and v78.key ~= "" then
        local v81, v82 = v0.writeTag(v79, v80, 1, v0.wireTypes.lengthDelimited);
        v81, v82 = v0.writeString(v81, v82, v78.key);
        v79 = v81;
        v80 = v82;
    end;
    if v78.value ~= nil then
        local v83 = v78.value:encode();
        local v84, v85 = v0.writeTag(v79, v80, 2, v0.wireTypes.lengthDelimited);
        v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
        v79 = v84;
        v80 = v85;
    end;
    local v86 = buffer.create(v80);
    buffer.copy(v86, 0, v79, 0, v80);
    return v86;
end;
v6.decode = function(v87) --[[ Line: 485 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v4 (copy)
    local v88 = v6.new();
    local v89 = 0;
    while v89 < buffer.len(v87) do
        local v90 = nil;
        local v91 = nil;
        local v92, v93, v94 = v0.readTag(v87, v89);
        v90 = v92;
        v91 = v93;
        v89 = v94;
        if v91 == v0.wireTypes.varint then
            v92 = nil;
            v93, v94 = v0.readVarInt(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.lengthDelimited then
            if v90 == 1 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.key = buffer.tostring(v92);
            elseif v90 == 2 then
                v92 = nil;
                v93, v94 = v0.readBuffer(v87, v89);
                v92 = v93;
                v89 = v94;
                v88.value = v4.TemplateEntry.decode(v92);
            else
                v92 = nil;
                v93, v94 = v0.readVarInt(v87, v89);
                v89 = v94 + v93;
            end;
        elseif v91 == v0.wireTypes.i32 then
            v92 = nil;
            v93, v94 = v0.readFixed32(v87, v89);
            v92 = v93;
            v89 = v94;
        elseif v91 == v0.wireTypes.i64 then
            v92 = nil;
            v93, v94 = v0.readFixed64(v87, v89);
            v92 = v93;
            v89 = v94;
        else
            error("Unsupported wire type: " .. v91);
        end;
    end;
    return v88;
end;
v6.jsonEncode = function(v95) --[[ Line: 535 ]] --[[ Name: jsonEncode ]]
    local v96 = {};
    if v95.key ~= nil and v95.key ~= "" then
        v96.key = v95.key;
    end;
    if v95.value ~= nil then
        v96.value = v95.value:jsonEncode();
    end;
    return v96;
end;
v6.jsonDecode = function(v97) --[[ Line: 551 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v98 = v6.new();
    if v97.key ~= nil then
        v98.key = v97.key;
    end;
    if v97.value ~= nil then
        v98.value = v4.TemplateEntry.jsonDecode(v97.value);
    end;
    return v98;
end;
v6.descriptor = {
    name = "ExperienceEventDetailsPageResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.experienceevents.v1beta1.TemplatesEntry"
};
v2.ExperienceEventDetailsPageResponse_TemplatesEntry = v6;
v1.default:register(v2.ExperienceEventDetailsPageResponse_TemplatesEntry);
return {
    ExperienceEventDetailsPageRequest = v2.ExperienceEventDetailsPageRequest, 
    ExperienceEventDetailsPageResponse = v2.ExperienceEventDetailsPageResponse
};