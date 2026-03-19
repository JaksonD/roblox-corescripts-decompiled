local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.DividerVariant);
local v3 = require(l_script_FirstAncestor_0.Enums.Orientation);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v11(v7) --[[ Line: 26 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v8 = {
        container = {
            tag = "col"
        }, 
        stroke = {
            backgroundStyle = v7.Color.Stroke.Default
        }, 
        line = {
            tag = "size-full-200", 
            position = UDim2.fromOffset(0, v7.Size.Size_50), 
            backgroundStyle = v7.Color.Common.HeavyDivider
        }
    };
    local v9 = {
        [v3.Horizontal] = {
            container = {
                tag = "size-full-0 auto-y"
            }, 
            stroke = {
                Size = UDim2.new(1, 0, 0, v7.Stroke.Standard)
            }
        }, 
        [v3.Vertical] = {
            container = {
                tag = "size-0-full auto-x"
            }, 
            stroke = {
                Size = UDim2.new(0, v7.Stroke.Standard, 1, 0)
            }
        }
    };
    local v10 = {
        [v2.Inset] = {
            container = {
                tag = "padding-x-xlarge"
            }
        }, 
        [v2.InsetLeft] = {
            container = {
                tag = "padding-left-xlarge"
            }
        }, 
        [v2.InsetRight] = {
            container = {
                tag = "padding-right-xlarge"
            }
        }
    };
    return {
        common = v8, 
        padding = v10, 
        orientation = v9
    };
end;
return function(v12, v13, v14) --[[ Line: 81 ]]
    -- upvalues: v6 (copy), v11 (copy), v4 (copy), v3 (copy)
    local v15 = v6.useVariants("Divider", v11, v12);
    return v4(v15.common, if v14 == v3.Horizontal then v15.padding[v13] else {}, v15.orientation[v14]);
end;