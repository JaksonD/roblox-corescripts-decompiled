local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.roduxFriendsTypes);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.Dash);
local v5 = {};
return function(v6) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    local l_friendsNetworking_0 = v6.friendsNetworking;
    local l_userBlockingNetworking_0 = v6.userBlockingNetworking;
    return v3.createReducer(v5, {
        [l_friendsNetworking_0.GetFollowingExists.Succeeded.name] = function(v9, v10) --[[ Line: 25 ]]
            -- upvalues: v4 (ref)
            local v11 = {};
            v4.forEach(v10.responseBody.followings, function(v12) --[[ Line: 27 ]]
                -- upvalues: v11 (copy)
                v11[tostring(v12.userId)] = {
                    isFollowed = v12.isFollowed, 
                    isFollowing = v12.isFollowing
                };
            end);
            return v4.join(v9, v11);
        end, 
        [l_userBlockingNetworking_0.BlockUserById.Succeeded.name] = function(v13, v14) --[[ Line: 36 ]]
            -- upvalues: v4 (ref)
            local v15 = tostring(v14.namedIds.users);
            return v4.join(v13, {
                [v15] = {
                    isFollowed = false, 
                    isFollowing = false
                }
            });
        end
    });
end;