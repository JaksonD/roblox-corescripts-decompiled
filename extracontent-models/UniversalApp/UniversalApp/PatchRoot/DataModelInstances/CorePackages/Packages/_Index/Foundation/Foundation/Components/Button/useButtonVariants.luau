local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v6 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local v7 = require(script.Parent.getSharedVariants);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local function v13(v9) --[[ Line: 47 ]]
    -- upvalues: v7 (copy), v1 (copy)
    local v10 = v7(v9);
    local v11 = {
        container = {
            tag = "row align-y-center align-x-center clip"
        }, 
        text = {
            tag = "size-0-full auto-x text-truncate-end shrink"
        }
    };
    local v12 = {
        [v1.XSmall] = {
            container = {
                tag = "gap-xsmall padding-small", 
                radius = v10.sizes[v1.XSmall].container.radius, 
                height = v10.sizes[v1.XSmall].container.height
            }, 
            icon = {
                size = UDim2.fromOffset(v9.Size.Size_300, v9.Size.Size_300)
            }, 
            text = {
                tag = "text-title-small"
            }
        }, 
        [v1.Small] = {
            container = {
                tag = "gap-xsmall padding-small", 
                radius = v10.sizes[v1.Small].container.radius, 
                height = v10.sizes[v1.Small].container.height
            }, 
            icon = {
                size = UDim2.fromOffset(v9.Size.Size_400, v9.Size.Size_400)
            }, 
            text = {
                tag = "text-title-small"
            }
        }, 
        [v1.Medium] = {
            container = {
                tag = "gap-small padding-medium", 
                radius = v10.sizes[v1.Medium].container.radius, 
                height = v10.sizes[v1.Medium].container.height
            }, 
            icon = {
                size = UDim2.fromOffset(v9.Size.Size_500, v9.Size.Size_500)
            }, 
            text = {
                tag = "text-title-medium"
            }
        }, 
        [v1.Large] = {
            container = {
                tag = "gap-small padding-medium", 
                radius = v10.sizes[v1.Large].container.radius, 
                height = v10.sizes[v1.Large].container.height
            }, 
            icon = {
                size = UDim2.fromOffset(v9.Size.Size_600, v9.Size.Size_600)
            }, 
            text = {
                tag = "text-title-large"
            }
        }
    };
    return {
        common = v11, 
        sizes = v12, 
        types = v10.types
    };
end;
return function(v14, v15, v16, v17) --[[ Line: 117 ]]
    -- upvalues: v5 (copy), v13 (copy), v6 (copy), v3 (copy)
    local v18 = v5.useVariants("Button", v13, v14);
    return v6(v18.common, v18.sizes[v15], v18.types[v16][v17 or v3.Color]);
end;