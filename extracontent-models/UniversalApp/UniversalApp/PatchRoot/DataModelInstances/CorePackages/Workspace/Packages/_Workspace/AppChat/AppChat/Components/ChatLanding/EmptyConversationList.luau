local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local v5 = require(script.Parent.ChatDisabledIndicator);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v9 = v1.PureComponent:extend("EmptyConversationList");
v9.defaultProps = {
    chatEnabled = false, 
    navigateToPrivacy = function() --[[ Line: 20 ]] --[[ Name: navigateToPrivacy ]]

    end, 
    makeFriendsToChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.MakeFriendsToParty" or "Feature.Chat.Message.MakeFriendsToChat", 
    privacyButtonKey = "Feature.Chat.Label.PrivacySettings", 
    turnOnChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.TurnOnParty" or "Feature.Chat.Message.TurnOnChat", 
    privacyButtonEnabled = true, 
    renameFriendsToConnections = true
};
local v10 = {
    makeFriendsToChatKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.MakeConnectionsToParty" or "Feature.Chat.Message.MakeConnectionsToChat", 
    turnOnChatKey = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.EnableParty.FriendsRename" or "Feature.Chat.Message.EnableParty" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.EnableChat.FriendsRename" or "Feature.Chat.Message.EnableChat"
};
v9.didMount = function(v11) --[[ Line: 46 ]] --[[ Name: didMount ]]
    if v11.props.fireRenderEvent then
        v11.props.fireRenderEvent();
    end;
end;
v9.render = function(v12) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v1 (copy), v5 (copy)
    local l_makeFriendsToChatKey_0 = v12.props.makeFriendsToChatKey;
    local l_turnOnChatKey_0 = v12.props.turnOnChatKey;
    if v12.props.renameFriendsToConnections then
        l_makeFriendsToChatKey_0 = v10[l_makeFriendsToChatKey_0];
        l_turnOnChatKey_0 = v10[l_turnOnChatKey_0];
    end;
    return l_withLocalization_0({
        privacyButtonText = v12.props.privacyButtonKey, 
        chatDisabledText = v12.props.chatEnabled and l_makeFriendsToChatKey_0 or l_turnOnChatKey_0
    })(function(v15) --[[ Line: 62 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v5 (ref), v12 (copy)
        return l_withStyle_0(function(v16) --[[ Line: 63 ]]
            -- upvalues: v1 (ref), v5 (ref), v12 (ref), v15 (copy)
            return v1.createElement("Frame", {
                BackgroundColor3 = v16.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v16.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ChatDisabledIndicator = v1.createElement(v5, {
                    chatEnabled = v12.props.chatEnabled, 
                    navigateToPrivacy = v12.props.navigateToPrivacy, 
                    chatDisabledText = v15.chatDisabledText, 
                    privacyButtonText = v15.privacyButtonText, 
                    privacyButtonEnabled = v12.props.privacyButtonEnabled
                })
            });
        end);
    end);
end;
return l_UniversalAppPolicy_0.connect(function(v17) --[[ Line: 83 ]]
    return {
        renameFriendsToConnections = v17.getRenameFriendsToConnections()
    };
end)(v9);