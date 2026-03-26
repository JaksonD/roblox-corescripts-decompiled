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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v19 = v5.PureComponent:extend("CreateNewChatScreen");
v19.defaultProps = {};
v19.navigationOptions = function() --[[ Line: 30 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v5 (copy), v8 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v11 (copy)
    return {
        headerText = {
            raw = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 43 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v8 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref)
            return v5.createElement(v8, {
                screenName = v3.CreateNewChat, 
                render = function(v20) --[[ Line: 46 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref)
                    local v21 = v20.getScreenTopBar(v3.CreateNewChat);
                    v4.isType(v21, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v22) --[[ Line: 57 ]]
                        -- upvalues: v11 (ref), v21 (copy)
                        return v11({
                            localizedStrings = v22, 
                            isDisabled = not v21.systemButtonEnabled, 
                            onActivated = v21.systemButtonActivated
                        });
                    end);
                end
            });
        end
    };
end;
v19.init = function(v23) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v6 (copy), l_IXPService_0 (copy), v17 (copy), v13 (copy), v3 (copy), v10 (copy), v9 (copy), v4 (copy)
    v23.ixpSubscription = if v16 then v23.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 72 ]]
        -- upvalues: l_IXPService_0 (ref), v17 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v17);
    end) else nil;
    v23.navigateToConversation = function(v24) --[[ Line: 76 ]]
        -- upvalues: v23 (copy), v13 (ref), v3 (ref)
        local l_navigation_0 = v23.props.navigation;
        v13:info("Navigate To Conversation: {} from {screen}", v24);
        if l_navigation_0.getScreenProps("wideMode", false) then
            l_navigation_0.navigate(v3.ChatConversation, {
                conversationId = v24
            });
            return;
        else
            l_navigation_0.replace(v3.ChatConversation, {
                conversationId = v24
            });
            return;
        end;
    end;
    v23.navigateToToast = function(v26) --[[ Line: 87 ]]
        -- upvalues: v13 (ref), v23 (copy), v3 (ref)
        v13:info("Navigate To Toast from {screen}");
        v23.props.navigation.navigate(v3.RoactChatToast, v26);
    end;
    v23.setSystemButtonActivated = function(v27) --[[ Line: 92 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v23 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonActivated = v27
            });
            return;
        else
            local v28 = v23.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v28, "setScreenTopBar in screenProps");
            v28(v3.CreateNewChat, {
                systemButtonActivated = v27
            });
            return;
        end;
    end;
    v23.setSystemButtonEnabled = function(v29) --[[ Line: 106 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v23 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonEnabled = v29
            });
            return;
        else
            local v30 = v23.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v30, "setScreenTopBar in screenProps");
            v30(v3.CreateNewChat, {
                systemButtonEnabled = v29
            });
            return;
        end;
    end;
end;
v19.render = function(v31) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v12 (copy)
    local v32 = v4.isNotNil(v31.props.navigation, "navigation in CreateNewChatScreen");
    return v5.createElement(v12, {
        topBarHeight = v32.getScreenProps("topBarHeight", 0), 
        navigateToConversation = v31.navigateToConversation, 
        navigateToToast = v31.navigateToToast, 
        setSystemButtonActivated = v31.setSystemButtonActivated, 
        setSystemButtonEnabled = v31.setSystemButtonEnabled
    });
end;
v19.didMount = function(v33) --[[ Line: 133 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    v13:info("{screen} mounted");
    v33.setSystemButtonEnabled(false);
end;
v19.willUnmount = function(v34) --[[ Line: 138 ]] --[[ Name: willUnmount ]]
    -- upvalues: v16 (copy)
    if v16 then
        v34.ixpSubscription.remove();
    end;
end;
return v19;