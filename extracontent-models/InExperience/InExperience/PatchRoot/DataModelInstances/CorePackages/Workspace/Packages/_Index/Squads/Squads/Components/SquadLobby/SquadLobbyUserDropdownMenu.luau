local Squads = script:FindFirstAncestor("Squads")
local dependencies = require(Squads.dependencies)
local SquadsParent = Squads.Parent
local CrossExperienceVoice = require(SquadsParent.CrossExperienceVoice)
local ExperienceService = require(SquadsParent.ExperienceService)
local FocusNavigationUtils = require(SquadsParent.FocusNavigationUtils)
local InputHandlers = require(SquadsParent.InputHandlers)
local UIBlox = require(SquadsParent.UIBlox)
local useLocalUserId = require(SquadsParent.RobloxAppHooks).useLocalUserId
local SquadPartySheetActionEnum = require(Squads.Enums.SquadPartySheetActionEnum)

require(Squads.Common.ModelTypes)

local Cryo = dependencies.Cryo
local PresenceType = dependencies.RoduxPresence.Enums.PresenceType
local React = dependencies.React
local SharedFlags = dependencies.SharedFlags
local Images = UIBlox.App.ImageSet.Images
local ModalBottomSheet = UIBlox.ModalBottomSheet
local dependencyArray = dependencies.Hooks.dependencyArray
local SquadsCore = dependencies.SquadsCore
local useDispatch = dependencies.Hooks.useDispatch
local useLocalization = dependencies.Hooks.useLocalization
local useStore = dependencies.Hooks.useStore
local useSelector = dependencies.Hooks.useSelector
local useBackgroundExperience = CrossExperienceVoice.Hooks.useBackgroundExperience
local useParticipants = CrossExperienceVoice.Hooks.useParticipants
local useVoiceStatus = CrossExperienceVoice.Hooks.useVoiceStatus
local useSquadUserDropdownMenuButtons = require(Squads.Hooks.useSquadUserDropdownMenuButtons)
local GameParams = ExperienceService.GameParams
local ExperienceService2 = ExperienceService.ExperienceService
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local EventNames = SquadsCore.Analytics.EventNames
local SquadExternalContractContext = SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local SquadLocationEnum = SquadsCore.Enums.SquadLocationEnum
local SquadPromptType = SquadsCore.Enums.SquadPromptType
local Constants = SquadsCore.Common.Constants
local useIsLocalPlayerPartyVoiceEligible = SquadsCore.Hooks.useIsLocalPlayerPartyVoiceEligible
local useIsUserPartyVoiceEligible = SquadsCore.Hooks.useIsUserPartyVoiceEligible
local useIsCurrentSquadPartyVoiceEligible = SquadsCore.Hooks.useIsCurrentSquadPartyVoiceEligible
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local getFFlagEnableCrossExpVoiceAbuseReport = SharedFlags.getFFlagEnableCrossExpVoiceAbuseReport
local FFlagEnableSquadUserCardHoverFix = SharedFlags.FFlagEnableSquadUserCardHoverFix
local FFlagSquadLaunchExperienceMobileFix = SharedFlags.FFlagSquadLaunchExperienceMobileFix
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local useIsParticipantMutedLocally = CrossExperienceVoice.Hooks.useIsParticipantMutedLocally
local default = CrossExperienceVoice.CrossExperienceVoiceManager.default
local v48 = Images["icons/common/play"]
local v49 = Images["icons/menu/profile"]
local v50 = Images["icons/actions/feedback"]
local v51 = Images["icons/actions/leave"]
local v52 = Images["icons/controls/headphoneDeafen_small"]
local v53 = Images["icons/controls/microphoneMute"]
local v54 = Images["icons/controls/microphone"]
local t1 = {
	isInExperience = false,
	onDismiss = function() --[[ onDismiss ]] -- line: 105
	end,
	openViewProfile = function() --[[ openViewProfile ]] -- line: 106
	end,
	openVoiceAbuseReport = function() --[[ openVoiceAbuseReport ]] -- line: 107
	end,
	parentChannelId = "",
	userId = ""
}

