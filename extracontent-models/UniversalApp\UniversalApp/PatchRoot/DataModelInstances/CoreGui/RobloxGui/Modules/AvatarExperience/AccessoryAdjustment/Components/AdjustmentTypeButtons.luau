local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButton);
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_Focusable_0 = v4.Focusable;
return function(v13) --[[ Line: 46 ]] --[[ Name: AdjustmentTypeButtons ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v8 (copy), l_Focusable_0 (copy), v7 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v15 = v2.useRef(nil);
    local v16 = v2.useRef(nil);
    local v17 = v2.useRef(nil);
    local v18 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v19 = v13.adjustmentTypeSelected == v8.Scale;
    local v20 = v13.adjustmentTypeSelected == v8.Position;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v18 then
        v2.useEffect(function() --[[ Line: 58 ]]
            -- upvalues: v18 (copy), v15 (copy)
            v18(v15.current);
        end, {
            v18
        });
    end;
    return v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        LayoutOrder = v13.LayoutOrder, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.frameRef, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v15, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionDown
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        MoveButton = v2.createElement(v7, {
            LayoutOrder = 1, 
            isSelected = v13.adjustmentTypeSelected == v8.Position, 
            adjustmentType = v8.Position, 
            iconName = "icons/menu/adjust/position_small", 
            buttonRef = v15, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionLeft, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionUp, 
            NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v16
        }), 
        Divider1 = v2.createElement("Frame", {
            Size = UDim2.new(0, 1, 1, 0), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            LayoutOrder = 2, 
            Visible = v19, 
            BorderSizePixel = 0
        }), 
        RotateButton = v2.createElement(v7, {
            LayoutOrder = 3, 
            isSelected = v13.adjustmentTypeSelected == v8.Rotation, 
            adjustmentType = v8.Rotation, 
            iconName = "icons/menu/adjust/rotation_small", 
            buttonRef = v16, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionUp, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v15, 
            NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v17
        }), 
        Divider2 = v2.createElement("Frame", {
            Size = UDim2.new(0, 1, 1, 0), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            LayoutOrder = 4, 
            Visible = v20, 
            BorderSizePixel = 0
        }), 
        ScaleButton = v2.createElement(v7, {
            LayoutOrder = 5, 
            isSelected = v13.adjustmentTypeSelected == v8.Scale, 
            adjustmentType = v8.Scale, 
            iconName = "icons/menu/adjust/scale_small", 
            buttonRef = v17, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionUp, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v16, 
            NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.NextSelectionRight
        })
    });
end;