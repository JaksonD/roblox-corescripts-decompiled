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
local v12 = game:DefineFastFlag("AppChatSwapHiddenMessageVisibilityAndPreviewContent", false);
local function v14(v13) --[[ Line: 23 ]] --[[ Name: getMessageContent ]]
    -- upvalues: v12 (copy), v10 (copy), v8 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v7 (copy), l_Url_0 (copy), l_GetFFlagEnableSocialCards_0 (copy)
    if v12 then
        if v13.previewContent then
            return v13.previewContent;
        elseif v10 and v13.visibility == v8.VisibilityTypes.Hidden then
            return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable");
        end;
    elseif v10 and v13.visibility == v8.VisibilityTypes.Hidden then
        return l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable");
    elseif v13.previewContent then
        return v13.previewContent;
    end;
    if v13.messageType == v7.Link then
        return l_Url_0.WWW_URL .. "games/" .. v13.gameLink.universeId;
    elseif l_GetFFlagEnableSocialCards_0() and v13.messageType == v7.System and v13.cards then
        return v13.cards[1] and v13.cards[1].alt_text;
    else
        return (tostring(v13.content));
    end;
end;
return function(v15) --[[ Line: 64 ]]
    -- upvalues: v3 (copy), v14 (copy), l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 (copy)
    local v16 = v3(v15, "messages.values");
    local l_previewMessageId_0 = v15.previewMessageId;
    if l_previewMessageId_0 and v16 and v16[l_previewMessageId_0] then
        return v14(v16[l_previewMessageId_0]);
    elseif l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 and v15.previewContent then
        return v15.previewContent;
    else
        return nil;
    end;
end;