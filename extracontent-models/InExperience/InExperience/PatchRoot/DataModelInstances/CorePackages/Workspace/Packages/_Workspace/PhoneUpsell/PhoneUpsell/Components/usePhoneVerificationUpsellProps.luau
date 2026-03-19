local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_Parent_0.LuauPolyfill);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v8 = require(l_script_FirstAncestor_0.DuplicateAnalytics.EventStreamConstants);
local v9 = require(l_script_FirstAncestor_0.DuplicateAnalytics.RoactAnalyticsAuthEvents);
local v10 = require(l_script_FirstAncestor_0.Utils.debounce);
local v11 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v13 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v14 = require(l_script_FirstAncestor_0.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Thunks.SetPhoneNumber);
local v17 = require(l_script_FirstAncestor_0.Thunks.VerifyPhoneCode);
local v18 = require(l_script_FirstAncestor_0.Thunks.ResendPhoneCode);
local l_SetIsPhoneVerified_0 = require(l_Parent_0.ContactImporter).Actions.SetIsPhoneVerified;
local v20 = require(l_script_FirstAncestor_0.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_GetFStringAndroidPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringAndroidPhoneVerificationLayer;
local l_GetFStringIOSPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringIOSPhoneVerificationLayer;
local v24 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
local l_IdentityProtocol_0 = require(l_Parent_0.IdentityProtocol).IdentityProtocol;
local v27 = {
    name = "United States", 
    code = "US", 
    prefix = "1", 
    localizedName = "United States"
};
local function v28() --[[ Line: 114 ]]

end;
local v30 = {
    onSuccess = v28, 
    onFailure = v28, 
    onCancelled = v28, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v28, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v28, 
    showWebpage = function(_) --[[ Line: 130 ]] --[[ Name: showWebpage ]]

    end
};
return function(v31) --[[ Line: 133 ]] --[[ Name: usePhoneVerificationUpsellProps ]]
    -- upvalues: v11 (copy), v30 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), v16 (copy), v17 (copy), v18 (copy), l_SetIsPhoneVerified_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v9 (copy), l_useUserExperiment_0 (copy), l_GetFStringAndroidPhoneVerificationLayer_0 (copy), l_GetFStringIOSPhoneVerificationLayer_0 (copy), v3 (copy), v13 (copy), v27 (copy), l_useLocalization_0 (copy), l_IdentityProtocol_0 (copy), v20 (copy), l_UserInputService_0 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy), v8 (copy), v14 (copy), v10 (copy), v24 (copy)
    local v32 = v11(v30, v31);
    local v34 = l_useSelector_0(function(v33) --[[ Line: 136 ]]
        return v33.CountryCodeList;
    end);
    local v35 = l_useDispatch_0();
    local function _(v36, v37, v38, v39) --[[ Line: 141 ]]
        -- upvalues: v35 (copy), v16 (ref)
        return v35(v16(v36, v37, v38, v39, nil));
    end;
    local function _(v41, v42) --[[ Line: 144 ]]
        -- upvalues: v35 (copy), v17 (ref)
        return v35(v17(v41, v42));
    end;
    local function _(v44) --[[ Line: 147 ]]
        -- upvalues: v35 (copy), v18 (ref)
        return v35(v18(v44));
    end;
    local function _(v46) --[[ Line: 150 ]]
        -- upvalues: v35 (copy), l_SetIsPhoneVerified_0 (ref)
        return v35(l_SetIsPhoneVerified_0(v46));
    end;
    local v48 = l_useRoactService_0(l_RoactNetworking_0);
    local v49 = l_useRoactService_0(v9);
    local v53, v54, v55, v56 = l_useUserExperiment_0({
        l_GetFStringAndroidPhoneVerificationLayer_0(), 
        l_GetFStringIOSPhoneVerificationLayer_0()
    }, function(v50) --[[ Line: 159 ]]
        -- upvalues: l_GetFStringAndroidPhoneVerificationLayer_0 (ref), l_GetFStringIOSPhoneVerificationLayer_0 (ref)
        local v51 = v50[l_GetFStringAndroidPhoneVerificationLayer_0()] or {};
        local v52 = v50[l_GetFStringIOSPhoneVerificationLayer_0()] or {};
        return v51.IsAutofillPhoneNumberEnabled, v51.IsAutofillSMSOtpEnabled, v52.IsAutofillSMSOtpEnabled, v52.IsAutofillPhoneNumberEnabled;
    end);
    local v57, v58 = v3.useState(if v32.entryConfig then v13.Entry else v13.AddPhone);
    local v59, v60 = v3.useState("");
    local v61, v62 = v3.useState(v27);
    local v63, v64 = v3.useState(false);
    local v65, v66 = v3.useState("");
    local v67, v68 = v3.useState("");
    local v69, v70 = v3.useState("");
    local v71, v72 = v3.useState("");
    local v73, _ = v3.useState(false);
    local v75, v76 = v3.useState(false);
    local v77, v78 = v3.useState(false);
    local v79, v80 = v3.useState(false);
    local v81, v82 = v3.useState(0);
    local v83, v84 = v3.useState(Vector2.new(400, 400));
    local v85 = v3.useRef(false);
    local v86 = l_useLocalization_0({
        verifyingKey = "Feature.VerificationUpsell.Label.Verifying", 
        invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid", 
        invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError", 
        invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode", 
        tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts", 
        tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater", 
        genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
    });
    local v87 = nil;
    v3.useEffect(function() --[[ Line: 200 ]]
        -- upvalues: v63 (copy), v34 (copy), v62 (copy), v64 (copy)
        if not v63 and v34 and #v34 > 0 then
            for _, v89 in v34 do
                if v89.isDefault then
                    v62(v89);
                end;
            end;
            v64(true);
        end;
    end, {
        v34, 
        v63
    });
    local function _() --[[ Line: 212 ]]
        -- upvalues: l_IdentityProtocol_0 (ref), v49 (copy), v32 (copy), v57 (copy), v20 (ref), v61 (copy), v27 (ref), v60 (copy)
        local l_default_0 = l_IdentityProtocol_0.default;
        l_default_0:supportsGetPhoneNumber():andThen(function(v91) --[[ Line: 214 ]]
            -- upvalues: v49 (ref), v32 (ref), v57 (ref), l_default_0 (copy), v20 (ref), v61 (ref), v27 (ref), v60 (ref)
            print("PhoneVerification: Autofill phone number supported: {}!", v91);
            if not v91 then
                return;
            else
                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillEligible", "autofill", v32.origin, v57);
                local v92 = l_default_0:getPhoneNumber();
                if not v92 then
                    return;
                else
                    v92:andThen(function(v93) --[[ Line: 230 ]]
                        -- upvalues: v20 (ref), v61 (ref), v27 (ref), v49 (ref), v32 (ref), v57 (ref), v60 (ref)
                        if v93 and v93 ~= "" then
                            local v94, v95 = v20(v93, v61.prefix);
                            if v94 == v27.prefix then
                                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillUSFound", "autofill", v32.origin, v57);
                            end;
                            v60(v95);
                            v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillSuccess", "autofill", v32.origin, v57);
                            return;
                        else
                            v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillNull", "autofill", v32.origin, v57);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
        end);
    end;
    local function _() --[[ Line: 266 ]]
        -- upvalues: l_IdentityProtocol_0 (ref), v49 (copy), v32 (copy), v57 (copy), v66 (copy), v68 (copy)
        local l_default_1 = l_IdentityProtocol_0.default;
        l_default_1:supportsGetSMSOTP():andThen(function(v98) --[[ Line: 268 ]]
            -- upvalues: v49 (ref), v32 (ref), v57 (ref), l_default_1 (copy), v66 (ref), v68 (ref)
            print("PhoneVerification: Autofill OTP supported: {}!", v98);
            if v98 then
                v49.reportModalActionWithSection(v32.eventContext, "codeAutofillEligible", "autofill", v32.origin, v57);
                local v99 = l_default_1:getSMSOTP();
                if v99 then
                    v99:andThen(function(v100) --[[ Line: 280 ]]
                        -- upvalues: v66 (ref), v68 (ref), v49 (ref), v32 (ref), v57 (ref)
                        if v100 and v100 ~= "" then
                            v66(v100);
                            v68(v100);
                            v49.reportModalActionWithSection(v32.eventContext, "codeAutofillSuccess", "autofill", v32.origin, v57);
                        end;
                    end);
                end;
            end;
        end);
    end;
    v3.useEffect(function() --[[ Line: 298 ]]
        -- upvalues: v85 (copy), v75 (copy)
        return function() --[[ Line: 299 ]]
            -- upvalues: v85 (ref), v75 (ref)
            v85.current = v75;
        end;
    end, {
        v75
    });
    v3.useEffect(function() --[[ Line: 304 ]]
        -- upvalues: v87 (ref), l_UserInputService_0 (ref), v80 (copy), v82 (copy), v49 (copy), v32 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v57 (copy), v13 (ref), v53 (copy), l_IdentityProtocol_0 (ref), v20 (ref), v61 (copy), v27 (ref), v60 (copy), v85 (copy)
        v87 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 306 ]]
            -- upvalues: v80 (ref), l_UserInputService_0 (ref), v82 (ref)
            v80(l_UserInputService_0.OnScreenKeyboardVisible);
            v82(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        v49.reportModalShownWithSection(v32.eventContext, v32.origin, if l_GetFFlagAddMorePhoneUpsellEvents_0() then v57 else v13.AddPhone);
        if v53 then
            local l_default_2 = l_IdentityProtocol_0.default;
            l_default_2:supportsGetPhoneNumber():andThen(function(v103) --[[ Line: 214 ]]
                -- upvalues: v49 (ref), v32 (ref), v57 (ref), l_default_2 (copy), v20 (ref), v61 (ref), v27 (ref), v60 (ref)
                print("PhoneVerification: Autofill phone number supported: {}!", v103);
                if not v103 then
                    return;
                else
                    v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillEligible", "autofill", v32.origin, v57);
                    local v104 = l_default_2:getPhoneNumber();
                    if not v104 then
                        return;
                    else
                        v104:andThen(function(v105) --[[ Line: 230 ]]
                            -- upvalues: v20 (ref), v61 (ref), v27 (ref), v49 (ref), v32 (ref), v57 (ref), v60 (ref)
                            if v105 and v105 ~= "" then
                                local v106, v107 = v20(v105, v61.prefix);
                                if v106 == v27.prefix then
                                    v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillUSFound", "autofill", v32.origin, v57);
                                end;
                                v60(v107);
                                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillSuccess", "autofill", v32.origin, v57);
                                return;
                            else
                                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillNull", "autofill", v32.origin, v57);
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 321 ]]
            -- upvalues: v87 (ref), v85 (ref), v32 (ref)
            if v87 then
                v87:Disconnect();
            end;
            v87 = nil;
            if not v85.current then
                v32.onCancelled();
            end;
        end;
    end, {});
    local v109 = l_useSelector_0(function(v108) --[[ Line: 332 ]]
        return v108.ScreenSize;
    end);
    local function v110() --[[ Line: 336 ]] --[[ Name: handleCloseClick ]]
        -- upvalues: v49 (copy), v32 (copy), v57 (copy)
        v49.reportModalDismissedWithSection(v32.eventContext, v32.origin, v57);
        v32.closeUpsell();
    end;
    local function _(v111) --[[ Line: 341 ]] --[[ Name: handlePhoneErrors ]]
        -- upvalues: v86 (copy)
        if v111 == 2 then
            return v86.invalidPhoneFormatKey;
        elseif v111 == 6 then
            return v86.tooManyAttemptsKey;
        elseif v111 == 7 then
            return v86.invalidVerificationCodeKey;
        elseif v111 == 8 then
            return v86.invalidPhoneNumberKey;
        elseif v111 == 9 then
            return v86.tooManyAccountsKey;
        else
            return v86.genericErrorKey;
        end;
    end;
    local function v124() --[[ Line: 357 ]] --[[ Name: handleSetPhone ]]
        -- upvalues: v78 (copy), v48 (copy), v61 (copy), v59 (copy), v35 (copy), v16 (ref), v58 (copy), v13 (ref), v49 (copy), v32 (copy), v54 (copy), l_IdentityProtocol_0 (ref), v57 (copy), v66 (copy), v68 (copy), v8 (ref), v70 (copy), v86 (copy)
        v78(true);
        local l_v48_0 = v48;
        local l_code_0 = v61.code;
        local l_prefix_0 = v61.prefix;
        local v116 = v35(v16(l_v48_0, l_code_0, l_prefix_0, v59, nil));
        if v116 then
            v116:andThen(function() --[[ Line: 362 ]]
                -- upvalues: v58 (ref), v13 (ref), v78 (ref), v49 (ref), v32 (ref), v54 (ref), l_IdentityProtocol_0 (ref), v57 (ref), v66 (ref), v68 (ref)
                v58(v13.VerifyPhone);
                v78(false);
                v49.reportModalShownWithSection(v32.eventContext, v32.origin, v13.VerifyPhone);
                if v54 then
                    local l_default_3 = l_IdentityProtocol_0.default;
                    l_default_3:supportsGetSMSOTP():andThen(function(v118) --[[ Line: 268 ]]
                        -- upvalues: v49 (ref), v32 (ref), v57 (ref), l_default_3 (copy), v66 (ref), v68 (ref)
                        print("PhoneVerification: Autofill OTP supported: {}!", v118);
                        if v118 then
                            v49.reportModalActionWithSection(v32.eventContext, "codeAutofillEligible", "autofill", v32.origin, v57);
                            local v119 = l_default_3:getSMSOTP();
                            if v119 then
                                v119:andThen(function(v120) --[[ Line: 280 ]]
                                    -- upvalues: v66 (ref), v68 (ref), v49 (ref), v32 (ref), v57 (ref)
                                    if v120 and v120 ~= "" then
                                        v66(v120);
                                        v68(v120);
                                        v49.reportModalActionWithSection(v32.eventContext, "codeAutofillSuccess", "autofill", v32.origin, v57);
                                    end;
                                end);
                            end;
                        end;
                    end);
                end;
            end):catch(function(v121) --[[ Line: 376 ]]
                -- upvalues: v49 (ref), v32 (ref), v8 (ref), v13 (ref), v70 (ref), v86 (ref), v78 (ref)
                if not v121 then
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.AddPhone, "");
                    v70(v86.genericErrorKey);
                elseif v121.PhoneRegexFailed then
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.AddPhone, "");
                    v70(v86.invalidPhoneFormatKey);
                else
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.AddPhone, v121.ErrorCode);
                    local l_v70_0 = v70;
                    local l_ErrorCode_0 = v121.ErrorCode;
                    l_v70_0(if l_ErrorCode_0 == 2 then v86.invalidPhoneFormatKey else if l_ErrorCode_0 == 6 then v86.tooManyAttemptsKey else if l_ErrorCode_0 == 7 then v86.invalidVerificationCodeKey else if l_ErrorCode_0 == 8 then v86.invalidPhoneNumberKey else if l_ErrorCode_0 == 9 then v86.tooManyAccountsKey else v86.genericErrorKey);
                end;
                v78(false);
            end);
        end;
        v49.reportInteractWithActionAndSection(v32.eventContext, "", "", v32.origin, v8.Button.Continue, v13.AddPhone);
    end;
    local function v129() --[[ Line: 418 ]] --[[ Name: handleVerifyPhone ]]
        -- upvalues: v78 (copy), v48 (copy), v67 (copy), v35 (copy), v17 (ref), v76 (copy), v49 (copy), v32 (copy), v8 (ref), v13 (ref), v72 (copy), v86 (copy)
        v78(true);
        local v125 = v35(v17(v48, v67));
        if v125 then
            v125:andThen(function() --[[ Line: 423 ]]
                -- upvalues: v76 (ref)
                v76(true);
            end):catch(function(v126) --[[ Line: 426 ]]
                -- upvalues: v49 (ref), v32 (ref), v8 (ref), v13 (ref), v72 (ref), v86 (ref), v78 (ref)
                if not v126 then
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.VerifyPhone, "");
                    v72(v86.genericErrorKey);
                else
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.VerifyPhone, v126.ErrorCode);
                    local l_v72_0 = v72;
                    local l_ErrorCode_1 = v126.ErrorCode;
                    l_v72_0(if l_ErrorCode_1 == 2 then v86.invalidPhoneFormatKey else if l_ErrorCode_1 == 6 then v86.tooManyAttemptsKey else if l_ErrorCode_1 == 7 then v86.invalidVerificationCodeKey else if l_ErrorCode_1 == 8 then v86.invalidPhoneNumberKey else if l_ErrorCode_1 == 9 then v86.tooManyAccountsKey else v86.genericErrorKey);
                end;
                v78(false);
            end);
        end;
        v49.reportInteractWithActionAndSection(v32.eventContext, "", "", v32.origin, v8.Button.AutoSubmit, v13.VerifyPhone);
    end;
    local function v134() --[[ Line: 459 ]] --[[ Name: handleResendCode ]]
        -- upvalues: v72 (copy), v48 (copy), v35 (copy), v18 (ref), v49 (copy), v32 (copy), v8 (ref), v13 (ref), v86 (copy)
        v72("");
        local v130 = v35(v18(v48));
        if v130 then
            v130:andThen(function() --[[ Line: 463 ]]

            end):catch(function(v131) --[[ Line: 463 ]]
                -- upvalues: v49 (ref), v32 (ref), v8 (ref), v13 (ref), v72 (ref), v86 (ref)
                if not v131 then
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.VerifyPhone, "");
                    v72(v86.genericErrorKey);
                    return;
                else
                    v49.reportModalShownWithSectionAndError(v32.eventContext, v8.Field.ErrorMessage, v32.origin, v13.VerifyPhone, v131.ErrorCode);
                    local l_v72_1 = v72;
                    local l_ErrorCode_2 = v131.ErrorCode;
                    l_v72_1(if l_ErrorCode_2 == 2 then v86.invalidPhoneFormatKey else if l_ErrorCode_2 == 6 then v86.tooManyAttemptsKey else if l_ErrorCode_2 == 7 then v86.invalidVerificationCodeKey else if l_ErrorCode_2 == 8 then v86.invalidPhoneNumberKey else if l_ErrorCode_2 == 9 then v86.tooManyAccountsKey else v86.genericErrorKey);
                    return;
                end;
            end);
        end;
        v49.reportInteractWithActionAndSection(v32.eventContext, "", "", v32.origin, v8.Button.ResendCode, v13.VerifyPhone);
    end;
    local function v135() --[[ Line: 495 ]] --[[ Name: returnToAddPhone ]]
        -- upvalues: v58 (copy), v13 (ref), v49 (copy), v32 (copy), v8 (ref)
        v58(v13.AddPhone);
        v49.reportInteractWithActionAndSection(v32.eventContext, "", "", v32.origin, v8.Button.ChangePhoneNumber, v13.VerifyPhone);
    end;
    local function v136() --[[ Line: 507 ]] --[[ Name: proceedToAddPhone ]]
        -- upvalues: v58 (copy), v13 (ref), v49 (copy), v32 (copy), v8 (ref)
        v58(v13.AddPhone);
        v49.reportInteractWithActionAndSection(v32.eventContext, "", "", v32.origin, v8.Button.Continue, v13.Entry);
    end;
    local function v137() --[[ Line: 519 ]] --[[ Name: navigateToSMSTerms ]]
        -- upvalues: v77 (copy), v49 (copy), v32 (copy), v8 (ref), v57 (copy), v14 (ref)
        if not v77 then
            v49.reportModalActionWithSection(v32.eventContext, v8.Field.TermsOfService, "", v32.origin, v57);
            v32.showWebpage(v14.TERMS_OF_SERVICE_URL);
        end;
    end;
    local function v138() --[[ Line: 532 ]] --[[ Name: navigateToPrivacy ]]
        -- upvalues: v77 (copy), v49 (copy), v32 (copy), v8 (ref), v57 (copy), v14 (ref)
        if not v77 then
            v49.reportModalActionWithSection(v32.eventContext, v8.Field.PrivacyPolicy, "", v32.origin, v57);
            v32.showWebpage(v14.PRIVACY_POLICY_URL);
        end;
    end;
    local function v140(v139) --[[ Line: 546 ]]
        -- upvalues: v77 (copy), v70 (copy), v60 (copy)
        if not v77 then
            v70("");
            v60(v139.Text);
        end;
    end;
    local function v141() --[[ Line: 553 ]]
        -- upvalues: v49 (copy), v32 (copy), v8 (ref), v13 (ref)
        v49.reportInteractWithActionAndSection(v32.eventContext, v8.Field.CountryPrefix, v8.ActionType.Focus, v32.origin, "", v13.AddPhone);
    end;
    local function v148() --[[ Line: 564 ]]
        -- upvalues: v49 (copy), v32 (copy), v8 (ref), v13 (ref), l_IdentityProtocol_0 (ref), v57 (copy), v20 (ref), v61 (copy), v27 (ref), v60 (copy)
        v49.reportInteractWithActionAndSection(v32.eventContext, v8.Field.PhoneNumber, v8.ActionType.Focus, v32.origin, "", v13.AddPhone);
        if not v32.shouldAutofillAndroidPhoneNumberAtLaunch then
            local l_default_4 = l_IdentityProtocol_0.default;
            l_default_4:supportsGetPhoneNumber():andThen(function(v143) --[[ Line: 214 ]]
                -- upvalues: v49 (ref), v32 (ref), v57 (ref), l_default_4 (copy), v20 (ref), v61 (ref), v27 (ref), v60 (ref)
                print("PhoneVerification: Autofill phone number supported: {}!", v143);
                if not v143 then
                    return;
                else
                    v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillEligible", "autofill", v32.origin, v57);
                    local v144 = l_default_4:getPhoneNumber();
                    if not v144 then
                        return;
                    else
                        v144:andThen(function(v145) --[[ Line: 230 ]]
                            -- upvalues: v20 (ref), v61 (ref), v27 (ref), v49 (ref), v32 (ref), v57 (ref), v60 (ref)
                            if v145 and v145 ~= "" then
                                local v146, v147 = v20(v145, v61.prefix);
                                if v146 == v27.prefix then
                                    v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillUSFound", "autofill", v32.origin, v57);
                                end;
                                v60(v147);
                                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillSuccess", "autofill", v32.origin, v57);
                                return;
                            else
                                v49.reportModalActionWithSection(v32.eventContext, "phoneAutofillNull", "autofill", v32.origin, v57);
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end);
        end;
    end;
    local v150 = v10(function(v149) --[[ Line: 578 ]]
        -- upvalues: v68 (copy)
        v68(v149);
    end, 0.5);
    local function v153(v151) --[[ Line: 582 ]]
        -- upvalues: v72 (copy), v66 (copy), v150 (copy)
        if string.len(v151.Text) <= 6 then
            v72("");
        end;
        local v152 = string.sub(v151.Text, 1, 6);
        v66(v152);
        v150(v152);
    end;
    local function v154() --[[ Line: 595 ]]
        -- upvalues: v49 (copy), v32 (copy), v8 (ref), v13 (ref)
        v49.reportInteractWithActionAndSection(v32.eventContext, v8.Field.VerificationCode, v8.ActionType.Focus, v32.origin, "", v13.VerifyPhone);
    end;
    v3.useEffect(function() --[[ Line: 607 ]]
        -- upvalues: v67 (copy), v129 (copy)
        if string.len(v67) == 6 then
            v129();
        end;
    end, {
        v67
    });
    v3.useEffect(function() --[[ Line: 614 ]]
        -- upvalues: v75 (copy), v35 (copy), l_SetIsPhoneVerified_0 (ref), v49 (copy), v32 (copy), v13 (ref)
        if v75 then
            local v155 = {
                isPhoneVerified = true
            };
            local _ = v35(l_SetIsPhoneVerified_0(v155));
            v49.reportModalShownWithSection(v32.eventContext, v32.origin, v13.Success);
            v32.onSuccess();
        end;
    end, {
        v75
    });
    return {
        phoneUpsellState = v57, 
        screenSize = if v24() then v83 else v109, 
        setParentSize = v84, 
        handleCloseClick = v110, 
        proceedToAddPhone = v136, 
        countryCode = v61, 
        setCountryCode = v62, 
        phoneNumber = v59, 
        addPhoneErrorMessage = v69, 
        isDisabled = v77, 
        onPhoneNumberTextChange = v140, 
        handleSetPhone = v124, 
        navigateToSMSTerms = v137, 
        navigateToPrivacy = v138, 
        onPhoneInputFocus = v148, 
        onCountryCodeSelectorClick = v141, 
        isKeyboardShowing = v79, 
        onScreenKeyboardHeight = v81, 
        code = v65, 
        verifyPhoneErrorMessage = v71, 
        onCodeTextChange = v153, 
        handleResendCode = v134, 
        returnToAddPhone = v135, 
        onCodeInputFocus = v154, 
        isLoading = v73, 
        verifyingKey = v86.verifyingKey, 
        isOTPInputTypeEnabled = v55, 
        isPhoneNumberTextTypeEnabled = v56
    };
end;