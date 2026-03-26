local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.ChatDetailsContainer);
local v5 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v9 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v10 = v3.PureComponent:extend("ChatDetailsScreen");
v10.defaultProps = {
    navigation = nil
};
v10.navigationOptions = function() --[[ Line: 19 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v8 (copy), v9 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        }, 
        backButtonTestId = if v8 then v9.chatDetailsTopBarActionButton("back") else nil
    };
end;
v10.init = function(v11) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v2 (copy)
    v11.navigateToEditChatMembers = function(v12) --[[ Line: 34 ]]
        -- upvalues: v5 (ref), v11 (copy), v2 (ref)
        v5:info("Navigate To EditChatMembers from {screen}");
        v11.props.navigation.navigate(v2.EditChatMembers, {
            conversation = v12
        });
    end;
    v11.navigateToToast = function(v13) --[[ Line: 39 ]]
        -- upvalues: v5 (ref), v11 (copy), v2 (ref)
        v5:info("Navigate To Toast from {screen}");
        v11.props.navigation.navigate(v2.RoactChatToast, v13);
    end;
    v11.navigateToDialog = function(v14, v15) --[[ Line: 44 ]]
        -- upvalues: v5 (ref), v11 (copy)
        v5:info("Navigate To {} from {screen}", v14);
        v11.props.navigation.navigate(v14, v15);
    end;
    v11.navigateBack = function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy)
        if v11.props.navigation.isFocused() then
            v11.props.navigation.goBack();
        end;
    end;
    v11.navigateToConversation = function(v16) --[[ Line: 55 ]]
        -- upvalues: v5 (ref), v11 (copy), v2 (ref)
        v5:info("Navigate To Conversation from {screen}");
        v11.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v16
        });
    end;
    v11.navigateToChatLanding = function() --[[ Line: 60 ]]
        -- upvalues: v5 (ref), v11 (copy), v2 (ref)
        v5:info("Navigate To ChatLanding from {screen}");
        if v11.props.navigation.getScreenProps("wideMode", false) then
            v11.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v11.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
end;
v10.render = function(v17) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local l_navigation_0 = v17.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation");
    local v19 = l_navigation_0.getParam("conversationId", nil);
    if v19 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
            wideMode = l_navigation_0.getScreenProps("wideMode", false), 
            conversationId = v19, 
            navigateBack = v17.navigateBack, 
            navigateToEditChatMembers = v17.navigateToEditChatMembers, 
            navigateToDialog = v17.navigateToDialog, 
            navigateToToast = v17.navigateToToast, 
            navigateToConversation = v17.navigateToConversation, 
            navigateToChatLanding = v17.navigateToChatLanding
        });
    end;
end;
v10.didMount = function(_) --[[ Line: 94 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5:info("{screen} mounted");
end;
return v10;