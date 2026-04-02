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
local l_FFlagAXRefetchAvatarOnTimeout_0 = v13.FFlagAXRefetchAvatarOnTimeout;
local v18 = if l_FFlagAXBackgroundSceneManagerRevamp_0 then CFrame.new(0, 3, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0) else CFrame.new(-3.3, 3, 0.2, 0, 0, -1, 0, 1, 0, 1, 0, 0);
local v19 = CFrame.new(0, 150, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
local v20 = game:DefineFastFlag("FixVRAvatarPlacement", false);
if l_IsVRAppBuild_0() then
    v18 = CFrame.lookAt(Vector3.new(0, 0, -6, 0), (Vector3.new(0, 0, 0, 0)));
    if v20 then
        v18 = CFrame.lookAt(Vector3.new(0, 3, -6, 0), (Vector3.new(0, 3, 0, 0)));
    end;
    v19 = CFrame.lookAt(Vector3.new(6, 1, 100, 0), (Vector3.new(0, 1, 100, 0)));
end;
local v21 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000);
local v22 = {};
v22.__index = v22;
local function v26(v23) --[[ Line: 59 ]] --[[ Name: setupCharacterModels ]]
    -- upvalues: l_FFlagAXAvatarLoadWithRetry_0 (copy), l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v19 (ref)
    local v24 = nil;
    local v25 = nil;
    if l_FFlagAXAvatarLoadWithRetry_0 then
        v24 = v23.r6;
        v25 = v23.r15;
    elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        v24 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v25 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    else
        v24 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v25 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    end;
    v24.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v25.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v24.HumanoidRootPart.Anchored = true;
    v25.HumanoidRootPart.Anchored = true;
    v24.Parent = l_ReplicatedStorage_0;
    v25.Parent = l_ReplicatedStorage_0;
    v24.HumanoidRootPart.CFrame = v19;
    v25:SetPrimaryPartCFrame(v19);
    return v24, v25;
end;
v22.new = function(v27, v28, v29, v30, v31) --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy), v26 (copy), l_ReplicatedStorage_0 (copy), v7 (copy)
    local v32 = {};
    setmetatable(v32, v22);
    v32.store = v27;
    v32.analytics = v28;
    v32.characterMover = v29;
    v32.mockApplyDescription = v31;
    local v33, v34 = v26(v30);
    v32.r6 = v33;
    v32.r6IsOffscreen = true;
    v32.r15current = v34;
    v32.r15offScreen = v34:Clone();
    v32.r15offScreen.Parent = l_ReplicatedStorage_0;
    v32.avatarType = v7.AvatarType.R15;
    v32.inProgressPromise = nil;
    v32.waitingPromise = nil;
    v32.r6Promise = nil;
    v32.destroyed = false;
    return v32;
end;
v22.setupAnimations = function(v35, v36, v37) --[[ Line: 136 ]] --[[ Name: setupAnimations ]]
    v36.Parent = v35.r6;
    v37.Parent = v35.r15current;
    v37.Archivable = true;
    local v38 = v37:Clone();
    v38.Parent = v35.r15offScreen;
    v38.Archivable = false;
    v37.Archivable = false;
end;
v22.getCurrentCharacter = function(v39) --[[ Line: 146 ]] --[[ Name: getCurrentCharacter ]]
    -- upvalues: v7 (copy)
    if v39.avatarType == v7.AvatarType.R15 then
        return v39.r15current;
    else
        return v39.r6;
    end;
end;
v22.isR15 = function(v40) --[[ Line: 154 ]] --[[ Name: isR15 ]]
    -- upvalues: v7 (copy)
    return v40.avatarType == v7.AvatarType.R15;
end;
v22.syncRotation = function(_, v42, v43) --[[ Line: 158 ]] --[[ Name: syncRotation ]]
    local _, _, _, v47, v48, v49, v50, v51, v52, v53, v54, v55 = v42.HumanoidRootPart.CFrame:components();
    local l_p_0 = v43.HumanoidRootPart.CFrame.p;
    v43.HumanoidRootPart.CFrame = CFrame.new(l_p_0.X, l_p_0.Y, l_p_0.Z, v47, v48, v49, v50, v51, v52, v53, v54, v55);
