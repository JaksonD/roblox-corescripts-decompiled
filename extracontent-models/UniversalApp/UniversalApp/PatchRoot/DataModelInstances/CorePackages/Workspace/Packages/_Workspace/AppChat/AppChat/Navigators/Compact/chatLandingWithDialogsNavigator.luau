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
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v34 = require(l_script_FirstAncestor_0.Components.TopBar.SystemMenuTopBar);
local v35 = require(l_script_FirstAncestor_0.Components.TopBar.ChatConversationTopBar);
local v36 = require(l_script_FirstAncestor_0.Components.TopBar.ChatLandingTopBar);
local v37 = require(l_script_FirstAncestor_0.Components.TopBar.ChatTopBarBase);
local v38 = require(l_script_FirstAncestor_0.Components.Squads.SquadAddFriendsIconButton);
local l_SquadVoiceAbuseReportScreen_0 = v6.SquadVoiceAbuseReportScreen;
local v40 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.Provider);
local v41 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local v42 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatDetailsTelemetryState);
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v44 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local l_BlockingModal_0 = require(l_Parent_0.SocialBlockingModal).BlockingModal;
local l_GetFFlagEnableCrossExpVoice_0 = v7.GetFFlagEnableCrossExpVoice;
local l_GetFFlagIsSquadEnabled_0 = v7.GetFFlagIsSquadEnabled;
local l_FFlagAppIaScrollAway_0 = v7.FFlagAppIaScrollAway;
local l_FFlagAppIaScrollAwayFixSocial_0 = v7.FFlagAppIaScrollAwayFixSocial;
local v50 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v7.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v54 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableAbsorbInputSelectable);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local function v70(v56) --[[ Line: 72 ]] --[[ Name: AppChatNavigatorTelemetryProviders ]]
    -- upvalues: v23 (copy), v2 (copy), v42 (copy), v41 (copy), v20 (copy), v19 (copy), v22 (copy), v21 (copy)
    local v57, v58 = v23({});
    local v60 = v2.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v57 (copy)
        local v59 = v57();
        return {
            chatLandingListCount = v59.chatLandingListCount, 
            pendingConversationCount = v59.pendingConversationCount, 
            unfilteredConversationCount = v59.unfilteredConversationCount
        };
    end, {
        v57
    });
    local v61, v62 = v23({});
    local v64 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v61 (copy)
        local v63 = v61();
        return {
            conversationId = v63.conversationId, 
            moderationType = v63.moderationType, 
            userPendingStatus = v63.userPendingStatus
        };
    end, {
        v61
    });
    local l_children_0 = v56.children;
    local v66, v67 = v23({});
    local v69 = v2.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v66 (copy)
        local v68 = v66();
        return {
            participantsCount = v68.participantsCount, 
            isGroupOwner = v68.isGroupOwner
        };
    end, {
        v66, 
        v61
    });
    l_children_0 = v2.createElement(v42.Provider, {
        value = {
            get = v66, 
            set = v67
        }
    }, v2.createElement(v41.Provider, {
        value = v69
    }, v56.children));
    return v2.createElement(v20.Provider, {
        value = {
            get = v57, 
            set = v58
        }
    }, {
        v2.createElement(v19.Provider, {
            value = v60
        }, {
            v2.createElement(v22.Provider, {
                value = {
                    get = v61, 
                    set = v62
                }
            }, {
                v2.createElement(v21.Provider, {
                    value = v64
                }, l_children_0)
            })
        })
    });
