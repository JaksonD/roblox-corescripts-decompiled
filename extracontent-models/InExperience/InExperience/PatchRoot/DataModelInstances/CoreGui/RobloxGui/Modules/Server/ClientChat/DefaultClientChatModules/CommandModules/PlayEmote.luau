local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Util_0 = require(l_Parent_0:WaitForChild("Util"));
local v4 = nil;
pcall(function() --[[ Line: 13 ]]
    -- upvalues: v4 (ref), l_Chat_0 (copy)
    v4 = require(l_Chat_0.ClientChatModules.ChatLocalization);
end);
if v4 == nil then
    v4 = {
        Get = function(_, _, v7) --[[ Line: 14 ]] --[[ Name: Get ]]
            return v7;
        end
    };
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local v10 = {
    NotSupported = "InGame.Chat.Response.EmotesNotSupported", 
    R15Only = "InGame.Chat.Response.EmotesWrongAvatarType", 
    SwitchToR15 = "InGame.Chat.ErrorMessageSwitchToR15", 
    NoMatchingEmote = "InGame.Chat.Response.EmoteNotAvailable", 
    TemporarilyUnavailable = "InGame.Chat.Response.EmotesTemporarilyUnavailable", 
    AnimationPlaying = "InGame.Chat.ErrorMessageAnimationPlaying"
};
local v11 = {
    [v10.NotSupported] = "You can't use Emotes here.", 
    [v10.R15Only] = "Only R15 avatars can use Emotes.", 
    [v10.SwitchToR15] = "Switch to your R15 avatar to play Emote.", 
    [v10.NoMatchingEmote] = "You can't use that Emote.", 
    [v10.TemporarilyUnavailable] = "You can't use Emotes right now.", 
    [v10.AnimationPlaying] = "You cannot play Emotes during this action."
};
local v12 = Color3.fromRGB(245, 50, 50);
local function _(v13) --[[ Line: 48 ]] --[[ Name: getEmoteName ]]
    if string.sub(v13, 1, 3) == "/e " then
        return (string.sub(v13, 4));
    elseif string.sub(v13, 1, 7) == "/emote " then
        return (string.sub(v13, 8));
    else
        return nil;
    end;
end;
local function _(v15, v16) --[[ Line: 58 ]] --[[ Name: sendErrorMessage ]]
    -- upvalues: v4 (ref), v11 (copy), v12 (copy), l_Util_0 (copy)
    local v17 = v4:Get(v16, v11[v16]);
    local v18 = {
        ChatColor = v12
    };
    l_Util_0:SendSystemMessageToSelf(v17, v15, v18);
