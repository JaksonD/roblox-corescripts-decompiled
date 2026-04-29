local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local RoactNavigation = require(AppChatParent.RoactNavigation)
local Cryo = require(AppChatParent.Cryo)
local autoFocusNavigation = require(script.Parent.Parent.autoFocusNavigation)
local React = require(AppChatParent.React)
local SquadAddFriendsIconButton = require(AppChat.Components.Squads.SquadAddFriendsIconButton)
local EnumScreens = require(AppChat.EnumScreens)
local ChatConversationScreen = require(AppChat.Components.ChatConversation.ChatConversationScreen)
local ChatDetailsScreen = require(AppChat.Components.ChatDetails.ChatDetailsScreen)
local SquadInviteFriendsScreen = require(AppChat.Components.Squads.SquadInviteFriendsScreen)
local SquadLobbyScreen = require(AppChat.Components.Squads.SquadLobbyScreen)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnablePartyQuickStartButton = require(AppChatParent.SharedFlags).FFlagEnablePartyQuickStartButton
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagAppChatDisableAbsorbInputSelectable = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)
local TopBarProvider = require(AppChat.TopBarProvider)
local createSystemMenuButton = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local withLocalization = require(AppChatParent.Localization).withLocalization
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local NavProps = require(AppChat.Constants).NavProps

local function instantTransitionConfig() -- line: 32
	return {
		transitionSpec = {
			frequency = 1000000,
			dampingRatio = 1
		}
	}
end

return function(p1, b1: boolean?) -- line: 41
	-- upvalues: FFlagAppChatTopBarConfigDriven (copy), Cryo (copy), GetFFlagIsSquadEnabled (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), React (copy), SquadAddFriendsIconButton (copy), NavProps (copy), FFlagEnablePartyQuickStartButton (copy), TopBarProvider (copy), EnumScreens (copy), withLocalization (copy), createSystemMenuButton (copy), ChatConversationScreen (copy), FFlagEnableAppChatFocusableFixes (copy), autoFocusNavigation (copy), ChatDetailsScreen (copy), SquadLobbyScreen (copy), SquadInviteFriendsScreen (copy), FFlagAppChatDisableAbsorbInputSelectable (copy), RoactNavigation (copy), instantTransitionConfig (copy)
	local t1 = {
		{
			[EnumScreens.ChatConversation] = {
				screen = ChatConversationScreen,
				navigationOptions = Cryo.Dictionary.join({
					backButtonEnabled = false,
					isRoot = true,
					lockIconEnabled = true,
					tabBarVisible = true
				}, p1 or {})
			}
		},
		{
			[EnumScreens.ChatDetails] = {
				screen = if not FFlagEnableAppChatFocusableFixes then ChatDetailsScreen else autoFocusNavigation(ChatDetailsScreen),
				navigationOptions = if not FFlagEnableAppChatFocusableFixes then Cryo.Dictionary.join({
					backButtonEnabled = true
				}, p1 or {}) else function(_) --[[ getChatDetailsNavigationOptions ]] -- line: 42
					-- upvalues: FFlagAppChatTopBarConfigDriven (copy), p1 (copy), Cryo (copy), GetFFlagIsSquadEnabled (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy)
					if FFlagAppChatTopBarConfigDriven() then
						return p1 or {}
					end

					return Cryo.Dictionary.join({
						backButtonEnabled = true,
						headerText = {
							raw = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.ChatDetails" or "Feature.Chat.Label.Details",
							shouldLocalize = true
						},
						backButtonTestId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatDetailsTopBarActionButton("back")
					}, p1 or {})
				end
			}
		}
	}

	if GetFFlagIsSquadEnabled() then
		table.insert(t1, {
			[EnumScreens.SquadLobby] = {
				screen = if not FFlagEnableAppChatFocusableFixes then SquadLobbyScreen.WideSquadLobbyScreen else autoFocusNavigation(SquadLobbyScreen.WideSquadLobbyScreen),
				navigationOptions = if not FFlagEnableAppChatFocusableFixes then Cryo.Dictionary.join({
					backButtonEnabled = true
				}, p1 or {}) else function(p3) --[[ getSquadLobbyNavigationOptions ]] -- line: 60
					-- upvalues: FFlagAppChatTopBarConfigDriven (copy), p1 (copy), Cryo (copy), React (copy), SquadAddFriendsIconButton (copy)
					if FFlagAppChatTopBarConfigDriven() then
						return p1 or {}
					end

					local navigation = p3.navigation

					return Cryo.Dictionary.join({
						backButtonEnabled = true,
						renderRight = function() --[[ renderRight ]] -- line: 67
							-- upvalues: React (copy), SquadAddFriendsIconButton (copy), navigation (copy)
							return React.createElement(SquadAddFriendsIconButton, {
								navigation = navigation
							})
						end
					}, p1 or {})
				end
			}
		})
		table.insert(t1, {
			[EnumScreens.SquadInviteFriends] = {
				screen = if not FFlagEnableAppChatFocusableFixes then SquadInviteFriendsScreen else autoFocusNavigation(SquadInviteFriendsScreen),
				navigationOptions = if not FFlagEnableAppChatFocusableFixes then Cryo.Dictionary.join({
					backButtonEnabled = true,
					headerText = if not FFlagEnablePartyQuickStartButton then nil else {
						raw = "Feature.Squads.Action.Add",
						shouldLocalize = true
					}
				}, p1 or {}) else function(p4) --[[ getSquadInviteFriendsNavigationOptions ]] -- line: 75
					-- upvalues: FFlagAppChatTopBarConfigDriven (copy), p1 (copy), NavProps (copy), FFlagEnablePartyQuickStartButton (copy), React (copy), TopBarProvider (copy), EnumScreens (copy), withLocalization (copy), createSystemMenuButton (copy), Cryo (copy)
					if FFlagAppChatTopBarConfigDriven() then
						return p1 or {}
					end

					local v33 = p4.navigation and (p4.navigation.getScreenProps and p4.navigation.getScreenProps(NavProps.WIDE_MODE, false))
					local t2 = {
						backButtonEnabled = true,
						headerText = if not FFlagEnablePartyQuickStartButton then nil else {
							raw = "Feature.Squads.Action.Add",
							shouldLocalize = true
						}
					}

					if v33 then
						function t2.renderRight() -- line: 95
							-- upvalues: React (copy), TopBarProvider (copy), EnumScreens (copy), withLocalization (copy), createSystemMenuButton (copy)
							return React.createElement(TopBarProvider, {
								screenName = EnumScreens.SquadInviteFriends,
								render = function(p5) --[[ render ]] -- line: 98
									-- upvalues: EnumScreens (copy), withLocalization (copy), createSystemMenuButton (copy)
									local v36 = p5.getScreenTopBar(EnumScreens.SquadInviteFriends)

									return withLocalization({
										systemButtonText = "Feature.Squads.Action.Add"
									})(function(p6) -- line: 103
										-- upvalues: createSystemMenuButton (copy), v36 (copy)
										return createSystemMenuButton({
											localizedStrings = p6,
											isDisabled = not v36.systemButtonEnabled,
											onActivated = v36.systemButtonActivated
										})
									end)
								end
							})
						end
					end

					return Cryo.Dictionary.join(t2, p1 or {})
				end
			}
		})
	end

	local t3 = {
		tabBarVisible = true
	}

	if FFlagAppChatDisableAbsorbInputSelectable then
		t3.absorbInputSelectable = false
	end

	return RoactNavigation.createRobloxStackNavigator(t1, {
		defaultNavigationOptions = t3,
		transitionConfig = if not b1 then nil else instantTransitionConfig
	})
end
