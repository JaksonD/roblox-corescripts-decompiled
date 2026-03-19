local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = nil;
local v7 = 0;
local _ = l_CoreGui_0.RobloxGui;
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "TeleportEffectGui";
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.Enabled = false;
l_ScreenGui_0.DisplayOrder = 7;
l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
l_ScreenGui_0.Parent = l_CoreGui_0;
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "TopFrame";
l_Frame_0.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
l_Frame_0.BorderSizePixel = 0;
l_Frame_0.AnchorPoint = Vector2.new(0.5, 1);
l_Frame_0.Position = UDim2.new(0.5, 0, 0, 0);
l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
l_Frame_0.ZIndex = 1;
l_Frame_0.Parent = l_ScreenGui_0;
local v13 = l_Frame_0:Clone();
v13.AnchorPoint = Vector2.new(0.5, 0);
v13.Position = UDim2.new(0.5, 0, 1, 0);
v13.Parent = l_ScreenGui_0;
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "SpinnerContainer";
l_Frame_1.ZIndex = 2;
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.AnchorPoint = Vector2.new(1, 1);
l_Frame_1.Size = UDim2.new(0.125, 0, 0.125, 0);
l_Frame_1.Position = UDim2.new(1, 0, 1, 0);
l_Frame_1.Parent = l_ScreenGui_0;
local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
l_UIAspectRatioConstraint_0.AspectRatio = 1;
l_UIAspectRatioConstraint_0.Parent = l_Frame_1;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "SpinnerRobloxTilt";
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.ImageTransparency = 1;
l_ImageLabel_0.Image = "rbxasset://textures/loading/robloxTilt.png";
l_ImageLabel_0.ZIndex = 2;
l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
l_ImageLabel_0.Parent = l_Frame_1;
local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
l_UIAspectRatioConstraint_1.AspectRatio = 1;
l_UIAspectRatioConstraint_1.Parent = l_ImageLabel_0;
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Text = v9:FormatByKey("CoreScripts.Ads.Label.Teleporting");
l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
l_TextLabel_0.TextTransparency = 1;
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.ZIndex = 2;
l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
l_TextLabel_0.Size = UDim2.new(0.6, 0, 0, 48);
l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
l_TextLabel_0.Font = l_AppFonts_0.default:getDefault();
l_TextLabel_0.TextScaled = true;
l_TextLabel_0.Parent = l_ScreenGui_0;
local v19 = false;
spinSpinner = function() --[[ Line: 93 ]] --[[ Name: spinSpinner ]]
    -- upvalues: v19 (ref), l_RunService_0 (copy), l_ImageLabel_0 (copy)
    if not v19 then
        v19 = true;
        local v20 = os.clock();
        l_RunService_0:BindToRenderStep("PortalLoadingSpinner", Enum.RenderPriority.Last.Value, function() --[[ Line: 97 ]]
            -- upvalues: l_ImageLabel_0 (ref), v20 (copy)
            if l_ImageLabel_0 and l_ImageLabel_0.Parent then
                local v21 = (os.clock() - v20) / 4 % 1;
                local v22 = 0;
                local v23 = 0;
                if v21 <= 0.75 then
                    v23 = math.cos(3.141592653589793 * (v21 / 0.75)) * -0.5 + 0.5;
                    v22 = 2.25;
                else
                    v23 = math.cos(3.141592653589793 + 3.141592653589793 * ((v21 - 0.75) / 0.25)) * -0.5 + 0.5;
                    v22 = 0.25;
                end;
                local v24 = v23 * 0.25 + 1;
                l_ImageLabel_0.Size = UDim2.new(v24, 0, v24, 0);
                l_ImageLabel_0.Rotation = v23 * 360 * v22;
                return;
            else
                stopSpinner();
                return;
            end;
        end);
    end;
end;
stopSpinner = function() --[[ Line: 119 ]] --[[ Name: stopSpinner ]]
    -- upvalues: l_RunService_0 (copy), v19 (ref)
    l_RunService_0:UnbindFromRenderStep("PortalLoadingSpinner");
    v19 = false;
