local v0 = game:DefineFastInt("SystemThemeSnapshotTimeDiffMins", 1440);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeEnum);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v7 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v8 = {};
v8.__index = v8;
local v9 = game:DefineFastInt("DeviceLevelThemeAnalyticsHundredthsPercent", 10000);
v8.EventName = {
    ThemeSnapshot = "DeviceThemeSnapshot", 
    ThemeChanged = "DeviceThemeChanged", 
    SystemThemeRequest = "SystemThemeRequestCounter", 
    SystemThemeObtainedSuccess = "SystemThemeLuaObtainedSuccess", 
    SystemThemeObtainedError = "SystemThemeLuaObtainedError", 
    SystemThemeUpdated = "SystemThemeUpdated", 
    SystemThemeChangeRequest = "SystemThemeAppChange"
};
v8.ThemeName = {
    ThemeSystemDark = "SystemDark", 
    ThemeSystemLight = "SystemLight", 
    ThemeSystem = "System", 
    ThemeDark = "Dark", 
    ThemeLight = "Light"
};
v8.onThemeSnapshot = function(v10, v11) --[[ Line: 39 ]] --[[ Name: onThemeSnapshot ]]
    -- upvalues: l_AppStorageService_0 (copy), v0 (copy), v8 (copy), v7 (copy), v9 (copy), v5 (copy), v4 (copy)
    if not game:GetEngineFeature("SystemThemeSnapshotTimeKeyAvailble") then
        return;
    else
        local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("DeviceLevelThemeSnapshotTimestamp");
        if l_l_AppStorageService_0_Item_0 == "" then
            l_AppStorageService_0:SetItem("DeviceLevelThemeSnapshotTimestamp", (tostring(l_UnixTimestamp_0)));
            l_AppStorageService_0:Flush();
            return;
        else
            if (tonumber(l_UnixTimestamp_0) or 0) - (tonumber(l_l_AppStorageService_0_Item_0) or 0) > v0 * 60 then
                local v14 = {
                    eventName = v8.EventName.ThemeSnapshot, 
                    backends = {
                        v7.TelemetryBackends.EventIngest
                    }, 
                    throttlingPercentage = v9, 
                    lastUpdated = {
                        2025, 
                        5, 
                        13
                    }, 
                    description = "Event sent once a day to show the current selected theme", 
                    links = ""
                };
                local v15 = nil;
                if v5() then
                    v15 = v8.ThemeName[v11];
                else
                    v15 = v8.ThemeName.ThemeSystem;
                    if v11 == v4.Light then
                        v15 = v8.ThemeName.ThemeLight;
                    elseif v11 == v4.Dark then
                        v15 = v8.ThemeName.ThemeDark;
                    end;
                end;
                local v16 = {
                    selectedTheme = v15
                };
                v10.telemetryService:LogEvent(v14, {
                    customFields = v16
                });
                l_AppStorageService_0:SetItem("DeviceLevelThemeSnapshotTimestamp", (tostring(l_UnixTimestamp_0)));
                l_AppStorageService_0:Flush();
            end;
            return;
        end;
    end;
end;
v8.onThemeChanged = function(v17, v18) --[[ Line: 89 ]] --[[ Name: onThemeChanged ]]
    -- upvalues: v8 (copy), v7 (copy), v9 (copy), v4 (copy)
    local v19 = {
        eventName = v8.EventName.ThemeChanged, 
        backends = {
            v7.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v9, 
        lastUpdated = {
            2025, 
            5, 
            13
        }, 
        description = "Event sent when the selected theme has been changed", 
        links = ""
    };
    local l_ThemeSystem_0 = v8.ThemeName.ThemeSystem;
    if v18 == v4.Light then
        l_ThemeSystem_0 = v8.ThemeName.ThemeLight;
    elseif v18 == v4.Dark then
        l_ThemeSystem_0 = v8.ThemeName.ThemeDark;
    end;
    local v21 = {
        selectedTheme = l_ThemeSystem_0
    };
    v17.telemetryService:LogEvent(v19, {
        customFields = v21
    });
end;
v8.onReceivedSystemThemeUpdated = function(v22) --[[ Line: 112 ]] --[[ Name: onReceivedSystemThemeUpdated ]]
    -- upvalues: v8 (copy)
    local v23 = {
        eventName = v8.EventName.SystemThemeUpdated, 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2025, 
            5, 
            13
        }, 
        description = "Counter to be updated when lua receives a notification from the native layer that the system theme is updated"
    };
    v22.telemetryService:LogCounter(v23);
end;
v8.onRequestSystemTheme = function(v24) --[[ Line: 122 ]] --[[ Name: onRequestSystemTheme ]]
    -- upvalues: v8 (copy)
    local v25 = {
        eventName = v8.EventName.SystemThemeRequest, 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2025, 
            5, 
            13
        }, 
        description = "Counter to be updated when lua requests the system theme from the native layer"
    };
    v24.telemetryService:LogCounter(v25);
end;
v8.onGetSystemTheme = function(v26, v27) --[[ Line: 132 ]] --[[ Name: onGetSystemTheme ]]
    -- upvalues: v4 (copy), v8 (copy)
    if v27 == v4.Error then
        local v28 = {
            eventName = v8.EventName.SystemThemeObtainedError, 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2025, 
                5, 
                13
            }, 
            description = "Counter to be updated when lua receives an error for system theme value from the native layer"
        };
        v26.telemetryService:LogCounter(v28);
        return;
    else
        local v29 = {
            eventName = v8.EventName.SystemThemeObtainedSuccess, 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2025, 
                5, 
                13
            }, 
            description = "Counter to be updated when lua receives the system theme value from the native layer"
        };
        v26.telemetryService:LogCounter(v29);
        return;
    end;
end;
v8.onSetNativeTheme = function(v30) --[[ Line: 152 ]] --[[ Name: onSetNativeTheme ]]
    -- upvalues: v8 (copy)
    local v31 = {
        eventName = v8.EventName.SystemThemeChangeRequest, 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2025, 
            5, 
            13
        }, 
        description = "Counter to be updated when lua send the native layer a set theme"
    };
    v30.telemetryService:LogCounter(v31);
end;
v8.new = function(v32) --[[ Line: 162 ]]
    -- upvalues: v8 (copy)
    local v33 = {
        telemetryService = v32
    };
    setmetatable(v33, v8);
    return v33;
end;
return v8;