local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Utils.ModelUtils);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_game_EngineFeature_0 = game:GetEngineFeature("AnimatorAndADFRefactor");
local l_game_EngineFeature_1 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
local v8 = nil;
local v9 = nil;
local v10 = game:DefineFastFlag("SelfViewNewPoseSynchronization", false);
local v11 = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false);
local v12 = game:DefineFastFlag("SelfViewFixAnimTrackLeaks", false);
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local l_RunService_0 = game:GetService("RunService");
local v15 = 1.31;
local v16 = 0;
local v17 = nil;
local v18 = nil;
local v19 = {};
local v20 = {};
local v21 = nil;
local v22 = {};
local v23 = {};
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = Vector3.new(1.1720999479293823, 1.1811000108718872, 1.1577999591827393, 0);
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = false;
local v39 = 0;
local v40 = {};
local v41 = {
    AnimationPlayed = "AnimationPlayed", 
    AnimationPlayedCoreScript = "AnimationPlayedCoreScript", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    HeadSize = "HeadSize", 
    Color = "Color", 
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidStateChanged = "HumanoidStateChanged", 
    FaceControlsChanged = "FaceControlsChanged"
};
local l_Players_0 = game:GetService("Players");
if not l_Players_0.LocalPlayer then
    warn("Players.LocalPlayer does not exist");
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v44 = false;
setCloneDirty = function(v45) --[[ Line: 94 ]] --[[ Name: setCloneDirty ]]
    -- upvalues: v16 (ref)
    if v45 then
        v16 = 0.35;
        return;
    else
        v16 = 0;
        return;
    end;
end;
createCloneAnchor = function() --[[ Line: 102 ]] --[[ Name: createCloneAnchor ]]
    -- upvalues: v29 (ref), v26 (ref)
    if v29 ~= nil then
        v29:Destroy();
        v29 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v26;
    v29 = l_WorldModel_0;
end;
local function _(v47) --[[ Line: 114 ]] --[[ Name: clearObserver ]]
    -- upvalues: v40 (copy)
    if v40[v47] then
        v40[v47]:Disconnect();
        v40[v47] = nil;
    end;
end;
clearCloneCharacter = function() --[[ Line: 121 ]] --[[ Name: clearCloneCharacter ]]
    -- upvalues: v30 (ref), v29 (ref)
    if v30 then
        v30:Destroy();
        v30 = nil;
    end;
    if not v29 then
        warn("cloneAnchor is nil, this shouldn't be possible");
        return;
    else
        assert(v29 ~= nil);
        local l_SelfAvatar_0 = v29:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return;
    end;
end;
local function v53() --[[ Line: 140 ]] --[[ Name: clearClone ]]
    -- upvalues: v41 (copy), v40 (copy), v12 (copy), v22 (ref), v9 (ref), v21 (ref)
    stopRenderStepped();
    local l_AnimationPlayed_0 = v41.AnimationPlayed;
    if v40[l_AnimationPlayed_0] then
        v40[l_AnimationPlayed_0]:Disconnect();
        v40[l_AnimationPlayed_0] = nil;
    end;
    l_AnimationPlayed_0 = v41.AnimationPlayedCoreScript;
    if v40[l_AnimationPlayed_0] then
        v40[l_AnimationPlayed_0]:Disconnect();
        v40[l_AnimationPlayed_0] = nil;
    end;
    if v12 then
        for _, v52 in v22 do
            if v52 then
                v52:Stop(0);
            end;
        end;
        if v9 then
            v9:Stop(0);
            v9 = nil;
        end;
    end;
    v21 = nil;
    v22 = {};
    clearCloneCharacter();
