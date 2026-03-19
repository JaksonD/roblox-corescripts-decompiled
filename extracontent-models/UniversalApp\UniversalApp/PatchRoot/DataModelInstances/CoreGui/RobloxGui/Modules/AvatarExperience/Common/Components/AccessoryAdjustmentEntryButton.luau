local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_usePulseAnimationBinding_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Hooks.usePulseAnimationBinding;
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local v13 = l_Images_0["icons/menu/transform"];
local v14 = UDim.new(0, 8);
return (v1.forwardRef(function(v15, v16) --[[ Line: 41 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v1 (copy), l_useTokens_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_usePulseAnimationBinding_0 (copy), l_Focusable_0 (copy), v14 (copy), l_ImageSetButton_0 (copy), l_IconSize_0 (copy), v13 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v18 = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v1.useRef(nil);
    local v19 = l_useTokens_0();
    local v20 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v21 = l_usePulseAnimationBinding_0(v15.enableFocusAnimation);
    return v1.createElement(l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and "Frame" or l_Focusable_0.Frame, {
        Size = UDim2.fromOffset(44, 44), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        LayoutOrder = v15.LayoutOrder, 
        ref = v16, 
        defaultChild = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v18
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = v14
        }), 
        Button = v1.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v13, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = 0, 
            [v1.Event.Activated] = v15.onActivated, 
            ref = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v18, 
            NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v15.NextSelectionUp, 
            NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v15.NextSelectionDown, 
            NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v15.NextSelectionLeft, 
            NextSelectionRight = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v15.NextSelectionRight, 
            SelectionImageObject = v20
        }), 
        UIStroke = if v15.enableFocusAnimation then v1.createElement("UIStroke", {
            Color = v19.Color.ActionEmphasis.Background.Color3, 
            Thickness = v21 and v21:map(function(v22) --[[ Line: 92 ]]
                return v22.thickness;
            end), 
            Transparency = v21 and v21:map(function(v23) --[[ Line: 95 ]]
                return v23.transparency;
            end)
        }) else nil
    });
end));