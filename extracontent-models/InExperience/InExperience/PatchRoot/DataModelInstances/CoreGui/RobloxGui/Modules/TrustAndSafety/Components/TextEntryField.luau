local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.ThemedTextLabel);
local v10 = require(l_Parent_0.Components.FillCircle);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v15 = v3.PureComponent:extend("TextEntryField");
v15.validateProps = v5.strictInterface({
    enabled = v5.boolean, 
    text = v5.string, 
    textChanged = v5.callback, 
    maxTextLength = v5.integer, 
    autoFocusOnEnabled = v5.boolean, 
    PlaceholderText = v5.string, 
    LayoutOrder = v5.optional(v5.integer), 
    Size = v5.UDim2, 
    Position = v5.optional(v5.UDim2), 
    textBoxRef = v5.optional(v5.table)
});
v15.init = function(v16) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v16.textBoxRef = v16.props.textBoxRef or v3.createRef();
    v16.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v15.calculateNeedsRescroll = function(v17, v18, v19) --[[ Line: 58 ]] --[[ Name: calculateNeedsRescroll ]]
    -- upvalues: l_TextService_0 (copy)
    v17:setState(function(v20, v21) --[[ Line: 59 ]]
        -- upvalues: v19 (copy), v18 (copy), l_TextService_0 (ref)
        if v20.cursorPosition == -1 then
            return nil;
        else
            local v22 = v21.text:sub(1, v20.cursorPosition - 1);
            local v23 = v19.RelativeSize * v18.Font.BaseSize;
            local v24 = Vector2.new(v21.textBoxWidth, 10000);
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v22, v23, v19.Font, v24);
            if l_l_TextService_0_TextSize_0.Y > v20.scrollingFrameHeight + v20.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v20.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v23 < v20.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v23
                };
            else
                return nil;
            end;
        end;
    end);
end;
v15.renderWithSelectionCursor = function(v26, v27) --[[ Line: 82 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v7 (copy), l_CursorKind_0 (copy), v9 (copy), v10 (copy)
    return l_withStyle_0(function(v28) --[[ Line: 83 ]]
        -- upvalues: l_TextService_0 (ref), v26 (copy), v3 (ref), l_ImageSetLabel_0 (ref), v7 (ref), v27 (copy), l_CursorKind_0 (ref), v9 (ref), v10 (ref)
        local l_TextDefault_0 = v28.Theme.TextDefault;
        local l_Body_0 = v28.Font.Body;
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v26.props.text, l_Body_0.RelativeSize * v28.Font.BaseSize, l_Body_0.Font, Vector2.new(v26.state.textBoxWidth, 10000));
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v7.Images.RoundedRect.Image, 
            ImageColor3 = v28.Theme.BackgroundMuted.Color, 
            ImageTransparency = v28.Theme.BackgroundMuted.Transparency, 
            Position = v26.props.Position, 
            ScaleType = v7.Images.RoundedRect.ScaleType, 
            Size = v26.props.Size, 
            SliceCenter = v7.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v26.props.LayoutOrder
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -24, 1, -14), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, -24, 0, l_l_TextService_0_TextSize_1.Y), 
                ScrollBarThickness = 8, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                CanvasPosition = Vector2.new(0, v26.state.canvasPosition), 
                Selectable = false, 
                [v3.Change.CanvasPosition] = function(v32) --[[ Line: 117 ]]
                    -- upvalues: v26 (ref)
                    v26:setState({
                        canvasPosition = v32.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v33) --[[ Line: 123 ]]
                    -- upvalues: v26 (ref), v28 (copy), l_Body_0 (copy)
                    v26:setState({
                        scrollingFrameHeight = v33.AbsoluteSize.Y
                    }, function() --[[ Line: 124 ]]
                        -- upvalues: v26 (ref), v28 (ref), l_Body_0 (ref)
                        v26:calculateNeedsRescroll(v28, l_Body_0);
                    end);
                end
            }, {
                TextBox = v3.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v26.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v26.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v28.Font.BaseSize, 
                    TextWrapped = true, 
                    MultiLine = true, 
                    SelectionImageObject = v27(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v26.textBoxRef, 
                    [v3.Change.Text] = function(v34) --[[ Line: 149 ]]
                        -- upvalues: v26 (ref), v28 (copy), l_Body_0 (copy)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 150 ]]
                            -- upvalues: v34 (copy)
                            return utf8.len(utf8.nfcnormalize(v34.Text));
                        end);
                        if not l_status_0 or v26.props.maxTextLength < l_result_0 then
                            v34.Text = v26.props.text;
                            return;
                        else
                            v26.props.textChanged(v34.Text);
                            v26:setState({
                                cursorPosition = v34.CursorPosition
                            }, function() --[[ Line: 159 ]]
                                -- upvalues: v26 (ref), v28 (ref), l_Body_0 (ref)
                                v26:calculateNeedsRescroll(v28, l_Body_0);
                            end);
                            return;
                        end;
                    end, 
                    [v3.Change.AbsoluteSize] = function(v37) --[[ Line: 164 ]]
                        -- upvalues: v26 (ref), v28 (copy), l_Body_0 (copy)
                        v26:setState({
                            textBoxWidth = v37.AbsoluteSize.X
                        }, function() --[[ Line: 165 ]]
                            -- upvalues: v26 (ref), v28 (ref), l_Body_0 (ref)
                            v26:calculateNeedsRescroll(v28, l_Body_0);
                        end);
                    end, 
                    [v3.Change.CursorPosition] = function(v38) --[[ Line: 170 ]]
                        -- upvalues: v26 (ref), v28 (copy), l_Body_0 (copy)
                        v26:setState({
                            cursorPosition = v38.CursorPosition
                        }, function() --[[ Line: 171 ]]
                            -- upvalues: v26 (ref), v28 (ref), l_Body_0 (ref)
                            v26:calculateNeedsRescroll(v28, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = v3.createElement(v9, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v26.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v26.props.text == ""
                    })
                })
            }), 
            TextAmmountIndicator = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -10, 1, -16), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, 20, 0, 20), 
                ZIndex = 1
            }, {
                v3.createElement(v10, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    fillFraction = utf8.len(utf8.nfcnormalize(v26.props.text)) / (v26.props.maxTextLength - 10), 
                    largerCircleFraction = (v26.props.maxTextLength - 20) / v26.props.maxTextLength, 
                    popCircleFraction = 1, 
                    shakeCircleFraction = v26.props.maxTextLength / (v26.props.maxTextLength - 10), 
                    BackgroundColor = v28.Theme.BackgroundMuted.Color
                })
            })
        });
    end);
end;
v15.render = function(v39) --[[ Line: 214 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v40) --[[ Line: 215 ]]
        -- upvalues: v39 (copy)
        return v39:renderWithSelectionCursor(v40);
    end);
end;
v15.didUpdate = function(v41, v42, _) --[[ Line: 220 ]] --[[ Name: didUpdate ]]
    if not v41.props.enabled and v42.enabled then
        if v41.textBoxRef.current and v41.textBoxRef.current:IsFocused() then
            v41.textBoxRef.current:ReleaseFocus();
            return;
        end;
    elseif v41.props.enabled and not v42.enabled and v41.props.autoFocusOnEnabled and v41.textBoxRef.current then
        v41.textBoxRef.current:CaptureFocus();
    end;
end;
return v3.forwardRef(function(v44, v45) --[[ Line: 233 ]]
    -- upvalues: v3 (copy), v15 (copy), v2 (copy)
    return v3.createElement(v15, v2.Dictionary.join(v44, {
        textBoxRef = v45
    }));
end);