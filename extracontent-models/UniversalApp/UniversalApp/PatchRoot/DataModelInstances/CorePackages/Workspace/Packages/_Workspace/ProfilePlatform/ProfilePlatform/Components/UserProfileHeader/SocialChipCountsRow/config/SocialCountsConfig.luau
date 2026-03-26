local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_SocialCountEnableKeys_0 = require(l_script_FirstAncestor_0.Common.Enums).SocialCountEnableKeys;
local l_AvatarGroupType_0 = v2.Enums.AvatarGroupType;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return {
    RowConfig = {
        mutualFriendsCount = {
            layoutOrder = 1, 
            textKey = v3.MutualsText, 
            singleTextKey = v3.MutualText, 
            enabledKey = l_SocialCountEnableKeys_0.IsMutualFriendsCountEnabled, 
            getIsDisabled = function(_, _, v9) --[[ Line: 29 ]] --[[ Name: getIsDisabled ]]
                if not v9 then
                    return true;
                else
                    return false;
                end;
            end, 
            getLeading = function(v10) --[[ Line: 35 ]] --[[ Name: getLeading ]]
                -- upvalues: l_AvatarGroupType_0 (copy)
                local v11 = {
                    table.unpack(v10.mutualFriendIds, 1, (math.min(2, #v10.mutualFriendIds)))
                };
                if v11 and #v11 > 0 then
                    return {
                        type = "AvatarGroup", 
                        props = {
                            avatars = v11, 
                            type = l_AvatarGroupType_0.Stacked, 
                            max = 2
                        }
                    };
                else
                    return nil;
                end;
            end
        }, 
        friendsCount = {
            layoutOrder = 2, 
            textKey = if l_FFlagConnectionsToFriendsRename_0 then v3.Friends else v3.Connections, 
            singleTextKey = if l_FFlagConnectionsToFriendsRename_0 then v3.Friend else v3.Connection, 
            enabledKey = l_SocialCountEnableKeys_0.IsFriendsCountEnabled, 
            getIsDisabled = function(v12, v13, v14) --[[ Line: 56 ]] --[[ Name: getIsDisabled ]]
                if not v14 then
                    return true;
                elseif v13 then
                    return false;
                else
                    return not v12;
                end;
            end
        }, 
        followersCount = {
            layoutOrder = 3, 
            textKey = v3.Followers, 
            singleTextKey = v3.Follower, 
            enabledKey = l_SocialCountEnableKeys_0.IsFollowersCountEnabled, 
            getIsDisabled = function(v15, _, v17) --[[ Line: 71 ]] --[[ Name: getIsDisabled ]]
                if not v17 then
                    return true;
                else
                    return not v15;
                end;
            end
        }, 
        followingsCount = {
            layoutOrder = 4, 
            textKey = v3.Following, 
            singleTextKey = v3.Following, 
            enabledKey = l_SocialCountEnableKeys_0.IsFollowingsCountEnabled, 
            getIsDisabled = function(v18, _, v20) --[[ Line: 83 ]] --[[ Name: getIsDisabled ]]
                if not v20 then
                    return true;
                else
                    return not v18;
                end;
            end
        }
    }
};