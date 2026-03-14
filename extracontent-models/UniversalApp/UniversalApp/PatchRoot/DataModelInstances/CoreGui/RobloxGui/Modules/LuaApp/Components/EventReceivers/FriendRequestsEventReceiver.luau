local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(script.Parent.EventNetworking);
local function _(v4) --[[ Line: 9 ]]
    return ({
        FriendshipRequested = true, 
        FriendshipDeclined = true, 
        FriendshipCreated = true
    })[v4];
end;
local v6 = v1.PureComponent:extend("FriendRequestsEventReceiver");
v6.init = function(v7) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v7.tokens = {
        v7.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(v8) --[[ Line: 24 ]]
            -- upvalues: v7 (copy), v3 (ref)
            local l_Type_0 = v8.Type;
            if ({
                FriendshipRequested = true, 
                FriendshipDeclined = true, 
                FriendshipCreated = true
            })[l_Type_0] and not v7.props.friendRequestCountStatus ~= v3.RoduxNetworking.Enum.NetworkStatus.Fetching then
                v7.props.dispatchFetchFriendRequestsCount(v7.props.localUserId);
                v7.props.updateNewFriendRequestsCount(v7.props.localUserId);
            end;
        end)
    };
end;
v6.render = function(_) --[[ Line: 39 ]] --[[ Name: render ]]
    return nil;
end;
v6.willUnmount = function(v11) --[[ Line: 43 ]] --[[ Name: willUnmount ]]
    for _, v13 in pairs(v11.tokens) do
        v13:disconnect();
    end;
end;
return v2.connect(function(v14) --[[ Line: 49 ]]
    -- upvalues: v3 (copy)
    return {
        localUserId = v14.LocalUserId, 
        friendRequestCountStatus = v3.FriendsNetworking.GetFriendRequestsCount.getStatus(v14)
    };
end, function(v15, _) --[[ Line: 54 ]]
    -- upvalues: v3 (copy)
    return {
        dispatchFetchFriendRequestsCount = function(v17) --[[ Line: 56 ]] --[[ Name: dispatchFetchFriendRequestsCount ]]
            -- upvalues: v15 (copy), v3 (ref)
            return v15(v3.FriendsNetworking.GetFriendRequestsCount.API(v17));
        end, 
        updateNewFriendRequestsCount = function(v18) --[[ Line: 59 ]] --[[ Name: updateNewFriendRequestsCount ]]
            -- upvalues: v15 (copy), v3 (ref)
            return v15(v3.FriendsNetworking.GetNewFriendRequestsCount.API(v18));
        end
    };
end)(v6);