local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateSetCoreMessageLabel = function(v4, _) --[[ Line: 11 ]] --[[ Name: CreateSetCoreMessageLabel ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Util_0 (copy)
    local l_Message_0 = v4.Message;
    local v7 = v4.ExtraData or {};
    local v8 = v7.Font or l_ChatSettings_0.DefaultFont;
    local v9 = v7.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v10 = v7.Color or l_ChatSettings_0.DefaultMessageColor;
    local l_l_Util_0_BaseMessage_0, v12 = l_Util_0:CreateBaseMessage(l_Message_0, v8, v9, v10);
    local function v14(v13) --[[ Line: 20 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v12 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v12, l_l_Util_0_BaseMessage_0, v13);
    end;
    local v15 = {
        [v12] = {
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
    local l_l_Util_0_FadeFunctions_0, v17, v18 = l_Util_0:CreateFadeFunctions(v15);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v12, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = nil, 
        [l_Util_0.KEY_GET_HEIGHT] = v14, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v17, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v18
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeSetCore, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
};