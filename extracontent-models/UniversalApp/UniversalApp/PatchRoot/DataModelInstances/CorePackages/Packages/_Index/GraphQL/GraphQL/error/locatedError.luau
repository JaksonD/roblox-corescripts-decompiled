local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_instanceof_0 = v3.instanceof;
local l_inspect_0 = require(l_Parent_1.jsutils.inspect).inspect;
local _ = require(l_Parent_1.language.ast);
local l_GraphQLError_0 = require(l_Parent_0.GraphQLError).GraphQLError;
return {
    locatedError = function(v10, v11, v12) --[[ Line: 30 ]] --[[ Name: locatedError ]]
        -- upvalues: l_instanceof_0 (copy), l_Error_0 (copy), l_inspect_0 (copy), l_Array_0 (copy), l_GraphQLError_0 (copy)
        local v13 = nil;
        v13 = if l_instanceof_0(v10, l_Error_0) then v10 else if typeof(v10) == "table" and typeof(v10.message) == "string" and v10.stack ~= nil then l_Error_0.new(v10.message) else if typeof(v10) == "table" and typeof(v10.error) == "string" then l_Error_0.new("Unexpected error value: " .. l_inspect_0(v10.error)) else l_Error_0.new("Unexpected error value: " .. l_inspect_0(v10));
        if l_Array_0.isArray(v13.path) then
            return v13;
        else
            return (l_GraphQLError_0.new(v13.message, v13.nodes or v11, v13.source, v13.positions, v12, v13));
        end;
    end
};