local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.POST({
        Name = "ReinviteToSquad"
    }, function(v3, v4) --[[ Line: 9 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("group-up"):path("v1"):path("reinvite"):body({
            groupUpId = v4.squadId
        });
    end));
end;