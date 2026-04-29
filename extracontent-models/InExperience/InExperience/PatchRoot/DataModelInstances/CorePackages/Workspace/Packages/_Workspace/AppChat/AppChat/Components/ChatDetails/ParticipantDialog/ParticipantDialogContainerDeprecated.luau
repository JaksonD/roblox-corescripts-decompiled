local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local EnumScreens = require(AppChat.EnumScreens)
local NetworkingFriends = require(AppChat.Http.NetworkingFriends)

require(AppChat.types)

local useAppPolicy = require(AppChat.Hooks.useAppPolicy)
local useIsExternalNavigationAvailable = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local Conversation = require(AppChat.Models.Conversation)
local Cryo = require(AppChatParent.Cryo)
local FocusNavigationUtils = require(AppChatParent.FocusNavigationUtils)
local InputHandlers = require(AppChatParent.InputHandlers)
local React = require(AppChatParent.React)

require(AppChatParent.ReactFocusNavigation)

local SharedFlags = require(AppChatParent.SharedFlags)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local IXPService = game:GetService("IXPService")
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local AppFocusRoot = FocusNavigationUtils.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local FFlagEnableChatDetailsOpenChat = require(AppChat.Flags.FFlagEnableChatDetailsOpenChat)
local FFlagAppChatOpenChatIxpEnabled = require(AppChat.Flags.FFlagAppChatOpenChatIxpEnabled)
local FStringAppChatOpenChatIxpLayer = require(AppChat.Flags.FStringAppChatOpenChatIxpLayer)
local memo = React.memo
local ParticipantDialogDeprecated = require(script.Parent.ParticipantDialogDeprecated)
local PlayerContextualMenuWrapper = require(script.Parent.PlayerContextualMenuWrapper)
local t1 = {
	conversationId = nil,
	participantId = nil,
	showRemoveUserButton = false,
	isWideMode = false,
	viewProfileText = "Feature.Chat.Label.ViewProfile",
	chatText = "CommonUI.Features.Label.Chat",
	reportUserText = "Feature.Chat.Action.ReportUser",
	removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
	cancelText = "Feature.Chat.Action.Cancel",
	openViewProfile = nil,
	openChat = nil,
	openReportUser = nil,
	openRemoveUserDialog = nil,
	onDismiss = function() --[[ onDismiss ]] -- line: 75
	end
}

function ParticipantDialogContainerDeprecated(t2: {[any]: any}) -- line: 79
	-- upvalues: Cryo (copy), t1 (copy), useAppPolicy (copy), FFlagEnableChatDetailsOpenChat (copy), useSelector (copy), Conversation (copy), useDispatch (copy), React (copy), NetworkingFriends (copy), FFlagAppChatOpenChatIxpEnabled (copy), IXPService (copy), FStringAppChatOpenChatIxpLayer (copy), useLocalization (copy), useIsExternalNavigationAvailable (copy), EnumScreens (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), FFlagEnableAppChatFocusableFixes (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), PlayerContextualMenuWrapper (copy), FocusNavigableSurfaceWrapper (copy), ParticipantDialogDeprecated (copy)
	local v30 = Cryo.Dictionary.join(t1, t2)
	local v31 = useAppPolicy(function(p1) -- line: 81
		return p1.getChatViewProfileOption()
	end)
	local u32 = nil
	local u33 = nil
	local u34 = nil
	local v35 = false

	if FFlagEnableChatDetailsOpenChat then
		u32 = useSelector(function(p2) -- line: 91
			-- upvalues: v30 (copy), Conversation (copy)
			local v43 = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local v44 = v43 and v43[v30.conversationId]

			return v44 and v44.conversationType == Conversation.Type.MULTI_USER_CONVERSATION
		end)
		u33 = useDispatch()
		u34 = useSelector(function(p3) -- line: 99
			-- upvalues: v30 (copy)
			local v46 = p3.ChatAppReducer and p3.ChatAppReducer.Friends
			local v47 = v46 and v46.friendshipStatus

			return v47 and v47[v30.participantId] == Enum.FriendStatus.Friend
		end)
		React.useEffect(function() -- line: 105
			-- upvalues: u32 (ref), u33 (ref), NetworkingFriends (copy), v30 (copy)
			if u32 then
				u33(NetworkingFriends.GetExtendedFriendshipStatus.API({
					targetUserId = v30.participantId
				}))
			end
		end, {
			v30.participantId,
			u33,
			u32
		})
		v35 = not not u32 and not not u34
	end

	local u36 = nil

	if FFlagEnableChatDetailsOpenChat then
		u36 = React.useRef(false)
		React.useEffect(function() -- line: 119
			-- upvalues: u36 (ref), FFlagAppChatOpenChatIxpEnabled (copy), u32 (ref), u34 (ref), IXPService (copy), FStringAppChatOpenChatIxpLayer (copy)
			if not u36.current and (FFlagAppChatOpenChatIxpEnabled and u32 and u34) then
				u36.current = true
				IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatOpenChatIxpLayer)
			end
		end, {
			u32,
			u34
		})
	end

	local v37 = useLocalization({
		viewProfileText = v30.viewProfileText,
		chatText = if not FFlagEnableChatDetailsOpenChat then nil else v30.chatText,
		reportUserText = v30.reportUserText,
		removeFromGroupText = v30.removeFromGroupText,
		cancelText = v30.cancelText
	})
	local v38 = useIsExternalNavigationAvailable({ EnumScreens.ViewUserProfile })
	local v39 = React.useMemo(function() -- line: 139
		-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), v30 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlers.onRelease(function(p4) -- line: 142
					-- upvalues: v30 (copy)
					v30.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { v30.onDismiss })
	local v40 = Cryo.Dictionary.join(v30, v37, {
		showViewProfileButton = v31,
		showChatButton = v35,
		isWideMode = v30.isWideMode
	})

	if not v38[EnumScreens.ViewUserProfile] then
		return if not FFlagEnableAppChatFocusableFixes then React.createElement(PlayerContextualMenuWrapper, {
			conversationId = v30.conversationId,
			participantId = v30.participantId,
			onDismiss = v30.onDismiss,
			openRemoveUserDialog = v30.openRemoveUserDialog,
			removeFromGroupText = v37.removeFromGroupText,
			openReportUser = v30.openReportUser,
			showRemoveUserButton = v30.showRemoveUserButton,
			openBlockingModal = v30.openBlockingModal
		}) else React.createElement(AppFocusRoot, {
			customEventHandlers = v39,
			isAutoFocusRoot = true,
			isFocusable = true,
			isIsolated = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		}, { React.createElement(PlayerContextualMenuWrapper, {
			conversationId = v30.conversationId,
			participantId = v30.participantId,
			onDismiss = v30.onDismiss,
			openRemoveUserDialog = v30.openRemoveUserDialog,
			removeFromGroupText = v37.removeFromGroupText,
			openReportUser = v30.openReportUser,
			showRemoveUserButton = v30.showRemoveUserButton,
			openBlockingModal = v30.openBlockingModal
		}) })
	end

	return if not FFlagEnableAppChatFocusableFixes then React.createElement(ParticipantDialogDeprecated, v40) else React.createElement(FocusNavigableSurfaceWrapper, {
		customEventHandlers = v39,
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, { React.createElement(ParticipantDialogDeprecated, v40) })
end

return memo(ParticipantDialogContainerDeprecated)
