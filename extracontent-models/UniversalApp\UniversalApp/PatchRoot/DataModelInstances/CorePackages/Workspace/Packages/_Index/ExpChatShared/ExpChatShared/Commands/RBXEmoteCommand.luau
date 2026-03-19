local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local _ = require(script.Parent.types);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local v3 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Emote");
local v4 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance1 = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v5) --[[ Line: 18 ]] --[[ Name: getDanceBasedOnRigType ]]
    local v6 = nil;
    local l_Humanoid_0 = v5:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then
            return "dance";
        elseif l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
            v6 = "dance" .. math.random(1, 3);
        end;
    end;
    return v6;
end;
local function v18(v9, v10) --[[ Line: 33 ]] --[[ Name: handleLegacyEmote ]]
    -- upvalues: v3 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v9 (ref), v3 (ref)
        local l_Animate_0 = v10:FindFirstChild("Animate");
        if l_Animate_0 then
            local l_PlayEmote_0 = l_Animate_0:FindFirstChild("PlayEmote");
            if l_PlayEmote_0 and l_PlayEmote_0:IsA("BindableFunction") then
                if v9 == "dance" then
                    local l_v10_0 = v10;
                    local v14 = nil;
                    local l_Humanoid_1 = l_v10_0:FindFirstChildOfClass("Humanoid");
                    if l_Humanoid_1 then
                        if l_Humanoid_1.RigType == Enum.HumanoidRigType.R15 then
                            v14 = "dance";
                        elseif l_Humanoid_1.RigType == Enum.HumanoidRigType.R6 then
                            v14 = "dance" .. math.random(1, 3);
                        end;
                    end;
                    v9 = v14;
                end;
                l_PlayEmote_0:Invoke(v9);
                return true;
            else
                v3:debug("PlayEmote BindableFunction does not exist.");
            end;
        end;
        return false;
    end);
    if l_status_0 and l_result_0 then
        v3:debug("Playing legacy emote successfully");
        return;
    else
        return {
            key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
            metadata = "Roblox.Emote.Error.NotSupported"
        };
    end;
end;
local function v26(v19, v20) --[[ Line: 63 ]] --[[ Name: getValidEmoteOrResponse ]]
    local v21 = tonumber(v20, 10);
    if v21 then
        local l_v19_EquippedEmotes_0 = v19:GetEquippedEmotes();
        if l_v19_EquippedEmotes_0[v21] then
            return l_v19_EquippedEmotes_0[v21].Name, nil;
        elseif v21 < 1 or v21 > 8 then
            return nil, {
                key = "CoreScripts.TextChat.Emote.Error.DoesNotExist", 
                metadata = "Roblox.Emote.Error.DoesNotExist"
            };
        else
            return nil, {
                key = "CoreScripts.TextChat.Emote.Error.NotEquipped", 
                metadata = "Roblox.Emote.Error.EmoteNotEquipped"
            };
        end;
    else
        local l_v19_Emotes_0 = v19:GetEmotes();
        for v24, _ in pairs(l_v19_Emotes_0) do
            if string.lower(v24) == v20 then
                return v24, nil;
            end;
        end;
        return nil, {
            key = "CoreScripts.TextChat.Emote.Error.NotOwnedGeneric", 
            metadata = "Roblox.Emote.Error.NotOwnedGeneric"
        };
    end;
end;
return {
    name = script.Name, 
    alias = {
        "/emote", 
        "/e"
    }, 
    clientRun = function(v27, _, v29) --[[ Line: 105 ]] --[[ Name: clientRun ]]
        -- upvalues: v3 (copy), v4 (copy), v18 (copy), l_StarterPlayer_0 (copy), v26 (copy)
        local v30 = nil;
        if string.sub(v29, 1, 3):lower() == "/e " then
            v30 = string.sub(v29, 4);
        elseif string.sub(v29, 1, 7):lower() == "/emote " then
            v30 = string.sub(v29, 8);
        end;
        if not v30 then
            v3:debug("No emote string given");
            return {
                key = "CoreScripts.TextChat.Emote.Error.DoesNotExist", 
                metadata = "Roblox.Emote.Error.DoesNotExist"
            };
        else
            v30 = string.lower(v30);
            local l_LocalCharacter_0 = v27:getState().LocalCharacter;
            if v4[v30] then
                v3:trace("Legacy emote found");
                return v18(v30, l_LocalCharacter_0);
            elseif not l_StarterPlayer_0.UserEmotesEnabled then
                v3:debug("Experience does not have emotes enabled");
                return {
                    key = "CoreScripts.TextChat.Emote.Error.NotEnabled", 
                    metadata = "Roblox.Emote.Error.UserEmotesNotEnabled"
                };
            elseif not l_LocalCharacter_0 then
                v3:debug("No character loaded");
                return {
                    key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable", 
                    metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
                };
            elseif not l_LocalCharacter_0:FindFirstChild("Animate") then
                v3:debug("Animate script missing");
                return {
                    key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
                    metadata = "Roblox.Emote.Error.NotSupported"
                };
            else
                local l_Humanoid_2 = l_LocalCharacter_0:FindFirstChildOfClass("Humanoid");
                if not l_Humanoid_2 then
                    v3:debug("Humanoid missing");
                    return {
                        key = "InGame.EmotesMenu.ErrorMessageTemporarilyUnavailable", 
                        metadata = "Roblox.Emote.Error.TemporarilyUnavailable"
                    };
                elseif l_Humanoid_2.RigType ~= Enum.HumanoidRigType.R15 then
                    v3:debug("Humanoid.RigType is not R15");
                    return {
                        key = "InGame.EmotesMenu.ErrorMessageSwitchToR15", 
                        metadata = "Roblox.Emote.Error.SwitchToR15"
                    };
                else
                    local l_HumanoidDescription_0 = l_Humanoid_2:FindFirstChildOfClass("HumanoidDescription");
                    if not l_HumanoidDescription_0 then
                        v3:debug("HumanoidDescription missing");
                        return {
                            key = "InGame.EmotesMenu.ErrorMessageNotSupported", 
                            metadata = "Roblox.Emote.Error.NotSupported"
                        };
                    else
                        local v34, v35 = v26(l_HumanoidDescription_0, v30);
                        if not v34 then
                            v3:debug("Could not find a valid emote within HumanoidDescription");
                            return v35;
                        else
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 192 ]]
                                -- upvalues: l_Humanoid_2 (copy), v34 (copy)
                                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                                    return l_Humanoid_2:PlayEmoteAsync(v34);
                                else
                                    return l_Humanoid_2:PlayEmote(v34);
                                end;
                            end);
                            if not l_status_1 or not l_result_1 then
                                v3:debug("Humanoid:PlayEmote encountered an error: {}", l_result_1);
                                return {
                                    key = "InGame.EmotesMenu.ErrorMessageAnimationPlaying", 
                                    metadata = "Roblox.Emote.Error.AnimationPlaying"
                                };
                            else
                                v3:debug("Playing emote: {}", (tostring(v34)));
                                return nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};