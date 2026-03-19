local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v8 = require(l_script_FirstAncestor_0.Enums.NumberInputControlsVariant);
local v9 = require(l_script_FirstAncestor_0.Utility.Flags);
local v10 = require(l_Components_0.Icon);
local v11 = require(l_Components_0.InputField);
local v12 = require(l_Components_0.InternalTextInput);
local _ = require(l_Components_0.Types);
local v14 = require(l_Components_0.View);
local v15 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local v16 = require(l_Components_0.TextInput.useTextInputVariants);
local v17 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v18 = require(script.Parent.NumberInputControls);
local v19 = require(script.Parent.useNumberInputVariants);
local v20 = require(script.Parent.calculateNumberInputValueFromPositions);
local function _(v21, v22) --[[ Line: 36 ]] --[[ Name: round ]]
    local v23 = 10 ^ (v22 or 0);
    return math.floor(v21 * v23 + 0.5) / v23;
end;
local v26 = {
    controlsVariant = v8.Stacked, 
    size = v6.Large, 
    minimum = -1e999, 
    maximum = 1e999, 
    step = 1, 
    precision = 3, 
    value = 0, 
    formatAsString = function(v25) --[[ Line: 78 ]] --[[ Name: defaultFormatAsString ]]
        return (tostring(v25));
    end, 
    width = if v9.FoundationNumberInputTokenBasedWidth then nil else UDim.new(0, 400), 
    isScrubbable = false, 
    testId = "--foundation-number-input"
};
return v2.memo(v2.forwardRef(function(v27, v28) --[[ Line: 96 ]] --[[ Name: NumberInput ]]
    -- upvalues: v5 (copy), v26 (copy), v17 (copy), v16 (copy), v19 (copy), v9 (copy), v2 (copy), v18 (copy), v8 (copy), v20 (copy), v11 (copy), v4 (copy), v15 (copy), v12 (copy), v14 (copy), v10 (copy)
    local v29 = v5(v27, v26);
    local v30 = v17();
    local v31 = v16(v30, v29.size);
    local v32 = v19(v30, v29.size, if v9.FoundationNumberInputFixControlSizes then v29.controlsVariant else nil);
    local v33, v34 = v2.useState(false);
    local v35 = v2.useRef(nil);
    local v36, v37 = v2.useState(false);
    local v38 = v29.hasError or v36;
    local l_controlsVariant_0 = v29.controlsVariant;
    local v41 = v2.useCallback(function(v40) --[[ Line: 139 ]]
        -- upvalues: v29 (copy)
        return (math.clamp(v40, v29.minimum, v29.maximum));
    end, {
        v29.minimum, 
        v29.maximum
    });
    local v44 = v2.useCallback(function(v42, v43) --[[ Line: 143 ]]
        -- upvalues: v29 (copy)
        return v43(v42 / v29.step) * v29.step;
    end, {
        v29.step
    });
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    if not v33 then
        local l_value_0 = v29.value;
        local v50 = 10 ^ (v29.precision or 0);
        local v51 = math.floor(l_value_0 * v50 + 0.5) / v50;
        local v52 = v29.value + v29.step;
        local v53 = 10 ^ (v29.precision or 0);
        l_value_0 = math.floor(v52 * v53 + 0.5) / v53;
        v50 = v29.value - v29.step;
        local v54 = 10 ^ (v29.precision or 0);
        v52 = math.floor(v50 * v54 + 0.5) / v54;
        v53 = v44(v29.value, math.ceil);
        local v55 = 10 ^ (v29.precision or 0);
        v50 = math.floor(v53 * v55 + 0.5) / v55;
        v54 = v44(v29.value, math.floor);
        local v56 = 10 ^ (v29.precision or 0);
        v53 = math.floor(v54 * v56 + 0.5) / v56;
        if v51 ~= v50 then
            l_value_0 = v50;
        end;
        if v51 ~= v53 then
            v52 = v53;
        end;
        v47 = v41(l_value_0);
        v48 = v41(v52);
        v45 = v29.value == v29.maximum;
        v46 = v29.value == v29.minimum;
    end;
    local v57;
    if v29.value then
        local l_value_1 = v29.value;
        local v59 = 10 ^ (v29.precision or 0);
        v57 = math.floor(l_value_1 * v59 + 0.5) / v59;
    else
        v57 = 0;
    end;
    local v60 = if v33 then tostring(v29.value) else v29.formatAsString(v57);
    local v61 = v2.useRef(v60);
    v61.current = tostring(v29.value);
    local v62 = if not v9.FoundationNumberInputTokenBasedWidth or v29.width then v29.width else UDim.new(0, v32.container.width);
    local v64 = v2.useMemo(function() --[[ Line: 181 ]]
        -- upvalues: v29 (copy), v41 (copy)
        if v29.value and v29.maximum and v29.minimum then
            local v63 = v41(v29.value);
            if v29.maximum == v29.minimum then
                return 1;
            else
                return (v63 - v29.minimum) / (v29.maximum - v29.minimum);
            end;
        else
            return 0;
        end;
    end, {
        v29.value, 
        v29.maximum, 
        v29.minimum
    });
    local v65 = v2.useCallback(function() --[[ Line: 193 ]]
        -- upvalues: v34 (copy), v29 (copy)
        v34(true);
        if v29.onFocusGained then
            v29.onFocusGained();
        end;
    end, {
        v34, 
        v29.onFocusGained
    });
    local v70 = v2.useCallback(function(v66) --[[ Line: 201 ]]
        -- upvalues: v34 (copy), v37 (copy), v29 (copy)
        v34(false);
        v37(false);
        local v67 = math.clamp(v29.value, v29.minimum, v29.maximum);
        local l_onChanged_0 = v29.onChanged;
        local v69 = 10 ^ (v29.precision or 0);
        l_onChanged_0(math.floor(v67 * v69 + 0.5) / v69);
        if v29.onFocusLost then
            v29.onFocusLost(v66);
        end;
    end, {
        v34, 
        v29.onChanged, 
        v29.onFocusLost, 
        v29.maximum, 
        v29.minimum, 
        v29.precision, 
        v29.value
    });
    local v73 = v2.useCallback(function(v71) --[[ Line: 213 ]]
        -- upvalues: v33 (copy), v37 (copy), v29 (copy)
        if not v33 then
            return;
        else
            local v72 = tonumber(v71);
            if v72 == nil then
                v37(true);
                return;
            else
                v37(false);
                v29.onChanged(v72);
                return;
            end;
        end;
    end, {
        v33, 
        v29.onChanged
    });
    local v74 = v2.useCallback(function() --[[ Line: 228 ]]
        -- upvalues: v29 (copy), v45 (ref), v47 (ref)
        if v29.isDisabled or v45 then
            return;
        else
            v29.onChanged(v47);
            return;
        end;
    end, {
        v29.isDisabled, 
        v45, 
        v47, 
        v29.onChanged
    });
    local v75 = v2.useCallback(function() --[[ Line: 235 ]]
        -- upvalues: v29 (copy), v46 (ref), v48 (ref)
        if v29.isDisabled or v46 then
            return;
        else
            v29.onChanged(v48);
            return;
        end;
    end, {
        v29.isDisabled, 
        v46, 
        v48, 
        v29.onChanged
    });
    local v76 = v2.createElement(v18, {
        variant = l_controlsVariant_0, 
        size = v29.size, 
        increment = {
            isDisabled = v29.isDisabled or v45, 
            onClick = v74
        }, 
        decrement = {
            isDisabled = v29.isDisabled or v46, 
            onClick = v75
        }, 
        testId = v29.testId
    });
    local v77 = v2.useMemo(function() --[[ Line: 256 ]]
        -- upvalues: l_controlsVariant_0 (copy), v8 (ref), v32 (copy), v30 (copy)
        if l_controlsVariant_0 == v8.Split then
            return UDim.new(0, 2 * v32.splitButton.size + 2 * v30.Gap.XSmall);
        else
            return UDim.new();
        end;
    end, {
        v30, 
        l_controlsVariant_0
    });
    local v81 = v2.useCallback(function(_, v79) --[[ Line: 264 ]]
        -- upvalues: v9 (ref), v29 (copy), v61 (copy), v35 (copy)
        if not v9.FoundationDontCreateUIDDForNumberInput and not v29.isScrubbable then
            return;
        else
            local v80 = tonumber(v61.current);
            if v80 then
                v35.current = {
                    position = v79.X, 
                    value = v80
                };
            end;
            return;
        end;
    end, {
        v29.isScrubbable
    });
    local v87 = v2.useCallback(function(_, v83) --[[ Line: 276 ]]
        -- upvalues: v9 (ref), v29 (copy), v35 (copy), v20 (ref)
        if not v9.FoundationDontCreateUIDDForNumberInput and not v29.isScrubbable then
            return;
        else
            if v35.current then
                local v84 = v20(v35.current.value, v35.current.position, v83.X, v29.step);
                local v85 = 10 ^ (v29.precision or 0);
                local v86 = math.clamp(math.floor(v84 * v85 + 0.5) / v85, v29.minimum, v29.maximum);
                v29.onChanged(v86);
            end;
            return;
        end;
    end, {
        v29.isScrubbable, 
        v29.onChanged
    });
    local v88 = v2.useCallback(function() --[[ Line: 294 ]]
        -- upvalues: v9 (ref), v29 (copy), v35 (copy)
        if not v9.FoundationDontCreateUIDDForNumberInput and not v29.isScrubbable then
            return;
        else
            if v35.current then
                v35.current = nil;
            end;
            return;
        end;
    end, {
        v29.isScrubbable
    });
    local l_Transparency_0 = v30.Color.Shift.Shift_300.Transparency;
    local l_Transparency_1 = v30.Color.Shift.Shift_100.Transparency;
    local v92 = v2.useMemo(function() --[[ Line: 307 ]]
        -- upvalues: v64 (copy), l_Transparency_1 (copy), l_Transparency_0 (copy)
        if v64 == 0 then
            return NumberSequence.new(l_Transparency_1);
        elseif v64 == 1 then
            return NumberSequence.new(l_Transparency_0);
        elseif v64 > 0 or v64 < 1 then
            local v91 = {
                NumberSequenceKeypoint.new(0, l_Transparency_0), 
                NumberSequenceKeypoint.new(v64, l_Transparency_0), 
                NumberSequenceKeypoint.new(math.min(v64 + 0.001, 1), l_Transparency_1)
            };
            if v64 < 0.999 then
                table.insert(v91, NumberSequenceKeypoint.new(1, l_Transparency_1));
            end;
            return NumberSequence.new(v91);
        else
            return NumberSequence.new(l_Transparency_1);
        end;
    end, {
        v64, 
        l_Transparency_0, 
        l_Transparency_1
    });
    return v2.createElement(v11, v4(v29, {
        width = v62, 
        ref = v28, 
        hasError = v38, 
        label = v29.label, 
        size = v15(v29.size), 
        isRequired = v29.isRequired, 
        hint = v29.hint, 
        textBoxRef = v29.textBoxRef, 
        input = function(v93) --[[ Line: 338 ]] --[[ Name: input ]]
            -- upvalues: l_controlsVariant_0 (copy), v8 (ref), v2 (ref), v12 (ref), v60 (copy), v38 (copy), v29 (copy), v31 (copy), v73 (copy), v70 (copy), v65 (copy), v9 (ref), v81 (copy), v87 (copy), v88 (copy), v92 (copy), v30 (copy), v76 (copy), v14 (ref), v10 (ref), v62 (copy), v77 (copy)
            local v94 = l_controlsVariant_0 == v8.Split;
            local v95 = v2.createElement(v12, {
                text = v60, 
                hasError = v38, 
                size = v29.size, 
                horizontalPadding = {
                    left = v31.innerContainer.horizontalPadding
                }, 
                onChanged = v73, 
                onFocusLost = v70, 
                onFocus = v65, 
                onDragStarted = if v9.FoundationDontCreateUIDDForNumberInput then if v29.isScrubbable then v81 else nil else v81, 
                onDrag = if v9.FoundationDontCreateUIDDForNumberInput then if v29.isScrubbable then v87 else nil else v87, 
                onDragEnded = if v9.FoundationDontCreateUIDDForNumberInput then if v29.isScrubbable then v88 else nil else v88, 
                onReturnPressed = v29.onReturnPressed, 
                ref = v93, 
                backgroundGradient = if v29.isScrubbable and v92 then v2.createElement("UIGradient", {
                    Color = ColorSequence.new(v30.Color.Shift.Shift_300.Color3), 
                    Transparency = v92, 
                    Rotation = 0
                }) else nil, 
                trailingElement = if l_controlsVariant_0 == v8.Stacked then v76 else nil, 
                leadingElement = if v29.leadingIcon then v2.createElement(v14, {
                    tag = "size-0-full auto-x row align-y-center"
                }, v2.createElement(v10, {
                    name = v29.leadingIcon, 
                    style = v31.icon.style, 
                    size = v31.icon.size
                })) else nil, 
                isDisabled = v29.isDisabled, 
                testId = ("%*--field"):format(v29.testId)
            });
            if v94 then
                return (v2.createElement(v14, {
                    Size = UDim2.fromOffset(v62.Offset - v77.Offset, 0), 
                    tag = "row gap-xsmall auto-y align-y-center"
                }, {
                    InputField = v95, 
                    Controls = if v94 then v76 else nil
                }));
            else
                return v95;
            end;
        end
    }));
end));