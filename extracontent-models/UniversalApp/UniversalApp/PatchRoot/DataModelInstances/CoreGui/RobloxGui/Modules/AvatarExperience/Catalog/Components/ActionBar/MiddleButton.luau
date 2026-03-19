local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_Images_0 = v3.App.ImageSet.Images;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = UDim2.new(0, 44, 0, 44);
local v12 = UDim2.new(0, 37, 0, 37);
local v13 = l_Images_0["component_assets/circle_17"];
local v14 = Rect.new(8, 8, 9, 9);
return v1.forwardRef(function(v15, v16) --[[ Line: 27 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v1 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v11 (copy), v13 (copy), v14 (copy), l_ImageSetLabel_0 (copy), v12 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_onActivated_0 = v15.onActivated;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local v20 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    local l_icon_0 = v15.icon;
    return v1.createElement(l_Focusable_0[l_Interactable_0], {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v11, 
        Image = v13, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v14, 
        ImageTransparency = l_Transparency_0, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 2, 
        ClipsDescendants = false, 
        [v1.Event.Activated] = l_onActivated_0, 
        NextSelectionRight = v15.NextSelectionRight, 
        NextSelectionLeft = v15.NextSelectionLeft, 
        ref = v16, 
        SelectionImageObject = v20
    }, {
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Size = v12, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = l_icon_0, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        })
    });
end);