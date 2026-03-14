local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v12 = UserSettings();
local l_GameSettings_0 = v12.GameSettings;
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_UserGameSettings_0 = v12:GetService("UserGameSettings");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local v17 = nil;
local l_TextChatService_0 = game:GetService("TextChatService");
local l_SafetyService_0 = game:GetService("SafetyService");
local v20 = nil;
if game:GetEngineFeature("CaptureModeEnabled") then
    v20 = game:GetService("ExperienceStateCaptureService");
end;
local v21 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v23 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagIEMSettingsGroups);
local v24 = nil;
if v21() or l_isInExperienceUIVREnabled_0 then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v24 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local v26 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v27 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v28 = nil;
local v29 = nil;
if v23 then
    v28 = require(l_RobloxGui_0.Modules.Settings.Components.renderSettingsHeader);
    v29 = require(l_RobloxGui_0.Modules.Settings.Components.renderSettingsDivider);
end;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_isVoiceFocused_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Utils.isVoiceFocused;
local l_observeIsVoiceFocused_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Utils.observeIsVoiceFocused;
local v33 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v34 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v35 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v36 = v35.GetFFlagAvatarChatCoreScriptSupport();
local l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 = v35.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty;
local l_GetFFlagEnableCrossExpVoice_0 = v35.GetFFlagEnableCrossExpVoice;
local l_GetFFlagSelfViewCameraSettings_0 = v35.GetFFlagSelfViewCameraSettings;
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0 = v35.GetFFlagEnableCrossExpVoiceVolumeIXPCheck;
local v42 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDebounceConnectDisconnectSelector);
local v43 = require(l_RobloxGui_0.Modules.Flags.GetFIntDebounceDisconnectButtonDelay);
local v44 = game:DefineFastFlag("MicroprofileGameSettingsFix", false);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v35.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v35.GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 = v35.GetFFlagVoiceChatClientRewriteDisableVCSDevice;
local l_FFlagIEMFocusNavToButtons_0 = v35.FFlagIEMFocusNavToButtons;
local v49 = game:DefineFastFlag("ShowAntiHarassmentSettings", false);
local v50 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting);
local v51 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy);
local l_FFlagBadgeVisibilitySettingEnabled_0 = v35.FFlagBadgeVisibilitySettingEnabled;
local l_GetFFlagEnableVoiceUxUpdates_0 = v35.GetFFlagEnableVoiceUxUpdates;
local l_GetFFlagEnableVrVoiceConnectDisconnect_0 = v35.GetFFlagEnableVrVoiceConnectDisconnect;
local v55 = game:DefineFastFlag("EnableVoiceSelectorTranslations_AEGIS2", false);
local v56 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false);
local v57 = game:DefineFastFlag("CenterShiftLockOverride", true);
local v58 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false);
local v59 = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false);
local l_FFlagEnableModerateChatRemoteEvent_0 = v35.FFlagEnableModerateChatRemoteEvent;
local v61 = game:DefineFastFlag("ModerateChatAnalytics", false);
local v62 = game:DefineFastFlag("PSUseVibrationInsteadOfHaptics", false);
local v63 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v66 = require(l_RobloxGui_0.Modules.Settings.Resources.GameSettingsConstants);
local v67 = l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0() and l_default_1 and l_default_1.getHasPartyVoiceVolume();
local l_Constants_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v69 = {
    ["Enum.SavedQualitySetting.Automatic"] = 0, 
    ["Enum.SavedQualitySetting.QualityLevel1"] = 1, 
    ["Enum.SavedQualitySetting.QualityLevel2"] = 2, 
    ["Enum.SavedQualitySetting.QualityLevel3"] = 3, 
    ["Enum.SavedQualitySetting.QualityLevel4"] = 4, 
    ["Enum.SavedQualitySetting.QualityLevel5"] = 5, 
    ["Enum.SavedQualitySetting.QualityLevel6"] = 6, 
    ["Enum.SavedQualitySetting.QualityLevel7"] = 7, 
    ["Enum.SavedQualitySetting.QualityLevel8"] = 8, 
    ["Enum.SavedQualitySetting.QualityLevel9"] = 9, 
    ["Enum.SavedQualitySetting.QualityLevel10"] = 10
};
local v70 = {
    DevComputerMovementMode = true, 
    DevComputerCameraMode = true, 
    DevEnableMouseLock = true
};
local v71 = {
    DevTouchMovementMode = true, 
    DevTouchCameraMode = true
};
local v72 = {
    DEFAULT_FOLLOW = "Default (Follow)", 
    DEFAULT_CLASSIC = "Default (Classic)"
};
local v73 = {
    Input = "Input", 
    Output = "Output"
};
local v74 = {
    DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)", 
    DEFAULT_KEYBOARD = "Default (Keyboard)", 
    TAP_TO_MOVE = "Tap to Move", 
    CLICK_TO_MOVE = "Click to Move"
};
local v75 = v63:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick");
local v76 = v63:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable");
local v77 = v63:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText");
local v78 = {
    On = 1, 
    Off = 2
};
local function __() --[[ Line: 163 ]] --[[ Name: getDefaultCameraMode ]]
    -- upvalues: l_UserInputService_0 (copy), v72 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v72.DEFAULT_FOLLOW;
    else
        return v72.DEFAULT_CLASSIC;
    end;
end;
local function __() --[[ Line: 172 ]] --[[ Name: getDefaultMovementMode ]]
    -- upvalues: l_UserInputService_0 (copy), v63 (copy), l_Constants_0 (copy), v74 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v63:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey);
    else
        return v74.DEFAULT_KEYBOARD;
    end;
end;
local function __() --[[ Line: 181 ]] --[[ Name: getDefaultSelectToMove ]]
    -- upvalues: l_UserInputService_0 (copy), v74 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v74.TAP_TO_MOVE;
    else
        return v74.CLICK_TO_MOVE;
    end;
end;
local l_SETTINGS_MENU_LAYOUT_ORDER_0 = v66.SETTINGS_MENU_LAYOUT_ORDER;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v84 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationSettingEnabled);
local v85 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationLayerName);
local v86 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled);
local v87 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationWaitForIXP);
local v88 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationForceSetting);
local v89 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationNewDefaults);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v91 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer);
local l_game_EngineFeature_1 = game:GetEngineFeature("GameBasicSettingsFramerateCap");
local v93 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v94 = require(l_RobloxGui_0.Modules.CoreUtility);
local v95 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v96 = require(l_RobloxGui_0.Modules.Common.GetHasGuiHidingPermission);
local v97 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v98 = require(l_CorePackages_0.Packages.Cryo);
local v99 = require(script.Parent.Parent.GfxReset);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v101 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall);
local v102 = require(l_CorePackages_0.Packages.BuilderIcons);
local v103 = require(l_CorePackages_0.Packages.Signals);
local l_Migration_0 = v102.Migration;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub");
local v105 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local __ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v109 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local l_default_2 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v113 = v63:FormatByKey("Feature.SettingsHub.Video.SystemDefault");
local v114 = v63:FormatByKey("Feature.SettingsHub.Video.VideoCamera");
local v115 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1);
local l_game_FastInt_0 = game:GetFastInt("RomarkStartWithGraphicQualityLevel");
local v117 = not v109:IsSubjectToChinaPolicies();
local v118 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v118 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v118 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
local v119 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v119 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v120 = if l_isInExperienceUIVREnabled_0 then (v119 or v118 or l_isSpatial_0()) and v117 else (v119 or v118) and v117;
local v121 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay);
local v122 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v123 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v124 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics);
local v125 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent);
local v126 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false);
local v127 = game:DefineFastFlag("UserShowGuiHideToggles", false);
local v128 = game:DefineFastFlag("UserFreecamGuiDestabilization", false);
local v129 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false);
local v130 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false);
local v131 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false);
local v132 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false);
local v133 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher);
local v134 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer);
local v135 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer);
local v136 = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false);
local function v142(v137, v138, v139, v140) --[[ Line: 302 ]] --[[ Name: reportSettingsChangeForAnalytics ]]
    -- upvalues: v124 (copy), l_UserInputService_0 (copy), v98 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    if not v124() or v138 == v139 or v138 == nil or v139 == nil then
        return;
    else
        local v141 = {
            universe_id = tostring(game.GameId), 
            name = v137, 
            old_value = tostring(v138), 
            new_value = tostring(v139), 
            has_touch = l_UserInputService_0.TouchEnabled, 
            has_mouse = l_UserInputService_0.MouseEnabled, 
            has_gamepad = l_UserInputService_0.GamepadEnabled
        };
        if v140 then
            v141 = v98.Dictionary.join(v141, v140);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsExplicitSettingsChangeName, v141);
        return;
    end;
