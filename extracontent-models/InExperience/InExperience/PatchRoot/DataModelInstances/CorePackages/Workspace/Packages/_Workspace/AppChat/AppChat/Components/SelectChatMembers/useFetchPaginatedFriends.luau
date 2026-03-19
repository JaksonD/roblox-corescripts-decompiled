local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useFriendsListOrderedByPresence_0 = require(l_Parent_0.FriendsCommon).Hooks.useFriendsListOrderedByPresence;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v5 = require(script.Parent.Utils.convertPresenceTypeToUserPresence);
useFetchPaginatedFriends = function() --[[ Line: 14 ]] --[[ Name: useFetchPaginatedFriends ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_useFriendsListOrderedByPresence_0 (copy), v5 (copy), l_UserModel_0 (copy)
    local v6 = l_useLocalUserId_0();
    local v7 = l_useLocalization_0({
        offlinePresenceText = "Common.Presence.Label.Offline", 
        onlinePresenceText = "Common.Presence.Label.Online"
    });
    local v8 = l_useFriendsListOrderedByPresence_0({
        userId = v6, 
        pageSize = 50
    });
    local v9 = {};
    if v8.onlineFriends and v8.offlineFriends then
        for _, v11 in v8.onlineFriends do
            local l_id_0 = v11.id;
            local v13 = if v11.presence then v11.presence.userPresenceType else nil;
            local v14 = v5(v13);
            local v15 = nil;
            if v14 == l_UserModel_0.PresenceType.ONLINE then
                v15 = v7.onlinePresenceText;
            elseif v14 == l_UserModel_0.PresenceType.IN_GAME then
                v15 = if v11.presence then v11.presence.lastLocation else "";
            elseif v14 == l_UserModel_0.PresenceType.IN_STUDIO then
                v15 = "Studio";
            end;
            table.insert(v9, {
                id = l_id_0, 
                presence = v14, 
                presenceText = v15, 
                thumbnail = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(l_id_0)
            });
        end;
        for _, v17 in v8.offlineFriends do
            local l_OFFLINE_0 = l_UserModel_0.PresenceType.OFFLINE;
            local l_offlinePresenceText_0 = v7.offlinePresenceText;
            local l_id_1 = v17.id;
            table.insert(v9, {
                id = l_id_1, 
                presence = l_OFFLINE_0, 
                presenceText = l_offlinePresenceText_0, 
                thumbnail = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(l_id_1)
            });
        end;
    end;
    return v9, v8.fetchMoreFriends, v8.isEndOfList;
end;
return useFetchPaginatedFriends;