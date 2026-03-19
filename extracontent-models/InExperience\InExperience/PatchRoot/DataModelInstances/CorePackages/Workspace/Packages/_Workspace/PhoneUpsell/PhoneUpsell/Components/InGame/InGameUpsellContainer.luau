local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.usePhoneVerificationUpsellProps);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v7 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v8 = require(l_script_FirstAncestor_0.Components.InGame.InGameEntryView);
local v9 = require(l_script_FirstAncestor_0.Components.InGame.InGameAddPhoneView);
local v10 = require(l_script_FirstAncestor_0.Components.InGame.InGameVerifyPhoneView);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell);
local v12 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixIosOtpAutofill);
local function v14() --[[ Line: 85 ]]

end;
local v16 = {
    onSuccess = v14, 
    onFailure = v14, 
    onCancelled = v14, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v14, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    isOTPInputTypeEnabled = false, 
    isPhoneNumberTextTypeEnabled = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v14, 
    showWebpage = function(_) --[[ Line: 103 ]] --[[ Name: showWebpage ]]

    end
};
return function(v17) --[[ Line: 106 ]] --[[ Name: InGameUpsellContainer ]]
    -- upvalues: v6 (copy), v16 (copy), v2 (copy), v3 (copy), v12 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), v11 (copy), v10 (copy), v13 (copy)
    local v18 = v6(v16, v17);
    local v19 = v2(v18);
    local l_createElement_0 = v3.createElement;
    local v21 = v12() and "Frame" or v3.Fragment;
    local v23 = if v12() then {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v4.Change.AbsoluteSize] = function(v22) --[[ Line: 117 ]]
            -- upvalues: v19 (copy)
            v19.setParentSize(v22.AbsoluteSize);
        end
    } else nil;
    local v24 = {};
    local v25 = false;
    if v19.phoneUpsellState == v7.Entry then
        v25 = v18.entryConfig and v3.createElement(v8, {
            screenSize = v19.screenSize, 
            onClose = v19.handleCloseClick, 
            titleKey = v18.entryConfig.titleKey, 
            descriptionKey = v18.entryConfig.descriptionKey, 
            buttonKey = v18.entryConfig.buttonKey, 
            onButtonClick = v19.proceedToAddPhone, 
            extraButtonKey = v18.entryConfig.extraButtonConfig.extraButtonKey, 
            onExtraButtonClick = v18.closeUpsell, 
            countryCode = v19.countryCode, 
            onTermsOfUseClick = v19.navigateToSMSTerms, 
            onPrivacyPolicyClick = v19.navigateToPrivacy, 
            legalTextKey = v18.entryConfig.legalTextKey
        });
    end;
    v24.Entry = v25;
    v25 = false;
    if v19.phoneUpsellState == v7.AddPhone then
        v25 = v3.createElement(v9, {
            screenSize = v19.screenSize, 
            countryCode = v19.countryCode, 
            setCountryCode = v19.setCountryCode, 
            phoneNumber = v19.phoneNumber, 
            errorMessage = v19.addPhoneErrorMessage, 
            isDisabled = v19.isDisabled, 
            onPhoneNumberTextChange = v19.onPhoneNumberTextChange, 
            onSetPhoneNumber = v19.handleSetPhone, 
            onClose = v19.handleCloseClick, 
            onCountryCodeSelectorClick = v19.onCountryCodeSelectorClick, 
            isKeyboardShowing = v19.isKeyboardShowing, 
            keyboardHeight = v19.onScreenKeyboardHeight, 
            titleKey = v18.addPhoneTitleKey, 
            buttonKey = v18.addPhoneButtonKey, 
            extraButtonKey = "Feature.VerificationUpsell.Action.NotNow", 
            onExtraButtonClick = v18.closeUpsell, 
            usePhoneNumberTextType = v11() and v19.isPhoneNumberTextTypeEnabled, 
            descriptionKey = v18.addPhoneDescriptionKey, 
            legalTextKey = v18.addPhoneLegalTextKey, 
            onPhoneInputFocus = v19.onPhoneInputFocus
        });
    end;
    v24.AddPhone = v25;
    v25 = false;
    if v19.phoneUpsellState == v7.VerifyPhone then
        v25 = v3.createElement(v10, {
            screenSize = v19.screenSize, 
            phoneNumber = v19.phoneNumber, 
            prefix = v19.countryCode.prefix, 
            code = v19.code, 
            errorMessage = v19.verifyPhoneErrorMessage, 
            onCodeTextChange = v19.onCodeTextChange, 
            onResendPhoneCode = v19.handleResendCode, 
            onClose = v19.handleCloseClick, 
            returnToAddPhone = v19.returnToAddPhone, 
            onCodeInputFocus = v19.onCodeInputFocus, 
            isKeyboardShowing = v19.isKeyboardShowing, 
            keyboardHeight = v19.onScreenKeyboardHeight, 
            useOTPInputType = if v13() then v19.isOTPInputTypeEnabled else v18.isOTPInputTypeEnabled, 
            extraButtonKey = "Feature.VerificationUpsell.Action.EditPhoneNumber", 
            onExtraButtonClick = v19.returnToAddPhone
        });
    end;
    v24.VerifyPhone = v25;
    return l_createElement_0(v21, v23, v24);
end;