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
local v22 = l_Images_0["component_assets/circle_21"];
local v23 = {
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
local function _(v24, v25, v26) --[[ Line: 90 ]]
    -- upvalues: v23 (copy)
    local l_AdjustmentKey_0 = v23[v24].AdjustmentKey;
    local l_LimitKey_0 = v23[v24].LimitKey;
    return v25[l_AdjustmentKey_0][l_LimitKey_0], v26[l_AdjustmentKey_0][l_LimitKey_0];
end;
local function v33(v30, v31, v32) --[[ Line: 111 ]] --[[ Name: SliderImage ]]
    -- upvalues: v3 (copy), l_ImageSetLabel_0 (copy), v22 (copy), v23 (copy), v15 (copy)
    return v3.createElement(l_ImageSetLabel_0, {
        Size = UDim2.new(0, v32, 0, v32), 
        BackgroundTransparency = 1, 
        Image = v22, 
        ImageColor3 = v23[v31].Color, 
        ImageTransparency = v30.IconEmphasis.Transparency, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }, {
        Letter = v3.createElement("TextLabel", {
            Size = UDim2.new(1, -3, 1, -3), 
            BackgroundTransparency = 1, 
            Text = v23[v31].Text, 
            TextScaled = true, 
            FontFace = v15.FontFace, 
            TextColor3 = Color3.new(1, 1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            ZIndex = 2
        })
    });
end;
local function _(v34, v35, v36, v37, v38) --[[ Line: 136 ]] --[[ Name: valueToPercent ]]
    local v39 = nil;
    v39 = if v34 < v37 then -math.abs((v34 - v37) / (v35 - v37)) else math.abs((v34 - v37) / (v36 - v37));
    if v38 then
        v39 = -v39;
    end;
    return v39 * 100;
end;
local function _(v41, v42, v43, v44, v45) --[[ Line: 149 ]] --[[ Name: percentToValue ]]
    if v45 then
        v41 = -v41;
    end;
    if v41 < 0 then
        return v44 - math.abs(v41 / 100) * math.abs(v44 - v42);
    else
        return v44 + math.abs(v41 / 100) * math.abs(v43 - v44);
    end;
end;
local function v48(v47) --[[ Line: 159 ]]
    return v47.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
end;
if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    local _ = function(v49, _, v51, v52, v53) --[[ Line: 164 ]] --[[ Name: convertStoredValueToSliderValue ]]
        -- upvalues: v5 (copy)
        if v51 <= v52 then
            v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
            return 0.5;
        else
            local v54 = nil;
            v54 = if v49 < v52 then 0.5 - (v52 - v49) / (v51 - v52) / 2 else (v49 - v52) / (v51 - v52) / 2 + 0.5;
            if v53 then
                return 1 - v54;
            else
                return v54;
            end;
        end;
    end;
    local _ = function(v56, _, v58, v59, v60) --[[ Line: 191 ]] --[[ Name: convertSliderValueToStoredValue ]]
        if v60 then
            v56 = 1 - v56;
        end;
        local _ = nil;
        if v56 < 0.5 then
            return v59 - (0.5 - v56) / 0.5 * (v58 - v59);
        else
            return v59 + (v56 - 0.5) / 0.5 * (v58 - v59);
        end;
    end;
    return function(v63) --[[ Line: 212 ]] --[[ Name: AdjustmentSlider ]]
        -- upvalues: l_useStyle_0 (copy), v20 (copy), l_useIsSpatial_0 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v12 (copy), v48 (copy), v15 (copy), v14 (copy), v23 (copy), l_useDesignTokens_0 (copy), v16 (copy), v5 (copy), v33 (copy), v2 (copy)
        local l_Theme_0 = l_useStyle_0().Theme;
        local v65 = if v20 then l_useIsSpatial_0() else nil;
        local v66 = if v20 and v65 then v3.createRef() else nil;
        local v67 = l_useSelector_0(v11);
        local v68 = l_useSelector_0(v12);
        local v69 = l_useSelector_0(v48) ~= v15.AdjustmentSliderTypeToAdjustmentType[v63.adjustmentSliderType];
        local v70 = v3.useRef(false);
        local v71 = nil;
        v71 = v14.useLastInput() == v14.Input.Directional;
        local l_adjustmentSliderType_0 = v63.adjustmentSliderType;
        local l_AdjustmentKey_1 = v23[l_adjustmentSliderType_0].AdjustmentKey;
        local l_LimitKey_1 = v23[l_adjustmentSliderType_0].LimitKey;
        local v75 = v67[l_AdjustmentKey_1][l_LimitKey_1];
        local v76 = v68[l_AdjustmentKey_1][l_LimitKey_1];
        l_AdjustmentKey_1 = l_useDesignTokens_0(function(v77) --[[ Line: 231 ]] --[[ Name: mapTokens ]]
            return {
                smallIconSize = v77.Semantic.Icon.Size.Small, 
                padding = v77.Global.Size_200
            };
        end);
        l_LimitKey_1 = v63.adjustmentSliderType == v16.Scale and 1 or 0;
        local l_Invert_0 = v23[v63.adjustmentSliderType].Invert;
        local l_useState_0 = v3.useState;
        local l_sliderValue_0 = v63.sliderValue;
        local v81;
        if v76 <= l_LimitKey_1 then
            v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
            v81 = 0.5;
        else
            local v82 = nil;
            v82 = if l_sliderValue_0 < l_LimitKey_1 then 0.5 - (l_LimitKey_1 - l_sliderValue_0) / (v76 - l_LimitKey_1) / 2 else (l_sliderValue_0 - l_LimitKey_1) / (v76 - l_LimitKey_1) / 2 + 0.5;
            v81 = if l_Invert_0 then 1 - v82 else v82;
        end;
        l_useState_0, v81 = l_useState_0(v81);
        v3.useEffect(function() --[[ Line: 244 ]]
            -- upvalues: v81 (copy), v63 (copy), v75 (copy), v76 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v5 (ref)
            local l_v81_0 = v81;
            local l_sliderValue_1 = v63.sliderValue;
            local _ = v75;
            local l_v76_0 = v76;
            local l_l_LimitKey_1_0 = l_LimitKey_1;
            local l_l_Invert_0_0 = l_Invert_0;
            local v89;
            if l_v76_0 <= l_l_LimitKey_1_0 then
                v5("AdjustmentSlider.lua convertStoredValueToSliderValue argument error: max must be greater than defaultValue.");
                v89 = 0.5;
            else
                local v90 = nil;
                v90 = if l_sliderValue_1 < l_l_LimitKey_1_0 then 0.5 - (l_l_LimitKey_1_0 - l_sliderValue_1) / (l_v76_0 - l_l_LimitKey_1_0) / 2 else (l_sliderValue_1 - l_l_LimitKey_1_0) / (l_v76_0 - l_l_LimitKey_1_0) / 2 + 0.5;
                v89 = if l_l_Invert_0_0 then 1 - v90 else v90;
            end;
            l_v81_0(v89);
        end, {
            v63.sliderValue, 
            v75, 
            v76, 
            l_LimitKey_1, 
            l_Invert_0
        });
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v63.LayoutOrder, 
            ref = if v20 and v65 then v66 else nil
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_AdjustmentKey_1.padding), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SliderImage = v33(l_Theme_0, v63.adjustmentSliderType, l_AdjustmentKey_1.smallIconSize), 
            Slider = v3.createElement(v2.Slider, {
                ref = v63.sliderRef, 
                NextSelectionDown = v63.NextSelectionDown, 
                NextSelectionUp = v63.NextSelectionUp, 
                isDisabled = v69, 
                range = NumberRange.new(0, 1), 
                value = l_useState_0, 
                onDragStarted = function() --[[ Line: 273 ]] --[[ Name: onDragStarted ]]
                    -- upvalues: v70 (copy)
                    v70.current = true;
                end, 
                onValueChanged = function(v91) --[[ Line: 276 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v71 (ref), l_useState_0 (copy), v75 (copy), v76 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v63 (copy), v81 (copy)
                    if math.abs(0.5 - v91) < 0.025 then
                        if v71 then
                            if v91 < 0.5 and l_useState_0 < v91 or v91 > 0.5 and v91 < l_useState_0 then
                                v91 = 0.5;
                            elseif l_useState_0 == 0.5 then
                                v91 = v91 > 0.5 and 0.525 or 0.475;
                            end;
                        else
                            v91 = 0.5;
                        end;
                    end;
                    local l_v91_0 = v91;
                    local _ = v75;
                    local l_v76_1 = v76;
                    local l_l_LimitKey_1_1 = l_LimitKey_1;
                    if l_Invert_0 then
                        l_v91_0 = 1 - l_v91_0;
                    end;
                    local v96 = nil;
                    v96 = if l_v91_0 < 0.5 then l_l_LimitKey_1_1 - (0.5 - l_v91_0) / 0.5 * (l_v76_1 - l_l_LimitKey_1_1) else l_l_LimitKey_1_1 + (l_v91_0 - 0.5) / 0.5 * (l_v76_1 - l_l_LimitKey_1_1);
                    v63.updateCharacterCallback(v96, v63.adjustmentSliderType);
                    v81(v91);
                end, 
                onDragEnded = function() --[[ Line: 298 ]] --[[ Name: onDragEnded ]]
                    -- upvalues: v70 (copy), l_useState_0 (copy), v75 (copy), v76 (copy), l_LimitKey_1 (copy), l_Invert_0 (copy), v63 (copy)
                    if not v70.current then
                        return;
                    else
                        local l_l_useState_0_0 = l_useState_0;
                        local _ = v75;
                        local l_v76_2 = v76;
                        local l_l_LimitKey_1_2 = l_LimitKey_1;
                        if l_Invert_0 then
                            l_l_useState_0_0 = 1 - l_l_useState_0_0;
                        end;
                        local v101 = nil;
                        v101 = if l_l_useState_0_0 < 0.5 then l_l_LimitKey_1_2 - (0.5 - l_l_useState_0_0) / 0.5 * (l_v76_2 - l_l_LimitKey_1_2) else l_l_LimitKey_1_2 + (l_l_useState_0_0 - 0.5) / 0.5 * (l_v76_2 - l_l_LimitKey_1_2);
                        v63.setSliderValuesCallback(v101, v63.adjustmentSliderType);
                        v70.current = false;
                        return;
                    end;
                end, 
                width = UDim.new(1, -l_AdjustmentKey_1.padding - l_AdjustmentKey_1.smallIconSize), 
                layoutOrder = 2
            })
        });
    end;
else
    return function(v102) --[[ Line: 318 ]] --[[ Name: AdjustmentSlider ]]
        -- upvalues: l_useStyle_0 (copy), v20 (copy), l_useIsSpatial_0 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v12 (copy), v48 (copy), v15 (copy), v14 (copy), v23 (copy), l_useDesignTokens_0 (copy), v16 (copy), v33 (copy), l_SystemSlider_0 (copy), v19 (copy)
        local l_Theme_1 = l_useStyle_0().Theme;
        local v104 = if v20 then l_useIsSpatial_0() else nil;
        local v105 = if v20 and v104 then v3.createRef() else nil;
        local v106 = l_useSelector_0(v11);
        local v107 = l_useSelector_0(v12);
        local v108 = l_useSelector_0(v48) ~= v15.AdjustmentSliderTypeToAdjustmentType[v102.adjustmentSliderType];
        local v109 = v3.useRef(false);
        local v110 = v14.useLastInput() == v14.Input.Directional;
        local l_adjustmentSliderType_1 = v102.adjustmentSliderType;
        local l_AdjustmentKey_2 = v23[l_adjustmentSliderType_1].AdjustmentKey;
        local l_LimitKey_2 = v23[l_adjustmentSliderType_1].LimitKey;
        local v114 = v106[l_AdjustmentKey_2][l_LimitKey_2];
        local v115 = v107[l_AdjustmentKey_2][l_LimitKey_2];
        l_AdjustmentKey_2 = l_useDesignTokens_0(function(v116) --[[ Line: 335 ]] --[[ Name: mapTokens ]]
            return {
                smallIconSize = v116.Semantic.Icon.Size.Small, 
                padding = v116.Global.Size_200
            };
        end);
        l_LimitKey_2 = v102.adjustmentSliderType == v16.Scale and 1 or 0;
        local l_Invert_1 = v23[v102.adjustmentSliderType].Invert;
        local l_useState_1 = v3.useState;
        local l_sliderValue_2 = v102.sliderValue;
        local v120 = nil;
        v120 = if l_sliderValue_2 < l_LimitKey_2 then -math.abs((l_sliderValue_2 - l_LimitKey_2) / (v114 - l_LimitKey_2)) else math.abs((l_sliderValue_2 - l_LimitKey_2) / (v115 - l_LimitKey_2));
        if l_Invert_1 then
            v120 = -v120;
        end;
        local v121;
        l_useState_1, v121 = l_useState_1(v120 * 100);
        v3.useEffect(function() --[[ Line: 348 ]]
            -- upvalues: v121 (copy), v102 (copy), v114 (copy), v115 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy)
            local l_v121_0 = v121;
            local l_sliderValue_3 = v102.sliderValue;
            local l_v114_0 = v114;
            local l_v115_0 = v115;
            local l_l_LimitKey_2_0 = l_LimitKey_2;
            local l_l_Invert_1_0 = l_Invert_1;
            local v128 = nil;
            v128 = if l_sliderValue_3 < l_l_LimitKey_2_0 then -math.abs((l_sliderValue_3 - l_l_LimitKey_2_0) / (l_v114_0 - l_l_LimitKey_2_0)) else math.abs((l_sliderValue_3 - l_l_LimitKey_2_0) / (l_v115_0 - l_l_LimitKey_2_0));
            if l_l_Invert_1_0 then
                v128 = -v128;
            end;
            l_v121_0(v128 * 100);
        end, {
            v102.sliderValue, 
            v114, 
            v115, 
            l_LimitKey_2, 
            l_Invert_1
        });
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = v102.LayoutOrder, 
            ref = if v20 and v104 then v105 else nil
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_AdjustmentKey_2.padding), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SliderImage = v33(l_Theme_1, v102.adjustmentSliderType, l_AdjustmentKey_2.smallIconSize), 
            Slider = v3.createElement(l_SystemSlider_0, {
                ref = v102.sliderRef, 
                NextSelectionDown = v102.NextSelectionDown, 
                NextSelectionUp = v102.NextSelectionUp, 
                isDisabled = v108, 
                min = -100, 
                max = 100, 
                stepInterval = 2, 
                value = l_useState_1, 
                onDragStart = function() --[[ Line: 380 ]] --[[ Name: onDragStart ]]
                    -- upvalues: v109 (copy)
                    v109.current = true;
                end, 
                onValueChanged = function(v129) --[[ Line: 383 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v19 (ref), v110 (copy), l_useState_1 (copy), v114 (copy), v115 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy), v102 (copy), v121 (copy)
                    if math.abs(v129) < v19 then
                        if v110 then
                            if v129 < 0 and l_useState_1 < v129 or v129 > 0 and v129 < l_useState_1 then
                                v129 = 0;
                            elseif l_useState_1 == 0 then
                                v129 = (v129 < 0 and -1 or 1) * v19;
                            end;
                        else
                            v129 = 0;
                        end;
                    end;
                    local l_v129_0 = v129;
                    local l_v114_1 = v114;
                    local l_v115_1 = v115;
                    local l_l_LimitKey_2_1 = l_LimitKey_2;
                    if l_Invert_1 then
                        l_v129_0 = -l_v129_0;
                    end;
                    local v134 = if l_v129_0 < 0 then l_l_LimitKey_2_1 - math.abs(l_v129_0 / 100) * math.abs(l_l_LimitKey_2_1 - l_v114_1) else l_l_LimitKey_2_1 + math.abs(l_v129_0 / 100) * math.abs(l_v115_1 - l_l_LimitKey_2_1);
                    v102.updateCharacterCallback(v134, v102.adjustmentSliderType);
                    v121(v129);
                end, 
                onDragEnd = function() --[[ Line: 403 ]] --[[ Name: onDragEnd ]]
                    -- upvalues: v109 (copy), l_useState_1 (copy), v114 (copy), v115 (copy), l_LimitKey_2 (copy), l_Invert_1 (copy), v102 (copy)
                    if not v109.current then
                        return;
                    else
                        local l_l_useState_1_0 = l_useState_1;
                        local l_v114_2 = v114;
                        local l_v115_2 = v115;
                        local l_l_LimitKey_2_2 = l_LimitKey_2;
                        if l_Invert_1 then
                            l_l_useState_1_0 = -l_l_useState_1_0;
                        end;
                        local v139 = if l_l_useState_1_0 < 0 then l_l_LimitKey_2_2 - math.abs(l_l_useState_1_0 / 100) * math.abs(l_l_LimitKey_2_2 - l_v114_2) else l_l_LimitKey_2_2 + math.abs(l_l_useState_1_0 / 100) * math.abs(l_v115_2 - l_l_LimitKey_2_2);
                        v102.setSliderValuesCallback(v139, v102.adjustmentSliderType);
                        v109.current = false;
                        return;
                    end;
                end, 
                width = UDim.new(1, -l_AdjustmentKey_2.padding - l_AdjustmentKey_2.smallIconSize), 
                layoutOrder = 2, 
                containerRef = if v20 and v104 then v105 else nil
            })
        });
    end;
end;