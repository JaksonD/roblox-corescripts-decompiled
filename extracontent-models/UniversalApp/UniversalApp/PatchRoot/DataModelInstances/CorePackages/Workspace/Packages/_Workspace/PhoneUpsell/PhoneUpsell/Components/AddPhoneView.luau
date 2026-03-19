local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local l_withStyle_0 = v3.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v3.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local v11 = require(l_Parent_0.AuthCommon);
local l_TextBoxStateWrapper_0 = v11.Components.TextBoxStateWrapper;
local l_PhoneNumberTextBox_0 = v11.Components.PhoneNumberTextBox;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local v15 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_FFlagHomePhoneVerificationUpsellNewCopy_0 = require(l_Parent_0.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy;
local v17 = {
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    buttonKey = "Feature.VerificationUpsell.Action.Continue", 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA", 
    shouldShowVerificationText = not l_FFlagHomePhoneVerificationUpsellNewCopy_0 and nil
};
local function v24(v18, v19, v20, v21, v22) --[[ Line: 80 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v23 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v19, 
                text = v18, 
                isDisabled = v20
            }
        }
    };
    if v21 and v21 ~= "" then
        table.insert(v23, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v22, 
                text = v21, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v23
    };
end;
return function(v25) --[[ Line: 116 ]] --[[ Name: AddPhoneView ]]
    -- upvalues: v15 (copy), v17 (copy), v2 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_PartialPageModal_0 (copy), v24 (copy), l_TextBoxStateWrapper_0 (copy), l_PhoneNumberTextBox_0 (copy), l_Text_0 (copy), l_Checkbox_0 (copy), l_LinkButton_0 (copy)
    local v26 = v15(v17, v25);
    local function v27() --[[ Line: 119 ]] --[[ Name: noOp ]]

    end;
    local v28, v29 = v2.useState(false);
    local v30 = l_getPartialPageModalMiddleContentWidth_0(v26.screenSize.X);
    local v31 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v26.titleKey, 
        descriptionKey = v26.descriptionKey, 
        buttonKey = v26.buttonKey, 
        legalTextKey = v26.legalTextKey, 
        verificationKey = l_FFlagHomePhoneVerificationUpsellNewCopy_0 and "Feature.VerificationUpsell.Description.AddPhoneBody" or nil
    };
    if v26.extraButtonKey and v26.extraButtonKey ~= "" then
        v31.extraButtonKey = v26.extraButtonKey;
    end;
    return l_withStyle_0(function(v32) --[[ Line: 143 ]]
        -- upvalues: l_withLocalization_0 (ref), v31 (copy), v26 (copy), v28 (copy), v2 (ref), l_PartialPageModal_0 (ref), v24 (ref), v30 (copy), l_TextBoxStateWrapper_0 (ref), l_PhoneNumberTextBox_0 (ref), v27 (copy), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (ref), l_Text_0 (ref), l_Checkbox_0 (ref), v29 (copy), l_LinkButton_0 (ref)
        return l_withLocalization_0(v31)(function(v33) --[[ Line: 144 ]]
            -- upvalues: v32 (copy), v26 (ref), v28 (ref), v2 (ref), l_PartialPageModal_0 (ref), v24 (ref), v30 (ref), l_TextBoxStateWrapper_0 (ref), l_PhoneNumberTextBox_0 (ref), v27 (ref), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (ref), l_Text_0 (ref), l_Checkbox_0 (ref), v29 (ref), l_LinkButton_0 (ref)
            local l_BaseSize_0 = v32.Font.BaseSize;
            local l_RelativeSize_0 = v32.Font.Body.RelativeSize;
            local l_RelativeSize_1 = v32.Font.CaptionHeader.RelativeSize;
            local v37 = v26.isDisabled or v26.requireLegalTextCheckbox and not v28;
            local l_createElement_0 = v2.createElement;
            local l_l_PartialPageModal_0_0 = l_PartialPageModal_0;
            local v40 = {
                title = v33.titleKey, 
                screenSize = v26.screenSize, 
                buttonStackProps = v24(v33.buttonKey, v26.onSetPhoneNumber, v37, v33.extraButtonKey, v26.onExtraButtonClick), 
                onCloseClicked = v26.onClose, 
                position = v26.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v26.keyboardHeight) or nil, 
                anchorPoint = v26.isKeyboardShowing and Vector2.new(0.5, 1) or nil
            };
            local v41 = {};
            local l_createElement_1 = v2.createElement;
            local v43 = "Frame";
            local v44 = {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            };
            local v45 = {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                BodyText = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Text = v33.descriptionKey, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v32.Theme.TextDefault.Color, 
                    TextTransparency = v32.Theme.TextDefault.Transparency, 
                    Font = v32.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v30, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                PhoneInput = v2.createElement(l_TextBoxStateWrapper_0, {
                    ChildClass = l_PhoneNumberTextBox_0, 
                    ErrorState = v26.errorMessage ~= "", 
                    ErrorText = v26.errorMessage, 
                    Size = UDim2.new(1, 0, 0, 36), 
                    LayoutOrder = 1, 
                    ChildProps = {
                        CountryCode = v26.countryCode, 
                        SetCountryCode = v26.setCountryCode, 
                        Text = v26.phoneNumber, 
                        PlaceholderText = v33.phoneNumberKey, 
                        Font = v32.Font.Body.Font, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Color = v32.Theme.BackgroundUIContrast.Color, 
                        Transparency = v32.Theme.BackgroundUIContrast.Transparency, 
                        TextColor = v32.Theme.TextDefault.Color, 
                        PlaceholderColor = v32.Theme.UIDefault.Color, 
                        TextTransparency = v32.Theme.TextDefault.Transparency, 
                        ClearTextOnFocus = false, 
                        PaddingX = 12, 
                        TextInputTypeOverride = v26.usePhoneNumberTextType and Enum.TextInputType.Phone or Enum.TextInputType.Number, 
                        onChangeText = v26.onPhoneNumberTextChange, 
                        onFocused = v26.onPhoneInputFocus, 
                        onFocusLost = v27, 
                        phoneCountryCodeSelectorCallback = v26.onCountryCodeSelectorClick
                    }
                }), 
                PrivacyText = v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v33.phonePrivacyDisclaimerKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v32.Theme.TextEmphasis.Color, 
                    TextTransparency = v32.Theme.TextEmphasis.Transparency, 
                    Font = v32.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v30, 0, 24)
                }), 
                VerificationText = if l_FFlagHomePhoneVerificationUpsellNewCopy_0 and v26.shouldShowVerificationText then v2.createElement(l_Text_0, {
                    tag = "auto-y size-full-0 text-wrap text-body-small text-align-x-left", 
                    Text = v33.verificationKey, 
                    LayoutOrder = 2
                }) else nil, 
                LegalTextContainer = not v26.disableLegalText and if v26.requireLegalTextCheckbox then v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v30, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 6)
                    }), 
                    LegalCheckbox = v2.createElement(l_Checkbox_0, {
                        onActivated = v29, 
                        isSelected = v28, 
                        text = ""
                    }), 
                    LegalText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v33.legalTextKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v32.Theme.TextDefault.Color, 
                        TextTransparency = v32.Theme.TextDefault.Transparency, 
                        Font = v32.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, -32, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }) else if v26.alwaysShowLegalText or v26.countryCode.prefix == "1" then v2.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v33.legalTextKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v32.Theme.TextDefault.Color, 
                    TextTransparency = v32.Theme.TextDefault.Transparency, 
                    Font = v32.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v30, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }) else nil
            };
            local v46 = false;
            if v26.countryCode.prefix == "1" then
                v46 = not v26.disableLegalText and v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TermsOfUseButton = v2.createElement(l_LinkButton_0, {
                        text = v33.termsOfUseKey, 
                        onActivated = v26.onTermsOfUseClick, 
                        layoutOrder = 5, 
                        fontStyle = "CaptionBody", 
                        size = UDim2.fromScale(0.2, 0.2)
                    }), 
                    TextButtonDivider = v2.createElement("TextLabel", {
                        LayoutOrder = 6, 
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v32.Theme.TextDefault.Color, 
                        TextTransparency = v32.Theme.TextDefault.Transparency, 
                        Font = v32.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    PrivacyPolicyButton = v2.createElement(l_LinkButton_0, {
                        text = v33.privacyPolicyKey, 
                        onActivated = v26.onPrivacyPolicyClick, 
                        layoutOrder = 7, 
                        fontStyle = "CaptionBody"
                    })
                });
            end;
            v45.LegalButtonsContainer = v46;
            v41.Middle = l_createElement_1(v43, v44, v45);
            return l_createElement_0(l_l_PartialPageModal_0_0, v40, v41);
        end);
    end);
end;