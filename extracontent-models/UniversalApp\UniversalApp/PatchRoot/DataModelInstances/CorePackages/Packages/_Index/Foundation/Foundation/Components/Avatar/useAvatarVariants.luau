local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v5 = require(l_script_FirstAncestor_0.Enums.UserPresence);
local v6 = require(l_script_FirstAncestor_0.Enums.IndicatorVariant);
local v7 = require(l_script_FirstAncestor_0.Enums.IndicatorShape);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local function v15(v10) --[[ Line: 45 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v6 (copy)
    local v11 = {
        container = {
            tag = "radius-circle"
        }, 
        avatar = {
            tag = "radius-circle size-full"
        }, 
        indicatorBackplate = {
            ZIndex = 2, 
            tag = "bg-surface-0 anchor-bottom-right radius-circle auto-xy position-bottom-right", 
            padding = UDim2.fromOffset(3, 3)
        }
    };
    local v12 = {
        [v4.XSmall] = {
            indicator = {
                size = v10.Size.Size_150
            }
        }, 
        [v4.Small] = {
            indicator = {
                size = v10.Size.Size_150
            }
        }, 
        [v4.Medium] = {
            indicator = {
                size = v10.Size.Size_200
            }
        }, 
        [v4.Large] = {
            indicator = {
                size = v10.Size.Size_200
            }
        }
    };
    local v13 = {
        [v5.InExperience] = {}, 
        [v5.Away] = {
            indicator = {
                shape = v7.Ring, 
                variant = v6.Neutral
            }
        }, 
        [v5.Active] = {
            indicator = {
                shape = v7.Circle, 
                variant = v6.Success
            }
        }, 
        [v5.None] = {}
    };
    local v14 = {
        [v4.XSmall] = v10.Stroke.Standard, 
        [v4.Small] = v10.Stroke.Thick, 
        [v4.Medium] = v10.Stroke.Thick, 
        [v4.Large] = v10.Stroke.Thicker
    };
    return {
        common = v11, 
        sizes = v12, 
        presence = v13, 
        iconSizeStrokes = v14
    };
end;
return function(v16, v17, v18, v19, v20) --[[ Line: 85 ]]
    -- upvalues: v3 (copy), v15 (copy), v5 (copy), v1 (copy), v9 (copy)
    local v21 = v3.useVariants("Avatar", v15, v16);
    local v22 = not v20 and (v18 == v5.Active or v18 == v5.Away);
    local v23 = if not v20 and v18 == v5.InExperience then v16.Color.System.Emphasis else v19;
    local v24 = if not v20 then v16.Stroke.Thicker else v21.iconSizeStrokes[v17];
    return v1(v21.common, v21.sizes[v17], v21.presence[v18], {
        container = {
            stroke = if v23 then {
                Color = v9(v23, "Color3"), 
                Transparency = v9(v23, "Transparency"), 
                Thickness = v24
            } else nil, 
            backgroundStyle = v19
        }, 
        indicator = {
            isVisible = v22
        }
    });
end;