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
local v21 = require(l_script_FirstAncestor_0.Navigators.Wide.conversationSwitchNavigator);
local v22 = require(script.Parent.ConversationStackNavigationFocusListener);
local v23 = require(l_script_FirstAncestor_0.Utils.resetForSquadLobbyForWideMode);
local v24 = require(script.Parent.ChatLandingScreen);
local v25 = require(script.Parent.ChatSearchBox);
local v26 = require(script.Parent.ChatLandingContainer);
local v27 = require(script.Parent.Logger);
local v28 = require(script.Parent.Utils.getCurrentRoute);
local l_withStyle_0 = v6.Style.withStyle;
local v30 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.Provider);
local v31 = require(l_script_FirstAncestor_0.Hooks.useGetAndSetRef);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local function v38(v33) --[[ Line: 43 ]] --[[ Name: LeftContainerTelemetryProviders ]]
    -- upvalues: v31 (copy), v4 (copy), v12 (copy), v11 (copy)
    local v34, v35 = v31({});
    local v37 = v4.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v34 (copy)
        local v36 = v34();
        return {
            chatLandingListCount = v36.chatLandingListCount, 
            pendingConversationCount = v36.pendingConversationCount, 
            unfilteredConversationCount = v36.unfilteredConversationCount
        };
    end, {
        v34
    });
    return v4.createElement(v12.Provider, {
        value = {
            get = v34, 
            set = v35
        }
    }, {
        v4.createElement(v11.Provider, {
            value = v37
        }, v33.children)
    });
end;
local function v49(v39) --[[ Line: 70 ]] --[[ Name: RightContainerTelemetryProviders ]]
    -- upvalues: v31 (copy), v4 (copy), v16 (copy), v15 (copy), v14 (copy), v13 (copy)
    local v40, v41 = v31({});
    local v43 = v4.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v40 (copy)
        local v42 = v40();
        return {
            conversationId = v42.conversationId, 
            moderationType = v42.moderationType, 
            userPendingStatus = v42.userPendingStatus
        };
    end, {
        v40
    });
    local l_children_0 = v39.children;
    local v45, v46 = v31({});
    local v48 = v4.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v45 (copy)
        local v47 = v45();
        return {
            participantsCount = v47.participantsCount, 
            isGroupOwner = v47.isGroupOwner
        };
    end, {
        v45, 
        v40
    });
    l_children_0 = v4.createElement(v16.Provider, {
        value = {
            get = v45, 
            set = v46
        }
    }, v4.createElement(v15.Provider, {
        value = v48
    }, v39.children));
    return v4.createElement(v14.Provider, {
        value = {
            get = v40, 
            set = v41
        }
    }, {
        v4.createElement(v13.Provider, {
            value = v43
        }, l_children_0)
    });
