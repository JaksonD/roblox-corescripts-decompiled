local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.usePhoneVerificationUpsellProps);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v7 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v8 = require(l_script_FirstAncestor_0.Components.EntryView);
local v9 = require(l_script_FirstAncestor_0.Components.AddPhoneView);
local v10 = require(l_script_FirstAncestor_0.Components.VerifyPhoneView);
local v11 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local v15 = require(l_script_FirstAncestor_0.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess);
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixIosOtpAutofill);
local l_FFlagHomePhoneVerificationUpsellNewCopy_0 = require(l_Parent_0.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy;
local function v18() --[[ Line: 106 ]]

end;
local v20 = {
    onSuccess = v18, 
    onFailure = v18, 
    onCancelled = v18, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v18, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    isOTPInputTypeEnabled = false, 
    isPhoneNumberTextTypeEnabled = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v18, 
    showWebpage = function(_) --[[ Line: 124 ]] --[[ Name: showWebpage ]]

    end
};
return function(v21) --[[ Line: 127 ]] --[[ Name: UpsellContainer ]]
    -- upvalues: v6 (copy), v20 (copy), v2 (copy), v3 (copy), l_LoadingSpinner_0 (copy), v14 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), v13 (copy), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (copy), v10 (copy), v15 (copy), v16 (copy), v11 (copy)
    local v22 = v6(v20, v21);
    local v23 = v2(v22);
    local v24 = v3.createElement(l_LoadingSpinner_0, {
        size = UDim2.fromOffset(48, 48), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
    local l_createElement_0 = v3.createElement;
    local v26 = v14() and "Frame" or v3.Fragment;
    local v28 = if v14() then {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v4.Change.AbsoluteSize] = function(v27) --[[ Line: 144 ]]
            -- upvalues: v23 (copy)
            v23.setParentSize(v27.AbsoluteSize);
        end
    } else nil;
    local v29 = {};
    local v30 = false;
    if v23.phoneUpsellState == v7.Entry then
        v30 = v22.entryConfig and v3.createElement(v8, {
            screenSize = v23.screenSize, 
            onClose = v23.handleCloseClick, 
            titleKey = v22.entryConfig.titleKey, 
            descriptionKey = v22.entryConfig.descriptionKey, 
            buttonKey = v22.entryConfig.buttonKey, 
            onButtonClick = v23.proceedToAddPhone, 
            extraButtonKey = v22.entryConfig.extraButtonConfig.extraButtonKey, 
            onExtraButtonClick = v22.entryConfig.extraButtonConfig.onExtraButtonClick
        });
    end;
    v29.Entry = v30;
    v30 = false;
    if v23.phoneUpsellState == v7.AddPhone then
        v30 = v3.createElement(v9, {
            screenSize = v23.screenSize, 
            countryCode = v23.countryCode, 
            setCountryCode = v23.setCountryCode, 
            phoneNumber = v23.phoneNumber, 
            errorMessage = v23.addPhoneErrorMessage, 
            isDisabled = v23.isDisabled, 
            onPhoneNumberTextChange = v23.onPhoneNumberTextChange, 
            onSetPhoneNumber = v23.handleSetPhone, 
            onClose = v23.handleCloseClick, 
            onTermsOfUseClick = v23.navigateToSMSTerms, 
            onPrivacyPolicyClick = v23.navigateToPrivacy, 
            onPhoneInputFocus = v23.onPhoneInputFocus, 
            onCountryCodeSelectorClick = v23.onCountryCodeSelectorClick, 
            isKeyboardShowing = v23.isKeyboardShowing, 
            keyboardHeight = v23.onScreenKeyboardHeight, 
            usePhoneNumberTextType = v13() and v23.isPhoneNumberTextTypeEnabled, 
            titleKey = v22.addPhoneTitleKey, 
            descriptionKey = v22.addPhoneDescriptionKey, 
            buttonKey = v22.addPhoneButtonKey, 
            legalTextKey = v22.addPhoneLegalTextKey, 
            extraButtonKey = v22.extraButtonTextKey, 
            onExtraButtonClick = v22.onExtraButtonClick, 
            alwaysShowLegalText = v22.alwaysShowAddPhoneLegalText, 
            requireLegalTextCheckbox = v22.requireAddPhoneLegalTextCheckbox, 
            disableLegalText = v22.disableLegalText, 
            shouldShowVerificationText = if l_FFlagHomePhoneVerificationUpsellNewCopy_0 then v22.shouldShowVerificationText else nil
        });
    end;
    v29.AddPhone = v30;
    v30 = false;
    if v23.phoneUpsellState == v7.VerifyPhone then
        v30 = v3.createElement(v10, {
            screenSize = v23.screenSize, 
            phoneNumber = v23.phoneNumber, 
            prefix = v23.countryCode.prefix, 
            code = v23.code, 
            errorMessage = v23.verifyPhoneErrorMessage, 
            isDisabled = if v15() then v23.isDisabled else nil, 
            onCodeTextChange = v23.onCodeTextChange, 
            onResendPhoneCode = v23.handleResendCode, 
            onClose = v23.handleCloseClick, 
            returnToAddPhone = v23.returnToAddPhone, 
            onCodeInputFocus = v23.onCodeInputFocus, 
            isKeyboardShowing = v23.isKeyboardShowing, 
            keyboardHeight = v23.onScreenKeyboardHeight, 
            useOTPInputType = if v16() then v23.isOTPInputTypeEnabled else v22.isOTPInputTypeEnabled, 
            extraButtonKey = v22.verifyPhoneExtraButtonKey, 
            onExtraButtonClick = v22.onVerifyPhoneExtraButtonClick
        });
    end;
    v29.VerifyPhone = v30;
    v29.LoadingOverlay = v23.isLoading and v3.createElement(v11, {
        image = v24, 
        text = v23.verifyingKey
    });
    return l_createElement_0(v26, v28, v29);
end;