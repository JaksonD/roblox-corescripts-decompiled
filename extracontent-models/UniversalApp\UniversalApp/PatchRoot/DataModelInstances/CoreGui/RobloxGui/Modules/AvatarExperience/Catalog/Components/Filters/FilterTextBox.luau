local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v10 = l_Images_0["component_assets/circle_17_stroke_1"];
local v11 = Rect.new(8, 8, 8, 8);
return function(v12) --[[ Line: 36 ]] --[[ Name: FilterTextBox ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v10 (copy), v11 (copy), l_Focusable_0 (copy)
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = l_useSelectionCursor_0(l_CursorKind_0.InputFields);
    return v1.createElement("Frame", {
        BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
        BackgroundColor3 = l_Theme_0.UIMuted.Color, 
        Size = if v12.width then UDim2.new(v12.width.Scale, v12.width.Offset, 0, 30) else UDim2.new(1, 0, 0, 30), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BorderSizePixel = 0, 
        LayoutOrder = v12.layoutOrder
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Outline = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v10, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            SliceCenter = v11
        }), 
        Textbox = v1.createElement(l_Focusable_0.TextBox, {
            Text = v12.text, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
            PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
            PlaceholderText = v12.placeholderText, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -16, 1, 0), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OverlayNativeInput = true, 
            [v1.Change.Text] = function(v17) --[[ Line: 42 ]] --[[ Name: onTextChanged ]]
                -- upvalues: v12 (copy)
                local l_Text_0 = v17.Text;
                if v12.onTextChanged then
                    v12.onTextChanged(l_Text_0);
                end;
            end, 
            [v1.Event.Focused] = v12.onFocused, 
            SelectionImageObject = v16, 
            ref = v12.textBoxRef, 
            NextSelectionLeft = v12.NextSelectionLeft, 
            NextSelectionRight = v12.NextSelectionRight, 
            NextSelectionUp = v12.NextSelectionUp, 
            NextSelectionDown = v12.NextSelectionDown
        })
    });
end;