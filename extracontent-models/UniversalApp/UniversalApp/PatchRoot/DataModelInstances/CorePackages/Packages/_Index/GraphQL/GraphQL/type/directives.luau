local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_coerceToMap_0 = v2.coerceToMap;
local _ = require(l_Parent_0.jsutils.ObjMap);
local _ = require(script.Parent.Parent.jsutils.ObjMap);
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_toObjMap_0 = require(script.Parent.Parent.jsutils.toObjMap).toObjMap;
local l_devAssert_0 = require(script.Parent.Parent.jsutils.devAssert).devAssert;
local v13 = require(script.Parent.Parent.jsutils.instanceOf);
local l_isObjectLike_0 = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike;
local _ = require(script.Parent.Parent.language.ast);
local l_DirectiveLocation_0 = require(script.Parent.Parent.language.directiveLocation).DirectiveLocation;
local v17 = require(script.Parent.definition);
local v18 = require(script.Parent.scalars);
local l_GraphQLString_0 = v18.GraphQLString;
local l_GraphQLBoolean_0 = v18.GraphQLBoolean;
local l_argsToArgsConfig_0 = v17.argsToArgsConfig;
local l_GraphQLNonNull_0 = v17.GraphQLNonNull;
local v23 = nil;
isDirective = function(v24) --[[ Line: 53 ]] --[[ Name: isDirective ]]
    -- upvalues: v13 (copy), v23 (ref)
    return v13(v24, v23);
end;
assertDirective = function(v25) --[[ Line: 57 ]] --[[ Name: assertDirective ]]
    -- upvalues: l_Error_0 (copy), l_inspect_0 (copy)
    if not isDirective(v25) then
        error(l_Error_0.new(("Expected %s to be a GraphQL directive."):format(l_inspect_0(v25))));
    end;
    return v25;
end;
v23 = {};
v23.__index = v23;
v23.new = function(v26) --[[ Line: 87 ]] --[[ Name: new ]]
    -- upvalues: l_toObjMap_0 (copy), l_devAssert_0 (copy), l_Array_0 (copy), l_isObjectLike_0 (copy), v13 (copy), l_Map_0 (copy), l_coerceToMap_0 (copy), v23 (ref)
    local v27 = {
        name = v26.name, 
        description = v26.description, 
        locations = v26.locations, 
        isRepeatable = v26.isRepeatable and true or false, 
        extensions = v26.extensions and l_toObjMap_0(v26.extensions), 
        astNode = v26.astNode
    };
    l_devAssert_0(v26.name, "Directive must be named.");
    l_devAssert_0(l_Array_0.isArray(v26.locations), ("@%s locations must be an Array."):format(v26.name));
    local v28 = if v26.args then v26.args else {};
    l_devAssert_0(l_isObjectLike_0(v28) and not (l_Array_0.isArray(v28) and next(v28) ~= nil) or v13(v28, l_Map_0), ("@%s args must be an object with argument names as keys."):format(v26.name));
    v27.args = l_Array_0.map(l_coerceToMap_0(v28):entries(), function(v29) --[[ Line: 112 ]]
        -- upvalues: l_toObjMap_0 (ref)
        local v30 = v29[1];
        local v31 = v29[2];
        return {
            name = v30, 
            description = v31.description, 
            type = v31.type, 
            defaultValue = v31.defaultValue, 
            deprecationReason = v31.deprecationReason, 
            extensions = v31.extensions and l_toObjMap_0(v31.extensions), 
            astNode = v31.astNode
        };
    end);
    return (setmetatable(v27, v23));
end;
v23.toConfig = function(v32) --[[ Line: 129 ]] --[[ Name: toConfig ]]
    -- upvalues: l_argsToArgsConfig_0 (copy)
    return {
        name = v32.name, 
        description = v32.description, 
        locations = v32.locations, 
        args = l_argsToArgsConfig_0(v32.args), 
        isRepeatable = v32.isRepeatable, 
        extensions = v32.extensions, 
        astNode = v32.astNode
    };
end;
v23.__tostring = function(v33) --[[ Line: 141 ]] --[[ Name: __tostring ]]
    return v33:toString();
end;
v23.toString = function(v34) --[[ Line: 145 ]] --[[ Name: toString ]]
    return "@" .. v34.name;
end;
v23.toJSON = function(v35) --[[ Line: 149 ]] --[[ Name: toJSON ]]
    return v35:toString();
end;
local v36 = v23.new({
    name = "include", 
    description = "Directs the executor to include this field or fragment only when the `if` argument is true.", 
    locations = {
        l_DirectiveLocation_0.FIELD, 
        l_DirectiveLocation_0.FRAGMENT_SPREAD, 
        l_DirectiveLocation_0.INLINE_FRAGMENT
    }, 
    args = l_Map_0.new({
        {
            "if", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                description = "Included when true."
            }
        }
    })
});
local v37 = v23.new({
    name = "skip", 
    description = "Directs the executor to skip this field or fragment when the `if` argument is true.", 
    locations = {
        l_DirectiveLocation_0.FIELD, 
        l_DirectiveLocation_0.FRAGMENT_SPREAD, 
        l_DirectiveLocation_0.INLINE_FRAGMENT
    }, 
    args = l_Map_0.new({
        {
            "if", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                description = "Skipped when true."
            }
        }
    })
});
local v38 = v23.new({
    name = "deprecated", 
    description = "Marks an element of a GraphQL schema as no longer supported.", 
    locations = {
        l_DirectiveLocation_0.FIELD_DEFINITION, 
        l_DirectiveLocation_0.ARGUMENT_DEFINITION, 
        l_DirectiveLocation_0.INPUT_FIELD_DEFINITION, 
        l_DirectiveLocation_0.ENUM_VALUE
    }, 
    args = l_Map_0.new({
        {
            "reason", 
            {
                type = l_GraphQLString_0, 
                description = "Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. Formatted using the Markdown syntax, as specified by [CommonMark](https://commonmark.org/).", 
                defaultValue = "No longer supported"
            }
        }
    })
});
local v39 = v23.new({
    name = "specifiedBy", 
    description = "Exposes a URL that specifies the behaviour of this scalar.", 
    locations = {
        l_DirectiveLocation_0.SCALAR
    }, 
    args = l_Map_0.new({
        {
            "url", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                description = "The URL that specifies the behaviour of this scalar."
            }
        }
    })
});
local v40 = l_Object_0.freeze({
    v36, 
    v37, 
    v38, 
    v39
});
return {
    isDirective = isDirective, 
    assertDirective = assertDirective, 
    GraphQLDirective = v23, 
    GraphQLIncludeDirective = v36, 
    GraphQLSkipDirective = v37, 
    DEFAULT_DEPRECATION_REASON = "No longer supported", 
    GraphQLDeprecatedDirective = v38, 
    GraphQLSpecifiedByDirective = v39, 
    specifiedDirectives = v40, 
    isSpecifiedDirective = function(v41) --[[ Line: 277 ]] --[[ Name: isSpecifiedDirective ]]
        -- upvalues: l_Array_0 (copy), v40 (copy)
        return l_Array_0.some(v40, function(v42) --[[ Line: 278 ]]
            -- upvalues: v41 (copy)
            return v42.name == v41.name;
        end);
    end
};