end;
local v71 = v3.Component:extend("ChatLandingStackNavigatorConnector");
v71.router = v32(l_UserGameSettings_0.ReducedMotion).router;
v71.init = function(v72) --[[ Line: 144 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_memoize_0 (copy), v32 (copy), v71 (copy)
    v72.state = {
        shouldReduceMotion = l_UserGameSettings_0.ReducedMotion
    };
    v72.getNavigator = l_memoize_0(function(v73) --[[ Line: 149 ]]
        -- upvalues: v32 (ref), v71 (ref)
        local v74 = v32(v73);
        v71.router = v74.router;
        return v74;
    end);
    v72.updateSettings = function() --[[ Line: 156 ]]
        -- upvalues: v72 (copy), l_UserGameSettings_0 (ref)
        v72:setState({
            shouldReduceMotion = l_UserGameSettings_0.ReducedMotion
        });
    end;
    v72.reducedMotionConnection = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v72.updateSettings);
end;
v71.willUnmount = function(v75) --[[ Line: 165 ]] --[[ Name: willUnmount ]]
    if v75.reducedMotionConnection then
        v75.reducedMotionConnection:Disconnect();
    end;
end;
local function _(v76) --[[ Line: 171 ]] --[[ Name: getActiveRouteName ]]
    local v77 = v76 and v76.state;
    if not v77 or not v77.routes or not v77.index then
        return nil;
    else
        local v78 = v77.routes[v77.index];
        if not v78 then
            return nil;
        elseif v78.routes and v78.index then
            local v79 = v78.routes[v78.index];
            return v79 and v79.routeName or v78.routeName;
        else
            return v78.routeName;
        end;
    end;
end;
v71.render = function(v81) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v8 (copy), l_FFlagAppIaScrollAwayFixSocial_0 (copy), v4 (copy), v33 (copy), v43 (copy), v44 (copy), v5 (copy), v3 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v2 (copy), v38 (copy), v31 (copy), v70 (copy), v40 (copy)
    local v82 = if l_FFlagAppIaScrollAway_0 then v81.props.navigation.getScreenProps("isInExperience", false) else nil;
    local v83 = l_FFlagAppIaScrollAway_0 and not v82 and v8.getScrollAwayEnabled();
    if l_FFlagAppIaScrollAwayFixSocial_0 then
        local v84 = v4.getActiveChildNavigationOptions(v81.props.navigation);
        v83 = v83 and v84.tabBarVisible;
    end;
    local v85 = nil;
    if v33() then
        if v43 then
            v44.start(v44.Events.TopBarRenderInterval);
        end;
        local l_navigation_0 = v81.props.navigation;
        local v87 = l_navigation_0 and l_navigation_0.state;
        local v88;
        if not v87 or not v87.routes or not v87.index then
            v88 = nil;
        else
            local v89 = v87.routes[v87.index];
            if not v89 then
                v88 = nil;
            elseif v89.routes and v89.index then
                local v90 = v89.routes[v89.index];
                v88 = v90 and v90.routeName or v89.routeName;
            else
                v88 = v89.routeName;
            end;
        end;
        if v88 == v5.CreateNewChat or v88 == v5.EditChatMembers then
            v85 = v3.createElement(v34, {
                screenName = v88, 
                navigation = v81.props.navigation
            });
        elseif v88 == v5.ChatConversation then
            v85 = v3.createElement(v35, {
                screenName = v5.ChatConversation, 
                navigation = v81.props.navigation
            });
        elseif v88 == v5.ChatLanding then
            v85 = v3.createElement(v36, {
                screenName = v5.ChatLanding, 
                navigation = v81.props.navigation
            });
        elseif v88 == v5.ChatDetails then
            v85 = v3.createElement(v37, {
                screenName = v5.ChatDetails, 
                navigation = v81.props.navigation
            });
        elseif v88 == v5.SquadLobby then
            v85 = v3.createElement(v37, {
                screenName = v5.SquadLobby, 
                navigation = v81.props.navigation, 
                renderRight = function() --[[ Line: 228 ]] --[[ Name: renderRight ]]
                    -- upvalues: v2 (ref), v38 (ref), v81 (copy)
                    return v2.createElement(v38, {
                        navigation = v81.props.navigation
                    });
                end
            });
        elseif v88 == v5.SquadInviteFriends then
            v85 = v3.createElement(v37, {
                screenName = v5.SquadInviteFriends, 
                navigation = v81.props.navigation
            });
        elseif v88 == v5.QuickStartSquadInviteFriends then
            v85 = v3.createElement(v37, {
                screenName = v5.QuickStartSquadInviteFriends, 
                navigation = v81.props.navigation
            });
        end;
    end;
    if not v85 then
        v85 = v31(v81.props.navigation);
    end;
    local v91 = v3.createElement(v70, {}, {
        layout = if l_FFlagAppIaScrollAway_0 and v83 then nil else v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v85, 
        content = v3.createElement(v40, {
            value = {
                left = v81.props.navigation.getScreenProps("appChatOuterPadding", 12), 
                right = v81.props.navigation.getScreenProps("appChatOuterPadding", 12)
            }
        }, {
            navigatorFrame = v3.createElement("Frame", {
                Size = if l_FFlagAppIaScrollAway_0 and v83 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, -v81.props.navigation.getScreenProps("topBarHeight", 0)), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                navigator = v3.createElement(v81.getNavigator(v81.state.shouldReduceMotion), v81.props)
            })
        })
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true
    }, {
        ChatLandingStackNavigator = v91
    });
end;
local v92 = {
    {
        [v5.ChatLandingStack] = v71
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
table.insert(v92, {
    [v5.AppChatReportAbuse] = {
        screen = v16, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
table.insert(v92, {
    [v5.BlockingModal] = {
        screen = l_BlockingModal_0, 
        navigationOptions = {
            backButtonEnabled = true, 
            overlayEnabled = true
        }
    }
});
if v50() then
    table.insert(v92, {
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
    table.insert(v92, {
        [v5.SquadVoiceReportAbuse] = {
            screen = l_SquadVoiceAbuseReportScreen_0, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true
            }
        }
    });
end;
table.insert(v92, {
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
    table.insert(v92, {
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
    table.insert(v92, {
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
    table.insert(v92, {
        [v5.SquadVoiceChangers] = {
            screen = l_SquadVoiceChangerOverlay_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5
            }
        }
    });
end;
return v4.createRobloxStackNavigator(v92, {
    defaultNavigationOptions = if v54 then {
        absorbInputSelectable = false
    } else nil, 
    mode = v4.StackPresentationStyle.Overlay
});