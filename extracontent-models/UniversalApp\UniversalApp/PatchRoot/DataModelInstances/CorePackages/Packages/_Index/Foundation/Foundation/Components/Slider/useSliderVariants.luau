local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v2 = require(l_script_FirstAncestor_0.Enums.SliderVariant);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v11(v7) --[[ Line: 38 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = {
        bar = {
            tag = "anchor-center-center position-center-center size-full-100 radius-small"
        }, 
        fill = {
            tag = "radius-small"
        }
    };
    local v9 = {
        [v2.Emphasis] = {
            bar = {
                tag = "bg-shift-400"
            }, 
            fill = {
                tag = "bg-emphasis"
            }, 
            knob = {
                style = v7.Color.Extended.White.White_100, 
                dragStyle = v7.Color.ActionEmphasis.Background, 
                hasShadow = true
            }
        }, 
        [v2.Standard] = {
            bar = {
                tag = "bg-shift-400"
            }, 
            fill = {
                tag = "bg-system-contrast"
            }, 
            knob = {
                style = v7.Color.System.Contrast, 
                dragStyle = v7.Color.System.Contrast, 
                hasShadow = false
            }
        }, 
        [v2.Utility] = {
            knob = {
                style = v7.Color.None, 
                dragStyle = v7.Color.None, 
                stroke = {
                    Color = v7.Color.System.Contrast.Color3, 
                    Transparency = v7.Color.System.Contrast.Transparency, 
                    Thickness = v7.Stroke.Thicker
                }, 
                hasShadow = true
            }
        }
    };
    local v10 = {
        [v1.XSmall] = {
            hitbox = {
                height = v7.Size.Size_300
            }
        }, 
        [v1.Small] = {
            hitbox = {
                height = v7.Size.Size_400
            }
        }, 
        [v1.Medium] = {
            hitbox = {
                height = v7.Size.Size_500
            }
        }, 
        [v1.Large] = {
            hitbox = {
                height = v7.Size.Size_700
            }
        }
    };
    return {
        common = v8, 
        variants = v9, 
        sizes = v10
    };
end;
return function(v12, v13, v14) --[[ Line: 91 ]]
    -- upvalues: v5 (copy), v11 (copy), v3 (copy)
    local v15 = v5.useVariants("Slider", v11, v12);
    return v3(v15.common, v15.variants[v14], v15.sizes[v13]);
end;