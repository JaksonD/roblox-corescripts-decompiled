local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local Promise = require(AppChatParent.Promise)
local useCallback = React.useCallback
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = React.useEffect
local useIsGroupChatEnabled = require(AppChat.Hooks.useIsGroupChatEnabled)
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local useState = React.useState
local useRef = React.useRef
local AppNavBar = require(AppChatParent.AppNavBar)
local Conversation = require(AppChat.Models.Conversation)

require(AppChat.Models.ConversationChannels)

local createConversation = require(AppChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrors = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local SelectChatMembersContainer = require(AppChat.Components.SelectChatMembers.SelectChatMembersContainer)
local EventNames = require(AppChat.Analytics.EventNames)
local useAnalytics = require(AppChat.Analytics.useAnalytics)
local CreateConversationError = require(AppChat.Analytics.Enums.CreateConversationError)
local SharedFlags = require(AppChatParent.SharedFlags)
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagAppIaScrollAwayFixSocial = SharedFlags.FFlagAppIaScrollAwayFixSocial
local GetFFlagIsSquadEnabled = SharedFlags.GetFFlagIsSquadEnabled
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local t1 = {
	systemButtonText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Action.StartChatWithFriends" or "Feature.Chat.Action.Create",
	pageHeaderText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Heading.ChatWithConnections" or (not FFlagConnectionsToFriendsRename and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.PartyWithFriends"),
	topBarHeight = nil,
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	conversation = Conversation.empty(),
	setSystemButtonActivated = function(_) --[[ setSystemButtonActivated ]] -- line: 81
	end,
	setSystemButtonEnabled = function(_) --[[ setSystemButtonEnabled ]] -- line: 82
	end
}

function CreateNewChatContainer(t2: {[any]: any}) -- line: 86
	-- upvalues: Cryo (copy), t1 (copy), useRef (copy), useState (copy), FFlagAppIaScrollAway (copy), FFlagAppIaScrollAwayFixSocial (copy), useIsInExperience (copy), useIsGroupChatEnabled (copy), useDispatch (copy), useCallback (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useAnalytics (copy), Promise (copy), createConversation (copy), parseCreateConversationErrors (copy), EventNames (copy), CreateConversationError (copy), useEffect (copy), React (copy), AppNavBar (copy), ResponseIndicator (copy), SelectChatMembersContainer (copy)
	local v34 = Cryo.Dictionary.join(t1, t2)
	local v35 = useRef({})
	local v36 = useRef(false)
	local v37, v38 = useState(false)
	local v39 = if not FFlagAppIaScrollAway or FFlagAppIaScrollAwayFixSocial then nil else useIsInExperience()
	local maxSelections = v34.maxSelections
	local maxConversationSize = v34.maxConversationSize
	local v42 = false

	if not useIsGroupChatEnabled() then
		maxSelections = 1
		maxConversationSize = 1
		v42 = true
	end

	local v43 = useDispatch()
	local v44 = useCallback(function(p3) -- line: 108
		-- upvalues: v34 (copy)
		v34.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = p3
				}
			}
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v34.navigateToToast) else { v34.navigateToToast })
	local v45 = useAnalytics()
	local v46 = useCallback(function(p4) -- line: 136
		-- upvalues: v37 (copy), v35 (copy), Promise (copy), v38 (copy), v43 (copy), createConversation (copy), v45 (copy), v34 (copy), parseCreateConversationErrors (copy), v44 (copy), EventNames (copy), CreateConversationError (copy)
		if v37 or not v35.current then
			return Promise.resolve()
		end

		v38(true)

		local v52 = #v35.current ~= 1 and "group" or "one_to_one"

		return v43(createConversation(v52, v35.current, v45, "userCreatedNewConversation")):andThen(function(p5) -- line: 157
			-- upvalues: v34 (copy)
			v34.navigateToConversation(p5.id)
		end):catch(function(p6) -- line: 161
			-- upvalues: parseCreateConversationErrors (copy), p4 (copy), v44 (copy), v38 (copy), v45 (copy), EventNames (copy), CreateConversationError (copy)
			local v56 = if parseCreateConversationErrors(p6) ~= "participant_chat_disabled" then p4.networkErrorText else p4.invalidParticipantText

			v44(v56)
			v38(false)

			if v45 then
				v45.fireAnalyticsEvent(EventNames.NewConversationCreated, {
					createConversationResult = CreateConversationError.FetchConversationError
				})
			end
		end)
	end, {
		v43,
		v37,
		v38,
		v35,
		v34.navigateToConversation,
		v44,
		v45
	})

	useEffect(function() -- line: 191
		-- upvalues: v34 (copy), v46 (copy)
		v34.setSystemButtonActivated(v46)
	end, {
		v34.setSystemButtonActivated,
		v46
	})

	return React.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false
	}, {
		UIPadding = if not FFlagAppIaScrollAway or (FFlagAppIaScrollAwayFixSocial or (v39 or (not AppNavBar.getScrollAwayEnabled() or v34.topBarHeight == nil))) then nil else React.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v34.topBarHeight)
		}),
		responseIndicator = v37 and React.createElement(ResponseIndicator, {
			soakAreaColor3 = Color3.fromRGB(25, 25, 25),
			soakAreaTransparency = 0.8
		}),
		selectChatMembers = React.createElement(SelectChatMembersContainer, Cryo.Dictionary.join(v34, {
			selectedUsersChanged = function(p7, p8) -- line: 122
				-- upvalues: v35 (copy), Cryo (copy), v36 (copy), v34 (copy)
				v35.current = Cryo.List.map(p7, function(p9) -- line: 123
					return p9.id
				end)

				local v50 = p8 <= #p7

				if v50 ~= v36.current then
					v36.current = v50
					v34.setSystemButtonEnabled(v50)
				end
			end,
			maxSelections = maxSelections,
			maxConversationSize = maxConversationSize,
			canOnlyCreateOneToOneChat = v42
		}))
	})
end

return memo(CreateNewChatContainer)
