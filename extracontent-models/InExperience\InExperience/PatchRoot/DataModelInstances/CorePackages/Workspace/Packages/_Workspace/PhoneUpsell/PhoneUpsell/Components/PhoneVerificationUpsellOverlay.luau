local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.LuauPolyfill);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v10 = require(l_script_FirstAncestor_0.DuplicateAnalytics.EventStreamConstants);
local v11 = require(l_script_FirstAncestor_0.DuplicateAnalytics.RoactAnalyticsAuthEvents);
local v12 = require(l_script_FirstAncestor_0.Utils.debounce);
local v13 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v14 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v15 = require(l_script_FirstAncestor_0.Components.EntryView);
local v16 = require(l_script_FirstAncestor_0.Components.AddPhoneView);
local v17 = require(l_script_FirstAncestor_0.Components.VerifyPhoneView);
local v18 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v19 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_LoadingSpinner_0 = v19.App.Loading.LoadingSpinner;
local v22 = require(l_script_FirstAncestor_0.Thunks.SetPhoneNumber);
local v23 = require(l_script_FirstAncestor_0.Thunks.VerifyPhoneCode);
local v24 = require(l_script_FirstAncestor_0.Thunks.ResendPhoneCode);
local l_SetIsPhoneVerified_0 = require(l_Parent_0.ContactImporter).Actions.SetIsPhoneVerified;
local v26 = require(l_script_FirstAncestor_0.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix);
local v27 = require(l_Parent_0.RoactAppExperiment);
local l_GetFStringAndroidPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringAndroidPhoneVerificationLayer;
local l_GetFStringIOSPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringIOSPhoneVerificationLayer;
local v30 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell);
local v31 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local l_IdentityProtocol_0 = require(l_Parent_0.IdentityProtocol).IdentityProtocol;
local v33 = {
    name = "United States", 
    code = "US", 
    prefix = "1", 
    localizedName = "United States"
};
local function v34() --[[ Line: 140 ]]

