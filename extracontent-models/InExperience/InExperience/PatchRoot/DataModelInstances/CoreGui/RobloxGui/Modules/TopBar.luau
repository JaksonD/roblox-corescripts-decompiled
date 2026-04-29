local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddTopBarScrim = require(script.Flags.FFlagAddTopBarScrim)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local DesignTokenProvider = require(CorePackages.Workspace.Packages.Style).DesignTokenProvider
local CrossExperienceVoice = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local ReactSceneUnderstanding = require(CorePackages.Packages.ReactSceneUnderstanding)
local React = require(CorePackages.Packages.React)
local Roact = require(CorePackages.Packages.Roact)
local Rodux = require(CorePackages.Packages.Rodux)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local RoactAppPolicy = UniversalAppPolicy.RoactAppPolicy
local AppFeaturePolicies = UniversalAppPolicy.AppFeaturePolicies
local Constants = UIBlox.App.Style.Constants
local Display = require(CorePackages.Workspace.Packages.Display)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local Songbird = require(CorePackages.Workspace.Packages.Songbird)
local VoiceStateContext = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local Utility = require(RobloxGui.Modules.Settings.Utility)
local TenFootInterface = require(RobloxGui.Modules.TenFootInterface)
local isNewInGameMenuEnabled = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local v30 = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local Service = nil
local TopBarScrim = nil

if v30 then
	Service = require(RobloxGui.Modules.Chrome.Service)
	TopBarScrim = require(script.Components.TopBarScrim)
end

