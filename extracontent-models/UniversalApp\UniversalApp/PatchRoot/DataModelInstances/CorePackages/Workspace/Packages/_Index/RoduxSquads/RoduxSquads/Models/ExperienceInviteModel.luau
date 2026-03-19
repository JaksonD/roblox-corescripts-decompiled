local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteState);
local v4 = require(l_script_FirstAncestor_0.Enums.ExperienceInviteVoteType);
local function _(v5) --[[ Line: 9 ]] --[[ Name: getSpotsTaken ]]
    -- upvalues: v4 (copy)
    local v6 = 0;
    for v7 = 1, #v5 do
        if v5[v7].voteType == v4.Accept then
            v6 = v6 + 1;
        end;
    end;
    return v6;
end;
local v9 = {};
v9.new = function(v10) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    assert(v9.isValid(v10));
    v9.__index = v9;
    setmetatable(v10, v9);
    return v10;
end;
v9.mock = function(v11) --[[ Line: 41 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v9 (copy), v3 (copy)
    v11 = v11 or {};
    local v12 = v11.votes or {
        [1] = {
            userId = 456, 
            voteIdentifier = "voteIdentifier", 
            voteType = v4.Accept
        }
    };
    local v13 = 0;
    for v14 = 1, #v12 do
        if v12[v14].voteType == v4.Accept then
            v13 = v13 + 1;
        end;
    end;
    return (v9.new({
        createdAtTime = v11.createdAtTime or "2024-07-19T21:02:47.777+00:00", 
        experienceInviteId = v11.experienceInviteId or "987", 
        experienceDetail = v11.experienceDetail or {
            placeId = 15308759682, 
            gameInstanceId = "instanceId"
        }, 
        inviterId = v11.inviterId or 123456, 
        membershipEntityId = v11.membershipEntityId or "54321", 
        spotsTaken = v13, 
        state = v11.state or v3.Active, 
        totalSpots = v11.totalSpots or 6, 
        versionId = v11.version or 1, 
        votes = v12
    }));
end;
v9.format = function(v15) --[[ Line: 72 ]] --[[ Name: format ]]
    -- upvalues: v9 (copy), v4 (copy)
    local l_votes_0 = v15.votes;
    local l_new_0 = v9.new;
    local v18 = {
        createdAtTime = v15.createdAtTime, 
        experienceDetail = v15.experienceDetail, 
        experienceInviteId = v15.experienceInviteId, 
        inviterId = v15.inviterId, 
        membershipEntityId = v15.membershipEntityId
    };
    local v19 = 0;
    for v20 = 1, #l_votes_0 do
        if l_votes_0[v20].voteType == v4.Accept then
            v19 = v19 + 1;
        end;
    end;
    v18.spotsTaken = v19;
    v18.state = v15.state;
    v18.totalSpots = v15.totalSpots;
    v18.versionId = v15.versionId;
    v18.votes = l_votes_0;
    return (l_new_0(v18));
end;
v9.isValid = v2.strictInterface({
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
    }))
});
return v9;