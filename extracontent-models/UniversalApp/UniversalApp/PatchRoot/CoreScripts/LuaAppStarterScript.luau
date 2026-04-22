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
    local v17 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
    local v18 = require(l_Modules_0.LuaApp.Components.UniversalApp);
    local v19 = require(l_Modules_0.LuaApp.Util.targetFramerateSetup);
    local v20 = require(l_Modules_0.LuaApp.Util.setUpVRRecenterOnResume);
    local v21 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
    local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
    local l_IXPService_0 = game:GetService("IXPService");
    local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
    local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
    local v26 = game:DefineFastInt("EnableSentryUARolloutPercentage", 0);
    local v27 = math.random(1, 100) <= math.clamp(v26, 0, 100);
    local v28 = game:DefineFastFlag("DebugLuaAppThrowErrorInStarterScript", false);
    v6.default:logEventOnce("lua_app_starter_script_requires_end");
    if not UserSettings().GameSettings:InStudioMode() then
        local v29 = nil;
        local v30 = nil;
        local v31 = nil;
        if v21() then
            v29 = v17;
            v30 = l_ScriptContext_0.ErrorDetailed;
        end;
        if v27 then
            v31 = v16;
            v30 = l_ScriptContext_0.ErrorDetailed;
        end;
        local v32 = v14.new(v30, nil, v29, v15.ERROR, v31);
        v32:setCurrentApp("LuaApp");
        if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
            v32:startQueueTimers();
        end;
    end;
    local v33 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppEnableEarlyDataModelStream);
    if v33 then
        require(l_CorePackages_0.Workspace.Packages.DataModelStreaming).initDataModelStreamWsClient();
    end;
    if v28 then
        error("This is a test error raised by FFlagDebugLuaAppThrowErrorInStarterScript");
    end;
    v6.default:logEventOnce("lua_app_starter_script_wait_for_player_begin");
    if game.Players.LocalPlayer == nil then
        game.Players.PlayerAdded:Wait();
    end;
    v6.default:logEventOnce("lua_app_starter_script_wait_for_player_end");
    local v34 = nil;
    v34 = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 161 ]]
        -- upvalues: v34 (ref), l_GetDefaultQualityLevel_0 (copy)
        if v34 then
            v34:Disconnect();
        end;
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end);
    v13.startup();
    local v35 = v12.createElement(v18, {
        appName = "LuaApp"
    });
    local _ = v12.mount(v35, l_CoreGui_0, "App");
    if UserSettings().GameSettings:InStudioMode() then
        local l_l_IXPService_0_RegisteredUserLayersToStatus_0 = l_IXPService_0:GetRegisteredUserLayersToStatus();
        for v38 in l_AppUserLayers_0 do
            if not l_l_IXPService_0_RegisteredUserLayersToStatus_0[l_AppUserLayers_0[v38]] then
                warn("IXP layer has not been registered: " .. l_AppUserLayers_0[v38]);
            end;
        end;
    end;
    if l_IsVRAppBuild_0() then
        v19();
        v20();
    end;
    if not v33 then
        require(l_CorePackages_0.Workspace.Packages.DataModelStreaming).initDataModelStreamWsClient();
    end;
    l_SoundManager_0.init();
    if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDebugForceConsoleSafeInsets and UserSettings().GameSettings:InStudioMode() then
        require(l_CorePackages_0.Workspace.Packages.Display).GetDisplayStore().forceConsoleSafeInsets();
    end;
    if not require(l_Modules_0.LuaApp.Flags.FFlagProfilePlatformGranularExports) then
        require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
    end;
    if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA and require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility.EmoteUtilitySupportAJU then
        game:GetService("StarterPlayer").AvatarJointUpgrade = Enum.RolloutState.Enabled;
    end;
    local v39 = game:DefineFastFlag("EnableCorescriptTrackerForLuaApp", false);
    if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMemoryTrackerUnification then
        local v40 = require(l_CorePackages_0.Workspace.Packages.Memory);
        if v39 then
            v40.start(true, nil, v40.MemoryScope.UniversalApp);
        else
            v40.start(false);
        end;
    end;
    v6.default:logEventOnce("lua_app_starter_script_end");
    return;
end;