local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local UIBlox = require(AppChatParent.UIBlox)
local Promise = require(AppChatParent.Promise)
local getDeepValue = require(AppChat.Utils.getDeepValue)
local UserProfiles = require(AppChatParent.UserProfiles)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = React.useEffect
local useEffectOnMount = require(AppChatParent.RoactUtils).Hooks.useEffectOnMount
local useIsGroupChatEnabled = require(AppChat.Hooks.useIsGroupChatEnabled)
local useState = React.useState
local useStyle = UIBlox.Core.Style.useStyle
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local Conversation = require(AppChat.Models.Conversation)
local ConversationChannels = require(AppChat.Models.ConversationChannels)
local useUserProfilesFetch = UserProfiles.Hooks.useUserProfilesFetch
local userProfilesCombinedNameAndUsernameByUserIds = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
local useIsUserPending = require(AppChat.Hooks.useIsUserPending)
local getConversationDisplayTitle = require(AppChat.SocialLibraries).Conversation.getConversationDisplayTitle
local LuaAppNavigationContext = require(AppChat.LuaAppNavigationContext)
local useNavigation = require(AppChatParent.Navigation).useNavigation
local useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled)
local getConversationTitle = require(AppChat.Conversations.getConversationTitle)
local FFlagAppChatRemoveUserProfileTitles = require(AppChat.Flags.FFlagAppChatRemoveUserProfileTitles)
local selectChatUserEntryModelList = require(script.Parent.Selectors.selectChatUserEntryModelList)
local ParticipantDialogContainer = require(script.Parent.ParticipantDialog.ParticipantDialogContainer)
local ChatDetailsPage = require(script.Parent.ChatDetailsPage)
local GenericDialogType = require(script.Parent.Dialogs.GenericDialogType)
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryLayer = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryEvents = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatConversationTelemetryState = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local ChatDetailsTelemetryState = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local FFlagConnectionsToFriendsRename = require(AppChatParent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagAppChatAlwaysDisplayUserCardsInChatDetails = require(AppChat.Flags.FFlagAppChatAlwaysDisplayUserCardsInChatDetails)
local getFFlagAppChatParticipantDialogFoundationMenu = require(AppChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	topBarHeight = 0,
	wideMode = false,
	participants = nil,
	isGroupConversation = nil,
	isGroupOwner = nil,
	conversationId = nil,
	conversation = nil,
	navigateBack = function() --[[ navigateBack ]] -- line: 69
	end,
	navigateToEditChatMembers = function() --[[ navigateToEditChatMembers ]] -- line: 70
	end,
	navigateToDialog = function() --[[ navigateToDialog ]] -- line: 71
	end,
	navigateToToast = function() --[[ navigateToToast ]] -- line: 72
	end,
	navigateToConversation = function() --[[ navigateToConversation ]] -- line: 73
	end,
	navigateToChatLanding = function() --[[ navigateToChatLanding ]] -- line: 74
	end
}

return function(p1) -- line: 77
	-- upvalues: Cryo (copy), t1 (copy), getFFlagAppChatParticipantDialogFoundationMenu (copy), useStyle (copy), useLocalization (copy), GetFFlagIsSquadEnabled (copy), FFlagConnectionsToFriendsRename (copy), React (copy), LuaAppNavigationContext (copy), useDispatch (copy), useState (copy), useNavigation (copy), useIsGroupChatEnabled (copy), useIsChatEnabled (copy), useEffect (copy), useSelector (copy), getDeepValue (copy), Conversation (copy), AppChatNetworking (copy), useUserProfilesFetch (copy), userProfilesCombinedNameAndUsernameByUserIds (copy), useTelemetry (copy), ChatDetailsTelemetryLayer (copy), FFlagAppChatAlwaysDisplayUserCardsInChatDetails (copy), selectChatUserEntryModelList (copy), FFlagAppChatRemoveUserProfileTitles (copy), getConversationTitle (copy), getConversationDisplayTitle (copy), useIsUserPending (copy), ConversationChannels (copy), Promise (copy), GenericDialogType (copy), ChatDetailsTelemetryEvents (copy), useCallback (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), ChatConversationTelemetryState (copy), ChatDetailsTelemetryState (copy), useEffectOnMount (copy), FFlagEnableAppChatFocusableFixes (copy), ChatDetailsPage (copy), ParticipantDialogContainer (copy)
	local v48 = Cryo.Dictionary.join(t1, p1 or {})
	local v49 = getFFlagAppChatParticipantDialogFoundationMenu()
	local v50 = useStyle()
	local v51 = useLocalization({
		pageHeaderText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.ChatDetails" or "Feature.Chat.Label.Details",
		generalText = "Feature.Chat.Label.General",
		titleNotSetText = "Feature.Chat.Label.NotSet",
		membersText = "Feature.Chat.Label.Members",
		addFriendsText = not FFlagConnectionsToFriendsRename and "Feature.Chat.Label.AddConnections" or "Feature.Chat.Label.AddFriends",
		leaveGroupText = "Feature.Chat.Heading.LeaveGroup",
		chatGroupText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.ChatGroupName" or "Feature.Chat.Label.GroupName",
		onlinePresenceText = "Common.Presence.Label.Online",
		offlinePresenceText = "Common.Presence.Label.Offline",
		tooManyPeopleText = {
			if not GetFFlagIsSquadEnabled() then not FFlagConnectionsToFriendsRename and "Feature.Chat.Message.AddConnectionsLimit" or "Feature.Chat.Message.AddFriendsLimit" else not FFlagConnectionsToFriendsRename and "Feature.Chat.Message.AddConnectionsPartyLimit" or "Feature.Chat.Message.AddFriendsPartyLimit",
			friendNum = 5,
			connectionsNum = 5
		},
		networkErrorToastText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		conversationTypeHeaderText = "Feature.Chat.Label.ExpandedChatFeatures",
		enabledText = "Feature.Chat.Label.Available",
		disabledText = "Feature.Chat.Label.Unavailable",
		createUnfilteredChatText = "Feature.Chat.Label.CreateUnfilteredChat",
		createUnfilteredChatSubtitleText = "Feature.Chat.Description.CreateUnfilteredChatCell"
	})
	local v52 = React.useContext(LuaAppNavigationContext)
	local v53 = useDispatch()
	local v54, v55 = useState(false)
	local u56 = nil
	local u57 = nil
	local v58 = nil
	local u59 = nil

	if v49 then
		local v60, v61 = useState(nil)

		u56 = v60
		u57 = v61

		local v62

		v58, v62 = useState(nil)
		u59 = v62
	end

	local v63 = useNavigation()
	local v64 = useIsGroupChatEnabled()
	local v65 = useIsChatEnabled()

	useEffect(function() -- line: 130
		-- upvalues: v65 (copy), v48 (copy)
		if not v65 then
			v48.navigateToChatLanding()
		end
	end, {
		v65,
		v48.navigateToChatLanding
	})

	local v66 = useSelector(function(p2) -- line: 136
		-- upvalues: getDeepValue (copy), v48 (copy), Conversation (copy)
		return getDeepValue(p2, `ChatAppReducer.Conversations.{ v48.conversationId or "" }`) or Conversation.empty()
	end)
	local v67 = useSelector(function(p3) -- line: 140
		-- upvalues: getDeepValue (copy), v48 (copy)
		return getDeepValue(p3, `ChatAppReducer.ParticipantMetadata.{ v48.conversationId or "" }`)
	end)
	local v68 = v66 and v66.source

	useEffect(function() -- line: 145
		-- upvalues: v68 (copy), v53 (copy), AppChatNetworking (copy), v48 (copy)
		if v68 ~= "channels" then
			return
		end

		v53(AppChatNetworking.rodux.GetConversationsParticipantsMetadata.API({ v48.conversationId })):catch(function() -- line: 151
			warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata")
		end)
	end, {
		v48.conversationId,
		v48.participants,
		v68
	})

	local v69 = useUserProfilesFetch({
		userIds = v66.participants,
		query = userProfilesCombinedNameAndUsernameByUserIds
	})
	local v70 = useTelemetry(ChatDetailsTelemetryLayer.Context)
	local v71 = nil
	local u72 = nil
	local u73 = nil
	local v74 = nil
	local v75 = nil
	local u76 = nil
	local v77 = nil

	if v66 then
		v71 = useSelector(function(p4) -- line: 170
			-- upvalues: FFlagAppChatAlwaysDisplayUserCardsInChatDetails (copy), selectChatUserEntryModelList (copy), v66 (copy), v69 (copy)
			if FFlagAppChatAlwaysDisplayUserCardsInChatDetails then
				return selectChatUserEntryModelList(p4, v66.participants, if not v69 or not v69.data then nil else v69.data.userProfiles)
			end

			if v69.data then
				return selectChatUserEntryModelList(p4, v66.participants, v69.data.userProfiles)
			end

			return {}
		end)
		u73 = v66.conversationType == Conversation.Type.MULTI_USER_CONVERSATION
		u72 = useSelector(function(p5) -- line: 190
			-- upvalues: u73 (ref), v66 (copy)
			return u73 and v66.initiator == p5.LocalUserId
		end)
		v74 = if not FFlagAppChatRemoveUserProfileTitles then getConversationDisplayTitle(v66) else getConversationTitle(v66)

		if v67 then
			for v78, v79 in v71 do
				v71[v78] = Cryo.Dictionary.join(v79, {
					metadata = v67[v78]
				})
			end
		end

		u76 = useIsUserPending(v66)
		v75 = u73 and u76

		if v75 then
			v64 = false
		end

		v77 = v66.moderationType == ConversationChannels.ModerationType.TrustedComms
	end

	local v80 = v71 and #v71 or 0
	local v81 = if not v77 then v51.disabledText else v51.enabledText

	if v66.isDefaultTitle then
		v74 = v51.titleNotSetText
	end

	local v82 = useCallback(function() -- line: 242
		-- upvalues: v63 (copy), v52 (copy)
		if v63 then
			v52.navigateToUnfilteredThreadsLearnMore(v63.navigate)

			return
		end

		v52.navigateToUnfilteredThreadsLearnMore()
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v52, v63) else {
		v52,
		v63
	})
	local v83 = useCallback(function() -- line: 254
		-- upvalues: v70 (copy), ChatDetailsTelemetryEvents (copy), v55 (copy), v53 (copy), AppChatNetworking (copy), v48 (copy), v51 (copy)
		v70.emit(ChatDetailsTelemetryEvents.ChatDetailsCreateUnfilteredChatCellClicked, {})
		v55(true)
		v53(AppChatNetworking.rodux.DuplicateConversation.API(v48.conversationId, "trusted_comms")):andThen(function(p6) -- line: 258
			-- upvalues: v48 (copy), v51 (copy)
			local responseBody = p6.responseBody
			local v106 = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))

			if v106 then
				v48.navigateToConversation(v106)

				return
			end

			v48.navigateToToast({
				toastProps = {
					toastContent = {
						toastTitle = v51.networkErrorToastText
					}
				}
			})
		end):catch(function() -- line: 276
			-- upvalues: v48 (copy), v51 (copy)
			v48.navigateToToast({
				toastProps = {
					toastContent = {
						toastTitle = v51.networkErrorToastText
					}
				}
			})
		end):finally(function() -- line: 285
			-- upvalues: v55 (copy)
			v55(false)
		end)
	end, {
		v53,
		v55,
		v48.navigateToToast,
		v48.navigateToConversation,
		v48.conversationId,
		v80,
		u72,
		v70
	})

	local function v84(p7) -- line: 328
		-- upvalues: v48 (copy)
		v48.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = p7
				}
			}
		})
	end
	local function v85(p8) -- line: 338
		-- upvalues: v66 (copy), Promise (copy), v48 (copy), v84 (copy), v70 (copy), ChatDetailsTelemetryEvents (copy)
		local v101 = v66

		Promise.new(function(p9, p10) -- line: 220
			-- upvalues: v101 (copy)
			if #v101.participants > 5 then
				p10()

				return
			end

			p9()
		end):andThen(function() -- line: 339
			-- upvalues: v48 (copy), v66 (copy)
			v48.navigateToEditChatMembers(v66)
		end, function() -- line: 342
			-- upvalues: v84 (copy), p8 (copy)
			v84(p8)
		end)
		v70.emit(ChatDetailsTelemetryEvents.ChatDetailsAddFriendsBtnClicked, {})
	end

	local v86 = v66 and v66.moderationType or Cryo.None
	local v87 = v66 and v66.userPendingStatus or Cryo.None
	local v88 = ChatConversationTelemetryState.useMergeState()

	useEffect(function() -- line: 352
		-- upvalues: v88 (copy), v48 (copy), v86 (copy), v87 (copy)
		v88({
			conversationId = v48.conversationId,
			moderationType = v86,
			userPendingStatus = v87
		})
	end, {
		v48.conversationId,
		v86,
		v87
	})

	local v89 = ChatDetailsTelemetryState.useMergeState()

	useEffect(function() -- line: 360
		-- upvalues: v89 (copy), v66 (copy), u72 (ref)
		v89({
			participantsCount = #v66.participants,
			isGroupOwner = u72
		})
	end, {
		#v66.participants,
		u72
	})
	useEffectOnMount(function() -- line: 367
		-- upvalues: v70 (copy), ChatDetailsTelemetryEvents (copy), u73 (ref)
		v70.emit(ChatDetailsTelemetryEvents.ScreenRendered, {
			isGroupConversation = u73
		})
	end)

	local v90 = Cryo.Dictionary.join({
		navigateBack = v48.navigateBack,
		onGroupNameEntryCellActivated = function() -- line: 230
			-- upvalues: v48 (copy), GenericDialogType (copy)
			v48.navigateToDialog(GenericDialogType.EditChatGroupNameDialog, {
				conversationId = v48.conversationId
			})
		end,
		onLeaveGroupCellActivated = function() -- line: 235
			-- upvalues: v48 (copy), GenericDialogType (copy), v70 (copy), ChatDetailsTelemetryEvents (copy)
			v48.navigateToDialog(GenericDialogType.LeaveGroupDialog, {
				conversationId = v48.conversationId
			})
			v70.emit(ChatDetailsTelemetryEvents.ChatDetailsLeaveGroupBtnClicked, {})
		end,
		onParticipantCellActivated = function(p11, p12) -- line: 308
			-- upvalues: v49 (copy), u57 (ref), u59 (ref), u56 (ref), v48 (copy), GenericDialogType (copy), u76 (ref), u73 (ref), u72 (ref)
			local str = tostring(p11)

			if v49 and u57 and u59 then
				if str == u56 then
					if u57 and u59 then
						u57(nil)
						u59(nil)

						return
					end
				else
					u57(str)
					u59(p12)
				end

				return
			end

			v48.navigateToDialog(GenericDialogType.ParticipantDialog, {
				conversationId = v48.conversationId,
				participantId = str,
				showRemoveUserButton = not u76 and (u73 and u72)
			})
		end,
		onAddFriendsCellActivated = function() --[[ onAddFriendsCellActivated ]] -- line: 378
			-- upvalues: v85 (copy), v51 (copy)
			return v85(v51.tooManyPeopleText)
		end,
		onConversationTypeIconActivated = v82,
		onCreateUnfilteredChatCellActivated = v83,
		conversationTitle = v74,
		conversation = v66,
		conversationId = v48.conversationId,
		participants = v71,
		isGroupConversation = u73,
		wideMode = v48.wideMode,
		shouldHideGroupChatFunctionality = v75,
		shouldShowAddFriends = v64,
		shouldShowCreateUnfilteredChat = false,
		conversationTypeText = v81,
		isCreateUnfilteredChatLoading = v54,
		topBarHeight = v48.topBarHeight,
		LayoutOrder = 2,
		style = v50
	}, v51)

	if v49 then
		v90.activeParticipantId = u56
	end

	return React.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Selectable = not FFlagEnableAppChatFocusableFixes and nil
	}, {
		ChatDetailsPage = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Content = React.createElement(ChatDetailsPage, v90)
		}),
		ParticipantDialog = if not v49 or u56 == nil then nil else React.createElement(ParticipantDialogContainer, {
			anchorRef = v58,
			conversationId = v48.conversationId,
			isWideMode = v48.wideMode,
			navigateToDialog = v48.navigateToDialog,
			onDismiss = function() -- line: 301
				-- upvalues: u57 (ref), u59 (ref)
				if u57 and u59 then
					u57(nil)
					u59(nil)
				end
			end,
			participantId = u56,
			showRemoveUserButton = not u76 and (u73 and u72)
		})
	})
end
