local l_script_FirstAncestor_0 = script:FindFirstAncestor("PromptAssignments");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.addRawValueMethodToEnum);
local v3 = require(l_Parent_0.enumerate);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled);
local v5 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled);
local v7 = {
    ChangePasswordSuspectedCompromise = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", 
    ChangePasswordBreachedCredential = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", 
    AccountRestoresPolicyUpdate = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", 
    AccountRestoresPolicyUpdateV2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", 
    AccountRestoresPolicyUpsell = v6() and "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL" or nil, 
    AccountRestoresPolicyUpdateV3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", 
    AuthenticatorUpsell = v4() and "PROMPT_TYPE_AUTHENTICATOR_UPSELL" or nil, 
    BroaderAuthenticatorUpsell = v5() and "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL" or nil, 
    Email2SVUpsell = "PROMPT_TYPE_EMAIL_2SV_UPSELL", 
    PasskeyUpsell = "PROMPT_TYPE_PASSKEY_UPSELL"
};
local v8 = v3(script.Name, v7);
v2(v8, v7);
return v8;