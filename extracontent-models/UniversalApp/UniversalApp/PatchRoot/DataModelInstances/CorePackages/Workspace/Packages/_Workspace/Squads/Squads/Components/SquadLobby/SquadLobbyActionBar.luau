local Squads = script:FindFirstAncestor("Squads")
local AppStorageService = game:GetService("AppStorageService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SquadsParent = Squads.Parent

require(SquadsParent.CrossExperience)

local CrossExperienceVoice = require(SquadsParent.CrossExperienceVoice)
local FocusNavigationUtils = require(SquadsParent.FocusNavigationUtils)
local Foundation = require(SquadsParent.Foundation)
local React = require(SquadsParent.React)
local RoactUtils = require(SquadsParent.RoactUtils)
local RobloxAppSessionization = require(SquadsParent.RobloxAppSessionization)
local SocialCommon = require(SquadsParent.SocialCommon)
local UIBlox = require(SquadsParent.UIBlox)
local VoiceChat = require(SquadsParent.VoiceChat)
local useAppPolicy = require(SquadsParent.UniversalAppPolicy).useAppPolicy
local useLocalUserId = require(SquadsParent.RobloxAppHooks).useLocalUserId
local Constants = require(Squads.Common.Constants)
local dependencies = require(Squads.dependencies)
local SquadPartySheetActionEnum = require(Squads.Enums.SquadPartySheetActionEnum)
local SharedFlags = dependencies.SharedFlags
local SquadsCore = dependencies.SquadsCore
local SquadCoordinationExperienceJoinExperimentation = dependencies.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local SquadLobbySessionProvider = SquadsCore.SquadSessionProvider.SquadLobbySessionProvider
local SquadState = SquadsCore.Enums.SquadState
local dependencyArray = dependencies.Hooks.dependencyArray
local leaveSquad = dependencies.SquadsCore.Thunks.leaveSquad
local useCurrentSquadParentChannelId = SquadsCore.Hooks.useCurrentSquadParentChannelId
local useCurrentSquadSelector = dependencies.Hooks.useCurrentSquadSelector
local useDispatch = dependencies.Hooks.useDispatch
local useLocalization = dependencies.Hooks.useLocalization
local Badge = Foundation.Badge
local BadgeVariant = Foundation.Enums.BadgeVariant
local useTokens = Foundation.Hooks.useTokens
local useLastInputMethod = FocusNavigationUtils.useLastInputMethod
local ExternalEventConnection = RoactUtils.ExternalEventConnection
local EventNames = SquadsCore.Analytics.EventNames
local SquadExternalContractContext = SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local InputUtilities = SocialCommon.Utils.InputUtilities
local SessionType = RobloxAppSessionization.SessionType
local ControlState = UIBlox.Core.Control.Enum.ControlState
local withHoverTooltip = UIBlox.App.Dialog.TooltipV2.withHoverTooltip
local withTooltip = UIBlox.App.Dialog.TooltipV2.withTooltip
local useParticipant = CrossExperienceVoice.Hooks.useParticipant
local useParticipants = CrossExperienceVoice.Hooks.useParticipants
local useIsVoiceConnected = CrossExperienceVoice.Hooks.useIsVoiceConnected
local useIsVoiceFocused = CrossExperienceVoice.Hooks.useIsVoiceFocused
local useIsVoiceDisconnected = CrossExperienceVoice.Hooks.useIsVoiceDisconnected
local useBackgroundExperience = CrossExperienceVoice.Hooks.useBackgroundExperience
local useIsActiveParticipant = CrossExperienceVoice.Hooks.useIsActiveParticipant
local useVoiceStatus = CrossExperienceVoice.Hooks.useVoiceStatus
local CrossExperienceVoiceManager = CrossExperienceVoice.CrossExperienceVoiceManager
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local v55 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false)
local EngineFeature = game:GetEngineFeature("AudioFocusManagement")
local v57 = game:DefineFastString("SquadExperiencePickerTooltipSeenStorageValue", "True")
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = SharedFlags.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local v59 = game:DefineFastFlag("EnableSquadPageChatBadgeFix", false)
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local v61 = not SquadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() and "size-600-600" or "size-800-800"
local t1 = {
	["icons/menu/platformChatOff"] = "speech-bubble-align-center",
	["icons/common/play"] = "play-large",
	["icons/common/search"] = "magnifying-glass",
	["icons/navigation/close"] = "x",
	["icons/controls/headphone"] = "headphones",
	["icons/actions/truncationCollapse_small"] = "chevron-large-up",
	["icons/status/player/developer"] = "hammer-code"
}
local v63 = not SquadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() and "icons/common/play" or "icons/common/search"

