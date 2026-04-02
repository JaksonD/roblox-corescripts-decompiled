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
local l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 = v35.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty;
local l_GetFFlagEnableCrossExpVoice_0 = v35.GetFFlagEnableCrossExpVoice;
local l_GetFFlagSelfViewCameraSettings_0 = v35.GetFFlagSelfViewCameraSettings;
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local v40 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDebounceConnectDisconnectSelector);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFIntDebounceDisconnectButtonDelay);
local v42 = game:DefineFastFlag("MicroprofileGameSettingsFix", false);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v35.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v35.GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 = v35.GetFFlagVoiceChatClientRewriteDisableVCSDevice;
local l_FFlagIEMFocusNavToButtons_0 = v35.FFlagIEMFocusNavToButtons;
local v47 = game:DefineFastFlag("ShowAntiHarassmentSettings", false);
local v48 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting);
local v49 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy);
local l_FFlagBadgeVisibilitySettingEnabled_0 = v35.FFlagBadgeVisibilitySettingEnabled;
local l_GetFFlagEnableVoiceUxUpdates_0 = v35.GetFFlagEnableVoiceUxUpdates;
local l_GetFFlagEnableVrVoiceConnectDisconnect_0 = v35.GetFFlagEnableVrVoiceConnectDisconnect;
local v53 = game:DefineFastFlag("EnableVoiceSelectorTranslations_AEGIS2", false);
local v54 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false);
local v55 = game:DefineFastFlag("CenterShiftLockOverride", true);
local v56 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false);
local v57 = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false);
local l_FFlagEnableModerateChatRemoteEvent_0 = v35.FFlagEnableModerateChatRemoteEvent;
local v59 = game:DefineFastFlag("ModerateChatAnalytics", false);
local v60 = game:DefineFastFlag("PSUseVibrationInsteadOfHaptics", false);
local v61 = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false);
local v62 = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false);
local v63 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v66 = require(l_RobloxGui_0.Modules.Settings.Resources.GameSettingsConstants);
local v67 = l_default_1 and l_default_1.getHasPartyVoiceVolume();
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
local function __() --[[ Line: 162 ]] --[[ Name: getDefaultCameraMode ]]
    -- upvalues: l_UserInputService_0 (copy), v72 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v72.DEFAULT_FOLLOW;
    else
        return v72.DEFAULT_CLASSIC;
    end;
end;
local function __() --[[ Line: 171 ]] --[[ Name: getDefaultMovementMode ]]
    -- upvalues: l_UserInputService_0 (copy), v63 (copy), l_Constants_0 (copy), v74 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v63:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey);
    else
        return v74.DEFAULT_KEYBOARD;
    end;
