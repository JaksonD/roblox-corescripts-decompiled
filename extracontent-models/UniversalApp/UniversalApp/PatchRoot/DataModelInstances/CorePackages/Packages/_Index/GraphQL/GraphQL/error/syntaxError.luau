local l_Parent_0 = script.Parent;
local l_GraphQLError_0 = require(l_Parent_0.GraphQLError).GraphQLError;
return {
    syntaxError = function(v2, v3, v4) --[[ Line: 16 ]] --[[ Name: syntaxError ]]
        -- upvalues: l_GraphQLError_0 (copy)
        return l_GraphQLError_0.new("Syntax Error: " .. v4, nil, v2, {
            v3
        });
    end
};