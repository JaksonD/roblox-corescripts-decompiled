local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.Common;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v4 = require(l_Common_0.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local v8 = require(l_Modules_0.LuaApp.FitChildren);
return function(v9) --[[ Line: 15 ]]
    -- upvalues: l_withStyle_0 (copy), l_Text_0 (copy), v4 (copy), v8 (copy), l_LinkButton_0 (copy)
    return l_withStyle_0(function(v10) --[[ Line: 16 ]]
        -- upvalues: v9 (copy), l_Text_0 (ref), v4 (ref), v8 (ref), l_LinkButton_0 (ref)
        local l_spacing_0 = v9.spacing;
        local v12 = v9.LayoutOrder or 1;
        local l_AnchorPoint_0 = v9.AnchorPoint;
        local l_textLabelText_0 = v9.textLabelText;
        local l_textLabelColor_0 = v9.textLabelColor;
        local l_TextTransparency_0 = v9.TextTransparency;
        local v17 = v9.fontStyle or "CaptionBody";
        local v18 = v10.Font[v17];
        local v19 = v9.buttonSize or UDim2.fromScale(0, 1);
        local l_linkColorStyle_0 = v9.linkColorStyle;
        local l_linkText_0 = v9.linkText;
        local l_onActivated_0 = v9.onActivated;
        local l_textButtonEnabled_0 = v9.textButtonEnabled;
        if l_textButtonEnabled_0 == nil then
            l_textButtonEnabled_0 = true;
        end;
        local v24 = v18.RelativeSize * v10.Font.BaseSize;
        local v25 = l_Text_0.GetTextWidth(l_textLabelText_0 or "", v18.Font, v24);
        local v26 = l_spacing_0 or l_Text_0.GetTextWidth(" ", v18.Font, v24);
        return v4.createElement(v8.FitFrame, {
            Size = UDim2.fromOffset(0, v24), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = v12, 
            fitAxis = v8.FitAxis.Width
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v26), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TextLabel = v4.createElement("TextLabel", {
                TextSize = v24, 
                Font = v18.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v25, 1, 0), 
                Text = l_textLabelText_0, 
                TextTransparency = l_TextTransparency_0, 
                TextColor3 = l_textLabelColor_0, 
                LayoutOrder = 1
            }), 
            LinkButton = v4.createElement(l_LinkButton_0, {
                fontStyle = v17, 
                size = v19, 
                text = l_linkText_0, 
                colorStyleDefault = l_linkColorStyle_0, 
                colorStyleHover = l_linkColorStyle_0, 
                layoutOrder = 2, 
                isDisabled = not l_textButtonEnabled_0, 
                onActivated = l_onActivated_0
            })
        });
    end);
end;