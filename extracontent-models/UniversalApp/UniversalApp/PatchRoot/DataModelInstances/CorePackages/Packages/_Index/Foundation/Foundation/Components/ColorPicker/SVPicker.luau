local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v4 = require(l_script_FirstAncestor_0.Components.Knob);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Components.ColorPicker.colorUtils);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = {
    showSelectionKnob = true
};
return function(v13) --[[ Line: 33 ]] --[[ Name: SVPicker ]]
    -- upvalues: v9 (copy), v12 (copy), v7 (copy), v2 (copy), v6 (copy), v5 (copy), v8 (copy), v10 (copy), v4 (copy), v3 (copy)
    local v14 = v9(v13, v12);
    local l_hue_0 = v14.hue;
    local l_saturation_0 = v14.saturation;
    local l_value_0 = v14.value;
    local l_onChanged_0 = v14.onChanged;
    local l_onDragStarted_0 = v14.onDragStarted;
    local l_onDragEnded_0 = v14.onDragEnded;
    local v21 = v7();
    local v23 = l_hue_0:map(function(v22) --[[ Line: 42 ]]
        return Color3.fromHSV(v22, 1, 1);
    end);
    local v24 = v2.useRef(nil);
    local v29 = v2.useCallback(function(v25) --[[ Line: 47 ]]
        -- upvalues: v24 (copy), v6 (ref), l_onChanged_0 (copy)
        local l_current_0 = v24.current;
        if not l_current_0 then
            return;
        else
            local v27, v28 = v6.calculateSVFromPosition(v25, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
            l_onChanged_0(v27, v28);
            return;
        end;
    end, {
        l_onChanged_0
    });
    local v32 = v2.useCallback(function(_, v31) --[[ Line: 59 ]]
        -- upvalues: l_onDragStarted_0 (copy), v29 (copy)
        if l_onDragStarted_0 then
            l_onDragStarted_0();
        end;
        v29(v31);
    end, {
        v29, 
        l_onDragStarted_0
    });
    local v35 = v2.useCallback(function(_, v34) --[[ Line: 66 ]]
        -- upvalues: v29 (copy)
        v29(v34);
    end, {
        v29
    });
    return v2.createElement(v5, v8(v14, {
        tag = v10.FoundationColorPickerDesignUpdate and "size-full radius-small" or "size-full", 
        ref = v24, 
        ClipsDescendants = true
    }), {
        DragDetector = v2.createElement("UIDragDetector", {
            DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
            [v2.Event.DragStart] = v32, 
            [v2.Event.DragContinue] = v35, 
            [v2.Event.DragEnd] = l_onDragEnded_0
        }), 
        Base = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v21.Color.Extended.White.White_100.Color3, 
            ZIndex = 1, 
            BorderSizePixel = 0
        }), 
        Saturation = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v23, 
            ZIndex = 2, 
            BorderSizePixel = 0
        }, {
            Gradient = v2.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        Value = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v21.Color.Extended.Black.Black_100.Color3, 
            ZIndex = 3, 
            BorderSizePixel = 0
        }, {
            Gradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        Knob = if v14.showSelectionKnob then v2.createElement(v4, {
            size = if v10.FoundationColorPickerDesignUpdate then v3.Medium else v3.Large, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = v2.joinBindings({
                l_saturation_0, 
                l_value_0
            }):map(function(v36) --[[ Line: 121 ]]
                local v37 = v36[1];
                local v38 = v36[2];
                return UDim2.fromScale(v37, 1 - v38);
            end), 
            style = v2.joinBindings({
                l_hue_0, 
                l_saturation_0, 
                l_value_0
            }):map(function(v39) --[[ Line: 126 ]]
                local v40 = v39[1];
                local v41 = v39[2];
                local v42 = v39[3];
                return {
                    Color3 = Color3.fromHSV(v40, v41, v42), 
                    Transparency = 0
                };
            end), 
            stroke = {
                Color = v21.Color.System.Contrast.Color3, 
                Thickness = v21.Stroke.Thicker, 
                Transparency = v21.Color.System.Contrast.Transparency
            }, 
            hasShadow = true, 
            ZIndex = 4
        }) else nil
    });
end;