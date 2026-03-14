local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_UIBlox_0 = v5.UIBlox;
local l_t_0 = v5.t;
local l_Otter_0 = v5.Otter;
local v10 = require(script.Parent.Connection.FocusHandler);
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v15 = require(l_Parent_0.Utility.divideTransparency);
local v16 = require(script.Parent.AssetImage);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v18 = {
    frequency = 5
};
local function v21(v19) --[[ Line: 43 ]] --[[ Name: isGamepad ]]
    local v20 = true;
    if v19 ~= Enum.UserInputType.Gamepad1 then
        v20 = true;
        if v19 ~= Enum.UserInputType.Gamepad2 then
            v20 = true;
            if v19 ~= Enum.UserInputType.Gamepad3 then
                v20 = true;
                if v19 ~= Enum.UserInputType.Gamepad4 then
                    v20 = true;
                    if v19 ~= Enum.UserInputType.Gamepad5 then
                        v20 = true;
                        if v19 ~= Enum.UserInputType.Gamepad6 then
                            v20 = true;
                            if v19 ~= Enum.UserInputType.Gamepad7 then
                                v20 = v19 == Enum.UserInputType.Gamepad8;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v20;
end;
local v22 = {};
local function v28() --[[ Line: 56 ]] --[[ Name: getInputObjects ]]
    -- upvalues: l_UserInputService_0 (copy), v21 (copy), v22 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if not v21(l_l_UserInputService_0_LastInputType_0) then
        return nil;
    else
        if v22[l_l_UserInputService_0_LastInputType_0] == nil then
            local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(l_l_UserInputService_0_LastInputType_0);
            local v25 = {};
            for _, v27 in ipairs(l_l_UserInputService_0_GamepadState_0) do
                v25[v27.KeyCode] = v27;
            end;
            v22[l_l_UserInputService_0_LastInputType_0] = v25;
        end;
        return v22[l_l_UserInputService_0_LastInputType_0];
    end;
end;
local v29 = l_Roact_0.PureComponent:extend("Slider");
v29.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    min = l_t_0.number, 
    max = l_t_0.number, 
    stepInterval = l_t_0.numberPositive, 
    value = l_t_0.number, 
    valueChanged = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    width = l_t_0.optional(l_t_0.UDim), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    NextSelectionRight = l_t_0.optional(l_t_0.table), 
    sliderDotRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}), function(v30) --[[ Line: 115 ]]
    if v30.min > v30.max then
        return false, "min must be less than or equal to max";
    elseif v30.value > v30.max or v30.value < v30.min then
        return false, "value must be within min and max";
    else
        return true;
    end;
