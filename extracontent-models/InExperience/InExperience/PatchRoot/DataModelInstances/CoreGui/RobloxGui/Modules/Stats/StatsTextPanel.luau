local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.DecoratedValueLabel);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v7 = l_status_0 and l_result_0;
local l_TextPanelTopMarginPix_0 = v2.TextPanelTopMarginPix;
local v9 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelTitleHeightY;
local v10 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelLegendItemHeightY;
local v11 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
l_TextPanelTopMarginPix_0 = l_TextPanelTopMarginPix_0 + v2.TextPanelLegendItemHeightY;
local v12 = UDim2.new(0, v2.TextPanelLeftMarginPix, 0, l_TextPanelTopMarginPix_0);
local v13 = UDim2.new(1, -v2.TextPanelLeftMarginPix * 2, 0, v2.TextPanelTitleHeightY);
local v14 = UDim2.new(1, -v2.TextPanelLeftMarginPix * 2, 0, v2.TextPanelLegendItemHeightY);
local v15 = {};
v15.__index = v15;
v15.new = function(v16) --[[ Line: 63 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v2 (copy), v13 (copy), v9 (copy)
    local v17 = {};
    setmetatable(v17, v15);
    v17._statType = v16;
    v17._frame = Instance.new("Frame");
    v17._frame.BackgroundTransparency = 1;
    v17._frame.ZIndex = v2.TextZIndex;
    v17._titleLabel = Instance.new("TextLabel");
    v2.StyleTextWidget(v17._titleLabel);
    v17._titleLabel.FontSize = v2.PanelTitleFontSize;
    v17._titleLabel.Text = v17:_getTitle();
    v17._titleLabel.Parent = v17._frame;
    v17._titleLabel.Size = v13;
    v17._titleLabel.Position = v9;
    v17._titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v17._titleLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v17:_addCurrentValueWidget();
    v17:_addTargetValueWidget();
    v17:_addAverageValueWidget();
    return v17;
end;
v15._getTarget = function(v18) --[[ Line: 96 ]] --[[ Name: _getTarget ]]
    if v18._performanceStats == nil then
        return 0;
    else
        local l_FirstChild_0 = v18._performanceStats:FindFirstChild(v18._statMaxName);
        if l_FirstChild_0 == nil then
            return 0;
        else
            return l_FirstChild_0:GetValue();
        end;
    end;
end;
v15._addCurrentValueWidget = function(v20) --[[ Line: 112 ]] --[[ Name: _addCurrentValueWidget ]]
    -- upvalues: v4 (copy), v7 (copy), v14 (copy), v10 (copy), v2 (copy)
    v20._currentValueWidget = v4.new(v20._statType, v7 and "InGame.UnknownNamespace.Current" or "Current");
    v20._currentValueWidget:PlaceInParent(v20._frame, v14, v10);
    local l_DecorationFrame_0 = v20._currentValueWidget:GetDecorationFrame();
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Position = UDim2.new(0.5, -v2.OvalKeySize / 2, 0.5, -v2.OvalKeySize / 2);
    l_ImageLabel_0.Size = UDim2.new(0, v2.OvalKeySize, 0, v2.OvalKeySize);
    l_ImageLabel_0.Parent = l_DecorationFrame_0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png";
    l_ImageLabel_0.BorderSizePixel = 0;
    v20._currentValueDecoration = l_ImageLabel_0;
end;
v15._addTargetValueWidget = function(v23) --[[ Line: 135 ]] --[[ Name: _addTargetValueWidget ]]
    -- upvalues: v4 (copy), v7 (copy), v14 (copy), v11 (copy), v2 (copy)
    v23._targetValueWidget = v4.new(v23._statType, v7 and "InGame.UnknownNamespace.Target" or "Target");
    v23._targetValueWidget:PlaceInParent(v23._frame, v14, v11);
    local l_DecorationFrame_1 = v23._targetValueWidget:GetDecorationFrame();
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Position = UDim2.new(0.5, -v2.TargetKeyWidth / 2, 0.5, -v2.TargetKeyHeight / 2);
    l_ImageLabel_1.Size = UDim2.new(0, v2.TargetKeyWidth, 0, v2.TargetKeyHeight);
    l_ImageLabel_1.Parent = l_DecorationFrame_1;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png";
end;
v15._addAverageValueWidget = function(v26) --[[ Line: 156 ]] --[[ Name: _addAverageValueWidget ]]
    -- upvalues: v4 (copy), v7 (copy), v14 (copy), v12 (copy), v2 (copy)
    v26._averageValueWidget = v4.new(v26._statType, v7 and "InGame.UnknownNamespace.Average" or "Average");
    v26._averageValueWidget:PlaceInParent(v26._frame, v14, v12);
    local l_DecorationFrame_2 = v26._averageValueWidget:GetDecorationFrame();
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Position = UDim2.new(0, 0, 0.5, -v2.GraphAverageLineTotalThickness / 2);
    l_Frame_0.Size = UDim2.new(1, 0, 0, v2.GraphAverageLineInnerThickness);
    l_Frame_0.Parent = l_DecorationFrame_2;
    v2.StyleAverageLine(l_Frame_0);
end;
v15._getTitle = function(v29) --[[ Line: 175 ]] --[[ Name: _getTitle ]]
    -- upvalues: v2 (copy)
    return v2.TypeToName[v29._statType];
end;
v15.PlaceInParent = function(v30, v31, v32, v33) --[[ Line: 179 ]] --[[ Name: PlaceInParent ]]
    v30._frame.Position = v33;
    v30._frame.Size = v32;
    v30._frame.Parent = v31;
end;
v15.SetStatsAggregator = function(v34, v35) --[[ Line: 186 ]] --[[ Name: SetStatsAggregator ]]
    if v34._aggregator then
        v34._aggregator:RemoveListener(v34._listenerId);
        v34._listenerId = nil;
        v34._aggregator = nil;
    end;
    v34._aggregator = v35;
    v34:_refreshVisibility();
end;
v15.SetVisible = function(v36, v37) --[[ Line: 198 ]] --[[ Name: SetVisible ]]
    v36._frame.Visible = v37;
    v36:_refreshVisibility();
end;
v15._shouldBeVisible = function(v38) --[[ Line: 203 ]] --[[ Name: _shouldBeVisible ]]
    -- upvalues: v2 (copy)
    if v2.PerformanceStatsShouldBeVisible() then
        return v38._frame.Visible;
    else
        return false;
    end;
end;
v15._refreshVisibility = function(v39) --[[ Line: 211 ]] --[[ Name: _refreshVisibility ]]
    if v39:_shouldBeVisible() then
        v39:_startListening();
        v39:_updateFromAggregator();
        return;
    else
        v39:_stopListening();
        return;
    end;
end;
v15.OnPerformanceStatsShouldBeVisibleChanged = function(v40) --[[ Line: 220 ]] --[[ Name: OnPerformanceStatsShouldBeVisibleChanged ]]
    v40:_refreshVisibility();
end;
v15._stopListening = function(v41) --[[ Line: 224 ]] --[[ Name: _stopListening ]]
    if v41._aggregator == nil then
        return;
    elseif v41._listenerId == nil then
        return;
    else
        v41._aggregator:RemoveListener(v41._listenerId);
        v41._listenerId = nil;
        return;
    end;
end;
v15._startListening = function(v42) --[[ Line: 237 ]] --[[ Name: _startListening ]]
    if v42._aggregator == nil then
        return;
    elseif v42._listenerId ~= nil then
        return;
    else
        v42._listenerId = v42._aggregator:AddListener(function() --[[ Line: 246 ]]
            -- upvalues: v42 (copy)
            v42:_updateFromAggregator();
        end);
        return;
    end;
end;
v15._updateFromAggregator = function(v43) --[[ Line: 251 ]] --[[ Name: _updateFromAggregator ]]
    -- upvalues: v2 (copy)
    local v44 = 0;
    local v45 = 0;
    local v46 = 0;
    if v43._aggregator ~= nil then
        v44 = v43._aggregator:GetLatestValue();
        v45 = v43._aggregator:GetAverage();
        v46 = v43._aggregator:GetTarget();
    end;
    v43._currentValueWidget:SetValue(v44);
    v43._targetValueWidget:SetValue(v46);
    v43._averageValueWidget:SetValue(v45);
    v43._currentValueDecoration.ImageColor3 = v2.GetColorForValue(v44, v46);
end;
v15.SetZIndex = function(v47, v48) --[[ Line: 270 ]] --[[ Name: SetZIndex ]]
    v47._frame.ZIndex = v48;
    v47._titleLabel.ZIndex = v48;
    v47._currentValueWidget:SetZIndex(v48);
    v47._averageValueWidget:SetZIndex(v48);
end;
return v15;