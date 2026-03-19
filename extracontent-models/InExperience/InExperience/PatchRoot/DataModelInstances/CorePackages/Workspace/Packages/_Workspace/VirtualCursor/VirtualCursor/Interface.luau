local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualCursor");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local _ = l_CoreGui_0.RobloxGui;
local v6 = require(l_script_FirstAncestor_0.Properties);
local l_getFFlagVirtualCursorDisplayOrder_0 = require(l_Parent_0.SharedFlags).getFFlagVirtualCursorDisplayOrder;
local v8 = {};
local v9 = {
    Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png", 
    Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png", 
    Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png", 
    Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
};
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = {
    Default = 2, 
    Activated = 1.7
};
local function v20(v18) --[[ Line: 45 ]] --[[ Name: getCursorSize ]]
    -- upvalues: v17 (copy), v6 (copy)
    local v19 = v17[v18] * v6.CursorRadius;
    return UDim2.fromOffset(v19, v19);
end;
local function _(v21) --[[ Line: 50 ]] --[[ Name: setCursorHighlight ]]
    -- upvalues: v11 (ref), v9 (copy)
    if v21 then
        v11.Image = v9.Hover;
        return;
    else
        v11.Image = v9.Default;
        return;
    end;
end;
local function _(v23) --[[ Line: 58 ]] --[[ Name: setCursorPosition ]]
    -- upvalues: v11 (ref)
    v11.Position = UDim2.fromOffset(v23.x, v23.y);
end;
local function v32() --[[ Line: 62 ]] --[[ Name: getOrCreateVirtualCursorContainer ]]
    -- upvalues: v10 (ref), l_getFFlagVirtualCursorDisplayOrder_0 (copy), v11 (ref), v17 (copy), v6 (copy), v9 (copy), l_CoreGui_0 (copy), v12 (ref), l_TweenService_0 (copy), v13 (ref)
    if v10 == nil then
        v10 = Instance.new("ScreenGui");
        v10.Enabled = false;
        v10.IgnoreGuiInset = true;
        v10.DisplayOrder = l_getFFlagVirtualCursorDisplayOrder_0() and 1e999 or 100;
        if l_getFFlagVirtualCursorDisplayOrder_0() then
            v10.OnTopOfCoreBlur = true;
        end;
        v10.Name = "VirtualCursorGui";
        v11 = Instance.new("ImageLabel");
        v11.Active = false;
        v11.AnchorPoint = Vector2.new(0.5, 0.5);
        local l_v11_0 = v11;
        local v26 = v17.Default * v6.CursorRadius;
        l_v11_0.Size = UDim2.fromOffset(v26, v26);
        v11.Image = v9.Default;
        v11.Visible = false;
        v11.BackgroundTransparency = 1;
        v11.Transparency = 1;
        v11.Parent = v10;
        v10.Parent = l_CoreGui_0;
        l_v11_0 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
        local l_l_TweenService_0_0 = l_TweenService_0;
        local l_v11_1 = v11;
        local l_l_v11_0_0 = l_v11_0;
        local v30 = {};
        local v31 = v17.Activated * v6.CursorRadius;
        v30.Size = UDim2.fromOffset(v31, v31);
        v12 = l_l_TweenService_0_0:Create(l_v11_1, l_l_v11_0_0, v30);
        l_l_TweenService_0_0 = l_TweenService_0;
        l_v11_1 = v11;
        l_l_v11_0_0 = l_v11_0;
        v30 = {};
        v31 = v17.Default * v6.CursorRadius;
        v30.Size = UDim2.fromOffset(v31, v31);
        v13 = l_l_TweenService_0_0:Create(l_v11_1, l_l_v11_0_0, v30);
    end;
    return v10;
