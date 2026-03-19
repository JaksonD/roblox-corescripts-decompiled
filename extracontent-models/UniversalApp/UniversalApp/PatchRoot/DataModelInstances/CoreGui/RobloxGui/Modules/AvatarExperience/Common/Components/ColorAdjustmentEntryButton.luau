local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_IconButton_0 = v2.App.Button.IconButton;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_ColorGradientCircle_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.ColorGradientCircle;
local v12 = game:DefineFastFlag("AXFixColorAdjustmentQuickButtonSize", false);
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local v14 = UDim.new(0, 8);
local v15 = UDim.new(0, 4);
return (v1.forwardRef(function(v16, v17) --[[ Line: 40 ]]
    -- upvalues: l_useTokens_0 (copy), l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v12 (copy), v1 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), l_Focusable_0 (copy), v14 (copy), l_ImageSetButton_0 (copy), l_IconSize_0 (copy), v15 (copy), l_ColorGradientCircle_0 (copy), l_IconButton_0 (copy)
    local v18 = l_useTokens_0();
    local v19 = l_useStyle_0();
    local v20 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local l_Theme_0 = v19.Theme;
    local v22 = if v12 then v1.useRef(nil) else nil;
    if v12 then
        return v1.createElement(l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and "Frame" or l_Focusable_0.Frame, {
            Size = UDim2.fromOffset(44, 44), 
            BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
            LayoutOrder = v16.LayoutOrder, 
            ref = v17, 
            defaultChild = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v22
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = v14
            }), 
            Button = v1.createElement(if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
                BackgroundTransparency = 1, 
                [v1.Event.Activated] = v16.onActivated, 
                ref = v22, 
                NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionUp, 
                NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionDown, 
                NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionLeft, 
                NextSelectionRight = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionRight, 
                SelectionImageObject = v20
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = v15, 
                    PaddingBottom = v15, 
                    PaddingLeft = v15, 
                    PaddingRight = v15
                }), 
                Color = v1.createElement(l_ColorGradientCircle_0, {
                    Size = UDim2.fromScale(1, 1), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Colors = v16.colors
                })
            })
        });
    else
        return v1.createElement(l_IconButton_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            layoutOrder = v16.LayoutOrder, 
            showBackground = true, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = v16.onActivated, 
            backgroundColor = l_Theme_0.BackgroundUIDefault, 
            buttonRef = v17, 
            NextSelectionUp = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionUp, 
            NextSelectionDown = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionDown, 
            NextSelectionLeft = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionLeft, 
            NextSelectionRight = if l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 then nil else v16.NextSelectionRight
        }, {
            Color = v1.createElement(l_ColorGradientCircle_0, {
                Size = UDim2.fromOffset(v18.Size.Size_700, v18.Size.Size_700), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Colors = v16.colors
            })
        });
    end;
end));