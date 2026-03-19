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
local v18 = v4.PureComponent:extend("ChatConversationScreen");
v18.defaultProps = {
    navigation = nil
};
v18.navigationOptions = function(v19) --[[ Line: 30 ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), v4 (copy), l_withChatPlacementContext_0 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy)
    local l_navigation_0 = v19.navigation;
    local v21 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
    local v22 = nil;
    if l_GetFFlagIsSquadEnabled_0() then
        local v23 = l_navigation_0.getParam("conversationId", nil);
        if v23 then
            v23 = tostring(v23);
        else
            v23 = nil;
        end;
        do
            local l_v23_0 = v23;
            local function v25() --[[ Line: 41 ]]
                -- upvalues: l_navigation_0 (copy), v2 (ref), l_v23_0 (ref)
                l_navigation_0.navigate(v2.SquadLobby, {
                    conversationId = l_v23_0
                });
            end;
            if l_v23_0 then
                v22 = v4.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right
                    }), 
                    GroupUpButton = l_withChatPlacementContext_0(function(v26) --[[ Line: 55 ]]
                        -- upvalues: v4 (ref), l_SquadComponentAccessWrapper_0 (ref), l_v23_0 (ref), l_SquadJoinButton_0 (ref), v25 (copy), l_SquadButtonSourceEnum_0 (ref)
                        return v4.createElement(l_SquadComponentAccessWrapper_0, {
                            parentChannelId = l_v23_0
                        }, v4.createElement(l_SquadJoinButton_0, {
                            conversationId = l_v23_0, 
                            isFullWidth = false, 
                            isInCard = false, 
                            layoutOrder = 0, 
                            onActivated = v25, 
                            shouldAnimate = true, 
                            shouldShowSignifier = true, 
                            squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationScreen, 
                            squadLocation = v26.chatPlacement
                        }));
                    end)
                });
            end;
        end;
    end;
    return {
        renderRight = function() --[[ Line: 79 ]] --[[ Name: renderRight ]]
            -- upvalues: v4 (ref), v22 (ref)
            return v4.createFragment({
                groupUp = v22
            });
        end, 
        leftPaddingOverride = v21, 
        rightPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12)
    };
