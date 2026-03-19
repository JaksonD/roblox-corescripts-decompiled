local _ = require(script.Parent.ChallengeHeaders);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v2 = require(l_script_FirstAncestor_0.Utils.constants);
local v3 = require(l_script_FirstAncestor_0.Types.ChallengeType);
local _ = require(l_script_FirstAncestor_0.Types.ChallengeParameters);
local v5 = require(l_script_FirstAncestor_0.Types.TwoStepVerificationActionType);
local v6 = require(l_script_FirstAncestor_0.Types.CaptchaActionType);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v13 = require(l_Parent_0.Cryo);
local function _() --[[ Line: 23 ]] --[[ Name: getUserDarkModeSettingQueryParam ]]
    -- upvalues: l_NotificationService_0 (copy)
    if string.lower(l_NotificationService_0.SelectedTheme) == "dark" then
        return "true";
    else
        return "false";
    end;
end;
local function v17() --[[ Line: 30 ]] --[[ Name: getUserAppTypeQueryParam ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v16 = "unknown";
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return "android";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return "ios";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        return "windows";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        return "osx";
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
        return "uwp";
    else
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
            v16 = "xbox";
        end;
        return v16;
    end;
end;
local function v21(v18, v19) --[[ Line: 49 ]] --[[ Name: getChallengeTypeQueryParameters ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    if v18 == v3.Captcha then
        assert(v19.actionType ~= nil, "actionType must be provided to render captcha");
        assert(v19.dataExchangeBlob ~= nil, "dataExchangeBlob must be provided to render captcha");
        assert(v19.captchaId ~= nil, "captchaId must be provided to render captcha");
        return {
            ["action-type"] = v6.toRawValue(v19.actionType), 
            ["data-exchange-blob"] = v19.dataExchangeBlob, 
            ["captcha-id"] = v19.captchaId
        };
    elseif v18 == v3.TwoStepVerification then
        assert(v19.challengeId ~= nil, "challengeId must be provided to render 2sv");
        assert(v19.userId ~= nil, "userId must be provided to render 2sv");
        assert(v19.actionType ~= nil, "actionType must be provided to render 2sv");
        assert(v19.allowRememberDevice ~= nil, "allowRememberDevice must be provided to render 2sv");
        local v20 = {
            ["challenge-id"] = v19.challengeId, 
            ["user-id"] = v19.userId, 
            ["action-type"] = v5.toRawValue(v19.actionType), 
            ["allow-remember-device"] = v19.allowRememberDevice and "true" or "false", 
            ["client-supports-2sv-recovery"] = v19.clientSupports2svRecovery and "true" or "false"
        };
        if v19.recoverySessionId ~= nil and string.len(v19.recoverySessionId) > 0 then
            v20["recovery-session-id"] = v19.recoverySessionId;
        end;
        return v20;
    elseif v18 == v3.SecurityQuestions then
        assert(v19.sessionId ~= nil, "sessionId must be provided to render security questions");
        assert(v19.userId ~= nil, "userId must be provided to render security questions");
        return {
            ["user-id"] = v19.userId, 
            ["session-id"] = v19.sessionId
        };
    elseif v18 == v3.Reauthentication then
        return {};
    elseif v18 == v3.Generic then
        assert(v19.genericChallengeId ~= nil, "genericChallengeId must be provided to render challenge");
        assert(v19.genericChallengeType ~= nil, "genericChallengeType must be provided to render challenge");
        assert(v19.genericChallengeMetadata ~= nil, "genericChallengeMetadata must be provided to render challenge");
        return {
            ["generic-challenge-id"] = v19.genericChallengeId, 
            ["generic-challenge-type"] = v19.genericChallengeType, 
            ["challenge-metadata-json"] = v19.genericChallengeMetadata
        };
    else
        return {};
    end;
end;
return function(v22, v23, v24) --[[ Line: 109 ]]
    -- upvalues: v3 (copy), v2 (copy), v17 (copy), l_NotificationService_0 (copy), v21 (copy), l_Base64_0 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), v13 (copy)
    if v22 ~= nil then
        assert(v24 == nil, "challenge parameters cannot be specified for generic challenge rendering");
        assert(string.len(v22.challengeId) > 0, "challenge id does not exist");
        assert(v22.challengeType.typed ~= nil, "challenge is of an unknown type");
    end;
    local l_Generic_0 = v3.Generic;
    if v23 ~= nil then
        assert(v3.toRawValue(v23) ~= nil, "challenge type is not valid");
        l_Generic_0 = v23;
    end;
    local v26 = {
        [v2.appTypeQueryParam] = v17(), 
        [v2.challengeTypeQueryParam] = v3.toRawValue(l_Generic_0), 
        [v2.darkModeQueryParam] = string.lower(l_NotificationService_0.SelectedTheme) == "dark" and "true" or "false"
    };
    local v27 = nil;
    if v24 ~= nil then
        v27 = v21(l_Generic_0, v24);
    else
        assert(v22 ~= nil, "challenge headers must be defined for generic challenge rendering");
        v27 = {
            [v2.genericChallengeIdQueryParam] = v22.challengeId, 
            [v2.genericChallengeTypeQueryParam] = v22.challengeType.raw, 
            [v2.challengeMetadataJsonQueryParam] = l_Base64_0.EncodeUrl(v22.challengeMetadata.decoded)
        };
    end;
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.WWW, 
        path = "challenge/cdn/hybrid", 
        query = v13.Dictionary.join(v26, v27)
    })();
end;