local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_RecommendationContextType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxFriends.Enums.RecommendationContextType;
local v2 = {
    SingularMutualFriend = "Feature.Friends.Label.SingularMutualFriend", 
    MutualFriends = "Feature.Friends.Label.MutualFriends", 
    PlayedTogether = "Feature.Friends.Label.Frequent"
};
local function _(v3) --[[ Line: 49 ]]
    if v3.mutualFriendsCount then
        return v3.mutualFriendsCount;
    else
        return v3.mutualFriendsList and #v3.mutualFriendsList or 0;
    end;
end;
return function(v5) --[[ Line: 55 ]]
    -- upvalues: l_RecommendationContextType_0 (copy), v2 (copy)
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    local v9 = v5.contextType and v5.contextType.rawValue() or nil;
    local v10 = if v5.mutualFriendsCount then v5.mutualFriendsCount else v5.mutualFriendsList and #v5.mutualFriendsList or 0;
    if v9 == l_RecommendationContextType_0.MutualFriends.rawValue() and v10 > 0 then
        v8 = function(v11) --[[ Line: 65 ]]
            -- upvalues: v10 (copy)
            if v11 then
                return tostring(v10) .. " " .. string.lower(v11);
            else
                return nil;
            end;
        end;
        v7 = if v10 == 1 then v2.SingularMutualFriend else v2.MutualFriends;
        v6 = {
            path = "icons/status/player/friend"
        };
    elseif v9 == l_RecommendationContextType_0.Frequents.rawValue() then
        v7 = v2.PlayedTogether;
    end;
    return {
        icon = v6, 
        label = {
            formatter = v8, 
            text = nil, 
            textKey = v7
        }
    };
end;