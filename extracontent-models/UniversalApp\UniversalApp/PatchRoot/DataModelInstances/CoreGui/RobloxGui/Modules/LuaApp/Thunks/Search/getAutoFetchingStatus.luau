local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.Search.getAutoFetchName);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_PerformFetch_0 (copy), v2 (copy)
    return l_PerformFetch_0.GetStatus(v4, v2(v5));
end;