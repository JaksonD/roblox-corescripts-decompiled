local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v13 = v3.PureComponent:extend("TextEntryField");
v13.validateProps = v5.strictInterface({
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
v13.init = function(v14) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v14.textBoxRef = v14.props.textBoxRef or v3.createRef();
    v14.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v13.calculateNeedsRescroll = function(v15, v16, v17) --[[ Line: 58 ]] --[[ Name: calculateNeedsRescroll ]]
    -- upvalues: l_TextService_0 (copy)
    v15:setState(function(v18, v19) --[[ Line: 60 ]]
        -- upvalues: v17 (copy), v16 (copy), l_TextService_0 (ref)
        if v18.cursorPosition == -1 then
            return nil;
        else
            local v20 = v19.text:sub(1, v18.cursorPosition - 1);
            local v21 = v17.RelativeSize * v16.Font.BaseSize;
            local v22 = Vector2.new(v19.textBoxWidth, 10000);
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v20, v21, v17.Font, v22);
            if l_l_TextService_0_TextSize_0.Y > v18.scrollingFrameHeight + v18.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v18.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v21 < v18.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v21
                };
            else
                return nil;
            end;
        end;
    end);
end;
v13.renderWithSelectionCursor = function(v24, v25) --[[ Line: 103 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v7 (copy), l_CursorKind_0 (copy), v8 (copy)
    return l_withStyle_0(function(v26) --[[ Line: 104 ]]
        -- upvalues: l_TextService_0 (ref), v24 (copy), v3 (ref), l_ImageSetLabel_0 (ref), v7 (ref), v25 (copy), l_CursorKind_0 (ref), v8 (ref)
        local l_TextDefault_0 = v26.Theme.TextDefault;
        local l_Body_0 = v26.Font.Body;
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v24.props.text, l_Body_0.RelativeSize * v26.Font.BaseSize, l_Body_0.Font, Vector2.new(v24.state.textBoxWidth, 10000));
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v7.Images.RoundedRect.Image, 
            ImageColor3 = v26.Theme.BackgroundMuted.Color, 
            ImageTransparency = v26.Theme.BackgroundMuted.Transparency, 
            Position = v24.props.Position, 
            ScaleType = v7.Images.RoundedRect.ScaleType, 
            Size = v24.props.Size, 
            SliceCenter = v7.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v24.props.LayoutOrder
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
                CanvasPosition = Vector2.new(0, v24.state.canvasPosition), 
                Selectable = false, 
                [v3.Change.CanvasPosition] = function(v30) --[[ Line: 138 ]]
                    -- upvalues: v24 (ref)
                    v24:setState({
                        canvasPosition = v30.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v31) --[[ Line: 144 ]]
                    -- upvalues: v24 (ref), v26 (copy), l_Body_0 (copy)
                    v24:setState({
                        scrollingFrameHeight = v31.AbsoluteSize.Y
                    }, function() --[[ Line: 145 ]]
                        -- upvalues: v24 (ref), v26 (ref), l_Body_0 (ref)
                        v24:calculateNeedsRescroll(v26, l_Body_0);
                    end);
                end
            }, {
                TextBox = v3.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v24.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v24.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v26.Font.BaseSize, 
                    TextWrapped = true, 
                    MultiLine = true, 
                    SelectionImageObject = v25(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v24.textBoxRef, 
                    [v3.Change.Text] = function(v32) --[[ Line: 170 ]]
                        -- upvalues: v24 (ref), v26 (copy), l_Body_0 (copy)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 171 ]]
                            -- upvalues: v32 (copy)
                            return utf8.len(utf8.nfcnormalize(v32.Text));
                        end);
                        if not l_status_0 or v24.props.maxTextLength < l_result_0 then
                            v32.Text = v24.props.text;
                            return;
                        else
                            v24.props.textChanged(v32.Text);
                            v24:setState({
                                cursorPosition = v32.CursorPosition
                            }, function() --[[ Line: 180 ]]
                                -- upvalues: v24 (ref), v26 (ref), l_Body_0 (ref)
                                v24:calculateNeedsRescroll(v26, l_Body_0);
                            end);
                            return;
                        end;
                    end, 
                    [v3.Change.AbsoluteSize] = function(v35) --[[ Line: 185 ]]
                        -- upvalues: v24 (ref), v26 (copy), l_Body_0 (copy)
                        v24:setState({
                            textBoxWidth = v35.AbsoluteSize.X
                        }, function() --[[ Line: 186 ]]
                            -- upvalues: v24 (ref), v26 (ref), l_Body_0 (ref)
                            v24:calculateNeedsRescroll(v26, l_Body_0);
                        end);
                    end, 
                    [v3.Change.CursorPosition] = function(v36) --[[ Line: 191 ]]
                        -- upvalues: v24 (ref), v26 (copy), l_Body_0 (copy)
                        v24:setState({
                            cursorPosition = v36.CursorPosition
                        }, function() --[[ Line: 192 ]]
                            -- upvalues: v24 (ref), v26 (ref), l_Body_0 (ref)
                            v24:calculateNeedsRescroll(v26, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = v3.createElement(v8, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v24.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v24.props.text == ""
                    })
                })
            })
        });
    end);
end;
v13.render = function(v37) --[[ Line: 216 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v38) --[[ Line: 217 ]]
        -- upvalues: v37 (copy)
        return v37:renderWithSelectionCursor(v38);
    end);
end;
v13.didUpdate = function(v39, v40) --[[ Line: 222 ]] --[[ Name: didUpdate ]]
    if not v39.props.enabled and v40.enabled then
        if v39.textBoxRef.current and v39.textBoxRef.current:IsFocused() then
            v39.textBoxRef.current:ReleaseFocus();
            return;
        end;
    elseif v39.props.enabled and not v40.enabled and v39.props.autoFocusOnEnabled and v39.textBoxRef.current then
        v39.textBoxRef.current:CaptureFocus();
    end;
end;
return v3.forwardRef(function(v41, v42) --[[ Line: 235 ]]
    -- upvalues: v3 (copy), v13 (copy), v2 (copy)
    return v3.createElement(v13, v2.Dictionary.join(v41, {
        textBoxRef = v42
    }));
end);