local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    KnownFragmentNamesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        return {
            FragmentSpread = function(_, v4) --[[ Line: 21 ]] --[[ Name: FragmentSpread ]]
                -- upvalues: v2 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v4.name.value;
                if not v2:getFragment(l_value_0) then
                    v2:reportError(l_GraphQLError_0.new(("Unknown fragment \"%s\"."):format(l_value_0), v4.name));
                end;
            end
        };
    end
};