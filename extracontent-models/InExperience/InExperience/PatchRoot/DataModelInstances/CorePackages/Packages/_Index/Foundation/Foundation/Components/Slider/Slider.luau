local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Utility.Input.InputMode);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Utility.useBindable);
local v8 = require(l_script_FirstAncestor_0.Utility.Input.useLastInputMode);
local v9 = require(l_script_FirstAncestor_0.Utility.usePointerPosition);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(script.Parent.calculateNextStepValue);
local v13 = require(script.Parent.calculatePixelsPerStep);
local v14 = require(script.Parent.calculateSliderPositionDelta);
local v15 = require(script.Parent.calculateSliderStepValue);
local v16 = require(script.Parent.calculateSliderValueFromPosition);
local v17 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v18 = require(l_script_FirstAncestor_0.Enums.Visibility);
local v19 = require(l_script_FirstAncestor_0.Enums.SliderVariant);
local v20 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v21 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v22 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v23 = require(l_script_FirstAncestor_0.Utility.Flags);
local v24 = require(l_script_FirstAncestor_0.Components.Knob);
local v25 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v26 = require(l_script_FirstAncestor_0.Components.Slider.useSliderMotionStates);
local v27 = require(l_script_FirstAncestor_0.Components.Slider.useSliderVariants);
local v28 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v29 = {
    range = NumberRange.new(0, 1), 
    size = v17.Medium, 
    width = UDim.new(1, 0), 
    variant = v19.Standard, 
    isDisabled = false, 
    isContained = false, 
    knobVisibility = v18.Auto, 
    testId = "--foundation-slider"
};
local v30 = {
    colorMode = v20.Inverse
};
return v2.forwardRef(function(v31, v32) --[[ Line: 86 ]] --[[ Name: Slider ]]
    -- upvalues: v11 (copy), v29 (copy), v28 (copy), v2 (copy), v21 (copy), v7 (copy), v8 (copy), v9 (copy), v27 (copy), v26 (copy), v18 (copy), v16 (copy), v15 (copy), v4 (copy), v13 (copy), v12 (copy), v14 (copy), v6 (copy), v10 (copy), v3 (copy), v22 (copy), v23 (copy), v25 (copy), v30 (copy), v24 (copy)
    local v33 = v11(v31, v29);
    local v34 = v28();
    local v35, v36 = v2.useState(v21.Initialize);
    local v37, v38 = v2.useState(false);
    local v39, v40 = v2.useState(false);
    local v42 = v7(v33.value):map(function(v41) --[[ Line: 92 ]]
        -- upvalues: v33 (copy)
        return (math.clamp(v41, v33.range.Min, v33.range.Max));
    end);
    local v43 = v2.useRef(nil);
    local v44 = v8();
    local v45 = v2.useRef(nil);
    v2.useImperativeHandle(v32, function() --[[ Line: 99 ]]
        -- upvalues: v45 (copy)
        return v45.current;
    end, {});
    local v46 = v9(v45.current);
    local v47 = v27(v34, v33.size, v33.variant);
    local v48 = v26(v47.knob.style, v47.knob.dragStyle);
    local v49 = v2.useMemo(function() --[[ Line: 109 ]]
        -- upvalues: v39 (copy), v48 (copy), v37 (copy)
        if not v39 then
            return v48.Hidden;
        elseif v37 then
            return v48.Dragging;
        else
            return v48.Idle;
        end;
    end, {
        v34, 
        v39, 
        v37, 
        v48
    });
    v2.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: v33 (copy), v18 (ref), v40 (copy), v37 (copy), v35 (copy), v21 (ref)
        if v33.knobVisibility == v18.None then
            v40(false);
            return;
        elseif v33.knobVisibility == v18.Always then
            v40(true);
            return;
        else
            v40(v37 or v35 == v21.Hover or v35 == v21.Selected or v35 == v21.Pressed);
            return;
        end;
    end, {
        v33.knobVisibility, 
        v35, 
        v37
    });
    local v52 = v2.useCallback(function(v50) --[[ Line: 131 ]]
        -- upvalues: v45 (copy), v16 (ref), v33 (copy), v15 (ref)
        if v45.current then
            local v51 = v16(v50, v45.current, v33.range);
            if v33.step then
                return v15(v51, v33.step, v33.range);
            else
                return v51;
            end;
        else
            return 0;
        end;
    end, {
        v45, 
        v33.range, 
        v33.step
    });
    local v54 = v2.useCallback(function(v53) --[[ Line: 144 ]]
        -- upvalues: v42 (copy), v33 (copy)
        if v53 ~= v42:getValue() and v33.onValueChanged then
            v33.onValueChanged(v53);
        end;
    end, {
        v42, 
        v33.onValueChanged
    });
    local v56 = v2.useCallback(function() --[[ Line: 152 ]]
        -- upvalues: v52 (copy), v46 (copy), v54 (copy)
        local v55 = v52(v46:getValue());
        v54(v55);
    end, {
        v52, 
        v46, 
        v54
    });
    local v59 = v2.useCallback(function(_, v58) --[[ Line: 157 ]]
        -- upvalues: v43 (copy), v38 (copy), v33 (copy)
        v43.current = v58;
        v38(true);
        if v33.onDragStarted then
            v33.onDragStarted();
        end;
    end, {
        v33.onDragStarted
    });
    local v71 = v2.useCallback(function(_, v61) --[[ Line: 166 ]]
        -- upvalues: v45 (copy), v43 (copy), v33 (copy), v44 (copy), v4 (ref), v13 (ref), v42 (copy), v12 (ref), v54 (copy), v52 (copy), v14 (ref)
        if v45.current and v43.current then
            if v33.step and v33.step > 0 then
                if v44 == v4.Directional then
                    local v62 = v61 - v43.current;
                    local v63 = math.abs(v62.X);
                    local v64 = v13(v45.current.AbsoluteSize.X, v33.step, v33.range);
                    if v64 * 2 < v63 then
                        v43.current = v61;
                        return;
                    elseif v63 < v64 / 2 then
                        return;
                    else
                        local v65 = v42:getValue();
                        local v66 = v12(v62.X, v65, v33.step, v33.range);
                        if v66 ~= v65 then
                            v54(v66);
                            v43.current = v61;
                            return;
                        end;
                    end;
                else
                    local v67 = v52(v61);
                    v54(v67);
                    v43.current = v61;
                    return;
                end;
            else
                local l_Magnitude_0 = v45.current.AbsoluteSize.Magnitude;
                local v69 = v14(v61, v43.current, l_Magnitude_0);
                v43.current = v61;
                if v44 == v4.Directional and math.abs(v69) > 0.01 then
                    return;
                else
                    local v70 = v52(v61);
                    v54(v70);
                end;
            end;
        end;
    end, {
        v33.step, 
        v33.range, 
        v44, 
        v42, 
        v54, 
        v52
    });
    local v72 = v2.useCallback(function() --[[ Line: 231 ]]
        -- upvalues: v38 (copy), v43 (copy), v33 (copy)
        v38(false);
        v43.current = nil;
        if v33.onDragEnded then
            v33.onDragEnded();
        end;
    end, {
        v33.onDragEnded
    });
    local v74 = v2.useCallback(function(v73) --[[ Line: 240 ]]
        -- upvalues: v36 (copy), v21 (ref), v56 (copy)
        v36(v73);
        if v73 == v21.Pressed then
            v56();
        end;
    end, {
        v56
    });
    local v75 = UDim2.fromScale(1, 0.5);
    local v78 = if v33.isContained then v42:map(function(v76) --[[ Line: 252 ]]
        -- upvalues: v33 (copy)
        local v77 = (v76 - v33.range.Min) / (v33.range.Max - v33.range.Min);
        return Vector2.new(v77, 0.5);
    end) else Vector2.new(0.5, 0.5);
    return v2.createElement(v6, v10(v33, {
        Size = UDim2.new(v33.width, UDim.new(0, v47.hitbox.height)), 
        GroupTransparency = if v33.isDisabled then v3.DISABLED_TRANSPARENCY else nil, 
        stateLayer = {
            affordance = v22.None
        }, 
        onStateChanged = v74, 
        isDisabled = v33.isDisabled, 
        ref = v45
    }), {
        DragDetector = v2.createElement("UIDragDetector", {
            DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
            [v2.Event.DragStart] = v59, 
            [v2.Event.DragContinue] = v71, 
            [v2.Event.DragEnd] = v72, 
            Enabled = not v33.isDisabled
        }), 
        Bar = v2.createElement(v6, {
            tag = v47.bar.tag, 
            testId = ("%*--bar"):format(v33.testId)
        }, {
            Fill = v2.createElement(v6, {
                tag = v47.fill.tag, 
                Size = v42:map(function(v79) --[[ Line: 286 ]]
                    -- upvalues: v33 (copy)
                    return UDim2.fromScale((v79 - v33.range.Min) / (v33.range.Max - v33.range.Min), 1);
                end), 
                testId = ("%*--fill"):format(v33.testId)
            }, {
                Knob = if v33.knob then v2.createElement(v6, {
                    tag = "auto-xy size-0-0", 
                    AnchorPoint = v78, 
                    Position = v75, 
                    Visible = v39, 
                    testId = ("%*--custom-knob"):format(v33.testId)
                }, v33.knob) else if v23.FoundationToggleVisualUpdate then v2.createElement(v25.Provider, {
                    value = v30
                }, {
                    Knob = v2.createElement(v24, {
                        AnchorPoint = v78, 
                        Position = v75, 
                        size = v33.size, 
                        style = v49.knobStyle, 
                        stroke = v47.knob.stroke, 
                        hasShadow = v47.knob.hasShadow, 
                        testId = ("%*--knob"):format(v33.testId)
                    })
                }) else v2.createElement(v24, {
                    AnchorPoint = v78, 
                    Position = v75, 
                    size = v33.size, 
                    style = v49.knobStyle, 
                    stroke = v47.knob.stroke, 
                    hasShadow = v47.knob.hasShadow, 
                    testId = ("%*--knob"):format(v33.testId)
                })
            })
        })
    });
end);