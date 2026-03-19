local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_PlaceInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer;
local l_UserReducer_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Reducers.UserReducer;
local l_Friends_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends;
local l_FriendCount_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount;
local v7 = require(l_ShareGame_0.Reducers.ConversationsSearch);
local v8 = require(l_ShareGame_0.Reducers.DeviceInfo);
local v9 = require(l_ShareGame_0.Reducers.Invites);
local v10 = require(l_ShareGame_0.Reducers.GameInfo);
local v11 = require(l_ShareGame_0.Reducers.Page);
local v12 = require(l_ShareGame_0.Reducers.Toasts);
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
local v14 = l_ReducerDependencies_0.RoduxNetworking.installReducer();
local v15 = l_ShareLinksRodux_0.installReducer();
return function(v16, v17) --[[ Line: 25 ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), v11 (copy), l_PlaceInfosReducer_0 (copy), v12 (copy), l_UserReducer_0 (copy), l_Friends_0 (copy), l_FriendCount_0 (copy), v15 (copy), v10 (copy), v14 (copy)
    v16 = v16 or {};
    return {
        ConversationsSearch = v7(v16.ConversationsSearch, v17), 
        DeviceInfo = v8(v16.DeviceInfo, v17), 
        Invites = v9(v16.Invites, v17), 
        Page = v11(v16.Page, v17), 
        PlaceInfos = l_PlaceInfosReducer_0(v16.PlaceInfos, v17), 
        Toasts = v12(v16.Toasts, v17), 
        Users = l_UserReducer_0(v16.Users, v17), 
        Friends = l_Friends_0(v16.Friends, v17), 
        FriendCount = l_FriendCount_0(v16.FriendCount, v17), 
        ShareLinks = v15(v16.ShareLinks, v17), 
        GameInfo = v10(v16.GameInfo, v17), 
        NetworkStatus = v14(v16.NetworkStatus, v17)
    };
end;