local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_0.makeAppSlider);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_1.Style.Validator.validateStyle);
local function v15(v10) --[[ Line: 15 ]] --[[ Name: wrapStyleAndRef ]]
    -- upvalues: v4 (copy), v8 (copy), v5 (copy)
    return v4.forwardRef(function(v11, v12) --[[ Line: 16 ]]
        -- upvalues: v8 (ref), v5 (ref), v4 (ref), v10 (copy)
        return v8(function(v13) --[[ Line: 17 ]]
            -- upvalues: v5 (ref), v11 (copy), v12 (copy), v4 (ref), v10 (ref)
            local v14 = v5.Dictionary.join(v11, {
                style = v13, 
                forwardedRef = v12
            });
            return v4.createElement(v10, v14);
        end);
    end);
end;
return function(v16) --[[ Line: 28 ]] --[[ Name: makeAppTwoKnobSlider ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy), v9 (copy), v15 (copy)
    local v17 = v4.PureComponent:extend("TwoKnobAppSliderFor" .. v16);
    local v18 = v7(v16, true);
    local v19 = v6.strictInterface({
        lowerValue = v6.number, 
        upperValue = v6.number, 
        min = v6.number, 
        max = v6.number, 
        stepInterval = v6.optional(v6.numberPositive), 
        onValueChanged = v6.callback, 
        onDragStartLower = v6.optional(v6.callback), 
        onDragStartUpper = v6.optional(v6.callback), 
        onDragEnd = v6.optional(v6.callback), 
        isDisabled = v6.optional(v6.boolean), 
        width = v6.optional(v6.UDim), 
        position = v6.optional(v6.UDim2), 
        anchorPoint = v6.optional(v6.Vector2), 
        layoutOrder = v6.optional(v6.integer), 
        forwardedRef = v6.optional(v6.table), 
        NextSelectionUp = v6.optional(v6.table), 
        NextSelectionDown = v6.optional(v6.table), 
        focusController = v6.optional(v6.table), 
        style = v9
    });
    v17.validateProps = v6.intersection(v19, function(v20) --[[ Line: 76 ]] --[[ Name: valueValidator ]]
        if v20.lowerValue > v20.upperValue then
            return false, "The upper value must be greater than or equal to the lower";
        else
            return true;
        end;
    end);
    v17.defaultProps = {
        stepInterval = 1, 
        width = UDim.new(1, 0)
    };
    v17.render = function(v21) --[[ Line: 91 ]] --[[ Name: render ]]
        -- upvalues: v4 (ref), v18 (copy)
        return v4.createElement(v18, v21.props);
    end;
    return v15(v17);
end;