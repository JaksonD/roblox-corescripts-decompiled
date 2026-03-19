local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v4 = require(l_CorePackages_0.Packages.RoduxNetworking);
local v5 = require(l_CorePackages_0.Workspace.Packages.FriendsNetworking).config({
    roduxNetworking = v4.mock()
});
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy)
    v6 = v6 or {};
    if v7.type == v3.name then
        return (v2.Dictionary.join(v6, {
            [v7.id] = v7.status
        }));
    elseif v7.type == v5.RequestFriendshipFromUserId.Succeeded.name then
        local v8 = tostring(v7.namedIds.users);
        return v2.Dictionary.join(v6, {
            [v8] = Enum.FriendStatus.FriendRequestSent
        });
    elseif v7.type == v5.AcceptFriendRequestFromUserId.Succeeded.name then
        local v9 = tostring(v7.ids[1]);
        return v2.Dictionary.join(v6, {
            [v9] = Enum.FriendStatus.Friend
        });
    elseif v7.type == v5.DeclineFriendRequestFromUserId.Succeeded.name then
        local l_ids_0 = v7.ids;
        local v11 = {};
        for _, v13 in l_ids_0 do
            v11[tostring(v13)] = Enum.FriendStatus.NotFriend;
        end;
        return v2.Dictionary.join(v6, v11);
    elseif v7.type == v5.UnfriendTargetUserId.Succeeded.name then
        local v14 = tostring(v7.namedIds.users);
        return v2.Dictionary.join(v6, {
            [v14] = Enum.FriendStatus.NotFriend
        });
    else
        return v6;
    end;
end;