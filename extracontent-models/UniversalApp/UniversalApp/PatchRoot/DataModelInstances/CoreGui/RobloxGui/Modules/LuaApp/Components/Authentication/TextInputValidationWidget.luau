local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v11 = require(l_Modules_0.LuaApp.Components.Authentication.IssueTracker);
local l_PasswordBox_0 = v7.Components.PasswordBox;
local v13 = require(l_Modules_0.LuaApp.FitChildren);
local l_GenericTextBox_0 = v7.Components.GenericTextBox;
local l_AuthStatefulRoundCornerBorder_0 = v7.Components.AuthStatefulRoundCornerBorder;
local l_withStyle_0 = v6.Style.withStyle;
local l_InputValidity_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.InputValidity;
local v18 = v2.PureComponent:extend("TextInputValidationWidget");
v18.defaultProps = {
    captureFocusOnMount = false, 
    continueButtonActionInProgress = false
};
v18.init = function(v19) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: l_InputValidity_0 (copy), v2 (copy), l_Text_0 (copy), l_withStyle_0 (copy), v4 (copy), l_PasswordBox_0 (copy), l_GenericTextBox_0 (copy)
    v19.state = {
        inputTextToValidate = "", 
        validatedInputText = "", 
        inputValidity = l_InputValidity_0.Unvalidated, 
        inputTextBoxAlignment = Enum.TextXAlignment.Left, 
        textBoxFocused = false
    };
    v19.isMounted = false;
    v19.inputBoxRef = v2.createRef();
    v19.onInputTextChanged = function(v20) --[[ Line: 53 ]]
        -- upvalues: v19 (copy)
        v19.updateTextBoxAlignment(v20);
        v19.textInputChangedCallback(v20);
    end;
    v19.updateTextBoxAlignment = function(v21) --[[ Line: 58 ]]
        -- upvalues: v19 (copy), l_Text_0 (ref)
        local l_inputTextBoxAlignment_0 = v19.state.inputTextBoxAlignment;
        local v23 = l_Text_0.GetTextWidth(v21.Text, v21.Font, v21.TextSize);
        local v24 = nil;
        v24 = if v21.AbsoluteSize.X < v23 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left;
        spawn(function() --[[ Line: 69 ]]
            -- upvalues: v19 (ref), l_inputTextBoxAlignment_0 (copy), v24 (ref)
            if v19.isMounted and l_inputTextBoxAlignment_0 ~= v24 then
                v19:setState({
                    inputTextBoxAlignment = v24
                });
            end;
        end);
    end;
    v19.textInputChangedCallback = function(v25) --[[ Line: 78 ]]
        -- upvalues: v19 (copy)
        spawn(function() --[[ Line: 79 ]]
            -- upvalues: v19 (ref), v25 (copy)
            if v19.isMounted then
                v19:setState({
                    inputTextToValidate = v25.Text
                });
            end;
        end);
    end;
    v19.onTextValidated = function(v26, v27) --[[ Line: 88 ]]
        -- upvalues: v19 (copy)
        spawn(function() --[[ Line: 89 ]]
            -- upvalues: v19 (ref), v26 (copy), v27 (copy)
            if v19.isMounted and v19.state.inputTextToValidate == v26 then
                v19:setState({
                    validatedInputText = v26, 
                    inputValid = v27, 
                    inputValidity = v27
                });
            end;
        end);
    end;
    v19.continueButtonActivated = function(_) --[[ Line: 100 ]]
        -- upvalues: v19 (copy), l_InputValidity_0 (ref)
        if v19.state.inputValidity == l_InputValidity_0.Valid and v19.props.continueButtonActivated then
            local l_inputTextToValidate_0 = v19.state.inputTextToValidate;
            v19.props.continueButtonActivated(l_inputTextToValidate_0);
        end;
    end;
    v19.onTextInputBoxFocused = function() --[[ Line: 117 ]]
        -- upvalues: v19 (copy)
        spawn(function() --[[ Line: 118 ]]
            -- upvalues: v19 (ref)
            if v19.isMounted then
                v19:setState({
                    textBoxFocused = true
                });
                v19.props.textInputOnFocus();
            end;
        end);
    end;
    v19.onTextInputBoxFocusLost = function() --[[ Line: 128 ]]
        -- upvalues: v19 (copy)
        spawn(function() --[[ Line: 129 ]]
            -- upvalues: v19 (ref)
            if v19.isMounted then
                v19:setState({
                    textBoxFocused = false
                });
            end;
        end);
    end;
    v19.textInputBox = function(v30) --[[ Line: 138 ]]
        -- upvalues: l_withStyle_0 (ref), v19 (copy), v4 (ref), v2 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref)
        return l_withStyle_0(function(v31) --[[ Line: 139 ]]
            -- upvalues: v19 (ref), v30 (copy), v4 (ref), v2 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref)
            local l_inputTextBoxAlignment_1 = v19.state.inputTextBoxAlignment;
            local l_Font_0 = v31.Font.Body.Font;
            local v34 = v31.Font.BaseSize * v31.Font.Body.RelativeSize;
            local l_Color_0 = v31.Theme.TextDefault.Color;
            local l_Transparency_0 = v31.Theme.TextDefault.Transparency;
            local l_Color_1 = v31.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v31.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v31.Theme.UIDefault.Color;
            local l_layoutOrder_0 = v30.layoutOrder;
            local l_textInputType_0 = v19.props.textInputType;
            local l_returnKeyType_0 = v19.props.returnKeyType;
            return v4({
                passwordPlaceholderText = "Authentication.Login.Label.Password", 
                usernamePlaceholderText = "Authentication.Login.Label.Username"
            })(function(v43) --[[ Line: 158 ]]
                -- upvalues: l_textInputType_0 (copy), v2 (ref), l_PasswordBox_0 (ref), l_layoutOrder_0 (copy), l_Color_1 (copy), v34 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_returnKeyType_0 (copy), v19 (ref), l_Color_2 (copy), l_GenericTextBox_0 (ref), l_Font_0 (copy), l_inputTextBoxAlignment_1 (copy), l_Transparency_1 (copy)
                if l_textInputType_0 == Enum.TextInputType.Password then
                    return v2.createElement(l_PasswordBox_0, {
                        LayoutOrder = l_layoutOrder_0, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Color = l_Color_1, 
                        TextSize = v34, 
                        TextColor = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Text = "", 
                        ReturnKeyType = l_returnKeyType_0, 
                        TextBoxRef = v19.inputBoxRef, 
                        onChangeText = v19.onInputTextChanged, 
                        onReturnPressedFromOnScreenKeyboard = v19.continueButtonActivated, 
                        onFocused = v19.onTextInputBoxFocused, 
                        onFocusLost = v19.onTextInputBoxFocusLost, 
                        PlaceholderText = v43.passwordPlaceholderText, 
                        PlaceholderColor = l_Color_2
                    });
                else
                    return v2.createElement(l_GenericTextBox_0, {
                        LayoutOrder = l_layoutOrder_0, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        Text = "", 
                        Font = l_Font_0, 
                        TextSize = v34, 
                        onChangeText = v19.onInputTextChanged, 
                        TextXAlignment = l_inputTextBoxAlignment_1, 
                        TextColor = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        ClearTextOnFocus = false, 
                        Color = l_Color_1, 
                        Transparency = l_Transparency_1, 
                        TextInputType = l_textInputType_0, 
                        ReturnKeyType = l_returnKeyType_0, 
                        PaddingX = 8, 
                        TextBoxRef = v19.inputBoxRef, 
                        onReturnPressedFromOnScreenKeyboard = v19.continueButtonActivated, 
                        onFocused = v19.onTextInputBoxFocused, 
                        onFocusLost = v19.onTextInputBoxFocusLost, 
                        PlaceholderText = v43.usernamePlaceholderText, 
                        PlaceholderColor = l_Color_2
                    });
                end;
            end);
        end);
    end;
