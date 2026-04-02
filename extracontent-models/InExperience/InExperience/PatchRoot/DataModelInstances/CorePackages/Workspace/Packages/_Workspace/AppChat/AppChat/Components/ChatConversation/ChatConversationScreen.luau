local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(script.Parent.Utils.readingMessagesIsEnabled);
local v8 = require(script.Parent.ChatConversationContainer);
local v9 = require(script.Parent.Logger);
local l_withChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).withChatPlacementContext;
local v11 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v11.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v11.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v11.SquadComponentAccessWrapper;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v16 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v19 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v20 = v4.PureComponent:extend("ChatConversationScreen");
v20.defaultProps = {
    navigation = nil
};
v20.navigationOptions = function(v21) --[[ Line: 32 ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), v4 (copy), l_withChatPlacementContext_0 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v18 (copy), v19 (copy)
    local l_navigation_0 = v21.navigation;
    local v23 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
    local v24 = nil;
    if l_GetFFlagIsSquadEnabled_0() then
        local v25 = l_navigation_0.getParam("conversationId", nil);
        if v25 then
            v25 = tostring(v25);
        else
            v25 = nil;
        end;
        do
            local l_v25_0 = v25;
            local function v27() --[[ Line: 43 ]]
                -- upvalues: l_navigation_0 (copy), v2 (ref), l_v25_0 (ref)
                l_navigation_0.navigate(v2.SquadLobby, {
                    conversationId = l_v25_0
                });
            end;
            if l_v25_0 then
                v24 = v4.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    GroupUpButton = l_withChatPlacementContext_0(function(v28) --[[ Line: 57 ]]
                        -- upvalues: v4 (ref), l_SquadComponentAccessWrapper_0 (ref), l_v25_0 (ref), l_SquadJoinButton_0 (ref), v27 (copy), l_SquadButtonSourceEnum_0 (ref), v18 (ref), v19 (ref)
                        return v4.createElement(l_SquadComponentAccessWrapper_0, {
                            parentChannelId = l_v25_0
                        }, v4.createElement(l_SquadJoinButton_0, {
                            conversationId = l_v25_0, 
                            isFullWidth = false, 
                            isInCard = false, 
                            layoutOrder = 0, 
                            onActivated = v27, 
                            shouldAnimate = true, 
                            shouldShowSignifier = true, 
                            squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationScreen, 
                            squadLocation = v28.chatPlacement, 
                            testId = if v18 then v19.chatConversationTopBarButton("squadJoin") else nil
                        }));
                    end)
                });
            end;
        end;
    end;
    return {
        renderRight = function() --[[ Line: 84 ]] --[[ Name: renderRight ]]
            -- upvalues: v4 (ref), v24 (ref)
            return v4.createFragment({
                groupUp = v24
            });
        end, 
        leftPaddingOverride = v23, 
        rightPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12)
    };
