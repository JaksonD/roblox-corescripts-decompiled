local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateMeCommandMessageLabel = function(v4, v5) --[[ Line: 11 ]] --[[ Name: CreateMeCommandMessageLabel ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Util_0 (copy)
    local _ = v4.Message;
    local v7 = v4.ExtraData or {};
    local v8 = v7.Font or Enum.Font.SourceSansItalic;
    local v9 = v7.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v10 = Color3.new(1, 1, 1);
    local v11 = v7.ChannelColor or v10;
    local v12 = 0;
    local l_l_Util_0_BaseMessage_0, v14 = l_Util_0:CreateBaseMessage("", v8, v9, v10);
    local v15 = nil;
    if v5 ~= v4.OriginalChannel then
        local v16 = string.format("{%s}", v4.OriginalChannel);
        v15 = l_Util_0:AddChannelButtonToBaseMessage(v14, v11, v16, v4.OriginalChannel);
        v12 = l_Util_0:GetNumberOfSpaces(v16, v8, v9) + 1;
    end;
    local function v20(v17) --[[ Line: 29 ]] --[[ Name: UpdateTextFunction ]]
        -- upvalues: v4 (copy), v14 (copy), l_Util_0 (ref), v12 (ref)
        if v4.IsFiltered then
            v14.Text = l_Util_0:CreateLeadingSpaces(v12) .. l_Util_0:SanitizeForRichText(v17.FromSpeaker .. " " .. string.sub(v17.Message, 5));
            return;
        else
            local v18 = v17.MessageLengthUtf8 or v17.MessageLength;
            local v19 = utf8.len(utf8.nfcnormalize(v17.FromSpeaker)) + v18 - 4;
            v14.Text = l_Util_0:CreateLeadingSpaces(v12) .. string.rep("_", v19);
            return;
        end;
    end;
    v20(v4);
    local function v22(v21) --[[ Line: 41 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v14 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v14, l_l_Util_0_BaseMessage_0, v21);
    end;
    local v23 = {
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
        v23[v15] = {
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
    local l_l_Util_0_FadeFunctions_0, v25, v26 = l_Util_0:CreateFadeFunctions(v23);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v14, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v20, 
        [l_Util_0.KEY_GET_HEIGHT] = v22, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v25, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v26
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeMeCommand, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
};