end;
v18.defaultProps = {
    widgetHeight = 0, 
    continueButtonKey = "Authentication.SignUp.Label.Continue"
};
v18.didMount = function(v44) --[[ Line: 213 ]] --[[ Name: didMount ]]
    v44.isMounted = true;
    local l_captureFocusOnMount_0 = v44.props.captureFocusOnMount;
    spawn(function() --[[ Line: 217 ]]
        -- upvalues: l_captureFocusOnMount_0 (copy), v44 (copy)
        if l_captureFocusOnMount_0 and v44.inputBoxRef.current then
            v44.inputBoxRef.current:captureFocus();
        end;
    end);
end;
v18.willUnmount = function(v46) --[[ Line: 224 ]] --[[ Name: willUnmount ]]
    v46.isMounted = false;
end;
v18.render = function(v47) --[[ Line: 228 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_withStyle_0 (copy), v4 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), l_InputValidity_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), v13 (copy), v11 (copy), v8 (copy)
    local l_widgetHeight_0 = v47.props.widgetHeight;
    local l_continueButtonKey_0 = v47.props.continueButtonKey;
    local l_continueButtonActionInProgress_0 = v47.props.continueButtonActionInProgress;
    local v51 = v47.props.formFactor == l_FormFactor_0.WIDE;
    local l_validator_0 = v47.props.validator;
    local l_validatorAdditionalProps_0 = v47.props.validatorAdditionalProps;
    local l_inputTextToValidate_1 = v47.state.inputTextToValidate;
    return l_withStyle_0(function(v55) --[[ Line: 239 ]]
        -- upvalues: v4 (ref), l_continueButtonKey_0 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v47 (copy), l_InputValidity_0 (ref), v51 (copy), v2 (ref), l_ImageSetLabel_0 (ref), l_widgetHeight_0 (copy), l_GetImageData_0 (ref), v13 (ref), v11 (ref), l_validator_0 (copy), l_validatorAdditionalProps_0 (copy), l_inputTextToValidate_1 (copy), v8 (ref), l_continueButtonActionInProgress_0 (copy)
        return v4({
            continue = l_continueButtonKey_0
        })(function(v56) --[[ Line: 242 ]]
            -- upvalues: v55 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v47 (ref), l_InputValidity_0 (ref), v51 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_widgetHeight_0 (ref), l_GetImageData_0 (ref), v13 (ref), v11 (ref), l_validator_0 (ref), l_validatorAdditionalProps_0 (ref), l_inputTextToValidate_1 (ref), v8 (ref), l_continueButtonActionInProgress_0 (ref)
            local l_Transparency_2 = v55.Theme.BackgroundDefault.Transparency;
            local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
            local v59 = v47.state.inputValidity == l_InputValidity_0.Valid;
            if v47.state.inputValidity == l_InputValidity_0.Invalid then
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
            elseif v47.state.textBoxFocused then
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
            end;
            if v51 then
                l_Transparency_2 = 1;
            end;
            return v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, l_widgetHeight_0), 
                BackgroundColor3 = v55.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_2, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                ClipsDescendants = true, 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = v55.Theme.BackgroundDefault.Color, 
                ImageTransparency = v55.Theme.BackgroundDefault.Transparency
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                UsernameInputField = v2.createElement(v13.FitFrame, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v13.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TextInputBorder = v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
                        size = UDim2.new(1, 0, 0, 36), 
                        layoutOrder = 1, 
                        borderState = l_Default_0
                    }, {
                        TextInput = v2.createElement(v47.textInputBox)
                    }), 
                    IssueTrackerWrapper = v2.createElement(v13.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v13.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 12), 
                            PaddingLeft = UDim.new(0, 12)
                        }), 
                        IssueTracker = v2.createElement(v11, {
                            height = l_widgetHeight_0 - 36 - 36 - 16 - 5, 
                            validator = l_validator_0, 
                            validatorAdditionalProps = l_validatorAdditionalProps_0, 
                            textToValidate = l_inputTextToValidate_1, 
                            onTextValidated = v47.onTextValidated
                        })
                    })
                }), 
                AuthBackAndNextButton = v2.createElement(v8, {
                    size = UDim2.new(1, 0, 0, 36), 
                    position = UDim2.new(0.5, 0, 1, 0), 
                    anchorPoint = Vector2.new(0.5, 1), 
                    backButtonIsDisabled = l_continueButtonActionInProgress_0, 
                    nextButtonText = v56.continue, 
                    nextButtonIsDisabled = not v59, 
                    nextButtonIsLoading = l_continueButtonActionInProgress_0, 
                    nextButtonOnActivated = v47.continueButtonActivated
                })
            });
        end);
    end);
end;
return v18;