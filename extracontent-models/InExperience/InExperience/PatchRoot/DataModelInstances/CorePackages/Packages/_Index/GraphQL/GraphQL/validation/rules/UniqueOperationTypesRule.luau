local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueOperationTypesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = v2:getSchema();
        local v4 = {};
        local v5 = v3 and {
            query = v3:getQueryType(), 
            mutation = v3:getMutationType(), 
            subscription = v3:getSubscriptionType()
        } or {};
        local function v13(_, v7) --[[ Line: 32 ]] --[[ Name: checkOperationTypes ]]
            -- upvalues: v4 (copy), v5 (copy), v2 (copy), l_GraphQLError_0 (ref)
            local v8 = v7.operationTypes or {};
            for _, v10 in ipairs(v8) do
                local l_operation_0 = v10.operation;
                local v12 = v4[l_operation_0];
                if v5[l_operation_0] then
                    v2:reportError(l_GraphQLError_0.new(("Type for %s already defined in the schema. It cannot be redefined."):format(l_operation_0), v10));
                elseif v12 then
                    v2:reportError(l_GraphQLError_0.new(("There can be only one %s type in schema."):format(l_operation_0), {
                        v12, 
                        v10
                    }));
                else
                    v4[l_operation_0] = v10;
                end;
            end;
            return false;
        end;
        return {
            SchemaDefinition = v13, 
            SchemaExtension = v13
        };
    end
};