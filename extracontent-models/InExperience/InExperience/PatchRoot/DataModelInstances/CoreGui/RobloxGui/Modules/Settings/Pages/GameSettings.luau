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
local v34 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 = v34.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty;
local l_GetFFlagEnableCrossExpVoice_0 = v34.GetFFlagEnableCrossExpVoice;
local l_GetFFlagSelfViewCameraSettings_0 = v34.GetFFlagSelfViewCameraSettings;
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local v39 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDebounceConnectDisconnectSelector);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFIntDebounceDisconnectButtonDelay);
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v34.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v34.GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 = v34.GetFFlagVoiceChatClientRewriteDisableVCSDevice;
local l_FFlagIEMFocusNavToButtons_0 = v34.FFlagIEMFocusNavToButtons;
local l_FFlagIEMTabFocusNav_0 = v34.FFlagIEMTabFocusNav;
local v47 = game:DefineFastFlag("ShowAntiHarassmentSettings", false);
local v48 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting);
local v49 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy);
local l_FFlagBadgeVisibilitySettingEnabled_0 = v34.FFlagBadgeVisibilitySettingEnabled;
local l_GetFFlagEnableVoiceUxUpdates_0 = v34.GetFFlagEnableVoiceUxUpdates;
local l_GetFFlagEnableVrVoiceConnectDisconnect_0 = v34.GetFFlagEnableVrVoiceConnectDisconnect;
local v53 = game:DefineFastFlag("EnableVoiceSelectorTranslations_AEGIS2", false);
local v54 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false);
local v55 = game:DefineFastFlag("CenterShiftLockOverride", true);
local v56 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false);
local v57 = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false);
local l_FFlagEnableModerateChatRemoteEvent_0 = v34.FFlagEnableModerateChatRemoteEvent;
local v59 = game:DefineFastFlag("ModerateChatAnalytics", false);
local v60 = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false);
local v61 = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false);
local v62 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v65 = require(l_RobloxGui_0.Modules.Settings.Resources.GameSettingsConstants);
local v66 = l_default_1 and l_default_1.getHasPartyVoiceVolume();
local l_Constants_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v68 = {
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
local v69 = {
    DevComputerMovementMode = true, 
    DevComputerCameraMode = true, 
    DevEnableMouseLock = true
};
local v70 = {
    DevTouchMovementMode = true, 
    DevTouchCameraMode = true
};
local v71 = {
    DEFAULT_FOLLOW = "Default (Follow)", 
    DEFAULT_CLASSIC = "Default (Classic)"
};
local v72 = {
    Input = "Input", 
    Output = "Output"
};
local v73 = {
    DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)", 
    DEFAULT_KEYBOARD = "Default (Keyboard)", 
    TAP_TO_MOVE = "Tap to Move", 
    CLICK_TO_MOVE = "Click to Move"
};
local v74 = v62:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick");
local v75 = v62:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable");
local v76 = v62:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText");
local v77 = {
    On = 1, 
    Off = 2
};
local function __() --[[ Line: 160 ]] --[[ Name: getDefaultCameraMode ]]
    -- upvalues: l_UserInputService_0 (copy), v71 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v71.DEFAULT_FOLLOW;
    else
        return v71.DEFAULT_CLASSIC;
    end;
end;
local function __() --[[ Line: 169 ]] --[[ Name: getDefaultMovementMode ]]
    -- upvalues: l_UserInputService_0 (copy), v62 (copy), l_Constants_0 (copy), v73 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v62:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey);
    else
        return v73.DEFAULT_KEYBOARD;
    end;
end;
local function __() --[[ Line: 178 ]] --[[ Name: getDefaultSelectToMove ]]
    -- upvalues: l_UserInputService_0 (copy), v73 (copy)
    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
        return v73.TAP_TO_MOVE;
    else
        return v73.CLICK_TO_MOVE;
    end;
end;
local l_SETTINGS_MENU_LAYOUT_ORDER_0 = v65.SETTINGS_MENU_LAYOUT_ORDER;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v83 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationSettingEnabled);
local v84 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationLayerName);
local v85 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled);
local v86 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationWaitForIXP);
local v87 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationForceSetting);
local v88 = require(l_RobloxGui_0.Modules.Flags.GetFFlagChatTranslationNewDefaults);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v90 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer);
local l_game_EngineFeature_1 = game:GetEngineFeature("GameBasicSettingsFramerateCap");
local v92 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v93 = require(l_RobloxGui_0.Modules.CoreUtility);
local v94 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v95 = require(l_RobloxGui_0.Modules.Common.GetHasGuiHidingPermission);
local v96 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v97 = require(l_CorePackages_0.Packages.Cryo);
local v98 = require(script.Parent.Parent.GfxReset);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v100 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall);
local v101 = require(l_CorePackages_0.Packages.BuilderIcons);
local v102 = require(l_CorePackages_0.Packages.Signals);
local l_Migration_0 = v101.Migration;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub");
local v104 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local __ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v108 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local l_default_2 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_3 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v112 = v62:FormatByKey("Feature.SettingsHub.Video.SystemDefault");
local v113 = v62:FormatByKey("Feature.SettingsHub.Video.VideoCamera");
local v114 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1);
local l_game_FastInt_0 = game:GetFastInt("RomarkStartWithGraphicQualityLevel");
local v116 = not v108:IsSubjectToChinaPolicies();
local v117 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v117 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v117 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
    end;
end;
local v118 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v118 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v119 = if l_isInExperienceUIVREnabled_0 then (v118 or v117 or l_isSpatial_0()) and v116 else (v118 or v117) and v116;
local v120 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay);
local v121 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v122 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v123 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics);
local v124 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent);
local v125 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false);
local v126 = game:DefineFastFlag("UserShowGuiHideToggles", false);
local v127 = game:DefineFastFlag("UserFreecamGuiDestabilization", false);
local v128 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false);
local v129 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false);
local v130 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false);
local v131 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false);
local v132 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher);
local v133 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer);
local v134 = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer);
local v135 = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false);
local function v141(v136, v137, v138, v139) --[[ Line: 299 ]] --[[ Name: reportSettingsChangeForAnalytics ]]
    -- upvalues: v123 (copy), l_UserInputService_0 (copy), v97 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    if not v123() or v137 == v138 or v137 == nil or v138 == nil then
        return;
    else
        local v140 = {
            universe_id = tostring(game.GameId), 
            name = v136, 
            old_value = tostring(v137), 
            new_value = tostring(v138), 
            has_touch = l_UserInputService_0.TouchEnabled, 
            has_mouse = l_UserInputService_0.MouseEnabled, 
            has_gamepad = l_UserInputService_0.GamepadEnabled
        };
        if v139 then
            v140 = v97.Dictionary.join(v140, v139);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsExplicitSettingsChangeName, v140);
        return;
    end;
