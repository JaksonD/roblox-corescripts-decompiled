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
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v21 = v4.PureComponent:extend("ChatConversationScreen");
v21.defaultProps = {
    navigation = nil
};
v21.navigationOptions = function(v22) --[[ Line: 33 ]]
    -- upvalues: v20 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), v4 (copy), l_withChatPlacementContext_0 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v18 (copy), v19 (copy)
    local l_navigation_0 = v22.navigation;
    if v20() then
        return {
            tabBarVisible = false, 
            lockIconEnabled = true, 
            absorbInput = false, 
            backButtonEnabled = not l_navigation_0.getScreenProps("wideMode", false), 
            isRoot = l_navigation_0.getScreenProps("wideMode", false)
        };
    else
        local v24 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
        local v25 = nil;
        if l_GetFFlagIsSquadEnabled_0() then
            local v26 = l_navigation_0.getParam("conversationId", nil);
            if v26 then
                v26 = tostring(v26);
            else
                v26 = nil;
            end;
            do
                local l_v26_0 = v26;
                local function v28() --[[ Line: 54 ]]
                    -- upvalues: l_navigation_0 (copy), v2 (ref), l_v26_0 (ref)
                    l_navigation_0.navigate(v2.SquadLobby, {
                        conversationId = l_v26_0
                    });
                end;
                if l_v26_0 then
                    v25 = v4.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v4.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Right
                        }), 
                        GroupUpButton = l_withChatPlacementContext_0(function(v29) --[[ Line: 68 ]]
                            -- upvalues: v4 (ref), l_SquadComponentAccessWrapper_0 (ref), l_v26_0 (ref), l_SquadJoinButton_0 (ref), v28 (copy), l_SquadButtonSourceEnum_0 (ref), v18 (ref), v19 (ref)
                            return v4.createElement(l_SquadComponentAccessWrapper_0, {
                                parentChannelId = l_v26_0
                            }, v4.createElement(l_SquadJoinButton_0, {
                                conversationId = l_v26_0, 
                                isFullWidth = false, 
                                isInCard = false, 
                                layoutOrder = 0, 
                                onActivated = v28, 
                                shouldAnimate = true, 
                                shouldShowSignifier = true, 
                                squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationScreen, 
                                squadLocation = v29.chatPlacement, 
                                testId = if v18 then v19.chatConversationTopBarButton("squadJoin") else nil
                            }));
                        end)
                    });
                end;
            end;
        end;
        return {
            tabBarVisible = false, 
            lockIconEnabled = true, 
            absorbInput = false, 
            backButtonEnabled = not l_navigation_0.getScreenProps("wideMode", false), 
            isRoot = l_navigation_0.getScreenProps("wideMode", false), 
            renderRight = function() --[[ Line: 100 ]] --[[ Name: renderRight ]]
                -- upvalues: v4 (ref), v25 (ref)
                return v4.createFragment({
                    groupUp = v25
                });
            end, 
            leftPaddingOverride = v24, 
            rightPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12)
        };
    end;
