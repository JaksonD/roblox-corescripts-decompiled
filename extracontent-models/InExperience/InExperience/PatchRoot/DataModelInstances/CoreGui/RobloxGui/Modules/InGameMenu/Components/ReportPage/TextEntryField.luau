local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_Cryo_0 = v2.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Resources.Assets);
local v13 = require(script.Parent.FillCircle);
local v14 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v16 = l_Roact_0.PureComponent:extend("TextEntryField");
local v17 = l_Images_0["component_assets/circle_17"];
v16.validateProps = l_t_0.strictInterface({
    enabled = l_t_0.boolean, 
    text = l_t_0.string, 
    textChanged = l_t_0.callback, 
    maxTextLength = l_t_0.integer, 
    autoFocusOnEnabled = l_t_0.boolean, 
    PlaceholderText = l_t_0.string, 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    textBoxRef = l_t_0.optional(l_t_0.table)
});
v16.init = function(v18) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v18.textBoxRef = v18.props.textBoxRef or l_Roact_0.createRef();
    v18.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v16.calculateNeedsRescroll = function(v19, v20, v21) --[[ Line: 64 ]] --[[ Name: calculateNeedsRescroll ]]
    -- upvalues: l_TextService_0 (copy)
    v19:setState(function(v22, v23) --[[ Line: 65 ]]
        -- upvalues: v21 (copy), v20 (copy), l_TextService_0 (ref)
        if v22.cursorPosition == -1 then
            return nil;
        else
            local v24 = v23.text:sub(1, v22.cursorPosition - 1);
            local v25 = v21.RelativeSize * v20.Font.BaseSize;
            local v26 = Vector2.new(v23.textBoxWidth, 10000);
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v24, v25, v21.Font, v26);
            if l_l_TextService_0_TextSize_0.Y > v22.scrollingFrameHeight + v22.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v22.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v25 < v22.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v25
                };
            else
                return nil;
            end;
        end;
    end);
