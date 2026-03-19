local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Constants);
local v4 = require(script.Parent.Checkbox);
local l_CheckboxInnerPadding_0 = v3.UtilityBarFormatting.CheckboxInnerPadding;
local v6 = v2.Component:extend("LabeledCheckbox");
v6.render = function(v7) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v2 (copy), l_CheckboxInnerPadding_0 (copy), v4 (copy), v3 (copy)
    local l_checkboxHeight_0 = v7.props.checkboxHeight;
    local l_frameHeight_0 = v7.props.frameHeight;
    local l_layoutOrder_0 = v7.props.layoutOrder;
    local l_name_0 = v7.props.name;
    local l_font_0 = v7.props.font;
    local l_fontSize_0 = v7.props.fontSize;
    local l_isSelected_0 = v7.props.isSelected;
    local l_selectedColor_0 = v7.props.selectedColor;
    local l_unselectedColor_0 = v7.props.unselectedColor;
    local l_onCheckboxClicked_0 = v7.props.onCheckboxClicked;
    local l_X_0 = l_TextService_0:GetTextSize(l_name_0, l_fontSize_0, l_font_0, Vector2.new(0, l_frameHeight_0)).X;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, l_checkboxHeight_0 + l_X_0 + l_CheckboxInnerPadding_0 * 2, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Checkbox = v2.createElement(v4, {
            Name = l_name_0, 
            IsSelected = l_isSelected_0, 
            SelectedColor = l_selectedColor_0, 
            UnselectedColor = l_unselectedColor_0, 
            Size = UDim2.new(0, l_checkboxHeight_0, 0, l_checkboxHeight_0), 
            Position = UDim2.new(0, 0, 0.5, -l_checkboxHeight_0 / 2), 
            OnSelectedStateChanged = l_onCheckboxClicked_0
        }), 
        Text = v2.createElement("TextLabel", {
            Text = l_name_0, 
            TextColor3 = v3.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_font_0, 
            TextSize = l_fontSize_0, 
            Size = UDim2.new(1, -l_frameHeight_0, 1, 0), 
            Position = UDim2.new(0, l_checkboxHeight_0 + l_CheckboxInnerPadding_0, 0, 0), 
            BackgroundTransparency = 1
        })
    });
end;
return v6;