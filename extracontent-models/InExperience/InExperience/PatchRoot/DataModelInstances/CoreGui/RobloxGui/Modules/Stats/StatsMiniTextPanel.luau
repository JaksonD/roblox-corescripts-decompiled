local v0 = UDim2.new(0, 10, 0.15, 0);
local v1 = UDim2.new(1, -20, 0.4, 0);
local v2 = UDim2.new(0, 10, 0.55, 0);
local v3 = UDim2.new(1, -20, 0.3, 0);
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v5 (copy), v1 (copy), v0 (copy), v3 (copy), v2 (copy)
    local v9 = {};
    setmetatable(v9, v7);
    v9._statType = v8;
    v9._frame = Instance.new("Frame");
    v9._frame.Name = "StatsMiniTextPanelClass";
    v9._frame.BackgroundTransparency = 1;
    v9._frame.ZIndex = v5.TextZIndex;
    v9._titleLabel = Instance.new("TextLabel");
    v9._titleLabel.Name = "TitleLabel";
    v9._valueLabel = Instance.new("TextLabel");
    v9._valueLabel.Name = "ValueLabel";
    v5.StyleTextWidget(v9._titleLabel);
    v5.StyleTextWidget(v9._valueLabel);
    v9._titleLabel.FontSize = v5.MiniPanelTitleFontSize;
    v9._titleLabel.Text = v9:_getTitle();
    v9._titleLabel.Parent = v9._frame;
    v9._titleLabel.Size = v1;
    v9._titleLabel.Position = v0;
    v9._titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v9._valueLabel.FontSize = v5.MiniPanelValueFontSize;
    v9._valueLabel.Text = "0";
    v9._valueLabel.Parent = v9._frame;
    v9._valueLabel.Size = v3;
    v9._valueLabel.Position = v2;
    v9._valueLabel.TextXAlignment = Enum.TextXAlignment.Left;
    return v9;
end;
v7.SetZIndex = function(v10, v11) --[[ Line: 80 ]] --[[ Name: SetZIndex ]]
    v10._frame.ZIndex = v11;
    v10._titleLabel.ZIndex = v11;
    v10.ZIndex = v11;
end;
v7._getTitle = function(v12) --[[ Line: 86 ]] --[[ Name: _getTitle ]]
    -- upvalues: v5 (copy)
    return v5.TypeToShortName[v12._statType];
end;
v7.PlaceInParent = function(v13, v14, v15, v16) --[[ Line: 90 ]] --[[ Name: PlaceInParent ]]
    v13._frame.Position = v16;
    v13._frame.Size = v15;
    v13._frame.Parent = v14;
end;
v7.SetStatsAggregator = function(v17, v18) --[[ Line: 96 ]] --[[ Name: SetStatsAggregator ]]
    if v17._aggregator then
        v17._aggregator:RemoveListener(v17._listenerId);
        v17._listenerId = nil;
        v17._aggregator = nil;
    end;
    v17._aggregator = v18;
    v17:_refreshVisibility();
end;
v7.SetVisible = function(v19, v20) --[[ Line: 108 ]] --[[ Name: SetVisible ]]
    v19.frame.Visible = v20;
    v19:_refreshVisibility();
end;
v7._shouldBeVisible = function(v21) --[[ Line: 113 ]] --[[ Name: _shouldBeVisible ]]
    -- upvalues: v5 (copy)
    if v5.PerformanceStatsShouldBeVisible() then
        return v21._frame.Visible;
    else
        return false;
    end;
end;
v7._refreshVisibility = function(v22) --[[ Line: 122 ]] --[[ Name: _refreshVisibility ]]
    if v22:_shouldBeVisible() then
        v22:_startListening();
        v22:_updateFromAggregator();
        return;
    else
        v22:_stopListening();
        return;
    end;
end;
v7._stopListening = function(v23) --[[ Line: 131 ]] --[[ Name: _stopListening ]]
    if v23._aggregator == nil then
        return;
    elseif v23._listenerId == nil then
        return;
    else
        v23._aggregator:RemoveListener(v23._listenerId);
        v23._listenerId = nil;
        return;
    end;
end;
v7._startListening = function(v24) --[[ Line: 144 ]] --[[ Name: _startListening ]]
    if v24._aggregator == nil then
        return;
    elseif v24._listenerId ~= nil then
        return;
    else
        v24._listenerId = v24._aggregator:AddListener(function() --[[ Line: 153 ]]
            -- upvalues: v24 (copy)
            v24:_updateFromAggregator();
        end);
        return;
    end;
end;
v7.OnPerformanceStatsShouldBeVisibleChanged = function(v25) --[[ Line: 158 ]] --[[ Name: OnPerformanceStatsShouldBeVisibleChanged ]]
    v25:_refreshVisibility();
end;
v7._updateFromAggregator = function(v26) --[[ Line: 162 ]] --[[ Name: _updateFromAggregator ]]
    -- upvalues: v5 (copy)
    local v27 = nil;
    v27 = if v26._aggregator ~= nil then v26._aggregator:GetLatestValue() else 0;
    v26._valueLabel.Text = v5.FormatTypedValue(v27, v26._statType);
end;
return v7;