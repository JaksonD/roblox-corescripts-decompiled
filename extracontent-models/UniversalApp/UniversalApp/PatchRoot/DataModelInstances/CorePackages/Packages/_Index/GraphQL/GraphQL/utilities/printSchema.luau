local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_invariant_0 = require(script.Parent.Parent.jsutils.invariant).invariant;
local l_print_0 = require(script.Parent.Parent.language.printer).print;
local l_printBlockString_0 = require(script.Parent.Parent.language.blockString).printBlockString;
local l_isIntrospectionType_0 = require(script.Parent.Parent.type.introspection).isIntrospectionType;
local l_GraphQLString_0 = require(script.Parent.Parent.type.scalars).GraphQLString;
local l_isSpecifiedScalarType_0 = require(script.Parent.Parent.type.scalars).isSpecifiedScalarType;
local v11 = require(script.Parent.Parent.type.directives);
local l_DEFAULT_DEPRECATION_REASON_0 = v11.DEFAULT_DEPRECATION_REASON;
local l_isSpecifiedDirective_0 = v11.isSpecifiedDirective;
local v14 = require(script.Parent.Parent.type.definition);
local l_isScalarType_0 = v14.isScalarType;
local l_isObjectType_0 = v14.isObjectType;
local l_isInterfaceType_0 = v14.isInterfaceType;
local l_isUnionType_0 = v14.isUnionType;
local l_isEnumType_0 = v14.isEnumType;
local l_isInputObjectType_0 = v14.isInputObjectType;
local _ = require(script.Parent.Parent.type.schema);
local _ = require(script.Parent.Parent.language.ast);
local l_astFromValue_0 = require(script.Parent.astFromValue).astFromValue;
local l_NULL_0 = require(script.Parent.astFromValue).NULL;
local v25 = require(script.Parent.Parent.luaUtils.isNillish);
local l_isNillish_0 = v25.isNillish;
local l_isNotNillish_0 = v25.isNotNillish;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local function v49(v47) --[[ Line: 76 ]] --[[ Name: printSchema ]]
    -- upvalues: v30 (ref), l_isSpecifiedDirective_0 (copy), v31 (ref)
    return v30(v47, function(v48) --[[ Line: 77 ]]
        -- upvalues: l_isSpecifiedDirective_0 (ref)
        return not l_isSpecifiedDirective_0(v48);
    end, v31);
end;
local function v51(v50) --[[ Line: 82 ]] --[[ Name: printIntrospectionSchema ]]
    -- upvalues: v30 (ref), l_isSpecifiedDirective_0 (copy), l_isIntrospectionType_0 (copy)
    return v30(v50, l_isSpecifiedDirective_0, l_isIntrospectionType_0);
end;
v31 = function(v52) --[[ Line: 86 ]] --[[ Name: isDefinedType ]]
    -- upvalues: l_isSpecifiedScalarType_0 (copy), l_isIntrospectionType_0 (copy)
    return not l_isSpecifiedScalarType_0(v52) and not l_isIntrospectionType_0(v52);
end;
v30 = function(v53, v54, v55) --[[ Line: 90 ]] --[[ Name: printFilteredSchema ]]
    -- upvalues: l_Array_0 (copy), v32 (ref), v33 (ref), v34 (ref), l_Boolean_0 (copy)
    local v56 = l_Array_0.filter(v53:getDirectives(), v54);
    local v57 = l_Array_0.filter(v53:getTypeMap():values(), v55);
    local v60 = l_Array_0.concat({
        v32(v53)
    }, l_Array_0.map(v56, function(v58) --[[ Line: 103 ]]
        -- upvalues: v33 (ref)
        return v33(v58);
    end), l_Array_0.map(v57, function(v59) --[[ Line: 106 ]]
        -- upvalues: v34 (ref)
        return v34(v59);
    end));
    local v62 = l_Array_0.filter(v60, function(v61) --[[ Line: 111 ]]
        -- upvalues: l_Boolean_0 (ref)
        return l_Boolean_0.toJSBoolean(v61);
    end);
    return l_Array_0.join(v62, "\n\n") .. "\n";
end;
v32 = function(v63) --[[ Line: 118 ]] --[[ Name: printSchemaDefinition ]]
    -- upvalues: l_isNillish_0 (copy), v35 (ref), l_isNotNillish_0 (copy), v29 (ref), l_Array_0 (copy)
    if l_isNillish_0(v63.description) and v35(v63) then
        return;
    else
        local v64 = {};
        local v65 = v63:getQueryType();
        if l_isNotNillish_0(v65) then
            table.insert(v64, ("  query: %s"):format(v65.name));
        end;
        local v66 = v63:getMutationType();
        if l_isNotNillish_0(v66) then
            table.insert(v64, ("  mutation: %s"):format(v66.name));
        end;
        local v67 = v63:getSubscriptionType();
        if l_isNotNillish_0(v67) then
            table.insert(v64, ("  subscription: %s"):format(v67.name));
        end;
        return v29(v63) .. ("schema {\n%s\n}"):format(l_Array_0.join(v64, "\n"));
    end;
