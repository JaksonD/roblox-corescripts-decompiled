local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_EmptyState_0 = v9.App.Indicator.EmptyState;
local l_Button_0 = v9.App.Button.Button;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_ShortcutBar_0 = v9.App.Navigation.ShortcutBar;
local l_InputType_0 = v9.Core.Enums.InputType;
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_InputTypeConstants_0 = require(l_CorePackages_0.Workspace.Packages.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local v20 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v21 = require(script.Parent.InteractionFrame);
local v22 = require(script.Parent.Parent.Parent.Constants);
local l_Images_0 = v9.App.ImageSet.Images;
local v24 = l_Images_0["icons/actions/previewShrink"];
local v25 = l_Images_0["icons/actions/reset"];
local v26 = {
    LOADING = "loading", 
    SUCCESSFULLY_LOADED = "successfullyLoaded", 
    FAILED_TO_LOAD = "failedToLoad"
};
local v27 = v7.PureComponent:extend("PreviewViewport");
v27.validateProps = v8.strictInterface({
    asset = v8.union(v8.instanceOf("Model"), v8.instanceIsA("AnimationClip")), 
    closePreviewView = v8.callback
});
local function _(v28) --[[ Line: 70 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy)
    return l_getInputGroup_0(v28) == l_InputTypeConstants_0.Gamepad;
end;
v27.init = function(v30) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy), v7 (copy)
    local v31 = {
        loadingState = v26.LOADING
    };
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v31.isGamepad = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == l_InputTypeConstants_0.Gamepad;
    v31.cameraMoved = false;
    v30:setState(v31);
    v30.ref = v7.createRef();
    v30.zoomFactor = 0.8;
    v30.cameraDegreesAngle = Vector2.new(0, 0);
    v30.cameraPanInPixels = Vector2.new(0, 0);
    v30.cameraRef = v7.createRef();
    v30.worldModelRef = v7.createRef();
    local v33, v34 = v7.createBinding(CFrame.new());
    v30.cameraCFrameBinding = v33;
    v30.updateCameraCFrameBinding = v34;
    v33, v34 = v7.createBinding(CFrame.new());
    v30.cameraFocusBinding = v33;
    v30.updateCameraFocusBinding = v34;
    v30.panByPixels = function(v35) --[[ Line: 93 ]]
        -- upvalues: v30 (copy)
        v30.cameraPanInPixels = v30.cameraPanInPixels + v35;
        v30:clampOffsets();
        v30:updateCameraPosition();
        if not v30.state.cameraMoved then
            v30:setState({
                cameraMoved = true
            });
        end;
    end;
    v30.rotateByPixels = function(v36) --[[ Line: 102 ]]
        -- upvalues: v30 (copy)
        v30.cameraDegreesAngle = Vector2.new(v30.cameraDegreesAngle.X - v36.Y, v30.cameraDegreesAngle.Y - v36.X);
        v30:clampOffsets();
        v30:updateCameraPosition();
        if not v30.state.cameraMoved then
            v30:setState({
                cameraMoved = true
            });
        end;
    end;
    v30.storeInput = function(_, v38, v39) --[[ Line: 115 ]]
        -- upvalues: v30 (copy)
        v30.inputState = v38;
        v30.inputObject = v39;
        return Enum.ContextActionResult.Sink;
    end;
    v30.rotateByRadians = function(v40) --[[ Line: 123 ]]
        -- upvalues: v30 (copy)
        if not v30.model:FindFirstChild("HumanoidRootPart") then
            return;
        else
            local v41 = -v40 * 180 / 3.141592653589793;
            v30.cameraDegreesAngle = Vector2.new(v30.cameraDegreesAngle.X % 360, (v30.cameraDegreesAngle.Y + v41) % 360);
            v30:updateCameraPosition();
            if not v30.state.cameraMoved then
                v30:setState({
                    cameraMoved = true
                });
            end;
            return;
        end;
    end;
    v30.setAngularVelocityByPixels = function(_) --[[ Line: 142 ]]

    end;
    v30.zoomToPoint = function(v43, v44) --[[ Line: 145 ]]
        -- upvalues: v30 (copy)
        local v45 = 0.9 ^ v43;
        local v46 = v30.zoomFactor * v45;
        if v46 ~= math.clamp(v46, 0.3, 10) then
            return;
        else
            v30.zoomFactor = v46;
            if v44 then
                local v47 = (v44 - (v30.absolutePosition + v30.absoluteSize / 2)) * Vector2.new(1, -1) * -1;
                v30.cameraPanInPixels = v47 - (v47 - v30.cameraPanInPixels) * v45;
            end;
            v30:clampOffsets();
            v30:updateCameraPosition();
            if not v30.state.cameraMoved then
                v30:setState({
                    cameraMoved = true
                });
            end;
            return;
        end;
    end;
    v30.onRetryLoading = function() --[[ Line: 170 ]]
        -- upvalues: v30 (copy)
        v30:processAsset();
    end;
    v30.onResetButtonPressed = function() --[[ Line: 174 ]]
        -- upvalues: v30 (copy)
        v30:resetCameraPosition();
    end;
end;
v27.setLoadingState = function(v48, v49) --[[ Line: 179 ]] --[[ Name: setLoadingState ]]
    v48:setState({
        loadingState = v49
    });
end;
v27.clampOffsets = function(v50) --[[ Line: 185 ]] --[[ Name: clampOffsets ]]
    v50.zoomFactor = math.clamp(v50.zoomFactor, 0.3, 10);
    local v51 = -80;
    if v50.props.asset and v50.props.asset:IsA("AnimationClip") then
        v51 = v50:angleToMakeBasePlateParallel();
    end;
    v50.cameraDegreesAngle = Vector2.new(math.clamp(v50.cameraDegreesAngle.X, v51, 80), v50.cameraDegreesAngle.Y);
    local v52 = math.max(v50.zoomFactor * v50.modelExtentsSize.X / 2 / v50:pointsToPixelsFactor(), v50.absoluteSize.X / 2);
    local v53 = math.max(v50.zoomFactor * v50.modelExtentsSize.Y / 2 / v50:pointsToPixelsFactor(), v50.absoluteSize.Y / 2);
    v50.cameraPanInPixels = Vector2.new(math.clamp(v50.cameraPanInPixels.X, -v52, v52), (math.clamp(v50.cameraPanInPixels.Y, -v53, v53)));
end;
v27.angleToMakeBasePlateParallel = function(v54) --[[ Line: 211 ]] --[[ Name: angleToMakeBasePlateParallel ]]
    local v55 = v54.cameraDistance / v54.zoomFactor;
    local v56 = v54:pointsToPixelsFactor() / v54.zoomFactor * v54.cameraPanInPixels.Y;
    return -math.deg((math.asin((math.clamp((v54.modelExtentsSize.Y / 2 + v56) / v55, -0.99, 0.99)))));
end;
v27.processAsset = function(v57) --[[ Line: 230 ]] --[[ Name: processAsset ]]
    -- upvalues: v26 (copy), l_Players_0 (copy), l_AnimationClipProvider_0 (copy)
    local l_asset_0 = v57.props.asset;
    if not l_asset_0 then
        return;
    elseif l_asset_0:IsA("AnimationClip") then
        v57:setLoadingState(v26.LOADING);
        task.spawn(function() --[[ Line: 239 ]]
            -- upvalues: l_Players_0 (ref), v57 (copy), l_asset_0 (copy), v26 (ref), l_AnimationClipProvider_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 240 ]]
                -- upvalues: l_Players_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return (l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(1342485078));
                else
                    return (l_Players_0:GetHumanoidDescriptionFromOutfitId(1342485078));
                end;
            end);
            local v61 = nil;
            if l_status_0 then
                v61 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(l_result_0, Enum.HumanoidRigType.R15) else l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
            end;
            if not v57.isMounted or l_asset_0 ~= v57.props.asset then
                return;
            elseif not v61 then
                v57:setLoadingState(v26.FAILED_TO_LOAD);
                return;
            else
                v57.model = v61;
                v57:addModelToViewportIfNeeded();
                local v62 = l_AnimationClipProvider_0:RegisterActiveAnimationClip(l_asset_0);
                v57.animation = Instance.new("Animation");
                v57.animation.AnimationId = v62;
                local l_Humanoid_0 = v57.model:FindFirstChildWhichIsA("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0:LoadAnimation(v57.animation):Play();
                end;
                v57:setLoadingState(v26.SUCCESSFULLY_LOADED);
                return;
            end;
        end);
        return;
    else
        if l_asset_0:IsA("Model") or l_asset_0:IsA("Accessory") then
            if l_asset_0:IsA("Accessory") then
                local l_Model_0 = Instance.new("Model");
                l_asset_0:Clone().Parent = l_Model_0;
                v57.model = l_Model_0;
            else
                v57.model = l_asset_0:Clone();
            end;
            v57.model.Parent = nil;
            v57:addModelToViewportIfNeeded();
            v57:setLoadingState(v26.SUCCESSFULLY_LOADED);
        end;
        return;
    end;
