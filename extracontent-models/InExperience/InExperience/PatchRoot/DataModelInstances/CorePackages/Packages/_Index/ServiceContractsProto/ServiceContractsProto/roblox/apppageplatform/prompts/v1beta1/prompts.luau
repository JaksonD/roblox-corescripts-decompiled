local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 88 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        page_entries = if not (v8 ~= nil) or v8.page_entries == nil then {} else v8.page_entries, 
        hydration_data = if not (v8 ~= nil) or v8.hydration_data == nil then nil else v8.hydration_data, 
        templates = if not (v8 ~= nil) or v8.templates == nil then {} else v8.templates
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 98 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.page_entries ~= nil and #v9.page_entries > 0 then
        for _, v13 in v9.page_entries do
            local v14 = v13:encode();
            local v15, v16 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
            v15, v16 = v0.writeBuffer(v15, v16, v14, buffer.len(v14));
            v10 = v15;
            v11 = v16;
        end;
    end;
    if v9.hydration_data ~= nil then
        local v17 = v9.hydration_data:encode();
        local v18, v19 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
        v18, v19 = v0.writeBuffer(v18, v19, v17, buffer.len(v17));
        v10 = v18;
        v11 = v19;
    end;
    if v9.templates ~= nil and next(v9.templates) ~= nil then
        for v20, v21 in v9.templates do
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
            v24, v26 = v0.writeTag(v10, v11, 3, v0.wireTypes.lengthDelimited);
            v24, v26 = v0.writeBuffer(v24, v26, v22, l_v24_0);
            v10 = v24;
            v11 = v26;
        end;
    end;
    local v27 = buffer.create(v11);
    buffer.copy(v27, 0, v10, 0, v11);
    return v27;
end;
v6.decode = function(v28) --[[ Line: 135 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v29 = l_v6_0.new();
    local v30 = 0;
    while v30 < buffer.len(v28) do
        local v31 = nil;
        local v32 = nil;
        local v33, v34, v35 = v0.readTag(v28, v30);
        v31 = v33;
        v32 = v34;
        v30 = v35;
        if v32 == v0.wireTypes.varint then
            v33 = nil;
            v34, v35 = v0.readVarInt(v28, v30);
            v33 = v34;
            v30 = v35;
        elseif v32 == v0.wireTypes.lengthDelimited then
            if v31 == 1 then
                v33 = nil;
                v34, v35 = v0.readBuffer(v28, v30);
                v33 = v34;
                v30 = v35;
                table.insert(v29.page_entries, v4.UniversalPageEntry.decode(v33));
            elseif v31 == 2 then
                v33 = nil;
                v34, v35 = v0.readBuffer(v28, v30);
                v33 = v34;
                v30 = v35;
                v29.hydration_data = v3.HydrationContent.decode(v33);
            elseif v31 == 3 then
                v33 = nil;
                v34, v35 = v0.readBuffer(v28, v30);
                v33 = v34;
                v30 = v35;
                v34 = v2.GetEligiblePromptsResponse_TemplatesEntry.decode(v33);
                v35 = v5.TemplateEntry.new();
                v29.templates[v34.key or ""] = v34.value or v35;
            else
                v33 = nil;
                v34, v35 = v0.readVarInt(v28, v30);
                v30 = v35 + v34;
            end;
        elseif v32 == v0.wireTypes.i32 then
            v33 = nil;
            v34, v35 = v0.readFixed32(v28, v30);
            v33 = v34;
            v30 = v35;
        elseif v32 == v0.wireTypes.i64 then
            v33 = nil;
            v34, v35 = v0.readFixed64(v28, v30);
            v33 = v34;
            v30 = v35;
        else
            error("Unsupported wire type: " .. v32);
        end;
    end;
    return v29;
end;
v6.jsonEncode = function(v36) --[[ Line: 199 ]] --[[ Name: jsonEncode ]]
    local v37 = {};
    if v36.page_entries ~= nil and #v36.page_entries > 0 then
        local v38 = {};
        for _, v40 in v36.page_entries do
            table.insert(v38, v40:jsonEncode());
        end;
        v37.pageEntries = v38;
    end;
    if v36.hydration_data ~= nil then
        v37.hydrationData = v36.hydration_data:jsonEncode();
    end;
    if v36.templates ~= nil and next(v36.templates) ~= nil then
        local v41 = {};
        for v42, v43 in v36.templates do
            v41[v42] = v43:jsonEncode();
        end;
        v37.templates = v41;
    end;
    return v37;
end;
v6.jsonDecode = function(v44) --[[ Line: 225 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v45 = l_v6_0.new();
    if v44.page_entries ~= nil then
        local v46 = {};
        for _, v48 in v44.page_entries do
            table.insert(v46, v4.UniversalPageEntry.jsonDecode(v48));
        end;
        v45.page_entries = v46;
    end;
    if v44.pageEntries ~= nil then
        local v49 = {};
        for _, v51 in v44.pageEntries do
            table.insert(v49, v4.UniversalPageEntry.jsonDecode(v51));
        end;
        v45.page_entries = v49;
    end;
    if v44.hydration_data ~= nil then
        v45.hydration_data = v3.HydrationContent.jsonDecode(v44.hydration_data);
    end;
    if v44.hydrationData ~= nil then
        v45.hydration_data = v3.HydrationContent.jsonDecode(v44.hydrationData);
    end;
    if v44.templates ~= nil then
        local v52 = {};
        for v53, v54 in v44.templates do
            v52[v53] = v5.TemplateEntry.jsonDecode(v54);
        end;
        v45.templates = v52;
    end;
    return v45;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
};
v2.GetEligiblePromptsResponse = v6;
v1.default:register(v2.GetEligiblePromptsResponse);
v6 = {};
v6.__index = v6;
v6.new = function(v55) --[[ Line: 290 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v55 ~= nil) or v55.key == nil) and "" or v55.key, 
        value = if not (v55 ~= nil) or v55.value == nil then nil else v55.value
    }, v6));
