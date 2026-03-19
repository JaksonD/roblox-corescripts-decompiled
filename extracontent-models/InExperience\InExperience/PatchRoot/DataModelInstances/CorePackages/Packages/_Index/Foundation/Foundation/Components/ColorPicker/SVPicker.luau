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
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = {
    showSelectionKnob = true
};
return function(v12) --[[ Line: 29 ]] --[[ Name: SVPicker ]]
    -- upvalues: v9 (copy), v11 (copy), v7 (copy), v2 (copy), v6 (copy), v5 (copy), v8 (copy), v4 (copy), v3 (copy)
    local v13 = v9(v12, v11);
    local l_hue_0 = v13.hue;
    local l_saturation_0 = v13.saturation;
    local l_value_0 = v13.value;
    local l_onChanged_0 = v13.onChanged;
    local v18 = v7();
    local v20 = l_hue_0:map(function(v19) --[[ Line: 36 ]]
        return Color3.fromHSV(v19, 1, 1);
    end);
    local v21 = v2.useRef(nil);
    local v26 = v2.useCallback(function(v22) --[[ Line: 41 ]]
        -- upvalues: v21 (copy), v6 (ref), l_onChanged_0 (copy)
        local l_current_0 = v21.current;
        if not l_current_0 then
            return;
        else
            local v24, v25 = v6.calculateSVFromPosition(v22, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
            l_onChanged_0(v24, v25);
            return;
        end;
    end, {
        l_onChanged_0
    });
    local v29 = v2.useCallback(function(_, v28) --[[ Line: 53 ]]
        -- upvalues: v26 (copy)
        v26(v28);
    end, {
        v26
    });
    local v32 = v2.useCallback(function(_, v31) --[[ Line: 57 ]]
        -- upvalues: v26 (copy)
        v26(v31);
    end, {
        v26
    });
    return v2.createElement(v5, v8(v13, {
        tag = "size-full", 
        ref = v21, 
        ClipsDescendants = true
    }), {
        DragDetector = v2.createElement("UIDragDetector", {
            DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
            [v2.Event.DragStart] = v29, 
            [v2.Event.DragContinue] = v32
        }), 
        Base = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v18.Color.Extended.White.White_100.Color3, 
            ZIndex = 1, 
            BorderSizePixel = 0
        }), 
        Saturation = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v20, 
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
            BackgroundColor3 = v18.Color.Extended.Black.Black_100.Color3, 
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
        Knob = if v13.showSelectionKnob then v2.createElement(v4, {
            size = v3.Large, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = v2.joinBindings({
                l_saturation_0, 
                l_value_0
            }):map(function(v33) --[[ Line: 111 ]]
                local v34 = v33[1];
                local v35 = v33[2];
                return UDim2.fromScale(v34, 1 - v35);
            end), 
            style = v2.joinBindings({
                l_hue_0, 
                l_saturation_0, 
                l_value_0
            }):map(function(v36) --[[ Line: 116 ]]
                local v37 = v36[1];
                local v38 = v36[2];
                local v39 = v36[3];
                return {
                    Color3 = Color3.fromHSV(v37, v38, v39), 
                    Transparency = 0
                };
            end), 
            stroke = {
                Color = v18.Color.System.Contrast.Color3, 
                Thickness = v18.Stroke.Thicker, 
                Transparency = v18.Color.System.Contrast.Transparency
            }, 
            hasShadow = true, 
            ZIndex = 4
        }) else nil
    });
end;