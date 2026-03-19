local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v4 = require(l_script_FirstAncestor_0.Enums.IndicatorShape);
local v5 = require(l_script_FirstAncestor_0.Enums.IndicatorVariant);
local _ = require(l_script_FirstAncestor_0.Components.Types);
mapToProps = function(v7, v8, v9) --[[ Line: 29 ]] --[[ Name: mapToProps ]]
    -- upvalues: v4 (copy)
    local v10 = UDim2.fromOffset(v9, v9);
    if v7 == v4.Ring then
        return {
            indicator = {
                imageStyle = v8, 
                Image = "component_assets/circle_15_stroke_3", 
                Size = UDim2.fromOffset(v9, v9)
            }
        };
    elseif v7 == v4.Circle then
        return {
            indicator = {
                imageStyle = v8, 
                Image = "component_assets/circle_16", 
                Size = v10
            }
        };
    else
        return {
            indicator = {
                imageStyle = v8, 
                Size = v10
            }
        };
    end;
end;
local function v13(v11) --[[ Line: 61 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v12 = {
        [v5.Success] = v11.Color.System.Success, 
        [v5.Neutral] = v11.Color.System.Neutral, 
        [v5.Warning] = v11.Color.System.Warning, 
        [v5.Emphasis] = v11.Color.System.Emphasis, 
        [v5.Alert] = v11.Color.System.Alert
    };
    return {
        shapes = {
            [v4.Circle] = {
                indicator = {
                    tag = "radius-circle"
                }
            }, 
            [v4.Ring] = {
                indicator = {
                    tag = "radius-circle"
                }
            }
        }, 
        variants = v12
    };
end;
return function(v14, v15, v16, v17) --[[ Line: 78 ]]
    -- upvalues: v3 (copy), v13 (copy), v1 (copy)
    local v18 = v3.useVariants("Indicator", v13, v14);
    return v1(v18.shapes[v15], mapToProps(v15, v18.variants[v16], v17));
end;