local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v6 = utf8.char(57344);
local v7 = nil;
pcall(function() --[[ Line: 22 ]]
    -- upvalues: v7 (ref)
    v7 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
IsPlayerVerified = function(v8) --[[ Line: 24 ]] --[[ Name: IsPlayerVerified ]]
    -- upvalues: l_Players_0 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v8);
    if not l_l_Players_0_PlayerByUserId_0 then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_l_Players_0_PlayerByUserId_0 (copy)
            return l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return false;
        end;
    end;
end;
AppendVerifiedBadge = function(v12) --[[ Line: 38 ]] --[[ Name: AppendVerifiedBadge ]]
    -- upvalues: v6 (copy)
    return v12 .. v6;
end;
CreateMessageLabel = function(v13, v14) --[[ Line: 42 ]] --[[ Name: CreateMessageLabel ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Util_0 (copy), l_LocalPlayer_0 (ref), v7 (ref)
    local l_FromSpeaker_0 = v13.FromSpeaker;
    local v16 = nil;
    v16 = if l_ChatSettings_0.PlayerDisplayNamesEnabled and v13.SpeakerDisplayName then v13.SpeakerDisplayName else l_FromSpeaker_0;
    local l_SpeakerUserId_0 = v13.SpeakerUserId;
    if IsPlayerVerified(l_SpeakerUserId_0) then
        v16 = AppendVerifiedBadge(v16);
    end;
    local _ = v13.Message;
    local v19 = v13.ExtraData or {};
    local v20 = v19.Font or l_ChatSettings_0.DefaultFont;
    local v21 = v19.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v22 = v19.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v23 = v19.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v24 = v19.ChannelColor or v23;
    local v25 = string.format("[%s]:", v16);
    local _ = l_Util_0:GetStringTextBounds(v25, v20, v21);
    local v27 = l_Util_0:GetNumberOfSpaces(v25, v20, v21) + 1;
    local l_l_Util_0_BaseMessage_0, v29 = l_Util_0:CreateBaseMessage("", v20, v21, v23);
    local v30 = l_Util_0:AddNameButtonToBaseMessage(v29, v22, v25, l_FromSpeaker_0);
    local v31 = nil;
    if v14 ~= v13.OriginalChannel then
        local l_OriginalChannel_0 = v13.OriginalChannel;
        if v13.FromSpeaker ~= l_LocalPlayer_0.Name then
            l_OriginalChannel_0 = string.format("From %s", v13.FromSpeaker);
        end;
        if v7.tryLocalize then
            l_OriginalChannel_0 = v7:tryLocalize(l_OriginalChannel_0);
        end;
        local v33 = string.format("{%s}", l_OriginalChannel_0);
        v31 = l_Util_0:AddChannelButtonToBaseMessage(v29, v24, v33, v13.OriginalChannel);
        v30.Position = UDim2.new(0, v31.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v20, v21).X, 0, 0);
        v27 = v27 + l_Util_0:GetNumberOfSpaces(v33, v20, v21) + 1;
    end;
    local function v36(v34) --[[ Line: 92 ]] --[[ Name: UpdateTextFunction ]]
        -- upvalues: v13 (copy), v29 (copy), l_Util_0 (ref), v27 (ref)
        if v13.IsFiltered then
            v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. l_Util_0:SanitizeForRichText(v34.Message);
            return;
        else
            local v35 = v34.MessageLengthUtf8 or v34.MessageLength;
            v29.Text = l_Util_0:CreateLeadingSpaces(v27) .. string.rep("_", v35);
            return;
        end;
    end;
    v36(v13);
    local function v38(v37) --[[ Line: 103 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v29 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v29, l_l_Util_0_BaseMessage_0, v37);
    end;
    local v39 = {
        [v30] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }, 
        [v29] = {
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
    if v31 then
        v39[v31] = {
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
    local l_l_Util_0_FadeFunctions_0, v41, v42 = l_Util_0:CreateFadeFunctions(v39);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v29, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v36, 
        [l_Util_0.KEY_GET_HEIGHT] = v38, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v41, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v42
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeWhisper, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};