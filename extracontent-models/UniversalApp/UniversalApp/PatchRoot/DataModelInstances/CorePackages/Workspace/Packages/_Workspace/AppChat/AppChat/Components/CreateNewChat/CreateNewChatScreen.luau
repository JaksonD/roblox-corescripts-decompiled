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
local v18 = v5.PureComponent:extend("CreateNewChatScreen");
v18.defaultProps = {};
v18.navigationOptions = function() --[[ Line: 28 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v5 (copy), v8 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v11 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Heading.PartyWithConnections" or "Feature.Chat.Heading.ChatWithConnections", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 39 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v8 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref)
            return v5.createElement(v8, {
                screenName = v3.CreateNewChat, 
                render = function(v19) --[[ Line: 42 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v11 (ref)
                    local v20 = v19.getScreenTopBar(v3.CreateNewChat);
                    v4.isType(v20, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v21) --[[ Line: 53 ]]
                        -- upvalues: v11 (ref), v20 (copy)
                        return v11({
                            localizedStrings = v21, 
                            isDisabled = not v20.systemButtonEnabled, 
                            onActivated = v20.systemButtonActivated
                        });
                    end);
                end
            });
        end
    };
end;
v18.init = function(v22) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v6 (copy), l_IXPService_0 (copy), v17 (copy), v13 (copy), v3 (copy), v10 (copy), v9 (copy), v4 (copy)
    v22.ixpSubscription = if v16 then v22.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 68 ]]
        -- upvalues: l_IXPService_0 (ref), v17 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v17);
    end) else nil;
    v22.navigateToConversation = function(v23) --[[ Line: 72 ]]
        -- upvalues: v22 (copy), v13 (ref), v3 (ref)
        local l_navigation_0 = v22.props.navigation;
        v13:info("Navigate To Conversation: {} from {screen}", v23);
        if l_navigation_0.getScreenProps("wideMode", false) then
            l_navigation_0.navigate(v3.ChatConversation, {
                conversationId = v23
            });
            return;
        else
            l_navigation_0.replace(v3.ChatConversation, {
                conversationId = v23
            });
            return;
        end;
    end;
    v22.navigateToToast = function(v25) --[[ Line: 83 ]]
        -- upvalues: v13 (ref), v22 (copy), v3 (ref)
        v13:info("Navigate To Toast from {screen}");
        v22.props.navigation.navigate(v3.RoactChatToast, v25);
    end;
    v22.setSystemButtonActivated = function(v26) --[[ Line: 88 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v22 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonActivated = v26
            });
            return;
        else
            local v27 = v22.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v27, "setScreenTopBar in screenProps");
            v27(v3.CreateNewChat, {
                systemButtonActivated = v26
            });
            return;
        end;
    end;
    v22.setSystemButtonEnabled = function(v28) --[[ Line: 102 ]]
        -- upvalues: v10 (ref), v9 (ref), v3 (ref), v22 (copy), v4 (ref)
        if v10 then
            v9(false).setScreenTopBar(v3.CreateNewChat, {
                systemButtonEnabled = v28
            });
            return;
        else
            local v29 = v22.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v29, "setScreenTopBar in screenProps");
            v29(v3.CreateNewChat, {
                systemButtonEnabled = v28
            });
            return;
        end;
    end;
end;
v18.render = function(v30) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v12 (copy)
    local v31 = v4.isNotNil(v30.props.navigation, "navigation in CreateNewChatScreen");
    return v5.createElement(v12, {
        topBarHeight = v31.getScreenProps("topBarHeight", 0), 
        navigateToConversation = v30.navigateToConversation, 
        navigateToToast = v30.navigateToToast, 
        setSystemButtonActivated = v30.setSystemButtonActivated, 
        setSystemButtonEnabled = v30.setSystemButtonEnabled
    });
end;
v18.didMount = function(v32) --[[ Line: 129 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    v13:info("{screen} mounted");
    v32.setSystemButtonEnabled(false);
end;
v18.willUnmount = function(v33) --[[ Line: 134 ]] --[[ Name: willUnmount ]]
    -- upvalues: v16 (copy)
    if v16 then
        v33.ixpSubscription.remove();
    end;
end;
return v18;