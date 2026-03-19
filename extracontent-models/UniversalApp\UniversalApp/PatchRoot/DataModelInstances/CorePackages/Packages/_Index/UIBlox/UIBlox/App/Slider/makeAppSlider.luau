local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_0.Style.Colors);
local v6 = require(l_Parent_1.Core.Slider.GenericSlider);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = {
    frequency = 5
};
local v9 = require(l_Parent_1.Utility.divideTransparency);
local v10 = require(l_Parent_1.Utility.lerp);
return function(v11, v12) --[[ Line: 21 ]] --[[ Name: makeAppSlider ]]
    -- upvalues: v3 (copy), v9 (copy), v5 (copy), v10 (copy), v4 (copy), v8 (copy), v7 (copy), v6 (copy)
    local v13 = v3.PureComponent:extend("AppSliderFor" .. v11);
    v13.defaultProps = {
        textInputEnabled = false, 
        stepInterval = 1, 
        width = UDim.new(1, 0), 
        customPressedKnobShadowTransparencyLower = 1
    };
    v13.init = function(v14) --[[ Line: 32 ]] --[[ Name: init ]]
        -- upvalues: v3 (ref), v9 (ref), v11 (copy), v5 (ref), v10 (ref), v4 (ref), v8 (ref)
        local v15 = nil;
        local v16 = nil;
        local v17, v18 = v3.createBinding(0);
        v14.pressedProgressLower = v17;
        v15 = v18;
        v17, v18 = v3.createBinding(0);
        v14.pressedProgressUpper = v17;
        v16 = v18;
        v17, v18 = v3.createBinding(v14.props.isDisabled);
        v14.disabled = v17;
        v14.setDisabled = v18;
        v17, v18 = v3.createBinding(v14.props.style);
        v14.style = v17;
        v14.setStyle = v18;
        v14.wasUnmounted = false;
        v17 = v3.joinBindings({
            disabled = v14.disabled, 
            pressedProgressLower = v14.pressedProgressLower, 
            pressedProgressUpper = v14.pressedProgressUpper, 
            style = v14.style
        });
        v14.trackColor = v17:map(function(v19) --[[ Line: 48 ]]
            return v19.style.Theme.UIMuted.Color;
        end);
        v14.trackTransparency = v17:map(function(v20) --[[ Line: 52 ]]
            -- upvalues: v9 (ref)
            return v9(v20.style.Theme.UIMuted.Transparency, v20.disabled and 2 or 1);
        end);
        v14.trackFillColor = v17:map(function(v21) --[[ Line: 56 ]]
            -- upvalues: v11 (ref)
            return v21.style.Theme[v11].Color;
        end);
        v14.trackFillTransparency = v17:map(function(v22) --[[ Line: 60 ]]
            -- upvalues: v9 (ref), v11 (ref)
            return v9(v22.style.Theme[v11].Transparency, v22.disabled and 2 or 1);
        end);
        v14.knobColorLower = v17:map(function(v23) --[[ Line: 64 ]]
            -- upvalues: v5 (ref), v11 (ref)
            if v23.disabled then
                return v5.Pumice;
            else
                local v24 = Color3.new(1, 1, 1);
                local l_Pumice_0 = v5.Pumice;
                if v11 ~= "SystemPrimaryDefault" then
                    l_Pumice_0 = v23.style.Theme[v11].Color;
                end;
                return v24:lerp(l_Pumice_0, v23.pressedProgressLower);
            end;
        end);
        v14.knobColorUpper = v17:map(function(v26) --[[ Line: 79 ]]
            -- upvalues: v5 (ref), v11 (ref)
            if v26.disabled then
                return v5.Pumice;
            else
                local v27 = Color3.new(1, 1, 1);
                local l_Pumice_1 = v5.Pumice;
                if v11 ~= "SystemPrimaryDefault" then
                    l_Pumice_1 = v26.style.Theme[v11].Color;
                end;
                return v27:lerp(l_Pumice_1, v26.pressedProgressUpper);
            end;
        end);
        v14.knobTransparency = v17:map(function(v29) --[[ Line: 94 ]]
            -- upvalues: v9 (ref), v11 (ref)
            return v9(v29.style.Theme[v11].Transparency, v29.disabled and 2 or 1);
        end);
        v14.knobShadowTransparencyLower = v17:map(function(v30) --[[ Line: 98 ]]
            -- upvalues: v14 (copy), v10 (ref)
            if v30.disabled then
                return 1;
            else
                local l_customPressedKnobShadowTransparencyLower_0 = v14.props.customPressedKnobShadowTransparencyLower;
                return v10(v30.style.Theme.DropShadow.Transparency, l_customPressedKnobShadowTransparencyLower_0, v30.pressedProgressLower);
            end;
        end);
        v14.knobShadowTransparencyUpper = v17:map(function(v32) --[[ Line: 107 ]]
            -- upvalues: v10 (ref)
            if v32.disabled then
                return 1;
            else
                return v10(v32.style.Theme.DropShadow.Transparency, 1, v32.pressedProgressUpper);
            end;
        end);
        v14.pressedMotorLower = v4.createSingleMotor(0);
        v14.pressedMotorLower:onStep(v15);
        v14.pressedMotorUpper = v4.createSingleMotor(0);
        v14.pressedMotorUpper:onStep(v16);
        v14.onDragStartLower = function() --[[ Line: 121 ]]
            -- upvalues: v14 (copy), v4 (ref), v8 (ref)
            if v14.props.onDragStartLower then
                v14.props.onDragStartLower();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorLower:setGoal(v4.spring(1, v8));
            end;
        end;
        v14.onDragStartUpper = function() --[[ Line: 131 ]]
            -- upvalues: v14 (copy), v4 (ref), v8 (ref)
            if v14.props.onDragStartUpper then
                v14.props.onDragStartUpper();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorUpper:setGoal(v4.spring(1, v8));
            end;
        end;
        v14.onDragEnd = function() --[[ Line: 141 ]]
            -- upvalues: v14 (copy), v4 (ref), v8 (ref)
            if v14.props.onDragEnd then
                v14.props.onDragEnd();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorLower:setGoal(v4.spring(0, v8));
                v14.pressedMotorUpper:setGoal(v4.spring(0, v8));
            end;
        end;
    end;
    v13.render = function(v33) --[[ Line: 153 ]] --[[ Name: render ]]
        -- upvalues: v7 (ref), v3 (ref), v12 (copy), v6 (ref)
        local l_props_0 = v33.props;
        local v35 = l_props_0.customKnobColorLower or v33.knobColorLower;
        local v36 = {
            min = l_props_0.min, 
            max = l_props_0.max, 
            stepInterval = l_props_0.stepInterval, 
            isDisabled = l_props_0.isDisabled, 
            width = l_props_0.width, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            layoutOrder = l_props_0.layoutOrder, 
            onValueChanged = l_props_0.onValueChanged, 
            onDragStartLower = v33.onDragStartLower, 
            onDragStartUpper = v33.onDragStartUpper, 
            onDragEnd = v33.onDragEnd, 
            trackImage = v7["component_assets/circle_16"], 
            trackColor = v33.trackColor, 
            trackTransparency = v33.trackTransparency, 
            trackSliceCenter = Rect.new(8, 8, 8, 8), 
            trackFillImage = v7["component_assets/circle_16"], 
            trackFillColor = v33.trackFillColor, 
            trackFillTransparency = v33.trackFillTransparency, 
            trackFillSliceCenter = Rect.new(8, 8, 8, 8), 
            knobImage = v7["component_assets/circle_28_padding_10"], 
            knobColorLower = v35, 
            knobColorUpper = v33.knobColorUpper, 
            knobTransparency = v33.knobTransparency, 
            knobImagePadding = 10, 
            knobShadowImage = v7["component_assets/dropshadow_28"], 
            knobShadowTransparencyLower = v33.knobShadowTransparencyLower, 
            knobShadowTransparencyUpper = v33.knobShadowTransparencyUpper, 
            [v3.Ref] = l_props_0.forwardedRef, 
            NextSelectionUp = l_props_0.NextSelectionUp, 
            NextSelectionDown = l_props_0.NextSelectionDown, 
            focusController = l_props_0.focusController, 
            customTrack = l_props_0.customTrack, 
            customKnobHeight = l_props_0.customKnobHeight, 
            customKnobBorderSize = l_props_0.customKnobBorderSize, 
            customKnobBorderColor = l_props_0.customKnobBorderColor, 
            containerRef = l_props_0.containerRef
        };
        if v12 then
            v36.upperValue = l_props_0.upperValue;
            v36.lowerValue = l_props_0.lowerValue;
        else
            v36.lowerValue = l_props_0.value;
        end;
        return v3.createElement(v6, v36);
    end;
    v13.didMount = function(v37) --[[ Line: 217 ]] --[[ Name: didMount ]]
        v37.pressedMotorLower:start();
        v37.pressedMotorUpper:start();
    end;
    v13.didUpdate = function(v38, v39) --[[ Line: 222 ]] --[[ Name: didUpdate ]]
        -- upvalues: v4 (ref), v8 (ref)
        if v39.style ~= v38.props.style then
            v38.setStyle(v38.props.style);
        end;
        if v39.isDisabled ~= v38.props.isDisabled then
            v38.setDisabled(v38.props.isDisabled);
            if v38.props.isDisabled then
                v38.pressedMotorLower:setGoal(v4.spring(0, v8));
                v38.pressedMotorUpper:setGoal(v4.spring(0, v8));
            end;
        end;
    end;
    v13.willUnmount = function(v40) --[[ Line: 237 ]] --[[ Name: willUnmount ]]
        v40.wasUnmounted = true;
        v40.pressedMotorLower:destroy();
        v40.pressedMotorUpper:destroy();
    end;
    return v13;
end;