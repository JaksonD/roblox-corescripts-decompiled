local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_Components_0.InternalInput);
local v7 = require(l_Components_0.Knob);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local _ = require(l_Components_0.Types);
local v10 = require(l_Components_0.InternalInput.useUncontrolledState);
local v11 = require(l_Parent_0.BuilderIcons);
local v12 = require(l_script_FirstAncestor_0.Utility.Flags);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v18 = require(script.Parent.useToggleVariants);
local v19 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v21 = require(l_script_FirstAncestor_0.Enums.InputPlacement);
local v22 = {
    frequency = 4
};
local v23 = {
    size = v19.Medium, 
    placement = v21.Start, 
    Selectable = true, 
    testId = "--foundation-toggle"
};
local v24 = {
    colorMode = v16.Color
};
return v3.memo(v3.forwardRef(function(v25, v26) --[[ Line: 66 ]] --[[ Name: Toggle ]]
    -- upvalues: v15 (copy), v23 (copy), v13 (copy), v18 (copy), v10 (copy), v12 (copy), v19 (copy), v3 (copy), v2 (copy), v22 (copy), v6 (copy), v14 (copy), v4 (copy), v8 (copy), v24 (copy), v7 (copy), v11 (copy)
    local v27 = v15(v25, v23);
    local v28 = v13();
    local v29 = v18(v28, v27.size);
    local v30, v31 = v10(v27.isChecked, v27.onActivated);
    local v32 = if v12.FoundationToggleVisualUpdate then if v25.size == v19.Large then v19.Medium else v27.size else v27.size;
    local v33 = not v12.FoundationToggleVisualUpdate or false;
    local v34 = v30 and 1 or 0;
    local v35, v36 = v3.useBinding(v34);
    local v37 = v3.useRef(nil);
    local v39 = v35:map(function(v38) --[[ Line: 82 ]]
        -- upvalues: v29 (copy)
        return v29.knob.offPosition:Lerp(v29.knob.onPosition, v38);
    end);
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v2 (ref), v34 (copy), v37 (copy), v36 (copy)
        local v40 = v2.createSingleMotor(v34);
        v37.current = v40;
        v40:start();
        v40:onStep(function(v41) --[[ Line: 91 ]]
            -- upvalues: v36 (ref)
            v36(v41);
        end);
        return function() --[[ Line: 95 ]]
            -- upvalues: v40 (copy)
            v40:destroy();
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v30 (copy), v37 (copy), v2 (ref), v22 (ref)
        local v42 = v30 and 1 or 0;
        if v37.current then
            v37.current:setGoal(v2.spring(v42, v22));
        end;
    end, {
        v30
    });
    return v3.createElement(v6, v14(v27, {
        isChecked = v30, 
        isDisabled = v27.isDisabled, 
        onActivated = v31, 
        label = {
            text = v27.label, 
            position = v4.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v27.placement]
        }, 
        customVariantProps = v29.input, 
        size = v27.size, 
        Selectable = v27.Selectable, 
        NextSelectionUp = v27.NextSelectionUp, 
        NextSelectionDown = v27.NextSelectionDown, 
        NextSelectionLeft = v27.NextSelectionLeft, 
        NextSelectionRight = v27.NextSelectionRight, 
        ref = v26
    }), v3.createElement(v8.Provider, {
        value = v24
    }, {
        Knob = if v12.FoundationToggleVisualUpdate then v3.createElement(v7, {
            size = v32, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = v39, 
            hasShadow = v33, 
            icon = if v30 then {
                name = v11.Icon.Check, 
                variant = v11.IconVariant.Regular
            } else nil, 
            testId = ("%*--knob"):format(v27.testId)
        }) else v3.createElement(v7, {
            size = v32, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = v39, 
            testId = ("%*--knob"):format(v27.testId)
        })
    }));
end));