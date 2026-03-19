local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
local v3 = require(script.Parent.Checkbox);
local _ = v2.DefaultFontSize.MainWindow;
local _ = v2.Color.Text;
local _ = v2.Font.MainWindow;
local _ = v2.Font.MainWindowBold;
local l_CheckboxHeight_0 = v2.UtilityBarFormatting.CheckboxHeight;
local _ = v2.UtilityBarFormatting.CheckboxInnerPadding;
return function(v10) --[[ Line: 23 ]] --[[ Name: CellCheckbox ]]
    -- upvalues: v1 (copy), v3 (copy), l_CheckboxHeight_0 (copy)
    local l_isSelected_0 = v10.isSelected;
    local l_size_0 = v10.size;
    local l_pos_0 = v10.pos;
    local l_LayoutOrder_0 = v10.LayoutOrder;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Checkbox = v1.createElement(v3, {
            Name = v10.name, 
            IsSelected = l_isSelected_0, 
            Size = UDim2.new(0, l_CheckboxHeight_0, 0, l_CheckboxHeight_0), 
            Position = UDim2.new(0, 0, 0.5, -l_CheckboxHeight_0 / 2), 
            OnSelectedStateChanged = v10.OnCheckboxClicked
        })
    });
end;