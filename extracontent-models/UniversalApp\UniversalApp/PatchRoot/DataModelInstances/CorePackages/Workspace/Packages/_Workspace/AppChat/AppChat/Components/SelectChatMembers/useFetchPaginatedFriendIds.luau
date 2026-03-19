local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useFriendsListOrderedByPresence_0 = require(l_Parent_0.FriendsCommon).Hooks.useFriendsListOrderedByPresence;
useFetchPaginatedFriendIds = function() --[[ Line: 14 ]] --[[ Name: useFetchPaginatedFriendIds ]]
    -- upvalues: l_useLocalUserId_0 (copy), v2 (copy), l_useFriendsListOrderedByPresence_0 (copy), v1 (copy), v3 (copy)
    local v6 = l_useLocalUserId_0();
    local v7 = v2.useRef({});
    local v8 = l_useFriendsListOrderedByPresence_0({
        userId = v6, 
        pageSize = 50
    });
    local v9 = v1.List.join(v8.onlineFriends, v8.offlineFriends);
    local v11 = v1.List.map(v9, function(v10) --[[ Line: 23 ]]
        return v10.id;
    end);
    local v12 = v1.List.toSet(v7.current);
    local v14 = v1.List.filter(v11, function(v13) --[[ Line: 27 ]]
        -- upvalues: v12 (copy)
        return not v12[v13];
    end);
    if #v14 > 0 then
        v3.Stores.UserProfileStore.get().fetchNamesByUserIds(v14);
    end;
    v7.current = v11;
    return v7.current, v8.fetchMoreFriends, v8.isEndOfList, v8;
end;
return useFetchPaginatedFriendIds;