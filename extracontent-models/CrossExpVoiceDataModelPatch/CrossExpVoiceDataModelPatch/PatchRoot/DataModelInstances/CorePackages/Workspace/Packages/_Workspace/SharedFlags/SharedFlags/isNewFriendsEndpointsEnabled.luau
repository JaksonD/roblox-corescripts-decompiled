local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_Players_0 = game:GetService("Players");
local l_ThrottleUserId_0 = require(l_Parent_0.AppCommonLib).ThrottleUserId;
return function() --[[ Line: 7 ]]
    -- upvalues: l_ThrottleUserId_0 (copy), l_Players_0 (copy)
    return l_ThrottleUserId_0(game:DefineFastInt("LuaChatUseNewFriendsEndpointsV2", 0), l_Players_0.LocalPlayer.UserId);
end;