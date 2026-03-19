local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.CryptoUtils);
local v2 = require(l_Parent_0.Constants.LegallySensitiveContentConstants);
local l_Base64_0 = require(l_Parent_0.dependencies).Base64;
local v4 = require(l_Parent_0.Enums.ConsentName);
local _ = require(l_Parent_0.Types.LegallySensitiveContentTypes);
local function v9(v6, v7) --[[ Line: 18 ]] --[[ Name: getAuditDataForConsent ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v8 = ({
        [v4.phoneNumberDiscoverabilityUpsell] = {
            {
                consentStringTemplate = v7.phoneNumberDiscoverabilityUpsellNotNow, 
                sourceContentId = v2.phoneNumberDiscoverabilityUpsell.notNowSourceContentId
            }, 
            {
                consentStringTemplate = v7.phoneNumberDiscoverabilityUpsellTurnOn, 
                sourceContentId = v2.phoneNumberDiscoverabilityUpsell.turnOnSourceContentId
            }, 
            {
                consentStringTemplate = v7.phoneNumberDiscoverabilityUpsellTitle, 
                sourceContentId = v2.phoneNumberDiscoverabilityUpsell.titleSourceContentId
            }, 
            {
                consentStringTemplate = v7.phoneNumberDiscoverabilityUpsellContent, 
                sourceContentId = v2.phoneNumberDiscoverabilityUpsell.contentSourceContentId
            }
        }, 
        [v4.PhotoToAvatar] = {
            {
                consentStringTemplate = v7.photoToAvatarTitle, 
                sourceContentId = v2.photoToAvatar.titleSourceContentId
            }, 
            {
                consentStringTemplate = v7.photoToAvatarBodyText, 
                sourceContentId = v2.photoToAvatar.bodyTextSourceContentId
            }, 
            {
                consentStringTemplate = v7.photoToAvatarPrivacyLinkText, 
                sourceContentId = v2.photoToAvatar.privacyLinkTextSourceContentId
            }, 
            {
                consentStringTemplate = v7.photoToAvatarAgreeButton, 
                sourceContentId = v2.photoToAvatar.agreeButtonSourceContentId
            }, 
            {
                consentStringTemplate = v7.photoToAvatarCancelButton, 
                sourceContentId = v2.photoToAvatar.cancelButtonSourceContentId
            }
        }
    })[v6];
    if v8 then
        return v8;
    else
        return {};
    end;
end;
local function v22(v10, v11, v12) --[[ Line: 98 ]] --[[ Name: getAuditHeaderValue ]]
    -- upvalues: v1 (copy)
    local v13 = {};
    for _, v15 in ipairs(v10) do
        local v16 = {
            hash = v1.hashStringWithFnv1a32(v15.consentStringTemplate)
        };
        if v15.vars ~= nil then
            for v17, v18 in pairs(v15.vars) do
                v16[v17] = v18;
            end;
        end;
        v13[v15.sourceContentId] = v16;
    end;
    local v19 = {
        surface = v11, 
        content = v13
    };
    if v12 then
        for v20, v21 in pairs(v12) do
            v19[v20] = v21;
        end;
    end;
    return game:GetService("HttpService"):JSONEncode(v19);
end;
return {
    getAuditDataForConsent = v9, 
    getAuditHeaderValue = v22, 
    getEncodedAuditHeader = function(v23, v24, v25, v26) --[[ Line: 138 ]] --[[ Name: getEncodedAuditHeader ]]
        -- upvalues: v9 (copy), v22 (copy), l_Base64_0 (copy)
        local v27 = v9(v23, v24);
        local v28 = v22(v27, v25, v26);
        return (l_Base64_0.EncodeUrl(v28));
    end
};