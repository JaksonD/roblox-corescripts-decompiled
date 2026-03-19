local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.ChatDetailsContainer);
local v5 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v8 = v3.PureComponent:extend("ChatDetailsScreen");
v8.defaultProps = {
    navigation = nil
};
v8.navigationOptions = function() --[[ Line: 17 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        }
    };
end;
v8.init = function(v9) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v2 (copy)
    v9.navigateToEditChatMembers = function(v10) --[[ Line: 29 ]]
        -- upvalues: v5 (ref), v9 (copy), v2 (ref)
        v5:info("Navigate To EditChatMembers from {screen}");
        v9.props.navigation.navigate(v2.EditChatMembers, {
            conversation = v10
        });
    end;
    v9.navigateToToast = function(v11) --[[ Line: 34 ]]
        -- upvalues: v5 (ref), v9 (copy), v2 (ref)
        v5:info("Navigate To Toast from {screen}");
        v9.props.navigation.navigate(v2.RoactChatToast, v11);
    end;
    v9.navigateToDialog = function(v12, v13) --[[ Line: 39 ]]
        -- upvalues: v5 (ref), v9 (copy)
        v5:info("Navigate To {} from {screen}", v12);
        v9.props.navigation.navigate(v12, v13);
    end;
    v9.navigateBack = function() --[[ Line: 44 ]]
        -- upvalues: v9 (copy)
        if v9.props.navigation.isFocused() then
            v9.props.navigation.goBack();
        end;
    end;
    v9.navigateToConversation = function(v14) --[[ Line: 50 ]]
        -- upvalues: v5 (ref), v9 (copy), v2 (ref)
        v5:info("Navigate To Conversation from {screen}");
        v9.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v14
        });
    end;
    v9.navigateToChatLanding = function() --[[ Line: 55 ]]
        -- upvalues: v5 (ref), v9 (copy), v2 (ref)
        v5:info("Navigate To ChatLanding from {screen}");
        if v9.props.navigation.getScreenProps("wideMode", false) then
            v9.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v9.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
end;
v8.render = function(v15) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local l_navigation_0 = v15.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation");
    local v17 = l_navigation_0.getParam("conversationId", nil);
    if v17 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
            wideMode = l_navigation_0.getScreenProps("wideMode", false), 
            conversationId = v17, 
            navigateBack = v15.navigateBack, 
            navigateToEditChatMembers = v15.navigateToEditChatMembers, 
            navigateToDialog = v15.navigateToDialog, 
            navigateToToast = v15.navigateToToast, 
            navigateToConversation = v15.navigateToConversation, 
            navigateToChatLanding = v15.navigateToChatLanding
        });
    end;
end;
v8.didMount = function(_) --[[ Line: 89 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5:info("{screen} mounted");
end;
return v8;