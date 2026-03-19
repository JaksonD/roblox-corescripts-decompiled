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
return function(v20, v21) --[[ Line: 25 ]] --[[ Name: useSquadUserDropdownMenuButtons ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_React_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_Constants_0 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (copy), l_dependencyArray_0 (copy)
    local v22 = l_useLocalUserId_0();
    local v23 = tostring(v22) == tostring(v20);
    local v24 = nil;
    local v25 = nil;
    local v26 = false;
    local v27 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v28 = if v20 then tonumber(v20) else nil;
        v24 = l_useBackgroundExperience_0();
        v25 = l_React_0.useMemo(function() --[[ Line: 38 ]]
            -- upvalues: v24 (ref)
            if v24 then
                return v24.voiceChannelId;
            else
                return nil;
            end;
        end, {
            v24
        });
        if v28 then
            local v29 = l_useIsLocalPlayerPartyVoiceEligible_0();
            local v30 = l_useIsUserPartyVoiceEligible_0(v28);
            local v31 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
            v26 = v31 and v29 and not v30;
            v27 = v29 and v31 and v30 and not v23;
        end;
    end;
    local v32 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v33 = l_useCurrentSquadParentChannelId_0();
    local v34 = v32.useGetConversationFromId(v33 or "");
    local v36 = l_React_0.useCallback(function(v35) --[[ Line: 61 ]]
        -- upvalues: v20 (copy)
        return v35.Squad.Presence.byUserId[tostring(v20)];
    end, {
        v20
    });
    local v37 = l_useSelector_0(v36);
    return l_React_0.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v26 (ref), v37 (copy), l_PresenceType_0 (ref), v34 (copy), l_Constants_0 (ref), v22 (copy), v21 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (ref), v25 (ref), v23 (copy), v27 (ref)
        local v38 = {
            VoiceIneligibleButton = v26, 
            JoinButton = v37 and v37.userPresenceType == l_PresenceType_0.InGame and v37.placeId and v37.gameId ~= game.JobId, 
            RemoveUserButton = v34 and v34.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v34.initiator == v22, 
            ViewProfileButton = not v21, 
            ReportButton = l_getFFlagEnableCrossExpVoiceAbuseReport_0() and v25 and not v23, 
            MuteVoiceButton = v27
        };
        local v39 = {};
        for v40, v41 in v38 do
            if v41 then
                table.insert(v39, v40);
            end;
        end;
        return v39;
    end, l_dependencyArray_0(v26, v21, v25, v23, v37, v34, v22, v27));
end;