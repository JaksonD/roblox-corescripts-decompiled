local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    local l_roduxNetworking_0 = v2.roduxNetworking;
    local v4 = nil;
    local v7 = l_roduxNetworking_0.POST({
        Name = "JoinSquad"
    }, function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v4 (ref), v0 (ref)
        if v2.useMockedResponse then
            v4 = {
                responseBody = {
                    groupUp = {
                        groupUpId = v6.squadId, 
                        initiatorId = 3447631062, 
                        createdAtTime = tostring(os.clock() * 1000), 
                        updatedAtTime = tostring(os.clock() * 1000), 
                        parentChannelId = v6.parentChannelId, 
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
        return v5(v0):path("group-up"):path("v1"):path("join"):body({
            groupUpId = v6.squadId, 
            leaveExisting = v6.leaveExisting, 
            squadLocation = v6.squadLocation
        });
    end);
    if v2.useMockedResponse then
        v7.Mock.clear();
        v7.Mock.reply(function() --[[ Line: 62 ]]
            -- upvalues: v4 (ref)
            return v4;
        end);
    end;
    return v7;
end;