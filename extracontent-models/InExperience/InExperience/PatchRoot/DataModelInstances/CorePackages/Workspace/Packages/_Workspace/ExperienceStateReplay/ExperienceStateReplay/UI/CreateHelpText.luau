local v0 = {};
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.CreateButtonsTime);
v0.createHelpText = function(v3) --[[ Line: 7 ]] --[[ Name: createHelpText ]]
    -- upvalues: v2 (copy)
    v3.HelpRevealer = Instance.new("TextLabel");
    v3.HelpRevealer.Name = "HelpRevealer";
    v3.HelpRevealer.Font = Enum.Font.SourceSans;
    v3.HelpRevealer.TextXAlignment = Enum.TextXAlignment.Center;
    v3.HelpRevealer.TextYAlignment = Enum.TextYAlignment.Center;
    v3.HelpRevealer.Size = UDim2.new(0.5, 0, 1.3, 0);
    v3.HelpRevealer.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v3.HelpRevealer.AnchorPoint = Vector2.new(0.5, 0.5);
    v3.HelpRevealer.Position = UDim2.new(0.5, 0, 0.5, 0);
    v3.HelpRevealer.BackgroundTransparency = 1;
    v3.HelpRevealer.Text = "?";
    v3.HelpRevealer.TextColor3 = v2.regularColor;
    v3.HelpRevealer.TextScaled = true;
    v3.HelpRevealer.Parent = v3.HelpBar;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingBottom = UDim.new(0.05, 0);
    l_UIPadding_0.Parent = v3.HelpRevealer;
    v3.HelpDescription = Instance.new("TextLabel");
    v3.HelpDescription.Name = "HelpDescription";
    v3.HelpDescription.Font = Enum.Font.SourceSans;
    v3.HelpDescription.TextXAlignment = Enum.TextXAlignment.Left;
    v3.HelpDescription.TextYAlignment = Enum.TextYAlignment.Top;
    v3.HelpDescription.AnchorPoint = Vector2.new(1, 1);
    v3.HelpDescription.Position = UDim2.new(1, 0, 0, 0);
    v3.HelpDescription.Size = UDim2.new(5.3, 0, 2.5, 0);
    v3.HelpDescription.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v3.HelpDescription.BorderSizePixel = 0;
    v3.HelpDescription.BackgroundColor3 = v3.defaultBackgroundColor3;
    v3.HelpDescription.BackgroundTransparency = v3.defaultBackgroundTransparency;
    v3.HelpDescription.RichText = true;
    v3.HelpDescription.Text = "<b>Shortcuts</b>\n<u>space</u> - play/pause\n<u>r</u> - rewind\n<u>s</u> - stop";
    v3.HelpDescription.TextColor3 = Color3.fromRGB(255, 255, 255);
    v3.HelpDescription.TextScaled = Enum.AutomaticSize.XY;
    v3.HelpDescription.Parent = v3.HelpBar;
    v3.HelpDescription.Visible = false;
    local l_UIPadding_1 = Instance.new("UIPadding");
    l_UIPadding_1.PaddingLeft = UDim.new(0.02, 0);
    l_UIPadding_1.PaddingBottom = UDim.new(0.02, 0);
    l_UIPadding_1.Parent = v3.HelpDescription;
    v3.HelpRevealer.MouseEnter:Connect(function() --[[ Line: 55 ]]
        -- upvalues: v3 (copy), v2 (ref)
        v3.HelpRevealer.TextColor3 = v2.hoverColor;
        v3.HelpDescription.Visible = true;
    end);
    v3.HelpRevealer.MouseLeave:Connect(function() --[[ Line: 60 ]]
        -- upvalues: v3 (copy), v2 (ref)
        v3.HelpRevealer.TextColor3 = v2.regularColor;
        v3.HelpDescription.Visible = false;
    end);
end;
return v0;