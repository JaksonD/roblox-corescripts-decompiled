local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_EmptyState_0 = v5.App.Indicator.EmptyState;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v11 = CFrame.fromEulerAnglesXYZ(0.3490658503988659, 0.2617993877991494, 0.6981317007977318);
local v12 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000);
local v13 = v3.PureComponent:extend("HumanoidViewport");
v13.validateProps = v4.strictInterface({
    humanoidDescription = v4.optional(v4.instanceOf("HumanoidDescription")), 
    loadingFailed = v4.boolean, 
    retryLoadDescription = v4.callback, 
    rigType = v4.optional(v4.enum(Enum.HumanoidRigType))
});
v13.init = function(v14) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v14:setState({
        loading = true, 
        loadingFailed = false
    });
    v14.cameraRef = v3.createRef();
    v14.worldModelRef = v3.createRef();
    local v15, v16 = v3.createBinding(CFrame.new());
    v14.cameraCFrameBinding = v15;
    v14.updateCameraCFrameBinding = v16;
    v15, v16 = v3.createBinding(CFrame.new());
    v14.cameraFocusBinding = v15;
    v14.updateCameraFocusBinding = v16;
    v14.humanoidModel = nil;
    v14.mounted = false;
    v14.onRetryLoading = function() --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            loading = true, 
            loadingFailed = false
        });
        if v14.props.humanoidDescription then
            v14:loadHumanoidModel();
            return;
        else
            v14.props.retryLoadDescription();
            return;
        end;
    end;
end;
local function _(v17) --[[ Line: 63 ]] --[[ Name: rotateLookVector ]]
    -- upvalues: v11 (copy)
    local l_v17_0 = v17;
    l_v17_0 = if math.abs(l_v17_0.Y) > 0.95 then Vector3.new(0, 0, -1, 0) else Vector3.new(l_v17_0.X, 0, l_v17_0.Z).unit;
    return (CFrame.new(Vector3.new(0, 0, 0, 0), l_v17_0) * v11).lookVector;
end;
local function _(v20, v21) --[[ Line: 76 ]] --[[ Name: getCameraOffset ]]
    local l_X_0 = v21.X;
    local l_Y_0 = v21.Y;
    local l_Z_0 = v21.Z;
    local v25 = math.max(l_X_0, l_Y_0);
    local v26 = 1 / math.tan(math.rad(v20) / 2);
    return v25 / 2 * v26 + l_Z_0 / 2;
end;
local function _(v28, v29, v30) --[[ Line: 86 ]] --[[ Name: zoomExtents ]]
    local l_p_0 = v28:GetModelCFrame().p;
    local l_v28_ExtentsSize_0 = v28:GetExtentsSize();
    local l_X_1 = l_v28_ExtentsSize_0.X;
    local l_Y_1 = l_v28_ExtentsSize_0.Y;
    local l_Z_1 = l_v28_ExtentsSize_0.Z;
    local v36 = (math.max(l_X_1, l_Y_1) / 2 * 1.4281480067421146 + l_Z_1 / 2) * 1;
    return v30 - v30.p + l_p_0 + v29 * v36;
end;
v13.positionCamera = function(v38) --[[ Line: 97 ]] --[[ Name: positionCamera ]]
    -- upvalues: v11 (copy)
    local l_humanoidModel_0 = v38.humanoidModel;
    local l_l_humanoidModel_0_ModelCFrame_0 = l_humanoidModel_0:GetModelCFrame();
    local l_lookVector_0 = l_l_humanoidModel_0_ModelCFrame_0.lookVector;
    local l_HumanoidRootPart_0 = l_humanoidModel_0:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_lookVector_0 = l_HumanoidRootPart_0.CFrame.lookVector;
    end;
    local l_l_lookVector_0_0 = l_lookVector_0;
    l_l_lookVector_0_0 = if math.abs(l_l_lookVector_0_0.Y) > 0.95 then Vector3.new(0, 0, -1, 0) else Vector3.new(l_l_lookVector_0_0.X, 0, l_l_lookVector_0_0.Z).unit;
    l_lookVector_0 = (CFrame.new(Vector3.new(0, 0, 0, 0), l_l_lookVector_0_0) * v11).lookVector;
    local v44 = CFrame.new(l_l_humanoidModel_0_ModelCFrame_0.p + l_lookVector_0 * 5, l_l_humanoidModel_0_ModelCFrame_0.p);
    l_l_lookVector_0_0 = l_lookVector_0;
    local l_v44_0 = v44;
    local l_p_1 = l_humanoidModel_0:GetModelCFrame().p;
    local l_l_humanoidModel_0_ExtentsSize_0 = l_humanoidModel_0:GetExtentsSize();
    local l_X_2 = l_l_humanoidModel_0_ExtentsSize_0.X;
    local l_Y_2 = l_l_humanoidModel_0_ExtentsSize_0.Y;
    local l_Z_2 = l_l_humanoidModel_0_ExtentsSize_0.Z;
    local v51 = (math.max(l_X_2, l_Y_2) / 2 * 1.4281480067421146 + l_Z_2 / 2) * 1;
    v44 = l_v44_0 - l_v44_0.p + l_p_1 + l_l_lookVector_0_0 * v51;
    v38.updateCameraCFrameBinding(v44);
    v38.updateCameraFocusBinding(l_l_humanoidModel_0_ModelCFrame_0);
