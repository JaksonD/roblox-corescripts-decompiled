local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.mutedError);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_HardwareSafeAreaInsets_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).HardwareSafeAreaInsets;
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetAXCameraManagerErrorsEnabled);
local v14 = game:DefineFastFlag("AXFixCameraManagerInitialization", false);
local v15 = game:DefineFastFlag("AXFixCameraManagerBoundingBox", false);
local l_FFlagAXIncreaseDefaultPeekViewHeight_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v19 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0);
local v20 = CFrame.new(Vector3.new(-3, 2.5, 1.5, 0), (Vector3.new(-2, 2.5, 1.5, 0)));
local v21 = {
    [l_DeviceOrientationMode_0.Portrait] = {
        cameraCenterScreenPosition = UDim2.new(0, 0, -0.5, l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 25 or 40), 
        baseCameraOrigin = Vector3.new(19.243398666381836, 0, 0.5942659974098206, 0), 
        landingPageCameraCenterScreenPosition = UDim2.new(0, 0, -0.4, 40), 
        landingPageZoomToFocusHeightRatio = 6.188, 
        landingPageZoomAdjustmentForFocusPart = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 1 or nil, 
        zoomToFocusHeightRatio = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 9.7 or 8.704, 
        zoomAdjustmentForFocusPart = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 1.2 or nil, 
        fullViewZoomToFocusHeightRatio = 4.5, 
        defaultVerticalFocusScale = 0.4, 
        minZoomRadius = 5, 
        maxZoomRadius = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 35 or 30
    }, 
    [l_DeviceOrientationMode_0.Landscape] = {
        cameraCenterScreenPosition = UDim2.new(v10.LandscapeNavWidth, 0, 0, l_FFlagAXRootSlotBasedEditorFlag_0 and -30 or 10), 
        baseCameraOrigin = Vector3.new(9.243398666381836, 0, 0.5942659974098206, 0), 
        zoomToFocusHeightRatio = 3.84, 
        zoomAdjustmentForFocusPart = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 1 or nil, 
        landingPageZoomAdjustmentForFocusPart = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 1 or nil, 
        fullViewZoomToFocusHeightRatio = 3.6, 
        defaultVerticalFocusScale = 0.5, 
        minZoomRadius = 3, 
        maxZoomRadius = 20
    }
};
local function _(v22, v23) --[[ Line: 91 ]] --[[ Name: adjustCameraCenterPosition ]]
    return v22 - UDim2.new(0, 0, 0, 64 - v23);
end;
local function _(v25) --[[ Line: 95 ]] --[[ Name: isTryingOnAnimationBundle ]]
    -- upvalues: v10 (copy)
    local v26 = v25.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if v26.isUnequipped then
        return false;
    else
        return v10.BundleTypeIdStrings.Animations == v26.itemSubType;
    end;
end;
local function v35(v28, v29) --[[ Line: 105 ]] --[[ Name: calculateFocusPointOfCharacterParts ]]
    -- upvalues: v10 (copy), v9 (copy)
    local v30 = #v29;
    if v30 == 0 then
        return v10.DefaultRigPosition;
    else
        local v31 = Vector3.new();
        for _, v33 in v29 do
            if v33.Attachment then
                local v34 = v9.getAttachmentCFrame(v28, v33.Part, v33.Attachment);
                if v34 == nil then
                    v34 = v9.getPartCFrame(v28, v33.Part);
                end;
                v31 = v31 + v34.Position;
            else
                v31 = v31 + v9.getPartCFrame(v28, v33.Part).Position;
            end;
        end;
        return v31 / v30;
    end;
