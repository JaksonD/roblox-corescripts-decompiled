local l_Parent_0 = script.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_language_0 = l_Parent_0.language;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Map_0 = v4.Map;
local l_Object_0 = v4.Object;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_print_0 = require(l_language_0.printer).print;
local l_DirectiveLocation_0 = require(l_language_0.directiveLocation).DirectiveLocation;
local l_astFromValue_0 = require(l_Parent_0.utilities.astFromValue).astFromValue;
local _ = require(l_Parent_0.language.ast);
local v15 = require(script.Parent.scalars);
local l_GraphQLString_0 = v15.GraphQLString;
local l_GraphQLBoolean_0 = v15.GraphQLBoolean;
local v18 = require(script.Parent.definition);
local l_GraphQLList_0 = v18.GraphQLList;
local l_GraphQLNonNull_0 = v18.GraphQLNonNull;
local l_GraphQLObjectType_0 = v18.GraphQLObjectType;
local l_GraphQLEnumType_0 = v18.GraphQLEnumType;
local l_isScalarType_0 = v18.isScalarType;
local l_isObjectType_0 = v18.isObjectType;
local l_isInterfaceType_0 = v18.isInterfaceType;
local l_isUnionType_0 = v18.isUnionType;
local l_isEnumType_0 = v18.isEnumType;
local l_isInputObjectType_0 = v18.isInputObjectType;
local l_isListType_0 = v18.isListType;
local l_isNonNullType_0 = v18.isNonNullType;
local l_isAbstractType_0 = v18.isAbstractType;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v46 = l_GraphQLObjectType_0.new({
    name = "__Schema", 
    description = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.", 
    fields = function() --[[ Line: 74 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLString_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLList_0 (copy), v36 (ref), v34 (ref)
        return l_Map_0.new({
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v40) --[[ Line: 80 ]] --[[ Name: resolve ]]
                        return v40.description;
                    end
                }
            }, 
            {
                "types", 
                {
                    description = "A list of all types supported by this server.", 
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v36))), 
                    resolve = function(v41) --[[ Line: 90 ]] --[[ Name: resolve ]]
                        return v41:getTypeMap():values();
                    end
                }
            }, 
            {
                "queryType", 
                {
                    description = "The type that query operations will be rooted at.", 
                    type = l_GraphQLNonNull_0.new(v36), 
                    resolve = function(v42) --[[ Line: 101 ]] --[[ Name: resolve ]]
                        return v42:getQueryType();
                    end
                }
            }, 
            {
                "mutationType", 
                {
                    description = "If this server supports mutation, the type that mutation operations will be rooted at.", 
                    type = v36, 
                    resolve = function(v43) --[[ Line: 111 ]] --[[ Name: resolve ]]
                        return v43:getMutationType();
                    end
                }
            }, 
            {
                "subscriptionType", 
                {
                    description = "If this server support subscription, the type that subscription operations will be rooted at.", 
                    type = v36, 
                    resolve = function(v44) --[[ Line: 121 ]] --[[ Name: resolve ]]
                        return v44:getSubscriptionType();
                    end
                }
            }, 
            {
                "directives", 
                {
                    description = "A list of all directives supported by this server.", 
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v34))), 
                    resolve = function(v45) --[[ Line: 131 ]] --[[ Name: resolve ]]
                        return v45:getDirectives();
                    end
                }
            }
        });
    end
});
v34 = l_GraphQLObjectType_0.new({
    name = "__Directive", 
    description = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.", 
    fields = function() --[[ Line: 143 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLBoolean_0 (copy), l_GraphQLList_0 (copy), v35 (ref), v38 (ref)
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v47) --[[ Line: 149 ]] --[[ Name: resolve ]]
                        return v47.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v48) --[[ Line: 158 ]] --[[ Name: resolve ]]
                        return v48.description;
                    end
                }
            }, 
            {
                "isRepeatable", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v49) --[[ Line: 167 ]] --[[ Name: resolve ]]
                        return v49.isRepeatable;
                    end
                }
            }, 
            {
                "locations", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v35))), 
                    resolve = function(v50) --[[ Line: 178 ]] --[[ Name: resolve ]]
                        return v50.locations;
                    end
                }
            }, 
            {
                "args", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v38))), 
                    resolve = function(v51) --[[ Line: 187 ]] --[[ Name: resolve ]]
                        return v51.args;
                    end
                }
            }
        });
    end
});
v35 = l_GraphQLEnumType_0.new({
    name = "__DirectiveLocation", 
    description = "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one such possible adjacencies.", 
    values = l_Map_0.new({
        {
            "QUERY", 
            {
                value = l_DirectiveLocation_0.QUERY, 
                description = "Location adjacent to a query operation."
            }
        }, 
        {
            "MUTATION", 
            {
                value = l_DirectiveLocation_0.MUTATION, 
                description = "Location adjacent to a mutation operation."
            }
        }, 
        {
            "SUBSCRIPTION", 
            {
                value = l_DirectiveLocation_0.SUBSCRIPTION, 
                description = "Location adjacent to a subscription operation."
            }
        }, 
        {
            "FIELD", 
            {
                value = l_DirectiveLocation_0.FIELD, 
                description = "Location adjacent to a field."
            }
        }, 
        {
            "FRAGMENT_DEFINITION", 
            {
                value = l_DirectiveLocation_0.FRAGMENT_DEFINITION, 
                description = "Location adjacent to a fragment definition."
            }
        }, 
        {
            "FRAGMENT_SPREAD", 
            {
                value = l_DirectiveLocation_0.FRAGMENT_SPREAD, 
                description = "Location adjacent to a fragment spread."
            }
        }, 
        {
            "INLINE_FRAGMENT", 
            {
                value = l_DirectiveLocation_0.INLINE_FRAGMENT, 
                description = "Location adjacent to an inline fragment."
            }
        }, 
        {
            "VARIABLE_DEFINITION", 
            {
                value = l_DirectiveLocation_0.VARIABLE_DEFINITION, 
                description = "Location adjacent to a variable definition."
            }
        }, 
        {
            "SCHEMA", 
            {
                value = l_DirectiveLocation_0.SCHEMA, 
                description = "Location adjacent to a schema definition."
            }
        }, 
        {
            "SCALAR", 
            {
                value = l_DirectiveLocation_0.SCALAR, 
                description = "Location adjacent to a scalar definition."
            }
        }, 
        {
            "OBJECT", 
            {
                value = l_DirectiveLocation_0.OBJECT, 
                description = "Location adjacent to an object type definition."
            }
        }, 
        {
            "FIELD_DEFINITION", 
            {
                value = l_DirectiveLocation_0.FIELD_DEFINITION, 
                description = "Location adjacent to a field definition."
            }
        }, 
        {
            "ARGUMENT_DEFINITION", 
            {
                value = l_DirectiveLocation_0.ARGUMENT_DEFINITION, 
                description = "Location adjacent to an argument definition."
            }
        }, 
        {
            "INTERFACE", 
            {
                value = l_DirectiveLocation_0.INTERFACE, 
                description = "Location adjacent to an interface definition."
            }
        }, 
        {
            "UNION", 
            {
                value = l_DirectiveLocation_0.UNION, 
                description = "Location adjacent to a union definition."
            }
        }, 
        {
            "ENUM", 
            {
                value = l_DirectiveLocation_0.ENUM, 
                description = "Location adjacent to an enum definition."
            }
        }, 
        {
            "ENUM_VALUE", 
            {
                value = l_DirectiveLocation_0.ENUM_VALUE, 
                description = "Location adjacent to an enum value definition."
            }
        }, 
        {
            "INPUT_OBJECT", 
            {
                value = l_DirectiveLocation_0.INPUT_OBJECT, 
                description = "Location adjacent to an input object type definition."
            }
        }, 
        {
            "INPUT_FIELD_DEFINITION", 
            {
                value = l_DirectiveLocation_0.INPUT_FIELD_DEFINITION, 
                description = "Location adjacent to an input object field definition."
            }
        }
    })
});
v36 = l_GraphQLObjectType_0.new({
    name = "__Type", 
    description = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.", 
    fields = function() --[[ Line: 339 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), v33 (ref), l_isScalarType_0 (copy), v32 (ref), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), l_isInputObjectType_0 (copy), l_isListType_0 (copy), l_isNonNullType_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy), l_GraphQLString_0 (copy), l_GraphQLList_0 (copy), v37 (ref), l_GraphQLBoolean_0 (copy), l_Array_0 (copy), v36 (ref), l_isAbstractType_0 (copy), v39 (ref), v38 (ref)
        return l_Map_0.new({
            {
                "kind", 
                {
                    type = l_GraphQLNonNull_0.new(v33), 
                    resolve = function(v52) --[[ Line: 345 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isScalarType_0 (ref), v32 (ref), l_isObjectType_0 (ref), l_isInterfaceType_0 (ref), l_isUnionType_0 (ref), l_isEnumType_0 (ref), l_isInputObjectType_0 (ref), l_isListType_0 (ref), l_isNonNullType_0 (ref), l_invariant_0 (ref), l_inspect_0 (ref)
                        if l_isScalarType_0(v52) then
                            return v32.SCALAR;
                        elseif l_isObjectType_0(v52) then
                            return v32.OBJECT;
                        elseif l_isInterfaceType_0(v52) then
                            return v32.INTERFACE;
                        elseif l_isUnionType_0(v52) then
                            return v32.UNION;
                        elseif l_isEnumType_0(v52) then
                            return v32.ENUM;
                        elseif l_isInputObjectType_0(v52) then
                            return v32.INPUT_OBJECT;
                        elseif l_isListType_0(v52) then
                            return v32.LIST;
                        elseif l_isNonNullType_0(v52) then
                            return v32.NON_NULL;
                        else
                            l_invariant_0(false, ("Unexpected type: \"%s\"."):format(l_inspect_0(v52)));
                            assert(false);
                            return;
                        end;
                    end
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v53) --[[ Line: 382 ]] --[[ Name: resolve ]]
                        if v53.name ~= nil then
                            return v53.name;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v54) --[[ Line: 391 ]] --[[ Name: resolve ]]
                        if v54.description ~= nil then
                            return v54.description;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "specifiedByUrl", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v55) --[[ Line: 400 ]] --[[ Name: resolve ]]
                        if v55.specifiedByUrl ~= nil then
                            return v55.specifiedByUrl;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "fields", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v37)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v56, v57) --[[ Line: 415 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isObjectType_0 (ref), l_isInterfaceType_0 (ref), l_Array_0 (ref)
                        local l_includeDeprecated_0 = v57.includeDeprecated;
                        if l_isObjectType_0(v56) or l_isInterfaceType_0(v56) then
                            local v59 = v56:getFields():values();
                            return l_includeDeprecated_0 and v59 or l_Array_0.filter(v59, function(v60) --[[ Line: 421 ]]
                                return v60.deprecationReason == nil;
                            end);
                        else
                            return;
                        end;
                    end
                }
            }, 
            {
                "interfaces", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v36)), 
                    resolve = function(v61) --[[ Line: 433 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isObjectType_0 (ref), l_isInterfaceType_0 (ref)
                        if l_isObjectType_0(v61) or l_isInterfaceType_0(v61) then
                            return v61:getInterfaces();
                        else
                            return;
                        end;
                    end
                }
            }, 
            {
                "possibleTypes", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v36)), 
                    resolve = function(v62, _, _, v65) --[[ Line: 445 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isAbstractType_0 (ref)
                        local l_schema_0 = v65.schema;
                        if l_isAbstractType_0(v62) then
                            return l_schema_0:getPossibleTypes(v62);
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "enumValues", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v39)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v67, v68) --[[ Line: 465 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isEnumType_0 (ref), l_Array_0 (ref)
                        local l_includeDeprecated_1 = v68.includeDeprecated;
                        if l_isEnumType_0(v67) then
                            local v70 = v67:getValues();
                            return l_includeDeprecated_1 and v70 or l_Array_0.filter(v70, function(v71) --[[ Line: 472 ]]
                                return v71.deprecationReason == nil;
                            end);
                        else
                            return;
                        end;
                    end
                }
            }, 
            {
                "inputFields", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v38)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v72, v73) --[[ Line: 490 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isInputObjectType_0 (ref), l_Array_0 (ref)
                        local l_includeDeprecated_2 = v73.includeDeprecated;
                        if l_isInputObjectType_0(v72) then
                            local v75 = v72:getFields():values();
                            return l_includeDeprecated_2 and v75 or l_Array_0.filter(v75, function(v76) --[[ Line: 498 ]]
                                return v76.deprecationReason == nil;
                            end);
                        else
                            return;
                        end;
                    end
                }
            }, 
            {
                "ofType", 
                {
                    type = v36, 
                    resolve = function(v77) --[[ Line: 510 ]] --[[ Name: resolve ]]
                        if v77.ofType ~= nil then
                            return v77.ofType;
                        else
                            return nil;
                        end;
                    end
                }
            }
        });
    end
});
v37 = l_GraphQLObjectType_0.new({
    name = "__Field", 
    description = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.", 
    fields = function() --[[ Line: 522 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLList_0 (copy), v38 (ref), l_GraphQLBoolean_0 (copy), l_Array_0 (copy), v36 (ref), l_isNotNillish_0 (copy)
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v78) --[[ Line: 528 ]] --[[ Name: resolve ]]
                        return v78.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v79) --[[ Line: 537 ]] --[[ Name: resolve ]]
                        return v79.description;
                    end
                }
            }, 
            {
                "args", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v38))), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v80, v81) --[[ Line: 552 ]] --[[ Name: resolve ]]
                        -- upvalues: l_Array_0 (ref)
                        if v81.includeDeprecated then
                            return v80.args;
                        else
                            return (l_Array_0.filter(v80.args, function(v82) --[[ Line: 557 ]]
                                return v82.deprecationReason == nil;
                            end));
                        end;
                    end
                }
            }, 
            {
                "type", 
                {
                    type = l_GraphQLNonNull_0.new(v36), 
                    resolve = function(v83) --[[ Line: 567 ]] --[[ Name: resolve ]]
                        return v83.type;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v84) --[[ Line: 576 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isNotNillish_0 (ref)
                        return l_isNotNillish_0(v84.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v85) --[[ Line: 585 ]] --[[ Name: resolve ]]
                        return v85.deprecationReason;
                    end
                }
            }
        });
    end
});
v38 = l_GraphQLObjectType_0.new({
    name = "__InputValue", 
    description = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.", 
    fields = function() --[[ Line: 597 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), v36 (ref), l_astFromValue_0 (copy), l_print_0 (copy), l_GraphQLBoolean_0 (copy), l_isNotNillish_0 (copy)
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v86) --[[ Line: 603 ]] --[[ Name: resolve ]]
                        return v86.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v87) --[[ Line: 612 ]] --[[ Name: resolve ]]
                        return v87.description;
                    end
                }
            }, 
            {
                "type", 
                {
                    type = l_GraphQLNonNull_0.new(v36), 
                    resolve = function(v88) --[[ Line: 621 ]] --[[ Name: resolve ]]
                        return v88.type;
                    end
                }
            }, 
            {
                "defaultValue", 
                {
                    type = l_GraphQLString_0, 
                    description = "A GraphQL-formatted string representing the default value for this input value.", 
                    resolve = function(v89) --[[ Line: 631 ]] --[[ Name: resolve ]]
                        -- upvalues: l_astFromValue_0 (ref), l_print_0 (ref)
                        local l_type_0 = v89.type;
                        local l_defaultValue_0 = v89.defaultValue;
                        local v92 = l_astFromValue_0(l_defaultValue_0, l_type_0);
                        if v92 then
                            return (l_print_0(v92));
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v93) --[[ Line: 643 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isNotNillish_0 (ref)
                        return l_isNotNillish_0(v93.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v94) --[[ Line: 652 ]] --[[ Name: resolve ]]
                        return v94.deprecationReason;
                    end
                }
            }
        });
    end
});
v39 = l_GraphQLObjectType_0.new({
    name = "__EnumValue", 
    description = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.", 
    fields = function() --[[ Line: 664 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLBoolean_0 (copy), l_isNotNillish_0 (copy)
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v95) --[[ Line: 670 ]] --[[ Name: resolve ]]
                        return v95.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v96) --[[ Line: 679 ]] --[[ Name: resolve ]]
                        return v96.description;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v97) --[[ Line: 688 ]] --[[ Name: resolve ]]
                        -- upvalues: l_isNotNillish_0 (ref)
                        return l_isNotNillish_0(v97.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v98) --[[ Line: 697 ]] --[[ Name: resolve ]]
                        return v98.deprecationReason;
                    end
                }
            }
        });
    end
});
v32 = l_Object_0.freeze({
    SCALAR = "SCALAR", 
    OBJECT = "OBJECT", 
    INTERFACE = "INTERFACE", 
    UNION = "UNION", 
    ENUM = "ENUM", 
    INPUT_OBJECT = "INPUT_OBJECT", 
    LIST = "LIST", 
    NON_NULL = "NON_NULL"
});
v33 = l_GraphQLEnumType_0.new({
    name = "__TypeKind", 
    description = "An enum describing what kind of type a given `__Type` is.", 
    values = l_Map_0.new({
        {
            "SCALAR", 
            {
                value = v32.SCALAR, 
                description = "Indicates this type is a scalar."
            }
        }, 
        {
            "OBJECT", 
            {
                value = v32.OBJECT, 
                description = "Indicates this type is an object. `fields` and `interfaces` are valid fields."
            }
        }, 
        {
            "INTERFACE", 
            {
                value = v32.INTERFACE, 
                description = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields."
            }
        }, 
        {
            "UNION", 
            {
                value = v32.UNION, 
                description = "Indicates this type is a union. `possibleTypes` is a valid field."
            }
        }, 
        {
            "ENUM", 
            {
                value = v32.ENUM, 
                description = "Indicates this type is an enum. `enumValues` is a valid field."
            }
        }, 
        {
            "INPUT_OBJECT", 
            {
                value = v32.INPUT_OBJECT, 
                description = "Indicates this type is an input object. `inputFields` is a valid field."
            }
        }, 
        {
            "LIST", 
            {
                value = v32.LIST, 
                description = "Indicates this type is a list. `ofType` is a valid field."
            }
        }, 
        {
            "NON_NULL", 
            {
                value = v32.NON_NULL, 
                description = "Indicates this type is a non-null. `ofType` is a valid field."
            }
        }
    })
});
local v103 = {
    name = "__schema", 
    type = l_GraphQLNonNull_0.new(v46), 
    description = "Access the current type schema of this server.", 
    args = {}, 
    resolve = function(_, _, _, v102) --[[ Line: 790 ]] --[[ Name: resolve ]]
        return v102.schema;
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v109 = {
    name = "__type", 
    type = v36, 
    description = "Request the type information of a single type.", 
    args = {
        {
            name = "name", 
            description = nil, 
            type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
            defaultValue = nil, 
            deprecationReason = nil, 
            extensions = nil, 
            astNode = nil
        }
    }, 
    resolve = function(_, v105, _, v107) --[[ Line: 815 ]] --[[ Name: resolve ]]
        local l_name_0 = v105.name;
        return v107.schema:getType(l_name_0);
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v114 = {
    name = "__typename", 
    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
    description = "The name of the current Object type at runtime.", 
    args = {}, 
    resolve = function(_, _, _, v113) --[[ Line: 831 ]] --[[ Name: resolve ]]
        return v113.parentType.name;
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v115 = l_Object_0.freeze({
    v46, 
    v34, 
    v35, 
    v36, 
    v37, 
    v38, 
    v39, 
    v33
});
return {
    introspectionTypes = v115, 
    isIntrospectionType = function(v116) --[[ Line: 852 ]] --[[ Name: isIntrospectionType ]]
        -- upvalues: l_Array_0 (copy), v115 (copy)
        return l_Array_0.some(v115, function(v117) --[[ Line: 853 ]]
            -- upvalues: v116 (copy)
            return v117.name == v116.name;
        end);
    end, 
    TypeNameMetaFieldDef = v114, 
    TypeMetaFieldDef = v109, 
    SchemaMetaFieldDef = v103, 
    TypeKind = v32, 
    __TypeKind = v33, 
    __Schema = v46, 
    __Directive = v34, 
    __DirectiveLocation = v35, 
    __Type = v36, 
    __Field = v37, 
    __InputValue = v38, 
    __EnumValue = v39
};