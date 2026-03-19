local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sproduct-experimentation-platform/v1/projects/1/layers/%s/values?parameters=%s", v1.APIS_URL, v3, table.concat(v4, ",")), "GET", {
        maxRetryCount = 0
    });
end;