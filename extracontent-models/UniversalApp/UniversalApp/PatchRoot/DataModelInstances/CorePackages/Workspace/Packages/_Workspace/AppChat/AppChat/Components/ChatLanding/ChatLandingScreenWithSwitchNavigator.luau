local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.RoactNavigation);
local v8 = require(l_Parent_0.FocusBehaviors);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local v11 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v12 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatLandingTelemetryState);
local v13 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v14 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatConversationTelemetryState);
local v15 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local v16 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatDetailsTelemetryState);
local v17 = require(l_script_FirstAncestor_0.TopBarProvider);
local v18 = require(l_script_FirstAncestor_0.createChatTopBar);
local v19 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v22 = require(l_script_FirstAncestor_0.Components.TopBar.ChatLandingTopBar);
local v23 = require(l_script_FirstAncestor_0.Navigators.Wide.conversationSwitchNavigator);
local v24 = require(script.Parent.ConversationStackNavigationFocusListener);
local v25 = require(l_script_FirstAncestor_0.Utils.resetForSquadLobbyForWideMode);
local v26 = require(script.Parent.ChatLandingScreen);
local v27 = require(script.Parent.ChatSearchBox);
local v28 = require(script.Parent.ChatLandingContainer);
local v29 = require(script.Parent.Logger);
local v30 = require(script.Parent.Utils.getCurrentRoute);
local l_withStyle_0 = v6.Style.withStyle;
local v32 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.Provider);
local v33 = require(l_script_FirstAncestor_0.Hooks.useGetAndSetRef);
local v34 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableAppChatFocusableFixes_0 = v34.FFlagEnableAppChatFocusableFixes;
local l_GetFFlagAppChatRebrandStringUpdates_0 = v34.GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = v34.GetFFlagIsSquadEnabled;
local function v43(v38) --[[ Line: 48 ]] --[[ Name: LeftContainerTelemetryProviders ]]
    -- upvalues: v33 (copy), v4 (copy), v12 (copy), v11 (copy)
    local v39, v40 = v33({});
    local v42 = v4.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v39 (copy)
        local v41 = v39();
        return {
            chatLandingListCount = v41.chatLandingListCount, 
            pendingConversationCount = v41.pendingConversationCount, 
            unfilteredConversationCount = v41.unfilteredConversationCount
        };
    end, {
        v39
    });
    return v4.createElement(v12.Provider, {
        value = {
            get = v39, 
            set = v40
        }
    }, {
        v4.createElement(v11.Provider, {
            value = v42
        }, v38.children)
    });
end;
local function v54(v44) --[[ Line: 75 ]] --[[ Name: RightContainerTelemetryProviders ]]
    -- upvalues: v33 (copy), v4 (copy), v16 (copy), v15 (copy), v14 (copy), v13 (copy)
    local v45, v46 = v33({});
    local v48 = v4.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v45 (copy)
        local v47 = v45();
        return {
            conversationId = v47.conversationId, 
            moderationType = v47.moderationType, 
            userPendingStatus = v47.userPendingStatus
        };
    end, {
        v45
    });
    local l_children_0 = v44.children;
    local v50, v51 = v33({});
    local v53 = v4.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: v50 (copy)
        local v52 = v50();
        return {
            participantsCount = v52.participantsCount, 
            isGroupOwner = v52.isGroupOwner
        };
    end, {
        v50, 
        v45
    });
    l_children_0 = v4.createElement(v16.Provider, {
        value = {
            get = v50, 
            set = v51
        }
    }, v4.createElement(v15.Provider, {
        value = v53
    }, v44.children));
    return v4.createElement(v14.Provider, {
        value = {
            get = v45, 
            set = v46
        }
    }, {
        v4.createElement(v13.Provider, {
            value = v48
        }, l_children_0)
    });
