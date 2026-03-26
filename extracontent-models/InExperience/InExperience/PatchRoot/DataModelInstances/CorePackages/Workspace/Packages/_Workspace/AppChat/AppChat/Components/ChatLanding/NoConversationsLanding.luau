local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v7 = {
    friends = {
        icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png", 
        copy = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.MakeFriendsToParty" or "Feature.Chat.Message.MakeConnectionsToParty" else "Feature.Chat.Message.MakeConnectionsToChat", 
        cta = l_FFlagConnectionsToFriendsRename_0 and "Feature.SettingsHub.Label.NoFriendsScreen" or "Feature.SettingsHub.Label.NoConnectionsScreen"
    }, 
    regional = {
        icon = "icons/status/oof_xlarge", 
        copy = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.PartyUnavailableRegion" or "Feature.Chat.Message.ChatUnavailableRegion", 
        cta = nil
    }, 
    privacy = {
        icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png", 
        copy = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.EnableParty.FriendsRename" or "Feature.Chat.Message.EnableParty" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.EnableChat.FriendsRename" or "Feature.Chat.Message.EnableChat", 
        cta = "Feature.Chat.Label.PrivacySettings"
    }, 
    thirdParty = {
        icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png", 
        copy = "Feature.Chat.Message.ChatIsDisabledByPrivacySetting", 
        cta = nil
    }, 
    fallback = {
        icon = "icons/status/oof_xlarge", 
        copy = "CommonUI.Messages.Response.PageError", 
        cta = nil
    }
};
local function _(v8) --[[ Line: 73 ]] --[[ Name: getEmptyStateFromProps ]]
    if v8.chatEnabled then
        return "friends";
    elseif not v8.globalRulesEnabled then
        return "regional";
    elseif not v8.privacySettingsEnabled then
        return "privacy";
    elseif not v8.thirdPartyPrivacySettingsEnabled then
        return "thirdParty";
    else
        return "fallback";
    end;
end;
return function(v10) --[[ Line: 88 ]] --[[ Name: NoConversationsLanding ]]
    -- upvalues: v7 (copy), l_useLocalization_0 (copy), v1 (copy), v3 (copy)
    local v11 = v10.chatEnabled and "friends" or if v10.globalRulesEnabled then if v10.privacySettingsEnabled then v10.thirdPartyPrivacySettingsEnabled and "fallback" or "thirdParty" else "privacy" else "regional";
    local v12 = v7[v11];
    local v13 = v12.cta ~= nil;
    if v11 == "friends" and not v10.canNavigateToAddFriends then
        v13 = false;
    elseif v11 == "privacy" and not v10.canNavigateToPrivacySettings then
        v13 = false;
    end;
    local v14 = l_useLocalization_0({
        callToAction = v12.cta or "Feature.Chat.Label.PrivacySettings", 
        copy = v12.copy
    });
    v1.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v10 (copy), v11 (copy)
        if v10.fireRenderEvent then
            v10.fireRenderEvent(v11);
        end;
    end, {
        v10.fireRenderEvent, 
        v11
    });
    return v1.createElement(v3.Empty, {
        icon = {
            name = v12.icon, 
            size = "XLarge"
        }, 
        text = v14.copy, 
        button = if v13 then {
            text = v14.callToAction, 
            icon = "icons/navigation/externallink_medium", 
            onActivated = function() --[[ Line: 119 ]] --[[ Name: onActivated ]]
                -- upvalues: v10 (copy), v11 (copy)
                v10.onCallToAction(v11);
            end
        } else nil
    });
end;