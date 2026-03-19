local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local v11 = require(l_language_0.predicates);
local l_isTypeDefinitionNode_0 = v11.isTypeDefinitionNode;
local l_isTypeSystemDefinitionNode_0 = v11.isTypeSystemDefinitionNode;
local l_isTypeSystemExtensionNode_0 = v11.isTypeSystemExtensionNode;
local l_type_0 = l_Parent_0.type;
local l_specifiedScalarTypes_0 = require(l_type_0.scalars).specifiedScalarTypes;
local l_introspectionTypes_0 = require(l_type_0.introspection).introspectionTypes;
local v18 = {};
local v19 = nil;
local v20 = nil;
local v21 = nil;
v18.KnownTypeNamesRule = function(v22) --[[ Line: 43 ]]
    -- upvalues: l_Map_0 (copy), l_isTypeDefinitionNode_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v21 (ref), v20 (ref), l_suggestionList_0 (copy), v19 (ref), l_GraphQLError_0 (copy), l_didYouMean_0 (copy)
    local v23 = v22:getSchema();
    local v24 = l_Map_0.new();
    if v23 then
        v24 = v23:getTypeMap();
    end;
    local v25 = {};
    for _, v27 in ipairs(v22:getDocument().definitions) do
        if l_isTypeDefinitionNode_0(v27) then
            v25[v27.name.value] = true;
        end;
    end;
    local v28 = l_Array_0.concat(v24:keys(), l_Object_0.keys(v25));
    return {
        NamedType = function(_, v30, _, v32, _, v34) --[[ Line: 65 ]] --[[ Name: NamedType ]]
            -- upvalues: v24 (ref), v25 (copy), v21 (ref), v20 (ref), l_suggestionList_0 (ref), l_Array_0 (ref), v19 (ref), v28 (copy), v22 (copy), l_GraphQLError_0 (ref), l_didYouMean_0 (ref)
            local l_value_0 = v30.name.value;
            if not v24:get(l_value_0) and not v25[l_value_0] then
                local v36 = v34[3] or v32;
                local v37 = false;
                if v36 ~= nil then
                    v37 = v21(v36);
                end;
                if v37 and v20(l_value_0) then
                    return;
                else
                    local v38 = l_suggestionList_0(l_value_0, v37 and l_Array_0.concat(v19, v28) or v28);
                    v22:reportError(l_GraphQLError_0.new(("Unknown type \"%s\"."):format(l_value_0) .. l_didYouMean_0(v38), v30));
                end;
            end;
        end
    };
end;
v19 = l_Array_0.map(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0), function(v39) --[[ Line: 93 ]]
    return v39.name;
end);
v20 = function(v40) --[[ Line: 98 ]] --[[ Name: isStandardTypeName ]]
    -- upvalues: l_Array_0 (copy), v19 (ref)
    return l_Array_0.indexOf(v19, v40) ~= -1;
end;
v21 = function(v41) --[[ Line: 102 ]] --[[ Name: isSDLNode ]]
    -- upvalues: l_Array_0 (copy), l_isTypeSystemDefinitionNode_0 (copy), l_isTypeSystemExtensionNode_0 (copy)
    return not l_Array_0.isArray(v41) and (l_isTypeSystemDefinitionNode_0(v41) or l_isTypeSystemExtensionNode_0(v41));
end;
return v18;