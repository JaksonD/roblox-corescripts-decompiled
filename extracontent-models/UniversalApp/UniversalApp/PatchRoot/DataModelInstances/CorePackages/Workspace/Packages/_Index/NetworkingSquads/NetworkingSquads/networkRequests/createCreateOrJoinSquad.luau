local l_Parent_0 = script:FindFirstAncestor("NetworkingSquads").Parent;
local v1 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
local l_FFlagEnableScheduledSquads_0 = require(l_Parent_0.SharedFlags).FFlagEnableScheduledSquads;
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_FFlagEnableScheduledSquads_0 (copy)
    local l_roduxNetworking_0 = v4.roduxNetworking;
    local v6 = nil;
    local v9 = l_roduxNetworking_0.POST({
        Name = "CreateOrJoinSquad"
    }, function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: v4 (copy), v6 (ref), v1 (ref), l_FFlagEnableScheduledSquads_0 (ref)
        if v4.useMockedResponse then
            v6 = {
                responseBody = {
                    groupUp = {
                        groupUpId = "20000000-0000-0000-0000-000000000000", 
                        initiatorId = 3447631062, 
                        createdAtTime = tostring(os.clock() * 1000), 
                        updatedAtTime = tostring(os.clock() * 1000), 
                        parentChannelId = v8.parentChannelId, 
                        members = {
                            {
                                userId = 3447631062, 
                                rank = 0
                            }, 
                            {
                                userId = 2591622000, 
                                rank = 1
                            }, 
                            {
                                userId = 3447649029, 
                                rank = 2
                            }, 
                            {
                                userId = 3447641701, 
                                rank = 3
                            }, 
                            {
                                userId = 3447635964, 
                                rank = 4
                            }, 
                            {
                                userId = 3447642362, 
                                rank = 5
                            }
                        }
                    }
                }
            };
        end;
        return v7(v1):path("group-up"):path("v1"):path("join-or-create-for-channel"):body({
            parentChannelId = v8.parentChannelId, 
            leaveExisting = v8.leaveExisting, 
            squadLocation = v8.squadLocation, 
            partyAttemptId = v8.partyAttemptId, 
            scheduledGroupUpId = if l_FFlagEnableScheduledSquads_0 then v8.scheduledSquadId else nil
        });
    end);
    if v4.useMockedResponse then
        v9.Mock.clear();
        v9.Mock.reply(function() --[[ Line: 69 ]]
            -- upvalues: v6 (ref)
            return v6;
        end);
    end;
    return v9;
end;