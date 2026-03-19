local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCards");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
return {
    CardComponent = {
        scheduled_group_up = if require(l_Parent_0.SharedFlags).FFlagEnableScheduledSquads then l_createLazyComponent_0(function() --[[ Line: 12 ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Components).ScheduledSquadCard;
        end) else nil, 
        group_up = l_createLazyComponent_0(function() --[[ Line: 16 ]]
            -- upvalues: l_script_FirstAncestor_0 (copy)
            return require(l_script_FirstAncestor_0.Components).SquadCard.SquadCard;
        end)
    }
};