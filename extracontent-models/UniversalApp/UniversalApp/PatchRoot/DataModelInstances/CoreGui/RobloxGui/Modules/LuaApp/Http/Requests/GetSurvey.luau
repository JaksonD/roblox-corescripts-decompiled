local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.Promise);
return function(v5) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v4 (copy), l_Logging_0 (copy)
    return v5(string.format("%sv1/survey", v1.APIS_URL), "GET"):andThen(function(v6) --[[ Line: 21 ]]
        -- upvalues: v4 (ref)
        return v4.resolve(v6.responseBody);
    end, function(v7) --[[ Line: 23 ]]
        -- upvalues: l_Logging_0 (ref), v4 (ref)
        l_Logging_0.warn(string.format("ResponseCode: %s", (tostring(v7.responseCode))));
        return v4.reject(v7);
    end);
end;