end;
local function v146() --[[ Line: 330 ]] --[[ Name: reportSettingsForAnalytics ]]
    -- upvalues: l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_game_EngineFeature_1 (copy), v48 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy)
    local v142 = {};
    local v143 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
    if v143 then
        v142.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
    else
        v142.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
    end;
    if v143 then
        v142.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
    else
        v142.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
    end;
    if l_UserInputService_0.MouseEnabled then
        v142.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
    end;
    if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
        local l_GamepadCameraSensitivity_0 = l_GameSettings_0.GamepadCameraSensitivity;
        v142.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", l_GamepadCameraSensitivity_0))));
    end;
    if l_UserInputService_0.MouseEnabled then
        local l_X_0 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        v142.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", l_X_0))));
    end;
    v142.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
    v142.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
    v142.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
    v142.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
    if l_game_EngineFeature_1 then
        v142.framerate_cap = tostring(l_GameSettings_0.FramerateCap);
    end;
    v142.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
    v142.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
    v142.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
    v142.reduced_motion = tostring(l_GameSettings_0.ReducedMotion);
    v142.preferred_transparency = tostring(l_GameSettings_0.PreferredTransparency);
    v142.preferred_text_size = tostring(l_GameSettings_0.PreferredTextSize);
    v142.ui_navigation_key_bind_enabled = tostring(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v142.universeid = tostring(game.GameId);
    if v48() then
        v142.player_names_enabled = tostring(l_GameSettings_0.PlayerNamesEnabled);
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsSettingsChangeName, v142);
end;
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0);
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "");
local v147 = game:DefineFastFlag("IGMEnableGFXReset", false);
local function v154(v148) --[[ Line: 396 ]] --[[ Name: getLastValueChangerFrame ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy)
    if not l_FFlagIEMFocusNavToButtons_0 then
        return;
    else
        local v149 = nil;
        local v150 = nil;
        for __, v152 in pairs(v148:GetRows()) do
            local l_SelectionFrame_0 = v152.SelectionFrame;
            if not v149 or v149 <= l_SelectionFrame_0.LayoutOrder then
                v149 = l_SelectionFrame_0.LayoutOrder;
                v150 = v148:getValueChangerFrame(v152.ValueChanger);
            end;
        end;
        return v150;
    end;
end;
local function v161(v155) --[[ Line: 415 ]] --[[ Name: getFirstValueChangerFrame ]]
    -- upvalues: l_FFlagIEMTabFocusNav_0 (copy)
    if not l_FFlagIEMTabFocusNav_0 then
        return;
    else
        local v156 = nil;
        local v157 = nil;
        for __, v159 in pairs(v155:GetRows()) do
            local l_SelectionFrame_1 = v159.SelectionFrame;
            if not v156 or l_SelectionFrame_1.LayoutOrder < v156 then
                v156 = l_SelectionFrame_1.LayoutOrder;
                v157 = v155:getValueChangerFrame(v159.ValueChanger);
            end;
        end;
        return v157;
    end;
end;
return ((function() --[[ Line: 434 ]] --[[ Name: Initialize ]]
    -- upvalues: v147 (copy), v98 (copy), l_RobloxGui_0 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v92 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (copy), l_GuiService_0 (copy), v124 (copy), v123 (copy), v141 (copy), v146 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), l_game_EngineFeature_1 (copy), v62 (copy), l_game_FastInt_0 (copy), v68 (copy), v135 (copy), v49 (copy), v77 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v96 (copy), v55 (copy), v57 (copy), l_TouchEnabled_0 (copy), v118 (copy), v117 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_LocalPlayer_0 (copy), v93 (copy), v71 (copy), v38 (copy), l_getAppFeaturePolicies_0 (copy), v73 (copy), v74 (copy), v70 (copy), v69 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v131 (copy), l_SafetyService_0 (copy), v20 (ref), v130 (copy), v76 (copy), v125 (copy), v114 (copy), l_Players_0 (copy), v75 (copy), l_RunService_0 (copy), v86 (copy), l_IXPServiceWrapper_0 (copy), v88 (copy), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (copy), l_default_3 (copy), v24 (ref), l_CorePackages_0 (copy), l_ContextActionService_0 (copy), v128 (copy), v94 (copy), v127 (copy), v126 (copy), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (ref), v121 (copy), l_SoundService_0 (copy), v72 (copy), v120 (copy), l_default_2 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v102 (copy), v59 (copy), v113 (copy), l_UserGameSettings_0 (copy), l_VideoCaptureService_0 (copy), v112 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v61 (copy), v60 (copy), v53 (copy), v40 (copy), v39 (copy), v100 (copy), v56 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_isVoiceFocused_0 (copy), l_GetFFlagEnableVrVoiceConnectDisconnect_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v54 (copy), l_observeIsVoiceFocused_0 (copy), v122 (copy), v21 (copy), l_GetFFlagSelfViewCameraSettings_0 (copy), v27 (copy), v26 (copy), l_default_0 (copy), v33 (copy), v104 (copy), v66 (copy), v47 (copy), v48 (copy), v134 (copy), v108 (copy), v119 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v95 (copy), v23 (copy), v28 (ref), v29 (ref), l_Migration_0 (copy), v101 (copy), v129 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), v154 (copy), l_FFlagIEMTabFocusNav_0 (copy), v161 (copy), v132 (copy), v133 (copy), v83 (copy), v85 (copy), v84 (copy), l_game_EngineFeature_0 (copy), l_TextChatService_0 (copy), v87 (copy), v90 (copy)
    if v147 then
        v98.RunGfxReset();
    end;
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v163 = false;
    local v164 = {};
    local __ = function() --[[ Line: 444 ]] --[[ Name: onVRSettingsReady ]]
        -- upvalues: l_VRService_0 (ref), v164 (copy)
        local l_VREnabled_0 = l_VRService_0.VREnabled;
        for v166, __ in pairs(v164) do
            v166.Visible = not l_VREnabled_0;
        end;
    end;
    local function v172() --[[ Line: 451 ]] --[[ Name: onVREnabled ]]
        -- upvalues: l_VRService_0 (ref), v163 (ref), v164 (copy)
        if l_VRService_0.VREnabled and v163 then
            local l_VREnabled_1 = l_VRService_0.VREnabled;
            for v170, __ in pairs(v164) do
                v170.Visible = not l_VREnabled_1;
            end;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v172);
    if l_VRService_0.VREnabled and v163 then
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        for v174, __ in pairs(v164) do
            v174.Visible = not l_VREnabled_2;
        end;
    end;
    local function v214() --[[ Line: 463 ]] --[[ Name: createGraphicsOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v164 (copy), l_GuiService_0 (ref), v124 (ref), v123 (ref), v141 (ref), v146 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_game_EngineFeature_1 (ref), l_VRService_0 (ref), v62 (ref), v147 (ref), v98 (ref), l_game_FastInt_0 (ref), v68 (ref)
        local v176 = 1;
        if not l_GameSettings_0:InFullScreen() then
            v176 = 2;
        end;
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local l_l_NewPage_0_2 = l_NewPage_0;
        local v180, v181, v182 = v92:AddNewRow(l_NewPage_0, "Fullscreen", "Selector", {
            "On", 
            "Off"
        }, v176);
        l_l_NewPage_0_0.FullscreenFrame = v180;
        l_l_NewPage_0_1.FullscreenLabel = v181;
        l_l_NewPage_0_2.FullscreenEnabler = v182;
        l_NewPage_0.FullscreenFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FullScreenFrame;
        v164[l_NewPage_0.FullscreenFrame] = true;
        l_NewPage_0.FullscreenEnabler.IndexChanged:connect(function(v183) --[[ Line: 476 ]]
            -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref), v124 (ref), l_NewPage_0 (ref), v123 (ref), v141 (ref), v146 (ref)
            local v184 = l_GameSettings_0:InFullScreen();
            if v183 == 1 then
                if not l_GameSettings_0:InFullScreen() then
                    l_GuiService_0:ToggleFullscreen();
                    if v124() then
                        if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 1 then
                            l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                        end;
                    else
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                    end;
                end;
            elseif v183 == 2 and l_GameSettings_0:InFullScreen() then
                l_GuiService_0:ToggleFullscreen();
                if v124() then
                    if l_NewPage_0.FullscreenEnabler.GetSelectedIndex() ~= 2 then
                        l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                    end;
                else
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
                end;
            end;
            spawn(function() --[[ Line: 501 ]]
                -- upvalues: v123 (ref), v141 (ref), v184 (copy), l_GameSettings_0 (ref), v146 (ref)
                if v123() then
                    v141("fullscreen_enabled", v184, l_GameSettings_0:InFullScreen());
                end;
                v146();
            end);
        end);
        l_GameSettings_0.FullscreenChanged:connect(function(v185) --[[ Line: 509 ]]
            -- upvalues: l_NewPage_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
            if v185 then
                if l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 1 then
                    l_NewPage_0.FullscreenEnabler:SetSelectionIndex(1);
                end;
            elseif l_NewPage_0.FullscreenEnabler:GetSelectedIndex() ~= 2 then
                l_NewPage_0.FullscreenEnabler:SetSelectionIndex(2);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsFullscreenModeName, {
                enabled = v185
            });
        end);
        l_l_NewPage_0_0 = 1;
        if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            l_l_NewPage_0_0 = 2;
        end;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v180 = l_NewPage_0;
        local v186;
        v181, v182, v186 = v92:AddNewRow(l_NewPage_0, "Graphics Mode", "Selector", {
            "Automatic", 
            "Manual"
        }, l_l_NewPage_0_0);
        l_l_NewPage_0_1.GraphicsEnablerFrame = v181;
        l_l_NewPage_0_2.GraphicsEnablerLabel = v182;
        v180.GraphicsQualityEnabler = v186;
        l_NewPage_0.GraphicsEnablerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsEnablerFrame;
        l_l_NewPage_0_1 = l_NewPage_0;
        l_l_NewPage_0_2 = l_NewPage_0;
        v180 = l_NewPage_0;
        v181, v182, v186 = v92:AddNewRow(l_NewPage_0, "Graphics Quality", "Slider", 10, 1);
        l_l_NewPage_0_1.GraphicsQualityFrame = v181;
        l_l_NewPage_0_2.GraphicsQualityLabel = v182;
        v180.GraphicsQualitySlider = v186;
        l_NewPage_0.GraphicsQualityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GraphicsQualityFrame;
        l_NewPage_0.GraphicsQualitySlider:SetMinStep(1);
        if l_game_EngineFeature_1 and not l_VRService_0.VREnabled then
            l_l_NewPage_0_1 = table.clone(l_Constants_0.FramerateCaps);
            l_l_NewPage_0_2 = {
                v62:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
                    Frames = l_GameSettings_0:GetDefaultFramerateCap()
                })
            };
            for __, v188 in l_l_NewPage_0_1 do
                table.insert(l_l_NewPage_0_2, v62:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
                    Frames = v188
                }));
            end;
            table.insert(l_l_NewPage_0_1, 1, -1);
            local l_l_l_NewPage_0_2_0 = l_l_NewPage_0_2 --[[ copy: 3 -> 9 ]];
            local l_l_l_NewPage_0_1_0 = l_l_NewPage_0_1 --[[ copy: 2 -> 10 ]];
            task.defer(function() --[[ Line: 573 ]]
                -- upvalues: l_NewPage_0 (ref), v92 (ref), v62 (ref), l_l_l_NewPage_0_2_0 (copy), l_l_l_NewPage_0_1_0 (copy), l_GameSettings_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
                local l_l_NewPage_0_3 = l_NewPage_0;
                local l_l_NewPage_0_4 = l_NewPage_0;
                local l_l_NewPage_0_5 = l_NewPage_0;
                local v194, v195, v196 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", l_l_l_NewPage_0_2_0, table.find(l_l_l_NewPage_0_1_0, l_GameSettings_0.FramerateCap), nil, v62:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"));
                l_l_NewPage_0_3.FramerateCapFrame = v194;
                l_l_NewPage_0_4.FramerateCapLabel = v195;
                l_l_NewPage_0_5.FramerateCapMode = v196;
                l_NewPage_0.FramerateCapFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FramerateCap;
                l_NewPage_0.FramerateCapMode.IndexChanged:Connect(function(v197) --[[ Line: 585 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_l_l_NewPage_0_1_0 (ref), v123 (ref), v141 (ref), v146 (ref)
                    local l_FramerateCap_0 = l_GameSettings_0.FramerateCap;
                    l_GameSettings_0.FramerateCap = l_l_l_NewPage_0_1_0[v197];
                    if v123() then
                        v141("framerate_cap", l_FramerateCap_0, l_GameSettings_0.FramerateCap);
                    end;
                    v146();
                end);
            end);
        end;
        settings().Rendering.EnableFRM = true;
        SetGraphicsQuality = function(v199, v200) --[[ Line: 603 ]] --[[ Name: SetGraphicsQuality ]]
            -- upvalues: v147 (ref), v98 (ref), l_GameSettings_0 (ref)
            if v147 then
                local v201, v202 = v98.TemporaryOverride(v199);
                if v201 then
                    settings().Rendering.QualityLevel = v202;
                    return;
                end;
            end;
            local v203 = v199 / 10;
            local v204 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * v203);
            if v204 == 20 then
                v204 = 21;
            elseif v199 == 1 then
                v204 = 1;
            elseif v199 < 1 and not v200 then
                v199 = 1;
                v204 = 1;
            elseif settings().Rendering:GetMaxQualityLevel() < v204 then
                v204 = settings().Rendering:GetMaxQualityLevel() - 1;
            end;
            l_GameSettings_0.SavedQualityLevel = v199;
            settings().Rendering.QualityLevel = v204;
        end;
        l_l_NewPage_0_1 = function() --[[ Line: 629 ]] --[[ Name: setGraphicsToAuto ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
            SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
        end;
        l_l_NewPage_0_2 = function(v205) --[[ Line: 637 ]] --[[ Name: setGraphicsToManual ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.GraphicsQualitySlider:SetZIndex(2);
            l_NewPage_0.GraphicsQualityLabel.ZIndex = 2;
            l_NewPage_0.GraphicsQualitySlider:SetInteractable(true);
            if l_NewPage_0.GraphicsQualitySlider:GetValue() == v205 then
                SetGraphicsQuality(v205);
                return;
            else
                l_NewPage_0.GraphicsQualitySlider:SetValue(v205);
                return;
            end;
        end;
        v180 = false;
        l_NewPage_0.GraphicsQualitySlider.ValueChanged:connect(function(v206) --[[ Line: 651 ]]
            -- upvalues: v180 (ref), v146 (ref)
            SetGraphicsQuality(v206);
            if v180 == true then
                v146();
            end;
            v180 = true;
        end);
        l_NewPage_0.GraphicsQualityEnabler.IndexChanged:connect(function(v207) --[[ Line: 659 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_2 (copy), v146 (ref), v141 (ref)
            local v208 = {
                Automatic = {
                    Name = "Automatic", 
                    Value = 1
                }, 
                Manual = {
                    Name = "Manual", 
                    Value = 2
                }
            };
            local l_Name_0 = v208.Automatic.Name;
            local l_Name_1 = v208.Manual.Name;
            if v207 == v208.Automatic.Value then
                l_Name_0 = v208.Manual.Name;
                l_Name_1 = v208.Automatic.Name;
                l_NewPage_0.GraphicsQualitySlider:SetZIndex(1);
                l_NewPage_0.GraphicsQualityLabel.ZIndex = 1;
                l_NewPage_0.GraphicsQualitySlider:SetInteractable(false);
                SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true);
            elseif v207 == v208.Manual.Value then
                l_l_NewPage_0_2(l_NewPage_0.GraphicsQualitySlider:GetValue());
            end;
            v146();
            v141("gfx_mode", l_Name_0, l_Name_1);
        end);
        game.GraphicsQualityChangeRequest:Connect(function(v211) --[[ Line: 677 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            if l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
                local l_Value_0 = l_NewPage_0.GraphicsQualitySlider:GetValue();
                l_Value_0 = if v211 then l_Value_0 + 1 else l_Value_0 - 1;
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
            v181 = tostring(l_GameSettings_0.SavedQualityLevel);
            v181 = if v68[v181] then v68[v181] else 10;
            SetGraphicsQuality(v181);
            do
                local l_v181_0 = v181;
                spawn(function() --[[ Line: 710 ]]
                    -- upvalues: l_NewPage_0 (ref), l_v181_0 (ref)
                    l_NewPage_0.GraphicsQualitySlider:SetValue(l_v181_0);
                end);
            end;
        end;
    end;
    local function v228() --[[ Line: 716 ]] --[[ Name: createReducedMotionOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v215 = 2;
        if l_GameSettings_0.ReducedMotion then
            v215 = 1;
        end;
        local v216 = v62:FormatByKey("Feature.Accessibility.Heading.ReducedMotion");
        local v217 = v62:FormatByKey("Feature.Accessibility.Description.ReducedMotion");
        local v218 = v62:FormatByKey("InGame.CommonUI.Label.On");
        local v219 = v62:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_6 = l_NewPage_0;
        local l_l_NewPage_0_7 = l_NewPage_0;
        local l_l_NewPage_0_8 = l_NewPage_0;
        local v223, v224, v225 = v92:AddNewRow(l_NewPage_0, v216, "Selector", {
            v218, 
            v219
        }, v215, nil, v217);
        l_l_NewPage_0_6.ReducedMotionFrame = v223;
        l_l_NewPage_0_7.ReducedMotionLabel = v224;
        l_l_NewPage_0_8.ReducedMotionMode = v225;
        l_NewPage_0.ReducedMotionFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ReducedMotionFrame;
        l_NewPage_0.ReducedMotionMode.IndexChanged:connect(function(v226) --[[ Line: 738 ]]
            -- upvalues: l_GameSettings_0 (ref), v123 (ref), v141 (ref), v146 (ref)
            local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
            l_GameSettings_0.ReducedMotion = v226 == 1;
            if v123() then
                v141("reduced_motion", l_ReducedMotion_0, l_GameSettings_0.ReducedMotion);
            end;
            v146();
        end);
    end;
    local function v243() --[[ Line: 749 ]] --[[ Name: createPlayerNamesEnabledOptions ]]
        -- upvalues: v135 (ref), v62 (ref), v49 (ref), l_GameSettings_0 (ref), v77 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v141 (ref), v146 (ref)
        local v229 = if v135 then v62:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames") else if v49 then v62:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else v62:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames");
        local v230 = if v49 then v62:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description") else nil;
        local function __() --[[ Line: 757 ]] --[[ Name: GetPlayerNamesEnabledStartIndex ]]
            -- upvalues: l_GameSettings_0 (ref), v77 (ref)
            if l_GameSettings_0.PlayerNamesEnabled then
                return v77.On;
            else
                return v77.Off;
            end;
        end;
        local v232 = if l_GameSettings_0.PlayerNamesEnabled then v77.On else v77.Off;
        local v233 = if v135 then v62:FormatByKey("Feature.SettingsHub.Label.Show") else v62:FormatByKey("InGame.CommonUI.Label.On");
        local v234 = if v135 then v62:FormatByKey("Feature.SettingsHub.Label.Hide") else v62:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_9 = l_NewPage_0;
        local l_l_NewPage_0_10 = l_NewPage_0;
        local l_l_NewPage_0_11 = l_NewPage_0;
        local v238, v239, v240 = v92:AddNewRow(l_NewPage_0, v229, "Selector", {
            v233, 
            v234
        }, v232, nil, v230);
        l_l_NewPage_0_9.PlayerNamesEnabledFrame = v238;
        l_l_NewPage_0_10.playerNamesEnabledLabel = v239;
        l_l_NewPage_0_11.playerNamesEnabledMode = v240;
        l_NewPage_0.PlayerNamesEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PlayerNamesEnabledFrame;
        l_NewPage_0.playerNamesEnabledMode.IndexChanged:connect(function(v241) --[[ Line: 776 ]]
            -- upvalues: l_GameSettings_0 (ref), v77 (ref), v141 (ref), v146 (ref)
            local l_PlayerNamesEnabled_0 = l_GameSettings_0.PlayerNamesEnabled;
            l_GameSettings_0.PlayerNamesEnabled = v241 == v77.On;
            v141("player_names_enabled", l_PlayerNamesEnabled_0, l_GameSettings_0.PlayerNamesEnabled);
            v146();
        end);
    end;
    local function v257() --[[ Line: 785 ]] --[[ Name: createPreferredTransparencyOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v244 = 10 - math.clamp(math.floor(l_GameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10);
        local v245 = v62:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency");
        local v246 = v62:FormatByKey("Feature.Accessibility.Description.PreferredTransparency");
        local v247 = v62:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent");
        local v248 = v62:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque");
        local l_l_NewPage_0_12 = l_NewPage_0;
        local l_l_NewPage_0_13 = l_NewPage_0;
        local l_l_NewPage_0_14 = l_NewPage_0;
        local v252, v253, v254 = v92:AddNewRow(l_NewPage_0, v245, "Slider", 10, v244, nil, v246, v247, v248);
        l_l_NewPage_0_12.PreferredTransparencyFrame = v252;
        l_l_NewPage_0_13.PreferredTransparencyLabel = v253;
        l_l_NewPage_0_14.PreferredTransparencySlider = v254;
        l_NewPage_0.PreferredTransparencyFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTransparencyFrame;
        l_NewPage_0.PreferredTransparencySlider.ValueChanged:connect(function(v255) --[[ Line: 811 ]]
            -- upvalues: l_GameSettings_0 (ref), v123 (ref), v141 (ref), v146 (ref)
            v255 = (10 - math.clamp(math.floor(v255), 0, 10)) / 10;
            local l_PreferredTransparency_0 = l_GameSettings_0.PreferredTransparency;
            l_GameSettings_0.PreferredTransparency = v255;
            if v123() then
                v141("preferred_transparency", l_PreferredTransparency_0, l_GameSettings_0.PreferredTransparency);
            end;
            v146();
        end);
    end;
    local function v272() --[[ Line: 823 ]] --[[ Name: createPreferredTextSizeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local l_EnumItems_0 = Enum.PreferredTextSize:GetEnumItems();
        local v259 = l_GameSettings_0.PreferredTextSize.Value - 1;
        local v260 = v62:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize");
        local v261 = v62:FormatByKey("Feature.Accessibility.Description.PreferredTextSize");
        local v262 = v62:FormatByKey("Feature.Accessibility.PreferredTextSize.Default");
        local v263 = v62:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest");
        local l_l_NewPage_0_15 = l_NewPage_0;
        local l_l_NewPage_0_16 = l_NewPage_0;
        local l_l_NewPage_0_17 = l_NewPage_0;
        local v267, v268, v269 = v92:AddNewRow(l_NewPage_0, v260, "Slider", 3, v259, nil, v261, v262, v263);
        l_l_NewPage_0_15.PreferredTextSizeFrame = v267;
        l_l_NewPage_0_16.PreferredTextSizeLabel = v268;
        l_l_NewPage_0_17.PreferredTextSizeSlider = v269;
        l_NewPage_0.PreferredTextSizeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PreferredTextSizeFrame;
        l_NewPage_0.PreferredTextSizeSlider.ValueChanged:connect(function(v270) --[[ Line: 848 ]]
            -- upvalues: l_GameSettings_0 (ref), l_EnumItems_0 (copy), v123 (ref), v141 (ref), v146 (ref)
            local l_PreferredTextSize_0 = l_GameSettings_0.PreferredTextSize;
            l_GameSettings_0.PreferredTextSize = l_EnumItems_0[v270 + 1];
            if v123() then
                v141("preferred_text_size", l_PreferredTextSize_0, l_GameSettings_0.PreferredTextSize);
            end;
            v146();
        end);
    end;
    local function v289() --[[ Line: 858 ]] --[[ Name: createUiNavigationKeyBindOptions ]]
        -- upvalues: l_GameSettings_0 (ref), v62 (ref), l_UserInputService_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v273 = {
            On = 1, 
            Off = 2
        };
        local l_Off_0 = v273.Off;
        if l_GameSettings_0.UiNavigationKeyBindEnabled then
            l_Off_0 = v273.On;
        end;
        local v275 = v62:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind");
        local v276 = v62:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v277 = v62:FormatByKey("InGame.CommonUI.Label.On");
        local v278 = v62:FormatByKey("InGame.CommonUI.Label.Off");
        local l_l_NewPage_0_18 = l_NewPage_0;
        local l_l_NewPage_0_19 = l_NewPage_0;
        local l_l_NewPage_0_20 = l_NewPage_0;
        local v282, v283, v284 = v92:AddNewRow(l_NewPage_0, v275, "Selector", {
            v277, 
            v278
        }, l_Off_0, nil, v276);
        l_l_NewPage_0_18.UiNavigationKeyBindEnabledFrame = v282;
        l_l_NewPage_0_19.UiNavigationKeyBindEnabledLabel = v283;
        l_l_NewPage_0_20.UiNavigationKeyBindEnabledMode = v284;
        l_NewPage_0.UiNavigationKeyBindEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiNavigationKeyBindEnabledFrame;
        l_NewPage_0.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(v285) --[[ Line: 889 ]]
            -- upvalues: l_GameSettings_0 (ref), v273 (copy), v123 (ref), v141 (ref), v146 (ref)
            local l_UiNavigationKeyBindEnabled_0 = l_GameSettings_0.UiNavigationKeyBindEnabled;
            l_GameSettings_0.UiNavigationKeyBindEnabled = v285 == v273.On;
            if v123() then
                v141("ui_navigation_key_bind_enabled", l_UiNavigationKeyBindEnabled_0, l_GameSettings_0.UiNavigationKeyBindEnabled);
            end;
            v146();
        end);
        l_l_NewPage_0_18 = function() --[[ Line: 902 ]] --[[ Name: updateUiNavigationKeyBindVisibility ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v273 (copy)
            local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_0;
                if l_KeyboardEnabled_0 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v273.On or v273.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v273.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end;
        l_l_NewPage_0_19 = l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
            l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_l_NewPage_0_19;
            if l_l_NewPage_0_19 then
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v273.On or v273.Off);
            else
                l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v273.Off);
                l_GameSettings_0.UiNavigationKeyBindEnabled = false;
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 917 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), v273 (copy)
            local l_KeyboardEnabled_1 = l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.UiNavigationKeyBindEnabledFrame then
                l_NewPage_0.UiNavigationKeyBindEnabledFrame.Visible = l_KeyboardEnabled_1;
                if l_KeyboardEnabled_1 then
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(l_GameSettings_0.UiNavigationKeyBindEnabled and v273.On or v273.Off);
                    return;
                else
                    l_NewPage_0.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v273.Off);
                    l_GameSettings_0.UiNavigationKeyBindEnabled = false;
                end;
            end;
        end);
    end;
    local function v301() --[[ Line: 922 ]] --[[ Name: createPerformanceStatsOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_Create_0 (ref), v96 (ref), v55 (ref), v123 (ref), v141 (ref), v146 (ref)
        local l_l_NewPage_0_21 = l_NewPage_0;
        local l_l_NewPage_0_22 = l_NewPage_0;
        local l_l_NewPage_0_23 = l_NewPage_0;
        local l_l_NewPage_0_24 = l_NewPage_0;
        local v294 = nil;
        local v295 = nil;
        local v296 = nil;
        local v297 = nil;
        l_l_NewPage_0_21.PerformanceStatsFrame = v294;
        l_l_NewPage_0_22.PerformanceStatsLabel = v295;
        l_l_NewPage_0_23.PerformanceStatsMode = v296;
        l_l_NewPage_0_24.PerformanceStatsOverrideText = v297;
        GetDesiredPerformanceStatsIndex = function() --[[ Line: 928 ]] --[[ Name: GetDesiredPerformanceStatsIndex ]]
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
        v294, v295, v296 = v92:AddNewRow(l_NewPage_0, "Performance Stats", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_21);
        l_l_NewPage_0_22.PerformanceStatsFrame = v294;
        l_l_NewPage_0_23.PerformanceStatsLabel = v295;
        l_l_NewPage_0_24.PerformanceStatsMode = v296;
        l_NewPage_0.PerformanceStatsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PerformanceStatsFrame;
        l_NewPage_0.PerformanceStatsOverrideText = l_Create_0("TextLabel")({
            Name = "PerformanceStatsLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v96.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v96.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v55 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v55 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v55 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.PerformanceStatsFrame
        });
        l_NewPage_0.PerformanceStatsMode.IndexChanged:connect(function(v298) --[[ Line: 957 ]]
            -- upvalues: v123 (ref), l_GameSettings_0 (ref), v141 (ref), v146 (ref)
            local v299 = nil;
            if v123() then
                v299 = l_GameSettings_0.PerformanceStatsVisible;
            end;
            if v298 == 1 then
                l_GameSettings_0.PerformanceStatsVisible = true;
            else
                l_GameSettings_0.PerformanceStatsVisible = false;
            end;
            if v123() then
                v141("show_performance_stats", v299, l_GameSettings_0.PerformanceStatsVisible);
            end;
            v146();
        end);
        l_GameSettings_0.PerformanceStatsVisibleChanged:connect(function() --[[ Line: 979 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v300 = GetDesiredPerformanceStatsIndex();
            if v300 ~= l_NewPage_0.PerformanceStatsMode.CurrentIndex then
                l_NewPage_0.PerformanceStatsMode:SetSelectionIndex(v300);
            end;
        end);
    end;
    local function v308() --[[ Line: 989 ]] --[[ Name: createWebServerInformationRow ]]
        -- upvalues: l_NewPage_0 (copy), v92 (ref), v57 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_TouchEnabled_0 (ref), l_Create_0 (ref), v96 (ref)
        local l_l_NewPage_0_25 = l_NewPage_0;
        local l_l_NewPage_0_26 = l_NewPage_0;
        local l_l_NewPage_0_27 = l_NewPage_0;
        local v305, v306, v307 = v92:AddNewRow(l_NewPage_0, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not v57 and nil);
        l_l_NewPage_0_25.InformationFrame = v305;
        l_l_NewPage_0_26.InformationLabel = v306;
        l_l_NewPage_0_27.InformationTextBox = v307;
        l_NewPage_0.InformationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.InformationFrame;
        l_NewPage_0.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        if l_TouchEnabled_0 then
            l_NewPage_0.InformationText = l_Create_0("TextLabel")({
                Name = "InformationLabel", 
                Text = "Information Loading", 
                Font = v96.font(Enum.Font.SourceSans), 
                FontSize = v96.fontSize(Enum.FontSize.Size18), 
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
                Font = v96.font(Enum.Font.SourceSans), 
                FontSize = v96.fontSize(Enum.FontSize.Size14), 
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
    local function v337() --[[ Line: 1029 ]] --[[ Name: createMicroProfilerOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v308 (copy), v118 (ref), v123 (ref), v117 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v141 (ref), v146 (ref), v62 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_l_NewPage_0_28 = l_NewPage_0;
        local l_l_NewPage_0_29 = l_NewPage_0;
        local l_l_NewPage_0_30 = l_NewPage_0;
        local l_l_NewPage_0_31 = l_NewPage_0;
        local v313 = nil;
        local v314 = nil;
        local v315 = nil;
        local v316 = nil;
        l_l_NewPage_0_28.MicroProfilerFrame = v313;
        l_l_NewPage_0_29.MicroProfilerLabel = v314;
        l_l_NewPage_0_30.MicroProfilerMode = v315;
        l_l_NewPage_0_31.MicroProfilerOverrideText = v316;
        l_l_NewPage_0_28 = function() --[[ Line: 1034 ]] --[[ Name: tryContentLabel ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v308 (ref)
            local l_MicroProfilerWebServerPort_0 = l_GameSettings_0.MicroProfilerWebServerPort;
            if l_MicroProfilerWebServerPort_0 ~= 0 then
                local l_l_NewPage_0_32 = l_NewPage_0;
                local l_l_NewPage_0_33 = l_NewPage_0;
                local v320, v321 = v308();
                l_l_NewPage_0_32.InformationFrame = v320;
                l_l_NewPage_0_33.InformationText = v321;
                l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_0;
                return true;
            else
                return false;
            end;
        end;
        l_l_NewPage_0_29 = function(v322) --[[ Line: 1046 ]] --[[ Name: setMicroProfilerIndex ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref), v118 (ref), v123 (ref), v308 (ref), v117 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_RbxAnalyticsService_0 (ref), v141 (ref), v146 (ref)
            local function __() --[[ Line: 1047 ]] --[[ Name: hideContentLabel ]]
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
            local v324 = nil;
            local v325 = nil;
            local v326 = nil;
            if v118 then
                if v123() then
                    v324 = "webserver";
                    v325 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
                if v322 == 1 then
                    l_GameSettings_0.MicroProfilerWebServerEnabled = true;
                    local v327 = 30;
                    while v327 >= 1 do
                        local l_MicroProfilerWebServerPort_1 = l_GameSettings_0.MicroProfilerWebServerPort;
                        local v329;
                        if l_MicroProfilerWebServerPort_1 ~= 0 then
                            local l_l_NewPage_0_34 = l_NewPage_0;
                            local l_l_NewPage_0_35 = l_NewPage_0;
                            local v332, v333 = v308();
                            l_l_NewPage_0_34.InformationFrame = v332;
                            l_l_NewPage_0_35.InformationText = v333;
                            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. l_MicroProfilerWebServerPort_1;
                            v329 = true;
                        else
                            v329 = false;
                        end;
                        if not v329 then
                            v327 = v327 - 1;
                            wait(0.1);
                        else
                            break;
                        end;
                    end;
                    if v327 <= 0 then
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
                if v123() then
                    v326 = l_GameSettings_0.MicroProfilerWebServerEnabled;
                end;
            elseif v117 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if v123() then
                    v324 = "regular";
                    v325 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
                l_GameSettings_0.OnScreenProfilerEnabled = v322 == 1;
                if v123() then
                    v326 = l_GameSettings_0.OnScreenProfilerEnabled;
                end;
            end;
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerSettingsPressed");
            if v123() then
                v141("microprofiler_enabled", v325, v326, {
                    microprofiler_type = v324
                });
            end;
            v146();
        end;
        l_l_NewPage_0_30 = function() --[[ Line: 1120 ]] --[[ Name: GetDesiredWebServerIndex ]]
            -- upvalues: v118 (ref), l_GameSettings_0 (ref), v117 (ref), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref)
            if v118 then
                if l_GameSettings_0.MicroProfilerWebServerEnabled then
                    return 1;
                else
                    return 2;
                end;
            elseif v117 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
                if l_GameSettings_0.OnScreenProfilerEnabled then
                    return 1;
                else
                    return 2;
                end;
            else
                return 2;
            end;
        end;
        l_l_NewPage_0_31 = if v118 then l_GameSettings_0.MicroProfilerWebServerEnabled and 1 or 2 else if v117 or l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then l_GameSettings_0.OnScreenProfilerEnabled and 1 or 2 else 2;
        v313 = v62:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler");
        v314 = l_NewPage_0;
        v315 = l_NewPage_0;
        v316 = l_NewPage_0;
        local v334, v335, v336 = v92:AddNewRow(l_NewPage_0, v313, "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_31);
        v314.MicroProfilerFrame = v334;
        v315.MicroProfilerLabel = v335;
        v316.MicroProfilerMode = v336;
        l_NewPage_0.MicroProfilerFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MicroProfilerFrame;
        v314 = l_GameSettings_0.MicroProfilerWebServerPort;
        if v314 ~= 0 then
            v315 = l_NewPage_0;
            v316 = l_NewPage_0;
            v334, v335 = v308();
            v315.InformationFrame = v334;
            v316.InformationText = v335;
            l_NewPage_0.InformationText.Text = l_GameSettings_0.MicroProfilerWebServerIP .. v314;
        end;
        v314 = false;
        l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 1149 ]]
            -- upvalues: v314 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            v314 = true;
            if l_GameSettings_0.OnScreenProfilerEnabled then
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(1);
                return;
            else
                l_NewPage_0.MicroProfilerMode:SetSelectionIndex(2);
                return;
            end;
        end);
        v315 = function(...) --[[ Line: 1159 ]] --[[ Name: onIndexChanged ]]
            -- upvalues: v314 (ref), l_l_NewPage_0_29 (copy)
            if v314 then
                v314 = false;
                return;
            else
                l_l_NewPage_0_29(...);
                return;
            end;
        end;
        l_NewPage_0.MicroProfilerMode.IndexChanged:connect(v315);
    end;
    local function v458(v338) --[[ Line: 1170 ]] --[[ Name: createCameraModeOptions ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v164 (copy), l_Create_0 (ref), v96 (ref), v55 (ref), v123 (ref), v141 (ref), v146 (ref), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref), v93 (ref), v71 (ref), l_VRService_0 (ref), v38 (ref), l_getAppFeaturePolicies_0 (ref), v62 (ref), l_Constants_0 (ref), v73 (ref), v74 (ref), v70 (ref), v69 (ref)
        local l_l_NewPage_0_36 = l_NewPage_0;
        local l_l_NewPage_0_37 = l_NewPage_0;
        local l_l_NewPage_0_38 = l_NewPage_0;
        local l_l_NewPage_0_39 = l_NewPage_0;
        local v343 = nil;
        local v344 = nil;
        local v345 = nil;
        local v346 = nil;
        l_l_NewPage_0_36.ShiftLockFrame = v343;
        l_l_NewPage_0_37.ShiftLockLabel = v344;
        l_l_NewPage_0_38.ShiftLockMode = v345;
        l_l_NewPage_0_39.ShiftLockOverrideText = v346;
        l_l_NewPage_0_36 = 2;
        if l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch then
            l_l_NewPage_0_36 = 1;
        end;
        l_l_NewPage_0_37 = l_NewPage_0;
        l_l_NewPage_0_38 = l_NewPage_0;
        l_l_NewPage_0_39 = l_NewPage_0;
        v343, v344, v345 = v92:AddNewRow(l_NewPage_0, "Shift Lock Switch", "Selector", {
            "On", 
            "Off"
        }, l_l_NewPage_0_36);
        l_l_NewPage_0_37.ShiftLockFrame = v343;
        l_l_NewPage_0_38.ShiftLockLabel = v344;
        l_l_NewPage_0_39.ShiftLockMode = v345;
        l_NewPage_0.ShiftLockFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ShiftLockFrame;
        v164[l_NewPage_0.ShiftLockFrame] = true;
        l_NewPage_0.ShiftLockOverrideText = l_Create_0("TextLabel")({
            Name = "ShiftLockOverrideLabel", 
            Text = "Set by Developer", 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v96.font(Enum.Font.SourceSans, "GameSettings"), 
            FontSize = v96.fontSize(Enum.FontSize.Size24, "GameSettings"), 
            BackgroundTransparency = 1, 
            Size = if v55 then UDim2.new(0.6, 0, 1, 0) else UDim2.new(0, 200, 1, 0), 
            Position = if v55 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(1, -350, 0, 0), 
            AnchorPoint = if v55 then Vector2.new(1, 0.5) else nil, 
            Visible = false, 
            ZIndex = 2, 
            Parent = l_NewPage_0.ShiftLockFrame
        });
        l_NewPage_0.ShiftLockMode.IndexChanged:connect(function(v347) --[[ Line: 1201 ]]
            -- upvalues: v123 (ref), l_GameSettings_0 (ref), v141 (ref), v146 (ref)
            local v348 = nil;
            if v123() then
                v348 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
            end;
            if v347 == 1 then
                l_GameSettings_0.ControlMode = Enum.ControlMode.MouseLockSwitch;
            else
                l_GameSettings_0.ControlMode = Enum.ControlMode.Classic;
            end;
            if v123() then
                v141("shift_lock_enabled", v348, l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
            end;
            v146();
        end);
        l_l_NewPage_0_37 = function(v349) --[[ Line: 1223 ]] --[[ Name: setShiftLockSelectorVisible ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v350 = v349 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v350;
                l_NewPage_0.ShiftLockMode:SetInteractable(v350);
            end;
        end;
        l_l_NewPage_0_38 = function() --[[ Line: 1231 ]] --[[ Name: applyDevOverrideShiftLockSelector ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref)
            local v351 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v351;
                local v352 = not v351 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v352;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v352);
                end;
            end;
        end;
        l_l_NewPage_0_39 = function() --[[ Line: 1239 ]] --[[ Name: updateShiftLockVisibility ]]
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
        end;
        v343 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
        if l_NewPage_0.ShiftLockFrame then
            l_NewPage_0.ShiftLockFrame.Visible = v343;
        end;
        v344 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v344;
            v346 = not v344 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v346;
                l_NewPage_0.ShiftLockMode:SetInteractable(v346);
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(function() --[[ Line: 1249 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v356 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v356;
            end;
            local v357 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v357;
                local v358 = not v357 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v358;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v358);
                end;
            end;
        end);
        l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 1253 ]]
            -- upvalues: l_UserInputService_0 (ref), l_NewPage_0 (ref), l_LocalPlayer_0 (ref)
            local v359 = l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled;
            if l_NewPage_0.ShiftLockFrame then
                l_NewPage_0.ShiftLockFrame.Visible = v359;
            end;
            local v360 = not l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockOverrideText then
                l_NewPage_0.ShiftLockOverrideText.Visible = v360;
                local v361 = not v360 and l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockMode then
                    l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v361;
                    l_NewPage_0.ShiftLockMode:SetInteractable(v361);
                end;
            end;
        end);
        cameraModeIsUserChoice = function() --[[ Line: 1259 ]] --[[ Name: cameraModeIsUserChoice ]]
            -- upvalues: l_UserInputService_0 (ref), l_LocalPlayer_0 (ref)
            if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                return l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
            else
                return l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
            end;
        end;
        setCameraModeVisible = function(v362) --[[ Line: 1268 ]] --[[ Name: setCameraModeVisible ]]
            -- upvalues: l_NewPage_0 (ref)
            if l_NewPage_0.CameraMode then
                l_NewPage_0.CameraMode.SelectorFrame.Visible = v362;
                l_NewPage_0.CameraMode:SetInteractable(v362);
                l_NewPage_0.CameraModeOverrideText.Visible = not v362;
            end;
        end;
        v343 = v93.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
        v344 = {};
        v345 = {};
        do
            local l_v344_0, l_v345_0 = v344, v345;
            v346 = function(v365) --[[ Line: 1282 ]] --[[ Name: updateCurrentCameraMovementIndex ]]
                -- upvalues: l_v345_0 (ref), l_v344_0 (ref), l_UserInputService_0 (ref), v123 (ref), l_GameSettings_0 (ref), v141 (ref)
                local v366 = nil;
                if not pcall(function() --[[ Line: 1284 ]]
                    -- upvalues: v366 (ref), l_v345_0 (ref), l_v344_0 (ref), v365 (copy)
                    v366 = l_v345_0[l_v344_0[v365]];
                end) or v366 == nil then
                    return false;
                else
                    local v367 = nil;
                    local v368 = nil;
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        if v123() then
                            v368 = l_GameSettings_0.TouchCameraMovementMode.Value;
                        end;
                        v367 = l_GameSettings_0.TouchCameraMovementMode.Value ~= v366;
                        l_GameSettings_0.TouchCameraMovementMode = v366;
                    else
                        if v123() then
                            v368 = l_GameSettings_0.ComputerCameraMovementMode.Value;
                        end;
                        v367 = l_GameSettings_0.ComputerCameraMovementMode.Value ~= v366;
                        l_GameSettings_0.ComputerCameraMovementMode = v366;
                    end;
                    if v123() and v367 then
                        v141("camera_mode", v368, v366);
                    end;
                    return v367;
                end;
            end;
            local l_v343_0 = v343 --[[ copy: 5 -> 23 ]];
            local l_v346_0 = v346 --[[ copy: 8 -> 24 ]];
            local function v377() --[[ Line: 1318 ]] --[[ Name: updateCameraMovementModes ]]
                -- upvalues: l_v343_0 (copy), l_UserInputService_0 (ref), l_v344_0 (ref), l_v345_0 (ref), v71 (ref), l_NewPage_0 (ref), l_GameSettings_0 (ref), l_v346_0 (copy)
                local v371 = {};
                if l_v343_0 then
                    v371 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then l_v343_0:GetRegisteredTouchCameraMovementModes() else l_v343_0:GetRegisteredComputerCameraMovementModes();
                end;
                l_v344_0 = {};
                l_v345_0 = {};
                if #v371 <= 0 then
                    setCameraModeVisible(false);
                    return;
                else
                    for v372 = 1, #v371 do
                        local v373 = v371[v372];
                        local l_Name_2 = v373.Name;
                        if l_Name_2 == "Default" then
                            l_Name_2 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v71.DEFAULT_FOLLOW else v71.DEFAULT_CLASSIC;
                        end;
                        l_v344_0[#l_v344_0 + 1] = l_Name_2;
                        l_v345_0[l_Name_2] = v373.Value;
                    end;
                    if l_NewPage_0.CameraMode then
                        l_NewPage_0.CameraMode:UpdateOptions(l_v344_0);
                    end;
                    local v375 = -1;
                    local v376 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                    v375 = if v376 then l_GameSettings_0.TouchCameraMovementMode.Value else l_GameSettings_0.ComputerCameraMovementMode.Value;
                    if v375 > -1 then
                        if v376 or l_GameSettings_0.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
                            v375 = v375 + 1;
                        end;
                        l_v346_0(v375);
                        l_NewPage_0.CameraMode:SetSelectionIndex(v375);
                    end;
                    setCameraModeVisible(cameraModeIsUserChoice());
                    return;
                end;
            end;
            local l_l_NewPage_0_40 = l_NewPage_0;
            local l_l_NewPage_0_41 = l_NewPage_0;
            local l_l_NewPage_0_42 = l_NewPage_0;
            local v381, v382, v383 = v92:AddNewRow(l_NewPage_0, "Camera Mode", "Selector", l_v344_0, 1);
            l_l_NewPage_0_40.CameraModeFrame = v381;
            l_l_NewPage_0_41.CameraModeLabel = v382;
            l_l_NewPage_0_42.CameraMode = v383;
            l_NewPage_0.CameraModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraModeFrame;
            v164[l_NewPage_0.CameraMode] = true;
            l_NewPage_0.CameraModeOverrideText = l_Create_0("TextLabel")({
                Name = "CameraDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v96.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v96.fontSize(Enum.FontSize.Size24, "GameSettings"), 
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
            if v343 then
                local l_v377_0 = v377 --[[ copy: 9 -> 30 ]];
                v343.TouchCameraMovementModeRegistered:connect(function(__) --[[ Line: 1404 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v377_0 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_v377_0();
                    end;
                end);
                v343.ComputerCameraMovementModeRegistered:connect(function(__) --[[ Line: 1410 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_v377_0 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_v377_0();
                    end;
                end);
            end;
            local l_v377_1 = v377 --[[ copy: 9 -> 25 ]];
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1417 ]]
                -- upvalues: l_v377_1 (copy)
                l_v377_1();
            end);
            l_l_NewPage_0_40 = false;
            local l_v346_1 = v346 --[[ copy: 8 -> 26 ]];
            l_NewPage_0.CameraMode.IndexChanged:connect(function(v389) --[[ Line: 1422 ]]
                -- upvalues: l_v346_1 (copy), l_l_NewPage_0_40 (ref), v146 (ref)
                if l_v346_1(v389) then
                    if l_l_NewPage_0_40 then
                        v146();
                    end;
                    l_l_NewPage_0_40 = true;
                end;
            end);
            v377();
        end;
        v343 = false;
        v344 = function() --[[ Line: 1438 ]] --[[ Name: createVROption ]]
            -- upvalues: v343 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v141 (ref)
            if not v343 then
                v343 = true;
                local v390 = nil;
                v390 = if l_GameSettings_0.VREnabled then {
                    "On", 
                    "Off (restart pending)"
                } else {
                    "On (restart pending)", 
                    "Off"
                };
                local l_l_NewPage_0_43 = l_NewPage_0;
                local l_l_NewPage_0_44 = l_NewPage_0;
                local l_l_NewPage_0_45 = l_NewPage_0;
                local v394, v395, v396 = v92:AddNewRow(l_NewPage_0, "VR", "Selector", v390, l_GameSettings_0.VREnabled and 1 or 2);
                l_l_NewPage_0_43.VREnabledFrame = v394;
                l_l_NewPage_0_44.VREnabledLabel = v395;
                l_l_NewPage_0_45.VREnabledSelector = v396;
                l_NewPage_0.VREnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VREnabledFrame;
                do
                    local l_v390_0 = v390;
                    l_NewPage_0.VREnabledSelector.IndexChanged:connect(function(v398) --[[ Line: 1453 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v390_0 (ref), v141 (ref)
                        local v399 = {
                            On = {
                                Name = "On", 
                                Value = 1
                            }, 
                            Off = {
                                Name = "Off", 
                                Value = 2
                            }
                        };
                        local v400 = v398 == v399.On.Value;
                        if l_GameSettings_0.VREnabled ~= v400 then
                            l_GameSettings_0.VREnabled = v400;
                            local v401 = l_v390_0[v399.On.Value];
                            local v402 = l_v390_0[v398];
                            if v402 == l_v390_0[v399.On.Value] then
                                v401 = l_v390_0[v399.Off.Value];
                            end;
                            v141("vr_mode", v401, v402);
                        end;
                    end);
                end;
            end;
        end;
        v345 = function() --[[ Line: 1472 ]] --[[ Name: onVREnabledChanged ]]
            -- upvalues: l_VRService_0 (ref), l_GameSettings_0 (ref), v344 (copy)
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v344();
                return;
            else
                if l_GameSettings_0.HasEverUsedVR then
                    v344();
                end;
                return;
            end;
        end;
        if v38() and l_getAppFeaturePolicies_0().getIsLinkedVRModeAvailable() then
            v344();
        else
            if l_VRService_0.VREnabled then
                l_GameSettings_0.HasEverUsedVR = true;
                v344();
            elseif l_GameSettings_0.HasEverUsedVR then
                v344();
            end;
            l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v345);
        end;
        v346 = {};
        local v403 = {};
        local v404 = {};
        local v405 = {};
        local function v407(__) --[[ Line: 1497 ]]

        end;
        local function __(v408) --[[ Line: 1501 ]] --[[ Name: setMovementModeVisible ]]
            -- upvalues: l_NewPage_0 (ref), v346 (ref)
            if l_NewPage_0.MovementMode then
                local v409 = v408 and #v346 > 0;
                l_NewPage_0.MovementMode.SelectorFrame.Visible = v409;
                l_NewPage_0.MovementMode:SetInteractable(v409);
                l_NewPage_0.MovementModeOverrideText.Visible = not v409;
            end;
        end;
        if v338 then
            local v411 = {};
            local v412 = v93.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
            local function __(v413) --[[ Line: 1515 ]] --[[ Name: getDisplayName ]]
                -- upvalues: l_UserInputService_0 (ref), v62 (ref), l_Constants_0 (ref), v73 (ref), v74 (ref)
                local l_v413_0 = v413;
                if v413 == "Default" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return (v62:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey));
                    else
                        return v73.DEFAULT_KEYBOARD;
                    end;
                elseif v413 == "KeyboardMouse" then
                    return "Keyboard + Mouse";
                elseif v413 == "ClickToMove" then
                    if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                        return v73.TAP_TO_MOVE;
                    else
                        return v73.CLICK_TO_MOVE;
                    end;
                elseif v413 == "DynamicThumbstick" then
                    return "Dynamic Thumbstick";
                else
                    if v413 == "Thumbstick" then
                        l_v413_0 = v74;
                    end;
                    return l_v413_0;
                end;
            end;
            local l_l_NewPage_0_46 = l_NewPage_0;
            local l_l_NewPage_0_47 = l_NewPage_0;
            local l_l_NewPage_0_48 = l_NewPage_0;
            local v419, v420, v421 = v92:AddNewRow(l_NewPage_0, "Movement Mode", "Selector", v411, 1);
            l_l_NewPage_0_46.MovementModeFrame = v419;
            l_l_NewPage_0_47.MovementModeLabel = v420;
            l_l_NewPage_0_48.MovementMode = v421;
            l_NewPage_0.MovementModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MovementModeFrame;
            v164[l_NewPage_0.MovementMode] = true;
            l_NewPage_0.MovementModeOverrideText = l_Create_0("TextLabel")({
                Name = "MovementDevOverrideLabel", 
                Text = "Set by Developer", 
                TextColor3 = Color3.new(1, 1, 1), 
                Font = v96.font(Enum.Font.SourceSans, "GameSettings"), 
                FontSize = v96.fontSize(Enum.FontSize.Size24, "GameSettings"), 
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
            l_l_NewPage_0_46 = function(v422) --[[ Line: 1556 ]] --[[ Name: setMovementMode ]]
                -- upvalues: v123 (ref), l_GameSettings_0 (ref), v141 (ref)
                local v423 = nil;
                if v422.EnumType == Enum.TouchMovementMode then
                    if v123() then
                        v423 = l_GameSettings_0.TouchMovementMode;
                    end;
                    l_GameSettings_0.TouchMovementMode = v422;
                else
                    if v123() then
                        v423 = l_GameSettings_0.ComputerMovementMode;
                    end;
                    l_GameSettings_0.ComputerMovementMode = v422;
                end;
                if v123() then
                    v141("movement_mode", v423, v422);
                end;
            end;
            v407 = function(v424) --[[ Line: 1573 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v346 (ref)
                local v425 = nil;
                v425 = if v424 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                local l_v425_0 = v425;
                if l_NewPage_0.MovementMode then
                    local v427 = l_v425_0 and #v346 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v427;
                    l_NewPage_0.MovementMode:SetInteractable(v427);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v427;
                end;
                if l_NewPage_0.MovementModeOverrideText then
                    l_NewPage_0.MovementModeOverrideText.Visible = not v425;
                end;
            end;
            local l_v412_0 = v412 --[[ copy: 15 -> 27 ]];
            local l_l_l_NewPage_0_46_0 = l_l_NewPage_0_46 --[[ copy: 17 -> 28 ]];
            l_l_NewPage_0_47 = function() --[[ Line: 1585 ]] --[[ Name: updateMovementModes ]]
                -- upvalues: l_UserInputService_0 (ref), l_v412_0 (copy), v346 (ref), v403 (ref), v404 (ref), v405 (ref), l_NewPage_0 (ref), v62 (ref), l_Constants_0 (ref), v73 (ref), v74 (ref), l_GameSettings_0 (ref), l_l_l_NewPage_0_46_0 (copy), v407 (ref)
                local v430 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
                if l_v412_0 then
                    if v430 then
                        v346 = l_v412_0:GetRegisteredTouchMovementModes();
                    else
                        v346 = l_v412_0:GetRegisteredComputerMovementModes();
                    end;
                end;
                v403 = {};
                v404 = {};
                v405 = {};
                if #v346 <= 0 then
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                        l_NewPage_0.MovementMode:SetInteractable(false);
                        l_NewPage_0.MovementModeOverrideText.Visible = true;
                    end;
                    return;
                else
                    if l_NewPage_0.MovementMode then
                        local v431 = #v346 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v431;
                        l_NewPage_0.MovementMode:SetInteractable(v431);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v431;
                    end;
                    for v432, v433 in v346 do
                        v404[v432] = v433;
                        local l_v405_0 = v405;
                        local l_Name_3 = v433.Name;
                        local l_l_Name_3_0 = l_Name_3;
                        if l_Name_3 == "Default" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v62:FormatByKey(l_Constants_0.MovementModeDynamicThumbstickKey) else v73.DEFAULT_KEYBOARD;
                        elseif l_Name_3 == "KeyboardMouse" then
                            l_l_Name_3_0 = "Keyboard + Mouse";
                        elseif l_Name_3 == "ClickToMove" then
                            l_l_Name_3_0 = if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then v73.TAP_TO_MOVE else v73.CLICK_TO_MOVE;
                        elseif l_Name_3 == "DynamicThumbstick" then
                            l_l_Name_3_0 = "Dynamic Thumbstick";
                        elseif l_Name_3 == "Thumbstick" then
                            l_l_Name_3_0 = v74;
                        end;
                        l_v405_0[v432] = l_l_Name_3_0;
                        v403[v433] = v432;
                    end;
                    if l_NewPage_0.MovementMode then
                        l_NewPage_0.MovementMode:UpdateOptions(v405);
                    end;
                    local v437 = nil;
                    v437 = if v430 then l_GameSettings_0.TouchMovementMode else l_GameSettings_0.ComputerMovementMode;
                    if v437 then
                        l_l_l_NewPage_0_46_0(v437);
                        l_NewPage_0.MovementMode:SetSelectionIndex(v403[v437]);
                    end;
                    v407(v430);
                    return;
                end;
            end;
            l_l_NewPage_0_47();
            if v412 then
                v412.TouchMovementModeRegistered:connect(function(__) --[[ Line: 1629 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.TouchEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
                v412.ComputerMovementModeRegistered:connect(function(__) --[[ Line: 1635 ]]
                    -- upvalues: l_UserInputService_0 (ref), l_l_NewPage_0_47 (copy)
                    if l_UserInputService_0.MouseEnabled then
                        l_l_NewPage_0_47();
                    end;
                end);
            end;
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1642 ]]
                -- upvalues: l_l_NewPage_0_47 (copy)
                l_l_NewPage_0_47();
            end);
            local l_l_l_NewPage_0_46_1 = l_l_NewPage_0_46 --[[ copy: 17 -> 29 ]];
            l_NewPage_0.MovementMode.IndexChanged:connect(function(v441) --[[ Line: 1646 ]]
                -- upvalues: l_l_l_NewPage_0_46_1 (copy), v404 (ref), v146 (ref)
                l_l_l_NewPage_0_46_1(v404[v441]);
                v146();
            end);
        end;
        local v442 = false;
        local v443 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
        if not if v443 then l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice else l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            l_NewPage_0.CameraModeOverrideText.Visible = true;
            setCameraModeVisible(false);
        else
            l_NewPage_0.CameraModeOverrideText.Visible = false;
            setCameraModeVisible(true);
        end;
        local v444 = false;
        v444 = if v443 then l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice else l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
        if l_NewPage_0.MovementModeOverrideText then
            if not v444 then
                l_NewPage_0.MovementModeOverrideText.Visible = true;
                if l_NewPage_0.MovementMode then
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = false;
                    l_NewPage_0.MovementMode:SetInteractable(false);
                    l_NewPage_0.MovementModeOverrideText.Visible = true;
                end;
            else
                l_NewPage_0.MovementModeOverrideText.Visible = false;
                if l_NewPage_0.MovementMode then
                    local v445 = #v346 > 0;
                    l_NewPage_0.MovementMode.SelectorFrame.Visible = v445;
                    l_NewPage_0.MovementMode:SetInteractable(v445);
                    l_NewPage_0.MovementModeOverrideText.Visible = not v445;
                end;
            end;
        end;
        local v446 = not l_LocalPlayer_0.DevEnableMouseLock;
        if l_NewPage_0.ShiftLockOverrideText then
            l_NewPage_0.ShiftLockOverrideText.Visible = v446;
            local v447 = not v446 and l_LocalPlayer_0.DevEnableMouseLock;
            if l_NewPage_0.ShiftLockMode then
                l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v447;
                l_NewPage_0.ShiftLockMode:SetInteractable(v447);
            end;
        end;
        v442 = function(v448) --[[ Line: 1692 ]] --[[ Name: updateUserSettingsMenu ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_NewPage_0 (ref), v407 (ref), v346 (ref)
            if v448 == "DevEnableMouseLock" then
                local v449 = not l_LocalPlayer_0.DevEnableMouseLock;
                if l_NewPage_0.ShiftLockOverrideText then
                    l_NewPage_0.ShiftLockOverrideText.Visible = v449;
                    local v450 = not v449 and l_LocalPlayer_0.DevEnableMouseLock;
                    if l_NewPage_0.ShiftLockMode then
                        l_NewPage_0.ShiftLockMode.SelectorFrame.Visible = v450;
                        l_NewPage_0.ShiftLockMode:SetInteractable(v450);
                        return;
                    end;
                end;
            elseif v448 == "DevComputerCameraMode" then
                local v451 = l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice;
                setCameraModeVisible(v451);
                l_NewPage_0.CameraModeOverrideText.Visible = not v451;
                return;
            elseif v448 == "DevComputerMovementMode" then
                if v407 ~= nil then
                    v407(false);
                    return;
                else
                    local v452 = l_LocalPlayer_0.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v453 = v452 and #v346 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v453;
                        l_NewPage_0.MovementMode:SetInteractable(v453);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v453;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v452;
                        return;
                    end;
                end;
            elseif v448 == "DevTouchMovementMode" then
                if v407 ~= nil then
                    v407(true);
                    return;
                else
                    local v454 = l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice;
                    if l_NewPage_0.MovementMode then
                        local v455 = v454 and #v346 > 0;
                        l_NewPage_0.MovementMode.SelectorFrame.Visible = v455;
                        l_NewPage_0.MovementMode:SetInteractable(v455);
                        l_NewPage_0.MovementModeOverrideText.Visible = not v455;
                    end;
                    if l_NewPage_0.MovementModeOverrideText then
                        l_NewPage_0.MovementModeOverrideText.Visible = not v454;
                        return;
                    end;
                end;
            elseif v448 == "DevTouchCameraMode" then
                local v456 = l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice;
                setCameraModeVisible(v456);
                l_NewPage_0.CameraModeOverrideText.Visible = not v456;
            end;
        end;
        l_LocalPlayer_0.Changed:connect(function(v457) --[[ Line: 1727 ]]
            -- upvalues: v70 (ref), v442 (copy), v69 (ref)
            if v70[v457] then
                v442(v457);
            end;
            if v69[v457] then
                v442(v457);
            end;
        end);
    end;
    local function v480() --[[ Line: 1740 ]] --[[ Name: createFeedbackModeOptions ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v131 (ref), l_NewPage_0 (copy), l_SafetyService_0 (ref), v20 (ref), v141 (ref), v130 (ref), v92 (ref), v76 (ref), v62 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v125 (ref), v114 (ref)
        local v459 = l_Url_0.ROLES_URL .. "v1/users/authenticated/roles";
        local v460 = l_HttpService_0:RequestInternal({
            Url = v459, 
            Method = "GET"
        });
        local function v469(v461) --[[ Line: 1747 ]] --[[ Name: rolesCheckCallback ]]
            -- upvalues: v131 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v141 (ref), v130 (ref), v92 (ref), v76 (ref), v62 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v461 then
                if not v131 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                    return;
                else
                    local function v462() --[[ Line: 1759 ]] --[[ Name: onToggleFeedbackMode ]]
                        -- upvalues: v131 (ref), l_NewPage_0 (ref), l_SafetyService_0 (ref), v20 (ref), v141 (ref)
                        if v131 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_NewPage_0.FeedbackEntryPointEnabled then
                            return;
                        else
                            l_NewPage_0.HubRef:PopMenu(false, true);
                            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                                l_SafetyService_0.IsCaptureModeForReport = false;
                            end;
                            if v20 ~= nil then
                                v20:ToggleCaptureMode();
                            end;
                            v141("translation_feedback", "", "pressed");
                            return;
                        end;
                    end;
                    local v463 = nil;
                    local v464 = nil;
                    if v130 then
                        local v465, v466 = v92:MakeStyledButton("toggleFeedbackModeButton", v76, UDim2.new(1, 0, 1, -20), v462, l_NewPage_0);
                        v463 = v465;
                        v464 = v466;
                        v463.Size = UDim2.new(0.6, 0, 0, 40);
                        v463.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v463.AnchorPoint = Vector2.new(0, 0.5);
                    else
                        local v467, v468 = v92:MakeStyledButton("toggleFeedbackModeButton", v76, UDim2.new(0, 300, 1, -20), v462, l_NewPage_0);
                        v463 = v467;
                        v464 = v468;
                        v463.Size = UDim2.new(0, 300, 0, 30);
                        v463.Position = UDim2.new(0.4, 0, 0.5, 0);
                        v463.AnchorPoint = Vector2.new(0, 0.5);
                    end;
                    v463.ZIndex = 2;
                    v463.Selectable = true;
                    v464.ZIndex = 2;
                    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
                        l_NewPage_0.toggleFeedbackModeButton = v463;
                        l_NewPage_0.toggleFeedbackModeText = v464;
                    end;
                    if v130 then
                        v92:AddNewRowObject(l_NewPage_0, v62:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v463, nil, true).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                        return;
                    else
                        v92:AddNewRowObject(l_NewPage_0, v62:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v463).LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FeedbackModeButton;
                    end;
                end;
            end;
        end;
        if v125 then
            v469(true);
            return;
        else
            v460:Start(function(v470, v471) --[[ Line: 1843 ]]
                -- upvalues: l_HttpService_0 (ref), v114 (ref), v459 (copy), v469 (copy)
                local v472 = false;
                local v473 = false;
                local v474 = nil;
                if not v470 then
                    v474 = "Roles Api Request: Connection error";
                elseif v471.StatusCode == 401 then
                    v474 = "Roles Api Request: Unauthorized";
                elseif v471.StatusCode < 200 or v471.StatusCode >= 400 then
                    v474 = "Roles Api Status code: " .. v471.StatusCode;
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 1855 ]]
                        -- upvalues: l_HttpService_0 (ref), v471 (copy), v472 (ref)
                        local v475 = l_HttpService_0:JSONDecode(v471.Body);
                        for __, v477 in pairs(v475.roles) do
                            if v477 == "Soothsayer" then
                                v472 = true;
                            end;
                        end;
                    end);
                    v473 = l_status_0;
                    v474 = l_result_0;
                end;
                if not v473 then
                    v114:warning("Feedback Mode initialization api call failed with url: " .. v459 .. " and with error message: " .. v474);
                end;
                v469(v472);
            end);
            return;
        end;
    end;
    local function v703() --[[ Line: 1883 ]] --[[ Name: createTranslationOptions ]]
        -- upvalues: l_Players_0 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v114 (ref), l_NewPage_0 (copy), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_LocalPlayer_0 (ref), v141 (ref), l_RunService_0 (ref)
        local v481 = 1;
        local v482 = 1;
        local v483 = false;
        local v484 = nil;
        local v485 = nil;
        local l_LocaleId_0 = l_Players_0.LocalPlayer.LocaleId;
        local v487 = nil;
        local v488 = nil;
        local v489 = {};
        local v490 = {};
        local v491 = {};
        local v492 = {};
        local v493 = {};
        local v494 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
        local v495 = l_HttpService_0:RequestInternal({
            Url = v494, 
            Method = "GET"
        });
        local v496 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
        local v497 = l_HttpService_0:RequestInternal({
            Url = v496, 
            Method = "GET"
        });
        local v498 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId);
        local v499 = l_HttpService_0:RequestInternal({
            Url = v498, 
            Method = "GET"
        });
        local v500 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
        local v501 = l_HttpService_0:RequestInternal({
            Url = v500, 
            Method = "GET"
        });
        local function v538(v502, v503) --[[ Line: 1948 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
            -- upvalues: v114 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v493 (copy), v491 (copy), v484 (ref), v489 (copy), v488 (ref), v490 (copy), v481 (ref), v482 (ref), l_LocalPlayer_0 (ref), v485 (ref), v141 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v483 (ref), l_RunService_0 (ref)
            if not v502 then
                if v503 == nil then
                    v503 = "Execution path did not set earliest error to non-nil value.";
                end;
                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v503);
                local l_l_NewPage_0_49 = l_NewPage_0;
                local l_l_NewPage_0_50 = l_NewPage_0;
                local l_l_NewPage_0_51 = l_NewPage_0;
                local v507, v508, v509 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v75
                }, 1);
                l_l_NewPage_0_49.LanguageSelectorFrame = v507;
                l_l_NewPage_0_50.LanguageSelectorLabel = v508;
                l_l_NewPage_0_51.LanguageSelectorMode = v509;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            else
                local v510 = false;
                table.insert(v493, v491[v484].languageName .. " (Original)");
                for __, v512 in pairs(v489) do
                    if v512 == v488 then
                        v510 = true;
                    end;
                    if v512 ~= v484 then
                        table.insert(v493, v491[v512].languageName);
                    end;
                end;
                if v510 == true then
                    for v513, v514 in pairs(v493) do
                        if v513 ~= 1 and v490[v514] == v488 then
                            v481 = v513;
                            v482 = v513;
                        end;
                    end;
                end;
                local l_l_NewPage_0_52 = l_NewPage_0;
                local l_l_NewPage_0_53 = l_NewPage_0;
                local l_l_NewPage_0_54 = l_NewPage_0;
                local v518, v519, v520 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v493, v481);
                l_l_NewPage_0_52.LanguageSelectorFrame = v518;
                l_l_NewPage_0_53.LanguageSelectorLabel = v519;
                l_l_NewPage_0_54.LanguageSelectorMode = v520;
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                if v481 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485);
                else
                    l_l_NewPage_0_52 = v490[v493[v481]];
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v491[l_l_NewPage_0_52].localeCode);
                end;
                l_NewPage_0.LanguageSelectorMode.CurrentLanguage = l_NewPage_0.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                l_l_NewPage_0_52 = function(v521) --[[ Line: 2028 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: l_NewPage_0 (ref), v491 (ref), v484 (ref), v490 (ref), v493 (ref), v141 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v482 (ref), l_LocalPlayer_0 (ref), v485 (ref), v114 (ref), v483 (ref), l_RunService_0 (ref)
                    l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                    local v522 = nil;
                    v522 = if v521 == 1 then v491[v484].id else v491[v490[v493[v521]]].id;
                    local l_CurrentLanguage_0 = l_NewPage_0.LanguageSelectorMode.CurrentLanguage;
                    local v524 = v493[v521];
                    if l_CurrentLanguage_0 ~= v524 then
                        l_NewPage_0.LanguageSelectorMode.CurrentLanguage = v524;
                        v141("experience_language", l_CurrentLanguage_0, v524);
                    end;
                    local v525 = {
                        settingValue = {
                            settingType = "LanguageFamily", 
                            settingTargetId = v522
                        }
                    };
                    local v526 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v527 = l_HttpService_0:RequestInternal({
                        Url = v526, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v525)
                    });
                    local function v531(v528, v529) --[[ Line: 2075 ]] --[[ Name: callback ]]
                        -- upvalues: v482 (ref), v521 (copy), l_LocalPlayer_0 (ref), v485 (ref), v490 (ref), v493 (ref), v491 (ref), v114 (ref), v483 (ref), l_NewPage_0 (ref)
                        if v528 then
                            v482 = v521;
                            if v521 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485);
                            else
                                local v530 = v490[v493[v521]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v491[v530].localeCode);
                            end;
                        else
                            v114:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v529);
                            v483 = true;
                            l_NewPage_0.LanguageSelectorMode:SetSelectionIndex(v482);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v482 = v521;
                        if v521 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485);
                        else
                            local v532 = v490[v493[v521]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v491[v532].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v483 then
                        v483 = false;
                        v482 = v521;
                        if v521 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v485);
                        else
                            local v533 = v490[v493[v521]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v491[v533].localeCode);
                        end;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(true);
                        return;
                    else
                        v527:Start(function(v534, v535) --[[ Line: 2118 ]]
                            -- upvalues: v114 (ref), v526 (copy), v531 (copy)
                            local v536 = false;
                            local v537 = nil;
                            if not v534 then
                                v537 = "User Experience Language Settings Update Request: Connection error";
                            elseif v535.StatusCode == 401 then
                                v537 = "User Experience Language Settings Update Request: Unauthorized";
                            elseif v535.StatusCode < 200 or v535.StatusCode >= 400 then
                                v537 = "User Experience Language Settings Update Request Status Code: " .. v535.StatusCode;
                            else
                                v114:info("User Experience Language Settings Update Request succeeded with code: " .. v535.StatusCode);
                                v536 = true;
                            end;
                            if not v536 then
                                v114:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v526 .. " with error message: " .. v537);
                            end;
                            v531(v536, v537);
                        end);
                        return;
                    end;
                end;
                l_NewPage_0.LanguageSelectorMode.IndexChanged:connect(l_l_NewPage_0_52);
                return;
            end;
        end;
        local function __(v539, v540) --[[ Line: 2153 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
            -- upvalues: v501 (copy), l_HttpService_0 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (copy), v114 (ref), v500 (copy), v538 (copy), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v539 then
                v501:Start(function(v541, v542) --[[ Line: 2155 ]]
                    -- upvalues: l_HttpService_0 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v114 (ref), v500 (ref), v538 (ref)
                    local v543 = false;
                    local v544 = nil;
                    if not v541 then
                        v544 = "User Experience Language Setting Request: Connection error";
                    elseif v542.StatusCode == 401 then
                        v544 = "User Experience Language Setting Request: Unauthorized";
                    elseif v542.StatusCode < 200 or v542.StatusCode >= 400 then
                        v544 = "User Experience Language Setting Request Status code: " .. v542.StatusCode;
                    else
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 2166 ]]
                            -- upvalues: l_HttpService_0 (ref), v542 (copy), v488 (ref), v487 (ref), v484 (ref), v492 (ref)
                            local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v542.Body).userUniverseLocalizationSettingValue;
                            if l_userUniverseLocalizationSettingValue_0 == nil then
                                v488 = v487;
                                return;
                            else
                                if l_userUniverseLocalizationSettingValue_0.settingType == "SourceOrTranslation" then
                                    if l_userUniverseLocalizationSettingValue_0.settingTargetId == 1 then
                                        v488 = v484;
                                    else
                                        v488 = v487;
                                    end;
                                end;
                                if l_userUniverseLocalizationSettingValue_0.settingType == "LanguageFamily" then
                                    if v492[l_userUniverseLocalizationSettingValue_0.settingTargetId] == nil then
                                        v488 = v487;
                                        return;
                                    else
                                        v488 = v492[l_userUniverseLocalizationSettingValue_0.settingTargetId];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v543 = l_status_1;
                        v544 = l_result_1;
                    end;
                    if not v543 then
                        v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v500 .. " with error message: " .. v544);
                    end;
                    v538(v543, v544);
                end);
                return;
            else
                local l_v540_0 = v540;
                if l_v540_0 == nil then
                    l_v540_0 = "Execution path did not set earliest error to non-nil value.";
                end;
                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v540_0);
                local l_l_NewPage_0_55 = l_NewPage_0;
                local l_l_NewPage_0_56 = l_NewPage_0;
                local l_l_NewPage_0_57 = l_NewPage_0;
                local v552, v553, v554 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v75
                }, 1);
                l_l_NewPage_0_55.LanguageSelectorFrame = v552;
                l_l_NewPage_0_56.LanguageSelectorLabel = v553;
                l_l_NewPage_0_57.LanguageSelectorMode = v554;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                return;
            end;
        end;
        local function __(v556, v557) --[[ Line: 2215 ]] --[[ Name: experienceSourceLanguageCallback ]]
            -- upvalues: v499 (copy), l_HttpService_0 (ref), v489 (copy), v114 (ref), v498 (copy), v501 (copy), v488 (ref), v487 (ref), v484 (ref), v492 (copy), v500 (copy), v538 (copy), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v556 then
                v499:Start(function(v558, v559) --[[ Line: 2217 ]]
                    -- upvalues: l_HttpService_0 (ref), v489 (ref), v114 (ref), v498 (ref), v557 (ref), v556 (copy), v501 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v500 (ref), v538 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v560 = false;
                    local v561 = nil;
                    if not v558 then
                        v561 = "Experience Supported Language Request: Connection error";
                    elseif v559.StatusCode == 401 then
                        v561 = "Experience Supported Language Request: Unauthorized";
                    elseif v559.StatusCode < 200 or v559.StatusCode >= 400 then
                        v561 = "Experience Supported Language Request Status code: " .. v559.StatusCode;
                    else
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 2227 ]]
                            -- upvalues: l_HttpService_0 (ref), v559 (copy), v489 (ref)
                            local v562 = l_HttpService_0:JSONDecode(v559.Body);
                            for v563, v564 in pairs(v562.data) do
                                v489[v563] = v564.languageCode;
                            end;
                        end);
                        v560 = l_status_2;
                        v561 = l_result_2;
                    end;
                    if not v560 then
                        v114:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v498 .. " with error message: " .. v561);
                    end;
                    if v557 == nil then
                        v557 = v561;
                    end;
                    local v567 = v560 and v556;
                    local l_v557_0 = v557;
                    if v567 then
                        v501:Start(function(v569, v570) --[[ Line: 2155 ]]
                            -- upvalues: l_HttpService_0 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v114 (ref), v500 (ref), v538 (ref)
                            local v571 = false;
                            local v572 = nil;
                            if not v569 then
                                v572 = "User Experience Language Setting Request: Connection error";
                            elseif v570.StatusCode == 401 then
                                v572 = "User Experience Language Setting Request: Unauthorized";
                            elseif v570.StatusCode < 200 or v570.StatusCode >= 400 then
                                v572 = "User Experience Language Setting Request Status code: " .. v570.StatusCode;
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 2166 ]]
                                    -- upvalues: l_HttpService_0 (ref), v570 (copy), v488 (ref), v487 (ref), v484 (ref), v492 (ref)
                                    local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v570.Body).userUniverseLocalizationSettingValue;
                                    if l_userUniverseLocalizationSettingValue_1 == nil then
                                        v488 = v487;
                                        return;
                                    else
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "SourceOrTranslation" then
                                            if l_userUniverseLocalizationSettingValue_1.settingTargetId == 1 then
                                                v488 = v484;
                                            else
                                                v488 = v487;
                                            end;
                                        end;
                                        if l_userUniverseLocalizationSettingValue_1.settingType == "LanguageFamily" then
                                            if v492[l_userUniverseLocalizationSettingValue_1.settingTargetId] == nil then
                                                v488 = v487;
                                                return;
                                            else
                                                v488 = v492[l_userUniverseLocalizationSettingValue_1.settingTargetId];
                                            end;
                                        end;
                                        return;
                                    end;
                                end);
                                v571 = l_status_3;
                                v572 = l_result_3;
                            end;
                            if not v571 then
                                v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v500 .. " with error message: " .. v572);
                            end;
                            v538(v571, v572);
                        end);
                        return;
                    else
                        local l_l_v557_0_0 = l_v557_0;
                        if l_l_v557_0_0 == nil then
                            l_l_v557_0_0 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v557_0_0);
                        local l_l_NewPage_0_58 = l_NewPage_0;
                        local l_l_NewPage_0_59 = l_NewPage_0;
                        local l_l_NewPage_0_60 = l_NewPage_0;
                        local v580, v581, v582 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v75
                        }, 1);
                        l_l_NewPage_0_58.LanguageSelectorFrame = v580;
                        l_l_NewPage_0_59.LanguageSelectorLabel = v581;
                        l_l_NewPage_0_60.LanguageSelectorMode = v582;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                        return;
                    end;
                end);
            else
                local l_v557_1 = v557;
                if l_v557_1 == nil then
                    l_v557_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v557_1);
                local l_l_NewPage_0_61 = l_NewPage_0;
                local l_l_NewPage_0_62 = l_NewPage_0;
                local l_l_NewPage_0_63 = l_NewPage_0;
                local v587, v588, v589 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v75
                }, 1);
                l_l_NewPage_0_61.LanguageSelectorFrame = v587;
                l_l_NewPage_0_62.LanguageSelectorLabel = v588;
                l_l_NewPage_0_63.LanguageSelectorMode = v589;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
            end;
        end;
        local function __(v591, v592) --[[ Line: 2256 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
            -- upvalues: v497 (copy), l_HttpService_0 (ref), v484 (ref), v485 (ref), v491 (copy), v114 (ref), v496 (copy), v499 (copy), v489 (copy), v498 (copy), v501 (copy), v488 (ref), v487 (ref), v492 (copy), v500 (copy), v538 (copy), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            if v591 then
                v497:Start(function(v593, v594) --[[ Line: 2258 ]]
                    -- upvalues: l_HttpService_0 (ref), v484 (ref), v485 (ref), v491 (ref), v114 (ref), v496 (ref), v592 (ref), v591 (copy), v499 (ref), v489 (ref), v498 (ref), v501 (ref), v488 (ref), v487 (ref), v492 (ref), v500 (ref), v538 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v595 = false;
                    local v596 = nil;
                    if not v593 then
                        v596 = "Experience Source Language Request: Connection error";
                    elseif v594.StatusCode == 401 then
                        v596 = "Experience Source Language Request: Unauthorized";
                    elseif v594.StatusCode < 200 or v594.StatusCode >= 400 then
                        v596 = "Experience Source Language Status code: " .. v594.StatusCode;
                    else
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 2269 ]]
                            -- upvalues: l_HttpService_0 (ref), v594 (copy), v484 (ref), v485 (ref), v491 (ref)
                            v484 = l_HttpService_0:JSONDecode(v594.Body).languageCode;
                            v485 = v491[v484].localeCode;
                        end);
                        v595 = l_status_4;
                        v596 = l_result_4;
                    end;
                    if not v595 then
                        v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v596);
                    end;
                    if v592 == nil then
                        v592 = v596;
                    end;
                    local v599 = v595 and v591;
                    local l_v592_0 = v592;
                    if v599 then
                        v499:Start(function(v601, v602) --[[ Line: 2217 ]]
                            -- upvalues: l_HttpService_0 (ref), v489 (ref), v114 (ref), v498 (ref), l_v592_0 (ref), v599 (copy), v501 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v500 (ref), v538 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v603 = false;
                            local v604 = nil;
                            if not v601 then
                                v604 = "Experience Supported Language Request: Connection error";
                            elseif v602.StatusCode == 401 then
                                v604 = "Experience Supported Language Request: Unauthorized";
                            elseif v602.StatusCode < 200 or v602.StatusCode >= 400 then
                                v604 = "Experience Supported Language Request Status code: " .. v602.StatusCode;
                            else
                                local l_status_5, l_result_5 = pcall(function() --[[ Line: 2227 ]]
                                    -- upvalues: l_HttpService_0 (ref), v602 (copy), v489 (ref)
                                    local v605 = l_HttpService_0:JSONDecode(v602.Body);
                                    for v606, v607 in pairs(v605.data) do
                                        v489[v606] = v607.languageCode;
                                    end;
                                end);
                                v603 = l_status_5;
                                v604 = l_result_5;
                            end;
                            if not v603 then
                                v114:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v498 .. " with error message: " .. v604);
                            end;
                            if l_v592_0 == nil then
                                l_v592_0 = v604;
                            end;
                            local v610 = v603 and v599;
                            local l_l_v592_0_0 = l_v592_0;
                            if v610 then
                                v501:Start(function(v612, v613) --[[ Line: 2155 ]]
                                    -- upvalues: l_HttpService_0 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v114 (ref), v500 (ref), v538 (ref)
                                    local v614 = false;
                                    local v615 = nil;
                                    if not v612 then
                                        v615 = "User Experience Language Setting Request: Connection error";
                                    elseif v613.StatusCode == 401 then
                                        v615 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v613.StatusCode < 200 or v613.StatusCode >= 400 then
                                        v615 = "User Experience Language Setting Request Status code: " .. v613.StatusCode;
                                    else
                                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2166 ]]
                                            -- upvalues: l_HttpService_0 (ref), v613 (copy), v488 (ref), v487 (ref), v484 (ref), v492 (ref)
                                            local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v613.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_2 == nil then
                                                v488 = v487;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_2.settingTargetId == 1 then
                                                        v488 = v484;
                                                    else
                                                        v488 = v487;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_2.settingType == "LanguageFamily" then
                                                    if v492[l_userUniverseLocalizationSettingValue_2.settingTargetId] == nil then
                                                        v488 = v487;
                                                        return;
                                                    else
                                                        v488 = v492[l_userUniverseLocalizationSettingValue_2.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v614 = l_status_6;
                                        v615 = l_result_6;
                                    end;
                                    if not v614 then
                                        v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v500 .. " with error message: " .. v615);
                                    end;
                                    v538(v614, v615);
                                end);
                                return;
                            else
                                local l_l_l_v592_0_0_0 = l_l_v592_0_0;
                                if l_l_l_v592_0_0_0 == nil then
                                    l_l_l_v592_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v592_0_0_0);
                                local l_l_NewPage_0_64 = l_NewPage_0;
                                local l_l_NewPage_0_65 = l_NewPage_0;
                                local l_l_NewPage_0_66 = l_NewPage_0;
                                local v623, v624, v625 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v75
                                }, 1);
                                l_l_NewPage_0_64.LanguageSelectorFrame = v623;
                                l_l_NewPage_0_65.LanguageSelectorLabel = v624;
                                l_l_NewPage_0_66.LanguageSelectorMode = v625;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_v592_0_1 = l_v592_0;
                        if l_l_v592_0_1 == nil then
                            l_l_v592_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v592_0_1);
                        local l_l_NewPage_0_67 = l_NewPage_0;
                        local l_l_NewPage_0_68 = l_NewPage_0;
                        local l_l_NewPage_0_69 = l_NewPage_0;
                        local v630, v631, v632 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v75
                        }, 1);
                        l_l_NewPage_0_67.LanguageSelectorFrame = v630;
                        l_l_NewPage_0_68.LanguageSelectorLabel = v631;
                        l_l_NewPage_0_69.LanguageSelectorMode = v632;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_v592_1 = v592;
                if l_v592_1 == nil then
                    l_v592_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v592_1);
                local l_l_NewPage_0_70 = l_NewPage_0;
                local l_l_NewPage_0_71 = l_NewPage_0;
                local l_l_NewPage_0_72 = l_NewPage_0;
                local v637, v638, v639 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v75
                }, 1);
                l_l_NewPage_0_70.LanguageSelectorFrame = v637;
                l_l_NewPage_0_71.LanguageSelectorLabel = v638;
                l_l_NewPage_0_72.LanguageSelectorMode = v639;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 2 ]]
            end;
        end;
        v495:Start(function(v641, v642) --[[ Line: 2300 ]]
            -- upvalues: l_HttpService_0 (ref), v491 (copy), v492 (copy), v490 (copy), l_LocaleId_0 (copy), v487 (ref), v114 (ref), v494 (copy), v497 (copy), v484 (ref), v485 (ref), v496 (copy), v499 (copy), v489 (copy), v498 (copy), v501 (copy), v488 (ref), v500 (copy), v538 (copy), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local v643 = false;
            local v644 = nil;
            if not v641 then
                v644 = "Locale Code to Language Code Mapping Request: Connection error";
            elseif v642.StatusCode == 401 then
                v644 = "Locale Code to Language Code Mapping Request: Unauthorized";
            elseif v642.StatusCode < 200 or v642.StatusCode >= 400 then
                v644 = "Locale Code to Language Code Mapping Request Status code: " .. v642.StatusCode;
            else
                local l_status_7, l_result_7 = pcall(function() --[[ Line: 2311 ]]
                    -- upvalues: l_HttpService_0 (ref), v642 (copy), v491 (ref), v492 (ref), v490 (ref), l_LocaleId_0 (ref), v487 (ref)
                    local v645 = l_HttpService_0:JSONDecode(v642.Body);
                    for __, v647 in pairs(v645.data) do
                        local l_languageCode_0 = v647.locale.language.languageCode;
                        local l_locale_0 = v647.locale.locale;
                        local l_name_0 = v647.locale.language.name;
                        local l_id_0 = v647.locale.language.id;
                        v491[l_languageCode_0] = {
                            localeCode = l_locale_0, 
                            languageName = l_name_0, 
                            id = l_id_0
                        };
                        v492[l_id_0] = l_languageCode_0;
                        v490[l_name_0] = l_languageCode_0;
                        if v647.locale.locale == l_LocaleId_0:gsub("-", "_") then
                            v487 = v647.locale.language.languageCode;
                        end;
                    end;
                end);
                v643 = l_status_7;
                v644 = l_result_7;
            end;
            if not v643 then
                v114:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v494 .. " with error message: " .. v644);
            end;
            local l_v643_0 = v643;
            local l_v644_0 = v644;
            if l_v643_0 then
                v497:Start(function(v656, v657) --[[ Line: 2258 ]]
                    -- upvalues: l_HttpService_0 (ref), v484 (ref), v485 (ref), v491 (ref), v114 (ref), v496 (ref), l_v644_0 (ref), l_v643_0 (copy), v499 (ref), v489 (ref), v498 (ref), v501 (ref), v488 (ref), v487 (ref), v492 (ref), v500 (ref), v538 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                    local v658 = false;
                    local v659 = nil;
                    if not v656 then
                        v659 = "Experience Source Language Request: Connection error";
                    elseif v657.StatusCode == 401 then
                        v659 = "Experience Source Language Request: Unauthorized";
                    elseif v657.StatusCode < 200 or v657.StatusCode >= 400 then
                        v659 = "Experience Source Language Status code: " .. v657.StatusCode;
                    else
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 2269 ]]
                            -- upvalues: l_HttpService_0 (ref), v657 (copy), v484 (ref), v485 (ref), v491 (ref)
                            v484 = l_HttpService_0:JSONDecode(v657.Body).languageCode;
                            v485 = v491[v484].localeCode;
                        end);
                        v658 = l_status_8;
                        v659 = l_result_8;
                    end;
                    if not v658 then
                        v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v496 .. " with error message: " .. v659);
                    end;
                    if l_v644_0 == nil then
                        l_v644_0 = v659;
                    end;
                    local v662 = v658 and l_v643_0;
                    local l_l_v644_0_0 = l_v644_0;
                    if v662 then
                        v499:Start(function(v664, v665) --[[ Line: 2217 ]]
                            -- upvalues: l_HttpService_0 (ref), v489 (ref), v114 (ref), v498 (ref), l_l_v644_0_0 (ref), v662 (copy), v501 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v500 (ref), v538 (ref), l_NewPage_0 (ref), v92 (ref), v62 (ref), v75 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
                            local v666 = false;
                            local v667 = nil;
                            if not v664 then
                                v667 = "Experience Supported Language Request: Connection error";
                            elseif v665.StatusCode == 401 then
                                v667 = "Experience Supported Language Request: Unauthorized";
                            elseif v665.StatusCode < 200 or v665.StatusCode >= 400 then
                                v667 = "Experience Supported Language Request Status code: " .. v665.StatusCode;
                            else
                                local l_status_9, l_result_9 = pcall(function() --[[ Line: 2227 ]]
                                    -- upvalues: l_HttpService_0 (ref), v665 (copy), v489 (ref)
                                    local v668 = l_HttpService_0:JSONDecode(v665.Body);
                                    for v669, v670 in pairs(v668.data) do
                                        v489[v669] = v670.languageCode;
                                    end;
                                end);
                                v666 = l_status_9;
                                v667 = l_result_9;
                            end;
                            if not v666 then
                                v114:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v498 .. " with error message: " .. v667);
                            end;
                            if l_l_v644_0_0 == nil then
                                l_l_v644_0_0 = v667;
                            end;
                            local v673 = v666 and v662;
                            local l_l_l_v644_0_0_0 = l_l_v644_0_0;
                            if v673 then
                                v501:Start(function(v675, v676) --[[ Line: 2155 ]]
                                    -- upvalues: l_HttpService_0 (ref), v488 (ref), v487 (ref), v484 (ref), v492 (ref), v114 (ref), v500 (ref), v538 (ref)
                                    local v677 = false;
                                    local v678 = nil;
                                    if not v675 then
                                        v678 = "User Experience Language Setting Request: Connection error";
                                    elseif v676.StatusCode == 401 then
                                        v678 = "User Experience Language Setting Request: Unauthorized";
                                    elseif v676.StatusCode < 200 or v676.StatusCode >= 400 then
                                        v678 = "User Experience Language Setting Request Status code: " .. v676.StatusCode;
                                    else
                                        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2166 ]]
                                            -- upvalues: l_HttpService_0 (ref), v676 (copy), v488 (ref), v487 (ref), v484 (ref), v492 (ref)
                                            local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v676.Body).userUniverseLocalizationSettingValue;
                                            if l_userUniverseLocalizationSettingValue_3 == nil then
                                                v488 = v487;
                                                return;
                                            else
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "SourceOrTranslation" then
                                                    if l_userUniverseLocalizationSettingValue_3.settingTargetId == 1 then
                                                        v488 = v484;
                                                    else
                                                        v488 = v487;
                                                    end;
                                                end;
                                                if l_userUniverseLocalizationSettingValue_3.settingType == "LanguageFamily" then
                                                    if v492[l_userUniverseLocalizationSettingValue_3.settingTargetId] == nil then
                                                        v488 = v487;
                                                        return;
                                                    else
                                                        v488 = v492[l_userUniverseLocalizationSettingValue_3.settingTargetId];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v677 = l_status_10;
                                        v678 = l_result_10;
                                    end;
                                    if not v677 then
                                        v114:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v500 .. " with error message: " .. v678);
                                    end;
                                    v538(v677, v678);
                                end);
                                return;
                            else
                                local l_l_l_l_v644_0_0_0_0 = l_l_l_v644_0_0_0;
                                if l_l_l_l_v644_0_0_0_0 == nil then
                                    l_l_l_l_v644_0_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                                end;
                                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_l_v644_0_0_0_0);
                                local l_l_NewPage_0_73 = l_NewPage_0;
                                local l_l_NewPage_0_74 = l_NewPage_0;
                                local l_l_NewPage_0_75 = l_NewPage_0;
                                local v686, v687, v688 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                                    v75
                                }, 1);
                                l_l_NewPage_0_73.LanguageSelectorFrame = v686;
                                l_l_NewPage_0_74.LanguageSelectorLabel = v687;
                                l_l_NewPage_0_75.LanguageSelectorMode = v688;
                                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                                return;
                            end;
                        end);
                    else
                        local l_l_l_v644_0_0_1 = l_l_v644_0_0;
                        if l_l_l_v644_0_0_1 == nil then
                            l_l_l_v644_0_0_1 = "Execution path did not set earliest error to non-nil value.";
                        end;
                        v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v644_0_0_1);
                        local l_l_NewPage_0_76 = l_NewPage_0;
                        local l_l_NewPage_0_77 = l_NewPage_0;
                        local l_l_NewPage_0_78 = l_NewPage_0;
                        local v693, v694, v695 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                            v75
                        }, 1);
                        l_l_NewPage_0_76.LanguageSelectorFrame = v693;
                        l_l_NewPage_0_77.LanguageSelectorLabel = v694;
                        l_l_NewPage_0_78.LanguageSelectorMode = v695;
                        l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                        l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                    end;
                end);
            else
                local l_l_v644_0_1 = l_v644_0;
                if l_l_v644_0_1 == nil then
                    l_l_v644_0_1 = "Execution path did not set earliest error to non-nil value.";
                end;
                v114:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v644_0_1);
                local l_l_NewPage_0_79 = l_NewPage_0;
                local l_l_NewPage_0_80 = l_NewPage_0;
                local l_l_NewPage_0_81 = l_NewPage_0;
                local v700, v701, v702 = v92:AddNewRow(l_NewPage_0, v62:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
                    v75
                }, 1);
                l_l_NewPage_0_79.LanguageSelectorFrame = v700;
                l_l_NewPage_0_80.LanguageSelectorLabel = v701;
                l_l_NewPage_0_81.LanguageSelectorMode = v702;
                l_NewPage_0.LanguageSelectorMode:SetInteractable(false);
                l_NewPage_0.LanguageSelectorFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.LanguageSelectorFrame;
                --[[ close >= 6 ]]
            end;
        end);
    end;
    local function v708(v704) --[[ Line: 2350 ]] --[[ Name: getChatTranslationLayerData ]]
        -- upvalues: v86 (ref), l_IXPServiceWrapper_0 (ref), v88 (ref)
        local v705 = {
            ChatTranslationEnabled = false, 
            ChatTranslationToggleEnabled = false
        };
        if not v704 or v704 == "" then
            return v705;
        elseif v704 == "override" then
            v705.ChatTranslationEnabled = true;
            return v705;
        else
            if v86() then
                l_IXPServiceWrapper_0:WaitForInitialization();
            end;
            local l_status_11, l_result_11 = pcall(function() --[[ Line: 2372 ]]
                -- upvalues: l_IXPServiceWrapper_0 (ref), v704 (copy)
                return l_IXPServiceWrapper_0:GetLayerData(v704);
            end);
            if l_status_11 then
                if v88() then
                    v705.ChatTranslationEnabled = l_result_11.ChatTranslationEnabled or true;
                    v705.ChatTranslationToggleEnabled = l_result_11.ChatTranslationToggleEnabled or false;
                    return v705;
                else
                    v705.ChatTranslationEnabled = l_result_11.chatTranslationEnabled or false;
                    v705.ChatTranslationToggleEnabled = l_result_11.chatTranslationToggleEnabled or false;
                end;
            end;
            return v705;
        end;
    end;
    local function v719() --[[ Line: 2390 ]] --[[ Name: createVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v709 = math.floor(l_GameSettings_0.MasterVolume * 10);
        local l_l_NewPage_0_82 = l_NewPage_0;
        local l_l_NewPage_0_83 = l_NewPage_0;
        local l_l_NewPage_0_84 = l_NewPage_0;
        local v713, v714, v715 = v92:AddNewRow(l_NewPage_0, "Volume", "Slider", 10, v709);
        l_l_NewPage_0_82.VolumeFrame = v713;
        l_l_NewPage_0_83.VolumeLabel = v714;
        l_l_NewPage_0_84.VolumeSlider = v715;
        l_NewPage_0.VolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VolumeFrame;
        l_l_NewPage_0_82 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds);
        l_l_NewPage_0_82.Name = "VolumeChangeSound";
        l_l_NewPage_0_82.SoundId = "rbxasset://sounds/uuhhh.mp3";
        l_NewPage_0.VolumeSlider.ValueChanged:connect(function(v716) --[[ Line: 2401 ]]
            -- upvalues: v123 (ref), l_GameSettings_0 (ref), l_l_NewPage_0_82 (copy), v141 (ref), v146 (ref)
            local v717 = nil;
            if v123() then
                v717 = math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5);
            end;
            local v718 = v716 / 10;
            l_l_NewPage_0_82.Volume = v718;
            l_l_NewPage_0_82:Play();
            l_GameSettings_0.MasterVolume = v718;
            if v123() then
                v141("volume", v717, (math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
            end;
            v146();
        end);
    end;
    local function v729() --[[ Line: 2419 ]] --[[ Name: createPartyVoiceVolumeOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0 (ref), l_default_3 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v720 = math.floor(l_GameSettings_0.PartyVoiceVolume * 10);
        local l_l_NewPage_0_85 = l_NewPage_0;
        local l_l_NewPage_0_86 = l_NewPage_0;
        local l_l_NewPage_0_87 = l_NewPage_0;
        local v724, v725, v726 = v92:AddNewRow(l_NewPage_0, "Party Voice Volume", "Slider", 10, v720);
        l_l_NewPage_0_85.PartyVoiceVolumeFrame = v724;
        l_l_NewPage_0_86.PartyVoiceVolumeLabel = v725;
        l_l_NewPage_0_87.PartyVoiceVolumeSlider = v726;
        l_NewPage_0.PartyVoiceVolumeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.PartyVoiceVolumeFrame;
        if l_GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty_0() then
            l_NewPage_0.PartyVoiceVolumeFrame.Visible = l_default_3.hasExperienceStarted;
            l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 2428 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = true;
            end);
            l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 2431 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0.PartyVoiceVolumeFrame.Visible = false;
            end);
        end;
        l_NewPage_0.PartyVoiceVolumeSlider.ValueChanged:connect(function(v727) --[[ Line: 2436 ]]
            -- upvalues: v123 (ref), v720 (copy), l_GameSettings_0 (ref), v141 (ref), v146 (ref)
            local v728 = nil;
            if v123() then
                v728 = if v720 ~= nil then math.floor(v720 * 10 + 0.5) else 0;
            end;
            l_GameSettings_0.PartyVoiceVolume = v727 / 10;
            if v123() then
                v141("party_voice_volume", v728, (math.floor(v727 * 10 + 0.5)));
            end;
            v146();
        end);
    end;
    local function v739() --[[ Line: 2452 ]] --[[ Name: createHapticsToggle ]]
        -- upvalues: l_GameSettings_0 (ref), l_getAppFeaturePolicies_0 (ref), v24 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v730 = l_GameSettings_0.HapticStrength == 0 and 1 or 2;
        local v731 = if l_getAppFeaturePolicies_0().getShouldUseVibrationInsteadOfHaptics() then v24:Format("CoreScripts.InGameMenu.Vibration") else "Haptics";
        local l_l_NewPage_0_88 = l_NewPage_0;
        local l_l_NewPage_0_89 = l_NewPage_0;
        local v734, v735, v736 = v92:AddNewRow(l_NewPage_0, v731, "Selector", {
            "Off", 
            "On"
        }, v730);
        l_l_NewPage_0_88.HapticsFrame = v734;
        _ = v735;
        l_l_NewPage_0_89.HapticsSelector = v736;
        l_NewPage_0.HapticsFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.HapticsFrame;
        l_NewPage_0.HapticsSelector.IndexChanged:connect(function(v737) --[[ Line: 2461 ]]
            -- upvalues: l_GameSettings_0 (ref), v123 (ref), v141 (ref), v146 (ref)
            local l_HapticStrength_0 = l_GameSettings_0.HapticStrength;
            if v737 == 2 then
                l_GameSettings_0.HapticStrength = 1;
            else
                l_GameSettings_0.HapticStrength = 0;
            end;
            if v123() then
                v141("haptics_toggle", l_HapticStrength_0, l_GameSettings_0.HapticStrength);
            end;
            v146();
        end);
    end;
    local function v748() --[[ Line: 2477 ]] --[[ Name: createCameraInvertedOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v164 (copy), v123 (ref), v141 (ref), v146 (ref)
        local v740 = 1;
        if pcall(function() --[[ Line: 2479 ]]
            -- upvalues: l_GameSettings_0 (ref), v740 (ref)
            if l_GameSettings_0.CameraYInverted == true then
                v740 = 2;
            end;
        end) == false then
            return;
        else
            local l_l_NewPage_0_90 = l_NewPage_0;
            local l_l_NewPage_0_91 = l_NewPage_0;
            local v743, v744, v745 = v92:AddNewRow(l_NewPage_0, "Camera Inverted", "Selector", {
                "Off", 
                "On"
            }, v740);
            l_l_NewPage_0_90.CameraInvertedFrame = v743;
            _ = v744;
            l_l_NewPage_0_91.CameraInvertedSelector = v745;
            l_NewPage_0.CameraInvertedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraInvertedFrame;
            v164[l_NewPage_0.CameraInvertedFrame] = true;
            l_NewPage_0.CameraInvertedSelector.IndexChanged:connect(function(v746) --[[ Line: 2494 ]]
                -- upvalues: v123 (ref), l_GameSettings_0 (ref), v141 (ref), v146 (ref)
                local v747 = nil;
                if v123() then
                    v747 = l_GameSettings_0.CameraYInverted;
                end;
                if v746 == 2 then
                    l_GameSettings_0.CameraYInverted = true;
                else
                    l_GameSettings_0.CameraYInverted = false;
                end;
                if v123() then
                    v141("camera_y_inverted", v747, l_GameSettings_0.CameraYInverted);
                end;
                v146();
            end);
            return;
        end;
    end;
    local function v753(v749) --[[ Line: 2513 ]] --[[ Name: setCameraSensitivity ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v123 (ref), v141 (ref), v146 (ref)
        local v750 = nil;
        local v751 = nil;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            if v123() then
                v750 = "gamepad";
                v751 = l_GameSettings_0.GamepadCameraSensitivity;
            end;
            l_GameSettings_0.GamepadCameraSensitivity = v749;
        end;
        if l_UserInputService_0.MouseEnabled then
            if v123() then
                v750 = "mouse";
                v751 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
            end;
            local v752 = Vector2.new(v749, v749);
            l_GameSettings_0.MouseSensitivityFirstPerson = v752;
            l_GameSettings_0.MouseSensitivityThirdPerson = v752;
        end;
        if v123() and typeof(v751) == "number" and typeof(v749) == "number" then
            v141("camera_sensitivity", tonumber(string.format("%.2f", v751)), tonumber(string.format("%.2f", v749)), {
                sensitivity_type = v750
            });
        end;
        v146();
    end;
    local function v781() --[[ Line: 2551 ]] --[[ Name: createMouseOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v164 (copy), l_Create_0 (ref), v96 (ref), v753 (copy)
        local function __(v754) --[[ Line: 2556 ]] --[[ Name: translateEngineMouseSensitivityToGui ]]
            local v755 = v754 <= 1 and math.floor((v754 - 0.2) / 0.16 + 0.5) or math.floor((v754 + 2) / 0.6 + 0.5);
            if v754 <= 0.2 then
                return 0;
            else
                return v755;
            end;
        end;
        local function __(v757) --[[ Line: 2564 ]] --[[ Name: translateGuiMouseSensitivityToEngine ]]
            local v758 = v757 <= 5 and 0.16 * v757 + 0.2 or 0.6 * v757 - 2;
            if v758 <= 0.2 then
                return 0.2;
            else
                return v758;
            end;
        end;
        local l_MouseSensitivity_0 = l_GameSettings_0.MouseSensitivity;
        local v761 = l_MouseSensitivity_0 <= 1 and math.floor((l_MouseSensitivity_0 - 0.2) / 0.16 + 0.5) or math.floor((l_MouseSensitivity_0 + 2) / 0.6 + 0.5);
        local v762 = l_MouseSensitivity_0 <= 0.2 and 0 or v761;
        l_MouseSensitivity_0 = true;
        v761 = tostring(l_GameSettings_0.MouseSensitivityFirstPerson.X);
        local l_l_NewPage_0_92 = l_NewPage_0;
        local l_l_NewPage_0_93 = l_NewPage_0;
        local l_l_NewPage_0_94 = l_NewPage_0;
        local v766, v767, v768 = v92:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v762);
        l_l_NewPage_0_92.MouseAdvancedFrame = v766;
        l_l_NewPage_0_93.MouseAdvancedLabel = v767;
        l_l_NewPage_0_94.MouseAdvancedEntry = v768;
        l_NewPage_0.MouseAdvancedFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.MouseAdvancedFrame;
        v164[l_NewPage_0.MouseAdvancedFrame] = true;
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6);
        l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, l_NewPage_0.MouseAdvancedEntry.SliderFrame.Position.Y.Offset);
        l_NewPage_0.MouseAdvancedLabel.ZIndex = 2;
        l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
        l_l_NewPage_0_92 = l_Create_0("TextBox")({
            Name = "CameraSensitivityTextBox", 
            TextColor3 = Color3.new(1, 1, 1), 
            BorderColor3 = Color3.new(0.8, 0.8, 0.8), 
            BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
            Font = v96.font(Enum.Font.SourceSans), 
            TextSize = v96.textSize(18), 
            Size = UDim2.new(0, 60, 0.8, 0), 
            Position = UDim2.new(1, 10, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 3, 
            Selectable = false, 
            Parent = l_NewPage_0.MouseAdvancedEntry.SliderFrame, 
            BorderSizePixel = 0
        });
        l_Create_0("UICorner")({
            CornerRadius = v96.DefaultCornerRadius, 
            Parent = l_l_NewPage_0_92
        });
        l_l_NewPage_0_93 = function(v769) --[[ Line: 2623 ]] --[[ Name: setMouseSensitivityText ]]
            -- upvalues: l_l_NewPage_0_92 (copy)
            v769 = math.floor(v769 * 1000 + 0.5) / 1000;
            l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v769)))));
        end;
        l_l_NewPage_0_94 = math.floor(l_GameSettings_0.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000;
        l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", l_l_NewPage_0_94)))));
        l_l_NewPage_0_94 = l_NewPage_0.MouseAdvancedEntry;
        v768 = l_GameSettings_0.MouseSensitivityFirstPerson.X;
        local v770 = v768 <= 1 and math.floor((v768 - 0.2) / 0.16 + 0.5) or math.floor((v768 + 2) / 0.6 + 0.5);
        l_l_NewPage_0_94:SetValue(v768 <= 0.2 and 0 or v770);
        clampMouseSensitivity = function(v771) --[[ Line: 2638 ]] --[[ Name: clampMouseSensitivity ]]
            if v771 < 0 then
                v771 = -v771;
            end;
            if v771 > 100 then
                return 100;
            else
                if v771 < 0.001 then
                    v771 = 0.001;
                end;
                return v771;
            end;
        end;
        setMouseSensitivity = function(v772, v773) --[[ Line: 2656 ]] --[[ Name: setMouseSensitivity ]]
            -- upvalues: l_MouseSensitivity_0 (ref), v753 (ref), l_NewPage_0 (ref), l_l_NewPage_0_92 (copy)
            if not l_MouseSensitivity_0 then
                return;
            else
                v753(v772);
                l_MouseSensitivity_0 = false;
                if v773 ~= l_NewPage_0.MouseAdvancedEntry then
                    local l_MouseAdvancedEntry_0 = l_NewPage_0.MouseAdvancedEntry;
                    local v775 = v772 <= 1 and math.floor((v772 - 0.2) / 0.16 + 0.5) or math.floor((v772 + 2) / 0.6 + 0.5);
                    l_MouseAdvancedEntry_0:SetValue(v772 <= 0.2 and 0 or v775);
                end;
                local v776 = math.floor(v772 * 1000 + 0.5) / 1000;
                l_l_NewPage_0_92.Text = tostring((tonumber((string.format("%.3f", v776)))));
                l_MouseSensitivity_0 = true;
                return;
            end;
        end;
        l_l_NewPage_0_92.FocusLost:connect(function() --[[ Line: 2674 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_92 (copy), l_GameSettings_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(true);
            local v777 = tonumber((string.match(l_l_NewPage_0_92.Text, "([%d%.]+)")));
            if v777 then
                setMouseSensitivity(clampMouseSensitivity(v777), l_l_NewPage_0_92);
                return;
            else
                setMouseSensitivity(l_GameSettings_0.MouseSensitivityFirstPerson.X, l_l_NewPage_0_92);
                return;
            end;
        end);
        l_l_NewPage_0_92.Focused:connect(function() --[[ Line: 2686 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.MouseAdvancedEntry:SetInteractable(false);
        end);
        l_NewPage_0.MouseAdvancedEntry.ValueChanged:connect(function(v778) --[[ Line: 2690 ]]
            -- upvalues: l_NewPage_0 (ref)
            local v779 = clampMouseSensitivity(v778);
            local v780 = v779 <= 5 and 0.16 * v779 + 0.2 or 0.6 * v779 - 2;
            v778 = v780 <= 0.2 and 0.2 or v780;
            setMouseSensitivity(v778, l_NewPage_0.MouseAdvancedEntry);
        end);
    end;
    local function v798() --[[ Line: 2697 ]] --[[ Name: createGamepadOptions ]]
        -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v753 (copy)
        local function __(v782) --[[ Line: 2702 ]] --[[ Name: translateEngineGamepadSensitivityToGui ]]
            local v783 = v782 <= 1 and math.floor((v782 - 0.2) / 0.16 + 0.5) or math.floor((v782 + 2) / 0.6 + 0.5);
            if v782 <= 0.2 then
                return 0;
            else
                return v783;
            end;
        end;
        local function __(v785) --[[ Line: 2709 ]] --[[ Name: translateGuiGamepadSensitivityToEngine ]]
            local v786 = v785 <= 5 and 0.16 * v785 + 0.2 or 0.6 * v785 - 2;
            if v786 <= 0.2 then
                return 0.2;
            else
                return v786;
            end;
        end;
        local l_GamepadCameraSensitivity_1 = l_GameSettings_0.GamepadCameraSensitivity;
        local v789 = l_GamepadCameraSensitivity_1 <= 1 and math.floor((l_GamepadCameraSensitivity_1 - 0.2) / 0.16 + 0.5) or math.floor((l_GamepadCameraSensitivity_1 + 2) / 0.6 + 0.5);
        local v790 = l_GamepadCameraSensitivity_1 <= 0.2 and 0 or v789;
        l_GamepadCameraSensitivity_1 = l_NewPage_0;
        v789 = l_NewPage_0;
        local l_l_NewPage_0_95 = l_NewPage_0;
        local v792, v793, v794 = v92:AddNewRow(l_NewPage_0, "Camera Sensitivity", "Slider", 10, v790);
        l_GamepadCameraSensitivity_1.GamepadSensitivityFrame = v792;
        v789.GamepadSensitivityLabel = v793;
        l_l_NewPage_0_95.GamepadSensitivitySlider = v794;
        l_NewPage_0.GamepadSensitivityFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.GamepadSensitivityFrame;
        l_NewPage_0.GamepadSensitivitySlider.ValueChanged:connect(function(v795) --[[ Line: 2724 ]]
            -- upvalues: v753 (ref)
            local l_v753_0 = v753;
            local v797 = v795 <= 5 and 0.16 * v795 + 0.2 or 0.6 * v795 - 2;
            l_v753_0(v797 <= 0.2 and 0.2 or v797);
        end);
    end;
    local function v810() --[[ Line: 2729 ]] --[[ Name: createOverscanOption ]]
        -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref), v92 (ref), l_NewPage_0 (copy), v96 (ref), l_RunService_0 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local function v805() --[[ Line: 2730 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_CorePackages_0 (ref), l_ContextActionService_0 (ref)
            local v799 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            local v800 = nil;
            v800 = require(l_RobloxGui_0.Modules.Shell.Components.Overscan10ft.Overscan);
            v800 = require(l_RobloxGui_0.Modules.Settings.Components.OverscanWrapper)(v800);
            local v801 = require(l_CorePackages_0.Packages.Roact);
            local v802 = nil;
            local v803 = {
                onUnmount = function() --[[ Line: 2741 ]]
                    -- upvalues: v802 (ref), v801 (copy), l_ContextActionService_0 (ref), v799 (copy)
                    if v802 then
                        v801.unmount(v802);
                        l_ContextActionService_0:UnbindCoreAction("RbxStopOverscanMovement");
                        v799:SetVisibility(true, true);
                    end;
                end, 
                ImageVisible = false, 
                BackgroundTransparency = 0.2
            };
            v799:SetVisibility(false, true);
            l_ContextActionService_0:BindCoreAction("RbxStopOverscanMovement", function() --[[ Line: 2757 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            local v804 = nil;
            v804 = v801.createElement(v800, v803);
            v802 = v801.mount(v804, l_RobloxGui_0, (tostring(v800)));
        end;
        local v806, v807, v808 = v92:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v805, l_NewPage_0);
        v807.Font = v96.font(Enum.Font.SourceSans);
        v806.Position = UDim2.new(1, -400, 0, 12);
        v806.Size = UDim2.new(0, 300, 0, 40);
        v806.Position = UDim2.new(1, -400, 0.5, 0);
        v806.AnchorPoint = Vector2.new(0, 0.5);
        if l_RunService_0:IsStudio() then
            v806.Selectable = false;
            v806.Active = false;
            v806.Enabled.Value = false;
            v807.TextColor3 = Color3.fromRGB(100, 100, 100);
        end;
        local v809 = v92:AddNewRowObject(l_NewPage_0, "Safe Zone", v806);
        v809.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.OverscanAdjustButton;
        v808(v809);
    end;
    local function v823() --[[ Line: 2796 ]] --[[ Name: createDeveloperConsoleOption ]]
        -- upvalues: v141 (ref), v128 (ref), v92 (ref), l_NewPage_0 (copy), v96 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_RunService_0 (ref), v94 (ref), l_Players_0 (ref)
        local function v822() --[[ Line: 2798 ]] --[[ Name: makeDevConsoleOption ]]
            -- upvalues: v141 (ref), v128 (ref), v92 (ref), l_NewPage_0 (ref), v96 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
            local function v813() --[[ Line: 2799 ]] --[[ Name: onOpenDevConsole ]]
                -- upvalues: v141 (ref)
                local v811 = require(script.Parent.Parent.Parent.DevConsoleMaster);
                if v811 then
                    v811:SetVisibility(true);
                    local v812 = require(script.Parent.Parent.SettingsHub);
                    if v812 then
                        v812:SetVisibility(false);
                    end;
                    v141("dev_console", "", "pressed");
                end;
            end;
            if v128 then
                local v814, v815, v816 = v92:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v813, l_NewPage_0);
                v815.Font = v96.font(Enum.Font.SourceSans);
                v814.Size = UDim2.new(0.6, -10, 0, 35);
                v814.Position = UDim2.new(0.4, 10, 0.5, 0);
                v814.AnchorPoint = Vector2.new(0, 0.5);
                local v817 = v92:AddNewRowObject(l_NewPage_0, "Developer Console", v814, nil, true);
                v817.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v816(v817);
                return;
            else
                local v818, v819, v820 = v92:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v813, l_NewPage_0);
                v819.Font = v96.font(Enum.Font.SourceSans);
                v818.Size = UDim2.new(0.6, -10, 0, 35);
                v818.Position = UDim2.new(1, -400, 0.5, 0);
                v818.AnchorPoint = Vector2.new(0, 0.5);
                local v821 = v92:AddNewRowObject(l_NewPage_0, "Developer Console", v818);
                v821.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.DeveloperConsoleButton;
                v820(v821);
                return;
            end;
        end;
        if l_RunService_0:IsStudio() then
            v822();
            return;
        else
            spawn(function() --[[ Line: 2851 ]]
                -- upvalues: v94 (ref), l_Players_0 (ref), v822 (copy)
                if v94.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
                    v822();
                end;
            end);
            return;
        end;
    end;
    local function v852() --[[ Line: 2860 ]] --[[ Name: createUiToggleOptions ]]
        -- upvalues: v127 (ref), v126 (ref), v62 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v127 or v126 then
            local v824 = {
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
            local v825 = v62:FormatByKey("InGame.CommonUI.Label.On");
            local v826 = v62:FormatByKey("InGame.CommonUI.Label.Off");
            l_NewPage_0.uiToggleSelectors = {};
            for __, v828 in v824 do
                local v829 = v62:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
                    GuiType = v828.label
                });
                local v830, v831, v832 = v92:AddNewRow(l_NewPage_0, v829, "Selector", {
                    v825, 
                    v826
                }, 1);
                v830.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0[v828.layoutOrderKey];
                v832.IndexChanged:Connect(function(v833) --[[ Line: 2888 ]]
                    -- upvalues: l_GuiService_0 (ref), v828 (copy)
                    if (l_GuiService_0:GetGuiIsVisible(v828.type) and 1 or 2) ~= v833 then
                        l_GuiService_0:ToggleGuiIsVisibleIfAllowed(v828.type);
                    end;
                end);
                l_NewPage_0.uiToggleSelectors[v828.label] = {
                    label = v829, 
                    type = v828.type, 
                    row = v830, 
                    frame = v831, 
                    selector = v832
                };
            end;
            local v834 = v62:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam");
            local l_l_NewPage_0_96 = l_NewPage_0;
            local l_l_NewPage_0_97 = l_NewPage_0;
            local l_l_NewPage_0_98 = l_NewPage_0;
            local v838, v839, v840 = v92:AddNewRow(l_NewPage_0, v834, "Selector", {
                v826, 
                v825
            }, 1);
            l_l_NewPage_0_96.freecamRow = v838;
            l_l_NewPage_0_97.freecamFrame = v839;
            l_l_NewPage_0_98.freecamSelector = v840;
            l_NewPage_0.freecamRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.FreecamToggleRow;
            l_NewPage_0.freecamSelector.IndexChanged:Connect(function(v841) --[[ Line: 2910 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v842 = v841 == 2;
                local l_l_LocalPlayer_0_FirstChild_0 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if not l_l_LocalPlayer_0_FirstChild_0 then
                    warn("Freecam not present");
                    return;
                else
                    l_l_LocalPlayer_0_FirstChild_0:SetAttribute("FreecamEnabled", v842);
                    return;
                end;
            end);
            return;
        else
            local v844 = {
                "All visible", 
                "Hide nameplates/bubble chat"
            };
            local l_l_NewPage_0_99 = l_NewPage_0;
            local l_l_NewPage_0_100 = l_NewPage_0;
            local l_l_NewPage_0_101 = l_NewPage_0;
            local v848, v849, v850 = v92:AddNewRow(l_NewPage_0, "BillboardGui Visibility", "Selector", v844, 1);
            l_l_NewPage_0_99.uiToggleRow = v848;
            l_l_NewPage_0_100.uiToggleFrame = v849;
            l_l_NewPage_0_101.uiToggleSelector = v850;
            l_NewPage_0.uiToggleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.UiToggleRow;
            l_NewPage_0.uiToggleSelector.IndexChanged:connect(function(__) --[[ Line: 2929 ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates);
            end);
            return;
        end;
    end;
    local function v859() --[[ Line: 2935 ]] --[[ Name: updateUiToggleSelection ]]
        -- upvalues: v127 (ref), v126 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), l_LocalPlayer_0 (ref)
        if v127 or v126 then
            if not l_NewPage_0.uiToggleSelectors then
                return;
            else
                for __, v854 in l_NewPage_0.uiToggleSelectors do
                    local v855 = l_GuiService_0:GetGuiIsVisible(v854.type) and 1 or 2;
                    if v855 ~= v854.selector:GetSelectedIndex() then
                        v854.selector:SetSelectionIndex(v855);
                    end;
                end;
                local l_l_LocalPlayer_0_FirstChild_1 = l_LocalPlayer_0:FindFirstChild("FreecamScript", true);
                if l_l_LocalPlayer_0_FirstChild_1 then
                    local v857 = l_l_LocalPlayer_0_FirstChild_1:GetAttribute("FreecamEnabled") and 2 or 1;
                    l_NewPage_0.freecamSelector:SetSelectionIndex(v857);
                    return;
                end;
            end;
        elseif not l_NewPage_0.uiToggleSelector then
            return;
        else
            local v858 = nil;
            v858 = l_GuiService_0:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2;
            if v858 == l_NewPage_0.uiToggleSelector:GetSelectedIndex() then
                return;
            else
                l_NewPage_0.uiToggleSelector:SetSelectionIndex(v858);
            end;
        end;
    end;
    local function __(v860, v861, v862) --[[ Line: 2977 ]] --[[ Name: isValidDeviceList ]]
        return v860 and v861 and v862 and #v860 > 0 and v862 > 0 and v862 <= #v860 and #v860 == #v861;
    end;
    local function v872(v864) --[[ Line: 2987 ]] --[[ Name: setVCSOutput ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v114 (ref), v17 (ref), v121 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v114:error("setVCSOutput is deprecated");
            return;
        else
            local v865, v866, v867, v868 = pcall(function() --[[ Line: 2993 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v865 and v866 and v867 and v868 and #v866 > 0 and v868 > 0 and v868 <= #v866 and #v866 == #v867 then
                local v869 = 0;
                for v870, v871 in ipairs(v866) do
                    if v871 == v864 then
                        v869 = v870;
                    end;
                end;
                if v869 > 0 then
                    if v121() then
                        v114:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", v866[v869], v867[v869]);
                    end;
                    v17:SetSpeakerDevice(v866[v869], v867[v869]);
                    return;
                elseif v121() then
                    v114:warning("Could not find equivalent VoiceChatService Device");
                    return;
                end;
            elseif v121() then
                v114:warning("Could not connect to Voice Chat Service to change Output Device");
            end;
            return;
        end;
    end;
    local function v877() --[[ Line: 3028 ]] --[[ Name: syncSoundOutputs ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v114 (ref), l_SoundService_0 (ref), v872 (copy), v121 (ref)
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            v114:error("syncSoundOutputs is deprecated");
            return;
        else
            local v873, v874, v875, v876 = pcall(function() --[[ Line: 3034 ]]
                -- upvalues: l_SoundService_0 (ref)
                return l_SoundService_0:GetOutputDevices();
            end);
            if v873 and v874 and v875 and v876 and #v874 > 0 and v876 > 0 and v876 <= #v874 and #v874 == #v875 then
                v872(v874[v876]);
                return;
            else
                if v121() then
                    v114:warning("Could not connect to Voice Chat Service to change Output Device");
                end;
                return;
            end;
        end;
    end;
    local function __(v878, v879) --[[ Line: 3049 ]] --[[ Name: SwitchOutputDevice ]]
        -- upvalues: l_SoundService_0 (ref), v114 (ref)
        l_SoundService_0:SetOutputDevice(v878, v879);
        v114:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v878, v879);
    end;
    local function v897(v881) --[[ Line: 3054 ]] --[[ Name: createDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v72 (ref), v62 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v120 (ref), l_default_2 (ref), l_SoundService_0 (ref), v114 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v141 (ref)
        local v882 = l_NewPage_0[v881 .. "DeviceIndex"] or 0;
        local v883 = l_NewPage_0[v881 .. "DeviceNames"] or {};
        local v884 = l_NewPage_0[v881 .. "DeviceGuids"] or {};
        local v885 = v881 == v72.Input and v62:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or v62:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice");
        local l_l_NewPage_0_102 = l_NewPage_0;
        local v887 = v881 .. "DeviceFrame";
        local l_l_NewPage_0_103 = l_NewPage_0;
        local v889 = v881 .. "DeviceSelector";
        local v890, v891, v892 = v92:AddNewRow(l_NewPage_0, v885, "Selector", v883, v882);
        l_l_NewPage_0_102[v887] = v890;
        _ = v891;
        l_l_NewPage_0_103[v889] = v892;
        l_NewPage_0[v881 .. "DeviceFrame"].LayoutOrder = v881 == v72.Input and l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameInput or l_SETTINGS_MENU_LAYOUT_ORDER_0.DeviceFrameOutput;
        l_NewPage_0[v881 .. "DeviceInfo"] = {
            Name = v882 > 0 and v883[v882] or nil, 
            Guid = v882 > 0 and v884[v882] or nil
        };
        l_NewPage_0[v881 .. "PrevDeviceName"] = l_NewPage_0[v881 .. "DeviceInfo"].Name;
        l_l_NewPage_0_102 = 0;
        v887 = v120();
        l_NewPage_0[v881 .. "DeviceSelector"].IndexChanged:connect(function(v893) --[[ Line: 3077 ]]
            -- upvalues: l_NewPage_0 (ref), v881 (copy), l_l_NewPage_0_102 (ref), v887 (copy), l_default_2 (ref), l_SoundService_0 (ref), v114 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v72 (ref), l_default_3 (ref), v141 (ref)
            if l_NewPage_0[v881 .. "DeviceInfo"].Name == l_NewPage_0[v881 .. "DeviceNames"][v893] and l_NewPage_0[v881 .. "DeviceInfo"].Guid == l_NewPage_0[v881 .. "DeviceGuids"][v893] then
                return;
            else
                local v894 = l_l_NewPage_0_102 + 1;
                l_l_NewPage_0_102 = v894;
                wait(v887);
                if v894 == l_l_NewPage_0_102 then
                    l_l_NewPage_0_102 = 0;
                    l_NewPage_0[v881 .. "DeviceInfo"] = {
                        Name = l_NewPage_0[v881 .. "DeviceNames"][v893], 
                        Guid = l_NewPage_0[v881 .. "DeviceGuids"][v893]
                    };
                    local l_Name_4 = l_NewPage_0[v881 .. "DeviceInfo"].Name;
                    local l_Guid_0 = l_NewPage_0[v881 .. "DeviceInfo"].Guid;
                    if l_NewPage_0.VoiceChatOptionsEnabled then
                        l_default_2:SwitchDevice(v881, l_Name_4, l_Guid_0);
                    else
                        l_SoundService_0:SetOutputDevice(l_Name_4, l_Guid_0);
                        v114:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", l_Name_4, l_Guid_0);
                    end;
                    if l_GetFFlagEnableCrossExpVoice_0() then
                        v114:debug("[GameSettings] Changing {} device to {} {} ", v881, l_Name_4, l_Guid_0);
                        if v881 == v72.Input then
                            l_default_3:changeInputDevice(l_Name_4, l_Guid_0);
                        else
                            l_default_3:changeOutputDevice(l_Name_4, l_Guid_0);
                        end;
                    end;
                    v141(v881, l_NewPage_0[v881 .. "PrevDeviceName"], l_Name_4);
                    l_NewPage_0[v881 .. "PrevDeviceName"] = l_Name_4;
                end;
                return;
            end;
        end);
    end;
    local function __() --[[ Line: 3119 ]] --[[ Name: createBadgeVisibilityOptions ]]
        -- upvalues: v94 (ref), l_LocalPlayer_0 (ref), v62 (ref), v135 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
        spawn(function() --[[ Line: 3120 ]]
            -- upvalues: v94 (ref), l_LocalPlayer_0 (ref), v62 (ref), v135 (ref), l_NewPage_0 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v898 = 2;
            if v94.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v898 = 1;
            end;
            local v899 = v62:FormatByKey("Feature.SettingsHub.Label.Show");
            local v900 = v62:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v901 = if v135 then v62:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v62:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v902 = v62:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_104 = l_NewPage_0;
            local l_l_NewPage_0_105 = l_NewPage_0;
            local l_l_NewPage_0_106 = l_NewPage_0;
            local v906, v907, v908 = v92:AddNewRow(l_NewPage_0, v901, "Selector", {
                v900, 
                v899
            }, v898, nil, v902);
            l_l_NewPage_0_104.badgeVisibleRow = v906;
            l_l_NewPage_0_105.badgeVisibleFrame = v907;
            l_l_NewPage_0_106.badgeVisibleSelector = v908;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v909) --[[ Line: 3134 ]]
                -- upvalues: l_GameSettings_0 (ref), v94 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v909 == 2;
                v94.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v909 == 1);
            end);
        end);
    end;
    local function v921() --[[ Line: 3141 ]] --[[ Name: createChatModerationOptions ]]
        -- upvalues: l_NewPage_0 (copy), v92 (ref), v24 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_CorePackages_0 (ref), v102 (ref), v59 (ref), v141 (ref)
        local v911 = {
            title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView", 
            description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription", 
            on = "InGame.CommonUI.Label.On", 
            off = "InGame.CommonUI.Label.Off"
        };
        local l_l_NewPage_0_107 = l_NewPage_0;
        local l_l_NewPage_0_108 = l_NewPage_0;
        local v914, v915, v916 = v92:AddNewRow(l_NewPage_0, v24:Format(v911.title), "Selector", {
            v24:Format(v911.off), 
            v24:Format(v911.on)
        }, 1, nil, v24:Format(v911.description));
        l_l_NewPage_0_107.ChatModerationFrame = v914;
        _ = v915;
        l_l_NewPage_0_108.ChatModerationSelector = v916;
        l_NewPage_0.ChatModerationFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.ChatModerationFrame;
        l_NewPage_0.ChatModerationFrame.Visible = false;
        l_l_NewPage_0_108 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false);
        l_NewPage_0.ChatModerationDisposeEffect = v102.createEffect(function(v917) --[[ Line: 3165 ]]
            -- upvalues: l_NewPage_0 (ref), l_l_NewPage_0_108 (copy)
            l_NewPage_0.ChatModerationFrame.Visible = l_l_NewPage_0_108.getIsSettingVisible(v917);
            local v918 = l_l_NewPage_0_108.getIsSettingEnabled(v917) and 2 or 1;
            if l_NewPage_0.ChatModerationSelector:GetSelectedIndex() ~= v918 then
                l_NewPage_0.ChatModerationSelector:SetSelectionIndex(v918);
            end;
        end);
        l_NewPage_0.ChatModerationSelector.IndexChanged:connect(function(v919) --[[ Line: 3174 ]]
            -- upvalues: l_l_NewPage_0_108 (copy), v59 (ref), v141 (ref)
            local v920 = v919 == 2;
            l_l_NewPage_0_108.setIsSettingEnabled(v920);
            if v59 then
                v141("moderate_chat", not v920, v920);
            end;
        end);
        l_l_NewPage_0_108.initialize();
    end;
    local function v933() --[[ Line: 3188 ]] --[[ Name: createCameraDeviceOptions ]]
        -- upvalues: l_NewPage_0 (copy), v113 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v114 (ref), l_UserGameSettings_0 (ref), v141 (ref)
        local v922 = l_NewPage_0.CameraDeviceIndex or 1;
        local v923 = l_NewPage_0.CameraDeviceNames or {};
        local v924 = l_NewPage_0.CameraDeviceGuids or {};
        local l_v113_0 = v113;
        local l_l_NewPage_0_109 = l_NewPage_0;
        local l_l_NewPage_0_110 = l_NewPage_0;
        local v928, v929, v930 = v92:AddNewRow(l_NewPage_0, l_v113_0, "Selector", v923, v922);
        l_l_NewPage_0_109.CameraDeviceFrame = v928;
        _ = v929;
        l_l_NewPage_0_110.CameraDeviceSelector = v930;
        l_NewPage_0.CameraDeviceFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.CameraDeviceFrame;
        l_NewPage_0.CameraDeviceInfo = {
            Name = v922 > 0 and v923[v922] or nil, 
            Guid = v922 > 0 and v924[v922] or nil
        };
        l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
        l_NewPage_0.CameraDeviceSelector.IndexChanged:connect(function(v931) --[[ Line: 3205 ]]
            -- upvalues: l_NewPage_0 (ref), v114 (ref), l_UserGameSettings_0 (ref), v141 (ref)
            if l_NewPage_0.CameraDeviceInfo.Name == l_NewPage_0.CameraDeviceNames[v931] and l_NewPage_0.CameraDeviceInfo.Guid == l_NewPage_0.CameraDeviceGuids[v931] then
                return;
            else
                l_NewPage_0.CameraDeviceInfo = {
                    Name = l_NewPage_0.CameraDeviceNames[v931], 
                    Guid = l_NewPage_0.CameraDeviceGuids[v931]
                };
                local l_Guid_1 = l_NewPage_0.CameraDeviceInfo.Guid;
                v114:info("Changed webcam to: {}", l_Guid_1);
                l_UserGameSettings_0.DefaultCameraID = l_Guid_1;
                v141("video_camera", l_NewPage_0.prevCameraDeviceName or "None", l_NewPage_0.CameraDeviceInfo.Name);
                l_NewPage_0.prevCameraDeviceName = l_NewPage_0.CameraDeviceInfo.Name;
                return;
            end;
        end);
    end;
    local function v939(v934) --[[ Line: 3230 ]] --[[ Name: updateAudioDevices ]]
        -- upvalues: v72 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v121 (ref), v114 (ref), v897 (copy)
        local v935, v936, v937, v938 = pcall(function() --[[ Line: 3231 ]]
            -- upvalues: v934 (copy), v72 (ref), l_SoundService_0 (ref)
            if v934 == v72.Input then
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
                if v121() then
                    v114:warning("Errors in get {} device info", v934);
                end;
                l_NewPage_0[v934 .. "DeviceNames"] = {};
                l_NewPage_0[v934 .. "DeviceGuids"] = {};
                l_NewPage_0[v934 .. "DeviceIndex"] = 0;
            end;
        elseif v935 and v936 and v937 and v938 and #v936 > 0 and v938 > 0 and v938 <= #v936 and #v936 == #v937 then
            if v937[1] == "" then
                v936[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v936[1] .. ")";
            end;
            l_NewPage_0[v934 .. "DeviceNames"] = v936;
            l_NewPage_0[v934 .. "VCSDeviceNames"] = v936;
            l_NewPage_0[v934 .. "VCSDeviceGuids"] = v937;
            l_NewPage_0[v934 .. "DeviceGuids"] = v937;
            l_NewPage_0[v934 .. "DeviceIndex"] = v938;
        else
            if v121() then
                v114:warning("Errors in get {} device info", v934);
            end;
            l_NewPage_0[v934 .. "DeviceNames"] = {};
            l_NewPage_0[v934 .. "DeviceGuids"] = {};
            l_NewPage_0[v934 .. "VCSDeviceNames"] = {};
            l_NewPage_0[v934 .. "VCSDeviceGuids"] = {};
            l_NewPage_0[v934 .. "DeviceIndex"] = 0;
        end;
        if not l_NewPage_0[v934 .. "DeviceSelector"] then
            v897(v934);
            return;
        else
            l_NewPage_0[v934 .. "DeviceSelector"]:UpdateOptions(v936);
            l_NewPage_0[v934 .. "DeviceSelector"]:SetSelectionIndex(v938);
            return;
        end;
    end;
    local function v949(v940) --[[ Line: 3286 ]] --[[ Name: updateVoiceChatDevices ]]
        -- upvalues: v72 (ref), v121 (ref), v114 (ref), l_SoundService_0 (ref), l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (ref), v24 (ref), l_NewPage_0 (copy), v17 (ref), v897 (copy)
        if v940 ~= v72.Input and v940 ~= v72.Output and v121() then
            v114:warning("{} is not supported in VoiceChat devices", v940);
        end;
        local v941, v942, v943, v944 = pcall(function() --[[ Line: 3293 ]]
            -- upvalues: v940 (copy), v72 (ref), l_SoundService_0 (ref)
            if v940 == v72.Input then
                return l_SoundService_0:GetInputDevices();
            else
                return l_SoundService_0:GetOutputDevices();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
            if v941 and v942 and v943 and v944 and #v942 > 0 and v944 > 0 and v944 <= #v942 and #v942 == #v943 then
                if v943[1] == "" then
                    v942[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v942[1] .. ")";
                end;
                l_NewPage_0[v940 .. "DeviceNames"] = v942;
                l_NewPage_0[v940 .. "DeviceGuids"] = v943;
                l_NewPage_0[v940 .. "DeviceIndex"] = v944;
            else
                if v121() then
                    if #v942 > 0 then
                        v114:warning("Errors in get {} device info success: {}", v940, v941);
                    else
                        v114:warning("Empty deviceNames list for {}", v940);
                    end;
                end;
                l_NewPage_0[v940 .. "DeviceNames"] = {};
                l_NewPage_0[v940 .. "DeviceGuids"] = {};
                l_NewPage_0[v940 .. "DeviceIndex"] = 0;
            end;
        else
            local v945, v946, v947, v948 = pcall(function() --[[ Line: 3330 ]]
                -- upvalues: v17 (ref)
                return v17:GetSpeakerDevices();
            end);
            if v941 and v945 and v942 and v943 and v944 and #v942 > 0 and v944 > 0 and v944 <= #v942 and #v942 == #v943 and v946 and v947 and v948 and #v946 > 0 and v948 > 0 and v948 <= #v946 and #v946 == #v947 then
                if v943[1] == "" then
                    v942[1] = v24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v942[1] .. ")";
                end;
                l_NewPage_0[v940 .. "DeviceNames"] = v942;
                l_NewPage_0[v940 .. "VCSDeviceNames"] = v946;
                l_NewPage_0[v940 .. "VCSDeviceGuids"] = v947;
                l_NewPage_0[v940 .. "DeviceGuids"] = v943;
                l_NewPage_0[v940 .. "DeviceIndex"] = v944;
            else
                if v121() then
                    if #v942 > 0 then
                        v114:warning("Errors in get {} device info success: {} VCSSuccess: {}", v940, v941, v945);
                    else
                        v114:warning("Empty deviceNames list for {}", v940);
                    end;
                end;
                l_NewPage_0[v940 .. "DeviceNames"] = {};
                l_NewPage_0[v940 .. "DeviceGuids"] = {};
                l_NewPage_0[v940 .. "VCSDeviceNames"] = {};
                l_NewPage_0[v940 .. "VCSDeviceGuids"] = {};
                l_NewPage_0[v940 .. "DeviceIndex"] = 0;
            end;
        end;
        if not l_NewPage_0[v940 .. "DeviceSelector"] then
            v897(v940);
        else
            l_NewPage_0[v940 .. "DeviceSelector"]:UpdateOptions(v942);
            l_NewPage_0[v940 .. "DeviceSelector"]:SetSelectionIndex(v944);
        end;
        if l_NewPage_0[v940 .. "DeviceFrame"] then
            if #v942 > 0 then
                l_NewPage_0[v940 .. "DeviceFrame"].Visible = true;
                return;
            else
                l_NewPage_0[v940 .. "DeviceFrame"].Visible = false;
            end;
        end;
    end;
    local function v956() --[[ Line: 3386 ]] --[[ Name: updateCameraDevices ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v112 (ref), l_UserGameSettings_0 (ref), l_NewPage_0 (copy), v933 (copy)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v951 = {};
        local v952 = {};
        local v953 = 1;
        table.insert(v951, v112);
        table.insert(v952, "{DefaultDeviceGuid}");
        for v954, v955 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            if v954 == l_UserGameSettings_0.DefaultCameraID then
                v953 = #v951 + 1;
            end;
            table.insert(v951, v955);
            table.insert(v952, v954);
        end;
        l_NewPage_0.CameraDeviceNames = v951;
        l_NewPage_0.CameraDeviceGuids = v952;
        l_NewPage_0.CameraDeviceIndex = 0;
        if not l_NewPage_0.CameraDeviceSelector then
            v933();
        else
            l_NewPage_0.CameraDeviceSelector:UpdateOptions(v951);
        end;
        l_NewPage_0.CameraDeviceSelector:SetSelectionIndex(v953);
    end;
    local v957 = nil;
    local v958 = nil;
    local function v959() --[[ Line: 3416 ]] --[[ Name: updateAudioOptions ]]
        -- upvalues: l_NewPage_0 (copy), v949 (copy), v72 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v939 (copy)
        if l_NewPage_0.VoiceChatOptionsEnabled then
            v949(v72.Input);
            v949(v72.Output);
            return;
        else
            if l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected() then
                v939(v72.Input);
            end;
            v939(v72.Output);
            return;
        end;
    end;
    local function __() --[[ Line: 3428 ]] --[[ Name: setupDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v957 (ref), l_NewPage_0 (copy), v959 (copy)
        if l_SoundService_0.DeviceListChanged then
            v957 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3430 ]]
                -- upvalues: l_NewPage_0 (ref), v959 (ref)
                if l_NewPage_0.PageOpen then
                    v959();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3438 ]] --[[ Name: setupVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v958 (ref), l_NewPage_0 (copy), v956 (copy)
        if l_VideoCaptureService_0.DevicesChanged then
            v958 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3440 ]]
                -- upvalues: l_NewPage_0 (ref), v956 (ref)
                if l_NewPage_0.PageOpen then
                    v956();
                end;
            end);
        end;
    end;
    local function __() --[[ Line: 3448 ]] --[[ Name: teardownDeviceChangedListener ]]
        -- upvalues: l_SoundService_0 (ref), v957 (ref)
        if l_SoundService_0.DeviceListChanged and v957 then
            v957:Disconnect();
        end;
    end;
    local function __() --[[ Line: 3454 ]] --[[ Name: teardownVideoCameraDeviceChangedListener ]]
        -- upvalues: l_VideoCaptureService_0 (ref), v958 (ref)
        if l_VideoCaptureService_0.DevicesChanged and v958 then
            v958:Disconnect();
            v958 = nil;
        end;
    end;
    local function __() --[[ Line: 3462 ]] --[[ Name: checkVoiceChatOptions ]]
        -- upvalues: l_default_2 (ref), l_NewPage_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v877 (copy)
        if l_default_2:VoiceChatAvailable() then
            l_NewPage_0.VoiceChatOptionsEnabled = true;
            if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                v877();
            end;
        end;
    end;
    local function __() --[[ Line: 3471 ]] --[[ Name: updateInputDeviceVisibility ]]
        -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref)
        local v965 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
        if l_NewPage_0[v72.Input .. "DeviceFrame"] then
            l_NewPage_0[v72.Input .. "DeviceFrame"].Visible = v965;
        end;
    end;
    local v967 = false;
    local v968 = nil;
    if v61 then
        v968 = false;
    end;
    local function v986() --[[ Line: 3484 ]] --[[ Name: createVoiceChatSelector ]]
        -- upvalues: v60 (ref), l_NewPage_0 (copy), v53 (ref), v24 (ref), l_default_2 (ref), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v61 (ref), v40 (ref), v39 (ref), v968 (ref), v967 (ref), v100 (ref), v56 (ref), l_GuiService_0 (ref)
        if v60 and l_NewPage_0.VoiceConnectDisconnectFrame and l_NewPage_0.VoiceConnectDisconnectSelector then
            return;
        else
            local v969 = "Voice Chat";
            local v970 = "Disconnected";
            local v971 = "Connected";
            if v53 then
                v969 = v24:Format("Feature.GameDetails.Label.VoiceChat");
                v970 = v24:Format("Feature.SettingsHub.Label.Disconnected");
                v971 = v24:Format("Feature.SettingsHub.Label.Connected");
            end;
            local v972 = l_default_2:VoiceChatEnded() and 1 or 2;
            local l_l_NewPage_0_111 = l_NewPage_0;
            local l_l_NewPage_0_112 = l_NewPage_0;
            local v975, v976, v977 = v92:AddNewRow(l_NewPage_0, v969, "Selector", {
                v970, 
                v971
            }, v972);
            l_l_NewPage_0_111.VoiceConnectDisconnectFrame = v975;
            _ = v976;
            l_l_NewPage_0_112.VoiceConnectDisconnectSelector = v977;
            l_NewPage_0.VoiceConnectDisconnectFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectDisconnectSelector;
            l_l_NewPage_0_111 = l_default_2:getService();
            if l_l_NewPage_0_111 and not v61 then
                l_l_NewPage_0_111.StateChanged:Connect(function(v978, v979) --[[ Line: 3509 ]]
                    -- upvalues: v60 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                    if v60 then
                        if v978 == v979 then
                            return;
                        elseif v979 == Enum.VoiceChatState.Joined and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                            return;
                        elseif (v979 == Enum.VoiceChatState.Ended or v979 == Enum.VoiceChatState.Failed or v979 == Enum.VoiceChatState.Idle) and l_NewPage_0.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
                            l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                            return;
                        end;
                    elseif v978 == v979 then
                        return;
                    elseif v979 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                        return;
                    elseif l_default_2:VoiceChatEnded() then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    end;
                end);
            end;
            l_l_NewPage_0_112 = v972;
            v975 = v40();
            v976 = v39() and v975 > 0;
            v977 = function(v980) --[[ Line: 3543 ]]
                -- upvalues: l_l_NewPage_0_112 (ref), v61 (ref), v968 (ref), l_default_2 (ref), v967 (ref), l_NewPage_0 (ref)
                if v980 == l_l_NewPage_0_112 then
                    return;
                else
                    l_l_NewPage_0_112 = v980;
                    if v61 and v968 then
                        return;
                    else
                        l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(v980 == 2));
                        if v980 == 2 then
                            l_default_2:JoinVoice();
                        elseif not l_default_2:VoiceChatEnded() then
                            l_default_2:Leave();
                        end;
                        if v967 then
                            task.spawn(function() --[[ Line: 3568 ]]
                                -- upvalues: v980 (copy), l_NewPage_0 (ref)
                                task.wait(0.5);
                                if v980 ~= 1 then
                                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
            end;
            l_NewPage_0.VoiceConnectDisconnectSelector.IndexChanged:connect(if v976 then v100(v975, v977) else v977);
            if v56 then
                l_NewPage_0.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(__, v982, v983) --[[ Line: 3582 ]]
                    -- upvalues: v969 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref)
                    if v983 and v982 and v982.Parent and v982.Parent.Name == v969 .. "Frame" and v983.Name == "ImageButton" and l_NewPage_0.Active then
                        l_GuiService_0.SelectedCoreObject = v982;
                    end;
                end);
            end;
            l_default_2:subscribe("OnStateChanged", function(__, v985) --[[ Line: 3589 ]]
                -- upvalues: v61 (ref), v968 (ref), l_NewPage_0 (ref)
                if v61 then
                    v968 = true;
                    if v985 == Enum.VoiceChatState.Joined then
                        l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    end;
                end;
                if v985 == Enum.VoiceChatState.Failed then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                end;
                if v61 then
                    v968 = false;
                end;
            end);
            l_default_2:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 3606 ]]
                -- upvalues: v967 (ref), v61 (ref), v968 (ref), l_NewPage_0 (ref)
                task.spawn(function() --[[ Line: 3607 ]]
                    -- upvalues: v967 (ref), v61 (ref), v968 (ref), l_NewPage_0 (ref)
                    task.wait(0.5);
                    v967 = true;
                    if v61 then
                        v968 = true;
                    end;
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(1);
                    if v61 then
                        v968 = false;
                    end;
                end);
            end);
            return;
        end;
    end;
    local function v1005() --[[ Line: 3621 ]] --[[ Name: createVoiceConnectDisconnect ]]
        -- upvalues: l_default_2 (ref), v24 (ref), v40 (ref), v92 (ref), v100 (ref), l_NewPage_0 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref)
        if l_default_2:IsSeamlessVoice() and not l_default_2.isShowingFTUX then
            local v987 = nil;
            local v988 = nil;
            local v989 = nil;
            local v990 = nil;
            local v991 = v24:Format("Feature.GameDetails.Label.VoiceChat");
            local v992 = v24:Format("Feature.SettingsHub.Label.Connect");
            local v993 = v24:Format("Feature.SettingsHub.Label.Disconnect");
            local v994 = v40();
            local v995 = v994 > 0;
            local function v1000() --[[ Line: 3631 ]]
                -- upvalues: l_default_2 (ref)
                if l_default_2:getService() then
                    local v996 = nil;
                    do
                        local l_v996_0 = v996;
                        l_v996_0 = l_default_2:getService().StateChanged:Connect(function(__, v999) --[[ Line: 3635 ]]
                            -- upvalues: l_default_2 (ref), l_v996_0 (ref)
                            if v999 == Enum.VoiceChatState.Joined then
                                l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                                l_v996_0:Disconnect();
                            end;
                        end);
                    end;
                else
                    l_default_2.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(false));
                end;
                l_default_2:JoinVoice();
            end;
            local function v1001() --[[ Line: 3653 ]]
                -- upvalues: l_default_2 (ref)
                l_default_2.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_2:GetConnectDisconnectButtonAnalyticsData(true));
                l_default_2:Leave();
            end;
            local v1002, v1003, v1004 = v92:MakeStyledButton("VoiceConnectButton", v992, UDim2.new(1, 0, 1, -20), if v995 then v100(v994, v1000) else v1000, l_NewPage_0);
            voiceConnectSetRowRef = v1004;
            v987 = v1002;
            v988 = v1003;
            v1002, v1003, v1004 = v92:MakeStyledButton("VoiceDisconnectButton", v993, UDim2.new(1, 0, 1, -20), if v995 then v100(v994, v1001) else v1001, l_NewPage_0);
            voiceDisconnectSetRowRef = v1004;
            v989 = v1002;
            v990 = v1003;
            v987.Size = UDim2.new(0.6, 0, 0, 40);
            v987.Position = UDim2.new(0.4, 0, 0.5, 0);
            v987.AnchorPoint = Vector2.new(0, 0.5);
            v987.ZIndex = 2;
            v987.Selectable = true;
            v988.ZIndex = 2;
            v989.Size = UDim2.new(0.6, 0, 0, 40);
            v989.Position = UDim2.new(0.4, 0, 0.5, 0);
            v989.AnchorPoint = Vector2.new(0, 0.5);
            v989.ZIndex = 2;
            v989.Selectable = true;
            v990.ZIndex = 2;
            v1002 = v92:AddNewRowObject(l_NewPage_0, v991, v987, nil, true);
            v1003 = v92:AddNewRowObject(l_NewPage_0, v991, v989, nil, true);
            l_NewPage_0.VoiceConnectFrame = v1002;
            l_NewPage_0.VoiceDisconnectFrame = v1003;
            v1002.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceConnectFrame;
            v1003.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VoiceDisconnectFrame;
            voiceConnectSetRowRef(v1002);
            voiceDisconnectSetRowRef(v1003);
            if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_isVoiceFocused_0() then
                v1002.Visible = false;
                v1003.Visible = false;
                return;
            elseif l_default_2:ShouldShowJoinVoice() then
                v1002.Visible = true;
                v1003.Visible = false;
                return;
            else
                v1002.Visible = false;
                v1003.Visible = true;
            end;
        end;
    end;
    local function v1031() --[[ Line: 3715 ]] --[[ Name: createVRComfortSettingOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_1 = Enum.VRComfortSetting:GetEnumItems();
        local v1007 = {
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
        local v1008 = {};
        for v1009, v1010 in ipairs(l_EnumItems_1) do
            v1008[v1009] = v24:Format(v1007[tostring(v1010)]);
        end;
        local v1011 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
        local l_l_NewPage_0_113 = l_NewPage_0;
        local l_l_NewPage_0_114 = l_NewPage_0;
        local l_l_NewPage_0_115 = l_NewPage_0;
        local v1015, v1016, v1017 = v92:AddNewRow(l_NewPage_0, v24:Format(v1007.title), "Selector", v1008, v1011, nil, v24:Format(v1007.description));
        l_l_NewPage_0_113.VRComfortSettingFrame = v1015;
        l_l_NewPage_0_114.VRComfortSettingLabel = v1016;
        l_l_NewPage_0_115.VRComfortSettingSelector = v1017;
        l_NewPage_0.VRComfortSettingFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRComfortSettingFrame;
        l_l_NewPage_0_113 = l_GameSettings_0.VignetteEnabled and 1 or 2;
        l_l_NewPage_0_114 = l_NewPage_0;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1015 = l_NewPage_0;
        local v1018;
        v1016, v1017, v1018 = v92:AddNewRow(l_NewPage_0, v24:Format(v1007.vignetteEnabled), "Selector", {
            v24:Format(v1007.on), 
            v24:Format(v1007.off)
        }, l_l_NewPage_0_113);
        l_l_NewPage_0_114.VRVignetteEnabledFrame = v1016;
        l_l_NewPage_0_115.VRVignetteEnabledLabel = v1017;
        v1015.VRVignetteEnabledSelector = v1018;
        l_NewPage_0.VRVignetteEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRVignetteEnabledFrame;
        l_l_NewPage_0_114 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
        l_l_NewPage_0_115 = l_NewPage_0;
        v1015 = l_NewPage_0;
        v1016 = l_NewPage_0;
        local v1019;
        v1017, v1018, v1019 = v92:AddNewRow(l_NewPage_0, v24:Format(v1007.steppedRotationEnabled), "Selector", {
            v24:Format(v1007.on), 
            v24:Format(v1007.off)
        }, l_l_NewPage_0_114);
        l_l_NewPage_0_115.VRSteppedRotationEnabledFrame = v1017;
        v1015.VRSteppedRotationEnabledLabel = v1018;
        v1016.VRSteppedRotationEnabledSelector = v1019;
        l_NewPage_0.VRSteppedRotationEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSteppedRotationEnabledFrame;
        l_l_NewPage_0_115 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
        v1015 = l_NewPage_0;
        v1016 = l_NewPage_0;
        v1017 = l_NewPage_0;
        local v1020;
        v1018, v1019, v1020 = v92:AddNewRow(l_NewPage_0, v24:Format(v1007.thirdPersonFixedCamEnabled), "Selector", {
            v24:Format(v1007.on), 
            v24:Format(v1007.off)
        }, l_l_NewPage_0_115);
        v1015.VRThirdPersonFixedCamEnabledFrame = v1018;
        v1016.VRThirdPersonFixedCamEnabledLabel = v1019;
        v1017.VRThirdPersonFixedCamEnabledSelector = v1020;
        l_NewPage_0.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRThirdPersonFixedCamEnabledFrame;
        v1015 = function(v1021) --[[ Line: 3781 ]]
            -- upvalues: l_NewPage_0 (ref)
            if v1021 == Enum.VRComfortSetting.Custom then
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
        l_NewPage_0.VRComfortSettingSelector.IndexChanged:connect(function(v1022) --[[ Line: 3805 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), v1015 (copy)
            local v1023 = l_EnumItems_1[v1022];
            l_GameSettings_0.VRComfortSetting = v1023;
            v1015(v1023);
        end);
        v1015(l_GameSettings_0.VRComfortSetting);
        l_NewPage_0.VRVignetteEnabledSelector.IndexChanged:connect(function(v1024) --[[ Line: 3812 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VignetteEnabledCustomOption = v1024 == 1;
            end;
        end);
        l_NewPage_0.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(v1025) --[[ Line: 3818 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRSmoothRotationEnabledCustomOption = v1025 == 2;
            end;
        end);
        l_NewPage_0.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(v1026) --[[ Line: 3824 ]]
            -- upvalues: l_GameSettings_0 (ref)
            if l_GameSettings_0.VRComfortSetting == Enum.VRComfortSetting.Custom then
                l_GameSettings_0.VRThirdPersonFollowCamEnabledCustomOption = v1026 == 2;
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() --[[ Line: 3830 ]]
            -- upvalues: l_EnumItems_1 (copy), l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1027 = table.find(l_EnumItems_1, l_GameSettings_0.VRComfortSetting);
            if l_NewPage_0.VRComfortSettingSelector:GetSelectedIndex() ~= v1027 then
                l_NewPage_0.VRComfortSettingSelector:SetSelectionIndex(v1027);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() --[[ Line: 3837 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1028 = l_GameSettings_0.VignetteEnabled and 1 or 2;
            if l_NewPage_0.VRVignetteEnabledSelector:GetSelectedIndex() ~= v1028 then
                l_NewPage_0.VRVignetteEnabledSelector:SetSelectionIndex(v1028);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() --[[ Line: 3844 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1029 = l_GameSettings_0.VRSmoothRotationEnabled and 2 or 1;
            if l_NewPage_0.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= v1029 then
                l_NewPage_0.VRSteppedRotationEnabledSelector:SetSelectionIndex(v1029);
            end;
        end);
        l_GameSettings_0:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 3851 ]]
            -- upvalues: l_GameSettings_0 (ref), l_NewPage_0 (ref)
            local v1030 = l_GameSettings_0.VRThirdPersonFollowCamEnabled and 2 or 1;
            if l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= v1030 then
                l_NewPage_0.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v1030);
            end;
        end);
    end;
    local function v1046() --[[ Line: 3859 ]] --[[ Name: createVRSafetyBubbleModeOptions ]]
        -- upvalues: v24 (ref), l_GameSettings_0 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref)
        local l_EnumItems_2 = Enum.VRSafetyBubbleMode:GetEnumItems();
        local v1033 = {
            title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
            description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
            ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
            ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
            ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
        };
        local v1034 = {};
        for v1035, v1036 in ipairs(l_EnumItems_2) do
            v1034[v1035] = v24:Format(v1033[tostring(v1036)]);
        end;
        local v1037 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
        task.defer(function() --[[ Line: 3875 ]]
            -- upvalues: l_NewPage_0 (ref), v92 (ref), v24 (ref), v1033 (copy), v1034 (copy), v1037 (copy), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_EnumItems_2 (copy), l_GameSettings_0 (ref)
            local l_l_NewPage_0_116 = l_NewPage_0;
            local l_l_NewPage_0_117 = l_NewPage_0;
            local l_l_NewPage_0_118 = l_NewPage_0;
            local v1041, v1042, v1043 = v92:AddNewRow(l_NewPage_0, v24:Format(v1033.title), "DropDown", v1034, v1037, nil, v24:Format(v1033.description));
            l_l_NewPage_0_116.VRSafetyBubbleModeFrame = v1041;
            l_l_NewPage_0_117.VRSafetyBubbleModeLabel = v1042;
            l_l_NewPage_0_118.VRSafetyBubbleModeSelector = v1043;
            l_NewPage_0.VRSafetyBubbleModeFrame.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.VRSafetyBubbleModeFrame;
            l_NewPage_0.VRSafetyBubbleModeSelector.IndexChanged:connect(function(v1044) --[[ Line: 3888 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref)
                l_GameSettings_0.VRSafetyBubbleMode = l_EnumItems_2[v1044];
            end);
            l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 3893 ]]
                -- upvalues: l_EnumItems_2 (ref), l_GameSettings_0 (ref), l_NewPage_0 (ref)
                local v1045 = table.find(l_EnumItems_2, l_GameSettings_0.VRSafetyBubbleMode);
                if l_NewPage_0.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= v1045 then
                    l_NewPage_0.VRSafetyBubbleModeSelector:SetSelectionIndex(v1045);
                end;
            end);
        end);
    end;
    l_NewPage_0.VoiceChatOptionsEnabled = false;
    local v1047 = nil;
    local v1048 = nil;
    local v1049 = nil;
    if game:GetEngineFeature("VoiceChatSupported") and (l_GetFFlagEnableVrVoiceConnectDisconnect_0() or not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        spawn(function() --[[ Line: 3907 ]]
            -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (ref), v54 (ref), l_default_2 (ref), v986 (copy), l_isVoiceFocused_0 (ref), l_NewPage_0 (copy), l_observeIsVoiceFocused_0 (ref), v17 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v877 (copy), v60 (ref), v122 (ref), v21 (ref), v1005 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref), v121 (ref), v114 (ref)
            if l_GetFFlagEnableVoiceUxUpdates_0() and (not v54 and l_default_2:EligibleForFaeUpsell() or l_default_2:IsSeamlessVoice()) and l_default_2:verifyUniverseAndPlaceCanUseVoice() then
                v986();
                if l_isVoiceFocused_0() and l_NewPage_0.VoiceConnectDisconnectFrame then
                    l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                end;
                l_observeIsVoiceFocused_0(function(v1050) --[[ Line: 3917 ]]
                    -- upvalues: l_NewPage_0 (ref)
                    if v1050 then
                        if l_NewPage_0.VoiceConnectDisconnectFrame then
                            l_NewPage_0.VoiceConnectDisconnectFrame.Visible = false;
                            return;
                        end;
                    elseif l_NewPage_0.VoiceConnectDisconnectFrame then
                        l_NewPage_0.VoiceConnectDisconnectFrame.Visible = true;
                    end;
                end);
            end;
            l_default_2:asyncInit():andThen(function() --[[ Line: 3930 ]]
                -- upvalues: v17 (ref), l_default_2 (ref), l_NewPage_0 (ref), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v877 (ref), v60 (ref), v986 (ref), v122 (ref), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v21 (ref), v1005 (ref), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_isVoiceFocused_0 (ref), l_observeIsVoiceFocused_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref)
                v17 = l_default_2:getService();
                if l_default_2:VoiceChatAvailable() then
                    l_NewPage_0.VoiceChatOptionsEnabled = true;
                    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                        v877();
                    end;
                end;
                if v60 and l_default_2:UserVoiceEnabled() then
                    v986();
                end;
                if not v122() then
                    l_default_2:CheckAndShowNotAudiblePrompt();
                end;
                if l_GetFFlagEnableVoiceUxUpdates_0() then
                    l_NewPage_0.VoiceConnectDisconnectSelector:SetSelectionIndex(2);
                    return;
                else
                    local v1051 = false;
                    if v21() then
                        v1005();
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                            v1051 = l_isVoiceFocused_0();
                            l_observeIsVoiceFocused_0(function(v1052) --[[ Line: 3955 ]]
                                -- upvalues: v1051 (ref), l_NewPage_0 (ref), l_default_2 (ref)
                                v1051 = v1052;
                                if v1052 then
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
                            l_NewPage_0.VoiceDisconnectFrame.Visible = not v1051;
                        else
                            l_NewPage_0.VoiceDisconnectFrame.Visible = true;
                        end;
                    end;
                    l_default_2.showVoiceUI.Event:Connect(function() --[[ Line: 3988 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1051 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1051 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = true;
                            local v1053 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v72.Input .. "DeviceFrame"] then
                                l_NewPage_0[v72.Input .. "DeviceFrame"].Visible = v1053;
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
                    l_default_2.hideVoiceUI.Event:Connect(function() --[[ Line: 4006 ]]
                        -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), v1051 (ref), l_NewPage_0 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref), v21 (ref)
                        if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and v1051 then
                            return;
                        else
                            l_NewPage_0.VoiceChatOptionsEnabled = false;
                            local v1054 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
                            if l_NewPage_0[v72.Input .. "DeviceFrame"] then
                                l_NewPage_0[v72.Input .. "DeviceFrame"].Visible = v1054;
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
            end):catch(function() --[[ Line: 4026 ]]
                -- upvalues: v121 (ref), v114 (ref), v122 (ref), l_default_2 (ref)
                if v121() then
                    v114:warning("Failed to init VoiceChatServiceManager");
                end;
                if not v122() then
                    l_default_2:CheckAndShowPermissionPrompt();
                end;
            end);
        end);
    end;
    if l_GetFFlagEnableCrossExpVoice_0() and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        v1047 = l_default_3.ExperienceJoined.Event:Connect(function() --[[ Line: 4039 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref)
            local v1055 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v72.Input .. "DeviceFrame"] then
                l_NewPage_0[v72.Input .. "DeviceFrame"].Visible = v1055;
            end;
        end);
        v1048 = l_default_3.ExperienceLeft.Event:Connect(function() --[[ Line: 4042 ]]
            -- upvalues: l_NewPage_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (ref), l_default_3 (ref), v72 (ref)
            local v1056 = l_NewPage_0.VoiceChatOptionsEnabled or l_GetFFlagEnableCrossExpVoice_0() and l_default_3:getIsConnected();
            if l_NewPage_0[v72.Input .. "DeviceFrame"] then
                l_NewPage_0[v72.Input .. "DeviceFrame"].Visible = v1056;
            end;
        end);
        v1049 = function() --[[ Line: 4045 ]]
            -- upvalues: v1047 (ref), v1048 (ref)
            if v1047 then
                v1047:Disconnect();
                v1047 = nil;
            end;
            if v1048 then
                v1048:Disconnect();
                v1048 = nil;
            end;
        end;
    end;
    l_NewPage_0.VideoOptionsEnabled = false;
    local v1057 = nil;
    local function __() --[[ Line: 4059 ]]
        -- upvalues: v1057 (ref)
        if v1057 then
            v1057:disconnect();
            v1057 = nil;
        end;
    end;
    if l_GetFFlagSelfViewCameraSettings_0() and (not l_isInExperienceUIVREnabled_0 or not l_isSpatial_0()) then
        local function v1060(v1059) --[[ Line: 4067 ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0.VideoOptionsEnabled = v1059.hasCameraPermissions;
        end;
        if v27() then
            v26(v1060, {
                l_default_0.Permissions.CAMERA_ACCESS
            }, true);
            if v1057 then
                v1057:disconnect();
            end;
            v1057 = v33:connect(function() --[[ Line: 4083 ]]
                -- upvalues: l_NewPage_0 (copy), v956 (copy), l_VideoCaptureService_0 (ref), v958 (ref)
                l_NewPage_0.VideoOptionsEnabled = true;
                v956();
                if l_VideoCaptureService_0.DevicesChanged then
                    v958 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3440 ]]
                        -- upvalues: l_NewPage_0 (ref), v956 (ref)
                        if l_NewPage_0.PageOpen then
                            v956();
                        end;
                    end);
                end;
            end);
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v458(not v104 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
    end;
    local function __() --[[ Line: 4099 ]]
        -- upvalues: l_GameSettings_0 (ref), v798 (copy)
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v798();
            return;
        else
            local v1061 = nil;
            v1061 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4105 ]]
                -- upvalues: l_GameSettings_0 (ref), v1061 (ref), v798 (ref)
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    if v1061 then
                        v1061:disconnect();
                    end;
                    v798();
                end;
            end);
            return;
        end;
    end;
    if l_UserInputService_0.MouseEnabled then
        v781();
    elseif l_UserInputService_0.GamepadEnabled then
        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v798();
        else
            local v1063 = nil;
            do
                local l_v1063_0 = v1063;
                l_v1063_0 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4105 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1063_0 (ref), v798 (copy)
                    if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                        if l_v1063_0 then
                            l_v1063_0:disconnect();
                        end;
                        v798();
                    end;
                end);
            end;
        end;
    else
        local v1065 = nil;
        do
            local l_v1065_0 = v1065;
            l_v1065_0 = l_UserInputService_0.GamepadConnected:connect(function() --[[ Line: 4123 ]]
                -- upvalues: l_v1065_0 (ref), l_GameSettings_0 (ref), v798 (copy)
                if l_v1065_0 then
                    l_v1065_0:disconnect();
                end;
                if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                    v798();
                    return;
                else
                    local v1067 = nil;
                    v1067 = l_GameSettings_0:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() --[[ Line: 4105 ]]
                        -- upvalues: l_GameSettings_0 (ref), v1067 (ref), v798 (ref)
                        if l_GameSettings_0.IsUsingGamepadCameraSensitivity then
                            if v1067 then
                                v1067:disconnect();
                            end;
                            v798();
                        end;
                    end);
                    return;
                end;
            end);
        end;
    end;
    if not l_isInExperienceUIVREnabled_0 then
        if l_GameSettings_0.IsUsingCameraYInverted then
            v748();
        else
            local v1068 = nil;
            do
                local l_v1068_0 = v1068;
                l_v1068_0 = l_GameSettings_0.Changed:connect(function(v1070) --[[ Line: 4137 ]]
                    -- upvalues: l_GameSettings_0 (ref), l_v1068_0 (ref), v748 (copy)
                    if v1070 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                        l_v1068_0:disconnect();
                        v748();
                    end;
                end);
            end;
        end;
    end;
    if l_isInExperienceUIVREnabled_0 then
        if l_isSpatial_0() then
            v1031();
            v1046();
        else
            v458(not v104 and (l_UserInputService_0.TouchEnabled or l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled));
            if l_GameSettings_0.IsUsingCameraYInverted then
                v748();
            else
                local v1071 = nil;
                do
                    local l_v1071_0 = v1071;
                    l_v1071_0 = l_GameSettings_0.Changed:connect(function(v1073) --[[ Line: 4166 ]]
                        -- upvalues: l_GameSettings_0 (ref), l_v1071_0 (ref), v748 (copy)
                        if v1073 == "IsUsingCameraYInverted" and l_GameSettings_0.IsUsingCameraYInverted then
                            l_v1071_0:disconnect();
                            v748();
                        end;
                    end);
                end;
            end;
            v228();
            v257();
        end;
    end;
    v719();
    if v66 then
        v729();
    end;
    v739();
    v214();
    if v47 and v48() then
        v243();
    end;
    if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
        v134(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v141);
    end;
    if not l_isInExperienceUIVREnabled_0 then
        v228();
        v257();
    end;
    v272();
    v289();
    if not v108:IsSubjectToChinaPolicies() then
        v301();
    end;
    if v119 then
        v337();
    end;
    if v104 and l_getAppFeaturePolicies_0().getSupportsOverscan() then
        v810();
    end;
    if v47 and l_FFlagBadgeVisibilitySettingEnabled_0 then
        spawn(function() --[[ Line: 3120 ]]
            -- upvalues: v94 (ref), l_LocalPlayer_0 (ref), v62 (ref), v135 (ref), l_NewPage_0 (copy), v92 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), l_GameSettings_0 (ref)
            local v1074 = 2;
            if v94.IsPlayerInExperienceNameEnabledAsync(l_LocalPlayer_0) then
                v1074 = 1;
            end;
            local v1075 = v62:FormatByKey("Feature.SettingsHub.Label.Show");
            local v1076 = v62:FormatByKey("Feature.SettingsHub.Label.Hide");
            local v1077 = if v135 then v62:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges") else v62:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges");
            local v1078 = v62:FormatByKey("Feature.SettingsHub.Description.PeoplesNames");
            local l_l_NewPage_0_119 = l_NewPage_0;
            local l_l_NewPage_0_120 = l_NewPage_0;
            local l_l_NewPage_0_121 = l_NewPage_0;
            local v1082, v1083, v1084 = v92:AddNewRow(l_NewPage_0, v1077, "Selector", {
                v1076, 
                v1075
            }, v1074, nil, v1078);
            l_l_NewPage_0_119.badgeVisibleRow = v1082;
            l_l_NewPage_0_120.badgeVisibleFrame = v1083;
            l_l_NewPage_0_121.badgeVisibleSelector = v1084;
            l_NewPage_0.badgeVisibleRow.LayoutOrder = l_SETTINGS_MENU_LAYOUT_ORDER_0.BadgeVisibilityFrame;
            l_NewPage_0.badgeVisibleSelector.IndexChanged:connect(function(v1085) --[[ Line: 3134 ]]
                -- upvalues: l_GameSettings_0 (ref), v94 (ref), l_LocalPlayer_0 (ref)
                l_GameSettings_0.BadgeVisible = v1085 == 2;
                v94.SetPlayerInExperienceNameEnabled(l_LocalPlayer_0, v1085 == 1);
            end);
        end);
    end;
    if l_FFlagEnableModerateChatRemoteEvent_0 then
        v921();
    end;
    v823();
    v95(l_RunService_0:IsStudio(), l_LocalPlayer_0, v94):andThen(function(v1086) --[[ Line: 4229 ]]
        -- upvalues: v852 (copy)
        if v1086 then
            v852();
        end;
    end):catch(function(v1087) --[[ Line: 4234 ]]
        warn(v1087);
    end);
    v163 = true;
    if l_VRService_0.VREnabled then
        local l_VREnabled_3 = l_VRService_0.VREnabled;
        for v1089, __ in pairs(v164) do
            v1089.Visible = not l_VREnabled_3;
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
    local v1091 = l_Migration_0.uiblox["icons/common/settings"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v1091.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v101.Font[v1091.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Settings";
    l_NewPage_0.Page.ZIndex = 5;
    if l_NewPage_0.PageListLayout then
        l_NewPage_0.PageListLayout.Padding = UDim.new(0, 0);
    end;
    l_NewPage_0.PageOpen = false;
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
        l_NewPage_0.FeedbackEntryPointEnabled = true;
    end;
    local function __() --[[ Line: 4303 ]] --[[ Name: staticFeedbackEntryPointChecksPassed ]]
        -- upvalues: l_RunService_0 (ref), v129 (ref), v104 (ref)
        if l_RunService_0:IsStudio() then
            return false;
        elseif game:GetEngineFeature("CaptureModeEnabled") == false then
            return false;
        elseif v129 and v104 then
            return false;
        else
            return true;
        end;
    end;
    l_NewPage_0.OpenSettingsPage = function() --[[ Line: 4319 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v959 (copy), l_SoundService_0 (ref), v957 (ref), l_GameSettings_0 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), v956 (copy), l_VideoCaptureService_0 (ref), v958 (ref), v859 (copy), v20 (ref), v76 (ref), v96 (ref), v75 (ref), l_FFlagIEMFocusNavToButtons_0 (ref), v154 (ref), l_FFlagIEMTabFocusNav_0 (ref), v161 (ref)
        l_NewPage_0.PageOpen = true;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            v959();
            if l_SoundService_0.DeviceListChanged then
                v957 = l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 3430 ]]
                    -- upvalues: l_NewPage_0 (ref), v959 (ref)
                    if l_NewPage_0.PageOpen then
                        v959();
                    end;
                end);
            end;
            l_NewPage_0.startVolume = l_GameSettings_0.MasterVolume;
            if l_GetFFlagSelfViewCameraSettings_0() and l_NewPage_0.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
                v956();
                if l_VideoCaptureService_0.DevicesChanged then
                    v958 = l_VideoCaptureService_0.DevicesChanged:Connect(function() --[[ Line: 3440 ]]
                        -- upvalues: l_NewPage_0 (ref), v956 (ref)
                        if l_NewPage_0.PageOpen then
                            v956();
                        end;
                    end);
                end;
            end;
            v859();
            if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and l_NewPage_0.toggleFeedbackModeButton and l_NewPage_0.toggleFeedbackModeText then
                local l_l_NewPage_0_122 = l_NewPage_0;
                local v1094 = false;
                if v20 ~= nil then
                    v1094 = v20:CanEnterCaptureMode();
                end;
                l_l_NewPage_0_122.FeedbackEntryPointEnabled = v1094;
                if l_NewPage_0.FeedbackEntryPointEnabled then
                    l_NewPage_0.toggleFeedbackModeButton.Active = true;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = true;
                    l_NewPage_0.toggleFeedbackModeText.Text = v76;
                else
                    l_NewPage_0.toggleFeedbackModeButton.Active = false;
                    l_NewPage_0.toggleFeedbackModeButton.Enabled.Value = false;
                    l_NewPage_0.toggleFeedbackModeText.TextColor3 = v96.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100));
                    l_NewPage_0.toggleFeedbackModeText.Text = v75;
                end;
            end;
            if l_FFlagIEMFocusNavToButtons_0 then
                table.insert(l_NewPage_0.LastSelectableObjects, v154(l_NewPage_0));
            end;
            if l_FFlagIEMTabFocusNav_0 then
                table.insert(l_NewPage_0.FirstSelectableObjects, v161(l_NewPage_0));
                l_NewPage_0.FirstSelectableObjectsUpdated:fire();
            end;
            return;
        end;
    end;
    l_NewPage_0.CloseSettingsPage = function() --[[ Line: 4376 ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), l_SoundService_0 (ref), v957 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v1049 (ref), l_GetFFlagSelfViewCameraSettings_0 (ref), l_VideoCaptureService_0 (ref), v958 (ref), v1057 (ref), l_default_2 (ref)
        l_NewPage_0.PageOpen = false;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if l_SoundService_0.DeviceListChanged and v957 then
                v957:Disconnect();
            end;
            if l_GetFFlagEnableCrossExpVoice_0() and v1049 then
                v1049();
            end;
            if l_GetFFlagSelfViewCameraSettings_0() then
                if game:GetEngineFeature("VideoCaptureService") and l_VideoCaptureService_0.DevicesChanged and v958 then
                    v958:Disconnect();
                    v958 = nil;
                end;
                if v1057 then
                    v1057:disconnect();
                    v1057 = nil;
                end;
            end;
            if game:GetEngineFeature("VoiceChatSupported") and l_NewPage_0.VoiceChatOptionsEnabled and l_NewPage_0.startVolume ~= nil and l_NewPage_0.startVolume > 0 then
                l_default_2:CheckAndShowNotAudiblePrompt();
            end;
            return;
        end;
    end;
    isLangaugeSelectionDropdownEnabled = function() --[[ Line: 4409 ]] --[[ Name: isLangaugeSelectionDropdownEnabled ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
            return false;
        elseif l_LocalPlayer_0.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
            return true;
        else
            for v1095 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
                if tonumber(v1095) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    l_NewPage_0.SetHub = function(__, v1097) --[[ Line: 4432 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v132 (ref), v133 (ref), l_SETTINGS_MENU_LAYOUT_ORDER_0 (ref), v141 (ref), v703 (copy), v83 (ref), v85 (ref), v84 (ref), v708 (copy), l_game_EngineFeature_0 (ref), v88 (ref), l_GameSettings_0 (ref), l_TextChatService_0 (ref), v87 (ref), v90 (ref), l_RunService_0 (ref), v129 (ref), v104 (ref), v480 (copy)
        l_NewPage_0.HubRef = v1097;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return;
        else
            if isLangaugeSelectionDropdownEnabled() then
                if v132() then
                    v133(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v141);
                else
                    v703();
                end;
            end;
            if game:GetEngineFeature("EnableTCSChatTranslation") and v83() then
                if v85() then
                    local v1098 = v84();
                    if not v708(v1098).ChatTranslationEnabled then
                        if l_game_EngineFeature_0 then
                            if v88() then
                                if l_GameSettings_0.ChatTranslationLocale == "" then
                                    l_GameSettings_0.ChatTranslationEnabled = false;
                                    l_GameSettings_0.ChatTranslationLocale = "en_us";
                                end;
                            else
                                l_GameSettings_0.ChatTranslationEnabled = false;
                            end;
                        else
                            pcall(function() --[[ Line: 4468 ]]
                                -- upvalues: l_TextChatService_0 (ref)
                                l_TextChatService_0.ChatTranslationEnabled = false;
                            end);
                        end;
                    elseif v87() then
                        l_GameSettings_0.ChatTranslationEnabled = true;
                    end;
                end;
                v90(l_NewPage_0, l_SETTINGS_MENU_LAYOUT_ORDER_0, v141);
            end;
            if not l_RunService_0:IsStudio() and not (game:GetEngineFeature("CaptureModeEnabled") == false) and (not v129 or not v104 or false) then
                v480();
            end;
            return;
        end;
    end;
    return l_NewPage_0;
end)());