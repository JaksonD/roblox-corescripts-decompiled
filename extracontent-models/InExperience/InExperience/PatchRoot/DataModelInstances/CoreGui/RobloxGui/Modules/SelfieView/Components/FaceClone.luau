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
local v10 = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false);
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local l_game_EngineFeature_2 = game:GetEngineFeature("EnableFacsDisableOverride2");
local v13 = game:DefineFastFlag("SelfViewRespectFacsDisableOverride", false) and l_game_EngineFeature_2;
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
setCloneDirty = function(v45) --[[ Line: 96 ]] --[[ Name: setCloneDirty ]]
    -- upvalues: v16 (ref)
    if v45 then
        v16 = 0.35;
        return;
    else
        v16 = 0;
        return;
    end;
end;
createCloneAnchor = function() --[[ Line: 104 ]] --[[ Name: createCloneAnchor ]]
    -- upvalues: v29 (ref), v26 (ref)
    if v29 ~= nil then
        v29:Destroy();
        v29 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v26;
    v29 = l_WorldModel_0;
end;
local function _(v47) --[[ Line: 116 ]] --[[ Name: clearObserver ]]
    -- upvalues: v40 (copy)
    if v40[v47] then
        v40[v47]:Disconnect();
        v40[v47] = nil;
    end;
end;
clearCloneCharacter = function() --[[ Line: 123 ]] --[[ Name: clearCloneCharacter ]]
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
local function v51() --[[ Line: 142 ]] --[[ Name: clearClone ]]
    -- upvalues: v41 (copy), v40 (copy), v21 (ref), v22 (ref)
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
    v21 = nil;
    v22 = {};
    clearCloneCharacter();
end;
local function v55(v52, v53) --[[ Line: 154 ]] --[[ Name: syncTrack ]]
    -- upvalues: v8 (ref), v9 (ref), l_LocalPlayer_0 (copy), v19 (copy)
    if not v52 or not v53.Animation then
        return;
    else
        local v54 = nil;
        if not v53.Animation or not v53.Animation:IsA("Animation") then
            if v53.Animation and v53.Animation:IsA("TrackerStreamAnimation") then
                v8 = Instance.new("TrackerStreamAnimation");
                assert(v8 ~= nil);
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v9 = v52:LoadStreamAnimationV2(v8, l_LocalPlayer_0, false, false);
                else
                    v9 = v52:LoadStreamAnimationForSelfieView_deprecated(v8, l_LocalPlayer_0);
                end;
                v54 = v9;
            else
                warn("No animation to clone in SelfView");
            end;
        end;
        if v54 then
            v54:Play();
            v54.Priority = v53.Priority;
            v19[v53] = v53.Stopped:Connect(function() --[[ Line: 183 ]]
                -- upvalues: v54 (ref), v19 (ref), v53 (copy)
                v54:Stop(0);
                if v19[v53] then
                    v19[v53]:Disconnect();
                end;
            end);
        end;
        return;
    end;