end;
local function v57(v54, v55) --[[ Line: 164 ]] --[[ Name: syncTrack ]]
    -- upvalues: v12 (copy), v9 (ref), v8 (ref), l_LocalPlayer_0 (copy), v19 (copy)
    if not v54 or not v55.Animation then
        return;
    else
        local v56 = nil;
        if not v55.Animation or not v55.Animation:IsA("Animation") then
            if v55.Animation and v55.Animation:IsA("TrackerStreamAnimation") then
                if v12 and v9 then
                    v9:Stop(0);
                end;
                v8 = Instance.new("TrackerStreamAnimation");
                assert(v8 ~= nil);
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v9 = v54:LoadStreamAnimationV2(v8, l_LocalPlayer_0, false, false);
                else
                    v9 = v54:LoadStreamAnimationForSelfieView_deprecated(v8, l_LocalPlayer_0);
                end;
                v56 = v9;
            else
                warn("No animation to clone in SelfView");
            end;
        end;
        if v56 then
            v56:Play();
            v56.Priority = v55.Priority;
            v19[v55] = v55.Stopped:Connect(function() --[[ Line: 196 ]]
                -- upvalues: v56 (ref), v19 (ref), v55 (copy)
                v56:Stop(0);
                if v19[v55] then
                    v19[v55]:Disconnect();
                end;
            end);
        end;
        return;
    end;