end;
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local v56 = v5.PureComponent:extend("ChatLandingScreenWithSwitchNavigator");
v56.router = v23.router;
v56.defaultProps = {
    navigation = nil
};
v56.init = function(v57) --[[ Line: 134 ]] --[[ Name: init ]]
    -- upvalues: v29 (copy), v10 (copy), v30 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v25 (copy), v7 (copy), v20 (copy), v19 (copy), v2 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v5 (copy), v9 (copy)
    v57.navigateToConversation = function(v58) --[[ Line: 135 ]]
        -- upvalues: v29 (ref), v57 (copy), v10 (ref)
        v29:info("Navigate To Conversation: {} from {screen}", v58);
        v57.props.navigation.navigate(v10.ChatConversation, {
            conversationId = v58
        });
    end;
    v57.navigateToCreateChat = function() --[[ Line: 140 ]]
        -- upvalues: v29 (ref), v57 (copy), v10 (ref)
        v29:info("Navigate To CreateNewChat from {screen}");
        v57.props.navigation.navigate(v10.CreateNewChat);
    end;
    v57.navigateToToast = function(v59) --[[ Line: 145 ]]
        -- upvalues: v29 (ref), v57 (copy), v10 (ref)
        v29:info("Navigate To Toast from {screen}");
        v57.props.navigation.navigate(v10.RoactChatToast, v59);
    end;
    v57.navigateToNotifications = function() --[[ Line: 150 ]]
        -- upvalues: v57 (copy), v10 (ref), v29 (ref)
        local v60 = v57.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v10.Notifications];
        if v60 then
            v29:info("Navigate To Notifications from {screen}");
            v60();
            return;
        else
            v29:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v57.navigateToPrivacy = function() --[[ Line: 161 ]]
        -- upvalues: v57 (copy), v10 (ref), v29 (ref)
        local v61 = v57.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v10.PrivacySettings];
        if v61 then
            v29:info("Navigate To PrivacySettings from {screen}");
            v61();
            return;
        else
            v29:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v57.navigateToSquadLobby = function(v62) --[[ Line: 172 ]]
        -- upvalues: v29 (ref), v30 (ref), v57 (copy), v10 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref), v25 (ref), v7 (ref)
        v29:info("Navigate To SquadLobby from {screen}");
        local v63 = v30(v57.props.navigation.state);
        if v63 and v63.params and v63.params.conversationId == v62 and v63.routeName == v10.ChatConversation then
            v57.props.navigation.navigate(v10.SquadLobby, {
                conversationId = v62
            });
            return;
        elseif l_FFlagEnablePartyQuickStartButton_0 then
            v25(v57.props.navigation, v62);
            return;
        else
            v57.props.navigation.navigate(v10.ChatLanding, nil, v7.StackActions.reset({
                index = 2, 
                actions = {
                    v7.Actions.navigate({
                        routeName = v10.ChatConversation, 
                        params = {
                            conversationId = v62
                        }
                    }), 
                    v7.Actions.navigate({
                        routeName = v10.SquadLobby, 
                        params = {
                            conversationId = v62
                        }
                    })
                }
            }));
            return;
        end;
    end;
    v57.setScreenTopBar = function(v64) --[[ Line: 209 ]]
        -- upvalues: v20 (ref), v19 (ref), v10 (ref), v57 (copy), v2 (ref)
        if v20 then
            v19(false).setScreenTopBar(v10.ChatLanding, v64);
            return;
        else
            local v65 = v57.props.navigation.getScreenProps("setScreenTopBar", nil);
            v2.isNotNil(v65, "setScreenTopBar in screenProps");
            v65(v10.ChatLanding, v64);
            return;
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v57.leftContainerRef = v5.createRef();
        v57.rightContainerRef = v5.createRef();
        v57.focusNavigationService = v9.FocusNavigationService.new(v9.EngineInterface.CoreGui);
    end;
