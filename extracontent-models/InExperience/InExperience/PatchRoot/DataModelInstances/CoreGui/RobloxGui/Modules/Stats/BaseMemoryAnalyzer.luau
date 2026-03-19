local v0 = Color3.new(0.35, 0.55, 0.35);
local v1 = Color3.new(0.15, 0.35, 0.15);
local v2 = Color3.new(1, 1, 1);
local v3 = Color3.new(1, 1, 1);
local v4 = Color3.new(1, 1, 1);
local v5 = UDim2.new(0, 0, 0, 0);
local v6 = UDim2.new(1, -18, 0, 2);
local v7 = UDim2.new(0, 16, 0, 16);
local v8 = UDim2.new(1, -100, 0, 0);
local v9 = UDim2.new(0, 100, 0, 20);
local _ = game:GetService("CoreGui");
local function _(v11) --[[ Line: 36 ]] --[[ Name: __StyleAndSizeButton ]]
    -- upvalues: v2 (copy), v4 (copy), v6 (copy), v7 (copy)
    v11.TextXAlignment = Enum.TextXAlignment.Center;
    v11.TextColor3 = v2;
    v11.BackgroundTransparency = 1;
    v11.BorderColor3 = v4;
    v11.BorderSizePixel = 1;
    v11.Position = v6;
    v11.Size = v7;
end;
local function _(v13) --[[ Line: 47 ]] --[[ Name: __StyleAndSizeLabel ]]
    -- upvalues: v2 (copy)
    v13.TextXAlignment = Enum.TextXAlignment.Left;
    v13.TextColor3 = v2;
    v13.BackgroundTransparency = 1;
    v13.Position = UDim2.new(0, 5, 0, 0);
    v13.Size = UDim2.new(1, -10, 1, 0);
end;
local function _(v15) --[[ Line: 56 ]] --[[ Name: __StyleRowCellFrame ]]
    -- upvalues: v3 (copy)
    v15.BorderColor3 = v3;
    v15.BorderSizePixel = 1;
    v15.BackgroundTransparency = 0.6;
end;
local v17 = {};
v17.__index = v17;
v17.new = function(v18) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), v5 (copy), v3 (copy), v2 (copy), v4 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v19 = {};
    setmetatable(v19, v17);
    v19._treeViewItem = v18;
    v19._expanded = true;
    v19._expansionToggleCallback = nil;
    v19._frame = Instance.new("Frame");
    v19._frame.Name = "MemoryAnalyzerRowClassFrame";
    v19._frame.BackgroundTransparency = 1;
    v19._buttonFrame = Instance.new("Frame");
    v19._buttonFrame.Name = "ButtonFrame";
    v19._buttonFrame.Parent = v19._frame;
    v19._buttonFrame.Position = v5;
    local v20 = (1 + v18:getStackDepth()) * 20;
    v19._buttonFrame.Size = UDim2.new(0, v20, 0, 20);
    local l__buttonFrame_0 = v19._buttonFrame;
    l__buttonFrame_0.BorderColor3 = v3;
    l__buttonFrame_0.BorderSizePixel = 1;
    l__buttonFrame_0.BackgroundTransparency = 0.6;
    v19._button = Instance.new("TextButton");
    v19._button.Name = "Button";
    v19._button.Parent = v19._buttonFrame;
    l__buttonFrame_0 = v19._button;
    l__buttonFrame_0.TextXAlignment = Enum.TextXAlignment.Center;
    l__buttonFrame_0.TextColor3 = v2;
    l__buttonFrame_0.BackgroundTransparency = 1;
    l__buttonFrame_0.BorderColor3 = v4;
    l__buttonFrame_0.BorderSizePixel = 1;
    l__buttonFrame_0.Position = v6;
    l__buttonFrame_0.Size = v7;
    v19._button.MouseButton1Click:connect(function() --[[ Line: 102 ]]
        -- upvalues: v19 (copy)
        v19:__toggleExpansion();
    end);
    v19:__updateButtonState();
    v19._labelFrame = Instance.new("Frame");
    v19._labelFrame.Name = "LabelFrame";
    v19._labelFrame.Parent = v19._frame;
    v19._labelFrame.Position = UDim2.new(0, v20, 0, 0);
    v19._labelFrame.Size = UDim2.new(1, -v20 - 100, 0, 20);
    l__buttonFrame_0 = v19._labelFrame;
    l__buttonFrame_0.BorderColor3 = v3;
    l__buttonFrame_0.BorderSizePixel = 1;
    l__buttonFrame_0.BackgroundTransparency = 0.6;
    v19._labelTextLabel = Instance.new("TextLabel");
    v19._labelTextLabel.Name = "Label";
    v19._labelTextLabel.Parent = v19._labelFrame;
    l__buttonFrame_0 = v19._labelTextLabel;
    l__buttonFrame_0.TextXAlignment = Enum.TextXAlignment.Left;
    l__buttonFrame_0.TextColor3 = v2;
    l__buttonFrame_0.BackgroundTransparency = 1;
    l__buttonFrame_0.Position = UDim2.new(0, 5, 0, 0);
    l__buttonFrame_0.Size = UDim2.new(1, -10, 1, 0);
    v19._labelTextLabel.Text = v18:getLabel();
    v19._valueFrame = Instance.new("Frame");
    v19._valueFrame.Name = "ValueFrame";
    v19._valueFrame.Parent = v19._frame;
    v19._valueFrame.Position = v8;
    v19._valueFrame.Size = v9;
    l__buttonFrame_0 = v19._valueFrame;
    l__buttonFrame_0.BorderColor3 = v3;
    l__buttonFrame_0.BorderSizePixel = 1;
    l__buttonFrame_0.BackgroundTransparency = 0.6;
    v19._valueTextLabel = Instance.new("TextLabel");
    v19._valueTextLabel.Name = "Value";
    v19._valueTextLabel.Parent = v19._valueFrame;
    l__buttonFrame_0 = v19._valueTextLabel;
    l__buttonFrame_0.TextXAlignment = Enum.TextXAlignment.Left;
    l__buttonFrame_0.TextColor3 = v2;
    l__buttonFrame_0.BackgroundTransparency = 1;
    l__buttonFrame_0.Position = UDim2.new(0, 5, 0, 0);
    l__buttonFrame_0.Size = UDim2.new(1, -10, 1, 0);
    v19._valueHasBeenNonZero = false;
    v19:updateValue();
    return v19;
