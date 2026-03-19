local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v11 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Services.Analytics);
local v12 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics);
local _ = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local v14 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType);
local l_Focusable_0 = v4.Focusable;
return function(v16) --[[ Line: 39 ]] --[[ Name: AdjustmentTypeButton ]]
    -- upvalues: l_useStyle_0 (copy), v10 (copy), v11 (copy), l_useDispatch_0 (copy), v2 (copy), l_Focusable_0 (copy), v12 (copy), v14 (copy), l_ImageSetLabel_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v18 = v10(v11);
    local l_Color_0 = l_Theme_0.BackgroundUIDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundUIDefault.Transparency;
    if v16.isSelected then
        l_Color_0 = l_Theme_0.UIDefault.Color;
        l_Transparency_0 = l_Theme_0.UIDefault.Transparency;
    end;
    local v21 = l_useDispatch_0();
    return v2.createElement(l_Focusable_0.ImageButton, {
        Size = UDim2.fromScale(0.3333333333333333, 1), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        LayoutOrder = v16.LayoutOrder, 
        ref = v16.buttonRef, 
        NextSelectionLeft = v16.NextSelectionLeft, 
        NextSelectionRight = v16.NextSelectionRight, 
        NextSelectionUp = v16.NextSelectionUp, 
        [v2.Event.Activated] = function() --[[ Line: 63 ]]
            -- upvalues: v21 (copy), v12 (ref), v18 (copy), v16 (copy), v14 (ref)
            v21(v12(v18.avatarRefineAccessoryAdjustTap(v16.adjustmentType)));
            v21(v14(v16.adjustmentType));
        end
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Image = v2.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            BackgroundTransparency = 1, 
            Image = l_Images_0[v16.iconName], 
            ImageColor3 = l_Theme_0.IconDefault.Color, 
            ImageTransparency = l_Theme_0.IconDefault.Transparency
        })
    });
end;