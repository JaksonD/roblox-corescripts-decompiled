local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v4 = require(l_script_FirstAncestor_0.Enums.Radius);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v10(v9) --[[ Line: 57 ]] --[[ Name: computeProps ]]
    return {
        canvas = {
            tag = v9.canvasTag
        }, 
        outerContainer = {
            tag = v9.outerContainerTag, 
            minHeight = v9.minContainerHeight
        }, 
        innerContainer = {
            tag = v9.innerContainerTag, 
            horizontalPadding = UDim.new(0, v9.horizontalPadding), 
            gap = v9.gap, 
            radius = v9.radius
        }, 
        outerView = {
            tag = v9.outerViewTag
        }, 
        textBox = {
            tag = v9.textBoxTag, 
            fontStyle = v9.typography
        }, 
        icon = {
            size = v9.iconSize
        }
    };
end;
local function v20(v11) --[[ Line: 97 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v5 (copy), v2 (copy), v10 (copy), v3 (copy), v4 (copy)
    local v12 = {
        outerContainer = {
            tag = "bg-shift-100"
        }, 
        innerContainer = {
            tag = "row align-y-center"
        }, 
        outerView = {
            bgStyle = v11.Color.Shift.Shift_100, 
            strokeStyle = if v5.FoundationTextInputAlignStrokeBehavior then v11.Color.Stroke.Emphasis else nil, 
            strokeThickness = if v5.FoundationTextInputAlignStrokeBehavior then v11.Stroke.Standard else nil, 
            tag = "row align-y-center"
        }, 
        textBox = {
            tag = "gui-object-defaults clip text-align-x-left text-align-y-center content-emphasis"
        }, 
        icon = {
            style = v11.Color.Content.Muted
        }
    };
    local v13 = {
        canvas = {
            tag = "size-full-0"
        }, 
        outerContainer = {
            tag = "size-full-0"
        }
    };
    local v14 = {
        [v2.XSmall] = v10({
            canvasTag = "size-full-600", 
            outerContainerTag = "radius-small", 
            radius = v11.Radius.Small, 
            innerContainerTag = "gap-small", 
            outerViewTag = {
                ["size-full-600 radius-small gap-small"] = not v5.FoundationInternalTextInputCornerRadius, 
                ["size-full-600 gap-small"] = v5.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v11.Padding.XSmall, 
            gap = v11.Gap.Small, 
            textBoxTag = "text-body-small", 
            typography = v11.Typography.BodySmall, 
            iconSize = v3.XSmall, 
            minContainerHeight = v11.Size.Size_600
        }), 
        [v2.Small] = v10({
            canvasTag = "size-full-800", 
            outerContainerTag = "radius-medium", 
            radius = v11.Radius.Medium, 
            innerContainerTag = "gap-medium", 
            outerViewTag = {
                ["size-full-800 radius-medium gap-medium"] = not v5.FoundationInternalTextInputCornerRadius, 
                ["size-full-800 gap-medium"] = v5.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v11.Padding.Small, 
            gap = v11.Gap.Medium, 
            textBoxTag = "text-body-medium", 
            typography = v11.Typography.BodyMedium, 
            iconSize = v3.XSmall, 
            minContainerHeight = v11.Size.Size_800
        }), 
        [v2.Medium] = v10({
            canvasTag = "size-full-1000", 
            outerContainerTag = "radius-medium", 
            radius = v11.Radius.Medium, 
            innerContainerTag = "gap-large", 
            outerViewTag = {
                ["size-full-1000 radius-medium gap-large"] = not v5.FoundationInternalTextInputCornerRadius, 
                ["size-full-1000 gap-large"] = v5.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v11.Padding.Small, 
            gap = v11.Gap.Large, 
            textBoxTag = "text-body-medium", 
            typography = v11.Typography.BodyMedium, 
            iconSize = v3.Small, 
            minContainerHeight = v11.Size.Size_1000
        }), 
        [v2.Large] = v10({
            canvasTag = "size-full-1200", 
            outerContainerTag = "radius-medium", 
            radius = v11.Radius.Medium, 
            innerContainerTag = "gap-large", 
            outerViewTag = {
                ["size-full-1200 radius-medium gap-large"] = not v5.FoundationInternalTextInputCornerRadius, 
                ["size-full-1200 gap-large"] = v5.FoundationInternalTextInputCornerRadius
            }, 
            horizontalPadding = v11.Padding.Medium, 
            gap = v11.Gap.Large, 
            textBoxTag = "text-body-large", 
            typography = v11.Typography.BodyLarge, 
            iconSize = v3.Small, 
            minContainerHeight = v11.Size.Size_1200
        })
    };
    local v15 = if v5.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeStyle = v11.Color.System.Alert
            }
        }, 
        [false] = {}
    } else nil;
    local v16 = if v5.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeStyle = v11.Color.System.Emphasis, 
                strokeThickness = v11.Stroke.Standard * 2
            }
        }, 
        [false] = {}
    } else nil;
    local v17 = if v5.FoundationTextInputAlignStrokeBehavior then {
        [true] = {
            outerView = {
                strokeThickness = v11.Stroke.Standard * 2
            }
        }, 
        [false] = {}
    } else nil;
    local v18 = if v5.FoundationInternalTextInputCornerRadius then {
        [v2.XSmall] = {
            outerView = {
                tag = {
                    ["radius-small"] = true
                }
            }
        }, 
        [v2.Small] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }, 
        [v2.Medium] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }, 
        [v2.Large] = {
            outerView = {
                tag = {
                    ["radius-medium"] = true
                }
            }
        }
    } else nil;
    local v19 = if v5.FoundationInternalTextInputCornerRadius then {
        [v4.None] = {
            outerView = {
                tag = {
                    ["radius-none"] = true
                }
            }
        }, 
        [v4.XSmall] = {
            outerView = {
                tag = {
                    ["radius-xsmall"] = true
                }
            }
        }, 
        [v4.Small] = {
            outerView = {
                tag = {
                    ["radius-small"] = true
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
                    ["radius-large"] = true
                }
            }
        }, 
        [v4.Circle] = {
            outerView = {
                tag = {
                    ["radius-circle"] = true
                }
            }
        }
    } else nil;
    return {
        common = v12, 
        sizes = v14, 
        multiline = v13, 
        defaultRadius = v18, 
        radius = v19, 
        errorState = v15, 
        focusedState = v16, 
        hoverState = v17
    };
end;
return function(v21, v22, v23, v24, v25, v26) --[[ Line: 247 ]]
    -- upvalues: v8 (copy), v20 (copy), v5 (copy), v6 (copy)
    local v27 = v8.useVariants("TextInput", v20, v21);
    if v5.FoundationTextInputAlignStrokeBehavior then
        return v6(v27.common, v27.sizes[v22], v27.multiline, if v5.FoundationInternalTextInputCornerRadius then if v23 then v27.radius[v23] else v27.defaultRadius[v22] else {}, if v25 ~= nil then v27.hoverState[v25] else {}, if v24 ~= nil then v27.focusedState[v24] else {}, if v26 ~= nil then v27.errorState[v26] else {});
    else
        return v6(v27.common, v27.sizes[v22], v27.multiline, if v5.FoundationInternalTextInputCornerRadius then if v23 then v27.radius[v23] else v27.defaultRadius[v22] else {});
    end;
end;