end;
v17.isExpanded = function(v22) --[[ Line: 143 ]] --[[ Name: isExpanded ]]
    return v22._expanded;
end;
v17.valueHasBeenNonZero = function(v23) --[[ Line: 147 ]] --[[ Name: valueHasBeenNonZero ]]
    return v23._valueHasBeenNonZero;
end;
v17.setExpansionToggleCallback = function(v24, v25) --[[ Line: 151 ]] --[[ Name: setExpansionToggleCallback ]]
    v24._expansionToggleCallback = v25;
end;
v17.__toggleExpansion = function(v26) --[[ Line: 155 ]] --[[ Name: __toggleExpansion ]]
    v26._expanded = not v26._expanded;
    v26:__updateButtonState();
    if v26._expansionToggleCallback ~= nil then
        v26._expansionToggleCallback();
    end;
end;
v17.__updateButtonState = function(v27) --[[ Line: 164 ]] --[[ Name: __updateButtonState ]]
    if #v27._treeViewItem:getChildren() == 0 then
        v27._button.Visible = false;
        return;
    else
        v27._button.Visible = true;
        if v27._expanded then
            v27._button.Text = "-";
            return;
        else
            v27._button.Text = "+";
            return;
        end;
    end;
end;
v17.updateValue = function(v28) --[[ Line: 178 ]] --[[ Name: updateValue ]]
    if v28._treeViewItem:getValue() >= 0.001 then
        v28._valueHasBeenNonZero = true;
    end;
    v28._valueTextLabel.Text = string.format("%.3f", v28._treeViewItem:getValue());
end;
v17.setZIndex = function(v29, v30) --[[ Line: 190 ]] --[[ Name: setZIndex ]]
    v29._frame.ZIndex = v30;
    v29._labelTextLabel.ZIndex = v30;
    v29._valueTextLabel.ZIndex = v30;
end;
v17.setRowValue = function(v31, v32) --[[ Line: 196 ]] --[[ Name: setRowValue ]]
    v31._valueTextLabel.Text = string.format("%.3f", v32);
end;
v17.getFrame = function(v33) --[[ Line: 200 ]] --[[ Name: getFrame ]]
    return v33._frame;
