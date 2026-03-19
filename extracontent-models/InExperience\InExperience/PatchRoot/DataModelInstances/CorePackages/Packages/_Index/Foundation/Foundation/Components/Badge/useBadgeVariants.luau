local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local _ = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v7 = require(l_script_FirstAncestor_0.Utility.Flags);
variantsFactory = function(v8) --[[ Line: 27 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v7 (copy), v1 (copy)
    local v9 = {
        container = {
            tag = "radius-circle row align-y-center align-x-center gap-xsmall"
        }, 
        text = {
            tag = {
                ["auto-xy text-label-small text-align-x-left text-truncate-split"] = v7.FoundationTruncateBadgeText, 
                ["auto-xy text-label-small text-align-x-left"] = not v7.FoundationTruncateBadgeText
            }
        }
    };
    local v10 = {
        [v1.Alert] = {
            container = {
                backgroundStyle = v8.Color.System.Alert
            }, 
            content = {
                style = v8.DarkMode.Content.Emphasis
            }
        }, 
        [v1.Success] = {
            container = {
                backgroundStyle = v8.Color.System.Success
            }, 
            content = {
                style = v8.LightMode.Content.Emphasis
            }
        }, 
        [v1.Warning] = {
            container = {
                backgroundStyle = v8.Color.System.Warning
            }, 
            content = {
                style = v8.LightMode.Content.Emphasis
            }
        }, 
        [v1.Contrast] = {
            container = {
                backgroundStyle = v8.Color.System.Contrast
            }, 
            content = {
                style = v8.Inverse.Content.Emphasis
            }
        }, 
        [v1.Neutral] = {
            container = {
                backgroundStyle = v8.Color.Shift.Shift_300
            }, 
            content = {
                style = v8.Color.Content.Emphasis
            }
        }, 
        [v1.OverMedia] = {
            container = {
                backgroundStyle = v8.LightMode.Surface.Surface_100, 
                stroke = {
                    Color = v8.LightMode.Stroke.Default.Color3, 
                    Transparency = v8.LightMode.Stroke.Default.Transparency
                }
            }, 
            content = {
                style = v8.LightMode.Content.Emphasis
            }
        }
    };
    local v11 = {
        [true] = {
            container = {
                tag = "size-600"
            }
        }, 
        [false] = {
            container = {
                tag = "size-0-600 auto-x padding-x-small"
            }
        }
    };
    return {
        common = v9, 
        variants = v10, 
        iconOnly = v11
    };
end;
return function(v12, v13, v14) --[[ Line: 103 ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v15 = v6.useVariants("Badge", variantsFactory, v12);
    return v4(v15.common, v15.variants[v13], v15.iconOnly[v14]);
end;