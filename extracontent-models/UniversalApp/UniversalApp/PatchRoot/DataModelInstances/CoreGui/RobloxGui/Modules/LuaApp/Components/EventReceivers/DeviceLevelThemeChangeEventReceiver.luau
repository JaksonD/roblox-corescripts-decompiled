local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("SystemTheme", "systemThemeSetTheme");
local l_l_MessageBusService_0_MessageId_1 = l_MessageBusService_0:GetMessageId("SystemTheme", "systemThemeSetThemeOverride");
local l_l_MessageBusService_0_MessageId_2 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_CorePackages_0.Packages.Roact);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.Cryo);
local v15 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default;
local l_ThemeContext_0 = require(l_CorePackages_0.Workspace.Packages.Style).ThemeContext;
local v18 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local v19 = require(l_Modules_0.LuaApp.Components.EventReceivers.Analytics.DeviceLevelThemeAnalytics);
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local v21 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v22 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagDefaultThemeEnabled);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseNonYieldGetSystemTheme);
local v28 = require(l_Modules_0.LuaApp.Components.EventReceivers.GetSystemTheme);
local v29 = v12.Component:extend("DeviceLevelThemeUpdater");
v29.init = function(v30) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), l_TelemetryService_0 (copy), v18 (copy), l_Logger_0 (copy), v15 (copy), l_NotificationService_0 (copy), v21 (copy), v26 (copy), l_HttpService_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), l_l_MessageBusService_0_MessageId_1 (copy), l_l_MessageBusService_0_MessageId_2 (copy), l_IXPServiceWrapper_0 (copy), v28 (copy), v25 (copy)
    v30.deviceLevelThemeAnalytics = v30.props.deviceLevelThemeAnalytics or v19.new(l_TelemetryService_0);
    v30.getCachedDeviceLevelThemeName = function() --[[ Line: 51 ]]
        -- upvalues: v30 (copy), v18 (ref), l_Logger_0 (ref)
        local l_localUserId_0 = v30.props.localUserId;
        local l_result_0 = v30.props.appStorageJsonCacheUtils:decodeInternal(v18.DeviceLevelThemeLocalStorageKey).result;
        local v33 = l_result_0 and l_result_0[l_localUserId_0] or nil;
        l_Logger_0:info("Cached device level theme name: " .. tostring(v33) .. " for userId: " .. tostring(l_localUserId_0));
        return v33 ~= "" and v33 or nil;
    end;
    v30.getCachedThemeName = function() --[[ Line: 70 ]]
        -- upvalues: v15 (ref), l_Logger_0 (ref), v30 (copy)
        local v34 = v15.getAuthenticatedTheme();
        l_Logger_0:info("Cached theme name: " .. tostring(v34) .. " for userId: " .. tostring(v30.props.localUserId));
        return v34 ~= "" and v34 or nil;
    end;
    v30.changeAppTheme = function(v35) --[[ Line: 92 ]]
        -- upvalues: v30 (copy), l_Logger_0 (ref), l_NotificationService_0 (ref), v21 (ref)
        v30.currentAppThemeName = v35;
        local v36 = v30.themeOverride or v35;
        l_Logger_0:info("Changing app theme to " .. v36);
        v30.deviceLevelThemeAnalytics:onSetNativeTheme();
        l_NotificationService_0.SelectedTheme = v36;
        v30.props.themeContext.setTheme(v36);
        v21:updateSharedAttributes({
            AppTheme = v36
        });
    end;
    v30.setTheme = function(v37) --[[ Line: 111 ]]
        -- upvalues: v30 (copy), l_Logger_0 (ref), v26 (ref), v18 (ref), l_HttpService_0 (ref)
        if v37 == v30.props.systemThemeEnum.Error then
            l_Logger_0:error("Received an error theme enum, not setting theme");
            return;
        elseif v30.currentThemeEnum == v37 then
            l_Logger_0:info("Theme is already set to " .. v37.Name);
            return;
        else
            l_Logger_0:info("Setting theme to " .. v37.Name);
            if not v26() then
                v30.deviceLevelThemeAnalytics:onThemeChanged(v37);
            end;
            v30.currentThemeEnum = v37;
            if v30.props.systemThemeEnum.isLightTheme(v37) then
                v30.changeAppTheme(v30.props.systemThemeEnum.Light.Name);
            elseif v30.props.systemThemeEnum.isDarkTheme(v37) then
                v30.changeAppTheme(v30.props.systemThemeEnum.Dark.Name);
            end;
            local l_localUserId_1 = v30.props.localUserId;
            local v39 = v30.props.appStorageJsonCacheUtils:decodeInternal(v18.DeviceLevelThemeLocalStorageKey).result or {};
            v39[l_localUserId_1] = v37.Name;
            l_Logger_0:info("Caching device level theme name: " .. v37.Name .. " for userId: " .. tostring(l_localUserId_1));
            v30.props.appStorageService:SetItem(v18.DeviceLevelThemeLocalStorageKey, l_HttpService_0:JSONEncode(v39));
            v30.props.appStorageService:flush();
            return;
        end;
    end;
    if v30.props.systemThemeService then
        local v40 = v30.props.messageBusService or l_MessageBusService_0;
        v30.connections = {
            v30.props.systemThemeService.OnLuaThemeUpdated:Connect(function(v41) --[[ Line: 153 ]]
                -- upvalues: l_Logger_0 (ref), v30 (copy)
                l_Logger_0:info("Received OnLuaThemeUpdated event with themeEnum: " .. v41.Name);
                v30.deviceLevelThemeAnalytics:onReceivedSystemThemeUpdated();
                if v30.props.systemThemeEnum.isSystemTheme(v30.currentThemeEnum) then
                    v30.props.systemThemeService:setTheme(v41);
                end;
            end), 
            v40:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v42) --[[ Line: 161 ]]
                -- upvalues: l_Logger_0 (ref), v30 (copy)
                local l_SystemTheme_0 = v42.SystemTheme;
                l_Logger_0:info("Received MESSAGE_SET_THEME_EVENT_ID event with themeEnumValue: " .. l_SystemTheme_0);
                local v44 = v30.props.systemThemeEnum.getSystemThemeEnum(l_SystemTheme_0);
                v30.setTheme(v44);
            end, false, true), 
            v40:Subscribe(l_l_MessageBusService_0_MessageId_1, function(v45) --[[ Line: 168 ]]
                -- upvalues: l_Logger_0 (ref), v30 (copy)
                l_Logger_0:info("Received MESSAGE_SET_THEME_OVERRIDE_EVENT_ID event with themeEnumValue: " .. tostring(v45.ThemeOverride));
                v30.themeOverride = v45.ThemeOverride;
                if v30.currentAppThemeName then
                    v30.changeAppTheme(v30.currentAppThemeName);
                end;
            end, false, true), 
            v40:Subscribe(l_l_MessageBusService_0_MessageId_2, function() --[[ Line: 179 ]]
                -- upvalues: v30 (copy)
                v30.deviceLevelThemeAnalytics:onThemeSnapshot(v30.currentThemeEnum);
            end, false, true)
        };
    end;
    v30.getDefaultDeviceLevelTheme = function(v46) --[[ Line: 186 ]]
        -- upvalues: v30 (copy), l_Logger_0 (ref), l_IXPServiceWrapper_0 (ref), v28 (ref)
        local l_ixpDefaultThemeSelection_0 = v30.props.ixpDefaultThemeSelection;
        if v30.props.ixpDefaultThemeEnabled and l_ixpDefaultThemeSelection_0 and l_ixpDefaultThemeSelection_0 ~= "" then
            l_Logger_0:info("No cached theme found, using default theme from IXP: " .. tostring(l_ixpDefaultThemeSelection_0));
            (v30.props.IXPServiceWrapper or l_IXPServiceWrapper_0):LogFlagLinkedUserLayerExposure("DefaultThemeLayerValues");
            if l_ixpDefaultThemeSelection_0 == "system" then
                v30.deviceLevelThemeAnalytics:onRequestSystemTheme();
                local v48 = v30.props.systemThemeService and v28(v30.props.systemThemeService) or v30.props.systemThemeEnum.Error;
                v30.deviceLevelThemeAnalytics:onGetSystemTheme(v48);
                return v48;
            else
                return v30.props.systemThemeEnum.getSystemThemeEnum(l_ixpDefaultThemeSelection_0);
            end;
        elseif not v46 then
            l_Logger_0:info("No cached theme found, defaulting to light theme");
            return v30.props.systemThemeEnum.Light;
        else
            l_Logger_0:info("Found cached theme " .. v46);
            return v30.props.systemThemeEnum.getSystemThemeEnum(v46);
        end;
    end;
    v30.initTheme = function() --[[ Line: 214 ]]
        -- upvalues: v30 (copy), v25 (ref), l_Logger_0 (ref), v28 (ref)
        local v49 = v30.getCachedDeviceLevelThemeName();
        local v50 = nil;
        if not v49 then
            local v51 = v30.getCachedThemeName();
            if v25() then
                v50 = v30.getDefaultDeviceLevelTheme(v51);
            elseif not v51 then
                l_Logger_0:info("No cached theme found, defaulting to light theme");
                v50 = v30.props.systemThemeEnum.Light;
            else
                l_Logger_0:info("Found cached theme " .. v51);
                v50 = v30.props.systemThemeEnum.getSystemThemeEnum(v51);
            end;
        else
            l_Logger_0:info("Found cached device level theme " .. v49);
            v50 = v30.props.systemThemeEnum.getSystemThemeEnum(v49);
            if v30.props.systemThemeEnum.isSystemTheme(v50) then
                v30.deviceLevelThemeAnalytics:onRequestSystemTheme();
                v50 = v30.props.systemThemeService and v28(v30.props.systemThemeService) or v30.props.systemThemeEnum.Error;
                v30.deviceLevelThemeAnalytics:onGetSystemTheme(v50);
            end;
        end;
        if v30.props.systemThemeService and v50 then
            v30.deviceLevelThemeAnalytics:onThemeSnapshot(v50);
            v30.deviceLevelThemeAnalytics:onSetNativeTheme();
            v30.props.systemThemeService:setTheme(v50);
        end;
    end;
