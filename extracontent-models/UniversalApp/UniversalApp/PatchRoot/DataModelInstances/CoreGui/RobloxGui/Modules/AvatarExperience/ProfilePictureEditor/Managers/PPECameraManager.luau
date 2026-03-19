local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.Otter);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local v12 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v14 = {
    frequency = 1 / v5.FullscreenTweenTimeSeconds, 
    dampingRatio = 1
};
local v15 = {};
v15.__index = v15;
v15.new = function(v16, v17) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v18 = {};
    setmetatable(v18, v15);
    v18.started = false;
    v18.store = v16;
    v18.avatarRoute = v17;
    v18.updateConnection = nil;
    v18.camera = game.Workspace.CurrentCamera;
    v18.toFullscreenFraction = 0;
    v18.prevShowFullBodyPicture = v18:_showFullBodyPicture();
    v18.prevPage = v18.avatarRoute.opaque.name;
    return v18;
end;
v15._calculateCameraDetails = function(v19, _) --[[ Line: 61 ]] --[[ Name: _calculateCameraDetails ]]
    -- upvalues: v5 (copy), v12 (copy)
    local v21 = math.rad(v5.CameraFieldOfViewDeg);
    local v22 = v19.screenHeightPix / 2 / math.tan(v21 / 2);
    v19.pixToCamera = v22;
    v19.focusAngleAboveCenterRad = math.atan2(v19.screenHeightPix / 2 - (v19.topYPix + v19.viewportSizePix / 2), v22);
    local v23 = v19.screenHeightPix / 2 - v19.topYPix;
    local v24 = v23 - v19.viewportSizePix;
    v19.fieldOfViewForDistanceScale = math.deg(math.atan2(v23, v22) - math.atan2(v24, v22));
    v19.store:dispatch(v12(v19.fieldOfViewForDistanceScale));
