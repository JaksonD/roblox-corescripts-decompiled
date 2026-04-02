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
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v18 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v19 = if v14 then require(script.Parent.EditChatMembersContainer) else require(script.Parent.EditChatMembersContainerDeprecated);
local v20 = require(script.Parent.Logger);
local v21 = v5.PureComponent:extend("EditChatMembersScreen");
v21.defaultProps = {};
v21.navigationOptions = function() --[[ Line: 33 ]]
    -- upvalues: l_FFlagConnectionsToFriendsRename_0 (copy), v8 (copy), v17 (copy), v18 (copy), v5 (copy), v9 (copy), v3 (copy), v4 (copy), l_withLocalization_0 (copy), v12 (copy)
    return {
        headerText = {
            raw = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.AddFriends" or v8.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Chat.Label.AddConnections" or "Feature.Chat.Label.AddFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        backButtonTestId = if v17 then v18.selectChatMembersTopBarActionButton("back") else nil, 
        renderRight = function() --[[ Line: 50 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v9 (ref), v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref), v17 (ref), v18 (ref)
            return v5.createElement(v9, {
                screenName = v3.EditChatMembers, 
                render = function(v22) --[[ Line: 53 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), v4 (ref), l_withLocalization_0 (ref), v12 (ref), v17 (ref), v18 (ref)
                    local v23 = v22.getScreenTopBar(v3.EditChatMembers);
                    v4.isType(v23, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.Add", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v24) --[[ Line: 61 ]]
                        -- upvalues: v12 (ref), v23 (copy), v17 (ref), v18 (ref)
                        return v12({
                            localizedStrings = v24, 
                            isDisabled = not v23.systemButtonEnabled, 
                            onActivated = v23.systemButtonActivated, 
                            testId = if v17 then v18.selectChatMembersTopBarActionButton("add") else nil
                        });
                    end);
                end
            });
        end
    };
end;
v21.init = function(v25) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v6 (copy), l_IXPService_0 (copy), v16 (copy), v20 (copy), v3 (copy), v11 (copy), v10 (copy), v4 (copy)
    v25.ixpSubscription = if v15 then v25.props.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 79 ]]
        -- upvalues: l_IXPService_0 (ref), v16 (ref)
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v16);
    end) else nil;
    v25.navigateToConversation = function(v26) --[[ Line: 83 ]]
        -- upvalues: v20 (ref), v25 (copy), v3 (ref)
        v20:info("Navigate To Conversation: {} from {screen}", v26);
        v25.props.navigation.navigate(v3.ChatConversation, {
            conversationId = v26
        });
    end;
    v25.navigateToToast = function(v27) --[[ Line: 88 ]]
        -- upvalues: v20 (ref), v25 (copy), v3 (ref)
        v20:info("Navigate To Toast from {screen}");
        v25.props.navigation.navigate(v3.RoactChatToast, v27);
    end;
    v25.setSystemButtonActivated = function(v28) --[[ Line: 93 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v25 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonActivated = v28
            });
            return;
        else
            local v29 = v25.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v29, "setScreenTopBar in screenProps");
            v29(v3.EditChatMembers, {
                systemButtonActivated = v28
            });
            return;
        end;
    end;
    v25.setSystemButtonEnabled = function(v30) --[[ Line: 107 ]]
        -- upvalues: v11 (ref), v10 (ref), v3 (ref), v25 (copy), v4 (ref)
        if v11 then
            v10(false).setScreenTopBar(v3.EditChatMembers, {
                systemButtonEnabled = v30
            });
            return;
        else
            local v31 = v25.props.navigation.getScreenProps("setScreenTopBar", nil);
            v4.isNotNil(v31, "setScreenTopBar in screenProps");
            v31(v3.EditChatMembers, {
                systemButtonEnabled = v30
            });
            return;
        end;
    end;
end;
v21.render = function(v32) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v20 (copy), v5 (copy), v19 (copy)
    local v33 = v4.isNotNil(v32.props.navigation, "navigation in EditChatMembersScreen");
    local v34 = v33.getParam("conversation", nil);
    if not v34 then
        v20:warning("Conversation info required to open {screen}");
        return nil;
    else
        return v5.createElement(v19, {
            topBarHeight = v33.getScreenProps("topBarHeight", 0), 
            conversation = v34, 
            navigateToConversation = v32.navigateToConversation, 
            navigateToToast = v32.navigateToToast, 
            setSystemButtonActivated = v32.setSystemButtonActivated, 
            setSystemButtonEnabled = v32.setSystemButtonEnabled
        });
    end;
end;
v21.didMount = function(v35) --[[ Line: 141 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    v20:info("{screen} mounted");
    v35.setSystemButtonEnabled(false);
end;
v21.willUnmount = function(v36) --[[ Line: 146 ]] --[[ Name: willUnmount ]]
    -- upvalues: v15 (copy)
    if v15 then
        v36.ixpSubscription.remove();
    end;
end;
return v21;