end;
v35 = function(v68) --[[ Line: 164 ]] --[[ Name: isSchemaOfCommonNames ]]
    -- upvalues: l_isNotNillish_0 (copy)
    local v69 = v68:getQueryType();
    if l_isNotNillish_0(v69) and v69.name ~= "Query" then
        return false;
    else
        local v70 = v68:getMutationType();
        if l_isNotNillish_0(v70) and v70.name ~= "Mutation" then
            return false;
        else
            local v71 = v68:getSubscriptionType();
            if l_isNotNillish_0(v71) and v71.name ~= "Subscription" then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v34 = function(v72) --[[ Line: 190 ]] --[[ Name: printType ]]
    -- upvalues: l_isScalarType_0 (copy), v28 (ref), l_isObjectType_0 (copy), v36 (ref), l_isInterfaceType_0 (copy), v41 (ref), l_isUnionType_0 (copy), v42 (ref), l_isEnumType_0 (copy), v43 (ref), l_isInputObjectType_0 (copy), v44 (ref), l_invariant_0 (copy), l_inspect_0 (copy)
    if l_isScalarType_0(v72) then
        return v28(v72);
    elseif l_isObjectType_0(v72) then
        return v36(v72);
    elseif l_isInterfaceType_0(v72) then
        return v41(v72);
    elseif l_isUnionType_0(v72) then
        return v42(v72);
    elseif l_isEnumType_0(v72) then
        return v43(v72);
    elseif l_isInputObjectType_0(v72) then
        return v44(v72);
    else
        l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v72));
        return "";
    end;
end;
v28 = function(v73) --[[ Line: 218 ]] --[[ Name: printScalar ]]
    -- upvalues: v29 (ref), v45 (ref)
    return v29(v73) .. ("scalar %s"):format(v73.name) .. v45(v73);
end;
local function v77(v74) --[[ Line: 222 ]] --[[ Name: printImplementedInterfaces ]]
    -- upvalues: l_Array_0 (copy)
    local v75 = v74:getInterfaces();
    if #v75 > 0 then
        return " implements " .. l_Array_0.join(l_Array_0.map(v75, function(v76) --[[ Line: 230 ]]
            return v76.name;
        end), " & ");
    else
        return "";
    end;
end;
v36 = function(v78) --[[ Line: 238 ]] --[[ Name: printObject ]]
    -- upvalues: v29 (ref), v77 (copy), v46 (ref)
    return v29(v78) .. ("type %s"):format(v78.name) .. v77(v78) .. v46(v78);
end;
v41 = function(v79) --[[ Line: 245 ]] --[[ Name: printInterface ]]
    -- upvalues: v29 (ref), v77 (copy), v46 (ref)
    return v29(v79) .. ("interface %s"):format(v79.name) .. v77(v79) .. v46(v79);
end;
v42 = function(v80) --[[ Line: 252 ]] --[[ Name: printUnion ]]
    -- upvalues: l_Array_0 (copy), v29 (ref)
    local v81 = v80:getTypes();
    local v82 = if #v81 > 0 then " = " .. l_Array_0.join(v81, " | ") else "";
    return v29(v80) .. "union " .. v80.name .. v82;
