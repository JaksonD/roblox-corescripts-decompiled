local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualCursorModular");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_script_FirstAncestor_0.Properties);
local l_getFFlagVirtualCursorDisplayOrder_0 = require(l_Parent_0.SharedFlags).getFFlagVirtualCursorDisplayOrder;
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local v8 = {};
v8.__index = v8;
local v9 = {
    Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png", 
    Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png", 
    Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png", 
    Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
};
local v10 = {
    Default = 2, 
    Hover = 2, 
    Pressed = 1.7, 
    Arrow = 2
};
v8.new = function() --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: l_getFFlagVirtualCursorDisplayOrder_0 (copy), v10 (copy), v5 (copy), v9 (copy), l_game_EngineFeature_0 (copy), l_CoreGui_0 (copy), l_TweenService_0 (copy), v8 (copy)
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
    l_ImageLabel_0.Size = UDim2.fromOffset(v10.Default * v5.CursorRadius, v10.Default * v5.CursorRadius);
    l_ImageLabel_0.Image = v9.Default;
    l_ImageLabel_0.Visible = false;
    l_ImageLabel_0.BackgroundTransparency = 1;
    if not l_game_EngineFeature_0 then
        l_ImageLabel_0.Transparency = 1;
    end;
    l_ImageLabel_0.Parent = l_ScreenGui_0;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v13 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    local v14 = l_TweenService_0:Create(l_ImageLabel_0, v13, {
        Size = UDim2.fromOffset(v10.Pressed * v5.CursorRadius, v10.Pressed * v5.CursorRadius)
    });
    local v15 = l_TweenService_0:Create(l_ImageLabel_0, v13, {
        Size = UDim2.fromOffset(v10.Default * v5.CursorRadius, v10.Default * v5.CursorRadius)
    });
    return (setmetatable({
        _cursor = l_ImageLabel_0, 
        _cursorContainer = l_ScreenGui_0, 
        _activeSelectionTweenIn = v14, 
        _activeSelectionTweenOut = v15, 
        _activePreviewPositionTween = nil, 
        _activeOpacityTweenCompletedConnection = nil, 
        _enabled = false
    }, v8));
end;
v8.Destroy = function(v16) --[[ Line: 100 ]] --[[ Name: Destroy ]]
    v16._cursorContainer:Destroy();
    v16._activeSelectionTweenIn:Destroy();
    v16._activeSelectionTweenOut:Destroy();
    if v16._activePreviewPositionTween then
        v16._activePreviewPositionTween:Destroy();
    end;
    local l__activeOpacityTweenCompletedConnection_0 = v16._activeOpacityTweenCompletedConnection;
    if l__activeOpacityTweenCompletedConnection_0 then
        l__activeOpacityTweenCompletedConnection_0:Disconnect();
        v16._activeOpacityTweenCompletedConnection = nil;
    end;
end;
v8.SetCursorSize = function(v18, v19) --[[ Line: 117 ]] --[[ Name: SetCursorSize ]]
    -- upvalues: v10 (copy), v5 (copy)
    local v20 = v10[v19] * v5.CursorRadius;
    v18._cursor.Size = UDim2.fromOffset(v20, v20);
end;
v8.PlayTweenActivate = function(v21) --[[ Line: 122 ]] --[[ Name: PlayTweenActivate ]]
    v21._activeSelectionTweenIn:Play();
end;
v8.PlayTweenDefault = function(v22) --[[ Line: 126 ]] --[[ Name: PlayTweenDefault ]]
    v22._activeSelectionTweenOut:Play();
end;
v8.SetHighlight = function(v23, v24) --[[ Line: 130 ]] --[[ Name: SetHighlight ]]
    -- upvalues: v9 (copy)
    if v24 then
        v23._cursor.Image = v9.Hover;
        return;
    else
        v23._cursor.Image = v9.Default;
        return;
    end;
end;
v8.SetPosition = function(v25, v26) --[[ Line: 138 ]] --[[ Name: SetPosition ]]
    v25._cursor.Position = UDim2.fromOffset(v26.X, v26.Y);
end;
v8.GetCursorScreenGuiOffset = function(v27) --[[ Line: 142 ]] --[[ Name: GetCursorScreenGuiOffset ]]
    return v27._cursorContainer.AbsolutePosition;
end;
v8.TweenPosition = function(v28, v29) --[[ Line: 146 ]] --[[ Name: TweenPosition ]]
    -- upvalues: l_TweenService_0 (copy)
    local v30 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    v28._activePreviewPositionTween = l_TweenService_0:Create(v28._cursor, v30, {
        Position = UDim2.fromOffset(v29.X, v29.Y)
    });
    v28._activePreviewPositionTween:Play();
end;
v8.TweenOpacity = function(v31, v32) --[[ Line: 153 ]] --[[ Name: TweenOpacity ]]
    -- upvalues: l_TweenService_0 (copy)
    local l__activeOpacityTweenCompletedConnection_1 = v31._activeOpacityTweenCompletedConnection;
    if l__activeOpacityTweenCompletedConnection_1 then
        l__activeOpacityTweenCompletedConnection_1:Disconnect();
        v31._activeOpacityTweenCompletedConnection = nil;
    end;
    local v34 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    local v35 = l_TweenService_0:Create(v31._cursor, v34, {
        ImageTransparency = v32 and 0 or 1
    });
    v31._activeOpacityTweenCompletedConnection = v35.Completed:Connect(function() --[[ Line: 166 ]]
        -- upvalues: v31 (copy), v32 (copy)
        v31._cursor.Visible = v32;
        v31._cursorContainer.Enabled = v32;
    end);
    v35:Play();
end;
v8.SetArrow = function(v36, v37, v38) --[[ Line: 174 ]] --[[ Name: SetArrow ]]
    -- upvalues: v9 (copy)
    if v37 == -1 and v38 == 0 then
        v36._cursor.Rotation = 90;
    elseif v38 == 0 then
        v36._cursor.Rotation = 270;
    end;
    if v37 == 0 and v38 == 1 then
        v36._cursor.Rotation = 0;
    elseif v37 == 0 then
        v36._cursor.Rotation = 180;
    end;
    v36._cursor.Image = v9.Arrow;
end;
v8.GetEnabled = function(v39) --[[ Line: 190 ]] --[[ Name: GetEnabled ]]
    return v39._enabled;
end;
v8.Enable = function(v40, v41) --[[ Line: 194 ]] --[[ Name: Enable ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled then
        return;
    else
        local v42 = not l_VRService_0.VREnabled;
        v40._cursorContainer.Enabled = v42;
        v40:SetCursorSize("Default");
        v40:SetPosition(v41);
        v40._cursor.Visible = v42;
        v40:TweenOpacity(true);
        v40._enabled = true;
        return;
    end;
end;
v8.Disable = function(v43) --[[ Line: 210 ]] --[[ Name: Disable ]]
    v43:SetHighlight(false);
    v43:TweenOpacity(false);
    v43._enabled = false;
end;
return v8;