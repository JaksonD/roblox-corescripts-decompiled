local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_coerceToMap_0 = v2.coerceToMap;
local v8 = require(l_Parent_0.luaUtils.null);
local v9 = l_Object_0.freeze({});
local l_luaUtils_0 = l_Parent_0.luaUtils;
local l_isNillish_0 = require(l_luaUtils_0.isNillish).isNillish;
local l_jsutils_0 = l_Parent_0.jsutils;
local _ = require(l_jsutils_0.ObjMap);
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_toObjMap_0 = require(l_jsutils_0.toObjMap).toObjMap;
local l_keyValMap_0 = require(l_jsutils_0.keyValMap).keyValMap;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local v19 = require(l_jsutils_0.instanceOf);
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_identityFunc_0 = require(l_jsutils_0.identityFunc).identityFunc;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local _ = require(l_jsutils_0.PromiseOrValue);
local _ = require(l_jsutils_0.Path);
local l_mapValueOrdered_0 = require(l_Parent_0.luaUtils.mapValueOrdered).mapValueOrdered;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local _ = require(l_Parent_0.language.ast);
local l_valueFromASTUntyped_0 = require(l_Parent_0.utilities.valueFromASTUntyped).valueFromASTUntyped;
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
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = {};
local v83 = {};
local v84 = {};
local v85 = {};
local v86 = {};
local v87 = {};
v33 = function(v88) --[[ Line: 167 ]] --[[ Name: isType ]]
    -- upvalues: v35 (ref), v37 (ref), v39 (ref), v41 (ref), v43 (ref), v45 (ref), v47 (ref), v49 (ref)
    return v35(v88) or v37(v88) or v39(v88) or v41(v88) or v43(v88) or v45(v88) or v47(v88) or v49(v88);
end;
v34 = function(v89) --[[ Line: 178 ]] --[[ Name: assertType ]]
    -- upvalues: v33 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v33(v89) then
        error(l_Error_0.new(("Expected %s to be a GraphQL type."):format(l_inspect_0(v89))));
    end;
    return v89;
end;
v35 = function(v90) --[[ Line: 190 ]] --[[ Name: isScalarType ]]
    -- upvalues: v19 (copy), v82 (copy)
    return v19(v90, v82);
end;
v36 = function(v91) --[[ Line: 194 ]] --[[ Name: assertScalarType ]]
    -- upvalues: v35 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v35(v91) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Scalar type."):format(l_inspect_0(v91))));
    end;
    return v91;
end;
v37 = function(v92) --[[ Line: 202 ]] --[[ Name: isObjectType ]]
    -- upvalues: v19 (copy), v83 (copy)
    return v19(v92, v83);
end;
v38 = function(v93) --[[ Line: 206 ]] --[[ Name: assertObjectType ]]
    -- upvalues: v37 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v37(v93) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Object type."):format(l_inspect_0(v93))));
    end;
    return v93;
end;
v39 = function(v94) --[[ Line: 214 ]] --[[ Name: isInterfaceType ]]
    -- upvalues: v19 (copy), v84 (copy)
    return v19(v94, v84);
end;
v40 = function(v95) --[[ Line: 218 ]] --[[ Name: assertInterfaceType ]]
    -- upvalues: v39 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v39(v95) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Interface type."):format(l_inspect_0(v95))));
    end;
    return v95;
end;
v41 = function(v96) --[[ Line: 226 ]] --[[ Name: isUnionType ]]
    -- upvalues: v19 (copy), v85 (copy)
    return v19(v96, v85);
end;
v42 = function(v97) --[[ Line: 230 ]] --[[ Name: assertUnionType ]]
    -- upvalues: v41 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v41(v97) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Union type."):format(l_inspect_0(v97))));
    end;
    return v97;
end;
v43 = function(v98) --[[ Line: 238 ]] --[[ Name: isEnumType ]]
    -- upvalues: v19 (copy), v86 (copy)
    return v19(v98, v86);
end;
v44 = function(v99) --[[ Line: 242 ]] --[[ Name: assertEnumType ]]
    -- upvalues: v43 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v43(v99) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Enum type."):format(l_inspect_0(v99))));
    end;
    return v99;
end;
v45 = function(v100) --[[ Line: 250 ]] --[[ Name: isInputObjectType ]]
    -- upvalues: v19 (copy), v87 (copy)
    return v19(v100, v87);
end;
v46 = function(v101) --[[ Line: 254 ]] --[[ Name: assertInputObjectType ]]
    -- upvalues: v45 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v45(v101) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Input Object type."):format(l_inspect_0(v101))));
    end;
    return v101;
end;
v47 = function(v102) --[[ Line: 262 ]] --[[ Name: isListType ]]
    -- upvalues: v19 (copy), v80 (ref)
    return v19(v102, v80);
end;
v48 = function(v103) --[[ Line: 266 ]] --[[ Name: assertListType ]]
    -- upvalues: v47 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v47(v103) then
        error(l_Error_0.new(("Expected %s to be a GraphQL List type."):format(l_inspect_0(v103))));
    end;
    return v103;
end;
v49 = function(v104) --[[ Line: 274 ]] --[[ Name: isNonNullType ]]
    -- upvalues: v19 (copy), v81 (ref)
    return v19(v104, v81);
