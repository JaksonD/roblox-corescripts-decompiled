local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    setmetatable(v4, v2);
    v4._barFrame = Instance.new("Frame");
    v4._barFrame.Name = "PS_BarFrame";
    v4._barFrame.BackgroundTransparency = 1;
    v4._lineFrame = Instance.new("Frame");
    v4._lineFrame.Name = "PS_LineFrame";
    v4._lineFrame.BackgroundTransparency = 1;
    v4._showExtras = v3;
    v4._values = {};
    v4._bars = {};
    v4._average = 0;
    v4._target = 0;
    if v4._showExtras then
        v4:_addGraphTarget();
        v4:_addGraphAverage();
    end;
    return v4;
end;
v2.SetZIndex = function(v5, v6) --[[ Line: 53 ]] --[[ Name: SetZIndex ]]
    v5._barFrame.ZIndex = v6;
    v5._lineFrame.ZIndex = v6 + 1;
    if v5._showExtras then
        v5._targetLine.ZIndex = v5._lineFrame.ZIndex;
        v5._averageLine.ZIndex = v5._lineFrame.ZIndex;
    end;
end;
v2.PlaceInParent = function(v7, v8, v9, v10) --[[ Line: 62 ]] --[[ Name: PlaceInParent ]]
    v7._barFrame.Position = v10;
    v7._barFrame.Size = v9;
    v7._barFrame.Parent = v8;
    v7._lineFrame.Position = v10;
    v7._lineFrame.Size = v9;
    v7._lineFrame.Parent = v8;
end;
v2.SetAxisMax = function(v11, v12) --[[ Line: 71 ]] --[[ Name: SetAxisMax ]]
    v11._axisMax = v12;
end;
v2.SetValues = function(v13, v14) --[[ Line: 75 ]] --[[ Name: SetValues ]]
    v13._values = v14;
end;
v2.SetAverage = function(v15, v16) --[[ Line: 79 ]] --[[ Name: SetAverage ]]
    v15._average = v16;
end;
v2.SetTarget = function(v17, v18) --[[ Line: 83 ]] --[[ Name: SetTarget ]]
    v17._target = v18;
    v17:_moveGraphTarget();
end;
v2._updateBarCount = function(v19, v20) --[[ Line: 90 ]] --[[ Name: _updateBarCount ]]
    local v21 = {};
    local v22 = #v19._bars;
    for v23 = 1, v22 do
        if v23 <= v22 then
            table.insert(v21, v19._bars[v23]);
        else
            v19._bars[v23].Destroy();
        end;
    end;
    for v24 = v22 + 1, v20 do
        table.insert(v21, v19:_makeNthBar(v24));
    end;
    v19._bars = v21;
end;
v2.Render = function(v25) --[[ Line: 113 ]] --[[ Name: Render ]]
    local v26 = #v25._values;
    v25:_updateBarCount(v26);
    for v27, v28 in ipairs(v25._values) do
        v25:_updateBar(v27, v28, v26);
    end;
    if v25._showExtras then
        v25:_moveGraphAverage();
    end;
end;
v2._addGraphTarget = function(v29) --[[ Line: 128 ]] --[[ Name: _addGraphTarget ]]
    -- upvalues: v1 (copy)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "TargetLine";
    l_ImageLabel_0.Size = UDim2.new(1, 0, 0, v1.GraphTargetLineInnerThickness);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/PerformanceStats/TargetLine.png";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = v29._lineFrame;
    l_ImageLabel_0.ZIndex = v29._lineFrame.ZIndex;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Changed:connect(function() --[[ Line: 140 ]]
        -- upvalues: v29 (copy)
        v29:_updateTargetLineImageSize();
    end);
    v29._targetLine = l_ImageLabel_0;
    v29:_updateTargetLineImageSize();
end;
v2._updateTargetLineImageSize = function(v31) --[[ Line: 148 ]] --[[ Name: _updateTargetLineImageSize ]]
    v31._targetLine.ImageRectSize = v31._targetLine.AbsoluteSize;
end;
v2._addGraphAverage = function(v32) --[[ Line: 152 ]] --[[ Name: _addGraphAverage ]]
    -- upvalues: v1 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "AverageLine";
    l_Frame_0.Size = UDim2.new(1, 0, 0, v1.GraphAverageLineInnerThickness);
    l_Frame_0.Parent = v32._lineFrame;
    l_Frame_0.ZIndex = v32._lineFrame.ZIndex;
    v1.StyleAverageLine(l_Frame_0);
    v32._averageLine = l_Frame_0;
end;
v2._moveGraphTarget = function(v34) --[[ Line: 166 ]] --[[ Name: _moveGraphTarget ]]
    -- upvalues: v1 (copy)
    if v34._targetLine == nil then
        return;
    else
        v34._targetLine.Position = UDim2.new(0, 0, (v34._axisMax - v34._target) / v34._axisMax, -v1.GraphTargetLineInnerThickness / 2);
        return;
    end;
end;
v2._moveGraphAverage = function(v35) --[[ Line: 177 ]] --[[ Name: _moveGraphAverage ]]
    -- upvalues: v1 (copy)
    if v35._averageLine == nil then
        return;
    else
        local v36 = math.min(v35._average, v35._axisMax);
        v35._averageLine.Position = UDim2.new(0, 0, (v35._axisMax - v36) / v35._axisMax, -v1.GraphAverageLineTotalThickness / 2);
        return;
    end;
end;
v2._makeNthBar = function(v37, v38) --[[ Line: 192 ]] --[[ Name: _makeNthBar ]]
    local v39 = v38 - 1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = string.format("Bar_%d", v39);
    l_Frame_1.Parent = v37._barFrame;
    l_Frame_1.ZIndex = v37._barFrame.ZIndex;
    l_Frame_1.BorderSizePixel = 0;
    return l_Frame_1;
end;
v2._updateBar = function(v41, v42, v43, v44) --[[ Line: 203 ]] --[[ Name: _updateBar ]]
    -- upvalues: v1 (copy)
    local v45 = v41._bars[v42];
    local v46 = v42 - 1;
    local v47 = math.max(0, (math.min(v43, v41._axisMax)));
    v45.Position = UDim2.new(v46 / v44, 0, (v41._axisMax - v47) / v41._axisMax, 0);
    v45.Size = UDim2.new(1 / v44, 0, v47 / v41._axisMax, 0);
    v45.BackgroundColor3 = v1.GetColorForValue(v43, v41._target);
end;
return v2;