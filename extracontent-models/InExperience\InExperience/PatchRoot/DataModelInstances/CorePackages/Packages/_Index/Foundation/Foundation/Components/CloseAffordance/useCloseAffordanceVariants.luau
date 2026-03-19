local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v9 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local v10 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v12 = require(l_script_FirstAncestor_0.Constants);
local v13 = require(l_script_FirstAncestor_0.Components.Button.getSharedVariants);
local function v21(v14) --[[ Line: 48 ]]
    -- upvalues: v13 (copy), v4 (copy), v7 (copy), v10 (copy), v2 (copy), v3 (copy), v12 (copy)
    local v15 = {
        container = {
            tag = "auto-xy row align-y-center align-x-center clip"
        }
    };
    local v16 = v13(v14);
    local v17 = {
        [v4.XSmall] = {
            container = {
                size = UDim2.fromOffset(v16.sizes[v4.XSmall].container.height, v16.sizes[v4.XSmall].container.height), 
                padding = UDim.new(0, v14.Size.Size_100)
            }, 
            content = {
                iconSize = v7.Small
            }
        }, 
        [v4.Small] = {
            container = {
                size = UDim2.fromOffset(v16.sizes[v4.Small].container.height, v16.sizes[v4.Small].container.height), 
                padding = UDim.new(0, v14.Size.Size_150)
            }, 
            content = {
                iconSize = v7.Medium
            }
        }, 
        [v4.Medium] = {
            container = {
                size = UDim2.fromOffset(v16.sizes[v4.Medium].container.height, v16.sizes[v4.Medium].container.height), 
                padding = UDim.new(0, v14.Size.Size_200)
            }, 
            content = {
                iconSize = v7.Large
            }
        }
    };
    local v20 = {
        [v10.OverMedia] = v2.map(v3, function(_) --[[ Line: 97 ]]
            -- upvalues: v14 (copy)
            return {
                container = {
                    radius = v14.Radius.Circle, 
                    tag = "bg-over-media-100"
                }, 
                content = {
                    style = v14.Color.Content.Emphasis
                }
            };
        end), 
        [v10.Utility] = v2.map(v3, function(v19) --[[ Line: 106 ]]
            -- upvalues: v14 (copy), v12 (ref)
            return {
                container = {
                    radius = v14.Radius.Medium, 
                    stateLayer = {
                        mode = v12.COLOR_MODE_TO_STATE_LAYER_MODE[false][v19]
                    }
                }, 
                content = {
                    style = v14[v19].Content.Emphasis
                }
            };
        end)
    };
    return {
        common = v15, 
        sizes = v17, 
        types = v20
    };
end;
return function(v22, v23, v24, v25) --[[ Line: 122 ]]
    -- upvalues: v8 (copy), v21 (copy), v9 (copy), v3 (copy)
    local v26 = v8.useVariants("CloseAffordance", v21, v22);
    return v9(v26.common, v26.sizes[v23], v26.types[v24][v25 or v3.Color]);
end;