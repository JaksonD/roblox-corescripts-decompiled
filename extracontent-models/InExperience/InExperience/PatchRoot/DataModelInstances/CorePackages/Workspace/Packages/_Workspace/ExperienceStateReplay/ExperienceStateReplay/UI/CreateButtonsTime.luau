local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.ButtonAssets);
local v2 = require(l_Parent_0.SecondsToTimeStr);
local v3 = {
    regularColor = Color3.fromRGB(255, 255, 255), 
    hoverColor = Color3.fromRGB(200, 200, 200), 
    clickColor = Color3.fromRGB(150, 150, 150)
};
v3.createButtonsTime = function(v4) --[[ Line: 12 ]] --[[ Name: createButtonsTime ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    v4.createControlBarButton = function(v5, v6) --[[ Line: 14 ]] --[[ Name: createControlBarButton ]]
        -- upvalues: v4 (copy), v3 (ref)
        local l_ImageButton_0 = Instance.new("ImageButton");
        l_ImageButton_0.Name = "ControlBarButton";
        l_ImageButton_0.Parent = v4.ButtonsTimeControlBar;
        l_ImageButton_0.BackgroundTransparency = 1;
        l_ImageButton_0.Image = v5;
        l_ImageButton_0.ImageColor3 = v3.regularColor;
        l_ImageButton_0.AnchorPoint = Vector2.new(0, 0.5);
        l_ImageButton_0.Size = UDim2.new(0.1, 0, 0.9, 0);
        l_ImageButton_0.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        l_ImageButton_0:SetAttribute("useHoverColor", true);
        l_ImageButton_0.MouseEnter:Connect(function() --[[ Line: 26 ]]
            -- upvalues: l_ImageButton_0 (copy), v3 (ref)
            if l_ImageButton_0:GetAttribute("useHoverColor") then
                l_ImageButton_0.ImageColor3 = v3.hoverColor;
            end;
        end);
        l_ImageButton_0.MouseLeave:Connect(function() --[[ Line: 31 ]]
            -- upvalues: l_ImageButton_0 (copy), v3 (ref)
            if l_ImageButton_0:GetAttribute("useHoverColor") then
                l_ImageButton_0.ImageColor3 = v3.regularColor;
            end;
        end);
        l_ImageButton_0.MouseButton1Down:Connect(function() --[[ Line: 36 ]]
            -- upvalues: l_ImageButton_0 (copy), v3 (ref)
            l_ImageButton_0.ImageColor3 = v3.clickColor;
        end);
        if v6 then
            l_ImageButton_0.MouseButton1Up:Connect(function() --[[ Line: 40 ]]
                -- upvalues: l_ImageButton_0 (copy), v3 (ref)
                l_ImageButton_0.ImageColor3 = v3.hoverColor;
            end);
        end;
        local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
        l_UISizeConstraint_0.MaxSize = Vector2.new(v4.maxControlBarHeight * 0.9, v4.maxControlBarHeight * 0.9);
        l_UISizeConstraint_0.Parent = l_ImageButton_0;
        return l_ImageButton_0;
    end;
    v4.PlayButton = v4.createControlBarButton(v1.PlayButton, true);
    v4.PlayButton.LayoutOrder = 2;
    v4.StopButton = v4.createControlBarButton(v1.StopButton, false);
    v4.StopButton.LayoutOrder = 3;
    v4.ReverseButton = v4.createControlBarButton(v1.ReverseButton, false);
    v4.ReverseButton.LayoutOrder = 4;
    v4.CurrentTimeLabel = Instance.new("TextLabel");
    v4.CurrentTimeLabel.Name = "CurrentTimeLabel";
    v4.CurrentTimeLabel.Font = Enum.Font.SourceSans;
    v4.CurrentTimeLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v4.CurrentTimeLabel.TextYAlignment = Enum.TextYAlignment.Center;
    v4.CurrentTimeLabel.AnchorPoint = Vector2.new(0, 0.5);
    v4.CurrentTimeLabel.Size = UDim2.new(0.4, 0, 1.3, 0);
    v4.CurrentTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v4.CurrentTimeLabel.BackgroundTransparency = 1;
    v4.CurrentTimeLabel.Text = v2.convertSecondsToTimeStr(0);
    v4.CurrentTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    v4.CurrentTimeLabel.TextScaled = true;
    v4.CurrentTimeLabel.LayoutOrder = 5;
    v4.CurrentTimeLabel.Parent = v4.ButtonsTimeControlBar;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingBottom = UDim.new(0.05, 0);
    l_UIPadding_0.Parent = v4.CurrentTimeLabel;
end;
return v3;