end);
v29.defaultProps = {
    width = UDim.new(1, 0), 
    disabled = false
};
v29.init = function(v31) --[[ Line: 133 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_Otter_0 (copy)
    v31.state = {
        dragging = false, 
        hovering = false, 
        entryMode = false
    };
    v31.totalMoveTime = 0;
    v31.isFirstMove = true;
    v31.unhandledTime = 0;
    v31.rootButtonRef = l_Roact_0.createRef();
    v31.hoverRef = l_Roact_0.createRef();
    v31.hoverMotor = l_Otter_0.createSingleMotor(0);
    v31.hoverMotor:onStep(function(v32) --[[ Line: 148 ]]
        -- upvalues: v31 (copy)
        local l_current_0 = v31.hoverRef.current;
        if l_current_0 ~= nil then
            l_current_0.Size = UDim2.new(0, v32, 0, v32);
        end;
    end);
    v31.onInputBegan = function(_, v35) --[[ Line: 156 ]] --[[ Name: onInputBegan ]]
        -- upvalues: v31 (copy)
        if v31.props.disabled then
            return;
        else
            local l_UserInputType_0 = v35.UserInputType;
            if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                return;
            else
                local l_X_0 = v35.Position.X;
                v31:processDrag(l_X_0);
                v31:startListeningForDrag();
                return;
            end;
        end;
    end;
end;
v29.renderFocusHandler = function(v38) --[[ Line: 173 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), l_GuiService_0 (copy), l_RunService_0 (copy), v28 (copy), l_ContextActionService_0 (copy)
    return l_Roact_0.createElement(v10, {
        isFocused = v38.state.entryMode and v38.props.canCaptureFocus, 
        didFocus = function() --[[ Line: 177 ]] --[[ Name: didFocus ]]
            -- upvalues: l_GuiService_0 (ref), v38 (copy), l_RunService_0 (ref), v28 (ref), l_ContextActionService_0 (ref)
            l_GuiService_0.CoreGuiNavigationEnabled = false;
            v38.joystickListener = l_RunService_0.Heartbeat:Connect(function(v39) --[[ Line: 181 ]]
                -- upvalues: v38 (ref), v28 (ref)
                v38:onMoveStep(v39, (v28()));
            end);
            local l_value_0 = v38.props.value;
            l_ContextActionService_0:BindCoreAction("LeaveEntryMode", function(_, v42) --[[ Line: 190 ]]
                -- upvalues: v38 (ref), l_value_0 (copy)
                if v42 == Enum.UserInputState.End then
                    v38:setState({
                        entryMode = false
                    });
                    v38.props.valueChanged(l_value_0);
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end, 
        didBlur = function() --[[ Line: 200 ]] --[[ Name: didBlur ]]
            -- upvalues: v38 (copy), l_GuiService_0 (ref), l_ContextActionService_0 (ref)
            v38.joystickListener:Disconnect();
            l_GuiService_0.CoreGuiNavigationEnabled = true;
            l_ContextActionService_0:UnbindCoreAction("LeaveEntryMode");
            v38:setState({
                entryMode = false
            });
        end
    }) or nil;
end;
v29.renderWithSelectionCursor = function(v43, v44) --[[ Line: 209 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v16 (copy), v15 (copy), l_CursorKind_0 (copy)
    local l_min_0 = v43.props.min;
    local v46 = v43.props.max - l_min_0;
    local v47 = (v43.props.value - l_min_0) / v46;
    local v48 = math.abs(v47);
    local v49 = v47 / 2;
    local v50 = v43.state.entryMode and v43.props.canCaptureFocus;
    return l_withStyle_0(function(v51) --[[ Line: 220 ]]
        -- upvalues: l_Roact_0 (ref), l_ImageSetButton_0 (ref), v43 (copy), v16 (ref), v15 (ref), v49 (copy), v48 (copy), v47 (copy), v44 (copy), v50 (copy), l_CursorKind_0 (ref)
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            AnchorPoint = v43.props.AnchorPoint, 
            BackgroundTransparency = 1, 
            Image = "", 
            LayoutOrder = v43.props.LayoutOrder, 
            Position = v43.props.Position, 
            Size = UDim2.new(v43.props.width.Scale, v43.props.width.Offset, 0, 36), 
            [l_Roact_0.Ref] = v43.rootButtonRef, 
            [l_Roact_0.Event.InputBegan] = v43.onInputBegan, 
            Selectable = false
        }, {
            FocusHandler = v43:renderFocusHandler(), 
            Gutter = l_Roact_0.createElement(v16.Label, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                imageKey = "SliderCircle", 
                ImageColor3 = v51.Theme.UIMuted.Color, 
                ImageTransparency = v51.Theme.UIMuted.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, 4)
            }, {
                FilledGutter = l_Roact_0.createElement(v16.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderCircle", 
                    ImageColor3 = v51.Theme.ContextualPrimaryDefault.Color, 
                    ImageTransparency = v15(v51.Theme.ContextualPrimaryDefault.Transparency, v43.props.disabled and 2 or 1), 
                    Position = UDim2.new(v49, 0, 0.5, 0), 
                    Size = UDim2.new(v48, 0, 1, 0)
                })
            }), 
            DotTrack = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, -12, 1, 0), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ZIndex = 4, 
                Selectable = false
            }, {
                Dot = l_Roact_0.createElement(v16.Button, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderButton", 
                    Position = UDim2.new(v47, 0, 0.5, 0), 
                    Size = UDim2.new(0, 42, 0, 42), 
                    ImageTransparency = v43.props.disabled and 0.5 or 0, 
                    ZIndex = 2, 
                    SelectionImageObject = v44(v50 and l_CursorKind_0.SelectedKnob or l_CursorKind_0.UnselectedKnob), 
                    [l_Roact_0.Event.Activated] = function(_, v53) --[[ Line: 274 ]]
                        -- upvalues: v43 (ref)
                        if v53.KeyCode == Enum.KeyCode.ButtonA then
                            v43:setState({
                                entryMode = not v43.state.entryMode
                            });
                        end;
                    end, 
                    [l_Roact_0.Event.InputBegan] = function(v54, v55) --[[ Line: 281 ]]
                        -- upvalues: v43 (ref)
                        if v43.props.disabled then
                            return;
                        elseif v55.UserInputType == Enum.UserInputType.MouseMovement then
                            v43:setState({
                                hovering = true
                            });
                            return;
                        else
                            v43.onInputBegan(v54, v55);
                            return;
                        end;
                    end, 
                    [l_Roact_0.Event.InputEnded] = function(_, v57) --[[ Line: 294 ]]
                        -- upvalues: v43 (ref)
                        if v43.props.disabled then
                            return;
                        else
                            if v57.UserInputType == Enum.UserInputType.MouseMovement then
                                v43:setState({
                                    hovering = false
                                });
                            end;
                            return;
                        end;
                    end, 
                    [l_Roact_0.Ref] = v43.props.sliderDotRef, 
                    [l_Roact_0.Event.SelectionLost] = v43.props.onSelectionLost, 
                    [l_Roact_0.Event.SelectionGained] = v43.props.onSelectionGained, 
                    NextSelectionRight = v43.props.NextSelectionRight
                }), 
                HoverOverlay = l_Roact_0.createElement(v16.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderHover", 
                    Position = UDim2.new(v47, 0, 0.5, 0), 
                    Size = UDim2.new(0, 0, 0, 0), 
                    [l_Roact_0.Ref] = v43.hoverRef
                })
            })
        });
    end);
