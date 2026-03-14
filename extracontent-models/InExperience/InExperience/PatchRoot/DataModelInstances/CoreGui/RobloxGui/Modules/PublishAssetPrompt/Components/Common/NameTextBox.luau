local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Focusable_0 = v3.Focusable;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local v10 = v1.PureComponent:extend("NameTextBox");
local v11 = game:DefineFastFlag("RemoveNameRegex", false);
v10.validateProps = v2.strictInterface({
    Size = v2.optional(v2.UDim2), 
    Position = v2.optional(v2.UDim2), 
    centerText = v2.optional(v2.boolean), 
    maxLength = v2.optional(v2.number), 
    onNameUpdated = v2.callback, 
    LayoutOrder = v2.optional(v2.number), 
    nameTextBoxRef = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    defaultName = v2.optional(v2.string), 
    invalidInputText = v2.optional(v2.string)
});
v10.defaultProps = {
    maxLength = 50, 
    centerText = true, 
    invalidInputText = v4:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName")
};
local function _(v12, v13) --[[ Line: 47 ]] --[[ Name: isNameTooLong ]]
    local v14 = utf8.len(utf8.nfcnormalize(v12));
    if v14 == nil then
        return true;
    else
        return v13 < v14;
    end;
end;
v10.init = function(v16) --[[ Line: 56 ]] --[[ Name: init ]]
    v16:setState({
        name = v16.props.defaultName or "", 
        lastValidName = "", 
        isNameValid = true
    });
    v16.wasInitiallyFocused = false;
    v16.tryFocusTextBox = function() --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        if v16.wasInitiallyFocused then
            return;
        else
            local v17 = v16.props.nameTextBoxRef and v16.props.nameTextBoxRef:getValue();
            if v17 and v17:IsDescendantOf(game) then
                v17:CaptureFocus();
                v16.wasInitiallyFocused = true;
            end;
            return;
        end;
    end;
    v16.onTextChanged = function(v18) --[[ Line: 77 ]]
        -- upvalues: v16 (copy)
        local l_Text_0 = v18.Text;
        local l_maxLength_0 = v16.props.maxLength;
        local v21 = utf8.len(utf8.nfcnormalize(l_Text_0));
        if v21 == nil or l_maxLength_0 < v21 then
            l_Text_0 = string.sub(l_Text_0, 1, utf8.offset(l_Text_0, l_maxLength_0 + 1) - 1);
            v18.Text = l_Text_0;
        end;
        local v22 = v16:checkIsNameValid(l_Text_0);
        local l_lastValidName_0 = v16.state.lastValidName;
        if v22 then
            l_lastValidName_0 = v18.Text;
        end;
        v16:setState({
            lastValidName = l_lastValidName_0, 
            isNameValid = v22, 
            name = l_Text_0
        });
        v16.props.onNameUpdated(l_Text_0, v22);
    end;
end;
v10.checkIsNameValid = function(_, v25) --[[ Line: 104 ]] --[[ Name: checkIsNameValid ]]
    -- upvalues: v11 (copy)
    if not v11 then
        if not string.match(v25, "[0-9a-zA-Z_'%s]+$") then
            return false;
        elseif string.sub(v25, 1, 1) == " " then
            return false;
        end;
    end;
    if string.match(v25, "^%s*$") then
        return false;
    else
        return true;
    end;
end;
v10.renderWithProviders = function(v26, v27, v28) --[[ Line: 124 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v1 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy)
    local l_Font_0 = v27.Font;
    local l_Theme_0 = v27.Theme;
    local l_Body_0 = l_Font_0.Body;
    local v32 = not v26.state.isNameValid;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v26.props.Size, 
        Position = v26.props.Position, 
        LayoutOrder = v26.props.LayoutOrder
    }, {
        TextBoxContainer = v1.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            LayoutOrder = 1, 
            Size = v26.props.Size
        }, {
            Textbox = v1.createElement(l_Focusable_0.TextBox, {
                Text = v26.state.name, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Body_0.Font, 
                TextSize = l_Font_0.BaseSize * l_Body_0.RelativeSize, 
                PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                PlaceholderText = v26.props.defaultName, 
                Position = UDim2.fromOffset(6, 0), 
                Size = UDim2.new(1, -12, 1, 0), 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = if not v26.props.centerText then Enum.TextYAlignment.Top else nil, 
                OverlayNativeInput = true, 
                [v1.Change.Text] = v26.onTextChanged, 
                SelectionImageObject = v28(l_CursorKind_0.InputFields), 
                NextSelectionDown = v26.props.NextSelectionDown, 
                [v1.Ref] = v26.props.nameTextBoxRef, 
                [v1.Event.AncestryChanged] = v26.tryFocusTextBox
            }, {
                UIPadding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 6), 
                    PaddingRight = UDim.new(0, 6), 
                    PaddingTop = if not v26.props.centerText then UDim.new(0, 6) else nil
                })
            }), 
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIStroke = v1.createElement("UIStroke", {
                Thickness = 0.5, 
                Transparency = l_Theme_0.Divider.Transparency, 
                Color = l_Theme_0.Divider.Color, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            })
        }), 
        WarningText = v32 and v1.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v26.props.invalidInputText, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v10.render = function(v33) --[[ Line: 200 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 201 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v33 (copy)
        return l_withSelectionCursorProvider_0(function(v35) --[[ Line: 202 ]]
            -- upvalues: v33 (ref), v34 (copy)
            return v33:renderWithProviders(v34, v35);
        end);
    end);
end;
v10.didMount = function(v36) --[[ Line: 208 ]] --[[ Name: didMount ]]
    v36.tryFocusTextBox();
end;
return v10;