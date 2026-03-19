local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    SingleFieldSubscriptionsRule = function(v4) --[[ Line: 23 ]]
        -- upvalues: l_GraphQLError_0 (copy), l_Array_0 (copy)
        return {
            OperationDefinition = function(_, v6) --[[ Line: 25 ]] --[[ Name: OperationDefinition ]]
                -- upvalues: v4 (copy), l_GraphQLError_0 (ref), l_Array_0 (ref)
                if v6.operation == "subscription" and #v6.selectionSet.selections ~= 1 then
                    v4:reportError(l_GraphQLError_0.new(v6.name and ("Subscription \"%s\" must select only one top level field."):format(v6.name.value) or "Anonymous Subscription must select only one top level field.", l_Array_0.slice(v6.selectionSet.selections, 2)));
                end;
            end
        };
    end
};