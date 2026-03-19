local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddPlayer);
local v5 = require(l_Actions_0.RemovePlayer);
local v6 = require(l_Actions_0.SetPlayerIsBlocked);
local v7 = require(l_Actions_0.SetPlayerFollowRelationship);
local v8 = require(l_Actions_0.SetPlayerFriendStatus);
local v9 = require(l_Actions_0.SetPlayerIsFollowing);
return (v1.createReducer({}, {
    [v4.name] = function(v10, v11) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            [v11.userId] = {
                isBlocked = false, 
                friendStatus = Enum.FriendStatus.Unknown, 
                isFollowing = false, 
                isFollower = false
            }
        });
    end, 
    [v5.name] = function(v12, v13) --[[ Line: 27 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            [v13.userId] = v2.None
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 33 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            [v15.userId] = {
                isBlocked = v15.isBlocked, 
                friendStatus = v14[v15.userId].friendStatus, 
                isFollowing = v14[v15.userId].isFollowing, 
                isFollower = v14[v15.userId].isFollower
            }
        });
    end, 
    [v7.name] = function(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            [v17.userId] = {
                isBlocked = v16[v17.userId].isBlocked, 
                friendStatus = v16[v17.userId].friendStatus, 
                isFollowing = v17.isFollowing, 
                isFollower = v17.isFollower
            }
        });
    end, 
    [v9.name] = function(v18, v19) --[[ Line: 55 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v18, {
            [v19.userId] = {
                isBlocked = v18[v19.userId].isBlocked, 
                friendStatus = v18[v19.userId].friendStatus, 
                isFollowing = v19.isFollowing, 
                isFollower = v18[v19.userId].isFollower
            }
        });
    end, 
    [v8.name] = function(v20, v21) --[[ Line: 66 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v20, {
            [v21.userId] = {
                isBlocked = v20[v21.userId].isBlocked, 
                friendStatus = v21.friendStatus, 
                isFollowing = v20[v21.userId].isFollowing, 
                isFollower = v20[v21.userId].isFollower
            }
        });
    end
}));