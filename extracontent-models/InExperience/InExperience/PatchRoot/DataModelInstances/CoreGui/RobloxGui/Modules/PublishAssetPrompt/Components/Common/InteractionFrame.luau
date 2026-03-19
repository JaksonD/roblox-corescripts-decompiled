local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local function _(v6) --[[ Line: 15 ]] --[[ Name: splitInputType ]]
    local v7 = v6.UserInputType == Enum.UserInputType.Touch;
    local v8 = v6.UserInputType == Enum.UserInputType.MouseButton1;
    local v9 = v6.UserInputType == Enum.UserInputType.MouseButton2;
    return v7, v8 or v9, v8, v9;
end;
local v11 = v4.PureComponent:extend("InteractionFrame");
v11.defaultProps = {
    Visible = true
};
v11.validateProps = v5.interface({
    panByPixels = v5.callback, 
    rotateByPixels = v5.callback, 
    setAngularVelocityByPixels = v5.callback, 
    zoomToPoint = v5.callback, 
    doubleTap = v5.optional(v5.callback), 
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2), 
    Visible = v5.optional(v5.boolean), 
    ZIndex = v5.optional(v5.number)
});
v11.disconnectEvents = function(v12) --[[ Line: 43 ]] --[[ Name: disconnectEvents ]]
    v12.inputChangedConnection:Disconnect();
    v12.inputEndedConnection:Disconnect();
    v12.renderSteppedConnection:Disconnect();
    v12.inputChangedConnection = nil;
    v12.inputEndedConnection = nil;
    v12.renderSteppedConnection = nil;
end;
v11.getActiveInput = function(v13, v14) --[[ Line: 52 ]] --[[ Name: getActiveInput ]]
    local v15 = v14.UserInputType == Enum.UserInputType.Touch;
    local v16 = v14.UserInputType == Enum.UserInputType.MouseButton1;
    local v17 = v14.UserInputType == Enum.UserInputType.MouseButton2;
    local v18 = v16 or v17;
    local l_v15_0 = v15;
    local l_v18_0 = v18;
    v16 = v14.UserInputType == Enum.UserInputType.MouseMovement or l_v18_0;
    if not v16 and not l_v15_0 then
        return;
    else
        v17 = nil;
        if v16 then
            return v13.activeMouseInput;
        else
            if l_v15_0 then
                v17 = v13.activeTouchInputs[v14];
            end;
            return v17;
        end;
    end;
