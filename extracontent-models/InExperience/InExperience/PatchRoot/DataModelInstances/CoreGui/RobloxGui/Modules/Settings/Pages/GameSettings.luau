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
local v63 = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false);
local v64 = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false);
local v65 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v68 = require(l_RobloxGui_0.Modules.Settings.Resources.GameSettingsConstants);
local v69 = l_GetFFlagEnableCrossExpVoiceVolumeIXPCheck_0() and l_default_1 and l_default_1.getHasPartyVoiceVolume();
local l_Constants_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v71 = {
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
local v72 = {
    DevComputerMovementMode = true, 
    DevComputerCameraMode = true, 
    DevEnableMouseLock = true
};
local v73 = {
    DevTouchMovementMode = true, 
    DevTouchCameraMode = true
};
local v74 = {
    DEFAULT_FOLLOW = "Default (Follow)", 
    DEFAULT_CLASSIC = "Default (Classic)"
};
local v75 = {
    Input = "Input", 
    Output = "Output"
};
local v76 = {
    DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)", 
    DEFAULT_KEYBOARD = "Default (Keyboard)", 
    TAP_TO_MOVE = "Tap to Move", 
    CLICK_TO_MOVE = "Click to Move"
};
local v77 = v65:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick");
local v78 = v65:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable");
local v79 = v65:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText");
local v80 = {
    On = 1, 
    Off = 2
};
local function __() --[[ Line: 165 ]] --[[ Name: getDefaultCameraMode ]]
    -- upvalues: l_UserInputService_0 (copy), v74 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v74.DEFAULT_FOLLOW;
    else
        return v74.DEFAULT_CLASSIC;
    end;
end;
local function __() --[[ Line: 174 ]] --[[ Name: getDefaultMovementMode ]]
    -- upvalues: l_UserInputService_0 (copy), v65 (copy), l_Constants_0 (copy), v76 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v65:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey);
    else
        return v76.DEFAULT_KEYBOARD;
    end;
end;
local function __() --[[ Line: 183 ]] --[[ Name: getDefaultSelectToMove ]]
    -- upvalues: l_UserInputService_0 (copy), v76 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v76.TAP_TO_MOVE;
    else
        return v76.CLICK_TO_MOVE;
    end;
end;
local l_SETTINGS_MENU_LAYOUT_ORDER_0 = v68.SETTINGS_MENU_LAYOUT_ORDER;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v86 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationSettingEnabled);
local v87 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationLayerName);
local v88 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled);
local v89 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationWaitForIXP);
local v90 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationForceSetting);
local v91 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationNewDefaults);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v93 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer);
local l_game_EngineFeature_1 = game:GetEngineFeature("GameBasicSettingsFramerateCap");
local v95 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v96 = require(l_RobloxGui_0.Modules.CoreUtility);
local v97 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v98 = require(l_RobloxGui_0.Modules.Common.GetHasGuiHidingPermission);
local v99 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v100 = require(l_CorePackages_0.Packages.Cryo);
local v101 = require(script.Parent.Parent.GfxReset);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v103 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall);
local v104 = require(l_CorePackages_0.Packages.BuilderIcons);
local v105 = require(l_CorePackages_0.Packages.Signals);
local l_Migration_0 = v104.Migration;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub");
local v107 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local __ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v111 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local l_default_2 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v115 = v65:FormatByKey("Feature.SettingsHub.Video.SystemDefault");
local v116 = v65:FormatByKey("Feature.SettingsHub.Video.VideoCamera");
local v117 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1);
local l_game_FastInt_0 = game:GetFastInt("RomarkStartWithGraphicQualityLevel");
local v119 = not v111:IsSubjectToChinaPolicies();
local v120 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v120 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v120 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
local v121 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v121 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v122 = if l_isInExperienceUIVREnabled_0 then (v121 or v120 or l_isSpatial_0()) and v119 else (v121 or v120) and v119;
local v123 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay);
local v124 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v125 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v126 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics);
local v127 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent);
local v128 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false);
local v129 = game:DefineFastFlag("UserShowGuiHideToggles", false);
local v130 = game:DefineFastFlag("UserFreecamGuiDestabilization", false);
local v131 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false);
local v132 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false);
local v133 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false);
local v134 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false);
local v135 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher);
local v136 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer);
local v137 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer);
local v138 = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false);
local function v144(v139, v140, v141, v142) --[[ Line: 304 ]] --[[ Name: reportSettingsChangeForAnalytics ]]
    -- upvalues: v126 (copy), l_UserInputService_0 (copy), v100 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    if not v126() or v140 == v141 or v140 == nil or v141 == nil then
        return;
    else
        local v143 = {
            universe_id = tostring(game.GameId), 
            name = v139, 
            old_value = tostring(v140), 
            new_value = tostring(v141), 
            has_touch = l_UserInputService_0.TouchEnabled, 
            has_mouse = l_UserInputService_0.MouseEnabled, 
            has_gamepad = l_UserInputService_0.GamepadEnabled
        };
        if v142 then
            v143 = v100.Dictionary.join(v143, v142);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsExplicitSettingsChangeName, v143);
        return;
    end;
