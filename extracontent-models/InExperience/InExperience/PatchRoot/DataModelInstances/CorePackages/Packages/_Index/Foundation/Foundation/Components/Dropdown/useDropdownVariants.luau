local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v8 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v11 = require(l_script_FirstAncestor_0.Utility.Flags);
local function v18(_) --[[ Line: 40 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v5 (copy), v11 (copy), v6 (copy), v4 (copy), v2 (copy)
    local v13 = {
        container = {
            tag = "row flex-x-between align-y-center stroke-standard stroke-position-inner"
        }, 
        text = {
            tag = "auto-xy text-truncate-split shrink"
        }
    };
    local v14 = {
        [v5.XSmall] = {
            container = {
                tag = "radius-small padding-small gap-xxsmall size-full-600"
            }, 
            text = {
                tag = "text-body-small"
            }, 
            arrow = {
                size = if v11.FoundationDropdownControlIconFix then v6.XSmall else v5.Small
            }
        }, 
        [v5.Small] = {
            container = {
                tag = "radius-medium padding-medium gap-xxsmall size-full-800"
            }, 
            text = {
                tag = "text-body-small"
            }, 
            arrow = {
                size = if v11.FoundationDropdownControlIconFix then v6.Small else v5.Small
            }
        }, 
        [v5.Medium] = {
            container = {
                tag = "radius-medium padding-medium size-full-1000"
            }, 
            text = {
                tag = "text-body-medium"
            }, 
            arrow = {
                size = if v11.FoundationDropdownControlIconFix then v6.Medium else v5.Medium
            }
        }, 
        [v5.Large] = {
            container = {
                tag = "radius-medium padding-medium size-full-1200"
            }, 
            text = {
                tag = "text-body-large"
            }, 
            arrow = {
                size = if v11.FoundationDropdownControlIconFix then v6.Large else v5.Large
            }
        }
    };
    local v15 = {
        [v4.Disabled] = {
            container = {
                tag = "stroke-muted"
            }, 
            text = {
                tag = "content-muted"
            }
        }, 
        [v4.Initialize] = {
            container = {
                tag = "stroke-default"
            }, 
            text = {
                tag = "content-default"
            }
        }, 
        [v4.Default] = {
            container = {
                tag = "stroke-default"
            }, 
            text = {
                tag = "content-default"
            }
        }, 
        [v4.Hover] = {
            container = {
                tag = "stroke-emphasis"
            }, 
            text = {
                tag = "content-emphasis"
            }
        }, 
        [v4.Pressed] = {
            container = {
                tag = "stroke-emphasis"
            }, 
            text = {
                tag = "content-emphasis"
            }
        }, 
        Error = {
            container = {
                tag = "stroke-alert"
            }, 
            text = {
                tag = "content-default"
            }
        }
    };
    local v17 = v2.map(v15, function(v16) --[[ Line: 101 ]]
        -- upvalues: v2 (ref)
        return v2.join(v16, {
            text = {
                tag = "content-muted"
            }
        });
    end);
    return {
        common = v13, 
        sizes = v14, 
        states = v15, 
        placeholderStates = v17
    };
end;
return function(v19, v20, v21, v22, v23) --[[ Line: 115 ]]
    -- upvalues: v10 (copy), v18 (copy), v8 (copy)
    local v24 = v10.useVariants("Dropdown", v18, v19);
    local v25 = v23 and "Error" or v21;
    return v8(v24.common, v24.sizes[v20], if v22 then v24.placeholderStates[v25] else v24.states[v25]);
end;