end;
v13.loadIdleAnimation = function(_, v53) --[[ Line: 114 ]] --[[ Name: loadIdleAnimation ]]
    local l_Humanoid_0 = v53:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0.HumanoidDescription.IdleAnimation == 0 then
        return;
    else
        local l_Animate_0 = v53:FindFirstChild("Animate");
        if not l_Animate_0 then
            return;
        else
            local l_idle_0 = l_Animate_0:FindFirstChild("idle");
            if not l_idle_0 then
                return;
            else
                local l_Animation_0 = l_idle_0:FindFirstChildOfClass("Animation");
                if not l_Animation_0 then
                    return;
                else
                    local v58 = l_Humanoid_0:LoadAnimation(l_Animation_0);
                    v58.Looped = true;
                    v58:Play();
                    return;
                end;
            end;
        end;
    end;
end;
v13.loadHumanoidModel = function(v59) --[[ Line: 142 ]] --[[ Name: loadHumanoidModel ]]
    -- upvalues: l_Players_0 (copy), v6 (copy), v12 (copy)
    local l_humanoidDescription_0 = v59.props.humanoidDescription;
    local l_rigType_0 = v59.props.rigType;
    coroutine.wrap(function() --[[ Line: 146 ]]
        -- upvalues: l_Players_0 (ref), l_humanoidDescription_0 (copy), l_rigType_0 (copy), v59 (copy), v6 (ref), v12 (ref)
        local v62 = nil;
        pcall(function() --[[ Line: 148 ]]
            -- upvalues: v62 (ref), l_Players_0 (ref), l_humanoidDescription_0 (ref), l_rigType_0 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v62 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(l_humanoidDescription_0, l_rigType_0);
                return;
            else
                v62 = l_Players_0:CreateHumanoidModelFromDescription(l_humanoidDescription_0, l_rigType_0);
                return;
            end;
        end);
        if not v59.mounted then
            return;
        elseif v59.props.humanoidDescription ~= l_humanoidDescription_0 then
            return;
        elseif v59.props.rigType ~= l_rigType_0 then
            return;
        elseif v62 == nil then
            v59:setState({
                loadingFailed = true
            });
            return;
        else
            v59.humanoidModel = v62;
            if v59.worldModelRef:getValue() then
                v59.humanoidModel.Parent = v59.worldModelRef:getValue();
            end;
            if #l_humanoidDescription_0:GetAccessories(false) > 0 then
                v6.race({
                    v6.fromEvent(v62.Humanoid.ClusterCompositionFinished), 
                    v6.delay(v12 * 0.001)
                }):await();
            end;
            if not v59.mounted then
                return;
            else
                v59:positionCamera();
                v59:loadIdleAnimation(v62);
                v59:setState({
                    loading = false, 
                    loadingFailed = false
                });
                return;
            end;
        end;
    end)();
end;
v13.render = function(v63) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_ShimmerPanel_0 (copy), l_EmptyState_0 (copy), v10 (copy)
    local v64 = v63.props.loadingFailed or v63.state.loadingFailed;
    local v65 = not v64 and v63.state.loading;
    local v66 = not (v64 or v63.state.loading);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        AspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ShimmerFrame = v65 and v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        LoadingFailed = v64 and v3.createElement(l_EmptyState_0, {
            text = v10:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"), 
            size = UDim2.fromScale(1, 1), 
            onActivated = v63.onRetryLoading
        }), 
        ViewportFrame = v3.createElement("ViewportFrame", {
            Visible = v66, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            Ambient = Color3.fromRGB(240, 240, 240), 
            CurrentCamera = v63.cameraRef
        }, {
            Camera = v3.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 70, 
                CFrame = v63.cameraCFrameBinding, 
                Focus = v63.cameraFocusBinding, 
                [v3.Ref] = v63.cameraRef
            }), 
            WorldModel = v3.createElement("WorldModel", {
                [v3.Ref] = v63.worldModelRef
            })
        })
    });
end;
v13.didMount = function(v67) --[[ Line: 260 ]] --[[ Name: didMount ]]
    v67.mounted = true;
    if v67.props.humanoidDescription then
        v67:loadHumanoidModel();
    end;
end;
v13.didUpdate = function(v68, v69) --[[ Line: 268 ]] --[[ Name: didUpdate ]]
    if v68.worldModelRef:getValue() and v68.humanoidModel then
        v68.humanoidModel.Parent = v68.worldModelRef:getValue();
    end;
    local v70 = v68.props.humanoidDescription ~= v69.humanoidDescription;
    local v71 = v68.props.rigType ~= v69.rigType;
    local v72 = false;
    if v68.props.rigType ~= nil then
        v72 = false;
        if v68.props.humanoidDescription ~= nil then
            v72 = v70 or v71;
        end;
    end;
    if v72 then
        v68:setState({
            loading = true
        });
        if v68.props.humanoidDescription ~= nil then
            v68:loadHumanoidModel();
        end;
    end;
end;
v13.willUnmount = function(v73) --[[ Line: 290 ]] --[[ Name: willUnmount ]]
    v73.mounted = false;
end;
return v13;