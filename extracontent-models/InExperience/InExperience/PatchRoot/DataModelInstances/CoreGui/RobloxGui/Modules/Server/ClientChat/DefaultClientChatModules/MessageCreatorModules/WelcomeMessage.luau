local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
pcall(function() --[[ Line: 12 ]]
    ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
CreateWelcomeMessageLabel = function(v4, v5) --[[ Line: 14 ]] --[[ Name: CreateWelcomeMessageLabel ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Util_0 (copy)
    local l_Message_0 = v4.Message;
    if ChatLocalization and ChatLocalization.LocalizeFormattedMessage then
        l_Message_0 = ChatLocalization:LocalizeFormattedMessage(l_Message_0);
    end;
    local v7 = v4.ExtraData or {};
    local v8 = v7.Font or l_ChatSettings_0.DefaultFont;
    local v9 = v7.FontSize or l_ChatSettings_0.ChatWindowTextSize;
    local v10 = v7.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v11 = v7.ChannelColor or v10;
    local l_l_Util_0_BaseMessage_0, v13 = l_Util_0:CreateBaseMessage(l_Message_0, v8, v9, v10);
    local v14 = nil;
    if v5 ~= v4.OriginalChannel then
        local l_OriginalChannel_0 = v4.OriginalChannel;
        if ChatLocalization.tryLocalize then
            l_OriginalChannel_0 = ChatLocalization:tryLocalize(v4.OriginalChannel);
        end;
        local v16 = string.format("{%s}", l_OriginalChannel_0);
        v14 = l_Util_0:AddChannelButtonToBaseMessage(v13, v11, v16, v4.OriginalChannel);
        local v17 = l_Util_0:GetNumberOfSpaces(v16, v8, v9) + 1;
        v13.Text = l_Util_0:CreateLeadingSpaces(v17) .. l_Util_0:SanitizeForRichText(l_Message_0);
    end;
    local function v19(v18) --[[ Line: 39 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v13 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v13, l_l_Util_0_BaseMessage_0, v18);
    end;
    local v20 = {
        [v13] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }
    };
    if v14 then
        v20[v14] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        };
    end;
    local l_l_Util_0_FadeFunctions_0, v22, v23 = l_Util_0:CreateFadeFunctions(v20);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v13, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = nil, 
        [l_Util_0.KEY_GET_HEIGHT] = v19, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v22, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v23
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeWelcome, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
};