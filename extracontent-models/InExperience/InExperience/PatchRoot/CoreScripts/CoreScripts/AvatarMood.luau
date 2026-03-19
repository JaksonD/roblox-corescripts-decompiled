game:DefineFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator", false);
game:DefineFastFlag("AvatarMoodValidateMoodAnimation", false);
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_CoreGui_0.RobloxGui;
local _ = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local l_Core_0 = Enum.AnimationPriority.Core;
local v10 = nil;
local v11 = true;
local v12 = false;
local v13 = {};
local v14 = {
    EmoteStopped = "currentEmoteTrackStopped", 
    EmoteKeyframeReached = "emoteKeyframeReached", 
    AnimationInstanceChanged = "animationInstanceChanged", 
    EmoteTriggered = "localEmote", 
    AnimateScriptAdded = "animateScriptAdded", 
    AnimateScriptMoodAdded = "animateScriptMoodAdded", 
    AnimateScriptMoodRemoved = "animateScriptMoodRemoved", 
    MoodChildAdded = "moodChildAdded", 
    HeadChildAdded = "headChildAdded", 
    CharacterHumanoidAdded = "characterHumanoidAdded", 
    HumanoidAnimatorAdded = "humanoidAnimatorAdded", 
    CharacterChildAdded = "characterChildAdded", 
    CharacterChildRemoved = "characterChildRemoved", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    AnimationStreamTrackPlayed = "AnimationStreamTrackPlayed", 
    StreamTrackStopped = "StreamTrackStopped"
};
local v15 = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v16) --[[ Line: 65 ]] --[[ Name: getPlayerHumanoid ]]
    if v16.Character then
        return v16.Character:FindFirstChildOfClass("Humanoid");
    else
        return nil;
    end;
end;
local function _(v18) --[[ Line: 73 ]] --[[ Name: getPlayerAnimator ]]
    local v19 = if v18.Character then v18.Character:FindFirstChildOfClass("Humanoid") else nil;
    if v19 then
        return v19:FindFirstChildOfClass("Animator");
    else
        return nil;
    end;
end;
local function _(v21) --[[ Line: 82 ]] --[[ Name: switchPriority ]]
    -- upvalues: l_Core_0 (ref), v8 (ref)
    l_Core_0 = v21;
    if v8 then
        v8.Priority = l_Core_0;
    end;
end;
local function _(v23) --[[ Line: 89 ]] --[[ Name: disconnectAndRemoveConnection ]]
    -- upvalues: v13 (copy)
    if v13[v23] ~= nil then
        v13[v23]:Disconnect();
        v13[v23] = nil;
    end;
end;
local function _() --[[ Line: 96 ]] --[[ Name: resumeMoodAfterEmote ]]
    -- upvalues: v10 (ref), v8 (ref), v14 (copy), v13 (copy)
    v10 = nil;
    if v8 ~= nil then
        v8:Play();
    end;
    local l_EmoteStopped_0 = v14.EmoteStopped;
    if v13[l_EmoteStopped_0] ~= nil then
        v13[l_EmoteStopped_0]:Disconnect();
        v13[l_EmoteStopped_0] = nil;
    end;
    l_EmoteStopped_0 = v14.EmoteKeyframeReached;
    if v13[l_EmoteStopped_0] ~= nil then
        v13[l_EmoteStopped_0]:Disconnect();
        v13[l_EmoteStopped_0] = nil;
    end;