end;
local function v66(v57, v58) --[[ Line: 166 ]] --[[ Name: hasLayeredAccessoryUpdates ]]
    local l_v57_Accessories_0 = v57:GetAccessories(false);
    local l_v58_Accessories_0 = v58:GetAccessories(false);
    if #l_v58_Accessories_0 == 0 then
        return false;
    elseif #l_v57_Accessories_0 ~= #l_v58_Accessories_0 then
        return true;
    else
        local v61 = {};
        for _, v63 in l_v57_Accessories_0 do
            v61[v63.AssetId] = true;
        end;
        for _, v65 in l_v58_Accessories_0 do
            if not v61[v65.AssetId] then
                return true;
            end;
        end;
        return false;
    end;
end;
local v67 = nil;
if l_FFlagAXMakeupEquipping_0 then
    v67 = function(v68, v69) --[[ Line: 194 ]]
        -- upvalues: l_getMakeupDescriptionsFromHumanoidDescription_0 (copy)
        local v70 = l_getMakeupDescriptionsFromHumanoidDescription_0(v68);
        local v71 = l_getMakeupDescriptionsFromHumanoidDescription_0(v69);
        if #v71 == 0 then
            return false;
        elseif #v70 ~= #v71 then
            return true;
        else
            local v72 = {};
            for _, v74 in v70 do
                v72[v74.AssetId] = true;
            end;
            for _, v76 in v71 do
                if not v72[v76.AssetId] then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
local function _(v77) --[[ Line: 221 ]] --[[ Name: hasWrapLayer ]]
    return v77:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
end;
v22._doUpdateR6 = function(v79, v80) --[[ Line: 225 ]] --[[ Name: _doUpdateR6 ]]
    -- upvalues: v20 (copy), l_isSpatial_0 (copy), v18 (ref), v5 (copy)
    if v20 and l_isSpatial_0() then
        if v79.r6IsOffscreen then
            v79.r6.HumanoidRootPart.CFrame = v18;
            v79.r6IsOffscreen = false;
        end;
        return v5.new(function(v81, _) --[[ Line: 235 ]]
            -- upvalues: v79 (copy), v80 (copy)
            if v79.mockApplyDescription then
                v79.mockApplyDescription(v79.r6, v80);
            elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v79.r6.Humanoid:ApplyDescriptionAsync(v80);
            else
                v79.r6.Humanoid:ApplyDescription(v80);
            end;
            v81(v79:getCurrentCharacter(), v79:_stillWaitingOnLCUpdates());
        end);
    else
        return v5.new(function(v83, _) --[[ Line: 250 ]]
            -- upvalues: v79 (copy), v80 (copy), v18 (ref)
            if v79.mockApplyDescription then
                v79.mockApplyDescription(v79.r6, v80);
            elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v79.r6.Humanoid:ApplyDescriptionAsync(v80);
            else
                v79.r6.Humanoid:ApplyDescription(v80);
            end;
            if v79.r6IsOffscreen then
                v79.r6.HumanoidRootPart.CFrame = v18;
                v79.r6IsOffscreen = false;
            end;
            v83(v79:getCurrentCharacter(), v79:_stillWaitingOnLCUpdates());
        end);
    end;
end;
v22._doSimpleUpdateR15 = function(v85, v86) --[[ Line: 272 ]] --[[ Name: _doSimpleUpdateR15 ]]
    -- upvalues: v5 (copy), v8 (copy)
    return v5.new(function(v87, _) --[[ Line: 273 ]]
        -- upvalues: v85 (copy), v86 (copy), v8 (ref)
        local v89 = tick();
        if v85.mockApplyDescription then
            v85.mockApplyDescription(v85.r15current, v86);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v85.r15current.Humanoid:ApplyDescriptionAsync(v86);
        else
            v85.r15current.Humanoid:ApplyDescription(v86);
        end;
        local v90 = (tick() - v89) * 1000;
        v8(v85.analytics, "AXCharacterStandardUpdateTimer", v90);
        v87(v85.r15current, v85:_stillWaitingOnLCUpdates());
    end);
