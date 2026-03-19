local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueArgumentNamesRule = function(v2) --[[ Line: 20 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        return {
            Field = function() --[[ Line: 24 ]] --[[ Name: Field ]]
                -- upvalues: v3 (ref)
                v3 = {};
            end, 
            Directive = function() --[[ Line: 27 ]] --[[ Name: Directive ]]
                -- upvalues: v3 (ref)
                v3 = {};
            end, 
            Argument = function(_, v5) --[[ Line: 30 ]] --[[ Name: Argument ]]
                -- upvalues: v3 (ref), v2 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v5.name.value;
                if v3[l_value_0] then
                    v2:reportError(l_GraphQLError_0.new(("There can be only one argument named \"%s\"."):format(l_value_0), {
                        v3[l_value_0], 
                        v5.name
                    }));
                else
                    v3[l_value_0] = v5.name;
                end;
                return false;
            end
        };
    end
};