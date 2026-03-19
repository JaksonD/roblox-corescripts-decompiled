local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v12 = {};
v12.KnownArgumentNamesRule = function(v13) --[[ Line: 31 ]] --[[ Name: KnownArgumentNamesRule ]]
    -- upvalues: l_Object_0 (copy), v12 (copy), l_Array_0 (copy), l_suggestionList_0 (copy), l_GraphQLError_0 (copy), l_didYouMean_0 (copy)
    return l_Object_0.assign({}, v12.KnownArgumentNamesOnDirectivesRule(v13), {
        Argument = function(_, v15) --[[ Line: 33 ]] --[[ Name: Argument ]]
            -- upvalues: v13 (copy), l_Array_0 (ref), l_suggestionList_0 (ref), l_GraphQLError_0 (ref), l_didYouMean_0 (ref)
            local v16 = v13:getArgument();
            local v17 = v13:getFieldDef();
            local v18 = v13:getParentType();
            if not v16 and v17 and v18 then
                local l_value_0 = v15.name.value;
                local v21 = l_Array_0.map(v17.args, function(v20) --[[ Line: 40 ]]
                    return v20.name;
                end);
                local v22 = l_suggestionList_0(l_value_0, v21);
                v13:reportError(l_GraphQLError_0.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(l_value_0, v18.name, v17.name) .. l_didYouMean_0(v22), v15));
            end;
        end
    });
end;
v12.KnownArgumentNamesOnDirectivesRule = function(v23) --[[ Line: 62 ]] --[[ Name: KnownArgumentNamesOnDirectivesRule ]]
    -- upvalues: l_specifiedDirectives_0 (copy), l_Array_0 (copy), l_Kind_0 (copy), l_suggestionList_0 (copy), l_GraphQLError_0 (copy), l_didYouMean_0 (copy)
    local v24 = {};
    local v25 = v23:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v25 then
        l_l_specifiedDirectives_0_0 = v25:getDirectives();
    end;
    for _, v28 in ipairs(l_l_specifiedDirectives_0_0) do
        v24[v28.name] = l_Array_0.map(v28.args, function(v29) --[[ Line: 71 ]]
            return v29.name;
        end);
    end;
    local l_definitions_0 = v23:getDocument().definitions;
    for _, v32 in ipairs(l_definitions_0) do
        if v32.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            local v33 = v32.arguments or {};
            v24[v32.name.value] = l_Array_0.map(v33, function(v34) --[[ Line: 82 ]]
                return v34.name.value;
            end);
        end;
    end;
    return {
        Directive = function(_, v36) --[[ Line: 89 ]] --[[ Name: Directive ]]
            -- upvalues: v24 (copy), l_Array_0 (ref), l_suggestionList_0 (ref), v23 (copy), l_GraphQLError_0 (ref), l_didYouMean_0 (ref)
            local l_value_1 = v36.name.value;
            local v38 = v24[l_value_1];
            if v36.arguments and v38 then
                for _, v40 in ipairs(v36.arguments) do
                    local l_value_2 = v40.name.value;
                    if l_Array_0.indexOf(v38, l_value_2) == -1 then
                        local v42 = l_suggestionList_0(l_value_2, v38);
                        v23:reportError(l_GraphQLError_0.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(l_value_2, l_value_1) .. l_didYouMean_0(v42), v40));
                    end;
                end;
            end;
            return false;
        end
    };
end;
return v12;