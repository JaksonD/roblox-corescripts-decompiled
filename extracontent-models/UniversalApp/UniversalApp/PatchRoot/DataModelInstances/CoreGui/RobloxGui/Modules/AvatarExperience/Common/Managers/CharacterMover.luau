local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Managers.PPECameraManager);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Managers.CameraManager);
local v10 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0);
local function _(v11, v12) --[[ Line: 28 ]] --[[ Name: minAbs ]]
    if math.abs(v11) < math.abs(v12) then
        return v11;
    else
        return v12;
    end;
end;
local function _(v14) --[[ Line: 39 ]] --[[ Name: minDeltaAngle ]]
    return (v14 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
end;
local v16 = {};
v16.__index = v16;
local function _(v17) --[[ Line: 47 ]] --[[ Name: normalizeAngle ]]
    return (v17 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
end;
v16.resetRotation = function(v19, v20) --[[ Line: 51 ]] --[[ Name: resetRotation ]]
    local l_CurrentCharacter_0 = v19.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return;
    else
        local v22 = true;
        if v20 then
            v22 = false;
        end;
        local v23, v24, _ = l_CurrentCharacter_0.HumanoidRootPart.CFrame:ToOrientation();
        local v26 = (v24 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
        local v27 = (v23 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
        v19:rotateByRadians(-(v26 + 1.5707963267948966), -v27, v22);
        return;
    end;
end;
v16.cancelCurrentTween = function(v28) --[[ Line: 77 ]] --[[ Name: cancelCurrentTween ]]
    if v28.currentTween then
        v28.currentTween:Cancel();
        v28.currentTween = nil;
    end;
end;
v16.rotateByRadiansPreservingY = function(v29, v30, v31, v32) --[[ Line: 84 ]] --[[ Name: rotateByRadiansPreservingY ]]
    -- upvalues: v10 (copy), l_TweenService_0 (copy)
    v30 = v30 or 0;
    v31 = v31 or 0;
    local l_CurrentCharacter_1 = v29.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_1 then
        return;
    else
        local l_HumanoidRootPart_0 = l_CurrentCharacter_1.HumanoidRootPart;
        if not l_HumanoidRootPart_0 then
            return;
        else
            local v35, v36, _ = l_HumanoidRootPart_0.CFrame:ToEulerAnglesYXZ();
            local v38 = (v36 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
            local v39 = (v35 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
            local v40 = Vector2.new((v38 + v30 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793, (v39 + v31 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793);
            if not v29.angleTweenValues then
                v29.angleTweenValues = Instance.new("NumberValue");
            end;
            v29.angleTweenValues.Value = v38;
            if math.abs(v38 - v40.X) < 0.001 then
                v32 = false;
            end;
            if v32 then
                v29.yAngularVelocity = 0;
                v29:cancelCurrentTween();
                local l_v10_0 = v10;
                local v42 = {
                    Value = v40.X
                };
                local v43 = l_TweenService_0:Create(v29.angleTweenValues, l_v10_0, v42);
                v29.currentTween = v43;
                v43:Play();
                task.spawn(function() --[[ Line: 133 ]]
                    -- upvalues: v43 (copy), l_HumanoidRootPart_0 (copy), v29 (copy), v39 (copy)
                    while true do
                        if v43.PlaybackState == Enum.PlaybackState.Playing then
                            if not l_HumanoidRootPart_0 or not l_HumanoidRootPart_0.Parent then
                                return;
                            else
                                local l_Value_0 = v29.angleTweenValues.Value;
                                local v45 = CFrame.fromEulerAnglesYXZ(v39, l_Value_0, 0);
                                l_HumanoidRootPart_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position) * v45;
                                task.wait();
                            end;
                        else
                            return;
                        end;
                    end;
                end);
            else
                l_HumanoidRootPart_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position.X, l_HumanoidRootPart_0.Position.Y, l_HumanoidRootPart_0.Position.Z) * CFrame.fromEulerAnglesYXZ(v39, v40.X, 0);
            end;
            if v29.cameraManager and v29.cameraManager:boundPanOffset() and not v29.cameraManager.isTweening then
                v29.cameraManager:handleCameraChange(true);
            end;
            return;
        end;
    end;
end;
v16.rotateByRadians = function(v46, v47, v48, v49) --[[ Line: 170 ]] --[[ Name: rotateByRadians ]]
    v46:rotateByRadiansPreservingY(v47, v48, v49);
end;
v16.rotateByPixels = function(v50, v51) --[[ Line: 174 ]] --[[ Name: rotateByPixels ]]
    if v50.cameraManager then
        v50:rotateByRadians(v50.cameraManager:pixelOffsetToPositionOffset(Vector2.new(v51, 0)).X * 0.436);
    end;
end;
v16.setAngularVelocityByPixels = function(v52, v53) --[[ Line: 181 ]] --[[ Name: setAngularVelocityByPixels ]]
    -- upvalues: l_RunService_0 (copy)
    if v52.cameraManager then
        v52.yAngularVelocity = math.clamp(v52.cameraManager:pixelOffsetToPositionOffset(Vector2.new(v53, 0)).X * 0.436, -14.835298641951802, 14.835298641951802);
        if v52.yAngularVelocity ~= 0 and not v52.renderSteppedConnection then
            v52.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(...) --[[ Line: 188 ]]
                -- upvalues: v52 (copy)
                v52:onRenderStepped(...);
            end);
        end;
    end;
end;
v16.onRenderStepped = function(v54, v55) --[[ Line: 195 ]] --[[ Name: onRenderStepped ]]
    local v56 = v55 * v54.yAngularVelocity;
    v54.yAngularVelocity = v54.yAngularVelocity * math.pow(0.010000000000000009, v55);
    if math.abs(v54.yAngularVelocity) < 1.0E-4 then
        v54.yAngularVelocity = 0;
    end;
    local v57 = ((v54.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation and -1.0471975511965976 or 0) - v54.angleOffset.X + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
    local v58 = math.sign(v57);
    local v59 = 2.0943951023931953 * v55 * v58;
    local v60 = if math.abs(v57) < math.abs(v59) then v57 else v59;
    if v60 ~= 0 or v56 ~= 0 then
        v54:rotateByRadians(v56, v60);
    end;
    if v54.yAngularVelocity == 0 and math.abs(v57) < 1.0E-4 then
        v54.renderSteppedConnection:Disconnect();
        v54.renderSteppedConnection = nil;
    end;
end;
v16.update = function(v61, v62, v63, v64, v65, _) --[[ Line: 225 ]] --[[ Name: update ]]
    -- upvalues: l_RunService_0 (copy), v6 (copy)
    if v62.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation ~= v63.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation and not v61.renderSteppedConnection then
        v61.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(...) --[[ Line: 230 ]]
            -- upvalues: v61 (copy)
            v61:onRenderStepped(...);
        end);
    end;
    if v6.getCategoryInfoFromState(v62, v64) ~= v6.getCategoryInfoFromState(v63, v65) then
        v61:resetRotation();
    end;
end;
v16.updateState = function(v67, v68, v69) --[[ Line: 243 ]] --[[ Name: updateState ]]
    local l_avatarRoute_0 = v67.avatarRoute;
    v67:update(v68, v69, l_avatarRoute_0, l_avatarRoute_0);
end;
v16.updateAvatarRoute = function(v71, v72, v73) --[[ Line: 248 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: v8 (copy)
    if v71.ppeCameraManager or v71.cameraManager then
        v71.ppeCameraManager:updateAvatarRoute(v72, v73);
        v71.cameraManager:updateAvatarRoute(v72, v73);
        local v74 = v8.isPPEScreenUsingPeekabooWidget(v72.opaque.name);
        local v75 = v8.isPPEScreenUsingPeekabooWidget(v73.opaque.name);
        if v74 and not v75 then
            v71:resetRotation(true);
            v71.cameraManager:stop();
            v71.ppeCameraManager:start();
        elseif not v74 and v75 then
            v71.cameraManager:start();
            v71.ppeCameraManager:stop();
        end;
    end;
    v71.avatarRoute = v72;
    local v76 = v71.store:getState();
    v71:update(v76, v76, v72, v73);
end;
v16.updateCategorySelection = function(v77) --[[ Line: 277 ]] --[[ Name: updateCategorySelection ]]
    local v78 = v77.store:getState();
    v77:update(v78, v78, v77.avatarRoute, v77.avatarRoute);
end;
v16.onPPEPoseChanged = function(v79) --[[ Line: 283 ]] --[[ Name: onPPEPoseChanged ]]
    if v79.ppeCameraManager then
        v79.ppeCameraManager:onPPEPoseChanged();
    end;
end;
v16.new = function(v80, v81, v82, v83, v84) --[[ Line: 289 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v9 (copy), v7 (copy)
    local v85 = {};
    setmetatable(v85, v16);
    v85.cameraManager = nil;
    v85.ppeCameraManager = nil;
    if v84 then
        v85.cameraManager = v9.new(v80, v82, v83);
        v85.ppeCameraManager = v7.new(v80, v82);
    end;
    v85.store = v80;
    v85.avatarExperienceAnalytics = v81;
    v85.avatarRoute = v82;
    v85.events = v83;
    v85.bulkConnections = {};
    v85.camera = game.Workspace.CurrentCamera;
    v85.initialAngles = nil;
    v85.angleOffset = Vector2.new();
    v85.yAngularVelocity = 0;
    v85.currentTween = nil;
    return v85;
end;
v16.shouldUsePPECameraManager = function(v86) --[[ Line: 317 ]] --[[ Name: shouldUsePPECameraManager ]]
    -- upvalues: v6 (copy)
    return v6.routeIsPPEStaticImagePage(v86.avatarRoute);
end;
v16.start = function(v87) --[[ Line: 321 ]] --[[ Name: start ]]
    if v87:shouldUsePPECameraManager() then
        if v87.ppeCameraManager then
            v87.ppeCameraManager:start();
        end;
    elseif v87.cameraManager then
        v87.cameraManager:start();
    end;
    table.insert(v87.bulkConnections, v87.store.changed:connect(function(...) --[[ Line: 334 ]]
        -- upvalues: v87 (copy)
        v87:updateState(...);
    end));
    table.insert(v87.bulkConnections, v87.events.rotateByRadians:Connect(function(...) --[[ Line: 341 ]]
        -- upvalues: v87 (copy)
        v87:rotateByRadians(...);
    end));
    table.insert(v87.bulkConnections, v87.events.rotateByPixels:Connect(function(...) --[[ Line: 347 ]]
        -- upvalues: v87 (copy)
        v87:rotateByPixels(...);
    end));
    table.insert(v87.bulkConnections, v87.events.setAngularVelocityByPixels:Connect(function(...) --[[ Line: 353 ]]
        -- upvalues: v87 (copy)
        v87:setAngularVelocityByPixels(...);
    end));
    v87:resetRotation();
end;
v16.stop = function(v88) --[[ Line: 361 ]] --[[ Name: stop ]]
    for _, v90 in v88.bulkConnections do
        v90:disconnect();
    end;
    v88.bulkConnections = {};
    if v88.renderSteppedConnection then
        v88.renderSteppedConnection:Disconnect();
        v88.renderSteppedConnection = nil;
    end;
    if v88.cameraManager then
        v88.cameraManager:stop();
    end;
    if v88.ppeCameraManager then
        v88.ppeCameraManager:stop();
    end;
    v88:cancelCurrentTween();
end;
v16.onDestroy = function(v91) --[[ Line: 381 ]] --[[ Name: onDestroy ]]
    if v91.cameraManager then
        v91.cameraManager:onDestroy();
    end;
end;
return v16;