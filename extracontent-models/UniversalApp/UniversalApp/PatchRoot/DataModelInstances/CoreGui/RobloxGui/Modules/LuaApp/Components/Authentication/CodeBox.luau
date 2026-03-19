local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = game:GetService("CoreGui").RobloxGui.Modules.Common;
local v2 = require(l_Common_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v4 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_GenericTextBox_0 = v4.Components.GenericTextBox;
local l_AuthStatefulRoundCornerBorder_0 = v4.Components.AuthStatefulRoundCornerBorder;
local v7 = v2.PureComponent:extend("CodeBox");
v7.defaultProps = {
    TextInputType = Enum.TextInputType.Number
};
v7.init = function(v8) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v8:setState({
        isFocused = false
    });
    local v9, v10 = v2.createBinding("");
    v8.CurrentText = v9;
    v8.UpdateCurrentText = v10;
    v8.textBoxRef = v2.createRef();
    v8.onChangeText = function(v11) --[[ Line: 32 ]]
        -- upvalues: v8 (copy)
        local l_Text_0 = v11.Text;
        if v8.props.textFilter then
            l_Text_0 = l_Text_0:gsub(v8.props.textFilter, "");
        end;
        if v8.props.characterCount and #l_Text_0 > v8.props.characterCount then
            l_Text_0 = l_Text_0:sub(1, v8.props.characterCount);
        end;
        if l_Text_0 ~= v11.Text then
            v11.Text = l_Text_0;
            return;
        else
            if v8.props.onValueChanged then
                v8.props.onValueChanged(v11.Text);
            end;
            return;
        end;
    end;
    v8.onFocused = function(v13) --[[ Line: 50 ]]
        -- upvalues: v8 (copy)
        spawn(function() --[[ Line: 51 ]]
            -- upvalues: v8 (ref), v13 (copy)
            if v8.isMounted then
                v8:setState({
                    isFocused = v13:isFocused()
                });
            end;
        end);
        if v8.props.onFocused then
            v8.props.onFocused(v13);
        end;
    end;
    v8.onFocusLost = function(v14, v15, v16) --[[ Line: 65 ]]
        -- upvalues: v8 (copy)
        spawn(function() --[[ Line: 66 ]]
            -- upvalues: v8 (ref), v14 (copy)
            if v8.isMounted then
                v8:setState({
                    isFocused = v14:isFocused()
                });
            end;
        end);
        if v8.props.onFocusLost then
            v8.props.onFocusLost(v14, v15, v16);
        end;
    end;
end;
v7.didMount = function(v17) --[[ Line: 80 ]] --[[ Name: didMount ]]
    v17.isMounted = true;
    spawn(function() --[[ Line: 82 ]]
        -- upvalues: v17 (copy)
        if v17.isMounted and v17.props.shouldFocus and v17.textBoxRef.current then
            v17.textBoxRef.current:CaptureFocus();
        end;
    end);
end;
v7.willUnmount = function(v18) --[[ Line: 91 ]] --[[ Name: willUnmount ]]
    v18.isMounted = false;
end;
v7.didUpdate = function(v19, v20, _) --[[ Line: 95 ]] --[[ Name: didUpdate ]]
    if v19.textBoxRef.current and not v20.shouldFocus and v19.props.shouldFocus then
        v19.UpdateCurrentText("");
        v19.textBoxRef.current:CaptureFocus();
    end;
end;
v7.render = function(v22) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v2 (copy), l_GenericTextBox_0 (copy)
    return l_withStyle_0(function(v23) --[[ Line: 103 ]]
        -- upvalues: v22 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v2 (ref), l_GenericTextBox_0 (ref)
        local l_Font_0 = v23.Font.Body.Font;
        local l_Color_0 = v23.Theme.TextDefault.Color;
        local l_Transparency_0 = v23.Theme.TextDefault.Transparency;
        local l_Color_1 = v23.Theme.BackgroundUIContrast.Color;
        local l_Transparency_1 = v23.Theme.BackgroundUIContrast.Transparency;
        local l_Color_2 = v23.Theme.BackgroundUIDefault.Color;
        local l_PlaceholderText_0 = v22.props.PlaceholderText;
        local v31 = v22.props.errorState and l_AuthStatefulRoundCornerBorder_0.BorderState.Error or v22.state.isFocused and l_AuthStatefulRoundCornerBorder_0.BorderState.Focused or l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
        return v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
            size = UDim2.new(1, 0, 0, 36), 
            borderState = v31
        }, {
            v2.createElement(l_GenericTextBox_0, {
                Active = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Color = l_Color_1, 
                Font = l_Font_0, 
                Transparency = l_Transparency_1, 
                TextSize = 16, 
                TextColor = l_Color_0, 
                PlaceholderColor = l_Color_2, 
                TextTransparency = l_Transparency_0, 
                Text = v22.CurrentText, 
                TextEditable = v22.props.TextEditable, 
                PlaceholderText = l_PlaceholderText_0, 
                TextInputType = v22.props.TextInputType, 
                TextBoxRef = v22.textBoxRef, 
                ClearTextOnFocus = false, 
                onChangeText = v22.onChangeText, 
                onFocused = v22.onFocused, 
                onFocusLost = v22.onFocusLost, 
                ManualFocusRelease = v22.props.ManualFocusRelease
            })
        });
    end);
end;
return v7;