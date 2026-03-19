local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_Cryo_0 = v4.Cryo;
local l_t_0 = v4.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.Utility.ExternalEventConnection);
local v14 = require(script.Parent.Connection.FocusHandler);
local v15 = require(script.Parent.Slider);
local v16 = require(script.Parent.AssetImage);
local v17 = l_Roact_0.PureComponent:extend("SliderWithInput");
v17.defaultProps = {
    width = UDim.new(1, 0)
};
v17.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    min = l_t_0.number, 
    max = l_t_0.number, 
    stepInterval = l_t_0.numberPositive, 
    keyboardInputStepInterval = l_t_0.optional(l_t_0.numberPositive), 
    value = l_t_0.number, 
    valueChanged = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    width = l_t_0.optional(l_t_0.UDim), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    sliderDotRef = l_t_0.optional(l_t_0.table), 
    onSelectionLost = l_t_0.callback, 
    onSelectionGained = l_t_0.callback
}), function(v18) --[[ Line: 66 ]]
    if v18.min > v18.max then
        return false, "min must be less than or equal to max";
    elseif v18.value > v18.max or v18.value < v18.min then
        return false, "value must be within min and max";
    else
        return true;
    end;
end);
v17.init = function(v19) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v19.textBoxRef = l_Roact_0.createRef();
    v19.state = {
        textEntryMode = false
    };
