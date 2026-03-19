local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.llama);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
return v3.createReducer({}, {
    [v4.GetFollowingExists.Succeeded.name] = function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v2 (copy)
        local v7 = {};
        v2.List.every(v6.responseBody.followings, function(v8) --[[ Line: 14 ]]
            -- upvalues: v7 (copy)
            v7[tostring(v8.userId)] = {
                isFollowing = v8.isFollowing, 
                isFollowed = v8.isFollowed
            };
            return true;
        end);
        return v2.Dictionary.join(v5, v7);
    end
});