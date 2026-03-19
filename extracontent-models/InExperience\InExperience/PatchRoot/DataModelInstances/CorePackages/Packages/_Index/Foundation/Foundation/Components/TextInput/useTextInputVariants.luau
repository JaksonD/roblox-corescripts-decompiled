local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v5 = require(l_script_FirstAncestor_0.Enums.InputVariant);
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v7 = require(l_script_FirstAncestor_0.Enums.Radius);
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v13(v12) --[[ Line: 63 ]] --[[ Name: computeProps ]]
    -- upvalues: v8 (copy)
    return {
        canvas = if v8.FoundationCleanupTextInputPolyfill then nil else {
            tag = v12.canvasTag
        }, 
        outerContainer = {
            tag = if v8.FoundationCleanupTextInputPolyfill then nil else v12.outerContainerTag, 
            minHeight = v12.minContainerHeight
        }, 
        innerContainer = {
            tag = if v8.FoundationCleanupTextInputPolyfill then nil else v12.innerContainerTag, 
            horizontalPadding = UDim.new(0, v12.horizontalPadding), 
            gap = if v8.FoundationCleanupTextInputPolyfill then nil else v12.gap, 
            radius = v12.radius
        }, 
        outerView = {
            tag = v12.outerViewTag
        }, 
        textBox = {
            tag = if v8.FoundationCleanupTextInputPolyfill then nil else v12.textBoxTag, 
            fontStyle = v12.typography
        }, 
        icon = {
            size = v12.iconSize
        }
    };
