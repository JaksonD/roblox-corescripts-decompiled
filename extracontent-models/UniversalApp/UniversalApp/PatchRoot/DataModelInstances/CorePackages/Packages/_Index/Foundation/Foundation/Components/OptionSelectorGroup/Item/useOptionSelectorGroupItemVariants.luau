local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.IconSize);
local _ = require(l_script_FirstAncestor_0.Components.InternalInput);
local v3 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v5 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v12(v9) --[[ Line: 39 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v10 = {
        container = {
            tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium", 
            radius = v9.Radius.Medium
        }, 
        content = v9.Color.Content.Default, 
        itemInner = {
            tag = "col gap-xsmall size-full-0 auto-y"
        }, 
        label = {
            tag = "auto-xy fill"
        }, 
        metadata = {
            tag = "auto-xy shrink"
        }, 
        description = {
            tag = "auto-xy grow"
        }
    };
    local v11 = {
        [v3.XSmall] = {
            container = {
                tag = "padding-medium"
            }, 
            icon = {
                size = v1.XSmall
            }, 
            label = {
                tag = "text-title-small"
            }, 
            metadata = {
                tag = "text-caption-small"
            }, 
            description = {
                tag = "text-body-small"
            }
        }, 
        [v3.Small] = {
            container = {
                tag = "padding-large"
            }, 
            icon = {
                size = v1.Small
            }, 
            label = {
                tag = "text-title-small"
            }, 
            metadata = {
                tag = "text-caption-small"
            }, 
            description = {
                tag = "text-body-small"
            }
        }, 
        [v3.Medium] = {
            container = {
                tag = "padding-xlarge"
            }, 
            icon = {
                size = v1.Medium
            }, 
            label = {
                tag = "text-title-medium"
            }, 
            metadata = {
                tag = "text-caption-medium"
            }, 
            description = {
                tag = "text-body-medium"
            }
        }, 
        [v3.Large] = {
            container = {
                tag = "padding-xxlarge"
            }, 
            icon = {
                size = v1.Large
            }, 
            label = {
                tag = "text-title-large"
            }, 
            metadata = {
                tag = "text-caption-large"
            }, 
            description = {
                tag = "text-body-large"
            }
        }
    };
    return {
        common = v10, 
        sizes = v11
    };
end;
return function(v13, v14) --[[ Line: 88 ]]
    -- upvalues: v8 (copy), v12 (copy), v5 (copy)
    local v15 = v8.useVariants("OptionSelectorGroupItem", v12, v13);
    return v5(v15.common, v15.sizes[v14]);
end;