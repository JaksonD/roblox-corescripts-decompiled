local l_Parent_0 = script.Parent.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_Parent_0.Util);
local l_ProcessThumbstickInput_0 = v4.ProcessThumbstickInput;
local l_GetRectCenter_0 = v4.GetRectCenter;
local v7 = require(l_Parent_0.Enums);
local v8 = {};
v8.__index = v8;
v8.new = function(v9) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v8 (copy)
    return (setmetatable({
        _cursorController = v9, 
        _moveVector = Vector2.new(), 
        _scrollVector = Vector2.new(), 
        _enabled = false, 
        _behavior = v7.Behavior.SelectionPreview, 
        _previousSelection = nil, 
        _selectedObjectChangedConnection = nil, 
        _gamepadSelectionRect2DChangedConnection = nil, 
        _selectedRectChangedConnection = nil
    }, v8));
end;
v8.Destroy = function(v10) --[[ Line: 48 ]] --[[ Name: Destroy ]]
    if v10._selectedObjectChangedConnection then
        v10._selectedObjectChangedConnection:Disconnect();
    end;
    if v10._gamepadSelectionRect2DChangedConnection then
        v10._gamepadSelectionRect2DChangedConnection:Disconnect();
    end;
    if v10._selectedRectChangedConnection then
        v10._selectedRectChangedConnection:Disconnect();
    end;
end;
v8.OnMove = function(v11, _, v13) --[[ Line: 62 ]] --[[ Name: OnMove ]]
    -- upvalues: v7 (copy), l_GuiService_0 (copy), l_ProcessThumbstickInput_0 (copy), l_GetRectCenter_0 (copy)
    if v11._behavior ~= v7.Behavior.SelectionPreview then
        return Enum.ContextActionResult.Pass;
    elseif l_GuiService_0.SelectedObject == nil then
        return Enum.ContextActionResult.Pass;
    else
        if v13 then
            v11._moveVector = l_ProcessThumbstickInput_0(Vector2.new(v13.Position.X, v13.Position.Y));
        end;
        local v14 = true;
        if l_GuiService_0.SelectedCoreObject ~= nil then
            v14 = l_GuiService_0.SelectedObject ~= nil;
        end;
        local v15 = v11._moveVector ~= Vector2.zero;
        local v16 = v14 and v15;
        if v16 and not v11._cursorController:GetEnabled() then
            if v11._previousSelection then
                v11._cursorController:Enable(l_GetRectCenter_0(v11._previousSelection.SelectionRect2D));
            elseif l_GuiService_0.SelectedObject then
                v11._cursorController:Enable(l_GetRectCenter_0(l_GuiService_0.SelectedObject.SelectionRect2D));
            end;
        elseif not v16 and v11._cursorController:GetEnabled() then
            v11._cursorController:Disable();
        end;
        local l__selectedRectChangedConnection_0 = v11._selectedRectChangedConnection;
        if l__selectedRectChangedConnection_0 then
            l__selectedRectChangedConnection_0:Disconnect();
            v11._selectedRectChangedConnection = nil;
        end;
        if v16 and l_GuiService_0.SelectedObject then
            local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
            v11._selectedRectChangedConnection = l_SelectedObject_0:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ Line: 103 ]]
                -- upvalues: l_SelectedObject_0 (copy), v11 (copy), v7 (ref), l_GetRectCenter_0 (ref)
                if l_SelectedObject_0 and v11._behavior == v7.Behavior.SelectionPreview then
                    v11._cursorController:TweenPosition(l_GetRectCenter_0(l_SelectedObject_0.SelectionRect2D));
                end;
            end);
            v11._cursorController:TweenPosition(l_GetRectCenter_0(l_GuiService_0.SelectedObject.SelectionRect2D));
        end;
        return Enum.ContextActionResult.Pass;
    end;
end;
v8.OnScroll = function(v19, v20, v21) --[[ Line: 116 ]] --[[ Name: OnScroll ]]
    -- upvalues: v7 (copy)
    if v19._behavior == v7.Behavior.VirtualCursor then
        if v20 == Enum.UserInputState.Change and v21 then
            v19._scrollVector = Vector2.new(v21.Position.X, v21.Position.Y) * Vector2.new(1, -1);
            return Enum.ContextActionResult.Sink;
        else
            v19._scrollVector = Vector2.zero;
        end;
    end;
    return Enum.ContextActionResult.Pass;
