local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_Parent_0.Squads);
local v6 = require(l_Parent_0.SharedFlags);
local l_ChatDetails_0 = l_script_FirstAncestor_0.Components.ChatDetails;
local v8 = require(l_ChatDetails_0.Dialogs.GenericDialogType);
local v9 = require(l_ChatDetails_0.EditChatGroupNameDialog.EditChatGroupNameDialogScreen);
local v10 = require(l_ChatDetails_0.LeaveGroupDialog.LeaveGroupDialogScreen);
local v11 = require(l_ChatDetails_0.ParticipantDialog.ParticipantDialogScreen);
local v12 = require(l_ChatDetails_0.RemoveUserDialog.RemoveUserDialogScreen);
local v13 = require(l_script_FirstAncestor_0.Components.ChatAbuseReport.AbuseReportScreen);
local v14 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen);
local l_SquadVoiceChangerOverlay_0 = v5.SquadVoiceChangerOverlay;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local l_ChatConversation_0 = l_script_FirstAncestor_0.Components.ChatConversation;
local v18 = require(l_ChatConversation_0.PartialModal.CreateUnfilteredChatPartialModalScreen);
local v19 = require(l_ChatConversation_0.PartialModal.LearnMorePartialModalScreen);
local l_SquadVoiceAbuseReportScreen_0 = v5.SquadVoiceAbuseReportScreen;
local v21 = require(l_ChatConversation_0.PartialModal.ConversationOverlayScreen);
local v22 = require(l_script_FirstAncestor_0.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen);
local v23 = require(l_script_FirstAncestor_0.Components.OSA.GroupOSADialogScreen);
local v24 = require(l_script_FirstAncestor_0.Navigators.makeDialogScreenTelemetryWrapper);
local v25 = require(l_script_FirstAncestor_0.Navigators.isolatedAutoFocusNavigation);
local l_BlockingModal_0 = require(l_Parent_0.SocialBlockingModal).BlockingModal;
local l_GetFFlagEnableCrossExpVoice_0 = v6.GetFFlagEnableCrossExpVoice;
local l_GetFFlagIsSquadEnabled_0 = v6.GetFFlagIsSquadEnabled;
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v6.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v34 = require(script.Parent.chatLandingStackNavigator);
local v35 = v2.Component:extend("ChatLandingStackNavigatorConnector");
v35.router = v34.router;
v35.render = function(v36) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v34 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true
    }, {
        ChatLandingStackNavigator = v2.createElement(v34, v36.props)
    });
end;
local v37 = {
    {
        [v4.ChatLandingStack] = v35
    }, 
    {
        [v8.EditChatGroupNameDialog] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v9, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v9, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v8.LeaveGroupDialog] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v24(v10), l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v24(v10), 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v8.ParticipantDialog] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v24(v11), l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v24(v11), 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v8.RemoveUserDialog] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v12, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v12, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v4.CreateUnfilteredChatPartialModal] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v18, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v18, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v4.LearnMorePartialModal] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v19, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v19, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }
};
table.insert(v37, {
    [v4.AppChatReportAbuse] = {
        screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v13, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v13, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
table.insert(v37, {
    [v4.BlockingModal] = {
        screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(l_BlockingModal_0, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else l_BlockingModal_0, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
if v29() then
    table.insert(v37, {
        [v4.MessageContextMenu] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v14, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu) else v14, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
if l_GetFFlagIsSquadEnabled_0() and l_GetFFlagEnableCrossExpVoice_0() then
    table.insert(v37, {
        [v4.SquadVoiceReportAbuse] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(l_SquadVoiceAbuseReportScreen_0, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else l_SquadVoiceAbuseReportScreen_0, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
table.insert(v37, {
    [v4.ConversationOverlay] = {
        screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(v21, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else v21, 
        navigationOptions = {
            overlayEnabled = true, 
            transparent = true, 
            overlayTransparency = 0.5
        }
    }
});
if l_FFlagAppChatEnableDoubleOptIn_0 then
    table.insert(v37, {
        [v4.TrustedConnectionsUpsell] = {
            screen = v22, 
            navigationOptions = {
                transparent = true, 
                overlayTransparency = 0.5, 
                overlayEnabled = true
            }
        }
    });
end;
if l_FFlagAppChatEnableGroupOSA_0 then
    table.insert(v37, {
        [v4.GroupOSADialog] = {
            screen = v23, 
            navigationOptions = {
                transparent = true, 
                overlayTransparency = 0.5, 
                overlayEnabled = true
            }
        }
    });
end;
if l_FFlagEnablePartyVoiceChangersInLua_0 then
    table.insert(v37, {
        [v4.SquadVoiceChangers] = {
            screen = if l_FFlagEnableAppChatFocusableFixes_0 then v25(l_SquadVoiceChangerOverlay_0, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp) else l_SquadVoiceChangerOverlay_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5
            }
        }
    });
end;
return v3.createRobloxStackNavigator(v37, {
    mode = v3.StackPresentationStyle.Overlay
});