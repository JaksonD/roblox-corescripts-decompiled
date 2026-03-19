local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
return (v2.makeActionCreator(script.Name, function(v4) --[[ Line: 18 ]]
    return {
        salesType = v4
    };
end));