end;
local v43 = l_memoize_0(function(v36) --[[ Line: 131 ]]
    local v37 = " equippedAssets=";
    local v38 = {};
    for _, v40 in v36 do
        for v41, _ in v40 do
            table.insert(v38, v41);
        end;
    end;
    return v37 .. table.concat(v38, ", ");
end);
local function v60(v44, v45, v46) --[[ Line: 143 ]] --[[ Name: calculateModel2DBoundingSizeRelativeToCFrame ]]
    -- upvalues: v9 (copy), v13 (copy), v43 (copy), v8 (copy), v20 (copy)
    local l_v44_BoundingBox_0, v48 = v44:GetBoundingBox();
    if not v9.isBoundingBoxVectorSane(v48) then
        if v13() then
            local v49 = v43(v46);
            v8("(Avatar Experience) size = " .. v48.X .. ", " .. v48.Y .. ", " .. v48.Z .. v49);
        end;
        v48 = Vector3.new(4, 6, 2, 0);
    end;
    if not v9.isBoundingBoxCFrameSane(l_v44_BoundingBox_0) then
        if v13() then
            local v50 = v43(v46);
            v8("(Avatar Experience) orientation = " .. l_v44_BoundingBox_0.X .. ", " .. l_v44_BoundingBox_0.Y .. ", " .. l_v44_BoundingBox_0.Z .. v50);
        end;
        l_v44_BoundingBox_0 = v20;
    end;
    if v13() and not v9.isBoundingBoxCFrameSane(v45) then
        local v51 = v43(v46);
        v8("(Avatar Experience) cframe = " .. v45.X .. ", " .. v45.Y .. ", " .. v45.Z .. v51);
    end;
    local v52 = v48 / 2;
    local v53 = {
        Vector3.new(-v52.X, -v52.Y, -v52.Z), 
        Vector3.new(v52.X, -v52.Y, -v52.Z), 
        Vector3.new(v52.X, v52.Y, -v52.Z), 
        Vector3.new(-v52.X, v52.Y, -v52.Z), 
        Vector3.new(-v52.X, -v52.Y, v52.Z), 
        Vector3.new(v52.X, -v52.Y, v52.Z), 
        Vector3.new(v52.X, v52.Y, v52.Z), 
        (Vector3.new(-v52.X, v52.Y, v52.Z))
    };
    local v54 = 1e999;
    local v55 = 1e999;
    local v56 = -1e999;
    local v57 = -1e999;
    for v58 = 1, #v53 do
        local v59 = v45:PointToObjectSpace(l_v44_BoundingBox_0:PointToWorldSpace(v53[v58]));
        v54 = math.min(v54, v59.X);
        v55 = math.min(v55, v59.Y);
        v56 = math.max(v56, v59.X);
        v57 = math.max(v57, v59.Y);
        if v13() then
            if v56 < v54 then
                v8("(Avatar Experience) maxX = " .. v56 .. ", minX = " .. v54);
            end;
            if v57 < v55 then
                v8("(Avatar Experience) maxY = " .. v57 .. ", minY = " .. v55);
            end;
        end;
    end;
    return Vector2.new(v56 - v54, v57 - v55);
