local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v2 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v7 = require(l_script_FirstAncestor_0.Enums.IconSize);
local function v12(v8) --[[ Line: 28 ]]
    -- upvalues: v6 (copy), v1 (copy), v7 (copy)
    local v9 = {
        container = {
            tag = "col align-x-center flex-y-between size-full-0 auto-y", 
            stateLayer = {
                affordance = v6.None
            }
        }, 
        header = {
            tag = "row align-y-center flex-x-between"
        }, 
        content = {
            tag = "size-full-0 auto-y padding-top-xsmall"
        }, 
        icon = {
            style = v8.Color.Content.Emphasis
        }, 
        text = {
            tag = "content-emphasis auto-y grow text-align-x-left text-truncate-end"
        }
    };
    local v10 = {
        [v1.XSmall] = {
            container = {
                tag = "radius-small"
            }, 
            header = {
                tag = "size-full-600 gap-small"
            }, 
            content = {
                tag = "padding-bottom-small"
            }, 
            icon = {
                size = v7.XSmall
            }, 
            text = {
                tag = "text-title-small"
            }
        }, 
        [v1.Small] = {
            container = {
                tag = "radius-medium"
            }, 
            header = {
                tag = "size-full-800 gap-small"
            }, 
            content = {
                tag = "padding-bottom-large"
            }, 
            icon = {
                size = v7.Small
            }, 
            text = {
                tag = "text-title-small"
            }
        }, 
        [v1.Medium] = {
            container = {
                tag = "radius-medium"
            }, 
            header = {
                tag = "size-full-1000 gap-small"
            }, 
            content = {
                tag = "padding-bottom-xlarge"
            }, 
            icon = {
                size = v7.Medium
            }, 
            text = {
                tag = "text-title-medium"
            }
        }, 
        [v1.Large] = {
            container = {
                tag = "radius-medium"
            }, 
            header = {
                tag = "size-full-1200 gap-small"
            }, 
            content = {
                tag = "padding-bottom-xlarge"
            }, 
            icon = {
                size = v7.Large
            }, 
            text = {
                tag = "text-title-large"
            }
        }
    };
    local v11 = {
        [false] = {
            header = {
                tag = "padding-x-xsmall"
            }
        }, 
        [true] = {
            header = {
                tag = "padding-x-medium"
            }
        }
    };
    return {
        common = v9, 
        sizes = v10, 
        isContained = v11
    };
end;
return function(v13, v14, v15) --[[ Line: 79 ]]
    -- upvalues: v2 (copy), v12 (copy), v3 (copy)
    local v16 = v2.useVariants("AccordionItem", v12, v13);
    return v3(v16.common, v16.sizes[v14], v16.isContained[v15]);
end;