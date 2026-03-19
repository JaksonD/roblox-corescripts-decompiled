local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSponsoredItemsLocalWidget);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v5, v6, v7) --[[ Line: 28 ]] --[[ Name: useLocalWidgets ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v8 = {
        v3(v5, v6, v7)
    };
    v8 = v2.filter(v8, function(v9) --[[ Line: 33 ]]
        return v9.isEnabled;
    end);
    table.sort(v8, function(v10, v11) --[[ Line: 37 ]]
        return v10.row < v11.row;
    end);
    return v8;
end;