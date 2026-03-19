local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
local l_v3_0 = v3 --[[ copy: 3 -> 4 ]];
v3.new = function(v5) --[[ Line: 183 ]] --[[ Name: new ]]
    -- upvalues: l_v3_0 (copy)
    return (setmetatable({
        kind = if not (v5 ~= nil) or v5.kind == nil then nil else v5.kind
    }, l_v3_0));
end;
v3.encode = function(v6) --[[ Line: 189 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = buffer.create(0);
    local v8 = 0;
    if v6.kind ~= nil then
        if v6.kind.type == "comparison" then
            local v9 = v6.kind.value:encode();
            local v10, v11 = v0.writeTag(v7, v8, 1, v0.wireTypes.lengthDelimited);
            v10, v11 = v0.writeBuffer(v10, v11, v9, buffer.len(v9));
            v7 = v10;
            v8 = v11;
        elseif v6.kind.type == "is_null" then
            local v12 = v6.kind.value:encode();
            local v13, v14 = v0.writeTag(v7, v8, 2, v0.wireTypes.lengthDelimited);
            v13, v14 = v0.writeBuffer(v13, v14, v12, buffer.len(v12));
            v7 = v13;
            v8 = v14;
        elseif v6.kind.type == "is_not_null" then
            local v15 = v6.kind.value:encode();
            local v16, v17 = v0.writeTag(v7, v8, 3, v0.wireTypes.lengthDelimited);
            v16, v17 = v0.writeBuffer(v16, v17, v15, buffer.len(v15));
            v7 = v16;
            v8 = v17;
        elseif v6.kind.type == "and_condition" then
            local v18 = v6.kind.value:encode();
            local v19, v20 = v0.writeTag(v7, v8, 4, v0.wireTypes.lengthDelimited);
            v19, v20 = v0.writeBuffer(v19, v20, v18, buffer.len(v18));
            v7 = v19;
            v8 = v20;
        elseif v6.kind.type == "or_condition" then
            local v21 = v6.kind.value:encode();
            local v22, v23 = v0.writeTag(v7, v8, 5, v0.wireTypes.lengthDelimited);
            v22, v23 = v0.writeBuffer(v22, v23, v21, buffer.len(v21));
            v7 = v22;
            v8 = v23;
        end;
    end;
    local v24 = buffer.create(v8);
    buffer.copy(v24, 0, v7, 0, v8);
    return v24;
end;
v3.decode = function(v25) --[[ Line: 222 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_0 (copy), v0 (copy), v2 (copy)
    local v26 = l_v3_0.new();
    local v27 = 0;
    while v27 < buffer.len(v25) do
        local v28 = nil;
        local v29 = nil;
        local v30, v31, v32 = v0.readTag(v25, v27);
        v28 = v30;
        v29 = v31;
        v27 = v32;
        if v29 == v0.wireTypes.varint then
            v30 = nil;
            v31, v32 = v0.readVarInt(v25, v27);
            v30 = v31;
            v27 = v32;
        elseif v29 == v0.wireTypes.lengthDelimited then
            if v28 == 1 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v26.kind = {
                    type = "comparison", 
                    value = v2.ComparisonCondition.decode(v30)
                };
            elseif v28 == 2 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v26.kind = {
                    type = "is_null", 
                    value = v2.IsNullCondition.decode(v30)
                };
            elseif v28 == 3 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v26.kind = {
                    type = "is_not_null", 
                    value = v2.IsNotNullCondition.decode(v30)
                };
            elseif v28 == 4 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v26.kind = {
                    type = "and_condition", 
                    value = v2.AndCondition.decode(v30)
                };
            elseif v28 == 5 then
                v30 = nil;
                v31, v32 = v0.readBuffer(v25, v27);
                v30 = v31;
                v27 = v32;
                v26.kind = {
                    type = "or_condition", 
                    value = v2.OrCondition.decode(v30)
                };
            else
                v30 = nil;
                v31, v32 = v0.readVarInt(v25, v27);
                v27 = v32 + v31;
            end;
        elseif v29 == v0.wireTypes.i32 then
            v30 = nil;
            v31, v32 = v0.readFixed32(v25, v27);
            v30 = v31;
            v27 = v32;
        elseif v29 == v0.wireTypes.i64 then
            v30 = nil;
            v31, v32 = v0.readFixed64(v25, v27);
            v30 = v31;
            v27 = v32;
        else
            error("Unsupported wire type: " .. v29);
        end;
    end;
    return v26;
end;
v3.jsonEncode = function(v33) --[[ Line: 285 ]] --[[ Name: jsonEncode ]]
    local v34 = {};
    if v33.kind ~= nil then
        if v33.kind.type == "comparison" then
            v34.comparison = v33.kind.value:jsonEncode();
            return v34;
        elseif v33.kind.type == "is_null" then
            v34.isNull = v33.kind.value:jsonEncode();
            return v34;
        elseif v33.kind.type == "is_not_null" then
            v34.isNotNull = v33.kind.value:jsonEncode();
            return v34;
        elseif v33.kind.type == "and_condition" then
            v34.andCondition = v33.kind.value:jsonEncode();
            return v34;
        elseif v33.kind.type == "or_condition" then
            v34.orCondition = v33.kind.value:jsonEncode();
        end;
    end;
    return v34;
end;
v3.jsonDecode = function(v35) --[[ Line: 305 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_0 (copy), v2 (copy)
    local v36 = l_v3_0.new();
    if v35.comparison ~= nil then
        v36.kind = {
            type = "comparison", 
            value = v2.ComparisonCondition.jsonDecode(v35.comparison)
        };
    end;
    if v35.is_null ~= nil then
        v36.kind = {
            type = "is_null", 
            value = v2.IsNullCondition.jsonDecode(v35.is_null)
        };
    end;
    if v35.isNull ~= nil then
        v36.kind = {
            type = "is_null", 
            value = v2.IsNullCondition.jsonDecode(v35.isNull)
        };
    end;
    if v35.is_not_null ~= nil then
        v36.kind = {
            type = "is_not_null", 
            value = v2.IsNotNullCondition.jsonDecode(v35.is_not_null)
        };
    end;
    if v35.isNotNull ~= nil then
        v36.kind = {
            type = "is_not_null", 
            value = v2.IsNotNullCondition.jsonDecode(v35.isNotNull)
        };
    end;
    if v35.and_condition ~= nil then
        v36.kind = {
            type = "and_condition", 
            value = v2.AndCondition.jsonDecode(v35.and_condition)
        };
    end;
    if v35.andCondition ~= nil then
        v36.kind = {
            type = "and_condition", 
            value = v2.AndCondition.jsonDecode(v35.andCondition)
        };
    end;
    if v35.or_condition ~= nil then
        v36.kind = {
            type = "or_condition", 
            value = v2.OrCondition.jsonDecode(v35.or_condition)
        };
    end;
    if v35.orCondition ~= nil then
        v36.kind = {
            type = "or_condition", 
            value = v2.OrCondition.jsonDecode(v35.orCondition)
        };
    end;
    return v36;
end;
v3.descriptor = {
    name = "PropCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.PropCondition"
};
v2.PropCondition = v3;
v1.default:register(v2.PropCondition);
v3 = {};
v3.__index = v3;
local l_v3_1 = v3 --[[ copy: 3 -> 5 ]];
v3.new = function(v38) --[[ Line: 361 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_v3_1 (copy)
    return (setmetatable({
        field = (not (v38 ~= nil) or v38.field == nil) and "" or v38.field, 
        op = if not (v38 ~= nil) or v38.op == nil then assert(v2.ComparisonCondition_Op.fromNumber(0), "Enum has no 0 default") else v38.op, 
        kind = if not (v38 ~= nil) or v38.kind == nil then nil else v38.kind
    }, l_v3_1));
end;
v3.encode = function(v39) --[[ Line: 371 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v40 = buffer.create(0);
    local v41 = 0;
    if v39.field ~= nil and v39.field ~= "" then
        local v42, v43 = v0.writeTag(v40, v41, 1, v0.wireTypes.lengthDelimited);
        v42, v43 = v0.writeString(v42, v43, v39.field);
        v40 = v42;
        v41 = v43;
    end;
    if v39.op ~= nil and (v39.op ~= nil and v39.op ~= 0 or v39.op ~= v2.ComparisonCondition_Op.fromNumber(0)) then
        local v44, v45 = v0.writeTag(v40, v41, 2, v0.wireTypes.varint);
        v44, v45 = v0.writeVarInt(v44, v45, v2.ComparisonCondition_Op.toNumber(v39.op));
        v40 = v44;
        v41 = v45;
    end;
    if v39.kind ~= nil then
        if v39.kind.type == "string_value" then
            local v46, v47 = v0.writeTag(v40, v41, 3, v0.wireTypes.lengthDelimited);
            v46, v47 = v0.writeString(v46, v47, v39.kind.value);
            v40 = v46;
            v41 = v47;
        elseif v39.kind.type == "bool_value" then
            local v48, v49 = v0.writeTag(v40, v41, 4, v0.wireTypes.varint);
            v48, v49 = v0.writeVarInt(v48, v49, v39.kind.value and 1 or 0);
            v40 = v48;
            v41 = v49;
        elseif v39.kind.type == "int32_value" then
            local v50, v51 = v0.writeTag(v40, v41, 5, v0.wireTypes.varint);
            v50, v51 = v0.writeVarInt(v50, v51, v39.kind.value);
            v40 = v50;
            v41 = v51;
        elseif v39.kind.type == "int64_value" then
            local v52, v53 = v0.writeTag(v40, v41, 6, v0.wireTypes.varint);
            v52, v53 = v0.writeVarInt(v52, v53, v39.kind.value);
            v40 = v52;
            v41 = v53;
        elseif v39.kind.type == "float_value" then
            local v54, v55 = v0.writeTag(v40, v41, 7, v0.wireTypes.i32);
            v54, v55 = v0.writeFloat(v54, v55, v39.kind.value);
            v40 = v54;
            v41 = v55;
        elseif v39.kind.type == "double_value" then
            local v56, v57 = v0.writeTag(v40, v41, 8, v0.wireTypes.i64);
            v56, v57 = v0.writeDouble(v56, v57, v39.kind.value);
            v40 = v56;
            v41 = v57;
        end;
    end;
    local v58 = buffer.create(v41);
    buffer.copy(v58, 0, v40, 0, v41);
    return v58;
end;
v3.decode = function(v59) --[[ Line: 415 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_1 (copy), v0 (copy), v2 (copy)
    local v60 = l_v3_1.new();
    local v61 = 0;
    while v61 < buffer.len(v59) do
        local v62 = nil;
        local v63 = nil;
        local v64, v65, v66 = v0.readTag(v59, v61);
        v62 = v64;
        v63 = v65;
        v61 = v66;
        if v63 == v0.wireTypes.varint then
            if v62 == 2 then
                v64 = nil;
                v65, v66 = v0.readVarIntI32(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.op = v2.ComparisonCondition_Op.fromNumber(v64) or v64;
            elseif v62 == 4 then
                v64 = nil;
                v65, v66 = v0.readVarInt(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "bool_value", 
                    value = v64 ~= 0
                };
            elseif v62 == 5 then
                v64 = nil;
                v65, v66 = v0.readVarIntI32(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "int32_value", 
                    value = v64
                };
            elseif v62 == 6 then
                v64 = nil;
                v65, v66 = v0.readVarIntI64(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "int64_value", 
                    value = v64
                };
            else
                v64 = nil;
                v65, v66 = v0.readVarInt(v59, v61);
                v64 = v65;
                v61 = v66;
            end;
        elseif v63 == v0.wireTypes.lengthDelimited then
            if v62 == 1 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.field = buffer.tostring(v64);
            elseif v62 == 3 then
                v64 = nil;
                v65, v66 = v0.readBuffer(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "string_value", 
                    value = buffer.tostring(v64)
                };
            else
                v64 = nil;
                v65, v66 = v0.readVarInt(v59, v61);
                v61 = v66 + v65;
            end;
        elseif v63 == v0.wireTypes.i32 then
            if v62 == 7 then
                v64 = nil;
                v65, v66 = v0.readFloat(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "float_value", 
                    value = v64
                };
            else
                v64 = nil;
                v65, v66 = v0.readFixed32(v59, v61);
                v64 = v65;
                v61 = v66;
            end;
        elseif v63 == v0.wireTypes.i64 then
            if v62 == 8 then
                v64 = nil;
                v65, v66 = v0.readDouble(v59, v61);
                v64 = v65;
                v61 = v66;
                v60.kind = {
                    type = "double_value", 
                    value = v64
                };
            else
                v64 = nil;
                v65, v66 = v0.readFixed64(v59, v61);
                v64 = v65;
                v61 = v66;
            end;
        else
            error("Unsupported wire type: " .. v63);
        end;
    end;
    return v60;
end;
v3.jsonEncode = function(v67) --[[ Line: 493 ]] --[[ Name: jsonEncode ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v68 = {};
    if v67.field ~= nil and v67.field ~= "" then
        v68.field = v67.field;
    end;
    if v67.op ~= nil and (v67.op ~= nil and v67.op ~= 0 or v67.op ~= v2.ComparisonCondition_Op.fromNumber(0)) then
        v68.op = if typeof(v67.op) == "number" then v67.op else v2.ComparisonCondition_Op.toNumber(v67.op);
    end;
    if v67.kind ~= nil then
        if v67.kind.type == "string_value" then
            v68.stringValue = v67.kind.value;
            return v68;
        elseif v67.kind.type == "bool_value" then
            v68.boolValue = v67.kind.value;
            return v68;
        elseif v67.kind.type == "int32_value" then
            v68.int32Value = v67.kind.value;
            return v68;
        elseif v67.kind.type == "int64_value" then
            v68.int64Value = v67.kind.value;
            return v68;
        elseif v67.kind.type == "float_value" then
            v68.floatValue = v0.json.serializeNumber(v67.kind.value);
            return v68;
        elseif v67.kind.type == "double_value" then
            v68.doubleValue = v0.json.serializeNumber(v67.kind.value);
        end;
    end;
    return v68;
end;
v3.jsonDecode = function(v69) --[[ Line: 528 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_1 (copy), v2 (copy), v0 (copy)
    local v70 = l_v3_1.new();
    if v69.field ~= nil then
        v70.field = v69.field;
    end;
    if v69.op ~= nil then
        v70.op = if typeof(v69.op) == "number" then v2.ComparisonCondition_Op.fromNumber(v69.op) or v69.op else v2.ComparisonCondition_Op.fromName(v69.op) or v69.op;
    end;
    if v69.string_value ~= nil then
        v70.kind = {
            type = "string_value", 
            value = v69.string_value
        };
    end;
    if v69.stringValue ~= nil then
        v70.kind = {
            type = "string_value", 
            value = v69.stringValue
        };
    end;
    if v69.bool_value ~= nil then
        v70.kind = {
            type = "bool_value", 
            value = v69.bool_value
        };
    end;
    if v69.boolValue ~= nil then
        v70.kind = {
            type = "bool_value", 
            value = v69.boolValue
        };
    end;
    if v69.int32_value ~= nil then
        v70.kind = {
            type = "int32_value", 
            value = v69.int32_value
        };
    end;
    if v69.int32Value ~= nil then
        v70.kind = {
            type = "int32_value", 
            value = v69.int32Value
        };
    end;
    if v69.int64_value ~= nil then
        v70.kind = {
            type = "int64_value", 
            value = v69.int64_value
        };
    end;
    if v69.int64Value ~= nil then
        v70.kind = {
            type = "int64_value", 
            value = v69.int64Value
        };
    end;
    if v69.float_value ~= nil then
        v70.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v69.float_value)
        };
    end;
    if v69.floatValue ~= nil then
        v70.kind = {
            type = "float_value", 
            value = v0.json.deserializeNumber(v69.floatValue)
        };
    end;
    if v69.double_value ~= nil then
        v70.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v69.double_value)
        };
    end;
    if v69.doubleValue ~= nil then
        v70.kind = {
            type = "double_value", 
            value = v0.json.deserializeNumber(v69.doubleValue)
        };
    end;
    return v70;
end;
v3.descriptor = {
    name = "ComparisonCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.ComparisonCondition"
};
v2.ComparisonCondition = v3;
v1.default:register(v2.ComparisonCondition);
v2.ComparisonCondition_Op = {
    fromNumber = function(v71) --[[ Line: 603 ]] --[[ Name: fromNumber ]]
        if v71 == 0 then
            return "OP_INVALID";
        elseif v71 == 1 then
            return "OP_LT";
        elseif v71 == 2 then
            return "OP_LTE";
        elseif v71 == 3 then
            return "OP_GT";
        elseif v71 == 4 then
            return "OP_GTE";
        elseif v71 == 5 then
            return "OP_E";
        elseif v71 == 6 then
            return "OP_NE";
        else
            return nil;
        end;
    end, 
    toNumber = function(v72) --[[ Line: 623 ]] --[[ Name: toNumber ]]
        if v72 == "OP_INVALID" then
            return 0;
        elseif v72 == "OP_LT" then
            return 1;
        elseif v72 == "OP_LTE" then
            return 2;
        elseif v72 == "OP_GT" then
            return 3;
        elseif v72 == "OP_GTE" then
            return 4;
        elseif v72 == "OP_E" then
            return 5;
        elseif v72 == "OP_NE" then
            return 6;
        else
            return v72;
        end;
    end, 
    fromName = function(v73) --[[ Line: 643 ]] --[[ Name: fromName ]]
        if v73 == "OP_INVALID" then
            return "OP_INVALID";
        elseif v73 == "OP_LT" then
            return "OP_LT";
        elseif v73 == "OP_LTE" then
            return "OP_LTE";
        elseif v73 == "OP_GT" then
            return "OP_GT";
        elseif v73 == "OP_GTE" then
            return "OP_GTE";
        elseif v73 == "OP_E" then
            return "OP_E";
        elseif v73 == "OP_NE" then
            return "OP_NE";
        else
            return nil;
        end;
    end
};
v3 = {};
v3.__index = v3;
local l_v3_2 = v3 --[[ copy: 3 -> 6 ]];
v3.new = function(v75) --[[ Line: 668 ]] --[[ Name: new ]]
    -- upvalues: l_v3_2 (copy)
    return (setmetatable({
        field = (not (v75 ~= nil) or v75.field == nil) and "" or v75.field
    }, l_v3_2));
end;
v3.encode = function(v76) --[[ Line: 674 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v77 = buffer.create(0);
    local v78 = 0;
    if v76.field ~= nil and v76.field ~= "" then
        local v79, v80 = v0.writeTag(v77, v78, 1, v0.wireTypes.lengthDelimited);
        v79, v80 = v0.writeString(v79, v80, v76.field);
        v77 = v79;
        v78 = v80;
    end;
    local v81 = buffer.create(v78);
    buffer.copy(v81, 0, v77, 0, v78);
    return v81;
end;
v3.decode = function(v82) --[[ Line: 688 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_2 (copy), v0 (copy)
    local v83 = l_v3_2.new();
    local v84 = 0;
    while v84 < buffer.len(v82) do
        local v85 = nil;
        local v86 = nil;
        local v87, v88, v89 = v0.readTag(v82, v84);
        v85 = v87;
        v86 = v88;
        v84 = v89;
        if v86 == v0.wireTypes.varint then
            v87 = nil;
            v88, v89 = v0.readVarInt(v82, v84);
            v87 = v88;
            v84 = v89;
        elseif v86 == v0.wireTypes.lengthDelimited then
            if v85 == 1 then
                v87 = nil;
                v88, v89 = v0.readBuffer(v82, v84);
                v87 = v88;
                v84 = v89;
                v83.field = buffer.tostring(v87);
            else
                v87 = nil;
                v88, v89 = v0.readVarInt(v82, v84);
                v84 = v89 + v88;
            end;
        elseif v86 == v0.wireTypes.i32 then
            v87 = nil;
            v88, v89 = v0.readFixed32(v82, v84);
            v87 = v88;
            v84 = v89;
        elseif v86 == v0.wireTypes.i64 then
            v87 = nil;
            v88, v89 = v0.readFixed64(v82, v84);
            v87 = v88;
            v84 = v89;
        else
            error("Unsupported wire type: " .. v86);
        end;
    end;
    return v83;
end;
v3.jsonEncode = function(v90) --[[ Line: 731 ]] --[[ Name: jsonEncode ]]
    local v91 = {};
    if v90.field ~= nil and v90.field ~= "" then
        v91.field = v90.field;
    end;
    return v91;
end;
v3.jsonDecode = function(v92) --[[ Line: 741 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_2 (copy)
    local v93 = l_v3_2.new();
    if v92.field ~= nil then
        v93.field = v92.field;
    end;
    return v93;
end;
v3.descriptor = {
    name = "IsNullCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IsNullCondition"
};
v2.IsNullCondition = v3;
v1.default:register(v2.IsNullCondition);
v3 = {};
v3.__index = v3;
local l_v3_3 = v3 --[[ copy: 3 -> 7 ]];
v3.new = function(v95) --[[ Line: 765 ]] --[[ Name: new ]]
    -- upvalues: l_v3_3 (copy)
    return (setmetatable({
        field = (not (v95 ~= nil) or v95.field == nil) and "" or v95.field
    }, l_v3_3));
end;
v3.encode = function(v96) --[[ Line: 771 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v97 = buffer.create(0);
    local v98 = 0;
    if v96.field ~= nil and v96.field ~= "" then
        local v99, v100 = v0.writeTag(v97, v98, 1, v0.wireTypes.lengthDelimited);
        v99, v100 = v0.writeString(v99, v100, v96.field);
        v97 = v99;
        v98 = v100;
    end;
    local v101 = buffer.create(v98);
    buffer.copy(v101, 0, v97, 0, v98);
    return v101;
end;
v3.decode = function(v102) --[[ Line: 785 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_3 (copy), v0 (copy)
    local v103 = l_v3_3.new();
    local v104 = 0;
    while v104 < buffer.len(v102) do
        local v105 = nil;
        local v106 = nil;
        local v107, v108, v109 = v0.readTag(v102, v104);
        v105 = v107;
        v106 = v108;
        v104 = v109;
        if v106 == v0.wireTypes.varint then
            v107 = nil;
            v108, v109 = v0.readVarInt(v102, v104);
            v107 = v108;
            v104 = v109;
        elseif v106 == v0.wireTypes.lengthDelimited then
            if v105 == 1 then
                v107 = nil;
                v108, v109 = v0.readBuffer(v102, v104);
                v107 = v108;
                v104 = v109;
                v103.field = buffer.tostring(v107);
            else
                v107 = nil;
                v108, v109 = v0.readVarInt(v102, v104);
                v104 = v109 + v108;
            end;
        elseif v106 == v0.wireTypes.i32 then
            v107 = nil;
            v108, v109 = v0.readFixed32(v102, v104);
            v107 = v108;
            v104 = v109;
        elseif v106 == v0.wireTypes.i64 then
            v107 = nil;
            v108, v109 = v0.readFixed64(v102, v104);
            v107 = v108;
            v104 = v109;
        else
            error("Unsupported wire type: " .. v106);
        end;
    end;
    return v103;
end;
v3.jsonEncode = function(v110) --[[ Line: 828 ]] --[[ Name: jsonEncode ]]
    local v111 = {};
    if v110.field ~= nil and v110.field ~= "" then
        v111.field = v110.field;
    end;
    return v111;
end;
v3.jsonDecode = function(v112) --[[ Line: 838 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_3 (copy)
    local v113 = l_v3_3.new();
    if v112.field ~= nil then
        v113.field = v112.field;
    end;
    return v113;
end;
v3.descriptor = {
    name = "IsNotNullCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.IsNotNullCondition"
};
v2.IsNotNullCondition = v3;
v1.default:register(v2.IsNotNullCondition);
v3 = {};
v3.__index = v3;
local l_v3_4 = v3 --[[ copy: 3 -> 8 ]];
v3.new = function(v115) --[[ Line: 862 ]] --[[ Name: new ]]
    -- upvalues: l_v3_4 (copy)
    return (setmetatable({
        conditions = if not (v115 ~= nil) or v115.conditions == nil then {} else v115.conditions
    }, l_v3_4));
end;
v3.encode = function(v116) --[[ Line: 868 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v117 = buffer.create(0);
    local v118 = 0;
    if v116.conditions ~= nil and #v116.conditions > 0 then
        for _, v120 in v116.conditions do
            local v121 = v120:encode();
            local v122, v123 = v0.writeTag(v117, v118, 1, v0.wireTypes.lengthDelimited);
            v122, v123 = v0.writeBuffer(v122, v123, v121, buffer.len(v121));
            v117 = v122;
            v118 = v123;
        end;
    end;
    local v124 = buffer.create(v118);
    buffer.copy(v124, 0, v117, 0, v118);
    return v124;
end;
v3.decode = function(v125) --[[ Line: 885 ]] --[[ Name: decode ]]
    -- upvalues: l_v3_4 (copy), v0 (copy), v2 (copy)
    local v126 = l_v3_4.new();
    local v127 = 0;
    while v127 < buffer.len(v125) do
        local v128 = nil;
        local v129 = nil;
        local v130, v131, v132 = v0.readTag(v125, v127);
        v128 = v130;
        v129 = v131;
        v127 = v132;
        if v129 == v0.wireTypes.varint then
            v130 = nil;
            v131, v132 = v0.readVarInt(v125, v127);
            v130 = v131;
            v127 = v132;
        elseif v129 == v0.wireTypes.lengthDelimited then
            if v128 == 1 then
                v130 = nil;
                v131, v132 = v0.readBuffer(v125, v127);
                v130 = v131;
                v127 = v132;
                table.insert(v126.conditions, v2.PropCondition.decode(v130));
            else
                v130 = nil;
                v131, v132 = v0.readVarInt(v125, v127);
                v127 = v132 + v131;
            end;
        elseif v129 == v0.wireTypes.i32 then
            v130 = nil;
            v131, v132 = v0.readFixed32(v125, v127);
            v130 = v131;
            v127 = v132;
        elseif v129 == v0.wireTypes.i64 then
            v130 = nil;
            v131, v132 = v0.readFixed64(v125, v127);
            v130 = v131;
            v127 = v132;
        else
            error("Unsupported wire type: " .. v129);
        end;
    end;
    return v126;
end;
v3.jsonEncode = function(v133) --[[ Line: 928 ]] --[[ Name: jsonEncode ]]
    local v134 = {};
    if v133.conditions ~= nil and #v133.conditions > 0 then
        local v135 = {};
        for _, v137 in v133.conditions do
            table.insert(v135, v137:jsonEncode());
        end;
        v134.conditions = v135;
    end;
    return v134;
end;
v3.jsonDecode = function(v138) --[[ Line: 942 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v3_4 (copy), v2 (copy)
    local v139 = l_v3_4.new();
    if v138.conditions ~= nil then
        local v140 = {};
        for _, v142 in v138.conditions do
            table.insert(v140, v2.PropCondition.jsonDecode(v142));
        end;
        v139.conditions = v140;
    end;
    return v139;
end;
v3.descriptor = {
    name = "AndCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AndCondition"
};
v2.AndCondition = v3;
v1.default:register(v2.AndCondition);
v3 = {};
v3.__index = v3;
v3.new = function(v143) --[[ Line: 971 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        conditions = if not (v143 ~= nil) or v143.conditions == nil then {} else v143.conditions
    }, v3));
end;
v3.encode = function(v144) --[[ Line: 977 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v145 = buffer.create(0);
    local v146 = 0;
    if v144.conditions ~= nil and #v144.conditions > 0 then
        for _, v148 in v144.conditions do
            local v149 = v148:encode();
            local v150, v151 = v0.writeTag(v145, v146, 1, v0.wireTypes.lengthDelimited);
            v150, v151 = v0.writeBuffer(v150, v151, v149, buffer.len(v149));
            v145 = v150;
            v146 = v151;
        end;
    end;
    local v152 = buffer.create(v146);
    buffer.copy(v152, 0, v145, 0, v146);
    return v152;
end;
v3.decode = function(v153) --[[ Line: 994 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy), v2 (copy)
    local v154 = v3.new();
    local v155 = 0;
    while v155 < buffer.len(v153) do
        local v156 = nil;
        local v157 = nil;
        local v158, v159, v160 = v0.readTag(v153, v155);
        v156 = v158;
        v157 = v159;
        v155 = v160;
        if v157 == v0.wireTypes.varint then
            v158 = nil;
            v159, v160 = v0.readVarInt(v153, v155);
            v158 = v159;
            v155 = v160;
        elseif v157 == v0.wireTypes.lengthDelimited then
            if v156 == 1 then
                v158 = nil;
                v159, v160 = v0.readBuffer(v153, v155);
                v158 = v159;
                v155 = v160;
                table.insert(v154.conditions, v2.PropCondition.decode(v158));
            else
                v158 = nil;
                v159, v160 = v0.readVarInt(v153, v155);
                v155 = v160 + v159;
            end;
        elseif v157 == v0.wireTypes.i32 then
            v158 = nil;
            v159, v160 = v0.readFixed32(v153, v155);
            v158 = v159;
            v155 = v160;
        elseif v157 == v0.wireTypes.i64 then
            v158 = nil;
            v159, v160 = v0.readFixed64(v153, v155);
            v158 = v159;
            v155 = v160;
        else
            error("Unsupported wire type: " .. v157);
        end;
    end;
    return v154;
end;
v3.jsonEncode = function(v161) --[[ Line: 1037 ]] --[[ Name: jsonEncode ]]
    local v162 = {};
    if v161.conditions ~= nil and #v161.conditions > 0 then
        local v163 = {};
        for _, v165 in v161.conditions do
            table.insert(v163, v165:jsonEncode());
        end;
        v162.conditions = v163;
    end;
    return v162;
end;
v3.jsonDecode = function(v166) --[[ Line: 1051 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v167 = v3.new();
    if v166.conditions ~= nil then
        local v168 = {};
        for _, v170 in v166.conditions do
            table.insert(v168, v2.PropCondition.jsonDecode(v170));
        end;
        v167.conditions = v168;
    end;
    return v167;
end;
v3.descriptor = {
    name = "OrCondition", 
    fullName = "roblox.apppageplatform.shared.v1beta1.OrCondition"
};
v2.OrCondition = v3;
v1.default:register(v2.OrCondition);
return {
    PropCondition = v2.PropCondition, 
    ComparisonCondition = v2.ComparisonCondition, 
    ComparisonCondition_Op = v2.ComparisonCondition_Op, 
    IsNullCondition = v2.IsNullCondition, 
    IsNotNullCondition = v2.IsNotNullCondition, 
    AndCondition = v2.AndCondition, 
    OrCondition = v2.OrCondition
};