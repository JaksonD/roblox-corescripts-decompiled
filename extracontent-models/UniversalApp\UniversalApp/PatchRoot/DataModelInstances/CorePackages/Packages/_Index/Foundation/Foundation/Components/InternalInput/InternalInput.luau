local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local l_useMotion_0 = require(l_Parent_0.Motion).useMotion;
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v7 = require(l_Components_0.InputLabel);
local _ = require(l_Components_0.Types);
local v9 = require(l_Components_0.View);
local v10 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v11 = require(script.Parent.useInputMotionStates);
local v12 = require(script.Parent.useInputVariants);
local v13 = require(l_script_FirstAncestor_0.Utility.getInputTextSize);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v15 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v16 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v17 = require(l_script_FirstAncestor_0.Constants);
local v18 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v19 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v22 = {
    size = v19.Medium, 
    Selectable = true, 
    testId = "--foundation-internal-input"
};
return v5.memo(v5.forwardRef(function(v23, v24) --[[ Line: 83 ]] --[[ Name: InternalInput ]]
    -- upvalues: v16 (copy), v22 (copy), v5 (copy), v14 (copy), v12 (copy), v11 (copy), v2 (copy), l_useMotion_0 (copy), v18 (copy), v17 (copy), v10 (copy), v9 (copy), v15 (copy), v4 (copy), v7 (copy), v13 (copy)
    local v25 = v16(v23, v22);
    local l_text_0 = v25.label.text;
    local v27 = v25.label.position or Enum.HorizontalAlignment.Right;
    local v28 = if typeof(l_text_0) == "string" then #l_text_0 > 0 else l_text_0 ~= nil;
    local v29, v30 = v5.useState(false);
    local v31 = v14();
    local v32 = v25.isChecked or v25.isIndeterminate;
    local v33 = v12(v31, v25.size, v27);
    local v34 = v5.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v25 (copy), v31 (copy)
        return {
            radius = v25.customVariantProps.cursorRadius or UDim.new(0, 0), 
            offset = v31.Size.Size_200, 
            borderWidth = v31.Stroke.Thicker
        };
    end, {
        v31, 
        v28, 
        v25.customVariantProps.cursorRadius
    });
    local v35 = v11(v31, if v2.FoundationToggleVisualUpdate then v25.customVariantProps.colors else v25.customVariantProps.checkedStyle);
    local v36, v37 = l_useMotion_0(v35.Default);
    v5.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v32 (copy), v37 (copy), v35 (copy), v29 (copy)
        if v32 then
            v37(v35.Checked);
            return;
        elseif v29 then
            v37(v35.Hover);
            return;
        else
            v37(v35.Default);
            return;
        end;
    end, {
        v32, 
        v29, 
        v35
    });
    local v39 = v5.useCallback(function(v38) --[[ Line: 123 ]]
        -- upvalues: v30 (copy), v18 (ref)
        v30(v38 == v18.Hover);
    end, {});
    local v40 = v5.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v25 (copy)
        if v25.isDisabled then
            return;
        else
            v25.onActivated(not v25.isChecked);
            return;
        end;
    end, {
        v25.isDisabled, 
        v25.isChecked, 
        v25.onActivated
    });
    local v41 = {
        Selectable = not v25.isDisabled and v25.Selectable, 
        NextSelectionUp = v25.NextSelectionUp, 
        NextSelectionDown = v25.NextSelectionDown, 
        NextSelectionLeft = v25.NextSelectionLeft, 
        NextSelectionRight = v25.NextSelectionRight
    };
    local v42 = {
        Active = not v25.isDisabled, 
        GroupTransparency = if v25.isDisabled then v17.DISABLED_TRANSPARENCY else 0, 
        onActivated = v40, 
        onStateChanged = v39, 
        stateLayer = {
            affordance = v10.None
        }, 
        selection = if v28 then {
            Selectable = false
        } else v41, 
        cursor = if v28 then nil else v34, 
        isDisabled = v25.isDisabled, 
        ref = v24
    };
    local v43 = if v2.FoundationToggleVisualUpdate and v25.customVariantProps.stroke and v25.customVariantProps.stroke.thickness ~= nil then v25.customVariantProps.stroke.thickness else v33.input.stroke.thickness;
    local v46 = {
        tag = v25.customVariantProps.tag, 
        Size = v25.customVariantProps.size - UDim2.fromOffset(v43, v43), 
        backgroundStyle = v36.backgroundStyle, 
        onActivated = v40, 
        stateLayer = {
            affordance = v10.Background
        }, 
        stroke = {
            Color = v36.strokeStyle:map(function(v44) --[[ Line: 168 ]]
                return v44.Color3;
            end), 
            Transparency = v36.strokeStyle:map(function(v45) --[[ Line: 171 ]]
                -- upvalues: v25 (copy), v28 (copy), v17 (ref)
                if v25.isDisabled and not v28 then
                    return v17.DISABLED_TRANSPARENCY;
                else
                    return v45.Transparency;
                end;
            end), 
            Thickness = v43, 
            BorderStrokePosition = Enum.BorderStrokePosition.Inner
        }, 
        selection = v41, 
        cursor = if v28 then v34 else nil, 
        LayoutOrder = if v28 then v27 == Enum.HorizontalAlignment.Left and 1 or -1 else nil, 
        testId = ("%*--container"):format(v25.testId)
    };
    if not v28 then
        return v5.createElement(v9, v15(v25, v4.union(v42, v46)), v25.children);
    else
        local v47 = {
            tag = v33.container.tag, 
            padding = {
                top = v33.container.padding, 
                bottom = v33.container.padding, 
                left = if v27 == Enum.HorizontalAlignment.Right then v33.container.padding else nil, 
                right = if v27 == Enum.HorizontalAlignment.Left then v33.container.padding else nil
            }
        };
        return v5.createElement(v9, v15(v25, v4.union(v47, v42)), {
            Input = v5.createElement(v9, v46, v25.children), 
            InputLabel = if typeof(l_text_0) == "string" then v5.createElement(v7, {
                Text = l_text_0, 
                textStyle = v36.labelStyle, 
                size = v13(v25.size), 
                testId = ("%*--label"):format(v25.testId)
            }) else l_text_0
        });
    end;
end));