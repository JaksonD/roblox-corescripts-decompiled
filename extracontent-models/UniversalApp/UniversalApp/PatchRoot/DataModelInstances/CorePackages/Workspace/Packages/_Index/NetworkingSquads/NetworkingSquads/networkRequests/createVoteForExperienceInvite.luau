local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.POST({
        Name = "VoteForExperienceInvite"
    }, function(v3, v4) --[[ Line: 9 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("group-up"):path("v1"):path("vote-for-experience-invite"):body({
            experienceInviteId = v4.experienceInviteId, 
            membershipEntityId = v4.membershipEntityId, 
            voteIdentifier = v4.voteIdentifier, 
            voteType = v4.voteType
        });
    end));
end;