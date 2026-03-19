local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_CurrentExperienceInviteStatusUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentExperienceInviteStatusUpdated;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), l_CurrentExperienceInviteStatusUpdated_0 (copy)
    return v2.createReducer(false, {
        [l_CurrentExperienceInviteStatusUpdated_0.name] = function(_, v6) --[[ Line: 14 ]]
            return v6.payload.isExperienceInvitePending;
        end
    });
end;