local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = require(l_script_FirstAncestor_0.Components.Knob);
local v6 = require(l_script_FirstAncestor_0.Components.Slider);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Enums.ColorSliderType);
local v9 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(l_script_FirstAncestor_0.Enums.SliderVariant);
local v11 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), 
    ColorSequenceKeypoint.new(0.16666666666666666, Color3.new(1, 1, 0)), 
    ColorSequenceKeypoint.new(0.3333333333333333, Color3.new(0, 1, 0)), 
    ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)), 
    ColorSequenceKeypoint.new(0.6666666666666666, Color3.new(0, 0, 1)), 
    ColorSequenceKeypoint.new(0.8333333333333334, Color3.new(1, 0, 1)), 
    ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
});
local function v16(v15) --[[ Line: 41 ]] --[[ Name: createAlphaGradient ]]
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0, v15), 
        ColorSequenceKeypoint.new(1, v15)
    });
end;
local v17 = {
    sliderType = v8.Hue, 
    baseColor = v2.createBinding(Color3.new(1, 1, 1))
};
return function(v18) --[[ Line: 51 ]] --[[ Name: ColorSlider ]]
    -- upvalues: v13 (copy), v17 (copy), v4 (copy), v8 (copy), v14 (copy), v16 (copy), v2 (copy), v7 (copy), v12 (copy), v6 (copy), v9 (copy), v10 (copy), v11 (copy), v5 (copy)
    local v19 = v13(v18, v17);
    local v20 = v4();
    local l_sliderType_0 = v19.sliderType;
    local l_value_0 = v19.value;
    local l_onValueChanged_0 = v19.onValueChanged;
    local v24 = if l_sliderType_0 == v8.Hue then v14 else v19.baseColor:map(v16);
    local v25 = nil;
    local v26 = nil;
    if l_sliderType_0 == v8.Hue then
        v25 = l_value_0:map(function(v27) --[[ Line: 66 ]]
            return {
                Color3 = Color3.fromHSV(v27, 1, 1), 
                Transparency = 0
            };
        end);
    elseif l_sliderType_0 == v8.Alpha then
        v26 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), 
            NumberSequenceKeypoint.new(1, 0)
        });
        v25 = v2.joinBindings({
            baseColor = v19.baseColor, 
            value = l_value_0
        }):map(function(v28) --[[ Line: 77 ]]
            return {
                Color3 = v28.baseColor, 
                Transparency = 1 - v28.value
            };
        end);
    end;
    return v2.createElement(v7, v12(v19, {
        tag = "auto-y size-full-0 radius-circle stroke-standard stroke-emphasis", 
        backgroundStyle = v20.Color.Extended.White.White_100
    }), {
        Gradient = v2.createElement("UIGradient", {
            Color = v24, 
            Transparency = v26
        }), 
        Slider = v2.createElement(v6, {
            value = l_value_0, 
            onValueChanged = l_onValueChanged_0, 
            size = v9.Medium, 
            variant = v10.Utility, 
            isContained = true, 
            width = UDim.new(1, 0), 
            knobVisibility = v11.Always, 
            knob = v2.createElement(v5, {
                size = v9.Large, 
                style = v25, 
                stroke = {
                    Color = v20.Color.System.Contrast.Color3, 
                    Thickness = v20.Stroke.Thicker, 
                    Transparency = v20.Color.System.Contrast.Transparency
                }, 
                hasShadow = true
            })
        })
    });
end;