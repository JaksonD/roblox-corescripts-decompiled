local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_ImageSetLabel_0 = v1.UIBlox.Core.ImageSet.ImageSetLabel;
local v4 = game:DefineFastFlag("EnableCallbackInputBoxSelectionFixes", false);
local v5 = l_Roact_0.PureComponent:extend("CallbackInputBox");
v5.defaultProps = {
    initialInputText = "", 
    inputTextFont = Enum.Font.BuilderSans, 
    inputTextColor3 = Color3.new(1, 0, 1), 
    inputTextSize = 14, 
    inputTextYAlignment = Enum.TextYAlignment.Center, 
    inputTextXAlignment = Enum.TextXAlignment.Center, 
    inputTextTransparency = 0, 
    placeholderTextTransparency = 0.6, 
    placeholderTextColor3 = Color3.new(1, 0, 0), 
    placeholderText = "Test placeholder text", 
    clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    clearIconColor3 = Color3.new(1, 1, 0), 
    clearIconTransparency = 0, 
    clearButtonSize = 24, 
    clipsDescendants = true, 
    manualFocusRelease = false, 
    captureFocusOnMount = false, 
    multiLine = false, 
    textWrapped = false, 
    showCancelIconOnLoad = false, 
    textInputType = Enum.TextInputType.Default, 
    returnKeyType = Enum.ReturnKeyType.Default, 
    inputBoxSelectionImageObject = nil, 
    clearButtonSelectionImageObject = nil, 
    clearButtonDisabled = nil, 
    textChangedCallback = nil, 
    focusChangedCallback = function() --[[ Line: 42 ]] --[[ Name: focusChangedCallback ]]

    end, 
    onSelectCallback = function() --[[ Line: 43 ]] --[[ Name: onSelectCallback ]]

    end, 
    returnPressedFromOnScreenKeyboardCallback = function() --[[ Line: 44 ]] --[[ Name: returnPressedFromOnScreenKeyboardCallback ]]

    end, 
    inputBoxRef = nil, 
    [l_Roact_0.Change.AbsoluteSize] = function() --[[ Line: 48 ]]

    end
};
v5.init = function(v6) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v6.clearRef = l_Roact_0.createRef();
    v6.inputBoxRef = v6.props.inputBoxRef or l_Roact_0.createRef();
    v6.inputText = v6.props.initialInputText;
    v6.textChangedEventUnlocked = false;
    v6.focusTextbox = function() --[[ Line: 62 ]]
        -- upvalues: v6 (copy)
        v6.props.onSelectCallback();
        if not v6.inputBoxRef.current:IsFocused() then
            v6.inputBoxRef.current:captureFocus();
        end;
    end;
