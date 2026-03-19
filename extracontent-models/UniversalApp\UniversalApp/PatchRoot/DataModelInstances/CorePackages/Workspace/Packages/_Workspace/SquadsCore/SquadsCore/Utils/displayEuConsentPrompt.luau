local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_default_0 = require(l_Parent_0.CrossExperienceVoice).CrossExperienceVoiceManager.default;
local l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY;
local l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY;
local v6 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local l_setTableAppStorageKey_0 = require(l_script_FirstAncestor_0.Utils.appStorageAccess).setTableAppStorageKey;
return function(v8, v9, v10, v11) --[[ Line: 13 ]]
    -- upvalues: v6 (copy), l_setTableAppStorageKey_0 (copy), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (copy), l_HttpService_0 (copy), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (copy), l_default_0 (copy)
    return function(v12) --[[ Line: 19 ]]
        -- upvalues: v8 (copy), v6 (ref), v10 (copy), v9 (copy), v11 (copy), l_setTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (ref), l_HttpService_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), l_default_0 (ref)
        v8(v12, {
            promptType = v6.EuVoiceConsentPrompt, 
            onConfirm = function() --[[ Line: 22 ]] --[[ Name: onConfirm ]]
                -- upvalues: v10 (ref), v9 (ref), v11 (ref), l_setTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (ref), l_HttpService_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), l_default_0 (ref)
                v10[v9] = true;
                v11[v9] = true;
                l_setTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0, l_HttpService_0:JSONEncode(v10));
                l_setTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0, l_HttpService_0:JSONEncode(v11));
                l_default_0.default.VoiceEuModalConsented:Fire();
            end, 
            onCancel = function() --[[ Line: 32 ]] --[[ Name: onCancel ]]
                -- upvalues: v10 (ref), v9 (ref), l_setTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (ref), l_HttpService_0 (ref), l_default_0 (ref)
                v10[v9] = true;
                l_setTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0, l_HttpService_0:JSONEncode(v10));
                l_default_0.default.VoiceEuModalRefused:Fire();
            end
        });
    end;
end;