end;
v17.setRowNumber = function(v34, v35) --[[ Line: 204 ]] --[[ Name: setRowNumber ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v35 % 2 == 1 then
        v34._buttonFrame.BackgroundColor3 = v0;
        v34._labelFrame.BackgroundColor3 = v0;
        v34._valueFrame.BackgroundColor3 = v0;
        return;
    else
        v34._buttonFrame.BackgroundColor3 = v1;
        v34._labelFrame.BackgroundColor3 = v1;
        v34._valueFrame.BackgroundColor3 = v1;
        return;
    end;
end;
local v36 = {};
v36.__index = v36;
v36.Indent = string.rep(" ", 4);
v36.new = function(v37) --[[ Line: 227 ]] --[[ Name: new ]]
    -- upvalues: v36 (copy)
    local v38 = {};
    setmetatable(v38, v36);
    v38._frame = Instance.new("Frame");
    v38._frame.Name = "MemoryAnalyzerClassFrame";
    v38._frame.ZIndex = v37.ZIndex;
    v38._frame.BackgroundTransparency = 1;
    v38._rowsByTreeViewItem = {};
    v38._layoutDirty = false;
    v38._heightChangedCallback = nil;
    v38._heightInPix = 0;
    v38._frame.Parent = v37;
    return v38;
end;
v36.getMemoryUsageTree = function(_) --[[ Line: 254 ]] --[[ Name: getMemoryUsageTree ]]
    return nil;
end;
v36.setHeightChangedCallback = function(v40, v41) --[[ Line: 258 ]] --[[ Name: setHeightChangedCallback ]]
    v40._heightChangedCallback = v41;
end;
v36.__getOrMakeRowForTreeViewItem = function(v42, v43) --[[ Line: 262 ]] --[[ Name: __getOrMakeRowForTreeViewItem ]]
    -- upvalues: v17 (copy)
    if v42._rowsByTreeViewItem[v43] == nil then
        local v44 = v17.new(v43);
        v44:setExpansionToggleCallback(function() --[[ Line: 265 ]]
            -- upvalues: v42 (copy)
            v42:__layoutRows();
        end);
        v44:getFrame().Parent = v42._frame;
        v42._rowsByTreeViewItem[v43] = v44;
        v42._layoutDirty = true;
    end;
    return v42._rowsByTreeViewItem[v43];
end;
v36.__recursiveUpdateStatValue = function(v45, v46) --[[ Line: 277 ]] --[[ Name: __recursiveUpdateStatValue ]]
    v45:__getOrMakeRowForTreeViewItem(v46):updateValue();
    local v47 = v46:getChildren();
    for _, v49 in ipairs(v47) do
        v45:__recursiveUpdateStatValue(v49);
    end;
end;
v36.renderUpdates = function(v50) --[[ Line: 288 ]] --[[ Name: renderUpdates ]]
    local v51 = v50:getMemoryUsageTree();
    if v51 ~= nil then
        v50:__recursiveUpdateStatValue(v51);
    end;
    if v50._layoutDirty then
        v50:__layoutRows();
    end;
end;
v36.__layoutRows = function(v52) --[[ Line: 300 ]] --[[ Name: __layoutRows ]]
    v52._layoutDirty = false;
    v52._heightInPix = 0;
    if v52:getMemoryUsageTree() ~= nil then
        v52:__recursiveLayoutTreeViewItem(v52:getMemoryUsageTree(), true);
    end;
    v52._frame.Size = UDim2.new(1, 0, 0, v52._heightInPix);
    v52._frame.Position = UDim2.new(0, 0, 0, 0);
    if v52._heightChangedCallback then
        v52._heightChangedCallback(v52._heightInPix);
    end;
end;
v36.__recursiveLayoutTreeViewItem = function(v53, v54, v55) --[[ Line: 317 ]] --[[ Name: __recursiveLayoutTreeViewItem ]]
    local v56 = v53:__getOrMakeRowForTreeViewItem(v54);
    local v57 = v56:getFrame();
    v55 = v55 and v56:valueHasBeenNonZero();
    if v55 then
        v57.Visible = true;
        v57.Size = UDim2.new(1, 0, 0, 20);
        v57.Position = UDim2.new(0, 0, 0, v53._heightInPix);
        v56:setZIndex(v53._frame.ZIndex);
        v56:setRowNumber(v53._heightInPix / 20);
        v53._heightInPix = v53._heightInPix + 20;
    else
        v57.Visible = false;
    end;
    local v58 = v54:getChildren();
    for _, v60 in ipairs(v58) do
        v53:__recursiveLayoutTreeViewItem(v60, v56:isExpanded() and v55);
    end;
end;
v36.getHeightInPix = function(v61) --[[ Line: 343 ]] --[[ Name: getHeightInPix ]]
    return v61._heightInPix;
end;
return v36;