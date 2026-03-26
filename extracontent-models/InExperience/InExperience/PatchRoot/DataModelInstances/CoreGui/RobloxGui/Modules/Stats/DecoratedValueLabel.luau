local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v7 = {};
    setmetatable(v7, v4);
    v7._frame = Instance.new("Frame");
    v7._frame.Name = "PS_DecoratedValueLabel";
    v7._frame.BackgroundTransparency = 1;
    v7._valueName = v6;
    v7._statType = v5;
    v7._decorationFrame = Instance.new("Frame");
    v7._decorationFrame.Name = "PS_Decoration";
    v7._decorationFrame.Parent = v7._frame;
    v7._decorationFrame.Position = UDim2.new(0, 0, 0.5, -v2.DecorationSize / 2);
    v7._decorationFrame.Size = UDim2.new(0, v2.DecorationSize, 0, v2.DecorationSize);
    v7._decorationFrame.BackgroundTransparency = 1;
    v7._label = Instance.new("TextLabel");
    v7._label.Name = "Label";
    v7._label.Parent = v7._frame;
    v7._label.Position = UDim2.new(0, v2.DecorationSize + v2.DecorationMargin, 0, 0);
    v7._label.Size = UDim2.new(1, -(v2.DecorationSize + v2.DecorationMargin), 1, 0);
    v7._label.FontSize = v2.PanelValueFontSize;
    v7._label.TextXAlignment = Enum.TextXAlignment.Left;
    v7._label.TextYAlignment = Enum.TextYAlignment.Center;
    v2.StyleTextWidget(v7._label);
    return v7;
end;
v4.SetZIndex = function(v8, v9) --[[ Line: 53 ]] --[[ Name: SetZIndex ]]
    v8._frame.ZIndex = v9;
    v8._decorationFrame.ZIndex = v9;
    v8._label.ZIndex = v9;
end;
v4.PlaceInParent = function(v10, v11, v12, v13) --[[ Line: 60 ]] --[[ Name: PlaceInParent ]]
    v10._frame.Parent = v11;
    v10._frame.Size = v12;
    v10._frame.Position = v13;
end;
v4.GetDecorationFrame = function(v14) --[[ Line: 67 ]] --[[ Name: GetDecorationFrame ]]
    return v14._decorationFrame;
end;
v4.SetValue = function(v15, v16) --[[ Line: 71 ]] --[[ Name: SetValue ]]
    -- upvalues: v2 (copy)
    local v17 = v2.FormatTypedValue(v16, v15._statType);
    v15._label.Text = string.format("%s: %s", v15._valueName, v17);
end;
return v4;