end;
v29.render = function(v58) --[[ Line: 323 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v59) --[[ Line: 324 ]]
        -- upvalues: v58 (copy)
        return v58:renderWithSelectionCursor(v59);
    end);
end;
v29.didMount = function(v60) --[[ Line: 329 ]] --[[ Name: didMount ]]
    local l_current_1 = v60.rootButtonRef.current;
    local v62 = nil;
    v62 = l_current_1.AncestryChanged:Connect(function() --[[ Line: 337 ]]
        -- upvalues: l_current_1 (copy), v62 (ref), v60 (copy)
        if not l_current_1:IsDescendantOf(game) then
            return;
        else
            v62:Disconnect();
            v60.canUseUserInputService = l_current_1:FindFirstAncestorWhichIsA("PluginGui") == nil;
            return;
        end;
    end);
    v60.hoverMotor:start();
end;
v29.didUpdate = function(v63) --[[ Line: 352 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Otter_0 (copy), v18 (copy)
    if v63.props.disabled then
        v63:stopListeningForDrag();
    end;
    local v64 = 0;
    if not v63.props.disabled and (v63.state.dragging or v63.state.hovering) then
        v64 = 42;
    end;
    v63.hoverMotor:setGoal(l_Otter_0.spring(v64, v18));
end;
v29.willUnmount = function(v65) --[[ Line: 365 ]] --[[ Name: willUnmount ]]
    v65.hoverMotor:stop();
    v65:disconnectDragEvents();
end;
v29.startListeningForDrag = function(v66) --[[ Line: 370 ]] --[[ Name: startListeningForDrag ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_current_2 = v66.rootButtonRef.current;
    if l_current_2 == nil then
        return;
    elseif v66.state.dragging then
        return;
    else
        if v66.canUseUserInputService then
            v66.moveConnection = l_UserInputService_0.InputChanged:Connect(function(v68) --[[ Line: 383 ]]
                -- upvalues: v66 (copy)
                if not v66.state.dragging then
                    return;
                else
                    local l_UserInputType_1 = v68.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return;
                    elseif v68.UserInputState ~= Enum.UserInputState.Change then
                        return;
                    else
                        v66:processDrag(v68.Position.X);
                        return;
                    end;
                end;
            end);
            v66.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v70) --[[ Line: 405 ]]
                -- upvalues: v66 (copy)
                local l_UserInputType_2 = v70.UserInputType;
                if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                    return;
                else
                    v66:stopListeningForDrag();
                    v66:processDrag(v70.Position.X);
                    return;
                end;
            end);
            v66.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 420 ]]
                -- upvalues: v66 (copy)
                v66:stopListeningForDrag();
            end);
        else
            local l_l_current_2_FirstAncestorWhichIsA_0 = l_current_2:FindFirstAncestorWhichIsA("PluginGui");
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.Name = "SliderPluginGuiInputCapturer";
            l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageButton_0.ZIndex = 100000;
            v66.moveConnection = l_ImageButton_0.MouseMoved:Connect(function(v74) --[[ Line: 440 ]]
                -- upvalues: v66 (copy)
                v66:processDrag(v74);
            end);
            v66.releaseConnection = l_ImageButton_0.MouseButton1Up:Connect(function(v75) --[[ Line: 444 ]]
                -- upvalues: v66 (copy)
                v66:stopListeningForDrag();
                v66:processDrag(v75);
            end);
            v66.focusLostConnection = l_ImageButton_0.MouseLeave:Connect(function(v76) --[[ Line: 449 ]]
                -- upvalues: v66 (copy)
                v66:stopListeningForDrag();
                v66:processDrag(v76);
            end);
            l_ImageButton_0.Parent = l_l_current_2_FirstAncestorWhichIsA_0;
            v66.inputCapturerButton = l_ImageButton_0;
        end;
        v66:setState({
            dragging = true
        });
        return;
    end;
