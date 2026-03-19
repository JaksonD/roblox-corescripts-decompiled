local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AuthVerifyCredentials);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v1 (ref)
        return v2(v3, v4, v5, v6):andThen(nil, function(v8) --[[ Line: 9 ]]
            -- upvalues: v7 (copy), v1 (ref)
            v7:dispatch(v1(v8));
        end);
    end;
end;