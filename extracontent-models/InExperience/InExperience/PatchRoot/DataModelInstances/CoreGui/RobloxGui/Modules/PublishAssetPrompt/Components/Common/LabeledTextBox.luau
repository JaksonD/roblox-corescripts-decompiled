local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Parent_0 = script.Parent;
local v6 = require(l_Parent_0.NameTextBox);
local v7 = {
    textBoxHeight = 30, 
    topPadding = 0
};
return function(v8) --[[ Line: 43 ]] --[[ Name: LabeledTextBox ]]
    -- upvalues: v3 (copy), v7 (copy), l_useStyle_0 (copy), v1 (copy), v6 (copy)
    local v9 = v3.Dictionary.join(v7, v8);
    local v10 = l_useStyle_0();
    local l_Font_0 = v10.Font;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local l_Theme_0 = v10.Theme;
    local v14 = 19 + v9.textBoxHeight + v9.topPadding;
    local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
    local l_Color_0 = l_Theme_0.TextDefault.Color;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v14), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 4)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v9.topPadding)
        }), 
        TextboxLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 15), 
            Font = l_CaptionHeader_0.Font, 
            Text = v9.labelText, 
            TextSize = l_BaseSize_0 * l_CaptionHeader_0.RelativeSize, 
            TextColor3 = l_Color_0, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1
        }), 
        Textbox = v1.createElement(v6, {
            Size = UDim2.new(1, 0, 0, v9.textBoxHeight), 
            maxLength = v9.maxLength, 
            onNameUpdated = v9.onTextUpdated, 
            defaultName = v9.defaultText, 
            centerText = v9.centerText, 
            nameTextBoxRef = v9.textBoxRef, 
            LayoutOrder = 2, 
            invalidInputText = v9.invalidInputText
        })
    });
end;