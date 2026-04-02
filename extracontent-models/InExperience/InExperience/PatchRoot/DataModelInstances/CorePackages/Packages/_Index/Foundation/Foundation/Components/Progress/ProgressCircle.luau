local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(script.Parent.constants);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v10 = require(script.Parent.useProgressBinding);
local v11 = require(script.Parent.useProgressVariants);
local v12 = require(l_script_FirstAncestor_0.Utility.usePulseBinding);
local v13 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v15 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v16 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ProgressShape);
local v18 = {
    size = require(l_script_FirstAncestor_0.Enums.ProgressSize).Medium
};
local function _(v19, v20) --[[ Line: 42 ]] --[[ Name: getRotationFromProgress ]]
    local v21 = v20 == Enum.HorizontalAlignment.Left and 180 or 0;
    local v22 = v20 == Enum.HorizontalAlignment.Left and 360 or 180;
    if v19 == nil then
        return 0;
    else
        return (math.clamp(v19 * 360, v21, v22));
    end;
end;
local function v25(v24) --[[ Line: 48 ]] --[[ Name: getLabelFromProgress ]]
    if v24 == nil then
        return "0%";
    else
        return (("%*%%"):format((math.floor(v24 * 100))));
    end;
end;
local function v49(v26) --[[ Line: 52 ]] --[[ Name: ProgressGradient ]]
    -- upvalues: v14 (copy), v9 (copy), v2 (copy), v3 (copy)
    local l_side_0 = v26.side;
    local l_isIndeterminate_0 = v26.isIndeterminate;
    local l_progress_0 = v26.progress;
    local v30 = v14();
    local v31 = v9();
    local v34 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v30 (copy), l_isIndeterminate_0 (copy)
        local l_Transparency_0 = v30.Color.Content.Emphasis.Transparency;
        local v33 = l_isIndeterminate_0 and 1 or v30.Color.Shift.Shift_200.Transparency;
        return NumberSequence.new({
            NumberSequenceKeypoint.new(0, l_Transparency_0), 
            NumberSequenceKeypoint.new(0.4999, l_Transparency_0), 
            NumberSequenceKeypoint.new(0.5, v33), 
            NumberSequenceKeypoint.new(1, v33)
        });
    end, {
        v30, 
        l_isIndeterminate_0
    });
    local v35 = v2.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v30 (copy)
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, v30.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.4999, v30.Color.Content.Emphasis.Color3), 
            ColorSequenceKeypoint.new(0.5, v30.Color.Shift.Shift_200.Color3), 
            ColorSequenceKeypoint.new(1, v30.Color.Shift.Shift_200.Color3)
        });
    end, {
        v30
    });
    if l_isIndeterminate_0 and v31.reducedMotion then
        local v36 = nil;
        v36 = if not l_isIndeterminate_0 then v26.rotation else l_side_0 == Enum.HorizontalAlignment.Left and 0 or 180;
        return v2.createElement("UIGradient", {
            Transparency = v26.pulse:map(function(v37) --[[ Line: 96 ]]
                -- upvalues: v30 (copy)
                return NumberSequence.new((math.lerp(v30.Color.Content.Emphasis.Transparency, v30.Color.Shift.Shift_200.Transparency, v37)));
            end), 
            Color = v26.pulse:map(function(v38) --[[ Line: 105 ]]
                -- upvalues: v30 (copy)
                return ColorSequence.new(v30.Color.Content.Emphasis.Color3:Lerp(v30.Color.Shift.Shift_200.Color3, v38));
            end), 
            Rotation = v36
        });
    else
        local l_createElement_0 = v2.createElement;
        local v40 = "UIGradient";
        local v41 = {
            Transparency = v34, 
            Color = v35
        };
        local v42;
        if v3.isBinding(l_progress_0) then
            v42 = l_progress_0:map(function(v43) --[[ Line: 117 ]]
                -- upvalues: l_side_0 (copy)
                local l_l_side_0_0 = l_side_0;
                local v45 = l_l_side_0_0 == Enum.HorizontalAlignment.Left and 180 or 0;
                local v46 = l_l_side_0_0 == Enum.HorizontalAlignment.Left and 360 or 180;
                if v43 == nil then
                    return 0;
                else
                    return (math.clamp(v43 * 360, v45, v46));
                end;
            end);
        else
            local v47 = l_side_0 == Enum.HorizontalAlignment.Left and 180 or 0;
            local v48 = l_side_0 == Enum.HorizontalAlignment.Left and 360 or 180;
            v42 = l_progress_0 == nil and 0 or math.clamp(l_progress_0 * 360, v47, v48);
        end;
        v41.Rotation = v42;
        return (l_createElement_0(v40, v41));
    end;
