local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local SocialLibraries = require(AppChat.SocialLibraries)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local Promise = require(AppChatParent.Promise)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = React.useEffect
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = React.useState
local useRef = React.useRef
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local createConversation = require(AppChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrors = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local expandToGroupConversation = require(AppChat.Conversations.Thunks.expandToGroupConversation)
local useAnalytics = require(AppChat.Analytics.useAnalytics)
local ResponseIndicator = SocialLibraries.Components.ResponseIndicator
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local SelectChatMembersContainer = require(AppChat.Components.SelectChatMembers.SelectChatMembersContainer)
local Conversation = require(AppChat.Models.Conversation)

require(AppChat.Models.ConversationChannels)

local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	systemButtonText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Action.StartChatWithFriends" or "Feature.Chat.Action.Create",
	pageHeaderText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Heading.ChatWithConnections" or "Feature.Chat.Heading.PartyWithConnections",
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	topBarHeight = nil,
	conversation = nil,
	setSystemButtonActivated = function(_) --[[ setSystemButtonActivated ]] -- line: 73
	end,
	setSystemButtonEnabled = function(_) --[[ setSystemButtonEnabled ]] -- line: 74
	end
}

return memo(function(t2: {[any]: any}) --[[ EditChatMembersContainer ]] -- line: 78
	-- upvalues: Cryo (copy), t1 (copy), useRef (copy), useState (copy), useAnalytics (copy), useSelector (copy), useCallback (copy), useDispatch (copy), AppChatNetworking (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), createConversation (copy), Promise (copy), parseCreateConversationErrors (copy), Conversation (copy), expandToGroupConversation (copy), useEffect (copy), React (copy), ResponseIndicator (copy), SelectChatMembersContainer (copy)
	local v29 = Cryo.Dictionary.join(t1, t2)
	local v30 = useRef({})
	local v31 = useRef(false)
	local v32, v33 = useState(false)
	local v34 = useAnalytics()
	local v35 = useSelector(useCallback(function(p3) -- line: 85
		return p3.LocalUserId
	end, {}))
	local v36 = useDispatch()
	local v37 = useCallback(function(p4, p5) -- line: 91
		-- upvalues: v36 (copy), AppChatNetworking (copy)
		return v36(AppChatNetworking.rodux.AddUserToConversation.API(p5, p4))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v36) else { v36 })
	local v38 = useCallback(function(p6) -- line: 95
		-- upvalues: v36 (copy), createConversation (copy), v34 (copy)
		return v36(createConversation("group", p6, v34, "userAddedParticipantToOneToOne"))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v36) else { v36 })
	local v39 = useCallback(function(p7) -- line: 102
		-- upvalues: v29 (copy)
		v29.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = p7
				}
			}
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v29.navigateToToast) else { v29.navigateToToast })
	local v40 = useCallback(function(p8) -- line: 128
		-- upvalues: v32 (copy), Promise (copy), v29 (copy), parseCreateConversationErrors (copy), v39 (copy), v33 (copy), Conversation (copy), v37 (copy), v30 (copy), Cryo (copy), v35 (copy), v36 (copy), expandToGroupConversation (copy), v34 (copy), v38 (copy)
		if v32 then
			return Promise.resolve()
		end

		local id = v29.conversation.id
		local conversationType = v29.conversation.conversationType

		local function v52(p9) -- line: 134
			-- upvalues: parseCreateConversationErrors (copy), p8 (copy), v39 (copy), v33 (copy)
			local v58 = if parseCreateConversationErrors(p9) ~= "participant_chat_disabled" then p8.networkErrorText else p8.invalidParticipantText

			v39(v58)
			v33(false)
		end

		v33(true)

		if conversationType == Conversation.Type.MULTI_USER_CONVERSATION then
			return v37(v30.current, id):andThen(function() -- line: 146
				-- upvalues: v29 (copy), id (copy)
				v29.navigateToConversation(id)
			end, v52)
		end

		if conversationType == Conversation.Type.ONE_TO_ONE_CONVERSATION then
			local v53 = Cryo.List.filter(Cryo.List.join(v30.current, v29.conversation.participants), function(p10) -- line: 152
				-- upvalues: v35 (copy)
				return p10 ~= v35
			end)

			if v29.conversation.source == "channels" or v29.conversation.source == "chat" then
				return v36(expandToGroupConversation(id, v53, v34)):andThen(function(p11) -- line: 160
					-- upvalues: v29 (copy)
					v29.navigateToConversation(p11.id)
				end, v52)
			end

			return v38(v53):andThen(function(p12) -- line: 164
				-- upvalues: v29 (copy)
				v29.navigateToConversation(p12.id)
			end, v52)
		end

		local t3 = {
			Body = "conversationType not supported",
			StatusCode = 400
		}
		local v55 = if parseCreateConversationErrors(t3) ~= "participant_chat_disabled" then p8.networkErrorText else p8.invalidParticipantText

		v39(v55)
		v33(false)

		return Promise.reject(string.format("conversationType not supported: %q", (tostring(conversationType))))
	end, {
		v36,
		v32,
		v33,
		v30,
		v29.navigateToConversation,
		v29.conversation.id,
		v29.conversation.conversationType,
		v29.conversation.participants,
		v29.conversation.source,
		v39,
		v34
	})

	useEffect(function() -- line: 190
		-- upvalues: v29 (copy), v40 (copy)
		v29.setSystemButtonActivated(v40)
	end, {
		v29.setSystemButtonActivated,
		v40
	})

	return React.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false
	}, {
		responseIndicator = v32 and React.createElement(ResponseIndicator, {
			soakAreaColor3 = Color3.fromRGB(25, 25, 25),
			soakAreaTransparency = 0.8
		}),
		selectChatMembers = React.createElement(SelectChatMembersContainer, Cryo.Dictionary.join(v29, {
			maxSelections = v29.maxSelections - #v29.conversation.participants + 1,
			selectedUsersChanged = function(p13, p14) -- line: 116
				-- upvalues: v30 (copy), Cryo (copy), v31 (copy), v29 (copy)
				v30.current = Cryo.List.map(p13, function(p15) -- line: 117
					return p15.id
				end)

				local v48 = p14 <= #p13

				if v48 ~= v31.current then
					v31.current = v48
					v29.setSystemButtonEnabled(v48)
				end
			end,
			localUserId = v35
		}))
	})
end)