end;
v27.addModelToViewportIfNeeded = function(v65) --[[ Line: 305 ]] --[[ Name: addModelToViewportIfNeeded ]]
    if v65.model ~= nil and v65.model.Parent ~= nil then
        return;
    else
        if v65.worldModelRef:getValue() and v65.model ~= nil then
            v65.model.Parent = v65.worldModelRef:getValue();
            v65:resetCameraPosition();
            if v65.props.asset and v65.props.asset:IsA("AnimationClip") then
                v65.baseplate = Instance.new("Part");
                v65.baseplate.Size = Vector3.new(8, 0.5, 8, 0);
                v65.baseplate.Transparency = 0.6;
                v65.baseplate.Parent = v65.worldModelRef:getValue();
                local v66 = v65.modelCFrame.Position + Vector3.new(0, -v65.modelExtentsSize.Y / 2, 0);
                v65.baseplate.Position = v66 + Vector3.new(0, -0.25, 0, 0);
            end;
        end;
        return;
    end;
end;
local function _(v67, v68) --[[ Line: 327 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v68.X;
    local l_Y_0 = v68.Y;
    local l_Z_0 = v68.Z;
    local v72 = math.max(l_X_0, l_Y_0);
    local v73 = 1 / math.tan(math.rad(v67) / 2);
    return v72 / 2 * v73 + l_Z_0 / 2;
end;
local function _(v75, v76, v77) --[[ Line: 337 ]] --[[ Name: rotateVectorAround ]]
    return CFrame.fromAxisAngle(v77, v76):VectorToWorldSpace(v75);
end;
v27.resetCameraPosition = function(v79) --[[ Line: 341 ]] --[[ Name: resetCameraPosition ]]
    if not v79.model then
        return;
    else
        v79.modelCFrame = v79.model:GetModelCFrame();
        v79.initialLookVector = v79.modelCFrame.lookVector;
        local l_HumanoidRootPart_0 = v79.model:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            v79.initialLookVector = l_HumanoidRootPart_0.CFrame.lookVector;
        end;
        v79.modelExtentsSize = v79.model:GetExtentsSize();
        local l_modelExtentsSize_0 = v79.modelExtentsSize;
        local l_X_1 = l_modelExtentsSize_0.X;
        local l_Y_1 = l_modelExtentsSize_0.Y;
        local l_Z_1 = l_modelExtentsSize_0.Z;
        v79.cameraDistance = math.max(l_X_1, l_Y_1) / 2 * 3.7320508075688776 + l_Z_1 / 2;
        if v79.props.asset and v79.props.asset:IsA("AnimationClip") then
            v79.cameraDegreesAngle = Vector2.new(0, 0);
            v79.zoomFactor = 0.75;
        else
            v79.cameraDegreesAngle = Vector2.new(5, 20);
            v79.zoomFactor = 0.8;
        end;
        v79.cameraPanInPixels = Vector2.new(0, 0);
        v79:updateCameraPosition();
        if v79.state.cameraMoved then
            v79:setState({
                cameraMoved = false
            });
        end;
        return;
    end;
end;
v27.pointsToPixelsFactor = function(v85) --[[ Line: 375 ]] --[[ Name: pointsToPixelsFactor ]]
    if v85.absoluteSize == nil or v85.modelExtentsSize == nil or v85.absoluteSize.Y == 0 or v85.modelExtentsSize.Y == 0 or v85.modelExtentsSize.X == 0 then
        return 1;
    else
        return math.max(v85.modelExtentsSize.X, v85.modelExtentsSize.Y) / v85.absoluteSize.Y;
    end;
end;
v27.updateCameraPosition = function(v86) --[[ Line: 390 ]] --[[ Name: updateCameraPosition ]]
    if v86.absoluteSize == nil or v86.cameraDistance == nil then
        return;
    else
        local v87 = v86.cameraDistance / v86.zoomFactor;
        local l_initialLookVector_0 = v86.initialLookVector;
        local v89 = math.rad(v86.cameraDegreesAngle.X);
        local v90 = math.rad(v86.cameraDegreesAngle.Y);
        local v91 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0, 0), v89):VectorToWorldSpace(l_initialLookVector_0);
        l_initialLookVector_0 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v90):VectorToWorldSpace(v91);
        v91 = CFrame.new(v86.modelCFrame.p + l_initialLookVector_0 * v87, v86.modelCFrame.p);
        local v92 = v86:pointsToPixelsFactor() / v86.zoomFactor;
        v91 = v91 + v91.UpVector * v92 * v86.cameraPanInPixels.Y + v91.RightVector * v92 * v86.cameraPanInPixels.X;
        v86.updateCameraCFrameBinding(v91);
        v86.updateCameraFocusBinding(v86.modelCFrame);
        return;
    end;