end;
v56.render = function(v66) --[[ Line: 226 ]] --[[ Name: render ]]
    -- upvalues: v29 (copy), v2 (copy), l_withStyle_0 (copy), v5 (copy), v43 (copy), v17 (copy), v10 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v21 (copy), v22 (copy), v18 (copy), v3 (copy), v26 (copy), v27 (copy), v32 (copy), v28 (copy), v54 (copy), v23 (copy), v24 (copy)
    v29:info("{screen} render");
    local v67 = v2.isNotNil(v66.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator");
    local v68 = v67 and v67.getParam("key", "") or "";
    local v69 = v67.getScreenProps("showSearchRow", true);
    local v70 = v67.getScreenProps("topBarHeight", 0);
    return l_withStyle_0(function(v71) --[[ Line: 233 ]]
        -- upvalues: v5 (ref), v43 (ref), v17 (ref), v10 (ref), v2 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v66 (copy), v21 (ref), v22 (ref), v67 (copy), v18 (ref), v3 (ref), v26 (ref), v69 (copy), v27 (ref), v70 (copy), v32 (ref), v28 (ref), v68 (copy), v54 (ref), v23 (ref), v24 (ref)
        local v75 = {
            LeftContainerProviders = v5.createElement(v43, {}, {
                LeftContainer = v5.createElement(v17, {
                    screenName = v10.ChatLanding, 
                    render = function(v72) --[[ Line: 238 ]] --[[ Name: render ]]
                        -- upvalues: v10 (ref), v2 (ref), v5 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v66 (ref), v21 (ref), v22 (ref), v67 (ref), v18 (ref), v3 (ref), v26 (ref), v69 (ref), v27 (ref), v70 (ref), v32 (ref), v71 (copy), v28 (ref), v68 (ref)
                        local v73 = v72.getScreenTopBar(v10.ChatLanding);
                        v2.isType(v73, "table", "screenTopBar");
                        return v5.createElement("Frame", {
                            Size = UDim2.new(0.37, 0, 1, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            [v5.Ref] = if l_FFlagEnableAppChatFocusableFixes_0 then v66.leftContainerRef else nil
                        }, {
                            layout = v5.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            leftTopBar = if v21() then v5.createElement(v22, {
                                screenName = v10.ChatLanding, 
                                navigation = v67
                            }) else v18(v3.Dictionary.join(v73, {
                                navigation = v67
                            }, v26.navigationOptions({
                                screenProps = nil, 
                                navigationOptions = nil, 
                                navigation = v67
                            }), {
                                backButtonEnabled = false, 
                                shouldBoldHeader = true
                            })), 
                            filterBox = if v69 then v5.createElement(v27, {
                                height = v70, 
                                initialText = v73.filterText, 
                                onFilter = function(v74) --[[ Line: 276 ]] --[[ Name: onFilter ]]
                                    -- upvalues: v72 (copy), v10 (ref)
                                    v72.setScreenTopBar(v10.ChatLanding, {
                                        filterText = v74
                                    });
                                end
                            }) else nil, 
                            content = v5.createElement(v32, {
                                value = {
                                    left = v67.getScreenProps("appChatOuterPadding", 12), 
                                    right = v67.getScreenProps("appChatInnerPadding", 12)
                                }
                            }, {
                                ChatLanding = v5.createElement("Frame", {
                                    BorderSizePixel = 0, 
                                    Size = UDim2.new(1, 0, 1, -v67.getScreenProps("topBarHeight", 0) - if v69 then v70 else 0), 
                                    LayoutOrder = 2, 
                                    BackgroundTransparency = v71.Tokens.Global.Color.None.Transparency
                                }, {
                                    ChatLandingContainer = v5.createElement(v28, {
                                        isShowingFilterBox = v73.shouldRenderCenter, 
                                        filterText = v73.filterText, 
                                        navigateToConversation = v66.navigateToConversation, 
                                        navigateToCreateChat = v66.navigateToCreateChat, 
                                        navigateToPrivacy = v66.navigateToPrivacy, 
                                        navigateToSquadLobby = v66.navigateToSquadLobby, 
                                        navigateToToast = v66.navigateToToast, 
                                        navigateToAddFriends = v66.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                                        key = "ChatLanding" .. v68
                                    })
                                })
                            })
                        });
                    end
                })
            }), 
            Border = v5.createElement("Frame", {
                BackgroundColor3 = v71.Theme.Divider.Color, 
                BackgroundTransparency = v71.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.37, 0, 0, 0), 
                Size = UDim2.new(0, 1, 1, 0)
            }), 
            RightContainerProviders = v5.createElement(v54, {}, {
                RightContainer = v5.createElement("Frame", {
                    Size = UDim2.new(0.63, -1, 1, 0), 
                    Position = UDim2.new(0.37, 1, 0, 0), 
                    ClipsDescendants = true, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v5.Ref] = if l_FFlagEnableAppChatFocusableFixes_0 then v66.rightContainerRef else nil
                }, {
                    Content = v5.createElement(v32, {
                        value = {
                            left = v67.getScreenProps("appChatInnerPadding", 12), 
                            right = v67.getScreenProps("appChatOuterPadding", 12)
                        }
                    }, {
                        ConversationSwitchNavigator = v5.createElement(v23, {
                            navigation = v67
                        })
                    })
                })
            })
        };
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return v5.createElement(v24, {
                navigation = v67, 
                leftContainerRef = v66.leftContainerRef, 
                rightContainerRef = v66.rightContainerRef
            }, v75);
        else
            return v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v71.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v71.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0
            }, v75);
        end;
    end);
end;
v56.didMount = function(v76) --[[ Line: 368 ]] --[[ Name: didMount ]]
    -- upvalues: v29 (copy), v21 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v8 (copy)
    v29:info("{screen} mounted");
    if v21() then
        local l_navigation_0 = v76.props.navigation;
        local v78 = l_navigation_0.getScreenProps("appChatInnerPadding", 12);
        local v79 = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
            raw = "Feature.Squads.Label.Party", 
            shouldLocalize = true
        } else {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        };
        v76.setScreenTopBar({
            shouldRenderCenter = false, 
            filterText = "", 
            headerText = v79, 
            backButtonEnabled = false, 
            closeButtonEnabled = false, 
            isRoot = true, 
            isTitleLeftAligned = true, 
            leftPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12), 
            rightPaddingOverride = v78, 
            shouldBoldHeader = true
        });
    else
        v76.setScreenTopBar({
            shouldRenderCenter = false, 
            filterText = ""
        });
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 and v76.focusNavigationService then
        v76.focusNavigationService:registerFocusBehavior(v76.leftContainerRef.current, v8.mostRecent());
        v76.focusNavigationService:registerFocusBehavior(v76.rightContainerRef.current, v8.mostRecent());
    end;
end;
v56.willUnmount = function(v80) --[[ Line: 410 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v80.focusNavigationService:teardown();
    end;
end;
return v56;