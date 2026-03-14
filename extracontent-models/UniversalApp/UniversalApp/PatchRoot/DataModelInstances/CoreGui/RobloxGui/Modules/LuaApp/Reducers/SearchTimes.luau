local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
return function(v4, v5) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v4 = v4 or {};
    if v5.type == v3.name then
        v4 = v2.Dictionary.join(v4, {
            [v5.searchUuid] = v5.searchTime
        });
    end;
    return v4;
end;