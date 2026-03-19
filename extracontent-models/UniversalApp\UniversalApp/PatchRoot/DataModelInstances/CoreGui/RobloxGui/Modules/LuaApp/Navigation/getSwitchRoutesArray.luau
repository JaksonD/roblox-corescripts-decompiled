local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems);
return function() --[[ Line: 7 ]] --[[ Name: getSwitchRoutesArray ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v4, _ = v3();
    return v1.List.map(v4, function(v6) --[[ Line: 9 ]]
        return v6.page;
    end);
end;