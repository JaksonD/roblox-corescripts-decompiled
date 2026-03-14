local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetShareLinkMetaData);
local l_HttpService_0 = game:GetService("HttpService");
return function(v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), v1 (copy)
    return v2(v4, v5, v6):andThen(function(v7) --[[ Line: 7 ]]
        -- upvalues: l_HttpService_0 (ref), v1 (ref)
        if v7 and v7.responseBody and v7.responseBody.data then
            local v8 = l_HttpService_0:JSONDecode(v7.responseBody.data);
            return v1.resolve(v8);
        else
            return v1.reject();
        end;
    end, function(v9) --[[ Line: 14 ]]
        -- upvalues: v1 (ref)
        return v1.reject({
            v9.StatusCode
        });
    end);
end;