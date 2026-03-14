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
local l_FFlagAXIncreaseDefaultPeekViewHeight_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v18 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0);
local v19 = CFrame.new(Vector3.new(-3, 2.5, 1.5, 0), (Vector3.new(-2, 2.5, 1.5, 0)));
local v20 = {
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
local function _(v21, v22) --[[ Line: 90 ]] --[[ Name: adjustCameraCenterPosition ]]
    return v21 - UDim2.new(0, 0, 0, 64 - v22);
end;
local function _(v24) --[[ Line: 94 ]] --[[ Name: isTryingOnAnimationBundle ]]
    -- upvalues: v10 (copy)
    local v25 = v24.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if v25.isUnequipped then
        return false;
    else
        return v10.BundleTypeIdStrings.Animations == v25.itemSubType;
    end;
end;
local function v34(v27, v28) --[[ Line: 104 ]] --[[ Name: calculateFocusPointOfCharacterParts ]]
    -- upvalues: v10 (copy), v9 (copy)
    local v29 = #v28;
    if v29 == 0 then
        return v10.DefaultRigPosition;
    else
        local v30 = Vector3.new();
        for _, v32 in v28 do
            if v32.Attachment then
                local v33 = v9.getAttachmentCFrame(v27, v32.Part, v32.Attachment);
                if v33 == nil then
                    v33 = v9.getPartCFrame(v27, v32.Part);
                end;
                v30 = v30 + v33.Position;
            else
                v30 = v30 + v9.getPartCFrame(v27, v32.Part).Position;
            end;
        end;
        return v30 / v29;
    end;
end;
local v42 = l_memoize_0(function(v35) --[[ Line: 130 ]]
    local v36 = " equippedAssets=";
    local v37 = {};
    for _, v39 in v35 do
        for v40, _ in v39 do
            table.insert(v37, v40);
        end;
    end;
    return v36 .. table.concat(v37, ", ");
end);
local function v59(v43, v44, v45) --[[ Line: 142 ]] --[[ Name: calculateModel2DBoundingSizeRelativeToCFrame ]]
    -- upvalues: v9 (copy), v13 (copy), v42 (copy), v8 (copy), v19 (copy)
    local l_v43_BoundingBox_0, v47 = v43:GetBoundingBox();
    if not v9.isBoundingBoxVectorSane(v47) then
        if v13() then
            local v48 = v42(v45);
            v8("(Avatar Experience) size = " .. v47.X .. ", " .. v47.Y .. ", " .. v47.Z .. v48);
        end;
        v47 = Vector3.new(4, 6, 2, 0);
    end;
    if not v9.isBoundingBoxCFrameSane(l_v43_BoundingBox_0) then
        if v13() then
            local v49 = v42(v45);
            v8("(Avatar Experience) orientation = " .. l_v43_BoundingBox_0.X .. ", " .. l_v43_BoundingBox_0.Y .. ", " .. l_v43_BoundingBox_0.Z .. v49);
        end;
        l_v43_BoundingBox_0 = v19;
    end;
    if v13() and not v9.isBoundingBoxCFrameSane(v44) then
        local v50 = v42(v45);
        v8("(Avatar Experience) cframe = " .. v44.X .. ", " .. v44.Y .. ", " .. v44.Z .. v50);
    end;
    local v51 = v47 / 2;
    local v52 = {
        Vector3.new(-v51.X, -v51.Y, -v51.Z), 
        Vector3.new(v51.X, -v51.Y, -v51.Z), 
        Vector3.new(v51.X, v51.Y, -v51.Z), 
        Vector3.new(-v51.X, v51.Y, -v51.Z), 
        Vector3.new(-v51.X, -v51.Y, v51.Z), 
        Vector3.new(v51.X, -v51.Y, v51.Z), 
        Vector3.new(v51.X, v51.Y, v51.Z), 
        (Vector3.new(-v51.X, v51.Y, v51.Z))
    };
    local v53 = 1e999;
    local v54 = 1e999;
    local v55 = -1e999;
    local v56 = -1e999;
    for v57 = 1, #v52 do
        local v58 = v44:PointToObjectSpace(l_v43_BoundingBox_0:PointToWorldSpace(v52[v57]));
        v53 = math.min(v53, v58.X);
        v54 = math.min(v54, v58.Y);
        v55 = math.max(v55, v58.X);
        v56 = math.max(v56, v58.Y);
        if v13() then
            if v55 < v53 then
                v8("(Avatar Experience) maxX = " .. v55 .. ", minX = " .. v53);
            end;
            if v56 < v54 then
                v8("(Avatar Experience) maxY = " .. v56 .. ", minY = " .. v54);
            end;
        end;
    end;
    return Vector2.new(v55 - v53, v56 - v54);
end;
local function _(v60) --[[ Line: 230 ]] --[[ Name: hasInteractionEvents ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    if v60 == l_AvatarScreen_0.AvatarExperienceLandingPage or v9.isAvatarBackground(v60) then
        return false;
    else
        return true;
    end;
end;
local v62 = {};
v62.__index = v62;
v62.calculateFocusPoint = function(v63) --[[ Line: 242 ]] --[[ Name: calculateFocusPoint ]]
    -- upvalues: v9 (copy), v10 (copy), v34 (copy), v20 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local v64 = v63.store:getState();
    local v65 = v63:useCenteredSceneView(v64, v63.avatarRoute);
    local v66 = v9.getCategoryInfoFromState(v64, v63.avatarRoute);
    local l_AvatarType_0 = v64.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_CurrentCharacter_0 = v64.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_DeviceOrientation_0 = v64.DeviceOrientation;
    local v70 = v10.AvatarTypeFocusGroups[l_AvatarType_0][v66.CameraFocus];
    local _ = nil;
    if v70 and not v65 then
        return (v34(l_CurrentCharacter_0, v70));
    else
        local v72 = v34(l_CurrentCharacter_0, {
            {
                Part = "HumanoidRootPart"
            }
        });
        local l_Y_0 = (l_CurrentCharacter_0:GetExtentsSize() * v20[l_DeviceOrientation_0].defaultVerticalFocusScale).Y;
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if l_Head_0 then
            l_Y_0 = if l_FFlagAXCustomizeMakeupSupport_0 and v66.CameraFocus == v10.PartName.Makeup then l_Head_0.Position.Y else math.min(l_Head_0.Position.Y, l_Y_0);
        end;
        return (Vector3.new(v72.X, l_Y_0, v72.Z));
    end;
end;
v62.calculateBaseZoomRadius = function(v75, v76) --[[ Line: 277 ]] --[[ Name: calculateBaseZoomRadius ]]
    -- upvalues: v20 (copy), v9 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_FFlagAXIncreaseDefaultPeekViewHeight_0 (copy)
    local v77 = v75.store:getState();
    local v78 = v75:useCenteredSceneView(v77, v75.avatarRoute);
    local v79 = nil;
    local l_DeviceOrientation_1 = v77.DeviceOrientation;
    if v78 then
        return (v77.AvatarExperience.AvatarScene.Character.CurrentCharacter:GetExtentsSize() * 0.5).Y * v20[l_DeviceOrientation_1].fullViewZoomToFocusHeightRatio;
    else
        local l_name_0 = v75.avatarRoute.current.name;
        local v82 = v9.getCategoryInfoFromState(v77, v75.avatarRoute);
        local l_AvatarType_1 = v77.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v84 = l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage;
        local v85 = v10.AvatarTypeFocusGroups[l_AvatarType_1][v82.CameraFocus] or nil;
        local v86 = v77.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
        v79 = if not v86.isUnequipped and v10.BundleTypeIdStrings.Animations == v86.itemSubType then v10.AnimationCategoryCameraZoomRadius else v82.CameraZoomRadius or 0;
        if not v85 then
            local v87 = v84 and v20[l_DeviceOrientation_1].landingPageZoomToFocusHeightRatio or v20[l_DeviceOrientation_1].zoomToFocusHeightRatio;
            v79 = v79 + v76.Y * v87;
        end;
        if l_FFlagAXIncreaseDefaultPeekViewHeight_0 and v85 then
            local l_zoomAdjustmentForFocusPart_0 = v20[l_DeviceOrientation_1].zoomAdjustmentForFocusPart;
            if v84 then
                l_zoomAdjustmentForFocusPart_0 = v20[l_DeviceOrientation_1].landingPageZoomAdjustmentForFocusPart;
            end;
            v79 = v79 * l_zoomAdjustmentForFocusPart_0;
        end;
        return v79;
    end;
end;
v62.calculateZoomRadius = function(v89) --[[ Line: 329 ]] --[[ Name: calculateZoomRadius ]]
    return v89.cachedBaseZoomRadius + v89.zoomOffset;
end;
v62.calculateCameraOrigin = function(v90, v91, v92) --[[ Line: 333 ]] --[[ Name: calculateCameraOrigin ]]
    -- upvalues: v20 (copy)
    local v93 = v20[v90.store:getState().DeviceOrientation].baseCameraOrigin - v91;
    return v91 + Vector3.new(v93.x, 0, v93.z).Unit * v92;
end;
v62.calculateHalfFieldsOfView = function(v94) --[[ Line: 346 ]] --[[ Name: calculateHalfFieldsOfView ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v95 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v94.camera.ViewportSize;
    local l_X_0 = v95.X;
    local l_Y_1 = v95.Y;
    return math.atan(0.4663076581549986 * l_X_0 / l_Y_1), 0.4363323129985824;
end;
v62.useCenteredSceneView = function(_, v99, v100) --[[ Line: 359 ]] --[[ Name: useCenteredSceneView ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    return v100.opaque.name == l_AvatarScreen_0.TryOnItem or v9.getIsSceneFullViewFromState(v99, v100);
end;
v62.getPeekViewHeight = function(v101) --[[ Line: 367 ]] --[[ Name: getPeekViewHeight ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v101.store:getState().AvatarExperience.Common.ItemDetailsPeekView;
    if l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Brief and l_ItemDetailsPeekView_0.briefViewHeight then
        return l_ItemDetailsPeekView_0.briefViewHeight;
    else
        return 0;
    end;
end;
v62.calculateCameraOffsetAngles = function(v103) --[[ Line: 378 ]] --[[ Name: calculateCameraOffsetAngles ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy), v20 (copy), v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v104 = v103.store:getState();
    if v103:useCenteredSceneView(v104, v103.avatarRoute) then
        return 0, 0;
    else
        local l_DeviceOrientation_2 = v104.DeviceOrientation;
        local l_name_1 = v103.avatarRoute.current.name;
        local v107 = v9.getTopBarHeightAvatarScene(v104);
        local v108 = (l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage and v20[l_DeviceOrientation_2].landingPageCameraCenterScreenPosition or v20[l_DeviceOrientation_2].cameraCenterScreenPosition) - UDim2.new(0, 0, 0, 64 - v107);
        local v109, v110 = v103:calculateHalfFieldsOfView();
        local v111 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v103.camera.ViewportSize;
        local l_X_1 = v111.X;
        local l_Y_2 = v111.Y;
        return math.atan(math.tan(v109) * (v108.X.Scale + 2 * v108.X.Offset / l_X_1)), (math.atan(math.tan(v110) * (v108.Y.Scale + 2 * v108.Y.Offset / l_Y_2)));
    end;
end;
v62.pixelOffsetToPositionOffset = function(v114, v115) --[[ Line: 414 ]] --[[ Name: pixelOffsetToPositionOffset ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v116, v117 = v114:calculateCameraOffsetAngles();
    local v118, v119 = v114:calculateHalfFieldsOfView();
    local l_cachedFocusPoint_0 = v114.cachedFocusPoint;
    local v121 = l_cachedFocusPoint_0 - v114:calculateCameraOrigin(l_cachedFocusPoint_0, (v114:calculateZoomRadius()));
    local v122 = (CFrame.new(Vector3.new(), v121) * CFrame.Angles(v117, v116, 0)):VectorToObjectSpace(v121);
    return v115 / (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v114.camera.ViewportSize) * Vector2.new(math.tan(v118), (math.tan(v119))) * -v122.Z * 2;
end;
v62.tweenCameraIntoPlace = function(v123, v124, v125, v126) --[[ Line: 435 ]] --[[ Name: tweenCameraIntoPlace ]]
    -- upvalues: l_TweenService_0 (copy), v18 (copy)
    local v127, v128 = v123:calculateCameraOffsetAngles();
    local v129 = v125 - v124;
    local v130 = CFrame.new(Vector3.new(), v129) * CFrame.Angles(v128, v127, 0);
    local l_panOffset_0 = v123.panOffset;
    local v132 = v130.LookVector:Cross((Vector3.new(0, 1, 0, 0))).Unit * l_panOffset_0.X + Vector3.new(0, 1, 0, 0) * l_panOffset_0.Y;
    local v133 = CFrame.new(v124 + v132) * v130;
    v123:cancelTween();
    if v126 then
        v123.camera.CFrame = v133;
        return;
    else
        local v134 = {
            CFrame = v133
        };
        v123.isTweening = true;
        local v135 = l_TweenService_0:Create(v123.camera, v18, v134);
        v135.Completed:Connect(function() --[[ Line: 461 ]]
            -- upvalues: v123 (copy)
            v123.isTweening = false;
            v123.tween = nil;
        end);
        v135:Play();
        v123.tween = v135;
        return;
    end;
end;
v62.boundPanOffset = function(v136) --[[ Line: 471 ]] --[[ Name: boundPanOffset ]]
    -- upvalues: v59 (copy), v13 (copy), v8 (copy)
    local v137 = v136.store:getState();
    local l_CurrentCharacter_1 = v137.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_1 then
        return;
    else
        local _, v140 = v136:calculateHalfFieldsOfView();
        local v141, v142 = v136:calculateCameraOffsetAngles();
        local l_cachedFocusPoint_1 = v136.cachedFocusPoint;
        local v144 = v136:calculateCameraOrigin(l_cachedFocusPoint_1, (v136:calculateZoomRadius()));
        local v145 = l_cachedFocusPoint_1 - v144;
        local v146 = CFrame.new(Vector3.new(), v145) * CFrame.Angles(v142, v141, 0);
        local v147 = CFrame.new(v144) * v146;
        local v148 = -v136.camera.NearPlaneZ;
        local v149 = math.tan(v140) * v148;
        local v150 = math.sqrt(v149 * v149 + v148 * v148);
        local v151 = math.sin(v140 + v142) * v150 - v144.Y + 0.01;
        local l_EquippedAssets_0 = v137.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v153 = v59(l_CurrentCharacter_1, v147, l_EquippedAssets_0) / 2;
        if v13() then
            if v153.X < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.X = " .. v153.X);
            end;
            if v153.Y < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.Y = " .. v153.Y);
            end;
        end;
        local l_panOffset_1 = v136.panOffset;
        v136.panOffset = Vector3.new(math.clamp(v136.panOffset.X, -v153.X, v153.X), math.clamp(v136.panOffset.Y, math.max(v151, -v153.Y), (math.max(v151, v153.Y))), v136.panOffset.Z);
        return l_panOffset_1 ~= v136.panOffset;
    end;
end;
v62.calculateZoomOffsetBounds = function(v155) --[[ Line: 532 ]] --[[ Name: calculateZoomOffsetBounds ]]
    -- upvalues: v20 (copy)
    local v156 = v20[v155.store:getState().DeviceOrientation];
    local l_cachedBaseZoomRadius_0 = v155.cachedBaseZoomRadius;
    return v156.minZoomRadius - l_cachedBaseZoomRadius_0, v156.maxZoomRadius - l_cachedBaseZoomRadius_0;
end;
v62.boundZoomOffset = function(v158, v159, v160) --[[ Line: 545 ]] --[[ Name: boundZoomOffset ]]
    if not v159 or not v160 then
        local v161, v162 = v158:calculateZoomOffsetBounds();
        v159 = v161;
        v160 = v162;
    end;
    local l_zoomOffset_0 = v158.zoomOffset;
    v158.zoomOffset = math.clamp(v158.zoomOffset, v159, v160);
    return l_zoomOffset_0 ~= v158.zoomOffset;
end;
v62.handleCameraChange = function(v164, v165) --[[ Line: 557 ]] --[[ Name: handleCameraChange ]]
    if not v164.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
        return;
    else
        local l_cachedFocusPoint_2 = v164.cachedFocusPoint;
        v164:tweenCameraIntoPlace(v164:calculateCameraOrigin(l_cachedFocusPoint_2, (v164:calculateZoomRadius())), l_cachedFocusPoint_2, v165);
        return;
    end;
end;
v62.panByDistance = function(v167, v168) --[[ Line: 571 ]] --[[ Name: panByDistance ]]
    v167.panOffset = Vector3.new(v167.panOffset.X + v168.X, v167.panOffset.Y + v168.Y, 0);
    v167:boundPanOffset();
    v167:handleCameraChange(true);
end;
v62.panByPixels = function(v169, v170) --[[ Line: 577 ]] --[[ Name: panByPixels ]]
    v169:panByDistance((v169:pixelOffsetToPositionOffset(v170)));
end;
v62.zoomStraight = function(v171, v172) --[[ Line: 582 ]] --[[ Name: zoomStraight ]]
    v171.zoomOffset = v171.zoomOffset + v172;
    v171:boundZoomOffset();
    v171:handleCameraChange(true);
end;
v62.zoomToPoint = function(v173, v174, v175) --[[ Line: 588 ]] --[[ Name: zoomToPoint ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v176, v177 = v173:calculateCameraOffsetAngles();
    local l_cachedFocusPoint_3 = v173.cachedFocusPoint;
    local v179 = l_cachedFocusPoint_3 - v173:calculateCameraOrigin(l_cachedFocusPoint_3, (v173:calculateZoomRadius()));
    local v180 = CFrame.new(Vector3.new(), v179) * CFrame.Angles(v177, v176, 0);
    local v181 = v180:VectorToObjectSpace(v179);
    local v182 = (v175 - (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v173.camera.ViewportSize) / 2) * Vector2.new(1, -1);
    local v183 = v173:pixelOffsetToPositionOffset(v182);
    local v184 = Vector3.new(v183.X, v183.Y, v181.Z) - v181;
    local v185, v186 = v173:calculateZoomOffsetBounds();
    v173.zoomOffset = v173.zoomOffset + v174;
    v173:boundZoomOffset(v185, v186);
    local v187 = v180:VectorToObjectSpace(l_cachedFocusPoint_3 - v173:calculateCameraOrigin(l_cachedFocusPoint_3, (v173:calculateZoomRadius())));
    local v188 = v173:pixelOffsetToPositionOffset(v182);
    local v189 = Vector3.new(v188.X, v188.Y, v181.Z) - v187;
    v173.panOffset = v173.panOffset + v184 - v189;
    v173:boundPanOffset();
    v173:handleCameraChange(true);
end;
v62.update = function(v190, v191, v192, v193, v194) --[[ Line: 633 ]] --[[ Name: update ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy), v10 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_2 = v193.current.name;
    local l_name_3 = v194.current.name;
    local v197 = l_name_2 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_2) or false);
    local v198 = l_name_3 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_3) or false);
    local v199 = not v197 and v198;
    local v200 = v197 and not v198;
    if v199 then
        if #v190.interactionConnections > 0 then
            v190:disconnectInteractionEvents();
        end;
    elseif v200 and #v190.interactionConnections == 0 then
        v190:connectInteractionEvents();
    end;
    local l_CurrentCharacter_2 = v191.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local v202 = v9.getCategoryInfoFromState(v191, v193);
    if not l_CurrentCharacter_2 or not v202 then
        return;
    else
        local v203 = v190:useCenteredSceneView(v191, v193);
        local v204 = v190:useCenteredSceneView(v192, v194);
        local v205 = v9.getCategoryInfoFromState(v192, v194);
        local l_CharacterModelVersion_0 = v191.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_CharacterModelVersion_1 = v192.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_TryOnCharacterModelVersion_0 = v191.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local l_TryOnCharacterModelVersion_1 = v192.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local v210 = true;
        if l_CharacterModelVersion_0 == l_CharacterModelVersion_1 then
            v210 = l_TryOnCharacterModelVersion_0 ~= l_TryOnCharacterModelVersion_1;
        end;
        local l_CurrentCharacter_3 = v192.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local v212 = v9.getTopBarHeightAvatarScene(v191);
        local v213 = v9.getTopBarHeightAvatarScene(v192);
        local v214 = v191.DeviceOrientation ~= v192.DeviceOrientation;
        local v215 = v191.ScreenSize ~= v192.ScreenSize;
        local v216 = v194.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v217 = v193.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v218 = not v216 and v217;
        local l_AvatarType_2 = v191.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v220 = v10.AvatarTypeFocusGroups[l_AvatarType_2][v202.CameraFocus];
        local v221 = v191.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= v192.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local v222 = true;
        if v203 == v204 then
            v222 = v202 ~= v205;
        end;
        if v222 then
            v190.panOffset = Vector3.new();
            v190.zoomOffset = 0;
        end;
        local v223 = v221 or v222 or l_CurrentCharacter_2 ~= l_CurrentCharacter_3 or not v220 and v210;
        if v223 then
            local l_cachedFocusPoint_4 = v190.cachedFocusPoint;
            v190.cachedFocusPoint = v190:calculateFocusPoint();
            local l_cachedBaseZoomRadius_1 = v190.cachedBaseZoomRadius;
            v190.cachedBaseZoomRadius = v190:calculateBaseZoomRadius(v190.cachedFocusPoint);
            if l_FFlagAXCustomizeMakeupSupport_0 and v202.CameraFocus == v10.PartName.Makeup then
                v190.cachedBaseZoomRadius = v202.CameraZoomRadius;
            end;
            if not v222 then
                if v190.panOffset ~= Vector3.new() then
                    local v226 = v190.cachedFocusPoint - l_cachedFocusPoint_4;
                    v190.panOffset = v190.panOffset - v226;
                end;
                if v190.zoomOffset ~= 0 then
                    local v227 = v190.cachedBaseZoomRadius - l_cachedBaseZoomRadius_1;
                    v190.zoomOffset = v190.zoomOffset - v227;
                end;
            end;
        end;
        if v223 or v214 or v215 or v212 ~= v213 then
            v190:boundPanOffset();
            v190:boundZoomOffset();
            v190:handleCameraChange(v214 or v218);
        end;
        return;
    end;
end;
v62.updateState = function(v228, v229, v230) --[[ Line: 740 ]] --[[ Name: updateState ]]
    local l_avatarRoute_0 = v228.avatarRoute;
    v228:update(v229, v230, l_avatarRoute_0, l_avatarRoute_0);
end;
v62.updateAvatarRoute = function(v232, v233, v234) --[[ Line: 745 ]] --[[ Name: updateAvatarRoute ]]
    v232.avatarRoute = v233;
    if v232.started then
        local v235 = v232.store:getState();
        v232:update(v235, v235, v233, v234);
    end;
end;
v62.updateCategorySelection = function(v236) --[[ Line: 753 ]] --[[ Name: updateCategorySelection ]]
    local v237 = v236.store:getState();
    v236:update(v237, v237, v236.avatarRoute, v236.avatarRoute);
end;
v62.connectInteractionEvents = function(v238) --[[ Line: 759 ]] --[[ Name: connectInteractionEvents ]]
    table.insert(v238.interactionConnections, v238.events.panByDistance:Connect(function(...) --[[ Line: 762 ]]
        -- upvalues: v238 (copy)
        v238:panByDistance(...);
    end));
    table.insert(v238.interactionConnections, v238.events.panByPixels:Connect(function(...) --[[ Line: 768 ]]
        -- upvalues: v238 (copy)
        v238:panByPixels(...);
    end));
    table.insert(v238.interactionConnections, v238.events.zoomStraight:Connect(function(...) --[[ Line: 774 ]]
        -- upvalues: v238 (copy)
        v238:zoomStraight(...);
    end));
    table.insert(v238.interactionConnections, v238.events.zoomToPoint:Connect(function(...) --[[ Line: 780 ]]
        -- upvalues: v238 (copy)
        v238:zoomToPoint(...);
    end));
end;
v62.disconnectInteractionEvents = function(v239) --[[ Line: 786 ]] --[[ Name: disconnectInteractionEvents ]]
    for _, v241 in v239.interactionConnections do
        v241:Disconnect();
    end;
    v239.interactionConnections = {};
end;
v62.new = function(v242, v243, v244) --[[ Line: 793 ]] --[[ Name: new ]]
    -- upvalues: v62 (copy), v14 (copy)
    local v245 = {};
    setmetatable(v245, v62);
    v245.store = v242;
    v245.avatarRoute = v243;
    v245.events = v244;
    v245.updateConnection = nil;
    v245.interactionConnections = {};
    v245.camera = game.Workspace.CurrentCamera;
    v245.isTweening = false;
    v245.panOffset = Vector3.new();
    v245.zoomOffset = 0;
    v245.cachedFocusPoint = if v14 then Vector3.new() else nil;
    v245.cachedBaseZoomRadius = v14 and 0 or nil;
    v245.started = false;
    return v245;
end;
v62.start = function(v246) --[[ Line: 819 ]] --[[ Name: start ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    if v246.started then
        return;
    else
        v246.started = true;
        v246.cachedFocusPoint = v246:calculateFocusPoint();
        v246.cachedBaseZoomRadius = v246:calculateBaseZoomRadius(v246.cachedFocusPoint);
        local v247 = v246.store:getState();
        local l_name_4 = v246.avatarRoute.current.name;
        if l_name_4 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_4) or false) then
            v246:connectInteractionEvents();
        end;
        v246.updateConnection = v246.store.changed:connect(function(...) --[[ Line: 836 ]]
            -- upvalues: v246 (copy)
            v246:updateState(...);
        end);
        v246.camera.CameraType = Enum.CameraType.Scriptable;
        v246.camera.FieldOfView = 50;
        if v247.AvatarExperience.AvatarScene.Character.CurrentCharacter then
            v246.cachedBaseZoomRadius = v246:calculateBaseZoomRadius(v246.cachedFocusPoint);
            v246:handleCameraChange(true);
        end;
        return;
    end;
end;
v62.cancelTween = function(v249) --[[ Line: 851 ]] --[[ Name: cancelTween ]]
    if v249.tween then
        v249.tween:Cancel();
        v249.tween = nil;
        v249.isTweening = false;
    end;
end;
v62.stop = function(v250) --[[ Line: 859 ]] --[[ Name: stop ]]
    if not v250.started then
        return;
    else
        v250.started = false;
        v250:cancelTween();
        v250.updateConnection:disconnect();
        v250:disconnectInteractionEvents();
        return;
    end;
end;
v62.onDestroy = function(_) --[[ Line: 869 ]] --[[ Name: onDestroy ]]

end;
return v62;