end;
local function v81(v56) --[[ Line: 192 ]] --[[ Name: updateClone ]]
    -- upvalues: v41 (copy), v40 (copy), v21 (ref), v22 (ref), v1 (copy), v30 (ref), v20 (copy), v29 (ref), v27 (ref), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v28 (ref), v15 (ref), v32 (ref), v33 (ref), v34 (ref), l_game_EngineFeature_0 (copy), v8 (ref), v55 (copy)
    stopRenderStepped();
    local l_AnimationPlayed_1 = v41.AnimationPlayed;
    if v40[l_AnimationPlayed_1] then
        v40[l_AnimationPlayed_1]:Disconnect();
        v40[l_AnimationPlayed_1] = nil;
    end;
    l_AnimationPlayed_1 = v41.AnimationPlayedCoreScript;
    if v40[l_AnimationPlayed_1] then
        v40[l_AnimationPlayed_1]:Disconnect();
        v40[l_AnimationPlayed_1] = nil;
    end;
    v21 = nil;
    v22 = {};
    clearCloneCharacter();
    if not v56 then
        return;
    else
        assert(v56 ~= nil);
        startRenderStepped(v56);
        l_AnimationPlayed_1 = v56.Character;
        if not v56 or not v56.Character then
            return;
        else
            l_AnimationPlayed_1 = v56.Character;
            if not l_AnimationPlayed_1 then
                return;
            else
                assert(l_AnimationPlayed_1 ~= nil);
                local v58 = v1.getAnimator(l_AnimationPlayed_1, 10);
                clearCloneCharacter();
                local l_Archivable_0 = l_AnimationPlayed_1.Archivable;
                l_AnimationPlayed_1.Archivable = true;
                local v60 = v1.getHead(l_AnimationPlayed_1);
                if not v60 then
                    return;
                else
                    v30 = l_AnimationPlayed_1:Clone();
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
                        l_AnimationPlayed_1.Archivable = l_Archivable_0;
                        v30.Parent = v29;
                        local l_HumanoidRootPart_0 = v30:FindFirstChild("HumanoidRootPart");
                        if l_HumanoidRootPart_0 then
                            l_HumanoidRootPart_0.CFrame = CFrame.new((Vector3.new(0, 0, 0, 0)));
                            assert(v27 ~= nil);
                            if v60 then
                                local v62 = v1.getHead(v30);
                                if v62 then
                                    assert(v62 ~= nil);
                                    local v63 = l_CFrameUtility_0.CalculateTargetCFrame(v62.CFrame);
                                    local v64, v65 = l_CharacterUtility_0.CalculateHeadExtents(v30, v63);
                                    local v66 = Vector3.new(v64.X, v64.Y, v64.Z);
                                    v28 = Vector3.new(v65.X, v65.Y, v65.Z) - v66;
                                    assert(v28 ~= nil);
                                    v15 = v62.Size.Y;
                                    local v67 = math.min(v28.X, v28.Y);
                                    v67 = math.min(v28.X, v28.Z);
                                    local l_Model_0 = Instance.new("Model");
                                    l_Model_0.Parent = v30;
                                    v62 = v1.getHead(v30);
                                    l_AnimationPlayed_1.Archivable = true;
                                    v32 = v62:Clone();
                                    assert(v32 ~= nil);
                                    v32.CanCollide = false;
                                    v32.Parent = l_Model_0;
                                    v33 = v1.getNeck(v30, v32);
                                    v34 = v32.CFrame;
                                    v32:Destroy();
                                    assert(v34 ~= nil);
                                    local v69 = v34.Position + v34.LookVector * (v67 * 2);
                                    v27.CFrame = CFrame.lookAt(v69 + Vector3.new(0, 0.10499999672174454, -0.25, 0), v34.Position);
                                    v27.Focus = v34;
                                    l_AnimationPlayed_1.Archivable = l_Archivable_0;
                                    l_Model_0:Destroy();
                                end;
                            else
                                local v70 = l_HumanoidRootPart_0.Position + l_HumanoidRootPart_0.CFrame.LookVector * 2.5;
                                v27.CFrame = CFrame.lookAt(v70 + Vector3.new(0, 1.5, 0, 0), l_HumanoidRootPart_0.Position);
                                v27.CFrame = CFrame.new(v27.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                            end;
                        end;
                        if v30 == nil then
                            return;
                        else
                            local v71 = nil;
                            v71 = v30:FindFirstChildWhichIsA("Humanoid");
                            if v71 then
                                v71.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                            end;
                            v21 = v1.getAnimator(v30, 0);
                            if v21 then
                                if not l_game_EngineFeature_0 then
                                    local l_v21_PlayingAnimationTracks_0 = v21:GetPlayingAnimationTracks();
                                    local l_v21_PlayingAnimationTracksCoreScript_0 = v21:GetPlayingAnimationTracksCoreScript();
                                    for _, v75 in ipairs(l_v21_PlayingAnimationTracks_0) do
                                        if v75 ~= nil then
                                            v75:Stop(0);
                                            v75:Destroy();
                                        end;
                                    end;
                                    for _, v77 in ipairs(l_v21_PlayingAnimationTracksCoreScript_0) do
                                        if v77 ~= nil then
                                            v77:Stop(0);
                                            v77:Destroy();
                                        end;
                                    end;
                                    if v8 then
                                        v8:Destroy();
                                        v8 = nil;
                                    end;
                                end;
                                if v58 then
                                    if l_game_EngineFeature_0 then
                                        v21:SynchronizeWith(v58);
                                    else
                                        for _, v79 in ipairs(v58:GetPlayingAnimationTracksCoreScript()) do
                                            v55(v21, v79);
                                        end;
                                        v40[v41.AnimationPlayedCoreScript] = v58.AnimationPlayedCoreScript:Connect(function(v80) --[[ Line: 380 ]]
                                            -- upvalues: v55 (ref), v21 (ref)
                                            v55(v21, v80);
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
local _ = function(v82, v83) --[[ Line: 396 ]] --[[ Name: hasProperty ]]
    local _ = v82[v83];
end;
updateCachedHeadColor = function(v86) --[[ Line: 403 ]] --[[ Name: updateCachedHeadColor ]]
    -- upvalues: v24 (ref), v25 (ref)
    if v86 == nil then
        return;
    else
        assert(v86 ~= nil);
        if pcall(function() --[[ Line: 409 ]]
            -- upvalues: v86 (copy)
            local _ = v86.Color;
        end) then
            v24 = v86.Color;
            if pcall(function() --[[ Line: 415 ]]
                -- upvalues: v86 (copy)
                local _ = v86.Size;
            end) then
                v25 = v86.Size;
            end;
        end;
        return;
    end;
end;
local function _(v89) --[[ Line: 426 ]] --[[ Name: addHumanoidStateChangedObserver ]]
    -- upvalues: v40 (copy), v41 (copy)
    if not v89 then
        return;
    else
        if not v40[v41.HumanoidStateChanged] then
            v40[v41.HumanoidStateChanged] = v89.StateChanged:Connect(function(v90, v91) --[[ Line: 431 ]]
                if v90 == Enum.HumanoidStateType.PlatformStanding and v91 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v91 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return;
    end;
end;
local function _(v93) --[[ Line: 444 ]] --[[ Name: addFaceControlsObserver ]]
    -- upvalues: v40 (copy), v41 (copy)
    if not v40[v41.FaceControlsChanged] then
        v40[v41.FaceControlsChanged] = v93.InternalFacsOverrideChanged:Connect(function() --[[ Line: 448 ]]
            setCloneDirty(true);
        end);
    end;
end;
local function v105(v95) --[[ Line: 455 ]] --[[ Name: characterAdded ]]
    -- upvalues: v26 (ref), v35 (ref), v31 (ref), v1 (copy), v41 (copy), v40 (copy), v13 (copy), v38 (ref)
    if v26 == nil or v35 == nil then
        return;
    elseif not v95 then
        return;
    else
        v31 = v1.getHead(v95);
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
        l_DescendantAdded_0 = v95:FindFirstChildWhichIsA("Humanoid");
        if l_DescendantAdded_0 then
            local l_l_DescendantAdded_0_0 = l_DescendantAdded_0;
            if l_l_DescendantAdded_0_0 and not v40[v41.HumanoidStateChanged] then
                v40[v41.HumanoidStateChanged] = l_l_DescendantAdded_0_0.StateChanged:Connect(function(v98, v99) --[[ Line: 431 ]]
                    if v98 == Enum.HumanoidStateType.PlatformStanding and v99 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v99 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
        end;
        if v13 then
            local l_v95_FirstChildWhichIsA_0 = v95:FindFirstChildWhichIsA("FaceControls", true);
            if l_v95_FirstChildWhichIsA_0 and not v40[v41.FaceControlsChanged] then
                v40[v41.FaceControlsChanged] = l_v95_FirstChildWhichIsA_0.InternalFacsOverrideChanged:Connect(function() --[[ Line: 448 ]]
                    setCloneDirty(true);
                end);
            end;
        end;
        v40[v41.DescendantAdded] = v95.DescendantAdded:Connect(function(v101) --[[ Line: 487 ]]
            -- upvalues: v26 (ref), v35 (ref), v31 (ref), v1 (ref), v95 (copy), v40 (ref), v41 (ref), v13 (ref)
            if v26 == nil or v35 == nil then
                return;
            else
                if v101.Name == "Head" then
                    v31 = v1.getHead(v95);
                    updateCachedHeadColor(v31);
                end;
                if v101:IsA("Humanoid") and v101 and not v40[v41.HumanoidStateChanged] then
                    v40[v41.HumanoidStateChanged] = v101.StateChanged:Connect(function(v102, v103) --[[ Line: 431 ]]
                        if v102 == Enum.HumanoidStateType.PlatformStanding and v103 == Enum.HumanoidStateType.Running then
                            setCloneDirty(true);
                        end;
                        if v103 == Enum.HumanoidStateType.GettingUp then
                            setCloneDirty(true);
                        end;
                    end);
                end;
                if v13 and v101:IsA("FaceControls") and not v40[v41.FaceControlsChanged] then
                    v40[v41.FaceControlsChanged] = v101.InternalFacsOverrideChanged:Connect(function() --[[ Line: 448 ]]
                        setCloneDirty(true);
                    end);
                end;
                if v1.shouldMarkCloneDirtyForDescendant(v101) then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        v40[v41.DescendantRemoving] = v95.DescendantRemoving:Connect(function(v104) --[[ Line: 512 ]]
            -- upvalues: v26 (ref), v35 (ref), v1 (ref)
            if v26 == nil or v35 == nil then
                return;
            else
                if v104 and (v104:IsA("MeshPart") or v104:IsA("Accessory")) then
                    if v104:IsA("MeshPart") and v104.MeshId == "" then
                        return;
                    elseif v1.shouldMarkCloneDirtyForDescendant(v104) then
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
local function v107() --[[ Line: 534 ]] --[[ Name: createViewport ]]
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
ReInit = function(v108) --[[ Line: 568 ]] --[[ Name: ReInit ]]
    -- upvalues: l_GetFFlagSelfViewVisibilityFix_0 (copy), v37 (ref), v44 (ref), v31 (ref), v1 (copy), v41 (copy), v40 (copy), v21 (ref), v22 (ref), v107 (copy)
    assert(v108.Character ~= nil);
    if l_GetFFlagSelfViewVisibilityFix_0() and v37 and not v37.Visible then
        v44 = false;
        return;
    else
        v31 = v1.getHead(v108.Character);
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
        stopRenderStepped();
        l_CharacterAdded_0 = v41.AnimationPlayed;
        if v40[l_CharacterAdded_0] then
            v40[l_CharacterAdded_0]:Disconnect();
            v40[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v41.AnimationPlayedCoreScript;
        if v40[l_CharacterAdded_0] then
            v40[l_CharacterAdded_0]:Disconnect();
            v40[l_CharacterAdded_0] = nil;
        end;
        v21 = nil;
        v22 = {};
        clearCloneCharacter();
        v107();
        playerAdded(v108);
        startRenderStepped(v108);
        return;
    end;
end;
local function v115(v110) --[[ Line: 590 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v18 (ref), v38 (ref), v105 (copy), l_LocalPlayer_0 (copy), v41 (copy), v40 (copy)
    if v18 then
        v18:Disconnect();
    end;
    if not v38 then
        v105(v110);
    else
        ReInit(l_LocalPlayer_0);
    end;
    local l_HumanoidStateChanged_0 = v41.HumanoidStateChanged;
    if v40[l_HumanoidStateChanged_0] then
        v40[l_HumanoidStateChanged_0]:Disconnect();
        v40[l_HumanoidStateChanged_0] = nil;
    end;
    l_HumanoidStateChanged_0 = nil;
    l_HumanoidStateChanged_0 = v110:FindFirstChildWhichIsA("Humanoid");
    if l_HumanoidStateChanged_0 then
        local l_l_HumanoidStateChanged_0_0 = l_HumanoidStateChanged_0;
        if not l_l_HumanoidStateChanged_0_0 then
            return;
        elseif not v40[v41.HumanoidStateChanged] then
            v40[v41.HumanoidStateChanged] = l_l_HumanoidStateChanged_0_0.StateChanged:Connect(function(v113, v114) --[[ Line: 431 ]]
                if v113 == Enum.HumanoidStateType.PlatformStanding and v114 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v114 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
    end;
end;
local function _(v116) --[[ Line: 608 ]] --[[ Name: FindInParents ]]
    -- upvalues: v35 (ref)
    if not v116 then
        return nil;
    elseif not v35 then
        return nil;
    else
        assert(v35 ~= nil, "Wrapper Frame cannot be nil");
        assert(v116 ~= nil, "Frame name cannot be nil ");
        return v35:FindFirstAncestor(v116);
    end;
end;
clearViewportFrame = function() --[[ Line: 623 ]] --[[ Name: clearViewportFrame ]]
    -- upvalues: v26 (ref), v35 (ref)
    if v26 then
        v26:Destroy();
    end;
    v35 = nil;
    stopRenderStepped();
end;
local function v118() --[[ Line: 631 ]] --[[ Name: onOuterContainerVisibilityChanged ]]
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
playerAdded = function(v119) --[[ Line: 650 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_LocalPlayer_0 (copy), v18 (ref), v41 (copy), v40 (copy), v115 (copy), v105 (copy), v81 (copy)
    if v119 ~= nil and v119 == l_LocalPlayer_0 then
        if v18 ~= nil then
            v18:Disconnect();
            v18 = nil;
            local l_CharacterAdded_1 = v41.CharacterAdded;
            if v40[l_CharacterAdded_1] then
                v40[l_CharacterAdded_1]:Disconnect();
                v40[l_CharacterAdded_1] = nil;
            end;
        end;
        local l_Character_0 = v119.Character;
        l_Character_0 = v119.Character;
        v18 = v119.CharacterAdded:Connect(v115);
        if l_Character_0 then
            v105(l_Character_0);
        end;
        v40[v41.CharacterAdded] = v119.CharacterAdded:Connect(v105);
        v40[v41.CharacterRemoving] = v119.CharacterRemoving:Connect(function() --[[ Line: 669 ]]
            -- upvalues: v41 (ref), v40 (ref), v81 (ref)
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
            v81(nil);
            l_DescendantAdded_1 = v41.CharacterRemoving;
            if v40[l_DescendantAdded_1] then
                v40[l_DescendantAdded_1]:Disconnect();
                v40[l_DescendantAdded_1] = nil;
            end;
        end);
    end;
end;
stopRenderStepped = function() --[[ Line: 680 ]] --[[ Name: stopRenderStepped ]]
    -- upvalues: v17 (ref)
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
end;
updateClonePartsColor = function(v123) --[[ Line: 687 ]] --[[ Name: updateClonePartsColor ]]
    -- upvalues: v31 (ref), v24 (ref), l_LocalPlayer_0 (copy), v30 (ref)
    if pcall(function() --[[ Line: 688 ]]
        -- upvalues: v31 (ref)
        local _ = v31.Color;
    end) and v31 and v31.Color ~= v24 then
        local l_Character_1 = l_LocalPlayer_0.Character;
        if not l_Character_1 then
            return;
        else
            assert(l_Character_1 ~= nil);
            if not v30 then
                return;
            else
                assert(v30 ~= nil);
                for _, v127 in pairs(l_Character_1:GetChildren()) do
                    if v127:IsA("MeshPart") then
                        local l_v30_FirstChild_0 = v30:FindFirstChild(v127.Name);
                        if l_v30_FirstChild_0 and l_v30_FirstChild_0:IsA("MeshPart") and l_v30_FirstChild_0.Color and v127.Color then
                            l_v30_FirstChild_0.Color = v127.Color;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v24 = v123;
end;
startRenderStepped = function(v129) --[[ Line: 720 ]] --[[ Name: startRenderStepped ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), v17 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v30 (ref), v37 (ref), v44 (ref), v21 (ref), l_LocalPlayer_0 (copy), v31 (ref), v1 (copy), v23 (ref), v22 (ref), l_UserInputService_0 (copy), v39 (ref), v32 (ref), v33 (ref), v34 (ref), v27 (ref), v28 (ref), l_game_Service_0 (copy), l_game_EngineFeature_1 (copy), v15 (ref), v25 (ref), v24 (ref), v16 (ref), v81 (copy)
    stopRenderStepped();
    v17 = (if v10 then l_RunService_0.Heartbeat else l_RunService_0.RenderStepped):Connect(function(v130) --[[ Line: 727 ]]
        -- upvalues: v10 (ref), l_GetFFlagSelfViewVisibilityFix_0 (ref), v30 (ref), v37 (ref), v44 (ref), v21 (ref), l_LocalPlayer_0 (ref), v31 (ref), v1 (ref), v23 (ref), v22 (ref), l_UserInputService_0 (ref), v39 (ref), v32 (ref), v33 (ref), v34 (ref), v27 (ref), v28 (ref), l_game_Service_0 (ref), l_game_EngineFeature_1 (ref), v15 (ref), v25 (ref), v24 (ref), v16 (ref), v81 (ref), v129 (copy)
        if v10 then
            debug.profilebegin("faceclone");
        end;
        if l_GetFFlagSelfViewVisibilityFix_0() and v30 and v37 and not v44 then
            if v21 ~= nil then
                local l_v21_PlayingAnimationTracks_1 = v21:GetPlayingAnimationTracks();
                for _, v133 in pairs(l_v21_PlayingAnimationTracks_1) do
                    if v133 ~= nil then
                        v133:Stop(0);
                    end;
                end;
            end;
            return;
        else
            if l_LocalPlayer_0 then
                local l_Character_2 = l_LocalPlayer_0.Character;
                if not l_Character_2 or l_Character_2.Parent == nil then
                    return;
                else
                    assert(l_Character_2 ~= nil);
                    if v31 == nil or v31.Parent ~= l_Character_2 then
                        v31 = v1.getHead(l_Character_2);
                    end;
                    if v31 then
                        local v135 = v1.getAnimator(l_Character_2, 0);
                        if v21 ~= nil and v135 ~= nil then
                            assert(v21 ~= nil);
                            local l_v21_PlayingAnimationTracks_2 = v21:GetPlayingAnimationTracks();
                            for _, v138 in pairs(l_v21_PlayingAnimationTracks_2) do
                                if v138 ~= nil then
                                    v138:Stop(0);
                                end;
                            end;
                            local l_v135_PlayingAnimationTracks_0 = v135:GetPlayingAnimationTracks();
                            local v140 = nil;
                            v23 = {};
                            for _, v142 in ipairs(l_v135_PlayingAnimationTracks_0) do
                                v140 = v142.Animation;
                                if v140 and v140:IsA("Animation") and v140.AnimationId ~= "" then
                                    v23[v140.AnimationId] = v142;
                                    if not v22[v140.AnimationId] then
                                        v22[v140.AnimationId] = v21:LoadAnimation(v140);
                                    end;
                                    local v143 = v22[v140.AnimationId];
                                    v143:Play();
                                    v143.TimePosition = v142.TimePosition;
                                    v143.Priority = v142.Priority;
                                    v143:AdjustWeight(v142.WeightCurrent, 0.1);
                                end;
                            end;
                            for v144 in v22 do
                                local v145 = v22[v144];
                                if v145 then
                                    v140 = v145.Animation;
                                    if v140 and not v23[v140.AnimationId] then
                                        if v22[v140.AnimationId] ~= nil then
                                            v22[v140.AnimationId]:Stop(0);
                                        end;
                                        v22[v140.AnimationId] = nil;
                                    end;
                                end;
                            end;
                            for _, v147 in ipairs(v135:GetPlayingAnimationTracksCoreScript()) do
                                l_v21_PlayingAnimationTracks_2 = v21:GetPlayingAnimationTracksCoreScript();
                                for _, v149 in pairs(l_v21_PlayingAnimationTracks_2) do
                                    if v149.Animation:IsA("TrackerStreamAnimation") then
                                        v149.Priority = v147.Priority;
                                        v149:AdjustWeight(v147.WeightCurrent, 0);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v150 = nil;
                    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
                    if (l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android) and v21 ~= nil then
                        local l_v21_PlayingAnimationTracksCoreScript_1 = v21:GetPlayingAnimationTracksCoreScript();
                        for _, v154 in pairs(l_v21_PlayingAnimationTracksCoreScript_1) do
                            if v154.Animation:IsA("TrackerStreamAnimation") then
                                local v155 = nil;
                                local l_v154_TrackerData_0, v157, v158 = v154:GetTrackerData();
                                v155 = l_v154_TrackerData_0;
                                v150 = v157;
                                v155 = v158;
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
                            if l_game_Service_0 and l_game_Service_0.VideoAnimationEnabled and (v150 ~= nil or l_game_EngineFeature_1) then
                                if l_game_EngineFeature_1 then
                                    local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                    local l_Position_2 = l_DeviceCameraCFrameForSelfView_0.Position;
                                    local v169, v170, v171 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                    local v172 = CFrame.fromEulerAnglesYXZ(v169, v170, v171);
                                    local v173 = 0;
                                    if l_Position_2.Z > 0 then
                                        v173 = math.clamp(0.5 - l_Position_2.Z * 3, -0.5, 0.5);
                                    end;
                                    local v174 = -(v28.Z + 1);
                                    local v175 = Vector3.new(0, 0.105, math.floor((v174 + v173 * v174) * 100) / 100);
                                    v27.CFrame = v27.CFrame:Lerp(CFrame.lookAt(v172 * (l_Position_0 + v175), l_Position_1), 0.5);
                                elseif v150 then
                                    local v176 = Vector3.new(0, 0.105, -(v28.Z + 1));
                                    local v177, v178, v179 = v150:ToEulerAnglesXYZ();
                                    local v180 = CFrame.Angles(-v177 * 0.5, -v178 * 0.5, -v179 * 0.5);
                                    v27.CFrame = CFrame.lookAt(v180 * (l_Position_0 + v176), l_Position_1);
                                end;
                            else
                                local v181 = Vector3.new(0, v15 * 0.25 - 1.25, -(v28.Z + 1) + 0.125);
                                if l_Character_2 then
                                    local l_Head_0 = l_Character_2:FindFirstChild("Head");
                                    if l_Head_0 then
                                        local l_HumanoidRootPart_1 = l_Character_2:FindFirstChild("HumanoidRootPart");
                                        if l_HumanoidRootPart_1 then
                                            local v184 = l_HumanoidRootPart_1.CFrame:Inverse() * l_Head_0.CFrame;
                                            local v185 = Vector3.new(v184.Position.X * 0.15 + 0.125, v184.Position.Y, v184.Position.Z * 0.05);
                                            v27.CFrame = CFrame.lookAt(l_Position_0 + v181 + v185, l_Position_1);
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
                        if pcall(function() --[[ Line: 980 ]]
                            -- upvalues: v31 (ref)
                            local _ = v31.Color;
                        end) and v31.Color ~= v24 then
                            updateClonePartsColor(v31.Color);
                        end;
                    end;
                end;
            end;
            if v16 > 0 then
                v16 = v16 - v130;
                if v16 <= 0 then
                    v81(v129);
                    v16 = 0;
                end;
            end;
            if v10 then
                debug.profileend();
            end;
            return;
        end;
    end);
end;
return function(v187, v188, v189) --[[ Line: 1004 ]] --[[ Name: Initialize ]]
    -- upvalues: v35 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v36 (ref), v37 (ref), v118 (copy), v107 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v41 (copy), v40 (copy), v13 (copy), v21 (ref), v22 (ref), v51 (copy)
    if v188 then
        v35 = v188;
        if l_GetFFlagSelfViewVisibilityFix_0() and v189 then
            v36 = v189;
            local l_v36_0 = v36;
            local v191;
            if not l_v36_0 then
                v191 = nil;
            elseif not v35 then
                v191 = nil;
            else
                assert(v35 ~= nil, "Wrapper Frame cannot be nil");
                assert(l_v36_0 ~= nil, "Frame name cannot be nil ");
                v191 = v35:FindFirstAncestor(l_v36_0);
            end;
            v37 = v191;
            if v37 then
                v37:GetPropertyChangedSignal("Visible"):Connect(v118);
            end;
        end;
        v107();
        playerAdded(v187);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v192) --[[ Line: 1032 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v41 (ref), v40 (ref), v13 (ref), v21 (ref), v22 (ref)
            if v192 == l_LocalPlayer_0 then
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
                if v13 then
                    l_HumanoidStateChanged_1 = v41.FaceControlsChanged;
                    if v40[l_HumanoidStateChanged_1] then
                        v40[l_HumanoidStateChanged_1]:Disconnect();
                        v40[l_HumanoidStateChanged_1] = nil;
                    end;
                end;
                stopRenderStepped();
                l_HumanoidStateChanged_1 = v41.AnimationPlayed;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v41.AnimationPlayedCoreScript;
                if v40[l_HumanoidStateChanged_1] then
                    v40[l_HumanoidStateChanged_1]:Disconnect();
                    v40[l_HumanoidStateChanged_1] = nil;
                end;
                v21 = nil;
                v22 = {};
                clearCloneCharacter();
            end;
        end);
        startRenderStepped(v187);
        return v51;
    else
        return;
    end;
end;