end;
local function v33(v27, v28) --[[ Line: 106 ]] --[[ Name: onEmoteTriggered ]]
    -- upvalues: v11 (ref), v8 (ref), v10 (ref), v12 (ref), v14 (copy), v13 (copy)
    if not v11 or v8 == nil then
        return;
    else
        if v27 and v28 then
            v8:Stop();
            v10 = v28;
            v12 = true;
            local l_EmoteStopped_1 = v14.EmoteStopped;
            if v13[l_EmoteStopped_1] ~= nil then
                v13[l_EmoteStopped_1]:Disconnect();
                v13[l_EmoteStopped_1] = nil;
            end;
            l_EmoteStopped_1 = v14.EmoteKeyframeReached;
            if v13[l_EmoteStopped_1] ~= nil then
                v13[l_EmoteStopped_1]:Disconnect();
                v13[l_EmoteStopped_1] = nil;
            end;
            v13[v14.EmoteStopped] = v10.Stopped:Connect(function() --[[ Line: 118 ]]
                -- upvalues: v10 (ref), v8 (ref), v14 (ref), v13 (ref), v12 (ref)
                v10 = nil;
                if v8 ~= nil then
                    v8:Play();
                end;
                local l_EmoteStopped_2 = v14.EmoteStopped;
                if v13[l_EmoteStopped_2] ~= nil then
                    v13[l_EmoteStopped_2]:Disconnect();
                    v13[l_EmoteStopped_2] = nil;
                end;
                l_EmoteStopped_2 = v14.EmoteKeyframeReached;
                if v13[l_EmoteStopped_2] ~= nil then
                    v13[l_EmoteStopped_2]:Disconnect();
                    v13[l_EmoteStopped_2] = nil;
                end;
                v12 = false;
            end);
            v13[v14.EmoteKeyframeReached] = v10.KeyframeReached:Connect(function(v31) --[[ Line: 124 ]]
                -- upvalues: v10 (ref), v8 (ref), v14 (ref), v13 (ref), v12 (ref)
                if v31 == "End" and not v10.Looped then
                    v10 = nil;
                    if v8 ~= nil then
                        v8:Play();
                    end;
                    local l_EmoteStopped_3 = v14.EmoteStopped;
                    if v13[l_EmoteStopped_3] ~= nil then
                        v13[l_EmoteStopped_3]:Disconnect();
                        v13[l_EmoteStopped_3] = nil;
                    end;
                    l_EmoteStopped_3 = v14.EmoteKeyframeReached;
                    if v13[l_EmoteStopped_3] ~= nil then
                        v13[l_EmoteStopped_3]:Disconnect();
                        v13[l_EmoteStopped_3] = nil;
                    end;
                    v12 = false;
                end;
            end);
        end;
        return;
    end;
end;
local function v34(v35) --[[ Line: 133 ]] --[[ Name: checkEmotePlaying ]]
    -- upvalues: v15 (copy), v14 (copy), v13 (copy), v10 (ref), v12 (ref), v8 (ref), v34 (copy)
    local l_v35_PlayingAnimationTracks_0 = v35:GetPlayingAnimationTracks();
    local v37 = false;
    for _, v39 in pairs(l_v35_PlayingAnimationTracks_0) do
        if v39.IsPlaying and v39.Animation.Parent and v15[v39.Animation.Parent.Name] then
            local l_EmoteStopped_4 = v14.EmoteStopped;
            if v13[l_EmoteStopped_4] ~= nil then
                v13[l_EmoteStopped_4]:Disconnect();
                v13[l_EmoteStopped_4] = nil;
            end;
            l_EmoteStopped_4 = v14.EmoteKeyframeReached;
            if v13[l_EmoteStopped_4] ~= nil then
                v13[l_EmoteStopped_4]:Disconnect();
                v13[l_EmoteStopped_4] = nil;
            end;
            v10 = v39;
            v12 = false;
            v8:Stop();
            v13[v14.EmoteStopped] = v10.Stopped:Connect(function() --[[ Line: 152 ]]
                -- upvalues: v34 (ref), v35 (copy), v12 (ref), v10 (ref), v8 (ref), v14 (ref), v13 (ref)
                wait(0.3);
                if not v34(v35) and not v12 then
                    v10 = nil;
                    if v8 ~= nil then
                        v8:Play();
                    end;
                    local l_EmoteStopped_5 = v14.EmoteStopped;
                    if v13[l_EmoteStopped_5] ~= nil then
                        v13[l_EmoteStopped_5]:Disconnect();
                        v13[l_EmoteStopped_5] = nil;
                    end;
                    l_EmoteStopped_5 = v14.EmoteKeyframeReached;
                    if v13[l_EmoteStopped_5] ~= nil then
                        v13[l_EmoteStopped_5]:Disconnect();
                        v13[l_EmoteStopped_5] = nil;
                    end;
                end;
            end);
            v13[v14.EmoteKeyframeReached] = v10.KeyframeReached:Connect(function(v42) --[[ Line: 161 ]]
                -- upvalues: v34 (ref), v35 (copy), v12 (ref), v10 (ref), v8 (ref), v14 (ref), v13 (ref)
                if v42 == "End" then
                    wait(0.3);
                    if not v34(v35) and not v12 then
                        v10 = nil;
                        if v8 ~= nil then
                            v8:Play();
                        end;
                        local l_EmoteStopped_6 = v14.EmoteStopped;
                        if v13[l_EmoteStopped_6] ~= nil then
                            v13[l_EmoteStopped_6]:Disconnect();
                            v13[l_EmoteStopped_6] = nil;
                        end;
                        l_EmoteStopped_6 = v14.EmoteKeyframeReached;
                        if v13[l_EmoteStopped_6] ~= nil then
                            v13[l_EmoteStopped_6]:Disconnect();
                            v13[l_EmoteStopped_6] = nil;
                        end;
                    end;
                end;
            end);
            v37 = true;
        end;
    end;
    return v37;
