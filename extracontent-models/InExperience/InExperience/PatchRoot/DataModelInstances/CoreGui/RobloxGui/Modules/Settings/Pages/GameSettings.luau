local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local SoundService = game:GetService("SoundService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local v13 = UserSettings()
local GameSettings = v13.GameSettings
local VideoCaptureService = game:GetService("VideoCaptureService")
local UserGameSettings = v13:GetService("UserGameSettings")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local u18 = nil
local TextChatService = game:GetService("TextChatService")
local SafetyService = game:GetService("SafetyService")
local ExperienceStateCaptureService = nil

if game:GetEngineFeature("CaptureModeEnabled") then
	ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
end

local GetFFlagEnableConnectDisconnectInSettingsAndChrome = require(RobloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagIEMSettingsGroups = require(RobloxGui.Modules.Settings.Flags.FFlagIEMSettingsGroups)
local u25 = nil

if GetFFlagEnableConnectDisconnectInSettingsAndChrome() or isInExperienceUIVREnabled then
	local LocalizationService = game:GetService("LocalizationService")

	u25 = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(LocalizationService.RobloxLocaleId)
end

local getCamMicPermissions = require(RobloxGui.Modules.Settings.getCamMicPermissions)
local isCamEnabledForUserAndPlace = require(RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace)
local renderSettingsHeader = nil
local renderSettingsDivider = nil

if FFlagIEMSettingsGroups then
	renderSettingsHeader = require(RobloxGui.Modules.Settings.Components.renderSettingsHeader)
	renderSettingsDivider = require(RobloxGui.Modules.Settings.Components.renderSettingsDivider)
end

local default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local isVoiceFocused = require(CorePackages.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local observeIsVoiceFocused = require(CorePackages.Workspace.Packages.CrossExperience).Utils.observeIsVoiceFocused
local cameraDevicePermissionGrantedSignal = require(CoreGui.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty = SharedFlags.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagSelfViewCameraSettings = SharedFlags.GetFFlagSelfViewCameraSettings
local GetFFlagAlwaysShowVRToggle = require(RobloxGui.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local GetFFlagDebounceConnectDisconnectSelector = require(RobloxGui.Modules.Settings.Flags.GetFFlagDebounceConnectDisconnectSelector)
local GetFIntDebounceDisconnectButtonDelay = require(RobloxGui.Modules.Flags.GetFIntDebounceDisconnectButtonDelay)
local TouchEnabled = UserInputService.TouchEnabled
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = SharedFlags.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local GetFFlagVoiceChatClientRewriteMasterLua = SharedFlags.GetFFlagVoiceChatClientRewriteMasterLua
local GetFFlagVoiceChatClientRewriteDisableVCSDevice = SharedFlags.GetFFlagVoiceChatClientRewriteDisableVCSDevice
local FFlagIEMFocusNavToButtons = SharedFlags.FFlagIEMFocusNavToButtons
local FFlagIEMTabFocusNav = SharedFlags.FFlagIEMTabFocusNav
local v48 = game:DefineFastFlag("ShowAntiHarassmentSettings", false)
local GetFFlagEnablePlayerNamesEnabledSetting = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local FFlagUpdatePeopleNamesSettingCopy = require(RobloxGui.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy)
local FFlagBadgeVisibilitySettingEnabled = SharedFlags.FFlagBadgeVisibilitySettingEnabled
local GetFFlagEnableVoiceUxUpdates = SharedFlags.GetFFlagEnableVoiceUxUpdates
local GetFFlagEnableVrVoiceConnectDisconnect = SharedFlags.GetFFlagEnableVrVoiceConnectDisconnect
local v54 = game:DefineFastFlag("EnableVoiceSelectorTranslations_AEGIS2", false)
local v55 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false)
local v56 = game:DefineFastFlag("CenterShiftLockOverride", true)
local v57 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false)
local v58 = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false)
local FFlagEnableModerateChatRemoteEvent = SharedFlags.FFlagEnableModerateChatRemoteEvent
local v60 = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false)
local v61 = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false)
local FFlagVoiceRewarmTelemetry = SharedFlags.FFlagVoiceRewarmTelemetry
local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local default2 = require(CorePackages.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local GameSettingsConstants = require(RobloxGui.Modules.Settings.Resources.GameSettingsConstants)
local v67 = default2 and default2.getHasPartyVoiceVolume()
local Constants = require(RobloxGui:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local t1 = {
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
}
local t2 = {
	DevComputerMovementMode = true,
	DevComputerCameraMode = true,
	DevEnableMouseLock = true
}
local t3 = {
	DevTouchMovementMode = true,
	DevTouchCameraMode = true
}
local t4 = {
	DEFAULT_FOLLOW = "Default (Follow)",
	DEFAULT_CLASSIC = "Default (Classic)"
}
local t5 = {
	Input = "Input",
	Output = "Output"
}
local t6 = {
	DEFAULT_THUMBSTICK = "Default (Dynamic Thumbstick)",
	DEFAULT_KEYBOARD = "Default (Keyboard)",
	TAP_TO_MOVE = "Tap to Move",
	CLICK_TO_MOVE = "Click to Move"
}
local v75 = RobloxTranslator:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local v76 = RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local v77 = RobloxTranslator:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local t7 = {
	On = 1,
	Off = 2
}
local SETTINGS_MENU_LAYOUT_ORDER = GameSettingsConstants.SETTINGS_MENU_LAYOUT_ORDER
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local GetFFlagChatTranslationSettingEnabled = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationSettingEnabled)
local GetFStringChatTranslationLayerName = require(RobloxGui.Modules.Flags.GetFStringChatTranslationLayerName)
local GetFFlagChatTranslationHoldoutEnabled = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled)
local GetFFlagChatTranslationWaitForIXP = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationWaitForIXP)
local GetFFlagChatTranslationForceSetting = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationForceSetting)
local GetFFlagChatTranslationNewDefaults = require(RobloxGui.Modules.Flags.GetFFlagChatTranslationNewDefaults)
local EngineFeature = game:GetEngineFeature("TextChatServiceSettingsSaved")
local ChatTranslationOptionsWithChatLanguageSwitcherInitializer = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer)
local EngineFeature2 = game:GetEngineFeature("GameBasicSettingsFramerateCap")
local Utility = require(RobloxGui.Modules.Settings.Utility)
local CoreUtility = require(RobloxGui.Modules.CoreUtility)
local PlayerPermissionsModule = require(RobloxGui.Modules.PlayerPermissionsModule)
local GetHasGuiHidingPermission = require(RobloxGui.Modules.Common.GetHasGuiHidingPermission)
local Theme = require(RobloxGui.Modules.Settings.Theme)
local Cryo = require(CorePackages.Packages.Cryo)
local GfxReset = require(script.Parent.Parent.GfxReset)
local Create = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ThrottleFunctionCall = require(CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall)
local BuilderIcons = require(CorePackages.Packages.BuilderIcons)
local Signals = require(CorePackages.Packages.Signals)
local Migration = BuilderIcons.Migration

RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
RobloxGui:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub")

local v102 = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local LocalPlayer = Players.LocalPlayer
local Platform = UserInputService:GetPlatform()
local CachedPolicyService = require(CorePackages.Workspace.Packages.CachedPolicyService)
local default3 = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local default4 = require(CorePackages.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local getAppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local v109 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local v110 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local v111 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)

game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)

local FastInt = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local v113 = not CachedPolicyService:IsSubjectToChinaPolicies()
local v114 = Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
local v115 = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
local v116 = if not isInExperienceUIVREnabled then (v115 or v114) and v113 else (v115 or (v114 or isSpatial())) and v113
local GetFIntVoiceChatDeviceChangeDebounceDelay = require(RobloxGui.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay)
local GetFFlagVoiceChatUILogging = require(RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local GetFFlagEnableUniveralVoiceToasts = require(RobloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local GetFFlagEnableExplicitSettingsChangeAnalytics = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics)
local GetFFlagFixCyclicFullscreenIndexEvent = require(RobloxGui.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent)
local v122 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false)
local v123 = game:DefineFastFlag("UserShowGuiHideToggles", false)
local v124 = game:DefineFastFlag("UserFreecamGuiDestabilization", false)
local v125 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false)
local v126 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false)
local v127 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false)
local v128 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false)
local GetFFlagEnableLocalesForExperienceLanguageSwitcher = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher)
local ExperienceLanguageSwitcherInitializer = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer)
local PlayerChoiceTranslationSettingInitializer = require(RobloxGui.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer)
local v132 = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false)

local function reportSettingsChangeForAnalytics(p1, p2, p3, p4) -- line: 299
	-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), UserInputService (copy), Cryo (copy), RbxAnalyticsService (copy), Constants (copy)
	if not GetFFlagEnableExplicitSettingsChangeAnalytics() or (p2 == p3 or p2 == nil or p3 == nil) then
		return
	end

	local t8 = {
		universe_id = tostring(game.GameId),
		name = p1,
		old_value = tostring(p2),
		new_value = tostring(p3),
		has_touch = UserInputService.TouchEnabled,
		has_mouse = UserInputService.MouseEnabled,
		has_gamepad = UserInputService.GamepadEnabled
	}

	if p4 then
		t8 = Cryo.Dictionary.join(t8, p4)
	end

	RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsInGameMenuName, Constants.AnalyticsExplicitSettingsChangeName, t8)
end
local function reportSettingsForAnalytics() -- line: 330
	-- upvalues: UserInputService (copy), GameSettings (copy), EngineFeature2 (copy), GetFFlagEnablePlayerNamesEnabledSetting (copy), RbxAnalyticsService (copy), Constants (copy)
	local t9 = {}
	local v144 = UserInputService.PreferredInput == Enum.PreferredInput.Touch

	if v144 then
		t9.camera_mode_touch = tostring(GameSettings.TouchCameraMovementMode)
	else
		t9.camera_mode_desktop = tostring(GameSettings.ComputerCameraMovementMode)
	end

	if v144 then
		t9.movement_mode_touch = tostring(GameSettings.TouchMovementMode)
	else
		t9.movement_mode_desktop = tostring(GameSettings.ComputerMovementMode)
	end

	if UserInputService.MouseEnabled then
		t9.shift_lock_enabled = tostring(GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
	end

	if UserInputService.GamepadEnabled and GameSettings.IsUsingGamepadCameraSensitivity then
		local GamepadCameraSensitivity = GameSettings.GamepadCameraSensitivity

		t9.camera_sensitivity_gamepad = tostring((tonumber(string.format("%.2f", GamepadCameraSensitivity))))
	end

	if UserInputService.MouseEnabled then
		local MouseSensitivityFirstPersonX = GameSettings.MouseSensitivityFirstPerson.X

		t9.camera_sensitivity_mouse = tostring((tonumber(string.format("%.2f", MouseSensitivityFirstPersonX))))
	end

	t9.camera_y_inverted = tostring(GameSettings.CameraYInverted)
	t9.show_performance_stats = tostring(GameSettings.PerformanceStatsVisible)
	t9.volume = tostring((math.floor(GameSettings.MasterVolume * 10 + 0.5)))
	t9.gfx_quality_level = tostring(settings().Rendering.QualityLevel)

	if EngineFeature2 then
		t9.framerate_cap = tostring(GameSettings.FramerateCap)
	end

	t9.fullscreen_enabled = tostring(GameSettings:InFullScreen())
	t9.microprofiler_enabled = tostring(GameSettings.OnScreenProfilerEnabled)
	t9.microprofiler_webserver_enabled = tostring(GameSettings.MicroProfilerWebServerEnabled)
	t9.reduced_motion = tostring(GameSettings.ReducedMotion)
	t9.preferred_transparency = tostring(GameSettings.PreferredTransparency)
	t9.preferred_text_size = tostring(GameSettings.PreferredTextSize)
	t9.ui_navigation_key_bind_enabled = tostring(GameSettings.UiNavigationKeyBindEnabled)
	t9.universeid = tostring(game.GameId)

	if GetFFlagEnablePlayerNamesEnabledSetting() then
		t9.player_names_enabled = tostring(GameSettings.PlayerNamesEnabled)
	end

	RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsInGameMenuName, Constants.AnalyticsSettingsChangeName, t9)
end

game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0)
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "")

local v135 = game:DefineFastFlag("IGMEnableGFXReset", false)

local function getLastValueChangerFrame(p5) -- line: 396
	-- upvalues: FFlagIEMFocusNavToButtons (copy)
	if not FFlagIEMFocusNavToButtons then
		return
	end

	local SelectionFrameLayoutOrder = nil
	local v149 = nil

	for __, v in pairs(p5:GetRows()) do
		local SelectionFrame = v.SelectionFrame

		if not SelectionFrameLayoutOrder or SelectionFrameLayoutOrder <= SelectionFrame.LayoutOrder then
			SelectionFrameLayoutOrder = SelectionFrame.LayoutOrder
			v149 = p5:getValueChangerFrame(v.ValueChanger)
		end
	end

	return v149
end
local function getFirstValueChangerFrame(p6) -- line: 415
	-- upvalues: FFlagIEMTabFocusNav (copy)
	if not FFlagIEMTabFocusNav then
		return
	end

	local SelectionFrameLayoutOrder = nil
	local v155 = nil

	for __, v in pairs(p6:GetRows()) do
		local SelectionFrame = v.SelectionFrame

		if not SelectionFrameLayoutOrder or SelectionFrameLayoutOrder > SelectionFrame.LayoutOrder then
			SelectionFrameLayoutOrder = SelectionFrame.LayoutOrder
			v155 = p6:getValueChangerFrame(v.ValueChanger)
		end
	end

	return v155
end

