local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Constants);
local l_CheckboxInnerPadding_0 = v3.UtilityBarFormatting.CheckboxInnerPadding;
local v5 = v2.Component:extend("Checkbox");
v5.render = function(v6) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_TextService_0 (copy), v2 (copy), l_CheckboxInnerPadding_0 (copy)
    local l_checkboxHeight_0 = v6.props.checkboxHeight;
    local l_frameHeight_0 = v6.props.frameHeight;
    local l_layoutOrder_0 = v6.props.layoutOrder;
    local l_name_0 = v6.props.name;
    local l_font_0 = v6.props.font;
    local l_fontSize_0 = v6.props.fontSize;
    local l_isSelected_0 = v6.props.isSelected;
    local l_selectedColor_0 = v6.props.selectedColor;
    local l_unselectedColor_0 = v6.props.unselectedColor;
    local l_onCheckboxClicked_0 = v6.props.onCheckboxClicked;
    local v17 = "";
    local v18 = 1;
    local l_l_unselectedColor_0_0 = l_unselectedColor_0;
    if l_isSelected_0 then
        v17 = v3.Image.Check;
        v18 = 0;
        l_l_unselectedColor_0_0 = l_selectedColor_0;
    end;
    local l_X_0 = l_TextService_0:GetTextSize(l_name_0, l_fontSize_0, l_font_0, Vector2.new(0, l_frameHeight_0)).X;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(0, l_checkboxHeight_0 + l_X_0 + l_CheckboxInnerPadding_0 * 2, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Event.Activated] = function(_) --[[ Line: 43 ]]
            -- upvalues: l_onCheckboxClicked_0 (copy), l_name_0 (copy), l_isSelected_0 (copy)
            l_onCheckboxClicked_0(l_name_0, not l_isSelected_0);
        end
    }, {
        Icon = v2.createElement("ImageLabel", {
            Image = v17, 
            Size = UDim2.new(0, l_checkboxHeight_0, 0, l_checkboxHeight_0), 
            Position = UDim2.new(0, 0, 0.5, -l_checkboxHeight_0 / 2), 
            BackgroundColor3 = l_l_unselectedColor_0_0, 
            BackgroundTransparency = 0, 
            BorderColor3 = v3.Color.Text, 
            BorderSizePixel = v18
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
return v5;