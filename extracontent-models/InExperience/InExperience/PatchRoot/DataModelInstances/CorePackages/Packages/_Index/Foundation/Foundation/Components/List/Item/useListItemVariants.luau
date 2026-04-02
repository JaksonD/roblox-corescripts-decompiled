local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v9(_) --[[ Line: 24 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v7 = {
        title = {
            tag = "auto-xy text-wrap text-align-x-left content-emphasis"
        }, 
        metadata = {
            tag = "auto-xy text-align-x-left text-truncate-split"
        }, 
        description = {
            tag = "auto-xy text-wrap text-align-x-left"
        }
    };
    local v8 = {
        [v2.XSmall] = {
            title = {
                tag = "text-title-small"
            }, 
            metadata = {
                tag = "text-body-small"
            }, 
            description = {
                tag = "text-body-small"
            }, 
            icon = {
                size = v1.XSmall
            }
        }, 
        [v2.Small] = {
            title = {
                tag = "text-title-small"
            }, 
            metadata = {
                tag = "text-body-small"
            }, 
            description = {
                tag = "text-body-small"
            }, 
            icon = {
                size = v1.Small
            }
        }, 
        [v2.Medium] = {
            title = {
                tag = "text-title-medium"
            }, 
            metadata = {
                tag = "text-body-medium"
            }, 
            description = {
                tag = "text-body-medium"
            }, 
            icon = {
                size = v1.Medium
            }
        }, 
        [v2.Large] = {
            title = {
                tag = "text-title-large"
            }, 
            metadata = {
                tag = "text-body-medium"
            }, 
            description = {
                tag = "text-body-medium"
            }, 
            icon = {
                size = v1.Large
            }
        }
    };
    return {
        common = v7, 
        sizes = v8
    };
end;
return function(v10, v11) --[[ Line: 64 ]]
    -- upvalues: v5 (copy), v9 (copy), v3 (copy)
    local v12 = v5.useVariants("ListItem", v9, v10);
    return v3(v12.common, v12.sizes[v11]);
end;