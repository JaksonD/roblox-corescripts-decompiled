local l_Parent_0 = script.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_Parent_0.Properties);
local v7 = require(l_Parent_0.Interface);
local v8 = {};
local v9 = Vector2.new();
local v10 = Vector2.new();
local v11 = false;
local v12 = false;
local v13 = nil;
local _ = os.clock();
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = false;
local function v25(v19) --[[ Line: 29 ]] --[[ Name: processThumbstickInput ]]
    -- upvalues: v6 (copy)
    local v20 = 0;
    local v21 = 0;
    if v19.Magnitude >= v6.ThumbstickDeadzone then
        local v22 = math.atan2(v19.y, v19.x);
        local v23 = math.abs(math.cos(v22) * v6.ThumbstickDeadzone);
        local v24 = math.abs(math.sin(v22) * v6.ThumbstickDeadzone);
        v20 = math.max(math.abs(v19.x) - v23, 0) / (1 - v23) * math.sign(v19.x);
        v21 = math.max(math.abs(v19.y) - v24, 0) / (1 - v24) * math.sign(v19.y);
    end;
    return Vector2.new(v20, -v21);
end;
local function v29(_, v27, v28) --[[ Line: 42 ]] --[[ Name: onThumbstick2Input ]]
    -- upvalues: v10 (ref)
    if v27 == Enum.UserInputState.Change then
        v10 = Vector2.new(v28.Position.x, v28.Position.y * -1);
        return Enum.ContextActionResult.Sink;
    else
        v10 = Vector2.new();
        return Enum.ContextActionResult.Pass;
    end;
end;
local function _(v30) --[[ Line: 53 ]] --[[ Name: getRectCenter ]]
    return (v30.Min + v30.Max) / 2;
end;
local function v43(v32) --[[ Line: 57 ]] --[[ Name: processPreviewEnabled ]]
    -- upvalues: v12 (ref), v13 (ref), v7 (copy), l_GuiService_0 (copy), v17 (ref)
    if v32 and not v12 then
        if v13 then
            local l_v7_0 = v7;
            local l_SelectionRect2D_0 = v13.SelectionRect2D;
            l_v7_0:EnableUI((l_SelectionRect2D_0.Min + l_SelectionRect2D_0.Max) / 2);
        else
            local l_v7_1 = v7;
            local l_SelectionRect2D_1 = l_GuiService_0.SelectedObject.SelectionRect2D;
            l_v7_1:EnableUI((l_SelectionRect2D_1.Min + l_SelectionRect2D_1.Max) / 2);
        end;
        v12 = true;
    elseif not v32 and v12 then
        v7:DisableUI();
        v12 = false;
    end;
    if v17 then
        v17:Disconnect();
    end;
    if v12 and l_GuiService_0.SelectedObject then
        local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
        local l_l_SelectedObject_0_0 = l_SelectedObject_0 --[[ copy: 1 -> 5 ]];
        v17 = l_SelectedObject_0:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ Line: 78 ]]
            -- upvalues: l_l_SelectedObject_0_0 (copy), v12 (ref), v7 (ref)
            if l_l_SelectedObject_0_0 and v12 then
                local l_v7_2 = v7;
                local l_SelectionRect2D_2 = l_l_SelectedObject_0_0.SelectionRect2D;
                l_v7_2:TweenCursorPosition((l_SelectionRect2D_2.Min + l_SelectionRect2D_2.Max) / 2);
            end;
        end);
    end;
    if v32 then
        local l_v7_3 = v7;
        local l_SelectionRect2D_3 = l_GuiService_0.SelectedObject.SelectionRect2D;
        l_v7_3:TweenCursorPosition((l_SelectionRect2D_3.Min + l_SelectionRect2D_3.Max) / 2);
    end;
end;
local function v53() --[[ Line: 90 ]] --[[ Name: onThumbstick1Input ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy), v25 (copy), v18 (ref), v43 (copy), v12 (ref), v7 (copy), v17 (ref)
    if l_GuiService_0.SelectedObject then
        local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1);
        local l_zero_0 = Vector2.zero;
        for _, v47 in l_l_UserInputService_0_GamepadState_0 do
            if v47.KeyCode == Enum.KeyCode.Thumbstick1 then
                l_zero_0 = v25(v47.Position);
            end;
        end;
        if v18 and l_zero_0 == Vector2.zero then
            v18 = false;
        end;
        local l_v43_0 = v43;
        local v49 = false;
        if l_zero_0 ~= Vector2.zero then
            v49 = v18 and l_GuiService_0.SelectedCoreObject == nil;
        end;
        l_v43_0(v49);
        return;
    else
        if v12 then
            v7:DisableUI();
            v12 = false;
        end;
        if v17 then
            v17:Disconnect();
        end;
        if v12 and l_GuiService_0.SelectedObject then
            local l_SelectedObject_1 = l_GuiService_0.SelectedObject;
            v17 = l_SelectedObject_1:GetPropertyChangedSignal("SelectionRect2D"):Connect(function() --[[ Line: 78 ]]
                -- upvalues: l_SelectedObject_1 (copy), v12 (ref), v7 (ref)
                if l_SelectedObject_1 and v12 then
                    local l_v7_4 = v7;
                    local l_SelectionRect2D_4 = l_SelectedObject_1.SelectionRect2D;
                    l_v7_4:TweenCursorPosition((l_SelectionRect2D_4.Min + l_SelectionRect2D_4.Max) / 2);
                end;
            end);
        end;
        return;
    end;
