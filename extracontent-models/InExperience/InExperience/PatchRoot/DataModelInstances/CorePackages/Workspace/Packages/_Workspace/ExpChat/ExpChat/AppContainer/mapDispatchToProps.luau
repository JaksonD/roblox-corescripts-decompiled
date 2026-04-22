local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v4 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v5 = require(l_script_FirstAncestor_0.runGlobalChatCommand);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local v9 = require(l_Parent_0.ExpChatShared);
local l_Analytics_0 = v9.Analytics;
local v11 = require(script.Parent.Logger);
local v12 = require(l_script_FirstAncestor_0.Config);
local l_autoCastCommand_0 = v9.Commands.autoCastCommand;
local l_RBXWhisperCommand_0 = v9.Commands.Whisper.RBXWhisperCommand;
local l_ChatInputBarResetTargetChannel_0 = v9.Actions.ChatInputBarResetTargetChannel;
local v16 = require(l_script_FirstAncestor_0.Actions.ChatTranslationGlobalToggled);
local v17 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
return function(v19) --[[ Line: 27 ]]
    -- upvalues: l_Players_0 (copy), l_autoCastCommand_0 (copy), l_RBXWhisperCommand_0 (copy), v7 (copy), v11 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v4 (copy), v16 (copy), l_Analytics_0 (copy), v17 (copy), l_ChatInputBarResetTargetChannel_0 (copy), v3 (copy), l_TextChatService_0 (copy), l_List_0 (copy), v12 (copy), v5 (copy)
    return {
        activateWhisperMode = function(v20) --[[ Line: 29 ]] --[[ Name: activateWhisperMode ]]
            -- upvalues: l_Players_0 (ref), l_autoCastCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v7 (ref), v11 (ref)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v20);
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if not l_l_Players_0_PlayerByUserId_0 then
                return;
            elseif l_l_Players_0_PlayerByUserId_0 == l_LocalPlayer_0 then
                return;
            else
                assert(l_LocalPlayer_0, "Players.LocalPlayer should be non-nil");
                local l_Name_0 = l_l_Players_0_PlayerByUserId_0.Name;
                local v24 = {
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_LocalPlayer_0.UserId, "/w @" .. l_Name_0)
                };
                v7.any(v24):catch(function(v25) --[[ Line: 45 ]]
                    -- upvalues: v11 (ref)
                    v11:debug("Could not send autoCastCommand. Error: {}", v25);
                end);
                return;
            end;
        end, 
        onToggleTranslation = function(v26) --[[ Line: 50 ]] --[[ Name: onToggleTranslation ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v4 (ref), v19 (copy), v16 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v4(false).toggleGlobalTranslation(v26);
                return;
            else
                v19(v16(v26));
                return;
            end;
        end, 
        onToggleIndividualTranslation = function(v27, v28) --[[ Line: 59 ]] --[[ Name: onToggleIndividualTranslation ]]
            -- upvalues: l_Players_0 (ref), l_Analytics_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v4 (ref), v19 (copy), v17 (ref)
            local v29 = {
                useTranslation = v27, 
                senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                localeId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.LocaleId else nil
            };
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageTranslationToggled", v29);
            if l_FFlagExpChatUseMessagesStore_0 then
                v4(false).toggleMessageTranslation(v27, v28);
                return;
            else
                v19(v17(v27, v28));
                return;
            end;
        end, 
        resetTargetChannel = function() --[[ Line: 76 ]] --[[ Name: resetTargetChannel ]]
            -- upvalues: v19 (copy), l_ChatInputBarResetTargetChannel_0 (ref)
            v19(l_ChatInputBarResetTargetChannel_0());
        end, 
        onHovered = function() --[[ Line: 80 ]] --[[ Name: onHovered ]]
            -- upvalues: v3 (ref)
            v3(false).resetAllTransparency();
        end, 
        onUnhovered = function() --[[ Line: 84 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v3 (ref)
            v3(false).resetAllTransparency();
        end, 
        onSendChat = function(v30) --[[ Line: 88 ]] --[[ Name: onSendChat ]]
            -- upvalues: l_TextChatService_0 (ref), v11 (ref), v7 (ref), l_List_0 (ref), l_Players_0 (ref), v12 (ref), l_Analytics_0 (ref)
            local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v32 = nil;
            if l_ChatInputBarConfiguration_0 then
                v32 = l_ChatInputBarConfiguration_0.TargetTextChannel;
            end;
            v11:debug("onSendChat: {} to {}", v30, if v32 then v32.Name else "nil");
            if v32 then
                v7.try(function() --[[ Line: 97 ]]
                    -- upvalues: v32 (ref), v30 (copy), l_List_0 (ref), l_Players_0 (ref), v12 (ref), l_Analytics_0 (ref)
                    v32:SendAsync(v30);
                    local v34 = l_List_0.count(v32:GetChildren(), function(v33) --[[ Line: 100 ]]
                        return v33:IsA("TextSource");
                    end);
                    local v35 = {
                        channelName = v32.Name, 
                        senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                        numParticipants = v34, 
                        isDefaultChannel = v12[v32.Name] and "true" or "false"
                    };
                    l_Analytics_0.FireClientAnalyticsWithEventName("LuaMessageSent", v35);
                end):catch(function(v36) --[[ Line: 112 ]]
                    warn(v36.error);
                end);
            else
                v11:warning("TargetTextChannel was nil!");
            end;
        end, 
        onSendGlobalChat = function(v37) --[[ Line: 120 ]] --[[ Name: onSendGlobalChat ]]
            -- upvalues: v5 (ref), l_Players_0 (ref), v7 (ref), l_TextChatService_0 (ref)
            if string.sub(v37, 1, 1) == "/" and v5(v37, l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0) then
                return;
            else
                v7.try(function() --[[ Line: 127 ]]
                    -- upvalues: l_TextChatService_0 (ref), v37 (copy)
                    l_TextChatService_0:SendUniverseChatMessageAsync(v37, "");
                end):catch(function(v38) --[[ Line: 129 ]]
                    warn(v38.error);
                end);
                return;
            end;
        end
    };
end;