end;
v15._handleCameraChange = function(v25) --[[ Line: 82 ]] --[[ Name: _handleCameraChange ]]
    -- upvalues: l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v7 (copy), l_CameraUtility_0 (copy), v3 (copy), v14 (copy)
    v25.showFullBodyPicture = v25:_showFullBodyPicture();
    if v25.prevShowFullBodyPicture ~= v25.showFullBodyPicture then
        v25.prevFieldOfViewForDistanceScale = v25.fieldOfViewForDistanceScale;
        v25.prevXRotDeg = v25.xRotDeg;
        v25.prevYRotDeg = v25.yRotDeg;
        v25.prevCameraDistanceScale = v25.cameraDistanceScale;
        v25.prevTargetCFrame = v25.targetCFrame;
        v25.prevMinExtent = v25.minExtent;
        v25.prevMaxExtent = v25.maxExtent;
        v25.prevExtentScale = v25.extentScale;
        v25.prevCameraCFrame = v25.camera.CFrame;
    end;
    local v26 = v25.store:getState();
    v25.finalPageViewMode = v26.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
    v25.characterModelVersion = v26.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
    v25.lastSuccessfulPoseEmoteAssetId = v26.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
    local l_CurrentCharacter_0 = v26.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return;
    else
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if not l_Head_0 then
            return;
        else
            local l_name_0 = v25.avatarRoute.opaque.name;
            local v30 = v26.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[l_name_0];
            if not v30 then
                return;
            else
                v25.screenHeightPix = v30.screenHeightPix;
                v25.topYPix = v30.topYPix;
                v25.viewportSizePix = v30.viewportSizePix;
                v25:_calculateCameraDetails(l_CurrentCharacter_0);
                if not v25.focusAngleAboveCenterRad then
                    return;
                else
                    if v25.showFullBodyPicture then
                        local v31 = l_CFrameUtility_0.CalculateTargetCFrame(l_Head_0.CFrame);
                        v25.targetCFrame = v31 - v31.Position + l_CurrentCharacter_0:GetPrimaryPartCFrame().Position;
                        local v32, v33 = l_CharacterUtility_0.CalculateModelExtents(l_CurrentCharacter_0, v25.targetCFrame);
                        v25.minExtent = v32;
                        v25.maxExtent = v33;
                    else
                        v25.targetCFrame = l_CFrameUtility_0.CalculateTargetCFrame(l_Head_0.CFrame);
                        local v34, v35 = l_CharacterUtility_0.CalculateHeadExtents(l_CurrentCharacter_0, v25.targetCFrame);
                        v25.minExtent = v34;
                        v25.maxExtent = v35;
                    end;
                    local l_CameraSliders_0 = v26.AvatarExperience.ProfilePictureEditor.CameraSliders;
                    v25.yRotDeg = 0;
                    v25.xRotDeg = 0;
                    v25.cameraDistanceScale = 1;
                    if l_CameraSliders_0 then
                        v25.zoomSliderValue = l_CameraSliders_0.zoomSliderValue;
                        v25.rotateSliderValue = l_CameraSliders_0.rotateSliderValue;
                        v25.yRotDeg = v7.getYRotDegFromSliderValue(v25.rotateSliderValue);
                        if v25.showFullBodyPicture then
                            v25.xRotDeg = l_CameraUtility_0.XRotForFullBody;
                            v25.cameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody;
                        else
                            v25.cameraDistanceScale = v7.getCameraDistanceScaleFromSliderValue(v25.zoomSliderValue);
                        end;
                    end;
                    v25.extentScale = v25.showFullBodyPicture and l_CameraUtility_0.DefaultBodyMarginScale or l_CameraUtility_0.DefaultHeadMarginScale;
                    if v25.prevPage ~= v25.avatarRoute.opaque.name then
                        v25.prevShowFullBodyPicture = false;
                        v25.prevPage = v25.avatarRoute.opaque.name;
                        v25.fullscreenTweenMotor:stop();
                        v25.toFullscreenFraction = 0;
                    elseif v25.prevShowFullBodyPicture ~= v25.showFullBodyPicture then
                        local v37 = v25.showFullBodyPicture and 1 or 0;
                        v25.prevShowFullBodyPicture = v25.showFullBodyPicture;
                        v25.fullscreenTweenMotor:stop();
                        v25.fullscreenTweenMotor:setGoal(v3.spring(v37, v14));
                        v25.fullscreenTweenMotor:start();
                    end;
                    v25:onUpdateFullscreenFraction();
                    return;
                end;
            end;
        end;
    end;
end;
local function _(v38, v39, v40) --[[ Line: 188 ]] --[[ Name: scaleBetween ]]
    if not v40 then
        return v39;
    else
        return v39 * (1 - v38) + v40 * v38;
    end;
end;
local function _(v42, v43, v44) --[[ Line: 195 ]] --[[ Name: scaleCFrameBetween ]]
    if not v44 then
        return v43;
    else
        return v43:Lerp(v44, v42);
    end;