end;
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local v51 = v5.PureComponent:extend("ChatLandingScreenWithSwitchNavigator");
v51.router = v21.router;
v51.defaultProps = {
    navigation = nil
};
v51.init = function(v52) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy), v10 (copy), v28 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v23 (copy), v7 (copy), v20 (copy), v19 (copy), v2 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v5 (copy), v9 (copy)
    v52.navigateToConversation = function(v53) --[[ Line: 130 ]]
        -- upvalues: v27 (ref), v52 (copy), v10 (ref)
        v27:info("Navigate To Conversation: {} from {screen}", v53);
        v52.props.navigation.navigate(v10.ChatConversation, {
            conversationId = v53
        });
    end;
    v52.navigateToCreateChat = function() --[[ Line: 135 ]]
        -- upvalues: v27 (ref), v52 (copy), v10 (ref)
        v27:info("Navigate To CreateNewChat from {screen}");
        v52.props.navigation.navigate(v10.CreateNewChat);
    end;
    v52.navigateToToast = function(v54) --[[ Line: 140 ]]
        -- upvalues: v27 (ref), v52 (copy), v10 (ref)
        v27:info("Navigate To Toast from {screen}");
        v52.props.navigation.navigate(v10.RoactChatToast, v54);
    end;
    v52.navigateToNotifications = function() --[[ Line: 145 ]]
        -- upvalues: v52 (copy), v10 (ref), v27 (ref)
        local v55 = v52.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v10.Notifications];
        if v55 then
            v27:info("Navigate To Notifications from {screen}");
            v55();
            return;
        else
            v27:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v52.navigateToPrivacy = function() --[[ Line: 156 ]]
        -- upvalues: v52 (copy), v10 (ref), v27 (ref)
        local v56 = v52.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v10.PrivacySettings];
        if v56 then
            v27:info("Navigate To PrivacySettings from {screen}");
            v56();
            return;
        else
            v27:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v52.navigateToSquadLobby = function(v57) --[[ Line: 167 ]]
        -- upvalues: v27 (ref), v28 (ref), v52 (copy), v10 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref), v23 (ref), v7 (ref)
        v27:info("Navigate To SquadLobby from {screen}");
        local v58 = v28(v52.props.navigation.state);
        if v58 and v58.params and v58.params.conversationId == v57 and v58.routeName == v10.ChatConversation then
            v52.props.navigation.navigate(v10.SquadLobby, {
                conversationId = v57
            });
            return;
        elseif l_FFlagEnablePartyQuickStartButton_0 then
            v23(v52.props.navigation, v57);
            return;
        else
            v52.props.navigation.navigate(v10.ChatLanding, nil, v7.StackActions.reset({
                index = 2, 
                actions = {
                    v7.Actions.navigate({
                        routeName = v10.ChatConversation, 
                        params = {
                            conversationId = v57
                        }
                    }), 
                    v7.Actions.navigate({
                        routeName = v10.SquadLobby, 
                        params = {
                            conversationId = v57
                        }
                    })
                }
            }));
            return;
        end;
    end;
    v52.setScreenTopBar = function(v59) --[[ Line: 204 ]]
        -- upvalues: v20 (ref), v19 (ref), v10 (ref), v52 (copy), v2 (ref)
        if v20 then
            v19(false).setScreenTopBar(v10.ChatLanding, v59);
            return;
        else
            local v60 = v52.props.navigation.getScreenProps("setScreenTopBar", nil);
            v2.isNotNil(v60, "setScreenTopBar in screenProps");
            v60(v10.ChatLanding, v59);
            return;
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v52.leftContainerRef = v5.createRef();
        v52.rightContainerRef = v5.createRef();
        v52.focusNavigationService = v9.FocusNavigationService.new(v9.EngineInterface.CoreGui);
    end;
