local l_Players_0 = game:GetService("Players");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(script.Parent.useCurrentSquadMember);
local v5 = require(script.Parent.useIsLocalPlayerPartyVoiceEligible);
local v6 = require(script.Parent.useIsCurrentSquadPartyVoiceEligible);
local v7 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v8 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v9 = require(l_script_FirstAncestor_0.Utils.displayEuConsentPrompt);
local l_getTableAppStorageKey_0 = require(l_script_FirstAncestor_0.Utils.appStorageAccess).getTableAppStorageKey;
local v11 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v12 = require(l_Parent_0.CrossExperienceVoice);
local v13 = require(l_Parent_0.LuauPolyfill);
local v14 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local v18 = require(l_Parent_0.SharedFlags);
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = v18.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_FFlagDisconnectOnBackgroundDmPassiveState_0 = v18.FFlagDisconnectOnBackgroundDmPassiveState;
local l_FFlagEnableVoiceEuConsentPrompt_0 = v18.FFlagEnableVoiceEuConsentPrompt;
local l_FFlagIntroLocalUserCEVEligibleLoadState_0 = v18.FFlagIntroLocalUserCEVEligibleLoadState;
local l_clearInterval_0 = v13.clearInterval;
local l_setInterval_0 = v13.setInterval;
local l_default_0 = v12.CrossExperienceVoiceManager.default;
local l_useIsBackgroundDMActive_0 = v12.Hooks.useIsBackgroundDMActive;
local l_useIsVoiceRetriableError_0 = v12.Hooks.useIsVoiceRetriableError;
local l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY;
local l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY;
local v30 = game:DefineFastFlag("EnableDisconnectPartyVoiceIfNeeded", false);
local v31 = game:DefineFastFlag("EnablePartyVoiceRestrictionStatus", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v18.FFlagRemoveDependencyArrayAntipattern;
local v33 = game:DefineFastInt("PartyVoiceRestrictionStatusMaxAttempts", 10);
useCrossExperienceVoiceConnector = function() --[[ Line: 48 ]] --[[ Name: useCrossExperienceVoiceConnector ]]
    -- upvalues: l_Players_0 (copy), v11 (copy), v4 (copy), l_useDispatch_0 (copy), v14 (copy), v7 (copy), l_useStore_0 (copy), v6 (copy), l_useIsBackgroundDMActive_0 (copy), l_FFlagIntroLocalUserCEVEligibleLoadState_0 (copy), v5 (copy), l_useIsVoiceRetriableError_0 (copy), v31 (copy), l_ThirdPartyUserService_0 (copy), v30 (copy), v33 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagEnableVoiceEuConsentPrompt_0 (copy), l_getTableAppStorageKey_0 (copy), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (copy), v9 (copy), l_default_0 (copy), l_FFlagDisconnectOnBackgroundDmPassiveState_0 (copy), v8 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy)
    local v34 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    local v35 = v11() or "";
    local v36 = v4(v34);
    local v37 = l_useDispatch_0();
    local v38 = v14.useContext(v7);
    local v39 = l_useStore_0();
    local v40 = v14.useRef(nil);
    local v41 = v6();
    local v42 = l_useIsBackgroundDMActive_0();
    local v43 = nil;
    local v44 = nil;
    if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then
        local v45, v46 = v5();
        v43 = v45;
        v44 = v46;
    else
        v43 = v5();
    end;
    local v47 = l_useIsVoiceRetriableError_0();
    local v48 = nil;
    local v49 = nil;
    if v31 then
        local v50, v51 = v14.useState(if l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() then l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus() else Enum.ChatRestrictionStatus.NotRestricted);
        v48 = v50;
        v49 = v51;
    end;
    local v52, v53 = v14.useState(false);
    local v54 = v35 and v35 ~= "" and v36 and not v42 and v41 and v43 and not v47 and (not v31 or v48 == Enum.ChatRestrictionStatus.NotRestricted);
    local v55 = if v30 then (not (v35 and v35 ~= "" and v36) or (if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then v41 == false else not v41) or (if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then not v44 and not v43 else not v43) or v47) and v42 else false;
    if v31 then
        v14.useEffect(function() --[[ Line: 99 ]]
            -- upvalues: v48 (ref), l_ThirdPartyUserService_0 (ref), v49 (ref), v33 (ref), l_setInterval_0 (ref), l_clearInterval_0 (ref)
            if v48 ~= Enum.ChatRestrictionStatus.Unknown then
                return;
            elseif not l_ThirdPartyUserService_0 or not l_ThirdPartyUserService_0:IsChatRestrictionSupported() then
                v49(Enum.ChatRestrictionStatus.NotRestricted);
                return;
            else
                local v56 = 0;
                local v58 = l_setInterval_0(function() --[[ Line: 110 ]]
                    -- upvalues: v56 (ref), l_ThirdPartyUserService_0 (ref), v49 (ref), v33 (ref)
                    v56 = v56 + 1;
                    local l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 = l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus();
                    if l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 == Enum.ChatRestrictionStatus.NotRestricted or l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 == Enum.ChatRestrictionStatus.Restricted then
                        v49(l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0);
                        return;
                    else
                        if v33 <= v56 then
                            v49(Enum.ChatRestrictionStatus.Restricted);
                        end;
                        return;
                    end;
                end, 4000);
                v56 = v56 + 1;
                local l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 = l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus();
                if l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 == Enum.ChatRestrictionStatus.NotRestricted or l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 == Enum.ChatRestrictionStatus.Restricted then
                    v49(l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1);
                elseif v33 <= v56 then
                    v49(Enum.ChatRestrictionStatus.Restricted);
                end;
                return function() --[[ Line: 127 ]]
                    -- upvalues: l_clearInterval_0 (ref), v58 (copy)
                    l_clearInterval_0(v58);
                end;
            end;
        end, {
            v48
        });
    end;
    v14.useEffect(function() --[[ Line: 135 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v54 (copy), l_getTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), v34 (copy), v53 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 and v54 and l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0)[tostring(v34)] then
            v53(true);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34, 
        v54
    } else l_dependencyArray_0(v34, v54));
    v14.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v54 (copy), v34 (copy), l_getTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), v37 (copy), v9 (ref), v38 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 and v54 then
            local v60 = tostring(v34);
            local v61 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0);
            if not v61[v60] then
                local v62 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0);
                v37(v9(v38.setSquadPrompt, v60, v61, v62));
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34, 
        v9, 
        v54, 
        v38.setSquadPrompt
    } else l_dependencyArray_0(v34, v9, v54, v38.setSquadPrompt));
    v14.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), l_default_0 (ref), v53 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 then
            local v63 = l_default_0.VoiceEuModalConsented.Event:Connect(function() --[[ Line: 186 ]]
                -- upvalues: v53 (ref)
                v53(true);
            end);
            return function() --[[ Line: 190 ]]
                -- upvalues: v63 (copy)
                v63:Disconnect();
            end;
        else
            return function() --[[ Line: 194 ]]

            end;
        end;
    end, {});
    v14.useEffect(function() --[[ Line: 197 ]]
        -- upvalues: v42 (copy), l_default_0 (ref), l_FFlagDisconnectOnBackgroundDmPassiveState_0 (ref)
        if v42 then
            l_default_0:setAsConnected();
            return;
        else
            if l_FFlagDisconnectOnBackgroundDmPassiveState_0 then
                l_default_0:setAsDisconnected();
            end;
            return;
        end;
    end, {
        v42
    });
    local v67 = v14.useCallback(function(v64, v65, v66) --[[ Line: 205 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:join({
            partyId = v64, 
            force = v65, 
            shouldIgnoreMemoryWarning = v66
        });
    end, {});
    v14.useEffect(function() --[[ Line: 214 ]]
        -- upvalues: v54 (copy), l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v52 (copy), l_default_0 (ref), v67 (copy), v35 (copy), v38 (copy), v39 (copy), v8 (ref)
        if not v54 or l_FFlagEnableVoiceEuConsentPrompt_0 and not v52 then
            return;
        elseif l_default_0:performJoinFeasibilityCheck() then
            v67(v35);
            return;
        else
            v38.setSquadPrompt(v39, {
                hideCancelButton = false, 
                promptType = v8.JoinWithLowMemory, 
                onConfirm = function() --[[ Line: 227 ]] --[[ Name: onConfirm ]]

                end, 
                onCancel = function() --[[ Line: 228 ]] --[[ Name: onCancel ]]
                    -- upvalues: v67 (ref), v35 (ref)
                    v67(v35, true, true);
                end
            });
            return;
        end;
    end, {
        v54, 
        if l_FFlagEnableVoiceEuConsentPrompt_0 then v52 else nil
    });
    local v68 = v14.useCallback(function() --[[ Line: 237 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:leave();
    end, {});
    v14.useEffect(function() --[[ Line: 241 ]]
        -- upvalues: v30 (ref), v55 (copy), v68 (copy)
        if v30 and v55 then
            v68();
        end;
    end, {
        v55, 
        v68
    });
    v14.useEffect(function() --[[ Line: 248 ]]
        -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v40 (copy), l_default_0 (ref), v38 (copy), v39 (copy), v8 (ref), v68 (copy)
        if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            return function() --[[ Line: 250 ]]

            end;
        else
            local function _() --[[ Line: 253 ]]
                -- upvalues: v40 (ref)
                if v40.current then
                    v40.current:Disconnect();
                    v40.current = nil;
                end;
            end;
            v40.current = l_default_0.MemoryLow.Event:Connect(function() --[[ Line: 260 ]]
                -- upvalues: v40 (ref), v38 (ref), v39 (ref), v8 (ref), v68 (ref)
                if v40.current then
                    v40.current:Disconnect();
                    v40.current = nil;
                end;
                v38.setSquadPrompt(v39, {
                    hideCancelButton = false, 
                    promptType = v8.DisconnectVoiceDueToLowMemory, 
                    onConfirm = function() --[[ Line: 267 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v68 (ref)
                        v68();
                    end
                });
            end);
            return function() --[[ Line: 272 ]]
                -- upvalues: v40 (ref)
                if v40.current then
                    v40.current:Disconnect();
                    v40.current = nil;
                end;
            end;
        end;
    end);
    return v68;
end;
return useCrossExperienceVoiceConnector;