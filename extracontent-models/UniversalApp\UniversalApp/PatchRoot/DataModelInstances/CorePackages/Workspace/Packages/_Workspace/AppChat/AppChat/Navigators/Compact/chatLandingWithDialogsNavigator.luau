local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local v6 = require(l_Parent_0.Squads);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = require(l_Parent_0.AppNavBar);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_ChatDetails_0 = l_script_FirstAncestor_0.Components.ChatDetails;
local v11 = require(l_ChatDetails_0.Dialogs.GenericDialogType);
local v12 = require(l_ChatDetails_0.EditChatGroupNameDialog.EditChatGroupNameDialogScreen);
local v13 = require(l_ChatDetails_0.LeaveGroupDialog.LeaveGroupDialogScreen);
local v14 = require(l_ChatDetails_0.ParticipantDialog.ParticipantDialogScreen);
local v15 = require(l_ChatDetails_0.RemoveUserDialog.RemoveUserDialogScreen);
local v16 = require(l_script_FirstAncestor_0.Components.ChatAbuseReport.AbuseReportScreen);
local v17 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen);
local l_SquadVoiceChangerOverlay_0 = v6.SquadVoiceChangerOverlay;
local v19 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v20 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatLandingTelemetryState);
local v21 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v22 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatConversationTelemetryState);
local v23 = require(l_script_FirstAncestor_0.Hooks.useGetAndSetRef);
local v24 = require(l_script_FirstAncestor_0.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen);
local v25 = require(l_script_FirstAncestor_0.Components.OSA.GroupOSADialogScreen);
local l_ChatConversation_0 = l_script_FirstAncestor_0.Components.ChatConversation;
local v27 = require(l_ChatConversation_0.PartialModal.CreateUnfilteredChatPartialModalScreen);
local v28 = require(l_ChatConversation_0.PartialModal.LearnMorePartialModalScreen);
local v29 = require(l_ChatConversation_0.PartialModal.ConversationOverlayScreen);
local v30 = require(l_script_FirstAncestor_0.Navigators.makeDialogScreenTelemetryWrapper);
local v31 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v32 = require(script.Parent.getChatLandingStackNavigator);
local l_SquadVoiceAbuseReportScreen_0 = v6.SquadVoiceAbuseReportScreen;
local v34 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.Provider);
local v35 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local v36 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatDetailsTelemetryState);
local l_BlockingModal_0 = require(l_Parent_0.SocialBlockingModal).BlockingModal;
local l_GetFFlagEnableCrossExpVoice_0 = v7.GetFFlagEnableCrossExpVoice;
local l_GetFFlagIsSquadEnabled_0 = v7.GetFFlagIsSquadEnabled;
local l_FFlagAppIaScrollAway_0 = v7.FFlagAppIaScrollAway;
local l_FFlagAppIaScrollAwayFixSocial_0 = v7.FFlagAppIaScrollAwayFixSocial;
local v42 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v7.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableAbsorbInputSelectable);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local function v62(v48) --[[ Line: 64 ]] --[[ Name: AppChatNavigatorTelemetryProviders ]]
    -- upvalues: v23 (copy), v2 (copy), v36 (copy), v35 (copy), v20 (copy), v19 (copy), v22 (copy), v21 (copy)
    local v49, v50 = v23({});
    local v52 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v49 (copy)
        local v51 = v49();
        return {
            chatLandingListCount = v51.chatLandingListCount, 
            pendingConversationCount = v51.pendingConversationCount, 
            unfilteredConversationCount = v51.unfilteredConversationCount
        };
    end, {
        v49
    });
    local v53, v54 = v23({});
    local v56 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v53 (copy)
        local v55 = v53();
        return {
            conversationId = v55.conversationId, 
            moderationType = v55.moderationType, 
            userPendingStatus = v55.userPendingStatus
        };
    end, {
        v53
    });
    local l_children_0 = v48.children;
    local v58, v59 = v23({});
    local v61 = v2.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v58 (copy)
        local v60 = v58();
        return {
            participantsCount = v60.participantsCount, 
            isGroupOwner = v60.isGroupOwner
        };
    end, {
        v58, 
        v53
    });
    l_children_0 = v2.createElement(v36.Provider, {
        value = {
            get = v58, 
            set = v59
        }
    }, v2.createElement(v35.Provider, {
        value = v61
    }, v48.children));
    return v2.createElement(v20.Provider, {
        value = {
            get = v49, 
            set = v50
        }
    }, {
        v2.createElement(v19.Provider, {
            value = v52
        }, {
            v2.createElement(v22.Provider, {
                value = {
                    get = v53, 
                    set = v54
                }
            }, {
                v2.createElement(v21.Provider, {
                    value = v56
                }, l_children_0)
            })
        })
    });
