local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
LocalizedGetKey = function(v4) --[[ Line: 16 ]] --[[ Name: LocalizedGetKey ]]
    -- upvalues: v3 (copy)
    local l_v4_0 = v4;
    pcall(function() --[[ Line: 18 ]]
        -- upvalues: l_v4_0 (ref), v3 (ref), v4 (copy)
        l_v4_0 = v3:FormatByKey(v4);
    end);
    return l_v4_0;
end;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v8 = l_status_0 and l_result_0;
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v8 (copy), v2 (copy)
    local v12 = {};
    setmetatable(v12, v9);
    v12._frame = Instance.new("Frame");
    v12._frame.Name = "PS_DecoratedValueLabel";
    v12._frame.BackgroundTransparency = 1;
    if v8 == true then
        v12._valueName = LocalizedGetKey(v11);
    else
        v12._valueName = v11;
    end;
    v12._statType = v10;
    v12._decorationFrame = Instance.new("Frame");
    v12._decorationFrame.Name = "PS_Decoration";
    v12._decorationFrame.Parent = v12._frame;
    v12._decorationFrame.Position = UDim2.new(0, 0, 0.5, -v2.DecorationSize / 2);
    v12._decorationFrame.Size = UDim2.new(0, v2.DecorationSize, 0, v2.DecorationSize);
    v12._decorationFrame.BackgroundTransparency = 1;
    v12._label = Instance.new("TextLabel");
    v12._label.Name = "Label";
    v12._label.Parent = v12._frame;
    v12._label.Position = UDim2.new(0, v2.DecorationSize + v2.DecorationMargin, 0, 0);
    v12._label.Size = UDim2.new(1, -(v2.DecorationSize + v2.DecorationMargin), 1, 0);
    v12._label.FontSize = v2.PanelValueFontSize;
    v12._label.TextXAlignment = Enum.TextXAlignment.Left;
    v12._label.TextYAlignment = Enum.TextYAlignment.Center;
    v2.StyleTextWidget(v12._label);
    return v12;
end;
v9.SetZIndex = function(v13, v14) --[[ Line: 71 ]] --[[ Name: SetZIndex ]]
    v13._frame.ZIndex = v14;
    v13._decorationFrame.ZIndex = v14;
    v13._label.ZIndex = v14;
end;
v9.PlaceInParent = function(v15, v16, v17, v18) --[[ Line: 78 ]] --[[ Name: PlaceInParent ]]
    v15._frame.Parent = v16;
    v15._frame.Size = v17;
    v15._frame.Position = v18;
end;
v9.GetDecorationFrame = function(v19) --[[ Line: 85 ]] --[[ Name: GetDecorationFrame ]]
    return v19._decorationFrame;
end;
v9.SetValue = function(v20, v21) --[[ Line: 89 ]] --[[ Name: SetValue ]]
    -- upvalues: v2 (copy)
    local v22 = v2.FormatTypedValue(v21, v20._statType);
    v20._label.Text = string.format("%s: %s", v20._valueName, v22);
end;
return v9;