end;
v11.removeActivePointerInput = function(v21, v22, v23) --[[ Line: 71 ]] --[[ Name: removeActivePointerInput ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v23 then
        if not (l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
            v21.activeMouseInput = nil;
        else
            return;
        end;
    else
        v21.activeTouchInputs[v22] = nil;
        v21.numActiveTouchInputs = v21.numActiveTouchInputs - 1;
    end;
    v21.numActiveInputs = v21.numActiveInputs - 1;
    if v21.numActiveInputs == 0 then
        v21:disconnectEvents();
    end;
end;
v11.handleDoubleTap = function(v24, v25, v26) --[[ Line: 94 ]] --[[ Name: handleDoubleTap ]]
    if v24.lastPrimaryPointerInputBeganPosition then
        local v27 = v24.lastPrimaryPointerInputBeganPosition - v25.Position;
        local v28 = v26 - v24.lastPrimaryPointerInputBeganTime;
        if v24.props.doubleTap and v27.Magnitude < 30 and v28 < 0.25 then
            v24.props.doubleTap();
        end;
    end;
    v24.lastPrimaryPointerInputBeganPosition = v25.Position;
    v24.lastPrimaryPointerInputBeganTime = v26;
end;
v11.addActivePointerInput = function(v29, v30, v31, v32) --[[ Line: 112 ]] --[[ Name: addActivePointerInput ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy)
    if v29:getActiveInput(v30) then
        return;
    else
        local v33 = {
            lastPosition = v30.Position, 
            lastTime = v32
        };
        if v31 then
            v29.activeMouseInput = v33;
        else
            v29.activeTouchInputs[v30] = v3.Dictionary.join(v33, {
                lastDeltaTime = 0, 
                lastDeltaPosition = Vector3.new(0, 0, 0, 0)
            });
            v29.numActiveTouchInputs = v29.numActiveTouchInputs + 1;
        end;
        v29.numActiveInputs = v29.numActiveInputs + 1;
        if v29.numActiveInputs == 1 then
            v29.props.setAngularVelocityByPixels(0);
            v29.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(v29.onInputChanged);
            v29.inputEndedConnection = l_UserInputService_0.InputEnded:Connect(v29.onInputEnded);
            v29.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(v29.setInputNotChanged);
        end;
        return;
    end;
end;
v11.init = function(v34) --[[ Line: 141 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy)
    v34.inputChangedConnection = nil;
    v34.inputEndedConnection = nil;
    v34.lastPinchDistance = 1;
    v34.lastPanTime = 0;
    v34.lastPrimaryPointerInputBeganTime = 0;
    v34.lastPrimaryPointerInputBeganPosition = nil;
    v34.activeTouchInputs = {};
    v34.numActiveTouchInputs = 0;
    v34.activeMouseInput = nil;
    v34.numActiveInputs = 0;
    v34.handleScroll = function(_, v36) --[[ Line: 156 ]]
        -- upvalues: v34 (copy), l_UserInputService_0 (ref)
        if v36.UserInputType == Enum.UserInputType.MouseWheel then
            local v37 = -v36.Position.Z;
            v34.props.zoomToPoint(v37, l_UserInputService_0:GetMouseLocation());
        end;
    end;
    v34.setInputNotChanged = function(_) --[[ Line: 163 ]]
        -- upvalues: v34 (copy)
        for _, v40 in v34.activeTouchInputs do
            v40.changedThisFrame = false;
        end;
    end;
    v34.onInputChanged = function(v41, _) --[[ Line: 169 ]]
        -- upvalues: v34 (copy), l_UserInputService_0 (ref)
        local v43 = v41.UserInputType == Enum.UserInputType.MouseMovement;
        local v44 = v41.UserInputType == Enum.UserInputType.Touch;
        if not (v43 or v44) then
            return;
        else
            local v45 = v34:getActiveInput(v41);
            if not v45 then
                return;
            else
                local v46 = tick();
                local v47 = v46 - v45.lastTime;
                local v48 = v41.Position - v45.lastPosition;
                local v49 = Vector2.new(v48.X, v48.Y) * Vector2.new(-1, 1);
                local v50 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
                local v51 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
                local v52 = v46 - v34.lastPanTime > 0.1;
                if (v43 and v50 or v44 and v34.numActiveTouchInputs == 1) and v52 then
                    v34.props.rotateByPixels(-v49);
                end;
                if v43 and v51 or v44 and v34.numActiveTouchInputs == 2 then
                    local v53 = v49 / v34.numActiveInputs;
                    v34.props.panByPixels(v53);
                    v34.lastPanTime = v46;
                end;
                v45.lastPosition = v41.Position;
                v45.lastTime = v46;
                if v44 then
                    if v45.changedThisFrame then
                        v45.lastDeltaPosition = v48 + v45.lastDeltaPosition;
                        v45.lastDeltaTime = v47 + v45.lastDeltaTime;
                        return;
                    else
                        v45.lastDeltaPosition = v48;
                        v45.lastDeltaTime = v47;
                        v45.changedThisFrame = true;
                    end;
                end;
                return;
            end;
        end;
    end;
    v34.onInputEnded = function(v54, _) --[[ Line: 221 ]]
        -- upvalues: v34 (copy)
        local v56 = v54.UserInputType == Enum.UserInputType.Touch;
        local v57 = v54.UserInputType == Enum.UserInputType.MouseButton1;
        local v58 = v54.UserInputType == Enum.UserInputType.MouseButton2;
        local v59 = v57 or v58;
        local l_v56_0 = v56;
        local l_v59_0 = v59;
        local l_v57_0 = v57;
        if not (l_v56_0 or l_v59_0) then
            return;
        else
            v57 = v34:getActiveInput(v54);
            if not v57 then
                return;
            else
                v58 = tick();
                v59 = v58 - v34.lastPanTime;
                local v63 = l_v56_0 and v57.changedThisFrame;
                local v64 = false;
                if v34.numActiveInputs == 1 then
                    v64 = v59 > 0.1;
                end;
                if (v63 or l_v57_0) and v64 then
                    local v65 = nil;
                    local v66 = nil;
                    if l_v57_0 then
                        v65 = v54.Position - v57.lastPosition;
                        v66 = v58 - v57.lastTime;
                    else
                        v65 = v57.lastDeltaPosition;
                        v66 = v57.lastDeltaTime;
                    end;
                    v34.props.setAngularVelocityByPixels(v65.X / v66);
                end;
                v34:removeActivePointerInput(v54, l_v59_0);
                return;
            end;
        end;
    end;
    v34.onInputBegan = function(v67, v68) --[[ Line: 259 ]]
        -- upvalues: v34 (copy)
        v34.handleScroll(v67, v68);
        local v69 = v68.UserInputType == Enum.UserInputType.Touch;
        local v70 = v68.UserInputType == Enum.UserInputType.MouseButton1;
        local v71 = v68.UserInputType == Enum.UserInputType.MouseButton2;
        local v72 = v70 or v71;
        local l_v69_0 = v69;
        local l_v72_0 = v72;
        local l_v70_0 = v70;
        if not (l_v69_0 or l_v72_0) then
            return;
        else
            v70 = l_v69_0 or l_v70_0;
            v71 = tick();
            if v70 then
                v34:handleDoubleTap(v68, v71);
            end;
            v34:addActivePointerInput(v68, l_v72_0, v71);
            return;
        end;
    end;
    v34.onTouchPinch = function(_, v77, _, _, v80) --[[ Line: 279 ]]
        -- upvalues: v34 (copy)
        if v77[2] == nil then
            return;
        elseif v80 == Enum.UserInputState.Begin then
            v34.lastPinchDistance = (v77[1] - v77[2]).Magnitude;
            return;
        else
            local l_Magnitude_0 = (v77[1] - v77[2]).Magnitude;
            local v82 = l_Magnitude_0 - v34.lastPinchDistance;
            v34.lastPinchDistance = l_Magnitude_0;
            v34.props.zoomToPoint(v82 * -0.05, (v77[1] + v77[2]) / 2);
            return;
        end;
    end;
end;
v11.willUnmount = function(v83) --[[ Line: 296 ]] --[[ Name: willUnmount ]]
    if v83.inputChangedConnection then
        v83:disconnectEvents();
    end;
end;
v11.render = function(v84) --[[ Line: 302 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    local l_Visible_0 = v84.props.Visible;
    local v86 = v84.props.Size or UDim2.new(1, 0, 1, 0);
    local l_Position_0 = v84.props.Position;
    local l_ZIndex_0 = v84.props.ZIndex;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v86, 
        Position = l_Position_0, 
        ZIndex = l_ZIndex_0, 
        Visible = l_Visible_0, 
        Active = true, 
        [v4.Event.InputBegan] = v84.onInputBegan, 
        [v4.Event.InputChanged] = v84.handleScroll, 
        [v4.Event.TouchPinch] = v84.onTouchPinch
    }, v84.props[v4.Children]);
end;
return v11;