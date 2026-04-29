local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Roact = require(AppChatParent.Roact)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local EnumScreens = require(AppChat.EnumScreens)
local Squads = require(AppChatParent.Squads)
local SharedFlags = require(AppChatParent.SharedFlags)
local AppNavBar = require(AppChatParent.AppNavBar)
local memoize = require(AppChatParent.AppCommonLib).memoize
local ChatDetails = AppChat.Components.ChatDetails
local GenericDialogType = require(ChatDetails.Dialogs.GenericDialogType)
local EditChatGroupNameDialogScreen = require(ChatDetails.EditChatGroupNameDialog.EditChatGroupNameDialogScreen)
local LeaveGroupDialogScreen = require(ChatDetails.LeaveGroupDialog.LeaveGroupDialogScreen)
local ParticipantDialogScreenDeprecated = require(ChatDetails.ParticipantDialog.ParticipantDialogScreenDeprecated)
local RemoveUserDialogScreen = require(ChatDetails.RemoveUserDialog.RemoveUserDialogScreen)
local AbuseReportScreen = require(AppChat.Components.ChatAbuseReport.AbuseReportScreen)
local TrustedContacts = require(AppChatParent.TrustedContacts)
local FFlagTCUnifyNavigationEntry = SharedFlags.FFlagTCUnifyNavigationEntry
local FFlagAppChatEnableTrustedFriendEntryPoint = require(AppChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local v21 = if not FFlagTCUnifyNavigationEntry then TrustedContacts.TrustedContactsModal.Screen else require(AppChat.Components.TrustedContactsModal.TrustedContactsModalScreen)
local MessageContextMenuScreen = require(AppChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local SquadVoiceChangerOverlay = Squads.SquadVoiceChangerOverlay
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryState = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryState = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local useGetAndSetRef = require(AppChat.Hooks.useGetAndSetRef)
local TrustedConnectionsUpsellScreen = require(AppChat.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen)
local GroupOSADialogScreen = require(AppChat.Components.OSA.GroupOSADialogScreen)
local ChatConversation = AppChat.Components.ChatConversation
local CreateUnfilteredChatPartialModalScreen = require(ChatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local LearnMorePartialModalScreen = require(ChatConversation.PartialModal.LearnMorePartialModalScreen)
local ConversationOverlayScreen = require(ChatConversation.PartialModal.ConversationOverlayScreen)
local makeDialogScreenTelemetryWrapper = require(AppChat.Navigators.makeDialogScreenTelemetryWrapper)
local configureTopBarWithNavigationOptions = require(AppChat.configureTopBarWithNavigationOptions)
local getChatLandingStackNavigator = require(script.Parent.getChatLandingStackNavigator)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local SystemMenuTopBar = require(AppChat.Components.TopBar.SystemMenuTopBar)
local ChatConversationTopBar = require(AppChat.Components.TopBar.ChatConversationTopBar)
local ChatLandingTopBar = require(AppChat.Components.TopBar.ChatLandingTopBar)
local ChatTopBarBase = require(AppChat.Components.TopBar.ChatTopBarBase)
local SquadAddFriendsIconButton = require(AppChat.Components.Squads.SquadAddFriendsIconButton)
local SquadVoiceAbuseReportScreen = Squads.SquadVoiceAbuseReportScreen
local Provider = require(AppChat.Contexts.ChatPagePadding.Provider)
local ChatDetailsTelemetryLayer = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryState = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local BlockingModal = require(AppChatParent.SocialBlockingModal).BlockingModal
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagIsSquadEnabled = SharedFlags.GetFFlagIsSquadEnabled
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagAppIaScrollAwayFixSocial = SharedFlags.FFlagAppIaScrollAwayFixSocial
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagAppChatEnableDoubleOptIn = require(AppChatParent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatEnableGroupOSA = require(AppChatParent.SharedFlags).FFlagAppChatEnableGroupOSA
local FFlagAppChatDisableAbsorbInputSelectable = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local function AppChatNavigatorTelemetryProviders(t1: {[any]: any}) -- line: 77
	-- upvalues: useGetAndSetRef (copy), React (copy), ChatDetailsTelemetryState (copy), ChatDetailsTelemetryLayer (copy), ChatLandingTelemetryState (copy), ChatLandingTelemetryLayer (copy), ChatConversationTelemetryState (copy), ChatConversationTelemetryLayer (copy)
	local v65, v66 = useGetAndSetRef({})
	local v67 = React.useCallback(function() -- line: 80
		-- upvalues: v65 (copy)
		local v93 = v65()

		return {
			chatLandingListCount = v93.chatLandingListCount,
			pendingConversationCount = v93.pendingConversationCount,
			unfilteredConversationCount = v93.unfilteredConversationCount
		}
	end, { v65 })
	local v68, v69 = useGetAndSetRef({})
	local v70 = React.useCallback(function() -- line: 90
		-- upvalues: v68 (copy)
		local v94 = v68()

		return {
			conversationId = v94.conversationId,
			moderationType = v94.moderationType,
			userPendingStatus = v94.userPendingStatus
		}
	end, { v68 })
	local _ = t1.children
	local v72, v73 = useGetAndSetRef({})
	local v74 = React.useCallback(function() -- line: 102
		-- upvalues: v72 (copy)
		local v95 = v72()

		return {
			participantsCount = v95.participantsCount,
			isGroupOwner = v95.isGroupOwner
		}
	end, {
		v72,
		v68
	})
	local v75 = React.createElement(ChatDetailsTelemetryState.Provider, {
		value = {
			get = v72,
			set = v73
		}
	}, React.createElement(ChatDetailsTelemetryLayer.Provider, {
		value = v74
	}, t1.children))

	return React.createElement(ChatLandingTelemetryState.Provider, {
		value = {
			get = v65,
			set = v66
		}
	}, { React.createElement(ChatLandingTelemetryLayer.Provider, {
		value = v67
	}, { React.createElement(ChatConversationTelemetryState.Provider, {
		value = {
			get = v68,
			set = v69
		}
	}, { React.createElement(ChatConversationTelemetryLayer.Provider, {
		value = v70
	}, v75) }) }) })
end

local v62 = Roact.Component:extend("ChatLandingStackNavigatorConnector")

v62.router = getChatLandingStackNavigator(UserGameSettings.ReducedMotion).router

function v62.init(p1) -- line: 149
	-- upvalues: UserGameSettings (copy), memoize (copy), getChatLandingStackNavigator (copy), v62 (copy)
	p1.state = {
		shouldReduceMotion = UserGameSettings.ReducedMotion
	}
	p1.getNavigator = memoize(function(p2) -- line: 154
		-- upvalues: getChatLandingStackNavigator (copy), v62 (copy)
		local v97 = getChatLandingStackNavigator(p2)

		v62.router = v97.router

		return v97
	end)

	function p1.updateSettings() -- line: 161
		-- upvalues: p1 (copy), UserGameSettings (copy)
		p1:setState({
			shouldReduceMotion = UserGameSettings.ReducedMotion
		})
	end

	p1.reducedMotionConnection = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(p1.updateSettings)
end
function v62.willUnmount(p3) -- line: 170
	if p3.reducedMotionConnection then
		p3.reducedMotionConnection:Disconnect()
	end
end
function v62.render(p4) -- line: 193
	-- upvalues: FFlagAppIaScrollAway (copy), AppNavBar (copy), FFlagAppIaScrollAwayFixSocial (copy), RoactNavigation (copy), FFlagAppChatTopBarConfigDriven (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), EnumScreens (copy), Roact (copy), SystemMenuTopBar (copy), ChatConversationTopBar (copy), ChatLandingTopBar (copy), ChatTopBarBase (copy), React (copy), SquadAddFriendsIconButton (copy), configureTopBarWithNavigationOptions (copy), AppChatNavigatorTelemetryProviders (copy), Provider (copy)
	local v83 = if not FFlagAppIaScrollAway then nil else p4.props.navigation.getScreenProps("isInExperience", false)
	local v84 = FFlagAppIaScrollAway and (not v83 and AppNavBar.getScrollAwayEnabled())

	if FFlagAppIaScrollAwayFixSocial then
		local v85 = RoactNavigation.getActiveChildNavigationOptions(p4.props.navigation)

		v84 = v84 and v85.tabBarVisible
	end

	local v86 = nil

	if FFlagAppChatTopBarConfigDriven() then
		if FFlagAppChatPerfTracking then
			AppChatPerfTracker.start(AppChatPerfTracker.Events.TopBarRenderInterval)
		end

		local navigation = p4.props.navigation
		local v88 = navigation and navigation.state
		local v89

		if not v88 or not v88.routes or not v88.index then
			v89 = nil
		else
			local v90 = v88.routes[v88.index]

			if not v90 then
				v89 = nil
			elseif v90.routes and v90.index then
				local v91 = v90.routes[v90.index]

				v89 = v91 and v91.routeName or v90.routeName
			else
				v89 = v90.routeName
			end
		end

		if v89 == EnumScreens.CreateNewChat or v89 == EnumScreens.EditChatMembers then
			v86 = Roact.createElement(SystemMenuTopBar, {
				screenName = v89,
				navigation = p4.props.navigation
			})
		elseif v89 == EnumScreens.ChatConversation then
			v86 = Roact.createElement(ChatConversationTopBar, {
				screenName = EnumScreens.ChatConversation,
				navigation = p4.props.navigation
			})
		elseif v89 == EnumScreens.ChatLanding then
			v86 = Roact.createElement(ChatLandingTopBar, {
				screenName = EnumScreens.ChatLanding,
				navigation = p4.props.navigation
			})
		elseif v89 == EnumScreens.ChatDetails then
			v86 = Roact.createElement(ChatTopBarBase, {
				screenName = EnumScreens.ChatDetails,
				navigation = p4.props.navigation
			})
		elseif v89 == EnumScreens.SquadLobby then
			v86 = Roact.createElement(ChatTopBarBase, {
				screenName = EnumScreens.SquadLobby,
				navigation = p4.props.navigation,
				renderRight = function() --[[ renderRight ]] -- line: 233
					-- upvalues: React (copy), SquadAddFriendsIconButton (copy), p4 (copy)
					return React.createElement(SquadAddFriendsIconButton, {
						navigation = p4.props.navigation
					})
				end
			})
		elseif v89 == EnumScreens.SquadInviteFriends then
			v86 = Roact.createElement(ChatTopBarBase, {
				screenName = EnumScreens.SquadInviteFriends,
				navigation = p4.props.navigation
			})
		elseif v89 == EnumScreens.QuickStartSquadInviteFriends then
			v86 = Roact.createElement(ChatTopBarBase, {
				screenName = EnumScreens.QuickStartSquadInviteFriends,
				navigation = p4.props.navigation
			})
		end
	end

	if not v86 then
		v86 = configureTopBarWithNavigationOptions(p4.props.navigation)
	end

	local v92 = Roact.createElement(AppChatNavigatorTelemetryProviders, {}, {
		layout = if not FFlagAppIaScrollAway or not v84 then Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		topBar = v86,
		content = Roact.createElement(Provider, {
			value = {
				left = p4.props.navigation.getScreenProps("appChatOuterPadding", 12),
				right = p4.props.navigation.getScreenProps("appChatOuterPadding", 12)
			}
		}, {
			navigatorFrame = Roact.createElement("Frame", {
				Size = if not FFlagAppIaScrollAway or not v84 then UDim2.new(1, 0, 1, -p4.props.navigation.getScreenProps("topBarHeight", 0)) else UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0
			}, {
				navigator = Roact.createElement(p4.getNavigator(p4.state.shouldReduceMotion), p4.props)
			})
		})
	})

	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, {
		ChatLandingStackNavigator = v92
	})
end

local t2 = {
	{
		[EnumScreens.ChatLandingStack] = v62
	},
	{
		[GenericDialogType.EditChatGroupNameDialog] = {
			screen = EditChatGroupNameDialogScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.LeaveGroupDialog] = {
			screen = makeDialogScreenTelemetryWrapper(LeaveGroupDialogScreen),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.ParticipantDialog] = {
			screen = makeDialogScreenTelemetryWrapper(ParticipantDialogScreenDeprecated),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.RemoveUserDialog] = {
			screen = RemoveUserDialogScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[EnumScreens.CreateUnfilteredChatPartialModal] = {
			screen = CreateUnfilteredChatPartialModalScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[EnumScreens.LearnMorePartialModal] = {
			screen = LearnMorePartialModalScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	}
}

table.insert(t2, {
	[EnumScreens.AppChatReportAbuse] = {
		screen = AbuseReportScreen,
		navigationOptions = {
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if FFlagAppChatEnableTrustedFriendEntryPoint then
	table.insert(t2, {
		[EnumScreens.AppChatTrustedContactsModal] = {
			screen = v21,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

table.insert(t2, {
	[EnumScreens.BlockingModal] = {
		screen = BlockingModal,
		navigationOptions = {
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if getFFlagAppChatEnableRepliesUI() then
	table.insert(t2, {
		[EnumScreens.MessageContextMenu] = {
			screen = MessageContextMenuScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

if GetFFlagIsSquadEnabled() and GetFFlagEnableCrossExpVoice() then
	table.insert(t2, {
		[EnumScreens.SquadVoiceReportAbuse] = {
			screen = SquadVoiceAbuseReportScreen,
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

table.insert(t2, {
	[EnumScreens.ConversationOverlay] = {
		screen = ConversationOverlayScreen,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if FFlagAppChatEnableDoubleOptIn then
	table.insert(t2, {
		[EnumScreens.TrustedConnectionsUpsell] = {
			screen = TrustedConnectionsUpsellScreen,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

if FFlagAppChatEnableGroupOSA then
	table.insert(t2, {
		[EnumScreens.GroupOSADialog] = {
			screen = GroupOSADialogScreen,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(t2, {
		[EnumScreens.SquadVoiceChangers] = {
			screen = SquadVoiceChangerOverlay,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 0.5
			}
		}
	})
end

return RoactNavigation.createRobloxStackNavigator(t2, {
	defaultNavigationOptions = if not FFlagAppChatDisableAbsorbInputSelectable then nil else {
		absorbInputSelectable = false
	},
	mode = RoactNavigation.StackPresentationStyle.Overlay
})
