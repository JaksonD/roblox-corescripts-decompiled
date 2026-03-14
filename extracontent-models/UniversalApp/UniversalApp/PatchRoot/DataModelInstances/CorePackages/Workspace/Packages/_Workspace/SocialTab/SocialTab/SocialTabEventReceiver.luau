local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoduxFriends_0 = v1.RoduxFriends;
local v5 = l_Roact_0.Component:extend("SocialTabEventReceiver");
v5.init = function(v6) --[[ Line: 16 ]] --[[ Name: init ]]
    local l_robloxEventReceiver_0 = v6.props.robloxEventReceiver;
    v6.lastSeqNumByNamespace = {};
    v6.lastConnectionState = Enum.ConnectionState.Connected;
    v6.tokens = {
        l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v8) --[[ Line: 24 ]]
            -- upvalues: v6 (copy)
            if v8.Type == "FriendshipDestroyed" and v8.EventArgs then
                local v9 = tostring(v8.EventArgs.UserId1);
                local v10 = tostring(v8.EventArgs.UserId2);
                if v9 == v6.props.localUserId then
                    v9 = "localUserId";
                end;
                if v10 == v6.props.localUserId then
                    v10 = "localUserId";
                end;
                v6.props.friendshipDestroyed(v9, v10);
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("AppShellNotifications", function(_, v12) --[[ Line: 42 ]]
            -- upvalues: v6 (copy)
            if v12 == "StartConversationWithUserId" or v12 == "StartConversationWithId" then
                v6.props.goToChat();
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("AppInput", function(_, v14) --[[ Line: 49 ]]
            -- upvalues: v6 (copy)
            if v14 == "Focused" then
                v6.props.showTabBar();
            end;
        end)
    };
end;
v5.render = function(_) --[[ Line: 57 ]] --[[ Name: render ]]
    return nil;
end;
v5.willUnmount = function(v16) --[[ Line: 61 ]] --[[ Name: willUnmount ]]
    for _, v18 in pairs(v16.tokens) do
        v18:disconnect();
    end;
end;
return l_RoactRodux_0.connect(function(v19) --[[ Line: 67 ]]
    return {
        localUserId = v19.LocalUserId
    };
end, function(v20) --[[ Line: 71 ]]
    -- upvalues: l_RoduxFriends_0 (copy)
    return {
        friendshipDestroyed = function(v21, v22) --[[ Line: 73 ]] --[[ Name: friendshipDestroyed ]]
            -- upvalues: v20 (copy), l_RoduxFriends_0 (ref)
            return v20(l_RoduxFriends_0.Actions.FriendshipDestroyed(v21, v22));
        end
    };
end)(v5);