local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local SocialLibraries = require(AppChat.SocialLibraries)

require(AppChat.types)

local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffectOnMount = require(AppChatParent.RoactUtils).Hooks.useEffectOnMount
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = React.useState
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEvents = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDialogTelemetryLayer = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local ResponseIndicator = SocialLibraries.Components.ResponseIndicator
local LeaveGroupDialog = require(script.Parent.LeaveGroupDialog)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	onModalClose = function() --[[ onModalClose ]] -- line: 48
	end,
	onLeaveSuccess = function() --[[ onLeaveSuccess ]] -- line: 49
	end,
	titleKey = "Feature.Chat.Heading.LeaveGroup",
	cancelKey = "Feature.Chat.Action.Stay",
	confirmKey = "Feature.Chat.Action.Leave",
	bodyKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.LeaveGroup" or "Feature.Chat.Message.LeaveGroup.V2",
	failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup",
	failureBodyKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.FailedToLeaveGroup" or "Feature.Chat.Message.FailedToLeaveGroup.V2",
	failureButtonKey = "Feature.Chat.Action.Confirm"
}

function LeaveGroupDialogContainer(t2: {[any]: any}) -- line: 66
	-- upvalues: Cryo (copy), t1 (copy), useState (copy), useTelemetry (copy), ChatDialogTelemetryLayer (copy), useEffectOnMount (copy), ChatDetailsTelemetryEvents (copy), useDispatch (copy), useCallback (copy), AppChatNetworking (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useSelector (copy), GetFFlagIsSquadEnabled (copy), useLocalization (copy), React (copy), LeaveGroupDialog (copy), ResponseIndicator (copy)
	local v24 = Cryo.Dictionary.join(t1, t2)
	local v25, v26 = useState(true)
	local v27, v28 = useState(false)
	local v29, v30 = useState(false)
	local v31 = useTelemetry(ChatDialogTelemetryLayer.Context)

	useEffectOnMount(function() -- line: 73
		-- upvalues: v31 (copy), ChatDetailsTelemetryEvents (copy)
		v31.emit(ChatDetailsTelemetryEvents.LeaveGroupDialogRendered, {})
	end)

	local v32 = useDispatch()
	local v33 = useCallback(function(p1, p2) -- line: 78
		-- upvalues: v32 (copy), AppChatNetworking (copy)
		return v32(AppChatNetworking.rodux.RemoveUserFromConversation.API(p2, p1))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v32) else { v32 })
	local v34 = useSelector(function(p3) -- line: 82
		-- upvalues: v24 (copy), GetFFlagIsSquadEnabled (copy)
		local v41 = p3.ChatAppReducer.Conversations[v24.conversationId] or {
			title = nil,
			hasGroupUp = nil
		}

		return {
			localUserId = p3.LocalUserId,
			conversationTitle = v41.title,
			hasGroupUp = if not GetFFlagIsSquadEnabled() then nil else v41.hasGroupUp
		}
	end)
	local v35 = useCallback(function() -- line: 97
		-- upvalues: v28 (copy), v26 (copy), v31 (copy), ChatDetailsTelemetryEvents (copy), v24 (copy), v33 (copy), v34 (copy), v30 (copy)
		v28(true)
		v26(false)
		v31.emit(ChatDetailsTelemetryEvents.LeaveGroupDialogLeaveClicked, {})

		if v24.conversationId then
			v33(v34.localUserId, v24.conversationId):andThen(function() -- line: 104
				-- upvalues: v24 (copy)
				v24.onModalClose()
				v24.onLeaveSuccess()
			end):catch(function() -- line: 108
				-- upvalues: v28 (copy), v26 (copy), v30 (copy)
				v28(false)
				v26(true)
				v30(true)
			end)
		end

		return true
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v34.localUserId, v34.hasGroupUp, v24.conversationId, v33, v31) else {
		v34.localUserId,
		v34.hasGroupUp,
		v24.conversationId,
		v33,
		v31
	})
	local v36 = useCallback(function(...) -- line: 135
		-- upvalues: v31 (copy), ChatDetailsTelemetryEvents (copy), v24 (copy)
		v31.emit(ChatDetailsTelemetryEvents.LeaveGroupDialogStayClicked, {})
		v24.onModalClose(...)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v24.onModalClose, v24.conversationId, v31) else {
		v24.onModalClose,
		v24.conversationId,
		v31
	})
	local v37 = useLocalization({
		titleText = v24.titleKey,
		cancelText = v24.cancelKey,
		confirmText = v24.confirmKey,
		bodyText = v24.bodyKey,
		failureTitleText = v24.failureTitleKey,
		failureBodyText = {
			v24.failureBodyKey,
			CONVERSATION_TITLE = v34.conversationTitle
		},
		failureButtonText = v24.failureButtonKey
	})

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1
	}, {
		LeaveGroupDialog = v25 and React.createElement(LeaveGroupDialog, Cryo.Dictionary.join(v24, v37, v34, {
			onActivated = v35,
			displayFailed = v29,
			onModalClose = v36
		})),
		ResponseIndicator = v27 and React.createElement(ResponseIndicator, {
			soakAreaColor3 = Color3.fromRGB(25, 25, 25),
			soakAreaTransparency = 0.8
		})
	})
end

return memo(LeaveGroupDialogContainer)
