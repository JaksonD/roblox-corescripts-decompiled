local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Roact = require(AppChatParent.Roact)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local EnumScreens = require(AppChat.EnumScreens)
local Squads = require(AppChatParent.Squads)
local SharedFlags = require(AppChatParent.SharedFlags)
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
local v18 = if not FFlagTCUnifyNavigationEntry then TrustedContacts.TrustedContactsModal.Screen else require(AppChat.Components.TrustedContactsModal.TrustedContactsModalScreen)
local MessageContextMenuScreen = require(AppChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local SquadVoiceChangerOverlay = Squads.SquadVoiceChangerOverlay
local FocusNavigableSurfaceIdentifierEnum = require(AppChatParent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local ChatConversation = AppChat.Components.ChatConversation
local CreateUnfilteredChatPartialModalScreen = require(ChatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local LearnMorePartialModalScreen = require(ChatConversation.PartialModal.LearnMorePartialModalScreen)
local SquadVoiceAbuseReportScreen = Squads.SquadVoiceAbuseReportScreen
local ConversationOverlayScreen = require(ChatConversation.PartialModal.ConversationOverlayScreen)
local TrustedConnectionsUpsellScreen = require(AppChat.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen)
local GroupOSADialogScreen = require(AppChat.Components.OSA.GroupOSADialogScreen)
local makeDialogScreenTelemetryWrapper = require(AppChat.Navigators.makeDialogScreenTelemetryWrapper)
local isolatedAutoFocusNavigation = require(AppChat.Navigators.isolatedAutoFocusNavigation)
local BlockingModal = require(AppChatParent.SocialBlockingModal).BlockingModal
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local GetFFlagIsSquadEnabled = SharedFlags.GetFFlagIsSquadEnabled
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagAppChatEnableDoubleOptIn = require(AppChatParent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatEnableGroupOSA = require(AppChatParent.SharedFlags).FFlagAppChatEnableGroupOSA
local chatLandingStackNavigator = require(script.Parent.chatLandingStackNavigator)
local v40 = Roact.Component:extend("ChatLandingStackNavigatorConnector")

v40.router = chatLandingStackNavigator.router

function v40.render(p1) -- line: 55
	-- upvalues: Roact (copy), chatLandingStackNavigator (copy)
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, {
		ChatLandingStackNavigator = Roact.createElement(chatLandingStackNavigator, p1.props)
	})
end

local t1 = {
	{
		[EnumScreens.ChatLandingStack] = v40
	},
	{
		[GenericDialogType.EditChatGroupNameDialog] = {
			screen = if not FFlagEnableAppChatFocusableFixes then EditChatGroupNameDialogScreen else isolatedAutoFocusNavigation(EditChatGroupNameDialogScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.LeaveGroupDialog] = {
			screen = if not FFlagEnableAppChatFocusableFixes then makeDialogScreenTelemetryWrapper(LeaveGroupDialogScreen) else isolatedAutoFocusNavigation(makeDialogScreenTelemetryWrapper(LeaveGroupDialogScreen), FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.ParticipantDialog] = {
			screen = if not FFlagEnableAppChatFocusableFixes then makeDialogScreenTelemetryWrapper(ParticipantDialogScreenDeprecated) else isolatedAutoFocusNavigation(makeDialogScreenTelemetryWrapper(ParticipantDialogScreenDeprecated), FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[GenericDialogType.RemoveUserDialog] = {
			screen = if not FFlagEnableAppChatFocusableFixes then RemoveUserDialogScreen else isolatedAutoFocusNavigation(RemoveUserDialogScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[EnumScreens.CreateUnfilteredChatPartialModal] = {
			screen = if not FFlagEnableAppChatFocusableFixes then CreateUnfilteredChatPartialModalScreen else isolatedAutoFocusNavigation(CreateUnfilteredChatPartialModalScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	},
	{
		[EnumScreens.LearnMorePartialModal] = {
			screen = if not FFlagEnableAppChatFocusableFixes then LearnMorePartialModalScreen else isolatedAutoFocusNavigation(LearnMorePartialModalScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	}
}

table.insert(t1, {
	[EnumScreens.AppChatReportAbuse] = {
		screen = if not FFlagEnableAppChatFocusableFixes then AbuseReportScreen else isolatedAutoFocusNavigation(AbuseReportScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if FFlagAppChatEnableTrustedFriendEntryPoint then
	table.insert(t1, {
		[EnumScreens.AppChatTrustedContactsModal] = {
			screen = if not FFlagEnableAppChatFocusableFixes then v18 else isolatedAutoFocusNavigation(v18, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

table.insert(t1, {
	[EnumScreens.BlockingModal] = {
		screen = if not FFlagEnableAppChatFocusableFixes then BlockingModal else isolatedAutoFocusNavigation(BlockingModal, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			backButtonEnabled = true,
			overlayEnabled = true
		}
	}
})

if getFFlagAppChatEnableRepliesUI() then
	table.insert(t1, {
		[EnumScreens.MessageContextMenu] = {
			screen = if not FFlagEnableAppChatFocusableFixes then MessageContextMenuScreen else isolatedAutoFocusNavigation(MessageContextMenuScreen, FocusNavigableSurfaceIdentifierEnum.ContextualMenu),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

if GetFFlagIsSquadEnabled() and GetFFlagEnableCrossExpVoice() then
	table.insert(t1, {
		[EnumScreens.SquadVoiceReportAbuse] = {
			screen = if not FFlagEnableAppChatFocusableFixes then SquadVoiceAbuseReportScreen else isolatedAutoFocusNavigation(SquadVoiceAbuseReportScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				backButtonEnabled = true,
				overlayEnabled = true
			}
		}
	})
end

table.insert(t1, {
	[EnumScreens.ConversationOverlay] = {
		screen = if not FFlagEnableAppChatFocusableFixes then ConversationOverlayScreen else isolatedAutoFocusNavigation(ConversationOverlayScreen, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			overlayEnabled = true,
			transparent = true,
			overlayTransparency = 0.5
		}
	}
})

if FFlagAppChatEnableDoubleOptIn then
	table.insert(t1, {
		[EnumScreens.TrustedConnectionsUpsell] = {
			screen = TrustedConnectionsUpsellScreen,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				overlayEnabled = true
			}
		}
	})
end

if FFlagAppChatEnableGroupOSA then
	table.insert(t1, {
		[EnumScreens.GroupOSADialog] = {
			screen = GroupOSADialogScreen,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				overlayEnabled = true
			}
		}
	})
end

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(t1, {
		[EnumScreens.SquadVoiceChangers] = {
			screen = if not FFlagEnableAppChatFocusableFixes then SquadVoiceChangerOverlay else isolatedAutoFocusNavigation(SquadVoiceChangerOverlay, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 0.5
			}
		}
	})
end

return RoactNavigation.createRobloxStackNavigator(t1, {
	mode = RoactNavigation.StackPresentationStyle.Overlay
})
