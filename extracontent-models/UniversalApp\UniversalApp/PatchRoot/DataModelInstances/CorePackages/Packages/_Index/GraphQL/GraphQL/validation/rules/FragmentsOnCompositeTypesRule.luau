local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_print_0 = require(l_language_0.printer).print;
local l_isCompositeType_0 = require(l_Parent_0.type.definition).isCompositeType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
return {
    FragmentsOnCompositeTypesRule = function(v6) --[[ Line: 24 ]]
        -- upvalues: l_typeFromAST_0 (copy), l_isCompositeType_0 (copy), l_print_0 (copy), l_GraphQLError_0 (copy)
        return {
            InlineFragment = function(_, v8) --[[ Line: 26 ]] --[[ Name: InlineFragment ]]
                -- upvalues: l_typeFromAST_0 (ref), v6 (copy), l_isCompositeType_0 (ref), l_print_0 (ref), l_GraphQLError_0 (ref)
                local l_typeCondition_0 = v8.typeCondition;
                if l_typeCondition_0 then
                    local v10 = l_typeFromAST_0(v6:getSchema(), l_typeCondition_0);
                    if v10 and not l_isCompositeType_0(v10) then
                        local v11 = l_print_0(l_typeCondition_0);
                        v6:reportError(l_GraphQLError_0.new(("Fragment cannot condition on non composite type \"%s\"."):format(v11), l_typeCondition_0));
                    end;
                end;
            end, 
            FragmentDefinition = function(_, v13) --[[ Line: 43 ]] --[[ Name: FragmentDefinition ]]
                -- upvalues: l_typeFromAST_0 (ref), v6 (copy), l_isCompositeType_0 (ref), l_print_0 (ref), l_GraphQLError_0 (ref)
                local v14 = l_typeFromAST_0(v6:getSchema(), v13.typeCondition);
                if v14 and not l_isCompositeType_0(v14) then
                    local v15 = l_print_0(v13.typeCondition);
                    v6:reportError(l_GraphQLError_0.new(("Fragment \"%s\" cannot condition on non composite type \"%s\"."):format(v13.name.value, v15), v13.typeCondition));
                end;
            end
        };
    end
};