end;
v18.init = function(v27) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v9 (copy), v2 (copy), v17 (copy), v16 (copy), v3 (copy), v6 (copy), v7 (copy)
    v27.toastProps = nil;
    v27.inputBoxRef = v4.createRef();
    local l_navigation_1 = v27.props.navigation;
    local v29 = l_navigation_1.getParam and l_navigation_1.getParam("conversationId", nil);
    v27.navigateToConversationOverlay = function() --[[ Line: 96 ]]
        -- upvalues: v9 (ref), v29 (copy), v27 (copy), l_navigation_1 (copy), v2 (ref)
        v9:info("Navigate To ConversationOverlay: {} from {screen}", v29);
        local v30 = v27.props.navigation.getParam and v27.props.navigation.getParam("conversationId", nil);
        l_navigation_1.navigate(v2.ConversationOverlay, {
            conversationId = v30, 
            isOverlay = true
        });
    end;
    v27.navigateToChatDetails = function() --[[ Line: 106 ]]
        -- upvalues: v27 (copy), v9 (ref), l_navigation_1 (copy), v2 (ref)
        local v31 = v27.props.navigation.getParam and v27.props.navigation.getParam("conversationId", nil);
        v9:info("Navigate To ChatDetails: {} from {screen}", v31);
        l_navigation_1.navigate(v2.ChatDetails, {
            conversationId = v31
        });
    end;
    if v17 then
        v16(false).setScreenTopBar(v2.ChatConversation, {
            navigateToChatDetails = v27.navigateToChatDetails, 
            conversationId = v29
        });
    else
        local v32 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v32, "setScreenTopBar in screenProps");
        v32(v2.ChatConversation, {
            navigateToChatDetails = v27.navigateToChatDetails, 
            conversationId = v29
        });
    end;
    v27.queueNavigationToToast = function(v33) --[[ Line: 130 ]]
        -- upvalues: v27 (copy)
        if v27.props.navigation.isFocused() then
            v27.navigateToToast(v33);
            v27.toastProps = nil;
            return;
        else
            v27.toastProps = v33;
            return;
        end;
    end;
    v27.onDidFocus = function() --[[ Line: 140 ]]
        -- upvalues: v27 (copy)
        v27.setInputBarCloseCallback(v27.releaseFocus);
        if v27.toastProps then
            v27.navigateToToast(v27.toastProps);
            v27.toastProps = nil;
        end;
    end;
    v27.releaseFocus = function() --[[ Line: 149 ]]
        -- upvalues: v27 (copy)
        if v27.inputBoxRef and v27.inputBoxRef:getValue() then
            v27.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    v27.onWillBlur = function() --[[ Line: 155 ]]
        -- upvalues: v27 (copy)
        v27.releaseFocus();
        v27.setInputBarCloseCallback();
    end;
    v27.navigateToToast = function(v34) --[[ Line: 161 ]]
        -- upvalues: v9 (ref), v27 (copy), v2 (ref), v6 (ref)
        v9:info("Navigate To Toast from {screen}");
        v27.props.navigation.navigate(v2.RoactChatToast, v6.Dictionary.union(v34, {
            isOverlay = true
        }));
    end;
    v27.openViewProfile = function(v35) --[[ Line: 170 ]]
        -- upvalues: v27 (copy), v2 (ref), v9 (ref)
        local v36 = v27.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v36 then
            v9:info("Navigate To UserProfile from {screen}");
            v36(v35, {});
            return;
        else
            v9:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v27.openGameDetailsPage = function(v37, v38) --[[ Line: 182 ]]
        -- upvalues: v27 (copy), v2 (ref), v9 (ref)
        local v39 = v27.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.GameDetail];
        if v39 then
            v9:info("Navigate To GameDetail from " .. tostring(v38));
            v39(v37, v38);
            return;
        else
            v9:warning("GameDetail page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v27.navigateToChatConversation = function(v40) --[[ Line: 195 ]]
        -- upvalues: v9 (ref), v27 (copy), v2 (ref)
        v9:info("Navigate To Conversation: {} from {screen}", v40);
        v27.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v40
        });
    end;
    v27.navigateToScreen = function(v41, v42, v43) --[[ Line: 200 ]]
        -- upvalues: v9 (ref), v27 (copy), v6 (ref)
        v9:info("Navigate To Screen: {} from {screen}", v41);
        local l_navigation_2 = v27.props.navigation;
        local v45 = l_navigation_2 and l_navigation_2.getParam and l_navigation_2.getParam("conversationId", nil);
        if v42 then
            v27.props.navigation.navigate(v41, v6.Dictionary.union({
                conversationId = v45, 
                isOverlay = v43
            }, v42));
            return;
        else
            v27.props.navigation.navigate(v41, {
                conversationId = v45
            });
            return;
        end;
    end;
    v27.navigateBack = function() --[[ Line: 220 ]]
        -- upvalues: v27 (copy)
        if v27.props.navigation.isFocused() then
            v27.props.navigation.goBack();
        end;
    end;
    v27.navigateToChatLanding = function() --[[ Line: 226 ]]
        -- upvalues: v9 (ref), v27 (copy), v2 (ref)
        v9:info("Navigate To ChatLanding from {screen}");
        if v27.props.navigation.getScreenProps("wideMode", false) then
            v27.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v27.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
    v27.navigateToSquadLobby = function(v46) --[[ Line: 236 ]]
        -- upvalues: v9 (ref), v27 (copy), v2 (ref)
        v9:info("Navigate To SquadLobby from {screen}");
        v27.props.navigation.navigate(v2.SquadLobby, {
            conversationId = v46
        });
    end;
    v27.updateConversationTitle = function(v47) --[[ Line: 241 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v27 (copy), v3 (ref)
        local v48 = {
            headerText = if v47 then {
                raw = v47, 
                shouldLocalize = false
            } else {
                raw = "CommonUI.Features.Label.Chat", 
                shouldLocalize = true
            }
        };
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, v48);
            return;
        else
            local v49 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v49, "setScreenTopBar in screenProps");
            v49(v2.ChatConversation, v48);
            return;
        end;
    end;
    v27.setInputBarCloseCallback = function(v50) --[[ Line: 262 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v27 (copy), v3 (ref)
        if v17 then
            v16(false).setScreenTopBar(v2.ChatLanding, {
                closeInputBar = v50
            });
            return;
        else
            local v51 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v51, "setScreenTopBar in screenProps");
            v51(v2.ChatLanding, {
                closeInputBar = v50
            });
            return;
        end;
    end;
    v27.getReadingMessagesIsEnabled = function() --[[ Line: 272 ]]
        -- upvalues: v7 (ref), v27 (copy)
        return v7(v27.props.navigation);
    end;
    v27.updatePrivateConversationTopBar = function(v52) --[[ Line: 276 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v27 (copy), v3 (ref)
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                isPrivateConversation = v52
            });
            return;
        else
            local v53 = v27.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v53, "setScreenTopBar in screenProps");
            v53(v2.ChatConversation, {
                isPrivateConversation = v52
            });
            return;
        end;
    end;
