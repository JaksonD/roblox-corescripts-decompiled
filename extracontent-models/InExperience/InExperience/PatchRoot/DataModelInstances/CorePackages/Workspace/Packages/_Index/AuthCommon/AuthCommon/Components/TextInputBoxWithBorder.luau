local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(l_script_FirstAncestor_0.Components.PasswordBox);
local v5 = require(l_script_FirstAncestor_0.Components.GenericTextBox);
local v6 = require(l_script_FirstAncestor_0.Components.AuthStatefulRoundCornerBorder);
local l_GetFFlagEnableAuthStatefulTextInputUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAuthStatefulTextInputUpdates;
local v8 = game:DefineFastFlag("EnableTextInputBoxOverrideColor", false);
local v9 = v2.PureComponent:extend(script.Name);
v9.defaultProps = {
    text = "", 
    textInputType = Enum.TextInputType.NoSuggestions, 
    textInputHeight = 30, 
    textInputListPadding = 12, 
    borderState = v6.BorderState.Default
};
v9.render = function(v10) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (copy), l_withStyle_0 (copy), v8 (copy), v2 (copy), v6 (copy), v4 (copy), v5 (copy)
    local l_text_0 = v10.props.text;
    local l_textInputType_0 = v10.props.textInputType;
    local l_textInputHeight_0 = v10.props.textInputHeight;
    local v14 = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then v10.props.textInputListPadding else 12;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_borderState_0 = v10.props.borderState;
    local l_placeholderText_0 = v10.props.placeholderText;
    local l_onChangeTextCallback_0 = v10.props.onChangeTextCallback;
    local l_onFocused_0 = v10.props.onFocused;
    local l_onFocusLost_0 = v10.props.onFocusLost;
    local l_labelText_0 = v10.props.labelText;
    local l_errorText_0 = v10.props.errorText;
    local v23 = v10.props.textInputType == Enum.TextInputType.Password;
    return l_withStyle_0(function(v24) --[[ Line: 49 ]]
        -- upvalues: v8 (ref), v10 (copy), v2 (ref), l_layoutOrder_0 (copy), v14 (copy), l_labelText_0 (copy), v6 (ref), l_textInputHeight_0 (copy), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (ref), l_borderState_0 (copy), v23 (copy), v4 (ref), l_text_0 (copy), l_placeholderText_0 (copy), l_onChangeTextCallback_0 (copy), v5 (ref), l_textInputType_0 (copy), l_onFocused_0 (copy), l_onFocusLost_0 (copy), l_errorText_0 (copy)
        local l_Font_0 = v24.Font.Body.Font;
        local v26 = v24.Font.BaseSize * v24.Font.Body.RelativeSize;
        local l_Color_0 = v24.Theme.TextDefault.Color;
        local l_Transparency_0 = v24.Theme.TextDefault.Transparency;
        local l_Color_1 = v24.Theme.BackgroundUIContrast.Color;
        local l_Transparency_1 = v24.Theme.BackgroundUIContrast.Transparency;
        local l_Color_2 = v24.Theme.UIDefault.Color;
        local l_Color_3 = v24.Theme.TextEmphasis.Color;
        if v8 then
            if v10.props.placeholderTextColor then
                l_Color_2 = v10.props.placeholderTextColor;
            end;
            if v10.props.labelTextColor then
                l_Color_3 = v10.props.labelTextColor;
            end;
            if v10.props.textBarColor then
                l_Color_1 = v10.props.textBarColor;
            end;
        end;
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v14)
            }), 
            TextBoxLabel = l_labelText_0 and v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = l_labelText_0, 
                TextWrapped = true, 
                Font = v24.Font.CaptionHeader.Font, 
                TextSize = v24.Font.BaseSize * v24.Font.CaptionHeader.RelativeSize, 
                TextColor3 = l_Color_3, 
                TextTransparency = v24.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TextBox = v2.createElement(v6, {
                size = UDim2.new(1, 0, 0, l_textInputHeight_0), 
                layoutOrder = l_GetFFlagEnableAuthStatefulTextInputUpdates_0() and 2 or l_layoutOrder_0, 
                borderState = l_borderState_0
            }, {
                PasswordBox = v23 and v2.createElement(v4, {
                    LayoutOrder = not l_GetFFlagEnableAuthStatefulTextInputUpdates_0() and 2 or nil, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextSize = v26, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_text_0, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor3 = l_Color_2, 
                    ManualFocusRelease = false, 
                    CaptureFocusOnTapStart = true, 
                    onChangeText = l_onChangeTextCallback_0
                }), 
                GenericTextBox = not v23 and v2.createElement(v5, {
                    LayoutOrder = not l_GetFFlagEnableAuthStatefulTextInputUpdates_0() and 2 or nil, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = l_text_0, 
                    Font = l_Font_0, 
                    TextSize = v26, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ClearTextOnFocus = false, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextInputType = l_textInputType_0, 
                    onChangeText = l_onChangeTextCallback_0, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor = l_Color_2, 
                    PaddingX = 12, 
                    onFocused = l_onFocused_0, 
                    onFocusLost = l_onFocusLost_0, 
                    TextBoxRef = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0 then v10.props.textBoxRef else nil
                })
            }), 
            ErrorText = l_errorText_0 and v2.createElement("TextLabel", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Text = l_errorText_0, 
                TextSize = v24.Font.CaptionBody.RelativeSize * v24.Font.BaseSize, 
                Font = v24.Font.SubHeader1.Font, 
                TextColor3 = v24.Theme.Alert.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 0)
            })
        });
    end);
end;
return v9;