return ((function() --[[ Initialize ]] -- line: 434
	-- upvalues: v135 (copy), GfxReset (copy), RobloxGui (copy), VRService (copy), GameSettings (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GuiService (copy), GetFFlagFixCyclicFullscreenIndexEvent (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), RbxAnalyticsService (copy), Constants (copy), EngineFeature2 (copy), RobloxTranslator (copy), FastInt (copy), t1 (copy), v132 (copy), FFlagUpdatePeopleNamesSettingCopy (copy), t7 (copy), UserInputService (copy), Create (copy), Theme (copy), v56 (copy), v58 (copy), TouchEnabled (copy), v115 (copy), v114 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), LocalPlayer (copy), CoreUtility (copy), t4 (copy), GetFFlagAlwaysShowVRToggle (copy), getAppFeaturePolicies (copy), t6 (copy), v75 (copy), t3 (copy), t2 (copy), Url (copy), HttpService (copy), v128 (copy), SafetyService (copy), ExperienceStateCaptureService (ref), v127 (copy), v77 (copy), v122 (copy), v111 (copy), Players (copy), v76 (copy), RunService (copy), GetFFlagChatTranslationWaitForIXP (copy), IXPServiceWrapper (copy), GetFFlagChatTranslationNewDefaults (copy), GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default4 (copy), u25 (ref), CorePackages (copy), ContextActionService (copy), v125 (copy), PlayerPermissionsModule (copy), v124 (copy), v123 (copy), GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), u18 (ref), GetFFlagVoiceChatUILogging (copy), SoundService (copy), t5 (copy), GetFIntVoiceChatDeviceChangeDebounceDelay (copy), default3 (copy), GetFFlagEnableCrossExpVoice (copy), Signals (copy), v110 (copy), UserGameSettings (copy), VideoCaptureService (copy), v109 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), v61 (copy), v60 (copy), v54 (copy), GetFIntDebounceDisconnectButtonDelay (copy), GetFFlagDebounceConnectDisconnectSelector (copy), FFlagVoiceRewarmTelemetry (copy), ThrottleFunctionCall (copy), v57 (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), GetFFlagEnableVrVoiceConnectDisconnect (copy), GetFFlagEnableVoiceUxUpdates (copy), v55 (copy), observeIsVoiceFocused (copy), GetFFlagEnableUniveralVoiceToasts (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), GetFFlagSelfViewCameraSettings (copy), isCamEnabledForUserAndPlace (copy), getCamMicPermissions (copy), default (copy), cameraDevicePermissionGrantedSignal (copy), v102 (copy), v67 (copy), v48 (copy), GetFFlagEnablePlayerNamesEnabledSetting (copy), PlayerChoiceTranslationSettingInitializer (copy), CachedPolicyService (copy), v116 (copy), FFlagBadgeVisibilitySettingEnabled (copy), FFlagEnableModerateChatRemoteEvent (copy), GetHasGuiHidingPermission (copy), FFlagIEMSettingsGroups (copy), renderSettingsHeader (ref), renderSettingsDivider (ref), Migration (copy), BuilderIcons (copy), v126 (copy), FFlagIEMFocusNavToButtons (copy), getLastValueChangerFrame (copy), FFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy), GetFFlagEnableLocalesForExperienceLanguageSwitcher (copy), ExperienceLanguageSwitcherInitializer (copy), GetFFlagChatTranslationSettingEnabled (copy), GetFFlagChatTranslationHoldoutEnabled (copy), GetFStringChatTranslationLayerName (copy), EngineFeature (copy), TextChatService (copy), GetFFlagChatTranslationForceSetting (copy), ChatTranslationOptionsWithChatLanguageSwitcherInitializer (copy)
	if v135 then
		GfxReset.RunGfxReset()
	end

	local v159 = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	local u160 = false
	local t10 = {}

	VRService:GetPropertyChangedSignal("VREnabled"):connect(function() --[[ onVREnabled ]] -- line: 451
		-- upvalues: VRService (copy), u160 (ref), t10 (copy)
		if VRService.VREnabled and u160 then
			local VREnabled = VRService.VREnabled

			for k, __ in pairs(t10) do
				k.Visible = not VREnabled
			end
		end
	end)

	if VRService.VREnabled and u160 then
		local VREnabled = VRService.VREnabled

		for k, __ in pairs(t10) do
			k.Visible = not VREnabled
		end
	end

	local function createReducedMotionOptions() -- line: 716
		-- upvalues: GameSettings (copy), RobloxTranslator (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local n1 = 2

		if GameSettings.ReducedMotion then
			n1 = 1
		end

		local v238 = RobloxTranslator:FormatByKey("Feature.Accessibility.Heading.ReducedMotion")
		local v239 = RobloxTranslator:FormatByKey("Feature.Accessibility.Description.ReducedMotion")
		local v240 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.On")
		local v241 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.Off")
		local v242 = v159
		local v243 = v159
		local v244 = v159
		local v245, v246, v247 = Utility:AddNewRow(v159, v238, "Selector", {
			v240,
			v241
		}, n1, nil, v239)

		v242.ReducedMotionFrame = v245
		v243.ReducedMotionLabel = v246
		v244.ReducedMotionMode = v247
		v159.ReducedMotionFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ReducedMotionFrame
		v159.ReducedMotionMode.IndexChanged:connect(function(p7) -- line: 738
			-- upvalues: GameSettings (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local ReducedMotion = GameSettings.ReducedMotion

			GameSettings.ReducedMotion = p7 == 1

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("reduced_motion", ReducedMotion, GameSettings.ReducedMotion)
			end

			reportSettingsForAnalytics()
		end)
	end
	local function createPreferredTransparencyOptions() -- line: 785
		-- upvalues: GameSettings (copy), RobloxTranslator (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local v259 = 10 - math.clamp(math.floor(GameSettings.PreferredTransparency * 10 + 0.5), 0, 10)
		local v260 = RobloxTranslator:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency")
		local v261 = RobloxTranslator:FormatByKey("Feature.Accessibility.Description.PreferredTransparency")
		local v262 = RobloxTranslator:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent")
		local v263 = RobloxTranslator:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque")
		local v264 = v159
		local v265 = v159
		local v266 = v159
		local v267, v268, v269 = Utility:AddNewRow(v159, v260, "Slider", 10, v259, nil, v261, v262, v263)

		v264.PreferredTransparencyFrame = v267
		v265.PreferredTransparencyLabel = v268
		v266.PreferredTransparencySlider = v269
		v159.PreferredTransparencyFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTransparencyFrame
		v159.PreferredTransparencySlider.ValueChanged:connect(function(p8) -- line: 811
			-- upvalues: GameSettings (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v688 = (10 - math.clamp(math.floor(p8), 0, 10)) / 10
			local PreferredTransparency = GameSettings.PreferredTransparency

			GameSettings.PreferredTransparency = v688

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("preferred_transparency", PreferredTransparency, GameSettings.PreferredTransparency)
			end

			reportSettingsForAnalytics()
		end)
	end
	local function createWebServerInformationRow() -- line: 989
		-- upvalues: v159 (copy), Utility (copy), v58 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), TouchEnabled (copy), Create (copy), Theme (copy)
		local v306 = v159
		local v307 = v159
		local v308 = v159
		local v309, v310, v311 = Utility:AddNewRow(v159, "MicroProfiler Information", "TextBox", nil, nil, 5, nil, nil, nil, not v58 and nil)

		v306.InformationFrame = v309
		v307.InformationLabel = v310
		v308.InformationTextBox = v311
		v159.InformationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.InformationFrame
		v159.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

		if TouchEnabled then
			v159.InformationText = Create("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				Font = Theme.font(Enum.Font.SourceSans),
				FontSize = Theme.fontSize(Enum.FontSize.Size18),
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(0, 5, 0, 0),
				Visible = true,
				ZIndex = 2,
				Parent = v159.InformationFrame
			})
		else
			v159.InformationText = Create("TextLabel")({
				Name = "InformationLabel",
				Text = "Information Loading",
				Font = Theme.font(Enum.Font.SourceSans),
				FontSize = Theme.fontSize(Enum.FontSize.Size14),
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 800, 1, 0),
				Position = UDim2.new(1, -650, 0, 20),
				Visible = true,
				ZIndex = 2,
				Parent = v159.InformationFrame
			})
		end

		return v159.InformationFrame, v159.InformationText
	end
	local function createCameraModeOptions(p9) -- line: 1170
		-- upvalues: v159 (copy), GameSettings (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t10 (copy), Create (copy), Theme (copy), v56 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), LocalPlayer (copy), UserInputService (copy), CoreUtility (copy), t4 (copy), VRService (copy), GetFFlagAlwaysShowVRToggle (copy), getAppFeaturePolicies (copy), RobloxTranslator (copy), Constants (copy), t6 (copy), v75 (copy), t3 (copy), t2 (copy)
		local v332 = v159
		local v333 = v159
		local v334 = v159
		local v335 = v159

		v332.ShiftLockFrame = nil
		v333.ShiftLockLabel = nil
		v334.ShiftLockMode = nil
		v335.ShiftLockOverrideText = nil

		local n2 = 2

		if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then
			n2 = 1
		end

		local v337 = v159
		local v338 = v159
		local v339 = v159
		local v340, v341, v342 = Utility:AddNewRow(v159, "Shift Lock Switch", "Selector", {
			"On",
			"Off"
		}, n2)

		v337.ShiftLockFrame = v340
		v338.ShiftLockLabel = v341
		v339.ShiftLockMode = v342
		v159.ShiftLockFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ShiftLockFrame
		t10[v159.ShiftLockFrame] = true
		v159.ShiftLockOverrideText = Create("TextLabel")({
			Name = "ShiftLockOverrideLabel",
			Text = "Set by Developer",
			TextColor3 = Color3.new(1, 1, 1),
			Font = Theme.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = Theme.fontSize(Enum.FontSize.Size24, "GameSettings"),
			BackgroundTransparency = 1,
			Size = if not v56 then UDim2.new(0, 200, 1, 0) else UDim2.new(0.6, 0, 1, 0),
			Position = if not v56 then UDim2.new(1, -350, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = if not v56 then nil else Vector2.new(1, 0.5),
			Visible = false,
			ZIndex = 2,
			Parent = v159.ShiftLockFrame
		})
		v159.ShiftLockMode.IndexChanged:connect(function(p10) -- line: 1201
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v716 = nil

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				v716 = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
			end

			if p10 == 1 then
				GameSettings.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				GameSettings.ControlMode = Enum.ControlMode.Classic
			end

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("shift_lock_enabled", v716, GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end

			reportSettingsForAnalytics()
		end)

		local v343 = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled

		if v159.ShiftLockFrame then
			v159.ShiftLockFrame.Visible = v343
		end

		local v344 = not LocalPlayer.DevEnableMouseLock

		if v159.ShiftLockOverrideText then
			v159.ShiftLockOverrideText.Visible = v344

			local v345 = not v344 and LocalPlayer.DevEnableMouseLock

			if v159.ShiftLockMode then
				v159.ShiftLockMode.SelectorFrame.Visible = v345
				v159.ShiftLockMode:SetInteractable(v345)
			end
		end

		UserInputService:GetPropertyChangedSignal("MouseEnabled"):Connect(function() -- line: 1249
			-- upvalues: UserInputService (copy), v159 (copy), LocalPlayer (copy)
			local v724 = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled

			if v159.ShiftLockFrame then
				v159.ShiftLockFrame.Visible = v724
			end

			local v725 = not LocalPlayer.DevEnableMouseLock

			if v159.ShiftLockOverrideText then
				v159.ShiftLockOverrideText.Visible = v725

				local v726 = not v725 and LocalPlayer.DevEnableMouseLock

				if v159.ShiftLockMode then
					v159.ShiftLockMode.SelectorFrame.Visible = v726
					v159.ShiftLockMode:SetInteractable(v726)
				end
			end
		end)
		UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() -- line: 1253
			-- upvalues: UserInputService (copy), v159 (copy), LocalPlayer (copy)
			local v727 = UserInputService.MouseEnabled and UserInputService.KeyboardEnabled

			if v159.ShiftLockFrame then
				v159.ShiftLockFrame.Visible = v727
			end

			local v728 = not LocalPlayer.DevEnableMouseLock

			if v159.ShiftLockOverrideText then
				v159.ShiftLockOverrideText.Visible = v728

				local v729 = not v728 and LocalPlayer.DevEnableMouseLock

				if v159.ShiftLockMode then
					v159.ShiftLockMode.SelectorFrame.Visible = v729
					v159.ShiftLockMode:SetInteractable(v729)
				end
			end
		end)

		function cameraModeIsUserChoice() -- line: 1259
			-- upvalues: UserInputService (copy), LocalPlayer (copy)
			if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
				return LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			end

			return LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		function setCameraModeVisible(p11) -- line: 1268
			-- upvalues: v159 (copy)
			if v159.CameraMode then
				v159.CameraMode.SelectorFrame.Visible = p11
				v159.CameraMode:SetInteractable(p11)
				v159.CameraModeOverrideText.Visible = not p11
			end
		end

		local v346 = CoreUtility.waitForChildOfClass(LocalPlayer, "PlayerScripts")
		local t11 = {}
		local t12 = {}

		local function updateCurrentCameraMovementIndex(p12) -- line: 1282
			-- upvalues: t12 (ref), t11 (ref), UserInputService (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy)
			local u732 = nil

			if not pcall(function() -- line: 1284
				-- upvalues: u732 (ref), t12 (ref), t11 (ref), p12 (copy)
				u732 = t12[t11[p12]]
			end) or u732 == nil then
				return false
			end

			local TouchCameraMovementModeValue = nil
			local v734

			if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					TouchCameraMovementModeValue = GameSettings.TouchCameraMovementMode.Value
				end

				v734 = GameSettings.TouchCameraMovementMode.Value ~= u732
				GameSettings.TouchCameraMovementMode = u732
			else
				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					TouchCameraMovementModeValue = GameSettings.ComputerCameraMovementMode.Value
				end

				v734 = GameSettings.ComputerCameraMovementMode.Value ~= u732
				GameSettings.ComputerCameraMovementMode = u732
			end

			if GetFFlagEnableExplicitSettingsChangeAnalytics() and v734 then
				reportSettingsChangeForAnalytics("camera_mode", TouchCameraMovementModeValue, u732)
			end

			return v734
		end
		local function updateCameraMovementModes() -- line: 1318
			-- upvalues: v346 (copy), UserInputService (copy), t11 (ref), t12 (ref), t4 (copy), v159 (copy), GameSettings (copy), updateCurrentCameraMovementIndex (copy)
			local t13 = {}

			if v346 then
				t13 = if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then v346:GetRegisteredComputerCameraMovementModes() else v346:GetRegisteredTouchCameraMovementModes()
			end

			t11 = {}
			t12 = {}

			if #t13 <= 0 then
				setCameraModeVisible(false)

				return
			end

			for i = 1, #t13 do
				local v737 = t13[i]
				local Name = v737.Name

				if Name == "Default" then
					Name = if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then t4.DEFAULT_CLASSIC else t4.DEFAULT_FOLLOW
				end

				t11[#t11 + 1] = Name
				t12[Name] = v737.Value
			end

			if v159.CameraMode then
				v159.CameraMode:UpdateOptions(t11)
			end

			local v739 = UserInputService.PreferredInput == Enum.PreferredInput.Touch
			local v740 = if not v739 then GameSettings.ComputerCameraMovementMode.Value else GameSettings.TouchCameraMovementMode.Value

			if v740 > -1 then
				if v739 or GameSettings.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
					v740 += 1
				end

				updateCurrentCameraMovementIndex(v740)
				v159.CameraMode:SetSelectionIndex(v740)
			end

			setCameraModeVisible(cameraModeIsUserChoice())
		end

		local v351 = v159
		local v352 = v159
		local v353 = v159
		local v354, v355, v356 = Utility:AddNewRow(v159, "Camera Mode", "Selector", t11, 1)

		v351.CameraModeFrame = v354
		v352.CameraModeLabel = v355
		v353.CameraMode = v356
		v159.CameraModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraModeFrame
		t10[v159.CameraMode] = true
		v159.CameraModeOverrideText = Create("TextLabel")({
			Name = "CameraDevOverrideLabel",
			Text = "Set by Developer",
			TextColor3 = Color3.new(1, 1, 1),
			Font = Theme.font(Enum.Font.SourceSans, "GameSettings"),
			FontSize = Theme.fontSize(Enum.FontSize.Size24, "GameSettings"),
			BackgroundTransparency = 1,
			Size = UDim2.new(0.6, 0, 1, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			Visible = false,
			ZIndex = 2,
			Parent = v159.CameraModeFrame
		})

		if v346 then
			v346.TouchCameraMovementModeRegistered:connect(function(__) -- line: 1404
				-- upvalues: UserInputService (copy), updateCameraMovementModes (copy)
				if UserInputService.TouchEnabled then
					updateCameraMovementModes()
				end
			end)
			v346.ComputerCameraMovementModeRegistered:connect(function(__) -- line: 1410
				-- upvalues: UserInputService (copy), updateCameraMovementModes (copy)
				if UserInputService.MouseEnabled then
					updateCameraMovementModes()
				end
			end)
		end

		UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- line: 1417
			-- upvalues: updateCameraMovementModes (copy)
			updateCameraMovementModes()
		end)

		local u357 = false

		v159.CameraMode.IndexChanged:connect(function(p15) -- line: 1422
			-- upvalues: updateCurrentCameraMovementIndex (copy), u357 (ref), reportSettingsForAnalytics (copy)
			if updateCurrentCameraMovementIndex(p15) then
				if u357 then
					reportSettingsForAnalytics()
				end

				u357 = true
			end
		end)
		updateCameraMovementModes()

		local u358 = false

		local function createVROption() -- line: 1438
			-- upvalues: u358 (ref), GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy)
			if not u358 then
				u358 = true

				local u744 = if not GameSettings.VREnabled then {
					"On (restart pending)",
					"Off"
				} else {
					"On",
					"Off (restart pending)"
				}
				local v745 = v159
				local v746 = v159
				local v747 = v159
				local v748, v749, v750 = Utility:AddNewRow(v159, "VR", "Selector", u744, not GameSettings.VREnabled and 2 or 1)

				v745.VREnabledFrame = v748
				v746.VREnabledLabel = v749
				v747.VREnabledSelector = v750
				v159.VREnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VREnabledFrame
				v159.VREnabledSelector.IndexChanged:connect(function(p16) -- line: 1453
					-- upvalues: GameSettings (copy), u744 (ref), reportSettingsChangeForAnalytics (copy)
					local t14 = {
						On = {
							Name = "On",
							Value = 1
						},
						Off = {
							Name = "Off",
							Value = 2
						}
					}
					local v965 = p16 == t14.On.Value

					if v965 ~= GameSettings.VREnabled then
						GameSettings.VREnabled = v965

						local v966 = u744[t14.On.Value]
						local v967 = u744[p16]

						if v967 == u744[t14.On.Value] then
							v966 = u744[t14.Off.Value]
						end

						reportSettingsChangeForAnalytics("vr_mode", v966, v967)
					end
				end)
			end
		end

		if GetFFlagAlwaysShowVRToggle() and getAppFeaturePolicies().getIsLinkedVRModeAvailable() then
			createVROption()
		else
			if VRService.VREnabled then
				GameSettings.HasEverUsedVR = true
				createVROption()
			elseif GameSettings.HasEverUsedVR then
				createVROption()
			end

			VRService:GetPropertyChangedSignal("VREnabled"):connect(function() --[[ onVREnabledChanged ]] -- line: 1472
				-- upvalues: VRService (copy), GameSettings (copy), createVROption (copy)
				if VRService.VREnabled then
					GameSettings.HasEverUsedVR = true
					createVROption()

					return
				end

				if GameSettings.HasEverUsedVR then
					createVROption()
				end
			end)
		end

		local t15 = {}
		local t16 = {}
		local t17 = {}
		local t18 = {}

		local function u364(__: boolean) -- line: 1497
		end

		if p9 then
			local v365 = CoreUtility.waitForChildOfClass(LocalPlayer, "PlayerScripts")
			local v366 = v159
			local v367 = v159
			local v368 = v159
			local v369, v370, v371 = Utility:AddNewRow(v159, "Movement Mode", "Selector", {}, 1)

			v366.MovementModeFrame = v369
			v367.MovementModeLabel = v370
			v368.MovementMode = v371
			v159.MovementModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MovementModeFrame
			t10[v159.MovementMode] = true
			v159.MovementModeOverrideText = Create("TextLabel")({
				Name = "MovementDevOverrideLabel",
				Text = "Set by Developer",
				TextColor3 = Color3.new(1, 1, 1),
				Font = Theme.font(Enum.Font.SourceSans, "GameSettings"),
				FontSize = Theme.fontSize(Enum.FontSize.Size24, "GameSettings"),
				BackgroundTransparency = 1,
				Size = UDim2.new(0.6, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Visible = false,
				ZIndex = 2,
				Parent = v159.MovementModeFrame
			})

			local function setMovementMode(p17) -- line: 1556
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy)
				local TouchMovementMode = nil

				if p17.EnumType == Enum.TouchMovementMode then
					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						TouchMovementMode = GameSettings.TouchMovementMode
					end

					GameSettings.TouchMovementMode = p17
				else
					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						TouchMovementMode = GameSettings.ComputerMovementMode
					end

					GameSettings.ComputerMovementMode = p17
				end

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					reportSettingsChangeForAnalytics("movement_mode", TouchMovementMode, p17)
				end
			end

			function u364(b2: boolean) -- line: 1573
				-- upvalues: LocalPlayer (copy), v159 (copy), t15 (ref)
				local v758 = if not b2 then LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice else LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice

				if v159.MovementMode then
					local v759 = v758 and #t15 > 0

					v159.MovementMode.SelectorFrame.Visible = v759
					v159.MovementMode:SetInteractable(v759)
					v159.MovementModeOverrideText.Visible = not v759
				end

				if v159.MovementModeOverrideText then
					v159.MovementModeOverrideText.Visible = not v758
				end
			end

			local function updateMovementModes() -- line: 1585
				-- upvalues: UserInputService (copy), v365 (copy), t15 (ref), t16 (ref), t17 (ref), t18 (ref), v159 (copy), RobloxTranslator (copy), Constants (copy), t6 (copy), v75 (copy), GameSettings (copy), setMovementMode (copy), u364 (ref)
				local v760 = UserInputService.PreferredInput == Enum.PreferredInput.Touch

				if v365 then
					if v760 then
						t15 = v365:GetRegisteredTouchMovementModes()
					else
						t15 = v365:GetRegisteredComputerMovementModes()
					end
				end

				t16 = {}
				t17 = {}
				t18 = {}

				if #t15 <= 0 then
					if v159.MovementMode then
						v159.MovementMode.SelectorFrame.Visible = false
						v159.MovementMode:SetInteractable(false)
						v159.MovementModeOverrideText.Visible = true
					end

					return
				end

				if v159.MovementMode then
					local v761 = #t15 > 0

					v159.MovementMode.SelectorFrame.Visible = v761
					v159.MovementMode:SetInteractable(v761)
					v159.MovementModeOverrideText.Visible = not v761
				end

				for v762, v763 in t15 do
					t17[v762] = v763

					local v764 = t18
					local Name = v763.Name

					if Name == "Default" then
						Name = if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then t6.DEFAULT_KEYBOARD else RobloxTranslator:FormatByKey(Constants.MovementModeDynamicThumbstickKey)
					elseif Name == "KeyboardMouse" then
						Name = "Keyboard + Mouse"
					elseif Name == "ClickToMove" then
						Name = if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then t6.CLICK_TO_MOVE else t6.TAP_TO_MOVE
					elseif Name == "DynamicThumbstick" then
						Name = "Dynamic Thumbstick"
					elseif Name == "Thumbstick" then
						Name = v75
					end

					v764[v762] = Name
					t16[v763] = v762
				end

				if v159.MovementMode then
					v159.MovementMode:UpdateOptions(t18)
				end

				local v766 = if not v760 then GameSettings.ComputerMovementMode else GameSettings.TouchMovementMode

				if v766 then
					setMovementMode(v766)
					v159.MovementMode:SetSelectionIndex(t16[v766])
				end

				u364(v760)
			end

			updateMovementModes()

			if v365 then
				v365.TouchMovementModeRegistered:connect(function(__) -- line: 1629
					-- upvalues: UserInputService (copy), updateMovementModes (copy)
					if UserInputService.TouchEnabled then
						updateMovementModes()
					end
				end)
				v365.ComputerMovementModeRegistered:connect(function(__) -- line: 1635
					-- upvalues: UserInputService (copy), updateMovementModes (copy)
					if UserInputService.MouseEnabled then
						updateMovementModes()
					end
				end)
			end

			UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- line: 1642
				-- upvalues: updateMovementModes (copy)
				updateMovementModes()
			end)
			v159.MovementMode.IndexChanged:connect(function(p20) -- line: 1646
				-- upvalues: setMovementMode (copy), t17 (ref), reportSettingsForAnalytics (copy)
				setMovementMode(t17[p20])
				reportSettingsForAnalytics()
			end)
		end

		local v374 = UserInputService.PreferredInput == Enum.PreferredInput.Touch

		if not if not v374 then LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice else LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
			v159.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		else
			v159.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		end

		local v375 = if not v374 then LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice else LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice

		if v159.MovementModeOverrideText then
			if not v375 then
				v159.MovementModeOverrideText.Visible = true

				if v159.MovementMode then
					v159.MovementMode.SelectorFrame.Visible = false
					v159.MovementMode:SetInteractable(false)
					v159.MovementModeOverrideText.Visible = true
				end
			else
				v159.MovementModeOverrideText.Visible = false

				if v159.MovementMode then
					local v376 = #t15 > 0

					v159.MovementMode.SelectorFrame.Visible = v376
					v159.MovementMode:SetInteractable(v376)
					v159.MovementModeOverrideText.Visible = not v376
				end
			end
		end

		local v377 = not LocalPlayer.DevEnableMouseLock

		if v159.ShiftLockOverrideText then
			v159.ShiftLockOverrideText.Visible = v377

			local v378 = not v377 and LocalPlayer.DevEnableMouseLock

			if v159.ShiftLockMode then
				v159.ShiftLockMode.SelectorFrame.Visible = v378
				v159.ShiftLockMode:SetInteractable(v378)
			end
		end

		local function updateUserSettingsMenu(p21) -- line: 1692
			-- upvalues: LocalPlayer (copy), v159 (copy), u364 (ref), t15 (ref)
			if p21 == "DevEnableMouseLock" then
				local v771 = not LocalPlayer.DevEnableMouseLock

				if v159.ShiftLockOverrideText then
					v159.ShiftLockOverrideText.Visible = v771

					local v772 = not v771 and LocalPlayer.DevEnableMouseLock

					if v159.ShiftLockMode then
						v159.ShiftLockMode.SelectorFrame.Visible = v772
						v159.ShiftLockMode:SetInteractable(v772)

						return
					end
				end
			else
				if p21 == "DevComputerCameraMode" then
					local v773 = LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice

					setCameraModeVisible(v773)
					v159.CameraModeOverrideText.Visible = not v773

					return
				end

				if p21 == "DevComputerMovementMode" then
					if u364 ~= nil then
						u364(false)

						return
					end

					local v774 = LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice

					if v159.MovementMode then
						local v775 = v774 and #t15 > 0

						v159.MovementMode.SelectorFrame.Visible = v775
						v159.MovementMode:SetInteractable(v775)
						v159.MovementModeOverrideText.Visible = not v775
					end

					if v159.MovementModeOverrideText then
						v159.MovementModeOverrideText.Visible = not v774

						return
					end
				elseif p21 == "DevTouchMovementMode" then
					if u364 ~= nil then
						u364(true)

						return
					end

					local v776 = LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice

					if v159.MovementMode then
						local v777 = v776 and #t15 > 0

						v159.MovementMode.SelectorFrame.Visible = v777
						v159.MovementMode:SetInteractable(v777)
						v159.MovementModeOverrideText.Visible = not v777
					end

					if v159.MovementModeOverrideText then
						v159.MovementModeOverrideText.Visible = not v776

						return
					end
				elseif p21 == "DevTouchCameraMode" then
					local v778 = LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice

					setCameraModeVisible(v778)
					v159.CameraModeOverrideText.Visible = not v778
				end
			end
		end

		LocalPlayer.Changed:connect(function(p22) -- line: 1727
			-- upvalues: t3 (copy), updateUserSettingsMenu (copy), t2 (copy)
			if t3[p22] then
				updateUserSettingsMenu(p22)
			end

			if t2[p22] then
				updateUserSettingsMenu(p22)
			end
		end)
	end
	local function createFeedbackModeOptions() -- line: 1740
		-- upvalues: Url (copy), HttpService (copy), v128 (copy), v159 (copy), SafetyService (copy), ExperienceStateCaptureService (ref), reportSettingsChangeForAnalytics (copy), v127 (copy), Utility (copy), v77 (copy), RobloxTranslator (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), v122 (copy), v111 (copy)
		local v380 = Url.ROLES_URL .. "v1/users/authenticated/roles"
		local v381 = HttpService:RequestInternal({
			Url = v380,
			Method = "GET"
		})

		local function rolesCheckCallback(p23) -- line: 1747
			-- upvalues: v128 (copy), v159 (copy), SafetyService (copy), ExperienceStateCaptureService (ref), reportSettingsChangeForAnalytics (copy), v127 (copy), Utility (copy), v77 (copy), RobloxTranslator (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			if p23 then
				if not v128 and game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not v159.FeedbackEntryPointEnabled then
					return
				end

				local function onToggleFeedbackMode() -- line: 1759
					-- upvalues: v128 (copy), v159 (copy), SafetyService (copy), ExperienceStateCaptureService (ref), reportSettingsChangeForAnalytics (copy)
					if v128 and (game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not v159.FeedbackEntryPointEnabled) then
						return
					end

					v159.HubRef:PopMenu(false, true)

					if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
						SafetyService.IsCaptureModeForReport = false
					end

					if ExperienceStateCaptureService ~= nil then
						ExperienceStateCaptureService:ToggleCaptureMode()
					end

					reportSettingsChangeForAnalytics("translation_feedback", "", "pressed")
				end

				local v782, v783

				if v127 then
					v782, v783 = Utility:MakeStyledButton("toggleFeedbackModeButton", v77, UDim2.new(1, 0, 1, -20), onToggleFeedbackMode, v159)
					v782.Size = UDim2.new(0.6, 0, 0, 40)
					v782.Position = UDim2.new(0.4, 0, 0.5, 0)
					v782.AnchorPoint = Vector2.new(0, 0.5)
				else
					v782, v783 = Utility:MakeStyledButton("toggleFeedbackModeButton", v77, UDim2.new(0, 300, 1, -20), onToggleFeedbackMode, v159)
					v782.Size = UDim2.new(0, 300, 0, 30)
					v782.Position = UDim2.new(0.4, 0, 0.5, 0)
					v782.AnchorPoint = Vector2.new(0, 0.5)
				end

				v782.ZIndex = 2
				v782.Selectable = true
				v783.ZIndex = 2

				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					v159.toggleFeedbackModeButton = v782
					v159.toggleFeedbackModeText = v783
				end

				if v127 then
					Utility:AddNewRowObject(v159, RobloxTranslator:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v782, nil, true).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton

					return
				end

				Utility:AddNewRowObject(v159, RobloxTranslator:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v782).LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FeedbackModeButton
			end
		end

		if v122 then
			rolesCheckCallback(true)

			return
		end

		v381:Start(function(p24, p25) -- line: 1843
			-- upvalues: HttpService (copy), v111 (copy), v380 (copy), rolesCheckCallback (copy)
			local u786 = false
			local v787 = false
			local s1

			if not p24 then
				s1 = "Roles Api Request: Connection error"
			elseif p25.StatusCode == 401 then
				s1 = "Roles Api Request: Unauthorized"
			elseif p25.StatusCode < 200 or p25.StatusCode >= 400 then
				s1 = "Roles Api Status code: " .. p25.StatusCode
			else
				v787, s1 = pcall(function() -- line: 1855
					-- upvalues: HttpService (copy), p25 (copy), u786 (ref)
					local data = HttpService:JSONDecode(p25.Body)

					for __, v in pairs(data.roles) do
						if v == "Soothsayer" then
							u786 = true
						end
					end
				end)
			end

			if not v787 then
				v111:warning("Feedback Mode initialization api call failed with url: " .. v380 .. " and with error message: " .. s1)
			end

			rolesCheckCallback(u786)
		end)
	end
	local function createTranslationOptions() -- line: 1883
		-- upvalues: Players (copy), Url (copy), HttpService (copy), v111 (copy), v159 (copy), Utility (copy), RobloxTranslator (copy), v76 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), LocalPlayer (copy), reportSettingsChangeForAnalytics (copy), RunService (copy)
		local n3 = 1
		local n4 = 1
		local u385 = false
		local languageCode = nil
		local localeCode = nil
		local LocaleId = Players.LocalPlayer.LocaleId
		local languageCode2 = nil
		local u390 = nil
		local t19 = {}
		local t20 = {}
		local t21 = {}
		local t22 = {}
		local t23 = {}
		local v396 = Url.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", Players.LocalPlayer.LocaleId:gsub("-", "_"))
		local v397 = HttpService:RequestInternal({
			Url = v396,
			Method = "GET"
		})
		local v398 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local v399 = HttpService:RequestInternal({
			Url = v398,
			Method = "GET"
		})
		local v400 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local v401 = HttpService:RequestInternal({
			Url = v400,
			Method = "GET"
		})
		local v402 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local v403 = HttpService:RequestInternal({
			Url = v402,
			Method = "GET"
		})

		local function userExperienceLanguageSettingsCallback(p26, p27) -- line: 1948
			-- upvalues: v111 (copy), v159 (copy), Utility (copy), RobloxTranslator (copy), v76 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t23 (copy), t21 (copy), languageCode (ref), t19 (copy), u390 (ref), t20 (copy), n3 (ref), n4 (ref), LocalPlayer (copy), localeCode (ref), reportSettingsChangeForAnalytics (copy), Url (copy), HttpService (copy), u385 (ref), RunService (copy)
			if not p26 then
				if p27 == nil then
					p27 = "Execution path did not set earliest error to non-nil value."
				end

				v111:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. p27)

				local v791 = v159
				local v792 = v159
				local v793 = v159
				local v794, v795, v796 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { v76 }, 1)

				v791.LanguageSelectorFrame = v794
				v792.LanguageSelectorLabel = v795
				v793.LanguageSelectorMode = v796
				v159.LanguageSelectorMode:SetInteractable(false)
				v159.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame

				return
			end

			local v797 = false

			table.insert(t23, t21[languageCode].languageName .. " (Original)")

			for __, v in pairs(t19) do
				if v == u390 then
					v797 = true
				end

				if v ~= languageCode then
					table.insert(t23, t21[v].languageName)
				end
			end

			if v797 == true then
				for k, v in pairs(t23) do
					if k ~= 1 and t20[v] == u390 then
						n3 = k
						n4 = k
					end
				end
			end

			local v802 = v159
			local v803 = v159
			local v804 = v159
			local v805, v806, v807 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", t23, n3)

			v802.LanguageSelectorFrame = v805
			v803.LanguageSelectorLabel = v806
			v804.LanguageSelectorMode = v807
			v159.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame

			if n3 == 1 then
				LocalPlayer:SetExperienceSettingsLocaleId(localeCode)
			else
				local v808 = t20[t23[n3]]

				LocalPlayer:SetExperienceSettingsLocaleId(t21[v808].localeCode)
			end

			v159.LanguageSelectorMode.CurrentLanguage = v159.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
			v159.LanguageSelectorMode.IndexChanged:connect(function(p28) --[[ toggleTranslation ]] -- line: 2028
				-- upvalues: v159 (copy), t21 (copy), languageCode (ref), t20 (copy), t23 (copy), reportSettingsChangeForAnalytics (copy), Url (copy), HttpService (copy), n4 (ref), LocalPlayer (copy), localeCode (ref), v111 (copy), u385 (ref), RunService (copy)
				v159.LanguageSelectorMode:SetInteractable(false)

				local v972 = if p28 ~= 1 then t21[t20[t23[p28]]].id else t21[languageCode].id
				local CurrentLanguage = v159.LanguageSelectorMode.CurrentLanguage
				local v974 = t23[p28]

				if CurrentLanguage ~= v974 then
					v159.LanguageSelectorMode.CurrentLanguage = v974
					reportSettingsChangeForAnalytics("experience_language", CurrentLanguage, v974)
				end

				local t24 = {
					settingValue = {
						settingType = "LanguageFamily",
						settingTargetId = v972
					}
				}
				local v976 = Url.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
				local v977 = HttpService:RequestInternal({
					Url = v976,
					Method = "POST",
					Headers = {
						["Content-Type"] = "application/json"
					},
					Body = HttpService:JSONEncode(t24)
				})

				local function callback(p29, p30) -- line: 2075
					-- upvalues: n4 (ref), p28 (copy), LocalPlayer (copy), localeCode (ref), t20 (copy), t23 (copy), t21 (copy), v111 (copy), u385 (ref), v159 (copy)
					if p29 then
						n4 = p28

						if p28 == 1 then
							LocalPlayer:SetExperienceSettingsLocaleId(localeCode)
						else
							local v1046 = t20[t23[p28]]

							LocalPlayer:SetExperienceSettingsLocaleId(t21[v1046].localeCode)
						end
					else
						v111:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p30)
						u385 = true
						v159.LanguageSelectorMode:SetSelectionIndex(n4)
					end

					v159.LanguageSelectorMode:SetInteractable(true)
				end

				if RunService:IsStudio() then
					n4 = p28

					if p28 == 1 then
						LocalPlayer:SetExperienceSettingsLocaleId(localeCode)
					else
						local v979 = t20[t23[p28]]

						LocalPlayer:SetExperienceSettingsLocaleId(t21[v979].localeCode)
					end

					v159.LanguageSelectorMode:SetInteractable(true)

					return
				end

				if u385 then
					u385 = false
					n4 = p28

					if p28 == 1 then
						LocalPlayer:SetExperienceSettingsLocaleId(localeCode)
					else
						local v980 = t20[t23[p28]]

						LocalPlayer:SetExperienceSettingsLocaleId(t21[v980].localeCode)
					end

					v159.LanguageSelectorMode:SetInteractable(true)

					return
				end

				v977:Start(function(p31, p32) -- line: 2118
					-- upvalues: v111 (copy), v976 (copy), callback (copy)
					local v1049 = false
					local s2 = nil

					if not p31 then
						s2 = "User Experience Language Settings Update Request: Connection error"
					elseif p32.StatusCode == 401 then
						s2 = "User Experience Language Settings Update Request: Unauthorized"
					elseif p32.StatusCode < 200 or p32.StatusCode >= 400 then
						s2 = "User Experience Language Settings Update Request Status Code: " .. p32.StatusCode
					else
						v111:info("User Experience Language Settings Update Request succeeded with code: " .. p32.StatusCode)
						v1049 = true
					end

					if not v1049 then
						v111:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v976 .. " with error message: " .. s2)
					end

					callback(v1049, s2)
				end)
			end)
		end

		v397:Start(function(p33, p34) -- line: 2300
			-- upvalues: HttpService (copy), t21 (copy), t22 (copy), t20 (copy), LocaleId (copy), languageCode2 (ref), v111 (copy), v396 (copy), v399 (copy), languageCode (ref), localeCode (ref), v398 (copy), v401 (copy), t19 (copy), v400 (copy), v403 (copy), u390 (ref), v402 (copy), userExperienceLanguageSettingsCallback (copy), v159 (copy), Utility (copy), RobloxTranslator (copy), v76 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local v839 = false
			local s3

			if not p33 then
				s3 = "Locale Code to Language Code Mapping Request: Connection error"
			elseif p34.StatusCode == 401 then
				s3 = "Locale Code to Language Code Mapping Request: Unauthorized"
			elseif p34.StatusCode < 200 or p34.StatusCode >= 400 then
				s3 = "Locale Code to Language Code Mapping Request Status code: " .. p34.StatusCode
			else
				v839, s3 = pcall(function() -- line: 2311
					-- upvalues: HttpService (copy), p34 (copy), t21 (copy), t22 (copy), t20 (copy), LocaleId (copy), languageCode2 (ref)
					local data = HttpService:JSONDecode(p34.Body)

					for __, v in pairs(data.data) do
						local languageCode3 = v.locale.language.languageCode
						local locale = v.locale.locale
						local name = v.locale.language.name
						local id = v.locale.language.id

						t21[languageCode3] = {
							localeCode = locale,
							languageName = name,
							id = id
						}
						t22[id] = languageCode3
						t20[name] = languageCode3

						if v.locale.locale == LocaleId:gsub("-", "_") then
							languageCode2 = v.locale.language.languageCode
						end
					end
				end)
			end

			if not v839 then
				v111:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v396 .. " with error message: " .. s3)
			end

			local v841 = v839
			local u842 = s3

			if v841 then
				v399:Start(function(p35, p36) -- line: 2258
					-- upvalues: HttpService (copy), languageCode (ref), localeCode (ref), t21 (copy), v111 (copy), v398 (copy), u842 (ref), v841 (copy), v401 (copy), t19 (copy), v400 (copy), v403 (copy), u390 (ref), languageCode2 (ref), t22 (copy), v402 (copy), userExperienceLanguageSettingsCallback (copy), v159 (copy), Utility (copy), RobloxTranslator (copy), v76 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
					local v1019 = false
					local s4

					if not p35 then
						s4 = "Experience Source Language Request: Connection error"
					elseif p36.StatusCode == 401 then
						s4 = "Experience Source Language Request: Unauthorized"
					elseif p36.StatusCode < 200 or p36.StatusCode >= 400 then
						s4 = "Experience Source Language Status code: " .. p36.StatusCode
					else
						v1019, s4 = pcall(function() -- line: 2269
							-- upvalues: HttpService (copy), p36 (copy), languageCode (ref), localeCode (ref), t21 (copy)
							languageCode = HttpService:JSONDecode(p36.Body).languageCode
							localeCode = t21[languageCode].localeCode
						end)
					end

					if not v1019 then
						v111:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v398 .. " with error message: " .. s4)
					end

					if u842 == nil then
						u842 = s4
					end

					local v1021 = v1019 and v841
					local u1022 = u842

					if v1021 then
						v401:Start(function(p37, p38) -- line: 2217
							-- upvalues: HttpService (copy), t19 (copy), v111 (copy), v400 (copy), u1022 (ref), v1021 (copy), v403 (copy), u390 (ref), languageCode2 (ref), languageCode (ref), t22 (copy), v402 (copy), userExperienceLanguageSettingsCallback (copy), v159 (copy), Utility (copy), RobloxTranslator (copy), v76 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
							local v1073 = false
							local s5

							if not p37 then
								s5 = "Experience Supported Language Request: Connection error"
							elseif p38.StatusCode == 401 then
								s5 = "Experience Supported Language Request: Unauthorized"
							elseif p38.StatusCode < 200 or p38.StatusCode >= 400 then
								s5 = "Experience Supported Language Request Status code: " .. p38.StatusCode
							else
								v1073, s5 = pcall(function() -- line: 2227
									-- upvalues: HttpService (copy), p38 (copy), t19 (copy)
									local data = HttpService:JSONDecode(p38.Body)

									for k, v in pairs(data.data) do
										t19[k] = v.languageCode
									end
								end)
							end

							if not v1073 then
								v111:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v400 .. " with error message: " .. s5)
							end

							if u1022 == nil then
								u1022 = s5
							end

							local v1075 = v1073 and v1021
							local v1076 = u1022

							if v1075 then
								v403:Start(function(p39, p40) -- line: 2155
									-- upvalues: HttpService (copy), u390 (ref), languageCode2 (ref), languageCode (ref), t22 (copy), v111 (copy), v402 (copy), userExperienceLanguageSettingsCallback (copy)
									local v1096 = false
									local s6

									if not p39 then
										s6 = "User Experience Language Setting Request: Connection error"
									elseif p40.StatusCode == 401 then
										s6 = "User Experience Language Setting Request: Unauthorized"
									elseif p40.StatusCode < 200 or p40.StatusCode >= 400 then
										s6 = "User Experience Language Setting Request Status code: " .. p40.StatusCode
									else
										v1096, s6 = pcall(function() -- line: 2166
											-- upvalues: HttpService (copy), p40 (copy), u390 (ref), languageCode2 (ref), languageCode (ref), t22 (copy)
											local userUniverseLocalizationSettingValue = HttpService:JSONDecode(p40.Body).userUniverseLocalizationSettingValue

											if userUniverseLocalizationSettingValue == nil then
												u390 = languageCode2

												return
											end

											if userUniverseLocalizationSettingValue.settingType == "SourceOrTranslation" then
												if userUniverseLocalizationSettingValue.settingTargetId == 1 then
													u390 = languageCode
												else
													u390 = languageCode2
												end
											end

											if userUniverseLocalizationSettingValue.settingType == "LanguageFamily" then
												if t22[userUniverseLocalizationSettingValue.settingTargetId] == nil then
													u390 = languageCode2

													return
												end

												u390 = t22[userUniverseLocalizationSettingValue.settingTargetId]
											end
										end)
									end

									if not v1096 then
										v111:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v402 .. " with error message: " .. s6)
									end

									userExperienceLanguageSettingsCallback(v1096, s6)
								end)

								return
							end

							if v1076 == nil then
								v1076 = "Execution path did not set earliest error to non-nil value."
							end

							v111:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v1076)

							local v1077 = v159
							local v1078 = v159
							local v1079 = v159
							local v1080, v1081, v1082 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { v76 }, 1)

							v1077.LanguageSelectorFrame = v1080
							v1078.LanguageSelectorLabel = v1081
							v1079.LanguageSelectorMode = v1082
							v159.LanguageSelectorMode:SetInteractable(false)
							v159.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
						end)
					else
						local v1023 = u1022

						if v1023 == nil then
							v1023 = "Execution path did not set earliest error to non-nil value."
						end

						v111:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v1023)

						local v1024 = v159
						local v1025 = v159
						local v1026 = v159
						local v1027, v1028, v1029 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { v76 }, 1)

						v1024.LanguageSelectorFrame = v1027
						v1025.LanguageSelectorLabel = v1028
						v1026.LanguageSelectorMode = v1029
						v159.LanguageSelectorMode:SetInteractable(false)
						v159.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
					end
				end)
			else
				local v843 = u842

				if v843 == nil then
					v843 = "Execution path did not set earliest error to non-nil value."
				end

				v111:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v843)

				local v844 = v159
				local v845 = v159
				local v846 = v159
				local v847, v848, v849 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", { v76 }, 1)

				v844.LanguageSelectorFrame = v847
				v845.LanguageSelectorLabel = v848
				v846.LanguageSelectorMode = v849
				v159.LanguageSelectorMode:SetInteractable(false)
				v159.LanguageSelectorFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageSelectorFrame
			end
		end)
	end
	local function getChatTranslationLayerData(p41) -- line: 2350
		-- upvalues: GetFFlagChatTranslationWaitForIXP (copy), IXPServiceWrapper (copy), GetFFlagChatTranslationNewDefaults (copy)
		local t25 = {
			ChatTranslationEnabled = false,
			ChatTranslationToggleEnabled = false
		}

		if not p41 or p41 == "" then
			return t25
		end

		if p41 == "override" then
			t25.ChatTranslationEnabled = true

			return t25
		end

		if GetFFlagChatTranslationWaitForIXP() then
			IXPServiceWrapper:WaitForInitialization()
		end

		local ok, result = pcall(function() -- line: 2372
			-- upvalues: IXPServiceWrapper (copy), p41 (copy)
			return IXPServiceWrapper:GetLayerData(p41)
		end)

		if ok then
			if GetFFlagChatTranslationNewDefaults() then
				t25.ChatTranslationEnabled = result.ChatTranslationEnabled or true
				t25.ChatTranslationToggleEnabled = result.ChatTranslationToggleEnabled or false

				return t25
			end

			t25.ChatTranslationEnabled = result.chatTranslationEnabled or false
			t25.ChatTranslationToggleEnabled = result.chatTranslationToggleEnabled or false
		end

		return t25
	end
	local function createCameraInvertedOptions() -- line: 2477
		-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t10 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local n5 = 1

		if pcall(function() -- line: 2479
			-- upvalues: GameSettings (copy), n5 (ref)
			if GameSettings.CameraYInverted == true then
				n5 = 2
			end
		end) == false then
			return
		end

		local v432 = v159
		local v433 = v159
		local v434, v435, v436 = Utility:AddNewRow(v159, "Camera Inverted", "Selector", {
			"Off",
			"On"
		}, n5)

		v432.CameraInvertedFrame = v434
		_ = v435
		v433.CameraInvertedSelector = v436
		v159.CameraInvertedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraInvertedFrame
		t10[v159.CameraInvertedFrame] = true
		v159.CameraInvertedSelector.IndexChanged:connect(function(p42) -- line: 2494
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local CameraYInverted = nil

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				CameraYInverted = GameSettings.CameraYInverted
			end

			if p42 == 2 then
				GameSettings.CameraYInverted = true
			else
				GameSettings.CameraYInverted = false
			end

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("camera_y_inverted", CameraYInverted, GameSettings.CameraYInverted)
			end

			reportSettingsForAnalytics()
		end)
	end
	local function setCameraSensitivity(p43) -- line: 2513
		-- upvalues: UserInputService (copy), GameSettings (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local s7 = nil
		local GamepadCameraSensitivity = nil

		if UserInputService.GamepadEnabled and GameSettings.IsUsingGamepadCameraSensitivity then
			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				s7 = "gamepad"
				GamepadCameraSensitivity = GameSettings.GamepadCameraSensitivity
			end

			GameSettings.GamepadCameraSensitivity = p43
		end

		if UserInputService.MouseEnabled then
			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				s7 = "mouse"
				GamepadCameraSensitivity = GameSettings.MouseSensitivityFirstPerson.X
			end

			local vector2 = Vector2.new(p43, p43)

			GameSettings.MouseSensitivityFirstPerson = vector2
			GameSettings.MouseSensitivityThirdPerson = vector2
		end

		if GetFFlagEnableExplicitSettingsChangeAnalytics() and typeof(GamepadCameraSensitivity) == "number" and typeof(p43) == "number" then
			reportSettingsChangeForAnalytics("camera_sensitivity", tonumber(string.format("%.2f", GamepadCameraSensitivity)), tonumber(string.format("%.2f", p43)), {
				sensitivity_type = s7
			})
		end

		reportSettingsForAnalytics()
	end
	local function createGamepadOptions() -- line: 2697
		-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), setCameraSensitivity (copy)
		local GamepadCameraSensitivity = GameSettings.GamepadCameraSensitivity
		local v457 = GamepadCameraSensitivity <= 1 and math.floor((GamepadCameraSensitivity - 0.2) / 0.16 + 0.5) or math.floor((GamepadCameraSensitivity + 2) / 0.6 + 0.5)
		local v458 = if not (GamepadCameraSensitivity <= 0.2) then v457 else 0
		local v459 = v159
		local v460 = v159
		local v461 = v159
		local v462, v463, v464 = Utility:AddNewRow(v159, "Camera Sensitivity", "Slider", 10, v458)

		v459.GamepadSensitivityFrame = v462
		v460.GamepadSensitivityLabel = v463
		v461.GamepadSensitivitySlider = v464
		v159.GamepadSensitivityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GamepadSensitivityFrame
		v159.GamepadSensitivitySlider.ValueChanged:connect(function(p44) -- line: 2724
			-- upvalues: setCameraSensitivity (copy)
			local v881 = setCameraSensitivity
			local v882 = p44 <= 5 and 0.16 * p44 + 0.2 or 0.6 * p44 - 2

			v881(if not (v882 <= 0.2) then v882 else 0.2)
		end)
	end
	local function createUiToggleOptions() -- line: 2860
		-- upvalues: v124 (copy), v123 (copy), RobloxTranslator (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GuiService (copy), LocalPlayer (copy)
		if v124 or v123 then
			local t26 = {
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
			}
			local v471 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.On")
			local v472 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.Off")

			v159.uiToggleSelectors = {}

			for __, v474 in t26 do
				local v475 = RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
					GuiType = v474.label
				})
				local v476, v477, v478 = Utility:AddNewRow(v159, v475, "Selector", {
					v471,
					v472
				}, 1)

				v476.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER[v474.layoutOrderKey]
				v478.IndexChanged:Connect(function(p45) -- line: 2888
					-- upvalues: GuiService (copy), v474 (copy)
					if p45 ~= (not GuiService:GetGuiIsVisible(v474.type) and 2 or 1) then
						GuiService:ToggleGuiIsVisibleIfAllowed(v474.type)
					end
				end)
				v159.uiToggleSelectors[v474.label] = {
					label = v475,
					type = v474.type,
					row = v476,
					frame = v477,
					selector = v478
				}
			end

			local v479 = RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam")
			local v480 = v159
			local v481 = v159
			local v482 = v159
			local v483, v484, v485 = Utility:AddNewRow(v159, v479, "Selector", {
				v472,
				v471
			}, 1)

			v480.freecamRow = v483
			v481.freecamFrame = v484
			v482.freecamSelector = v485
			v159.freecamRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FreecamToggleRow
			v159.freecamSelector.IndexChanged:Connect(function(p46) -- line: 2910
				-- upvalues: LocalPlayer (copy)
				local v901 = p46 == 2
				local FreecamScript = LocalPlayer:FindFirstChild("FreecamScript", true)

				if not FreecamScript then
					warn("Freecam not present")

					return
				end

				FreecamScript:SetAttribute("FreecamEnabled", v901)
			end)

			return
		end

		local v486 = v159
		local v487 = v159
		local v488 = v159
		local v489, v490, v491 = Utility:AddNewRow(v159, "BillboardGui Visibility", "Selector", {
			"All visible",
			"Hide nameplates/bubble chat"
		}, 1)

		v486.uiToggleRow = v489
		v487.uiToggleFrame = v490
		v488.uiToggleSelector = v491
		v159.uiToggleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiToggleRow
		v159.uiToggleSelector.IndexChanged:connect(function(__) -- line: 2929
			-- upvalues: GuiService (copy)
			GuiService:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates)
		end)
	end
	local function updateUiToggleSelection() -- line: 2935
		-- upvalues: v124 (copy), v123 (copy), v159 (copy), GuiService (copy), LocalPlayer (copy)
		if v124 or v123 then
			if not v159.uiToggleSelectors then
				return
			end

			for __, v493 in v159.uiToggleSelectors do
				local v494 = not GuiService:GetGuiIsVisible(v493.type) and 2 or 1

				if v494 ~= v493.selector:GetSelectedIndex() then
					v493.selector:SetSelectionIndex(v494)
				end
			end

			local FreecamScript = LocalPlayer:FindFirstChild("FreecamScript", true)

			if FreecamScript then
				local v496 = not FreecamScript:GetAttribute("FreecamEnabled") and 1 or 2

				v159.freecamSelector:SetSelectionIndex(v496)

				return
			end
		else
			if not v159.uiToggleSelector then
				return
			end

			local v497 = not GuiService:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 2 or 1

			if v497 == v159.uiToggleSelector:GetSelectedIndex() then
				return
			end

			v159.uiToggleSelector:SetSelectionIndex(v497)
		end
	end
	local function setVCSOutput(p48) -- line: 2987
		-- upvalues: GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), v111 (copy), u18 (ref), GetFFlagVoiceChatUILogging (copy)
		if GetFFlagVoiceChatClientRewriteDisableVCSDevice() then
			v111:error("setVCSOutput is deprecated")

			return
		end

		local ok, result, v504, v505 = pcall(function() -- line: 2993
			-- upvalues: u18 (ref)
			return u18:GetSpeakerDevices()
		end)

		if ok and (result and (v504 and (v505 and (#result > 0 and (v505 > 0 and (v505 <= #result and #result == #v504)))))) then
			local n6 = 0

			for i, v in ipairs(result) do
				if v == p48 then
					n6 = i
				end
			end

			if n6 > 0 then
				if GetFFlagVoiceChatUILogging() then
					v111:debug("[OutputDeviceSelection] Setting VCS Speaker Device To {} {} ", result[n6], v504[n6])
				end

				u18:SetSpeakerDevice(result[n6], v504[n6])

				return
			end

			if GetFFlagVoiceChatUILogging() then
				v111:warning("Could not find equivalent VoiceChatService Device")

				return
			end
		elseif GetFFlagVoiceChatUILogging() then
			v111:warning("Could not connect to Voice Chat Service to change Output Device")
		end
	end
	local function syncSoundOutputs() -- line: 3028
		-- upvalues: GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), v111 (copy), SoundService (copy), setVCSOutput (copy), GetFFlagVoiceChatUILogging (copy)
		if GetFFlagVoiceChatClientRewriteDisableVCSDevice() then
			v111:error("syncSoundOutputs is deprecated")

			return
		end

		local ok, result, v511, v512 = pcall(function() -- line: 3034
			-- upvalues: SoundService (copy)
			return SoundService:GetOutputDevices()
		end)

		if ok and (result and (v511 and (v512 and (#result > 0 and (v512 > 0 and (v512 <= #result and #result == #v511)))))) then
			setVCSOutput(result[v512])

			return
		end

		if GetFFlagVoiceChatUILogging() then
			v111:warning("Could not connect to Voice Chat Service to change Output Device")
		end
	end
	local function createDeviceOptions(p49) -- line: 3054
		-- upvalues: v159 (copy), t5 (copy), RobloxTranslator (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFIntVoiceChatDeviceChangeDebounceDelay (copy), default3 (copy), SoundService (copy), v111 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), reportSettingsChangeForAnalytics (copy)
		local v516 = v159[p49 .. "DeviceIndex"] or 0
		local v517 = v159[p49 .. "DeviceNames"] or {}
		local v518 = v159[p49 .. "DeviceGuids"] or {}
		local v519 = p49 == t5.Input and RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local v520 = v159
		local v521 = p49 .. "DeviceFrame"
		local v522 = v159
		local v523 = p49 .. "DeviceSelector"
		local v524, v525, v526 = Utility:AddNewRow(v159, v519, "Selector", v517, v516)

		v520[v521] = v524
		_ = v525
		v522[v523] = v526
		v159[p49 .. "DeviceFrame"].LayoutOrder = p49 == t5.Input and SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameInput or SETTINGS_MENU_LAYOUT_ORDER.DeviceFrameOutput
		v159[p49 .. "DeviceInfo"] = {
			Name = v516 > 0 and v517[v516] or nil,
			Guid = v516 > 0 and v518[v516] or nil
		}
		v159[p49 .. "PrevDeviceName"] = v159[p49 .. "DeviceInfo"].Name

		local n7 = 0
		local v528 = GetFIntVoiceChatDeviceChangeDebounceDelay()

		v159[p49 .. "DeviceSelector"].IndexChanged:connect(function(p50) -- line: 3077
			-- upvalues: v159 (copy), p49 (copy), n7 (ref), v528 (copy), default3 (copy), SoundService (copy), v111 (copy), GetFFlagEnableCrossExpVoice (copy), t5 (copy), default4 (copy), reportSettingsChangeForAnalytics (copy)
			if v159[p49 .. "DeviceInfo"].Name == v159[p49 .. "DeviceNames"][p50] and v159[p49 .. "DeviceInfo"].Guid == v159[p49 .. "DeviceGuids"][p50] then
				return
			end

			local v905 = n7 + 1

			n7 = v905
			wait(v528)

			if v905 == n7 then
				n7 = 0
				v159[p49 .. "DeviceInfo"] = {
					Name = v159[p49 .. "DeviceNames"][p50],
					Guid = v159[p49 .. "DeviceGuids"][p50]
				}

				local Name = v159[p49 .. "DeviceInfo"].Name
				local Guid = v159[p49 .. "DeviceInfo"].Guid

				if v159.VoiceChatOptionsEnabled then
					default3:SwitchDevice(p49, Name, Guid)
				else
					SoundService:SetOutputDevice(Name, Guid)
					v111:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", Name, Guid)
				end

				if GetFFlagEnableCrossExpVoice() then
					v111:debug("[GameSettings] Changing {} device to {} {} ", p49, Name, Guid)

					if p49 == t5.Input then
						default4:changeInputDevice(Name, Guid)
					else
						default4:changeOutputDevice(Name, Guid)
					end
				end

				reportSettingsChangeForAnalytics(p49, v159[p49 .. "PrevDeviceName"], Name)
				v159[p49 .. "PrevDeviceName"] = Name
			end
		end)
	end
	local function createCameraDeviceOptions() -- line: 3186
		-- upvalues: v159 (copy), v110 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), v111 (copy), UserGameSettings (copy), reportSettingsChangeForAnalytics (copy)
		local v536 = v159.CameraDeviceIndex or 1
		local v537 = v159.CameraDeviceNames or {}
		local v538 = v159.CameraDeviceGuids or {}
		local v539 = v110
		local v540 = v159
		local v541 = v159
		local v542, v543, v544 = Utility:AddNewRow(v159, v539, "Selector", v537, v536)

		v540.CameraDeviceFrame = v542
		_ = v543
		v541.CameraDeviceSelector = v544
		v159.CameraDeviceFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.CameraDeviceFrame
		v159.CameraDeviceInfo = {
			Name = v536 > 0 and v537[v536] or nil,
			Guid = v536 > 0 and v538[v536] or nil
		}
		v159.prevCameraDeviceName = v159.CameraDeviceInfo.Name
		v159.CameraDeviceSelector.IndexChanged:connect(function(p51) -- line: 3203
			-- upvalues: v159 (copy), v111 (copy), UserGameSettings (copy), reportSettingsChangeForAnalytics (copy)
			if v159.CameraDeviceInfo.Name == v159.CameraDeviceNames[p51] and v159.CameraDeviceInfo.Guid == v159.CameraDeviceGuids[p51] then
				return
			end

			v159.CameraDeviceInfo = {
				Name = v159.CameraDeviceNames[p51],
				Guid = v159.CameraDeviceGuids[p51]
			}

			local Guid = v159.CameraDeviceInfo.Guid

			v111:info("Changed webcam to: {}", Guid)
			UserGameSettings.DefaultCameraID = Guid
			reportSettingsChangeForAnalytics("video_camera", v159.prevCameraDeviceName or "None", v159.CameraDeviceInfo.Name)
			v159.prevCameraDeviceName = v159.CameraDeviceInfo.Name
		end)
	end
	local function updateAudioDevices(p52) -- line: 3228
		-- upvalues: t5 (copy), SoundService (copy), GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), u25 (ref), v159 (copy), GetFFlagVoiceChatUILogging (copy), v111 (copy), createDeviceOptions (copy)
		local ok, result, v548, v549 = pcall(function() -- line: 3229
			-- upvalues: p52 (copy), t5 (copy), SoundService (copy)
			if p52 == t5.Input then
				return SoundService:GetInputDevices()
			end

			return SoundService:GetOutputDevices()
		end)

		if GetFFlagVoiceChatClientRewriteDisableVCSDevice() then
			if ok and (result and (v548 and (v549 and (#result > 0 and (v549 > 0 and (v549 <= #result and #result == #v548)))))) then
				if v548[1] == "" then
					result[1] = u25:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. result[1] .. ")"
				end

				v159[p52 .. "DeviceNames"] = result
				v159[p52 .. "DeviceGuids"] = v548
				v159[p52 .. "DeviceIndex"] = v549
			else
				if GetFFlagVoiceChatUILogging() then
					v111:warning("Errors in get {} device info", p52)
				end

				v159[p52 .. "DeviceNames"] = {}
				v159[p52 .. "DeviceGuids"] = {}
				v159[p52 .. "DeviceIndex"] = 0
			end
		elseif ok and (result and (v548 and (v549 and (#result > 0 and (v549 > 0 and (v549 <= #result and #result == #v548)))))) then
			if v548[1] == "" then
				result[1] = u25:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. result[1] .. ")"
			end

			v159[p52 .. "DeviceNames"] = result
			v159[p52 .. "VCSDeviceNames"] = result
			v159[p52 .. "VCSDeviceGuids"] = v548
			v159[p52 .. "DeviceGuids"] = v548
			v159[p52 .. "DeviceIndex"] = v549
		else
			if GetFFlagVoiceChatUILogging() then
				v111:warning("Errors in get {} device info", p52)
			end

			v159[p52 .. "DeviceNames"] = {}
			v159[p52 .. "DeviceGuids"] = {}
			v159[p52 .. "VCSDeviceNames"] = {}
			v159[p52 .. "VCSDeviceGuids"] = {}
			v159[p52 .. "DeviceIndex"] = 0
		end

		if not v159[p52 .. "DeviceSelector"] then
			createDeviceOptions(p52)

			return
		end

		v159[p52 .. "DeviceSelector"]:UpdateOptions(result)
		v159[p52 .. "DeviceSelector"]:SetSelectionIndex(v549)
	end
	local function updateVoiceChatDevices(p53) -- line: 3284
		-- upvalues: t5 (copy), GetFFlagVoiceChatUILogging (copy), v111 (copy), SoundService (copy), GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), u25 (ref), v159 (copy), u18 (ref), createDeviceOptions (copy)
		if p53 ~= t5.Input and (p53 ~= t5.Output and GetFFlagVoiceChatUILogging()) then
			v111:warning("{} is not supported in VoiceChat devices", p53)
		end

		local ok, result, v553, v554 = pcall(function() -- line: 3291
			-- upvalues: p53 (copy), t5 (copy), SoundService (copy)
			if p53 == t5.Input then
				return SoundService:GetInputDevices()
			end

			return SoundService:GetOutputDevices()
		end)

		if GetFFlagVoiceChatClientRewriteDisableVCSDevice() then
			if ok and (result and (v553 and (v554 and (#result > 0 and (v554 > 0 and (v554 <= #result and #result == #v553)))))) then
				if v553[1] == "" then
					result[1] = u25:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. result[1] .. ")"
				end

				v159[p53 .. "DeviceNames"] = result
				v159[p53 .. "DeviceGuids"] = v553
				v159[p53 .. "DeviceIndex"] = v554
			else
				if GetFFlagVoiceChatUILogging() then
					if #result > 0 then
						v111:warning("Errors in get {} device info success: {}", p53, ok)
					else
						v111:warning("Empty deviceNames list for {}", p53)
					end
				end

				v159[p53 .. "DeviceNames"] = {}
				v159[p53 .. "DeviceGuids"] = {}
				v159[p53 .. "DeviceIndex"] = 0
			end
		else
			local ok2, result2, v557, v558 = pcall(function() -- line: 3328
				-- upvalues: u18 (ref)
				return u18:GetSpeakerDevices()
			end)

			if ok and ok2 and (result and (v553 and (v554 and (#result > 0 and (v554 > 0 and (v554 <= #result and #result == #v553)))))) and (result2 and (v557 and (v558 and (#result2 > 0 and (v558 > 0 and (v558 <= #result2 and #result2 == #v557)))))) then
				if v553[1] == "" then
					result[1] = u25:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. result[1] .. ")"
				end

				v159[p53 .. "DeviceNames"] = result
				v159[p53 .. "VCSDeviceNames"] = result2
				v159[p53 .. "VCSDeviceGuids"] = v557
				v159[p53 .. "DeviceGuids"] = v553
				v159[p53 .. "DeviceIndex"] = v554
			else
				if GetFFlagVoiceChatUILogging() then
					if #result > 0 then
						v111:warning("Errors in get {} device info success: {} VCSSuccess: {}", p53, ok, ok2)
					else
						v111:warning("Empty deviceNames list for {}", p53)
					end
				end

				v159[p53 .. "DeviceNames"] = {}
				v159[p53 .. "DeviceGuids"] = {}
				v159[p53 .. "VCSDeviceNames"] = {}
				v159[p53 .. "VCSDeviceGuids"] = {}
				v159[p53 .. "DeviceIndex"] = 0
			end
		end

		if not v159[p53 .. "DeviceSelector"] then
			createDeviceOptions(p53)
		else
			v159[p53 .. "DeviceSelector"]:UpdateOptions(result)
			v159[p53 .. "DeviceSelector"]:SetSelectionIndex(v554)
		end

		if v159[p53 .. "DeviceFrame"] then
			if #result > 0 then
				v159[p53 .. "DeviceFrame"].Visible = true

				return
			end

			v159[p53 .. "DeviceFrame"].Visible = false
		end
	end
	local function updateCameraDevices() -- line: 3384
		-- upvalues: VideoCaptureService (copy), v109 (copy), UserGameSettings (copy), v159 (copy), createCameraDeviceOptions (copy)
		local CameraDevices = VideoCaptureService:GetCameraDevices()
		local t27 = {}
		local t28 = {}
		local n8 = 1

		table.insert(t27, v109)
		table.insert(t28, "{DefaultDeviceGuid}")

		for k, v in pairs(CameraDevices) do
			if k == UserGameSettings.DefaultCameraID then
				n8 = #t27 + 1
			end

			table.insert(t27, v)
			table.insert(t28, k)
		end

		v159.CameraDeviceNames = t27
		v159.CameraDeviceGuids = t28
		v159.CameraDeviceIndex = 0

		if not v159.CameraDeviceSelector then
			createCameraDeviceOptions()
		else
			v159.CameraDeviceSelector:UpdateOptions(t27)
		end

		v159.CameraDeviceSelector:SetSelectionIndex(n8)
	end

	local connection = nil
	local connection2 = nil

	local function updateAudioOptions() -- line: 3414
		-- upvalues: v159 (copy), updateVoiceChatDevices (copy), t5 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), updateAudioDevices (copy)
		if v159.VoiceChatOptionsEnabled then
			updateVoiceChatDevices(t5.Input)
			updateVoiceChatDevices(t5.Output)

			return
		end

		if GetFFlagEnableCrossExpVoice() and default4:getIsConnected() then
			updateAudioDevices(t5.Input)
		end

		updateAudioDevices(t5.Output)
	end

	local u187 = false
	local u188 = nil

	if v61 then
		u188 = false
	end

	local function createVoiceChatSelector() -- line: 3482
		-- upvalues: v60 (copy), v159 (copy), v54 (copy), u25 (ref), default3 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), v61 (copy), GetFIntDebounceDisconnectButtonDelay (copy), GetFFlagDebounceConnectDisconnectSelector (copy), u188 (ref), FFlagVoiceRewarmTelemetry (copy), u187 (ref), ThrottleFunctionCall (copy), v57 (copy), GuiService (copy)
		if v60 and (v159.VoiceConnectDisconnectFrame and v159.VoiceConnectDisconnectSelector) then
			return
		end

		local s8 = "Voice Chat"
		local s9 = "Disconnected"
		local s10 = "Connected"

		if v54 then
			s8 = u25:Format("Feature.GameDetails.Label.VoiceChat")
			s9 = u25:Format("Feature.SettingsHub.Label.Disconnected")
			s10 = u25:Format("Feature.SettingsHub.Label.Connected")
		end

		local v569 = not default3:VoiceChatEnded() and 2 or 1
		local v570 = v159
		local v571 = v159
		local v572, v573, v574 = Utility:AddNewRow(v159, s8, "Selector", {
			s9,
			s10
		}, v569)

		v570.VoiceConnectDisconnectFrame = v572
		_ = v573
		v571.VoiceConnectDisconnectSelector = v574
		v159.VoiceConnectDisconnectFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectDisconnectSelector

		local v575 = default3:getService()

		if v575 and not v61 then
			v575.StateChanged:Connect(function(oldState, newState) -- line: 3507
				-- upvalues: v60 (copy), v159 (copy), default3 (copy)
				if v60 then
					if oldState == newState then
						return
					end

					if newState == Enum.VoiceChatState.Joined and v159.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						v159.VoiceConnectDisconnectSelector:SetSelectionIndex(2)

						return
					end

					if (newState == Enum.VoiceChatState.Ended or newState == Enum.VoiceChatState.Failed or newState == Enum.VoiceChatState.Idle) and v159.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						v159.VoiceConnectDisconnectSelector:SetSelectionIndex(1)

						return
					end
				else
					if oldState == newState then
						return
					end

					if newState == Enum.VoiceChatState.Joined then
						v159.VoiceConnectDisconnectSelector:SetSelectionIndex(2)

						return
					end

					if default3:VoiceChatEnded() then
						v159.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end
			end)
		end

		local u576 = v569
		local v577 = GetFIntDebounceDisconnectButtonDelay()
		local v578 = GetFFlagDebounceConnectDisconnectSelector() and v577 > 0

		local function v579(p54) -- line: 3541
			-- upvalues: u576 (ref), v61 (copy), u188 (ref), FFlagVoiceRewarmTelemetry (copy), default3 (copy), u187 (ref), v159 (copy)
			if p54 == u576 then
				return
			end

			u576 = p54

			if v61 and u188 then
				return
			end

			if FFlagVoiceRewarmTelemetry then
				local v928, v929, v930, v931 = default3:GetConnectDisconnectButtonAnalyticsData(p54 == 2)

				default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", v928, v929, v930, v931, default3.joinVoiceButtonContext)
			else
				default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default3:GetConnectDisconnectButtonAnalyticsData(p54 == 2))
			end

			if p54 == 2 then
				default3:JoinVoice()
			elseif not default3:VoiceChatEnded() then
				default3:Leave()
			end

			if u187 then
				task.spawn(function() -- line: 3573
					-- upvalues: p54 (copy), v159 (copy)
					task.wait(0.5)

					if p54 ~= 1 then
						v159.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				end)
			end
		end

		v159.VoiceConnectDisconnectSelector.IndexChanged:connect(if not v578 then v579 else ThrottleFunctionCall(v577, v579))

		if v57 then
			v159.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(__, p56, p57) -- line: 3587
				-- upvalues: s8 (ref), v159 (copy), GuiService (copy)
				if p57 and (p56 and p56.Parent and p56.Parent.Name == s8 .. "Frame" and p57.Name == "ImageButton" and v159.Active) then
					GuiService.SelectedCoreObject = p56
				end
			end)
		end

		default3:subscribe("OnStateChanged", function(__, p59) -- line: 3594
			-- upvalues: v61 (copy), u188 (ref), v159 (copy)
			if v61 then
				u188 = true

				if p59 == Enum.VoiceChatState.Joined then
					v159.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end

			if p59 == Enum.VoiceChatState.Failed then
				v159.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
			end

			if v61 then
				u188 = false
			end
		end)
		default3:subscribe("OnRequestMicPermissionRejected", function() -- line: 3611
			-- upvalues: u187 (ref), v61 (copy), u188 (ref), v159 (copy)
			task.spawn(function() -- line: 3612
				-- upvalues: u187 (ref), v61 (copy), u188 (ref), v159 (copy)
				task.wait(0.5)
				u187 = true

				if v61 then
					u188 = true
				end

				v159.VoiceConnectDisconnectSelector:SetSelectionIndex(1)

				if v61 then
					u188 = false
				end
			end)
		end)
	end
	local function createVoiceConnectDisconnect() -- line: 3626
		-- upvalues: default3 (copy), u25 (ref), GetFIntDebounceDisconnectButtonDelay (copy), FFlagVoiceRewarmTelemetry (copy), Utility (copy), ThrottleFunctionCall (copy), v159 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy)
		if default3:IsSeamlessVoice() and not default3.isShowingFTUX then
			local v580 = u25:Format("Feature.GameDetails.Label.VoiceChat")
			local v581 = u25:Format("Feature.SettingsHub.Label.Connect")
			local v582 = u25:Format("Feature.SettingsHub.Label.Disconnect")
			local v583 = GetFIntDebounceDisconnectButtonDelay()
			local v584 = v583 > 0

			local function v585() -- line: 3636
				-- upvalues: default3 (copy), FFlagVoiceRewarmTelemetry (copy)
				if default3:getService() then
					local connection3 = nil

					connection3 = default3:getService().StateChanged:Connect(function(__, newState) -- line: 3640
						-- upvalues: FFlagVoiceRewarmTelemetry (copy), default3 (copy), connection3 (ref)
						if newState == Enum.VoiceChatState.Joined then
							if FFlagVoiceRewarmTelemetry then
								local v1035, v1036, v1037, v1038 = default3:GetConnectDisconnectButtonAnalyticsData(true)

								default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", v1035, v1036, v1037, v1038, default3.joinVoiceButtonContext)
							else
								default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default3:GetConnectDisconnectButtonAnalyticsData(true))
							end

							connection3:Disconnect()
						end
					end)
				elseif FFlagVoiceRewarmTelemetry then
					local v938, v939, v940, v941 = default3:GetConnectDisconnectButtonAnalyticsData(false)

					default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", v938, v939, v940, v941, default3.joinVoiceButtonContext)
				else
					default3.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", default3:GetConnectDisconnectButtonAnalyticsData(false))
				end

				default3:JoinVoice()
			end
			local function v586() -- line: 3672
				-- upvalues: default3 (copy)
				default3.Analytics:reportLeaveVoiceButtonEvent("clicked", default3:GetConnectDisconnectButtonAnalyticsData(true))
				default3:Leave()
			end

			local v587, v588, v589 = Utility:MakeStyledButton("VoiceConnectButton", v581, UDim2.new(1, 0, 1, -20), if not v584 then v585 else ThrottleFunctionCall(v583, v585), v159)

			voiceConnectSetRowRef = v589

			local v590, v591, v592 = Utility:MakeStyledButton("VoiceDisconnectButton", v582, UDim2.new(1, 0, 1, -20), if not v584 then v586 else ThrottleFunctionCall(v583, v586), v159)

			voiceDisconnectSetRowRef = v592
			v587.Size = UDim2.new(0.6, 0, 0, 40)
			v587.Position = UDim2.new(0.4, 0, 0.5, 0)
			v587.AnchorPoint = Vector2.new(0, 0.5)
			v587.ZIndex = 2
			v587.Selectable = true
			v588.ZIndex = 2
			v590.Size = UDim2.new(0.6, 0, 0, 40)
			v590.Position = UDim2.new(0.4, 0, 0.5, 0)
			v590.AnchorPoint = Vector2.new(0, 0.5)
			v590.ZIndex = 2
			v590.Selectable = true
			v591.ZIndex = 2

			local v593 = Utility:AddNewRowObject(v159, v580, v587, nil, true)
			local v594 = Utility:AddNewRowObject(v159, v580, v590, nil, true)

			v159.VoiceConnectFrame = v593
			v159.VoiceDisconnectFrame = v594
			v593.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceConnectFrame
			v594.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VoiceDisconnectFrame
			voiceConnectSetRowRef(v593)
			voiceDisconnectSetRowRef(v594)

			if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and isVoiceFocused() then
				v593.Visible = false
				v594.Visible = false

				return
			end

			if default3:ShouldShowJoinVoice() then
				v593.Visible = true
				v594.Visible = false

				return
			end

			v593.Visible = false
			v594.Visible = true
		end
	end

	v159.VoiceChatOptionsEnabled = false

	local connection4 = nil
	local connection5 = nil
	local u193 = nil

	if game:GetEngineFeature("VoiceChatSupported") and (GetFFlagEnableVrVoiceConnectDisconnect() or (not isInExperienceUIVREnabled or not isSpatial())) then
		spawn(function() -- line: 3926
			-- upvalues: GetFFlagEnableVoiceUxUpdates (copy), v55 (copy), default3 (copy), createVoiceChatSelector (copy), isVoiceFocused (copy), v159 (copy), observeIsVoiceFocused (copy), u18 (ref), GetFFlagVoiceChatClientRewriteMasterLua (copy), syncSoundOutputs (copy), v60 (copy), GetFFlagEnableUniveralVoiceToasts (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), createVoiceConnectDisconnect (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy), GetFFlagVoiceChatUILogging (copy), v111 (copy)
			if GetFFlagEnableVoiceUxUpdates() and ((not v55 and default3:EligibleForFaeUpsell() or default3:IsSeamlessVoice()) and default3:verifyUniverseAndPlaceCanUseVoice()) then
				createVoiceChatSelector()

				if isVoiceFocused() and v159.VoiceConnectDisconnectFrame then
					v159.VoiceConnectDisconnectFrame.Visible = false
				end

				observeIsVoiceFocused(function(p61) -- line: 3936
					-- upvalues: v159 (copy)
					if p61 then
						if v159.VoiceConnectDisconnectFrame then
							v159.VoiceConnectDisconnectFrame.Visible = false

							return
						end
					elseif v159.VoiceConnectDisconnectFrame then
						v159.VoiceConnectDisconnectFrame.Visible = true
					end
				end)
			end

			default3:asyncInit():andThen(function() -- line: 3949
				-- upvalues: u18 (ref), default3 (copy), v159 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), syncSoundOutputs (copy), v60 (copy), createVoiceChatSelector (copy), GetFFlagEnableUniveralVoiceToasts (copy), GetFFlagEnableVoiceUxUpdates (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), createVoiceConnectDisconnect (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), isVoiceFocused (copy), observeIsVoiceFocused (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy)
				u18 = default3:getService()

				if default3:VoiceChatAvailable() then
					v159.VoiceChatOptionsEnabled = true

					if not GetFFlagVoiceChatClientRewriteMasterLua() then
						syncSoundOutputs()
					end
				end

				if v60 and default3:UserVoiceEnabled() then
					createVoiceChatSelector()
				end

				if not GetFFlagEnableUniveralVoiceToasts() then
					default3:CheckAndShowNotAudiblePrompt()
				end

				if GetFFlagEnableVoiceUxUpdates() then
					v159.VoiceConnectDisconnectSelector:SetSelectionIndex(2)

					return
				end

				local u959 = false

				if GetFFlagEnableConnectDisconnectInSettingsAndChrome() then
					createVoiceConnectDisconnect()

					if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						u959 = isVoiceFocused()
						observeIsVoiceFocused(function(p62) -- line: 3974
							-- upvalues: u959 (ref), v159 (copy), default3 (copy)
							u959 = p62

							if p62 then
								if v159.VoiceConnectFrame then
									v159.VoiceConnectFrame.Visible = false
								end

								if v159.VoiceDisconnectFrame then
									v159.VoiceDisconnectFrame.Visible = false

									return
								end
							elseif default3:ShouldShowJoinVoice() then
								if v159.VoiceConnectFrame then
									v159.VoiceConnectFrame.Visible = true
								end

								if v159.VoiceDisconnectFrame then
									v159.VoiceDisconnectFrame.Visible = false
								end
							end
						end)
					end
				end

				if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceConnectFrame then
					v159.VoiceConnectFrame.Visible = false
				end

				if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceDisconnectFrame then
					if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
						v159.VoiceDisconnectFrame.Visible = not u959
					else
						v159.VoiceDisconnectFrame.Visible = true
					end
				end

				default3.showVoiceUI.Event:Connect(function() -- line: 4007
					-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), u959 (ref), v159 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy)
					if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and u959 then
						return
					end

					v159.VoiceChatOptionsEnabled = true

					local v1042 = v159.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoice() and default4:getIsConnected()

					if v159[t5.Input .. "DeviceFrame"] then
						v159[t5.Input .. "DeviceFrame"].Visible = v1042
					end

					if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceConnectFrame then
						v159.VoiceConnectFrame.Visible = false
					end

					if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceDisconnectFrame then
						v159.VoiceDisconnectFrame.Visible = true
					end
				end)
				default3.hideVoiceUI.Event:Connect(function() -- line: 4025
					-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), u959 (ref), v159 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy)
					if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and u959 then
						return
					end

					v159.VoiceChatOptionsEnabled = false

					local v1043 = v159.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoice() and default4:getIsConnected()

					if v159[t5.Input .. "DeviceFrame"] then
						v159[t5.Input .. "DeviceFrame"].Visible = v1043
					end

					if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceConnectFrame then
						v159.VoiceConnectFrame.Visible = true
					end

					if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and v159.VoiceDisconnectFrame then
						v159.VoiceDisconnectFrame.Visible = false
					end
				end)
			end):catch(function() -- line: 4045
				-- upvalues: GetFFlagVoiceChatUILogging (copy), v111 (copy), GetFFlagEnableUniveralVoiceToasts (copy), default3 (copy)
				if GetFFlagVoiceChatUILogging() then
					v111:warning("Failed to init VoiceChatServiceManager")
				end

				if not GetFFlagEnableUniveralVoiceToasts() then
					default3:CheckAndShowPermissionPrompt()
				end
			end)
		end)
	end

	if GetFFlagEnableCrossExpVoice() and (not isInExperienceUIVREnabled or not isSpatial()) then
		connection4 = default4.ExperienceJoined.Event:Connect(function() -- line: 4058
			-- upvalues: v159 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy)
			local v635 = v159.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoice() and default4:getIsConnected()

			if v159[t5.Input .. "DeviceFrame"] then
				v159[t5.Input .. "DeviceFrame"].Visible = v635
			end
		end)
		connection5 = default4.ExperienceLeft.Event:Connect(function() -- line: 4061
			-- upvalues: v159 (copy), GetFFlagEnableCrossExpVoice (copy), default4 (copy), t5 (copy)
			local v636 = v159.VoiceChatOptionsEnabled or GetFFlagEnableCrossExpVoice() and default4:getIsConnected()

			if v159[t5.Input .. "DeviceFrame"] then
				v159[t5.Input .. "DeviceFrame"].Visible = v636
			end
		end)

		function u193() -- line: 4064
			-- upvalues: connection4 (ref), connection5 (ref)
			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end
		end
	end

	v159.VideoOptionsEnabled = false

	local u194 = nil

	if GetFFlagSelfViewCameraSettings() and (not isInExperienceUIVREnabled or not isSpatial()) and isCamEnabledForUserAndPlace() then
		getCamMicPermissions(function(p63) -- line: 4086
			-- upvalues: v159 (copy)
			v159.VideoOptionsEnabled = p63.hasCameraPermissions
		end, { default.Permissions.CAMERA_ACCESS }, true)

		if u194 then
			u194:disconnect()
		end

		u194 = cameraDevicePermissionGrantedSignal:connect(function() -- line: 4102
			-- upvalues: v159 (copy), updateCameraDevices (copy), VideoCaptureService (copy), connection2 (ref)
			v159.VideoOptionsEnabled = true
			updateCameraDevices()

			if VideoCaptureService.DevicesChanged then
				connection2 = VideoCaptureService.DevicesChanged:Connect(function() -- line: 3438
					-- upvalues: v159 (copy), updateCameraDevices (copy)
					if v159.PageOpen then
						updateCameraDevices()
					end
				end)
			end
		end)
	end

	if not isInExperienceUIVREnabled then
		createCameraModeOptions(not v102 and (UserInputService.TouchEnabled or (UserInputService.MouseEnabled or UserInputService.KeyboardEnabled)))
	end

	if UserInputService.MouseEnabled then
		(function() --[[ createMouseOptions ]] -- line: 2551
			-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t10 (copy), Create (copy), Theme (copy), setCameraSensitivity (copy)
			local MouseSensitivity = GameSettings.MouseSensitivity
			local v442 = MouseSensitivity <= 1 and math.floor((MouseSensitivity - 0.2) / 0.16 + 0.5) or math.floor((MouseSensitivity + 2) / 0.6 + 0.5)
			local v443 = if not (MouseSensitivity <= 0.2) then v442 else 0
			local u444 = true

			tostring(GameSettings.MouseSensitivityFirstPerson.X)

			local v445 = v159
			local v446 = v159
			local v447 = v159
			local v448, v449, v450 = Utility:AddNewRow(v159, "Camera Sensitivity", "Slider", 10, v443)

			v445.MouseAdvancedFrame = v448
			v446.MouseAdvancedLabel = v449
			v447.MouseAdvancedEntry = v450
			v159.MouseAdvancedFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MouseAdvancedFrame
			t10[v159.MouseAdvancedFrame] = true
			v159.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(v159.MouseAdvancedEntry.SliderFrame.Size.X.Scale, v159.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, v159.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, v159.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
			v159.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(v159.MouseAdvancedEntry.SliderFrame.Position.X.Scale, v159.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, v159.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, v159.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
			v159.MouseAdvancedLabel.ZIndex = 2
			v159.MouseAdvancedEntry:SetInteractable(true)

			local v451 = Create("TextBox")({
				Name = "CameraSensitivityTextBox",
				TextColor3 = Color3.new(1, 1, 1),
				BorderColor3 = Color3.new(0.8, 0.8, 0.8),
				BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
				Font = Theme.font(Enum.Font.SourceSans),
				TextSize = Theme.textSize(18),
				Size = UDim2.new(0, 60, 0.8, 0),
				Position = UDim2.new(1, 10, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				ZIndex = 3,
				Selectable = false,
				Parent = v159.MouseAdvancedEntry.SliderFrame,
				BorderSizePixel = 0
			})

			Create("UICorner")({
				CornerRadius = Theme.DefaultCornerRadius,
				Parent = v451
			})

			local v452 = math.floor(GameSettings.MouseSensitivityFirstPerson.X * 1000 + 0.5) / 1000

			v451.Text = tostring((tonumber((string.format("%.3f", v452)))))

			local MouseAdvancedEntry = v159.MouseAdvancedEntry
			local MouseSensitivityFirstPersonX = GameSettings.MouseSensitivityFirstPerson.X
			local v455 = MouseSensitivityFirstPersonX <= 1 and math.floor((MouseSensitivityFirstPersonX - 0.2) / 0.16 + 0.5) or math.floor((MouseSensitivityFirstPersonX + 2) / 0.6 + 0.5)

			MouseAdvancedEntry:SetValue(if not (MouseSensitivityFirstPersonX <= 0.2) then v455 else 0)

			function clampMouseSensitivity(p64) -- line: 2638
				if p64 < 0 then
					p64 = -p64
				end

				if p64 > 100 then
					return 100
				end

				if p64 < 0.001 then
					p64 = 0.001
				end

				return p64
			end
			function setMouseSensitivity(p65, p66) -- line: 2656
				-- upvalues: u444 (ref), setCameraSensitivity (copy), v159 (copy), v451 (copy)
				if not u444 then
					return
				end

				setCameraSensitivity(p65)
				u444 = false

				if p66 ~= v159.MouseAdvancedEntry then
					local MouseAdvancedEntry2 = v159.MouseAdvancedEntry
					local v869 = p65 <= 1 and math.floor((p65 - 0.2) / 0.16 + 0.5) or math.floor((p65 + 2) / 0.6 + 0.5)

					MouseAdvancedEntry2:SetValue(if not (p65 <= 0.2) then v869 else 0)
				end

				local v870 = math.floor(p65 * 1000 + 0.5) / 1000

				v451.Text = tostring((tonumber((string.format("%.3f", v870)))))
				u444 = true
			end

			v451.FocusLost:connect(function() -- line: 2674
				-- upvalues: v159 (copy), v451 (copy), GameSettings (copy)
				v159.MouseAdvancedEntry:SetInteractable(true)

				local num = tonumber((string.match(v451.Text, "([%d%.]+)")))

				if num then
					setMouseSensitivity(clampMouseSensitivity(num), v451)

					return
				end

				setMouseSensitivity(GameSettings.MouseSensitivityFirstPerson.X, v451)
			end)
			v451.Focused:connect(function() -- line: 2686
				-- upvalues: v159 (copy)
				v159.MouseAdvancedEntry:SetInteractable(false)
			end)
			v159.MouseAdvancedEntry.ValueChanged:connect(function(p67) -- line: 2690
				-- upvalues: v159 (copy)
				local v873 = clampMouseSensitivity(p67)
				local v874 = v873 <= 5 and 0.16 * v873 + 0.2 or 0.6 * v873 - 2
				local v875 = if not (v874 <= 0.2) then v874 else 0.2

				setMouseSensitivity(v875, v159.MouseAdvancedEntry)
			end)
		end)()
	elseif UserInputService.GamepadEnabled then
		if GameSettings.IsUsingGamepadCameraSensitivity then
			createGamepadOptions()
		else
			local u195 = nil

			u195 = GameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() -- line: 4124
				-- upvalues: GameSettings (copy), u195 (ref), createGamepadOptions (copy)
				if GameSettings.IsUsingGamepadCameraSensitivity then
					if u195 then
						u195:disconnect()
					end

					createGamepadOptions()
				end
			end)
		end
	else
		local u196 = nil

		u196 = UserInputService.GamepadConnected:connect(function() -- line: 4142
			-- upvalues: u196 (ref), GameSettings (copy), createGamepadOptions (copy)
			if u196 then
				u196:disconnect()
			end

			if GameSettings.IsUsingGamepadCameraSensitivity then
				createGamepadOptions()

				return
			end

			local u639 = nil

			u639 = GameSettings:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function() -- line: 4124
				-- upvalues: GameSettings (copy), u639 (ref), createGamepadOptions (copy)
				if GameSettings.IsUsingGamepadCameraSensitivity then
					if u639 then
						u639:disconnect()
					end

					createGamepadOptions()
				end
			end)
		end)
	end

	if not isInExperienceUIVREnabled then
		if GameSettings.IsUsingCameraYInverted then
			createCameraInvertedOptions()
		else
			local u197 = nil

			u197 = GameSettings.Changed:connect(function(p68) -- line: 4156
				-- upvalues: GameSettings (copy), u197 (ref), createCameraInvertedOptions (copy)
				if p68 == "IsUsingCameraYInverted" and GameSettings.IsUsingCameraYInverted then
					u197:disconnect()
					createCameraInvertedOptions()
				end
			end)
		end
	end

	if isInExperienceUIVREnabled then
		if isSpatial() then
			(function() --[[ createVRComfortSettingOptions ]] -- line: 3734
				-- upvalues: u25 (ref), GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
				local EnumItems = Enum.VRComfortSetting:GetEnumItems()
				local t29 = {
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
				}
				local t30 = {}

				for i, v in ipairs(EnumItems) do
					t30[i] = u25:Format(t29[tostring(v)])
				end

				local v600 = table.find(EnumItems, GameSettings.VRComfortSetting)
				local v601 = v159
				local v602 = v159
				local v603 = v159
				local v604, v605, v606 = Utility:AddNewRow(v159, u25:Format(t29.title), "Selector", t30, v600, nil, u25:Format(t29.description))

				v601.VRComfortSettingFrame = v604
				v602.VRComfortSettingLabel = v605
				v603.VRComfortSettingSelector = v606
				v159.VRComfortSettingFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRComfortSettingFrame

				local v607 = not GameSettings.VignetteEnabled and 2 or 1
				local v608 = v159
				local v609 = v159
				local v610 = v159
				local v611, v612, v613 = Utility:AddNewRow(v159, u25:Format(t29.vignetteEnabled), "Selector", {
					u25:Format(t29.on),
					u25:Format(t29.off)
				}, v607)

				v608.VRVignetteEnabledFrame = v611
				v609.VRVignetteEnabledLabel = v612
				v610.VRVignetteEnabledSelector = v613
				v159.VRVignetteEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRVignetteEnabledFrame

				local v614 = not GameSettings.VRSmoothRotationEnabled and 1 or 2
				local v615 = v159
				local v616 = v159
				local v617 = v159
				local v618, v619, v620 = Utility:AddNewRow(v159, u25:Format(t29.steppedRotationEnabled), "Selector", {
					u25:Format(t29.on),
					u25:Format(t29.off)
				}, v614)

				v615.VRSteppedRotationEnabledFrame = v618
				v616.VRSteppedRotationEnabledLabel = v619
				v617.VRSteppedRotationEnabledSelector = v620
				v159.VRSteppedRotationEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSteppedRotationEnabledFrame

				local v621 = not GameSettings.VRThirdPersonFollowCamEnabled and 1 or 2
				local v622 = v159
				local v623 = v159
				local v624 = v159
				local v625, v626, v627 = Utility:AddNewRow(v159, u25:Format(t29.thirdPersonFixedCamEnabled), "Selector", {
					u25:Format(t29.on),
					u25:Format(t29.off)
				}, v621)

				v622.VRThirdPersonFixedCamEnabledFrame = v625
				v623.VRThirdPersonFixedCamEnabledLabel = v626
				v624.VRThirdPersonFixedCamEnabledSelector = v627
				v159.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRThirdPersonFixedCamEnabledFrame

				local function v628(p69) -- line: 3800
					-- upvalues: v159 (copy)
					if p69 == Enum.VRComfortSetting.Custom then
						v159.VRVignetteEnabledSelector:SetZIndex(2)
						v159.VRVignetteEnabledLabel.ZIndex = 2
						v159.VRVignetteEnabledSelector:SetInteractable(true)
						v159.VRSteppedRotationEnabledSelector:SetZIndex(2)
						v159.VRSteppedRotationEnabledLabel.ZIndex = 2
						v159.VRSteppedRotationEnabledSelector:SetInteractable(true)
						v159.VRThirdPersonFixedCamEnabledSelector:SetZIndex(2)
						v159.VRThirdPersonFixedCamEnabledLabel.ZIndex = 2
						v159.VRThirdPersonFixedCamEnabledSelector:SetInteractable(true)

						return
					end

					v159.VRVignetteEnabledSelector:SetZIndex(1)
					v159.VRVignetteEnabledLabel.ZIndex = 1
					v159.VRVignetteEnabledSelector:SetInteractable(false)
					v159.VRSteppedRotationEnabledSelector:SetZIndex(1)
					v159.VRSteppedRotationEnabledLabel.ZIndex = 1
					v159.VRSteppedRotationEnabledSelector:SetInteractable(false)
					v159.VRThirdPersonFixedCamEnabledSelector:SetZIndex(1)
					v159.VRThirdPersonFixedCamEnabledLabel.ZIndex = 1
					v159.VRThirdPersonFixedCamEnabledSelector:SetInteractable(false)
				end

				v159.VRComfortSettingSelector.IndexChanged:connect(function(p70) -- line: 3824
					-- upvalues: EnumItems (copy), GameSettings (copy), v628 (copy)
					local v944 = EnumItems[p70]

					GameSettings.VRComfortSetting = v944
					v628(v944)
				end)
				v628(GameSettings.VRComfortSetting)
				v159.VRVignetteEnabledSelector.IndexChanged:connect(function(p71) -- line: 3831
					-- upvalues: GameSettings (copy)
					if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
						GameSettings.VignetteEnabledCustomOption = p71 == 1
					end
				end)
				v159.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p72) -- line: 3837
					-- upvalues: GameSettings (copy)
					if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
						GameSettings.VRSmoothRotationEnabledCustomOption = p72 == 2
					end
				end)
				v159.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p73) -- line: 3843
					-- upvalues: GameSettings (copy)
					if GameSettings.VRComfortSetting == Enum.VRComfortSetting.Custom then
						GameSettings.VRThirdPersonFollowCamEnabledCustomOption = p73 == 2
					end
				end)
				GameSettings:GetPropertyChangedSignal("VRComfortSetting"):Connect(function() -- line: 3849
					-- upvalues: EnumItems (copy), GameSettings (copy), v159 (copy)
					local v948 = table.find(EnumItems, GameSettings.VRComfortSetting)

					if v948 ~= v159.VRComfortSettingSelector:GetSelectedIndex() then
						v159.VRComfortSettingSelector:SetSelectionIndex(v948)
					end
				end)
				GameSettings:GetPropertyChangedSignal("VignetteEnabled"):Connect(function() -- line: 3856
					-- upvalues: GameSettings (copy), v159 (copy)
					local v949 = not GameSettings.VignetteEnabled and 2 or 1

					if v949 ~= v159.VRVignetteEnabledSelector:GetSelectedIndex() then
						v159.VRVignetteEnabledSelector:SetSelectionIndex(v949)
					end
				end)
				GameSettings:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function() -- line: 3863
					-- upvalues: GameSettings (copy), v159 (copy)
					local v950 = not GameSettings.VRSmoothRotationEnabled and 1 or 2

					if v950 ~= v159.VRSteppedRotationEnabledSelector:GetSelectedIndex() then
						v159.VRSteppedRotationEnabledSelector:SetSelectionIndex(v950)
					end
				end)
				GameSettings:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function() -- line: 3870
					-- upvalues: GameSettings (copy), v159 (copy)
					local v951 = not GameSettings.VRThirdPersonFollowCamEnabled and 1 or 2

					if v951 ~= v159.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() then
						v159.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v951)
					end
				end)
			end)();
			(function() --[[ createVRSafetyBubbleModeOptions ]] -- line: 3878
				-- upvalues: u25 (ref), GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
				local EnumItems = Enum.VRSafetyBubbleMode:GetEnumItems()
				local t31 = {
					title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
					description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
					["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
					["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
					["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
				}
				local t32 = {}

				for i, v in ipairs(EnumItems) do
					t32[i] = u25:Format(t31[tostring(v)])
				end

				local v634 = table.find(EnumItems, GameSettings.VRSafetyBubbleMode)

				task.defer(function() -- line: 3894
					-- upvalues: v159 (copy), Utility (copy), u25 (ref), t31 (copy), t32 (copy), v634 (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), EnumItems (copy), GameSettings (copy)
					local v952 = v159
					local v953 = v159
					local v954 = v159
					local v955, v956, v957 = Utility:AddNewRow(v159, u25:Format(t31.title), "DropDown", t32, v634, nil, u25:Format(t31.description))

					v952.VRSafetyBubbleModeFrame = v955
					v953.VRSafetyBubbleModeLabel = v956
					v954.VRSafetyBubbleModeSelector = v957
					v159.VRSafetyBubbleModeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VRSafetyBubbleModeFrame
					v159.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p74) -- line: 3907
						-- upvalues: EnumItems (copy), GameSettings (copy)
						GameSettings.VRSafetyBubbleMode = EnumItems[p74]
					end)
					GameSettings:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() -- line: 3912
						-- upvalues: EnumItems (copy), GameSettings (copy), v159 (copy)
						local v1040 = table.find(EnumItems, GameSettings.VRSafetyBubbleMode)

						if v1040 ~= v159.VRSafetyBubbleModeSelector:GetSelectedIndex() then
							v159.VRSafetyBubbleModeSelector:SetSelectionIndex(v1040)
						end
					end)
				end)
			end)()
		else
			createCameraModeOptions(not v102 and (UserInputService.TouchEnabled or (UserInputService.MouseEnabled or UserInputService.KeyboardEnabled)))

			if GameSettings.IsUsingCameraYInverted then
				createCameraInvertedOptions()
			else
				local u198 = nil

				u198 = GameSettings.Changed:connect(function(p75) -- line: 4185
					-- upvalues: GameSettings (copy), u198 (ref), createCameraInvertedOptions (copy)
					if p75 == "IsUsingCameraYInverted" and GameSettings.IsUsingCameraYInverted then
						u198:disconnect()
						createCameraInvertedOptions()
					end
				end)
			end

			createReducedMotionOptions()
			createPreferredTransparencyOptions()
		end
	end;

	(function() --[[ createVolumeOptions ]] -- line: 2390
		-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local v409 = math.floor(GameSettings.MasterVolume * 10)
		local v410 = v159
		local v411 = v159
		local v412 = v159
		local v413, v414, v415 = Utility:AddNewRow(v159, "Volume", "Slider", 10, v409)

		v410.VolumeFrame = v413
		v411.VolumeLabel = v414
		v412.VolumeSlider = v415
		v159.VolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.VolumeFrame

		local Sound = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)

		Sound.Name = "VolumeChangeSound"
		Sound.SoundId = "rbxasset://sounds/uuhhh.mp3"
		v159.VolumeSlider.ValueChanged:connect(function(p76) -- line: 2401
			-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), Sound (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v851 = nil

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				v851 = math.floor(GameSettings.MasterVolume * 10 + 0.5)
			end

			local v852 = p76 / 10

			Sound.Volume = v852
			Sound:Play()
			GameSettings.MasterVolume = v852

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("volume", v851, (math.floor(GameSettings.MasterVolume * 10 + 0.5)))
			end

			reportSettingsForAnalytics()
		end)
	end)()

	if v67 then
		(function() --[[ createPartyVoiceVolumeOptions ]] -- line: 2419
			-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty (copy), default4 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v417 = math.floor(GameSettings.PartyVoiceVolume * 10)
			local v418 = v159
			local v419 = v159
			local v420 = v159
			local v421, v422, v423 = Utility:AddNewRow(v159, "Party Voice Volume", "Slider", 10, v417)

			v418.PartyVoiceVolumeFrame = v421
			v419.PartyVoiceVolumeLabel = v422
			v420.PartyVoiceVolumeSlider = v423
			v159.PartyVoiceVolumeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PartyVoiceVolumeFrame

			if GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty() then
				v159.PartyVoiceVolumeFrame.Visible = default4.hasExperienceStarted
				default4.ExperienceJoined.Event:Connect(function() -- line: 2428
					-- upvalues: v159 (copy)
					v159.PartyVoiceVolumeFrame.Visible = true
				end)
				default4.ExperienceLeft.Event:Connect(function() -- line: 2431
					-- upvalues: v159 (copy)
					v159.PartyVoiceVolumeFrame.Visible = false
				end)
			end

			v159.PartyVoiceVolumeSlider.ValueChanged:connect(function(p77) -- line: 2436
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), v417 (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local v854 = nil

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					v854 = v417 == nil and 0 or math.floor(v417 * 10 + 0.5)
				end

				GameSettings.PartyVoiceVolume = p77 / 10

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					reportSettingsChangeForAnalytics("party_voice_volume", v854, (math.floor(p77 * 10 + 0.5)))
				end

				reportSettingsForAnalytics()
			end)
		end)()
	end;

	(function() --[[ createHapticsToggle ]] -- line: 2452
		-- upvalues: GameSettings (copy), getAppFeaturePolicies (copy), u25 (ref), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local v424 = GameSettings.HapticStrength ~= 0 and 2 or 1
		local v425 = not getAppFeaturePolicies().getShouldUseVibrationInsteadOfHaptics() and "Haptics" or u25:Format("CoreScripts.InGameMenu.Vibration")
		local v426 = v159
		local v427 = v159
		local v428, v429, v430 = Utility:AddNewRow(v159, v425, "Selector", {
			"Off",
			"On"
		}, v424)

		v426.HapticsFrame = v428
		_ = v429
		v427.HapticsSelector = v430
		v159.HapticsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.HapticsFrame
		v159.HapticsSelector.IndexChanged:connect(function(p78) -- line: 2461
			-- upvalues: GameSettings (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local HapticStrength = GameSettings.HapticStrength

			if p78 == 2 then
				GameSettings.HapticStrength = 1
			else
				GameSettings.HapticStrength = 0
			end

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("haptics_toggle", HapticStrength, GameSettings.HapticStrength)
			end

			reportSettingsForAnalytics()
		end)
	end)();
	(function() --[[ createGraphicsOptions ]] -- line: 463
		-- upvalues: GameSettings (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), t10 (copy), GuiService (copy), GetFFlagFixCyclicFullscreenIndexEvent (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), RbxAnalyticsService (copy), Constants (copy), EngineFeature2 (copy), VRService (copy), RobloxTranslator (copy), v135 (copy), GfxReset (copy), FastInt (copy), t1 (copy)
		local n9 = 1

		if not GameSettings:InFullScreen() then
			n9 = 2
		end

		local v210 = v159
		local v211 = v159
		local v212 = v159
		local v213, v214, v215 = Utility:AddNewRow(v159, "Fullscreen", "Selector", {
			"On",
			"Off"
		}, n9)

		v210.FullscreenFrame = v213
		v211.FullscreenLabel = v214
		v212.FullscreenEnabler = v215
		v159.FullscreenFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FullScreenFrame
		t10[v159.FullscreenFrame] = true
		v159.FullscreenEnabler.IndexChanged:connect(function(p79) -- line: 476
			-- upvalues: GameSettings (copy), GuiService (copy), GetFFlagFixCyclicFullscreenIndexEvent (copy), v159 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v660 = GameSettings:InFullScreen()

			if p79 == 1 then
				if not GameSettings:InFullScreen() then
					GuiService:ToggleFullscreen()

					if GetFFlagFixCyclicFullscreenIndexEvent() then
						if v159.FullscreenEnabler.GetSelectedIndex() ~= 1 then
							v159.FullscreenEnabler:SetSelectionIndex(1)
						end
					else
						v159.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p79 == 2 and GameSettings:InFullScreen() then
				GuiService:ToggleFullscreen()

				if GetFFlagFixCyclicFullscreenIndexEvent() then
					if v159.FullscreenEnabler.GetSelectedIndex() ~= 2 then
						v159.FullscreenEnabler:SetSelectionIndex(2)
					end
				else
					v159.FullscreenEnabler:SetSelectionIndex(2)
				end
			end

			spawn(function() -- line: 501
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), v660 (copy), GameSettings (copy), reportSettingsForAnalytics (copy)
				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					reportSettingsChangeForAnalytics("fullscreen_enabled", v660, GameSettings:InFullScreen())
				end

				reportSettingsForAnalytics()
			end)
		end)
		GameSettings.FullscreenChanged:connect(function(p80) -- line: 509
			-- upvalues: v159 (copy), RbxAnalyticsService (copy), Constants (copy)
			if p80 then
				if v159.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					v159.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif v159.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				v159.FullscreenEnabler:SetSelectionIndex(2)
			end

			RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsInGameMenuName, Constants.AnalyticsFullscreenModeName, {
				enabled = p80
			})
		end)

		local n10 = 1

		if GameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
			n10 = 2
		end

		local v217 = v159
		local v218 = v159
		local v219 = v159
		local v220, v221, v222 = Utility:AddNewRow(v159, "Graphics Mode", "Selector", {
			"Automatic",
			"Manual"
		}, n10)

		v217.GraphicsEnablerFrame = v220
		v218.GraphicsEnablerLabel = v221
		v219.GraphicsQualityEnabler = v222
		v159.GraphicsEnablerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsEnablerFrame

		local v223 = v159
		local v224 = v159
		local v225 = v159
		local v226, v227, v228 = Utility:AddNewRow(v159, "Graphics Quality", "Slider", 10, 1)

		v223.GraphicsQualityFrame = v226
		v224.GraphicsQualityLabel = v227
		v225.GraphicsQualitySlider = v228
		v159.GraphicsQualityFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.GraphicsQualityFrame
		v159.GraphicsQualitySlider:SetMinStep(1)

		if EngineFeature2 and not VRService.VREnabled then
			local v229 = table.clone(Constants.FramerateCaps)
			local t33 = { RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
				Frames = GameSettings:GetDefaultFramerateCap()
			}) }

			for __, v232 in v229 do
				table.insert(t33, RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
					Frames = v232
				}))
			end

			table.insert(v229, 1, -1)
			task.defer(function() -- line: 573
				-- upvalues: v159 (copy), Utility (copy), RobloxTranslator (copy), t33 (copy), v229 (copy), GameSettings (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local v662 = v159
				local v663 = v159
				local v664 = v159
				local v665, v666, v667 = Utility:AddNewRow(v159, RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate"), "DropDown", t33, table.find(v229, GameSettings.FramerateCap), nil, RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))

				v662.FramerateCapFrame = v665
				v663.FramerateCapLabel = v666
				v664.FramerateCapMode = v667
				v159.FramerateCapFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.FramerateCap
				v159.FramerateCapMode.IndexChanged:Connect(function(p81) -- line: 585
					-- upvalues: GameSettings (copy), v229 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
					local FramerateCap = GameSettings.FramerateCap

					GameSettings.FramerateCap = v229[p81]

					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						reportSettingsChangeForAnalytics("framerate_cap", FramerateCap, GameSettings.FramerateCap)
					end

					reportSettingsForAnalytics()
				end)
			end)
		end

		settings().Rendering.EnableFRM = true

		function SetGraphicsQuality(p82, p83) -- line: 603
			-- upvalues: v135 (copy), GfxReset (copy), GameSettings (copy)
			if v135 then
				local v670, v671 = GfxReset.TemporaryOverride(p82)

				if v670 then
					settings().Rendering.QualityLevel = v671

					return
				end
			end

			local v672 = p82 / 10
			local v673 = math.floor((settings().Rendering:GetMaxQualityLevel() - 1) * v672)

			if v673 == 20 then
				v673 = 21
			elseif p82 == 1 then
				v673 = 1
			elseif p82 < 1 and not p83 then
				p82 = 1
				v673 = 1
			elseif v673 > settings().Rendering:GetMaxQualityLevel() then
				v673 = settings().Rendering:GetMaxQualityLevel() - 1
			end

			GameSettings.SavedQualityLevel = p82
			settings().Rendering.QualityLevel = v673
		end

		local function setGraphicsToManual(p84) -- line: 637
			-- upvalues: v159 (copy)
			v159.GraphicsQualitySlider:SetZIndex(2)
			v159.GraphicsQualityLabel.ZIndex = 2
			v159.GraphicsQualitySlider:SetInteractable(true)

			if p84 == v159.GraphicsQualitySlider:GetValue() then
				SetGraphicsQuality(p84)

				return
			end

			v159.GraphicsQualitySlider:SetValue(p84)
		end

		local u234 = false

		v159.GraphicsQualitySlider.ValueChanged:connect(function(p85) -- line: 651
			-- upvalues: u234 (ref), reportSettingsForAnalytics (copy)
			SetGraphicsQuality(p85)

			if u234 == true then
				reportSettingsForAnalytics()
			end

			u234 = true
		end)
		v159.GraphicsQualityEnabler.IndexChanged:connect(function(p86) -- line: 659
			-- upvalues: v159 (copy), setGraphicsToManual (copy), reportSettingsForAnalytics (copy), reportSettingsChangeForAnalytics (copy)
			local t34 = {
				Automatic = {
					Name = "Automatic",
					Value = 1
				},
				Manual = {
					Name = "Manual",
					Value = 2
				}
			}
			local AutomaticName = t34.Automatic.Name
			local ManualName = t34.Manual.Name

			if p86 == t34.Automatic.Value then
				AutomaticName = t34.Manual.Name
				ManualName = t34.Automatic.Name
				v159.GraphicsQualitySlider:SetZIndex(1)
				v159.GraphicsQualityLabel.ZIndex = 1
				v159.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p86 == t34.Manual.Value then
				setGraphicsToManual(v159.GraphicsQualitySlider:GetValue())
			end

			reportSettingsForAnalytics()
			reportSettingsChangeForAnalytics("gfx_mode", AutomaticName, ManualName)
		end)
		game.GraphicsQualityChangeRequest:Connect(function(p87) -- line: 677
			-- upvalues: GameSettings (copy), v159 (copy)
			if GameSettings.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local Value = v159.GraphicsQualitySlider:GetValue()
				local v682 = if not p87 then Value - 1 else Value + 1

				v159.GraphicsQualitySlider:SetValue(v682)
			end
		end)

		if FastInt >= 0 then
			if FastInt == 0 then
				v159.GraphicsQualityEnabler:SetSelectionIndex(1)
				v159.GraphicsQualitySlider:SetZIndex(1)
				v159.GraphicsQualityLabel.ZIndex = 1
				v159.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			else
				v159.GraphicsQualityEnabler:SetSelectionIndex(2)
				setGraphicsToManual(FastInt)
			end
		elseif GameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			v159.GraphicsQualitySlider:SetValue(5)
			v159.GraphicsQualitySlider:SetZIndex(1)
			v159.GraphicsQualityLabel.ZIndex = 1
			v159.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		else
			local str = tostring(GameSettings.SavedQualityLevel)
			local u236 = not t1[str] and 10 or t1[str]

			SetGraphicsQuality(u236)
			spawn(function() -- line: 710
				-- upvalues: v159 (copy), u236 (ref)
				v159.GraphicsQualitySlider:SetValue(u236)
			end)
		end
	end)()

	if v48 and GetFFlagEnablePlayerNamesEnabledSetting() then
		(function() --[[ createPlayerNamesEnabledOptions ]] -- line: 749
			-- upvalues: v132 (copy), RobloxTranslator (copy), FFlagUpdatePeopleNamesSettingCopy (copy), GameSettings (copy), t7 (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v248 = if not v132 then if not FFlagUpdatePeopleNamesSettingCopy then RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames") else RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames") else RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames")
			local v249 = if not FFlagUpdatePeopleNamesSettingCopy then nil else RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description")
			local v250 = if not GameSettings.PlayerNamesEnabled then t7.Off else t7.On
			local v251 = if not v132 then RobloxTranslator:FormatByKey("InGame.CommonUI.Label.On") else RobloxTranslator:FormatByKey("Feature.SettingsHub.Label.Show")
			local v252 = if not v132 then RobloxTranslator:FormatByKey("InGame.CommonUI.Label.Off") else RobloxTranslator:FormatByKey("Feature.SettingsHub.Label.Hide")
			local v253 = v159
			local v254 = v159
			local v255 = v159
			local v256, v257, v258 = Utility:AddNewRow(v159, v248, "Selector", {
				v251,
				v252
			}, v250, nil, v249)

			v253.PlayerNamesEnabledFrame = v256
			v254.playerNamesEnabledLabel = v257
			v255.playerNamesEnabledMode = v258
			v159.PlayerNamesEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PlayerNamesEnabledFrame
			v159.playerNamesEnabledMode.IndexChanged:connect(function(p88) -- line: 776
				-- upvalues: GameSettings (copy), t7 (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local PlayerNamesEnabled = GameSettings.PlayerNamesEnabled

				GameSettings.PlayerNamesEnabled = p88 == t7.On
				reportSettingsChangeForAnalytics("player_names_enabled", PlayerNamesEnabled, GameSettings.PlayerNamesEnabled)
				reportSettingsForAnalytics()
			end)
		end)()
	end

	if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
		PlayerChoiceTranslationSettingInitializer(v159, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
	end

	if not isInExperienceUIVREnabled then
		createReducedMotionOptions()
		createPreferredTransparencyOptions()
	end;

	(function() --[[ createPreferredTextSizeOptions ]] -- line: 823
		-- upvalues: GameSettings (copy), RobloxTranslator (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local EnumItems = Enum.PreferredTextSize:GetEnumItems()
		local v271 = GameSettings.PreferredTextSize.Value - 1
		local v272 = RobloxTranslator:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize")
		local v273 = RobloxTranslator:FormatByKey("Feature.Accessibility.Description.PreferredTextSize")
		local v274 = RobloxTranslator:FormatByKey("Feature.Accessibility.PreferredTextSize.Default")
		local v275 = RobloxTranslator:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest")
		local v276 = v159
		local v277 = v159
		local v278 = v159
		local v279, v280, v281 = Utility:AddNewRow(v159, v272, "Slider", 3, v271, nil, v273, v274, v275)

		v276.PreferredTextSizeFrame = v279
		v277.PreferredTextSizeLabel = v280
		v278.PreferredTextSizeSlider = v281
		v159.PreferredTextSizeFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PreferredTextSizeFrame
		v159.PreferredTextSizeSlider.ValueChanged:connect(function(p89) -- line: 848
			-- upvalues: GameSettings (copy), EnumItems (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local PreferredTextSize = GameSettings.PreferredTextSize

			GameSettings.PreferredTextSize = EnumItems[p89 + 1]

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("preferred_text_size", PreferredTextSize, GameSettings.PreferredTextSize)
			end

			reportSettingsForAnalytics()
		end)
	end)();
	(function() --[[ createUiNavigationKeyBindOptions ]] -- line: 858
		-- upvalues: GameSettings (copy), RobloxTranslator (copy), UserInputService (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
		local t35 = {
			On = 1,
			Off = 2
		}
		local Off = t35.Off

		if GameSettings.UiNavigationKeyBindEnabled then
			Off = t35.On
		end

		local v284 = RobloxTranslator:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind")
		local v285 = RobloxTranslator:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			uiNavigationKey = UserInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})
		local v286 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.On")
		local v287 = RobloxTranslator:FormatByKey("InGame.CommonUI.Label.Off")
		local v288 = v159
		local v289 = v159
		local v290 = v159
		local v291, v292, v293 = Utility:AddNewRow(v159, v284, "Selector", {
			v286,
			v287
		}, Off, nil, v285)

		v288.UiNavigationKeyBindEnabledFrame = v291
		v289.UiNavigationKeyBindEnabledLabel = v292
		v290.UiNavigationKeyBindEnabledMode = v293
		v159.UiNavigationKeyBindEnabledFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.UiNavigationKeyBindEnabledFrame
		v159.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p90) -- line: 889
			-- upvalues: GameSettings (copy), t35 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local UiNavigationKeyBindEnabled = GameSettings.UiNavigationKeyBindEnabled

			GameSettings.UiNavigationKeyBindEnabled = p90 == t35.On

			if GetFFlagEnableExplicitSettingsChangeAnalytics() then
				reportSettingsChangeForAnalytics("ui_navigation_key_bind_enabled", UiNavigationKeyBindEnabled, GameSettings.UiNavigationKeyBindEnabled)
			end

			reportSettingsForAnalytics()
		end)

		local KeyboardEnabled = UserInputService.KeyboardEnabled

		if v159.UiNavigationKeyBindEnabledFrame then
			v159.UiNavigationKeyBindEnabledFrame.Visible = KeyboardEnabled

			if KeyboardEnabled then
				v159.UiNavigationKeyBindEnabledMode:SetSelectionIndex(GameSettings.UiNavigationKeyBindEnabled and t35.On or t35.Off)
			else
				v159.UiNavigationKeyBindEnabledMode:SetSelectionIndex(t35.Off)
				GameSettings.UiNavigationKeyBindEnabled = false
			end
		end

		UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() -- line: 917
			-- upvalues: UserInputService (copy), v159 (copy), GameSettings (copy), t35 (copy)
			local KeyboardEnabled2 = UserInputService.KeyboardEnabled

			if v159.UiNavigationKeyBindEnabledFrame then
				v159.UiNavigationKeyBindEnabledFrame.Visible = KeyboardEnabled2

				if KeyboardEnabled2 then
					v159.UiNavigationKeyBindEnabledMode:SetSelectionIndex(GameSettings.UiNavigationKeyBindEnabled and t35.On or t35.Off)

					return
				end

				v159.UiNavigationKeyBindEnabledMode:SetSelectionIndex(t35.Off)
				GameSettings.UiNavigationKeyBindEnabled = false
			end
		end)
	end)()

	if not CachedPolicyService:IsSubjectToChinaPolicies() then
		(function() --[[ createPerformanceStatsOptions ]] -- line: 922
			-- upvalues: v159 (copy), GameSettings (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), Create (copy), Theme (copy), v56 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
			local v295 = v159
			local v296 = v159
			local v297 = v159
			local v298 = v159

			v295.PerformanceStatsFrame = nil
			v296.PerformanceStatsLabel = nil
			v297.PerformanceStatsMode = nil
			v298.PerformanceStatsOverrideText = nil

			function GetDesiredPerformanceStatsIndex() -- line: 928
				-- upvalues: GameSettings (copy)
				if GameSettings.PerformanceStatsVisible then
					return 1
				end

				return 2
			end

			local v299 = GetDesiredPerformanceStatsIndex()
			local v300 = v159
			local v301 = v159
			local v302 = v159
			local v303, v304, v305 = Utility:AddNewRow(v159, "Performance Stats", "Selector", {
				"On",
				"Off"
			}, v299)

			v300.PerformanceStatsFrame = v303
			v301.PerformanceStatsLabel = v304
			v302.PerformanceStatsMode = v305
			v159.PerformanceStatsFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.PerformanceStatsFrame
			v159.PerformanceStatsOverrideText = Create("TextLabel")({
				Name = "PerformanceStatsLabel",
				Text = "Set by Developer",
				TextColor3 = Color3.new(1, 1, 1),
				Font = Theme.font(Enum.Font.SourceSans, "GameSettings"),
				FontSize = Theme.fontSize(Enum.FontSize.Size24, "GameSettings"),
				BackgroundTransparency = 1,
				Size = if not v56 then UDim2.new(0, 200, 1, 0) else UDim2.new(0.6, 0, 1, 0),
				Position = if not v56 then UDim2.new(1, -350, 0, 0) else UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = if not v56 then nil else Vector2.new(1, 0.5),
				Visible = false,
				ZIndex = 2,
				Parent = v159.PerformanceStatsFrame
			})
			v159.PerformanceStatsMode.IndexChanged:connect(function(p91) -- line: 957
				-- upvalues: GetFFlagEnableExplicitSettingsChangeAnalytics (copy), GameSettings (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local PerformanceStatsVisible = nil

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					PerformanceStatsVisible = GameSettings.PerformanceStatsVisible
				end

				if p91 == 1 then
					GameSettings.PerformanceStatsVisible = true
				else
					GameSettings.PerformanceStatsVisible = false
				end

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					reportSettingsChangeForAnalytics("show_performance_stats", PerformanceStatsVisible, GameSettings.PerformanceStatsVisible)
				end

				reportSettingsForAnalytics()
			end)
			GameSettings.PerformanceStatsVisibleChanged:connect(function() -- line: 979
				-- upvalues: v159 (copy)
				local v698 = GetDesiredPerformanceStatsIndex()

				if v698 ~= v159.PerformanceStatsMode.CurrentIndex then
					v159.PerformanceStatsMode:SetSelectionIndex(v698)
				end
			end)
		end)()
	end

	if v116 then
		(function() --[[ createMicroProfilerOptions ]] -- line: 1029
			-- upvalues: v159 (copy), GameSettings (copy), createWebServerInformationRow (copy), v115 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), v114 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), RbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy), RobloxTranslator (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local v312 = v159
			local v313 = v159
			local v314 = v159
			local v315 = v159

			v312.MicroProfilerFrame = nil
			v313.MicroProfilerLabel = nil
			v314.MicroProfilerMode = nil
			v315.MicroProfilerOverrideText = nil

			local function setMicroProfilerIndex(p92) -- line: 1046
				-- upvalues: GameSettings (copy), v159 (copy), v115 (copy), GetFFlagEnableExplicitSettingsChangeAnalytics (copy), createWebServerInformationRow (copy), v114 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), RbxAnalyticsService (copy), reportSettingsChangeForAnalytics (copy), reportSettingsForAnalytics (copy)
				local s11 = nil
				local MicroProfilerWebServerEnabled = nil
				local MicroProfilerWebServerEnabled2 = nil

				if v115 then
					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						s11 = "webserver"
						MicroProfilerWebServerEnabled = GameSettings.MicroProfilerWebServerEnabled
					end

					if p92 == 1 then
						GameSettings.MicroProfilerWebServerEnabled = true

						local n11 = 30

						while n11 >= 1 do
							local MicroProfilerWebServerPort = GameSettings.MicroProfilerWebServerPort
							local v714

							if MicroProfilerWebServerPort ~= 0 then
								local v710 = v159
								local v711 = v159
								local v712, v713 = createWebServerInformationRow()

								v710.InformationFrame = v712
								v711.InformationText = v713
								v159.InformationText.Text = GameSettings.MicroProfilerWebServerIP .. MicroProfilerWebServerPort
								v714 = true
							else
								v714 = false
							end

							if v714 then
								break
							end

							n11 -= 1
							wait(0.1)
						end

						if n11 <= 0 then
							v159.MicroProfilerMode:SetSelectionIndex(2)
							GameSettings.MicroProfilerWebServerEnabled = false

							if v159.InformationFrame or v159.InformationText then
								v159.InformationFrame.Visible = false
								v159.InformationFrame.Parent = nil
								v159.InformationText.Parent = nil
								v159.InformationFrame = nil
								v159.InformationText = nil
							end
						end
					else
						GameSettings.MicroProfilerWebServerEnabled = false

						if v159.InformationFrame or v159.InformationText then
							v159.InformationFrame.Visible = false
							v159.InformationFrame.Parent = nil
							v159.InformationText.Parent = nil
							v159.InformationFrame = nil
							v159.InformationText = nil
						end
					end

					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						MicroProfilerWebServerEnabled2 = GameSettings.MicroProfilerWebServerEnabled
					end
				elseif v114 or isInExperienceUIVREnabled and isSpatial() then
					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						s11 = "regular"
						MicroProfilerWebServerEnabled = GameSettings.OnScreenProfilerEnabled
					end

					GameSettings.OnScreenProfilerEnabled = p92 == 1

					if GetFFlagEnableExplicitSettingsChangeAnalytics() then
						MicroProfilerWebServerEnabled2 = GameSettings.OnScreenProfilerEnabled
					end
				end

				RbxAnalyticsService:ReportCounter("MicroprofilerSettingsPressed")

				if GetFFlagEnableExplicitSettingsChangeAnalytics() then
					reportSettingsChangeForAnalytics("microprofiler_enabled", MicroProfilerWebServerEnabled, MicroProfilerWebServerEnabled2, {
						microprofiler_type = s11
					})
				end

				reportSettingsForAnalytics()
			end

			local v317 = if not v115 then not v114 and (not isInExperienceUIVREnabled or not isSpatial()) and 2 or (not GameSettings.OnScreenProfilerEnabled and 2 or 1) else not GameSettings.MicroProfilerWebServerEnabled and 2 or 1
			local v318 = RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler")
			local v319 = v159
			local v320 = v159
			local v321 = v159
			local v322, v323, v324 = Utility:AddNewRow(v159, v318, "Selector", {
				"On",
				"Off"
			}, v317)

			v319.MicroProfilerFrame = v322
			v320.MicroProfilerLabel = v323
			v321.MicroProfilerMode = v324
			v159.MicroProfilerFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.MicroProfilerFrame

			local MicroProfilerWebServerPort = GameSettings.MicroProfilerWebServerPort

			if MicroProfilerWebServerPort ~= 0 then
				local v326 = v159
				local v327 = v159
				local v328, v329 = createWebServerInformationRow()

				v326.InformationFrame = v328
				v327.InformationText = v329
				v159.InformationText.Text = GameSettings.MicroProfilerWebServerIP .. MicroProfilerWebServerPort
			end

			local u330 = false

			GameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() -- line: 1149
				-- upvalues: u330 (ref), GameSettings (copy), v159 (copy)
				u330 = true

				if GameSettings.OnScreenProfilerEnabled then
					v159.MicroProfilerMode:SetSelectionIndex(1)

					return
				end

				v159.MicroProfilerMode:SetSelectionIndex(2)
			end)
			v159.MicroProfilerMode.IndexChanged:connect(function(...) --[[ onIndexChanged ]] -- line: 1159
				-- upvalues: u330 (ref), setMicroProfilerIndex (copy)
				if u330 then
					u330 = false

					return
				end

				setMicroProfilerIndex(...)
			end)
		end)()
	end

	if v102 and getAppFeaturePolicies().getSupportsOverscan() then
		(function() --[[ createOverscanOption ]] -- line: 2729
			-- upvalues: RobloxGui (copy), CorePackages (copy), ContextActionService (copy), Utility (copy), v159 (copy), Theme (copy), RunService (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local v465, v466, v467 = Utility:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), function() -- line: 2730
				-- upvalues: RobloxGui (copy), CorePackages (copy), ContextActionService (copy)
				local SettingsHub = require(RobloxGui.Modules.Settings.SettingsHub)
				local Overscan = require(RobloxGui.Modules.Shell.Components.Overscan10ft.Overscan)
				local v885 = require(RobloxGui.Modules.Settings.Components.OverscanWrapper)(Overscan)
				local Roact = require(CorePackages.Packages.Roact)
				local u887 = nil
				local t36 = {
					onUnmount = function() -- line: 2741
						-- upvalues: u887 (ref), Roact (copy), ContextActionService (copy), SettingsHub (copy)
						if u887 then
							Roact.unmount(u887)
							ContextActionService:UnbindCoreAction("RbxStopOverscanMovement")
							SettingsHub:SetVisibility(true, true)
						end
					end,
					ImageVisible = false,
					BackgroundTransparency = 0.2
				}

				SettingsHub:SetVisibility(false, true)
				ContextActionService:BindCoreAction("RbxStopOverscanMovement", function() -- line: 2757
				end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)

				local v889 = Roact.createElement(v885, t36)

				u887 = Roact.mount(v889, RobloxGui, (tostring(v885)))
			end, v159)

			v466.Font = Theme.font(Enum.Font.SourceSans)
			v465.Position = UDim2.new(1, -400, 0, 12)
			v465.Size = UDim2.new(0, 300, 0, 40)
			v465.Position = UDim2.new(1, -400, 0.5, 0)
			v465.AnchorPoint = Vector2.new(0, 0.5)

			if RunService:IsStudio() then
				v465.Selectable = false
				v465.Active = false
				v465.Enabled.Value = false
				v466.TextColor3 = Color3.fromRGB(100, 100, 100)
			end

			local v468 = Utility:AddNewRowObject(v159, "Safe Zone", v465)

			v468.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.OverscanAdjustButton
			v467(v468)
		end)()
	end

	if v48 and FFlagBadgeVisibilitySettingEnabled then
		spawn(function() -- line: 3120
			-- upvalues: PlayerPermissionsModule (copy), LocalPlayer (copy), RobloxTranslator (copy), v132 (copy), v159 (copy), Utility (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), GameSettings (copy)
			local n12 = 2

			if PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(LocalPlayer) then
				n12 = 1
			end

			local v643 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Label.Show")
			local v644 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Label.Hide")
			local v645 = if not v132 then RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges") else RobloxTranslator:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges")
			local v646 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Description.PeoplesNames")
			local v647 = v159
			local v648 = v159
			local v649 = v159
			local v650, v651, v652 = Utility:AddNewRow(v159, v645, "Selector", {
				v644,
				v643
			}, n12, nil, v646)

			v647.badgeVisibleRow = v650
			v648.badgeVisibleFrame = v651
			v649.badgeVisibleSelector = v652
			v159.badgeVisibleRow.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.BadgeVisibilityFrame
			v159.badgeVisibleSelector.IndexChanged:connect(function(p93) -- line: 3134
				-- upvalues: GameSettings (copy), PlayerPermissionsModule (copy), LocalPlayer (copy)
				GameSettings.BadgeVisible = p93 == 2
				PlayerPermissionsModule.SetPlayerInExperienceNameEnabled(LocalPlayer, p93 == 1)
			end)
		end)
	end

	if FFlagEnableModerateChatRemoteEvent then
		(function() --[[ createChatModerationOptions ]] -- line: 3141
			-- upvalues: v159 (copy), Utility (copy), u25 (ref), SETTINGS_MENU_LAYOUT_ORDER (copy), CorePackages (copy), Signals (copy), reportSettingsChangeForAnalytics (copy)
			local t37 = {
				title = "CoreScripts.InGameMenu.GameSettings.ReadOnlyView",
				description = "CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription",
				on = "InGame.CommonUI.Label.On",
				off = "InGame.CommonUI.Label.Off"
			}
			local v530 = v159
			local v531 = v159
			local v532, v533, v534 = Utility:AddNewRow(v159, u25:Format(t37.title), "Selector", {
				u25:Format(t37.off),
				u25:Format(t37.on)
			}, 1, nil, u25:Format(t37.description))

			v530.ChatModerationFrame = v532
			_ = v533
			v531.ChatModerationSelector = v534
			v159.ChatModerationFrame.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ChatModerationFrame
			v159.ChatModerationFrame.Visible = false

			local v535 = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)

			v159.ChatModerationDisposeEffect = Signals.createEffect(function(p94) -- line: 3165
				-- upvalues: v159 (copy), v535 (copy)
				v159.ChatModerationFrame.Visible = v535.getIsSettingVisible(p94)

				local v920 = not v535.getIsSettingEnabled(p94) and 1 or 2

				if v920 ~= v159.ChatModerationSelector:GetSelectedIndex() then
					v159.ChatModerationSelector:SetSelectionIndex(v920)
				end
			end)
			v159.ChatModerationSelector.IndexChanged:connect(function(p95) -- line: 3174
				-- upvalues: v535 (copy), reportSettingsChangeForAnalytics (copy)
				local v922 = p95 == 2

				v535.setIsSettingEnabled(v922)
				reportSettingsChangeForAnalytics("moderate_chat", not v922, v922)
			end)
			v535.initialize()
		end)()
	end;

	(function() --[[ createDeveloperConsoleOption ]] -- line: 2796
		-- upvalues: reportSettingsChangeForAnalytics (copy), v125 (copy), Utility (copy), v159 (copy), Theme (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), RunService (copy), PlayerPermissionsModule (copy), Players (copy)
		local function makeDevConsoleOption() -- line: 2798
			-- upvalues: reportSettingsChangeForAnalytics (copy), v125 (copy), Utility (copy), v159 (copy), Theme (copy), SETTINGS_MENU_LAYOUT_ORDER (copy)
			local function onOpenDevConsole() -- line: 2799
				-- upvalues: reportSettingsChangeForAnalytics (copy)
				local DevConsoleMaster = require(script.Parent.Parent.Parent.DevConsoleMaster)

				if DevConsoleMaster then
					DevConsoleMaster:SetVisibility(true)

					local SettingsHub = require(script.Parent.Parent.SettingsHub)

					if SettingsHub then
						SettingsHub:SetVisibility(false)
					end

					reportSettingsChangeForAnalytics("dev_console", "", "pressed")
				end
			end

			if v125 then
				local v891, v892, v893 = Utility:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), onOpenDevConsole, v159)

				v892.Font = Theme.font(Enum.Font.SourceSans)
				v891.Size = UDim2.new(0.6, -10, 0, 35)
				v891.Position = UDim2.new(0.4, 10, 0.5, 0)
				v891.AnchorPoint = Vector2.new(0, 0.5)

				local v894 = Utility:AddNewRowObject(v159, "Developer Console", v891, nil, true)

				v894.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
				v893(v894)

				return
			end

			local v895, v896, v897 = Utility:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), onOpenDevConsole, v159)

			v896.Font = Theme.font(Enum.Font.SourceSans)
			v895.Size = UDim2.new(0.6, -10, 0, 35)
			v895.Position = UDim2.new(1, -400, 0.5, 0)
			v895.AnchorPoint = Vector2.new(0, 0.5)

			local v898 = Utility:AddNewRowObject(v159, "Developer Console", v895)

			v898.LayoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DeveloperConsoleButton
			v897(v898)
		end

		if RunService:IsStudio() then
			makeDevConsoleOption()

			return
		end

		spawn(function() -- line: 2851
			-- upvalues: PlayerPermissionsModule (copy), Players (copy), makeDevConsoleOption (copy)
			if PlayerPermissionsModule.CanPlayerManagePlaceAsync(Players.LocalPlayer) then
				makeDevConsoleOption()
			end
		end)
	end)()
	GetHasGuiHidingPermission(RunService:IsStudio(), LocalPlayer, PlayerPermissionsModule):andThen(function(p96) -- line: 4248
		-- upvalues: createUiToggleOptions (copy)
		if p96 then
			createUiToggleOptions()
		end
	end):catch(function(p97) -- line: 4253
		warn(p97)
	end)
	u160 = true

	if VRService.VREnabled then
		local VREnabled = VRService.VREnabled

		for k, __ in pairs(t10) do
			k.Visible = not VREnabled
		end
	end

	if FFlagIEMSettingsGroups then
		v159.AudioHeader = renderSettingsHeader({
			headerText = "CoreScripts.InGameMenu.GameSettings.AudioHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AudioHeader,
			parent = v159.Page
		})
		v159.AudioDivider = renderSettingsDivider({
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.AudioDivider,
			parent = v159.Page
		})
		v159.DisplayHeader = renderSettingsHeader({
			headerText = "CoreScripts.InGameMenu.GameSettings.DisplayHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DisplayHeader,
			parent = v159.Page
		})
		v159.DisplayDivider = renderSettingsDivider({
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.DisplayDivider,
			parent = v159.Page
		})

		if not isSpatial() then
			v159.LanguageHeader = renderSettingsHeader({
				headerText = "CoreScripts.InGameMenu.GameSettings.LanguageHeader",
				layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageHeader,
				parent = v159.Page
			})
			v159.LanguageDivider = renderSettingsDivider({
				layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.LanguageDivider,
				parent = v159.Page
			})
		end

		v159.ViewAndControlsHeader = renderSettingsHeader({
			headerText = "CoreScripts.InGameMenu.GameSettings.ViewandControlsHeader",
			layoutOrder = SETTINGS_MENU_LAYOUT_ORDER.ViewAndControlsHeader,
			parent = v159.Page
		})
	end

	v159.TabHeader.Name = "GameSettingsTab"

	local v202 = Migration.uiblox["icons/common/settings"]

	v159.TabHeader.TabLabel.Icon.Text = v202.name
	v159.TabHeader.TabLabel.Icon.FontFace = BuilderIcons.Font[v202.variant]
	v159.TabHeader.TabLabel.Title.Text = "Settings"
	v159.Page.ZIndex = 5

	if v159.PageListLayout then
		v159.PageListLayout.Padding = UDim.new(0, 0)
	end

	v159.PageOpen = false

	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		v159.FeedbackEntryPointEnabled = true
	end

	function v159.OpenSettingsPage() -- line: 4338
		-- upvalues: v159 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), updateAudioOptions (copy), SoundService (copy), connection (ref), GameSettings (copy), GetFFlagSelfViewCameraSettings (copy), updateCameraDevices (copy), VideoCaptureService (copy), connection2 (ref), updateUiToggleSelection (copy), ExperienceStateCaptureService (ref), v77 (copy), Theme (copy), v76 (copy), FFlagIEMFocusNavToButtons (copy), getLastValueChangerFrame (copy), FFlagIEMTabFocusNav (copy), getFirstValueChangerFrame (copy)
		v159.PageOpen = true

		if isInExperienceUIVREnabled and isSpatial() then
			return
		end

		updateAudioOptions()

		if SoundService.DeviceListChanged then
			connection = SoundService.DeviceListChanged:Connect(function() -- line: 3428
				-- upvalues: v159 (copy), updateAudioOptions (copy)
				if v159.PageOpen then
					updateAudioOptions()
				end
			end)
		end

		v159.startVolume = GameSettings.MasterVolume

		if GetFFlagSelfViewCameraSettings() and v159.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService") then
			updateCameraDevices()

			if VideoCaptureService.DevicesChanged then
				connection2 = VideoCaptureService.DevicesChanged:Connect(function() -- line: 3438
					-- upvalues: v159 (copy), updateCameraDevices (copy)
					if v159.PageOpen then
						updateCameraDevices()
					end
				end)
			end
		end

		updateUiToggleSelection()

		if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and v159.toggleFeedbackModeButton and v159.toggleFeedbackModeText then
			v159.FeedbackEntryPointEnabled = ExperienceStateCaptureService ~= nil and ExperienceStateCaptureService:CanEnterCaptureMode()

			if v159.FeedbackEntryPointEnabled then
				v159.toggleFeedbackModeButton.Active = true
				v159.toggleFeedbackModeButton.Enabled.Value = true
				v159.toggleFeedbackModeText.Text = v77
			else
				v159.toggleFeedbackModeButton.Active = false
				v159.toggleFeedbackModeButton.Enabled.Value = false
				v159.toggleFeedbackModeText.TextColor3 = Theme.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
				v159.toggleFeedbackModeText.Text = v76
			end
		end

		if FFlagIEMFocusNavToButtons then
			table.insert(v159.LastSelectableObjects, getLastValueChangerFrame(v159))
		end

		if FFlagIEMTabFocusNav then
			table.insert(v159.FirstSelectableObjects, getFirstValueChangerFrame(v159))
			v159.FirstSelectableObjectsUpdated:fire()
		end
	end
	function v159.CloseSettingsPage() -- line: 4395
		-- upvalues: v159 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), SoundService (copy), connection (ref), GetFFlagEnableCrossExpVoice (copy), u193 (ref), GetFFlagSelfViewCameraSettings (copy), VideoCaptureService (copy), connection2 (ref), u194 (ref), default3 (copy)
		v159.PageOpen = false

		if isInExperienceUIVREnabled and isSpatial() then
			return
		end

		if SoundService.DeviceListChanged and connection then
			connection:Disconnect()
		end

		if GetFFlagEnableCrossExpVoice() and u193 then
			u193()
		end

		if GetFFlagSelfViewCameraSettings() then
			if game:GetEngineFeature("VideoCaptureService") and VideoCaptureService.DevicesChanged and connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if u194 then
				u194:disconnect()
				u194 = nil
			end
		end

		if game:GetEngineFeature("VoiceChatSupported") and v159.VoiceChatOptionsEnabled and v159.startVolume ~= nil and v159.startVolume > 0 then
			default3:CheckAndShowNotAudiblePrompt()
		end
	end
	function isLangaugeSelectionDropdownEnabled() -- line: 4428
		-- upvalues: LocalPlayer (copy)
		if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
			return false
		end

		if LocalPlayer.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
			return true
		end

		for match in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
			if tonumber(match) == LocalPlayer.UserId then
				return true
			end
		end

		return false
	end
	function v159.SetHub(__, p99) -- line: 4451
		-- upvalues: v159 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), GetFFlagEnableLocalesForExperienceLanguageSwitcher (copy), ExperienceLanguageSwitcherInitializer (copy), SETTINGS_MENU_LAYOUT_ORDER (copy), reportSettingsChangeForAnalytics (copy), createTranslationOptions (copy), GetFFlagChatTranslationSettingEnabled (copy), GetFFlagChatTranslationHoldoutEnabled (copy), GetFStringChatTranslationLayerName (copy), getChatTranslationLayerData (copy), EngineFeature (copy), GetFFlagChatTranslationNewDefaults (copy), GameSettings (copy), TextChatService (copy), GetFFlagChatTranslationForceSetting (copy), ChatTranslationOptionsWithChatLanguageSwitcherInitializer (copy), RunService (copy), v126 (copy), v102 (copy), createFeedbackModeOptions (copy)
		v159.HubRef = p99

		if isInExperienceUIVREnabled and isSpatial() then
			return
		end

		if isLangaugeSelectionDropdownEnabled() then
			if GetFFlagEnableLocalesForExperienceLanguageSwitcher() then
				ExperienceLanguageSwitcherInitializer(v159, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
			else
				createTranslationOptions()
			end
		end

		if game:GetEngineFeature("EnableTCSChatTranslation") and GetFFlagChatTranslationSettingEnabled() then
			if GetFFlagChatTranslationHoldoutEnabled() then
				local v658 = GetFStringChatTranslationLayerName()

				if not getChatTranslationLayerData(v658).ChatTranslationEnabled then
					if EngineFeature then
						if GetFFlagChatTranslationNewDefaults() then
							if GameSettings.ChatTranslationLocale == "" then
								GameSettings.ChatTranslationEnabled = false
								GameSettings.ChatTranslationLocale = "en_us"
							end
						else
							GameSettings.ChatTranslationEnabled = false
						end
					else
						pcall(function() -- line: 4487
							-- upvalues: TextChatService (copy)
							TextChatService.ChatTranslationEnabled = false
						end)
					end
				elseif GetFFlagChatTranslationForceSetting() then
					GameSettings.ChatTranslationEnabled = true
				end
			end

			ChatTranslationOptionsWithChatLanguageSwitcherInitializer(v159, SETTINGS_MENU_LAYOUT_ORDER, reportSettingsChangeForAnalytics)
		end

		if not RunService:IsStudio() and (game:GetEngineFeature("CaptureModeEnabled") ~= false and (not v126 or not v102)) then
			createFeedbackModeOptions()
		end
	end

	return v159
end)())
