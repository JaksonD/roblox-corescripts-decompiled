local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_BlockedStatusChangedEvent_0 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent();
local l_default_0 = require(script.Parent.Parent.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local l_VOICE_STATE_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants.VOICE_STATE;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
local v10 = nil;
v10 = if game:GetEngineFeature("VoiceChatSupported") then Enum.VoiceChatState else {
    Idle = 1, 
    Joining = 2, 
    JoiningRetry = 3, 
    Joined = 4, 
    Leaving = 5, 
    Ended = 6, 
    Failed = 7
};
local v11 = {
    [v10.Idle] = l_VOICE_STATE_0.HIDDEN, 
    [v10.Joining] = l_VOICE_STATE_0.CONNECTING, 
    [v10.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
    [v10.Joined] = l_VOICE_STATE_0.MUTED, 
    [v10.Leaving] = l_VOICE_STATE_0.MUTED, 
    [v10.Ended] = l_VOICE_STATE_0.HIDDEN, 
    [v10.Failed] = l_VOICE_STATE_0.ERROR
};
local function _(v12) --[[ Line: 74 ]] --[[ Name: mapVoiceChatStateToVoiceState ]]
    -- upvalues: v11 (copy), l_VOICE_STATE_0 (copy)
    if not v11[v12] then
        return l_VOICE_STATE_0.MUTED;
    else
        return v11[v12];
    end;
end;
local function _(v14) --[[ Line: 82 ]] --[[ Name: mapParticipantStateToVoiceState ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if v14.subscriptionFailed then
        return l_VOICE_STATE_0.ERROR;
    elseif not v14.subscriptionCompleted then
        return l_VOICE_STATE_0.CONNECTING;
    elseif v14.isMutedLocally then
        return l_VOICE_STATE_0.LOCAL_MUTED;
    elseif v14.isMuted then
        return l_VOICE_STATE_0.MUTED;
    else
        if v14.isSignalActive then
            l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
        end;
        return l_INACTIVE_0;
    end;
end;
return function(v17, v18, v19) --[[ Line: 98 ]] --[[ Name: useVoiceState ]]
    -- upvalues: l_default_0 (copy), v1 (copy), v6 (copy), l_VOICE_STATE_0 (copy), v9 (copy), v11 (copy), v10 (ref), l_BlockedStatusChangedEvent_0 (copy)
    local v20 = v19 and v19.voiceChatServiceManager or l_default_0;
    local v21 = v1.useContext(v6.Context);
    local v22, v23 = v1.useState(l_VOICE_STATE_0.HIDDEN);
    v1.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v21 (copy), v17 (copy), v18 (copy), v23 (copy), l_VOICE_STATE_0 (ref), v9 (ref), v22 (copy), v11 (ref), v20 (copy), v10 (ref), l_BlockedStatusChangedEvent_0 (ref)
        if not v21.voiceEnabled or not v17 or v18 then
            v23(l_VOICE_STATE_0.HIDDEN);
            return function() --[[ Line: 106 ]]

            end;
        else
            local v24 = tonumber(v17);
            local v25 = tostring(v17);
            local v26 = v9 == v24;
            local v27 = nil;
            local v28 = {};
            local v29 = false;
            local function _(v30) --[[ Line: 117 ]] --[[ Name: updateVoiceState ]]
                -- upvalues: v29 (ref), v23 (ref)
                if not v29 then
                    v23(v30);
                end;
            end;
            local function v37(v32) --[[ Line: 123 ]] --[[ Name: setVoiceEnabled ]]
                -- upvalues: v22 (ref), v26 (copy), v11 (ref), l_VOICE_STATE_0 (ref), v20 (ref), v25 (copy), v27 (ref), v10 (ref), v29 (ref), v23 (ref)
                local l_v22_0 = v22;
                if v26 then
                    l_v22_0 = if not v11[v32] then l_VOICE_STATE_0.MUTED else v11[v32];
                else
                    local v34 = v20.participants[v25];
                    if v34 and not v27 then
                        local l_INACTIVE_1 = l_VOICE_STATE_0.INACTIVE;
                        if v34.subscriptionFailed then
                            l_INACTIVE_1 = l_VOICE_STATE_0.ERROR;
                        elseif not v34.subscriptionCompleted then
                            l_INACTIVE_1 = l_VOICE_STATE_0.CONNECTING;
                        elseif v34.isMutedLocally then
                            l_INACTIVE_1 = l_VOICE_STATE_0.LOCAL_MUTED;
                        elseif v34.isMuted then
                            l_INACTIVE_1 = l_VOICE_STATE_0.MUTED;
                        elseif v34.isSignalActive then
                            l_INACTIVE_1 = l_VOICE_STATE_0.TALKING;
                        end;
                        l_v22_0 = l_INACTIVE_1;
                    end;
                end;
                if v32 == v10.Failed then
                    if not v26 then
                        l_v22_0 = l_VOICE_STATE_0.HIDDEN;
                    end;
                elseif v32 == v10.Joined and not v20.localMuted and v26 then
                    l_v22_0 = if v20.isTalking then l_VOICE_STATE_0.TALKING else if v20.localMuted then l_VOICE_STATE_0.MUTED else l_VOICE_STATE_0.INACTIVE;
                end;
                local l_l_v22_0_0 = l_v22_0;
                if not v29 then
                    v23(l_l_v22_0_0);
                end;
            end;
            v37(v21.voiceState);
            delay(0, function() --[[ Line: 157 ]]
                -- upvalues: v29 (ref), v37 (copy), v21 (ref), v26 (copy), v28 (copy), v20 (ref), l_VOICE_STATE_0 (ref), v23 (ref), v25 (copy), v27 (ref), v24 (copy), l_BlockedStatusChangedEvent_0 (ref)
                if v29 then
                    return;
                else
                    v37(v21.voiceState);
                    if v26 then
                        table.insert(v28, v20.talkingChanged.Event:Connect(function(v38) --[[ Line: 168 ]]
                            -- upvalues: l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref)
                            local v39 = if v38 then l_VOICE_STATE_0.TALKING else l_VOICE_STATE_0.INACTIVE;
                            if not v29 then
                                v23(v39);
                            end;
                        end));
                        table.insert(v28, v20.muteChanged.Event:Connect(function(v40) --[[ Line: 175 ]]
                            -- upvalues: l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref)
                            local v41 = if v40 then l_VOICE_STATE_0.MUTED else l_VOICE_STATE_0.INACTIVE;
                            if not v29 then
                                v23(v41);
                            end;
                        end));
                        return;
                    else
                        table.insert(v28, v20.participantsUpdate.Event:Connect(function(v42) --[[ Line: 183 ]]
                            -- upvalues: v25 (ref), v27 (ref), l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref)
                            local v43 = v42[v25];
                            if v43 and not v27 then
                                local l_INACTIVE_2 = l_VOICE_STATE_0.INACTIVE;
                                if v43.subscriptionFailed then
                                    l_INACTIVE_2 = l_VOICE_STATE_0.ERROR;
                                elseif not v43.subscriptionCompleted then
                                    l_INACTIVE_2 = l_VOICE_STATE_0.CONNECTING;
                                elseif v43.isMutedLocally then
                                    l_INACTIVE_2 = l_VOICE_STATE_0.LOCAL_MUTED;
                                elseif v43.isMuted then
                                    l_INACTIVE_2 = l_VOICE_STATE_0.MUTED;
                                elseif v43.isSignalActive then
                                    l_INACTIVE_2 = l_VOICE_STATE_0.TALKING;
                                end;
                                local l_l_INACTIVE_2_0 = l_INACTIVE_2;
                                if not v29 then
                                    v23(l_l_INACTIVE_2_0);
                                    return;
                                end;
                            else
                                local l_HIDDEN_0 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_0);
                                end;
                            end;
                        end));
                        table.insert(v28, v20.participantLeft.Event:Connect(function(_, v48) --[[ Line: 195 ]]
                            -- upvalues: v24 (ref), l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref)
                            if v48 == v24 then
                                local l_HIDDEN_1 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_1);
                                end;
                            end;
                        end));
                        table.insert(v28, v20.participantJoined.Event:Connect(function(_, v51) --[[ Line: 204 ]]
                            -- upvalues: v24 (ref), l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref)
                            if v51 == v24 then
                                local l_HIDDEN_2 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_2);
                                end;
                            end;
                        end));
                        table.insert(v28, l_BlockedStatusChangedEvent_0:Connect(function(v53, v54) --[[ Line: 215 ]]
                            -- upvalues: v24 (ref), v27 (ref), l_VOICE_STATE_0 (ref), v29 (ref), v23 (ref), v20 (ref), v25 (ref)
                            if v24 == v53 then
                                if v54 then
                                    v27 = true;
                                    local l_HIDDEN_3 = l_VOICE_STATE_0.HIDDEN;
                                    if not v29 then
                                        v23(l_HIDDEN_3);
                                        return;
                                    end;
                                else
                                    v27 = nil;
                                    local v56 = v20.participants[v25];
                                    if v56 then
                                        local l_INACTIVE_3 = l_VOICE_STATE_0.INACTIVE;
                                        if v56.subscriptionFailed then
                                            l_INACTIVE_3 = l_VOICE_STATE_0.ERROR;
                                        elseif not v56.subscriptionCompleted then
                                            l_INACTIVE_3 = l_VOICE_STATE_0.CONNECTING;
                                        elseif v56.isMutedLocally then
                                            l_INACTIVE_3 = l_VOICE_STATE_0.LOCAL_MUTED;
                                        elseif v56.isMuted then
                                            l_INACTIVE_3 = l_VOICE_STATE_0.MUTED;
                                        elseif v56.isSignalActive then
                                            l_INACTIVE_3 = l_VOICE_STATE_0.TALKING;
                                        end;
                                        local l_l_INACTIVE_3_0 = l_INACTIVE_3;
                                        if not v29 then
                                            v23(l_l_INACTIVE_3_0);
                                            return;
                                        end;
                                    else
                                        local l_HIDDEN_4 = l_VOICE_STATE_0.HIDDEN;
                                        if not v29 then
                                            v23(l_HIDDEN_4);
                                        end;
                                    end;
                                end;
                            end;
                        end));
                        return;
                    end;
                end;
            end);
            return function() --[[ Line: 235 ]]
                -- upvalues: v29 (ref), v28 (copy)
                v29 = true;
                delay(0, function() --[[ Line: 238 ]]
                    -- upvalues: v28 (ref)
                    for _, v61 in v28 do
                        v61:disconnect();
                    end;
                end);
            end;
        end;
    end, {
        v17, 
        v21.voiceState, 
        v18 == true
    });
    return v22;
end;