end;
local function __() --[[ Line: 180 ]] --[[ Name: getDefaultSelectToMove ]]
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
local function v142(v137, v138, v139, v140) --[[ Line: 301 ]] --[[ Name: reportSettingsChangeForAnalytics ]]
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
local function v147() --[[ Line: 332 ]] --[[ Name: reportSettingsForAnalytics ]]
    -- upvalues: l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_game_EngineFeature_1 (copy), v48 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
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
    if v48() then
        v143.player_names_enabled = tostring(l_GameSettings_0.PlayerNamesEnabled);
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v143);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v148 = game:DefineFastFlag("IGMEnableGFXReset", false);
local function v155(v149) --[[ Line: 398 ]] --[[ Name: getLastValueChangerFrame ]]
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
return ((function() --[[ Line: 417 ]] --[[ Name: Initialize ]]
    -- upvalues: v148 (copy), v99 (copy), l_RobloxGui_0 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v93 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (copy), l_GuiService_0 (copy), v125 (copy), v124 (copy), v142 (copy), v147 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_game_EngineFeature_1 (copy), v63 (copy), l_game_FastInt_0 (copy), v69 (copy), v136 (copy), v49 (copy), v78 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v97 (copy), v55 (copy), v57 (copy), v42 (copy), v119 (copy), v118 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_LocalPlayer_0 (copy), v94 (copy), v72 (copy), v39 (copy), l_getAppFeaturePolicies_0 (copy), v74 (copy), v75 (copy), v71 (copy), v70 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v132 (copy), l_SafetyService_0 (copy), v20 (ref), v131 (copy), v77 (copy), v126 (copy), v115 (copy), l_Players_0 (copy), v76 (copy), l_RunService_0 (copy), v87 (copy), l_IXPServiceWrapper_0 (copy), v89 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), l_default_3 (copy), v60 (copy), v24 (ref), l_CorePackages_0 (copy), l_ContextActionService_0 (copy), v129 (copy), v95 (copy), v128 (copy), v127 (copy), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (ref), v122 (copy), l_SoundService_0 (copy), v73 (copy), v121 (copy), l_default_2 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v103 (copy), v59 (copy), v114 (copy), l_UserGameSettings_0 (copy), l_VideoCaptureService_0 (copy), v113 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v62 (copy), v61 (copy), v53 (copy), v41 (copy), v40 (copy), v101 (copy), v56 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_isVoiceFocused_0 (copy), l_GetFFlagEnableVrVoiceConnectDisconnect_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v54 (copy), l_observeIsVoiceFocused_0 (copy), v123 (copy), v21 (copy), l_GetFFlagSelfViewCameraSettings_0 (copy), v34 (copy), v27 (copy), v26 (copy), l_default_0 (copy), v33 (copy), v105 (copy), v67 (copy), v47 (copy), v48 (copy), v135 (copy), v109 (copy), v120 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v96 (copy), v23 (copy), v28 (ref), v29 (ref), l_Migration_0 (copy), v102 (copy), v130 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), v155 (copy), v133 (copy), v134 (copy), v84 (copy), v86 (copy), v85 (copy), l_game_EngineFeature_0 (copy), l_TextChatService_0 (copy), v88 (copy), v91 (copy)
    if v148 then
        v99.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v157 = false;
    local v158 = {};
    local __ = function() --[[ Line: 427 ]] --[[ Name: onVRSettingsReady ]]
        -- upvalues: l_VRService_0 (ref), v158 (copy)
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v160, __ in pairs(v158) do
            v160.Visible = not l_VREnabled_0;
        end;
    end;
    local function v166() --[[ Line: 434 ]] --[[ Name: onVREnabled ]]
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
    local function v208() --[[ Line: 446 ]] --[[ Name: createGraphicsOptions ]]
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
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v177) --[[ Line: 459 ]]
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
            spawn(function() --[[ Line: 484 ]]
                -- upvalues: v124 (ref), v142 (ref), v178 (copy), l_GameSettings_0 (ref), v147 (ref)
                if v124() then
                    v142("fullscreen_enabled", v178, l_GameSettings_0:InFullScreen());
                end;
                v147();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v179) --[[ Line: 492 ]]
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
            task.defer(function() --[[ Line: 556 ]]
                -- upvalues: l_NewPage_0 (ref), v93 (ref), v63 (ref), l_l_l_NewPage_0_2_0 (copy), l_l_l_NewPage_0_1_0 (copy), l_GameSettings_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v188, v189, v190 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_l_l_NewPage_0_2_0, table.find(l_l_l_NewPage_0_1_0, l_GameSettings_0.FramerateCap), nil, v63:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v188;
                l_l_NewPage_0_4.FramerateCapLabel = v189;
                l_l_NewPage_0_5.FramerateCapMode = v190;
                l_NewPage_0.FramerateCapFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FramerateCap;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v191) --[[ Line: 568 ]]
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
        SetGraphicsQuality = function(v193, v194) --[[ Line: 586 ]] --[[ Name: SetGraphicsQuality ]]
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
        l_l_NewPage_0_1 = function() --[[ Line: 612 ]] --[[ Name: setGraphicsToAuto ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        l_l_NewPage_0_2 = function(v199) --[[ Line: 620 ]] --[[ Name: setGraphicsToManual ]]
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
        l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v200) --[[ Line: 634 ]]
            -- upvalues: v174 (ref), v147 (ref)
            SetGraphicsQuality(v200);
            if v174 == true then
                v147();
            end;
            v174 = true;
        end);
        l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v201) --[[ Line: 642 ]]
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
        game.GraphicsQualityChangeRequest:Connect(function(v205) --[[ Line: 660 ]]
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
                spawn(function() --[[ Line: 693 ]]
                    -- upvalues: l_NewPage_0 (ref), l_v175_0 (ref)
                    l_NewPage_0.GraphicsQualitySlider:SetValue(l_v175_0);
                end);
            end;
        end;
    end;
    local function v222() --[[ Line: 699 ]] --[[ Name: createReducedMotionOptions ]]
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
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v220) --[[ Line: 721 ]]
            -- upvalues: l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v220 == 1;
            if v124() then
                v142("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v147();
        end);
    end;
    local function v237() --[[ Line: 732 ]] --[[ Name: createPlayerNamesEnabledOptions ]]
        -- upvalues: v136 (ref), v63 (ref), v49 (ref), l_GameSettings_0 (ref), v78 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v142 (ref), v147 (ref)
        local v223 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") else if v49 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else v63:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames");
        local v224 = if v49 then v63:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil;
        local function __() --[[ Line: 740 ]] --[[ Name: GetPlayerNamesEnabledStartIndex ]]
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
        l_NewPage_0.playerNamesEnabledMode.IndexChanged:connect(function(v235) --[[ Line: 759 ]]
            -- upvalues: l_GameSettings_0 (ref), v78 (ref), v142 (ref), v147 (ref)
            local l_PlayerNamesEnabled_0 = l_GameSettings_0.PlayerNamesEnabled;
            l_GameSettings_0.PlayerNamesEnabled = v235 == v78.On;
            v142("player_names_enabled", l_PlayerNamesEnabled_0, l_GameSettings_0.PlayerNamesEnabled);
            v147();
        end);
    end;
    local function v251() --[[ Line: 768 ]] --[[ Name: createPreferredTransparencyOptions ]]
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
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v249) --[[ Line: 794 ]]
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
    local function v266() --[[ Line: 806 ]] --[[ Name: createPreferredTextSizeOptions ]]
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
        l_NewPage_0.PreferredTextSizeSlider.ValueChanged:connect(function(v264) --[[ Line: 831 ]]
            -- upvalues: l_GameSettings_0 (ref), l_EnumItems_0 (copy), v124 (ref), v142 (ref), v147 (ref)
            local l_PreferredTextSize_0 = l_GameSettings_0.PreferredTextSize;
            l_GameSettings_0.PreferredTextSize = l_EnumItems_0[v264 + 1];
            if v124() then
                v142("preferred_text_size", l_PreferredTextSize_0, l_GameSettings_0.PreferredTextSize);
            end;
            v147();
        end);
    end;
    local function v283() --[[ Line: 841 ]] --[[ Name: createUiNavigationKeyBindOptions ]]
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
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v279) --[[ Line: 872 ]]
            -- upvalues: l_GameSettings_0 (ref), v267 (copy), v124 (ref), v142 (ref), v147 (ref)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v279 == v267.On;
            if v124() then
                v142("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v147();
        end);
        l_l_NewPage_0_18 = function() --[[ Line: 885 ]] --[[ Name: updateUiNavigationKeyBindVisibility ]]
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
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 900 ]]
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
    local function v295() --[[ Line: 905 ]] --[[ Name: createPerformanceStatsOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_Create_0 (ref), v97 (ref), v55 (ref), v124 (ref), v142 (ref), v147 (ref)
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
        GetDesiredPerformanceStatsIndex = function() --[[ Line: 911 ]] --[[ Name: GetDesiredPerformanceStatsIndex ]]
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
            Size = if v55 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v55 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v55 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v292) --[[ Line: 940 ]]
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
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function() --[[ Line: 962 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v294 = GetDesiredPerformanceStatsIndex();
            if v294 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v294);
            end;
        end);
    end;
    local function v302() --[[ Line: 972 ]] --[[ Name: createWebServerInformationRow ]]
        -- upvalues: l_NewPage_0 (copy), v93 (ref), v57 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v42 (ref), l_Create_0 (ref), v97 (ref)
        local l_l_NewPage_0_25 = l_NewPage_0;
        local l_l_NewPage_0_26 = l_NewPage_0;
        local l_l_NewPage_0_27 = l_NewPage_0;
        local v299, v300, v301 = v93:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not v57 and nil);
        l_l_NewPage_0_25.InformationFrame = v299;
        l_l_NewPage_0_26.InformationLabel = v300;
        l_l_NewPage_0_27.InformationTextBox = v301;
        l_NewPage_0.InformationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v42 then
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
    local function v331() --[[ Line: 1012 ]] --[[ Name: createMicroProfilerOptions ]]
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
        l_l_NewPage_0_28 = function() --[[ Line: 1017 ]] --[[ Name: tryContentLabel ]]
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
        l_l_NewPage_0_29 = function(v316) --[[ Line: 1029 ]] --[[ Name: setMicroProfilerIndex ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v119 (ref), v124 (ref), v302 (ref), v118 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v142 (ref), v147 (ref)
            local function __() --[[ Line: 1030 ]] --[[ Name: hideContentLabel ]]
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
        l_l_NewPage_0_30 = function() --[[ Line: 1103 ]] --[[ Name: GetDesiredWebServerIndex ]]
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
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 1132 ]]
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
        v309 = function(...) --[[ Line: 1142 ]] --[[ Name: onIndexChanged ]]
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
    local function v452(v332) --[[ Line: 1153 ]] --[[ Name: createCameraModeOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), l_Create_0 (ref), v97 (ref), v55 (ref), v124 (ref), v142 (ref), v147 (ref), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref), v94 (ref), v72 (ref), l_VRService_0 (ref), v39 (ref), l_getAppFeaturePolicies_0 (ref), v63 (ref), l_Constants_0 (ref), v74 (ref), v75 (ref), v71 (ref), v70 (ref)
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
            Size = if v55 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v55 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v55 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.ShiftLockFrame
        });
        l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v341) --[[ Line: 1184 ]]
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
        l_l_NewPage_0_37 = function(v343) --[[ Line: 1206 ]] --[[ Name: setShiftLockSelectorVisible ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v344 = v343 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v344;
                l_NewPage_0.ShiftLockMode:SetInteractable(v344);
            end;
        end;
        l_l_NewPage_0_38 = function() --[[ Line: 1214 ]] --[[ Name: applyDevOverrideShiftLockSelector ]]
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
        l_l_NewPage_0_39 = function() --[[ Line: 1222 ]] --[[ Name: updateShiftLockVisibility ]]
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
        l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ Line: 1232 ]]
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
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 1236 ]]
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
        cameraModeIsUserChoice = function() --[[ Line: 1242 ]] --[[ Name: cameraModeIsUserChoice ]]
            -- upvalues: l_UserInputService_0 (ref), l_LocalPlayer_0 (ref)
            if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v356) --[[ Line: 1251 ]] --[[ Name: setCameraModeVisible ]]
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
            v340 = function(v359) --[[ Line: 1265 ]] --[[ Name: updateCurrentCameraMovementIndex ]]
                -- upvalues: l_v339_0 (ref), l_v338_0 (ref), l_UserInputService_0 (ref), v124 (ref), l_GameSettings_0 (ref), v142 (ref)
                local v360 = nil;
                if not pcall(function() --[[ Line: 1267 ]]
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
            local function v371() --[[ Line: 1301 ]] --[[ Name: updateCameraMovementModes ]]
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
                v337.TouchCameraMovementModeRegistered:connect(function(__) --[[ Line: 1387 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v371_0 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_v371_0();
                    end;
                end);
                v337.ComputerCameraMovementModeRegistered:connect(function(__) --[[ Line: 1393 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v371_0 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_v371_0();
                    end;
                end);
            end;
            local l_v371_1 = v371 --[[ copy: 9 -> 25 ]];
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1400 ]]
                -- upvalues: l_v371_1 (copy)
                l_v371_1();
            end);
            l_l_NewPage_0_40 = false;
            local l_v340_1 = v340 --[[ copy: 8 -> 26 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v383) --[[ Line: 1405 ]]
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
        v338 = function() --[[ Line: 1421 ]] --[[ Name: createVROption ]]
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
                    l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v392) --[[ Line: 1436 ]]
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
        v339 = function() --[[ Line: 1455 ]] --[[ Name: onVREnabledChanged ]]
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
        if v39() and l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
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
        local function v401(__) --[[ Line: 1480 ]]

        end;
        local function __(v402) --[[ Line: 1484 ]] --[[ Name: setMovementModeVisible ]]
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
            local function __(v407) --[[ Line: 1498 ]] --[[ Name: getDisplayName ]]
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
            l_l_NewPage_0_46 = function(v416) --[[ Line: 1539 ]] --[[ Name: setMovementMode ]]
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
            v401 = function(v418) --[[ Line: 1556 ]]
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
            l_l_NewPage_0_47 = function() --[[ Line: 1568 ]] --[[ Name: updateMovementModes ]]
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
                v406.TouchMovementModeRegistered:connect(function(__) --[[ Line: 1612 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
                v406.ComputerMovementModeRegistered:connect(function(__) --[[ Line: 1618 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
            end;
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1625 ]]
                -- upvalues: l_l_NewPage_0_47 (copy)
                l_l_NewPage_0_47();
            end);
            local l_l_l_NewPage_0_46_1 = l_l_NewPage_0_46 --[[ copy: 17 -> 29 ]];
            l_NewPage_0.MovementMode.IndexChanged:connect(function(v435) --[[ Line: 1629 ]]
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
        v436 = function(v442) --[[ Line: 1675 ]] --[[ Name: updateUserSettingsMenu ]]
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
        l_LocalPlayer_0.Changed:connect(function(v451) --[[ Line: 1710 ]]
            -- upvalues: v71 (ref), v436 (copy), v70 (ref)
            if v71[v451] then
                v436(v451);
            end;
            if v70[v451] then
                v436(v451);
            end;
        end);
    end;
    local function v474() --[[ Line: 1723 ]] --[[ Name: createFeedbackModeOptions ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v132 (ref), l_NewPage_0 (copy), l_SafetyService_0 (ref), v20 (ref), v142 (ref), v131 (ref), v93 (ref), v77 (ref), v63 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v115 (ref)
        local v453 = l_Url_0.ROLES_URL .. "v1/users/authenticated/roles";
        local v454 = l_HttpService_0:RequestInternal({
            Url = v453, 
            Method = "GET"
        });
        local function v463(v455) --[[ Line: 1730 ]] --[[ Name: rolesCheckCallback ]]
            -- upvalues: v132 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v142 (ref), v131 (ref), v93 (ref), v77 (ref), v63 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v455 then
                if not v132 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                    return;
                else
                    local function v456() --[[ Line: 1742 ]] --[[ Name: onToggleFeedbackMode ]]
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
            v454:Start(function(v464, v465) --[[ Line: 1826 ]]
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
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 1838 ]]
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
    local function v697() --[[ Line: 1866 ]] --[[ Name: createTranslationOptions ]]
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
        local function v532(v496, v497) --[[ Line: 1931 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
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
                l_l_NewPage_0_52 = function(v515) --[[ Line: 2011 ]] --[[ Name: toggleTranslation ]]
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
                    local function v525(v522, v523) --[[ Line: 2058 ]] --[[ Name: callback ]]
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
                        v476 = v515;
                        if v515 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v479);
                        else
                            local v526 = v484[v487[v515]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485[v526].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v477 then
                        v477 = false;
                        v476 = v515;
                        if v515 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v479);
                        else
                            local v527 = v484[v487[v515]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485[v527].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    else
                        v521:Start(function(v528, v529) --[[ Line: 2101 ]]
                            -- upvalues: v115 (ref), v520 (copy), v525 (copy)
                            local v530 = false;
                            local v531 = nil;
                            if not v528 then
                                v531 = "User Experience Language Settings Update Request: Connection error";
                            elseif v529.StatusCode == 401 then
                                v531 = "User Experience Language Settings Update Request: Unauthorized";
                            elseif v529.StatusCode < 200 or v529.StatusCode >= 400 then
                                v531 = "User Experience Language Settings Update Request Status Code: " .. v529.StatusCode;
                            else
                                v115:info("User Experience Language Settings Update Request succeeded with code: " .. v529.StatusCode);
                                v530 = true;
                            end;
                            if not v530 then
                                v115:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v520 .. " with error message: " .. v531);
                            end;
                            v525(v530, v531);
                        end);
                        return;
                    end;
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(l_l_NewPage_0_52);
                return;
            end;
        end;
        local function __(v533, v534) --[[ Line: 2136 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
            -- upvalues: v495 (copy), l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (copy), v115 (ref), v494 (copy), v532 (copy), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v533 then
                v495:Start(function(v535, v536) --[[ Line: 2138 ]]
                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v532 (ref)
                    local v537 = false;
                    local v538 = nil;
                    if not v535 then
                        v538 = "User Experience Language Setting Request: Connection error";
                    elseif v536.StatusCode == 401 then
                        v538 = "User Experience Language Setting Request: Unauthorized";
                    elseif v536.StatusCode < 200 or v536.StatusCode >= 400 then
                        v538 = "User Experience Language Setting Request Status code: " .. v536.StatusCode;
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 2149 ]]
                            -- upvalues: l_HttpService_0 (ref), v536 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                            local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v536.Body).userUniverseLocalizationSettingValue;
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
                        v537 = l_status_1;
                        v538 = l_result_1;
                    end;
                    if not v537 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v538);
                    end;
                    v532(v537, v538);
                end);
                return;
            else
                local l_v534_0 = v534;
                if l_v534_0 == nil then
                    l_v534_0 = "Execution path did not set earliest error to non-nil value.";
                end;
                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v534_0);
                local l_l_NewPage_0_55 = l_NewPage_0;
                local l_l_NewPage_0_56 = l_NewPage_0;
                local l_l_NewPage_0_57 = l_NewPage_0;
                local v546, v547, v548 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v76
                }, 1);
                l_l_NewPage_0_55.LanguageSelectorFrame = v546;
                l_l_NewPage_0_56.LanguageSelectorLabel = v547;
                l_l_NewPage_0_57.LanguageSelectorMode = v548;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            end;
        end;
        local function __(v550, v551) --[[ Line: 2198 ]] --[[ Name: experienceSourceLanguageCallback ]]
            -- upvalues: v493 (copy), l_HttpService_0 (ref), v483 (copy), v115 (ref), v492 (copy), v495 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (copy), v494 (copy), v532 (copy), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v550 then
                v493:Start(function(v552, v553) --[[ Line: 2200 ]]
                    -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), v551 (ref), v550 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v532 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v554 = false;
                    local v555 = nil;
                    if not v552 then
                        v555 = "Experience Supported Language Request: Connection error";
                    elseif v553.StatusCode == 401 then
                        v555 = "Experience Supported Language Request: Unauthorized";
                    elseif v553.StatusCode < 200 or v553.StatusCode >= 400 then
                        v555 = "Experience Supported Language Request Status code: " .. v553.StatusCode;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 2210 ]]
                            -- upvalues: l_HttpService_0 (ref), v553 (copy), v483 (ref)
                            local v556 = l_HttpService_0:JSONDecode(v553.Body);
                            for v557, v558 in pairs(v556.data) do
                                v483[v557] = v558.languageCode;
                            end;
                        end);
                        v554 = l_status_2;
                        v555 = l_result_2;
                    end;
                    if not v554 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v555);
                    end;
                    if v551 == nil then
                        v551 = v555;
                    end;
                    local v561 = v554 and v550;
                    local l_v551_0 = v551;
                    if v561 then
                        v495:Start(function(v563, v564) --[[ Line: 2138 ]]
                            -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v532 (ref)
                            local v565 = false;
                            local v566 = nil;
                            if not v563 then
                                v566 = "User Experience Language Setting Request: Connection error";
                            elseif v564.StatusCode == 401 then
                                v566 = "User Experience Language Setting Request: Unauthorized";
                            elseif v564.StatusCode < 200 or v564.StatusCode >= 400 then
                                v566 = "User Experience Language Setting Request Status code: " .. v564.StatusCode;
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 2149 ]]
                                    -- upvalues: l_HttpService_0 (ref), v564 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                    local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v564.Body).userUniverseLocalizationSettingValue;
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
                                v565 = l_status_3;
                                v566 = l_result_3;
                            end;
                            if not v565 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v566);
                            end;
                            v532(v565, v566);
                        end);
                        return;
                    else
                        local l_l_v551_0_0 = l_v551_0;
                        if l_l_v551_0_0 == nil then
                            l_l_v551_0_0 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v551_0_0);
                        local l_l_NewPage_0_58 = l_NewPage_0;
                        local l_l_NewPage_0_59 = l_NewPage_0;
                        local l_l_NewPage_0_60 = l_NewPage_0;
                        local v574, v575, v576 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v76
                        }, 1);
                        l_l_NewPage_0_58.LanguageSelectorFrame = v574;
                        l_l_NewPage_0_59.LanguageSelectorLabel = v575;
                        l_l_NewPage_0_60.LanguageSelectorMode = v576;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                        return;
                    end;
                end);
            else
                local l_v551_1 = v551;
                if l_v551_1 == nil then
                    l_v551_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v551_1);
                local l_l_NewPage_0_61 = l_NewPage_0;
                local l_l_NewPage_0_62 = l_NewPage_0;
                local l_l_NewPage_0_63 = l_NewPage_0;
                local v581, v582, v583 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v76
                }, 1);
                l_l_NewPage_0_61.LanguageSelectorFrame = v581;
                l_l_NewPage_0_62.LanguageSelectorLabel = v582;
                l_l_NewPage_0_63.LanguageSelectorMode = v583;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
            end;
        end;
        local function __(v585, v586) --[[ Line: 2239 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
            -- upvalues: v491 (copy), l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (copy), v115 (ref), v490 (copy), v493 (copy), v483 (copy), v492 (copy), v495 (copy), v482 (ref), v481 (ref), v486 (copy), v494 (copy), v532 (copy), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v585 then
                v491:Start(function(v587, v588) --[[ Line: 2241 ]]
                    -- upvalues: l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (ref), v115 (ref), v490 (ref), v586 (ref), v585 (copy), v493 (ref), v483 (ref), v492 (ref), v495 (ref), v482 (ref), v481 (ref), v486 (ref), v494 (ref), v532 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v589 = false;
                    local v590 = nil;
                    if not v587 then
                        v590 = "Experience Source Language Request: Connection error";
                    elseif v588.StatusCode == 401 then
                        v590 = "Experience Source Language Request: Unauthorized";
                    elseif v588.StatusCode < 200 or v588.StatusCode >= 400 then
                        v590 = "Experience Source Language Status code: " .. v588.StatusCode;
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 2252 ]]
                            -- upvalues: l_HttpService_0 (ref), v588 (copy), v478 (ref), v479 (ref), v485 (ref)
                            v478 = l_HttpService_0:JSONDecode(v588.Body).languageCode;
                            v479 = v485[v478].localeCode;
                        end);
                        v589 = l_status_4;
                        v590 = l_result_4;
                    end;
                    if not v589 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v490 .. " with error message: " .. v590);
                    end;
                    if v586 == nil then
                        v586 = v590;
                    end;
                    local v593 = v589 and v585;
                    local l_v586_0 = v586;
                    if v593 then
                        v493:Start(function(v595, v596) --[[ Line: 2200 ]]
                            -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), l_v586_0 (ref), v593 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v532 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v597 = false;
                            local v598 = nil;
                            if not v595 then
                                v598 = "Experience Supported Language Request: Connection error";
                            elseif v596.StatusCode == 401 then
                                v598 = "Experience Supported Language Request: Unauthorized";
                            elseif v596.StatusCode < 200 or v596.StatusCode >= 400 then
                                v598 = "Experience Supported Language Request Status code: " .. v596.StatusCode;
                            else
                                local l_status_5, l_result_5 = pcall(function() --[[ Line: 2210 ]]
                                    -- upvalues: l_HttpService_0 (ref), v596 (copy), v483 (ref)
                                    local v599 = l_HttpService_0:JSONDecode(v596.Body);
                                    for v600, v601 in pairs(v599.data) do
                                        v483[v600] = v601.languageCode;
                                    end;
                                end);
                                v597 = l_status_5;
                                v598 = l_result_5;
                            end;
                            if not v597 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v598);
                            end;
                            if l_v586_0 == nil then
                                l_v586_0 = v598;
                            end;
                            local v604 = v597 and v593;
                            local l_l_v586_0_0 = l_v586_0;
                            if v604 then
                                v495:Start(function(v606, v607) --[[ Line: 2138 ]]
                                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v532 (ref)
                                    local v608 = false;
                                    local v609 = nil;
                                    if not v606 then
                                        v609 = "User Experience Language Setting Request: Connection error";
                                    elseif v607.StatusCode == 401 then
                                        v609 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v607.StatusCode < 200 or v607.StatusCode >= 400 then
                                        v609 = "User Experience Language Setting Request Status code: " .. v607.StatusCode;
                                    else
                                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2149 ]]
                                            -- upvalues: l_HttpService_0 (ref), v607 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                            local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v607.Body).userUniverseLocalizationSettingValue;
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
                                        v608 = l_status_6;
                                        v609 = l_result_6;
                                    end;
                                    if not v608 then
                                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v609);
                                    end;
                                    v532(v608, v609);
                                end);
                                return;
                            else
                                local l_l_l_v586_0_0_0 = l_l_v586_0_0;
                                if l_l_l_v586_0_0_0 == nil then
                                    l_l_l_v586_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v586_0_0_0);
                                local l_l_NewPage_0_64 = l_NewPage_0;
                                local l_l_NewPage_0_65 = l_NewPage_0;
                                local l_l_NewPage_0_66 = l_NewPage_0;
                                local v617, v618, v619 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v76
                                }, 1);
                                l_l_NewPage_0_64.LanguageSelectorFrame = v617;
                                l_l_NewPage_0_65.LanguageSelectorLabel = v618;
                                l_l_NewPage_0_66.LanguageSelectorMode = v619;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_v586_0_1 = l_v586_0;
                        if l_l_v586_0_1 == nil then
                            l_l_v586_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v586_0_1);
                        local l_l_NewPage_0_67 = l_NewPage_0;
                        local l_l_NewPage_0_68 = l_NewPage_0;
                        local l_l_NewPage_0_69 = l_NewPage_0;
                        local v624, v625, v626 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v76
                        }, 1);
                        l_l_NewPage_0_67.LanguageSelectorFrame = v624;
                        l_l_NewPage_0_68.LanguageSelectorLabel = v625;
                        l_l_NewPage_0_69.LanguageSelectorMode = v626;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_v586_1 = v586;
                if l_v586_1 == nil then
                    l_v586_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v586_1);
                local l_l_NewPage_0_70 = l_NewPage_0;
                local l_l_NewPage_0_71 = l_NewPage_0;
                local l_l_NewPage_0_72 = l_NewPage_0;
                local v631, v632, v633 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v76
                }, 1);
                l_l_NewPage_0_70.LanguageSelectorFrame = v631;
                l_l_NewPage_0_71.LanguageSelectorLabel = v632;
                l_l_NewPage_0_72.LanguageSelectorMode = v633;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 2 ]]
            end;
        end;
        v489:Start(function(v635, v636) --[[ Line: 2283 ]]
            -- upvalues: l_HttpService_0 (ref), v485 (copy), v486 (copy), v484 (copy), l_LocaleId_0 (copy), v481 (ref), v115 (ref), v488 (copy), v491 (copy), v478 (ref), v479 (ref), v490 (copy), v493 (copy), v483 (copy), v492 (copy), v495 (copy), v482 (ref), v494 (copy), v532 (copy), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local v637 = false;
            local v638 = nil;
            if not v635 then
                v638 = "Locale Code to Language Code Mapping Request: Connection error";
            elseif v636.StatusCode == 401 then
                v638 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif v636.StatusCode < 200 or v636.StatusCode >= 400 then
                v638 = "Locale Code to Language Code Mapping Request Status code: " .. v636.StatusCode;
            else
                local l_status_7, l_result_7 = pcall(function() --[[ Line: 2294 ]]
                    -- upvalues: l_HttpService_0 (ref), v636 (copy), v485 (ref), v486 (ref), v484 (ref), l_LocaleId_0 (ref), v481 (ref)
                    local v639 = l_HttpService_0:JSONDecode(v636.Body);
                    for __, v641 in pairs(v639.data) do
                        local l_languageCode_0 = v641.locale.language.languageCode;
                        local l_locale_0 = v641.locale.locale;
                        local l_name_0 = v641.locale.language.name;
                        local l_id_0 = v641.locale.language.id;
                        v485[l_languageCode_0] = {
                            localeCode = l_locale_0, 
                            languageName = l_name_0, 
                            id = l_id_0
                        };
                        v486[l_id_0] = l_languageCode_0;
                        v484[l_name_0] = l_languageCode_0;
                        if v641.locale.locale == l_LocaleId_0:gsub("-", "_") then
                            v481 = v641.locale.language.languageCode;
                        end;
                    end;
                end);
                v637 = l_status_7;
                v638 = l_result_7;
            end;
            if not v637 then
                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v488 .. " with error message: " .. v638);
            end;
            local l_v637_0 = v637;
            local l_v638_0 = v638;
            if l_v637_0 then
                v491:Start(function(v650, v651) --[[ Line: 2241 ]]
                    -- upvalues: l_HttpService_0 (ref), v478 (ref), v479 (ref), v485 (ref), v115 (ref), v490 (ref), l_v638_0 (ref), l_v637_0 (copy), v493 (ref), v483 (ref), v492 (ref), v495 (ref), v482 (ref), v481 (ref), v486 (ref), v494 (ref), v532 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v652 = false;
                    local v653 = nil;
                    if not v650 then
                        v653 = "Experience Source Language Request: Connection error";
                    elseif v651.StatusCode == 401 then
                        v653 = "Experience Source Language Request: Unauthorized";
                    elseif v651.StatusCode < 200 or v651.StatusCode >= 400 then
                        v653 = "Experience Source Language Status code: " .. v651.StatusCode;
                    else
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 2252 ]]
                            -- upvalues: l_HttpService_0 (ref), v651 (copy), v478 (ref), v479 (ref), v485 (ref)
                            v478 = l_HttpService_0:JSONDecode(v651.Body).languageCode;
                            v479 = v485[v478].localeCode;
                        end);
                        v652 = l_status_8;
                        v653 = l_result_8;
                    end;
                    if not v652 then
                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v490 .. " with error message: " .. v653);
                    end;
                    if l_v638_0 == nil then
                        l_v638_0 = v653;
                    end;
                    local v656 = v652 and l_v637_0;
                    local l_l_v638_0_0 = l_v638_0;
                    if v656 then
                        v493:Start(function(v658, v659) --[[ Line: 2200 ]]
                            -- upvalues: l_HttpService_0 (ref), v483 (ref), v115 (ref), v492 (ref), l_l_v638_0_0 (ref), v656 (copy), v495 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v494 (ref), v532 (ref), l_NewPage_0 (ref), v93 (ref), v63 (ref), v76 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v660 = false;
                            local v661 = nil;
                            if not v658 then
                                v661 = "Experience Supported Language Request: Connection error";
                            elseif v659.StatusCode == 401 then
                                v661 = "Experience Supported Language Request: Unauthorized";
                            elseif v659.StatusCode < 200 or v659.StatusCode >= 400 then
                                v661 = "Experience Supported Language Request Status code: " .. v659.StatusCode;
                            else
                                local l_status_9, l_result_9 = pcall(function() --[[ Line: 2210 ]]
                                    -- upvalues: l_HttpService_0 (ref), v659 (copy), v483 (ref)
                                    local v662 = l_HttpService_0:JSONDecode(v659.Body);
                                    for v663, v664 in pairs(v662.data) do
                                        v483[v663] = v664.languageCode;
                                    end;
                                end);
                                v660 = l_status_9;
                                v661 = l_result_9;
                            end;
                            if not v660 then
                                v115:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v492 .. " with error message: " .. v661);
                            end;
                            if l_l_v638_0_0 == nil then
                                l_l_v638_0_0 = v661;
                            end;
                            local v667 = v660 and v656;
                            local l_l_l_v638_0_0_0 = l_l_v638_0_0;
                            if v667 then
                                v495:Start(function(v669, v670) --[[ Line: 2138 ]]
                                    -- upvalues: l_HttpService_0 (ref), v482 (ref), v481 (ref), v478 (ref), v486 (ref), v115 (ref), v494 (ref), v532 (ref)
                                    local v671 = false;
                                    local v672 = nil;
                                    if not v669 then
                                        v672 = "User Experience Language Setting Request: Connection error";
                                    elseif v670.StatusCode == 401 then
                                        v672 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v670.StatusCode < 200 or v670.StatusCode >= 400 then
                                        v672 = "User Experience Language Setting Request Status code: " .. v670.StatusCode;
                                    else
                                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2149 ]]
                                            -- upvalues: l_HttpService_0 (ref), v670 (copy), v482 (ref), v481 (ref), v478 (ref), v486 (ref)
                                            local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v670.Body).userUniverseLocalizationSettingValue;
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
                                        v671 = l_status_10;
                                        v672 = l_result_10;
                                    end;
                                    if not v671 then
                                        v115:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v494 .. " with error message: " .. v672);
                                    end;
                                    v532(v671, v672);
                                end);
                                return;
                            else
                                local l_l_l_l_v638_0_0_0_0 = l_l_l_v638_0_0_0;
                                if l_l_l_l_v638_0_0_0_0 == nil then
                                    l_l_l_l_v638_0_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_l_v638_0_0_0_0);
                                local l_l_NewPage_0_73 = l_NewPage_0;
                                local l_l_NewPage_0_74 = l_NewPage_0;
                                local l_l_NewPage_0_75 = l_NewPage_0;
                                local v680, v681, v682 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v76
                                }, 1);
                                l_l_NewPage_0_73.LanguageSelectorFrame = v680;
                                l_l_NewPage_0_74.LanguageSelectorLabel = v681;
                                l_l_NewPage_0_75.LanguageSelectorMode = v682;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_l_v638_0_0_1 = l_l_v638_0_0;
                        if l_l_l_v638_0_0_1 == nil then
                            l_l_l_v638_0_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v638_0_0_1);
                        local l_l_NewPage_0_76 = l_NewPage_0;
                        local l_l_NewPage_0_77 = l_NewPage_0;
                        local l_l_NewPage_0_78 = l_NewPage_0;
                        local v687, v688, v689 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v76
                        }, 1);
                        l_l_NewPage_0_76.LanguageSelectorFrame = v687;
                        l_l_NewPage_0_77.LanguageSelectorLabel = v688;
                        l_l_NewPage_0_78.LanguageSelectorMode = v689;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_l_v638_0_1 = l_v638_0;
                if l_l_v638_0_1 == nil then
                    l_l_v638_0_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v115:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v638_0_1);
                local l_l_NewPage_0_79 = l_NewPage_0;
                local l_l_NewPage_0_80 = l_NewPage_0;
                local l_l_NewPage_0_81 = l_NewPage_0;
                local v694, v695, v696 = v93:AddNewRow(l_NewPage_0, v63:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v76
                }, 1);
                l_l_NewPage_0_79.LanguageSelectorFrame = v694;
                l_l_NewPage_0_80.LanguageSelectorLabel = v695;
                l_l_NewPage_0_81.LanguageSelectorMode = v696;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 6 ]]
            end;
        end);
    end;
    local function v702(v698) --[[ Line: 2333 ]] --[[ Name: getChatTranslationLayerData ]]
        -- upvalues: v87 (ref), l_IXPServiceWrapper_0 (ref), v89 (ref)
        local v699 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v698 or v698 == "" then
            return v699;
        elseif v698 == "override" then
            v699.ChatTranslationEnabled = true;
            return v699;
        else
            if v87() then
                l_IXPServiceWrapper_0:WaitForInitialization();
            end;
            local l_status_11, l_result_11 = pcall(function() --[[ Line: 2355 ]]
                -- upvalues: l_IXPServiceWrapper_0 (ref), v698 (copy)
                return l_IXPServiceWrapper_0:GetLayerData(v698);
            end);
            if l_status_11 then
                if v89() then
                    v699.ChatTranslationEnabled = l_result_11.ChatTranslationEnabled or true;
                    v699.ChatTranslationToggleEnabled = l_result_11.ChatTranslationToggleEnabled or false;
                    return v699;
                else
                    v699.ChatTranslationEnabled = l_result_11.chatTranslationEnabled or false;
                    v699.ChatTranslationToggleEnabled = l_result_11.chatTranslationToggleEnabled or false;
                end;
            end;
            return v699;
        end;
    end;
    local function v713() --[[ Line: 2373 ]] --[[ Name: createVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v703 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_82 = l_NewPage_0;
        local l_l_NewPage_0_83 = l_NewPage_0;
        local l_l_NewPage_0_84 = l_NewPage_0;
        local v707, v708, v709 = v93:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v703);
        l_l_NewPage_0_82.VolumeFrame = v707;
        l_l_NewPage_0_83.VolumeLabel = v708;
        l_l_NewPage_0_84.VolumeSlider = v709;
        l_NewPage_0.VolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VolumeFrame;
        l_l_NewPage_0_82 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_82.Name = "VolumeChangeSound";
        l_l_NewPage_0_82.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v710) --[[ Line: 2384 ]]
            -- upvalues: v124 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_82 (copy), v142 (ref), v147 (ref)
            local v711 = nil;
            if v124() then
                v711 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v712 = v710 / 10;
            l_l_NewPage_0_82.Volume = v712;
            l_l_NewPage_0_82:Play();
            l_GameSettings_0.MasterVolume = v712;
            if v124() then
                v142("volume", v711, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v147();
        end);
    end;
    local function v723() --[[ Line: 2402 ]] --[[ Name: createPartyVoiceVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), l_default_3 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v714 = math.floor(l_GameSettings_0.PartyVoiceVolume * 10);
        local l_l_NewPage_0_85 = l_NewPage_0;
        local l_l_NewPage_0_86 = l_NewPage_0;
        local l_l_NewPage_0_87 = l_NewPage_0;
        local v718, v719, v720 = v93:AddNewRow(l_NewPage_0, "Party Voice Volume", "Slider", 10, v714);
        l_l_NewPage_0_85.PartyVoiceVolumeFrame = v718;
        l_l_NewPage_0_86.PartyVoiceVolumeLabel = v719;
        l_l_NewPage_0_87.PartyVoiceVolumeSlider = v720;
        l_NewPage_0.PartyVoiceVolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PartyVoiceVolumeFrame;
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            l_NewPage_0.PartyVoiceVolumeFrame.Visible = l_default_3.hasExperienceStarted;
            l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 2411 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = true;
            end);
            l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 2414 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = false;
            end);
        end;
        l_NewPage_0.PartyVoiceVolumeSlider.ValueChanged:connect(function(v721) --[[ Line: 2419 ]]
            -- upvalues: v124 (ref), v714 (copy), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
            local v722 = nil;
            if v124() then
                v722 = if v714 ~= nil then math.floor(v714 * 10 + 0.5) else 0;
            end;
            l_GameSettings_0.PartyVoiceVolume = v721 / 10;
            if v124() then
                v142("party_voice_volume", v722, (math.floor(v721 * 10 + 0.5)));
            end;
            v147();
        end);
    end;
    local function v733() --[[ Line: 2435 ]] --[[ Name: createHapticsToggle ]]
        -- upvalues: l_GameSettings_0 (ref), v60 (ref), l_getAppFeaturePolicies_0 (ref), v24 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v724 = l_GameSettings_0.HapticStrength == 0 and 1 or 2;
        local v725 = if v60 and l_getAppFeaturePolicies_0().getShouldUseVibrationInsteadOfHaptics() then v24:Format("CoreScripts.InGameMenu.Vibration") else "Haptics";
        local l_l_NewPage_0_88 = l_NewPage_0;
        local l_l_NewPage_0_89 = l_NewPage_0;
        local v728, v729, v730 = v93:AddNewRow(l_NewPage_0, v725, "Selector", {
            "Off", 
            "On"
        }, v724);
        l_l_NewPage_0_88.HapticsFrame = v728;
        _ = v729;
        l_l_NewPage_0_89.HapticsSelector = v730;
        l_NewPage_0.HapticsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.HapticsFrame;
        l_NewPage_0.HapticsSelector.IndexChanged:connect(function(v731) --[[ Line: 2444 ]]
            -- upvalues: l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
            local l_HapticStrength_0 = l_GameSettings_0.HapticStrength;
            if v731 == 2 then
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
    local function v742() --[[ Line: 2460 ]] --[[ Name: createCameraInvertedOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), v124 (ref), v142 (ref), v147 (ref)
        local v734 = 1;
        if pcall(function() --[[ Line: 2462 ]]
            -- upvalues: l_GameSettings_0 (ref), v734 (ref)
            if l_GameSettings_0.CameraYInverted == true then
                v734 = 2;
            end;
        end) == false then
            return;
        else
            local l_l_NewPage_0_90 = l_NewPage_0;
            local l_l_NewPage_0_91 = l_NewPage_0;
            local v737, v738, v739 = v93:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v734);
            l_l_NewPage_0_90.CameraInvertedFrame = v737;
            _ = v738;
            l_l_NewPage_0_91.CameraInvertedSelector = v739;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraInvertedFrame;
            v158[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v740) --[[ Line: 2477 ]]
                -- upvalues: v124 (ref), l_GameSettings_0 (ref), v142 (ref), v147 (ref)
                local v741 = nil;
                if v124() then
                    v741 = l_GameSettings_0.CameraYInverted;
                end;
                if v740 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v124() then
                    v142("camera_y_inverted", v741, l_GameSettings_0.CameraYInverted);
                end;
                v147();
            end);
            return;
        end;
    end;
    local function v747(v743) --[[ Line: 2496 ]] --[[ Name: setCameraSensitivity ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v124 (ref), v142 (ref), v147 (ref)
        local v744 = nil;
        local v745 = nil;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            if v124() then
                v744 = "gamepad";
                v745 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v743;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v124() then
                v744 = "mouse";
                v745 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v746 = Vector2.new(v743, v743);
            l_GameSettings_0.MouseSensitivityFirstPerson = v746;
            l_GameSettings_0.MouseSensitivityThirdPerson = v746;
        end;
        if v124() and typeof(v745) == "number" and typeof(v743) == "number" then
            v142("camera_sensitivity", tonumber(string.format("%.2f", v745)), tonumber(string.format("%.2f", v743)), {
                sensitivity_type = v744
            });
        end;
        v147();
    end;
    local function v775() --[[ Line: 2534 ]] --[[ Name: createMouseOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v158 (copy), l_Create_0 (ref), v97 (ref), v747 (copy)
        local function __(v748) --[[ Line: 2539 ]] --[[ Name: translateEngineMouseSensitivityToGui ]]
            local v749 = v748 <= 1 and math.floor((v748 - 0.2) / 0.16 + 0.5) or math.floor((v748 + 2) / 0.6 + 0.5);
            if v748 <= 0.2 then
                return 0;
            else
                return v749;
            end;
        end;
        local function __(v751) --[[ Line: 2547 ]] --[[ Name: translateGuiMouseSensitivityToEngine ]]
            local v752 = v751 <= 5 and 0.16 * v751 + 0.2 or 0.6 * v751 - 2;
            if v752 <= 0.2 then
                return 0.2;
            else
                return v752;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v755 = l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5);
        local v756 = l_MouseSensitivity_0 <= 0.2 and 0 or v755;
        l_MouseSensitivity_0 = true;
        v755 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_92 = l_NewPage_0;
        local l_l_NewPage_0_93 = l_NewPage_0;
        local l_l_NewPage_0_94 = l_NewPage_0;
        local v760, v761, v762 = v93:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v756);
        l_l_NewPage_0_92.MouseAdvancedFrame = v760;
        l_l_NewPage_0_93.MouseAdvancedLabel = v761;
        l_l_NewPage_0_94.MouseAdvancedEntry = v762;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MouseAdvancedFrame;
        v158[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_92 = l_Create_0("TextBox")({
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
            Parent = l_l_NewPage_0_92
        });
        l_l_NewPage_0_93 = function(v763) --[[ Line: 2606 ]] --[[ Name: setMouseSensitivityText ]]
            -- upvalues: l_l_NewPage_0_92 (copy)
            v763 = math.floor(v763 * 1000 + 0.5) / 1000;
            l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v763)))));
        end;
        l_l_NewPage_0_94 = math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000;
        l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", l_l_NewPage_0_94)))));
        l_l_NewPage_0_94 = l_NewPage_0.MouseAdvancedEntry;
        v762 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        local v764 = v762 <= 1 and math.floor((v762 - 0.2) / 0.16 + 0.5) or math.floor((v762 + 2) / 0.6 + 0.5);
        l_l_NewPage_0_94:SetValue(v762 <= 0.2 and 0 or v764);
        clampMouseSensitivity = function(v765) --[[ Line: 2621 ]] --[[ Name: clampMouseSensitivity ]]
            if v765 < 0 then
                v765 = -v765;
            end;
            if v765 > 100 then
                return 100;
            else
                if v765 < 0.001 then
                    v765 = 0.001;
                end;
                return v765;
            end;
        end;
        setMouseSensitivity = function(v766, v767) --[[ Line: 2639 ]] --[[ Name: setMouseSensitivity ]]
            -- upvalues: l_MouseSensitivity_0 (ref), v747 (ref), l_NewPage_0 (ref), l_l_NewPage_0_92 (copy)
            if not l_MouseSensitivity_0 then
                return;
            else
                v747(v766);
                l_MouseSensitivity_0 = false;
                if v767 ~= l_NewPage_0.MouseAdvancedEntry then
                    local l_MouseAdvancedEntry_0 = l_NewPage_0.MouseAdvancedEntry;
                    local v769 = v766 <= 1 and math.floor((v766 - 0.2) / 0.16 + 0.5) or math.floor((v766 + 2) / 0.6 + 0.5);
                    l_MouseAdvancedEntry_0:SetValue(v766 <= 0.2 and 0 or v769);
                end;
                local v770 = math.floor(v766 * 1000 + 0.5) / 1000;
                l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v770)))));
                l_MouseSensitivity_0 = true;
                return;
            end;
        end;
        l_l_NewPage_0_92.FocusLost:connect(function() --[[ Line: 2657 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_92 (copy), l_GameSettings_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v771 = tonumber((string.match(l_l_NewPage_0_92.Text, "([%d%.]+)")));
            if v771 then
                setMouseSensitivity(clampMouseSensitivity(v771), l_l_NewPage_0_92);
                return;
            else
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_92);
                return;
            end;
        end);
        l_l_NewPage_0_92.Focused:connect(function() --[[ Line: 2669 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v772) --[[ Line: 2673 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v773 = clampMouseSensitivity(v772);
            local v774 = v773 <= 5 and 0.16 * v773 + 0.2 or 0.6 * v773 - 2;
            v772 = v774 <= 0.2 and 0.2 or v774;
            setMouseSensitivity(v772, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v792() --[[ Line: 2680 ]] --[[ Name: createGamepadOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v747 (copy)
        local function __(v776) --[[ Line: 2685 ]] --[[ Name: translateEngineGamepadSensitivityToGui ]]
            local v777 = v776 <= 1 and math.floor((v776 - 0.2) / 0.16 + 0.5) or math.floor((v776 + 2) / 0.6 + 0.5);
            if v776 <= 0.2 then
                return 0;
            else
                return v777;
            end;
        end;
        local function __(v779) --[[ Line: 2692 ]] --[[ Name: translateGuiGamepadSensitivityToEngine ]]
            local v780 = v779 <= 5 and 0.16 * v779 + 0.2 or 0.6 * v779 - 2;
            if v780 <= 0.2 then
                return 0.2;
            else
                return v780;
            end;
        end;
        local l_GamepadCameraSensitivity_1 = l_GameSettings_0.GamepadCameraSensitivity;
        local v783 = l_GamepadCameraSensitivity_1 <= 1 and math.floor((l_GamepadCameraSensitivity_1 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_1 + 2) / 0.6 + 0.5);
        local v784 = l_GamepadCameraSensitivity_1 <= 0.2 and 0 or v783;
        l_GamepadCameraSensitivity_1 = l_NewPage_0;
        v783 = l_NewPage_0;
        local l_l_NewPage_0_95 = l_NewPage_0;
        local v786, v787, v788 = v93:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v784);
        l_GamepadCameraSensitivity_1.GamepadSensitivityFrame = v786;
        v783.GamepadSensitivityLabel = v787;
        l_l_NewPage_0_95.GamepadSensitivitySlider = v788;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v789) --[[ Line: 2707 ]]
            -- upvalues: v747 (ref)
            local l_v747_0 = v747;
            local v791 = v789 <= 5 and 0.16 * v789 + 0.2 or 0.6 * v789 - 2;
            l_v747_0(v791 <= 0.2 and 0.2 or v791);
        end);
    end;
    local function v804() --[[ Line: 2712 ]] --[[ Name: createOverscanOption ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref), v93 (ref), l_NewPage_0 (copy), v97 (ref), l_RunService_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local function v799() --[[ Line: 2713 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref)
            local v793 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v794 = nil;
            v794 = require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan);
            v794 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)(v794);
            local v795 = require(l_CorePackages_0.Packages.Roact);
            local v796 = nil;
            local v797 = {
                onUnmount = function() --[[ Line: 2724 ]]
                    -- upvalues: v796 (ref), v795 (copy), l_ContextActionService_0 (ref), v793 (copy)
                    if v796 then
                        v795.unmount(v796);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v793:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v793:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function() --[[ Line: 2740 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local v798 = nil;
            v798 = v795.createElement(v794, v797);
            v796 = v795.mount(v798, l_RobloxGui_0, (tostring(v794)));
        end;
        local v800, v801, v802 = v93:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v799, l_NewPage_0);
        v801.Font = v97.font(Enum.Font.SourceSans);
        v800.Position = UDim2.new(1, -400, 0, 12);
        v800.Size = UDim2.new(0, 300, 0, 40);
        v800.Position = UDim2.new(1, -400, 0.5, 0);
        v800.AnchorPoint = Vector2.new(0, 0.5);
        if l_RunService_0:IsStudio() then
            v800.Selectable = false;
            v800.Active = false;
            v800.Enabled.Value = false;
            v801.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v803 = v93:AddNewRowObject(l_NewPage_0, "Safe Zone", v800);
        v803.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.OverscanAdjustButton;
        v802(v803);
    end;
    local function v817() --[[ Line: 2779 ]] --[[ Name: createDeveloperConsoleOption ]]
        -- upvalues: v142 (ref), v129 (ref), v93 (ref), l_NewPage_0 (copy), v97 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_RunService_0 (ref), v95 (ref), l_Players_0 (ref)
        local function v816() --[[ Line: 2781 ]] --[[ Name: makeDevConsoleOption ]]
            -- upvalues: v142 (ref), v129 (ref), v93 (ref), l_NewPage_0 (ref), v97 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local function v807() --[[ Line: 2782 ]] --[[ Name: onOpenDevConsole ]]
                -- upvalues: v142 (ref)
                local v805 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v805 then
                    v805:SetVisibility(true);
                    local v806 = require(script.Parent.Parent.SettingsHub);
                    if v806 then
                        v806:SetVisibility(false);
                    end;
                    v142("dev_console", "", "pressed");
                end;
            end;
            if v129 then
                local v808, v809, v810 = v93:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v807, l_NewPage_0);
                v809.Font = v97.font(Enum.Font.SourceSans);
                v808.Size = UDim2.new(0.6, -10, 0, 35);
                v808.Position = UDim2.new(0.4, 10, 0.5, 0);
                v808.AnchorPoint = Vector2.new(0, 0.5);
                local v811 = v93:AddNewRowObject(l_NewPage_0, "Developer Console", v808, nil, true);
                v811.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v810(v811);
                return;
            else
                local v812, v813, v814 = v93:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v807, l_NewPage_0);
                v813.Font = v97.font(Enum.Font.SourceSans);
                v812.Size = UDim2.new(0.6, -10, 0, 35);
                v812.Position = UDim2.new(1, -400, 0.5, 0);
                v812.AnchorPoint = Vector2.new(0, 0.5);
                local v815 = v93:AddNewRowObject(l_NewPage_0, "Developer Console", v812);
                v815.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v814(v815);
                return;
            end;
        end;
        if l_RunService_0:IsStudio() then
            v816();
            return;
        else
            spawn(function() --[[ Line: 2834 ]]
                -- upvalues: v95 (ref), l_Players_0 (ref), v816 (copy)
                if v95.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v816();
                end;
            end);
            return;
        end;
    end;
    local function v846() --[[ Line: 2843 ]] --[[ Name: createUiToggleOptions ]]
        -- upvalues: v128 (ref), v127 (ref), v63 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v128 or v127 then
            local v818 = {
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
            local v819 = v63:FormatByKey("InGame.CommonUI.Label.On");
            local v820 = v63:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v822 in v818 do
                local v823 = v63:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v822.label
                });
                local v824, v825, v826 = v93:AddNewRow(l_NewPage_0, v823, "Selector", {
                    v819, 
                    v820
                }, 1);
                v824.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0[v822.layoutOrderKey];
                v826.IndexChanged:Connect(function(v827) --[[ Line: 2871 ]]
                    -- upvalues: l_GuiService_0 (ref), v822 (copy)
                    if (l_GuiService_0:GetGuiIsVisible(v822.type) and 1 or 2) ~= v827 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v822.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v822.label] = {
                    label = v823, 
                    type = v822.type, 
                    row = v824, 
                    frame = v825, 
                    selector = v826
                };
            end;
            local v828 = v63:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_96 = l_NewPage_0;
            local l_l_NewPage_0_97 = l_NewPage_0;
            local l_l_NewPage_0_98 = l_NewPage_0;
            local v832, v833, v834 = v93:AddNewRow(l_NewPage_0, v828, "Selector", {
                v820, 
                v819
            }, 1);
            l_l_NewPage_0_96.freecamRow = v832;
            l_l_NewPage_0_97.freecamFrame = v833;
            l_l_NewPage_0_98.freecamSelector = v834;
            l_NewPage_0.freecamRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v835) --[[ Line: 2893 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v836 = v835 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if not l_l_LocalPlayer_0_FirstChild_0 then
                    warn("Freecam not present");
                    return;
                else
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v836);
                    return;
                end;
            end);
            return;
        else
            local v838 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_99 = l_NewPage_0;
            local l_l_NewPage_0_100 = l_NewPage_0;
            local l_l_NewPage_0_101 = l_NewPage_0;
            local v842, v843, v844 = v93:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v838, 1);
            l_l_NewPage_0_99.uiToggleRow = v842;
            l_l_NewPage_0_100.uiToggleFrame = v843;
            l_l_NewPage_0_101.uiToggleSelector = v844;
            l_NewPage_0.uiToggleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__) --[[ Line: 2912 ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return;
        end;
    end;
    local function v853() --[[ Line: 2918 ]] --[[ Name: updateUiToggleSelection ]]
        -- upvalues: v128 (ref), v127 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v128 or v127 then
            if not l_NewPage_0.uiToggleSelectors then
                return;
            else
                for __, v848 in l_NewPage_0.uiToggleSelectors do
                    local v849 = l_GuiService_0:GetGuiIsVisible(v848.type) and 1 or 2;
                    if v849 ~= v848.selector:GetSelectedIndex() then
                        v848.selector:SetSelectionIndex(v849);
                    end;
                end;
                local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_1 then
                    local v851 = l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 2 or 1;
                    l_NewPage_0.freecamSelector:SetSelectionIndex(v851);
                    return;
                end;
            end;
        elseif not l_NewPage_0.uiToggleSelector then
            return;
        else
            local v852 = nil;
            v852 = l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2;
            if v852 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                return;
            else
                l_NewPage_0.uiToggleSelector:SetSelectionIndex(v852);
            end;
        end;
    end;
    local function __(v854, v855, v856) --[[ Line: 2960 ]] --[[ Name: isValidDeviceList ]]
        return v854 and v855 and v856 and #v854 > 0 and v856 > 0 and v856 <= #v854 and #v854 == #v855;
    end;
    local function v866(v858) --[[ Line: 2970 ]] --[[ Name: setVCSOutput ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v115 (ref), v17 (ref), v122 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v115:error("setVCSOutput is deprecated");
            return;
        else
            local v859, v860, v861, v862 = pcall(function() --[[ Line: 2976 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v859 and v860 and v861 and v862 and #v860 > 0 and v862 > 0 and v862 <= #v860 and #v860 == #v861 then
                local v863 = 0;
                for v864, v865 in ipairs(v860) do
                    if v865 == v858 then
                        v863 = v864;
                    end;
                end;
                if v863 > 0 then
                    if v122() then
                        v115:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v860[v863], v861[v863]);
                    end;
                    v17:SetSpeakerDevice(v860[v863], v861[v863]);
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
    local function v871() --[[ Line: 3011 ]] --[[ Name: syncSoundOutputs ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v115 (ref), l_SoundService_0 (ref), v866 (copy), v122 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v115:error("syncSoundOutputs is deprecated");
            return;
        else
            local v867, v868, v869, v870 = pcall(function() --[[ Line: 3017 ]]
                -- upvalues: l_SoundService_0 (ref)
                return l_SoundService_0:GetOutputDevices();
            end);
            if v867 and v868 and v869 and v870 and #v868 > 0 and v870 > 0 and v870 <= #v868 and #v868 == #v869 then
                v866(v868[v870]);
                return;
            else
                if v122() then
                    v115:warning("Could not connect to Voice Chat Service to change Output Device");
                end;
                return;
            end;
        end;
    end;
    local function __(v872, v873) --[[ Line: 3032 ]] --[[ Name: SwitchOutputDevice ]]
        -- upvalues: l_SoundService_0 (ref), v115 (ref)
        l_SoundService_0:SetOutputDevice(v872, v873);
        v115:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v872, v873);
    end;
    local function v891(v875) --[[ Line: 3037 ]] --[[ Name: createDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v73 (ref), v63 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v121 (ref), l_default_2 (ref), l_SoundService_0 (ref), v115 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v142 (ref)
        local v876 = l_NewPage_0[v875 .. "DeviceIndex"] or 0;
        local v877 = l_NewPage_0[v875 .. "DeviceNames"] or {};
        local v878 = l_NewPage_0[v875 .. "DeviceGuids"] or {};
        local v879 = v875 == v73.Input and v63:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or v63:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_102 = l_NewPage_0;
        local v881 = v875 .. "DeviceFrame";
        local l_l_NewPage_0_103 = l_NewPage_0;
        local v883 = v875 .. "DeviceSelector";
        local v884, v885, v886 = v93:AddNewRow(l_NewPage_0, v879, "Selector", v877, v876);
        l_l_NewPage_0_102[v881] = v884;
        _ = v885;
        l_l_NewPage_0_103[v883] = v886;
        l_NewPage_0[v875 .. "DeviceFrame"].LayoutOrder = v875 == v73.Input and l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameInput or l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameOutput;
        l_NewPage_0[v875 .. "DeviceInfo"] = {
            Name = v876 > 0 and v877[v876] or nil, 
            Guid = v876 > 0 and v878[v876] or nil
        };
        l_NewPage_0[v875 .. "PrevDeviceName"] = l_NewPage_0[v875 .. "DeviceInfo"].Name;
        l_l_NewPage_0_102 = 0;
        v881 = v121();
        l_NewPage_0[v875 .. "DeviceSelector"].IndexChanged:connect(function(v887) --[[ Line: 3060 ]]
            -- upvalues: l_NewPage_0 (ref), v875 (copy), l_l_NewPage_0_102 (ref), v881 (copy), l_default_2 (ref), l_SoundService_0 (ref), v115 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v73 (ref), l_default_3 (ref), v142 (ref)
            if l_NewPage_0[v875 .. "DeviceInfo"].Name == l_NewPage_0[v875 .. "DeviceNames"][v887] and l_NewPage_0[v875 .. "DeviceInfo"].Guid == l_NewPage_0[v875 .. "DeviceGuids"][v887] then
                return;
            else
                local v888 = l_l_NewPage_0_102 + 1;
                l_l_NewPage_0_102 = v888;
                wait(v881);
                if v888 == l_l_NewPage_0_102 then
                    l_l_NewPage_0_102 = 0;
                    l_NewPage_0[v875 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v875 .. "DeviceNames"][v887], 
                        Guid = l_NewPage_0[v875 .. "DeviceGuids"][v887]
                    };
                    local l_Name_4 = l_NewPage_0[v875 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v875 .. "DeviceInfo"].Guid;
                    if l_NewPage_0.VoiceChatOptionsEnabled then
                        l_default_2:SwitchDevice(v875, l_Name_4, l_Guid_0);
                    else
                        l_SoundService_0:SetOutputDevice(l_Name_4, l_Guid_0);
                        v115:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_4, l_Guid_0);
                    end;
                    if l_GetFFlagEnableCrossExpVoice_0() then
                        v115:debug("[GameSettings] Changing {} device to {} {} ", v875, l_Name_4, l_Guid_0);
                        if v875 == v73.Input then
                            l_default_3:changeInputDevice(l_Name_4, l_Guid_0);
                        else
                            l_default_3:changeOutputDevice(l_Name_4, l_Guid_0);
                        end;
                    end;
                    v142(v875, l_NewPage_0[v875 .. "PrevDeviceName"], l_Name_4);
                    l_NewPage_0[v875 .. "PrevDeviceName"] = l_Name_4;
                end;
                return;
            end;
        end);
    end;
    local function __() --[[ Line: 3102 ]] --[[ Name: createBadgeVisibilityOptions ]]
        -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
        spawn(function() --[[ Line: 3103 ]]
            -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v892 = 2;
            if v95.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v892 = 1;
            end;
            local v893 = v63:FormatByKey("Feature.SettingsHub.Label.Show");
            local v894 = v63:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v895 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v63:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v896 = v63:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_104 = l_NewPage_0;
            local l_l_NewPage_0_105 = l_NewPage_0;
            local l_l_NewPage_0_106 = l_NewPage_0;
            local v900, v901, v902 = v93:AddNewRow(l_NewPage_0, v895, "Selector", {
                v894, 
                v893
            }, v892, nil, v896);
            l_l_NewPage_0_104.badgeVisibleRow = v900;
            l_l_NewPage_0_105.badgeVisibleFrame = v901;
            l_l_NewPage_0_106.badgeVisibleSelector = v902;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v903) --[[ Line: 3117 ]]
                -- upvalues: l_GameSettings_0 (ref), v95 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v903 == 2;
                v95.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v903 == 1);
            end);
        end);
    end;
    local function v915() --[[ Line: 3124 ]] --[[ Name: createChatModerationOptions ]]
        -- upvalues: l_NewPage_0 (copy), v93 (ref), v24 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_CorePackages_0 (ref), v103 (ref), v59 (ref), v142 (ref)
        local v905 = {
            title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView", 
            description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription", 
            on = "InGame.CommonUI.Label.On", 
            off = "InGame.CommonUI.Label.Off"
        };
        local l_l_NewPage_0_107 = l_NewPage_0;
        local l_l_NewPage_0_108 = l_NewPage_0;
        local v908, v909, v910 = v93:AddNewRow(l_NewPage_0, v24:Format(v905.title), "Selector", {
            v24:Format(v905.off), 
            v24:Format(v905.on)
        }, 1, nil, v24:Format(v905.description));
        l_l_NewPage_0_107.ChatModerationFrame = v908;
        _ = v909;
        l_l_NewPage_0_108.ChatModerationSelector = v910;
        l_NewPage_0.ChatModerationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ChatModerationFrame;
        l_NewPage_0.ChatModerationFrame.Visible = false;
        l_l_NewPage_0_108 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false);
        l_NewPage_0.ChatModerationDisposeEffect = v103.createEffect(function(v911) --[[ Line: 3148 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_108 (copy)
            l_NewPage_0.ChatModerationFrame.Visible = l_l_NewPage_0_108.getIsSettingVisible(v911);
            local v912 = l_l_NewPage_0_108.getIsSettingEnabled(v911) and 2 or 1;
            if l_NewPage_0.ChatModerationSelector:GetSelectedIndex() ~= v912 then
                l_NewPage_0.ChatModerationSelector:SetSelectionIndex(v912);
            end;
        end);
        l_NewPage_0.ChatModerationSelector.IndexChanged:connect(function(v913) --[[ Line: 3157 ]]
            -- upvalues: l_l_NewPage_0_108 (copy), v59 (ref), v142 (ref)
            local v914 = v913 == 2;
            l_l_NewPage_0_108.setIsSettingEnabled(v914);
            if v59 then
                v142("moderate_chat", not v914, v914);
            end;
        end);
        l_l_NewPage_0_108.initialize();
    end;
    local function v927() --[[ Line: 3171 ]] --[[ Name: createCameraDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v114 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v115 (ref), l_UserGameSettings_0 (ref), v142 (ref)
        local v916 = l_NewPage_0.CameraDeviceIndex or 1;
        local v917 = l_NewPage_0.CameraDeviceNames or {};
        local v918 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v114_0 = v114;
        local l_l_NewPage_0_109 = l_NewPage_0;
        local l_l_NewPage_0_110 = l_NewPage_0;
        local v922, v923, v924 = v93:AddNewRow(l_NewPage_0, l_v114_0, "Selector", v917, v916);
        l_l_NewPage_0_109.CameraDeviceFrame = v922;
        _ = v923;
        l_l_NewPage_0_110.CameraDeviceSelector = v924;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v916 > 0 and v917[v916] or nil, 
            Guid = v916 > 0 and v918[v916] or nil
        };
        l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v925) --[[ Line: 3188 ]]
            -- upvalues: l_NewPage_0 (ref), v115 (ref), l_UserGameSettings_0 (ref), v142 (ref)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v925] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v925] then
                return;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v925], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v925]
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
    local function v933(v928) --[[ Line: 3213 ]] --[[ Name: updateAudioDevices ]]
        -- upvalues: v73 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v122 (ref), v115 (ref), v891 (copy)
        local v929, v930, v931, v932 = pcall(function() --[[ Line: 3214 ]]
            -- upvalues: v928 (copy), v73 (ref), l_SoundService_0 (ref)
            if v928 == v73.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v929 and v930 and v931 and v932 and #v930 > 0 and v932 > 0 and v932 <= #v930 and #v930 == #v931 then
                if v931[1] == "" then
                    v930[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v930[1] .. ")";
                end;
                l_NewPage_0[v928 .. "DeviceNames"] = v930;
                l_NewPage_0[v928 .. "DeviceGuids"] = v931;
                l_NewPage_0[v928 .. "DeviceIndex"] = v932;
            else
                if v122() then
                    v115:warning("Errors in get {} device info", v928);
                end;
                l_NewPage_0[v928 .. "DeviceNames"] = {};
                l_NewPage_0[v928 .. "DeviceGuids"] = {};
                l_NewPage_0[v928 .. "DeviceIndex"] = 0;
            end;
        elseif v929 and v930 and v931 and v932 and #v930 > 0 and v932 > 0 and v932 <= #v930 and #v930 == #v931 then
            if v931[1] == "" then
                v930[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v930[1] .. ")";
            end;
            l_NewPage_0[v928 .. "DeviceNames"] = v930;
            l_NewPage_0[v928 .. "VCSDeviceNames"] = v930;
            l_NewPage_0[v928 .. "VCSDeviceGuids"] = v931;
            l_NewPage_0[v928 .. "DeviceGuids"] = v931;
            l_NewPage_0[v928 .. "DeviceIndex"] = v932;
        else
            if v122() then
                v115:warning("Errors in get {} device info", v928);
            end;
            l_NewPage_0[v928 .. "DeviceNames"] = {};
            l_NewPage_0[v928 .. "DeviceGuids"] = {};
            l_NewPage_0[v928 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v928 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v928 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v928 .. "DeviceSelector"] then
            v891(v928);
            return;
        else
            l_NewPage_0[v928 .. "DeviceSelector"]:UpdateOptions(v930);
            l_NewPage_0[v928 .. "DeviceSelector"]:SetSelectionIndex(v932);
            return;
        end;
    end;
    local function v943(v934) --[[ Line: 3269 ]] --[[ Name: updateVoiceChatDevices ]]
        -- upvalues: v73 (ref), v122 (ref), v115 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v17 (ref), v891 (copy)
        if v934 ~= v73.Input and v934 ~= v73.Output and v122() then
            v115:warning("{} is not supported in VoiceChat devices", v934);
        end;
        local v935, v936, v937, v938 = pcall(function() --[[ Line: 3276 ]]
            -- upvalues: v934 (copy), v73 (ref), l_SoundService_0 (ref)
            if v934 == v73.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v935 and v936 and v937 and v938 and #v936 > 0 and v938 > 0 and v938 <= #v936 and #v936 == #v937 then
                if v937[1] == "" then
                    v936[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v936[1] .. ")";
                end;
                l_NewPage_0[v934 .. "DeviceNames"] = v936;
                l_NewPage_0[v934 .. "DeviceGuids"] = v937;
                l_NewPage_0[v934 .. "DeviceIndex"] = v938;
            else
                if v122() then
                    if #v936 > 0 then
                        v115:warning("Errors in get {} device info success: {}", v934, v935);
                    else
                        v115:warning("Empty deviceNames list for {}", v934);
                    end;
                end;
                l_NewPage_0[v934 .. "DeviceNames"] = {};
                l_NewPage_0[v934 .. "DeviceGuids"] = {};
                l_NewPage_0[v934 .. "DeviceIndex"] = 0;
            end;
        else
            local v939, v940, v941, v942 = pcall(function() --[[ Line: 3313 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v935 and v939 and v936 and v937 and v938 and #v936 > 0 and v938 > 0 and v938 <= #v936 and #v936 == #v937 and v940 and v941 and v942 and #v940 > 0 and v942 > 0 and v942 <= #v940 and #v940 == #v941 then
                if v937[1] == "" then
                    v936[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v936[1] .. ")";
                end;
                l_NewPage_0[v934 .. "DeviceNames"] = v936;
                l_NewPage_0[v934 .. "VCSDeviceNames"] = v940;
                l_NewPage_0[v934 .. "VCSDeviceGuids"] = v941;
                l_NewPage_0[v934 .. "DeviceGuids"] = v937;
                l_NewPage_0[v934 .. "DeviceIndex"] = v938;
            else
                if v122() then
                    if #v936 > 0 then
                        v115:warning("Errors in get {} device info success: {} VCSSuccess: {}", v934, v935, v939);
                    else
                        v115:warning("Empty deviceNames list for {}", v934);
                    end;
                end;
                l_NewPage_0[v934 .. "DeviceNames"] = {};
                l_NewPage_0[v934 .. "DeviceGuids"] = {};
                l_NewPage_0[v934 .. "VCSDeviceNames"] = {};
                l_NewPage_0[v934 .. "VCSDeviceGuids"] = {};
                l_NewPage_0[v934 .. "DeviceIndex"] = 0;
            end;
        end;
        if not l_NewPage_0[v934 .. "DeviceSelector"] then
            v891(v934);
        else
            l_NewPage_0[v934 .. "DeviceSelector"]:UpdateOptions(v936);
            l_NewPage_0[v934 .. "DeviceSelector"]:SetSelectionIndex(v938);
        end;
        if l_NewPage_0[v934 .. "DeviceFrame"] then
            if #v936 > 0 then
                l_NewPage_0[v934 .. "DeviceFrame"].Visible = true;
                return;
            else
                l_NewPage_0[v934 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v950() --[[ Line: 3369 ]] --[[ Name: updateCameraDevices ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v113 (ref), l_UserGameSettings_0 (ref), l_NewPage_0 (copy), v927 (copy)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v945 = {};
        local v946 = {};
        local v947 = 1;
        table.insert(v945, v113);
        table.insert(v946, "{DefaultDeviceGuid}");
        for v948, v949 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v948 == l_UserGameSettings_0.DefaultCameraID then
                v947 = #v945 + 1;
            end;
            table.insert(v945, v949);
            table.insert(v946, v948);
        end;
        l_NewPage_0.CameraDeviceNames = v945;
        l_NewPage_0.CameraDeviceGuids = v946;
        l_NewPage_0.CameraDeviceIndex = 0;
        if not l_NewPage_0.CameraDeviceSelector then
            v927();
        else
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v945);
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v947);
    end;
    local v951 = nil;
    local v952 = nil;
    local function v953() --[[ Line: 3399 ]] --[[ Name: updateAudioOptions ]]
        -- upvalues: l_NewPage_0 (copy), v943 (copy), v73 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v933 (copy)
        if l_NewPage_0.VoiceChatOptionsEnabled then
            v943(v73.Input);
            v943(v73.Output);
            return;
        else
            if l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected() then
                v933(v73.Input);
            end;
            v933(v73.Output);
            return;
        end;
    end;
    local function __() --[[ Line: 3411 ]] --[[ Name: setupDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v951 (ref), l_NewPage_0 (copy), v953 (copy)
        if l_SoundService_0.DeviceListChanged then
            v951 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3413 ]]
                -- upvalues: l_NewPage_0 (ref), v953 (ref)
                if l_NewPage_0.PageOpen then
                    v953();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3421 ]] --[[ Name: setupVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v952 (ref), l_NewPage_0 (copy), v950 (copy)
        if l_VideoCaptureService_0.DevicesChanged then
            v952 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3423 ]]
                -- upvalues: l_NewPage_0 (ref), v950 (ref)
                if l_NewPage_0.PageOpen then
                    v950();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3431 ]] --[[ Name: teardownDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v951 (ref)
        if l_SoundService_0.DeviceListChanged and v951 then
            v951:Disconnect();
        end;
    end;
    local function __() --[[ Line: 3437 ]] --[[ Name: teardownVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v952 (ref)
        if l_VideoCaptureService_0.DevicesChanged and v952 then
            v952:Disconnect();
            v952 = nil;
        end;
    end;
    local function __() --[[ Line: 3445 ]] --[[ Name: checkVoiceChatOptions ]]
        -- upvalues: l_default_2 (ref), l_NewPage_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v871 (copy)
        if l_default_2:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                v871();
            end;
        end;
    end;
    local function __() --[[ Line: 3454 ]] --[[ Name: updateInputDeviceVisibility ]]
        -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
        local v959 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
        if l_NewPage_0[v73.Input .. "DeviceFrame"] then
            l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v959;
        end;
    end;
    local v961 = false;
    local v962 = nil;
    if v62 then
        v962 = false;
    end;
    local function v980() --[[ Line: 3467 ]] --[[ Name: createVoiceChatSelector ]]
        -- upvalues: v61 (ref), l_NewPage_0 (copy), v53 (ref), v24 (ref), l_default_2 (ref), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v62 (ref), v41 (ref), v40 (ref), v962 (ref), v961 (ref), v101 (ref), v56 (ref), l_GuiService_0 (ref)
        if v61 and l_NewPage_0.VoiceConnectDisconnectFrame and l_NewPage_0.VoiceConnectDisconnectSelector then
            return;
        else
            local v963 = "Voice Chat";
            local v964 = "Disconnected";
            local v965 = "Connected";
            if v53 then
                v963 = v24:Format("Feature.GameDetails.Label.VoiceChat");
                v964 = v24:Format("Feature.SettingsHub.Label.Disconnected");
                v965 = v24:Format("Feature.SettingsHub.Label.Connected");
            end;
            local v966 = l_default_2:VoiceChatEnded() and 1 or 2;
            local l_l_NewPage_0_111 = l_NewPage_0;
            local l_l_NewPage_0_112 = l_NewPage_0;
            local v969, v970, v971 = v93:AddNewRow(l_NewPage_0, v963, "Selector", {
                v964, 
                v965
            }, v966);
            l_l_NewPage_0_111.VoiceConnectDisconnectFrame = v969;
            _ = v970;
            l_l_NewPage_0_112.VoiceConnectDisconnectSelector = v971;
            l_NewPage_0.VoiceConnectDisconnectFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectDisconnectSelector;
            l_l_NewPage_0_111 = l_default_2:getService();
            if l_l_NewPage_0_111 and not v62 then
                l_l_NewPage_0_111.StateChanged:Connect(function(v972, v973) --[[ Line: 3492 ]]
                    -- upvalues: v61 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                    if v61 then
                        if v972 == v973 then
                            return;
                        elseif v973 == Enum.VoiceChatState.Joined and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                            return;
                        elseif (v973 == Enum.VoiceChatState.Ended or v973 == Enum.VoiceChatState.Failed or v973 == Enum.VoiceChatState.Idle) and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                            return;
                        end;
                    elseif v972 == v973 then
                        return;
                    elseif v973 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                        return;
                    elseif l_default_2:VoiceChatEnded() then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    end;
                end);
            end;
            l_l_NewPage_0_112 = v966;
            v969 = v41();
            v970 = v40() and v969 > 0;
            v971 = function(v974) --[[ Line: 3526 ]]
                -- upvalues: l_l_NewPage_0_112 (ref), v62 (ref), v962 (ref), l_default_2 (ref), v961 (ref), l_NewPage_0 (ref)
                if v974 == l_l_NewPage_0_112 then
                    return;
                else
                    l_l_NewPage_0_112 = v974;
                    if v62 and v962 then
                        return;
                    else
                        l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(v974 == 2));
                        if v974 == 2 then
                            l_default_2:JoinVoice();
                        elseif not l_default_2:VoiceChatEnded() then
                            l_default_2:Leave();
                        end;
                        if v961 then
                            task.spawn(function() --[[ Line: 3551 ]]
                                -- upvalues: v974 (copy), l_NewPage_0 (ref)
                                task.wait(0.5);
                                if v974 ~= 1 then
                                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
            end;
            l_NewPage_0.VoiceConnectDisconnectSelector.IndexChanged:connect(if v970 then v101(v969, v971) else v971);
            if v56 then
                l_NewPage_0.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(__, v976, v977) --[[ Line: 3565 ]]
                    -- upvalues: v963 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref)
                    if v977 and v976 and v976.Parent and v976.Parent.Name == v963 .. "Frame" and v977.Name == "ImageButton" and l_NewPage_0.Active then
                        l_GuiService_0.SelectedCoreObject = v976;
                    end;
                end);
            end;
            l_default_2:subscribe("OnStateChanged", function(__, v979) --[[ Line: 3572 ]]
                -- upvalues: v62 (ref), v962 (ref), l_NewPage_0 (ref)
                if v62 then
                    v962 = true;
                    if v979 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    end;
                end;
                if v979 == Enum.VoiceChatState.Failed then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                end;
                if v62 then
                    v962 = false;
                end;
            end);
            l_default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 3589 ]]
                -- upvalues: v961 (ref), v62 (ref), v962 (ref), l_NewPage_0 (ref)
                task.spawn(function() --[[ Line: 3590 ]]
                    -- upvalues: v961 (ref), v62 (ref), v962 (ref), l_NewPage_0 (ref)
                    task.wait(0.5);
                    v961 = true;
                    if v62 then
                        v962 = true;
                    end;
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    if v62 then
                        v962 = false;
                    end;
                end);
            end);
            return;
        end;
    end;
    local function v999() --[[ Line: 3604 ]] --[[ Name: createVoiceConnectDisconnect ]]
        -- upvalues: l_default_2 (ref), v24 (ref), v41 (ref), v93 (ref), v101 (ref), l_NewPage_0 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref)
        if l_default_2:IsSeamlessVoice() and not l_default_2.isShowingFTUX then
            local v981 = nil;
            local v982 = nil;
            local v983 = nil;
            local v984 = nil;
            local v985 = v24:Format("Feature.GameDetails.Label.VoiceChat");
            local v986 = v24:Format("Feature.SettingsHub.Label.Connect");
            local v987 = v24:Format("Feature.SettingsHub.Label.Disconnect");
            local v988 = v41();
            local v989 = v988 > 0;
            local function v994() --[[ Line: 3614 ]]
                -- upvalues: l_default_2 (ref)
                if l_default_2:getService() then
                    local v990 = nil;
                    do
                        local l_v990_0 = v990;
                        l_v990_0 = l_default_2:getService().StateChanged:Connect(function(__, v993) --[[ Line: 3618 ]]
                            -- upvalues: l_default_2 (ref), l_v990_0 (ref)
                            if v993 == Enum.VoiceChatState.Joined then
                                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                                l_v990_0:Disconnect();
                            end;
                        end);
                    end;
                else
                    l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(false));
                end;
                l_default_2:JoinVoice();
            end;
            local function v995() --[[ Line: 3636 ]]
                -- upvalues: l_default_2 (ref)
                l_default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                l_default_2:Leave();
            end;
            local v996, v997, v998 = v93:MakeStyledButton("VoiceConnectButton", v986, UDim2.new(1, 0, 1, -20), if v989 then v101(v988, v994) else v994, l_NewPage_0);
            voiceConnectSetRowRef = v998;
            v981 = v996;
            v982 = v997;
            v996, v997, v998 = v93:MakeStyledButton("VoiceDisconnectButton", v987, UDim2.new(1, 0, 1, -20), if v989 then v101(v988, v995) else v995, l_NewPage_0);
            voiceDisconnectSetRowRef = v998;
            v983 = v996;
            v984 = v997;
            v981.Size = UDim2.new(0.6, 0, 0, 40);
            v981.Position = UDim2.new(0.4, 0, 0.5, 0);
            v981.AnchorPoint = Vector2.new(0, 0.5);
            v981.ZIndex = 2;
            v981.Selectable = true;
            v982.ZIndex = 2;
            v983.Size = UDim2.new(0.6, 0, 0, 40);
            v983.Position = UDim2.new(0.4, 0, 0.5, 0);
            v983.AnchorPoint = Vector2.new(0, 0.5);
            v983.ZIndex = 2;
            v983.Selectable = true;
            v984.ZIndex = 2;
            v996 = v93:AddNewRowObject(l_NewPage_0, v985, v981, nil, true);
            v997 = v93:AddNewRowObject(l_NewPage_0, v985, v983, nil, true);
            l_NewPage_0.VoiceConnectFrame = v996;
            l_NewPage_0.VoiceDisconnectFrame = v997;
            v996.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectFrame;
            v997.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceDisconnectFrame;
            voiceConnectSetRowRef(v996);
            voiceDisconnectSetRowRef(v997);
            if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_isVoiceFocused_0() then
                v996.Visible = false;
                v997.Visible = false;
                return;
            elseif l_default_2:ShouldShowJoinVoice() then
                v996.Visible = true;
                v997.Visible = false;
                return;
            else
                v996.Visible = false;
                v997.Visible = true;
            end;
        end;
    end;
    local function v1025() --[[ Line: 3698 ]] --[[ Name: createVRComfortSettingOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_1 = Enum.VRComfortSetting:GetEnumItems();
        local v1001 = {
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
        local v1002 = {};
        for v1003, v1004 in ipairs(l_EnumItems_1) do
            v1002[v1003] = v24:Format(v1001[tostring(v1004)]);
        end;
        local v1005 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
        local l_l_NewPage_0_113 = l_NewPage_0;
        local l_l_NewPage_0_114 = l_NewPage_0;
        local l_l_NewPage_0_115 = l_NewPage_0;
        local v1009, v1010, v1011 = v93:AddNewRow(l_NewPage_0, v24:Format(v1001.title), "Selector", v1002, v1005, nil, v24:Format(v1001.description));
        l_l_NewPage_0_113.VRComfortSettingFrame = v1009;
        l_l_NewPage_0_114.VRComfortSettingLabel = v1010;
        l_l_NewPage_0_115.VRComfortSettingSelector = v1011;
        l_NewPage_0.VRComfortSettingFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRComfortSettingFrame;
        l_l_NewPage_0_113 = l_GameSettings_0.VignetteEnabled and 1 or 2;
        l_l_NewPage_0_114 = l_NewPage_0;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1009 = l_NewPage_0;
        local v1012;
        v1010, v1011, v1012 = v93:AddNewRow(l_NewPage_0, v24:Format(v1001.vignetteEnabled), "Selector", {
            v24:Format(v1001.on), 
            v24:Format(v1001.off)
        }, l_l_NewPage_0_113);
        l_l_NewPage_0_114.VRVignetteEnabledFrame = v1010;
        l_l_NewPage_0_115.VRVignetteEnabledLabel = v1011;
        v1009.VRVignetteEnabledSelector = v1012;
        l_NewPage_0.VRVignetteEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRVignetteEnabledFrame;
        l_l_NewPage_0_114 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1009 = l_NewPage_0;
        v1010 = l_NewPage_0;
        local v1013;
        v1011, v1012, v1013 = v93:AddNewRow(l_NewPage_0, v24:Format(v1001.steppedRotationEnabled), "Selector", {
            v24:Format(v1001.on), 
            v24:Format(v1001.off)
        }, l_l_NewPage_0_114);
        l_l_NewPage_0_115.VRSteppedRotationEnabledFrame = v1011;
        v1009.VRSteppedRotationEnabledLabel = v1012;
        v1010.VRSteppedRotationEnabledSelector = v1013;
        l_NewPage_0.VRSteppedRotationEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSteppedRotationEnabledFrame;
        l_l_NewPage_0_115 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
        v1009 = l_NewPage_0;
        v1010 = l_NewPage_0;
        v1011 = l_NewPage_0;
        local v1014;
        v1012, v1013, v1014 = v93:AddNewRow(l_NewPage_0, v24:Format(v1001.thirdPersonFixedCamEnabled), "Selector", {
            v24:Format(v1001.on), 
            v24:Format(v1001.off)
        }, l_l_NewPage_0_115);
        v1009.VRThirdPersonFixedCamEnabledFrame = v1012;
        v1010.VRThirdPersonFixedCamEnabledLabel = v1013;
        v1011.VRThirdPersonFixedCamEnabledSelector = v1014;
        l_NewPage_0.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRThirdPersonFixedCamEnabledFrame;
        v1009 = function(v1015) --[[ Line: 3764 ]]
            -- upvalues: l_NewPage_0 (ref)
            if v1015 == Enum.VRComfortSetting.Custom then
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
        l_NewPage_0.VRComfortSettingSelector.IndexChanged:connect(function(v1016) --[[ Line: 3788 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), v1009 (copy)
            local v1017 = l_EnumItems_1[v1016];
            l_GameSettings_0.VRComfortSetting = v1017;
            v1009(v1017);
        end);
        v1009(l_GameSettings_0.VRComfortSetting);
        l_NewPage_0.VRVignetteEnabledSelector.IndexChanged:connect(function(v1018) --[[ Line: 3795 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VignetteEnabledCustomOption = v1018 == 1;
            end;
        end);
        l_NewPage_0.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(v1019) --[[ Line: 3801 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRSmoothRotationEnabledCustomOption = v1019 == 2;
            end;
        end);
        l_NewPage_0.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(v1020) --[[ Line: 3807 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRThirdPersonFollowCamEnabledCustomOption = v1020 == 2;
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ Line: 3813 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1021 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
            if l_NewPage_0.VRComfortSettingSelector:GetSelectedIndex() ~= v1021 then
                l_NewPage_0.VRComfortSettingSelector:SetSelectionIndex(v1021);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ Line: 3820 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1022 = l_GameSettings_0.VignetteEnabled and 1 or 2;
            if l_NewPage_0.VRVignetteEnabledSelector:GetSelectedIndex() ~= v1022 then
                l_NewPage_0.VRVignetteEnabledSelector:SetSelectionIndex(v1022);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ Line: 3827 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1023 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
            if l_NewPage_0.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= v1023 then
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetSelectionIndex(v1023);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 3834 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1024 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
            if l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= v1024 then
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v1024);
            end;
        end);
    end;
    local function v1040() --[[ Line: 3842 ]] --[[ Name: createVRSafetyBubbleModeOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_2 = Enum.VRSafetyBubbleMode:GetEnumItems();
        local v1027 = {
            title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
            description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
            ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
            ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
            ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
        };
        local v1028 = {};
        for v1029, v1030 in ipairs(l_EnumItems_2) do
            v1028[v1029] = v24:Format(v1027[tostring(v1030)]);
        end;
        local v1031 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
        task.defer(function() --[[ Line: 3858 ]]
            -- upvalues: l_NewPage_0 (ref), v93 (ref), v24 (ref), v1027 (copy), v1028 (copy), v1031 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_EnumItems_2 (copy), l_GameSettings_0 (ref)
            local l_l_NewPage_0_116 = l_NewPage_0;
            local l_l_NewPage_0_117 = l_NewPage_0;
            local l_l_NewPage_0_118 = l_NewPage_0;
            local v1035, v1036, v1037 = v93:AddNewRow(l_NewPage_0, v24:Format(v1027.title), "DropDown", v1028, v1031, nil, v24:Format(v1027.description));
            l_l_NewPage_0_116.VRSafetyBubbleModeFrame = v1035;
            l_l_NewPage_0_117.VRSafetyBubbleModeLabel = v1036;
            l_l_NewPage_0_118.VRSafetyBubbleModeSelector = v1037;
            l_NewPage_0.VRSafetyBubbleModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSafetyBubbleModeFrame;
            l_NewPage_0.VRSafetyBubbleModeSelector.IndexChanged:connect(function(v1038) --[[ Line: 3871 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref)
                l_GameSettings_0.VRSafetyBubbleMode = l_EnumItems_2[v1038];
            end);
            l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 3876 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
                local v1039 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
                if l_NewPage_0.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= v1039 then
                    l_NewPage_0.VRSafetyBubbleModeSelector:SetSelectionIndex(v1039);
                end;
            end);
        end);
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    local v1041 = nil;
    local v1042 = nil;
    local v1043 = nil;
    if game:GetEngineFeature("VoiceChatSupported") and (l_GetFFlagEnableVrVoiceConnectDisconnect_0() or not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        spawn(function() --[[ Line: 3890 ]]
            -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (ref), v54 (ref), l_default_2 (ref), v980 (copy), l_isVoiceFocused_0 (ref), l_NewPage_0 (copy), l_observeIsVoiceFocused_0 (ref), v17 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v871 (copy), v61 (ref), v123 (ref), v21 (ref), v999 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v122 (ref), v115 (ref)
            if l_GetFFlagEnableVoiceUxUpdates_0() and (not v54 and l_default_2:EligibleForFaeUpsell() or l_default_2:IsSeamlessVoice()) and l_default_2:verifyUniverseAndPlaceCanUseVoice() then
                v980();
                if l_isVoiceFocused_0() and l_NewPage_0.VoiceConnectDisconnectFrame then
                    l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                end;
                l_observeIsVoiceFocused_0(function(v1044) --[[ Line: 3900 ]]
                    -- upvalues: l_NewPage_0 (ref)
                    if v1044 then
                        if l_NewPage_0.VoiceConnectDisconnectFrame then
                            l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                            return;
                        end;
                    elseif l_NewPage_0.VoiceConnectDisconnectFrame then
                        l_NewPage_0.VoiceConnectDisconnectFrame.Visible = true;
                    end;
                end);
            end;
            l_default_2:asyncInit():andThen(function() --[[ Line: 3913 ]]
                -- upvalues: v17 (ref), l_default_2 (ref), l_NewPage_0 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v871 (ref), v61 (ref), v980 (ref), v123 (ref), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v21 (ref), v999 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref), l_observeIsVoiceFocused_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
                v17 = l_default_2:getService();
                if l_default_2:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                        v871();
                    end;
                end;
                if v61 and l_default_2:UserVoiceEnabled() then
                    v980();
                end;
                if not v123() then
                    l_default_2:CheckAndShowNotAudiblePrompt();
                end;
                if l_GetFFlagEnableVoiceUxUpdates_0() then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    return;
                else
                    local v1045 = false;
                    if v21() then
                        v999();
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                            v1045 = l_isVoiceFocused_0();
                            l_observeIsVoiceFocused_0(function(v1046) --[[ Line: 3938 ]]
                                -- upvalues: v1045 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                                v1045 = v1046;
                                if v1046 then
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
                            l_NewPage_0.VoiceDisconnectFrame.Visible = not v1045;
                        else
                            l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                        end;
                    end;
                    l_default_2.showVoiceUI.Event:Connect(function() --[[ Line: 3971 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1045 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1045 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = true;
                            local v1047 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v1047;
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
                    l_default_2.hideVoiceUI.Event:Connect(function() --[[ Line: 3989 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1045 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1045 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = false;
                            local v1048 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v1048;
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
            end):catch(function() --[[ Line: 4009 ]]
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
        v1041 = l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 4022 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
            local v1049 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v1049;
            end;
        end);
        v1042 = l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 4025 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v73 (ref)
            local v1050 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v73.Input .. "DeviceFrame"] then
                l_NewPage_0[v73.Input .. "DeviceFrame"].Visible = v1050;
            end;
        end);
        v1043 = function() --[[ Line: 4028 ]]
            -- upvalues: v1041 (ref), v1042 (ref)
            if v1041 then
                v1041:Disconnect();
                v1041 = nil;
            end;
            if v1042 then
                v1042:Disconnect();
                v1042 = nil;
            end;
        end;
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v1051 = nil;
    local function __() --[[ Line: 4042 ]]
        -- upvalues: v1051 (ref)
        if v1051 then
            v1051:disconnect();
            v1051 = nil;
        end;
    end;
    if l_GetFFlagSelfViewCameraSettings_0() and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        local function v1054(v1053) --[[ Line: 4050 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.VideoOptionsEnabled = v1053.hasCameraPermissions;
        end;
        if v34() then
            if v27() then
                v26(v1054, {
                    l_default_0.Permissions.CAMERA_ACCESS
                }, true);
                if v1051 then
                    v1051:disconnect();
                end;
                v1051 = v33:connect(function() --[[ Line: 4067 ]]
                    -- upvalues: l_NewPage_0 (copy), v950 (copy), l_VideoCaptureService_0 (ref), v952 (ref)
                    l_NewPage_0.VideoOptionsEnabled = true;
                    v950();
                    if l_VideoCaptureService_0.DevicesChanged then
                        v952 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3423 ]]
                            -- upvalues: l_NewPage_0 (ref), v950 (ref)
                            if l_NewPage_0.PageOpen then
                                v950();
                            end;
                        end);
                    end;
                end);
            end;
        else
            v26(v1054, nil, nil, "GameSettings.createDeviceOptions");
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v452(not v105 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
    end;
    local function __() --[[ Line: 4086 ]]
        -- upvalues: l_GameSettings_0 (ref), v792 (copy)
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v792();
            return;
        else
            local v1055 = nil;
            v1055 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4092 ]]
                -- upvalues: l_GameSettings_0 (ref), v1055 (ref), v792 (ref)
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v1055 then
                        v1055:disconnect();
                    end;
                    v792();
                end;
            end);
            return;
        end;
    end;
    if l_UserInputService_0.MouseEnabled then
        v775();
    elseif l_UserInputService_0.GamepadEnabled then
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v792();
        else
            local v1057 = nil;
            do
                local l_v1057_0 = v1057;
                l_v1057_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4092 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1057_0 (ref), v792 (copy)
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v1057_0 then
                            l_v1057_0:disconnect();
                        end;
                        v792();
                    end;
                end);
            end;
        end;
    else
        local v1059 = nil;
        do
            local l_v1059_0 = v1059;
            l_v1059_0 = l_UserInputService_0.GamepadConnected:connect(function() --[[ Line: 4110 ]]
                -- upvalues: l_v1059_0 (ref), l_GameSettings_0 (ref), v792 (copy)
                if l_v1059_0 then
                    l_v1059_0:disconnect();
                end;
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    v792();
                    return;
                else
                    local v1061 = nil;
                    v1061 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4092 ]]
                        -- upvalues: l_GameSettings_0 (ref), v1061 (ref), v792 (ref)
                        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                            if v1061 then
                                v1061:disconnect();
                            end;
                            v792();
                        end;
                    end);
                    return;
                end;
            end);
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        if l_GameSettings_0.IsUsingCameraYInverted then
            v742();
        else
            local v1062 = nil;
            do
                local l_v1062_0 = v1062;
                l_v1062_0 = l_GameSettings_0.Changed:connect(function(v1064) --[[ Line: 4124 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1062_0 (ref), v742 (copy)
                    if v1064 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                        l_v1062_0:disconnect();
                        v742();
                    end;
                end);
            end;
        end;
    end;
    if l_isInExperienceUIVREnabled_0 then
        if l_isSpatial_0() then
            v1025();
            v1040();
        else
            v452(not v105 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
            if l_GameSettings_0.IsUsingCameraYInverted then
                v742();
            else
                local v1065 = nil;
                do
                    local l_v1065_0 = v1065;
                    l_v1065_0 = l_GameSettings_0.Changed:connect(function(v1067) --[[ Line: 4153 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v1065_0 (ref), v742 (copy)
                        if v1067 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                            l_v1065_0:disconnect();
                            v742();
                        end;
                    end);
                end;
            end;
            v222();
            v251();
        end;
    end;
    v713();
    if v67 then
        v723();
    end;
    v733();
    v208();
    if v47 and v48() then
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
        v804();
    end;
    if v47 and l_FFlagBadgeVisibilitySettingEnabled_0 then
        spawn(function() --[[ Line: 3103 ]]
            -- upvalues: v95 (ref), l_LocalPlayer_0 (ref), v63 (ref), v136 (ref), l_NewPage_0 (copy), v93 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v1068 = 2;
            if v95.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v1068 = 1;
            end;
            local v1069 = v63:FormatByKey("Feature.SettingsHub.Label.Show");
            local v1070 = v63:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v1071 = if v136 then v63:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v63:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v1072 = v63:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_119 = l_NewPage_0;
            local l_l_NewPage_0_120 = l_NewPage_0;
            local l_l_NewPage_0_121 = l_NewPage_0;
            local v1076, v1077, v1078 = v93:AddNewRow(l_NewPage_0, v1071, "Selector", {
                v1070, 
                v1069
            }, v1068, nil, v1072);
            l_l_NewPage_0_119.badgeVisibleRow = v1076;
            l_l_NewPage_0_120.badgeVisibleFrame = v1077;
            l_l_NewPage_0_121.badgeVisibleSelector = v1078;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v1079) --[[ Line: 3117 ]]
                -- upvalues: l_GameSettings_0 (ref), v95 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v1079 == 2;
                v95.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v1079 == 1);
            end);
        end);
    end;
    if l_FFlagEnableModerateChatRemoteEvent_0 then
        v915();
    end;
    v817();
    v96(l_RunService_0:IsStudio(), l_LocalPlayer_0, v95):andThen(function(v1080) --[[ Line: 4216 ]]
        -- upvalues: v846 (copy)
        if v1080 then
            v846();
        end;
    end):catch(function(v1081) --[[ Line: 4221 ]]
        warn(v1081);
    end);
    v157 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v1083, __ in pairs(v158) do
            v1083.Visible = not l_VREnabled_3;
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
    local v1085 = l_Migration_0.uiblox["icons/common/settings"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v1085.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v102.Font[v1085.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __() --[[ Line: 4290 ]] --[[ Name: staticFeedbackEntryPointChecksPassed ]]
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
    l_NewPage_0.OpenSettingsPage = function() --[[ Line: 4306 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v953 (copy), l_SoundService_0 (ref), v951 (ref), l_GameSettings_0 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), v950 (copy), l_VideoCaptureService_0 (ref), v952 (ref), v853 (copy), v20 (ref), v77 (ref), v97 (ref), v76 (ref), l_FFlagIEMFocusNavToButtons_0 (ref), v155 (ref)
        l_NewPage_0.PageOpen = true;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            v953();
            if l_SoundService_0.DeviceListChanged then
                v951 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3413 ]]
                    -- upvalues: l_NewPage_0 (ref), v953 (ref)
                    if l_NewPage_0.PageOpen then
                        v953();
                    end;
                end);
            end;
            l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
            if l_GetFFlagSelfViewCameraSettings_0() and l_NewPage_0.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
                v950();
                if l_VideoCaptureService_0.DevicesChanged then
                    v952 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3423 ]]
                        -- upvalues: l_NewPage_0 (ref), v950 (ref)
                        if l_NewPage_0.PageOpen then
                            v950();
                        end;
                    end);
                end;
            end;
            v853();
            if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and l_NewPage_0.toggleFeedbackModeButton and l_NewPage_0.toggleFeedbackModeText then
                local l_l_NewPage_0_122 = l_NewPage_0;
                local v1088 = false;
                if v20 ~= nil then
                    v1088 = v20:CanEnterCaptureMode();
                end;
                l_l_NewPage_0_122.FeedbackEntryPointEnabled = v1088;
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
    l_NewPage_0.CloseSettingsPage = function() --[[ Line: 4359 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_SoundService_0 (ref), v951 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v1043 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), l_VideoCaptureService_0 (ref), v952 (ref), v34 (ref), v1051 (ref), l_default_2 (ref)
        l_NewPage_0.PageOpen = false;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if l_SoundService_0.DeviceListChanged and v951 then
                v951:Disconnect();
            end;
            if l_GetFFlagEnableCrossExpVoice_0() and v1043 then
                v1043();
            end;
            if l_GetFFlagSelfViewCameraSettings_0() then
                if game:GetEngineFeature("VideoCaptureService") and l_VideoCaptureService_0.DevicesChanged and v952 then
                    v952:Disconnect();
                    v952 = nil;
                end;
                if v34() and v1051 then
                    v1051:disconnect();
                    v1051 = nil;
                end;
            end;
            if game:GetEngineFeature("VoiceChatSupported") and l_NewPage_0.VoiceChatOptionsEnabled and l_NewPage_0.startVolume ~= nil and l_NewPage_0.startVolume > 0 then
                l_default_2:CheckAndShowNotAudiblePrompt();
            end;
            return;
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function() --[[ Line: 4394 ]] --[[ Name: isLangaugeSelectionDropdownEnabled ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v1089 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v1089) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v1091) --[[ Line: 4417 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v133 (ref), v134 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v142 (ref), v697 (copy), v84 (ref), v86 (ref), v85 (ref), v702 (copy), l_game_EngineFeature_0 (ref), v89 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref), v88 (ref), v91 (ref), l_RunService_0 (ref), v130 (ref), v105 (ref), v474 (copy)
        l_NewPage_0.HubRef = v1091;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if isLangaugeSelectionDropdownEnabled() then
                if v133() then
                    v134(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v142);
                else
                    v697();
                end;
            end;
            if game:GetEngineFeature("EnableTCSChatTranslation") and v84() then
                if v86() then
                    local v1092 = v85();
                    if not v702(v1092).ChatTranslationEnabled then
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
                            pcall(function() --[[ Line: 4453 ]]
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