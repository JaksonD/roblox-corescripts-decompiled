local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualCursorModular");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_script_FirstAncestor_0.Properties);
local l_getFFlagVirtualCursorDisplayOrder_0 = require(l_Parent_0.SharedFlags).getFFlagVirtualCursorDisplayOrder;
local v7 = {};
v7.__index = v7;
local v8 = {
    Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png", 
    Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png", 
    Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png", 
    Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
};
local v9 = {
    Default = 2, 
    Hover = 2, 
    Pressed = 1.7, 
    Arrow = 2
};
v7.new = function() --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: l_getFFlagVirtualCursorDisplayOrder_0 (copy), v9 (copy), v5 (copy), v8 (copy), l_CoreGui_0 (copy), l_TweenService_0 (copy), v7 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.DisplayOrder = l_getFFlagVirtualCursorDisplayOrder_0() and 1e999 or 100;
    if l_getFFlagVirtualCursorDisplayOrder_0() then
        l_ScreenGui_0.OnTopOfCoreBlur = true;
    end;
    l_ScreenGui_0.Name = "CursorContainer";
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Active = false;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Size = UDim2.fromOffset(v9.Default * v5.CursorRadius, v9.Default * v5.CursorRadius);
    l_ImageLabel_0.Image = v8.Default;
    l_ImageLabel_0.Visible = false;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Transparency = 1;
    l_ImageLabel_0.Parent = l_ScreenGui_0;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v12 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    local v13 = l_TweenService_0:Create(l_ImageLabel_0, v12, {
        Size = UDim2.fromOffset(v9.Pressed * v5.CursorRadius, v9.Pressed * v5.CursorRadius)
    });
    local v14 = l_TweenService_0:Create(l_ImageLabel_0, v12, {
        Size = UDim2.fromOffset(v9.Default * v5.CursorRadius, v9.Default * v5.CursorRadius)
    });
    return (setmetatable({
        _cursor = l_ImageLabel_0, 
        _cursorContainer = l_ScreenGui_0, 
        _activeSelectionTweenIn = v13, 
        _activeSelectionTweenOut = v14, 
        _activePreviewPositionTween = nil, 
        _activeOpacityTweenCompletedConnection = nil, 
        _enabled = false
    }, v7));
end;
v7.Destroy = function(v15) --[[ Line: 97 ]] --[[ Name: Destroy ]]
    v15._cursorContainer:Destroy();
    v15._activeSelectionTweenIn:Destroy();
    v15._activeSelectionTweenOut:Destroy();
    if v15._activePreviewPositionTween then
        v15._activePreviewPositionTween:Destroy();
    end;
    local l__activeOpacityTweenCompletedConnection_0 = v15._activeOpacityTweenCompletedConnection;
    if l__activeOpacityTweenCompletedConnection_0 then
        l__activeOpacityTweenCompletedConnection_0:Disconnect();
        v15._activeOpacityTweenCompletedConnection = nil;
    end;
end;
v7.SetCursorSize = function(v17, v18) --[[ Line: 114 ]] --[[ Name: SetCursorSize ]]
    -- upvalues: v9 (copy), v5 (copy)
    local v19 = v9[v18] * v5.CursorRadius;
    v17._cursor.Size = UDim2.fromOffset(v19, v19);
end;
v7.PlayTweenActivate = function(v20) --[[ Line: 119 ]] --[[ Name: PlayTweenActivate ]]
    v20._activeSelectionTweenIn:Play();
end;
v7.PlayTweenDefault = function(v21) --[[ Line: 123 ]] --[[ Name: PlayTweenDefault ]]
    v21._activeSelectionTweenOut:Play();
end;
v7.SetHighlight = function(v22, v23) --[[ Line: 127 ]] --[[ Name: SetHighlight ]]
    -- upvalues: v8 (copy)
    if v23 then
        v22._cursor.Image = v8.Hover;
        return;
    else
        v22._cursor.Image = v8.Default;
        return;
    end;
end;
v7.SetPosition = function(v24, v25) --[[ Line: 135 ]] --[[ Name: SetPosition ]]
    v24._cursor.Position = UDim2.fromOffset(v25.X, v25.Y);
end;
v7.GetCursorScreenGuiOffset = function(v26) --[[ Line: 139 ]] --[[ Name: GetCursorScreenGuiOffset ]]
    return v26._cursorContainer.AbsolutePosition;
end;
v7.TweenPosition = function(v27, v28) --[[ Line: 143 ]] --[[ Name: TweenPosition ]]
    -- upvalues: l_TweenService_0 (copy)
    local v29 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    v27._activePreviewPositionTween = l_TweenService_0:Create(v27._cursor, v29, {
        Position = UDim2.fromOffset(v28.X, v28.Y)
    });
    v27._activePreviewPositionTween:Play();
end;
v7.TweenOpacity = function(v30, v31) --[[ Line: 150 ]] --[[ Name: TweenOpacity ]]
    -- upvalues: l_TweenService_0 (copy)
    local l__activeOpacityTweenCompletedConnection_1 = v30._activeOpacityTweenCompletedConnection;
    if l__activeOpacityTweenCompletedConnection_1 then
        l__activeOpacityTweenCompletedConnection_1:Disconnect();
        v30._activeOpacityTweenCompletedConnection = nil;
    end;
    local v33 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    local v34 = l_TweenService_0:Create(v30._cursor, v33, {
        ImageTransparency = v31 and 0 or 1
    });
    v30._activeOpacityTweenCompletedConnection = v34.Completed:Connect(function() --[[ Line: 163 ]]
        -- upvalues: v30 (copy), v31 (copy)
        v30._cursor.Visible = v31;
        v30._cursorContainer.Enabled = v31;
    end);
    v34:Play();
end;
v7.SetArrow = function(v35, v36, v37) --[[ Line: 171 ]] --[[ Name: SetArrow ]]
    -- upvalues: v8 (copy)
    if v36 == -1 and v37 == 0 then
        v35._cursor.Rotation = 90;
    elseif v37 == 0 then
        v35._cursor.Rotation = 270;
    end;
    if v36 == 0 and v37 == 1 then
        v35._cursor.Rotation = 0;
    elseif v36 == 0 then
        v35._cursor.Rotation = 180;
    end;
    v35._cursor.Image = v8.Arrow;
end;
v7.GetEnabled = function(v38) --[[ Line: 187 ]] --[[ Name: GetEnabled ]]
    return v38._enabled;
end;
v7.Enable = function(v39, v40) --[[ Line: 191 ]] --[[ Name: Enable ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled then
        return;
    else
        local v41 = not l_VRService_0.VREnabled;
        v39._cursorContainer.Enabled = v41;
        v39:SetCursorSize("Default");
        v39:SetPosition(v40);
        v39._cursor.Visible = v41;
        v39:TweenOpacity(true);
        v39._enabled = true;
        return;
    end;
end;
v7.Disable = function(v42) --[[ Line: 207 ]] --[[ Name: Disable ]]
    v42:SetHighlight(false);
    v42:TweenOpacity(false);
    v42._enabled = false;
end;
return v7;