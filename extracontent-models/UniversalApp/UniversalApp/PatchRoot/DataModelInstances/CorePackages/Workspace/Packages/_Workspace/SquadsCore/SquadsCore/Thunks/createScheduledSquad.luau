local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local v1 = require(l_script_FirstAncestor_0.NetworkRequests.createScheduledSquad);
local v2 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 18 ]]
        -- upvalues: v5 (copy), v2 (ref), v1 (ref), v4 (copy), v6 (copy)
        v1(v4, v6, function(v8) --[[ Line: 19 ]]
            -- upvalues: v5 (ref), v7 (copy), v2 (ref)
            v5(v7, {
                promptType = if v8 == 409 then v2.ScheduledSquadConflict else v2.Error
            });
        end);
    end;
end;