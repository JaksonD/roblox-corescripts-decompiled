local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.RoactNavigation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v8 = require(l_script_FirstAncestor_0.TopBarProvider);
local v9 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v11 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v12 = require(script.Parent.CreateNewChatContainer);
local v13 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled);
local v17 = require(l_script_FirstAncestor_0.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v19 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v21 = v5.PureComponent:extend("CreateNewChatScreen");
v21.defaultProps = {};
v21.navigationOptions = function() --[[ Line: 32 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v18 (copy), v19 (copy), v5 (copy), v8 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v11 (copy)
    return {
        headerText = {
            raw = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        backButtonTestId = if v18 then v19.selectChatMembersTopBarActionButton("back") else nil, 
        renderRight = function() --[[ Line: 48 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v8 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref), v18 (ref), v19 (ref)
            return v5.createElement(v8, {
                screenName = v3.CreateNewChat, 
                render = function(v22) --[[ Line: 51 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref), v18 (ref), v19 (ref)
                    local v23 = v22.getScreenTopBar(v3.CreateNewChat);
                    v4.isType(v23, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v24) --[[ Line: 62 ]]
                        -- upvalues: v11 (ref), v23 (copy), v18 (ref), v19 (ref)
                        return v11({
                            localizedStrings = v24, 
                            isDisabled = not v23.systemButtonEnabled, 
                            onActivated = v23.systemButtonActivated, 
                            testId = if v18 then v19.selectChatMembersTopBarActionButton("create") else nil
                        });
                    end);
                end
            });
        end
    };
end;
v21.init = function(v25) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v6 (copy), l_IXPService_0 (copy), v17 (copy), v13 (copy), v3 (copy), v10 (copy), v9 (copy), v4 (copy)
    v25.ixpSubscription = if v16 then v25.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 80 ]]
        -- upvalues: l_IXPService_0 (ref), v17 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v17);
    end) else nil;
    v25.navigateToConversation = function(v26) --[[ Line: 84 ]]
        -- upvalues: v25 (copy), v13 (ref), v3 (ref)
        local l_navigation_0 = v25.props.navigation;
        v13:info("Navigate To Conversation: {} from {screen}", v26);
        if l_navigation_0.getScreenProps("wideMode", false) then
            l_navigation_0.navigate(v3.ChatConversation, {
                conversationId = v26
            });
            return;
        else
            l_navigation_0.replace(v3.ChatConversation, {
                conversationId = v26
            });
            return;
        end;
    end;
    v25.navigateToToast = function(v28) --[[ Line: 95 ]]
        -- upvalues: v13 (ref), v25 (copy), v3 (ref)
        v13:info("Navigate To Toast from {screen}");
        v25.props.navigation.navigate(v3.RoactChatToast, v28);
    end;
    v25.setSystemButtonActivated = function(v29) --[[ Line: 100 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v25 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonActivated = v29
            });
            return;
        else
            local v30 = v25.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v30, "setScreenTopBar in screenProps");
            v30(v3.CreateNewChat, {
                systemButtonActivated = v29
            });
            return;
        end;
    end;
    v25.setSystemButtonEnabled = function(v31) --[[ Line: 114 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v25 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonEnabled = v31
            });
            return;
        else
            local v32 = v25.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v32, "setScreenTopBar in screenProps");
            v32(v3.CreateNewChat, {
                systemButtonEnabled = v31
            });
            return;
        end;
    end;
end;
v21.render = function(v33) --[[ Line: 129 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v12 (copy)
    local v34 = v4.isNotNil(v33.props.navigation, "navigation in CreateNewChatScreen");
    return v5.createElement(v12, {
        topBarHeight = v34.getScreenProps("topBarHeight", 0), 
        navigateToConversation = v33.navigateToConversation, 
        navigateToToast = v33.navigateToToast, 
        setSystemButtonActivated = v33.setSystemButtonActivated, 
        setSystemButtonEnabled = v33.setSystemButtonEnabled
    });
end;
v21.didMount = function(v35) --[[ Line: 141 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    v13:info("{screen} mounted");
    v35.setSystemButtonEnabled(false);
end;
v21.willUnmount = function(v36) --[[ Line: 146 ]] --[[ Name: willUnmount ]]
    -- upvalues: v16 (copy)
    if v16 then
        v36.ixpSubscription.remove();
    end;
end;
return v21;