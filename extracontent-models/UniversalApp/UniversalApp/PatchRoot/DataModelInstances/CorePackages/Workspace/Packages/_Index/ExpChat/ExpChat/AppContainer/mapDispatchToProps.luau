local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v4 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Promise);
local l_List_0 = require(l_Parent_0.llama).List;
local v8 = require(l_Parent_0.ExpChatShared);
local l_Analytics_0 = v8.Analytics;
local v10 = require(script.Parent.Logger);
local v11 = require(l_script_FirstAncestor_0.Config);
local l_autoCastCommand_0 = v8.Commands.autoCastCommand;
local l_RBXWhisperCommand_0 = v8.Commands.Whisper.RBXWhisperCommand;
local l_ChatInputBarResetTargetChannel_0 = v8.Actions.ChatInputBarResetTargetChannel;
local v15 = require(l_script_FirstAncestor_0.Actions.ChatTranslationGlobalToggled);
local v16 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
return function(v18) --[[ Line: 26 ]]
    -- upvalues: l_Players_0 (copy), l_autoCastCommand_0 (copy), l_RBXWhisperCommand_0 (copy), v6 (copy), v10 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v4 (copy), v15 (copy), l_Analytics_0 (copy), v16 (copy), l_ChatInputBarResetTargetChannel_0 (copy), v3 (copy), l_TextChatService_0 (copy), l_List_0 (copy), v11 (copy)
    return {
        activateWhisperMode = function(v19) --[[ Line: 28 ]] --[[ Name: activateWhisperMode ]]
            -- upvalues: l_Players_0 (ref), l_autoCastCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v6 (ref), v10 (ref)
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v19);
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if not l_l_Players_0_PlayerByUserId_0 then
                return;
            elseif l_l_Players_0_PlayerByUserId_0 == l_LocalPlayer_0 then
                return;
            else
                assert(l_LocalPlayer_0, "Players.LocalPlayer should be non-nil");
                local l_Name_0 = l_l_Players_0_PlayerByUserId_0.Name;
                local v23 = {
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_LocalPlayer_0.UserId, "/w @" .. l_Name_0)
                };
                v6.any(v23):catch(function(v24) --[[ Line: 44 ]]
                    -- upvalues: v10 (ref)
                    v10:debug("Could not send autoCastCommand. Error: {}", v24);
                end);
                return;
            end;
        end, 
        onToggleTranslation = function(v25) --[[ Line: 49 ]] --[[ Name: onToggleTranslation ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v4 (ref), v18 (copy), v15 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v4(false).toggleGlobalTranslation(v25);
                return;
            else
                v18(v15(v25));
                return;
            end;
        end, 
        onToggleIndividualTranslation = function(v26, v27) --[[ Line: 58 ]] --[[ Name: onToggleIndividualTranslation ]]
            -- upvalues: l_Players_0 (ref), l_Analytics_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v4 (ref), v18 (copy), v16 (ref)
            local v28 = {
                useTranslation = v26, 
                senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                localeId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.LocaleId else nil
            };
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageTranslationToggled", v28);
            if l_FFlagExpChatUseMessagesStore_0 then
                v4(false).toggleMessageTranslation(v26, v27);
                return;
            else
                v18(v16(v26, v27));
                return;
            end;
        end, 
        resetTargetChannel = function() --[[ Line: 75 ]] --[[ Name: resetTargetChannel ]]
            -- upvalues: v18 (copy), l_ChatInputBarResetTargetChannel_0 (ref)
            v18(l_ChatInputBarResetTargetChannel_0());
        end, 
        onHovered = function() --[[ Line: 79 ]] --[[ Name: onHovered ]]
            -- upvalues: v3 (ref)
            v3(false).resetAllTransparency();
        end, 
        onUnhovered = function() --[[ Line: 83 ]] --[[ Name: onUnhovered ]]
            -- upvalues: v3 (ref)
            v3(false).resetAllTransparency();
        end, 
        onSendChat = function(v29) --[[ Line: 87 ]] --[[ Name: onSendChat ]]
            -- upvalues: l_TextChatService_0 (ref), v10 (ref), v6 (ref), l_List_0 (ref), l_Players_0 (ref), v11 (ref), l_Analytics_0 (ref)
            local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v31 = nil;
            if l_ChatInputBarConfiguration_0 then
                v31 = l_ChatInputBarConfiguration_0.TargetTextChannel;
            end;
            v10:debug("onSendChat: {} to {}", v29, if v31 then v31.Name else "nil");
            if v31 then
                v6.try(function() --[[ Line: 96 ]]
                    -- upvalues: v31 (ref), v29 (copy), l_List_0 (ref), l_Players_0 (ref), v11 (ref), l_Analytics_0 (ref)
                    v31:SendAsync(v29);
                    local v33 = l_List_0.count(v31:GetChildren(), function(v32) --[[ Line: 99 ]]
                        return v32:IsA("TextSource");
                    end);
                    local v34 = {
                        channelName = v31.Name, 
                        senderUserId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else nil, 
                        numParticipants = v33, 
                        isDefaultChannel = v11[v31.Name] and "true" or "false"
                    };
                    l_Analytics_0.FireClientAnalyticsWithEventName("LuaMessageSent", v34);
                end):catch(function(v35) --[[ Line: 111 ]]
                    warn(v35.error);
                end);
            else
                v10:warning("TargetTextChannel was nil!");
            end;
        end
    };
end;