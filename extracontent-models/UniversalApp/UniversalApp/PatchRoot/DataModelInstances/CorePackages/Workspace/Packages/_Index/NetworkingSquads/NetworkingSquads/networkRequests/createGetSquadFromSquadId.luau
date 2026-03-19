local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    local l_roduxNetworking_0 = v2.roduxNetworking;
    local v4 = nil;
    local v7 = l_roduxNetworking_0.GET({
        Name = "GetSquadFromSquadId"
    }, function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v4 (ref), v0 (ref)
        if v2.useMockedResponse then
            v4 = {
                responseBody = {
                    groupUp = v6.mockedSquad
                }
            };
        end;
        return v5(v0):path("group-up"):path("v1"):path("status"):queryArgs({
            groupUpId = v6.squadId
        });
    end);
    if v2.useMockedResponse then
        v7.Mock.clear();
        v7.Mock.reply(function() --[[ Line: 28 ]]
            -- upvalues: v4 (ref)
            return v4;
        end);
    end;
    return v7;
end;