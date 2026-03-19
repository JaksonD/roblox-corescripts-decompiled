local function _(v0, v1) --[[ Line: 8 ]] --[[ Name: parseInt ]]
    return (tonumber(v0, v1));
end;
local function _(v3) --[[ Line: 11 ]] --[[ Name: NumberisFinite ]]
    local v4 = false;
    if typeof(v3) == "number" then
        v4 = false;
        if v3 ~= 1e999 then
            v4 = v3 == v3;
        end;
    end;
    return v4;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v7.Array;
local l_Number_0 = v7.Number;
local l_Object_0 = v7.Object;
local _ = require(script.Parent.Parent.language.ast);
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_isObjectLike_0 = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike;
local l_Kind_0 = require(script.Parent.Parent.language.kinds).Kind;
local l_print_0 = require(script.Parent.Parent.language.printer).print;
local l_GraphQLError_0 = require(script.Parent.Parent.error.GraphQLError).GraphQLError;
local l_GraphQLScalarType_0 = require(script.Parent.definition).GraphQLScalarType;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local _ = nil;
serializeInt = function(v24) --[[ Line: 55 ]] --[[ Name: serializeInt ]]
    -- upvalues: v18 (ref), l_Number_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v25 = v18(v24);
    if typeof(v25) == "boolean" then
        if v25 then
            return 1;
        else
            return 0;
        end;
    else
        local l_v25_0 = v25;
        if typeof(v25) == "string" and v25 ~= "" then
            l_v25_0 = tonumber(v25);
        end;
        if typeof(l_v25_0) ~= "number" or not l_Number_0.isInteger(l_v25_0) then
            error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_inspect_0(v25))));
        end;
        if l_v25_0 > 2147483647 or l_v25_0 < -2147483648 then
            error(l_GraphQLError_0.new("Int cannot represent non 32-bit signed integer value: " .. l_inspect_0(v25)));
        end;
        return l_v25_0;
    end;
end;
coerceInt = function(v27) --[[ Line: 84 ]] --[[ Name: coerceInt ]]
    -- upvalues: l_Number_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    if typeof(v27) ~= "number" or not l_Number_0.isInteger(v27) then
        error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_inspect_0(v27))));
    end;
    if v27 > 2147483647 or v27 < -2147483648 then
        error(l_GraphQLError_0.new(("Int cannot represent non 32-bit signed integer value: %s"):format(v27)));
    end;
    return v27;
end;
local v30 = l_GraphQLScalarType_0.new({
    name = "Int", 
    description = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.", 
    serialize = serializeInt, 
    parseValue = coerceInt, 
    parseLiteral = function(v28) --[[ Line: 110 ]] --[[ Name: parseLiteral ]]
        -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy)
        if v28.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new(("Int cannot represent non-integer value: %s"):format(l_print_0(v28)), v28));
        end;
        local v29 = tonumber(v28.value, 10);
        if v29 > 2147483647 or v29 < -2147483648 then
            error(l_GraphQLError_0.new(("Int cannot represent non 32-bit signed integer value: %s"):format(v28.value), v28));
        end;
        return v29;
    end
});
v20 = function(v31) --[[ Line: 139 ]] --[[ Name: serializeFloat ]]
    -- upvalues: v18 (ref), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v32 = false;
    local v33 = v18(v31);
    if typeof(v33) == "boolean" then
        if v33 then
            return 1;
        else
            return 0;
        end;
    else
        local l_v33_0 = v33;
        if typeof(v33) == "string" and v33 ~= "" then
            l_v33_0 = tonumber(v33);
        end;
        if typeof(l_v33_0) == "number" then
            local l_l_v33_0_0 = l_v33_0;
            local v36 = false;
            if typeof(l_l_v33_0_0) == "number" then
                v36 = false;
                if l_l_v33_0_0 ~= 1e999 then
                    v36 = l_l_v33_0_0 == l_l_v33_0_0;
                end;
            end;
            v32 = v36;
        end;
        if not v32 then
            error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_inspect_0(v33))));
        end;
        v32 = false;
        return l_v33_0;
    end;
end;
coerceFloat = function(v37) --[[ Line: 161 ]] --[[ Name: coerceFloat ]]
    -- upvalues: l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v38 = false;
    if typeof(v37) == "number" then
        local v39 = false;
        if typeof(v37) == "number" then
            v39 = false;
            if v37 ~= 1e999 then
                v39 = v37 == v37;
            end;
        end;
        v38 = v39;
    end;
    if not v38 then
        error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_inspect_0(v37))));
    end;
    v38 = false;
    return v37;
end;
local v41 = l_GraphQLScalarType_0.new({
    name = "Float", 
    description = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).", 
    serialize = v20, 
    parseValue = coerceFloat, 
    parseLiteral = function(v40) --[[ Line: 178 ]] --[[ Name: parseLiteral ]]
        -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy)
        if v40.kind ~= l_Kind_0.FLOAT and v40.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new(("Float cannot represent non numeric value: %s"):format(l_print_0(v40)), v40));
        end;
        return (tonumber(v40.value, nil));
    end
});
v18 = function(v42) --[[ Line: 197 ]] --[[ Name: serializeObject ]]
    -- upvalues: l_isObjectLike_0 (copy)
    if l_isObjectLike_0(v42) then
        if typeof(v42.valueOf) == "function" then
            local v43 = v42:valueOf();
            if not l_isObjectLike_0(v43) then
                return v43;
            end;
        end;
        if typeof(v42.toJSON) == "function" then
            return v42:toJSON();
        end;
    end;
    return v42;