end;
v6 = l_LocalPlayer_0.Chatted:Connect(function(v44) --[[ Line: 177 ]]
    -- upvalues: v11 (ref), v8 (ref), l_LocalPlayer_0 (copy), v15 (copy), v34 (copy)
    if not v11 or v8 == nil then
        return;
    else
        if l_LocalPlayer_0.Character then
            local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildWhichIsA("Humanoid");
            if l_Humanoid_0 then
                local v46 = "";
                if string.sub(v44, 1, 3) == "/e " then
                    v46 = string.sub(v44, 4);
                elseif string.sub(v44, 1, 7) == "/emote " then
                    v46 = string.sub(v44, 8);
                end;
                if v15[v46] then
                    wait(0.3);
                    v34(l_Humanoid_0);
                end;
            end;
        end;
        return;
    end;
end);
local function _() --[[ Line: 200 ]] --[[ Name: stopAndDestroyCurrentMoodTrack ]]
    -- upvalues: v8 (ref)
    if v8 ~= nil then
        v8:Stop();
        v8:Destroy();
        v8 = nil;
    end;
end;
local function _() --[[ Line: 208 ]] --[[ Name: stopAndDestroyCurrentMoodTrackConnections ]]
    -- upvalues: v8 (ref), v14 (copy), v13 (copy), v7 (ref)
    if v8 ~= nil then
        v8:Stop();
        v8:Destroy();
        v8 = nil;
    end;
    local l_EmoteStopped_7 = v14.EmoteStopped;
    if v13[l_EmoteStopped_7] ~= nil then
        v13[l_EmoteStopped_7]:Disconnect();
        v13[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v14.EmoteKeyframeReached;
    if v13[l_EmoteStopped_7] ~= nil then
        v13[l_EmoteStopped_7]:Disconnect();
        v13[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v14.AnimationInstanceChanged;
    if v13[l_EmoteStopped_7] ~= nil then
        v13[l_EmoteStopped_7]:Disconnect();
        v13[l_EmoteStopped_7] = nil;
    end;
    l_EmoteStopped_7 = v14.EmoteTriggered;
    if v13[l_EmoteStopped_7] ~= nil then
        v13[l_EmoteStopped_7]:Disconnect();
        v13[l_EmoteStopped_7] = nil;
    end;
    v7 = nil;
end;
local _ = function(_, _, v52, v53) --[[ Line: 217 ]] --[[ Name: updateCharacterMoodOnAnimatorAdded ]]
    -- upvalues: v8 (ref), v7 (ref), l_Core_0 (ref), v10 (ref), v14 (copy), v13 (copy), v33 (copy)
    v8 = v53:LoadAnimation(v7);
    v8.Priority = l_Core_0;
    task.delay(0.1, function() --[[ Line: 224 ]]
        -- upvalues: v10 (ref), v7 (ref), v8 (ref), v53 (copy), l_Core_0 (ref), v14 (ref), v13 (ref), v52 (copy), v33 (ref)
        if v10 == nil and v7 then
            if not v8 then
                v8 = v53:LoadAnimation(v7);
            end;
            if v8 then
                v8.Priority = l_Core_0;
                v8:Play();
            end;
        end;
        local l_EmoteTriggered_0 = v14.EmoteTriggered;
        if v13[l_EmoteTriggered_0] ~= nil then
            v13[l_EmoteTriggered_0]:Disconnect();
            v13[l_EmoteTriggered_0] = nil;
        end;
        v13[v14.EmoteTriggered] = v52.EmoteTriggered:Connect(v33);
    end);
end;
local function v67(v56, v57, v58) --[[ Line: 244 ]] --[[ Name: updateCharacterMoodOnHumanoidAdded ]]
    -- upvalues: v8 (ref), v7 (ref), l_Core_0 (ref), v10 (ref), v14 (copy), v13 (copy), v33 (copy)
    local l_Animator_0 = v58:FindFirstChild("Animator");
    if l_Animator_0 then
        v8 = l_Animator_0:LoadAnimation(v7);
        v8.Priority = l_Core_0;
        task.delay(0.1, function() --[[ Line: 224 ]]
            -- upvalues: v10 (ref), v7 (ref), v8 (ref), l_Animator_0 (copy), l_Core_0 (ref), v14 (ref), v13 (ref), v58 (copy), v33 (ref)
            if v10 == nil and v7 then
                if not v8 then
                    v8 = l_Animator_0:LoadAnimation(v7);
                end;
                if v8 then
                    v8.Priority = l_Core_0;
                    v8:Play();
                end;
            end;
            local l_EmoteTriggered_1 = v14.EmoteTriggered;
            if v13[l_EmoteTriggered_1] ~= nil then
                v13[l_EmoteTriggered_1]:Disconnect();
                v13[l_EmoteTriggered_1] = nil;
            end;
            v13[v14.EmoteTriggered] = v58.EmoteTriggered:Connect(v33);
        end);
    end;
    if v13[v14.HumanoidAnimatorAdded] then
        local l_HumanoidAnimatorAdded_0 = v14.HumanoidAnimatorAdded;
        if v13[l_HumanoidAnimatorAdded_0] ~= nil then
            v13[l_HumanoidAnimatorAdded_0]:Disconnect();
            v13[l_HumanoidAnimatorAdded_0] = nil;
        end;
    end;
    v13[v14.HumanoidAnimatorAdded] = v58.ChildAdded:Connect(function(v62) --[[ Line: 254 ]]
        -- upvalues: v56 (copy), v57 (copy), v58 (copy), v8 (ref), v7 (ref), l_Core_0 (ref), v10 (ref), v14 (ref), v13 (ref), v33 (ref)
        if v62.Name == "Animator" then
            local _ = v56;
            local _ = v57;
            local l_v58_0 = v58;
            v8 = v62:LoadAnimation(v7);
            v8.Priority = l_Core_0;
            task.delay(0.1, function() --[[ Line: 224 ]]
                -- upvalues: v10 (ref), v7 (ref), v8 (ref), v62 (copy), l_Core_0 (ref), v14 (ref), v13 (ref), l_v58_0 (copy), v33 (ref)
                if v10 == nil and v7 then
                    if not v8 then
                        v8 = v62:LoadAnimation(v7);
                    end;
                    if v8 then
                        v8.Priority = l_Core_0;
                        v8:Play();
                    end;
                end;
                local l_EmoteTriggered_2 = v14.EmoteTriggered;
                if v13[l_EmoteTriggered_2] ~= nil then
                    v13[l_EmoteTriggered_2]:Disconnect();
                    v13[l_EmoteTriggered_2] = nil;
                end;
                v13[v14.EmoteTriggered] = l_v58_0.EmoteTriggered:Connect(v33);
            end);
        end;
    end);
end;
local function v68(v69, v70) --[[ Line: 261 ]] --[[ Name: updateCharacterMood ]]
    -- upvalues: v11 (ref), v13 (copy), v14 (copy), v8 (ref), v7 (ref), v68 (copy), v67 (copy)
    if v69 == nil or v70 == nil or not v11 then
        return;
    else
        if v13[v14.AnimationInstanceChanged] then
            local l_AnimationInstanceChanged_0 = v14.AnimationInstanceChanged;
            if v13[l_AnimationInstanceChanged_0] ~= nil then
                v13[l_AnimationInstanceChanged_0]:Disconnect();
                v13[l_AnimationInstanceChanged_0] = nil;
            end;
        end;
        if v13[v14.CharacterHumanoidAdded] then
            local l_CharacterHumanoidAdded_0 = v14.CharacterHumanoidAdded;
            if v13[l_CharacterHumanoidAdded_0] ~= nil then
                v13[l_CharacterHumanoidAdded_0]:Disconnect();
                v13[l_CharacterHumanoidAdded_0] = nil;
            end;
        end;
        if v8 ~= nil then
            v8:Stop();
            v8:Destroy();
            v8 = nil;
        end;
        v7 = v70;
        v13[v14.AnimationInstanceChanged] = v7.Changed:Connect(function(_) --[[ Line: 277 ]]
            -- upvalues: v68 (ref), v69 (copy), v70 (copy)
            v68(v69, v70);
        end);
        local l_Humanoid_1 = v69:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_1 then
            v67(v69, v70, l_Humanoid_1);
        end;
        v13[v14.CharacterHumanoidAdded] = v69.ChildAdded:Connect(function(v75) --[[ Line: 286 ]]
            -- upvalues: v67 (ref), v69 (copy), v70 (copy), l_Humanoid_1 (copy)
            if v75:IsA("Humanoid") then
                v67(v69, v70, l_Humanoid_1);
            end;
        end);
        return;
    end;
end;
initAvatarMood = function(v76) --[[ Line: 293 ]] --[[ Name: initAvatarMood ]]
    -- upvalues: v14 (copy), v13 (copy), v11 (ref), v68 (copy), l_LocalPlayer_0 (copy), v8 (ref), v7 (ref)
    local l_MoodsEnabled_0 = v76:FindFirstChild("MoodsEnabled");
    local l_AnimateScriptMoodAdded_0 = v14.AnimateScriptMoodAdded;
    if v13[l_AnimateScriptMoodAdded_0] ~= nil then
        v13[l_AnimateScriptMoodAdded_0]:Disconnect();
        v13[l_AnimateScriptMoodAdded_0] = nil;
    end;
    l_AnimateScriptMoodAdded_0 = v14.AnimateScriptMoodRemoved;
    if v13[l_AnimateScriptMoodAdded_0] ~= nil then
        v13[l_AnimateScriptMoodAdded_0]:Disconnect();
        v13[l_AnimateScriptMoodAdded_0] = nil;
    end;
    if l_MoodsEnabled_0 then
        v11 = false;
        return;
    else
        l_AnimateScriptMoodAdded_0 = v76:FindFirstChild("mood");
        if l_AnimateScriptMoodAdded_0 then
            if #l_AnimateScriptMoodAdded_0:GetChildren() > 0 then
                if game:GetFastFlag("AvatarMoodValidateMoodAnimation") then
                    v68(l_LocalPlayer_0.Character, l_AnimateScriptMoodAdded_0:FindFirstChildWhichIsA("Animation"));
                else
                    local v79 = l_AnimateScriptMoodAdded_0:GetChildren()[1];
                    v68(l_LocalPlayer_0.Character, v79);
                end;
            end;
            local l_MoodChildAdded_0 = v14.MoodChildAdded;
            if v13[l_MoodChildAdded_0] ~= nil then
                v13[l_MoodChildAdded_0]:Disconnect();
                v13[l_MoodChildAdded_0] = nil;
            end;
            v13[v14.MoodChildAdded] = l_AnimateScriptMoodAdded_0.ChildAdded:Connect(function(v81) --[[ Line: 320 ]]
                -- upvalues: v68 (ref), l_LocalPlayer_0 (ref)
                if game:GetFastFlag("AvatarMoodValidateMoodAnimation") then
                    if v81:IsA("Animation") then
                        v68(l_LocalPlayer_0.Character, v81);
                        return;
                    end;
                else
                    v68(l_LocalPlayer_0.Character, v81);
                end;
            end);
        else
            if v8 ~= nil then
                v8:Stop();
                v8:Destroy();
                v8 = nil;
            end;
            local l_EmoteStopped_8 = v14.EmoteStopped;
            if v13[l_EmoteStopped_8] ~= nil then
                v13[l_EmoteStopped_8]:Disconnect();
                v13[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v14.EmoteKeyframeReached;
            if v13[l_EmoteStopped_8] ~= nil then
                v13[l_EmoteStopped_8]:Disconnect();
                v13[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v14.AnimationInstanceChanged;
            if v13[l_EmoteStopped_8] ~= nil then
                v13[l_EmoteStopped_8]:Disconnect();
                v13[l_EmoteStopped_8] = nil;
            end;
            l_EmoteStopped_8 = v14.EmoteTriggered;
            if v13[l_EmoteStopped_8] ~= nil then
                v13[l_EmoteStopped_8]:Disconnect();
                v13[l_EmoteStopped_8] = nil;
            end;
            v7 = nil;
        end;
        v13[v14.AnimateScriptMoodAdded] = v76.ChildAdded:Connect(function(v83) --[[ Line: 333 ]]
            -- upvalues: v68 (ref), l_LocalPlayer_0 (ref), v14 (ref), v13 (ref), v11 (ref)
            if v83.Name == "mood" then
                if #v83:GetChildren() > 0 then
                    local v84 = v83:GetChildren()[1];
                    v68(l_LocalPlayer_0.Character, v84);
                end;
                local l_MoodChildAdded_1 = v14.MoodChildAdded;
                if v13[l_MoodChildAdded_1] ~= nil then
                    v13[l_MoodChildAdded_1]:Disconnect();
                    v13[l_MoodChildAdded_1] = nil;
                end;
                v13[v14.MoodChildAdded] = v83.ChildAdded:Connect(function(v86) --[[ Line: 343 ]]
                    -- upvalues: v68 (ref), l_LocalPlayer_0 (ref)
                    v68(l_LocalPlayer_0.Character, v86);
                end);
                return;
            else
                if v83.Name == "MoodsEnabled" then
                    v11 = false;
                end;
                return;
            end;
        end);
        v13[v14.AnimateScriptMoodRemoved] = v76.ChildRemoved:Connect(function(v87) --[[ Line: 351 ]]
            -- upvalues: v76 (copy), v68 (ref), l_LocalPlayer_0 (ref), v8 (ref), v14 (ref), v13 (ref), v7 (ref)
            if v87.Name == "mood" then
                local l_mood_0 = v76:FindFirstChild("mood");
                if l_mood_0 then
                    v68(l_LocalPlayer_0.Character, l_mood_0:FindFirstChildWhichIsA("Animation"));
                    return;
                else
                    if v8 ~= nil then
                        v8:Stop();
                        v8:Destroy();
                        v8 = nil;
                    end;
                    local l_EmoteStopped_9 = v14.EmoteStopped;
                    if v13[l_EmoteStopped_9] ~= nil then
                        v13[l_EmoteStopped_9]:Disconnect();
                        v13[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v14.EmoteKeyframeReached;
                    if v13[l_EmoteStopped_9] ~= nil then
                        v13[l_EmoteStopped_9]:Disconnect();
                        v13[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v14.AnimationInstanceChanged;
                    if v13[l_EmoteStopped_9] ~= nil then
                        v13[l_EmoteStopped_9]:Disconnect();
                        v13[l_EmoteStopped_9] = nil;
                    end;
                    l_EmoteStopped_9 = v14.EmoteTriggered;
                    if v13[l_EmoteStopped_9] ~= nil then
                        v13[l_EmoteStopped_9]:Disconnect();
                        v13[l_EmoteStopped_9] = nil;
                    end;
                    v7 = nil;
                end;
            end;
        end);
        return;
    end;
end;
local function v93() --[[ Line: 363 ]] --[[ Name: waitForAnimateScript ]]
    -- upvalues: l_LocalPlayer_0 (copy), v14 (copy), v13 (copy)
    local l_Animate_0 = l_LocalPlayer_0.Character:FindFirstChild("Animate");
    if l_Animate_0 then
        initAvatarMood(l_Animate_0);
    end;
    local l_AnimateScriptAdded_0 = v14.AnimateScriptAdded;
    if v13[l_AnimateScriptAdded_0] ~= nil then
        v13[l_AnimateScriptAdded_0]:Disconnect();
        v13[l_AnimateScriptAdded_0] = nil;
    end;
    v13[v14.AnimateScriptAdded] = l_LocalPlayer_0.Character.ChildAdded:Connect(function(v92) --[[ Line: 370 ]]
        if v92.Name == "Animate" then
            initAvatarMood(v92);
        end;
    end);
end;
local function v97(v94) --[[ Line: 378 ]] --[[ Name: onHeadAdded ]]
    -- upvalues: v93 (copy), v14 (copy), v13 (copy)
    if v94:FindFirstChildWhichIsA("FaceControls") then
        v93();
    end;
    local l_HeadChildAdded_0 = v14.HeadChildAdded;
    if v13[l_HeadChildAdded_0] ~= nil then
        v13[l_HeadChildAdded_0]:Disconnect();
        v13[l_HeadChildAdded_0] = nil;
    end;
    v13[v14.HeadChildAdded] = v94.ChildAdded:Connect(function(v96) --[[ Line: 385 ]]
        -- upvalues: v93 (ref)
        if v96:IsA("FaceControls") then
            v93();
        end;
    end);
end;
local function _(v98) --[[ Line: 392 ]] --[[ Name: syncWithStreamTrack ]]
    -- upvalues: v14 (copy), v13 (copy), l_Core_0 (ref), v8 (ref)
    local l_StreamTrackStopped_0 = v14.StreamTrackStopped;
    if v13[l_StreamTrackStopped_0] ~= nil then
        v13[l_StreamTrackStopped_0]:Disconnect();
        v13[l_StreamTrackStopped_0] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Idle;
    if v8 then
        v8.Priority = l_Core_0;
    end;
    v13[v14.StreamTrackStopped] = v98.Stopped:Connect(function() --[[ Line: 400 ]]
        -- upvalues: v14 (ref), v13 (ref), l_Core_0 (ref), v8 (ref)
        local l_StreamTrackStopped_1 = v14.StreamTrackStopped;
        if v13[l_StreamTrackStopped_1] ~= nil then
            v13[l_StreamTrackStopped_1]:Disconnect();
            v13[l_StreamTrackStopped_1] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Core;
        if v8 then
            v8.Priority = l_Core_0;
        end;
    end);
end;
local function v113(v102) --[[ Line: 408 ]] --[[ Name: onAnimatorAdded ]]
    -- upvalues: v14 (copy), v13 (copy), l_Core_0 (ref), v8 (ref)
    local l_AnimationStreamTrackPlayed_0 = v14.AnimationStreamTrackPlayed;
    if v13[l_AnimationStreamTrackPlayed_0] ~= nil then
        v13[l_AnimationStreamTrackPlayed_0]:Disconnect();
        v13[l_AnimationStreamTrackPlayed_0] = nil;
    end;
    v13[v14.AnimationStreamTrackPlayed] = v102.AnimationStreamTrackPlayed:Connect(function(v104) --[[ Line: 413 ]]
        -- upvalues: v14 (ref), v13 (ref), l_Core_0 (ref), v8 (ref)
        local l_StreamTrackStopped_2 = v14.StreamTrackStopped;
        if v13[l_StreamTrackStopped_2] ~= nil then
            v13[l_StreamTrackStopped_2]:Disconnect();
            v13[l_StreamTrackStopped_2] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Idle;
        if v8 then
            v8.Priority = l_Core_0;
        end;
        v13[v14.StreamTrackStopped] = v104.Stopped:Connect(function() --[[ Line: 400 ]]
            -- upvalues: v14 (ref), v13 (ref), l_Core_0 (ref), v8 (ref)
            local l_StreamTrackStopped_3 = v14.StreamTrackStopped;
            if v13[l_StreamTrackStopped_3] ~= nil then
                v13[l_StreamTrackStopped_3]:Disconnect();
                v13[l_StreamTrackStopped_3] = nil;
            end;
            l_Core_0 = Enum.AnimationPriority.Core;
            if v8 then
                v8.Priority = l_Core_0;
            end;
        end);
    end);
    l_AnimationStreamTrackPlayed_0 = v102:GetPlayingAnimationTracksCoreScript();
    local v107 = nil;
    for _, v109 in l_AnimationStreamTrackPlayed_0 do
        if v109:IsA("AnimationStreamTrack") then
            v107 = v109;
            break;
        end;
    end;
    if v107 then
        local l_v107_0 = v107;
        local l_StreamTrackStopped_4 = v14.StreamTrackStopped;
        if v13[l_StreamTrackStopped_4] ~= nil then
            v13[l_StreamTrackStopped_4]:Disconnect();
            v13[l_StreamTrackStopped_4] = nil;
        end;
        l_Core_0 = Enum.AnimationPriority.Idle;
        if v8 then
            v8.Priority = l_Core_0;
        end;
        v13[v14.StreamTrackStopped] = l_v107_0.Stopped:Connect(function() --[[ Line: 400 ]]
            -- upvalues: v14 (ref), v13 (ref), l_Core_0 (ref), v8 (ref)
            local l_StreamTrackStopped_5 = v14.StreamTrackStopped;
            if v13[l_StreamTrackStopped_5] ~= nil then
                v13[l_StreamTrackStopped_5]:Disconnect();
                v13[l_StreamTrackStopped_5] = nil;
            end;
            l_Core_0 = Enum.AnimationPriority.Core;
            if v8 then
                v8.Priority = l_Core_0;
            end;
        end);
        return;
    else
        l_Core_0 = Enum.AnimationPriority.Core;
        if v8 then
            v8.Priority = l_Core_0;
        end;
        return;
    end;
end;
local _ = function(_) --[[ Line: 435 ]] --[[ Name: onAnimatorRemoving_Deprecated ]]
    -- upvalues: v14 (copy), v13 (copy), l_Core_0 (ref), v8 (ref)
    assert(not game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
    local l_AnimationStreamTrackPlayed_1 = v14.AnimationStreamTrackPlayed;
    if v13[l_AnimationStreamTrackPlayed_1] ~= nil then
        v13[l_AnimationStreamTrackPlayed_1]:Disconnect();
        v13[l_AnimationStreamTrackPlayed_1] = nil;
    end;
    l_AnimationStreamTrackPlayed_1 = v14.StreamTrackStopped;
    if v13[l_AnimationStreamTrackPlayed_1] ~= nil then
        v13[l_AnimationStreamTrackPlayed_1]:Disconnect();
        v13[l_AnimationStreamTrackPlayed_1] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Core;
    if v8 then
        v8.Priority = l_Core_0;
    end;
end;
local function v121(v117, _) --[[ Line: 445 ]] --[[ Name: onAnimatorRemoving ]]
    -- upvalues: v14 (copy), v13 (copy), l_Core_0 (ref), v8 (ref), v113 (copy)
    assert(game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
    local l_AnimationStreamTrackPlayed_2 = v14.AnimationStreamTrackPlayed;
    if v13[l_AnimationStreamTrackPlayed_2] ~= nil then
        v13[l_AnimationStreamTrackPlayed_2]:Disconnect();
        v13[l_AnimationStreamTrackPlayed_2] = nil;
    end;
    l_AnimationStreamTrackPlayed_2 = v14.StreamTrackStopped;
    if v13[l_AnimationStreamTrackPlayed_2] ~= nil then
        v13[l_AnimationStreamTrackPlayed_2]:Disconnect();
        v13[l_AnimationStreamTrackPlayed_2] = nil;
    end;
    l_Core_0 = Enum.AnimationPriority.Core;
    if v8 then
        v8.Priority = l_Core_0;
    end;
    local v120 = if v117.Character then v117.Character:FindFirstChildOfClass("Humanoid") else nil;
    l_AnimationStreamTrackPlayed_2 = if v120 then v120:FindFirstChildOfClass("Animator") else nil;
    if l_AnimationStreamTrackPlayed_2 then
        v113(l_AnimationStreamTrackPlayed_2);
    end;
end;
local function v132(v122, v123) --[[ Line: 462 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v97 (copy), v13 (copy), v14 (copy), v8 (ref), v113 (copy), v121 (copy), l_Core_0 (ref)
    local l_Head_0 = v123:FindFirstChild("Head");
    if l_Head_0 then
        v97(l_Head_0);
    end;
    v13[v14.CharacterChildAdded] = v123.ChildAdded:Connect(function(v125) --[[ Line: 468 ]]
        -- upvalues: v97 (ref)
        if v125.Name == "Head" then
            v97(v125);
        end;
    end);
    v13[v14.CharacterChildRemoved] = v123.ChildRemoved:Connect(function(v126) --[[ Line: 474 ]]
        -- upvalues: v8 (ref), v123 (copy), v97 (ref)
        if v126.Name == "Head" then
            if v8 ~= nil then
                v8:Stop();
                v8:Destroy();
                v8 = nil;
            end;
            local l_Head_1 = v123:FindFirstChild("Head");
            if l_Head_1 then
                v97(l_Head_1);
            end;
        end;
    end);
    v13[v14.DescendantAdded] = v123.DescendantAdded:Connect(function(v128) --[[ Line: 484 ]]
        -- upvalues: v113 (ref)
        if v128:IsA("Animator") then
            v113(v128);
        end;
    end);
    local l_v123_FirstChildWhichIsA_0 = v123:FindFirstChildWhichIsA("Animator", true);
    if l_v123_FirstChildWhichIsA_0 then
        v113(l_v123_FirstChildWhichIsA_0);
    end;
    v13[v14.DescendantRemoving] = v123.DescendantRemoving:Connect(function(v130) --[[ Line: 494 ]]
        -- upvalues: v121 (ref), v122 (copy), v14 (ref), v13 (ref), l_Core_0 (ref), v8 (ref)
        if v130:IsA("Animator") then
            if game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator") then
                v121(v122, v130);
                return;
            else
                assert(not game:GetFastFlag("AvatarMoodSearchForReplacementWhenRemovingAnimator"));
                local l_AnimationStreamTrackPlayed_3 = v14.AnimationStreamTrackPlayed;
                if v13[l_AnimationStreamTrackPlayed_3] ~= nil then
                    v13[l_AnimationStreamTrackPlayed_3]:Disconnect();
                    v13[l_AnimationStreamTrackPlayed_3] = nil;
                end;
                l_AnimationStreamTrackPlayed_3 = v14.StreamTrackStopped;
                if v13[l_AnimationStreamTrackPlayed_3] ~= nil then
                    v13[l_AnimationStreamTrackPlayed_3]:Disconnect();
                    v13[l_AnimationStreamTrackPlayed_3] = nil;
                end;
                l_Core_0 = Enum.AnimationPriority.Core;
                if v8 then
                    v8.Priority = l_Core_0;
                end;
            end;
        end;
    end);
end;
local function v136(_) --[[ Line: 505 ]] --[[ Name: onCharacterRemoving ]]
    -- upvalues: v8 (ref), v13 (copy)
    if v8 ~= nil then
        v8:Stop();
        v8:Destroy();
        v8 = nil;
    end;
    for _, v135 in pairs(v13) do
        if v135 then
            v135:Disconnect();
        end;
    end;
    table.clear(v13);
end;
if l_LocalPlayer_0.Character then
    v132(l_LocalPlayer_0, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(v137) --[[ Line: 519 ]]
    -- upvalues: v132 (copy), l_LocalPlayer_0 (copy)
    v132(l_LocalPlayer_0, v137);
end);
l_LocalPlayer_0.CharacterRemoving:Connect(v136);