end;
local v93 = {
    resetViewButtonText = v20:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"), 
    loadingFailedText = v20:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
};
v27.render = function(v94) --[[ Line: 424 ]] --[[ Name: render ]]
    -- upvalues: l_InputType_0 (copy), l_Images_0 (copy), v20 (copy), v7 (copy), l_GuiService_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v25 (copy), v24 (copy), l_ShortcutBar_0 (copy), v26 (copy), l_Skeleton_0 (copy), l_EmptyState_0 (copy), v93 (copy), v21 (copy), v22 (copy)
    local l_loadingState_0 = v94.state.loadingState;
    local v96 = {
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/scroll"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSVertical"]
            }, 
            text = v20:FormatByKey("CoreScripts.PublishAvatarPrompt.Zoom")
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickLeft"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSHorizontal"]
            }, 
            text = v20:FormatByKey("CoreScripts.PublishAvatarPrompt.Rotate")
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickRight"]
            }, 
            text = v20:FormatByKey("CoreScripts.PublishAvatarPrompt.Pan")
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxY"]
            }, 
            text = v20:FormatByKey("CoreScripts.PublishAvatarPrompt.ResetView")
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxB"]
            }, 
            text = v20:FormatByKey("CoreScripts.PublishAvatarPrompt.Close")
        }
    };
    local v97 = v94.state.cameraMoved and not v94.state.isGamepad;
    local l_createElement_0 = v7.createElement;
    local v99 = "Frame";
    local v103 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v7.Ref] = v94.ref, 
        [v7.Change.AbsoluteSize] = function(v100) --[[ Line: 469 ]]
            -- upvalues: v94 (copy)
            v94.absoluteSize = v100.AbsoluteSize;
            v94:updateCameraPosition();
        end, 
        [v7.Change.AbsolutePosition] = function(v101) --[[ Line: 473 ]]
            -- upvalues: l_GuiService_0 (ref), v94 (copy)
            local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
            v94.absolutePosition = v101.absolutePosition + l_l_GuiService_0_GuiInset_0;
        end
    };
    local v105 = {
        LastInputTypeConnection = v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v104) --[[ Line: 480 ]] --[[ Name: callback ]]
                -- upvalues: v94 (copy), l_getInputGroup_0 (ref), l_InputTypeConstants_0 (ref)
                v94:setState({
                    isGamepad = l_getInputGroup_0(v104) == l_InputTypeConstants_0.Gamepad
                });
            end
        }) or nil, 
        ButtonFrame = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1
        }, {
            UIPadding = v7.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 24), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            ResetViewButton = if v97 then v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromOffset(36, 36), 
                position = UDim2.fromScale(0, 1), 
                anchorPoint = Vector2.new(0, 1), 
                icon = v25, 
                onActivated = v94.onResetButtonPressed
            }) else nil, 
            ShrinkPreviewButton = v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.fromOffset(36, 36), 
                icon = v24, 
                position = UDim2.fromScale(1, 1), 
                anchorPoint = Vector2.new(1, 1), 
                onActivated = v94.props.closePreviewView
            })
        }), 
        TooltipHint = if v94.props.asset:IsA("Model") then v7.createElement(l_ShortcutBar_0, {
            position = UDim2.fromScale(0.5, 0.9), 
            anchorPoint = Vector2.new(0.5, 1), 
            transitionDelaySeconds = 2, 
            items = v96
        }) else nil
    };
    local v106 = false;
    if l_loadingState_0 == v26.LOADING then
        v106 = v7.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
    v105.ShimmerFrame = v106;
    v106 = false;
    if l_loadingState_0 == v26.FAILED_TO_LOAD then
        v106 = v7.createElement(l_EmptyState_0, {
            text = v93.loadingFailedText, 
            size = UDim2.fromScale(1, 1), 
            onActivated = v94.onRetryLoading
        });
    end;
    v105.LoadingFailed = v106;
    v105.InteractionFrame = v7.createElement(v21, {
        ZIndex = -1, 
        Size = UDim2.fromScale(1, 1), 
        Visible = l_loadingState_0 == v26.SUCCESSFULLY_LOADED, 
        panByPixels = v94.panByPixels, 
        rotateByPixels = v94.rotateByPixels, 
        setAngularVelocityByPixels = v94.setAngularVelocityByPixels, 
        zoomToPoint = v94.zoomToPoint
    }, {
        ViewportFrame = v7.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = v22.ViewportLightColor, 
            Ambient = v22.ViewportLightAmbient, 
            LightDirection = v22.ViewportLightDirection, 
            CurrentCamera = v94.cameraRef
        }, {
            Camera = v7.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 30, 
                HeadLocked = true, 
                VRTiltAndRollEnabled = true, 
                CFrame = v94.cameraCFrameBinding, 
                Focus = v94.cameraFocusBinding, 
                [v7.Ref] = v94.cameraRef
            }), 
            WorldModel = v7.createElement("WorldModel", {
                [v7.Ref] = v94.worldModelRef
            })
        })
    });
    return l_createElement_0(v99, v103, v105);