end;
v50 = function(v105) --[[ Line: 278 ]] --[[ Name: assertNonNullType ]]
    -- upvalues: v49 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v49(v105) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Non-Null type."):format(l_inspect_0(v105))));
    end;
    return v105;
end;
v51 = function(v106) --[[ Line: 324 ]] --[[ Name: isInputType ]]
    -- upvalues: v35 (ref), v43 (ref), v45 (ref), v61 (ref), v51 (ref)
    return v35(v106) or v43(v106) or v45(v106) or v61(v106) and v51(v106.ofType);
end;
v52 = function(v107) --[[ Line: 331 ]] --[[ Name: assertInputType ]]
    -- upvalues: v51 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v51(v107) then
        error(l_Error_0.new(("Expected %s to be a GraphQL input type."):format(l_inspect_0(v107))));
    end;
    return v107;
end;
v53 = function(v108) --[[ Line: 358 ]] --[[ Name: isOutputType ]]
    -- upvalues: v35 (ref), v37 (ref), v39 (ref), v41 (ref), v43 (ref), v61 (ref), v53 (ref)
    return v35(v108) or v37(v108) or v39(v108) or v41(v108) or v43(v108) or v61(v108) and v53(v108.ofType);
end;
v54 = function(v109) --[[ Line: 367 ]] --[[ Name: assertOutputType ]]
    -- upvalues: v53 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v53(v109) then
        error(l_Error_0.new(("Expected %s to be a GraphQL output type."):format(l_inspect_0(v109))));
    end;
    return v109;
end;
v55 = function(v110) --[[ Line: 380 ]] --[[ Name: isLeafType ]]
    -- upvalues: v35 (ref), v43 (ref)
    return v35(v110) or v43(v110);
end;
v56 = function(v111) --[[ Line: 384 ]] --[[ Name: assertLeafType ]]
    -- upvalues: v55 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v55(v111) then
        error(l_Error_0.new(("Expected %s to be a GraphQL leaf type."):format(l_inspect_0(v111))));
    end;
    return v111;
end;
v57 = function(v112) --[[ Line: 397 ]] --[[ Name: isCompositeType ]]
    -- upvalues: v37 (ref), v39 (ref), v41 (ref)
    return v37(v112) or v39(v112) or v41(v112);
end;
v58 = function(v113) --[[ Line: 401 ]] --[[ Name: assertCompositeType ]]
    -- upvalues: v57 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v57(v113) then
        error(l_Error_0.new(("Expected %s to be a GraphQL composite type."):format(l_inspect_0(v113))));
    end;
    return v113;
end;
v59 = function(v114) --[[ Line: 414 ]] --[[ Name: isAbstractType ]]
    -- upvalues: v39 (ref), v41 (ref)
    return v39(v114) or v41(v114);
end;
v60 = function(v115) --[[ Line: 418 ]] --[[ Name: assertAbstractType ]]
    -- upvalues: v59 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v59(v115) then
        error(l_Error_0.new(("Expected %s to be a GraphQL abstract type."):format(l_inspect_0(v115))));
    end;
    return v115;
end;
v80 = {};
v80.__index = v80;
v80.new = function(v116) --[[ Line: 452 ]] --[[ Name: new ]]
    -- upvalues: l_devAssert_0 (copy), v33 (ref), l_inspect_0 (copy), v80 (ref)
    local v117 = {};
    l_devAssert_0(v33(v116), ("Expected %s to be a GraphQL type."):format(l_inspect_0(v116)));
    v117.ofType = v116;
    return (setmetatable(v117, v80));
end;
v80.__tostring = function(v118) --[[ Line: 462 ]] --[[ Name: __tostring ]]
    return v118:toString();
end;
v80.toString = function(v119) --[[ Line: 466 ]] --[[ Name: toString ]]
    return "[" .. tostring(v119.ofType) .. "]";
end;
v80.toJSON = function(v120) --[[ Line: 470 ]] --[[ Name: toJSON ]]
    return v120:toString();
end;
v81 = {};
v81.__index = v81;
v81.new = function(v121) --[[ Line: 509 ]] --[[ Name: new ]]
    -- upvalues: l_devAssert_0 (copy), v63 (ref), l_inspect_0 (copy), v81 (ref)
    local v122 = {};
    l_devAssert_0(v63(v121), ("Expected %s to be a GraphQL nullable type."):format(l_inspect_0(v121)));
    v122.ofType = v121;
    return (setmetatable(v122, v81));
end;
v81.__tostring = function(v123) --[[ Line: 520 ]] --[[ Name: __tostring ]]
    return v123:toString();
end;
v81.toString = function(v124) --[[ Line: 524 ]] --[[ Name: toString ]]
    return tostring(v124.ofType) .. "!";
end;
v81.toJSON = function(v125) --[[ Line: 528 ]] --[[ Name: toJSON ]]
    return v125:toString();
end;
v61 = function(v126) --[[ Line: 545 ]] --[[ Name: isWrappingType ]]
    -- upvalues: v47 (ref), v49 (ref)
    return v47(v126) or v49(v126);
end;
v62 = function(v127) --[[ Line: 549 ]] --[[ Name: assertWrappingType ]]
    -- upvalues: v61 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v61(v127) then
        error(l_Error_0.new(("Expected %s to be a GraphQL wrapping type."):format(l_inspect_0(v127))));
    end;
    return v127;
