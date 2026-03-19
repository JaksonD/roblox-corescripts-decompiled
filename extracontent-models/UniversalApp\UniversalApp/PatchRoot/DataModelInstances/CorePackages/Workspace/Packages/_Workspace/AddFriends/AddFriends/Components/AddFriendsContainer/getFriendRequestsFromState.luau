local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.AddFriendsState);
local l_AddFriendsSelector_0 = v1.AddFriendsSelector;
local v3 = require(l_Parent_0.llama);
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local v6 = require(script.Parent.sortFriendRequestsByOrder);
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
return function(v8) --[[ Line: 15 ]]
    -- upvalues: l_AddFriendsSelector_0 (copy), v3 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), l_RoduxPresence_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), v6 (copy)
    local v9 = l_AddFriendsSelector_0(v8, "Friends.requests.byUserId");
    if not v9 then
        return {};
    else
        local v10 = v3.Dictionary.keys(v9);
        local v13 = v3.List.map(v10, function(v11) --[[ Line: 22 ]]
            -- upvalues: l_AddFriendsSelector_0 (ref), v8 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v3 (ref), l_RoduxPresence_0 (ref), l_FFlagFriendRequestNicknames_0 (ref)
            local v12 = l_AddFriendsSelector_0(v8, "Friends.requests.order.requestsById.%s", v11);
            if l_FFlagAddFriendsRenderTileRefactor_0 then
                return {
                    id = v11, 
                    order = v12
                };
            else
                return v3.Dictionary.join(l_AddFriendsSelector_0(v8, "Users.byUserId.%s", v11), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v8, v11), {
                    sentAt = l_AddFriendsSelector_0(v8, "Friends.requests.sentAt.%s", v11)
                }, {
                    mutualFriends = l_AddFriendsSelector_0(v8, "Friends.requests.mutualFriends.%s", v11)
                }, {
                    contactName = l_AddFriendsSelector_0(v8, "Friends.contactNamesByUserId.%s", v11)
                }, {
                    order = v12
                }, {
                    senderNickname = if l_FFlagFriendRequestNicknames_0 then l_AddFriendsSelector_0(v8, (("Friends.requests.senderNickname.%*"):format(v11))) else nil
                });
            end;
        end);
        return v6(v13);
    end;
end;