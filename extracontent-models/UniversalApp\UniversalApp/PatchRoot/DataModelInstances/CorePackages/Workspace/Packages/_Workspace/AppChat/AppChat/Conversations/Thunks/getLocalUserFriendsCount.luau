local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
return function() --[[ Line: 7 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    return function(v3) --[[ Line: 8 ]]
        -- upvalues: l_Players_0 (ref), v2 (ref)
        if l_Players_0.LocalPlayer then
            return v3:dispatch(v2.GetFriendsCountFromUserId.API(l_Players_0.LocalPlayer.UserId));
        else
            return;
        end;
    end;
end;