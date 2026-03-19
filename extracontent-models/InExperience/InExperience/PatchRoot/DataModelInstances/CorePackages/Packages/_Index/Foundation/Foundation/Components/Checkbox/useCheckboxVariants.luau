local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.Components.InternalInput);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v6 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v12(v9) --[[ Line: 30 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v10 = if v1.FoundationToggleVisualUpdate then {
        input = {
            tag = "radius-small", 
            colors = {
                checkedStyle = v9.Color.ActionSubEmphasis.Background
            }, 
            cursorRadius = UDim.new(0, v9.Radius.Small)
        }, 
        checkmark = {
            tag = "position-center-center anchor-center-center content-action-sub-emphasis"
        }
    } else {
        input = {
            tag = "radius-small", 
            checkedStyle = v9.Color.ActionSubEmphasis.Background, 
            cursorRadius = UDim.new(0, v9.Radius.Small)
        }, 
        checkmark = {
            tag = "position-center-center anchor-center-center content-action-sub-emphasis"
        }
    };
    local v11 = {
        [v4.XSmall] = {
            input = {
                size = UDim2.fromOffset(v9.Size.Size_400, v9.Size.Size_400)
            }, 
            checkmark = {
                tag = "size-400"
            }
        }, 
        [v4.Small] = {
            input = {
                size = UDim2.fromOffset(v9.Size.Size_500, v9.Size.Size_500)
            }, 
            checkmark = {
                tag = "size-500"
            }
        }, 
        [v4.Medium] = {
            input = {
                size = UDim2.fromOffset(v9.Size.Size_600, v9.Size.Size_600)
            }, 
            checkmark = {
                tag = "size-600"
            }
        }, 
        [v4.Large] = {
            input = {
                size = UDim2.fromOffset(v9.Size.Size_700, v9.Size.Size_700)
            }, 
            checkmark = {
                tag = "size-700"
            }
        }
    };
    return {
        common = v10, 
        sizes = v11
    };
end;
return function(v13, v14) --[[ Line: 73 ]]
    -- upvalues: v8 (copy), v12 (copy), v6 (copy)
    local v15 = v8.useVariants("Checkbox", v12, v13);
    return v6(v15.common, v15.sizes[v14]);
end;