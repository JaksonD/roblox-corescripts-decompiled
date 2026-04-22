local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v8 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = v8.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
local v12 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v12[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png";
    v12[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png";
    v12[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png";
    v12[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png";
end;
local v13 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v14 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12", 
    [Enum.KeyCode.PageUp] = "PgUp", 
    [Enum.KeyCode.PageDown] = "PgDn", 
    [Enum.KeyCode.Home] = "Home", 
    [Enum.KeyCode.End] = "End", 
    [Enum.KeyCode.Insert] = "Ins", 
    [Enum.KeyCode.Delete] = "Del"
};
local v15 = {
    [Enum.KeyCode.LeftControl] = 12, 
    [Enum.KeyCode.RightControl] = 12, 
    [Enum.KeyCode.LeftAlt] = 12, 
    [Enum.KeyCode.RightAlt] = 12, 
    [Enum.KeyCode.F10] = 12, 
    [Enum.KeyCode.F11] = 12, 
    [Enum.KeyCode.F12] = 12, 
    [Enum.KeyCode.PageUp] = 8, 
    [Enum.KeyCode.PageDown] = 8, 
    [Enum.KeyCode.Home] = 8, 
    [Enum.KeyCode.End] = 10, 
    [Enum.KeyCode.Insert] = 10, 
    [Enum.KeyCode.Delete] = 10
};
local v16 = Color3.new(0.07, 0.07, 0.07);
local v17 = Color3.new(1, 1, 1);
local v18 = Color3.new(0.7, 0.7, 0.7);
local v19 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local v20 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v21 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local function _() --[[ Line: 99 ]] --[[ Name: getScreenGui ]]
    -- upvalues: v11 (copy)
    local l_ProximityPrompts_0 = v11:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = v11;
        l_ProximityPrompts_0.IgnoreGuiInset = true;
    end;
    return l_ProximityPrompts_0;
end;
local function v31(v24, v25, v26, v27) --[[ Line: 112 ]] --[[ Name: createProgressBarGradient ]]
    -- upvalues: l_TweenService_0 (copy), v19 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(0.5, 1);
    l_Frame_0.Position = UDim2.fromScale(v25 and 0 or 0.5, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v24;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.fromScale(2, 1);
    l_ImageLabel_0.Position = UDim2.fromScale(v25 and 0 or -1, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    l_ImageLabel_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.5, 0), 
        NumberSequenceKeypoint.new(0.51, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Rotation = v25 and 180 or 0;
    l_UIGradient_0.Parent = l_ImageLabel_0;
    table.insert(v26, l_TweenService_0:Create(l_ImageLabel_0, v19, {
        ImageTransparency = 1
    }));
    table.insert(v27, l_TweenService_0:Create(l_ImageLabel_0, v19, {
        ImageTransparency = 0
    }));
    return l_UIGradient_0, l_Frame_0;
end;
local function v42(v32, v33) --[[ Line: 144 ]] --[[ Name: createCircularProgressBar ]]
    -- upvalues: v31 (copy)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "CircularProgressBar";
    l_Frame_1.Size = UDim2.fromOffset(58, 58);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    local v35, v36 = v31(l_Frame_1, true, v32, v33);
    local v37, v38 = v31(l_Frame_1, false, v32, v33);
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "Progress";
    l_NumberValue_0.Parent = l_Frame_1;
    l_NumberValue_0.Changed:Connect(function(v40) --[[ Line: 158 ]]
        -- upvalues: v36 (copy), l_NumberValue_0 (copy), v35 (copy), v38 (copy), v37 (copy)
        local v41 = math.clamp(v40 * 360, 0, 360);
        v36.Visible = l_NumberValue_0.Value > 0.5;
        v35.Rotation = math.clamp(v41, 180, 360);
        v38.Visible = l_NumberValue_0.Value > 0.01;
        v37.Rotation = math.clamp(v41, 0, 180);
    end);
    return l_Frame_1;
end;
local function v102(v43, v44, v45) --[[ Line: 169 ]] --[[ Name: createPrompt ]]
    -- upvalues: v16 (copy), l_TweenService_0 (copy), v21 (copy), l_AppFonts_0 (copy), v17 (copy), v18 (copy), v19 (copy), l_UserInputService_0 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v42 (copy), v20 (copy), l_RunService_0 (copy)
    local v46 = {};
    local v47 = {};
    local v48 = {};
    local v49 = {};
    local v50 = TweenInfo.new(v43.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "Prompt";
    l_BillboardGui_0.AlwaysOnTop = true;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.fromScale(0.5, 1);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BackgroundColor3 = v16;
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_2.Position = UDim2.fromScale(0.5, 0);
    l_Frame_2.Size = UDim2.fromScale(0, 1);
    l_Frame_2.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_2.Parent = l_BillboardGui_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Parent = l_Frame_2;
    Instance.new("UICorner").Parent = l_Frame_2;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "InputFrame";
    l_Frame_3.Size = UDim2.fromScale(1, 1);
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Size = UDim2.fromScale(1, 1);
    l_Frame_4.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_4.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_3;
    local l_UIScale_0 = Instance.new("UIScale");
    l_UIScale_0.Parent = l_Frame_4;
    local v57 = v44 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v46, l_TweenService_0:Create(l_UIScale_0, v21, {
        Scale = v57
    }));
    table.insert(v47, l_TweenService_0:Create(l_UIScale_0, v21, {
        Scale = 1
    }));
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionText";
    l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_0.TextSize = 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextTransparency = 1;
    l_TextLabel_0.TextColor3 = v17;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    table.insert(v46, l_TweenService_0:Create(l_TextLabel_0, v21, {
        TextTransparency = 1
    }));
    table.insert(v47, l_TweenService_0:Create(l_TextLabel_0, v21, {
        TextTransparency = 0
    }));
    table.insert(v48, l_TweenService_0:Create(l_TextLabel_0, v21, {
        TextTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_TextLabel_0, v21, {
        TextTransparency = 0
    }));
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "ObjectText";
    l_TextLabel_1.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.TextTransparency = 1;
    l_TextLabel_1.TextColor3 = v18;
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.Padding = UDim.new(-0.25, 0);
    l_UIListLayout_0.Parent = l_Frame_2;
    table.insert(v46, l_TweenService_0:Create(l_UIListLayout_0, v21, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v47, l_TweenService_0:Create(l_UIListLayout_0, v21, {
        Padding = UDim.new(0, 0)
    }));
    table.insert(v48, l_TweenService_0:Create(l_UIListLayout_0, v21, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v49, l_TweenService_0:Create(l_UIListLayout_0, v21, {
        Padding = UDim.new(0, 0)
    }));
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "TextFrame";
    l_Frame_5.Size = UDim2.fromScale(0, 1);
    l_Frame_5.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.Parent = l_Frame_2;
    l_TextLabel_0.Size = UDim2.fromScale(0, 1);
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.Parent = l_Frame_5;
    l_TextLabel_1.Size = UDim2.fromScale(0, 1);
    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_1.Parent = l_Frame_5;
    table.insert(v46, l_TweenService_0:Create(l_TextLabel_1, v21, {
        TextTransparency = 1
    }));
    table.insert(v47, l_TweenService_0:Create(l_TextLabel_1, v21, {
        TextTransparency = 0
    }));
    table.insert(v48, l_TweenService_0:Create(l_TextLabel_1, v21, {
        TextTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_TextLabel_1, v21, {
        TextTransparency = 0
    }));
    table.insert(v46, l_TweenService_0:Create(l_Frame_2, v21, {
        BackgroundTransparency = 1
    }));
    table.insert(v47, l_TweenService_0:Create(l_Frame_2, v21, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v48, l_TweenService_0:Create(l_Frame_2, v21, {
        BackgroundTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_Frame_2, v21, {
        BackgroundTransparency = 0.2
    }));
    local l_Frame_6 = Instance.new("Frame");
    l_Frame_6.Name = "RoundFrame";
    l_Frame_6.Size = UDim2.fromOffset(48, 48);
    l_Frame_6.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_6.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_6.BackgroundTransparency = 1;
    l_Frame_6.Parent = l_Frame_4;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.5, 0);
    l_UICorner_0.Parent = l_Frame_6;
    table.insert(v48, l_TweenService_0:Create(l_Frame_6, v19, {
        BackgroundTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_Frame_6, v19, {
        BackgroundTransparency = 0.5
    }));
    if v44 == Enum.ProximityPromptInputType.Gamepad then
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v43.GamepadKeyCode);
        if l_l_UserInputService_0_ImageForKeyCode_0 then
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "ButtonImage";
            l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_1.Size = UDim2.fromOffset(24, 24);
            l_ImageLabel_1.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.ImageTransparency = 1;
            l_ImageLabel_1.Image = l_l_UserInputService_0_ImageForKeyCode_0;
            l_ImageLabel_1.Parent = l_Frame_4;
            table.insert(v48, l_TweenService_0:Create(l_ImageLabel_1, v19, {
                ImageTransparency = 1
            }));
            table.insert(v49, l_TweenService_0:Create(l_ImageLabel_1, v19, {
                ImageTransparency = 0
            }));
        end;
    elseif v44 == Enum.ProximityPromptInputType.Touch then
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "ButtonImage";
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ImageTransparency = 1;
        l_ImageLabel_2.Size = UDim2.fromOffset(25, 31);
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ImageLabel_2.Parent = l_Frame_4;
        table.insert(v48, l_TweenService_0:Create(l_ImageLabel_2, v19, {
            ImageTransparency = 1
        }));
        table.insert(v49, l_TweenService_0:Create(l_ImageLabel_2, v19, {
            ImageTransparency = 0
        }));
    else
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "ButtonImage";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ImageTransparency = 1;
        l_ImageLabel_3.Size = UDim2.fromOffset(28, 30);
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_3.Image = "rbxasset://textures/ui/Controls/key_single.png";
        l_ImageLabel_3.Parent = l_Frame_4;
        table.insert(v48, l_TweenService_0:Create(l_ImageLabel_3, v19, {
            ImageTransparency = 1
        }));
        table.insert(v49, l_TweenService_0:Create(l_ImageLabel_3, v19, {
            ImageTransparency = 0
        }));
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v43.KeyboardKeyCode);
        local v69 = v12[v43.KeyboardKeyCode];
        if v69 == nil then
            v69 = v13[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v69 == nil then
            local v70 = v14[v43.KeyboardKeyCode];
            if v70 then
                l_l_UserInputService_0_StringForKeyCode_0 = v70;
            end;
        end;
        if v69 then
            local l_ImageLabel_4 = Instance.new("ImageLabel");
            l_ImageLabel_4.Name = "ButtonImage";
            l_ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_4.Size = UDim2.fromOffset(36, 36);
            l_ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_4.BackgroundTransparency = 1;
            l_ImageLabel_4.ImageTransparency = 1;
            l_ImageLabel_4.Image = v69;
            l_ImageLabel_4.Parent = l_Frame_4;
            table.insert(v48, l_TweenService_0:Create(l_ImageLabel_4, v19, {
                ImageTransparency = 1
            }));
            table.insert(v49, l_TweenService_0:Create(l_ImageLabel_4, v19, {
                ImageTransparency = 0
            }));
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "ButtonText";
            l_TextLabel_2.AutoLocalize = false;
            l_TextLabel_2.Position = UDim2.fromOffset(0, -1);
            l_TextLabel_2.Size = UDim2.fromScale(1, 1);
            l_TextLabel_2.Font = l_AppFonts_0.default:getMedium();
            local v73 = v15[v43.KeyboardKeyCode];
            if v73 == nil then
                v73 = 14;
            end;
            l_TextLabel_2.TextSize = v73;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.TextTransparency = 1;
            l_TextLabel_2.TextColor3 = v17;
            l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
            l_TextLabel_2.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_TextLabel_2.Parent = l_Frame_4;
            table.insert(v48, l_TweenService_0:Create(l_TextLabel_2, v19, {
                TextTransparency = 1
            }));
            table.insert(v49, l_TweenService_0:Create(l_TextLabel_2, v19, {
                TextTransparency = 0
            }));
        else
            error("ProximityPrompt '" .. v43.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v43.KeyboardKeyCode));
        end;
    end;
    if v44 == Enum.ProximityPromptInputType.Touch or v43.ClickablePrompt then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.TextTransparency = 1;
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.Parent = l_BillboardGui_0;
        l_TextButton_0.Selectable = false;
        local v75 = false;
        do
            local l_v75_0 = v75;
            l_TextButton_0.InputBegan:Connect(function(v77) --[[ Line: 399 ]]
                -- upvalues: v43 (copy), l_v75_0 (ref)
                if (v77.UserInputType == Enum.UserInputType.Touch or v77.UserInputType == Enum.UserInputType.MouseButton1) and v77.UserInputState ~= Enum.UserInputState.Change then
                    v43:InputHoldBegin();
                    l_v75_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v78) --[[ Line: 406 ]]
                -- upvalues: l_v75_0 (ref), v43 (copy)
                if (v78.UserInputType == Enum.UserInputType.Touch or v78.UserInputType == Enum.UserInputType.MouseButton1) and l_v75_0 then
                    l_v75_0 = false;
                    v43:InputHoldEnd();
                end;
            end);
            l_BillboardGui_0.Active = true;
        end;
    end;
    if v43.HoldDuration > 0 then
        local v79 = v42(v48, v49);
        v79.Parent = l_Frame_4;
        table.insert(v46, l_TweenService_0:Create(v79.Progress, v50, {
            Value = 1
        }));
        table.insert(v47, l_TweenService_0:Create(v79.Progress, v20, {
            Value = 0
        }));
    end;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    if v43.HoldDuration > 0 then
        v80 = v43.PromptButtonHoldBegan:Connect(function() --[[ Line: 431 ]]
            -- upvalues: v46 (copy)
            for _, v85 in ipairs(v46) do
                v85:Play();
            end;
        end);
        v81 = v43.PromptButtonHoldEnded:Connect(function() --[[ Line: 437 ]]
            -- upvalues: v47 (copy)
            for _, v87 in ipairs(v47) do
                v87:Play();
            end;
        end);
    end;
    v82 = v43.Triggered:Connect(function() --[[ Line: 444 ]]
        -- upvalues: v48 (copy)
        for _, v89 in ipairs(v48) do
            v89:Play();
        end;
    end);
    v83 = v43.TriggerEnded:Connect(function() --[[ Line: 450 ]]
        -- upvalues: v49 (copy)
        for _, v91 in ipairs(v49) do
            v91:Play();
        end;
    end);
    local function v95() --[[ Line: 456 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: v43 (copy), l_TextLabel_0 (copy), l_TextLabel_1 (copy), l_UIPadding_0 (copy), l_BillboardGui_0 (copy), l_RunService_0 (ref), l_Frame_2 (copy)
        local v92 = 72;
        local v93 = 24;
        local v94 = 0;
        if v43.ObjectText ~= nil and v43.ObjectText ~= "" then
            v94 = 9;
        end;
        l_TextLabel_0.Text = v43.ActionText;
        l_TextLabel_1.Text = v43.ObjectText;
        l_TextLabel_0.AutoLocalize = v43.AutoLocalize;
        l_TextLabel_0.RootLocalizationTable = v43.RootLocalizationTable;
        l_TextLabel_1.AutoLocalize = v43.AutoLocalize;
        l_TextLabel_1.RootLocalizationTable = v43.RootLocalizationTable;
        v93 = v93 - v94;
        if v43.ActionText ~= nil and v43.ActionText ~= "" or v43.ObjectText ~= nil and v43.ObjectText ~= "" then
            l_UIPadding_0.PaddingRight = UDim.new(0, v93);
        else
            l_UIPadding_0.PaddingRight = UDim.new(0, 0);
        end;
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, v94);
        l_TextLabel_1.Position = UDim2.new(0, 0, 0, -10);
        l_BillboardGui_0.Size = UDim2.fromOffset(v92, 72);
        l_BillboardGui_0.SizeOffset = Vector2.new(v43.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v43.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        task.defer(function() --[[ Line: 492 ]]
            -- upvalues: l_RunService_0 (ref), v92 (ref), l_Frame_2 (ref), l_BillboardGui_0 (ref), v43 (ref)
            l_RunService_0.RenderStepped:Wait();
            l_RunService_0.RenderStepped:Wait();
            v92 = l_Frame_2.AbsoluteSize.X;
            l_BillboardGui_0.Size = UDim2.fromOffset(v92, 72);
            l_BillboardGui_0.SizeOffset = Vector2.new(v43.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v43.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        end);
    end;
    local v96 = v43.Changed:Connect(v95);
    v95();
    l_BillboardGui_0.Adornee = v43.Parent;
    l_BillboardGui_0.Parent = v45;
    local v97 = v43.AncestryChanged:Connect(function() --[[ Line: 509 ]] --[[ Name: updateUIAncestry ]]
        -- upvalues: l_BillboardGui_0 (copy), v43 (copy)
        l_BillboardGui_0.Adornee = v43.Parent;
    end);
    for _, v99 in ipairs(v49) do
        v99:Play();
    end;
    return function() --[[ Line: 518 ]] --[[ Name: cleanup ]]
        -- upvalues: v80 (ref), v81 (ref), v82 (ref), v83 (ref), v96 (copy), v97 (copy), v48 (copy), l_BillboardGui_0 (copy)
        if v80 then
            v80:Disconnect();
        end;
        if v81 then
            v81:Disconnect();
        end;
        v82:Disconnect();
        v83:Disconnect();
        v96:Disconnect();
        v97:Disconnect();
        for _, v101 in ipairs(v48) do
            v101:Play();
        end;
        wait(0.2);
        l_BillboardGui_0.Parent = nil;
    end;
end;
local function v116(v103, v104) --[[ Line: 544 ]] --[[ Name: createIndicator ]]
    -- upvalues: v16 (copy), v17 (copy), l_TweenService_0 (copy), v19 (copy)
    local v105 = {};
    local v106 = {};
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    l_BillboardGui_1.Name = "Indicator";
    l_BillboardGui_1.Size = UDim2.fromOffset(15, 15);
    l_BillboardGui_1.AlwaysOnTop = true;
    local l_Frame_7 = Instance.new("Frame");
    l_Frame_7.Size = UDim2.fromScale(1, 1);
    l_Frame_7.BackgroundTransparency = 1;
    l_Frame_7.BackgroundColor3 = v16;
    l_Frame_7.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_7.Position = UDim2.fromScale(0.5, 0);
    l_Frame_7.Parent = l_BillboardGui_1;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(1, 0);
    l_UICorner_1.Parent = l_Frame_7;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Color = v17;
    l_UIStroke_0.Thickness = 1.5;
    l_UIStroke_0.Transparency = 1;
    l_UIStroke_0.Parent = l_Frame_7;
    table.insert(v105, l_TweenService_0:Create(l_Frame_7, v19, {
        BackgroundTransparency = 1
    }));
    table.insert(v105, l_TweenService_0:Create(l_UIStroke_0, v19, {
        Transparency = 1
    }));
    table.insert(v106, l_TweenService_0:Create(l_Frame_7, v19, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v106, l_TweenService_0:Create(l_UIStroke_0, v19, {
        Transparency = 0.2
    }));
    l_BillboardGui_1.Adornee = v103.Parent;
    l_BillboardGui_1.Parent = v104;
    local v111 = v103.AncestryChanged:Connect(function() --[[ Line: 579 ]] --[[ Name: updateUIAncestry ]]
        -- upvalues: l_BillboardGui_1 (copy), v103 (copy)
        l_BillboardGui_1.Adornee = v103.Parent;
    end);
    for _, v113 in ipairs(v106) do
        v113:Play();
    end;
    return function() --[[ Line: 588 ]] --[[ Name: cleanup ]]
        -- upvalues: v111 (copy), v105 (copy), l_BillboardGui_1 (copy)
        v111:Disconnect();
        for _, v115 in ipairs(v105) do
            v115:Play();
        end;
        wait(0.2);
        l_BillboardGui_1.Parent = nil;
    end;
end;
(function() --[[ Line: 603 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), v11 (copy), v102 (copy), v116 (copy)
    l_ProximityPromptService_0.PromptShown:Connect(function(v117, v118) --[[ Line: 604 ]]
        -- upvalues: v11 (ref), v102 (ref)
        if v117.Style == Enum.ProximityPromptStyle.Custom then
            return;
        else
            local l_ProximityPrompts_1 = v11:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = v11;
                l_ProximityPrompts_1.IgnoreGuiInset = true;
            end;
            l_ProximityPrompts_1 = v102(v117, v118, l_ProximityPrompts_1);
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v121 = v117.PromptHidden:Connect(function() --[[ Line: 615 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            local v122 = v117.Destroying:Connect(function() --[[ Line: 618 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            l_BindableEvent_0.Event:Wait();
            v121:Disconnect();
            v122:Disconnect();
            l_ProximityPrompts_1();
            return;
        end;
    end);
    l_ProximityPromptService_0.IndicatorShown:Connect(function(v123) --[[ Line: 628 ]]
        -- upvalues: v11 (ref), v116 (ref)
        if v123.Style == Enum.ProximityPromptStyle.Custom then
            return;
        else
            local l_ProximityPrompts_2 = v11:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_2 == nil then
                l_ProximityPrompts_2 = Instance.new("ScreenGui");
                l_ProximityPrompts_2.Name = "ProximityPrompts";
                l_ProximityPrompts_2.ResetOnSpawn = false;
                l_ProximityPrompts_2.Parent = v11;
                l_ProximityPrompts_2.IgnoreGuiInset = true;
            end;
            l_ProximityPrompts_2 = v116(v123, l_ProximityPrompts_2);
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            local v126 = v123.IndicatorHidden:Connect(function() --[[ Line: 639 ]]
                -- upvalues: l_BindableEvent_1 (copy)
                l_BindableEvent_1:Fire();
            end);
            local v127 = v123.Destroying:Connect(function() --[[ Line: 642 ]]
                -- upvalues: l_BindableEvent_1 (copy)
                l_BindableEvent_1:Fire();
            end);
            l_BindableEvent_1.Event:Wait();
            v126:Disconnect();
            v127:Disconnect();
            l_ProximityPrompts_2();
            return;
        end;
    end);
end)();