return function(t2: {[any]: any}) -- line: 112
	-- upvalues: Cryo (copy), t1 (copy), React (copy), SquadExternalContractContext (copy), useDispatch (copy), useLocalUserId (copy), useStore (copy), useVoiceStatus (copy), FFlagEnableSquadUserCardHoverFix (copy), useSquadUserDropdownMenuButtons (copy), useIsParticipantMutedLocally (copy), useLocalization (copy), Constants (copy), EventNames (copy), SquadPartySheetActionEnum (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), SquadPromptType (copy), GetFFlagEnableCrossExpVoice (copy), useBackgroundExperience (copy), useParticipants (copy), useIsLocalPlayerPartyVoiceEligible (copy), useIsUserPartyVoiceEligible (copy), useIsCurrentSquadPartyVoiceEligible (copy), useSelector (copy), PresenceType (copy), GameParams (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadLocationEnum (copy), ExperienceService2 (copy), v52 (copy), v48 (copy), v51 (copy), v49 (copy), v50 (copy), v53 (copy), v54 (copy), default (copy), getFFlagEnableCrossExpVoiceAbuseReport (copy), FFlagEnableAppChatFocusableFixes (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), FocusNavigableSurfaceIdentifierEnum (copy), ModalBottomSheet (copy)
	local v57 = Cryo.Dictionary.union(t1, t2)
	local v58 = React.useContext(SquadExternalContractContext)
	local v59 = useDispatch()
	local v60 = useLocalUserId()
	local v61 = useStore()
	local v62 = useVoiceStatus()
	local v63 = if not FFlagEnableSquadUserCardHoverFix then nil else useSquadUserDropdownMenuButtons(v57.userId, v57.isInExperience)
	local v64 = useIsParticipantMutedLocally(tonumber(v57.userId) or -1)
	local v65 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		reportUserText = "Feature.Chat.Action.ReportUser",
		removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
		voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible",
		muteVoiceButtonText = "Feature.Chat.Action.MuteVoice",
		unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
	})
	local v66 = v58.useGetConversationFromId(v57.parentChannelId)
	local v67 = React.useMemo(function() -- line: 137
		-- upvalues: v66 (copy), Constants (copy), v60 (copy)
		return v66 and (v66.type == Constants.CONVERSATION_CHANNEL_GROUP_TYPE and v66.initiator == v60)
	end, {
		v66,
		v60
	})
	local v68 = React.useCallback(function() -- line: 144
		-- upvalues: v58 (copy), EventNames (copy), v57 (copy), SquadPartySheetActionEnum (copy), v62 (copy)
		v58.fireSquadAnalytics(EventNames.PartySheetAction, {
			parentChannelId = v57.parentChannelId,
			actionType = SquadPartySheetActionEnum.ViewProfileButtonClicked,
			voiceStatus = v62
		})
		v57.openViewProfile()
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v57.parentChannelId, v57.openViewProfile, v58.fireSquadAnalytics, v62) else {
		v57.parentChannelId,
		v57.openViewProfile,
		v58.fireSquadAnalytics,
		v62
	})
	local v69 = React.useCallback(function() -- line: 169
		-- upvalues: v58 (copy), EventNames (copy), v57 (copy), SquadPartySheetActionEnum (copy), v62 (copy), v61 (copy), SquadPromptType (copy), v59 (copy)
		v58.fireSquadAnalytics(EventNames.PartySheetAction, {
			parentChannelId = v57.parentChannelId,
			actionType = SquadPartySheetActionEnum.RemoveUserDropDownButtonClicked,
			voiceStatus = v62
		})
		v58.setSquadPrompt(v61, {
			promptType = SquadPromptType.RemoveFromChat,
			onConfirm = function() --[[ onConfirm ]] -- line: 178
				-- upvalues: v57 (copy), v58 (copy), EventNames (copy), SquadPartySheetActionEnum (copy), v62 (copy), v59 (copy)
				if v57.userId ~= "" and v57.parentChannelId ~= "" then
					v58.fireSquadAnalytics(EventNames.PartySheetAction, {
						parentChannelId = v57.parentChannelId,
						actionType = SquadPartySheetActionEnum.RemoveUserDialogButtonClicked,
						voiceStatus = v62
					})

					return v58.removeUserFromParentChannel(v59, v57.parentChannelId, v57.userId)
				end

				return nil
			end
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v59, v57.userId, v57.parentChannelId, v58.fireSquadAnalytics, v58.setSquadPrompt, v58.removeUserFromParentChannel, v62) else {
		v59,
		v57.userId,
		v57.parentChannelId,
		v58.fireSquadAnalytics,
		v58.setSquadPrompt,
		v58.removeUserFromParentChannel,
		v62
	})
	local u70 = nil
	local u71 = nil
	local u72 = nil
	local t3 = {}
	local u74 = nil
	local u75 = nil

	if GetFFlagEnableCrossExpVoice() then
		u70 = useBackgroundExperience()
		u72 = useParticipants() or {}
		t3 = React.useMemo(function() -- line: 225
			-- upvalues: u72 (ref)
			local t4 = {}

			for _, v in pairs(u72) do
				table.insert(t4, v.userId)
			end

			return t4
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u72) else { u72 })
		u74 = React.useMemo(function() -- line: 233
			-- upvalues: u70 (ref)
			if u70 then
				return u70.voiceChannelId
			end

			return nil
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u70) else { u70 })
		u75 = React.useMemo(function() -- line: 241
			-- upvalues: u70 (ref)
			if u70 then
				return u70.voiceSessionId
			end

			return nil
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u70) else { u70 })

		if not FFlagEnableSquadUserCardHoverFix then
			local v76 = if not v57.userId then nil else tonumber(v57.userId)

			if v76 then
				local v77 = useIsLocalPlayerPartyVoiceEligible()
				local v78 = useIsUserPartyVoiceEligible(v76)

				u71 = useIsCurrentSquadPartyVoiceEligible() == true and (v77 and not v78)
			end
		end
	end

	local v79 = React.useCallback(function(p1) -- line: 262
		-- upvalues: v57 (copy)
		return p1.Squad.Presence.byUserId[v57.userId]
	end, { v57.userId })
	local v80 = useSelector(v79)
	local v81 = React.useMemo(function() -- line: 268
		-- upvalues: FFlagEnableSquadUserCardHoverFix (copy), v63 (copy), v80 (copy), PresenceType (copy)
		if FFlagEnableSquadUserCardHoverFix then
			return table.find(v63, "JoinButton") ~= nil and (v80 and (v80.userPresenceType == PresenceType.InGame and v80.placeId))
		end

		return v80 and (v80.userPresenceType == PresenceType.InGame and v80.placeId)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v80, v63) else {
		v80,
		v63
	})
	local v82 = React.useCallback(function() -- line: 286
		-- upvalues: v81 (copy), GameParams (copy), v57 (copy), v80 (copy), FFlagSquadLaunchExperienceMobileFix (copy), v58 (copy), SquadLocationEnum (copy), ExperienceService2 (copy)
		if v81 then
			local v88 = GameParams.fromUserId(v57.userId, v80.placeId)

			if v57.isInExperience and FFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end

			local s1 = "SquadLobby"

			if v58.squadLocation == SquadLocationEnum.UniversalApp then
				s1 = "SquadLobbyFromUA"
			elseif v58.squadLocation == SquadLocationEnum.InExperience then
				s1 = "SquadLobbyFromInExp"
			end

			ExperienceService2:LaunchExperience(v88, s1, nil)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v81, v58.squadLocation, v57.isInExperience, v57.userId, v80) else {
		v81,
		v58.squadLocation,
		v57.isInExperience,
		v57.userId,
		v80
	})
	local v83 = if not FFlagEnableSquadUserCardHoverFix then React.useMemo(function() -- line: 436
		-- upvalues: v60 (copy), v57 (copy), getFFlagEnableCrossExpVoiceAbuseReport (copy), u74 (ref), u71 (ref), v52 (copy), v65 (copy), v81 (copy), v48 (copy), v82 (copy), v49 (copy), v68 (copy), v50 (copy), u75 (ref), t3 (ref), v67 (copy), v51 (copy), v69 (copy)
		local v95 = tostring(v60) == v57.userId
		local isInExperience = v57.isInExperience
		local v97 = getFFlagEnableCrossExpVoiceAbuseReport() and (not not u74 and not v95)
		local t5 = {}

		if u71 then
			table.insert(t5, {
				icon = v52,
				text = v65.voiceIneligibleText,
				stayOnActivated = true
			})
		end

		if v81 then
			table.insert(t5, {
				icon = v48,
				text = v65.joinButtonText,
				onActivated = v82
			})
		end

		if not isInExperience then
			table.insert(t5, {
				icon = v49,
				text = v65.viewProfileText,
				onActivated = v68
			})
		end

		if v97 then
			table.insert(t5, {
				icon = v50,
				text = v65.reportUserText,
				onActivated = function() --[[ onActivated ]] -- line: 473
					-- upvalues: v60 (copy), v57 (copy), u74 (ref), u75 (ref), t3 (ref)
					local t6 = {
						submitterUserId = tostring(v60),
						abuserUserId = v57.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = u74,
						voiceSessionId = u75,
						voiceUserIds = t3,
						voiceUserCount = #t3
					}

					v57.openSquadVoiceAbuseReport(t6)
				end
			})
		end

		if v67 then
			table.insert(t5, {
				icon = v51,
				text = v65.removeFromGroupText,
				onActivated = v69
			})
		end

		return t5
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v57.isInExperience, v57.userId, v57.openSquadVoiceAbuseReport, v65.joinButtonText, v65.removeFromGroupText, v65.reportUserText, v65.viewProfileText, v65.voiceIneligibleText, u71, v60, u74, u75, t3, v69, v81, v67, v82, v68) else {
		v57.isInExperience,
		v57.userId,
		v57.openSquadVoiceAbuseReport,
		v65.joinButtonText,
		v65.removeFromGroupText,
		v65.reportUserText,
		v65.viewProfileText,
		v65.voiceIneligibleText,
		u71,
		v60,
		u74,
		u75,
		t3,
		v69,
		v81,
		v67,
		v82,
		v68
	}) else React.useMemo(function() -- line: 322
		-- upvalues: v52 (copy), v65 (copy), v48 (copy), v82 (copy), v51 (copy), v69 (copy), v49 (copy), v68 (copy), v50 (copy), v60 (copy), v57 (copy), u74 (ref), u75 (ref), t3 (ref), v64 (copy), v53 (copy), v54 (copy), default (copy), v63 (copy)
		local t8 = {
			VoiceIneligibleButton = {
				icon = v52,
				text = v65.voiceIneligibleText,
				stayOnActivated = true
			},
			JoinButton = {
				icon = v48,
				text = v65.joinButtonText,
				onActivated = v82
			},
			RemoveUserButton = {
				icon = v51,
				text = v65.removeFromGroupText,
				onActivated = v69
			},
			ViewProfileButton = {
				icon = v49,
				text = v65.viewProfileText,
				onActivated = v68
			},
			ReportButton = {
				icon = v50,
				text = v65.reportUserText,
				onActivated = function() --[[ onActivated ]] -- line: 347
					-- upvalues: v60 (copy), v57 (copy), u74 (ref), u75 (ref), t3 (ref)
					local t7 = {
						submitterUserId = tostring(v60),
						abuserUserId = v57.userId,
						reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000,
						voiceChannelId = u74,
						voiceSessionId = u75,
						voiceUserIds = t3,
						voiceUserCount = #t3
					}

					v57.openSquadVoiceAbuseReport(t7)
				end
			},
			MuteVoiceButton = {
				icon = if not v64 then v54 else v53,
				text = if not v64 then v65.muteVoiceButtonText else v65.unmuteVoiceButtonText,
				onActivated = function() --[[ onActivated ]] -- line: 365
					-- upvalues: v57 (copy), v64 (copy), default (copy)
					local num = tonumber(v57.userId)

					if num then
						if v64 then
							default:unmuteVoiceParticipant(num)

							return
						end

						default:muteVoiceParticipant(num)

						return
					end

					warn("Invalid userId: " .. tostring(v57.userId))
				end
			}
		}
		local t9 = {}

		for _, v93 in v63 do
			local v94 = t8[v93]

			if v94 then
				table.insert(t9, v94)
			end
		end

		return t9
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v57.userId, v57.openSquadVoiceAbuseReport, v65.joinButtonText, v65.removeFromGroupText, v65.reportUserText, v65.viewProfileText, v65.voiceIneligibleText, v65.muteVoiceButtonText, v65.unmuteVoiceButtonText, v60, u74, u75, t3, v69, v63, v82, v68, v64) else {
		v57.userId,
		v57.openSquadVoiceAbuseReport,
		v65.joinButtonText,
		v65.removeFromGroupText,
		v65.reportUserText,
		v65.viewProfileText,
		v65.voiceIneligibleText,
		v65.muteVoiceButtonText,
		v65.unmuteVoiceButtonText,
		v60,
		u74,
		u75,
		t3,
		v69,
		v63,
		v82,
		v68,
		v64
	})

	if #v83 > 0 then
		return if not FFlagEnableAppChatFocusableFixes then React.createElement(ModalBottomSheet, {
			bottomGap = 20,
			onDismiss = function() --[[ onDismiss ]] -- line: 569
				-- upvalues: v57 (copy)
				v57.onDismiss()
			end,
			buttonModels = v83,
			screenWidth = 400,
			showImages = true
		}) else React.createElement(FocusNavigableSurfaceWrapper, {
			customEventHandlers = {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlers.onRelease(function(p2) -- line: 546
						-- upvalues: v57 (copy)
						v57.onDismiss()
						p2:cancel()
					end)
				}
			},
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}, { React.createElement(ModalBottomSheet, {
			bottomGap = 20,
			buttonModels = v83,
			onDismiss = function() --[[ onDismiss ]] -- line: 560
				-- upvalues: v57 (copy)
				v57.onDismiss()
			end,
			screenWidth = 400,
			showImages = true
		}) })
	end

	v57.onDismiss()

	return nil
end
