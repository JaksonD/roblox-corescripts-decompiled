local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RunService_0 = game:GetService("RunService");
local v5 = v1.PureComponent:extend("ObjectViewport");
v5.validateProps = v2.strictInterface({
    model = v2.instanceOf("Model")
});
local function _(v6, v7) --[[ Line: 23 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v7.X;
    local l_Y_0 = v7.Y;
    local l_Z_0 = v7.Z;
    local v11 = math.max(l_X_0, l_Y_0, l_Z_0);
    local v12 = 1 / math.tan(math.rad(v6) / 2);
    return v11 / 2 * v12 + l_Z_0 / 2;
end;
local function _(v14, v15, v16) --[[ Line: 33 ]] --[[ Name: rotateVectorAround ]]
    return CFrame.fromAxisAngle(v16, v15):VectorToWorldSpace(v14);
end;
v5.init = function(v18) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v18.cameraRef = v1.createRef();
    v18.worldModelRef = v1.createRef();
    local v19, v20 = v1.createBinding(CFrame.new());
    v18.cameraCFrameBinding = v19;
    v18.updateCameraCFrameBinding = v20;
    v19, v20 = v1.createBinding(0);
    v18.cameraRotationBinding = v19;
    v18.updateCameraRotationBinding = v20;
    v19, v20 = v1.createBinding(CFrame.new());
    v18.cameraFocusBinding = v19;
    v18.updateCameraFocusBinding = v20;
    v18:OnModelChanged();
end;
v5.OnModelChanged = function(v21) --[[ Line: 49 ]] --[[ Name: OnModelChanged ]]
    if v21.props.model ~= nil then
        v21.modelCFrame = v21.props.model:GetModelCFrame();
        v21.initialLookVector = v21.modelCFrame.lookVector;
        v21.modelExtentsSize = v21.props.model:GetExtentsSize();
        local l_modelExtentsSize_0 = v21.modelExtentsSize;
        local l_X_1 = l_modelExtentsSize_0.X;
        local l_Y_1 = l_modelExtentsSize_0.Y;
        local l_Z_1 = l_modelExtentsSize_0.Z;
        v21.cameraDistance = math.max(l_X_1, l_Y_1, l_Z_1) / 2 * 1.4281480067421146 + l_Z_1 / 2;
    end;
end;
v5.render = function(v26) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.fromScale(1, 1)
    }, {
        AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v1.createElement("ViewportFrame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            LightDirection = Vector3.new(1, 1, 1, 0), 
            Ambient = Color3.fromRGB(240, 240, 240), 
            CurrentCamera = v26.cameraRef
        }, {
            Camera = v1.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 70, 
                CFrame = v26.cameraCFrameBinding, 
                Focus = v26.cameraFocusBinding, 
                [v1.Ref] = v26.cameraRef
            }), 
            WorldModel = v1.createElement("WorldModel", {
                [v1.Ref] = v26.worldModelRef
            }), 
            RenderSteppedConnection = v1.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = function() --[[ Line: 99 ]] --[[ Name: callback ]]
                    -- upvalues: v26 (copy)
                    v26.updateCameraRotationBinding(v26.cameraRotationBinding:getValue() + 0.01);
                    local l_initialLookVector_0 = v26.initialLookVector;
                    local v28 = v26.cameraRotationBinding:getValue();
                    local v29 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v28):VectorToWorldSpace(l_initialLookVector_0);
                    l_initialLookVector_0 = CFrame.new(v26.modelCFrame.p + v29 * v26.cameraDistance, v26.modelCFrame.p);
                    v26.updateCameraCFrameBinding(l_initialLookVector_0);
                end
            })
        })
    });
end;
v5.didMount = function(v30) --[[ Line: 112 ]] --[[ Name: didMount ]]
    if v30.worldModelRef:getValue() and v30.props.model ~= nil then
        v30.props.model.Parent = v30.worldModelRef:getValue();
    end;
end;
v5.willUnmount = function(v31) --[[ Line: 118 ]] --[[ Name: willUnmount ]]
    if v31.props.model then
        v31.props.model.Parent = nil;
    end;
end;
v5.didUpdate = function(v32, v33) --[[ Line: 124 ]] --[[ Name: didUpdate ]]
    if v32.props.model ~= v33.model then
        if v33.model ~= nil then
            v33.model.Parent = nil;
        end;
        if v32.props.model ~= nil then
            v32.props.model.Parent = v32.worldModelRef:getValue();
        end;
        v32:OnModelChanged();
    end;
end;
return v5;