end;
v21.init = function(v30) --[[ Line: 110 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v9 (copy), v2 (copy), v20 (copy), v17 (copy), v16 (copy), v3 (copy), v6 (copy), v7 (copy)
    v30.toastProps = nil;
    v30.inputBoxRef = v4.createRef();
    local l_navigation_1 = v30.props.navigation;
    local v32 = l_navigation_1.getParam and l_navigation_1.getParam("conversationId", nil);
    v30.navigateToConversationOverlay = function() --[[ Line: 117 ]]
        -- upvalues: v9 (ref), v32 (copy), v30 (copy), l_navigation_1 (copy), v2 (ref)
        v9:info("Navigate To ConversationOverlay: {} from {screen}", v32);
        local v33 = v30.props.navigation.getParam and v30.props.navigation.getParam("conversationId", nil);
        l_navigation_1.navigate(v2.ConversationOverlay, {
            conversationId = v33, 
            isOverlay = true
        });
    end;
    v30.navigateToChatDetails = function() --[[ Line: 127 ]]
        -- upvalues: v30 (copy), v9 (ref), l_navigation_1 (copy), v2 (ref)
        local v34 = v30.props.navigation.getParam and v30.props.navigation.getParam("conversationId", nil);
        v9:info("Navigate To ChatDetails: {} from {screen}", v34);
        l_navigation_1.navigate(v2.ChatDetails, {
            conversationId = v34
        });
    end;
    if v20() or v17 then
        local v35 = l_navigation_1.getScreenProps("wideMode", false);
        local v36 = {
            navigateToChatDetails = v30.navigateToChatDetails, 
            conversationId = v32
        };
        if v20() then
            v36.backButtonEnabled = not v35;
            v36.isRoot = v35;
            v36.leftPaddingOverride = if v35 then l_navigation_1.getScreenProps("appChatInnerPadding", 12) else l_navigation_1.getScreenProps("appChatOuterPadding", 12);
            v36.rightPaddingOverride = l_navigation_1.getScreenProps("appChatOuterPadding", 12);
        end;
        v16(false).setScreenTopBar(v2.ChatConversation, v36);
    else
        local v37 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v37, "setScreenTopBar in screenProps");
        v37(v2.ChatConversation, {
            navigateToChatDetails = v30.navigateToChatDetails, 
            conversationId = v32
        });
    end;
    v30.queueNavigationToToast = function(v38) --[[ Line: 161 ]]
        -- upvalues: v30 (copy)
        if v30.props.navigation.isFocused() then
            v30.navigateToToast(v38);
            v30.toastProps = nil;
            return;
        else
            v30.toastProps = v38;
            return;
        end;
    end;
    v30.onDidFocus = function() --[[ Line: 171 ]]
        -- upvalues: v30 (copy)
        v30.setInputBarCloseCallback(v30.releaseFocus);
        if v30.toastProps then
            v30.navigateToToast(v30.toastProps);
            v30.toastProps = nil;
        end;
    end;
    v30.releaseFocus = function() --[[ Line: 180 ]]
        -- upvalues: v30 (copy)
        if v30.inputBoxRef and v30.inputBoxRef:getValue() then
            v30.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    v30.onWillBlur = function() --[[ Line: 186 ]]
        -- upvalues: v30 (copy)
        v30.releaseFocus();
        v30.setInputBarCloseCallback();
    end;
    v30.navigateToToast = function(v39) --[[ Line: 192 ]]
        -- upvalues: v9 (ref), v30 (copy), v2 (ref), v6 (ref)
        v9:info("Navigate To Toast from {screen}");
        v30.props.navigation.navigate(v2.RoactChatToast, v6.Dictionary.union(v39, {
            isOverlay = true
        }));
    end;
    v30.openViewProfile = function(v40) --[[ Line: 201 ]]
        -- upvalues: v30 (copy), v2 (ref), v9 (ref)
        local v41 = v30.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v41 then
            v9:info("Navigate To UserProfile from {screen}");
            v41(v40, {});
            return;
        else
            v9:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v30.openGameDetailsPage = function(v42, v43) --[[ Line: 213 ]]
        -- upvalues: v30 (copy), v2 (ref), v9 (ref)
        local v44 = v30.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.GameDetail];
        if v44 then
            v9:info("Navigate To GameDetail from " .. tostring(v43));
            v44(v42, v43);
            return;
        else
            v9:warning("GameDetail page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v30.navigateToChatConversation = function(v45) --[[ Line: 226 ]]
        -- upvalues: v9 (ref), v30 (copy), v2 (ref)
        v9:info("Navigate To Conversation: {} from {screen}", v45);
        v30.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v45
        });
    end;
    v30.navigateToScreen = function(v46, v47, v48) --[[ Line: 231 ]]
        -- upvalues: v9 (ref), v30 (copy), v6 (ref)
        v9:info("Navigate To Screen: {} from {screen}", v46);
        local l_navigation_2 = v30.props.navigation;
        local v50 = l_navigation_2 and l_navigation_2.getParam and l_navigation_2.getParam("conversationId", nil);
        if v47 then
            v30.props.navigation.navigate(v46, v6.Dictionary.union({
                conversationId = v50, 
                isOverlay = v48
            }, v47));
            return;
        else
            v30.props.navigation.navigate(v46, {
                conversationId = v50
            });
            return;
        end;
    end;
    v30.navigateBack = function() --[[ Line: 251 ]]
        -- upvalues: v30 (copy)
        if v30.props.navigation.isFocused() then
            v30.props.navigation.goBack();
        end;
    end;
    v30.navigateToChatLanding = function() --[[ Line: 257 ]]
        -- upvalues: v9 (ref), v30 (copy), v2 (ref)
        v9:info("Navigate To ChatLanding from {screen}");
        if v30.props.navigation.getScreenProps("wideMode", false) then
            v30.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v30.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
    v30.navigateToSquadLobby = function(v51) --[[ Line: 267 ]]
        -- upvalues: v9 (ref), v30 (copy), v2 (ref)
        v9:info("Navigate To SquadLobby from {screen}");
        v30.props.navigation.navigate(v2.SquadLobby, {
            conversationId = v51
        });
    end;
    v30.updateConversationTitle = function(v52) --[[ Line: 272 ]]
        -- upvalues: v20 (ref), v17 (ref), v16 (ref), v2 (ref), v30 (copy), v3 (ref)
        local v53 = {
            headerText = if v52 then {
                raw = v52, 
                shouldLocalize = false
            } else {
                raw = "CommonUI.Features.Label.Chat", 
                shouldLocalize = true
            }
        };
        if v20() or v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, v53);
            return;
        else
            local v54 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v54, "setScreenTopBar in screenProps");
            v54(v2.ChatConversation, v53);
            return;
        end;
    end;
    v30.setInputBarCloseCallback = function(v55) --[[ Line: 293 ]]
        -- upvalues: v17 (ref), v16 (ref), v2 (ref), v30 (copy), v3 (ref)
        if v17 then
            v16(false).setScreenTopBar(v2.ChatLanding, {
                closeInputBar = v55
            });
            return;
        else
            local v56 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v56, "setScreenTopBar in screenProps");
            v56(v2.ChatLanding, {
                closeInputBar = v55
            });
            return;
        end;
    end;
    v30.getReadingMessagesIsEnabled = function() --[[ Line: 303 ]]
        -- upvalues: v7 (ref), v30 (copy)
        return v7(v30.props.navigation);
    end;
    v30.updatePrivateConversationTopBar = function(v57) --[[ Line: 307 ]]
        -- upvalues: v20 (ref), v17 (ref), v16 (ref), v2 (ref), v30 (copy), v3 (ref)
        if v20() or v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                isPrivateConversation = v57
            });
            return;
        else
            local v58 = v30.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v58, "setScreenTopBar in screenProps");
            v58(v2.ChatConversation, {
                isPrivateConversation = v57
            });
            return;
        end;
    end;