end;
v27.setUpGamepad = function(v107) --[[ Line: 580 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy), l_RunService_0 (copy), l_GamepadUtils_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    l_ContextActionService_0:BindCoreAction("PreviewViewportClose", v107.props.closePreviewView, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("PreviewViewportReset", function() --[[ Line: 591 ]]
        -- upvalues: v107 (copy)
        v107:resetCameraPosition();
    end, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("PreviewViewportRotateAndZoom", v107.storeInput, false, Enum.KeyCode.Thumbstick2);
    v107.gamePadConnection = l_RunService_0.RenderStepped:Connect(function(v108) --[[ Line: 601 ]]
        -- upvalues: v107 (copy), l_GamepadUtils_0 (ref)
        if v107.inputState == Enum.UserInputState.Change and v107.inputObject then
            l_GamepadUtils_0.rotateAndZoom(v107.inputObject, v108, v107.setAngularVelocityByPixels, v107.rotateByRadians, v107.zoomToPoint);
        end;
    end);
end;
v27.didMount = function(v109) --[[ Line: 614 ]] --[[ Name: didMount ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_1 = l_GuiService_0:GetGuiInset();
    v109.isMounted = true;
    v109.absolutePosition = v109.ref.current.AbsolutePosition + l_l_GuiService_0_GuiInset_1;
    v109:processAsset();
    v109:setUpGamepad();
end;
v27.cleanupGamepad = function(v111) --[[ Line: 622 ]] --[[ Name: cleanupGamepad ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    if v111.gamePadConnection then
        v111.gamePadConnection:Disconnect();
    end;
end;
v27.willUnmount = function(v112) --[[ Line: 631 ]] --[[ Name: willUnmount ]]
    v112.isMounted = false;
    v112:cleanupGamepad();
end;
v27.didUpdate = function(v113, v114) --[[ Line: 636 ]] --[[ Name: didUpdate ]]
    if v113.props.asset ~= v114.asset then
        if v113.model ~= nil then
            v113.model.Parent = nil;
            v113.model = nil;
        end;
        if v113.baseplate ~= nil then
            v113.baseplate.Parent = nil;
            v113.baseplate:Destroy();
        end;
        v113:processAsset();
    end;
end;
return v27;