end;
v17.renderFocusHandler = function(v20) --[[ Line: 87 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy)
    return l_Roact_0.createElement(v14, {
        isFocused = v20.props.canCaptureFocus and v20.state.textEntryMode or false, 
        didFocus = function() --[[ Line: 91 ]] --[[ Name: didFocus ]]
            -- upvalues: l_GuiService_0 (ref), v20 (copy), l_ContextActionService_0 (ref)
            l_GuiService_0.CoreGuiNavigationEnabled = false;
            local l_value_0 = v20.props.value;
            l_ContextActionService_0:BindCoreAction("LeaveTextEntryMode", function(_, v23) --[[ Line: 100 ]]
                -- upvalues: v20 (ref), l_value_0 (copy)
                if v23 == Enum.UserInputState.End then
                    v20:setState({
                        textEntryMode = false
                    });
                    local l_current_0 = v20.textBoxRef.current;
                    l_current_0.Text = l_value_0;
                    l_current_0:ReleaseFocus();
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end, 
        didBlur = function() --[[ Line: 112 ]] --[[ Name: didBlur ]]
            -- upvalues: l_GuiService_0 (ref), l_ContextActionService_0 (ref)
            l_GuiService_0.CoreGuiNavigationEnabled = true;
            l_ContextActionService_0:UnbindCoreAction("LeaveTextEntryMode");
        end
    }) or nil;
end;
v17.renderWithSelectionCursor = function(v25, v26) --[[ Line: 119 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_Cryo_0 (copy), l_Roact_0 (copy), v15 (copy), l_withStyle_0 (copy), v16 (copy), l_CursorKind_0 (copy), v13 (copy), l_UserInputService_0 (copy)
    local l_props_0 = v25.props;
    local v28 = l_Cryo_0.Dictionary.join(l_props_0, {
        width = UDim.new(1, -80), 
        LayoutOrder = l_Cryo_0.None, 
        Position = l_Cryo_0.None, 
        AnchorPoint = l_Cryo_0.None, 
        keyboardInputStepInterval = l_Cryo_0.None, 
        NextSelectionRight = v25.textBoxRef
    });
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(l_props_0.width.Scale, l_props_0.width.Offset, 0, 36), 
        Position = l_props_0.Position, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Slider = l_Roact_0.createElement(v15, v28), 
        TextContainer = l_withStyle_0(function(v29) --[[ Line: 137 ]]
            -- upvalues: l_props_0 (copy), l_Roact_0 (ref), v16 (ref), v25 (copy), v26 (copy), l_CursorKind_0 (ref)
            local v30 = l_props_0.disabled and v29.Theme.TextMuted or v29.Theme.TextDefault;
            return l_Roact_0.createElement(v16.Label, {
                BackgroundTransparency = 1, 
                imageKey = "RoundedRect", 
                ImageTransparency = v29.Theme.BackgroundUIContrast.Transparency, 
                ImageColor3 = v29.Theme.BackgroundUIContrast.Color, 
                Size = UDim2.new(0, 64, 0, 36), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            }, {
                FocusHandler = v25:renderFocusHandler(), 
                Box = l_Roact_0.createElement("TextBox", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Font = v29.Font.Body.Font, 
                    TextScaled = true, 
                    ClearTextOnFocus = false, 
                    TextEditable = not l_props_0.disabled, 
                    TextColor3 = v30.Color, 
                    TextTransparency = v30.Transparency, 
                    Text = tostring(l_props_0.value), 
                    NextSelectionLeft = v25.props.sliderDotRef, 
                    SelectionImageObject = v26(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Event.SelectionLost] = v25.props.onSelectionLost, 
                    [l_Roact_0.Event.SelectionGained] = v25.props.onSelectionGained, 
                    [l_Roact_0.Ref] = v25.textBoxRef, 
                    [l_Roact_0.Event.Focused] = l_props_0.disabled and function(v31) --[[ Line: 167 ]]
                        v31:ReleaseFocus(false);
                    end or function() --[[ Line: 169 ]]
                        -- upvalues: v25 (ref)
                        v25:setState({
                            textEntryMode = true
                        });
                    end, 
                    [l_Roact_0.Event.FocusLost] = function(v32, _) --[[ Line: 172 ]]
                        -- upvalues: v25 (ref), l_props_0 (ref)
                        v25:setState({
                            textEntryMode = false
                        });
                        local v34 = tonumber(v32.Text);
                        if v34 ~= l_props_0.value then
                            if v34 == nil then
                                v32.Text = tostring(l_props_0.value);
                                return;
                            else
                                local l_stepInterval_0 = l_props_0.stepInterval;
                                if l_props_0.keyboardInputStepInterval then
                                    l_stepInterval_0 = l_props_0.keyboardInputStepInterval;
                                end;
                                local v36 = math.clamp(math.floor(v34 / l_stepInterval_0 + 0.5) * l_stepInterval_0, l_props_0.min, l_props_0.max);
                                v32.Text = tostring(v36);
                                if v36 ~= l_props_0.value then
                                    l_props_0.valueChanged(v36);
                                end;
                            end;
                        end;
                    end
                }, {
                    TextSizeConstraint = l_Roact_0.createElement("UITextSizeConstraint", {
                        MinTextSize = v29.Font.Body.RelativeMinSize * v29.Font.BaseSize, 
                        MaxTextSize = v29.Font.Body.RelativeSize * v29.Font.BaseSize
                    })
                })
            });
        end), 
        UserInputConnection = not l_props_0.disabled and l_Roact_0.createElement(v13, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v37, _) --[[ Line: 210 ]] --[[ Name: callback ]]
                -- upvalues: l_UserInputService_0 (ref), v25 (copy), l_props_0 (copy)
                if v37.UserInputType ~= Enum.UserInputType.Keyboard then
                    return;
                elseif l_UserInputService_0:GetFocusedTextBox() ~= v25.textBoxRef.current then
                    return;
                else
                    local v39 = 0;
                    if v37.KeyCode == Enum.KeyCode.Up then
                        v39 = 1;
                    elseif v37.KeyCode == Enum.KeyCode.Down then
                        v39 = -1;
                    end;
                    if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                        v39 = v39 * 10;
                    end;
                    if v39 ~= 0 then
                        local v40 = math.clamp(math.floor((l_props_0.value + l_props_0.stepInterval * v39) / l_props_0.stepInterval + 0.5) * l_props_0.stepInterval, l_props_0.min, l_props_0.max);
                        if v40 ~= l_props_0.value then
                            l_props_0.valueChanged(v40);
                        end;
                    end;
                    return;
                end;
            end
        })
    });
end;
v17.render = function(v41) --[[ Line: 250 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v42) --[[ Line: 251 ]]
        -- upvalues: v41 (copy)
        return v41:renderWithSelectionCursor(v42);
    end);
end;
return v17;