end;
v15.onUpdateFullscreenFraction = function(v46) --[[ Line: 202 ]] --[[ Name: onUpdateFullscreenFraction ]]
    -- upvalues: l_CameraUtility_0 (copy), l_getSafeAreaSize_0 (copy)
    local v47 = math.abs((v46.showFullBodyPicture and 1 or 0) - v46.toFullscreenFraction);
    local v48 = {};
    local l_fieldOfViewForDistanceScale_0 = v46.fieldOfViewForDistanceScale;
    local l_prevFieldOfViewForDistanceScale_0 = v46.prevFieldOfViewForDistanceScale;
    v48.optFieldOfViewForDistanceScale = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.xRotDeg;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevXRotDeg;
    v48.optCameraXRot = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.yRotDeg;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevYRotDeg;
    v48.optCameraYRot = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.cameraDistanceScale;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevCameraDistanceScale;
    v48.optCameraDistanceScale = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.targetCFrame;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevTargetCFrame;
    v48.targetCFrame = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0:Lerp(l_prevFieldOfViewForDistanceScale_0, v47);
    l_fieldOfViewForDistanceScale_0 = v46.minExtent;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevMinExtent;
    v48.minExtent = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.maxExtent;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevMaxExtent;
    v48.maxExtent = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_fieldOfViewForDistanceScale_0 = v46.extentScale;
    l_prevFieldOfViewForDistanceScale_0 = v46.prevExtentScale;
    v48.extentScale = if not l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 else l_fieldOfViewForDistanceScale_0 * (1 - v47) + l_prevFieldOfViewForDistanceScale_0 * v47;
    l_CameraUtility_0.SetupCamera(v46.camera, v48);
    local v51 = CFrame.fromEulerAnglesXYZ(-v46.focusAngleAboveCenterRad, 0, 0);
    l_fieldOfViewForDistanceScale_0 = v46.camera.CFrame * v51;
    l_prevFieldOfViewForDistanceScale_0 = v46.store:getState().GlobalGuiInset;
    local l_ScreenSize_0 = v46.store:getState().ScreenSize;
    local v53 = l_getSafeAreaSize_0(l_ScreenSize_0, l_prevFieldOfViewForDistanceScale_0);
    local v54 = l_ScreenSize_0.X - v53.X.Offset;
    if v54 > 0 then
        local v55 = (l_fieldOfViewForDistanceScale_0.Position - v48.targetCFrame.Position).Magnitude * v54 / (2 * v46.pixToCamera);
        local v56 = -l_fieldOfViewForDistanceScale_0.RightVector * v55;
        l_fieldOfViewForDistanceScale_0 = CFrame.new(v56.X, v56.Y, v56.Z) * l_fieldOfViewForDistanceScale_0;
    end;
    local l_camera_0 = v46.camera;
    local l_l_fieldOfViewForDistanceScale_0_0 = l_fieldOfViewForDistanceScale_0;
    local l_prevCameraCFrame_0 = v46.prevCameraCFrame;
    l_camera_0.CFrame = if not l_prevCameraCFrame_0 then l_l_fieldOfViewForDistanceScale_0_0 else l_l_fieldOfViewForDistanceScale_0_0:Lerp(l_prevCameraCFrame_0, v47);
end;
v15._peekabooLayoutDetailsChanged = function(v60, v61) --[[ Line: 245 ]] --[[ Name: _peekabooLayoutDetailsChanged ]]
    local l_name_1 = v60.avatarRoute.opaque.name;
    local v63 = v61.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[l_name_1];
    if not v63 then
        return false;
    else
        local v64 = true;
        if v60.screenHeightPix == v63.screenHeightPix then
            v64 = true;
            if v60.topYPix == v63.topYPix then
                v64 = v60.viewportSizePix ~= v63.viewportSizePix;
            end;
        end;
        return v64;
    end;
end;
v15._cameraSliderDetailsChanged = function(v65, v66) --[[ Line: 257 ]] --[[ Name: _cameraSliderDetailsChanged ]]
    local l_CameraSliders_1 = v66.AvatarExperience.ProfilePictureEditor.CameraSliders;
    local v68 = true;
    if v65.zoomSliderValue == l_CameraSliders_1.zoomSliderValue then
        v68 = v65.rotateSliderValue ~= l_CameraSliders_1.rotateSliderValue;
    end;
    return v68;
end;
v15._finalPageViewModeChanged = function(v69, v70) --[[ Line: 263 ]] --[[ Name: _finalPageViewModeChanged ]]
    return v70.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v69.finalPageViewMode;
end;
v15._lastSuccessfulPoseEmoteAssetIdChanged = function(v71, v72) --[[ Line: 268 ]] --[[ Name: _lastSuccessfulPoseEmoteAssetIdChanged ]]
    return v72.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= v71.lastSuccessfulPoseEmoteAssetId;
end;
v15._characterModelVersionChanged = function(v73, v74) --[[ Line: 281 ]] --[[ Name: _characterModelVersionChanged ]]
    return v74.AvatarExperience.AvatarScene.Character.CharacterModelVersion ~= v73.characterModelVersion;
