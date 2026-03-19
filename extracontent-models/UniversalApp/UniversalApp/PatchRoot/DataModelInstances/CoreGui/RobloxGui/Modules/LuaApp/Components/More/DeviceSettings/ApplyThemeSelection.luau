local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script.Parent;
local l_DeviceLevelThemeKey_0 = require(l_Parent_0.DeviceSettingsPageContentConstants).DeviceLevelThemeKey;
local v5 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local v6 = v5.GetSystemThemeService();
local v7 = v5.GetSystemThemeEnum();
local v8 = require(l_Modules_0.LuaApp.Components.EventReceivers.Analytics.DeviceLevelThemeAnalytics);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v10 = require(l_Modules_0.LuaApp.Components.EventReceivers.GetSystemTheme);
return function(v11, v12) --[[ Line: 26 ]] --[[ Name: applyThemeSelection ]]
    -- upvalues: v6 (copy), v7 (copy), l_TelemetryService_0 (copy), v8 (copy), l_DeviceLevelThemeKey_0 (copy), v10 (copy), l_Logger_0 (copy)
    local v13 = v12 or {};
    local v14 = v13.systemThemeService or v6;
    local v15 = v13.systemThemeEnum or v7;
    local v16 = v13.telemetryService or l_TelemetryService_0;
    local v17 = v13.deviceLevelThemeAnalyticsClass or v8;
    local v18 = nil;
    if v11 == l_DeviceLevelThemeKey_0.System then
        v18 = v14 and v10(v14) or nil;
    elseif v11 == l_DeviceLevelThemeKey_0.Light then
        v18 = v15 and v15.Light or nil;
    elseif v11 == l_DeviceLevelThemeKey_0.Dark then
        v18 = v15 and v15.Dark or nil;
    end;
    l_Logger_0:info("The user selected theme: " .. v11 .. ". Setting theme to: " .. tostring(v18));
    if v18 then
        v17.new(v16):onThemeChanged(v18);
    end;
    if v14 and v18 then
        v14:setTheme(v18);
    end;
end;