end;
local function v35(v33) --[[ Line: 95 ]] --[[ Name: tweenCursorOpacity ]]
    -- upvalues: v16 (ref), v15 (ref), l_TweenService_0 (copy), v11 (ref), v32 (copy)
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    local v34 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    v15 = l_TweenService_0:Create(v11, v34, {
        ImageTransparency = v33 and 0 or 1
    });
    v16 = v15.Completed:Connect(function() --[[ Line: 104 ]]
        -- upvalues: v11 (ref), v33 (copy), v32 (ref)
        v11.Visible = v33;
        v32().Enabled = v33;
    end);
    v15:Play();
end;
local function v38(v36) --[[ Line: 112 ]] --[[ Name: tweenCursorPosition ]]
    -- upvalues: v14 (ref), l_TweenService_0 (copy), v11 (ref)
    local v37 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
    v14 = l_TweenService_0:Create(v11, v37, {
        Position = UDim2.fromOffset(v36.x, v36.y)
    });
    v14:Play();
end;
v8.GetCursorSize = function(_, v40) --[[ Line: 119 ]] --[[ Name: GetCursorSize ]]
    -- upvalues: v20 (copy)
    return v20(v40);
end;
v8.PlayCursorTweenActivate = function(_) --[[ Line: 123 ]] --[[ Name: PlayCursorTweenActivate ]]
    -- upvalues: v12 (ref)
    v12:Play();
end;
v8.PlayCursorTweenDefault = function(_) --[[ Line: 127 ]] --[[ Name: PlayCursorTweenDefault ]]
    -- upvalues: v13 (ref)
    v13:Play();
end;
v8.SetCursorHighlight = function(_, v44) --[[ Line: 131 ]] --[[ Name: SetCursorHighlight ]]
    -- upvalues: v11 (ref), v9 (copy)
    if v44 then
        v11.Image = v9.Hover;
        return;
    else
        v11.Image = v9.Default;
        return;
    end;
end;
v8.SetCursorPosition = function(_, v46) --[[ Line: 135 ]] --[[ Name: SetCursorPosition ]]
    -- upvalues: v11 (ref)
    v11.Position = UDim2.fromOffset(v46.x, v46.y);
end;
v8.TweenCursorPosition = function(_, v48) --[[ Line: 139 ]] --[[ Name: TweenCursorPosition ]]
    -- upvalues: v38 (copy)
    v38(v48);
end;
v8.TweenCursorOpacity = function(_, v50) --[[ Line: 143 ]] --[[ Name: TweenCursorOpacity ]]
    -- upvalues: v35 (copy)
    v35(v50);
end;
v8.SetArrow = function(_, v52, v53) --[[ Line: 147 ]] --[[ Name: SetArrow ]]
    -- upvalues: v11 (ref), v9 (copy)
    if v52 == -1 and v53 == 0 then
        v11.Rotation = 90;
    elseif v53 == 0 then
        v11.Rotation = 270;
    end;
    if v52 == 0 and v53 == 1 then
        v11.Rotation = 0;
    elseif v52 == 0 then
        v11.Rotation = 180;
    end;
    v11.Image = v9.Arrow;
end;
v8.EnableUI = function(_, v55) --[[ Line: 163 ]] --[[ Name: EnableUI ]]
    -- upvalues: l_VRService_0 (copy), v32 (copy), v11 (ref), v17 (copy), v6 (copy), v8 (copy)
    local v56 = not l_VRService_0.VREnabled;
    v32().Enabled = v56;
    local l_v11_2 = v11;
    local v58 = v17.Default * v6.CursorRadius;
    l_v11_2.Size = UDim2.fromOffset(v58, v58);
    v11.Position = UDim2.fromOffset(v55.x, v55.y);
    v11.Visible = v56;
    v8:TweenCursorOpacity(true);
end;
v8.DisableUI = function(_) --[[ Line: 174 ]] --[[ Name: DisableUI ]]
    -- upvalues: v11 (ref), v9 (copy), v8 (copy)
    v11.Image = v9.Default;
    v8:TweenCursorOpacity(false);
end;
return v8;