end;
v63 = function(v128) --[[ Line: 569 ]] --[[ Name: isNullableType ]]
    -- upvalues: v33 (ref), v49 (ref)
    return v33(v128) and not v49(v128);
end;
v64 = function(v129) --[[ Line: 573 ]] --[[ Name: assertNullableType ]]
    -- upvalues: v63 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v63(v129) then
        error(l_Error_0.new(("Expected %s to be a GraphQL nullable type."):format(l_inspect_0(v129))));
    end;
    return v129;
end;
v65 = function(v130) --[[ Line: 581 ]] --[[ Name: getNullableType ]]
    -- upvalues: v49 (ref)
    if v130 then
        if v49(v130) then
            return v130.ofType;
        else
            return v130;
        end;
    else
        return nil;
    end;
end;
v66 = function(v131) --[[ Line: 604 ]] --[[ Name: isNamedType ]]
    -- upvalues: v35 (ref), v37 (ref), v39 (ref), v41 (ref), v43 (ref), v45 (ref)
    return v35(v131) or v37(v131) or v39(v131) or v41(v131) or v43(v131) or v45(v131);
end;
v67 = function(v132) --[[ Line: 613 ]] --[[ Name: assertNamedType ]]
    -- upvalues: v66 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v66(v132) then
        error(l_Error_0.new(("Expected %s to be a GraphQL named type."):format(l_inspect_0(v132))));
    end;
    return v132;
end;
v68 = function(v133) --[[ Line: 621 ]] --[[ Name: getNamedType ]]
    -- upvalues: v61 (ref)
    if v133 then
        local l_v133_0 = v133;
        while v61(l_v133_0) do
            l_v133_0 = l_v133_0.ofType;
        end;
        return l_v133_0;
    else
        return nil;
    end;
end;
local function _(v135) --[[ Line: 643 ]] --[[ Name: resolveThunk ]]
    if typeof(v135) == "function" then
        return (v135());
    else
        return v135;
    end;
end;
local function _(v137) --[[ Line: 647 ]] --[[ Name: undefineIfEmpty ]]
    if v137 and #v137 > 0 then
        return v137;
    else
        return nil;
    end;
end;
v82.__index = v82;
v82.new = function(v139) --[[ Line: 702 ]] --[[ Name: new ]]
    -- upvalues: l_identityFunc_0 (copy), l_valueFromASTUntyped_0 (copy), l_toObjMap_0 (copy), l_devAssert_0 (copy), l_isNillish_0 (copy), l_inspect_0 (copy), v82 (copy)
    local v140 = {};
    local v141 = if v139.parseValue then v139.parseValue else l_identityFunc_0;
    v140.name = v139.name;
    v140.description = v139.description;
    v140.specifiedByUrl = v139.specifiedByUrl;
    local v142 = if v139.serialize then v139.serialize else l_identityFunc_0;
    v140.serialize = function(_, ...) --[[ Line: 716 ]]
        -- upvalues: v142 (copy)
        return v142(...);
    end;
    v140.parseValue = function(_, ...) --[[ Line: 720 ]]
        -- upvalues: v141 (copy)
        return v141(...);
    end;
    local v147 = if v139.parseLiteral then v139.parseLiteral else function(v145, v146) --[[ Line: 725 ]]
        -- upvalues: v141 (copy), l_valueFromASTUntyped_0 (ref)
        return v141(l_valueFromASTUntyped_0(v145, v146));
    end;
    v140.parseLiteral = function(_, ...) --[[ Line: 729 ]]
        -- upvalues: v147 (copy)
        return v147(...);
    end;
    v140.extensions = if v139.extensions then l_toObjMap_0(v139.extensions) else nil;
    v140.astNode = v139.astNode;
    local l_extensionASTNodes_0 = v139.extensionASTNodes;
    v140.extensionASTNodes = if l_extensionASTNodes_0 and #l_extensionASTNodes_0 > 0 then l_extensionASTNodes_0 else nil;
    l_devAssert_0(typeof(v139.name) == "string", "Must provide name.");
    l_devAssert_0(l_isNillish_0(v139.specifiedByUrl) or typeof(v139.specifiedByUrl) == "string", ("%s must provide \"specifiedByUrl\" as a string, "):format(v140.name) .. ("but got: %s."):format(l_inspect_0(v139.specifiedByUrl)));
    local l_l_devAssert_0_0 = l_devAssert_0;
    l_extensionASTNodes_0 = true;
    if v139.serialize ~= nil then
        l_extensionASTNodes_0 = typeof(v139.serialize) == "function";
    end;
    l_l_devAssert_0_0(l_extensionASTNodes_0, ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(v140.name));
    if v139.parseLiteral then
        l_l_devAssert_0_0 = l_devAssert_0;
        l_extensionASTNodes_0 = false;
        if typeof(v139.parseValue) == "function" then
            l_extensionASTNodes_0 = typeof(v139.parseLiteral) == "function";
        end;
        l_l_devAssert_0_0(l_extensionASTNodes_0, ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(v140.name));
    end;
    return (setmetatable(v140, v82));