end;
local function v83(v58) --[[ Line: 205 ]] --[[ Name: updateClone ]]
    -- upvalues: v53 (copy), v1 (copy), v30 (ref), v20 (copy), v29 (ref), v27 (ref), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v28 (ref), v15 (ref), v32 (ref), v33 (ref), v34 (ref), v21 (ref), l_game_EngineFeature_0 (copy), v10 (copy), v8 (ref), v57 (copy), v40 (copy), v41 (copy)
    v53();
    if not v58 then
        return;
    else
        assert(v58 ~= nil);
        startRenderStepped(v58);
        local l_Character_0 = v58.Character;
        if not v58 or not v58.Character then
            return;
        else
            l_Character_0 = v58.Character;
            if not l_Character_0 then
                return;
            else
                assert(l_Character_0 ~= nil);
                local v60 = v1.getAnimator(l_Character_0, 10);
                clearCloneCharacter();
                local l_Archivable_0 = l_Character_0.Archivable;
                l_Character_0.Archivable = true;
                local v62 = v1.getHead(l_Character_0);
                if not v62 then
                    return;
                else
                    v30 = l_Character_0:Clone();
                    if v30 == nil then
                        return;
                    else
                        assert(v30 ~= nil);
                        v1.resetPartOrientation(v30);
                        v1.updateTransparency(v30, v20);
                        v1.removeTags(v30);
                        v30.Name = "SelfAvatar";
                        v1.removeScripts(v30);
                        v1.sanitizeCharacter(v30);
                        l_Character_0.Archivable = l_Archivable_0;
                        v30.Parent = v29;
                        local l_HumanoidRootPart_0 = v30:FindFirstChild("HumanoidRootPart");
                        if l_HumanoidRootPart_0 then
                            l_HumanoidRootPart_0.CFrame = CFrame.new((Vector3.new(0, 0, 0, 0)));
                            assert(v27 ~= nil);
                            if v62 then
                                local v64 = v1.getHead(v30);
                                if v64 then
                                    assert(v64 ~= nil);
                                    local v65 = l_CFrameUtility_0.CalculateTargetCFrame(v64.CFrame);
                                    local v66, v67 = l_CharacterUtility_0.CalculateHeadExtents(v30, v65);
                                    local v68 = Vector3.new(v66.X, v66.Y, v66.Z);
                                    v28 = Vector3.new(v67.X, v67.Y, v67.Z) - v68;
                                    assert(v28 ~= nil);
                                    v15 = v64.Size.Y;
                                    local v69 = math.min(v28.X, v28.Y);
                                    v69 = math.min(v28.X, v28.Z);
                                    local l_Model_0 = Instance.new("Model");
                                    l_Model_0.Parent = v30;
                                    v64 = v1.getHead(v30);
                                    l_Character_0.Archivable = true;
                                    v32 = v64:Clone();
                                    assert(v32 ~= nil);
                                    v32.CanCollide = false;
                                    v32.Parent = l_Model_0;
                                    v33 = v1.getNeck(v30, v32);
                                    v34 = v32.CFrame;
                                    v32:Destroy();
                                    assert(v34 ~= nil);
                                    local v71 = v34.Position + v34.LookVector * (v69 * 2);
                                    v27.CFrame = CFrame.lookAt(v71 + Vector3.new(0, 0.10499999672174454, -0.25, 0), v34.Position);
                                    v27.Focus = v34;
                                    l_Character_0.Archivable = l_Archivable_0;
                                    l_Model_0:Destroy();
                                end;
                            else
                                local v72 = l_HumanoidRootPart_0.Position + l_HumanoidRootPart_0.CFrame.LookVector * 2.5;
                                v27.CFrame = CFrame.lookAt(v72 + Vector3.new(0, 1.5, 0, 0), l_HumanoidRootPart_0.Position);
                                v27.CFrame = CFrame.new(v27.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                            end;
                        end;
                        if v30 == nil then
                            return;
                        else
                            local v73 = nil;
                            v73 = v30:FindFirstChildWhichIsA("Humanoid");
                            if v73 then
                                v73.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                            end;
                            v21 = v1.getAnimator(v30, 0);
                            if v21 then
                                if not l_game_EngineFeature_0 or not v10 then
                                    local l_v21_PlayingAnimationTracks_0 = v21:GetPlayingAnimationTracks();
                                    local l_v21_PlayingAnimationTracksCoreScript_0 = v21:GetPlayingAnimationTracksCoreScript();
                                    for _, v77 in ipairs(l_v21_PlayingAnimationTracks_0) do
                                        if v77 ~= nil then
                                            v77:Stop(0);
                                            v77:Destroy();
                                        end;
                                    end;
                                    for _, v79 in ipairs(l_v21_PlayingAnimationTracksCoreScript_0) do
                                        if v79 ~= nil then
                                            v79:Stop(0);
                                            v79:Destroy();
                                        end;
                                    end;
                                    if v8 then
                                        v8:Destroy();
                                        v8 = nil;
                                    end;
                                end;
                                if v60 then
                                    if l_game_EngineFeature_0 and v10 then
                                        v21:SynchronizeWith(v60);
                                    else
                                        for _, v81 in ipairs(v60:GetPlayingAnimationTracksCoreScript()) do
                                            v57(v21, v81);
                                        end;
                                        v40[v41.AnimationPlayedCoreScript] = v60.AnimationPlayedCoreScript:Connect(function(v82) --[[ Line: 393 ]]
                                            -- upvalues: v57 (ref), v21 (ref)
                                            v57(v21, v82);
                                        end);
                                    end;
                                    setCloneDirty(false);
                                    return;
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local _ = function(v84, v85) --[[ Line: 409 ]] --[[ Name: hasProperty ]]
    local _ = v84[v85];
end;
updateCachedHeadColor = function(v88) --[[ Line: 416 ]] --[[ Name: updateCachedHeadColor ]]
    -- upvalues: v24 (ref), v25 (ref)
    if v88 == nil then
        return;
    else
        assert(v88 ~= nil);
        if pcall(function() --[[ Line: 422 ]]
            -- upvalues: v88 (copy)
            local _ = v88.Color;
        end) then
            v24 = v88.Color;
            if pcall(function() --[[ Line: 428 ]]
                -- upvalues: v88 (copy)
                local _ = v88.Size;
            end) then
                v25 = v88.Size;
            end;
        end;
        return;
    end;
end;
local function _(v91) --[[ Line: 439 ]] --[[ Name: addHumanoidStateChangedObserver ]]
    -- upvalues: v40 (copy), v41 (copy)
    if not v91 then
        return;
    else
        if not v40[v41.HumanoidStateChanged] then
            v40[v41.HumanoidStateChanged] = v91.StateChanged:Connect(function(v92, v93) --[[ Line: 444 ]]
                if v92 == Enum.HumanoidStateType.PlatformStanding and v93 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v93 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return;
    end;
end;
local function _(v95) --[[ Line: 457 ]] --[[ Name: addFaceControlsObserver ]]
    -- upvalues: v40 (copy), v41 (copy)
    if not v40[v41.FaceControlsChanged] then
        v40[v41.FaceControlsChanged] = v95.InternalFacsOverrideChanged:Connect(function() --[[ Line: 459 ]]
            setCloneDirty(true);
        end);
    end;
end;
local function v107(v97) --[[ Line: 465 ]] --[[ Name: characterAdded ]]
    -- upvalues: v26 (ref), v35 (ref), v31 (ref), v1 (copy), v41 (copy), v40 (copy), v38 (ref)
    if v26 == nil or v35 == nil then
        return;
    elseif not v97 then
        return;
    else
        v31 = v1.getHead(v97);
        updateCachedHeadColor(v31);
        local l_DescendantAdded_0 = v41.DescendantAdded;
        if v40[l_DescendantAdded_0] then
            v40[l_DescendantAdded_0]:Disconnect();
            v40[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v41.DescendantRemoving;
        if v40[l_DescendantAdded_0] then
            v40[l_DescendantAdded_0]:Disconnect();
            v40[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v41.HeadSize;
        if v40[l_DescendantAdded_0] then
            v40[l_DescendantAdded_0]:Disconnect();
            v40[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v41.Color;
        if v40[l_DescendantAdded_0] then
            v40[l_DescendantAdded_0]:Disconnect();
            v40[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = nil;
        l_DescendantAdded_0 = v97:FindFirstChildWhichIsA("Humanoid");
        if l_DescendantAdded_0 then
            local l_l_DescendantAdded_0_0 = l_DescendantAdded_0;
            if l_l_DescendantAdded_0_0 and not v40[v41.HumanoidStateChanged] then
                v40[v41.HumanoidStateChanged] = l_l_DescendantAdded_0_0.StateChanged:Connect(function(v100, v101) --[[ Line: 444 ]]
                    if v100 == Enum.HumanoidStateType.PlatformStanding and v101 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v101 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
        end;
        local l_v97_FirstChildWhichIsA_0 = v97:FindFirstChildWhichIsA("FaceControls", true);
        if l_v97_FirstChildWhichIsA_0 and not v40[v41.FaceControlsChanged] then
            v40[v41.FaceControlsChanged] = l_v97_FirstChildWhichIsA_0.InternalFacsOverrideChanged:Connect(function() --[[ Line: 459 ]]
                setCloneDirty(true);
            end);
        end;
        v40[v41.DescendantAdded] = v97.DescendantAdded:Connect(function(v103) --[[ Line: 495 ]]
            -- upvalues: v26 (ref), v35 (ref), v31 (ref), v1 (ref), v97 (copy), v40 (ref), v41 (ref)
            if v26 == nil or v35 == nil then
                return;
            else
                if v103.Name == "Head" then
                    v31 = v1.getHead(v97);
                    updateCachedHeadColor(v31);
                end;
                if v103:IsA("Humanoid") and v103 and not v40[v41.HumanoidStateChanged] then
                    v40[v41.HumanoidStateChanged] = v103.StateChanged:Connect(function(v104, v105) --[[ Line: 444 ]]
                        if v104 == Enum.HumanoidStateType.PlatformStanding and v105 == Enum.HumanoidStateType.Running then
                            setCloneDirty(true);
                        end;
                        if v105 == Enum.HumanoidStateType.GettingUp then
                            setCloneDirty(true);
                        end;
                    end);
                end;
                if v103:IsA("FaceControls") and not v40[v41.FaceControlsChanged] then
                    v40[v41.FaceControlsChanged] = v103.InternalFacsOverrideChanged:Connect(function() --[[ Line: 459 ]]
                        setCloneDirty(true);
                    end);
                end;
                if v1.shouldMarkCloneDirtyForDescendant(v103) then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        v40[v41.DescendantRemoving] = v97.DescendantRemoving:Connect(function(v106) --[[ Line: 518 ]]
            -- upvalues: v26 (ref), v35 (ref), v1 (ref)
            if v26 == nil or v35 == nil then
                return;
            else
                if v106 and (v106:IsA("MeshPart") or v106:IsA("Accessory")) then
                    if v106:IsA("MeshPart") and v106.MeshId == "" then
                        return;
                    elseif v1.shouldMarkCloneDirtyForDescendant(v106) then
                        setCloneDirty(true);
                    end;
                end;
                return;
            end;
        end);
        setCloneDirty(true);
        v38 = true;
        return;
    end;
end;
local function v109() --[[ Line: 540 ]] --[[ Name: createViewport ]]
    -- upvalues: v26 (ref), v35 (ref), v27 (ref)
    if v26 then
        v26:Destroy();
    end;
    v26 = Instance.new("ViewportFrame");
    v26.Position = UDim2.new(0, 0, 0, 0);
    v26.Size = UDim2.new(1, 0, 1, 0);
    v26.BackgroundTransparency = 1;
    v26.Parent = v35;
    v26.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v26.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v26.LightDirection = Vector3.new(9.5, -12, 7.5, 0);
    v26.IsMirrored = true;
    local _ = Instance.new("UICorner");
    Instance.new("UICorner").Parent = v26;
    createCloneAnchor();
    if v35 then
        v35.Destroying:Connect(clearViewportFrame);
    end;
    v27 = Instance.new("Camera");
    assert(v27 ~= nil);
    v27.FieldOfView = 70;
    v26.CurrentCamera = v27;
    v27.Parent = v26;
end;
ReInit = function(v110) --[[ Line: 574 ]] --[[ Name: ReInit ]]
    -- upvalues: l_GetFFlagSelfViewVisibilityFix_0 (copy), v37 (ref), v44 (ref), v31 (ref), v1 (copy), v41 (copy), v40 (copy), v53 (copy), v109 (copy)
    assert(v110.Character ~= nil);
    if l_GetFFlagSelfViewVisibilityFix_0() and v37 and not v37.Visible then
        v44 = false;
        return;
    else
        v31 = v1.getHead(v110.Character);
        updateCachedHeadColor(v31);
        setCloneDirty(false);
        local l_CharacterAdded_0 = v41.CharacterAdded;
        if v40[l_CharacterAdded_0] then
            v40[l_CharacterAdded_0]:Disconnect();
            v40[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v41.CharacterRemoving;
        if v40[l_CharacterAdded_0] then
            v40[l_CharacterAdded_0]:Disconnect();
            v40[l_CharacterAdded_0] = nil;
        end;
        v53();
        v109();
        playerAdded(v110);
        startRenderStepped(v110);
        return;
    end;
end;
local function v117(v112) --[[ Line: 596 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v18 (ref), v38 (ref), v107 (copy), l_LocalPlayer_0 (copy), v41 (copy), v40 (copy)
    if v18 then
        v18:Disconnect();
    end;
    if not v38 then
        v107(v112);
    else
        ReInit(l_LocalPlayer_0);
    end;
    local l_HumanoidStateChanged_0 = v41.HumanoidStateChanged;
    if v40[l_HumanoidStateChanged_0] then
        v40[l_HumanoidStateChanged_0]:Disconnect();
        v40[l_HumanoidStateChanged_0] = nil;
    end;
    l_HumanoidStateChanged_0 = nil;
    l_HumanoidStateChanged_0 = v112:FindFirstChildWhichIsA("Humanoid");
    if l_HumanoidStateChanged_0 then
        local l_l_HumanoidStateChanged_0_0 = l_HumanoidStateChanged_0;
        if not l_l_HumanoidStateChanged_0_0 then
            return;
        elseif not v40[v41.HumanoidStateChanged] then
            v40[v41.HumanoidStateChanged] = l_l_HumanoidStateChanged_0_0.StateChanged:Connect(function(v115, v116) --[[ Line: 444 ]]
                if v115 == Enum.HumanoidStateType.PlatformStanding and v116 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v116 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
    end;
end;
local function _(v118) --[[ Line: 614 ]] --[[ Name: FindInParents ]]
    -- upvalues: v35 (ref)
    if not v118 then
        return nil;
    elseif not v35 then
        return nil;
    else
        assert(v35 ~= nil, "Wrapper Frame cannot be nil");
        assert(v118 ~= nil, "Frame name cannot be nil ");
        return v35:FindFirstAncestor(v118);
    end;
end;
clearViewportFrame = function() --[[ Line: 629 ]] --[[ Name: clearViewportFrame ]]
    -- upvalues: v26 (ref), v35 (ref)
    if v26 then
        v26:Destroy();
    end;
    v35 = nil;
    stopRenderStepped();
end;
local function v120() --[[ Line: 637 ]] --[[ Name: onOuterContainerVisibilityChanged ]]
    -- upvalues: v37 (ref), v38 (ref), v44 (ref)
    if v37 then
        if v37.Visible then
            if not v38 then
                return;
            else
                v44 = true;
                return;
            end;
        else
            v44 = false;
        end;
    end;
end;
playerAdded = function(v121) --[[ Line: 656 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_LocalPlayer_0 (copy), v18 (ref), v41 (copy), v40 (copy), v117 (copy), v107 (copy), v53 (copy)
    if v121 ~= nil and v121 == l_LocalPlayer_0 then
        if v18 ~= nil then
            v18:Disconnect();
            v18 = nil;
            local l_CharacterAdded_1 = v41.CharacterAdded;
            if v40[l_CharacterAdded_1] then
                v40[l_CharacterAdded_1]:Disconnect();
                v40[l_CharacterAdded_1] = nil;
            end;
        end;
        local l_Character_1 = v121.Character;
        l_Character_1 = v121.Character;
        v18 = v121.CharacterAdded:Connect(v117);
        if l_Character_1 then
            v107(l_Character_1);
        end;
        v40[v41.CharacterAdded] = v121.CharacterAdded:Connect(v107);
        v40[v41.CharacterRemoving] = v121.CharacterRemoving:Connect(function() --[[ Line: 675 ]]
            -- upvalues: v41 (ref), v40 (ref), v53 (ref)
            local l_DescendantAdded_1 = v41.DescendantAdded;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v41.DescendantRemoving;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v41.HeadSize;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v41.Color;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
            v53();
            l_DescendantAdded_1 = v41.CharacterRemoving;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
        end);
    end;
end;
stopRenderStepped = function() --[[ Line: 686 ]] --[[ Name: stopRenderStepped ]]
    -- upvalues: v17 (ref)
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
end;
updateClonePartsColor = function(v125) --[[ Line: 693 ]] --[[ Name: updateClonePartsColor ]]
    -- upvalues: v31 (ref), v24 (ref), l_LocalPlayer_0 (copy), v30 (ref)
    if pcall(function() --[[ Line: 694 ]]
        -- upvalues: v31 (ref)
        local _ = v31.Color;
    end) and v31 and v31.Color ~= v24 then
        local l_Character_2 = l_LocalPlayer_0.Character;
        if not l_Character_2 then
            return;
        else
            assert(l_Character_2 ~= nil);
            if not v30 then
                return;
            else
                assert(v30 ~= nil);
                for _, v129 in pairs(l_Character_2:GetChildren()) do
                    if v129:IsA("MeshPart") then
                        local l_v30_FirstChild_0 = v30:FindFirstChild(v129.Name);
                        if l_v30_FirstChild_0 and l_v30_FirstChild_0:IsA("MeshPart") and l_v30_FirstChild_0.Color and v129.Color then
                            l_v30_FirstChild_0.Color = v129.Color;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v24 = v125;
end;
startRenderStepped = function(v131) --[[ Line: 726 ]] --[[ Name: startRenderStepped ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), v17 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v30 (ref), v37 (ref), v44 (ref), v21 (ref), l_LocalPlayer_0 (copy), v31 (ref), v1 (copy), v23 (ref), v22 (ref), l_UserInputService_0 (copy), v39 (ref), v32 (ref), v33 (ref), v34 (ref), v27 (ref), v28 (ref), l_game_Service_0 (copy), l_game_EngineFeature_1 (copy), v15 (ref), v25 (ref), v24 (ref), v16 (ref), v83 (copy)
    stopRenderStepped();
    v17 = (if v11 then l_RunService_0.Heartbeat else l_RunService_0.RenderStepped):Connect(function(v132) --[[ Line: 733 ]]
        -- upvalues: v11 (ref), l_GetFFlagSelfViewVisibilityFix_0 (ref), v30 (ref), v37 (ref), v44 (ref), v21 (ref), l_LocalPlayer_0 (ref), v31 (ref), v1 (ref), v23 (ref), v22 (ref), l_UserInputService_0 (ref), v39 (ref), v32 (ref), v33 (ref), v34 (ref), v27 (ref), v28 (ref), l_game_Service_0 (ref), l_game_EngineFeature_1 (ref), v15 (ref), v25 (ref), v24 (ref), v16 (ref), v83 (ref), v131 (copy)
        if v11 then
            debug.profilebegin("faceclone");
        end;
        if l_GetFFlagSelfViewVisibilityFix_0() and v30 and v37 and not v44 then
            if v21 ~= nil then
                local l_v21_PlayingAnimationTracks_1 = v21:GetPlayingAnimationTracks();
                for _, v135 in pairs(l_v21_PlayingAnimationTracks_1) do
                    if v135 ~= nil then
                        v135:Stop(0);
                    end;
                end;
            end;
            return;
        else
            if l_LocalPlayer_0 then
                local l_Character_3 = l_LocalPlayer_0.Character;
                if not l_Character_3 or l_Character_3.Parent == nil then
                    return;
                else
                    assert(l_Character_3 ~= nil);
                    if v31 == nil or v31.Parent ~= l_Character_3 then
                        v31 = v1.getHead(l_Character_3);
                    end;
                    if v31 then
                        local v137 = v1.getAnimator(l_Character_3, 0);
                        if v21 ~= nil and v137 ~= nil then
                            assert(v21 ~= nil);
                            local l_v21_PlayingAnimationTracks_2 = v21:GetPlayingAnimationTracks();
                            for _, v140 in pairs(l_v21_PlayingAnimationTracks_2) do
                                if v140 ~= nil then
                                    v140:Stop(0);
                                end;
                            end;
                            local l_v137_PlayingAnimationTracks_0 = v137:GetPlayingAnimationTracks();
                            local v142 = nil;
                            v23 = {};
                            for _, v144 in ipairs(l_v137_PlayingAnimationTracks_0) do
                                v142 = v144.Animation;
                                if v142 and v142:IsA("Animation") and v142.AnimationId ~= "" then
                                    v23[v142.AnimationId] = v144;
                                    if not v22[v142.AnimationId] then
                                        v22[v142.AnimationId] = v21:LoadAnimation(v142);
                                    end;
                                    local v145 = v22[v142.AnimationId];
                                    assert(v145 ~= nil);
                                    v145:Play();
                                    v145.TimePosition = v144.TimePosition;
                                    v145.Priority = v144.Priority;
                                    v145:AdjustWeight(v144.WeightCurrent, 0.1);
                                end;
                            end;
                            for v146 in v22 do
                                local v147 = v22[v146];
                                if v147 then
                                    v142 = v147.Animation;
                                    if v142 and not v23[v142.AnimationId] then
                                        local v148 = v22[v142.AnimationId];
                                        if v148 ~= nil then
                                            v148:Stop(0);
                                        end;
                                        v22[v142.AnimationId] = nil;
                                    end;
                                end;
                            end;
                            for _, v150 in ipairs(v137:GetPlayingAnimationTracksCoreScript()) do
                                l_v21_PlayingAnimationTracks_2 = v21:GetPlayingAnimationTracksCoreScript();
                                for _, v152 in pairs(l_v21_PlayingAnimationTracks_2) do
                                    if v152.Animation:IsA("TrackerStreamAnimation") then
                                        v152.Priority = v150.Priority;
                                        v152:AdjustWeight(v150.WeightCurrent, 0);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v153 = nil;
                    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
                    if (l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android) and v21 ~= nil then
                        local l_v21_PlayingAnimationTracksCoreScript_1 = v21:GetPlayingAnimationTracksCoreScript();
                        for _, v157 in pairs(l_v21_PlayingAnimationTracksCoreScript_1) do
                            if v157.Animation:IsA("TrackerStreamAnimation") then
                                local v158 = nil;
                                local l_v157_TrackerData_0, v160, v161 = v157:GetTrackerData();
                                v158 = l_v157_TrackerData_0;
                                v153 = v160;
                                v158 = v161;
                            end;
                        end;
                    end;
                    v39 = v39 + 1;
                    if v39 == 1 then
                        v39 = 0;
                        if v30 then
                            if not v32 then
                                v32 = v1.getHead(v30);
                                if v32 then
                                    v33 = v1.getNeck(v30, v32);
                                end;
                            end;
                            if v32 then
                                v34 = v32.CFrame;
                            end;
                        end;
                        if v27 and v32 then
                            local l_Position_0 = v32.Position;
                            local l_Position_1 = v32.Position;
                            local l_CFrame_0 = v32.CFrame;
                            if v33 then
                                local l_Part0_0 = v33.Part0;
                                local _ = v33.Part1;
                                local l_C0_0 = v33.C0;
                                local l_C1_0 = v33.C1;
                                local l_Transform_0 = v33.Transform;
                                if l_Part0_0 and l_C0_0 then
                                    l_CFrame_0 = l_Part0_0.CFrame * l_C0_0 * l_Transform_0 * l_C1_0:Inverse();
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.25, (v32.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_0 = Vector3.new(l_CFrame_0.Position.X * 0.6, (v32.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            end;
                            if not v28 then
                                warn("boundsSize is nil, this shouldn't be possible");
                            end;
                            assert(v28 ~= nil);
                            if l_game_Service_0 and l_game_Service_0.VideoAnimationEnabled and (v153 ~= nil or l_game_EngineFeature_1) then
                                if l_game_EngineFeature_1 then
                                    local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                    local l_Position_2 = l_DeviceCameraCFrameForSelfView_0.Position;
                                    local v172, v173, v174 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                    local v175 = CFrame.fromEulerAnglesYXZ(v172, v173, v174);
                                    local v176 = 0;
                                    if l_Position_2.Z > 0 then
                                        v176 = math.clamp(0.5 - l_Position_2.Z * 3, -0.5, 0.5);
                                    end;
                                    local v177 = -(v28.Z + 1);
                                    local v178 = Vector3.new(0, 0.105, math.floor((v177 + v176 * v177) * 100) / 100);
                                    v27.CFrame = v27.CFrame:Lerp(CFrame.lookAt(v175 * (l_Position_0 + v178), l_Position_1), 0.5);
                                elseif v153 then
                                    local v179 = Vector3.new(0, 0.105, -(v28.Z + 1));
                                    local v180, v181, v182 = v153:ToEulerAnglesXYZ();
                                    local v183 = CFrame.Angles(-v180 * 0.5, -v181 * 0.5, -v182 * 0.5);
                                    v27.CFrame = CFrame.lookAt(v183 * (l_Position_0 + v179), l_Position_1);
                                end;
                            else
                                local v184 = Vector3.new(0, v15 * 0.25 - 1.25, -(v28.Z + 1) + 0.125);
                                if l_Character_3 then
                                    local l_Head_0 = l_Character_3:FindFirstChild("Head");
                                    if l_Head_0 then
                                        local l_HumanoidRootPart_1 = l_Character_3:FindFirstChild("HumanoidRootPart");
                                        if l_HumanoidRootPart_1 then
                                            local v187 = l_HumanoidRootPart_1.CFrame:Inverse() * l_Head_0.CFrame;
                                            local v188 = Vector3.new(v187.Position.X * 0.15 + 0.125, v187.Position.Y, v187.Position.Z * 0.05);
                                            v27.CFrame = CFrame.lookAt(l_Position_0 + v184 + v188, l_Position_1);
                                            v27.Focus = v32.CFrame;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v31 then
                        if v31.Size ~= v25 then
                            v25 = v31.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function() --[[ Line: 987 ]]
                            -- upvalues: v31 (ref)
                            local _ = v31.Color;
                        end) and v31.Color ~= v24 then
                            updateClonePartsColor(v31.Color);
                        end;
                    end;
                end;
            end;
            if v16 > 0 then
                v16 = v16 - v132;
                if v16 <= 0 then
                    v83(v131);
                    v16 = 0;
                end;
            end;
            if v11 then
                debug.profileend();
            end;
            return;
        end;
    end);
end;
return function(v190, v191, v192) --[[ Line: 1011 ]] --[[ Name: Initialize ]]
    -- upvalues: v35 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v36 (ref), v37 (ref), v120 (copy), v109 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v41 (copy), v40 (copy), v53 (copy)
    if v191 then
        v35 = v191;
        if l_GetFFlagSelfViewVisibilityFix_0() and v192 then
            v36 = v192;
            local l_v36_0 = v36;
            local v194;
            if not l_v36_0 then
                v194 = nil;
            elseif not v35 then
                v194 = nil;
            else
                assert(v35 ~= nil, "Wrapper Frame cannot be nil");
                assert(l_v36_0 ~= nil, "Frame name cannot be nil ");
                v194 = v35:FindFirstAncestor(l_v36_0);
            end;
            v37 = v194;
            if v37 then
                v37:GetPropertyChangedSignal("Visible"):Connect(v120);
            end;
        end;
        v109();
        playerAdded(v190);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v195) --[[ Line: 1039 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v41 (ref), v40 (ref), v53 (ref)
            if v195 == l_LocalPlayer_0 then
                local l_HumanoidStateChanged_1 = v41.HumanoidStateChanged;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v41.CharacterAdded;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v41.CharacterRemoving;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v41.FaceControlsChanged;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                v53();
            end;
        end);
        startRenderStepped(v190);
        return v53;
    else
        return;
    end;
end;