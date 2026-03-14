local l_Parent_0 = script.Parent.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_Map_0 = v3.Map;
local l_Set_0 = v3.Set;
local v8 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v8.isNillish;
local l_isNotNillish_0 = v8.isNotNillish;
local _ = require(l_luaUtils_0.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_toObjMap_0 = require(l_jsutils_0.toObjMap).toObjMap;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local v16 = require(l_jsutils_0.instanceOf);
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l___Schema_0 = require(script.Parent.introspection).__Schema;
local _ = require(l_Parent_0.language.ast);
local _ = require(l_Parent_0.error.GraphQLError);
local v21 = require(script.Parent.directives);
local l_isDirective_0 = v21.isDirective;
local l_specifiedDirectives_0 = v21.specifiedDirectives;
local _ = require(l_jsutils_0.ObjMap);
local v25 = require(script.Parent.definition);
local l_isObjectType_0 = v25.isObjectType;
local l_isInterfaceType_0 = v25.isInterfaceType;
local l_isUnionType_0 = v25.isUnionType;
local l_isInputObjectType_0 = v25.isInputObjectType;
local l_getNamedType_0 = v25.getNamedType;
local v31 = nil;
local v32 = nil;
local function v34(v33) --[[ Line: 74 ]] --[[ Name: isSchema ]]
    -- upvalues: v16 (copy), v31 (ref)
    return v16(v33, v31);
end;
local function v36(v35) --[[ Line: 78 ]] --[[ Name: assertSchema ]]
    -- upvalues: v16 (copy), v31 (ref), l_Error_0 (copy), l_inspect_0 (copy)
    if not v16(v35, v31) then
        error(l_Error_0.new(("Expected %s to be a GraphQL schema."):format(l_inspect_0(v35))));
    end;
    return v35;
end;
v31 = {};
v31.__index = v31;
v31.new = function(v37) --[[ Line: 200 ]] --[[ Name: new ]]
    -- upvalues: v31 (ref), l_devAssert_0 (copy), l_isObjectLike_0 (copy), l_Array_0 (copy), l_inspect_0 (copy), l_toObjMap_0 (copy), l_specifiedDirectives_0 (copy), l_Set_0 (copy), v32 (ref), l_isNotNillish_0 (copy), l_isDirective_0 (copy), l___Schema_0 (copy), l_Map_0 (copy), l_isNillish_0 (copy), l_Error_0 (copy), l_isInterfaceType_0 (copy), l_isObjectType_0 (copy)
    local v38 = setmetatable({}, v31);
    v38.__validationErrors = nil;
    if v37.assumeValid == true then
        v38.__validationErrors = {};
    end;
    l_devAssert_0(l_isObjectLike_0(v37), "Must provide configuration object.");
    l_devAssert_0(not v37.types or l_Array_0.isArray(v37.types), ("\"types\" must be Array if provided but got: %s."):format(l_inspect_0(v37.types)));
    l_devAssert_0(not v37.directives or l_Array_0.isArray(v37.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(l_inspect_0(v37.directives)));
    v38.description = v37.description;
    v38.extensions = if v37.extensions then l_toObjMap_0(v37.extensions) else nil;
    v38.astNode = v37.astNode;
    v38.extensionASTNodes = v37.extensionASTNodes;
    v38._queryType = v37.query;
    v38._mutationType = v37.mutation;
    v38._subscriptionType = v37.subscription;
    v38._directives = v37.directives or l_specifiedDirectives_0;
    local v39 = l_Set_0.new();
    local l_ipairs_0 = ipairs;
    local v41 = v37.types or {};
    for _, v43 in l_ipairs_0(v41) do
        v39:add(v43);
    end;
    if v37.types ~= nil then
        for _, v45 in ipairs(v37.types) do
            v39:delete(v45);
            v32(v45, v39);
        end;
    end;
    if l_isNotNillish_0(v38._queryType) then
        v32(v38._queryType, v39);
    end;
    if l_isNotNillish_0(v38._mutationType) then
        v32(v38._mutationType, v39);
    end;
    if l_isNotNillish_0(v38._subscriptionType) then
        v32(v38._subscriptionType, v39);
    end;
    for _, v47 in ipairs(v38._directives) do
        if l_isDirective_0(v47) then
            for _, v49 in ipairs(v47.args) do
                v32(v49.type, v39);
            end;
        end;
    end;
    v32(l___Schema_0, v39);
    v38._typeMap = l_Map_0.new();
    v38._subTypeMap = l_Map_0.new();
    v38._implementationsMap = l_Map_0.new();
    for _, v51 in v39 do
        if not l_isNillish_0(v51) then
            local v52 = nil;
            v52 = if typeof(v51) == "table" then v51.name else tostring(v51);
            l_devAssert_0(v52 and v52 ~= "", "One of the provided types for building the Schema is missing a name.");
            if v38._typeMap:has(v52) then
                error(l_Error_0.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(v52)));
            end;
            v38._typeMap:set(v52, v51);
            if l_isInterfaceType_0(v51) then
                for _, v54 in ipairs(v51:getInterfaces()) do
                    if l_isInterfaceType_0(v54) then
                        local v55 = v38._implementationsMap:get(v54.name);
                        if v55 == nil then
                            v55 = {
                                objects = {}, 
                                interfaces = {}
                            };
                            v38._implementationsMap:set(v54.name, v55);
                        end;
                        table.insert(v55.interfaces, v51);
                    end;
                end;
            elseif l_isObjectType_0(v51) then
                for _, v57 in ipairs(v51:getInterfaces()) do
                    if l_isInterfaceType_0(v57) then
                        local v58 = v38._implementationsMap:get(v57.name);
                        if v58 == nil then
                            v58 = {
                                objects = {}, 
                                interfaces = {}
                            };
                            v38._implementationsMap:set(v57.name, v58);
                        end;
                        table.insert(v58.objects, v51);
                    end;
                end;
            end;
        end;
    end;
    return v38;
end;
v31.getQueryType = function(v59) --[[ Line: 349 ]] --[[ Name: getQueryType ]]
    return v59._queryType;
end;
v31.getMutationType = function(v60) --[[ Line: 353 ]] --[[ Name: getMutationType ]]
    return v60._mutationType;
end;
v31.getSubscriptionType = function(v61) --[[ Line: 357 ]] --[[ Name: getSubscriptionType ]]
    return v61._subscriptionType;
end;
v31.getTypeMap = function(v62) --[[ Line: 361 ]] --[[ Name: getTypeMap ]]
    return v62._typeMap;
end;
v31.getType = function(v63, v64) --[[ Line: 365 ]] --[[ Name: getType ]]
    return v63:getTypeMap()[v64];
end;
v31.getPossibleTypes = function(v65, v66) --[[ Line: 369 ]] --[[ Name: getPossibleTypes ]]
    -- upvalues: l_isUnionType_0 (copy)
    if l_isUnionType_0(v66) then
        return v66:getTypes();
    else
        return v65:getImplementations(v66).objects;
    end;
end;
v31.getImplementations = function(v67, v68) --[[ Line: 378 ]] --[[ Name: getImplementations ]]
    return v67._implementationsMap:get(v68.name) or {
        objects = {}, 
        interfaces = {}
    };
end;
v31.isSubType = function(v69, v70, v71) --[[ Line: 388 ]] --[[ Name: isSubType ]]
    -- upvalues: l_isUnionType_0 (copy)
    local v72 = v69._subTypeMap[v70.name];
    if v72 == nil then
        v72 = {};
        if l_isUnionType_0(v70) then
            for _, v74 in ipairs(v70:getTypes()) do
                v72[v74.name] = true;
            end;
        else
            local v75 = v69:getImplementations(v70);
            for _, v77 in ipairs(v75.objects) do
                v72[v77.name] = true;
            end;
            for _, v79 in ipairs(v75.interfaces) do
                v72[v79.name] = true;
            end;
        end;
        v69._subTypeMap:set(v70.name, v72);
    end;
    return v72[v71.name] ~= nil;
end;
v31.getDirectives = function(v80) --[[ Line: 417 ]] --[[ Name: getDirectives ]]
    return v80._directives;
end;
v31.getDirective = function(v81, v82) --[[ Line: 421 ]] --[[ Name: getDirective ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.find(v81:getDirectives(), function(v83) --[[ Line: 422 ]]
        -- upvalues: v82 (copy)
        return v83.name == v82;
    end);
end;
v31.toConfig = function(v84) --[[ Line: 427 ]] --[[ Name: toConfig ]]
    -- upvalues: l_Array_0 (copy)
    return {
        description = v84.description, 
        query = v84:getQueryType(), 
        mutation = v84:getMutationType(), 
        subscription = v84:getSubscriptionType(), 
        types = v84:getTypeMap():values(), 
        directives = l_Array_0.slice(v84:getDirectives()), 
        extensions = v84.extensions, 
        astNode = v84.astNode, 
        extensionASTNodes = v84.extensionASTNodes or {}, 
        assumeValid = v84.__validationErrors ~= nil
    };
end;
v31.__tostring = function(_) --[[ Line: 443 ]] --[[ Name: __tostring ]]
    return "GraphQLSchema";
end;
v32 = function(v86, v87) --[[ Line: 485 ]] --[[ Name: collectReferencedTypes ]]
    -- upvalues: l_getNamedType_0 (copy), l_isUnionType_0 (copy), v32 (ref), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isInputObjectType_0 (copy)
    local v88 = l_getNamedType_0(v86);
    if not v87:has(v88) then
        v87:add(v88);
        if l_isUnionType_0(v88) then
            for _, v90 in ipairs(v88:getTypes()) do
                v32(v90, v87);
            end;
            return v87;
        elseif l_isObjectType_0(v88) or l_isInterfaceType_0(v88) then
            for _, v92 in ipairs(v88:getInterfaces()) do
                v32(v92, v87);
            end;
            for _, v94 in ipairs(v88:getFields():values()) do
                v32(v94.type, v87);
                for _, v96 in ipairs(v94.args) do
                    v32(v96.type, v87);
                end;
            end;
            return v87;
        elseif l_isInputObjectType_0(v88) then
            for _, v98 in ipairs(v88:getFields():values()) do
                v32(v98.type, v87);
            end;
        end;
    end;
    return v87;
end;
return {
    isSchema = v34, 
    assertSchema = v36, 
    GraphQLSchema = v31
};