end;
v82.toConfig = function(v151) --[[ Line: 761 ]] --[[ Name: toConfig ]]
    return {
        name = v151.name, 
        description = v151.description, 
        specifiedByUrl = v151.specifiedByUrl, 
        serialize = v151.serialize, 
        parseValue = v151.parseValue, 
        parseLiteral = v151.parseLiteral, 
        extensions = v151.extensions, 
        astNode = v151.astNode, 
        extensionASTNodes = if v151.extensionASTNodes then v151.extensionASTNodes else {}
    };
end;
v82.__tostring = function(v152) --[[ Line: 775 ]] --[[ Name: __tostring ]]
    return v152:toString();
end;
v82.toString = function(v153) --[[ Line: 779 ]] --[[ Name: toString ]]
    return v153.name;
end;
v82.toJSON = function(v154) --[[ Line: 783 ]] --[[ Name: toJSON ]]
    return v154:toString();
end;
v83.__index = v83;
v83.new = function(v155) --[[ Line: 917 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), v79 (ref), v78 (ref), l_devAssert_0 (copy), l_inspect_0 (copy), v83 (copy)
    local v156 = {
        name = v155.name, 
        description = v155.description, 
        isTypeOf = v155.isTypeOf, 
        extensions = if v155.extensions then l_toObjMap_0(v155.extensions) else nil, 
        astNode = v155.astNode
    };
    local l_extensionASTNodes_1 = v155.extensionASTNodes;
    v156.extensionASTNodes = if l_extensionASTNodes_1 and #l_extensionASTNodes_1 > 0 then l_extensionASTNodes_1 else nil;
    v156._fields = function() --[[ Line: 928 ]]
        -- upvalues: v79 (ref), v155 (copy)
        return v79(v155);
    end;
    v156._interfaces = function() --[[ Line: 931 ]]
        -- upvalues: v78 (ref), v155 (copy)
        return v78(v155);
    end;
    l_devAssert_0(typeof(v155.name) == "string", "Must provide name.");
    local l_l_devAssert_0_1 = l_devAssert_0;
    l_extensionASTNodes_1 = true;
    if v155.isTypeOf ~= nil then
        l_extensionASTNodes_1 = typeof(v155.isTypeOf) == "function";
    end;
    l_l_devAssert_0_1(l_extensionASTNodes_1, ("%s must provide \"isTypeOf\" as a function, but got: %s."):format(v156.name, l_inspect_0(v155.isTypeOf)));
    return (setmetatable(v156, v83));
end;
v83.getFields = function(v159) --[[ Line: 946 ]] --[[ Name: getFields ]]
    if typeof(v159._fields) == "function" then
        v159._fields = v159._fields();
    end;
    return v159._fields;
end;
v83.getInterfaces = function(v160) --[[ Line: 953 ]] --[[ Name: getInterfaces ]]
    if typeof(v160._interfaces) == "function" then
        v160._interfaces = v160._interfaces();
    end;
    return v160._interfaces;
end;
v83.toConfig = function(v161) --[[ Line: 960 ]] --[[ Name: toConfig ]]
    -- upvalues: v77 (ref)
    return {
        name = v161.name, 
        description = v161.description, 
        interfaces = v161:getInterfaces(), 
        fields = v77(v161:getFields()), 
        isTypeOf = v161.isTypeOf, 
        extensions = v161.extensions, 
        astNode = v161.astNode, 
        extensionASTNodes = v161.extensionASTNodes or {}
    };
end;
v83.__tostring = function(v162) --[[ Line: 973 ]] --[[ Name: __tostring ]]
    return v162:toString();
end;
v83.toString = function(v163) --[[ Line: 977 ]] --[[ Name: toString ]]
    return v163.name;
end;
v83.toJSON = function(v164) --[[ Line: 981 ]] --[[ Name: toJSON ]]
    return v164:toString();
end;
v78 = function(v165) --[[ Line: 992 ]] --[[ Name: defineInterfaces ]]
    -- upvalues: l_devAssert_0 (copy), l_Array_0 (copy)
    local l_interfaces_0 = v165.interfaces;
    l_interfaces_0 = (if typeof(l_interfaces_0) == "function" then l_interfaces_0() else l_interfaces_0) or {};
    l_devAssert_0(l_Array_0.isArray(l_interfaces_0), ("%s interfaces must be an Array or a function which returns an Array."):format(v165.name));
    return l_interfaces_0;
end;
v79 = function(v167) --[[ Line: 1006 ]] --[[ Name: defineFieldMap ]]
    -- upvalues: l_devAssert_0 (copy), v74 (ref), v19 (copy), l_Map_0 (copy), l_coerceToMap_0 (copy), l_mapValueOrdered_0 (copy), l_inspect_0 (copy), l_Array_0 (copy), l_toObjMap_0 (copy)
    local l_fields_0 = v167.fields;
    local v169 = if typeof(l_fields_0) == "function" then l_fields_0() else l_fields_0;
    l_devAssert_0(v74(v169) or v19(v169, l_Map_0), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(v167.name));
    l_fields_0 = l_coerceToMap_0(v169);
    return l_mapValueOrdered_0(l_fields_0, function(v170, v171) --[[ Line: 1022 ]]
        -- upvalues: l_devAssert_0 (ref), v74 (ref), v167 (copy), l_inspect_0 (ref), v19 (ref), l_Map_0 (ref), l_Array_0 (ref), l_coerceToMap_0 (ref), l_toObjMap_0 (ref)
        l_devAssert_0(v74(v170), ("%s.%s field config must be an object."):format(v167.name, v171));
        local l_l_devAssert_0_2 = l_devAssert_0;
        local v173 = true;
        if v170.resolve ~= nil then
            v173 = typeof(v170.resolve) == "function";
        end;
        l_l_devAssert_0_2(v173, ("%s.%s field resolver must be a function if "):format(v167.name, v171) .. ("provided, but got: %s."):format(l_inspect_0(v170.resolve)));
        l_l_devAssert_0_2 = if v170.args then v170.args else {};
        l_devAssert_0(v74(l_l_devAssert_0_2) or v19(l_l_devAssert_0_2, l_Map_0), ("%s.%s args must be an object with argument names as keys."):format(v167.name, v171));
        v173 = l_Array_0.map(l_coerceToMap_0(l_l_devAssert_0_2):entries(), function(v174) --[[ Line: 1043 ]]
            -- upvalues: l_toObjMap_0 (ref)
            local v175 = v174[1];
            local v176 = v174[2];
            return {
                name = v175, 
                description = v176.description, 
                type = v176.type, 
                defaultValue = v176.defaultValue, 
                deprecationReason = v176.deprecationReason, 
                extensions = if v176.extensions then l_toObjMap_0(v176.extensions) else nil, 
                astNode = v176.astNode
            };
        end);
        return {
            name = v171, 
            description = v170.description, 
            type = v170.type, 
            args = v173, 
            resolve = v170.resolve, 
            subscribe = v170.subscribe, 
            deprecationReason = v170.deprecationReason, 
            extensions = if v170.extensions then l_toObjMap_0(v170.extensions) else nil, 
            astNode = v170.astNode
        };
    end);
end;
v74 = function(v177) --[[ Line: 1071 ]] --[[ Name: isPlainObj ]]
    -- upvalues: v8 (copy), l_isObjectLike_0 (copy), l_Array_0 (copy)
    local v178 = false;
    if v177 ~= v8 then
        v178 = l_isObjectLike_0(v177) and (not l_Array_0.isArray(v177) or next(v177) == nil);
    end;
    return v178;
end;
v77 = function(v179) --[[ Line: 1080 ]] --[[ Name: fieldsToFieldsConfig ]]
    -- upvalues: l_mapValueOrdered_0 (copy), v69 (ref)
    return l_mapValueOrdered_0(v179, function(v180) --[[ Line: 1084 ]]
        -- upvalues: v69 (ref)
        return {
            description = v180.description, 
            type = v180.type, 
            args = v69(v180.args), 
            resolve = v180.resolve, 
            subscribe = v180.subscribe, 
            deprecationReason = v180.deprecationReason, 
            extensions = v180.extensions, 
            astNode = v180.astNode
        };
    end);
end;
v69 = function(v181) --[[ Line: 1101 ]] --[[ Name: argsToArgsConfig ]]
    -- upvalues: l_keyValMap_0 (copy)
    return l_keyValMap_0(v181, function(v182) --[[ Line: 1102 ]]
        return v182.name;
    end, function(v183) --[[ Line: 1104 ]]
        return {
            description = v183.description, 
            type = v183.type, 
            defaultValue = v183.defaultValue, 
            deprecationReason = v183.deprecationReason, 
            extensions = v183.extensions, 
            astNode = v183.astNode
        };
    end);
end;
v70 = function(v184) --[[ Line: 1228 ]] --[[ Name: isRequiredArgument ]]
    -- upvalues: v49 (ref)
    return v49(v184.type) and v184.defaultValue == nil;
end;
v84.__index = v84;
v84.new = function(v185) --[[ Line: 1277 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), v79 (ref), v78 (ref), l_devAssert_0 (copy), l_inspect_0 (copy), v84 (copy)
    local v186 = {
        name = v185.name, 
        description = v185.description, 
        resolveType = v185.resolveType, 
        extensions = if v185.extensions then l_toObjMap_0(v185.extensions) else nil, 
        astNode = v185.astNode
    };
    local l_extensionASTNodes_2 = v185.extensionASTNodes;
    v186.extensionASTNodes = if l_extensionASTNodes_2 and #l_extensionASTNodes_2 > 0 then l_extensionASTNodes_2 else nil;
    v186._fields = function() --[[ Line: 1288 ]]
        -- upvalues: v79 (ref), v185 (copy)
        return v79(v185);
    end;
    v186._interfaces = function() --[[ Line: 1291 ]]
        -- upvalues: v78 (ref), v185 (copy)
        return v78(v185);
    end;
    l_devAssert_0(typeof(v185.name) == "string", "Must provide name.");
    local l_l_devAssert_0_3 = l_devAssert_0;
    l_extensionASTNodes_2 = true;
    if v185.resolveType ~= nil then
        l_extensionASTNodes_2 = typeof(v185.resolveType) == "function";
    end;
    l_l_devAssert_0_3(l_extensionASTNodes_2, ("%s must provide \"resolveType\" as a function, but got: %s."):format(v186.name, l_inspect_0(v185.resolveType)));
    return (setmetatable(v186, v84));
end;
v84.getFields = function(v189) --[[ Line: 1306 ]] --[[ Name: getFields ]]
    if typeof(v189._fields) == "function" then
        v189._fields = v189._fields();
    end;
    return v189._fields;
end;
v84.getInterfaces = function(v190) --[[ Line: 1313 ]] --[[ Name: getInterfaces ]]
    if typeof(v190._interfaces) == "function" then
        v190._interfaces = v190._interfaces();
    end;
    return v190._interfaces;
end;
v84.toConfig = function(v191) --[[ Line: 1320 ]] --[[ Name: toConfig ]]
    -- upvalues: v77 (ref)
    return {
        name = v191.name, 
        description = v191.description, 
        interfaces = v191:getInterfaces(), 
        fields = v77(v191:getFields()), 
        resolveType = v191.resolveType, 
        extensions = v191.extensions, 
        astNode = v191.astNode, 
        extensionASTNodes = v191.extensionASTNodes or {}
    };
end;
v84.__tostring = function(v192) --[[ Line: 1333 ]] --[[ Name: __tostring ]]
    return v192:toString();
end;
v84.toString = function(v193) --[[ Line: 1337 ]] --[[ Name: toString ]]
    return v193.name;
end;
v84.toJSON = function(v194) --[[ Line: 1341 ]] --[[ Name: toJSON ]]
    return v194:toString();
end;
v85.__index = v85;
v85.new = function(v195) --[[ Line: 1452 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), v73 (ref), l_devAssert_0 (copy), l_inspect_0 (copy), v85 (copy)
    local v196 = {
        name = v195.name, 
        description = v195.description, 
        resolveType = v195.resolveType, 
        extensions = if v195.extensions then l_toObjMap_0(v195.extensions) else nil, 
        astNode = v195.astNode
    };
    local l_extensionASTNodes_3 = v195.extensionASTNodes;
    v196.extensionASTNodes = if l_extensionASTNodes_3 and #l_extensionASTNodes_3 > 0 then l_extensionASTNodes_3 else nil;
    v196._types = function() --[[ Line: 1461 ]]
        -- upvalues: v73 (ref), v195 (copy)
        return v73(v195);
    end;
    l_devAssert_0(typeof(v195.name) == "string", "Must provide name.");
    local l_l_devAssert_0_4 = l_devAssert_0;
    l_extensionASTNodes_3 = true;
    if v195.resolveType ~= nil then
        l_extensionASTNodes_3 = typeof(v195.resolveType) == "function";
    end;
    l_l_devAssert_0_4(l_extensionASTNodes_3, ("%s must provide \"resolveType\" as a function, but got: %s."):format(v196.name, l_inspect_0(v195.resolveType)));
    return (setmetatable(v196, v85));
end;
v85.getTypes = function(v199) --[[ Line: 1476 ]] --[[ Name: getTypes ]]
    if typeof(v199._types) == "function" then
        v199._types = v199._types();
    end;
    return v199._types;
end;
v85.toConfig = function(v200) --[[ Line: 1483 ]] --[[ Name: toConfig ]]
    return {
        name = v200.name, 
        description = v200.description, 
        types = v200:getTypes(), 
        resolveType = v200.resolveType, 
        extensions = v200.extensions, 
        astNode = v200.astNode, 
        extensionASTNodes = v200.extensionASTNodes or {}
    };
end;
v85.__tostring = function(v201) --[[ Line: 1495 ]] --[[ Name: __tostring ]]
    return v201:toString();
end;
v85.toString = function(v202) --[[ Line: 1499 ]] --[[ Name: toString ]]
    return v202.name;
end;
v85.toJSON = function(v203) --[[ Line: 1503 ]] --[[ Name: toJSON ]]
    return v203:toString();
end;
v73 = function(v204) --[[ Line: 1514 ]] --[[ Name: defineTypes ]]
    -- upvalues: l_devAssert_0 (copy), l_Array_0 (copy)
    local l_types_0 = v204.types;
    local v206 = if typeof(l_types_0) == "function" then l_types_0() else l_types_0;
    l_devAssert_0(l_Array_0.isArray(v206), ("Must provide Array of types or a function which returns such an array for Union %s."):format(v204.name));
    return v206;
end;
v86.__index = v86;
v86.new = function(v207) --[[ Line: 1601 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), v76 (ref), l_Array_0 (copy), v9 (copy), l_keyMap_0 (copy), l_devAssert_0 (copy), v86 (copy)
    local v208 = {
        name = v207.name, 
        description = v207.description, 
        extensions = if v207.extensions then l_toObjMap_0(v207.extensions) else nil, 
        astNode = v207.astNode
    };
    local l_extensionASTNodes_4 = v207.extensionASTNodes;
    v208.extensionASTNodes = if l_extensionASTNodes_4 and #l_extensionASTNodes_4 > 0 then l_extensionASTNodes_4 else nil;
    v208._values = v76(v208.name, v207.values);
    v208._valueLookup = {};
    l_Array_0.forEach(v208._values, function(v210) --[[ Line: 1612 ]]
        -- upvalues: v208 (copy), v9 (ref)
        if v210.value == v210.value then
            v208._valueLookup[v210.value] = v210;
            return;
        else
            v208._valueLookup[v9] = v210;
            return;
        end;
    end);
    v208._nameLookup = l_keyMap_0(v208._values, function(v211) --[[ Line: 1624 ]]
        return v211.name;
    end);
    l_devAssert_0(typeof(v207.name) == "string", "Must provide name.");
    return (setmetatable(v208, v86));
end;
v86.getValues = function(v212) --[[ Line: 1633 ]] --[[ Name: getValues ]]
    return v212._values;
end;
v86.getValue = function(v213, v214) --[[ Line: 1637 ]] --[[ Name: getValue ]]
    return v213._nameLookup[v214];
end;
v86.serialize = function(v215, v216) --[[ Line: 1641 ]] --[[ Name: serialize ]]
    -- upvalues: v9 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy)
    local v217 = nil;
    v217 = if v216 == v216 then v215._valueLookup[v216] else v215._valueLookup[v9];
    if v217 == nil then
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent value: %s"):format(v215.name, l_inspect_0(v216))));
    end;
    return v217.name;
end;
v86.parseValue = function(v218, v219) --[[ Line: 1663 ]] --[[ Name: parseValue ]]
    -- upvalues: l_inspect_0 (copy), l_GraphQLError_0 (copy), v75 (ref)
    if typeof(v219) ~= "string" then
        local v220 = l_inspect_0(v219);
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent non-string value: %s." .. v75(v218, v220)):format(v218.name, v220)));
    end;
    local v221 = v218:getValue(v219);
    if v221 == nil then
        error(l_GraphQLError_0.new(("Value \"%s\" does not exist in \"%s\" enum."):format(v219, v218.name) .. v75(v218, v219)));
    end;
    return v221.value;
end;
v86.parseLiteral = function(v222, v223, _) --[[ Line: 1688 ]] --[[ Name: parseLiteral ]]
    -- upvalues: l_Kind_0 (copy), l_print_0 (copy), l_GraphQLError_0 (copy), v75 (ref)
    if v223.kind ~= l_Kind_0.ENUM then
        local v225 = l_print_0(v223);
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(v222.name, v225) .. v75(v222, v225), v223));
    end;
    local v226 = v222:getValue(v223.value);
    if v226 == nil then
        local v227 = l_print_0(v223);
        error(l_GraphQLError_0.new(("Value \"%s\" does not exist in \"%s\" enum."):format(v227, v222.name) .. v75(v222, v227), v223));
    end;
    return v226.value;
end;
v86.toConfig = function(v228) --[[ Line: 1715 ]] --[[ Name: toConfig ]]
    -- upvalues: l_keyValMap_0 (copy)
    local v231 = l_keyValMap_0(v228:getValues(), function(v229) --[[ Line: 1717 ]]
        return v229.name;
    end, function(v230) --[[ Line: 1719 ]]
        return {
            description = v230.description, 
            value = v230.value, 
            deprecationReason = v230.deprecationReason, 
            extensions = v230.extensions, 
            astNode = v230.astNode
        };
    end);
    return {
        name = v228.name, 
        description = v228.description, 
        values = v231, 
        extensions = v228.extensions, 
        astNode = v228.astNode, 
        extensionASTNodes = v228.extensionASTNodes or {}
    };
end;
v86.__tostring = function(v232) --[[ Line: 1741 ]] --[[ Name: __tostring ]]
    return v232:toString();
end;
v86.toString = function(v233) --[[ Line: 1745 ]] --[[ Name: toString ]]
    return v233.name;
end;
v86.toJSON = function(v234) --[[ Line: 1749 ]] --[[ Name: toJSON ]]
    return v234:toString();
end;
v75 = function(v235, v236) --[[ Line: 1760 ]] --[[ Name: didYouMeanEnumValue ]]
    -- upvalues: l_Array_0 (copy), l_suggestionList_0 (copy), l_didYouMean_0 (copy)
    local v238 = l_Array_0.map(v235:getValues(), function(v237) --[[ Line: 1761 ]]
        return v237.name;
    end);
    local v239 = l_suggestionList_0(v236, v238);
    return l_didYouMean_0("the enum value", v239);
end;
v76 = function(v240, v241) --[[ Line: 1770 ]] --[[ Name: defineEnumValues ]]
    -- upvalues: l_devAssert_0 (copy), v74 (ref), v19 (copy), l_Map_0 (copy), l_coerceToMap_0 (copy), l_Array_0 (copy), l_inspect_0 (copy), l_toObjMap_0 (copy)
    l_devAssert_0(v74(v241) or v19(v241, l_Map_0), ("%s values must be an object with value names as keys."):format((tostring(v240))));
    local v242 = l_coerceToMap_0(v241):entries();
    return l_Array_0.map(v242, function(v243) --[[ Line: 1781 ]]
        -- upvalues: l_devAssert_0 (ref), v74 (ref), v240 (copy), l_inspect_0 (ref), l_toObjMap_0 (ref)
        local v244 = v243[1];
        local v245 = v243[2];
        l_devAssert_0(v74(v245), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(v240), (tostring(v244))) .. ("representing an internal value but got: %s."):format(l_inspect_0(v245)));
        return {
            name = tostring(v244), 
            description = v245.description, 
            value = if v245.value ~= nil then v245.value else v244, 
            deprecationReason = v245.deprecationReason, 
            extensions = if v245.extensions then l_toObjMap_0(v245.extensions) else nil, 
            astNode = v245.astNode
        };
    end);