local function v64(t2: {[any]: any}) -- line: 170
	-- upvalues: React (copy), ControlState (copy), useTokens (copy), useLastInputMethod (copy), SquadCoordinationExperienceJoinExperimentation (copy), AppStorageService (copy), v57 (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), InputUtilities (copy), CoreGui (copy), ExternalEventConnection (copy), UserInputService (copy), Foundation (copy), withTooltip (copy), withHoverTooltip (copy)
	local v73, v74 = React.useBinding(ControlState.Initialize)
	local v75 = useTokens()
	local v76 = useLastInputMethod()
	local t3 = {
		headerText = t2.tooltipText
	}
	local v78, v79 = React.useState(false)

	React.useEffect(function() -- line: 183
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (copy), t2 (copy), AppStorageService (copy), v57 (copy), v79 (copy)
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			if t2.enableFirstTimeTooltip and t2.showFtuxCustomConditionsMet and (t2.currentHoveredButton == "" or t2.currentHoveredButton == t2.triggerPointName) then
				local ftuxAppStorageKey = t2.ftuxAppStorageKey
				local ok, result = pcall(function() -- line: 152
					-- upvalues: AppStorageService (copy), ftuxAppStorageKey (copy)
					return AppStorageService:GetItem(ftuxAppStorageKey)
				end)

				if not ok or (result == nil or result ~= v57) then
					local ftuxAppStorageKey2 = t2.ftuxAppStorageKey

					pcall(function() -- line: 164
						-- upvalues: AppStorageService (copy), ftuxAppStorageKey2 (copy), v57 (copy)
						AppStorageService:SetItem(ftuxAppStorageKey2, v57)
						AppStorageService:Flush()
					end)

					if t2.currentHoveredButton == "" then
						v79(true)

						return
					end

					return
				end
			end

			if not t2.enableFirstTimeTooltip or t2.currentHoveredButton ~= "" and t2.currentHoveredButton ~= t2.triggerPointName then
				v79(false)
			end

			return
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t2.currentHoveredButton, t2.enableFirstTimeTooltip, t2.ftuxAppStorageKey, t2.showFtuxCustomConditionsMet, t2.triggerPointName) else {
		t2.currentHoveredButton,
		t2.enableFirstTimeTooltip,
		t2.ftuxAppStorageKey,
		t2.showFtuxCustomConditionsMet,
		t2.triggerPointName
	})

	local v80 = React.useCallback(function(p1) -- line: 224
		-- upvalues: InputUtilities (copy), v76 (copy), v79 (copy)
		if InputUtilities.isActivationInput(p1) or v76 == "Gamepad" then
			v79(false)
		end
	end, { v76 })
	local t4 = {
		DisplayOrder = 6,
		disabled = false,
		guiTarget = CoreGui,
		active = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v78,
		triggerPointName = t2.triggerPointName
	}

	local function v82(p2, p3, p4: ((...any) -> ...any)?) -- line: 240
		-- upvalues: React (copy), ControlState (copy), SquadCoordinationExperienceJoinExperimentation (copy), t2 (copy), v73 (copy), v74 (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), v78 (copy), ExternalEventConnection (copy), UserInputService (copy), v80 (copy), Foundation (copy), v75 (copy)
		local v151 = React.useCallback(function(p5) -- line: 242
			-- upvalues: ControlState (copy), SquadCoordinationExperienceJoinExperimentation (copy), t2 (copy), p4 (copy), v73 (copy), v74 (copy)
			local v167 = ControlState.fromRawValue(p5)

			if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
				if v167 == ControlState.Hover then
					t2.onHoverCalled(t2.triggerPointName)
				elseif v167 == ControlState.Default then
					t2.onHoverCalled("")
				end
			end

			if p4 then
				p4(v73:getValue(), v167)
			end

			v74(v167)
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73, t2.onHoverCalled, t2.triggerPointName, v74) else {
			v73,
			t2.onHoverCalled,
			t2.triggerPointName,
			v74
		})
		local v152 = React.useCallback(function() -- line: 264
			-- upvalues: t2 (copy), v78 (copy)
			if t2.onActivated then
				t2.onActivated(v78)
			end
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v78, t2.onActivated) else {
			v78,
			t2.onActivated
		})

		return React.createElement("Frame", {
			AutomaticSize = t2.automaticSize,
			LayoutOrder = t2.layoutOrder,
			Size = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			[React.Change.AbsolutePosition] = p2,
			[React.Change.AbsoluteSize] = p3
		}, {
			InputEndedConnection = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() or not v78 then nil else React.createElement(ExternalEventConnection, {
				event = UserInputService.InputEnded,
				callback = v80
			}),
			React.createElement(Foundation.View, {
				Size = UDim2.fromScale(1, 1),
				backgroundStyle = t2.backgroundStyle,
				cornerRadius = UDim.new(0, v75.Radius.Circle),
				isDisabled = t2.isDisabled,
				onActivated = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then t2.onActivated else v152,
				onStateChanged = v151
			}, t2.children)
		})
	end

	if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and v78 then
		return (withTooltip(t3, t4, function(p6) -- line: 302
			-- upvalues: v82 (copy)
			return v82(p6, p6, nil)
		end))
	end

	return (withHoverTooltip(t3, t4, function(p7, p8) -- line: 306
		-- upvalues: v82 (copy)
		return v82(p7, p7, p8)
	end))
