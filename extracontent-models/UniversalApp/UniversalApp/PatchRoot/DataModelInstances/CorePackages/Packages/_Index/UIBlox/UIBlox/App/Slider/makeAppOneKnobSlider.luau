local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_0.makeAppSlider);
local v8 = require(l_Parent_0.SliderTextInput);
local v9 = require(l_Parent_2.Core.Style.withStyle);
local v10 = require(l_Parent_1.Style.Validator.validateStyle);
local function v16(v11) --[[ Line: 15 ]] --[[ Name: wrapStyleAndRef ]]
    -- upvalues: v4 (copy), v9 (copy), v5 (copy)
    return v4.forwardRef(function(v12, v13) --[[ Line: 16 ]]
        -- upvalues: v9 (ref), v5 (ref), v4 (ref), v11 (copy)
        return v9(function(v14) --[[ Line: 17 ]]
            -- upvalues: v5 (ref), v12 (copy), v13 (copy), v4 (ref), v11 (ref)
            local v15 = v5.Dictionary.join(v12, {
                style = v14, 
                forwardedRef = v13
            });
            return v4.createElement(v11, v15);
        end);
    end);
end;
return function(v17) --[[ Line: 28 ]] --[[ Name: makeAppOneKnobSlider ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy), v10 (copy), v8 (copy), v16 (copy)
    local v18 = v4.PureComponent:extend("OneKnobAppSliderFor" .. v17);
    local v19 = v7(v17, false);
    v18.validateProps = v6.strictInterface({
        value = v6.number, 
        min = v6.number, 
        max = v6.number, 
        onValueChanged = v6.callback, 
        onDragStart = v6.optional(v6.callback), 
        onDragEnd = v6.optional(v6.callback), 
        stepInterval = v6.optional(v6.numberPositive), 
        textInputEnabled = v6.optional(v6.boolean), 
        isDisabled = v6.optional(v6.boolean), 
        width = v6.optional(v6.UDim), 
        position = v6.optional(v6.UDim2), 
        anchorPoint = v6.optional(v6.Vector2), 
        layoutOrder = v6.optional(v6.integer), 
        forwardedRef = v6.optional(v6.table), 
        NextSelectionUp = v6.optional(v6.table), 
        NextSelectionDown = v6.optional(v6.table), 
        customTrack = v6.optional(v6.table), 
        customKnobColorLower = v6.optional(v6.Color3), 
        customPressedKnobShadowTransparencyLower = v6.optional(v6.number), 
        customKnobHeight = v6.optional(v6.number), 
        customKnobBorderSize = v6.optional(v6.number), 
        customKnobBorderColor = v6.optional(v6.Color3), 
        style = v10, 
        containerRef = v6.optional(v6.table)
    });
    v18.defaultProps = {
        stepInterval = 1, 
        width = UDim.new(1, 0), 
        textInputEnabled = false
    };
    v18.render = function(v20) --[[ Line: 86 ]] --[[ Name: render ]]
        -- upvalues: v4 (ref), v19 (copy), v8 (ref)
        local l_props_0 = v20.props;
        local v22 = {
            value = l_props_0.value, 
            min = l_props_0.min, 
            max = l_props_0.max, 
            stepInterval = l_props_0.stepInterval, 
            isDisabled = l_props_0.isDisabled, 
            onValueChanged = l_props_0.onValueChanged, 
            onDragStartLower = l_props_0.onDragStart, 
            onDragEnd = l_props_0.onDragEnd, 
            style = l_props_0.style, 
            forwardedRef = l_props_0.forwardedRef, 
            NextSelectionUp = l_props_0.NextSelectionUp, 
            NextSelectionDown = l_props_0.NextSelectionDown, 
            customTrack = l_props_0.customTrack, 
            customKnobHeight = l_props_0.customKnobHeight, 
            customKnobBorderColor = l_props_0.customKnobBorderColor, 
            customKnobBorderSize = l_props_0.customKnobBorderSize, 
            customKnobColorLower = l_props_0.customKnobColorLower, 
            customPressedKnobShadowTransparencyLower = l_props_0.customPressedKnobShadowTransparencyLower, 
            containerRef = l_props_0.containerRef
        };
        if not l_props_0.textInputEnabled then
            v22.width = l_props_0.width;
            v22.position = l_props_0.position;
            v22.anchorPoint = l_props_0.anchorPoint;
            v22.layoutOrder = l_props_0.layoutOrder;
            return v4.createElement(v19, v22);
        else
            v22.width = UDim.new(1, -68);
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(l_props_0.width.Scale, l_props_0.width.Offset, 0, 44), 
                AnchorPoint = l_props_0.anchorPoint, 
                LayoutOrder = l_props_0.layoutOrder, 
                Position = l_props_0.position
            }, {
                Slider = v4.createElement(v19, v22), 
                TextInput = v4.createElement(v8, {
                    position = UDim2.new(1, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(1, 0.5), 
                    value = l_props_0.value, 
                    min = l_props_0.min, 
                    max = l_props_0.max, 
                    disabled = l_props_0.isDisabled, 
                    stepInterval = l_props_0.stepInterval, 
                    onValueChanged = l_props_0.onValueChanged
                })
            });
        end;
    end;
    return v16(v18);
end;