end;
local function v54() --[[ Line: 115 ]] --[[ Name: onSelectedObjectChanged ]]
    -- upvalues: v18 (ref), v53 (copy), v13 (ref), l_GuiService_0 (copy)
    v18 = true;
    v53();
    v13 = l_GuiService_0.SelectedObject;
end;
l_UserInputService_0.InputBegan:Connect(function(v55) --[[ Line: 123 ]]
    -- upvalues: v11 (ref), l_GuiService_0 (copy), v7 (copy)
    if not v11 then
        return;
    else
        if v55.UserInputType == Enum.UserInputType.Gamepad1 and v55.KeyCode == Enum.KeyCode.ButtonA and (l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject) then
            v7:PlayCursorTweenActivate();
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v56) --[[ Line: 136 ]]
    -- upvalues: v11 (ref), v7 (copy), v53 (copy)
    if v11 then
        if v56.UserInputType == Enum.UserInputType.Gamepad1 and v56.KeyCode == Enum.KeyCode.ButtonA then
            v7:PlayCursorTweenDefault();
            return;
        end;
    elseif v56.UserInputType == Enum.UserInputType.Gamepad1 and v56.KeyCode == Enum.KeyCode.Thumbstick1 then
        v53();
    end;
end);
l_UserInputService_0.InputChanged:Connect(function(v57) --[[ Line: 152 ]]
    -- upvalues: v11 (ref), v53 (copy)
    if v11 then
        return;
    else
        if v57.UserInputType == Enum.UserInputType.Gamepad1 and v57.KeyCode == Enum.KeyCode.Thumbstick1 then
            v53();
        end;
        return;
    end;
end);
v8.GetThumbstickVector = function(_) --[[ Line: 163 ]] --[[ Name: GetThumbstickVector ]]
    -- upvalues: v9 (ref)
    return v9;
end;
v8.GetThumbstick2Vector = function(_) --[[ Line: 167 ]] --[[ Name: GetThumbstick2Vector ]]
    -- upvalues: v10 (ref)
    return v10;
end;
v8.EnablePreview = function(_) --[[ Line: 171 ]] --[[ Name: EnablePreview ]]
    -- upvalues: v15 (ref), l_GuiService_0 (copy), v54 (copy)
    v15 = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v54);
end;
v8.DisablePreview = function(_) --[[ Line: 176 ]] --[[ Name: DisablePreview ]]
    -- upvalues: v15 (ref)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
end;
v8.EnableInput = function(_) --[[ Line: 183 ]] --[[ Name: EnableInput ]]
    -- upvalues: v16 (ref), l_GamepadService_0 (copy), v9 (ref), v25 (copy), l_ContextActionService_0 (copy), v29 (copy), v11 (ref)
    v16 = l_GamepadService_0.GamepadThumbstick1Changed:Connect(function(v63) --[[ Line: 184 ]]
        -- upvalues: v9 (ref), v25 (ref)
        v9 = v25(v63);
    end);
    l_ContextActionService_0:BindCoreActionAtPriority("VirtualCursorThumbstick1Movement", function(_, _, _) --[[ Line: 190 ]]

    end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick1);
    l_ContextActionService_0:BindCoreActionAtPriority("VirtualCursorThumbstick2Movement", v29, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Thumbstick2);
    v11 = true;
end;
v8.DisableInput = function(_) --[[ Line: 207 ]] --[[ Name: DisableInput ]]
    -- upvalues: v16 (ref), v9 (ref), v10 (ref), l_ContextActionService_0 (copy), v11 (ref)
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    v9 = Vector2.new();
    v10 = Vector2.new();
    l_ContextActionService_0:UnbindCoreAction("VirtualCursorThumbstick1Movement");
    l_ContextActionService_0:UnbindCoreAction("VirtualCursorThumbstick2Movement");
    if Enum.UserInputState.Cancel == Enum.UserInputState.Change then
        v10 = Vector2.new((nil).Position.x, (nil).Position.y * -1);
        local _ = Enum.ContextActionResult.Sink;
    else
        v10 = Vector2.new();
        local _ = Enum.ContextActionResult.Pass;
    end;
    v11 = false;
end;
return v8;