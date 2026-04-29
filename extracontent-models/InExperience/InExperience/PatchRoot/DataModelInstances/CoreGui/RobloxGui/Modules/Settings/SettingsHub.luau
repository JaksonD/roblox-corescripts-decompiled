local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v5 = if not FFlagEnableNewBackpack then nil else require(CorePackages.Workspace.Packages.System).Features
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local TelemetryService = game:GetService("TelemetryService")
local EngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local v14 = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local Roact = require(CorePackages.Packages.Roact)
local Cryo = require(CorePackages.Packages.Cryo)
local Otter = require(CorePackages.Packages.Otter)
local React = require(CorePackages.Packages.React)
local ReactRoblox = require(CorePackages.Packages.ReactRoblox)
local Foundation = require(CorePackages.Packages.Foundation)
local FoundationProvider = Foundation.FoundationProvider
local Traversal = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local PortalWithFoundationStylelink = require(script.Parent.Components.PortalWithFoundationStylelink)
local InExperienceMenuReact = require(script.Parent.InExperienceMenuReact)
local InExperienceMenuReactPage = require(script.Parent.Pages.InExperienceMenuReactPage)
local ReactPageSignal = require(script.Parent.ReactPageSignal)
local Utils = require(script.Parent.Integrations.Utils)
local Utility = require(RobloxGui.Modules.Settings.Utility)
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local CachedPolicyService = require(CorePackages.Workspace.Packages.CachedPolicyService)
local PerfUtils = require(RobloxGui.Modules.Common.PerfUtils)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local isSubjectToDesktopPolicies = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local SwitchTabHint = require(RobloxGui.Modules.Settings.Components.TabHeader).SwitchTabHint
local TraversalHistoryMenu = require(RobloxGui.Modules.Settings.Components.Traversal).TraversalHistoryMenu
local MenuBackButton = require(RobloxGui.Modules.Settings.Components.MenuBackButton)
local MenuFrontButton = require(RobloxGui.Modules.Settings.Components.MenuFrontButton)
local MenuButtonsContainer = require(RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local getCamMicPermissions = require(CoreGui.RobloxGui.Modules.Settings.getCamMicPermissions)
local Create = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local Signals = require(CorePackages.Packages.Signals)
local createSignal = Signals.createSignal
local AppStyleProvider = require(CorePackages.Packages.UIBlox).App.Style.AppStyleProvider
local Dark = require(CorePackages.Packages.UIBlox).App.Style.Constants.ThemeName.Dark
local PlayerList = require(CorePackages.Workspace.Packages.PlayerList)
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local HelpPage = require(CorePackages.Workspace.Packages.HelpPage)
local Theme = require(script.Parent.Theme)
local v55 = Theme.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902))
local v56 = Theme.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2)
local SHIELD_INACTIVE_POSITION = Theme.SHIELD_INACTIVE_POSITION
local v58 = Symbol.named("SettingsHubCursorOverride")
local v59 = if not v14 then not Utility:IsSmallTouchScreen() and 26 or 24 else 32
local v60 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300)
local v61 = game:DefineFastInt("GetServerChannelRetries", 10)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local Flags = require(script.Parent.Flags)
local t1 = {
	EngineFeatureRbxAnalyticsServiceExposePlaySessionId = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId"),
	EngineFeatureTeleportHistoryButtons = game:GetEngineFeature("TeleportHistoryButtons"),
	FFlagRemoveRecordPage = game:DefineFastFlag("RemoveRecordPage", false),
	FFlagPreventHiddenSwitchPage = game:DefineFastFlag("PreventHiddenSwitchPage", false),
	FFlagLuaEnableGameInviteModalSettingsHub = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false),
	FFlagFixDisableTopPaddingError = game:DefineFastFlag("FixDisableTopPaddingError", false),
	GetFFlagLuaInExperienceCoreScriptsGameInviteUnification = require(RobloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification),
	FFlagEnableInGameMenuDurationLogger = require(RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)(),
	isNewInGameMenuEnabled = require(RobloxGui.Modules.isNewInGameMenuEnabled),
	GetFFlagRemoveAssetVersionEndpoint = require(RobloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint),
	GetFFlagNewEventIngestPlayerScriptsDimensions = require(RobloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions),
	GetFFlagReportAbuseMenuEntrypointAnalytics = require(RobloxGui.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics),
	GetFFlagEnableLeaveGameUpsellEntrypoint = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint),
	GetFStringInExperienceMenuIXPLayer = require(RobloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer),
	GetFStringInExperienceMenuIXPVar = require(RobloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPVar),
	FFlagRelocateMobileMenuButtons = require(RobloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons),
	FIntRelocateMobileMenuButtonsVariant = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant),
	FFlagMenuButtonsMountWithIEM = require(RobloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM),
	FFlagSpatialUIFixMenuPanelChatExclusive = require(RobloxGui.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive),
	FFlagRemoveLoadingTimeout = require(RobloxGui.Modules.Flags.FFlagRemoveLoadingTimeout),
	FFlagAddNextUpContainer = require(RobloxGui.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer),
	FFlagAddNewPlayerListMobileFocusNav = PlayerList.Flags.FFlagAddNewPlayerListMobileFocusNav,
	ChromeEnabled = require(CorePackages.Workspace.Packages.Chrome).Enabled(),
	FFlagRespawnChromeShortcutTelemetry = require(RobloxGui.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry),
	FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"),
	isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled,
	InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP,
	FFlagAddSwitchTabHintsToIEM = SharedFlags.FFlagAddSwitchTabHintsToIEM,
	GetFStringGameInviteMenuLayer = SharedFlags.GetFStringGameInviteMenuLayer,
	GetFFlagEnableAppChatInExperience = SharedFlags.GetFFlagEnableAppChatInExperience,
	GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = SharedFlags.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints,
	GetFFlagDisplayServerChannel = SharedFlags.GetFFlagDisplayServerChannel,
	FFlagSettingsHubIndependentBackgroundVisibility = SharedFlags.getFFlagSettingsHubIndependentBackgroundVisibility(),
	GetFFlagPackagifySettingsShowSignal = SharedFlags.GetFFlagPackagifySettingsShowSignal,
	FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls,
	FFlagIEMFocusNavToButtons = SharedFlags.FFlagIEMFocusNavToButtons,
	FFlagIEMTabFocusNav = SharedFlags.FFlagIEMTabFocusNav,
	FFlagIEMFocusNavSupportNewButtons = Flags.FFlagIEMFocusNavSupportNewButtons,
	FFlagIEMResumeButtonPressBugfix = SharedFlags.FFlagIEMResumeButtonPressBugfix,
	FFlagAddUILessMode = SharedFlags.FFlagAddUILessMode,
	FIntAddUILessModeVariant = SharedFlags.FIntAddUILessModeVariant,
	FFlagInExperienceReportClosingBugfix = SharedFlags.FFlagInExperienceReportClosingBugfix,
	FFlagEnableSettingsHubUIDelegateRollout = SharedFlags.FFlagEnableSettingsHubUIDelegateRollout,
	FFlagAddIEMProfilePage = SharedFlags.FFlagAddIEMProfilePage,
	FFlagFixSpatialUICaptures = SharedFlags.FFlagFixSpatialUICaptures,
	FFlagVoiceRewarmTelemetry = SharedFlags.FFlagVoiceRewarmTelemetry,
	FFlagSetUnibarShortcutOnTopBarFocus = require(CorePackages.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus,
	FFlagAddTraversalBackButton = Traversal.Flags.FFlagAddTraversalBackButton,
	FFlagAddTraversalHistory = Traversal.Flags.FFlagAddTraversalHistory,
	FFlagTraversalPerfFixes = Traversal.Flags.FFlagTraversalPerfFixes,
	FFlagCreateInExperienceMenuReact = Flags.FFlagCreateInExperienceMenuReact,
	FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false),
	FFlagHelpPageIXPExposure = HelpPage.Flags.FFlagHelpPageIXPExposure,
	FStringHelpPageIXPLayer = HelpPage.Flags.FStringHelpPageIXPLayer,
	FFlagMenuButtonsCheckVisibilityBeforeMount = true,
	FFlagMenuButtonsSkipAnimation = game:DefineFastFlag("MenuButtonsSkipAnimation", false),
	FFlagAddAbilityToDisableIGMScroll = SharedFlags.FFlagAddAbilityToDisableIGMScroll
}
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local GameSettings = UserSettings().GameSettings
local ExperienceMenuSessionManagerInstance = require(CorePackages.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance
local PlatformService = nil

pcall(function() -- line: 194
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)

local PlatformFriendsService = nil

pcall(function() -- line: 197
	-- upvalues: PlatformFriendsService (ref)
	PlatformFriendsService = game:GetService("PlatformFriendsService")
end)

local GetServerVersion = nil

spawn(function() -- line: 201
	-- upvalues: GetServerVersion (ref), RobloxReplicatedStorage (copy)
	GetServerVersion = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999)
end)

local GetServerChannel = nil

if t1.GetFFlagDisplayServerChannel() then
	spawn(function() -- line: 207
		-- upvalues: GetServerChannel (ref), RobloxReplicatedStorage (copy)
		GetServerChannel = RobloxReplicatedStorage:WaitForChild("GetServerChannel", 1e999)
	end)
end

local v82 = UserInputService.PreferredInput == Enum.PreferredInput.Touch

RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")

local Platform = UserInputService:GetPlatform()
local BaseUrl = ContentProvider.BaseUrl
local v85 = not string.find(BaseUrl, "www.roblox.com")
local DevConsoleMaster = require(RobloxGui.Modules.DevConsoleMaster)
local u87 = nil
local u88 = false
local u89 = nil
local u90 = nil
local SettingsFullScreenTitleBar = require(RobloxGui.Modules.Settings.Components.SettingsFullScreenTitleBar)
local MenuLeaveGameTelemetryConfig = require(RobloxGui.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig)
local MenuResetCharacterTelemetryConfig = require(RobloxGui.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig)
local MenuResumeTelemetryConfig = require(RobloxGui.Modules.Settings.Analytics.MenuResumeTelemetryConfig)
local ReactPageAnalytics = require(RobloxGui.Modules.Settings.Analytics.ReactPageAnalytics)
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local GameInviteModalManager = nil
local GameInviteInviteExperimentVariant = nil
local GameInviteConstants = nil

if t1.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
	local GameInvite = require(CorePackages.Workspace.Packages.GameInvite)

	GameInviteModalManager = GameInvite.GameInviteModalManager
	GameInviteInviteExperimentVariant = GameInvite.GameInviteInviteExperimentVariant
	GameInviteConstants = GameInvite.GameInviteConstants
end

local CapturesApp = require(RobloxGui.Modules.Captures.CapturesApp)
local Constants = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v103 = CachedPolicyService:IsSubjectToChinaPolicies()
local default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local Constants2 = require(RobloxGui.Modules.VoiceChat.Constants)
local v106 = game:DefineFastFlag("SettingsHubRaceConditionFix", false)
local v107 = game:DefineFastFlag("FixReportButtonCutOff", false)
local InExperienceAppChatModal = require(CorePackages.Workspace.Packages.AppChat).App.InExperienceAppChatModal
local v109 = if not t1.GetFFlagPackagifySettingsShowSignal() then nil else require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v110 = if not t1.GetFFlagPackagifySettingsShowSignal() then nil else require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsUtility
local t2 = {
	frequency = 4,
	dampingRatio = 1
}

require(RobloxGui.Modules.Settings.ReactPageFactory)

local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local v113 = t1.FFlagLocalizeVersionLabels or v103
local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ChatSelector = require(RobloxGui.Modules.ChatSelector)
local v116, _ = GuiService:GetGuiInset()
local uDim2 = UDim2.new(0, 0, 0, -v116.Y)
local uDim2_2 = UDim2.new(1, 0, 1, v116.Y)

local function GetCorePackagesLoaded(p1) -- line: 304
	local CorePackages2 = game:GetService("CorePackages")

	for _, v in pairs(p1) do
		if not CorePackages2:FindFirstChild(v) then
			return false
		end
	end

	return true
end
local function GetServerChannelBlocking() -- line: 327
	-- upvalues: u90 (ref), v61 (copy), GetServerChannel (ref)
	if u90 then
		return u90
	end

	local v133 = v61

	if not GetServerChannel then
		repeat
			task.wait()
			v133 -= 1
		until GetServerChannel or v133 == 0
	end

	if GetServerChannel then
		u90 = GetServerChannel:InvokeServer()
	else
		warn("GetServerChannelRemote not available")
		u90 = "Unknown"
	end

	return u90
end
local function createReactPage(p2) -- line: 365
	-- upvalues: Create (copy)
	return Create("Frame")({
		Name = "InExperienceMenuPage",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(0, 0),
		Visible = false,
		Parent = p2
	})
end

local t3 = {
	ModuleName = "SettingsMenu",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true,
	SetVisibility = nil
}

VRHub:RegisterModule(t3)
VRHub.ModuleOpened.Event:connect(function(p3) -- line: 4156
	-- upvalues: t3 (copy), VRHub (copy)
	if p3 ~= t3.ModuleName and VRHub:GetModule(p3).VRIsExclusive then
		t3:SetVisibility(false)
	end
end)

