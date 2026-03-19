local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local _ = require(l_Parent_0.luaUtils.Response);
local l_HttpService_0 = game:GetService("HttpService");
local v7 = {};
local _ = require(script.Parent.Parent.core.types);
local l_throwServerError_0 = require(script.Parent.Parent.utils).throwServerError;
local v10 = require(l_Parent_0.luaUtils.hasOwnProperty);
v7.parseAndCheckHttpResponse = function(v11) --[[ Line: 34 ]] --[[ Name: parseAndCheckHttpResponse ]]
    -- upvalues: l_HttpService_0 (copy), l_Error_0 (copy), l_throwServerError_0 (copy), l_Array_0 (copy), v10 (copy)
    return function(v12) --[[ Line: 35 ]]
        -- upvalues: l_HttpService_0 (ref), l_Error_0 (ref), l_throwServerError_0 (ref), l_Array_0 (ref), v10 (ref), v11 (copy)
        return v12:text():andThen(function(v13) --[[ Line: 38 ]]
            -- upvalues: l_HttpService_0 (ref), l_Error_0 (ref), v12 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 39 ]]
                -- upvalues: l_HttpService_0 (ref), v13 (copy)
                return l_HttpService_0:JSONDecode(v13), true;
            end);
            if not l_status_0 then
                local v16 = l_Error_0.new(l_result_0);
                v16.name = "ServerParseError";
                v16.response = v12;
                v16.statusCode = v12.status;
                v16.bodyText = v13;
                error(v16);
            end;
            return l_result_0;
        end):andThen(function(v17) --[[ Line: 54 ]]
            -- upvalues: v12 (copy), l_throwServerError_0 (ref), l_Array_0 (ref), v10 (ref), v11 (ref)
            if v12.status ~= nil and v12.status >= 300 then
                l_throwServerError_0(v12, v17, ("Response not successful: Received status code %s"):format((tostring(v12.status))));
            end;
            if not l_Array_0.isArray(v17) and not v10(v17, "data") and not v10(v17, "errors") then
                l_throwServerError_0(v12, v17, ("Server response was missing for query '%s'."):format(l_Array_0.isArray(v11) and l_Array_0.join(l_Array_0.map(v11, function(v18) --[[ Line: 77 ]]
                    return v18.operationName;
                end), ", ") or v11.operationName));
            end;
            return v17;
        end);
    end;
end;
return v7;