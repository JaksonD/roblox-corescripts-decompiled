local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.DecoratedValueLabel);
local l_TextPanelTopMarginPix_0 = v2.TextPanelTopMarginPix;
local v6 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelTitleHeightY;
local v7 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelLegendItemHeightY;
local v8 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelLegendItemHeightY;
local v9 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
local v10 = UDim2.new(1, -v2.TextPanelLeftMarginPix * 2, 0, v2.TextPanelTitleHeightY);
local v11 = UDim2.new(1, -v2.TextPanelLeftMarginPix * 2, 0, v2.TextPanelLegendItemHeightY);
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v2 (copy), v10 (copy), v6 (copy)
    local v14 = {};
    setmetatable(v14, v12);
    v14._statType = v13;
    v14._frame = Instance.new("Frame");
    v14._frame.BackgroundTransparency = 1;
    v14._frame.ZIndex = v2.TextZIndex;
    v14._titleLabel = Instance.new("TextLabel");
    v2.StyleTextWidget(v14._titleLabel);
    v14._titleLabel.FontSize = v2.PanelTitleFontSize;
    v14._titleLabel.Text = v14:_getTitle();
    v14._titleLabel.Parent = v14._frame;
    v14._titleLabel.Size = v10;
    v14._titleLabel.Position = v6;
    v14._titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v14._titleLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v14:_addCurrentValueWidget();
    v14:_addTargetValueWidget();
    v14:_addAverageValueWidget();
    return v14;
end;
v12._getTarget = function(v15) --[[ Line: 92 ]] --[[ Name: _getTarget ]]
    if v15._performanceStats == nil then
        return 0;
    else
        local l_FirstChild_0 = v15._performanceStats:FindFirstChild(v15._statMaxName);
        if l_FirstChild_0 == nil then
            return 0;
        else
            return l_FirstChild_0:GetValue();
        end;
    end;
end;
v12._addCurrentValueWidget = function(v17) --[[ Line: 108 ]] --[[ Name: _addCurrentValueWidget ]]
    -- upvalues: v4 (copy), v11 (copy), v7 (copy), v2 (copy)
    v17._currentValueWidget = v4.new(v17._statType, "Current");
    v17._currentValueWidget:PlaceInParent(v17._frame, v11, v7);
    local l_DecorationFrame_0 = v17._currentValueWidget:GetDecorationFrame();
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Position = UDim2.new(0.5, -v2.OvalKeySize / 2, 0.5, -v2.OvalKeySize / 2);
    l_ImageLabel_0.Size = UDim2.new(0, v2.OvalKeySize, 0, v2.OvalKeySize);
    l_ImageLabel_0.Parent = l_DecorationFrame_0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png";
    l_ImageLabel_0.BorderSizePixel = 0;
    v17._currentValueDecoration = l_ImageLabel_0;
end;
v12._addTargetValueWidget = function(v20) --[[ Line: 129 ]] --[[ Name: _addTargetValueWidget ]]
    -- upvalues: v4 (copy), v11 (copy), v8 (copy), v2 (copy)
    v20._targetValueWidget = v4.new(v20._statType, "Target");
    v20._targetValueWidget:PlaceInParent(v20._frame, v11, v8);
    local l_DecorationFrame_1 = v20._targetValueWidget:GetDecorationFrame();
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Position = UDim2.new(0.5, -v2.TargetKeyWidth / 2, 0.5, -v2.TargetKeyHeight / 2);
    l_ImageLabel_1.Size = UDim2.new(0, v2.TargetKeyWidth, 0, v2.TargetKeyHeight);
    l_ImageLabel_1.Parent = l_DecorationFrame_1;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png";
end;
v12._addAverageValueWidget = function(v23) --[[ Line: 148 ]] --[[ Name: _addAverageValueWidget ]]
    -- upvalues: v4 (copy), v11 (copy), v9 (copy), v2 (copy)
    v23._averageValueWidget = v4.new(v23._statType, "Average");
    v23._averageValueWidget:PlaceInParent(v23._frame, v11, v9);
    local l_DecorationFrame_2 = v23._averageValueWidget:GetDecorationFrame();
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Position = UDim2.new(0, 0, 0.5, -v2.GraphAverageLineTotalThickness / 2);
    l_Frame_0.Size = UDim2.new(1, 0, 0, v2.GraphAverageLineInnerThickness);
    l_Frame_0.Parent = l_DecorationFrame_2;
    v2.StyleAverageLine(l_Frame_0);
