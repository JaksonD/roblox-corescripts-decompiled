local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local SocialLibraries = require(AppChat.SocialLibraries)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = React.useState
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization

require(AppChatParent.ReactFocusNavigation)

local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local ResponseStatus = AppChatNetworking.Constants.ResponseStatus
local ResponseIndicator = SocialLibraries.Components.ResponseIndicator
local EditChatGroupNameDialog = require(script.Parent.EditChatGroupNameDialog)
local SharedFlags = require(AppChatParent.SharedFlags)
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local Logger = require(AppChat.Logger)
local FocusNavigationUtils = require(AppChatParent.FocusNavigationUtils)
local AppFocusRoot = FocusNavigationUtils.AppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local InputHandlers = require(AppChatParent.InputHandlers)
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local t1 = {
	Success = function() --[[ Success ]] -- line: 47
		return {
			visible = false,
			isLoading = false,
			warningTextKey = nil
		}
	end,
	Moderated = function() --[[ Moderated ]] -- line: 56
		-- upvalues: GetFFlagIsSquadEnabled (copy)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Response.ChatNameFullyModerated" or "Feature.Chat.Response.ChatNameFullyModerated.V2"
		}
	end,
	Default = function(p1, p2) --[[ Default ]] -- line: 65
		-- upvalues: GetFFlagIsSquadEnabled (copy)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = {
				not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.FailedToRenameConversation" or "Feature.Chat.Message.FailedToRenameConversation.V2",
				EXISTING_NAME = p1,
				NEW_NAME = p2
			}
		}
	end,
	Waiting = function() --[[ Waiting ]] -- line: 78
		return {
			visible = true,
			isLoading = true
		}
	end
}
local t2 = {
	onModalClose = function() --[[ onModalClose ]] -- line: 97
	end,
	titleKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.ChatGroupName" or "Feature.Chat.Label.GroupName",
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Save",
	placeholderTextKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Description.NameGroupChat" or "Feature.Chat.Description.NameGroup"
}

function EditChatGroupNameDialogContainer(t3: {[any]: any}) -- line: 108
	-- upvalues: Cryo (copy), t2 (copy), useState (copy), useDispatch (copy), useCallback (copy), AppChatNetworking (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useSelector (copy), t1 (copy), Logger (copy), ResponseStatus (copy), React (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), useLocalization (copy), ResponseIndicator (copy), EditChatGroupNameDialog (copy), FFlagEnableAppChatFocusableFixes (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local v32 = Cryo.Dictionary.join(t2, t3)
	local v33, v34 = useState({
		visible = true,
		isLoading = false
	})
	local v35 = useDispatch()
	local v36 = useCallback(function(p3, p4) -- line: 116
		-- upvalues: v35 (copy), AppChatNetworking (copy)
		return v35(AppChatNetworking.rodux.UpdateConversationTitle.API(p3, p4))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v35) else { v35 })
	local v37 = useSelector(function(p5) -- line: 120
		-- upvalues: v32 (copy)
		local conversationId = v32.conversationId
		local v46 = p5.ChatAppReducer.Conversations[conversationId]
		local s1 = ""

		if v46 and not v46.isDefaultTitle then
			s1 = v46.title
		end

		return s1
	end)
	local v38 = useCallback(function(p6) -- line: 136
		-- upvalues: v32 (copy), v34 (copy), t1 (copy), v36 (copy), Logger (copy), v37 (copy), ResponseStatus (copy)
		if v32.conversationId then
			v34(t1.Waiting())
			v36(v32.conversationId, p6.InputBox):andThen(function(p7) -- line: 140
				-- upvalues: Logger (copy), v34 (copy), t1 (copy), v37 (copy), p6 (copy), ResponseStatus (copy), v32 (copy)
				if not p7 or (not p7.responseBody or not p7.responseBody.conversations or not p7.responseBody.conversations[1]) then
					Logger.error("Conversation rename response is invalid.")
					v34(t1.Default(v37, p6.InputBox))

					return
				end

				if p7.responseBody.conversations[1].status == ResponseStatus.SUCCESS then
					v34(t1.Success())
					v32.onModalClose()

					return
				end

				if p7.responseBody and p7.responseBody.conversations[1].status == ResponseStatus.MODERATED then
					Logger.error("Conversation rename was moderated.")
					v34(t1.Moderated())

					return
				end

				Logger.error("Conversation rename request failed.")
				v34(t1.Default(v37, p6.InputBox))
			end):catch(function(_) -- line: 163
				-- upvalues: v34 (copy), t1 (copy), v37 (copy), p6 (copy)
				v34(t1.Default(v37, p6.InputBox))
			end)
		end

		return true
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v32.conversationId, v37) else {
		v32.conversationId,
		v37
	})
	local v39 = React.useMemo(function() -- line: 175
		-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), v32 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlers.onRelease(function(p9) -- line: 179
					-- upvalues: v32 (copy)
					v32.onModalClose()
					p9:cancel()
				end)
			}
		}
	end, { v32.onModalClose })
	local v40 = useLocalization({
		titleText = v32.titleKey,
		placeholderText = v32.placeholderTextKey,
		cancelText = v32.cancelTitleKey,
		confirmText = v32.confirmationTitleKey,
		warningText = v33.warningTextKey
	})
	local v41 = React.createElement(React.Fragment, nil, {
		responseIndicator = v33.isLoading and React.createElement(ResponseIndicator, {
			soakAreaColor3 = Color3.fromRGB(25, 25, 25),
			soakAreaTransparency = 0.8
		}),
		dialog = v33.visible and React.createElement(EditChatGroupNameDialog, Cryo.Dictionary.join(v32, v40, {
			onActivated = v38,
			inputText = v37,
			conversationTitle = v37
		}))
	})

	if FFlagEnableAppChatFocusableFixes then
		return (React.createElement(AppFocusRoot, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			isIsolated = true,
			isAutoFocusRoot = true,
			isFocusable = true,
			customEventHandlers = v39
		}, v41))
	end

	return v41
end

return memo(EditChatGroupNameDialogContainer)
