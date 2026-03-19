local l_Parent_0 = script:FindFirstAncestor("CrossExperienceVoice").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v6 = require(script.Parent.EventNames);
local v7 = {
    cevJoinAttemptId = v2.identity, 
    clientTimeStamp = v2.identity
};
return {
    [v6.PartyVoiceStateChanged] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceStateChanged, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity, 
            detail = v2.identity, 
            voiceSessionId = v2.identity, 
            voiceChannelId = v2.identity, 
            status = v2.identity, 
            previousStatus = v2.identity, 
            activeDm = v2.identity
        })
    }, 
    [v6.PartyVoiceJoinAttempt] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceJoinAttempt, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity, 
            targetPlaceId = v2.identity, 
            isConnected = v2.identity, 
            activeDm = v2.identity
        })
    }, 
    [v6.PartyVoiceJoinFailure] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceJoinFailure, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity, 
            errorMessage = v2.identity
        })
    }, 
    [v6.PartyVoiceConnectedParticipantsOnJoin] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceConnectedParticipantsOnJoin, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity, 
            status = v2.identity, 
            voiceChannelId = v2.identity, 
            voiceSessionId = v2.identity, 
            voicePlaySessionId = v2.identity, 
            participants = v2.identity, 
            numberActive = v2.identity, 
            activeDm = v2.identity
        })
    }, 
    [v6.PartyVoiceUnmuteParticipant] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceUnmuteParticipant, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity
        })
    }, 
    [v6.PartyVoiceMuteParticipant] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceMuteParticipant, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity
        })
    }, 
    [v6.PartyVoiceBlockParticipant] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceBlockParticipant, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity
        })
    }, 
    [v6.PartyVoiceUnblockParticipant] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceUnblockParticipant, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            userId = v2.identity, 
            partyId = v2.identity
        })
    }, 
    [v6.PartyVoiceOnCrossExperienceStartedSignalReceived] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceOnCrossExperienceStartedSignalReceived, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            hasExperienceStarted = v2.identity, 
            isActiveDM = v2.identity
        })
    }, 
    [v6.PartyVoiceStateChangeHandlerRun] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceStateChangeHandlerRun, 
        formatRulesForAdditionalInfo = v1.Dictionary.union(v7, {
            isActiveDM = v2.identity, 
            status = v2.identity, 
            detail = v2.identity
        })
    }
};