end;
return function(v50) --[[ Line: 125 ]] --[[ Name: ProgressCircle ]]
    -- upvalues: v16 (copy), v18 (copy), v14 (copy), v9 (copy), v11 (copy), v10 (copy), v2 (copy), v13 (copy), v12 (copy), v4 (copy), v8 (copy), v15 (copy), v5 (copy), v49 (copy), v6 (copy), v3 (copy), v25 (copy)
    local v51 = v16(v50, v18);
    local v52 = v14();
    local v53 = v9();
    local v54 = v11(v52, v51.size);
    local v55, v56 = v10(v51.value);
    local v57 = v2.useBinding(0.8);
    local v58 = v13(1);
    local v59 = v12(1 / v4.INDETERMINATE_SHIMMER_SPEED);
    local v60 = UDim2.fromOffset(v54.circle.size, v54.circle.size);
    if v56 and not v53.reducedMotion then
        return v2.createElement(v8, v15(v51, {
            tag = "auto-xy", 
            ref = v51.ref
        }), {
            IndeterminateContainer = v2.createElement(v8, {
                Size = v60, 
                Rotation = v58, 
                testId = ("%*--indeterminate-container"):format(v51.testId)
            }, {
                LeftGradient = v2.createElement(v8, {
                    Size = UDim2.fromScale(0.5, 1), 
                    tag = "position-top-left clip", 
                    testId = ("%*--left-gradient"):format(v51.testId)
                }, {
                    Image = v2.createElement(v5, {
                        Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                        Size = UDim2.fromScale(2, 1), 
                        tag = "content-emphasis position-top-left"
                    }, {
                        Gradient = v2.createElement(v49, {
                            side = Enum.HorizontalAlignment.Left, 
                            isIndeterminate = v56, 
                            rotation = v58, 
                            progress = v57, 
                            pulse = v59
                        })
                    })
                }), 
                RightGradient = v2.createElement(v8, {
                    Size = UDim2.fromScale(0.5, 1), 
                    tag = "clip position-top-center", 
                    testId = ("%*--right-gradient"):format(v51.testId)
                }, {
                    Image = v2.createElement(v5, {
                        Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                        Size = UDim2.fromScale(2, 1), 
                        Position = UDim2.fromScale(-1, 0), 
                        tag = "content-emphasis"
                    }, {
                        Gradient = v2.createElement(v49, {
                            side = Enum.HorizontalAlignment.Right, 
                            isIndeterminate = v56, 
                            rotation = v58, 
                            progress = v57, 
                            pulse = v59
                        })
                    })
                })
            })
        });
    else
        return v2.createElement(v8, v15(v51, {
            Size = v60, 
            ref = v51.ref
        }), {
            LeftGradient = v2.createElement(v8, {
                Size = UDim2.fromScale(0.5, 1), 
                tag = "position-top-left clip", 
                testId = ("%*--left-gradient"):format(v51.testId)
            }, {
                Image = v2.createElement(v5, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                    Size = UDim2.fromScale(2, 1), 
                    tag = "content-emphasis position-top-left"
                }, {
                    Gradient = v2.createElement(v49, {
                        side = Enum.HorizontalAlignment.Left, 
                        isIndeterminate = v56, 
                        rotation = v58, 
                        progress = v55, 
                        pulse = v59
                    })
                })
            }), 
            RightGradient = v2.createElement(v8, {
                Size = UDim2.fromScale(0.5, 1), 
                tag = "clip position-top-center", 
                testId = ("%*--right-gradient"):format(v51.testId)
            }, {
                Image = v2.createElement(v5, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill.png", 
                    Size = UDim2.fromScale(2, 1), 
                    Position = UDim2.fromScale(-1, 0), 
                    tag = "content-emphasis"
                }, {
                    Gradient = v2.createElement(v49, {
                        side = Enum.HorizontalAlignment.Right, 
                        isIndeterminate = v56, 
                        rotation = v58, 
                        progress = v55, 
                        pulse = v59
                    })
                })
            }), 
            ProgressLabel = if not v54.circle.labelFont or v56 then nil else v2.createElement(v6, {
                Text = if v3.isBinding(v55) then v55:map(v25) else v55 == nil and "0%" or ("%*%%"):format((math.floor(v55 * 100))), 
                fontStyle = v54.circle.labelFont, 
                tag = "anchor-center-center position-center-center", 
                testId = ("%*--label"):format(v51.testId)
            })
        });
    end;
end;