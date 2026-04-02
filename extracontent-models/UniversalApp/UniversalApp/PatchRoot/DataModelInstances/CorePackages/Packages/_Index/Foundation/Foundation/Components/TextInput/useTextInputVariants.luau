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
local function _(v14) --[[ Line: 117 ]] --[[ Name: makeVariantsFactory ]]
    -- upvalues: v8 (copy), v4 (copy), v13 (copy), v6 (copy), v5 (copy), v2 (copy), v7 (copy)
    return function(v15) --[[ Line: 118 ]]
        -- upvalues: v8 (ref), v14 (copy), v4 (ref), v13 (ref), v6 (ref), v5 (ref), v2 (ref), v7 (ref)
        local v16 = {
            outerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
                tag = "bg-shift-100"
            }, 
            innerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
                tag = "row align-y-center"
            }, 
            outerView = {
                bgStyle = v15.Color.Shift.Shift_100, 
                strokeStyle = if not not v8.FoundationTextInputAlignStrokeBehavior or v14 then v15.Color.Stroke.Emphasis else nil, 
                strokeThickness = if not not v8.FoundationTextInputAlignStrokeBehavior or v14 then v15.Stroke.Standard else nil, 
                tag = "row align-y-center"
            }, 
            textBox = {
                tag = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
            }, 
            icon = {
                style = v15.Color.Content.Muted
            }
        };
        local v17 = if v8.FoundationCleanupTextInputPolyfill then nil else {
            canvas = {
                tag = "size-full-0"
            }, 
            outerContainer = {
                tag = "size-full-0"
            }
        };
        local v18 = {
            [v4.XSmall] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-600", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-small", 
                radius = v15.Radius.Small, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-small", 
                outerViewTag = {
                    ["size-full-600 radius-small gap-small"] = not (v8.FoundationInternalTextInputCornerRadius or v14), 
                    ["size-full-600 gap-small"] = v8.FoundationInternalTextInputCornerRadius or v14
                }, 
                horizontalPadding = v15.Padding.XSmall, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v15.Gap.Small, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-small", 
                typography = v15.Typography.BodySmall, 
                iconSize = v6.XSmall, 
                minContainerHeight = v15.Size.Size_600
            }), 
            [v4.Small] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-800", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v15.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-medium", 
                outerViewTag = {
                    ["size-full-800 radius-medium gap-medium"] = not (v8.FoundationInternalTextInputCornerRadius or v14), 
                    ["size-full-800 gap-medium"] = v8.FoundationInternalTextInputCornerRadius or v14
                }, 
                horizontalPadding = v15.Padding.Small, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v15.Gap.Medium, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
                typography = v15.Typography.BodyMedium, 
                iconSize = v6.XSmall, 
                minContainerHeight = v15.Size.Size_800
            }), 
            [v4.Medium] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1000", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v15.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
                outerViewTag = {
                    ["size-full-1000 radius-medium gap-large"] = not (v8.FoundationInternalTextInputCornerRadius or v14), 
                    ["size-full-1000 gap-large"] = v8.FoundationInternalTextInputCornerRadius or v14
                }, 
                horizontalPadding = v15.Padding.Small, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v15.Gap.Large, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
                typography = v15.Typography.BodyMedium, 
                iconSize = v6.Small, 
                minContainerHeight = v15.Size.Size_1000
            }), 
            [v4.Large] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1200", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v15.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
                outerViewTag = {
                    ["size-full-1200 radius-medium gap-large"] = not (v8.FoundationInternalTextInputCornerRadius or v14), 
                    ["size-full-1200 gap-large"] = v8.FoundationInternalTextInputCornerRadius or v14
                }, 
                horizontalPadding = v15.Padding.Medium, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v15.Gap.Large, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-large", 
                typography = v15.Typography.BodyLarge, 
                iconSize = v6.Small, 
                minContainerHeight = v15.Size.Size_1200
            })
        };
        local v19 = if not not v8.FoundationInternalTextInputVariants or v14 then {
            [v5.Standard] = {
                outerView = {
                    bgStyle = v15.Color.Shift.Shift_100
                }
            }, 
            [v5.Contrast] = {
                outerView = {
                    bgStyle = v15.Color.Shift.Shift_200, 
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
        local v20 = if not not v8.FoundationTextInputAlignStrokeBehavior or v14 then {
            [true] = {
                outerView = {
                    strokeStyle = v15.Color.System.Alert
                }
            }, 
            [false] = {}
        } else nil;
        local v21 = if not not v8.FoundationTextInputAlignStrokeBehavior or v14 then {
            [true] = {
                outerView = {
                    strokeStyle = v15.Color.System.Emphasis, 
                    strokeThickness = v15.Stroke.Standard * 2
                }
            }, 
            [false] = {}
        } else nil;
        local v22 = if not not v8.FoundationTextInputAlignStrokeBehavior or v14 then {
            [true] = {
                outerView = {
                    strokeThickness = v15.Stroke.Standard * 2
                }
            }, 
            [false] = {}
        } else nil;
        local v23 = if not not v8.FoundationInternalTextInputCornerRadius or v14 then {
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
        local v24 = if not not v8.FoundationInternalTextInputCornerRadius or v14 then {
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
            common = v16, 
            sizes = v18, 
            variants = v19, 
            multiline = if v8.FoundationCleanupTextInputPolyfill then nil else v17, 
            defaultRadius = v23, 
            radius = v24, 
            errorState = v20, 
            focusedState = v21, 
            hoverState = v22
        };
    end;
end;
return function(v26, v27, v28, v29, v30, v31, v32, v33) --[[ Line: 328 ]]
    -- upvalues: v11 (copy), v8 (copy), v4 (copy), v13 (copy), v6 (copy), v5 (copy), v2 (copy), v7 (copy), v9 (copy)
    local v44 = v11.useVariants("TextInput", function(v34) --[[ Line: 118 ]]
        -- upvalues: v8 (ref), v33 (copy), v4 (ref), v13 (ref), v6 (ref), v5 (ref), v2 (ref), v7 (ref)
        local v35 = {
            outerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
                tag = "bg-shift-100"
            }, 
            innerContainer = if v8.FoundationCleanupTextInputPolyfill then nil else {
                tag = "row align-y-center"
            }, 
            outerView = {
                bgStyle = v34.Color.Shift.Shift_100, 
                strokeStyle = if not not v8.FoundationTextInputAlignStrokeBehavior or v33 then v34.Color.Stroke.Emphasis else nil, 
                strokeThickness = if not not v8.FoundationTextInputAlignStrokeBehavior or v33 then v34.Stroke.Standard else nil, 
                tag = "row align-y-center"
            }, 
            textBox = {
                tag = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
            }, 
            icon = {
                style = v34.Color.Content.Muted
            }
        };
        local v36 = if v8.FoundationCleanupTextInputPolyfill then nil else {
            canvas = {
                tag = "size-full-0"
            }, 
            outerContainer = {
                tag = "size-full-0"
            }
        };
        local v37 = {
            [v4.XSmall] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-600", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-small", 
                radius = v34.Radius.Small, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-small", 
                outerViewTag = {
                    ["size-full-600 radius-small gap-small"] = not (v8.FoundationInternalTextInputCornerRadius or v33), 
                    ["size-full-600 gap-small"] = v8.FoundationInternalTextInputCornerRadius or v33
                }, 
                horizontalPadding = v34.Padding.XSmall, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v34.Gap.Small, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-small", 
                typography = v34.Typography.BodySmall, 
                iconSize = v6.XSmall, 
                minContainerHeight = v34.Size.Size_600
            }), 
            [v4.Small] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-800", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v34.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-medium", 
                outerViewTag = {
                    ["size-full-800 radius-medium gap-medium"] = not (v8.FoundationInternalTextInputCornerRadius or v33), 
                    ["size-full-800 gap-medium"] = v8.FoundationInternalTextInputCornerRadius or v33
                }, 
                horizontalPadding = v34.Padding.Small, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v34.Gap.Medium, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
                typography = v34.Typography.BodyMedium, 
                iconSize = v6.XSmall, 
                minContainerHeight = v34.Size.Size_800
            }), 
            [v4.Medium] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1000", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v34.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
                outerViewTag = {
                    ["size-full-1000 radius-medium gap-large"] = not (v8.FoundationInternalTextInputCornerRadius or v33), 
                    ["size-full-1000 gap-large"] = v8.FoundationInternalTextInputCornerRadius or v33
                }, 
                horizontalPadding = v34.Padding.Small, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v34.Gap.Large, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-medium", 
                typography = v34.Typography.BodyMedium, 
                iconSize = v6.Small, 
                minContainerHeight = v34.Size.Size_1000
            }), 
            [v4.Large] = v13({
                canvasTag = if v8.FoundationCleanupTextInputPolyfill then nil else "size-full-1200", 
                outerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "radius-medium", 
                radius = v34.Radius.Medium, 
                innerContainerTag = if v8.FoundationCleanupTextInputPolyfill then nil else "gap-large", 
                outerViewTag = {
                    ["size-full-1200 radius-medium gap-large"] = not (v8.FoundationInternalTextInputCornerRadius or v33), 
                    ["size-full-1200 gap-large"] = v8.FoundationInternalTextInputCornerRadius or v33
                }, 
                horizontalPadding = v34.Padding.Medium, 
                gap = if v8.FoundationCleanupTextInputPolyfill then nil else v34.Gap.Large, 
                textBoxTag = if v8.FoundationCleanupTextInputPolyfill then nil else "text-body-large", 
                typography = v34.Typography.BodyLarge, 
                iconSize = v6.Small, 
                minContainerHeight = v34.Size.Size_1200
            })
        };
        local v38 = if not not v8.FoundationInternalTextInputVariants or v33 then {
            [v5.Standard] = {
                outerView = {
                    bgStyle = v34.Color.Shift.Shift_100
                }
            }, 
            [v5.Contrast] = {
                outerView = {
                    bgStyle = v34.Color.Shift.Shift_200, 
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
        local v39 = if not not v8.FoundationTextInputAlignStrokeBehavior or v33 then {
            [true] = {
                outerView = {
                    strokeStyle = v34.Color.System.Alert
                }
            }, 
            [false] = {}
        } else nil;
        local v40 = if not not v8.FoundationTextInputAlignStrokeBehavior or v33 then {
            [true] = {
                outerView = {
                    strokeStyle = v34.Color.System.Emphasis, 
                    strokeThickness = v34.Stroke.Standard * 2
                }
            }, 
            [false] = {}
        } else nil;
        local v41 = if not not v8.FoundationTextInputAlignStrokeBehavior or v33 then {
            [true] = {
                outerView = {
                    strokeThickness = v34.Stroke.Standard * 2
                }
            }, 
            [false] = {}
        } else nil;
        local v42 = if not not v8.FoundationInternalTextInputCornerRadius or v33 then {
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
        local v43 = if not not v8.FoundationInternalTextInputCornerRadius or v33 then {
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
            common = v35, 
            sizes = v37, 
            variants = v38, 
            multiline = if v8.FoundationCleanupTextInputPolyfill then nil else v36, 
            defaultRadius = v42, 
            radius = v43, 
            errorState = v39, 
            focusedState = v40, 
            hoverState = v41
        };
    end, v26);
    if v8.FoundationTextInputAlignStrokeBehavior or v33 then
        local v45 = if not not v8.FoundationInternalTextInputVariants or v33 then v44.variants[v28 or v5.Standard] else nil;
        return v9(v44.common, v44.sizes[v27], if (not not v8.FoundationInternalTextInputVariants or v33) and v28 ~= v5.Utility then v45 else {}, if v8.FoundationCleanupTextInputPolyfill then nil else v44.multiline, if not not v8.FoundationInternalTextInputCornerRadius or v33 then if v29 then v44.radius[v29] else v44.defaultRadius[v27] else {}, if v31 ~= nil then v44.hoverState[v31] else {}, if v30 ~= nil then v44.focusedState[v30] else {}, if v32 ~= nil then v44.errorState[v32] else {}, if (not not v8.FoundationInternalTextInputVariants or v33) and v28 == v5.Utility then v45 else {});
    else
        return v9(v44.common, v44.sizes[v27], if v8.FoundationCleanupTextInputPolyfill then nil else v44.multiline, if not not v8.FoundationInternalTextInputCornerRadius or v33 then if v29 then v44.radius[v29] else v44.defaultRadius[v27] else {});
    end;
end;