local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_SystemSlider_0 = v4.App.Slider.SystemSlider;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Selectors.selectLowerAdjustmentLimits);
local v12 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Selectors.selectUpperAdjustmentLimits);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v15 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v16 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v17 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AxisType);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v19 = game:DefineFastInt("AXAdjustmentSnapThreshold", 5);
local v20 = game:DefineFastFlag("AXAddVRContainerRefToAASlider", false);
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMakeSlidersSmoothWithGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad;
local v23 = l_Images_0["component_assets/circle_21"];
local v24 = {
    [v16.PositionX] = {
        Text = v17.X, 
        Color = v15.XAxisColor, 
        AdjustmentKey = "position", 
        LimitKey = "xPosition", 
        Invert = true
    }, 
    [v16.PositionY] = {
        Text = v17.Y, 
        Color = v15.YAxisColor, 
        AdjustmentKey = "position", 
        LimitKey = "yPosition"
    }, 
    [v16.PositionZ] = {
        Text = v17.Z, 
        Color = v15.ZAxisColor, 
        AdjustmentKey = "position", 
        LimitKey = "zPosition", 
        Invert = true
    }, 
    [v16.RotationX] = {
        Text = v17.X, 
        Color = v15.XAxisColor, 
        AdjustmentKey = "rotation", 
        LimitKey = "xRotation", 
        Invert = true
    }, 
    [v16.RotationY] = {
        Text = v17.Y, 
        Color = v15.YAxisColor, 
        AdjustmentKey = "rotation", 
        LimitKey = "yRotation"
    }, 
    [v16.RotationZ] = {
        Text = v17.Z, 
        Color = v15.ZAxisColor, 
        AdjustmentKey = "rotation", 
        LimitKey = "zRotation"
    }, 
    [v16.Scale] = {
        Text = "", 
        Color = v15.ZAxisColor, 
        AdjustmentKey = "scale", 
        LimitKey = "xScale"
    }
};
local function _(v25, v26, v27) --[[ Line: 92 ]]
    -- upvalues: v24 (copy)
    local l_AdjustmentKey_0 = v24[v25].AdjustmentKey;
    local l_LimitKey_0 = v24[v25].LimitKey;
    return v26[l_AdjustmentKey_0][l_LimitKey_0], v27[l_AdjustmentKey_0][l_LimitKey_0];