end;
v20.init = function(v29) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v9 (copy), v2 (copy), v17 (copy), v16 (copy), v3 (copy), v6 (copy), v7 (copy)
    v29.toastProps = nil;
    v29.inputBoxRef = v4.createRef();
    local l_navigation_1 = v29.props.navigation;
    local v31 = l_navigation_1.getParam and l_navigation_1.getParam("conversationId", nil);
    v29.navigateToConversationOverlay = function() --[[ Line: 101 ]]
        -- upvalues: v9 (ref), v31 (copy), v29 (copy), l_navigation_1 (copy), v2 (ref)
        v9:info("Navigate To ConversationOverlay: {} from {screen}", v31);
        local v32 = v29.props.navigation.getParam and v29.props.navigation.getParam("conversationId", nil);
        l_navigation_1.navigate(v2.ConversationOverlay, {
            conversationId = v32, 
            isOverlay = true
        });
    end;
    v29.navigateToChatDetails = function() --[[ Line: 111 ]]
        -- upvalues: v29 (copy), v9 (ref), l_navigation_1 (copy), v2 (ref)
        local v33 = v29.props.navigation.getParam and v29.props.navigation.getParam("conversationId", nil);
        v9:info("Navigate To ChatDetails: {} from {screen}", v33);
        l_navigation_1.navigate(v2.ChatDetails, {
            conversationId = v33
        });
    end;
    if v17 then
        v16(false).setScreenTopBar(v2.ChatConversation, {
            navigateToChatDetails = v29.navigateToChatDetails, 
            conversationId = v31
        });
    else
        local v34 = v29.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v34, "setScreenTopBar in screenProps");
        v34(v2.ChatConversation, {
            navigateToChatDetails = v29.navigateToChatDetails, 
            conversationId = v31
        });
    end;
    v29.queueNavigationToToast = function(v35) --[[ Line: 135 ]]
        -- upvalues: v29 (copy)
        if v29.props.navigation.isFocused() then
            v29.navigateToToast(v35);
            v29.toastProps = nil;
            return;
        else
            v29.toastProps = v35;
            return;
        end;
    end;
    v29.onDidFocus = function() --[[ Line: 145 ]]
        -- upvalues: v29 (copy)
        v29.setInputBarCloseCallback(v29.releaseFocus);
        if v29.toastProps then
            v29.navigateToToast(v29.toastProps);
            v29.toastProps = nil;
        end;
    end;
    v29.releaseFocus = function() --[[ Line: 154 ]]
        -- upvalues: v29 (copy)
        if v29.inputBoxRef and v29.inputBoxRef:getValue() then
            v29.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    v29.onWillBlur = function() --[[ Line: 160 ]]
        -- upvalues: v29 (copy)
        v29.releaseFocus();
        v29.setInputBarCloseCallback();
    end;
    v29.navigateToToast = function(v36) --[[ Line: 166 ]]
        -- upvalues: v9 (ref), v29 (copy), v2 (ref), v6 (ref)
        v9:info("Navigate To Toast from {screen}");
        v29.props.navigation.navigate(v2.RoactChatToast, v6.Dictionary.union(v36, {
            isOverlay = true
        }));
    end;
    v29.openViewProfile = function(v37) --[[ Line: 175 ]]
        -- upvalues: v29 (copy), v2 (ref), v9 (ref)
        local v38 = v29.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v38 then
            v9:info("Navigate To UserProfile from {screen}");
            v38(v37, {});
            return;
        else
            v9:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v29.openGameDetailsPage = function(v39, v40) --[[ Line: 187 ]]
        -- upvalues: v29 (copy), v2 (ref), v9 (ref)
        local v41 = v29.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.GameDetail];
        if v41 then
            v9:info("Navigate To GameDetail from " .. tostring(v40));
            v41(v39, v40);
            return;
        else
            v9:warning("GameDetail page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v29.navigateToChatConversation = function(v42) --[[ Line: 200 ]]
        -- upvalues: v9 (ref), v29 (copy), v2 (ref)
        v9:info("Navigate To Conversation: {} from {screen}", v42);
        v29.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v42
        });
    end;
    v29.navigateToScreen = function(v43, v44, v45) --[[ Line: 205 ]]
        -- upvalues: v9 (ref), v29 (copy), v6 (ref)
        v9:info("Navigate To Screen: {} from {screen}", v43);
        local l_navigation_2 = v29.props.navigation;
        local v47 = l_navigation_2 and l_navigation_2.getParam and l_navigation_2.getParam("conversationId", nil);
        if v44 then
            v29.props.navigation.navigate(v43, v6.Dictionary.union({
                conversationId = v47, 
                isOverlay = v45
            }, v44));
            return;
        else
            v29.props.navigation.navigate(v43, {
                conversationId = v47
            });
            return;
        end;
    end;
    v29.navigateBack = function() --[[ Line: 225 ]]
        -- upvalues: v29 (copy)
        if v29.props.navigation.isFocused() then
            v29.props.navigation.goBack();
        end;
    end;
    v29.navigateToChatLanding = function() --[[ Line: 231 ]]
        -- upvalues: v9 (ref), v29 (copy), v2 (ref)
        v9:info("Navigate To ChatLanding from {screen}");
        if v29.props.navigation.getScreenProps("wideMode", false) then
            v29.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v29.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
    v29.navigateToSquadLobby = function(v48) --[[ Line: 241 ]]
        -- upvalues: v9 (ref), v29 (copy), v2 (ref)
        v9:info("Navigate To SquadLobby from {screen}");
        v29.props.navigation.navigate(v2.SquadLobby, {
            conversationId = v48
        });
    end;
    v29.updateConversationTitle = function(v49) --[[ Line: 246 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v29 (copy), v3 (ref)
        local v50 = {
            headerText = if v49 then {
                raw = v49, 
                shouldLocalize = false
            } else {
                raw = "CommonUI.Features.Label.Chat", 
                shouldLocalize = true
            }
        };
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, v50);
            return;
        else
            local v51 = v29.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v51, "setScreenTopBar in screenProps");
            v51(v2.ChatConversation, v50);
            return;
        end;
    end;
    v29.setInputBarCloseCallback = function(v52) --[[ Line: 267 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v29 (copy), v3 (ref)
        if v17 then
            v16(false).setScreenTopBar(v2.ChatLanding, {
                closeInputBar = v52
            });
            return;
        else
            local v53 = v29.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v53, "setScreenTopBar in screenProps");
            v53(v2.ChatLanding, {
                closeInputBar = v52
            });
            return;
        end;
    end;
    v29.getReadingMessagesIsEnabled = function() --[[ Line: 277 ]]
        -- upvalues: v7 (ref), v29 (copy)
        return v7(v29.props.navigation);
    end;
    v29.updatePrivateConversationTopBar = function(v54) --[[ Line: 281 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v29 (copy), v3 (ref)
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                isPrivateConversation = v54
            });
            return;
        else
            local v55 = v29.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v55, "setScreenTopBar in screenProps");
            v55(v2.ChatConversation, {
                isPrivateConversation = v54
            });
            return;
        end;
    end;