end;
v29.render = function(v52) --[[ Line: 261 ]] --[[ Name: render ]]
    -- upvalues: l_Logger_0 (copy), v25 (copy), v27 (copy)
    local l_localUserId_2 = v52.props.localUserId;
    if l_localUserId_2 == nil or l_localUserId_2 == "" or l_localUserId_2 == "-1" or l_localUserId_2 == "0" then
        l_Logger_0:info("userId is not available. Default to light theme");
        v52.changeAppTheme(v52.props.systemThemeEnum.Light.Name);
    else
        l_Logger_0:info("initTheme for userId " .. tostring(v52.props.localUserId));
        if v25() then
            if v27() then
                v52.initTheme();
            else
                task.spawn(v52.initTheme);
            end;
        else
            v52.initTheme();
        end;
    end;
    return nil;
end;
v29.willUnmount = function(v54) --[[ Line: 282 ]] --[[ Name: willUnmount ]]
    for _, v56 in pairs(v54.connections) do
        v56:disconnect();
    end;
end;
return function(v57) --[[ Line: 288 ]] --[[ Name: DeviceLevelThemeChangeEventReceiver ]]
    -- upvalues: v13 (copy), l_ThemeContext_0 (copy), l_AppStorageService_0 (copy), l_default_0 (copy), v18 (copy), l_MessageBusService_0 (copy), l_useLocalUserId_0 (copy), v25 (copy), v22 (copy), l_AppBtidLayers_0 (copy), v12 (copy), v29 (copy), v14 (copy)
    local v58 = v13.useContext(l_ThemeContext_0);
    local v59 = v57.AppStorageService or l_AppStorageService_0;
    local v60 = v57.AppStorageJsonCacheUtils or l_default_0;
    local v61 = v57.SystemThemeEnum or v18.GetSystemThemeEnum();
    local v62 = v57.SystemThemeService or v18.GetSystemThemeService();
    local v63 = v57.messageBusService or l_MessageBusService_0;
    local v64 = l_useLocalUserId_0();
    local v67 = if v25() then v22.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.DefaultThemeLayer
    }, function(v65) --[[ Line: 300 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v66 = v65[l_AppBtidLayers_0.DefaultThemeLayer] or {};
        return {
            IxpDefaultThemeSelection = v66.DefaultThemeSelection, 
            IxpDefaultThemeEnabled = v66.DefaultThemeEnabled
        };
    end) else {};
    local l_IxpDefaultThemeSelection_0 = v67.IxpDefaultThemeSelection;
    local l_IxpDefaultThemeEnabled_0 = v67.IxpDefaultThemeEnabled;
    return v12.createElement(v29, v14.Dictionary.join(v57, {
        themeContext = v58, 
        appStorageService = v59, 
        appStorageJsonCacheUtils = v60, 
        systemThemeEnum = v61, 
        systemThemeService = v62, 
        messageBusService = v63, 
        localUserId = v64, 
        ixpDefaultThemeSelection = l_IxpDefaultThemeSelection_0, 
        ixpDefaultThemeEnabled = l_IxpDefaultThemeEnabled_0
    }));
end;