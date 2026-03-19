local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v11(v6) --[[ Line: 27 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy)
    local v7 = math.ceil(v6.Stroke.Standard);
    local v8 = {
        container = {
            tag = "row auto-xy align-x-left align-y-center", 
            padding = UDim.new(0, v7)
        }, 
        input = {
            stroke = {
                thickness = v7
            }
        }
    };
    local v9 = {
        [v2.XSmall] = {
            container = {
                tag = "gap-medium"
            }
        }, 
        [v2.Small] = {
            container = {
                tag = "gap-medium"
            }
        }, 
        [v2.Medium] = {
            container = {
                tag = "gap-medium"
            }
        }, 
        [v2.Large] = {
            container = {
                tag = "gap-medium"
            }
        }
    };
    local v10 = {
        [Enum.HorizontalAlignment.Left] = {
            container = {
                tag = "flex-x-between size-full-0"
            }
        }, 
        [Enum.HorizontalAlignment.Right] = {
            container = {
                tag = ""
            }
        }
    };
    return {
        common = v8, 
        sizes = v9, 
        labelPosition = v10
    };
end;
return function(v12, v13, v14) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), v11 (copy), v3 (copy)
    local v15 = v5.useVariants("InternalInput", v11, v12);
    return v3(v15.common, v15.sizes[v13], v15.labelPosition[v14]);
end;