end;
v6.encode = function(v56) --[[ Line: 299 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v57 = buffer.create(0);
    local v58 = 0;
    if v56.key ~= nil and v56.key ~= "" then
        local v59, v60 = v0.writeTag(v57, v58, 1, v0.wireTypes.lengthDelimited);
        v59, v60 = v0.writeString(v59, v60, v56.key);
        v57 = v59;
        v58 = v60;
    end;
    if v56.value ~= nil then
        local v61 = v56.value:encode();
        local v62, v63 = v0.writeTag(v57, v58, 2, v0.wireTypes.lengthDelimited);
        v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
        v57 = v62;
        v58 = v63;
    end;
    local v64 = buffer.create(v58);
    buffer.copy(v64, 0, v57, 0, v58);
    return v64;
end;
v6.decode = function(v65) --[[ Line: 321 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v5 (copy)
    local v66 = v6.new();
    local v67 = 0;
    while v67 < buffer.len(v65) do
        local v68 = nil;
        local v69 = nil;
        local v70, v71, v72 = v0.readTag(v65, v67);
        v68 = v70;
        v69 = v71;
        v67 = v72;
        if v69 == v0.wireTypes.varint then
            v70 = nil;
            v71, v72 = v0.readVarInt(v65, v67);
            v70 = v71;
            v67 = v72;
        elseif v69 == v0.wireTypes.lengthDelimited then
            if v68 == 1 then
                v70 = nil;
                v71, v72 = v0.readBuffer(v65, v67);
                v70 = v71;
                v67 = v72;
                v66.key = buffer.tostring(v70);
            elseif v68 == 2 then
                v70 = nil;
                v71, v72 = v0.readBuffer(v65, v67);
                v70 = v71;
                v67 = v72;
                v66.value = v5.TemplateEntry.decode(v70);
            else
                v70 = nil;
                v71, v72 = v0.readVarInt(v65, v67);
                v67 = v72 + v71;
            end;
        elseif v69 == v0.wireTypes.i32 then
            v70 = nil;
            v71, v72 = v0.readFixed32(v65, v67);
            v70 = v71;
            v67 = v72;
        elseif v69 == v0.wireTypes.i64 then
            v70 = nil;
            v71, v72 = v0.readFixed64(v65, v67);
            v70 = v71;
            v67 = v72;
        else
            error("Unsupported wire type: " .. v69);
        end;
    end;
    return v66;
end;
v6.jsonEncode = function(v73) --[[ Line: 371 ]] --[[ Name: jsonEncode ]]
    local v74 = {};
    if v73.key ~= nil and v73.key ~= "" then
        v74.key = v73.key;
    end;
    if v73.value ~= nil then
        v74.value = v73.value:jsonEncode();
    end;
    return v74;
end;
v6.jsonDecode = function(v75) --[[ Line: 387 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v5 (copy)
    local v76 = v6.new();
    if v75.key ~= nil then
        v76.key = v75.key;
    end;
    if v75.value ~= nil then
        v76.value = v5.TemplateEntry.jsonDecode(v75.value);
    end;
    return v76;
end;
v6.descriptor = {
    name = "GetEligiblePromptsResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
};
v2.GetEligiblePromptsResponse_TemplatesEntry = v6;
v1.default:register(v2.GetEligiblePromptsResponse_TemplatesEntry);
return {
    GetEligiblePromptsResponse = v2.GetEligiblePromptsResponse
};