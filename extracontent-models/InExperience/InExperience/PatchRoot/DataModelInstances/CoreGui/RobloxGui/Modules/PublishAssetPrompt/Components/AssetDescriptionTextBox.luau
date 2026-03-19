local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v14 = l_Images_0["component_assets/circle_17_stroke_1"];
local v15 = Rect.new(8, 8, 8, 8);
local l_Parent_0 = script.Parent.Parent;
local v17 = require(l_Parent_0.GetFFlagValidateDescription);
local v18 = v2.PureComponent:extend("AssetDescriptionTextBox");
v18.validateProps = v4.strictInterface({
    Size = v4.optional(v4.UDim2), 
    Position = v4.optional(v4.UDim2), 
    onAssetDescriptionUpdated = v4.callback, 
    descriptionTextBoxRef = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    assetType = v4.optional(v4.enum(Enum.AssetType)), 
    defaultDescription = v4.optional(v4.string)
});
local function _(v19) --[[ Line: 53 ]] --[[ Name: getStringLength ]]
    local v20 = utf8.len(utf8.nfcnormalize(v19));
    if v20 == nil then
        return 0;
    else
        return v20;
    end;
end;
local function _(v22, v23) --[[ Line: 62 ]] --[[ Name: isDescriptionTooLong ]]
    local v24 = utf8.len(utf8.nfcnormalize(v22));
    return v23 < (v24 == nil and 0 or v24);
end;
v18.init = function(v26) --[[ Line: 66 ]] --[[ Name: init ]]
    v26:setState({
        lastValidDescription = "", 
        assetDescription = v26.props.defaultDescription or "", 
        descriptionLength = 0, 
        scrollingFrameHeight = 100, 
        canvasHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0, 
        textBoxWidth = 100, 
        isDescriptionValid = true
    });
    v26.wasInitiallyFocused = false;
    v26.tryFocusTextBox = function() --[[ Line: 81 ]]
        -- upvalues: v26 (copy)
        if v26.wasInitiallyFocused then
            return;
        else
            local v27 = v26.props.descriptionTextBoxRef:getValue();
            if v27 and v27:IsDescendantOf(game) then
                v27:CaptureFocus();
                v26.wasInitiallyFocused = true;
            end;
            return;
        end;
    end;
end;
v18.calculateNeedsRescroll = function(v28, v29, v30) --[[ Line: 95 ]] --[[ Name: calculateNeedsRescroll ]]
    -- upvalues: l_TextService_0 (copy)
    if v28.state.cursorPosition == -1 then
        return;
    else
        local v31 = (v28.state.assetDescription or ""):sub(1, v28.state.cursorPosition - 1);
        local v32 = v30.RelativeSize * v29.Font.BaseSize;
        local v33 = Vector2.new(v28.state.textBoxWidth, 10000);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v31, v32, v30.Font, v33);
        if l_l_TextService_0_TextSize_0.Y > v28.state.scrollingFrameHeight + v28.state.canvasPosition then
            v28:setState({
                canvasPosition = l_l_TextService_0_TextSize_0.Y - v28.state.scrollingFrameHeight
            });
            return;
        else
            if l_l_TextService_0_TextSize_0.Y - v32 < v28.state.canvasPosition then
                v28:setState({
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v32
                });
            end;
            return;
        end;
    end;
end;
v18.onTextChanged = function(v35, v36, v37, v38) --[[ Line: 128 ]] --[[ Name: onTextChanged ]]
    -- upvalues: v17 (copy), l_TextService_0 (copy)
    local l_Text_0 = v36.Text;
    local v40 = not v17() or l_Text_0 ~= "";
    local l_lastValidDescription_0 = v35.state.lastValidDescription;
    local v42 = utf8.len(utf8.nfcnormalize(l_Text_0));
    if (v42 == nil and 0 or v42) > 1000 then
        l_Text_0 = l_lastValidDescription_0;
        v36.Text = l_Text_0;
    else
        l_lastValidDescription_0 = v36.Text;
    end;
    local v43 = utf8.len(utf8.nfcnormalize(l_Text_0));
    local v44 = v43 == nil and 0 or v43;
    local v45 = v38.RelativeSize * v37.Font.BaseSize;
    v43 = Vector2.new(v35.state.textBoxWidth, 10000);
    v42 = l_TextService_0:GetTextSize(l_Text_0, v45, v38.Font, v43);
    v35:setState({
        lastValidDescription = l_lastValidDescription_0, 
        assetDescription = l_Text_0, 
        descriptionLength = v44, 
        canvasHeight = math.max(100, v42.Y), 
        isDescriptionValid = v40
    });
    v35.props.onAssetDescriptionUpdated(l_Text_0, v40);
