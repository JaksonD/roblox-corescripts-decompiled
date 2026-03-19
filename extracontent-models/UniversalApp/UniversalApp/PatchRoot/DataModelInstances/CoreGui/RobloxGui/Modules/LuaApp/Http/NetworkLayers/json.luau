local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.HttpError);
local v4 = require(l_Modules_0.LuaApp.Http.HttpResponse);
return function(v5) --[[ Line: 12 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v6, v7, v8) --[[ Line: 13 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (ref), v2 (ref), v3 (ref), v4 (ref)
        return (v5(v6, v7, v8):andThen(function(v9) --[[ Line: 14 ]]
            -- upvalues: l_HttpService_0 (ref), v2 (ref), v3 (ref), v6 (copy), v4 (ref)
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v9.responseBody);
            if not l_status_0 then
                local v12 = string.format("Cannot parse : %s", v9.responseBody or "nil");
                return v2.reject(v3.new(v6, v3.Kind.InvalidJson, v12));
            else
                return v4.new(v9.requestUrl, l_result_0, v9.responseTimeMs, v9.responseCode);
            end;
        end));
    end;
end;