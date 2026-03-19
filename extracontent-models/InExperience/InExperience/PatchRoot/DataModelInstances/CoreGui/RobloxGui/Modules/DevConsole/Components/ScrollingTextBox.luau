local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = v4.Component:extend("ScrollingTextBox");
v5.init = function(v6, v7) --[[ Line: 12 ]] --[[ Name: init ]]
    -- upvalues: l_TextService_0 (copy), v4 (copy)
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("A", v7.TextSize, v7.Font, Vector2.new(0, 0));
    v6.adjustOffset = function() --[[ Line: 15 ]]
        -- upvalues: v6 (copy)
        if v6.clipBox.current and v6.textboxRef.current then
            local l_fontDims_0 = v6.state.fontDims;
            local v10 = v6.textboxRef.current.CursorPosition - 1;
            local v11 = v10 - math.ceil(v6.state.innerXOffset / l_fontDims_0.X);
            local v12 = math.floor(v6.clipBox.current.AbsoluteSize.X * 0.9 / l_fontDims_0.X);
            if v12 < v11 then
                local v13 = (v10 - v12) * l_fontDims_0.X;
                v6:setState({
                    innerXOffset = v13
                });
                return;
            elseif v11 < 0 then
                local v14 = v10 * l_fontDims_0.X;
                v6:setState({
                    innerXOffset = v14
                });
            end;
        end;
    end;
    v6.clipBox = v4.createRef();
    v6.textboxRef = v6.props.forwardRef or v4.createRef();
    v6.state = {
        fontDims = l_l_TextService_0_TextSize_0, 
        innerXOffset = 0
    };
end;
v5.didMount = function(v15) --[[ Line: 49 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v15.onFocusConnection then
        v15.onFocusConnection = l_UserInputService_0.InputBegan:Connect(function(v16) --[[ Line: 51 ]]
            -- upvalues: v15 (copy)
            if v15.textboxRef.current and v15.textboxRef.current:IsFocused() then
                if v16.KeyCode == Enum.KeyCode.Home then
                    v15.textboxRef.current.CursorPosition = 0;
                    return;
                elseif v16.KeyCode == Enum.KeyCode.End then
                    v15.textboxRef.current.CursorPosition = #v15.textboxRef.current.text + 1;
                    return;
                else
                    v15.adjustOffset();
                end;
            end;
        end);
    end;
end;
v5.willUnmount = function(v17) --[[ Line: 66 ]] --[[ Name: willUnmount ]]
    if v17.onFocusConnection then
        v17.onFocusConnection:Disconnect();
        v17.onFocusConnection = nil;
    end;
end;
v5.render = function(v18) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    local l_Position_0 = v18.props.Position;
    local l_Size_0 = v18.props.Size;
    local l_PlaceholderText_0 = v18.props.PlaceholderText;
    local l_TextColor3_0 = v18.props.TextColor3;
    local l_TextSize_0 = v18.props.TextSize;
    local l_Font_0 = v18.props.Font;
    local l_Text_0 = v18.props.Text;
    local l_ClearTextOnFocus_0 = v18.props.ClearTextOnFocus;
    local l_ShowNativeInput_0 = v18.props.ShowNativeInput;
    local l_TextBoxFocusLost_0 = v18.props.TextBoxFocusLost;
    local l_innerXOffset_0 = v18.state.innerXOffset;
    return v4.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v4.Ref] = v18.clipBox
    }, {
        TextBox = v4.createElement("TextBox", {
            Position = UDim2.new(0, -l_innerXOffset_0, 0, 0), 
            Size = UDim2.new(1, l_innerXOffset_0, 1, 0), 
            BackgroundTransparency = 1, 
            ShowNativeInput = l_ShowNativeInput_0, 
            ClearTextOnFocus = l_ClearTextOnFocus_0, 
            TextColor3 = l_TextColor3_0, 
            TextXAlignment = 0, 
            TextSize = l_TextSize_0, 
            Text = l_Text_0, 
            Font = l_Font_0, 
            PlaceholderText = l_PlaceholderText_0, 
            [v4.Ref] = v18.textboxRef, 
            [v4.Change.CursorPosition] = v18.adjustOffset, 
            [v4.Event.FocusLost] = l_TextBoxFocusLost_0
        })
    });
end;
return v4.forwardRef(function(v30, v31) --[[ Line: 119 ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy)
    return v4.createElement(v5, v3.Dictionary.join(v30, {
        forwardRef = v31
    }));
end);