end;
v22 = function(v44) --[[ Line: 214 ]] --[[ Name: serializeString ]]
    -- upvalues: v18 (ref), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v45 = v18(v44);
    if typeof(v45) == "string" then
        return v45;
    elseif typeof(v45) == "boolean" then
        if v45 then
            return "true";
        else
            return "false";
        end;
    else
        if typeof(v45) == "number" then
            local v46 = false;
            if typeof(v45) == "number" then
                v46 = false;
                if v45 ~= 1e999 then
                    v46 = v45 == v45;
                end;
            end;
            if v46 then
                return (tostring(v45));
            end;
        end;
        error(l_GraphQLError_0.new(("String cannot represent value: %s"):format(l_inspect_0(v44))));
        return;
    end;
end;
coerceString = function(v47) --[[ Line: 231 ]] --[[ Name: coerceString ]]
    -- upvalues: l_GraphQLError_0 (copy), l_inspect_0 (copy)
    if typeof(v47) ~= "string" then
        error(l_GraphQLError_0.new(("String cannot represent a non string value: %s"):format(l_inspect_0(v47))));
    end;
    return v47;
end;
local v49 = l_GraphQLScalarType_0.new({
    name = "String", 
    description = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.", 
    serialize = v22, 
    parseValue = coerceString, 
    parseLiteral = function(v48) --[[ Line: 248 ]] --[[ Name: parseLiteral ]]
        -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy)
        if v48.kind ~= l_Kind_0.STRING then
            error(l_GraphQLError_0.new(("String cannot represent a non string value: %s"):format(l_print_0(v48)), v48));
        end;
        return v48.value;
    end
});
v21 = function(v50) --[[ Line: 263 ]] --[[ Name: serializeBoolean ]]
    -- upvalues: v18 (ref), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v51 = v18(v50);
    if typeof(v51) == "boolean" then
        return v51;
    else
        local v52 = false;
        if typeof(v51) == "number" then
            v52 = false;
            if v51 ~= 1e999 then
                v52 = v51 == v51;
            end;
        end;
        if v52 then
            return v51 ~= 0;
        else
            error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_inspect_0(v51))));
            return;
        end;
    end;
end;
coerceBoolean = function(v53) --[[ Line: 281 ]] --[[ Name: coerceBoolean ]]
    -- upvalues: l_GraphQLError_0 (copy), l_inspect_0 (copy)
    if typeof(v53) ~= "boolean" then
        error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_inspect_0(v53))));
    end;
    return v53;
end;
local v55 = l_GraphQLScalarType_0.new({
    name = "Boolean", 
    description = "The `Boolean` scalar type represents `true` or `false`.", 
    serialize = v21, 
    parseValue = coerceBoolean, 
    parseLiteral = function(v54) --[[ Line: 298 ]] --[[ Name: parseLiteral ]]
        -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy)
        if v54.kind ~= l_Kind_0.BOOLEAN then
            error(l_GraphQLError_0.new(("Boolean cannot represent a non boolean value: %s"):format(l_print_0(v54)), v54));
        end;
        return v54.value;
    end
});
v19 = function(v56) --[[ Line: 313 ]] --[[ Name: serializeID ]]
    -- upvalues: v18 (ref), l_Number_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v57 = v18(v56);
    if typeof(v57) == "string" then
        return v57;
    elseif l_Number_0.isInteger(v57) then
        return (tostring(v57));
    else
        error(l_GraphQLError_0.new(("ID cannot represent value: %s"):format(l_inspect_0(v56))));
        return;
    end;
end;
coerceID = function(v58) --[[ Line: 326 ]] --[[ Name: coerceID ]]
    -- upvalues: l_Number_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    if typeof(v58) == "string" then
        return v58;
    elseif typeof(v58) == "number" and l_Number_0.isInteger(v58) then
        return (tostring(v58));
    else
        error(l_GraphQLError_0.new(("ID cannot represent value: %s"):format(l_inspect_0(v58))));
        return;
    end;
end;
local v60 = l_GraphQLScalarType_0.new({
    name = "ID", 
    description = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.", 
    serialize = v19, 
    parseValue = coerceID, 
    parseLiteral = function(v59) --[[ Line: 342 ]] --[[ Name: parseLiteral ]]
        -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy)
        if v59.kind ~= l_Kind_0.STRING and v59.kind ~= l_Kind_0.INT then
            error(l_GraphQLError_0.new("ID cannot represent a non-string and non-integer value: " .. l_print_0(v59), v59));
        end;
        return v59.value;
    end
});
local v61 = l_Object_0.freeze({
    v49, 
    v30, 
    v41, 
    v55, 
    v60
});
return {
    GraphQLInt = v30, 
    GraphQLFloat = v41, 
    GraphQLString = v49, 
    GraphQLBoolean = v55, 
    GraphQLID = v60, 
    specifiedScalarTypes = v61, 
    isSpecifiedScalarType = function(v62) --[[ Line: 364 ]] --[[ Name: isSpecifiedScalarType ]]
        -- upvalues: l_Array_0 (copy), v61 (copy)
        return l_Array_0.some(v61, function(v63) --[[ Line: 365 ]]
            -- upvalues: v62 (copy)
            return v63.name == v62.name;
        end);
    end
};