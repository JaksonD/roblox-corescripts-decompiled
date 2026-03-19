local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_RunService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.RunService;
local function _(v7, v8) --[[ Line: 19 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v8.X;
    local l_Y_0 = v8.Y;
    local l_Z_0 = v8.Z;
    return math.max(l_X_0, l_Y_0, l_Z_0) * (1 / math.tan(math.rad(v7) / 2)) + l_Z_0 / 2;
end;
local function _(v13, v14, v15) --[[ Line: 29 ]] --[[ Name: rotateVectorAround ]]
    return CFrame.fromAxisAngle(v15, v14):VectorToWorldSpace(v13);
end;
local v17 = {
    rotationSpeed = 0.01, 
    fieldOfView = 70
};
return function(v18) --[[ Line: 44 ]] --[[ Name: ObjectViewport ]]
    -- upvalues: v5 (copy), v17 (copy), v4 (copy), v2 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local v19 = v5(v18, v17);
    local v20 = v4();
    local v21, v22 = v2.useState(v19.model);
    local v23 = v2.useRef(nil);
    local v24 = v2.useRef(nil);
    local v25, v26 = v2.useBinding(CFrame.new());
    local v27, v28 = v2.useBinding(0);
    local v29, v30 = v2.useState(CFrame.new());
    local v31, v32 = v2.useState((Vector3.new()));
    local v33, v34 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v24 (copy), v21 (copy)
        if v24.current and v21 ~= nil then
            v21.Parent = v24.current;
        end;
        return function() --[[ Line: 64 ]]
            -- upvalues: v21 (ref)
            if v21 ~= nil then
                v21.Parent = nil;
            end;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v21 (copy), v30 (copy), v32 (copy), v34 (copy), v19 (copy)
        if v21 ~= nil then
            local l_v21_ModelCFrame_0 = v21:GetModelCFrame();
            v30(l_v21_ModelCFrame_0);
            v32(l_v21_ModelCFrame_0.LookVector);
            local l_v21_ExtentsSize_0 = v21:GetExtentsSize();
            local l_v34_0 = v34;
            local l_fieldOfView_0 = v19.fieldOfView;
            local l_X_1 = l_v21_ExtentsSize_0.X;
            local l_Y_1 = l_v21_ExtentsSize_0.Y;
            local l_Z_1 = l_v21_ExtentsSize_0.Z;
            l_v34_0(math.max(l_X_1, l_Y_1, l_Z_1) * (1 / math.tan(math.rad(l_fieldOfView_0) / 2)) + l_Z_1 / 2);
        end;
    end, {
        v21
    });
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v21 (copy), v19 (copy), v24 (copy), v22 (copy)
        if v21 ~= nil then
            v21.Parent = nil;
        end;
        if v19.model ~= nil then
            v19.model.Parent = v24.current;
            v22(v19.model);
        end;
    end, {
        v19.model
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.fromScale(1, 1)
    }, {
        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v2.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 25, 1, 25), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = v20.Color.Extended.Gray.Gray_200.Color3, 
            LightDirection = Vector3.new(1, 1, 1, 0), 
            Ambient = v20.Color.Extended.Gray.Gray_200.Color3, 
            CurrentCamera = v23
        }, {
            Camera = v2.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = v19.fieldOfView, 
                CFrame = v25, 
                ref = v23
            }), 
            WorldModel = v2.createElement("WorldModel", {
                ref = v24
            }), 
            RenderSteppedConnection = v2.createElement(l_EventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = function() --[[ Line: 132 ]] --[[ Name: callback ]]
                    -- upvalues: v28 (copy), v27 (copy), v19 (copy), v31 (copy), v29 (copy), v33 (copy), v26 (copy)
                    v28(v27:getValue() + v19.rotationSpeed or 0);
                    local l_v31_0 = v31;
                    local v43 = v27:getValue();
                    local v44 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v43):VectorToWorldSpace(l_v31_0);
                    l_v31_0 = CFrame.new(v29.p + v44 * v33, v29.p);
                    v26(l_v31_0);
                end
            })
        })
    });
end;