end;
local function v34(v31, v32, v33) --[[ Line: 113 ]] --[[ Name: SliderImage ]]
    -- upvalues: v3 (copy), l_ImageSetLabel_0 (copy), v23 (copy), v24 (copy), v15 (copy)
    return v3.createElement(l_ImageSetLabel_0, {
        Size = UDim2.new(0, v33, 0, v33), 
        BackgroundTransparency = 1, 
        Image = v23, 
        ImageColor3 = v24[v32].Color, 
        ImageTransparency = v31.IconEmphasis.Transparency, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }, {
        Letter = v3.createElement("TextLabel", {
            Size = UDim2.new(1, -3, 1, -3), 
            BackgroundTransparency = 1, 
            Text = v24[v32].Text, 
            TextScaled = true, 
            FontFace = v15.FontFace, 
            TextColor3 = Color3.new(1, 1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ZIndex = 2
        })
    });
end;
local function _(v35, v36, v37, v38, v39) --[[ Line: 138 ]] --[[ Name: valueToPercent ]]
    local v40 = nil;
    v40 = if v35 < v38 then -math.abs((v35 - v38) / (v36 - v38)) else math.abs((v35 - v38) / (v37 - v38));
    if v39 then
        v40 = -v40;
    end;
    return v40 * 100;
end;
local function _(v42, v43, v44, v45, v46) --[[ Line: 151 ]] --[[ Name: percentToValue ]]
    if v46 then
        v42 = -v42;
    end;
    if v42 < 0 then
        return v45 - math.abs(v42 / 100) * math.abs(v45 - v43);
    else
        return v45 + math.abs(v42 / 100) * math.abs(v44 - v45);
    end;
end;
local function v49(v48) --[[ Line: 161 ]]
    return v48.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
end;
if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    local _ = function(v50, _, v52, v53, v54) --[[ Line: 166 ]] --[[ Name: convertStoredValueToSliderValue ]]
        -- upvalues: v5 (copy)
        if v52 <= v53 then
            v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
            return 0.5;
        else
            local v55 = nil;
            v55 = if v50 < v53 then 0.5 - (v53 - v50) / (v52 - v53) / 2 else (v50 - v53) / (v52 - v53) / 2 + 0.5;
            if v54 then
                return 1 - v55;
            else
                return v55;
            end;
        end;
    end;
    local _ = function(v57, _, v59, v60, v61) --[[ Line: 193 ]] --[[ Name: convertSliderValueToStoredValue ]]
        if v61 then
            v57 = 1 - v57;
        end;
        local _ = nil;
        if v57 < 0.5 then
            return v60 - (0.5 - v57) / 0.5 * (v59 - v60);
        else
            return v60 + (v57 - 0.5) / 0.5 * (v59 - v60);
        end;
    end;
    return function(v64) --[[ Line: 214 ]] --[[ Name: AdjustmentSlider ]]
        -- upvalues: l_useStyle_0 (copy), v20 (copy), l_useIsSpatial_0 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v12 (copy), v49 (copy), v15 (copy), v14 (copy), v24 (copy), l_useDesignTokens_0 (copy), v16 (copy), v5 (copy), v34 (copy), v2 (copy), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (copy)
        local l_Theme_0 = l_useStyle_0().Theme;
        local v66 = if v20 then l_useIsSpatial_0() else nil;
        local v67 = if v20 and v66 then v3.createRef() else nil;
        local v68 = l_useSelector_0(v11);
        local v69 = l_useSelector_0(v12);
        local v70 = l_useSelector_0(v49) ~= v15.AdjustmentSliderTypeToAdjustmentType[v64.adjustmentSliderType];
        local v71 = v3.useRef(false);
        local v72 = nil;
        v72 = v14.useLastInput() == v14.Input.Directional;
        local l_adjustmentSliderType_0 = v64.adjustmentSliderType;
        local l_AdjustmentKey_1 = v24[l_adjustmentSliderType_0].AdjustmentKey;
        local l_LimitKey_1 = v24[l_adjustmentSliderType_0].LimitKey;
        local v76 = v68[l_AdjustmentKey_1][l_LimitKey_1];
        local v77 = v69[l_AdjustmentKey_1][l_LimitKey_1];
        l_AdjustmentKey_1 = l_useDesignTokens_0(function(v78) --[[ Line: 233 ]] --[[ Name: mapTokens ]]
            return {
                smallIconSize = v78.Semantic.Icon.Size.Small, 
                padding = v78.Global.Size_200
            };
        end);
        l_LimitKey_1 = v64.adjustmentSliderType == v16.Scale and 1 or 0;
        local l_Invert_0 = v24[v64.adjustmentSliderType].Invert;
        local l_useState_0 = v3.useState;
        local l_sliderValue_0 = v64.sliderValue;
        local v82;
        if v77 <= l_LimitKey_1 then
            v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
            v82 = 0.5;
        else
            local v83 = nil;
            v83 = if l_sliderValue_0 < l_LimitKey_1 then 0.5 - (l_LimitKey_1 - l_sliderValue_0) / (v77 - l_LimitKey_1) / 2 else (l_sliderValue_0 - l_LimitKey_1) / (v77 - l_LimitKey_1) / 2 + 0.5;
            v82 = if l_Invert_0 then 1 - v83 else v83;
        end;
        l_useState_0, v82 = l_useState_0(v82);
        v3.useEffect(function() --[[ Line: 246 ]]
            -- upvalues: v82 (copy), v64 (copy), v76 (copy), v77 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v5 (ref)
            local l_v82_0 = v82;
            local l_sliderValue_1 = v64.sliderValue;
            local _ = v76;
            local l_v77_0 = v77;
            local l_l_LimitKey_1_0 = l_LimitKey_1;
            local l_l_Invert_0_0 = l_Invert_0;
            local v90;
            if l_v77_0 <= l_l_LimitKey_1_0 then
                v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
                v90 = 0.5;
            else
                local v91 = nil;
                v91 = if l_sliderValue_1 < l_l_LimitKey_1_0 then 0.5 - (l_l_LimitKey_1_0 - l_sliderValue_1) / (l_v77_0 - l_l_LimitKey_1_0) / 2 else (l_sliderValue_1 - l_l_LimitKey_1_0) / (l_v77_0 - l_l_LimitKey_1_0) / 2 + 0.5;
                v90 = if l_l_Invert_0_0 then 1 - v91 else v91;
            end;
            l_v82_0(v90);
        end, {
            v64.sliderValue, 
            v76, 
            v77, 
            l_LimitKey_1, 
            l_Invert_0
        });
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v64.LayoutOrder, 
            ref = if v20 and v66 then v67 else nil
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_AdjustmentKey_1.padding), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SliderImage = v34(l_Theme_0, v64.adjustmentSliderType, l_AdjustmentKey_1.smallIconSize), 
            Slider = v3.createElement(v2.Slider, {
                ref = v64.sliderRef, 
                NextSelectionDown = v64.NextSelectionDown, 
                NextSelectionUp = v64.NextSelectionUp, 
                isDisabled = v70, 
                range = NumberRange.new(0, 1), 
                value = l_useState_0, 
                onDragStarted = function() --[[ Line: 275 ]] --[[ Name: onDragStarted ]]
                    -- upvalues: v71 (copy)
                    v71.current = true;
                end, 
                onValueChanged = function(v92) --[[ Line: 278 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v72 (ref), l_useState_0 (copy), v76 (copy), v77 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v64 (copy), v82 (copy)
                    if math.abs(0.5 - v92) < 0.025 then
                        if v72 then
                            if v92 < 0.5 and l_useState_0 < v92 or v92 > 0.5 and v92 < l_useState_0 then
                                v92 = 0.5;
                            elseif l_useState_0 == 0.5 then
                                v92 = v92 > 0.5 and 0.525 or 0.475;
                            end;
                        else
                            v92 = 0.5;
                        end;
                    end;
                    local l_v92_0 = v92;
                    local _ = v76;
                    local l_v77_1 = v77;
                    local l_l_LimitKey_1_1 = l_LimitKey_1;
                    if l_Invert_0 then
                        l_v92_0 = 1 - l_v92_0;
                    end;
                    local v97 = nil;
                    v97 = if l_v92_0 < 0.5 then l_l_LimitKey_1_1 - (0.5 - l_v92_0) / 0.5 * (l_v77_1 - l_l_LimitKey_1_1) else l_l_LimitKey_1_1 + (l_v92_0 - 0.5) / 0.5 * (l_v77_1 - l_l_LimitKey_1_1);
                    v64.updateCharacterCallback(v97, v64.adjustmentSliderType);
                    v82(v92);
                end, 
                onDragEnded = function() --[[ Line: 300 ]] --[[ Name: onDragEnded ]]
                    -- upvalues: v71 (copy), l_useState_0 (copy), v76 (copy), v77 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v64 (copy)
                    if not v71.current then
                        return;
                    else
                        local l_l_useState_0_0 = l_useState_0;
                        local _ = v76;
                        local l_v77_2 = v77;
                        local l_l_LimitKey_1_2 = l_LimitKey_1;
                        if l_Invert_0 then
                            l_l_useState_0_0 = 1 - l_l_useState_0_0;
                        end;
                        local v102 = nil;
                        v102 = if l_l_useState_0_0 < 0.5 then l_l_LimitKey_1_2 - (0.5 - l_l_useState_0_0) / 0.5 * (l_v77_2 - l_l_LimitKey_1_2) else l_l_LimitKey_1_2 + (l_l_useState_0_0 - 0.5) / 0.5 * (l_v77_2 - l_l_LimitKey_1_2);
                        v64.setSliderValuesCallback(v102, v64.adjustmentSliderType);
                        v71.current = false;
                        return;
                    end;
                end, 
                width = UDim.new(1, -l_AdjustmentKey_1.padding - l_AdjustmentKey_1.smallIconSize), 
                layoutOrder = 2, 
                step = l_FFlagAXMakeSlidersSmoothWithGamepad_0 and 0.01 or nil
            })
        });
    end;