end;
v18.renderWithProviders = function(v46, v47, v48) --[[ Line: 161 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v17 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v14 (copy), v15 (copy), l_Focusable_0 (copy), v6 (copy), l_CursorKind_0 (copy)
    local l_Font_0 = v47.Font;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local l_Theme_0 = v47.Theme;
    local v52 = if v17() then not v46.state.isDescriptionValid else false;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v46.props.Size, 
        Position = v46.props.Position
    }, {
        TextboxContainer = v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v14, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, -15), 
            SliceCenter = v15
        }, {
            ScrollingFrame = v2.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                CanvasPosition = Vector2.new(0, v46.state.canvasPosition), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ScrollBarThickness = 12, 
                BorderSizePixel = 0, 
                [v2.Change.CanvasPosition] = function(v53) --[[ Line: 191 ]]
                    -- upvalues: v46 (copy)
                    v46:setState({
                        canvasPosition = v53.CanvasPosition.Y
                    });
                end, 
                [v2.Change.AbsoluteSize] = function(v54) --[[ Line: 197 ]]
                    -- upvalues: v46 (copy), v47 (copy), l_CaptionBody_0 (copy)
                    v46:setState({
                        scrollingFrameHeight = v54.AbsoluteSize.Y
                    });
                    v46:calculateNeedsRescroll(v47, l_CaptionBody_0);
                end
            }, {
                Textbox = v2.createElement(l_Focusable_0.TextBox, {
                    Text = v46.state.assetDescription, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = l_Font_0.BaseSize * l_CaptionBody_0.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                    PlaceholderText = v6:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"), 
                    Position = UDim2.fromOffset(6, 0), 
                    Size = UDim2.new(1, -24, 0, v46.state.canvasHeight), 
                    MultiLine = true, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    OverlayNativeInput = true, 
                    NextSelectionUp = v46.props.NextSelectionUp, 
                    [v2.Change.TextFits] = v46.onTextFitsChanged, 
                    SelectionImageObject = v48(l_CursorKind_0.InputFields), 
                    [v2.Ref] = v46.props.descriptionTextBoxRef, 
                    [v2.Event.AncestryChanged] = v46.tryFocusTextBox, 
                    [v2.Change.Text] = function(v55) --[[ Line: 230 ]]
                        -- upvalues: v46 (copy), v47 (copy), l_CaptionBody_0 (copy)
                        v46:onTextChanged(v55, v47, l_CaptionBody_0);
                    end, 
                    [v2.Change.AbsoluteSize] = function(v56) --[[ Line: 234 ]]
                        -- upvalues: v46 (copy), v47 (copy), l_CaptionBody_0 (copy)
                        v46:setState({
                            textBoxWidth = v56.AbsoluteSize.X
                        });
                        v46:calculateNeedsRescroll(v47, l_CaptionBody_0);
                    end, 
                    [v2.Change.CursorPosition] = function(v57) --[[ Line: 241 ]]
                        -- upvalues: v46 (copy), v47 (copy), l_CaptionBody_0 (copy)
                        v46:setState({
                            cursorPosition = v57.CursorPosition
                        });
                        v46:calculateNeedsRescroll(v47, l_CaptionBody_0);
                    end
                })
            })
        }), 
        LengthDisplay = if v46.state.descriptionLength / 1000 > 0.9 then v2.createElement("TextLabel", {
            Size = UDim2.new(v17() and 0.2 or 1, 0, 0, 15), 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.fromScale(1, 1), 
            Text = v46.state.descriptionLength .. "/" .. 1000, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            BackgroundTransparency = 1
        }) else nil, 
        WarningText = v17() and v52 and v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, -15), 
            BackgroundTransparency = 1, 
            Text = v6:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(0.8, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v18.render = function(v58) --[[ Line: 278 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v59) --[[ Line: 279 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v58 (copy)
        return l_withSelectionCursorProvider_0(function(v60) --[[ Line: 280 ]]
            -- upvalues: v58 (ref), v59 (copy)
            return v58:renderWithProviders(v59, v60);
        end);
    end);
end;
v18.didMount = function(v61) --[[ Line: 286 ]] --[[ Name: didMount ]]
    v61.tryFocusTextBox();
end;
return v3.connect(function(v62) --[[ Line: 290 ]] --[[ Name: mapStateToProps ]]
    return {
        assetType = v62.promptRequest.promptInfo.assetType
    };
end)(v18);