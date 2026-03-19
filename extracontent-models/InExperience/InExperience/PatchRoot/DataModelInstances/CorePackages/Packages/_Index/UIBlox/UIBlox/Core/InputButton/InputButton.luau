local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.RoactGamepad);
local v5 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v6 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_0.UIBlox.Core.Control.Controllable);
local v8 = require(l_Parent_0.UIBlox.Core.Control.Enum.ControlState);
local l_FitTextLabel_0 = require(l_Parent_0.FitFrame).FitTextLabel;
local l_FitFrameHorizontal_0 = require(l_Parent_0.FitFrame).FitFrameHorizontal;
local v11 = v1.PureComponent:extend("InputButton");
v11.validateProps = v2.strictInterface({
    text = v2.string, 
    size = v2.optional(v2.UDim2), 
    image = v2.table, 
    imageColor = v2.Color3, 
    fillImage = v2.optional(v2.table), 
    fillImageSize = v2.optional(v2.UDim2), 
    fillImageColor = v2.optional(v2.Color3), 
    selectedColor = v2.Color3, 
    textColor = v2.Color3, 
    transparency = v2.number, 
    onActivated = v2.callback, 
    isDisabled = v2.optional(v2.boolean), 
    layoutOrder = v2.optional(v2.number), 
    frameRef = v2.optional(v2.table), 
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    SelectionImageObject = v2.optional(v2.table), 
    isRoactGamepadEnabled = v2.optional(v2.boolean)
});
v11.defaultProps = {
    layoutOrder = 0, 
    isDisabled = false, 
    isRoactGamepadEnabled = true
};
v11.init = function(v12) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v1 (copy)
    v12.state = {
        outerImage = v12.props.image, 
        outerTransparency = 1, 
        outerImageColor = v12.props.imageColor, 
        innerImage = v12.props.image, 
        innerImageColor = v12.props.fillImageColor, 
        innerTransparency = 1
    };
    v12.changeSprite = function(v13) --[[ Line: 63 ]]
        -- upvalues: v8 (ref), v12 (copy)
        if v13 == v8.Hover then
            if not v12.props.isDisabled then
                v12:setState({
                    outerImageColor = v12.props.selectedColor
                });
                return;
            end;
        elseif v13 == v8.Default then
            v12:setState({
                outerImageColor = v12.props.imageColor
            });
        end;
    end;
    if not v12.props.size then
        local v14, v15 = v1.createBinding(UDim2.new(1, 0, 0, 26));
        v12.sizeBinding = v14;
        v12.updateSizeBinding = v15;
        v12.textAbsoluteSizeChanged = function(v16) --[[ Line: 81 ]]
            -- upvalues: v12 (copy)
            local v17 = 26;
            if v17 < v16.AbsoluteSize.Y then
                v17 = v16.AbsoluteSize.Y;
            end;
            v12.updateSizeBinding(UDim2.new(1, 0, 0, v17));
        end;
    end;
end;
v11.render = function(v18) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v1 (copy), l_FitFrameHorizontal_0 (copy), l_FitTextLabel_0 (copy), v4 (copy), v7 (copy), v6 (copy)
    return v5(function(v19) --[[ Line: 92 ]]
        -- upvalues: v18 (copy), v3 (ref), v1 (ref), l_FitFrameHorizontal_0 (ref), l_FitTextLabel_0 (ref), v4 (ref), v7 (ref), v6 (ref)
        local l_Font_0 = v19.Font;
        local v21 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local v22 = nil;
        local v23 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Text = v18.props.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v21, 
            Font = l_Font_0.Body.Font, 
            TextWrapped = true, 
            TextColor3 = v18.props.textColor, 
            TextTransparency = v18.props.transparency
        };
        local v24 = "Frame";
        local v25 = false;
        if v18.props.size then
            v22 = "TextButton";
            v23 = v3.Dictionary.join(v23, {
                Size = UDim2.new(1, -34, 0, 26), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                [v1.Event.Activated] = not v18.props.isDisabled and v18.props.onActivated or nil
            });
        else
            v25 = true;
            v24 = l_FitFrameHorizontal_0;
            v22 = l_FitTextLabel_0;
            v23 = v3.Dictionary.join(v23, {
                width = l_FitTextLabel_0.Width.FitToText, 
                onActivated = v18.props.onActivated, 
                [v1.Change.AbsoluteSize] = v18.textAbsoluteSizeChanged
            });
        end;
        local l_fillImage_0 = v18.props.fillImage;
        local l_createElement_0 = v1.createElement;
        local v28 = if v18.props.isRoactGamepadEnabled then v4.Focusable[v24] else v24;
        local v29 = {
            Size = not v25 and (v18.props.size or v18.sizeBinding) or nil, 
            height = v25 and UDim.new(0, 26) or nil, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v18.props.layoutOrder, 
            [v1.Ref] = v18.props.frameRef, 
            SelectionImageObject = v18.props.SelectionImageObject, 
            FillDirection = v25 and Enum.FillDirection.Horizontal or nil, 
            VerticalAlignment = v25 and Enum.VerticalAlignment.Center or nil, 
            contentPadding = v25 and UDim.new(0, 8) or nil, 
            NextSelectionLeft = v18.props.NextSelectionLeft, 
            NextSelectionRight = v18.props.NextSelectionRight, 
            NextSelectionUp = v18.props.NextSelectionUp, 
            NextSelectionDown = v18.props.NextSelectionDown, 
            inputBindings = if v18.props.isRoactGamepadEnabled then {
                Activated = v4.Input.onBegin(Enum.KeyCode.ButtonA, v18.props.onActivated)
            } else nil
        };
        local v32 = {
            HorizontalLayout = not v25 and v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) or nil, 
            Padding = not v25 and v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8)
            }) or nil, 
            InputButtonImage = v1.createElement(v7, {
                controlComponent = {
                    component = v6.Button, 
                    props = {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 26, 0, 26), 
                        Image = v18.props.image, 
                        ImageTransparency = v18.props.transparency, 
                        ScaleType = v18.props.buttonSliceType, 
                        SliceCenter = v18.props.buttonSliceCenter, 
                        ImageColor3 = v18.state.outerImageColor, 
                        [v1.Event.Activated] = v18.props.onActivated, 
                        LayoutOrder = 1
                    }, 
                    children = {
                        InputFillImage = l_fillImage_0 and v1.createElement(v6.Label, {
                            BackgroundTransparency = 1, 
                            Size = v18.props.fillImageSize, 
                            Image = l_fillImage_0, 
                            ImageTransparency = v18.props.transparency, 
                            ImageColor3 = v18.props.fillImageColor, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        })
                    }
                }, 
                isDisabled = v18.props.isDisabled, 
                onStateChanged = function(_, v31) --[[ Line: 196 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: v18 (ref)
                    v18.changeSprite(v31);
                end
            })
        };
        local v33 = false;
        if v18.props.text ~= "" then
            v33 = v1.createElement(v7, {
                controlComponent = {
                    component = v22, 
                    props = v23
                }, 
                isDisabled = v18.props.isDisabled, 
                onStateChanged = function(_, v35) --[[ Line: 207 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: v18 (ref)
                    v18.changeSprite(v35);
                end
            });
        end;
        v32.InputButtonText = v33;
        return l_createElement_0(v28, v29, v32);
    end);
end;
return v1.forwardRef(function(v36, v37) --[[ Line: 216 ]]
    -- upvalues: v1 (copy), v11 (copy), v3 (copy)
    return v1.createElement(v11, v3.Dictionary.join(v36, {
        frameRef = v37
    }));
end);