end;
v18.didUpdate = function(v54, v55) --[[ Line: 288 ]] --[[ Name: didUpdate ]]
    -- upvalues: v17 (copy), v16 (copy), v2 (copy), v3 (copy)
    local v56 = v55.navigation and v55.navigation.getParam and v55.navigation.getParam("conversationId", nil);
    local v57 = v54.props.navigation and v54.props.navigation.getParam and v54.props.navigation.getParam("conversationId", nil);
    if v56 ~= v57 then
        if v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                conversationId = v57
            });
            return;
        else
            local v58 = v54.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v58, "setScreenTopBar in screenProps");
            v58(v2.ChatConversation, {
                conversationId = v57
            });
        end;
    end;
end;
v18.render = function(v59) --[[ Line: 310 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v8 (copy)
    local v60 = v3.isNotNil(v59.props.navigation, "navigation in ChatConversationScreen");
    local v61 = v4.createElement(v5.NavigationEvents, {
        onDidFocus = v59.onDidFocus, 
        onWillBlur = v59.onWillBlur
    });
    local v62 = v60.getParam("conversationId", nil);
    local v63 = v62 and tostring(v62) or nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        container = v4.createElement(v8, {
            topBarHeight = v60.getScreenProps("topBarHeight", 0), 
            wideMode = v60.getScreenProps("wideMode", false), 
            openGameDetailsPage = v59.openGameDetailsPage, 
            getReadingMessagesIsEnabled = v59.getReadingMessagesIsEnabled, 
            conversationId = v63, 
            inputBoxRef = v59.inputBoxRef, 
            updateConversationTitle = v59.updateConversationTitle, 
            updatePrivateConversationTopBar = v59.updatePrivateConversationTopBar, 
            releaseInputBarFocus = v59.releaseFocus, 
            navigateBack = v59.navigateBack, 
            navigateToToast = v59.queueNavigationToToast, 
            openViewProfile = v59.openViewProfile, 
            navigateToChatConversation = v59.navigateToChatConversation, 
            navigateToChatLanding = v59.navigateToChatLanding, 
            navigateToScreen = v59.navigateToScreen, 
            navigateToSquadLobby = v59.navigateToSquadLobby, 
            navigateToConversationOverlay = v59.navigateToConversationOverlay, 
            navigation = v59.props.navigation
        }), 
        eventsAdapter = v61
    });
end;
v18.didMount = function(_) --[[ Line: 350 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v9:info("{screen} mounted");
end;
return v18;