local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.POST({
        Name = "ActOnPartyNudge"
    }, function(v3, v4) --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("group-up"):path("v1"):path("act-on-party-nudge"):body({
            action = v4.action, 
            nudgeId = v4.nudgeId, 
            squadId = v4.squadId, 
            leaveExisting = v4.leaveExisting, 
            partyAttemptId = v4.partyAttemptId, 
            squadLocation = v4.squadLocation, 
            parentChannelId = v4.parentChannelId, 
            universeId = if game.GameId > 0 then game.GameId else nil, 
            placeId = if game.PlaceId > 0 then game.PlaceId else nil, 
            gameInstanceId = if game.JobId ~= "" then game.JobId else nil
        });
    end));
end;