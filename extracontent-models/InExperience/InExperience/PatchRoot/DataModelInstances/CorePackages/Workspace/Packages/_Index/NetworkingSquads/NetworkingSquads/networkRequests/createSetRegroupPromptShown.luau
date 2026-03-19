local v0 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.POST({
        Name = "SetRegroupPromptShown"
    }, function(v3, v4) --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("group-up"):path("v1"):path("set-regroup-prompt-shown"):body({
            groupUpId = v4.groupUpId
        });
    end));
end;