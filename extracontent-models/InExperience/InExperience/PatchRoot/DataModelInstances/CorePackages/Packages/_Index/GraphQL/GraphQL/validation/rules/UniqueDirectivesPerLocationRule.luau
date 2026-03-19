local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local v4 = require(l_language_0.predicates);
local l_isTypeDefinitionNode_0 = v4.isTypeDefinitionNode;
local l_isTypeExtensionNode_0 = v4.isTypeExtensionNode;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
return {
    UniqueDirectivesPerLocationRule = function(v8) --[[ Line: 27 ]]
        -- upvalues: l_specifiedDirectives_0 (copy), l_Kind_0 (copy), l_isTypeDefinitionNode_0 (copy), l_isTypeExtensionNode_0 (copy), l_GraphQLError_0 (copy)
        local v9 = {};
        local v10 = v8:getSchema();
        local v11 = if v10 then v10:getDirectives() else l_specifiedDirectives_0;
        for _, v13 in ipairs(v11) do
            v9[v13.name] = not v13.isRepeatable;
        end;
        local l_definitions_0 = v8:getDocument().definitions;
        for _, v16 in ipairs(l_definitions_0) do
            if v16.kind == l_Kind_0.DIRECTIVE_DEFINITION then
                v9[v16.name.value] = not v16.repeatable;
            end;
        end;
        local v17 = {};
        local v18 = {};
        return {
            enter = function(_, v20) --[[ Line: 50 ]] --[[ Name: enter ]]
                -- upvalues: l_Kind_0 (ref), v17 (copy), l_isTypeDefinitionNode_0 (ref), l_isTypeExtensionNode_0 (ref), v18 (copy), v9 (copy), v8 (copy), l_GraphQLError_0 (ref)
                if v20.directives == nil then
                    return;
                else
                    local v21 = nil;
                    if v20.kind == l_Kind_0.SCHEMA_DEFINITION or v20.kind == l_Kind_0.SCHEMA_EXTENSION then
                        v21 = v17;
                    elseif l_isTypeDefinitionNode_0(v20) or l_isTypeExtensionNode_0(v20) then
                        local l_value_0 = v20.name.value;
                        v21 = v18[l_value_0];
                        if v21 == nil then
                            v21 = {};
                            v18[l_value_0] = v21;
                        end;
                    else
                        v21 = {};
                    end;
                    for _, v24 in ipairs(v20.directives) do
                        local l_value_1 = v24.name.value;
                        if v9[l_value_1] then
                            if v21[l_value_1] then
                                v8:reportError(l_GraphQLError_0.new(("The directive \"@%s\" can only be used once at this location."):format(l_value_1), {
                                    v21[l_value_1], 
                                    v24
                                }));
                            else
                                v21[l_value_1] = v24;
                            end;
                        end;
                    end;
                    return;
                end;
            end
        };
    end
};