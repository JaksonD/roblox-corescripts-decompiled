local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_llama_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).llama;
local v5 = require(l_Modules_0.Common.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Thunks.FriendshipCreated);
local v9 = require(l_Modules_0.LuaApp.Thunks.FriendshipDestroyed);
local v10 = require(script.Parent.EventNetworking);
local l_useHandleFriendshipEvent_0 = require(l_CorePackages_0.Workspace.Packages.FriendsCommon).Hooks.useHandleFriendshipEvent;
local l_GetUnreadConversationCount_0 = require(l_CorePackages_0.Workspace.Packages.SocialTabState).Requests.GetUnreadConversationCount;
local v13 = v5.Component:extend("FriendshipEventReceiver");
v13.init = function(v14) --[[ Line: 25 ]] --[[ Name: init ]]
    local l_friendshipCreated_0 = v14.props.friendshipCreated;
    local l_friendshipDestroyed_0 = v14.props.friendshipDestroyed;
    local l_networking_0 = v14.props.networking;
    v14.tokens = {
        v14.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(v18) --[[ Line: 33 ]]
            -- upvalues: v14 (copy), l_friendshipDestroyed_0 (copy), l_friendshipCreated_0 (copy), l_networking_0 (copy)
            local v19 = tostring(v14.props.localUserId);
            if v18.Type == "FriendshipDestroyed" then
                local v20 = v19 == tostring(v18.EventArgs.UserId1) and tostring(v18.EventArgs.UserId2) or tostring(v18.EventArgs.UserId1);
                v14.props.fetchFriendCount(v19);
                l_friendshipDestroyed_0({
                    otherUser = v20, 
                    localUserId = v19
                });
                v14.props.handleFriendshipEvent({
                    removedUserId = v20
                });
                v14.props.fetchGetUnreadConversationCount();
                return;
            else
                if v18.Type == "FriendshipCreated" then
                    local v21 = v19 == tostring(v18.EventArgs.UserId1) and tostring(v18.EventArgs.UserId2) or tostring(v18.EventArgs.UserId1);
                    v14.props.fetchFriendCount(v19);
                    l_friendshipCreated_0(l_networking_0, v21);
                    v14.props.handleFriendshipEvent({
                        addedUserId = v21
                    });
                    v14.props.fetchGetUnreadConversationCount();
                end;
                return;
            end;
        end)
    };
end;
v13.render = function(_) --[[ Line: 63 ]] --[[ Name: render ]]

end;
v13.willUnmount = function(v23) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    for _, v25 in pairs(v23.tokens) do
        v25:disconnect();
    end;
end;
v13 = v3.connect(function(v26) --[[ Line: 71 ]]
    return {
        localUserId = v26.LocalUserId
    };
end, function(v27) --[[ Line: 75 ]]
    -- upvalues: v10 (copy), v9 (copy), v8 (copy), l_GetUnreadConversationCount_0 (copy)
    local function v29(v28) --[[ Line: 76 ]]
        -- upvalues: v27 (copy), v10 (ref), v9 (ref)
        v27(v10.RoduxFriends.Actions.FriendshipDestroyed(v28.otherUser, v28.localUserId));
        return v27(v9(v28.otherUser));
    end;
    return {
        friendshipCreated = function(...) --[[ Line: 81 ]] --[[ Name: friendshipCreated ]]
            -- upvalues: v27 (copy), v8 (ref)
            return v27(v8(...));
        end, 
        friendshipDestroyed = v29, 
        fetchFriendCount = function(v30) --[[ Line: 85 ]] --[[ Name: fetchFriendCount ]]
            -- upvalues: v27 (copy), v10 (ref)
            v27(v10.FriendsNetworking.GetFriendsCountFromUserId.API(v30));
        end, 
        fetchGetUnreadConversationCount = function() --[[ Line: 88 ]] --[[ Name: fetchGetUnreadConversationCount ]]
            -- upvalues: v27 (copy), l_GetUnreadConversationCount_0 (ref)
            v27(l_GetUnreadConversationCount_0.API());
        end
    };
end)(v13);
v13 = l_RoactServices_0.connect({
    networking = v7
})(v13);
return function(v31) --[[ Line: 98 ]]
    -- upvalues: l_useHandleFriendshipEvent_0 (copy), v5 (copy), v13 (ref), l_llama_0 (copy)
    local v32 = l_useHandleFriendshipEvent_0();
    return v5.createElement(v13, l_llama_0.Dictionary.join(v31, {
        handleFriendshipEvent = v32
    }));
end;