end;
v12._getTitle = function(v26) --[[ Line: 165 ]] --[[ Name: _getTitle ]]
    -- upvalues: v2 (copy)
    return v2.TypeToName[v26._statType];
end;
v12.PlaceInParent = function(v27, v28, v29, v30) --[[ Line: 169 ]] --[[ Name: PlaceInParent ]]
    v27._frame.Position = v30;
    v27._frame.Size = v29;
    v27._frame.Parent = v28;
end;
v12.SetStatsAggregator = function(v31, v32) --[[ Line: 176 ]] --[[ Name: SetStatsAggregator ]]
    if v31._aggregator then
        v31._aggregator:RemoveListener(v31._listenerId);
        v31._listenerId = nil;
        v31._aggregator = nil;
    end;
    v31._aggregator = v32;
    v31:_refreshVisibility();
end;
v12.SetVisible = function(v33, v34) --[[ Line: 188 ]] --[[ Name: SetVisible ]]
    v33._frame.Visible = v34;
    v33:_refreshVisibility();
end;
v12._shouldBeVisible = function(v35) --[[ Line: 193 ]] --[[ Name: _shouldBeVisible ]]
    -- upvalues: v2 (copy)
    if v2.PerformanceStatsShouldBeVisible() then
        return v35._frame.Visible;
    else
        return false;
    end;
end;
v12._refreshVisibility = function(v36) --[[ Line: 201 ]] --[[ Name: _refreshVisibility ]]
    if v36:_shouldBeVisible() then
        v36:_startListening();
        v36:_updateFromAggregator();
        return;
    else
        v36:_stopListening();
        return;
    end;
end;
v12.OnPerformanceStatsShouldBeVisibleChanged = function(v37) --[[ Line: 210 ]] --[[ Name: OnPerformanceStatsShouldBeVisibleChanged ]]
    v37:_refreshVisibility();
end;
v12._stopListening = function(v38) --[[ Line: 214 ]] --[[ Name: _stopListening ]]
    if v38._aggregator == nil then
        return;
    elseif v38._listenerId == nil then
        return;
    else
        v38._aggregator:RemoveListener(v38._listenerId);
        v38._listenerId = nil;
        return;
    end;
end;
v12._startListening = function(v39) --[[ Line: 227 ]] --[[ Name: _startListening ]]
    if v39._aggregator == nil then
        return;
    elseif v39._listenerId ~= nil then
        return;
    else
        v39._listenerId = v39._aggregator:AddListener(function() --[[ Line: 236 ]]
            -- upvalues: v39 (copy)
            v39:_updateFromAggregator();
        end);
        return;
    end;
end;
v12._updateFromAggregator = function(v40) --[[ Line: 241 ]] --[[ Name: _updateFromAggregator ]]
    -- upvalues: v2 (copy)
    local v41 = 0;
    local v42 = 0;
    local v43 = 0;
    if v40._aggregator ~= nil then
        v41 = v40._aggregator:GetLatestValue();
        v42 = v40._aggregator:GetAverage();
        v43 = v40._aggregator:GetTarget();
    end;
    v40._currentValueWidget:SetValue(v41);
    v40._targetValueWidget:SetValue(v43);
    v40._averageValueWidget:SetValue(v42);
    v40._currentValueDecoration.ImageColor3 = v2.GetColorForValue(v41, v43);
end;
v12.SetZIndex = function(v44, v45) --[[ Line: 260 ]] --[[ Name: SetZIndex ]]
    v44._frame.ZIndex = v45;
    v44._titleLabel.ZIndex = v45;
    v44._currentValueWidget:SetZIndex(v45);
    v44._averageValueWidget:SetZIndex(v45);
end;
return v12;