end;
local function _(v61) --[[ Line: 231 ]] --[[ Name: hasInteractionEvents ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    if v61 == l_AvatarScreen_0.AvatarExperienceLandingPage or v9.isAvatarBackground(v61) then
        return false;
    else
        return true;
    end;
end;
local v63 = {};
v63.__index = v63;
v63.calculateFocusPoint = function(v64) --[[ Line: 243 ]] --[[ Name: calculateFocusPoint ]]
    -- upvalues: v9 (copy), v10 (copy), v35 (copy), v21 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local v65 = v64.store:getState();
    local v66 = v64:useCenteredSceneView(v65, v64.avatarRoute);
    local v67 = v9.getCategoryInfoFromState(v65, v64.avatarRoute);
    local l_AvatarType_0 = v65.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_CurrentCharacter_0 = v65.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_DeviceOrientation_0 = v65.DeviceOrientation;
    local v71 = v10.AvatarTypeFocusGroups[l_AvatarType_0][v67.CameraFocus];
    local _ = nil;
    if v71 and not v66 then
        return (v35(l_CurrentCharacter_0, v71));
    else
        local v73 = v35(l_CurrentCharacter_0, {
            {
                Part = "HumanoidRootPart"
            }
        });
        local l_Y_0 = (l_CurrentCharacter_0:GetExtentsSize() * v21[l_DeviceOrientation_0].defaultVerticalFocusScale).Y;
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if l_Head_0 then
            l_Y_0 = if l_FFlagAXCustomizeMakeupSupport_0 and v67.CameraFocus == v10.PartName.Makeup then l_Head_0.Position.Y else math.min(l_Head_0.Position.Y, l_Y_0);
        end;
        return (Vector3.new(v73.X, l_Y_0, v73.Z));
    end;
end;
v63.calculateBaseZoomRadius = function(v76, v77) --[[ Line: 278 ]] --[[ Name: calculateBaseZoomRadius ]]
    -- upvalues: v21 (copy), v9 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_FFlagAXIncreaseDefaultPeekViewHeight_0 (copy)
    local v78 = v76.store:getState();
    local v79 = v76:useCenteredSceneView(v78, v76.avatarRoute);
    local v80 = nil;
    local l_DeviceOrientation_1 = v78.DeviceOrientation;
    if v79 then
        return (v78.AvatarExperience.AvatarScene.Character.CurrentCharacter:GetExtentsSize() * 0.5).Y * v21[l_DeviceOrientation_1].fullViewZoomToFocusHeightRatio;
    else
        local l_name_0 = v76.avatarRoute.current.name;
        local v83 = v9.getCategoryInfoFromState(v78, v76.avatarRoute);
        local l_AvatarType_1 = v78.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v85 = l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage;
        local v86 = v10.AvatarTypeFocusGroups[l_AvatarType_1][v83.CameraFocus] or nil;
        local v87 = v78.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
        v80 = if not v87.isUnequipped and v10.BundleTypeIdStrings.Animations == v87.itemSubType then v10.AnimationCategoryCameraZoomRadius else v83.CameraZoomRadius or 0;
        if not v86 then
            local v88 = v85 and v21[l_DeviceOrientation_1].landingPageZoomToFocusHeightRatio or v21[l_DeviceOrientation_1].zoomToFocusHeightRatio;
            v80 = v80 + v77.Y * v88;
        end;
        if l_FFlagAXIncreaseDefaultPeekViewHeight_0 and v86 then
            local l_zoomAdjustmentForFocusPart_0 = v21[l_DeviceOrientation_1].zoomAdjustmentForFocusPart;
            if v85 then
                l_zoomAdjustmentForFocusPart_0 = v21[l_DeviceOrientation_1].landingPageZoomAdjustmentForFocusPart;
            end;
            v80 = v80 * l_zoomAdjustmentForFocusPart_0;
        end;
        return v80;
    end;
end;
v63.calculateZoomRadius = function(v90) --[[ Line: 330 ]] --[[ Name: calculateZoomRadius ]]
    return v90.cachedBaseZoomRadius + v90.zoomOffset;
end;
v63.calculateCameraOrigin = function(v91, v92, v93) --[[ Line: 334 ]] --[[ Name: calculateCameraOrigin ]]
    -- upvalues: v21 (copy)
    local v94 = v21[v91.store:getState().DeviceOrientation].baseCameraOrigin - v92;
    return v92 + Vector3.new(v94.x, 0, v94.z).Unit * v93;
end;
v63.calculateHalfFieldsOfView = function(v95) --[[ Line: 347 ]] --[[ Name: calculateHalfFieldsOfView ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v96 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v95.camera.ViewportSize;
    local l_X_0 = v96.X;
    local l_Y_1 = v96.Y;
    return math.atan(0.4663076581549986 * l_X_0 / l_Y_1), 0.4363323129985824;
end;
v63.useCenteredSceneView = function(_, v100, v101) --[[ Line: 360 ]] --[[ Name: useCenteredSceneView ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    return v101.opaque.name == l_AvatarScreen_0.TryOnItem or v9.getIsSceneFullViewFromState(v100, v101);
end;
v63.getPeekViewHeight = function(v102) --[[ Line: 368 ]] --[[ Name: getPeekViewHeight ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v102.store:getState().AvatarExperience.Common.ItemDetailsPeekView;
    if l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Brief and l_ItemDetailsPeekView_0.briefViewHeight then
        return l_ItemDetailsPeekView_0.briefViewHeight;
    else
        return 0;
    end;
end;
v63.calculateCameraOffsetAngles = function(v104) --[[ Line: 379 ]] --[[ Name: calculateCameraOffsetAngles ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy), v21 (copy), v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v105 = v104.store:getState();
    if v104:useCenteredSceneView(v105, v104.avatarRoute) then
        return 0, 0;
    else
        local l_DeviceOrientation_2 = v105.DeviceOrientation;
        local l_name_1 = v104.avatarRoute.current.name;
        local v108 = v9.getTopBarHeightAvatarScene(v105);
        local v109 = (l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage and v21[l_DeviceOrientation_2].landingPageCameraCenterScreenPosition or v21[l_DeviceOrientation_2].cameraCenterScreenPosition) - UDim2.new(0, 0, 0, 64 - v108);
        local v110, v111 = v104:calculateHalfFieldsOfView();
        local v112 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v104.camera.ViewportSize;
        local l_X_1 = v112.X;
        local l_Y_2 = v112.Y;
        return math.atan(math.tan(v110) * (v109.X.Scale + 2 * v109.X.Offset / l_X_1)), (math.atan(math.tan(v111) * (v109.Y.Scale + 2 * v109.Y.Offset / l_Y_2)));
    end;
end;
v63.pixelOffsetToPositionOffset = function(v115, v116) --[[ Line: 415 ]] --[[ Name: pixelOffsetToPositionOffset ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v117, v118 = v115:calculateCameraOffsetAngles();
    local v119, v120 = v115:calculateHalfFieldsOfView();
    local l_cachedFocusPoint_0 = v115.cachedFocusPoint;
    local v122 = l_cachedFocusPoint_0 - v115:calculateCameraOrigin(l_cachedFocusPoint_0, (v115:calculateZoomRadius()));
    local v123 = (CFrame.new(Vector3.new(), v122) * CFrame.Angles(v118, v117, 0)):VectorToObjectSpace(v122);
    return v116 / (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v115.camera.ViewportSize) * Vector2.new(math.tan(v119), (math.tan(v120))) * -v123.Z * 2;
end;
v63.tweenCameraIntoPlace = function(v124, v125, v126, v127) --[[ Line: 436 ]] --[[ Name: tweenCameraIntoPlace ]]
    -- upvalues: l_TweenService_0 (copy), v19 (copy)
    local v128, v129 = v124:calculateCameraOffsetAngles();
    local v130 = v126 - v125;
    local v131 = CFrame.new(Vector3.new(), v130) * CFrame.Angles(v129, v128, 0);
    local l_panOffset_0 = v124.panOffset;
    local v133 = v131.LookVector:Cross((Vector3.new(0, 1, 0, 0))).Unit * l_panOffset_0.X + Vector3.new(0, 1, 0, 0) * l_panOffset_0.Y;
    local v134 = CFrame.new(v125 + v133) * v131;
    v124:cancelTween();
    if v127 then
        v124.camera.CFrame = v134;
        return;
    else
        local v135 = {
            CFrame = v134
        };
        v124.isTweening = true;
        local v136 = l_TweenService_0:Create(v124.camera, v19, v135);
        v136.Completed:Connect(function() --[[ Line: 462 ]]
            -- upvalues: v124 (copy)
            v124.isTweening = false;
            v124.tween = nil;
        end);
        v136:Play();
        v124.tween = v136;
        return;
    end;
end;
v63.boundPanOffset = function(v137) --[[ Line: 472 ]] --[[ Name: boundPanOffset ]]
    -- upvalues: v60 (copy), v13 (copy), v8 (copy), v15 (copy)
    local v138 = v137.store:getState();
    local l_CurrentCharacter_1 = v138.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_1 then
        return;
    else
        local _, v141 = v137:calculateHalfFieldsOfView();
        local v142, v143 = v137:calculateCameraOffsetAngles();
        local l_cachedFocusPoint_1 = v137.cachedFocusPoint;
        local v145 = v137:calculateCameraOrigin(l_cachedFocusPoint_1, (v137:calculateZoomRadius()));
        local v146 = l_cachedFocusPoint_1 - v145;
        local v147 = CFrame.new(Vector3.new(), v146) * CFrame.Angles(v143, v142, 0);
        local v148 = CFrame.new(v145) * v147;
        local v149 = -v137.camera.NearPlaneZ;
        local v150 = math.tan(v141) * v149;
        local v151 = math.sqrt(v150 * v150 + v149 * v149);
        local v152 = math.sin(v141 + v143) * v151 - v145.Y + 0.01;
        local l_EquippedAssets_0 = v138.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v154 = v60(l_CurrentCharacter_1, v148, l_EquippedAssets_0) / 2;
        if v13() then
            if v154.X < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.X = " .. v154.X);
            end;
            if v154.Y < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.Y = " .. v154.Y);
            end;
        end;
        if v15 then
            v154 = Vector2.new(math.max(0, v154.X), (math.max(0, v154.Y)));
        end;
        local l_panOffset_1 = v137.panOffset;
        v137.panOffset = Vector3.new(math.clamp(v137.panOffset.X, -v154.X, v154.X), math.clamp(v137.panOffset.Y, math.max(v152, -v154.Y), (math.max(v152, v154.Y))), v137.panOffset.Z);
        return l_panOffset_1 ~= v137.panOffset;
    end;
end;
v63.calculateZoomOffsetBounds = function(v156) --[[ Line: 538 ]] --[[ Name: calculateZoomOffsetBounds ]]
    -- upvalues: v21 (copy)
    local v157 = v21[v156.store:getState().DeviceOrientation];
    local l_cachedBaseZoomRadius_0 = v156.cachedBaseZoomRadius;
    return v157.minZoomRadius - l_cachedBaseZoomRadius_0, v157.maxZoomRadius - l_cachedBaseZoomRadius_0;
end;
v63.boundZoomOffset = function(v159, v160, v161) --[[ Line: 551 ]] --[[ Name: boundZoomOffset ]]
    if not v160 or not v161 then
        local v162, v163 = v159:calculateZoomOffsetBounds();
        v160 = v162;
        v161 = v163;
    end;
    local l_zoomOffset_0 = v159.zoomOffset;
    v159.zoomOffset = math.clamp(v159.zoomOffset, v160, v161);
    return l_zoomOffset_0 ~= v159.zoomOffset;
end;
v63.handleCameraChange = function(v165, v166) --[[ Line: 563 ]] --[[ Name: handleCameraChange ]]
    if not v165.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
        return;
    else
        local l_cachedFocusPoint_2 = v165.cachedFocusPoint;
        v165:tweenCameraIntoPlace(v165:calculateCameraOrigin(l_cachedFocusPoint_2, (v165:calculateZoomRadius())), l_cachedFocusPoint_2, v166);
        return;
    end;
end;
v63.panByDistance = function(v168, v169) --[[ Line: 577 ]] --[[ Name: panByDistance ]]
    v168.panOffset = Vector3.new(v168.panOffset.X + v169.X, v168.panOffset.Y + v169.Y, 0);
    v168:boundPanOffset();
    v168:handleCameraChange(true);
end;
v63.panByPixels = function(v170, v171) --[[ Line: 583 ]] --[[ Name: panByPixels ]]
    v170:panByDistance((v170:pixelOffsetToPositionOffset(v171)));
end;
v63.zoomStraight = function(v172, v173) --[[ Line: 588 ]] --[[ Name: zoomStraight ]]
    v172.zoomOffset = v172.zoomOffset + v173;
    v172:boundZoomOffset();
    v172:handleCameraChange(true);
end;
v63.zoomToPoint = function(v174, v175, v176) --[[ Line: 594 ]] --[[ Name: zoomToPoint ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v177, v178 = v174:calculateCameraOffsetAngles();
    local l_cachedFocusPoint_3 = v174.cachedFocusPoint;
    local v180 = l_cachedFocusPoint_3 - v174:calculateCameraOrigin(l_cachedFocusPoint_3, (v174:calculateZoomRadius()));
    local v181 = CFrame.new(Vector3.new(), v180) * CFrame.Angles(v178, v177, 0);
    local v182 = v181:VectorToObjectSpace(v180);
    local v183 = (v176 - (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v174.camera.ViewportSize) / 2) * Vector2.new(1, -1);
    local v184 = v174:pixelOffsetToPositionOffset(v183);
    local v185 = Vector3.new(v184.X, v184.Y, v182.Z) - v182;
    local v186, v187 = v174:calculateZoomOffsetBounds();
    v174.zoomOffset = v174.zoomOffset + v175;
    v174:boundZoomOffset(v186, v187);
    local v188 = v181:VectorToObjectSpace(l_cachedFocusPoint_3 - v174:calculateCameraOrigin(l_cachedFocusPoint_3, (v174:calculateZoomRadius())));
    local v189 = v174:pixelOffsetToPositionOffset(v183);
    local v190 = Vector3.new(v189.X, v189.Y, v182.Z) - v188;
    v174.panOffset = v174.panOffset + v185 - v190;
    v174:boundPanOffset();
    v174:handleCameraChange(true);
end;
v63.update = function(v191, v192, v193, v194, v195) --[[ Line: 639 ]] --[[ Name: update ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy), v10 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_2 = v194.current.name;
    local l_name_3 = v195.current.name;
    local v198 = l_name_2 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_2) or false);
    local v199 = l_name_3 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_3) or false);
    local v200 = not v198 and v199;
    local v201 = v198 and not v199;
    if v200 then
        if #v191.interactionConnections > 0 then
            v191:disconnectInteractionEvents();
        end;
    elseif v201 and #v191.interactionConnections == 0 then
        v191:connectInteractionEvents();
    end;
    local l_CurrentCharacter_2 = v192.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local v203 = v9.getCategoryInfoFromState(v192, v194);
    if not l_CurrentCharacter_2 or not v203 then
        return;
    else
        local v204 = v191:useCenteredSceneView(v192, v194);
        local v205 = v191:useCenteredSceneView(v193, v195);
        local v206 = v9.getCategoryInfoFromState(v193, v195);
        local l_CharacterModelVersion_0 = v192.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_CharacterModelVersion_1 = v193.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_TryOnCharacterModelVersion_0 = v192.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local l_TryOnCharacterModelVersion_1 = v193.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local v211 = true;
        if l_CharacterModelVersion_0 == l_CharacterModelVersion_1 then
            v211 = l_TryOnCharacterModelVersion_0 ~= l_TryOnCharacterModelVersion_1;
        end;
        local l_CurrentCharacter_3 = v193.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local v213 = v9.getTopBarHeightAvatarScene(v192);
        local v214 = v9.getTopBarHeightAvatarScene(v193);
        local v215 = v192.DeviceOrientation ~= v193.DeviceOrientation;
        local v216 = v192.ScreenSize ~= v193.ScreenSize;
        local v217 = v195.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v218 = v194.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v219 = not v217 and v218;
        local l_AvatarType_2 = v192.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v221 = v10.AvatarTypeFocusGroups[l_AvatarType_2][v203.CameraFocus];
        local v222 = v192.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= v193.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local v223 = true;
        if v204 == v205 then
            v223 = v203 ~= v206;
        end;
        if v223 then
            v191.panOffset = Vector3.new();
            v191.zoomOffset = 0;
        end;
        local v224 = v222 or v223 or l_CurrentCharacter_2 ~= l_CurrentCharacter_3 or not v221 and v211;
        if v224 then
            local l_cachedFocusPoint_4 = v191.cachedFocusPoint;
            v191.cachedFocusPoint = v191:calculateFocusPoint();
            local l_cachedBaseZoomRadius_1 = v191.cachedBaseZoomRadius;
            v191.cachedBaseZoomRadius = v191:calculateBaseZoomRadius(v191.cachedFocusPoint);
            if l_FFlagAXCustomizeMakeupSupport_0 and v203.CameraFocus == v10.PartName.Makeup then
                v191.cachedBaseZoomRadius = v203.CameraZoomRadius;
            end;
            if not v223 then
                if v191.panOffset ~= Vector3.new() then
                    local v227 = v191.cachedFocusPoint - l_cachedFocusPoint_4;
                    v191.panOffset = v191.panOffset - v227;
                end;
                if v191.zoomOffset ~= 0 then
                    local v228 = v191.cachedBaseZoomRadius - l_cachedBaseZoomRadius_1;
                    v191.zoomOffset = v191.zoomOffset - v228;
                end;
            end;
        end;
        if v224 or v215 or v216 or v213 ~= v214 then
            v191:boundPanOffset();
            v191:boundZoomOffset();
            v191:handleCameraChange(v215 or v219);
        end;
        return;
    end;
end;
v63.updateState = function(v229, v230, v231) --[[ Line: 746 ]] --[[ Name: updateState ]]
    local l_avatarRoute_0 = v229.avatarRoute;
    v229:update(v230, v231, l_avatarRoute_0, l_avatarRoute_0);
end;
v63.updateAvatarRoute = function(v233, v234, v235) --[[ Line: 751 ]] --[[ Name: updateAvatarRoute ]]
    v233.avatarRoute = v234;
    if v233.started then
        local v236 = v233.store:getState();
        v233:update(v236, v236, v234, v235);
    end;
end;
v63.updateCategorySelection = function(v237) --[[ Line: 759 ]] --[[ Name: updateCategorySelection ]]
    local v238 = v237.store:getState();
    v237:update(v238, v238, v237.avatarRoute, v237.avatarRoute);
end;
v63.connectInteractionEvents = function(v239) --[[ Line: 765 ]] --[[ Name: connectInteractionEvents ]]
    table.insert(v239.interactionConnections, v239.events.panByDistance:Connect(function(...) --[[ Line: 768 ]]
        -- upvalues: v239 (copy)
        v239:panByDistance(...);
    end));
    table.insert(v239.interactionConnections, v239.events.panByPixels:Connect(function(...) --[[ Line: 774 ]]
        -- upvalues: v239 (copy)
        v239:panByPixels(...);
    end));
    table.insert(v239.interactionConnections, v239.events.zoomStraight:Connect(function(...) --[[ Line: 780 ]]
        -- upvalues: v239 (copy)
        v239:zoomStraight(...);
    end));
    table.insert(v239.interactionConnections, v239.events.zoomToPoint:Connect(function(...) --[[ Line: 786 ]]
        -- upvalues: v239 (copy)
        v239:zoomToPoint(...);
    end));
end;
v63.disconnectInteractionEvents = function(v240) --[[ Line: 792 ]] --[[ Name: disconnectInteractionEvents ]]
    for _, v242 in v240.interactionConnections do
        v242:Disconnect();
    end;
    v240.interactionConnections = {};
end;
v63.new = function(v243, v244, v245) --[[ Line: 799 ]] --[[ Name: new ]]
    -- upvalues: v63 (copy), v14 (copy)
    local v246 = {};
    setmetatable(v246, v63);
    v246.store = v243;
    v246.avatarRoute = v244;
    v246.events = v245;
    v246.updateConnection = nil;
    v246.interactionConnections = {};
    v246.camera = game.Workspace.CurrentCamera;
    v246.isTweening = false;
    v246.panOffset = Vector3.new();
    v246.zoomOffset = 0;
    v246.cachedFocusPoint = if v14 then Vector3.new() else nil;
    v246.cachedBaseZoomRadius = v14 and 0 or nil;
    v246.started = false;
    return v246;
end;
v63.start = function(v247) --[[ Line: 825 ]] --[[ Name: start ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    if v247.started then
        return;
    else
        v247.started = true;
        v247.cachedFocusPoint = v247:calculateFocusPoint();
        v247.cachedBaseZoomRadius = v247:calculateBaseZoomRadius(v247.cachedFocusPoint);
        local v248 = v247.store:getState();
        local l_name_4 = v247.avatarRoute.current.name;
        if l_name_4 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_4) or false) then
            v247:connectInteractionEvents();
        end;
        v247.updateConnection = v247.store.changed:connect(function(...) --[[ Line: 842 ]]
            -- upvalues: v247 (copy)
            v247:updateState(...);
        end);
        v247.camera.CameraType = Enum.CameraType.Scriptable;
        v247.camera.FieldOfView = 50;
        if v248.AvatarExperience.AvatarScene.Character.CurrentCharacter then
            v247.cachedBaseZoomRadius = v247:calculateBaseZoomRadius(v247.cachedFocusPoint);
            v247:handleCameraChange(true);
        end;
        return;
    end;
end;
v63.cancelTween = function(v250) --[[ Line: 857 ]] --[[ Name: cancelTween ]]
    if v250.tween then
        v250.tween:Cancel();
        v250.tween = nil;
        v250.isTweening = false;
    end;
end;
v63.stop = function(v251) --[[ Line: 865 ]] --[[ Name: stop ]]
    if not v251.started then
        return;
    else
        v251.started = false;
        v251:cancelTween();
        v251.updateConnection:disconnect();
        v251:disconnectInteractionEvents();
        return;
    end;
end;
v63.onDestroy = function(_) --[[ Line: 875 ]] --[[ Name: onDestroy ]]

end;
return v63;