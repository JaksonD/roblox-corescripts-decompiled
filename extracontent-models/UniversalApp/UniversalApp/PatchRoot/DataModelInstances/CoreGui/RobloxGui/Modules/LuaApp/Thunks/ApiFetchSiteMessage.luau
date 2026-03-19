local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.AlertsGetAlertInfo);
local v5 = require(l_Modules_0.LuaApp.Actions.ProcessSiteAlertInfoPayload);
return function(v6) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy), v3 (copy)
    return function(v7) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v6 (copy), v1 (ref), v5 (ref), v3 (ref)
        return v4(v6):andThen(function(v8) --[[ Line: 11 ]]
            -- upvalues: v1 (ref), v7 (copy), v5 (ref)
            local v9 = v1.Dictionary.join(v8.responseBody or {}, {
                timestamp = os.time()
            });
            return v7:dispatch(v5(v9));
        end, function(v10) --[[ Line: 16 ]]
            -- upvalues: v7 (copy), v5 (ref), v3 (ref)
            v7:dispatch(v5({
                timestamp = os.time()
            }));
            return v3.reject(v10);
        end);
    end;
end;