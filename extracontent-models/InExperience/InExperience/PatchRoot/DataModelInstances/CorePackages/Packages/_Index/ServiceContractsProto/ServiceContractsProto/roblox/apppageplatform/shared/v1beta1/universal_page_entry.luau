local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.page_entry);
local v4 = require(script.Parent.page_entry_content);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        page_entry = if not (v6 ~= nil) or v6.page_entry == nil then nil else v6.page_entry, 
        input_data = if not (v6 ~= nil) or v6.input_data == nil then nil else v6.input_data
    }, v5));
end;
v5.encode = function(v7) --[[ Line: 55 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v8 = buffer.create(0);
    local v9 = 0;
    if v7.page_entry ~= nil then
        local v10 = v7.page_entry:encode();
        local v11, v12 = v0.writeTag(v8, v9, 1, v0.wireTypes.lengthDelimited);
        v11, v12 = v0.writeBuffer(v11, v12, v10, buffer.len(v10));
        v8 = v11;
        v9 = v12;
    end;
    if v7.input_data ~= nil then
        local v13 = v7.input_data:encode();
        local v14, v15 = v0.writeTag(v8, v9, 2, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeBuffer(v14, v15, v13, buffer.len(v13));
        v8 = v14;
        v9 = v15;
    end;
    local v16 = buffer.create(v9);
    buffer.copy(v16, 0, v8, 0, v9);
    return v16;
end;
v5.decode = function(v17) --[[ Line: 76 ]] --[[ Name: decode ]]
    -- upvalues: v5 (copy), v0 (copy), v3 (copy), v4 (copy)
    local v18 = v5.new();
    local v19 = 0;
    while v19 < buffer.len(v17) do
        local v20 = nil;
        local v21 = nil;
        local v22, v23, v24 = v0.readTag(v17, v19);
        v20 = v22;
        v21 = v23;
        v19 = v24;
        if v21 == v0.wireTypes.varint then
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.lengthDelimited then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.page_entry = v3.PageEntry.decode(v22);
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.input_data = v4.PageEntryInputData.decode(v22);
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v19 = v24 + v23;
            end;
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
v5.jsonEncode = function(v25) --[[ Line: 125 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.page_entry ~= nil then
        v26.pageEntry = v25.page_entry:jsonEncode();
    end;
    if v25.input_data ~= nil then
        v26.inputData = v25.input_data:jsonEncode();
    end;
    return v26;
end;
v5.jsonDecode = function(v27) --[[ Line: 139 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local v28 = v5.new();
    if v27.page_entry ~= nil then
        v28.page_entry = v3.PageEntry.jsonDecode(v27.page_entry);
    end;
    if v27.pageEntry ~= nil then
        v28.page_entry = v3.PageEntry.jsonDecode(v27.pageEntry);
    end;
    if v27.input_data ~= nil then
        v28.input_data = v4.PageEntryInputData.jsonDecode(v27.input_data);
    end;
    if v27.inputData ~= nil then
        v28.input_data = v4.PageEntryInputData.jsonDecode(v27.inputData);
    end;
    return v28;
end;
v5.descriptor = {
    name = "UniversalPageEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
};
v2.UniversalPageEntry = v5;
v1.default:register(v2.UniversalPageEntry);
v2.PageEntryFormat = {
    fromNumber = function(v29) --[[ Line: 175 ]] --[[ Name: fromNumber ]]
        if v29 == 0 then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v29 == 1 then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end, 
    toNumber = function(v30) --[[ Line: 185 ]] --[[ Name: toNumber ]]
        if v30 == "PAGE_ENTRY_FORMAT_INVALID" then
            return 0;
        elseif v30 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return 1;
        else
            return v30;
        end;
    end, 
    fromName = function(v31) --[[ Line: 195 ]] --[[ Name: fromName ]]
        if v31 == "PAGE_ENTRY_FORMAT_INVALID" then
            return "PAGE_ENTRY_FORMAT_INVALID";
        elseif v31 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
            return "PAGE_ENTRY_FORMAT_UNIVERSAL";
        else
            return nil;
        end;
    end
};
return {
    UniversalPageEntry = v2.UniversalPageEntry, 
    PageEntryFormat = v2.PageEntryFormat
};