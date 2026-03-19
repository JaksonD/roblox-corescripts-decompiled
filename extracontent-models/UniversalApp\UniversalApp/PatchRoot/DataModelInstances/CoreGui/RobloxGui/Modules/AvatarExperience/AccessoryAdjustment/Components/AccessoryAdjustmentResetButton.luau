local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v11 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAdjustmentViewShortcutBarUpdate);
local v13 = l_Images_0["icons/actions/reset"];
local function v15(v14) --[[ Line: 33 ]] --[[ Name: mapTokens ]]
    return {
        mediumIconSize = v14.Semantic.Icon.Size.Medium
    };
end;
return function(v16) --[[ Line: 39 ]] --[[ Name: ResetButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), v15 (copy), l_useStyle_0 (copy), l_useIsGamepad_0 (copy), v3 (copy), l_Focusable_0 (copy), l_ImageSetButton_0 (copy), v11 (copy), v13 (copy), v12 (copy)
    local v17 = l_useDesignTokens_0(v15);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v19 = l_useIsGamepad_0();
    return v3.createElement(l_Focusable_0[l_ImageSetButton_0], {
        ref = v16.resetRef, 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.new(1, -v11.RightMargin, 0, -9), 
        Size = UDim2.new(0, v17.mediumIconSize, 0, v17.mediumIconSize), 
        BackgroundTransparency = 1, 
        Image = v13, 
        ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
        ImageTransparency = 0, 
        LayoutOrder = 1, 
        [v3.Event.Activated] = v16.onResetButtonPressed, 
        NextSelectionLeft = v16.NextSelectionLeft, 
        ZIndex = 3, 
        Visible = if v12 then not v19 else nil
    });
end;