end;
v20.didUpdate = function(v56, v57) --[[ Line: 293 ]] --[[ Name: didUpdate ]]
    -- upvalues: v17 (copy), v16 (copy), v2 (copy), v3 (copy)
    local v58 = v57.navigation and v57.navigation.getParam and v57.navigation.getParam("conversationId", nil);
    local v59 = v56.props.navigation and v56.props.navigation.getParam and v56.props.navigation.getParam("conversationId", nil);
    if v58 ~= v59 then
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                conversationId = v59
            });
            return;
        else
            local v60 = v56.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v60, "setScreenTopBar in screenProps");
            v60(v2.ChatConversation, {
                conversationId = v59
            });
        end;
    end;
end;
v20.render = function(v61) --[[ Line: 315 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v8 (copy)
    local v62 = v3.isNotNil(v61.props.navigation, "navigation in ChatConversationScreen");
    local v63 = v4.createElement(v5.NavigationEvents, {
        onDidFocus = v61.onDidFocus, 
        onWillBlur = v61.onWillBlur
    });
    local v64 = v62.getParam("conversationId", nil);
    local v65 = v64 and tostring(v64) or nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        container = v4.createElement(v8, {
            topBarHeight = v62.getScreenProps("topBarHeight", 0), 
            wideMode = v62.getScreenProps("wideMode", false), 
            openGameDetailsPage = v61.openGameDetailsPage, 
            getReadingMessagesIsEnabled = v61.getReadingMessagesIsEnabled, 
            conversationId = v65, 
            inputBoxRef = v61.inputBoxRef, 
            updateConversationTitle = v61.updateConversationTitle, 
            updatePrivateConversationTopBar = v61.updatePrivateConversationTopBar, 
            releaseInputBarFocus = v61.releaseFocus, 
            navigateBack = v61.navigateBack, 
            navigateToToast = v61.queueNavigationToToast, 
            openViewProfile = v61.openViewProfile, 
            navigateToChatConversation = v61.navigateToChatConversation, 
            navigateToChatLanding = v61.navigateToChatLanding, 
            navigateToScreen = v61.navigateToScreen, 
            navigateToSquadLobby = v61.navigateToSquadLobby, 
            navigateToConversationOverlay = v61.navigateToConversationOverlay, 
            navigation = v61.props.navigation
        }), 
        eventsAdapter = v63
    });
end;
v20.didMount = function(_) --[[ Line: 355 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v9:info("{screen} mounted");
end;
return v20;