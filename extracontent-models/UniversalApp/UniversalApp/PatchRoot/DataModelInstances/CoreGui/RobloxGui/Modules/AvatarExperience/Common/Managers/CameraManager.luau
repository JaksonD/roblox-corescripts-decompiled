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
local v16 = game:DefineFastFlag("AXFixCatalogCategoryZoomReset", false);
local l_FFlagAXIncreaseDefaultPeekViewHeight_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v20 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0);
local v21 = CFrame.new(Vector3.new(-3, 2.5, 1.5, 0), (Vector3.new(-2, 2.5, 1.5, 0)));
local v22 = {
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
local function _(v23, v24) --[[ Line: 92 ]] --[[ Name: adjustCameraCenterPosition ]]
    return v23 - UDim2.new(0, 0, 0, 64 - v24);
end;
local function _(v26) --[[ Line: 96 ]] --[[ Name: isTryingOnAnimationBundle ]]
    -- upvalues: v10 (copy)
    local v27 = v26.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if v27.isUnequipped then
        return false;
    else
        return v10.BundleTypeIdStrings.Animations == v27.itemSubType;
    end;
end;
local function v36(v29, v30) --[[ Line: 106 ]] --[[ Name: calculateFocusPointOfCharacterParts ]]
    -- upvalues: v10 (copy), v9 (copy)
    local v31 = #v30;
    if v31 == 0 then
        return v10.DefaultRigPosition;
    else
        local v32 = Vector3.new();
        for _, v34 in v30 do
            if v34.Attachment then
                local v35 = v9.getAttachmentCFrame(v29, v34.Part, v34.Attachment);
                if v35 == nil then
                    v35 = v9.getPartCFrame(v29, v34.Part);
                end;
                v32 = v32 + v35.Position;
            else
                v32 = v32 + v9.getPartCFrame(v29, v34.Part).Position;
            end;
        end;
        return v32 / v31;
    end;
end;
local v44 = l_memoize_0(function(v37) --[[ Line: 132 ]]
    local v38 = " equippedAssets=";
    local v39 = {};
    for _, v41 in v37 do
        for v42, _ in v41 do
            table.insert(v39, v42);
        end;
    end;
    return v38 .. table.concat(v39, ", ");
end);
local function v61(v45, v46, v47) --[[ Line: 144 ]] --[[ Name: calculateModel2DBoundingSizeRelativeToCFrame ]]
    -- upvalues: v9 (copy), v13 (copy), v44 (copy), v8 (copy), v21 (copy)
    local l_v45_BoundingBox_0, v49 = v45:GetBoundingBox();
    if not v9.isBoundingBoxVectorSane(v49) then
        if v13() then
            local v50 = v44(v47);
            v8("(Avatar Experience) size = " .. v49.X .. ", " .. v49.Y .. ", " .. v49.Z .. v50);
        end;
        v49 = Vector3.new(4, 6, 2, 0);
    end;
    if not v9.isBoundingBoxCFrameSane(l_v45_BoundingBox_0) then
        if v13() then
            local v51 = v44(v47);
            v8("(Avatar Experience) orientation = " .. l_v45_BoundingBox_0.X .. ", " .. l_v45_BoundingBox_0.Y .. ", " .. l_v45_BoundingBox_0.Z .. v51);
        end;
        l_v45_BoundingBox_0 = v21;
    end;
    if v13() and not v9.isBoundingBoxCFrameSane(v46) then
        local v52 = v44(v47);
        v8("(Avatar Experience) cframe = " .. v46.X .. ", " .. v46.Y .. ", " .. v46.Z .. v52);
    end;
    local v53 = v49 / 2;
    local v54 = {
        Vector3.new(-v53.X, -v53.Y, -v53.Z), 
        Vector3.new(v53.X, -v53.Y, -v53.Z), 
        Vector3.new(v53.X, v53.Y, -v53.Z), 
        Vector3.new(-v53.X, v53.Y, -v53.Z), 
        Vector3.new(-v53.X, -v53.Y, v53.Z), 
        Vector3.new(v53.X, -v53.Y, v53.Z), 
        Vector3.new(v53.X, v53.Y, v53.Z), 
        (Vector3.new(-v53.X, v53.Y, v53.Z))
    };
    local v55 = 1e999;
    local v56 = 1e999;
    local v57 = -1e999;
    local v58 = -1e999;
    for v59 = 1, #v54 do
        local v60 = v46:PointToObjectSpace(l_v45_BoundingBox_0:PointToWorldSpace(v54[v59]));
        v55 = math.min(v55, v60.X);
        v56 = math.min(v56, v60.Y);
        v57 = math.max(v57, v60.X);
        v58 = math.max(v58, v60.Y);
        if v13() then
            if v57 < v55 then
                v8("(Avatar Experience) maxX = " .. v57 .. ", minX = " .. v55);
            end;
            if v58 < v56 then
                v8("(Avatar Experience) maxY = " .. v58 .. ", minY = " .. v56);
            end;
        end;
    end;
    return Vector2.new(v57 - v55, v58 - v56);
end;
local function _(v62) --[[ Line: 232 ]] --[[ Name: hasInteractionEvents ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    if v62 == l_AvatarScreen_0.AvatarExperienceLandingPage or v9.isAvatarBackground(v62) then
        return false;
    else
        return true;
    end;
end;
local v64 = {};
v64.__index = v64;
v64.calculateFocusPoint = function(v65) --[[ Line: 244 ]] --[[ Name: calculateFocusPoint ]]
    -- upvalues: v9 (copy), v10 (copy), v36 (copy), v22 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local v66 = v65.store:getState();
    local v67 = v65:useCenteredSceneView(v66, v65.avatarRoute);
    local v68 = v9.getCategoryInfoFromState(v66, v65.avatarRoute);
    local l_AvatarType_0 = v66.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_CurrentCharacter_0 = v66.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_DeviceOrientation_0 = v66.DeviceOrientation;
    local v72 = v10.AvatarTypeFocusGroups[l_AvatarType_0][v68.CameraFocus];
    local _ = nil;
    if v72 and not v67 then
        return (v36(l_CurrentCharacter_0, v72));
    else
        local v74 = v36(l_CurrentCharacter_0, {
            {
                Part = "HumanoidRootPart"
            }
        });
        local l_Y_0 = (l_CurrentCharacter_0:GetExtentsSize() * v22[l_DeviceOrientation_0].defaultVerticalFocusScale).Y;
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if l_Head_0 then
            l_Y_0 = if l_FFlagAXCustomizeMakeupSupport_0 and v68.CameraFocus == v10.PartName.Makeup then l_Head_0.Position.Y else math.min(l_Head_0.Position.Y, l_Y_0);
        end;
        return (Vector3.new(v74.X, l_Y_0, v74.Z));
    end;
end;
v64.calculateBaseZoomRadius = function(v77, v78) --[[ Line: 279 ]] --[[ Name: calculateBaseZoomRadius ]]
    -- upvalues: v22 (copy), v9 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_FFlagAXIncreaseDefaultPeekViewHeight_0 (copy)
    local v79 = v77.store:getState();
    local v80 = v77:useCenteredSceneView(v79, v77.avatarRoute);
    local v81 = nil;
    local l_DeviceOrientation_1 = v79.DeviceOrientation;
    if v80 then
        return (v79.AvatarExperience.AvatarScene.Character.CurrentCharacter:GetExtentsSize() * 0.5).Y * v22[l_DeviceOrientation_1].fullViewZoomToFocusHeightRatio;
    else
        local l_name_0 = v77.avatarRoute.current.name;
        local v84 = v9.getCategoryInfoFromState(v79, v77.avatarRoute);
        local l_AvatarType_1 = v79.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v86 = l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage;
        local v87 = v10.AvatarTypeFocusGroups[l_AvatarType_1][v84.CameraFocus] or nil;
        local v88 = v79.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
        v81 = if not v88.isUnequipped and v10.BundleTypeIdStrings.Animations == v88.itemSubType then v10.AnimationCategoryCameraZoomRadius else v84.CameraZoomRadius or 0;
        if not v87 then
            local v89 = v86 and v22[l_DeviceOrientation_1].landingPageZoomToFocusHeightRatio or v22[l_DeviceOrientation_1].zoomToFocusHeightRatio;
            v81 = v81 + v78.Y * v89;
        end;
        if l_FFlagAXIncreaseDefaultPeekViewHeight_0 and v87 then
            local l_zoomAdjustmentForFocusPart_0 = v22[l_DeviceOrientation_1].zoomAdjustmentForFocusPart;
            if v86 then
                l_zoomAdjustmentForFocusPart_0 = v22[l_DeviceOrientation_1].landingPageZoomAdjustmentForFocusPart;
            end;
            v81 = v81 * l_zoomAdjustmentForFocusPart_0;
        end;
        return v81;
    end;
end;
v64.calculateZoomRadius = function(v91) --[[ Line: 331 ]] --[[ Name: calculateZoomRadius ]]
    return v91.cachedBaseZoomRadius + v91.zoomOffset;
end;
v64.calculateCameraOrigin = function(v92, v93, v94) --[[ Line: 335 ]] --[[ Name: calculateCameraOrigin ]]
    -- upvalues: v22 (copy)
    local v95 = v22[v92.store:getState().DeviceOrientation].baseCameraOrigin - v93;
    return v93 + Vector3.new(v95.x, 0, v95.z).Unit * v94;
end;
v64.calculateHalfFieldsOfView = function(v96) --[[ Line: 348 ]] --[[ Name: calculateHalfFieldsOfView ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v97 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v96.camera.ViewportSize;
    local l_X_0 = v97.X;
    local l_Y_1 = v97.Y;
    return math.atan(0.4663076581549986 * l_X_0 / l_Y_1), 0.4363323129985824;
end;
v64.useCenteredSceneView = function(_, v101, v102) --[[ Line: 361 ]] --[[ Name: useCenteredSceneView ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    return v102.opaque.name == l_AvatarScreen_0.TryOnItem or v9.getIsSceneFullViewFromState(v101, v102);
end;
v64.getPeekViewHeight = function(v103) --[[ Line: 369 ]] --[[ Name: getPeekViewHeight ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v103.store:getState().AvatarExperience.Common.ItemDetailsPeekView;
    if l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Brief and l_ItemDetailsPeekView_0.briefViewHeight then
        return l_ItemDetailsPeekView_0.briefViewHeight;
    else
        return 0;
    end;
end;
v64.calculateCameraOffsetAngles = function(v105) --[[ Line: 380 ]] --[[ Name: calculateCameraOffsetAngles ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy), v22 (copy), v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v106 = v105.store:getState();
    if v105:useCenteredSceneView(v106, v105.avatarRoute) then
        return 0, 0;
    else
        local l_DeviceOrientation_2 = v106.DeviceOrientation;
        local l_name_1 = v105.avatarRoute.current.name;
        local v109 = v9.getTopBarHeightAvatarScene(v106);
        local v110 = (l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage and v22[l_DeviceOrientation_2].landingPageCameraCenterScreenPosition or v22[l_DeviceOrientation_2].cameraCenterScreenPosition) - UDim2.new(0, 0, 0, 64 - v109);
        local v111, v112 = v105:calculateHalfFieldsOfView();
        local v113 = if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v105.camera.ViewportSize;
        local l_X_1 = v113.X;
        local l_Y_2 = v113.Y;
        return math.atan(math.tan(v111) * (v110.X.Scale + 2 * v110.X.Offset / l_X_1)), (math.atan(math.tan(v112) * (v110.Y.Scale + 2 * v110.Y.Offset / l_Y_2)));
    end;
end;
v64.pixelOffsetToPositionOffset = function(v116, v117) --[[ Line: 416 ]] --[[ Name: pixelOffsetToPositionOffset ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v118, v119 = v116:calculateCameraOffsetAngles();
    local v120, v121 = v116:calculateHalfFieldsOfView();
    local l_cachedFocusPoint_0 = v116.cachedFocusPoint;
    local v123 = l_cachedFocusPoint_0 - v116:calculateCameraOrigin(l_cachedFocusPoint_0, (v116:calculateZoomRadius()));
    local v124 = (CFrame.new(Vector3.new(), v123) * CFrame.Angles(v119, v118, 0)):VectorToObjectSpace(v123);
    return v117 / (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v116.camera.ViewportSize) * Vector2.new(math.tan(v120), (math.tan(v121))) * -v124.Z * 2;
end;
v64.tweenCameraIntoPlace = function(v125, v126, v127, v128) --[[ Line: 437 ]] --[[ Name: tweenCameraIntoPlace ]]
    -- upvalues: l_TweenService_0 (copy), v20 (copy)
    local v129, v130 = v125:calculateCameraOffsetAngles();
    local v131 = v127 - v126;
    local v132 = CFrame.new(Vector3.new(), v131) * CFrame.Angles(v130, v129, 0);
    local l_panOffset_0 = v125.panOffset;
    local v134 = v132.LookVector:Cross((Vector3.new(0, 1, 0, 0))).Unit * l_panOffset_0.X + Vector3.new(0, 1, 0, 0) * l_panOffset_0.Y;
    local v135 = CFrame.new(v126 + v134) * v132;
    v125:cancelTween();
    if v128 then
        v125.camera.CFrame = v135;
        return;
    else
        local v136 = {
            CFrame = v135
        };
        v125.isTweening = true;
        local v137 = l_TweenService_0:Create(v125.camera, v20, v136);
        v137.Completed:Connect(function() --[[ Line: 463 ]]
            -- upvalues: v125 (copy)
            v125.isTweening = false;
            v125.tween = nil;
        end);
        v137:Play();
        v125.tween = v137;
        return;
    end;
end;
v64.boundPanOffset = function(v138) --[[ Line: 473 ]] --[[ Name: boundPanOffset ]]
    -- upvalues: v61 (copy), v13 (copy), v8 (copy), v15 (copy)
    local v139 = v138.store:getState();
    local l_CurrentCharacter_1 = v139.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_1 then
        return;
    else
        local _, v142 = v138:calculateHalfFieldsOfView();
        local v143, v144 = v138:calculateCameraOffsetAngles();
        local l_cachedFocusPoint_1 = v138.cachedFocusPoint;
        local v146 = v138:calculateCameraOrigin(l_cachedFocusPoint_1, (v138:calculateZoomRadius()));
        local v147 = l_cachedFocusPoint_1 - v146;
        local v148 = CFrame.new(Vector3.new(), v147) * CFrame.Angles(v144, v143, 0);
        local v149 = CFrame.new(v146) * v148;
        local v150 = -v138.camera.NearPlaneZ;
        local v151 = math.tan(v142) * v150;
        local v152 = math.sqrt(v151 * v151 + v150 * v150);
        local v153 = math.sin(v142 + v144) * v152 - v146.Y + 0.01;
        local l_EquippedAssets_0 = v139.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v155 = v61(l_CurrentCharacter_1, v149, l_EquippedAssets_0) / 2;
        if v13() then
            if v155.X < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.X = " .. v155.X);
            end;
            if v155.Y < 0 then
                v8("(Avatar Experience) characterHalf2DBoundingSize.Y = " .. v155.Y);
            end;
        end;
        if v15 then
            v155 = Vector2.new(math.max(0, v155.X), (math.max(0, v155.Y)));
        end;
        local l_panOffset_1 = v138.panOffset;
        v138.panOffset = Vector3.new(math.clamp(v138.panOffset.X, -v155.X, v155.X), math.clamp(v138.panOffset.Y, math.max(v153, -v155.Y), (math.max(v153, v155.Y))), v138.panOffset.Z);
        return l_panOffset_1 ~= v138.panOffset;
    end;
end;
v64.calculateZoomOffsetBounds = function(v157) --[[ Line: 539 ]] --[[ Name: calculateZoomOffsetBounds ]]
    -- upvalues: v22 (copy)
    local v158 = v22[v157.store:getState().DeviceOrientation];
    local l_cachedBaseZoomRadius_0 = v157.cachedBaseZoomRadius;
    return v158.minZoomRadius - l_cachedBaseZoomRadius_0, v158.maxZoomRadius - l_cachedBaseZoomRadius_0;
end;
v64.boundZoomOffset = function(v160, v161, v162) --[[ Line: 552 ]] --[[ Name: boundZoomOffset ]]
    if not v161 or not v162 then
        local v163, v164 = v160:calculateZoomOffsetBounds();
        v161 = v163;
        v162 = v164;
    end;
    local l_zoomOffset_0 = v160.zoomOffset;
    v160.zoomOffset = math.clamp(v160.zoomOffset, v161, v162);
    return l_zoomOffset_0 ~= v160.zoomOffset;
end;
v64.handleCameraChange = function(v166, v167) --[[ Line: 564 ]] --[[ Name: handleCameraChange ]]
    if not v166.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
        return;
    else
        local l_cachedFocusPoint_2 = v166.cachedFocusPoint;
        v166:tweenCameraIntoPlace(v166:calculateCameraOrigin(l_cachedFocusPoint_2, (v166:calculateZoomRadius())), l_cachedFocusPoint_2, v167);
        return;
    end;
end;
v64.panByDistance = function(v169, v170) --[[ Line: 578 ]] --[[ Name: panByDistance ]]
    v169.panOffset = Vector3.new(v169.panOffset.X + v170.X, v169.panOffset.Y + v170.Y, 0);
    v169:boundPanOffset();
    v169:handleCameraChange(true);
end;
v64.panByPixels = function(v171, v172) --[[ Line: 584 ]] --[[ Name: panByPixels ]]
    v171:panByDistance((v171:pixelOffsetToPositionOffset(v172)));
end;
v64.zoomStraight = function(v173, v174) --[[ Line: 589 ]] --[[ Name: zoomStraight ]]
    v173.zoomOffset = v173.zoomOffset + v174;
    v173:boundZoomOffset();
    v173:handleCameraChange(true);
end;
v64.zoomToPoint = function(v175, v176, v177) --[[ Line: 595 ]] --[[ Name: zoomToPoint ]]
    -- upvalues: v12 (copy), l_HardwareSafeAreaInsets_0 (copy)
    local v178, v179 = v175:calculateCameraOffsetAngles();
    local l_cachedFocusPoint_3 = v175.cachedFocusPoint;
    local v181 = l_cachedFocusPoint_3 - v175:calculateCameraOrigin(l_cachedFocusPoint_3, (v175:calculateZoomRadius()));
    local v182 = CFrame.new(Vector3.new(), v181) * CFrame.Angles(v179, v178, 0);
    local v183 = v182:VectorToObjectSpace(v181);
    local v184 = (v177 - (if v12() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else v175.camera.ViewportSize) / 2) * Vector2.new(1, -1);
    local v185 = v175:pixelOffsetToPositionOffset(v184);
    local v186 = Vector3.new(v185.X, v185.Y, v183.Z) - v183;
    local v187, v188 = v175:calculateZoomOffsetBounds();
    v175.zoomOffset = v175.zoomOffset + v176;
    v175:boundZoomOffset(v187, v188);
    local v189 = v182:VectorToObjectSpace(l_cachedFocusPoint_3 - v175:calculateCameraOrigin(l_cachedFocusPoint_3, (v175:calculateZoomRadius())));
    local v190 = v175:pixelOffsetToPositionOffset(v184);
    local v191 = Vector3.new(v190.X, v190.Y, v183.Z) - v189;
    v175.panOffset = v175.panOffset + v186 - v191;
    v175:boundPanOffset();
    v175:handleCameraChange(true);
end;
v64.update = function(v192, v193, v194, v195, v196) --[[ Line: 640 ]] --[[ Name: update ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy), v10 (copy), v16 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_2 = v195.current.name;
    local l_name_3 = v196.current.name;
    local v199 = l_name_2 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_2) or false);
    local v200 = l_name_3 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_3) or false);
    local v201 = not v199 and v200;
    local v202 = v199 and not v200;
    if v201 then
        if #v192.interactionConnections > 0 then
            v192:disconnectInteractionEvents();
        end;
    elseif v202 and #v192.interactionConnections == 0 then
        v192:connectInteractionEvents();
    end;
    local l_CurrentCharacter_2 = v193.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local v204 = v9.getCategoryInfoFromState(v193, v195);
    if not l_CurrentCharacter_2 or not v204 then
        return;
    else
        local v205 = v192:useCenteredSceneView(v193, v195);
        local v206 = v192:useCenteredSceneView(v194, v196);
        local v207 = v9.getCategoryInfoFromState(v194, v196);
        local l_CharacterModelVersion_0 = v193.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_CharacterModelVersion_1 = v194.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_TryOnCharacterModelVersion_0 = v193.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local l_TryOnCharacterModelVersion_1 = v194.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local v212 = true;
        if l_CharacterModelVersion_0 == l_CharacterModelVersion_1 then
            v212 = l_TryOnCharacterModelVersion_0 ~= l_TryOnCharacterModelVersion_1;
        end;
        local l_CurrentCharacter_3 = v194.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local v214 = v9.getTopBarHeightAvatarScene(v193);
        local v215 = v9.getTopBarHeightAvatarScene(v194);
        local v216 = v193.DeviceOrientation ~= v194.DeviceOrientation;
        local v217 = v193.ScreenSize ~= v194.ScreenSize;
        local v218 = v196.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v219 = v195.opaque.name == l_AvatarScreen_0.TryOnItem;
        local v220 = not v218 and v219;
        local l_AvatarType_2 = v193.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v222 = v10.AvatarTypeFocusGroups[l_AvatarType_2][v204.CameraFocus];
        local v223 = v193.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= v194.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local v224 = if v16 then v192.lastCategoryInfo ~= nil and v204 ~= v192.lastCategoryInfo else nil;
        local v225 = true;
        if v205 == v206 then
            v225 = true;
            if v204 == v207 then
                v225 = v16 and v224;
            end;
        end;
        if v225 then
            v192.panOffset = Vector3.new();
            v192.zoomOffset = 0;
        end;
        local v226 = v223 or v225 or l_CurrentCharacter_2 ~= l_CurrentCharacter_3 or not v222 and v212;
        if v226 then
            local l_cachedFocusPoint_4 = v192.cachedFocusPoint;
            v192.cachedFocusPoint = v192:calculateFocusPoint();
            local l_cachedBaseZoomRadius_1 = v192.cachedBaseZoomRadius;
            v192.cachedBaseZoomRadius = v192:calculateBaseZoomRadius(v192.cachedFocusPoint);
            if l_FFlagAXCustomizeMakeupSupport_0 and v204.CameraFocus == v10.PartName.Makeup then
                v192.cachedBaseZoomRadius = v204.CameraZoomRadius;
            end;
            if not v225 then
                if v192.panOffset ~= Vector3.new() then
                    local v229 = v192.cachedFocusPoint - l_cachedFocusPoint_4;
                    v192.panOffset = v192.panOffset - v229;
                end;
                if v192.zoomOffset ~= 0 then
                    local v230 = v192.cachedBaseZoomRadius - l_cachedBaseZoomRadius_1;
                    v192.zoomOffset = v192.zoomOffset - v230;
                end;
            end;
        end;
        if v226 or v216 or v217 or v214 ~= v215 then
            v192:boundPanOffset();
            v192:boundZoomOffset();
            v192:handleCameraChange(v216 or v220);
        end;
        if v16 then
            v192.lastCategoryInfo = v204;
        end;
        return;
    end;
end;
v64.updateState = function(v231, v232, v233) --[[ Line: 757 ]] --[[ Name: updateState ]]
    local l_avatarRoute_0 = v231.avatarRoute;
    v231:update(v232, v233, l_avatarRoute_0, l_avatarRoute_0);
end;
v64.updateAvatarRoute = function(v235, v236, v237) --[[ Line: 762 ]] --[[ Name: updateAvatarRoute ]]
    v235.avatarRoute = v236;
    if v235.started then
        local v238 = v235.store:getState();
        v235:update(v238, v238, v236, v237);
    end;
end;
v64.updateCategorySelection = function(v239) --[[ Line: 770 ]] --[[ Name: updateCategorySelection ]]
    local v240 = v239.store:getState();
    v239:update(v240, v240, v239.avatarRoute, v239.avatarRoute);
end;
v64.connectInteractionEvents = function(v241) --[[ Line: 776 ]] --[[ Name: connectInteractionEvents ]]
    table.insert(v241.interactionConnections, v241.events.panByDistance:Connect(function(...) --[[ Line: 779 ]]
        -- upvalues: v241 (copy)
        v241:panByDistance(...);
    end));
    table.insert(v241.interactionConnections, v241.events.panByPixels:Connect(function(...) --[[ Line: 785 ]]
        -- upvalues: v241 (copy)
        v241:panByPixels(...);
    end));
    table.insert(v241.interactionConnections, v241.events.zoomStraight:Connect(function(...) --[[ Line: 791 ]]
        -- upvalues: v241 (copy)
        v241:zoomStraight(...);
    end));
    table.insert(v241.interactionConnections, v241.events.zoomToPoint:Connect(function(...) --[[ Line: 797 ]]
        -- upvalues: v241 (copy)
        v241:zoomToPoint(...);
    end));
end;
v64.disconnectInteractionEvents = function(v242) --[[ Line: 803 ]] --[[ Name: disconnectInteractionEvents ]]
    for _, v244 in v242.interactionConnections do
        v244:Disconnect();
    end;
    v242.interactionConnections = {};
end;
v64.new = function(v245, v246, v247) --[[ Line: 810 ]] --[[ Name: new ]]
    -- upvalues: v64 (copy), v14 (copy)
    local v248 = {};
    setmetatable(v248, v64);
    v248.store = v245;
    v248.avatarRoute = v246;
    v248.events = v247;
    v248.updateConnection = nil;
    v248.interactionConnections = {};
    v248.camera = game.Workspace.CurrentCamera;
    v248.isTweening = false;
    v248.panOffset = Vector3.new();
    v248.zoomOffset = 0;
    v248.cachedFocusPoint = if v14 then Vector3.new() else nil;
    v248.cachedBaseZoomRadius = v14 and 0 or nil;
    v248.started = false;
    v248.lastCategoryInfo = nil;
    return v248;
end;
v64.start = function(v249) --[[ Line: 837 ]] --[[ Name: start ]]
    -- upvalues: v16 (copy), v9 (copy), l_AvatarScreen_0 (copy)
    if v249.started then
        return;
    else
        v249.started = true;
        v249.cachedFocusPoint = v249:calculateFocusPoint();
        v249.cachedBaseZoomRadius = v249:calculateBaseZoomRadius(v249.cachedFocusPoint);
        local v250 = v249.store:getState();
        if v16 then
            v249.lastCategoryInfo = v9.getCategoryInfoFromState(v250, v249.avatarRoute);
        end;
        local l_name_4 = v249.avatarRoute.current.name;
        if l_name_4 ~= l_AvatarScreen_0.AvatarExperienceLandingPage and (not v9.isAvatarBackground(l_name_4) or false) then
            v249:connectInteractionEvents();
        end;
        v249.updateConnection = v249.store.changed:connect(function(...) --[[ Line: 858 ]]
            -- upvalues: v249 (copy)
            v249:updateState(...);
        end);
        v249.camera.CameraType = Enum.CameraType.Scriptable;
        v249.camera.FieldOfView = 50;
        if v250.AvatarExperience.AvatarScene.Character.CurrentCharacter then
            v249.cachedBaseZoomRadius = v249:calculateBaseZoomRadius(v249.cachedFocusPoint);
            v249:handleCameraChange(true);
        end;
        return;
    end;
end;
v64.cancelTween = function(v252) --[[ Line: 873 ]] --[[ Name: cancelTween ]]
    if v252.tween then
        v252.tween:Cancel();
        v252.tween = nil;
        v252.isTweening = false;
    end;
end;
v64.stop = function(v253) --[[ Line: 881 ]] --[[ Name: stop ]]
    if not v253.started then
        return;
    else
        v253.started = false;
        v253:cancelTween();
        v253.updateConnection:disconnect();
        v253:disconnectInteractionEvents();
        return;
    end;
end;
v64.onDestroy = function(_) --[[ Line: 891 ]] --[[ Name: onDestroy ]]

end;
return v64;