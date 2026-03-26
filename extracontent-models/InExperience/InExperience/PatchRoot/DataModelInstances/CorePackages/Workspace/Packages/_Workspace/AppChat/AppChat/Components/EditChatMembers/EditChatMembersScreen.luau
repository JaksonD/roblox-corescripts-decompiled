local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.RoactNavigation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v8 = require(l_Parent_0.UniversalAppPolicy);
local v9 = require(l_script_FirstAncestor_0.TopBarProvider);
local v10 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v12 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersContainer);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled);
local v16 = require(l_script_FirstAncestor_0.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer);
local v17 = if v14 then require(script.Parent.EditChatMembersContainer) else require(script.Parent.EditChatMembersContainerDeprecated);
local v18 = require(script.Parent.Logger);
local v19 = v5.PureComponent:extend("EditChatMembersScreen");
v19.defaultProps = {};
v19.navigationOptions = function() --[[ Line: 31 ]]
    -- upvalues: l_FFlagConnectionsToFriendsRename_0 (copy), v8 (copy), v5 (copy), v9 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v12 (copy)
    return {
        headerText = {
            raw = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.AddFriends" or v8.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Chat.Label.AddConnections" or "Feature.Chat.Label.AddFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 45 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v9 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref)
            return v5.createElement(v9, {
                screenName = v3.EditChatMembers, 
                render = function(v20) --[[ Line: 48 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref)
                    local v21 = v20.getScreenTopBar(v3.EditChatMembers);
                    v4.isType(v21, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.Add", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v22) --[[ Line: 56 ]]
                        -- upvalues: v12 (ref), v21 (copy)
                        return v12({
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
v19.init = function(v23) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v6 (copy), l_IXPService_0 (copy), v16 (copy), v18 (copy), v3 (copy), v11 (copy), v10 (copy), v4 (copy)
    v23.ixpSubscription = if v15 then v23.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 71 ]]
        -- upvalues: l_IXPService_0 (ref), v16 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v16);
    end) else nil;
    v23.navigateToConversation = function(v24) --[[ Line: 75 ]]
        -- upvalues: v18 (ref), v23 (copy), v3 (ref)
        v18:info("Navigate To Conversation: {} from {screen}", v24);
        v23.props.navigation.navigate(v3.ChatConversation, {
            conversationId = v24
        });
    end;
    v23.navigateToToast = function(v25) --[[ Line: 80 ]]
        -- upvalues: v18 (ref), v23 (copy), v3 (ref)
        v18:info("Navigate To Toast from {screen}");
        v23.props.navigation.navigate(v3.RoactChatToast, v25);
    end;
    v23.setSystemButtonActivated = function(v26) --[[ Line: 85 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v23 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonActivated = v26
            });
            return;
        else
            local v27 = v23.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v27, "setScreenTopBar in screenProps");
            v27(v3.EditChatMembers, {
                systemButtonActivated = v26
            });
            return;
        end;
    end;
    v23.setSystemButtonEnabled = function(v28) --[[ Line: 99 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v23 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonEnabled = v28
            });
            return;
        else
            local v29 = v23.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v29, "setScreenTopBar in screenProps");
            v29(v3.EditChatMembers, {
                systemButtonEnabled = v28
            });
            return;
        end;
    end;
end;
v19.render = function(v30) --[[ Line: 114 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v18 (copy), v5 (copy), v17 (copy)
    local v31 = v4.isNotNil(v30.props.navigation, "navigation in EditChatMembersScreen");
    local v32 = v31.getParam("conversation", nil);
    if not v32 then
        v18:warning("Conversation info required to open {screen}");
        return nil;
    else
        return v5.createElement(v17, {
            topBarHeight = v31.getScreenProps("topBarHeight", 0), 
            conversation = v32, 
            navigateToConversation = v30.navigateToConversation, 
            navigateToToast = v30.navigateToToast, 
            setSystemButtonActivated = v30.setSystemButtonActivated, 
            setSystemButtonEnabled = v30.setSystemButtonEnabled
        });
    end;
end;
v19.didMount = function(v33) --[[ Line: 133 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy)
    v18:info("{screen} mounted");
    v33.setSystemButtonEnabled(false);
end;
v19.willUnmount = function(v34) --[[ Line: 138 ]] --[[ Name: willUnmount ]]
    -- upvalues: v15 (copy)
    if v15 then
        v34.ixpSubscription.remove();
    end;
end;
return v19;