end;
v22._updateOffscreenR15 = function(v91, v92) --[[ Line: 292 ]] --[[ Name: _updateOffscreenR15 ]]
    -- upvalues: v9 (copy), v5 (copy), v19 (ref)
    v91.store:dispatch(v9());
    return v5.new(function(v93, _) --[[ Line: 295 ]]
        -- upvalues: v91 (copy), v19 (ref), v92 (copy)
        v91.r15offScreen.HumanoidRootPart.CFrame = v19;
        v91.r15offScreen.Parent = workspace;
        if v91.mockApplyDescription then
            v91.mockApplyDescription(v91.r15offScreen, v92);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v91.r15offScreen.Humanoid:ApplyDescriptionAsync(v92);
        else
            v91.r15offScreen.Humanoid:ApplyDescription(v92);
        end;
        v93(v91.r15offScreen);
    end);
end;
local function v96(v95) --[[ Line: 315 ]] --[[ Name: waitForClusterCompositionFinished ]]
    -- upvalues: v5 (copy), v21 (copy)
    if v95:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then
        return v5.race({
            v5.fromEvent(v95.Humanoid.ClusterCompositionFinished), 
            v5.delay(v21 * 0.001)
        }):andThen(function() --[[ Line: 322 ]]
            return true;
        end);
    else
        return v5.resolve(false);
    end;
end;
v22._stillWaitingOnLCUpdates = function(v97) --[[ Line: 337 ]] --[[ Name: _stillWaitingOnLCUpdates ]]
    -- upvalues: v7 (copy), v66 (copy)
    if v97.avatarType == v7.AvatarType.R6 then
        return false;
    elseif v97.avatarType == v7.AvatarType.R15 and v97.queuedHumanoidDescription and v66(v97.r15current.Humanoid.HumanoidDescription, v97.queuedHumanoidDescription) then
        return true;
    else
        return false;
    end;
end;
v22._completeUpdate = function(v98, v99, v100) --[[ Line: 351 ]] --[[ Name: _completeUpdate ]]
    -- upvalues: v19 (ref), l_ReplicatedStorage_0 (copy), v10 (copy), v8 (copy)
    local l_CFrame_0 = v98.r15current.HumanoidRootPart.CFrame;
    v98.r15offScreen.HumanoidRootPart.CFrame = l_CFrame_0;
    v98.characterMover:cancelCurrentTween();
    v98.r15current.HumanoidRootPart.CFrame = v19;
    v98.r15current.Parent = l_ReplicatedStorage_0;
    local l_r15current_0 = v98.r15current;
    local l_r15offScreen_0 = v98.r15offScreen;
    v98.r15offScreen = l_r15current_0;
    v98.r15current = l_r15offScreen_0;
    v98.store:dispatch(v10());
    l_r15current_0 = (tick() - v99) * 1000;
    if v100 then
        v8(v98.analytics, "AXCharacterLayeredUpdateTimer", l_r15current_0);
    else
        v8(v98.analytics, "AXCharacterStandardUpdateTimer", l_r15current_0);
    end;
    return v98.r15current, v98:_stillWaitingOnLCUpdates();
