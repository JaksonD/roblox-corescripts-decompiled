local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local EnumScreens = require(AppChat.EnumScreens)
local ArgCheck = require(AppChatParent.ArgCheck)
local Roact = require(AppChatParent.Roact)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local withLocalization = require(AppChatParent.Localization).withLocalization
local TopBarProvider = require(AppChat.TopBarProvider)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStore = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local createSystemMenuButton = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local CreateNewChatContainer = require(script.Parent.CreateNewChatContainer)
local Logger = require(script.Parent.Logger)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagAppChatUseNewSelectChatMembersIxpEnabled = require(AppChat.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled)
local FStringAppChatUseNewSelectChatMembersIxpLayer = require(AppChat.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer)
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)
local FFlagConnectionsToFriendsRename = require(AppChatParent.SharedFlags).FFlagConnectionsToFriendsRename
local v22 = Roact.PureComponent:extend("CreateNewChatScreen")

v22.defaultProps = {}

function v22.navigationOptions() -- line: 32
	-- upvalues: FFlagAppChatTopBarConfigDriven (copy), GetFFlagIsSquadEnabled (copy), FFlagConnectionsToFriendsRename (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), withLocalization (copy), createSystemMenuButton (copy)
	if FFlagAppChatTopBarConfigDriven() then
		return {
			tabBarVisible = false
		}
	end

	return {
		tabBarVisible = false,
		headerText = {
			raw = not GetFFlagIsSquadEnabled() and "Feature.Chat.Heading.ChatWithConnections" or (not FFlagConnectionsToFriendsRename and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.PartyWithFriends"),
			shouldLocalize = true
		},
		backButtonEnabled = true,
		backButtonTestId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.selectChatMembersTopBarActionButton("back"),
		renderRight = function() --[[ renderRight ]] -- line: 55
			-- upvalues: Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), withLocalization (copy), GetFFlagIsSquadEnabled (copy), createSystemMenuButton (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy)
			return Roact.createElement(TopBarProvider, {
				screenName = EnumScreens.CreateNewChat,
				render = function(p1) --[[ render ]] -- line: 58
					-- upvalues: EnumScreens (copy), ArgCheck (copy), withLocalization (copy), GetFFlagIsSquadEnabled (copy), createSystemMenuButton (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy)
					local v36 = p1.getScreenTopBar(EnumScreens.CreateNewChat)

					ArgCheck.isType(v36, "table", "screenTopBar")

					return withLocalization({
						systemButtonText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Action.StartChatWithFriends" or "Feature.Chat.Action.Create",
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
					})(function(p2) -- line: 68
						-- upvalues: createSystemMenuButton (copy), v36 (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy)
						return createSystemMenuButton({
							localizedStrings = p2,
							isDisabled = not v36.systemButtonEnabled,
							onActivated = v36.systemButtonActivated,
							testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.selectChatMembersTopBarActionButton("create")
						})
					end)
				end
			})
		end
	}
