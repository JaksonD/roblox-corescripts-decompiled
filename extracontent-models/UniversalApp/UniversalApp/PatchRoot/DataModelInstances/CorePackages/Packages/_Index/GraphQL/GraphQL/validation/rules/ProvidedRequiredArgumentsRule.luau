local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local v12 = require(l_Parent_0.type.definition);
local l_isType_0 = v12.isType;
local l_isRequiredArgument_0 = v12.isRequiredArgument;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v16 = {};
v16.ProvidedRequiredArgumentsRule = function(v17) --[[ Line: 36 ]] --[[ Name: ProvidedRequiredArgumentsRule ]]
    -- upvalues: l_Object_0 (copy), v16 (copy), l_keyMap_0 (copy), l_isRequiredArgument_0 (copy), l_inspect_0 (copy), l_GraphQLError_0 (copy)
    return l_Object_0.assign({}, v16.ProvidedRequiredArgumentsOnDirectivesRule(v17), {
        Field = {
            leave = function(_, v19) --[[ Line: 40 ]] --[[ Name: leave ]]
                -- upvalues: v17 (copy), l_keyMap_0 (ref), l_isRequiredArgument_0 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
                local v20 = v17:getFieldDef();
                if not v20 then
                    return false;
                else
                    local v21 = v19.arguments or {};
                    local v23 = l_keyMap_0(v21, function(v22) --[[ Line: 48 ]]
                        return v22.name.value;
                    end);
                    for _, v25 in ipairs(v20.args) do
                        if not v23[v25.name] and l_isRequiredArgument_0(v25) then
                            local v26 = l_inspect_0(v25.type);
                            v17:reportError(l_GraphQLError_0.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(v20.name, v25.name, v26), v19));
                        end;
                    end;
                    return;
                end;
            end
        }
    });
end;
v16.ProvidedRequiredArgumentsOnDirectivesRule = function(v27) --[[ Line: 74 ]] --[[ Name: ProvidedRequiredArgumentsOnDirectivesRule ]]
    -- upvalues: l_specifiedDirectives_0 (copy), l_keyMap_0 (copy), l_Array_0 (copy), l_isRequiredArgument_0 (copy), l_Kind_0 (copy), l_Object_0 (copy), l_isType_0 (copy), l_inspect_0 (copy), l_print_0 (copy), l_GraphQLError_0 (copy)
    local v28 = {};
    local v29 = v27:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v29 then
        l_l_specifiedDirectives_0_0 = v29:getDirectives();
    end;
    for _, v32 in ipairs(l_l_specifiedDirectives_0_0) do
        v28[v32.name] = l_keyMap_0(l_Array_0.filter(v32.args, l_isRequiredArgument_0), function(v33) --[[ Line: 85 ]]
            return v33.name;
        end);
    end;
    local l_definitions_0 = v27:getDocument().definitions;
    for _, v36 in ipairs(l_definitions_0) do
        if v36.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            local v37 = v36.arguments or {};
            v28[v36.name.value] = l_keyMap_0(l_Array_0.filter(v37, isRequiredArgumentNode), function(v38) --[[ Line: 99 ]]
                return v38.name.value;
            end);
        end;
    end;
    return {
        Directive = {
            leave = function(_, v40) --[[ Line: 109 ]] --[[ Name: leave ]]
                -- upvalues: v28 (copy), l_keyMap_0 (ref), l_Object_0 (ref), l_isType_0 (ref), l_inspect_0 (ref), l_print_0 (ref), v27 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v40.name.value;
                local v42 = v28[l_value_0];
                if v42 then
                    local v43 = v40.arguments or {};
                    local v45 = l_keyMap_0(v43, function(v44) --[[ Line: 116 ]]
                        return v44.name.value;
                    end);
                    for _, v47 in ipairs(l_Object_0.keys(v42)) do
                        if not v45[v47] then
                            local l_type_0 = v42[v47].type;
                            local v49 = l_isType_0(l_type_0) and l_inspect_0(l_type_0) or l_print_0(l_type_0);
                            v27:reportError(l_GraphQLError_0.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(l_value_0, v47, v49), v40));
                        end;
                    end;
                end;
            end
        }
    };
end;
isRequiredArgumentNode = function(v50) --[[ Line: 141 ]] --[[ Name: isRequiredArgumentNode ]]
    -- upvalues: l_Kind_0 (copy)
    local v51 = false;
    if v50.type.kind == l_Kind_0.NON_NULL_TYPE then
        v51 = v50.defaultValue == nil;
    end;
    return v51;
end;
return v16;