end;
local function v68(v20, v21, _) --[[ Line: 67 ]] --[[ Name: ProcessMessage ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (copy), v10 (copy), v4 (ref), v11 (copy), v12 (copy), l_Util_0 (copy)
    local v23 = if string.sub(v20, 1, 3) == "/e " then string.sub(v20, 4) else if string.sub(v20, 1, 7) == "/emote " then string.sub(v20, 8) else nil;
    if not v23 then
        return false;
    elseif v9[v23] then
        return true;
    else
        local l_v21_CurrentChannel_0 = v21:GetCurrentChannel();
        if not l_v21_CurrentChannel_0 then
            return true;
        else
            local l_Character_0 = l_LocalPlayer_0.Character;
            if not l_Character_0 then
                local l_TemporarilyUnavailable_0 = v10.TemporarilyUnavailable;
                local v27 = v4:Get(l_TemporarilyUnavailable_0, v11[l_TemporarilyUnavailable_0]);
                local v28 = {
                    ChatColor = v12
                };
                l_Util_0:SendSystemMessageToSelf(v27, l_v21_CurrentChannel_0, v28);
                return true;
            else
                local l_Animate_0 = l_Character_0:FindFirstChild("Animate");
                if not l_Animate_0 then
                    local l_NotSupported_0 = v10.NotSupported;
                    local v31 = v4:Get(l_NotSupported_0, v11[l_NotSupported_0]);
                    local v32 = {
                        ChatColor = v12
                    };
                    l_Util_0:SendSystemMessageToSelf(v31, l_v21_CurrentChannel_0, v32);
                    return true;
                elseif not l_Animate_0:FindFirstChild("PlayEmote") then
                    local l_NotSupported_1 = v10.NotSupported;
                    local v34 = v4:Get(l_NotSupported_1, v11[l_NotSupported_1]);
                    local v35 = {
                        ChatColor = v12
                    };
                    l_Util_0:SendSystemMessageToSelf(v34, l_v21_CurrentChannel_0, v35);
                    return true;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
                    if not l_Humanoid_0 then
                        local l_TemporarilyUnavailable_1 = v10.TemporarilyUnavailable;
                        local v38 = v4:Get(l_TemporarilyUnavailable_1, v11[l_TemporarilyUnavailable_1]);
                        local v39 = {
                            ChatColor = v12
                        };
                        l_Util_0:SendSystemMessageToSelf(v38, l_v21_CurrentChannel_0, v39);
                        return true;
                    elseif l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
                        local l_R15Only_0 = v10.R15Only;
                        local v41 = v4:Get(l_R15Only_0, v11[l_R15Only_0]);
                        local v42 = {
                            ChatColor = v12
                        };
                        l_Util_0:SendSystemMessageToSelf(v41, l_v21_CurrentChannel_0, v42);
                        return true;
                    else
                        local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChildOfClass("HumanoidDescription");
                        if not l_HumanoidDescription_0 then
                            local l_TemporarilyUnavailable_2 = v10.TemporarilyUnavailable;
                            local v45 = v4:Get(l_TemporarilyUnavailable_2, v11[l_TemporarilyUnavailable_2]);
                            local v46 = {
                                ChatColor = v12
                            };
                            l_Util_0:SendSystemMessageToSelf(v45, l_v21_CurrentChannel_0, v46);
                            return true;
                        else
                            local v47 = {};
                            local l_l_HumanoidDescription_0_Emotes_0 = l_HumanoidDescription_0:GetEmotes();
                            for v49, _ in pairs(l_l_HumanoidDescription_0_Emotes_0) do
                                v47[string.lower(v49)] = v49;
                            end;
                            local v51 = tonumber(v23);
                            if v51 then
                                local l_l_HumanoidDescription_0_EquippedEmotes_0 = l_HumanoidDescription_0:GetEquippedEmotes();
                                for _, v54 in pairs(l_l_HumanoidDescription_0_EquippedEmotes_0) do
                                    if v54.Slot == v51 then
                                        v23 = v54.Name;
                                    end;
                                end;
                            end;
                            v23 = v47[string.lower(v23)];
                            if not v23 then
                                local l_NoMatchingEmote_0 = v10.NoMatchingEmote;
                                local v56 = v4:Get(l_NoMatchingEmote_0, v11[l_NoMatchingEmote_0]);
                                local v57 = {
                                    ChatColor = v12
                                };
                                l_Util_0:SendSystemMessageToSelf(v56, l_v21_CurrentChannel_0, v57);
                                return true;
                            else
                                spawn(function() --[[ Line: 143 ]]
                                    -- upvalues: l_Humanoid_0 (copy), v23 (ref), l_v21_CurrentChannel_0 (copy), v10 (ref), v4 (ref), v11 (ref), v12 (ref), l_Util_0 (ref)
                                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 144 ]]
                                        -- upvalues: l_Humanoid_0 (ref), v23 (ref)
                                        return l_Humanoid_0:PlayEmote(v23);
                                    end);
                                    if not l_status_0 then
                                        local l_l_v21_CurrentChannel_0_0 = l_v21_CurrentChannel_0;
                                        local l_NotSupported_2 = v10.NotSupported;
                                        local v62 = v4:Get(l_NotSupported_2, v11[l_NotSupported_2]);
                                        local v63 = {
                                            ChatColor = v12
                                        };
                                        l_Util_0:SendSystemMessageToSelf(v62, l_l_v21_CurrentChannel_0_0, v63);
                                        return;
                                    else
                                        if not l_result_0 then
                                            local l_l_v21_CurrentChannel_0_1 = l_v21_CurrentChannel_0;
                                            local l_TemporarilyUnavailable_3 = v10.TemporarilyUnavailable;
                                            local v66 = v4:Get(l_TemporarilyUnavailable_3, v11[l_TemporarilyUnavailable_3]);
                                            local v67 = {
                                                ChatColor = v12
                                            };
                                            l_Util_0:SendSystemMessageToSelf(v66, l_l_v21_CurrentChannel_0_1, v67);
                                        end;
                                        return;
                                    end;
                                end);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = v68
};