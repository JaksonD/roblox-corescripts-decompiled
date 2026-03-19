local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteState);
local v4 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteVoteType);
local v5 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteType);
local l_FFlagEnablePrivatePartyAcceptInvite_0 = require(l_Parent_0.SharedFlags).FFlagEnablePrivatePartyAcceptInvite;
local function _(v7) --[[ Line: 12 ]] --[[ Name: getSpotsTaken ]]
    -- upvalues: v4 (copy)
    local v8 = 0;
    for v9 = 1, #v7 do
        if v7[v9].voteType == v4.Accept then
            v8 = v8 + 1;
        end;
    end;
    return v8;
end;
local v11 = {};
v11.new = function(v12) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    assert(v11.isValid(v12));
    v11.__index = v11;
    setmetatable(v12, v11);
    return v12;
end;
v11.mock = function(v13) --[[ Line: 44 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v11 (copy), v3 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (copy), v5 (copy)
    v13 = v13 or {};
    local v14 = v13.votes or {
        [1] = {
            userId = 456, 
            voteIdentifier = "voteIdentifier", 
            voteType = v4.Accept
        }
    };
    local v15 = 0;
    for v16 = 1, #v14 do
        if v14[v16].voteType == v4.Accept then
            v15 = v15 + 1;
        end;
    end;
    v15 = v11.new({
        createdAtTime = v13.createdAtTime or "2024-07-19T21:02:47.777+00:00", 
        experienceInviteId = v13.experienceInviteId or "987", 
        experienceDetail = v13.experienceDetail or {
            placeId = 15308759682, 
            gameInstanceId = "instanceId"
        }, 
        inviterId = v13.inviterId or 123456, 
        membershipEntityId = v13.membershipEntityId or "54321", 
        spotsTaken = v15, 
        state = v13.state or v3.Active, 
        totalSpots = v13.totalSpots or 6, 
        versionId = v13.version or 1, 
        votes = v14
    });
    if l_FFlagEnablePrivatePartyAcceptInvite_0 then
        v15.inviteType = v13.inviteType or v5.PlayWithPartyInPublicServer;
    end;
    return v15;
end;
v11.format = function(v17) --[[ Line: 79 ]] --[[ Name: format ]]
    -- upvalues: v11 (copy), v4 (copy), l_FFlagEnablePrivatePartyAcceptInvite_0 (copy), v5 (copy)
    local l_votes_0 = v17.votes;
    local l_new_0 = v11.new;
    local v20 = {
        createdAtTime = v17.createdAtTime, 
        experienceDetail = v17.experienceDetail, 
        experienceInviteId = v17.experienceInviteId, 
        inviterId = v17.inviterId, 
        membershipEntityId = v17.membershipEntityId
    };
    local v21 = 0;
    for v22 = 1, #l_votes_0 do
        if l_votes_0[v22].voteType == v4.Accept then
            v21 = v21 + 1;
        end;
    end;
    v20.spotsTaken = v21;
    v20.state = v17.state;
    v20.totalSpots = v17.totalSpots;
    v20.versionId = v17.versionId;
    v20.votes = l_votes_0;
    l_new_0 = l_new_0(v20);
    if l_FFlagEnablePrivatePartyAcceptInvite_0 then
        l_new_0.inviteType = v17.inviteType or v5.PlayWithPartyInPublicServer;
    end;
    return l_new_0;
end;
v11.isValid = v2.strictInterface({
    createdAtTime = v2.string, 
    experienceDetail = v2.interface({
        placeId = v2.number, 
        gameInstanceId = v2.optional(v2.string)
    }), 
    experienceInviteId = v2.string, 
    inviterId = v2.number, 
    membershipEntityId = v2.string, 
    spotsTaken = v2.number, 
    state = v2.string, 
    totalSpots = v2.number, 
    versionId = v2.number, 
    votes = v2.array(v2.interface({
        userId = v2.number, 
        voteIdentifier = v2.optional(v2.string), 
        voteType = v2.string
    })), 
    inviteType = v2.optional(v2.union(v2.literal(v5.PlayWithPartyInPublicServer), v2.literal(v5.PlayWithPartyInPrivatePartyServer)))
});
return v11;