end;
local function v24(v14) --[[ Line: 113 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v8 (copy), v4 (copy), v13 (copy), v6 (copy), v5 (copy), v2 (copy), v7 (copy)
    local v15 = {
        outerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
            tag = "bg-shift-100"
        }, 
        innerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
            tag = "row align-y-center"
        }, 
        outerView = {
            bgStyle = v14.Color.Shift.Shift_100, 
            strokeStyle = if v8.FoundationTextInputAlignStrokeBehavior then v14.Color.Stroke.Emphasis else nil, 
            strokeThickness = if v8.FoundationTextInputAlignStrokeBehavior then v14.Stroke.Standard else nil, 
            tag = "row align-y-center"
        }, 
        textBox = {
            tag = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
        }, 
        icon = {
            style = v14.Color.Content.Muted
        }
    };
    local v16 = if v8.FoundationCleanupTextInputPolyfill then nil else {
        canvas = {
            tag = "size-full-0"
        }, 
        outerContainer = {
            tag = "size-full-0"
        }
    };
    local v17 = {
        [v4.XSmall] = v13({
            canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-600", 
            outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-small", 
            radius = v14.Radius.Small, 
            innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-small", 
            outerViewTag = {
                ["size-full-600 radius-small gap-small"] = not v8.FoundationInternalTextInputCornerRadius, 
                ["size-full-600 gap-small"] = v8.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v14.Padding.XSmall, 
            gap = if v8.FoundationCleanupTextInputPolyfill then nil else v14.Gap.Small, 
            textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-small", 
            typography = v14.Typography.BodySmall, 
            iconSize = v6.XSmall, 
            minContainerHeight = v14.Size.Size_600
        }), 
        [v4.Small] = v13({
            canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-800", 
            outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
            radius = v14.Radius.Medium, 
            innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-medium", 
            outerViewTag = {
                ["size-full-800 radius-medium gap-medium"] = not v8.FoundationInternalTextInputCornerRadius, 
                ["size-full-800 gap-medium"] = v8.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v14.Padding.Small, 
            gap = if v8.FoundationCleanupTextInputPolyfill then nil else v14.Gap.Medium, 
            textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
            typography = v14.Typography.BodyMedium, 
            iconSize = v6.XSmall, 
            minContainerHeight = v14.Size.Size_800
        }), 
        [v4.Medium] = v13({
            canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1000", 
            outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
            radius = v14.Radius.Medium, 
            innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
            outerViewTag = {
                ["size-full-1000 radius-medium gap-large"] = not v8.FoundationInternalTextInputCornerRadius, 
                ["size-full-1000 gap-large"] = v8.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v14.Padding.Small, 
            gap = if v8.FoundationCleanupTextInputPolyfill then nil else v14.Gap.Large, 
            textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
            typography = v14.Typography.BodyMedium, 
            iconSize = v6.Small, 
            minContainerHeight = v14.Size.Size_1000
        }), 
        [v4.Large] = v13({
            canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1200", 
            outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
            radius = v14.Radius.Medium, 
            innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
            outerViewTag = {
                ["size-full-1200 radius-medium gap-large"] = not v8.FoundationInternalTextInputCornerRadius, 
                ["size-full-1200 gap-large"] = v8.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v14.Padding.Medium, 
            gap = if v8.FoundationCleanupTextInputPolyfill then nil else v14.Gap.Large, 
            textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-large", 
            typography = v14.Typography.BodyLarge, 
            iconSize = v6.Small, 
            minContainerHeight = v14.Size.Size_1200
        })
    };
    local v18 = if v8.FoundationInternalTextInputVariants then {
        [v5.Standard] = {
            outerView = {
                bgStyle = v14.Color.Shift.Shift_100
            }
        }, 
        [v5.Contrast] = {
            outerView = {
                bgStyle = v14.Color.Shift.Shift_200, 
                strokeStyle = v2.None
            }
        }, 
        [v5.Utility] = {
            outerView = {
                bgStyle = v2.None, 
                strokeStyle = v2.None
            }
        }
    } else nil;
    local v19 = if v8.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeStyle = v14.Color.System.Alert
            }
        }, 
        [false] = {}
    } else nil;
    local v20 = if v8.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeStyle = v14.Color.System.Emphasis, 
                strokeThickness = v14.Stroke.Standard * 2
            }
        }, 
        [false] = {}
    } else nil;
    local v21 = if v8.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeThickness = v14.Stroke.Standard * 2
            }
        }, 
        [false] = {}
    } else nil;
    local v22 = if v8.FoundationInternalTextInputCornerRadius then {
        [v4.XSmall] = {
            outerView = {
                tag = {
                    ["radius-small"] = true
                }
            }
        }, 
        [v4.Small] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }, 
        [v4.Medium] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }, 
        [v4.Large] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }
    } else nil;
    local v23 = if v8.FoundationInternalTextInputCornerRadius then {
        [v7.None] = {
            outerView = {
                tag = {
                    ["radius-none"] = true
                }
            }
        }, 
        [v7.XSmall] = {
            outerView = {
                tag = {
                    ["radius-xsmall"] = true
                }
            }
        }, 
        [v7.Small] = {
            outerView = {
                tag = {
                    ["radius-small"] = true
                }
            }
        }, 
        [v7.Medium] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }, 
        [v7.Large] = {
            outerView = {
                tag = {
                    ["radius-large"] = true
                }
            }
        }, 
        [v7.Circle] = if v8.FoundationTextInputSingleLineCircleRadius then nil else {
            outerView = {
                tag = {
                    ["radius-circle"] = true
                }
            }
        }
    } else nil;
    return {
        common = v15, 
        sizes = v17, 
        variants = v18, 
        multiline = if v8.FoundationCleanupTextInputPolyfill then nil else v16, 
        defaultRadius = v22, 
        radius = v23, 
        errorState = v19, 
        focusedState = v20, 
        hoverState = v21
    };
end;
return function(v25, v26, v27, v28, v29, v30, v31) --[[ Line: 295 ]]
    -- upvalues: v11 (copy), v24 (copy), v8 (copy), v5 (copy), v9 (copy)
    local v32 = v11.useVariants("TextInput", v24, v25);
    if v8.FoundationTextInputAlignStrokeBehavior then
        local v33 = if v8.FoundationInternalTextInputVariants then v32.variants[v27 or v5.Standard] else nil;
        return v9(v32.common, v32.sizes[v26], if v8.FoundationInternalTextInputVariants and v27 ~= v5.Utility then v33 else {}, if v8.FoundationCleanupTextInputPolyfill then nil else v32.multiline, if v8.FoundationInternalTextInputCornerRadius then if v28 then v32.radius[v28] else v32.defaultRadius[v26] else {}, if v30 ~= nil then v32.hoverState[v30] else {}, if v29 ~= nil then v32.focusedState[v29] else {}, if v31 ~= nil then v32.errorState[v31] else {}, if v8.FoundationInternalTextInputVariants and v27 == v5.Utility then v33 else {});
    else
        return v9(v32.common, v32.sizes[v26], if v8.FoundationCleanupTextInputPolyfill then nil else v32.multiline, if v8.FoundationInternalTextInputCornerRadius then if v28 then v32.radius[v28] else v32.defaultRadius[v26] else {});
    end;
end;