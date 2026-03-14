local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(script.Parent.constants);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Components.Image);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Components.View);
local v10 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v11 = require(script.Parent.useProgressBinding);
local v12 = require(script.Parent.useProgressVariants);
local v13 = require(l_script_FirstAncestor_0.Utility.usePulseBinding);
local v14 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v16 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v17 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ProgressShape);
local v19 = {
    size = require(l_script_FirstAncestor_0.Enums.ProgressSize).Medium
};
local function _(v20, v21) --[[ Line: 43 ]] --[[ Name: getRotationFromProgress ]]
    local v22 = v21 == Enum.HorizontalAlignment.Left and 180 or 0;
    local v23 = v21 == Enum.HorizontalAlignment.Left and 360 or 180;
    if v20 == nil then
        return 0;
    else
        return (math.clamp(v20 * 360, v22, v23));
    end;
end;
local function v26(v25) --[[ Line: 49 ]] --[[ Name: getLabelFromProgress ]]
    if v25 == nil then
        return "0%";
    else
        return (("%*%%"):format((math.floor(v25 * 100))));
    end;
end;
local function v50(v27) --[[ Line: 53 ]] --[[ Name: ProgressGradient ]]
    -- upvalues: v15 (copy), v10 (copy), v2 (copy), v3 (copy), v5 (copy)
    local l_side_0 = v27.side;
    local l_isIndeterminate_0 = v27.isIndeterminate;
    local l_progress_0 = v27.progress;
    local v31 = v15();
    local v32 = v10();
    local v35 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v31 (copy), l_isIndeterminate_0 (copy)
        local l_Transparency_0 = v31.Color.Content.Emphasis.Transparency;
        local v34 = l_isIndeterminate_0 and 1 or v31.Color.Shift.Shift_200.Transparency;
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, l_Transparency_0), 
            NumberSequenceKeypoint.new(0.4999, l_Transparency_0), 
            NumberSequenceKeypoint.new(0.5, v34), 
            NumberSequenceKeypoint.new(1, v34)
        });
    end, {
        v31, 
        l_isIndeterminate_0
    });
    local v36 = v2.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: v31 (copy)
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, v31.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.4999, v31.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.5, v31.Color.Shift.Shift_200.Color3), 
            ColorSequenceKeypoint.new(1, v31.Color.Shift.Shift_200.Color3)
        });
    end, {
        v31
    });
    if l_isIndeterminate_0 and v32.reducedMotion then
        local v37 = nil;
        v37 = if not l_isIndeterminate_0 then v27.rotation else l_side_0 == Enum.HorizontalAlignment.Left and 0 or 180;
        return v2.createElement("UIGradient", {
            Transparency = v27.pulse:map(function(v38) --[[ Line: 97 ]]
                -- upvalues: v31 (copy)
                return NumberSequence.new((math.lerp(v31.Color.Content.Emphasis.Transparency, v31.Color.Shift.Shift_200.Transparency, v38)));
            end), 
            Color = v27.pulse:map(function(v39) --[[ Line: 106 ]]
                -- upvalues: v31 (copy)
                return ColorSequence.new(v31.Color.Content.Emphasis.Color3:Lerp(v31.Color.Shift.Shift_200.Color3, v39));
            end), 
            Rotation = v37
        });
    else
        local l_createElement_0 = v2.createElement;
        local v41 = "UIGradient";
        local v42 = {
            Transparency = v35, 
            Color = v36
        };
        local v43;
        if v3.isBinding(l_progress_0) or not v5.FoundationProgressBindableValue then
            v43 = l_progress_0:map(function(v44) --[[ Line: 118 ]]
                -- upvalues: l_side_0 (copy)
                local l_l_side_0_0 = l_side_0;
                local v46 = l_l_side_0_0 == Enum.HorizontalAlignment.Left and 180 or 0;
                local v47 = l_l_side_0_0 == Enum.HorizontalAlignment.Left and 360 or 180;
                if v44 == nil then
                    return 0;
                else
                    return (math.clamp(v44 * 360, v46, v47));
                end;
            end);
        else
            local v48 = l_side_0 == Enum.HorizontalAlignment.Left and 180 or 0;
            local v49 = l_side_0 == Enum.HorizontalAlignment.Left and 360 or 180;
            v43 = l_progress_0 == nil and 0 or math.clamp(l_progress_0 * 360, v48, v49);
        end;
        v42.Rotation = v43;
        return (l_createElement_0(v41, v42));
    end;
