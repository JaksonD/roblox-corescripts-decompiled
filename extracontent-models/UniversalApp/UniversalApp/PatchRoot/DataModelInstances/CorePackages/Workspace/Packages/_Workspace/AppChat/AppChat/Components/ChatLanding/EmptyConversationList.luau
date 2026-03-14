local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local v5 = require(script.Parent.ChatDisabledIndicator);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v8 = v1.PureComponent:extend("EmptyConversationList");
v8.defaultProps = {
    chatEnabled = false, 
    navigateToPrivacy = function() --[[ Line: 19 ]] --[[ Name: navigateToPrivacy ]]

    end, 
    makeFriendsToChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.MakeFriendsToParty" or "Feature.Chat.Message.MakeFriendsToChat", 
    privacyButtonKey = "Feature.Chat.Label.PrivacySettings", 
    turnOnChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.TurnOnParty" or "Feature.Chat.Message.TurnOnChat", 
    privacyButtonEnabled = true, 
    renameFriendsToConnections = true
};
local v9 = {
    makeFriendsToChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.MakeConnectionsToParty" or "Feature.Chat.Message.MakeConnectionsToChat", 
    turnOnChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.EnableParty" or "Feature.Chat.Message.EnableChat"
};
v8.didMount = function(v10) --[[ Line: 41 ]] --[[ Name: didMount ]]
    if v10.props.fireRenderEvent then
        v10.props.fireRenderEvent();
    end;
end;
v8.render = function(v11) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v1 (copy), v5 (copy)
    local l_makeFriendsToChatKey_0 = v11.props.makeFriendsToChatKey;
    local l_turnOnChatKey_0 = v11.props.turnOnChatKey;
    if v11.props.renameFriendsToConnections then
        l_makeFriendsToChatKey_0 = v9[l_makeFriendsToChatKey_0];
        l_turnOnChatKey_0 = v9[l_turnOnChatKey_0];
    end;
    return l_withLocalization_0({
        privacyButtonText = v11.props.privacyButtonKey, 
        chatDisabledText = v11.props.chatEnabled and l_makeFriendsToChatKey_0 or l_turnOnChatKey_0
    })(function(v14) --[[ Line: 57 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v5 (ref), v11 (copy)
        return l_withStyle_0(function(v15) --[[ Line: 58 ]]
            -- upvalues: v1 (ref), v5 (ref), v11 (ref), v14 (copy)
            return v1.createElement("Frame", {
                BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v15.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ChatDisabledIndicator = v1.createElement(v5, {
                    chatEnabled = v11.props.chatEnabled, 
                    navigateToPrivacy = v11.props.navigateToPrivacy, 
                    chatDisabledText = v14.chatDisabledText, 
                    privacyButtonText = v14.privacyButtonText, 
                    privacyButtonEnabled = v11.props.privacyButtonEnabled
                })
            });
        end);
    end);
end;
return l_UniversalAppPolicy_0.connect(function(v16) --[[ Line: 78 ]]
    return {
        renameFriendsToConnections = v16.getRenameFriendsToConnections()
    };
end)(v8);