local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.IconSize);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v10(v7) --[[ Line: 27 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy)
    local v8 = {
        container = {
            tag = "auto-xy align-y-center row bg-surface-300"
        }, 
        segment = {
            tag = "auto-xy row size-0-full align-y-center"
        }, 
        text = {
            tag = "auto-x text-truncate-end content-emphasis"
        }, 
        divider = {
            tag = "row"
        }
    };
    local v9 = {
        [v2.XSmall] = {
            container = {
                tag = "size-600 padding-xsmall radius-small"
            }, 
            segment = {
                tag = "padding-small radius-small"
            }, 
            text = {
                tag = "text-caption-small"
            }, 
            divider = {
                Size = UDim2.new(0, v7.Stroke.Standard, 1, 0)
            }
        }, 
        [v2.Small] = {
            container = {
                tag = "size-800 padding-xsmall radius-medium"
            }, 
            segment = {
                tag = "padding-small radius-small"
            }, 
            text = {
                tag = "text-caption-small"
            }, 
            divider = {
                Size = UDim2.new(0, v7.Stroke.Standard, 1, 0)
            }
        }, 
        [v2.Medium] = {
            container = {
                tag = "size-1000 padding-xsmall radius-medium"
            }, 
            segment = {
                tag = "padding-small radius-small"
            }, 
            text = {
                tag = "text-caption-medium"
            }, 
            divider = {
                Size = UDim2.new(0, v7.Stroke.Standard, 1, 0)
            }
        }, 
        [v2.Large] = {
            container = {
                tag = "size-1200 padding-xsmall radius-medium"
            }, 
            segment = {
                tag = "padding-medium radius-small"
            }, 
            text = {
                tag = "text-caption-medium"
            }, 
            divider = {
                Size = UDim2.new(0, v7.Stroke.Standard, 1, 0)
            }
        }
    };
    return {
        common = v8, 
        sizes = v9
    };
end;
return function(v11, v12) --[[ Line: 65 ]]
    -- upvalues: v6 (copy), v10 (copy), v4 (copy)
    local v13 = v6.useVariants("SegmentedControl", v10, v11);
    return v4(v13.common, v13.sizes[v12]);
end;