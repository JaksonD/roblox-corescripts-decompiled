game:DefineFastFlag("SystemThemeLuaEnabled10", false);
local v0 = {};
if game:GetFastFlag("SystemThemeLuaEnabled10") then
    local l_CorePackages_0 = game:GetService("CorePackages");
    local l_Utils_0 = require(l_CorePackages_0.Workspace.Packages.SystemTheme).Utils;
    v0.ClearThemeOverride = l_Utils_0.ClearThemeOverride;
    v0.GetSystemThemeEnabled = l_Utils_0.GetSystemThemeEnabled;
    v0.GetSystemThemeEnum = l_Utils_0.GetSystemThemeEnum;
    v0.GetSystemThemeService = l_Utils_0.GetSystemThemeService;
    v0.SetDarkThemeOverride = l_Utils_0.SetDarkThemeOverride;
    v0.DeviceLevelThemeLocalStorageKey = "DeviceLevelTheme";
    return v0;
else
    local l_MessageBusService_0 = game:GetService("MessageBusService");
    local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("SystemTheme", "systemThemeSetThemeOverride");
    local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
    v0.GetSystemThemeEnabled = function() --[[ Line: 23 ]]
        return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable();
    end;
    v0.GetSystemThemeService = function() --[[ Line: 27 ]]
        return game:GetService("SystemThemeService") or nil;
    end;
    v0.GetSystemThemeEnum = function() --[[ Line: 31 ]]
        -- upvalues: l_Modules_0 (copy)
        return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable() and require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeEnum) or nil;
    end;
    v0.DeviceLevelThemeLocalStorageKey = "DeviceLevelTheme";
    v0.SetDarkThemeOverride = function() --[[ Line: 46 ]]
        -- upvalues: v0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
        if v0.GetSystemThemeEnabled() then
            l_MessageBusService_0:Publish(l_l_MessageBusService_0_MessageId_0, {
                ThemeOverride = "dark"
            });
        end;
    end;
    v0.ClearThemeOverride = function() --[[ Line: 55 ]]
        -- upvalues: v0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
        if v0.GetSystemThemeEnabled() then
            l_MessageBusService_0:Publish(l_l_MessageBusService_0_MessageId_0, {
                ThemeOverride = nil
            });
        end;
    end;
    return v0;
end;