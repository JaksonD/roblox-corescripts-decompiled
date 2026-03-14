local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v6 = require(l_Parent_0.Roact);
return function(v7) --[[ Line: 23 ]] --[[ Name: CountryCodeButton ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v6 (copy)
    local v8 = l_useStyle_0();
    local l_Tokens_0 = v8.Tokens;
    local l_TextField_0 = l_Tokens_0.Component.TextField;
    local l_size_0 = v7.size;
    local l_layoutOrder_0 = v7.layoutOrder;
    local l_countryPrefix_0 = v7.countryPrefix;
    local v14 = if v7.error then l_Tokens_0.Global.Color.Red.Color3 else v8.Theme.UIDefault.Color;
    local l_Transparency_0 = v8.Theme.UIDefault.Transparency;
    local v16 = v7.font or l_TextField_0.Base.Field.Typography.Font;
    local v17 = v7.textSize or l_TextField_0.Base.Field.Typography.FontSize;
    return v1.createElement(l_ImageSetLabel_0, {
        ZIndex = 2, 
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(9, 9, 9, 9), 
        Image = l_GetImageData_0("LuaApp/buttons/buttonStroke"), 
        ImageColor3 = v14, 
        ImageTransparency = l_Transparency_0, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Button = v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = l_countryPrefix_0, 
            Font = v16, 
            TextSize = v17, 
            TextColor3 = l_TextField_0.Base.FieldValue.ContentColor.Color3, 
            TextTransparency = l_TextField_0.Base.FieldValue.ContentColor.Transparency, 
            [v6.Event.Activated] = v7.onButtonClick, 
            [v6.Ref] = v7.forwardRef
        })
    });
end;