end
local function renderStandardImage(p9, p10, p11, p12) -- line: 323
	-- upvalues: t1 (copy), React (copy), Foundation (copy)
	local v88 = t1[p10]

	if v88 then
		local t5 = {
			["size-600-600"] = p12.Size.Size_600,
			["size-800-800"] = p12.Size.Size_800
		}

		return React.createElement(Foundation.Icon, {
			name = v88,
			style = if not p9 then p12.Color.Content.Emphasis else p12.Color.Content.Muted,
			size = t5[p11] or t5["size-600-600"],
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	end

	return React.createElement(Foundation.Image, {
		Image = p10,
		tag = {
			["content-emphasis"] = not p9,
			["content-muted"] = p9,
			["anchor-center-center position-center-center " .. p11] = true
		}
	})
end
local function getLoadingIndicatorIcon(p13, p14, b1: boolean?, b2: boolean?, n1: number?) -- line: 346
	-- upvalues: VoiceChat (copy)
	local v95 = p13.Config.ColorMode.IsLight ~= "true" and "MicLight" or "MicDark"

	if not b1 or (not p14 or p14.isMuted) then
		return VoiceChat.Utils.GetIcon("Muted", v95)
	end

	if b2 then
		return VoiceChat.Utils.GetIcon("Unmuted", v95, n1)
	end

	return VoiceChat.Utils.GetIcon("Unmuted0", v95)
end
local function renderToggleAudioFocusButton(p15, p16, p17, p18, p19) -- line: 364
	-- upvalues: React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), Foundation (copy)
	return React.createElement(v64, {
		automaticSize = Enum.AutomaticSize.X,
		currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else p18,
		enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
		ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "",
		isDisabled = false,
		layoutOrder = 0,
		onActivated = p17,
		onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else p19,
		showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
		tooltipText = p16,
		triggerPointName = "ToggleAudioFocusButton"
	}, {
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p15.Padding.Small),
			PaddingRight = UDim.new(0, p15.Padding.Small)
		}),
		ToggleFocusButtonIcon = React.createElement(Foundation.Image, {
			Image = "icons/controls/headphone",
			tag = "anchor-center-center position-center-center size-900 content-emphasis"
		}),
		CaretIcon = React.createElement(Foundation.Image, {
			Image = "icons/actions/truncationCollapse_small",
			tag = "anchor-center-center position-center-center size-300-300 content-emphasis"
		})
	})
