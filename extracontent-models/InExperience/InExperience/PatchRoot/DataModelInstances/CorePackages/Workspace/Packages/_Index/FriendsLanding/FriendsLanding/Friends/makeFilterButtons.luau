local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Friends.filterStates);
return function(v2, _) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        {
            text = v2.all, 
            id = v1.All
        }, 
        {
            text = v2.online, 
            id = v1.Online
        }, 
        {
            text = v2.inExperience, 
            id = v1.InExperience
        }
    };
end;