local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_Parent_0.SharedFlags);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v8 = require(l_script_FirstAncestor_0.Models.MessageModel);
local l_GetFFlagEnableSocialCards_0 = v4.GetFFlagEnableSocialCards;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatExcludeSyntheticPreviewFromMessages;
local function v13(v12) --[[ Line: 21 ]] --[[ Name: getMessageContent ]]
    -- upvalues: v10 (copy), v8 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v7 (copy), l_Url_0 (copy), l_GetFFlagEnableSocialCards_0 (copy)
    if v10 and v12.visibility == v8.VisibilityTypes.Hidden then
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable");
    elseif v12.previewContent then
        return v12.previewContent;
    elseif v12.messageType == v7.Link then
        return l_Url_0.WWW_URL .. "games/" .. v12.gameLink.universeId;
    elseif l_GetFFlagEnableSocialCards_0() and v12.messageType == v7.System and v12.cards then
        return v12.cards[1] and v12.cards[1].alt_text;
    else
        return (tostring(v12.content));
    end;
end;
return function(v14) --[[ Line: 51 ]]
    -- upvalues: v3 (copy), v13 (copy), l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 (copy)
    local v15 = v3(v14, "messages.values");
    local l_previewMessageId_0 = v14.previewMessageId;
    if l_previewMessageId_0 and v15 and v15[l_previewMessageId_0] then
        return v13(v15[l_previewMessageId_0]);
    elseif l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 and v14.previewContent then
        return v14.previewContent;
    else
        return nil;
    end;
end;