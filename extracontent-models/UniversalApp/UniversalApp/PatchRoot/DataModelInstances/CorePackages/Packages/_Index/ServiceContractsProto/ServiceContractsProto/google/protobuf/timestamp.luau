local v0 = require(script.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        seconds = (not (v4 ~= nil) or v4.seconds == nil) and 0 or v4.seconds, 
        nanos = (not (v4 ~= nil) or v4.nanos == nil) and 0 or v4.nanos
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 48 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.seconds ~= nil and v5.seconds ~= 0 then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.seconds);
        v6 = v8;
        v7 = v9;
    end;
    if v5.nanos ~= nil and v5.nanos ~= 0 then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v5.nanos);
        v6 = v10;
        v7 = v11;
    end;
    local v12 = buffer.create(v7);
    buffer.copy(v12, 0, v6, 0, v7);
    return v12;
end;
v3.decode = function(v13) --[[ Line: 67 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v14 = v3.new();
    local v15 = 0;
    while v15 < buffer.len(v13) do
        local v16 = nil;
        local v17 = nil;
        local v18, v19, v20 = v0.readTag(v13, v15);
        v16 = v18;
        v17 = v19;
        v15 = v20;
        if v17 == v0.wireTypes.varint then
            if v16 == 1 then
                v18 = nil;
                v19, v20 = v0.readVarIntI64(v13, v15);
                v18 = v19;
                v15 = v20;
                v14.seconds = v18;
            elseif v16 == 2 then
                v18 = nil;
                v19, v20 = v0.readVarIntI32(v13, v15);
                v18 = v19;
                v15 = v20;
                v14.nanos = v18;
            else
                v18 = nil;
                v19, v20 = v0.readVarInt(v13, v15);
                v18 = v19;
                v15 = v20;
            end;
        elseif v17 == v0.wireTypes.lengthDelimited then
            v18 = nil;
            v19, v20 = v0.readVarInt(v13, v15);
            v15 = v20 + v19;
        elseif v17 == v0.wireTypes.i32 then
            v18 = nil;
            v19, v20 = v0.readFixed32(v13, v15);
            v18 = v19;
            v15 = v20;
        elseif v17 == v0.wireTypes.i64 then
            v18 = nil;
            v19, v20 = v0.readFixed64(v13, v15);
            v18 = v19;
            v15 = v20;
        else
            error("Unsupported wire type: " .. v17);
        end;
    end;
    return v14;
end;
local function v22(v21) --[[ Line: 115 ]] --[[ Name: serializeFractionalNanos ]]
    if v21 % 1000000 == 0 then
        return string.format(".%03d", v21);
    elseif v21 % 1000 == 0 then
        return string.format(".%06d", v21);
    else
        return string.format(".%09d", v21);
    end;
end;
local function _(v23) --[[ Line: 125 ]] --[[ Name: deserializeFractionalNanos ]]
    local v24 = assert(tonumber(v23), "Invalid nanos string received, couldn't turn into a number");
    for v25 = #v23 + 1, 9 do
        v24 = v24 + 10 ^ (v25 - 1);
    end;
    return v24;
end;
v3.jsonEncode = function(v27) --[[ Line: 134 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v22 (copy)
    if v27.seconds > 253402300799 then
        error("Invalid timestamp provided: years after 9999 are not supported");
    end;
    if v27.seconds < -62135596800 then
        error("Invalid timestamp provided: years before 0001 are not supported");
    end;
    local v28 = os.date("!*t", v27.seconds or 0);
    if v28 == nil then
        error("Invalid timestamp provided: exceeded supported timestamp range on this platform");
    end;
    return string.format("%04d-%02d-%02dT%02d:%02d:%02d%sZ", v28.year, v28.month, v28.day, v28.hour, v28.min, v28.sec, v27.nanos == 0 and "" or v22(v27.nanos));
end;
v3.jsonDecode = function(v29) --[[ Line: 160 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v30, v31, v32, v33, v34, v35, v36 = string.match(v29, "^([0-9]+)-([0-9]+)-([0-9]+)T([0-9]+):([0-9]+):([0-9]+)(.*)Z$");
    if v30 == nil or v31 == nil or v32 == nil or v33 == nil or v34 == nil or v35 == nil or v36 == nil then
        error("Invalid timestamp provided");
    end;
    local v37 = 0;
    if #v36 ~= 0 then
        local v38 = string.match(v36, "^%.([0-9]+)$");
        if v38 == nil then
            error("Invalid nanoseconds provided in timestamp: `" .. v36 .. "`");
        end;
        local v39 = assert(tonumber(v38), "Invalid nanos string received, couldn't turn into a number");
        for v40 = #v38 + 1, 9 do
            v39 = v39 + 10 ^ (v40 - 1);
        end;
        v37 = v39;
    end;
    local v41 = os.time({
        year = assert(tonumber(v30), "Invalid formatted year"), 
        month = assert(tonumber(v31), "Invalid formatted month"), 
        day = assert(tonumber(v32), "Invalid formatted day"), 
        hour = assert(tonumber(v33), "Invalid formatted hour"), 
        min = assert(tonumber(v34), "Invalid formatted min"), 
        sec = assert(tonumber(v35), "Invalid formatted sec")
    });
    return v3.new({
        seconds = v41, 
        nanos = v37
    });
end;
v3.descriptor = {
    name = "Timestamp", 
    fullName = "google.protobuf.Timestamp"
};
v2.Timestamp = v3;
v1.default:register(v2.Timestamp);
return {
    Timestamp = v2.Timestamp
};