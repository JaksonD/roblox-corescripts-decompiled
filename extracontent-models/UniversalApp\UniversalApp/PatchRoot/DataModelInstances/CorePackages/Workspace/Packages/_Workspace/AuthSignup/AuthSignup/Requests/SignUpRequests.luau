local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.Http);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v6 = require(l_Parent_0.AuthCommon);
local l_getSingleSignOnUrls_0 = v6.Utils.getSingleSignOnUrls;
local l_AppStorageUtilities_0 = v6.Utils.AppStorageUtilities;
local l_ConsoleAuthRequestWrapper_0 = require(l_Parent_0.Http).Utils.ConsoleAuthRequestWrapper;
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableLuaAccountSwitch_0 = v10.FFlagEnableLuaAccountSwitch;
local l_FFlagSignupAddDisplayNameFieldToRequest_0 = v10.FFlagSignupAddDisplayNameFieldToRequest;
local l_FFlagEnableKoreaKISACompliance_0 = v10.FFlagEnableKoreaKISACompliance;
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = v10.GetFFlagEnableAuditForSinglePageSignUp;
local v15 = require(l_script_FirstAncestor_0.Enums.SignUpV2ErrorCodes);
local v16 = require(l_Parent_0.t);
local v23 = {
    signUp = function(v17, v18, v19, v20, v21, v22) --[[ Line: 40 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy)
        assert(type(v18) == "string", "invalid username has been passed into SignUpRequests.signUp");
        assert(type(v19) == "string", "invalid password has been passed into SignUpRequests.signUp");
        assert(type(v20) == "string", "invalid birthdate has been passed into SignUpRequests.signUp");
        assert(tonumber(v21) and type(v21) == "string", "invalid bundleId has been passed into SignUpRequests.signUp");
        return v17(string.format("%sv3/signup", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v18, 
                password = v19, 
                birthdate = v20, 
                bundleId = v21, 
                captchaId = v22 and v22.captchaId or nil, 
                captchaToken = v22 and v22.captchaToken or nil, 
                captchaProvider = v22 and v22.captchaProvider or nil, 
                accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil
            }), 
            maxRetryCount = 0
        });
    end
};
local v24 = v16.interface({
    username = v16.string, 
    password = v16.string, 
    gender = v16.string, 
    birthday = v16.string, 
    displayName = if l_FFlagSignupAddDisplayNameFieldToRequest_0 then v16.optional(v16.string) else nil, 
    locale = v16.optional(v16.string), 
    email = v16.optional(v16.string)
});
v23.signUpV2 = function(v25, v26, v27) --[[ Line: 114 ]]
    -- upvalues: v24 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableKoreaKISACompliance_0 (copy), l_FFlagSignupAddDisplayNameFieldToRequest_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy)
    assert(v24(v26));
    local v28 = v27 and v27.captchaId or nil;
    local v29 = v27 and v27.captchaToken or nil;
    local v30 = v27 and v27.captchaProvider or nil;
    return v25(string.format("%sv2/signup", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v26.username, 
            password = v26.password, 
            gender = v26.gender, 
            birthday = v26.birthday, 
            locale = v26.locale, 
            email = v26.email, 
            otpSession = if l_FFlagEnableKoreaKISACompliance_0 then v26.otpSession else nil, 
            agreementIds = v26.agreementIds, 
            displayName = if l_FFlagSignupAddDisplayNameFieldToRequest_0 then v26.displayName else nil, 
            isTosAgreementBoxChecked = true, 
            captchaId = v28, 
            captchaToken = v29, 
            captchaProvider = v30, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil, 
            passkeySessionId = v26.passkeySessionId, 
            passkeyRegistrationResponse = v26.passkeyRegistrationResponse, 
            auditSystemContent = if l_GetFFlagEnableAuditForSinglePageSignUp_0() and v26.capturedAuditContent and next(v26.capturedAuditContent) ~= nil then {
                capturedAuditContent = v26.capturedAuditContent, 
                additionalAuditContent = v26.additionalAuditContent
            } else nil
        }), 
        maxRetryCount = 0
    });
end;
local v31 = v16.interface({
    username = v16.string, 
    password = v16.string, 
    gender = v16.string, 
    birthday = v16.string, 
    verifiedSignupVoucher = v16.string
});
v23.verifiedSignup = function(v32, v33, v34) --[[ Line: 161 ]]
    -- upvalues: v31 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy)
    assert(v31(v33));
    local v35 = v34 and v34.captchaId or nil;
    local v36 = v34 and v34.captchaToken or nil;
    local v37 = v34 and v34.captchaProvider or nil;
    return v32(string.format("%sv1/verified-signup", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v33.username, 
            password = v33.password, 
            gender = v33.gender, 
            birthday = v33.birthday, 
            voucher = v33.verifiedSignupVoucher, 
            agreementIds = v33.agreementIds, 
            isTosAgreementBoxChecked = true, 
            captchaId = v35, 
            captchaToken = v36, 
            captchaProvider = v37, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v23.singleSignOnSignup = function(v38, v39) --[[ Line: 186 ]]
    -- upvalues: l_getSingleSignOnUrls_0 (copy), l_HttpService_0 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v3 (copy), v15 (copy)
    local v40 = l_getSingleSignOnUrls_0();
    local l_signup_0 = v40.signup;
    local v42 = l_HttpService_0:JSONEncode({
        username = v39.username, 
        password = v39.password, 
        gender = v39.gender, 
        birthday = v39.birthday, 
        locale = v39.locale, 
        email = v39.email, 
        agreementIds = v39.agreementIds, 
        isTosAgreementBoxChecked = true, 
        accountLinkParameters = if v40.linkingPlatform then {
            LinkingPlatform = v40.linkingPlatform
        } else nil
    });
    if l_signup_0 then
        local v43 = l_signup_0();
        return l_ConsoleAuthRequestWrapper_0(v38, v43, "POST", {
            postBody = v42, 
            maxRetryCount = 0
        });
    else
        return v3.reject(v15.TokenValidationFailed);
    end;
end;
return v23;