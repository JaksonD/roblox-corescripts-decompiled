game:GetService("CoreGui")

local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local ParentParent = script.Parent.Parent
local ParentParentParent = ParentParent.Parent
local Components = ParentParent.Components
local Presentation = Components.Presentation
local Chrome = ParentParent.Parent.Chrome
local Constants = require(ParentParent.Constants)
local Constants2 = require(Chrome.Integrations.MusicUtility.Constants)
local _ = require(CorePackages.Workspace.Packages.Analytics).Analytics
local CoreGuiCommon = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local CoreScriptsRoactCommon = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon)
local Foundation = require(CorePackages.Packages.Foundation)
local Display = require(CorePackages.Workspace.Packages.Display)
local React = require(CorePackages.Packages.React)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)

require(CorePackages.Packages.Signals)

local SignalsReact = require(CorePackages.Packages.SignalsReact)
local _ = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local Songbird = require(CorePackages.Workspace.Packages.Songbird)
local Traversal = CoreScriptsRoactCommon.Traversal
local UIBlox = require(CorePackages.Packages.UIBlox)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local FFlagAddMenuNavigationToggleDialog = SharedFlags.FFlagAddMenuNavigationToggleDialog
local FFlagGamepadNavigationDialogABTest = require(ParentParent.Flags.FFlagGamepadNavigationDialogABTest)
local FFlagAddTraversalBackButton = Traversal.Flags.FFlagAddTraversalBackButton
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = SharedFlags.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagDisableGamepadConnectorInVR = require(CorePackages.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR
local FFlagAddTopBarPoliciesToUniversalPolicies = SharedFlags.FFlagAddTopBarPoliciesToUniversalPolicies
local View = Foundation.View
local SelectionCursorProvider = UIBlox.App.SelectionImage.SelectionCursorProvider
local GamepadConnector = require(Components.GamepadConnector)
local GamepadNavigationDialog = require(Presentation.GamepadNavigationDialog)
local HealthBar = CoreGuiCommon.Components.HealthBar
local _ = CoreGuiCommon.Components.HurtOverlay
local _ = CoreGuiCommon.Components.HeadsetDisconnectDialog
local MenuIcon = require(ParentParent.ComponentsV2.MenuIcon)
local MenuIconContext = require(Components.MenuIconContext)
local MenuNavigationToggleDialog = require(Presentation.GamepadMenu.MenuNavigationToggleDialog)
local TraversalBackButton = require(Components.TraversalBackButton)
local v43 = if not isInExperienceUIVREnabled then require(ParentParentParent.VR.VRBottomBar.VRBottomBar) else require(Components.VRBottomUnibar)
local v44 = if not game:GetEngineFeature("InGameChromeSignalAPI") then nil else require(Chrome.ChromeShared.Analytics)
local v45 = if not game:GetEngineFeature("VoiceChatSupported") or not GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then nil else require(Chrome.Integrations.JoinVoiceBinder)
local PartyMicBinder = require(Chrome.Integrations.Party.PartyMicBinder)
local Unibar = require(Chrome.ChromeShared.Unibar)
local default = require(ParentParentParent.VoiceChat.VoiceChatServiceManager).default
local VoiceStateContext = require(ParentParentParent.VoiceChat.VoiceStateContext)

return function(_: {[any]: any}) --[[ TopBarApp ]] -- line: 75
	-- upvalues: Foundation (copy), UniversalAppPolicy (copy), FFlagAddTopBarPoliciesToUniversalPolicies (copy), SignalsReact (copy), CoreGuiCommon (copy), Display (copy), React (copy), GamepadConnector (copy), FFlagDisableGamepadConnectorInVR (copy), isSpatial (copy), VRService (copy), Constants (copy), View (copy), Constants2 (copy), Songbird (copy), FFlagAddMenuNavigationToggleDialog (copy), MenuNavigationToggleDialog (copy), FFlagGamepadNavigationDialogABTest (copy), GamepadNavigationDialog (copy), v45 (copy), GetFFlagEnableCrossExpVoice (copy), PartyMicBinder (copy), v44 (copy), SelectionCursorProvider (copy), MenuIcon (copy), FFlagAddTraversalBackButton (copy), TraversalBackButton (copy), MenuIconContext (copy), Unibar (copy), HealthBar (copy), VoiceStateContext (copy), v43 (copy), default (copy), isInExperienceUIVREnabled (copy)
	local _ = Foundation.Hooks.useTokens
	local v52 = UniversalAppPolicy.useAppPolicy(function(p1) -- line: 77
		-- upvalues: FFlagAddTopBarPoliciesToUniversalPolicies (copy)
		if FFlagAddTopBarPoliciesToUniversalPolicies then
			return p1.getShowBadgeOver12()
		end

		return p1.ShowBadgeOver12 or false
	end)
	local v53 = SignalsReact.useSignalState(function(p2) -- line: 85
		-- upvalues: CoreGuiCommon (copy)
		return CoreGuiCommon.Stores.GetKeepOutAreasStore(p2)
	end)
	local v54 = SignalsReact.useSignalState(function(p3) -- line: 88
		-- upvalues: Display (copy)
		return Display.GetDisplayStore(p3).getUIScale(p3)
	end)
	local v55 = React.useRef(nil)
	local v56 = React.useRef(nil)
	local v57 = GamepadConnector:getShowTopBar()
	local v58, v59 = React.useBinding(v57:get())

	React.useEffect(function() -- line: 98
		-- upvalues: FFlagDisableGamepadConnectorInVR (copy), isSpatial (copy), GamepadConnector (copy), VRService (copy), v57 (copy), v59 (copy), v53 (copy)
		local connection = nil

		if FFlagDisableGamepadConnectorInVR then
			if not isSpatial() then
				GamepadConnector:connectToTopbar()
			end

			connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() -- line: 104
				-- upvalues: isSpatial (copy), GamepadConnector (copy)
				if isSpatial() then
					GamepadConnector:disconnectFromTopbar()

					return
				end

				GamepadConnector:connectToTopbar()
			end)
		else
			GamepadConnector:connectToTopbar()
		end

		local v69 = v57:connect(function() -- line: 115
			-- upvalues: v59 (copy), v57 (copy)
			v59(v57:get())
		end)

		return function() -- line: 118
			-- upvalues: FFlagDisableGamepadConnectorInVR (copy), connection (ref), GamepadConnector (copy), v53 (copy), v69 (copy)
			if FFlagDisableGamepadConnectorInVR and connection then
				connection:Disconnect()
			end

			GamepadConnector:disconnectFromTopbar()

			if v53 then
				v53.cleanup()
			end

			v69:disconnect()
		end
	end, {})

	local v60 = React.useCallback(function(p4) -- line: 130
		-- upvalues: v53 (copy), Constants (copy)
		v53.setKeepOutArea(Constants.TopBarKeepOutAreaId, p4.AbsolutePosition, p4.AbsoluteSize)
	end, { v53 })
	local v61 = Constants.ScreenSideOffset * v54
	local v62 = Constants.TopBarHeight * v54
	local v63 = Constants.TopBarButtonHeight * v54
	local v64 = Constants.TopBarTopMargin * v54

	return React.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 6
	}, {
		Popups = React.createElement(View, {
			tag = "size-full"
		}, {
			SongbirdReportAudioFrame = React.createElement(View, {
				tag = "anchor-center-center position-center-center",
				Size = UDim2.new(1, 0, 0, Constants2.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
			}, {
				ReportAudioPopup = React.createElement(Songbird.ReportAudioPopup)
			}),
			MenuNavigationToggleDialog = if not FFlagAddMenuNavigationToggleDialog then nil else React.createElement(MenuNavigationToggleDialog, {
				Position = UDim2.fromScale(0.5, 0.1),
				GamepadConnector = GamepadConnector
			}),
			GamepadNavigationDialog = if not FFlagGamepadNavigationDialogABTest then nil else React.createElement(GamepadNavigationDialog)
		}),
		Binders = React.createElement(React.Fragment, {}, {
			JoinVoiceBinder = if not v45 then nil else React.createElement(v45),
			PartyMicBinder = if not GetFFlagEnableCrossExpVoice() then nil else React.createElement(PartyMicBinder),
			ChromeAnalytics = if not v44 then nil else React.createElement(v44)
		}),
		TopBarFrame = React.createElement(View, {
			Size = UDim2.new(1, 0, 0, v62)
		}, {
			TopLeftFrame = React.createElement(View, {
				tag = "anchor-top-left auto-x row gap-small",
				Size = UDim2.fromOffset(0, v63),
				onAbsoluteSizeChanged = v60,
				onAbsolutePositionChanged = v60,
				Position = UDim2.new(0, v61, 0, v64),
				Visible = v58
			}, {
				MenuIcon = React.createElement(SelectionCursorProvider, {}, {
					Icon = React.createElement(MenuIcon, {
						showBadgeOver12 = v52,
						menuIconRef = v56,
						unibarMenuRef = v55
					})
				}),
				TraversalBackButton = if not FFlagAddTraversalBackButton then nil else React.createElement(TraversalBackButton),
				UnibarFrame = React.createElement(MenuIconContext.Provider, {
					value = {
						menuIconRef = v56
					}
				}, { React.createElement(Unibar, {
					layoutOrder = 2,
					onMinWidthChanged = function() --[[ onMinWidthChanged ]] -- line: 199
					end,
					onAreaChanged = function() --[[ onAreaChanged ]] -- line: 200
					end,
					menuRef = v55
				}) })
			}),
			TopRightFrame = React.createElement(View, {
				tag = "anchor-top-right auto-x",
				Size = UDim2.fromOffset(0, v63),
				Position = UDim2.new(1, -v61, 0, v64)
			}, {
				HealthBar = React.createElement(HealthBar)
			})
		}),
		VRBottomBar = if not VRService.VREnabled then nil else React.createElement(VoiceStateContext.Provider, {}, {
			VRBottomBar = VoiceStateContext.withVoiceState(function(p5) -- line: 215
				-- upvalues: React (copy), v43 (copy), default (copy), isInExperienceUIVREnabled (copy), v52 (copy)
				return React.createElement(v43, {
					voiceChatServiceManager = default,
					voiceEnabled = p5.voiceEnabled,
					voiceState = p5.voiceState,
					showBadgeOver12 = if not isInExperienceUIVREnabled then nil else v52
				})
			end)
		})
	})
end