end
function v22.init(p3) -- line: 84
	-- upvalues: FFlagAppChatUseNewSelectChatMembersIxpEnabled (copy), RoactNavigation (copy), IXPService (copy), FStringAppChatUseNewSelectChatMembersIxpLayer (copy), Logger (copy), EnumScreens (copy), FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), ArgCheck (copy)
	p3.ixpSubscription = if not FFlagAppChatUseNewSelectChatMembersIxpEnabled then nil else p3.props.navigation.addListener(RoactNavigation.Events.WillFocus, function() -- line: 86
		-- upvalues: IXPService (copy), FStringAppChatUseNewSelectChatMembersIxpLayer (copy)
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatUseNewSelectChatMembersIxpLayer)
	end)

	function p3.navigateToConversation(p4) -- line: 90
		-- upvalues: p3 (copy), Logger (copy), EnumScreens (copy)
		local navigation = p3.props.navigation

		Logger:info("Navigate To Conversation: {} from {screen}", p4)

		if navigation.getScreenProps("wideMode", false) then
			navigation.navigate(EnumScreens.ChatConversation, {
				conversationId = p4
			})

			return
		end

		navigation.replace(EnumScreens.ChatConversation, {
			conversationId = p4
		})
	end
	function p3.navigateToToast(p5) -- line: 101
		-- upvalues: Logger (copy), p3 (copy), EnumScreens (copy)
		Logger:info("Navigate To Toast from {screen}")
		p3.props.navigation.navigate(EnumScreens.RoactChatToast, p5)
	end
	function p3.setSystemButtonActivated(p6) -- line: 106
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), EnumScreens (copy), p3 (copy), ArgCheck (copy)
		if FFlagAppChatTopBarSignalsStore then
			GetTopBarStore(false).setScreenTopBar(EnumScreens.CreateNewChat, {
				systemButtonActivated = p6
			})

			return
		end

		local v32 = p3.props.navigation.getScreenProps("setScreenTopBar", nil)

		ArgCheck.isNotNil(v32, "setScreenTopBar in screenProps")
		v32(EnumScreens.CreateNewChat, {
			systemButtonActivated = p6
		})
	end
	function p3.setSystemButtonEnabled(p7) -- line: 120
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), EnumScreens (copy), p3 (copy), ArgCheck (copy)
		if FFlagAppChatTopBarSignalsStore then
			GetTopBarStore(false).setScreenTopBar(EnumScreens.CreateNewChat, {
				systemButtonEnabled = p7
			})

			return
		end

		local v34 = p3.props.navigation.getScreenProps("setScreenTopBar", nil)

		ArgCheck.isNotNil(v34, "setScreenTopBar in screenProps")
		v34(EnumScreens.CreateNewChat, {
			systemButtonEnabled = p7
		})
	end
end
function v22.render(p8) -- line: 135
	-- upvalues: ArgCheck (copy), Roact (copy), CreateNewChatContainer (copy)
	local v25 = ArgCheck.isNotNil(p8.props.navigation, "navigation in CreateNewChatScreen")

	return Roact.createElement(CreateNewChatContainer, {
		topBarHeight = v25.getScreenProps("topBarHeight", 0),
		navigateToConversation = p8.navigateToConversation,
		navigateToToast = p8.navigateToToast,
		setSystemButtonActivated = p8.setSystemButtonActivated,
		setSystemButtonEnabled = p8.setSystemButtonEnabled
	})
end
function v22.didMount(p9) -- line: 147
	-- upvalues: Logger (copy), FFlagAppChatTopBarConfigDriven (copy), GetTopBarStore (copy), EnumScreens (copy), GetFFlagIsSquadEnabled (copy), FFlagConnectionsToFriendsRename (copy)
	Logger:info("{screen} mounted")

	if FFlagAppChatTopBarConfigDriven() then
		GetTopBarStore(false).setScreenTopBar(EnumScreens.CreateNewChat, {
			headerText = {
				raw = not GetFFlagIsSquadEnabled() and "Feature.Chat.Heading.ChatWithConnections" or (not FFlagConnectionsToFriendsRename and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.PartyWithFriends"),
				shouldLocalize = true
			},
			backButtonEnabled = true,
			systemButtonText = not GetFFlagIsSquadEnabled() and "Feature.Chat.Action.StartChatWithFriends" or "Feature.Chat.Action.Create"
		})
	end

	p9.setSystemButtonEnabled(false)
end
function v22.willUnmount(p10) -- line: 169
	-- upvalues: FFlagAppChatTopBarConfigDriven (copy), GetTopBarStore (copy), EnumScreens (copy), FFlagAppChatUseNewSelectChatMembersIxpEnabled (copy)
	if FFlagAppChatTopBarConfigDriven() then
		GetTopBarStore(false).clearScreenTopBar(EnumScreens.CreateNewChat)
	end

	if FFlagAppChatUseNewSelectChatMembersIxpEnabled then
		p10.ixpSubscription.remove()
	end
end

return v22
