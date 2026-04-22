local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.ChatDetailsContainer);
local v5 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v9 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v11 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v12 = v3.PureComponent:extend("ChatDetailsScreen");
v12.defaultProps = {
    navigation = nil
};
v12.navigationOptions = function() --[[ Line: 21 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v8 (copy), v9 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        }, 
        backButtonTestId = if v8 then v9.chatDetailsTopBarActionButton("back") else nil
    };
end;
v12.init = function(v13) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v2 (copy)
    v13.navigateToEditChatMembers = function(v14) --[[ Line: 36 ]]
        -- upvalues: v5 (ref), v13 (copy), v2 (ref)
        v5:info("Navigate To EditChatMembers from {screen}");
        v13.props.navigation.navigate(v2.EditChatMembers, {
            conversation = v14
        });
    end;
    v13.navigateToToast = function(v15) --[[ Line: 41 ]]
        -- upvalues: v5 (ref), v13 (copy), v2 (ref)
        v5:info("Navigate To Toast from {screen}");
        v13.props.navigation.navigate(v2.RoactChatToast, v15);
    end;
    v13.navigateToDialog = function(v16, v17) --[[ Line: 46 ]]
        -- upvalues: v5 (ref), v13 (copy)
        v5:info("Navigate To {} from {screen}", v16);
        v13.props.navigation.navigate(v16, v17);
    end;
    v13.navigateBack = function() --[[ Line: 51 ]]
        -- upvalues: v13 (copy)
        if v13.props.navigation.isFocused() then
            v13.props.navigation.goBack();
        end;
    end;
    v13.navigateToConversation = function(v18) --[[ Line: 57 ]]
        -- upvalues: v5 (ref), v13 (copy), v2 (ref)
        v5:info("Navigate To Conversation from {screen}");
        v13.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v18
        });
    end;
    v13.navigateToChatLanding = function() --[[ Line: 62 ]]
        -- upvalues: v5 (ref), v13 (copy), v2 (ref)
        v5:info("Navigate To ChatLanding from {screen}");
        if v13.props.navigation.getScreenProps("wideMode", false) then
            v13.props.navigation.navigate(v2.EmptyConversation);
            return;
        else
            v13.props.navigation.navigate(v2.ChatLanding);
            return;
        end;
    end;
end;
v12.render = function(v19) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local l_navigation_0 = v19.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation");
    local v21 = l_navigation_0.getParam("conversationId", nil);
    if v21 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
            wideMode = l_navigation_0.getScreenProps("wideMode", false), 
            conversationId = v21, 
            navigateBack = v19.navigateBack, 
            navigateToEditChatMembers = v19.navigateToEditChatMembers, 
            navigateToDialog = v19.navigateToDialog, 
            navigateToToast = v19.navigateToToast, 
            navigateToConversation = v19.navigateToConversation, 
            navigateToChatLanding = v19.navigateToChatLanding
        });
    end;
end;
v12.didMount = function(_) --[[ Line: 96 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy), v10 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v11 (copy), v2 (copy)
    v5:info("{screen} mounted");
    if v10() then
        local v23 = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
            raw = "Feature.Chat.Label.Details", 
            shouldLocalize = true
        } else {
            raw = "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        };
        v11(false).setScreenTopBar(v2.ChatDetails, {
            headerText = v23, 
            backButtonEnabled = true
        });
    end;
end;
return v12;