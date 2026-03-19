local l_Parent_0 = script.Parent.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local v6 = require(l_luaUtils_0.null);
local v7 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v7.isNillish;
local l_isNotNillish_0 = v7.isNotNillish;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local l_keyValMap_0 = require(l_Parent_0.jsutils.keyValMap).keyValMap;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local l_parseValue_0 = require(l_Parent_0.language.parser).parseValue;
local v15 = require(l_Parent_0.type.schema);
local v16 = require(l_Parent_0.type.definition);
local l_GraphQLSchema_0 = v15.GraphQLSchema;
local l_GraphQLDirective_0 = require(l_Parent_0.type.directives).GraphQLDirective;
local l_specifiedScalarTypes_0 = require(l_Parent_0.type.scalars).specifiedScalarTypes;
local v20 = require(l_Parent_0.type.introspection);
local l_introspectionTypes_0 = v20.introspectionTypes;
local l_TypeKind_0 = v20.TypeKind;
local l_isInputType_0 = v16.isInputType;
local l_isOutputType_0 = v16.isOutputType;
local l_GraphQLList_0 = v16.GraphQLList;
local l_GraphQLNonNull_0 = v16.GraphQLNonNull;
local l_GraphQLScalarType_0 = v16.GraphQLScalarType;
local l_GraphQLObjectType_0 = v16.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v16.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v16.GraphQLUnionType;
local l_GraphQLEnumType_0 = v16.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v16.GraphQLInputObjectType;
local l_assertNullableType_0 = v16.assertNullableType;
local l_assertObjectType_0 = v16.assertObjectType;
local l_assertInterfaceType_0 = v16.assertInterfaceType;
local _ = require(script.Parent.getIntrospectionQuery);
local l_valueFromAST_0 = require(script.Parent.valueFromAST).valueFromAST;
return {
    buildClientSchema = function(v38, v39) --[[ Line: 100 ]] --[[ Name: buildClientSchema ]]
        -- upvalues: l_TypeKind_0 (copy), l_Error_0 (copy), l_GraphQLList_0 (copy), l_GraphQLNonNull_0 (copy), l_assertNullableType_0 (copy), l_isNillish_0 (copy), l_inspect_0 (copy), l_assertObjectType_0 (copy), l_assertInterfaceType_0 (copy), l_isNotNillish_0 (copy), l_GraphQLScalarType_0 (copy), l_Array_0 (copy), l_GraphQLObjectType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_GraphQLUnionType_0 (copy), l_GraphQLEnumType_0 (copy), l_keyValMap_0 (copy), l_GraphQLInputObjectType_0 (copy), l_isOutputType_0 (copy), l_isInputType_0 (copy), l_valueFromAST_0 (copy), l_parseValue_0 (copy), l_GraphQLDirective_0 (copy), l_devAssert_0 (copy), l_isObjectLike_0 (copy), l_specifiedScalarTypes_0 (copy), l_introspectionTypes_0 (copy), v6 (copy), l_GraphQLSchema_0 (copy)
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
        v40 = function(v59) --[[ Line: 132 ]] --[[ Name: getType ]]
            -- upvalues: l_TypeKind_0 (ref), l_Error_0 (ref), l_GraphQLList_0 (ref), v40 (ref), l_GraphQLNonNull_0 (ref), l_assertNullableType_0 (ref), v41 (ref)
            if v59.kind == l_TypeKind_0.LIST then
                local l_ofType_0 = v59.ofType;
                if not l_ofType_0 then
                    error(l_Error_0.new("Decorated type deeper than introspection query."));
                end;
                return l_GraphQLList_0.new(v40(l_ofType_0));
            elseif v59.kind == l_TypeKind_0.NON_NULL then
                local l_ofType_1 = v59.ofType;
                if not l_ofType_1 then
                    error(l_Error_0.new("Decorated type deeper than introspection query."));
                end;
                local v62 = v40(l_ofType_1);
                return l_GraphQLNonNull_0.new(l_assertNullableType_0(v62));
            else
                return v41(v59);
            end;
        end;
        v41 = function(v63) --[[ Line: 155 ]] --[[ Name: getNamedType ]]
            -- upvalues: l_isNillish_0 (ref), l_Error_0 (ref), l_inspect_0 (ref), v58 (ref)
            local l_name_0 = v63.name;
            if l_isNillish_0(l_name_0) then
                error(l_Error_0.new(("Unknown type reference: %s."):format(l_inspect_0(v63))));
            end;
            local v65 = v58:get(l_name_0);
            if l_isNillish_0(v65) then
                error(l_Error_0.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(l_name_0)));
            end;
            return v65;
        end;
        v42 = function(v66) --[[ Line: 176 ]] --[[ Name: getObjectType ]]
            -- upvalues: l_assertObjectType_0 (ref), v41 (ref)
            return l_assertObjectType_0(v41(v66));
        end;
        v43 = function(v67) --[[ Line: 182 ]] --[[ Name: getInterfaceType ]]
            -- upvalues: l_assertInterfaceType_0 (ref), v41 (ref)
            return l_assertInterfaceType_0(v41(v67));
        end;
        v44 = function(v68) --[[ Line: 190 ]] --[[ Name: buildType ]]
            -- upvalues: l_isNotNillish_0 (ref), l_TypeKind_0 (ref), v45 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v51 (ref), l_inspect_0 (ref), l_Error_0 (ref)
            if l_isNotNillish_0(v68) and l_isNotNillish_0(v68.name) and l_isNotNillish_0(v68.kind) then
                if v68.kind == l_TypeKind_0.SCALAR then
                    return v45(v68);
                elseif v68.kind == l_TypeKind_0.OBJECT then
                    return v47(v68);
                elseif v68.kind == l_TypeKind_0.INTERFACE then
                    return v48(v68);
                elseif v68.kind == l_TypeKind_0.UNION then
                    return v49(v68);
                elseif v68.kind == l_TypeKind_0.ENUM then
                    return v50(v68);
                elseif v68.kind == l_TypeKind_0.INPUT_OBJECT then
                    return v51(v68);
                end;
            end;
            local v69 = l_inspect_0(v68);
            error(l_Error_0.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format(v69)));
        end;
        v45 = function(v70) --[[ Line: 217 ]] --[[ Name: buildScalarDef ]]
            -- upvalues: l_GraphQLScalarType_0 (ref)
            return l_GraphQLScalarType_0.new({
                name = v70.name, 
                description = v70.description, 
                specifiedByUrl = v70.specifiedByUrl
            });
        end;
        v46 = function(v71) --[[ Line: 225 ]] --[[ Name: buildImplementationsList ]]
            -- upvalues: l_TypeKind_0 (ref), l_inspect_0 (ref), l_Error_0 (ref), l_Array_0 (ref), v43 (ref)
            if v71.interfaces == nil and v71.kind == l_TypeKind_0.INTERFACE then
                return {};
            else
                if not v71.interfaces then
                    local v72 = l_inspect_0(v71);
                    error(l_Error_0.new(("Introspection result missing interfaces: %s."):format(v72)));
                end;
                return l_Array_0.map(v71.interfaces, v43);
            end;
        end;
        v47 = function(v73) --[[ Line: 251 ]] --[[ Name: buildObjectDef ]]
            -- upvalues: l_GraphQLObjectType_0 (ref), v46 (ref), v52 (ref)
            return l_GraphQLObjectType_0.new({
                name = v73.name, 
                description = v73.description, 
                interfaces = function() --[[ Line: 255 ]] --[[ Name: interfaces ]]
                    -- upvalues: v46 (ref), v73 (copy)
                    return v46(v73);
                end, 
                fields = function() --[[ Line: 258 ]] --[[ Name: fields ]]
                    -- upvalues: v52 (ref), v73 (copy)
                    return v52(v73);
                end
            });
        end;
        v48 = function(v74) --[[ Line: 264 ]] --[[ Name: buildInterfaceDef ]]
            -- upvalues: l_GraphQLInterfaceType_0 (ref), v46 (ref), v52 (ref)
            return l_GraphQLInterfaceType_0.new({
                name = v74.name, 
                description = v74.description, 
                interfaces = function() --[[ Line: 270 ]] --[[ Name: interfaces ]]
                    -- upvalues: v46 (ref), v74 (copy)
                    return v46(v74);
                end, 
                fields = function() --[[ Line: 273 ]] --[[ Name: fields ]]
                    -- upvalues: v52 (ref), v74 (copy)
                    return v52(v74);
                end
            });
        end;
        v49 = function(v75) --[[ Line: 279 ]] --[[ Name: buildUnionDef ]]
            -- upvalues: l_inspect_0 (ref), l_Error_0 (ref), l_GraphQLUnionType_0 (ref), l_Array_0 (ref), v42 (ref)
            if not v75.possibleTypes then
                local v76 = l_inspect_0(v75);
                error(l_Error_0.new(("Introspection result missing possibleTypes: %s."):format(v76)));
            end;
            return l_GraphQLUnionType_0.new({
                name = v75.name, 
                description = v75.description, 
                types = function() --[[ Line: 294 ]] --[[ Name: types ]]
                    -- upvalues: l_Array_0 (ref), v75 (copy), v42 (ref)
                    return l_Array_0.map(v75.possibleTypes, v42);
                end
            });
        end;
        v50 = function(v77) --[[ Line: 300 ]] --[[ Name: buildEnumDef ]]
            -- upvalues: l_inspect_0 (ref), l_Error_0 (ref), l_GraphQLEnumType_0 (ref), l_keyValMap_0 (ref)
            if not v77.enumValues then
                local v78 = l_inspect_0(v77);
                error(l_Error_0.new(("Introspection result missing enumValues: %s."):format(v78)));
            end;
            return l_GraphQLEnumType_0.new({
                name = v77.name, 
                description = v77.description, 
                values = l_keyValMap_0(v77.enumValues, function(v79) --[[ Line: 312 ]]
                    return v79.name;
                end, function(v80) --[[ Line: 314 ]]
                    return {
                        description = v80.description, 
                        deprecationReason = v80.deprecationReason
                    };
                end)
            });
        end;
        v51 = function(v81) --[[ Line: 324 ]] --[[ Name: buildInputObjectDef ]]
            -- upvalues: l_inspect_0 (ref), l_Error_0 (ref), l_GraphQLInputObjectType_0 (ref), v54 (ref)
            if not v81.inputFields then
                local v82 = l_inspect_0(v81);
                error(l_Error_0.new(("Introspection result missing inputFields: %s."):format(v82)));
            end;
            return l_GraphQLInputObjectType_0.new({
                name = v81.name, 
                description = v81.description, 
                fields = function() --[[ Line: 340 ]] --[[ Name: fields ]]
                    -- upvalues: v54 (ref), v81 (copy)
                    return v54(v81.inputFields);
                end
            });
        end;
        v52 = function(v83) --[[ Line: 346 ]] --[[ Name: buildFieldDefMap ]]
            -- upvalues: l_Error_0 (ref), l_inspect_0 (ref), l_keyValMap_0 (ref), v53 (ref)
            if not v83.fields then
                error(l_Error_0.new(("Introspection result missing fields: %s."):format(l_inspect_0(v83))));
            end;
            return l_keyValMap_0(v83.fields, function(v84) --[[ Line: 358 ]]
                return v84.name;
            end, v53);
        end;
        v53 = function(v85) --[[ Line: 363 ]] --[[ Name: buildField ]]
            -- upvalues: v40 (ref), l_isOutputType_0 (ref), l_inspect_0 (ref), l_Error_0 (ref), v54 (ref)
            local v86 = v40(v85.type);
            if not l_isOutputType_0(v86) then
                local v87 = l_inspect_0(v86);
                error(l_Error_0.new(("Introspection must provide output type for fields, but received: %s."):format(v87)));
            end;
            if not v85.args then
                local v88 = l_inspect_0(v85);
                error(l_Error_0.new(("Introspection result missing field args: %s."):format(v88)));
            end;
            return {
                description = v85.description, 
                deprecationReason = v85.deprecationReason, 
                type = v86, 
                args = v54(v85.args)
            };
        end;
        v54 = function(v89) --[[ Line: 394 ]] --[[ Name: buildInputValueDefMap ]]
            -- upvalues: l_keyValMap_0 (ref), v55 (ref)
            return l_keyValMap_0(v89, function(v90) --[[ Line: 395 ]]
                return v90.name;
            end, v55);
        end;
        v55 = function(v91) --[[ Line: 400 ]] --[[ Name: buildInputValue ]]
            -- upvalues: v40 (ref), l_isInputType_0 (ref), l_inspect_0 (ref), l_Error_0 (ref), l_isNotNillish_0 (ref), l_valueFromAST_0 (ref), l_parseValue_0 (ref)
            local v92 = v40(v91.type);
            if not l_isInputType_0(v92) then
                local v93 = l_inspect_0(v92);
                error(l_Error_0.new(("Introspection must provide input type for arguments, but received: %s."):format(v93)));
            end;
            local v94 = if l_isNotNillish_0(v91.defaultValue) then l_valueFromAST_0(l_parseValue_0(v91.defaultValue), v92) else nil;
            return {
                description = v91.description, 
                type = v92, 
                defaultValue = v94, 
                deprecationReason = v91.deprecationReason
            };
        end;
        v56 = function(v95) --[[ Line: 429 ]] --[[ Name: buildDirective ]]
            -- upvalues: l_inspect_0 (ref), l_Error_0 (ref), l_GraphQLDirective_0 (ref), l_Array_0 (ref), v54 (ref)
            if not v95.args then
                local v96 = l_inspect_0(v95);
                error(l_Error_0.new(("Introspection result missing directive args: %s."):format(v96)));
            end;
            if not v95.locations then
                local v97 = l_inspect_0(v95);
                error(l_Error_0.new(("Introspection result missing directive locations: %s."):format(v97)));
            end;
            return l_GraphQLDirective_0.new({
                name = v95.name, 
                description = v95.description, 
                isRepeatable = v95.isRepeatable, 
                locations = l_Array_0.slice(v95.locations), 
                args = v54(v95.args)
            });
        end;
        l_devAssert_0(l_isObjectLike_0(v38) and l_isObjectLike_0(v38.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(l_inspect_0(v38)));
        v57 = v38.__schema;
        v58 = l_keyValMap_0(v57.types, function(v98) --[[ Line: 471 ]]
            return v98.name;
        end, function(v99) --[[ Line: 473 ]]
            -- upvalues: v44 (ref)
            return v44(v99);
        end);
        for _, v101 in ipairs(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0)) do
            local l_name_1 = v101.name;
            if v58:get(l_name_1) then
                l_name_1 = v101.name;
                v58:set(l_name_1, v101);
            end;
        end;
        local v103 = if l_isNotNillish_0(v57.queryType) then v42(v57.queryType) else v6;
        local v104 = if l_isNotNillish_0(v57.mutationType) then v42(v57.mutationType) else v6;
        local v105 = if l_isNotNillish_0(v57.subscriptionType) then v42(v57.subscriptionType) else v6;
        local v106 = if l_isNotNillish_0(v57.directives) then l_Array_0.map(v57.directives, v56) else {};
        return l_GraphQLSchema_0.new({
            description = v57.description, 
            query = v103, 
            mutation = v104, 
            subscription = v105, 
            types = v58:values(), 
            directives = v106, 
            assumeValid = if v39 then v39.assumeValid else nil
        });
    end
};