end;
v43 = function(v83) --[[ Line: 259 ]] --[[ Name: printEnum ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v39 (ref), v40 (ref)
    local v86 = l_Array_0.map(v83:getValues(), function(v84, v85) --[[ Line: 261 ]]
        -- upvalues: v29 (ref), v39 (ref)
        return v29(v84, "  ", v85 == 1) .. "  " .. v84.name .. v39(v84.deprecationReason);
    end);
    return v29(v83) .. ("enum %s"):format(v83.name) .. v40(v86);
end;
v44 = function(v87) --[[ Line: 271 ]] --[[ Name: printInputObject ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v38 (ref), v40 (ref)
    local v90 = l_Array_0.map(v87:getFields():values(), function(v88, v89) --[[ Line: 274 ]]
        -- upvalues: v29 (ref), v38 (ref)
        return v29(v88, "  ", v89 == 1) .. "  " .. v38(v88);
    end);
    return v29(v87) .. ("input %s"):format(v87.name) .. v40(v90);
end;
v46 = function(v91) --[[ Line: 281 ]] --[[ Name: printFields ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v37 (ref), v39 (ref), v40 (ref)
    local v94 = l_Array_0.map(v91:getFields():values(), function(v92, v93) --[[ Line: 287 ]]
        -- upvalues: v29 (ref), v37 (ref), v39 (ref)
        return v29(v92, "  ", v93 == 1) .. "  " .. v92.name .. v37(v92.args, "  ") .. ": " .. tostring(v92.type) .. v39(v92.deprecationReason);
    end);
    return v40(v94);
end;
v40 = function(v95) --[[ Line: 301 ]] --[[ Name: printBlock ]]
    -- upvalues: l_Array_0 (copy)
    if #v95 ~= 0 then
        return " {\n" .. l_Array_0.join(v95, "\n") .. "\n}";
    else
        return "";
    end;
end;
v37 = function(v96, v97) --[[ Line: 305 ]] --[[ Name: printArgs ]]
    -- upvalues: l_Array_0 (copy), l_isNillish_0 (copy), v38 (ref), v29 (ref)
    local v98 = if v97 ~= nil then v97 else "";
    if #v96 == 0 then
        return "";
    elseif l_Array_0.every(v96, function(v99) --[[ Line: 314 ]]
        -- upvalues: l_isNillish_0 (ref)
        return l_isNillish_0(v99.description);
    end) then
        return "(" .. l_Array_0.join(l_Array_0.map(v96, v38), ", ") .. ")";
    else
        return "(\n" .. l_Array_0.join(l_Array_0.map(v96, function(v100, v101) --[[ Line: 326 ]]
            -- upvalues: v29 (ref), v98 (copy), v38 (ref)
            return v29(v100, "  " .. v98, v101 == 1) .. "  " .. v98 .. v38(v100);
        end), "\n") .. "\n" .. v98 .. ")";
    end;
end;
v38 = function(v102) --[[ Line: 339 ]] --[[ Name: printInputValue ]]
    -- upvalues: l_astFromValue_0 (copy), l_isNotNillish_0 (copy), l_print_0 (copy), v39 (ref)
    local v103 = l_astFromValue_0(v102.defaultValue, v102.type);
    local v104 = v102.name .. ": " .. tostring(v102.type);
    if l_isNotNillish_0(v103) then
        v104 = v104 .. (" = %s"):format(l_print_0(v103));
    end;
    return v104 .. v39(v102.deprecationReason);
end;
v33 = function(v105) --[[ Line: 351 ]] --[[ Name: printDirective ]]
    -- upvalues: v29 (ref), v37 (ref), l_Array_0 (copy)
    return v29(v105) .. "directive @" .. v105.name .. v37(v105.args) .. (v105.isRepeatable and " repeatable" or "") .. " on " .. l_Array_0.join(v105.locations, " | ");
end;
v39 = function(v106) --[[ Line: 361 ]] --[[ Name: printDeprecated ]]
    -- upvalues: l_isNillish_0 (copy), l_astFromValue_0 (copy), l_GraphQLString_0 (copy), l_DEFAULT_DEPRECATION_REASON_0 (copy), l_print_0 (copy)
    if l_isNillish_0(v106) then
        return "";
    else
        local v107 = l_astFromValue_0(v106, l_GraphQLString_0);
        if v107 and v106 ~= l_DEFAULT_DEPRECATION_REASON_0 then
            return " @deprecated(reason: " .. l_print_0(v107) .. ")";
        else
            return " @deprecated";
        end;
    end;
end;
v45 = function(v108) --[[ Line: 376 ]] --[[ Name: printSpecifiedByUrl ]]
    -- upvalues: l_isNillish_0 (copy), l_astFromValue_0 (copy), l_GraphQLString_0 (copy), l_invariant_0 (copy), l_print_0 (copy)
    if l_isNillish_0(v108.specifiedByUrl) then
        return "";
    else
        local l_specifiedByUrl_0 = v108.specifiedByUrl;
        local v110 = l_astFromValue_0(l_specifiedByUrl_0, l_GraphQLString_0);
        l_invariant_0(v110, "Unexpected null value returned from `astFromValue` for specifiedByUrl");
        return " @specifiedBy(url: " .. l_print_0(v110) .. ")";
    end;
end;
v29 = function(v111, v112, v113) --[[ Line: 390 ]] --[[ Name: printDescription ]]
    -- upvalues: l_isNillish_0 (copy), l_printBlockString_0 (copy), l_Boolean_0 (copy)
    local v114 = if v112 ~= nil then v112 else "";
    local v115 = v113 == nil or v113;
    local l_description_0 = v111.description;
    if l_isNillish_0(l_description_0) then
        return "";
    else
        local v117 = string.len(l_description_0) > 70;
        local v118 = l_printBlockString_0(l_description_0, "", v117);
        local v119 = if not l_Boolean_0.toJSBoolean(v114) or v115 then v114 else "\n" .. v114;
        local v120, _ = string.gsub(v118, "\n", "\n" .. v114);
        return v119 .. v120 .. "\n";
    end;
end;
return {
    printSchema = v49, 
    printIntrospectionSchema = v51, 
    printType = v34, 
    NULL = l_NULL_0
};