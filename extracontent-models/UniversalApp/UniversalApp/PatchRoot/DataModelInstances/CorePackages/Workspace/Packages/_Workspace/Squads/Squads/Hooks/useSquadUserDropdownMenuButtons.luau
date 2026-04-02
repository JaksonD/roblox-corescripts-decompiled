local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CrossExperienceVoice);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_SquadsCore_0 = v4.SquadsCore;
local l_React_0 = v4.React;
local l_PresenceType_0 = v4.RoduxPresence.Enums.PresenceType;
local l_SharedFlags_0 = v4.SharedFlags;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_useIsLocalPlayerPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_useBackgroundExperience_0 = v2.Hooks.useBackgroundExperience;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useSelector_0 = v4.Hooks.useSelector;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_getFFlagEnableCrossExpVoiceAbuseReport_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceAbuseReport;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
return function(v21, v22) --[[ Line: 26 ]] --[[ Name: useSquadUserDropdownMenuButtons ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_React_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_Constants_0 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v23 = l_useLocalUserId_0();
    local v24 = tostring(v23) == tostring(v21);
    local v25 = nil;
    local v26 = nil;
    local v27 = false;
    local v28 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v29 = if v21 then tonumber(v21) else nil;
        v25 = l_useBackgroundExperience_0();
        v26 = l_React_0.useMemo(function() --[[ Line: 39 ]]
            -- upvalues: v25 (ref)
            if v25 then
                return v25.voiceChannelId;
            else
                return nil;
            end;
        end, {
            v25
        });
        if v29 then
            local v30 = l_useIsLocalPlayerPartyVoiceEligible_0();
            local v31 = l_useIsUserPartyVoiceEligible_0(v29);
            local v32 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
            v27 = v32 and v30 and not v31;
            v28 = v30 and v32 and v31 and not v24;
        end;
    end;
    local v33 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v34 = l_useCurrentSquadParentChannelId_0();
    local v35 = v33.useGetConversationFromId(v34 or "");
    local v37 = l_React_0.useCallback(function(v36) --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        return v36.Squad.Presence.byUserId[tostring(v21)];
    end, {
        v21
    });
    local v38 = l_useSelector_0(v37);
    return l_React_0.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v27 (ref), v38 (copy), l_PresenceType_0 (ref), v35 (copy), l_Constants_0 (ref), v23 (copy), v22 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (ref), v26 (ref), v24 (copy), v28 (ref)
        local v39 = {
            VoiceIneligibleButton = v27, 
            JoinButton = v38 and v38.userPresenceType == l_PresenceType_0.InGame and v38.placeId and v38.gameId ~= game.JobId, 
            RemoveUserButton = v35 and v35.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v35.initiator == v23, 
            ViewProfileButton = not v22, 
            ReportButton = l_getFFlagEnableCrossExpVoiceAbuseReport_0() and v26 and not v24, 
            MuteVoiceButton = v28
        };
        local v40 = {};
        for v41, v42 in v39 do
            if v42 then
                table.insert(v40, v41);
            end;
        end;
        return v40;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27, 
        v22, 
        v26, 
        v24, 
        v38, 
        v35, 
        v23, 
        v28
    } else l_dependencyArray_0(v27, v22, v26, v24, v38, v35, v23, v28));
end;