local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Whisper");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ChatInputBarActivatedWhisperMode);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Commands");
local v9 = require(l_script_FirstAncestor_1.getAutocompletePlayersFromString);
local v10 = require(l_script_FirstAncestor_1.Whisper.getNameFromWhisper);
local _ = require(l_script_FirstAncestor_1.types);
return {
    name = script.Name, 
    alias = {
        "/whisper", 
        "/w"
    }, 
    clientRun = function(v12, v13, v14) --[[ Line: 21 ]] --[[ Name: clientRun ]]
        -- upvalues: v10 (copy), l_Dictionary_0 (copy), v9 (copy), v5 (copy), l_TextChatService_0 (copy), l_RobloxReplicatedStorage_0 (copy), v7 (copy)
        local v15 = v12:getState().AutoCastCommands[script.Name];
        local v16 = v10(v14, v15);
        if v16 then
            local l_Players_0 = v12:getState().Players;
            local v18 = l_Dictionary_0.join(l_Players_0, {
                byUserId = l_Dictionary_0.removeKey(l_Players_0.byUserId, (tostring(v13)))
            });
            local v19 = v9(v18, v16);
            if #v19 == 0 then
                v5:debug("Autocomplete: No matches!");
                local v20 = l_Players_0.byUserId[tostring(v13)];
                if v20 and (v16 == v20.displayName or v16 == "@" .. v20.username) then
                    return {
                        key = "InGame.UnknownNamespace.GameChat_PrivateMessaging_CannotWhisperToSelf", 
                        args = nil, 
                        metadata = "Roblox.Whisper.Error.CannotWhisperToSelf"
                    };
                else
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                        args = {
                            RBX_NAME = v16 or ""
                        }, 
                        metadata = "Roblox.Whisper.Error.TargetDoesNotExist"
                    };
                end;
            elseif #v19 == 1 then
                local v21 = v19[1];
                local v22 = tonumber(v21.userId);
                if v22 then
                    local v23 = string.format("RBXWhisper:%d_%d", v13 < v22 and v13 or v22, v22 < v13 and v13 or v22);
                    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v23, true);
                    if not l_l_TextChatService_0_FirstChild_0 then
                        local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
                        if l_ExperienceChat_0 then
                            local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
                            if l_WhisperChat_0 and l_WhisperChat_0:IsA("RemoteFunction") then
                                l_l_TextChatService_0_FirstChild_0 = l_WhisperChat_0:InvokeServer(v21.userId);
                                if not l_l_TextChatService_0_FirstChild_0 then
                                    v5:error("Could not create whisper channel for some reason.");
                                    return {
                                        key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                                        args = nil, 
                                        metadata = "Roblox.Whisper.Error.Unknown"
                                    };
                                end;
                            else
                                v5:error("Could not create whisper channel because WhisperChat RemoteFunction is missing.");
                                return {
                                    key = "", 
                                    metadata = "Roblox.Whisper.Error.Unknown"
                                };
                            end;
                        else
                            v5:error("Could not create whisper channel because RobloxReplicatedStorage.ExperienceChat is missing.");
                            return {
                                key = "", 
                                metadata = "Roblox.Whisper.Error.Unknown"
                            };
                        end;
                    end;
                    v12:dispatch(v7(nil, l_l_TextChatService_0_FirstChild_0));
                    return {
                        key = "CoreScripts.TextChat.Notification.WhisperChat.Created", 
                        args = {
                            RBX_NAME = v16
                        }, 
                        metadata = "Roblox.Whisper.Info.Success"
                    };
                end;
            else
                v5:debug("Autocomplete: Too many matches!");
                return {
                    key = "CoreScripts.TextChat.Whisper.Error.CannotChat", 
                    metadata = "Roblox.Whisper.Error.TooManyMatches"
                };
            end;
        end;
        return {
            key = "", 
            metadata = "Roblox.Whisper.Error.Unknown"
        };
    end
};