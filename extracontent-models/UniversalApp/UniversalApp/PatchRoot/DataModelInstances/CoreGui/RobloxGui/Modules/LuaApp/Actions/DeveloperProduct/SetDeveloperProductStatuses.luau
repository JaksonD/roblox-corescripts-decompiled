local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
return l_makeActionCreator_0(script.Name, function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v3 (copy)
    v3.isType(v4, "string", "universeId");
    v3.isType(v5, "table", "developerProductStatusesTable");
    return {
        universeId = v4, 
        developerProductStatuses = v5
    };
end);