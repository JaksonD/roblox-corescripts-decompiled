local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local v2 = require(l_script_FirstAncestor_0.Enums.IconSize);
local _ = require(l_script_FirstAncestor_0.Components.InternalInput);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v6 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v13(v10) --[[ Line: 41 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v11 = {
        container = {
            tag = v1.FoundationFixOptionSelectorThickness and "col align-y-center align-x-left radius-medium gap-xsmall wrap" or "col align-y-center align-x-left radius-medium gap-xsmall wrap stroke-standard", 
            radius = v10.Radius.Medium
        }, 
        content = v10.Color.Content.Default, 
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
    local v12 = {
        [v4.XSmall] = {
            container = {
                tag = "padding-medium"
            }, 
            icon = {
                size = v2.XSmall
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
        [v4.Small] = {
            container = {
                tag = "padding-large"
            }, 
            icon = {
                size = v2.Small
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
        [v4.Medium] = {
            container = {
                tag = "padding-xlarge"
            }, 
            icon = {
                size = v2.Medium
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
        [v4.Large] = {
            container = {
                tag = "padding-xxlarge"
            }, 
            icon = {
                size = v2.Large
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
        common = v11, 
        sizes = v12
    };
end;
return function(v14, v15) --[[ Line: 92 ]]
    -- upvalues: v9 (copy), v13 (copy), v6 (copy)
    local v16 = v9.useVariants("OptionSelectorGroupItem", v13, v14);
    return v6(v16.common, v16.sizes[v15]);
end;