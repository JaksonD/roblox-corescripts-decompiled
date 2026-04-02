local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content);
local v4 = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry);
local v5 = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content);
local v6 = {};
v6.__index = v6;
local l_v6_0 = v6 --[[ copy: 6 -> 7 ]];
v6.new = function(v8) --[[ Line: 120 ]] --[[ Name: new ]]
    -- upvalues: l_v6_0 (copy)
    return (setmetatable({
        request_id = (not (v8 ~= nil) or v8.request_id == nil) and "" or v8.request_id, 
        context = (not (v8 ~= nil) or v8.context == nil) and "" or v8.context, 
        screen_size = (not (v8 ~= nil) or v8.screen_size == nil) and "" or v8.screen_size
    }, l_v6_0));
end;
v6.encode = function(v9) --[[ Line: 130 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v10 = buffer.create(0);
    local v11 = 0;
    if v9.request_id ~= nil and v9.request_id ~= "" then
        local v12, v13 = v0.writeTag(v10, v11, 1, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v9.request_id);
        v10 = v12;
        v11 = v13;
    end;
    if v9.context ~= nil and v9.context ~= "" then
        local v14, v15 = v0.writeTag(v10, v11, 2, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v9.context);
        v10 = v14;
        v11 = v15;
    end;
    if v9.screen_size ~= nil and v9.screen_size ~= "" then
        local v16, v17 = v0.writeTag(v10, v11, 3, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeString(v16, v17, v9.screen_size);
        v10 = v16;
        v11 = v17;
    end;
    local v18 = buffer.create(v11);
    buffer.copy(v18, 0, v10, 0, v11);
    return v18;
end;
v6.decode = function(v19) --[[ Line: 154 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_0 (copy), v0 (copy)
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
                v20.request_id = buffer.tostring(v24);
            elseif v22 == 2 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.context = buffer.tostring(v24);
            elseif v22 == 3 then
                v24 = nil;
                v25, v26 = v0.readBuffer(v19, v21);
                v24 = v25;
                v21 = v26;
                v20.screen_size = buffer.tostring(v24);
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
v6.jsonEncode = function(v27) --[[ Line: 207 ]] --[[ Name: jsonEncode ]]
    local v28 = {};
    if v27.request_id ~= nil and v27.request_id ~= "" then
        v28.requestId = v27.request_id;
    end;
    if v27.context ~= nil and v27.context ~= "" then
        v28.context = v27.context;
    end;
    if v27.screen_size ~= nil and v27.screen_size ~= "" then
        v28.screenSize = v27.screen_size;
    end;
    return v28;
end;
v6.jsonDecode = function(v29) --[[ Line: 225 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_0 (copy)
    local v30 = l_v6_0.new();
    if v29.request_id ~= nil then
        v30.request_id = v29.request_id;
    end;
    if v29.requestId ~= nil then
        v30.request_id = v29.requestId;
    end;
    if v29.context ~= nil then
        v30.context = v29.context;
    end;
    if v29.screen_size ~= nil then
        v30.screen_size = v29.screen_size;
    end;
    if v29.screenSize ~= nil then
        v30.screen_size = v29.screenSize;
    end;
    return v30;
end;
v6.descriptor = {
    name = "MarketplaceCatalogPageRequest", 
    fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageRequest"
};
v2.MarketplaceCatalogPageRequest = v6;
v1.default:register(v2.MarketplaceCatalogPageRequest);
v6 = {};
v6.__index = v6;
local l_v6_1 = v6 --[[ copy: 6 -> 8 ]];
v6.new = function(v32) --[[ Line: 265 ]] --[[ Name: new ]]
    -- upvalues: l_v6_1 (copy)
    return (setmetatable({
        page_entries = if not (v32 ~= nil) or v32.page_entries == nil then {} else v32.page_entries, 
        hydration_data = if not (v32 ~= nil) or v32.hydration_data == nil then nil else v32.hydration_data, 
        templates = if not (v32 ~= nil) or v32.templates == nil then {} else v32.templates
    }, l_v6_1));
end;
v6.encode = function(v33) --[[ Line: 275 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v34 = buffer.create(0);
    local v35 = 0;
    if v33.page_entries ~= nil and #v33.page_entries > 0 then
        for _, v37 in v33.page_entries do
            local v38 = v37:encode();
            local v39, v40 = v0.writeTag(v34, v35, 1, v0.wireTypes.lengthDelimited);
            v39, v40 = v0.writeBuffer(v39, v40, v38, buffer.len(v38));
            v34 = v39;
            v35 = v40;
        end;
    end;
    if v33.hydration_data ~= nil then
        local v41 = v33.hydration_data:encode();
        local v42, v43 = v0.writeTag(v34, v35, 2, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeBuffer(v42, v43, v41, buffer.len(v41));
        v34 = v42;
        v35 = v43;
    end;
    if v33.templates ~= nil and next(v33.templates) ~= nil then
        for v44, v45 in v33.templates do
            local v46 = buffer.create(0);
            local v47, v48 = v0.writeTag(v46, 0, 1, v0.wireTypes.lengthDelimited);
            v47, v48 = v0.writeString(v47, v48, v44);
            v46 = v47;
            local l_v48_0 = v48;
            v47 = v45:encode();
            local v50;
            v48, v50 = v0.writeTag(v46, l_v48_0, 2, v0.wireTypes.lengthDelimited);
            v48, v50 = v0.writeBuffer(v48, v50, v47, buffer.len(v47));
            v46 = v48;
            l_v48_0 = v50;
            v48, v50 = v0.writeTag(v34, v35, 3, v0.wireTypes.lengthDelimited);
            v48, v50 = v0.writeBuffer(v48, v50, v46, l_v48_0);
            v34 = v48;
            v35 = v50;
        end;
    end;
    local v51 = buffer.create(v35);
    buffer.copy(v51, 0, v34, 0, v35);
    return v51;
end;
v6.decode = function(v52) --[[ Line: 312 ]] --[[ Name: decode ]]
    -- upvalues: l_v6_1 (copy), v0 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v53 = l_v6_1.new();
    local v54 = 0;
    while v54 < buffer.len(v52) do
        local v55 = nil;
        local v56 = nil;
        local v57, v58, v59 = v0.readTag(v52, v54);
        v55 = v57;
        v56 = v58;
        v54 = v59;
        if v56 == v0.wireTypes.varint then
            v57 = nil;
            v58, v59 = v0.readVarInt(v52, v54);
            v57 = v58;
            v54 = v59;
        elseif v56 == v0.wireTypes.lengthDelimited then
            if v55 == 1 then
                v57 = nil;
                v58, v59 = v0.readBuffer(v52, v54);
                v57 = v58;
                v54 = v59;
                table.insert(v53.page_entries, v5.UniversalPageEntry.decode(v57));
            elseif v55 == 2 then
                v57 = nil;
                v58, v59 = v0.readBuffer(v52, v54);
                v57 = v58;
                v54 = v59;
                v53.hydration_data = v3.HydrationContent.decode(v57);
            elseif v55 == 3 then
                v57 = nil;
                v58, v59 = v0.readBuffer(v52, v54);
                v57 = v58;
                v54 = v59;
                v58 = v2.MarketplaceCatalogPageResponse_TemplatesEntry.decode(v57);
                v59 = v4.TemplateEntry.new();
                v53.templates[v58.key or ""] = v58.value or v59;
            else
                v57 = nil;
                v58, v59 = v0.readVarInt(v52, v54);
                v54 = v59 + v58;
            end;
        elseif v56 == v0.wireTypes.i32 then
            v57 = nil;
            v58, v59 = v0.readFixed32(v52, v54);
            v57 = v58;
            v54 = v59;
        elseif v56 == v0.wireTypes.i64 then
            v57 = nil;
            v58, v59 = v0.readFixed64(v52, v54);
            v57 = v58;
            v54 = v59;
        else
            error("Unsupported wire type: " .. v56);
        end;
    end;
    return v53;
end;
v6.jsonEncode = function(v60) --[[ Line: 376 ]] --[[ Name: jsonEncode ]]
    local v61 = {};
    if v60.page_entries ~= nil and #v60.page_entries > 0 then
        local v62 = {};
        for _, v64 in v60.page_entries do
            table.insert(v62, v64:jsonEncode());
        end;
        v61.pageEntries = v62;
    end;
    if v60.hydration_data ~= nil then
        v61.hydrationData = v60.hydration_data:jsonEncode();
    end;
    if v60.templates ~= nil and next(v60.templates) ~= nil then
        local v65 = {};
        for v66, v67 in v60.templates do
            v65[v66] = v67:jsonEncode();
        end;
        v61.templates = v65;
    end;
    return v61;
end;
v6.jsonDecode = function(v68) --[[ Line: 402 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v6_1 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v69 = l_v6_1.new();
    if v68.page_entries ~= nil then
        local v70 = {};
        for _, v72 in v68.page_entries do
            table.insert(v70, v5.UniversalPageEntry.jsonDecode(v72));
        end;
        v69.page_entries = v70;
    end;
    if v68.pageEntries ~= nil then
        local v73 = {};
        for _, v75 in v68.pageEntries do
            table.insert(v73, v5.UniversalPageEntry.jsonDecode(v75));
        end;
        v69.page_entries = v73;
    end;
    if v68.hydration_data ~= nil then
        v69.hydration_data = v3.HydrationContent.jsonDecode(v68.hydration_data);
    end;
    if v68.hydrationData ~= nil then
        v69.hydration_data = v3.HydrationContent.jsonDecode(v68.hydrationData);
    end;
    if v68.templates ~= nil then
        local v76 = {};
        for v77, v78 in v68.templates do
            v76[v77] = v4.TemplateEntry.jsonDecode(v78);
        end;
        v69.templates = v76;
    end;
    return v69;
end;
v6.descriptor = {
    name = "MarketplaceCatalogPageResponse", 
    fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageResponse"
};
v2.MarketplaceCatalogPageResponse = v6;
v1.default:register(v2.MarketplaceCatalogPageResponse);
v6 = {};
v6.__index = v6;
v6.new = function(v79) --[[ Line: 467 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        key = (not (v79 ~= nil) or v79.key == nil) and "" or v79.key, 
        value = if not (v79 ~= nil) or v79.value == nil then nil else v79.value
    }, v6));
end;
v6.encode = function(v80) --[[ Line: 476 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v81 = buffer.create(0);
    local v82 = 0;
    if v80.key ~= nil and v80.key ~= "" then
        local v83, v84 = v0.writeTag(v81, v82, 1, v0.wireTypes.lengthDelimited);
        v83, v84 = v0.writeString(v83, v84, v80.key);
        v81 = v83;
        v82 = v84;
    end;
    if v80.value ~= nil then
        local v85 = v80.value:encode();
        local v86, v87 = v0.writeTag(v81, v82, 2, v0.wireTypes.lengthDelimited);
        v86, v87 = v0.writeBuffer(v86, v87, v85, buffer.len(v85));
        v81 = v86;
        v82 = v87;
    end;
    local v88 = buffer.create(v82);
    buffer.copy(v88, 0, v81, 0, v82);
    return v88;
end;
v6.decode = function(v89) --[[ Line: 498 ]] --[[ Name: decode ]]
    -- upvalues: v6 (copy), v0 (copy), v4 (copy)
    local v90 = v6.new();
    local v91 = 0;
    while v91 < buffer.len(v89) do
        local v92 = nil;
        local v93 = nil;
        local v94, v95, v96 = v0.readTag(v89, v91);
        v92 = v94;
        v93 = v95;
        v91 = v96;
        if v93 == v0.wireTypes.varint then
            v94 = nil;
            v95, v96 = v0.readVarInt(v89, v91);
            v94 = v95;
            v91 = v96;
        elseif v93 == v0.wireTypes.lengthDelimited then
            if v92 == 1 then
                v94 = nil;
                v95, v96 = v0.readBuffer(v89, v91);
                v94 = v95;
                v91 = v96;
                v90.key = buffer.tostring(v94);
            elseif v92 == 2 then
                v94 = nil;
                v95, v96 = v0.readBuffer(v89, v91);
                v94 = v95;
                v91 = v96;
                v90.value = v4.TemplateEntry.decode(v94);
            else
                v94 = nil;
                v95, v96 = v0.readVarInt(v89, v91);
                v91 = v96 + v95;
            end;
        elseif v93 == v0.wireTypes.i32 then
            v94 = nil;
            v95, v96 = v0.readFixed32(v89, v91);
            v94 = v95;
            v91 = v96;
        elseif v93 == v0.wireTypes.i64 then
            v94 = nil;
            v95, v96 = v0.readFixed64(v89, v91);
            v94 = v95;
            v91 = v96;
        else
            error("Unsupported wire type: " .. v93);
        end;
    end;
    return v90;
end;
v6.jsonEncode = function(v97) --[[ Line: 548 ]] --[[ Name: jsonEncode ]]
    local v98 = {};
    if v97.key ~= nil and v97.key ~= "" then
        v98.key = v97.key;
    end;
    if v97.value ~= nil then
        v98.value = v97.value:jsonEncode();
    end;
    return v98;
end;
v6.jsonDecode = function(v99) --[[ Line: 564 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v100 = v6.new();
    if v99.key ~= nil then
        v100.key = v99.key;
    end;
    if v99.value ~= nil then
        v100.value = v4.TemplateEntry.jsonDecode(v99.value);
    end;
    return v100;
end;
v6.descriptor = {
    name = "MarketplaceCatalogPageResponse_TemplatesEntry", 
    fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
};
v2.MarketplaceCatalogPageResponse_TemplatesEntry = v6;
v1.default:register(v2.MarketplaceCatalogPageResponse_TemplatesEntry);
return {
    MarketplaceCatalogPageRequest = v2.MarketplaceCatalogPageRequest, 
    MarketplaceCatalogPageResponse = v2.MarketplaceCatalogPageResponse
};