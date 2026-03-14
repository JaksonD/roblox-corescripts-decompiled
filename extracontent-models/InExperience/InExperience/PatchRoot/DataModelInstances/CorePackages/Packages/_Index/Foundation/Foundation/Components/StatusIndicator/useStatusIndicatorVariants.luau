local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local v2 = require(l_script_FirstAncestor_0.Enums.StatusIndicatorVariant);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
variantsFactory = function(v7) --[[ Line: 24 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy)
    local v8 = {
        container = {
            tag = "radius-circle"
        }, 
        content = {
            tag = "auto-xy text-caption-small text-align-x-left"
        }
    };
    local v9 = {
        [v2.Alert] = {
            container = {
                tag = "bg-system-alert"
            }, 
            content = {
                style = v7.DarkMode.Content.Emphasis
            }
        }, 
        [v2.Success] = {
            container = {
                tag = "bg-system-success"
            }, 
            content = {
                style = v7.LightMode.Content.Emphasis
            }
        }, 
        [v2.Warning] = {
            container = {
                tag = "bg-system-warning"
            }, 
            content = {
                style = v7.LightMode.Content.Emphasis
            }
        }, 
        [v2.Emphasis] = {
            container = {
                tag = "bg-system-emphasis"
            }, 
            content = {
                style = v7.DarkMode.Content.Emphasis
            }
        }, 
        [v2.Neutral] = {
            container = {
                tag = "bg-system-neutral"
            }, 
            content = {
                style = v7.Inverse.Content.Emphasis
            }
        }, 
        [v2.Standard] = {
            container = {
                tag = "bg-action-standard"
            }, 
            content = {
                style = v7.Color.Content.Emphasis
            }
        }, 
        [v2.Contrast_Experiment] = {
            container = {
                tag = "bg-system-contrast"
            }, 
            content = {
                style = v7.Inverse.Content.Emphasis
            }
        }
    };
    local v10 = {
        [false] = {
            container = {
                tag = "size-200-200"
            }
        }, 
        [true] = {
            container = {
                tag = "size-400-400 auto-x row align-y-center align-x-center padding-xsmall"
            }
        }
    };
    return {
        common = v8, 
        variants = v9, 
        hasValue = v10
    };
end;
return function(v11, v12, v13) --[[ Line: 101 ]]
    -- upvalues: v1 (copy), v2 (copy), v6 (copy), v4 (copy)
    if not v1.FoundationStatusIndicatorVariantExperiment then
        if v12 == v2.Contrast_Experiment then
            error("Contrast is not a supported StatusIndicator variant.");
        end;
        if v12 == v2.Alert and v13 then
            error("Alert is not a supported numeric StatusIndicator variant.");
        end;
    end;
    local v14 = v6.useVariants("StatusIndicator", variantsFactory, v11);
    return v4(v14.common, v14.variants[v12], v14.hasValue[v13]);
end;