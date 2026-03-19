local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Enums.IconSize);
local function v12(v8) --[[ Line: 28 ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy)
    local v9 = {
        container = {
            tag = "row align-y-center flex-x-between auto-x"
        }, 
        icon = {
            tag = v1.FoundationBaseMenuItemImageRadius and "radius-small content-emphasis" or "content-emphasis", 
            style = v8.Color.Content.Emphasis
        }, 
        text = {
            tag = "content-emphasis auto-xy fill text-align-x-left text-truncate-split"
        }, 
        title = {
            tag = "content-default auto-xy fill text-align-x-left text-truncate-split"
        }, 
        check = {
            tag = "content-emphasis", 
            style = v8.Color.Content.Emphasis
        }
    };
    local v10 = {
        [v2.XSmall] = {
            container = {
                tag = "size-full-600 radius-small padding-x-medium gap-xsmall"
            }, 
            icon = {
                tag = "size-400", 
                size = v7.XSmall
            }, 
            text = {
                tag = "text-body-small"
            }, 
            title = {
                tag = "text-caption-small"
            }, 
            check = {
                tag = "size-300", 
                size = v8.Size.Size_600
            }, 
            chevron = {
                size = v7.Small
            }, 
            groupPadding = {
                size = v8.Padding.XSmall
            }
        }, 
        [v2.Small] = {
            container = {
                tag = "size-full-800 radius-medium padding-x-medium gap-xsmall"
            }, 
            icon = {
                tag = "size-500", 
                size = v7.Small
            }, 
            text = {
                tag = "text-body-small"
            }, 
            title = {
                tag = "text-caption-small"
            }, 
            check = {
                tag = "size-400", 
                size = v8.Size.Size_700
            }, 
            chevron = {
                size = v7.Small
            }, 
            groupPadding = {
                size = v8.Padding.Small
            }
        }, 
        [v2.Medium] = {
            container = {
                tag = "size-full-1000 radius-medium padding-x-medium gap-small"
            }, 
            icon = {
                tag = "size-600", 
                size = v7.Medium
            }, 
            text = {
                tag = "text-body-medium"
            }, 
            title = {
                tag = "text-caption-medium"
            }, 
            check = {
                tag = "size-500", 
                size = v8.Size.Size_800
            }, 
            chevron = {
                size = v7.Medium
            }, 
            groupPadding = {
                size = v8.Padding.Small
            }
        }, 
        [v2.Large] = {
            container = {
                tag = "size-full-1200 radius-medium padding-x-large gap-small"
            }, 
            icon = {
                tag = "size-700", 
                size = v7.Large
            }, 
            text = {
                tag = "text-body-large"
            }, 
            title = {
                tag = "text-caption-large"
            }, 
            check = {
                tag = "size-600", 
                size = v8.Size.Size_900
            }, 
            chevron = {
                size = v7.Large
            }, 
            groupPadding = {
                size = v8.Padding.Small
            }
        }
    };
    local v11 = {
        [false] = {
            container = {
                tag = ""
            }
        }, 
        [true] = {
            container = {
                tag = "bg-surface-200"
            }
        }
    };
    return {
        common = v9, 
        sizes = v10, 
        isChecked = v11
    };
end;
return function(v13, v14, v15) --[[ Line: 104 ]]
    -- upvalues: v3 (copy), v12 (copy), v4 (copy)
    local v16 = v3.useVariants("BaseMenuItem", v12, v13);
    return v4(v16.common, v16.sizes[v14], v16.isChecked[v15]);
end;