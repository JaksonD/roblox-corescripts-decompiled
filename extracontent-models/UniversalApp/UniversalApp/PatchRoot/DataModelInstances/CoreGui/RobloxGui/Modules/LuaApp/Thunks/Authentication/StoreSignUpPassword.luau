local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetPasswordValid);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v4 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpPassword);
return function(v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v5 (copy), v6 (copy), v7 (copy), v4 (ref), v2 (ref), v3 (ref)
        return v1(v5, v6, v7):andThen(function(v9) --[[ Line: 15 ]]
            -- upvalues: v8 (copy), v4 (ref), v7 (ref), v2 (ref)
            if v9 and v9.responseBody and v9.responseBody.code == 0 then
                v8:dispatch(v4(v7));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end, function(v10) --[[ Line: 23 ]]
            -- upvalues: v8 (copy), v3 (ref), v2 (ref)
            v8:dispatch(v3(v10));
            return v2.reject(v10);
        end);
    end;
end;