local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v4 = nil;
pcall(function() --[[ Line: 12 ]]
    -- upvalues: v4 (ref)
    v4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
CreateSystemMessageLabel = function(v5, v6) --[[ Line: 14 ]] --[[ Name: CreateSystemMessageLabel ]]
    -- upvalues: v4 (ref), l_ChatSettings_0 (copy), l_Util_0 (copy)
    local l_Message_0 = v5.Message;
    if v4 and v4.LocalizeFormattedMessage then
        l_Message_0 = v4:LocalizeFormattedMessage(l_Message_0);
    end;
    local v8 = v5.ExtraData or {};
    local v9 = v8.Font or l_ChatSettings_0.DefaultFont;
    local v10 = v8.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v11 = v8.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v12 = v8.ChannelColor or v11;
    local l_l_Util_0_BaseMessage_0, v14 = l_Util_0:CreateBaseMessage(l_Message_0, v9, v10, v11);
    v14.AutoLocalize = true;
    local v15 = nil;
    if v6 ~= v5.OriginalChannel then
        local v16 = nil;
        if v4 and v5.OriginalChannel == "System" then
            local v17 = v4:Get("InGame.Chat.Label.SystemMessagePrefix", "System");
            v16 = string.format("{%s}", v17);
        elseif v4 and v5.OriginalChannel == "Team" then
            local v18 = v4:Get("InGame.Chat.Label.TeamMessagePrefix", "System");
            v16 = string.format("{%s}", v18);
        else
            v16 = string.format("{%s}", v5.OriginalChannel);
        end;
        v15 = l_Util_0:AddChannelButtonToBaseMessage(v14, v12, v16, v5.OriginalChannel);
        local v19 = l_Util_0:GetNumberOfSpaces(v16, v9, v10) + 1;
        v14.Text = l_Util_0:CreateLeadingSpaces(v19) .. l_Util_0:SanitizeForRichText(l_Message_0);
    end;
    local function v21(v20) --[[ Line: 45 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v14 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v14, l_l_Util_0_BaseMessage_0, v20);
    end;
    local v22 = {
        [v14] = {
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
    if v15 then
        v22[v15] = {
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
    local l_l_Util_0_FadeFunctions_0, v24, v25 = l_Util_0:CreateFadeFunctions(v22);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v14, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = nil, 
        [l_Util_0.KEY_GET_HEIGHT] = v21, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v24, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v25
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeSystem, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
};