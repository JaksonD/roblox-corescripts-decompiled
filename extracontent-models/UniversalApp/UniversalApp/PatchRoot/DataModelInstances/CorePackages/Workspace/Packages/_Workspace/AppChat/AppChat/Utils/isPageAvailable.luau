local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_isPlacementInExperience_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).isPlacementInExperience;
local v3 = {
    [v1.AddFriends] = true, 
    [v1.PrivacySettings] = true, 
    [v1.GameDetail] = true, 
    [v1.ViewUserProfile] = true, 
    [v1.Groups] = true
};
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: l_isPlacementInExperience_0 (copy), v3 (copy)
    if l_isPlacementInExperience_0(v5) and v3[v4] then
        return false;
    else
        return true;
    end;
end;