end;
local v36 = {
    onSuccess = v34, 
    onFailure = v34, 
    onCancelled = v34, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v34, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    isOTPInputTypeEnabled = false, 
    isPhoneNumberTextTypeEnabled = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v34, 
    showWebpage = function(_) --[[ Line: 158 ]] --[[ Name: showWebpage ]]

    end
};
local v152 = v5.connect(function(v37, _) --[[ Line: 707 ]]
    return {
        countryCodeList = v37.CountryCodeList
    };
end, function(v39) --[[ Line: 711 ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), l_SetIsPhoneVerified_0 (copy)
    return {
        setPhoneNumber = function(v40, v41, v42, v43) --[[ Line: 713 ]] --[[ Name: setPhoneNumber ]]
            -- upvalues: v39 (copy), v22 (ref)
            return v39(v22(v40, v41, v42, v43, nil));
        end, 
        verifyPhoneCode = function(v44, v45) --[[ Line: 716 ]] --[[ Name: verifyPhoneCode ]]
            -- upvalues: v39 (copy), v23 (ref)
            return v39(v23(v44, v45));
        end, 
        resendPhoneCode = function(v46) --[[ Line: 719 ]] --[[ Name: resendPhoneCode ]]
            -- upvalues: v39 (copy), v24 (ref)
            return v39(v24(v46));
        end, 
        setIsPhoneVerified = function(v47) --[[ Line: 722 ]] --[[ Name: setIsPhoneVerified ]]
            -- upvalues: v39 (copy), l_SetIsPhoneVerified_0 (ref)
            return v39(l_SetIsPhoneVerified_0(v47));
        end
    };
end)(function(v48) --[[ Line: 161 ]] --[[ Name: PhoneVerificationUpsellOverlay ]]
    -- upvalues: v13 (copy), v36 (copy), v3 (copy), v14 (copy), v33 (copy), l_useLocalization_0 (copy), l_IdentityProtocol_0 (copy), v26 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), v10 (copy), v12 (copy), l_LoadingSpinner_0 (copy), v31 (copy), v4 (copy), v15 (copy), v16 (copy), v30 (copy), v17 (copy), v18 (copy)
    local v49 = v13(v36, v48);
    local v50, v51 = v3.useState(if v49.entryConfig then v14.Entry else v14.AddPhone);
    local v52, v53 = v3.useState("");
    local v54, v55 = v3.useState(v33);
    local v56, v57 = v3.useState(false);
    local v58, v59 = v3.useState("");
    local v60, v61 = v3.useState("");
    local v62, v63 = v3.useState("");
    local v64, v65 = v3.useState("");
    local v66, _ = v3.useState(false);
    local v68, v69 = v3.useState(false);
    local v70, v71 = v3.useState(false);
    local v72, v73 = v3.useState(false);
    local v74, v75 = v3.useState(0);
    local v76, v77 = v3.useState(Vector2.new(400, 400));
    local v78 = v3.useRef(false);
    local v79 = l_useLocalization_0({
        verifyingKey = "Feature.VerificationUpsell.Label.Verifying", 
        invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid", 
        invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError", 
        invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode", 
        tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts", 
        tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater", 
        genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
    });
    local v80 = nil;
    v3.useEffect(function() --[[ Line: 194 ]]
        -- upvalues: v56 (copy), v49 (copy), v55 (copy), v57 (copy)
        if not v56 and v49.countryCodeList and #v49.countryCodeList > 0 then
            for _, v82 in v49.countryCodeList do
                if v82.isDefault then
                    v55(v82);
                end;
            end;
            v57(true);
        end;
    end, {
        v49.countryCodeList, 
        v56
    });
    local function _() --[[ Line: 206 ]]
        -- upvalues: l_IdentityProtocol_0 (ref), v49 (copy), v50 (copy), v26 (ref), v54 (copy), v33 (ref), v53 (copy)
        local l_default_0 = l_IdentityProtocol_0.default;
        l_default_0:supportsGetPhoneNumber():andThen(function(v84) --[[ Line: 208 ]]
            -- upvalues: v49 (ref), v50 (ref), l_default_0 (copy), v26 (ref), v54 (ref), v33 (ref), v53 (ref)
            print("PhoneVerification: Autofill phone number supported: {}!", v84);
            if not v84 then
                return;
            else
                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillEligible", "autofill", v49.origin, v50);
                local v85 = l_default_0:getPhoneNumber();
                if not v85 then
                    return;
                else
                    v85:andThen(function(v86) --[[ Line: 224 ]]
                        -- upvalues: v26 (ref), v54 (ref), v33 (ref), v49 (ref), v50 (ref), v53 (ref)
                        if v86 and v86 ~= "" then
                            local v87, v88 = v26(v86, v54.prefix);
                            if v87 == v33.prefix then
                                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillUSFound", "autofill", v49.origin, v50);
                            end;
                            v53(v88);
                            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillSuccess", "autofill", v49.origin, v50);
                            return;
                        else
                            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillNull", "autofill", v49.origin, v50);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
        end);
    end;
    local function _() --[[ Line: 260 ]]
        -- upvalues: l_IdentityProtocol_0 (ref), v49 (copy), v50 (copy), v59 (copy), v61 (copy)
        local l_default_1 = l_IdentityProtocol_0.default;
        l_default_1:supportsGetSMSOTP():andThen(function(v91) --[[ Line: 262 ]]
            -- upvalues: v49 (ref), v50 (ref), l_default_1 (copy), v59 (ref), v61 (ref)
            print("PhoneVerification: Autofill OTP supported: {}!", v91);
            if v91 then
                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "codeAutofillEligible", "autofill", v49.origin, v50);
                local v92 = l_default_1:getSMSOTP();
                if v92 then
                    v92:andThen(function(v93) --[[ Line: 274 ]]
                        -- upvalues: v59 (ref), v61 (ref), v49 (ref), v50 (ref)
                        if v93 and v93 ~= "" then
                            v59(v93);
                            v61(v93);
                            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "codeAutofillSuccess", "autofill", v49.origin, v50);
                        end;
                    end);
                end;
            end;
        end);
    end;
    v3.useEffect(function() --[[ Line: 292 ]]
        -- upvalues: v78 (copy), v68 (copy)
        return function() --[[ Line: 293 ]]
            -- upvalues: v78 (ref), v68 (ref)
            v78.current = v68;
        end;
    end, {
        v68
    });
    v3.useEffect(function() --[[ Line: 298 ]]
        -- upvalues: v80 (ref), l_UserInputService_0 (ref), v73 (copy), v75 (copy), v49 (copy), v14 (ref), l_IdentityProtocol_0 (ref), v50 (copy), v26 (ref), v54 (copy), v33 (ref), v53 (copy), v78 (copy)
        v80 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 300 ]]
            -- upvalues: v73 (ref), l_UserInputService_0 (ref), v75 (ref)
            v73(l_UserInputService_0.OnScreenKeyboardVisible);
            v75(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        v49.authEventAnalytics.reportModalShownWithSection(v49.eventContext, v49.origin, v14.AddPhone);
        if v49.isAutofillPhoneNumberEnabled then
            local l_default_2 = l_IdentityProtocol_0.default;
            l_default_2:supportsGetPhoneNumber():andThen(function(v96) --[[ Line: 208 ]]
                -- upvalues: v49 (ref), v50 (ref), l_default_2 (copy), v26 (ref), v54 (ref), v33 (ref), v53 (ref)
                print("PhoneVerification: Autofill phone number supported: {}!", v96);
                if not v96 then
                    return;
                else
                    v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillEligible", "autofill", v49.origin, v50);
                    local v97 = l_default_2:getPhoneNumber();
                    if not v97 then
                        return;
                    else
                        v97:andThen(function(v98) --[[ Line: 224 ]]
                            -- upvalues: v26 (ref), v54 (ref), v33 (ref), v49 (ref), v50 (ref), v53 (ref)
                            if v98 and v98 ~= "" then
                                local v99, v100 = v26(v98, v54.prefix);
                                if v99 == v33.prefix then
                                    v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillUSFound", "autofill", v49.origin, v50);
                                end;
                                v53(v100);
                                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillSuccess", "autofill", v49.origin, v50);
                                return;
                            else
                                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillNull", "autofill", v49.origin, v50);
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 315 ]]
            -- upvalues: v80 (ref), v78 (ref), v49 (ref)
            if v80 then
                v80:Disconnect();
            end;
            v80 = nil;
            if not v78.current then
                v49.onCancelled();
            end;
        end;
    end, {});
    local v102 = l_useSelector_0(function(v101) --[[ Line: 326 ]]
        return v101.ScreenSize;
    end);
    local function v103() --[[ Line: 330 ]] --[[ Name: handleCloseClick ]]
        -- upvalues: v49 (copy), v50 (copy)
        v49.authEventAnalytics.reportModalDismissedWithSection(v49.eventContext, v49.origin, v50);
        v49.closeUpsell();
    end;
    local function _(v104) --[[ Line: 339 ]] --[[ Name: handlePhoneErrors ]]
        -- upvalues: v79 (copy)
        if v104 == 2 then
            return v79.invalidPhoneFormatKey;
        elseif v104 == 6 then
            return v79.tooManyAttemptsKey;
        elseif v104 == 7 then
            return v79.invalidVerificationCodeKey;
        elseif v104 == 8 then
            return v79.invalidPhoneNumberKey;
        elseif v104 == 9 then
            return v79.tooManyAccountsKey;
        else
            return v79.genericErrorKey;
        end;
    end;
    local function v114() --[[ Line: 355 ]] --[[ Name: handleSetPhone ]]
        -- upvalues: v71 (copy), v49 (copy), v54 (copy), v52 (copy), v51 (copy), v14 (ref), l_IdentityProtocol_0 (ref), v50 (copy), v59 (copy), v61 (copy), v10 (ref), v63 (copy), v79 (copy)
        v71(true);
        local v106 = v49.setPhoneNumber(v49.networking, v54.code, v54.prefix, v52);
        if v106 then
            v106:andThen(function() --[[ Line: 360 ]]
                -- upvalues: v51 (ref), v14 (ref), v71 (ref), v49 (ref), l_IdentityProtocol_0 (ref), v50 (ref), v59 (ref), v61 (ref)
                v51(v14.VerifyPhone);
                v71(false);
                v49.authEventAnalytics.reportModalShownWithSection(v49.eventContext, v49.origin, v14.VerifyPhone);
                if v49.isAutofillSMSOtpEnabled then
                    local l_default_3 = l_IdentityProtocol_0.default;
                    l_default_3:supportsGetSMSOTP():andThen(function(v108) --[[ Line: 262 ]]
                        -- upvalues: v49 (ref), v50 (ref), l_default_3 (copy), v59 (ref), v61 (ref)
                        print("PhoneVerification: Autofill OTP supported: {}!", v108);
                        if v108 then
                            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "codeAutofillEligible", "autofill", v49.origin, v50);
                            local v109 = l_default_3:getSMSOTP();
                            if v109 then
                                v109:andThen(function(v110) --[[ Line: 274 ]]
                                    -- upvalues: v59 (ref), v61 (ref), v49 (ref), v50 (ref)
                                    if v110 and v110 ~= "" then
                                        v59(v110);
                                        v61(v110);
                                        v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "codeAutofillSuccess", "autofill", v49.origin, v50);
                                    end;
                                end);
                            end;
                        end;
                    end);
                end;
            end):catch(function(v111) --[[ Line: 374 ]]
                -- upvalues: v49 (ref), v10 (ref), v14 (ref), v63 (ref), v79 (ref), v71 (ref)
                if not v111 then
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.AddPhone, "");
                    v63(v79.genericErrorKey);
                elseif v111.PhoneRegexFailed then
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.AddPhone, "");
                    v63(v79.invalidPhoneFormatKey);
                else
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.AddPhone, v111.ErrorCode);
                    local l_v63_0 = v63;
                    local l_ErrorCode_0 = v111.ErrorCode;
                    l_v63_0(if l_ErrorCode_0 == 2 then v79.invalidPhoneFormatKey else if l_ErrorCode_0 == 6 then v79.tooManyAttemptsKey else if l_ErrorCode_0 == 7 then v79.invalidVerificationCodeKey else if l_ErrorCode_0 == 8 then v79.invalidPhoneNumberKey else if l_ErrorCode_0 == 9 then v79.tooManyAccountsKey else v79.genericErrorKey);
                end;
                v71(false);
            end);
        end;
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, "", "", v49.origin, v10.Button.Continue, v14.AddPhone);
    end;
    local function v119() --[[ Line: 416 ]] --[[ Name: handleVerifyPhone ]]
        -- upvalues: v71 (copy), v49 (copy), v60 (copy), v69 (copy), v10 (ref), v14 (ref), v65 (copy), v79 (copy)
        v71(true);
        local v115 = v49.verifyPhoneCode(v49.networking, v60);
        if v115 then
            v115:andThen(function() --[[ Line: 421 ]]
                -- upvalues: v69 (ref)
                v69(true);
            end):catch(function(v116) --[[ Line: 424 ]]
                -- upvalues: v49 (ref), v10 (ref), v14 (ref), v65 (ref), v79 (ref), v71 (ref)
                if not v116 then
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.VerifyPhone, "");
                    v65(v79.genericErrorKey);
                else
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.VerifyPhone, v116.ErrorCode);
                    local l_v65_0 = v65;
                    local l_ErrorCode_1 = v116.ErrorCode;
                    l_v65_0(if l_ErrorCode_1 == 2 then v79.invalidPhoneFormatKey else if l_ErrorCode_1 == 6 then v79.tooManyAttemptsKey else if l_ErrorCode_1 == 7 then v79.invalidVerificationCodeKey else if l_ErrorCode_1 == 8 then v79.invalidPhoneNumberKey else if l_ErrorCode_1 == 9 then v79.tooManyAccountsKey else v79.genericErrorKey);
                end;
                v71(false);
            end);
        end;
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, "", "", v49.origin, v10.Button.AutoSubmit, v14.VerifyPhone);
    end;
    local function v124() --[[ Line: 457 ]] --[[ Name: handleResendCode ]]
        -- upvalues: v49 (copy), v10 (ref), v14 (ref), v65 (copy), v79 (copy)
        local v120 = v49.resendPhoneCode(v49.networking);
        if v120 then
            v120:andThen(function() --[[ Line: 460 ]]

            end):catch(function(v121) --[[ Line: 460 ]]
                -- upvalues: v49 (ref), v10 (ref), v14 (ref), v65 (ref), v79 (ref)
                if not v121 then
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.VerifyPhone, "");
                    v65(v79.genericErrorKey);
                    return;
                else
                    v49.authEventAnalytics.reportModalShownWithSectionAndError(v49.eventContext, v10.Field.ErrorMessage, v49.origin, v14.VerifyPhone, v121.ErrorCode);
                    local l_v65_1 = v65;
                    local l_ErrorCode_2 = v121.ErrorCode;
                    l_v65_1(if l_ErrorCode_2 == 2 then v79.invalidPhoneFormatKey else if l_ErrorCode_2 == 6 then v79.tooManyAttemptsKey else if l_ErrorCode_2 == 7 then v79.invalidVerificationCodeKey else if l_ErrorCode_2 == 8 then v79.invalidPhoneNumberKey else if l_ErrorCode_2 == 9 then v79.tooManyAccountsKey else v79.genericErrorKey);
                    return;
                end;
            end);
        end;
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, "", "", v49.origin, v10.Button.ResendCode, v14.VerifyPhone);
    end;
    local function v125() --[[ Line: 492 ]] --[[ Name: returnToAddPhone ]]
        -- upvalues: v51 (copy), v14 (ref), v49 (copy), v10 (ref)
        v51(v14.AddPhone);
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, "", "", v49.origin, v10.Button.ChangePhoneNumber, v14.VerifyPhone);
    end;
    local function v126() --[[ Line: 504 ]] --[[ Name: proceedToAddPhone ]]
        -- upvalues: v51 (copy), v14 (ref), v49 (copy), v10 (ref)
        v51(v14.AddPhone);
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, "", "", v49.origin, v10.Button.Continue, v14.Entry);
    end;
    local function v127() --[[ Line: 516 ]] --[[ Name: navigateToSMSTerms ]]
        -- upvalues: v70 (copy), v49 (copy), v10 (ref), v50 (copy)
        if not v70 then
            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, v10.Field.TermsOfService, "", v49.origin, v50);
            v49.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service");
        end;
    end;
    local function v128() --[[ Line: 529 ]] --[[ Name: navigateToPrivacy ]]
        -- upvalues: v70 (copy), v49 (copy), v10 (ref), v50 (copy)
        if not v70 then
            v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, v10.Field.PrivacyPolicy, "", v49.origin, v50);
            v49.showWebpage("https://en.help.roblox.com/hc/articles/115004630823");
        end;
    end;
    local function v130(v129) --[[ Line: 543 ]]
        -- upvalues: v70 (copy), v63 (copy), v53 (copy)
        if not v70 then
            v63("");
            v53(v129.Text);
        end;
    end;
    local function v131() --[[ Line: 550 ]]
        -- upvalues: v49 (copy), v10 (ref), v14 (ref)
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, v10.Field.CountryPrefix, v10.ActionType.Focus, v49.origin, "", v14.AddPhone);
    end;
    local function v138() --[[ Line: 561 ]]
        -- upvalues: v49 (copy), v10 (ref), v14 (ref), l_IdentityProtocol_0 (ref), v50 (copy), v26 (ref), v54 (copy), v33 (ref), v53 (copy)
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, v10.Field.PhoneNumber, v10.ActionType.Focus, v49.origin, "", v14.AddPhone);
        if not v49.shouldAutofillAndroidPhoneNumberAtLaunch then
            local l_default_4 = l_IdentityProtocol_0.default;
            l_default_4:supportsGetPhoneNumber():andThen(function(v133) --[[ Line: 208 ]]
                -- upvalues: v49 (ref), v50 (ref), l_default_4 (copy), v26 (ref), v54 (ref), v33 (ref), v53 (ref)
                print("PhoneVerification: Autofill phone number supported: {}!", v133);
                if not v133 then
                    return;
                else
                    v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillEligible", "autofill", v49.origin, v50);
                    local v134 = l_default_4:getPhoneNumber();
                    if not v134 then
                        return;
                    else
                        v134:andThen(function(v135) --[[ Line: 224 ]]
                            -- upvalues: v26 (ref), v54 (ref), v33 (ref), v49 (ref), v50 (ref), v53 (ref)
                            if v135 and v135 ~= "" then
                                local v136, v137 = v26(v135, v54.prefix);
                                if v136 == v33.prefix then
                                    v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillUSFound", "autofill", v49.origin, v50);
                                end;
                                v53(v137);
                                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillSuccess", "autofill", v49.origin, v50);
                                return;
                            else
                                v49.authEventAnalytics.reportModalActionWithSection(v49.eventContext, "phoneAutofillNull", "autofill", v49.origin, v50);
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end);
        end;
    end;
    local v140 = v12(function(v139) --[[ Line: 575 ]]
        -- upvalues: v61 (copy)
        v61(v139);
    end, 0.5);
    local function v143(v141) --[[ Line: 579 ]]
        -- upvalues: v65 (copy), v59 (copy), v140 (copy)
        if string.len(v141.Text) <= 6 then
            v65("");
        end;
        local v142 = string.sub(v141.Text, 1, 6);
        v59(v142);
        v140(v142);
    end;
    local function v144() --[[ Line: 592 ]]
        -- upvalues: v49 (copy), v10 (ref), v14 (ref)
        v49.authEventAnalytics.reportInteractWithActionAndSection(v49.eventContext, v10.Field.VerificationCode, v10.ActionType.Focus, v49.origin, "", v14.VerifyPhone);
    end;
    v3.useEffect(function() --[[ Line: 604 ]]
        -- upvalues: v60 (copy), v119 (copy)
        if string.len(v60) == 6 then
            v119();
        end;
    end, {
        v60
    });
    v3.useEffect(function() --[[ Line: 611 ]]
        -- upvalues: v68 (copy), v49 (copy), v14 (ref)
        if v68 then
            v49.setIsPhoneVerified({
                isPhoneVerified = true
            });
            v49.authEventAnalytics.reportModalShownWithSection(v49.eventContext, v49.origin, v14.Success);
            v49.onSuccess();
        end;
    end, {
        v68
    });
    local v145 = v3.createElement(l_LoadingSpinner_0, {
        size = UDim2.fromOffset(48, 48), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
    local l_createElement_0 = v3.createElement;
    local v147 = v31() and "Frame" or v3.Fragment;
    local v149 = if v31() then {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v4.Change.AbsoluteSize] = function(v148) --[[ Line: 635 ]]
            -- upvalues: v77 (copy)
            v77(v148.AbsoluteSize);
        end
    } else nil;
    local v150 = {};
    local v151 = false;
    if v50 == v14.Entry then
        v151 = v49.entryConfig and v3.createElement(v15, {
            screenSize = if v31() then v76 else v102, 
            onClose = v103, 
            titleKey = v49.entryConfig.titleKey, 
            descriptionKey = v49.entryConfig.descriptionKey, 
            buttonKey = v49.entryConfig.buttonKey, 
            onButtonClick = v126, 
            extraButtonKey = v49.entryConfig.extraButtonConfig.extraButtonKey, 
            onExtraButtonClick = v49.entryConfig.extraButtonConfig.onExtraButtonClick
        });
    end;
    v150.Entry = v151;
    v151 = false;
    if v50 == v14.AddPhone then
        v151 = v3.createElement(v16, {
            screenSize = if v31() then v76 else v102, 
            countryCode = v54, 
            setCountryCode = v55, 
            phoneNumber = v52, 
            errorMessage = v62, 
            isDisabled = v70, 
            onPhoneNumberTextChange = v130, 
            onSetPhoneNumber = v114, 
            onClose = v103, 
            onTermsOfUseClick = v127, 
            onPrivacyPolicyClick = v128, 
            onPhoneInputFocus = v138, 
            onCountryCodeSelectorClick = v131, 
            isKeyboardShowing = v72, 
            keyboardHeight = v74, 
            usePhoneNumberTextType = v30() and v49.isPhoneNumberTextTypeEnabled, 
            titleKey = v49.addPhoneTitleKey, 
            descriptionKey = v49.addPhoneDescriptionKey, 
            buttonKey = v49.addPhoneButtonKey, 
            legalTextKey = v49.addPhoneLegalTextKey, 
            extraButtonKey = v49.extraButtonTextKey, 
            onExtraButtonClick = v49.onExtraButtonClick, 
            alwaysShowLegalText = v49.alwaysShowAddPhoneLegalText, 
            requireLegalTextCheckbox = v49.requireAddPhoneLegalTextCheckbox
        });
    end;
    v150.AddPhone = v151;
    v151 = false;
    if v50 == v14.VerifyPhone then
        v151 = v3.createElement(v17, {
            screenSize = if v31() then v76 else v102, 
            phoneNumber = v52, 
            prefix = v54.prefix, 
            code = v58, 
            errorMessage = v64, 
            onCodeTextChange = v143, 
            onResendPhoneCode = v124, 
            onClose = v103, 
            returnToAddPhone = v125, 
            onCodeInputFocus = v144, 
            isKeyboardShowing = v72, 
            keyboardHeight = v74, 
            useOTPInputType = v49.isOTPInputTypeEnabled, 
            extraButtonKey = v49.verifyPhoneExtraButtonKey, 
            onExtraButtonClick = v49.onVerifyPhoneExtraButtonClick
        });
    end;
    v150.VerifyPhone = v151;
    v150.LoadingOverlay = v66 and v3.createElement(v18, {
        image = v145, 
        text = v79.verifyingKey
    });
    return l_createElement_0(v147, v149, v150);
end);
v152 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    authEventAnalytics = v11
})(v152);
return (v27.connectUserLayer({
    l_GetFStringAndroidPhoneVerificationLayer_0(), 
    l_GetFStringIOSPhoneVerificationLayer_0()
}, function(v153, _) --[[ Line: 736 ]]
    -- upvalues: l_GetFStringAndroidPhoneVerificationLayer_0 (copy), l_GetFStringIOSPhoneVerificationLayer_0 (copy)
    local v155 = v153[l_GetFStringAndroidPhoneVerificationLayer_0()] or {};
    local v156 = v153[l_GetFStringIOSPhoneVerificationLayer_0()] or {};
    return {
        isAutofillPhoneNumberEnabled = v155.IsAutofillPhoneNumberEnabled, 
        isAutofillSMSOtpEnabled = v155.IsAutofillSMSOtpEnabled, 
        isOTPInputTypeEnabled = v156.IsAutofillSMSOtpEnabled, 
        isPhoneNumberTextTypeEnabled = v156.IsAutofillPhoneNumberEnabled
    };
end)(v152));