local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v5 = nil;
pcall(function() --[[ Line: 14 ]]
    -- upvalues: v5 (ref)
    v5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v5 == nil then
    v5 = {};
end;
if not v5.FormatMessageToSend or not v5.LocalizeFormattedMessage then
    v5.FormatMessageToSend = function(_, _, v8) --[[ Line: 17 ]] --[[ Name: FormatMessageToSend ]]
        return v8;
    end;
end;
local v9 = {
    "\n", 
    "\r", 
    "\t", 
    "\v", 
    "\f"
};
if l_ChatSettings_0.DisallowedWhiteSpace then
    v9 = l_ChatSettings_0.DisallowedWhiteSpace;
end;
local function v11(v10) --[[ Line: 27 ]] --[[ Name: isMessageValidServer ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if v10:len() > l_ChatSettings_0.MaximumMessageLength * 6 then
        return false;
    elseif utf8.len(v10) == nil then
        return false;
    elseif utf8.len(utf8.nfcnormalize(v10)) > l_ChatSettings_0.MaximumMessageLength then
        return false;
    else
        return true;
    end;
end;
local function _(v12) --[[ Line: 47 ]] --[[ Name: CanUserChat ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy)
    if l_RunService_0:IsStudio() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
            -- upvalues: l_Chat_0 (ref), v12 (copy)
            return l_Chat_0:CanUserChatAsync(v12.UserId);
        end);
        return l_status_0 and l_result_0;
    end;
end;
return function(v16) --[[ Line: 57 ]] --[[ Name: Run ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy), v5 (ref), v11 (copy), v9 (ref), l_ChatConstants_0 (copy)
    v16:RegisterProcessCommandsFunction("message_validation", function(v17, v18, v19) --[[ Line: 58 ]] --[[ Name: ValidateChatFunction ]]
        -- upvalues: v16 (copy), l_RunService_0 (ref), l_Chat_0 (ref), v5 (ref), v11 (ref), v9 (ref)
        local l_v16_Speaker_0 = v16:GetSpeaker(v17);
        local l_l_v16_Speaker_0_Player_0 = l_v16_Speaker_0:GetPlayer();
        if not l_v16_Speaker_0 then
            return false;
        elseif not l_l_v16_Speaker_0_Player_0 then
            return false;
        elseif not l_RunService_0:IsStudio() and l_l_v16_Speaker_0_Player_0.UserId < 1 then
            return true;
        else
            local v22;
            if l_RunService_0:IsStudio() then
                v22 = true;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 51 ]]
                    -- upvalues: l_Chat_0 (ref), l_l_v16_Speaker_0_Player_0 (copy)
                    return l_Chat_0:CanUserChatAsync(l_l_v16_Speaker_0_Player_0.UserId);
                end);
                v22 = l_status_1 and l_result_1;
            end;
            if not v22 then
                l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), v19);
                return true;
            elseif not v11(v18) then
                l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), v19);
                return true;
            else
                for _, v26 in pairs(v9) do
                    if v18:find(v26) then
                        l_v16_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), v19);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, l_ChatConstants_0.VeryHighPriority);
end;