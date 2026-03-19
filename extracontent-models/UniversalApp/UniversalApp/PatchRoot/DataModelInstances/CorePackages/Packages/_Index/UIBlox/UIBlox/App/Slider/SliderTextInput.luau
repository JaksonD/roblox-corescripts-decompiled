local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.t);
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v5 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v7 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v8 = require(l_Parent_0.UIBlox.Utility.divideTransparency);
local v9 = v2.PureComponent:extend("SliderTextInput");
v9.validateProps = v3.strictInterface({
    position = v3.optional(v3.union(v3.UDim2, v3.table)), 
    anchorPoint = v3.optional(v3.Vector2), 
    value = v3.number, 
    min = v3.number, 
    max = v3.number, 
    disabled = v3.optional(v3.boolean), 
    stepInterval = v3.numberPositive, 
    onValueChanged = v3.callback, 
    layoutOrder = v3.optional(v3.integer)
});
v9.defaultProps = {
    disabled = false
};
v9.init = function(v10) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v10.textBoxRef = v2.createRef();
end;
v9.render = function(v11) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v5 (copy), v6 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    return v7(function(v12) --[[ Line: 42 ]]
        -- upvalues: v11 (copy), v8 (ref), v2 (ref), v5 (ref), v6 (ref), l_EventConnection_0 (ref), l_UserInputService_0 (ref)
        local v13 = v11.props.disabled and 2 or 1;
        local v14 = v8(v12.Theme.TextDefault.Transparency, v13);
        local v15 = v8(v12.Theme.Divider.Transparency, v13);
        local v16 = v8(v12.Theme.BackgroundUIContrast.Transparency, v13);
        return v2.createElement(v5.Label, {
            BackgroundTransparency = 1, 
            Image = v6["component_assets/circle_16"], 
            ImageColor3 = v12.Theme.BackgroundUIContrast.Color, 
            ImageTransparency = v16, 
            Position = v11.props.position, 
            AnchorPoint = v11.props.anchorPoint, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.fromOffset(56, 36), 
            SliceCenter = Rect.new(8, 8, 8, 8), 
            LayoutOrder = v11.props.layoutOrder
        }, {
            Border = v2.createElement(v5.Label, {
                BackgroundTransparency = 1, 
                Image = v6["component_assets/circle_17_stroke_1"], 
                ImageColor3 = v12.Theme.Divider.Color, 
                ImageTransparency = v15, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.fromScale(1, 1), 
                SliceCenter = Rect.new(8, 8, 8, 8)
            }), 
            TextBox = v2.createElement("TextBox", {
                [v2.Ref] = v11.textBoxRef, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = v12.Font.Body.Font, 
                TextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize, 
                TextColor3 = v12.Theme.TextDefault.Color, 
                TextTransparency = v14, 
                Size = UDim2.fromScale(1, 1), 
                Text = tostring(v11.props.value), 
                TextScaled = true, 
                TextEditable = not v11.props.disabled, 
                ZIndex = 2, 
                [v2.Event.Focused] = v11.props.disabled and function(v17) --[[ Line: 86 ]]
                    v17:ReleaseFocus();
                end or nil, 
                [v2.Event.FocusLost] = function(v18, _) --[[ Line: 89 ]]
                    -- upvalues: v11 (ref)
                    local v20 = tonumber(v18.Text);
                    if v20 == nil then
                        v18.Text = tostring(v11.props.value);
                        return;
                    else
                        v20 = math.clamp(math.floor(v20 / v11.props.stepInterval + 0.5) * v11.props.stepInterval, v11.props.min, v11.props.max);
                        v11.props.onValueChanged(v20);
                        return;
                    end;
                end
            }, {
                TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MinTextSize = v12.Font.Body.RelativeMinSize * v12.Font.BaseSize, 
                    MaxTextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize
                })
            }), 
            UserInputConnection = not v11.props.disabled and v2.createElement(l_EventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = function(v21, _) --[[ Line: 113 ]] --[[ Name: callback ]]
                    -- upvalues: l_UserInputService_0 (ref), v11 (ref)
                    if v21.UserInputType ~= Enum.UserInputType.Keyboard then
                        return;
                    elseif l_UserInputService_0:GetFocusedTextBox() ~= v11.textBoxRef.current then
                        return;
                    else
                        local v23 = 0;
                        if v21.KeyCode == Enum.KeyCode.Up then
                            v23 = 1;
                        elseif v21.KeyCode == Enum.KeyCode.Down then
                            v23 = -1;
                        end;
                        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                            v23 = v23 * 10;
                        end;
                        if v23 ~= 0 then
                            local v24 = math.clamp(math.floor((v11.props.value + v11.props.stepInterval * v23) / v11.props.stepInterval + 0.5) * v11.props.stepInterval, v11.props.min, v11.props.max);
                            if v24 ~= v11.props.value then
                                v11.props.onValueChanged(v24);
                            end;
                        end;
                        return;
                    end;
                end
            })
        });
    end);
end;
v9.didMount = function(v25) --[[ Line: 154 ]] --[[ Name: didMount ]]
    pcall(function() --[[ Line: 157 ]]
        -- upvalues: v25 (copy)
        v25.textBoxRef.current.TextInputType = Enum.TextInputType.Number;
    end);
end;
return v9;