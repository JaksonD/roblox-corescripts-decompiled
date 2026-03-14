local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v2 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v7 = require(script.Parent.getKnobSize);
local v8 = require(l_script_FirstAncestor_0.Enums.IconSize);
local function v11(v9) --[[ Line: 39 ]] --[[ Name: computeProps ]]
    local v10 = v9.size.X.Offset + v9.shadowPadding * 2;
    return {
        knob = {
            size = v9.size, 
            iconSize = v9.iconSize
        }, 
        knobShadow = {
            size = UDim2.fromOffset(v10, v10), 
            padding = v9.shadowPadding
        }
    };
end;
local function v16(v12) --[[ Line: 58 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v5 (copy), v1 (copy), v11 (copy), v8 (copy), v7 (copy)
    local v13 = {
        knob = {
            tag = v5.FoundationToggleVisualUpdate and "auto-xy radius-circle anchor-center-center position-center-center" or "radius-circle anchor-center-center position-center-center"
        }, 
        knobShadow = {
            tag = "anchor-center-center position-center-center"
        }
    };
    local v14 = {
        [v1.XSmall] = v11({
            iconSize = v8.XSmall, 
            size = v7(v12, v1.XSmall), 
            shadowPadding = v12.Padding.XXSmall
        }), 
        [v1.Small] = v11({
            iconSize = v8.Small, 
            size = v7(v12, v1.Small), 
            shadowPadding = v12.Padding.XSmall
        }), 
        [v1.Medium] = v11({
            iconSize = v8.Medium, 
            size = v7(v12, v1.Medium), 
            shadowPadding = v12.Padding.Small
        }), 
        [v1.Large] = v11({
            iconSize = v8.Large, 
            size = v7(v12, v1.Large), 
            shadowPadding = v12.Padding.Small
        })
    };
    local v15 = if v5.FoundationToggleVisualUpdate then {
        [false] = {
            knob = {
                style = v12.Color.Content.Emphasis
            }, 
            iconContainer = {
                backgroundStyle = v12.Inverse.Content.Emphasis
            }
        }, 
        [true] = {
            knob = {
                style = v12.Inverse.Content.Emphasis
            }, 
            iconContainer = {
                backgroundStyle = v12.Color.Content.Emphasis
            }
        }
    } else {
        [false] = {
            knob = {
                style = v12.Color.Extended.White.White_100
            }, 
            iconContainer = {
                backgroundStyle = v12.Inverse.Content.Emphasis
            }
        }, 
        [true] = {
            knob = {
                style = v12.Color.Extended.White.White_100
            }, 
            iconContainer = {
                backgroundStyle = v12.Color.Content.Emphasis
            }
        }
    };
    return {
        common = v13, 
        sizes = v14, 
        isInverse = v15
    };
end;
return function(v17, v18, v19) --[[ Line: 135 ]]
    -- upvalues: v6 (copy), v16 (copy), v2 (copy)
    local v20 = v6.useVariants("Knob", v16, v17);
    return v2(v20.common, v20.sizes[v18], v20.isInverse[v19]);
end;