local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Themes.ClassicTheme);
local v2 = require(l_Modules_0.LuaApp.Themes.DeprecatedLightTheme);
local v3 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v6 = {
    dark = v3, 
    light = v2, 
    classic = v1
};
return function(v7) --[[ Line: 18 ]]
    -- upvalues: v6 (copy), l_Logging_0 (copy), v1 (copy)
    if v7 ~= nil and #v7 > 0 then
        local v8 = v6[string.lower(v7)];
        if v8 ~= nil then
            return v8;
        else
            l_Logging_0.warn("Unrecognized theme name: " .. v7);
        end;
    end;
    return v1;
end;