local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local _ = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local v9 = require(script.Parent.dependencies);
local l_RoduxCall_0 = v9.RoduxCall;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local l_teleportToRootPlace_0 = v9.teleportToRootPlace;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableIrisRerouteToRCC");
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
return function(v21) --[[ Line: 26 ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), l_RoduxCall_0 (copy), l_Players_0 (copy), l_FaceAnimatorService_0 (copy), l_default_0 (copy), v14 (ref), v15 (ref), v16 (ref), v17 (ref), l_game_EngineFeature_0 (copy), v18 (ref), l_HttpService_0 (copy), v19 (ref), v20 (ref), l_CallAction_0 (copy), l_teleportToRootPlace_0 (copy)
    local function _(v22) --[[ Line: 27 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        coroutine.wrap(function() --[[ Line: 28 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v22 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v22);
        end)();
    end;
    v21:getCallState():andThen(function(v24) --[[ Line: 40 ]]
        -- upvalues: l_RoduxCall_0 (ref), l_Players_0 (ref), v21 (copy)
        if v24.status == l_RoduxCall_0.Enums.Status.Teleporting and l_Players_0.LocalPlayer and v24.callerId == l_Players_0.LocalPlayer.UserId and v24.callId then
            if v24.instanceId == game.JobId then
                v21:teleportSuccessCall(v24.callId);
                return;
            else
                v21:finishCall(v24.callId);
                return;
            end;
        else
            if v24.status == l_RoduxCall_0.Enums.Status.Accepting and l_Players_0.LocalPlayer and v24.calleeId == l_Players_0.LocalPlayer.UserId and v24.callId then
                if v24.instanceId == game.JobId then
                    v21:answerSuccessCall(v24.callId);
                    return;
                else
                    v21:rejectCall(v24.callId);
                end;
            end;
            return;
        end;
    end);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 69 ]]
        -- upvalues: v21 (copy), l_FaceAnimatorService_0 (ref)
        v21:updateMicAndCamState(nil, l_FaceAnimatorService_0.VideoAnimationEnabled);
    end);
    l_default_0.muteChanged.Event:Connect(function(v25) --[[ Line: 74 ]]
        -- upvalues: l_default_0 (ref), v21 (copy)
        local v26 = l_default_0:getService();
        if v26 and v26.VoiceChatState ~= Enum.VoiceChatState.Leaving and v26.VoiceChatState ~= Enum.VoiceChatState.Ended then
            v21:updateMicAndCamState(v25, nil);
        end;
    end);
    v14 = v21:listenToHandleMicAndCamChanged(function(v27) --[[ Line: 87 ]]
        -- upvalues: l_default_0 (ref), l_FaceAnimatorService_0 (ref)
        local v28 = l_default_0:getService();
        if v28 and v28.VoiceChatState == Enum.VoiceChatState.Joined and l_default_0.localMuted ~= nil and v27.muted ~= nil and v27.muted ~= l_default_0.localMuted then
            l_default_0:ToggleMic("CallAPI");
        end;
        if l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled ~= v27.camEnabled and v27.camEnabled ~= nil then
            l_FaceAnimatorService_0.VideoAnimationEnabled = v27.camEnabled;
        end;
    end);
    v15 = v21:listenToHandleTeleportingCall(function(v29) --[[ Line: 111 ]]
        -- upvalues: l_RoduxCall_0 (ref), l_Players_0 (ref), v21 (copy), l_RobloxReplicatedStorage_0 (ref)
        if v29.status == l_RoduxCall_0.Enums.Status.Teleporting and l_Players_0.LocalPlayer and v29.callId and v29.callerId == l_Players_0.LocalPlayer.UserId then
            coroutine.wrap(function() --[[ Line: 118 ]]
                -- upvalues: v29 (copy), v21 (ref), l_RobloxReplicatedStorage_0 (ref)
                if v29.instanceId == game.JobId then
                    v21:teleportSuccessCall(v29.callId);
                    return;
                else
                    l_RobloxReplicatedStorage_0:WaitForChild("ContactListIrisInviteTeleport", 1e999):FireServer(v29.placeId, v29.instanceId, v29.reservedServerAccessCode, v29.callId);
                    return;
                end;
            end)();
        end;
    end);
    v16 = v21:listenToHandleTransferCallTeleportJoin(function(v30) --[[ Line: 138 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local v31 = {
            callId = v30.callId, 
            participants = {
                tostring(v30.callerId), 
                (tostring(v30.calleeId))
            }
        };
        coroutine.wrap(function() --[[ Line: 28 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v31 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v31);
        end)();
    end);
    v17 = v21:listenToHandleTransferCallTeleportLeave(function(_) --[[ Line: 145 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local l_wrap_0 = coroutine.wrap;
        local v34 = nil;
        l_wrap_0(function() --[[ Line: 28 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v34 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v34);
        end)();
    end);
    if l_game_EngineFeature_0 then
        v18 = v21:listenToHandleInitCall(function(v35) --[[ Line: 152 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), l_HttpService_0 (ref)
            coroutine.wrap(function() --[[ Line: 153 ]]
                -- upvalues: l_RobloxReplicatedStorage_0 (ref), v35 (copy), l_HttpService_0 (ref)
                l_RobloxReplicatedStorage_0:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(v35.tag, v35.calleeId, v35.calleeCombinedName, v35.muted, v35.camEnabled, l_HttpService_0:GetUserAgent(), 2);
            end)();
        end);
    end;
    v19 = v21:listenToHandleActiveCall(function(v36) --[[ Line: 169 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
        local v37 = {
            callId = v36.callId, 
            participants = {
                tostring(v36.callerId), 
                (tostring(v36.calleeId))
            }
        };
        coroutine.wrap(function() --[[ Line: 28 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v37 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v37);
        end)();
    end);
    v20 = v21:listenToHandleEndCall(function(v38) --[[ Line: 176 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref), l_CallAction_0 (ref), l_teleportToRootPlace_0 (ref)
        local l_wrap_1 = coroutine.wrap;
        local v40 = nil;
        l_wrap_1(function() --[[ Line: 28 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v40 (copy)
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", 1e999):FireServer(v40);
        end)();
        if v38.callAction == l_CallAction_0.Finish and game.JobId == v38.instanceId then
            l_teleportToRootPlace_0();
        end;
    end);
end;