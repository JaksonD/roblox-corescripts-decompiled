local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarStat);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedApplyingLayeredClothing);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.FinishedApplyingLayeredClothing);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_getMakeupDescriptionsFromHumanoidDescription_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getMakeupDescriptionsFromHumanoidDescription;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXBackgroundSceneManagerRevamp_0 = v13.FFlagAXBackgroundSceneManagerRevamp;
local l_FFlagAXAvatarLoadWithRetry_0 = v13.FFlagAXAvatarLoadWithRetry;
local l_FFlagAXMakeupEquipping_0 = v13.FFlagAXMakeupEquipping;
local v17 = if l_FFlagAXBackgroundSceneManagerRevamp_0 then CFrame.new(0, 3, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0) else CFrame.new(-3.3, 3, 0.2, 0, 0, -1, 0, 1, 0, 1, 0, 0);
local v18 = CFrame.new(0, 150, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
local v19 = game:DefineFastFlag("FixVRAvatarPlacement", false);
if l_IsVRAppBuild_0() then
    v17 = CFrame.lookAt(Vector3.new(0, 0, -6, 0), (Vector3.new(0, 0, 0, 0)));
    if v19 then
        v17 = CFrame.lookAt(Vector3.new(0, 3, -6, 0), (Vector3.new(0, 3, 0, 0)));
    end;
    v18 = CFrame.lookAt(Vector3.new(6, 1, 100, 0), (Vector3.new(0, 1, 100, 0)));
end;
local v20 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000);
local v21 = {};
v21.__index = v21;
local function v25(v22) --[[ Line: 58 ]] --[[ Name: setupCharacterModels ]]
    -- upvalues: l_FFlagAXAvatarLoadWithRetry_0 (copy), l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v18 (ref)
    local v23 = nil;
    local v24 = nil;
    if l_FFlagAXAvatarLoadWithRetry_0 then
        v23 = v22.r6;
        v24 = v22.r15;
    elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        v23 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v24 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    else
        v23 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v24 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    end;
    v23.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v24.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v23.HumanoidRootPart.Anchored = true;
    v24.HumanoidRootPart.Anchored = true;
    v23.Parent = l_ReplicatedStorage_0;
    v24.Parent = l_ReplicatedStorage_0;
    v23.HumanoidRootPart.CFrame = v18;
    v24:SetPrimaryPartCFrame(v18);
    return v23, v24;
