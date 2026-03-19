local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.InternalInput);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v11(v8) --[[ Line: 28 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy)
    local v9 = {
        input = {
            tag = "radius-circle", 
            cursorRadius = UDim.new(0, v8.Radius.Circle)
        }, 
        checkmark = {
            tag = "position-center-center anchor-center-center radius-circle", 
            style = v8.Inverse.Content.Emphasis
        }
    };
    local v10 = {
        [v2.XSmall] = {
            input = {
                size = UDim2.fromOffset(v8.Size.Size_400, v8.Size.Size_400)
            }, 
            checkmark = {
                tag = "size-150"
            }
        }, 
        [v2.Small] = {
            input = {
                size = UDim2.fromOffset(v8.Size.Size_500, v8.Size.Size_500)
            }, 
            checkmark = {
                tag = "size-200"
            }
        }, 
        [v2.Medium] = {
            input = {
                size = UDim2.fromOffset(v8.Size.Size_600, v8.Size.Size_600)
            }, 
            checkmark = {
                tag = "size-250"
            }
        }, 
        [v2.Large] = {
            input = {
                size = UDim2.fromOffset(v8.Size.Size_700, v8.Size.Size_700)
            }, 
            checkmark = {
                tag = "size-300"
            }
        }
    };
    return {
        common = v9, 
        sizes = v10
    };
end;
return function(v12, v13) --[[ Line: 59 ]]
    -- upvalues: v7 (copy), v11 (copy), v4 (copy)
    local v14 = v7.useVariants("RadioItem", v11, v12);
    return v4(v14.common, v14.sizes[v13]);
end;