end

return function(t6: {[any]: any}) -- line: 414
	-- upvalues: useDispatch (copy), useLocalization (copy), SquadCoordinationExperienceJoinExperimentation (copy), useTokens (copy), useCurrentSquadParentChannelId (copy), useCurrentSquadSelector (copy), useVoiceStatus (copy), React (copy), useAppPolicy (copy), HttpService (copy), SquadLobbySessionProvider (copy), SquadExternalContractContext (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), EventNames (copy), SquadPartySheetActionEnum (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), SessionType (copy), leaveSquad (copy), SquadState (copy), v64 (copy), Badge (copy), v59 (copy), BadgeVariant (copy), renderStandardImage (copy), v63 (copy), v61 (copy), GetFFlagEnableCrossExpVoice (copy), useLocalUserId (copy), useBackgroundExperience (copy), useParticipant (copy), useIsVoiceConnected (copy), useIsVoiceDisconnected (copy), useIsVoiceFocused (copy), useParticipants (copy), useIsActiveParticipant (copy), EngineFeature (copy), CrossExperienceVoiceManager (copy), RunService (copy), renderToggleAudioFocusButton (copy), v55 (copy), getLoadingIndicatorIcon (copy), Foundation (copy), Constants (copy)
	local v102 = useDispatch()
	local v103 = useLocalization({
		audioText = "Feature.Squads.Label.Audio",
		findExperiencesText = not SquadCoordinationExperienceJoinExperimentation.getIsNewTooltipCopyEnabled() and "Feature.Squads.Label.FindExperiences" or "Feature.Squads.Label.FindExperiencesPlayTogether",
		leavePartyText = "Feature.Squads.Label.LeaveParty",
		muteMicText = "Feature.Squads.Label.MuteMic",
		unmuteMicText = "Feature.Squads.Label.UnmuteMic",
		viewChatText = "Feature.Squads.Label.ViewChat"
	})
	local v104 = useTokens()
	local v105 = useCurrentSquadParentChannelId()
	local v106 = useCurrentSquadSelector()
	local v107 = useVoiceStatus()
	local v108, v109 = React.useState("")
	local v110 = React.useCallback(function(p20) -- line: 435
		-- upvalues: v109 (copy)
		v109(p20)
	end, {})
	local v111 = (not v106 or not v106.members) and 0 or #v106.members
	local v112 = React.useCallback(function(p21) -- line: 442
		return p21.getCanUsePlatformChat()
	end, {})
	local v113 = useAppPolicy(v112)
	local v114 = React.useMemo(function() -- line: 447
		-- upvalues: HttpService (copy)
		return HttpService:GenerateGUID()
	end, {})
	local v115 = if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else React.useContext(SquadLobbySessionProvider.Context)
	local v116 = React.useContext(SquadExternalContractContext)
	local v117 = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or v116.useIsChatEnabled()
	local v118 = React.useCallback(function(p22) -- line: 460
		-- upvalues: v116 (copy), EventNames (copy), v105 (copy), SquadPartySheetActionEnum (copy), v107 (copy), t6 (copy)
		v116.fireSquadAnalytics(EventNames.PartySheetAction, {
			parentChannelId = v105,
			actionType = SquadPartySheetActionEnum.ChatButtonClicked,
			isFtuxTooltipShown = p22,
			voiceStatus = v107
		})
		t6.navigateAwayFromSquad()
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t6.navigateAwayFromSquad, v105, v116.fireSquadAnalytics, v107) else {
		t6.navigateAwayFromSquad,
		v105,
		v116.fireSquadAnalytics,
		v107
	})
	local v119 = React.useCallback(function(p23) -- line: 485
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (copy), v115 (copy), SessionType (copy), HttpService (copy), v116 (copy), EventNames (copy), v105 (copy), SquadPartySheetActionEnum (copy), v107 (copy), v102 (copy), t6 (copy)
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
			v115.updateMetadata(SessionType.Metadata.SquadLobbyPage.ExperiencePickerUuid, HttpService:GenerateGUID(false))
		end

		v116.fireSquadAnalytics(EventNames.PartySheetAction, {
			parentChannelId = v105,
			actionType = SquadPartySheetActionEnum.PickExperienceButtonClicked,
			isFtuxTooltipShown = p23,
			voiceStatus = v107
		})

		if SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then
			v116.showSearchOverlay(v102)

			return
		end

		t6.navigateToHomePage()
	end, {
		v105,
		t6.navigateToHomePage,
		v116.fireSquadAnalytics,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then nil else v102,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then nil else v116.showSearchOverlay,
		if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else v115.updateMetadata,
		v107
	})
	local v120 = React.useCallback(function(p24) -- line: 519
		-- upvalues: v116 (copy), EventNames (copy), v105 (copy), SquadPartySheetActionEnum (copy), v107 (copy), v102 (copy), leaveSquad (copy), t6 (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), v117 (copy)
		v116.fireSquadAnalytics(EventNames.PartySheetAction, {
			parentChannelId = v105,
			actionType = SquadPartySheetActionEnum.EndCallButtonClicked,
			isFtuxTooltipShown = p24,
			voiceStatus = v107
		})
		v102(leaveSquad(nil, v116.setSquadPrompt, function() -- line: 531
			-- upvalues: t6 (copy)
			t6.navigateAwayFromSquad()
		end, v116.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or v117))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v102, t6.navigateAwayFromSquad, v105, v116.fireSquadAnalytics, v116.setSquadPrompt, v116.squadLocation, if not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then nil else v117, v107) else {
		v102,
		t6.navigateAwayFromSquad,
		v105,
		v116.fireSquadAnalytics,
		v116.setSquadPrompt,
		v116.squadLocation,
		if not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then nil else v117,
		v107
	})
	local v121 = t6.squadState ~= SquadState.Active
	local v122 = React.useMemo(function() -- line: 565
		-- upvalues: React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v108 (copy), v121 (copy), v118 (copy), v110 (copy), v103 (copy), t6 (copy), Badge (copy), v104 (copy), v59 (copy), BadgeVariant (copy), renderStandardImage (copy)
		return React.createElement(v64, {
			currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
			enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "",
			isDisabled = v121,
			layoutOrder = 2,
			onActivated = v118,
			onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
			showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			tooltipText = v103.viewChatText,
			triggerPointName = "ChatButton"
		}, {
			UnreadMessagesBadge = if not t6.hasUnreadMessages then nil else React.createElement(Badge, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -v104.Size.Size_250, 0, v104.Size.Size_250),
				badgeVariant = if not v59 then BadgeVariant.Alert else nil,
				variant = if not v59 then nil else BadgeVariant.Alert
			}),
			renderStandardImage(v121, "icons/menu/platformChatOff", "size-800-800", v104)
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108, v104, v121, v103.viewChatText, v118, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110, t6.hasUnreadMessages) else {
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
		v104,
		v121,
		v103.viewChatText,
		v118,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
		t6.hasUnreadMessages
	})
	local v123 = React.useMemo(function() -- line: 629
		-- upvalues: t6 (copy), React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v108 (copy), v121 (copy), v119 (copy), v110 (copy), v111 (copy), v103 (copy), renderStandardImage (copy), v63 (copy), v61 (copy), v104 (copy)
		if t6.isInExperience then
			return nil
		end

		return (React.createElement(v64, {
			currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
			enableFirstTimeTooltip = not not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() or nil,
			ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "SquadExperiencePickerTooltipSeen",
			isDisabled = v121,
			layoutOrder = 3,
			onActivated = v119,
			onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
			showFtuxCustomConditionsMet = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v111 >= 2,
			tooltipText = v103.findExperiencesText,
			triggerPointName = "PickExperienceButton"
		}, renderStandardImage(v121, v63, v61, v104)))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108, v104, v121, v103.findExperiencesText, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v111, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110, t6.isInExperience, t6.navigateToHomePage) else {
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
		v104,
		v121,
		v103.findExperiencesText,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v111,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
		t6.isInExperience,
		t6.navigateToHomePage
	})
	local v124 = React.useMemo(function() -- line: 691
		-- upvalues: v121 (copy), v104 (copy), React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v108 (copy), v120 (copy), v110 (copy), v103 (copy), renderStandardImage (copy)
		local v161 = if not v121 then v104.Color.System.Alert else v104.Color.ActionStandard.Background

		return React.createElement(v64, {
			backgroundStyle = v161,
			currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
			enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "",
			isDisabled = v121,
			layoutOrder = 4,
			onActivated = v120,
			onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
			showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			tooltipText = v103.leavePartyText,
			triggerPointName = "EndCallButton"
		}, renderStandardImage(v121, "icons/navigation/close", "size-600-600", v104))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108, v104, v121, v103.leavePartyText, v120, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110) else {
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
		v104,
		v121,
		v103.leavePartyText,
		v120,
		if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110
	})
	local v125 = nil
	local v126 = nil
	local v127 = nil

	if GetFFlagEnableCrossExpVoice() then
		local v128 = tonumber(useLocalUserId()) or -1
		local v129 = React.useRef(0)
		local v130 = useBackgroundExperience()
		local v131 = useParticipant(v128)
		local v132 = useIsVoiceConnected()
		local v133 = useIsVoiceDisconnected()
		local v134 = useIsVoiceFocused() or t6.forceIsVoiceFocused
		local v135 = useParticipants()
		local v136 = useIsActiveParticipant(v128)
		local v137, v138 = React.useState(0)
		local v139 = EngineFeature
		local v140 = React.useCallback(function(_) -- line: 763
			-- upvalues: HttpService (copy), v130 (copy), v131 (copy), v135 (copy), CrossExperienceVoiceManager (copy)
			print("----------- CEV FOREGROUND -----------")
			print("Experience info", HttpService:JSONEncode(v130))
			print("Current Voice Participant", HttpService:JSONEncode(v131))
			print("Squads Store Participants", HttpService:JSONEncode(v135 or {}))
			print("--------------------------------------")
			CrossExperienceVoiceManager.default:dumpDebugData()
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v135, v131) else {
			v135,
			v131
		})
		local v141 = React.useCallback(function(_) -- line: 776
			-- upvalues: v131 (copy), CrossExperienceVoiceManager (copy)
			if v131 then
				if v131.isMuted then
					CrossExperienceVoiceManager.default:unmuteVoiceParticipant(v131.userId)

					return
				end

				CrossExperienceVoiceManager.default:muteVoiceParticipant(v131.userId)
			end
		end, { v131 })

		React.useEffect(function() -- line: 786
			-- upvalues: RunService (copy), v114 (copy), v129 (copy), v138 (copy)
			RunService:BindToRenderStep(v114, 1, function() -- line: 787
				-- upvalues: v129 (copy), v138 (copy)
				if v129.current > 3 then
					v138(math.random())
					v129.current = 0

					return
				end

				v129.current = v129.current + 1
			end)

			return function() -- line: 796
				-- upvalues: RunService (copy), v114 (copy)
				RunService:UnbindFromRenderStep(v114)
			end
		end, {})
		v125 = React.useMemo(function() -- line: 802
			-- upvalues: v121 (copy), v139 (copy), v132 (copy), renderToggleAudioFocusButton (copy), v104 (copy), v103 (copy), t6 (copy), v108 (copy), v110 (copy)
			if not v121 and (v139 and v132) then
				return renderToggleAudioFocusButton(v104, v103.audioText, t6.toggleVoiceChatMenu, v108, v110)
			end

			return nil
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v104, v139, v108, v121, v132, v103.audioText, v110, t6.toggleVoiceChatMenu) else {
			v104,
			v139,
			v108,
			v121,
			v132,
			v103.audioText,
			v110,
			t6.toggleVoiceChatMenu
		})

		if v55 then
			v126 = React.useMemo(function() -- line: 839
				-- upvalues: React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v108 (copy), v121 (copy), v140 (copy), v110 (copy), renderStandardImage (copy), v104 (copy)
				return React.createElement(v64, {
					currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
					enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "",
					isDisabled = v121,
					layoutOrder = 5,
					onActivated = v140,
					onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
					showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					tooltipText = "Debug voice",
					triggerPointName = "DebugVoiceButton"
				}, renderStandardImage(v121, "icons/status/player/developer", "size-600-600", v104))
			end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108, v104, v121, v140, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110) else {
				if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
				v104,
				v121,
				v140,
				if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110
			})
		end

		local v142 = React.useMemo(function() -- line: 890
			-- upvalues: getLoadingIndicatorIcon (copy), v104 (copy), v131 (copy), v132 (copy), v121 (copy), v136 (copy), v137 (copy)
			return getLoadingIndicatorIcon(v104, v131, v132, not v121 and v136, v137)
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v136, v121, v132, v137, v131, v104) else {
			v136,
			v121,
			v132,
			v137,
			v131,
			v104
		})

		v127 = React.useMemo(function() -- line: 912
			-- upvalues: v133 (copy), v121 (copy), EngineFeature (copy), v134 (copy), v132 (copy), v131 (copy), React (copy), v64 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v108 (copy), v141 (copy), v110 (copy), v103 (copy), renderStandardImage (copy), v142 (copy), v104 (copy)
			if v133 then
				return nil
			end

			if v121 or not EngineFeature or v134 then
				local v164 = not v132 or (v131 == nil or v121)
				local v165 = not v132 or (not v131 or v131.isMuted)

				return React.createElement(v64, {
					currentHoveredButton = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
					enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					ftuxAppStorageKey = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else "",
					isDisabled = v164,
					layoutOrder = 1,
					onActivated = v141,
					onHoverCalled = if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
					showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					tooltipText = if not v165 then v103.muteMicText else v103.unmuteMicText,
					triggerPointName = "ToggleMicButton"
				}, renderStandardImage(v164, v142, "size-800-800", v104))
			end

			return nil
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108, v104, v142, v121, v134, v132, v103.muteMicText, v103.unmuteMicText, if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110, v141, v131, v133) else {
			if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v108,
			v104,
			v142,
			v121,
			v134,
			v132,
			v103.muteMicText,
			v103.unmuteMicText,
			if not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then nil else v110,
			v141,
			v131,
			v133
		})
	end

	return React.createElement(Foundation.View, {
		AutomaticSize = Enum.AutomaticSize.X,
		AnchorPoint = t6.anchorPoint,
		Position = t6.position,
		Size = UDim2.fromOffset(0, Constants.SQUAD_LOBBY_ACTION_BAR_HEIGHT),
		backgroundStyle = v104.Color.OverMedia.OverMedia_0,
		cornerRadius = UDim.new(0, v104.Radius.Circle),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, v104.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = v104.Padding.Small
	}, {
		ToggleAudioFocusButton = v125,
		ToggleMicButton = v127,
		ChatButton = if not v113 then nil else v122,
		PickExperienceButton = v123,
		EndCallButton = v124,
		DebugVoiceButton = v126
	})
end
