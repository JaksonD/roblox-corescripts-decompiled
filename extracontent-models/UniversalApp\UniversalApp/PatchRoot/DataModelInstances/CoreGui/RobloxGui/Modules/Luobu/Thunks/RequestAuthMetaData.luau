local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.Luobu.Http.Requests.AuthGetMetaDataRequest);
local v4 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
return function(v5, v6, v7) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), v4 (copy)
    v2.isType(v5, "table", "networkImpl");
    v2.isType(v7, "string", "authMethod");
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v5 (copy), v7 (copy), v1 (ref), v4 (ref), v6 (copy)
        return v3(v5, v7):andThen(function(v9) --[[ Line: 14 ]]
            -- upvalues: v1 (ref)
            return v1.resolve(v9.responseBody);
        end, function(v10) --[[ Line: 16 ]]
            -- upvalues: v8 (copy), v4 (ref), v6 (ref), v1 (ref)
            v8:dispatch(v4("Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"));
            v6.Diag:reportCounter("RequestAuthMetaDataFailure", 1);
            return v1.reject(v10);
        end);
    end;
end;