local v124 = (function() --[[ CreateSettingsHub ]] -- line: 376
	-- upvalues: t1 (copy), RobloxGui (copy), v109 (copy), Utility (copy), v110 (copy), createSignal (copy), Constants2 (copy), Stores (copy), RbxAnalyticsService (copy), ReactPageAnalytics (copy), createReactPage (copy), Theme (copy), ContextActionService (copy), LocalizationService (copy), Localization (copy), v14 (copy), Create (copy), v82 (copy), UserInputService (copy), Platform (copy), default (copy), getCamMicPermissions (copy), Otter (copy), RobloxTranslator (copy), v106 (copy), StarterGui (copy), TelemetryService (copy), MenuLeaveGameTelemetryConfig (copy), MenuResetCharacterTelemetryConfig (copy), Constants (copy), MenuResumeTelemetryConfig (copy), ReactRoblox (copy), React (copy), MenuButtonsContainer (copy), Flags (copy), GuiService (copy), uDim2_2 (copy), uDim2 (copy), SHIELD_INACTIVE_POSITION (copy), v56 (copy), v55 (copy), v59 (copy), v113 (copy), GetServerChannelBlocking (copy), u89 (ref), GetServerVersion (ref), RunService (copy), HttpRbxApiService (copy), HttpService (copy), CachedPolicyService (copy), BaseUrl (copy), v85 (copy), StarterPlayer (copy), Players (copy), Roact (copy), RoactAppExperiment (copy), IXPService (copy), AppStyleProvider (copy), Dark (copy), MenuBackButton (copy), MenuFrontButton (copy), AppFonts (copy), t2 (copy), CorePackages (copy), InExperienceAppChatModal (copy), InExperienceCapabilities (copy), FoundationProvider (copy), Foundation (copy), Utils (copy), SwitchTabHint (copy), isSubjectToDesktopPolicies (copy), SettingsFullScreenTitleBar (copy), VRService (copy), GameSettings (copy), DevConsoleMaster (copy), v107 (copy), Cryo (copy), IXPServiceWrapper (copy), ExperienceMenuSessionManagerInstance (copy), MouseIconOverrideService (copy), v58 (copy), v60 (copy), TweenService (copy), PerfUtils (copy), EngineFeature (copy), u87 (ref), ChatSelector (copy), FFlagEnableNewBackpack (copy), v5 (copy), u88 (ref), GameInviteInviteExperimentVariant (ref), PlatformFriendsService (ref), PlatformService (ref), GameInviteModalManager (ref), GameInviteConstants (ref), ReactPageSignal (copy), GetCorePackagesLoaded (copy), GameInviteAnalytics (copy), CapturesPolicy (copy), isSpatial (copy), CapturesApp (copy), Signals (copy), PortalWithFoundationStylelink (copy), TraversalHistoryMenu (copy), InExperienceMenuReact (copy), InExperienceMenuReactPage (copy)
	local t4 = {
		Visible = false,
		Active = true,
		Pages = {
			CurrentPage = nil,
			PageTable = {}
		},
		MenuStack = {},
		TabHeaders = {},
		BottomBarButtons = {},
		BottomBarButtonsComponents = {},
		ResizedConnection = nil,
		BackBarVisibleConnection = nil
	}
	local u176 = nil

	if t1.EngineFeatureTeleportHistoryButtons then
		t4.FrontBarVisibleConnection = nil
	end

	t4.PreferredTransparencyChangedConnection = nil
	t4.TabConnection = nil

	if t1.FFlagAddNextUpContainer then
		t4.LeaveGamePage = require(RobloxGui.Modules.Settings.Pages.LeaveGameWithNextUp)
	else
		t4.LeaveGamePage = require(RobloxGui.Modules.Settings.Pages.LeaveGame)
	end

	t4.LeaveGameUpsellPage = if not t1.GetFFlagEnableLeaveGameUpsellEntrypoint() then nil else require(RobloxGui.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell)
	t4.ResetCharacterPage = require(RobloxGui.Modules.Settings.Pages.ResetCharacter)
	t4.SettingsShowSignal = if not t1.GetFFlagPackagifySettingsShowSignal() then Utility:CreateSignal() else v109
	t4.CurrentPageSignal = if not t1.GetFFlagPackagifySettingsShowSignal() then Utility:CreateSignal() else v110.CreateSignal()

	if t1.FFlagTraversalPerfFixes then
		local v137, v138 = createSignal(false)

		t4.showBottomBarSignal = v137
		t4.setShowBottomBarSignal = v138
	end

	t4.OpenStateChangedCount = 0
	t4.BottomButtonFrame = nil

	if t1.FFlagRelocateMobileMenuButtons then
		t4.addMenuKeyBindings = nil
		t4.removeMenuKeyBindings = nil
	end

	if t1.FFlagIEMFocusNavSupportNewButtons then
		t4.ResumeMenuButton = nil
	end

	t4.hasMicPermissions = false

	if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		t4.checkedUpsell = false
		t4.leaveGameUpsellProp = Constants2.PHONE_UPSELL_VALUE_PROP.None
		t4.sessionStartTime = os.time()
	end

	t4.isFetchingMicPermissions = true

	if t1.FFlagAddUILessMode and t1.FIntAddUILessModeVariant ~= 0 then
		t4.uiLessStore = Stores.GetUILessStore(false)
	end

	t4.isMuted = nil
	t4.lastVoiceRecordingIndicatorTextUpdated = nil
	t4.playSessionId = ""

	if t1.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
		t4.playSessionId = RbxAnalyticsService:GetPlaySessionId()
	end

	t4.reactPageAnalytics = ReactPageAnalytics.new()

	local u139 = nil
	local BindableEvent = Instance.new("BindableEvent")

	BindableEvent.Name = "PoppedMenu"
	t4.PoppedMenu = BindableEvent.Event
	t4.ReactPage = nil

	if t1.FFlagCreateInExperienceMenuReact then
		t4.ReactPage = createReactPage()
	end

	local function setBottomBarSelection(p4) -- line: 482
		-- upvalues: t4 (copy), t1 (copy)
		if not t4.BottomButtonFrame and (t1.FFlagIEMFocusNavToButtons and not p4) and (not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 or t1.FIntRelocateMobileMenuButtonsVariant == 2) then
			return
		end

		if t4.ResumeButton then
			p4.PageNextSelectionDown = t4.ResumeButton
		elseif t1.FFlagIEMFocusNavSupportNewButtons and t1.FIntRelocateMobileMenuButtonsVariant == 2 and t4.ResumeMenuButton then
			p4.PageNextSelectionDown = t4.ResumeMenuButton
		end

		if t1.FFlagIEMTabFocusNav and t4.BottomButtonFrame then
			local TabHeader = p4:GetTabHeader()
			local v245 = t4.ResumeButton or t4.ResumeMenuButton

			if v245 then
				for k, _ in pairs(t4.Pages.PageTable) do
					local TabHeader2 = k:GetTabHeader()

					if TabHeader2 then
						TabHeader2.NextSelectionUp = v245
					end
				end
			end

			for _, v250 in t4.BottomButtonFrame:GetDescendants() do
				if v250:IsA("GuiObject") and v250.Selectable then
					v250.NextSelectionDown = TabHeader
				end
			end
		end

		for _, v252 in p4.LastSelectableObjects do
			t4.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
			t4.BottomButtonFrame.NextSelectionUp = v252
			v252.NextSelectionDown = p4.PageNextSelectionDown

			local LeaveGameButton = t4.LeaveGameButton

			if LeaveGameButton then
				LeaveGameButton.NextSelectionUp = v252
			end

			if t1.FFlagIEMFocusNavSupportNewButtons and t1.FIntRelocateMobileMenuButtonsVariant == 2 then
				for _, v255 in t4.BottomButtonFrame:GetDescendants() do
					if v255:IsA("GuiObject") and v255.Selectable then
						v255.NextSelectionUp = v252
					end
				end
			end
		end

		if #p4.LastSelectableObjects < 1 then
			t4.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			t4.BottomButtonFrame.NextSelectionUp = nil

			local LeaveGameButton = t4.LeaveGameButton

			if LeaveGameButton then
				LeaveGameButton.NextSelectionUp = nil
			end

			if t1.FFlagIEMFocusNavSupportNewButtons and t1.FIntRelocateMobileMenuButtonsVariant == 2 then
				for _, v258 in t4.BottomButtonFrame:GetDescendants() do
					if v258:IsA("GuiObject") and v258.Selectable then
						v258.NextSelectionUp = if not t1.FFlagIEMTabFocusNav then nil else p4:GetTabHeader()
					end
				end
			end
		end
	end
	local function shouldShowBottomBar(p5) -- line: 551
		-- upvalues: t4 (copy), t1 (copy), Utility (copy), Theme (copy)
		local v260 = p5 or t4.Pages.CurrentPage

		if (not t1.FFlagRelocateMobileMenuButtons or (t1.FIntRelocateMobileMenuButtonsVariant == 0 or t1.FIntRelocateMobileMenuButtonsVariant == 2)) and ((Utility:IsPortrait() or Utility:IsSmallTouchScreen()) and not Theme.AlwaysShowBottomBar()) then
			return false
		end

		return v260 ~= nil and v260.ShouldShowBottomBar == true
	end
	local function setBottomBarBindings() -- line: 570
		-- upvalues: t4 (copy), t1 (copy), ContextActionService (copy)
		if not t4.Visible then
			return
		end

		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
			for i = 1, #t4.BottomBarButtons do
				local v264 = t4.BottomBarButtons[i]
				local v265 = v264[1]
				local v266 = v264[2]

				ContextActionService:BindCoreAction(v265, v266[1], false, unpack(v266[2]))
			end
		elseif t4.addMenuKeyBindings then
			t4.addMenuKeyBindings()
		end

		if t4.BottomButtonFrame then
			t4.BottomButtonFrame.Visible = true
		end
	end
	local function removeBottomBarBindings(p6) -- line: 593
		-- upvalues: t1 (copy), t4 (copy), ContextActionService (copy)
		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
			for _, v in pairs(t4.BottomBarButtons) do
				ContextActionService:UnbindCoreAction(v[1])
			end
		elseif t4.removeMenuKeyBindings then
			t4.removeMenuKeyBindings()
		end

		local OpenStateChangedCount = t4.OpenStateChangedCount

		if p6 then
			delay(p6, function() -- line: 605
				-- upvalues: t4 (copy), OpenStateChangedCount (copy)
				if t4.OpenStateChangedCount == OpenStateChangedCount and t4.BottomButtonFrame then
					t4.BottomButtonFrame.Visible = false
				end
			end)

			return
		end

		if OpenStateChangedCount == t4.OpenStateChangedCount and t4.BottomButtonFrame then
			t4.BottomButtonFrame.Visible = false
		end
	end

	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local v146 = Localization.new(RobloxLocaleId)

	local function hideVoiceUx() -- line: 634
		-- upvalues: t4 (copy), v14 (copy), Theme (copy), t1 (copy)
		local MuteButtonButton = t4.MuteButtonButton

		if MuteButtonButton then
			MuteButtonButton.Visible = false
			MuteButtonButton:Destroy()
		end

		local v276 = if not v14 then UDim2.new(0, 260, 0, Theme.LargeButtonHeight) else UDim2.new(0, 320, 0, 72)

		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
			local uDim2_3 = UDim2.new(0.5, not v14 and -130 or -160, 0.5, -25)

			if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
				local LeaveGameButtonButton = t4.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true)

				if LeaveGameButtonButton then
					LeaveGameButtonButton.Position = uDim2_3
					LeaveGameButtonButton.Size = v276
				end
			end

			local uDim2_4 = UDim2.new(0.5, not v14 and -400 or -550, 0.5, -25)

			if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
				local ResetCharacterButtonButton = t4.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true)

				if ResetCharacterButtonButton then
					ResetCharacterButtonButton.Position = uDim2_4
					ResetCharacterButtonButton.Size = v276
				end
			end

			local uDim2_5 = UDim2.new(0.5, not v14 and 140 or 200, 0.5, -25)

			if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
				local ResumeButtonButton = t4.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true)

				if not ResumeButtonButton then
					return
				end

				ResumeButtonButton.Position = uDim2_5
				ResumeButtonButton.Size = v276
			end
		end
	end
	local function addBottomBarButtonOld(p7, p8, p9, p10, p11, p12, p13, p14) -- line: 650
		-- upvalues: t1 (copy), Theme (copy), v14 (copy), t4 (copy), Utility (copy), Create (copy), v82 (copy), UserInputService (copy), Platform (copy)
		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
			local v291 = p7 .. "Button"
			local v292 = p7 .. "Text"
			local uDim2_6 = UDim2.new(0, 260, 0, Theme.LargeButtonHeight)

			if v14 then
				uDim2_6 = UDim2.new(0, 320, 0, 72)
			end

			local v294 = t4
			local v295 = t4
			local v296, v297 = Utility:MakeStyledButton(p7 .. "Button", p8, uDim2_6, p12, nil, t4)

			v294[v291] = v296
			v295[v292] = v297
			Create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Parent = t4[v291]
			})
			Create("UIPadding")({
				PaddingLeft = UDim.new(0.025, 0),
				Parent = t4[v291]
			})
			t4[v292].Size = UDim2.new(0, 0, 1, 0)
			Create("UIFlexItem")({
				FlexMode = Enum.UIFlexMode.Grow,
				Parent = t4[v292]
			})
			t4[v291].Position = p11
			t4[v291].Parent = t4.BottomButtonFrame

			if v14 then
				t4[v291].ImageTransparency = 1
			end

			t4[v292].FontSize = Enum.FontSize.Size24

			local u298 = nil

			if not v82 then
				local v299 = p7 .. "Hint"
				local v300 = if not UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) and Platform ~= Enum.Platform.XBoxOne then p10 else p9

				u298 = Create("ImageLabel")({
					Name = v299,
					ZIndex = t4.Shield.ZIndex + 2,
					BackgroundTransparency = 1,
					Image = v300,
					LayoutOrder = -1,
					Parent = t4[v291]
				})

				if v300 == p10 then
					u298.ImageColor3 = Theme.color("WhiteButtonText", Color3.new(1, 1, 1))
					u298.ImageTransparency = Theme.transparency("WhiteButtonText", 1)
				end

				u298.Position = UDim2.new(0, 9, 0.5, 0)
				u298.Size = UDim2.new(0, 33, 0, 33)
				u298.AnchorPoint = Vector2.new(0, 0.5)
			end

			if v14 then
				t4[v292].FontSize = Enum.FontSize.Size36
			end

			UserInputService.InputBegan:connect(function(p15) -- line: 723
				-- upvalues: u298 (ref), p9 (copy), p10 (copy)
				if p15.UserInputType == Enum.UserInputType.Gamepad1 or (p15.UserInputType == Enum.UserInputType.Gamepad2 or p15.UserInputType == Enum.UserInputType.Gamepad3 or p15.UserInputType == Enum.UserInputType.Gamepad4) then
					if u298 then
						u298.Image = p9

						return
					end
				elseif p15.UserInputType == Enum.UserInputType.Keyboard and u298 then
					u298.Image = p10
				end
			end)
			t4.BottomBarButtons[#t4.BottomBarButtons + 1] = {
				v291,
				{
					function(_, p17, _) -- line: 746
						-- upvalues: p14 (copy)
						if p17 == Enum.UserInputState.Begin then
							p14()
						end
					end,
					p13
				}
			}
		end
	end

	local s1 = ""

	if v14 then
		s1 = "@2x"
	end

	local ImageForKeyCode, ImageForKeyCode2, ImageForKeyCode3

	if t1.FFlagEnableConsoleExpControls then
		ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		ImageForKeyCode2 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
		ImageForKeyCode3 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY)
	else
		ImageForKeyCode = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. s1 .. ".png"
		ImageForKeyCode2 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. s1 .. ".png"
		ImageForKeyCode3 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. s1 .. ".png"
	end

	local ImageForKeyCode4 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	local u154 = false
	local connection = nil

	local function setupVoiceListeners() -- line: 780
		-- upvalues: u154 (ref), t4 (copy), default (copy), getCamMicPermissions (copy), connection (ref), Otter (copy), RobloxTranslator (copy), hideVoiceUx (copy)
		if game:GetEngineFeature("VoiceChatSupported") and not u154 then
			u154 = true

			local function showUI() -- line: 785
				-- upvalues: t4 (copy), default (copy), getCamMicPermissions (copy), connection (ref), Otter (copy), RobloxTranslator (copy)
				t4.VoiceRecordingText.Visible = true
				default:getService().StateChanged:Connect(function(_, newState) -- line: 788
					-- upvalues: t4 (copy)
					if newState == Enum.VoiceChatState.Joined then
						t4.VoiceRecordingText.Visible = true
					end
				end)
				default:SetupParticipantListeners()
				getCamMicPermissions(function(p20) -- line: 795
					-- upvalues: t4 (copy)
					t4.hasMicPermissions = p20.hasMicPermissions
				end, nil, true, "PermissionsButtons.getPermissions")
				connection = default.muteChanged.Event:Connect(function(p21) -- line: 799
					-- upvalues: t4 (copy), Otter (copy), RobloxTranslator (copy)
					t4.isMuted = p21
					t4.lastVoiceRecordingIndicatorTextUpdated = tick()
					t4.voiceRecordingIndicatorTextMotor:setGoal(Otter.instant(0))

					if t4.isMuted then
						local VoiceRecordingText = t4.VoiceRecordingText
						local s2

						if not RobloxTranslator then
							s2 = "Mic Off"
						else
							local ok, result = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.MicOff")

							s2 = not ok and "Mic Off" or result
						end

						VoiceRecordingText.Text = s2

						return
					end

					local VoiceRecordingText = t4.VoiceRecordingText
					local s3

					if not RobloxTranslator then
						s3 = "Mic On (recording audio)"
					else
						local ok, result = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.MicOnRecording")

						s3 = not ok and "Mic On (recording audio)" or result
					end

					VoiceRecordingText.Text = s3
				end)
			end

			if default.voiceUIVisible then
				showUI()
			end

			default.showVoiceUI.Event:Connect(showUI)
			default.hideVoiceUI.Event:Connect(function() --[[ hideUI ]] -- line: 810
				-- upvalues: t4 (copy), hideVoiceUx (copy), connection (ref)
				t4.VoiceRecordingText.Visible = false
				hideVoiceUx()

				if connection then
					connection:Disconnect()
				end
			end)
		end
	end

	if not v106 then
		setupVoiceListeners()
	end

	local u157 = true

	local function setResetEnabled(p22) -- line: 834
		-- upvalues: u157 (ref), t4 (copy)
		u157 = p22

		if t4.ResetCharacterButton then
			t4.ResetCharacterButton.Selectable = p22
			t4.ResetCharacterButton.Active = p22
			t4.ResetCharacterButton.Enabled.Value = p22

			local ResetCharacterHint = t4.ResetCharacterButton:FindFirstChild("ResetCharacterHint")

			if ResetCharacterHint then
				ResetCharacterHint.ImageColor3 = p22 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end

			local ResetCharacterButtonTextLabel = t4.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")

			if ResetCharacterButtonTextLabel then
				ResetCharacterButtonTextLabel.TextColor3 = p22 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
		end
	end

	local u159 = nil

	function t4.GetRespawnBehaviour(_) -- line: 852
		-- upvalues: t1 (copy), t4 (copy), u157 (ref), u159 (ref)
		if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			return t4:GetExperienceControlStore().getCanRespawn(false), t4:GetExperienceControlStore().getCustomRespawnCallback(false)
		end

		return u157, u159
	end

	t4.RespawnBehaviourChangedEvent = Instance.new("BindableEvent")
	StarterGui:RegisterSetCore("ResetButtonCallback", function(p24) -- line: 862
		-- upvalues: t4 (copy), t1 (copy), u157 (ref), setResetEnabled (copy), u159 (ref)
		local v307 = typeof(p24) == "Instance" and p24:IsA("BindableEvent")

		if v307 or type(p24) == "boolean" then
			t4.ResetCharacterPage:SetResetCallback(p24)
		else
			warn("ResetButtonCallback must be set to a BindableEvent or a boolean")
		end

		local v308 = if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then u157 else t4:GetExperienceControlStore().getCanRespawn(false)

		if p24 == false then
			if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t4:GetExperienceControlStore().setCanRespawn(false)
			else
				setResetEnabled(false)
			end
		elseif not v308 and (v307 or p24 == true) then
			if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t4:GetExperienceControlStore().setCanRespawn(true)
			else
				setResetEnabled(true)
			end
		end

		if v307 then
			if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t4:GetExperienceControlStore().setCustomRespawnCallback(p24)
			else
				u159 = p24
			end
		end

		if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			t4.RespawnBehaviourChangedEvent:Fire(t4:GetExperienceControlStore().getCanRespawn(false), t4:GetExperienceControlStore().getCustomRespawnCallback(false))

			return
		end

		t4.RespawnBehaviourChangedEvent:Fire(u157, u159)
	end)
	StarterGui:RegisterGetCore("ResetButtonCallback", function() -- line: 897
		-- upvalues: t4 (copy)
		local v309, _ = t4:GetRespawnBehaviour()

		return v309
	end)

	local setVisibilityInternal = nil
	local v161, v162 = createSignal(true)
	local v163, v164 = createSignal(nil)

	function t4.GetExperienceControlStore(_) -- line: 907
		-- upvalues: v162 (copy), t4 (copy), v161 (copy), v163 (copy), v164 (copy), t1 (copy), Constants2 (copy), TelemetryService (copy), MenuLeaveGameTelemetryConfig (copy), MenuResetCharacterTelemetryConfig (copy), RbxAnalyticsService (copy), Constants (copy), MenuResumeTelemetryConfig (copy)
		return {
			getCanRespawn = v161,
			getCustomRespawnCallback = v163,
			setCanRespawn = function(b1: boolean) -- line: 908
				-- upvalues: v162 (copy), t4 (copy)
				v162(b1)

				if t4.ResetCharacterButton then
					t4.ResetCharacterButton.Selectable = b1
					t4.ResetCharacterButton.Active = b1
					t4.ResetCharacterButton.Enabled.Value = b1

					local ResetCharacterHint = t4.ResetCharacterButton:FindFirstChild("ResetCharacterHint")

					if ResetCharacterHint then
						ResetCharacterHint.ImageColor3 = b1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end

					local ResetCharacterButtonTextLabel = t4.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")

					if ResetCharacterButtonTextLabel then
						ResetCharacterButtonTextLabel.TextColor3 = b1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
				end
			end,
			setCustomRespawnCallback = v164,
			onLeaveGame = function(s4: string) --[[ onLeaveGame ]] -- line: 930
				-- upvalues: t4 (copy), t1 (copy), Constants2 (copy), TelemetryService (copy), MenuLeaveGameTelemetryConfig (copy)
				if not t4:GetVisibility() then
					return
				end

				t4:AddToMenuStack(t4.Pages.CurrentPage)
				t4.HubBar.Visible = false

				if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() and t4.leaveGameUpsellProp ~= Constants2.PHONE_UPSELL_VALUE_PROP.None then
					t4:SwitchToPage(t4.LeaveGameUpsellPage, false)
				else
					t4:SwitchToPage(t4.LeaveGamePage, false, nil, not not t1.FFlagMenuButtonsSkipAnimation or nil)
				end

				TelemetryService:LogCounter(MenuLeaveGameTelemetryConfig, {
					customFields = {
						source = s4
					}
				})
			end,
			onRespawn = function(s5: string) --[[ onRespawn ]] -- line: 949
				-- upvalues: v161 (copy), t4 (copy), t1 (copy), TelemetryService (copy), MenuResetCharacterTelemetryConfig (copy)
				if not v161(false) then
					return
				end

				t4:AddToMenuStack(t4.Pages.CurrentPage)
				t4.HubBar.Visible = false
				t4:SwitchToPage(t4.ResetCharacterPage, false, nil, not not t1.FFlagMenuButtonsSkipAnimation or nil)
				TelemetryService:LogCounter(MenuResetCharacterTelemetryConfig, {
					customFields = {
						source = s5
					}
				})
			end,
			onResume = function(s6: string) --[[ onResume ]] -- line: 964
				-- upvalues: t1 (copy), t4 (copy), RbxAnalyticsService (copy), Constants (copy), TelemetryService (copy), MenuResumeTelemetryConfig (copy)
				if t1.FFlagAddUILessMode then
					t4:SetVisibility(false, nil, nil, nil, s6)
				else
					t4:SetVisibility(false)
				end

				if t1.FFlagAddUILessMode and t1.FIntAddUILessModeVariant ~= 0 and t4.uiLessStore.getUILessModeEnabled(false) then
					t4.uiLessStore.setUIVisible(false)
				end

				RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsResumeGameName, Constants.AnalyticsMenuActionName, {
					source = s6,
					playsessionid = t4.playSessionId,
					universeid = tostring(game.GameId)
				})
				TelemetryService:LogCounter(MenuResumeTelemetryConfig, {
					customFields = {
						source = s6
					}
				})
			end
		}
	end

	local v165 = if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then nil else function() -- line: 996
		-- upvalues: t4 (copy), ReactRoblox (copy), React (copy), MenuButtonsContainer (copy), Flags (copy), t1 (copy), GuiService (copy)
		if t4.BottomButtonFrameRoot then
			return
		end

		local ExperienceControlStore = t4:GetExperienceControlStore()

		t4.BottomButtonFrameRoot = ReactRoblox.createRoot(t4.BottomButtonFrame)
		t4.BottomButtonFrameRoot:render(React.createElement(MenuButtonsContainer, {
			onLeaveGame = ExperienceControlStore.onLeaveGame,
			onRespawn = ExperienceControlStore.onRespawn,
			onResume = ExperienceControlStore.onResume,
			setAddMenuKeyBindings = function(p26: ((...any) -> ...any)) --[[ setAddMenuKeyBindings ]] -- line: 1008
				-- upvalues: t4 (copy)
				t4.addMenuKeyBindings = p26
			end,
			setRemoveMenuKeyBindings = function(p27: ((...any) -> ...any)) --[[ setRemoveMenuKeyBindings ]] -- line: 1012
				-- upvalues: t4 (copy)
				t4.removeMenuKeyBindings = p27
			end,
			getVisibility = function() --[[ getVisibility ]] -- line: 1016
				-- upvalues: t4 (copy)
				return t4.GetVisibility()
			end,
			getCanRespawn = ExperienceControlStore.getCanRespawn,
			currentPageChangeSignal = if not Flags.FFlagAddTraversalHistoryReactMenuButtons then nil else t4.CurrentPageSignal,
			setResumeMenuButton = if not t1.FFlagIEMFocusNavSupportNewButtons then nil else function(p28) -- line: 1021
				-- upvalues: t4 (copy), t1 (copy), GuiService (copy)
				t4.ResumeMenuButton = p28

				if t1.FFlagIEMFocusNavSupportNewButtons and (not GuiService.SelectedCoreObject or not GuiService.SelectedCoreObject:IsDescendantOf(t4.Shield)) then
					GuiService.SelectedCoreObject = p28
				end
			end
		}))
	end
	local v166 = if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then nil else function() -- line: 1032
		-- upvalues: t4 (copy)
		if t4.BottomButtonFrameRoot then
			t4.BottomButtonFrameRoot:unmount()
			t4.BottomButtonFrameRoot = nil
		end
	end

	local function resizeBottomBarButtons() -- line: 2087
		-- upvalues: t4 (copy), t1 (copy)
		local AbsoluteSizeX = t4.BottomButtonFrame.AbsoluteSize.X
		local v352 = #t4.BottomBarButtons

		if v352 == 4 then
			AbsoluteSizeX = AbsoluteSizeX - 48 - 12
			v352 -= 1
		end

		local v353 = (AbsoluteSizeX - (v352 - 1) * 12 - 12) / v352

		if t1.isInExperienceUIVREnabled then
			v353 = t4.SettingsUIDelegate:getBottomButtonSize(v353)
		end

		for i = 1, #t4.BottomBarButtons do
			local v355 = t4.BottomBarButtons[i]
			local v356 = v355[1]

			if v356 ~= "MuteButtonButton" then
				t4[v356].Size = UDim2.fromOffset(v353, t4[v355[1]].Size.Y.Offset)
			end
		end
	end
	local function onScreenSizeChanged() -- line: 2110
		-- upvalues: t4 (copy), t1 (copy), Utility (copy), Theme (copy), v165 (copy), v166 (copy), RobloxGui (copy), v14 (copy), VRService (copy), RunService (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), removeBottomBarBindings (copy)
		if t1.FFlagRelocateMobileMenuButtons and (t1.FIntRelocateMobileMenuButtonsVariant == 2 and t4.Visible) then
			if not Utility:IsPortrait() and not Utility:IsSmallTouchScreen() or Theme.AlwaysShowBottomBar() then
				if not t4.BottomButtonFrameRoot then
					v165()
				end

				if t4.PlayersPage then
					t4.PlayersPage:UnmountMenuButtonsContainer()
				end
			else
				if t4.BottomButtonFrameRoot then
					v166()
				end

				if t4.PlayersPage then
					t4.PlayersPage:CreateMenuButtonsContainer()
				end
			end
		end

		local v357 = Theme.MenuContainerPosition(t4.SettingsUIDelegate)
		local n1 = 600
		local v359 = if not t1.isInExperienceUIVREnabled then RobloxGui.AbsoluteSize.y else t4.SettingsUIDelegate:getFullScreenSize()
		local v360 = 0.050000000000000044 * v359
		local v361 = Utility:IsPortrait()

		if v14 then
			n1 = 800
			v360 = 0.07 * v359
		elseif Utility:IsSmallTouchScreen() then
			v360 = math.min(10, 0.010000000000000009 * v359)
		elseif t1.isInExperienceUIVREnabled and VRService.VREnabled then
			v360 = 0
		end

		if t1.FFlagAddNextUpContainer and t4.Pages.CurrentPage and t4.Pages.CurrentPage.DisableTopPadding and t4.Pages.CurrentPage.MaintainVerticalSize then
			n1 += t4.HubBar.AbsoluteSize.Y
		end

		t4.MenuContainer.Size = v357.Size
		t4.MenuContainer.Position = v357.Position
		t4.MenuContainer.AnchorPoint = v357.AnchorPoint

		local YOffset = t4.HubBar.Size.Y.Offset
		local _ = v360 * 2 + YOffset * 2
		local n2 = 0

		if not t1.FFlagAddTraversalBackButton then
			if ((if t4.BackBarRef:getValue() then t4.BackBarRef:getValue().Visible else false)) and t4.BackBarRef:getValue() then
				n2 = t4.BackBarRef:getValue().Size.Y.Offset
			end

			if t1.EngineFeatureTeleportHistoryButtons and (if t4.FrontBarRef:getValue() then t4.FrontBarRef:getValue().Visible else false) and t4.FrontBarRef:getValue() then
				n2 += t4.FrontBarRef:getValue().Size.Y.Offset
			end
		end

		if v361 then
			t4.HubBar.Position = UDim2.new(0.5, 0, 0, 10)
			t4.HubBar.Size = UDim2.new(0, RobloxGui.AbsoluteSize.X - 40, 0, 54)
		elseif v14 then
			t4.HubBar.Size = UDim2.new(0, 1200, 0, 100)
		elseif Utility:IsSmallTouchScreen() then
			t4.HubBar.Size = UDim2.new(0, RobloxGui.AbsoluteSize.X - 60, 0, 52)
		elseif t1.isInExperienceUIVREnabled then
			t4.HubBar.Size = UDim2.new(0, t4.SettingsUIDelegate:getHubBarSize(), 0, 60)
		else
			t4.HubBar.Size = UDim2.new(0, 800, 0, 60)
		end

		local v365 = if Theme.AlwaysShowBottomBar() then t4.HubBar.Size.Y.Offset + t4.BottomButtonFrame.Size.Y.Offset else t4.HubBar.Size.Y.Offset
		local v366 = v360 * 2 + if t1.FFlagFixDisableTopPaddingError and t4.Pages.CurrentPage == nil or not t4.Pages.CurrentPage.DisableTopPadding then v365 else 0

		if not t1.FFlagAddTraversalBackButton then
			n2 = (not (if t4.BackBarRef:getValue() then t4.BackBarRef:getValue().Visible else false) or not t4.BackBarRef:getValue()) and 0 or t4.BackBarRef:getValue().Size.Y.Offset

			if t1.EngineFeatureTeleportHistoryButtons and (if t4.FrontBarRef:getValue() then t4.FrontBarRef:getValue().Visible else false) and t4.FrontBarRef:getValue() then
				n2 += t4.FrontBarRef:getValue().Size.Y.Offset
			end
		end

		if not t1.FFlagAddNextUpContainer then
			RunService.Heartbeat:wait()
		end

		if shouldShowBottomBar() then
			setBottomBarBindings()

			if t1.FFlagIEMFocusNavToButtons then
				setBottomBarSelection(t4.Pages.CurrentPage)
			end
		else
			removeBottomBarBindings()
		end

		if t1.isInExperienceUIVREnabled then
			v366 += t4.SettingsUIDelegate:getMenuContainerExtraSpace()
		end

		local v367 = v359 - v366 - n2

		if t1.FFlagRelocateMobileMenuButtons and ((t1.FIntRelocateMobileMenuButtonsVariant == 1 or t1.FIntRelocateMobileMenuButtonsVariant == 3) and Utility:IsSmallTouchScreen()) then
			v367 -= Theme.ExtraHubBottomPaddingMobile
		end

		if not v361 then
			if n1 < v367 then
				t4.HubBar.Position = UDim2.new(t4.HubBar.Position.X.Scale, t4.HubBar.Position.X.Offset, 0.5, -n1 / 2 - t4.HubBar.Size.Y.Offset)

				if t4.BottomButtonFrame then
					t4.BottomButtonFrame.Position = UDim2.new(t4.BottomButtonFrame.Position.X.Scale, t4.BottomButtonFrame.Position.X.Offset, 0.5, n1 / 2)
				end
			elseif v367 < 150 then
				n1 = 150
				t4.HubBar.Position = UDim2.new(t4.HubBar.Position.X.Scale, t4.HubBar.Position.X.Offset, 0.5, -75 - t4.HubBar.Size.Y.Offset)

				if t4.BottomButtonFrame then
					t4.BottomButtonFrame.Position = UDim2.new(t4.BottomButtonFrame.Position.X.Scale, t4.BottomButtonFrame.Position.X.Offset, 0.5, 75)
				end
			else
				n1 = v367
				t4.HubBar.Position = UDim2.new(t4.HubBar.Position.X.Scale, t4.HubBar.Position.X.Offset, 0, v360)

				if t4.BottomButtonFrame then
					t4.BottomButtonFrame.Position = UDim2.new(t4.BottomButtonFrame.Position.X.Scale, t4.BottomButtonFrame.Position.X.Offset, 1, -(v360 + v365))
				end
			end
		else
			n1 = v367
		end

		local v368 = if v14 then UDim2.new(0, t4.HubBar.AbsoluteSize.X, 0, n1) else if not Utility:IsSmallTouchScreen() then UDim2.new(0, t4.HubBar.AbsoluteSize.X, 0, n1) else if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant ~= 1 and t1.FIntRelocateMobileMenuButtonsVariant ~= 3 then UDim2.new(0, t4.HubBar.AbsoluteSize.X, 0, n1 + 0 + 0) else UDim2.new(0, t4.HubBar.AbsoluteSize.X, 0, n1 + 0 + 0 - t4.BottomButtonFrame.Size.Y.Offset)

		if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 and t4.BottomButtonFrame then
			t4.BottomButtonFrame.Size = UDim2.new(0, t4.HubBar.Size.X.Offset, 0, t4.HubBar.Size.Y.Offset)
		end

		if t1.FFlagAddNextUpContainer and t4.Pages.CurrentPage and t4.Pages.CurrentPage.ShrinkwrapPageViewClipper and not Utility:IsSmallTouchScreen() then
			local Size = t4.Pages.CurrentPage:GetSize()

			v368 = UDim2.new(v368.X.Scale, v368.X.Offset, v368.Y.Scale, (math.min(Size.Y - t4.PageView.Size.Y.Offset, n1)))
		end

		local v370 = Theme.HubPadding()
		local v371 = v370.PaddingLeft.Offset + v370.PaddingRight.Offset
		local v372 = v370.PaddingTop.Offset + v370.PaddingBottom.Offset

		t4.ReactPage.Size = UDim2.new(0, t4.HubBar.AbsoluteSize.X + v371, 0, n1 + v365 + v372)
		t4.PageViewClipper.Size = v368

		if not v361 then
			t4.PageViewClipper.Position = UDim2.new(t4.PageViewClipper.Position.X.Scale, t4.PageViewClipper.Position.X.Offset, 0.5, -n1 / 2)

			return
		end

		t4.PageViewClipper.Position = UDim2.new(0.5, 0, 0, t4.HubBar.Position.Y.Offset + t4.HubBar.AbsoluteSize.Y)
	end

	local u169 = v14
	local t5 = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true,
		[Enum.KeyCode.Left] = true,
		[Enum.KeyCode.Right] = true,
		[Enum.KeyCode.Up] = true,
		[Enum.KeyCode.Down] = true,
		[Enum.KeyCode.Tab] = true,
		[Enum.UserInputType.Touch] = false,
		[Enum.UserInputType.MouseButton1] = false,
		[Enum.UserInputType.MouseButton2] = false
	}

	UserInputService.InputBegan:connect(function(p29) -- line: 2428
		-- upvalues: t5 (copy), u169 (ref)
		if p29.UserInputType and t5[p29.UserInputType] ~= nil then
			u169 = t5[p29.UserInputType]

			return
		end

		if p29.KeyCode and t5[p29.KeyCode] then
			u169 = t5[p29.KeyCode]
		end
	end)
	UserInputService.InputChanged:connect(function(p30) -- line: 2435
		-- upvalues: u169 (ref)
		if p30.KeyCode == Enum.KeyCode.Thumbstick1 or p30.KeyCode == Enum.KeyCode.Thumbstick2 then
			if p30.Position.magnitude >= 0.25 then
				u169 = true

				return
			end
		elseif p30.UserInputType == Enum.UserInputType.Touch or p30.UserInputType == Enum.UserInputType.MouseMovement then
			u169 = false
		end
	end)

	local GetHeaderPosition = nil

	local function v172(p31, p32) -- line: 2447
		-- upvalues: t1 (copy), t4 (copy), GetHeaderPosition (ref)
		if t1.FFlagInExperienceReportClosingBugfix and not t4.HubBar.Visible then
			return
		end

		local v383 = GetHeaderPosition(t4.Pages.CurrentPage)

		if v383 < 0 then
			return
		end

		local v384 = v383 + p31

		if p32 then
			if v384 > #t4.TabHeaders then
				v384 = 1
			elseif v384 < 1 then
				v384 = #t4.TabHeaders
			end
		end

		local v385 = t4.TabHeaders[v384]

		if v385 then
			for k, _ in pairs(t4.Pages.PageTable) do
				if v385 == k:GetTabHeader() then
					t4:SwitchToPage(k, true, p31)

					return
				end
			end
		end
	end
	local function v173(_, p34, p35) -- line: 2474
		-- upvalues: v172 (copy)
		if p34 ~= Enum.UserInputState.Begin then
			return
		end

		local n3 = 0

		if p35.KeyCode == Enum.KeyCode.ButtonR1 then
			n3 = 1
		elseif p35.KeyCode == Enum.KeyCode.ButtonL1 then
			n3 = -1
		end

		v172(n3, true)
	end
	local function v174(p36) -- line: 2487
		-- upvalues: UserInputService (copy), v172 (copy)
		if p36.KeyCode == Enum.KeyCode.Tab then
			local v393 = not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not UserInputService:IsKeyDown(Enum.KeyCode.RightShift) and 1 or -1

			v172(v393, true)
		end
	end
	local function v175(_, p38, p39) -- line: 2500
		-- upvalues: t4 (copy)
		if p38 ~= Enum.UserInputState.Begin then
			return
		end

		local n4 = 0

		if p39.KeyCode == Enum.KeyCode.PageUp then
			n4 = -100
		elseif p39.KeyCode == Enum.KeyCode.PageDown then
			n4 = 100
		end

		t4:ScrollPixels(n4)
	end

	if t1.isInExperienceUIVREnabled or t1.FFlagEnableSettingsHubUIDelegateRollout then
		t4.SettingsUIDelegate = require(RobloxGui.Modules.Settings.SettingsUIDelegate).new(t4)
	end;

	(function() --[[ createGui ]] -- line: 1040
		-- upvalues: Utility (copy), t4 (copy), Create (copy), uDim2_2 (copy), uDim2 (copy), RobloxGui (copy), SHIELD_INACTIVE_POSITION (copy), v56 (copy), v55 (copy), v59 (copy), t1 (copy), Theme (copy), v14 (copy), v113 (copy), RobloxTranslator (copy), GetServerChannelBlocking (copy), u89 (ref), GetServerVersion (ref), RunService (copy), HttpRbxApiService (copy), HttpService (copy), CachedPolicyService (copy), BaseUrl (copy), v85 (copy), StarterPlayer (copy), Players (copy), RbxAnalyticsService (copy), Constants (copy), createReactPage (copy), GuiService (copy), getCamMicPermissions (copy), default (copy), Roact (copy), RoactAppExperiment (copy), IXPService (copy), AppStyleProvider (copy), Dark (copy), MenuBackButton (copy), MenuFrontButton (copy), AppFonts (copy), Otter (copy), t2 (copy), UserInputService (copy), setVisibilityInternal (ref), v165 (copy), CorePackages (copy), InExperienceAppChatModal (copy), removeBottomBarBindings (copy), Constants2 (copy), InExperienceCapabilities (copy), addBottomBarButtonOld (copy), ImageForKeyCode2 (ref), u157 (ref), v146 (copy), ImageForKeyCode3 (ref), ImageForKeyCode4 (copy), ImageForKeyCode (ref), ReactRoblox (copy), React (copy), FoundationProvider (copy), Foundation (copy), Utils (copy), SwitchTabHint (copy), isSubjectToDesktopPolicies (copy), SettingsFullScreenTitleBar (copy)
		local n5 = 0

		if Utility:IsSmallTouchScreen() then
			n5 = 5
		end

		t4.ClippingShield = Create("Frame")({
			Name = "SettingsClippingShield",
			Size = uDim2_2,
			Position = uDim2,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Visible = true,
			ZIndex = 2,
			Parent = RobloxGui
		})
		t4.CanvasGroup = Create("CanvasGroup")({
			Name = "CanvasGroup",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Parent = t4.ClippingShield
		})
		t4.Shield = Create("ImageButton")({
			Name = "SettingsShield",
			Size = UDim2.new(1, 0, 1, 0),
			Position = SHIELD_INACTIVE_POSITION,
			BackgroundTransparency = v56,
			BackgroundColor3 = v55,
			BorderSizePixel = 0,
			Visible = false,
			Active = true,
			ZIndex = 2,
			Parent = t4.ClippingShield
		})
		t4.VRShield = Create("Frame")({
			Name = "VRBackground",
			Parent = t4.Shield,
			BackgroundColor3 = v55,
			BackgroundTransparency = v56,
			Position = UDim2.new(0, -4, 0, 24),
			Size = UDim2.new(1, 8, 1, -40),
			BorderSizePixel = 0,
			Visible = false
		})

		local EngineFeature2 = game:GetEngineFeature("CoreScriptVersionEnabled")

		if EngineFeature2 then
			t4.VersionContainer = Create("ScrollingFrame")({
				Name = "VersionContainer",
				Parent = t4.Shield,
				CanvasSize = UDim2.new(0, 0, 0, v59),
				BackgroundColor3 = v55,
				BackgroundTransparency = v56,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, v59),
				AnchorPoint = Vector2.new(0, 1),
				BorderSizePixel = 0,
				AutoLocalize = false,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				ZIndex = 5,
				Visible = false
			})
		else
			t4.VersionContainer = Create("Frame")({
				Name = "VersionContainer",
				Parent = t4.Shield,
				BackgroundColor3 = v55,
				BackgroundTransparency = v56,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, v59),
				AnchorPoint = Vector2.new(0, 1),
				BorderSizePixel = 0,
				AutoLocalize = false,
				ZIndex = 5,
				Visible = false
			})
		end

		local v315 = Create("UIListLayout")({
			Name = "VersionContainer",
			Parent = t4.VersionContainer,
			Padding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		if t1.GetFFlagDisplayServerChannel() then
			t4.ServerChannelLabel = Create("TextLabel")({
				Name = "ServerChannelLabel",
				Parent = t4.VersionContainer,
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
				Text = "Server Channel: ...",
				Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				ZIndex = 5
			})
			spawn(function() -- line: 1169
				-- upvalues: v113 (copy), RobloxTranslator (copy), t4 (copy), GetServerChannelBlocking (copy), EngineFeature2 (copy), v59 (copy)
				local s7 = "Server Channel: "

				if v113 then
					if not RobloxTranslator then
						s7 = "Server Channel: "
					else
						local ok, result = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.ServerChannel")

						s7 = not ok and "Server Channel: " or result
					end
				end

				t4.ServerChannelLabel.Text = s7 .. GetServerChannelBlocking()

				local ServerChannelLabel = t4.ServerChannelLabel
				local uDim2_7 = UDim2.new(0.2, -6, 1, 0)

				ServerChannelLabel.Size = EngineFeature2 and UDim2.new(0, ServerChannelLabel.TextBounds.X + 6, 0, v59) or uDim2_7
				t4.ServerChannelLabel.TextScaled = not (EngineFeature2 or t4.ServerChannelLabel.TextFits)
			end)
		end

		t4.ServerVersionLabel = Create("TextLabel")({
			Name = "ServerVersionLabel",
			Parent = t4.VersionContainer,
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
			Text = "Server Version: ...",
			Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 5
		})
		spawn(function() -- line: 1193
			-- upvalues: v113 (copy), RobloxTranslator (copy), t4 (copy), u89 (ref), GetServerVersion (ref), EngineFeature2 (copy), v59 (copy)
			local s8 = "Server Version: "

			if v113 then
				if not RobloxTranslator then
					s8 = "Server Version: "
				else
					local ok, result = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.ServerVersion")

					s8 = not ok and "Server Version: " or result
				end
			end

			local ServerVersionLabel = t4.ServerVersionLabel
			local v583

			if u89 then
				v583 = u89
			else
				if not GetServerVersion then
					repeat
						wait()
					until GetServerVersion
				end

				u89 = GetServerVersion:InvokeServer()
				v583 = u89
			end

			ServerVersionLabel.Text = s8 .. v583

			local ServerVersionLabel2 = t4.ServerVersionLabel
			local uDim2_8 = UDim2.new(0.2, -6, 1, 0)

			ServerVersionLabel2.Size = EngineFeature2 and UDim2.new(0, ServerVersionLabel2.TextBounds.X + 6, 0, v59) or uDim2_8
			t4.ServerVersionLabel.TextScaled = not (EngineFeature2 or t4.ServerVersionLabel.TextFits)
		end)

		local s9 = "Client Version: "

		if v113 then
			if not RobloxTranslator then
				s9 = "Client Version: "
			else
				local ok, result = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.ClientVersion")

				s9 = not ok and "Client Version: " or result
			end
		end

		local RobloxVersion = RunService:GetRobloxVersion()
		local ok, result = pcall(function() -- line: 1209
			-- upvalues: RunService (copy)
			return RunService.ClientGitHash
		end)

		if ok then
			RobloxVersion = string.format("%s (%.6s)", RobloxVersion, result)
		end

		t4.ClientVersionLabel = Create("TextLabel")({
			Name = "ClientVersionLabel",
			Parent = t4.VersionContainer,
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
			Text = s9 .. RobloxVersion,
			Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 5
		})

		local ClientVersionLabel = t4.ClientVersionLabel
		local uDim2_9 = UDim2.new(0.2, -6, 1, 0)

		ClientVersionLabel.Size = EngineFeature2 and UDim2.new(0, ClientVersionLabel.TextBounds.X + 6, 0, v59) or uDim2_9
		t4.ClientVersionLabel.TextScaled = not (EngineFeature2 or t4.ClientVersionLabel.TextFits)
		t4.PlaceVersionLabel = Create("TextLabel")({
			Name = "PlaceVersionLabel",
			Parent = t4.VersionContainer,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
			Text = "Place Version: ...",
			Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 5
		})

		local function setPlaceVersionText() -- line: 1246
			-- upvalues: v113 (copy), RobloxTranslator (copy), t4 (copy), t1 (copy), HttpRbxApiService (copy), HttpService (copy), EngineFeature2 (copy), v59 (copy)
			local s10 = "Place Version: "

			if v113 then
				if not RobloxTranslator then
					s10 = "Place Version: "
				else
					local ok2, result2 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.PlaceVersion")

					s10 = not ok2 and "Place Version: " or result2
				end
			end

			local PlaceVersionLabel = t4.PlaceVersionLabel
			local PlaceVersion

			if t1.GetFFlagRemoveAssetVersionEndpoint() then
				PlaceVersion = game.PlaceVersion
			else
				local PlaceVersion2 = game.PlaceVersion

				pcall(function() -- line: 355
					-- upvalues: HttpRbxApiService (copy), HttpService (copy), PlaceVersion2 (ref)
					local Async = HttpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId))
					local VersionNumber = HttpService:JSONDecode(Async)[1].VersionNumber

					PlaceVersion2 = string.format("%s (Latest: %d)", PlaceVersion2, VersionNumber)
				end)
				PlaceVersion = PlaceVersion2
			end

			PlaceVersionLabel.Text = s10 .. PlaceVersion

			local PlaceVersionLabel2 = t4.PlaceVersionLabel
			local uDim2_10 = UDim2.new(0.2, -6, 1, 0)

			PlaceVersionLabel2.Size = EngineFeature2 and UDim2.new(0, PlaceVersionLabel2.TextBounds.X + 6, 0, v59) or uDim2_10
			t4.PlaceVersionLabel.TextScaled = not (EngineFeature2 or t4.PlaceVersionLabel.TextFits)
		end

		game:GetPropertyChangedSignal("PlaceVersion"):Connect(setPlaceVersionText)
		spawn(setPlaceVersionText)

		if not CachedPolicyService:IsSubjectToChinaPolicies() then
			t4.EnvironmentLabel = Create("TextLabel")({
				Name = "EnvironmentLabel",
				Parent = t4.VersionContainer,
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				LayoutOrder = 4,
				TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
				Text = BaseUrl,
				Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				ZIndex = 5,
				Visible = v85
			})

			local EnvironmentLabel = t4.EnvironmentLabel
			local uDim2_11 = UDim2.new(0.2, -6, 1, 0)

			EnvironmentLabel.Size = EngineFeature2 and UDim2.new(0, EnvironmentLabel.TextBounds.X + 6, 0, v59) or uDim2_11
			t4.EnvironmentLabel.TextScaled = not (EngineFeature2 or t4.EnvironmentLabel.TextFits)
		end

		if game:GetEngineFeature("GetPlaySessionIdEnabled") then
			local PlaySessionId = game:GetPlaySessionId()

			if PlaySessionId ~= "" then
				local v328 = "PlaySessionId: " .. PlaySessionId

				if RobloxTranslator then
					v328 = RobloxTranslator:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
						RBX_STR = PlaySessionId
					})
				end

				t4.PlaySessionIdLabel = Create("TextLabel")({
					Name = "PlaySessionIdLabel",
					Parent = t4.VersionContainer,
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
					Text = v328,
					Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					ZIndex = 5
				})

				local PlaySessionIdLabel = t4.PlaySessionIdLabel
				local uDim2_12 = UDim2.new(0.2, -6, 1, 0)

				PlaySessionIdLabel.Size = EngineFeature2 and UDim2.new(0, PlaySessionIdLabel.TextBounds.X + 6, 0, v59) or uDim2_12
				t4.PlaySessionIdLabel.TextScaled = not t4.PlaySessionIdLabel.TextFits
			end
		end

		local function getOverridesPlayerScripts() -- line: 1308
			-- upvalues: StarterPlayer (copy), t1 (copy), v113 (copy), RobloxTranslator (copy)
			local StarterPlayerScripts = StarterPlayer:WaitForChild("StarterPlayerScripts", if not t1.FFlagRemoveLoadingTimeout then nil else 1e999)
			local PlayerScriptsLoader = StarterPlayerScripts:FindFirstChild("PlayerScriptsLoader")
			local PlayerModule = StarterPlayerScripts:FindFirstChild("PlayerModule")

			if PlayerModule and (PlayerScriptsLoader and not PlayerModule.Archivable) then
				if PlayerScriptsLoader.Archivable then
					if v113 then
						if not RobloxTranslator then
							return "Possibly Custom"
						end

						local ok3, result3 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.PossiblyCustom")

						if ok3 then
							return result3
						end

						return "Possibly Custom"
					end

					return "Possibly Custom"
				end

				if v113 then
					if not RobloxTranslator then
						return "Default"
					end

					local ok4, result4 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.Default")

					if ok4 then
						return result4
					end

					return "Default"
				end

				return "Default"
			end

			local CameraScript = StarterPlayerScripts:FindFirstChild("CameraScript")
			local ControlScript = StarterPlayerScripts:FindFirstChild("ControlScript")

			if CameraScript or ControlScript then
				if v113 then
					if not RobloxTranslator then
						return "Custom Old"
					end

					local ok5, result5 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.CustomOld")

					if ok5 then
						return result5
					end

					return "Custom Old"
				end

				return "Custom Old"
			end

			if v113 then
				if not RobloxTranslator then
					return "Custom"
				end

				local ok6, result6 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.CommonUI.Label.Custom")

				if ok6 then
					return result6
				end

				return "Custom"
			end

			return "Custom"
		end

		t4.OverridesPlayerScriptsLabel = Create("TextLabel")({
			Name = "OverridesPlayerScriptsLabel",
			Parent = t4.VersionContainer,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			TextColor3 = Color3.new(1, 1, 1),
			LayoutOrder = 5,
			TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
			Text = "PlayerScripts: ",
			Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 5,
			Visible = false
		})
		spawn(function() -- line: 1361
			-- upvalues: RobloxGui (copy), Players (copy), v113 (copy), RobloxTranslator (copy), getOverridesPlayerScripts (copy), RbxAnalyticsService (copy), Constants (copy), t1 (copy), t4 (copy), v85 (copy), EngineFeature2 (copy), v59 (copy)
			local PlayerPermissionsModule = require(RobloxGui.Modules.PlayerPermissionsModule)

			if not Players.LocalPlayer then
				Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			end

			local s11 = "PlayerScripts: "

			if v113 then
				if not RobloxTranslator then
					s11 = "PlayerScripts: "
				else
					local ok7, result7 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.PlayerScripts")

					s11 = not ok7 and "PlayerScripts: " or result7
				end
			end

			local v611 = getOverridesPlayerScripts()

			RbxAnalyticsService:setRBXEventStream(Constants.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
				defaultPlayerScripts = v611 == "Default",
				placeID = tostring(game.PlaceId),
				rawValue = if not t1.GetFFlagNewEventIngestPlayerScriptsDimensions() then nil else v611,
				context = if not t1.GetFFlagNewEventIngestPlayerScriptsDimensions() then nil else "IGMv1"
			})
			t4.OverridesPlayerScriptsLabel.Text = s11 .. v611
			t4.OverridesPlayerScriptsLabel.Visible = v85 or PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer)

			local OverridesPlayerScriptsLabel = t4.OverridesPlayerScriptsLabel
			local uDim2_13 = UDim2.new(0.2, -6, 1, 0)

			OverridesPlayerScriptsLabel.Size = EngineFeature2 and UDim2.new(0, OverridesPlayerScriptsLabel.TextBounds.X + 6, 0, v59) or uDim2_13
			t4.OverridesPlayerScriptsLabel.TextScaled = not (EngineFeature2 or t4.OverridesPlayerScriptsLabel.TextFits)
		end)

		if EngineFeature2 then
			local s12 = "Client CoreScript Version: "

			if v113 then
				if not RobloxTranslator then
					s12 = "Client CoreScript Version: "
				else
					local ok8, result8 = pcall(RobloxTranslator.FormatByKey, RobloxTranslator, "InGame.HelpMenu.Label.ClientCoreScriptVersion")

					s12 = not ok8 and "Client CoreScript Version: " or result8
				end
			end

			t4.CoreScriptVersionLabel = Create("TextLabel")({
				Name = "CoreScriptVersionLabel",
				Parent = t4.VersionContainer,
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = Theme.textSize(if not v14 then not Utility:IsSmallTouchScreen() and 20 or 14 else 28),
				Text = s12 .. RunService:GetCoreScriptVersion(),
				Font = Theme.font(Enum.Font.SourceSans, "SettingsHub"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				ZIndex = 5
			})

			local CoreScriptVersionLabel = t4.CoreScriptVersionLabel
			local uDim2_14 = UDim2.new(0.2, -6, 1, 0)

			CoreScriptVersionLabel.Size = EngineFeature2 and UDim2.new(0, CoreScriptVersionLabel.TextBounds.X + 6, 0, v59) or uDim2_14

			local VersionContainer = t4.VersionContainer

			v315:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- line: 1408
				-- upvalues: VersionContainer (copy), v315 (copy), v59 (copy)
				VersionContainer.CanvasSize = UDim2.new(0, v315.AbsoluteContentSize.X, 0, v59)
			end)
		end

		t4.Modal = Create("TextButton")({
			Name = "Modal",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 1, 0),
			Modal = true,
			Text = "",
			Parent = t4.Shield,
			Selectable = false
		})

		if t1.FFlagSettingsHubIndependentBackgroundVisibility then
			t4.DarkenBackground = Create("ImageButton")({
				Name = "DarkenBackground",
				ZIndex = t4.Shield.ZIndex - 1,
				BackgroundTransparency = 1,
				BackgroundColor3 = if not t1.isInExperienceUIVREnabled then Theme.color("DarkenBackground") else t4.SettingsUIDelegate:getDarkBackgroundTheme().Color,
				Size = UDim2.new(1, 0, 1, 0),
				Parent = t4.ClippingShield,
				AutoButtonColor = false,
				Visible = false
			})
		else
			t4.DarkenBackground = Create("Frame")({
				Name = "DarkenBackground",
				ZIndex = t4.Shield.ZIndex - 1,
				BackgroundTransparency = 1,
				BackgroundColor3 = Theme.color("DarkenBackground"),
				Size = UDim2.new(1, 0, 1, 0),
				Parent = t4.ClippingShield
			})
		end

		local v338 = Theme.MenuContainerPosition(t4.SettingsUIDelegate)

		t4.MenuContainer = Create("ImageButton")({
			Name = "MenuContainer",
			ZIndex = t4.Shield.ZIndex,
			BackgroundTransparency = Theme.transparency("MenuContainer", 1),
			BackgroundColor3 = Theme.color("MenuContainer"),
			Position = v338.Position,
			Size = v338.Size,
			AnchorPoint = v338.AnchorPoint,
			AutomaticSize = v338.AutomaticSize,
			Parent = t4.Shield
		})

		if t1.FFlagCreateInExperienceMenuReact then
			t4.ReactPage.Parent = t4.MenuContainer
		else
			t4.ReactPage = createReactPage(t4.MenuContainer)
		end

		t4.Page = Create("Frame")({
			Name = "Page",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Parent = t4.MenuContainer
		})

		local Page = t4.Page

		t4.MenuContainerPadding = Create("UIPadding")({
			Parent = Page
		})

		if not v14 then
			local _ = GuiService:GetGuiInset().Y

			t4.MenuContainerPadding.PaddingTop = UDim.new(0, 0)
		end

		local v341 = Theme.HubPadding()

		t4.MenuContainer.AutoButtonColor = false
		t4.MenuContainerPadding.PaddingLeft = v341.PaddingLeft
		t4.MenuContainerPadding.PaddingRight = v341.PaddingRight
		t4.MenuContainerPadding.PaddingBottom = v341.PaddingBottom
		t4.MenuContainerPadding.PaddingTop = v341.PaddingTop
		Create("UICorner")({
			CornerRadius = Theme.MenuContainerCornerRadius,
			Parent = t4.MenuContainer
		})
		getCamMicPermissions(function(p40) -- line: 1510
			-- upvalues: t4 (copy)
			t4.hasMicPermissions = p40.hasMicPermissions
			t4.isFetchingMicPermissions = false
		end, nil, true)
		t4.SettingsShowSignal:connect(function(p41) -- line: 1516
			-- upvalues: default (copy), t1 (copy), t4 (copy)
			if p41 then
				if default:IsSeamlessVoice() and not default.voiceUIVisible then
					if t1.FFlagVoiceRewarmTelemetry then
						local v616, v617, v618, v619 = default:GetConnectDisconnectButtonAnalyticsData(true)

						default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", v616, v617, v618, v619, default.joinVoiceButtonContext)
					else
						default.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", default:GetConnectDisconnectButtonAnalyticsData(true))
					end
				elseif default:IsSeamlessVoice() and default.voiceUIVisible then
					default.Analytics:reportLeaveVoiceButtonEvent("shown", default:GetConnectDisconnectButtonAnalyticsData(true))
				end

				if default:UserVoiceEnabled() and t4.isFetchingMicPermissions then
					return
				end

				if not default:UserOnlyEligibleForVoice() and (not default:UserVoiceEnabled() or t4.hasMicPermissions) then
					return
				end
			end
		end)
		t4.MenuListLayout = Create("UIListLayout")({
			Name = "MenuListLayout",
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Page
		})
		t4.HubBar = Create("ImageLabel")({
			Name = "HubBar",
			BackgroundColor3 = Theme.color("HubBarContainer"),
			BackgroundTransparency = Theme.transparency("HubBarContainerTransparency"),
			ZIndex = t4.Shield.ZIndex + 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			LayoutOrder = 0,
			Parent = Page
		})
		Create("Frame")({
			BackgroundColor3 = Theme.color("Divider"),
			BackgroundTransparency = Theme.transparency("Divider"),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			Parent = t4.HubBar
		})
		t4.HubBarListLayout = Create("UIListLayout")({
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t4.HubBar
		})

		if not t1.FFlagAddTraversalBackButton then
			if t1.EngineFeatureTeleportHistoryButtons then
				t4.BackBarRef = Roact.createRef()
				t4.FrontBarRef = Roact.createRef()
				t4.BackBar = Roact.createElement(RoactAppExperiment.Provider, {
					value = IXPService
				}, {
					AppStyleProvider = Roact.createElement(AppStyleProvider, {
						style = {
							themeName = Dark
						}
					}, {
						ButtonsFrame = Roact.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = -1,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, 0)
						}, {
							BackButton = Roact.createElement(MenuBackButton, {
								BackBarRef = t4.BackBarRef,
								HubBar = t4.HubBar,
								LayoutOrder = 1
							}),
							FrontButton = Roact.createElement(MenuFrontButton, {
								FrontBarRef = t4.FrontBarRef,
								HubBar = t4.HubBar,
								LayoutOrder = 2
							})
						})
					})
				})
				Roact.mount(t4.BackBar, Page, "BackBar")
			else
				t4.BackBarRef = Roact.createRef()
				t4.BackBar = Roact.createElement(RoactAppExperiment.Provider, {
					value = IXPService
				}, {
					AppStyleProvider = Roact.createElement(AppStyleProvider, {
						style = {
							themeName = Dark
						}
					}, {
						BackButton = Roact.createElement(MenuBackButton, {
							BackBarRef = t4.BackBarRef,
							HubBar = t4.HubBar
						})
					})
				})
				Roact.mount(t4.BackBar, Page, "BackBar")
			end
		end

		if Utility:IsSmallTouchScreen() then
			t4.HubBar.Size = UDim2.new(0, RobloxGui.AbsoluteSize.X - 100, 0, 50)
			t4.HubBar.Position = UDim2.new(0.5, 0, 0, 6)
		elseif v14 then
			t4.HubBar.Size = UDim2.new(0, 1200, 0, 100)
			t4.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		else
			t4.HubBar.Size = UDim2.new(0, 800, 0, 60)
			t4.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		end

		t4.VoiceRecordingIndicatorFrame = Create("Frame")({
			Size = if not t1.ChromeEnabled then UDim2.fromOffset(0, 100) else UDim2.new(1, 0, 0, 100),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = t4.HubBar,
			BackgroundTransparency = 1
		})
		t4.VoiceRecordingText = Create("TextLabel")({
			Parent = t4.VoiceRecordingIndicatorFrame,
			Text = "",
			Visible = false,
			Position = UDim2.new(0, 60, 0, 0),
			TextSize = 12,
			Font = AppFonts.default:getMedium(),
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1
		})

		if Utility:IsSmallTouchScreen() then
			t4.VoiceRecordingText.Size = UDim2.fromScale(1, 1)
			t4.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0)

			if t1.ChromeEnabled then
				t4.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t4.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60)
			else
				t4.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60)
			end
		elseif v14 then
			t4.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)

			if t1.ChromeEnabled then
				t4.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t4.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100)
				t4.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				t4.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100)
				t4.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		else
			t4.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)

			if t1.ChromeEnabled then
				t4.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				t4.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60)
				t4.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				t4.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60)
				t4.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		end

		t4.voiceRecordingIndicatorTextMotor = Otter.createSingleMotor(0)
		t4.voiceRecordingIndicatorTextMotor:onStep(function(p42) -- line: 1707
			-- upvalues: t4 (copy)
			t4.VoiceRecordingText.TextTransparency = p42
		end)
		spawn(function() -- line: 1711
			-- upvalues: RunService (copy), t4 (copy), Otter (copy), t2 (copy)
			RunService:BindToRenderStep("VoiceRecordingIndicator", 1, function() -- line: 1712
				-- upvalues: t4 (copy), Otter (copy), t2 (copy)
				if t4.isMuted ~= nil and (t4.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - t4.lastVoiceRecordingIndicatorTextUpdated >= 5 and t4.isMuted) then
					t4.voiceRecordingIndicatorTextMotor:setGoal(Otter.spring(1, t2))
					t4.voiceRecordingIndicatorTextMotor:start()
				end
			end)
		end)
		t4.PageViewClipper = Create("Frame")({
			Name = "PageViewClipper",
			BackgroundTransparency = 1,
			Size = UDim2.new(t4.HubBar.Size.X.Scale, t4.HubBar.Size.X.Offset, 1, -t4.HubBar.Size.Y.Offset - t4.HubBar.Position.Y.Offset - n5),
			Position = UDim2.new(t4.HubBar.Position.X.Scale, t4.HubBar.Position.X.Offset, t4.HubBar.Position.Y.Scale, t4.HubBar.Position.Y.Offset + t4.HubBar.Size.Y.Offset + 1),
			AnchorPoint = Vector2.new(0.5, 0),
			ClipsDescendants = true,
			LayoutOrder = 1,
			Parent = Page,
			Create("ImageButton")({
				Name = "InputCapture",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Image = ""
			})
		})

		if t1.FFlagEnableConsoleExpControls and t1.ChromeEnabled then
			t4.PageViewPadding = Create("UIPadding")({
				Parent = t4.PageViewClipper
			})

			local Service = require(RobloxGui.Modules.Chrome.Service)

			Service:onShortcutBarChanged():connect(function() -- line: 1753
				-- upvalues: Utility (copy), Service (copy), t4 (copy), Theme (copy)
				if Utility:IsSmallTouchScreen() and Service:getCurrentShortcutBar():get() ~= nil then
					t4.PageViewPadding.PaddingBottom = UDim.new(0, Theme.ExtraPageBottomPaddingMobile)

					return
				end

				t4.PageViewPadding.PaddingBottom = UDim.new(0, 0)
			end)
		end

		t4.PageView = Create("ScrollingFrame")({
			Name = "PageView",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 2),
			Size = UDim2.new(1, 0, 1, -20),
			CanvasSize = UDim2.new(1, 0, 1, 0),
			ZIndex = t4.Shield.ZIndex,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			ScrollBarThickness = Theme.DefaultScrollBarThickness,
			Parent = t4.PageViewClipper
		})
		t4.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		t4.PageViewInnerFrame = Create("Frame")({
			Name = "PageViewInnerFrame",
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = t4.Shield.ZIndex,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Parent = t4.PageView,
			LayoutOrder = 1
		})
		Create("UIPadding")({
			PaddingTop = UDim.new(0, 5),
			Parent = t4.PageViewInnerFrame
		})
		t4.InnerCanvasGroupShow = Create("CanvasGroup")({
			Name = "InnerCanvasGroupShow",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Parent = t4.PageViewInnerFrame
		})
		t4.InnerCanvasGroupHide = Create("CanvasGroup")({
			Name = "InnerCanvasGroupHide",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 0,
			Visible = false,
			Parent = t4.PageViewInnerFrame
		})

		if UserInputService.MouseEnabled then
			t4.PageViewClipper.Size = UDim2.new(t4.HubBar.Size.X.Scale, t4.HubBar.Size.X.Offset, 0.5, -(t4.HubBar.Position.Y.Offset - t4.HubBar.Size.Y.Offset))
		end

		t4.BottomButtonFrame = Create("Frame")({
			Name = "BottomButtonFrame",
			Size = t4.HubBar.Size,
			Position = UDim2.new(0.5, -t4.HubBar.Size.X.Offset / 2, 1 - t4.HubBar.Position.Y.Scale - t4.HubBar.Size.Y.Scale, -t4.HubBar.Position.Y.Offset - t4.HubBar.Size.Y.Offset),
			ZIndex = t4.Shield.ZIndex + 1,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Parent = Page,
			Selectable = not t1.FFlagIEMFocusNavToButtons and nil,
			SelectionGroup = not not t1.FFlagIEMFocusNavToButtons or nil,
			SelectionBehaviorLeft = if not t1.FFlagIEMFocusNavToButtons then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = if not t1.FFlagIEMFocusNavToButtons then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = if not t1.FFlagIEMFocusNavToButtons then nil else Enum.SelectionBehavior.Stop
		})

		if t1.FFlagTraversalPerfFixes then
			t4.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- line: 1840
				-- upvalues: t4 (copy)
				t4.setShowBottomBarSignal(t4.BottomButtonFrame.Visible)
			end)
		end

		local function v343(p43) -- line: 1845
			-- upvalues: t1 (copy), setVisibilityInternal (ref), t4 (copy), RbxAnalyticsService (copy), Constants (copy), GuiService (copy)
			if t1.FFlagAddUILessMode then
				setVisibilityInternal(false, nil, nil, nil, p43)
			else
				setVisibilityInternal(false)
			end

			if t1.FFlagAddUILessMode and t1.FIntAddUILessModeVariant ~= 0 and t4.uiLessStore.getUILessModeEnabled(false) then
				t4.uiLessStore.setUIVisible(false)
			end

			RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsResumeGameName, Constants.AnalyticsMenuActionName, {
				source = p43,
				playsessionid = t4.playSessionId,
				universeid = tostring(game.GameId)
			})

			if t1.FFlagIEMResumeButtonPressBugfix then
				GuiService.SelectedCoreObject = nil
			end
		end

		if not t1.FFlagMenuButtonsMountWithIEM and t1.FFlagRelocateMobileMenuButtons and (t1.FIntRelocateMobileMenuButtonsVariant == 1 or t1.FIntRelocateMobileMenuButtonsVariant == 3 or t1.FIntRelocateMobileMenuButtonsVariant == 2 and not Utility:IsSmallTouchScreen()) then
			v165()
		end

		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 or t1.FIntRelocateMobileMenuButtonsVariant == 2 and Utility:IsSmallTouchScreen() then
			t4.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80)
		end

		t4.MenuListLayout = Create("UIListLayout")({
			Padding = UDim.new(0, 12),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t4.BottomButtonFrame
		})

		if t1.FFlagEnableSystemScrimInSettingsHub then
			local v344 = require(CorePackages.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false)

			v344.backgroundScrimActivated.Event:Connect(function() -- line: 1894
				-- upvalues: t1 (copy), t4 (copy), Constants (copy), v343 (copy)
				if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t4:GetExperienceControlStore().onResume(Constants.AnalyticsResumeShieldSource)

					return
				end

				v343(Constants.AnalyticsResumeShieldSource)
			end)
			t4.Shield:GetPropertyChangedSignal("Visible"):Connect(function() -- line: 1902
				-- upvalues: v344 (copy), t4 (copy)
				v344.setTransparency(1)
				v344.setAutoDismiss(true)
				v344.setVisibility(t4.Shield.Visible)
			end)
		end

		t4.Shield.Activated:Connect(function() -- line: 1909
			-- upvalues: t1 (copy), t4 (copy), Constants (copy), v343 (copy)
			if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				t4:GetExperienceControlStore().onResume(Constants.AnalyticsResumeShieldSource)

				return
			end

			v343(Constants.AnalyticsResumeShieldSource)
		end)

		if t1.FFlagSettingsHubIndependentBackgroundVisibility then
			t4.DarkenBackground.Activated:Connect(function() -- line: 1919
				-- upvalues: t1 (copy), t4 (copy), Constants (copy), v343 (copy), InExperienceAppChatModal (copy)
				if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					t4:GetExperienceControlStore().onResume(Constants.AnalyticsResumeShieldSource)
				else
					v343(Constants.AnalyticsResumeShieldSource)
				end

				InExperienceAppChatModal.default:setVisible(false)
			end)
		end

		if not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 then
			local function v345() -- line: 1930
				-- upvalues: t1 (copy), t4 (copy), removeBottomBarBindings (copy), Constants2 (copy)
				if t1.FFlagPreventHiddenSwitchPage and t4:GetVisibility() == false then
					return
				end

				t4:AddToMenuStack(t4.Pages.CurrentPage)
				t4.HubBar.Visible = false
				removeBottomBarBindings()

				if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() and t4.leaveGameUpsellProp ~= Constants2.PHONE_UPSELL_VALUE_PROP.None then
					t4:SwitchToPage(t4.LeaveGameUpsellPage, nil, 1, true)

					return
				end

				t4:SwitchToPage(t4.LeaveGamePage, nil, 1, true)
			end

			if InExperienceCapabilities.canNavigateHome then
				addBottomBarButtonOld("LeaveGame", "Leave", ImageForKeyCode2, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, not v14 and -130 or -160, 0.5, -25), v345, {
					Enum.KeyCode.L,
					if not not t1.FFlagEnableConsoleExpControls and t1.ChromeEnabled then nil else Enum.KeyCode.ButtonX
				}, v345)
			end

			local function v346() -- line: 1954
				-- upvalues: u157 (ref), t4 (copy), removeBottomBarBindings (copy)
				if u157 then
					t4:AddToMenuStack(t4.Pages.CurrentPage)
					t4.HubBar.Visible = false
					removeBottomBarBindings()
					t4:SwitchToPage(t4.ResetCharacterPage, nil, 1, true)
				end
			end

			local v347 = v146:Format(Constants.RespawnLocalizedKey)

			addBottomBarButtonOld("ResetCharacter", v347, ImageForKeyCode3, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, not v14 and -400 or -550, 0.5, -25), v346, {
				Enum.KeyCode.R,
				if not not t1.FFlagEnableConsoleExpControls and t1.ChromeEnabled then nil else Enum.KeyCode.ButtonY
			}, v346)
			addBottomBarButtonOld("Resume", "Resume", if not t1.FFlagEnableConsoleExpControls then ImageForKeyCode else ImageForKeyCode4, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, not v14 and 140 or 200, 0.5, -25), function() -- line: 1970
				-- upvalues: v343 (copy), Constants (copy)
				v343(Constants.AnalyticsResumeButtonSource)
			end, if not not t1.FFlagEnableConsoleExpControls and t1.ChromeEnabled then {} else {
				Enum.KeyCode.ButtonB,
				Enum.KeyCode.ButtonStart
			}, function() -- line: 1973
				-- upvalues: v343 (copy), Constants (copy)
				v343(Constants.AnalyticsResumeGamepadSource)
			end)
		end

		if t1.FFlagAddSwitchTabHintsToIEM then
			local function MountSwitchTabHint(t6: {[any]: any}) -- line: 1983
				-- upvalues: Create (copy), ReactRoblox (copy), React (copy), FoundationProvider (copy), Foundation (copy), Utils (copy), SwitchTabHint (copy)
				local v623 = Create("Frame")({
					Name = "SwitchTabHintContainer",
					Size = UDim2.fromScale(0, 1),
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					LayoutOrder = t6.layoutOrder,
					Parent = t6.parent
				})

				ReactRoblox.createRoot(v623):render(React.createElement(React.Fragment, nil, React.createElement("UIListLayout", {
					Name = "SwitchTabHintCenterAlign",
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}), React.createElement(FoundationProvider, {
					theme = Foundation.Enums.Theme.Dark,
					device = Utils.getDeviceType()
				}, {
					["SwitchTabHint" .. t6.keycode.Name] = React.createElement(SwitchTabHint, {
						keycode = t6.keycode
					})
				})))
			end

			t4.TabHeaderContainer = Create("Frame")({
				Name = "TabHeaderContainer",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Parent = t4.HubBar
			})
			t4.TabHeaderContainerListLayout = Create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = t4.TabHeaderContainer
			})
			MountSwitchTabHint({
				keycode = Enum.KeyCode.ButtonL1,
				parent = t4.TabHeaderContainer,
				layoutOrder = -999
			})
			MountSwitchTabHint({
				keycode = Enum.KeyCode.ButtonR1,
				parent = t4.TabHeaderContainer,
				layoutOrder = 999
			})
		end

		t4.HubBarContainer = Create("ImageLabel")({
			Name = "HubBarContainer",
			ZIndex = t4.Shield.ZIndex + 2,
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.color("HubBarContainer"),
			BackgroundTransparency = Theme.transparency("HubBarContainerTransparency"),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = if not t1.FFlagAddSwitchTabHintsToIEM then t4.HubBar else t4.TabHeaderContainer,
			Selectable = not t1.FFlagIEMTabFocusNav and nil,
			SelectionGroup = not not t1.FFlagIEMTabFocusNav or nil,
			SelectionBehaviorUp = if not t1.FFlagIEMTabFocusNav then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = if not t1.FFlagIEMTabFocusNav then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = if not t1.FFlagIEMTabFocusNav then nil else Enum.SelectionBehavior.Stop
		})
		t4.HubBar.ImageTransparency = 1
		t4.HubBarListLayout.Parent = t4.HubBarContainer

		if isSubjectToDesktopPolicies() then
			t4.FullScreenTitleBar = SettingsFullScreenTitleBar.mount({}, t4.Shield, "FullScreenTitleBar")
		end

		local function cameraViewportChanged() -- line: 2069
			-- upvalues: Theme (copy), Utility (copy)
			Theme.viewportResized()
			Utility:FireOnResized()
		end

		local connection2 = nil

		Theme.viewportResized()
		Utility:FireOnResized()

		if connection2 then
			connection2:disconnect()
		end

		connection2 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
		workspace.Changed:Connect(function(property) --[[ onWorkspaceChanged ]] -- line: 2075
			-- upvalues: Theme (copy), Utility (copy), connection2 (ref), cameraViewportChanged (copy)
			if property == "CurrentCamera" then
				Theme.viewportResized()
				Utility:FireOnResized()

				if connection2 then
					connection2:disconnect()
				end

				connection2 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(cameraViewportChanged)
			end
		end)
	end)()

	if v106 then
		setupVoiceListeners()
	end

	function GetHeaderPosition(p44) -- line: 2524
		-- upvalues: t4 (copy)
		local TabHeader = p44:GetTabHeader()

		if not TabHeader then
			return -1
		end

		for k, v in pairs(t4.TabHeaders) do
			if v == TabHeader then
				return k
			end
		end

		return -1
	end
	function u176(p45, p46) -- line: 2538
		-- upvalues: u176 (ref)
		if p46:IsA("GuiObject") then
			p46.ZIndex = p45

			local children = p46:GetChildren()

			for i = 1, #children do
				u176(p45, children[i])
			end
		end
	end

	local function AddHeader(p47, p48) -- line: 2548
		-- upvalues: t4 (copy), u176 (ref)
		if not p47 then
			return
		end

		table.insert(t4.TabHeaders, p47)
		p48.TabPosition = #t4.TabHeaders

		local v408 = 1 / #t4.TabHeaders

		for i = 1, #t4.TabHeaders do
			t4.TabHeaders[i].Size = UDim2.new(v408, 0, 1, 0)
		end

		u176(3, p47)
		p47.Parent = t4.HubBarContainer
	end
	local function RemoveHeader(p49) -- line: 2564
		-- upvalues: t4 (copy)
		local v411 = nil

		for i = 1, #t4.TabHeaders do
			if p49 == t4.TabHeaders[i] then
				v411 = i
				table.remove(t4.TabHeaders, i)

				break
			end
		end

		if v411 then
			for i = v411, #t4.TabHeaders do
				local v414 = t4.TabHeaders[i]

				v414.Position = UDim2.new(v414.Position.X.Scale, v414.Position.X.Offset - p49.AbsoluteSize.X, v414.Position.Y.Scale, v414.Position.Y.Offset)
			end
		end

		p49.Parent = nil
	end

	function t4.AddPage(_, p51) -- line: 2587
		-- upvalues: t4 (copy), AddHeader (copy), t1 (copy), setBottomBarSelection (copy)
		t4.Pages.PageTable[p51] = true
		AddHeader(p51:GetTabHeader(), p51)
		p51.Page.Position = UDim2.new(p51.TabPosition - 1, 0, 0, 0)

		if t1.FFlagIEMFocusNavToButtons then
			p51.LastSelectableObjectsUpdated:connect(function() -- line: 2592
				-- upvalues: setBottomBarSelection (copy), p51 (copy)
				setBottomBarSelection(p51)
			end)
		end

		if t1.FFlagIEMTabFocusNav then
			if t1.FFlagIEMTabFocusNav then
				local TabHeader = p51:GetTabHeader()

				if TabHeader then
					for _, v419 in p51.FirstSelectableObjects do
						v419.NextSelectionUp = TabHeader
						TabHeader.NextSelectionDown = v419
					end
				end
			end

			if t1.FFlagIEMTabFocusNav then
				for _, v421 in t4.TabHeaders do
					v421.NextSelectionLeft = nil
					v421.NextSelectionRight = nil
				end

				local v422 = #t4.TabHeaders

				if not (v422 < 2) then
					t4.TabHeaders[1].NextSelectionLeft = t4.TabHeaders[v422]
					t4.TabHeaders[v422].NextSelectionRight = t4.TabHeaders[1]
				end
			end

			p51.FirstSelectableObjectsUpdated:connect(function() -- line: 2599
				-- upvalues: p51 (copy), t1 (copy)
				local v625 = p51

				if not t1.FFlagIEMTabFocusNav then
					return
				end

				local TabHeader = v625:GetTabHeader()

				if not TabHeader then
					return
				end

				for _, v628 in v625.FirstSelectableObjects do
					v628.NextSelectionUp = TabHeader
					TabHeader.NextSelectionDown = v628
				end
			end)
		end
	end
	function t4.RemovePage(_, p53) -- line: 2605
		-- upvalues: t4 (copy), RemoveHeader (copy), t1 (copy)
		t4.Pages.PageTable[p53] = nil
		RemoveHeader(p53:GetTabHeader())

		if t1.FFlagIEMFocusNavToButtons then
			p53.LastSelectableObjectsUpdated:disconnect()
		end

		if t1.FFlagIEMTabFocusNav then
			p53.FirstSelectableObjectsUpdated:disconnect()

			if not t1.FFlagIEMTabFocusNav then
				return
			end

			for _, v426 in t4.TabHeaders do
				v426.NextSelectionLeft = nil
				v426.NextSelectionRight = nil
			end

			local v427 = #t4.TabHeaders

			if v427 < 2 then
				return
			end

			t4.TabHeaders[1].NextSelectionLeft = t4.TabHeaders[v427]
			t4.TabHeaders[v427].NextSelectionRight = t4.TabHeaders[1]
		end
	end
	function t4.HideBar(_) -- line: 2617
		-- upvalues: t4 (copy), removeBottomBarBindings (copy)
		t4.HubBar.Visible = false
		t4.PageViewClipper.Visible = false

		if t4.BottomButtonFrame then
			removeBottomBarBindings()
		end
	end
	function t4.ShowBar(_) -- line: 2625
		-- upvalues: t4 (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), t1 (copy), setBottomBarSelection (copy)
		t4.HubBar.Visible = true
		t4.PageViewClipper.Visible = true

		if t4.BottomButtonFrame and shouldShowBottomBar() then
			setBottomBarBindings()

			if t1.FFlagIEMFocusNavToButtons then
				setBottomBarSelection(t4.Pages.CurrentPage)
			end
		end
	end
	function t4.ScrollPixels(_, p57) -- line: 2636
		-- upvalues: t4 (copy)
		local CanvasPositionY = t4.PageView.CanvasPosition.Y
		local v433 = t4.PageView.CanvasSize.Y.Offset - t4.PageViewClipper.AbsoluteSize.y
		local v434 = math.max(0, (math.min(CanvasPositionY + p57, v433)))

		t4.PageView.CanvasPosition = Vector2.new(0, v434)
	end
	function t4.ScrollToFrame(_, p59, p60) -- line: 2644
		-- upvalues: u169 (ref), t4 (copy), Constants (copy)
		if u169 or p60 then
			local v438 = p59.AbsolutePosition.y - t4.Pages.CurrentPage.Page.AbsolutePosition.y
			local v439 = v438 + p59.AbsoluteSize.y

			if v438 < t4.PageView.CanvasPosition.y then
				t4.PageView.CanvasPosition = Vector2.new(0, v438)

				return
			end

			if t4.Pages.CurrentPage.Page.Name == Constants.PeoplePageKey and v439 - t4.PageView.CanvasPosition.y > t4.PageView.AbsoluteSize.Y - Constants.PeoplePageScrollBuffer then
				t4.PageView.CanvasPosition = Vector2.new(0, v439 - t4.PageView.AbsoluteSize.Y + Constants.PeoplePageScrollBuffer)

				return
			end

			if v439 - t4.PageView.CanvasPosition.y > t4.PageViewClipper.Size.Y.Offset then
				t4.PageView.CanvasPosition = Vector2.new(0, v439 - t4.PageViewClipper.Size.Y.Offset)
			end
		end
	end
	function t4.GetFirstPageWithTabHeader(_) -- line: 2659
		-- upvalues: t4 (copy)
		local v441 = nil

		for k, _ in pairs(t4.Pages.PageTable) do
			if k:GetTabHeader() ~= nil and k.TabPosition == 1 then
				v441 = k

				break
			end
		end

		if v441 == nil then
			error("No page with tab header found")

			return nil
		end

		return v441
	end
	function t4.InitInPage(_, p63) -- line: 2678
		-- upvalues: t4 (copy), t1 (copy), Utility (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), u139 (ref)
		local TabPosition = p63.TabPosition

		for k, _ in pairs(t4.Pages.PageTable) do
			if k ~= p63 then
				k:Hide(-1, TabPosition, true, nil, t4.PageViewInnerFrame)
			end
		end

		if (not t1.FFlagRelocateMobileMenuButtons or t1.FIntRelocateMobileMenuButtonsVariant == 0 or t1.FIntRelocateMobileMenuButtonsVariant == 2 and Utility:IsSmallTouchScreen()) and t4.BottomButtonFrame then
			if shouldShowBottomBar(p63) then
				setBottomBarBindings()

				if t1.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(p63)
				end
			else
				t4.BottomButtonFrame.Visible = false
			end

			t4.HubBar.Visible = (p63 or t4.Pages.CurrentPage).ShouldShowBottomBar == true
		end

		local v449 = p63.IsPageClipped == true

		t4.PageViewClipper.ClipsDescendants = v449
		t4.PageView.ClipsDescendants = v449
		t4.PageViewInnerFrame.ClipsDescendants = v449
		t4.Pages.CurrentPage = p63
		t4.Pages.CurrentPage.Active = true
		t4.CurrentPageSignal:fire(t4.Pages.CurrentPage and t4.Pages.CurrentPage.Page.Name or nil)

		local Size = t4.Pages.CurrentPage:GetSize()

		t4.PageView.CanvasSize = UDim2.new(0, 0, 0, Size.Y)
		u139 = t4.Pages.CurrentPage.Page.Changed:connect(function(p64) -- line: 2717
			-- upvalues: t4 (copy)
			if p64 == "AbsoluteSize" then
				local Size2 = t4.Pages.CurrentPage:GetSize()

				t4.PageView.CanvasSize = UDim2.new(0, 0, 0, Size2.Y)
			end
		end)
	end
	function t4.SwitchToPage(_, p66, p67, p68, p69, _, p71) -- line: 2725
		-- upvalues: t4 (copy), t1 (copy), v107 (copy), Utility (copy), Theme (copy), shouldShowBottomBar (copy), u139 (ref), setBottomBarBindings (copy), setBottomBarSelection (copy), onScreenSizeChanged (copy), Cryo (copy), IXPServiceWrapper (copy), RbxAnalyticsService (copy), Constants (copy), Flags (copy), ExperienceMenuSessionManagerInstance (copy)
		if t4.Pages.PageTable[p66] == nil then
			return
		end

		if t1.FFlagPreventHiddenSwitchPage and t4:GetVisibility() == false then
			return
		end

		if v107 then
			if p66.Page.Name == "ReportAbuseMenuNewContainerPage" then
				t4.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0)
			else
				t4.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5)
			end
		end

		local uDim = UDim.new(0, 0)
		local uDim3 = UDim.new(0, 0)
		local v460 = not (Utility:IsPortrait() or Utility:IsSmallTouchScreen()) or Theme.AlwaysShowBottomBar()

		if t1.FFlagRelocateMobileMenuButtons and (t1.FIntRelocateMobileMenuButtonsVariant == 1 or t1.FIntRelocateMobileMenuButtonsVariant == 3 or t1.FIntRelocateMobileMenuButtonsVariant == 2 and not Utility:IsSmallTouchScreen()) then
			v460 = true
		end

		if t4.HubBar and (p66 or t4.Pages.CurrentPage).ShouldShowBottomBar ~= true and not p66.DisableTopPadding then
			uDim = UDim.new(0, t4.HubBar.AbsoluteSize.Y)
		end

		if t4.BottomButtonFrame and v460 and not shouldShowBottomBar(p66) and (not t1.FFlagAddNextUpContainer or not p66.ShrinkwrapPageViewClipper) then
			uDim3 = UDim.new(0, t4.BottomButtonFrame.AbsoluteSize.Y)
		end

		local v461 = Theme.HubPadding()

		t4.MenuContainerPadding.PaddingLeft = v461.PaddingLeft
		t4.MenuContainerPadding.PaddingRight = v461.PaddingRight
		t4.MenuContainerPadding.PaddingBottom = v461.PaddingBottom + uDim3
		t4.MenuContainerPadding.PaddingTop = v461.PaddingTop + uDim

		local v462 = Theme.MenuContainerPosition(t4.SettingsUIDelegate)

		t4.MenuContainer.Position = v462.Position
		t4.MenuContainer.Size = v462.Size
		t4.MenuContainer.AnchorPoint = v462.AnchorPoint

		if t1.FFlagAddNextUpContainer and p66.ShrinkwrapPageViewClipper then
			local PageViewClipperSize = t4.PageViewClipper.Size
			local Size = p66:GetSize()

			t4.PageViewClipper.Size = UDim2.new(PageViewClipperSize.X.Scale, t4.HubBar.Size.X.Offset, PageViewClipperSize.Y.Scale, Size.Y)
		end

		if p68 == nil and t4.Pages.CurrentPage and t4.Pages.CurrentPage.TabHeader and p66 and p66.TabHeader then
			p68 = not (t4.Pages.CurrentPage.TabHeader.AbsolutePosition.x < p66.TabHeader.AbsolutePosition.x) and -1 or 1
		end

		if p68 == nil then
			p68 = 1
		end

		if t4.Pages.CurrentPage and u139 ~= nil then
			u139:disconnect()
			t4.Pages.CurrentPage.Active = false
		end

		local TabPosition = p66.TabPosition

		for k, _ in pairs(t4.Pages.PageTable) do
			if k ~= p66 then
				k:Hide(-p68, TabPosition, p69, nil, t4.PageViewInnerFrame, k == t4.Pages.CurrentPage)
			end
		end

		if t4.BottomButtonFrame then
			if shouldShowBottomBar(p66) then
				setBottomBarBindings()

				if t1.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(p66)
				end
			else
				t4.BottomButtonFrame.Visible = false
			end

			t4.HubBar.Visible = (p66 or t4.Pages.CurrentPage).ShouldShowBottomBar == true
		end

		if t1.FFlagIEMTabFocusNav and t1.FFlagIEMTabFocusNav then
			local TabHeader = p66:GetTabHeader()

			if TabHeader then
				for _, v470 in p66.FirstSelectableObjects do
					v470.NextSelectionUp = TabHeader
					TabHeader.NextSelectionDown = v470
				end
			end
		end

		local v471 = p66.IsPageClipped == true

		t4.PageViewClipper.ClipsDescendants = v471
		t4.PageView.ClipsDescendants = v471
		t4.PageViewInnerFrame.ClipsDescendants = v471
		t4.Pages.CurrentPage = p66
		t4.Pages.CurrentPage:Display(t4.PageViewInnerFrame, p69)
		t4.Pages.CurrentPage.Active = true
		t4.CurrentPageSignal:fire(t4.Pages.CurrentPage and t4.Pages.CurrentPage.Page.Name or nil)

		if t1.FFlagAddAbilityToDisableIGMScroll then
			local v472 = nil or t4.Pages.CurrentPage

			if v472 ~= nil and v472.ShouldDisableDefaultScroll == true then
				t4.PageView.ScrollBarThickness = 0
				t4.PageView.ScrollingEnabled = false
				t4.PageView.CanvasPosition = Vector2.new(0, 0)
				t4.PageView.CanvasSize = UDim2.new(1, 0, 1, 0)
			else
				t4.PageView.ScrollBarThickness = Theme.DefaultScrollBarThickness
				t4.PageView.ScrollingEnabled = true
			end
		end

		if t1.FFlagAddAbilityToDisableIGMScroll then
			local v473 = nil or t4.Pages.CurrentPage

			if v473 == nil or v473.ShouldDisableDefaultScroll ~= true then
				local Size = t4.Pages.CurrentPage:GetSize()

				t4.PageView.CanvasSize = UDim2.new(0, 0, 0, Size.Y)
			end
		else
			local Size = t4.Pages.CurrentPage:GetSize()

			t4.PageView.CanvasSize = UDim2.new(0, 0, 0, Size.Y)
		end

		u139 = t4.Pages.CurrentPage.Page.Changed:connect(function(p72) -- line: 2848
			-- upvalues: t1 (copy), t4 (copy), onScreenSizeChanged (copy)
			if p72 == "AbsoluteSize" then
				if t1.FFlagAddAbilityToDisableIGMScroll then
					local v632 = nil or t4.Pages.CurrentPage

					if v632 ~= nil and v632.ShouldDisableDefaultScroll == true then
						return
					end
				end

				local Size = t4.Pages.CurrentPage:GetSize()

				t4.PageView.CanvasSize = UDim2.new(0, 0, 0, Size.Y)

				if t1.FFlagAddNextUpContainer and t4.Pages.CurrentPage.ShrinkwrapPageViewClipper then
					onScreenSizeChanged()
				end
			end
		end)

		if t4.MenuStack[#t4.MenuStack] ~= t4.Pages.CurrentPage and not p67 then
			t4.MenuStack[#t4.MenuStack + 1] = t4.Pages.CurrentPage
		end

		if t1.FFlagAddNextUpContainer then
			onScreenSizeChanged()
		elseif p66.DisableTopPadding then
			onScreenSizeChanged()
		end

		local t7 = {
			universeid = tostring(game.GameId)
		}

		if t1.GetFFlagReportAbuseMenuEntrypointAnalytics() and p71 then
			t7 = Cryo.Dictionary.join(t7, p71)
		end

		if t1.FFlagRespawnChromeShortcutTelemetry and t7.used_shortcut == nil then
			t7.used_shortcut = false
		end

		if t7.playsessionid == nil then
			t7.playsessionid = t4.playSessionId
		end

		if p66 then
			if t1.FFlagHelpPageIXPExposure and p66 == t4.HelpPage and not t4.HelpPageIXPFetched then
				IXPServiceWrapper:LogUserLayerExposure(t1.FStringHelpPageIXPLayer)
				t4.HelpPageIXPFetched = true
			end

			if p66 == t4.GameSettingsPage then
				RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, "open_GameSettings_tab", Constants.AnalyticsMenuActionName, t7)

				if Flags.FFlagIEMSettingsLogExposureIXPFlags and not t4.GameSettingsPageReorderIXPFetched then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(t1.GetFStringInExperienceMenuIXPLayer())
					t4.GameSettingsPageReorderIXPFetched = true
				end
			else
				RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, "open_" .. p66.Page.Name .. "_tab", Constants.AnalyticsMenuActionName, t7)
			end

			ExperienceMenuSessionManagerInstance:MenuSwitchToPage(p66.Page)

			return
		end

		RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, "open_unknown_tab", Constants.AnalyticsMenuActionName, t7)
		ExperienceMenuSessionManagerInstance:CloseOpenedMenuTab()
	end
	function t4.SetActive(_, p74) -- line: 2913
		-- upvalues: t4 (copy)
		t4.Active = p74

		if t4.Pages.CurrentPage then
			t4.Pages.CurrentPage.Active = p74
		end
	end
	function clearMenuStack() -- line: 2921
		-- upvalues: t4 (copy)
		while t4.MenuStack and #t4.MenuStack > 0 do
			t4:PopMenu()
		end
	end
	function setOverrideMouseIconBehavior() -- line: 2927
		-- upvalues: t4 (copy), UserInputService (copy), VRService (copy), MouseIconOverrideService (copy), v58 (copy)
		if not t4.Visible then
			return
		end

		if UserInputService:GetLastInputType() == Enum.UserInputType.Gamepad1 or VRService.VREnabled then
			MouseIconOverrideService.push(v58, Enum.OverrideMouseIconBehavior.ForceHide)

			return
		end

		MouseIconOverrideService.push(v58, Enum.OverrideMouseIconBehavior.ForceShow)
	end
	function checkLeaveGameUpsell() -- line: 2939
		-- upvalues: t1 (copy), t4 (copy), Constants2 (copy), default (copy), v60 (copy)
		if not t1.GetFFlagEnableLeaveGameUpsellEntrypoint() then
			return
		end

		if not t4.sessionStartTime then
			t4.sessionStartTime = os.time()
		end

		if not t4.sessionStartTime then
			return
		end

		if not t4.checkedUpsell and t4.leaveGameUpsellProp == Constants2.PHONE_UPSELL_VALUE_PROP.None then
			t4.checkedUpsell = true
			t4.leaveGameUpsellProp = default:FetchPhoneVerificationUpsell(Constants2.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, t4.sessionStartTime, true)
			t4.LeaveGameUpsellPage:SetUpsellProp(t4.leaveGameUpsellProp)
			task.delay(v60, function() -- line: 2960
				-- upvalues: t4 (copy)
				t4.checkedUpsell = false
			end)

			return
		end

		if t4.checkedUpsell then
			local v479 = default:FetchPhoneVerificationUpsell(Constants2.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, t4.sessionStartTime, false)

			if v479 ~= t4.leaveGameUpsellProp then
				t4.leaveGameUpsellProp = v479
				t4.LeaveGameUpsellPage:SetUpsellProp(t4.leaveGameUpsellProp)
			end
		end
	end

	local u179 = nil

	if t1.FFlagSettingsHubIndependentBackgroundVisibility then
		function u179(p75, p76) -- line: 2975
			-- upvalues: t4 (copy), InExperienceAppChatModal (copy), Constants (copy), t1 (copy), Theme (copy), TweenService (copy)
			if not t4.DarkenBackground then
				return
			end

			if not p75 and t4.DarkenBackground.Visible and (InExperienceAppChatModal:getVisible() or t4.Visible) then
				return
			end

			local n6 = 1
			local Quart = Enum.EasingStyle.Quart
			local v484 = not Constants and 0.4 or Constants.ShieldCloseAnimationTweenTime

			if p75 then
				n6 = if not t1.isInExperienceUIVREnabled then Theme.transparency("DarkenBackground") else t4.SettingsUIDelegate:getDarkBackgroundTheme().Transparency
				Quart = Enum.EasingStyle.Quad
				v484 = not Constants and 0.5 or Constants.ShieldOpenAnimationTweenTime
			end

			if p76 then
				if t4.DarkenBackgroundTween then
					t4.DarkenBackgroundTween:Cancel()
					t4.DarkenBackgroundTween = nil
				end

				t4.DarkenBackground.BackgroundTransparency = n6
			else
				local tweenInfo = TweenInfo.new(v484, Quart, Enum.EasingDirection.Out)

				if t4.DarkenBackgroundTween then
					t4.DarkenBackgroundTween:Cancel()
				end

				t4.DarkenBackgroundTween = TweenService:Create(t4.DarkenBackground, tweenInfo, {
					BackgroundTransparency = n6
				})
				t4.DarkenBackgroundTween:Play()
			end

			t4.DarkenBackground.Visible = p75
		end
	end

	function setVisibilityInternal(p77, p78, p79, _, p81) -- line: 3022
		-- upvalues: t1 (copy), t4 (copy), PerfUtils (copy), RobloxGui (copy), u179 (ref), onScreenSizeChanged (copy), Utility (copy), v165 (copy), GuiService (copy), Theme (copy), ExperienceMenuSessionManagerInstance (copy), Constants (copy), GameSettings (copy), TweenService (copy), EngineFeature (copy), ContextActionService (copy), v173 (copy), v175 (copy), shouldShowBottomBar (copy), setBottomBarBindings (copy), setBottomBarSelection (copy), UserInputService (copy), v174 (copy), u87 (ref), VRService (copy), MouseIconOverrideService (copy), v58 (copy), removeBottomBarBindings (copy), ChatSelector (copy), FFlagEnableNewBackpack (copy), v5 (copy), InExperienceAppChatModal (copy), u88 (ref), v166 (copy), SHIELD_INACTIVE_POSITION (copy), RbxAnalyticsService (copy)
		local v491 = if not t1.isInExperienceUIVREnabled then p78 else p78 or not t4.SettingsUIDelegate:isOpenCloseAnimationAllowed()

		t4.OpenStateChangedCount = t4.OpenStateChangedCount + 1

		local v492 = p77 ~= t4.Visible

		t4.Visible = p77

		if t1.FFlagEnableInGameMenuDurationLogger and (v492 and not p77) then
			PerfUtils.menuClose()
		end

		if t4.ResizedConnection then
			t4.ResizedConnection:disconnect()
			t4.ResizedConnection = nil
		end

		if t4.BackBarVisibleConnection then
			t4.BackBarVisibleConnection:disconnect()
			t4.BackBarVisibleConnection = nil
		end

		if t1.EngineFeatureTeleportHistoryButtons and t4.FrontBarVisibleConnection then
			t4.FrontBarVisibleConnection:disconnect()
			t4.FrontBarVisibleConnection = nil
		end

		if t4.PreferredTransparencyChangedConnection then
			t4.PreferredTransparencyChangedConnection:disconnect()
			t4.PreferredTransparencyChangedConnection = nil
		end

		t4.Modal.Visible = t4.Visible

		if t4.TabConnection then
			t4.TabConnection:disconnect()
			t4.TabConnection = nil
		end

		local PlayerListManager = require(RobloxGui.Modules.PlayerList.PlayerListManager)

		if t1.FFlagSettingsHubIndependentBackgroundVisibility then
			u179(t4.Visible, v491)
		end

		if t4.Visible then
			t4.ResizedConnection = RobloxGui.Changed:connect(function(p82) -- line: 3072
				-- upvalues: onScreenSizeChanged (copy)
				if p82 == "AbsoluteSize" then
					onScreenSizeChanged()
				end
			end)

			if t1.FFlagMenuButtonsMountWithIEM then
				if t1.FFlagRelocateMobileMenuButtons and (t1.FIntRelocateMobileMenuButtonsVariant == 1 or t1.FIntRelocateMobileMenuButtonsVariant == 3 or t1.FIntRelocateMobileMenuButtonsVariant == 2 and not Utility:IsSmallTouchScreen()) then
					v165()
				end

				if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant == 2 and Utility:IsSmallTouchScreen() and t4.PlayersPage then
					t4.PlayersPage:CreateMenuButtonsContainer()
				end
			end

			if not t1.FFlagAddTraversalBackButton then
				if t4.BackBarRef:getValue() then
					t4.BackBarVisibleConnection = t4.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() -- line: 3092
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end

				if t1.EngineFeatureTeleportHistoryButtons and t4.FrontBarRef:getValue() then
					t4.FrontBarVisibleConnection = t4.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() -- line: 3097
						-- upvalues: onScreenSizeChanged (copy)
						onScreenSizeChanged()
					end)
				end
			end

			onScreenSizeChanged()
			t4.PreferredTransparencyChangedConnection = GuiService:GetPropertyChangedSignal("PreferredTransparency"):connect(function() -- line: 3104
				-- upvalues: t4 (copy), Theme (copy), GuiService (copy)
				t4.MenuContainer.BackgroundTransparency = Theme.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
			end)
			t4.MenuContainer.BackgroundTransparency = Theme.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
			t4.SettingsShowSignal:fire(t4.Visible)
			GuiService:SetMenuIsOpen(true, "SettingsHub")
			ExperienceMenuSessionManagerInstance:OpenExperienceMenu()
			t4.Shield.Visible = t4.Visible
			GuiService:CloseInspectMenu()

			if v491 or not t4.Shield:IsDescendantOf(game) then
				t4.Shield.Position = UDim2.new(0, 0, 0, 0)

				if not t1.FFlagSettingsHubIndependentBackgroundVisibility and t4.DarkenBackground then
					if t4.DarkenBackgroundTween then
						t4.DarkenBackgroundTween:Cancel()
						t4.DarkenBackgroundTween = nil
					end

					t4.DarkenBackground.BackgroundTransparency = Theme.transparency("DarkenBackground")
				end
			else
				local v494 = not Constants and 0.5 or Constants.ShieldOpenAnimationTweenTime

				if GameSettings.ReducedMotion then
					if t4.ReducedMotionOpenTween then
						t4.ReducedMotionOpenTween:Cancel()
						t4.ReducedMotionOpenTween = nil
					end

					if t4.ReducedMotionCloseTween then
						t4.ReducedMotionCloseTween:Cancel()
						t4.ReducedMotionCloseTween = nil
					end

					t4.Shield.Parent = t4.CanvasGroup
					t4.CanvasGroup.GroupTransparency = 1
					t4.CanvasGroup.Visible = true
					t4.Shield.Position = UDim2.new(0, 0, 0, 0)

					local tweenInfo = TweenInfo.new(0.25)
					local t8 = {
						GroupTransparency = 0
					}

					t4.ReducedMotionOpenTween = TweenService:Create(t4.CanvasGroup, tweenInfo, t8)
					t4.ReducedMotionOpenTween:Play()
					t4.ReducedMotionOpenTween.Completed:Connect(function(p83) -- line: 3153
						-- upvalues: t4 (copy)
						if p83 == Enum.PlaybackState.Completed then
							t4.Shield.Parent = t4.ClippingShield
							t4.ReducedMotionOpenTween = nil
						end

						t4.CanvasGroup.Visible = false
					end)

					if t1.FFlagEnableInGameMenuDurationLogger then
						PerfUtils.menuOpenComplete()
					end
				elseif EngineFeature then
					t4.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v494, true, function() -- line: 3173
						-- upvalues: t1 (copy), PerfUtils (copy)
						if t1.FFlagEnableInGameMenuDurationLogger then
							PerfUtils.menuOpenComplete()
						end
					end)
				else
					t4.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v494, true, function() -- line: 3186
						-- upvalues: t1 (copy), PerfUtils (copy)
						if t1.FFlagEnableInGameMenuDurationLogger then
							PerfUtils.menuOpenComplete()
						end
					end)
				end

				if not t1.FFlagSettingsHubIndependentBackgroundVisibility and t4.DarkenBackground then
					local tweenInfo = TweenInfo.new(v494, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

					if t4.DarkenBackgroundTween then
						t4.DarkenBackgroundTween:Cancel()
					end

					t4.DarkenBackgroundTween = TweenService:Create(t4.DarkenBackground, tweenInfo, {
						BackgroundTransparency = Theme.transparency("DarkenBackground")
					})
					t4.DarkenBackgroundTween:Play()
				end
			end

			local function v498() -- line: 3211
			end

			if t1.isInExperienceUIVREnabled then
				function v498(p84, p85, p86) -- line: 3213
					-- upvalues: t4 (copy)
					if t4.SettingsUIDelegate:isInputEventNeededBySettings(p84, p85, p86) then
						return Enum.ContextActionResult.Pass
					end

					return nil
				end
			end

			ContextActionService:BindCoreAction("RbxSettingsHubStopCharacter", v498, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			ContextActionService:BindCoreAction("RbxSettingsHubSwitchTab", v173, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			ContextActionService:BindCoreAction("RbxSettingsScrollHotkey", v175, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown)

			if shouldShowBottomBar() then
				setBottomBarBindings()

				if t1.FFlagIEMFocusNavToButtons then
					setBottomBarSelection(t4.Pages.CurrentPage)
				end
			end

			if t1.ChromeEnabled and t1.FFlagEnableConsoleExpControls then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
			end

			t4.TabConnection = UserInputService.InputBegan:connect(v174)
			setOverrideMouseIconBehavior()
			u87 = UserInputService.LastInputTypeChanged:connect(setOverrideMouseIconBehavior)

			if UserInputService.MouseEnabled and not VRService.VREnabled then
				MouseIconOverrideService.push(v58, Enum.OverrideMouseIconBehavior.ForceShow)
			end

			t4:CloseReactPage()

			if p79 then
				removeBottomBarBindings()
				t4:SwitchToPage(p79, nil, 1, true)
			else
				t4:SwitchToPage(t4:GetFirstPageWithTabHeader(), nil, 1, true)
			end

			if not t1.isInExperienceUIVREnabled or (t1.InExperienceUIVRIXP:isMovePanelToCenter() and true or not VRService.VREnabled) then
				if t1.FFlagAddNewPlayerListMobileFocusNav then
					if PlayerListManager:GetIsModal() then
						PlayerListManager:SetVisibility(false)
					else
						PlayerListManager:HideTemp("SettingsMenu", true)
					end
				else
					PlayerListManager:HideTemp("SettingsMenu", true)
				end

				if not t1.isInExperienceUIVREnabled or not t1.InExperienceUIVRIXP:isMovePanelToCenter() or not t1.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled then
					ChatSelector:HideTemp("SettingsMenu", true)
				end

				if FFlagEnableNewBackpack then
					v5.setVisibility(v5.FeatureName.Backpack, false)
				else
					local BackpackScript = require(RobloxGui.Modules.BackpackScript)

					if BackpackScript.IsOpen then
						BackpackScript:OpenClose()
					end
				end
			end

			if t1.GetFFlagEnableAppChatInExperience() and InExperienceAppChatModal:getVisible() then
				u88 = true
				InExperienceAppChatModal.default:setVisible(false)
			end

			if not t1.isInExperienceUIVREnabled then
				if FFlagEnableNewBackpack then
					v5.setVisibility(v5.FeatureName.Backpack, false)
				else
					local BackpackScript = require(RobloxGui.Modules.BackpackScript)

					if BackpackScript.IsOpen then
						BackpackScript:OpenClose()
					end
				end
			end

			t4.GameSettingsPage:OpenSettingsPage()
		else
			t4.CurrentPageSignal:fire("")

			if t1.FFlagMenuButtonsMountWithIEM and t1.FFlagRelocateMobileMenuButtons then
				if t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v166()
				end

				if t1.FIntRelocateMobileMenuButtonsVariant == 2 and t4.PlayersPage then
					t4.PlayersPage:UnmountMenuButtonsContainer()
				end
			end

			if t1.ChromeEnabled and t1.FFlagEnableConsoleExpControls then
				local Service = require(RobloxGui.Modules.Chrome.Service)

				if t1.FFlagSetUnibarShortcutOnTopBarFocus then
					Service:setShortcutBar(nil)
				else
					Service:setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID)
				end
			end

			if t1.GetFFlagEnableAppChatInExperience() and u88 then
				u88 = false
			end

			if t1.isInExperienceUIVREnabled and t1.InExperienceUIVRIXP:isMovePanelToCenter() then
				PlayerListManager:HideTemp("SettingsMenu", false)

				if not t1.FFlagSpatialUIFixMenuPanelChatExclusive or not VRService.VREnabled then
					ChatSelector:HideTemp("SettingsMenu", false)
				end
			end

			if v491 then
				t4.Shield.Position = SHIELD_INACTIVE_POSITION
				t4.Shield.Visible = t4.Visible
				t4.SettingsShowSignal:fire(t4.Visible)
				GuiService:SetMenuIsOpen(false, "SettingsHub")
				ExperienceMenuSessionManagerInstance:CloseExperienceMenu()

				if t1.FFlagEnableInGameMenuDurationLogger then
					PerfUtils.menuCloseComplete()
				end

				if not t1.FFlagSettingsHubIndependentBackgroundVisibility and t4.DarkenBackground then
					if t4.DarkenBackgroundTween then
						t4.DarkenBackgroundTween:Cancel()
						t4.DarkenBackgroundTween = nil
					end

					t4.DarkenBackground.BackgroundTransparency = 1
				end
			else
				local v502 = not Constants and 0.4 or Constants.ShieldCloseAnimationTweenTime

				local function handleShieldClose() -- line: 3373
					-- upvalues: t1 (copy), t4 (copy), GuiService (copy), ExperienceMenuSessionManagerInstance (copy), PerfUtils (copy)
					if not t1.FFlagAddTraversalBackButton then
						t4.SettingsShowSignal:fire(t4.Visible)
					end

					if not t4.Visible then
						GuiService:SetMenuIsOpen(false, "SettingsHub")
						ExperienceMenuSessionManagerInstance:CloseExperienceMenu()
					end

					if t1.FFlagEnableInGameMenuDurationLogger then
						PerfUtils.menuCloseComplete()
					end
				end

				if t1.FFlagAddTraversalBackButton then
					t4.SettingsShowSignal:fire(t4.Visible)
				end

				if GameSettings.ReducedMotion then
					if t4.ReducedMotionOpenTween then
						t4.ReducedMotionOpenTween:Cancel()
						t4.ReducedMotionOpenTween = nil
					end

					if t4.ReducedMotionCloseTween then
						t4.ReducedMotionCloseTween:Cancel()
						t4.ReducedMotionCloseTween = nil
					end

					t4.Shield.Parent = t4.CanvasGroup
					t4.CanvasGroup.Visible = true

					local tweenInfo = TweenInfo.new(0.25)
					local t9 = {
						GroupTransparency = 1
					}

					t4.ReducedMotionCloseTween = TweenService:Create(t4.CanvasGroup, tweenInfo, t9)
					t4.ReducedMotionCloseTween:Play()
					t4.ReducedMotionCloseTween.Completed:Connect(function(p87) -- line: 3409
						-- upvalues: t4 (copy), SHIELD_INACTIVE_POSITION (copy)
						if p87 == Enum.PlaybackState.Completed then
							t4.Shield.Position = SHIELD_INACTIVE_POSITION
							t4.Shield.Visible = t4.Visible
							t4.Shield.Parent = t4.ClippingShield
							t4.ReducedMotionCloseTween = nil
						end

						t4.CanvasGroup.Visible = false
					end)
					handleShieldClose()
				else
					if t1.ChromeEnabled and t1.FFlagEnableConsoleExpControls then
						local Service = require(RobloxGui.Modules.Chrome.Service)

						if t1.FFlagSetUnibarShortcutOnTopBarFocus then
							Service:setShortcutBar(nil)
						else
							Service:setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID)
						end
					end

					if EngineFeature then
						t4.Shield:TweenPositionInternal(SHIELD_INACTIVE_POSITION, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v502, true, function() -- line: 3438
							-- upvalues: t4 (copy), handleShieldClose (copy)
							t4.Shield.Visible = t4.Visible
							handleShieldClose()
						end)
					else
						t4.Shield:TweenPosition(SHIELD_INACTIVE_POSITION, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v502, true, function() -- line: 3450
							-- upvalues: t4 (copy), handleShieldClose (copy)
							t4.Shield.Visible = t4.Visible
							handleShieldClose()
						end)
					end
				end

				if not t1.FFlagSettingsHubIndependentBackgroundVisibility and t4.DarkenBackground then
					local tweenInfo = TweenInfo.new(v502, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

					if t4.DarkenBackgroundTween then
						t4.DarkenBackgroundTween:Cancel()
					end

					t4.DarkenBackgroundTween = TweenService:Create(t4.DarkenBackground, tweenInfo, {
						BackgroundTransparency = 1
					})
					t4.DarkenBackgroundTween:Play()
				end
			end

			if u87 then
				u87:disconnect()
			end

			if t1.isInExperienceUIVREnabled then
				if not t1.InExperienceUIVRIXP:isMovePanelToCenter() and not VRService.VREnabled then
					PlayerListManager:HideTemp("SettingsMenu", false)
					ChatSelector:HideTemp("SettingsMenu", false)
				end
			else
				PlayerListManager:HideTemp("SettingsMenu", false)
				ChatSelector:HideTemp("SettingsMenu", false)
			end

			if not VRService.VREnabled then
				MouseIconOverrideService.pop(v58)
			end

			t4:CloseReactPage()
			clearMenuStack()
			ContextActionService:UnbindCoreAction("RbxSettingsHubSwitchTab")
			ContextActionService:UnbindCoreAction("RbxSettingsHubStopCharacter")
			ContextActionService:UnbindCoreAction("RbxSettingsScrollHotkey")
			removeBottomBarBindings(0.4)
			GuiService.SelectedCoreObject = nil
			t4.GameSettingsPage:CloseSettingsPage()

			if t4.ShareGamePage then
				t4.ShareGamePage:ClearShareInviteLink(t4.ShareGameApp)
			end
		end

		local t10 = {
			source = p81,
			playsessionid = t4.playSessionId,
			universeid = tostring(game.GameId)
		}

		if v492 then
			if p77 then
				RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsMenuOpenName, Constants.AnalyticsMenuActionName, t10)

				if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() then
					task.spawn(checkLeaveGameUpsell)

					return
				end
			else
				RbxAnalyticsService:SetRBXEventStream(Constants.AnalyticsTargetName, Constants.AnalyticsMenuCloseName, Constants.AnalyticsMenuActionName, t10)
			end
		end
	end
	function t4.SetVisibility(_, p89, p90, p91, p92, p93) -- line: 3531
		-- upvalues: t4 (copy), setVisibilityInternal (ref)
		if p89 == t4.Visible then
			return
		end

		setVisibilityInternal(p89, p90, p91, p92, p93)
	end
	function t4.SetBackgroundVisibility(_, p95, p96) -- line: 3537
		-- upvalues: t4 (copy), u179 (ref)
		if p95 == t4.DarkenBackground.Visible then
			return
		end

		u179(p95, p96)
	end
	function t4.GetVisibility(_) -- line: 3543
		-- upvalues: t4 (copy)
		return t4.Visible
	end
	function t4.ToggleVisibility(_, p99, p100) -- line: 3547
		-- upvalues: setVisibilityInternal (ref), t4 (copy)
		setVisibilityInternal(not t4.Visible, nil, nil, p99, p100)
	end
	function t4.AddToMenuStack(_, p102) -- line: 3551
		-- upvalues: t4 (copy)
		if p102 ~= t4.MenuStack[#t4.MenuStack] then
			t4.MenuStack[#t4.MenuStack + 1] = p102
		end
	end
	function t4.InviteToGame(_) -- line: 3557
		-- upvalues: t1 (copy), IXPServiceWrapper (copy), GameInviteInviteExperimentVariant (ref), PlatformFriendsService (ref), UserInputService (copy), PlatformService (ref), t4 (copy), GameInviteModalManager (ref), GameInviteConstants (ref), RobloxGui (copy)
		local v525 = false

		if t1.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and t1.FFlagLuaEnableGameInviteModalSettingsHub then
			local v526 = t1.GetFStringGameInviteMenuLayer()
			local LayerData = IXPServiceWrapper:GetLayerData(v526)

			IXPServiceWrapper:LogUserLayerExposure(v526)
			v525 = not not LayerData and (LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.UxRefresh or LayerData.inExperienceGameInviteUXRefresh2023 == GameInviteInviteExperimentVariant.InviteLimit)
		end

		if game:GetEngineFeature("PlatformFriendsService") and PlatformFriendsService and PlatformFriendsService:IsInviteFriendsEnabled() then
			PlatformFriendsService:ShowInviteFriendsUI()

			return
		end

		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			if PlatformService then
				PlatformService:PopupGameInviteUI()

				return
			end
		elseif v525 then
			t4:ToggleVisibility()
			GameInviteModalManager:openModal({
				trigger = GameInviteConstants.Triggers.GameMenu
			})

			if t1.FFlagEnableConsoleExpControls and t1.ChromeEnabled then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(nil)

				return
			end
		else
			t4:AddToMenuStack(t4.Pages.CurrentPage)
			t4:SwitchToPage(t4.ShareGamePage, nil, 1, true)
		end
	end
	function t4.PopMenu(_, _, p106, p107) -- line: 3588
		-- upvalues: t4 (copy), BindableEvent (copy), t1 (copy), RobloxGui (copy)
		if t4.MenuStack and #t4.MenuStack > 0 then
			local v532 = t4.MenuStack[#t4.MenuStack]

			if type(v532) ~= "table" then
				BindableEvent:Fire(v532)
			end

			table.remove(t4.MenuStack, #t4.MenuStack)
			t4:SwitchToPage(t4.MenuStack[#t4.MenuStack], true, 1, p106)

			if #t4.MenuStack == 0 then
				if t1.FFlagAddUILessMode then
					t4:SetVisibility(false, nil, nil, nil, p107)
				else
					t4:SetVisibility(false)
				end

				t4.Pages.CurrentPage:Hide(0, 0, nil, nil, t4.PageViewInnerFrame)

				return
			end

			if t1.ChromeEnabled and t1.FFlagEnableConsoleExpControls then
				require(RobloxGui.Modules.Chrome.Service):setShortcutBar(require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)

				return
			end
		else
			t4.MenuStack = {}
			BindableEvent:Fire()

			if t1.FFlagAddUILessMode then
				t4:ToggleVisibility(nil, p107)

				return
			end

			t4:ToggleVisibility(p107)
		end
	end
	function t4.ShowShield(_) -- line: 3622
		-- upvalues: UserInputService (copy), v56 (copy), t4 (copy)
		local v534 = if not UserInputService.VREnabled then v56 else 1

		t4.Shield.BackgroundTransparency = v534
	end
	function t4.HideShield(_) -- line: 3632
		-- upvalues: t4 (copy)
		t4.Shield.BackgroundTransparency = 1
	end
	function t4.ShowReactPage(_) -- line: 3636
		-- upvalues: t4 (copy)
		if t4.reactPage then
			t4.reactPageAnalytics:openPage(t4.reactPage.name)
		end

		t4.ReactPage.Visible = true
		t4.Page.Visible = false
	end
	function t4.HideReactPage(_) -- line: 3645
		-- upvalues: t4 (copy), t1 (copy)
		if t4.reactPage then
			t4.reactPageAnalytics:closePage(t4.reactPage.name)
		end

		local ReactPageVisible = t4.ReactPage.Visible

		t4.ReactPage.Visible = false
		t4.Page.Visible = true

		if t1.FFlagCreateInExperienceMenuReact and t1.FFlagIEMFocusNavToButtons and t4.Pages.CurrentPage and ReactPageVisible and t4.Visible then
			t4.Pages.CurrentPage:SelectARow(true)
		end
	end
	function t4.MountReactPage(_) -- line: 3659
		-- upvalues: t1 (copy), ReactPageSignal (copy), t4 (copy), ReactRoblox (copy)
		if t1.FFlagCreateInExperienceMenuReact then
			ReactPageSignal(false).setCurrentReactPage(nil)
		end

		if t4.reactPageRoot then
			t4:UnmountReactPage()
		end

		t4.reactPageRoot = ReactRoblox.createRoot(t4.ReactPage)
	end
	function t4.UnmountReactPage(_) -- line: 3669
		-- upvalues: t4 (copy)
		if t4.reactPageRoot then
			t4.reactPageRoot:unmount()
			t4.reactPageRoot = nil
		end
	end
	function t4.CloseReactPage(_) -- line: 3676
		-- upvalues: t4 (copy)
		t4:HideReactPage()
		t4:UnmountReactPage()
	end
	function t4.SwitchToReactPage(_: {[any]: any}, p115, p116, b2: boolean?) -- line: 3681
		-- upvalues: t1 (copy), t4 (copy)
		if t1.FFlagCreateInExperienceMenuReact and b2 then
			t4:UnmountReactPage()
		elseif p115 then
			t4.reactPage = p115

			if not t4.reactPageRoot then
				t4:MountReactPage()
			end

			t4.reactPageRoot:render(p115:createPage(p116))
		end

		t4:ShowReactPage()
	end

	t4.GameSettingsPageReorderIXPFetched = false

	local u180 = nil
	local u181 = nil

	local function enableVR() -- line: 3699
		-- upvalues: CorePackages (copy), t4 (copy), u180 (ref)
		local VRHub2 = require(CorePackages.Workspace.Packages.VrCommon).VRHub
		local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
		local v548 = Panel3D.Get("SettingsMenu")

		v548:ResizeStuds(4, 4, 250)
		v548:SetType(Panel3D.Type.Standard)
		v548:SetVisible(false)
		v548:SetCanFade(false)
		t4.ClippingShield.Parent = v548:GetGUI()
		t4.Shield.Parent.ClipsDescendants = false
		t4.VRShield.Visible = true
		t4:HideShield()
		u180 = t4.SettingsShowSignal:connect(function(p117) -- line: 3713
			-- upvalues: v548 (copy), VRHub2 (copy)
			if p117 then
				v548:SetVisible(true)
				VRHub2:FireModuleOpened("SettingsMenu")

				return
			end

			v548:SetVisible(false)
			VRHub2:FireModuleClosed("SettingsMenu")
		end)
		VRHub2.ModuleOpened.Event:connect(function(p118) -- line: 3725
			-- upvalues: t4 (copy)
			if p118 ~= "SettingsMenu" then
				t4:SetVisibility(false)
			end
		end)
	end
	local function disableVR() -- line: 3731
		-- upvalues: t4 (copy), RobloxGui (copy), u180 (ref), u181 (ref), CorePackages (copy)
		t4.ClippingShield.Parent = RobloxGui
		t4.Shield.Parent.ClipsDescendants = true
		t4.VRShield.Visible = false
		t4:ShowShield()

		if u180 then
			u180:disconnect()
			u180 = nil
		end

		if u181 then
			u181:disconnect()
			u181 = nil
		end

		require(CorePackages.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false)
	end
	local function OnVREnabled(p119) -- line: 3757
		-- upvalues: UserInputService (copy), t1 (copy), t4 (copy), onScreenSizeChanged (copy), Theme (copy), GuiService (copy), resizeBottomBarButtons (copy), enableVR (copy), disableVR (copy)
		if p119 == "VREnabled" then
			if UserInputService.VREnabled then
				if t1.isInExperienceUIVREnabled then
					t4.SettingsUIDelegate:enableVR()
					onScreenSizeChanged()
					t4.MenuContainer.BackgroundTransparency = Theme.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
					resizeBottomBarButtons()

					return
				end

				enableVR()

				return
			end

			if t1.isInExperienceUIVREnabled then
				t4.SettingsUIDelegate:disableVR()
				onScreenSizeChanged()
				t4.MenuContainer.BackgroundTransparency = Theme.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
				resizeBottomBarButtons()

				return
			end

			disableVR()
		end
	end

	UserInputService.Changed:connect(OnVREnabled)
	OnVREnabled("VREnabled")
	t4.ResetCharacterPage:SetHub(t4)

	if InExperienceCapabilities.canNavigateHome then
		t4.LeaveGamePage:SetHub(t4)
	end

	if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		t4.LeaveGameUpsellPage:SetHub(t4)
	end

	t4.GameSettingsPage = require(RobloxGui.Modules.Settings.Pages.GameSettingsWrapper)
	t4.GameSettingsPage:SetHub(t4)
	t4.ReportAbusePage = require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage)
	t4.ReportAbusePage:SetHub(t4)
	t4.ReportSentPage = require(RobloxGui.Modules.Settings.Pages.ReportSentPage)
	t4.ReportSentPage:SetHub(t4)
	t4.ReportSentPageV2 = require(RobloxGui.Modules.Settings.Pages.ReportSentPageV2)
	t4.ReportSentPageV2:SetHub(t4)
	t4.HelpPage = require(RobloxGui.Modules.Settings.Pages.HelpWrapper)
	t4.HelpPage:SetHub(t4)

	if t1.FFlagHelpPageIXPExposure then
		t4.HelpPageIXPFetched = false
	end

	if not t1.FFlagRemoveRecordPage then
		local v185 = CachedPolicyService:IsSubjectToChinaPolicies()

		if Platform == Enum.Platform.Windows and not v185 then
			t4.RecordPage = require(RobloxGui.Modules.Settings.Pages.Record)
			t4.RecordPage:SetHub(t4)
		end
	end

	if InExperienceCapabilities.canListPeopleInSameServer then
		t4.PlayersPage = require(RobloxGui.Modules.Settings.Pages.PeopleWrapper)
		t4.PlayersPage:SetHub(t4)

		if not t1.FFlagMenuButtonsMountWithIEM and t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant == 2 and Utility:IsSmallTouchScreen() then
			t4.PlayersPage:CreateMenuButtonsContainer()
		end
	end

	if t1.FFlagAddIEMProfilePage then
		t4.PlayerProfilePage = require(RobloxGui.Modules.Settings.Pages.PlayerProfile)
	end

	if isSubjectToDesktopPolicies() then
		t4.ExitModalPage = require(RobloxGui.Modules.Settings.Pages.ExitModal)
		t4.ExitModalPage:SetHub(t4)
	end

	if isSubjectToDesktopPolicies() and InExperienceCapabilities.canNavigateHome then
		t4.LeaveGameToHomePage = require(RobloxGui.Modules.Settings.Pages.LeaveGameToHome)
		t4.LeaveGameToHomePage:SetHub(t4)
	end

	if not v14 and GetCorePackagesLoaded({
		"Roact",
		"Rodux",
		"RoactRodux"
	}) then
		local CorePackages3 = game:GetService("CorePackages")
		local EventStream = require(CorePackages3.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
		local Diag = require(CorePackages3.Workspace.Packages.Analytics).AnalyticsReporters.Diag
		local v189 = EventStream.new(RbxAnalyticsService)
		local v190 = GameInviteAnalytics.new():withEventStream(v189):withDiag(Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.SettingsHub)

		t4.ShareGameApp = require(RobloxGui.Modules.Settings.ShareGameMaster).createApp(t4.PageViewClipper, v190)
		t4.ShareGamePage = require(RobloxGui.Modules.Settings.Pages.ShareGamePlaceholderPage)
		t4.ShareGamePage:ConnectHubToApp(t4, t4.ShareGameApp)
		t4:AddPage(t4.ShareGamePage)
	end

	local v191 = CapturesPolicy.PolicyImplementation.read()
	local v192 = not not v191 and CapturesPolicy.Mapper(v191).eligibleForCapturesFeature()
	local v193 = t1.isInExperienceUIVREnabled and t1.FFlagFixSpatialUICaptures

	if v192 and (not v193 or not isSpatial()) then
		local CapturesPageWrapper = require(RobloxGui.Modules.Settings.Pages.CapturesPageWrapper)

		t4.CapturesApp = CapturesApp
		t4.CapturesApp.mountMenuPage(CapturesPageWrapper.Page, function() --[[ closeSettingsMenu ]] -- line: 3880
			-- upvalues: t4 (copy)
			t4:SetVisibility(false, true)
		end, t1.ChromeEnabled)
		t4.CapturesPage = CapturesPageWrapper
		t4.CapturesPage:ConnectHubToApp(t4, t4.PageViewClipper, t4.CapturesApp)
	end

	if t4.PlayersPage then
		t4:AddPage(t4.PlayersPage)
	end

	t4:AddPage(t4.ResetCharacterPage)

	if t4.LeaveGamePage then
		t4:AddPage(t4.LeaveGamePage)
	end

	if t1.GetFFlagEnableLeaveGameUpsellEntrypoint() and t4.LeaveGameUpsellPage then
		t4:AddPage(t4.LeaveGameUpsellPage)
	end

	t4:AddPage(t4.GameSettingsPage)

	if t4.CapturesPage then
		t4:AddPage(t4.CapturesPage)
	end

	if t4.ReportAbusePage then
		t4:AddPage(t4.ReportAbusePage)
	end

	if t4.ReportSentPage then
		t4:AddPage(t4.ReportSentPage)
	end

	if t4.ReportSentPageV2 then
		t4:AddPage(t4.ReportSentPageV2)
	end

	t4:AddPage(t4.HelpPage)

	if not t1.FFlagRemoveRecordPage and t4.RecordPage and not t4.CapturesPage then
		t4:AddPage(t4.RecordPage)
	end

	if t4.ExitModalPage then
		t4:AddPage(t4.ExitModalPage)
	end

	if t4.LeaveGameToHomePage then
		t4:AddPage(t4.LeaveGameToHomePage)
	end

	t4:InitInPage(t4:GetFirstPageWithTabHeader())

	if not t1.isNewInGameMenuEnabled() and (not t1.FFlagAddUILessMode or t1.FIntAddUILessModeVariant == 0) then
		ContextActionService:BindCoreAction("RBXEscapeMainMenu", function(_, p121, _) -- line: 3941
			-- upvalues: t1 (copy), t4 (copy), Constants (copy)
			if p121 ~= Enum.UserInputState.Begin then
				return
			end

			if t1.FFlagAddUILessMode then
				t4:PopMenu(false, true, Constants.AnalyticsMenuOpenTypes.Keyboard)

				return
			end

			t4:PopMenu(false, true)
		end, false, Enum.KeyCode.Escape)
	end

	GuiService.ShowLeaveConfirmation:connect(function() -- line: 3956
		-- upvalues: t4 (copy), Constants (copy)
		if #t4.MenuStack == 0 then
			t4:SetVisibility(true, nil, nil, nil, Constants.AnalyticsMenuOpenTypes.GamepadLeaveGame)
			t4:SwitchToPage(t4:GetFirstPageWithTabHeader(), nil, 1)

			return
		end

		t4:PopMenu(false, true)
	end)
	ContextActionService:BindCoreAction("Open Dev Console", function(p123, p124, _) --[[ toggleDevConsole ]] -- line: 2402
		-- upvalues: DevConsoleMaster (copy)
		if p123 == "Open Dev Console" and (p124 and p124 == Enum.UserInputState.Begin) then
			DevConsoleMaster:ToggleVisibility()
		end
	end, false, Enum.KeyCode.F9)
	ContextActionService:BindCoreAction("Show Quick Profiler", function(p126, p127, _) --[[ toggleQuickProfilerFromHotkey ]] -- line: 2386
		-- upvalues: UserInputService (copy), GameSettings (copy)
		if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
			return
		end

		if p126 == "Show Quick Profiler" and p127 and p127 == Enum.UserInputState.Begin then
			GameSettings.PerformanceStatsVisible = not GameSettings.PerformanceStatsVisible
		end
	end, false, Enum.KeyCode.F7)
	UserInputService.InputBegan:connect(function(p129) -- line: 3982
		-- upvalues: t4 (copy), GuiService (copy)
		if (p129.KeyCode == Enum.KeyCode.Left or (p129.KeyCode == Enum.KeyCode.Right or p129.KeyCode == Enum.KeyCode.Up or p129.KeyCode == Enum.KeyCode.Down)) and (t4.Visible and t4.Active and t4.Pages.CurrentPage and GuiService.SelectedCoreObject == nil) then
			t4.Pages.CurrentPage:SelectARow()
		end
	end)

	if t4.ExitModalPage then
		local function showExitModal() -- line: 3996
			-- upvalues: t4 (copy), removeBottomBarBindings (copy)
			t4.HubBar.Visible = false
			removeBottomBarBindings()

			if t4:GetVisibility() then
				t4:AddToMenuStack(t4.Pages.CurrentPage)
				t4:SwitchToPage(t4.ExitModalPage, nil, 1, true)

				return
			end

			t4:SetVisibility(true, nil, t4.ExitModalPage, false)
		end
		local function handleNativeExit() -- line: 4006
			-- upvalues: t4 (copy), t1 (copy), PerfUtils (copy), v166 (copy), showExitModal (copy)
			if t4:GetVisibility() and t4.Pages.CurrentPage == t4.ExitModalPage then
				if t1.FFlagEnableInGameMenuDurationLogger then
					PerfUtils.leavingGame()
				end

				if t1.FFlagRelocateMobileMenuButtons and t1.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v166()

					if t1.FFlagMenuButtonsMountWithIEM and t1.FIntRelocateMobileMenuButtonsVariant == 2 and t4.PlayersPage then
						t4.PlayersPage:UnmountMenuButtonsContainer()
					end
				end

				t4.ExitModalPage.LeaveAppFunc(true)

				return
			end

			showExitModal()
		end

		game:GetService("GuiService").NativeClose:Connect(handleNativeExit)

		if t4.FullScreenTitleBar then
			t4.FullScreenTitleBar = SettingsFullScreenTitleBar.update(t4.FullScreenTitleBar, {
				onClose = handleNativeExit
			})
		end
	end

	if t1.GetFFlagEnableAppChatInExperience() then
		local connection3 = nil

		t4.SettingsShowSignal:connect(function(p130) -- line: 4035
			-- upvalues: connection3 (ref), InExperienceAppChatModal (copy), t4 (copy)
			if p130 then
				connection3 = InExperienceAppChatModal.default.visibilitySignal.Event:Connect(function(p131) -- line: 4037
					-- upvalues: t4 (copy)
					if p131 and t4.Visible then
						t4:SetVisibility(false, true)
					end
				end)

				return
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end
		end)
	end

	if t1.FFlagCreateInExperienceMenuReact then
		t4.InExperienceMenuReact = Create("Folder")({
			Name = "InExperienceMenuReact",
			Parent = t4.ClippingShield
		})

		local ButtonsContainer = t4.PlayersPage.ButtonsContainer
		local v199 = if not ButtonsContainer then nil else ButtonsContainer:FindFirstChild("LeaveButtonButton", true)
		local LeaveGameButton = nil

		if t1.FFlagAddTraversalHistory then
			LeaveGameButton = t4.LeaveGameButton
		end

		local v201 = nil

		if t1.FFlagTraversalPerfFixes then
			function v201(p132) -- line: 4067
				-- upvalues: React (copy), t4 (copy), Signals (copy), t1 (copy), isSpatial (copy), PortalWithFoundationStylelink (copy), TraversalHistoryMenu (copy)
				local v556, v557 = React.useState(p132.showSignal(false) and t4.Visible)

				React.useEffect(function() -- line: 4069
					-- upvalues: Signals (copy), v557 (copy), p132 (copy), t4 (copy)
					local v643 = Signals.createEffect(function(p133) -- line: 4070
						-- upvalues: v557 (copy), p132 (copy), t4 (copy)
						v557(p132.showSignal(p133) and t4.Visible)
					end)
					local v644 = t4.SettingsShowSignal:connect(function(p134) -- line: 4073
						-- upvalues: v557 (copy), p132 (copy)
						v557(p132.showSignal(false) and p134)
					end)

					return function() -- line: 4077
						-- upvalues: v643 (copy), v644 (copy)
						v643()
						v644:Disconnect()
					end
				end, {})

				return t1.FFlagAddTraversalHistory and (not (t1.isInExperienceUIVREnabled and isSpatial()) and (p132.parent and (v556 and React.createElement(PortalWithFoundationStylelink, {
					parent = p132.parent
				}, {
					TraversalHistoryMenu = React.createElement(TraversalHistoryMenu, {
						anchorParent = p132.parent,
						currentPageChangeSignal = p132.currentPageChangeSignal,
						menuSide = p132.menuSide
					})
				}))))
			end
		end

		ReactRoblox.createRoot(t4.InExperienceMenuReact):render(React.createElement(InExperienceMenuReact, nil, {
			InExperienceMenuReactPage = React.createElement(InExperienceMenuReactPage, {
				onMount = function() --[[ onMount ]] -- line: 4099
					-- upvalues: t4 (copy)
					t4:SwitchToReactPage(nil, nil, true)
				end,
				onUnmount = function() --[[ onUnmount ]] -- line: 4100
					-- upvalues: t4 (copy), ReactPageSignal (copy)
					t4:CloseReactPage()
					ReactPageSignal(false).setCurrentReactPage(nil)
				end,
				mountTo = t4.ReactPage
			}),
			TraversalHistoryMenuBottomBar = if not t1.FFlagTraversalPerfFixes then t1.FFlagAddTraversalHistory and (not (t1.isInExperienceUIVREnabled and isSpatial()) and (LeaveGameButton and React.createElement(PortalWithFoundationStylelink, {
				parent = LeaveGameButton
			}, {
				TraversalHistoryMenu = React.createElement(TraversalHistoryMenu, {
					anchorParent = LeaveGameButton,
					idleButtonStateIsDown = true,
					currentPageChangeSignal = t4.CurrentPageSignal
				})
			}))) else React.createElement(v201, {
				showSignal = t4.showBottomBarSignal,
				parent = LeaveGameButton,
				menuSide = Foundation.Enums.PopoverSide.Top,
				currentPageChangeSignal = t4.CurrentPageSignal
			}),
			TraversalHistoryMenuMobileButton = if not t1.FFlagTraversalPerfFixes then t1.FFlagAddTraversalHistory and (not (t1.isInExperienceUIVREnabled and isSpatial()) and (v199 and React.createElement(PortalWithFoundationStylelink, {
				parent = v199
			}, {
				TraversalHistoryMenu = React.createElement(TraversalHistoryMenu, {
					anchorParent = v199,
					idleButtonStateIsDown = true,
					currentPageChangeSignal = t4.CurrentPageSignal
				})
			}))) else React.createElement(v201, {
				showSignal = Signals.createComputed(function(p135) -- line: 4122
					-- upvalues: t4 (copy)
					return not t4.showBottomBarSignal(p135)
				end),
				parent = v199,
				menuSide = Foundation.Enums.PopoverSide.Bottom,
				currentPageChangeSignal = t4.CurrentPageSignal
			})
		}))
	end

	return t4
end)()

function t3.GetExperienceControlStore(_) -- line: 4167
	-- upvalues: v124 (copy)
	return v124:GetExperienceControlStore()
end
function t3.SetVisibility(_, p138, p139, p140, p141, p142) -- line: 4171
	-- upvalues: v124 (copy)
	v124:SetVisibility(p138, p139, p140, p141, p142)
end
function t3.SetBackgroundVisibility(_, p144, p145) -- line: 4175
	-- upvalues: v124 (copy)
	v124:SetBackgroundVisibility(p144, p145)
end
function t3.ToggleVisibility(_, p147, p148) -- line: 4179
	-- upvalues: v124 (copy)
	v124:ToggleVisibility(p147, p148)
end
function t3.SwitchToPage(_, p150, p151) -- line: 4183
	-- upvalues: v124 (copy)
	v124:SwitchToPage(p150, p151, 1)
end

if t1.FFlagAddUILessMode and t1.FIntAddUILessModeVariant ~= 0 then
	function t3.PopMenu(_, p153, p154, p155) -- line: 4188
		-- upvalues: v124 (copy)
		return v124:PopMenu(p153, p154, p155)
	end
end

function t3.GetVisibility(_) -- line: 4193
	-- upvalues: v124 (copy)
	return v124.Visible
end
function t3.ShowShield(_) -- line: 4197
	-- upvalues: v124 (copy)
	v124:ShowShield()
end
function t3.HideShield(_) -- line: 4201
	-- upvalues: v124 (copy)
	v124:HideShield()
end
function t3.GetRespawnBehaviour(_) -- line: 4205
	-- upvalues: v124 (copy)
	return v124:GetRespawnBehaviour()
end
function t3.CloseReactPage(_) -- line: 4209
	-- upvalues: v124 (copy)
	v124:CloseReactPage()
end
function t3.SwitchToReactPage(_, p162, p163, p164) -- line: 4213
	-- upvalues: v124 (copy)
	v124:SwitchToReactPage(p162, p163, p164)
end

t3.RespawnBehaviourChangedEvent = v124.RespawnBehaviourChangedEvent
t3.SettingsShowSignal = v124.SettingsShowSignal
t3.CurrentPageSignal = v124.CurrentPageSignal
t3.SettingsShowEvent = Instance.new("BindableEvent")
v124.SettingsShowSignal:connect(function(p165) -- line: 4225
	-- upvalues: t3 (copy)
	t3.SettingsShowEvent:Fire(p165)
end)
t3.Instance = v124

return t3