end;
local v63 = v3.Component:extend("ChatLandingStackNavigatorConnector");
v63.router = v32(l_UserGameSettings_0.ReducedMotion).router;
v63.init = function(v64) --[[ Line: 136 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_memoize_0 (copy), v32 (copy), v63 (copy)
    v64.state = {
        shouldReduceMotion = l_UserGameSettings_0.ReducedMotion
    };
    v64.getNavigator = l_memoize_0(function(v65) --[[ Line: 141 ]]
        -- upvalues: v32 (ref), v63 (ref)
        local v66 = v32(v65);
        v63.router = v66.router;
        return v66;
    end);
    v64.updateSettings = function() --[[ Line: 148 ]]
        -- upvalues: v64 (copy), l_UserGameSettings_0 (ref)
        v64:setState({
            shouldReduceMotion = l_UserGameSettings_0.ReducedMotion
        });
    end;
    v64.reducedMotionConnection = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v64.updateSettings);
end;
v63.willUnmount = function(v67) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    if v67.reducedMotionConnection then
        v67.reducedMotionConnection:Disconnect();
    end;
end;
v63.render = function(v68) --[[ Line: 163 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v8 (copy), l_FFlagAppIaScrollAwayFixSocial_0 (copy), v4 (copy), v3 (copy), v62 (copy), v31 (copy), v34 (copy)
    local v69 = if l_FFlagAppIaScrollAway_0 then v68.props.navigation.getScreenProps("isInExperience", false) else nil;
    local v70 = l_FFlagAppIaScrollAway_0 and not v69 and v8.getScrollAwayEnabled();
    if l_FFlagAppIaScrollAwayFixSocial_0 then
        local v71 = v4.getActiveChildNavigationOptions(v68.props.navigation);
        v70 = v70 and v71.tabBarVisible;
    end;
    local v72 = v3.createElement(v62, {}, {
        layout = if l_FFlagAppIaScrollAway_0 and v70 then nil else v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v31(v68.props.navigation), 
        content = v3.createElement(v34, {
            value = {
                left = v68.props.navigation.getScreenProps("appChatOuterPadding", 12), 
                right = v68.props.navigation.getScreenProps("appChatOuterPadding", 12)
            }
        }, {
            navigatorFrame = v3.createElement("Frame", {
                Size = if l_FFlagAppIaScrollAway_0 and v70 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -v68.props.navigation.getScreenProps("topBarHeight", 0)), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                navigator = v3.createElement(v68.getNavigator(v68.state.shouldReduceMotion), v68.props)
            })
        })
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true
    }, {
        ChatLandingStackNavigator = v72
    });
end;
local v73 = {
    {
        [v5.ChatLandingStack] = v63
    }, 
    {
        [v11.EditChatGroupNameDialog] = {
            screen = v12, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v11.LeaveGroupDialog] = {
            screen = v30(v13), 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v11.ParticipantDialog] = {
            screen = v30(v14), 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v11.RemoveUserDialog] = {
            screen = v15, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v5.CreateUnfilteredChatPartialModal] = {
            screen = v27, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v5.LearnMorePartialModal] = {
            screen = v28, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    }
};
table.insert(v73, {
    [v5.AppChatReportAbuse] = {
        screen = v16, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
table.insert(v73, {
    [v5.BlockingModal] = {
        screen = l_BlockingModal_0, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
if v42() then
    table.insert(v73, {
        [v5.MessageContextMenu] = {
            screen = v17, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
if l_GetFFlagIsSquadEnabled_0() and l_GetFFlagEnableCrossExpVoice_0() then
    table.insert(v73, {
        [v5.SquadVoiceReportAbuse] = {
            screen = l_SquadVoiceAbuseReportScreen_0, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
table.insert(v73, {
    [v5.ConversationOverlay] = {
        screen = v29, 
        navigationOptions = {
            transparent = true, 
            overlayTransparency = 0.5, 
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
if l_FFlagAppChatEnableDoubleOptIn_0 then
    table.insert(v73, {
        [v5.TrustedConnectionsUpsell] = {
            screen = v24, 
            navigationOptions = {
                transparent = true, 
                overlayTransparency = 0.5, 
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
if l_FFlagAppChatEnableGroupOSA_0 then
    table.insert(v73, {
        [v5.GroupOSADialog] = {
            screen = v25, 
            navigationOptions = {
                transparent = true, 
                overlayTransparency = 0.5, 
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
if l_FFlagEnablePartyVoiceChangersInLua_0 then
    table.insert(v73, {
        [v5.SquadVoiceChangers] = {
            screen = l_SquadVoiceChangerOverlay_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5
            }
        }
    });
end;
return v4.createRobloxStackNavigator(v73, {
    defaultNavigationOptions = if v46 then {
        absorbInputSelectable = false
    } else nil, 
    mode = v4.StackPresentationStyle.Overlay
});