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
local v10 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAutomaticSizeVerticalOffsetWidthFix);
game:DefineFastFlag("EnableProximityPromptIndicatorGui", false);
local function _() --[[ Line: 17 ]]
    return game:GetEngineFeature("ProximityPromptIndicators") and game:GetFastFlag("EnableProximityPromptIndicatorGui");
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v13 = v8.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
local v14 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
    v14[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png";
    v14[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png";
    v14[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png";
    v14[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png";
end;
local v15 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v16 = {
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
local v17 = {
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
local v18 = Color3.new(0.07, 0.07, 0.07);
local v19 = Color3.new(1, 1, 1);
local v20 = Color3.new(0.7, 0.7, 0.7);
local v21 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local v22 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v23 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local function _() --[[ Line: 107 ]] --[[ Name: getScreenGui ]]
    -- upvalues: v13 (copy)
    local l_ProximityPrompts_0 = v13:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = v13;
        l_ProximityPrompts_0.IgnoreGuiInset = true;
    end;
    return l_ProximityPrompts_0;
end;
local function v33(v26, v27, v28, v29) --[[ Line: 120 ]] --[[ Name: createProgressBarGradient ]]
    -- upvalues: l_TweenService_0 (copy), v21 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(0.5, 1);
    l_Frame_0.Position = UDim2.fromScale(v27 and 0 or 0.5, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v26;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.fromScale(2, 1);
    l_ImageLabel_0.Position = UDim2.fromScale(v27 and 0 or -1, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    l_ImageLabel_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.5, 0), 
        NumberSequenceKeypoint.new(0.51, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Rotation = v27 and 180 or 0;
    l_UIGradient_0.Parent = l_ImageLabel_0;
    table.insert(v28, l_TweenService_0:Create(l_ImageLabel_0, v21, {
        ImageTransparency = 1
    }));
    table.insert(v29, l_TweenService_0:Create(l_ImageLabel_0, v21, {
        ImageTransparency = 0
    }));
    return l_UIGradient_0, l_Frame_0;
end;
local function v44(v34, v35) --[[ Line: 152 ]] --[[ Name: createCircularProgressBar ]]
    -- upvalues: v33 (copy)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "CircularProgressBar";
    l_Frame_1.Size = UDim2.fromOffset(58, 58);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    local v37, v38 = v33(l_Frame_1, true, v34, v35);
    local v39, v40 = v33(l_Frame_1, false, v34, v35);
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "Progress";
    l_NumberValue_0.Parent = l_Frame_1;
    l_NumberValue_0.Changed:Connect(function(v42) --[[ Line: 166 ]]
        -- upvalues: v38 (copy), l_NumberValue_0 (copy), v37 (copy), v40 (copy), v39 (copy)
        local v43 = math.clamp(v42 * 360, 0, 360);
        v38.Visible = l_NumberValue_0.Value > 0.5;
        v37.Rotation = math.clamp(v43, 180, 360);
        v40.Visible = l_NumberValue_0.Value > 0.01;
        v39.Rotation = math.clamp(v43, 0, 180);
    end);
    return l_Frame_1;
end;
local function v104(v45, v46, v47) --[[ Line: 177 ]] --[[ Name: createPrompt ]]
    -- upvalues: v18 (copy), l_TweenService_0 (copy), v23 (copy), l_AppFonts_0 (copy), v19 (copy), v20 (copy), v21 (copy), l_UserInputService_0 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v44 (copy), v22 (copy), v10 (copy), l_RunService_0 (copy)
    local v48 = {};
    local v49 = {};
    local v50 = {};
    local v51 = {};
    local v52 = TweenInfo.new(v45.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "Prompt";
    l_BillboardGui_0.AlwaysOnTop = true;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.fromScale(0.5, 1);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BackgroundColor3 = v18;
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
    local v59 = v46 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v48, l_TweenService_0:Create(l_UIScale_0, v23, {
        Scale = v59
    }));
    table.insert(v49, l_TweenService_0:Create(l_UIScale_0, v23, {
        Scale = 1
    }));
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionText";
    l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_0.TextSize = 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextTransparency = 1;
    l_TextLabel_0.TextColor3 = v19;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    table.insert(v48, l_TweenService_0:Create(l_TextLabel_0, v23, {
        TextTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_TextLabel_0, v23, {
        TextTransparency = 0
    }));
    table.insert(v50, l_TweenService_0:Create(l_TextLabel_0, v23, {
        TextTransparency = 1
    }));
    table.insert(v51, l_TweenService_0:Create(l_TextLabel_0, v23, {
        TextTransparency = 0
    }));
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "ObjectText";
    l_TextLabel_1.Font = l_AppFonts_0.default:getMedium();
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.TextTransparency = 1;
    l_TextLabel_1.TextColor3 = v20;
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.Padding = UDim.new(-0.25, 0);
    l_UIListLayout_0.Parent = l_Frame_2;
    table.insert(v48, l_TweenService_0:Create(l_UIListLayout_0, v23, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v49, l_TweenService_0:Create(l_UIListLayout_0, v23, {
        Padding = UDim.new(0, 0)
    }));
    table.insert(v50, l_TweenService_0:Create(l_UIListLayout_0, v23, {
        Padding = UDim.new(-0.25, 0)
    }));
    table.insert(v51, l_TweenService_0:Create(l_UIListLayout_0, v23, {
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
    table.insert(v48, l_TweenService_0:Create(l_TextLabel_1, v23, {
        TextTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_TextLabel_1, v23, {
        TextTransparency = 0
    }));
    table.insert(v50, l_TweenService_0:Create(l_TextLabel_1, v23, {
        TextTransparency = 1
    }));
    table.insert(v51, l_TweenService_0:Create(l_TextLabel_1, v23, {
        TextTransparency = 0
    }));
    table.insert(v48, l_TweenService_0:Create(l_Frame_2, v23, {
        BackgroundTransparency = 1
    }));
    table.insert(v49, l_TweenService_0:Create(l_Frame_2, v23, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v50, l_TweenService_0:Create(l_Frame_2, v23, {
        BackgroundTransparency = 1
    }));
    table.insert(v51, l_TweenService_0:Create(l_Frame_2, v23, {
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
    table.insert(v50, l_TweenService_0:Create(l_Frame_6, v21, {
        BackgroundTransparency = 1
    }));
    table.insert(v51, l_TweenService_0:Create(l_Frame_6, v21, {
        BackgroundTransparency = 0.5
    }));
    if v46 == Enum.ProximityPromptInputType.Gamepad then
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v45.GamepadKeyCode);
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
            table.insert(v50, l_TweenService_0:Create(l_ImageLabel_1, v21, {
                ImageTransparency = 1
            }));
            table.insert(v51, l_TweenService_0:Create(l_ImageLabel_1, v21, {
                ImageTransparency = 0
            }));
        end;
    elseif v46 == Enum.ProximityPromptInputType.Touch then
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "ButtonImage";
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ImageTransparency = 1;
        l_ImageLabel_2.Size = UDim2.fromOffset(25, 31);
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ImageLabel_2.Parent = l_Frame_4;
        table.insert(v50, l_TweenService_0:Create(l_ImageLabel_2, v21, {
            ImageTransparency = 1
        }));
        table.insert(v51, l_TweenService_0:Create(l_ImageLabel_2, v21, {
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
        table.insert(v50, l_TweenService_0:Create(l_ImageLabel_3, v21, {
            ImageTransparency = 1
        }));
        table.insert(v51, l_TweenService_0:Create(l_ImageLabel_3, v21, {
            ImageTransparency = 0
        }));
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v45.KeyboardKeyCode);
        local v71 = v14[v45.KeyboardKeyCode];
        if v71 == nil then
            v71 = v15[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v71 == nil then
            local v72 = v16[v45.KeyboardKeyCode];
            if v72 then
                l_l_UserInputService_0_StringForKeyCode_0 = v72;
            end;
        end;
        if v71 then
            local l_ImageLabel_4 = Instance.new("ImageLabel");
            l_ImageLabel_4.Name = "ButtonImage";
            l_ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_4.Size = UDim2.fromOffset(36, 36);
            l_ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_4.BackgroundTransparency = 1;
            l_ImageLabel_4.ImageTransparency = 1;
            l_ImageLabel_4.Image = v71;
            l_ImageLabel_4.Parent = l_Frame_4;
            table.insert(v50, l_TweenService_0:Create(l_ImageLabel_4, v21, {
                ImageTransparency = 1
            }));
            table.insert(v51, l_TweenService_0:Create(l_ImageLabel_4, v21, {
                ImageTransparency = 0
            }));
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "ButtonText";
            l_TextLabel_2.AutoLocalize = false;
            l_TextLabel_2.Position = UDim2.fromOffset(0, -1);
            l_TextLabel_2.Size = UDim2.fromScale(1, 1);
            l_TextLabel_2.Font = l_AppFonts_0.default:getMedium();
            local v75 = v17[v45.KeyboardKeyCode];
            if v75 == nil then
                v75 = 14;
            end;
            l_TextLabel_2.TextSize = v75;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.TextTransparency = 1;
            l_TextLabel_2.TextColor3 = v19;
            l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
            l_TextLabel_2.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_TextLabel_2.Parent = l_Frame_4;
            table.insert(v50, l_TweenService_0:Create(l_TextLabel_2, v21, {
                TextTransparency = 1
            }));
            table.insert(v51, l_TweenService_0:Create(l_TextLabel_2, v21, {
                TextTransparency = 0
            }));
        else
            error("ProximityPrompt '" .. v45.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v45.KeyboardKeyCode));
        end;
    end;
    if v46 == Enum.ProximityPromptInputType.Touch or v45.ClickablePrompt then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.TextTransparency = 1;
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.Parent = l_BillboardGui_0;
        l_TextButton_0.Selectable = false;
        local v77 = false;
        do
            local l_v77_0 = v77;
            l_TextButton_0.InputBegan:Connect(function(v79) --[[ Line: 407 ]]
                -- upvalues: v45 (copy), l_v77_0 (ref)
                if (v79.UserInputType == Enum.UserInputType.Touch or v79.UserInputType == Enum.UserInputType.MouseButton1) and v79.UserInputState ~= Enum.UserInputState.Change then
                    v45:InputHoldBegin();
                    l_v77_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v80) --[[ Line: 414 ]]
                -- upvalues: l_v77_0 (ref), v45 (copy)
                if (v80.UserInputType == Enum.UserInputType.Touch or v80.UserInputType == Enum.UserInputType.MouseButton1) and l_v77_0 then
                    l_v77_0 = false;
                    v45:InputHoldEnd();
                end;
            end);
            l_BillboardGui_0.Active = true;
        end;
    end;
    if v45.HoldDuration > 0 then
        local v81 = v44(v50, v51);
        v81.Parent = l_Frame_4;
        table.insert(v48, l_TweenService_0:Create(v81.Progress, v52, {
            Value = 1
        }));
        table.insert(v49, l_TweenService_0:Create(v81.Progress, v22, {
            Value = 0
        }));
    end;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    if v45.HoldDuration > 0 then
        v82 = v45.PromptButtonHoldBegan:Connect(function() --[[ Line: 439 ]]
            -- upvalues: v48 (copy)
            for _, v87 in ipairs(v48) do
                v87:Play();
            end;
        end);
        v83 = v45.PromptButtonHoldEnded:Connect(function() --[[ Line: 445 ]]
            -- upvalues: v49 (copy)
            for _, v89 in ipairs(v49) do
                v89:Play();
            end;
        end);
    end;
    v84 = v45.Triggered:Connect(function() --[[ Line: 452 ]]
        -- upvalues: v50 (copy)
        for _, v91 in ipairs(v50) do
            v91:Play();
        end;
    end);
    v85 = v45.TriggerEnded:Connect(function() --[[ Line: 458 ]]
        -- upvalues: v51 (copy)
        for _, v93 in ipairs(v51) do
            v93:Play();
        end;
    end);
    local function v97() --[[ Line: 464 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: v45 (copy), l_TextLabel_0 (copy), l_TextLabel_1 (copy), v10 (ref), l_UIPadding_0 (copy), l_BillboardGui_0 (copy), l_RunService_0 (ref), l_Frame_2 (copy)
        local v94 = 72;
        local v95 = 24;
        local v96 = 0;
        if v45.ObjectText ~= nil and v45.ObjectText ~= "" then
            v96 = 9;
        end;
        l_TextLabel_0.Text = v45.ActionText;
        l_TextLabel_1.Text = v45.ObjectText;
        l_TextLabel_0.AutoLocalize = v45.AutoLocalize;
        l_TextLabel_0.RootLocalizationTable = v45.RootLocalizationTable;
        l_TextLabel_1.AutoLocalize = v45.AutoLocalize;
        l_TextLabel_1.RootLocalizationTable = v45.RootLocalizationTable;
        if not v10 then
            v95 = v95 - v96;
        end;
        if v45.ActionText ~= nil and v45.ActionText ~= "" or v45.ObjectText ~= nil and v45.ObjectText ~= "" then
            l_UIPadding_0.PaddingRight = UDim.new(0, v95);
        else
            l_UIPadding_0.PaddingRight = UDim.new(0, 0);
        end;
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, v96);
        l_TextLabel_1.Position = UDim2.new(0, 0, 0, -10);
        l_BillboardGui_0.Size = UDim2.fromOffset(v94, 72);
        l_BillboardGui_0.SizeOffset = Vector2.new(v45.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v45.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        task.defer(function() --[[ Line: 504 ]]
            -- upvalues: l_RunService_0 (ref), v94 (ref), l_Frame_2 (ref), l_BillboardGui_0 (ref), v45 (ref)
            l_RunService_0.RenderStepped:Wait();
            l_RunService_0.RenderStepped:Wait();
            v94 = l_Frame_2.AbsoluteSize.X;
            l_BillboardGui_0.Size = UDim2.fromOffset(v94, 72);
            l_BillboardGui_0.SizeOffset = Vector2.new(v45.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v45.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
        end);
    end;
    local v98 = v45.Changed:Connect(v97);
    v97();
    l_BillboardGui_0.Adornee = v45.Parent;
    l_BillboardGui_0.Parent = v47;
    local v99 = v45.AncestryChanged:Connect(function() --[[ Line: 521 ]] --[[ Name: updateUIAncestry ]]
        -- upvalues: l_BillboardGui_0 (copy), v45 (copy)
        l_BillboardGui_0.Adornee = v45.Parent;
    end);
    for _, v101 in ipairs(v51) do
        v101:Play();
    end;
    return function() --[[ Line: 530 ]] --[[ Name: cleanup ]]
        -- upvalues: v82 (ref), v83 (ref), v84 (ref), v85 (ref), v98 (copy), v99 (copy), v50 (copy), l_BillboardGui_0 (copy)
        if v82 then
            v82:Disconnect();
        end;
        if v83 then
            v83:Disconnect();
        end;
        v84:Disconnect();
        v85:Disconnect();
        v98:Disconnect();
        v99:Disconnect();
        for _, v103 in ipairs(v50) do
            v103:Play();
        end;
        wait(0.2);
        l_BillboardGui_0.Parent = nil;
    end;
end;
local function v118(v105, v106) --[[ Line: 556 ]] --[[ Name: createIndicator ]]
    -- upvalues: v18 (copy), v19 (copy), l_TweenService_0 (copy), v21 (copy)
    local v107 = {};
    local v108 = {};
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    l_BillboardGui_1.Name = "Indicator";
    l_BillboardGui_1.Size = UDim2.fromOffset(15, 15);
    l_BillboardGui_1.AlwaysOnTop = true;
    local l_Frame_7 = Instance.new("Frame");
    l_Frame_7.Size = UDim2.fromScale(1, 1);
    l_Frame_7.BackgroundTransparency = 1;
    l_Frame_7.BackgroundColor3 = v18;
    l_Frame_7.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_7.Position = UDim2.fromScale(0.5, 0);
    l_Frame_7.Parent = l_BillboardGui_1;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(1, 0);
    l_UICorner_1.Parent = l_Frame_7;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Color = v19;
    l_UIStroke_0.Thickness = 1.5;
    l_UIStroke_0.Transparency = 1;
    l_UIStroke_0.Parent = l_Frame_7;
    table.insert(v107, l_TweenService_0:Create(l_Frame_7, v21, {
        BackgroundTransparency = 1
    }));
    table.insert(v107, l_TweenService_0:Create(l_UIStroke_0, v21, {
        Transparency = 1
    }));
    table.insert(v108, l_TweenService_0:Create(l_Frame_7, v21, {
        BackgroundTransparency = 0.2
    }));
    table.insert(v108, l_TweenService_0:Create(l_UIStroke_0, v21, {
        Transparency = 0.2
    }));
    l_BillboardGui_1.Adornee = v105.Parent;
    l_BillboardGui_1.Parent = v106;
    local v113 = v105.AncestryChanged:Connect(function() --[[ Line: 591 ]] --[[ Name: updateUIAncestry ]]
        -- upvalues: l_BillboardGui_1 (copy), v105 (copy)
        l_BillboardGui_1.Adornee = v105.Parent;
    end);
    for _, v115 in ipairs(v108) do
        v115:Play();
    end;
    return function() --[[ Line: 600 ]] --[[ Name: cleanup ]]
        -- upvalues: v113 (copy), v107 (copy), l_BillboardGui_1 (copy)
        v113:Disconnect();
        for _, v117 in ipairs(v107) do
            v117:Play();
        end;
        wait(0.2);
        l_BillboardGui_1.Parent = nil;
    end;
end;
(function() --[[ Line: 615 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), v13 (copy), v104 (copy), v118 (copy)
    l_ProximityPromptService_0.PromptShown:Connect(function(v119, v120) --[[ Line: 616 ]]
        -- upvalues: v13 (ref), v104 (ref)
        if v119.Style == Enum.ProximityPromptStyle.Custom then
            return;
        else
            local l_ProximityPrompts_1 = v13:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = v13;
                l_ProximityPrompts_1.IgnoreGuiInset = true;
            end;
            l_ProximityPrompts_1 = v104(v119, v120, l_ProximityPrompts_1);
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v123 = v119.PromptHidden:Connect(function() --[[ Line: 627 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            local v124 = v119.Destroying:Connect(function() --[[ Line: 630 ]]
                -- upvalues: l_BindableEvent_0 (copy)
                l_BindableEvent_0:Fire();
            end);
            l_BindableEvent_0.Event:Wait();
            v123:Disconnect();
            v124:Disconnect();
            l_ProximityPrompts_1();
            return;
        end;
    end);
    if game:GetEngineFeature("ProximityPromptIndicators") and game:GetFastFlag("EnableProximityPromptIndicatorGui") then
        l_ProximityPromptService_0.IndicatorShown:Connect(function(v125) --[[ Line: 641 ]]
            -- upvalues: v13 (ref), v118 (ref)
            if v125.Style == Enum.ProximityPromptStyle.Custom then
                return;
            else
                local l_ProximityPrompts_2 = v13:FindFirstChild("ProximityPrompts");
                if l_ProximityPrompts_2 == nil then
                    l_ProximityPrompts_2 = Instance.new("ScreenGui");
                    l_ProximityPrompts_2.Name = "ProximityPrompts";
                    l_ProximityPrompts_2.ResetOnSpawn = false;
                    l_ProximityPrompts_2.Parent = v13;
                    l_ProximityPrompts_2.IgnoreGuiInset = true;
                end;
                l_ProximityPrompts_2 = v118(v125, l_ProximityPrompts_2);
                local l_BindableEvent_1 = Instance.new("BindableEvent");
                local v128 = v125.IndicatorHidden:Connect(function() --[[ Line: 652 ]]
                    -- upvalues: l_BindableEvent_1 (copy)
                    l_BindableEvent_1:Fire();
                end);
                local v129 = v125.Destroying:Connect(function() --[[ Line: 655 ]]
                    -- upvalues: l_BindableEvent_1 (copy)
                    l_BindableEvent_1:Fire();
                end);
                l_BindableEvent_1.Event:Wait();
                v128:Disconnect();
                v129:Disconnect();
                l_ProximityPrompts_2();
                return;
            end;
        end);
    end;
end)();