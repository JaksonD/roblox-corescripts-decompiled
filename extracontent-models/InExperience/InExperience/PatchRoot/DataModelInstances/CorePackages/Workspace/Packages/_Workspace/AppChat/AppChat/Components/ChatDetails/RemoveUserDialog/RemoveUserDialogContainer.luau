local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local populateUserWithState = require(AppChat.Users.populateUserWithState)

require(AppChat.types)

local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = React.useState
local RemoveUserDialogLayout = require(script.Parent.RemoveUserDialogLayout)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	participantId = nil,
	onModalClose = function() --[[ onModalClose ]] -- line: 43
	end,
	titleKey = "Feature.Chat.Action.RemoveUser",
	messageKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.RemoveUser" or "Feature.Chat.Message.RemoveUser.V2",
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Remove",
	failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser",
	failureBodyKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.FailedToRemoveUser" or "Feature.Chat.Message.FailedToRemoveUser.V2",
	failureButtonKey = "Feature.Chat.Action.Confirm"
}

function RemoveUserDialogContainer(t2: {[any]: any}) -- line: 60
	-- upvalues: Cryo (copy), t1 (copy), useState (copy), useDispatch (copy), useCallback (copy), AppChatNetworking (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useSelector (copy), populateUserWithState (copy), useLocalization (copy), React (copy), RemoveUserDialogLayout (copy)
	local v19 = Cryo.Dictionary.join(t1, t2)
	local v20, v21 = useState(true)
	local v22, v23 = useState(false)
	local v24, v25 = useState(false)
	local v26 = useDispatch()
	local v27 = useCallback(function(p1, p2) -- line: 67
		-- upvalues: v26 (copy), AppChatNetworking (copy)
		return v26(AppChatNetworking.rodux.RemoveUserFromConversation.API(p2, p1))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v26) else { v26 })
	local v28 = useSelector(function(p3) -- line: 71
		-- upvalues: v19 (copy), populateUserWithState (copy)
		local v34 = p3.ChatAppReducer.Conversations[v19.conversationId] or {
			title = nil
		}
		local v35 = p3.Users[v19.participantId]

		return {
			conversationTitle = v34.title,
			targetUser = populateUserWithState(p3, v35)
		}
	end)
	local v29 = useCallback(function() -- line: 84
		-- upvalues: v23 (copy), v21 (copy), v19 (copy), v27 (copy), v25 (copy)
		v23(true)
		v21(false)

		local conversationId = v19.conversationId

		if conversationId then
			v27(v19.participantId, conversationId):andThen(function() -- line: 91
				-- upvalues: v19 (copy)
				v19.onModalClose()
			end):catch(function() -- line: 94
				-- upvalues: v23 (copy), v21 (copy), v25 (copy)
				v23(false)
				v21(true)
				v25(true)
			end)
		end

		return true
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19.participantId, v19.conversationId) else {
		v19.participantId,
		v19.conversationId
	})
	local v30 = useLocalization({
		titleText = v19.titleKey,
		bodyText = {
			v19.messageKey,
			USERNAME = v28.targetUser.displayName
		},
		cancelText = v19.cancelTitleKey,
		confirmText = v19.confirmationTitleKey,
		failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser",
		failureBodyText = {
			v19.failureBodyKey,
			USERNAME = v28.targetUser.displayName,
			CONVERSATION_TITLE = v28.conversationTitle
		},
		failureButtonText = "Feature.Chat.Action.Confirm"
	})

	return React.createElement(RemoveUserDialogLayout, Cryo.Dictionary.join(v19, v30, v28, {
		onActivated = v29,
		displayFailed = v24,
		isModalVisible = v20,
		isLoading = v22
	}))
end

return memo(RemoveUserDialogContainer)
