local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
return {
    [v5.EnterSquadButtonPressed] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.EnterSquadButtonPressed, 
        formatRulesForAdditionalInfo = {
            conversationId = v1.identity, 
            partyAttemptId = v1.identity, 
            squadButtonSource = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            userIntention = v1.identity
        }
    }, 
    [v5.MultiInviteMenuActionStatus] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.MultiInviteMenuActionStatus, 
        formatRulesForAdditionalInfo = {
            actionLocation = v1.identity, 
            actionType = v1.identity, 
            activeFriendsPresences = v1.identity, 
            activeFriendsUserIds = v1.identity, 
            clientTimeStamp = v1.identity, 
            numActiveFriends = v1.identity, 
            numSelectedFriends = v1.identity, 
            partyAttemptId = v1.identity, 
            selectedFriendsPresences = v1.identity, 
            selectedFriendsUserIds = v1.identity, 
            selectionPageType = v1.identity, 
            squadId = v1.identity
        }
    }, 
    [v5.NoResponseInviteAgainOrAddOthers] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.NoResponseInviteAgainOrAddOthers, 
        formatRulesForAdditionalInfo = {
            actionType = v1.identity, 
            conversationId = v1.identity, 
            button = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.PartySheetAction] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.PartySheetAction, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            actionType = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            isFtuxTooltipShown = v1.identity, 
            voiceStatus = v1.identity
        }
    }, 
    [v5.PartyCoplay] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.PartyCoplay, 
        formatRulesForAdditionalInfo = {
            partyCoplayEvent = v1.identity, 
            partyId = v1.identity, 
            partyPlayersInGameInstanceCount = v1.identity, 
            partyPlayersInGameInstanceUserIds = v1.identity, 
            partyTotalSize = v1.identity, 
            partyTotalSizeUserIds = v1.identity
        }
    }, 
    [v5.SquadInvitePageNavSource] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadInvitePageNavSource, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            inviteNavSource = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.SquadExperienceInviteStateChange] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadExperienceInviteStateChange, 
        formatRulesForAdditionalInfo = {
            experienceInviteId = v1.identity, 
            invitationGameInstanceId = v1.identity, 
            invitationPlaceId = v1.identity, 
            inviterId = v1.identity, 
            inviteState = v1.identity, 
            parentChannelId = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            joinAttemptId = v1.identity
        }
    }, 
    [v5.SquadExperienceInviteApiCall] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadExperienceInviteApiCall, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            experienceInviteId = v1.identity, 
            invitationPlaceId = v1.identity, 
            isSuccess = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            squadMembers = v1.identity, 
            squadMembersCount = v1.identity
        }
    }, 
    [v5.SquadInvite] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadInvite, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            inviteeCount = v1.identity, 
            inviteeUserIds = v1.identity, 
            isSuccess = v1.identity, 
            source = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            userId = v1.identity
        }
    }, 
    [v5.SquadVoteApiCall] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadVoteApiCall, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            errorMessage = v1.identity, 
            errorType = v1.identity, 
            experienceInviteId = v1.identity, 
            isSuccess = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            voteType = v1.identity
        }
    }, 
    [v5.SquadToastActions] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadToastActions, 
        formatRulesForAdditionalInfo = {
            experienceInviteId = v1.identity, 
            parentChannelId = v1.identity, 
            partyAttemptId = v1.identity, 
            nudgeId = v1.identity, 
            nudgeType = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity, 
            toastAction = v1.identity, 
            toastType = v1.identity
        }
    }, 
    [v5.SquadTopBannerClicked] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadTopBannerClicked, 
        formatRulesForAdditionalInfo = {
            parentChannelId = v1.identity, 
            squadId = v1.identity, 
            squadMembers = v1.identity, 
            timePassedSinceLastStateUpdatedInSec = v1.identity
        }
    }, 
    [v5.SquadCreateOrJoinFromRCC] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadCreateOrJoinFromRCC, 
        formatRulesForAdditionalInfo = {
            partySourceType = v1.identity, 
            nudgeId = v1.identity, 
            nudgeType = v1.identity, 
            partyAttemptId = v1.identity, 
            inviteeUserIds = v1.identity
        }
    }, 
    [v5.SquadPromptResponded] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadPromptResponded, 
        formatRulesForAdditionalInfo = {
            promptType = v1.identity, 
            responseType = v1.identity, 
            scheduledSquadId = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.ScheduledSquadAction] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.ScheduledSquadAction, 
        formatRulesForAdditionalInfo = {
            actionType = v1.identity, 
            conversationId = v1.identity, 
            scheduledSquadId = v1.identity, 
            source = v1.identity, 
            squadId = v1.identity, 
            squadLocation = v1.identity
        }
    }, 
    [v5.SquadRegroupButtonClicked] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadRegroupButtonClicked, 
        formatRulesForAdditionalInfo = {
            clientTimestamp = v1.identity, 
            squadId = v1.identity, 
            initiatorId = v1.identity, 
            gameInstanceId = v1.identity, 
            rootPlaceId = v1.identity, 
            placeId = v1.identity, 
            universeId = v1.identity, 
            playSessionId = v1.identity, 
            experienceInviteId = v1.identity, 
            button = v1.identity, 
            entryPoint = v1.identity
        }
    }, 
    [v5.SquadRegroupPromptShown] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadRegroupPromptShown, 
        formatRulesForAdditionalInfo = {
            clientTimestamp = v1.identity, 
            squadId = v1.identity, 
            initiatorId = v1.identity, 
            gameInstanceId = v1.identity, 
            rootPlaceId = v1.identity, 
            placeId = v1.identity, 
            universeId = v1.identity, 
            playSessionId = v1.identity, 
            experienceInviteId = v1.identity, 
            button = v1.identity, 
            entryPoint = v1.identity
        }
    }, 
    [v5.SquadRegroupPromptClicked] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadRegroupPromptClicked, 
        formatRulesForAdditionalInfo = {
            clientTimestamp = v1.identity, 
            squadId = v1.identity, 
            initiatorId = v1.identity, 
            gameInstanceId = v1.identity, 
            rootPlaceId = v1.identity, 
            placeId = v1.identity, 
            universeId = v1.identity, 
            playSessionId = v1.identity, 
            experienceInviteId = v1.identity, 
            button = v1.identity, 
            entryPoint = v1.identity
        }
    }, 
    [v5.SquadExperienceInviteImpression] = {
        context = l_Contexts_0.Squads, 
        eventType = l_EventTypes_0.SquadExperienceInviteImpression, 
        formatRulesForAdditionalInfo = {
            experienceInviteId = v1.identity, 
            notificationId = v1.identity, 
            clientTimestamp = v1.identity
        }
    }
};