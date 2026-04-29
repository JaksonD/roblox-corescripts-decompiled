local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Cryo = require(AppChatParent.Cryo)
local DateTime = require(AppChatParent.Time).DateTime
local Constants = require(AppChat.Constants)
local Conversation = require(AppChat.Models.Conversation)
local v8 = require(AppChat.Logger):new(script.Name)
local useGetConversationFromId = require(AppChat.Hooks.useGetConversationFromId)
local getDeepValue2 = require(AppChat.Utils.getDeepValue2)
local useRecordModalSequenceResponseForConversation = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)
local Foundation = require(AppChatParent.Foundation)
local Dialog = Foundation.Dialog
local DialogSize = Foundation.Enums.DialogSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local BadgeVariant = Foundation.Enums.BadgeVariant
local EnumsOrientation = Foundation.Enums.Orientation
local Skeleton = Foundation.Skeleton
local EnumsRadius = Foundation.Enums.Radius
local useTokens = Foundation.Hooks.useTokens
local UserRow = require(AppChatParent.UserList).UserRow
local UserProfiles = require(AppChatParent.UserProfiles)
local useUserProfilesFetch = UserProfiles.Hooks.useUserProfilesFetch
local getCombinedNameFromId = UserProfiles.Selectors.getCombinedNameFromId
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useStore
local useEffect = React.useEffect
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local API = AppChatNetworking.rodux.GetConversationDetails.API
local API2 = AppChatNetworking.rodux.RemoveUserFromConversation.API
local RemovedConversation = require(AppChat.Conversations.Actions.RemovedConversation)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local AppTelemetryLayer = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local ConversationListOverlayTelemetry = require(AppChat.Components.OSA.ConversationListOverlayTelemetry)
local ModalTelemetry = require(AppChat.Components.ModalTelemetry)
local SquadsCore = require(AppChatParent.SquadsCore)
local SquadExternalContractContext = SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local SquadPromptType = SquadsCore.Enums.SquadPromptType
local shouldShowU13ChatOptInForConversation = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local FFlagAppChatEnableU13ChatOptIn = require(AppChatParent.SharedFlags).FFlagAppChatEnableU13ChatOptIn
local FFlagAppChatGroupOsaAnalytics = require(AppChat.Flags.FFlagAppChatGroupOsaAnalytics)
local v45 = game:DefineFastFlag("AppChatGroupOsaNavigateBeforeRecordDecline1", false)
local v46 = game:DefineFastFlag("AppChatGroupOsaPreventBlankDialog1", false)
local v47 = game:DefineFastFlag("AppChatGroupOsaPreventDuplicateSubmit1", false)
local FFlagAppChatAdjustDeclineToUseRemovedConversation = require(AppChat.Flags.FFlagAppChatAdjustDeclineToUseRemovedConversation)
local FFlagAppChatLoadInNewOSAInfo = require(AppChat.Flags.FFlagAppChatLoadInNewOSAInfo)
local FFlagAppChatLiftPostAPICallActionsUp = require(AppChatParent.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp
local FFlagAppChatUpdateConvAfterRecordModalSequence = require(AppChat.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence)
local FFlagSupportViewingUserProfileOnOSA = require(AppChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local FFlagAppChatUpdateOSAStrings = require(AppChat.Flags.FFlagAppChatUpdateOSAStrings)
local FFlagAppChatGroupOsaViewDetailsLink = require(AppChat.Flags.FFlagAppChatGroupOsaViewDetailsLink)
local FFlagAppChatHideViewDetailsNoWebview = require(AppChat.Flags.FFlagAppChatHideViewDetailsNoWebview)
local v56 = game:DefineFastString("AppChatGroupOsaViewDetailsUrl", "https://en.help.roblox.com/hc/en-us/articles/360000432483-Party-chat-In-App")
local InlineRichText = require(AppChatParent.InlineRichText)
local Renderer = InlineRichText.Renderer
local LinkBehavior = InlineRichText.Enums.LinkBehavior
local useAppPolicy = require(AppChat.Hooks.useAppPolicy)
local v61 = game.PlaceId > 0
local t1 = {
	source = nil,
	createdAt = nil,
	title = ""
}
local ConversationListOverlay = Constants.ModalSequence.ConversationListOverlay
local OsaContextCard = Constants.OptInVariant.OsaContextCard
local Accept = Constants.ModalAction.Accept
local Decline = Constants.ModalAction.Decline
local t2 = {
	dialogSize = DialogSize.Medium,
	disablePortal = false,
	hasBackdrop = true,
	onClose = function() --[[ onClose ]] -- line: 116
	end,
	onJoin = function() --[[ onJoin ]] -- line: 117
	end,
	onDecline = function() --[[ onDecline ]] -- line: 118
	end
}

return function(t3: {[any]: any}) --[[ GroupOSADialog ]] -- line: 135
	-- upvalues: Cryo (copy), t2 (copy), FFlagAppChatEnableU13ChatOptIn (copy), OsaContextCard (copy), useDispatch (copy), useStore (copy), useLocalUserId (copy), FFlagAppChatLoadInNewOSAInfo (copy), useTokens (copy), FFlagAppChatGroupOsaViewDetailsLink (copy), useAppPolicy (copy), React (copy), v61 (copy), LinkBehavior (copy), FFlagAppChatHideViewDetailsNoWebview (copy), v47 (copy), useEffect (copy), FFlagAppChatGroupOsaAnalytics (copy), useTelemetry (copy), AppTelemetryLayer (copy), ConversationListOverlayTelemetry (copy), SquadExternalContractContext (copy), useGetConversationFromId (copy), t1 (copy), shouldShowU13ChatOptInForConversation (copy), Constants (copy), API (copy), v8 (copy), useSelector (copy), getDeepValue2 (copy), AppChatNetworking (copy), useUserProfilesFetch (copy), UserProfiles (copy), DateTime (copy), getCombinedNameFromId (copy), Conversation (copy), useLocalization (copy), FFlagAppChatUpdateOSAStrings (copy), v56 (copy), UserRow (copy), Foundation (copy), BadgeVariant (copy), FFlagSupportViewingUserProfileOnOSA (copy), ModalTelemetry (copy), SquadPromptType (copy), useRecordModalSequenceResponseForConversation (copy), Accept (copy), ConversationListOverlay (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), FFlagAppChatAdjustDeclineToUseRemovedConversation (copy), API2 (copy), v45 (copy), Decline (copy), RemovedConversation (copy), Skeleton (copy), EnumsRadius (copy), Dialog (copy), Renderer (copy), v46 (copy), EnumsOrientation (copy), ButtonVariant (copy)
	local v71 = Cryo.Dictionary.union(t2, t3)
	local u72 = if not FFlagAppChatEnableU13ChatOptIn then OsaContextCard else v71.modalVariant
	local v73 = useDispatch()
	local v74 = useStore()
	local v75 = useLocalUserId()
	local v76 = if not FFlagAppChatLoadInNewOSAInfo then nil else useTokens()
	local v77 = if not FFlagAppChatGroupOsaViewDetailsLink then nil else useAppPolicy(function(p1) -- line: 147
		return p1.getWebViewSupport()
	end)
	local v78 = if not FFlagAppChatGroupOsaViewDetailsLink then nil else React.useMemo(function() -- line: 152
		-- upvalues: v77 (copy), v61 (copy), LinkBehavior (copy), FFlagAppChatHideViewDetailsNoWebview (copy)
		return {
			evaluateLinkBehavior = function(_, _) --[[ evaluateLinkBehavior ]] -- line: 154
				-- upvalues: v77 (copy), v61 (copy), LinkBehavior (copy), FFlagAppChatHideViewDetailsNoWebview (copy)
				if v77 and not v61 then
					return LinkBehavior.Webview
				end

				if FFlagAppChatHideViewDetailsNoWebview then
					return LinkBehavior.Hide
				end

				return LinkBehavior.LinkingProtocol
			end
		}
	end, { v77 })
	local v79, v80 = React.useState(false)

	if v47 then
		useEffect(function() -- line: 172
			-- upvalues: v80 (copy)
			return function() -- line: 173
				-- upvalues: v80 (copy)
				v80(false)
			end
		end, {})
	end

	local u81 = nil

	if FFlagAppChatGroupOsaAnalytics then
		u81 = useTelemetry(AppTelemetryLayer.Context)
		useEffect(function() -- line: 182
			-- upvalues: u81 (ref), ConversationListOverlayTelemetry (copy), u72 (ref), v71 (copy)
			u81.emit(ConversationListOverlayTelemetry.Events.ModalRendered, {
				modalVariant = u72,
				conversationId = v71.conversationId,
				impressionId = v71.impressionId
			})
		end, {
			v71.impressionId,
			v71.conversationId,
			u72
		})
	end

	local v82 = React.useContext(SquadExternalContractContext)
	local v83 = useGetConversationFromId(v71.conversationId)
	local v84 = v83 or t1

	if FFlagAppChatEnableU13ChatOptIn then
		local v85 = u72

		u72 = if not v85 then if not shouldShowU13ChatOptInForConversation(v84) then OsaContextCard else Constants.OptInVariant.ChatOptInInfoCard else v85
	end

	if FFlagAppChatLoadInNewOSAInfo then
		useEffect(function() -- line: 201
			-- upvalues: v71 (copy), v83 (copy), v73 (copy), API (copy), v8 (copy)
			if v71.conversationId and not v83 then
				v73(API(v71.conversationId)):catch(function(p4) -- line: 203
					-- upvalues: v8 (copy), v71 (copy)
					v8:warning("Error fetching conversation in GroupOSADialog: " .. tostring(p4))
					v71.onClose()
				end)
			end
		end, {
			v73,
			v71.conversationId
		})
	end

	local source = v84.source
	local u87 = useSelector(function(p5) -- line: 214
		-- upvalues: getDeepValue2 (copy), v71 (copy)
		return getDeepValue2(p5, `ChatAppReducer.ParticipantMetadata.{ v71.conversationId or "" }`)
	end)

	useEffect(function() -- line: 218
		-- upvalues: source (copy), v71 (copy), v73 (copy), AppChatNetworking (copy), v8 (copy)
		if source ~= "channels" or v71.conversationId == nil then
			return
		end

		v73(AppChatNetworking.rodux.GetConversationsParticipantsMetadata.API({ v71.conversationId })):catch(function() -- line: 224
			-- upvalues: v8 (copy)
			v8:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata")
		end)
	end, {
		v73,
		v71.conversationId,
		source
	})

	local v88 = if not FFlagAppChatLoadInNewOSAInfo then nil else React.useMemo(function() -- line: 230
		-- upvalues: u87 (ref)
		if not u87 then
			return nil
		end

		for v112, v113 in u87 do
			if v113.isInviter then
				return v112
			end
		end

		return nil
	end, { u87 })
	local v89 = if not FFlagAppChatLoadInNewOSAInfo then nil else useUserProfilesFetch({
		userIds = if not v88 then {} else { v88 },
		query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local v90 = React.useMemo(function() -- line: 252
		-- upvalues: v84 (copy), Cryo (copy), v75 (copy)
		if not v84 or not v84.participants then
			return {}
		end

		return Cryo.List.filter(v84.participants, function(p6) -- line: 256
			-- upvalues: v75 (copy)
			return tostring(p6) ~= v75
		end)
	end, {
		v84,
		v75
	})
	local v91 = React.useMemo(function() -- line: 262
		-- upvalues: v84 (copy), DateTime (copy), v8 (copy), v71 (copy)
		if v84.createdAt then
			return DateTime.fromIsoDate(v84.createdAt):Format("MMM DD, YYYY")
		end

		v8:warning("Conversation createdAt not found for conversationId: " .. tostring(v71.conversationId))

		return " - "
	end, {
		v84,
		v71.conversationId
	})
	local v92 = v84.title or ""
	local v93 = if not v89 then nil else v89.data
	local v94 = not not v89 and v89.loading
	local v95 = if not FFlagAppChatLoadInNewOSAInfo then nil else React.useMemo(function() -- line: 275
		-- upvalues: v88 (copy), v93 (copy), getCombinedNameFromId (copy)
		if not v88 or not v93 then
			return nil
		end

		return getCombinedNameFromId(v93, v88)
	end, {
		v88,
		v93
	})
	local v96 = v84.conversationType == Conversation.Type.MULTI_USER_CONVERSATION
	local v97 = useLocalization({
		titleText = "Feature.Chat.Heading.YouWereInvitedToGroup",
		inviterTitleText = {
			"Feature.Chat.Heading.UserInvitedYouToJoinAGroup",
			combinedName = v95 or ""
		},
		inviterTitleTextOneToOne = if not FFlagAppChatUpdateOSAStrings then nil else {
			"Feature.Chat.Heading.UserInvitedYouToJoin",
			combinedName = v95 or ""
		},
		groupCreatedOnText = {
			"Feature.Chat.Description.OSAGroupCreatedOnVariant1",
			group_name = v92,
			creation_date = v91
		},
		subtitleText = if not FFlagAppChatUpdateOSAStrings then nil else {
			"Feature.Chat.Description.ConversationInviteGroupCreatedOn",
			creation_date = v91
		},
		footerText = not FFlagAppChatGroupOsaViewDetailsLink and "Feature.Chat.Description.OSAGroupDescription" or {
			"Feature.Chat.Description.OSAGroupDescriptionWithLinker",
			osaViewDetailsUrl = v56
		},
		joinButtonText = "Feature.Chat.Action.GroupOSAJoin",
		declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin",
		blockedText = "Feature.Chat.Label.Blocked"
	})
	local v98 = React.useMemo(function() -- line: 320
		-- upvalues: v90 (copy), u87 (ref), v8 (copy), React (copy), UserRow (copy), v71 (copy), Foundation (copy), v97 (copy), BadgeVariant (copy)
		local t4 = {}

		for v115, v116 in v90 do
			local str = tostring(v116)
			local v118 = u87 and u87[str]

			if not v118 then
				v8:debug("Metadata not found for participant: " .. str)
			end

			local v119 = v118 and v118.isBlocked
			local v120 = React.createElement(UserRow, {
				entityId = str,
				layoutMode = "wide",
				onActivated = if v71.onViewUserProfile == nil then nil else function() -- line: 338
					-- upvalues: v71 (copy), str (copy)
					v71.onClose()
					v71.onViewUserProfile(str, {})
				end
			})

			t4["Participant_" .. str] = React.createElement(Foundation.View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = v115
			}, {
				Row = v120,
				Badge = v119 and React.createElement(Foundation.View, {
					tag = "auto-xy position-center-right anchor-center-right",
					ZIndex = 2
				}, {
					BadgeContent = React.createElement(Foundation.Badge, {
						text = v97.blockedText,
						variant = BadgeVariant.Warning
					})
				}) or nil
			})
		end

		return t4
	end, {
		v90,
		u87,
		v97.blockedText,
		if not FFlagSupportViewingUserProfileOnOSA then nil else v71.onViewUserProfile,
		if not FFlagSupportViewingUserProfileOnOSA then nil else v71.onClose
	})
	local v99 = if not FFlagAppChatGroupOsaAnalytics then v71.onClose else React.useCallback(function() -- line: 373
		-- upvalues: u81 (ref), ConversationListOverlayTelemetry (copy), u72 (ref), ModalTelemetry (copy), v71 (copy)
		u81.emit(ConversationListOverlayTelemetry.Events.ModalAction, {
			modalVariant = u72,
			action = ModalTelemetry.Enums.ModalActions.Dismiss,
			conversationId = v71.conversationId,
			impressionId = v71.impressionId
		})
		v71.onClose()
	end, {
		v71.onClose,
		u81,
		v71.impressionId,
		v71.conversationId,
		u72
	})
	local v100 = React.useCallback(function() -- line: 383
		-- upvalues: v82 (copy), v74 (copy), SquadPromptType (copy)
		v82.setSquadPrompt(v74, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error
		})
	end, {
		v82.setSquadPrompt,
		v74
	})
	local v101 = useRecordModalSequenceResponseForConversation(v71.conversationId)
	local v102 = React.useCallback(function() -- line: 392
		-- upvalues: v47 (copy), v79 (copy), v80 (copy), FFlagAppChatGroupOsaAnalytics (copy), u72 (ref), ModalTelemetry (copy), v71 (copy), u81 (ref), ConversationListOverlayTelemetry (copy), v101 (copy), Accept (copy), ConversationListOverlay (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), v73 (copy), API (copy), Cryo (copy), v8 (copy), v100 (copy)
		if v47 then
			if v79 then
				return
			end

			v80(true)
		end

		local t5 = nil

		if FFlagAppChatGroupOsaAnalytics then
			t5 = {
				modalVariant = u72,
				action = ModalTelemetry.Enums.ModalActions.PrimaryCta,
				conversationId = v71.conversationId,
				impressionId = v71.impressionId
			}
			u81.emit(ConversationListOverlayTelemetry.Events.ModalAction, t5)
		end

		v101(Accept, ConversationListOverlay, nil, u72):andThen(function() -- line: 411
			-- upvalues: FFlagAppChatLiftPostAPICallActionsUp (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), v71 (copy), v73 (copy), API (copy), FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t5 (ref), ModalTelemetry (copy)
			if not FFlagAppChatLiftPostAPICallActionsUp and (not FFlagAppChatUpdateConvAfterRecordModalSequence and v71.conversationId) then
				v73(API(v71.conversationId))
			end

			if FFlagAppChatGroupOsaAnalytics then
				u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t5, {
					actionResult = ModalTelemetry.Enums.ModalActionResults.Success
				}))
			end

			v71.onJoin()
		end):catch(function(p7) -- line: 429
			-- upvalues: FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t5 (ref), ModalTelemetry (copy), v8 (copy), v100 (copy), v71 (copy)
			if FFlagAppChatGroupOsaAnalytics then
				u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t5, {
					actionResult = ModalTelemetry.Enums.ModalActionResults.Failure
				}))
			end

			v8:warning(`Error in GroupOSADialog Join-> RecordModalSequenceResponse: { tostring(p7) }`)
			v100()
			v71.onClose()
		end)
	end, {
		v71.onJoin,
		v71.onClose,
		v100,
		v101,
		v73,
		v71.conversationId,
		u72,
		if not FFlagAppChatGroupOsaAnalytics then nil else u81,
		if not FFlagAppChatGroupOsaAnalytics then nil else v71.impressionId,
		if not v47 then nil else v79
	})
	local v103 = React.useCallback(function() -- line: 457
		-- upvalues: v47 (copy), v79 (copy), v80 (copy), FFlagAppChatGroupOsaAnalytics (copy), u72 (ref), ModalTelemetry (copy), v71 (copy), u81 (ref), ConversationListOverlayTelemetry (copy), FFlagAppChatAdjustDeclineToUseRemovedConversation (copy), v84 (copy), Conversation (copy), v73 (copy), API2 (copy), v75 (copy), Cryo (copy), v8 (copy), v100 (copy), v45 (copy), v101 (copy), Decline (copy), ConversationListOverlay (copy), OsaContextCard (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), RemovedConversation (copy)
		if v47 then
			if v79 then
				return
			end

			v80(true)
		end

		local t6 = nil

		if FFlagAppChatGroupOsaAnalytics then
			t6 = {
				modalVariant = u72,
				action = ModalTelemetry.Enums.ModalActions.SecondaryCta,
				conversationId = v71.conversationId,
				impressionId = v71.impressionId
			}
			u81.emit(ConversationListOverlayTelemetry.Events.ModalAction, t6)
		end

		if FFlagAppChatAdjustDeclineToUseRemovedConversation then
			if v71.conversationId then
				if v84.conversationType == Conversation.Type.MULTI_USER_CONVERSATION then
					v73(API2(v71.conversationId, v75)):andThen(function() -- line: 482
						-- upvalues: FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t6 (ref), ModalTelemetry (copy), v71 (copy)
						if FFlagAppChatGroupOsaAnalytics then
							u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t6, {
								actionResult = ModalTelemetry.Enums.ModalActionResults.Success
							}))
						end

						v71.onDecline()
					end):catch(function(p8) -- line: 493
						-- upvalues: FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t6 (ref), ModalTelemetry (copy), v8 (copy), v100 (copy), v71 (copy)
						if FFlagAppChatGroupOsaAnalytics then
							u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t6, {
								actionResult = ModalTelemetry.Enums.ModalActionResults.Failure
							}))
						end

						v8:warning(`Error in GroupOSADialog Decline -> RemoveUserFromConversation: { tostring(p8) }`)
						v100()
						v71.onClose()
					end)
				else
					if FFlagAppChatGroupOsaAnalytics then
						u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t6, {
							actionResult = ModalTelemetry.Enums.ModalActionResults.Success
						}))
					end

					v71.onDecline()
				end
			end
		else
			if v45 then
				v71.onDecline()
			end

			v101(Decline, ConversationListOverlay, nil, OsaContextCard):andThen(function() -- line: 525
				-- upvalues: FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t6 (ref), ModalTelemetry (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), v71 (copy), v73 (copy), RemovedConversation (copy), v45 (copy)
				if FFlagAppChatGroupOsaAnalytics then
					u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t6, {
						actionResult = ModalTelemetry.Enums.ModalActionResults.Success
					}))
				end

				if not FFlagAppChatLiftPostAPICallActionsUp and v71.conversationId then
					v73(RemovedConversation(v71.conversationId))
				end

				if not v45 then
					v71.onDecline()
				end
			end):catch(function(p9) -- line: 541
				-- upvalues: FFlagAppChatGroupOsaAnalytics (copy), u81 (ref), ConversationListOverlayTelemetry (copy), Cryo (copy), t6 (ref), ModalTelemetry (copy), v8 (copy), v100 (copy), v71 (copy)
				if FFlagAppChatGroupOsaAnalytics then
					u81.emit(ConversationListOverlayTelemetry.Events.ModalActionResult, Cryo.Dictionary.union(t6, {
						actionResult = ModalTelemetry.Enums.ModalActionResults.Failure
					}))
				end

				v8:warning(`Error in GroupOSADialog Decline -> RecordModalSequenceResponse: { tostring(p9) }`)
				v100()
				v71.onClose()
			end)
		end
	end, {
		v71.onDecline,
		v71.onClose,
		v100,
		if FFlagAppChatAdjustDeclineToUseRemovedConversation then nil else v101,
		v73,
		v71.conversationId,
		u72,
		v84,
		v75,
		if not FFlagAppChatGroupOsaAnalytics then nil else u81,
		if not FFlagAppChatGroupOsaAnalytics then nil else v71.impressionId,
		if not v47 then nil else v79,
		if not FFlagAppChatAdjustDeclineToUseRemovedConversation then nil else v75
	})
	local v104 = v84.source == "channels" and u87 == nil
	local v105 = v88 ~= nil and v94
	local v106 = FFlagAppChatLoadInNewOSAInfo and (not v83 or (v104 or v105))
	local v107 = if not FFlagAppChatUpdateOSAStrings or not v95 then if not v95 then v97.titleText else v97.inviterTitleText else if not v96 then v97.inviterTitleTextOneToOne else v97.inviterTitleText
	local v108 = if not FFlagAppChatLoadInNewOSAInfo then nil else React.useMemo(function() -- line: 593
		-- upvalues: React (copy), Foundation (copy), Skeleton (copy), v76 (copy), EnumsRadius (copy)
		return React.createElement(Foundation.View, {
			tag = "size-full-0 auto-y col gap-medium margin-top-small"
		}, {
			Heading = React.createElement(Skeleton, {
				Size = UDim2.new(0.6, 0, 0, v76.Size.Size_1100),
				radius = EnumsRadius.Medium,
				LayoutOrder = 1
			}),
			Row1 = React.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, v76.Size.Size_1200),
				radius = EnumsRadius.Medium,
				LayoutOrder = 2
			}),
			Row2 = React.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, v76.Size.Size_1200),
				radius = EnumsRadius.Medium,
				LayoutOrder = 3
			}),
			Row3 = React.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, v76.Size.Size_1200),
				radius = EnumsRadius.Medium,
				LayoutOrder = 4
			}),
			Footer = React.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, v76.Size.Size_800),
				radius = EnumsRadius.Medium,
				LayoutOrder = 5
			})
		})
	end, { v76 })
	local v109 = React.useMemo(function() -- line: 627
		-- upvalues: React (copy), Foundation (copy), Dialog (copy), FFlagAppChatUpdateOSAStrings (copy), v97 (copy), v98 (copy), FFlagAppChatGroupOsaViewDetailsLink (copy), Renderer (copy), v76 (copy), v78 (copy)
		return React.createElement(Foundation.View, {
			tag = "auto-y size-full-0 col gap-medium"
		}, {
			DialogContentHeader = React.createElement(Dialog.Text, {
				Text = if not FFlagAppChatUpdateOSAStrings then v97.groupCreatedOnText else v97.subtitleText,
				LayoutOrder = 1
			}),
			GroupMemberList = React.createElement(Foundation.View, {
				tag = "size-full-0 auto-y col",
				LayoutOrder = 2
			}, v98),
			DialogContentFooter = if not FFlagAppChatGroupOsaViewDetailsLink then React.createElement(Dialog.Text, {
				Text = v97.footerText,
				LayoutOrder = 3
			}) else React.createElement(Renderer, {
				text = v97.footerText,
				textStyle = v76.Color.Content.Default,
				fontStyle = v76.Typography.BodyMedium,
				linkerOptions = v78,
				wrapperProps = {
					tag = "size-full-0 auto-y",
					LayoutOrder = 3
				}
			})
		})
	end, {
		v97.groupCreatedOnText,
		v97.footerText,
		v98,
		if not FFlagAppChatUpdateOSAStrings then nil else v97.subtitleText
	})

	if v46 and not v83 then
		return nil
	end

	return React.createElement(Dialog.Root, {
		size = v71.dialogSize,
		onClose = v99,
		hasBackdrop = v71.hasBackdrop,
		disablePortal = v71.disablePortal
	}, {
		DialogTitle = not v106 and React.createElement(Dialog.Title, {
			text = v107,
			LayoutOrder = 1
		}),
		DialogContent = React.createElement(Dialog.Content, {
			LayoutOrder = 2
		}, if not v106 then v109 else v108),
		DialogActions = not v106 and React.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = EnumsOrientation.Vertical,
			actions = {
				{
					text = v97.joinButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = v102,
					isDisabled = if not v47 then nil else v79
				},
				{
					text = v97.declineButtonText,
					variant = ButtonVariant.Standard,
					onActivated = v103,
					isDisabled = if not v47 then nil else v79
				}
			}
		})
	})
end