end;
v87.__index = v87;
v87.new = function(v246) --[[ Line: 1883 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), v72 (ref), l_devAssert_0 (copy), v87 (copy)
    local v247 = {
        name = v246.name, 
        description = v246.description, 
        extensions = if v246.extensions then l_toObjMap_0(v246.extensions) else nil, 
        astNode = v246.astNode
    };
    local l_extensionASTNodes_5 = v246.extensionASTNodes;
    v247.extensionASTNodes = if l_extensionASTNodes_5 and #l_extensionASTNodes_5 > 0 then l_extensionASTNodes_5 else nil;
    v247._fields = function() --[[ Line: 1891 ]]
        -- upvalues: v72 (ref), v246 (copy)
        return v72(v246);
    end;
    l_devAssert_0(typeof(v246.name) == "string", "Must provide name.");
    return (setmetatable(v247, v87));
end;
v87.getFields = function(v249) --[[ Line: 1898 ]] --[[ Name: getFields ]]
    if typeof(v249._fields) == "function" then
        v249._fields = v249._fields();
    end;
    return v249._fields;
end;
v87.toConfig = function(v250) --[[ Line: 1905 ]] --[[ Name: toConfig ]]
    -- upvalues: l_mapValueOrdered_0 (copy)
    local v252 = l_mapValueOrdered_0(v250:getFields(), function(v251) --[[ Line: 1907 ]]
        return {
            description = v251.description, 
            type = v251.type, 
            defaultValue = v251.defaultValue, 
            extensions = v251.extensions, 
            astNode = v251.astNode
        };
    end);
    return {
        name = v250.name, 
        description = v250.description, 
        fields = v252, 
        extensions = v250.extensions, 
        astNode = v250.astNode, 
        extensionASTNodes = v250.extensionASTNodes or {}
    };
end;
v87.__tostring = function(v253) --[[ Line: 1927 ]] --[[ Name: __tostring ]]
    return v253:toString();
end;
v87.toString = function(v254) --[[ Line: 1931 ]] --[[ Name: toString ]]
    return v254.name;
end;
v87.toJSON = function(v255) --[[ Line: 1935 ]] --[[ Name: toJSON ]]
    return v255:toString();
end;
v72 = function(v256) --[[ Line: 1946 ]] --[[ Name: defineInputFieldMap ]]
    -- upvalues: l_devAssert_0 (copy), v74 (ref), v19 (copy), l_Map_0 (copy), l_coerceToMap_0 (copy), l_mapValueOrdered_0 (copy), l_toObjMap_0 (copy)
    local l_fields_1 = v256.fields;
    local v258 = if typeof(l_fields_1) == "function" then l_fields_1() else l_fields_1;
    l_devAssert_0(v74(v258) or v19(v258, l_Map_0), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(v256.name));
    l_fields_1 = l_coerceToMap_0(v258);
    return l_mapValueOrdered_0(l_fields_1, function(v259, v260) --[[ Line: 1960 ]]
        -- upvalues: l_devAssert_0 (ref), v256 (copy), l_toObjMap_0 (ref)
        l_devAssert_0(v259.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(v256.name, v260));
        return {
            name = v260, 
            description = v259.description, 
            type = v259.type, 
            defaultValue = v259.defaultValue, 
            deprecationReason = v259.deprecationReason, 
            extensions = if v259.extensions then l_toObjMap_0(v259.extensions) else nil, 
            astNode = v259.astNode
        };
    end);
end;
v71 = function(v261) --[[ Line: 2020 ]] --[[ Name: isRequiredInputField ]]
    -- upvalues: v49 (ref)
    return v49(v261.type) and v261.defaultValue == nil;
end;
local _ = {
    new = function() --[[ Line: 2030 ]] --[[ Name: new ]]
        return {};
    end
};
return {
    GraphQLList = v80, 
    GraphQLNonNull = v81, 
    GraphQLScalarType = v82, 
    GraphQLObjectType = v83, 
    GraphQLInterfaceType = v84, 
    GraphQLUnionType = v85, 
    GraphQLEnumType = v86, 
    GraphQLInputObjectType = v87, 
    isType = v33, 
    assertType = v34, 
    isScalarType = v35, 
    assertScalarType = v36, 
    isObjectType = v37, 
    assertObjectType = v38, 
    isInterfaceType = v39, 
    assertInterfaceType = v40, 
    isUnionType = v41, 
    assertUnionType = v42, 
    isEnumType = v43, 
    assertEnumType = v44, 
    isInputObjectType = v45, 
    assertInputObjectType = v46, 
    isListType = v47, 
    assertListType = v48, 
    isNonNullType = v49, 
    assertNonNullType = v50, 
    isInputType = v51, 
    assertInputType = v52, 
    isOutputType = v53, 
    assertOutputType = v54, 
    isLeafType = v55, 
    assertLeafType = v56, 
    isCompositeType = v57, 
    assertCompositeType = v58, 
    isAbstractType = v59, 
    assertAbstractType = v60, 
    isWrappingType = v61, 
    assertWrappingType = v62, 
    isNullableType = v63, 
    assertNullableType = v64, 
    getNullableType = v65, 
    isNamedType = v66, 
    assertNamedType = v67, 
    getNamedType = v68, 
    argsToArgsConfig = v69, 
    isRequiredArgument = v70, 
    isRequiredInputField = v71, 
    NULL = v8
};