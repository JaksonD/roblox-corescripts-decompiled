local AuthSignup = script:FindFirstAncestor("AuthSignup")
local AuthSignupParent = AuthSignup.Parent
local HttpService = game:GetService("HttpService")
local Promise = require(AuthSignupParent.Promise)

require(AuthSignupParent.Http)

local Url = require(AuthSignupParent.Http).Url
local AuthCommon = require(AuthSignupParent.AuthCommon)
local getSingleSignOnUrls = AuthCommon.Utils.getSingleSignOnUrls
local AppStorageUtilities = AuthCommon.Utils.AppStorageUtilities
local ConsoleAuthRequestWrapper = require(AuthSignupParent.Http).Utils.ConsoleAuthRequestWrapper
local SharedFlags = require(AuthSignupParent.SharedFlags)
local FFlagEnableLuaAccountSwitch = SharedFlags.FFlagEnableLuaAccountSwitch
local FFlagEnableKoreaKISACompliance = SharedFlags.FFlagEnableKoreaKISACompliance
local GetFFlagEnableAuditForSinglePageSignUp = SharedFlags.GetFFlagEnableAuditForSinglePageSignUp
local SignUpV2ErrorCodes = require(AuthSignup.Enums.SignUpV2ErrorCodes)
local t = require(AuthSignupParent.t)
local t1 = {
	signUp = function(p1, p2, p3, p4, p5, p6) -- line: 39
		-- upvalues: Url (copy), HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy)
		assert(type(p2) == "string", "invalid username has been passed into SignUpRequests.signUp")
		assert(type(p3) == "string", "invalid password has been passed into SignUpRequests.signUp")
		assert(type(p4) == "string", "invalid birthdate has been passed into SignUpRequests.signUp")
		assert(tonumber(p5) and type(p5) == "string", "invalid bundleId has been passed into SignUpRequests.signUp")

		return p1(string.format("%sv3/signup", Url.AUTH_URL), "POST", {
			postBody = HttpService:JSONEncode({
				username = p2,
				password = p3,
				birthdate = p4,
				bundleId = p5,
				captchaId = p6 and p6.captchaId or nil,
				captchaToken = p6 and p6.captchaToken or nil,
				captchaProvider = p6 and p6.captchaProvider or nil,
				accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil
			}),
			maxRetryCount = 0
		})
	end
}
local v17 = t.interface({
	username = t.string,
	password = t.string,
	gender = t.string,
	birthday = t.string,
	displayName = t.optional(t.string),
	locale = t.optional(t.string),
	email = t.optional(t.string)
})

function t1.signUpV2(p7, p8, p9) -- line: 113
	-- upvalues: v17 (copy), Url (copy), HttpService (copy), FFlagEnableKoreaKISACompliance (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy), GetFFlagEnableAuditForSinglePageSignUp (copy)
	assert(v17(p8))

	local v28 = p9 and p9.captchaId or nil
	local v29 = p9 and p9.captchaToken or nil
	local v30 = p9 and p9.captchaProvider or nil

	return p7(string.format("%sv2/signup", Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({
			username = p8.username,
			password = p8.password,
			gender = p8.gender,
			birthday = p8.birthday,
			locale = p8.locale,
			email = p8.email,
			otpSession = if not FFlagEnableKoreaKISACompliance then nil else p8.otpSession,
			agreementIds = p8.agreementIds,
			displayName = p8.displayName,
			isTosAgreementBoxChecked = true,
			captchaId = v28,
			captchaToken = v29,
			captchaProvider = v30,
			accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil,
			passkeySessionId = p8.passkeySessionId,
			passkeyRegistrationResponse = p8.passkeyRegistrationResponse,
			auditSystemContent = if not GetFFlagEnableAuditForSinglePageSignUp() or (not p8.capturedAuditContent or next(p8.capturedAuditContent) == nil) then nil else {
				capturedAuditContent = p8.capturedAuditContent,
				additionalAuditContent = p8.additionalAuditContent
			}
		}),
		maxRetryCount = 0
	})
end

local v18 = t.interface({
	username = t.string,
	password = t.string,
	gender = t.string,
	birthday = t.string,
	verifiedSignupVoucher = t.string
})

function t1.verifiedSignup(p10, p11, p12) -- line: 160
	-- upvalues: v18 (copy), Url (copy), HttpService (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy)
	assert(v18(p11))

	local v34 = p12 and p12.captchaId or nil
	local v35 = p12 and p12.captchaToken or nil
	local v36 = p12 and p12.captchaProvider or nil

	return p10(string.format("%sv1/verified-signup", Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({
			username = p11.username,
			password = p11.password,
			gender = p11.gender,
			birthday = p11.birthday,
			voucher = p11.verifiedSignupVoucher,
			agreementIds = p11.agreementIds,
			isTosAgreementBoxChecked = true,
			captchaId = v34,
			captchaToken = v35,
			captchaProvider = v36,
			accountBlob = FFlagEnableLuaAccountSwitch and AppStorageUtilities.getAccountBlob() or nil
		}),
		maxRetryCount = 0
	})
end
function t1.singleSignOnSignup(p13, p14) -- line: 185
	-- upvalues: getSingleSignOnUrls (copy), HttpService (copy), ConsoleAuthRequestWrapper (copy), Promise (copy), SignUpV2ErrorCodes (copy)
	local v39 = getSingleSignOnUrls()
	local signup = v39.signup
	local json = HttpService:JSONEncode({
		username = p14.username,
		password = p14.password,
		gender = p14.gender,
		birthday = p14.birthday,
		locale = p14.locale,
		email = p14.email,
		agreementIds = p14.agreementIds,
		isTosAgreementBoxChecked = true,
		accountLinkParameters = if not v39.linkingPlatform then nil else {
			LinkingPlatform = v39.linkingPlatform
		}
	})

	if signup then
		local v42 = signup()

		return ConsoleAuthRequestWrapper(p13, v42, "POST", {
			postBody = json,
			maxRetryCount = 0
		})
	end

	return Promise.reject(SignUpV2ErrorCodes.TokenValidationFailed)
end

return t1
