local _ = require(script.Parent.networkingSquadTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createCreateOrJoinSquad);
local v3 = require(l_networkRequests_0.createGetSquadActive);
local v4 = require(l_networkRequests_0.createGetSquadFromSquadId);
local v5 = require(l_networkRequests_0.createJoinSquad);
local v6 = require(l_networkRequests_0.createActOnPartyNudge);
local v7 = require(l_networkRequests_0.createLeaveSquad);
local v8 = require(l_networkRequests_0.createSquadInvite);
local v9 = require(l_networkRequests_0.createCreateExperienceInvite);
local v10 = require(l_networkRequests_0.createGetExperienceInvite);
local v11 = require(l_networkRequests_0.createVoteForExperienceInvite);
local v12 = require(l_networkRequests_0.createSendSquadVoiceAbuseReport);
local v13 = require(l_networkRequests_0.createReinviteToSquad);
local v14 = require(l_networkRequests_0.createSetRegroupPromptShown);
return function(v15) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy), v14 (copy)
    return {
        CreateOrJoinSquad = v2(v15), 
        GetSquadActive = v3(v15), 
        GetSquadFromSquadId = v4(v15), 
        JoinSquad = v5(v15), 
        ActOnPartyNudge = v6(v15), 
        LeaveSquad = v7(v15), 
        SquadInvite = v8(v15), 
        CreateExperienceInvite = v9(v15), 
        GetExperienceInvite = v10(v15), 
        VoteForExperienceInvite = v11(v15), 
        ReinviteToSquad = v13(v15), 
        SendSquadVoiceAbuseReport = v12(v15), 
        SetRegroupPromptShown = v14(v15)
    };
end;