end;
return function(v51) --[[ Line: 126 ]] --[[ Name: ProgressCircle ]]
    -- upvalues: v17 (copy), v19 (copy), v15 (copy), v10 (copy), v12 (copy), v11 (copy), v2 (copy), v14 (copy), v13 (copy), v4 (copy), v9 (copy), v16 (copy), v6 (copy), v50 (copy), v7 (copy), v3 (copy), v5 (copy), v26 (copy)
    local v52 = v17(v51, v19);
    local v53 = v15();
    local v54 = v10();
    local v55 = v12(v53, v52.size);
    local v56, v57 = v11(v52.value);
    local v58 = v2.useBinding(0.8);
    local v59 = v14(1);
    local v60 = v13(1 / v4.INDETERMINATE_SHIMMER_SPEED);
    local v61 = UDim2.fromOffset(v55.circle.size, v55.circle.size);
    if v57 and not v54.reducedMotion then
        return v2.createElement(v9, v16(v52, {
            tag = "auto-xy", 
            ref = v52.ref
        }), {
            IndeterminateContainer = v2.createElement(v9, {
                Size = v61, 
                Rotation = v59, 
                testId = ("%*--indeterminate-container"):format(v52.testId)
            }, {
                LeftGradient = v2.createElement(v9, {
                    Size = UDim2.fromScale(0.5, 1), 
                    tag = "position-top-left clip", 
                    testId = ("%*--left-gradient"):format(v52.testId)
                }, {
                    Image = v2.createElement(v6, {
                        Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                        Size = UDim2.fromScale(2, 1), 
                        tag = "content-emphasis position-top-left"
                    }, {
                        Gradient = v2.createElement(v50, {
                            side = Enum.HorizontalAlignment.Left, 
                            isIndeterminate = v57, 
                            rotation = v59, 
                            progress = v58, 
                            pulse = v60
                        })
                    })
                }), 
                RightGradient = v2.createElement(v9, {
                    Size = UDim2.fromScale(0.5, 1), 
                    tag = "clip position-top-center", 
                    testId = ("%*--right-gradient"):format(v52.testId)
                }, {
                    Image = v2.createElement(v6, {
                        Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                        Size = UDim2.fromScale(2, 1), 
                        Position = UDim2.fromScale(-1, 0), 
                        tag = "content-emphasis"
                    }, {
                        Gradient = v2.createElement(v50, {
                            side = Enum.HorizontalAlignment.Right, 
                            isIndeterminate = v57, 
                            rotation = v59, 
                            progress = v58, 
                            pulse = v60
                        })
                    })
                })
            })
        });
    else
        return v2.createElement(v9, v16(v52, {
            Size = v61, 
            ref = v52.ref
        }), {
            LeftGradient = v2.createElement(v9, {
                Size = UDim2.fromScale(0.5, 1), 
                tag = "position-top-left clip", 
                testId = ("%*--left-gradient"):format(v52.testId)
            }, {
                Image = v2.createElement(v6, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                    Size = UDim2.fromScale(2, 1), 
                    tag = "content-emphasis position-top-left"
                }, {
                    Gradient = v2.createElement(v50, {
                        side = Enum.HorizontalAlignment.Left, 
                        isIndeterminate = v57, 
                        rotation = v59, 
                        progress = v56, 
                        pulse = v60
                    })
                })
            }), 
            RightGradient = v2.createElement(v9, {
                Size = UDim2.fromScale(0.5, 1), 
                tag = "clip position-top-center", 
                testId = ("%*--right-gradient"):format(v52.testId)
            }, {
                Image = v2.createElement(v6, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                    Size = UDim2.fromScale(2, 1), 
                    Position = UDim2.fromScale(-1, 0), 
                    tag = "content-emphasis"
                }, {
                    Gradient = v2.createElement(v50, {
                        side = Enum.HorizontalAlignment.Right, 
                        isIndeterminate = v57, 
                        rotation = v59, 
                        progress = v56, 
                        pulse = v60
                    })
                })
            }), 
            ProgressLabel = if not v55.circle.labelFont or v57 then nil else v2.createElement(v7, {
                Text = if not v3.isBinding(v56) and v5.FoundationProgressBindableValue then v56 == nil and "0%" or ("%*%%"):format((math.floor(v56 * 100))) else v56:map(v26), 
                fontStyle = v55.circle.labelFont, 
                tag = "anchor-center-center position-center-center", 
                testId = ("%*--label"):format(v52.testId)
            })
        });
    end;
end;