end;
v21.new = function(v26, v27, v28, v29, v30) --[[ Line: 101 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v25 (copy), l_ReplicatedStorage_0 (copy), v7 (copy)
    local v31 = {};
    setmetatable(v31, v21);
    v31.store = v26;
    v31.analytics = v27;
    v31.characterMover = v28;
    v31.mockApplyDescription = v30;
    local v32, v33 = v25(v29);
    v31.r6 = v32;
    v31.r6IsOffscreen = true;
    v31.r15current = v33;
    v31.r15offScreen = v33:Clone();
    v31.r15offScreen.Parent = l_ReplicatedStorage_0;
    v31.avatarType = v7.AvatarType.R15;
    v31.inProgressPromise = nil;
    v31.waitingPromise = nil;
    v31.r6Promise = nil;
    v31.destroyed = false;
    return v31;
end;
v21.setupAnimations = function(v34, v35, v36) --[[ Line: 135 ]] --[[ Name: setupAnimations ]]
    v35.Parent = v34.r6;
    v36.Parent = v34.r15current;
    v36.Archivable = true;
    local v37 = v36:Clone();
    v37.Parent = v34.r15offScreen;
    v37.Archivable = false;
    v36.Archivable = false;
end;
v21.getCurrentCharacter = function(v38) --[[ Line: 145 ]] --[[ Name: getCurrentCharacter ]]
    -- upvalues: v7 (copy)
    if v38.avatarType == v7.AvatarType.R15 then
        return v38.r15current;
    else
        return v38.r6;
    end;
end;
v21.isR15 = function(v39) --[[ Line: 153 ]] --[[ Name: isR15 ]]
    -- upvalues: v7 (copy)
    return v39.avatarType == v7.AvatarType.R15;
end;
v21.syncRotation = function(_, v41, v42) --[[ Line: 157 ]] --[[ Name: syncRotation ]]
    local _, _, _, v46, v47, v48, v49, v50, v51, v52, v53, v54 = v41.HumanoidRootPart.CFrame:components();
    local l_p_0 = v42.HumanoidRootPart.CFrame.p;
    v42.HumanoidRootPart.CFrame = CFrame.new(l_p_0.X, l_p_0.Y, l_p_0.Z, v46, v47, v48, v49, v50, v51, v52, v53, v54);
end;
local function v65(v56, v57) --[[ Line: 165 ]] --[[ Name: hasLayeredAccessoryUpdates ]]
    local l_v56_Accessories_0 = v56:GetAccessories(false);
    local l_v57_Accessories_0 = v57:GetAccessories(false);
    if #l_v57_Accessories_0 == 0 then
        return false;
    elseif #l_v56_Accessories_0 ~= #l_v57_Accessories_0 then
        return true;
    else
        local v60 = {};
        for _, v62 in l_v56_Accessories_0 do
            v60[v62.AssetId] = true;
        end;
        for _, v64 in l_v57_Accessories_0 do
            if not v60[v64.AssetId] then
                return true;
            end;
        end;
        return false;
    end;
end;
local v66 = nil;
if l_FFlagAXMakeupEquipping_0 then
    v66 = function(v67, v68) --[[ Line: 193 ]]
        -- upvalues: l_getMakeupDescriptionsFromHumanoidDescription_0 (copy)
        local v69 = l_getMakeupDescriptionsFromHumanoidDescription_0(v67);
        local v70 = l_getMakeupDescriptionsFromHumanoidDescription_0(v68);
        if #v70 == 0 then
            return false;
        elseif #v69 ~= #v70 then
            return true;
        else
            local v71 = {};
            for _, v73 in v69 do
                v71[v73.AssetId] = true;
            end;
            for _, v75 in v70 do
                if not v71[v75.AssetId] then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
local function _(v76) --[[ Line: 220 ]] --[[ Name: hasWrapLayer ]]
    return v76:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
end;
v21._doUpdateR6 = function(v78, v79) --[[ Line: 224 ]] --[[ Name: _doUpdateR6 ]]
    -- upvalues: v19 (copy), l_isSpatial_0 (copy), v17 (ref), v5 (copy)
    if v19 and l_isSpatial_0() then
        if v78.r6IsOffscreen then
            v78.r6.HumanoidRootPart.CFrame = v17;
            v78.r6IsOffscreen = false;
        end;
        return v5.new(function(v80, _) --[[ Line: 234 ]]
            -- upvalues: v78 (copy), v79 (copy)
            if v78.mockApplyDescription then
                v78.mockApplyDescription(v78.r6, v79);
            elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v78.r6.Humanoid:ApplyDescriptionAsync(v79);
            else
                v78.r6.Humanoid:ApplyDescription(v79);
            end;
            v80(v78:getCurrentCharacter(), v78:_stillWaitingOnLCUpdates());
        end);
    else
        return v5.new(function(v82, _) --[[ Line: 249 ]]
            -- upvalues: v78 (copy), v79 (copy), v17 (ref)
            if v78.mockApplyDescription then
                v78.mockApplyDescription(v78.r6, v79);
            elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v78.r6.Humanoid:ApplyDescriptionAsync(v79);
            else
                v78.r6.Humanoid:ApplyDescription(v79);
            end;
            if v78.r6IsOffscreen then
                v78.r6.HumanoidRootPart.CFrame = v17;
                v78.r6IsOffscreen = false;
            end;
            v82(v78:getCurrentCharacter(), v78:_stillWaitingOnLCUpdates());
        end);
    end;
end;
v21._doSimpleUpdateR15 = function(v84, v85) --[[ Line: 271 ]] --[[ Name: _doSimpleUpdateR15 ]]
    -- upvalues: v5 (copy), v8 (copy)
    return v5.new(function(v86, _) --[[ Line: 272 ]]
        -- upvalues: v84 (copy), v85 (copy), v8 (ref)
        local v88 = tick();
        if v84.mockApplyDescription then
            v84.mockApplyDescription(v84.r15current, v85);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v84.r15current.Humanoid:ApplyDescriptionAsync(v85);
        else
            v84.r15current.Humanoid:ApplyDescription(v85);
        end;
        local v89 = (tick() - v88) * 1000;
        v8(v84.analytics, "AXCharacterStandardUpdateTimer", v89);
        v86(v84.r15current, v84:_stillWaitingOnLCUpdates());
    end);
end;
v21._updateOffscreenR15 = function(v90, v91) --[[ Line: 291 ]] --[[ Name: _updateOffscreenR15 ]]
    -- upvalues: v9 (copy), v5 (copy), v18 (ref)
    v90.store:dispatch(v9());
    return v5.new(function(v92, _) --[[ Line: 294 ]]
        -- upvalues: v90 (copy), v18 (ref), v91 (copy)
        v90.r15offScreen.HumanoidRootPart.CFrame = v18;
        v90.r15offScreen.Parent = workspace;
        if v90.mockApplyDescription then
            v90.mockApplyDescription(v90.r15offScreen, v91);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v90.r15offScreen.Humanoid:ApplyDescriptionAsync(v91);
        else
            v90.r15offScreen.Humanoid:ApplyDescription(v91);
        end;
        v92(v90.r15offScreen);
    end);
end;
local function v95(v94) --[[ Line: 314 ]] --[[ Name: waitForClusterCompositionFinished ]]
    -- upvalues: v5 (copy), v20 (copy)
    if v94:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then
        return v5.race({
            v5.fromEvent(v94.Humanoid.ClusterCompositionFinished), 
            v5.delay(v20 * 0.001)
        }):andThen(function() --[[ Line: 321 ]]
            return true;
        end);
    else
        return v5.resolve(false);
    end;
end;
v21._stillWaitingOnLCUpdates = function(v96) --[[ Line: 336 ]] --[[ Name: _stillWaitingOnLCUpdates ]]
    -- upvalues: v7 (copy), v65 (copy)
    if v96.avatarType == v7.AvatarType.R6 then
        return false;
    elseif v96.avatarType == v7.AvatarType.R15 and v96.queuedHumanoidDescription and v65(v96.r15current.Humanoid.HumanoidDescription, v96.queuedHumanoidDescription) then
        return true;
    else
        return false;
    end;
end;
v21._completeUpdate = function(v97, v98, v99) --[[ Line: 350 ]] --[[ Name: _completeUpdate ]]
    -- upvalues: v18 (ref), l_ReplicatedStorage_0 (copy), v10 (copy), v8 (copy)
    local l_CFrame_0 = v97.r15current.HumanoidRootPart.CFrame;
    v97.r15offScreen.HumanoidRootPart.CFrame = l_CFrame_0;
    v97.characterMover:cancelCurrentTween();
    v97.r15current.HumanoidRootPart.CFrame = v18;
    v97.r15current.Parent = l_ReplicatedStorage_0;
    local l_r15current_0 = v97.r15current;
    local l_r15offScreen_0 = v97.r15offScreen;
    v97.r15offScreen = l_r15current_0;
    v97.r15current = l_r15offScreen_0;
    v97.store:dispatch(v10());
    l_r15current_0 = (tick() - v98) * 1000;
    if v99 then
        v8(v97.analytics, "AXCharacterLayeredUpdateTimer", l_r15current_0);
    else
        v8(v97.analytics, "AXCharacterStandardUpdateTimer", l_r15current_0);
    end;
    return v97.r15current, v97:_stillWaitingOnLCUpdates();
end;
v21._doUpdateR15 = function(v103, v104) --[[ Line: 374 ]] --[[ Name: _doUpdateR15 ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), v65 (copy), v66 (ref), v95 (copy)
    local l_AppliedDescription_0 = v103.r15current.Humanoid:GetAppliedDescription();
    if l_FFlagAXMakeupEquipping_0 then
        if not v65(l_AppliedDescription_0, v104) and not v66(l_AppliedDescription_0, v104) then
            return v103:_doSimpleUpdateR15(v104);
        end;
    elseif not v65(l_AppliedDescription_0, v104) then
        return v103:_doSimpleUpdateR15(v104);
    end;
    local v106 = tick();
    v103.inProgressPromise = v103:_updateOffscreenR15(v104):andThen(v95):andThen(function(v107) --[[ Line: 394 ]]
        -- upvalues: v103 (copy), v106 (copy)
        return v103:_completeUpdate(v106, v107);
    end);
    return v103.inProgressPromise;
end;
v21.maybeUpdateCharacter = function(v108, v109) --[[ Line: 400 ]] --[[ Name: maybeUpdateCharacter ]]
    -- upvalues: v7 (copy), v5 (copy)
    if v108.avatarType == v7.AvatarType.R6 then
        v108.r6Promise = v108:_doUpdateR6(v109);
        return v108.r6Promise;
    elseif v108.inProgressPromise and v108.inProgressPromise:getStatus() == v5.Status.Started then
        if v108.waitingPromise then
            v108.waitingPromise:cancel();
        end;
        v108.queuedHumanoidDescription = v109;
        v108.waitingPromise = v108.inProgressPromise:andThen(function() --[[ Line: 419 ]]
            -- upvalues: v108 (copy), v109 (copy)
            v108.inProgressPromise = v108.waitingPromise;
            v108.waitingPromise = nil;
            v108.queuedHumanoidDescription = nil;
            return v108:_doUpdateR15(v109);
        end);
        return v108.waitingPromise;
    else
        return v108:_doUpdateR15(v109);
    end;
end;
v21.switchAvatarType = function(v110, v111) --[[ Line: 443 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: v7 (copy), l_ReplicatedStorage_0 (copy)
    if v111 == v110.avatarType then
        return v110:getCurrentCharacter();
    else
        v110:_cancelPromises();
        v110.avatarType = v111;
        local v112 = nil;
        local v113 = nil;
        if v111 == v7.AvatarType.R6 then
            v112 = v110.r6;
            v113 = v110.r15current;
        else
            v112 = v110.r15current;
            v113 = v110.r6;
        end;
        v113.Parent = l_ReplicatedStorage_0;
        v113.Humanoid:UnequipTools();
        v110:syncRotation(v113, v112);
        return v112;
    end;
end;
v21.start = function(v114) --[[ Line: 469 ]] --[[ Name: start ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v17 (ref)
    if l_IsVRAppBuild_0() then
        v114.r15current.HumanoidRootPart.CFrame = v17;
    end;
end;
local function _(v115) --[[ Line: 475 ]] --[[ Name: cancelPromise ]]
    if v115 then
        v115:cancel();
    end;
end;
v21._cancelPromises = function(v117) --[[ Line: 481 ]] --[[ Name: _cancelPromises ]]
    local l_inProgressPromise_0 = v117.inProgressPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v117.waitingPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v117.r6Promise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    v117.inProgressPromise = nil;
    v117.waitingPromise = nil;
    v117.r6Promise = nil;
end;
v21.stop = function(v119) --[[ Line: 490 ]] --[[ Name: stop ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    v119.r6.Parent = l_ReplicatedStorage_0;
    v119.r15current.Parent = l_ReplicatedStorage_0;
    v119.r15offScreen.Parent = l_ReplicatedStorage_0;
    v119:_cancelPromises();
end;
v21.onDestroy = function(v120) --[[ Line: 498 ]] --[[ Name: onDestroy ]]
    v120:_cancelPromises();
    v120.r6:Destroy();
    v120.r15current:Destroy();
    v120.r15offScreen:Destroy();
end;
return v21;