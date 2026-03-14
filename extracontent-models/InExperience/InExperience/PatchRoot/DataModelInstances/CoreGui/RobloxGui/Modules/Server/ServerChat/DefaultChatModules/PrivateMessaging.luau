local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatModules_0 = l_Chat_0:WaitForChild("ChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v7 = require(l_ChatModules_0.Utility.DisplayNameHelpers);
local v8 = nil;
pcall(function() --[[ Line: 17 ]]
    -- upvalues: v8 (ref)
    v8 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v8 == nil then
    v8 = {};
end;
if not v8.FormatMessageToSend or not v8.LocalizeFormattedMessage then
    v8.FormatMessageToSend = function(_, _, v11) --[[ Line: 20 ]] --[[ Name: FormatMessageToSend ]]
        return v11;
    end;
end;
local v12 = {
    ChatColor = l_ChatSettings_0.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
local v13 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
    return UserSettings():IsUserFeatureEnabled("UserUseNewDirectChatAPI");
end);
if l_status_0 then
    v13 = l_result_0;
end;
l_status_0 = function() --[[ Line: 35 ]] --[[ Name: GetWhisperChannelPrefix ]]
    -- upvalues: l_ChatConstants_0 (copy)
    if l_ChatConstants_0.WhisperChannelPrefix then
        return l_ChatConstants_0.WhisperChannelPrefix;
    else
        return "To ";
    end;
end;
l_result_0 = function(v16) --[[ Line: 42 ]] --[[ Name: GetWhisperChannelId ]]
    -- upvalues: l_ChatConstants_0 (copy)
    return (if l_ChatConstants_0.WhisperChannelPrefix then l_ChatConstants_0.WhisperChannelPrefix else "To ") .. v16;
end;
return function(v17) --[[ Line: 46 ]] --[[ Name: Run ]]
    -- upvalues: l_RunService_0 (copy), v13 (ref), l_TextChatService_0 (copy), l_Chat_0 (copy), l_ChatSettings_0 (copy), v7 (copy), v8 (ref), v12 (copy), l_ChatConstants_0 (copy)
    local function v26(v18, v19) --[[ Line: 48 ]] --[[ Name: CanCommunicate ]]
        -- upvalues: l_RunService_0 (ref), v13 (ref), l_TextChatService_0 (ref), l_Chat_0 (ref)
        if l_RunService_0:IsStudio() then
            return true;
        else
            local l_v18_Player_0 = v18:GetPlayer();
            local l_v19_Player_0 = v19:GetPlayer();
            if l_v18_Player_0 and l_v19_Player_0 then
                if v13 then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 56 ]]
                        -- upvalues: l_TextChatService_0 (ref), l_v18_Player_0 (copy), l_v19_Player_0 (copy)
                        return l_TextChatService_0:CanUsersDirectChatAsync(l_v18_Player_0.UserId, {
                            l_v19_Player_0.UserId
                        });
                    end);
                    return l_status_1 and #l_result_1 > 0;
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 61 ]]
                        -- upvalues: l_Chat_0 (ref), l_v18_Player_0 (copy), l_v19_Player_0 (copy)
                        return l_Chat_0:CanUsersChatAsync(l_v18_Player_0.UserId, l_v19_Player_0.UserId);
                    end);
                    return l_status_2 and l_result_2;
                end;
            else
                return false;
            end;
        end;
    end;
    local function v44(v27, v28, v29) --[[ Line: 70 ]] --[[ Name: DoWhisperCommand ]]
        -- upvalues: v17 (copy), l_ChatSettings_0 (ref), v7 (ref), v8 (ref), v12 (ref), l_ChatConstants_0 (ref), v26 (copy)
        local l_v17_Speaker_0 = v17:GetSpeaker(v27);
        local l_v28_0 = v28;
        local v32 = nil;
        if string.sub(v28, 1, 1) == "\"" then
            local v33 = string.find(v28, "\"", 2);
            if v33 then
                l_v28_0 = string.sub(v28, 2, v33 - 1);
                v32 = string.sub(v28, v33 + 2);
            end;
        else
            local v34 = string.match(v28, "^[^%s]+");
            if v34 then
                l_v28_0 = v34;
                v32 = string.sub(v28, string.len(l_v28_0) + 2);
            end;
        end;
        local v35 = nil;
        local v36 = nil;
        if l_ChatSettings_0.PlayerDisplayNamesEnabled and l_ChatSettings_0.WhisperByDisplayNameEnabled then
            local v37, v38 = v7.getUserNameFromChattedName(l_v28_0, v27, l_v17_Speaker_0:GetNameForDisplay());
            v35 = v37;
            v36 = v38;
        else
            local v39, v40 = v7.getUserNameFromChattedName(l_v28_0, v27, nil);
            v35 = v39;
            v36 = v40;
        end;
        local l_v17_Speaker_1 = v17:GetSpeaker(v35);
        if v36 == v7.CommandErrorCodes.ChattingToSelf then
            l_v17_Speaker_0:SendSystemMessage(v8:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), v29, v12);
            return;
        elseif v36 == v7.CommandErrorCodes.NoMatches then
            l_v17_Speaker_0:SendSystemMessage(v8:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(l_v28_0))), "RBX_NAME", (tostring(v35))), v29, v12);
            return;
        elseif v36 == v7.CommandErrorCodes.MultipleMatches then
            local v42 = v7.getUsersWithDisplayNameString(l_v28_0, v27);
            l_v17_Speaker_0:SendSystemMessage(v8:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), v29, v12);
            l_v17_Speaker_0:SendSystemMessage(v42, v29, v12);
            return;
        else
            if l_v17_Speaker_1 then
                local l_v17_Channel_0 = v17:GetChannel((if l_ChatConstants_0.WhisperChannelPrefix then l_ChatConstants_0.WhisperChannelPrefix else "To ") .. v35);
                if l_v17_Channel_0 then
                    if not v26(l_v17_Speaker_0, l_v17_Speaker_1) then
                        l_v17_Speaker_0:SendSystemMessage(v8:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), v29, v12);
                        return;
                    else
                        if not l_v17_Speaker_0:IsInChannel(l_v17_Channel_0.Name) then
                            l_v17_Speaker_0:JoinChannel(l_v17_Channel_0.Name);
                        end;
                        if v32 and string.len(v32) > 0 then
                            l_v17_Speaker_0:SayMessage(v32, l_v17_Channel_0.Name);
                        end;
                        l_v17_Speaker_0:SetMainChannel(l_v17_Channel_0.Name);
                        return;
                    end;
                else
                    l_v17_Speaker_0:SendSystemMessage(v8:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(l_v28_0))), "RBX_NAME", (tostring(v35))), v29, v12);
                end;
            end;
            return;
        end;
    end;
    local function v49(v45, v46, v47) --[[ Line: 147 ]] --[[ Name: WhisperCommandsFunction ]]
        -- upvalues: v44 (copy)
        local v48 = false;
        if string.sub(v46, 1, 3):lower() == "/w " then
            v44(v45, string.sub(v46, 4), v47);
            return true;
        else
            if string.sub(v46, 1, 9):lower() == "/whisper " then
                v44(v45, string.sub(v46, 10), v47);
                v48 = true;
            end;
            return v48;
        end;
    end;
    local function v57(v50, v51, v52) --[[ Line: 163 ]] --[[ Name: PrivateMessageReplicationFunction ]]
        -- upvalues: v17 (copy), l_ChatConstants_0 (ref)
        local l_v17_Speaker_2 = v17:GetSpeaker(v50);
        local l_ExtraData_0 = l_v17_Speaker_2.ExtraData;
        l_v17_Speaker_2:SendMessage(v51, v52, v50, l_ExtraData_0);
        local l_v17_Speaker_3 = v17:GetSpeaker((string.sub(v52, 4)));
        local v56 = (if l_ChatConstants_0.WhisperChannelPrefix then l_ChatConstants_0.WhisperChannelPrefix else "To ") .. v50;
        if l_v17_Speaker_3 then
            if not l_v17_Speaker_3:IsInChannel(v56) then
                l_v17_Speaker_3:JoinChannel(v56);
            end;
            l_v17_Speaker_3:SendMessage(v51, v56, v50, l_ExtraData_0);
        end;
        return true;
    end;
    local function v61(_, v59, _) --[[ Line: 181 ]] --[[ Name: PrivateMessageAddTypeFunction ]]
        -- upvalues: l_ChatConstants_0 (ref)
        if l_ChatConstants_0.MessageTypeWhisper then
            v59.MessageType = l_ChatConstants_0.MessageTypeWhisper;
        end;
    end;
    v17:RegisterProcessCommandsFunction("whisper_commands", v49, l_ChatConstants_0.StandardPriority);
    local function _() --[[ Line: 189 ]] --[[ Name: GetWhisperChanneNameColor ]]
        -- upvalues: l_ChatSettings_0 (ref)
        if l_ChatSettings_0.WhisperChannelNameColor then
            return l_ChatSettings_0.WhisperChannelNameColor;
        else
            return Color3.fromRGB(102, 14, 102);
        end;
    end;
    v17.SpeakerAdded:connect(function(v63) --[[ Line: 196 ]]
        -- upvalues: v17 (copy), l_ChatSettings_0 (ref), l_ChatConstants_0 (ref), v8 (ref), v57 (copy), v61 (copy)
        local l_v17_Speaker_4 = v17:GetSpeaker(v63);
        local v65 = nil;
        v65 = if l_ChatSettings_0.PlayerDisplayNamesEnabled and l_v17_Speaker_4:GetPlayer() then l_v17_Speaker_4:GetNameForDisplay() .. "(@" .. v63 .. ")" else v63;
        local v66 = (if l_ChatConstants_0.WhisperChannelPrefix then l_ChatConstants_0.WhisperChannelPrefix else "To ") .. v63;
        if v17:GetChannel(v66) then
            v17:RemoveChannel(v66);
        end;
        local v67 = v17:AddChannel(v66);
        v67.Joinable = false;
        v67.Leavable = true;
        v67.AutoJoin = false;
        v67.Private = true;
        v67.WelcomeMessage = v8:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. v65 .. ".", "RBX_NAME", (tostring(v65)));
        v67.ChannelNameColor = if l_ChatSettings_0.WhisperChannelNameColor then l_ChatSettings_0.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102);
        v67:RegisterProcessCommandsFunction("replication_function", v57, l_ChatConstants_0.LowPriority);
        v67:RegisterFilterMessageFunction("message_type_function", v61);
    end);
    v17.SpeakerRemoved:connect(function(v68) --[[ Line: 228 ]]
        -- upvalues: l_ChatConstants_0 (ref), v17 (copy)
        local v69 = (if l_ChatConstants_0.WhisperChannelPrefix then l_ChatConstants_0.WhisperChannelPrefix else "To ") .. v68;
        if v17:GetChannel(v69) then
            v17:RemoveChannel(v69);
        end;
    end);
end;