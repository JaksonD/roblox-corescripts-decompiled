local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = CFrame.new((Vector3.new(0, 150, 0, 0)));
local v5 = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000);
local v6 = {};
v6.__index = v6;
local function v10(v7) --[[ Line: 25 ]] --[[ Name: setupCharacterModels ]]
    -- upvalues: l_Players_0 (copy), l_RobloxReplicatedStorage_0 (copy)
    local v8 = nil;
    local v9 = nil;
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        v8 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v9 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    else
        v8 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
        v9 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    end;
    v8.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v9.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v8.HumanoidRootPart.Anchored = true;
    v9.HumanoidRootPart.Anchored = true;
    v8.Parent = l_RobloxReplicatedStorage_0;
    v9.Parent = l_RobloxReplicatedStorage_0;
    v8.HumanoidRootPart.CFrame = CFrame.new(v7);
    v9:SetPrimaryPartCFrame(v8.HumanoidRootPart.CFrame);
    return v8, v9;
end;
v6.new = function(v11, v12, v13, v14) --[[ Line: 60 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v10 (copy), l_RobloxReplicatedStorage_0 (copy)
    local v15 = {};
    setmetatable(v15, v6);
    v15.mockApplyDescription = v14;
    local v16, v17 = v10(v12);
    v15.r6 = v16;
    v15.r15current = v17;
    v15.r15offScreen = v17:Clone();
    v15.r15offScreen.Parent = l_RobloxReplicatedStorage_0;
    v15.avatarType = v13;
    v15.worldModelRef = v11;
    v15.inProgressPromise = nil;
    v15.waitingPromise = nil;
    v15.r6Promise = nil;
    v15.destroyed = false;
    return v15;
end;
v6.setupAnimations = function(v18, v19, v20) --[[ Line: 92 ]] --[[ Name: setupAnimations ]]
    v19.Parent = v18.r6;
    v20.Parent = v18.r15current;
    v20.Archivable = true;
    local v21 = v20:Clone();
    v21.Parent = v18.r15offScreen;
    v21.Archivable = false;
    v20.Archivable = false;
end;
v6.getCurrentCharacter = function(v22) --[[ Line: 102 ]] --[[ Name: getCurrentCharacter ]]
    if v22.avatarType == Enum.HumanoidRigType.R15 then
        return v22.r15current;
    else
        return v22.r6;
    end;
end;
v6.isR15 = function(v23) --[[ Line: 110 ]] --[[ Name: isR15 ]]
    return v23.avatarType == Enum.HumanoidRigType.R15;
end;
v6.syncRotation = function(_, v25, v26) --[[ Line: 114 ]] --[[ Name: syncRotation ]]
    local _, _, _, v30, v31, v32, v33, v34, v35, v36, v37, v38 = v25.HumanoidRootPart.CFrame:components();
    local l_p_0 = v26.HumanoidRootPart.CFrame.p;
    v26.HumanoidRootPart.CFrame = CFrame.new(l_p_0.X, l_p_0.Y, l_p_0.Z, v30, v31, v32, v33, v34, v35, v36, v37, v38);
end;
local function v49(v40, v41) --[[ Line: 122 ]] --[[ Name: hasLayeredAccessoryUpdates ]]
    local l_v40_Accessories_0 = v40:GetAccessories(false);
    local l_v41_Accessories_0 = v41:GetAccessories(false);
    if #l_v41_Accessories_0 == 0 then
        return false;
    elseif #l_v40_Accessories_0 ~= #l_v41_Accessories_0 then
        return true;
    else
        local v44 = {};
        for _, v46 in ipairs(l_v40_Accessories_0) do
            v44[v46.AssetId] = true;
        end;
        for _, v48 in ipairs(l_v41_Accessories_0) do
            if not v44[v48.AssetId] then
                return true;
            end;
        end;
        return false;
    end;
end;
local function _(v50) --[[ Line: 148 ]] --[[ Name: hasWrapLayer ]]
    return v50:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
end;
v6._doUpdateR6 = function(v52, v53) --[[ Line: 152 ]] --[[ Name: _doUpdateR6 ]]
    -- upvalues: v3 (copy)
    return v3.new(function(v54, _) --[[ Line: 153 ]]
        -- upvalues: v52 (copy), v53 (copy)
        v52.r6.Parent = v52.worldModelRef:getValue();
        if v52.mockApplyDescription then
            v52.mockApplyDescription(v52.r6, v53);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v52.r6.Humanoid:ApplyDescriptionAsync(v53);
        else
            v52.r6.Humanoid:ApplyDescription(v53);
        end;
        v54(v52:getCurrentCharacter());
    end);
end;
v6._doSimpleUpdateR15 = function(v56, v57) --[[ Line: 169 ]] --[[ Name: _doSimpleUpdateR15 ]]
    -- upvalues: v3 (copy)
    return v3.new(function(v58, _) --[[ Line: 170 ]]
        -- upvalues: v56 (copy), v57 (copy)
        v56.r15current.Parent = v56.worldModelRef:getValue();
        if v56.mockApplyDescription then
            v56.mockApplyDescription(v56.r15current, v57);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v56.r15current.Humanoid:ApplyDescriptionAsync(v57);
        else
            v56.r15current.Humanoid:ApplyDescription(v57);
        end;
        v58(v56.r15current);
    end);
end;
v6._updateOffscreenR15 = function(v60, v61) --[[ Line: 186 ]] --[[ Name: _updateOffscreenR15 ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.new(function(v62, _) --[[ Line: 187 ]]
        -- upvalues: v60 (copy), v4 (ref), v61 (copy)
        v60.r15offScreen.HumanoidRootPart.CFrame = v4;
        v60.r15offScreen.Parent = v60.worldModelRef:getValue();
        if v60.mockApplyDescription then
            v60.mockApplyDescription(v60.r15offScreen, v61);
        elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v60.r15offScreen.Humanoid:ApplyDescriptionAsync(v61);
        else
            v60.r15offScreen.Humanoid:ApplyDescription(v61);
        end;
        v62(v60.r15offScreen);
    end);
end;
local function v65(v64) --[[ Line: 207 ]] --[[ Name: waitForClusterCompositionFinished ]]
    -- upvalues: v3 (copy), v5 (copy)
    if v64:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then
        return v3.race({
            v3.fromEvent(v64.Humanoid.ClusterCompositionFinished), 
            v3.delay(v5 * 0.001)
        }):andThen(function() --[[ Line: 214 ]]
            return true;
        end);
    else
        return v3.resolve(false);
    end;
end;
v6._completeUpdate = function(v66) --[[ Line: 222 ]] --[[ Name: _completeUpdate ]]
    -- upvalues: v4 (copy), l_RobloxReplicatedStorage_0 (copy)
    local l_CFrame_0 = v66.r15current.HumanoidRootPart.CFrame;
    v66.r15offScreen.HumanoidRootPart.CFrame = l_CFrame_0;
    v66.r15current.HumanoidRootPart.CFrame = v4;
    v66.r15current.Parent = l_RobloxReplicatedStorage_0;
    local l_r15current_0 = v66.r15current;
    local l_r15offScreen_0 = v66.r15offScreen;
    v66.r15offScreen = l_r15current_0;
    v66.r15current = l_r15offScreen_0;
    return v66.r15current;
end;
v6._doUpdateR15 = function(v70, v71) --[[ Line: 234 ]] --[[ Name: _doUpdateR15 ]]
    -- upvalues: v49 (copy), v65 (copy)
    local l_AppliedDescription_0 = v70.r15current.Humanoid:GetAppliedDescription();
    if not v49(l_AppliedDescription_0, v71) then
        return v70:_doSimpleUpdateR15(v71);
    else
        v70.inProgressPromise = v70:_updateOffscreenR15(v71):andThen(v65):andThen(function() --[[ Line: 242 ]]
            -- upvalues: v70 (copy)
            return v70:_completeUpdate();
        end);
        return v70.inProgressPromise;
    end;
end;
v6.maybeUpdateCharacter = function(v73, v74) --[[ Line: 255 ]] --[[ Name: maybeUpdateCharacter ]]
    -- upvalues: v3 (copy)
    if v73.avatarType == Enum.HumanoidRigType.R6 then
        v73.r6Promise = v73:_doUpdateR6(v74);
        return v73.r6Promise;
    elseif v73.inProgressPromise and v73.inProgressPromise:getStatus() == v3.Status.Started then
        local l_waitingPromise_0 = v73.waitingPromise;
        v73.waitingPromise = v73.inProgressPromise:andThen(function() --[[ Line: 266 ]]
            -- upvalues: v73 (copy), v74 (copy)
            return v73:_doUpdateR15(v74);
        end);
        if l_waitingPromise_0 then
            l_waitingPromise_0:cancel();
        end;
        return v73.waitingPromise;
    else
        return v73:_doUpdateR15(v74);
    end;
end;
v6.switchAvatarType = function(v76, v77) --[[ Line: 281 ]] --[[ Name: switchAvatarType ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if v77 == v76.avatarType then
        return v76:getCurrentCharacter();
    else
        v76:_cancelPromises();
        v76.avatarType = v77;
        local v78 = nil;
        local v79 = nil;
        if v77 == Enum.HumanoidRigType.R6 then
            v78 = v76.r6;
            v79 = v76.r15current;
        else
            v78 = v76.r15current;
            v79 = v76.r6;
        end;
        v79.Parent = l_RobloxReplicatedStorage_0;
        v79.Humanoid:UnequipTools();
        v76:syncRotation(v79, v78);
        return v78;
    end;
end;
v6.start = function(_) --[[ Line: 307 ]] --[[ Name: start ]]

end;
local function _(v81) --[[ Line: 309 ]] --[[ Name: cancelPromise ]]
    if v81 then
        v81:cancel();
    end;
end;
v6._cancelPromises = function(v83) --[[ Line: 315 ]] --[[ Name: _cancelPromises ]]
    local l_inProgressPromise_0 = v83.inProgressPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v83.waitingPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v83.r6Promise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    v83.inProgressPromise = nil;
    v83.waitingPromise = nil;
    v83.r6Promise = nil;
end;
v6.stop = function(v85) --[[ Line: 324 ]] --[[ Name: stop ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    v85.r6.Parent = l_RobloxReplicatedStorage_0;
    v85.r15current.Parent = l_RobloxReplicatedStorage_0;
    v85.r15offScreen.Parent = l_RobloxReplicatedStorage_0;
    v85:_cancelPromises();
end;
v6.onDestroy = function(v86) --[[ Line: 332 ]] --[[ Name: onDestroy ]]
    v86:_cancelPromises();
    v86.r6:Destroy();
    v86.r15current:Destroy();
    v86.r15offScreen:Destroy();
end;
return v6;