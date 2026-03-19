local v0 = {};
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
v0.EMOTE_LOOP_TRANSITION_WAIT_TIME = 0.3;
v0.EMOTE_LOOP_WAIT_TIMEOUT = 5;
v0.LegacyDefaultEmotes = {
    wave = true, 
    point = true, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = true, 
    cheer = true
};
local function _(v3) --[[ Line: 21 ]] --[[ Name: clearConnection ]]
    if v3 then
        v3:Disconnect();
    end;
end;
v0.getAnyActiveDefaultChatTriggeredEmoteTrack = function(v5) --[[ Line: 30 ]] --[[ Name: getAnyActiveDefaultChatTriggeredEmoteTrack ]]
    -- upvalues: v0 (copy)
    if not v5.Character then
        return nil;
    else
        local l_Humanoid_0 = v5.Character:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_0 then
            return nil;
        else
            local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
            if not l_Animator_0 then
                return nil;
            else
                local l_l_Animator_0_PlayingAnimationTracks_0 = l_Animator_0:GetPlayingAnimationTracks();
                for _, v10 in pairs(l_l_Animator_0_PlayingAnimationTracks_0) do
                    if v10.Animation and v10.Animation.Parent and v10:IsA("AnimationTrack") then
                        local l_Name_0 = v10.Animation.Parent.Name;
                        if v0.LegacyDefaultEmotes[l_Name_0] and v10.IsPlaying then
                            return v10;
                        end;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v12(v13, v14, v15, v16) --[[ Line: 63 ]] --[[ Name: waitForEmoteEventInternal ]]
    -- upvalues: v2 (copy), v0 (copy), v12 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v18 = os.clock();
    local v19 = true;
    local function _() --[[ Line: 72 ]]
        -- upvalues: v19 (ref), l_BindableEvent_0 (copy)
        if v19 and l_BindableEvent_0 then
            v19 = false;
            l_BindableEvent_0:Fire();
        end;
    end;
    local v21 = v14.Stopped:Connect(function() --[[ Line: 80 ]]
        -- upvalues: v2 (ref), v19 (ref), l_BindableEvent_0 (copy)
        v2:trace("EmoteHelper.waitForEmoteEventInternal: Stopped");
        if v19 and l_BindableEvent_0 then
            v19 = false;
            l_BindableEvent_0:Fire();
        end;
    end);
    local v23 = v14.KeyframeReached:Connect(function(v22) --[[ Line: 90 ]]
        -- upvalues: v14 (copy), v15 (copy), v2 (ref), v19 (ref), l_BindableEvent_0 (copy), v18 (ref)
        if v22 == "End" and (not v14.Looped or v15) then
            v2:trace("EmoteHelper.waitForEmoteEventInternal: KeyframeReached");
            if v19 and l_BindableEvent_0 then
                v19 = false;
                l_BindableEvent_0:Fire();
                return;
            end;
        else
            v18 = os.clock();
        end;
    end);
    task.spawn(function() --[[ Line: 101 ]]
        -- upvalues: v18 (ref), v19 (ref), v0 (ref), v2 (ref), l_BindableEvent_0 (copy)
        local v24 = os.clock() - v18;
        while v19 and v24 < v0.EMOTE_LOOP_WAIT_TIMEOUT do
            wait(v0.EMOTE_LOOP_WAIT_TIMEOUT - v24);
            v24 = os.clock() - v18;
        end;
        if v19 then
            v2:trace("EmoteHelper.waitForEmoteEventInternal: Timeout!");
            if v19 and l_BindableEvent_0 then
                v19 = false;
                l_BindableEvent_0:Fire();
            end;
        end;
    end);
    l_BindableEvent_0.Event:Wait();
    l_BindableEvent_0:Destroy();
    if v21 then
        v21:Disconnect();
    end;
    if v23 then
        v23:Disconnect();
    end;
    if v15 then
        wait(v0.EMOTE_LOOP_TRANSITION_WAIT_TIME);
        local v25 = v0.getAnyActiveDefaultChatTriggeredEmoteTrack(v13);
        if v25 then
            v12(v13, v25, v15, v16);
        elseif v16 then
            v16();
        end;
    elseif v16 then
        v16();
    end;
end;
v0.createEmoteFinishEvent = function(v26, v27, v28) --[[ Line: 139 ]] --[[ Name: createEmoteFinishEvent ]]
    -- upvalues: v12 (copy)
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    task.spawn(v12, v26, v27, v28, function() --[[ Line: 144 ]]
        -- upvalues: l_BindableEvent_1 (copy)
        l_BindableEvent_1:Fire();
        l_BindableEvent_1:Destroy();
    end);
    return l_BindableEvent_1.Event;
end;
return v0;