end;
v22._doUpdateR15 = function(v104, v105) --[[ Line: 375 ]] --[[ Name: _doUpdateR15 ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), v66 (copy), v67 (ref), v96 (copy)
    local l_AppliedDescription_0 = v104.r15current.Humanoid:GetAppliedDescription();
    if l_FFlagAXMakeupEquipping_0 then
        if not v66(l_AppliedDescription_0, v105) and not v67(l_AppliedDescription_0, v105) then
            return v104:_doSimpleUpdateR15(v105);
        end;
    elseif not v66(l_AppliedDescription_0, v105) then
        return v104:_doSimpleUpdateR15(v105);
    end;
    local v107 = tick();
    v104.inProgressPromise = v104:_updateOffscreenR15(v105):andThen(v96):andThen(function(v108) --[[ Line: 395 ]]
        -- upvalues: v104 (copy), v107 (copy)
        return v104:_completeUpdate(v107, v108);
    end);
    return v104.inProgressPromise;
end;
v22.maybeUpdateCharacter = function(v109, v110) --[[ Line: 401 ]] --[[ Name: maybeUpdateCharacter ]]
    -- upvalues: v7 (copy), v5 (copy)
    if v109.avatarType == v7.AvatarType.R6 then
        v109.r6Promise = v109:_doUpdateR6(v110);
        return v109.r6Promise;
    elseif v109.inProgressPromise and v109.inProgressPromise:getStatus() == v5.Status.Started then
        if v109.waitingPromise then
            v109.waitingPromise:cancel();
        end;
        v109.queuedHumanoidDescription = v110;
        v109.waitingPromise = v109.inProgressPromise:andThen(function() --[[ Line: 420 ]]
            -- upvalues: v109 (copy), v110 (copy)
            v109.inProgressPromise = v109.waitingPromise;
            v109.waitingPromise = nil;
            v109.queuedHumanoidDescription = nil;
            return v109:_doUpdateR15(v110);
        end);
        return v109.waitingPromise;
    else
        return v109:_doUpdateR15(v110);
    end;
end;
v22.switchAvatarType = function(v111, v112) --[[ Line: 444 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: v7 (copy), l_ReplicatedStorage_0 (copy)
    if v112 == v111.avatarType then
        return v111:getCurrentCharacter();
    else
        v111:_cancelPromises();
        v111.avatarType = v112;
        local v113 = nil;
        local v114 = nil;
        if v112 == v7.AvatarType.R6 then
            v113 = v111.r6;
            v114 = v111.r15current;
        else
            v113 = v111.r15current;
            v114 = v111.r6;
        end;
        v114.Parent = l_ReplicatedStorage_0;
        v114.Humanoid:UnequipTools();
        v111:syncRotation(v114, v113);
        return v113;
    end;
end;
v22.start = function(v115) --[[ Line: 470 ]] --[[ Name: start ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v18 (ref)
    if l_IsVRAppBuild_0() then
        v115.r15current.HumanoidRootPart.CFrame = v18;
    end;
end;
local function _(v116) --[[ Line: 476 ]] --[[ Name: cancelPromise ]]
    if v116 then
        v116:cancel();
    end;
end;
v22._cancelPromises = function(v118) --[[ Line: 482 ]] --[[ Name: _cancelPromises ]]
    local l_inProgressPromise_0 = v118.inProgressPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v118.waitingPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v118.r6Promise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    v118.inProgressPromise = nil;
    v118.waitingPromise = nil;
    v118.r6Promise = nil;
end;
v22.stop = function(v120) --[[ Line: 491 ]] --[[ Name: stop ]]
    -- upvalues: l_FFlagAXRefetchAvatarOnTimeout_0 (copy), v10 (copy), l_ReplicatedStorage_0 (copy)
    if l_FFlagAXRefetchAvatarOnTimeout_0 then
        v120.store:dispatch(v10());
    end;
    v120.r6.Parent = l_ReplicatedStorage_0;
    v120.r15current.Parent = l_ReplicatedStorage_0;
    v120.r15offScreen.Parent = l_ReplicatedStorage_0;
    v120:_cancelPromises();
end;
v22.onDestroy = function(v121) --[[ Line: 502 ]] --[[ Name: onDestroy ]]
    -- upvalues: l_FFlagAXRefetchAvatarOnTimeout_0 (copy), v10 (copy)
    if l_FFlagAXRefetchAvatarOnTimeout_0 then
        v121.store:dispatch(v10());
    end;
    v121:_cancelPromises();
    v121.r6:Destroy();
    v121.r15current:Destroy();
    v121.r15offScreen:Destroy();
end;
return v22;