end;
v15._update = function(v75, v76) --[[ Line: 286 ]] --[[ Name: _update ]]
    if v75:_peekabooLayoutDetailsChanged(v76) or v75:_cameraSliderDetailsChanged(v76) or v75:_characterModelVersionChanged(v76) or v75:_finalPageViewModeChanged(v76) or v75:_lastSuccessfulPoseEmoteAssetIdChanged(v76) then
        v75:_handleCameraChange();
    end;
end;
v15._updateState = function(v77, v78, _) --[[ Line: 298 ]] --[[ Name: _updateState ]]
    v77:_update(v78);
end;
v15._showFullBodyPicture = function(v80) --[[ Line: 302 ]] --[[ Name: _showFullBodyPicture ]]
    -- upvalues: v6 (copy), l_AvatarScreen_0 (copy)
    if v80.store:getState().AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v6.FullBody and v80.avatarRoute.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal then
        return true;
    else
        return false;
    end;
end;
v15.updateAvatarRoute = function(v81, v82, _) --[[ Line: 314 ]] --[[ Name: updateAvatarRoute ]]
    v81.avatarRoute = v82;
    if v81.started then
        v81:_update((v81.store:getState()));
    end;
end;
v15.watchCharacterToAdjustCamera = function(v84, v85) --[[ Line: 322 ]] --[[ Name: watchCharacterToAdjustCamera ]]
    -- upvalues: l_RunService_0 (copy)
    if v85 then
        v84.watchCharacterToolConnection = v85.DescendantAdded:Connect(function(v86) --[[ Line: 328 ]]
            -- upvalues: l_RunService_0 (ref), v84 (copy)
            if v86:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v84:_handleCameraChange();
            end;
        end);
    end;
end;
v15.onPPEPoseChanged = function(v87) --[[ Line: 337 ]] --[[ Name: onPPEPoseChanged ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0.Heartbeat:Wait();
    v87:_handleCameraChange();
end;
v15.stopWatchingCharacter = function(v88) --[[ Line: 342 ]] --[[ Name: stopWatchingCharacter ]]
    if v88.watchCharacterToolConnection then
        v88.watchCharacterToolConnection:Disconnect();
        v88.watchCharacterToolConnection = nil;
    end;
end;
v15.start = function(v89) --[[ Line: 349 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy), v5 (copy)
    if v89.started then
        return;
    else
        v89.started = true;
        local v90 = v89.store:getState();
        v89.fullscreenTweenMotor = v3.createSingleMotor(0);
        v89.fullscreenTweenMotor:onStep(function(v91) --[[ Line: 358 ]]
            -- upvalues: v89 (copy)
            v89.toFullscreenFraction = v91;
            v89:onUpdateFullscreenFraction();
        end);
        v89.updateConnection = v89.store.changed:connect(function(...) --[[ Line: 363 ]]
            -- upvalues: v89 (copy)
            v89:_updateState(...);
        end);
        v89.camera.CameraType = Enum.CameraType.Scriptable;
        v89.camera.FieldOfView = v5.CameraFieldOfViewDeg;
        local l_CurrentCharacter_1 = v90.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        if l_CurrentCharacter_1 then
            v89:_handleCameraChange();
            v89:watchCharacterToAdjustCamera(l_CurrentCharacter_1);
        end;
        return;
    end;
end;
v15.stop = function(v93) --[[ Line: 381 ]] --[[ Name: stop ]]
    if not v93.started then
        return;
    else
        v93.started = false;
        v93:stopWatchingCharacter();
        if v93.fullscreenTweenMotor then
            v93.fullscreenTweenMotor:destroy();
            v93.fullscreenTweenMotor = nil;
        end;
        if v93.updateConnection then
            v93.updateConnection:disconnect();
            v93.updateConnection = nil;
        end;
        return;
    end;
end;
v15.onDestroy = function(_) --[[ Line: 400 ]] --[[ Name: onDestroy ]]

end;
return v15;