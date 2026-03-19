local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    local v5 = v2.roduxNetworking.POST({
        Name = "LeaveSquad"
    }, function(v3, v4) --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("group-up"):path("v1"):path("leave"):body({
            groupUpId = v4.squadId
        });
    end);
    if v2.useMockedResponse then
        v5.Mock.clear();
        v5.Mock.reply(function() --[[ Line: 19 ]]
            return {
                responseBody = {}
            };
        end);
    end;
    return v5;
end;