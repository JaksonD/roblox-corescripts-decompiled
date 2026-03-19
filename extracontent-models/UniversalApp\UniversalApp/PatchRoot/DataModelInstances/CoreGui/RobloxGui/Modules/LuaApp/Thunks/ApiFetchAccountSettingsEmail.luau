local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountSettingsEmail);
local v4 = require(l_Modules_0.LuaApp.Actions.SetEmailNotificationCount);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_PerformFetch_0 (copy), v3 (copy), v4 (copy)
    return l_PerformFetch_0.Single("luaapp.accountsettingsapi.email", function(v6) --[[ Line: 10 ]]
        -- upvalues: v3 (ref), v5 (copy), v4 (ref)
        return v3(v5):andThen(function(v7) --[[ Line: 11 ]]
            -- upvalues: v6 (copy), v4 (ref)
            local v8 = v7.responseBody.verified == false and 1 or 0;
            v6:dispatch(v4(v8));
            return v7;
        end);
    end);
end;