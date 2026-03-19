local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v6 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v8 = require(l_script_FirstAncestor_0.Components.Button.getSharedVariants);
local function v13(v9) --[[ Line: 41 ]]
    -- upvalues: v8 (copy), v1 (copy)
    local v10 = {};
    local v11 = v8(v9);
    local v12 = {
        [v1.XSmall] = {
            container = {
                radius = v11.sizes[v1.XSmall].container.radius, 
                size = UDim2.fromOffset(v11.sizes[v1.XSmall].container.height, v11.sizes[v1.XSmall].container.height), 
                padding = UDim.new(0, v9.Size.Size_150)
            }
        }, 
        [v1.Small] = {
            container = {
                radius = v11.sizes[v1.Small].container.radius, 
                size = UDim2.fromOffset(v11.sizes[v1.Small].container.height, v11.sizes[v1.Small].container.height), 
                padding = UDim.new(0, v9.Size.Size_200)
            }
        }, 
        [v1.Medium] = {
            container = {
                radius = v11.sizes[v1.Medium].container.radius, 
                size = UDim2.fromOffset(v11.sizes[v1.Medium].container.height, v11.sizes[v1.Medium].container.height), 
                padding = UDim.new(0, v9.Size.Size_250)
            }
        }, 
        [v1.Large] = {
            container = {
                radius = v11.sizes[v1.Large].container.radius, 
                size = UDim2.fromOffset(v11.sizes[v1.Large].container.height, v11.sizes[v1.Large].container.height), 
                padding = UDim.new(0, v9.Size.Size_300)
            }
        }
    };
    return {
        common = v10, 
        sizes = v12, 
        types = v11.types
    };
end;
return function(v14, v15, v16, v17) --[[ Line: 92 ]]
    -- upvalues: v5 (copy), v13 (copy), v6 (copy), v3 (copy)
    local v18 = v5.useVariants("IconButton", v13, v14);
    return v6(v18.common, v18.sizes[v15], v18.types[v16][v17 or v3.Color]);
end;