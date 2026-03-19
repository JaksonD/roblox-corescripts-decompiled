local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local l_GetFFlagLocalMutedNilFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix;
local v5 = require(script.Parent.Actions.VoiceEnabledChanged);
local v6 = require(script.Parent.Actions.VoiceStateChanged);
local v7 = require(script.Parent.Actions.ParticipantAdded);
local v8 = require(script.Parent.Actions.ParticipantRemoved);
local v9 = require(script.Parent.Actions.PlayerRemoved);
local l_default_0 = require(script.Parent.VoiceChatServiceManager).default;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants;
local v12 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v13 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
local v14 = nil;
v14 = if v3() then l_Constants_0.VOICE_STATE else l_default_0.VOICE_STATE;
local function _(v15) --[[ Line: 28 ]] --[[ Name: shorten ]]
    return "..." .. string.sub(tostring(v15), -4);
end;
local v17 = nil;
local function v25(v18, v19) --[[ Line: 34 ]] --[[ Name: setVoiceEnabled ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), v17 (ref), v13 (copy), v6 (copy), v14 (ref), l_GetFFlagLocalMutedNilFix_0 (copy), l_default_0 (copy)
    local v20 = tostring(l_Players_0.LocalPlayer.UserId);
    local v21 = v18 ~= Enum.VoiceChatState.Ended;
    v19:dispatch(v5(v21));
    if not v17[v18] then
        v13:warning("LOCAL_STATE_MAP does not exist for {} state", v18);
        v19:dispatch(v6(v20, v14.MUTED));
    else
        v19:dispatch(v6(v20, v17[v18]));
    end;
    if v18 == Enum.VoiceChatState.Failed then
        for _, v23 in pairs(l_Players_0:GetPlayers()) do
            local v24 = tostring(v23.UserId);
            if v23 ~= l_Players_0.LocalPlayer then
                v19:dispatch(v6(v24, v14.HIDDEN));
            end;
        end;
        return;
    else
        if v18 == Enum.VoiceChatState.Joined and if l_GetFFlagLocalMutedNilFix_0 then l_default_0.localMuted == false else not l_default_0.localMuted then
            v19:dispatch(v6(v20, v14.INACTIVE));
        end;
        return;
    end;
end;
local function v44(v26) --[[ Line: 64 ]]
    -- upvalues: v17 (ref), v14 (ref), l_default_0 (copy), v13 (copy), l_Players_0 (copy), v7 (copy), v9 (copy), v8 (copy), v6 (copy), v12 (copy), v25 (copy)
    v17 = {
        [Enum.VoiceChatState.Idle] = v14.HIDDEN, 
        [Enum.VoiceChatState.Joining] = v14.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = v14.CONNECTING, 
        [Enum.VoiceChatState.Joined] = v14.MUTED, 
        [Enum.VoiceChatState.Leaving] = v14.MUTED, 
        [Enum.VoiceChatState.Ended] = v14.HIDDEN, 
        [Enum.VoiceChatState.Failed] = v14.ERROR
    };
    local v27 = l_default_0:getService();
    if not v27 then
        v13:debug("VoiceChatService is not available");
        return;
    else
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        for _, v30 in pairs(l_Players_0:GetPlayers()) do
            v13:trace("Adding existing player {}", "..." .. string.sub(tostring(v30.UserId), -4));
            v26:dispatch(v7((tostring(v30.UserId))));
        end;
        l_Players_0.PlayerAdded:Connect(function(v31) --[[ Line: 88 ]]
            -- upvalues: v13 (ref), v26 (copy), v7 (ref)
            v13:trace("Adding joining player {}", "..." .. string.sub(tostring(v31.UserId), -4));
            v26:dispatch(v7((tostring(v31.userId))));
        end);
        l_Players_0.PlayerRemoving:Connect(function(v32) --[[ Line: 93 ]]
            -- upvalues: v13 (ref), v26 (copy), v9 (ref), v8 (ref)
            v13:trace("Removing player {}", "..." .. string.sub(tostring(v32.UserId), -4));
            v26:dispatch(v9((tostring(v32.userId))));
            v26:dispatch(v8((tostring(v32.userId))));
        end);
        v26:dispatch(v6(l_UserId_0, v14.HIDDEN));
        l_default_0.muteChanged.Event:Connect(function(v33) --[[ Line: 101 ]]
            -- upvalues: v13 (ref), v14 (ref), v26 (copy), v6 (ref), l_UserId_0 (copy)
            v13:debug("Mute changed to {}", v33);
            local v34 = v33 and v14.MUTED or v14.INACTIVE;
            v26:dispatch(v6(l_UserId_0, v34));
        end);
        l_default_0.participantsUpdate.Event:Connect(function(v35) --[[ Line: 107 ]]
            -- upvalues: v14 (ref), v13 (ref), v26 (copy), v6 (ref)
            for v36, v37 in pairs(v35) do
                local l_INACTIVE_0 = v14.INACTIVE;
                if v37.subscriptionFailed then
                    l_INACTIVE_0 = v14.ERROR;
                elseif not v37.subscriptionCompleted then
                    l_INACTIVE_0 = v14.CONNECTING;
                elseif v37.isMutedLocally then
                    l_INACTIVE_0 = v14.LOCAL_MUTED;
                elseif v37.isMuted then
                    l_INACTIVE_0 = v14.MUTED;
                elseif v37.isSignalActive then
                    l_INACTIVE_0 = v14.TALKING;
                end;
                v13:trace("Participant update for {}, voice state {}", v36, l_INACTIVE_0);
                v26:dispatch(v6(v36, l_INACTIVE_0));
            end;
        end);
        l_default_0.talkingChanged.Event:Connect(function(v39) --[[ Line: 128 ]]
            -- upvalues: v26 (copy), v6 (ref), l_UserId_0 (copy), v14 (ref)
            if v39 then
                v26:dispatch(v6(l_UserId_0, v14.TALKING));
                return;
            else
                v26:dispatch(v6(l_UserId_0, v14.INACTIVE));
                return;
            end;
        end);
        v12:GetBlockedStatusChangedEvent():Connect(function(v40, v41) --[[ Line: 139 ]]
            -- upvalues: v26 (copy), v8 (ref), v7 (ref)
            if v41 then
                v26:dispatch(v8((tostring(v40))));
                return;
            else
                v26:dispatch(v7((tostring(v40))));
                return;
            end;
        end);
        v13:debug("Initial voice state is {}", v27.VoiceChatState);
        v25(v27.VoiceChatState, v26);
        v27.StateChanged:Connect(function(_, v43) --[[ Line: 149 ]]
            -- upvalues: v13 (ref), v25 (ref), v26 (copy)
            v13:debug("Voice state changed to {}", v43);
            v25(v43, v26);
        end);
        return;
    end;
end;
return function(v45) --[[ Line: 155 ]]
    -- upvalues: l_default_0 (copy), v44 (copy), v13 (copy)
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function() --[[ Line: 158 ]]
            -- upvalues: l_default_0 (ref), v44 (ref), v45 (copy)
            l_default_0:SetupParticipantListeners();
            v44(v45);
        end):catch(function() --[[ Line: 162 ]]
            -- upvalues: v13 (ref)
            v13:warning("Failed to init VoiceChatServiceManager");
        end);
    end;
end;