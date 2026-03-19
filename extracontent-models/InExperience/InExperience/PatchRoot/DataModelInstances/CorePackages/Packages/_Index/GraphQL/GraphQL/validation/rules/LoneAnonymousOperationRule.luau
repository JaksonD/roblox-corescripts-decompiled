local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
return {
    LoneAnonymousOperationRule = function(v6) --[[ Line: 26 ]]
        -- upvalues: l_Array_0 (copy), l_Kind_0 (copy), l_GraphQLError_0 (copy)
        local v7 = 0;
        return {
            Document = function(_, v9) --[[ Line: 29 ]] --[[ Name: Document ]]
                -- upvalues: v7 (ref), l_Array_0 (ref), l_Kind_0 (ref)
                v7 = #l_Array_0.filter(v9.definitions, function(v10) --[[ Line: 30 ]]
                    -- upvalues: l_Kind_0 (ref)
                    return v10.kind == l_Kind_0.OPERATION_DEFINITION;
                end);
            end, 
            OperationDefinition = function(_, v12) --[[ Line: 34 ]] --[[ Name: OperationDefinition ]]
                -- upvalues: v7 (ref), v6 (copy), l_GraphQLError_0 (ref)
                if not v12.name and v7 > 1 then
                    v6:reportError(l_GraphQLError_0.new("This anonymous operation must be the only defined operation.", v12));
                end;
            end
        };
    end
};