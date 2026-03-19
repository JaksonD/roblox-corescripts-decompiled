local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Array_0 = v2.Array;
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
v6.serializeFetchParameter = function(v8, v9, v10) --[[ Line: 27 ]] --[[ Name: serializeFetchParameter ]]
    -- upvalues: l_Array_0 (copy), l_HttpService_0 (copy), l_InvariantError_0 (copy), l_Error_0 (copy)
    local v11 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
        -- upvalues: l_Array_0 (ref), v8 (copy), v10 (copy), v11 (ref), l_HttpService_0 (ref)
        if l_Array_0.isArray(v8) and #v8 == 0 and v10 then
            v11 = "{}";
            return;
        else
            v11 = l_HttpService_0:JSONEncode(v8);
            return;
        end;
    end);
    if not l_status_0 then
        local v14 = l_InvariantError_0.new(("Network request failed. %s is not serializable: %s"):format(v9, l_result_0));
        v14.parseError = l_Error_0.new(l_result_0);
        error(v14);
    end;
    return v11;
end;
return v6;