end;
v29.processDrag = function(v77, v78) --[[ Line: 463 ]] --[[ Name: processDrag ]]
    local l_current_3 = v77.rootButtonRef.current;
    if l_current_3 == nil then
        return;
    else
        local l_min_1 = v77.props.min;
        local l_max_0 = v77.props.max;
        local l_stepInterval_0 = v77.props.stepInterval;
        local l_X_1 = l_current_3.AbsoluteSize.X;
        local v84 = math.floor((math.clamp(v78 - l_current_3.AbsolutePosition.X, 0, l_X_1) / l_X_1 * (l_max_0 - l_min_1) + l_min_1) / l_stepInterval_0 + 0.5) * l_stepInterval_0;
        if v84 ~= v77.props.value then
            v77.props.valueChanged(v84);
        end;
        return;
    end;
end;
v29.disconnectDragEvents = function(v85) --[[ Line: 486 ]] --[[ Name: disconnectDragEvents ]]
    if v85.moveConnection ~= nil then
        v85.moveConnection:Disconnect();
        v85.moveConnection = nil;
    end;
    if v85.releaseConnection ~= nil then
        v85.releaseConnection:Disconnect();
        v85.releaseConnection = nil;
    end;
    if v85.focusLostConnection ~= nil then
        v85.focusLostConnection:Disconnect();
        v85.focusLostConnection = nil;
    end;
    if v85.inputCapturerButton ~= nil then
        v85.inputCapturerButton:Destroy();
        v85.inputCapturerButton = nil;
    end;
end;
v29.stopListeningForDrag = function(v86) --[[ Line: 508 ]] --[[ Name: stopListeningForDrag ]]
    if not v86.state.dragging then
        return;
    else
        v86:disconnectDragEvents();
        v86:setState({
            dragging = false
        });
        return;
    end;
end;
v29.processGamepadInput = function(v87, v88, v89) --[[ Line: 520 ]] --[[ Name: processGamepadInput ]]
    local v90 = v87.props.stepInterval * v88;
    local v91 = math.max(math.min(v87.props.value + v90 * v89, v87.props.max), v87.props.min);
    if v91 ~= v87.props.value then
        v87.props.valueChanged(v91);
    end;
end;
v29.onMoveStep = function(v92, v93, v94) --[[ Line: 531 ]] --[[ Name: onMoveStep ]]
    local l_Position_0 = v94[Enum.KeyCode.Thumbstick1].Position;
    local v96 = l_Position_0.Magnitude > 0.2;
    local v97 = 0;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    v92.totalMoveTime = v92.totalMoveTime + v93;
    if v96 then
        v99 = l_Position_0.x > 0 and 1 or -1;
        v98 = 0.2;
        v100 = 12;
    else
        v99 = (v94[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (v94[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0);
        v98 = 0.5;
        v100 = 8;
    end;
    if v99 ~= 0 then
        if v92.isFirstMove then
            v92.isFirstMove = false;
            v92.totalMoveTime = 0;
            v92.unhandledTime = 0;
            v97 = 1;
        elseif v98 < v92.totalMoveTime then
            local v101 = v93 - math.max(v98 - v92.totalMoveTime - v93, 0) + v92.unhandledTime;
            v97 = math.floor(v100 * v101);
            v92.unhandledTime = v101 - v97 / v100;
        else
            v97 = 0;
            v92.unhandledTime = 0;
        end;
    else
        v92.totalMoveTime = 0;
        v92.isFirstMove = true;
    end;
    if v97 > 0 then
        v92:processGamepadInput(v99, v97);
    end;
end;
v29.getDerivedStateFromProps = function(v102) --[[ Line: 581 ]] --[[ Name: getDerivedStateFromProps ]]
    if not v102.isMenuOpen then
        return {
            entryMode = false
        };
    else
        return nil;
    end;
end;
return v29;