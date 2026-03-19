local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_NotificationService_0 = game:GetService("NotificationService");
if require(l_Modules_0.LuaApp.Flags.FFlagDebugLuaAppValidateProps) then
    _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = true;
end;
if math.random(1, 9999) <= game:DefineFastInt("LuaAppEnableReactProfilerHundredthsPercent", 0) then
    _G.__PROFILE__ = true;
end;
if require(l_Modules_0.LuaApp.Navigation.FFlagClosedStartupSequence) then
    local v5 = require(l_Modules_0.LuaApp.Navigation.createUniversalApp);
    game:BindToClose(v5());
    return;
else
    if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReactTelemetryEnabled then
        require(l_CorePackages_0.Packages.ReactTelemetry).customFields.context = "universal_app";
    end;
    if require(l_Modules_0.LuaApp.Flags.FFlagDebugLuaAppsUseDarkTheme) then
        l_NotificationService_0.SelectedTheme = "dark";
    end;
    local v6 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
    v6.default:logEventOnce("lua_app_starter_script_requires_begin");
    local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
    if l_DiscoveryAppLaunchTracker_0.isEnabled() then
        l_DiscoveryAppLaunchTracker_0.createDefault(v6.default);
        v6.default:setDurationLoggerListener(function(v8) --[[ Line: 47 ]]
            -- upvalues: l_DiscoveryAppLaunchTracker_0 (copy)
            l_DiscoveryAppLaunchTracker_0.default:onMilestoneChanged(v8);
        end);
        l_DiscoveryAppLaunchTracker_0.default:onMilestoneChanged("lua_app_starter_script_requires_begin");
    end;
    if game:DefineFastFlag("LuaAppLoadOtaPackagesOnStart2", false) then
        v6.default:logEventOnce("lua_app_starter_script_load_packages_patch_begin");
        require(l_CorePackages_0.Workspace.Packages.DiscoveryOtaPatch).DiscoveryPatcher:loadPackages();
        v6.default:logEventOnce("lua_app_starter_script_load_packages_patch_end");
    end;
    require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize();
    local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
    local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
    local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
    v9.Config.Enabled = not l_IsVRAppBuild_0();
    v9.Config.DebugKeyboardBindings = {
        [Enum.KeyCode.ButtonA] = {
            Enum.KeyCode.Space, 
            Enum.KeyCode.Return
        }, 
        [Enum.KeyCode.ButtonB] = {
            Enum.KeyCode.Backspace, 
            Enum.KeyCode.Escape
        }
    };
    require(l_CorePackages_0.Packages.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
    if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice() then
        require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize();
    end;
    local v12 = require(l_Modules_0.Common.Roact);
    local v13 = require(l_CorePackages_0.Workspace.Packages.ReactSchedulerManager);
    local v14 = require(l_Modules_0.Common.LuaErrorReporter);
    local v15 = require(l_Modules_0.Common.LuaErrorSeverity);
    local v16 = require(l_Modules_0.LuaApp.LuaAppSentryReporter);
    local v17 = require(l_Modules_0.Common.FFlagEnableSentryMigration);
    local v18 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
    local v19 = require(l_Modules_0.LuaApp.Components.UniversalApp);
    local v20 = require(l_Modules_0.LuaApp.Util.targetFramerateSetup);
    local v21 = require(l_Modules_0.LuaApp.Util.setUpVRRecenterOnResume);
    local v22 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
    local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
    local l_IXPService_0 = game:GetService("IXPService");
    local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
    local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
    local v27 = game:DefineFastFlag("DebugLuaAppThrowErrorInStarterScript", false);
    v6.default:logEventOnce("lua_app_starter_script_requires_end");
    if not UserSettings().GameSettings:InStudioMode() then
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if v22() then
            v28 = v18;
            v29 = l_ScriptContext_0.ErrorDetailed;
        end;
        if v17 then
            v30 = v16;
        end;
        local v31 = v14.new(v29, nil, v28, v15.ERROR, v30);
        v31:setCurrentApp("LuaApp");
        if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
            v31:startQueueTimers();
        end;
    end;
    local v32 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppEnableEarlyDataModelStream);
    if v32 then
        require(l_CorePackages_0.Workspace.Packages.DataModelStreaming).initDataModelStreamWsClient();
    end;
    if v27 then
        error("This is a test error raised by FFlagDebugLuaAppThrowErrorInStarterScript");
    end;
    v6.default:logEventOnce("lua_app_starter_script_wait_for_player_begin");
    if game.Players.LocalPlayer == nil then
        game.Players.PlayerAdded:Wait();
    end;
    v6.default:logEventOnce("lua_app_starter_script_wait_for_player_end");
    local v33 = nil;
    v33 = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 158 ]]
        -- upvalues: v33 (ref), l_GetDefaultQualityLevel_0 (copy)
        if v33 then
            v33:Disconnect();
        end;
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end);
    v13.startup();
    local v34 = v12.createElement(v19, {
        appName = "LuaApp"
    });
    local _ = v12.mount(v34, l_CoreGui_0, "App");
    if UserSettings().GameSettings:InStudioMode() then
        local l_l_IXPService_0_RegisteredUserLayersToStatus_0 = l_IXPService_0:GetRegisteredUserLayersToStatus();
        for v37 in l_AppUserLayers_0 do
            if not l_l_IXPService_0_RegisteredUserLayersToStatus_0[l_AppUserLayers_0[v37]] then
                warn("IXP layer has not been registered: " .. l_AppUserLayers_0[v37]);
            end;
        end;
    end;
    if l_IsVRAppBuild_0() then
        v20();
        v21();
    end;
    if not v32 then
        require(l_CorePackages_0.Workspace.Packages.DataModelStreaming).initDataModelStreamWsClient();
    end;
    l_SoundManager_0.init();
    v6.default:logEventOnce("lua_app_starter_script_end");
    return;
end;