end;
v8.OnActivate = function(v22, v23, _) --[[ Line: 129 ]] --[[ Name: OnActivate ]]
    -- upvalues: l_GuiService_0 (copy)
    if v23 == Enum.UserInputState.Begin then
        if l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject then
            v22._cursorController:PlayTweenActivate();
        end;
    elseif v23 == Enum.UserInputState.End and (l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject) then
        v22._cursorController:PlayTweenDefault();
    end;
    return Enum.ContextActionResult.Pass;
end;
v8.GetMoveVector = function(v25) --[[ Line: 143 ]] --[[ Name: GetMoveVector ]]
    return v25._moveVector;
end;
v8.GetScrollVector = function(v26) --[[ Line: 147 ]] --[[ Name: GetScrollVector ]]
    return v26._scrollVector;
end;
v8.SetBehavior = function(v27, v28) --[[ Line: 151 ]] --[[ Name: SetBehavior ]]
    -- upvalues: v7 (copy), l_ContextActionService_0 (copy), l_GamepadService_0 (copy), l_ProcessThumbstickInput_0 (copy), l_GuiService_0 (copy)
    local l__behavior_0 = v27._behavior;
    v27._behavior = v28;
    if l__behavior_0 == v7.Behavior.VirtualCursor then
        v27._moveVector = Vector2.new();
        v27._scrollVector = Vector2.new();
        l_ContextActionService_0:UnbindCoreAction(v7.Action.Activate);
        l_ContextActionService_0:UnbindCoreAction(v7.Action.Scroll);
        local l__gamepadThumbstick1ChangedConnection_0 = v27._gamepadThumbstick1ChangedConnection;
        if l__gamepadThumbstick1ChangedConnection_0 then
            l__gamepadThumbstick1ChangedConnection_0:Disconnect();
            v27._gamepadThumbstick1ChangedConnection = nil;
        end;
        v27:OnScroll(Enum.UserInputState.Cancel, nil);
    elseif l__behavior_0 == v7.Behavior.SelectionPreview then
        l_ContextActionService_0:UnbindCoreAction(v7.Action.Move);
        local l__selectedObjectChangedConnection_0 = v27._selectedObjectChangedConnection;
        if l__selectedObjectChangedConnection_0 then
            l__selectedObjectChangedConnection_0:Disconnect();
            v27._selectedObjectChangedConnection = nil;
        end;
        local l__selectedRectChangedConnection_1 = v27._selectedRectChangedConnection;
        if l__selectedRectChangedConnection_1 then
            l__selectedRectChangedConnection_1:Disconnect();
            v27._selectedRectChangedConnection = nil;
        end;
    end;
    if v27._behavior == v7.Behavior.VirtualCursor then
        l_ContextActionService_0:BindCoreActionAtPriority(v7.Action.Activate, function(_, v34, v35) --[[ Line: 188 ]]
            -- upvalues: v27 (copy)
            return v27:OnActivate(v34, v35);
        end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonA);
        l_ContextActionService_0:BindCoreActionAtPriority(v7.Action.Scroll, function(_, v37, v38) --[[ Line: 198 ]]
            -- upvalues: v27 (copy)
            return v27:OnScroll(v37, v38);
        end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2);
        v27._gamepadThumbstick1ChangedConnection = l_GamepadService_0.GamepadThumbstick1Changed:Connect(function(v39) --[[ Line: 206 ]]
            -- upvalues: v27 (copy), l_ProcessThumbstickInput_0 (ref)
            v27._moveVector = l_ProcessThumbstickInput_0(v39);
        end);
        return;
    else
        if v27._behavior == v7.Behavior.SelectionPreview then
            v27._selectedObjectChangedConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 210 ]]
                -- upvalues: v27 (copy), l_GuiService_0 (ref)
                v27:OnMove(Enum.UserInputState.Change, nil);
                v27._previousSelection = l_GuiService_0.SelectedObject;
            end);
            l_ContextActionService_0:BindCoreActionAtPriority(v7.Action.Move, function(_, v41, v42) --[[ Line: 217 ]]
                -- upvalues: v27 (copy)
                return v27:OnMove(v41, v42);
            end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1);
        end;
        return;
    end;
end;
return v8;