local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.CharacterModelPool);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = require(l_Parent_0.Flags.FFlagEnableNewAvatarViewportProps);
local v12 = v5.PureComponent:extend("AvatarViewport");
v12.init = function(v13) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v13.viewportFrameRef = v5.createRef();
    v13.worldModelRef = v5.createRef();
    v13.connections = {};
    v13.xRotation = 0;
    v13.yRotation = 0;
    v13.rotationDeltaX = 0;
    v13.rotationDeltaY = 0;
    v13.mouseOrTouchDown = false;
    v13.delta = 0;
    v13.keys = {};
    v13.lastPosition = Vector3.new(0, 0, 0, 0);
    v13.viewportCamera = Instance.new("Camera");
    v13.viewportCamera.CameraType = Enum.CameraType.Scriptable;
    v13.model = v13.props.model;
    v13.lastInputTime = 2;
    v13.initialHrpPosition = v13.props.model ~= nil and v13.props.model.HumanoidRootPart.Position or nil;
end;
v12.didMount = function(v14) --[[ Line: 42 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    if v14.props.humanoidDescription and v14.model then
        v14.viewportCamera.Parent = v14.viewportFrameRef.current;
        v14.viewportFrameRef.current.CurrentCamera = v14.viewportCamera;
        v14:setRotation();
        local l_RigType_0 = v14.model.Humanoid.RigType;
        v14.characterModelPool = v9.new(v14.worldModelRef, v14.initialHrpPosition, l_RigType_0);
    end;
    v14.isMounted = true;
    v14:handleSpin();
    v14:setUpGamepad();
end;
v12.didUpdate = function(v16, v17, _) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
    -- upvalues: v11 (copy)
    if v16.props.visible and v16.props.humanoidDescription ~= v17.humanoidDescription and v16.model then
        if v11 and v16.props.resetCameraAndAutoRotationOnModelChange then
            v16.xRotation = 0;
            v16.yRotation = 0;
            if not v16.props.disableAutoRotation then
                v16.lastInputTime = tick();
            end;
        end;
        coroutine.wrap(function() --[[ Line: 68 ]]
            -- upvalues: v16 (copy)
            v16.characterModelPool:maybeUpdateCharacter(v16.props.humanoidDescription);
        end)();
    end;
    v16.gamepadRotating = false;
    v16.viewportCamera.Parent = v16.viewportFrameRef.current;
    v16.viewportFrameRef.current.CurrentCamera = v16.viewportCamera;
    if v16.props.gamepadEnabled ~= v17.gamepadEnabled then
        if v16.props.gamepadEnabled then
            v16:setUpGamepad();
            return;
        else
            v16:unbindActions();
        end;
    end;
end;
v12.setRotation = function(v19) --[[ Line: 87 ]] --[[ Name: setRotation ]]
    -- upvalues: v11 (copy)
    local l_model_0 = v19.model;
    if l_model_0 then
        local l_HumanoidRootPart_0 = l_model_0.HumanoidRootPart;
        local v22 = v19.initialHrpPosition or l_HumanoidRootPart_0.Position;
        local v23 = nil;
        if v11 and v19.props.offsetOptions then
            v23 = v19.props.offsetOptions.defaultCameraOffset;
            if v19.model:FindFirstChildOfClass("Tool") then
                v23 = v19.props.offsetOptions.toolOffset;
            end;
        else
            local l_view_0 = v19.props.view;
            local v25 = nil;
            v25 = v19.props.views[l_view_0];
            v23 = v25.DefaultCameraOffset;
            if v19.model:FindFirstChildOfClass("Tool") then
                v23 = v25.ToolOffset;
            end;
        end;
        local l_p_0 = (CFrame.new(v22) * CFrame.Angles(0, -v19.yRotation, 0) * CFrame.Angles(v19.xRotation, 0, 0) * v23).p;
        v19.viewportCamera.CFrame = CFrame.new(l_p_0, v22);
        if v11 and v19.props.cameraFieldOfView then
            v19.viewportCamera.FieldOfView = v19.props.cameraFieldOfView;
        end;
    end;
end;
v12.render = function(v27) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v8 (copy), v11 (copy), l_UserInputService_0 (copy)
    local l_size_0 = v27.props.size;
    local l_position_0 = v27.props.position;
    local l_visible_0 = v27.props.visible;
    local l_backgroundTransparency_0 = v27.props.backgroundTransparency;
    local l_setScrollingEnabled_0 = v27.props.setScrollingEnabled;
    return v5.createElement("ViewportFrame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = l_position_0, 
        Size = l_size_0, 
        BackgroundTransparency = l_backgroundTransparency_0, 
        BackgroundColor3 = v8.Graphite, 
        BorderSizePixel = 0, 
        Active = true, 
        Visible = l_visible_0, 
        [v5.Ref] = v27.viewportFrameRef, 
        [v5.Event.InputBegan] = function(_, v34) --[[ Line: 145 ]]
            -- upvalues: v27 (copy), v11 (ref), l_setScrollingEnabled_0 (copy), l_UserInputService_0 (ref)
            if v34.UserInputState == Enum.UserInputState.Begin then
                v27.mouseOrTouchDown = true;
                v27.lastPosition = v34.Position;
                if v11 then
                    if l_setScrollingEnabled_0 then
                        l_setScrollingEnabled_0(false);
                    end;
                else
                    l_setScrollingEnabled_0(false);
                end;
                local v38 = l_UserInputService_0.InputChanged:connect(function(v35, _) --[[ Line: 159 ]]
                    -- upvalues: v27 (ref)
                    if v35.UserInputType == Enum.UserInputType.MouseMovement and v27.mouseOrTouchDown or v35.UserInputType == Enum.UserInputType.Touch then
                        local v37 = v35.Position - v27.lastPosition;
                        v27.lastPosition = v35.Position;
                        v27.yRotation = v27.yRotation + v37.x * 0.0065;
                        v27.xRotation = v27.xRotation + v37.y * 0.0065;
                        v27.lastInputTime = tick();
                    end;
                end);
                local v41 = l_UserInputService_0.InputEnded:connect(function(v39, _) --[[ Line: 172 ]]
                    -- upvalues: v27 (ref), v11 (ref), l_setScrollingEnabled_0 (ref)
                    if v39.UserInputType == Enum.UserInputType.MouseButton1 or v39.UserInputType == Enum.UserInputType.Touch then
                        if v27.mouseOrTouchDown then
                            v27.mouseOrTouchDown = false;
                            v27.lastInputTime = tick();
                            v27:removeConnections();
                        end;
                        if v11 then
                            if l_setScrollingEnabled_0 then
                                l_setScrollingEnabled_0(true);
                                return;
                            end;
                        else
                            l_setScrollingEnabled_0(true);
                        end;
                    end;
                end);
                table.insert(v27.connections, v38);
                table.insert(v27.connections, v41);
            end;
        end
    }, {
        WorldModel = v5.createElement("WorldModel", {
            [v5.Ref] = v27.worldModelRef
        })
    });
end;
v12.handleSpin = function(v42) --[[ Line: 207 ]] --[[ Name: handleSpin ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy)
    local v43 = false;
    spawn(function() --[[ Line: 209 ]]
        -- upvalues: v42 (copy), v11 (ref), v43 (ref), l_RunService_0 (ref)
        local v44 = false;
        while v42.isMounted do
            if tick() - v42.lastInputTime > 2 and not v42.mouseOrTouchDown and not v42.gamepadRotating then
                if not v11 or not v42.props.disableAutoRotation then
                    v43 = true;
                end;
            else
                v43 = false;
            end;
            local function _(v45, v46) --[[ Line: 224 ]] --[[ Name: returnToDefaultPosition ]]
                v45 = v45 % 6.283185307179586;
                if v45 > 3.141592653589793 then
                    v45 = v45 + v46;
                    if v45 > 6.283185307179586 then
                        return 0;
                    end;
                else
                    v45 = v45 - v46;
                    if v45 < 0 then
                        return 0;
                    end;
                end;
                return v45;
            end;
            if v43 then
                local l_v42_0 = v42;
                local v49 = v42.xRotation % 6.283185307179586;
                local v50;
                if v49 > 3.141592653589793 then
                    v49 = v49 + 0.03490658503988659;
                    if v49 > 6.283185307179586 then
                        v50 = 0;
                        v44 = true;
                    end;
                else
                    v49 = v49 - 0.03490658503988659;
                    if v49 < 0 then
                        v50 = 0;
                        v44 = true;
                    end;
                end;
                if not v44 then
                    if not v44 then
                        v50 = v49;
                    end;
                end;
                v44 = false;
                l_v42_0.xRotation = v50;
                v42.yRotation = v42.yRotation + 0.012217304763960306;
            elseif v42.gamepadRotating then
                v42.yRotation = v42.yRotation + v42.delta * v42.rotationDeltaY;
                v42.xRotation = v42.xRotation + v42.delta * v42.rotationDeltaX;
            end;
            v42:setRotation();
            v42.delta = l_RunService_0.RenderStepped:wait();
        end;
    end);
end;
v12.setUpGamepad = function(v51) --[[ Line: 254 ]] --[[ Name: setUpGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_ContextActionService_0 (copy)
    if l_UserInputService_0.GamepadEnabled then
        local v52 = Vector2.new(0, 0);
        l_ContextActionService_0:UnbindCoreAction("RotateModel");
        do
            local l_v52_0 = v52;
            l_ContextActionService_0:BindCoreAction("RotateModel", function(_, v55, v56) --[[ Line: 259 ]]
                -- upvalues: l_v52_0 (ref), v51 (copy)
                if v55 == Enum.UserInputState.Change then
                    l_v52_0 = v56.Position or l_v52_0;
                    l_v52_0 = Vector2.new(l_v52_0.X, l_v52_0.Y);
                    if math.abs(l_v52_0.X) > 0.2 or math.abs(l_v52_0.Y) > 0.2 then
                        v51.lastInputTime = tick();
                        v51.gamepadRotating = true;
                        v51.rotationDeltaY = 3 * l_v52_0.X;
                        v51.rotationDeltaX = 3 * l_v52_0.Y;
                    else
                        v51.gamepadRotating = false;
                    end;
                end;
                return Enum.ContextActionResult.Sink;
            end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA);
        end;
    end;
end;
v12.unbindActions = function(_) --[[ Line: 278 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("RotateModel");
end;
v12.removeConnections = function(v58) --[[ Line: 282 ]] --[[ Name: removeConnections ]]
    for _, v60 in pairs(v58.connections) do
        v60:disconnect();
    end;
end;
v12.willUnmount = function(v61) --[[ Line: 288 ]] --[[ Name: willUnmount ]]
    v61.isMounted = false;
    if v61.characterModelPool then
        v61.characterModelPool:onDestroy();
    end;
    v61:unbindActions();
    v61:removeConnections();
end;
return v6.UNSTABLE_connect2(function(v62, _) --[[ Line: 307 ]]
    return {
        view = v62.view, 
        tryingOnInfo = v62.tryingOnInfo, 
        gamepadEnabled = v62.gamepadEnabled
    };
end)(function(v64) --[[ Line: 298 ]] --[[ Name: AvatarViewportWrapper ]]
    -- upvalues: v5 (copy), v10 (copy), v7 (copy), v12 (copy)
    return v5.createElement(v10.Consumer, {
        render = function(v65) --[[ Line: 300 ]] --[[ Name: render ]]
            -- upvalues: v7 (ref), v64 (copy), v5 (ref), v12 (ref)
            local v66 = v7.Dictionary.join(v64, {
                views = v65
            });
            return v5.createElement(v12, v66);
        end
    });
end);