else
    return function(v103) --[[ Line: 321 ]] --[[ Name: AdjustmentSlider ]]
        -- upvalues: l_useStyle_0 (copy), v20 (copy), l_useIsSpatial_0 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v12 (copy), v49 (copy), v15 (copy), v14 (copy), v24 (copy), l_useDesignTokens_0 (copy), v16 (copy), v34 (copy), l_SystemSlider_0 (copy), v19 (copy)
        local l_Theme_1 = l_useStyle_0().Theme;
        local v105 = if v20 then l_useIsSpatial_0() else nil;
        local v106 = if v20 and v105 then v3.createRef() else nil;
        local v107 = l_useSelector_0(v11);
        local v108 = l_useSelector_0(v12);
        local v109 = l_useSelector_0(v49) ~= v15.AdjustmentSliderTypeToAdjustmentType[v103.adjustmentSliderType];
        local v110 = v3.useRef(false);
        local v111 = v14.useLastInput() == v14.Input.Directional;
        local l_adjustmentSliderType_1 = v103.adjustmentSliderType;
        local l_AdjustmentKey_2 = v24[l_adjustmentSliderType_1].AdjustmentKey;
        local l_LimitKey_2 = v24[l_adjustmentSliderType_1].LimitKey;
        local v115 = v107[l_AdjustmentKey_2][l_LimitKey_2];
        local v116 = v108[l_AdjustmentKey_2][l_LimitKey_2];
        l_AdjustmentKey_2 = l_useDesignTokens_0(function(v117) --[[ Line: 338 ]] --[[ Name: mapTokens ]]
            return {
                smallIconSize = v117.Semantic.Icon.Size.Small, 
                padding = v117.Global.Size_200
            };
        end);
        l_LimitKey_2 = v103.adjustmentSliderType == v16.Scale and 1 or 0;
        local l_Invert_1 = v24[v103.adjustmentSliderType].Invert;
        local l_useState_1 = v3.useState;
        local l_sliderValue_2 = v103.sliderValue;
        local v121 = nil;
        v121 = if l_sliderValue_2 < l_LimitKey_2 then -math.abs((l_sliderValue_2 - l_LimitKey_2) / (v115 - l_LimitKey_2)) else math.abs((l_sliderValue_2 - l_LimitKey_2) / (v116 - l_LimitKey_2));
        if l_Invert_1 then
            v121 = -v121;
        end;
        local v122;
        l_useState_1, v122 = l_useState_1(v121 * 100);
        v3.useEffect(function() --[[ Line: 351 ]]
            -- upvalues: v122 (copy), v103 (copy), v115 (copy), v116 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy)
            local l_v122_0 = v122;
            local l_sliderValue_3 = v103.sliderValue;
            local l_v115_0 = v115;
            local l_v116_0 = v116;
            local l_l_LimitKey_2_0 = l_LimitKey_2;
            local l_l_Invert_1_0 = l_Invert_1;
            local v129 = nil;
            v129 = if l_sliderValue_3 < l_l_LimitKey_2_0 then -math.abs((l_sliderValue_3 - l_l_LimitKey_2_0) / (l_v115_0 - l_l_LimitKey_2_0)) else math.abs((l_sliderValue_3 - l_l_LimitKey_2_0) / (l_v116_0 - l_l_LimitKey_2_0));
            if l_l_Invert_1_0 then
                v129 = -v129;
            end;
            l_v122_0(v129 * 100);
        end, {
            v103.sliderValue, 
            v115, 
            v116, 
            l_LimitKey_2, 
            l_Invert_1
        });
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v103.LayoutOrder, 
            ref = if v20 and v105 then v106 else nil
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_AdjustmentKey_2.padding), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SliderImage = v34(l_Theme_1, v103.adjustmentSliderType, l_AdjustmentKey_2.smallIconSize), 
            Slider = v3.createElement(l_SystemSlider_0, {
                ref = v103.sliderRef, 
                NextSelectionDown = v103.NextSelectionDown, 
                NextSelectionUp = v103.NextSelectionUp, 
                isDisabled = v109, 
                min = -100, 
                max = 100, 
                stepInterval = 2, 
                value = l_useState_1, 
                onDragStart = function() --[[ Line: 383 ]] --[[ Name: onDragStart ]]
                    -- upvalues: v110 (copy)
                    v110.current = true;
                end, 
                onValueChanged = function(v130) --[[ Line: 386 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v19 (ref), v111 (copy), l_useState_1 (copy), v115 (copy), v116 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy), v103 (copy), v122 (copy)
                    if math.abs(v130) < v19 then
                        if v111 then
                            if v130 < 0 and l_useState_1 < v130 or v130 > 0 and v130 < l_useState_1 then
                                v130 = 0;
                            elseif l_useState_1 == 0 then
                                v130 = (v130 < 0 and -1 or 1) * v19;
                            end;
                        else
                            v130 = 0;
                        end;
                    end;
                    local l_v130_0 = v130;
                    local l_v115_1 = v115;
                    local l_v116_1 = v116;
                    local l_l_LimitKey_2_1 = l_LimitKey_2;
                    if l_Invert_1 then
                        l_v130_0 = -l_v130_0;
                    end;
                    local v135 = if l_v130_0 < 0 then l_l_LimitKey_2_1 - math.abs(l_v130_0 / 100) * math.abs(l_l_LimitKey_2_1 - l_v115_1) else l_l_LimitKey_2_1 + math.abs(l_v130_0 / 100) * math.abs(l_v116_1 - l_l_LimitKey_2_1);
                    v103.updateCharacterCallback(v135, v103.adjustmentSliderType);
                    v122(v130);
                end, 
                onDragEnd = function() --[[ Line: 406 ]] --[[ Name: onDragEnd ]]
                    -- upvalues: v110 (copy), l_useState_1 (copy), v115 (copy), v116 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy), v103 (copy)
                    if not v110.current then
                        return;
                    else
                        local l_l_useState_1_0 = l_useState_1;
                        local l_v115_2 = v115;
                        local l_v116_2 = v116;
                        local l_l_LimitKey_2_2 = l_LimitKey_2;
                        if l_Invert_1 then
                            l_l_useState_1_0 = -l_l_useState_1_0;
                        end;
                        local v140 = if l_l_useState_1_0 < 0 then l_l_LimitKey_2_2 - math.abs(l_l_useState_1_0 / 100) * math.abs(l_l_LimitKey_2_2 - l_v115_2) else l_l_LimitKey_2_2 + math.abs(l_l_useState_1_0 / 100) * math.abs(l_v116_2 - l_l_LimitKey_2_2);
                        v103.setSliderValuesCallback(v140, v103.adjustmentSliderType);
                        v110.current = false;
                        return;
                    end;
                end, 
                width = UDim.new(1, -l_AdjustmentKey_2.padding - l_AdjustmentKey_2.smallIconSize), 
                layoutOrder = 2, 
                containerRef = if v20 and v105 then v106 else nil
            })
        });
    end;
end;