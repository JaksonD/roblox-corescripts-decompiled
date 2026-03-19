local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_print_0 = require(l_Parent_0.language.printer).print;
local l_isInputType_0 = require(l_Parent_0.type.definition).isInputType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
return {
    VariablesAreInputTypesRule = function(v5) --[[ Line: 24 ]]
        -- upvalues: l_typeFromAST_0 (copy), l_isInputType_0 (copy), l_print_0 (copy), l_GraphQLError_0 (copy)
        return {
            VariableDefinition = function(_, v7) --[[ Line: 26 ]] --[[ Name: VariableDefinition ]]
                -- upvalues: l_typeFromAST_0 (ref), v5 (copy), l_isInputType_0 (ref), l_print_0 (ref), l_GraphQLError_0 (ref)
                local v8 = l_typeFromAST_0(v5:getSchema(), v7.type);
                if v8 and not l_isInputType_0(v8) then
                    local l_value_0 = v7.variable.name.value;
                    local v10 = l_print_0(v7.type);
                    v5:reportError(l_GraphQLError_0.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(l_value_0, v10), v7.type));
                end;
            end
        };
    end
};