local Constants2 = require(script.Constants)
local MenuNavigationPromptTokenMapper = require(script.TokenMappers.MenuNavigationPromptTokenMapper)
local GetFFlagSimpleChatUnreadMessageCount = SharedFlags.GetFFlagSimpleChatUnreadMessageCount
local CoreGuiCommon = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeSetCores = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommon.Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarDeprecateGameInfoRodux = require(script.Flags.FFlagTopBarDeprecateGameInfoRodux)
local FFlagTopBarDeprecateGamepadNavigationDialogRodux = require(script.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local FFlagTopBarDeprecateChatRodux = require(script.Flags.FFlagTopBarDeprecateChatRodux)
local FFlagTopBarDeprecateDisplayOptionsRodux = require(script.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local FFlagAddTopBarPoliciesToUniversalPolicies = SharedFlags.FFlagAddTopBarPoliciesToUniversalPolicies

if v30 then
	(function() --[[ SetGlobalGuiInset ]] -- line: 65
		-- upvalues: GuiService (copy), Constants2 (copy), Display (copy)
		local v70, v71 = GuiService:GetGuiInset()

		GuiService:SetGlobalGuiInset(v70.X, Constants2.ApplyDisplayScale(Constants2.TopBarHeight), v71.X, v71.Y)
		Display.GetDisplayStore().setGuiInset({
			left = v70.X,
			top = Constants2.ApplyDisplayScale(Constants2.TopBarHeight),
			right = v71.X,
			bottom = v71.Y
		})
	end)()
end

local v45 = if not FFlagTopBarRefactor then require(script.Components.TopBarApp) else require(script.ComponentsV2.TopBarApp)
local Reducer = require(script.Reducer)
local TopBarAppPolicy = require(script.TopBarAppPolicy)
local SetSmallTouchDevice = require(script.Actions.SetSmallTouchDevice)
local SetInspectMenuOpen = require(script.Actions.SetInspectMenuOpen)
local SetGamepadMenuOpen = require(script.Actions.SetGamepadMenuOpen)
local SetGamepadNavigationDialogOpen = require(script.Actions.SetGamepadNavigationDialogOpen)
local UpdateUnreadMessagesBadge = require(script.Actions.UpdateUnreadMessagesBadge)
local GetCanChat = require(script.Thunks.GetCanChat)
local GetGameName = require(script.Thunks.GetGameName)
local registerSetCores = require(script.registerSetCores)
local GlobalConfig = require(script.GlobalConfig)
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local FFlagAddMenuNavigationToggleDialog = SharedFlags.FFlagAddMenuNavigationToggleDialog
local FFlagGamepadNavigationDialogABTest = require(script.Flags.FFlagGamepadNavigationDialogABTest)
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local Component = CrossExperienceVoice.Component
local FTUX = RobloxGui.Modules.FTUX
local GetFFlagEnableVRFTUXExperience = require(FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local GetFFlagDebugEnableVRFTUXExperienceInStudio = require(FTUX.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio)
local PlatformEnum = require(FTUX.Enums.PlatformEnum)
local IsFTUXExperience = require(FTUX.Utility.IsFTUXExperience)
local FTUX2 = require(script.Parent.FTUX)
local isRunningInStudio = require(CorePackages.Workspace.Packages.AppCommonLib).isRunningInStudio
local t1 = {}

t1.__index = t1

function t1.new() -- line: 121
	-- upvalues: t1 (copy), GlobalConfig (copy), Roact (copy), TenFootInterface (copy), v30 (copy), GuiService (copy), Constants2 (copy), Rodux (copy), Reducer (copy), FFlagTopBarSignalizeSetCores (copy), registerSetCores (copy), FFlagTopBarDeprecateChatRodux (copy), GetCanChat (copy), FFlagTopBarDeprecateGameInfoRodux (copy), GetGameName (copy), GetFFlagDebugEnableVRFTUXExperienceInStudio (copy), isRunningInStudio (copy), FTUX2 (copy), PlatformEnum (copy), GetFFlagEnableVRFTUXExperience (copy), IsFTUXExperience (copy), isNewInGameMenuEnabled (copy), RobloxGui (copy), FFlagTopBarDeprecateDisplayOptionsRodux (copy), SetSmallTouchDevice (copy), Utility (copy), Constants (copy), UiModeStyleProvider (copy), v45 (copy), FFlagAddMenuNavigationToggleDialog (copy), FFlagGamepadNavigationDialogABTest (copy), DesignTokenProvider (copy), MenuNavigationPromptTokenMapper (copy), Service (ref), FFlagAddTopBarScrim (copy), React (copy), TopBarScrim (ref), RoactRodux (copy), FFlagTopBarRefactor (copy), FFlagAddTopBarPoliciesToUniversalPolicies (copy), RoactAppPolicy (copy), TopBarAppPolicy (copy), AppFeaturePolicies (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactAppExperiment (copy), IXPService (copy), GetFFlagEnableCrossExpVoice (copy), Component (copy), ReactSceneUnderstanding (copy), Songbird (copy), VoiceStateContext (copy), CoreGui (copy), GetFFlagSimpleChatUnreadMessageCount (copy), UpdateUnreadMessagesBadge (copy), FFlagTopBarDeprecateGamepadNavigationDialogRodux (copy)
	local v72 = setmetatable({}, t1)

	if GlobalConfig.propValidation then
		Roact.setGlobalConfig({
			propValidation = true
		})
	end

	if GlobalConfig.elementTracing then
		Roact.setGlobalConfig({
			elementTracing = true
		})
	end

	if not TenFootInterface:IsEnabled() and not v30 then
		GuiService:SetGlobalGuiInset(0, Constants2.TopBarHeight, 0, 0)
	end

	v72.store = Rodux.Store.new(Reducer, nil, { Rodux.thunkMiddleware })

	if not FFlagTopBarSignalizeSetCores then
		registerSetCores(v72.store)
	end

	if not FFlagTopBarDeprecateChatRodux then
		v72.store:dispatch(GetCanChat)
	end

	if not FFlagTopBarDeprecateGameInfoRodux then
		v72.store:dispatch(GetGameName)
	end

	if GetFFlagDebugEnableVRFTUXExperienceInStudio() and isRunningInStudio() then
		FTUX2.mountFtuxMenu(PlatformEnum.QuestVR)
	end

	if GetFFlagEnableVRFTUXExperience() and IsFTUXExperience(PlatformEnum.QuestVR) then
		FTUX2.mountFtuxMenu(PlatformEnum.QuestVR)
	end

	if isNewInGameMenuEnabled() then
		require(RobloxGui.Modules.InGameMenuInit).mountInGameMenu()
	end

	if not FFlagTopBarDeprecateDisplayOptionsRodux then
		coroutine.wrap(function() -- line: 173
			-- upvalues: v72 (copy), SetSmallTouchDevice (copy), Utility (copy)
			v72.store:dispatch(SetSmallTouchDevice(Utility:IsSmallTouchScreen()))
		end)()
	end

	local t2 = {
		themeName = Constants.ThemeName.Dark,
		fontName = Constants.FontName.Gotham
	}
	local v74 = Roact.createElement(v45)

	if FFlagAddMenuNavigationToggleDialog or FFlagGamepadNavigationDialogABTest then
		v74 = Roact.createElement(DesignTokenProvider, {
			tokenMappers = {
				MenuNavigationPrompt = if not FFlagGamepadNavigationDialogABTest then nil else MenuNavigationPromptTokenMapper
			}
		}, {
			TopBarApp = v74
		})
	end

	local v75 = Service and (FFlagAddTopBarScrim and React.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = -2
	}, {
		TopBarScrim = React.createElement(TopBarScrim)
	}))

	v72.root = Roact.createElement(RoactRodux.StoreProvider, {
		store = v72.store
	}, {
		PolicyProvider = Roact.createElement(if not FFlagTopBarRefactor or not FFlagAddTopBarPoliciesToUniversalPolicies then TopBarAppPolicy.Provider else RoactAppPolicy.Provider, {
			policy = if not FFlagTopBarRefactor or not FFlagAddTopBarPoliciesToUniversalPolicies then { TopBarAppPolicy.Mapper } else { AppFeaturePolicies }
		}, ((function(p1) --[[ wrapWithUiModeStyleProvider ]] -- line: 183
			-- upvalues: Roact (copy), UiModeStyleProvider (copy), t2 (copy)
			return {
				UiModeStyleProvider = Roact.createElement(UiModeStyleProvider, {
					style = t2
				}, p1)
			}
		end)({
			LocalizationProvider = Roact.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				ExperimentProvider = Roact.createFragment({
					RoactAppExperimentProvider = Roact.createElement(RoactAppExperiment.Provider, {
						value = IXPService
					}, {
						TopBarApp = v74,
						TopBarScrim = v75
					}),
					CrossExperienceVoice = GetFFlagEnableCrossExpVoice() and Roact.createElement(Component) or nil
				})
			})
		})))
	})
	v72.root = Roact.createElement(ReactSceneUnderstanding.SceneAnalysisProvider, nil, v72.root)
	v72.root = Roact.createElement(Songbird.ReportAudioPopupContext.Provider, nil, v72.root)
	v72.root = Roact.createElement(VoiceStateContext.Provider, nil, v72.root)
	v72.root = Roact.createElement("Folder", {
		Name = "TopBarApp"
	}, v72.root)
	v72.element = Roact.mount(v72.root, CoreGui, "TopBar")

	if not GetFFlagSimpleChatUnreadMessageCount() and not FFlagTopBarDeprecateChatRodux then
		game:GetService("TextChatService").MessageReceived:Connect(function() -- line: 264
			-- upvalues: v72 (copy), UpdateUnreadMessagesBadge (copy)
			v72.store:dispatch(UpdateUnreadMessagesBadge(1))
		end)
	end

	if FFlagGamepadNavigationDialogABTest and not FFlagTopBarDeprecateGamepadNavigationDialogRodux then
		local UserInputService = game:GetService("UserInputService")
		local u77 = nil

		if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			v72:setGamepadNavigationDialogOpen(true)
		else
			u77 = UserInputService.GamepadConnected:Connect(function() -- line: 281
				-- upvalues: v72 (copy), u77 (ref)
				v72:setGamepadNavigationDialogOpen(true)

				if u77 then
					u77:Disconnect()
					u77 = nil
				end
			end)
		end

		GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(function() --[[ disconnectGamepadConnected ]] -- line: 272
			-- upvalues: u77 (ref)
			if u77 then
				u77:Disconnect()
				u77 = nil
			end
		end)
	end

	return v72
end
function t1.setInspectMenuOpen(p2, p3) -- line: 293
	-- upvalues: FFlagTopBarSignalizeMenuOpen (copy), SetInspectMenuOpen (copy)
	if FFlagTopBarSignalizeMenuOpen then
		return
	end

	p2.store:dispatch(SetInspectMenuOpen(p3))
end
function t1.setGamepadMenuOpen(p4, p5) -- line: 300
	-- upvalues: SetGamepadMenuOpen (copy)
	p4.store:dispatch(SetGamepadMenuOpen(p5))
end
function t1.setGamepadNavigationDialogOpen(p6, p7) -- line: 304
	-- upvalues: FFlagTopBarDeprecateDisplayOptionsRodux (copy), SetGamepadNavigationDialogOpen (copy)
	if not FFlagTopBarDeprecateDisplayOptionsRodux then
		p6.store:dispatch(SetGamepadNavigationDialogOpen(p7))
	end
end

return t1.new()
