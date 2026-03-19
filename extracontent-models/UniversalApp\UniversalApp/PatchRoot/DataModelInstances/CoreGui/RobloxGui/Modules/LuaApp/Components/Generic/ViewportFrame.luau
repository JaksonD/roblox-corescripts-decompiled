local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v3.strictInterface({
    regularProps = v3.optional(v3.table), 
    modelRef = v3.optional(v3.strictInterface({
        value = v3.instanceIsA("Model")
    })), 
    cameraFocusPoint = v3.optional(v3.Vector3), 
    cameraLookVector = v3.optional(v3.Vector3), 
    cameraDistance = v3.optional(v3.number), 
    cameraUpVector = v3.optional(v3.Vector3)
});
local v5 = v1.PureComponent:extend("ViewportFrame");
v5.defaultProps = {
    cameraDistance = 6, 
    cameraUpVector = Vector3.FromAxis(Enum.Axis.Y)
};
v5.init = function(v6) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v6.viewportRef = v1.createRef();
    v6.model = nil;
    v6.camera = nil;
end;
v5.updateModel = function(v7) --[[ Line: 45 ]] --[[ Name: updateModel ]]
    if v7.model ~= nil then
        v7.model.Parent = nil;
        v7.model = nil;
    end;
    local l_modelRef_0 = v7.props.modelRef;
    if v7.viewportRef.current == nil or l_modelRef_0 == nil then
        return;
    else
        v7.model = l_modelRef_0.value;
        v7.model.Parent = v7.viewportRef.current;
        return;
    end;
end;
v5.updateCamera = function(v9) --[[ Line: 65 ]] --[[ Name: updateCamera ]]
    if v9.viewportRef.current == nil or v9.model == nil then
        return;
    else
        if v9.camera == nil then
            v9.camera = Instance.new("Camera");
            v9.camera.Name = "Camera";
            v9.camera.CameraType = Enum.CameraType.Scriptable;
            v9.camera.Parent = v9.viewportRef.current;
            v9.viewportRef.current.CurrentCamera = v9.camera;
        end;
        local v10 = v9.props.cameraFocusPoint or v9.model.PrimaryPart ~= nil and v9.model.PrimaryPart.Position or Vector3.new(0, 0, 0, 0);
        local v11 = (v9.props.cameraLookVector or v9.model.PrimaryPart ~= nil and -v9.model.PrimaryPart.CFrame.lookVector or Vector3.new(0, 0, 1, 0)) * v9.props.cameraDistance;
        local v12 = v10 - v11;
        v9.camera.CFrame = CFrame.fromMatrix(v12, v11:Cross(v9.props.cameraUpVector).Unit, v11:Cross(v9.props.cameraUpVector):Cross(v11).Unit);
        return;
    end;
end;
v5.updateViewport = function(v13) --[[ Line: 101 ]] --[[ Name: updateViewport ]]
    v13:updateModel();
    v13:updateCamera();
end;
v5.didMount = function(v14) --[[ Line: 106 ]] --[[ Name: didMount ]]
    v14:updateViewport();
end;
v5.willUnmount = function(v15) --[[ Line: 110 ]] --[[ Name: willUnmount ]]
    if v15.model ~= nil then
        v15.model.Parent = nil;
        v15.model = nil;
    end;
    if v15.camera ~= nil then
        v15.camera.Parent = nil;
        v15.camera = nil;
    end;
end;
v5.didUpdate = function(v16, v17) --[[ Line: 122 ]] --[[ Name: didUpdate ]]
    if v17.modelRef ~= v16.props.modelRef then
        v16:updateViewport();
        return;
    else
        if v17.cameraFocusPoint ~= v16.props.cameraFocusPoint or v17.cameraLookVector ~= v16.props.cameraLookVector or v17.cameraDistance ~= v16.props.cameraDistance then
            v16:updateCamera();
        end;
        return;
    end;
end;
v5.render = function(v18) --[[ Line: 134 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy)
    assert(v4(v18.props));
    local v19 = v18.props.regularProps or {};
    v19 = v2.Dictionary.join(v19, {
        [v1.Ref] = v18.viewportRef
    });
    return v1.createElement("ViewportFrame", v19);
end;
return v5;