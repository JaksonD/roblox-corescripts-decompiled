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
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersContainer);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled);
local v15 = require(l_script_FirstAncestor_0.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer);
local v16 = if v13 then require(script.Parent.EditChatMembersContainer) else require(script.Parent.EditChatMembersContainerDeprecated);
local v17 = require(script.Parent.Logger);
local v18 = v5.PureComponent:extend("EditChatMembersScreen");
v18.defaultProps = {};
v18.navigationOptions = function() --[[ Line: 30 ]]
    -- upvalues: v8 (copy), v5 (copy), v9 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v12 (copy)
    return {
        headerText = {
            raw = v8.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Chat.Label.AddConnections" or "Feature.Chat.Label.AddFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 41 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v9 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref)
            return v5.createElement(v9, {
                screenName = v3.EditChatMembers, 
                render = function(v19) --[[ Line: 44 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref)
                    local v20 = v19.getScreenTopBar(v3.EditChatMembers);
                    v4.isType(v20, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.Add", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v21) --[[ Line: 52 ]]
                        -- upvalues: v12 (ref), v20 (copy)
                        return v12({
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
v18.init = function(v22) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v6 (copy), l_IXPService_0 (copy), v15 (copy), v17 (copy), v3 (copy), v11 (copy), v10 (copy), v4 (copy)
    v22.ixpSubscription = if v14 then v22.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 67 ]]
        -- upvalues: l_IXPService_0 (ref), v15 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v15);
    end) else nil;
    v22.navigateToConversation = function(v23) --[[ Line: 71 ]]
        -- upvalues: v17 (ref), v22 (copy), v3 (ref)
        v17:info("Navigate To Conversation: {} from {screen}", v23);
        v22.props.navigation.navigate(v3.ChatConversation, {
            conversationId = v23
        });
    end;
    v22.navigateToToast = function(v24) --[[ Line: 76 ]]
        -- upvalues: v17 (ref), v22 (copy), v3 (ref)
        v17:info("Navigate To Toast from {screen}");
        v22.props.navigation.navigate(v3.RoactChatToast, v24);
    end;
    v22.setSystemButtonActivated = function(v25) --[[ Line: 81 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v22 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonActivated = v25
            });
            return;
        else
            local v26 = v22.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v26, "setScreenTopBar in screenProps");
            v26(v3.EditChatMembers, {
                systemButtonActivated = v25
            });
            return;
        end;
    end;
    v22.setSystemButtonEnabled = function(v27) --[[ Line: 95 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v22 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonEnabled = v27
            });
            return;
        else
            local v28 = v22.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v28, "setScreenTopBar in screenProps");
            v28(v3.EditChatMembers, {
                systemButtonEnabled = v27
            });
            return;
        end;
    end;
end;
v18.render = function(v29) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v17 (copy), v5 (copy), v16 (copy)
    local v30 = v4.isNotNil(v29.props.navigation, "navigation in EditChatMembersScreen");
    local v31 = v30.getParam("conversation", nil);
    if not v31 then
        v17:warning("Conversation info required to open {screen}");
        return nil;
    else
        return v5.createElement(v16, {
            topBarHeight = v30.getScreenProps("topBarHeight", 0), 
            conversation = v31, 
            navigateToConversation = v29.navigateToConversation, 
            navigateToToast = v29.navigateToToast, 
            setSystemButtonActivated = v29.setSystemButtonActivated, 
            setSystemButtonEnabled = v29.setSystemButtonEnabled
        });
    end;
end;
v18.didMount = function(v32) --[[ Line: 129 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    v17:info("{screen} mounted");
    v32.setSystemButtonEnabled(false);
end;
v18.willUnmount = function(v33) --[[ Line: 134 ]] --[[ Name: willUnmount ]]
    -- upvalues: v14 (copy)
    if v14 then
        v33.ixpSubscription.remove();
    end;
end;
return v18;