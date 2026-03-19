local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegallySensitiveContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local l_updateUserSetting_0 = require(l_script_FirstAncestor_0.Services.userSettingsService).updateUserSetting;
local l_grantOneTimeUserConsent_0 = require(l_script_FirstAncestor_0.Services.usersConsentsService).grantOneTimeUserConsent;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.dependencies).Localization.Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Constants.LegallySensitiveContentConstants);
local l_getEncodedAuditHeader_0 = require(l_script_FirstAncestor_0.Utils.AuditUtils).getEncodedAuditHeader;
local v8 = require(l_script_FirstAncestor_0.Enums.ConsentName);
local _ = require(l_script_FirstAncestor_0.Types.LegallySensitiveContentTypes);
return function(v10, v11) --[[ Line: 31 ]] --[[ Name: useTranslatedLegallySensitiveContentAndActions ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), v8 (copy), l_getEncodedAuditHeader_0 (copy), l_updateUserSetting_0 (copy), l_grantOneTimeUserConsent_0 (copy)
    local v12 = l_useLocalization_0({
        phoneNumberDiscoverabilityUpsellNotNow = v6.phoneNumberDiscoverabilityUpsell.notNow, 
        phoneNumberDiscoverabilityUpsellTurnOn = v6.phoneNumberDiscoverabilityUpsell.turnOn, 
        phoneNumberDiscoverabilityUpsellTitle = v6.phoneNumberDiscoverabilityUpsell.title, 
        phoneNumberDiscoverabilityUpsellContent = v6.phoneNumberDiscoverabilityUpsell.content, 
        photoToAvatarTitle = v6.photoToAvatar.title, 
        photoToAvatarBodyText = v6.photoToAvatar.bodyText, 
        photoToAvatarPrivacyLinkText = v6.photoToAvatar.privacyLinkText, 
        photoToAvatarAgreeButton = v6.photoToAvatar.agreeButton, 
        photoToAvatarCancelButton = v6.photoToAvatar.cancelButton
    });
    local v13 = {
        [v8.phoneNumberDiscoverabilityUpsell] = {
            wordsOfConsent = {
                notNow = v12.phoneNumberDiscoverabilityUpsellNotNow, 
                turnOn = v12.phoneNumberDiscoverabilityUpsellTurnOn, 
                title = v12.phoneNumberDiscoverabilityUpsellTitle, 
                content = v12.phoneNumberDiscoverabilityUpsellContent
            }
        }
    };
    local function v20(v14, v15, v16) --[[ Line: 85 ]] --[[ Name: updateSettingWithAuditing ]]
        -- upvalues: l_getEncodedAuditHeader_0 (ref), v10 (copy), v12 (copy), v11 (copy), l_updateUserSetting_0 (ref)
        local v17 = l_getEncodedAuditHeader_0(v10, v12, v11, v16);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 92 ]]
            -- upvalues: l_updateUserSetting_0 (ref), v14 (copy), v15 (copy), v17 (copy)
            l_updateUserSetting_0(v14, v15, v17);
        end);
        if not l_status_0 then
            warn("Failed to update setting with auditing:", l_result_0);
        end;
    end;
    local function v22(v21) --[[ Line: 101 ]] --[[ Name: getBase64EncodedAuditHeader ]]
        -- upvalues: l_getEncodedAuditHeader_0 (ref), v10 (copy), v12 (copy), v11 (copy)
        return l_getEncodedAuditHeader_0(v10, v12, v11, v21);
    end;
    local function v28(v23, v24) --[[ Line: 105 ]] --[[ Name: grantOneTimeUserConsentWithAuditing ]]
        -- upvalues: l_getEncodedAuditHeader_0 (ref), v10 (copy), v12 (copy), v11 (copy), l_grantOneTimeUserConsent_0 (ref)
        local v25 = l_getEncodedAuditHeader_0(v10, v12, v11, v24);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 111 ]]
            -- upvalues: l_grantOneTimeUserConsent_0 (ref), v10 (ref), v23 (copy), v25 (copy)
            l_grantOneTimeUserConsent_0(v10, v23, v25);
        end);
        if not l_status_1 then
            warn("Failed to grant one time user consent with auditing:", l_result_1);
        end;
    end;
    return v13[v10], {
        getBase64EncodedAuditHeader = v22, 
        updateSettingWithAuditing = v20, 
        grantOneTimeUserConsentWithAuditing = v28
    };
end;