end;
v21.didUpdate = function(v59, v60) --[[ Line: 319 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy), v17 (copy), v16 (copy), v2 (copy), v3 (copy)
    local v61 = v60.navigation and v60.navigation.getParam and v60.navigation.getParam("conversationId", nil);
    local v62 = v59.props.navigation and v59.props.navigation.getParam and v59.props.navigation.getParam("conversationId", nil);
    if v61 ~= v62 then
        if v20() or v17 then
            v16(false).setScreenTopBar(v2.ChatConversation, {
                conversationId = v62
            });
            return;
        else
            local v63 = v59.props.navigation.getScreenProps("setScreenTopBar", nil);
            v3.isNotNil(v63, "setScreenTopBar in screenProps");
            v63(v2.ChatConversation, {
                conversationId = v62
            });
        end;
    end;
end;
v21.render = function(v64) --[[ Line: 341 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v8 (copy)
    local v65 = v3.isNotNil(v64.props.navigation, "navigation in ChatConversationScreen");
    local v66 = v4.createElement(v5.NavigationEvents, {
        onDidFocus = v64.onDidFocus, 
        onWillBlur = v64.onWillBlur
    });
    local v67 = v65.getParam("conversationId", nil);
    local v68 = v67 and tostring(v67) or nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        container = v4.createElement(v8, {
            topBarHeight = v65.getScreenProps("topBarHeight", 0), 
            wideMode = v65.getScreenProps("wideMode", false), 
            openGameDetailsPage = v64.openGameDetailsPage, 
            getReadingMessagesIsEnabled = v64.getReadingMessagesIsEnabled, 
            conversationId = v68, 
            inputBoxRef = v64.inputBoxRef, 
            updateConversationTitle = v64.updateConversationTitle, 
            updatePrivateConversationTopBar = v64.updatePrivateConversationTopBar, 
            releaseInputBarFocus = v64.releaseFocus, 
            navigateBack = v64.navigateBack, 
            navigateToToast = v64.queueNavigationToToast, 
            openViewProfile = v64.openViewProfile, 
            navigateToChatConversation = v64.navigateToChatConversation, 
            navigateToChatLanding = v64.navigateToChatLanding, 
            navigateToScreen = v64.navigateToScreen, 
            navigateToSquadLobby = v64.navigateToSquadLobby, 
            navigateToConversationOverlay = v64.navigateToConversationOverlay, 
            navigation = v64.props.navigation
        }), 
        eventsAdapter = v66
    });
end;
v21.didMount = function(v69) --[[ Line: 381 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy), v20 (copy), v16 (copy), v2 (copy)
    v9:info("{screen} mounted");
    if v20() then
        local l_navigation_3 = v69.props.navigation;
        local v71 = l_navigation_3.getScreenProps("wideMode", false);
        v16(false).setScreenTopBar(v2.ChatConversation, {
            leftPaddingOverride = if v71 then l_navigation_3.getScreenProps("appChatInnerPadding", 12) else l_navigation_3.getScreenProps("appChatOuterPadding", 12), 
            rightPaddingOverride = l_navigation_3.getScreenProps("appChatOuterPadding", 12)
        });
    end;
end;
v21.willUnmount = function(_) --[[ Line: 395 ]] --[[ Name: willUnmount ]]
    -- upvalues: v20 (copy), v16 (copy), v2 (copy)
    if v20() then
        v16(false).clearScreenTopBar(v2.ChatConversation);
    end;
end;
return v21;