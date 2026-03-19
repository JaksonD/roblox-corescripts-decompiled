local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameValid);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v4 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpUsername);
return function(v5, v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v9) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v4 (ref), v2 (ref), v3 (ref)
        return v1(v5, v6, v7, v8):andThen(function(v10) --[[ Line: 13 ]]
            -- upvalues: v9 (copy), v4 (ref), v6 (ref), v2 (ref)
            if (v10 and v10.responseBody and v10.responseBody.code) == 0 then
                v9:dispatch(v4(v6));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end, function(v11) --[[ Line: 22 ]]
            -- upvalues: v9 (copy), v3 (ref), v2 (ref)
            v9:dispatch(v3(v11));
            return v2.reject(v11);
        end);
    end;
end;