end;
v51.render = function(v61) --[[ Line: 221 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v2 (copy), l_withStyle_0 (copy), v5 (copy), v38 (copy), v17 (copy), v10 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v18 (copy), v3 (copy), v24 (copy), v25 (copy), v30 (copy), v26 (copy), v49 (copy), v21 (copy), v22 (copy)
    v27:info("{screen} render");
    local v62 = v2.isNotNil(v61.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator");
    local v63 = v62 and v62.getParam("key", "") or "";
    local v64 = v62.getScreenProps("showSearchRow", true);
    local v65 = v62.getScreenProps("topBarHeight", 0);
    return l_withStyle_0(function(v66) --[[ Line: 228 ]]
        -- upvalues: v5 (ref), v38 (ref), v17 (ref), v10 (ref), v2 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v61 (copy), v18 (ref), v3 (ref), v62 (copy), v24 (ref), v64 (copy), v25 (ref), v65 (copy), v30 (ref), v26 (ref), v63 (copy), v49 (ref), v21 (ref), v22 (ref)
        local v70 = {
            LeftContainerProviders = v5.createElement(v38, {}, {
                LeftContainer = v5.createElement(v17, {
                    screenName = v10.ChatLanding, 
                    render = function(v67) --[[ Line: 233 ]] --[[ Name: render ]]
                        -- upvalues: v10 (ref), v2 (ref), v5 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v61 (ref), v18 (ref), v3 (ref), v62 (ref), v24 (ref), v64 (ref), v25 (ref), v65 (ref), v30 (ref), v66 (copy), v26 (ref), v63 (ref)
                        local v68 = v67.getScreenTopBar(v10.ChatLanding);
                        v2.isType(v68, "table", "screenTopBar");
                        return v5.createElement("Frame", {
                            Size = UDim2.new(0.37, 0, 1, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            [v5.Ref] = if l_FFlagEnableAppChatFocusableFixes_0 then v61.leftContainerRef else nil
                        }, {
                            layout = v5.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            leftTopBar = v18(v3.Dictionary.join(v68, {
                                navigation = v62
                            }, v24.navigationOptions({
                                screenProps = nil, 
                                navigationOptions = nil, 
                                navigation = v62
                            }), {
                                backButtonEnabled = false, 
                                shouldBoldHeader = true
                            })), 
                            filterBox = if v64 then v5.createElement(v25, {
                                height = v65, 
                                initialText = v68.filterText, 
                                onFilter = function(v69) --[[ Line: 268 ]] --[[ Name: onFilter ]]
                                    -- upvalues: v67 (copy), v10 (ref)
                                    v67.setScreenTopBar(v10.ChatLanding, {
                                        filterText = v69
                                    });
                                end
                            }) else nil, 
                            content = v5.createElement(v30, {
                                value = {
                                    left = v62.getScreenProps("appChatOuterPadding", 12), 
                                    right = v62.getScreenProps("appChatInnerPadding", 12)
                                }
                            }, {
                                ChatLanding = v5.createElement("Frame", {
                                    BorderSizePixel = 0, 
                                    Size = UDim2.new(1, 0, 1, -v62.getScreenProps("topBarHeight", 0) - if v64 then v65 else 0), 
                                    LayoutOrder = 2, 
                                    BackgroundTransparency = v66.Tokens.Global.Color.None.Transparency
                                }, {
                                    ChatLandingContainer = v5.createElement(v26, {
                                        isShowingFilterBox = v68.shouldRenderCenter, 
                                        filterText = v68.filterText, 
                                        navigateToConversation = v61.navigateToConversation, 
                                        navigateToCreateChat = v61.navigateToCreateChat, 
                                        navigateToPrivacy = v61.navigateToPrivacy, 
                                        navigateToSquadLobby = v61.navigateToSquadLobby, 
                                        navigateToToast = v61.navigateToToast, 
                                        navigateToAddFriends = v61.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                                        key = "ChatLanding" .. v63
                                    })
                                })
                            })
                        });
                    end
                })
            }), 
            Border = v5.createElement("Frame", {
                BackgroundColor3 = v66.Theme.Divider.Color, 
                BackgroundTransparency = v66.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.37, 0, 0, 0), 
                Size = UDim2.new(0, 1, 1, 0)
            }), 
            RightContainerProviders = v5.createElement(v49, {}, {
                RightContainer = v5.createElement("Frame", {
                    Size = UDim2.new(0.63, -1, 1, 0), 
                    Position = UDim2.new(0.37, 1, 0, 0), 
                    ClipsDescendants = true, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v5.Ref] = if l_FFlagEnableAppChatFocusableFixes_0 then v61.rightContainerRef else nil
                }, {
                    Content = v5.createElement(v30, {
                        value = {
                            left = v62.getScreenProps("appChatInnerPadding", 12), 
                            right = v62.getScreenProps("appChatOuterPadding", 12)
                        }
                    }, {
                        ConversationSwitchNavigator = v5.createElement(v21, {
                            navigation = v62
                        })
                    })
                })
            })
        };
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return v5.createElement(v22, {
                navigation = v62, 
                leftContainerRef = v61.leftContainerRef, 
                rightContainerRef = v61.rightContainerRef
            }, v70);
        else
            return v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v66.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v66.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0
            }, v70);
        end;
    end);
end;
v51.didMount = function(v71) --[[ Line: 360 ]] --[[ Name: didMount ]]
    -- upvalues: v27 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v8 (copy)
    v27:info("{screen} mounted");
    v71.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
    if l_FFlagEnableAppChatFocusableFixes_0 and v71.focusNavigationService then
        v71.focusNavigationService:registerFocusBehavior(v71.leftContainerRef.current, v8.mostRecent());
        v71.focusNavigationService:registerFocusBehavior(v71.rightContainerRef.current, v8.mostRecent());
    end;
end;
v51.willUnmount = function(v72) --[[ Line: 374 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v72.focusNavigationService:teardown();
    end;
end;
return v51;