end;
v5.render = function(v7) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), l_ImageSetLabel_0 (copy)
    local l_placeholderTextTransparency_0 = v7.props.placeholderTextTransparency;
    local l_inputTextTransparency_0 = v7.props.inputTextTransparency;
    local v10 = nil;
    v10 = if not v7.inputText or v7.inputText == "" then l_placeholderTextTransparency_0 else l_inputTextTransparency_0;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        inputBox = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            inputTextBox = l_Roact_0.createElement("TextBox", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -v7.props.clearButtonSize, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                TextColor3 = v7.props.inputTextColor3, 
                TextSize = v7.props.inputTextSize, 
                TextTransparency = v10, 
                Font = v7.props.inputTextFont, 
                PlaceholderText = v7.props.placeholderText, 
                PlaceholderColor3 = v7.props.placeholderTextColor3, 
                TextXAlignment = v7.props.inputTextXAlignment, 
                TextYAlignment = v7.props.inputTextYAlignment, 
                OverlayNativeInput = true, 
                ClearTextOnFocus = false, 
                ClipsDescendants = v7.props.clipsDescendants, 
                LayoutOrder = 1, 
                ManualFocusRelease = v7.props.manualFocusRelease, 
                MultiLine = v7.props.multiLine, 
                TextWrapped = v7.props.textWrapped, 
                TextInputType = v7.props.textInputType, 
                ReturnKeyType = v7.props.returnKeyType, 
                SelectionImageObject = if v4 then v7.props.inputBoxSelectionImageObject else nil, 
                [l_Roact_0.Event.ReturnPressedFromOnScreenKeyboard] = v7.props.returnPressedFromOnScreenKeyboardCallback, 
                [l_Roact_0.Event.TouchTap] = v7.focusTextbox, 
                [l_Roact_0.Event.Focused] = function(v11) --[[ Line: 138 ]]
                    -- upvalues: v7 (copy), l_inputTextTransparency_0 (copy), l_placeholderTextTransparency_0 (copy)
                    if v7.inputBoxRef.current and v7.inputBoxRef.current.Text ~= "" then
                        if v7.clearRef.current and not v7.props.clearButtonDisabled then
                            v7.clearRef.current.Visible = true;
                        end;
                        v11.TextColor3 = v7.props.inputTextColor3;
                        v11.TextTransparency = l_inputTextTransparency_0;
                    else
                        v11.TextColor3 = v7.props.placeholderTextColor3;
                        v11.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v7.props.focusChangedCallback(true);
                end, 
                [l_Roact_0.Event.FocusLost] = function(v12, v13) --[[ Line: 154 ]]
                    -- upvalues: v7 (copy), l_placeholderTextTransparency_0 (copy)
                    if v7.inputBoxRef.current and v7.inputBoxRef.current.Text == "" then
                        v12.TextColor3 = v7.props.placeholderTextColor3;
                        v12.TextTransparency = l_placeholderTextTransparency_0;
                    end;
                    v7.props.focusChangedCallback(false, v13);
                end, 
                [l_Roact_0.Change.Text] = function(v14) --[[ Line: 163 ]]
                    -- upvalues: v7 (copy), l_inputTextTransparency_0 (copy), l_placeholderTextTransparency_0 (copy)
                    if v14.Text ~= "" or v7.textChangedEventUnlocked then
                        if v14.Text ~= "" then
                            if v7.clearRef.current and not v7.props.clearButtonDisabled then
                                v7.clearRef.current.Visible = true;
                            end;
                            v14.TextColor3 = v7.props.inputTextColor3;
                            v14.TextTransparency = l_inputTextTransparency_0;
                        else
                            if v7.clearRef.current then
                                v7.clearRef.current.Visible = false;
                            end;
                            v14.TextColor3 = v7.props.placeholderTextColor3;
                            v14.TextTransparency = l_placeholderTextTransparency_0;
                        end;
                        v7.inputText = v14.Text;
                        if v7.props.textChangedCallback then
                            v7.props.textChangedCallback(v14.Text);
                        end;
                    end;
                    v7.textChangedEventUnlocked = true;
                end, 
                [l_Roact_0.Ref] = v7.inputBoxRef, 
                [l_Roact_0.Change.AbsoluteSize] = v7.props[l_Roact_0.Change.AbsoluteSize]
            }), 
            Clear = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Size = if v4 then UDim2.new(0, v7.props.clearButtonSize, 0, v7.props.clearButtonSize) else UDim2.new(0, v7.props.clearButtonSize, 1, 0), 
                AutoButtonColor = false, 
                LayoutOrder = 2, 
                Visible = not v7.props.clearButtonDisabled, 
                SelectionImageObject = if v4 then v7.props.clearButtonSelectionImageObject else nil, 
                Selectable = if v4 then v7.clearRef.current and v7.clearRef.current.Visible == true else nil, 
                [l_Roact_0.Event.Activated] = function() --[[ Line: 210 ]]
                    -- upvalues: v7 (copy)
                    if v7.inputBoxRef.current then
                        v7.inputBoxRef.current.Text = "";
                    end;
                    v7.inputText = "";
                    if v7.clearRef.current then
                        v7.clearRef.current.Visible = false;
                    end;
                end
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = "Center", 
                    HorizontalAlignment = "Center"
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v7.props.clearButtonSize, 0, v7.props.clearButtonSize), 
                    Image = v7.props.clearIcon, 
                    ImageColor3 = v7.props.clearIconColor3, 
                    ImageTransparency = v7.props.clearIconTransparency, 
                    Visible = v7.props.showCancelIconOnLoad, 
                    [l_Roact_0.Ref] = v7.clearRef
                })
            })
        })
    });
end;
v5.didMount = function(v15) --[[ Line: 242 ]] --[[ Name: didMount ]]
    if v15.inputBoxRef.current then
        v15.inputBoxRef.current.Text = v15.inputText;
        if v15.props.captureFocusOnMount then
            spawn(function() --[[ Line: 247 ]]
                -- upvalues: v15 (copy)
                if v15.inputBoxRef and v15.inputBoxRef.current then
                    v15.inputBoxRef.current:captureFocus();
                end;
            end);
        end;
    end;
end;
return v5;