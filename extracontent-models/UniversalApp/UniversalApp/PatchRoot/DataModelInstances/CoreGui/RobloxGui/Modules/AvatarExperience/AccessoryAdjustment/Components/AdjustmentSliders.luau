local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSlider);
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v9 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local l_Focusable_0 = v4.Focusable;
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v21(v13, v14, v15, v16, v17, v18, v19, v20) --[[ Line: 40 ]] --[[ Name: Slider ]]
    -- upvalues: v2 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return v2.createElement(v7, {
        sliderRef = v18, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v19, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v20, 
        LayoutOrder = v15, 
        adjustmentSliderType = v14, 
        sliderValue = v13[v14], 
        updateCharacterCallback = v16, 
        setSliderValuesCallback = v17
    });
end;
local function v30(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 63 ]] --[[ Name: getSliders ]]
    -- upvalues: v9 (copy), v21 (copy), v8 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy)
    local v29 = {};
    if v22 == v9.Position then
        table.insert(v29, v21(v23, v8.PositionX, 1, v24, v25, v26[1], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v27, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[2]));
        table.insert(v29, v21(v23, v8.PositionY, 2, v24, v25, v26[2], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[1], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[3]));
        table.insert(v29, v21(v23, v8.PositionZ, 3, v24, v25, v26[3], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[2], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v28));
    elseif v22 == v9.Rotation then
        table.insert(v29, v21(v23, v8.RotationX, 1, v24, v25, v26[1], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v27, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[2]));
        table.insert(v29, v21(v23, v8.RotationY, 2, v24, v25, v26[2], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[1], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[3]));
        table.insert(v29, v21(v23, v8.RotationZ, 3, v24, v25, v26[3], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26[2], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v28));
    elseif v22 == v9.Scale then
        table.insert(v29, v21(v23, v8.Scale, 1, v24, v25, v26[1], if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v27, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v28));
    end;
    table.insert(v29, v2.createElement("UIListLayout", {
        Padding = UDim.new(0, 24), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }));
    table.insert(v29, v2.createElement("UIPadding", {
        PaddingRight = UDim.new(0, 5)
    }));
    return v29;
end;
if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    return function(v31) --[[ Line: 195 ]] --[[ Name: AdjustmentSliders ]]
        -- upvalues: l_useStyle_0 (copy), v4 (copy), v2 (copy), v30 (copy), v9 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
        local l_Theme_0 = l_useStyle_0().Theme;
        local v33 = v4.useRefCache();
        local v34 = v4.useRefCache();
        local v35 = v4.useRefCache();
        local v36 = v2.useRef(nil);
        local v37 = v2.useRef(nil);
        local v38 = v2.useRef(nil);
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        v39 = v30(v9.Position, v31.sliderValues, v31.updateCharacterCallback, v31.setSliderValuesCallback, v33, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionUp, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionDown);
        v40 = v30(v9.Rotation, v31.sliderValues, v31.updateCharacterCallback, v31.setSliderValuesCallback, v34, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionUp, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionDown);
        v41 = v30(v9.Scale, v31.sliderValues, v31.updateCharacterCallback, v31.setSliderValuesCallback, v35, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionUp, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.NextSelectionDown);
        return v2.createElement("Frame", {
            ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31.frameRef, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v31.LayoutOrder
        }, {
            PositionSlidersContainer = if v31.adjustmentTypeSelected == v9.Position then v2.createElement("Frame", {
                ref = v36, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, v39) else nil, 
            RotationSlidersContainer = if v31.adjustmentTypeSelected == v9.Rotation then v2.createElement("Frame", {
                ref = v37, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, v40) else nil, 
            ScaleSlidersContainer = if v31.adjustmentTypeSelected == v9.Scale then v2.createElement("Frame", {
                ref = v38, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, v41) else nil, 
            BackPanel = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 1
            })
        });
    end;
else
    return function(v42) --[[ Line: 293 ]] --[[ Name: AdjustmentSliders ]]
        -- upvalues: l_useStyle_0 (copy), v4 (copy), v2 (copy), v30 (copy), v9 (copy), l_Focusable_0 (copy)
        local l_Theme_1 = l_useStyle_0().Theme;
        local v44 = v4.useRefCache();
        local v45 = v4.useRefCache();
        local v46 = v4.useRefCache();
        local v47 = v2.useRef(nil);
        local v48 = v2.useRef(nil);
        local v49 = v2.useRef(nil);
        local v50, v51 = v2.useState(v44[1]);
        local v52 = nil;
        local v53 = nil;
        local v54 = nil;
        v52 = v30(v9.Position, v42.sliderValues, v42.updateCharacterCallback, v42.setSliderValuesCallback, v44, v42.NextSelectionUp, v42.NextSelectionDown);
        v53 = v30(v9.Rotation, v42.sliderValues, v42.updateCharacterCallback, v42.setSliderValuesCallback, v45, v42.NextSelectionUp, v42.NextSelectionDown);
        v54 = v30(v9.Scale, v42.sliderValues, v42.updateCharacterCallback, v42.setSliderValuesCallback, v46, v42.NextSelectionUp, v42.NextSelectionDown);
        v2.useEffect(function() --[[ Line: 341 ]]
            -- upvalues: v42 (copy), v9 (ref), v51 (copy), v47 (copy), v48 (copy), v49 (copy)
            if v42.adjustmentTypeSelected == v9.Position then
                v51(v47);
                return;
            elseif v42.adjustmentTypeSelected == v9.Rotation then
                v51(v48);
                return;
            else
                v51(v49);
                return;
            end;
        end, {
            v42.adjustmentTypeSelected
        });
        return v2.createElement(l_Focusable_0.Frame, {
            ref = v42.frameRef, 
            defaultChild = v50, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v42.LayoutOrder
        }, {
            PositionSlidersContainer = v2.createElement(l_Focusable_0.Frame, {
                ref = v47, 
                defaultChild = v44[1], 
                restorePreviousChildFocus = true, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = v42.adjustmentTypeSelected == v9.Position and 2 or 0
            }, v52), 
            RotationSlidersContainer = v2.createElement(l_Focusable_0.Frame, {
                ref = v48, 
                defaultChild = v45[1], 
                restorePreviousChildFocus = true, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = v42.adjustmentTypeSelected == v9.Rotation and 2 or 0
            }, v53), 
            ScaleSlidersContainer = v2.createElement(l_Focusable_0.Frame, {
                ref = v49, 
                defaultChild = v46[1], 
                restorePreviousChildFocus = true, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = v42.adjustmentTypeSelected == v9.Scale and 2 or 0
            }, v54), 
            BackPanel = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 1
            })
        });
    end;
end;