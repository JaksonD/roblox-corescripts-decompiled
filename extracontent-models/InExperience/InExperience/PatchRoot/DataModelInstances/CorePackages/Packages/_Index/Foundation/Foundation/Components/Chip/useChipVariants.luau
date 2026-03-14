local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local v2 = require(l_script_FirstAncestor_0.Enums.ChipSize);
local v3 = require(l_script_FirstAncestor_0.Enums.ChipVariant);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v13(v7) --[[ Line: 19 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v8 = {
        [v2.Small] = UDim.new(0, v7.Padding.Small), 
        [v2.Medium] = UDim.new(0, v7.Padding.Medium), 
        [v2.Large] = UDim.new(0, v7.Padding.Large)
    };
    local v9 = {
        chip = {
            tag = "row auto-x align-y-center align-x-center clip radius-circle"
        }, 
        text = {
            tag = "auto-x size-0-full shrink text-truncate-end"
        }
    };
    local v10 = {
        [v2.Small] = {
            chip = {
                tag = "size-0-600"
            }, 
            text = {
                tag = "text-label-small"
            }
        }, 
        [v2.Medium] = {
            chip = {
                tag = "size-0-800"
            }, 
            text = {
                tag = "text-label-medium"
            }
        }, 
        [v2.Large] = {
            chip = {
                tag = "size-0-1000"
            }, 
            text = {
                tag = "text-label-medium"
            }
        }
    };
    local v11 = if v1.FoundationAddUtilityVariantToChip then {
        [v3.Utility] = {
            [true] = {
                chip = {
                    backgroundStyle = v7.Inverse.Surface.Surface_0
                }, 
                text = {
                    contentStyle = v7.Inverse.Content.Emphasis
                }
            }, 
            [false] = {
                chip = {
                    backgroundStyle = v7.Color.ActionUtility.Background
                }, 
                text = {
                    contentStyle = v7.Color.ActionUtility.Foreground
                }
            }
        }, 
        [v3.Standard] = {
            [true] = {
                chip = {
                    backgroundStyle = v7.Inverse.Surface.Surface_0
                }, 
                text = {
                    contentStyle = v7.Inverse.Content.Emphasis
                }
            }, 
            [false] = {
                chip = {
                    backgroundStyle = v7.Color.ActionStandard.Background
                }, 
                text = {
                    contentStyle = v7.Color.ActionStandard.Foreground
                }
            }
        }
    } else nil;
    local v12 = if v1.FoundationAddUtilityVariantToChip then nil else {
        [true] = {
            chip = {
                backgroundStyle = v7.Inverse.Surface.Surface_0
            }, 
            text = {
                contentStyle = v7.Inverse.Content.Emphasis
            }
        }, 
        [false] = {
            chip = {
                backgroundStyle = v7.Color.ActionStandard.Background
            }, 
            text = {
                contentStyle = v7.Color.ActionStandard.Foreground
            }
        }
    };
    return {
        common = v9, 
        sizes = v10, 
        types = v11, 
        isChecked = v12, 
        textSpacing = v8
    };
end;
return function(v14, v15, v16, v17, v18, v19) --[[ Line: 93 ]]
    -- upvalues: v6 (copy), v13 (copy), v4 (copy), v1 (copy)
    local v20 = v6.useVariants("Chip", v13, v14);
    return v4(v20.common, v20.sizes[v15], if v1.FoundationAddUtilityVariantToChip then v20.types[v16][v17] else nil, {
        text = {
            padding = {
                left = if v18 then nil else v20.textSpacing[v15], 
                right = if v19 then nil else v20.textSpacing[v15]
            }
        }
    }, if v1.FoundationAddUtilityVariantToChip then nil else v20.isChecked[v17]);
end;