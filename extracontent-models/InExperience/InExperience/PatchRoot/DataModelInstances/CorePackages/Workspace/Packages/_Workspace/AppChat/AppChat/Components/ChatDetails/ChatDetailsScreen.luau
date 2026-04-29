local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local EnumScreens = require(AppChat.EnumScreens)
local Roact = require(AppChatParent.Roact)
local ChatDetailsContainer = require(script.Parent.ChatDetailsContainer)
local Logger = require(script.Parent.Logger)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local v12 = Roact.PureComponent:extend("ChatDetailsScreen")

v12.defaultProps = {
	navigation = nil
}

function v12.navigationOptions() -- line: 20
	-- upvalues: GetFFlagIsSquadEnabled (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy)
	return {
		headerText = {
			raw = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.ChatDetails" or "Feature.Chat.Label.Details",
			shouldLocalize = true
		},
		backButtonTestId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatDetailsTopBarActionButton("back")
	}
end
function v12.init(p1) -- line: 32
	-- upvalues: Logger (copy), EnumScreens (copy)
	function p1.navigateToEditChatMembers(p2) -- line: 33
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To EditChatMembers from {screen}")
		p1.props.navigation.navigate(EnumScreens.EditChatMembers, {
			conversation = p2
		})
	end
	function p1.navigateToToast(p3) -- line: 38
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreens.RoactChatToast, p3)
	end
	function p1.navigateToDialog(p4, p5) -- line: 43
		-- upvalues: Logger (copy), p1 (copy)
		Logger:info("Navigate To {} from {screen}", p4)
		p1.props.navigation.navigate(p4, p5)
	end
	function p1.navigateBack() -- line: 48
		-- upvalues: p1 (copy)
		if p1.props.navigation.isFocused() then
			p1.props.navigation.goBack()
		end
	end
	function p1.navigateToConversation(p6) -- line: 54
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To Conversation from {screen}")
		p1.props.navigation.navigate(EnumScreens.ChatConversation, {
			conversationId = p6
		})
	end
	function p1.navigateToChatLanding() -- line: 59
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To ChatLanding from {screen}")

		if p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(EnumScreens.EmptyConversation)

			return
		end

		p1.props.navigation.navigate(EnumScreens.ChatLanding)
	end
end
function v12.render(p7) -- line: 70
	-- upvalues: Logger (copy), Roact (copy), ChatDetailsContainer (copy)
	local navigation = p7.props.navigation

	assert(type(navigation) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation")

	local v16 = navigation.getParam("conversationId", nil)

	if v16 == nil then
		Logger:warning("ConversationId is required to open {screen}")

		return nil
	end

	return Roact.createElement(ChatDetailsContainer, {
		topBarHeight = navigation.getScreenProps("topBarHeight", 0),
		wideMode = navigation.getScreenProps("wideMode", false),
		conversationId = v16,
		navigateBack = p7.navigateBack,
		navigateToEditChatMembers = p7.navigateToEditChatMembers,
		navigateToDialog = p7.navigateToDialog,
		navigateToToast = p7.navigateToToast,
		navigateToConversation = p7.navigateToConversation,
		navigateToChatLanding = p7.navigateToChatLanding
	})
end
function v12.didMount(_) -- line: 93
	-- upvalues: Logger (copy), FFlagAppChatTopBarConfigDriven (copy), GetFFlagIsSquadEnabled (copy), GetTopBarStore (copy), EnumScreens (copy)
	Logger:info("{screen} mounted")

	if FFlagAppChatTopBarConfigDriven() then
		local v18 = if not GetFFlagIsSquadEnabled() then {
			raw = "Feature.Chat.Label.ChatDetails",
			shouldLocalize = true
		} else {
			raw = "Feature.Chat.Label.Details",
			shouldLocalize = true
		}

		GetTopBarStore(false).setScreenTopBar(EnumScreens.ChatDetails, {
			headerText = v18,
			backButtonEnabled = true
		})
	end
end

return v12
