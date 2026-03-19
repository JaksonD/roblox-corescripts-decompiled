local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.Knob);
local v7 = require(l_script_FirstAncestor_0.Components.Slider);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Enums.ColorSliderType);
local v10 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v11 = require(l_script_FirstAncestor_0.Enums.SliderVariant);
local v12 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v15 = require(l_script_FirstAncestor_0.Utility.Flags);
local v16 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), 
    ColorSequenceKeypoint.new(0.16666666666666666, Color3.new(1, 1, 0)), 
    ColorSequenceKeypoint.new(0.3333333333333333, Color3.new(0, 1, 0)), 
    ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)), 
    ColorSequenceKeypoint.new(0.6666666666666666, Color3.new(0, 0, 1)), 
    ColorSequenceKeypoint.new(0.8333333333333334, Color3.new(1, 0, 1)), 
    ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
});
local function v18(v17) --[[ Line: 46 ]] --[[ Name: createAlphaGradient ]]
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0, v17), 
        ColorSequenceKeypoint.new(1, v17)
    });
end;
local v19 = {
    sliderType = v9.Hue, 
    baseColor = v2.createBinding(Color3.new(1, 1, 1))
};
return function(v20) --[[ Line: 58 ]] --[[ Name: ColorSlider ]]
    -- upvalues: v14 (copy), v19 (copy), v4 (copy), v9 (copy), v16 (copy), v18 (copy), v2 (copy), v7 (copy), v10 (copy), v11 (copy), v12 (copy), v6 (copy), v15 (copy), v8 (copy), v13 (copy), v5 (copy)
    local v21 = v14(v20, v19);
    local v22 = v4();
    local l_sliderType_0 = v21.sliderType;
    local l_value_0 = v21.value;
    local l_onValueChanged_0 = v21.onValueChanged;
    local v26 = if l_sliderType_0 == v9.Hue then v16 else v21.baseColor:map(v18);
    local v27 = nil;
    local v28 = nil;
    if l_sliderType_0 == v9.Hue then
        v27 = l_value_0:map(function(v29) --[[ Line: 73 ]]
            return {
                Color3 = Color3.fromHSV(v29, 1, 1), 
                Transparency = 0
            };
        end);
    elseif l_sliderType_0 == v9.Alpha then
        v28 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), 
            NumberSequenceKeypoint.new(1, 0)
        });
        v27 = v2.joinBindings({
            baseColor = v21.baseColor, 
            value = l_value_0
        }):map(function(v30) --[[ Line: 84 ]]
            return {
                Color3 = v30.baseColor, 
                Transparency = 1 - v30.value
            };
        end);
    end;
    local v31 = l_sliderType_0 == v9.Alpha;
    local v32 = v2.createElement(v7, {
        value = l_value_0, 
        onValueChanged = l_onValueChanged_0, 
        onDragStarted = v21.onDragStarted, 
        onDragEnded = v21.onDragEnded, 
        size = v10.Medium, 
        variant = v11.Utility, 
        isContained = true, 
        width = UDim.new(1, 0), 
        knobVisibility = v12.Always, 
        knob = v2.createElement(v6, {
            size = if v15.FoundationColorPickerDesignUpdate then v10.Small else v10.Large, 
            style = v27, 
            stroke = {
                Color = v22.Color.System.Contrast.Color3, 
                Thickness = v22.Stroke.Thicker, 
                Transparency = v22.Color.System.Contrast.Transparency
            }, 
            hasShadow = true
        })
    });
    if v15.FoundationColorPickerDesignUpdate and v31 then
        return v2.createElement(v8, v13(v21, {
            tag = "size-full-300"
        }), {
            Background = v2.createElement(v8, {
                tag = "size-full stroke-standard stroke-emphasis radius-circle", 
                ClipsDescendants = true, 
                ZIndex = 1
            }, {
                Checkerboard = v2.createElement(v5, {
                    Image = "component_assets/checkerboard_12", 
                    ScaleType = Enum.ScaleType.Tile, 
                    TileSize = UDim2.fromOffset(v22.Size.Size_300, v22.Size.Size_300), 
                    cornerRadius = UDim.new(1, 0), 
                    tag = "size-full", 
                    ZIndex = 1
                }), 
                GradientOverlay = v2.createElement(v8, {
                    tag = "size-full", 
                    backgroundStyle = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    cornerRadius = UDim.new(1, 0), 
                    ZIndex = 2
                }, {
                    Gradient = v2.createElement("UIGradient", {
                        Color = v26, 
                        Transparency = v28
                    })
                })
            }), 
            SliderContainer = v2.createElement(v8, {
                tag = "row align-y-center size-full", 
                ZIndex = 2
            }, {
                Slider = v32
            })
        });
    elseif not v15.FoundationColorPickerDesignUpdate then
        return v2.createElement(v8, v13(v21, {
            tag = "auto-y size-full-0 radius-circle stroke-standard stroke-emphasis", 
            backgroundStyle = v22.Color.Extended.White.White_100
        }), {
            Gradient = v2.createElement("UIGradient", {
                Color = v26, 
                Transparency = v28
            }), 
            Slider = v32
        });
    else
        return v2.createElement(v8, v13(v21, {
            tag = "row align-y-center size-full-300 stroke-standard stroke-emphasis radius-circle", 
            backgroundStyle = v22.Color.Extended.White.White_100
        }), {
            Gradient = v2.createElement("UIGradient", {
                Color = v26
            }), 
            Slider = v32
        });
    end;
end;