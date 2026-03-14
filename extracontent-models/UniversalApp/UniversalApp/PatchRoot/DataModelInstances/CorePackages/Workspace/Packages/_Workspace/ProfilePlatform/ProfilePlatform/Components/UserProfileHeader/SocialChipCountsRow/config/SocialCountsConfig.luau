local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_SocialCountEnableKeys_0 = require(l_script_FirstAncestor_0.Common.Enums).SocialCountEnableKeys;
local l_AvatarGroupType_0 = v2.Enums.AvatarGroupType;
return {
    RowConfig = {
        mutualFriendsCount = {
            layoutOrder = 1, 
            textKey = v3.MutualsText, 
            singleTextKey = v3.MutualText, 
            enabledKey = l_SocialCountEnableKeys_0.IsMutualFriendsCountEnabled, 
            getIsDisabled = function(_, _, v8) --[[ Line: 27 ]] --[[ Name: getIsDisabled ]]
                if not v8 then
                    return true;
                else
                    return false;
                end;
            end, 
            getLeading = function(v9) --[[ Line: 33 ]] --[[ Name: getLeading ]]
                -- upvalues: l_AvatarGroupType_0 (copy)
                local v10 = {
                    table.unpack(v9.mutualFriendIds, 1, (math.min(2, #v9.mutualFriendIds)))
                };
                if v10 and #v10 > 0 then
                    return {
                        type = "AvatarGroup", 
                        props = {
                            avatars = v10, 
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
            textKey = v3.Connections, 
            singleTextKey = v3.Connection, 
            enabledKey = l_SocialCountEnableKeys_0.IsFriendsCountEnabled, 
            getIsDisabled = function(v11, v12, v13) --[[ Line: 54 ]] --[[ Name: getIsDisabled ]]
                if not v13 then
                    return true;
                elseif v12 then
                    return false;
                else
                    return not v11;
                end;
            end
        }, 
        followersCount = {
            layoutOrder = 3, 
            textKey = v3.Followers, 
            singleTextKey = v3.Follower, 
            enabledKey = l_SocialCountEnableKeys_0.IsFollowersCountEnabled, 
            getIsDisabled = function(v14, _, v16) --[[ Line: 69 ]] --[[ Name: getIsDisabled ]]
                if not v16 then
                    return true;
                else
                    return not v14;
                end;
            end
        }, 
        followingsCount = {
            layoutOrder = 4, 
            textKey = v3.Following, 
            singleTextKey = v3.Following, 
            enabledKey = l_SocialCountEnableKeys_0.IsFollowingsCountEnabled, 
            getIsDisabled = function(v17, _, v19) --[[ Line: 81 ]] --[[ Name: getIsDisabled ]]
                if not v19 then
                    return true;
                else
                    return not v17;
                end;
            end
        }
    }
};