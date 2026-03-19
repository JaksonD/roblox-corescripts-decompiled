local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_script_FirstAncestor_0.Networking.configureRoduxFriends);
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
return function() --[[ Line: 10 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy)
    local v5 = l_useDispatch_0();
    return function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v3 (ref)
        return v5(v3.AcceptFriendRequestFromUserId.API({
            currentUserId = v6, 
            targetUserId = v7
        }));
    end;
end;