end;
local function v149() --[[ Line: 335 ]] --[[ Name: reportSettingsForAnalytics ]]
    -- upvalues: l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_game_EngineFeature_1 (copy), v50 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    local v145 = {};
    local v146 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
    if v146 then
        v145.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
    else
        v145.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
    end;
    if v146 then
        v145.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
    else
        v145.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
    end;
    if l_UserInputService_0.MouseEnabled then
        v145.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
    end;
    if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
        local l_GamepadCameraSensitivity_0 = l_GameSettings_0.GamepadCameraSensitivity;
        v145.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", l_GamepadCameraSensitivity_0))));
    end;
    if l_UserInputService_0.MouseEnabled then
        local l_X_0 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        v145.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", l_X_0))));
    end;
    v145.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
    v145.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
    v145.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
    v145.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
    if l_game_EngineFeature_1 then
        v145.framerate_cap = tostring(l_GameSettings_0.FramerateCap);
    end;
    v145.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
    v145.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
    v145.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
    v145.reduced_motion = tostring(l_GameSettings_0.ReducedMotion);
    v145.preferred_transparency = tostring(l_GameSettings_0.PreferredTransparency);
    v145.preferred_text_size = tostring(l_GameSettings_0.PreferredTextSize);
    v145.ui_navigation_key_bind_enabled = tostring(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v145.universeid = tostring(game.GameId);
    if v50() then
        v145.player_names_enabled = tostring(l_GameSettings_0.PlayerNamesEnabled);
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v145);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v150 = game:DefineFastFlag("IGMEnableGFXReset", false);
local function v157(v151) --[[ Line: 401 ]] --[[ Name: getLastValueChangerFrame ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy)
    if not l_FFlagIEMFocusNavToButtons_0 then
        return;
    else
        local v152 = nil;
        local v153 = nil;
        for __, v155 in pairs(v151:GetRows()) do
            local l_SelectionFrame_0 = v155.SelectionFrame;
            if not v152 or v152 <= l_SelectionFrame_0.LayoutOrder then
                v152 = l_SelectionFrame_0.LayoutOrder;
                v153 = v151:getValueChangerFrame(v155.ValueChanger);
            end;
        end;
        return v153;
    end;
end;
return ((function() --[[ Line: 420 ]] --[[ Name: Initialize ]]
    -- upvalues: v150 (copy), v101 (copy), l_RobloxGui_0 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v95 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (copy), l_GuiService_0 (copy), v127 (copy), v126 (copy), v144 (copy), v149 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_game_EngineFeature_1 (copy), v65 (copy), l_game_FastInt_0 (copy), v71 (copy), v138 (copy), v51 (copy), v80 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v99 (copy), v57 (copy), v59 (copy), v44 (copy), v121 (copy), v120 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_LocalPlayer_0 (copy), v96 (copy), v74 (copy), v40 (copy), l_getAppFeaturePolicies_0 (copy), v76 (copy), v77 (copy), v73 (copy), v72 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v134 (copy), l_SafetyService_0 (copy), v20 (ref), v133 (copy), v79 (copy), v128 (copy), v117 (copy), l_Players_0 (copy), v78 (copy), l_RunService_0 (copy), v89 (copy), l_IXPServiceWrapper_0 (copy), v91 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), l_default_3 (copy), v62 (copy), v24 (ref), l_CorePackages_0 (copy), l_ContextActionService_0 (copy), v131 (copy), v97 (copy), v130 (copy), v129 (copy), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (ref), v124 (copy), l_SoundService_0 (copy), v75 (copy), v123 (copy), l_default_2 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v105 (copy), v61 (copy), v116 (copy), l_UserGameSettings_0 (copy), l_VideoCaptureService_0 (copy), v115 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v64 (copy), v63 (copy), v55 (copy), v43 (copy), v42 (copy), v103 (copy), v58 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_isVoiceFocused_0 (copy), l_GetFFlagEnableVrVoiceConnectDisconnect_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v56 (copy), l_observeIsVoiceFocused_0 (copy), v125 (copy), v21 (copy), v36 (copy), l_GetFFlagSelfViewCameraSettings_0 (copy), v34 (copy), v27 (copy), v26 (copy), l_default_0 (copy), v33 (copy), v107 (copy), v69 (copy), v49 (copy), v50 (copy), v137 (copy), v111 (copy), v122 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v98 (copy), v23 (copy), v28 (ref), v29 (ref), l_Migration_0 (copy), v104 (copy), v132 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), v157 (copy), v135 (copy), v136 (copy), v86 (copy), v88 (copy), v87 (copy), l_game_EngineFeature_0 (copy), l_TextChatService_0 (copy), v90 (copy), v93 (copy)
    if v150 then
        v101.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v159 = false;
    local v160 = {};
    local __ = function() --[[ Line: 430 ]] --[[ Name: onVRSettingsReady ]]
        -- upvalues: l_VRService_0 (ref), v160 (copy)
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v162, __ in pairs(v160) do
            v162.Visible = not l_VREnabled_0;
        end;
    end;
    local function v168() --[[ Line: 437 ]] --[[ Name: onVREnabled ]]
        -- upvalues: l_VRService_0 (ref), v159 (ref), v160 (copy)
        if l_VRService_0.VREnabled and v159 then
            local l_VREnabled_1 = l_VRService_0.VREnabled;
            for v166, __ in pairs(v160) do
                v166.Visible = not l_VREnabled_1;
            end;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v168);
    if l_VRService_0.VREnabled and v159 then
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        for v170, __ in pairs(v160) do
            v170.Visible = not l_VREnabled_2;
        end;
    end;
    local function v210() --[[ Line: 449 ]] --[[ Name: createGraphicsOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v160 (copy), l_GuiService_0 (ref), v127 (ref), v126 (ref), v144 (ref), v149 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_game_EngineFeature_1 (ref), l_VRService_0 (ref), v65 (ref), v150 (ref), v101 (ref), l_game_FastInt_0 (ref), v71 (ref)
        local v172 = 1;
        if not l_GameSettings_0:InFullScreen() then
            v172 = 2;
        end;
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local l_l_NewPage_0_2 = l_NewPage_0;
        local v176, v177, v178 = v95:AddNewRow(l_NewPage_0, "Fullscreen", "Selector", {
            "On", 
            "Off"
        }, v172);
        l_l_NewPage_0_0.FullscreenFrame = v176;
        l_l_NewPage_0_1.FullscreenLabel = v177;
        l_l_NewPage_0_2.FullscreenEnabler = v178;
        l_NewPage_0.FullscreenFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FullScreenFrame;
        v160[l_NewPage_0.FullscreenFrame] = true;
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v179) --[[ Line: 462 ]]
            -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref), v127 (ref), l_NewPage_0 (ref), v126 (ref), v144 (ref), v149 (ref)
            local v180 = l_GameSettings_0:InFullScreen();
            if v179 == 1 then
                if not l_GameSettings_0:InFullScreen() then
                    l_GuiService_0:ToggleFullscreen();
                    if v127() then
                        if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 1 then
                            l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                        end;
                    else
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    end;
                end;
            elseif v179 == 2 and l_GameSettings_0:InFullScreen() then
                l_GuiService_0:ToggleFullscreen();
                if v127() then
                    if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 2 then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                    end;
                else
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            end;
            spawn(function() --[[ Line: 487 ]]
                -- upvalues: v126 (ref), v144 (ref), v180 (copy), l_GameSettings_0 (ref), v149 (ref)
                if v126() then
                    v144("fullscreen_enabled", v180, l_GameSettings_0:InFullScreen());
                end;
                v149();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v181) --[[ Line: 495 ]]
            -- upvalues: l_NewPage_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
            if v181 then
                if l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 1 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                end;
            elseif l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 2 then
                l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsFullscreenModeName, {
                enabled = v181
            });
        end);
        l_l_NewPage_0_0 = 1;
        if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            l_l_NewPage_0_0 = 2;
        end;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v176 = l_NewPage_0;
        local v182;
        v177, v178, v182 = v95:AddNewRow(l_NewPage_0, "Graphics Mode", "Selector", {
            "Automatic", 
            "Manual"
        }, l_l_NewPage_0_0);
        l_l_NewPage_0_1.GraphicsEnablerFrame = v177;
        l_l_NewPage_0_2.GraphicsEnablerLabel = v178;
        v176.GraphicsQualityEnabler = v182;
        l_NewPage_0.GraphicsEnablerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsEnablerFrame;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v176 = l_NewPage_0;
        v177, v178, v182 = v95:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", 10, 1);
        l_l_NewPage_0_1.GraphicsQualityFrame = v177;
        l_l_NewPage_0_2.GraphicsQualityLabel = v178;
        v176.GraphicsQualitySlider = v182;
        l_NewPage_0.GraphicsQualityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsQualityFrame;
        l_NewPage_0.GraphicsQualitySlider:SetMinStep(1);
        if l_game_EngineFeature_1 and not l_VRService_0.VREnabled then
            l_l_NewPage_0_1 = table.clone(l_Constants_0.FramerateCaps);
            l_l_NewPage_0_2 = {
                v65:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
                    Frames = l_GameSettings_0:GetDefaultFramerateCap()
                })
            };
            for __, v184 in l_l_NewPage_0_1 do
                table.insert(l_l_NewPage_0_2, v65:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
                    Frames = v184
                }));
            end;
            table.insert(l_l_NewPage_0_1, 1, -1);
            local l_l_l_NewPage_0_2_0 = l_l_NewPage_0_2 --[[ copy: 3 -> 9 ]];
            local l_l_l_NewPage_0_1_0 = l_l_NewPage_0_1 --[[ copy: 2 -> 10 ]];
            task.defer(function() --[[ Line: 559 ]]
                -- upvalues: l_NewPage_0 (ref), v95 (ref), v65 (ref), l_l_l_NewPage_0_2_0 (copy), l_l_l_NewPage_0_1_0 (copy), l_GameSettings_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v190, v191, v192 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_l_l_NewPage_0_2_0, table.find(l_l_l_NewPage_0_1_0, l_GameSettings_0.FramerateCap), nil, v65:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v190;
                l_l_NewPage_0_4.FramerateCapLabel = v191;
                l_l_NewPage_0_5.FramerateCapMode = v192;
                l_NewPage_0.FramerateCapFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FramerateCap;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v193) --[[ Line: 571 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_l_l_NewPage_0_1_0 (ref), v126 (ref), v144 (ref), v149 (ref)
                    local l_FramerateCap_0 = l_GameSettings_0.FramerateCap;
                    l_GameSettings_0.FramerateCap = l_l_l_NewPage_0_1_0[v193];
                    if v126() then
                        v144("framerate_cap", l_FramerateCap_0, l_GameSettings_0.FramerateCap);
                    end;
                    v149();
                end);
            end);
        end;
        settings().Rendering.EnableFRM = true;
        SetGraphicsQuality = function(v195, v196) --[[ Line: 589 ]] --[[ Name: SetGraphicsQuality ]]
            -- upvalues: v150 (ref), v101 (ref), l_GameSettings_0 (ref)
            if v150 then
                local v197, v198 = v101.TemporaryOverride(v195);
                if v197 then
                    settings().Rendering.QualityLevel = v198;
                    return;
                end;
            end;
            local v199 = v195 / 10;
            local v200 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * v199);
            if v200 == 20 then
                v200 = 21;
            elseif v195 == 1 then
                v200 = 1;
            elseif v195 < 1 and not v196 then
                v195 = 1;
                v200 = 1;
            elseif settings().Rendering:GetMaxQualityLevel() < v200 then
                v200 = settings().Rendering:GetMaxQualityLevel() - 1;
            end;
            l_GameSettings_0.SavedQualityLevel = v195;
            settings().Rendering.QualityLevel = v200;
        end;
        l_l_NewPage_0_1 = function() --[[ Line: 615 ]] --[[ Name: setGraphicsToAuto ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        l_l_NewPage_0_2 = function(v201) --[[ Line: 623 ]] --[[ Name: setGraphicsToManual ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() == v201 then
                SetGraphicsQuality(v201);
                return;
            else
                l_NewPage_0.GraphicsQualitySlider:SetValue(v201);
                return;
            end;
        end;
        v176 = false;
        l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v202) --[[ Line: 637 ]]
            -- upvalues: v176 (ref), v149 (ref)
            SetGraphicsQuality(v202);
            if v176 == true then
                v149();
            end;
            v176 = true;
        end);
        l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v203) --[[ Line: 645 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_2 (copy), v149 (ref), v144 (ref)
            local v204 = {
                Automatic = {
                    Name = "Automatic", 
                    Value = 1
                }, 
                Manual = {
                    Name = "Manual", 
                    Value = 2
                }
            };
            local l_Name_0 = v204.Automatic.Name;
            local l_Name_1 = v204.Manual.Name;
            if v203 == v204.Automatic.Value then
                l_Name_0 = v204.Manual.Name;
                l_Name_1 = v204.Automatic.Name;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
            elseif v203 == v204.Manual.Value then
                l_l_NewPage_0_2(l_NewPage_0.GraphicsQualitySlider:GetValue());
            end;
            v149();
            v144("gfx_mode", l_Name_0, l_Name_1);
        end);
        game.GraphicsQualityChangeRequest:Connect(function(v207) --[[ Line: 663 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                local l_Value_0 = l_NewPage_0.GraphicsQualitySlider:GetValue();
                l_Value_0 = if v207 then l_Value_0 + 1 else l_Value_0 - 1;
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
            v177 = tostring(l_GameSettings_0.SavedQualityLevel);
            v177 = if v71[v177] then v71[v177] else 10;
            SetGraphicsQuality(v177);
            do
                local l_v177_0 = v177;
                spawn(function() --[[ Line: 696 ]]
                    -- upvalues: l_NewPage_0 (ref), l_v177_0 (ref)
                    l_NewPage_0.GraphicsQualitySlider:SetValue(l_v177_0);
                end);
            end;
        end;
    end;
    local function v224() --[[ Line: 702 ]] --[[ Name: createReducedMotionOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v65 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v211 = 2;
        if l_GameSettings_0.ReducedMotion then
            v211 = 1;
        end;
        local v212 = v65:FormatByKey("Feature.Accessibility.Heading.ReducedMotion");
        local v213 = v65:FormatByKey("Feature.Accessibility.Description.ReducedMotion");
        local v214 = v65:FormatByKey("InGame.CommonUI.Label.On");
        local v215 = v65:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_6 = l_NewPage_0;
        local l_l_NewPage_0_7 = l_NewPage_0;
        local l_l_NewPage_0_8 = l_NewPage_0;
        local v219, v220, v221 = v95:AddNewRow(l_NewPage_0, v212, "Selector", {
            v214, 
            v215
        }, v211, nil, v213);
        l_l_NewPage_0_6.ReducedMotionFrame = v219;
        l_l_NewPage_0_7.ReducedMotionLabel = v220;
        l_l_NewPage_0_8.ReducedMotionMode = v221;
        l_NewPage_0.ReducedMotionFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ReducedMotionFrame;
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v222) --[[ Line: 724 ]]
            -- upvalues: l_GameSettings_0 (ref), v126 (ref), v144 (ref), v149 (ref)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v222 == 1;
            if v126() then
                v144("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v149();
        end);
    end;
    local function v239() --[[ Line: 735 ]] --[[ Name: createPlayerNamesEnabledOptions ]]
        -- upvalues: v138 (ref), v65 (ref), v51 (ref), l_GameSettings_0 (ref), v80 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v144 (ref), v149 (ref)
        local v225 = if v138 then v65:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") else if v51 then v65:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else v65:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames");
        local v226 = if v51 then v65:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil;
        local function __() --[[ Line: 743 ]] --[[ Name: GetPlayerNamesEnabledStartIndex ]]
            -- upvalues: l_GameSettings_0 (ref), v80 (ref)
            if l_GameSettings_0.PlayerNamesEnabled then
                return v80.On;
            else
                return v80.Off;
            end;
        end;
        local v228 = if l_GameSettings_0.PlayerNamesEnabled then v80.On else v80.Off;
        local v229 = if v138 then v65:FormatByKey("Feature.SettingsHub.Label.Show") else v65:FormatByKey("InGame.CommonUI.Label.On");
        local v230 = if v138 then v65:FormatByKey("Feature.SettingsHub.Label.Hide") else v65:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_9 = l_NewPage_0;
        local l_l_NewPage_0_10 = l_NewPage_0;
        local l_l_NewPage_0_11 = l_NewPage_0;
        local v234, v235, v236 = v95:AddNewRow(l_NewPage_0, v225, "Selector", {
            v229, 
            v230
        }, v228, nil, v226);
        l_l_NewPage_0_9.PlayerNamesEnabledFrame = v234;
        l_l_NewPage_0_10.playerNamesEnabledLabel = v235;
        l_l_NewPage_0_11.playerNamesEnabledMode = v236;
        l_NewPage_0.PlayerNamesEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PlayerNamesEnabledFrame;
        l_NewPage_0.playerNamesEnabledMode.IndexChanged:connect(function(v237) --[[ Line: 762 ]]
            -- upvalues: l_GameSettings_0 (ref), v80 (ref), v144 (ref), v149 (ref)
            local l_PlayerNamesEnabled_0 = l_GameSettings_0.PlayerNamesEnabled;
            l_GameSettings_0.PlayerNamesEnabled = v237 == v80.On;
            v144("player_names_enabled", l_PlayerNamesEnabled_0, l_GameSettings_0.PlayerNamesEnabled);
            v149();
        end);
    end;
    local function v253() --[[ Line: 771 ]] --[[ Name: createPreferredTransparencyOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v65 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v240 = 10 - math.clamp(math.floor(l_GameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10);
        local v241 = v65:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency");
        local v242 = v65:FormatByKey("Feature.Accessibility.Description.PreferredTransparency");
        local v243 = v65:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent");
        local v244 = v65:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque");
        local l_l_NewPage_0_12 = l_NewPage_0;
        local l_l_NewPage_0_13 = l_NewPage_0;
        local l_l_NewPage_0_14 = l_NewPage_0;
        local v248, v249, v250 = v95:AddNewRow(l_NewPage_0, v241, "Slider", 10, v240, nil, v242, v243, v244);
        l_l_NewPage_0_12.PreferredTransparencyFrame = v248;
        l_l_NewPage_0_13.PreferredTransparencyLabel = v249;
        l_l_NewPage_0_14.PreferredTransparencySlider = v250;
        l_NewPage_0.PreferredTransparencyFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTransparencyFrame;
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v251) --[[ Line: 797 ]]
            -- upvalues: l_GameSettings_0 (ref), v126 (ref), v144 (ref), v149 (ref)
            v251 = (10 - math.clamp(math.floor(v251), 0, 10)) / 10;
            local l_PreferredTransparency_0 = l_GameSettings_0.PreferredTransparency;
            l_GameSettings_0.PreferredTransparency = v251;
            if v126() then
                v144("preferred_transparency", l_PreferredTransparency_0, l_GameSettings_0.PreferredTransparency);
            end;
            v149();
        end);
    end;
    local function v268() --[[ Line: 809 ]] --[[ Name: createPreferredTextSizeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v65 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local l_EnumItems_0 = Enum.PreferredTextSize:GetEnumItems();
        local v255 = l_GameSettings_0.PreferredTextSize.Value - 1;
        local v256 = v65:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize");
        local v257 = v65:FormatByKey("Feature.Accessibility.Description.PreferredTextSize");
        local v258 = v65:FormatByKey("Feature.Accessibility.PreferredTextSize.Default");
        local v259 = v65:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest");
        local l_l_NewPage_0_15 = l_NewPage_0;
        local l_l_NewPage_0_16 = l_NewPage_0;
        local l_l_NewPage_0_17 = l_NewPage_0;
        local v263, v264, v265 = v95:AddNewRow(l_NewPage_0, v256, "Slider", 3, v255, nil, v257, v258, v259);
        l_l_NewPage_0_15.PreferredTextSizeFrame = v263;
        l_l_NewPage_0_16.PreferredTextSizeLabel = v264;
        l_l_NewPage_0_17.PreferredTextSizeSlider = v265;
        l_NewPage_0.PreferredTextSizeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTextSizeFrame;
        l_NewPage_0.PreferredTextSizeSlider.ValueChanged:connect(function(v266) --[[ Line: 834 ]]
            -- upvalues: l_GameSettings_0 (ref), l_EnumItems_0 (copy), v126 (ref), v144 (ref), v149 (ref)
            local l_PreferredTextSize_0 = l_GameSettings_0.PreferredTextSize;
            l_GameSettings_0.PreferredTextSize = l_EnumItems_0[v266 + 1];
            if v126() then
                v144("preferred_text_size", l_PreferredTextSize_0, l_GameSettings_0.PreferredTextSize);
            end;
            v149();
        end);
    end;
    local function v285() --[[ Line: 844 ]] --[[ Name: createUiNavigationKeyBindOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v65 (ref), l_UserInputService_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v269 = {
            On = 1, 
            Off = 2
        };
        local l_Off_0 = v269.Off;
        if l_GameSettings_0.UiNavigationKeyBindEnabled then
            l_Off_0 = v269.On;
        end;
        local v271 = v65:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind");
        local v272 = v65:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v273 = v65:FormatByKey("InGame.CommonUI.Label.On");
        local v274 = v65:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_18 = l_NewPage_0;
        local l_l_NewPage_0_19 = l_NewPage_0;
        local l_l_NewPage_0_20 = l_NewPage_0;
        local v278, v279, v280 = v95:AddNewRow(l_NewPage_0, v271, "Selector", {
            v273, 
            v274
        }, l_Off_0, nil, v272);
        l_l_NewPage_0_18.UiNavigationKeyBindEnabledFrame = v278;
        l_l_NewPage_0_19.UiNavigationKeyBindEnabledLabel = v279;
        l_l_NewPage_0_20.UiNavigationKeyBindEnabledMode = v280;
        l_NewPage_0.UiNavigationKeyBindEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiNavigationKeyBindEnabledFrame;
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v281) --[[ Line: 875 ]]
            -- upvalues: l_GameSettings_0 (ref), v269 (copy), v126 (ref), v144 (ref), v149 (ref)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v281 == v269.On;
            if v126() then
                v144("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v149();
        end);
        l_l_NewPage_0_18 = function() --[[ Line: 888 ]] --[[ Name: updateUiNavigationKeyBindVisibility ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v269 (copy)
            local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_0;
                if l_KeyboardEnabled_0 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v269.On or v269.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v269.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end;
        l_l_NewPage_0_19 = l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
            l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_l_NewPage_0_19;
            if l_l_NewPage_0_19 then
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v269.On or v269.Off);
            else
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v269.Off);
                l_GameSettings_0.UiNavigationKeyBindEnabled = false;
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 903 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v269 (copy)
            local l_KeyboardEnabled_1 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_1;
                if l_KeyboardEnabled_1 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v269.On or v269.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v269.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end);
    end;
    local function v297() --[[ Line: 908 ]] --[[ Name: createPerformanceStatsOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_Create_0 (ref), v99 (ref), v57 (ref), v126 (ref), v144 (ref), v149 (ref)
        local l_l_NewPage_0_21 = l_NewPage_0;
        local l_l_NewPage_0_22 = l_NewPage_0;
        local l_l_NewPage_0_23 = l_NewPage_0;
        local l_l_NewPage_0_24 = l_NewPage_0;
        local v290 = nil;
        local v291 = nil;
        local v292 = nil;
        local v293 = nil;
        l_l_NewPage_0_21.PerformanceStatsFrame = v290;
        l_l_NewPage_0_22.PerformanceStatsLabel = v291;
        l_l_NewPage_0_23.PerformanceStatsMode = v292;
        l_l_NewPage_0_24.PerformanceStatsOverrideText = v293;
        GetDesiredPerformanceStatsIndex = function() --[[ Line: 914 ]] --[[ Name: GetDesiredPerformanceStatsIndex ]]
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
        v290, v291, v292 = v95:AddNewRow(l_NewPage_0, "Performance Stats", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_21);
        l_l_NewPage_0_22.PerformanceStatsFrame = v290;
        l_l_NewPage_0_23.PerformanceStatsLabel = v291;
        l_l_NewPage_0_24.PerformanceStatsMode = v292;
        l_NewPage_0.PerformanceStatsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PerformanceStatsFrame;
        l_NewPage_0.PerformanceStatsOverrideText = l_Create_0("TextLabel")({
            Name = "PerformanceStatsLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v99.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v99.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v57 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v57 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v57 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v294) --[[ Line: 943 ]]
            -- upvalues: v126 (ref), l_GameSettings_0 (ref), v144 (ref), v149 (ref)
            local v295 = nil;
            if v126() then
                v295 = l_GameSettings_0.PerformanceStatsVisible;
            end;
            if v294 == 1 then
                l_GameSettings_0.PerformanceStatsVisible = true;
            else
                l_GameSettings_0.PerformanceStatsVisible = false;
            end;
            if v126() then
                v144("show_performance_stats", v295, l_GameSettings_0.PerformanceStatsVisible);
            end;
            v149();
        end);
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function() --[[ Line: 965 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v296 = GetDesiredPerformanceStatsIndex();
            if v296 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v296);
            end;
        end);
    end;
    local function v304() --[[ Line: 975 ]] --[[ Name: createWebServerInformationRow ]]
        -- upvalues: l_NewPage_0 (copy), v95 (ref), v59 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v44 (ref), l_Create_0 (ref), v99 (ref)
        local l_l_NewPage_0_25 = l_NewPage_0;
        local l_l_NewPage_0_26 = l_NewPage_0;
        local l_l_NewPage_0_27 = l_NewPage_0;
        local v301, v302, v303 = v95:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not v59 and nil);
        l_l_NewPage_0_25.InformationFrame = v301;
        l_l_NewPage_0_26.InformationLabel = v302;
        l_l_NewPage_0_27.InformationTextBox = v303;
        l_NewPage_0.InformationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v44 then
            l_NewPage_0.InformationText = l_Create_0("TextLabel")({
                Name = "InformationLabel", 
                Text = "Information Loading", 
                Font = v99.font(Enum.Font.SourceSans), 
                FontSize = v99.fontSize(Enum.FontSize.Size18), 
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
                Font = v99.font(Enum.Font.SourceSans), 
                FontSize = v99.fontSize(Enum.FontSize.Size14), 
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
    local function v333() --[[ Line: 1015 ]] --[[ Name: createMicroProfilerOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v304 (copy), v121 (ref), v126 (ref), v120 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v144 (ref), v149 (ref), v65 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_l_NewPage_0_28 = l_NewPage_0;
        local l_l_NewPage_0_29 = l_NewPage_0;
        local l_l_NewPage_0_30 = l_NewPage_0;
        local l_l_NewPage_0_31 = l_NewPage_0;
        local v309 = nil;
        local v310 = nil;
        local v311 = nil;
        local v312 = nil;
        l_l_NewPage_0_28.MicroProfilerFrame = v309;
        l_l_NewPage_0_29.MicroProfilerLabel = v310;
        l_l_NewPage_0_30.MicroProfilerMode = v311;
        l_l_NewPage_0_31.MicroProfilerOverrideText = v312;
        l_l_NewPage_0_28 = function() --[[ Line: 1020 ]] --[[ Name: tryContentLabel ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v304 (ref)
            local l_MicroProfilerWebServerPort_0 = l_GameSettings_0.MicroProfilerWebServerPort;
            if l_MicroProfilerWebServerPort_0 ~= 0 then
                local l_l_NewPage_0_32 = l_NewPage_0;
                local l_l_NewPage_0_33 = l_NewPage_0;
                local v316, v317 = v304();
                l_l_NewPage_0_32.InformationFrame = v316;
                l_l_NewPage_0_33.InformationText = v317;
                l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_0;
                return true;
            else
                return false;
            end;
        end;
        l_l_NewPage_0_29 = function(v318) --[[ Line: 1032 ]] --[[ Name: setMicroProfilerIndex ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v121 (ref), v126 (ref), v304 (ref), v120 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v144 (ref), v149 (ref)
            local function __() --[[ Line: 1033 ]] --[[ Name: hideContentLabel ]]
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
            local v320 = nil;
            local v321 = nil;
            local v322 = nil;
            if v121 then
                if v126() then
                    v320 = "webserver";
                    v321 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
                if v318 == 1 then
                    l_GameSettings_0.MicroProfilerWebServerEnabled = true;
                    local v323 = 30;
                    while v323 >= 1 do
                        local l_MicroProfilerWebServerPort_1 = l_GameSettings_0.MicroProfilerWebServerPort;
                        local v325;
                        if l_MicroProfilerWebServerPort_1 ~= 0 then
                            local l_l_NewPage_0_34 = l_NewPage_0;
                            local l_l_NewPage_0_35 = l_NewPage_0;
                            local v328, v329 = v304();
                            l_l_NewPage_0_34.InformationFrame = v328;
                            l_l_NewPage_0_35.InformationText = v329;
                            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_1;
                            v325 = true;
                        else
                            v325 = false;
                        end;
                        if not v325 then
                            v323 = v323 - 1;
                            wait(0.1);
                        else
                            break;
                        end;
                    end;
                    if v323 <= 0 then
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
                if v126() then
                    v322 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
            elseif v120 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if v126() then
                    v320 = "regular";
                    v321 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
                l_GameSettings_0.OnScreenProfilerEnabled = v318 == 1;
                if v126() then
                    v322 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
            end;
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerSettingsPressed");
            if v126() then
                v144("microprofiler_enabled", v321, v322, {
                    microprofiler_type = v320
                });
            end;
            v149();
        end;
        l_l_NewPage_0_30 = function() --[[ Line: 1106 ]] --[[ Name: GetDesiredWebServerIndex ]]
            -- upvalues: v121 (ref), l_GameSettings_0 (ref), v120 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref)
            if v121 then
                if l_GameSettings_0.MicroProfilerWebServerEnabled then
                    return 1;
                else
                    return 2;
                end;
            elseif v120 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if l_GameSettings_0.OnScreenProfilerEnabled then
                    return 1;
                else
                    return 2;
                end;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_31 = if v121 then l_GameSettings_0.MicroProfilerWebServerEnabled and 1 or 2 else if v120 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then l_GameSettings_0.OnScreenProfilerEnabled and 1 or 2 else 2;
        v309 = v65:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler");
        v310 = l_NewPage_0;
        v311 = l_NewPage_0;
        v312 = l_NewPage_0;
        local v330, v331, v332 = v95:AddNewRow(l_NewPage_0, v309, "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_31);
        v310.MicroProfilerFrame = v330;
        v311.MicroProfilerLabel = v331;
        v312.MicroProfilerMode = v332;
        l_NewPage_0.MicroProfilerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MicroProfilerFrame;
        v310 = l_GameSettings_0.MicroProfilerWebServerPort;
        if v310 ~= 0 then
            v311 = l_NewPage_0;
            v312 = l_NewPage_0;
            v330, v331 = v304();
            v311.InformationFrame = v330;
            v312.InformationText = v331;
            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. v310;
        end;
        v310 = false;
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 1135 ]]
            -- upvalues: v310 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            v310 = true;
            if l_GameSettings_0.OnScreenProfilerEnabled then
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(1);
                return;
            else
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                return;
            end;
        end);
        v311 = function(...) --[[ Line: 1145 ]] --[[ Name: onIndexChanged ]]
            -- upvalues: v310 (ref), l_l_NewPage_0_29 (copy)
            if v310 then
                v310 = false;
                return;
            else
                l_l_NewPage_0_29(...);
                return;
            end;
        end;
        l_NewPage_0.MicroProfilerMode.IndexChanged:connect(v311);
    end;
    local function v454(v334) --[[ Line: 1156 ]] --[[ Name: createCameraModeOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v160 (copy), l_Create_0 (ref), v99 (ref), v57 (ref), v126 (ref), v144 (ref), v149 (ref), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref), v96 (ref), v74 (ref), l_VRService_0 (ref), v40 (ref), l_getAppFeaturePolicies_0 (ref), v65 (ref), l_Constants_0 (ref), v76 (ref), v77 (ref), v73 (ref), v72 (ref)
        local l_l_NewPage_0_36 = l_NewPage_0;
        local l_l_NewPage_0_37 = l_NewPage_0;
        local l_l_NewPage_0_38 = l_NewPage_0;
        local l_l_NewPage_0_39 = l_NewPage_0;
        local v339 = nil;
        local v340 = nil;
        local v341 = nil;
        local v342 = nil;
        l_l_NewPage_0_36.ShiftLockFrame = v339;
        l_l_NewPage_0_37.ShiftLockLabel = v340;
        l_l_NewPage_0_38.ShiftLockMode = v341;
        l_l_NewPage_0_39.ShiftLockOverrideText = v342;
        l_l_NewPage_0_36 = 2;
        if l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch then
            l_l_NewPage_0_36 = 1;
        end;
        l_l_NewPage_0_37 = l_NewPage_0;
        l_l_NewPage_0_38 = l_NewPage_0;
        l_l_NewPage_0_39 = l_NewPage_0;
        v339, v340, v341 = v95:AddNewRow(l_NewPage_0, "Shift Lock Switch", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_36);
        l_l_NewPage_0_37.ShiftLockFrame = v339;
        l_l_NewPage_0_38.ShiftLockLabel = v340;
        l_l_NewPage_0_39.ShiftLockMode = v341;
        l_NewPage_0.ShiftLockFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ShiftLockFrame;
        v160[l_NewPage_0.ShiftLockFrame] = true;
        l_NewPage_0.ShiftLockOverrideText = l_Create_0("TextLabel")({
            Name = "ShiftLockOverrideLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v99.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v99.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v57 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v57 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v57 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.ShiftLockFrame
        });
        l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v343) --[[ Line: 1187 ]]
            -- upvalues: v126 (ref), l_GameSettings_0 (ref), v144 (ref), v149 (ref)
            local v344 = nil;
            if v126() then
                v344 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
            end;
            if v343 == 1 then
                l_GameSettings_0.ControlMode = Enum.ControlMode.MouseLockSwitch;
            else
                l_GameSettings_0.ControlMode = Enum.ControlMode.Classic;
            end;
            if v126() then
                v144("shift_lock_enabled", v344, l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
            end;
            v149();
        end);
        l_l_NewPage_0_37 = function(v345) --[[ Line: 1209 ]] --[[ Name: setShiftLockSelectorVisible ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v346 = v345 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v346;
                l_NewPage_0.ShiftLockMode:SetInteractable(v346);
            end;
        end;
        l_l_NewPage_0_38 = function() --[[ Line: 1217 ]] --[[ Name: applyDevOverrideShiftLockSelector ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v347 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v347;
                local v348 = not v347 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v348;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v348);
                end;
            end;
        end;
        l_l_NewPage_0_39 = function() --[[ Line: 1225 ]] --[[ Name: updateShiftLockVisibility ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v349 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v349;
            end;
            local v350 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v350;
                local v351 = not v350 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v351;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v351);
                end;
            end;
        end;
        v339 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.ShiftLockFrame then
            l_NewPage_0.ShiftLockFrame.Visible = v339;
        end;
        v340 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v340;
            v342 = not v340 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v342;
                l_NewPage_0.ShiftLockMode:SetInteractable(v342);
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ Line: 1235 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v352 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v352;
            end;
            local v353 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v353;
                local v354 = not v353 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v354;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v354);
                end;
            end;
        end);
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 1239 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v355 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v355;
            end;
            local v356 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v356;
                local v357 = not v356 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v357;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v357);
                end;
            end;
        end);
        cameraModeIsUserChoice = function() --[[ Line: 1245 ]] --[[ Name: cameraModeIsUserChoice ]]
            -- upvalues: l_UserInputService_0 (ref), l_LocalPlayer_0 (ref)
            if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v358) --[[ Line: 1254 ]] --[[ Name: setCameraModeVisible ]]
            -- upvalues: l_NewPage_0 (ref)
            if l_NewPage_0.CameraMode then
                l_NewPage_0.CameraMode.SelectorFrame.Visible = v358;
                l_NewPage_0.CameraMode:SetInteractable(v358);
                l_NewPage_0.CameraModeOverrideText.Visible = not v358;
            end;
        end;
        v339 = v96.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
        v340 = {};
        v341 = {};
        do
            local l_v340_0, l_v341_0 = v340, v341;
            v342 = function(v361) --[[ Line: 1268 ]] --[[ Name: updateCurrentCameraMovementIndex ]]
                -- upvalues: l_v341_0 (ref), l_v340_0 (ref), l_UserInputService_0 (ref), v126 (ref), l_GameSettings_0 (ref), v144 (ref)
                local v362 = nil;
                if not pcall(function() --[[ Line: 1270 ]]
                    -- upvalues: v362 (ref), l_v341_0 (ref), l_v340_0 (ref), v361 (copy)
                    v362 = l_v341_0[l_v340_0[v361]];
                end) or v362 == nil then
                    return false;
                else
                    local v363 = nil;
                    local v364 = nil;
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        if v126() then
                            v364 = l_GameSettings_0.TouchCameraMovementMode.Value;
                        end;
                        v363 = l_GameSettings_0.TouchCameraMovementMode.Value ~= v362;
                        l_GameSettings_0.TouchCameraMovementMode = v362;
                    else
                        if v126() then
                            v364 = l_GameSettings_0.ComputerCameraMovementMode.Value;
                        end;
                        v363 = l_GameSettings_0.ComputerCameraMovementMode.Value ~= v362;
                        l_GameSettings_0.ComputerCameraMovementMode = v362;
                    end;
                    if v126() and v363 then
                        v144("camera_mode", v364, v362);
                    end;
                    return v363;
                end;
            end;
            local l_v339_0 = v339 --[[ copy: 5 -> 23 ]];
            local l_v342_0 = v342 --[[ copy: 8 -> 24 ]];
            local function v373() --[[ Line: 1304 ]] --[[ Name: updateCameraMovementModes ]]
                -- upvalues: l_v339_0 (copy), l_UserInputService_0 (ref), l_v340_0 (ref), l_v341_0 (ref), v74 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), l_v342_0 (copy)
                local v367 = {};
                if l_v339_0 then
                    v367 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then l_v339_0:GetRegisteredTouchCameraMovementModes() else l_v339_0:GetRegisteredComputerCameraMovementModes();
                end;
                l_v340_0 = {};
                l_v341_0 = {};
                if #v367 <= 0 then
                    setCameraModeVisible(false);
                    return;
                else
                    for v368 = 1, #v367 do
                        local v369 = v367[v368];
                        local l_Name_2 = v369.Name;
                        if l_Name_2 == "Default" then
                            l_Name_2 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v74.DEFAULT_FOLLOW else v74.DEFAULT_CLASSIC;
                        end;
                        l_v340_0[#l_v340_0 + 1] = l_Name_2;
                        l_v341_0[l_Name_2] = v369.Value;
                    end;
                    if l_NewPage_0.CameraMode then
                        l_NewPage_0.CameraMode:UpdateOptions(l_v340_0);
                    end;
                    local v371 = -1;
                    local v372 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                    v371 = if v372 then l_GameSettings_0.TouchCameraMovementMode.Value else l_GameSettings_0.ComputerCameraMovementMode.Value;
                    if v371 > -1 then
                        if v372 or l_GameSettings_0.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
                            v371 = v371 + 1;
                        end;
                        l_v342_0(v371);
                        l_NewPage_0.CameraMode:SetSelectionIndex(v371);
                    end;
                    setCameraModeVisible(cameraModeIsUserChoice());
                    return;
                end;
            end;
            local l_l_NewPage_0_40 = l_NewPage_0;
            local l_l_NewPage_0_41 = l_NewPage_0;
            local l_l_NewPage_0_42 = l_NewPage_0;
            local v377, v378, v379 = v95:AddNewRow(l_NewPage_0, "Camera Mode", "Selector", l_v340_0, 1);
            l_l_NewPage_0_40.CameraModeFrame = v377;
            l_l_NewPage_0_41.CameraModeLabel = v378;
            l_l_NewPage_0_42.CameraMode = v379;
            l_NewPage_0.CameraModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraModeFrame;
            v160[l_NewPage_0.CameraMode] = true;
            l_NewPage_0.CameraModeOverrideText = l_Create_0("TextLabel")({
                Name = "CameraDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v99.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v99.fontSize(Enum.FontSize.Size24, "GameSettings"), 
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
            if v339 then
                local l_v373_0 = v373 --[[ copy: 9 -> 30 ]];
                v339.TouchCameraMovementModeRegistered:connect(function(__) --[[ Line: 1390 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v373_0 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_v373_0();
                    end;
                end);
                v339.ComputerCameraMovementModeRegistered:connect(function(__) --[[ Line: 1396 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v373_0 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_v373_0();
                    end;
                end);
            end;
            local l_v373_1 = v373 --[[ copy: 9 -> 25 ]];
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1403 ]]
                -- upvalues: l_v373_1 (copy)
                l_v373_1();
            end);
            l_l_NewPage_0_40 = false;
            local l_v342_1 = v342 --[[ copy: 8 -> 26 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v385) --[[ Line: 1408 ]]
                -- upvalues: l_v342_1 (copy), l_l_NewPage_0_40 (ref), v149 (ref)
                if l_v342_1(v385) then
                    if l_l_NewPage_0_40 then
                        v149();
                    end;
                    l_l_NewPage_0_40 = true;
                end;
            end);
            v373();
        end;
        v339 = false;
        v340 = function() --[[ Line: 1424 ]] --[[ Name: createVROption ]]
            -- upvalues: v339 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v144 (ref)
            if not v339 then
                v339 = true;
                local v386 = nil;
                v386 = if l_GameSettings_0.VREnabled then {
                    "On", 
                    "Off (restart pending)"
                } else {
                    "On (restart pending)", 
                    "Off"
                };
                local l_l_NewPage_0_43 = l_NewPage_0;
                local l_l_NewPage_0_44 = l_NewPage_0;
                local l_l_NewPage_0_45 = l_NewPage_0;
                local v390, v391, v392 = v95:AddNewRow(l_NewPage_0, "VR", "Selector", v386, l_GameSettings_0.VREnabled and 1 or 2);
                l_l_NewPage_0_43.VREnabledFrame = v390;
                l_l_NewPage_0_44.VREnabledLabel = v391;
                l_l_NewPage_0_45.VREnabledSelector = v392;
                l_NewPage_0.VREnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VREnabledFrame;
                do
                    local l_v386_0 = v386;
                    l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v394) --[[ Line: 1439 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v386_0 (ref), v144 (ref)
                        local v395 = {
                            On = {
                                Name = "On", 
                                Value = 1
                            }, 
                            Off = {
                                Name = "Off", 
                                Value = 2
                            }
                        };
                        local v396 = v394 == v395.On.Value;
                        if l_GameSettings_0.VREnabled ~= v396 then
                            l_GameSettings_0.VREnabled = v396;
                            local v397 = l_v386_0[v395.On.Value];
                            local v398 = l_v386_0[v394];
                            if v398 == l_v386_0[v395.On.Value] then
                                v397 = l_v386_0[v395.Off.Value];
                            end;
                            v144("vr_mode", v397, v398);
                        end;
                    end);
                end;
            end;
        end;
        v341 = function() --[[ Line: 1458 ]] --[[ Name: onVREnabledChanged ]]
            -- upvalues: l_VRService_0 (ref), l_GameSettings_0 (ref), v340 (copy)
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v340();
                return;
            else
                if l_GameSettings_0.HasEverUsedVR then
                    v340();
                end;
                return;
            end;
        end;
        if v40() and l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
            v340();
        else
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v340();
            elseif l_GameSettings_0.HasEverUsedVR then
                v340();
            end;
            l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v341);
        end;
        v342 = {};
        local v399 = {};
        local v400 = {};
        local v401 = {};
        local function v403(__) --[[ Line: 1483 ]]

        end;
        local function __(v404) --[[ Line: 1487 ]] --[[ Name: setMovementModeVisible ]]
            -- upvalues: l_NewPage_0 (ref), v342 (ref)
            if l_NewPage_0.MovementMode then
                local v405 = v404 and #v342 > 0;
                l_NewPage_0.MovementMode.SelectorFrame.Visible = v405;
                l_NewPage_0.MovementMode:SetInteractable(v405);
                l_NewPage_0.MovementModeOverrideText.Visible = not v405;
            end;
        end;
        if v334 then
            local v407 = {};
            local v408 = v96.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
            local function __(v409) --[[ Line: 1501 ]] --[[ Name: getDisplayName ]]
                -- upvalues: l_UserInputService_0 (ref), v65 (ref), l_Constants_0 (ref), v76 (ref), v77 (ref)
                local l_v409_0 = v409;
                if v409 == "Default" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return (v65:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey));
                    else
                        return v76.DEFAULT_KEYBOARD;
                    end;
                elseif v409 == "KeyboardMouse" then
                    return "Keyboard + Mouse";
                elseif v409 == "ClickToMove" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return v76.TAP_TO_MOVE;
                    else
                        return v76.CLICK_TO_MOVE;
                    end;
                elseif v409 == "DynamicThumbstick" then
                    return "Dynamic Thumbstick";
                else
                    if v409 == "Thumbstick" then
                        l_v409_0 = v77;
                    end;
                    return l_v409_0;
                end;
            end;
            local l_l_NewPage_0_46 = l_NewPage_0;
            local l_l_NewPage_0_47 = l_NewPage_0;
            local l_l_NewPage_0_48 = l_NewPage_0;
            local v415, v416, v417 = v95:AddNewRow(l_NewPage_0, "Movement Mode", "Selector", v407, 1);
            l_l_NewPage_0_46.MovementModeFrame = v415;
            l_l_NewPage_0_47.MovementModeLabel = v416;
            l_l_NewPage_0_48.MovementMode = v417;
            l_NewPage_0.MovementModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MovementModeFrame;
            v160[l_NewPage_0.MovementMode] = true;
            l_NewPage_0.MovementModeOverrideText = l_Create_0("TextLabel")({
                Name = "MovementDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v99.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v99.fontSize(Enum.FontSize.Size24, "GameSettings"), 
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
            l_l_NewPage_0_46 = function(v418) --[[ Line: 1542 ]] --[[ Name: setMovementMode ]]
                -- upvalues: v126 (ref), l_GameSettings_0 (ref), v144 (ref)
                local v419 = nil;
                if v418.EnumType == Enum.TouchMovementMode then
                    if v126() then
                        v419 = l_GameSettings_0.TouchMovementMode;
                    end;
                    l_GameSettings_0.TouchMovementMode = v418;
                else
                    if v126() then
                        v419 = l_GameSettings_0.ComputerMovementMode;
                    end;
                    l_GameSettings_0.ComputerMovementMode = v418;
                end;
                if v126() then
                    v144("movement_mode", v419, v418);
                end;
            end;
            v403 = function(v420) --[[ Line: 1559 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v342 (ref)
                local v421 = nil;
                v421 = if v420 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                local l_v421_0 = v421;
                if l_NewPage_0.MovementMode then
                    local v423 = l_v421_0 and #v342 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v423;
                    l_NewPage_0.MovementMode:SetInteractable(v423);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v423;
                end;
                if l_NewPage_0.MovementModeOverrideText then
                    l_NewPage_0.MovementModeOverrideText.Visible = not v421;
                end;
            end;
            local l_v408_0 = v408 --[[ copy: 15 -> 27 ]];
            local l_l_l_NewPage_0_46_0 = l_l_NewPage_0_46 --[[ copy: 17 -> 28 ]];
            l_l_NewPage_0_47 = function() --[[ Line: 1571 ]] --[[ Name: updateMovementModes ]]
                -- upvalues: l_UserInputService_0 (ref), l_v408_0 (copy), v342 (ref), v399 (ref), v400 (ref), v401 (ref), l_NewPage_0 (ref), v65 (ref), l_Constants_0 (ref), v76 (ref), v77 (ref), l_GameSettings_0 (ref), l_l_l_NewPage_0_46_0 (copy), v403 (ref)
                local v426 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                if l_v408_0 then
                    if v426 then
                        v342 = l_v408_0:GetRegisteredTouchMovementModes();
                    else
                        v342 = l_v408_0:GetRegisteredComputerMovementModes();
                    end;
                end;
                v399 = {};
                v400 = {};
                v401 = {};
                if #v342 <= 0 then
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                        l_NewPage_0.MovementMode:SetInteractable(false);
                        l_NewPage_0.MovementModeOverrideText.Visible = true;
                    end;
                    return;
                else
                    if l_NewPage_0.MovementMode then
                        local v427 = #v342 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v427;
                        l_NewPage_0.MovementMode:SetInteractable(v427);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v427;
                    end;
                    for v428, v429 in v342 do
                        v400[v428] = v429;
                        local l_v401_0 = v401;
                        local l_Name_3 = v429.Name;
                        local l_l_Name_3_0 = l_Name_3;
                        if l_Name_3 == "Default" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v65:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey) else v76.DEFAULT_KEYBOARD;
                        elseif l_Name_3 == "KeyboardMouse" then
                            l_l_Name_3_0 = "Keyboard + Mouse";
                        elseif l_Name_3 == "ClickToMove" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v76.TAP_TO_MOVE else v76.CLICK_TO_MOVE;
                        elseif l_Name_3 == "DynamicThumbstick" then
                            l_l_Name_3_0 = "Dynamic Thumbstick";
                        elseif l_Name_3 == "Thumbstick" then
                            l_l_Name_3_0 = v77;
                        end;
                        l_v401_0[v428] = l_l_Name_3_0;
                        v399[v429] = v428;
                    end;
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode:UpdateOptions(v401);
                    end;
                    local v433 = nil;
                    v433 = if v426 then l_GameSettings_0.TouchMovementMode else l_GameSettings_0.ComputerMovementMode;
                    if v433 then
                        l_l_l_NewPage_0_46_0(v433);
                        l_NewPage_0.MovementMode:SetSelectionIndex(v399[v433]);
                    end;
                    v403(v426);
                    return;
                end;
            end;
            l_l_NewPage_0_47();
            if v408 then
                v408.TouchMovementModeRegistered:connect(function(__) --[[ Line: 1615 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
                v408.ComputerMovementModeRegistered:connect(function(__) --[[ Line: 1621 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
            end;
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1628 ]]
                -- upvalues: l_l_NewPage_0_47 (copy)
                l_l_NewPage_0_47();
            end);
            local l_l_l_NewPage_0_46_1 = l_l_NewPage_0_46 --[[ copy: 17 -> 29 ]];
            l_NewPage_0.MovementMode.IndexChanged:connect(function(v437) --[[ Line: 1632 ]]
                -- upvalues: l_l_l_NewPage_0_46_1 (copy), v400 (ref), v149 (ref)
                l_l_l_NewPage_0_46_1(v400[v437]);
                v149();
            end);
        end;
        local v438 = false;
        local v439 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
        if not if v439 then l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            l_NewPage_0.CameraModeOverrideText.Visible = true;
            setCameraModeVisible(false);
        else
            l_NewPage_0.CameraModeOverrideText.Visible = false;
            setCameraModeVisible(true);
        end;
        local v440 = false;
        v440 = if v439 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
        if l_NewPage_0.MovementModeOverrideText then
            if not v440 then
                l_NewPage_0.MovementModeOverrideText.Visible = true;
                if l_NewPage_0.MovementMode then
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                    l_NewPage_0.MovementMode:SetInteractable(false);
                    l_NewPage_0.MovementModeOverrideText.Visible = true;
                end;
            else
                l_NewPage_0.MovementModeOverrideText.Visible = false;
                if l_NewPage_0.MovementMode then
                    local v441 = #v342 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v441;
                    l_NewPage_0.MovementMode:SetInteractable(v441);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v441;
                end;
            end;
        end;
        local v442 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v442;
            local v443 = not v442 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v443;
                l_NewPage_0.ShiftLockMode:SetInteractable(v443);
            end;
        end;
        v438 = function(v444) --[[ Line: 1678 ]] --[[ Name: updateUserSettingsMenu ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v403 (ref), v342 (ref)
            if v444 == "DevEnableMouseLock" then
                local v445 = not l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockOverrideText then
                    l_NewPage_0.ShiftLockOverrideText.Visible = v445;
                    local v446 = not v445 and l_LocalPlayer_0.DevEnableMouseLock;
                    if l_NewPage_0.ShiftLockMode then
                        l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v446;
                        l_NewPage_0.ShiftLockMode:SetInteractable(v446);
                        return;
                    end;
                end;
            elseif v444 == "DevComputerCameraMode" then
                local v447 = l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
                setCameraModeVisible(v447);
                l_NewPage_0.CameraModeOverrideText.Visible = not v447;
                return;
            elseif v444 == "DevComputerMovementMode" then
                if v403 ~= nil then
                    v403(false);
                    return;
                else
                    local v448 = l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v449 = v448 and #v342 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v449;
                        l_NewPage_0.MovementMode:SetInteractable(v449);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v449;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v448;
                        return;
                    end;
                end;
            elseif v444 == "DevTouchMovementMode" then
                if v403 ~= nil then
                    v403(true);
                    return;
                else
                    local v450 = l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v451 = v450 and #v342 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v451;
                        l_NewPage_0.MovementMode:SetInteractable(v451);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v451;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v450;
                        return;
                    end;
                end;
            elseif v444 == "DevTouchCameraMode" then
                local v452 = l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
                setCameraModeVisible(v452);
                l_NewPage_0.CameraModeOverrideText.Visible = not v452;
            end;
        end;
        l_LocalPlayer_0.Changed:connect(function(v453) --[[ Line: 1713 ]]
            -- upvalues: v73 (ref), v438 (copy), v72 (ref)
            if v73[v453] then
                v438(v453);
            end;
            if v72[v453] then
                v438(v453);
            end;
        end);
    end;
    local function v476() --[[ Line: 1726 ]] --[[ Name: createFeedbackModeOptions ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v134 (ref), l_NewPage_0 (copy), l_SafetyService_0 (ref), v20 (ref), v144 (ref), v133 (ref), v95 (ref), v79 (ref), v65 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v128 (ref), v117 (ref)
        local v455 = l_Url_0.ROLES_URL .. "v1/users/authenticated/roles";
        local v456 = l_HttpService_0:RequestInternal({
            Url = v455, 
            Method = "GET"
        });
        local function v465(v457) --[[ Line: 1733 ]] --[[ Name: rolesCheckCallback ]]
            -- upvalues: v134 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v144 (ref), v133 (ref), v95 (ref), v79 (ref), v65 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v457 then
                if not v134 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                    return;
                else
                    local function v458() --[[ Line: 1745 ]] --[[ Name: onToggleFeedbackMode ]]
                        -- upvalues: v134 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v144 (ref)
                        if v134 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                            return;
                        else
                            l_NewPage_0.HubRef:PopMenu(false, true);
                            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                                l_SafetyService_0.IsCaptureModeForReport = false;
                            end;
                            if v20 ~= nil then
                                v20:ToggleCaptureMode();
                            end;
                            v144("translation_feedback", "", "pressed");
                            return;
                        end;
                    end;
                    local v459 = nil;
                    local v460 = nil;
                    if v133 then
                        local v461, v462 = v95:MakeStyledButton("toggleFeedbackModeButton", v79, UDim2.new(1, 0, 1, -20), v458, l_NewPage_0);
                        v459 = v461;
                        v460 = v462;
                        v459.Size = UDim2.new(0.6, 0, 0, 40);
                        v459.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v459.AnchorPoint = Vector2.new(0, 0.5);
                    else
                        local v463, v464 = v95:MakeStyledButton("toggleFeedbackModeButton", v79, UDim2.new(0, 300, 1, -20), v458, l_NewPage_0);
                        v459 = v463;
                        v460 = v464;
                        v459.Size = UDim2.new(0, 300, 0, 30);
                        v459.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v459.AnchorPoint = Vector2.new(0, 0.5);
                    end;
                    v459.ZIndex = 2;
                    v459.Selectable = true;
                    v460.ZIndex = 2;
                    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
                        l_NewPage_0.toggleFeedbackModeButton = v459;
                        l_NewPage_0.toggleFeedbackModeText = v460;
                    end;
                    if v133 then
                        v95:AddNewRowObject(l_NewPage_0, v65:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v459, nil, true).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                        return;
                    else
                        v95:AddNewRowObject(l_NewPage_0, v65:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v459).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                    end;
                end;
            end;
        end;
        if v128 then
            v465(true);
            return;
        else
            v456:Start(function(v466, v467) --[[ Line: 1829 ]]
                -- upvalues: l_HttpService_0 (ref), v117 (ref), v455 (copy), v465 (copy)
                local v468 = false;
                local v469 = false;
                local v470 = nil;
                if not v466 then
                    v470 = "Roles Api Request: Connection error";
                elseif v467.StatusCode == 401 then
                    v470 = "Roles Api Request: Unauthorized";
                elseif v467.StatusCode < 200 or v467.StatusCode >= 400 then
                    v470 = "Roles Api Status code: " .. v467.StatusCode;
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 1841 ]]
                        -- upvalues: l_HttpService_0 (ref), v467 (copy), v468 (ref)
                        local v471 = l_HttpService_0:JSONDecode(v467.Body);
                        for __, v473 in pairs(v471.roles) do
                            if v473 == "Soothsayer" then
                                v468 = true;
                            end;
                        end;
                    end);
                    v469 = l_status_0;
                    v470 = l_result_0;
                end;
                if not v469 then
                    v117:warning("Feedback Mode initialization api call failed with url: " .. v455 .. " and with error message: " .. v470);
                end;
                v465(v468);
            end);
            return;
        end;
    end;
    local function v699() --[[ Line: 1869 ]] --[[ Name: createTranslationOptions ]]
        -- upvalues: l_Players_0 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v117 (ref), l_NewPage_0 (copy), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_LocalPlayer_0 (ref), v144 (ref), l_RunService_0 (ref)
        local v477 = 1;
        local v478 = 1;
        local v479 = false;
        local v480 = nil;
        local v481 = nil;
        local l_LocaleId_0 = l_Players_0.LocalPlayer.LocaleId;
        local v483 = nil;
        local v484 = nil;
        local v485 = {};
        local v486 = {};
        local v487 = {};
        local v488 = {};
        local v489 = {};
        local v490 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
        local v491 = l_HttpService_0:RequestInternal({
            Url = v490, 
            Method = "GET"
        });
        local v492 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
        local v493 = l_HttpService_0:RequestInternal({
            Url = v492, 
            Method = "GET"
        });
        local v494 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId);
        local v495 = l_HttpService_0:RequestInternal({
            Url = v494, 
            Method = "GET"
        });
        local v496 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
        local v497 = l_HttpService_0:RequestInternal({
            Url = v496, 
            Method = "GET"
        });
        local function v534(v498, v499) --[[ Line: 1934 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
            -- upvalues: v117 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v489 (copy), v487 (copy), v480 (ref), v485 (copy), v484 (ref), v486 (copy), v477 (ref), v478 (ref), l_LocalPlayer_0 (ref), v481 (ref), v144 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v479 (ref), l_RunService_0 (ref)
            if not v498 then
                if v499 == nil then
                    v499 = "Execution path did not set earliest error to non-nil value.";
                end;
                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v499);
                local l_l_NewPage_0_49 = l_NewPage_0;
                local l_l_NewPage_0_50 = l_NewPage_0;
                local l_l_NewPage_0_51 = l_NewPage_0;
                local v503, v504, v505 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v78
                }, 1);
                l_l_NewPage_0_49.LanguageSelectorFrame = v503;
                l_l_NewPage_0_50.LanguageSelectorLabel = v504;
                l_l_NewPage_0_51.LanguageSelectorMode = v505;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            else
                local v506 = false;
                table.insert(v489, v487[v480].languageName .. " (Original)");
                for __, v508 in pairs(v485) do
                    if v508 == v484 then
                        v506 = true;
                    end;
                    if v508 ~= v480 then
                        table.insert(v489, v487[v508].languageName);
                    end;
                end;
                if v506 == true then
                    for v509, v510 in pairs(v489) do
                        if v509 ~= 1 and v486[v510] == v484 then
                            v477 = v509;
                            v478 = v509;
                        end;
                    end;
                end;
                local l_l_NewPage_0_52 = l_NewPage_0;
                local l_l_NewPage_0_53 = l_NewPage_0;
                local l_l_NewPage_0_54 = l_NewPage_0;
                local v514, v515, v516 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v489, v477);
                l_l_NewPage_0_52.LanguageSelectorFrame = v514;
                l_l_NewPage_0_53.LanguageSelectorLabel = v515;
                l_l_NewPage_0_54.LanguageSelectorMode = v516;
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                if v477 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v481);
                else
                    l_l_NewPage_0_52 = v486[v489[v477]];
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v487[l_l_NewPage_0_52].localeCode);
                end;
                l_NewPage_0.LanguageSelectorMode.CurrentLanguage = l_NewPage_0.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                l_l_NewPage_0_52 = function(v517) --[[ Line: 2014 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: l_NewPage_0 (ref), v487 (ref), v480 (ref), v486 (ref), v489 (ref), v144 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v478 (ref), l_LocalPlayer_0 (ref), v481 (ref), v117 (ref), v479 (ref), l_RunService_0 (ref)
                    l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                    local v518 = nil;
                    v518 = if v517 == 1 then v487[v480].id else v487[v486[v489[v517]]].id;
                    local l_CurrentLanguage_0 = l_NewPage_0.LanguageSelectorMode.CurrentLanguage;
                    local v520 = v489[v517];
                    if l_CurrentLanguage_0 ~= v520 then
                        l_NewPage_0.LanguageSelectorMode.CurrentLanguage = v520;
                        v144("experience_language", l_CurrentLanguage_0, v520);
                    end;
                    local v521 = {
                        settingValue = {
                            settingType = "LanguageFamily", 
                            settingTargetId = v518
                        }
                    };
                    local v522 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v523 = l_HttpService_0:RequestInternal({
                        Url = v522, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v521)
                    });
                    local function v527(v524, v525) --[[ Line: 2061 ]] --[[ Name: callback ]]
                        -- upvalues: v478 (ref), v517 (copy), l_LocalPlayer_0 (ref), v481 (ref), v486 (ref), v489 (ref), v487 (ref), v117 (ref), v479 (ref), l_NewPage_0 (ref)
                        if v524 then
                            v478 = v517;
                            if v517 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v481);
                            else
                                local v526 = v486[v489[v517]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v487[v526].localeCode);
                            end;
                        else
                            v117:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v525);
                            v479 = true;
                            l_NewPage_0.LanguageSelectorMode:SetSelectionIndex(v478);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v478 = v517;
                        if v517 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v481);
                        else
                            local v528 = v486[v489[v517]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v487[v528].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v479 then
                        v479 = false;
                        v478 = v517;
                        if v517 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v481);
                        else
                            local v529 = v486[v489[v517]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v487[v529].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    else
                        v523:Start(function(v530, v531) --[[ Line: 2104 ]]
                            -- upvalues: v117 (ref), v522 (copy), v527 (copy)
                            local v532 = false;
                            local v533 = nil;
                            if not v530 then
                                v533 = "User Experience Language Settings Update Request: Connection error";
                            elseif v531.StatusCode == 401 then
                                v533 = "User Experience Language Settings Update Request: Unauthorized";
                            elseif v531.StatusCode < 200 or v531.StatusCode >= 400 then
                                v533 = "User Experience Language Settings Update Request Status Code: " .. v531.StatusCode;
                            else
                                v117:info("User Experience Language Settings Update Request succeeded with code: " .. v531.StatusCode);
                                v532 = true;
                            end;
                            if not v532 then
                                v117:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v522 .. " with error message: " .. v533);
                            end;
                            v527(v532, v533);
                        end);
                        return;
                    end;
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(l_l_NewPage_0_52);
                return;
            end;
        end;
        local function __(v535, v536) --[[ Line: 2139 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
            -- upvalues: v497 (copy), l_HttpService_0 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (copy), v117 (ref), v496 (copy), v534 (copy), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v535 then
                v497:Start(function(v537, v538) --[[ Line: 2141 ]]
                    -- upvalues: l_HttpService_0 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v117 (ref), v496 (ref), v534 (ref)
                    local v539 = false;
                    local v540 = nil;
                    if not v537 then
                        v540 = "User Experience Language Setting Request: Connection error";
                    elseif v538.StatusCode == 401 then
                        v540 = "User Experience Language Setting Request: Unauthorized";
                    elseif v538.StatusCode < 200 or v538.StatusCode >= 400 then
                        v540 = "User Experience Language Setting Request Status code: " .. v538.StatusCode;
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 2152 ]]
                            -- upvalues: l_HttpService_0 (ref), v538 (copy), v484 (ref), v483 (ref), v480 (ref), v488 (ref)
                            local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v538.Body).userUniverseLocalizationSettingValue;
                            if l_userUniverseLocalizationSettingValue_0 == nil then
                                v484 = v483;
                                return;
                            else
                                if l_userUniverseLocalizationSettingValue_0.settingType == "SourceOrTranslation" then
                                    if l_userUniverseLocalizationSettingValue_0.settingTargetId == 1 then
                                        v484 = v480;
                                    else
                                        v484 = v483;
                                    end;
                                end;
                                if l_userUniverseLocalizationSettingValue_0.settingType == "LanguageFamily" then
                                    if v488[l_userUniverseLocalizationSettingValue_0.settingTargetId] == nil then
                                        v484 = v483;
                                        return;
                                    else
                                        v484 = v488[l_userUniverseLocalizationSettingValue_0.settingTargetId];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v539 = l_status_1;
                        v540 = l_result_1;
                    end;
                    if not v539 then
                        v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v540);
                    end;
                    v534(v539, v540);
                end);
                return;
            else
                local l_v536_0 = v536;
                if l_v536_0 == nil then
                    l_v536_0 = "Execution path did not set earliest error to non-nil value.";
                end;
                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v536_0);
                local l_l_NewPage_0_55 = l_NewPage_0;
                local l_l_NewPage_0_56 = l_NewPage_0;
                local l_l_NewPage_0_57 = l_NewPage_0;
                local v548, v549, v550 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v78
                }, 1);
                l_l_NewPage_0_55.LanguageSelectorFrame = v548;
                l_l_NewPage_0_56.LanguageSelectorLabel = v549;
                l_l_NewPage_0_57.LanguageSelectorMode = v550;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            end;
        end;
        local function __(v552, v553) --[[ Line: 2201 ]] --[[ Name: experienceSourceLanguageCallback ]]
            -- upvalues: v495 (copy), l_HttpService_0 (ref), v485 (copy), v117 (ref), v494 (copy), v497 (copy), v484 (ref), v483 (ref), v480 (ref), v488 (copy), v496 (copy), v534 (copy), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v552 then
                v495:Start(function(v554, v555) --[[ Line: 2203 ]]
                    -- upvalues: l_HttpService_0 (ref), v485 (ref), v117 (ref), v494 (ref), v553 (ref), v552 (copy), v497 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v496 (ref), v534 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v556 = false;
                    local v557 = nil;
                    if not v554 then
                        v557 = "Experience Supported Language Request: Connection error";
                    elseif v555.StatusCode == 401 then
                        v557 = "Experience Supported Language Request: Unauthorized";
                    elseif v555.StatusCode < 200 or v555.StatusCode >= 400 then
                        v557 = "Experience Supported Language Request Status code: " .. v555.StatusCode;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 2213 ]]
                            -- upvalues: l_HttpService_0 (ref), v555 (copy), v485 (ref)
                            local v558 = l_HttpService_0:JSONDecode(v555.Body);
                            for v559, v560 in pairs(v558.data) do
                                v485[v559] = v560.languageCode;
                            end;
                        end);
                        v556 = l_status_2;
                        v557 = l_result_2;
                    end;
                    if not v556 then
                        v117:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v494 .. " with error message: " .. v557);
                    end;
                    if v553 == nil then
                        v553 = v557;
                    end;
                    local v563 = v556 and v552;
                    local l_v553_0 = v553;
                    if v563 then
                        v497:Start(function(v565, v566) --[[ Line: 2141 ]]
                            -- upvalues: l_HttpService_0 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v117 (ref), v496 (ref), v534 (ref)
                            local v567 = false;
                            local v568 = nil;
                            if not v565 then
                                v568 = "User Experience Language Setting Request: Connection error";
                            elseif v566.StatusCode == 401 then
                                v568 = "User Experience Language Setting Request: Unauthorized";
                            elseif v566.StatusCode < 200 or v566.StatusCode >= 400 then
                                v568 = "User Experience Language Setting Request Status code: " .. v566.StatusCode;
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 2152 ]]
                                    -- upvalues: l_HttpService_0 (ref), v566 (copy), v484 (ref), v483 (ref), v480 (ref), v488 (ref)
                                    local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v566.Body).userUniverseLocalizationSettingValue;
                                    if l_userUniverseLocalizationSettingValue_1 == nil then
                                        v484 = v483;
                                        return;
                                    else
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "SourceOrTranslation" then
                                            if l_userUniverseLocalizationSettingValue_1.settingTargetId == 1 then
                                                v484 = v480;
                                            else
                                                v484 = v483;
                                            end;
                                        end;
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "LanguageFamily" then
                                            if v488[l_userUniverseLocalizationSettingValue_1.settingTargetId] == nil then
                                                v484 = v483;
                                                return;
                                            else
                                                v484 = v488[l_userUniverseLocalizationSettingValue_1.settingTargetId];
                                            end;
                                        end;
                                        return;
                                    end;
                                end);
                                v567 = l_status_3;
                                v568 = l_result_3;
                            end;
                            if not v567 then
                                v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v568);
                            end;
                            v534(v567, v568);
                        end);
                        return;
                    else
                        local l_l_v553_0_0 = l_v553_0;
                        if l_l_v553_0_0 == nil then
                            l_l_v553_0_0 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v553_0_0);
                        local l_l_NewPage_0_58 = l_NewPage_0;
                        local l_l_NewPage_0_59 = l_NewPage_0;
                        local l_l_NewPage_0_60 = l_NewPage_0;
                        local v576, v577, v578 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v78
                        }, 1);
                        l_l_NewPage_0_58.LanguageSelectorFrame = v576;
                        l_l_NewPage_0_59.LanguageSelectorLabel = v577;
                        l_l_NewPage_0_60.LanguageSelectorMode = v578;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                        return;
                    end;
                end);
            else
                local l_v553_1 = v553;
                if l_v553_1 == nil then
                    l_v553_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v553_1);
                local l_l_NewPage_0_61 = l_NewPage_0;
                local l_l_NewPage_0_62 = l_NewPage_0;
                local l_l_NewPage_0_63 = l_NewPage_0;
                local v583, v584, v585 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v78
                }, 1);
                l_l_NewPage_0_61.LanguageSelectorFrame = v583;
                l_l_NewPage_0_62.LanguageSelectorLabel = v584;
                l_l_NewPage_0_63.LanguageSelectorMode = v585;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
            end;
        end;
        local function __(v587, v588) --[[ Line: 2242 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
            -- upvalues: v493 (copy), l_HttpService_0 (ref), v480 (ref), v481 (ref), v487 (copy), v117 (ref), v492 (copy), v495 (copy), v485 (copy), v494 (copy), v497 (copy), v484 (ref), v483 (ref), v488 (copy), v496 (copy), v534 (copy), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v587 then
                v493:Start(function(v589, v590) --[[ Line: 2244 ]]
                    -- upvalues: l_HttpService_0 (ref), v480 (ref), v481 (ref), v487 (ref), v117 (ref), v492 (ref), v588 (ref), v587 (copy), v495 (ref), v485 (ref), v494 (ref), v497 (ref), v484 (ref), v483 (ref), v488 (ref), v496 (ref), v534 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v591 = false;
                    local v592 = nil;
                    if not v589 then
                        v592 = "Experience Source Language Request: Connection error";
                    elseif v590.StatusCode == 401 then
                        v592 = "Experience Source Language Request: Unauthorized";
                    elseif v590.StatusCode < 200 or v590.StatusCode >= 400 then
                        v592 = "Experience Source Language Status code: " .. v590.StatusCode;
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 2255 ]]
                            -- upvalues: l_HttpService_0 (ref), v590 (copy), v480 (ref), v481 (ref), v487 (ref)
                            v480 = l_HttpService_0:JSONDecode(v590.Body).languageCode;
                            v481 = v487[v480].localeCode;
                        end);
                        v591 = l_status_4;
                        v592 = l_result_4;
                    end;
                    if not v591 then
                        v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v492 .. " with error message: " .. v592);
                    end;
                    if v588 == nil then
                        v588 = v592;
                    end;
                    local v595 = v591 and v587;
                    local l_v588_0 = v588;
                    if v595 then
                        v495:Start(function(v597, v598) --[[ Line: 2203 ]]
                            -- upvalues: l_HttpService_0 (ref), v485 (ref), v117 (ref), v494 (ref), l_v588_0 (ref), v595 (copy), v497 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v496 (ref), v534 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v599 = false;
                            local v600 = nil;
                            if not v597 then
                                v600 = "Experience Supported Language Request: Connection error";
                            elseif v598.StatusCode == 401 then
                                v600 = "Experience Supported Language Request: Unauthorized";
                            elseif v598.StatusCode < 200 or v598.StatusCode >= 400 then
                                v600 = "Experience Supported Language Request Status code: " .. v598.StatusCode;
                            else
                                local l_status_5, l_result_5 = pcall(function() --[[ Line: 2213 ]]
                                    -- upvalues: l_HttpService_0 (ref), v598 (copy), v485 (ref)
                                    local v601 = l_HttpService_0:JSONDecode(v598.Body);
                                    for v602, v603 in pairs(v601.data) do
                                        v485[v602] = v603.languageCode;
                                    end;
                                end);
                                v599 = l_status_5;
                                v600 = l_result_5;
                            end;
                            if not v599 then
                                v117:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v494 .. " with error message: " .. v600);
                            end;
                            if l_v588_0 == nil then
                                l_v588_0 = v600;
                            end;
                            local v606 = v599 and v595;
                            local l_l_v588_0_0 = l_v588_0;
                            if v606 then
                                v497:Start(function(v608, v609) --[[ Line: 2141 ]]
                                    -- upvalues: l_HttpService_0 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v117 (ref), v496 (ref), v534 (ref)
                                    local v610 = false;
                                    local v611 = nil;
                                    if not v608 then
                                        v611 = "User Experience Language Setting Request: Connection error";
                                    elseif v609.StatusCode == 401 then
                                        v611 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v609.StatusCode < 200 or v609.StatusCode >= 400 then
                                        v611 = "User Experience Language Setting Request Status code: " .. v609.StatusCode;
                                    else
                                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2152 ]]
                                            -- upvalues: l_HttpService_0 (ref), v609 (copy), v484 (ref), v483 (ref), v480 (ref), v488 (ref)
                                            local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v609.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_2 == nil then
                                                v484 = v483;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_2.settingTargetId == 1 then
                                                        v484 = v480;
                                                    else
                                                        v484 = v483;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "LanguageFamily" then
                                                    if v488[l_userUniverseLocalizationSettingValue_2.settingTargetId] == nil then
                                                        v484 = v483;
                                                        return;
                                                    else
                                                        v484 = v488[l_userUniverseLocalizationSettingValue_2.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v610 = l_status_6;
                                        v611 = l_result_6;
                                    end;
                                    if not v610 then
                                        v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v611);
                                    end;
                                    v534(v610, v611);
                                end);
                                return;
                            else
                                local l_l_l_v588_0_0_0 = l_l_v588_0_0;
                                if l_l_l_v588_0_0_0 == nil then
                                    l_l_l_v588_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v588_0_0_0);
                                local l_l_NewPage_0_64 = l_NewPage_0;
                                local l_l_NewPage_0_65 = l_NewPage_0;
                                local l_l_NewPage_0_66 = l_NewPage_0;
                                local v619, v620, v621 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v78
                                }, 1);
                                l_l_NewPage_0_64.LanguageSelectorFrame = v619;
                                l_l_NewPage_0_65.LanguageSelectorLabel = v620;
                                l_l_NewPage_0_66.LanguageSelectorMode = v621;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_v588_0_1 = l_v588_0;
                        if l_l_v588_0_1 == nil then
                            l_l_v588_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v588_0_1);
                        local l_l_NewPage_0_67 = l_NewPage_0;
                        local l_l_NewPage_0_68 = l_NewPage_0;
                        local l_l_NewPage_0_69 = l_NewPage_0;
                        local v626, v627, v628 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v78
                        }, 1);
                        l_l_NewPage_0_67.LanguageSelectorFrame = v626;
                        l_l_NewPage_0_68.LanguageSelectorLabel = v627;
                        l_l_NewPage_0_69.LanguageSelectorMode = v628;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_v588_1 = v588;
                if l_v588_1 == nil then
                    l_v588_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v588_1);
                local l_l_NewPage_0_70 = l_NewPage_0;
                local l_l_NewPage_0_71 = l_NewPage_0;
                local l_l_NewPage_0_72 = l_NewPage_0;
                local v633, v634, v635 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v78
                }, 1);
                l_l_NewPage_0_70.LanguageSelectorFrame = v633;
                l_l_NewPage_0_71.LanguageSelectorLabel = v634;
                l_l_NewPage_0_72.LanguageSelectorMode = v635;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 2 ]]
            end;
        end;
        v491:Start(function(v637, v638) --[[ Line: 2286 ]]
            -- upvalues: l_HttpService_0 (ref), v487 (copy), v488 (copy), v486 (copy), l_LocaleId_0 (copy), v483 (ref), v117 (ref), v490 (copy), v493 (copy), v480 (ref), v481 (ref), v492 (copy), v495 (copy), v485 (copy), v494 (copy), v497 (copy), v484 (ref), v496 (copy), v534 (copy), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local v639 = false;
            local v640 = nil;
            if not v637 then
                v640 = "Locale Code to Language Code Mapping Request: Connection error";
            elseif v638.StatusCode == 401 then
                v640 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif v638.StatusCode < 200 or v638.StatusCode >= 400 then
                v640 = "Locale Code to Language Code Mapping Request Status code: " .. v638.StatusCode;
            else
                local l_status_7, l_result_7 = pcall(function() --[[ Line: 2297 ]]
                    -- upvalues: l_HttpService_0 (ref), v638 (copy), v487 (ref), v488 (ref), v486 (ref), l_LocaleId_0 (ref), v483 (ref)
                    local v641 = l_HttpService_0:JSONDecode(v638.Body);
                    for __, v643 in pairs(v641.data) do
                        local l_languageCode_0 = v643.locale.language.languageCode;
                        local l_locale_0 = v643.locale.locale;
                        local l_name_0 = v643.locale.language.name;
                        local l_id_0 = v643.locale.language.id;
                        v487[l_languageCode_0] = {
                            localeCode = l_locale_0, 
                            languageName = l_name_0, 
                            id = l_id_0
                        };
                        v488[l_id_0] = l_languageCode_0;
                        v486[l_name_0] = l_languageCode_0;
                        if v643.locale.locale == l_LocaleId_0:gsub("-", "_") then
                            v483 = v643.locale.language.languageCode;
                        end;
                    end;
                end);
                v639 = l_status_7;
                v640 = l_result_7;
            end;
            if not v639 then
                v117:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v490 .. " with error message: " .. v640);
            end;
            local l_v639_0 = v639;
            local l_v640_0 = v640;
            if l_v639_0 then
                v493:Start(function(v652, v653) --[[ Line: 2244 ]]
                    -- upvalues: l_HttpService_0 (ref), v480 (ref), v481 (ref), v487 (ref), v117 (ref), v492 (ref), l_v640_0 (ref), l_v639_0 (copy), v495 (ref), v485 (ref), v494 (ref), v497 (ref), v484 (ref), v483 (ref), v488 (ref), v496 (ref), v534 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v654 = false;
                    local v655 = nil;
                    if not v652 then
                        v655 = "Experience Source Language Request: Connection error";
                    elseif v653.StatusCode == 401 then
                        v655 = "Experience Source Language Request: Unauthorized";
                    elseif v653.StatusCode < 200 or v653.StatusCode >= 400 then
                        v655 = "Experience Source Language Status code: " .. v653.StatusCode;
                    else
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 2255 ]]
                            -- upvalues: l_HttpService_0 (ref), v653 (copy), v480 (ref), v481 (ref), v487 (ref)
                            v480 = l_HttpService_0:JSONDecode(v653.Body).languageCode;
                            v481 = v487[v480].localeCode;
                        end);
                        v654 = l_status_8;
                        v655 = l_result_8;
                    end;
                    if not v654 then
                        v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v492 .. " with error message: " .. v655);
                    end;
                    if l_v640_0 == nil then
                        l_v640_0 = v655;
                    end;
                    local v658 = v654 and l_v639_0;
                    local l_l_v640_0_0 = l_v640_0;
                    if v658 then
                        v495:Start(function(v660, v661) --[[ Line: 2203 ]]
                            -- upvalues: l_HttpService_0 (ref), v485 (ref), v117 (ref), v494 (ref), l_l_v640_0_0 (ref), v658 (copy), v497 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v496 (ref), v534 (ref), l_NewPage_0 (ref), v95 (ref), v65 (ref), v78 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v662 = false;
                            local v663 = nil;
                            if not v660 then
                                v663 = "Experience Supported Language Request: Connection error";
                            elseif v661.StatusCode == 401 then
                                v663 = "Experience Supported Language Request: Unauthorized";
                            elseif v661.StatusCode < 200 or v661.StatusCode >= 400 then
                                v663 = "Experience Supported Language Request Status code: " .. v661.StatusCode;
                            else
                                local l_status_9, l_result_9 = pcall(function() --[[ Line: 2213 ]]
                                    -- upvalues: l_HttpService_0 (ref), v661 (copy), v485 (ref)
                                    local v664 = l_HttpService_0:JSONDecode(v661.Body);
                                    for v665, v666 in pairs(v664.data) do
                                        v485[v665] = v666.languageCode;
                                    end;
                                end);
                                v662 = l_status_9;
                                v663 = l_result_9;
                            end;
                            if not v662 then
                                v117:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v494 .. " with error message: " .. v663);
                            end;
                            if l_l_v640_0_0 == nil then
                                l_l_v640_0_0 = v663;
                            end;
                            local v669 = v662 and v658;
                            local l_l_l_v640_0_0_0 = l_l_v640_0_0;
                            if v669 then
                                v497:Start(function(v671, v672) --[[ Line: 2141 ]]
                                    -- upvalues: l_HttpService_0 (ref), v484 (ref), v483 (ref), v480 (ref), v488 (ref), v117 (ref), v496 (ref), v534 (ref)
                                    local v673 = false;
                                    local v674 = nil;
                                    if not v671 then
                                        v674 = "User Experience Language Setting Request: Connection error";
                                    elseif v672.StatusCode == 401 then
                                        v674 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v672.StatusCode < 200 or v672.StatusCode >= 400 then
                                        v674 = "User Experience Language Setting Request Status code: " .. v672.StatusCode;
                                    else
                                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2152 ]]
                                            -- upvalues: l_HttpService_0 (ref), v672 (copy), v484 (ref), v483 (ref), v480 (ref), v488 (ref)
                                            local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v672.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_3 == nil then
                                                v484 = v483;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_3.settingTargetId == 1 then
                                                        v484 = v480;
                                                    else
                                                        v484 = v483;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "LanguageFamily" then
                                                    if v488[l_userUniverseLocalizationSettingValue_3.settingTargetId] == nil then
                                                        v484 = v483;
                                                        return;
                                                    else
                                                        v484 = v488[l_userUniverseLocalizationSettingValue_3.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v673 = l_status_10;
                                        v674 = l_result_10;
                                    end;
                                    if not v673 then
                                        v117:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v674);
                                    end;
                                    v534(v673, v674);
                                end);
                                return;
                            else
                                local l_l_l_l_v640_0_0_0_0 = l_l_l_v640_0_0_0;
                                if l_l_l_l_v640_0_0_0_0 == nil then
                                    l_l_l_l_v640_0_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_l_v640_0_0_0_0);
                                local l_l_NewPage_0_73 = l_NewPage_0;
                                local l_l_NewPage_0_74 = l_NewPage_0;
                                local l_l_NewPage_0_75 = l_NewPage_0;
                                local v682, v683, v684 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v78
                                }, 1);
                                l_l_NewPage_0_73.LanguageSelectorFrame = v682;
                                l_l_NewPage_0_74.LanguageSelectorLabel = v683;
                                l_l_NewPage_0_75.LanguageSelectorMode = v684;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_l_v640_0_0_1 = l_l_v640_0_0;
                        if l_l_l_v640_0_0_1 == nil then
                            l_l_l_v640_0_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v640_0_0_1);
                        local l_l_NewPage_0_76 = l_NewPage_0;
                        local l_l_NewPage_0_77 = l_NewPage_0;
                        local l_l_NewPage_0_78 = l_NewPage_0;
                        local v689, v690, v691 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v78
                        }, 1);
                        l_l_NewPage_0_76.LanguageSelectorFrame = v689;
                        l_l_NewPage_0_77.LanguageSelectorLabel = v690;
                        l_l_NewPage_0_78.LanguageSelectorMode = v691;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_l_v640_0_1 = l_v640_0;
                if l_l_v640_0_1 == nil then
                    l_l_v640_0_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v117:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v640_0_1);
                local l_l_NewPage_0_79 = l_NewPage_0;
                local l_l_NewPage_0_80 = l_NewPage_0;
                local l_l_NewPage_0_81 = l_NewPage_0;
                local v696, v697, v698 = v95:AddNewRow(l_NewPage_0, v65:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v78
                }, 1);
                l_l_NewPage_0_79.LanguageSelectorFrame = v696;
                l_l_NewPage_0_80.LanguageSelectorLabel = v697;
                l_l_NewPage_0_81.LanguageSelectorMode = v698;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 6 ]]
            end;
        end);
    end;
    local function v704(v700) --[[ Line: 2336 ]] --[[ Name: getChatTranslationLayerData ]]
        -- upvalues: v89 (ref), l_IXPServiceWrapper_0 (ref), v91 (ref)
        local v701 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v700 or v700 == "" then
            return v701;
        elseif v700 == "override" then
            v701.ChatTranslationEnabled = true;
            return v701;
        else
            if v89() then
                l_IXPServiceWrapper_0:WaitForInitialization();
            end;
            local l_status_11, l_result_11 = pcall(function() --[[ Line: 2358 ]]
                -- upvalues: l_IXPServiceWrapper_0 (ref), v700 (copy)
                return l_IXPServiceWrapper_0:GetLayerData(v700);
            end);
            if l_status_11 then
                if v91() then
                    v701.ChatTranslationEnabled = l_result_11.ChatTranslationEnabled or true;
                    v701.ChatTranslationToggleEnabled = l_result_11.ChatTranslationToggleEnabled or false;
                    return v701;
                else
                    v701.ChatTranslationEnabled = l_result_11.chatTranslationEnabled or false;
                    v701.ChatTranslationToggleEnabled = l_result_11.chatTranslationToggleEnabled or false;
                end;
            end;
            return v701;
        end;
    end;
    local function v715() --[[ Line: 2376 ]] --[[ Name: createVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v705 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_82 = l_NewPage_0;
        local l_l_NewPage_0_83 = l_NewPage_0;
        local l_l_NewPage_0_84 = l_NewPage_0;
        local v709, v710, v711 = v95:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v705);
        l_l_NewPage_0_82.VolumeFrame = v709;
        l_l_NewPage_0_83.VolumeLabel = v710;
        l_l_NewPage_0_84.VolumeSlider = v711;
        l_NewPage_0.VolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VolumeFrame;
        l_l_NewPage_0_82 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_82.Name = "VolumeChangeSound";
        l_l_NewPage_0_82.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v712) --[[ Line: 2387 ]]
            -- upvalues: v126 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_82 (copy), v144 (ref), v149 (ref)
            local v713 = nil;
            if v126() then
                v713 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v714 = v712 / 10;
            l_l_NewPage_0_82.Volume = v714;
            l_l_NewPage_0_82:Play();
            l_GameSettings_0.MasterVolume = v714;
            if v126() then
                v144("volume", v713, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v149();
        end);
    end;
    local function v725() --[[ Line: 2405 ]] --[[ Name: createPartyVoiceVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), l_default_3 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v716 = math.floor(l_GameSettings_0.PartyVoiceVolume * 10);
        local l_l_NewPage_0_85 = l_NewPage_0;
        local l_l_NewPage_0_86 = l_NewPage_0;
        local l_l_NewPage_0_87 = l_NewPage_0;
        local v720, v721, v722 = v95:AddNewRow(l_NewPage_0, "Party Voice Volume", "Slider", 10, v716);
        l_l_NewPage_0_85.PartyVoiceVolumeFrame = v720;
        l_l_NewPage_0_86.PartyVoiceVolumeLabel = v721;
        l_l_NewPage_0_87.PartyVoiceVolumeSlider = v722;
        l_NewPage_0.PartyVoiceVolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PartyVoiceVolumeFrame;
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            l_NewPage_0.PartyVoiceVolumeFrame.Visible = l_default_3.hasExperienceStarted;
            l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 2414 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = true;
            end);
            l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 2417 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = false;
            end);
        end;
        l_NewPage_0.PartyVoiceVolumeSlider.ValueChanged:connect(function(v723) --[[ Line: 2422 ]]
            -- upvalues: v126 (ref), v716 (copy), l_GameSettings_0 (ref), v144 (ref), v149 (ref)
            local v724 = nil;
            if v126() then
                v724 = if v716 ~= nil then math.floor(v716 * 10 + 0.5) else 0;
            end;
            l_GameSettings_0.PartyVoiceVolume = v723 / 10;
            if v126() then
                v144("party_voice_volume", v724, (math.floor(v723 * 10 + 0.5)));
            end;
            v149();
        end);
    end;
    local function v735() --[[ Line: 2438 ]] --[[ Name: createHapticsToggle ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_getAppFeaturePolicies_0 (ref), v24 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v726 = l_GameSettings_0.HapticStrength == 0 and 1 or 2;
        local v727 = if v62 and l_getAppFeaturePolicies_0().getShouldUseVibrationInsteadOfHaptics() then v24:Format("CoreScripts.InGameMenu.Vibration") else "Haptics";
        local l_l_NewPage_0_88 = l_NewPage_0;
        local l_l_NewPage_0_89 = l_NewPage_0;
        local v730, v731, v732 = v95:AddNewRow(l_NewPage_0, v727, "Selector", {
            "Off", 
            "On"
        }, v726);
        l_l_NewPage_0_88.HapticsFrame = v730;
        _ = v731;
        l_l_NewPage_0_89.HapticsSelector = v732;
        l_NewPage_0.HapticsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.HapticsFrame;
        l_NewPage_0.HapticsSelector.IndexChanged:connect(function(v733) --[[ Line: 2447 ]]
            -- upvalues: l_GameSettings_0 (ref), v126 (ref), v144 (ref), v149 (ref)
            local l_HapticStrength_0 = l_GameSettings_0.HapticStrength;
            if v733 == 2 then
                l_GameSettings_0.HapticStrength = 1;
            else
                l_GameSettings_0.HapticStrength = 0;
            end;
            if v126() then
                v144("haptics_toggle", l_HapticStrength_0, l_GameSettings_0.HapticStrength);
            end;
            v149();
        end);
    end;
    local function v744() --[[ Line: 2463 ]] --[[ Name: createCameraInvertedOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v160 (copy), v126 (ref), v144 (ref), v149 (ref)
        local v736 = 1;
        if pcall(function() --[[ Line: 2465 ]]
            -- upvalues: l_GameSettings_0 (ref), v736 (ref)
            if l_GameSettings_0.CameraYInverted == true then
                v736 = 2;
            end;
        end) == false then
            return;
        else
            local l_l_NewPage_0_90 = l_NewPage_0;
            local l_l_NewPage_0_91 = l_NewPage_0;
            local v739, v740, v741 = v95:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v736);
            l_l_NewPage_0_90.CameraInvertedFrame = v739;
            _ = v740;
            l_l_NewPage_0_91.CameraInvertedSelector = v741;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraInvertedFrame;
            v160[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v742) --[[ Line: 2480 ]]
                -- upvalues: v126 (ref), l_GameSettings_0 (ref), v144 (ref), v149 (ref)
                local v743 = nil;
                if v126() then
                    v743 = l_GameSettings_0.CameraYInverted;
                end;
                if v742 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v126() then
                    v144("camera_y_inverted", v743, l_GameSettings_0.CameraYInverted);
                end;
                v149();
            end);
            return;
        end;
    end;
    local function v749(v745) --[[ Line: 2499 ]] --[[ Name: setCameraSensitivity ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v126 (ref), v144 (ref), v149 (ref)
        local v746 = nil;
        local v747 = nil;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            if v126() then
                v746 = "gamepad";
                v747 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v745;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v126() then
                v746 = "mouse";
                v747 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v748 = Vector2.new(v745, v745);
            l_GameSettings_0.MouseSensitivityFirstPerson = v748;
            l_GameSettings_0.MouseSensitivityThirdPerson = v748;
        end;
        if v126() and typeof(v747) == "number" and typeof(v745) == "number" then
            v144("camera_sensitivity", tonumber(string.format("%.2f", v747)), tonumber(string.format("%.2f", v745)), {
                sensitivity_type = v746
            });
        end;
        v149();
    end;
    local function v777() --[[ Line: 2537 ]] --[[ Name: createMouseOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v160 (copy), l_Create_0 (ref), v99 (ref), v749 (copy)
        local function __(v750) --[[ Line: 2542 ]] --[[ Name: translateEngineMouseSensitivityToGui ]]
            local v751 = v750 <= 1 and math.floor((v750 - 0.2) / 0.16 + 0.5) or math.floor((v750 + 2) / 0.6 + 0.5);
            if v750 <= 0.2 then
                return 0;
            else
                return v751;
            end;
        end;
        local function __(v753) --[[ Line: 2550 ]] --[[ Name: translateGuiMouseSensitivityToEngine ]]
            local v754 = v753 <= 5 and 0.16 * v753 + 0.2 or 0.6 * v753 - 2;
            if v754 <= 0.2 then
                return 0.2;
            else
                return v754;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v757 = l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5);
        local v758 = l_MouseSensitivity_0 <= 0.2 and 0 or v757;
        l_MouseSensitivity_0 = true;
        v757 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_92 = l_NewPage_0;
        local l_l_NewPage_0_93 = l_NewPage_0;
        local l_l_NewPage_0_94 = l_NewPage_0;
        local v762, v763, v764 = v95:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v758);
        l_l_NewPage_0_92.MouseAdvancedFrame = v762;
        l_l_NewPage_0_93.MouseAdvancedLabel = v763;
        l_l_NewPage_0_94.MouseAdvancedEntry = v764;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MouseAdvancedFrame;
        v160[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_92 = l_Create_0("TextBox")({
            Name = "CameraSensitivityTextBox", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(0.8, 0.8, 0.8), 
            BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
            Font = v99.font(Enum.Font.SourceSans), 
            TextSize = v99.textSize(18), 
            Size = UDim2.new(0, 60, 0.8, 0), 
            Position = UDim2.new(1, 10, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 3, 
            Selectable = false, 
            Parent = l_NewPage_0.MouseAdvancedEntry.SliderFrame, 
            BorderSizePixel = 0
        });
        l_Create_0("UICorner")({
            CornerRadius = v99.DefaultCornerRadius, 
            Parent = l_l_NewPage_0_92
        });
        l_l_NewPage_0_93 = function(v765) --[[ Line: 2609 ]] --[[ Name: setMouseSensitivityText ]]
            -- upvalues: l_l_NewPage_0_92 (copy)
            v765 = math.floor(v765 * 1000 + 0.5) / 1000;
            l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v765)))));
        end;
        l_l_NewPage_0_94 = math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000;
        l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", l_l_NewPage_0_94)))));
        l_l_NewPage_0_94 = l_NewPage_0.MouseAdvancedEntry;
        v764 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        local v766 = v764 <= 1 and math.floor((v764 - 0.2) / 0.16 + 0.5) or math.floor((v764 + 2) / 0.6 + 0.5);
        l_l_NewPage_0_94:SetValue(v764 <= 0.2 and 0 or v766);
        clampMouseSensitivity = function(v767) --[[ Line: 2624 ]] --[[ Name: clampMouseSensitivity ]]
            if v767 < 0 then
                v767 = -v767;
            end;
            if v767 > 100 then
                return 100;
            else
                if v767 < 0.001 then
                    v767 = 0.001;
                end;
                return v767;
            end;
        end;
        setMouseSensitivity = function(v768, v769) --[[ Line: 2642 ]] --[[ Name: setMouseSensitivity ]]
            -- upvalues: l_MouseSensitivity_0 (ref), v749 (ref), l_NewPage_0 (ref), l_l_NewPage_0_92 (copy)
            if not l_MouseSensitivity_0 then
                return;
            else
                v749(v768);
                l_MouseSensitivity_0 = false;
                if v769 ~= l_NewPage_0.MouseAdvancedEntry then
                    local l_MouseAdvancedEntry_0 = l_NewPage_0.MouseAdvancedEntry;
                    local v771 = v768 <= 1 and math.floor((v768 - 0.2) / 0.16 + 0.5) or math.floor((v768 + 2) / 0.6 + 0.5);
                    l_MouseAdvancedEntry_0:SetValue(v768 <= 0.2 and 0 or v771);
                end;
                local v772 = math.floor(v768 * 1000 + 0.5) / 1000;
                l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v772)))));
                l_MouseSensitivity_0 = true;
                return;
            end;
        end;
        l_l_NewPage_0_92.FocusLost:connect(function() --[[ Line: 2660 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_92 (copy), l_GameSettings_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v773 = tonumber((string.match(l_l_NewPage_0_92.Text, "([%d%.]+)")));
            if v773 then
                setMouseSensitivity(clampMouseSensitivity(v773), l_l_NewPage_0_92);
                return;
            else
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_92);
                return;
            end;
        end);
        l_l_NewPage_0_92.Focused:connect(function() --[[ Line: 2672 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v774) --[[ Line: 2676 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v775 = clampMouseSensitivity(v774);
            local v776 = v775 <= 5 and 0.16 * v775 + 0.2 or 0.6 * v775 - 2;
            v774 = v776 <= 0.2 and 0.2 or v776;
            setMouseSensitivity(v774, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v794() --[[ Line: 2683 ]] --[[ Name: createGamepadOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v749 (copy)
        local function __(v778) --[[ Line: 2688 ]] --[[ Name: translateEngineGamepadSensitivityToGui ]]
            local v779 = v778 <= 1 and math.floor((v778 - 0.2) / 0.16 + 0.5) or math.floor((v778 + 2) / 0.6 + 0.5);
            if v778 <= 0.2 then
                return 0;
            else
                return v779;
            end;
        end;
        local function __(v781) --[[ Line: 2695 ]] --[[ Name: translateGuiGamepadSensitivityToEngine ]]
            local v782 = v781 <= 5 and 0.16 * v781 + 0.2 or 0.6 * v781 - 2;
            if v782 <= 0.2 then
                return 0.2;
            else
                return v782;
            end;
        end;
        local l_GamepadCameraSensitivity_1 = l_GameSettings_0.GamepadCameraSensitivity;
        local v785 = l_GamepadCameraSensitivity_1 <= 1 and math.floor((l_GamepadCameraSensitivity_1 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_1 + 2) / 0.6 + 0.5);
        local v786 = l_GamepadCameraSensitivity_1 <= 0.2 and 0 or v785;
        l_GamepadCameraSensitivity_1 = l_NewPage_0;
        v785 = l_NewPage_0;
        local l_l_NewPage_0_95 = l_NewPage_0;
        local v788, v789, v790 = v95:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v786);
        l_GamepadCameraSensitivity_1.GamepadSensitivityFrame = v788;
        v785.GamepadSensitivityLabel = v789;
        l_l_NewPage_0_95.GamepadSensitivitySlider = v790;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v791) --[[ Line: 2710 ]]
            -- upvalues: v749 (ref)
            local l_v749_0 = v749;
            local v793 = v791 <= 5 and 0.16 * v791 + 0.2 or 0.6 * v791 - 2;
            l_v749_0(v793 <= 0.2 and 0.2 or v793);
        end);
    end;
    local function v806() --[[ Line: 2715 ]] --[[ Name: createOverscanOption ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref), v95 (ref), l_NewPage_0 (copy), v99 (ref), l_RunService_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local function v801() --[[ Line: 2716 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref)
            local v795 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v796 = nil;
            v796 = require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan);
            v796 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)(v796);
            local v797 = require(l_CorePackages_0.Packages.Roact);
            local v798 = nil;
            local v799 = {
                onUnmount = function() --[[ Line: 2727 ]]
                    -- upvalues: v798 (ref), v797 (copy), l_ContextActionService_0 (ref), v795 (copy)
                    if v798 then
                        v797.unmount(v798);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v795:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v795:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function() --[[ Line: 2743 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local v800 = nil;
            v800 = v797.createElement(v796, v799);
            v798 = v797.mount(v800, l_RobloxGui_0, (tostring(v796)));
        end;
        local v802, v803, v804 = v95:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v801, l_NewPage_0);
        v803.Font = v99.font(Enum.Font.SourceSans);
        v802.Position = UDim2.new(1, -400, 0, 12);
        v802.Size = UDim2.new(0, 300, 0, 40);
        v802.Position = UDim2.new(1, -400, 0.5, 0);
        v802.AnchorPoint = Vector2.new(0, 0.5);
        if l_RunService_0:IsStudio() then
            v802.Selectable = false;
            v802.Active = false;
            v802.Enabled.Value = false;
            v803.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v805 = v95:AddNewRowObject(l_NewPage_0, "Safe Zone", v802);
        v805.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.OverscanAdjustButton;
        v804(v805);
    end;
    local function v819() --[[ Line: 2782 ]] --[[ Name: createDeveloperConsoleOption ]]
        -- upvalues: v144 (ref), v131 (ref), v95 (ref), l_NewPage_0 (copy), v99 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_RunService_0 (ref), v97 (ref), l_Players_0 (ref)
        local function v818() --[[ Line: 2784 ]] --[[ Name: makeDevConsoleOption ]]
            -- upvalues: v144 (ref), v131 (ref), v95 (ref), l_NewPage_0 (ref), v99 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local function v809() --[[ Line: 2785 ]] --[[ Name: onOpenDevConsole ]]
                -- upvalues: v144 (ref)
                local v807 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v807 then
                    v807:SetVisibility(true);
                    local v808 = require(script.Parent.Parent.SettingsHub);
                    if v808 then
                        v808:SetVisibility(false);
                    end;
                    v144("dev_console", "", "pressed");
                end;
            end;
            if v131 then
                local v810, v811, v812 = v95:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v809, l_NewPage_0);
                v811.Font = v99.font(Enum.Font.SourceSans);
                v810.Size = UDim2.new(0.6, -10, 0, 35);
                v810.Position = UDim2.new(0.4, 10, 0.5, 0);
                v810.AnchorPoint = Vector2.new(0, 0.5);
                local v813 = v95:AddNewRowObject(l_NewPage_0, "Developer Console", v810, nil, true);
                v813.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v812(v813);
                return;
            else
                local v814, v815, v816 = v95:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v809, l_NewPage_0);
                v815.Font = v99.font(Enum.Font.SourceSans);
                v814.Size = UDim2.new(0.6, -10, 0, 35);
                v814.Position = UDim2.new(1, -400, 0.5, 0);
                v814.AnchorPoint = Vector2.new(0, 0.5);
                local v817 = v95:AddNewRowObject(l_NewPage_0, "Developer Console", v814);
                v817.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v816(v817);
                return;
            end;
        end;
        if l_RunService_0:IsStudio() then
            v818();
            return;
        else
            spawn(function() --[[ Line: 2837 ]]
                -- upvalues: v97 (ref), l_Players_0 (ref), v818 (copy)
                if v97.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v818();
                end;
            end);
            return;
        end;
    end;
    local function v848() --[[ Line: 2846 ]] --[[ Name: createUiToggleOptions ]]
        -- upvalues: v130 (ref), v129 (ref), v65 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v130 or v129 then
            local v820 = {
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
            local v821 = v65:FormatByKey("InGame.CommonUI.Label.On");
            local v822 = v65:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v824 in v820 do
                local v825 = v65:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v824.label
                });
                local v826, v827, v828 = v95:AddNewRow(l_NewPage_0, v825, "Selector", {
                    v821, 
                    v822
                }, 1);
                v826.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0[v824.layoutOrderKey];
                v828.IndexChanged:Connect(function(v829) --[[ Line: 2874 ]]
                    -- upvalues: l_GuiService_0 (ref), v824 (copy)
                    if (l_GuiService_0:GetGuiIsVisible(v824.type) and 1 or 2) ~= v829 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v824.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v824.label] = {
                    label = v825, 
                    type = v824.type, 
                    row = v826, 
                    frame = v827, 
                    selector = v828
                };
            end;
            local v830 = v65:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_96 = l_NewPage_0;
            local l_l_NewPage_0_97 = l_NewPage_0;
            local l_l_NewPage_0_98 = l_NewPage_0;
            local v834, v835, v836 = v95:AddNewRow(l_NewPage_0, v830, "Selector", {
                v822, 
                v821
            }, 1);
            l_l_NewPage_0_96.freecamRow = v834;
            l_l_NewPage_0_97.freecamFrame = v835;
            l_l_NewPage_0_98.freecamSelector = v836;
            l_NewPage_0.freecamRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v837) --[[ Line: 2896 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v838 = v837 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if not l_l_LocalPlayer_0_FirstChild_0 then
                    warn("Freecam not present");
                    return;
                else
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v838);
                    return;
                end;
            end);
            return;
        else
            local v840 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_99 = l_NewPage_0;
            local l_l_NewPage_0_100 = l_NewPage_0;
            local l_l_NewPage_0_101 = l_NewPage_0;
            local v844, v845, v846 = v95:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v840, 1);
            l_l_NewPage_0_99.uiToggleRow = v844;
            l_l_NewPage_0_100.uiToggleFrame = v845;
            l_l_NewPage_0_101.uiToggleSelector = v846;
            l_NewPage_0.uiToggleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__) --[[ Line: 2915 ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return;
        end;
    end;
    local function v855() --[[ Line: 2921 ]] --[[ Name: updateUiToggleSelection ]]
        -- upvalues: v130 (ref), v129 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v130 or v129 then
            if not l_NewPage_0.uiToggleSelectors then
                return;
            else
                for __, v850 in l_NewPage_0.uiToggleSelectors do
                    local v851 = l_GuiService_0:GetGuiIsVisible(v850.type) and 1 or 2;
                    if v851 ~= v850.selector:GetSelectedIndex() then
                        v850.selector:SetSelectionIndex(v851);
                    end;
                end;
                local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_1 then
                    local v853 = l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 2 or 1;
                    l_NewPage_0.freecamSelector:SetSelectionIndex(v853);
                    return;
                end;
            end;
        elseif not l_NewPage_0.uiToggleSelector then
            return;
        else
            local v854 = nil;
            v854 = l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2;
            if v854 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                return;
            else
                l_NewPage_0.uiToggleSelector:SetSelectionIndex(v854);
            end;
        end;
    end;
    local function __(v856, v857, v858) --[[ Line: 2963 ]] --[[ Name: isValidDeviceList ]]
        return v856 and v857 and v858 and #v856 > 0 and v858 > 0 and v858 <= #v856 and #v856 == #v857;
    end;
    local function v868(v860) --[[ Line: 2973 ]] --[[ Name: setVCSOutput ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v117 (ref), v17 (ref), v124 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v117:error("setVCSOutput is deprecated");
            return;
        else
            local v861, v862, v863, v864 = pcall(function() --[[ Line: 2979 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v861 and v862 and v863 and v864 and #v862 > 0 and v864 > 0 and v864 <= #v862 and #v862 == #v863 then
                local v865 = 0;
                for v866, v867 in ipairs(v862) do
                    if v867 == v860 then
                        v865 = v866;
                    end;
                end;
                if v865 > 0 then
                    if v124() then
                        v117:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v862[v865], v863[v865]);
                    end;
                    v17:SetSpeakerDevice(v862[v865], v863[v865]);
                    return;
                elseif v124() then
                    v117:warning("Could not find equivalent VoiceChatService Device");
                    return;
                end;
            elseif v124() then
                v117:warning("Could not connect to Voice Chat Service to change Output Device");
            end;
            return;
        end;
    end;
    local function v873() --[[ Line: 3014 ]] --[[ Name: syncSoundOutputs ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v117 (ref), l_SoundService_0 (ref), v868 (copy), v124 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v117:error("syncSoundOutputs is deprecated");
            return;
        else
            local v869, v870, v871, v872 = pcall(function() --[[ Line: 3020 ]]
                -- upvalues: l_SoundService_0 (ref)
                return l_SoundService_0:GetOutputDevices();
            end);
            if v869 and v870 and v871 and v872 and #v870 > 0 and v872 > 0 and v872 <= #v870 and #v870 == #v871 then
                v868(v870[v872]);
                return;
            else
                if v124() then
                    v117:warning("Could not connect to Voice Chat Service to change Output Device");
                end;
                return;
            end;
        end;
    end;
    local function __(v874, v875) --[[ Line: 3035 ]] --[[ Name: SwitchOutputDevice ]]
        -- upvalues: l_SoundService_0 (ref), v117 (ref)
        l_SoundService_0:SetOutputDevice(v874, v875);
        v117:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v874, v875);
    end;
    local function v893(v877) --[[ Line: 3040 ]] --[[ Name: createDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v75 (ref), v65 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), l_default_2 (ref), l_SoundService_0 (ref), v117 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v144 (ref)
        local v878 = l_NewPage_0[v877 .. "DeviceIndex"] or 0;
        local v879 = l_NewPage_0[v877 .. "DeviceNames"] or {};
        local v880 = l_NewPage_0[v877 .. "DeviceGuids"] or {};
        local v881 = v877 == v75.Input and v65:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or v65:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_102 = l_NewPage_0;
        local v883 = v877 .. "DeviceFrame";
        local l_l_NewPage_0_103 = l_NewPage_0;
        local v885 = v877 .. "DeviceSelector";
        local v886, v887, v888 = v95:AddNewRow(l_NewPage_0, v881, "Selector", v879, v878);
        l_l_NewPage_0_102[v883] = v886;
        _ = v887;
        l_l_NewPage_0_103[v885] = v888;
        l_NewPage_0[v877 .. "DeviceFrame"].LayoutOrder = v877 == v75.Input and l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameInput or l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameOutput;
        l_NewPage_0[v877 .. "DeviceInfo"] = {
            Name = v878 > 0 and v879[v878] or nil, 
            Guid = v878 > 0 and v880[v878] or nil
        };
        l_NewPage_0[v877 .. "PrevDeviceName"] = l_NewPage_0[v877 .. "DeviceInfo"].Name;
        l_l_NewPage_0_102 = 0;
        v883 = v123();
        l_NewPage_0[v877 .. "DeviceSelector"].IndexChanged:connect(function(v889) --[[ Line: 3063 ]]
            -- upvalues: l_NewPage_0 (ref), v877 (copy), l_l_NewPage_0_102 (ref), v883 (copy), l_default_2 (ref), l_SoundService_0 (ref), v117 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v75 (ref), l_default_3 (ref), v144 (ref)
            if l_NewPage_0[v877 .. "DeviceInfo"].Name == l_NewPage_0[v877 .. "DeviceNames"][v889] and l_NewPage_0[v877 .. "DeviceInfo"].Guid == l_NewPage_0[v877 .. "DeviceGuids"][v889] then
                return;
            else
                local v890 = l_l_NewPage_0_102 + 1;
                l_l_NewPage_0_102 = v890;
                wait(v883);
                if v890 == l_l_NewPage_0_102 then
                    l_l_NewPage_0_102 = 0;
                    l_NewPage_0[v877 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v877 .. "DeviceNames"][v889], 
                        Guid = l_NewPage_0[v877 .. "DeviceGuids"][v889]
                    };
                    local l_Name_4 = l_NewPage_0[v877 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v877 .. "DeviceInfo"].Guid;
                    if l_NewPage_0.VoiceChatOptionsEnabled then
                        l_default_2:SwitchDevice(v877, l_Name_4, l_Guid_0);
                    else
                        l_SoundService_0:SetOutputDevice(l_Name_4, l_Guid_0);
                        v117:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_4, l_Guid_0);
                    end;
                    if l_GetFFlagEnableCrossExpVoice_0() then
                        v117:debug("[GameSettings] Changing {} device to {} {} ", v877, l_Name_4, l_Guid_0);
                        if v877 == v75.Input then
                            l_default_3:changeInputDevice(l_Name_4, l_Guid_0);
                        else
                            l_default_3:changeOutputDevice(l_Name_4, l_Guid_0);
                        end;
                    end;
                    v144(v877, l_NewPage_0[v877 .. "PrevDeviceName"], l_Name_4);
                    l_NewPage_0[v877 .. "PrevDeviceName"] = l_Name_4;
                end;
                return;
            end;
        end);
    end;
    local function __() --[[ Line: 3105 ]] --[[ Name: createBadgeVisibilityOptions ]]
        -- upvalues: v97 (ref), l_LocalPlayer_0 (ref), v65 (ref), v138 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
        spawn(function() --[[ Line: 3106 ]]
            -- upvalues: v97 (ref), l_LocalPlayer_0 (ref), v65 (ref), v138 (ref), l_NewPage_0 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v894 = 2;
            if v97.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v894 = 1;
            end;
            local v895 = v65:FormatByKey("Feature.SettingsHub.Label.Show");
            local v896 = v65:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v897 = if v138 then v65:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v65:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v898 = v65:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_104 = l_NewPage_0;
            local l_l_NewPage_0_105 = l_NewPage_0;
            local l_l_NewPage_0_106 = l_NewPage_0;
            local v902, v903, v904 = v95:AddNewRow(l_NewPage_0, v897, "Selector", {
                v896, 
                v895
            }, v894, nil, v898);
            l_l_NewPage_0_104.badgeVisibleRow = v902;
            l_l_NewPage_0_105.badgeVisibleFrame = v903;
            l_l_NewPage_0_106.badgeVisibleSelector = v904;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v905) --[[ Line: 3120 ]]
                -- upvalues: l_GameSettings_0 (ref), v97 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v905 == 2;
                v97.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v905 == 1);
            end);
        end);
    end;
    local function v917() --[[ Line: 3127 ]] --[[ Name: createChatModerationOptions ]]
        -- upvalues: l_NewPage_0 (copy), v95 (ref), v24 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_CorePackages_0 (ref), v105 (ref), v61 (ref), v144 (ref)
        local v907 = {
            title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView", 
            description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription", 
            on = "InGame.CommonUI.Label.On", 
            off = "InGame.CommonUI.Label.Off"
        };
        local l_l_NewPage_0_107 = l_NewPage_0;
        local l_l_NewPage_0_108 = l_NewPage_0;
        local v910, v911, v912 = v95:AddNewRow(l_NewPage_0, v24:Format(v907.title), "Selector", {
            v24:Format(v907.off), 
            v24:Format(v907.on)
        }, 1, nil, v24:Format(v907.description));
        l_l_NewPage_0_107.ChatModerationFrame = v910;
        _ = v911;
        l_l_NewPage_0_108.ChatModerationSelector = v912;
        l_NewPage_0.ChatModerationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ChatModerationFrame;
        l_NewPage_0.ChatModerationFrame.Visible = false;
        l_l_NewPage_0_108 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false);
        l_NewPage_0.ChatModerationDisposeEffect = v105.createEffect(function(v913) --[[ Line: 3151 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_108 (copy)
            l_NewPage_0.ChatModerationFrame.Visible = l_l_NewPage_0_108.getIsSettingVisible(v913);
            local v914 = l_l_NewPage_0_108.getIsSettingEnabled(v913) and 2 or 1;
            if l_NewPage_0.ChatModerationSelector:GetSelectedIndex() ~= v914 then
                l_NewPage_0.ChatModerationSelector:SetSelectionIndex(v914);
            end;
        end);
        l_NewPage_0.ChatModerationSelector.IndexChanged:connect(function(v915) --[[ Line: 3160 ]]
            -- upvalues: l_l_NewPage_0_108 (copy), v61 (ref), v144 (ref)
            local v916 = v915 == 2;
            l_l_NewPage_0_108.setIsSettingEnabled(v916);
            if v61 then
                v144("moderate_chat", not v916, v916);
            end;
        end);
        l_l_NewPage_0_108.initialize();
    end;
    local function v929() --[[ Line: 3174 ]] --[[ Name: createCameraDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v116 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v117 (ref), l_UserGameSettings_0 (ref), v144 (ref)
        local v918 = l_NewPage_0.CameraDeviceIndex or 1;
        local v919 = l_NewPage_0.CameraDeviceNames or {};
        local v920 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v116_0 = v116;
        local l_l_NewPage_0_109 = l_NewPage_0;
        local l_l_NewPage_0_110 = l_NewPage_0;
        local v924, v925, v926 = v95:AddNewRow(l_NewPage_0, l_v116_0, "Selector", v919, v918);
        l_l_NewPage_0_109.CameraDeviceFrame = v924;
        _ = v925;
        l_l_NewPage_0_110.CameraDeviceSelector = v926;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v918 > 0 and v919[v918] or nil, 
            Guid = v918 > 0 and v920[v918] or nil
        };
        l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v927) --[[ Line: 3191 ]]
            -- upvalues: l_NewPage_0 (ref), v117 (ref), l_UserGameSettings_0 (ref), v144 (ref)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v927] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v927] then
                return;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v927], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v927]
                };
                local l_Guid_1 = l_NewPage_0.CameraDeviceInfo.Guid;
                v117:info("Changed webcam to: {}", l_Guid_1);
                l_UserGameSettings_0.DefaultCameraID = l_Guid_1;
                v144("video_camera", l_NewPage_0.prevCameraDeviceName or "None", l_NewPage_0.CameraDeviceInfo.Name);
                l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
                return;
            end;
        end);
    end;
    local function v935(v930) --[[ Line: 3216 ]] --[[ Name: updateAudioDevices ]]
        -- upvalues: v75 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v124 (ref), v117 (ref), v893 (copy)
        local v931, v932, v933, v934 = pcall(function() --[[ Line: 3217 ]]
            -- upvalues: v930 (copy), v75 (ref), l_SoundService_0 (ref)
            if v930 == v75.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v931 and v932 and v933 and v934 and #v932 > 0 and v934 > 0 and v934 <= #v932 and #v932 == #v933 then
                if v933[1] == "" then
                    v932[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v932[1] .. ")";
                end;
                l_NewPage_0[v930 .. "DeviceNames"] = v932;
                l_NewPage_0[v930 .. "DeviceGuids"] = v933;
                l_NewPage_0[v930 .. "DeviceIndex"] = v934;
            else
                if v124() then
                    v117:warning("Errors in get {} device info", v930);
                end;
                l_NewPage_0[v930 .. "DeviceNames"] = {};
                l_NewPage_0[v930 .. "DeviceGuids"] = {};
                l_NewPage_0[v930 .. "DeviceIndex"] = 0;
            end;
        elseif v931 and v932 and v933 and v934 and #v932 > 0 and v934 > 0 and v934 <= #v932 and #v932 == #v933 then
            if v933[1] == "" then
                v932[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v932[1] .. ")";
            end;
            l_NewPage_0[v930 .. "DeviceNames"] = v932;
            l_NewPage_0[v930 .. "VCSDeviceNames"] = v932;
            l_NewPage_0[v930 .. "VCSDeviceGuids"] = v933;
            l_NewPage_0[v930 .. "DeviceGuids"] = v933;
            l_NewPage_0[v930 .. "DeviceIndex"] = v934;
        else
            if v124() then
                v117:warning("Errors in get {} device info", v930);
            end;
            l_NewPage_0[v930 .. "DeviceNames"] = {};
            l_NewPage_0[v930 .. "DeviceGuids"] = {};
            l_NewPage_0[v930 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v930 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v930 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v930 .. "DeviceSelector"] then
            v893(v930);
            return;
        else
            l_NewPage_0[v930 .. "DeviceSelector"]:UpdateOptions(v932);
            l_NewPage_0[v930 .. "DeviceSelector"]:SetSelectionIndex(v934);
            return;
        end;
    end;
    local function v945(v936) --[[ Line: 3272 ]] --[[ Name: updateVoiceChatDevices ]]
        -- upvalues: v75 (ref), v124 (ref), v117 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v17 (ref), v893 (copy)
        if v936 ~= v75.Input and v936 ~= v75.Output and v124() then
            v117:warning("{} is not supported in VoiceChat devices", v936);
        end;
        local v937, v938, v939, v940 = pcall(function() --[[ Line: 3279 ]]
            -- upvalues: v936 (copy), v75 (ref), l_SoundService_0 (ref)
            if v936 == v75.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v937 and v938 and v939 and v940 and #v938 > 0 and v940 > 0 and v940 <= #v938 and #v938 == #v939 then
                if v939[1] == "" then
                    v938[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v938[1] .. ")";
                end;
                l_NewPage_0[v936 .. "DeviceNames"] = v938;
                l_NewPage_0[v936 .. "DeviceGuids"] = v939;
                l_NewPage_0[v936 .. "DeviceIndex"] = v940;
            else
                if v124() then
                    if #v938 > 0 then
                        v117:warning("Errors in get {} device info success: {}", v936, v937);
                    else
                        v117:warning("Empty deviceNames list for {}", v936);
                    end;
                end;
                l_NewPage_0[v936 .. "DeviceNames"] = {};
                l_NewPage_0[v936 .. "DeviceGuids"] = {};
                l_NewPage_0[v936 .. "DeviceIndex"] = 0;
            end;
        else
            local v941, v942, v943, v944 = pcall(function() --[[ Line: 3316 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v937 and v941 and v938 and v939 and v940 and #v938 > 0 and v940 > 0 and v940 <= #v938 and #v938 == #v939 and v942 and v943 and v944 and #v942 > 0 and v944 > 0 and v944 <= #v942 and #v942 == #v943 then
                if v939[1] == "" then
                    v938[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v938[1] .. ")";
                end;
                l_NewPage_0[v936 .. "DeviceNames"] = v938;
                l_NewPage_0[v936 .. "VCSDeviceNames"] = v942;
                l_NewPage_0[v936 .. "VCSDeviceGuids"] = v943;
                l_NewPage_0[v936 .. "DeviceGuids"] = v939;
                l_NewPage_0[v936 .. "DeviceIndex"] = v940;
            else
                if v124() then
                    if #v938 > 0 then
                        v117:warning("Errors in get {} device info success: {} VCSSuccess: {}", v936, v937, v941);
                    else
                        v117:warning("Empty deviceNames list for {}", v936);
                    end;
                end;
                l_NewPage_0[v936 .. "DeviceNames"] = {};
                l_NewPage_0[v936 .. "DeviceGuids"] = {};
                l_NewPage_0[v936 .. "VCSDeviceNames"] = {};
                l_NewPage_0[v936 .. "VCSDeviceGuids"] = {};
                l_NewPage_0[v936 .. "DeviceIndex"] = 0;
            end;
        end;
        if not l_NewPage_0[v936 .. "DeviceSelector"] then
            v893(v936);
        else
            l_NewPage_0[v936 .. "DeviceSelector"]:UpdateOptions(v938);
            l_NewPage_0[v936 .. "DeviceSelector"]:SetSelectionIndex(v940);
        end;
        if l_NewPage_0[v936 .. "DeviceFrame"] then
            if #v938 > 0 then
                l_NewPage_0[v936 .. "DeviceFrame"].Visible = true;
                return;
            else
                l_NewPage_0[v936 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v952() --[[ Line: 3372 ]] --[[ Name: updateCameraDevices ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v115 (ref), l_UserGameSettings_0 (ref), l_NewPage_0 (copy), v929 (copy)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v947 = {};
        local v948 = {};
        local v949 = 1;
        table.insert(v947, v115);
        table.insert(v948, "{DefaultDeviceGuid}");
        for v950, v951 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v950 == l_UserGameSettings_0.DefaultCameraID then
                v949 = #v947 + 1;
            end;
            table.insert(v947, v951);
            table.insert(v948, v950);
        end;
        l_NewPage_0.CameraDeviceNames = v947;
        l_NewPage_0.CameraDeviceGuids = v948;
        l_NewPage_0.CameraDeviceIndex = 0;
        if not l_NewPage_0.CameraDeviceSelector then
            v929();
        else
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v947);
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v949);
    end;
    local v953 = nil;
    local v954 = nil;
    local function v955() --[[ Line: 3402 ]] --[[ Name: updateAudioOptions ]]
        -- upvalues: l_NewPage_0 (copy), v945 (copy), v75 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v935 (copy)
        if l_NewPage_0.VoiceChatOptionsEnabled then
            v945(v75.Input);
            v945(v75.Output);
            return;
        else
            if l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected() then
                v935(v75.Input);
            end;
            v935(v75.Output);
            return;
        end;
    end;
    local function __() --[[ Line: 3414 ]] --[[ Name: setupDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v953 (ref), l_NewPage_0 (copy), v955 (copy)
        if l_SoundService_0.DeviceListChanged then
            v953 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3416 ]]
                -- upvalues: l_NewPage_0 (ref), v955 (ref)
                if l_NewPage_0.PageOpen then
                    v955();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3424 ]] --[[ Name: setupVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v954 (ref), l_NewPage_0 (copy), v952 (copy)
        if l_VideoCaptureService_0.DevicesChanged then
            v954 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3426 ]]
                -- upvalues: l_NewPage_0 (ref), v952 (ref)
                if l_NewPage_0.PageOpen then
                    v952();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3434 ]] --[[ Name: teardownDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v953 (ref)
        if l_SoundService_0.DeviceListChanged and v953 then
            v953:Disconnect();
        end;
    end;
    local function __() --[[ Line: 3440 ]] --[[ Name: teardownVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v954 (ref)
        if l_VideoCaptureService_0.DevicesChanged and v954 then
            v954:Disconnect();
            v954 = nil;
        end;
    end;
    local function __() --[[ Line: 3448 ]] --[[ Name: checkVoiceChatOptions ]]
        -- upvalues: l_default_2 (ref), l_NewPage_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v873 (copy)
        if l_default_2:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                v873();
            end;
        end;
    end;
    local function __() --[[ Line: 3457 ]] --[[ Name: updateInputDeviceVisibility ]]
        -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref)
        local v961 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
        if l_NewPage_0[v75.Input .. "DeviceFrame"] then
            l_NewPage_0[v75.Input .. "DeviceFrame"].Visible = v961;
        end;
    end;
    local v963 = false;
    local v964 = nil;
    if v64 then
        v964 = false;
    end;
    local function v982() --[[ Line: 3470 ]] --[[ Name: createVoiceChatSelector ]]
        -- upvalues: v63 (ref), l_NewPage_0 (copy), v55 (ref), v24 (ref), l_default_2 (ref), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v64 (ref), v43 (ref), v42 (ref), v964 (ref), v963 (ref), v103 (ref), v58 (ref), l_GuiService_0 (ref)
        if v63 and l_NewPage_0.VoiceConnectDisconnectFrame and l_NewPage_0.VoiceConnectDisconnectSelector then
            return;
        else
            local v965 = "Voice Chat";
            local v966 = "Disconnected";
            local v967 = "Connected";
            if v55 then
                v965 = v24:Format("Feature.GameDetails.Label.VoiceChat");
                v966 = v24:Format("Feature.SettingsHub.Label.Disconnected");
                v967 = v24:Format("Feature.SettingsHub.Label.Connected");
            end;
            local v968 = l_default_2:VoiceChatEnded() and 1 or 2;
            local l_l_NewPage_0_111 = l_NewPage_0;
            local l_l_NewPage_0_112 = l_NewPage_0;
            local v971, v972, v973 = v95:AddNewRow(l_NewPage_0, v965, "Selector", {
                v966, 
                v967
            }, v968);
            l_l_NewPage_0_111.VoiceConnectDisconnectFrame = v971;
            _ = v972;
            l_l_NewPage_0_112.VoiceConnectDisconnectSelector = v973;
            l_NewPage_0.VoiceConnectDisconnectFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectDisconnectSelector;
            l_l_NewPage_0_111 = l_default_2:getService();
            if l_l_NewPage_0_111 and not v64 then
                l_l_NewPage_0_111.StateChanged:Connect(function(v974, v975) --[[ Line: 3495 ]]
                    -- upvalues: v63 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                    if v63 then
                        if v974 == v975 then
                            return;
                        elseif v975 == Enum.VoiceChatState.Joined and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                            return;
                        elseif (v975 == Enum.VoiceChatState.Ended or v975 == Enum.VoiceChatState.Failed or v975 == Enum.VoiceChatState.Idle) and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                            return;
                        end;
                    elseif v974 == v975 then
                        return;
                    elseif v975 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                        return;
                    elseif l_default_2:VoiceChatEnded() then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    end;
                end);
            end;
            l_l_NewPage_0_112 = v968;
            v971 = v43();
            v972 = v42() and v971 > 0;
            v973 = function(v976) --[[ Line: 3529 ]]
                -- upvalues: l_l_NewPage_0_112 (ref), v64 (ref), v964 (ref), l_default_2 (ref), v963 (ref), l_NewPage_0 (ref)
                if v976 == l_l_NewPage_0_112 then
                    return;
                else
                    l_l_NewPage_0_112 = v976;
                    if v64 and v964 then
                        return;
                    else
                        l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(v976 == 2));
                        if v976 == 2 then
                            l_default_2:JoinVoice();
                        elseif not l_default_2:VoiceChatEnded() then
                            l_default_2:Leave();
                        end;
                        if v963 then
                            task.spawn(function() --[[ Line: 3554 ]]
                                -- upvalues: v976 (copy), l_NewPage_0 (ref)
                                task.wait(0.5);
                                if v976 ~= 1 then
                                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
            end;
            l_NewPage_0.VoiceConnectDisconnectSelector.IndexChanged:connect(if v972 then v103(v971, v973) else v973);
            if v58 then
                l_NewPage_0.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(__, v978, v979) --[[ Line: 3568 ]]
                    -- upvalues: v965 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref)
                    if v979 and v978 and v978.Parent and v978.Parent.Name == v965 .. "Frame" and v979.Name == "ImageButton" and l_NewPage_0.Active then
                        l_GuiService_0.SelectedCoreObject = v978;
                    end;
                end);
            end;
            l_default_2:subscribe("OnStateChanged", function(__, v981) --[[ Line: 3575 ]]
                -- upvalues: v64 (ref), v964 (ref), l_NewPage_0 (ref)
                if v64 then
                    v964 = true;
                    if v981 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    end;
                end;
                if v981 == Enum.VoiceChatState.Failed then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                end;
                if v64 then
                    v964 = false;
                end;
            end);
            l_default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 3592 ]]
                -- upvalues: v963 (ref), v64 (ref), v964 (ref), l_NewPage_0 (ref)
                task.spawn(function() --[[ Line: 3593 ]]
                    -- upvalues: v963 (ref), v64 (ref), v964 (ref), l_NewPage_0 (ref)
                    task.wait(0.5);
                    v963 = true;
                    if v64 then
                        v964 = true;
                    end;
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    if v64 then
                        v964 = false;
                    end;
                end);
            end);
            return;
        end;
    end;
    local function v1001() --[[ Line: 3607 ]] --[[ Name: createVoiceConnectDisconnect ]]
        -- upvalues: l_default_2 (ref), v24 (ref), v43 (ref), v95 (ref), v103 (ref), l_NewPage_0 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref)
        if l_default_2:IsSeamlessVoice() and not l_default_2.isShowingFTUX then
            local v983 = nil;
            local v984 = nil;
            local v985 = nil;
            local v986 = nil;
            local v987 = v24:Format("Feature.GameDetails.Label.VoiceChat");
            local v988 = v24:Format("Feature.SettingsHub.Label.Connect");
            local v989 = v24:Format("Feature.SettingsHub.Label.Disconnect");
            local v990 = v43();
            local v991 = v990 > 0;
            local function v996() --[[ Line: 3617 ]]
                -- upvalues: l_default_2 (ref)
                if l_default_2:getService() then
                    local v992 = nil;
                    do
                        local l_v992_0 = v992;
                        l_v992_0 = l_default_2:getService().StateChanged:Connect(function(__, v995) --[[ Line: 3621 ]]
                            -- upvalues: l_default_2 (ref), l_v992_0 (ref)
                            if v995 == Enum.VoiceChatState.Joined then
                                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                                l_v992_0:Disconnect();
                            end;
                        end);
                    end;
                else
                    l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(false));
                end;
                l_default_2:JoinVoice();
            end;
            local function v997() --[[ Line: 3639 ]]
                -- upvalues: l_default_2 (ref)
                l_default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                l_default_2:Leave();
            end;
            local v998, v999, v1000 = v95:MakeStyledButton("VoiceConnectButton", v988, UDim2.new(1, 0, 1, -20), if v991 then v103(v990, v996) else v996, l_NewPage_0);
            voiceConnectSetRowRef = v1000;
            v983 = v998;
            v984 = v999;
            v998, v999, v1000 = v95:MakeStyledButton("VoiceDisconnectButton", v989, UDim2.new(1, 0, 1, -20), if v991 then v103(v990, v997) else v997, l_NewPage_0);
            voiceDisconnectSetRowRef = v1000;
            v985 = v998;
            v986 = v999;
            v983.Size = UDim2.new(0.6, 0, 0, 40);
            v983.Position = UDim2.new(0.4, 0, 0.5, 0);
            v983.AnchorPoint = Vector2.new(0, 0.5);
            v983.ZIndex = 2;
            v983.Selectable = true;
            v984.ZIndex = 2;
            v985.Size = UDim2.new(0.6, 0, 0, 40);
            v985.Position = UDim2.new(0.4, 0, 0.5, 0);
            v985.AnchorPoint = Vector2.new(0, 0.5);
            v985.ZIndex = 2;
            v985.Selectable = true;
            v986.ZIndex = 2;
            v998 = v95:AddNewRowObject(l_NewPage_0, v987, v983, nil, true);
            v999 = v95:AddNewRowObject(l_NewPage_0, v987, v985, nil, true);
            l_NewPage_0.VoiceConnectFrame = v998;
            l_NewPage_0.VoiceDisconnectFrame = v999;
            v998.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectFrame;
            v999.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceDisconnectFrame;
            voiceConnectSetRowRef(v998);
            voiceDisconnectSetRowRef(v999);
            if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_isVoiceFocused_0() then
                v998.Visible = false;
                v999.Visible = false;
                return;
            elseif l_default_2:ShouldShowJoinVoice() then
                v998.Visible = true;
                v999.Visible = false;
                return;
            else
                v998.Visible = false;
                v999.Visible = true;
            end;
        end;
    end;
    local function v1027() --[[ Line: 3701 ]] --[[ Name: createVRComfortSettingOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_1 = Enum.VRComfortSetting:GetEnumItems();
        local v1003 = {
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
        local v1004 = {};
        for v1005, v1006 in ipairs(l_EnumItems_1) do
            v1004[v1005] = v24:Format(v1003[tostring(v1006)]);
        end;
        local v1007 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
        local l_l_NewPage_0_113 = l_NewPage_0;
        local l_l_NewPage_0_114 = l_NewPage_0;
        local l_l_NewPage_0_115 = l_NewPage_0;
        local v1011, v1012, v1013 = v95:AddNewRow(l_NewPage_0, v24:Format(v1003.title), "Selector", v1004, v1007, nil, v24:Format(v1003.description));
        l_l_NewPage_0_113.VRComfortSettingFrame = v1011;
        l_l_NewPage_0_114.VRComfortSettingLabel = v1012;
        l_l_NewPage_0_115.VRComfortSettingSelector = v1013;
        l_NewPage_0.VRComfortSettingFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRComfortSettingFrame;
        l_l_NewPage_0_113 = l_GameSettings_0.VignetteEnabled and 1 or 2;
        l_l_NewPage_0_114 = l_NewPage_0;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1011 = l_NewPage_0;
        local v1014;
        v1012, v1013, v1014 = v95:AddNewRow(l_NewPage_0, v24:Format(v1003.vignetteEnabled), "Selector", {
            v24:Format(v1003.on), 
            v24:Format(v1003.off)
        }, l_l_NewPage_0_113);
        l_l_NewPage_0_114.VRVignetteEnabledFrame = v1012;
        l_l_NewPage_0_115.VRVignetteEnabledLabel = v1013;
        v1011.VRVignetteEnabledSelector = v1014;
        l_NewPage_0.VRVignetteEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRVignetteEnabledFrame;
        l_l_NewPage_0_114 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1011 = l_NewPage_0;
        v1012 = l_NewPage_0;
        local v1015;
        v1013, v1014, v1015 = v95:AddNewRow(l_NewPage_0, v24:Format(v1003.steppedRotationEnabled), "Selector", {
            v24:Format(v1003.on), 
            v24:Format(v1003.off)
        }, l_l_NewPage_0_114);
        l_l_NewPage_0_115.VRSteppedRotationEnabledFrame = v1013;
        v1011.VRSteppedRotationEnabledLabel = v1014;
        v1012.VRSteppedRotationEnabledSelector = v1015;
        l_NewPage_0.VRSteppedRotationEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSteppedRotationEnabledFrame;
        l_l_NewPage_0_115 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
        v1011 = l_NewPage_0;
        v1012 = l_NewPage_0;
        v1013 = l_NewPage_0;
        local v1016;
        v1014, v1015, v1016 = v95:AddNewRow(l_NewPage_0, v24:Format(v1003.thirdPersonFixedCamEnabled), "Selector", {
            v24:Format(v1003.on), 
            v24:Format(v1003.off)
        }, l_l_NewPage_0_115);
        v1011.VRThirdPersonFixedCamEnabledFrame = v1014;
        v1012.VRThirdPersonFixedCamEnabledLabel = v1015;
        v1013.VRThirdPersonFixedCamEnabledSelector = v1016;
        l_NewPage_0.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRThirdPersonFixedCamEnabledFrame;
        v1011 = function(v1017) --[[ Line: 3767 ]]
            -- upvalues: l_NewPage_0 (ref)
            if v1017 == Enum.VRComfortSetting.Custom then
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
        l_NewPage_0.VRComfortSettingSelector.IndexChanged:connect(function(v1018) --[[ Line: 3791 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), v1011 (copy)
            local v1019 = l_EnumItems_1[v1018];
            l_GameSettings_0.VRComfortSetting = v1019;
            v1011(v1019);
        end);
        v1011(l_GameSettings_0.VRComfortSetting);
        l_NewPage_0.VRVignetteEnabledSelector.IndexChanged:connect(function(v1020) --[[ Line: 3798 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VignetteEnabledCustomOption = v1020 == 1;
            end;
        end);
        l_NewPage_0.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(v1021) --[[ Line: 3804 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRSmoothRotationEnabledCustomOption = v1021 == 2;
            end;
        end);
        l_NewPage_0.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(v1022) --[[ Line: 3810 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRThirdPersonFollowCamEnabledCustomOption = v1022 == 2;
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ Line: 3816 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1023 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
            if l_NewPage_0.VRComfortSettingSelector:GetSelectedIndex() ~= v1023 then
                l_NewPage_0.VRComfortSettingSelector:SetSelectionIndex(v1023);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ Line: 3823 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1024 = l_GameSettings_0.VignetteEnabled and 1 or 2;
            if l_NewPage_0.VRVignetteEnabledSelector:GetSelectedIndex() ~= v1024 then
                l_NewPage_0.VRVignetteEnabledSelector:SetSelectionIndex(v1024);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ Line: 3830 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1025 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
            if l_NewPage_0.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= v1025 then
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetSelectionIndex(v1025);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 3837 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1026 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
            if l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= v1026 then
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v1026);
            end;
        end);
    end;
    local function v1042() --[[ Line: 3845 ]] --[[ Name: createVRSafetyBubbleModeOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_2 = Enum.VRSafetyBubbleMode:GetEnumItems();
        local v1029 = {
            title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
            description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
            ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
            ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
            ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
        };
        local v1030 = {};
        for v1031, v1032 in ipairs(l_EnumItems_2) do
            v1030[v1031] = v24:Format(v1029[tostring(v1032)]);
        end;
        local v1033 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
        task.defer(function() --[[ Line: 3861 ]]
            -- upvalues: l_NewPage_0 (ref), v95 (ref), v24 (ref), v1029 (copy), v1030 (copy), v1033 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_EnumItems_2 (copy), l_GameSettings_0 (ref)
            local l_l_NewPage_0_116 = l_NewPage_0;
            local l_l_NewPage_0_117 = l_NewPage_0;
            local l_l_NewPage_0_118 = l_NewPage_0;
            local v1037, v1038, v1039 = v95:AddNewRow(l_NewPage_0, v24:Format(v1029.title), "DropDown", v1030, v1033, nil, v24:Format(v1029.description));
            l_l_NewPage_0_116.VRSafetyBubbleModeFrame = v1037;
            l_l_NewPage_0_117.VRSafetyBubbleModeLabel = v1038;
            l_l_NewPage_0_118.VRSafetyBubbleModeSelector = v1039;
            l_NewPage_0.VRSafetyBubbleModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSafetyBubbleModeFrame;
            l_NewPage_0.VRSafetyBubbleModeSelector.IndexChanged:connect(function(v1040) --[[ Line: 3874 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref)
                l_GameSettings_0.VRSafetyBubbleMode = l_EnumItems_2[v1040];
            end);
            l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 3879 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
                local v1041 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
                if l_NewPage_0.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= v1041 then
                    l_NewPage_0.VRSafetyBubbleModeSelector:SetSelectionIndex(v1041);
                end;
            end);
        end);
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    local v1043 = nil;
    local v1044 = nil;
    local v1045 = nil;
    if game:GetEngineFeature("VoiceChatSupported") and (l_GetFFlagEnableVrVoiceConnectDisconnect_0() or not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        spawn(function() --[[ Line: 3893 ]]
            -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (ref), v56 (ref), l_default_2 (ref), v982 (copy), l_isVoiceFocused_0 (ref), l_NewPage_0 (copy), l_observeIsVoiceFocused_0 (ref), v17 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v873 (copy), v63 (ref), v125 (ref), v21 (ref), v1001 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref), v124 (ref), v117 (ref)
            if l_GetFFlagEnableVoiceUxUpdates_0() and (not v56 and l_default_2:EligibleForFaeUpsell() or l_default_2:IsSeamlessVoice()) and l_default_2:verifyUniverseAndPlaceCanUseVoice() then
                v982();
                if l_isVoiceFocused_0() and l_NewPage_0.VoiceConnectDisconnectFrame then
                    l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                end;
                l_observeIsVoiceFocused_0(function(v1046) --[[ Line: 3903 ]]
                    -- upvalues: l_NewPage_0 (ref)
                    if v1046 then
                        if l_NewPage_0.VoiceConnectDisconnectFrame then
                            l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                            return;
                        end;
                    elseif l_NewPage_0.VoiceConnectDisconnectFrame then
                        l_NewPage_0.VoiceConnectDisconnectFrame.Visible = true;
                    end;
                end);
            end;
            l_default_2:asyncInit():andThen(function() --[[ Line: 3916 ]]
                -- upvalues: v17 (ref), l_default_2 (ref), l_NewPage_0 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v873 (ref), v63 (ref), v982 (ref), v125 (ref), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v21 (ref), v1001 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref), l_observeIsVoiceFocused_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref)
                v17 = l_default_2:getService();
                if l_default_2:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                        v873();
                    end;
                end;
                if v63 and l_default_2:UserVoiceEnabled() then
                    v982();
                end;
                if not v125() then
                    l_default_2:CheckAndShowNotAudiblePrompt();
                end;
                if l_GetFFlagEnableVoiceUxUpdates_0() then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    return;
                else
                    local v1047 = false;
                    if v21() then
                        v1001();
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                            v1047 = l_isVoiceFocused_0();
                            l_observeIsVoiceFocused_0(function(v1048) --[[ Line: 3941 ]]
                                -- upvalues: v1047 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                                v1047 = v1048;
                                if v1048 then
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
                            l_NewPage_0.VoiceDisconnectFrame.Visible = not v1047;
                        else
                            l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                        end;
                    end;
                    l_default_2.showVoiceUI.Event:Connect(function() --[[ Line: 3974 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1047 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1047 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = true;
                            local v1049 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v75.Input .. "DeviceFrame"] then
                                l_NewPage_0[v75.Input .. "DeviceFrame"].Visible = v1049;
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
                    l_default_2.hideVoiceUI.Event:Connect(function() --[[ Line: 3992 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1047 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1047 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = false;
                            local v1050 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v75.Input .. "DeviceFrame"] then
                                l_NewPage_0[v75.Input .. "DeviceFrame"].Visible = v1050;
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
            end):catch(function() --[[ Line: 4012 ]]
                -- upvalues: v124 (ref), v117 (ref), v125 (ref), l_default_2 (ref)
                if v124() then
                    v117:warning("Failed to init VoiceChatServiceManager");
                end;
                if not v125() then
                    l_default_2:CheckAndShowPermissionPrompt();
                end;
            end);
        end);
    end;
    if l_GetFFlagEnableCrossExpVoice_0() and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        v1043 = l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 4025 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref)
            local v1051 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v75.Input .. "DeviceFrame"] then
                l_NewPage_0[v75.Input .. "DeviceFrame"].Visible = v1051;
            end;
        end);
        v1044 = l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 4028 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v75 (ref)
            local v1052 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v75.Input .. "DeviceFrame"] then
                l_NewPage_0[v75.Input .. "DeviceFrame"].Visible = v1052;
            end;
        end);
        v1045 = function() --[[ Line: 4031 ]]
            -- upvalues: v1043 (ref), v1044 (ref)
            if v1043 then
                v1043:Disconnect();
                v1043 = nil;
            end;
            if v1044 then
                v1044:Disconnect();
                v1044 = nil;
            end;
        end;
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v1053 = nil;
    local function __() --[[ Line: 4045 ]]
        -- upvalues: v1053 (ref)
        if v1053 then
            v1053:disconnect();
            v1053 = nil;
        end;
    end;
    if (v36 or l_GetFFlagSelfViewCameraSettings_0()) and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        local function v1056(v1055) --[[ Line: 4053 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.VideoOptionsEnabled = v1055.hasCameraPermissions;
        end;
        if v34() then
            if v27() then
                v26(v1056, {
                    l_default_0.Permissions.CAMERA_ACCESS
                }, true);
                if v1053 then
                    v1053:disconnect();
                end;
                v1053 = v33:connect(function() --[[ Line: 4070 ]]
                    -- upvalues: l_NewPage_0 (copy), v952 (copy), l_VideoCaptureService_0 (ref), v954 (ref)
                    l_NewPage_0.VideoOptionsEnabled = true;
                    v952();
                    if l_VideoCaptureService_0.DevicesChanged then
                        v954 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3426 ]]
                            -- upvalues: l_NewPage_0 (ref), v952 (ref)
                            if l_NewPage_0.PageOpen then
                                v952();
                            end;
                        end);
                    end;
                end);
            end;
        else
            v26(v1056, nil, nil, "GameSettings.createDeviceOptions");
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v454(not v107 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
    end;
    local function __() --[[ Line: 4089 ]]
        -- upvalues: l_GameSettings_0 (ref), v794 (copy)
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v794();
            return;
        else
            local v1057 = nil;
            v1057 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4095 ]]
                -- upvalues: l_GameSettings_0 (ref), v1057 (ref), v794 (ref)
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v1057 then
                        v1057:disconnect();
                    end;
                    v794();
                end;
            end);
            return;
        end;
    end;
    if l_UserInputService_0.MouseEnabled then
        v777();
    elseif l_UserInputService_0.GamepadEnabled then
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v794();
        else
            local v1059 = nil;
            do
                local l_v1059_0 = v1059;
                l_v1059_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4095 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1059_0 (ref), v794 (copy)
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v1059_0 then
                            l_v1059_0:disconnect();
                        end;
                        v794();
                    end;
                end);
            end;
        end;
    else
        local v1061 = nil;
        do
            local l_v1061_0 = v1061;
            l_v1061_0 = l_UserInputService_0.GamepadConnected:connect(function() --[[ Line: 4113 ]]
                -- upvalues: l_v1061_0 (ref), l_GameSettings_0 (ref), v794 (copy)
                if l_v1061_0 then
                    l_v1061_0:disconnect();
                end;
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    v794();
                    return;
                else
                    local v1063 = nil;
                    v1063 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4095 ]]
                        -- upvalues: l_GameSettings_0 (ref), v1063 (ref), v794 (ref)
                        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                            if v1063 then
                                v1063:disconnect();
                            end;
                            v794();
                        end;
                    end);
                    return;
                end;
            end);
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        if l_GameSettings_0.IsUsingCameraYInverted then
            v744();
        else
            local v1064 = nil;
            do
                local l_v1064_0 = v1064;
                l_v1064_0 = l_GameSettings_0.Changed:connect(function(v1066) --[[ Line: 4127 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1064_0 (ref), v744 (copy)
                    if v1066 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                        l_v1064_0:disconnect();
                        v744();
                    end;
                end);
            end;
        end;
    end;
    if l_isInExperienceUIVREnabled_0 then
        if l_isSpatial_0() then
            v1027();
            v1042();
        else
            v454(not v107 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
            if l_GameSettings_0.IsUsingCameraYInverted then
                v744();
            else
                local v1067 = nil;
                do
                    local l_v1067_0 = v1067;
                    l_v1067_0 = l_GameSettings_0.Changed:connect(function(v1069) --[[ Line: 4156 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v1067_0 (ref), v744 (copy)
                        if v1069 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                            l_v1067_0:disconnect();
                            v744();
                        end;
                    end);
                end;
            end;
            v224();
            v253();
        end;
    end;
    v715();
    if v69 then
        v725();
    end;
    v735();
    v210();
    if v49 and v50() then
        v239();
    end;
    if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
        v137(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v144);
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v224();
        v253();
    end;
    v268();
    v285();
    if not v111:IsSubjectToChinaPolicies() then
        v297();
    end;
    if v122 then
        v333();
    end;
    if v107 and l_getAppFeaturePolicies_0().getSupportsOverscan() then
        v806();
    end;
    if v49 and l_FFlagBadgeVisibilitySettingEnabled_0 then
        spawn(function() --[[ Line: 3106 ]]
            -- upvalues: v97 (ref), l_LocalPlayer_0 (ref), v65 (ref), v138 (ref), l_NewPage_0 (copy), v95 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v1070 = 2;
            if v97.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v1070 = 1;
            end;
            local v1071 = v65:FormatByKey("Feature.SettingsHub.Label.Show");
            local v1072 = v65:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v1073 = if v138 then v65:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v65:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v1074 = v65:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_119 = l_NewPage_0;
            local l_l_NewPage_0_120 = l_NewPage_0;
            local l_l_NewPage_0_121 = l_NewPage_0;
            local v1078, v1079, v1080 = v95:AddNewRow(l_NewPage_0, v1073, "Selector", {
                v1072, 
                v1071
            }, v1070, nil, v1074);
            l_l_NewPage_0_119.badgeVisibleRow = v1078;
            l_l_NewPage_0_120.badgeVisibleFrame = v1079;
            l_l_NewPage_0_121.badgeVisibleSelector = v1080;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v1081) --[[ Line: 3120 ]]
                -- upvalues: l_GameSettings_0 (ref), v97 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v1081 == 2;
                v97.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v1081 == 1);
            end);
        end);
    end;
    if l_FFlagEnableModerateChatRemoteEvent_0 then
        v917();
    end;
    v819();
    v98(l_RunService_0:IsStudio(), l_LocalPlayer_0, v97):andThen(function(v1082) --[[ Line: 4219 ]]
        -- upvalues: v848 (copy)
        if v1082 then
            v848();
        end;
    end):catch(function(v1083) --[[ Line: 4224 ]]
        warn(v1083);
    end);
    v159 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v1085, __ in pairs(v160) do
            v1085.Visible = not l_VREnabled_3;
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
    local v1087 = l_Migration_0.uiblox["icons/common/settings"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v1087.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v104.Font[v1087.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __() --[[ Line: 4293 ]] --[[ Name: staticFeedbackEntryPointChecksPassed ]]
        -- upvalues: l_RunService_0 (ref), v132 (ref), v107 (ref)
        if l_RunService_0:IsStudio() then
            return false;
        elseif game:GetEngineFeature("CaptureModeEnabled") == false then
            return false;
        elseif v132 and v107 then
            return false;
        else
            return true;
        end;
    end;
    l_NewPage_0.OpenSettingsPage = function() --[[ Line: 4309 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v955 (copy), l_SoundService_0 (ref), v953 (ref), l_GameSettings_0 (ref), v36 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), v952 (copy), l_VideoCaptureService_0 (ref), v954 (ref), v855 (copy), v20 (ref), v79 (ref), v99 (ref), v78 (ref), l_FFlagIEMFocusNavToButtons_0 (ref), v157 (ref)
        l_NewPage_0.PageOpen = true;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            v955();
            if l_SoundService_0.DeviceListChanged then
                v953 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3416 ]]
                    -- upvalues: l_NewPage_0 (ref), v955 (ref)
                    if l_NewPage_0.PageOpen then
                        v955();
                    end;
                end);
            end;
            l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
            if (v36 or l_GetFFlagSelfViewCameraSettings_0()) and l_NewPage_0.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
                v952();
                if l_VideoCaptureService_0.DevicesChanged then
                    v954 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3426 ]]
                        -- upvalues: l_NewPage_0 (ref), v952 (ref)
                        if l_NewPage_0.PageOpen then
                            v952();
                        end;
                    end);
                end;
            end;
            v855();
            if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and l_NewPage_0.toggleFeedbackModeButton and l_NewPage_0.toggleFeedbackModeText then
                local l_l_NewPage_0_122 = l_NewPage_0;
                local v1090 = false;
                if v20 ~= nil then
                    v1090 = v20:CanEnterCaptureMode();
                end;
                l_l_NewPage_0_122.FeedbackEntryPointEnabled = v1090;
                if l_NewPage_0.FeedbackEntryPointEnabled then
                    l_NewPage_0.toggleFeedbackModeButton.Active = true;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = true;
                    l_NewPage_0.toggleFeedbackModeText.Text = v79;
                else
                    l_NewPage_0.toggleFeedbackModeButton.Active = false;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = false;
                    l_NewPage_0.toggleFeedbackModeText.TextColor3 = v99.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100));
                    l_NewPage_0.toggleFeedbackModeText.Text = v78;
                end;
            end;
            if l_FFlagIEMFocusNavToButtons_0 then
                table.insert(l_NewPage_0.LastSelectableObjects, v157(l_NewPage_0));
            end;
            return;
        end;
    end;
    l_NewPage_0.CloseSettingsPage = function() --[[ Line: 4362 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_SoundService_0 (ref), v953 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v1045 (ref), v36 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), l_VideoCaptureService_0 (ref), v954 (ref), v34 (ref), v1053 (ref), l_default_2 (ref)
        l_NewPage_0.PageOpen = false;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if l_SoundService_0.DeviceListChanged and v953 then
                v953:Disconnect();
            end;
            if l_GetFFlagEnableCrossExpVoice_0() and v1045 then
                v1045();
            end;
            if v36 or l_GetFFlagSelfViewCameraSettings_0() then
                if game:GetEngineFeature("VideoCaptureService") and l_VideoCaptureService_0.DevicesChanged and v954 then
                    v954:Disconnect();
                    v954 = nil;
                end;
                if v34() and v1053 then
                    v1053:disconnect();
                    v1053 = nil;
                end;
            end;
            if game:GetEngineFeature("VoiceChatSupported") and l_NewPage_0.VoiceChatOptionsEnabled and l_NewPage_0.startVolume ~= nil and l_NewPage_0.startVolume > 0 then
                l_default_2:CheckAndShowNotAudiblePrompt();
            end;
            return;
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function() --[[ Line: 4397 ]] --[[ Name: isLangaugeSelectionDropdownEnabled ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v1091 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v1091) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v1093) --[[ Line: 4420 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v135 (ref), v136 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v144 (ref), v699 (copy), v86 (ref), v88 (ref), v87 (ref), v704 (copy), l_game_EngineFeature_0 (ref), v91 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref), v90 (ref), v93 (ref), l_RunService_0 (ref), v132 (ref), v107 (ref), v476 (copy)
        l_NewPage_0.HubRef = v1093;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if isLangaugeSelectionDropdownEnabled() then
                if v135() then
                    v136(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v144);
                else
                    v699();
                end;
            end;
            if game:GetEngineFeature("EnableTCSChatTranslation") and v86() then
                if v88() then
                    local v1094 = v87();
                    if not v704(v1094).ChatTranslationEnabled then
                        if l_game_EngineFeature_0 then
                            if v91() then
                                if l_GameSettings_0.ChatTranslationLocale == "" then
                                    l_GameSettings_0.ChatTranslationEnabled = false;
                                    l_GameSettings_0.ChatTranslationLocale = "en_us";
                                end;
                            else
                                l_GameSettings_0.ChatTranslationEnabled = false;
                            end;
                        else
                            pcall(function() --[[ Line: 4456 ]]
                                -- upvalues: l_TextChatService_0 (ref)
                                l_TextChatService_0.ChatTranslationEnabled = false;
                            end);
                        end;
                    elseif v90() then
                        l_GameSettings_0.ChatTranslationEnabled = true;
                    end;
                end;
                v93(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v144);
            end;
            if not l_RunService_0:IsStudio() and not (game:GetEngineFeature("CaptureModeEnabled") == false) and (not v132 or not v107 or false) then
                v476();
            end;
            return;
        end;
    end;
    return l_NewPage_0;
end)());