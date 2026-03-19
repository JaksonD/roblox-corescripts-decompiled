local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local v1 = require(script.Parent.SquadInviteeModel);
local v2 = require(script.Parent.SquadMemberModel);
local v3 = require(script.Parent.SquadSelfPermissionsModel);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.t);
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local v7 = {};
v7.new = function(v8) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    assert(v7.isValid(v8));
    v7.__index = v7;
    setmetatable(v8, v7);
    return v8;
end;
tryGetSquadId = function(v9) --[[ Line: 28 ]] --[[ Name: tryGetSquadId ]]
    return v9.groupUpId or v9.squadId;
end;
v7.mock = function(v10) --[[ Line: 32 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v7 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy)
    v10 = v10 or {};
    local v12 = v4.List.map(v10.members or {
        {
            userId = 1234
        }
    }, function(v11) --[[ Line: 35 ]]
        -- upvalues: v2 (ref)
        return v2.mock(v11);
    end);
    local v14 = v4.List.map(v10.invitees or {
        {
            userId = 2345, 
            invitedAtTimestampMs = 3333333
        }
    }, function(v13) --[[ Line: 41 ]]
        -- upvalues: v1 (ref)
        return v1.mock(v13);
    end);
    local v15 = {
        canSeeRegroupPromptToast = false, 
        canSeeRegroupJoinButton = false
    };
    return (v7.new({
        squadId = tryGetSquadId(v10) or "12345", 
        initiatorId = v10.initiatorId or 54321, 
        createdAtTime = v10.createdAtTime or "2024-07-19T21:02:47.777+00:00", 
        updatedAtTime = v10.updatedAtTime or "2024-07-19T21:02:47.777+00:00", 
        deletedAtTime = v10.deletedAtTime, 
        parentChannelId = v10.parentChannelId or "23456", 
        members = v12, 
        invitees = v14, 
        selfPermissions = if l_FFlagEnableSquadRegroupExperimentation_0 then v10.selfPermissions or v15 else nil
    }));
end;
v7.format = function(v16) --[[ Line: 68 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v7 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy)
    local v18 = v4.List.map(v16.members, function(v17) --[[ Line: 69 ]]
        -- upvalues: v2 (ref)
        return v2.format(v17);
    end);
    local v20 = v4.List.map(v16.invitees, function(v19) --[[ Line: 73 ]]
        -- upvalues: v1 (ref)
        return v1.format(v19);
    end);
    return (v7.new({
        createdAtTime = v16.createdAtTime, 
        deletedAtTime = v16.deletedAtTime, 
        initiatorId = v16.initiatorId, 
        invitees = v20, 
        members = v18, 
        parentChannelId = v16.parentChannelId, 
        squadId = tryGetSquadId(v16), 
        updatedAtTime = v16.updatedAtTime, 
        selfPermissions = if l_FFlagEnableSquadRegroupExperimentation_0 then v16.selfPermissions else nil
    }));
end;
v7.isValid = v5.strictInterface({
    createdAtTime = v5.string, 
    deletedAtTime = v5.optional(v5.string), 
    initiatorId = v5.number, 
    invitees = v5.array(v1.isValid), 
    members = v5.array(v2.isValid), 
    parentChannelId = v5.string, 
    squadId = v5.string, 
    updatedAtTime = v5.string, 
    selfPermissions = if l_FFlagEnableSquadRegroupExperimentation_0 then v5.optional(v3.isValid) else v5.none
});
return v7;