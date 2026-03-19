local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTile);
local v5 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.SettingsTile.useSettingsTileProps);
return v2.forwardRef(function(v6, v7) --[[ Line: 10 ]] --[[ Name: SettingsTileContainer ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v8 = v5(v6, v7);
    return v2.createElement(v4, v3.assign(v8, {
        ref = v7
    }));
end);