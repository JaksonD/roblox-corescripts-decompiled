local _ = game:GetService("VRService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("RobloxReplicatedStorage");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v10 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local l_game_EngineFeature_0 = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable");
local v15 = game:DefineFastFlag("FacialAnimationStreamingClearTrackImprovementsV2", false);
game:DefineFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving", false);
game:DefineFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator", false);
game:DefineFastFlag("StopStreamTrackOnDeath", false);
game:DefineFastFlag("FacialAnimationStreamingClearAllConnectionsFix2", false);
game:DefineFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C", false);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v17 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v19 = game:DefineFastFlag("UXForCameraPerformanceEnabled", false);
local v20 = game:DefineFastFlag("DisableCameraOnLowspecAndroidCalls", false);
local v21 = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300);
local v22 = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName);
local function v25() --[[ Line: 47 ]]
    return true;
end;
if v20 then
    v25 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
end;
local v26 = require(l_RobloxGui_0.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats);
if not l_FaceAnimatorService_0 or not v17 then
    return;
else
    l_FaceAnimatorService_0.FlipHeadOrientation = true;
    local v27 = require(l_RobloxGui_0.Modules.Emote.EmoteHelper);
    local v28 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
    local v29 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
    local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
    local v31 = {
        CharacterAdded = "CharacterAdded", 
        CharacterRemoving = "CharacterRemoving", 
        CharacterDescendantAdded = "CharacterDescendantAdded", 
        CharacterDescendantRemoving = "CharacterDescendantRemoving", 
        AnimatorDataModelReady = "AnimatorDataModelReady", 
        PlayerEmoted = "PlayerEmoted", 
        PlayerChatted = "PlayerChatted", 
        EmoteFinished = "EmoteFinished", 
        PlayerDied = "PlayerDied"
    };
    local _ = v8:FormatByKey("Feature.FaceChat.Message.PlaceUnavailable");
    local v33 = false;
    local v34 = os.time();
    local v35 = {};
    local v36 = {};
    local v37 = {};
    local v38 = {};
    local v39 = {};
    local v40 = {};
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local function _(v46, v47) --[[ Line: 106 ]] --[[ Name: playerTrace ]]
        -- upvalues: v10 (copy)
        local v48 = "";
        local v49 = "";
        if v47 then
            if v47.UserId then
                v48 = tostring(v47.UserId);
            end;
            if v47.Name then
                v49 = v47.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v46, v48, v49));
    end;
    local function _(v51, v52) --[[ Line: 120 ]] --[[ Name: clearConnection ]]
        -- upvalues: v38 (copy)
        if v38[v51.UserId] and v38[v51.UserId][v52] then
            v38[v51.UserId][v52]:Disconnect();
            v38[v51.UserId][v52] = nil;
        end;
    end;
    local function v59(v54) --[[ Line: 127 ]] --[[ Name: clearAllConnections ]]
        -- upvalues: v31 (copy), v38 (copy)
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
            for _, v56 in pairs(v31) do
                if v38[v54.UserId] and v38[v54.UserId][v56] then
                    v38[v54.UserId][v56]:Disconnect();
                    v38[v54.UserId][v56] = nil;
                end;
            end;
        else
            for _, v58 in ipairs(v31) do
                if v38[v54.UserId] and v38[v54.UserId][v58] then
                    v38[v54.UserId][v58]:Disconnect();
                    v38[v54.UserId][v58] = nil;
                end;
            end;
        end;
        v38[v54.UserId] = {};
    end;
    local function v63(v60) --[[ Line: 141 ]] --[[ Name: clearCharacterAnimations ]]
        -- upvalues: v10 (copy), v37 (copy), v15 (copy)
        local v61 = "";
        local v62 = "";
        if v60 then
            if v60.UserId then
                v61 = tostring(v60.UserId);
            end;
            if v60.Name then
                v62 = v60.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", v61, v62));
        if v37[v60.UserId] then
            if v15 then
                if v37[v60.UserId].animationTrack then
                    v37[v60.UserId].animationTrack:Stop(0);
                    v37[v60.UserId].animationTrack = nil;
                end;
                if v37[v60.UserId].animation then
                    v37[v60.UserId].animation = nil;
                end;
            else
                if v37[v60.UserId].animation then
                    v37[v60.UserId].animation:Destroy();
                    v37[v60.UserId].animation = nil;
                end;
                if v37[v60.UserId].animationTrack then
                    v37[v60.UserId].animationTrack:Stop(0);
                    v37[v60.UserId].animationTrack:Destroy();
                    v37[v60.UserId].animationTrack = nil;
                end;
            end;
            v37[v60.UserId] = nil;
        end;
    end;
    local function v65(v64) --[[ Line: 168 ]] --[[ Name: getPlayerFaceControls ]]
        if v64 and v64.Character then
            return v64.Character:FindFirstChildWhichIsA("FaceControls", true);
        else
            return nil;
        end;
    end;
    local function v67(v66) --[[ Line: 176 ]] --[[ Name: getPlayerHumanoid ]]
        if v66.Character then
            return v66.Character:FindFirstChildOfClass("Humanoid");
        else
            return nil;
        end;
    end;
    local function v70(v68) --[[ Line: 184 ]] --[[ Name: getPlayerAnimator ]]
        local v69 = if v68.Character then v68.Character:FindFirstChildOfClass("Humanoid") else nil;
        if v69 then
            return v69:FindFirstChildOfClass("Animator");
        else
            return nil;
        end;
    end;
    local function _(v71) --[[ Line: 193 ]] --[[ Name: pauseStreamingAnimationForPlayer ]]
        -- upvalues: v37 (copy), v10 (copy)
        if v37[v71.UserId] and v37[v71.UserId].animationTrack then
            local v72 = "";
            local v73 = "";
            if v71 then
                if v71.UserId then
                    v72 = tostring(v71.UserId);
                end;
                if v71.Name then
                    v73 = v71.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v72, v73));
            v37[v71.UserId].animationTrack:AdjustWeight(0.1, 0.5);
        end;
    end;
    local function _(v75) --[[ Line: 204 ]] --[[ Name: resumeStreamingAnimationForPlayer ]]
        -- upvalues: v37 (copy), v10 (copy)
        if v37[v75.UserId] and v37[v75.UserId].animationTrack then
            local v76 = "";
            local v77 = "";
            if v75 then
                if v75.UserId then
                    v76 = tostring(v75.UserId);
                end;
                if v75.Name then
                    v77 = v75.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v76, v77));
            v37[v75.UserId].animationTrack:AdjustWeight(1, 0.5);
        end;
    end;
    local function _() --[[ Line: 211 ]] --[[ Name: updateStreamTrackStatus ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v37 (copy), v10 (copy)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v37[l_LocalPlayer_0.UserId] and v37[l_LocalPlayer_0.UserId].animationTrack then
                    local v80 = "";
                    local v81 = "";
                    if l_LocalPlayer_0 then
                        if l_LocalPlayer_0.UserId then
                            v80 = tostring(l_LocalPlayer_0.UserId);
                        end;
                        if l_LocalPlayer_0.Name then
                            v81 = l_LocalPlayer_0.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v80, v81));
                    v37[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v37[l_LocalPlayer_0.UserId] and v37[l_LocalPlayer_0.UserId].animationTrack then
                local v82 = "";
                local v83 = "";
                if l_LocalPlayer_0 then
                    if l_LocalPlayer_0.UserId then
                        v82 = tostring(l_LocalPlayer_0.UserId);
                    end;
                    if l_LocalPlayer_0.Name then
                        v83 = l_LocalPlayer_0.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v82, v83));
                v37[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end;
    local function v97(v85, v86, v87) --[[ Line: 225 ]] --[[ Name: handleEmote ]]
        -- upvalues: v10 (copy), v31 (copy), v38 (copy), v37 (copy), v27 (copy), l_FaceAnimatorService_0 (copy)
        local v88 = string.format("handleEmote {isChatTriggered:%s}", (tostring(v87)));
        local v89 = "";
        local v90 = "";
        if v85 then
            if v85.UserId then
                v89 = tostring(v85.UserId);
            end;
            if v85.Name then
                v90 = v85.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v88, v89, v90));
        if v86 then
            v88 = v31.EmoteFinished;
            if v38[v85.UserId] and v38[v85.UserId][v88] then
                v38[v85.UserId][v88]:Disconnect();
                v38[v85.UserId][v88] = nil;
            end;
            if v37[v85.UserId] and v37[v85.UserId].animationTrack then
                v88 = "";
                v89 = "";
                if v85 then
                    if v85.UserId then
                        v88 = tostring(v85.UserId);
                    end;
                    if v85.Name then
                        v89 = v85.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v88, v89));
                v37[v85.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            v38[v85.UserId][v31.EmoteFinished] = v27.createEmoteFinishEvent(v85, v86, v87):Connect(function() --[[ Line: 240 ]]
                -- upvalues: v85 (copy), v31 (ref), v38 (ref), l_FaceAnimatorService_0 (ref), v37 (ref), v10 (ref)
                local l_v85_0 = v85;
                local l_EmoteFinished_0 = v31.EmoteFinished;
                if v38[l_v85_0.UserId] and v38[l_v85_0.UserId][l_EmoteFinished_0] then
                    v38[l_v85_0.UserId][l_EmoteFinished_0]:Disconnect();
                    v38[l_v85_0.UserId][l_EmoteFinished_0] = nil;
                end;
                if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                    l_EmoteFinished_0 = v85;
                    if v37[l_EmoteFinished_0.UserId] and v37[l_EmoteFinished_0.UserId].animationTrack then
                        local v93 = "";
                        local v94 = "";
                        if l_EmoteFinished_0 then
                            if l_EmoteFinished_0.UserId then
                                v93 = tostring(l_EmoteFinished_0.UserId);
                            end;
                            if l_EmoteFinished_0.Name then
                                v94 = l_EmoteFinished_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v93, v94));
                        v37[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                        return;
                    end;
                else
                    l_EmoteFinished_0 = v85;
                    if v37[l_EmoteFinished_0.UserId] and v37[l_EmoteFinished_0.UserId].animationTrack then
                        local v95 = "";
                        local v96 = "";
                        if l_EmoteFinished_0 then
                            if l_EmoteFinished_0.UserId then
                                v95 = tostring(l_EmoteFinished_0.UserId);
                            end;
                            if l_EmoteFinished_0.Name then
                                v96 = l_EmoteFinished_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v95, v96));
                        v37[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                    end;
                end;
            end);
        end;
    end;
    local function v102(v98, v99) --[[ Line: 256 ]] --[[ Name: onPlayerChatted ]]
        -- upvalues: v27 (copy), v97 (copy)
        if if v98.Character then v98.Character:FindFirstChildOfClass("Humanoid") else nil then
            local v100 = nil;
            if string.sub(v99, 1, 3) == "/e " then
                v100 = string.sub(v99, 4);
            elseif string.sub(v99, 1, 7) == "/emote " then
                v100 = string.sub(v99, 8);
            end;
            if v100 and v27.LegacyDefaultEmotes[v100] then
                wait(v27.EMOTE_LOOP_TRANSITION_WAIT_TIME);
                local v101 = v27.getAnyActiveDefaultChatTriggeredEmoteTrack(v98);
                if v101 then
                    v97(v98, v101, true);
                end;
            end;
        end;
    end;
    local function v117(v103, v104) --[[ Line: 279 ]] --[[ Name: onAnimatorAdded ]]
        -- upvalues: v37 (copy), v10 (copy), v31 (copy), v38 (copy), l_game_EngineFeature_0 (copy), l_FaceAnimatorService_0 (copy), l_Players_0 (copy), v39 (copy)
        if not v104 then
            return;
        elseif not v104.Parent or not v104.Parent:IsA("Humanoid") then
            return;
        elseif v37[v103.UserId] then
            local v105 = "";
            local v106 = "";
            if v103 then
                if v103.UserId then
                    v105 = tostring(v103.UserId);
                end;
                if v103.Name then
                    v106 = v103.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", v105, v106));
            return;
        else
            local l_AnimatorDataModelReady_0 = v31.AnimatorDataModelReady;
            if v38[v103.UserId] and v38[v103.UserId][l_AnimatorDataModelReady_0] then
                v38[v103.UserId][l_AnimatorDataModelReady_0]:Disconnect();
                v38[v103.UserId][l_AnimatorDataModelReady_0] = nil;
            end;
            l_AnimatorDataModelReady_0 = function() --[[ Line: 297 ]]
                -- upvalues: v104 (copy), v103 (copy), l_game_EngineFeature_0 (ref), v37 (ref), l_FaceAnimatorService_0 (ref), l_Players_0 (ref), v10 (ref), v39 (ref)
                local v108 = {
                    animation = Instance.new("TrackerStreamAnimation")
                };
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v108.animationTrack = v104:LoadStreamAnimationV2(v108.animation, v103);
                else
                    v108.animationTrack = v104:LoadStreamAnimation(v108.animation);
                end;
                if l_game_EngineFeature_0 and not v108.animationTrack then
                    return;
                else
                    v108.animationTrack.Priority = Enum.AnimationPriority.Idle;
                    v108.animationTrack:Play(0.1, 1);
                    v37[v103.UserId] = v108;
                    local v109 = l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled;
                    if v103 == l_Players_0.LocalPlayer and not v109 then
                        local l_v103_0 = v103;
                        if v37[l_v103_0.UserId] and v37[l_v103_0.UserId].animationTrack then
                            local v111 = "";
                            local v112 = "";
                            if l_v103_0 then
                                if l_v103_0.UserId then
                                    v111 = tostring(l_v103_0.UserId);
                                end;
                                if l_v103_0.Name then
                                    v112 = l_v103_0.Name;
                                end;
                            end;
                            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v111, v112));
                            v37[l_v103_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                        end;
                    end;
                    if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
                        v39[v103.UserId] = v104;
                    end;
                    return;
                end;
            end;
            if v104:IsDescendantOf(game) then
                l_AnimatorDataModelReady_0();
                return;
            else
                v38[v103.UserId][v31.AnimatorDataModelReady] = v104.AncestryChanged:Connect(function(_, _) --[[ Line: 335 ]]
                    -- upvalues: v104 (copy), v103 (copy), v31 (ref), v38 (ref), l_AnimatorDataModelReady_0 (copy)
                    if v104:IsDescendantOf(game) then
                        local l_v103_1 = v103;
                        local l_AnimatorDataModelReady_1 = v31.AnimatorDataModelReady;
                        if v38[l_v103_1.UserId] and v38[l_v103_1.UserId][l_AnimatorDataModelReady_1] then
                            v38[l_v103_1.UserId][l_AnimatorDataModelReady_1]:Disconnect();
                            v38[l_v103_1.UserId][l_AnimatorDataModelReady_1] = nil;
                        end;
                        l_AnimatorDataModelReady_0();
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v123(v118, v119) --[[ Line: 347 ]] --[[ Name: onHumanoidAdded ]]
        -- upvalues: v31 (copy), v38 (copy), v97 (copy), v63 (copy)
        if not v119 then
            return;
        else
            local l_PlayerEmoted_0 = v31.PlayerEmoted;
            if v38[v118.UserId] and v38[v118.UserId][l_PlayerEmoted_0] then
                v38[v118.UserId][l_PlayerEmoted_0]:Disconnect();
                v38[v118.UserId][l_PlayerEmoted_0] = nil;
            end;
            v38[v118.UserId][v31.PlayerEmoted] = v119.EmoteTriggered:Connect(function(v121, v122) --[[ Line: 355 ]]
                -- upvalues: v97 (ref), v118 (copy)
                if v121 then
                    v97(v118, v122, false);
                end;
            end);
            if game:GetFastFlag("StopStreamTrackOnDeath") then
                l_PlayerEmoted_0 = v31.PlayerDied;
                if v38[v118.UserId] and v38[v118.UserId][l_PlayerEmoted_0] then
                    v38[v118.UserId][l_PlayerEmoted_0]:Disconnect();
                    v38[v118.UserId][l_PlayerEmoted_0] = nil;
                end;
                v38[v118.UserId][v31.PlayerDied] = v119.Died:Connect(function() --[[ Line: 365 ]]
                    -- upvalues: v63 (ref), v118 (copy)
                    v63(v118);
                end);
            end;
            return;
        end;
    end;
    local function v134(v124, v125) --[[ Line: 371 ]] --[[ Name: onFaceControlsAdded ]]
        -- upvalues: l_Players_0 (copy), v40 (copy), l_default_1 (copy), v10 (copy), l_FaceAnimatorService_0 (copy)
        assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"));
        if v124 ~= l_Players_0.LocalPlayer then
            return;
        elseif v40[v124.UserId] ~= nil and v125 == v40[v124.UserId] then
            return;
        else
            v40[v124.UserId] = v125;
            if v40[v124.UserId] then
                if l_default_1 and not l_default_1.localMuted then
                    local v126 = "";
                    local v127 = "";
                    if v124 then
                        if v124.UserId then
                            v126 = tostring(v124.UserId);
                        end;
                        if v124.Name then
                            v127 = v124.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", v126, v127));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = true;
                    return;
                else
                    local v128 = "";
                    local v129 = "";
                    if v124 then
                        if v124.UserId then
                            v128 = tostring(v124.UserId);
                        end;
                        if v124.Name then
                            v129 = v124.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", v128, v129));
                    return;
                end;
            elseif l_FaceAnimatorService_0.AudioAnimationEnabled then
                local v130 = "";
                local v131 = "";
                if v124 then
                    if v124.UserId then
                        v130 = tostring(v124.UserId);
                    end;
                    if v124.Name then
                        v131 = v124.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", v130, v131));
                l_FaceAnimatorService_0.AudioAnimationEnabled = false;
                return;
            else
                local v132 = "";
                local v133 = "";
                if v124 then
                    if v124.UserId then
                        v132 = tostring(v124.UserId);
                    end;
                    if v124.Name then
                        v133 = v124.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", v132, v133));
                return;
            end;
        end;
    end;
    local function v137(v135, v136) --[[ Line: 406 ]] --[[ Name: onCharacterDescendantAdded ]]
        -- upvalues: v117 (copy), v123 (copy), v134 (copy), v65 (copy)
        if v136:IsDescendantOf(game) then
            if v136:IsA("Animator") then
                v117(v135, v136);
                return;
            elseif v136:IsA("Humanoid") then
                v123(v135, v136);
                return;
            elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and v136:IsA("MeshPart") and v136.Name == "Head" then
                v134(v135, v65(v135));
                return;
            elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and v136:IsA("FaceControls") then
                v134(v135, v136);
            end;
        end;
    end;
    local function v144(v138, v139) --[[ Line: 426 ]] --[[ Name: onCharacterDescendantRemoving ]]
        -- upvalues: v39 (copy), v31 (copy), v38 (copy), v63 (copy), v117 (copy), v134 (copy), v65 (copy)
        if v139:IsA("Animator") then
            if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
                if v139 == v39[v138.UserId] then
                    local l_AnimatorDataModelReady_2 = v31.AnimatorDataModelReady;
                    if v38[v138.UserId] and v38[v138.UserId][l_AnimatorDataModelReady_2] then
                        v38[v138.UserId][l_AnimatorDataModelReady_2]:Disconnect();
                        v38[v138.UserId][l_AnimatorDataModelReady_2] = nil;
                    end;
                    v63(v138);
                    v39[v138.UserId] = nil;
                    if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
                        local v141 = if v138.Character then v138.Character:FindFirstChildOfClass("Humanoid") else nil;
                        l_AnimatorDataModelReady_2 = if v141 then v141:FindFirstChildOfClass("Animator") else nil;
                        if l_AnimatorDataModelReady_2 then
                            v117(v138, l_AnimatorDataModelReady_2);
                            return;
                        end;
                    end;
                end;
            else
                local l_AnimatorDataModelReady_3 = v31.AnimatorDataModelReady;
                if v38[v138.UserId] and v38[v138.UserId][l_AnimatorDataModelReady_3] then
                    v38[v138.UserId][l_AnimatorDataModelReady_3]:Disconnect();
                    v38[v138.UserId][l_AnimatorDataModelReady_3] = nil;
                end;
                v63(v138);
                return;
            end;
        elseif v139:IsA("Humanoid") then
            local l_PlayerEmoted_1 = v31.PlayerEmoted;
            if v38[v138.UserId] and v38[v138.UserId][l_PlayerEmoted_1] then
                v38[v138.UserId][l_PlayerEmoted_1]:Disconnect();
                v38[v138.UserId][l_PlayerEmoted_1] = nil;
            end;
            if game:GetFastFlag("StopStreamTrackOnDeath") then
                l_PlayerEmoted_1 = v31.PlayerDied;
                if v38[v138.UserId] and v38[v138.UserId][l_PlayerEmoted_1] then
                    v38[v138.UserId][l_PlayerEmoted_1]:Disconnect();
                    v38[v138.UserId][l_PlayerEmoted_1] = nil;
                    return;
                end;
            end;
        elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and (v139:IsA("MeshPart") and v139.Name == "Head" or v139:IsA("FaceControls")) then
            v134(v138, v65(v138));
        end;
    end;
    local function v151(v145, v146) --[[ Line: 459 ]] --[[ Name: onCharacterAdded ]]
        -- upvalues: v10 (copy), v31 (copy), v38 (copy), v137 (copy), v144 (copy), v134 (copy), v65 (copy), v123 (copy), v67 (copy), v117 (copy), v70 (copy)
        local v147 = "";
        local v148 = "";
        if v145 then
            if v145.UserId then
                v147 = tostring(v145.UserId);
            end;
            if v145.Name then
                v148 = v145.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character added", v147, v148));
        v147 = v31.CharacterDescendantAdded;
        if v38[v145.UserId] and v38[v145.UserId][v147] then
            v38[v145.UserId][v147]:Disconnect();
            v38[v145.UserId][v147] = nil;
        end;
        v147 = v31.CharacterDescendantRemoving;
        if v38[v145.UserId] and v38[v145.UserId][v147] then
            v38[v145.UserId][v147]:Disconnect();
            v38[v145.UserId][v147] = nil;
        end;
        v38[v145.UserId][v31.CharacterDescendantAdded] = v146.DescendantAdded:Connect(function(v149) --[[ Line: 468 ]]
            -- upvalues: v137 (ref), v145 (copy)
            v137(v145, v149);
        end);
        v38[v145.UserId][v31.CharacterDescendantRemoving] = v146.DescendantRemoving:Connect(function(v150) --[[ Line: 473 ]]
            -- upvalues: v144 (ref), v145 (copy)
            v144(v145, v150);
        end);
        if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
            v134(v145, v65(v145));
        end;
        v123(v145, v67(v145));
        v117(v145, v70(v145));
    end;
    local function v156(v152, _) --[[ Line: 487 ]] --[[ Name: onCharacterRemoving ]]
        -- upvalues: v10 (copy), v31 (copy), v38 (copy), v59 (copy), v63 (copy)
        local v154 = "";
        local v155 = "";
        if v152 then
            if v152.UserId then
                v154 = tostring(v152.UserId);
            end;
            if v152.Name then
                v155 = v152.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v154, v155));
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
            v154 = v31.CharacterDescendantAdded;
            if v38[v152.UserId] and v38[v152.UserId][v154] then
                v38[v152.UserId][v154]:Disconnect();
                v38[v152.UserId][v154] = nil;
            end;
            v154 = v31.CharacterDescendantRemoving;
            if v38[v152.UserId] and v38[v152.UserId][v154] then
                v38[v152.UserId][v154]:Disconnect();
                v38[v152.UserId][v154] = nil;
            end;
        else
            v59(v152);
        end;
        v63(v152);
    end;
    local function v167(v157) --[[ Line: 501 ]] --[[ Name: playerUpdate ]]
        -- upvalues: v10 (copy), v36 (copy), v37 (copy), v59 (copy), v151 (copy), v38 (copy), v31 (copy), v156 (copy), v102 (copy), v63 (copy)
        local v158 = "";
        local v159 = "";
        if v157 then
            if v157.UserId then
                v158 = tostring(v157.UserId);
            end;
            if v157.Name then
                v159 = v157.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player update", v158, v159));
        v158 = v36[v157.UserId];
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and v158 and v37[v157.UserId] then
            v159 = "";
            local v160 = "";
            if v157 then
                if v157.UserId then
                    v159 = tostring(v157.UserId);
                end;
                if v157.Name then
                    v160 = v157.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v159, v160));
            return;
        else
            v59(v157);
            if v158 then
                if not game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and v37[v157.UserId] then
                    v159 = "";
                    local v161 = "";
                    if v157 then
                        if v157.UserId then
                            v159 = tostring(v157.UserId);
                        end;
                        if v157.Name then
                            v161 = v157.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v159, v161));
                    return;
                else
                    v159 = "";
                    local v162 = "";
                    if v157 then
                        if v157.UserId then
                            v159 = tostring(v157.UserId);
                        end;
                        if v157.Name then
                            v162 = v157.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", v159, v162));
                    if v157.Character then
                        v151(v157, v157.Character);
                    end;
                    v38[v157.UserId][v31.CharacterAdded] = v157.CharacterAdded:Connect(function(v163) --[[ Line: 529 ]]
                        -- upvalues: v151 (ref), v157 (copy)
                        v151(v157, v163);
                    end);
                    v38[v157.UserId][v31.CharacterRemoving] = v157.CharacterRemoving:Connect(function(v164) --[[ Line: 533 ]]
                        -- upvalues: v156 (ref), v157 (copy)
                        v156(v157, v164);
                    end);
                    v38[v157.UserId][v31.PlayerChatted] = v157.Chatted:Connect(function(v165) --[[ Line: 537 ]]
                        -- upvalues: v102 (ref), v157 (copy)
                        v102(v157, v165);
                    end);
                    return;
                end;
            else
                v159 = "";
                local v166 = "";
                if v157 then
                    if v157.UserId then
                        v159 = tostring(v157.UserId);
                    end;
                    if v157.Name then
                        v166 = v157.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", v159, v166));
                v63(v157);
                return;
            end;
        end;
    end;
    local function _(v168, v169) --[[ Line: 546 ]] --[[ Name: toggleMute ]]
        -- upvalues: v37 (copy)
        if v37[v168] and v37[v168].animationTrack then
            v37[v168].animationTrack:TogglePause(v169);
        end;
    end;
    local function v179() --[[ Line: 552 ]] --[[ Name: JoinAllExistingPlayers ]]
        -- upvalues: l_Players_0 (copy), v36 (copy), v167 (copy), v10 (copy)
        for _, v172 in ipairs(l_Players_0:GetPlayers()) do
            v36[v172.UserId] = true;
            v167(v172);
        end;
        l_Players_0.PlayerRemoving:Connect(function(v173) --[[ Line: 558 ]]
            -- upvalues: v10 (ref), v36 (ref), v167 (ref)
            local v174 = "";
            local v175 = "";
            if v173 then
                if v173.UserId then
                    v174 = tostring(v173.UserId);
                end;
                if v173.Name then
                    v175 = v173.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", v174, v175));
            v36[v173.UserId] = nil;
            v167(v173);
        end);
        l_Players_0.PlayerAdded:Connect(function(v176) --[[ Line: 564 ]]
            -- upvalues: v10 (ref), v36 (ref), v167 (ref)
            local v177 = "";
            local v178 = "";
            if v176 then
                if v176.UserId then
                    v177 = tostring(v176.UserId);
                end;
                if v176.Name then
                    v178 = v176.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", v177, v178));
            v36[v176.UserId] = true;
            v167(v176);
        end);
    end;
    local function v200() --[[ Line: 571 ]] --[[ Name: ConnectStateChangeCallback ]]
        -- upvalues: l_default_1 (copy), l_Players_0 (copy), v37 (copy), v10 (copy), v35 (copy), v167 (copy)
        local v180 = l_default_1:getService();
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        l_default_1.participantsUpdate.Event:Connect(function(v182) --[[ Line: 575 ]]
            -- upvalues: l_UserId_0 (copy), v37 (ref)
            for v183, v184 in pairs(v182) do
                local v185 = tonumber(v183);
                if v185 ~= l_UserId_0 then
                    local l_isMutedLocally_0 = v184.isMutedLocally;
                    if v37[v185] and v37[v185].animationTrack then
                        v37[v185].animationTrack:TogglePause(l_isMutedLocally_0);
                    end;
                end;
            end;
        end);
        if v180 then
            v180.ParticipantsStateChanged:Connect(function(v187, v188, _) --[[ Line: 585 ]]
                -- upvalues: l_Players_0 (ref), v10 (ref), v35 (ref), v167 (ref)
                for _, v191 in ipairs(v187) do
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v191);
                    if l_l_Players_0_PlayerByUserId_0 then
                        local v193 = "";
                        local v194 = "";
                        if l_l_Players_0_PlayerByUserId_0 then
                            if l_l_Players_0_PlayerByUserId_0.UserId then
                                v193 = tostring(l_l_Players_0_PlayerByUserId_0.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_0.Name then
                                v194 = l_l_Players_0_PlayerByUserId_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", v193, v194));
                        v35[l_l_Players_0_PlayerByUserId_0.UserId] = nil;
                        v167(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
                for _, v196 in ipairs(v188) do
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v196);
                    if l_l_Players_0_PlayerByUserId_1 then
                        local v198 = "";
                        local v199 = "";
                        if l_l_Players_0_PlayerByUserId_1 then
                            if l_l_Players_0_PlayerByUserId_1.UserId then
                                v198 = tostring(l_l_Players_0_PlayerByUserId_1.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_1.Name then
                                v199 = l_l_Players_0_PlayerByUserId_1.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", v198, v199));
                        v35[l_l_Players_0_PlayerByUserId_1.UserId] = true;
                        v167(l_l_Players_0_PlayerByUserId_1);
                    end;
                end;
            end);
            return;
        else
            v10:trace("Could not find VoiceChatService");
            return;
        end;
    end;
    local function v201(v202) --[[ Line: 611 ]] --[[ Name: AttemptToShowCameraPerformanceToast ]]
        -- upvalues: v23 (copy), l_IXPServiceWrapper_0 (copy), v24 (copy), v34 (copy), v21 (copy), v201 (copy), l_AppStorageService_0 (copy), v22 (copy), v28 (copy), v29 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy)
        if v23() then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 614 ]]
                -- upvalues: l_IXPServiceWrapper_0 (ref), v24 (ref)
                return l_IXPServiceWrapper_0:GetLayerData(v24());
            end);
            if not l_status_0 then
                return;
            elseif not l_result_0 then
                return;
            elseif not l_result_0.UXForCameraPerformanceEnabled then
                return;
            end;
        end;
        local v205 = os.time() - v34;
        if not v202 and v205 < v21 then
            task.delay(v21 - v205, function() --[[ Line: 635 ]]
                -- upvalues: v201 (ref)
                v201(true);
            end);
            return;
        else
            local v206 = 0;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 643 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("CameraPerformanceUXUnixTimestamp");
            end);
            if l_status_1 then
                v206 = tonumber(l_result_1);
                if os.time() - v206 < v22 then
                    return;
                else
                    pcall(function() --[[ Line: 655 ]]
                        -- upvalues: l_AppStorageService_0 (ref), v206 (ref), v28 (ref), v29 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref)
                        l_AppStorageService_0:SetItem("CameraPerformanceUXUnixTimestamp", (tostring(v206)));
                        l_AppStorageService_0:Flush();
                        v28:showPrompt(v29.LODCameraRecommendDisable);
                        l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
                            userId = l_Players_0.LocalPlayer.UserId, 
                            pid = tostring(game.PlaceId)
                        });
                    end);
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    InitializeVoiceChat = function() --[[ Line: 677 ]] --[[ Name: InitializeVoiceChat ]]
        -- upvalues: v200 (copy), l_default_1 (copy), v10 (copy), v43 (ref), l_Players_0 (copy), l_FaceAnimatorService_0 (copy)
        local function v209() --[[ Line: 678 ]]
            -- upvalues: v200 (ref)
            v200();
        end;
        if l_default_1 then
            l_default_1:asyncInit():catch(function(_) --[[ Line: 684 ]]
                -- upvalues: v10 (ref)
                v10:trace("VoiceChat:asyncInit failed (possibly denied mic permission)");
            end):finally(v209);
            v43 = l_default_1.muteChanged.Event:connect(function(v211) --[[ Line: 690 ]]
                -- upvalues: l_Players_0 (ref), v10 (ref), l_FaceAnimatorService_0 (ref)
                if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                    local v213 = if l_LocalPlayer_1 and l_LocalPlayer_1.Character then l_LocalPlayer_1.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v211) .. " hasFaceControls=" .. tostring(v213 ~= nil));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v211 and v213 ~= nil;
                    return;
                else
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v211));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v211;
                    return;
                end;
            end);
            local v214 = false;
            if l_default_1.localMuted ~= nil then
                v10:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(l_default_1.localMuted));
                v214 = not l_default_1.localMuted;
            end;
            if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                local v216 = if l_LocalPlayer_2 and l_LocalPlayer_2.Character then l_LocalPlayer_2.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                v10:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(v216 ~= nil));
                v214 = v214 and v216 ~= nil;
            end;
            l_FaceAnimatorService_0.AudioAnimationEnabled = v214;
            return;
        else
            v200();
            return;
        end;
    end;
    CleanupVoiceChat = function() --[[ Line: 728 ]] --[[ Name: CleanupVoiceChat ]]
        -- upvalues: v43 (ref)
        if v43 then
            v43:Disconnect();
            v43 = nil;
        end;
    end;
    InitializeFacialAnimationStreaming = function(v217) --[[ Line: 735 ]] --[[ Name: InitializeFacialAnimationStreaming ]]
        -- upvalues: v33 (ref), v41 (ref), l_FaceAnimatorService_0 (copy), v10 (copy), v28 (copy), v29 (copy), v20 (copy), v25 (ref), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v17 (copy), l_game_EngineFeature_1 (copy), v42 (ref), v19 (copy), v201 (copy), l_default_0 (copy), l_Enums_0 (copy), v179 (copy), v26 (copy)
        if v33 then
            return;
        else
            v33 = true;
            v41 = l_FaceAnimatorService_0.TrackerError:Connect(function(v218) --[[ Line: 743 ]]
                -- upvalues: v10 (ref), v28 (ref), v29 (ref)
                local v219 = string.format("TrackerError: %s", (tostring(v218)));
                v10:trace(string.format("%s {id: %s, name: %s}.", v219, "", ""));
                if v218 == Enum.TrackerError.VideoNoPermission then
                    v28:showPrompt(v29.VideoNoPermission);
                    return;
                elseif v218 == Enum.TrackerError.VideoUnsupported then
                    v28:showPrompt(v29.VideoUnsupported);
                    return;
                elseif v218 == Enum.TrackerError.UnsupportedDevice then
                    v28:showPrompt(v29.UnsupportedDevice);
                    return;
                else
                    v28:showPrompt(v29.NotAvailable);
                    return;
                end;
            end);
            if v20 and not v25() then
                v10:trace("Camera is disabled for user and place");
                return;
            else
                if l_GetFFlagAvatarChatServiceEnabled_0() then
                    l_FaceAnimatorService_0:Init(v17:IsEnabled(v217, Enum.AvatarChatServiceFeature.UserVideo), v17:IsEnabled(v217, Enum.AvatarChatServiceFeature.UserAudio));
                end;
                if l_game_EngineFeature_1 then
                    v42 = l_FaceAnimatorService_0.TrackerPrompt:Connect(function(v220) --[[ Line: 770 ]]
                        -- upvalues: v10 (ref), v19 (ref), v201 (ref), v28 (ref), v29 (ref)
                        local v221 = string.format("TrackerPrompt: %s", (tostring(v220)));
                        v10:trace(string.format("%s {id: %s, name: %s}.", v221, "", ""));
                        if v220 == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
                            if v19 then
                                v201();
                                return;
                            else
                                v28:showPrompt(v29.LODCameraRecommendDisable);
                            end;
                        end;
                    end);
                end;
                l_default_0:getCallState():andThen(function(v222) --[[ Line: 783 ]]
                    -- upvalues: v33 (ref), l_Enums_0 (ref), l_FaceAnimatorService_0 (ref), v179 (ref), v26 (ref)
                    if not v33 then
                        return;
                    else
                        if v222.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v222.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                            l_FaceAnimatorService_0.VideoAnimationEnabled = v222.camEnabled;
                        else
                            l_FaceAnimatorService_0.VideoAnimationEnabled = false;
                        end;
                        InitializeVoiceChat();
                        v179();
                        v26.Initialize();
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
    CleanupFacialAnimationStreaming = function() --[[ Line: 808 ]] --[[ Name: CleanupFacialAnimationStreaming ]]
        -- upvalues: v33 (ref), v26 (copy), l_Players_0 (copy), v36 (copy), v167 (copy), v41 (ref), v44 (ref), v45 (ref), l_game_EngineFeature_1 (copy), v42 (ref)
        if not v33 then
            return;
        else
            v33 = false;
            CleanupVoiceChat();
            v26.Cleanup();
            for _, v224 in ipairs(l_Players_0:GetPlayers()) do
                v36[v224.UserId] = nil;
                v167(v224);
            end;
            if v41 then
                v41:Disconnect();
                v41 = nil;
            end;
            if v44 then
                v44:Disconnect();
                v44 = nil;
            end;
            if v45 then
                v45:Disconnect();
                v45 = nil;
            end;
            if l_game_EngineFeature_1 and v42 then
                v42:Disconnect();
                v42 = nil;
            end;
            return;
        end;
    end;
    local function v226(v225) --[[ Line: 846 ]] --[[ Name: updateWithServiceState ]]
        -- upvalues: v10 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v17 (copy)
        v10:trace(string.format("[updateWithServiceState] state: %s", (tostring(v225))));
        if l_GetFFlagAvatarChatServiceEnabled_0() then
            if (v17:IsEnabled(v225, Enum.AvatarChatServiceFeature.UserAudioEligible) or v17:IsEnabled(v225, Enum.AvatarChatServiceFeature.UserVideoEligible)) and v17:IsPlaceEnabled() then
                InitializeFacialAnimationStreaming(v225);
                return;
            else
                CleanupFacialAnimationStreaming();
                return;
            end;
        else
            CleanupFacialAnimationStreaming();
            return;
        end;
    end;
    v44 = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 867 ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v37 (copy), v10 (copy)
        local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_3 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v37[l_LocalPlayer_3.UserId] and v37[l_LocalPlayer_3.UserId].animationTrack then
                    local v228 = "";
                    local v229 = "";
                    if l_LocalPlayer_3 then
                        if l_LocalPlayer_3.UserId then
                            v228 = tostring(l_LocalPlayer_3.UserId);
                        end;
                        if l_LocalPlayer_3.Name then
                            v229 = l_LocalPlayer_3.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v228, v229));
                    v37[l_LocalPlayer_3.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v37[l_LocalPlayer_3.UserId] and v37[l_LocalPlayer_3.UserId].animationTrack then
                local v230 = "";
                local v231 = "";
                if l_LocalPlayer_3 then
                    if l_LocalPlayer_3.UserId then
                        v230 = tostring(l_LocalPlayer_3.UserId);
                    end;
                    if l_LocalPlayer_3.Name then
                        v231 = l_LocalPlayer_3.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v230, v231));
                v37[l_LocalPlayer_3.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end);
    v45 = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 871 ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v37 (copy), v10 (copy)
        local l_LocalPlayer_4 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_4 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v37[l_LocalPlayer_4.UserId] and v37[l_LocalPlayer_4.UserId].animationTrack then
                    local v233 = "";
                    local v234 = "";
                    if l_LocalPlayer_4 then
                        if l_LocalPlayer_4.UserId then
                            v233 = tostring(l_LocalPlayer_4.UserId);
                        end;
                        if l_LocalPlayer_4.Name then
                            v234 = l_LocalPlayer_4.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v233, v234));
                    v37[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v37[l_LocalPlayer_4.UserId] and v37[l_LocalPlayer_4.UserId].animationTrack then
                local v235 = "";
                local v236 = "";
                if l_LocalPlayer_4 then
                    if l_LocalPlayer_4.UserId then
                        v235 = tostring(l_LocalPlayer_4.UserId);
                    end;
                    if l_LocalPlayer_4.Name then
                        v236 = l_LocalPlayer_4.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v235, v236));
                v37[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end);
    if l_GetFFlagAvatarChatServiceEnabled_0() then
        if v17.ClientFeaturesInitialized then
            v226(v17.ClientFeatures);
        else
            local v237 = nil;
            do
                local l_v237_0 = v237;
                l_v237_0 = v17:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 881 ]]
                    -- upvalues: v226 (copy), v17 (copy), l_v237_0 (ref)
                    v226(v17.ClientFeatures);
                    l_v237_0:Disconnect();
                end);
            end;
        end;
    end;
    return;
end;