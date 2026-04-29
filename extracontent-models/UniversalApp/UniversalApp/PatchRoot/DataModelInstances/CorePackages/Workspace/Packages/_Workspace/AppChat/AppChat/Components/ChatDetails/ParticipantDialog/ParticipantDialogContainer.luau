local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local EnumScreens = require(AppChat.EnumScreens)

require(AppChat.types)

local useAppPolicy = require(AppChat.Hooks.useAppPolicy)
local useIsExternalNavigationAvailable = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local Conversation = require(AppChat.Models.Conversation)
local Cryo = require(AppChatParent.Cryo)
local FocusNavigationUtils = require(AppChatParent.FocusNavigationUtils)
local InputHandlers = require(AppChatParent.InputHandlers)
local NotificationModalsManager = require(AppChatParent.NotificationModalsManager)
local React = require(AppChatParent.React)

require(AppChatParent.ReactFocusNavigation)

local SharedFlags = require(AppChatParent.SharedFlags)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigation = require(AppChatParent.Navigation).useNavigation
local IXPService = game:GetService("IXPService")
local SocialCommon = require(AppChatParent.SocialCommon)
local SocialLuaAnalytics = require(AppChatParent.SocialLuaAnalytics)
local NetworkingFriends = require(AppChat.Http.NetworkingFriends)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local AppFocusRoot = FocusNavigationUtils.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local FFlagDisableBlockAndReport = SharedFlags.FFlagDisableBlockAndReport
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local FFlagTCUnifyNavigationEntry = SharedFlags.FFlagTCUnifyNavigationEntry
local FFlagEnableChatDetailsOpenChat = require(AppChat.Flags.FFlagEnableChatDetailsOpenChat)
local FFlagAppChatOpenChatIxpEnabled = require(AppChat.Flags.FFlagAppChatOpenChatIxpEnabled)
local FFlagAppChatEnableTrustedFriendEntryPoint = require(AppChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local FStringAppChatOpenChatIxpLayer = require(AppChat.Flags.FStringAppChatOpenChatIxpLayer)
local memo = React.memo
local GenericDialogType = require(script.Parent.Parent.Dialogs.GenericDialogType)
local ParticipantDialog = require(script.Parent.ParticipantDialog)
local PlayerContextualMenuWrapper = require(script.Parent.PlayerContextualMenuWrapper)
local useTrustedFriendAction = require(script.Parent.useTrustedFriendAction)
local connectAnalytics = require(AppChat.LegacyAnalytics.connectAnalytics)
local RoactChatAnalytics = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local createConversation = require(AppChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrors = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local ChatEntryPointNames = SocialCommon.Enums.ChatEntryPointNames
local EnteredChatFromEntryPoint = require(AppChat.Actions).EnteredChatFromEntryPoint
local Logger = require(script.Parent.Logger)
local Sources = SocialLuaAnalytics.Analytics.Enums.Sources
local t1 = {
	conversationId = nil,
	participantId = nil,
	anchorRef = nil,
	showRemoveUserButton = false,
	isWideMode = false,
	navigateToDialog = function() --[[ navigateToDialog ]] -- line: 85
	end,
	viewProfileText = "Feature.Chat.Label.ViewProfile",
	chatText = "CommonUI.Features.Label.Chat",
	reportUserText = "Feature.Chat.Action.ReportUser",
	removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
	onDismiss = function() --[[ onDismiss ]] -- line: 92
	end,
	openBlockingModal = nil,
	analytics = nil
}

function ParticipantDialogContainer(t2: {[any]: any}) -- line: 98
	-- upvalues: Cryo (copy), t1 (copy), useNavigation (copy), useDispatch (copy), useAppPolicy (copy), FFlagEnableChatDetailsOpenChat (copy), useSelector (copy), Conversation (copy), React (copy), NetworkingFriends (copy), FFlagAppChatOpenChatIxpEnabled (copy), IXPService (copy), FStringAppChatOpenChatIxpLayer (copy), useLocalization (copy), useIsExternalNavigationAvailable (copy), EnumScreens (copy), FFlagAppChatEnableTrustedFriendEntryPoint (copy), useTrustedFriendAction (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), Logger (copy), GenericDialogType (copy), RoactChatAnalytics (copy), NotificationModalsManager (copy), FFlagTCUnifyNavigationEntry (copy), Sources (copy), EnteredChatFromEntryPoint (copy), ChatEntryPointNames (copy), createConversation (copy), parseCreateConversationErrors (copy), FFlagDisableBlockAndReport (copy), FFlagEnableAppChatFocusableFixes (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), PlayerContextualMenuWrapper (copy), FocusNavigableSurfaceWrapper (copy), ParticipantDialog (copy)
	local v47 = Cryo.Dictionary.join(t1, t2)
	local v48 = useNavigation()
	local v49 = useDispatch()
	local v50 = v47.navigateToDialog or function() -- line: 102
	end
	local v51 = useAppPolicy(function(p1) -- line: 104
		return p1.getChatViewProfileOption()
	end)
	local u52 = nil
	local u53 = nil
	local v54 = false

	if FFlagEnableChatDetailsOpenChat then
		u52 = useSelector(function(p2) -- line: 113
			-- upvalues: v47 (copy), Conversation (copy)
			local v75 = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local v76 = v75 and v75[v47.conversationId]

			return v76 and v76.conversationType == Conversation.Type.MULTI_USER_CONVERSATION
		end)
		u53 = useSelector(function(p3) -- line: 119
			-- upvalues: v47 (copy)
			local v78 = p3.ChatAppReducer and p3.ChatAppReducer.Friends
			local v79 = v78 and v78.friendshipStatus

			return v79 and v79[v47.participantId] == Enum.FriendStatus.Friend
		end)
		React.useEffect(function() -- line: 125
			-- upvalues: u52 (ref), v49 (copy), NetworkingFriends (copy), v47 (copy)
			if u52 then
				v49(NetworkingFriends.GetExtendedFriendshipStatus.API({
					targetUserId = v47.participantId
				}))
			end
		end, {
			v47.participantId,
			v49,
			u52
		})
		v54 = not not u52 and not not u53
	end

	local u55 = nil

	if FFlagEnableChatDetailsOpenChat then
		u55 = React.useRef(false)
		React.useEffect(function() -- line: 139
			-- upvalues: u55 (ref), FFlagAppChatOpenChatIxpEnabled (copy), u52 (ref), u53 (ref), IXPService (copy), FStringAppChatOpenChatIxpLayer (copy)
			if not u55.current and (FFlagAppChatOpenChatIxpEnabled and u52 and u53) then
				u55.current = true
				IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatOpenChatIxpLayer)
			end
		end, {
			u52,
			u53
		})
	end

	local v56 = useLocalization({
		viewProfileText = v47.viewProfileText,
		chatText = if not FFlagEnableChatDetailsOpenChat then nil else v47.chatText,
		reportUserText = v47.reportUserText,
		removeFromGroupText = v47.removeFromGroupText
	})
	local v57 = useIsExternalNavigationAvailable({ EnumScreens.ViewUserProfile })[EnumScreens.ViewUserProfile]
	local u58 = nil

	if FFlagAppChatEnableTrustedFriendEntryPoint then
		u58 = useTrustedFriendAction(v47.participantId)
	end

	local v59 = if not u58 then nil else u58.action
	local v60 = not u58 and function() -- line: 167
	end or u58.refetch
	local v61 = v57 and v59 ~= nil
	local v62 = v59 ~= nil and v59.isDisabled
	local v63 = if u58 == nil then nil else u58.actionText
	local v64 = React.useMemo(function() -- line: 173
		-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), v47 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlers.onRelease(function(p4) -- line: 176
					-- upvalues: v47 (copy)
					v47.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { v47.onDismiss })
	local v65 = React.useCallback(function(p5, p6) -- line: 184
		-- upvalues: Logger (copy), v47 (copy), v50 (copy), GenericDialogType (copy)
		Logger:info("User activated removeFromGroup | userId: {}, conversationId: {}", p5, p6)
		v47.onDismiss()
		v50(GenericDialogType.RemoveUserDialog, {
			conversationId = p6,
			participantId = p5
		})
	end, {
		v47.onDismiss,
		v50
	})
	local v66 = React.useCallback(function(p7) -- line: 193
		-- upvalues: v48 (copy), EnumScreens (copy), Logger (copy), v47 (copy), RoactChatAnalytics (copy)
		local v83 = v48.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.ViewUserProfile]

		if v83 then
			Logger:info("Navigate To UserProfile from {screen}")

			if v47.analytics then
				v47.analytics:navigate(RoactChatAnalytics.NavigationEvents.ChatDetailsProfile)
			end

			v47.onDismiss()
			v83(p7, {})

			return
		end

		Logger:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
	end, {
		v48,
		v47.analytics,
		v47.onDismiss
	})
	local v67 = React.useCallback(function() -- line: 210
		-- upvalues: v59 (copy), v47 (copy), v49 (copy), NetworkingFriends (copy), v60 (copy), NotificationModalsManager (copy), u58 (ref), Logger (copy), v48 (copy), EnumScreens (copy), FFlagTCUnifyNavigationEntry (copy), Sources (copy)
		if v59 == nil then
			return
		end

		if v59.actionType == "RemoveTrustedConnection" then
			v47.onDismiss()
			v49(NetworkingFriends.RemoveTC.API(v47.participantId)):andThen(function() -- line: 218
				-- upvalues: v60 (copy), NotificationModalsManager (copy), u58 (ref)
				v60()
				NotificationModalsManager.SetUIBloxToast({
					sequenceNumber = DateTime.now().UnixTimestamp,
					toastTitle = if not u58 then nil else u58.toastText
				})
			end):catch(function(p8) -- line: 225
				-- upvalues: Logger (copy), v47 (copy)
				Logger:warning("Error removing trusted connection for userId {}: {}", v47.participantId, (tostring(p8)))
			end)

			return
		end

		local modalVariantOverride = v59.modalVariantOverride

		v47.onDismiss()

		if v59.actionType == "AddIncomingTrustedConnection" then
			local t3 = {
				userId = v47.participantId,
				onRequestAccepted = v60
			}

			v48.navigate(EnumScreens.AppChatTrustedContactsModal, if not FFlagTCUnifyNavigationEntry then t3 else {
				props = t3
			})

			return
		end

		local t4 = {
			userId = v47.participantId,
			source = Sources.ChatDetails,
			modalVariantOverride = modalVariantOverride,
			onRequestSent = v60
		}

		v48.navigate(EnumScreens.AppChatTrustedContactsModal, if not FFlagTCUnifyNavigationEntry then t4 else {
			props = t4
		})
	end, {
		v59,
		u58,
		v47.participantId,
		v47.onDismiss,
		v49,
		v60,
		v48
	})
	local v68 = React.useCallback(function(p9) -- line: 270
		-- upvalues: Logger (copy), v49 (copy), EnteredChatFromEntryPoint (copy), ChatEntryPointNames (copy), v47 (copy), createConversation (copy), v48 (copy), EnumScreens (copy), parseCreateConversationErrors (copy)
		Logger:info("User activated openChat | userId: {}", p9)
		v49(EnteredChatFromEntryPoint(ChatEntryPointNames.ChatDetailsParticipantDialog))
		v47.onDismiss()
		v49(createConversation("one_to_one", { (tostring(p9)) })):andThen(function(p10) -- line: 275
			-- upvalues: v48 (copy), EnumScreens (copy)
			v48.navigate(EnumScreens.ChatConversation, {
				conversationId = p10.id
			})
		end):catch(function(p11) -- line: 280
			-- upvalues: Logger (copy), p9 (copy), parseCreateConversationErrors (copy), v48 (copy), EnumScreens (copy)
			Logger:warning("Error creating 1:1 conversation for userId {}: {}", p9, (tostring(p11)))

			local v96 = parseCreateConversationErrors(p11) ~= "participant_chat_disabled" and "Feature.Toast.NetworkingError.SomethingIsWrong" or "Feature.Chat.Message.PartyUnavailableWithUser"

			v48.navigate(EnumScreens.RoactChatToast, {
				toastProps = {
					toastContent = {
						toastTitle = v96
					}
				}
			})
		end)
	end, {
		v49,
		v48,
		v47.onDismiss
	})
	local v69 = React.useCallback(function(p12, p13) -- line: 295
		-- upvalues: v47 (copy), v48 (copy), EnumScreens (copy)
		v47.onDismiss()
		v48.navigate(EnumScreens.AppChatReportAbuse, {
			participantId = p12,
			conversationId = p13
		})
	end, {
		v48,
		v47.onDismiss
	})
	local v70 = React.useCallback(function(p14, p15) -- line: 303
		-- upvalues: v48 (copy), EnumScreens (copy), v47 (copy), FFlagDisableBlockAndReport (copy)
		v47.onDismiss()
		v48.navigate(EnumScreens.BlockingModal, {
			navProps = {
				userId = p14,
				openReportUser = function() -- line: 304
					-- upvalues: v48 (copy), EnumScreens (copy), p14 (copy), p15 (copy)
					v48.pop()
					v48.navigate(EnumScreens.AppChatReportAbuse, {
						participantId = p14,
						conversationId = p15
					})
				end,
				disableReportOption = FFlagDisableBlockAndReport
			}
		})
	end, {
		v48,
		v47.onDismiss
	})
	local v71 = Cryo.Dictionary.join(v47, v56, {
		showViewProfileButton = v51,
		showChatButton = v54,
		showTrustedFriendButton = v61,
		trustedFriendText = v63,
		isTrustedFriendButtonDisabled = v62,
		openViewProfile = v66,
		openTrustedFriend = v67,
		openChat = if not FFlagEnableChatDetailsOpenChat then nil else v68,
		openReportUser = v69,
		openRemoveUserDialog = v65
	})

	if not v57 then
		return if not FFlagEnableAppChatFocusableFixes then React.createElement(PlayerContextualMenuWrapper, {
			conversationId = v47.conversationId,
			participantId = v47.participantId,
			onDismiss = v47.onDismiss,
			openRemoveUserDialog = v65,
			removeFromGroupText = v56.removeFromGroupText,
			openReportUser = v69,
			showRemoveUserButton = v47.showRemoveUserButton,
			openBlockingModal = if not v47.openBlockingModal then v70 else v47.openBlockingModal
		}) else React.createElement(AppFocusRoot, {
			customEventHandlers = v64,
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}, { React.createElement(PlayerContextualMenuWrapper, {
			conversationId = v47.conversationId,
			participantId = v47.participantId,
			onDismiss = v47.onDismiss,
			openRemoveUserDialog = v65,
			removeFromGroupText = v56.removeFromGroupText,
			openReportUser = v69,
			showRemoveUserButton = v47.showRemoveUserButton,
			openBlockingModal = if not v47.openBlockingModal then v70 else v47.openBlockingModal
		}) })
	end

	return if not FFlagEnableAppChatFocusableFixes then React.createElement(ParticipantDialog, v71) else React.createElement(FocusNavigableSurfaceWrapper, {
		customEventHandlers = v64,
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, { React.createElement(ParticipantDialog, v71) })
end

ParticipantDialogContainer = connectAnalytics(function(p16) -- line: 381
	return {
		analytics = p16
	}
end)(ParticipantDialogContainer)

return memo(ParticipantDialogContainer)
