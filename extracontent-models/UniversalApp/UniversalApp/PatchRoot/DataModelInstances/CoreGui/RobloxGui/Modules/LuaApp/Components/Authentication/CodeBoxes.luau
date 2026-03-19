local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local v5 = require(l_Common_0.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local v7 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v8 = require(l_Modules_0.LuaApp.Themes.Colors);
local v9 = v5.Component:extend("CodeBoxes");
v9.defaultProps = {
    characterCount = 6, 
    value = "", 
    Transparency = 0
};
v9.init = function(v10) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v10.state = {
        textCursorVisible = true, 
        textBoxOffset = 1000
    };
    v10.textBoxRef = v5.createRef();
    v10.onTextChanged = function(v11, v12) --[[ Line: 34 ]]
        -- upvalues: v10 (copy)
        local v13 = v11.Text:gsub("[^%d]", "");
        if v12 < #v11.Text then
            v13 = v13:sub(1, v12);
        end;
        if v11.Text ~= v13 then
            v11.Text = v13;
            return;
        else
            if v10.props.onValueChanged then
                v10.props.onValueChanged(v13);
            end;
            if #v11.Text == v12 and v10.props.onAllBoxesFilled then
                v10.props.onAllBoxesFilled();
            end;
            return;
        end;
    end;
    v10.onCodeBoxActivated = function(_) --[[ Line: 62 ]]
        -- upvalues: v10 (copy)
        local l_textBoxRef_0 = v10.textBoxRef;
        if not l_textBoxRef_0 then
            return;
        elseif not l_textBoxRef_0.current then
            return;
        else
            l_textBoxRef_0.current:CaptureFocus();
            return;
        end;
    end;
    v10.updateTextBoxOffset = function(v16) --[[ Line: 74 ]]
        -- upvalues: v10 (copy)
        if v10.mounted and v10.props.screenHeight then
            v10:setState({
                textBoxOffset = v10.props.screenHeight - v16.AbsolutePosition.Y + 100
            });
        end;
    end;
end;
v9.didMount = function(v17) --[[ Line: 83 ]] --[[ Name: didMount ]]
    v17.mounted = true;
    spawn(function() --[[ Line: 85 ]]
        -- upvalues: v17 (copy)
        if v17.mounted and v17.props.shouldFocus and v17.textBoxRef.current then
            v17.textBoxRef.current:CaptureFocus();
        end;
        while v17.mounted do
            v17:setState({
                textCursorVisible = not v17.state.textCursorVisible
            });
            wait(0.5);
        end;
    end);
end;
v9.willUnmount = function(v18) --[[ Line: 99 ]] --[[ Name: willUnmount ]]
    v18.mounted = false;
end;
v9.didUpdate = function(v19, v20, _) --[[ Line: 103 ]] --[[ Name: didUpdate ]]
    if v19.textBoxRef.current and not v20.shouldFocus and v19.props.shouldFocus then
        v19.textBoxRef.current:CaptureFocus();
    end;
end;
v9.render = function(v22) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), v7 (copy), l_AppFonts_0 (copy), v8 (copy)
    local l_characterCount_0 = v22.props.characterCount;
    local l_LayoutOrder_0 = v22.props.LayoutOrder;
    local l_value_0 = v22.props.value;
    local l_Transparency_0 = v22.props.Transparency;
    local l_textBoxRef_1 = v22.textBoxRef;
    local l_onInvisibleTextBoxAncestryChanged_0 = v22.props.onInvisibleTextBoxAncestryChanged;
    local l_onInvisibleTextBoxFocused_0 = v22.props.onInvisibleTextBoxFocused;
    local v30 = 0.3 + l_Transparency_0 * 0.7;
    local v31 = {
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 13)
        })
    };
    local v32 = UDim2.new(1 / l_characterCount_0, 13 / (l_characterCount_0 + 1) - 13, 1, 0);
    for v33 = 1, l_characterCount_0 do
        local v34 = l_value_0:sub(v33, v33) or "";
        if l_textBoxRef_1 and l_textBoxRef_1.current and v33 == #l_value_0 + 1 and l_UserInputService_0:GetFocusedTextBox() == l_textBoxRef_1.current then
            v34 = v22.state.textCursorVisible and "|" or "";
        end;
        v31[v33] = v5.createElement("Frame", {
            Size = v32, 
            BackgroundTransparency = 1, 
            LayoutOrder = v33
        }, {
            Character = v5.createElement(v7, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v34, 
                Font = l_AppFonts_0.default:getDefault(), 
                TextSize = 16, 
                themeSettings = {
                    Color = v8.Black, 
                    Transparency = v30, 
                    OnPressColor = v8.Black, 
                    OnPressTransparency = v30, 
                    Text = {
                        Color = v8.White, 
                        Transparency = l_Transparency_0
                    }, 
                    Border = {
                        Hidden = true, 
                        Transparency = 1
                    }
                }, 
                isDisabled = false, 
                isLoading = false, 
                AutoButtonColor = false, 
                onActivated = v22.onCodeBoxActivated
            })
        });
    end;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v5.Change.AbsolutePosition] = v22.updateTextBoxOffset
    }, {
        CodeCharacters = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 36), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, v31), 
        InvisibleTextBox = v5.createElement("TextBox", {
            Size = UDim2.new(0, 1, 0, 1), 
            Position = UDim2.new(0, 0, 0, v22.state.textBoxOffset), 
            BackgroundTransparency = 1, 
            TextTransparency = 1, 
            Text = l_value_0, 
            TextSize = 1, 
            OverlayNativeInput = true, 
            ManualFocusRelease = true, 
            ClearTextOnFocus = false, 
            TextInputType = Enum.TextInputType.Number, 
            [v5.Ref] = l_textBoxRef_1, 
            [v5.Change.Text] = function(v35) --[[ Line: 198 ]]
                -- upvalues: v22 (copy), l_characterCount_0 (copy)
                v22.onTextChanged(v35, l_characterCount_0);
            end, 
            [v5.Event.AncestryChanged] = l_onInvisibleTextBoxAncestryChanged_0, 
            [v5.Event.Focused] = l_onInvisibleTextBoxFocused_0
        })
    });
end;
return (v6.connect(function(v36, _) --[[ Line: 207 ]]
    return {
        screenHeight = v36.ScreenSize.Y
    };
end)(v9));