end;
cover = function() --[[ Line: 124 ]] --[[ Name: cover ]]
    -- upvalues: v7 (ref), v6 (ref), l_Lighting_0 (copy), l_TweenService_0 (copy), l_ScreenGui_0 (copy), l_Frame_0 (copy), v13 (copy), l_ImageLabel_0 (copy), l_TextLabel_0 (copy)
    v7 = v7 + 1;
    local l_v7_0 = v7;
    if v6 then
        if v6.Parent then
            v6:Destroy();
        end;
        v6 = nil;
    end;
    v6 = Instance.new("ColorCorrectionEffect");
    v6.Name = "TeleportColorCorrectionEffect";
    v6.Parent = l_Lighting_0;
    l_TweenService_0:Create(v6, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Brightness = 1
    }):Play();
    task.delay(0.25, function() --[[ Line: 144 ]]
        -- upvalues: l_v7_0 (copy), v7 (ref), l_ScreenGui_0 (ref), l_Frame_0 (ref), v13 (ref), l_TweenService_0 (ref)
        if l_v7_0 ~= v7 then
            return;
        else
            if l_ScreenGui_0 and l_ScreenGui_0.Parent then
                l_ScreenGui_0.Enabled = true;
            end;
            if l_Frame_0 and l_Frame_0.Parent and v13 and v13.Parent then
                l_TweenService_0:Create(l_Frame_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }):Play();
                l_TweenService_0:Create(v13, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }):Play();
            end;
            return;
        end;
    end);
    task.delay(1.25, function() --[[ Line: 165 ]]
        -- upvalues: l_v7_0 (copy), v7 (ref), l_ImageLabel_0 (ref), l_TweenService_0 (ref), l_TextLabel_0 (ref)
        if l_v7_0 ~= v7 then
            return;
        else
            if l_ImageLabel_0 and l_ImageLabel_0.Parent then
                l_TweenService_0:Create(l_ImageLabel_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ImageTransparency = 0
                }):Play();
                spinSpinner();
            end;
            if l_TextLabel_0 and l_TextLabel_0.Parent then
                l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    TextTransparency = 0
                }):Play();
            end;
            return;
        end;
    end);
end;
uncover = function() --[[ Line: 187 ]] --[[ Name: uncover ]]
    -- upvalues: v7 (ref), l_ImageLabel_0 (copy), l_TweenService_0 (copy), l_TextLabel_0 (copy), v6 (ref), l_Frame_0 (copy), v13 (copy), l_ScreenGui_0 (copy)
    v7 = v7 + 1;
    local l_v7_1 = v7;
    if l_ImageLabel_0 and l_ImageLabel_0.Parent then
        l_TweenService_0:Create(l_ImageLabel_0, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ImageTransparency = 1
        }):Play();
    end;
    if l_TextLabel_0 and l_TextLabel_0.Parent then
        l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextTransparency = 1
        }):Play();
    end;
    if v6 and v6.Parent then
        l_TweenService_0:Create(v6, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Brightness = 0
        }):Play();
    end;
    if l_Frame_0 and l_Frame_0.Parent and v13 and v13.Parent then
        l_TweenService_0:Create(l_Frame_0, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Position = UDim2.new(0.5, 0, 0, 0)
        }):Play();
        l_TweenService_0:Create(v13, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Position = UDim2.new(0.5, 0, 1, 0)
        }):Play();
    end;
    task.delay(3, function() --[[ Line: 226 ]]
        -- upvalues: l_v7_1 (copy), v7 (ref), v6 (ref), l_ScreenGui_0 (ref)
        if l_v7_1 ~= v7 then
            return;
        else
            if v6 then
                if v6.Parent then
                    v6:Destroy();
                end;
                v6 = nil;
            end;
            if l_ScreenGui_0 and l_ScreenGui_0.Parent then
                l_ScreenGui_0.Enabled = false;
            end;
            stopSpinner();
            return;
        end;
    end);
end;
l_AdService_0.AdTeleportInitiated:Connect(cover);
l_AdService_0.AdTeleportEnded:Connect(uncover);