local v0 = require(script.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
local l_v3_0 = v3 --[[ copy: 3 -> 4 ]];
v3.new = function(v5) --[[ Line: 125 ]] --[[ Name: new ]]
    -- upvalues: l_v3_0 (copy)
    return (setmetatable({
        fields = if not (v5 ~= nil) or v5.fields == nil then {} else v5.fields
    }, l_v3_0));
end;
v3.encode = function(v6) --[[ Line: 131 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.fields ~= nil and next(v6.fields) ~= nil then
        for v9, v10 in v6.fields do
            local v11 = buffer.create(0);
            local v12, v13 = v0.writeTag(v11, 0, 1, v0.wireTypes.lengthDelimited);
            v12, v13 = v0.writeString(v12, v13, v9);
            v11 = v12;
            local l_v13_0 = v13;
            v12 = v10:encode();
            local v15;
            v13, v15 = v0.writeTag(v11, l_v13_0, 2, v0.wireTypes.lengthDelimited);
            v13, v15 = v0.writeBuffer(v13, v15, v12, buffer.len(v12));
            v11 = v13;
            l_v13_0 = v15;
            v13, v15 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
            v13, v15 = v0.writeBuffer(v13, v15, v11, l_v13_0);
            v7 = v13;
            v8 = v15;
        end;
    end;
    local v16 = buffer.create(v8);
    buffer.copy(v16, 0, v7, 0, v8);
    return v16;
end;
v3.decode = function(v17) --[[ Line: 154 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_0 (copy), v0 (copy), v2 (copy)
    local v18 = l_v3_0.new();
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
                v23 = v2.Struct_FieldsEntry.decode(v22);
                v24 = v2.Value.new();
                v18.fields[v23.key or ""] = v23.value or v24;
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
v3.jsonEncode = function(v25) --[[ Line: 204 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v26 = {};
    for v27, v28 in v25.fields do
        v26[v27] = v2.Value.jsonEncode(v28);
    end;
    return v26;
end;
v3.jsonDecode = function(v29) --[[ Line: 214 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v2 (copy), l_v3_0 (copy)
    local v30 = {};
    for v31, v32 in v29 do
        v30[v31] = v2.Value.jsonDecode(v32);
    end;
    return l_v3_0.new({
        fields = v30
    });
end;
v3.descriptor = {
    name = "Struct", 
    fullName = "google.protobuf.Struct"
};
v2.Struct = v3;
v1.default:register(v2.Struct);
v3 = {};
v3.__index = v3;
local l_v3_1 = v3 --[[ copy: 3 -> 5 ]];
v3.new = function(v34) --[[ Line: 240 ]] --[[ Name: new ]]
    -- upvalues: l_v3_1 (copy)
    return (setmetatable({
        key = (not (v34 ~= nil) or v34.key == nil) and "" or v34.key, 
        value = if not (v34 ~= nil) or v34.value == nil then nil else v34.value
    }, l_v3_1));
end;
v3.encode = function(v35) --[[ Line: 247 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v36 = buffer.create(0);
    local v37 = 0;
    if v35.key ~= nil and v35.key ~= "" then
        local v38, v39 = v0.writeTag(v36, v37, 1, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeString(v38, v39, v35.key);
        v36 = v38;
        v37 = v39;
    end;
    if v35.value ~= nil then
        local v40 = v35.value:encode();
        local v41, v42 = v0.writeTag(v36, v37, 2, v0.wireTypes.lengthDelimited);
        v41, v42 = v0.writeBuffer(v41, v42, v40, buffer.len(v40));
        v36 = v41;
        v37 = v42;
    end;
    local v43 = buffer.create(v37);
    buffer.copy(v43, 0, v36, 0, v37);
    return v43;
end;
v3.decode = function(v44) --[[ Line: 267 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_1 (copy), v0 (copy), v2 (copy)
    local v45 = l_v3_1.new();
    local v46 = 0;
    while v46 < buffer.len(v44) do
        local v47 = nil;
        local v48 = nil;
        local v49, v50, v51 = v0.readTag(v44, v46);
        v47 = v49;
        v48 = v50;
        v46 = v51;
        if v48 == v0.wireTypes.varint then
            v49 = nil;
            v50, v51 = v0.readVarInt(v44, v46);
            v49 = v50;
            v46 = v51;
        elseif v48 == v0.wireTypes.lengthDelimited then
            if v47 == 1 then
                v49 = nil;
                v50, v51 = v0.readBuffer(v44, v46);
                v49 = v50;
                v46 = v51;
                v45.key = buffer.tostring(v49);
            elseif v47 == 2 then
                v49 = nil;
                v50, v51 = v0.readBuffer(v44, v46);
                v49 = v50;
                v46 = v51;
                v45.value = v2.Value.decode(v49);
            else
                v49 = nil;
                v50, v51 = v0.readVarInt(v44, v46);
                v46 = v51 + v50;
            end;
        elseif v48 == v0.wireTypes.i32 then
            v49 = nil;
            v50, v51 = v0.readFixed32(v44, v46);
            v49 = v50;
            v46 = v51;
        elseif v48 == v0.wireTypes.i64 then
            v49 = nil;
            v50, v51 = v0.readFixed64(v44, v46);
            v49 = v50;
            v46 = v51;
        else
            error("Unsupported wire type: " .. v48);
        end;
    end;
    return v45;
end;
v3.jsonEncode = function(v52) --[[ Line: 315 ]] --[[ Name: jsonEncode ]]
    local v53 = {};
    if v52.key ~= nil and v52.key ~= "" then
        v53.key = v52.key;
    end;
    if v52.value ~= nil then
        v53.value = v52.value:jsonEncode();
    end;
    return v53;
end;
v3.jsonDecode = function(v54) --[[ Line: 329 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_1 (copy), v2 (copy)
    local v55 = l_v3_1.new();
    if v54.key ~= nil then
        v55.key = v54.key;
    end;
    if v54.value ~= nil then
        v55.value = v2.Value.jsonDecode(v54.value);
    end;
    return v55;
end;
v3.descriptor = {
    name = "Struct_FieldsEntry", 
    fullName = "google.protobuf.FieldsEntry"
};
v2.Struct_FieldsEntry = v3;
v1.default:register(v2.Struct_FieldsEntry);
v3 = {};
v3.__index = v3;
local l_v3_2 = v3 --[[ copy: 3 -> 6 ]];
v3.new = function(v57) --[[ Line: 357 ]] --[[ Name: new ]]
    -- upvalues: l_v3_2 (copy)
    return (setmetatable({
        kind = if not (v57 ~= nil) or v57.kind == nil then nil else v57.kind
    }, l_v3_2));
end;
v3.encode = function(v58) --[[ Line: 363 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v59 = buffer.create(0);
    local v60 = 0;
    if v58.kind ~= nil then
        if v58.kind.type == "null_value" then
            local v61, v62 = v0.writeTag(v59, v60, 1, v0.wireTypes.varint);
            v61, v62 = v0.writeVarInt(v61, v62, v2.NullValue.toNumber(v58.kind.value));
            v59 = v61;
            v60 = v62;
        elseif v58.kind.type == "number_value" then
            local v63, v64 = v0.writeTag(v59, v60, 2, v0.wireTypes.i64);
            v63, v64 = v0.writeDouble(v63, v64, v58.kind.value);
            v59 = v63;
            v60 = v64;
        elseif v58.kind.type == "string_value" then
            local v65, v66 = v0.writeTag(v59, v60, 3, v0.wireTypes.lengthDelimited);
            v65, v66 = v0.writeString(v65, v66, v58.kind.value);
            v59 = v65;
            v60 = v66;
        elseif v58.kind.type == "bool_value" then
            local v67, v68 = v0.writeTag(v59, v60, 4, v0.wireTypes.varint);
            v67, v68 = v0.writeVarInt(v67, v68, v58.kind.value and 1 or 0);
            v59 = v67;
            v60 = v68;
        elseif v58.kind.type == "struct_value" then
            local v69 = v58.kind.value:encode();
            local v70, v71 = v0.writeTag(v59, v60, 5, v0.wireTypes.lengthDelimited);
            v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
            v59 = v70;
            v60 = v71;
        elseif v58.kind.type == "list_value" then
            local v72 = v58.kind.value:encode();
            local v73, v74 = v0.writeTag(v59, v60, 6, v0.wireTypes.lengthDelimited);
            v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
            v59 = v73;
            v60 = v74;
        end;
    end;
    local v75 = buffer.create(v60);
    buffer.copy(v75, 0, v59, 0, v60);
    return v75;
end;
v3.decode = function(v76) --[[ Line: 396 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_2 (copy), v0 (copy), v2 (copy)
    local v77 = l_v3_2.new();
    local v78 = 0;
    while v78 < buffer.len(v76) do
        local v79 = nil;
        local v80 = nil;
        local v81, v82, v83 = v0.readTag(v76, v78);
        v79 = v81;
        v80 = v82;
        v78 = v83;
        if v80 == v0.wireTypes.varint then
            if v79 == 1 then
                v81 = nil;
                v82, v83 = v0.readVarIntI32(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "null_value", 
                    value = v2.NullValue.fromNumber(v81) or v81
                };
            elseif v79 == 4 then
                v81 = nil;
                v82, v83 = v0.readVarInt(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "bool_value", 
                    value = v81 ~= 0
                };
            else
                v81 = nil;
                v82, v83 = v0.readVarInt(v76, v78);
                v81 = v82;
                v78 = v83;
            end;
        elseif v80 == v0.wireTypes.lengthDelimited then
            if v79 == 3 then
                v81 = nil;
                v82, v83 = v0.readBuffer(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "string_value", 
                    value = buffer.tostring(v81)
                };
            elseif v79 == 5 then
                v81 = nil;
                v82, v83 = v0.readBuffer(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "struct_value", 
                    value = v2.Struct.decode(v81)
                };
            elseif v79 == 6 then
                v81 = nil;
                v82, v83 = v0.readBuffer(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "list_value", 
                    value = v2.ListValue.decode(v81)
                };
            else
                v81 = nil;
                v82, v83 = v0.readVarInt(v76, v78);
                v78 = v83 + v82;
            end;
        elseif v80 == v0.wireTypes.i32 then
            v81 = nil;
            v82, v83 = v0.readFixed32(v76, v78);
            v81 = v82;
            v78 = v83;
        elseif v80 == v0.wireTypes.i64 then
            if v79 == 2 then
                v81 = nil;
                v82, v83 = v0.readDouble(v76, v78);
                v81 = v82;
                v78 = v83;
                v77.kind = {
                    type = "number_value", 
                    value = v81
                };
            else
                v81 = nil;
                v82, v83 = v0.readFixed64(v76, v78);
                v81 = v82;
                v78 = v83;
            end;
        else
            error("Unsupported wire type: " .. v80);
        end;
    end;
    return v77;
end;
v3.jsonEncode = function(v84) --[[ Line: 467 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local l_kind_0 = v84.kind;
    if l_kind_0 == nil or l_kind_0.type == "null_value" then
        return nil;
    elseif l_kind_0.type == "number_value" or l_kind_0.type == "string_value" or l_kind_0.type == "bool_value" then
        return l_kind_0.value;
    elseif l_kind_0.type == "list_value" then
        return v2.ListValue.jsonEncode(l_kind_0.value);
    elseif l_kind_0.type == "struct_value" then
        return v2.Struct.jsonEncode(l_kind_0.value);
    else
        return l_kind_0.type;
    end;
end;
v3.jsonDecode = function(v86) --[[ Line: 484 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_2 (copy), v2 (copy)
    if v86 == nil then
        return l_v3_2.new({
            kind = {
                type = "null_value", 
                value = "NULL_VALUE"
            }
        });
    elseif typeof(v86) == "number" then
        return l_v3_2.new({
            kind = {
                type = "number_value", 
                value = v86
            }
        });
    elseif typeof(v86) == "string" then
        return l_v3_2.new({
            kind = {
                type = "string_value", 
                value = v86
            }
        });
    elseif typeof(v86) == "boolean" then
        return l_v3_2.new({
            kind = {
                type = "bool_value", 
                value = v86
            }
        });
    elseif typeof(v86) == "table" then
        local v87 = true;
        local v88 = 0;
        for _ in v86 do
            v88 = v88 + 1;
            if #v86 < v88 then
                v87 = false;
                break;
            end;
        end;
        if v88 == #v86 then
            return l_v3_2.new({
                kind = {
                    type = "list_value", 
                    value = v2.ListValue.jsonDecode(v86)
                }
            });
        else
            return l_v3_2.new({
                kind = {
                    type = "struct_value", 
                    value = v2.Struct.jsonDecode(v86)
                }
            });
        end;
    else
        error((("Unknown input type: %*"):format((typeof(v86)))));
        return;
    end;
end;
v3.descriptor = {
    name = "Value", 
    fullName = "google.protobuf.Value"
};
v2.Value = v3;
v1.default:register(v2.Value);
v3 = {};
v3.__index = v3;
v3.new = function(v90) --[[ Line: 530 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        values = if not (v90 ~= nil) or v90.values == nil then {} else v90.values
    }, v3));
end;
v3.encode = function(v91) --[[ Line: 536 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v92 = buffer.create(0);
    local v93 = 0;
    if v91.values ~= nil and #v91.values > 0 then
        for _, v95 in v91.values do
            local v96 = v95:encode();
            local v97, v98 = v0.writeTag(v92, v93, 1, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
            v92 = v97;
            v93 = v98;
        end;
    end;
    local v99 = buffer.create(v93);
    buffer.copy(v99, 0, v92, 0, v93);
    return v99;
end;
v3.decode = function(v100) --[[ Line: 553 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    local v101 = v3.new();
    local v102 = 0;
    while v102 < buffer.len(v100) do
        local v103 = nil;
        local v104 = nil;
        local v105, v106, v107 = v0.readTag(v100, v102);
        v103 = v105;
        v104 = v106;
        v102 = v107;
        if v104 == v0.wireTypes.varint then
            v105 = nil;
            v106, v107 = v0.readVarInt(v100, v102);
            v105 = v106;
            v102 = v107;
        elseif v104 == v0.wireTypes.lengthDelimited then
            if v103 == 1 then
                v105 = nil;
                v106, v107 = v0.readBuffer(v100, v102);
                v105 = v106;
                v102 = v107;
                table.insert(v101.values, v2.Value.decode(v105));
            else
                v105 = nil;
                v106, v107 = v0.readVarInt(v100, v102);
                v102 = v107 + v106;
            end;
        elseif v104 == v0.wireTypes.i32 then
            v105 = nil;
            v106, v107 = v0.readFixed32(v100, v102);
            v105 = v106;
            v102 = v107;
        elseif v104 == v0.wireTypes.i64 then
            v105 = nil;
            v106, v107 = v0.readFixed64(v100, v102);
            v105 = v106;
            v102 = v107;
        else
            error("Unsupported wire type: " .. v104);
        end;
    end;
    return v101;
end;
v3.jsonEncode = function(v108) --[[ Line: 596 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy)
    local v109 = {};
    for _, v111 in v108.values do
        table.insert(v109, v2.Value.jsonEncode(v111));
    end;
    return v109;
end;
v3.jsonDecode = function(v112) --[[ Line: 606 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v113 = {};
    for _, v115 in v112 do
        table.insert(v113, v2.Value.jsonDecode(v115));
    end;
    return v3.new({
        values = v113
    });
end;
v3.descriptor = {
    name = "ListValue", 
    fullName = "google.protobuf.ListValue"
};
v2.ListValue = v3;
v1.default:register(v2.ListValue);
v2.NullValue = {
    fromNumber = function(v116) --[[ Line: 631 ]] --[[ Name: fromNumber ]]
        if v116 == 0 then
            return "NULL_VALUE";
        else
            return nil;
        end;
    end, 
    toNumber = function(v117) --[[ Line: 639 ]] --[[ Name: toNumber ]]
        if v117 == "NULL_VALUE" then
            return 0;
        else
            return v117;
        end;
    end, 
    fromName = function(v118) --[[ Line: 647 ]] --[[ Name: fromName ]]
        if v118 == "NULL_VALUE" then
            return "NULL_VALUE";
        else
            return nil;
        end;
    end
};
return {
    Struct = v2.Struct, 
    Value = v2.Value, 
    ListValue = v2.ListValue, 
    NullValue = v2.NullValue
};