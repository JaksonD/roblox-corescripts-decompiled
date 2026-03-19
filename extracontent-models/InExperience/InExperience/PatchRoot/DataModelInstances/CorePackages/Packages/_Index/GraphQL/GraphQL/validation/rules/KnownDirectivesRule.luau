local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_DirectiveLocation_0 = require(l_language_0.directiveLocation).DirectiveLocation;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v11 = {};
local v12 = nil;
local v13 = nil;
v11.KnownDirectivesRule = function(v14) --[[ Line: 35 ]] --[[ Name: KnownDirectivesRule ]]
    -- upvalues: l_specifiedDirectives_0 (copy), l_Kind_0 (copy), l_Array_0 (copy), l_GraphQLError_0 (copy), v12 (ref)
    local v15 = {};
    local v16 = v14:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v16 then
        l_l_specifiedDirectives_0_0 = v16:getDirectives();
    end;
    for _, v19 in ipairs(l_l_specifiedDirectives_0_0) do
        v15[v19.name] = v19.locations;
    end;
    local l_definitions_0 = v14:getDocument().definitions;
    for _, v22 in ipairs(l_definitions_0) do
        if v22.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            v15[v22.name.value] = l_Array_0.map(v22.locations, function(v23) --[[ Line: 50 ]]
                return v23.value;
            end);
        end;
    end;
    return {
        Directive = function(_, v25, _, _, _, v29) --[[ Line: 57 ]] --[[ Name: Directive ]]
            -- upvalues: v15 (copy), v14 (copy), l_GraphQLError_0 (ref), v12 (ref), l_Array_0 (ref)
            local l_value_0 = v25.name.value;
            local v31 = v15[l_value_0];
            if not v31 then
                v14:reportError(l_GraphQLError_0.new(("Unknown directive \"@%s\"."):format(l_value_0), v25));
                return;
            else
                local v32 = v12(v29);
                if v32 and l_Array_0.indexOf(v31, v32) == -1 then
                    v14:reportError(l_GraphQLError_0.new(("Directive \"@%s\" may not be used on %s."):format(l_value_0, v32), v25));
                end;
                return;
            end;
        end
    };
end;
v12 = function(v33) --[[ Line: 83 ]] --[[ Name: getDirectiveLocationForASTPath ]]
    -- upvalues: l_invariant_0 (copy), l_Array_0 (copy), l_Kind_0 (copy), v13 (ref), l_DirectiveLocation_0 (copy)
    local v34 = v33[#v33];
    l_invariant_0(not l_Array_0.isArray(v34));
    local l_kind_0 = v34.kind;
    if l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
        return v13(v34.operation);
    elseif l_kind_0 == l_Kind_0.FIELD then
        return l_DirectiveLocation_0.FIELD;
    elseif l_kind_0 == l_Kind_0.FRAGMENT_SPREAD then
        return l_DirectiveLocation_0.FRAGMENT_SPREAD;
    elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT then
        return l_DirectiveLocation_0.INLINE_FRAGMENT;
    elseif l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
        return l_DirectiveLocation_0.FRAGMENT_DEFINITION;
    elseif l_kind_0 == l_Kind_0.VARIABLE_DEFINITION then
        return l_DirectiveLocation_0.VARIABLE_DEFINITION;
    elseif l_kind_0 == l_Kind_0.SCHEMA_DEFINITION or l_kind_0 == l_Kind_0.SCHEMA_EXTENSION then
        return l_DirectiveLocation_0.SCHEMA;
    elseif l_kind_0 == l_Kind_0.SCALAR_TYPE_DEFINITION or l_kind_0 == l_Kind_0.SCALAR_TYPE_EXTENSION then
        return l_DirectiveLocation_0.SCALAR;
    elseif l_kind_0 == l_Kind_0.OBJECT_TYPE_DEFINITION or l_kind_0 == l_Kind_0.OBJECT_TYPE_EXTENSION then
        return l_DirectiveLocation_0.OBJECT;
    elseif l_kind_0 == l_Kind_0.FIELD_DEFINITION then
        return l_DirectiveLocation_0.FIELD_DEFINITION;
    elseif l_kind_0 == l_Kind_0.INTERFACE_TYPE_DEFINITION or l_kind_0 == l_Kind_0.INTERFACE_TYPE_EXTENSION then
        return l_DirectiveLocation_0.INTERFACE;
    elseif l_kind_0 == l_Kind_0.UNION_TYPE_DEFINITION or l_kind_0 == l_Kind_0.UNION_TYPE_EXTENSION then
        return l_DirectiveLocation_0.UNION;
    elseif l_kind_0 == l_Kind_0.ENUM_TYPE_DEFINITION or l_kind_0 == l_Kind_0.ENUM_TYPE_EXTENSION then
        return l_DirectiveLocation_0.ENUM;
    elseif l_kind_0 == l_Kind_0.ENUM_VALUE_DEFINITION then
        return l_DirectiveLocation_0.ENUM_VALUE;
    elseif l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION or l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION then
        return l_DirectiveLocation_0.INPUT_OBJECT;
    elseif l_kind_0 == l_Kind_0.INPUT_VALUE_DEFINITION then
        return v33[#v33 - 2].kind == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION and l_DirectiveLocation_0.INPUT_FIELD_DEFINITION or l_DirectiveLocation_0.ARGUMENT_DEFINITION;
    else
        return nil;
    end;
end;
v13 = function(v36) --[[ Line: 146 ]] --[[ Name: getDirectiveLocationForOperation ]]
    -- upvalues: l_DirectiveLocation_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    if v36 == "query" then
        return l_DirectiveLocation_0.QUERY;
    elseif v36 == "mutation" then
        return l_DirectiveLocation_0.MUTATION;
    elseif v36 == "subscription" then
        return l_DirectiveLocation_0.SUBSCRIPTION;
    else
        l_invariant_0(false, "Unexpected operation: " .. l_inspect_0(v36));
        return nil;
    end;
end;
return v11;