local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
return {
    AppSquadEventReceiver = l_createLazyComponent_0(function() --[[ Line: 8 ]]
        return (require(script.AppSquadEventReceiver));
    end), 
    ScheduledSquadsListSheet = l_createLazyComponent_0(function() --[[ Line: 11 ]]
        return (require(script.ScheduledSquads.ScheduledSquadsListSheet));
    end), 
    ScheduledSquadsMoreInfoSheet = l_createLazyComponent_0(function() --[[ Line: 14 ]]
        return (require(script.ScheduledSquads.ScheduledSquadsMoreInfoSheet));
    end), 
    SquadComponentAccessWrapper = l_createLazyComponent_0(function() --[[ Line: 17 ]]
        return (require(script.SquadComponentAccessWrapper));
    end), 
    SquadInviteFriends = l_createLazyComponent_0(function() --[[ Line: 20 ]]
        return (require(script.SquadInviteFriends));
    end), 
    SquadJoinButton = l_createLazyComponent_0(function() --[[ Line: 23 ]]
        return (require(script.SquadJoinButton));
    end), 
    SquadLobby = l_createLazyComponent_0(function() --[[ Line: 26 ]]
        return (require(script.SquadLobby));
    end), 
    SquadTopBanner = l_createLazyComponent_0(function() --[[ Line: 29 ]]
        return (require(script.SquadTopBanner));
    end), 
    SquadVoiceAbuseReportScreen = l_createLazyComponent_0(function() --[[ Line: 32 ]]
        return (require(script.SquadVoiceAbuseReportScreen));
    end)
};