end;
v16.renderWithSelectionCursor = function(v28, v29) --[[ Line: 87 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), v17 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v12 (copy), l_CursorKind_0 (copy), v14 (copy), l_Images_0 (copy), v13 (copy)
    return l_withStyle_0(function(v30) --[[ Line: 88 ]]
        -- upvalues: l_TextService_0 (ref), v28 (copy), v17 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v12 (ref), v29 (copy), l_CursorKind_0 (ref), v14 (ref), l_Images_0 (ref), v13 (ref)
        local l_TextDefault_0 = v30.Theme.TextDefault;
        local l_Body_0 = v30.Font.Body;
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v28.props.text, l_Body_0.RelativeSize * v30.Font.BaseSize, l_Body_0.Font, Vector2.new(v28.state.textBoxWidth, 10000));
        local l_ImageRectSize_0 = v17.ImageRectSize;
        local l_ImageRectOffset_0 = v17.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v37 = l_X_0 / 2;
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v12.Images.RoundedRect.Image, 
            ImageColor3 = v30.Theme.BackgroundMuted.Color, 
            ImageTransparency = v30.Theme.BackgroundMuted.Transparency, 
            Position = v28.props.Position, 
            ScaleType = v12.Images.RoundedRect.ScaleType, 
            Size = v28.props.Size, 
            SliceCenter = v12.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v28.props.LayoutOrder
        }, {
            ScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -24, 1, -44), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, -24, 0, l_l_TextService_0_TextSize_1.Y), 
                ScrollBarThickness = 8, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                CanvasPosition = Vector2.new(0, v28.state.canvasPosition), 
                Selectable = false, 
                [l_Roact_0.Change.CanvasPosition] = function(v38) --[[ Line: 127 ]]
                    -- upvalues: v28 (ref)
                    v28:setState({
                        canvasPosition = v38.CanvasPosition.Y
                    });
                end, 
                [l_Roact_0.Change.AbsoluteSize] = function(v39) --[[ Line: 133 ]]
                    -- upvalues: v28 (ref), v30 (copy), l_Body_0 (copy)
                    v28:setState({
                        scrollingFrameHeight = v39.AbsoluteSize.Y
                    }, function() --[[ Line: 134 ]]
                        -- upvalues: v28 (ref), v30 (ref), l_Body_0 (ref)
                        v28:calculateNeedsRescroll(v30, l_Body_0);
                    end);
                end
            }, {
                TextBox = l_Roact_0.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v28.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v28.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v30.Font.BaseSize, 
                    TextWrapped = true, 
                    SelectionImageObject = v29(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Ref] = v28.textBoxRef, 
                    [l_Roact_0.Change.Text] = function(v40) --[[ Line: 159 ]]
                        -- upvalues: v28 (ref), v30 (copy), l_Body_0 (copy)
                        if utf8.len(utf8.nfcnormalize(v40.Text)) > v28.props.maxTextLength then
                            local v41 = utf8.offset(v40.Text, v28.props.maxTextLength + 1) - 1;
                            v40.Text = string.sub(v40.Text, 1, v41);
                            return;
                        else
                            v28.props.textChanged(v40.Text);
                            v28:setState({
                                cursorPosition = v40.CursorPosition
                            }, function() --[[ Line: 166 ]]
                                -- upvalues: v28 (ref), v30 (ref), l_Body_0 (ref)
                                v28:calculateNeedsRescroll(v30, l_Body_0);
                            end);
                            return;
                        end;
                    end, 
                    [l_Roact_0.Change.AbsoluteSize] = function(v42) --[[ Line: 171 ]]
                        -- upvalues: v28 (ref), v30 (copy), l_Body_0 (copy)
                        v28:setState({
                            textBoxWidth = v42.AbsoluteSize.X
                        }, function() --[[ Line: 172 ]]
                            -- upvalues: v28 (ref), v30 (ref), l_Body_0 (ref)
                            v28:calculateNeedsRescroll(v30, l_Body_0);
                        end);
                    end, 
                    [l_Roact_0.Change.CursorPosition] = function(v43) --[[ Line: 177 ]]
                        -- upvalues: v28 (ref), v30 (copy), l_Body_0 (copy)
                        v28:setState({
                            cursorPosition = v43.CursorPosition
                        }, function() --[[ Line: 178 ]]
                            -- upvalues: v28 (ref), v30 (ref), l_Body_0 (ref)
                            v28:calculateNeedsRescroll(v30, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = l_Roact_0.createElement(v14, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v28.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v28.props.text == ""
                    })
                })
            }), 
            BottomBar = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v17.Image, 
                ImageColor3 = v30.Theme.BackgroundMuted.Color, 
                ImageTransparency = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, 32), 
                SliceCenter = Rect.new(v37 - 1, 0, v37 + 1, 1), 
                SliceScale = 1 / l_Images_0.ImagesResolutionScale, 
                ImageRectSize = Vector2.new(l_X_0, v37), 
                ImageRectOffset = l_ImageRectOffset_0 + Vector2.new(0, v37)
            }, {
                TextAmmountIndicator = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, -10, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 20, 0, 20)
                }, {
                    l_Roact_0.createElement(v13, {
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        fillFraction = utf8.len(utf8.nfcnormalize(v28.props.text)) / (v28.props.maxTextLength - 10), 
                        largerCircleFraction = (v28.props.maxTextLength - 20) / v28.props.maxTextLength, 
                        popCircleFraction = 1, 
                        shakeCircleFraction = v28.props.maxTextLength / (v28.props.maxTextLength - 10), 
                        BackgroundColor = v30.Theme.BackgroundMuted.Color
                    })
                })
            })
        });
    end);
end;
v16.render = function(v44) --[[ Line: 236 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v45) --[[ Line: 237 ]]
        -- upvalues: v44 (copy)
        return v44:renderWithSelectionCursor(v45);
    end);
end;
v16.didUpdate = function(v46, v47, _) --[[ Line: 242 ]] --[[ Name: didUpdate ]]
    if not v46.props.enabled and v47.enabled then
        if v46.textBoxRef.current and v46.textBoxRef.current:IsFocused() then
            v46.textBoxRef.current:ReleaseFocus();
            return;
        end;
    elseif v46.props.enabled and not v47.enabled and v46.props.autoFocusOnEnabled and v46.textBoxRef.current then
        v46.textBoxRef.current:CaptureFocus();
    end;
end;
return l_Roact_0.forwardRef(function(v49, v50) --[[ Line: 255 ]]
    -- upvalues: l_Roact_0 (copy), v16 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v16, l_Cryo_0.Dictionary.join(v49, {
        textBoxRef = v50
    }));
end);