end;
local function v147() --[[ Line: 333 ]] --[[ Name: reportSettingsForAnalytics ]]
    -- upvalues: l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_game_EngineFeature_1 (copy), v50 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    local v143 = {};
    local v144 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
    if v144 then
        v143.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
    else
        v143.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
    end;
    if v144 then
        v143.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
    else
        v143.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
    end;
    if l_UserInputService_0.MouseEnabled then
        v143.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
    end;
    if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
        local l_GamepadCameraSensitivity_0 = l_GameSettings_0.GamepadCameraSensitivity;
        v143.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", l_GamepadCameraSensitivity_0))));
    end;
    if l_UserInputService_0.MouseEnabled then
        local l_X_0 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        v143.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", l_X_0))));
    end;
    v143.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
    v143.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
    v143.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
    v143.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
    if l_game_EngineFeature_1 then
        v143.framerate_cap = tostring(l_GameSettings_0.FramerateCap);
    end;
    v143.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
    v143.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
    v143.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
    v143.reduced_motion = tostring(l_GameSettings_0.ReducedMotion);
    v143.preferred_transparency = tostring(l_GameSettings_0.PreferredTransparency);
    v143.preferred_text_size = tostring(l_GameSettings_0.PreferredTextSize);
    v143.ui_navigation_key_bind_enabled = tostring(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v143.universeid = tostring(game.GameId);
    if v50() then
        v143.player_names_enabled = tostring(l_GameSettings_0.PlayerNamesEnabled);
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v143);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v148 = game:DefineFastFlag("IGMEnableGFXReset", false);
local function v155(v149) --[[ Line: 399 ]] --[[ Name: getLastValueChangerFrame ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy)
    if not l_FFlagIEMFocusNavToButtons_0 then
        return;
    else
        local v150 = nil;
        local v151 = nil;
        for __, v153 in pairs(v149:GetRows()) do
            local l_SelectionFrame_0 = v153.SelectionFrame;
            if not v150 or v150 <= l_SelectionFrame_0.LayoutOrder then
                v150 = l_SelectionFrame_0.LayoutOrder;
                v151 = v149:getValueChangerFrame(v153.ValueChanger);
            end;
        end;
        return v151;
    end;
end;
return ((function() --[[ Line: 418 ]] --[[ Name: Initialize ]]
    -- upvalues: v148 (copy), v99 (copy), l_RobloxGui_0 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v93 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (copy), l_GuiService_0 (copy), v125 (copy), v124 (copy), v142 (copy), v147 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_game_EngineFeature_1 (copy), v63 (copy), l_game_FastInt_0 (copy), v69 (copy), v136 (copy), v51 (copy), v78 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v97 (copy), v57 (copy), v59 (copy), v44 (copy), v119 (copy), v118 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_LocalPlayer_0 (copy), v94 (copy), v72 (copy), v40 (copy), l_getAppFeaturePolicies_0 (copy), v74 (copy), v75 (copy), v71 (copy), v70 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v132 (copy), l_SafetyService_0 (copy), v20 (ref), v131 (copy), v77 (copy), v126 (copy), v115 (copy), l_Players_0 (copy), v76 (copy), l_RunService_0 (copy), v87 (copy), l_IXPServiceWrapper_0 (copy), v89 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), l_default_3 (copy), v62 (copy), v24 (ref), l_CorePackages_0 (copy), l_ContextActionService_0 (copy), v129 (copy), v95 (copy), v128 (copy), v127 (copy), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (ref), v122 (copy), l_SoundService_0 (copy), v73 (copy), v121 (copy), l_default_2 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v103 (copy), v61 (copy), v114 (copy), l_UserGameSettings_0 (copy), l_VideoCaptureService_0 (copy), v113 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v55 (copy), v43 (copy), v42 (copy), v101 (copy), v58 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_isVoiceFocused_0 (copy), l_GetFFlagEnableVrVoiceConnectDisconnect_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v56 (copy), l_observeIsVoiceFocused_0 (copy), v123 (copy), v21 (copy), v36 (copy), l_GetFFlagSelfViewCameraSettings_0 (copy), v34 (copy), v27 (copy), v26 (copy), l_default_0 (copy), v33 (copy), v105 (copy), v67 (copy), v49 (copy), v50 (copy), v135 (copy), v109 (copy), v120 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v96 (copy), v23 (copy), v28 (ref), v29 (ref), l_Migration_0 (copy), v102 (copy), v130 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), v155 (copy), v133 (copy), v134 (copy), v84 (copy), v86 (copy), v85 (copy), l_game_EngineFeature_0 (copy), l_TextChatService_0 (copy), v88 (copy), v91 (copy)
    if v148 then
        v99.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v157 = false;
    local v158 = {};
    local __ = function() --[[ Line: 428 ]] --[[ Name: onVRSettingsReady ]]
        -- upvalues: l_VRService_0 (ref), v158 (copy)
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v160, __ in pairs(v158) do
            v160.Visible = not l_VREnabled_0;
        end;
    end;
    local function v166() --[[ Line: 435 ]] --[[ Name: onVREnabled ]]
        -- upvalues: l_VRService_0 (ref), v157 (ref), v158 (copy)
        if l_VRService_0.VREnabled and v157 then
            local l_VREnabled_1 = l_VRService_0.VREnabled;
            for v164, __ in pairs(v158) do
                v164.Visible = not l_VREnabled_1;
            end;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v166);
    if l_VRService_0.VREnabled and v157 then
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        for v168, __ in pairs(v158) do
            v168.Visible = not l_VREnabled_2;
        end;
    end;
    local function v208() --[[ Line: 447 ]] --[[ Name: createGraphicsOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), l_GuiService_0 (ref), v125 (ref), v124 (ref), v142 (ref), v147 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_game_EngineFeature_1 (ref), l_VRService_0 (ref), v63 (ref), v148 (ref), v99 (ref), l_game_FastInt_0 (ref), v69 (ref)
        local v170 = 1;
        if not l_GameSettings_0:InFullScreen() then
            v170 = 2;
        end;
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local l_l_NewPage_0_2 = l_NewPage_0;
        local v174, v175, v176 = v93:AddNewRow(l_NewPage_0, "Fullscreen", "Selector", {
            "On", 
            "Off"
        }, v170);
        l_l_NewPage_0_0.FullscreenFrame = v174;
        l_l_NewPage_0_1.FullscreenLabel = v175;
        l_l_NewPage_0_2.FullscreenEnabler = v176;
        l_NewPage_0.FullscreenFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FullScreenFrame;
        v158[l_NewPage_0.FullscreenFrame] = true;
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v177) --[[ Line: 460 ]]
            -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref), v125 (ref), l_NewPage_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            local v178 = l_GameSettings_0:InFullScreen();
            if v177 == 1 then
                if not l_GameSettings_0:InFullScreen() then
                    l_GuiService_0:ToggleFullscreen();
                    if v125() then
                        if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 1 then
                            l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                        end;
                    else
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    end;
                end;
            elseif v177 == 2 and l_GameSettings_0:InFullScreen() then
                l_GuiService_0:ToggleFullscreen();
                if v125() then
                    if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 2 then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                    end;
                else
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            end;
            spawn(function() --[[ Line: 485 ]]
                -- upvalues: v124 (ref), v142 (ref), v178 (copy), l_GameSettings_0 (ref), v147 (ref)
                if v124() then
                    v142("fullscreen_enabled", v178, l_GameSettings_0:InFullScreen());
                end;
                v147();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v179) --[[ Line: 493 ]]
            -- upvalues: l_NewPage_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
            if v179 then
                if l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 1 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                end;
            elseif l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 2 then
                l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsFullscreenModeName, {
                enabled = v179
            });
        end);
        l_l_NewPage_0_0 = 1;
        if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            l_l_NewPage_0_0 = 2;
        end;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v174 = l_NewPage_0;
        local v180;
        v175, v176, v180 = v93:AddNewRow(l_NewPage_0, "Graphics Mode", "Selector", {
            "Automatic", 
            "Manual"
        }, l_l_NewPage_0_0);
        l_l_NewPage_0_1.GraphicsEnablerFrame = v175;
        l_l_NewPage_0_2.GraphicsEnablerLabel = v176;
        v174.GraphicsQualityEnabler = v180;
        l_NewPage_0.GraphicsEnablerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsEnablerFrame;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v174 = l_NewPage_0;
        v175, v176, v180 = v93:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", 10, 1);
        l_l_NewPage_0_1.GraphicsQualityFrame = v175;
        l_l_NewPage_0_2.GraphicsQualityLabel = v176;
        v174.GraphicsQualitySlider = v180;
        l_NewPage_0.GraphicsQualityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsQualityFrame;
        l_NewPage_0.GraphicsQualitySlider:SetMinStep(1);
        if l_game_EngineFeature_1 and not l_VRService_0.VREnabled then
            l_l_NewPage_0_1 = table.clone(l_Constants_0.FramerateCaps);
            l_l_NewPage_0_2 = {
                v63:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
                    Frames = l_GameSettings_0:GetDefaultFramerateCap()
                })
            };
            for __, v182 in l_l_NewPage_0_1 do
                table.insert(l_l_NewPage_0_2, v63:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
                    Frames = v182
                }));
            end;
            table.insert(l_l_NewPage_0_1, 1, -1);
            local l_l_l_NewPage_0_2_0 = l_l_NewPage_0_2 --[[ copy: 3 -> 9 ]];
            local l_l_l_NewPage_0_1_0 = l_l_NewPage_0_1 --[[ copy: 2 -> 10 ]];
            task.defer(function() --[[ Line: 557 ]]
                -- upvalues: l_NewPage_0 (ref), v93 (ref), v63 (ref), l_l_l_NewPage_0_2_0 (copy), l_l_l_NewPage_0_1_0 (copy), l_GameSettings_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v188, v189, v190 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_l_l_NewPage_0_2_0, table.find(l_l_l_NewPage_0_1_0, l_GameSettings_0.FramerateCap), nil, v63:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v188;
                l_l_NewPage_0_4.FramerateCapLabel = v189;
                l_l_NewPage_0_5.FramerateCapMode = v190;
                l_NewPage_0.FramerateCapFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FramerateCap;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v191) --[[ Line: 569 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_l_l_NewPage_0_1_0 (ref), v124 (ref), v142 (ref), v147 (ref)
                    local l_FramerateCap_0 = l_GameSettings_0.FramerateCap;
                    l_GameSettings_0.FramerateCap = l_l_l_NewPage_0_1_0[v191];
                    if v124() then
                        v142("framerate_cap", l_FramerateCap_0, l_GameSettings_0.FramerateCap);
                    end;
                    v147();
                end);
            end);
        end;
        settings().Rendering.EnableFRM = true;
        SetGraphicsQuality = function(v193, v194) --[[ Line: 587 ]] --[[ Name: SetGraphicsQuality ]]
            -- upvalues: v148 (ref), v99 (ref), l_GameSettings_0 (ref)
            if v148 then
                local v195, v196 = v99.TemporaryOverride(v193);
                if v195 then
                    settings().Rendering.QualityLevel = v196;
                    return;
                end;
            end;
            local v197 = v193 / 10;
            local v198 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * v197);
            if v198 == 20 then
                v198 = 21;
            elseif v193 == 1 then
                v198 = 1;
            elseif v193 < 1 and not v194 then
                v193 = 1;
                v198 = 1;
            elseif settings().Rendering:GetMaxQualityLevel() < v198 then
                v198 = settings().Rendering:GetMaxQualityLevel() - 1;
            end;
            l_GameSettings_0.SavedQualityLevel = v193;
            settings().Rendering.QualityLevel = v198;
        end;
        l_l_NewPage_0_1 = function() --[[ Line: 613 ]] --[[ Name: setGraphicsToAuto ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        l_l_NewPage_0_2 = function(v199) --[[ Line: 621 ]] --[[ Name: setGraphicsToManual ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() == v199 then
                SetGraphicsQuality(v199);
                return;
            else
                l_NewPage_0.GraphicsQualitySlider:SetValue(v199);
                return;
            end;
        end;
        v174 = false;
        l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v200) --[[ Line: 635 ]]
            -- upvalues: v174 (ref), v147 (ref)
            SetGraphicsQuality(v200);
            if v174 == true then
                v147();
            end;
            v174 = true;
        end);
        l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v201) --[[ Line: 643 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_2 (copy), v147 (ref), v142 (ref)
            local v202 = {
                Automatic = {
                    Name = "Automatic", 
                    Value = 1
                }, 
                Manual = {
                    Name = "Manual", 
                    Value = 2
                }
            };
            local l_Name_0 = v202.Automatic.Name;
            local l_Name_1 = v202.Manual.Name;
            if v201 == v202.Automatic.Value then
                l_Name_0 = v202.Manual.Name;
                l_Name_1 = v202.Automatic.Name;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
            elseif v201 == v202.Manual.Value then
                l_l_NewPage_0_2(l_NewPage_0.GraphicsQualitySlider:GetValue());
            end;
            v147();
            v142("gfx_mode", l_Name_0, l_Name_1);
        end);
        game.GraphicsQualityChangeRequest:Connect(function(v205) --[[ Line: 661 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                local l_Value_0 = l_NewPage_0.GraphicsQualitySlider:GetValue();
                l_Value_0 = if v205 then l_Value_0 + 1 else l_Value_0 - 1;
                l_NewPage_0.GraphicsQualitySlider:SetValue(l_Value_0);
            end;
        end);
        if l_game_FastInt_0 >= 0 then
            if l_game_FastInt_0 == 0 then
                l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(1);
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
            else
                l_NewPage_0.GraphicsQualityEnabler:SetSelectionIndex(2);
                l_l_NewPage_0_2(l_game_FastInt_0);
            end;
        elseif l_GameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
            l_NewPage_0.GraphicsQualitySlider:SetValue(5);
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        else
            v175 = tostring(l_GameSettings_0.SavedQualityLevel);
            v175 = if v69[v175] then v69[v175] else 10;
            SetGraphicsQuality(v175);
            do
                local l_v175_0 = v175;
                spawn(function() --[[ Line: 694 ]]
                    -- upvalues: l_NewPage_0 (ref), l_v175_0 (ref)
                    l_NewPage_0.GraphicsQualitySlider:SetValue(l_v175_0);
                end);
            end;
        end;
    end;
    local function v222() --[[ Line: 700 ]] --[[ Name: createReducedMotionOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v63 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v209 = 2;
        if l_GameSettings_0.ReducedMotion then
            v209 = 1;
        end;
        local v210 = v63:FormatByKey("Feature.Accessibility.Heading.ReducedMotion");
        local v211 = v63:FormatByKey("Feature.Accessibility.Description.ReducedMotion");
        local v212 = v63:FormatByKey("InGame.CommonUI.Label.On");
        local v213 = v63:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_6 = l_NewPage_0;
        local l_l_NewPage_0_7 = l_NewPage_0;
        local l_l_NewPage_0_8 = l_NewPage_0;
        local v217, v218, v219 = v93:AddNewRow(l_NewPage_0, v210, "Selector", {
            v212, 
            v213
        }, v209, nil, v211);
        l_l_NewPage_0_6.ReducedMotionFrame = v217;
        l_l_NewPage_0_7.ReducedMotionLabel = v218;
        l_l_NewPage_0_8.ReducedMotionMode = v219;
        l_NewPage_0.ReducedMotionFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ReducedMotionFrame;
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v220) --[[ Line: 722 ]]
            -- upvalues: l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v220 == 1;
            if v124() then
                v142("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v147();
        end);
    end;
    local function v237() --[[ Line: 733 ]] --[[ Name: createPlayerNamesEnabledOptions ]]
        -- upvalues: v136 (ref), v63 (ref), v51 (ref), l_GameSettings_0 (ref), v78 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v142 (ref), v147 (ref)
        local v223 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") else if v51 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else v63:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames");
        local v224 = if v51 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil;
        local function __() --[[ Line: 741 ]] --[[ Name: GetPlayerNamesEnabledStartIndex ]]
            -- upvalues: l_GameSettings_0 (ref), v78 (ref)
            if l_GameSettings_0.PlayerNamesEnabled then
                return v78.On;
            else
                return v78.Off;
            end;
        end;
        local v226 = if l_GameSettings_0.PlayerNamesEnabled then v78.On else v78.Off;
        local v227 = if v136 then v63:FormatByKey("Feature.SettingsHub.Label.Show") else v63:FormatByKey("InGame.CommonUI.Label.On");
        local v228 = if v136 then v63:FormatByKey("Feature.SettingsHub.Label.Hide") else v63:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_9 = l_NewPage_0;
        local l_l_NewPage_0_10 = l_NewPage_0;
        local l_l_NewPage_0_11 = l_NewPage_0;
        local v232, v233, v234 = v93:AddNewRow(l_NewPage_0, v223, "Selector", {
            v227, 
            v228
        }, v226, nil, v224);
        l_l_NewPage_0_9.PlayerNamesEnabledFrame = v232;
        l_l_NewPage_0_10.playerNamesEnabledLabel = v233;
        l_l_NewPage_0_11.playerNamesEnabledMode = v234;
        l_NewPage_0.PlayerNamesEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PlayerNamesEnabledFrame;
        l_NewPage_0.playerNamesEnabledMode.IndexChanged:connect(function(v235) --[[ Line: 760 ]]
            -- upvalues: l_GameSettings_0 (ref), v78 (ref), v142 (ref), v147 (ref)
            local l_PlayerNamesEnabled_0 = l_GameSettings_0.PlayerNamesEnabled;
            l_GameSettings_0.PlayerNamesEnabled = v235 == v78.On;
            v142("player_names_enabled", l_PlayerNamesEnabled_0, l_GameSettings_0.PlayerNamesEnabled);
            v147();
        end);
    end;
    local function v251() --[[ Line: 769 ]] --[[ Name: createPreferredTransparencyOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v63 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v238 = 10 - math.clamp(math.floor(l_GameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10);
        local v239 = v63:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency");
        local v240 = v63:FormatByKey("Feature.Accessibility.Description.PreferredTransparency");
        local v241 = v63:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent");
        local v242 = v63:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque");
        local l_l_NewPage_0_12 = l_NewPage_0;
        local l_l_NewPage_0_13 = l_NewPage_0;
        local l_l_NewPage_0_14 = l_NewPage_0;
        local v246, v247, v248 = v93:AddNewRow(l_NewPage_0, v239, "Slider", 10, v238, nil, v240, v241, v242);
        l_l_NewPage_0_12.PreferredTransparencyFrame = v246;
        l_l_NewPage_0_13.PreferredTransparencyLabel = v247;
        l_l_NewPage_0_14.PreferredTransparencySlider = v248;
        l_NewPage_0.PreferredTransparencyFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTransparencyFrame;
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v249) --[[ Line: 795 ]]
            -- upvalues: l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            v249 = (10 - math.clamp(math.floor(v249), 0, 10)) / 10;
            local l_PreferredTransparency_0 = l_GameSettings_0.PreferredTransparency;
            l_GameSettings_0.PreferredTransparency = v249;
            if v124() then
                v142("preferred_transparency", l_PreferredTransparency_0, l_GameSettings_0.PreferredTransparency);
            end;
            v147();
        end);
    end;
    local function v266() --[[ Line: 807 ]] --[[ Name: createPreferredTextSizeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v63 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local l_EnumItems_0 = Enum.PreferredTextSize:GetEnumItems();
        local v253 = l_GameSettings_0.PreferredTextSize.Value - 1;
        local v254 = v63:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize");
        local v255 = v63:FormatByKey("Feature.Accessibility.Description.PreferredTextSize");
        local v256 = v63:FormatByKey("Feature.Accessibility.PreferredTextSize.Default");
        local v257 = v63:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest");
        local l_l_NewPage_0_15 = l_NewPage_0;
        local l_l_NewPage_0_16 = l_NewPage_0;
        local l_l_NewPage_0_17 = l_NewPage_0;
        local v261, v262, v263 = v93:AddNewRow(l_NewPage_0, v254, "Slider", 3, v253, nil, v255, v256, v257);
        l_l_NewPage_0_15.PreferredTextSizeFrame = v261;
        l_l_NewPage_0_16.PreferredTextSizeLabel = v262;
        l_l_NewPage_0_17.PreferredTextSizeSlider = v263;
        l_NewPage_0.PreferredTextSizeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTextSizeFrame;
        l_NewPage_0.PreferredTextSizeSlider.ValueChanged:connect(function(v264) --[[ Line: 832 ]]
            -- upvalues: l_GameSettings_0 (ref), l_EnumItems_0 (copy), v124 (ref), v142 (ref), v147 (ref)
            local l_PreferredTextSize_0 = l_GameSettings_0.PreferredTextSize;
            l_GameSettings_0.PreferredTextSize = l_EnumItems_0[v264 + 1];
            if v124() then
                v142("preferred_text_size", l_PreferredTextSize_0, l_GameSettings_0.PreferredTextSize);
            end;
            v147();
        end);
    end;
    local function v283() --[[ Line: 842 ]] --[[ Name: createUiNavigationKeyBindOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v63 (ref), l_UserInputService_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v267 = {
            On = 1, 
            Off = 2
        };
        local l_Off_0 = v267.Off;
        if l_GameSettings_0.UiNavigationKeyBindEnabled then
            l_Off_0 = v267.On;
        end;
        local v269 = v63:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind");
        local v270 = v63:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v271 = v63:FormatByKey("InGame.CommonUI.Label.On");
        local v272 = v63:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_18 = l_NewPage_0;
        local l_l_NewPage_0_19 = l_NewPage_0;
        local l_l_NewPage_0_20 = l_NewPage_0;
        local v276, v277, v278 = v93:AddNewRow(l_NewPage_0, v269, "Selector", {
            v271, 
            v272
        }, l_Off_0, nil, v270);
        l_l_NewPage_0_18.UiNavigationKeyBindEnabledFrame = v276;
        l_l_NewPage_0_19.UiNavigationKeyBindEnabledLabel = v277;
        l_l_NewPage_0_20.UiNavigationKeyBindEnabledMode = v278;
        l_NewPage_0.UiNavigationKeyBindEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiNavigationKeyBindEnabledFrame;
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v279) --[[ Line: 873 ]]
            -- upvalues: l_GameSettings_0 (ref), v267 (copy), v124 (ref), v142 (ref), v147 (ref)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v279 == v267.On;
            if v124() then
                v142("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v147();
        end);
        l_l_NewPage_0_18 = function() --[[ Line: 886 ]] --[[ Name: updateUiNavigationKeyBindVisibility ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v267 (copy)
            local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_0;
                if l_KeyboardEnabled_0 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v267.On or v267.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v267.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end;
        l_l_NewPage_0_19 = l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
            l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_l_NewPage_0_19;
            if l_l_NewPage_0_19 then
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v267.On or v267.Off);
            else
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v267.Off);
                l_GameSettings_0.UiNavigationKeyBindEnabled = false;
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 901 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v267 (copy)
            local l_KeyboardEnabled_1 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_1;
                if l_KeyboardEnabled_1 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v267.On or v267.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v267.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end);
    end;
    local function v295() --[[ Line: 906 ]] --[[ Name: createPerformanceStatsOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_Create_0 (ref), v97 (ref), v57 (ref), v124 (ref), v142 (ref), v147 (ref)
        local l_l_NewPage_0_21 = l_NewPage_0;
        local l_l_NewPage_0_22 = l_NewPage_0;
        local l_l_NewPage_0_23 = l_NewPage_0;
        local l_l_NewPage_0_24 = l_NewPage_0;
        local v288 = nil;
        local v289 = nil;
        local v290 = nil;
        local v291 = nil;
        l_l_NewPage_0_21.PerformanceStatsFrame = v288;
        l_l_NewPage_0_22.PerformanceStatsLabel = v289;
        l_l_NewPage_0_23.PerformanceStatsMode = v290;
        l_l_NewPage_0_24.PerformanceStatsOverrideText = v291;
        GetDesiredPerformanceStatsIndex = function() --[[ Line: 912 ]] --[[ Name: GetDesiredPerformanceStatsIndex ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.PerformanceStatsVisible then
                return 1;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_21 = GetDesiredPerformanceStatsIndex();
        l_l_NewPage_0_22 = l_NewPage_0;
        l_l_NewPage_0_23 = l_NewPage_0;
        l_l_NewPage_0_24 = l_NewPage_0;
        v288, v289, v290 = v93:AddNewRow(l_NewPage_0, "Performance Stats", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_21);
        l_l_NewPage_0_22.PerformanceStatsFrame = v288;
        l_l_NewPage_0_23.PerformanceStatsLabel = v289;
        l_l_NewPage_0_24.PerformanceStatsMode = v290;
        l_NewPage_0.PerformanceStatsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PerformanceStatsFrame;
        l_NewPage_0.PerformanceStatsOverrideText = l_Create_0("TextLabel")({
            Name = "PerformanceStatsLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v97.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v97.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v57 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v57 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v57 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v292) --[[ Line: 941 ]]
            -- upvalues: v124 (ref), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
            local v293 = nil;
            if v124() then
                v293 = l_GameSettings_0.PerformanceStatsVisible;
            end;
            if v292 == 1 then
                l_GameSettings_0.PerformanceStatsVisible = true;
            else
                l_GameSettings_0.PerformanceStatsVisible = false;
            end;
            if v124() then
                v142("show_performance_stats", v293, l_GameSettings_0.PerformanceStatsVisible);
            end;
            v147();
        end);
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function() --[[ Line: 963 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v294 = GetDesiredPerformanceStatsIndex();
            if v294 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v294);
            end;
        end);
    end;
    local function v302() --[[ Line: 973 ]] --[[ Name: createWebServerInformationRow ]]
        -- upvalues: l_NewPage_0 (copy), v93 (ref), v59 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v44 (ref), l_Create_0 (ref), v97 (ref)
        local l_l_NewPage_0_25 = l_NewPage_0;
        local l_l_NewPage_0_26 = l_NewPage_0;
        local l_l_NewPage_0_27 = l_NewPage_0;
        local v299, v300, v301 = v93:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not v59 and nil);
        l_l_NewPage_0_25.InformationFrame = v299;
        l_l_NewPage_0_26.InformationLabel = v300;
        l_l_NewPage_0_27.InformationTextBox = v301;
        l_NewPage_0.InformationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v44 then
            l_NewPage_0.InformationText = l_Create_0("TextLabel")({
                Name = "InformationLabel", 
                Text = "Information Loading", 
                Font = v97.font(Enum.Font.SourceSans), 
                FontSize = v97.fontSize(Enum.FontSize.Size18), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 800, 1, 0), 
                Position = UDim2.new(0, 5, 0, 0), 
                Visible = true, 
                ZIndex = 2, 
                Parent = l_NewPage_0.InformationFrame
            });
        else
            l_NewPage_0.InformationText = l_Create_0("TextLabel")({
                Name = "InformationLabel", 
                Text = "Information Loading", 
                Font = v97.font(Enum.Font.SourceSans), 
                FontSize = v97.fontSize(Enum.FontSize.Size14), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 800, 1, 0), 
                Position = UDim2.new(1, -650, 0, 20), 
                Visible = true, 
                ZIndex = 2, 
                Parent = l_NewPage_0.InformationFrame
            });
        end;
        return l_NewPage_0.InformationFrame, l_NewPage_0.InformationText;
    end;
    local function v331() --[[ Line: 1013 ]] --[[ Name: createMicroProfilerOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v302 (copy), v119 (ref), v124 (ref), v118 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v142 (ref), v147 (ref), v63 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_l_NewPage_0_28 = l_NewPage_0;
        local l_l_NewPage_0_29 = l_NewPage_0;
        local l_l_NewPage_0_30 = l_NewPage_0;
        local l_l_NewPage_0_31 = l_NewPage_0;
        local v307 = nil;
        local v308 = nil;
        local v309 = nil;
        local v310 = nil;
        l_l_NewPage_0_28.MicroProfilerFrame = v307;
        l_l_NewPage_0_29.MicroProfilerLabel = v308;
        l_l_NewPage_0_30.MicroProfilerMode = v309;
        l_l_NewPage_0_31.MicroProfilerOverrideText = v310;
        l_l_NewPage_0_28 = function() --[[ Line: 1018 ]] --[[ Name: tryContentLabel ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v302 (ref)
            local l_MicroProfilerWebServerPort_0 = l_GameSettings_0.MicroProfilerWebServerPort;
            if l_MicroProfilerWebServerPort_0 ~= 0 then
                local l_l_NewPage_0_32 = l_NewPage_0;
                local l_l_NewPage_0_33 = l_NewPage_0;
                local v314, v315 = v302();
                l_l_NewPage_0_32.InformationFrame = v314;
                l_l_NewPage_0_33.InformationText = v315;
                l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_0;
                return true;
            else
                return false;
            end;
        end;
        l_l_NewPage_0_29 = function(v316) --[[ Line: 1030 ]] --[[ Name: setMicroProfilerIndex ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v119 (ref), v124 (ref), v302 (ref), v118 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v142 (ref), v147 (ref)
            local function __() --[[ Line: 1031 ]] --[[ Name: hideContentLabel ]]
                -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
                l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                    l_NewPage_0.InformationFrame.Visible = false;
                    l_NewPage_0.InformationFrame.Parent = nil;
                    l_NewPage_0.InformationText.Parent = nil;
                    l_NewPage_0.InformationFrame = nil;
                    l_NewPage_0.InformationText = nil;
                end;
            end;
            local v318 = nil;
            local v319 = nil;
            local v320 = nil;
            if v119 then
                if v124() then
                    v318 = "webserver";
                    v319 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
                if v316 == 1 then
                    l_GameSettings_0.MicroProfilerWebServerEnabled = true;
                    local v321 = 30;
                    while v321 >= 1 do
                        local l_MicroProfilerWebServerPort_1 = l_GameSettings_0.MicroProfilerWebServerPort;
                        local v323;
                        if l_MicroProfilerWebServerPort_1 ~= 0 then
                            local l_l_NewPage_0_34 = l_NewPage_0;
                            local l_l_NewPage_0_35 = l_NewPage_0;
                            local v326, v327 = v302();
                            l_l_NewPage_0_34.InformationFrame = v326;
                            l_l_NewPage_0_35.InformationText = v327;
                            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_1;
                            v323 = true;
                        else
                            v323 = false;
                        end;
                        if not v323 then
                            v321 = v321 - 1;
                            wait(0.1);
                        else
                            break;
                        end;
                    end;
                    if v321 <= 0 then
                        l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                        l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                        if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                            l_NewPage_0.InformationFrame.Visible = false;
                            l_NewPage_0.InformationFrame.Parent = nil;
                            l_NewPage_0.InformationText.Parent = nil;
                            l_NewPage_0.InformationFrame = nil;
                            l_NewPage_0.InformationText = nil;
                        end;
                    end;
                else
                    l_GameSettings_0.MicroProfilerWebServerEnabled = false;
                    if l_NewPage_0.InformationFrame or l_NewPage_0.InformationText then
                        l_NewPage_0.InformationFrame.Visible = false;
                        l_NewPage_0.InformationFrame.Parent = nil;
                        l_NewPage_0.InformationText.Parent = nil;
                        l_NewPage_0.InformationFrame = nil;
                        l_NewPage_0.InformationText = nil;
                    end;
                end;
                if v124() then
                    v320 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
            elseif v118 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if v124() then
                    v318 = "regular";
                    v319 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
                l_GameSettings_0.OnScreenProfilerEnabled = v316 == 1;
                if v124() then
                    v320 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
            end;
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerSettingsPressed");
            if v124() then
                v142("microprofiler_enabled", v319, v320, {
                    microprofiler_type = v318
                });
            end;
            v147();
        end;
        l_l_NewPage_0_30 = function() --[[ Line: 1104 ]] --[[ Name: GetDesiredWebServerIndex ]]
            -- upvalues: v119 (ref), l_GameSettings_0 (ref), v118 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref)
            if v119 then
                if l_GameSettings_0.MicroProfilerWebServerEnabled then
                    return 1;
                else
                    return 2;
                end;
            elseif v118 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if l_GameSettings_0.OnScreenProfilerEnabled then
                    return 1;
                else
                    return 2;
                end;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_31 = if v119 then l_GameSettings_0.MicroProfilerWebServerEnabled and 1 or 2 else if v118 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then l_GameSettings_0.OnScreenProfilerEnabled and 1 or 2 else 2;
        v307 = v63:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler");
        v308 = l_NewPage_0;
        v309 = l_NewPage_0;
        v310 = l_NewPage_0;
        local v328, v329, v330 = v93:AddNewRow(l_NewPage_0, v307, "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_31);
        v308.MicroProfilerFrame = v328;
        v309.MicroProfilerLabel = v329;
        v310.MicroProfilerMode = v330;
        l_NewPage_0.MicroProfilerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MicroProfilerFrame;
        v308 = l_GameSettings_0.MicroProfilerWebServerPort;
        if v308 ~= 0 then
            v309 = l_NewPage_0;
            v310 = l_NewPage_0;
            v328, v329 = v302();
            v309.InformationFrame = v328;
            v310.InformationText = v329;
            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. v308;
        end;
        v308 = false;
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 1133 ]]
            -- upvalues: v308 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            v308 = true;
            if l_GameSettings_0.OnScreenProfilerEnabled then
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(1);
                return;
            else
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                return;
            end;
        end);
        v309 = function(...) --[[ Line: 1143 ]] --[[ Name: onIndexChanged ]]
            -- upvalues: v308 (ref), l_l_NewPage_0_29 (copy)
            if v308 then
                v308 = false;
                return;
            else
                l_l_NewPage_0_29(...);
                return;
            end;
        end;
        l_NewPage_0.MicroProfilerMode.IndexChanged:connect(v309);
    end;
    local function v452(v332) --[[ Line: 1154 ]] --[[ Name: createCameraModeOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), l_Create_0 (ref), v97 (ref), v57 (ref), v124 (ref), v142 (ref), v147 (ref), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref), v94 (ref), v72 (ref), l_VRService_0 (ref), v40 (ref), l_getAppFeaturePolicies_0 (ref), v63 (ref), l_Constants_0 (ref), v74 (ref), v75 (ref), v71 (ref), v70 (ref)
        local l_l_NewPage_0_36 = l_NewPage_0;
        local l_l_NewPage_0_37 = l_NewPage_0;
        local l_l_NewPage_0_38 = l_NewPage_0;
        local l_l_NewPage_0_39 = l_NewPage_0;
        local v337 = nil;
        local v338 = nil;
        local v339 = nil;
        local v340 = nil;
        l_l_NewPage_0_36.ShiftLockFrame = v337;
        l_l_NewPage_0_37.ShiftLockLabel = v338;
        l_l_NewPage_0_38.ShiftLockMode = v339;
        l_l_NewPage_0_39.ShiftLockOverrideText = v340;
        l_l_NewPage_0_36 = 2;
        if l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch then
            l_l_NewPage_0_36 = 1;
        end;
        l_l_NewPage_0_37 = l_NewPage_0;
        l_l_NewPage_0_38 = l_NewPage_0;
        l_l_NewPage_0_39 = l_NewPage_0;
        v337, v338, v339 = v93:AddNewRow(l_NewPage_0, "Shift Lock Switch", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_36);
        l_l_NewPage_0_37.ShiftLockFrame = v337;
        l_l_NewPage_0_38.ShiftLockLabel = v338;
        l_l_NewPage_0_39.ShiftLockMode = v339;
        l_NewPage_0.ShiftLockFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ShiftLockFrame;
        v158[l_NewPage_0.ShiftLockFrame] = true;
        l_NewPage_0.ShiftLockOverrideText = l_Create_0("TextLabel")({
            Name = "ShiftLockOverrideLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v97.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v97.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v57 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v57 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v57 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.ShiftLockFrame
        });
        l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v341) --[[ Line: 1185 ]]
            -- upvalues: v124 (ref), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
            local v342 = nil;
            if v124() then
                v342 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
            end;
            if v341 == 1 then
                l_GameSettings_0.ControlMode = Enum.ControlMode.MouseLockSwitch;
            else
                l_GameSettings_0.ControlMode = Enum.ControlMode.Classic;
            end;
            if v124() then
                v142("shift_lock_enabled", v342, l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
            end;
            v147();
        end);
        l_l_NewPage_0_37 = function(v343) --[[ Line: 1207 ]] --[[ Name: setShiftLockSelectorVisible ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v344 = v343 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v344;
                l_NewPage_0.ShiftLockMode:SetInteractable(v344);
            end;
        end;
        l_l_NewPage_0_38 = function() --[[ Line: 1215 ]] --[[ Name: applyDevOverrideShiftLockSelector ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v345 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v345;
                local v346 = not v345 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v346;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v346);
                end;
            end;
        end;
        l_l_NewPage_0_39 = function() --[[ Line: 1223 ]] --[[ Name: updateShiftLockVisibility ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v347 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v347;
            end;
            local v348 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v348;
                local v349 = not v348 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v349;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v349);
                end;
            end;
        end;
        v337 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.ShiftLockFrame then
            l_NewPage_0.ShiftLockFrame.Visible = v337;
        end;
        v338 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v338;
            v340 = not v338 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v340;
                l_NewPage_0.ShiftLockMode:SetInteractable(v340);
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ Line: 1233 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v350 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v350;
            end;
            local v351 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v351;
                local v352 = not v351 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v352;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v352);
                end;
            end;
        end);
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 1237 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v353 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v353;
            end;
            local v354 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v354;
                local v355 = not v354 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v355;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v355);
                end;
            end;
        end);
        cameraModeIsUserChoice = function() --[[ Line: 1243 ]] --[[ Name: cameraModeIsUserChoice ]]
            -- upvalues: l_UserInputService_0 (ref), l_LocalPlayer_0 (ref)
            if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v356) --[[ Line: 1252 ]] --[[ Name: setCameraModeVisible ]]
            -- upvalues: l_NewPage_0 (ref)
            if l_NewPage_0.CameraMode then
                l_NewPage_0.CameraMode.SelectorFrame.Visible = v356;
                l_NewPage_0.CameraMode:SetInteractable(v356);
                l_NewPage_0.CameraModeOverrideText.Visible = not v356;
            end;
        end;
        v337 = v94.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
        v338 = {};
        v339 = {};
        do
            local l_v338_0, l_v339_0 = v338, v339;
            v340 = function(v359) --[[ Line: 1266 ]] --[[ Name: updateCurrentCameraMovementIndex ]]
                -- upvalues: l_v339_0 (ref), l_v338_0 (ref), l_UserInputService_0 (ref), v124 (ref), l_GameSettings_0 (ref), v142 (ref)
                local v360 = nil;
                if not pcall(function() --[[ Line: 1268 ]]
                    -- upvalues: v360 (ref), l_v339_0 (ref), l_v338_0 (ref), v359 (copy)
                    v360 = l_v339_0[l_v338_0[v359]];
                end) or v360 == nil then
                    return false;
                else
                    local v361 = nil;
                    local v362 = nil;
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        if v124() then
                            v362 = l_GameSettings_0.TouchCameraMovementMode.Value;
                        end;
                        v361 = l_GameSettings_0.TouchCameraMovementMode.Value ~= v360;
                        l_GameSettings_0.TouchCameraMovementMode = v360;
                    else
                        if v124() then
                            v362 = l_GameSettings_0.ComputerCameraMovementMode.Value;
                        end;
                        v361 = l_GameSettings_0.ComputerCameraMovementMode.Value ~= v360;
                        l_GameSettings_0.ComputerCameraMovementMode = v360;
                    end;
                    if v124() and v361 then
                        v142("camera_mode", v362, v360);
                    end;
                    return v361;
                end;
            end;
            local l_v337_0 = v337 --[[ copy: 5 -> 23 ]];
            local l_v340_0 = v340 --[[ copy: 8 -> 24 ]];
            local function v371() --[[ Line: 1302 ]] --[[ Name: updateCameraMovementModes ]]
                -- upvalues: l_v337_0 (copy), l_UserInputService_0 (ref), l_v338_0 (ref), l_v339_0 (ref), v72 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), l_v340_0 (copy)
                local v365 = {};
                if l_v337_0 then
                    v365 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then l_v337_0:GetRegisteredTouchCameraMovementModes() else l_v337_0:GetRegisteredComputerCameraMovementModes();
                end;
                l_v338_0 = {};
                l_v339_0 = {};
                if #v365 <= 0 then
                    setCameraModeVisible(false);
                    return;
                else
                    for v366 = 1, #v365 do
                        local v367 = v365[v366];
                        local l_Name_2 = v367.Name;
                        if l_Name_2 == "Default" then
                            l_Name_2 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v72.DEFAULT_FOLLOW else v72.DEFAULT_CLASSIC;
                        end;
                        l_v338_0[#l_v338_0 + 1] = l_Name_2;
                        l_v339_0[l_Name_2] = v367.Value;
                    end;
                    if l_NewPage_0.CameraMode then
                        l_NewPage_0.CameraMode:UpdateOptions(l_v338_0);
                    end;
                    local v369 = -1;
                    local v370 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                    v369 = if v370 then l_GameSettings_0.TouchCameraMovementMode.Value else l_GameSettings_0.ComputerCameraMovementMode.Value;
                    if v369 > -1 then
                        if v370 or l_GameSettings_0.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
                            v369 = v369 + 1;
                        end;
                        l_v340_0(v369);
                        l_NewPage_0.CameraMode:SetSelectionIndex(v369);
                    end;
                    setCameraModeVisible(cameraModeIsUserChoice());
                    return;
                end;
            end;
            local l_l_NewPage_0_40 = l_NewPage_0;
            local l_l_NewPage_0_41 = l_NewPage_0;
            local l_l_NewPage_0_42 = l_NewPage_0;
            local v375, v376, v377 = v93:AddNewRow(l_NewPage_0, "Camera Mode", "Selector", l_v338_0, 1);
            l_l_NewPage_0_40.CameraModeFrame = v375;
            l_l_NewPage_0_41.CameraModeLabel = v376;
            l_l_NewPage_0_42.CameraMode = v377;
            l_NewPage_0.CameraModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraModeFrame;
            v158[l_NewPage_0.CameraMode] = true;
            l_NewPage_0.CameraModeOverrideText = l_Create_0("TextLabel")({
                Name = "CameraDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v97.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v97.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.CameraModeFrame
            });
            if v337 then
                local l_v371_0 = v371 --[[ copy: 9 -> 30 ]];
                v337.TouchCameraMovementModeRegistered:connect(function(__) --[[ Line: 1388 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v371_0 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_v371_0();
                    end;
                end);
                v337.ComputerCameraMovementModeRegistered:connect(function(__) --[[ Line: 1394 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v371_0 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_v371_0();
                    end;
                end);
            end;
            local l_v371_1 = v371 --[[ copy: 9 -> 25 ]];
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1401 ]]
                -- upvalues: l_v371_1 (copy)
                l_v371_1();
            end);
            l_l_NewPage_0_40 = false;
            local l_v340_1 = v340 --[[ copy: 8 -> 26 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v383) --[[ Line: 1406 ]]
                -- upvalues: l_v340_1 (copy), l_l_NewPage_0_40 (ref), v147 (ref)
                if l_v340_1(v383) then
                    if l_l_NewPage_0_40 then
                        v147();
                    end;
                    l_l_NewPage_0_40 = true;
                end;
            end);
            v371();
        end;
        v337 = false;
        v338 = function() --[[ Line: 1422 ]] --[[ Name: createVROption ]]
            -- upvalues: v337 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v142 (ref)
            if not v337 then
                v337 = true;
                local v384 = nil;
                v384 = if l_GameSettings_0.VREnabled then {
                    "On", 
                    "Off (restart pending)"
                } else {
                    "On (restart pending)", 
                    "Off"
                };
                local l_l_NewPage_0_43 = l_NewPage_0;
                local l_l_NewPage_0_44 = l_NewPage_0;
                local l_l_NewPage_0_45 = l_NewPage_0;
                local v388, v389, v390 = v93:AddNewRow(l_NewPage_0, "VR", "Selector", v384, l_GameSettings_0.VREnabled and 1 or 2);
                l_l_NewPage_0_43.VREnabledFrame = v388;
                l_l_NewPage_0_44.VREnabledLabel = v389;
                l_l_NewPage_0_45.VREnabledSelector = v390;
                l_NewPage_0.VREnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VREnabledFrame;
                do
                    local l_v384_0 = v384;
                    l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v392) --[[ Line: 1437 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v384_0 (ref), v142 (ref)
                        local v393 = {
                            On = {
                                Name = "On", 
                                Value = 1
                            }, 
                            Off = {
                                Name = "Off", 
                                Value = 2
                            }
                        };
                        local v394 = v392 == v393.On.Value;
                        if l_GameSettings_0.VREnabled ~= v394 then
                            l_GameSettings_0.VREnabled = v394;
                            local v395 = l_v384_0[v393.On.Value];
                            local v396 = l_v384_0[v392];
                            if v396 == l_v384_0[v393.On.Value] then
                                v395 = l_v384_0[v393.Off.Value];
                            end;
                            v142("vr_mode", v395, v396);
                        end;
                    end);
                end;
            end;
        end;
        v339 = function() --[[ Line: 1456 ]] --[[ Name: onVREnabledChanged ]]
            -- upvalues: l_VRService_0 (ref), l_GameSettings_0 (ref), v338 (copy)
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v338();
                return;
            else
                if l_GameSettings_0.HasEverUsedVR then
                    v338();
                end;
                return;
            end;
        end;
        if v40() and l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
            v338();
        else
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v338();
            elseif l_GameSettings_0.HasEverUsedVR then
                v338();
            end;
            l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v339);
        end;
        v340 = {};
        local v397 = {};
        local v398 = {};
        local v399 = {};
        local function v401(__) --[[ Line: 1481 ]]

        end;
        local function __(v402) --[[ Line: 1485 ]] --[[ Name: setMovementModeVisible ]]
            -- upvalues: l_NewPage_0 (ref), v340 (ref)
            if l_NewPage_0.MovementMode then
                local v403 = v402 and #v340 > 0;
                l_NewPage_0.MovementMode.SelectorFrame.Visible = v403;
                l_NewPage_0.MovementMode:SetInteractable(v403);
                l_NewPage_0.MovementModeOverrideText.Visible = not v403;
            end;
        end;
        if v332 then
            local v405 = {};
            local v406 = v94.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
            local function __(v407) --[[ Line: 1499 ]] --[[ Name: getDisplayName ]]
                -- upvalues: l_UserInputService_0 (ref), v63 (ref), l_Constants_0 (ref), v74 (ref), v75 (ref)
                local l_v407_0 = v407;
                if v407 == "Default" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return (v63:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey));
                    else
                        return v74.DEFAULT_KEYBOARD;
                    end;
                elseif v407 == "KeyboardMouse" then
                    return "Keyboard + Mouse";
                elseif v407 == "ClickToMove" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return v74.TAP_TO_MOVE;
                    else
                        return v74.CLICK_TO_MOVE;
                    end;
                elseif v407 == "DynamicThumbstick" then
                    return "Dynamic Thumbstick";
                else
                    if v407 == "Thumbstick" then
                        l_v407_0 = v75;
                    end;
                    return l_v407_0;
                end;
            end;
            local l_l_NewPage_0_46 = l_NewPage_0;
            local l_l_NewPage_0_47 = l_NewPage_0;
            local l_l_NewPage_0_48 = l_NewPage_0;
            local v413, v414, v415 = v93:AddNewRow(l_NewPage_0, "Movement Mode", "Selector", v405, 1);
            l_l_NewPage_0_46.MovementModeFrame = v413;
            l_l_NewPage_0_47.MovementModeLabel = v414;
            l_l_NewPage_0_48.MovementMode = v415;
            l_NewPage_0.MovementModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MovementModeFrame;
            v158[l_NewPage_0.MovementMode] = true;
            l_NewPage_0.MovementModeOverrideText = l_Create_0("TextLabel")({
                Name = "MovementDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v97.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v97.fontSize(Enum.FontSize.Size24, "GameSettings"), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.6, 0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = false, 
                ZIndex = 2, 
                Parent = l_NewPage_0.MovementModeFrame
            });
            l_l_NewPage_0_46 = function(v416) --[[ Line: 1540 ]] --[[ Name: setMovementMode ]]
                -- upvalues: v124 (ref), l_GameSettings_0 (ref), v142 (ref)
                local v417 = nil;
                if v416.EnumType == Enum.TouchMovementMode then
                    if v124() then
                        v417 = l_GameSettings_0.TouchMovementMode;
                    end;
                    l_GameSettings_0.TouchMovementMode = v416;
                else
                    if v124() then
                        v417 = l_GameSettings_0.ComputerMovementMode;
                    end;
                    l_GameSettings_0.ComputerMovementMode = v416;
                end;
                if v124() then
                    v142("movement_mode", v417, v416);
                end;
            end;
            v401 = function(v418) --[[ Line: 1557 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v340 (ref)
                local v419 = nil;
                v419 = if v418 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                local l_v419_0 = v419;
                if l_NewPage_0.MovementMode then
                    local v421 = l_v419_0 and #v340 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v421;
                    l_NewPage_0.MovementMode:SetInteractable(v421);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v421;
                end;
                if l_NewPage_0.MovementModeOverrideText then
                    l_NewPage_0.MovementModeOverrideText.Visible = not v419;
                end;
            end;
            local l_v406_0 = v406 --[[ copy: 15 -> 27 ]];
            local l_l_l_NewPage_0_46_0 = l_l_NewPage_0_46 --[[ copy: 17 -> 28 ]];
            l_l_NewPage_0_47 = function() --[[ Line: 1569 ]] --[[ Name: updateMovementModes ]]
                -- upvalues: l_UserInputService_0 (ref), l_v406_0 (copy), v340 (ref), v397 (ref), v398 (ref), v399 (ref), l_NewPage_0 (ref), v63 (ref), l_Constants_0 (ref), v74 (ref), v75 (ref), l_GameSettings_0 (ref), l_l_l_NewPage_0_46_0 (copy), v401 (ref)
                local v424 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                if l_v406_0 then
                    if v424 then
                        v340 = l_v406_0:GetRegisteredTouchMovementModes();
                    else
                        v340 = l_v406_0:GetRegisteredComputerMovementModes();
                    end;
                end;
                v397 = {};
                v398 = {};
                v399 = {};
                if #v340 <= 0 then
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                        l_NewPage_0.MovementMode:SetInteractable(false);
                        l_NewPage_0.MovementModeOverrideText.Visible = true;
                    end;
                    return;
                else
                    if l_NewPage_0.MovementMode then
                        local v425 = #v340 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v425;
                        l_NewPage_0.MovementMode:SetInteractable(v425);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v425;
                    end;
                    for v426, v427 in v340 do
                        v398[v426] = v427;
                        local l_v399_0 = v399;
                        local l_Name_3 = v427.Name;
                        local l_l_Name_3_0 = l_Name_3;
                        if l_Name_3 == "Default" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v63:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey) else v74.DEFAULT_KEYBOARD;
                        elseif l_Name_3 == "KeyboardMouse" then
                            l_l_Name_3_0 = "Keyboard + Mouse";
                        elseif l_Name_3 == "ClickToMove" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v74.TAP_TO_MOVE else v74.CLICK_TO_MOVE;
                        elseif l_Name_3 == "DynamicThumbstick" then
                            l_l_Name_3_0 = "Dynamic Thumbstick";
                        elseif l_Name_3 == "Thumbstick" then
                            l_l_Name_3_0 = v75;
                        end;
                        l_v399_0[v426] = l_l_Name_3_0;
                        v397[v427] = v426;
                    end;
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode:UpdateOptions(v399);
                    end;
                    local v431 = nil;
                    v431 = if v424 then l_GameSettings_0.TouchMovementMode else l_GameSettings_0.ComputerMovementMode;
                    if v431 then
                        l_l_l_NewPage_0_46_0(v431);
                        l_NewPage_0.MovementMode:SetSelectionIndex(v397[v431]);
                    end;
                    v401(v424);
                    return;
                end;
            end;
            l_l_NewPage_0_47();
            if v406 then
                v406.TouchMovementModeRegistered:connect(function(__) --[[ Line: 1613 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
                v406.ComputerMovementModeRegistered:connect(function(__) --[[ Line: 1619 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
            end;
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1626 ]]
                -- upvalues: l_l_NewPage_0_47 (copy)
                l_l_NewPage_0_47();
            end);
            local l_l_l_NewPage_0_46_1 = l_l_NewPage_0_46 --[[ copy: 17 -> 29 ]];
            l_NewPage_0.MovementMode.IndexChanged:connect(function(v435) --[[ Line: 1630 ]]
                -- upvalues: l_l_l_NewPage_0_46_1 (copy), v398 (ref), v147 (ref)
                l_l_l_NewPage_0_46_1(v398[v435]);
                v147();
            end);
        end;
        local v436 = false;
        local v437 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
        if not if v437 then l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            l_NewPage_0.CameraModeOverrideText.Visible = true;
            setCameraModeVisible(false);
        else
            l_NewPage_0.CameraModeOverrideText.Visible = false;
            setCameraModeVisible(true);
        end;
        local v438 = false;
        v438 = if v437 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
        if l_NewPage_0.MovementModeOverrideText then
            if not v438 then
                l_NewPage_0.MovementModeOverrideText.Visible = true;
                if l_NewPage_0.MovementMode then
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                    l_NewPage_0.MovementMode:SetInteractable(false);
                    l_NewPage_0.MovementModeOverrideText.Visible = true;
                end;
            else
                l_NewPage_0.MovementModeOverrideText.Visible = false;
                if l_NewPage_0.MovementMode then
                    local v439 = #v340 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v439;
                    l_NewPage_0.MovementMode:SetInteractable(v439);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v439;
                end;
            end;
        end;
        local v440 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v440;
            local v441 = not v440 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v441;
                l_NewPage_0.ShiftLockMode:SetInteractable(v441);
            end;
        end;
        v436 = function(v442) --[[ Line: 1676 ]] --[[ Name: updateUserSettingsMenu ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v401 (ref), v340 (ref)
            if v442 == "DevEnableMouseLock" then
                local v443 = not l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockOverrideText then
                    l_NewPage_0.ShiftLockOverrideText.Visible = v443;
                    local v444 = not v443 and l_LocalPlayer_0.DevEnableMouseLock;
                    if l_NewPage_0.ShiftLockMode then
                        l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v444;
                        l_NewPage_0.ShiftLockMode:SetInteractable(v444);
                        return;
                    end;
                end;
            elseif v442 == "DevComputerCameraMode" then
                local v445 = l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
                setCameraModeVisible(v445);
                l_NewPage_0.CameraModeOverrideText.Visible = not v445;
                return;
            elseif v442 == "DevComputerMovementMode" then
                if v401 ~= nil then
                    v401(false);
                    return;
                else
                    local v446 = l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v447 = v446 and #v340 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v447;
                        l_NewPage_0.MovementMode:SetInteractable(v447);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v447;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v446;
                        return;
                    end;
                end;
            elseif v442 == "DevTouchMovementMode" then
                if v401 ~= nil then
                    v401(true);
                    return;
                else
                    local v448 = l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v449 = v448 and #v340 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v449;
                        l_NewPage_0.MovementMode:SetInteractable(v449);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v449;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v448;
                        return;
                    end;
                end;
            elseif v442 == "DevTouchCameraMode" then
                local v450 = l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
                setCameraModeVisible(v450);
                l_NewPage_0.CameraModeOverrideText.Visible = not v450;
            end;
        end;
        l_LocalPlayer_0.Changed:connect(function(v451) --[[ Line: 1711 ]]
            -- upvalues: v71 (ref), v436 (copy), v70 (ref)
            if v71[v451] then
                v436(v451);
            end;
            if v70[v451] then
                v436(v451);
            end;
        end);
    end;
    local function v474() --[[ Line: 1724 ]] --[[ Name: createFeedbackModeOptions ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v132 (ref), l_NewPage_0 (copy), l_SafetyService_0 (ref), v20 (ref), v142 (ref), v131 (ref), v93 (ref), v77 (ref), v63 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v115 (ref)
        local v453 = l_Url_0.ROLES_URL .. "v1/users/authenticated/roles";
        local v454 = l_HttpService_0:RequestInternal({
            Url = v453, 
            Method = "GET"
        });
        local function v463(v455) --[[ Line: 1731 ]] --[[ Name: rolesCheckCallback ]]
            -- upvalues: v132 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v142 (ref), v131 (ref), v93 (ref), v77 (ref), v63 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v455 then
                if not v132 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                    return;
                else
                    local function v456() --[[ Line: 1743 ]] --[[ Name: onToggleFeedbackMode ]]
                        -- upvalues: v132 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v142 (ref)
                        if v132 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                            return;
                        else
                            l_NewPage_0.HubRef:PopMenu(false, true);
                            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                                l_SafetyService_0.IsCaptureModeForReport = false;
                            end;
                            if v20 ~= nil then
                                v20:ToggleCaptureMode();
                            end;
                            v142("translation_feedback", "", "pressed");
                            return;
                        end;
                    end;
                    local v457 = nil;
                    local v458 = nil;
                    if v131 then
                        local v459, v460 = v93:MakeStyledButton("toggleFeedbackModeButton", v77, UDim2.new(1, 0, 1, -20), v456, l_NewPage_0);
                        v457 = v459;
                        v458 = v460;
                        v457.Size = UDim2.new(0.6, 0, 0, 40);
                        v457.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v457.AnchorPoint = Vector2.new(0, 0.5);
                    else
                        local v461, v462 = v93:MakeStyledButton("toggleFeedbackModeButton", v77, UDim2.new(0, 300, 1, -20), v456, l_NewPage_0);
                        v457 = v461;
                        v458 = v462;
                        v457.Size = UDim2.new(0, 300, 0, 30);
                        v457.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v457.AnchorPoint = Vector2.new(0, 0.5);
                    end;
                    v457.ZIndex = 2;
                    v457.Selectable = true;
                    v458.ZIndex = 2;
                    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
                        l_NewPage_0.toggleFeedbackModeButton = v457;
                        l_NewPage_0.toggleFeedbackModeText = v458;
                    end;
                    if v131 then
                        v93:AddNewRowObject(l_NewPage_0, v63:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v457, nil, true).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                        return;
                    else
                        v93:AddNewRowObject(l_NewPage_0, v63:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v457).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                    end;
                end;
            end;
        end;
        if v126 then
            v463(true);
            return;
        else
            v454:Start(function(v464, v465) --[[ Line: 1827 ]]
                -- upvalues: l_HttpService_0 (ref), v115 (ref), v453 (copy), v463 (copy)
                local v466 = false;
                local v467 = false;
                local v468 = nil;
                if not v464 then
                    v468 = "Roles Api Request: Connection error";
                elseif v465.StatusCode == 401 then
                    v468 = "Roles Api Request: Unauthorized";
                elseif v465.StatusCode < 200 or v465.StatusCode >= 400 then
                    v468 = "Roles Api Status code: " .. v465.StatusCode;
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 1839 ]]
                        -- upvalues: l_HttpService_0 (ref), v465 (copy), v466 (ref)
                        local v469 = l_HttpService_0:JSONDecode(v465.Body);
                        for __, v471 in pairs(v469.roles) do
                            if v471 == "Soothsayer" then
                                v466 = true;
                            end;
                        end;
                    end);
                    v467 = l_status_0;
                    v468 = l_result_0;
                end;
                if not v467 then
                    v115:warning("Feedback Mode initialization api call failed with url: " .. v453 .. " and with error message: " .. v468);
                end;
                v463(v466);
            end);
            return;
        end;
    end;
    local function v632() --[[ Line: 1867 ]] --[[ Name: createTranslationOptions ]]
        -- upvalues: l_Players_0 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v115 (ref), l_NewPage_0 (copy), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_LocalPlayer_0 (ref), v142 (ref), l_RunService_0 (ref)
        local v475 = 1;
        local v476 = 1;
        local v477 = false;
        local v478 = nil;
        local v479 = nil;
        local l_LocaleId_0 = l_Players_0.LocalPlayer.LocaleId;
        local v481 = nil;
        local v482 = nil;
        local v483 = {};
        local v484 = {};
        local v485 = {};
        local v486 = {};
        local v487 = {};
        local v488 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
        local v489 = l_HttpService_0:RequestInternal({
            Url = v488, 
            Method = "GET"
        });
        local v490 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
        local v491 = l_HttpService_0:RequestInternal({
            Url = v490, 
            Method = "GET"
        });
        local v492 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId);
        local v493 = l_HttpService_0:RequestInternal({
            Url = v492, 
            Method = "GET"
        });
        local v494 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
        local v495 = l_HttpService_0:RequestInternal({
            Url = v494, 
            Method = "GET"
        });
        local function v530(v496, v497) --[[ Line: 1932 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
            -- upvalues: v115 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v487 (copy), v485 (copy), v478 (ref), v483 (copy), v482 (ref), v484 (copy), v475 (ref), v476 (ref), l_LocalPlayer_0 (ref), v479 (ref), v142 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v477 (ref), l_RunService_0 (ref)
            if not v496 then
                if v497 == nil then
                    v497 = "Execution path did not set earliest error to non-nil value.";
                end;
                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v497);
                local l_l_NewPage_0_49 = l_NewPage_0;
                local l_l_NewPage_0_50 = l_NewPage_0;
                local l_l_NewPage_0_51 = l_NewPage_0;
                local v501, v502, v503 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v76
                }, 1);
                l_l_NewPage_0_49.LanguageSelectorFrame = v501;
                l_l_NewPage_0_50.LanguageSelectorLabel = v502;
                l_l_NewPage_0_51.LanguageSelectorMode = v503;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            else
                local v504 = false;
                table.insert(v487, v485[v478].languageName .. " (Original)");
                for __, v506 in pairs(v483) do
                    if v506 == v482 then
                        v504 = true;
                    end;
                    if v506 ~= v478 then
                        table.insert(v487, v485[v506].languageName);
                    end;
                end;
                if v504 == true then
                    for v507, v508 in pairs(v487) do
                        if v507 ~= 1 and v484[v508] == v482 then
                            v475 = v507;
                            v476 = v507;
                        end;
                    end;
                end;
                local l_l_NewPage_0_52 = l_NewPage_0;
                local l_l_NewPage_0_53 = l_NewPage_0;
                local l_l_NewPage_0_54 = l_NewPage_0;
                local v512, v513, v514 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v487, v475);
                l_l_NewPage_0_52.LanguageSelectorFrame = v512;
                l_l_NewPage_0_53.LanguageSelectorLabel = v513;
                l_l_NewPage_0_54.LanguageSelectorMode = v514;
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                if v475 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v479);
                else
                    l_l_NewPage_0_52 = v484[v487[v475]];
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485[l_l_NewPage_0_52].localeCode);
                end;
                l_NewPage_0.LanguageSelectorMode.CurrentLanguage = l_NewPage_0.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                l_l_NewPage_0_52 = function(v515) --[[ Line: 2012 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: l_NewPage_0 (ref), v485 (ref), v478 (ref), v484 (ref), v487 (ref), v142 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v476 (ref), l_LocalPlayer_0 (ref), v479 (ref), v115 (ref), v477 (ref), l_RunService_0 (ref)
                    l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                    local v516 = nil;
                    v516 = if v515 == 1 then v485[v478].id else v485[v484[v487[v515]]].id;
                    local l_CurrentLanguage_0 = l_NewPage_0.LanguageSelectorMode.CurrentLanguage;
                    local v518 = v487[v515];
                    if l_CurrentLanguage_0 ~= v518 then
                        l_NewPage_0.LanguageSelectorMode.CurrentLanguage = v518;
                        v142("experience_language", l_CurrentLanguage_0, v518);
                    end;
                    local v519 = {
                        settingValue = {
                            settingType = "LanguageFamily", 
                            settingTargetId = v516
                        }
                    };
                    local v520 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v521 = l_HttpService_0:RequestInternal({
                        Url = v520, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v519)
                    });
                    local function v525(v522, v523) --[[ Line: 2059 ]] --[[ Name: callback ]]
                        -- upvalues: v476 (ref), v515 (copy), l_LocalPlayer_0 (ref), v479 (ref), v484 (ref), v487 (ref), v485 (ref), v115 (ref), v477 (ref), l_NewPage_0 (ref)
                        if v522 then
                            v476 = v515;
                            if v515 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v479);
                            else
                                local v524 = v484[v487[v515]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485[v524].localeCode);
                            end;
                        else
                            v115:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v523);
                            v477 = true;
                            l_NewPage_0.LanguageSelectorMode:SetSelectionIndex(v476);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v525(true, nil);
                        return;
                    elseif v477 then
                        v477 = false;
                        v525(true, nil);
                        return;
                    else
                        v521:Start(function(v526, v527) --[[ Line: 2102 ]]
                            -- upvalues: v115 (ref), v520 (copy), v525 (copy)
                            local v528 = false;
                            local v529 = nil;
                            if not v526 then
                                v529 = "User Experience Language Settings Update Request: Connection error";
                            elseif v527.StatusCode == 401 then
                                v529 = "User Experience Language Settings Update Request: Unauthorized";
                            elseif v527.StatusCode < 200 or v527.StatusCode >= 400 then
                                v529 = "User Experience Language Settings Update Request Status Code: " .. v527.StatusCode;
                            else
                                v115:info("User Experience Language Settings Update Request succeeded with code: " .. v527.StatusCode);
                                v528 = true;
                            end;
                            if not v528 then
                                v115:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v520 .. " with error message: " .. v529);
                            end;
                            v525(v528, v529);
                        end);
                        return;
                    end;
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(l_l_NewPage_0_52);
                return;
            end;
        end;
        local function __(v531, v532) --[[ Line: 2137 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
            -- upvalues: v495 (copy), l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (copy), v115 (ref), v494 (copy), v530 (copy)
            if v531 then
                v495:Start(function(v533, v534) --[[ Line: 2139 ]]
                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v530 (ref)
                    local v535 = false;
                    local v536 = nil;
                    if not v533 then
                        v536 = "User Experience Language Setting Request: Connection error";
                    elseif v534.StatusCode == 401 then
                        v536 = "User Experience Language Setting Request: Unauthorized";
                    elseif v534.StatusCode < 200 or v534.StatusCode >= 400 then
                        v536 = "User Experience Language Setting Request Status code: " .. v534.StatusCode;
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 2150 ]]
                            -- upvalues: l_HttpService_0 (ref), v534 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                            local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v534.Body).userUniverseLocalizationSettingValue;
                            if l_userUniverseLocalizationSettingValue_0 == nil then
                                v482 = v481;
                                return;
                            else
                                if l_userUniverseLocalizationSettingValue_0.settingType == "SourceOrTranslation" then
                                    if l_userUniverseLocalizationSettingValue_0.settingTargetId == 1 then
                                        v482 = v478;
                                    else
                                        v482 = v481;
                                    end;
                                end;
                                if l_userUniverseLocalizationSettingValue_0.settingType == "LanguageFamily" then
                                    if v486[l_userUniverseLocalizationSettingValue_0.settingTargetId] == nil then
                                        v482 = v481;
                                        return;
                                    else
                                        v482 = v486[l_userUniverseLocalizationSettingValue_0.settingTargetId];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v535 = l_status_1;
                        v536 = l_result_1;
                    end;
                    if not v535 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v536);
                    end;
                    v530(v535, v536);
                end);
                return;
            else
                v530(false, v532);
                return;
            end;
        end;
        local function __(v541, v542) --[[ Line: 2199 ]] --[[ Name: experienceSourceLanguageCallback ]]
            -- upvalues: v493 (copy), l_HttpService_0 (ref), v483 (copy), v115 (ref), v492 (copy), v495 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (copy), v494 (copy), v530 (copy)
            if v541 then
                v493:Start(function(v543, v544) --[[ Line: 2201 ]]
                    -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), v542 (ref), v541 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v530 (ref)
                    local v545 = false;
                    local v546 = nil;
                    if not v543 then
                        v546 = "Experience Supported Language Request: Connection error";
                    elseif v544.StatusCode == 401 then
                        v546 = "Experience Supported Language Request: Unauthorized";
                    elseif v544.StatusCode < 200 or v544.StatusCode >= 400 then
                        v546 = "Experience Supported Language Request Status code: " .. v544.StatusCode;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 2211 ]]
                            -- upvalues: l_HttpService_0 (ref), v544 (copy), v483 (ref)
                            local v547 = l_HttpService_0:JSONDecode(v544.Body);
                            for v548, v549 in pairs(v547.data) do
                                v483[v548] = v549.languageCode;
                            end;
                        end);
                        v545 = l_status_2;
                        v546 = l_result_2;
                    end;
                    if not v545 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v546);
                    end;
                    if v542 == nil then
                        v542 = v546;
                    end;
                    local v552 = v545 and v541;
                    local l_v542_0 = v542;
                    if v552 then
                        v495:Start(function(v554, v555) --[[ Line: 2139 ]]
                            -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v530 (ref)
                            local v556 = false;
                            local v557 = nil;
                            if not v554 then
                                v557 = "User Experience Language Setting Request: Connection error";
                            elseif v555.StatusCode == 401 then
                                v557 = "User Experience Language Setting Request: Unauthorized";
                            elseif v555.StatusCode < 200 or v555.StatusCode >= 400 then
                                v557 = "User Experience Language Setting Request Status code: " .. v555.StatusCode;
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 2150 ]]
                                    -- upvalues: l_HttpService_0 (ref), v555 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                    local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v555.Body).userUniverseLocalizationSettingValue;
                                    if l_userUniverseLocalizationSettingValue_1 == nil then
                                        v482 = v481;
                                        return;
                                    else
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "SourceOrTranslation" then
                                            if l_userUniverseLocalizationSettingValue_1.settingTargetId == 1 then
                                                v482 = v478;
                                            else
                                                v482 = v481;
                                            end;
                                        end;
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "LanguageFamily" then
                                            if v486[l_userUniverseLocalizationSettingValue_1.settingTargetId] == nil then
                                                v482 = v481;
                                                return;
                                            else
                                                v482 = v486[l_userUniverseLocalizationSettingValue_1.settingTargetId];
                                            end;
                                        end;
                                        return;
                                    end;
                                end);
                                v556 = l_status_3;
                                v557 = l_result_3;
                            end;
                            if not v556 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v557);
                            end;
                            v530(v556, v557);
                        end);
                        return;
                    else
                        v530(false, l_v542_0);
                        return;
                    end;
                end);
            else
                v530(false, v542);
            end;
        end;
        local function __(v562, v563) --[[ Line: 2240 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
            -- upvalues: v491 (copy), l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (copy), v115 (ref), v490 (copy), v493 (copy), v483 (copy), v492 (copy), v495 (copy), v482 (ref), v481 (ref), v486 (copy), v494 (copy), v530 (copy)
            if v562 then
                v491:Start(function(v564, v565) --[[ Line: 2242 ]]
                    -- upvalues: l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (ref), v115 (ref), v490 (ref), v563 (ref), v562 (copy), v493 (ref), v483 (ref), v492 (ref), v495 (ref), v482 (ref), v481 (ref), v486 (ref), v494 (ref), v530 (ref)
                    local v566 = false;
                    local v567 = nil;
                    if not v564 then
                        v567 = "Experience Source Language Request: Connection error";
                    elseif v565.StatusCode == 401 then
                        v567 = "Experience Source Language Request: Unauthorized";
                    elseif v565.StatusCode < 200 or v565.StatusCode >= 400 then
                        v567 = "Experience Source Language Status code: " .. v565.StatusCode;
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 2253 ]]
                            -- upvalues: l_HttpService_0 (ref), v565 (copy), v478 (ref), v479 (ref), v485 (ref)
                            v478 = l_HttpService_0:JSONDecode(v565.Body).languageCode;
                            v479 = v485[v478].localeCode;
                        end);
                        v566 = l_status_4;
                        v567 = l_result_4;
                    end;
                    if not v566 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v490 .. " with error message: " .. v567);
                    end;
                    if v563 == nil then
                        v563 = v567;
                    end;
                    local v570 = v566 and v562;
                    local l_v563_0 = v563;
                    if v570 then
                        v493:Start(function(v572, v573) --[[ Line: 2201 ]]
                            -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), l_v563_0 (ref), v570 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v530 (ref)
                            local v574 = false;
                            local v575 = nil;
                            if not v572 then
                                v575 = "Experience Supported Language Request: Connection error";
                            elseif v573.StatusCode == 401 then
                                v575 = "Experience Supported Language Request: Unauthorized";
                            elseif v573.StatusCode < 200 or v573.StatusCode >= 400 then
                                v575 = "Experience Supported Language Request Status code: " .. v573.StatusCode;
                            else
                                local l_status_5, l_result_5 = pcall(function() --[[ Line: 2211 ]]
                                    -- upvalues: l_HttpService_0 (ref), v573 (copy), v483 (ref)
                                    local v576 = l_HttpService_0:JSONDecode(v573.Body);
                                    for v577, v578 in pairs(v576.data) do
                                        v483[v577] = v578.languageCode;
                                    end;
                                end);
                                v574 = l_status_5;
                                v575 = l_result_5;
                            end;
                            if not v574 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v575);
                            end;
                            if l_v563_0 == nil then
                                l_v563_0 = v575;
                            end;
                            local v581 = v574 and v570;
                            local l_l_v563_0_0 = l_v563_0;
                            if v581 then
                                v495:Start(function(v583, v584) --[[ Line: 2139 ]]
                                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v530 (ref)
                                    local v585 = false;
                                    local v586 = nil;
                                    if not v583 then
                                        v586 = "User Experience Language Setting Request: Connection error";
                                    elseif v584.StatusCode == 401 then
                                        v586 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v584.StatusCode < 200 or v584.StatusCode >= 400 then
                                        v586 = "User Experience Language Setting Request Status code: " .. v584.StatusCode;
                                    else
                                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2150 ]]
                                            -- upvalues: l_HttpService_0 (ref), v584 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                            local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v584.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_2 == nil then
                                                v482 = v481;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_2.settingTargetId == 1 then
                                                        v482 = v478;
                                                    else
                                                        v482 = v481;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "LanguageFamily" then
                                                    if v486[l_userUniverseLocalizationSettingValue_2.settingTargetId] == nil then
                                                        v482 = v481;
                                                        return;
                                                    else
                                                        v482 = v486[l_userUniverseLocalizationSettingValue_2.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v585 = l_status_6;
                                        v586 = l_result_6;
                                    end;
                                    if not v585 then
                                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v586);
                                    end;
                                    v530(v585, v586);
                                end);
                                return;
                            else
                                v530(false, l_l_v563_0_0);
                                return;
                            end;
                        end);
                    else
                        v530(false, l_v563_0);
                    end;
                end);
            else
                v530(false, v563);
                --[[ close >= 2 ]]
            end;
        end;
        v489:Start(function(v591, v592) --[[ Line: 2284 ]]
            -- upvalues: l_HttpService_0 (ref), v485 (copy), v486 (copy), v484 (copy), l_LocaleId_0 (copy), v481 (ref), v115 (ref), v488 (copy), v491 (copy), v478 (ref), v479 (ref), v490 (copy), v493 (copy), v483 (copy), v492 (copy), v495 (copy), v482 (ref), v494 (copy), v530 (copy)
            local v593 = false;
            local v594 = nil;
            if not v591 then
                v594 = "Locale Code to Language Code Mapping Request: Connection error";
            elseif v592.StatusCode == 401 then
                v594 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif v592.StatusCode < 200 or v592.StatusCode >= 400 then
                v594 = "Locale Code to Language Code Mapping Request Status code: " .. v592.StatusCode;
            else
                local l_status_7, l_result_7 = pcall(function() --[[ Line: 2295 ]]
                    -- upvalues: l_HttpService_0 (ref), v592 (copy), v485 (ref), v486 (ref), v484 (ref), l_LocaleId_0 (ref), v481 (ref)
                    local v595 = l_HttpService_0:JSONDecode(v592.Body);
                    for __, v597 in pairs(v595.data) do
                        local l_languageCode_0 = v597.locale.language.languageCode;
                        local l_locale_0 = v597.locale.locale;
                        local l_name_0 = v597.locale.language.name;
                        local l_id_0 = v597.locale.language.id;
                        v485[l_languageCode_0] = {
                            localeCode = l_locale_0, 
                            languageName = l_name_0, 
                            id = l_id_0
                        };
                        v486[l_id_0] = l_languageCode_0;
                        v484[l_name_0] = l_languageCode_0;
                        if v597.locale.locale == l_LocaleId_0:gsub("-", "_") then
                            v481 = v597.locale.language.languageCode;
                        end;
                    end;
                end);
                v593 = l_status_7;
                v594 = l_result_7;
            end;
            if not v593 then
                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v488 .. " with error message: " .. v594);
            end;
            local l_v593_0 = v593;
            local l_v594_0 = v594;
            if l_v593_0 then
                v491:Start(function(v606, v607) --[[ Line: 2242 ]]
                    -- upvalues: l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (ref), v115 (ref), v490 (ref), l_v594_0 (ref), l_v593_0 (copy), v493 (ref), v483 (ref), v492 (ref), v495 (ref), v482 (ref), v481 (ref), v486 (ref), v494 (ref), v530 (ref)
                    local v608 = false;
                    local v609 = nil;
                    if not v606 then
                        v609 = "Experience Source Language Request: Connection error";
                    elseif v607.StatusCode == 401 then
                        v609 = "Experience Source Language Request: Unauthorized";
                    elseif v607.StatusCode < 200 or v607.StatusCode >= 400 then
                        v609 = "Experience Source Language Status code: " .. v607.StatusCode;
                    else
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 2253 ]]
                            -- upvalues: l_HttpService_0 (ref), v607 (copy), v478 (ref), v479 (ref), v485 (ref)
                            v478 = l_HttpService_0:JSONDecode(v607.Body).languageCode;
                            v479 = v485[v478].localeCode;
                        end);
                        v608 = l_status_8;
                        v609 = l_result_8;
                    end;
                    if not v608 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v490 .. " with error message: " .. v609);
                    end;
                    if l_v594_0 == nil then
                        l_v594_0 = v609;
                    end;
                    local v612 = v608 and l_v593_0;
                    local l_l_v594_0_0 = l_v594_0;
                    if v612 then
                        v493:Start(function(v614, v615) --[[ Line: 2201 ]]
                            -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), l_l_v594_0_0 (ref), v612 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v530 (ref)
                            local v616 = false;
                            local v617 = nil;
                            if not v614 then
                                v617 = "Experience Supported Language Request: Connection error";
                            elseif v615.StatusCode == 401 then
                                v617 = "Experience Supported Language Request: Unauthorized";
                            elseif v615.StatusCode < 200 or v615.StatusCode >= 400 then
                                v617 = "Experience Supported Language Request Status code: " .. v615.StatusCode;
                            else
                                local l_status_9, l_result_9 = pcall(function() --[[ Line: 2211 ]]
                                    -- upvalues: l_HttpService_0 (ref), v615 (copy), v483 (ref)
                                    local v618 = l_HttpService_0:JSONDecode(v615.Body);
                                    for v619, v620 in pairs(v618.data) do
                                        v483[v619] = v620.languageCode;
                                    end;
                                end);
                                v616 = l_status_9;
                                v617 = l_result_9;
                            end;
                            if not v616 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v617);
                            end;
                            if l_l_v594_0_0 == nil then
                                l_l_v594_0_0 = v617;
                            end;
                            local v623 = v616 and v612;
                            local l_l_l_v594_0_0_0 = l_l_v594_0_0;
                            if v623 then
                                v495:Start(function(v625, v626) --[[ Line: 2139 ]]
                                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v530 (ref)
                                    local v627 = false;
                                    local v628 = nil;
                                    if not v625 then
                                        v628 = "User Experience Language Setting Request: Connection error";
                                    elseif v626.StatusCode == 401 then
                                        v628 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v626.StatusCode < 200 or v626.StatusCode >= 400 then
                                        v628 = "User Experience Language Setting Request Status code: " .. v626.StatusCode;
                                    else
                                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2150 ]]
                                            -- upvalues: l_HttpService_0 (ref), v626 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                            local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v626.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_3 == nil then
                                                v482 = v481;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_3.settingTargetId == 1 then
                                                        v482 = v478;
                                                    else
                                                        v482 = v481;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "LanguageFamily" then
                                                    if v486[l_userUniverseLocalizationSettingValue_3.settingTargetId] == nil then
                                                        v482 = v481;
                                                        return;
                                                    else
                                                        v482 = v486[l_userUniverseLocalizationSettingValue_3.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v627 = l_status_10;
                                        v628 = l_result_10;
                                    end;
                                    if not v627 then
                                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v628);
                                    end;
                                    v530(v627, v628);
                                end);
                                return;
                            else
                                v530(false, l_l_l_v594_0_0_0);
                                return;
                            end;
                        end);
                    else
                        v530(false, l_l_v594_0_0);
                    end;
                end);
            else
                v530(false, l_v594_0);
                --[[ close >= 6 ]]
            end;
        end);
    end;
    local function v637(v633) --[[ Line: 2334 ]] --[[ Name: getChatTranslationLayerData ]]
        -- upvalues: v87 (ref), l_IXPServiceWrapper_0 (ref), v89 (ref)
        local v634 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v633 or v633 == "" then
            return v634;
        elseif v633 == "override" then
            v634.ChatTranslationEnabled = true;
            return v634;
        else
            if v87() then
                l_IXPServiceWrapper_0:WaitForInitialization();
            end;
            local l_status_11, l_result_11 = pcall(function() --[[ Line: 2356 ]]
                -- upvalues: l_IXPServiceWrapper_0 (ref), v633 (copy)
                return l_IXPServiceWrapper_0:GetLayerData(v633);
            end);
            if l_status_11 then
                if v89() then
                    v634.ChatTranslationEnabled = l_result_11.ChatTranslationEnabled or true;
                    v634.ChatTranslationToggleEnabled = l_result_11.ChatTranslationToggleEnabled or false;
                    return v634;
                else
                    v634.ChatTranslationEnabled = l_result_11.chatTranslationEnabled or false;
                    v634.ChatTranslationToggleEnabled = l_result_11.chatTranslationToggleEnabled or false;
                end;
            end;
            return v634;
        end;
    end;
    local function v648() --[[ Line: 2374 ]] --[[ Name: createVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v638 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_55 = l_NewPage_0;
        local l_l_NewPage_0_56 = l_NewPage_0;
        local l_l_NewPage_0_57 = l_NewPage_0;
        local v642, v643, v644 = v93:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v638);
        l_l_NewPage_0_55.VolumeFrame = v642;
        l_l_NewPage_0_56.VolumeLabel = v643;
        l_l_NewPage_0_57.VolumeSlider = v644;
        l_NewPage_0.VolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VolumeFrame;
        l_l_NewPage_0_55 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_55.Name = "VolumeChangeSound";
        l_l_NewPage_0_55.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v645) --[[ Line: 2385 ]]
            -- upvalues: v124 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_55 (copy), v142 (ref), v147 (ref)
            local v646 = nil;
            if v124() then
                v646 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v647 = v645 / 10;
            l_l_NewPage_0_55.Volume = v647;
            l_l_NewPage_0_55:Play();
            l_GameSettings_0.MasterVolume = v647;
            if v124() then
                v142("volume", v646, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v147();
        end);
    end;
    local function v658() --[[ Line: 2403 ]] --[[ Name: createPartyVoiceVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), l_default_3 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v649 = math.floor(l_GameSettings_0.PartyVoiceVolume * 10);
        local l_l_NewPage_0_58 = l_NewPage_0;
        local l_l_NewPage_0_59 = l_NewPage_0;
        local l_l_NewPage_0_60 = l_NewPage_0;
        local v653, v654, v655 = v93:AddNewRow(l_NewPage_0, "Party Voice Volume", "Slider", 10, v649);
        l_l_NewPage_0_58.PartyVoiceVolumeFrame = v653;
        l_l_NewPage_0_59.PartyVoiceVolumeLabel = v654;
        l_l_NewPage_0_60.PartyVoiceVolumeSlider = v655;
        l_NewPage_0.PartyVoiceVolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PartyVoiceVolumeFrame;
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            l_NewPage_0.PartyVoiceVolumeFrame.Visible = l_default_3.hasExperienceStarted;
            l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 2412 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = true;
            end);
            l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 2415 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = false;
            end);
        end;
        l_NewPage_0.PartyVoiceVolumeSlider.ValueChanged:connect(function(v656) --[[ Line: 2420 ]]
            -- upvalues: v124 (ref), v649 (copy), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
            local v657 = nil;
            if v124() then
                v657 = if v649 ~= nil then math.floor(v649 * 10 + 0.5) else 0;
            end;
            l_GameSettings_0.PartyVoiceVolume = v656 / 10;
            if v124() then
                v142("party_voice_volume", v657, (math.floor(v656 * 10 + 0.5)));
            end;
            v147();
        end);
    end;
    local function v668() --[[ Line: 2436 ]] --[[ Name: createHapticsToggle ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_getAppFeaturePolicies_0 (ref), v24 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v659 = l_GameSettings_0.HapticStrength == 0 and 1 or 2;
        local v660 = if v62 and l_getAppFeaturePolicies_0().getShouldUseVibrationInsteadOfHaptics() then v24:Format("CoreScripts.InGameMenu.Vibration") else "Haptics";
        local l_l_NewPage_0_61 = l_NewPage_0;
        local l_l_NewPage_0_62 = l_NewPage_0;
        local v663, v664, v665 = v93:AddNewRow(l_NewPage_0, v660, "Selector", {
            "Off", 
            "On"
        }, v659);
        l_l_NewPage_0_61.HapticsFrame = v663;
        _ = v664;
        l_l_NewPage_0_62.HapticsSelector = v665;
        l_NewPage_0.HapticsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.HapticsFrame;
        l_NewPage_0.HapticsSelector.IndexChanged:connect(function(v666) --[[ Line: 2445 ]]
            -- upvalues: l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            local l_HapticStrength_0 = l_GameSettings_0.HapticStrength;
            if v666 == 2 then
                l_GameSettings_0.HapticStrength = 1;
            else
                l_GameSettings_0.HapticStrength = 0;
            end;
            if v124() then
                v142("haptics_toggle", l_HapticStrength_0, l_GameSettings_0.HapticStrength);
            end;
            v147();
        end);
    end;
    local function v677() --[[ Line: 2461 ]] --[[ Name: createCameraInvertedOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), v124 (ref), v142 (ref), v147 (ref)
        local v669 = 1;
        if pcall(function() --[[ Line: 2463 ]]
            -- upvalues: l_GameSettings_0 (ref), v669 (ref)
            if l_GameSettings_0.CameraYInverted == true then
                v669 = 2;
            end;
        end) == false then
            return;
        else
            local l_l_NewPage_0_63 = l_NewPage_0;
            local l_l_NewPage_0_64 = l_NewPage_0;
            local v672, v673, v674 = v93:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v669);
            l_l_NewPage_0_63.CameraInvertedFrame = v672;
            _ = v673;
            l_l_NewPage_0_64.CameraInvertedSelector = v674;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraInvertedFrame;
            v158[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v675) --[[ Line: 2478 ]]
                -- upvalues: v124 (ref), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
                local v676 = nil;
                if v124() then
                    v676 = l_GameSettings_0.CameraYInverted;
                end;
                if v675 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v124() then
                    v142("camera_y_inverted", v676, l_GameSettings_0.CameraYInverted);
                end;
                v147();
            end);
            return;
        end;
    end;
    local function v682(v678) --[[ Line: 2497 ]] --[[ Name: setCameraSensitivity ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v679 = nil;
        local v680 = nil;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            if v124() then
                v679 = "gamepad";
                v680 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v678;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v124() then
                v679 = "mouse";
                v680 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v681 = Vector2.new(v678, v678);
            l_GameSettings_0.MouseSensitivityFirstPerson = v681;
            l_GameSettings_0.MouseSensitivityThirdPerson = v681;
        end;
        if v124() and typeof(v680) == "number" and typeof(v678) == "number" then
            v142("camera_sensitivity", tonumber(string.format("%.2f", v680)), tonumber(string.format("%.2f", v678)), {
                sensitivity_type = v679
            });
        end;
        v147();
    end;
    local function v710() --[[ Line: 2535 ]] --[[ Name: createMouseOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), l_Create_0 (ref), v97 (ref), v682 (copy)
        local function __(v683) --[[ Line: 2540 ]] --[[ Name: translateEngineMouseSensitivityToGui ]]
            local v684 = v683 <= 1 and math.floor((v683 - 0.2) / 0.16 + 0.5) or math.floor((v683 + 2) / 0.6 + 0.5);
            if v683 <= 0.2 then
                return 0;
            else
                return v684;
            end;
        end;
        local function __(v686) --[[ Line: 2548 ]] --[[ Name: translateGuiMouseSensitivityToEngine ]]
            local v687 = v686 <= 5 and 0.16 * v686 + 0.2 or 0.6 * v686 - 2;
            if v687 <= 0.2 then
                return 0.2;
            else
                return v687;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v690 = l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5);
        local v691 = l_MouseSensitivity_0 <= 0.2 and 0 or v690;
        l_MouseSensitivity_0 = true;
        v690 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_65 = l_NewPage_0;
        local l_l_NewPage_0_66 = l_NewPage_0;
        local l_l_NewPage_0_67 = l_NewPage_0;
        local v695, v696, v697 = v93:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v691);
        l_l_NewPage_0_65.MouseAdvancedFrame = v695;
        l_l_NewPage_0_66.MouseAdvancedLabel = v696;
        l_l_NewPage_0_67.MouseAdvancedEntry = v697;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MouseAdvancedFrame;
        v158[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_65 = l_Create_0("TextBox")({
            Name = "CameraSensitivityTextBox", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(0.8, 0.8, 0.8), 
            BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
            Font = v97.font(Enum.Font.SourceSans), 
            TextSize = v97.textSize(18), 
            Size = UDim2.new(0, 60, 0.8, 0), 
            Position = UDim2.new(1, 10, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 3, 
            Selectable = false, 
            Parent = l_NewPage_0.MouseAdvancedEntry.SliderFrame, 
            BorderSizePixel = 0
        });
        l_Create_0("UICorner")({
            CornerRadius = v97.DefaultCornerRadius, 
            Parent = l_l_NewPage_0_65
        });
        l_l_NewPage_0_66 = function(v698) --[[ Line: 2607 ]] --[[ Name: setMouseSensitivityText ]]
            -- upvalues: l_l_NewPage_0_65 (copy)
            v698 = math.floor(v698 * 1000 + 0.5) / 1000;
            l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", v698)))));
        end;
        l_l_NewPage_0_67 = math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000;
        l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", l_l_NewPage_0_67)))));
        l_l_NewPage_0_67 = l_NewPage_0.MouseAdvancedEntry;
        v697 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        local v699 = v697 <= 1 and math.floor((v697 - 0.2) / 0.16 + 0.5) or math.floor((v697 + 2) / 0.6 + 0.5);
        l_l_NewPage_0_67:SetValue(v697 <= 0.2 and 0 or v699);
        clampMouseSensitivity = function(v700) --[[ Line: 2622 ]] --[[ Name: clampMouseSensitivity ]]
            if v700 < 0 then
                v700 = -v700;
            end;
            if v700 > 100 then
                return 100;
            else
                if v700 < 0.001 then
                    v700 = 0.001;
                end;
                return v700;
            end;
        end;
        setMouseSensitivity = function(v701, v702) --[[ Line: 2640 ]] --[[ Name: setMouseSensitivity ]]
            -- upvalues: l_MouseSensitivity_0 (ref), v682 (ref), l_NewPage_0 (ref), l_l_NewPage_0_65 (copy)
            if not l_MouseSensitivity_0 then
                return;
            else
                v682(v701);
                l_MouseSensitivity_0 = false;
                if v702 ~= l_NewPage_0.MouseAdvancedEntry then
                    local l_MouseAdvancedEntry_0 = l_NewPage_0.MouseAdvancedEntry;
                    local v704 = v701 <= 1 and math.floor((v701 - 0.2) / 0.16 + 0.5) or math.floor((v701 + 2) / 0.6 + 0.5);
                    l_MouseAdvancedEntry_0:SetValue(v701 <= 0.2 and 0 or v704);
                end;
                local v705 = math.floor(v701 * 1000 + 0.5) / 1000;
                l_l_NewPage_0_65.Text = tostring((tonumber((string.format("%.3f", v705)))));
                l_MouseSensitivity_0 = true;
                return;
            end;
        end;
        l_l_NewPage_0_65.FocusLost:connect(function() --[[ Line: 2658 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_65 (copy), l_GameSettings_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v706 = tonumber((string.match(l_l_NewPage_0_65.Text, "([%d%.]+)")));
            if v706 then
                setMouseSensitivity(clampMouseSensitivity(v706), l_l_NewPage_0_65);
                return;
            else
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_65);
                return;
            end;
        end);
        l_l_NewPage_0_65.Focused:connect(function() --[[ Line: 2670 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v707) --[[ Line: 2674 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v708 = clampMouseSensitivity(v707);
            local v709 = v708 <= 5 and 0.16 * v708 + 0.2 or 0.6 * v708 - 2;
            v707 = v709 <= 0.2 and 0.2 or v709;
            setMouseSensitivity(v707, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v727() --[[ Line: 2681 ]] --[[ Name: createGamepadOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v682 (copy)
        local function __(v711) --[[ Line: 2686 ]] --[[ Name: translateEngineGamepadSensitivityToGui ]]
            local v712 = v711 <= 1 and math.floor((v711 - 0.2) / 0.16 + 0.5) or math.floor((v711 + 2) / 0.6 + 0.5);
            if v711 <= 0.2 then
                return 0;
            else
                return v712;
            end;
        end;
        local function __(v714) --[[ Line: 2693 ]] --[[ Name: translateGuiGamepadSensitivityToEngine ]]
            local v715 = v714 <= 5 and 0.16 * v714 + 0.2 or 0.6 * v714 - 2;
            if v715 <= 0.2 then
                return 0.2;
            else
                return v715;
            end;
        end;
        local l_GamepadCameraSensitivity_1 = l_GameSettings_0.GamepadCameraSensitivity;
        local v718 = l_GamepadCameraSensitivity_1 <= 1 and math.floor((l_GamepadCameraSensitivity_1 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_1 + 2) / 0.6 + 0.5);
        local v719 = l_GamepadCameraSensitivity_1 <= 0.2 and 0 or v718;
        l_GamepadCameraSensitivity_1 = l_NewPage_0;
        v718 = l_NewPage_0;
        local l_l_NewPage_0_68 = l_NewPage_0;
        local v721, v722, v723 = v93:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v719);
        l_GamepadCameraSensitivity_1.GamepadSensitivityFrame = v721;
        v718.GamepadSensitivityLabel = v722;
        l_l_NewPage_0_68.GamepadSensitivitySlider = v723;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v724) --[[ Line: 2708 ]]
            -- upvalues: v682 (ref)
            local l_v682_0 = v682;
            local v726 = v724 <= 5 and 0.16 * v724 + 0.2 or 0.6 * v724 - 2;
            l_v682_0(v726 <= 0.2 and 0.2 or v726);
        end);
    end;
    local function v739() --[[ Line: 2713 ]] --[[ Name: createOverscanOption ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref), v93 (ref), l_NewPage_0 (copy), v97 (ref), l_RunService_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local function v734() --[[ Line: 2714 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref)
            local v728 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v729 = nil;
            v729 = require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan);
            v729 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)(v729);
            local v730 = require(l_CorePackages_0.Packages.Roact);
            local v731 = nil;
            local v732 = {
                onUnmount = function() --[[ Line: 2725 ]]
                    -- upvalues: v731 (ref), v730 (copy), l_ContextActionService_0 (ref), v728 (copy)
                    if v731 then
                        v730.unmount(v731);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v728:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v728:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function() --[[ Line: 2741 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local v733 = nil;
            v733 = v730.createElement(v729, v732);
            v731 = v730.mount(v733, l_RobloxGui_0, (tostring(v729)));
        end;
        local v735, v736, v737 = v93:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v734, l_NewPage_0);
        v736.Font = v97.font(Enum.Font.SourceSans);
        v735.Position = UDim2.new(1, -400, 0, 12);
        v735.Size = UDim2.new(0, 300, 0, 40);
        v735.Position = UDim2.new(1, -400, 0.5, 0);
        v735.AnchorPoint = Vector2.new(0, 0.5);
        if l_RunService_0:IsStudio() then
            v735.Selectable = false;
            v735.Active = false;
            v735.Enabled.Value = false;
            v736.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v738 = v93:AddNewRowObject(l_NewPage_0, "Safe Zone", v735);
        v738.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.OverscanAdjustButton;
        v737(v738);
    end;
    local function v752() --[[ Line: 2780 ]] --[[ Name: createDeveloperConsoleOption ]]
        -- upvalues: v142 (ref), v129 (ref), v93 (ref), l_NewPage_0 (copy), v97 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_RunService_0 (ref), v95 (ref), l_Players_0 (ref)
        local function v751() --[[ Line: 2782 ]] --[[ Name: makeDevConsoleOption ]]
            -- upvalues: v142 (ref), v129 (ref), v93 (ref), l_NewPage_0 (ref), v97 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local function v742() --[[ Line: 2783 ]] --[[ Name: onOpenDevConsole ]]
                -- upvalues: v142 (ref)
                local v740 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v740 then
                    v740:SetVisibility(true);
                    local v741 = require(script.Parent.Parent.SettingsHub);
                    if v741 then
                        v741:SetVisibility(false);
                    end;
                    v142("dev_console", "", "pressed");
                end;
            end;
            if v129 then
                local v743, v744, v745 = v93:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v742, l_NewPage_0);
                v744.Font = v97.font(Enum.Font.SourceSans);
                v743.Size = UDim2.new(0.6, -10, 0, 35);
                v743.Position = UDim2.new(0.4, 10, 0.5, 0);
                v743.AnchorPoint = Vector2.new(0, 0.5);
                local v746 = v93:AddNewRowObject(l_NewPage_0, "Developer Console", v743, nil, true);
                v746.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v745(v746);
                return;
            else
                local v747, v748, v749 = v93:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v742, l_NewPage_0);
                v748.Font = v97.font(Enum.Font.SourceSans);
                v747.Size = UDim2.new(0.6, -10, 0, 35);
                v747.Position = UDim2.new(1, -400, 0.5, 0);
                v747.AnchorPoint = Vector2.new(0, 0.5);
                local v750 = v93:AddNewRowObject(l_NewPage_0, "Developer Console", v747);
                v750.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v749(v750);
                return;
            end;
        end;
        if l_RunService_0:IsStudio() then
            v751();
            return;
        else
            spawn(function() --[[ Line: 2835 ]]
                -- upvalues: v95 (ref), l_Players_0 (ref), v751 (copy)
                if v95.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v751();
                end;
            end);
            return;
        end;
    end;
    local function v781() --[[ Line: 2844 ]] --[[ Name: createUiToggleOptions ]]
        -- upvalues: v128 (ref), v127 (ref), v63 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v128 or v127 then
            local v753 = {
                {
                    label = "Custom", 
                    type = Enum.GuiType.Custom, 
                    layoutOrderKey = "UiToggleRowCustom"
                }, 
                {
                    label = "CustomBillboards", 
                    type = Enum.GuiType.CustomBillboards, 
                    layoutOrderKey = "UiToggleRowBillboards"
                }, 
                {
                    label = "PlayerNameplates", 
                    type = Enum.GuiType.PlayerNameplates, 
                    layoutOrderKey = "UiToggleRowNameplates"
                }
            };
            local v754 = v63:FormatByKey("InGame.CommonUI.Label.On");
            local v755 = v63:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v757 in v753 do
                local v758 = v63:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v757.label
                });
                local v759, v760, v761 = v93:AddNewRow(l_NewPage_0, v758, "Selector", {
                    v754, 
                    v755
                }, 1);
                v759.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0[v757.layoutOrderKey];
                v761.IndexChanged:Connect(function(v762) --[[ Line: 2872 ]]
                    -- upvalues: l_GuiService_0 (ref), v757 (copy)
                    if (l_GuiService_0:GetGuiIsVisible(v757.type) and 1 or 2) ~= v762 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v757.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v757.label] = {
                    label = v758, 
                    type = v757.type, 
                    row = v759, 
                    frame = v760, 
                    selector = v761
                };
            end;
            local v763 = v63:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_69 = l_NewPage_0;
            local l_l_NewPage_0_70 = l_NewPage_0;
            local l_l_NewPage_0_71 = l_NewPage_0;
            local v767, v768, v769 = v93:AddNewRow(l_NewPage_0, v763, "Selector", {
                v755, 
                v754
            }, 1);
            l_l_NewPage_0_69.freecamRow = v767;
            l_l_NewPage_0_70.freecamFrame = v768;
            l_l_NewPage_0_71.freecamSelector = v769;
            l_NewPage_0.freecamRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v770) --[[ Line: 2894 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v771 = v770 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if not l_l_LocalPlayer_0_FirstChild_0 then
                    warn("Freecam not present");
                    return;
                else
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v771);
                    return;
                end;
            end);
            return;
        else
            local v773 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_72 = l_NewPage_0;
            local l_l_NewPage_0_73 = l_NewPage_0;
            local l_l_NewPage_0_74 = l_NewPage_0;
            local v777, v778, v779 = v93:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v773, 1);
            l_l_NewPage_0_72.uiToggleRow = v777;
            l_l_NewPage_0_73.uiToggleFrame = v778;
            l_l_NewPage_0_74.uiToggleSelector = v779;
            l_NewPage_0.uiToggleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__) --[[ Line: 2913 ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return;
        end;
    end;
    local function v788() --[[ Line: 2919 ]] --[[ Name: updateUiToggleSelection ]]
        -- upvalues: v128 (ref), v127 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v128 or v127 then
            if not l_NewPage_0.uiToggleSelectors then
                return;
            else
                for __, v783 in l_NewPage_0.uiToggleSelectors do
                    local v784 = l_GuiService_0:GetGuiIsVisible(v783.type) and 1 or 2;
                    if v784 ~= v783.selector:GetSelectedIndex() then
                        v783.selector:SetSelectionIndex(v784);
                    end;
                end;
                local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_1 then
                    local v786 = l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 2 or 1;
                    l_NewPage_0.freecamSelector:SetSelectionIndex(v786);
                    return;
                end;
            end;
        elseif not l_NewPage_0.uiToggleSelector then
            return;
        else
            local v787 = nil;
            v787 = l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2;
            if v787 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                return;
            else
                l_NewPage_0.uiToggleSelector:SetSelectionIndex(v787);
            end;
        end;
    end;
    local function __(v789, v790, v791) --[[ Line: 2961 ]] --[[ Name: isValidDeviceList ]]
        return v789 and v790 and v791 and #v789 > 0 and v791 > 0 and v791 <= #v789 and #v789 == #v790;
    end;
    local function v801(v793) --[[ Line: 2971 ]] --[[ Name: setVCSOutput ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v115 (ref), v17 (ref), v122 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v115:error("setVCSOutput is deprecated");
            return;
        else
            local v794, v795, v796, v797 = pcall(function() --[[ Line: 2977 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v794 and v795 and v796 and v797 and #v795 > 0 and v797 > 0 and v797 <= #v795 and #v795 == #v796 then
                local v798 = 0;
                for v799, v800 in ipairs(v795) do
                    if v800 == v793 then
                        v798 = v799;
                    end;
                end;
                if v798 > 0 then
                    if v122() then
                        v115:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v795[v798], v796[v798]);
                    end;
                    v17:SetSpeakerDevice(v795[v798], v796[v798]);
                    return;
                elseif v122() then
                    v115:warning("Could not find equivalent VoiceChatService Device");
                    return;
                end;
            elseif v122() then
                v115:warning("Could not connect to Voice Chat Service to change Output Device");
            end;
            return;
        end;
    end;
    local function v806() --[[ Line: 3012 ]] --[[ Name: syncSoundOutputs ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v115 (ref), l_SoundService_0 (ref), v801 (copy), v122 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v115:error("syncSoundOutputs is deprecated");
            return;
        else
            local v802, v803, v804, v805 = pcall(function() --[[ Line: 3018 ]]
                -- upvalues: l_SoundService_0 (ref)
                return l_SoundService_0:GetOutputDevices();
            end);
            if v802 and v803 and v804 and v805 and #v803 > 0 and v805 > 0 and v805 <= #v803 and #v803 == #v804 then
                v801(v803[v805]);
                return;
            else
                if v122() then
                    v115:warning("Could not connect to Voice Chat Service to change Output Device");
                end;
                return;
            end;
        end;
    end;
    local function __(v807, v808) --[[ Line: 3033 ]] --[[ Name: SwitchOutputDevice ]]
        -- upvalues: l_SoundService_0 (ref), v115 (ref)
        l_SoundService_0:SetOutputDevice(v807, v808);
        v115:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v807, v808);
    end;
    local function v826(v810) --[[ Line: 3038 ]] --[[ Name: createDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v73 (ref), v63 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v121 (ref), l_default_2 (ref), l_SoundService_0 (ref), v115 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v142 (ref)
        local v811 = l_NewPage_0[v810 .. "DeviceIndex"] or 0;
        local v812 = l_NewPage_0[v810 .. "DeviceNames"] or {};
        local v813 = l_NewPage_0[v810 .. "DeviceGuids"] or {};
        local v814 = v810 == v73.Input and v63:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or v63:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_75 = l_NewPage_0;
        local v816 = v810 .. "DeviceFrame";
        local l_l_NewPage_0_76 = l_NewPage_0;
        local v818 = v810 .. "DeviceSelector";
        local v819, v820, v821 = v93:AddNewRow(l_NewPage_0, v814, "Selector", v812, v811);
        l_l_NewPage_0_75[v816] = v819;
        _ = v820;
        l_l_NewPage_0_76[v818] = v821;
        l_NewPage_0[v810 .. "DeviceFrame"].LayoutOrder = v810 == v73.Input and l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameInput or l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameOutput;
        l_NewPage_0[v810 .. "DeviceInfo"] = {
            Name = v811 > 0 and v812[v811] or nil, 
            Guid = v811 > 0 and v813[v811] or nil
        };
        l_NewPage_0[v810 .. "PrevDeviceName"] = l_NewPage_0[v810 .. "DeviceInfo"].Name;
        l_l_NewPage_0_75 = 0;
        v816 = v121();
        l_NewPage_0[v810 .. "DeviceSelector"].IndexChanged:connect(function(v822) --[[ Line: 3061 ]]
            -- upvalues: l_NewPage_0 (ref), v810 (copy), l_l_NewPage_0_75 (ref), v816 (copy), l_default_2 (ref), l_SoundService_0 (ref), v115 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v73 (ref), l_default_3 (ref), v142 (ref)
            if l_NewPage_0[v810 .. "DeviceInfo"].Name == l_NewPage_0[v810 .. "DeviceNames"][v822] and l_NewPage_0[v810 .. "DeviceInfo"].Guid == l_NewPage_0[v810 .. "DeviceGuids"][v822] then
                return;
            else
                local v823 = l_l_NewPage_0_75 + 1;
                l_l_NewPage_0_75 = v823;
                wait(v816);
                if v823 == l_l_NewPage_0_75 then
                    l_l_NewPage_0_75 = 0;
                    l_NewPage_0[v810 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v810 .. "DeviceNames"][v822], 
                        Guid = l_NewPage_0[v810 .. "DeviceGuids"][v822]
                    };
                    local l_Name_4 = l_NewPage_0[v810 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v810 .. "DeviceInfo"].Guid;
                    if l_NewPage_0.VoiceChatOptionsEnabled then
                        l_default_2:SwitchDevice(v810, l_Name_4, l_Guid_0);
                    else
                        l_SoundService_0:SetOutputDevice(l_Name_4, l_Guid_0);
                        v115:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_4, l_Guid_0);
                    end;
                    if l_GetFFlagEnableCrossExpVoice_0() then
                        v115:debug("[GameSettings] Changing {} device to {} {} ", v810, l_Name_4, l_Guid_0);
                        if v810 == v73.Input then
                            l_default_3:changeInputDevice(l_Name_4, l_Guid_0);
                        else
                            l_default_3:changeOutputDevice(l_Name_4, l_Guid_0);
                        end;
                    end;
                    v142(v810, l_NewPage_0[v810 .. "PrevDeviceName"], l_Name_4);
                    l_NewPage_0[v810 .. "PrevDeviceName"] = l_Name_4;
                end;
                return;
            end;
        end);
    end;
    local function __() --[[ Line: 3103 ]] --[[ Name: createBadgeVisibilityOptions ]]
        -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
        spawn(function() --[[ Line: 3104 ]]
            -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v827 = 2;
            if v95.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v827 = 1;
            end;
            local v828 = v63:FormatByKey("Feature.SettingsHub.Label.Show");
            local v829 = v63:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v830 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v63:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v831 = v63:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_77 = l_NewPage_0;
            local l_l_NewPage_0_78 = l_NewPage_0;
            local l_l_NewPage_0_79 = l_NewPage_0;
            local v835, v836, v837 = v93:AddNewRow(l_NewPage_0, v830, "Selector", {
                v829, 
                v828
            }, v827, nil, v831);
            l_l_NewPage_0_77.badgeVisibleRow = v835;
            l_l_NewPage_0_78.badgeVisibleFrame = v836;
            l_l_NewPage_0_79.badgeVisibleSelector = v837;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v838) --[[ Line: 3118 ]]
                -- upvalues: l_GameSettings_0 (ref), v95 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v838 == 2;
                v95.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v838 == 1);
            end);
        end);
    end;
    local function v850() --[[ Line: 3125 ]] --[[ Name: createChatModerationOptions ]]
        -- upvalues: l_NewPage_0 (copy), v93 (ref), v24 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_CorePackages_0 (ref), v103 (ref), v61 (ref), v142 (ref)
        local v840 = {
            title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView", 
            description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription", 
            on = "InGame.CommonUI.Label.On", 
            off = "InGame.CommonUI.Label.Off"
        };
        local l_l_NewPage_0_80 = l_NewPage_0;
        local l_l_NewPage_0_81 = l_NewPage_0;
        local v843, v844, v845 = v93:AddNewRow(l_NewPage_0, v24:Format(v840.title), "Selector", {
            v24:Format(v840.off), 
            v24:Format(v840.on)
        }, 1, nil, v24:Format(v840.description));
        l_l_NewPage_0_80.ChatModerationFrame = v843;
        _ = v844;
        l_l_NewPage_0_81.ChatModerationSelector = v845;
        l_NewPage_0.ChatModerationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ChatModerationFrame;
        l_NewPage_0.ChatModerationFrame.Visible = false;
        l_l_NewPage_0_81 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false);
        l_NewPage_0.ChatModerationDisposeEffect = v103.createEffect(function(v846) --[[ Line: 3149 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_81 (copy)
            l_NewPage_0.ChatModerationFrame.Visible = l_l_NewPage_0_81.getIsSettingVisible(v846);
            local v847 = l_l_NewPage_0_81.getIsSettingEnabled(v846) and 2 or 1;
            if l_NewPage_0.ChatModerationSelector:GetSelectedIndex() ~= v847 then
                l_NewPage_0.ChatModerationSelector:SetSelectionIndex(v847);
            end;
        end);
        l_NewPage_0.ChatModerationSelector.IndexChanged:connect(function(v848) --[[ Line: 3158 ]]
            -- upvalues: l_l_NewPage_0_81 (copy), v61 (ref), v142 (ref)
            local v849 = v848 == 2;
            l_l_NewPage_0_81.setIsSettingEnabled(v849);
            if v61 then
                v142("moderate_chat", not v849, v849);
            end;
        end);
        l_l_NewPage_0_81.initialize();
    end;
    local function v862() --[[ Line: 3172 ]] --[[ Name: createCameraDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v114 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v115 (ref), l_UserGameSettings_0 (ref), v142 (ref)
        local v851 = l_NewPage_0.CameraDeviceIndex or 1;
        local v852 = l_NewPage_0.CameraDeviceNames or {};
        local v853 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v114_0 = v114;
        local l_l_NewPage_0_82 = l_NewPage_0;
        local l_l_NewPage_0_83 = l_NewPage_0;
        local v857, v858, v859 = v93:AddNewRow(l_NewPage_0, l_v114_0, "Selector", v852, v851);
        l_l_NewPage_0_82.CameraDeviceFrame = v857;
        _ = v858;
        l_l_NewPage_0_83.CameraDeviceSelector = v859;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v851 > 0 and v852[v851] or nil, 
            Guid = v851 > 0 and v853[v851] or nil
        };
        l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v860) --[[ Line: 3189 ]]
            -- upvalues: l_NewPage_0 (ref), v115 (ref), l_UserGameSettings_0 (ref), v142 (ref)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v860] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v860] then
                return;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v860], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v860]
                };
                local l_Guid_1 = l_NewPage_0.CameraDeviceInfo.Guid;
                v115:info("Changed webcam to: {}", l_Guid_1);
                l_UserGameSettings_0.DefaultCameraID = l_Guid_1;
                v142("video_camera", l_NewPage_0.prevCameraDeviceName or "None", l_NewPage_0.CameraDeviceInfo.Name);
                l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
                return;
            end;
        end);
    end;
    local function v868(v863) --[[ Line: 3214 ]] --[[ Name: updateAudioDevices ]]
        -- upvalues: v73 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v122 (ref), v115 (ref), v826 (copy)
        local v864, v865, v866, v867 = pcall(function() --[[ Line: 3215 ]]
            -- upvalues: v863 (copy), v73 (ref), l_SoundService_0 (ref)
            if v863 == v73.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v864 and v865 and v866 and v867 and #v865 > 0 and v867 > 0 and v867 <= #v865 and #v865 == #v866 then
                if v866[1] == "" then
                    v865[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v865[1] .. ")";
                end;
                l_NewPage_0[v863 .. "DeviceNames"] = v865;
                l_NewPage_0[v863 .. "DeviceGuids"] = v866;
                l_NewPage_0[v863 .. "DeviceIndex"] = v867;
            else
                if v122() then
                    v115:warning("Errors in get {} device info", v863);
                end;
                l_NewPage_0[v863 .. "DeviceNames"] = {};
                l_NewPage_0[v863 .. "DeviceGuids"] = {};
                l_NewPage_0[v863 .. "DeviceIndex"] = 0;
            end;
        elseif v864 and v865 and v866 and v867 and #v865 > 0 and v867 > 0 and v867 <= #v865 and #v865 == #v866 then
            if v866[1] == "" then
                v865[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v865[1] .. ")";
            end;
            l_NewPage_0[v863 .. "DeviceNames"] = v865;
            l_NewPage_0[v863 .. "VCSDeviceNames"] = v865;
            l_NewPage_0[v863 .. "VCSDeviceGuids"] = v866;
            l_NewPage_0[v863 .. "DeviceGuids"] = v866;
            l_NewPage_0[v863 .. "DeviceIndex"] = v867;
        else
            if v122() then
                v115:warning("Errors in get {} device info", v863);
            end;
            l_NewPage_0[v863 .. "DeviceNames"] = {};
            l_NewPage_0[v863 .. "DeviceGuids"] = {};
            l_NewPage_0[v863 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v863 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v863 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v863 .. "DeviceSelector"] then
            v826(v863);
            return;
        else
            l_NewPage_0[v863 .. "DeviceSelector"]:UpdateOptions(v865);
            l_NewPage_0[v863 .. "DeviceSelector"]:SetSelectionIndex(v867);
            return;
        end;
    end;
    local function v878(v869) --[[ Line: 3270 ]] --[[ Name: updateVoiceChatDevices ]]
        -- upvalues: v73 (ref), v122 (ref), v115 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v17 (ref), v826 (copy)
        if v869 ~= v73.Input and v869 ~= v73.Output and v122() then
            v115:warning("{} is not supported in VoiceChat devices", v869);
        end;
        local v870, v871, v872, v873 = pcall(function() --[[ Line: 3277 ]]
            -- upvalues: v869 (copy), v73 (ref), l_SoundService_0 (ref)
            if v869 == v73.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v870 and v871 and v872 and v873 and #v871 > 0 and v873 > 0 and v873 <= #v871 and #v871 == #v872 then
                if v872[1] == "" then
                    v871[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v871[1] .. ")";
                end;
                l_NewPage_0[v869 .. "DeviceNames"] = v871;
                l_NewPage_0[v869 .. "DeviceGuids"] = v872;
                l_NewPage_0[v869 .. "DeviceIndex"] = v873;
            else
                if v122() then
                    if #v871 > 0 then
                        v115:warning("Errors in get {} device info success: {}", v869, v870);
                    else
                        v115:warning("Empty deviceNames list for {}", v869);
                    end;
                end;
                l_NewPage_0[v869 .. "DeviceNames"] = {};
                l_NewPage_0[v869 .. "DeviceGuids"] = {};
                l_NewPage_0[v869 .. "DeviceIndex"] = 0;
            end;
        else
            local v874, v875, v876, v877 = pcall(function() --[[ Line: 3314 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v870 and v874 and v871 and v872 and v873 and #v871 > 0 and v873 > 0 and v873 <= #v871 and #v871 == #v872 and v875 and v876 and v877 and #v875 > 0 and v877 > 0 and v877 <= #v875 and #v875 == #v876 then
                if v872[1] == "" then
                    v871[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v871[1] .. ")";
                end;
                l_NewPage_0[v869 .. "DeviceNames"] = v871;
                l_NewPage_0[v869 .. "VCSDeviceNames"] = v875;
                l_NewPage_0[v869 .. "VCSDeviceGuids"] = v876;
                l_NewPage_0[v869 .. "DeviceGuids"] = v872;
                l_NewPage_0[v869 .. "DeviceIndex"] = v873;
            else
                if v122() then
                    if #v871 > 0 then
                        v115:warning("Errors in get {} device info success: {} VCSSuccess: {}", v869, v870, v874);
                    else
                        v115:warning("Empty deviceNames list for {}", v869);
                    end;
                end;
                l_NewPage_0[v869 .. "DeviceNames"] = {};
                l_NewPage_0[v869 .. "DeviceGuids"] = {};
                l_NewPage_0[v869 .. "VCSDeviceNames"] = {};
                l_NewPage_0[v869 .. "VCSDeviceGuids"] = {};
                l_NewPage_0[v869 .. "DeviceIndex"] = 0;
            end;
        end;
        if not l_NewPage_0[v869 .. "DeviceSelector"] then
            v826(v869);
        else
            l_NewPage_0[v869 .. "DeviceSelector"]:UpdateOptions(v871);
            l_NewPage_0[v869 .. "DeviceSelector"]:SetSelectionIndex(v873);
        end;
        if l_NewPage_0[v869 .. "DeviceFrame"] then
            if #v871 > 0 then
                l_NewPage_0[v869 .. "DeviceFrame"].Visible = true;
                return;
            else
                l_NewPage_0[v869 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v885() --[[ Line: 3370 ]] --[[ Name: updateCameraDevices ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v113 (ref), l_UserGameSettings_0 (ref), l_NewPage_0 (copy), v862 (copy)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v880 = {};
        local v881 = {};
        local v882 = 1;
        table.insert(v880, v113);
        table.insert(v881, "{DefaultDeviceGuid}");
        for v883, v884 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v883 == l_UserGameSettings_0.DefaultCameraID then
                v882 = #v880 + 1;
            end;
            table.insert(v880, v884);
            table.insert(v881, v883);
        end;
        l_NewPage_0.CameraDeviceNames = v880;
        l_NewPage_0.CameraDeviceGuids = v881;
        l_NewPage_0.CameraDeviceIndex = 0;
        if not l_NewPage_0.CameraDeviceSelector then
            v862();
        else
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v880);
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v882);
    end;
    local v886 = nil;
    local v887 = nil;
    local function v888() --[[ Line: 3400 ]] --[[ Name: updateAudioOptions ]]
        -- upvalues: l_NewPage_0 (copy), v878 (copy), v73 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v868 (copy)
        if l_NewPage_0.VoiceChatOptionsEnabled then
            v878(v73.Input);
            v878(v73.Output);
            return;
        else
            if l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected() then
                v868(v73.Input);
            end;
            v868(v73.Output);
            return;
        end;
    end;
    local function __() --[[ Line: 3412 ]] --[[ Name: setupDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v886 (ref), l_NewPage_0 (copy), v888 (copy)
        if l_SoundService_0.DeviceListChanged then
            v886 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3414 ]]
                -- upvalues: l_NewPage_0 (ref), v888 (ref)
                if l_NewPage_0.PageOpen then
                    v888();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3422 ]] --[[ Name: setupVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v887 (ref), l_NewPage_0 (copy), v885 (copy)
        if l_VideoCaptureService_0.DevicesChanged then
            v887 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3424 ]]
                -- upvalues: l_NewPage_0 (ref), v885 (ref)
                if l_NewPage_0.PageOpen then
                    v885();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3432 ]] --[[ Name: teardownDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v886 (ref)
        if l_SoundService_0.DeviceListChanged and v886 then
            v886:Disconnect();
        end;
    end;
    local function __() --[[ Line: 3438 ]] --[[ Name: teardownVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v887 (ref)
        if l_VideoCaptureService_0.DevicesChanged and v887 then
            v887:Disconnect();
            v887 = nil;
        end;
    end;
    local function __() --[[ Line: 3446 ]] --[[ Name: checkVoiceChatOptions ]]
        -- upvalues: l_default_2 (ref), l_NewPage_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v806 (copy)
        if l_default_2:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                v806();
            end;
        end;
    end;
    local function __() --[[ Line: 3455 ]] --[[ Name: updateInputDeviceVisibility ]]
        -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
        local v894 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
        if l_NewPage_0[v73.Input .. "DeviceFrame"] then
            l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v894;
        end;
    end;
    local v896 = false;
    local function v914() --[[ Line: 3464 ]] --[[ Name: createVoiceChatSelector ]]
        -- upvalues: v55 (ref), v24 (ref), l_default_2 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v43 (ref), v42 (ref), v896 (ref), v101 (ref), v58 (ref), l_GuiService_0 (ref)
        local v897 = "Voice Chat";
        local v898 = "Disconnected";
        local v899 = "Connected";
        if v55 then
            v897 = v24:Format("Feature.GameDetails.Label.VoiceChat");
            v898 = v24:Format("Feature.SettingsHub.Label.Disconnected");
            v899 = v24:Format("Feature.SettingsHub.Label.Connected");
        end;
        local v900 = l_default_2:VoiceChatEnded() and 1 or 2;
        local l_l_NewPage_0_84 = l_NewPage_0;
        local l_l_NewPage_0_85 = l_NewPage_0;
        local v903, v904, v905 = v93:AddNewRow(l_NewPage_0, v897, "Selector", {
            v898, 
            v899
        }, v900);
        l_l_NewPage_0_84.VoiceConnectDisconnectFrame = v903;
        _ = v904;
        l_l_NewPage_0_85.VoiceConnectDisconnectSelector = v905;
        l_NewPage_0.VoiceConnectDisconnectFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectDisconnectSelector;
        l_l_NewPage_0_84 = l_default_2:getService();
        if l_l_NewPage_0_84 then
            l_l_NewPage_0_84.StateChanged:Connect(function(v906, v907) --[[ Line: 3483 ]]
                -- upvalues: l_NewPage_0 (ref), l_default_2 (ref)
                if v906 == v907 then
                    return;
                elseif v907 == Enum.VoiceChatState.Joined then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    return;
                else
                    if l_default_2:VoiceChatEnded() then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    end;
                    return;
                end;
            end);
        end;
        l_l_NewPage_0_85 = v900;
        v903 = v43();
        v904 = v42() and v903 > 0;
        v905 = function(v908) --[[ Line: 3501 ]]
            -- upvalues: l_l_NewPage_0_85 (ref), l_default_2 (ref), v896 (ref), l_NewPage_0 (ref)
            if v908 == l_l_NewPage_0_85 then
                return;
            else
                l_l_NewPage_0_85 = v908;
                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(v908 == 2));
                if v908 == 2 then
                    l_default_2:JoinVoice();
                elseif not l_default_2:VoiceChatEnded() then
                    l_default_2:Leave();
                end;
                if v896 then
                    task.spawn(function() --[[ Line: 3522 ]]
                        -- upvalues: v908 (copy), l_NewPage_0 (ref)
                        task.wait(0.5);
                        if v908 ~= 1 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                        end;
                    end);
                end;
                return;
            end;
        end;
        l_NewPage_0.VoiceConnectDisconnectSelector.IndexChanged:connect(if v904 then v101(v903, v905) else v905);
        if v58 then
            l_NewPage_0.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(__, v910, v911) --[[ Line: 3536 ]]
                -- upvalues: v897 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref)
                if v911 and v910 and v910.Parent and v910.Parent.Name == v897 .. "Frame" and v911.Name == "ImageButton" and l_NewPage_0.Active then
                    l_GuiService_0.SelectedCoreObject = v910;
                end;
            end);
        end;
        l_default_2:subscribe("OnStateChanged", function(__, v913) --[[ Line: 3543 ]]
            -- upvalues: l_NewPage_0 (ref)
            if v913 == Enum.VoiceChatState.Failed then
                l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
            end;
        end);
        l_default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 3549 ]]
            -- upvalues: v896 (ref), l_NewPage_0 (ref)
            task.spawn(function() --[[ Line: 3550 ]]
                -- upvalues: v896 (ref), l_NewPage_0 (ref)
                task.wait(0.5);
                v896 = true;
                l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
            end);
        end);
    end;
    local function v933() --[[ Line: 3558 ]] --[[ Name: createVoiceConnectDisconnect ]]
        -- upvalues: l_default_2 (ref), v24 (ref), v43 (ref), v93 (ref), v101 (ref), l_NewPage_0 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref)
        if l_default_2:IsSeamlessVoice() and not l_default_2.isShowingFTUX then
            local v915 = nil;
            local v916 = nil;
            local v917 = nil;
            local v918 = nil;
            local v919 = v24:Format("Feature.GameDetails.Label.VoiceChat");
            local v920 = v24:Format("Feature.SettingsHub.Label.Connect");
            local v921 = v24:Format("Feature.SettingsHub.Label.Disconnect");
            local v922 = v43();
            local v923 = v922 > 0;
            local function v928() --[[ Line: 3568 ]]
                -- upvalues: l_default_2 (ref)
                if l_default_2:getService() then
                    local v924 = nil;
                    do
                        local l_v924_0 = v924;
                        l_v924_0 = l_default_2:getService().StateChanged:Connect(function(__, v927) --[[ Line: 3572 ]]
                            -- upvalues: l_default_2 (ref), l_v924_0 (ref)
                            if v927 == Enum.VoiceChatState.Joined then
                                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                                l_v924_0:Disconnect();
                            end;
                        end);
                    end;
                else
                    l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(false));
                end;
                l_default_2:JoinVoice();
            end;
            local function v929() --[[ Line: 3590 ]]
                -- upvalues: l_default_2 (ref)
                l_default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                l_default_2:Leave();
            end;
            local v930, v931, v932 = v93:MakeStyledButton("VoiceConnectButton", v920, UDim2.new(1, 0, 1, -20), if v923 then v101(v922, v928) else v928, l_NewPage_0);
            voiceConnectSetRowRef = v932;
            v915 = v930;
            v916 = v931;
            v930, v931, v932 = v93:MakeStyledButton("VoiceDisconnectButton", v921, UDim2.new(1, 0, 1, -20), if v923 then v101(v922, v929) else v929, l_NewPage_0);
            voiceDisconnectSetRowRef = v932;
            v917 = v930;
            v918 = v931;
            v915.Size = UDim2.new(0.6, 0, 0, 40);
            v915.Position = UDim2.new(0.4, 0, 0.5, 0);
            v915.AnchorPoint = Vector2.new(0, 0.5);
            v915.ZIndex = 2;
            v915.Selectable = true;
            v916.ZIndex = 2;
            v917.Size = UDim2.new(0.6, 0, 0, 40);
            v917.Position = UDim2.new(0.4, 0, 0.5, 0);
            v917.AnchorPoint = Vector2.new(0, 0.5);
            v917.ZIndex = 2;
            v917.Selectable = true;
            v918.ZIndex = 2;
            v930 = v93:AddNewRowObject(l_NewPage_0, v919, v915, nil, true);
            v931 = v93:AddNewRowObject(l_NewPage_0, v919, v917, nil, true);
            l_NewPage_0.VoiceConnectFrame = v930;
            l_NewPage_0.VoiceDisconnectFrame = v931;
            v930.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectFrame;
            v931.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceDisconnectFrame;
            voiceConnectSetRowRef(v930);
            voiceDisconnectSetRowRef(v931);
            if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_isVoiceFocused_0() then
                v930.Visible = false;
                v931.Visible = false;
                return;
            elseif l_default_2:ShouldShowJoinVoice() then
                v930.Visible = true;
                v931.Visible = false;
                return;
            else
                v930.Visible = false;
                v931.Visible = true;
            end;
        end;
    end;
    local function v959() --[[ Line: 3652 ]] --[[ Name: createVRComfortSettingOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_1 = Enum.VRComfortSetting:GetEnumItems();
        local v935 = {
            title = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings", 
            description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription", 
            ["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort", 
            ["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal", 
            ["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert", 
            ["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom", 
            vignetteEnabled = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
            steppedRotationEnabled = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled", 
            thirdPersonFixedCamEnabled = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled", 
            on = "InGame.CommonUI.Label.On", 
            off = "InGame.CommonUI.Label.Off"
        };
        local v936 = {};
        for v937, v938 in ipairs(l_EnumItems_1) do
            v936[v937] = v24:Format(v935[tostring(v938)]);
        end;
        local v939 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
        local l_l_NewPage_0_86 = l_NewPage_0;
        local l_l_NewPage_0_87 = l_NewPage_0;
        local l_l_NewPage_0_88 = l_NewPage_0;
        local v943, v944, v945 = v93:AddNewRow(l_NewPage_0, v24:Format(v935.title), "Selector", v936, v939, nil, v24:Format(v935.description));
        l_l_NewPage_0_86.VRComfortSettingFrame = v943;
        l_l_NewPage_0_87.VRComfortSettingLabel = v944;
        l_l_NewPage_0_88.VRComfortSettingSelector = v945;
        l_NewPage_0.VRComfortSettingFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRComfortSettingFrame;
        l_l_NewPage_0_86 = l_GameSettings_0.VignetteEnabled and 1 or 2;
        l_l_NewPage_0_87 = l_NewPage_0;
        l_l_NewPage_0_88 = l_NewPage_0;
        v943 = l_NewPage_0;
        local v946;
        v944, v945, v946 = v93:AddNewRow(l_NewPage_0, v24:Format(v935.vignetteEnabled), "Selector", {
            v24:Format(v935.on), 
            v24:Format(v935.off)
        }, l_l_NewPage_0_86);
        l_l_NewPage_0_87.VRVignetteEnabledFrame = v944;
        l_l_NewPage_0_88.VRVignetteEnabledLabel = v945;
        v943.VRVignetteEnabledSelector = v946;
        l_NewPage_0.VRVignetteEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRVignetteEnabledFrame;
        l_l_NewPage_0_87 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
        l_l_NewPage_0_88 = l_NewPage_0;
        v943 = l_NewPage_0;
        v944 = l_NewPage_0;
        local v947;
        v945, v946, v947 = v93:AddNewRow(l_NewPage_0, v24:Format(v935.steppedRotationEnabled), "Selector", {
            v24:Format(v935.on), 
            v24:Format(v935.off)
        }, l_l_NewPage_0_87);
        l_l_NewPage_0_88.VRSteppedRotationEnabledFrame = v945;
        v943.VRSteppedRotationEnabledLabel = v946;
        v944.VRSteppedRotationEnabledSelector = v947;
        l_NewPage_0.VRSteppedRotationEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSteppedRotationEnabledFrame;
        l_l_NewPage_0_88 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
        v943 = l_NewPage_0;
        v944 = l_NewPage_0;
        v945 = l_NewPage_0;
        local v948;
        v946, v947, v948 = v93:AddNewRow(l_NewPage_0, v24:Format(v935.thirdPersonFixedCamEnabled), "Selector", {
            v24:Format(v935.on), 
            v24:Format(v935.off)
        }, l_l_NewPage_0_88);
        v943.VRThirdPersonFixedCamEnabledFrame = v946;
        v944.VRThirdPersonFixedCamEnabledLabel = v947;
        v945.VRThirdPersonFixedCamEnabledSelector = v948;
        l_NewPage_0.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRThirdPersonFixedCamEnabledFrame;
        v943 = function(v949) --[[ Line: 3718 ]]
            -- upvalues: l_NewPage_0 (ref)
            if v949 == Enum.VRComfortSetting.Custom then
                l_NewPage_0.VRVignetteEnabledSelector:SetZIndex(2);
                l_NewPage_0.VRVignetteEnabledLabel.ZIndex = 2;
                l_NewPage_0.VRVignetteEnabledSelector:SetInteractable(true);
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetZIndex(2);
                l_NewPage_0.VRSteppedRotationEnabledLabel.ZIndex = 2;
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetInteractable(true);
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetZIndex(2);
                l_NewPage_0.VRThirdPersonFixedCamEnabledLabel.ZIndex = 2;
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetInteractable(true);
                return;
            else
                l_NewPage_0.VRVignetteEnabledSelector:SetZIndex(1);
                l_NewPage_0.VRVignetteEnabledLabel.ZIndex = 1;
                l_NewPage_0.VRVignetteEnabledSelector:SetInteractable(false);
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetZIndex(1);
                l_NewPage_0.VRSteppedRotationEnabledLabel.ZIndex = 1;
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetInteractable(false);
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetZIndex(1);
                l_NewPage_0.VRThirdPersonFixedCamEnabledLabel.ZIndex = 1;
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetInteractable(false);
                return;
            end;
        end;
        l_NewPage_0.VRComfortSettingSelector.IndexChanged:connect(function(v950) --[[ Line: 3742 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), v943 (copy)
            local v951 = l_EnumItems_1[v950];
            l_GameSettings_0.VRComfortSetting = v951;
            v943(v951);
        end);
        v943(l_GameSettings_0.VRComfortSetting);
        l_NewPage_0.VRVignetteEnabledSelector.IndexChanged:connect(function(v952) --[[ Line: 3749 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VignetteEnabledCustomOption = v952 == 1;
            end;
        end);
        l_NewPage_0.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(v953) --[[ Line: 3755 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRSmoothRotationEnabledCustomOption = v953 == 2;
            end;
        end);
        l_NewPage_0.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(v954) --[[ Line: 3761 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRThirdPersonFollowCamEnabledCustomOption = v954 == 2;
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ Line: 3767 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v955 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
            if l_NewPage_0.VRComfortSettingSelector:GetSelectedIndex() ~= v955 then
                l_NewPage_0.VRComfortSettingSelector:SetSelectionIndex(v955);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ Line: 3774 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v956 = l_GameSettings_0.VignetteEnabled and 1 or 2;
            if l_NewPage_0.VRVignetteEnabledSelector:GetSelectedIndex() ~= v956 then
                l_NewPage_0.VRVignetteEnabledSelector:SetSelectionIndex(v956);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ Line: 3781 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v957 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
            if l_NewPage_0.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= v957 then
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetSelectionIndex(v957);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 3788 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v958 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
            if l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= v958 then
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v958);
            end;
        end);
    end;
    local function v974() --[[ Line: 3796 ]] --[[ Name: createVRSafetyBubbleModeOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_2 = Enum.VRSafetyBubbleMode:GetEnumItems();
        local v961 = {
            title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
            description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
            ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
            ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
            ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
        };
        local v962 = {};
        for v963, v964 in ipairs(l_EnumItems_2) do
            v962[v963] = v24:Format(v961[tostring(v964)]);
        end;
        local v965 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
        task.defer(function() --[[ Line: 3812 ]]
            -- upvalues: l_NewPage_0 (ref), v93 (ref), v24 (ref), v961 (copy), v962 (copy), v965 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_EnumItems_2 (copy), l_GameSettings_0 (ref)
            local l_l_NewPage_0_89 = l_NewPage_0;
            local l_l_NewPage_0_90 = l_NewPage_0;
            local l_l_NewPage_0_91 = l_NewPage_0;
            local v969, v970, v971 = v93:AddNewRow(l_NewPage_0, v24:Format(v961.title), "DropDown", v962, v965, nil, v24:Format(v961.description));
            l_l_NewPage_0_89.VRSafetyBubbleModeFrame = v969;
            l_l_NewPage_0_90.VRSafetyBubbleModeLabel = v970;
            l_l_NewPage_0_91.VRSafetyBubbleModeSelector = v971;
            l_NewPage_0.VRSafetyBubbleModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSafetyBubbleModeFrame;
            l_NewPage_0.VRSafetyBubbleModeSelector.IndexChanged:connect(function(v972) --[[ Line: 3825 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref)
                l_GameSettings_0.VRSafetyBubbleMode = l_EnumItems_2[v972];
            end);
            l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 3830 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
                local v973 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
                if l_NewPage_0.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= v973 then
                    l_NewPage_0.VRSafetyBubbleModeSelector:SetSelectionIndex(v973);
                end;
            end);
        end);
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    local v975 = nil;
    local v976 = nil;
    local v977 = nil;
    if game:GetEngineFeature("VoiceChatSupported") and (l_GetFFlagEnableVrVoiceConnectDisconnect_0() or not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        spawn(function() --[[ Line: 3844 ]]
            -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (ref), v56 (ref), l_default_2 (ref), v914 (copy), l_isVoiceFocused_0 (ref), l_NewPage_0 (copy), l_observeIsVoiceFocused_0 (ref), v17 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v806 (copy), v123 (ref), v21 (ref), v933 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v122 (ref), v115 (ref)
            if l_GetFFlagEnableVoiceUxUpdates_0() and (not v56 and l_default_2:EligibleForFaeUpsell() or l_default_2:IsSeamlessVoice()) and l_default_2:verifyUniverseAndPlaceCanUseVoice() then
                v914();
                if l_isVoiceFocused_0() and l_NewPage_0.VoiceConnectDisconnectFrame then
                    l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                end;
                l_observeIsVoiceFocused_0(function(v978) --[[ Line: 3854 ]]
                    -- upvalues: l_NewPage_0 (ref)
                    if v978 then
                        if l_NewPage_0.VoiceConnectDisconnectFrame then
                            l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                            return;
                        end;
                    elseif l_NewPage_0.VoiceConnectDisconnectFrame then
                        l_NewPage_0.VoiceConnectDisconnectFrame.Visible = true;
                    end;
                end);
            end;
            l_default_2:asyncInit():andThen(function() --[[ Line: 3867 ]]
                -- upvalues: v17 (ref), l_default_2 (ref), l_NewPage_0 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v806 (ref), v123 (ref), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v21 (ref), v933 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref), l_observeIsVoiceFocused_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
                v17 = l_default_2:getService();
                if l_default_2:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                        v806();
                    end;
                end;
                if not v123() then
                    l_default_2:CheckAndShowNotAudiblePrompt();
                end;
                if l_GetFFlagEnableVoiceUxUpdates_0() then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    return;
                else
                    local v979 = false;
                    if v21() then
                        v933();
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                            v979 = l_isVoiceFocused_0();
                            l_observeIsVoiceFocused_0(function(v980) --[[ Line: 3886 ]]
                                -- upvalues: v979 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                                v979 = v980;
                                if v980 then
                                    if l_NewPage_0.VoiceConnectFrame then
                                        l_NewPage_0.VoiceConnectFrame.Visible = false;
                                    end;
                                    if l_NewPage_0.VoiceDisconnectFrame then
                                        l_NewPage_0.VoiceDisconnectFrame.Visible = false;
                                        return;
                                    end;
                                elseif l_default_2:ShouldShowJoinVoice() then
                                    if l_NewPage_0.VoiceConnectFrame then
                                        l_NewPage_0.VoiceConnectFrame.Visible = true;
                                    end;
                                    if l_NewPage_0.VoiceDisconnectFrame then
                                        l_NewPage_0.VoiceDisconnectFrame.Visible = false;
                                    end;
                                end;
                            end);
                        end;
                    end;
                    if v21() and l_NewPage_0.VoiceConnectFrame then
                        l_NewPage_0.VoiceConnectFrame.Visible = false;
                    end;
                    if v21() and l_NewPage_0.VoiceDisconnectFrame then
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                            l_NewPage_0.VoiceDisconnectFrame.Visible = not v979;
                        else
                            l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                        end;
                    end;
                    l_default_2.showVoiceUI.Event:Connect(function() --[[ Line: 3919 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v979 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v979 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = true;
                            local v981 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v981;
                            end;
                            if v21() and l_NewPage_0.VoiceConnectFrame then
                                l_NewPage_0.VoiceConnectFrame.Visible = false;
                            end;
                            if v21() and l_NewPage_0.VoiceDisconnectFrame then
                                l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                            end;
                            return;
                        end;
                    end);
                    l_default_2.hideVoiceUI.Event:Connect(function() --[[ Line: 3937 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v979 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v979 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = false;
                            local v982 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v982;
                            end;
                            if v21() and l_NewPage_0.VoiceConnectFrame then
                                l_NewPage_0.VoiceConnectFrame.Visible = true;
                            end;
                            if v21() and l_NewPage_0.VoiceDisconnectFrame then
                                l_NewPage_0.VoiceDisconnectFrame.Visible = false;
                            end;
                            return;
                        end;
                    end);
                    return;
                end;
            end):catch(function() --[[ Line: 3957 ]]
                -- upvalues: v122 (ref), v115 (ref), v123 (ref), l_default_2 (ref)
                if v122() then
                    v115:warning("Failed to init VoiceChatServiceManager");
                end;
                if not v123() then
                    l_default_2:CheckAndShowPermissionPrompt();
                end;
            end);
        end);
    end;
    if l_GetFFlagEnableCrossExpVoice_0() and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        v975 = l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 3970 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
            local v983 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v983;
            end;
        end);
        v976 = l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 3973 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
            local v984 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v984;
            end;
        end);
        v977 = function() --[[ Line: 3976 ]]
            -- upvalues: v975 (ref), v976 (ref)
            if v975 then
                v975:Disconnect();
                v975 = nil;
            end;
            if v976 then
                v976:Disconnect();
                v976 = nil;
            end;
        end;
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v985 = nil;
    local function __() --[[ Line: 3990 ]]
        -- upvalues: v985 (ref)
        if v985 then
            v985:disconnect();
            v985 = nil;
        end;
    end;
    if (v36 or l_GetFFlagSelfViewCameraSettings_0()) and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        local function v988(v987) --[[ Line: 3998 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.VideoOptionsEnabled = v987.hasCameraPermissions;
        end;
        if v34() then
            if v27() then
                v26(v988, {
                    l_default_0.Permissions.CAMERA_ACCESS
                }, true);
                if v985 then
                    v985:disconnect();
                end;
                v985 = v33:connect(function() --[[ Line: 4015 ]]
                    -- upvalues: l_NewPage_0 (copy), v885 (copy), l_VideoCaptureService_0 (ref), v887 (ref)
                    l_NewPage_0.VideoOptionsEnabled = true;
                    v885();
                    if l_VideoCaptureService_0.DevicesChanged then
                        v887 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3424 ]]
                            -- upvalues: l_NewPage_0 (ref), v885 (ref)
                            if l_NewPage_0.PageOpen then
                                v885();
                            end;
                        end);
                    end;
                end);
            end;
        else
            v26(v988, nil, nil, "GameSettings.createDeviceOptions");
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v452(not v105 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
    end;
    local function __() --[[ Line: 4034 ]]
        -- upvalues: l_GameSettings_0 (ref), v727 (copy)
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v727();
            return;
        else
            local v989 = nil;
            v989 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4040 ]]
                -- upvalues: l_GameSettings_0 (ref), v989 (ref), v727 (ref)
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v989 then
                        v989:disconnect();
                    end;
                    v727();
                end;
            end);
            return;
        end;
    end;
    if l_UserInputService_0.MouseEnabled then
        v710();
    elseif l_UserInputService_0.GamepadEnabled then
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v727();
        else
            local v991 = nil;
            do
                local l_v991_0 = v991;
                l_v991_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4040 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v991_0 (ref), v727 (copy)
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v991_0 then
                            l_v991_0:disconnect();
                        end;
                        v727();
                    end;
                end);
            end;
        end;
    else
        local v993 = nil;
        do
            local l_v993_0 = v993;
            l_v993_0 = l_UserInputService_0.GamepadConnected:connect(function() --[[ Line: 4058 ]]
                -- upvalues: l_v993_0 (ref), l_GameSettings_0 (ref), v727 (copy)
                if l_v993_0 then
                    l_v993_0:disconnect();
                end;
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    v727();
                    return;
                else
                    local v995 = nil;
                    v995 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4040 ]]
                        -- upvalues: l_GameSettings_0 (ref), v995 (ref), v727 (ref)
                        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                            if v995 then
                                v995:disconnect();
                            end;
                            v727();
                        end;
                    end);
                    return;
                end;
            end);
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        if l_GameSettings_0.IsUsingCameraYInverted then
            v677();
        else
            local v996 = nil;
            do
                local l_v996_0 = v996;
                l_v996_0 = l_GameSettings_0.Changed:connect(function(v998) --[[ Line: 4072 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v996_0 (ref), v677 (copy)
                    if v998 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                        l_v996_0:disconnect();
                        v677();
                    end;
                end);
            end;
        end;
    end;
    if l_isInExperienceUIVREnabled_0 then
        if l_isSpatial_0() then
            v959();
            v974();
        else
            v452(not v105 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
            if l_GameSettings_0.IsUsingCameraYInverted then
                v677();
            else
                local v999 = nil;
                do
                    local l_v999_0 = v999;
                    l_v999_0 = l_GameSettings_0.Changed:connect(function(v1001) --[[ Line: 4101 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v999_0 (ref), v677 (copy)
                        if v1001 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                            l_v999_0:disconnect();
                            v677();
                        end;
                    end);
                end;
            end;
            v222();
            v251();
        end;
    end;
    v648();
    if v67 then
        v658();
    end;
    v668();
    v208();
    if v49 and v50() then
        v237();
    end;
    if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
        v135(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v142);
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v222();
        v251();
    end;
    v266();
    v283();
    if not v109:IsSubjectToChinaPolicies() then
        v295();
    end;
    if v120 then
        v331();
    end;
    if v105 and l_getAppFeaturePolicies_0().getSupportsOverscan() then
        v739();
    end;
    if v49 and l_FFlagBadgeVisibilitySettingEnabled_0 then
        spawn(function() --[[ Line: 3104 ]]
            -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v1002 = 2;
            if v95.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v1002 = 1;
            end;
            local v1003 = v63:FormatByKey("Feature.SettingsHub.Label.Show");
            local v1004 = v63:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v1005 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v63:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v1006 = v63:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_92 = l_NewPage_0;
            local l_l_NewPage_0_93 = l_NewPage_0;
            local l_l_NewPage_0_94 = l_NewPage_0;
            local v1010, v1011, v1012 = v93:AddNewRow(l_NewPage_0, v1005, "Selector", {
                v1004, 
                v1003
            }, v1002, nil, v1006);
            l_l_NewPage_0_92.badgeVisibleRow = v1010;
            l_l_NewPage_0_93.badgeVisibleFrame = v1011;
            l_l_NewPage_0_94.badgeVisibleSelector = v1012;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v1013) --[[ Line: 3118 ]]
                -- upvalues: l_GameSettings_0 (ref), v95 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v1013 == 2;
                v95.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v1013 == 1);
            end);
        end);
    end;
    if l_FFlagEnableModerateChatRemoteEvent_0 then
        v850();
    end;
    v752();
    v96(l_RunService_0:IsStudio(), l_LocalPlayer_0, v95):andThen(function(v1014) --[[ Line: 4164 ]]
        -- upvalues: v781 (copy)
        if v1014 then
            v781();
        end;
    end):catch(function(v1015) --[[ Line: 4169 ]]
        warn(v1015);
    end);
    v157 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v1017, __ in pairs(v158) do
            v1017.Visible = not l_VREnabled_3;
        end;
    end;
    if v23 then
        l_NewPage_0.AudioHeader = v28({
            headerText = "CoreScripts.InGameMenu.GameSettings.AudioHeader", 
            layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.AudioHeader, 
            parent = l_NewPage_0.Page
        });
        l_NewPage_0.AudioDivider = v29({
            layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.AudioDivider, 
            parent = l_NewPage_0.Page
        });
        l_NewPage_0.DisplayHeader = v28({
            headerText = "CoreScripts.InGameMenu.GameSettings.DisplayHeader", 
            layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DisplayHeader, 
            parent = l_NewPage_0.Page
        });
        l_NewPage_0.DisplayDivider = v29({
            layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DisplayDivider, 
            parent = l_NewPage_0.Page
        });
        if not l_isSpatial_0() then
            l_NewPage_0.LanguageHeader = v28({
                headerText = "CoreScripts.InGameMenu.GameSettings.LanguageHeader", 
                layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageHeader, 
                parent = l_NewPage_0.Page
            });
            l_NewPage_0.LanguageDivider = v29({
                layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageDivider, 
                parent = l_NewPage_0.Page
            });
        end;
        l_NewPage_0.ViewAndControlsHeader = v28({
            headerText = "CoreScripts.InGameMenu.GameSettings.ViewandControlsHeader", 
            layoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ViewAndControlsHeader, 
            parent = l_NewPage_0.Page
        });
    end;
    l_NewPage_0.TabHeader.Name = "GameSettingsTab";
    local v1019 = l_Migration_0.uiblox["icons/common/settings"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v1019.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v102.Font[v1019.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __() --[[ Line: 4238 ]] --[[ Name: staticFeedbackEntryPointChecksPassed ]]
        -- upvalues: l_RunService_0 (ref), v130 (ref), v105 (ref)
        if l_RunService_0:IsStudio() then
            return false;
        elseif game:GetEngineFeature("CaptureModeEnabled") == false then
            return false;
        elseif v130 and v105 then
            return false;
        else
            return true;
        end;
    end;
    l_NewPage_0.OpenSettingsPage = function() --[[ Line: 4254 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v888 (copy), l_SoundService_0 (ref), v886 (ref), l_GameSettings_0 (ref), v36 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), v885 (copy), l_VideoCaptureService_0 (ref), v887 (ref), v788 (copy), v20 (ref), v77 (ref), v97 (ref), v76 (ref), l_FFlagIEMFocusNavToButtons_0 (ref), v155 (ref)
        l_NewPage_0.PageOpen = true;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            v888();
            if l_SoundService_0.DeviceListChanged then
                v886 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3414 ]]
                    -- upvalues: l_NewPage_0 (ref), v888 (ref)
                    if l_NewPage_0.PageOpen then
                        v888();
                    end;
                end);
            end;
            l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
            if (v36 or l_GetFFlagSelfViewCameraSettings_0()) and l_NewPage_0.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
                v885();
                if l_VideoCaptureService_0.DevicesChanged then
                    v887 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3424 ]]
                        -- upvalues: l_NewPage_0 (ref), v885 (ref)
                        if l_NewPage_0.PageOpen then
                            v885();
                        end;
                    end);
                end;
            end;
            v788();
            if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and l_NewPage_0.toggleFeedbackModeButton and l_NewPage_0.toggleFeedbackModeText then
                local l_l_NewPage_0_95 = l_NewPage_0;
                local v1022 = false;
                if v20 ~= nil then
                    v1022 = v20:CanEnterCaptureMode();
                end;
                l_l_NewPage_0_95.FeedbackEntryPointEnabled = v1022;
                if l_NewPage_0.FeedbackEntryPointEnabled then
                    l_NewPage_0.toggleFeedbackModeButton.Active = true;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = true;
                    l_NewPage_0.toggleFeedbackModeText.Text = v77;
                else
                    l_NewPage_0.toggleFeedbackModeButton.Active = false;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = false;
                    l_NewPage_0.toggleFeedbackModeText.TextColor3 = v97.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100));
                    l_NewPage_0.toggleFeedbackModeText.Text = v76;
                end;
            end;
            if l_FFlagIEMFocusNavToButtons_0 then
                table.insert(l_NewPage_0.LastSelectableObjects, v155(l_NewPage_0));
            end;
            return;
        end;
    end;
    l_NewPage_0.CloseSettingsPage = function() --[[ Line: 4307 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_SoundService_0 (ref), v886 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v977 (ref), v36 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), l_VideoCaptureService_0 (ref), v887 (ref), v34 (ref), v985 (ref), l_default_2 (ref)
        l_NewPage_0.PageOpen = false;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if l_SoundService_0.DeviceListChanged and v886 then
                v886:Disconnect();
            end;
            if l_GetFFlagEnableCrossExpVoice_0() and v977 then
                v977();
            end;
            if v36 or l_GetFFlagSelfViewCameraSettings_0() then
                if game:GetEngineFeature("VideoCaptureService") and l_VideoCaptureService_0.DevicesChanged and v887 then
                    v887:Disconnect();
                    v887 = nil;
                end;
                if v34() and v985 then
                    v985:disconnect();
                    v985 = nil;
                end;
            end;
            if game:GetEngineFeature("VoiceChatSupported") and l_NewPage_0.VoiceChatOptionsEnabled and l_NewPage_0.startVolume ~= nil and l_NewPage_0.startVolume > 0 then
                l_default_2:CheckAndShowNotAudiblePrompt();
            end;
            return;
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function() --[[ Line: 4342 ]] --[[ Name: isLangaugeSelectionDropdownEnabled ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v1023 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v1023) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v1025) --[[ Line: 4365 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v133 (ref), v134 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v142 (ref), v632 (copy), v84 (ref), v86 (ref), v85 (ref), v637 (copy), l_game_EngineFeature_0 (ref), v89 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref), v88 (ref), v91 (ref), l_RunService_0 (ref), v130 (ref), v105 (ref), v474 (copy)
        l_NewPage_0.HubRef = v1025;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if isLangaugeSelectionDropdownEnabled() then
                if v133() then
                    v134(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v142);
                else
                    v632();
                end;
            end;
            if game:GetEngineFeature("EnableTCSChatTranslation") and v84() then
                if v86() then
                    local v1026 = v85();
                    if not v637(v1026).ChatTranslationEnabled then
                        if l_game_EngineFeature_0 then
                            if v89() then
                                if l_GameSettings_0.ChatTranslationLocale == "" then
                                    l_GameSettings_0.ChatTranslationEnabled = false;
                                    l_GameSettings_0.ChatTranslationLocale = "en_us";
                                end;
                            else
                                l_GameSettings_0.ChatTranslationEnabled = false;
                            end;
                        else
                            pcall(function() --[[ Line: 4401 ]]
                                -- upvalues: l_TextChatService_0 (ref)
                                l_TextChatService_0.ChatTranslationEnabled = false;
                            end);
                        end;
                    elseif v88() then
                        l_GameSettings_0.ChatTranslationEnabled = true;
                    end;
                end;
                v91(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v142);
            end;
            if not l_RunService_0:IsStudio() and not (game:GetEngineFeature("CaptureModeEnabled") == false) and (not v130 or not v105 or false) then
                v474();
            end;
            return;
        end;
    end;
    return l_NewPage_0;
end)());