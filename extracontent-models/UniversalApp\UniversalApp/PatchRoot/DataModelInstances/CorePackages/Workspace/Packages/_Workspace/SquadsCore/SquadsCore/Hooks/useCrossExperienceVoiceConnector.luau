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
local v32 = game:DefineFastInt("PartyVoiceRestrictionStatusMaxAttempts", 10);
useCrossExperienceVoiceConnector = function() --[[ Line: 46 ]] --[[ Name: useCrossExperienceVoiceConnector ]]
    -- upvalues: l_Players_0 (copy), v11 (copy), v4 (copy), l_useDispatch_0 (copy), v14 (copy), v7 (copy), l_useStore_0 (copy), v6 (copy), l_useIsBackgroundDMActive_0 (copy), l_FFlagIntroLocalUserCEVEligibleLoadState_0 (copy), v5 (copy), l_useIsVoiceRetriableError_0 (copy), v31 (copy), l_ThirdPartyUserService_0 (copy), v30 (copy), v32 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_FFlagEnableVoiceEuConsentPrompt_0 (copy), l_getTableAppStorageKey_0 (copy), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (copy), l_dependencyArray_0 (copy), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (copy), v9 (copy), l_default_0 (copy), l_FFlagDisconnectOnBackgroundDmPassiveState_0 (copy), v8 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy)
    local v33 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    local v34 = v11() or "";
    local v35 = v4(v33);
    local v36 = l_useDispatch_0();
    local v37 = v14.useContext(v7);
    local v38 = l_useStore_0();
    local v39 = v14.useRef(nil);
    local v40 = v6();
    local v41 = l_useIsBackgroundDMActive_0();
    local v42 = nil;
    local v43 = nil;
    if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then
        local v44, v45 = v5();
        v42 = v44;
        v43 = v45;
    else
        v42 = v5();
    end;
    local v46 = l_useIsVoiceRetriableError_0();
    local v47 = nil;
    local v48 = nil;
    if v31 then
        local v49, v50 = v14.useState(if l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsChatRestrictionSupported() then l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus() else Enum.ChatRestrictionStatus.NotRestricted);
        v47 = v49;
        v48 = v50;
    end;
    local v51, v52 = v14.useState(false);
    local v53 = v34 and v34 ~= "" and v35 and not v41 and v40 and v42 and not v46 and (not v31 or v47 == Enum.ChatRestrictionStatus.NotRestricted);
    local v54 = if v30 then (not (v34 and v34 ~= "" and v35) or (if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then v40 == false else not v40) or (if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then not v43 and not v42 else not v42) or v46) and v41 else false;
    if v31 then
        v14.useEffect(function() --[[ Line: 97 ]]
            -- upvalues: v47 (ref), l_ThirdPartyUserService_0 (ref), v48 (ref), v32 (ref), l_setInterval_0 (ref), l_clearInterval_0 (ref)
            if v47 ~= Enum.ChatRestrictionStatus.Unknown then
                return;
            elseif not l_ThirdPartyUserService_0 or not l_ThirdPartyUserService_0:IsChatRestrictionSupported() then
                v48(Enum.ChatRestrictionStatus.NotRestricted);
                return;
            else
                local v55 = 0;
                local v57 = l_setInterval_0(function() --[[ Line: 108 ]]
                    -- upvalues: v55 (ref), l_ThirdPartyUserService_0 (ref), v48 (ref), v32 (ref)
                    v55 = v55 + 1;
                    local l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 = l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus();
                    if l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 == Enum.ChatRestrictionStatus.NotRestricted or l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0 == Enum.ChatRestrictionStatus.Restricted then
                        v48(l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_0);
                        return;
                    else
                        if v32 <= v55 then
                            v48(Enum.ChatRestrictionStatus.Restricted);
                        end;
                        return;
                    end;
                end, 4000);
                v55 = v55 + 1;
                local l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 = l_ThirdPartyUserService_0:GetVoiceChatRestrictionStatus();
                if l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 == Enum.ChatRestrictionStatus.NotRestricted or l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1 == Enum.ChatRestrictionStatus.Restricted then
                    v48(l_l_ThirdPartyUserService_0_VoiceChatRestrictionStatus_1);
                elseif v32 <= v55 then
                    v48(Enum.ChatRestrictionStatus.Restricted);
                end;
                return function() --[[ Line: 125 ]]
                    -- upvalues: l_clearInterval_0 (ref), v57 (copy)
                    l_clearInterval_0(v57);
                end;
            end;
        end, {
            v47
        });
    end;
    v14.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v53 (copy), l_getTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), v33 (copy), v52 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 and v53 and l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0)[tostring(v33)] then
            v52(true);
        end;
    end, l_dependencyArray_0(v33, v53));
    v14.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v53 (copy), v33 (copy), l_getTableAppStorageKey_0 (ref), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (ref), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (ref), v36 (copy), v9 (ref), v37 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 and v53 then
            local v59 = tostring(v33);
            local v60 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0);
            if not v60[v59] then
                local v61 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0);
                v36(v9(v37.setSquadPrompt, v59, v60, v61));
            end;
        end;
    end, l_dependencyArray_0(v33, v9, v53, v37.setSquadPrompt));
    v14.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: l_FFlagEnableVoiceEuConsentPrompt_0 (ref), l_default_0 (ref), v52 (copy)
        if l_FFlagEnableVoiceEuConsentPrompt_0 then
            local v62 = l_default_0.VoiceEuModalConsented.Event:Connect(function() --[[ Line: 172 ]]
                -- upvalues: v52 (ref)
                v52(true);
            end);
            return function() --[[ Line: 176 ]]
                -- upvalues: v62 (copy)
                v62:Disconnect();
            end;
        else
            return function() --[[ Line: 180 ]]

            end;
        end;
    end, {});
    v14.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: v41 (copy), l_default_0 (ref), l_FFlagDisconnectOnBackgroundDmPassiveState_0 (ref)
        if v41 then
            l_default_0:setAsConnected();
            return;
        else
            if l_FFlagDisconnectOnBackgroundDmPassiveState_0 then
                l_default_0:setAsDisconnected();
            end;
            return;
        end;
    end, {
        v41
    });
    local v66 = v14.useCallback(function(v63, v64, v65) --[[ Line: 191 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:join({
            partyId = v63, 
            force = v64, 
            shouldIgnoreMemoryWarning = v65
        });
    end, {});
    v14.useEffect(function() --[[ Line: 200 ]]
        -- upvalues: v53 (copy), l_FFlagEnableVoiceEuConsentPrompt_0 (ref), v51 (copy), l_default_0 (ref), v66 (copy), v34 (copy), v37 (copy), v38 (copy), v8 (ref)
        if not v53 or l_FFlagEnableVoiceEuConsentPrompt_0 and not v51 then
            return;
        elseif l_default_0:performJoinFeasibilityCheck() then
            v66(v34);
            return;
        else
            v37.setSquadPrompt(v38, {
                hideCancelButton = false, 
                promptType = v8.JoinWithLowMemory, 
                onConfirm = function() --[[ Line: 213 ]] --[[ Name: onConfirm ]]

                end, 
                onCancel = function() --[[ Line: 214 ]] --[[ Name: onCancel ]]
                    -- upvalues: v66 (ref), v34 (ref)
                    v66(v34, true, true);
                end
            });
            return;
        end;
    end, {
        v53, 
        if l_FFlagEnableVoiceEuConsentPrompt_0 then v51 else nil
    });
    local v67 = v14.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:leave();
    end, {});
    v14.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v30 (ref), v54 (copy), v67 (copy)
        if v30 and v54 then
            v67();
        end;
    end, {
        v54, 
        v67
    });
    v14.useEffect(function() --[[ Line: 234 ]]
        -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v39 (copy), l_default_0 (ref), v37 (copy), v38 (copy), v8 (ref), v67 (copy)
        if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            return function() --[[ Line: 236 ]]

            end;
        else
            local function _() --[[ Line: 239 ]]
                -- upvalues: v39 (ref)
                if v39.current then
                    v39.current:Disconnect();
                    v39.current = nil;
                end;
            end;
            v39.current = l_default_0.MemoryLow.Event:Connect(function() --[[ Line: 246 ]]
                -- upvalues: v39 (ref), v37 (ref), v38 (ref), v8 (ref), v67 (ref)
                if v39.current then
                    v39.current:Disconnect();
                    v39.current = nil;
                end;
                v37.setSquadPrompt(v38, {
                    hideCancelButton = false, 
                    promptType = v8.DisconnectVoiceDueToLowMemory, 
                    onConfirm = function() --[[ Line: 253 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v67 (ref)
                        v67();
                    end
                });
            end);
            return function() --[[ Line: 258 ]]
                -- upvalues: v39 (ref)
                if v39.current then
                    v39.current:Disconnect();
                    v39.current = nil;
                end;
            end;
        end;
    end);
    return v67;
end;
return useCrossExperienceVoiceConnector;